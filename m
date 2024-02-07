Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68661D551
	for <oe-lkp@lists.linux.dev>; Wed,  7 Feb 2024 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707289066; cv=fail; b=CLjSwYTBQA7E37wkZdZv4dh0aTU23sNoYFDOYzNdqGcgn+dxuRZu4DRe2sQvjqLrAQbAejxYtSp6ThVhjuLa0CTgfnjSQ6QKPhoz102127QkcVNelpc3Wn/bGtqEg44LRfERKiNkM0BUuTHJxeMuMHDj/Io3cICNze8lyKipp5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707289066; c=relaxed/simple;
	bh=rl+IxRc0hjMEjtAqDbLdN5m8/zqyoUOUW9HjRA+7LXs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EEbPPqtjpKnOjsFI5bbIBXz3n58kPDLeauK4Q+n46fvx+D6tZNR1uI66AAFxEYFD2sKAhjAA3bxBYwF8+EBuxZmKwF9pvjHH8GfVjpVVqaOtQdfBh00uRjD+sA0abZhlmD4ZGxTyL+A+F+XyUGcbbjTOPgG7Xx3u1LBlvwjgAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpkPsdpf; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpkPsdpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707289064; x=1738825064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rl+IxRc0hjMEjtAqDbLdN5m8/zqyoUOUW9HjRA+7LXs=;
  b=cpkPsdpfJ0GfrlUGkgXGmkXFwlsCXJtdihmE1aC+XeHOQgxc6OclN635
   Qw6IDHZQ1OXGbIrBG7tiS49fktSeU34Nd3ulayPn+Q+moxTlgZcd3R4nY
   SC3TX+WNfVP/6Uf/dtEGO0mbNC2/7ZCq3OtlyHs4dngf9ya5Aw5mLAdiw
   NEJphb2uHIZ0KRJXnEfufco4xF7+Cfzl9QHxVHJ/wTivE+uGiLq1ucprg
   dtD0CF1p/pF7RGfFfNtiXN/Y6L0n73k3XEqflewnuNDG3hYio7+Ct+5CS
   EnLcNAAqVuV1D4GUaGLOOooJ5cqqmwAAVZEKPzO3YSoqNUliX9ccrTW2V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12008586"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="12008586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 22:57:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1555978"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2024 22:57:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 22:57:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 22:57:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 22:57:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 22:57:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+HLombYBmuohgiQS8k+EYlhYVWOBT/JLe/q72g2Fve3DeSYy/gLiUJ1tB/UonhikyQVJSKSHJwdRFPNBsAVH+lCVm2QpN6OPyK/9ePsOzicVL7xv/Q64/7I4dik2eWuLue2UL9sXrOKcmAtu79xF9xcM1kiJxk2Ls29ILVsX0M8aYJ2oXpI0IXhiQeb/ypjo3DdCmuLYIkGRN1FUa0AFeoXObMNgIc+G7h9jA6eyrC0aN0Qt00kwtO1DGvJPll3h2piQXuyAPOQbDiKycQK6MEXeewZ4nAZeW9PDsGGj1xX56hxcNuNtyD7j9t9BytntBieioKZP0TtNgC4XN6n/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaAsw1vDaRach1Q1TW1eYASYXkR6If7RlkjVE5E89rs=;
 b=WwSLiGARpxEPUqeaFrYjgy+7Z2RR2xQgUcQA3nJeD8Hud3ozr7eyv1ARLOWfRfwFgebBr2yhhFCP3P3ABsOtroDPHK9TNpEpYsuCriZ7BZtI8f+zG9NZDAkHxNZTVHe75nAyE6ZVRdLhLs4JcY8OnHmc6TGlnmz//+a0CPPx9ub89/N1vcb4PCUkHxLCt8dO9nulfnwIVdXbhH8Bxsgl1yiz/7NDnhgye2Rr63gHg18c4XjGhOZ8ILvwBIZzrtFvmr6B8FadkwIb0QtRLsw8uRMAGXrQXb5SZi86zhJyGdJFHmv2DSpzWpUjbaCLFJEOt8Xt3DSKJanntotC+Fs8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 06:57:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 06:57:34 +0000
Date: Wed, 7 Feb 2024 14:57:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_v3_0113] 5e887f0037: errno 12 (Cannot
 allocate memory)
Message-ID: <202402071438.a5c1b77a-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f80b3e-e0ce-4d24-b820-08dc27aa0f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvOL/ntoQ8c6FNztbdZxhT7ofT2Nv2Zu0jm8e2IG9173lDfBbhxPV4etXApzcLyCl+/GiXj7gvuUaoJ48z4pkKofgQ9cGspNkinx/iSbEZl1VYxB03IU2leikVmCmTIRUJSqZT5jIKDVXlszeHSUS0LbxDpKdOrpu39rpM0feqwj9fgINrE5vHu46l+CXPJ9vCCkZmZlvGsgI6oRFZ6r3jBJwQ3GVUYWkyGN8oxbsjxfN7w3/ErhXRs80G+EbVGohWyQKPGKY0EMdamGAMAYj1wnGwFVc9btyhWyPDTszEdDiszLTVER5NPhJQkgEgd7cIgKq4rfXcf1N3PsNiIsE2o/m38/YL0gkB5NXUhpoo1wCdb3REsngYa7R5nwq9PW45IheyI7AmT0b4W1d11pN8eGsvZEI6yU3UyJE3x4X9ELFLwNvrbkjdu7r9UetRAh8KF1s9G6x8Fazm6SMhiLwmnhuEfZdqZDtfjm5GUGUYGHC9ybZoHUKDGkLeIJvqPMGVIeNznm+3IjwSMS2KEOaE6NaVjDGlMZC3dNgrow2dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(66946007)(8936002)(966005)(66476007)(6486002)(66556008)(6512007)(36756003)(6506007)(6916009)(478600001)(6666004)(8676002)(4326008)(316002)(2616005)(38100700002)(26005)(86362001)(82960400001)(107886003)(1076003)(83380400001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Itiwz19ijTS6IDn/nZEcZoc8EERBOe0uCCwUYJnOM5XnZyc/SlARXyaBQMND?=
 =?us-ascii?Q?Llzl/5VXa5WUHryaiagJKnpwr/xMOq2K784qVqiDYcYDiCbYkg0zNGTKKdeF?=
 =?us-ascii?Q?yRZ/IrXL59bvV1NiBEhsCwkU0Xo7KshLft276K0anIMhabUN7vyCuhI8nkcL?=
 =?us-ascii?Q?6voPbdwBlETcxV7ksVA6zFSDRU/Cp/q7lCODR88La+4FZIndNo5lxYKBs1sj?=
 =?us-ascii?Q?QmcxR/u7HIQTXZ/+LoNZMj3lElk11yIQjwCTI66XTeQiiHqHeSYkHYSNy83B?=
 =?us-ascii?Q?RpsvVHTLBg+SA5UkMpZeg8TSwd05jwT2CO8WPGoz/3QGh1IexJ30GCC8e/J0?=
 =?us-ascii?Q?QcG66H8EA7ODtEN/nayVsS6m2ci6eiwcx3/VZ7e6QYQA1V3ar/PsfjO02RXs?=
 =?us-ascii?Q?ggdkr78iRdW/8Xd8KHUQrrVjo6sbhI51KZcdg6vji/rCpHdvA4e7XFP4HRlE?=
 =?us-ascii?Q?Qee8aSNzu8y7/7rAXRkKqYXVme2ZU2J352DDmsykTg6zHVOmjbHOtzWDbtKi?=
 =?us-ascii?Q?uSq19HepQqgE5AZvs4r8xQyeTm6O+lbAQU2RBGLADoUPEPVdu85rt5j7otZ6?=
 =?us-ascii?Q?q62pvCiil1HfaiLkxkVzEFXDXyp/dIdRBcV1ew2qNRsDgyBMb03FdKxx5ymN?=
 =?us-ascii?Q?6W69YOjlTa3RNGg5R26gaaZSRNPltyX/ApC6LMmlc2M/0ZNcypyR8nllaAiI?=
 =?us-ascii?Q?2sGeuatVe4kNYNDgOr+nvea5ECv2yHfyIy9G+09FqWiS3eajjAdgmu4Zkr9Z?=
 =?us-ascii?Q?bGl8kkGjpNl26BeFgT5ON2xa0hUYiToQcYeIcFWbFQO8nfoRpBwzsk1f3D44?=
 =?us-ascii?Q?1K051/aOi2B+y0LQa/9+Gsf5rv37uLXk6AvQq1AG9Xu+4JCnB93IX6lbIk8h?=
 =?us-ascii?Q?W93KcHDWEiFmZUS3TD+tcNTETIsGPzwz5yyhoX52Xf9bgbQN+UGk3efNhgkt?=
 =?us-ascii?Q?nxwhwknV+YaOQxTEp2bRvufcEvKng44+FXfuP/Fy6Vq9aAcHzuwZK1kmjA+5?=
 =?us-ascii?Q?ljtVV6MBEwf9ppcLqXqL+kYn+rtUjs6lwO8d4O5MhOck3najPCdVlZlMpIjb?=
 =?us-ascii?Q?31vrNAJX5xPK5SPhDe19ouA7F2nNaq+xWkeR8TpVymV9dJjRvFKc78bnIrXm?=
 =?us-ascii?Q?sT2XxPj00KY63QZnr9TH12c3ypmh4Lrt0U4wzXHSrcbV0w6ZcPUmYyKwpANv?=
 =?us-ascii?Q?cScNg2zgpcLQmc0+BuVDD2umabbs8Jl7JaWe/c1Pw4zX1g/1W4fb2+mccEZ/?=
 =?us-ascii?Q?SfwW8erIaQRjx5uEzqzAOTXz7qSMPegy/bvsQ9hh8oPhOxz1IyE4b74Y+DJY?=
 =?us-ascii?Q?BJclSbz7qzvDDrnQXGiBSeOQJXJWx6VkwY2an7ryw9MYDJI1I//3XLFexIuw?=
 =?us-ascii?Q?5sTN2WbL5+b+pHppzQeTASHYKTzklSNpzxHFSmP3O4B4V/MI5vz5rSw+zcN+?=
 =?us-ascii?Q?jlFme/yvwDvyVNjGK5DGiicutpLH4Zh7ZtZxjlfqo27YyOCtculHm9XNpTBJ?=
 =?us-ascii?Q?6RHO/Ibvi9Kx/rEzQJQr/WEf6EO2Lebfj7rSxjac8K1539cg0IVz+8EHXfow?=
 =?us-ascii?Q?7SNoo+1qzcTcbgTNgKM8RjpRquFicPavWdcfQ8uw8O0hmn+i5I5ImzKHpZQP?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f80b3e-e0ce-4d24-b820-08dc27aa0f0d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 06:57:34.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB2jybz+5OL+Yl5VLkaKQhOCvwEBbPnh2CY5EqZs7HpM1bUDs6pWl76RximEna5LuwuaiwR1xDKqGbGR+tDY8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-OriginatorOrg: intel.com



Hello,


we reported 
"[linyunsheng:page_frag_v3_0113] 5e887f0037: stress-ng.sync-file.ops_per_sec -6.8% regression"
in
https://lore.kernel.org/all/202401312212.f0f4517c-oliver.sang@intel.com/

now we also notice other issues. below FYI.


kernel test robot noticed "errno 12 (Cannot allocate memory)" on:

commit: 5e887f00379ac36883e4ef0ef418b2401686ebc9 ("pcp alloc opt")
https://github.com/gestionlin/linux.git page_frag_v3_0113

in testcase: filebench
version: filebench-x86_64-22620e6-1_20221010
with following parameters:

	disk: 1HDD
	fs: btrfs
	fs2: nfsv4
	test: createfiles.f
	cpufreq_governor: performance



compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402071438.a5c1b77a-oliver.sang@intel.com




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240207/202402071438.a5c1b77a-oliver.sang@intel.com


(we didn't observe below output on parent commit)


[   41.525004][ T1410] Job for nfs-server.service canceled.
[   41.525007][ T1410]

....

[   42.280398][ T1408] Feb 05 08:22:46 lkp-icl-2sp6 rpc.nfsd[3939]: error starting threads: errno 12 (Cannot allocate memory)


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

