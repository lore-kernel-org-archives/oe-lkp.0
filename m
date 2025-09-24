Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F727E058
	for <oe-lkp@lists.linux.dev>; Wed, 24 Sep 2025 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699221; cv=fail; b=M9uaGvO6xnBy59AJsVPVKsPYs1D9T2cHRhWoNM5V0mhJzhbq3QHsfwJBwPObXB5nxAuYEbyCoKPk4fms2tcsE5ageHvM6WsduO4hP9T//IZ4IWq3FxgStbR2Q4WbG1kK1lUQbXz37d1AhMRxxMuazHJpRKGo1KbHN0ftxu3DEVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699221; c=relaxed/simple;
	bh=EUMcb+MBcCZ+P1vcNj6g4LGWt0OwPmc7Rr4vEKDpIzE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=msC8euXGSuo/CEOdD2PP3gaq4PBhVg73y02sWkT2vRRZ1OYv364pUICDRYsTjjnvZ1iv6tomKvtyZMwc6txWGJOLmaplX6CMzbPlbD+ugBPXuWUhson/vkYwhe3xQFvolv9NDpAvqjKOuxK05v3tjkFvMvetdpAwHA1pqlfkpbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiUFuwWM; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiUFuwWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758699219; x=1790235219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EUMcb+MBcCZ+P1vcNj6g4LGWt0OwPmc7Rr4vEKDpIzE=;
  b=RiUFuwWMbWiGr4h04dMZ2Qkjwz+oKDiAUVBfvMYEXoXga50SpyFq0khw
   TdDOIKLh2LjjHUACf9VBWldqIz9xyOVfEL7PCBuMeRmLoh5Tjp5o+I7Dv
   pCbxvqxNcGz2NnQKbtaVlSHpDCaCtBiN4IId5wxElRDwGP0bkN1tbAp4F
   J/RtEFVbREmAivsEteCDgs9prb5KoVsiY0W/LPfyN9WAkjjOAyOO2cR0l
   leOnOQGPh/pt05UOOmP5y8dipCy7BZrIpC+Na0mFti7wRzHSeu8X9cbux
   0tP9BJ42iCBjJygF4MQZjJINyKFTSzk09w/dU9vmnigYbIWPcYAgubeVa
   w==;
X-CSE-ConnectionGUID: MeCoITa6SAm011/G0ZSudA==
X-CSE-MsgGUID: z+Ouzyp4QNC2jwMqVlR2Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71611148"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="71611148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:33:38 -0700
X-CSE-ConnectionGUID: LZz30BRmSViRL2PHHlVGdA==
X-CSE-MsgGUID: 35omEzbnRhaTQUCAyDWeiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176549321"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:33:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 00:33:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 00:33:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 00:33:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ort1q8z7ZLoiB6uoLqqmNpuHaIQ6kllNYWMAtcE+60dgZfPg8ndScjahKEdIeCx045clTOIB5lqkNGHNyoeQjJv4MJaz1o0Fr3tv7ewq3aO/yCcpWSikqC6lJLTg8e2pWu6aQ23Tq8nXin1tHMMTQCOuxgheZ/SkShfpd3At2soU9nrl3ZaZLbmXrSvVf5UDfkMKpFBRcoruCZIs/SWLqbKYgX9LlEz5xnOS9MDH0vQWC4RoKi4jgxjIk0PzZRvqrK+StKBgXat/sJGbNJ0RjSchixPYvq8xnywxjraaUkua+ez+1Eiw2Y7oovwHfyVzxQweElYIEcCidqm8IWwvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVG8wCr62srixxvXuiQMZ6WwLTUo6Rf7hMwSZgszZDw=;
 b=Q7JR+/iZCpnDkvCTkZdOV/JdgZNlNbcvqd6u3+eOE1XlD/dKYz2xuhIwY53GuKvcruQDBUiBBGUDaEzF6ViBRbIXY0gHQ3uTulDN9fJxwjWfFx411q88pteO6eN1QkrdM002SJ61sgEg1zQtGkcQ6F0uUCP6crEDoIimB/6DeWAoW6IOoALqurlWiuO3ZDQ+rUa6vHg2gc0kuLA52ZCuloIkxqTMtN4oAQMF2yaN0mnpjGM6bi0zDmWdsMswPSBp44faX4K4vK03jmYRhaRYdeMebvb+y+DGJHb8nVupChUREfSbjnltuA+/vrN+f2mNewmwe9YeW88pWKYpkXR6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:33:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:33:34 +0000
Date: Wed, 24 Sep 2025 15:33:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:namespace-6.18.file_handles] [ipc]  c8e087bf68:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202509231700.dff6cd4d-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 012467e9-fe4b-478d-c74a-08ddfb3caa25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wDYFKFhvuKplDa72GuNTmcutCQ8cfUqqazpq99BLnGG/hpz3L9o9J9m1lFU9?=
 =?us-ascii?Q?iApoylCTOUUfdSuaNuqkRqjfII2hSqwbJc57Clm8UkKntW6e0Eo3FEcMgrm3?=
 =?us-ascii?Q?FSARiaC/68B9APKfoRLakWTbSB302HHPk6GCn9Sw4qnP8EOM5w6lA2StJ0Na?=
 =?us-ascii?Q?Db3wNTcIX4xTSZ6e1eGLIoD7oUJ9isctI2VlAysVWDanKRVd57R/8fD/Yo1O?=
 =?us-ascii?Q?xOVpKrRLrEGhznku06ghQmOBWHNjiOOMl6vq9oTgDlQkCIfiyOVo0Tlotbws?=
 =?us-ascii?Q?/jDntjl8Ripkq4m/aIpHVQnBEyaqbCADPM6ZqhLgBRfad7K5dMz+1oY1s2GW?=
 =?us-ascii?Q?UmbHgZUc95o74gGbpeAD6cTJm+toQUUE1tZfSRnLP8R/SpcL/R0AaBx8aVmR?=
 =?us-ascii?Q?HL7nb+qzVktB1Okd5WoKvSkfvdQGfkdyGxyPn0jiyjJZzz0AIAt37ij/nBdD?=
 =?us-ascii?Q?6A61EUQ3HrF3GT+MDZNG+R3kzKTHSM39oI0cGu6JlxyIkjnhOK5LXmmVG/ZN?=
 =?us-ascii?Q?DDrgibum0R/IDYNog6iPUKYRg657vKcw+pC76hnmkhq4RPHQS5NJ603flHYK?=
 =?us-ascii?Q?D72yZLcL06pSkamK+GBkzxmfHjp5icDIJGMa28j17TcKPQh1CQE8tgMUvhvD?=
 =?us-ascii?Q?Wx1AIxHR3m+0/5savyAujvGY07OMRc8wL6/vpWtcXvuenFL9TOshrdaxRihe?=
 =?us-ascii?Q?/rRiI7yRaYPPE0TzPs7sA8BFvb7GUp504rWX98hhchdTfNRkp6aBzajEdzTK?=
 =?us-ascii?Q?46upPAvJUiS8NqbPp5M4ClP44jhr9u9z98iS9Lhi/mtTZLr0n3BhVu8ZKQCs?=
 =?us-ascii?Q?399dnQ48Z2NO5tH8J1oWytvP4XpHe71Eu7arANqif1iQ4Hu+AyHhWHLvVVni?=
 =?us-ascii?Q?Uc/4DiJMNJlsM/NLsSi+ZW4aBI+N64CkyQPllF6STOfXgWg3SeLF42+OHwbO?=
 =?us-ascii?Q?6pmW+zL2n3ts2/S7gsPyTqMVUuJmyGFxNvCEaVJ5imJIbIgMY/igWTIGRINr?=
 =?us-ascii?Q?F+ZeFpWlTuaOSymhxt/Tm7zesenDbdX38bRFfFGRzk0fhF4jmrBJLwPCM3XI?=
 =?us-ascii?Q?vgUBUKcMQ0/TLsNpgkSlUgIpzGQs+OkAhd3fNcTvkK3OsSXoCFtgTKLkzGay?=
 =?us-ascii?Q?mgDzr6BWH1GH2WVCEYCgSEYOo4FBD3TOEYcnIegDrpNrkisYQ7dzRy3kNgFh?=
 =?us-ascii?Q?A4rVu+EAu0d4ItbpoVqE13i8wLBnBl46LqemlNZow7z176D/nnzsNxAcNmZ2?=
 =?us-ascii?Q?Inzro6zCqSdaAuDEbGLJ1whrY6737jUJ4XZuz2JIrYbzGVCSJ1ozg0j31gtV?=
 =?us-ascii?Q?2MdHihwr96c9cxoEzEXzSCqig+QzjcCmVLKlH+hvaLDmH8UWJV34/fqEJvL7?=
 =?us-ascii?Q?a8p8DfawUm9RNnAP1hcpmFur/WcS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DB/W5v7rvz5tIJlLIFEwRZD9GMbY3OWT3sAL+ure3LWXz72JX6rhH95LL7mI?=
 =?us-ascii?Q?Z41cWyodI7usCzENakBEEdRDaMBnvjG6Zzk2YyxGa/BmbN4wYVPyG+8x1MaS?=
 =?us-ascii?Q?i7I4/6zasGXs7j1RhqZeoxNNhFMzqazQybG2xwG8EsoOhc9s+lVPu/U1HYdG?=
 =?us-ascii?Q?j92JIeA5zP9ooUNBTuyGKb+QP4cJkrsIBKzVywjwpv75jTiY7RdVPkCffYqZ?=
 =?us-ascii?Q?Go9i1TzZS6k319UH+eUaUyMRa+wKsbI9zh4VoX8Tbm3a3MEiJs1E8CaE3BCO?=
 =?us-ascii?Q?mHfDfK8rhqpgziMkkjKuCptIDD2N/QapazoocFf9nwfmI5kK4LdR1IvCY4EB?=
 =?us-ascii?Q?cKHdalPgFBBAS0eantBZkbKuzb7PGq3Qvkx71/FLQ4JNpVicbe7U1QHUTz2H?=
 =?us-ascii?Q?2Yi6fQA6CEGIRVuYLhvCgDvqwZNEredFM8duvB+miXs7GmRBKRMB42YDMErm?=
 =?us-ascii?Q?YMPUvA0zCsGbfdREPWLC7ii1Ut1XYKKCjlA0q6fy0fTaxzbbo/ncgL7v33oR?=
 =?us-ascii?Q?XhDMVhrVHsA3uuhhhOzoD4k5HewdWXG9QL7AbgASj6o+oenU4c2emtkMBGz0?=
 =?us-ascii?Q?jRjuLFJlj4Ecy6bO2q+jCmfvMvFAI6PpebqdQH10DxftOOw1/y1BgCNchIvx?=
 =?us-ascii?Q?eweBfWcMmoswqF9dwIN+CIlClE3qZpNK7jnlz8/mE2hD628LtyPfWj982crN?=
 =?us-ascii?Q?96Fjft00pN/gNNXsLE5sxdIrf9MqjOgz6Dj8J8Y0eciRGVx+6/U0ofUowLYc?=
 =?us-ascii?Q?K0aGbyX5btlAjkjLby6A3WepBJ+PegffriJVQ3JNhn3z1wD3aBdzhmlCJJTC?=
 =?us-ascii?Q?Sq2mRhQNY3SmS9fprQ/9SEZuXpTpcfTMpxq4LT2F/glg8LIEAG1zdlniSmKM?=
 =?us-ascii?Q?Xk5uI8f4bQdSIeWsLfb9nneMp7bzhJt6Z4thRQSIhygEpxmpNo91jVdLyzXT?=
 =?us-ascii?Q?f6jasXFYkmN1PVBS1n7DqBq4O2360Ucll0d+k65oKC3AmyPpCx1r57lYTHhk?=
 =?us-ascii?Q?KwG8Emk3iUnMHKGvLI3VPYhpqojQWmkrVF/q5ou4adgBYYnWJDonE79+5no1?=
 =?us-ascii?Q?yyqnrz+DBsHnYnXKgoYJXyagnpPvO0dFG+IIf3uWlEtblY26zsZ9kemsLwHz?=
 =?us-ascii?Q?fi4NGRzAgB9kcP0q6zuuWirxv9+aY9LojrRfXWX1RkoL+nJ7hA9cmI8BjKXk?=
 =?us-ascii?Q?I4qDFweLLxsllbYMxT3RIKH14Y4/NcDozhqa+QA4NZMNxNSq+4MiTZW93eOk?=
 =?us-ascii?Q?L+J6u52rR/KQjrc3PZsHkSz2By6/5bNdFWfrm8/2bVVYGdrDRRQLZIy2LTbK?=
 =?us-ascii?Q?C2KWuKuEQOAbbbRC2ZhTu2N201VJK/ZZxaZFg8lKFCbfCOrteSRX2EHbbwHL?=
 =?us-ascii?Q?xUdGsg7HVnC1LdwSAiidE2Sm+B6M1fgvRUcD4Z0XTaEmpMN5pHmgiY+wV15S?=
 =?us-ascii?Q?SFDHx1p4pT26zw4qz6ZJZJEra2adTw/SmdxGCi6/kEYw8O8OmwKxtwIkV8Eg?=
 =?us-ascii?Q?YwsphGHPFQ0div6X3qEdtm+JIT4I7hhOyEEg/lJBcyAv42ziXHoWTzI4hwbx?=
 =?us-ascii?Q?yHnTwIJQbgaIspYPX8fLOAOWFQ1aAOrZHyEpKg8ezrU8D6mUUUJEi/GUth1Z?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 012467e9-fe4b-478d-c74a-08ddfb3caa25
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 07:33:33.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5w7r/rpAglfmlKvjGba++zA3KpaxweXS61e5b63Y+5Hd/JZbsvJTEMQrs8DvPg9qpj1zDM/S7SxUnmwcA4AtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: c8e087bf689c357017d4fbded9123dcf07ce14ba ("ipc: support ns lookup")
https://github.com/brauner/linux.git namespace-6.18.file_handles

in testcase: boot

config: x86_64-randconfig-072-20250919
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509231700.dff6cd4d-lkp@intel.com


[    2.190097][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000028
[    2.190097][    T1] #PF: supervisor read access in kernel mode
[    2.190097][    T1] #PF: error_code(0x0000) - not-present page
[    2.190097][    T1] PGD 0 P4D 0
[    2.190097][    T1] Oops: Oops: 0000 [#1] SMP
[    2.190097][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.17.0-rc4-00022-gc8e087bf689c #1 VOLUNTARY  c1f65eaef97961d661159ea096bfaf3ec3497462
[    2.190097][    T1] Tainted: [T]=RANDSTRUCT
[ 2.190097][ T1] RIP: 0010:__ns_tree_add_raw (kernel/nstree.c:95) 
[ 2.190097][ T1] Code: 48 89 7c 24 10 31 f6 31 d2 31 c9 41 b8 01 00 00 00 45 31 c9 48 89 44 24 08 50 e8 d0 bb 04 00 48 83 c4 08 ff 43 18 49 8b 47 08 <8b> 68 28 44 8b b3 90 00 00 00 89 ef 44 89 f6 e8 f1 5d 13 00 44 39
All code
========
   0:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   5:	31 f6                	xor    %esi,%esi
   7:	31 d2                	xor    %edx,%edx
   9:	31 c9                	xor    %ecx,%ecx
   b:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  11:	45 31 c9             	xor    %r9d,%r9d
  14:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  19:	50                   	push   %rax
  1a:	e8 d0 bb 04 00       	call   0x4bbef
  1f:	48 83 c4 08          	add    $0x8,%rsp
  23:	ff 43 18             	incl   0x18(%rbx)
  26:	49 8b 47 08          	mov    0x8(%r15),%rax
  2a:*	8b 68 28             	mov    0x28(%rax),%ebp		<-- trapping instruction
  2d:	44 8b b3 90 00 00 00 	mov    0x90(%rbx),%r14d
  34:	89 ef                	mov    %ebp,%edi
  36:	44 89 f6             	mov    %r14d,%esi
  39:	e8 f1 5d 13 00       	call   0x135e2f
  3e:	44                   	rex.R
  3f:	39                   	.byte 0x39

Code starting with the faulting instruction
===========================================
   0:	8b 68 28             	mov    0x28(%rax),%ebp
   3:	44 8b b3 90 00 00 00 	mov    0x90(%rbx),%r14d
   a:	89 ef                	mov    %ebp,%edi
   c:	44 89 f6             	mov    %r14d,%esi
   f:	e8 f1 5d 13 00       	call   0x135e05
  14:	44                   	rex.R
  15:	39                   	.byte 0x39
[    2.190097][    T1] RSP: 0000:ffffc90000013b00 EFLAGS: 00010202
[    2.190097][    T1] RAX: 0000000000000000 RBX: ffffffff83c43ae0 RCX: ffffffff85362b01
[    2.190097][    T1] RDX: ffffffff84f75101 RSI: ffffffff85762e18 RDI: ffffffff85762e18
[    2.190097][    T1] RBP: ffffc90000013e48 R08: 0000000000000008 R09: ffffffff85362bf0
[    2.190097][    T1] R10: 000000005fbdd200 R11: 00000000c67180d1 R12: 0000000000000002
[    2.190097][    T1] R13: 0000000000000246 R14: 0000000000001002 R15: ffffffff841094e0
[    2.190097][    T1] FS:  0000000000000000(0000) GS:ffff8884aaed7000(0000) knlGS:0000000000000000
[    2.190097][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.190097][    T1] CR2: 0000000000000028 CR3: 0000000003c24000 CR4: 00000000000406f0
[    2.190097][    T1] Call Trace:
[    2.190097][    T1]  <TASK>
[ 2.190097][ T1] ? ipc_ns_init (ipc/shm.c:153) 
[ 2.190097][ T1] ? __cfi_ipc_ns_init (ipc/shm.c:150) 
[ 2.190097][ T1] ipc_ns_init (ipc/shm.c:153) 
[ 2.190097][ T1] do_one_initcall (init/main.c:1269) 
[ 2.190097][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4674) 
[ 2.190097][ T1] ? next_arg (lib/cmdline.c:273) 
[ 2.190097][ T1] ? parameq (kernel/params.c:91) 
[ 2.190097][ T1] ? __sanitizer_cov_trace_switch (kernel/kcov.c:350) 
[ 2.190097][ T1] ? parse_args (kernel/params.c:?) 
[ 2.190097][ T1] do_initcall_level (init/main.c:1330) 
[ 2.190097][ T1] do_initcalls (init/main.c:1344) 
[ 2.190097][ T1] ? kernel_init (init/main.c:1471) 
[ 2.190097][ T1] kernel_init_freeable (init/main.c:1581) 
[ 2.190097][ T1] ? __cfi_kernel_init (init/main.c:1461) 
[ 2.190097][ T1] kernel_init (init/main.c:1471) 
[ 2.190097][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 2.190097][ T1] ? __cfi_kernel_init (init/main.c:1461) 
[ 2.190097][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[    2.190097][    T1]  </TASK>
[    2.190097][    T1] Modules linked in:
[    2.190097][    T1] CR2: 0000000000000028
[    2.190097][    T1] ---[ end trace 0000000000000000 ]---
[ 2.190097][ T1] RIP: 0010:__ns_tree_add_raw (kernel/nstree.c:95) 
[ 2.190097][ T1] Code: 48 89 7c 24 10 31 f6 31 d2 31 c9 41 b8 01 00 00 00 45 31 c9 48 89 44 24 08 50 e8 d0 bb 04 00 48 83 c4 08 ff 43 18 49 8b 47 08 <8b> 68 28 44 8b b3 90 00 00 00 89 ef 44 89 f6 e8 f1 5d 13 00 44 39
All code
========
   0:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   5:	31 f6                	xor    %esi,%esi
   7:	31 d2                	xor    %edx,%edx
   9:	31 c9                	xor    %ecx,%ecx
   b:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  11:	45 31 c9             	xor    %r9d,%r9d
  14:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  19:	50                   	push   %rax
  1a:	e8 d0 bb 04 00       	call   0x4bbef
  1f:	48 83 c4 08          	add    $0x8,%rsp
  23:	ff 43 18             	incl   0x18(%rbx)
  26:	49 8b 47 08          	mov    0x8(%r15),%rax
  2a:*	8b 68 28             	mov    0x28(%rax),%ebp		<-- trapping instruction
  2d:	44 8b b3 90 00 00 00 	mov    0x90(%rbx),%r14d
  34:	89 ef                	mov    %ebp,%edi
  36:	44 89 f6             	mov    %r14d,%esi
  39:	e8 f1 5d 13 00       	call   0x135e2f
  3e:	44                   	rex.R
  3f:	39                   	.byte 0x39

Code starting with the faulting instruction
===========================================
   0:	8b 68 28             	mov    0x28(%rax),%ebp
   3:	44 8b b3 90 00 00 00 	mov    0x90(%rbx),%r14d
   a:	89 ef                	mov    %ebp,%edi
   c:	44 89 f6             	mov    %r14d,%esi
   f:	e8 f1 5d 13 00       	call   0x135e05
  14:	44                   	rex.R
  15:	39                   	.byte 0x39


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250923/202509231700.dff6cd4d-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

