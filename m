Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E830D3FA
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jun 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465135; cv=fail; b=esiVeYgh2qd311oguhwRHMin5RannS/pL0d6i8klm4h13V8FgzvuAAVgclYumN/Y8ggZztTtgFi+2zBHUmfZAFxLH+3coXSZHNmItwk70Ix25innuz40CmPQHBQxVmVfYCROBRXF4OTIexfSu84McGNK4hKx41M2ukiGqfvtTF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465135; c=relaxed/simple;
	bh=bjglAt5oBuY+EUKfPVduTEAgE+shne9bSHC8zDxBWLU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GmS34olo358gELGL8Z/WTMyYgZBAZOjzXVnZ4GwheKQCgaqDm2uzNr7XO91IeDVBbp5kfIvYosypexRkGGiq7poexDgvqbtOno67fQDPQsSoR7XzpXfW95XfEuYNIFy+Wfffzp9zilt9VBJX3BoMOY2P/blO5i9aCsWtb44Jx0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFPEoOAh; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFPEoOAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782465132; x=1814001132;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=bjglAt5oBuY+EUKfPVduTEAgE+shne9bSHC8zDxBWLU=;
  b=XFPEoOAhwvAK7TDZWDB0wdB8RQfN3X+IBwGk7xAVTedJAk+SgKmSK2BB
   qlV51YQ8gS4Q5OpozTPiJPmcLzJrp/TiQkdXel/8IBSYzKVuZ/UAzB1BJ
   N+yTJbLiCmT9h8j1+gabFnUegBherU22f5BzfDiMTaUiLr+SmCuF0RT5B
   DOtseoh6ka1aqaZylS+Rh1b5eom9+hE0/Baosi2vAwrHh+PnofcwD6bSF
   h5tVeXd7lJF4j/gespiOHxf2hekKEJIHl7VwpLzBMC21w/uvbVbGIyaY0
   LnGVspoPqnCLzNG0UUeT/REl7VVv8gJx/bkR1y3ZS8n4z3K7VeSYcyFTa
   g==;
X-CSE-ConnectionGUID: 2nA/qAPIT+mtC2HqHjvbNg==
X-CSE-MsgGUID: QXmQHoXKTgK/9Kq3zRM0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93915007"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93915007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:12:11 -0700
X-CSE-ConnectionGUID: q49r8h3fQxWvtEy8+opQuA==
X-CSE-MsgGUID: tRHw6tQrSyuKQzGCycfAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="248644018"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:12:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:12:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:12:10 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDf0GNx2QwmLbs//cbOAQADtnmotVS8deB62zrMX9cGsCc+0kIzsJo0J4cS3RWgh/doVvlQVI7CDan6dUMEXiYThLuW4MCH9meRSDi7QMUVftlIwjCeBn8Hx/RYBUu4mVbP03A/DGwIcgmIM+Aiv2Zf9UjA26EPK49mnCk+RhKJ4NAS4OUmLCuzO+5LkEP2bKEYnv5jYZMo/EmJFq23pLdeyDEGdtP5XZ87HsacE2xSi3klaJJLmM63jkZmiXN/BBpf4uSLWXJue2tiTgGGhIG71SPNWbxcDHtFZ5FEeQ7lpT/o9iut0o69JpxWuQpK/dBbh/HMR2GANTCSqLRXAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tmp9GiFCQ9RzTzQ9YJ55huASLzr5u4mMCaNoAA2vlEk=;
 b=BpqubQxJEBryN72tqcCSKAGC6/L1YoGxxCz8Gh036Q2Br1TLewCdiRwRLX1o/PU+OFICSZqqRJyrHL3/t25qPMQtzsoOg1dWjryLA/jI7I6rPQEDGCYKCPuXY2IydO0O5c8c1TdaLRBkgHTC5NLSnE6pRhhYEN0VgqABGsPw3e3NGiuJPQXsJD6IbjNJCyh7QcSwHXztg8EU5WyPZ1XjzROxyPikKRS26p4QHX/NUB1pJ9PnKcyu4at4LbjVmLnn3wMdUG2cKQf03rnpCT9IkUGu/WRkrUIB2qEUBsXsBd0tIEr9U46s+7LaeUpjlxKq707Rx9DsGVTOVrNJ62RopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:12:08 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 09:12:08 +0000
Date: Fri, 26 Jun 2026 17:11:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Zecheng Li <zecheng@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Zecheng Li <zli94@ncsu.edu>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  b8fea7af0e:
 stress-ng.session.ops_per_sec 91.5% improvement
Message-ID: <202606261633.32eca12c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: d06938cf-c600-4188-e1ab-08ded362ff3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|6133799003|18002099003|3023799007|7136999003;
X-Microsoft-Antispam-Message-Info: NVlOvOHcU3kAcgfWonsVS2bbXUafN/CIMNC3pb4kOpfTUsluWX4PZeNC7ScabGSsWvR7uXE87H2dp/xrjAWUYRPWQ0VFRInhNT+iwH7EJoRrUA7P9u6aVO3TW4bpo9FHD3spZIcfmpGixxNiZRkBMl0X2mt1tB4EMYk7vK9X1ielq/pg9CIWk6JpL/TnUuFn14bc0393CELO8SX/DiIjEgEEACW5HcMVkDRSriJTr76TQbncjbmVO9ndyE9NpHXLWD8PpY8cqwnztJqGaHIGnoPkkjjx1/JkUUuwpK1Q2Dp5kRU8kiPltL89upYKF3bFpcsNIKL7KqrbgrbPn1ig16bUMLP2YZnVg5ifFAEbMeOlv+LOIMS81QdqTmQL4XZsD7AM64ELtiv0CvIwUza8K1hzAsUll4Ifn4bbArp9RWwwKeCrzsmyiWtepcZ7DkbIIJFYC6oJuMceYF1fFY1Ch5AEu5jSeBuXcJ44znBITN4pmt5rkJQsg2nMrgwmClrFVz8tBKrOGEcN7NYZEbmi2gMPvCfewunYIMcxRLqtCrvWghK6GVAqWGSxKAGZfNtvHqVmplUnfVS/rNTL3B80WfHpwkcipXrwB5fQbdM5jDpDDpacmQeDMJWFN/500JvT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(18002099003)(3023799007)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Eav+biyqUo5Q3r5zHLkkff9RGvmxP99TD8I0Fo3nbClD0Lub4KAFHLYsXu?=
 =?iso-8859-1?Q?GHfMkdOjt/tXxhJeymmNcsOxK51xdYZWSnUSd7LrU+h0KX/QTiLAQu7qf1?=
 =?iso-8859-1?Q?/h4IoxCrgOGtrHKI2kOpoQfsKw2MHa10MAF7+3FIKXJOpNzArr1IiVi3zX?=
 =?iso-8859-1?Q?k2pSKllaEa3pZiCQyqmZrK7q7nawlw2aIhdFAQ7MvLmdcZMS6tFrFuzCV/?=
 =?iso-8859-1?Q?KhuE3X0qMGMKPPvgxAUszML8xKIfeqlzLQNMKWeQuj3MzkQaA7mLfiso13?=
 =?iso-8859-1?Q?jnHv57mAWbSMh9B3VuulgF1/S9tmqGIks1NjYGxpwjUOZ94vTFIxNgHN6I?=
 =?iso-8859-1?Q?CbdHRv5a+5coZbCPgeXbAk9ruFAfwiVwvyyWVlbTjEzKPLfaezYwG0k9C1?=
 =?iso-8859-1?Q?JiaT2bmXAObfSOrXpaHmC+hRHYgMR8tvmArY2qcphvf/c94m4JJ+5Mh1Z+?=
 =?iso-8859-1?Q?2ugsl7Hlls/eXZfVVeZs+HwR1JInudlBYgOWKanqcxkOvJRb8bh7LFRVim?=
 =?iso-8859-1?Q?MvA/9HOtqNvhex4pLF9YURbDo8UwRnuGXsU8r+TbBGWA/+lE0wWbmIvZrW?=
 =?iso-8859-1?Q?yxmH6+V3YWRETs/xnd1l3S3CKEteCSGcoWXS43poQ51hVxcOCpw27YUdRu?=
 =?iso-8859-1?Q?b7GyLXlOh4xMa1rUtycNkdcS0dtCUhneV7OIdC8yCndrCtO27fclr5OrgV?=
 =?iso-8859-1?Q?XNvoV67Q8bchokryXKfaFsgmsdjzUSXh3nblzucZ9fACfKE7v4FrRXp9Gg?=
 =?iso-8859-1?Q?MdzDT4LFVRIts/u5B4DgKoV3LrIw3ifgP7eXE7D+Pz7HYZ3GGJhdl2d7ZH?=
 =?iso-8859-1?Q?FacvapCDQHJALYFNpsMQt6fB2TM7W0xhSD6RsUSMyzjPgYmgy2v8R6XgT8?=
 =?iso-8859-1?Q?3nAncm5rXHPQuoyvGRT9yBWgKdBBwSkX8hpZoakqok0xuMM2LG9DsBUH1r?=
 =?iso-8859-1?Q?l/IhhTTlNEj4r8T90hvAotwcqN091Chc/x9NAOsC3PnccjlcmiV/+13xY8?=
 =?iso-8859-1?Q?dPr4j/Ceax4hgodjsh9C01eBgVake3Neov3qtizy6O3W9nlkZ5VzeTIb2l?=
 =?iso-8859-1?Q?JoAxebRE5TClt1BEQu0Y2kyzoNEBg03nkCd6l/biIFDnCT2OfEaJgO54O3?=
 =?iso-8859-1?Q?0Fpsi/9oV6znanmCaWNJ9NI5NQ+Go/+6NbZrS5jsL4IW5HhnPVplUdekah?=
 =?iso-8859-1?Q?rtibcEh2oOEZaMLDasRfHF3B+d0JQ3lLR8oYZ8fkRPZvYKMsucsSwgEJry?=
 =?iso-8859-1?Q?5gu5+HgJ/Uq/ccgmCso6Dkm8V+jkdwWk7uHT8Noh2f4VwM9ztFZLswiO92?=
 =?iso-8859-1?Q?BZ4b0Il0N93qMUYfngc4sv3ofdYtluIL0dTJ/pOTiYi+n2y99wn/JZUMRA?=
 =?iso-8859-1?Q?xrxNgHqSzfeDJULPqkolOI55V5JayfwuUa66kIs2xH8isVadlUm2yuW0o3?=
 =?iso-8859-1?Q?CCeCPvr3A3BGcnTDEhNjlJ4Lqn28qB/7DvcC7qta0FAPOhw0r8Y+xkV3OV?=
 =?iso-8859-1?Q?vxB1NE+0j4mwRvCQFzJ7mjKhPvTPWd0mwztVD/kCa25QGKlscRBKhzCHYE?=
 =?iso-8859-1?Q?503LMA86q5mGXtg8jsScWigKzHjquxznuovzg77muDW/Xu8YXM5YHQ0TBA?=
 =?iso-8859-1?Q?z/Y3wj/hS61+4H2043N5bqne59Nesbekv55aHLLveatFcnY8UPoMdj915b?=
 =?iso-8859-1?Q?FAWH2YUqGN7GHMNddv+p6oOqWTPguKq/yMp0eR5s5sxbV86rjL5npo7PFW?=
 =?iso-8859-1?Q?mYDGO1Cf61irzBxhtM5nlc57d852FqE8pDdemKhB1u+9SPF8snh4w/vW4p?=
 =?iso-8859-1?Q?MXVyvF4LSA=3D=3D?=
X-Exchange-RoutingPolicyChecked: mNK9ldsXAYv3jlWTGCeu4ZkJZgzqXSyBzckWtvlQcOIwquvfWygTOljKUbNFF0JQmnm6sif78sH6It+7FUiFr4H3jpQkDYBnzBdBhuqEAvHfwAuyTo483kNObzAyyIG++7dsES+yrucXedRbmmhDrYRFs9yIo8qamYxZMNghpvZK2JI9q/kOf7Z55+7KkuIl00GIMSEkR8/VkFKknBQT59lBtK9kSvW+4n271n/70NF8K04hKkNjTl9V2ZyBmZnza1Z+z9Hx+b8lHBIM4TnvFZzNtTK6ihkQ5AjDcujdKtk2qWba87hmobBSoUfUIx8rGR8HjnUxagsdMidVcrVsSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d06938cf-c600-4188-e1ab-08ded362ff3c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:12:07.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwEDh63Hwwg/M8LpZMw1kancvBRN04+uT6UtEfmxjyiI0juZReMzfvf6jjZpM4T2ig1arGP9zXfZlft1a5ip7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 91.5% improvement of stress-ng.session.ops_per_sec on:


commit: b8fea7af0e40feb6d9cbbd60b66ff0ec265e868f ("sched/fair: Allocate cfs_tg_state with percpu allocator")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: session
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260626/202606261633.32eca12c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/session/stress-ng/60s

commit: 
  89e1f67186 ("sched/fair: Remove task_group->se pointer array")
  b8fea7af0e ("sched/fair: Allocate cfs_tg_state with percpu allocator")

89e1f67186baca35 b8fea7af0e40feb6d9cbbd60b66 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    610356           +91.5%    1168547 ±  2%  stress-ng.session.ops
     10187           +91.5%      19511 ±  2%  stress-ng.session.ops_per_sec
    682208           +23.9%     845283 ±  2%  stress-ng.time.involuntary_context_switches
      9315 ± 36%    +196.0%      27570 ± 46%  stress-ng.time.major_page_faults
  74894407 ±  3%     +91.4%  1.433e+08 ±  4%  stress-ng.time.minor_page_faults
     13490            -2.5%      13152        stress-ng.time.percent_of_cpu_this_job_got
      8076            -3.1%       7829        stress-ng.time.system_time
     33.20 ±  2%    +130.4%      76.48 ±  3%  stress-ng.time.user_time
   3019455          +147.5%    7471743 ±  2%  stress-ng.time.voluntary_context_switches
 2.619e+09 ±  6%     +41.1%  3.697e+09 ±  3%  cpuidle..time
   4789881          +106.5%    9891495 ±  2%  cpuidle..usage
     22.08 ±  4%     +44.9%      31.98 ±  3%  vmstat.cpu.id
   4955056            +9.8%    5439814        vmstat.memory.cache
    169.44 ±  2%     -13.4%     146.67 ±  2%  vmstat.procs.r
    124532          +120.7%     274835 ±  2%  vmstat.system.cs
    455602           +21.4%     553218        vmstat.system.in
     19.73 ±  5%     +10.0       29.75 ±  4%  mpstat.cpu.all.idle%
      0.03 ±  8%      -0.0        0.00 ± 81%  mpstat.cpu.all.iowait%
      0.37            +0.2        0.56 ±  3%  mpstat.cpu.all.irq%
     11.52            -9.3        2.22 ±  2%  mpstat.cpu.all.soft%
      0.89            +0.3        1.16        mpstat.cpu.all.usr%
     87.80            -6.3%      82.23        mpstat.max_utilization_pct
  23158413 ±  2%     +91.2%   44277233 ±  3%  numa-numastat.node0.local_node
  23346017 ±  2%     +95.5%   45639044 ±  3%  numa-numastat.node0.numa_hit
    187646 ± 17%    +625.7%    1361768 ±  6%  numa-numastat.node0.other_node
  21382055 ±  2%     +87.6%   40123301 ±  6%  numa-numastat.node1.local_node
  21639867 ±  2%     +92.2%   41600375 ±  6%  numa-numastat.node1.numa_hit
    257307 ± 11%    +474.1%    1477073 ±  6%  numa-numastat.node1.other_node
      2540           -12.4%       2225        turbostat.Avg_MHz
     79.44            -9.9       69.53        turbostat.Busy%
     22.02 ±  5%      +9.2       31.19 ±  3%  turbostat.C1%
     20.36 ±  5%     +48.8%      30.30 ±  3%  turbostat.CPU%c1
      0.15           +60.0%       0.24        turbostat.IPC
  30697679           +24.4%   38174002        turbostat.IRQ
    313.32            +2.6%     321.34        turbostat.PkgWatt
     24.18           +18.1%      28.56        turbostat.RAMWatt
   1537143           +32.6%    2038945        meminfo.Active
   1537110           +32.6%    2038912        meminfo.Active(anon)
   4808401            +9.8%    5281769        meminfo.Cached
   5073192            +8.4%    5498934        meminfo.Committed_AS
    391992           -15.3%     332050        meminfo.Mapped
     93966 ±  4%     +21.0%     113702 ±  5%  meminfo.PageTables
    172086 ±  7%    +325.6%     732317        meminfo.Percpu
   1095287           -56.6%     475325        meminfo.SUnreclaim
    716648           +66.1%    1190009        meminfo.Shmem
   1237725           -50.0%     618879        meminfo.Slab
      0.23           -66.5%       0.08        perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     56.29 ± 20%     -37.3%      35.30 ± 13%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.23           -66.5%       0.08        perf-sched.total_sch_delay.average.ms
     56.29 ± 20%     -37.3%      35.30 ± 13%  perf-sched.total_sch_delay.max.ms
      9.88           -51.7%       4.78        perf-sched.total_wait_and_delay.average.ms
    399971          +106.1%     824497        perf-sched.total_wait_and_delay.count.ms
      9.65           -51.3%       4.70        perf-sched.total_wait_time.average.ms
      9.88           -51.7%       4.78        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    399971          +106.1%     824497        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      9.65           -51.3%       4.70        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    133243          +116.4%     288278 ±  3%  perf-stat.i.context-switches
    194336            -1.1%     192149        perf-stat.i.cpu-clock
     27884           +91.6%      53428 ±  3%  perf-stat.i.cpu-migrations
    158.09 ± 37%    +185.5%     451.31 ± 46%  perf-stat.i.major-faults
   1256057 ±  3%     +88.1%    2362437 ±  4%  perf-stat.i.minor-faults
   1256215 ±  3%     +88.1%    2362888 ±  4%  perf-stat.i.page-faults
    194336            -1.1%     192149        perf-stat.i.task-clock
    128658          +118.2%     280754 ±  3%  perf-stat.ps.context-switches
     26831           +93.3%      51879 ±  3%  perf-stat.ps.cpu-migrations
    150.27 ± 37%    +193.4%     440.89 ± 46%  perf-stat.ps.major-faults
   1212558 ±  3%     +89.3%    2295418 ±  3%  perf-stat.ps.minor-faults
   1212708 ±  3%     +89.3%    2295859 ±  3%  perf-stat.ps.page-faults
    167364 ± 66%    +787.8%    1485853 ± 18%  numa-meminfo.node0.Active
    167345 ± 66%    +787.9%    1485838 ± 18%  numa-meminfo.node0.Active(anon)
     49987 ± 92%    +324.2%     212032 ± 19%  numa-meminfo.node0.Mapped
    619973 ±  6%     -58.1%     259551 ± 26%  numa-meminfo.node0.SUnreclaim
     29716 ± 78%   +3008.8%     923832 ±  4%  numa-meminfo.node0.Shmem
    705775 ±  7%     -54.1%     323802 ± 30%  numa-meminfo.node0.Slab
   1370362 ±  8%     -59.5%     555194 ± 51%  numa-meminfo.node1.Active
   1370348 ±  8%     -59.5%     555175 ± 51%  numa-meminfo.node1.Active(anon)
    362187 ± 10%     -74.2%      93542 ±159%  numa-meminfo.node1.AnonHugePages
    341339 ± 12%     -64.6%     120912 ± 35%  numa-meminfo.node1.Mapped
     45901 ± 16%     +23.8%      56827 ±  4%  numa-meminfo.node1.PageTables
    476900 ± 10%     -54.7%     215830 ± 31%  numa-meminfo.node1.SUnreclaim
    686948 ±  3%     -61.1%     267149 ± 15%  numa-meminfo.node1.Shmem
    533533 ± 10%     -44.7%     295138 ± 33%  numa-meminfo.node1.Slab
    383948           +32.8%     509815        proc-vmstat.nr_active_anon
    206513            +3.4%     213464        proc-vmstat.nr_anon_pages
   1201861            +9.9%    1320471        proc-vmstat.nr_file_pages
     97614 ±  2%     -14.9%      83031        proc-vmstat.nr_mapped
     23581 ±  3%     +20.7%      28463 ±  4%  proc-vmstat.nr_page_table_pages
    178922           +66.3%     297531        proc-vmstat.nr_shmem
    274192           -56.7%     118831        proc-vmstat.nr_slab_unreclaimable
     80759            +3.2%      83318        proc-vmstat.nr_vmalloc
    383948           +32.8%     509815        proc-vmstat.nr_zone_active_anon
  44989050 ±  2%     +93.9%   87242239 ±  2%  proc-vmstat.numa_hit
  44543635 ±  2%     +89.5%   84403353 ±  2%  proc-vmstat.numa_local
    444953 ±  3%    +538.0%    2838842        proc-vmstat.numa_other
  48904767 ±  2%     +85.6%   90766237 ±  2%  proc-vmstat.pgalloc_normal
  75424210 ±  3%     +90.8%  1.439e+08 ±  4%  proc-vmstat.pgfault
  48116497 ±  2%     +86.5%   89739194 ±  2%  proc-vmstat.pgfree
   4261223 ± 10%     +96.1%    8358094 ±  6%  proc-vmstat.pgreuse
     41819 ± 66%    +788.2%     371430 ± 18%  numa-vmstat.node0.nr_active_anon
     12503 ± 92%    +324.2%      53034 ± 19%  numa-vmstat.node0.nr_mapped
      7429 ± 78%   +3008.7%     230968 ±  4%  numa-vmstat.node0.nr_shmem
    155024 ±  6%     -58.1%      64888 ± 26%  numa-vmstat.node0.nr_slab_unreclaimable
     41818 ± 66%    +788.2%     371428 ± 18%  numa-vmstat.node0.nr_zone_active_anon
  23345970 ±  2%     +95.5%   45639379 ±  3%  numa-vmstat.node0.numa_hit
  23158366 ±  2%     +91.2%   44277567 ±  3%  numa-vmstat.node0.numa_local
    187646 ± 17%    +625.7%    1361768 ±  6%  numa-vmstat.node0.numa_other
    342699 ±  8%     -59.5%     138864 ± 51%  numa-vmstat.node1.nr_active_anon
    176.85 ± 10%     -74.2%      45.68 ±159%  numa-vmstat.node1.nr_anon_transparent_hugepages
     85411 ± 12%     -64.6%      30246 ± 35%  numa-vmstat.node1.nr_mapped
     11500 ± 16%     +23.8%      14240 ±  4%  numa-vmstat.node1.nr_page_table_pages
    171755 ±  3%     -61.1%      66798 ± 15%  numa-vmstat.node1.nr_shmem
    119206 ± 10%     -54.7%      53962 ± 31%  numa-vmstat.node1.nr_slab_unreclaimable
    342698 ±  8%     -59.5%     138863 ± 51%  numa-vmstat.node1.nr_zone_active_anon
  21639864 ±  2%     +92.2%   41600300 ±  6%  numa-vmstat.node1.numa_hit
  21382052 ±  2%     +87.6%   40123226 ±  6%  numa-vmstat.node1.numa_local
    257307 ± 11%    +474.1%    1477073 ±  6%  numa-vmstat.node1.numa_other
      0.50 ± 10%     -16.4%       0.42 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.49 ± 11%     -15.5%       0.41 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.avg
     32477 ± 11%     -20.0%      25967 ± 15%  sched_debug.cfs_rq:/.left_deadline.max
     32462 ± 11%     -20.1%      25950 ± 15%  sched_debug.cfs_rq:/.left_vruntime.max
    495516 ± 11%     -18.3%     404915 ±  9%  sched_debug.cfs_rq:/.load.avg
      1675 ± 12%     -22.9%       1291 ± 24%  sched_debug.cfs_rq:/.load_avg.avg
     17.83 ± 37%     +73.3%      30.90 ± 29%  sched_debug.cfs_rq:/.load_avg.min
      0.50 ± 10%     -16.5%       0.42 ±  8%  sched_debug.cfs_rq:/.nr_queued.avg
     32462 ± 11%     -20.1%      25950 ± 15%  sched_debug.cfs_rq:/.right_vruntime.max
 8.253e+11 ± 46%     -68.5%    2.6e+11 ± 44%  sched_debug.cfs_rq:/.sum_w_vruntime.max
-1.142e+12           -79.2% -2.372e+11        sched_debug.cfs_rq:/.sum_w_vruntime.min
 1.641e+11 ± 14%     -80.5%  3.196e+10 ± 30%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
    562.81 ±  4%      -6.3%     527.61 ±  6%  sched_debug.cpu.clock_task.stddev
    408623 ± 13%     +44.3%     589658 ±  7%  sched_debug.cpu.curr->pid.avg
    609584           +90.0%    1157918 ±  2%  sched_debug.cpu.curr->pid.max
    278101 ±  6%    +106.4%     574007 ±  2%  sched_debug.cpu.curr->pid.stddev
      0.50 ± 10%     -16.5%       0.42 ±  8%  sched_debug.cpu.nr_running.avg
     22206          +111.3%      46925 ±  3%  sched_debug.cpu.nr_switches.avg
     59463 ± 30%     +66.6%      99041 ± 11%  sched_debug.cpu.nr_switches.max
     16171 ± 11%     +62.8%      26329 ± 21%  sched_debug.cpu.nr_switches.min
   -115.25          +180.9%    -323.70        sched_debug.cpu.nr_uninterruptible.min
     47.53 ± 13%    +134.1%     111.26 ± 21%  sched_debug.cpu.nr_uninterruptible.stddev




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

