Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A810EE
	for <oe-lkp@lists.linux.dev>; Wed, 30 Aug 2023 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693378485; x=1724914485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+ADIZoO9lKmelGy0ysaP/t7+Vmar9gyRQx6HulluOA=;
  b=f/dxWXONRq/BPc0E4/IofUYFj/+C+AECAISnHiVBEcQWmuLzd20tAD7q
   MJF1q+1exh0RT6tIv5TIsL57YZ5rJ7pg6Le3Fa9BQCf7UKNVxAsENwn5V
   oEa6+U8pIL3xHIWDashTgEcbuwuLcPwF2Qt7acY0WRntUlQrU6NZHtGib
   qa6QMO1ZuYQDFf1SVIXa7KIqLj4Arh0E6oQhdp1Tzfj+Eg/mgdrEC5sdK
   1KETXc2LNVpVzYRAi2AmxyPkxU+mwJ4CMkIHv4CjUzH/rHfmjAkoFXeww
   22LykXEklZzJGU2PIR8HG9HbfmXrUxOmTNeCA+IHcqc5vr+cySwcIPWG/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439513995"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="439513995"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 23:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069734837"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="1069734837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 23:54:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 23:54:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 23:54:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 23:54:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 23:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6SAHLu5QyAkpxbC3baC7gm+7d9bgo0hb+EIwUI5UrTowrx1m2/M6FcYTVAgSkwSOdtHLw5F7V1IL/HLGXxiG/3rQrHQynSMDoFTa3KGnKFno7VHifEK+B3Y4WuD99FHpbh4tJLXKSgafP6nf8XrpMjoVAaqlL8Oz7fjbDN3fL77NdJhZ3AUWMWTgKb0R2ce5CLEY+UVzbz1oWEf2dfaBWS0KEi4hYfWwq9oNvOHElkIywN4kMTdxQ+y0ZKiM/rIPhZRvbY+kQIVdehCzzSKhi+9eIq/bc9pXezF88gv9h0DYVR8baIdoULw+OUYtrvy3DCU91f5a69zPvoJtioTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVodz9PeEPogGirhbsgNdkfvOzHK7hlhxHpXrGCvrRA=;
 b=PklBJQbxitgz+Rw6g++IcJsYVQ9Vjf1CWFAPkO9R1UlbqJV9Mm0Ru07Oc1MA+iaVzZktuVx7Cn3TrDGrvgEjSNTnAESmfmzg2wGzh1EuyA+01sBgk2nXdRSHOZMSXGRHJSzPFzbbLQqwX+l2D1ihrklVf3Cnpac5vx0jfPUgsN47mPP5cBLjHXCmd/3uyd7Ip081QCCHaslMDlapkHtFYZ63yNs9Vneab+bmPvFcGfDEo+4ywIV9wztgRJnwrRUQwO0Lw2qocKc+EiSAXKpJnrt/i+RWSNlai8iZ6EOBetQJAsaAhb4YKjzhklqO0AnGcV2bRWonZlJzLQtYPKvMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 06:54:35 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 06:54:35 +0000
Date: Wed, 30 Aug 2023 14:54:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:aass] [bitmap]  a293bd8593:
 BUG:KASAN:stack-out-of-bounds_in__bitmap_weight_from
Message-ID: <202308301402.f5697627-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c47161-4717-4df6-f70a-08dba925f85b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9r9B56pot/0G9PCg8e1e6hp18UjxFEaZcAeIqhbHzQOf8Hz+g+77TJeyzfkYyhI3b6BT1DH7pAzYap0vptq8AO9Gx+HZpHY73hBbx0ubfLOXtLrtJF0vdaqw9kILgxVFJe4Rb0j+tFiVfrCagFK/M7gQHpVkvPNIVdBCzs4rDrITpBCY+l/lyHSa1u3iMbLCb9FXOG9zEteNn40a+PGlXGLAe2BL6/CwQDr74ZtmjXaCaU+e3Rv2geEmqeKZwJR5zqu15/R2TCh4CzvkI+Yvu+KTmWjSQMeQPZ/bLWuI797aawb07rFNcJ/0f98GS956B/N1t9lVLnXaPTO94Ij3xjgtOua+ruhmpWGa1DoUbdZuoz0HYzayLm4W6Ai2qfwMw4O2p6Bq9AfKHs5MrokjAAuq9L99wbIaxVxQJfuCASIXD1iXMN214iQ7TWFOelJjbf3EbFFP25WRFyOVWXoG6LKPoCO968zu3jFDK0qDkDlCWXUPG+Olc/98uWfWnGSvFQlW6Lei6Ba6in1tCJVQIVJIUHvNR5JQjKrlU7z/+XYuaiOeexyjbj7A7dKU++7DSsv5sQnhtg+tNNCk50F+BhWkqQ4M9VVWuNUsKpGU1XYpdZHhESuusEhee3K1arkTwQB8rpy5NiobYl466rfKh//60v9VeSwZJr9k+ySAa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(1800799009)(186009)(451199024)(41300700001)(66556008)(8936002)(83380400001)(4326008)(8676002)(966005)(66476007)(478600001)(6666004)(66946007)(107886003)(26005)(2616005)(316002)(1076003)(6506007)(6486002)(6916009)(6512007)(2906002)(82960400001)(38100700002)(5660300002)(36756003)(86362001)(101420200003)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ay2uqDxO4yzVOxAwB1Fat80gkg1xwIMjqUUmTE6f+Cv9PrwhZCnn2RW6Jv4o?=
 =?us-ascii?Q?JNYj5Szvd4nOMde8AaaVAJGpPYPsoX7k8kn23ysfxatjX40Jw+4HxztmNXF8?=
 =?us-ascii?Q?/q6/17jqSajcq4zLHZ2cqmczchPRdbz07IGBI64VkqVzVr5SsCex2evXCG7P?=
 =?us-ascii?Q?60laFVtKfM0AuN+UeWwbOZreK5+5kXf0eL+wVFNkMgaJUYdOgDHuZhP2Gr7I?=
 =?us-ascii?Q?7CZrPz4nz3mGcbKtt5t35uHBIE1QI2p+Ebl6u/22DrmlN83kahjDrMf+KIm/?=
 =?us-ascii?Q?49jvfQ1AdNTH38Qsuu3EbNWrxrq77ntgbTo2Wux4AByHLb+i7VXZFpcRnEIb?=
 =?us-ascii?Q?S1nkgS8VwqTi2AObMeY2lLydmSTmKevphGIL5Y0TQcOw/16AqcqW4yJhZbJj?=
 =?us-ascii?Q?3GrpA8O6vn0HN/USbxnmba8G3W/xUxnzU0wmbap1NkBMe5280zcLTA9n38KZ?=
 =?us-ascii?Q?OyPnuat62ZQ07i4I0TafXQ9jI5DvLpSKwpFiKs3Xxvi38+T2WddhEcr2w0G8?=
 =?us-ascii?Q?3nc23qcPlgTBdPXQeCRytEDoiJYYxBqNPvMeVZbbYvUgmL77pD6GIMno6F90?=
 =?us-ascii?Q?OQY611QvTtU5L1mpdCoC5MDVbJeNkpGcpQAQvLSwHe80sjRlXzCzga7q7xYh?=
 =?us-ascii?Q?D7yuxuHUfXY0ykssarb92HepbXX+4QiV1PiUUcOuzaVz3LiyhUTkPnZtrMls?=
 =?us-ascii?Q?NX1gvcJDOvs4CvdZhoRO9mXwL6f56pWjD8n6gZMf1zPFIIEfEQYSCIT/RyD7?=
 =?us-ascii?Q?H0QGrMUljXD2SLmI/M/Kgjp1oGXMNHrvznitn9PJnEjDzWeyywI6b8fhZq/r?=
 =?us-ascii?Q?XQEPR4kZ5jlYzm8W3M6k2tIMHp7PuqIAoBpC7qrbNgKAC8l9I9dCEPV/vz85?=
 =?us-ascii?Q?IwN3VpXsY5L9UebKZnmlOJW9FayVLnauI43S8JjrK7SHil1mYCzxNZlK7dRM?=
 =?us-ascii?Q?etuPCqwmyuqC8DPsk6CkcXOzVFyNXV8zeF31XWL9xDmHLbguh4B5gB0vm5mt?=
 =?us-ascii?Q?z9CwLB89rNwfKkS7zL4MlvLJ+qrjNTcgzrtxVoaojx3MykkF1cwhjSLV9Wh8?=
 =?us-ascii?Q?yDUGqTK08YeNX7TTqbw2TOf1CAjFzjtYJbiIkXKdCGAOf1Nwg5gMOAwLui7X?=
 =?us-ascii?Q?3UO0Mt0cRgBO+E/pAy9Z5zkpXGlg4LoOdpbKVTaQgs4k3p1LrxXz8w2mSs/H?=
 =?us-ascii?Q?ZOHXGLDYBDvdpSbTF90uXrqXujgOxayK+jnFroIGmphyyPO0BM0QSRYbA+bb?=
 =?us-ascii?Q?dsvSK7Pzo0d6VgAzQQHDgMpoPG+nqsH+haoUaw/l12J/MHaTEVEj7ng98TLi?=
 =?us-ascii?Q?Daf+ZJ+tqK5VoCpe6iyNWmVcxQQX1JFZHRam6yISQl23tiQWc0tcMQTYVQaQ?=
 =?us-ascii?Q?8+uFnt3gt8zNqmCXNGN6KYldKBAMYfOC0lTkNhlD9eqH84cNE2se9SIHEHhH?=
 =?us-ascii?Q?BW3VaNRvT4wW3YQWjE9wCC7aTESp851VFT5Wd5O94NYvyGHGLb5zTxHxyuKo?=
 =?us-ascii?Q?MRCnuCbj/t7mHHXuLybiMmVyPn5Yculhb6ozIiGMglXYGQb4+tSf7K/TTwUC?=
 =?us-ascii?Q?3LAtk3a7Ektr/ikwscGZhuq5u+8igP9B4KGn6FvqKiM3PZjGsT1HEq++i8NB?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c47161-4717-4df6-f70a-08dba925f85b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 06:54:35.0271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOI9ZQ7lUaVQAwHHBZQFIMX5+hAOAhpQ5S5Uzn9qKWqCjAfNst/QYjhhj0MEIsxQ5kbh+fP9h76pFQeBkFEp9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:stack-out-of-bounds_in__bitmap_weight_from" on:

commit: a293bd85935a53525735fe586cbc479a28b3a402 ("bitmap: add bitmap_weight_from()")
https://github.com/norov/linux aass

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308301402.f5697627-oliver.sang@intel.com



[   31.464884][    T1] ==================================================================
[   31.465880][    T1] BUG: KASAN: stack-out-of-bounds in __bitmap_weight_from+0xef/0x140
[   31.466861][    T1] Read of size 8 at addr ffff88810566fcb0 by task swapper/0/1
[   31.466861][    T1] 
[   31.466861][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.5.0-rc5-00018-ga293bd85935a #1
[   31.466861][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   31.466861][    T1] Call Trace:
[   31.466861][    T1]  <TASK>
[   31.470927][    T1]  dump_stack_lvl+0x86/0x100
[   31.470927][    T1]  print_address_description+0x57/0x3c0
[   31.470927][    T1]  print_report+0xcc/0x2c0
[   31.470927][    T1]  ? kasan_complete_mode_report_info+0x93/0xc0
[   31.470927][    T1]  ? __bitmap_weight_from+0xef/0x140
[   31.470927][    T1]  kasan_report+0xf8/0x140
[   31.474852][    T1]  ? __bitmap_weight_from+0xef/0x140
[   31.474852][    T1]  __asan_report_load8_noabort+0x14/0x40
[   31.474852][    T1]  __bitmap_weight_from+0xef/0x140
[   31.478932][    T1]  test_weight+0x16e/0x200
[   31.478932][    T1]  ? test_scanf_init+0xc0/0xc0
[   31.478932][    T1]  ? test_copy+0x680/0x680
[   31.478932][    T1]  test_bitmap_init+0x8f/0x280
[   31.478932][    T1]  ? test_copy+0x680/0x680
[   31.478932][    T1]  ? add_device_randomness+0xa6/0x100
[   31.478932][    T1]  ? rng_is_initialized+0x40/0x40
[   31.482851][    T1]  ? test_copy+0x680/0x680
[   31.482851][    T1]  do_one_initcall+0x1be/0x7c0
[   31.482851][    T1]  ? trace_initcall_level+0x280/0x280
[   31.482851][    T1]  ? do_initcalls+0x30/0x540
[   31.482851][    T1]  do_initcalls+0x230/0x540
[   31.482851][    T1]  kernel_init_freeable+0x2e6/0x400
[   31.486931][    T1]  ? rest_init+0x240/0x240
[   31.486931][    T1]  kernel_init+0x1f/0x200
[   31.486931][    T1]  ? rest_init+0x240/0x240
[   31.486931][    T1]  ret_from_fork+0x58/0xc0
[   31.486931][    T1]  ? rest_init+0x240/0x240
[   31.486931][    T1]  ret_from_fork_asm+0x11/0x40
[   31.486931][    T1]  </TASK>
[   31.490854][    T1] 
[   31.490854][    T1] The buggy address belongs to stack of task swapper/0/1
[   31.490854][    T1]  and is located at offset 160 in frame:
[   31.490854][    T1]  test_weight+0x0/0x200
[   31.490854][    T1] 
[   31.490854][    T1] This frame has 1 object:
[   31.490854][    T1]  [32, 160) 'bmap'
[   31.490854][    T1] 
[   31.494924][    T1] The buggy address belongs to the physical page:
[   31.494924][    T1] page:ffffea0004159bc0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10566f
[   31.494924][    T1] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[   31.494924][    T1] page_type: 0xffffffff()
[   31.494924][    T1] raw: 0017ffffc0000000 ffffea0004159bc8 ffffea0004159bc8 0000000000000000
[   31.498850][    T1] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[   31.498850][    T1] page dumped because: kasan: bad access detected
[   31.502929][    T1] page_owner tracks the page as allocated
[   31.502929][    T1] page last allocated via order 3, migratetype Unmovable, gfp_mask 0x400100(__GFP_ZERO|__GFP_ACCOUNT), pid 0, tgid 0 (swapper/0), ts 5274697526, free_ts 0
[   31.506851][    T1]  post_alloc_hook+0x35e/0x480
[   31.506851][    T1]  get_page_from_freelist+0x456/0x980
[   31.506851][    T1]  __alloc_pages+0x232/0x7c0
[   31.506851][    T1]  dup_task_struct+0x72/0x640
[   31.506851][    T1]  copy_process+0x45e/0x4c40
[   31.506851][    T1]  kernel_clone+0x128/0x9c0
[   31.510923][    T1]  user_mode_thread+0x9b/0xc0
[   31.510923][    T1]  rest_init+0x28/0x240
[   31.510923][    T1]  arch_call_rest_init+0x13/0x80
[   31.510923][    T1]  start_kernel+0x3a7/0x480
[   31.510923][    T1]  x86_64_start_reservations+0x18/0x40
[   31.510923][    T1]  x86_64_start_kernel+0xba/0x140
[   31.510923][    T1]  secondary_startup_64_no_verify+0x179/0x17b
[   31.514854][    T1] page_owner free stack trace missing
[   31.514854][    T1] 
[   31.514854][    T1] Memory state around the buggy address:
[   31.514854][    T1]  ffff88810566fb80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   31.514854][    T1]  ffff88810566fc00: 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00 00 00
[   31.518922][    T1] >ffff88810566fc80: 00 00 00 00 00 00 f3 f3 f3 f3 00 00 00 00 00 00
[   31.518922][    T1]                                      ^
[   31.518922][    T1]  ffff88810566fd00: f1 f1 f1 f1 00 f2 f2 f2 00 f3 f3 f3 00 00 00 00
[   31.518922][    T1]  ffff88810566fd80: 00 00 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00
[   31.518922][    T1] ==================================================================
[   31.523787][    T1] Disabling lock debugging due to kernel taint



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230830/202308301402.f5697627-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

