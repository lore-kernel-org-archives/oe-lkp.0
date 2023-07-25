Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323D2BA47
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jul 2023 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276809; x=1721812809;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OofqkXW+Bg/6SoYONHU+AtDdOjwI5FHUEflif6L5aus=;
  b=gZZsNvHOEE3ieUAKEyXlL9lfiA50q3bqE170OQtLccafoecVAWuBTUFz
   kNaQ0hPi4k+5tY3prazP/0By1oRWnPULPvNb8cofZferwK2Inmb9vcHW5
   Ge5q7m7AAKIkeDMHXGAGJHd/J3a8Gr93HQJDxFW7karo/m5sT1bqWwC5K
   Wzd95P6O+mMilkG0+tJTKuv6HVCvsf3IAkiJ9XhLhyEyEKyd+hDkB0l8d
   pFNtG3k1CDIeykVUM35IwlGMcuRPJJo1QJSDcd5p+12uSRpFyXDUcL0Nj
   Ytwft10npTWf8xkQCWMYVHym18k7xq3SmXkiFPxGHHZd59uPsfam/K1P7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367691417"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367691417"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 02:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980855"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="719980855"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 02:20:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 02:20:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 02:20:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 02:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcWSRtinmpKsbCKg1tPVT9ahNSSf/3tRv8XIQmtW8LkfPOHMrwUOotdEzXtzGHjtom4tK+sDSULu/OD+DfU8ZMqxfMbPfV9uLZikilfRxy84u+IesRaf8p1gx3fhO9tzoYrAiM0oKMpkMkVRLHx5oTo4ofYTdW/Mrpi6EulLCad0oEovUdq2p3kXorUGubIuR8oHFFOnyT2U+DHy0kR4DgfaBeRG9ev+iLxfKpcKyDwTMun4mPBmrmw5v7HQQjKYMgOW4coxX1sfFHgInM/jKhq80bc0i4E45NCz0EynS473JxnY3M5LJACyZdXxBBiw1M15t6+eOkHk4h15uLu+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaz9gC5mBiHJoiBTUQnzXiVBMITT/DUYV0cQQDejq0I=;
 b=OVWoY3bdH84jGAp78UOScQ6MkaAbUSMSgCTRC0fGA9HOz+zVk1Qj8XjYsz/nojb5roI1v7b+oLJjhmAWWiH+kBtSAqd7LCBwQDxrG6KA1Nr2yM45zGyL/E7miVcoCZBQ8fOFviCVK1l1us94ZPa0VS1X6TqdTkUp43GG5KfDp27NeFuzjCp86QhEgMrKn2g6JZgZkBqEwI9Y1robTMfNyIiQOD9KI79XnQqKbmpGdFWluq83Ekq8XlQn7avI7YhpzJUqME6DByISjYq/QdQRkhpORn2nH4qbuzEhUlVt4xA8L6DXIQs23EdPitkCjZ4IrMjPr1NN+86fnY7SklMFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by CH3PR11MB8363.namprd11.prod.outlook.com (2603:10b6:610:177::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Tue, 25 Jul
 2023 09:20:02 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 09:20:02 +0000
Date: Tue, 25 Jul 2023 17:12:06 +0800
From: Feng Tang <feng.tang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
	David Rientjes <rientjes@google.com>
CC: "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel
	<jaypatel@linux.ibm.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	lkp <lkp@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying"
	<ying.huang@intel.com>, "Yin, Fengwei" <fengwei.yin@intel.com>,
	"cl@linux.com" <cl@linux.com>, "penberg@kernel.org" <penberg@kernel.org>,
	"rientjes@google.com" <rientjes@google.com>, "iamjoonsoo.kim@lge.com"
	<iamjoonsoo.kim@lge.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"tsahu@linux.ibm.com" <tsahu@linux.ibm.com>, "piyushs@linux.ibm.com"
	<piyushs@linux.ibm.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Message-ID: <ZL+R5kJpnHMUgGY2@feng-clx>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx>
 <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
 <ZL6MQXOaOHTvdGti@feng-clx>
 <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|CH3PR11MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 563d7dbc-205c-47ef-f209-08db8cf052f9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQV1GxpjK3xQdUFsQMlhWelOkK8tsnsA7pHqBzV62K3EdDY6h5QnBl6IRqrrXXcJnIHzTatiR56B8YjT6wh7FVc5zot6ZKgfzsqe9+6LUo5IHB0lYVAlgs98Kkvr+ed+h/dd0pxz9uVzz2jW3xalJRrvvE+3099iKquYbbOW6stEniqAmG4d67SIryO8hstvd1LObfapZmzSMQNNGRLF+Dv3Fw6BX4BJ2n1Yq2qGiCTGX8Ee4QzjAB9cyBwwFc32JpZE7iX+qdynjDaKT5uAUKH/h+e96OCQ5IflVm5jSH5YBBoKs9gdPLApYtvd3FFt9vF0q2Ss9PNTUegPXbENMlx/mhgFM/BCawxtplrYqWm/uSqmUa5Ec50GCf+vDNHvPu6EKoG8Sm1+5dOg+LB/870bYq0GepvdJeXwK0/pJVjlm2y1pQTqwzSVEsOGfTzX5/q90ikjYDjVqgFbEtwFZNQujriQuknDpIxIsXyynlxslcLFgEacIsB0LCzDNRV0a72fA3vOEnwWlYiJ8xSIcgp6Elj4gQgQY0btgcxGCWUqMdRlU0jqFer8PyMnxlLEl4nVIFb9V4KHOEA1cm2bnEi8LCIXP7W1+kaI7EPSlbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(9686003)(478600001)(316002)(86362001)(4326008)(33716001)(6486002)(6512007)(110136005)(66476007)(66556008)(82960400001)(66946007)(186003)(38100700002)(5660300002)(6506007)(41300700001)(26005)(8676002)(54906003)(7416002)(8936002)(44832011)(2906002)(83380400001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MfNw4dURa5M18sEm/yed7q82q+mK9UfR8MV0cTdWRQPQ2MWcF9C7JtvYYHXk?=
 =?us-ascii?Q?AwDqUKtLadt8nHrh53tsfMP7wBwBGnlKN91tK6dlILOp4btaR90IseTjoLx7?=
 =?us-ascii?Q?W7J4Wbr4tVCJV2ziTRpwoHglUoe1vR5avXxhEHOOndbtPkYjqNF2965uf9Jh?=
 =?us-ascii?Q?A+OPdW3O9cBt/QbIW1uNeYgdgHI+pjxvoQFYPZbjXd5I3/+RRLmDQsQPrU0m?=
 =?us-ascii?Q?St5dSNnrEzwfTDe6x/gZJdueqSLl2o0Qx4A47+B0KZSzn3jFHn5KCzIWdTb0?=
 =?us-ascii?Q?82dkZjV1hz+9RWOjIqlbWUneank69itFwzWS4DcU8eR7tQ5ZJfDkFe9FPGOW?=
 =?us-ascii?Q?iFbGix3ixwwdgxG9qaGFoud51fqUGy+k5BXC9SFSMIUXMU4ihp6NO3PJDolP?=
 =?us-ascii?Q?BbxcHPeVmpTWsVHgxze4rQFredYcQ1jYcQ5qAbt7qfgQH2bqVEn3zFjhGMty?=
 =?us-ascii?Q?iAavnofIkwGE5mQEjBCRe+Absg7moSSkWABlTiQ01er+M9yd6DJfUw7xVXCa?=
 =?us-ascii?Q?BF3r9I17d1n3Z/3R+yqecTEhVtjAha97GHhQ5pWr1QEWsyneftGWTOpX0cL3?=
 =?us-ascii?Q?dmu/7VrOTKsDiH4HE5xFk0s0PM6bTpk1quFIg0ACGu0I6XwC19RcXGtWWCGY?=
 =?us-ascii?Q?RVSHZLxLDB43AF+pp+tIbzKyzNwP/+6aaBCujsyYiz4StkVbGWMEkC+vdiku?=
 =?us-ascii?Q?xYwMwK69er2jx8AiYLT+VFBMHEodftBn+5wg5mF/Kkx0Q3NPcyly5IXkTIoz?=
 =?us-ascii?Q?t/9ogDWGLhig9q1Uv+UjCek9KXiOIFNavQqy5YfsRSJAx6z4IxnWOy+KLCra?=
 =?us-ascii?Q?PL43SV/CAhXrsOYLUpmx/hNxKPhqdCs8avOZZUUYe2bD8tTR2geWLlU+dB7I?=
 =?us-ascii?Q?45PjG75Ct8UlgYhcHbcG8C/fvrEnPHSHwZ2HiPCX2j06b2IKhTL/q++l9j8W?=
 =?us-ascii?Q?kRirVbnjHbB4RJOpeKND0CM5QLJs/1jvWwy4sqP5oS+bgP8TVU9AfnYvlAxc?=
 =?us-ascii?Q?pWd+nCS/4fFJjLlAxyVHHLAKb7LGwvVvgzRQ8lZhQdeDWj6XxI/zSmxJLRtq?=
 =?us-ascii?Q?EoV7PXxwDdwm95adLvB9PHsaOKXSAwqGtbXyfVHcggmOTBBI+CWiz20Sbz/s?=
 =?us-ascii?Q?jDXIsacgW15OAQs8dfqPxZDtFCPQwJi645Q5GcpmXdG71Yn64vRYtPD/DM3a?=
 =?us-ascii?Q?Tv4kWCQitfFI+AHK4UyGyOcztDMZDu+GKbzhWzbjaymh/f7DJm4o+OVBaRDh?=
 =?us-ascii?Q?+b4RLKrMxvi4liTaY0k2qJmHLVV5VI939D1xxiy9u3HavRNdJPqWxiS4FTac?=
 =?us-ascii?Q?rvFdoegF9dw0aauCXAX+4To188779E/1ILCDewPCf47ZwJyp6KXsPpeQ6/TH?=
 =?us-ascii?Q?KTszFDmIF5JttP7W22pJxGBq2xf8zesvdCvQzom5oiLF+ZctA7SHuDAC7hU6?=
 =?us-ascii?Q?Zu6WzCLMo9MC1LYQW8lYFCnfM1N7VYJw2M1N7sKPr7iQwhfaFLuL4CBCpZ+n?=
 =?us-ascii?Q?rZ7ijg2C8C+if4vqGFGqy+AOV/s449cIZS4B2KFpUYA/iEqO5vB86+08o5hf?=
 =?us-ascii?Q?Hne/TwfMldreyS+5/exdmc4BwvCE5JTrvHytR9YY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 563d7dbc-205c-47ef-f209-08db8cf052f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 09:20:01.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jomknUaLlUOvzSA7dwt6+q8/k6WFBnqN+1L22RUYKfYcREJUb2cM7chnpLOiXQskv8zFaL2lSkq3gbQqCBygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8363
X-OriginatorOrg: intel.com

On Tue, Jul 25, 2023 at 12:13:56PM +0900, Hyeonggon Yoo wrote:
[...]
> >
> > I run the reproduce command in a local 2-socket box:
> >
> > "/usr/bin/hackbench" "-g" "128" "-f" "20" "--process" "-l" "30000" "-s" "100"
> >
> > And found 2 kmem_cache has been boost: 'kmalloc-cg-512' and
> > 'skbuff_head_cache'. Only order of 'kmalloc-cg-512' was reduced
> > from 3 to 2 with the patch, while its 'cpu_partial_slabs' was bumped
> > from 2 to 4. The setting of 'skbuff_head_cache' was kept unchanged.
> >
> > And this compiled with the perf-profile info from 0Day's report, that the
> > 'list_lock' contention is increased with the patch:
> >
> >     13.71%    13.70%  [kernel.kallsyms]         [k] native_queued_spin_lock_slowpath                            -      -
> > 5.80% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;__unfreeze_partials;skb_release_data;consume_skb;unix_stream_read_generic;unix_stream_recvmsg;sock_recvmsg;sock_read_iter;vfs_read;ksys_read;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_read
> > 5.56% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;get_partial_node.part.0;___slab_alloc.constprop.0;__kmem_cache_alloc_node;__kmalloc_node_track_caller;kmalloc_reserve;__alloc_skb;alloc_skb_with_frags;sock_alloc_send_pskb;unix_stream_sendmsg;sock_write_iter;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_write
> 
> Oh... neither of the assumptions were not true.
> AFAICS it's a case of decreasing slab order increases lock contention,
> 
> The number of cached objects per CPU is mostly the same (not exactly same,
> because the cpu slab is not accounted for),

Yes, this makes sense!

> but only increases the
> number of slabs
> to process while taking slabs (get_partial_node()), and flushing the current
> cpu partial list. (put_cpu_partial() -> __unfreeze_partials())
> 
> Can we do better in this situation? improve __unfreeze_partials()?

We can check that, IMHO, current MIN_PARTIAL and MAX_PARTIAL are too
small as a global parameter, especially for server platforms with
hundreds of GB or TBs memory.

As for 'list_lock', I'm thinking of bumping the number of per-cpu
objects in set_cpu_partial(), at least give user an option to do
that for sever platforms with huge mount of memory. Will do some test
around it, and let 0Day's peformance testing framework monitor
for any regression.

Thanks,
Feng

> 
> > Also I tried to restore the slub_max_order to 3, and the regression was
> > gone.
> >
> >  static unsigned int slub_max_order =
> > -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
> > +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 3;
> >  static unsigned int slub_min_objects;
