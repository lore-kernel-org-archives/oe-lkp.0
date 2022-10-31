Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7523CE
	for <oe-lkp@lists.linux.dev>; Mon, 31 Oct 2022 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667224171; x=1698760171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuqLvSk1Ts4cJIgw5NWlULb1e6wl7FAbQ4zuIMMaR9I=;
  b=DjKGho3aU4ifU2adXazHpKS0BGX6U3KJiA8n4UMvQJaXFdPsCnqJAkXM
   GTkMQPTGWAYRoxTC/QXfeb4JtbUJ053a31IwBV0oL2PEtKZx0W9j30vse
   zlCzDlXKg+R4yeqI8LN/L2+n5adeG97Ci8WHiACJCL1Oq8QvGFHFOko3V
   Tw4h+JaHqADIG0JVCo3bJ0nEsXg/NRKGEetGeCVRgF2VccI1BrJKaxCA9
   wiGabATYejHSX0m2PYbdJ0ZNBp7lMj5b2LenZkkef7OrTjzyesg9XFmtt
   S3YhizLpW5es8ScthC0M14ULZHhsPGbJV1JsaGfOAqg15oLTYOXlY4vF9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308897457"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="xz'?scan'208";a="308897457"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 06:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="584660657"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="xz'?scan'208";a="584660657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2022 06:49:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 06:49:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 06:49:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 06:49:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SajMlz4XNaWMECjZRxMa0YSGT6NH1dB6dHnnqoJjNL0vpfM0fpxuMjoNpcD14yQ0E211gXLoEjBU4th2A7Lb+en+2Fwab+tgly92Vfb7BGCDHtSrClOZZkEFyhQDvPPwZzH13MQ97Jc2t008LX61PDDMXhpxEFbMPO+MxFaYerPCNZj7JTCDh3E4FswedU3yif5ntnRqTWe6OXlsbHCfi/VxzfBsi0yHYVaBnO0ZAOs9Ho3l7O5AP5R+tqO9oigza2ePuY9VG0cVDk5O3kWAbmcrVh9xenCJiKHga1lqY0OoIiuJKcHl5O/N4jkEFGcPSOgJ1zFzznZbyqoOOLVtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUQeHJU4baT4ztQcgnppTE+/2bDG5jfZY/3uK3BsFso=;
 b=OwEywjHvroEIS7kkB9k0bnbpMdPcoXVH+u8/WQJgUG0F2lLGLuPEI+l4I+52aTG9+H/At76+m3CrLxS9zE9DDPsEx83py/V9AcSB2S2KXECcYL5DChiB4vJVEnbJgk9tWfs5m6VAwgl2/5NeET5cqaWL76Fo7s8OextqjWnnYv7bp9JSQ1e5qH7ccwepX2KdbOK5yZ1rCWqXcVStPlFNC1rw0yrOnrLxeqqwt9oPeABeZGmgPS32rLrHr56DDMs7V4Tpw5mfAoOHlQoqx65GNIag+D99QI0GklJIgCy1INv4juQbbgry+iL9IDckMiaeIxnKwGMsBvJv+kwuuvQOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 31 Oct
 2022 13:49:25 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::7f2d:39e1:85b6:93c1]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::7f2d:39e1:85b6:93c1%6]) with mapi id 15.20.5769.016; Mon, 31 Oct 2022
 13:49:25 +0000
Date: Mon, 31 Oct 2022 21:49:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, David Rientjes <rientjes@google.com>,
	"Marco Elver" <elver@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master] [mempool]  ec1c2fec0d:
 BUG:KASAN:out-of-bounds_in__poison_element
Message-ID: <202210312110.1fe5d224-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="ql/3ZYbYs2rOVbex"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA1PR11MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 93049c23-5fb2-40b5-0ace-08dabb46b8c1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BA6npBGuc4EqlrYYeyu1rPgD2gmt3z1VvLFHyNw9HVenQaO56MSyns3RVdnKjUqEbgVrqai9wwC2yapB9OhUXiMamX+4LVKFC86kERJuaGQ13HiAG5oxsf+h7+1vRTmQALLO50o3nJn2zhPa/YYXWloLQsuNsDutDJzv13HmCaezQgJwVdKS55ZsJBNF/jGPCoylFVl594cntaTtPbKC+aqd4U4ek3gk4t/ylZCv2URGx7/v1Cgx9AOTmgUNX8WWjnpMDPsYEBqiIMkPkTTUCgibVk1LQJHQnrkDGgGDtJ2n5AvG1JqH5NQJiTZ0aP3xWr9To9swz5wSRQIxzHvQxKkRI1KmGlca2FXHQ5rc36xwQUoKbZ1A/mmuI61X3YVBa1l5wH51B7YHXt4MwOCXpnlYnIqgUffIRk1EoE6PT8JpHgtkDYAJzdGgTjQ7hejingiX9GDorlykViGHtNeOR4oYTaEvGImkb92L/cSxJAnaPbACOsAuPwOu812c/YA0tAe3DPFe93wuyJUCvzCmesl5MQCj0Zu0xmaRKBVKnw5s6CRNFMGfoukUoqCEBJuxt6Ym21CwVFi/0za71RlWVbbrhMHuSdc66OEQSa+fSn9K4bc7h/iyfAfGJsVfIeCEprx9esYFV8F70L+wcnyKvnMxCqZj0vvWBlLfXiz8kuZNh59hBtffLYmA79or0Dy+BS7986Jr0YCVsaH7Z6Two1gkyJgG+Dd7lhfsrrwU7B5SSrStzCsHSb3QYIRNApvECsFvpycltvJPw5ml3xxIRE4/iM6N3VP30XfBfVvvkwmxqX/vyb4cCZeoZa33y4WGe7gSAVO32He7YRWOtnyekJp/itkwIJeHevNUzUiHWYA+uPWUB45NsbeMxOj/G+lfajAZRkE0+sKYbjCQ4nf/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(6666004)(316002)(6506007)(36756003)(6916009)(54906003)(45080400002)(44144004)(1076003)(186003)(82960400001)(38100700002)(2616005)(83380400001)(2906002)(6512007)(41300700001)(4326008)(66476007)(66556008)(66946007)(8676002)(5660300002)(235185007)(86362001)(8936002)(478600001)(26005)(6486002)(966005)(101420200003)(2700100001)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DBg1s8TVsedVRGed+159H74FQT583xirWPwu0L4ROFTyn57w/9Lk96Z9+RIY?=
 =?us-ascii?Q?zd+kMFG7bsX/tICE2ugwMDrA6VzNEAiD2pzXZ3wh3ul0jcCLB1AultjUOHQr?=
 =?us-ascii?Q?xdWIYxJVlpxufL1DqviS9sS/qcgP8Uuu9BrjYtxzAwl7TZK8UANY3yY+T460?=
 =?us-ascii?Q?PYSvtOxW5zx7dNXlcRzruTCHKCddieKIMvmcxBiiAPrXbV3GKLp9sMN9ieUT?=
 =?us-ascii?Q?8qRhBf6ZRlexnzbYzr5KWEXm3MwaZJHCy6yGcm1kcDJvoVJdHafsh0osdhsY?=
 =?us-ascii?Q?rA0zOINgtuZoEKlEm9jA94rtJUkDwPuZ8QyWCXNkLFQLojcRrrhaZg0BQyqs?=
 =?us-ascii?Q?jP8m465CUNQ8hbh72iCGahmMGuoZgIFUWXiSoe+glptlwSIB9pimI9sUcAdT?=
 =?us-ascii?Q?KhzrJe7UMsUDlNDoMIzVEP+gBCy9ALSemf1Qlu2Q8+wwmETHkVs1qyGnYP0C?=
 =?us-ascii?Q?WiEfJecI8G5GEhC9mUm8OO7NaLd8beTVaugK6G9+qQW3tC2yx6cXBVvizCdi?=
 =?us-ascii?Q?ysorllUcsU+c+LTGNlon+WljCCffYlI7drRxFyf/NiAG+Df3tOpZ437yr6EH?=
 =?us-ascii?Q?FgM18Ic8ybqQmDv13VUA0LIgKpz1oleis7h02fRPTtJSKzg7VgD3tca64KEo?=
 =?us-ascii?Q?lNsuraPkgpNkyPZOeGtea5y1cSRk/aiNtcOVC99ZvoGRRp2Lbvpvf2bgqRwY?=
 =?us-ascii?Q?KlzVfoVfO6fpyYTL+4afpBxcblDFWZHgGBY7aMm7HRDE/N1xo1tjdxlFoKWH?=
 =?us-ascii?Q?yPt9XcZGXywQxEJtnU+dCU5pD7nzL3TzuSlW+t00Roq+yugX6VjzflDeNkf9?=
 =?us-ascii?Q?wv42gQzDoRW+KY7/oymEytc+rooFiXt4Y6quKeFsYyUW1AZG2uP6HOwVCp+O?=
 =?us-ascii?Q?NHjlb1fFLaOC9UzP/PWX8tDPYPhJrzLtKhqJTR+4kpxshvB59ffKEKBK/JUU?=
 =?us-ascii?Q?GzktTlmHTcYjFKkuoRbmVAocaEIVorbSPvVZevEwPhQM9qGxFewdZwgvz/8d?=
 =?us-ascii?Q?G9o0iCQpq88KhXeojK0foh6Y5N7dO81uQZBW9LnUSPu4VvJQwqFKsAhy6yDV?=
 =?us-ascii?Q?+n2m/uvDvlD+kf1+87CQauBsHytk6MCi8b3GIJ5cGJltC4HgjKUf+oszYGU+?=
 =?us-ascii?Q?HXeVmUFHwEYUczTLcOfZ9GZbt3GCgp5EEz1QM+CqXVU6t0Gi5XRSI1r1grdI?=
 =?us-ascii?Q?KimnyTwADPp2CGzzC9vr2yXcy1FQL6bEB6jkcOK+jLHelJgIIBC0vB9vZyUB?=
 =?us-ascii?Q?rTQau3nNTpTCN41anwoZ67tDEr3lMnn4DZ9Jx1RIYaQx0TLU/yCXIesBjBL/?=
 =?us-ascii?Q?UutivPJt+GUl5tLkZnGR8pMb7Ah0WbWiVN9sx0CAhy3KwjbpyLpFLDyzbeA6?=
 =?us-ascii?Q?0qVpX6ZZfapIn5EqyZwJhmRLT2OB0cTKisp+RICnS1/txFmthCvr3HBcMtJ1?=
 =?us-ascii?Q?6JoUfV5Af/0uIpSq3S+aXdxi9QuySrZSKUg4cSLZpAWyOywNHCR02jGZfAYh?=
 =?us-ascii?Q?148877fZGu7GQxrkVUmGUWPbLiucjKnonq1sjy3JHGwdk+7r40dqkswRpFxU?=
 =?us-ascii?Q?ZZRW2mhfphFi85LS5O+BBDgIqr7y81xIQ2tKtpdeBx99EMDLpAbzG5VBnZfT?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93049c23-5fb2-40b5-0ace-08dabb46b8c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 13:49:25.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndz8Xr6B5cRRx3bUMLkfMyjtuQ44+APnmK3rftMJNgeTywtam7MfP2e+29hNuCvUe54GFvNUyN+oplCFhmvbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
X-OriginatorOrg: intel.com

--ql/3ZYbYs2rOVbex
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Greeting,

FYI, we noticed BUG:KASAN:out-of-bounds_in__poison_element due to commit (built with gcc-11):

commit: ec1c2fec0d563537617775e3994a9d064f16003f ("mempool: do not use ksize() for poisoning")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202210312110.1fe5d224-oliver.sang@intel.com


[    2.680111][    T1] ==================================================================
[    2.680621][    T1] BUG: KASAN: out-of-bounds in __poison_element+0x19/0x50
[    2.680621][    T1] Write of size 18446612686373417535 at addr ffff88810080c040 by task swapper/0/1
[    2.680621][    T1]
[    2.680621][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc1-00236-gec1c2fec0d56 #1
[    2.680621][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
[    2.680621][    T1] Call Trace:
[    2.680621][    T1]  <TASK>
[    2.680621][    T1]  dump_stack_lvl+0x45/0x59
[    2.680621][    T1]  print_address_description+0x87/0x2a3
[    2.680621][    T1]  print_report+0x101/0x1e7
[    2.680621][    T1]  ? __poison_element+0x19/0x50
[    2.680621][    T1]  ? kasan_addr_to_slab+0x9/0xa0
[    2.680621][    T1]  ? __poison_element+0x19/0x50
[    2.680621][    T1]  kasan_report+0xc0/0x1b0
[    2.680621][    T1]  ? mempool_init_node+0x291/0x670
[    2.680621][    T1]  ? __poison_element+0x19/0x50
[    2.680621][    T1]  ? kasan_check_range+0x144/0x190
[    2.680621][    T1]  ? memset+0x20/0x40
[    2.680621][    T1]  ? __poison_element+0x19/0x50
[    2.680621][    T1]  ? mempool_init_node+0x313/0x670
[    2.680621][    T1]  ? mempool_init+0xd/0x10
[    2.680621][    T1]  ? bioset_init+0x2f7/0x720
[    2.680621][    T1]  ? rcu_tasks_kthread+0x41/0xa0
[    2.680621][    T1]  ? init_bio+0xca/0x10c
[    2.680621][    T1]  ? blkdev_init+0x1b/0x1b
[    2.680621][    T1]  ? do_one_initcall+0xae/0x390
[    2.680621][    T1]  ? trace_event_raw_event_initcall_level+0x160/0x160
[    2.680621][    T1]  ? parameq+0xd0/0xd0
[    2.680621][    T1]  ? do_initcalls+0x1cd/0x1fd
[    2.680621][    T1]  ? kernel_init_freeable+0x249/0x27a
[    2.680621][    T1]  ? rest_init+0x200/0x200
[    2.680621][    T1]  ? kernel_init+0x14/0x130
[    2.680621][    T1]  ? ret_from_fork+0x1f/0x30
[    2.680621][    T1]  </TASK>
[    2.680621][    T1]
[    2.680621][    T1] Allocated by task 1:
[    2.680621][    T1]  kasan_save_stack+0x23/0x50
[    2.680621][    T1]  kasan_set_track+0x21/0x30
[    2.680621][    T1]  __kasan_slab_alloc+0x54/0x60
[    2.680621][    T1]  kmem_cache_alloc+0x17e/0x4b0
[    2.680621][    T1]  mempool_init_node+0x291/0x670
[    2.680621][    T1]  mempool_init+0xd/0x10
[    2.680621][    T1]  bioset_init+0x2f7/0x720
[    2.680621][    T1]  init_bio+0xca/0x10c
[    2.680621][    T1]  do_one_initcall+0xae/0x390
[    2.680621][    T1]  do_initcalls+0x1cd/0x1fd
[    2.680621][    T1]  kernel_init_freeable+0x249/0x27a
[    2.680621][    T1]  kernel_init+0x14/0x130
[    2.680621][    T1]  ret_from_fork+0x1f/0x30
[    2.680621][    T1]
[    2.680621][    T1] The buggy address belongs to the object at ffff88810080c040
[    2.680621][    T1]  which belongs to the cache bio-192 of size 192
[    2.680621][    T1] The buggy address is located 0 bytes inside of
[    2.680621][    T1]  192-byte region [ffff88810080c040, ffff88810080c100)
[    2.680621][    T1]
[    2.680621][    T1] The buggy address belongs to the physical page:
[    2.680621][    T1] page:ffffea0004020300 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff88810080c1c0 pfn:0x10080c
[    2.680621][    T1] head:ffffea0004020300 order:1 compound_mapcount:0 compound_pincount:0
[    2.680621][    T1] flags: 0x8000000000010200(slab|head|zone=2)
[    2.680621][    T1] raw: 8000000000010200 ffff888111e10bc8 ffff888111e10bc8 ffff888100807240
[    2.680621][    T1] raw: ffff88810080c1c0 0000000000150001 00000001ffffffff 0000000000000000
[    2.680621][    T1] page dumped because: kasan: bad access detected
[    2.680621][    T1] page_owner tracks the page as allocated
[    2.680621][    T1] page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 2680099528, free_ts 0
[    2.680621][    T1]  get_page_from_freelist+0x486/0x8b0
[    2.680621][    T1]  __alloc_pages+0x261/0x600
[    2.680621][    T1]  allocate_slab+0x1ed/0x2c0
[    2.680621][    T1]  ___slab_alloc+0x3be/0xae0
[    2.680621][    T1]  kmem_cache_alloc+0x3aa/0x4b0
[    2.680621][    T1]  mempool_init_node+0x291/0x670
[    2.680621][    T1]  mempool_init+0xd/0x10
[    2.680621][    T1]  bioset_init+0x2f7/0x720
[    2.680621][    T1]  init_bio+0xca/0x10c
[    2.680621][    T1]  do_one_initcall+0xae/0x390
[    2.680621][    T1]  do_initcalls+0x1cd/0x1fd
[    2.680621][    T1]  kernel_init_freeable+0x249/0x27a
[    2.680621][    T1]  kernel_init+0x14/0x130
[    2.680621][    T1]  ret_from_fork+0x1f/0x30
[    2.680621][    T1] page_owner free stack trace missing
[    2.680621][    T1]
[    2.680621][    T1] Memory state around the buggy address:
[    2.680621][    T1]  ffff88810080bf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    2.680621][    T1]  ffff88810080bf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    2.680621][    T1] >ffff88810080c000: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
[    2.680621][    T1]                                            ^
[    2.680621][    T1]  ffff88810080c080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    2.680621][    T1]  ffff88810080c100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[    2.680621][    T1] ==================================================================
[    2.680636][    T1] Disabling lock debugging due to kernel taint
[    2.681642][    T1] BUG: unable to handle page fault for address: ffffde204020264f
[    2.682621][    T1] #PF: supervisor read access in kernel mode
[    2.682621][    T1] #PF: error_code(0x0000) - not-present page
[    2.682621][    T1] PGD 10002a067 P4D 10002a067 PUD 0
[    2.682621][    T1] Oops: 0000 [#1] SMP KASAN
[    2.682621][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B              6.1.0-rc1-00236-gec1c2fec0d56 #1
[    2.682621][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
[    2.682621][    T1] RIP: 0010:__poison_element+0x2a/0x50
[    2.682621][    T1] Code: 55 53 48 89 fb 48 8d 6e ff be 6b 00 00 00 48 89 ea 48 01 eb e8 17 f2 16 00 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 48 89 da 83 e2 07 38 d0 7f 04 84 c0 75 06 c6 03 a5 5b
[    2.682621][    T1] RSP: 0000:ffff888100b3fd28 EFLAGS: 00010a03
[    2.682621][    T1] RAX: dffffc0000000000 RBX: ffff11020101327f RCX: fffffbfff122e081
[    2.682621][    T1] RDX: 1fffe2204020264f RSI: 0000000000000008 RDI: ffffffff89170400
[    2.682621][    T1] RBP: ffff88810080723f R08: ffffffff8117d9c1 R09: ffffffff89170407
[    2.682621][    T1] R10: fffffbfff122e080 R11: 0000000000000000 R12: ffff88810080c040
[    2.682621][    T1] R13: dffffc0000000000 R14: 0000000000000cc0 R15: ffffffff89d24178
[    2.682621][    T1] FS:  0000000000000000(0000) GS:ffff8883ae800000(0000) knlGS:0000000000000000
[    2.682621][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.682621][    T1] CR2: ffffde204020264f CR3: 0000000006e77000 CR4: 00000000000406f0
[    2.682621][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.682621][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.682621][    T1] Call Trace:
[    2.682621][    T1]  <TASK>
[    2.682621][    T1]  mempool_init_node+0x313/0x670
[    2.682621][    T1]  mempool_init+0xd/0x10
[    2.682621][    T1]  bioset_init+0x2f7/0x720
[    2.682621][    T1]  ? rcu_tasks_kthread+0x41/0xa0
[    2.682621][    T1]  init_bio+0xca/0x10c
[    2.682621][    T1]  ? blkdev_init+0x1b/0x1b
[    2.682621][    T1]  do_one_initcall+0xae/0x390
[    2.682621][    T1]  ? trace_event_raw_event_initcall_level+0x160/0x160
[    2.682621][    T1]  ? parameq+0xd0/0xd0
[    2.682621][    T1]  do_initcalls+0x1cd/0x1fd
[    2.682621][    T1]  kernel_init_freeable+0x249/0x27a
[    2.682621][    T1]  ? rest_init+0x200/0x200
[    2.682621][    T1]  kernel_init+0x14/0x130
[    2.682621][    T1]  ret_from_fork+0x1f/0x30
[    2.682621][    T1]  </TASK>
[    2.682621][    T1] Modules linked in:
[    2.682621][    T1] CR2: ffffde204020264f
[    2.682621][    T1] ---[ end trace 0000000000000000 ]---
[    2.682621][    T1] RIP: 0010:__poison_element+0x2a/0x50
[    2.682621][    T1] Code: 55 53 48 89 fb 48 8d 6e ff be 6b 00 00 00 48 89 ea 48 01 eb e8 17 f2 16 00 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 48 89 da 83 e2 07 38 d0 7f 04 84 c0 75 06 c6 03 a5 5b
[    2.682621][    T1] RSP: 0000:ffff888100b3fd28 EFLAGS: 00010a03
[    2.682621][    T1] RAX: dffffc0000000000 RBX: ffff11020101327f RCX: fffffbfff122e081
[    2.682621][    T1] RDX: 1fffe2204020264f RSI: 0000000000000008 RDI: ffffffff89170400
[    2.682621][    T1] RBP: ffff88810080723f R08: ffffffff8117d9c1 R09: ffffffff89170407
[    2.682621][    T1] R10: fffffbfff122e080 R11: 0000000000000000 R12: ffff88810080c040
[    2.682621][    T1] R13: dffffc0000000000 R14: 0000000000000cc0 R15: ffffffff89d24178
[    2.682621][    T1] FS:  0000000000000000(0000) GS:ffff8883ae800000(0000) knlGS:0000000000000000
[    2.682621][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.682621][    T1] CR2: ffffde204020264f CR3: 0000000006e77000 CR4: 00000000000406f0
[    2.682621][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.682621][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.682621][    T1] Kernel panic - not syncing: Fatal exception




To reproduce:

        

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



--ql/3ZYbYs2rOVbex
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-review/Peter-Xu/mm-hugetlb-Make-huge_pte_offset-thread-safe-for-pmd-unshare/20221031-053221'
	export commit='ec1c2fec0d563537617775e3994a9d064f16003f'
	export kconfig='x86_64-randconfig-a014-20221031'
	export nr_vm=300
	export submit_id='635f4cb62704326c7a932fc0'
	export job_file='/lkp/jobs/scheduled/vm-meta-238/boot-1-debian-11.1-i386-20220923.cgz-ec1c2fec0d563537617775e3994a9d064f16003f-20221031-27770-1cmft9-2.yaml'
	export id='1d99f3b33d6ca3065df3f50ded4156ae934ccad9'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-11'
	export enqueue_time='2022-10-31 12:19:03 +0800'
	export _id='635f50182704326c7a932fc2'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f/3'
	export scheduler_version='/lkp/lkp/.src-20221029-175619'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f/vmlinuz-6.1.0-rc1-00236-gec1c2fec0d56
branch=linux-review/Peter-Xu/mm-hugetlb-Make-huge_pte_offset-thread-safe-for-pmd-unshare/20221031-053221
job=/lkp/jobs/scheduled/vm-meta-238/boot-1-debian-11.1-i386-20220923.cgz-ec1c2fec0d563537617775e3994a9d064f16003f-20221031-27770-1cmft9-2.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a014-20221031
commit=ec1c2fec0d563537617775e3994a9d064f16003f
vmalloc=256M initramfs_async=0 page_owner=on
initcall_debug
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export meta_host='vm-meta-238'
	export kernel='/pkg/linux/x86_64-randconfig-a014-20221031/gcc-11/ec1c2fec0d563537617775e3994a9d064f16003f/vmlinuz-6.1.0-rc1-00236-gec1c2fec0d56'
	export dequeue_time='2022-10-31 12:35:09 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-238/boot-1-debian-11.1-i386-20220923.cgz-ec1c2fec0d563537617775e3994a9d064f16003f-20221031-27770-1cmft9-2.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--ql/3ZYbYs2rOVbex
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
igABnGPmkgQABriMHrHEZ/sCAAAAAARZWg==

--ql/3ZYbYs2rOVbex--
