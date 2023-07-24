Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C049566E
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690209833; x=1721745833;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TttU874ZghYMXekR0ODJ04R9s9pzHuO6hxHoKwAVTVo=;
  b=P6gZQMyauPJnNzmZ23cTDqwpU3bsOTWXBIciDfS3ISMsqe19qIHoF3HM
   JA1U9jiTHvya9jMV/xccO6OcSoNxWmgdQFZ3LFz1M660Er1b3jJHLdbYn
   kKoSuSNxafw8nG6NymE72128t4hfT4qyqBvQhCL+P2Skwi7Li1f7qNFo8
   iu7bNRdCirvahiGfRIoegGb+AeqWdWdh2wMtlt4HT1m/WNhciboIUCx5R
   67vAEJ7INExC0VY4FJ69UVHzMh6QzWsXqA/Gp2cfk+ua9daFfRU7K+2Uo
   bqq+3RYW+QWHYy01l/AjXHJgkLg5lFOSDoftw1MLBfodlQ3vNPcK75dUV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370127348"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="370127348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 07:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="815860906"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="815860906"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 07:43:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 07:43:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 07:43:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 07:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPMAq6Ozg4u9fmY6txvlxU/x9o8DUAi9t15YIzgq6xMOgsjobO4UUlGtX16wOTN5RXBisv6Qy2PYC8TUX0gAORnBC0LomJa+neI3y8sdXJ0iW/pq+rag57oQRPVcVeI9d3CCezeEtQS3ZroH8rQlMVuFLUhd3+aEcWnXb70MKtpxQ3p4id9SeCzBoIPFSZb7gSJ1+NkL7Bi18hjVroUx83pwD4rLBqZxn9dlt32GLXqTCT39reY2Y3YO9Fq/YVyabqN6YumAJL4NRpsffYhe6srYKD146Pw0iWRd6QGimqsJO+mWjb3/5HxFIsUHSCLpVWY2yhS9wnwhi8Q6pe8fiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0lVcStv7vyU/yYwlGL/rk15eMd1Pzf7kv7RAxUq678=;
 b=d/jdJ5gPSAskI3W+vxIAPa7YZusoEXPkZJaxrfhJRAEGydMCbmhM6fSe/itnsri/4CnLOioicjx0ijxwvZZw2cUz2/Qqh3ajhW5aNMrnmex+cZpPIezqNPYzDnUcFXfjkDJxAVa8EQCDrh4b1Zon7XPUp3xfX/s0Y+MlBuDPECjhdjDGJgbSowZ2cl4otn+mraVl6/pJ7LubHN9C3wc7hnUtjQnDJ1ck6nIgx9MTLmNRiQflS2leZvvCcB6I314CLyD19CbWLpdzYWuNDnhukuIcg8YmLGVBs6Q9S1ZJ6z0N84AAVOoqlKszUi81LN1GVEAk3eQ3ifYR1gmWagqgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 14:43:42 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 14:43:42 +0000
Date: Mon, 24 Jul 2023 22:35:45 +0800
From: Feng Tang <feng.tang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Message-ID: <ZL6MQXOaOHTvdGti@feng-clx>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx>
 <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: e9baf6ac-c490-494a-aade-08db8c54600b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rm2wCqkK6mDp/a4ELPUVwrGomKPHz5BFu9cxUkFcNWjRN7tzDJucTdwYdr1k6ENl2Gv4ulzgdLx3GRcNlW/hnhNVOydLVEBdS7whCRGyX0qBJTqK9MTeYDJjlHtDyBcQcQD2fimIz9dZtYhxjMlohyNRcFp3TejGfbWzqCTZjJek99///oYHr4ZnFNdAUVXRnW1ELaYNNUuo8BStMfPlor3iGO7Oego3VakBemvhyzPOc0bgQRYTUjxkrNiGSYRb/aC4Ty5bgoahWjUc5LE04ApC2EtEbRwYq5zf/6wjA4y8+DroW3do90x3tQdUt+XnZbeSZvcQy7gSDmIjG24URgp/df8o1wpgIdM7WlRFzKKiNzJ684Rs6/KDOwCXq0tM1v65zfdAUXOj9l7U8dGzxvOp4Mp4t+AFV8dIPF+Sq7415oenU6hnNAIng2GqJVx5l2ZFZ2ckadKl+1Ura56niws7G4XjFsBmtAJJ6BmGmUmsd8JAWoDPRvQV3ebxg4L8iPP8Z6z5+wRHdL+ZmPNejsMZiVZUlYjRTIRneHLvzpKYbHg58X7hSrCRUR6NAr1i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(41300700001)(6506007)(186003)(83380400001)(478600001)(26005)(9686003)(6512007)(2906002)(6486002)(86362001)(7416002)(44832011)(5660300002)(66556008)(66476007)(66946007)(4326008)(6916009)(8936002)(33716001)(8676002)(316002)(82960400001)(38100700002)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STh4NCs4cE9QMXpPMWVpeDVneXloZEIwdEIwMWplcGt5elFOL1hDbGZLSTVP?=
 =?utf-8?B?bWp5b3ZnTTRBZzA4M1hWRUtXVU5vc25rUTMwcjNuZmxJdUJYem5YUUFHYloz?=
 =?utf-8?B?OGxpL2NDbWFmT1p2NUZZZTJGYkZOVWtmUnVUOWYyNS9JTjNNcjh4TDN0OWZn?=
 =?utf-8?B?NUljbVdDQTNYMGtCSTBUbFk3WG0zRGpCOGZDY0dtdks0ZnFCQVpjSTdpbkxM?=
 =?utf-8?B?aFhwaEVFNmd2YU1pR2paVjNPKzlZWGZtMDB3cW4venZhVUN6WlFOSnh5Uysx?=
 =?utf-8?B?dmwwcFdqNytSQURhSnVNZi9wa1phbVhjTFZpZUt2bzNyQXpTUGRmTThFK2lQ?=
 =?utf-8?B?RXBlTXMwNTF3NHk5SGptZGdpK012ZWJjVGJMVmhpa0t6aTlIYXBRREJlUm1U?=
 =?utf-8?B?cXpPKzJ6OFUzeC9NQWpPY2Yva2RzNTlwd1N5UHZWcHBNYWk4VHhSeXhxOXRh?=
 =?utf-8?B?elYrU1ZhSzNiZFBXRmZuNUEzMDcxVjJQUWUxM2R5dzFhZEtPcjJTQW1WWWhi?=
 =?utf-8?B?RzFwRlV2ZytwL2orcUoxSlRDV25LYW1ZV2tYNytPdTdsOGxHd0ZuSWNkNTRj?=
 =?utf-8?B?UGFyeTBNS2N2R2lLc0VLSW1kVWttZUVsU1RrMndCZkRkcER5Z3BiUGpNby9F?=
 =?utf-8?B?QmNmTlpTYWFNeWZadjhVS3V3emVqdG5zWEhlVkxUQlI1UDhPY2twRkRCRzJT?=
 =?utf-8?B?cXBvNXRWc01kaHpXZzlQa3N3S1NvVmFCYVhrMGlnQkZLZDJhWXIrNlBwNG1l?=
 =?utf-8?B?cUV4alBJcGZGY2xMdUVQa3IxWDlGWnJxaDU0RWpUR1l0RkpNdUppTkpXM0Nq?=
 =?utf-8?B?QmJpaDhMV0xjWFgzZXpqTTREWnk5aTI3NUVENWNzUStYOFBhZ0piNzRWc2Nv?=
 =?utf-8?B?Z1dpMTFZN01HbVJDMWNhY0orL2p5S1NwWnB2Yy80WXVFbU83UkhmcGIzS0ox?=
 =?utf-8?B?bVpLV09laGZ6Z1pCdW85RlVac0FzQ2U1RXNuWGgyUWRSV0M5WmpEL21MdzZu?=
 =?utf-8?B?OGE4YnVpLytCR2ZpR21qQjlEc0x0a25jUDl5OFhnTW1USy8xTXF2UG5pTHdJ?=
 =?utf-8?B?SUZNSk9mSTk4WGIyaDdiNW1ZSkJJR2xaVUxSZ2pUcGNXN1RzZmNhWTdLOHpB?=
 =?utf-8?B?ZnVNNDUyS1VHb2VrMld1K2haN2pZdzhEMWdVQXVMVEN3RnRCb0pUOE02Q2k2?=
 =?utf-8?B?aWwxY1NvWlhsWDVCeHliZDVSLzVBa1VpSFZxSittbjVvYzcwYjhpY0NmTXI5?=
 =?utf-8?B?T2U5SHpzeFJacU41aTFOanhwUmovdC91NTdNRXB1Tmd0N3pDeHdHdWF2Z1RW?=
 =?utf-8?B?ZWN3cUlYcktFaDhqdEViZnFMbmFRcjFtYXdVaFdwUWtXaWYvb3pYbDQraTcv?=
 =?utf-8?B?UHpVc0JIajJFVjVjU3JxK09NZ0FmVDBQUHoydm9rek0yVW55NEpoVFN2aXJn?=
 =?utf-8?B?cjBNL0VHWDRVb0M1WnlyMU9EeUJkaDBrMGpERGJXY2wxVlBaYXRZdk9wQlVK?=
 =?utf-8?B?S0xTTFppTjdaZWJaM3QwZHZtb1NkRW1FRGFDUmhjSGdlZUhIWDNJeTBxOGJi?=
 =?utf-8?B?eTcwN2lHeEREU2liM2JFRUlSRVRNM1I4NW1mWHRYYW9Rei9HOENDMklieE1n?=
 =?utf-8?B?R1lOemRZTDk4c2diUUphVjYwaGxHRjNuY3pUUmo5Q2JmRCtZdjJ1RUVmWmp4?=
 =?utf-8?B?clNiU2c4b1NUdXMxSk5UWEhLY0djbkQ0M0E5cmxXeURUTkRSLzN6bEduNHps?=
 =?utf-8?B?MURyZVRhK2dOdTBhcHd2by8rQTJJSHl3ZjlhWGdpVHhWVUlubit4ZkxnOUtQ?=
 =?utf-8?B?VlB3TjJnTEhRMkJNNlZEb0JEdmFjNk5CM1V4QVhlOUtTU1Q0RWdoUXo2ZTI5?=
 =?utf-8?B?UE03cWM4cGVMZEFsamJNSURWNlhXK3R1VnZkNjMrMXFySSttdjkrZkF5ZFdo?=
 =?utf-8?B?MlJSNVh5bHp3bGFFRE1Jc1l3QXB5bXpLY0hrMTBYbDJEZzhURFJsWnZPbGxi?=
 =?utf-8?B?cWNOS2lvZGVyQnlWWlVsVnZiZnAyb2wrci83OFVvalFvR2JZc0JaTzhQbURU?=
 =?utf-8?B?ZHAzWTkrcTdFQjhqQmtGOElVZ2NRN3FsNERWYnZhTkE2Vi9DWVZHaGJtZm1i?=
 =?utf-8?Q?ijR3gg+EJ9KeLWDhN7DRa3xoi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9baf6ac-c490-494a-aade-08db8c54600b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:43:42.1840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TO3c2oIQlH1DbGLmJoQLc7xUC1+v4IQAwzFePuGYM1GA9v3R1tQGpHBGoxPAZZV4267dtqm5ksV13iIzk9hpMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
X-OriginatorOrg: intel.com

On Thu, Jul 20, 2023 at 11:05:17PM +0800, Hyeonggon Yoo wrote:
> > > > let me introduce our test process.
> > > >
> > > > we make sure the tests upon commit and its parent have exact same environment
> > > > except the kernel difference, and we also make sure the config to build the
> > > > commit and its parent are identical.
> > > >
> > > > we run tests for one commit at least 6 times to make sure the data is stable.
> > > >
> > > > such like for this case, we rebuild the commit and its parent's kernel, the
> > > > config is attached FYI.
> > >
> > > Hello Oliver,
> > >
> > > Thank you for confirming the testing environment is totally fine.
> > > and I'm sorry. I didn't mean to offend that your tests were bad.
> > >
> > > It was more like  "oh, the data totally doesn't make sense to me"
> > > and I blamed the tests rather than my poor understanding of the data ;)
> > >
> > > Anyway,
> > > as the data shows a repeatable regression,
> > > let's think more about the possible scenario:
> > >
> > > I can't stop thinking that the patch must've affected the system's
> > > reclamation behavior in some way.
> > > (I think more active anon pages with a similar number total of anon
> > > pages implies the kernel scanned more pages)
> > >
> > > It might be because kswapd was more frequently woken up (possible if
> > > skbs were allocated with GFP_ATOMIC)
> > > But the data provided is not enough to support this argument.
> > >
> > > >  2.43 ± 7% +4.5 6.90 ± 11% perf-profile.children.cycles-pp.get_partial_node
> > > >  3.23 ±  5%      +4.5        7.77 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
> > > >  7.51 ±  2%      +4.6       12.11 ±  5%  perf-profile.children.cycles-pp.kmalloc_reserve
> > > > 6.94 ±  2%      +4.7       11.62 ±  6%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
> > > > 6.46 ±  2%      +4.8       11.22 ±  6%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
> > > >  8.48 ±  4%      +7.9       16.42 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> > > >  6.12 ±  6%      +8.6       14.74 ±  9%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
> > >
> > > And this increased cycles in the SLUB slowpath implies that the actual
> > > number of objects available in
> > > the per cpu partial list has been decreased, possibly because of
> > > inaccuracy in the heuristic?
> > > (cuz the assumption that slabs cached per are half-filled, and that
> > > slabs' order is s->oo)
> >
> > From the patch:
> >
> >  static unsigned int slub_max_order =
> > -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
> > +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
> >
> > Could this be related? that it reduces the order for some slab cache,
> > so each per-cpu slab will has less objects, which makes the contention
> > for per-node spinlock 'list_lock' more severe when the slab allocation
> > is under pressure from many concurrent threads.
> 
> hackbench uses skbuff_head_cache intensively. So we need to check if
> skbuff_head_cache's
> order was increased or decreased. On my desktop skbuff_head_cache's
> order is 1 and I roughly
> guessed it was increased, (but it's still worth checking in the testing env)
> 
> But decreased slab order does not necessarily mean decreased number
> of cached objects per CPU, because when oo_order(s->oo) is smaller,
> then it caches
> more slabs into the per cpu slab list.
> 
> I think more problematic situation is when oo_order(s->oo) is higher,
> because the heuristic
> in SLUB assumes that each slab has order of oo_order(s->oo) and it's
> half-filled. if it allocates
> slabs with order lower than oo_order(s->oo), the number of cached
> objects per CPU
> decreases drastically due to the inaccurate assumption.
> 
> So yeah, decreased number of cached objects per CPU could be the cause
> of the regression due to the heuristic.
> 
> And I have another theory: it allocated high order slabs from remote node
> even if there are slabs with lower order in the local node.
> 
> ofc we need further experiment, but I think both improving the
> accuracy of heuristic and
> avoiding allocating high order slabs from remote nodes would make SLUB
> more robust.
 
I run the reproduce command in a local 2-socket box:

"/usr/bin/hackbench" "-g" "128" "-f" "20" "--process" "-l" "30000" "-s" "100"

And found 2 kmem_cache has been boost: 'kmalloc-cg-512' and
'skbuff_head_cache'. Only order of 'kmalloc-cg-512' was reduced
from 3 to 2 with the patch, while its 'cpu_partial_slabs' was bumped
from 2 to 4. The setting of 'skbuff_head_cache' was kept unchanged.

And this compiled with the perf-profile info from 0Day's report, that the
'list_lock' contention is increased with the patch: 

    13.71%    13.70%  [kernel.kallsyms]         [k] native_queued_spin_lock_slowpath                            -      -            
5.80% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;__unfreeze_partials;skb_release_data;consume_skb;unix_stream_read_generic;unix_stream_recvmsg;sock_recvmsg;sock_read_iter;vfs_read;ksys_read;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_read
5.56% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;get_partial_node.part.0;___slab_alloc.constprop.0;__kmem_cache_alloc_node;__kmalloc_node_track_caller;kmalloc_reserve;__alloc_skb;alloc_skb_with_frags;sock_alloc_send_pskb;unix_stream_sendmsg;sock_write_iter;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_write

Also I tried to restore the slub_max_order to 3, and the regression was
gone.

 static unsigned int slub_max_order =
-	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
+	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 3;
 static unsigned int slub_min_objects;

Thanks,
Feng

> > I don't have direct data to backup it, and I can try some experiment.
> 
> Thank you for taking time for experiment!
> 
> Thanks,
> Hyeonggon
> 
> > > > then retest on this test machine:
> > > > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
