Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6D2AD0C
	for <oe-lkp@lists.linux.dev>; Fri, 16 May 2025 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359878; cv=fail; b=afT8c5R9y9caVBaXLYiu38/AHibMJhHRgMNEcJgAdfMXfxFHd1WgD63cG0pvLg83A6IgMySaX95lE8/wUMUFWFvTZWLgkOrkUfslOzpfgSrQXSKMZgaNzy/SLlEfTdkVykB42UR2BQBkh2Th7XpTsGT/pQ3QG6Yy8rtpnyZ+m9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359878; c=relaxed/simple;
	bh=NsG9hMqWJkLREvR0eA0sJeOVwE+Fsd+PmGVCfsNcwUU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pZAyaIClfLNk/B1ivY51AS6GPaihF70M0zwDKFiSPMcqfKwk52TbedBj1iYucWTOoXy4lxEEFnHnXj7GhLspEUzv7gdIbbU2t57oMtHYZVaHYL9+lh/MR0bUIgHnLXJuj3s88uZ/81FuHXYa0njGfWRIPdoCZIsuLZZjGmKYLaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3tF3Dog; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3tF3Dog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747359877; x=1778895877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsG9hMqWJkLREvR0eA0sJeOVwE+Fsd+PmGVCfsNcwUU=;
  b=Z3tF3DogXiMjqMNLB67Qz985x+BT+q7iUJ7XIlxAGpPLilVDx4tJH78a
   9ClFCNmAobOwFQDOW6Hf1XZQCvtZt8ST43T5Aeas684jEm1fZJpiR/pe3
   YJRVqvkx6q5vLGzqabIPfIyYKFZV8JCsOqLxMVoMI8DuXT5iwiQBbaIAm
   h1XfyayLPm1TMo2sTebOHU39rAuPqp3Y2QWJI5d3zePUqkz1E2+9SCOsm
   0dbccJl4MIPRMOYg3MFQodBbge5eBQhqCLvYdlewwcWkST2yIFu2wti9k
   PRkXlKYm/TvWdUKJQaFSROsCOTxNbWjsG921L5lO1Vg/kml2rVVsVtNgI
   Q==;
X-CSE-ConnectionGUID: unw6br9sTFOQOjCkLrTLDg==
X-CSE-MsgGUID: cq675IesTOyutszChFv5wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53136742"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53136742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 18:44:36 -0700
X-CSE-ConnectionGUID: DizQhiouTMGBkzz3z0QOKQ==
X-CSE-MsgGUID: X91f08qpT2m3r0pmIRaJ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="169479351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 18:44:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 18:44:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 18:44:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 18:44:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8O1zTy2BuR1hLkvkIcQ1MiXKCExEr7AeoNmYbPC3/X/Zd+Drmype2Z7DlV0dHwUYGbHgKVeRA3y2dSJUdY1Rn1xOjSURAz1E2To7Sdsr/HGBEDNxdgs/CZhLfPuEN8kEhFyYJcOf+KewsWYD1eWtaajP0s/pzFY+BPkWdPbGKp7T4d3FnTTKBdWU5/viySz/TcFuxwygsWtW6VQs0ncgKEOM0DtMC9EKO6ujYY2EaMRHUNzhTaD2SNE/eJAx/ygB6t52qOH6Y4wp80lxZjWNiVoovrTnrpGuR7H6Rol7tDVVxhBYF/T54Y/5jSL2Tdv64wgvwHuMnUX9yj+UQWTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP80SugXujCX/SCNxqdts/wJm4xsEa9p38HY3aIuTLA=;
 b=h1NGHrdNwiFM0XOL8JbrjpGzcmwONo+a0oweBY1IMCeve8w1f0fEwCvfdLXSKC44pJ0gtJo4o1NyNarUN9NhgdMu4mdR570jQYiD5CFn4pB1B3jQLp4NsPivHE812pcdTtgVDxxoJwInWJKFDF0d5Z2enru319lvTYE3AKGjPENxjsGdFOtePflmZN961D9mdMFYnIrfQas0pnhGjH+eRCipmrSEFNYyrtvZK9s//MSbXVf1JFqw2+k0S6o0OhzZ2RXYUdDtQ4p9J49dysvsjEmjzscC8203ap4eW0wPp1VkuPMJO/gpu+qYy3IVQ6RqeIMV4hpeerFFnr/vLHldjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 01:44:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 01:44:18 +0000
Date: Fri, 16 May 2025 09:44:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>,
	<oliver.sang@intel.com>
Subject: [mingo-tip:WIP.x86/boot] [x86/boot]  e56e18a469:
 BUG:kernel_reboot-without-warning_in_boot_stage
Message-ID: <202505160959.4b6ad85f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:820:d::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f66a1b-6b77-4844-ffc7-08dd941b2c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LMDz7flg2s5HoblFCg2nQAQ5p6TK6xgp9nnDWwfDeTKw/D/H/x3jndqq8i9L?=
 =?us-ascii?Q?B5lhSXD6bSs4mF5yRj9iZnzlNSYaTUiRMnoulYPLeZWu5IXxd7qRJ0bH5udg?=
 =?us-ascii?Q?vXENNB+7mxk1QyUaMQDA8ksj0IPQDHKcrw2lIY/Kf3pZMtgKzcGfNV6SMfoa?=
 =?us-ascii?Q?lXCCuj7eyidYt+POcL65S29cfI/huxN6nvwGHckNKJQyQcLo7gv0vLvmJSGk?=
 =?us-ascii?Q?3V7cSq4BAkHpsxz43U2L/s1HFwD+xrF2c1x3DLewFnNQJGJF9c0ROMA59YLM?=
 =?us-ascii?Q?a4w5PXfPNr4EcDAzf72O6jGGtWYDrHjMwoJOt9fPubThjSxMHxT69rFVQS8g?=
 =?us-ascii?Q?1q+9/N0yXAdqpcOMa3togWmrZHBC3HZtiSsyl2CCFxJUbKKkptmV8OQCl9OU?=
 =?us-ascii?Q?BepTPGFWILO0htjCYtskRJy8OrvjQysC4h8zVfAYasc1njFcZnpFe4puwLne?=
 =?us-ascii?Q?JCboOty4rYtLxfg2JeTbJ8/bNUisvrRbCc9m3oXMcE3QiJ0so1YqQ8Z9XHF/?=
 =?us-ascii?Q?QI1z/ELT5GniPr8rJDp+oeIr/CD2j8g3TXn+RAPa5hGlY7S7X7nZ1eLxLTk1?=
 =?us-ascii?Q?MNaKOrxW069HDUbOEr/RF+0l+KAwCGegL3I3PJXzX6gt4y/lTWsavVT+tbQR?=
 =?us-ascii?Q?hHUzdw2Gajs/LL61X29JjY2xbYnymdJrOodxkIShBXpSDECi8YtUNe1pVxLG?=
 =?us-ascii?Q?njMHukmA3GfMA3Th6KHhrRZ4f6aEOgz/BwfgmzjZYAfqfPtsIBxY5TsGCVDH?=
 =?us-ascii?Q?Kbp6KnrNJ9RdA6JY9lBYDG8PPXzqN4NTz86eMjLi7HDsjEAA0Wpq5iKU1nqX?=
 =?us-ascii?Q?tQqQhaUgfx3EY2Aq0J4KDGOcnEiNuPWTYte1nDVn4kb1s8FvBkNAFo6wLzIE?=
 =?us-ascii?Q?bTZX4VhxSZVKyFTbnKef4lwmiD9/fABBuft1Fw0xKauAadC8QGgy3ZV4VM0C?=
 =?us-ascii?Q?fWur/oU5lgfceoo6QMculTR6i0r/w5BzfR41CZK6bbUAKrxISp3F15PYSEyq?=
 =?us-ascii?Q?KX1VvSz6X3R4vN0YDkLrpN5TwadrhcKiyej8rfjGthu1kp9s3W//L5BVL8Uk?=
 =?us-ascii?Q?FY5QLTjHw24P4Sd8aj6m3cOGlgha5TQmflKUmg+gXtiZVVBg99jnIrw8gMHr?=
 =?us-ascii?Q?gq3BptcdLude2j+2xo8uqqj5RobkuGkr+9ghjWNoghuBkk8UOhK3khIpW/Dz?=
 =?us-ascii?Q?vhmr/ANK8419xMnfaOSi2y8TXGQ0BQVt0C5cWjl400bE4wGXJiVqoXu2CtMI?=
 =?us-ascii?Q?SE5X4Rt4Gr3d1f8/etSGvhSoQRGx8JGjSowvtHFVCjmxOahO+jvUswqVGdwj?=
 =?us-ascii?Q?30ZLUI4yBYmA0kTMmRLOB86uQCWRQy5i6C98TDJsLrNtoY1Bq/vVTpZeRB4l?=
 =?us-ascii?Q?3kuxW8KBwEyzPjKyt8SsNLHcVhKx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pvbB4fuGPsrQt7nPKc8xXzeHJSwvBlxXuAZcFnKRlERA4G4KXdd48Rd7g9kM?=
 =?us-ascii?Q?44fVidkobPR60QtH/3/ukqBok57IXgFYKP21Rh2a+fMtzMywmHMdeVYptQCX?=
 =?us-ascii?Q?sLSf4mfIdZz5h7kobFn1B3M6BTJ+FDQr00gS63oGIXGXG3tNZpp577ZBeh8g?=
 =?us-ascii?Q?IVP/WYSkQZ++vbddIU+pWLoKHSMYqfvvMZbDjnod+ddW/ZWxWRaFJ2AcgXOY?=
 =?us-ascii?Q?2QENnmgDsls7WZBZn2MqHOx+S7E8Nl1YdpgddJFamfG0sp7HHy/6jPjof0VK?=
 =?us-ascii?Q?I/lipIy0yLdBCEBmSVbLGP738gmxjuyPst+WjMHT4ALFLHHJP+sgvpiy5kvr?=
 =?us-ascii?Q?h/iIKKsilgu1yzP4MHcG44//EdPD7WSO7p8Db7jDH5nww/ObtTsSlnCopsWG?=
 =?us-ascii?Q?H4mdRws1uWHy8779QhBddFsdFepOONADQXslhnsmTPgcVZfeTUAxwJXK1Xhd?=
 =?us-ascii?Q?xE5TG6gSnF/rEzfaxEpOSmpUXK1/ZUuNH2bXShjnaPVtEFCq65Q3EeAFoDwB?=
 =?us-ascii?Q?7KcRXk7MtKIuYUo0HPXnGMD1Kt/RDk7foLoxtkuFELpU1Sr+3783Prj3tGQm?=
 =?us-ascii?Q?eN+Uw8NLdp/HYLc8xMo6S14YEoNe32eTMuq99T1JwY3gU899Icy9pDepjYtV?=
 =?us-ascii?Q?PcruSwJNg8tQXBpZ7gVkcA1eT5yAuBO5a3Zl78t2RUW57r4zCPkmqjLLLryu?=
 =?us-ascii?Q?NtOJE5EnV3XOuuTj1u07/C3/UO+cquXlzB35oz0FDf1OoaDsonAsjkRea3JG?=
 =?us-ascii?Q?MeGnlHNv4OTP1dCjEyZBiBL1yiTG2sNCgbvL0dJTSAYkz9PGbm4Pshu/b3hX?=
 =?us-ascii?Q?gDz2IXqxT3FTY8JPlfBeOTPA6cWMRDD6XWW6FOkFKr1wRGsK7eBC5sbZVArp?=
 =?us-ascii?Q?Q8q/HuJLe6whooViLpW4uiLmfNvWXPGqaJZunyDNcvYJnV7mXi7BZBGvwaoC?=
 =?us-ascii?Q?HUYY43WuB041Azu5ryoUL3js4SZnof5iM1BZmZZD3zTiz2FXeu2me49jT2qa?=
 =?us-ascii?Q?gkKArcB+cW5BLPDPXY7nN4KLHGSzKqF6LlFMGPoAGxeEqYB+N+rS2pq2LUAo?=
 =?us-ascii?Q?8s4yrdTjnubGWqRM400Ct16l6ejf0Z5JMqi5sDdSIiGYVJXc2uY07LIRB+tD?=
 =?us-ascii?Q?Go+j+zqKK5GcqM3ejREg9Z4o7rPKTRYTVQTfTGuukychh44fv1lymZncgAcZ?=
 =?us-ascii?Q?Jk2ZotTDOkvFpENwzvDpmmlzq+xOxc+wzu+ZC4aAYDxuEbBmHJ+zR3MxLTL2?=
 =?us-ascii?Q?wvu1pEdjRNFI+P3RUgkGF/32JTm3KaytCBydxMfsCkyY/pm+JJTS2XSUCKLQ?=
 =?us-ascii?Q?rr8VwHpi3CKm6JY6WMCQ0ehL7e4tr+B2+WlT/ZZ5hfPDOBB/H32+V/DiNgqX?=
 =?us-ascii?Q?T7SeROk8SVXULI0rpQ/vCkdcDzS5+LKVv1oHkcu23Y1Csr6L5FtJhfTxFkE4?=
 =?us-ascii?Q?WVk6M7CqBsHuza1vkHsxGFdSTI+bSo7T18sZgBXHg0SuBh1RgpKjNQZMQTl7?=
 =?us-ascii?Q?oIVGRBO6BqZrqf24ghySsaJxhawAEqx5dQdZ+kKjcfLk6zxuC1kFgQKoZ4xS?=
 =?us-ascii?Q?1ryTnUZLy8OB9a/rS3bIWcPU1K7t/OSz33qcVgad9OGcGEqpY5ZUugXJjErX?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f66a1b-6b77-4844-ffc7-08dd941b2c47
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 01:44:18.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6UdihO9nM2WVuwZLAI1rBTOcPbUMoFhj1u+UhyE0hyCGdAGRqsS8bzzvFMAjYcjh1DhHqObYaJ2qoK03xqd0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_reboot-without-warning_in_boot_stage" on:

commit: e56e18a46937623c0f07f06f2dc6a7738821b3ec ("x86/boot: Create a confined code area for startup code")
https://git.kernel.org/cgit/linux/kernel/git/mingo/tip.git WIP.x86/boot

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | a47a37d72b | e56e18a469 |
+-------------------------------------------------+------------+------------+
| boot_successes                                  | 12         | 0          |
| boot_failures                                   | 0          | 12         |
| BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 12         |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505160959.4b6ad85f-lkp@intel.com


[    0.088245][    T0] ------------[ cut here ]------------
[    0.088245][    T0] Unpatched return thunk in use. This should not happen!
BUG: kernel reboot-without-warning in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250516/202505160959.4b6ad85f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

