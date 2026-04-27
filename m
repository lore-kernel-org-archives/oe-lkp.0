Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED3364E81
	for <oe-lkp@lists.linux.dev>; Mon, 27 Apr 2026 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269561; cv=fail; b=JvDeiA6KsT1v3Q/+2lZYoNuMGA+ORjMm67WiNAbMFArS72ll2bHxE7YHc7VLZyrGp0my+I+5JYJiTzclf6MBB7Fi8GbssPMAzBrGpWbNhTHkrPzM0MjBRT6VL1hzJMvY7rBILH7xGja0+sPLer7gWJ8OSeUWdhNjttmbIbyjBJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269561; c=relaxed/simple;
	bh=rhTc4xfPFYH1jl7MQu6/LrrOBskoaRSYS0xJnvShtOg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=czkYPFpu/rsdjqCXgPiSG4vciqRrU9ecDrBl9hmAoAqCa8eewQsRQRSNEYG17iXbrJPXafzmUfXwgEqHxziLUAwpoMaUqQyILIAnJzL565pEBlFEs5c7f/5Yo6RbY4LwhrESNE+Djd6WjxBhymhEJSSebftUIXCVu0k5ITbV+XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3OT2dEm; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3OT2dEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777269559; x=1808805559;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rhTc4xfPFYH1jl7MQu6/LrrOBskoaRSYS0xJnvShtOg=;
  b=a3OT2dEmaZeRhPSaT5ZZ5Xyvs6zRc/PPFR+jKbJMbK/aFoEm8GFmE/q5
   Bv2wte0cMXTXK+G3pqNcBBJperiFVQE8g95HySXG3f6x6os7hAhf2ystm
   zbc4NKFYo0vIxODm+ZLqGVVHyBuwMklw4OfQwHN83UMW3o/z/smdvxjCO
   8WFKBz+2RIzFFkZspzIiZ0qqrloF+edndwicOBGGt+ra2XtRl+3CvM9+g
   uW+qMZ3IM41aoTSwdFSRX4iGOpuaRvovSHY6hHe8ZIrp94BCjuZPxqgko
   g28OQWJXwskTqzpFHd/0qsgatmo8H5xSZuhIIMr1U8DvYCTej8Juj0YTz
   w==;
X-CSE-ConnectionGUID: 4xg8yQn0Qsq7mYTjfujCmw==
X-CSE-MsgGUID: a1N1gKCnTEC0ouAYfkDM8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78024090"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78024090"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 22:59:19 -0700
X-CSE-ConnectionGUID: olASkpuMRtqmDMCA1sEeVw==
X-CSE-MsgGUID: awd4VTBTSv6a4FZShJ/zLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="257060940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 22:59:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:59:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:59:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxmH/1D/HrQ3VRUoFB3buC+/9OOZHk9d3Hb02xOabLrB1np26pkXXmeMpnkyFiM4V8kHcmOgE3N8pk2bBXwWHLZ+6eAKrgGX4/47byhlJd4Gy2Egd/wzUgWTS0IAIETzL7kqre8vLt/HwKdT9fpq9UA28Dld0KD+BpO3OFxIPzQ9XhtwnbGX93W47wepfO+buNcj+5ijffWzHlGfW83anpZ4mCxKqdgXDnkQH8MIoIUEiapeksJljosn5g54ovfFjvVFOQxMokwGQSVCv51tviLZJhobNQOoa2Rz641aMby4Gs1BWP5BOVx3fNLQ9ZGsMNZi0t6Ocl8YcZft4cn18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJqFGJaw17a2Wzp8CjGJ7cGU8Q8pCriorJnoX7kKjdE=;
 b=Fn0FN5icz5CWXvqTX0OnhEQZNae4LO5IzfQkqED9VugNs6yhW5XLwqIqtHOCvEy6QtRiopmrrKO+PUxVGQPtwF7rBhhYn8reH8IbuXVXnaAas1vYAAb63zp+LgesYeB+J5W0gTWlmkCxcX17aD0RdzyE1gBv2Cjrb2PjrxHz8QZweevh4SQXUExKpU3hwjFtTBU0MnM/JAVwDopRt88SSf8wgcwy2q9g/ewEj4Oa7mQu4kkDM5hS6oLg2XQzLYTifuzBdmqyvibILNq6QU/Sup2/vRcYcz2ixOSxglpPb1O8r+jCY4wBIBiqbglBtrit0MegBy/E2dzpFcLXDtd3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Mon, 27 Apr
 2026 05:59:15 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.012; Mon, 27 Apr 2026
 05:59:15 +0000
Date: Mon, 27 Apr 2026 13:59:08 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@kernel.org>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [sched]  96d1610e0b:
 will-it-scale.per_process_ops 2.8% regression
Message-ID: <ae77LJYKc7Ujpi2j@xsang-OptiPlex-9020>
References: <202604241448.365c92f9-lkp@intel.com>
 <20260424095523.GE3126523@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260424095523.GE3126523@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 495b6578-9cb2-4aa2-23de-08dea4221ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11006099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2iPh/fxWjtcf7c9r+SE+DRVIk9TG/AxS1e0UQQEboT7MyCcFoNq7eZV/lR7etyshB2LqWr9ho/3hfWsq079eIblMXXynVwG/oNa76r73W7+TPah1DsPSAR2uBDSNlXCDAkYLRGtl2xJTDg0Zvd1BUKXT5exRds52lQvq7Ff79Ku4AWRIq7+PG98h8F84rcJbACSAZ9J97iRvKN7gCfGRVMxcAPA3WvuFkgio59WlML/DrHXL6qrRAYMzmrn44FNSyBIKt5o1AI7JDiHq8X6f8nm03tnw3C74Bp2UwEfXYQfnXQZdBSRJzvjiPzBpU8YjjO5GHeJZttjYinTHNJDmnxI77G+gkXp8ph/nsQmerKROvDjZ+geGWY3K/F8hD0bMrWHBqRnYVfHCsL91/4ayljHRPojyyRqYv8BNQLGCRN+snzu1j+4/k1oe9P0dysRyOeMcFR1tB6K/NyyEsbNKT0JudTr7wBRk9jnXa4kfUBce2743hUr7FMlmJcJbxRTZSqIBF/XCl0GgwS+DDEvr/d/OFs8rQ6M7NMRQEEmTyMbhNTZj2392WgiURuZtdajjW0XZPYGYnZqqVDGabkkIVDcQTW2qmYgxP780hOUyHP1+uLmZeQoBTPr/ULU+xRygL+wVeTx8ZKhBVrj2ESuQy4w8peEAKYfBSAMWGNqDNnfEsOn8JPy+wqjrUUmeKt7cqkLFXHPFxs5CKSiFV624Yar05DwapeW1o73FKswZc0U+ulXnLxmf3sKhS/fLpvWY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11006099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/U6Te+VLPFKvLzPwJBwR+vYYIGxYb0X6y1UYKpuA5BvIE9YgOIBbGPMA2Ud7?=
 =?us-ascii?Q?/rU16Mh1YcwU0CkZu+Y6PbTaD5mIYyqVB2krQXLt5X2f7OQB6rOTcG9+FjLP?=
 =?us-ascii?Q?58MlTSvvuAU/DcKGoEYkyiNzlyjD5mbu5VfFlCVxuq/9eTt02qErdW3O4/Mg?=
 =?us-ascii?Q?vjqMkKkB0nbcoEZbUj+ULiyRJ4NsLPge0j6vuyWE5CgCYEp5Rl2De+Ch0E1V?=
 =?us-ascii?Q?g2RU7bztIXSBcn77EiCKZNXQnekcKWILTGv9LFLdus1oBsk1CSIEptgX96on?=
 =?us-ascii?Q?6+QsqWGjgbiaCfKeBnUhHZZVuD9GqAsYrsmSMIvI49ioPGjgmnjKxU+nQ7z5?=
 =?us-ascii?Q?TGRmjGhOjNufSXWFbXKoiVnm+vy71WNlrtB8PQtvlnCMecP0NQbP14ZUQ8p0?=
 =?us-ascii?Q?jjUWZGzWLXCngAdDyCbibu+IEzuFWD83VtG9Uo6z5a5yISHpKHIUz2147Xa6?=
 =?us-ascii?Q?9iUnF7w0+y0RgTnwnioWGb1xolLKc7ijZhjlyHmpx43RHUywf+WPJ/9vtSRZ?=
 =?us-ascii?Q?2MhKD0ZQE+dbOdKvP0IsGzAw8+XBNXXAxthKirzolt0XqP3ivZlEARqcRZJb?=
 =?us-ascii?Q?4Ef54kO2BoYvMXs00p+ur/EGFEISl48xxrwzIOw9bD1uAOe2V36qQU5Iel8S?=
 =?us-ascii?Q?ljXt088D8c9rtnCZDY5rqb/X7X9A53wSJNb3ho7nRZD4pzOMpc3YQPsZ5dvQ?=
 =?us-ascii?Q?k1/kOolBb6KZaTninpYUx1g8z5sAz/t7iHvZ3GBWuTrup9jv02r/6k0Pu1UF?=
 =?us-ascii?Q?TZ/WOzOUpJGlgpko2I1LXPHsuOJCEvlWn8uHjAoydsC990dpJJwPu6bs6maL?=
 =?us-ascii?Q?3dxjjV79bpkJTV/cmRrZrTfReQAXZaskdEGV2SmScMIqbjJ1UDCUynj0l5Ow?=
 =?us-ascii?Q?UqVfRGMRacFPt8h6F3Sj+TYhADL2cJIZ61N50+GG7Tv3SDiPIDJperKchKXT?=
 =?us-ascii?Q?Uk2TyMjdSvtst6F2UN8WaS5F/6726Nhc0TQ+JdVYReFBh6iXq+TWgFlq+BWN?=
 =?us-ascii?Q?TKUNgbAWsfvJUg7UtIZQzfuSR5CF6Kvh/zmDGcc1W7E8dIn+c6/Z1It+E3mG?=
 =?us-ascii?Q?BWWABAiKKTBMohHLIG/gtP3o46HZQg2YmuVjkYnSn7T+K0d3C7aPu5YrMOaM?=
 =?us-ascii?Q?GRePC3xAJvowP8z4nWdZH0nMsEU7gBOZKCBIHbeyDaOS+PX/RWuU/ebsaYrA?=
 =?us-ascii?Q?3QNCR1Tdgcm3WpZ6h+Zn5xKz3ubpDT9LE0Hc5S7QNQJR0z31DP76Y/zgoQkH?=
 =?us-ascii?Q?f0zPqt6XVOpE2lAxejLlK2/MTc/qTCnTs0Lgi1Dtpnt9VtW9oQao7y7VWhVj?=
 =?us-ascii?Q?q/BcZ/nnQGuYhOQZv+9W/KOBEbti1bUCmLO7hoAgfYL8D60YqNGvFN+FkRzC?=
 =?us-ascii?Q?3lH4QzciSEBCsSXzIDbmd0SYXa1IJrM3ZbZxNIkf0zkZej6Au3ppo/aOACrX?=
 =?us-ascii?Q?+LQsEa7EXil3quMmJeTT6aUfVB3P22dbZHIZuSg0n1og+m1gtiK9ITfiEO7R?=
 =?us-ascii?Q?qdUGfyD73YnP+h00iRD86UhCfymw4eO9hq/QQ3uGzISXbnujzmCaJreNFlPH?=
 =?us-ascii?Q?XC8+RWvslSg5sSY4Hy0KF8gRXSQhP1zboPjdvgBVwXfs/osKnTan/imlFBIR?=
 =?us-ascii?Q?4lts76NlYzTkERyljQ2Hpwz7Err8uiNop6BUb1k9xBej+oiRjbCCwd9pkRyE?=
 =?us-ascii?Q?aFawvJj2MfdlRy4OOKx13eY4w94DiaUJF9rvxfwXrYHxu5zeRx9zcZpXU6bI?=
 =?us-ascii?Q?fSjHP2bAbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: R1L9EIVCg191W3pC4X1V9cgd+U88LOjjR4BNaS6m6ExrZ+jJ1u/FhJv7rKIugP4viTAjrEWBTbABVfxyySdSboQZGF7f5pMs0wxy8rbSi9jKh1eaYlEIT7ABK4+7FUoPpyhYTllxhTzG1mAg99o9aGPpWUJ+j/gP15gY6DupPF0Lw68GV2U1LVA1Kfg9boQ9Y1GLhxiVZQkv9QRpN0eQPq+x9fqliwY0aiUboRvYy3whKA5x1j87A2QaY3XkB8/F1VceG7TvnEpxVblgXm+03mF9GgVZuqBGOPbdjtbnDuWcQKE5TVxcGaIEauY8IhFjgDkRGCj2PmQYQcAcnOayDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 495b6578-9cb2-4aa2-23de-08dea4221ca2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:59:15.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh1yR6ukr4xKExREloOyryUpBh+iP5qpBXXrGs14l8x943B/qx2ZUQhhzlrjCZ80gWV9h+JpH17ds8LtWaqBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Fri, Apr 24, 2026 at 11:55:23AM +0200, Peter Zijlstra wrote:
> On Fri, Apr 24, 2026 at 03:10:07PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 2.8% regression of will-it-scale.per_process_ops on:
> > 
> > 
> > commit: 96d1610e0b20b5a627773874b4514ae922ad98f6 ("sched: Optimize hrtimer handling")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > [still regression on linus/master      1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2]
> > [still regression on linux-next/master 936c21068d7ade00325e40d82bfd2f3f29d9f659]
> > [still regression on fix commit        eef9f648fb0e92618041f019d4bdcf7ae17cb743]
> > 
> > testcase: will-it-scale
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> > parameters:
> 
> So this commit has lived in private trees (tglx and mine), has been in
> tip, in next etc. *WHY* do we only get this report now?
> 
> This isn't the first time I see a regression report after things have
> hit Linus' tree. This is starting to get really annoying. The point of
> having this robot was to catch issues *before* they hit Linus, no?

there are some difference between kbuild/boot tests and functional/performance
tests by kernel test bot.
kbuild/boot tests could be triggered directly by repo/branch changes.
functional/performance depends on so-called hourly kernel merge to trigger tests
and bisection (due to resource constraints).

for this commit and related branches, we did generate kbuild/boot reports.
including e.g. kbuild report [1] and boot report [2].
(
for [2], the reported fbc is acefed487add3, the commit "sched: Optimize
hrtimer handling" is the tip commit of tglx-devel/sched/hrtick branch at that
time

* 1f963bc350a6f sched: Optimize hrtimer handling    <----
* 8bc0da68c41a3 sched: Default enable HRTICK
...
* acefed487add3 x86/apic: Enable TSC coupled programming mode
* c903d7114698b x86/apic: Avoid the PVOPS indirection for the TSC deadline timer
)

after reviewing the history, we discovered that both reports originated from
direct repository/branch testing, meaning these branches were not merged into
hourly kernels, causing functional/performance tests to be skipped.

most likely, merge conflicts prevented this change from going through the
functional/performance pipeline until it reached mainline.

since mainline serves as the base for the hourly kernels mentioned above,
the commit will have more opportunity to go through functional/performance
testing after merging into mainline.

Thank you for bringing this to our attention. We are now considering
improvements to address this gap in our testing coverage.


> 
> That said, looking back at will-it-scale reports, 2.8 seems to be pretty
> much in the noise range, no?

this test supplies stable results. for parent commit:

c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json:  "will-it-scale.per_process_ops": [
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    238895,
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    237238,
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    237558,
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    238616,
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    238299,
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-    237793
c3a92213eb3dd8ea6f664d16a08eda800e34eaad/matrix.json-  ],

for this commit:

96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json:  "will-it-scale.per_process_ops": [
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    231051,
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    232241,
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    231346,
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    231058,
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    230174,
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-    232143
96d1610e0b20b5a627773874b4514ae922ad98f6/matrix.json-  ],

We will conduct additional verification.



[1] https://lore.kernel.org/oe-kbuild-all/202602171013.VyR8FIZ2-lkp@intel.com/
[2] https://lore.kernel.org/all/202602181118.929e4694-lkp@intel.com/
