Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8D1DB925
	for <oe-lkp@lists.linux.dev>; Wed,  4 Sep 2024 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460366; cv=fail; b=I52WeTq/gt7GNVRSi0QVTszdm7NT0vJT7TMqljTZe0ts9cOSKjvs908HdVaXcmZp5OgkkN/Fj+mS0JMj6XMtCdeIKvvN91cQsWCwMuoEBYe3XD5j/4VVHmQwAEB5RAd0z8lL51yN0dyAwxuQPH248FQlgeUnignAk/oej2NVsK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460366; c=relaxed/simple;
	bh=jKYdW+Y7jyKM4Q68sqKLb6Vf2e+xz8m3HLz+1W3JSrs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cw/xDJoSymy474qUNJltWGG/urHCOrkR8tEoV4TY3AXzKN33PqE1GrdISRvjvJ4n+m0J5M9yXRD1Xz0O4N4rdqbD64ILECEUrznvP5bp0EN6rqjREhiQcYXxdXShO0dwtoyfo2TVQJl/hL5ptJ7crA5wJ6whZmnQq1+sdNnKCx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZr0co4+; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZr0co4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725460364; x=1756996364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKYdW+Y7jyKM4Q68sqKLb6Vf2e+xz8m3HLz+1W3JSrs=;
  b=nZr0co4+hxoyLx5c5VBOykDAANaIoab/SPduiWwrPAitochodR7eBtlq
   bAftGgFtPUf0PD5giFmyEEKdjV8/nAqY3paY+eO1adzd46hVBog9XkQl7
   jxY8EAQqbPNDOtOmt+/owpUwIvm7ICZIZ3FuHnDyvVwFqFKhjU5PPqzLS
   GxMmkJedR9/B7B+uXsGpEWFAGhFXH45wvIQUMo5lxNdM7pymJIEBeqFIc
   8TqsUV9gb9+HC6GiYLpjPkho1YAqAqe/V0gRGg2EjYZS/FuIyHgJS3L3W
   DEFgiP2vRm1durqd/7QbvBScHCVMgDHkJEO32QjGP8qOVE0X5wZxvdyaK
   Q==;
X-CSE-ConnectionGUID: 4YQTiUcrSkap/SGFeA9yrA==
X-CSE-MsgGUID: lzE+NulqS3CeGIl6ehpbFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24079621"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24079621"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:32:07 -0700
X-CSE-ConnectionGUID: 79H3IhYFRfGWLtLLkBYF7A==
X-CSE-MsgGUID: bhDSeeT2TNW2+2gMQzqk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="64958141"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2024 07:32:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 07:32:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 07:32:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 07:32:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 07:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxVlumF+doxlXdP4bBODE5c+QbfD7jH65pzAfSrB3GzzH2aR1eXZE5iDVqzb0KvZ3l2dqgT96XdPrVts+ofwIkN8Y2rTSzZVRgy6dct2ee6qaJMeZXp7jXcrPvo8gns057wYdE/rTKruLwoBHMXTdd0R3Ncnknb3jbNrbLf7jMW+1yLy3DDPIhVnllrEFDTCm6NTwPp1LrUBoun+bJI0ZsbpQFf/v4AMqeNJJ+IhtVm0hZ2m2B+g1BllVFQ81HRX41kh3Aoq/Oo+aFIUoZCGhiDSFVWFuHXO9VvO3NdfwZQymj0W+nQDUq1qNyZMrBLq6y3TFsYmRLIJx2NYE5fMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R6f/NiY2/cwNy7b/M04ShfH4PgpSGYzY4SIUGXQnEM=;
 b=THqGAVNkz9l59Wzlz867En7e7a+BiuZThTUf5DsKgHR/Lgpm67aYPcZy1bEoGJExddC9o/7wBwDKkPlBfIB0FNav+Og18mq8wLOcWGiPn8MZr1GFXlgd9eHjRQTiJEflD6fjxqkke3Aa60GeaXXIyCJHlb2+/IVEuP2gqND5gzTbKJH3XjKlRyvcnsz/OznPh49sSeQ9MZ2f6GQaJAHPgqyBKFT7jOKsD0KWWxLrII9OMkrQIsTicYa82kSBUAz0JNn/mdXdm064361TMFMXMEJEM4ikSqPklrRJNrR+Dq11lwiwPJ3YKlyYnRFXA8vmRd/Q6nmJHPTChOT8PQ5PMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 14:32:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Wed, 4 Sep 2024
 14:32:03 +0000
Date: Wed, 4 Sep 2024 22:31:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v1r3] [mm, slub] a785bd6928:
 WARNING:inconsistent_lock_state
Message-ID: <202409042217.1a3005e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f4cbfc-def0-408e-5b47-08dcccee5809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uydWQYrPH81ytsge6kvY5A5NhSbfyeQ2J/4gxyD8amCwvz38AfULQwxMddf1?=
 =?us-ascii?Q?FKB76yI0eyMFIxucSE/707fWsi4+40Ze1EzBJPPChBYgWMIxVBSo9hF4nwPU?=
 =?us-ascii?Q?gubmfyBPLvSnsZgWFCkAloyC5PrKYkGgvZuahLXYF5LrVyoTN+uReP2nH6t4?=
 =?us-ascii?Q?iHyTh4o5YGqs3EZ5NXJotHptwumhToteNwSHwi/vSoR04hEWIG+jHyBTidN1?=
 =?us-ascii?Q?4CPdUC8Kty8PrUfAbHjNSGw1/SJPU9/UYPnuTWCiH2b6jws+uMK+HtWI46sG?=
 =?us-ascii?Q?s5+B0aa6fsM7lYg2Cf49TBH7MHIu1MSw1o+jgaEZLa2uX4crso/1Zx4ifLjS?=
 =?us-ascii?Q?pgbqulBXVbCNwUIDMtqpN7tKobt92VnNZkYDNPTlo92HPfOZtfIWc2cIoKaT?=
 =?us-ascii?Q?aqASDV/HK+gf/mS/9xrAERq4usZqPqs2gc2Nk0522xTyZkHPPEhTaQC59LS3?=
 =?us-ascii?Q?mNclRf5x4LS4PwMTNhQV3CXOj4dfPuNSYusbhBRdGv5K71oCQOJAHE3m6+J3?=
 =?us-ascii?Q?dqJOhQM3/3bQWltnyKv3WdOGq4aJqAdO0NyE0E1wgWZn2cdAUfhKXpkbLf9s?=
 =?us-ascii?Q?GRCQfD56J4T+KhDXI5NnSbULphmUmwHfx0sNUc6ri1yAIAADVVs7Lte72tXy?=
 =?us-ascii?Q?EKngxmkTuHwR/Uk7R2cwqLpaS1S+SCEMRtBwr4pudQ32EeIH1WvpNvuo7PR8?=
 =?us-ascii?Q?P68n/p/bbZC2fq+gOI0Aa1Mw3HWjWfz9uM/TViY1UfqMYJppQRtX/qjUpIzo?=
 =?us-ascii?Q?fAcpRlTL07Mvq4rkbsNzhz9i7xorQE1ZeAfcl5guXdCDSY5txnk0XvFq2nvb?=
 =?us-ascii?Q?Pm6aN5TBMLPjbC0j443GuimIeDzbCiQs011TDv/pc+veV6Yp+cuUqfKTOBsq?=
 =?us-ascii?Q?orm9eL6PTG/dC5T5qehRYvLZJNB9zIE5VhaaiY3nD8sH0KHvyDaxa0ZNzKmV?=
 =?us-ascii?Q?z+6KXmYA0B7R+YmGgI/k279pcPWC7qPiZUmw2QbF/FeoRlKAG4E/NaU0C9Zr?=
 =?us-ascii?Q?FYpDs1fj7JLhs1ylgJriz2jyybmT0t8DZgUjQplcYPmzLul1YIB4oSTIaAve?=
 =?us-ascii?Q?9sMzDNLNZglKHGNYa3Q3QONMqSGJX+kNocvmYsFZdo/HF0GB7mVeudtL6+sv?=
 =?us-ascii?Q?FSOw1B71b+jnB4jHbbM00drj2lukLO6sOZa8tOKNELM5bb4G26Hc3q+8AvlQ?=
 =?us-ascii?Q?i3o5DkiltBnnBzUdy+9DX/iq3gqERuvCqCVwypvDzdU/MT5KFLhQpu4jYraA?=
 =?us-ascii?Q?k7VfIc5BxzFinacLkelhfAbRBD4JI9p4CJLvVkXSWAC8wMFus1J3xVDZnAe7?=
 =?us-ascii?Q?1c0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMFU60R3xrRnWGtaeDZzw5acwQsap3eghFxiY1xtPeOf2wjjzywdYwxRyIaG?=
 =?us-ascii?Q?PgfLNgVCeagttBOV2V3aYtpgwXoC8KP2h1SVGiqDHio3dLEfL2+Pqg5hQa8a?=
 =?us-ascii?Q?iaO6pFk8QL6WEBIL9CrMfxsBkfPmj6C611PWQOnlNYMpgifCoYALBzEtZ6XT?=
 =?us-ascii?Q?4OmLdunaY9Hs/L4r6VuFE/zZ3ZC2AfDoSGIzcTJY/13rci6Q3lEknF8bOZ+z?=
 =?us-ascii?Q?pc8lCx0E6wd7pdVpKizszI76m8OqfNNlCC+BqzuPflVM68D9PPMFnEqIU30p?=
 =?us-ascii?Q?HaRffo3aDpiTSPMW0qLrQm5I6G2TMoeAeUs0mxoDQaDvOyG+fJPVwea2HhHq?=
 =?us-ascii?Q?RNBu+6DgjXkg2WYSd9V+mDjq+F7i828JBvOtFlmVHGnN68UrqmAS1acQraPZ?=
 =?us-ascii?Q?SLTHXGpJI4qqQTm1fbp8w4cuhbP3eubviSyBlq77SqmO+/WKMZ65MsRn63LR?=
 =?us-ascii?Q?+gq9PCuVcpB/F8HLM0lwgOkCbiE9MMeYMo3tjm/wq1vJHDsyWUQC1DtEliqo?=
 =?us-ascii?Q?/BHJ/6KUIsQfl3U5m7KI9AszH83RVfvbgqLOkvIDWgHXW0brAxX2yIl7TsZ7?=
 =?us-ascii?Q?Fwj95KWxufulY2SComZv4Sbi/tvdIQlSXEnH/WWq8uCeMZrGT5JJFJ/sEfiR?=
 =?us-ascii?Q?VH6AEMXKMJ3RAsDAkmlbNttF+nzblOrV2rTIJ8U/N1nIzsZoAP8B2z9XSAcj?=
 =?us-ascii?Q?sqsxdRoFAOgF4M1bRzevbsK1LIH5nC3c2NewnAxlO818rIEnqlHFj6Y3+Stx?=
 =?us-ascii?Q?X+0faWtG+YcdJfxvKYsNNGlHIT4REPFsGuhR66R131rpsHTVzqQ0GrAPCmyt?=
 =?us-ascii?Q?d4W+berTJCnUe9pc3Dr81Kriv20bi/L/p7vcWAY/X1xqLQ0/P/wbi8he9pfm?=
 =?us-ascii?Q?XqwK3Ey1b1O2obeNfp5MFRfROhb0ozDYx1qQY9USDppy6aPpT+TlHlQrUBqU?=
 =?us-ascii?Q?ivjwhsPSgxRAXXGGvYY+Wx33n5z/FMQGxRPjwDgzkAn1+bpNfehOhmjf1uTd?=
 =?us-ascii?Q?kE5g1VIUOaxw9KIiKbTRE1GDG1j4gxvw4t7aONP5PlxHnlEeR6v8n4T4cF4d?=
 =?us-ascii?Q?nMV6ZH1T/IMpgHtn0O6yxjfNl3yndkg0jTs/Peeeia5IHJ9jN4Qj3rfqivGn?=
 =?us-ascii?Q?Mo5y/9aKHWXzZZ2O9UxMpfOpKqS/LkjDtdW1YiLiYAGl7rSPU6Sb1SdqmF2M?=
 =?us-ascii?Q?u8dbjj4YHzsQbHwJvIJPtx1tDAnTCTPsPY0LLGqf6oqF2TmK704czImIL0cr?=
 =?us-ascii?Q?E6OtbXXjkH3BSa23d7TdKaFiWNnZsmfPGp3reZ2cI5YDYKSeQk8A637DJ1fk?=
 =?us-ascii?Q?n2qjlQpTADW+WYCQwycSthF/O4YYVUDxhtwV2/uzvqdrDUpoy6kF27Iod/sB?=
 =?us-ascii?Q?dGmLP1ssiW0aKR5goImZJIp9zNsxJ4mvIwfwtIJuUrYFiPauZSEVZqW9+fSA?=
 =?us-ascii?Q?1bZogo0x0NJE2rJ/rkFxn6ipjLWHrQda5T9pbO2hFglPLnv2qQxkQGhCFjV8?=
 =?us-ascii?Q?e3eY0SIwIKpuZuaOW9Ic4IOoXKwR/3mAGem60ulX31ESvqF/Al52In37W4uo?=
 =?us-ascii?Q?Oj0inktXDBf31o6iIohFcOk1yDh5kb7ix0lW/JApWTZyKDDBuewgDpWIaPRa?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f4cbfc-def0-408e-5b47-08dcccee5809
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 14:32:03.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYjAOABvVVXxBC/ZW7YSvDohei/B5PWdtl9UAACOGNel7IKKrPoxJBKh9oFglpirazxnxteVauFYUXf6MkqoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: a785bd692830a550059b5a7d45c29a1411fa6f03 ("mm, slub: cheaper locking for percpu sheaves")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r3

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | 07f91c64db | a785bd6928 |
+-------------------------------------------------+------------+------------+
| WARNING:inconsistent_lock_state                 | 0          | 6          |
| inconsistent{SOFTIRQ-ON-W}->{IN-SOFTIRQ-W}usage | 0          | 6          |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409042217.1a3005e-oliver.sang@intel.com


[    1.603339][    C0] WARNING: inconsistent lock state
[    1.603854][    C0] 6.10.0-rc1-00013-ga785bd692830 #1 Not tainted
[    1.604494][    C0] --------------------------------
[    1.605033][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[    1.605514][    C0] swapper/1 [HC0[0]:SC1[1]:HE1:SE0] takes:
[ 1.605514][ C0] eaf78664 (&pcs->lock.llock){+.?.}-{2:2}, at: kfree (arch/x86/include/asm/preempt.h:79 mm/slub.c:5013 mm/slub.c:5411 mm/slub.c:5558) 
[    1.605514][    C0] {SOFTIRQ-ON-W} state was registered at:
[ 1.605514][ C0] __lock_acquire (kernel/locking/lockdep.c:5091) 
[ 1.605514][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5756 kernel/locking/lockdep.c:5719) 
[ 1.605514][ C0] kmem_cache_alloc_node_noprof (include/linux/local_lock_internal.h:30 mm/slub.c:4449 mm/slub.c:4638 mm/slub.c:4696) 
[ 1.605514][ C0] alloc_vmap_area (mm/vmalloc.c:1985) 
[ 1.605514][ C0] __get_vm_area_node+0x8e/0xf8 
[ 1.605514][ C0] get_vm_area_caller (mm/vmalloc.c:3155) 
[ 1.605514][ C0] __ioremap_caller+0x1c0/0x2b4 
[ 1.605514][ C0] ioremap_cache (arch/x86/mm/ioremap.c:438) 
[ 1.605514][ C0] acpi_os_map_iomem (drivers/acpi/osl.c:296 drivers/acpi/osl.c:355) 
[ 1.605514][ C0] acpi_os_map_memory (drivers/acpi/osl.c:379) 
[ 1.605514][ C0] acpi_tb_acquire_table (drivers/acpi/acpica/tbdata.c:158) 
[ 1.605514][ C0] acpi_tb_verify_temp_table (drivers/acpi/acpica/tbdata.c:320 drivers/acpi/acpica/tbdata.c:308 drivers/acpi/acpica/tbdata.c:400 drivers/acpi/acpica/tbdata.c:504) 
[ 1.605514][ C0] acpi_reallocate_root_table (drivers/acpi/acpica/tbxface.c:182) 
[ 1.605514][ C0] acpi_early_init (drivers/acpi/bus.c:1257) 
[ 1.605514][ C0] start_kernel (init/main.c:1064) 
[ 1.605514][ C0] i386_start_kernel (??:?) 
[ 1.605514][ C0] startup_32_smp (arch/x86/kernel/head_32.S:292) 
[    1.605514][    C0] irq event stamp: 190
[ 1.605514][ C0] hardirqs last enabled at (190): rcu_process_callbacks (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:67 (discriminator 1) arch/x86/include/asm/irqflags.h:127 (discriminator 1) kernel/rcu/tiny.c:126 (discriminator 1)) 
[ 1.605514][ C0] hardirqs last disabled at (189): rcu_process_callbacks (kernel/rcu/tiny.c:115 (discriminator 1)) 
[ 1.605514][ C0] softirqs last enabled at (0): copy_process (kernel/fork.c:2336) 
[ 1.605514][ C0] softirqs last disabled at (187): __do_softirq (kernel/softirq.c:589) 
[    1.605514][    C0]
[    1.605514][    C0] other info that might help us debug this:
[    1.605514][    C0]  Possible unsafe locking scenario:
[    1.605514][    C0]
[    1.605514][    C0]        CPU0
[    1.605514][    C0]        ----
[    1.605514][    C0]   lock(&pcs->lock.llock);
[    1.605514][    C0]   <Interrupt>
[    1.605514][    C0]     lock(&pcs->lock.llock);
[    1.605514][    C0]
[    1.605514][    C0]  *** DEADLOCK ***
[    1.605514][    C0]
[    1.605514][    C0] 1 lock held by swapper/1:
[ 1.605514][ C0] #0: da2faddc (rcu_callback){....}-{0:0}, at: rcu_process_callbacks (kernel/rcu/tiny.c:130) 
[    1.605514][    C0]
[    1.605514][    C0] stack backtrace:
[    1.605514][    C0] CPU: 0 PID: 1 Comm: swapper Not tainted 6.10.0-rc1-00013-ga785bd692830 #1 d4ae42ad2625ef0b26b1eff40697d310314756c0
[    1.605514][    C0] Call Trace:
[    1.605514][    C0]  <SOFTIRQ>
[ 1.605514][ C0] dump_stack_lvl (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 lib/dump_stack.c:117) 
[ 1.605514][ C0] dump_stack (lib/dump_stack.c:124) 
[ 1.605514][ C0] print_usage_bug+0x1ff/0x2d8 
[ 1.605514][ C0] mark_lock_irq (kernel/locking/lockdep.c:3971 kernel/locking/lockdep.c:4013 kernel/locking/lockdep.c:4216) 
[ 1.605514][ C0] mark_lock (kernel/locking/lockdep.c:4678) 
[ 1.605514][ C0] mark_usage (kernel/locking/lockdep.c:4567) 
[ 1.605514][ C0] __lock_acquire (kernel/locking/lockdep.c:5091) 
[ 1.605514][ C0] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5756 kernel/locking/lockdep.c:5719) 
[ 1.605514][ C0] ? kfree (arch/x86/include/asm/preempt.h:79 mm/slub.c:5013 mm/slub.c:5411 mm/slub.c:5558) 
[ 1.605514][ C0] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5756 kernel/locking/lockdep.c:5719) 
[ 1.605514][ C0] ? rcu_process_callbacks (kernel/rcu/tiny.c:130) 
[ 1.605514][ C0] kfree (include/linux/local_lock_internal.h:30 mm/slub.c:5013 mm/slub.c:5411 mm/slub.c:5558) 
[ 1.605514][ C0] ? kfree (arch/x86/include/asm/preempt.h:79 mm/slub.c:5013 mm/slub.c:5411 mm/slub.c:5558) 
[ 1.605514][ C0] ? kvfree (mm/util.c:681) 
[ 1.605514][ C0] kvfree (mm/util.c:681) 
[ 1.605514][ C0] rcu_process_callbacks (include/linux/rcupdate.h:339 kernel/rcu/tiny.c:94 kernel/rcu/tiny.c:133) 
[ 1.605514][ C0] handle_softirqs (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:261 include/linux/jump_label.h:273 include/trace/events/irq.h:142 kernel/softirq.c:555) 
[ 1.605514][ C0] ? __lock_text_end (kernel/softirq.c:587) 
[ 1.605514][ C0] __do_softirq (kernel/softirq.c:589) 
[ 1.605514][ C0] call_on_stack (arch/x86/kernel/irq_32.c:57) 
[    1.605514][    C0]  </SOFTIRQ>
[ 1.605514][ C0] ? irq_exit_rcu (kernel/softirq.c:647) 
[ 1.605514][ C0] ? sysvec_irq_work (arch/x86/kernel/irq_work.c:17) 
[ 1.605514][ C0] ? handle_exception (arch/x86/entry/entry_32.S:1054) 
[ 1.605514][ C0] ? __refill_cfs_bandwidth_runtime (kernel/sched/fair.c:5600) 
[ 1.605514][ C0] ? exc_nmi (arch/x86/kernel/irq_work.c:17) 
[ 1.605514][ C0] ? default_send_IPI_self (arch/x86/kernel/apic/ipi.c:248) 
[ 1.605514][ C0] ? exc_nmi (arch/x86/kernel/irq_work.c:17) 
[ 1.605514][ C0] ? default_send_IPI_self (arch/x86/kernel/apic/ipi.c:248) 
[ 1.605514][ C0] ? arch_irq_work_raise (arch/x86/include/asm/apic.h:465 arch/x86/kernel/irq_work.c:32) 
[ 1.605514][ C0] ? irq_work_queue (kernel/irq_work.c:85 kernel/irq_work.c:112 kernel/irq_work.c:124 kernel/irq_work.c:116) 
[ 1.605514][ C0] ? call_rcu_tasks_generic (kernel/rcu/tasks.h:383) 
[ 1.605514][ C0] ? call_rcu_tasks (kernel/rcu/tasks.h:1113) 
[ 1.605514][ C0] ? __wait_rcu_gp (kernel/rcu/update.c:430) 
[ 1.605514][ C0] ? console_unlock (kernel/printk/printk.c:3082) 
[ 1.605514][ C0] ? rest_init (init/main.c:1459) 
[ 1.605514][ C0] ? synchronize_rcu_tasks_generic (kernel/rcu/tasks.h:645) 
[ 1.605514][ C0] ? call_rcu_tasks_generic (kernel/rcu/tasks.h:1111) 
[ 1.605514][ C0] ? rcu_tasks_pregp_step (kernel/rcu/update.c:403) 
[ 1.605514][ C0] ? rcu_init_tasks_generic (kernel/rcu/tasks.h:1112 kernel/rcu/tasks.h:2100 kernel/rcu/tasks.h:2207) 
[ 1.605514][ C0] ? kernel_init_freeable (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:261 include/linux/jump_label.h:273 include/trace/events/initcall.h:10 init/main.c:1371 init/main.c:1567) 
[ 1.605514][ C0] ? kernel_init (init/main.c:1469) 
[ 1.605514][ C0] ? ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1.605514][ C0] ? rest_init (init/main.c:1459) 
[ 1.605514][ C0] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 1.605514][ C0] ? entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    1.605552][    T1] Running RCU Tasks Rude wait API self tests
[    1.606243][    T1] Running RCU Tasks Trace wait API self tests
[    1.606879][    T1] Performance Events: unsupported p6 CPU model 42 no PMU driver, software events only.
[    1.609554][    T1] signal: max sigframe size: 1760
[    1.610998][    T1] devtmpfs: initialized
[    1.615226][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    1.616356][    T1] futex hash table entries: 256 (order: 1, 12288 bytes, linear)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240904/202409042217.1a3005e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

