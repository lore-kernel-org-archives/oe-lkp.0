Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A0322A3F
	for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123902; cv=fail; b=epFurKg9ojaMaMjwd5ZO6ZzqQ2IYADDJPbQon4Tq6JPwNF07zDNLlP7TvLrcaIuaWiiroZYnrY3Qsmysbp9d5YkmjmHir7t0QnW2J+A7BjzQ+/N1yPvGOCNPv2UIMnmO9lCZuTGdk+Ip+n5ZCVCa+83iWsq0ik9BL1zGHcANHVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123902; c=relaxed/simple;
	bh=XqIaHlIJVMRuTK0MlDfdbn6gS+0IMn0EszK/JI0/RAw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Za2bsYVU7pbXPJWFZ84OejDEit3z5ekRXN+ubckFX71y7k1GlYXlqr7jcG0r9u/Y4+fMwKyZy3AzGR1cIPdCEDbYRyYDQLOw5NoOQtkX8UiPgrMZtMNQz4kd18JgyAs9LYTtXJhKVQ8UMPEoWmfjaZhpG1l9//gvfl3VoRJPd5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KB9wriMN; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KB9wriMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773123900; x=1804659900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqIaHlIJVMRuTK0MlDfdbn6gS+0IMn0EszK/JI0/RAw=;
  b=KB9wriMNR04WiNx2dNk8566Ey+2gEwYvDQIzxMe2zsHiVCyqHW4RLNnP
   N2JFIQcZGp2rZca9PqMlm4t73BBK2wwd9y7zzXjF43zyaCmyUNlEizYBS
   Hd8L6VRmSgegKAN1WnFO2aoLaTWPZzgUwo8SU1wllnURsrL1K1S/MhB9H
   VdA1WyX37QjK+SBYE2znr7dkx8ZzxX81PKIdVQ3ZHfdfdYojcIRdgnu/6
   ehyYlW2me1g8EC83sr+wOMslyU5l+L2iUssglFntlb8xRlcfJ5mKPqzM2
   oaE+yvvNPlWdqNZ24AwXi5MRQ6Xcbifoah9ceG9Wua6dKpzykOr+KwObX
   g==;
X-CSE-ConnectionGUID: 2+MGdW3cRnm47VvXebyMGQ==
X-CSE-MsgGUID: kD5HNVJxTGaCvWYEu3Cftw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74277056"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74277056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:24:59 -0700
X-CSE-ConnectionGUID: 2Yjlix/JSEaUOs9pFmLplw==
X-CSE-MsgGUID: jmroNMNuQb+jSYqhdWJOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="257918028"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:25:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:24:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 23:24:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZYiNrQ5BvyBkSi/X42SVEyc3Mpnf9nyzYT1Q5LNnmHJ220pINneNc3tuNjlvzeeHBdyDbw2T9i3Uc962vw1zTt+dgS4LMJYCwi3u7H6t3ormdKkZrp5ikwgmurBQfE0FYZFcJA972cGvFNJheq+AeoUlpCox8nh46rta/ksggPR24ajILWyWf2m3AEIA5bw5ygfPmN1jTlZqzmhFk4zTixSG10Vi03zu+2YpYXH4lm3McBV/QNxWHILZtuMVfi6j3ZR9IlhBZV6qDKrwtbPBYF6H/K6Bh00eqgo+NcOx67WyTltTuIgAWbnYQ10Tcjue6c4q3P0aTNfmBAqMx15SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mlQPxm9ChfEhPOpB+Dkql5VwHtvQ8nAQvA9wnR4LHc=;
 b=ZQvfy2EkDKQqIS7qXtTPyBmYc7yCRhpKtZRE2PfTkL5AqKYtG1ZsWwYSNzVchewCX0jFGmrCiz7PfSlXWwZ5sbjLLHSMU5vkZ8E18BCArt/HQRXMCODYkzPnT1Pimub8EWrVOtTo0wmrdimRT5y3Q3YComu2zvBpVBCnz0m8SPsWS0cn6mOZ70xOo+8jlXHXBz7qHkpVJqbcdgrDERaXrkIUgTaxX/Pp6EbpW5SYocZ4u8avfsnNU5rLEwhChuuuYrOCDs5N/zX40TWfQw7Pz0UsWfksqYTa7oGR4pxRAVphOBmZ3+7rA3VVoz9tmLyJRyZx4Tmm4zZz6qpKc97TRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25)
 by IA3PR11MB8985.namprd11.prod.outlook.com (2603:10b6:208:575::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 06:24:56 +0000
Received: from BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1]) by BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 06:24:56 +0000
Date: Tue, 10 Mar 2026 14:24:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:free-late/v0.3] [memblock]  9ba8a144ce:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202603101424.47c2dbe7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0059.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::20) To BN6PR11MB4033.namprd11.prod.outlook.com
 (2603:10b6:405:78::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:EE_|IA3PR11MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b32998-3f9b-484b-59f6-08de7e6dbfc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: wKPX07iO5KdfLPs7bTlx2AZj26TMOOBbXiv8VTNJ1cQGREhPqGtRSGyo3DafEENtrivxFyAEuuskT/+pNYV7+ue2mpktGY+Und86gKEL7n+UYcadsRN+fDocBz6QZPr+bgdutNUXT5Zw3t3Ec6R2AGDMWnVM3POmO5k2ZH93JQ1OKVwqFpblWZWB7t1eBe/jIwvE5KhSGXMVCd6CY7GtyP/tZEgq1sl+iE7c0V6NkSWSIfiIsc8ZxLjeXalUUTvsu1yecoTvx+ja8as4twuhDq/qfBwVCt2wFLDxq6GYRVPprD1hsaem+HuWdqQFvPsXPybseXYhYku9n6NkxKVBpj0FWlfRzvkkISWLQBs2nlwkZyruVp4hm3RbA+Z113H7a4SPa6UJ6eAFLV23CaWJhKp3eIfRxsHDTddm0mGkwg8QRRFaND/yPCcfpcdp8VEh3+8xxmXA3XJYWjhltNKDO8nbmNaFYqUHbAm52xU0FOM5QCnXGOZhecTByRFVr3cO0RrMFjzRW+nbb3rCM3lY8THCVby4SJ8EOSC0zwjtR6moUmDPe1wf4CWIT9uV7u0SF3/PBylJeMZG6t3VWgkFV0f1VEMvBhY2/UZ5El4aC9V53pnP3sz/GhPtVjlhA8IIgBEhQw8afZIs48W2MpOF6Ch3Gj2jFgJxjOowz29hWjZpGmRy3uY4e70vgQ9iK4sU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1wvHU/LmrHV5vz689zv7uZvtRTqGZNjoGLx+h2o3dWrv3VFsX4elTrP17FUI?=
 =?us-ascii?Q?caeYbFWTSuya305+wKGtuxRWVPRikP6GY9b2I5FjnoNDB9pDRBOliHGG4Fuv?=
 =?us-ascii?Q?1og+LpgvImp/BNeUIEFxeKjnB0wuhcdlcv9Mwqx0H2ogVGuD4kv/qU35hpuW?=
 =?us-ascii?Q?KzN53m01P5m2l8qoCts+0fK3geUgckbnNRA3GM2O2I71Xb0vEI7psvzQudOf?=
 =?us-ascii?Q?YHRAOofOh65LJyUdSA2fOBGjJQQMvYJl49HYWv/ejeiN8/Pn8fWYv61amkjC?=
 =?us-ascii?Q?DVdoOvshNICJtH9SXrVFR81a6DfqFZfJL5IrCXeCP95KZhjPqXSMgkmCqWv4?=
 =?us-ascii?Q?wWZ+kGtJzO3gZZYWBcpulpNfaGV9F96vYrLHD6k+MYjWsPP+IjVBxFkRo/s2?=
 =?us-ascii?Q?SxPWmemZ1iseG9Nzk39tWHjNlaTCwg7uKa+OCafoswfrPICZhHa4DNzL4TEi?=
 =?us-ascii?Q?vgC19VJHkJkEThVl4bg6Uhzif/BLB3GeGTcJlNTBujpvBaE1LK17h8tGcBaG?=
 =?us-ascii?Q?aZ4c3ISFW9vHkRxl/AyJooyI7a+OWAR1DyD1QXd8/AHhjJsA+vv/0eqlPELU?=
 =?us-ascii?Q?2e37wrroEjUBM5o2jCDlw9L1Dv/0SCj2qScvI6WyGPm/qwDzw/Zr58sCGvOK?=
 =?us-ascii?Q?FKiQ33ExmtVYJDG0UR8KPe6K8JL7a5/W8U53Tp60iLz6XoEchEzeEi9WS3f8?=
 =?us-ascii?Q?4EV5PCQ+BtI6HMVXphvpo0g+u6fC9S7frcjjHs+3ThBDQN38dcZu0pd48fXH?=
 =?us-ascii?Q?Du0WHwCmjXDmeR6YnmU1dhjOVjQ0ve2pflH83jMNIFnqg0EemzIohkMu9jJL?=
 =?us-ascii?Q?tycSyvbaRLgp/9ajjABJMVWtgV8naJifr3/G7Z0THu1WJmBLjtIkKczEGEZq?=
 =?us-ascii?Q?Szx2hfdw5QEUAtfhL7U2exUQwH+GUwDJyMSTmKO82S3Lz9wJ1FV3Xu/daqIX?=
 =?us-ascii?Q?lFkAQ/MArjCQeFi2cdSlILA84R6gM2SbKCzLpFug3cUhT/VlKGUnCPB0vCFp?=
 =?us-ascii?Q?5NKoq0eOhMi2kW8NV/wvgXJ9Y2pLvcGtQfpIhhtYosJqnTaMvpZ9csXejMC9?=
 =?us-ascii?Q?hedO779fME+mtRJL1X5tVIKQq4mP8ohkDujlsx8GwDy1uTZZlomdHewkT4Fg?=
 =?us-ascii?Q?Swg545h2G/+Wl3eEwHV20M3XrjY12CAIsf77iQce/snFqvHynnJBmlj6vIso?=
 =?us-ascii?Q?TS+kYMBjjcqkxyrgUygCz/fiw3mmsEHXKr8s8lZ4sb8ZtldnQmG6LZcJk8m6?=
 =?us-ascii?Q?6569K8VQmDBhhh4SM5zbh5MCoMsA+k5pr1WpYvwb9oa7otEYIQZVPPtuIzs0?=
 =?us-ascii?Q?FcnTangX6zw2DM4zVbU5R8m8iwBsOIR/noMA4YtcngR6+q/5NK8LZ3DA2wNa?=
 =?us-ascii?Q?nkpJyk+uiEGb9HMQcKoKMqIaDrvrN8GpXf53IRd02jtHsj8zIpj+NI4DtUix?=
 =?us-ascii?Q?G+PwFHYpC6ErHDUq4vN/LMScQEa1XpW7W6B54WkCHagt4lTsoYljmD2pvlKB?=
 =?us-ascii?Q?al/JPYPzuh83iSlQDi7u1k9P1/3rmQZzwpbRUHJHaoX7VOs79f+8Z4Y+K5mM?=
 =?us-ascii?Q?XhG9WJIY6m4HIf2/qLopxLqgqP+fzUHQPhcqB4Z7tVXCT+0LGopwws82c+rO?=
 =?us-ascii?Q?O7b0hSEcIXcm+zpZO8zOZtp9tdz7FZTRZLIrerAJ+YSrJ41Zk5oW48v+APiU?=
 =?us-ascii?Q?NE4FZwc8iewlKcpdOGtyFyjqEaLNaKss5pV7aeLaOYDhaHb9ZQZK9qbAtK62?=
 =?us-ascii?Q?v61aIxkGnA=3D=3D?=
X-Exchange-RoutingPolicyChecked: iXu4C5TTeSiiI08W+2i7IHhaTimP31Xy3IVC0AP0vRZhLI5uu0hyIsQALz1cjolb+jSCC6iWxNACMZMvKwzVk5+Zafa3yLM88JoOLHntgKSYX9MLod972movu4waKO36beHBoKCEGPqrqJ6BVNjSlG84ahsE+7GoQxJWAnT3fAPqsjtTcdIwDl6PNo0Cr/S2sf4oDOl3ywpcm/eSisFPrxZAkOfCTOy81n/Vz+pJSX8j72T/3u8+ZiOcpqC/7we0Z//edzmADGTuHLbisaPTCmVn0ZHv8+2mN9joXPXCvzUHe2PnoVZwR7qdvE/SnitVzWb/L/QlfhcywNLypjXonQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b32998-3f9b-484b-59f6-08de7e6dbfc8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:24:56.8552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6YYBdUlGbOjVSpu5lxRxX5wAhZ1+C7SnxDHOmf+JylVjGkTg0tmp+llzc8IgucXv3eCvO8MLaaKCcay4fuSyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8985
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: 9ba8a144ce025146410dbf26bae89396154815c0 ("memblock: make free_reserved_area() more robust")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git free-late/v0.3

in testcase: boot

config: i386-randconfig-014-20260309
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603101424.47c2dbe7-lkp@intel.com



[    6.514860][   T26] ------------[ cut here ]------------
[    6.517404][   T26] kernel BUG at arch/x86/mm/physaddr.c:70!
[    6.518760][   T26] Oops: invalid opcode: 0000 [#1] SMP
[    6.520109][   T26] CPU: 1 UID: 0 PID: 26 Comm: kworker/u10:0 Not tainted 7.0.0-rc1-00004-g9ba8a144ce02 #1 PREEMPTLAZY
[    6.522037][   T26] Workqueue: async async_run_entry_fn
[    6.522037][   T26] EIP: __phys_addr (arch/x86/mm/physaddr.c:70 (discriminator 1))
[    6.522037][   T26] Code: f0 75 27 89 f0 5b 5e 5d c3 0f 0b b8 1c 96 e0 d1 e8 00 fe ee ff e8 6f d9 2b 00 84 c0 74 c8 0f 0b b8 10 96 e0 d1 e8 eb fd ee ff <0f> 0b b8 f8 95 e0 d1 e8 df fd ee ff 0f 0b b8 04 96 e0 d1 e8 d3 fd
All code
========
   0:	f0 75 27             	lock jne 0x2a
   3:	89 f0                	mov    %esi,%eax
   5:	5b                   	pop    %rbx
   6:	5e                   	pop    %rsi
   7:	5d                   	pop    %rbp
   8:	c3                   	ret
   9:	0f 0b                	ud2
   b:	b8 1c 96 e0 d1       	mov    $0xd1e0961c,%eax
  10:	e8 00 fe ee ff       	call   0xffffffffffeefe15
  15:	e8 6f d9 2b 00       	call   0x2bd989
  1a:	84 c0                	test   %al,%al
  1c:	74 c8                	je     0xffffffffffffffe6
  1e:	0f 0b                	ud2
  20:	b8 10 96 e0 d1       	mov    $0xd1e09610,%eax
  25:	e8 eb fd ee ff       	call   0xffffffffffeefe15
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 f8 95 e0 d1       	mov    $0xd1e095f8,%eax
  31:	e8 df fd ee ff       	call   0xffffffffffeefe15
  36:	0f 0b                	ud2
  38:	b8 04 96 e0 d1       	mov    $0xd1e09604,%eax
  3d:	e8                   	.byte 0xe8
  3e:	d3 fd                	sar    %cl,%ebp

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 f8 95 e0 d1       	mov    $0xd1e095f8,%eax
   7:	e8 df fd ee ff       	call   0xffffffffffeefdeb
   c:	0f 0b                	ud2
   e:	b8 04 96 e0 d1       	mov    $0xd1e09604,%eax
  13:	e8                   	.byte 0xe8
  14:	d3 fd                	sar    %cl,%ebp
[    6.522037][   T26] EAX: 00000000 EBX: f6ffe000 ECX: 00000000 EDX: d2438f6c
[    6.522037][   T26] ESI: 36ffe000 EDI: f6ffe000 EBP: c080fe60 ESP: c080fe58
[    6.522037][   T26] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010287
[    6.522037][   T26] CR0: 80050033 CR2: 00000000 CR3: 12438000 CR4: 00040690
[    6.522037][   T26] Call Trace:
[    6.522037][   T26]  free_reserved_area (mm/memblock.c:909)
[    6.522037][   T26]  ? set_memory_rw (arch/x86/mm/pat/set_memory.c:2321)
[    6.522037][   T26]  free_init_pages (arch/x86/mm/init.c:939)
[    6.522037][   T26]  free_initrd_mem (arch/x86/mm/init.c:996)
[    6.522037][   T26]  do_populate_rootfs (init/initramfs.c:750)
[    6.522037][   T26]  async_run_entry_fn (kernel/async.c:136 (discriminator 1))
[    6.522037][   T26]  ? debug_smp_processor_id (lib/smp_processor_id.c:59)
[    6.522037][   T26]  process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3280)
[    6.522037][   T26]  ? process_one_work (kernel/workqueue.c:3251)
[    6.522037][   T26]  worker_thread (kernel/workqueue.c:3352 (discriminator 2) kernel/workqueue.c:3439 (discriminator 2))
[    6.522037][   T26]  kthread (kernel/kthread.c:467)
[    6.522037][   T26]  ? rescuer_thread (kernel/workqueue.c:3385)
[    6.522037][   T26]  ? kthread_affine_node (kernel/kthread.c:412)
[    6.522037][   T26]  ret_from_fork (arch/x86/kernel/process.c:164)
[    6.522037][   T26]  ? kthread_affine_node (kernel/kthread.c:412)
[    6.522037][   T26]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    6.522037][   T26]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    6.522037][   T26] Modules linked in:
[    6.558024][   T26] ---[ end trace 0000000000000000 ]---
[    6.559399][   T26] EIP: __phys_addr (arch/x86/mm/physaddr.c:70 (discriminator 1))
[    6.560632][   T26] Code: f0 75 27 89 f0 5b 5e 5d c3 0f 0b b8 1c 96 e0 d1 e8 00 fe ee ff e8 6f d9 2b 00 84 c0 74 c8 0f 0b b8 10 96 e0 d1 e8 eb fd ee ff <0f> 0b b8 f8 95 e0 d1 e8 df fd ee ff 0f 0b b8 04 96 e0 d1 e8 d3 fd
All code
========
   0:	f0 75 27             	lock jne 0x2a
   3:	89 f0                	mov    %esi,%eax
   5:	5b                   	pop    %rbx
   6:	5e                   	pop    %rsi
   7:	5d                   	pop    %rbp
   8:	c3                   	ret
   9:	0f 0b                	ud2
   b:	b8 1c 96 e0 d1       	mov    $0xd1e0961c,%eax
  10:	e8 00 fe ee ff       	call   0xffffffffffeefe15
  15:	e8 6f d9 2b 00       	call   0x2bd989
  1a:	84 c0                	test   %al,%al
  1c:	74 c8                	je     0xffffffffffffffe6
  1e:	0f 0b                	ud2
  20:	b8 10 96 e0 d1       	mov    $0xd1e09610,%eax
  25:	e8 eb fd ee ff       	call   0xffffffffffeefe15
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 f8 95 e0 d1       	mov    $0xd1e095f8,%eax
  31:	e8 df fd ee ff       	call   0xffffffffffeefe15
  36:	0f 0b                	ud2
  38:	b8 04 96 e0 d1       	mov    $0xd1e09604,%eax
  3d:	e8                   	.byte 0xe8
  3e:	d3 fd                	sar    %cl,%ebp

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 f8 95 e0 d1       	mov    $0xd1e095f8,%eax
   7:	e8 df fd ee ff       	call   0xffffffffffeefdeb
   c:	0f 0b                	ud2
   e:	b8 04 96 e0 d1       	mov    $0xd1e09604,%eax
  13:	e8                   	.byte 0xe8
  14:	d3 fd                	sar    %cl,%ebp


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260310/202603101424.47c2dbe7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

