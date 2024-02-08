Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897A6931B
	for <oe-lkp@lists.linux.dev>; Thu,  8 Feb 2024 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707376326; cv=fail; b=tgZc8lH8YOGGcL/RUMZnoj63oi6DnYudxd7uonyXIUb1koMoQnBFg8dOnQxQlLBnJdsHoAYDQR5vZI4ozLvGlF+ajaAVByGV5InUt70Cx+u97hfuSFf3DyXBPspvt2QiTjdV/8zV7tS+nOojuxeTzQ+QGghunEp9KgmId5oir1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707376326; c=relaxed/simple;
	bh=t+F4S/AkBpK+2vBkwqfNq4mFbdj4vLpqp1/uqaId0uQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iWkl9E3gaql7dWKEWpmVBdhu7DQoGQpNUI6qeEgEVlGbu0/8gyBeUzK+UYa+S/mlrNkTvQCq8MXlZ+s0r8TdqNtvoNo5S8GrsnSVTcl5Xv0i/1hMfk/XVhfKRemUvT6HXNoQ3UxrhkC8R1WL/fLlXhcSFKDgdUyvBEj2G+3HJHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fafcZgDS; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fafcZgDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707376324; x=1738912324;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t+F4S/AkBpK+2vBkwqfNq4mFbdj4vLpqp1/uqaId0uQ=;
  b=fafcZgDSDoZ6bA8puge6AoJ3yiWHDdJJqqygHiVnz6VUWcscv7rgH6Ig
   gloI5OCVljiOTnhYWaEhmVCBkPWqe9ptJ5RrXP0NU1Pz1LzEOnZ8x60Rj
   X631efFCkjwj4Y8yRP9eNatYGvg/4ci1PacxGkRSeJhsgI20J9PRsHAe2
   ptNJ1g4GnfwuvD4XfkH7gy7iMPBvWAYJAMpQYvCwE9akJUmW4RbPqqWAv
   7aAfL/2/mY+dXMHN2UeBOz0tNg3R1qBLeD0RnKyliMg0joVpi0Gm3Ow+t
   hpR5Qqc69cJS9rdfDPpLtPVJIh2LEEF/GfhY3GoLWEateazeI4aCIKgBq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1306532"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1306532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 23:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6238133"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2024 23:12:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 23:12:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 23:12:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 23:12:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 23:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tk+kiDY4UCASpzXPM+yI+bZ6sjfdo4hudS2yuv75rBYZDFTQFeKBCtN/6iVDIQIAxfbUM8roFZpayLQ32rGnINAyBprOQUMzfyjAj98j1B3oNhXDpYRGH1XCcSoN6V+62sSk/tzE6OgB9xgyrk50y/YIkeWuF8zi3q42/u5dsGSAqxBE7+Kmm+lf53cx7Cq7vbbjpJLsnIyWwLay64zLsMkxu82Es2qRsddUgogDcdgkWdWAfXXu4OSuPwJqtoIW6UvfID6QSwT5Yn7tI4GrkgC5iUGk91YgFGFA+lSJ5SzrwMWdK/RyzNqfS4I6ix6n5eEzWlYe8kbJj5hafMevIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfIWgCWAWQfHO8YjnVBhF6nPEhXoDR2/+LImQlbK0z0=;
 b=ismT/vAWxwAsvoSgyMHZ9ZOVigJjjpm5Xj4RP/bjYzO6f9oKkp05dUKn4oEg9Y7YjeGv6ekMx1Ti2Mm/LmGiezzkhwlbcQi1ali/Qqy1j/911vu9/OY57lVpI9Fpse3XSpbvMzLp8a6H/gB0dypvrrEkuHHpowkFkInrx+5CEB9mXt7kp+DmsLbjatpbrunynUEfhfLcskrAzKunBLNnLv4brapTnYeDIvomeow2ZRp6kXL1YbbYkDQv1VCqDv/4KKGrVGSccup0twlWWrDtwINQjTtK/yvxFEbL5aegrKck4lMN1koJVE+r1Nr2O/w8Mf939wTb7qXmFLhvdF0RJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5676.namprd11.prod.outlook.com (2603:10b6:510:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 07:11:53 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 07:11:53 +0000
Date: Thu, 8 Feb 2024 15:11:45 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fsnotify] 9c13a708ef:
 will-it-scale.per_thread_ops -4.2% regression
Message-ID: <ZcR+scdiyu7OZexO@xsang-OptiPlex-9020>
References: <202402071553.75bfbe67-oliver.sang@intel.com>
 <CAOQ4uxghgvmSzN_twab00xyUh=+0UJ79_pn-tjW1Ob_s1-zroQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxghgvmSzN_twab00xyUh=+0UJ79_pn-tjW1Ob_s1-zroQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b8ce4a-f2a7-4014-e2f7-08dc287539f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbWw/Cf+P8E/DaITTrgVhcrWaqm4IBMA41GzAmfM+hoPPYjnexbbazy9l9eEmWaRzhLrLRg6Ik/oaF2gc/8zO0KWgO4JP1samSR+MaH6LwNquopq9CUFhZB8x/dWnvSoebr6az6ywtKznYyjlKdW+c36hoZuXkyEVqW3q5DDprAPh4DUJHkZMwMLKhFf1irZQsafsck8HakPWtQKHZ15ms57iURPcWVX/9Ft+vLMLx4Z1muz00S4tVlraQaTk5YevztLwk1Cvc56iQcF1UupdcoCfcSUKlYoatuRcrZDVqFt4B6XFw7KUcRHDlmLHBXC2eQt/ar9hmIl+aodJIoZkim9BEbdZSH6UqB6A3Kiq6w+rO4H4HL50Bx+7D4hlnwO+lIl/qqOZ86nInqgX2QIF5EsIO2IhEGCakrRzslqoB0XQl/Ynsr1PQ3hGE1F3HMQmiutin/NsLFXOhm4taTA/1d05f5OP63tVmXwP5vobqb4kZZOsmMcX4h6bnqy2QMeFrdIMduMbCgAhsEMIS/HdFAhZywdMvcQH9JyTQcSohQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(33716001)(316002)(66946007)(6916009)(66556008)(66476007)(5660300002)(478600001)(8936002)(966005)(6486002)(82960400001)(86362001)(26005)(38100700002)(8676002)(44832011)(2906002)(30864003)(6506007)(83380400001)(53546011)(4326008)(6666004)(107886003)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkRpOTQ1aWVTZ29WTzZxL0FXeEs5K2JIZVBvRkdNOFVJbld1eGNEZmxZVkxv?=
 =?utf-8?B?YUpzZHlqbTV5bEl6Q21TMHN4Snh4VUZHcVRGQjJrVWNpQmp6TkVzZXFZcnJq?=
 =?utf-8?B?b1cweG5IYlZsOU1IS0Y5RlNnaUJSQVU0YlRCKzJyU2ZGVXpLOVRGcExKYlRL?=
 =?utf-8?B?TXVocWZUaDdVamhST1hFd2tRWmFRUzk4MUcvalJJSENEdVNKeTRHRCtqU25N?=
 =?utf-8?B?WDhGU0F4NmFqTUhUTXoyV3RXQ2JOMmZmRXo5V2N0dXdWbXk1ekVKY0g0bHh2?=
 =?utf-8?B?VWc2NjdEcldlQXU2VlcwNjZOT3loT24vYWZUSlFhV1pUcndna0FYYS9KNWhk?=
 =?utf-8?B?WjdkeVhUaGpyTVFPVXVqVCs5cUcyUlpvRUVBTHROc2dHeWNQYk5zOVpDbUY2?=
 =?utf-8?B?ekVSNkIrK0gvTnhFSFYyZC9qa011Y2RaS3lwbGQ0QVNuQjQvWTBGUkthSENs?=
 =?utf-8?B?c1AwNFU1aWxqNDh5ZE1nbC83ZjI0SXZYNnpiejIyaU9jSUs2dElYOWVtaCtG?=
 =?utf-8?B?K2hVSGJxV0J2cDRzRm1kY3JBN3h5YzFNeXEvZG43SzJCcHVUTFdJV1UyZ0pl?=
 =?utf-8?B?Y2hqaFQ0TEh2M3JSdDJTcm5YWjRZb1cxUFYyOFdpZVIrREkydE01aStwaWFh?=
 =?utf-8?B?ZEJoNzNNdzhreWh6elZHVDV1QVI4RWFJdlN6eE9qMExsbzZhNWk0TFl3VmpC?=
 =?utf-8?B?QW04eHJMc0YrYStNV1QrNGh0N2FTM0huMk1NOHNKU1JPMURnb0cvc2doaXpm?=
 =?utf-8?B?UVlueUZ1YzBkd05RaDFqNHpvbVdyVFZRb0xnU0poRCthNEVDWktRVVJ6dGZn?=
 =?utf-8?B?ekp3c0JWODdhMEY4ajBhckNBbnVBVUpvM0hQRDJzQmo1RnIyOUxOMzcvL3Rx?=
 =?utf-8?B?bTFKY0hZSUVybzJNdWxzUlVpc25oS0JBRkFTMStBak96SEVyajhMYmo4YXBX?=
 =?utf-8?B?a2hDQ2piYXB1SGlpRytDakNoQWZFRHVoRzFveVdoekpKUEE2MFZTaG1EMk5U?=
 =?utf-8?B?citNdnFlZ2FRUUVBUnJmV1lQSTBETWE1ZTVscXFKV0Vnc2UrVVVRWXlGYXZF?=
 =?utf-8?B?c0hNRHFDcVdJRklIMG5ac3h0b1dxMUZxWDZhL1JFbndXOGNUUUxEUHdBRitD?=
 =?utf-8?B?V1FzZlVSU1VibUVvNEFQL1JqNi9HRDVrSUErM1pGdE5TRFRXVGVmKzAraE9t?=
 =?utf-8?B?KysvWW5jeUdTR2J6eUQ2U2hqbmtPcUVyTG9VYjE0MVhLcFRxbHMxbTJpVmxp?=
 =?utf-8?B?aVp2Z0ZuSmhUTWpiQ1ZSZDQyUTNRcjJsVVRwdVowTk1XWVZSOGM4dVpUcmhs?=
 =?utf-8?B?NEpva3ZjSFVMUjI1UkpoS28xTDFKbDBKU1dNL0RCbit3ZHRNTW9JMmkzRjhG?=
 =?utf-8?B?LzdOZC9XbW1hUlcyZjlKY2FyemxtSnZUOFpZMHdncERBd0JqR2JlMld5VnU5?=
 =?utf-8?B?R2RpSDBmYlU0Nm1IT3c3VHlWQnFQekNBL2IyVHBqNTM0dTlCV0hLaG90YzJ0?=
 =?utf-8?B?b0J6QlpiQlVkb2NBckt2V1Z6YXFQanU0SUlVekc1YXBCekhRNDNhQWxvdDR2?=
 =?utf-8?B?SWpyWDFiYkM1T2J1bGlvWFpIa3dFSjlSQmJ5L090RXh2Rzl5U3B0RTFsOXBK?=
 =?utf-8?B?SE5DR1VtSnhIcldlNi9qSkNoY056aDNyNFNtbkxWUGpZSmhmUEQwRmxpcVVQ?=
 =?utf-8?B?MmZkM09BMWNNcUpkaTJnZG9yK2FxaVdPT08vVE1manJWaTZLSE1zKzB2TDhq?=
 =?utf-8?B?bmhzSndyb2J6QWFQQUdwejZ0OWNDbjZORWxkdXVZaTBqZXpmZERwa0FrMDlP?=
 =?utf-8?B?SENhUXhlUFR5TkNYbU9KRWdzWUFxdGY0VjBOYU1DWUdDY1RnN3lXdGZqR0xi?=
 =?utf-8?B?aGpGc1JLL3FQU0E1YTRCVi9QVDREK1NNcGNPNGhjS1FWRXRFc2JZMXdldW9u?=
 =?utf-8?B?OVRwQzdmazBnQ0IrTS9UbGhhRXEwdXBGQ29FUHBTdzYxTmhiQ0x2U01Za2F4?=
 =?utf-8?B?M2JVMy8zSTFTQmhZUEVFUlROTC9GVDFZYXdLS3llRDg5c2ltdXdTRXFDb2RD?=
 =?utf-8?B?NFB6SkZYbVg5TWFiY3QyVGpzNFM2a2ttdW1FaWNqT3lrV0YrYmF1MzR5YTU0?=
 =?utf-8?B?NFlpVzhPUlhZUXJCajY4bGNKbFpka2JnNzY0THRHMDF5bk1OcWlpM1BqTDgv?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b8ce4a-f2a7-4014-e2f7-08dc287539f7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 07:11:53.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwEtfOWayKKaTekktB1PAAsB9cGD7YM9W92JI2RQqLnT/bGBwR616+QKv94nXFLpAq3ku5hfKbligbsa0tmjww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5676
X-OriginatorOrg: intel.com

hi, Amir,

On Wed, Feb 07, 2024 at 11:17:36PM +0200, Amir Goldstein wrote:
> On Wed, Feb 7, 2024 at 9:37 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -4.2% regression of will-it-scale.per_thread_ops on:
> >
> >
> > commit: 9c13a708efa02450fb5a50fc02a6eaf060fa00a1 ("fsnotify: introduce pre-content permission event")
> > https://github.com/amir73il/linux sb_write_barrier
> >
> > testcase: will-it-scale
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
> > parameters:
> >
> >         test: writeseek1
> >         cpufreq_governor: performance
> >
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202402071553.75bfbe67-oliver.sang@intel.com
> >
> >
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240207/202402071553.75bfbe67-oliver.sang@intel.com
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
> >   gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale
> >
> > commit:
> >   v6.8-rc2
> >   9c13a708ef ("fsnotify: introduce pre-content permission event")
> >
> 
> Hi Oliver,
> 
> There is an optimization patch in Jan's fsnotify branch:
> 
> * 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
> 
> I rebased my development branch over Jan's fsnotify branch.
> Can you please re-test the regressing patch.

this doesn't fix the regression is our tests, still

        v6.8-rc2 ad23b2ac67701a233daa4d4252b f3e926a9addd168086ebe055db3
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   2078006            -3.7%    2000238            -4.8%    1978808        will-it-scale.per_thread_ops


below is the detail


=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale

commit:
  v6.8-rc2
  ad23b2ac67 ("fsnotify: introduce pre-content permission event")
  f3e926a9ad ("fanotify: introduce FAN_MARK_SYNC flag")
  
        v6.8-rc2 ad23b2ac67701a233daa4d4252b f3e926a9addd168086ebe055db3
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      3881            -3.4%       3749            -5.1%       3684        time.user_time
      3487 ± 15%     +27.2%       4436 ±  5%      +9.5%       3818 ± 12%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ± 11%     -53.2%       0.02 ± 80%     +80.4%       0.07 ± 56%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      0.04 ± 11%     -53.2%       0.02 ± 80%     +80.4%       0.07 ± 56%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      3487 ± 15%     +27.2%       4436 ±  5%      +9.5%       3818 ± 12%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
   2743205            -4.4%    2623396            -5.1%    2604463        will-it-scale.1.linear
   2743205            -4.4%    2623396            -5.1%    2604463        will-it-scale.1.processes
   2370614            -3.7%    2281737            -4.6%    2260588        will-it-scale.1.threads
 3.072e+08            -4.4%  2.938e+08            -5.1%  2.917e+08        will-it-scale.112.linear
 3.067e+08            -4.1%   2.94e+08            -4.7%  2.923e+08        will-it-scale.112.processes
 2.649e+08            -3.5%  2.555e+08            -4.0%  2.542e+08        will-it-scale.112.threads
 4.609e+08            -4.4%  4.407e+08            -5.1%  4.375e+08        will-it-scale.168.linear
 3.433e+08            -4.7%   3.27e+08            -6.7%  3.202e+08        will-it-scale.168.processes
 2.974e+08            -3.8%   2.86e+08            -5.2%   2.82e+08        will-it-scale.168.threads
 6.145e+08            -4.4%  5.876e+08            -5.1%  5.834e+08        will-it-scale.224.linear
 3.959e+08            -4.0%  3.802e+08            -7.0%  3.684e+08        will-it-scale.224.processes
   3.4e+08            -4.2%  3.259e+08            -6.8%  3.169e+08        will-it-scale.224.threads
 1.536e+08            -4.4%  1.469e+08            -5.1%  1.458e+08        will-it-scale.56.linear
 1.537e+08            -4.3%  1.471e+08            -4.6%  1.465e+08        will-it-scale.56.processes
 1.325e+08            -3.6%  1.277e+08            -4.1%  1.271e+08        will-it-scale.56.threads
   2407257            -4.3%    2303730            -5.4%    2276293        will-it-scale.per_process_ops
   2078006            -3.7%    2000238            -4.8%    1978808        will-it-scale.per_thread_ops
      0.64            +0.4%       0.65            -2.0%       0.63        will-it-scale.scalability
      3881            -3.4%       3749            -5.1%       3684        will-it-scale.time.user_time
 2.239e+09            -4.1%  2.148e+09            -5.7%  2.113e+09        will-it-scale.workload
  8.55e+10            -1.3%   8.44e+10            -0.7%  8.492e+10        perf-stat.i.branch-instructions
   4545846           -13.6%    3929638 ±  2%      -6.5%    4251291        perf-stat.i.branch-misses
   6033867            +4.4%    6298582 ±  3%      +1.4%    6117471 ±  2%  perf-stat.i.cache-references
      0.78            +0.0%       0.78            -2.3%       0.76        perf-stat.i.cpi
    807736 ±  2%      -3.9%     775851            -2.0%     791269        perf-stat.i.cycles-between-cache-misses
      0.00 ±  4%      +0.0        0.00            +0.0        0.00        perf-stat.i.dTLB-load-miss-rate%
   1429967 ±  4%     +90.3%    2721864           +29.5%    1852438        perf-stat.i.dTLB-load-misses
 1.262e+11            +0.5%  1.269e+11            +2.4%  1.292e+11        perf-stat.i.dTLB-loads
      0.00            +0.0        0.00            +0.0        0.00 ±  2%  perf-stat.i.dTLB-store-miss-rate%
    198009 ±  4%     +22.8%     243143            +1.4%     200766        perf-stat.i.dTLB-store-misses
 7.666e+10            -1.3%  7.569e+10            +1.5%  7.781e+10        perf-stat.i.dTLB-stores
 4.229e+11            +0.4%  4.246e+11            +2.3%  4.325e+11        perf-stat.i.instructions
      1.35            +0.2%       1.35            +2.7%       1.38        perf-stat.i.ipc
     28.02            +5.1%      29.46 ±  3%      +1.3%      28.38 ±  2%  perf-stat.i.metric.K/sec
      1287            -0.5%       1281            +1.2%       1303        perf-stat.i.metric.M/sec
      0.01            -0.0        0.00 ±  2%      -0.0        0.00        perf-stat.overall.branch-miss-rate%
      0.74            -0.4%       0.74            -2.3%       0.72        perf-stat.overall.cpi
      0.00 ±  3%      +0.0        0.00            +0.0        0.00 ±  2%  perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  4%      +0.0        0.00            -0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
      1.35            +0.4%       1.35            +2.4%       1.38        perf-stat.overall.ipc
     59225            +4.7%      62008            +8.4%      64200        perf-stat.overall.path-length
 8.573e+10            -1.3%  8.462e+10            -0.7%  8.511e+10        perf-stat.ps.branch-instructions
   4506836           -13.5%    3898739 ±  2%      -6.4%    4218869        perf-stat.ps.branch-misses
   6011710            +4.4%    6278980 ±  3%      +1.4%    6093674 ±  2%  perf-stat.ps.cache-references
   1434727 ±  4%     +89.0%    2711464           +30.2%    1867553 ±  2%  perf-stat.ps.dTLB-load-misses
 1.265e+11            +0.5%  1.272e+11            +2.3%  1.295e+11        perf-stat.ps.dTLB-loads
    200572 ±  4%     +21.9%     244577            +1.3%     203174        perf-stat.ps.dTLB-store-misses
 7.687e+10            -1.3%  7.589e+10            +1.5%  7.798e+10        perf-stat.ps.dTLB-stores
  4.24e+11            +0.4%  4.256e+11            +2.2%  4.335e+11        perf-stat.ps.instructions
 1.326e+14            +0.4%  1.332e+14            +2.3%  1.356e+14        perf-stat.total.instructions
     27.08            -1.0       26.08            -1.3       25.83        perf-profile.calltrace.cycles-pp.__libc_lseek64
      1.86            -0.7        1.18 ±  2%      -0.8        1.01        perf-profile.calltrace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
     37.48            -0.6       36.86            -0.9       36.59        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.07            -0.6       14.52            -0.7       14.35        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     13.90            -0.5       13.39            -0.7       13.22        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     11.70            -0.4       11.25            -0.5       11.20        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.96            -0.4       10.56            -0.5       10.41        perf-profile.calltrace.cycles-pp.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     30.35            -0.4       29.98            -0.4       29.98        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
     10.25            -0.4        9.88            -0.5        9.80        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_lseek64
      9.97            -0.4        9.62            -0.4        9.54        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_write
      0.96            -0.3        0.65            -0.3        0.64 ±  2%  perf-profile.calltrace.cycles-pp.generic_write_checks.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      6.69            -0.3        6.42            -0.2        6.47        perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      6.00            -0.2        5.76            -0.2        5.81        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      5.98            -0.2        5.75            -0.4        5.62        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      4.57            -0.2        4.35            -0.2        4.36        perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      5.86            -0.2        5.66            -0.2        5.65        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      2.44            -0.1        2.33            -0.2        2.28        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.42            -0.1        2.32            -0.1        2.30        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.56            -0.1        1.49            -0.1        1.48        perf-profile.calltrace.cycles-pp.up_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.05            -0.1        0.98            +0.0        1.08        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.54            -0.1        1.48            -0.1        1.48        perf-profile.calltrace.cycles-pp.folio_mark_accessed.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.54            -0.1        1.48            -0.1        1.47        perf-profile.calltrace.cycles-pp.fput.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      1.54            -0.1        1.48            -0.1        1.48        perf-profile.calltrace.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.38            -0.1        1.33            -0.0        1.36        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.66            -0.1        1.61            -0.1        1.57        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      1.13            -0.0        1.08            -0.0        1.08        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      1.48            -0.0        1.43            -0.1        1.43        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      0.74 ±  2%      -0.0        0.71            -0.0        0.71        perf-profile.calltrace.cycles-pp.folio_mark_dirty.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.17            -0.0        1.14            -0.1        1.04        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      0.64            -0.0        0.63            -0.0        0.62        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.61            -0.0        1.60            -0.2        1.38        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.0        0.00            +2.6        2.60        perf-profile.calltrace.cycles-pp.__fsnotify_parent.file_start_write_area.vfs_write.ksys_write.do_syscall_64
      0.00            +0.0        0.00            +4.7        4.65        perf-profile.calltrace.cycles-pp.file_start_write_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67            +0.0        0.68            +0.1        0.73 ±  2%  perf-profile.calltrace.cycles-pp.fput.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      3.76            +0.2        3.98            +0.2        3.97        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write
     74.67            +0.3       74.99            +0.5       75.12        perf-profile.calltrace.cycles-pp.__libc_write
      4.10            +0.4        4.47            +0.4        4.46        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.40            +0.5        2.86            +0.0        2.42        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.89            +0.7        1.54 ±  3%      +0.5        1.37        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.shmem_file_write_iter.vfs_write.ksys_write
      1.10            +0.8        1.93            +0.6        1.71        perf-profile.calltrace.cycles-pp.file_update_time.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
     61.08            +1.3       62.42            +1.9       63.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     59.97            +1.4       61.36            +1.9       61.88        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     57.25            +1.5       58.72            +1.9       59.20        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     47.54            +1.9       49.46            +2.6       50.14        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      2.61            +2.8        5.46            -0.1        2.48        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.12            -1.0       28.08            -1.3       27.80        perf-profile.children.cycles-pp.__libc_lseek64
      2.01            -0.8        1.22 ±  2%      -0.9        1.10        perf-profile.children.cycles-pp.down_write
     38.04            -0.7       37.36            -1.0       37.02        perf-profile.children.cycles-pp.shmem_file_write_iter
      3.97            -0.6        3.41            -0.2        3.75        perf-profile.children.cycles-pp.__cond_resched
     12.32            -0.4       11.88            -0.6       11.73        perf-profile.children.cycles-pp.__fdget_pos
     11.78            -0.4       11.34            -0.5       11.29        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
     11.44            -0.4       11.02            -0.6       10.88        perf-profile.children.cycles-pp.ksys_lseek
     11.41            -0.4       11.00            -0.5       10.91        perf-profile.children.cycles-pp.entry_SYSCALL_64
     30.88            -0.4       30.49            -0.4       30.50        perf-profile.children.cycles-pp.generic_perform_write
      1.08            -0.3        0.76            -0.3        0.80        perf-profile.children.cycles-pp.generic_write_checks
      6.85            -0.3        6.58            -0.2        6.63        perf-profile.children.cycles-pp.shmem_write_begin
      6.24            -0.2        6.00            -0.2        6.04        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      2.21            -0.2        1.97            -0.1        2.10        perf-profile.children.cycles-pp.rcu_all_qs
      4.82            -0.2        4.59            -0.2        4.60        perf-profile.children.cycles-pp.shmem_write_end
      5.18            -0.2        4.96            -0.3        4.89        perf-profile.children.cycles-pp.mutex_lock
      5.13            -0.2        4.91            -0.4        4.77        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.66            -0.1        2.53            -0.0        2.63        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.58            -0.1        0.48            -0.1        0.49        perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      1.65            -0.1        1.57            -0.1        1.56        perf-profile.children.cycles-pp.up_write
      2.32            -0.1        2.24            +0.0        2.32        perf-profile.children.cycles-pp.fput
      1.91            -0.1        1.84            -0.1        1.80        perf-profile.children.cycles-pp.security_file_permission
      3.21            -0.1        3.15            -0.3        2.91        perf-profile.children.cycles-pp.mutex_unlock
      1.47            -0.1        1.41            -0.0        1.44        perf-profile.children.cycles-pp.filemap_get_entry
      1.62            -0.1        1.56            -0.1        1.56        perf-profile.children.cycles-pp.folio_unlock
      1.62            -0.1        1.56            -0.1        1.55        perf-profile.children.cycles-pp.folio_mark_accessed
      0.66            -0.1        0.61            -0.1        0.61        perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      0.99            -0.0        0.94            -0.1        0.93        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.90 ±  2%      -0.0        0.86            -0.0        0.86        perf-profile.children.cycles-pp.folio_mark_dirty
      1.30            -0.0        1.27            -0.1        1.18        perf-profile.children.cycles-pp.apparmor_file_permission
      0.57            -0.0        0.54            -0.0        0.54        perf-profile.children.cycles-pp.generic_file_llseek_size
      0.49 ±  2%      -0.0        0.47            -0.0        0.47        perf-profile.children.cycles-pp.folio_mapping
      0.65            -0.0        0.62            -0.0        0.62        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.73            -0.0        0.70            -0.0        0.71        perf-profile.children.cycles-pp.shmem_file_llseek
      0.32 ±  2%      -0.0        0.30 ±  2%      -0.0        0.29        perf-profile.children.cycles-pp.__x64_sys_lseek
      0.33            -0.0        0.31 ±  2%      -0.0        0.31        perf-profile.children.cycles-pp.__f_unlock_pos
      0.30            -0.0        0.28            +0.0        0.32        perf-profile.children.cycles-pp.xas_load
      0.57            -0.0        0.55            -0.0        0.54 ±  2%  perf-profile.children.cycles-pp.write@plt
      0.48            -0.0        0.47            -0.0        0.46        perf-profile.children.cycles-pp.amd_clear_divider
      0.51 ±  2%      -0.0        0.50            -0.1        0.40 ±  2%  perf-profile.children.cycles-pp.aa_file_perm
      0.16 ±  4%      -0.0        0.15 ±  3%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.xas_start
      0.16 ±  3%      -0.0        0.16 ±  2%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.file_remove_privs
      0.00            +0.0        0.00            +4.9        4.88        perf-profile.children.cycles-pp.file_start_write_area
      1.02            +0.0        1.02            -0.1        0.91        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.35 ±  3%      +0.1        0.46            +0.2        0.51        perf-profile.children.cycles-pp.__file_remove_privs
      0.31            +0.2        0.54            +0.1        0.43        perf-profile.children.cycles-pp.timestamp_truncate
      0.19 ±  4%      +0.2        0.41 ± 13%      +0.2        0.36        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      3.82            +0.3        4.13            +0.3        4.12        perf-profile.children.cycles-pp.fault_in_readable
      4.19            +0.4        4.55            +0.4        4.54        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      2.56            +0.4        3.02            +0.0        2.58        perf-profile.children.cycles-pp.rw_verify_area
     76.40            +0.8       77.17            +1.0       77.43        perf-profile.children.cycles-pp.__libc_write
     76.34            +0.8       77.14            +1.2       77.55        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.99            +0.8        1.83 ±  2%      +0.6        1.58        perf-profile.children.cycles-pp.inode_needs_update_time
     74.50            +0.9       75.36            +1.3       75.75        perf-profile.children.cycles-pp.do_syscall_64
      1.23            +0.9        2.16            +0.7        1.93        perf-profile.children.cycles-pp.file_update_time
     57.55            +1.5       59.07            +2.0       59.54        perf-profile.children.cycles-pp.ksys_write
     48.12            +1.8       49.91            +2.4       50.51        perf-profile.children.cycles-pp.vfs_write
      2.69            +2.9        5.61            +2.5        5.20        perf-profile.children.cycles-pp.__fsnotify_parent
      1.54            -0.7        0.81            -0.8        0.72        perf-profile.self.cycles-pp.down_write
      4.49            -0.5        3.95            -0.8        3.66        perf-profile.self.cycles-pp.vfs_write
     11.68            -0.4       11.23            -0.5       11.18        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      2.15            -0.4        1.78            -0.1        2.09        perf-profile.self.cycles-pp.__cond_resched
      0.71            -0.3        0.45            -0.2        0.52        perf-profile.self.cycles-pp.generic_write_checks
      5.04            -0.2        4.80            -0.3        4.70        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      7.28            -0.2        7.05            -0.3        6.98        perf-profile.self.cycles-pp.__fdget_pos
      5.37            -0.2        5.20            -0.2        5.15        perf-profile.self.cycles-pp.__libc_write
      3.55            -0.2        3.39            -0.2        3.33        perf-profile.self.cycles-pp.mutex_lock
      4.55            -0.2        4.40            -0.2        4.36        perf-profile.self.cycles-pp.__libc_lseek64
      1.02            -0.1        0.89            -0.2        0.84        perf-profile.self.cycles-pp.shmem_file_write_iter
      1.38            -0.1        1.25            -0.1        1.26        perf-profile.self.cycles-pp.rcu_all_qs
      2.20            -0.1        2.08            -0.1        2.10        perf-profile.self.cycles-pp.shmem_write_end
      2.22            -0.1        2.11            -0.0        2.20        perf-profile.self.cycles-pp.fput
      0.50            -0.1        0.40            -0.1        0.41        perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      2.60            -0.1        2.50            -0.1        2.48        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.60            -0.1        1.51            -0.1        1.55        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      2.61            -0.1        2.53            -0.1        2.52        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      2.58            -0.1        2.50            -0.1        2.52        perf-profile.self.cycles-pp.do_syscall_64
      1.58            -0.1        1.50            -0.1        1.49        perf-profile.self.cycles-pp.up_write
      2.00            -0.1        1.94            -0.1        1.95        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.59            -0.1        0.53            -0.1        0.54        perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      1.54            -0.1        1.48            -0.1        1.48        perf-profile.self.cycles-pp.folio_unlock
      1.53            -0.1        1.48            -0.1        1.47        perf-profile.self.cycles-pp.folio_mark_accessed
      3.04            -0.1        2.99            -0.3        2.75        perf-profile.self.cycles-pp.mutex_unlock
      1.18            -0.0        1.13            -0.0        1.14        perf-profile.self.cycles-pp.filemap_get_entry
      0.99            -0.0        0.94            -0.1        0.93        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.06            -0.0        1.02            -0.0        1.03        perf-profile.self.cycles-pp.ksys_lseek
      0.66            -0.0        0.62            -0.0        0.64        perf-profile.self.cycles-pp.shmem_write_begin
      0.69            -0.0        0.66            +0.0        0.70        perf-profile.self.cycles-pp.security_file_permission
      1.25            -0.0        1.22            -0.0        1.22        perf-profile.self.cycles-pp.testcase
      0.49            -0.0        0.47            -0.0        0.46        perf-profile.self.cycles-pp.generic_file_llseek_size
      0.41 ±  3%      -0.0        0.39            -0.0        0.39        perf-profile.self.cycles-pp.folio_mapping
      0.23 ±  2%      -0.0        0.21 ±  3%      -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.__x64_sys_lseek
      0.57            -0.0        0.55            -0.0        0.55        perf-profile.self.cycles-pp.shmem_file_llseek
      0.32 ±  2%      -0.0        0.31            -0.0        0.30 ±  2%  perf-profile.self.cycles-pp.amd_clear_divider
      0.43 ±  2%      -0.0        0.42            -0.1        0.32 ±  2%  perf-profile.self.cycles-pp.aa_file_perm
      1.02            +0.0        1.02            -0.1        0.91        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.12 ±  4%      +0.0        0.12 ±  4%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.xas_start
      0.00            +0.0        0.00            +1.6        1.62        perf-profile.self.cycles-pp.file_start_write_area
      1.07            +0.0        1.07            +0.0        1.09        perf-profile.self.cycles-pp.ksys_write
      0.33 ±  2%      +0.1        0.42 ±  2%      +0.1        0.42 ±  2%  perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.29 ±  2%      +0.1        0.38            +0.1        0.35 ±  2%  perf-profile.self.cycles-pp.timestamp_truncate
      0.30 ±  3%      +0.1        0.42            +0.2        0.47        perf-profile.self.cycles-pp.__file_remove_privs
      0.25 ±  3%      +0.1        0.40            +0.2        0.42        perf-profile.self.cycles-pp.file_update_time
      0.15 ±  4%      +0.2        0.34 ± 16%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      2.02            +0.2        2.22            +0.2        2.23        perf-profile.self.cycles-pp.generic_perform_write
      3.76            +0.3        4.04            +0.3        4.03        perf-profile.self.cycles-pp.fault_in_readable
      0.47            +0.5        0.96            +0.3        0.80        perf-profile.self.cycles-pp.inode_needs_update_time
      0.57            +0.5        1.09            +0.2        0.78        perf-profile.self.cycles-pp.rw_verify_area
      2.60            +2.8        5.44            +2.4        5.04        perf-profile.self.cycles-pp.__fsnotify_parent



> 
> Thanks,
> Amir.
> 
> * f3e926a9addd - (github/sb_write_barrier) fanotify: introduce
> FAN_MARK_SYNC flag
> * 57d3051b0107 - fanotify: activate sb write barriers for pre-modify
> event watchers
> * a2201e37ed93 - fs: hold s_write_srcu for pre-modify permission
> events on aio write
> * d2e5e6cbc899 - fs: hold s_write_srcu for pre-modify permission events on write
> * 0c8c9bb221ff - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 153a7af1d84e - fs: implement 'vfs write barriers'
> * ea95472ceb68 - (github/fan_errno) fanotify: allow to set errno in
> FAN_DENY permission response
> * 696f2fde6da0 - (github/fan_pre_content) fanotify: report file range
> info with pre-content events
> * 757935d39017 - fanotify: rename a misnamed constant
> * 3eab2d4e1ff5 - fanotify: pass optional file access range in pre-content event
> * 49433d6fc066 - fanotify: introduce FAN_PRE_MODIFY permission event
> * eccace27aebb - fanotify: introduce FAN_PRE_ACCESS permission event
> * ad23b2ac6770 - fsnotify: introduce pre-content permission event
> * e1a893090c4b - (github/fsnotify) Merge remote-tracking branch
> 'jack/fsnotify' into fsnotify
> * b7dbaace3971 - (jack/fsnotify) fsnotify: Add fsnotify_sb_has_watchers() helper
> * 082fd1ea1f98 - fsnotify: optimize the case of no parent watcher
> 
