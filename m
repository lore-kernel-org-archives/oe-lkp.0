Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAE20D4FC
	for <oe-lkp@lists.linux.dev>; Sun, 12 Jul 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865149; cv=fail; b=MDPfOtbe87kr6zIkKidtRR1GnXZLw67LD+FSHOUGWqnSwk8JUlRgllHtQCQ4YGnfDVxqlZ59qgjTrRof1ZuXUUvJxcnBgYADdA29dXQOYtpg72lT/1h2W25io3NCQvQO3oA0WRxmM/BUFld8pdfjgXtEU6imgi1Ty6yFIqVxtTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865149; c=relaxed/simple;
	bh=0y3pPJNgvlROSC8ds83W2ClCduXYe86qXGDKrwYbDZw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WoNKG2ZTxNnL4a7I+mVbx1mF7bqg9IiKG+njJt4GG2W4q7nN00BHdcQiYpYnRCHE+sNPf7mSKIQbIEmAWrvUCTnG+Mt+tkylEoYAJo/uiVoF2/ZpGtsbR07fBG9D+nO9xDoCZzrjpzz5+on9zvQ0fuDF1VmNINQdQxNEup1114Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKGNQLx4; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKGNQLx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783865147; x=1815401147;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0y3pPJNgvlROSC8ds83W2ClCduXYe86qXGDKrwYbDZw=;
  b=lKGNQLx4AVw/ipHNJ0DAY39lhR0hYlLDoV0TZ71EhxhqIUrBkaPIIkSP
   1GHFfAKynFQPGwXR61tRoAhvwEUFze7pMrsaRVf9h8mlYRfNRMyGtOx6j
   cp5BxeR0dS39Figc7l7MyRh13FA1+erYB817TFP1UCrt83q/4NWRc3WD8
   SyGSPwlMogcP93xmOWyT6lTJsu0Oq+7QqjRnPlkxf7B9DIXhF+zaFDhrL
   N3dvhnc9OzR28Fh0mcoATdlnNODV/BmjAoHiQBxnPSaNFph69/ovHpzVj
   1EY7pOWAFYZr3m3++klect8RNr78iy/vdz2Nb65lfkne0galW8Zr4pl96
   A==;
X-CSE-ConnectionGUID: DPK0OpnASzS4DIAqeAMhdw==
X-CSE-MsgGUID: P93F7UPuRp6jlnFkFbXrbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107294512"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107294512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:05:47 -0700
X-CSE-ConnectionGUID: azjI4nj6T7K4wk0Q2+XmGA==
X-CSE-MsgGUID: nj5Roj0lTbumie+KdsIM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285408668"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:05:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 07:05:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 07:05:46 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 07:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGlBqHEqWd7NbyzrTjTUSRKvecRUrrB8diR/YV0bAhcJcIiF4qnDwuPahBHKFcul31bjFFQ6wAth+4Oy5pYO6/qWV2FWZZlHFr8A3JE0cJvZlN2cnWoGZs1bnUYEGDF6NJmjAcFwD6AJmyl3hzvvF+Q+6TbmdPEP3Af6jR3/Bx41D9XoY42bLEP4KUG4zzWG6XBNexIjYTI1fzskgWwJt8bM+NDnT/WbWl4XNeGxZzzowdxWDNyl/oyErwCRtSspe/TMHwhpPTvgqJbS1nXu7ycT7Pdu9fv7OpyX2+uGjZQWOfzzVji6lctmQmzZkVbZE7JVb3QAU36FJ9cTt7aukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEGciBkbz/aKbXzB+sOCI3alfrHpCEs3dUgH2jOl/V8=;
 b=vMlFZ+XTPzYH7xA5+5t5ssXTmRw/HGjArQ0/NZ5Fi7aTehsXVSU2S0wC8v3rkikb1iV+AH2qdFiPH1Fjz2qvXhcDAr1spoBXdq+ejULop064NPMbJwEfvkAcztd4N00vQA4qGJ71UrcVm01qCMoL+AoT5WSFLaP8Y8ajEebwTCDiVvfm9WdWFEJ8i8GgfBdxP/QVhdctrel856fgUlRbp1zx2jWduUQqOo3JyvrokRfPGiyrk65kHv1YpwLZ3VJvvJuk5XlP7bQdxgLJEMXqu5VG84NQouaMCGdkSO7MD+bAjZhNHiy/BLmJSRW2AxioIZIjbupu1JKCpl+9PbIUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DS0PR11MB9479.namprd11.prod.outlook.com (2603:10b6:8:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 12 Jul
 2026 14:05:42 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 14:05:42 +0000
Date: Sun, 12 Jul 2026 22:05:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [posix]  acc071343d: stress-ng.timermix.ops_per_sec
 4.1% improvement
Message-ID: <202607121506.f2debecc-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DS0PR11MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 866b612c-9f33-42e6-46e3-08dee01ea88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: Hfphb/uCQ1t+9b0UuzChgFdTvzjrzhU0r7+76wB0YLemkEKYYZhbcyBnKQ+3rLb9KPUu68aCVSyvH90DUO1beal5ULf3Poa6nCzBqJIUhjYgSGPOo6DmzUTTdSOkpRFGCjwjt8FCdwkMlO25cf0JKSKyAtWfKPkWaXUjd8LWCu44wzevBkH58gTyhnyOW3GXe4yFd5GA8qaoxNVtQFIx0wUGTZP2MW2/XIOEKtFNz17478MLin8GSSvUqvBWnQG16XJ3H3RdugsdvU92Zkobq8Aq0h5Ue/vROoKhDmuJzig+3s7YvS9NGOMvUkmGw2Q6Ye9pdzobcWpY9TMn9svTxfIx81BnUGEvr3zhnuaNJueiLtidsyuTT0Ue9UlB66jvW1Z2lUjt/aiqefjUKiHHe+czSAalQJsceTkw8OMduaGvW5cUQ1EjpTIgrPUjmNWE7MWe4p8jJjGyA4eo8NnzO0su+EvIWiY/sMK8Q/ZJ7N8NPvapl9L4Ki9veB3pqbQ76FNYlPMOy0VI8VMnMpV5C8lriAsXn7EXntbBgfGpQzfW8YU7LEklSoEfFsQBs6VtrZsc77jbqwHEpDVabIzAiQGKvgVSUzZsJBByzT0j0ahRNo4RHrBmXwsIWcTPgZ5l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VGfPmRoxv/GWmz5Tm1uqUxqdej3BY01gM7zl219pZTzJIybgbn6BV69l7f?=
 =?iso-8859-1?Q?os5UqM3/QC84K1HksUQsc1ZoZ7rUFgkBnYO0/1Ss3WALcmNwbnx1McauJ4?=
 =?iso-8859-1?Q?toNfIT45xSMtIqleN7sxowpmV+XQlG2TmkcF8CeGQBAD3D2f1M1t3ffrQj?=
 =?iso-8859-1?Q?qfsVt1L9gUFG/ggooj6XQLZ8KB6vEEHp6t7hdC6x1n/OKsr7yKUqxvAKkj?=
 =?iso-8859-1?Q?xg123nLTo7P5iYJKxuN64y0ZgHpymTBSDdUf6pBtOj4DL3rJcgXpO5i928?=
 =?iso-8859-1?Q?8h2pA2B0aiT4bQJPhLLY1fuwccJJowuyihcQDHTeRAv5Wd59a3MwV0yaDO?=
 =?iso-8859-1?Q?ZySRI1nMkChE8UUMclKddw6NLbfJumhWevVEfKCJPBv8jkkOhzeotqgMnh?=
 =?iso-8859-1?Q?rj3aHvHUnAYN76RuKH2np65vzJqfBrZi8ipA8p3uf1kq8a2uDk7OiYcQN1?=
 =?iso-8859-1?Q?l6Od3b2+3T5J7eKn1ktFN/RwhuPYuIXGcrUVDLiFNlg2HOMaQON49fQJUx?=
 =?iso-8859-1?Q?Vv1I+zJ8e+5ABVt8S2WbP3AO+BHQso+q4UAnm7JT6oKDXOD7yj6lrvHEJ3?=
 =?iso-8859-1?Q?54Bmbd3gHQ5rmHbJWJ04GMaF6YnF5Ry4Jbppj5ano3SfhmrRX82ByeeiL1?=
 =?iso-8859-1?Q?YROzH35wLZp8SrBRtxqRh37VPcaGWcWEtVXMIcE0SFpFn7z+RTQG8V3042?=
 =?iso-8859-1?Q?nroJjah/oUT6XeB8X54yLw8wBR1hluXnPsPPmVAXvtpVf83dNWUMsdHU1m?=
 =?iso-8859-1?Q?eNpE3FNM9TKRXcZtPZl6DFvsEsd3kc5FypFXN/OzWafEMv/JEwcrMnct4v?=
 =?iso-8859-1?Q?o6d4+RDIqVrN56iaYVLiZHNkZ0CXEGmX+PoGv/70E/YmGdZTyMX2Hfz2Sv?=
 =?iso-8859-1?Q?fVaY55absM9IBSvd80UMi4JZJYgBSMDLqrVaw+GRn9DhPIRi5GP7n8nVdB?=
 =?iso-8859-1?Q?F/jbK94PjcuexmaxgVAc7qGgQ7y0sxIykHW17tl0lBLHuOlcmip6cffXb+?=
 =?iso-8859-1?Q?nWMEVdfdP4qx/dLY5yEKZR+KjtA0z+zLvKm8kNYk1t7hFQAUBQvvkSdJ7A?=
 =?iso-8859-1?Q?iF3dq9vYPW7vqksUKkuMq5UmkpP1In2V91gpAubj0vWULoMZ4GuCp7Obdy?=
 =?iso-8859-1?Q?Y0JLpwRv5GBwbiWaaj3IVIo4OuU6LVu8SlqoeTWfBv710r9XXIndB4nBwi?=
 =?iso-8859-1?Q?tNU9awjNB7ZsiFrY/1Y8MibT23/mbLtHGfBTby4p8/Dm2ONvlnxRBEiSl+?=
 =?iso-8859-1?Q?C5PI/qGS7SLRKNlC5GWk/IBLcxNy+W6+sQXH/586tjM/eQi4aZZ5IhJ7Lo?=
 =?iso-8859-1?Q?YvJji9G1dtf/pS6Y/pb0j86ximKrmXF0qmOqvbweTFMbdis4yvESrUMHRp?=
 =?iso-8859-1?Q?QOBNGnCKLIz6RAsXdpvyjTSX2YMUm3zA9f3ehPOkFQktmu0KefKFCk5BAB?=
 =?iso-8859-1?Q?ssit8C7a1ev4P5wNPyFItofzZ3o1KwQO7Yz6FsRvLSTxAf24lCNBbh4AwP?=
 =?iso-8859-1?Q?JjzlODx5HxY+hPdYOO77BYwLa+vSqtZ6qxLZDesizAg/ZQFdNKaGIVc2tz?=
 =?iso-8859-1?Q?kxV3kzeFFzI5fLxW6nu1aE3vvQBxiqPO/ht6qQUzdRuAO9OM/TujI2mJJI?=
 =?iso-8859-1?Q?LtE3Vvcl4pkzZnwp96Pm4eJVOiDpGrWpTDe/s5TlrmeKqVzgdS6vdjGFN3?=
 =?iso-8859-1?Q?77iqsqC1dLsbxaP1H+zMUQqzAoupkrP/n8iYvg25BUU/UI5EMCrcVdAU4D?=
 =?iso-8859-1?Q?k4EzbWV5jZcVzcCXEnERD1hDU2TVkj7HLpRuboNW+JGudKBrOz2RvHVO8Z?=
 =?iso-8859-1?Q?CKj+gCiDug=3D=3D?=
X-Exchange-RoutingPolicyChecked: LU5Q1Lw3qs3YJ6+RMzmzq/bVVzmCYkgxZ+I81me9fL+ZfQbU5Aglp0yOQHi8TMyYapovOELZ+ZyEnxQWzp/rjh4owZ1Z1zbEIVLMw6CJ7yOcYdCaGQ1rYwNf9src9xRMVfTIL+aozI5ge4u2m0Hp+2/6vOGYXzMcOeO3TZi/OuQQG39uVwp5nE3uFWK6pAVSXNXmQ7QVXUZqKxc0YDTBaOr8mmt0cIUtG5g2pr/S5J8Cc28Wy6oyvlmJTxMPufj3Nag+kpfQ+ceUF9AuEc1ySufR2Th3NNGneJMF2/eP2BLo/eKS6BofXZp6EPA62AyNckHauTE09JzuGPTQoe3h/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 866b612c-9f33-42e6-46e3-08dee01ea88f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 14:05:42.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5TJPqJ88kThAzs1ND0FsFiXk1ZWlDmbCb76X6xhekgNlKiiJZkNB6ZCYcoXChc8/A6ArvYyKFmgkFC0yuE69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9479
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.1% improvement of stress-ng.timermix.ops_per_sec on:


commit: acc071343d29c2361619b05ad50ea3de9ef9a3ac ("posix-timers: Switch to hrtimer_start_expires_user()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timermix
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260712/202607121506.f2debecc-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/igk-spr-2sp1/timermix/stress-ng/60s

commit: 
  cfb7fe3fdd ("posix-timers: Handle the timer_[re]arm() return value")
  acc071343d ("posix-timers: Switch to hrtimer_start_expires_user()")

cfb7fe3fdd4ca1d3 acc071343d29c2361619b05ad50 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     19156            +1.5%      19440        stress-ng.time.percent_of_cpu_this_job_got
     10436            +1.0%      10545        stress-ng.time.system_time
      1074            +5.7%       1136        stress-ng.time.user_time
     96626            +3.9%     100414        stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
     96678            +3.9%     100466        stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
     96928            +3.9%     100722        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
     96557            +3.9%     100354        stress-ng.timermix.CLOCK_TAI_ticks_per_sec
 5.222e+09            +4.1%  5.435e+09        stress-ng.timermix.ops
  87053077            +4.1%   90597493        stress-ng.timermix.ops_per_sec
      4959 ± 10%     -36.3%       3158 ± 45%  sched_debug.cpu.curr->pid.min
  80029448 ±  2%      -9.4%   72474185        vmstat.system.in
     12.91 ±  2%      -1.1       11.84        mpstat.cpu.all.irq%
      8.22 ±  2%      +0.5        8.74        mpstat.cpu.all.usr%
      7303 ±188%    +339.4%      32092 ± 46%  proc-vmstat.numa_pages_migrated
      7303 ±188%    +339.4%      32092 ± 46%  proc-vmstat.pgmigrate_success
 5.184e+09           -10.5%  4.638e+09        turbostat.IRQ
     15.62 ± 30%      +8.7       24.36 ± 17%  turbostat.PKG_%
 6.708e+10            +2.2%  6.854e+10        perf-stat.i.branch-instructions
  98238988 ±  3%     +12.8%  1.108e+08 ±  4%  perf-stat.i.branch-misses
      1.67            -1.2%       1.65        perf-stat.i.cpi
 3.568e+11            +1.9%  3.637e+11        perf-stat.i.instructions
      0.61            +1.2%       0.61        perf-stat.i.ipc
      0.14 ±  2%      +0.0        0.16 ±  4%  perf-stat.overall.branch-miss-rate%
      1.65            -1.3%       1.63        perf-stat.overall.cpi
      0.61            +1.3%       0.61        perf-stat.overall.ipc
   6.5e+10            +2.3%  6.651e+10        perf-stat.ps.branch-instructions
  92701741 ±  3%     +13.1%  1.049e+08 ±  4%  perf-stat.ps.branch-misses
 3.458e+11            +2.1%  3.529e+11        perf-stat.ps.instructions
      6.11 ±  4%      -5.2        0.92 ±  5%  perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
     12.38 ±  6%      -2.8        9.61 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     10.16 ±  6%      -2.2        7.91 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     23.29 ±  2%      -1.1       22.20        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.65 ±  4%      -0.9        3.74        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
      3.90 ±  4%      -0.8        3.15        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      2.30 ±  4%      -0.3        1.96 ±  6%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      7.37            -0.3        7.06 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      7.40            -0.3        7.10 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      6.82            -0.3        6.52        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      7.07            -0.3        6.77        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      1.00 ±  4%      -0.3        0.72 ±  5%  perf-profile.calltrace.cycles-pp.__hrtimer_rearm_deferred.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
      4.50            -0.2        4.25        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.57 ±  4%      -0.2        1.33 ±  6%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.81 ±  4%      -0.2        0.58 ±  5%  perf-profile.calltrace.cycles-pp.clockevents_program_event.__hrtimer_rearm_deferred.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      0.93 ±  3%      -0.2        0.73 ±  6%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      1.08 ±  2%      -0.1        0.93 ±  4%  perf-profile.calltrace.cycles-pp._copy_to_user.copy_siginfo_to_user.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.75            +0.0        0.79        perf-profile.calltrace.cycles-pp._copy_to_user.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      1.12            +0.0        1.16        perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.05            +0.0        1.09        perf-profile.calltrace.cycles-pp._copy_from_user.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.00            +0.0        1.06        perf-profile.calltrace.cycles-pp.set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.34            +0.0        1.39        perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.58            +0.1        1.65        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.58            +0.1        1.66        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.84            +0.1        1.94        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.61            +0.1        2.76        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_timermix_timer_action
      6.00            +0.2        6.24        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.12 ±  2%      +0.3        4.38 ±  2%  perf-profile.calltrace.cycles-pp.__restore_fpregs_from_user.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.51 ±  4%      +0.3        1.82 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.copy_fpstate_to_sigframe
      4.92 ±  2%      +0.3        5.23 ±  2%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      3.00 ±  8%      +0.4        3.35        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame
      2.29 ±  9%      +0.5        2.82 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.copy_fpstate_to_sigframe.get_sigframe
      1.32 ±  9%      +0.5        1.86 ± 12%  perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      1.34 ±  9%      +0.5        1.89 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.00            +0.6        0.56 ±  5%  perf-profile.calltrace.cycles-pp.ktime_get.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +0.7        0.67 ±  5%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal
      7.81 ±  3%      +0.7        8.51 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
     17.95            +1.1       19.00        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
     35.94            +1.1       37.06        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.76 ±  3%      +1.3        9.11 ±  2%  perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      9.09 ±  2%      +1.4       10.52 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     29.22            +1.5       30.76        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.00            +2.6        2.61 ±  2%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal
     10.14 ±  7%      +3.6       13.72 ± 13%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     10.10 ±  9%      +3.6       13.70 ± 12%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     14.34 ±  7%      +4.3       18.65 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     14.65 ±  7%      +4.3       18.97 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
     17.06 ±  6%      +4.4       21.50 ±  9%  perf-profile.calltrace.cycles-pp.sigpending
      0.00            +5.6        5.56 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      6.87            -5.5        1.42        perf-profile.children.cycles-pp.common_hrtimer_rearm
      5.40            -5.4        0.00        perf-profile.children.cycles-pp.hrtimer_start_range_ns
     28.99            -2.9       26.08        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     13.45 ±  2%      -2.8       10.61 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irq
     24.52            -1.4       23.16        perf-profile.children.cycles-pp.get_signal
     14.74            -1.3       13.44        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     69.70            -1.2       68.48        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     70.10            -1.2       68.89        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     12.32            -1.1       11.26        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      8.96            -0.7        8.22        perf-profile.children.cycles-pp.hrtimer_interrupt
      6.42            -0.7        5.69        perf-profile.children.cycles-pp.clockevents_program_event
     88.79            -0.5       88.32        perf-profile.children.cycles-pp.do_syscall_64
      5.45            -0.4        5.01        perf-profile.children.cycles-pp.__hrtimer_run_queues
     89.22            -0.4       88.78        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.12            -0.4        4.69        perf-profile.children.cycles-pp.fpu__clear_user_states
     10.43            -0.4       10.00        perf-profile.children.cycles-pp.native_irq_return_iret
      3.40 ±  2%      -0.4        2.97 ±  2%  perf-profile.children.cycles-pp.copy_siginfo_to_user
      3.78            -0.4        3.38        perf-profile.children.cycles-pp.__hrtimer_rearm_deferred
      3.65            -0.3        3.33        perf-profile.children.cycles-pp.posix_timer_fn
      3.04            -0.3        2.76        perf-profile.children.cycles-pp.native_apic_msr_eoi
      1.52            -0.1        1.36        perf-profile.children.cycles-pp.irqtime_account_irq
      1.84            -0.1        1.70        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      2.52            -0.1        2.38        perf-profile.children.cycles-pp._copy_to_user
      1.12            -0.1        1.01        perf-profile.children.cycles-pp.sched_clock_cpu
      0.96            -0.1        0.87        perf-profile.children.cycles-pp.sched_clock
      1.02            -0.1        0.93        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.70            -0.1        0.62        perf-profile.children.cycles-pp.error_entry
      0.61            -0.1        0.53        perf-profile.children.cycles-pp.ktime_expiry_to_cycles
      0.74            -0.1        0.67        perf-profile.children.cycles-pp.native_sched_clock
      0.52            -0.1        0.47        perf-profile.children.cycles-pp.irqentry_exit
      0.50            -0.1        0.45        perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.26            -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.tick_program_event
      0.16            -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.hrtimer_reprogram
      0.20            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.09 ±  4%      -0.0        0.07        perf-profile.children.cycles-pp.__hrtimer_reprogram
      0.19            -0.0        0.17        perf-profile.children.cycles-pp.hrtimer_bases_first
      0.14            -0.0        0.12        perf-profile.children.cycles-pp.irqentry_enter
      0.60            -0.0        0.59        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.14            -0.0        0.13        perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.09            -0.0        0.08        perf-profile.children.cycles-pp.sched_clock_noinstr
      0.11            -0.0        0.10        perf-profile.children.cycles-pp.sched_core_idle_cpu
      0.14            +0.0        0.15        perf-profile.children.cycles-pp.rb_erase
      0.17            +0.0        0.18        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.30            +0.0        0.31        perf-profile.children.cycles-pp.x64_sys_call
      0.22            +0.0        0.23 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.do_sigaltstack
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.try_to_wake_up
      0.37            +0.0        0.39        perf-profile.children.cycles-pp.hrtimer_forward
      0.27            +0.0        0.29        perf-profile.children.cycles-pp.posixtimer_queue_sigqueue
      0.49            +0.0        0.52        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.48            +0.0        0.51        perf-profile.children.cycles-pp.prandom_u32_state
      0.31 ±  2%      +0.0        0.34        perf-profile.children.cycles-pp.prepare_signal
      0.34            +0.0        0.37        perf-profile.children.cycles-pp.timerqueue_linked_add
      0.87            +0.0        0.90        perf-profile.children.cycles-pp.__get_user_nocheck_4
      2.06            +0.0        2.08        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.28            +0.0        0.31        perf-profile.children.cycles-pp.rb_erase_linked
      0.42            +0.0        0.45        perf-profile.children.cycles-pp.ktime_get_with_offset
      0.42            +0.0        0.46 ±  5%  perf-profile.children.cycles-pp.collect_signal
      1.48            +0.0        1.52        perf-profile.children.cycles-pp.signal_setup_done
      0.75            +0.0        0.79        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.20            +0.0        1.24        perf-profile.children.cycles-pp.__local_bh_enable_ip
      1.11            +0.0        1.15        perf-profile.children.cycles-pp.set_current_blocked
      1.27            +0.0        1.32        perf-profile.children.cycles-pp.recalc_sigpending
      1.00            +0.1        1.06        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      1.68            +0.1        1.74        perf-profile.children.cycles-pp.restore_altstack
      0.98            +0.1        1.04        perf-profile.children.cycles-pp.complete_signal
      0.51            +0.1        0.57        perf-profile.children.cycles-pp.__remove_hrtimer
      2.18            +0.1        2.25        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      2.33            +0.1        2.41        perf-profile.children.cycles-pp.__fpu_restore_sig
      2.39            +0.1        2.46        perf-profile.children.cycles-pp._copy_from_user
      1.92            +0.1        2.01        perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.76            +0.1        2.86        perf-profile.children.cycles-pp.__put_user_nocheck_4
      1.96            +0.1        2.06        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      4.67            +0.2        4.85        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      5.73            +0.2        5.92        perf-profile.children.cycles-pp.__get_user_nocheck_8
      5.63            +0.2        5.85        perf-profile.children.cycles-pp.restore_fpregs_from_user
      2.91            +0.2        3.14        perf-profile.children.cycles-pp.posixtimer_send_sigqueue
      8.06            +0.3        8.35        perf-profile.children.cycles-pp.fpu__restore_sig
      9.72            +0.4       10.08        perf-profile.children.cycles-pp.restore_sigcontext
     37.92            +0.5       38.44        perf-profile.children.cycles-pp.x64_setup_rt_frame
     14.64            +0.5       15.17        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      0.37 ±  2%      +0.8        1.22        perf-profile.children.cycles-pp.ktime_get
     20.36            +0.9       21.30        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
     31.01            +1.2       32.17        perf-profile.children.cycles-pp.get_sigframe
      8.63            +1.4       10.00        perf-profile.children.cycles-pp.posixtimer_deliver_signal
      9.82            +1.4       11.26        perf-profile.children.cycles-pp.dequeue_signal
     17.96 ±  5%      +4.4       22.33 ±  9%  perf-profile.children.cycles-pp.sigpending
      0.00            +6.2        6.24        perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      4.19 ±  2%      -0.8        3.36 ±  2%  perf-profile.self.cycles-pp._raw_spin_unlock_irq
      5.85            -0.7        5.20        perf-profile.self.cycles-pp.clockevents_program_event
     10.42            -0.4        9.99        perf-profile.self.cycles-pp.native_irq_return_iret
      3.00            -0.3        2.72        perf-profile.self.cycles-pp.native_apic_msr_eoi
      1.80            -0.1        1.67        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.68            -0.1        0.60        perf-profile.self.cycles-pp.error_entry
      0.76            -0.1        0.69        perf-profile.self.cycles-pp.hrtimer_interrupt
      0.53            -0.1        0.47        perf-profile.self.cycles-pp.ktime_expiry_to_cycles
      0.70            -0.1        0.64        perf-profile.self.cycles-pp.native_sched_clock
      0.53            -0.1        0.47        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.66            -0.1        0.60        perf-profile.self.cycles-pp.__hrtimer_run_queues
      1.12 ±  2%      -0.1        1.07        perf-profile.self.cycles-pp.copy_siginfo_to_user
      0.48            -0.0        0.43        perf-profile.self.cycles-pp.irqentry_exit
      0.36            -0.0        0.32        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      3.76            -0.0        3.72        perf-profile.self.cycles-pp.fpu__clear_user_states
      0.22            -0.0        0.18        perf-profile.self.cycles-pp.tick_program_event
      0.14            -0.0        0.10        perf-profile.self.cycles-pp.hrtimer_reprogram
      0.22            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.38            -0.0        0.34        perf-profile.self.cycles-pp.irqtime_account_irq
      0.31            -0.0        0.28        perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.29            -0.0        0.26        perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.20            -0.0        0.18        perf-profile.self.cycles-pp.__hrtimer_rearm_deferred
      0.17            -0.0        0.15        perf-profile.self.cycles-pp.hrtimer_bases_first
      0.17            -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.sched_clock
      1.73            -0.0        1.71        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.12 ±  3%      -0.0        0.10        perf-profile.self.cycles-pp.irqentry_enter
      0.16            -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.22 ±  2%      -0.0        0.20        perf-profile.self.cycles-pp.posix_timer_fn
      0.12            -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.irq_enter_rcu
      0.07 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.__hrtimer_reprogram
      0.21            -0.0        0.20        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.10            -0.0        0.09        perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.14            +0.0        0.15        perf-profile.self.cycles-pp.__check_object_size
      0.11            +0.0        0.12        perf-profile.self.cycles-pp.kick_process
      0.19            +0.0        0.20        perf-profile.self.cycles-pp.set_current_blocked
      0.29            +0.0        0.30        perf-profile.self.cycles-pp.signal_setup_done
      0.32            +0.0        0.34        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.15 ±  3%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.rb_erase_linked
      0.26            +0.0        0.28        perf-profile.self.cycles-pp.timerqueue_linked_add
      0.42            +0.0        0.44        perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.43            +0.0        0.44        perf-profile.self.cycles-pp.restore_sigcontext
      0.32            +0.0        0.34        perf-profile.self.cycles-pp.hrtimer_forward
      0.44            +0.0        0.46        perf-profile.self.cycles-pp.prandom_u32_state
      0.25            +0.0        0.26        perf-profile.self.cycles-pp.try_to_wake_up
      0.36            +0.0        0.38        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.22            +0.0        0.24        perf-profile.self.cycles-pp.posixtimer_queue_sigqueue
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.dequeue_signal
      0.93            +0.0        0.95        perf-profile.self.cycles-pp.fpregs_mark_activate
      0.41            +0.0        0.43        perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.29            +0.0        0.31        perf-profile.self.cycles-pp.prepare_signal
      0.47            +0.0        0.50        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.42            +0.0        0.44        perf-profile.self.cycles-pp.ktime_get_with_offset
      1.90            +0.0        1.93        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.85            +0.0        0.88        perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.19 ±  4%      +0.0        0.22 ±  5%  perf-profile.self.cycles-pp.sigismember
      0.40            +0.0        0.43 ±  5%  perf-profile.self.cycles-pp.collect_signal
      0.61            +0.0        0.64        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.77            +0.0        0.80        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.23            +0.0        0.26        perf-profile.self.cycles-pp.__remove_hrtimer
      0.71            +0.0        0.74        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.74            +0.0        0.78        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.58            +0.0        0.61        perf-profile.self.cycles-pp.complete_signal
      1.30            +0.0        1.35        perf-profile.self.cycles-pp.check_xstate_in_sigframe
      1.32            +0.0        1.36        perf-profile.self.cycles-pp.get_signal
      1.21            +0.0        1.26        perf-profile.self.cycles-pp.recalc_sigpending
      1.20            +0.1        1.25        perf-profile.self.cycles-pp.do_syscall_64
      1.32 ±  2%      +0.1        1.38        perf-profile.self.cycles-pp.stress_timermix_timer_action
      1.34            +0.1        1.40        perf-profile.self.cycles-pp.sigpending
      0.85            +0.1        0.91        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      1.74            +0.1        1.81        perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.75            +0.1        0.82        perf-profile.self.cycles-pp.posixtimer_send_sigqueue
      1.65            +0.1        1.72        perf-profile.self.cycles-pp.get_sigframe
      2.33            +0.1        2.40        perf-profile.self.cycles-pp._copy_from_user
      1.67            +0.1        1.74        perf-profile.self.cycles-pp.__put_user_nocheck_4
      3.93            +0.2        4.08        perf-profile.self.cycles-pp.__get_user_nocheck_8
      4.60            +0.2        4.79        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      8.17            +0.3        8.52        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      0.00            +0.6        0.57        perf-profile.self.cycles-pp.hrtimer_start_range_ns_user
      0.36 ±  2%      +0.8        1.18        perf-profile.self.cycles-pp.ktime_get




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

