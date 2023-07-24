Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6319A21
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690166413; x=1721702413;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1u6V8gQ9PG456uBoMP94jYVTzjZ2Cdg65QXUYXJ/V3g=;
  b=FwDZn5+0geEQtVPHlOVm+r+sqvOjvgHBYZn3mgHGFGagF8FI+J+ZnyJC
   WbnndITu80uCpxsY9E9X0u91Os8NM++eRlo7dzeQchbaiKDvU2TWUZlq2
   xvw4i6OWYCOCi5LMgjOkj0RwOceKNxXdpZsyFU2QBN8IYHxkqk329ZBqw
   vYMl3H97YBwUXVoTGYipK3iAIkDwfC0PbqSOELuMt64Qd0sjaWadyDkbj
   vc1LFI9HFeGS4AlT5sT+AhxfWj22nfKk1ESp5Q5aFA8JCshTNC+OLchXr
   hEHevDdFR659foyy/gD2SinR+83R4DgDIiRxbf/z16eQfJURIbPUUjJpI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398232312"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208,209";a="398232312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 19:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="839274912"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208,209";a="839274912"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2023 19:39:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 19:39:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 23 Jul 2023 19:39:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 23 Jul 2023 19:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEA5jiysPIEBiqV2hvSr94TtFvNnQDyIW1MPYm7VkTiCsk340CtxTSMxKAbVADBhNKTnprP4mgH0lE5de2kq2XoaQEgve6ZvIf91NtdU2DsPMQQ+dRDi51KppGRpZpNzvoy3WnveBhTDBP6Lpml9CO/BkTD3rmhN/CKfcpwnDm1hFU+Qcdfg0mvF5q+p1jTTXFKw9ZfVYTlAX6syI3zue+AuHKGBG7qs1p2GBjlsNNW7x+GcCBSuk2aEV6Ul1tjyGf7Tyf3+I+IuO1gBaxnluag6cX1JrP2vNcoFmGzwiy37AjD6jB7yl34O3Evpc7LN6MCE2zQAWpY+9zEeadQOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc+fEJgUUlXbz0tBHpBzwKpX6PjICkw+d1bA1CvcJ5k=;
 b=nCDvcklO0mqlGfIJ3sSFC2BhlYePwjFQrkPzuVQXd8Xm5/XtD9aU1slw04ah5B2hGz3O+x5DnDrmpJCB6AbDzzdSSmawTkX7bBaRKJXsP8lN4n4euFp3MqG/zrbXjt4SIDI9HDNicLdXsJMzWl7CVL6FJpneE0WyxenNfQvp2O3m+FfPPp3H86aK3ftAHRFkzn1B/jr0h3dFPYkJ5ELMCC0gyEb2sV/OR5PTQxa1Gjiz+tGOvitv2k+ku4WjIMgvr5pWfplasrOs4sLxgwrEc3L0f+RjCkrR+e0umzBYS0SdkP2rvoNHi3e9HXOThyDDd5rOISUdh862Fq00omj11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 02:39:42 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 02:39:42 +0000
Date: Mon, 24 Jul 2023 10:39:30 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Jay Patel <jaypatel@linux.ibm.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-mm@kvack.org>, <ying.huang@intel.com>,
	<feng.tang@intel.com>, <fengwei.yin@intel.com>, <cl@linux.com>,
	<penberg@kernel.org>, <rientjes@google.com>, <iamjoonsoo.kim@lge.com>,
	<akpm@linux-foundation.org>, <vbabka@suse.cz>, <aneesh.kumar@linux.ibm.com>,
	<tsahu@linux.ibm.com>, <piyushs@linux.ibm.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Message-ID: <ZL3kYgZ3TK3e4otz@xsang-OptiPlex-9020>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <CAB=+i9Rn0WXgK-CfaKy0k7HXHx3VEmSjzopaPakcThSG5Ri3vA@mail.gmail.com>
 <CAB=+i9SRCZ1OKBTrojbnbR2YgtmGoRiuTW4VBqvbW1=TNgVWMQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="AcJ7fDBZ8OE2OUNP"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB=+i9SRCZ1OKBTrojbnbR2YgtmGoRiuTW4VBqvbW1=TNgVWMQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1627cf-08f2-4e8f-16b4-08db8bef3b50
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fKL2DyCjDwjXIwQgx/VY4yn59X2CyNMbes4DOOI7ifYm+wRRUkbPNBO7w8S8gEhRA2Xq8s+Ud6Qzh0Oo4H6HfEgdSWlAK1+90bUr1mC8s7XxC7JW5auNGOouQs9Gb4wkLJuAgHilK7vh+wQDdA4xrGOQ7mAzxET90GOkXw5RlxLFXwao8SbBQPadGGPrikyXvZ9Vb+0dm7NhNI+6Tp3mckVya5i3whOL0+h+SUPQdzY972Fsy767RZRHZnALI62FoxhJBDHDZ7Bq24r2/fHuV6jIVL93W2+mhtBEjWPMQQJvNEEXibN8m3/X/oqnZep2Y3xlny1dkE3p1xX0ZEdk8Hdsvho5vLbvT3o2L7veegOElvIyAA15V9XR2Lw5HFNQ3w80GC0phB/rrcL4I+mp30DyjT24E/CkC58XKyEAyKXoK+81B9cDCvn+2kuykjEIrpIvEXKguzG5SmswMgPPD++B+80ZGLTFdGo4oi3+jKSYU6jMNNJ+q5hAABSHyfkQMyLIhknzI3t6hpQT4TxijP5HeKnEJMIf5TuoYJTIh6vXE+8Rympl6b9UWdqT5XgSze+sGF/6246DuiMDtgLxuuYslQhEGY0zgP6lBjVHgUPxngzDewk/g4Q0ytIRNGd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199021)(38100700002)(53546011)(107886003)(83380400001)(8676002)(7416002)(44832011)(5660300002)(235185007)(8936002)(478600001)(66556008)(6916009)(66476007)(4326008)(66946007)(316002)(41300700001)(186003)(26005)(6506007)(6486002)(6512007)(44144004)(6666004)(9686003)(33964004)(2906002)(33716001)(86362001)(82960400001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3VWSm1LWmg4WjZaaVAwanRqeTZVSFkyMk0vclNGRkF3NUEwOTRCUm5HR0Jj?=
 =?utf-8?B?c2M4TC93K0g0M1lPUDdINTlMNVRRN1FhWXNDTU9KdXhZQlNvTE4xYnZMVXZH?=
 =?utf-8?B?dlZIVkMxeHZuQ1hjUlV6RnF6bjNEUXBXS1ZiMmF6ZmppNGtJR1RzUktVcUdX?=
 =?utf-8?B?NUZFQm40NG96SjVxVlpPaXNsd3J5cnNZNkkyU01zRTRBVDJVeWlyd0lzaVlQ?=
 =?utf-8?B?clpZSUVYZVNHS29WS01WOGtTL0oxM2dLR29wWmJNRUY0OHplaWZ0b2gwcnBG?=
 =?utf-8?B?Z3VQcWNKM1hCR3hycUk0dU5yQkVmcG9JTmJRbWJTNmpBdXJaTDkyalROandu?=
 =?utf-8?B?WUhZNzkwZFA5aGNjdENvQWZSQjVETUF2WlFFZkdqYVpmUnhzTkF6MWxmVyto?=
 =?utf-8?B?WEFXdTd0ZEo3Z2VIdWZEMDQybzd0MTQ5NjBIS1RqQmJhQ1dmL0ZKd2FVaHY1?=
 =?utf-8?B?MUQwM1FQN2xITnFKR1Q1MGozWGs4bHVhNWVaSnE4MzhIczhHSXhpQzRtKy9k?=
 =?utf-8?B?WDhwTWg5VWV5bUh2YUkyb0hGVzloMnRKcDl2WjFvSzRLc3pvcWlSNjQ1YmpD?=
 =?utf-8?B?Vm5wTXI3OFRDS0NDK2pjQjVOWUtKR0xyZm5ObVNKdVlWaU4rK1BzZHY5QWlh?=
 =?utf-8?B?REZZNHRYM0N0dnBGNWZBK2FnRlJDd1hiQmh1U1J5U2lzQkUvQkovcHEvN3JL?=
 =?utf-8?B?MmZLRGlyenVwdGErbUVLRk9rZ29DQVVDK1VVTi9LQUUvSzhnTVNLU1J4S3Jl?=
 =?utf-8?B?U241aHBwcmVuK3RpUnNyblhWYkNWWWpLWlkveTNVRGFKSG1ySWF2NXZIUVhQ?=
 =?utf-8?B?SVBacWNudzVLM2FqQ2h5a244bkY5MC9vT0FJTDgxbTlEQW1TMHBTTHlwaVZV?=
 =?utf-8?B?Nk1hdzFwMlFXejB0YitPb0dGZmp2Z1lpQkg3bDlFVG1DcHFZQ09WOGFYTDky?=
 =?utf-8?B?SGNhbEY0cTZqSUVxVVJiMk5zbFR2QzdSR1hyWUtDbXpyVW9xeU9VL3dxRHZY?=
 =?utf-8?B?akJTNnpGcisxK2lSNjdITExTYWpBUk53T2FseDZiT2ZHZ0Z5R1JjUmYyMTJS?=
 =?utf-8?B?RUpsQmVRZUs1WjlaQUlxWklsUy96aTZqZVVHM3RoQldUYlIwVE80S2FscWow?=
 =?utf-8?B?bFhMRjUrc1RMVlBsSENVWEY4UXZmb1hEUSt6b1RSS3JBWHVyRFlCWjZKVjQr?=
 =?utf-8?B?ckN3SnpxYURPdGsrWUVYNUV0ZU03ckNTZDFkWmNyWW93SjFNRENLVlNEM2Nt?=
 =?utf-8?B?dmZRTllGaHVKWDVSZHlubVpZbisraVEzbERXM0sxNDZFR3NadFl1R3M0VjBH?=
 =?utf-8?B?aTErZVY2UGFNOUJhTjRBRTkzdERaNEpybnZkdnNNMUo0L2lvczcrL1VRSng1?=
 =?utf-8?B?THJ5dWE5dHV5UkpWcEs5aVN5NEd4MUZURVdOeDF3WlBuaGgxTlJmWDFWMUJS?=
 =?utf-8?B?dmFzLzZIL0tXa3Bmcm5jU3gwakd6MFNpYXJvSXh4d0ZOSjMrTTZ5eTkxQm56?=
 =?utf-8?B?dE45MGoyZG9KUk9pbXYvL0JkenFGdGMwdWYzdVBpcjIrU0o4MmFIVFN4b3dt?=
 =?utf-8?B?Um5WQUlMbUIwOFRVYk5PR1IyNUFuOFdtT1NwTDVjZHBJVkpXYjJoU1JKOWVE?=
 =?utf-8?B?aGRhMllxOFc0LzlHTlEvT1BRTzU1a3ZIVVZoN0ttNXNJb1doZmdwd3NJdG5w?=
 =?utf-8?B?UE8ycDQxcjFIRUJsdldGRzFxdkRUTUpuZ3JubS82dHRRY0pFOFdhS1k3Nmtz?=
 =?utf-8?B?dFB1V0xQd0JXemEwTHFhNDBuWjZjNjNzcVJPb0FyRWJpTnIvZE93Zk9BVE1o?=
 =?utf-8?B?YzBkeklSM1BPYlZNL2RVcHBReXQxUnVZY1FNeDdZRVNJd1lLdDM5UTlBNWc3?=
 =?utf-8?B?N001ZWVuODdSeFNOQzZuclNzMk43NmR2ZUJ4QlJUS01rZDczN1h5Rkl3WGJU?=
 =?utf-8?B?OEJwRUFBL2EwOEVSblQwS3lnRDJuMFUyTVpvWkpSZ29Ib2Rsb0U4SXlzM2hV?=
 =?utf-8?B?b0ZRTEttVHhhdVc4YWdCdU5Edm9DSVkzOG5aUGlON3NMWGdsTk9FbTRGcmNn?=
 =?utf-8?B?dWVvakFtU1dxWUpZcEJ0ZjdYTnJxcnJ4VS81dUQwaW1aZ3NLR1RKM3BORkFP?=
 =?utf-8?Q?7ogddy8Mcgo89m/JsPP3Mu3Mj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1627cf-08f2-4e8f-16b4-08db8bef3b50
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 02:39:42.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYE+cU2YOvqtSjucE+5X7HgPfCel+c3oSAkT4GPUgZh/8Vu2Xy6T5tlzHlElXwDcFtJw314l/VTJmMUFqLUDhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
X-OriginatorOrg: intel.com

--AcJ7fDBZ8OE2OUNP
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

hi, Hyeonggon Yoo,

On Thu, Jul 20, 2023 at 11:15:04PM +0900, Hyeonggon Yoo wrote:
> On Thu, Jul 20, 2023 at 10:46â€¯PM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 9:59â€¯PM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
> > > On Thu, Jul 20, 2023 at 12:01â€¯PM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > > > commit:
> > > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > > >
> > > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > > ---------------- ---------------------------
> > > > > >          %stddev     %change         %stddev
> > > > > >              \          |                \
> > > > > >     222503 Ä… 86%    +108.7%     464342 Ä… 58%  numa-meminfo.node1.Active
> > > > > >     222459 Ä… 86%    +108.7%     464294 Ä… 58%  numa-meminfo.node1.Active(anon)
> > > > > >      55573 Ä… 85%    +108.0%     115619 Ä… 58%  numa-vmstat.node1.nr_active_anon
> > > > > >      55573 Ä… 85%    +108.0%     115618 Ä… 58%  numa-vmstat.node1.nr_zone_active_anon
> > > > >
> > > > > I'm quite baffled while reading this.
> > > > > How did changing slab order calculation double the number of active anon pages?
> > > > > I doubt two experiments were performed on the same settings.
> > > >
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
> >
> > Oh I missed the attachments.
> > I need more time to look more into that, but could you please test
> > this patch (attached)?
> 
> Oh, my mistake. It has nothing to do with reclamation modifiers.
> The correct patch should be this. Sorry for the noise.

I applied below patch directly upon "mm/slub: Optimize slub memory usage",
so our tree looks like below:

* 6ba0286048431 (linux-devel/fixup-a0fd217e6d6fbd23e91f8796787b621e7d576088) mm/slub: do not allocate from remote node to allocate high order slab
* a0fd217e6d6fb (linux-review/Jay-Patel/mm-slub-Optimize-slub-memory-usage/20230628-180050) mm/slub: Optimize slub memory usage
*---.   7bc162d5cc4de (vbabka-slab/for-linus) Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next

6ba0286048431 is as below [1]
since there are some line number differences, no sure if my applying ok? or
should I pick another base?

by this applying, we noticed the regression still exists.
on 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    479042           -12.5%     419357           -12.0%     421407        hackbench.throughput

detail data is attached as hackbench-6ba0286048431-ICL-Gold-6338


on 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp6/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    455347            -5.9%     428458            -6.4%     426221        hackbench.throughput

detail data is attached as hackbench-6ba0286048431-ICL-Platinum-8358


[1]
commit 6ba02860484315665e300d9f41511f36940a50f0 (linux-devel/fixup-a0fd217e6d6fbd23e91f8796787b621e7d576088)
Author: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date:   Thu Jul 20 22:29:16 2023 +0900

    mm/slub: do not allocate from remote node to allocate high order slab

    Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

diff --git a/mm/slub.c b/mm/slub.c
index 8ea7a5ccac0dc..303c57ee0f560 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1981,7 +1981,7 @@ static struct slab *allocate_slab(struct kmem_cache *s, gfp_t flags, int node)
         * Let the initial higher-order allocation fail under memory pressure
         * so we fall-back to the minimum order allocation.
         */
-       alloc_gfp = (flags | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOFAIL;
+       alloc_gfp = (flags | __GFP_THISNODE | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOFAIL;
        if ((alloc_gfp & __GFP_DIRECT_RECLAIM) && oo_order(oo) > oo_order(s->min))
                alloc_gfp = (alloc_gfp | __GFP_NOMEMALLOC) & ~__GFP_RECLAIM;





> From 74142b5131e731f662740d34623d93fd324f9b65 Mon Sep 17 00:00:00 2001
> From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Date: Thu, 20 Jul 2023 22:29:16 +0900
> Subject: [PATCH] mm/slub: do not allocate from remote node to allocate high
>  order slab
> 
> Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> ---
>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index f7940048138c..c584237d6a0d 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2010,7 +2010,7 @@ static struct slab *allocate_slab(struct kmem_cache *s, gfp_t flags, int node)
>  	 * Let the initial higher-order allocation fail under memory pressure
>  	 * so we fall-back to the minimum order allocation.
>  	 */
> -	alloc_gfp = (flags | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOFAIL;
> +	alloc_gfp = (flags | __GFP_THISNODE | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOFAIL;
>  	if ((alloc_gfp & __GFP_DIRECT_RECLAIM) && oo_order(oo) > oo_order(s->min))
>  		alloc_gfp = (alloc_gfp | __GFP_NOMEMALLOC) & ~__GFP_RECLAIM;
>  
> -- 
> 2.41.0
> 


--AcJ7fDBZ8OE2OUNP
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="hackbench-6ba0286048431-ICL-Gold-6338"
Content-Transfer-Encoding: 8bit


=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
  5.32e+08 ±  5%      -0.5%  5.291e+08 ±  7%      +0.7%  5.357e+08 ± 14%  cpuidle..time
   3717253 ±  7%      -6.0%    3495436 ±  8%      -8.1%    3417626 ±  5%  cpuidle..usage
    197.86 ±  7%      +6.9%     211.47            +7.2%     212.02 ±  3%  uptime.boot
      8150 ± 19%      -5.3%       7719 ±  6%      -3.2%       7887 ± 10%  uptime.idle
     64.22 ± 23%      -6.7%      59.94 ±  7%      -4.1%      61.60 ± 12%  boot-time.boot
     38.40 ± 41%     -15.7%      32.37 ± 11%      -8.6%      35.08 ± 22%  boot-time.dhcp
      7475 ± 21%      -5.7%       7046 ±  7%      -3.3%       7226 ± 11%  boot-time.idle
      3.80 ± 83%     -31.8%       2.59 ± 28%     -17.5%       3.13 ± 48%  boot-time.smp_boot
     18981 ±  4%      -8.7%      17323 ±  2%      -6.7%      17700 ±  3%  perf-c2c.DRAM.local
      3875 ±  6%      -2.5%       3778            -2.6%       3775 ±  4%  perf-c2c.DRAM.remote
     40096 ±  4%      +6.3%      42611            +3.5%      41499 ±  2%  perf-c2c.HITM.local
    390.50 ± 14%     +10.8%     432.83 ± 15%     +10.4%     431.00 ± 19%  perf-c2c.HITM.remote
     40487 ±  4%      +6.3%      43044 ±  2%      +3.6%      41930 ±  2%  perf-c2c.HITM.total
      2.85 ±  9%      -0.4        2.46 ±  5%      -0.5        2.38 ± 13%  mpstat.cpu.all.idle%
      0.00            +0.0        0.00 ±152%      +0.0        0.00        mpstat.cpu.all.iowait%
      1.36            -0.1        1.22            -0.1        1.23        mpstat.cpu.all.irq%
      0.04 ±  4%      -0.0        0.03            -0.0        0.03 ±  2%  mpstat.cpu.all.soft%
     90.36            +1.3       91.67            +1.3       91.71        mpstat.cpu.all.sys%
      5.39            -0.8        4.62            -0.7        4.65        mpstat.cpu.all.usr%
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    646925 ± 26%     +25.4%     811509 ± 29%     +14.6%     741438 ± 23%  numa-numastat.node0.local_node
    693386 ± 20%     +30.4%     904091 ± 27%     +14.9%     797000 ± 22%  numa-numastat.node0.numa_hit
     46461 ± 81%    +102.6%      94126 ± 31%     +19.6%      55562 ± 72%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
   1571252 ± 18%     -14.3%    1346549 ± 13%      -7.3%    1456518 ± 17%  numa-numastat.node1.local_node
   1663884 ± 16%     -16.3%    1393406 ± 13%      -7.3%    1541637 ± 15%  numa-numastat.node1.numa_hit
     92593 ± 39%     -49.5%      46769 ± 61%      -8.1%      85119 ± 48%  numa-numastat.node1.other_node
    130.57           +13.6%     148.34           +12.8%     147.34        time.elapsed_time
    130.57           +13.6%     148.34           +12.8%     147.34        time.elapsed_time.max
  90258628            -3.3%   87299873 ±  3%      -3.1%   87437140 ±  2%  time.involuntary_context_switches
     11065 ± 10%      -0.4%      11021 ± 11%      -4.3%      10584 ±  7%  time.major_page_faults
      2048            +0.0%       2048            +0.0%       2048        time.maximum_resident_set_size
    537871            +0.5%     540478            -1.1%     532082        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        time.page_size
     12341            +0.6%      12414            +0.5%      12407        time.percent_of_cpu_this_job_got
     15255           +15.2%      17572           +14.3%      17443        time.system_time
    860.68            -1.9%     844.07            -2.4%     839.76        time.user_time
 3.188e+08            -0.7%  3.167e+08            -0.6%  3.171e+08        time.voluntary_context_switches
      3.83 ±  9%     -21.7%       3.00           -17.4%       3.17 ± 11%  vmstat.cpu.id
     89.83            +1.5%      91.17            +1.3%      91.00        vmstat.cpu.sy
      5.00           -20.0%       4.00           -20.0%       4.00        vmstat.cpu.us
      0.00         +3e+102%       3.00 ±223% +3.8e+102%       3.83 ±223%  vmstat.io.bi
      4.00            +0.0%       4.00            +0.0%       4.00        vmstat.memory.buff
   5007806 ± 11%      -3.4%    4837228 ±  6%      -2.1%    4903725 ±  6%  vmstat.memory.cache
 2.553e+08            +0.2%  2.558e+08            +0.1%  2.556e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
      1708 ±  2%      +4.4%       1783            +4.2%       1780        vmstat.procs.r
   3085235           -12.8%    2690078 ±  2%     -12.1%    2710797        vmstat.system.cs
    566013           -13.8%     487865           -13.1%     491724        vmstat.system.in
    479042           -12.5%     419357           -12.0%     421407        hackbench.throughput
    466774           -12.2%     409886           -11.6%     412684        hackbench.throughput_avg
    479042           -12.5%     419357           -12.0%     421407        hackbench.throughput_best
    440206           -10.5%     393835            -9.6%     398071        hackbench.throughput_worst
    130.57           +13.6%     148.34           +12.8%     147.34        hackbench.time.elapsed_time
    130.57           +13.6%     148.34           +12.8%     147.34        hackbench.time.elapsed_time.max
  90258628            -3.3%   87299873 ±  3%      -3.1%   87437140 ±  2%  hackbench.time.involuntary_context_switches
     11065 ± 10%      -0.4%      11021 ± 11%      -4.3%      10584 ±  7%  hackbench.time.major_page_faults
      2048            +0.0%       2048            +0.0%       2048        hackbench.time.maximum_resident_set_size
    537871            +0.5%     540478            -1.1%     532082        hackbench.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        hackbench.time.page_size
     12341            +0.6%      12414            +0.5%      12407        hackbench.time.percent_of_cpu_this_job_got
     15255           +15.2%      17572           +14.3%      17443        hackbench.time.system_time
    860.68            -1.9%     844.07            -2.4%     839.76        hackbench.time.user_time
 3.188e+08            -0.7%  3.167e+08            -0.6%  3.171e+08        hackbench.time.voluntary_context_switches
      2483            +0.7%       2502            +0.7%       2500        turbostat.Avg_MHz
     97.00            +0.4       97.36            +0.3       97.32        turbostat.Busy%
      2566            +0.4%       2575            +0.3%       2574        turbostat.Bzy_MHz
   3675150 ±  7%      -6.0%    3453995 ±  8%      -8.1%    3375642 ±  5%  turbostat.C1
      3.11 ±  5%      -0.4        2.74 ±  7%      -0.3        2.78 ± 14%  turbostat.C1%
      3.00 ±  5%     -12.0%       2.64 ±  7%     -10.8%       2.68 ± 14%  turbostat.CPU%c1
     71.83            -1.2%      71.00            -0.5%      71.50        turbostat.CoreTmp
      0.26           -11.5%       0.23           -11.5%       0.23        turbostat.IPC
  75755770            -2.4%   73904719            -2.3%   73996160        turbostat.IRQ
    160.88           -18.6      142.24           -16.5      144.34        turbostat.PKG_%
      7091 ±  8%      -2.0%       6951 ±  9%      -6.4%       6640 ±  5%  turbostat.POLL
     72.00            -0.7%      71.50            -0.7%      71.50        turbostat.PkgTmp
    405.59            +0.0%     405.77            +0.0%     405.68        turbostat.PkgWatt
     61.85            -9.4%      56.03            -7.8%      57.05        turbostat.RAMWatt
      1995            +0.0%       1995            +0.0%       1996        turbostat.TSC_MHz
    229526 ± 92%    +221.6%     738269 ± 41%    +146.9%     566809 ± 52%  meminfo.Active
    229430 ± 92%    +221.7%     738173 ± 42%    +147.0%     566712 ± 52%  meminfo.Active(anon)
     95.83            +0.0%      95.83            +1.2%      97.00 ±  2%  meminfo.Active(file)
    139168 ±  2%      +5.2%     146469 ±  4%      +2.1%     142083 ±  4%  meminfo.AnonHugePages
    738504 ±  4%     -10.2%     662901 ±  6%      -8.7%     674608 ±  5%  meminfo.AnonPages
      4.00            +0.0%       4.00            +0.0%       4.00        meminfo.Buffers
   4852249 ± 11%      -3.5%    4683501 ±  6%      -2.1%    4752239 ±  6%  meminfo.Cached
 1.319e+08            +0.0%  1.319e+08            +0.0%  1.319e+08        meminfo.CommitLimit
   4835545 ± 11%      -5.0%    4591417 ±  7%      -3.1%    4684278 ±  7%  meminfo.Committed_AS
 2.599e+08            +0.1%  2.602e+08            -0.1%  2.595e+08        meminfo.DirectMap1G
   9765546 ± 24%      -3.5%    9423189 ± 19%      +3.8%   10131797 ± 17%  meminfo.DirectMap2M
    538728 ± 10%      -1.3%     531560 ± 25%      -3.1%     522002 ± 14%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
   2690463 ± 26%     -28.0%    1937074 ± 33%     -18.6%    2188933 ± 27%  meminfo.Inactive
   2690315 ± 26%     -28.0%    1936752 ± 33%     -18.7%    2188514 ± 27%  meminfo.Inactive(anon)
    147.00          +118.6%     321.33 ±121%    +184.8%     418.67 ±136%  meminfo.Inactive(file)
    148773            -1.3%     146801            -1.3%     146772        meminfo.KReclaimable
    100939            +0.9%     101825            +0.9%     101802        meminfo.KernelStack
   1530025 ± 24%     -35.8%     982209 ± 34%     -23.3%    1173096 ± 33%  meminfo.Mapped
 2.543e+08            +0.2%  2.547e+08            +0.1%  2.546e+08        meminfo.MemAvailable
 2.553e+08            +0.2%  2.558e+08            +0.1%  2.556e+08        meminfo.MemFree
 2.638e+08            +0.0%  2.638e+08            +0.0%  2.638e+08        meminfo.MemTotal
   8407546 ±  7%      -4.8%    8001846 ±  5%      -3.3%    8127901 ±  5%  meminfo.Memused
    165566            +2.6%     169934 ±  3%      +1.5%     168105 ±  3%  meminfo.PageTables
     82492 ±  3%      +0.0%      82498 ±  2%      -1.3%      81413 ±  2%  meminfo.Percpu
    148773            -1.3%     146801            -1.3%     146772        meminfo.SReclaimable
    603043            -0.5%     600188            -0.6%     599506        meminfo.SUnreclaim
   2181543 ± 25%      -7.7%    2012621 ± 15%      -4.6%    2081216 ± 13%  meminfo.Shmem
    751817            -0.6%     746989            -0.7%     746280        meminfo.Slab
   2670466            -0.0%    2670465            +0.0%    2670510        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    339920            +0.3%     340860            +0.3%     340833        meminfo.VmallocUsed
   8648896 ±  6%      -1.8%    8495615 ±  3%      -1.2%    8540993 ±  3%  meminfo.max_used_kB
     75590 ± 68%    +164.6%     199992 ±114%     +28.8%      97369 ± 64%  numa-meminfo.node0.Active
     75510 ± 68%    +164.8%     199976 ±114%     +28.9%      97337 ± 64%  numa-meminfo.node0.Active(anon)
     79.83 ± 44%     -80.2%      15.83 ±223%     -59.9%      32.00 ±141%  numa-meminfo.node0.Active(file)
     64106 ± 72%     -48.3%      33165 ± 79%     +19.1%      76365 ± 60%  numa-meminfo.node0.AnonHugePages
    307465 ± 40%     -40.4%     183238 ± 23%     -12.2%     270035 ± 26%  numa-meminfo.node0.AnonPages
    534180 ± 18%     -42.4%     307787 ± 20%     -18.2%     437081 ± 26%  numa-meminfo.node0.AnonPages.max
   1523129 ± 87%     +12.9%    1720107 ± 54%      +9.2%    1662745 ± 62%  numa-meminfo.node0.FilePages
    424558 ± 42%     +66.6%     707490 ±105%     +17.7%     499593 ± 50%  numa-meminfo.node0.Inactive
    424440 ± 42%     +66.6%     707292 ±105%     +17.7%     499542 ± 50%  numa-meminfo.node0.Inactive(anon)
    116.83 ± 45%     +69.9%     198.50 ±192%     -56.2%      51.17 ±141%  numa-meminfo.node0.Inactive(file)
     69073 ± 29%     -12.4%      60531 ± 36%      -7.3%      64039 ± 33%  numa-meminfo.node0.KReclaimable
     28145 ± 48%     +24.1%      34917 ± 74%     +34.7%      37918 ± 48%  numa-meminfo.node0.KernelStack
    232636 ±  8%     +57.0%     365262 ± 97%      +0.9%     234625 ± 41%  numa-meminfo.node0.Mapped
 1.286e+08            -0.0%  1.286e+08            -0.1%  1.285e+08        numa-meminfo.node0.MemFree
 1.317e+08            +0.0%  1.317e+08            +0.0%  1.317e+08        numa-meminfo.node0.MemTotal
   3089636 ± 41%      +0.8%    3113259 ± 30%      +2.3%    3161644 ± 33%  numa-meminfo.node0.MemUsed
     36894 ± 77%     +33.0%      49073 ±111%     +52.0%      56084 ± 66%  numa-meminfo.node0.PageTables
     69073 ± 29%     -12.4%      60531 ± 36%      -7.3%      64039 ± 33%  numa-meminfo.node0.SReclaimable
    256086 ± 15%      +3.6%     265430 ± 24%      +5.0%     268792 ± 18%  numa-meminfo.node0.SUnreclaim
    192771 ± 95%    +275.7%     724295 ±107%     +69.7%     327112 ± 77%  numa-meminfo.node0.Shmem
    325160 ± 12%      +0.2%     325962 ± 21%      +2.4%     332832 ± 14%  numa-meminfo.node0.Slab
   1330159 ± 96%     -25.2%     995597 ±118%      +0.4%    1335549 ± 91%  numa-meminfo.node0.Unevictable
    157438 ±101%    +240.2%     535547 ± 46%    +193.7%     462403 ± 57%  numa-meminfo.node1.Active
    157422 ±101%    +240.1%     535467 ± 46%    +193.7%     462337 ± 57%  numa-meminfo.node1.Active(anon)
     16.00 ±223%    +400.0%      80.00 ± 44%    +306.2%      65.00 ± 70%  numa-meminfo.node1.Active(file)
     75024 ± 62%     +50.9%     113233 ± 25%     -12.6%      65552 ± 71%  numa-meminfo.node1.AnonHugePages
    431769 ± 34%     +11.1%     479715 ± 14%      -6.1%     405415 ± 17%  numa-meminfo.node1.AnonPages
    695068 ± 14%     +24.7%     866432 ±  8%     +13.7%     790591 ± 19%  numa-meminfo.node1.AnonPages.max
   3329293 ± 40%     -11.0%    2963533 ± 27%      -7.3%    3086532 ± 30%  numa-meminfo.node1.FilePages
   2263257 ± 34%     -45.5%    1232508 ± 39%     -25.1%    1694261 ± 33%  numa-meminfo.node1.Inactive
   2263226 ± 34%     -45.5%    1232384 ± 39%     -25.2%    1693892 ± 33%  numa-meminfo.node1.Inactive(anon)
     30.17 ±175%    +307.7%     123.00 ± 44%   +1119.9%     368.00 ±162%  numa-meminfo.node1.Inactive(file)
     79734 ± 25%      +8.2%      86276 ± 25%      +3.7%      82685 ± 25%  numa-meminfo.node1.KReclaimable
     72957 ± 18%      -8.4%      66806 ± 38%     -12.7%      63707 ± 28%  numa-meminfo.node1.KernelStack
   1295066 ± 27%     -52.2%     618571 ± 41%     -27.1%     943577 ± 35%  numa-meminfo.node1.Mapped
 1.267e+08            +0.3%  1.272e+08            +0.3%  1.271e+08        numa-meminfo.node1.MemFree
 1.321e+08            +0.0%  1.321e+08            +0.0%  1.321e+08        numa-meminfo.node1.MemTotal
   5320190 ± 26%      -8.1%    4887055 ± 15%      -6.7%    4964546 ± 19%  numa-meminfo.node1.MemUsed
    129038 ± 23%      -6.6%     120578 ± 45%     -13.5%     111620 ± 31%  numa-meminfo.node1.PageTables
     79734 ± 25%      +8.2%      86276 ± 25%      +3.7%      82685 ± 25%  numa-meminfo.node1.SReclaimable
    347879 ± 10%      -4.0%     333923 ± 18%      -5.0%     330437 ± 14%  numa-meminfo.node1.SUnreclaim
   1988939 ± 26%     -35.2%    1288462 ± 48%     -12.0%    1751137 ± 20%  numa-meminfo.node1.Shmem
    427614 ±  9%      -1.7%     420199 ± 16%      -3.4%     413123 ± 11%  numa-meminfo.node1.Slab
   1340305 ± 95%     +25.0%    1674866 ± 70%      -0.4%    1334960 ± 91%  numa-meminfo.node1.Unevictable
     18769 ± 67%    +167.8%      50269 ±115%     +31.1%      24605 ± 65%  numa-vmstat.node0.nr_active_anon
     19.83 ± 44%     -80.7%       3.83 ±223%     -59.7%       8.00 ±141%  numa-vmstat.node0.nr_active_file
     76860 ± 40%     -40.3%      45882 ± 23%     -12.3%      67427 ± 27%  numa-vmstat.node0.nr_anon_pages
     31.00 ± 73%     -48.9%      15.83 ± 81%     +19.4%      37.00 ± 61%  numa-vmstat.node0.nr_anon_transparent_hugepages
    380652 ± 87%     +13.0%     430216 ± 54%      +9.2%     415834 ± 62%  numa-vmstat.node0.nr_file_pages
  32149678            -0.0%   32142905            -0.1%   32131278        numa-vmstat.node0.nr_free_pages
    106078 ± 42%     +66.7%     176807 ±105%     +17.5%     124684 ± 50%  numa-vmstat.node0.nr_inactive_anon
     28.83 ± 45%     +71.7%      49.50 ±192%     -56.1%      12.67 ±141%  numa-vmstat.node0.nr_inactive_file
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.nr_isolated_anon
     28085 ± 48%     +24.9%      35069 ± 74%     +35.0%      37907 ± 49%  numa-vmstat.node0.nr_kernel_stack
     58217 ±  8%     +56.7%      91240 ± 97%      +0.7%      58634 ± 41%  numa-vmstat.node0.nr_mapped
      9194 ± 77%     +34.4%      12354 ±110%     +52.5%      14022 ± 67%  numa-vmstat.node0.nr_page_table_pages
     48062 ± 95%    +277.1%     181262 ±107%     +70.5%      81926 ± 77%  numa-vmstat.node0.nr_shmem
     17261 ± 29%     -12.3%      15131 ± 36%      -7.3%      16005 ± 33%  numa-vmstat.node0.nr_slab_reclaimable
     63882 ± 15%      +3.9%      66379 ± 24%      +5.2%      67185 ± 18%  numa-vmstat.node0.nr_slab_unreclaimable
    332539 ± 96%     -25.2%     248898 ±118%      +0.4%     333886 ± 91%  numa-vmstat.node0.nr_unevictable
     18769 ± 67%    +167.8%      50269 ±115%     +31.1%      24605 ± 65%  numa-vmstat.node0.nr_zone_active_anon
     19.83 ± 44%     -80.7%       3.83 ±223%     -59.7%       8.00 ±141%  numa-vmstat.node0.nr_zone_active_file
    106078 ± 42%     +66.7%     176806 ±105%     +17.5%     124683 ± 50%  numa-vmstat.node0.nr_zone_inactive_anon
     28.83 ± 45%     +71.7%      49.50 ±192%     -56.1%      12.67 ±141%  numa-vmstat.node0.nr_zone_inactive_file
    332539 ± 96%     -25.2%     248898 ±118%      +0.4%     333886 ± 91%  numa-vmstat.node0.nr_zone_unevictable
    694257 ± 20%     +30.3%     904324 ± 27%     +14.8%     797060 ± 22%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    647796 ± 25%     +25.3%     811742 ± 29%     +14.5%     741498 ± 23%  numa-vmstat.node0.numa_local
     46461 ± 81%    +102.6%      94126 ± 31%     +19.6%      55562 ± 72%  numa-vmstat.node0.numa_other
     39733 ± 97%    +238.4%     134448 ± 47%    +192.3%     116130 ± 56%  numa-vmstat.node1.nr_active_anon
      4.00 ±223%    +400.0%      20.00 ± 44%    +304.2%      16.17 ± 70%  numa-vmstat.node1.nr_active_file
    107783 ± 34%     +11.2%     119866 ± 14%      -5.9%     101392 ± 17%  numa-vmstat.node1.nr_anon_pages
     36.33 ± 63%     +50.5%      54.67 ± 25%     -13.3%      31.50 ± 72%  numa-vmstat.node1.nr_anon_transparent_hugepages
    831888 ± 40%     -10.9%     741122 ± 27%      -7.2%     771798 ± 30%  numa-vmstat.node1.nr_file_pages
  31687037            +0.3%   31794474            +0.3%   31774563        numa-vmstat.node1.nr_free_pages
    564839 ± 34%     -45.5%     307690 ± 39%     -25.1%     423123 ± 33%  numa-vmstat.node1.nr_inactive_anon
      7.17 ±181%    +325.6%      30.50 ± 44%   +1183.7%      92.00 ±163%  numa-vmstat.node1.nr_inactive_file
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node1.nr_isolated_anon
     72790 ± 18%      -8.3%      66721 ± 38%     -12.2%      63878 ± 28%  numa-vmstat.node1.nr_kernel_stack
    323061 ± 27%     -52.4%     153929 ± 41%     -26.9%     236125 ± 35%  numa-vmstat.node1.nr_mapped
     32157 ± 22%      -6.4%      30113 ± 45%     -13.0%      27990 ± 31%  numa-vmstat.node1.nr_page_table_pages
    496799 ± 26%     -35.1%     322354 ± 48%     -11.8%     437949 ± 20%  numa-vmstat.node1.nr_shmem
     19923 ± 25%      +8.2%      21564 ± 25%      +3.8%      20671 ± 25%  numa-vmstat.node1.nr_slab_reclaimable
     86856 ± 10%      -4.0%      83385 ± 18%      -4.7%      82749 ± 14%  numa-vmstat.node1.nr_slab_unreclaimable
    335075 ± 95%     +25.0%     418716 ± 70%      -0.4%     333739 ± 91%  numa-vmstat.node1.nr_unevictable
     39733 ± 97%    +238.4%     134448 ± 47%    +192.3%     116130 ± 56%  numa-vmstat.node1.nr_zone_active_anon
      4.00 ±223%    +400.0%      20.00 ± 44%    +304.2%      16.17 ± 70%  numa-vmstat.node1.nr_zone_active_file
    564839 ± 34%     -45.5%     307690 ± 39%     -25.1%     423123 ± 33%  numa-vmstat.node1.nr_zone_inactive_anon
      7.17 ±181%    +325.6%      30.50 ± 44%   +1183.7%      92.00 ±163%  numa-vmstat.node1.nr_zone_inactive_file
    335075 ± 95%     +25.0%     418716 ± 70%      -0.4%     333739 ± 91%  numa-vmstat.node1.nr_zone_unevictable
   1664626 ± 16%     -16.3%    1393482 ± 13%      -7.4%    1541208 ± 15%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
   1571994 ± 18%     -14.3%    1346624 ± 13%      -7.4%    1456089 ± 17%  numa-vmstat.node1.numa_local
     92593 ± 39%     -49.5%      46769 ± 61%      -8.1%      85119 ± 48%  numa-vmstat.node1.numa_other
    246.33 ± 11%      -1.1%     243.67 ± 27%      -3.8%     237.00 ± 15%  proc-vmstat.direct_map_level2_splits
      3.17 ± 61%     -21.1%       2.50 ± 55%      +0.0%       3.17 ± 42%  proc-vmstat.direct_map_level3_splits
     57837 ± 90%    +219.0%     184528 ± 41%    +143.3%     140723 ± 51%  proc-vmstat.nr_active_anon
     23.83            +0.0%      23.83            +1.4%      24.17        proc-vmstat.nr_active_file
    184521 ±  4%     -10.2%     165770 ±  6%      -8.5%     168907 ±  5%  proc-vmstat.nr_anon_pages
     67.17 ±  2%      +5.7%      71.00 ±  4%      +2.5%      68.83 ±  4%  proc-vmstat.nr_anon_transparent_hugepages
   6345930            +0.2%    6355941            +0.1%    6352870        proc-vmstat.nr_dirty_background_threshold
  12707377            +0.2%   12727424            +0.1%   12721274        proc-vmstat.nr_dirty_threshold
   1211851 ± 11%      -3.4%    1170700 ±  6%      -2.0%    1187135 ±  6%  proc-vmstat.nr_file_pages
  63837076            +0.2%   63937291            +0.1%   63906508        proc-vmstat.nr_free_pages
    670775 ± 26%     -27.8%     484074 ± 33%     -18.4%     547407 ± 27%  proc-vmstat.nr_inactive_anon
     36.00          +123.1%      80.33 ±121%    +189.8%     104.33 ±137%  proc-vmstat.nr_inactive_file
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_isolated_anon
    101115            +0.8%     101944            +0.6%     101749        proc-vmstat.nr_kernel_stack
    380272 ± 24%     -35.6%     245022 ± 34%     -22.9%     293231 ± 33%  proc-vmstat.nr_mapped
     41476            +2.6%      42541 ±  3%      +1.3%      41998 ±  3%  proc-vmstat.nr_page_table_pages
    544174 ± 25%      -7.6%     502979 ± 15%      -4.6%     519378 ± 14%  proc-vmstat.nr_shmem
     37161            -1.2%      36701            -1.3%      36678        proc-vmstat.nr_slab_reclaimable
    150709            -0.5%     149975            -0.5%     149901        proc-vmstat.nr_slab_unreclaimable
    667616            -0.0%     667615            +0.0%     667627        proc-vmstat.nr_unevictable
     57837 ± 90%    +219.0%     184528 ± 41%    +143.3%     140723 ± 51%  proc-vmstat.nr_zone_active_anon
     23.83            +0.0%      23.83            +1.4%      24.17        proc-vmstat.nr_zone_active_file
    670775 ± 26%     -27.8%     484074 ± 33%     -18.4%     547407 ± 27%  proc-vmstat.nr_zone_inactive_anon
     36.00          +123.1%      80.33 ±121%    +189.8%     104.33 ±137%  proc-vmstat.nr_zone_inactive_file
    667616            -0.0%     667615            +0.0%     667627        proc-vmstat.nr_zone_unevictable
    222747 ±  8%      +2.7%     228701 ± 15%     +14.8%     255670 ± 20%  proc-vmstat.numa_hint_faults
    173635 ± 18%      +9.2%     189634 ± 13%      +9.8%     190702 ± 11%  proc-vmstat.numa_hint_faults_local
   2357897 ±  7%      -2.4%    2300524 ±  4%      -0.7%    2341312 ±  4%  proc-vmstat.numa_hit
     28.50 ± 29%      -4.1%      27.33 ± 22%     +78.4%      50.83 ± 88%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   2218804 ±  8%      -2.6%    2161084 ±  4%      -0.8%    2200630 ±  5%  proc-vmstat.numa_local
    139054 ±  2%      +1.3%     140896            +1.2%     140682 ±  2%  proc-vmstat.numa_other
     35583 ± 62%     -70.6%      10476 ± 66%     -23.3%      27279 ± 99%  proc-vmstat.numa_pages_migrated
    457100 ±  6%      +7.0%     489039 ±  8%     +14.3%     522321 ± 12%  proc-vmstat.numa_pte_updates
    256118 ± 89%    +117.0%     555654 ± 38%    +125.4%     577220 ± 38%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2970781 ±  6%      -2.2%    2905577 ±  3%      -1.9%    2914970 ±  3%  proc-vmstat.pgalloc_normal
   1567160 ±  2%      +0.6%    1576924 ±  2%      +2.9%    1612438 ±  4%  proc-vmstat.pgfault
   1931711 ±  5%      +8.4%    2093989 ±  4%      +7.8%    2083067 ±  4%  proc-vmstat.pgfree
     35583 ± 62%     -70.6%      10476 ± 66%     -23.3%      27279 ± 99%  proc-vmstat.pgmigrate_success
      0.00       +4.7e+104%     469.33 ±223%   +6e+104%     597.33 ±223%  proc-vmstat.pgpgin
    106956 ± 16%     -19.2%      86437 ±  4%      -6.8%      99651 ± 23%  proc-vmstat.pgreuse
     96.50 ±  2%      -0.9%      95.67 ±  6%      +1.4%      97.83 ±  3%  proc-vmstat.thp_collapse_alloc
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_deferred_split_page
     24.33            -1.4%      24.00            -0.7%      24.17        proc-vmstat.thp_fault_alloc
      7.50 ± 20%     -37.8%       4.67 ± 90%     +20.0%       9.00 ± 38%  proc-vmstat.thp_migration_success
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     20.00            +0.0%      20.00            +0.0%      20.00        proc-vmstat.unevictable_pgs_culled
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.unevictable_pgs_rescued
   1088256           +12.5%    1224704           +12.1%    1220096        proc-vmstat.unevictable_pgs_scanned
      7.89            -0.1%       7.88            +0.2%       7.90        perf-stat.i.MPKI
 4.614e+10           -10.3%  4.138e+10           -10.4%  4.132e+10        perf-stat.i.branch-instructions
      0.44            +0.1        0.56            +0.1        0.56        perf-stat.i.branch-miss-rate%
 2.032e+08           +13.2%    2.3e+08           +13.6%  2.307e+08        perf-stat.i.branch-misses
     21.66            -1.4       20.25            -1.2       20.44        perf-stat.i.cache-miss-rate%
 4.248e+08           -17.0%  3.525e+08           -15.9%  3.572e+08        perf-stat.i.cache-misses
 1.944e+09           -10.9%  1.733e+09           -10.6%  1.739e+09        perf-stat.i.cache-references
   3077431 ±  2%     -11.9%    2711580           -10.5%    2754987        perf-stat.i.context-switches
      1.29           +13.0%       1.46           +12.9%       1.46        perf-stat.i.cpi
    128146            -0.1%     128076            -0.0%     128104        perf-stat.i.cpu-clock
 3.185e+11            +0.7%  3.206e+11            +0.6%  3.205e+11        perf-stat.i.cpu-cycles
    368288 ±  2%     -12.0%     324115 ±  3%     -12.7%     321453 ±  2%  perf-stat.i.cpu-migrations
    867.41           +15.2%     999.42 ±  3%     +11.9%     970.61 ±  3%  perf-stat.i.cycles-between-cache-misses
      0.04 ±  4%      +0.0        0.04 ± 18%      +0.0        0.04 ± 10%  perf-stat.i.dTLB-load-miss-rate%
  25038705 ±  5%      -5.3%   23712086 ± 17%      -9.1%   22763907 ± 10%  perf-stat.i.dTLB-load-misses
 6.782e+10           -10.7%  6.054e+10           -10.6%  6.063e+10        perf-stat.i.dTLB-loads
      0.01 ± 15%      -0.0        0.01 ± 35%      -0.0        0.01 ± 31%  perf-stat.i.dTLB-store-miss-rate%
   4738345 ± 15%     -25.3%    3539963 ± 35%     -36.6%    3005466 ± 32%  perf-stat.i.dTLB-store-misses
 4.205e+10           -11.8%   3.71e+10           -11.6%  3.719e+10        perf-stat.i.dTLB-stores
 2.484e+11           -10.7%  2.219e+11           -10.7%  2.219e+11        perf-stat.i.instructions
      0.78           -11.3%       0.69           -11.2%       0.69        perf-stat.i.ipc
     95.24 ±  9%     -12.7%      83.12 ± 11%     -15.5%      80.51 ±  7%  perf-stat.i.major-faults
      2.49            +0.7%       2.50            +0.6%       2.50        perf-stat.i.metric.GHz
      1683           -16.9%       1398           -16.2%       1411        perf-stat.i.metric.K/sec
      1233           -10.9%       1099           -10.8%       1100        perf-stat.i.metric.M/sec
     11041           -12.0%       9716 ±  2%      -8.5%      10105 ±  4%  perf-stat.i.minor-faults
     26.22            +0.5       26.76 ±  2%      +0.4       26.63 ±  2%  perf-stat.i.node-load-miss-rate%
  31681729            -9.3%   28747178            -8.5%   28983173        perf-stat.i.node-load-misses
 1.002e+08           -15.6%   84491070           -14.6%   85563048        perf-stat.i.node-loads
      9.66 ±  4%      +1.6       11.28 ±  2%      +1.4       11.05 ±  3%  perf-stat.i.node-store-miss-rate%
   6766738 ±  4%      -7.1%    6289457 ±  2%      -7.3%    6273659        perf-stat.i.node-store-misses
  71320362           -24.9%   53545044           -23.6%   54504873        perf-stat.i.node-stores
     11137           -12.0%       9800 ±  2%      -8.5%      10186 ±  4%  perf-stat.i.page-faults
    128146            -0.1%     128076            -0.0%     128104        perf-stat.i.task-clock
      7.83            -0.4%       7.79            -0.1%       7.83        perf-stat.overall.MPKI
      0.44            +0.1        0.56            +0.1        0.56        perf-stat.overall.branch-miss-rate%
     21.88            -1.5       20.34            -1.3       20.55        perf-stat.overall.cache-miss-rate%
      1.28           +12.7%       1.45           +12.6%       1.45        perf-stat.overall.cpi
    749.20           +21.8%     912.24           +19.9%     898.57        perf-stat.overall.cycles-between-cache-misses
      0.04 ±  5%      +0.0        0.04 ± 17%      +0.0        0.04 ± 10%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ± 15%      -0.0        0.01 ± 35%      -0.0        0.01 ± 32%  perf-stat.overall.dTLB-store-miss-rate%
      0.78           -11.3%       0.69           -11.2%       0.69        perf-stat.overall.ipc
     23.89            +1.4       25.28            +1.3       25.18        perf-stat.overall.node-load-miss-rate%
      8.58 ±  4%      +1.9       10.44 ±  3%      +1.7       10.24 ±  2%  perf-stat.overall.node-store-miss-rate%
 4.572e+10           -10.1%   4.11e+10           -10.2%  4.106e+10        perf-stat.ps.branch-instructions
 2.013e+08           +13.3%  2.281e+08           +13.6%  2.288e+08        perf-stat.ps.branch-misses
 4.217e+08           -17.1%  3.495e+08           -15.9%  3.546e+08        perf-stat.ps.cache-misses
 1.928e+09           -10.9%  1.718e+09           -10.5%  1.725e+09        perf-stat.ps.cache-references
   3050235 ±  3%     -12.3%    2674258           -11.2%    2709585        perf-stat.ps.context-switches
    126888            +0.2%     127125            +0.2%     127127        perf-stat.ps.cpu-clock
  3.16e+11            +0.9%  3.188e+11            +0.8%  3.186e+11        perf-stat.ps.cpu-cycles
    361946 ±  3%     -12.1%     318006 ±  3%     -13.0%     314817 ±  2%  perf-stat.ps.cpu-migrations
  24904656 ±  5%      -5.4%   23558605 ± 17%      -9.2%   22617709 ± 10%  perf-stat.ps.dTLB-load-misses
 6.727e+10           -10.6%  6.012e+10           -10.5%  6.024e+10        perf-stat.ps.dTLB-loads
   4770322 ± 15%     -25.9%    3533622 ± 35%     -37.0%    3004501 ± 32%  perf-stat.ps.dTLB-store-misses
 4.172e+10           -11.7%  3.683e+10           -11.4%  3.695e+10        perf-stat.ps.dTLB-stores
 2.463e+11           -10.5%  2.204e+11           -10.5%  2.205e+11        perf-stat.ps.instructions
     83.83 ± 10%     -12.4%      73.46 ± 11%     -15.4%      70.92 ±  8%  perf-stat.ps.major-faults
     10457 ±  2%     -11.3%       9276 ±  2%      -8.3%       9590 ±  4%  perf-stat.ps.minor-faults
  31324505            -9.3%   28413788            -8.5%   28663600        perf-stat.ps.node-load-misses
  99780092           -15.8%   83992541           -14.6%   85194779        perf-stat.ps.node-loads
   6637608 ±  3%      -6.9%    6177673 ±  2%      -7.2%    6161038        perf-stat.ps.node-store-misses
  70688406           -25.1%   52979008           -23.6%   54023198        perf-stat.ps.node-stores
     10540 ±  2%     -11.3%       9349 ±  2%      -8.3%       9661 ±  4%  perf-stat.ps.page-faults
    126888            +0.2%     127125            +0.2%     127127        perf-stat.ps.task-clock
 3.228e+13            +1.7%  3.283e+13            +1.2%  3.266e+13        perf-stat.total.instructions
      6012 ±223%    +406.4%      30451 ± 44%    +427.7%      31728 ± 82%  sched_debug.cfs_rq:/.MIN_vruntime.avg
    769638 ±223%    +406.4%    3897744 ± 44%    +321.4%    3242929 ± 70%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
     67760 ±223%    +406.4%     343166 ± 44%    +364.7%     314897 ± 73%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      9.80 ±  4%      +2.2%      10.01 ±  6%      -0.3%       9.77 ±  4%  sched_debug.cfs_rq:/.h_nr_running.avg
     26.22 ±  4%      +6.4%      27.89 ±  5%      +3.2%      27.06 ±  3%  sched_debug.cfs_rq:/.h_nr_running.max
      0.39 ± 31%     +28.6%       0.50 ± 33%     -42.9%       0.22 ± 70%  sched_debug.cfs_rq:/.h_nr_running.min
      6.24 ±  6%      +7.1%       6.69 ±  4%      +3.0%       6.43 ±  5%  sched_debug.cfs_rq:/.h_nr_running.stddev
      8564 ± 14%     +17.8%      10086 ± 25%     +10.5%       9459 ± 12%  sched_debug.cfs_rq:/.load.avg
    139984 ±116%    +123.7%     313160 ± 97%     +82.6%     255599 ± 63%  sched_debug.cfs_rq:/.load.max
    971.61 ± 37%      -0.2%     969.83 ± 87%     -50.6%     480.44 ± 88%  sched_debug.cfs_rq:/.load.min
     14292 ± 97%    +103.6%      29100 ± 89%     +69.7%      24255 ± 56%  sched_debug.cfs_rq:/.load.stddev
     67.10 ±118%      +5.5%      70.81 ±114%    +172.3%     182.68 ±138%  sched_debug.cfs_rq:/.load_avg.avg
      5505 ±185%      +0.0%       5505 ±190%     +82.4%      10041 ±133%  sched_debug.cfs_rq:/.load_avg.max
      1.50 ± 42%      +7.4%       1.61 ± 22%     -22.2%       1.17 ± 14%  sched_debug.cfs_rq:/.load_avg.min
    512.15 ±173%      +1.7%     520.94 ±174%    +139.0%       1224 ±138%  sched_debug.cfs_rq:/.load_avg.stddev
      6012 ±223%    +406.4%      30451 ± 44%    +427.7%      31728 ± 82%  sched_debug.cfs_rq:/.max_vruntime.avg
    769639 ±223%    +406.4%    3897744 ± 44%    +321.4%    3242931 ± 70%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
     67760 ±223%    +406.4%     343166 ± 44%    +364.7%     314897 ± 73%  sched_debug.cfs_rq:/.max_vruntime.stddev
   7166188            +0.8%    7226375            +0.6%    7206562        sched_debug.cfs_rq:/.min_vruntime.avg
   8577120 ±  4%      -1.0%    8492779 ±  4%      +2.3%    8773205 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
   6820655            +0.8%    6876208            +1.7%    6934639        sched_debug.cfs_rq:/.min_vruntime.min
    245447 ± 15%      -8.6%     224223 ± 11%     -12.3%     215266 ±  8%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.70            +0.5%       0.70            +0.6%       0.70        sched_debug.cfs_rq:/.nr_running.avg
      1.11 ± 14%      +0.0%       1.11 ± 14%      +5.0%       1.17 ± 14%  sched_debug.cfs_rq:/.nr_running.max
      0.39 ± 31%     +28.6%       0.50 ± 33%     -42.9%       0.22 ± 70%  sched_debug.cfs_rq:/.nr_running.min
      0.13 ± 18%      -6.3%       0.12 ± 19%     +18.3%       0.16 ±  7%  sched_debug.cfs_rq:/.nr_running.stddev
     11.89 ± 50%     +33.2%      15.84 ± 13%     +37.0%      16.29 ± 11%  sched_debug.cfs_rq:/.removed.load_avg.avg
    341.33            +0.0%     341.33            +0.0%     341.39        sched_debug.cfs_rq:/.removed.load_avg.max
     60.18 ± 24%     +18.4%      71.23 ±  6%     +20.1%      72.30 ±  5%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      5.62 ± 50%     +23.0%       6.91 ± 15%     +29.5%       7.27 ± 17%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    178.83 ±  5%      -2.9%     173.67            +4.0%     186.06 ±  5%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     28.95 ± 25%      +9.6%      31.74 ± 10%     +14.4%      33.12 ± 11%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      5.62 ± 50%     +23.0%       6.91 ± 15%     +29.5%       7.27 ± 17%  sched_debug.cfs_rq:/.removed.util_avg.avg
    178.83 ±  5%      -2.9%     173.67            +4.0%     186.06 ±  5%  sched_debug.cfs_rq:/.removed.util_avg.max
     28.95 ± 25%      +9.6%      31.74 ± 10%     +14.4%      33.12 ± 11%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      9664 ±  2%      +5.9%      10237 ±  3%      +2.6%       9920 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
     17420 ±  9%      +5.8%      18425 ±  8%      +1.0%      17590 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
      1437 ± 24%     +26.9%       1824 ± 67%      +7.5%       1545 ± 54%  sched_debug.cfs_rq:/.runnable_avg.min
      2599 ± 10%     +11.2%       2890 ±  7%      +6.0%       2755 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.01 ±223%    -100.0%       0.00          +200.0%       0.02 ±100%  sched_debug.cfs_rq:/.spread.avg
      0.67 ±223%    -100.0%       0.00          +200.0%       2.00 ±100%  sched_debug.cfs_rq:/.spread.max
      0.06 ±223%    -100.0%       0.00          +200.0%       0.18 ± 99%  sched_debug.cfs_rq:/.spread.stddev
   -766365           -12.3%    -672372            -8.7%    -699426        sched_debug.cfs_rq:/.spread0.avg
    645136 ± 73%      -7.4%     597334 ± 51%     +36.2%     878830 ± 59%  sched_debug.cfs_rq:/.spread0.max
  -1117523            -7.6%   -1033142           -12.6%    -976467        sched_debug.cfs_rq:/.spread0.min
    247419 ± 16%      -8.1%     227321 ± 11%     -12.0%     217819 ±  7%  sched_debug.cfs_rq:/.spread0.stddev
    737.45            +1.1%     745.64            -0.2%     735.70        sched_debug.cfs_rq:/.util_avg.avg
      1600 ±  7%      -2.6%       1557 ±  2%      -1.7%       1572 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    155.44 ± 51%      -3.9%     149.44 ± 53%      -6.1%     146.00 ± 29%  sched_debug.cfs_rq:/.util_avg.min
    254.16 ±  3%      +2.8%     261.35 ±  2%      +1.5%     258.08 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
    297.23 ±  6%      +7.8%     320.27 ±  7%      +4.0%     309.11 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1152 ± 10%      +5.4%       1214 ±  8%     +15.9%       1335 ±  9%  sched_debug.cfs_rq:/.util_est_enqueued.max
      6.33 ± 71%     -15.8%       5.33 ±112%     -78.9%       1.33 ±152%  sched_debug.cfs_rq:/.util_est_enqueued.min
    227.09 ±  8%     +11.4%     252.94 ±  5%      +8.0%     245.35 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    399944 ±  7%      -1.5%     393920            -0.7%     397184 ±  3%  sched_debug.cpu.avg_idle.avg
   1018824 ± 23%      -2.4%     994041 ± 16%      -5.5%     963255 ± 37%  sched_debug.cpu.avg_idle.max
     21801 ± 29%     +16.2%      25333 ± 28%     -14.8%      18580 ± 42%  sched_debug.cpu.avg_idle.min
    149545 ± 17%      -2.0%     146605 ±  6%      +6.7%     159490 ± 21%  sched_debug.cpu.avg_idle.stddev
    126941 ± 11%      -3.3%     122789 ±  3%      -2.1%     124285 ±  6%  sched_debug.cpu.clock.avg
    127115 ± 11%      -3.3%     122959 ±  3%      -2.1%     124470 ±  6%  sched_debug.cpu.clock.max
    126785 ± 12%      -3.3%     122578 ±  3%      -2.1%     124092 ±  6%  sched_debug.cpu.clock.min
     94.97 ± 15%     +18.6%     112.61 ± 17%     +19.4%     113.37 ± 24%  sched_debug.cpu.clock.stddev
    125577 ± 11%      -3.1%     121735 ±  3%      -1.9%     123212 ±  6%  sched_debug.cpu.clock_task.avg
    126079 ± 11%      -3.1%     122117 ±  3%      -1.9%     123636 ±  6%  sched_debug.cpu.clock_task.max
    107169 ±  2%      +1.9%     109203 ±  2%      +0.7%     107944 ±  3%  sched_debug.cpu.clock_task.min
      1655 ± 82%     -31.4%       1135 ± 28%     -16.7%       1379 ± 48%  sched_debug.cpu.clock_task.stddev
     13029            +0.8%      13134            +0.6%      13101        sched_debug.cpu.curr->pid.avg
     16269            +0.4%      16327            +0.4%      16336        sched_debug.cpu.curr->pid.max
      5580 ± 34%     +10.2%       6152 ± 45%     -34.3%       3666 ± 82%  sched_debug.cpu.curr->pid.min
      1689 ±  8%      +0.1%       1691 ± 12%     +13.8%       1923 ± 16%  sched_debug.cpu.curr->pid.stddev
    512493 ±  2%      -1.9%     502714            -1.5%     504790        sched_debug.cpu.max_idle_balance_cost.avg
    792415 ± 48%     -18.6%     645400 ± 21%     -14.4%     678499 ± 48%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
     38802 ±121%     -58.1%      16259 ±100%     -44.9%      21369 ±187%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.max
      4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 15%     +17.2%       0.00 ± 11%     +20.3%       0.00 ± 21%  sched_debug.cpu.next_balance.stddev
      9.78 ±  4%      +2.7%      10.04 ±  6%      -0.3%       9.75 ±  4%  sched_debug.cpu.nr_running.avg
     26.22 ±  4%      +6.4%      27.89 ±  5%      +3.2%      27.06 ±  3%  sched_debug.cpu.nr_running.max
      0.44 ± 35%      +0.0%       0.44 ± 35%     -62.5%       0.17 ±100%  sched_debug.cpu.nr_running.min
      6.25 ±  5%      +7.0%       6.69 ±  4%      +2.7%       6.42 ±  5%  sched_debug.cpu.nr_running.stddev
   1385407           -10.1%    1245150            -9.2%    1257896        sched_debug.cpu.nr_switches.avg
   1679912 ±  6%      -9.6%    1519284            -6.5%    1570916 ±  3%  sched_debug.cpu.nr_switches.max
   1217710           -11.1%    1083080 ±  2%     -10.5%    1090186 ±  2%  sched_debug.cpu.nr_switches.min
     77056 ± 20%      +2.6%      79059 ± 14%      +4.7%      80714 ± 13%  sched_debug.cpu.nr_switches.stddev
 2.071e+09 ±  3%      +3.1%  2.134e+09 ±  5%      -2.2%  2.026e+09 ±  5%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
 2.144e+09            -0.1%  2.142e+09            -0.3%  2.138e+09        sched_debug.cpu.nr_uninterruptible.stddev
    126784 ± 12%      -3.3%     122575 ±  3%      -2.1%     124087 ±  6%  sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
    125555 ± 12%      -3.4%     121347 ±  3%      -2.1%     122859 ±  6%  sched_debug.ktime
      0.00 ± 70%     +25.0%       0.00 ± 44%     +25.0%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.avg
      0.22 ± 70%     +25.0%       0.28 ± 44%     +25.0%       0.28 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.max
      0.02 ± 70%     +25.0%       0.02 ± 44%     +25.0%       0.02 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ± 70%     +25.0%       0.00 ± 44%     +25.0%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_running.avg
      0.22 ± 70%     +25.0%       0.28 ± 44%     +25.0%       0.28 ± 44%  sched_debug.rt_rq:.rt_nr_running.max
      0.02 ± 70%     +25.0%       0.02 ± 44%     +25.0%       0.02 ± 44%  sched_debug.rt_rq:.rt_nr_running.stddev
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.00        +4.3e+98%       0.00 ±223%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.avg
      0.00       +5.6e+100%       0.06 ±223%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.max
      0.00        +4.9e+99%       0.00 ±223%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.stddev
      0.96 ± 77%     +30.4%       1.26 ± 59%     +17.0%       1.13 ± 76%  sched_debug.rt_rq:.rt_time.avg
    123.43 ± 77%     +30.1%     160.60 ± 59%     +16.9%     144.35 ± 76%  sched_debug.rt_rq:.rt_time.max
      0.00        +1.3e+99%       0.00 ±223%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.min
     10.87 ± 77%     +30.1%      14.14 ± 59%     +16.9%      12.71 ± 76%  sched_debug.rt_rq:.rt_time.stddev
    116194 ±  2%      +1.6%     118042 ±  2%      +0.6%     116844 ±  2%  sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      5.74 ±  2%      -1.7        4.00 ±  2%      -1.7        4.06        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.68 ± 14%      -1.7        0.00            -1.7        0.00        perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.48 ± 15%      -1.5        0.00            -1.5        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.40 ± 16%      -1.4        0.00            -1.4        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      8.92            -1.3        7.58 ±  4%      -1.1        7.81        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      9.03            -1.3        7.69 ±  4%      -1.1        7.92        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      8.74            -1.3        7.43 ±  4%      -1.1        7.66        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      5.61            -1.3        4.32 ±  4%      -1.2        4.44 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.17 ± 13%      -1.2        0.00            -1.2        0.00        perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      1.58 ± 10%      -1.0        0.57 ±  7%      -1.0        0.54 ±  3%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      4.85            -1.0        3.87 ±  4%      -0.9        3.99 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
     52.86            -0.9       51.92            -0.9       51.95        perf-profile.calltrace.cycles-pp.__libc_read
      4.60            -0.9        3.66 ±  5%      -0.8        3.82 ±  3%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.60            -0.9        2.66 ±  8%      -0.8        2.80 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.94 ± 17%      -0.9        0.00            -0.9        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      0.92 ± 17%      -0.9        0.00            -0.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
      4.45            -0.9        3.53 ±  5%      -0.8        3.68 ±  3%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      4.41            -0.9        3.51 ±  4%      -0.8        3.61 ±  2%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      4.19            -0.9        3.32 ±  5%      -0.7        3.46 ±  3%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
     46.92            -0.8       46.13            -0.8       46.13        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     47.92            -0.8       47.14            -0.7       47.18        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     49.96            -0.8       49.21            -0.7       49.26        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read
     49.54            -0.7       48.81            -0.7       48.86        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      3.52            -0.7        2.85 ±  5%      -0.6        2.96 ±  2%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.37            -0.6        2.74 ±  4%      -0.6        2.80 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.60 ±  4%      -0.6        0.00            -0.4        0.17 ±141%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm
      0.60 ±  4%      -0.6        0.00            -0.4        0.17 ±141%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state
      0.59 ±  4%      -0.6        0.00            -0.5        0.09 ±223%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree
      0.53            -0.5        0.00            -0.5        0.00        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      2.27            -0.5        1.79 ±  7%      -0.4        1.86 ±  3%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.91 ±  2%      -0.5        1.44 ± 12%      -0.4        1.52 ±  3%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.46 ± 44%      -0.5        0.00            -0.5        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space
      1.77 ±  2%      -0.4        1.32 ± 12%      -0.4        1.39 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.61            -0.4        0.17 ±141%      -0.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.44 ± 44%      -0.4        0.00            -0.3        0.10 ±223%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
     44.14            -0.4       43.71            -0.5       43.67        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67            -0.4        0.27 ±100%      -0.2        0.46 ± 44%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg
      2.10            -0.4        1.71 ±  5%      -0.3        1.81 ±  3%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.80            -0.4        1.42 ±  4%      -0.3        1.46        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.98            -0.3        1.63 ±  4%      -0.3        1.68 ±  2%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write
      0.70            -0.3        0.37 ± 70%      -0.1        0.56 ±  5%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.62 ±  3%      -0.3        1.30 ±  4%      -0.3        1.32 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.76            -0.3        1.45 ±  4%      -0.3        1.48 ±  2%  perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.87            -0.3        1.58 ±  4%      -0.3        1.60        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read
      0.46 ± 44%      -0.3        0.17 ±141%      -0.3        0.19 ±142%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      3.58            -0.3        3.30 ±  5%      -0.2        3.41        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      1.68            -0.3        1.40 ±  4%      -0.3        1.43        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     43.12            -0.3       42.84            -0.3       42.78        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
      3.33            -0.3        3.06 ±  5%      -0.2        3.17 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      0.62 ±  2%      -0.3        0.35 ± 70%      -0.2        0.44 ± 44%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.60            -0.3        0.34 ± 70%      -0.1        0.52 ±  3%  perf-profile.calltrace.cycles-pp.mod_objcg_state.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      1.22 ±  5%      -0.3        0.97 ±  4%      -0.2        0.98 ±  2%  perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.72            -0.3        0.47 ± 45%      -0.1        0.58 ±  6%  perf-profile.calltrace.cycles-pp.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.17 ±  2%      -0.3        0.91 ±  6%      -0.2        0.96 ±  6%  perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      1.27            -0.2        1.06 ±  4%      -0.2        1.09 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.64            -0.2        0.44 ± 44%      -0.1        0.54 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      0.64            -0.2        0.46 ± 44%      -0.1        0.54 ±  2%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_write.ksys_write.do_syscall_64
      1.10            -0.2        0.91 ±  6%      -0.2        0.93 ±  2%  perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      2.58            -0.2        2.40 ±  5%      -0.1        2.50 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.84 ±  2%      -0.2        0.68 ±  4%      -0.2        0.69 ±  2%  perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.84            -0.1        0.70 ±  3%      -0.1        0.72 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.92            -0.1        0.78 ±  3%      -0.1        0.79 ±  2%  perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.88            -0.1        0.74 ±  4%      -0.1        0.76 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.80 ±  2%      -0.1        0.67 ±  7%      -0.1        0.68 ±  2%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.74 ±  4%      -0.1        0.61 ±  5%      -0.1        0.64 ±  3%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.72            -0.1        0.59 ±  4%      -0.1        0.61 ±  2%  perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.83            -0.1        0.70 ±  4%      -0.1        0.71        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            -0.1        0.54 ±  4%      -0.1        0.56 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.88            -0.1        0.76 ±  4%      -0.1        0.78        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.68            -0.1        0.56 ±  4%      -0.1        0.58 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
     41.91            -0.1       41.80            -0.2       41.72        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.82            -0.1        0.70 ±  6%      -0.1        0.74 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.68            -0.1        0.57 ±  4%      -0.1        0.59        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_read.ksys_read.do_syscall_64
      0.63            -0.1        0.53 ±  4%      -0.1        0.54 ±  2%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      0.72            -0.1        0.63 ±  7%      -0.1        0.67 ±  2%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.08 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.mutex_unlock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.08 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     41.50            -0.1       41.43            -0.1       41.35        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      1.11            -0.1        1.05 ±  2%      -0.1        1.05 ±  4%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.54 ±  3%      -0.1        0.48 ± 44%      +0.1        0.60 ±  2%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            -0.0        0.63 ±  3%      -0.0        0.63 ±  3%  perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.89            -0.0        0.86 ±  2%      -0.0        0.85 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.0        0.00            +0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.63 ±  2%      +0.0        0.63 ±  7%      +0.0        0.67 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.1        0.10 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%      +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     42.41            +0.2       42.59            +0.2       42.61        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.2        0.20 ±144%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.20 ±144%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.20 ±144%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.21 ±144%      +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.3        0.27 ±100%      +0.2        0.19 ±141%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
     46.68            +0.3       47.01            +0.3       46.98        perf-profile.calltrace.cycles-pp.__libc_write
     41.23            +0.3       41.57            +0.3       41.54        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.65            +0.5        1.17 ±  2%      +0.4        1.07 ± 18%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.5        0.53 ±  2%      +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.5        0.54 ±  6%      +0.4        0.37 ± 71%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.6        0.56 ± 10%      +0.3        0.35 ± 70%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.6        0.57 ±  6%      +0.4        0.38 ± 70%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.6        0.60 ±  6%      +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg
      0.00            +0.6        0.60 ±  9%      +0.4        0.38 ± 70%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.61 ±  6%      +0.6        0.63 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00            +0.6        0.61 ± 11%      +0.6        0.56 ± 45%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.6        0.62 ±  4%      +0.5        0.54 ± 45%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.6        0.64 ±  5%      +0.7        0.66 ±  4%  perf-profile.calltrace.cycles-pp.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00            +0.6        0.64 ± 10%      +0.6        0.59 ± 45%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.schedule_timeout
     43.99            +0.6       44.63            +0.6       44.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     43.57            +0.7       44.25            +0.6       44.17        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.7        0.70 ±  5%      +0.6        0.57 ± 45%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.54            +0.8       39.32            +0.7       39.24        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.59 ±  2%      +1.0        1.55 ±  5%      +0.9        1.46 ± 24%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.53            +1.0        1.49 ±  5%      +0.9        1.42 ± 23%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.62 ±  2%      +1.0        1.60 ±  5%      +0.9        1.52 ± 24%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +1.0        0.99 ±  3%      +0.8        0.81 ± 45%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.75            +1.1        1.81 ±  4%      +1.0        1.70 ± 23%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     35.84            +1.2       37.07            +1.1       36.94        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      3.95 ±  3%      +1.4        5.38 ±  4%      +1.3        5.28 ± 12%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.84            +1.7        3.56 ±  3%      +1.5        3.36 ± 18%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      1.89            +1.7        3.63 ±  3%      +1.5        3.43 ± 18%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      1.97            +1.8        3.76 ±  3%      +1.6        3.55 ± 18%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.59 ±  3%      +1.9        3.44 ±  6%      +1.7        3.26 ± 19%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      2.28 ±  4%      +1.9        4.15 ±  5%      +1.7        3.98 ± 17%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.62 ±  3%      +1.9        3.49 ±  6%      +1.7        3.30 ± 19%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      1.72 ±  3%      +1.9        3.61 ±  6%      +1.7        3.42 ± 18%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      2.36            +2.0        4.39 ±  2%      +1.8        4.14 ± 18%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     19.25            +2.7       21.94 ±  5%      +2.3       21.52 ±  4%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     15.50            +3.0       18.48 ±  7%      +2.4       17.92 ±  5%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     15.12            +3.0       18.17 ±  7%      +2.5       17.60 ±  5%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     13.84            +3.4       17.23 ±  7%      +3.1       16.89 ±  6%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      8.66            +4.4       13.08 ± 11%      +3.9       12.58 ±  8%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      7.34            +5.1       12.49 ± 12%      +4.5       11.83 ±  8%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      6.80            +5.2       12.04 ± 13%      +4.6       11.36 ±  9%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.24            +5.3       11.56 ± 13%      +4.6       10.89 ±  9%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      1.34 ±  7%      +5.5        6.87 ± 24%      +4.8        6.14 ± 17%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
      1.43 ±  7%      +5.5        6.95 ± 24%      +4.8        6.22 ± 17%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
      0.90 ±  8%      +5.7        6.61 ± 25%      +5.0        5.85 ± 17%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
      1.62 ±  7%      +5.7        7.34 ± 23%      +5.0        6.61 ± 16%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.91 ±  8%      +5.7        6.65 ± 25%      +5.0        5.89 ± 17%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      1.15 ±  7%      +6.0        7.10 ± 24%      +5.2        6.34 ± 16%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      1.57 ±  5%      +6.2        7.74 ± 22%      +5.4        6.96 ± 15%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      5.90 ±  2%      -1.8        4.14 ±  2%      -1.7        4.19        perf-profile.children.cycles-pp.kmem_cache_alloc_node
      8.96            -1.4        7.62 ±  4%      -1.1        7.85        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      9.08            -1.3        7.73 ±  4%      -1.1        7.96        perf-profile.children.cycles-pp.unix_stream_read_actor
      8.81            -1.3        7.48 ±  4%      -1.1        7.72        perf-profile.children.cycles-pp.__skb_datagram_iter
      5.68            -1.3        4.39 ±  4%      -1.2        4.50 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      4.90            -1.0        3.91 ±  4%      -0.9        4.03 ±  2%  perf-profile.children.cycles-pp._copy_to_iter
     52.96            -1.0       52.01            -0.9       52.03        perf-profile.children.cycles-pp.__libc_read
      4.65            -0.9        3.70 ±  5%      -0.8        3.86 ±  3%  perf-profile.children.cycles-pp.skb_release_head_state
      4.55            -0.9        3.62 ±  4%      -0.8        3.73        perf-profile.children.cycles-pp.copyout
      4.51            -0.9        3.59 ±  5%      -0.8        3.74 ±  3%  perf-profile.children.cycles-pp.unix_destruct_scm
      4.24            -0.9        3.36 ±  5%      -0.7        3.50 ±  3%  perf-profile.children.cycles-pp.sock_wfree
     47.07            -0.8       46.25            -0.8       46.26        perf-profile.children.cycles-pp.vfs_read
     48.00            -0.8       47.21            -0.8       47.25        perf-profile.children.cycles-pp.ksys_read
      3.91            -0.7        3.21 ±  4%      -0.6        3.34 ±  3%  perf-profile.children.cycles-pp.__slab_free
      3.60            -0.7        2.91 ±  5%      -0.6        3.02 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_free
      3.59            -0.7        2.90 ±  4%      -0.6        2.97        perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      3.46            -0.6        2.82 ±  4%      -0.6        2.88 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      4.58            -0.5        4.05 ±  6%      -0.4        4.16 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      4.97            -0.5        4.45 ±  5%      -0.4        4.59        perf-profile.children.cycles-pp.__check_object_size
      3.07            -0.5        2.56 ±  3%      -0.4        2.63 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      1.96 ±  2%      -0.5        1.48 ± 11%      -0.4        1.55 ±  3%  perf-profile.children.cycles-pp.skb_queue_tail
      2.30            -0.5        1.81 ±  7%      -0.4        1.88 ±  3%  perf-profile.children.cycles-pp.skb_set_owner_w
     44.18            -0.4       43.76            -0.5       43.71        perf-profile.children.cycles-pp.sock_read_iter
      2.26            -0.4        1.88 ±  4%      -0.3        1.93        perf-profile.children.cycles-pp.__entry_text_start
      1.69 ±  3%      -0.3        1.36 ±  4%      -0.3        1.38 ±  2%  perf-profile.children.cycles-pp._copy_from_iter
      3.40            -0.3        3.08 ±  5%      -0.2        3.20 ±  2%  perf-profile.children.cycles-pp.check_heap_object
      3.63            -0.3        3.34 ±  5%      -0.2        3.45        perf-profile.children.cycles-pp.simple_copy_to_iter
     43.20            -0.3       42.90            -0.4       42.85        perf-profile.children.cycles-pp.sock_recvmsg
      1.69            -0.3        1.41 ±  3%      -0.2        1.46        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.35 ±  4%      -0.3        1.08 ±  4%      -0.3        1.09 ±  2%  perf-profile.children.cycles-pp.copyin
      1.84            -0.3        1.58 ±  4%      -0.2        1.61        perf-profile.children.cycles-pp.security_file_permission
      1.47 ±  2%      -0.3        1.21 ±  5%      -0.2        1.25 ±  2%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      1.19 ±  2%      -0.3        0.93 ±  6%      -0.2        0.98 ±  6%  perf-profile.children.cycles-pp.unix_write_space
      1.52            -0.2        1.28 ±  6%      -0.2        1.30 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      1.32            -0.2        1.08 ±  4%      -0.2        1.11 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge
      1.43            -0.2        1.20 ±  4%      -0.2        1.23        perf-profile.children.cycles-pp.apparmor_file_permission
      1.15            -0.2        0.95 ±  6%      -0.2        0.97 ±  2%  perf-profile.children.cycles-pp.security_socket_sendmsg
      1.28            -0.2        1.09 ±  4%      -0.2        1.11 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.89 ±  2%      -0.2        0.72 ±  4%      -0.2        0.73        perf-profile.children.cycles-pp.skb_unlink
      0.96            -0.2        0.82 ±  3%      -0.1        0.83 ±  2%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.75 ±  6%      -0.1        0.61 ±  5%      -0.1        0.64 ±  3%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.80            -0.1        0.67 ±  3%      -0.1        0.68        perf-profile.children.cycles-pp.refill_obj_stock
      0.64            -0.1        0.51 ±  3%      -0.1        0.52        perf-profile.children.cycles-pp.__build_skb_around
     41.96            -0.1       41.84            -0.2       41.76        perf-profile.children.cycles-pp.unix_stream_recvmsg
      1.54 ±  2%      -0.1        1.43 ±  6%      -0.0        1.50 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      0.15 ± 47%      -0.1        0.04 ±223%      +0.0        0.16 ± 74%  perf-profile.children.cycles-pp.record__finish_output
     41.72            -0.1       41.62            -0.2       41.54        perf-profile.children.cycles-pp.unix_stream_read_generic
      0.71 ±  2%      -0.1        0.61 ±  5%      -0.1        0.62        perf-profile.children.cycles-pp.__check_heap_object
      0.14 ± 72%      -0.1        0.04 ±223%      +0.0        0.18 ± 73%  perf-profile.children.cycles-pp.__cmd_record
      0.64 ±  3%      -0.1        0.55 ±  4%      -0.1        0.59 ±  3%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.51            -0.1        0.42 ±  4%      -0.1        0.43 ±  2%  perf-profile.children.cycles-pp.mutex_unlock
      0.52            -0.1        0.44 ±  3%      -0.1        0.45        perf-profile.children.cycles-pp.__get_task_ioprio
      0.47            -0.1        0.39 ±  5%      -0.1        0.40 ±  2%  perf-profile.children.cycles-pp.aa_file_perm
      0.48            -0.1        0.40 ±  4%      -0.1        0.41 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.57            -0.1        0.49 ±  3%      -0.1        0.50        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.16 ± 44%      -0.1        0.09 ±141%      -0.0        0.16 ± 72%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.40 ±  4%      -0.1        0.33 ±  5%      -0.1        0.35 ±  3%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      1.31 ±  2%      -0.1        1.23 ±  7%      -0.0        1.30 ±  2%  perf-profile.children.cycles-pp.__fget_light
      0.48 ±  2%      -0.1        0.40 ±  5%      -0.1        0.42 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.47 ±  2%      -0.1        0.40 ±  5%      -0.1        0.41 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.53 ±  2%      -0.1        0.46 ±  5%      -0.1        0.48 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.15 ± 47%      -0.1        0.08 ±142%      +0.0        0.16 ± 77%  perf-profile.children.cycles-pp.reader__read_event
      0.15 ± 47%      -0.1        0.08 ±142%      +0.0        0.16 ± 74%  perf-profile.children.cycles-pp.perf_session__process_events
      0.36 ±  2%      -0.1        0.30 ±  4%      -0.1        0.30 ±  2%  perf-profile.children.cycles-pp.wait_for_unix_gc
      0.12 ± 60%      -0.1        0.06 ±145%      -0.0        0.11 ± 88%  perf-profile.children.cycles-pp.process_simple
      0.42 ±  3%      -0.1        0.36 ±  6%      -0.0        0.38 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.42 ±  2%      -0.1        0.36 ±  3%      -0.1        0.36 ±  2%  perf-profile.children.cycles-pp.kmalloc_slab
      0.59            -0.1        0.53 ±  5%      -0.0        0.54 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.36 ±  3%      -0.1        0.30 ±  7%      -0.0        0.31 ±  3%  perf-profile.children.cycles-pp.tick_sched_handle
      0.38 ±  5%      -0.1        0.32 ±  6%      -0.0        0.33 ±  4%  perf-profile.children.cycles-pp.tick_sched_timer
      0.44            -0.1        0.39 ±  5%      -0.0        0.40        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.35 ±  3%      -0.1        0.29 ±  6%      -0.0        0.30 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.12 ± 73%      -0.1        0.06 ±145%      -0.0        0.10 ± 90%  perf-profile.children.cycles-pp.queue_event
      0.12 ± 73%      -0.1        0.06 ±145%      -0.0        0.11 ± 88%  perf-profile.children.cycles-pp.ordered_events__queue
      0.33 ±  3%      -0.1        0.28 ±  8%      -0.0        0.30 ±  5%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.11 ± 44%      -0.1        0.06 ±141%      -0.0        0.11 ± 72%  perf-profile.children.cycles-pp.perf_tp_event
      0.22 ±  6%      -0.1        0.17 ±  7%      -0.0        0.18 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.28 ±  3%      -0.1        0.22 ±  7%      -0.0        0.23 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.33 ±  2%      -0.0        0.28 ±  3%      -0.0        0.29 ±  3%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.33 ±  2%      -0.0        0.28 ±  2%      -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.34            -0.0        0.29 ±  3%      -0.0        0.29 ±  2%  perf-profile.children.cycles-pp.task_work_run
      0.24            -0.0        0.19 ±  3%      -0.0        0.21 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      0.24            -0.0        0.20 ±  4%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.22            -0.0        0.18 ± 12%      -0.0        0.18 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      0.71            -0.0        0.67 ±  3%      -0.0        0.68 ±  2%  perf-profile.children.cycles-pp.mutex_lock
      0.29 ±  2%      -0.0        0.25 ±  4%      -0.0        0.26 ±  3%  perf-profile.children.cycles-pp.scm_recv
      0.24 ±  2%      -0.0        0.20 ±  4%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.21 ±  2%      -0.0        0.17 ±  5%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.put_pid
      0.22            -0.0        0.18 ± 12%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.load_balance
      0.22 ±  2%      -0.0        0.19 ±  3%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.kfree
      0.27            -0.0        0.24 ±  3%      -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.22 ±  4%      -0.0        0.18 ±  6%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.22            -0.0        0.19 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.check_stack_object
      0.18 ±  2%      -0.0        0.16 ±  3%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.fsnotify_perm
      0.16            -0.0        0.13 ±  3%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.refill_stock
      0.10            -0.0        0.08 ± 14%      -0.0        0.08        perf-profile.children.cycles-pp.detach_tasks
      0.12 ±  3%      -0.0        0.10 ±  4%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.unix_passcred_enabled
      0.34            -0.0        0.32 ±  2%      -0.0        0.32 ±  3%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.15 ±  3%      -0.0        0.13 ±  4%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.11            -0.0        0.09 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.should_failslab
      0.10            -0.0        0.08            -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.obj_cgroup_uncharge
      0.14 ±  8%      -0.0        0.12 ±  7%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.11 ±  4%      -0.0        0.09 ±  5%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.skb_free_head
      0.06            -0.0        0.04 ± 44%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.apparmor_socket_getpeersec_dgram
      0.12            -0.0        0.10 ±  6%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.skb_put
      0.09            -0.0        0.07 ±  6%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.kfree_skbmem
      0.22            -0.0        0.20 ±  3%      -0.0        0.21 ±  4%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.03 ±143%      -0.0        0.01 ±223%      +0.0        0.04 ±107%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.03 ±143%      -0.0        0.01 ±223%      +0.0        0.05 ±100%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.04 ± 44%      -0.0        0.03 ±141%      +0.0        0.05 ± 74%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.04 ±101%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.07 ±  6%      -0.0        0.06 ±  7%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.apparmor_socket_recvmsg
      0.07 ±  5%      -0.0        0.06 ±  7%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.apparmor_socket_sendmsg
      0.14 ±  8%      -0.0        0.14 ± 18%      +0.0        0.16 ± 10%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.12 ±  3%      +0.0        0.12 ±  5%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.task_h_load
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.exit_mm
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mmput
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.exit_mmap
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.18 ±  2%      +0.0        0.18 ±  3%      +0.0        0.18 ±  8%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.select_idle_core
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.resched_curr
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.14            +0.0        0.15 ±  3%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.put_cpu_partial
      0.11 ±  3%      +0.0        0.12 ±  5%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.05            +0.0        0.06 ±  6%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.06            +0.0        0.07 ±  9%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.set_next_buddy
      0.00            +0.0        0.02 ±141%      +0.0        0.03 ± 70%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.05 ±  7%      +0.0        0.07            +0.0        0.06 ± 11%  perf-profile.children.cycles-pp.rb_erase
      0.07 ±  7%      +0.0        0.08 ±  8%      +0.0        0.08 ± 11%  perf-profile.children.cycles-pp.cpuacct_charge
      0.11 ±  3%      +0.0        0.13 ±  2%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.02 ± 99%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.wait_consider_task
      0.08 ±  5%      +0.0        0.11            +0.0        0.10 ± 15%  perf-profile.children.cycles-pp.update_min_vruntime
     94.09            +0.0       94.12            -0.0       94.07        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.12 ±  4%      +0.0        0.16 ±  3%      +0.0        0.15 ±  9%  perf-profile.children.cycles-pp.__list_add_valid
      0.00            +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.get_any_partial
      0.05            +0.0        0.08 ±  5%      +0.0        0.08 ± 17%  perf-profile.children.cycles-pp.native_sched_clock
      0.02 ±141%      +0.0        0.05            +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.04 ± 45%      +0.0        0.08 ±  7%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.set_task_cpu
      0.00            +0.0        0.04 ± 72%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.do_wait
      0.00            +0.0        0.04 ± 72%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.wait4
      0.00            +0.0        0.04 ± 72%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__do_sys_wait4
      0.00            +0.0        0.04 ± 72%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.kernel_wait4
      0.10 ±  5%      +0.0        0.14 ±  4%      +0.0        0.14 ±  4%  perf-profile.children.cycles-pp.__x64_sys_write
      0.06            +0.0        0.10 ±  4%      +0.0        0.10 ± 16%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.10            +0.0        0.14 ±  3%      +0.0        0.14 ± 15%  perf-profile.children.cycles-pp.os_xsave
      0.09 ±  5%      +0.0        0.14 ±  4%      +0.0        0.13 ± 17%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.00            +0.1        0.05 ± 46%      +0.0        0.04 ± 73%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.06 ±  8%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.1        0.06 ±  8%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.1        0.06 ±  8%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.1        0.06 ± 13%      +0.0        0.04 ± 44%  perf-profile.children.cycles-pp._find_next_bit
      0.28            +0.1        0.34 ±  2%      +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.06 ±  7%      +0.1        0.12 ±  3%      +0.0        0.11 ± 21%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.1        0.06 ±  9%      +0.0        0.05 ± 45%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.09 ±  5%      +0.1        0.16 ±  4%      +0.1        0.15 ± 16%  perf-profile.children.cycles-pp.finish_task_switch
      0.13 ±  2%      +0.1        0.19 ±  4%      +0.1        0.18 ± 14%  perf-profile.children.cycles-pp.check_preempt_curr
      0.00            +0.1        0.06 ± 19%      +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.schedule_idle
     93.42            +0.1       93.48            +0.0       93.44        perf-profile.children.cycles-pp.do_syscall_64
      0.10 ±  5%      +0.1        0.16 ±  4%      +0.1        0.15 ± 15%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.1        0.07            +0.1        0.06 ± 45%  perf-profile.children.cycles-pp.pick_next_entity
      0.00            +0.1        0.07            +0.1        0.06 ± 45%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.07 ± 14%      +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.07 ±  5%      +0.1        0.06 ± 45%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.22 ±  3%      +0.1        0.30 ±  3%      +0.1        0.28 ± 13%  perf-profile.children.cycles-pp.__switch_to_asm
      0.19            +0.1        0.27 ±  2%      +0.1        0.26 ± 14%  perf-profile.children.cycles-pp.__switch_to
      0.13            +0.1        0.22 ±  3%      +0.1        0.20 ± 14%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.13 ±  2%      +0.1        0.22 ±  3%      +0.1        0.20 ± 17%  perf-profile.children.cycles-pp.reweight_entity
      0.34            +0.1        0.43            +0.1        0.41 ± 11%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.17 ±  4%      +0.1        0.27 ±  2%      +0.1        0.25 ± 16%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.13 ±  2%      +0.1        0.24 ±  5%      +0.1        0.22 ± 19%  perf-profile.children.cycles-pp.___perf_sw_event
      0.44            +0.1        0.56            +0.1        0.53 ± 11%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.13 ±  2%      +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.finish_wait
      0.18 ±  2%      +0.1        0.32 ±  3%      +0.1        0.29 ± 17%  perf-profile.children.cycles-pp.prepare_task_switch
      0.20 ±  2%      +0.1        0.34 ±  2%      +0.1        0.32 ± 15%  perf-profile.children.cycles-pp.set_next_entity
      0.09 ±  4%      +0.2        0.24 ±  6%      +0.2        0.24 ±  3%  perf-profile.children.cycles-pp.__x64_sys_read
      0.45 ±  3%      +0.2        0.60 ±  6%      +0.1        0.59 ± 13%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.2        0.17 ± 14%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.available_idle_cpu
     42.50            +0.2       42.67            +0.2       42.69        perf-profile.children.cycles-pp.ksys_write
      0.00            +0.2        0.19 ± 18%      +0.2        0.19 ± 19%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.2        0.20 ± 18%      +0.2        0.19 ± 15%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.41 ±  3%      +0.2        0.63 ±  5%      +0.2        0.61 ± 12%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.2        0.22 ± 19%      +0.2        0.21 ± 16%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.66            +0.2        0.91 ±  2%      +0.2        0.86 ± 12%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.3        0.28 ± 16%      +0.2        0.21 ± 14%  perf-profile.children.cycles-pp.select_idle_cpu
      0.47 ±  2%      +0.3        0.77 ±  2%      +0.2        0.71 ± 17%  perf-profile.children.cycles-pp.switch_mm_irqs_off
     46.80            +0.3       47.12            +0.3       47.08        perf-profile.children.cycles-pp.__libc_write
     41.36            +0.3       41.68            +0.3       41.66        perf-profile.children.cycles-pp.vfs_write
      0.06 ±  7%      +0.3        0.40 ± 15%      +0.2        0.31 ± 12%  perf-profile.children.cycles-pp.select_idle_sibling
      0.51 ±  2%      +0.4        0.86 ±  3%      +0.3        0.83 ± 16%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.4        0.36 ± 21%      +0.3        0.34 ± 11%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.28 ±  2%      +0.4        0.64 ±  9%      +0.3        0.56 ± 10%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.32 ±  4%      +0.4        0.69 ±  7%      +0.3        0.60 ± 10%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.4        0.38 ± 19%      +0.3        0.34 ± 10%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.00            +0.4        0.38 ± 19%      +0.3        0.34 ± 10%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.00            +0.4        0.39 ± 19%      +0.4        0.35 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.4        0.39 ± 18%      +0.4        0.35 ± 10%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.4        0.42 ± 19%      +0.4        0.37 ±  9%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.68            +0.4        1.10 ±  2%      +0.3        1.01 ± 17%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      1.94            +0.4        2.38            +0.3        2.28 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.42            +0.5        1.92            +0.4        1.82 ± 13%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.5        0.51 ± 18%      +0.5        0.46 ± 11%  perf-profile.children.cycles-pp.start_secondary
      0.60            +0.5        1.12 ±  3%      +0.5        1.06 ± 17%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.5        0.52 ± 18%      +0.5        0.47 ± 10%  perf-profile.children.cycles-pp.do_idle
      0.00            +0.5        0.52 ± 18%      +0.5        0.47 ± 10%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.5        0.52 ± 18%      +0.5        0.47 ± 10%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.42 ±  4%      +0.5        0.95 ±  3%      +0.5        0.95 ±  6%  perf-profile.children.cycles-pp.prepare_to_wait
     38.64            +0.8       39.40            +0.7       39.32        perf-profile.children.cycles-pp.sock_write_iter
      0.77            +0.9        1.68 ±  5%      +0.8        1.61 ± 20%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.85 ±  2%      +1.0        1.89 ±  4%      +1.0        1.82 ± 21%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.93 ±  2%      +1.1        1.99 ±  4%      +1.0        1.92 ± 20%  perf-profile.children.cycles-pp.activate_task
      0.40 ±  4%      +1.1        1.53 ±  9%      +1.1        1.50 ± 27%  perf-profile.children.cycles-pp.update_cfs_group
      1.02 ±  2%      +1.2        2.18 ±  4%      +1.1        2.09 ± 19%  perf-profile.children.cycles-pp.ttwu_do_activate
     36.19            +1.2       37.36            +1.1       37.24        perf-profile.children.cycles-pp.unix_stream_sendmsg
      3.97 ±  3%      +1.4        5.40 ±  4%      +1.3        5.30 ± 12%  perf-profile.children.cycles-pp.sock_def_readable
      2.70            +1.6        4.31 ±  3%      +1.4        4.14 ± 15%  perf-profile.children.cycles-pp.schedule_timeout
      2.21 ±  3%      +1.7        3.92 ±  6%      +1.6        3.77 ± 16%  perf-profile.children.cycles-pp.autoremove_wake_function
      2.14 ±  4%      +1.7        3.85 ±  6%      +1.6        3.70 ± 16%  perf-profile.children.cycles-pp.try_to_wake_up
      2.89 ±  4%      +1.7        4.61 ±  5%      +1.6        4.48 ± 15%  perf-profile.children.cycles-pp.__wake_up_common_lock
      2.32 ±  3%      +1.7        4.04 ±  5%      +1.6        3.89 ± 16%  perf-profile.children.cycles-pp.__wake_up_common
      2.92            +2.0        4.94 ±  3%      +1.8        4.69 ± 16%  perf-profile.children.cycles-pp.schedule
      2.37            +2.0        4.42 ±  2%      +1.8        4.16 ± 18%  perf-profile.children.cycles-pp.unix_stream_data_wait
      2.88            +2.1        4.94 ±  3%      +1.8        4.68 ± 16%  perf-profile.children.cycles-pp.__schedule
     19.32            +2.7       22.00 ±  5%      +2.3       21.58 ±  4%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     15.55            +3.0       18.52 ±  7%      +2.4       17.96 ±  5%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     15.24            +3.0       18.27 ±  7%      +2.5       17.70 ±  5%  perf-profile.children.cycles-pp.__alloc_skb
     13.95            +3.4       17.32 ±  7%      +3.0       16.99 ±  5%  perf-profile.children.cycles-pp.consume_skb
      3.30 ±  9%      +4.4        7.68 ± 23%      +3.6        6.92 ± 15%  perf-profile.children.cycles-pp.__unfreeze_partials
      8.71            +4.4       13.12 ± 11%      +3.9       12.62 ±  8%  perf-profile.children.cycles-pp.skb_release_data
      2.34 ±  9%      +5.1        7.44 ± 23%      +4.3        6.64 ± 16%  perf-profile.children.cycles-pp.get_partial_node
      7.46            +5.1       12.59 ± 12%      +4.5       11.94 ±  8%  perf-profile.children.cycles-pp.kmalloc_reserve
      3.15 ±  7%      +5.2        8.32 ± 21%      +4.4        7.50 ± 14%  perf-profile.children.cycles-pp.___slab_alloc
      6.90            +5.2       12.12 ± 12%      +4.5       11.44 ±  9%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      6.41            +5.3       11.71 ± 13%      +4.6       11.04 ±  9%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      8.25 ±  5%      +9.1       17.40 ± 18%      +7.7       15.96 ± 12%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      5.92 ±  8%      +9.8       15.75 ± 21%      +8.3       14.25 ± 13%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      4.31            -1.1        3.25 ±  5%      -1.0        3.33 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      4.50            -0.9        3.58 ±  4%      -0.8        3.69 ±  2%  perf-profile.self.cycles-pp.copyout
      4.20            -0.8        3.42 ±  5%      -0.7        3.53 ±  3%  perf-profile.self.cycles-pp.unix_stream_read_generic
      3.86            -0.7        3.15 ±  6%      -0.6        3.27 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      2.84            -0.7        2.15 ±  9%      -0.6        2.25 ±  4%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      3.84            -0.7        3.15 ±  4%      -0.6        3.29 ±  3%  perf-profile.self.cycles-pp.__slab_free
      3.02            -0.6        2.41 ±  5%      -0.5        2.50 ±  3%  perf-profile.self.cycles-pp.sock_wfree
      2.93            -0.5        2.44 ±  7%      -0.4        2.50 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      2.26            -0.5        1.78 ±  6%      -0.4        1.84 ±  3%  perf-profile.self.cycles-pp.skb_set_owner_w
      2.75            -0.5        2.28 ±  3%      -0.4        2.35 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      2.27            -0.5        1.81 ±  4%      -0.4        1.86        perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      1.64 ±  2%      -0.4        1.19 ± 12%      -0.4        1.26 ±  5%  perf-profile.self.cycles-pp.sock_def_readable
      2.06            -0.4        1.63 ±  6%      -0.4        1.70 ±  2%  perf-profile.self.cycles-pp.__kmem_cache_free
      1.64            -0.3        1.37 ±  3%      -0.2        1.42        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.30 ±  4%      -0.3        1.03 ±  4%      -0.3        1.04 ±  2%  perf-profile.self.cycles-pp.copyin
      1.54            -0.3        1.28 ±  3%      -0.2        1.31        perf-profile.self.cycles-pp.vfs_write
      1.32            -0.2        1.10 ±  4%      -0.2        1.12 ±  2%  perf-profile.self.cycles-pp.sock_write_iter
      1.30            -0.2        1.08 ±  4%      -0.2        1.11 ±  2%  perf-profile.self.cycles-pp.__alloc_skb
      2.53            -0.2        2.31 ±  5%      -0.1        2.39 ±  2%  perf-profile.self.cycles-pp.check_heap_object
      1.38            -0.2        1.17 ±  2%      -0.2        1.20        perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      1.02 ±  2%      -0.2        0.81 ±  3%      -0.2        0.84 ±  2%  perf-profile.self.cycles-pp.skb_release_data
      1.47            -0.2        1.29 ±  3%      -0.2        1.31        perf-profile.self.cycles-pp.vfs_read
      1.12            -0.2        0.95 ±  6%      -0.2        0.96 ±  2%  perf-profile.self.cycles-pp.aa_sk_perm
      1.05            -0.2        0.88 ±  3%      -0.2        0.90 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.84            -0.2        0.68 ±  4%      -0.1        0.69 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge
      1.02            -0.2        0.88 ±  4%      -0.1        0.90 ±  2%  perf-profile.self.cycles-pp.__libc_write
      0.93 ±  2%      -0.1        0.78 ±  5%      -0.1        0.80        perf-profile.self.cycles-pp.apparmor_file_permission
      0.97            -0.1        0.84 ±  3%      -0.1        0.84 ±  2%  perf-profile.self.cycles-pp.sock_read_iter
      0.69 ±  6%      -0.1        0.56 ±  6%      -0.1        0.59 ±  4%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.71 ±  2%      -0.1        0.59 ±  4%      -0.1        0.60 ±  4%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.74            -0.1        0.62 ±  3%      -0.1        0.64 ±  2%  perf-profile.self.cycles-pp.refill_obj_stock
      0.66            -0.1        0.54 ±  5%      -0.1        0.56        perf-profile.self.cycles-pp.__entry_text_start
      0.59            -0.1        0.47 ±  3%      -0.1        0.48 ±  2%  perf-profile.self.cycles-pp.__build_skb_around
      0.76            -0.1        0.65 ±  3%      -0.1        0.66 ±  2%  perf-profile.self.cycles-pp.__cond_resched
      0.52            -0.1        0.42 ±  4%      -0.1        0.44 ±  2%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.59            -0.1        0.50 ±  3%      -0.1        0.51 ±  2%  perf-profile.self.cycles-pp.consume_skb
      0.72            -0.1        0.63 ±  3%      -0.1        0.64        perf-profile.self.cycles-pp.__check_object_size
      0.66 ±  3%      -0.1        0.57 ±  5%      -0.1        0.58        perf-profile.self.cycles-pp.__check_heap_object
      0.49            -0.1        0.40 ±  3%      -0.1        0.41 ±  2%  perf-profile.self.cycles-pp.mutex_unlock
      1.05 ±  4%      -0.1        0.97 ±  5%      -0.1        0.94        perf-profile.self.cycles-pp.__libc_read
      0.56            -0.1        0.48 ±  4%      -0.1        0.49 ±  2%  perf-profile.self.cycles-pp.unix_write_space
      0.59 ±  2%      -0.1        0.51 ±  4%      -0.0        0.54 ±  4%  perf-profile.self.cycles-pp.__virt_addr_valid
      1.25 ±  2%      -0.1        1.18 ±  7%      -0.0        1.24 ±  2%  perf-profile.self.cycles-pp.__fget_light
      0.56            -0.1        0.49 ±  3%      -0.1        0.50        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.45            -0.1        0.38 ±  4%      -0.1        0.39        perf-profile.self.cycles-pp.__get_task_ioprio
      0.41 ±  2%      -0.1        0.34 ±  6%      -0.1        0.35 ±  2%  perf-profile.self.cycles-pp.aa_file_perm
      0.36            -0.1        0.29 ±  5%      -0.1        0.30 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
      0.37            -0.1        0.31 ±  4%      -0.1        0.32 ±  2%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.34            -0.1        0.28 ±  4%      -0.1        0.28 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.11 ± 73%      -0.1        0.06 ±144%      -0.0        0.10 ± 90%  perf-profile.self.cycles-pp.queue_event
      0.34 ±  2%      -0.1        0.29 ±  3%      -0.1        0.29        perf-profile.self.cycles-pp._copy_to_iter
      0.77            -0.1        0.71 ±  2%      -0.1        0.71 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.31            -0.1        0.25 ±  4%      -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.36 ±  3%      -0.1        0.31 ±  4%      -0.1        0.31 ±  2%  perf-profile.self.cycles-pp.kmalloc_slab
      0.10 ± 44%      -0.1        0.04 ±141%      -0.0        0.08 ± 72%  perf-profile.self.cycles-pp.perf_tp_event
      0.32            -0.1        0.28 ±  5%      -0.0        0.29 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.05            -0.1        0.00            -0.1        0.00        perf-profile.self.cycles-pp.apparmor_socket_sendmsg
      0.05            -0.1        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.apparmor_socket_recvmsg
      0.20 ±  7%      -0.0        0.15 ± 10%      -0.1        0.15 ±  3%  perf-profile.self.cycles-pp.skb_unlink
      0.30 ±  2%      -0.0        0.25 ±  4%      -0.0        0.26        perf-profile.self.cycles-pp.kmalloc_reserve
      0.30 ±  2%      -0.0        0.26 ±  3%      -0.0        0.26 ±  3%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.32            -0.0        0.27 ±  3%      -0.0        0.28        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.50            -0.0        0.45 ±  2%      -0.0        0.46 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.26            -0.0        0.22 ±  7%      -0.0        0.22 ±  3%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.45            -0.0        0.40 ±  3%      -0.0        0.41 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.38            -0.0        0.33 ±  5%      -0.0        0.34        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.23 ±  3%      -0.0        0.19 ±  4%      -0.0        0.19        perf-profile.self.cycles-pp.unix_destruct_scm
      0.24 ±  2%      -0.0        0.20 ±  3%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.22 ±  2%      -0.0        0.18 ±  4%      -0.0        0.19        perf-profile.self.cycles-pp.security_socket_sendmsg
      0.12 ± 14%      -0.0        0.08 ± 10%      -0.0        0.09 ±  6%  perf-profile.self.cycles-pp.obj_cgroup_uncharge_pages
      0.29            -0.0        0.26 ±  4%      -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.20            -0.0        0.17 ±  4%      -0.0        0.17 ±  4%  perf-profile.self.cycles-pp.kfree
      0.19 ±  3%      -0.0        0.16 ±  3%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.03 ± 70%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.obj_cgroup_uncharge
      0.25 ±  5%      -0.0        0.22 ±  5%      -0.0        0.22 ±  9%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.19 ±  2%      -0.0        0.15 ±  4%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.rw_verify_area
      0.24            -0.0        0.20 ±  4%      -0.0        0.21 ±  4%  perf-profile.self.cycles-pp.__fdget_pos
      0.17 ±  2%      -0.0        0.14 ±  5%      -0.0        0.14 ±  6%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.17 ±  2%      -0.0        0.14 ±  5%      -0.0        0.14 ±  2%  perf-profile.self.cycles-pp.skb_queue_tail
      0.18 ±  2%      -0.0        0.15 ±  3%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.29            -0.0        0.26 ±  4%      -0.0        0.27 ±  2%  perf-profile.self.cycles-pp.sock_recvmsg
      0.30            -0.0        0.27 ±  3%      -0.0        0.27 ±  2%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.22 ±  2%      -0.0        0.20 ±  4%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.scm_recv
      0.16 ±  3%      -0.0        0.14 ±  3%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.fsnotify_perm
      0.16 ±  2%      -0.0        0.13 ±  3%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.14 ±  2%      -0.0        0.12 ±  4%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.put_pid
      0.10            -0.0        0.08 ±  6%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.unix_passcred_enabled
      0.17            -0.0        0.15 ±  3%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.check_stack_object
      0.14 ±  3%      -0.0        0.12 ±  4%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.wait_for_unix_gc
      0.26 ±  2%      -0.0        0.24 ±  3%      -0.0        0.24 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.24            -0.0        0.22 ±  2%      -0.0        0.22 ±  4%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.04 ± 44%      -0.0        0.02 ±141%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.select_task_rq
      0.12 ±  4%      -0.0        0.09 ±  7%      -0.0        0.10        perf-profile.self.cycles-pp.simple_copy_to_iter
      0.14 ±  3%      -0.0        0.12 ±  4%      -0.0        0.12 ±  6%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.46            -0.0        0.44 ±  3%      -0.0        0.45 ±  3%  perf-profile.self.cycles-pp.mutex_lock
      0.14 ±  5%      -0.0        0.12 ±  7%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06            -0.0        0.04 ± 44%      -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.should_failslab
      0.18 ±  2%      -0.0        0.16 ±  4%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 ±  3%      -0.0        0.11 ±  4%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.refill_stock
      0.09            -0.0        0.07 ±  6%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.skb_free_head
      0.10 ±  5%      -0.0        0.08 ±  7%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.skb_put
      0.11            -0.0        0.10 ±  5%      -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.skb_release_head_state
      0.12 ±  4%      -0.0        0.10 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.try_charge_memcg
      0.04 ± 44%      -0.0        0.03 ±141%      +0.0        0.05 ± 73%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.07 ±  5%      -0.0        0.06 ±  8%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.kfree_skbmem
      0.12 ±  8%      -0.0        0.11 ± 17%      +0.0        0.13 ± 12%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.17            -0.0        0.16 ±  3%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.is_vmalloc_addr
      0.12 ±  3%      -0.0        0.12 ±  4%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp.task_h_load
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.11            +0.0        0.12 ±  4%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.resched_curr
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.set_next_buddy
      0.14 ±  3%      +0.0        0.14 ±  3%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.put_cpu_partial
      0.06            +0.0        0.07 ±  8%      +0.0        0.07 ±  8%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.05            +0.0        0.06 ±  6%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.05            +0.0        0.06 ±  7%      +0.0        0.06 ± 11%  perf-profile.self.cycles-pp.rb_erase
      0.06 ±  7%      +0.0        0.08 ±  8%      +0.0        0.08 ±  7%  perf-profile.self.cycles-pp.cpuacct_charge
      0.28 ±  2%      +0.0        0.30 ±  3%      +0.0        0.30        perf-profile.self.cycles-pp.ksys_read
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.10 ±  3%      +0.0        0.12 ±  4%      +0.0        0.12 ± 10%  perf-profile.self.cycles-pp.__wake_up_common
      0.10 ±  4%      +0.0        0.12 ±  3%      +0.0        0.12 ± 10%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.08 ±  6%      +0.0        0.10 ±  3%      +0.0        0.09 ± 17%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.wait_consider_task
      0.12 ±  3%      +0.0        0.14 ±  3%      +0.0        0.14 ± 10%  perf-profile.self.cycles-pp.__list_add_valid
      0.06            +0.0        0.09 ±  4%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.dequeue_entity
      0.05            +0.0        0.08 ±  5%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.native_sched_clock
      0.09 ±  5%      +0.0        0.13 ±  3%      +0.0        0.12 ± 11%  perf-profile.self.cycles-pp.switch_fpu_return
      0.06            +0.0        0.09 ±  5%      +0.0        0.09 ± 16%  perf-profile.self.cycles-pp.schedule
      0.11            +0.0        0.14 ±  3%      +0.0        0.13 ± 15%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.02 ± 99%      +0.0        0.06 ±  9%      +0.0        0.06 ±  8%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.05 ±  8%      +0.0        0.09 ±  4%      +0.0        0.08 ± 18%  perf-profile.self.cycles-pp.reweight_entity
      0.00            +0.0        0.04 ± 71%      +0.0        0.00        perf-profile.self.cycles-pp._find_next_bit
      0.02 ±141%      +0.0        0.05 ±  7%      +0.0        0.05 ± 45%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.06 ±  6%      +0.0        0.10 ±  5%      +0.0        0.09 ± 15%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.08 ±  6%      +0.0        0.12 ± 12%      +0.0        0.11 ± 15%  perf-profile.self.cycles-pp.prepare_task_switch
      0.07 ±  7%      +0.0        0.10 ±  4%      +0.0        0.10 ± 14%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.02 ± 99%      +0.0        0.06 ± 14%      +0.0        0.07 ± 16%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.11            +0.0        0.15 ±  3%      +0.0        0.14 ± 13%  perf-profile.self.cycles-pp.schedule_timeout
      0.09            +0.0        0.13 ±  2%      +0.0        0.12 ± 16%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.10            +0.0        0.14 ±  3%      +0.0        0.13 ± 14%  perf-profile.self.cycles-pp.os_xsave
      0.18 ±  4%      +0.0        0.22            +0.0        0.21 ± 11%  perf-profile.self.cycles-pp.enqueue_entity
      0.08 ±  6%      +0.0        0.12 ±  3%      +0.0        0.12 ± 14%  perf-profile.self.cycles-pp.prepare_to_wait
      0.05            +0.0        0.10 ±  5%      +0.1        0.10 ±  6%  perf-profile.self.cycles-pp.__x64_sys_write
      0.27            +0.1        0.32            +0.0        0.32        perf-profile.self.cycles-pp.__list_del_entry_valid
      0.11 ±  4%      +0.1        0.16 ±  3%      +0.0        0.16 ± 14%  perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.1        0.05 ±  8%      +0.0        0.04 ± 45%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.05 ±  8%      +0.0        0.05 ± 45%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.06 ±  6%      +0.0        0.05 ± 45%  perf-profile.self.cycles-pp.pick_next_entity
      0.00            +0.1        0.06 ±  6%      +0.1        0.05 ± 45%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.1        0.06 ±  6%      +0.1        0.05 ± 45%  perf-profile.self.cycles-pp.__calc_delta
      0.28 ±  3%      +0.1        0.34 ±  4%      +0.1        0.34 ±  4%  perf-profile.self.cycles-pp.get_partial_node
      0.79            +0.1        0.86 ±  2%      +0.1        0.85 ±  2%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.1        0.07 ± 10%      +0.1        0.06 ± 45%  perf-profile.self.cycles-pp.select_idle_sibling
      0.00            +0.1        0.07 ±  5%      +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.07 ±  8%      +0.1        0.06 ± 45%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.20 ±  2%      +0.1        0.28 ±  6%      +0.1        0.26 ± 13%  perf-profile.self.cycles-pp.update_curr
      0.18 ±  2%      +0.1        0.26 ±  2%      +0.1        0.25 ± 15%  perf-profile.self.cycles-pp.__switch_to
      0.22 ±  4%      +0.1        0.30 ±  4%      +0.1        0.28 ± 13%  perf-profile.self.cycles-pp.__switch_to_asm
      0.12            +0.1        0.20 ±  3%      +0.1        0.19 ± 15%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.34            +0.1        0.43            +0.1        0.41 ± 11%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.15 ±  3%      +0.1        0.25 ±  3%      +0.1        0.23 ± 16%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.12 ±  4%      +0.1        0.22 ±  4%      +0.1        0.19 ± 20%  perf-profile.self.cycles-pp.___perf_sw_event
      0.49            +0.1        0.62 ±  3%      +0.1        0.60 ± 11%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.1        0.13 ± 14%      +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.select_idle_cpu
      0.30 ±  3%      +0.1        0.44 ±  5%      +0.1        0.43 ±  5%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.05            +0.2        0.20 ±  6%      +0.2        0.20 ±  4%  perf-profile.self.cycles-pp.__x64_sys_read
      0.00            +0.2        0.16 ± 15%      +0.1        0.13 ±  9%  perf-profile.self.cycles-pp.available_idle_cpu
      0.00            +0.2        0.18 ± 21%      +0.2        0.16 ±  8%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.46 ±  2%      +0.3        0.76 ±  2%      +0.2        0.70 ± 17%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.31 ±  2%      +0.3        0.63 ±  4%      +0.3        0.62 ± 18%  perf-profile.self.cycles-pp.update_load_avg
      0.40 ±  5%      +1.1        1.52 ±  9%      +1.1        1.49 ± 27%  perf-profile.self.cycles-pp.update_cfs_group
      5.90 ±  8%      +9.8       15.74 ± 21%      +8.3       14.23 ± 13%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      6.70 ±223%    -100.0%       0.00            +7.6%       7.20 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.01 ±166%     -55.4%       0.00 ±142%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00          -100.0%       0.00       +1.3e+102%       1.27 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +9.8e+100%       0.10 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00       +1.2e+102%       1.25 ±223% +8.6e+101%       0.86 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00          -100.0%       0.00       +2.6e+100%       0.03 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__flush_work.isra.0.__lru_add_drain_all
      0.00          -100.0%       0.00        +3.3e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +3.6e+101%       0.36 ±223% +1.9e+101%       0.19 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00          -100.0%       0.00        +1.5e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.alloc_pipe_info.create_pipe_files
      0.00 ±223%  +1.2e+07%      19.53 ±211%  +5.9e+06%       9.80 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +6.3e+102%       6.32 ±211%   +6e+101%       0.60 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +1.8e+100%       0.02 ±223% +2.5e+101%       0.25 ±211%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.77 ± 77%    +153.0%       1.95 ± 31%    +156.6%       1.98 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00          -100.0%       0.00       +1.2e+100%       0.01 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00       +4.6e+102%       4.63 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00 ±152%  +3.1e+05%       1.56 ±223%   +1100.0%       0.01 ±195%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%     +90.9%       0.00 ±135%    +527.3%       0.01 ±139%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.28 ± 26%    +282.3%       4.90 ±  7%    +261.4%       4.64 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2.22 ± 71%    +238.8%       7.52 ± 42%    +341.0%       9.79 ± 58%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.00          -100.0%       0.00        +5.3e+99%       0.01 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.00        +6.7e+98%       0.00 ±223% +3.1e+102%       3.13 ±164%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00       +8.4e+101%       0.84 ±223% +1.1e+103%      10.50 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.count.constprop.0.isra
      0.31 ±223%    -100.0%       0.00        +10978.9%      34.75 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00 ±223%    -100.0%       0.00        +2.4e+05%       0.40 ±221%  perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.04 ±222%     -97.7%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00 ±152%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      1.32 ±207%     -38.1%       0.82 ±124%    +112.9%       2.81 ±106%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      2.46 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      8.09 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00       +1.6e+100%       0.02 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.6e+102%       1.63 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00         +2e+101%       0.20 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      3.15 ±222%     -99.9%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%     -67.2%       0.45 ±223%     -85.2%       0.20 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00       +1.6e+101%       0.16 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00          -100.0%       0.00        +2.3e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.copy_signal.copy_process.kernel_clone
      0.00       +1.3e+102%       1.28 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +9.6e+100%       0.10 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00        +1.7e+99%       0.00 ±223%    +2e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      1.55 ± 78%     +48.6%       2.30 ± 45%     +34.5%       2.08 ± 19%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.90 ± 44%    +161.2%       2.35 ± 42%    +122.6%       2.00 ± 22%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±203%  +13200.0%       0.29 ±223%     +30.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±180%  +46569.4%       3.81 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.82 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      2.62 ± 53%   +1362.8%      38.28 ± 82%   +1316.0%      37.05 ±140%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      1.07 ±140%     -14.8%       0.91 ±119%    +275.9%       4.03 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.92 ±174%     -16.8%       0.76 ± 73%    +461.0%       5.15 ±198%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      2.54 ±175%     +35.4%       3.44 ± 37%      -9.5%       2.30 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.01 ±136%   +3637.2%       0.27 ±218%   +1060.5%       0.08 ±204%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.5e+101%       0.15 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00          -100.0%       0.00       +6.3e+102%       6.32 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.22 ±102%   +1628.9%       3.83 ± 91%    +562.6%       1.47 ± 99%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.02 ±199%    +348.7%       0.09 ±190%    +214.3%       0.06 ±178%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    171.37 ±222%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00        +1.7e+99%       0.00 ±223%  +1.3e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.00 ±115%  +4.6e+06%      46.34 ±218%  +19333.3%       0.19 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.01 ±190%   +4270.1%       0.63 ±124%   +1019.5%       0.16 ±147%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    260.71 ± 70%     -99.7%       0.79 ±223%     -99.5%       1.38 ±147%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.11 ±221%    +297.0%       0.44 ±111%    +893.9%       1.09 ±147%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      3.59 ± 69%    +559.6%      23.69 ± 80%    +507.1%      21.80 ± 43%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     11.23 ± 26%    +235.8%      37.72 ± 46%    +219.7%      35.91 ± 53%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.88 ±185%     -64.3%       0.32 ±169%     -78.0%       0.19 ±117%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      3.87 ± 57%    +163.6%      10.21 ± 33%    +103.1%       7.86 ± 15%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.93 ±161%    +200.9%       2.80 ± 82%     +31.4%       1.22 ± 73%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      7.37 ± 24%    +125.7%      16.63 ± 13%    +103.7%      15.01 ± 14%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.63 ± 33%    +371.1%       2.98 ± 11%    +372.1%       2.99 ± 11%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00        +2.8e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      0.21 ± 74%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.06 ± 14%     +49.6%       0.09 ±  2%     +50.1%       0.09 ±  2%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork
     24.62 ± 92%     -65.9%       8.38 ± 61%     -77.2%       5.62 ± 67%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 50%  +2.2e+05%      13.31 ± 81%  +55151.4%       3.41 ± 86%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      1.28 ±122%     -43.6%       0.72 ± 98%     -57.8%       0.54 ± 95%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     99.66 ±141%    -100.0%       0.01 ± 46%    -100.0%       0.03 ±156%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     73.92 ±207%     -99.4%       0.47 ±193%     -83.6%      12.14 ±216%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
      0.00          -100.0%       0.00        +8.3e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.00          -100.0%       0.00        +1.3e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.01 ±140%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      0.11 ±122%     -87.6%       0.01 ±161%     -99.4%       0.00 ±223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±223%    -100.0%       0.00         +8154.5%       0.15 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.01 ± 29%   +1767.6%       0.11 ±120%    +164.7%       0.02 ± 70%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 25%     +40.0%       0.01 ± 11%     +44.4%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     12.20 ± 25%     -10.1%      10.97 ± 16%     -24.2%       9.25 ± 31%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5.29 ± 22%    +126.5%      11.97 ± 14%    +104.1%      10.79 ± 14%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.53 ± 22%    +147.3%       3.78 ± 19%    +125.4%       3.44 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.51 ±210%     -98.0%       0.01 ± 10%    +170.4%       1.37 ±222%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
     63.43 ±216%     -98.8%       0.76 ±181%     -99.0%       0.64 ±174%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00 ± 55%  +29770.6%       0.85 ±196%  +11517.6%       0.33 ±223%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      6.52 ±117%   +1570.9%     108.91 ± 55%   +2359.1%     160.29 ± 54%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
     13.39 ±223%    -100.0%       0.00           -46.2%       7.20 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.14 ±191%     -94.8%       0.01 ±158%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00          -100.0%       0.00       +1.3e+102%       1.27 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +9.8e+100%       0.10 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00       +1.2e+102%       1.25 ±223% +2.6e+102%       2.58 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00          -100.0%       0.00       +5.1e+100%       0.05 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__flush_work.isra.0.__lru_add_drain_all
      0.00          -100.0%       0.00          +1e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +1.4e+102%       1.45 ±223% +1.9e+101%       0.19 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00          -100.0%       0.00        +1.5e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.alloc_pipe_info.create_pipe_files
      0.00 ±223%  +4.1e+06%      20.43 ±201%    +2e+06%       9.80 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +2.4e+103%      24.13 ±217%   +6e+101%       0.60 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +1.8e+100%       0.02 ±223%   +7e+101%       0.70 ±219%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
    720.33 ±132%     +52.2%       1096 ± 51%     +75.1%       1261 ± 39%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00          -100.0%       0.00       +1.2e+100%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00       +4.6e+102%       4.63 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.01 ±181%  +68214.6%       4.67 ±223%    +329.3%       0.03 ±203%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.51 ±218%     +51.3%       0.77 ±135%    +331.5%       2.20 ±130%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    309.97 ± 46%    +238.7%       1049 ± 26%    +207.1%     951.76 ± 33%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    898.29 ± 81%     +83.6%       1649 ± 35%     +45.3%       1305 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.00          -100.0%       0.00        +5.3e+99%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.00        +6.2e+99%       0.01 ±223% +7.3e+102%       7.28 ±166%  perf-sched.sch_delay.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00       +8.4e+101%       0.84 ±223% +1.1e+103%      10.50 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.count.constprop.0.isra
      2.20 ±223%    -100.0%       0.00         +6230.8%     139.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00 ±223%    -100.0%       0.00        +4.3e+05%       3.55 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.66 ±222%     -99.7%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      3.49 ±216%    +194.1%      10.28 ±156%    +601.7%      24.52 ±104%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      2.46 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      8.09 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00       +1.1e+101%       0.11 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.6e+102%       1.63 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00         +6e+101%       0.60 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
     44.25 ±221%    -100.0%       0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%     +31.3%       1.79 ±223%     -40.8%       0.80 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00       +1.6e+101%       0.16 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00          -100.0%       0.00        +9.2e+99%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.copy_signal.copy_process.kernel_clone
      0.00       +2.6e+102%       2.56 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +2.9e+101%       0.29 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00        +1.7e+99%       0.00 ±223%    +2e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      1220 ± 79%      -3.9%       1173 ± 84%     +13.0%       1379 ± 67%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
    282.46 ± 58%    +162.0%     740.06 ± 28%    +176.7%     781.56 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.01 ±213%  +10443.9%       1.44 ±223%     -23.2%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.07 ±140%  +10506.7%       7.60 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.82 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    242.88 ± 90%    +255.7%     864.01 ± 71%    +117.0%     526.99 ±102%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      4.32 ±137%     +69.1%       7.30 ±111%    +764.7%      37.32 ± 91%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      5.37 ±155%    +104.3%      10.98 ± 83%   +1935.7%     109.41 ±203%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    380.44 ±188%     +98.7%     756.12 ± 37%      -2.6%     370.60 ± 61%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.08 ±161%   +2582.2%       2.11 ±221%     +20.5%       0.10 ±178%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.5e+101%       0.15 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00          -100.0%       0.00       +6.3e+102%       6.32 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
     45.93 ±141%   +1332.1%     657.83 ±102%    +254.5%     162.86 ± 96%  perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.23 ±197%     +43.3%       0.33 ±205%     -18.2%       0.19 ±174%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    171.37 ±222%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00        +6.8e+99%       0.01 ±223%  +2.7e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.03 ± 86%  +1.4e+06%     463.33 ±218%   +7328.4%       2.53 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.02 ±178%   +6592.4%       1.03 ±134%   +1645.7%       0.27 ±160%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2607 ± 70%    -100.0%       0.79 ±223%     -99.9%       1.79 ±117%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.11 ±221%    +354.0%       0.50 ± 97%   +2327.2%       2.66 ±182%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1287 ± 54%     +12.6%       1448 ± 78%     +11.4%       1434 ± 35%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1979 ± 30%     -25.2%       1481 ± 81%     -35.8%       1270 ± 25%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     33.83 ±204%     -84.1%       5.38 ±147%     -90.1%       3.36 ± 82%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    269.43 ± 84%    +192.2%     787.28 ± 58%    +172.4%     733.86 ± 53%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    122.68 ±149%     -45.6%      66.74 ±104%     -76.6%      28.68 ± 77%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    892.37 ± 63%     +62.4%       1449 ± 27%     +74.6%       1557 ± 50%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3127 ± 12%     +14.8%       3591 ± 39%     -15.2%       2651 ± 46%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00        +2.8e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      1.43 ± 77%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.10 ± 10%      -4.4%       0.09 ±  2%      +4.2%       0.10 ±  8%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork
      2123 ± 79%     -13.8%       1829 ± 26%     +18.1%       2507 ± 58%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 53%  +3.2e+06%     282.54 ± 60%  +9.4e+05%      83.19 ± 86%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
    136.30 ±131%     -97.7%       3.08 ± 98%     -98.5%       2.00 ± 95%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1295 ±141%    -100.0%       0.01 ± 51%    -100.0%       0.06 ±176%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    746.98 ±200%     -99.9%       0.96 ±165%     -93.5%      48.35 ±217%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
      0.00          -100.0%       0.00        +8.3e+98%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.00          -100.0%       0.00        +2.7e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.03 ±156%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.35 ±117%     -97.2%       0.07 ±185%    -100.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±223%    -100.0%       0.00         +8154.5%       0.15 ±223%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.01 ± 67%   +7684.5%       1.09 ±108%    +771.4%       0.12 ± 96%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 37%     +12.3%       0.01 ± 11%     +13.8%       0.01 ±  8%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2017 ± 47%     -42.1%       1167 ± 56%     -54.0%     928.85 ± 84%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    976.48 ± 20%    +120.3%       2151 ± 17%    +109.7%       2048 ± 23%  perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3109 ± 16%     +12.7%       3503 ± 32%     -10.0%       2797 ± 39%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    191.46 ±217%     -99.9%       0.20 ± 52%    +110.9%     403.79 ±223%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
    688.08 ±220%     -99.9%       0.99 ±164%     -99.9%       0.77 ±151%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ± 72%  +83535.1%       5.16 ±185%  +37724.3%       2.33 ±223%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1774 ±108%    +128.5%       4054 ± 26%    +128.0%       4045 ± 21%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      1.38 ± 24%    +260.0%       4.96 ± 13%    +243.1%       4.72 ± 10%  perf-sched.total_sch_delay.average.ms
      4033 ± 12%      +5.2%       4243 ± 26%     +15.5%       4660 ±  7%  perf-sched.total_sch_delay.max.ms
      5.84 ± 25%    +200.2%      17.53 ± 12%    +184.7%      16.63 ± 10%  perf-sched.total_wait_and_delay.average.ms
   3216638 ± 29%     -26.2%    2373769 ± 16%     -25.6%    2393233 ± 16%  perf-sched.total_wait_and_delay.count.ms
      7265 ± 12%     +16.5%       8466 ± 35%     +14.2%       8293 ± 23%  perf-sched.total_wait_and_delay.max.ms
      4.46 ± 25%    +181.7%      12.57 ± 12%    +166.7%      11.90 ± 10%  perf-sched.total_wait_time.average.ms
      4790 ±  2%     +29.5%       6202 ± 19%     +28.4%       6153 ± 16%  perf-sched.total_wait_time.max.ms
      6.70 ±223%    -100.0%       0.00            +7.5%       7.20 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      9.00 ±143%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.90 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      1.43 ±223%   +1199.7%      18.64 ±223%    +583.1%       9.80 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +4.3e+103%      43.24 ±156%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.97 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +4.6e+102%       4.63 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00       +3.5e+102%       3.52 ±223%   +1e+103%      10.46 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
     12.16 ± 45%     +68.2%      20.45 ± 51%     +92.3%      23.38 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.62 ±102%    +102.9%       5.32 ±141%    +126.4%       5.94 ±141%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      9.57 ± 56%    +250.2%      33.50 ± 35%    +258.7%      34.31 ± 39%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00          -100.0%       0.00       +1.7e+104%     166.74 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00       +1.1e+103%      10.50 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.count.constprop.0.isra
      0.00          -100.0%       0.00         +7e+103%      69.72 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      7.04 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00         +4e+102%       3.96 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      3.22 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.24 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      2.46 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
     20.66 ±205%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      6.39 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      1.91 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.00          -100.0%       0.00       +1.7e+104%     166.11 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      3.89 ±108%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.09 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
     33.45 ±223%    +283.9%     128.43 ±163%     +68.6%      56.39 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
    167.97 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00          -100.0%       0.00         +3e+102%       2.96 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00       +9.6e+102%       9.56 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      5.93 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      4.13 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      3.92 ±101%   +2139.3%      87.76 ± 76%   +2001.7%      82.37 ±140%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      4.56 ±143%    -100.0%       0.00          +110.7%       9.61 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      4.47 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00       +3.6e+102%       3.64 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00          -100.0%       0.00       +6.3e+102%       6.32 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.00       +5.2e+102%       5.15 ±223% +3.6e+102%       3.64 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +1.3e+103%      12.71 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1042 ±193%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +9.1e+103%      91.31 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    249.96 ±223%    +200.4%     750.84 ± 63%      +0.1%     250.10 ±152%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    320.75 ± 45%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.2e+104%     222.43 ±223% +8.4e+104%     835.30 ± 56%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     16.49 ± 59%    +474.3%      94.70 ± 59%    +423.8%      86.37 ± 21%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     27.93 ± 24%    +367.5%     130.59 ± 26%    +295.9%     110.58 ± 36%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2.46 ±154%    -100.0%       0.00           +19.3%       2.94 ±223%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     17.68 ± 51%    +110.3%      37.19 ± 24%     +73.4%      30.67 ± 13%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.67 ±223%    +193.8%       7.85 ±141%    +240.7%       9.10 ±142%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     25.14 ± 25%    +123.4%      56.16 ± 11%     +98.4%      49.86 ± 10%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.60 ± 22%    +307.9%      10.62 ± 11%    +300.3%      10.42 ± 10%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.29 ±154%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    415.69 ± 13%     -13.3%     360.47 ± 21%     -20.2%     331.64 ± 23%  perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork
    177.44 ± 37%     -67.7%      57.30 ± 78%     -67.3%      57.97 ± 92%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      2.35 ±156%   +1362.5%      34.32 ± 78%    +322.2%       9.91 ±141%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
     19.21 ± 30%   +3333.9%     659.81 ± 51%   +2654.1%     529.19 ±102%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    227.59 ± 74%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    461.68 ± 19%     +33.0%     613.98 ± 51%     +10.3%     509.29 ± 76%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    270.02 ±178%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      1.72 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      5.55 ±142%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00          -100.0%       0.00       +6.5e+103%      65.35 ±143%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    907.21 ± 80%     +28.4%       1164 ± 19%     +25.9%       1142 ± 30%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     31.07 ± 18%      +1.4%      31.51 ± 15%     -13.0%      27.03 ± 20%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     27.61 ± 16%     +53.9%      42.49 ± 13%     +39.6%      38.54 ± 12%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      5.73 ± 21%    +126.5%      12.97 ± 20%    +104.3%      11.70 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    950.13 ± 30%     -14.1%     816.20 ± 14%      -8.9%     865.09 ± 24%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    478.61 ± 33%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    464.68 ± 11%    +110.3%     977.43 ± 12%    +107.9%     966.00 ± 14%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.33 ±223%    -100.0%       0.00           -50.0%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
     31.67 ±142%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.17 ±223%      +0.0%       0.17 ±223%      +0.0%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +1.2e+102%       1.17 ±143%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
    473.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +1.7e+101%       0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00         +5e+101%       0.50 ±223% +8.3e+101%       0.83 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    243.50 ± 45%     -11.3%     216.00 ± 54%      -2.9%     236.50 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    567.00 ±101%     +94.3%       1101 ±141%    +104.1%       1157 ±141%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    719.17 ± 48%     +22.1%     878.17 ± 21%     +22.3%     879.33 ± 18%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.count.constprop.0.isra
      0.00          -100.0%       0.00       +6.7e+101%       0.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.50 ±152%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      2.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
    675.33 ±101%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      1.83 ±223%     -18.2%       1.50 ±142%     -72.7%       0.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00       +3.3e+101%       0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      2.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
     90.00 ±115%     -52.8%      42.50 ± 73%     -83.3%      15.00 ±134%  perf-sched.wait_and_delay.count.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.50 ±145%    -100.0%       0.00           +46.7%       3.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     27.50 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00         +5e+101%       0.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.00       +4.8e+103%      48.17 ±223% +4.5e+103%      45.00 ±223%  perf-sched.wait_and_delay.count.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +3.3e+101%       0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.33 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +1.7e+102%       1.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.33 ±223%    +400.0%       1.67 ± 44%    +150.0%       0.83 ±145%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.67 ± 45%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+101%       0.50 ±223% +1.8e+102%       1.83 ± 48%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    883.50 ± 49%     -80.2%     174.50 ± 22%     -79.2%     183.83 ± 23%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    298.17 ± 17%     -70.9%      86.67 ± 27%     -72.4%      82.17 ± 31%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     15.00 ±141%    -100.0%       0.00           -73.3%       4.00 ±223%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    120.00 ± 23%    +103.8%     244.50 ± 22%    +119.4%     263.33 ± 15%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     21.17 ±223%     -42.5%      12.17 ±147%     -51.2%      10.33 ±154%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    709.33 ± 14%    +264.5%       2585 ± 18%    +304.8%       2871 ±  8%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    944215 ± 39%     -58.1%     395720 ± 22%     -60.8%     369725 ± 25%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     26.33 ±155%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     12.00 ± 15%      +2.8%      12.33 ± 12%     +13.9%      13.67 ± 14%  perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork
    137.33 ± 61%     +59.0%     218.33 ± 83%    +293.2%     540.00 ± 75%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.17 ±143%   +2871.4%      34.67 ± 54%    +985.7%      12.67 ±143%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork
      1107 ± 91%     -99.6%       4.83 ± 25%     -99.8%       2.67 ±100%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     10.33 ± 47%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     14.00 ± 13%     -77.4%       3.17 ± 61%     -76.2%       3.33 ± 47%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.50 ±152%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.50 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      6.83 ±171%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00          -100.0%       0.00       +5.5e+102%       5.50 ±149%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.67 ± 51%     +40.9%       5.17 ± 13%     +77.3%       6.50 ± 24%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    266.83 ± 16%      -0.1%     266.50 ± 16%     +13.5%     302.83 ± 17%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     81307 ± 17%    +363.5%     376823 ± 18%    +423.7%     425810 ± 12%  perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   2176277 ± 27%     -27.4%    1580808 ± 17%     -27.6%    1576103 ± 17%  perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    557.17 ± 13%     -39.7%     336.17 ± 23%     -42.8%     318.67 ± 13%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
     10.17 ± 20%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.syslog_print.do_syslog.kmsg_read.vfs_read
      1000 ±  8%     -67.9%     320.67 ± 23%     -67.5%     325.00 ± 17%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
     13.39 ±223%    -100.0%       0.00           -46.2%       7.20 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
    832.01 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.90 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      1.43 ±223%   +1199.7%      18.64 ±223%    +583.1%       9.80 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +1.4e+104%     137.69 ±150%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
    323.75 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +4.6e+102%       4.63 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00       +1.1e+103%      10.53 ±223% +5.2e+103%      52.10 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    871.44 ± 44%     +68.7%       1470 ± 52%     +70.0%       1481 ± 24%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    364.18 ±113%     +54.7%     563.28 ±143%     +62.4%     591.25 ±148%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1955 ± 76%     +70.5%       3334 ± 35%     +38.1%       2699 ± 66%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00          -100.0%       0.00       +1.7e+104%     166.74 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.00          -100.0%       0.00       +1.1e+103%      10.50 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.count.constprop.0.isra
      0.00          -100.0%       0.00       +2.8e+104%     278.67 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
     28.14 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00          -100.0%       0.00         +4e+102%       3.96 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      3.22 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      3.41 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      2.46 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
     22.03 ±191%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
     89.20 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      1.91 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.00          -100.0%       0.00       +1.7e+104%     166.11 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      2119 ±105%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     24.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
    367.73 ±223%      +2.6%     377.39 ±142%     -54.0%     169.09 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
    167.97 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00          -100.0%       0.00         +3e+102%       2.96 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00       +1.6e+103%      16.27 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
     94.70 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      4.13 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    374.20 ±135%    +391.6%       1839 ± 65%    +207.6%       1151 ±126%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     29.57 ±141%    -100.0%       0.00          +599.1%     206.75 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    676.11 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00       +1.1e+103%      10.88 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00          -100.0%       0.00       +6.3e+102%       6.32 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.00       +2.9e+104%     288.94 ±223%   +3e+104%     295.38 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +2.5e+103%      25.43 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1042 ±193%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +9.1e+104%     912.75 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    499.91 ±223%    +200.2%       1500 ± 63%      -0.0%     499.88 ±152%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3278 ± 44%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+104%     500.57 ±223% +1.7e+105%       1671 ± 56%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2431 ± 65%     +27.3%       3096 ± 72%     +17.3%       2851 ± 40%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      4073 ± 29%      -9.4%       3692 ± 51%     -42.0%       2363 ± 31%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    101.20 ±149%    -100.0%       0.00           -32.9%      67.95 ±223%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    895.24 ± 88%     +89.2%       1694 ± 51%     +91.7%       1715 ± 40%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    330.28 ±223%     -47.4%     173.58 ±141%     -36.4%     210.13 ±144%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1793 ± 63%     +67.8%       3010 ± 22%     +76.3%       3161 ± 49%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      6314 ± 12%     +14.2%       7208 ± 39%     -15.8%       5315 ± 47%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     15.47 ±167%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2513 ± 26%     -36.6%       1594 ± 21%     -33.8%       1663 ± 19%  perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork
      5814 ± 27%     -50.4%       2880 ± 74%     -31.1%       4006 ± 50%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      5.83 ±188%  +10569.2%     622.17 ± 63%   +3035.5%     182.85 ±141%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      2399 ± 67%      -9.5%       2171 ± 31%     -37.4%       1503 ±107%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2654 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      3862 ±  6%     -61.2%       1499 ± 47%     -63.9%       1393 ± 65%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    319.58 ±155%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      5.10 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
    101.24 ±168%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00          -100.0%       0.00       +1.1e+105%       1086 ±155%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2604 ± 65%     +12.9%       2940 ± 31%     +19.3%       3107 ± 41%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4206 ± 41%     -41.5%       2460 ± 52%     -54.4%       1918 ± 81%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1978 ± 19%    +118.9%       4331 ± 17%    +108.1%       4117 ± 23%  perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      6221 ± 16%     +12.9%       7026 ± 32%      -7.8%       5739 ± 38%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4978 ±  9%     +15.8%       5765 ± 20%     +23.7%       6160 ± 16%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      4649 ± 33%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      4706 ±  8%     +72.8%       8131 ± 37%     +50.9%       7103 ± 19%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.75 ±213%     -84.9%       0.11 ±197%     -97.3%       0.02 ±101%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00 ±223%   +1552.6%       0.05 ±179%     +78.9%       0.01 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      9.19 ±138%     -70.3%       2.73 ± 74%     -80.2%       1.82 ± 47%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.19 ±108%    +196.0%       0.56 ±124%     -85.4%       0.03 ± 80%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    +666.7%       0.01 ±154%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00 ±223%    +577.8%       0.01 ±179%     +11.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00          -100.0%       0.00       +4.3e+100%       0.04 ±202%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00        +5.5e+99%       0.01 ±223% +2.2e+100%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.alloc_new_pud
      0.06 ±223%     -97.4%       0.00 ±223%     -88.1%       0.01 ±147%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.04 ±167%     -77.3%       0.01 ±223%     -95.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00        +3.2e+99%       0.00 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +3.2e+99%       0.00 ±223% +8.2e+101%       0.82 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.00 ±141%    +460.0%       0.02 ±146%   +9985.0%       0.34 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00        +1.5e+99%       0.00 ±223%  +3.8e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00          -100.0%       0.00          +3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.05 ±223%   +1038.2%       0.54 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00        +6.2e+99%       0.01 ±172%  +8.3e+98%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00 ±223%     +11.1%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.wp_page_copy.__handle_mm_fault.handle_mm_fault
      0.19 ±168%    +410.5%       0.99 ±135%   +1321.4%       2.76 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.06 ±223%     -72.9%       0.02 ± 57%     -96.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.06 ±104%     +35.4%       0.08 ±151%     -94.4%       0.00 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      1.06 ±184%     -41.2%       0.63 ±137%     -98.9%       0.01 ±106%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01 ±223%   +4312.1%       0.24 ±222%   +3424.2%       0.19 ±212%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_binary.search_binary_handler
      1.45 ±220%     -98.8%       0.02 ±223%     -88.4%       0.17 ±203%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00        +3.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±197%    +233.7%       0.05 ±223%     +31.5%       0.02 ±193%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.task_numa_fault.do_numa_page
      0.02 ±153%     -86.7%       0.00 ±223%     -53.1%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.07 ±119%     -58.0%       0.03 ±144%     -76.7%       0.02 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
      0.00         +4e+103%      39.71 ±161% +8.4e+101%       0.84 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +3.7e+101%       0.37 ±223% +8.1e+101%       0.81 ±171%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.11 ±146%     -65.4%       0.04 ±100%     -92.0%       0.01 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      3.64 ± 21%     +89.4%       6.89 ± 31%     +55.0%       5.64 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.01 ±168%    -100.0%       0.00           -81.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.kernfs_fop_open.do_dentry_open
      0.01 ±223%     -77.4%       0.00 ±223%     -60.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.load_elf_binary.search_binary_handler
      0.05 ± 39%   +1143.1%       0.62 ±201%    +348.8%       0.22 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.03 ± 47%     -30.3%       0.02 ±223%     -25.4%       0.02 ±206%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00          -100.0%       0.00       +6.4e+101%       0.64 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.47 ± 97%    +436.3%       2.51 ±170%   +2226.3%      10.91 ±212%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     12.35 ± 41%     +87.3%      23.14 ± 26%     +89.2%      23.37 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.33 ± 19%    +277.2%      12.58 ± 11%    +246.0%      11.54 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      7.80 ± 41%    +233.1%      25.98 ± 35%    +214.4%      24.52 ± 33%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00         +4e+101%       0.40 ±223%  +5.3e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      0.51 ±210%     +61.4%       0.82 ±207%    +186.6%       1.45 ±218%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.87 ±220%     -81.1%       0.16 ±139%     -39.8%       0.53 ±215%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.02 ±129%    -100.0%       0.00        +9.6e+05%     166.73 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.03 ±118%     -41.5%       0.02 ± 97%     -72.1%       0.01 ± 87%  perf-sched.wait_time.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.03 ±209%     -61.3%       0.01 ±100%     -77.4%       0.01 ±168%  perf-sched.wait_time.avg.ms.__cond_resched.count.constprop.0.isra
      0.15 ±179%     -91.1%       0.01 ±223%    +112.8%       0.31 ±153%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      0.97 ± 96%     -46.7%       0.52 ±197%   +3558.5%      35.59 ±218%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.01 ±150%    +307.4%       0.04 ±191%   +9075.9%       0.83 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.2e+99%       0.01 ±154%  +1.2e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.01 ±196%   +1077.6%       0.13 ±205%     +58.2%       0.02 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00        +1.3e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
      7.28 ±214%     -97.4%       0.19 ±169%     -94.0%       0.44 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.08 ±207%     -93.5%       0.01 ±161%     -86.4%       0.01 ±184%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.80 ±223%    +209.3%       2.48 ±213%    +491.3%       4.73 ±183%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      0.87 ±133%     +60.2%       1.40 ± 43%    +172.0%       2.38 ± 97%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00        +1.2e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.__do_sys_newuname.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.33 ± 78%     -94.7%       0.02 ±111%     -90.5%       0.03 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.04 ±213%     -97.1%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exec_mmap
      0.00 ±223%    +114.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00           -40.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00        +5.3e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.open_last_lookups
      0.00       +1.4e+100%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00          -100.0%       0.00        +5.2e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.04 ±172%    -100.0%       0.00           -71.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±190%    +131.9%       0.03 ±182%    +156.5%       0.03 ±116%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.02 ±175%     -67.9%       0.01 ±106%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.08 ±180%     -94.9%       0.00 ±223%     -83.8%       0.01 ±157%  perf-sched.wait_time.avg.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.06 ±223%     -42.4%       0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +8.3e+99%       0.01 ±223%  +2.8e+99%       0.00 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.05 ±214%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00 ±223%     +14.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.03 ±209%     -65.1%       0.01 ±178%     -93.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00       +7.7e+100%       0.08 ±223%    +4e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.01 ±223%     +34.2%       0.01 ±223%     -50.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +3.5e+99%       0.00 ±147% +5.1e+100%       0.05 ±201%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±223%    -100.0%       0.00           -85.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
      1.19 ±198%     -88.9%       0.13 ± 99%     -61.0%       0.46 ±192%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.04 ± 78%      -4.5%       0.04 ± 95%   +1291.1%       0.57 ±205%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      3.28 ±218%     -99.4%       0.02 ±152%     -99.6%       0.01 ±101%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.15 ± 97%     -46.5%       0.08 ±134%     -83.9%       0.02 ±102%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.03 ±223%     -90.0%       0.00 ±223%     -86.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.08 ±223%    -100.0%       0.00           -92.3%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +5.3e+101%       0.53 ±146% +1.2e+102%       1.23 ±220%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +3.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.00          -100.0%       0.00          +9e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.vma_expand.shift_arg_pages
      0.00          -100.0%       0.00        +8.2e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.vma_shrink.shift_arg_pages
      0.00          -100.0%       0.00          +3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.elf_map.load_elf_binary
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.elf_map.load_elf_interp
      0.01 ±223%    -100.0%       0.00           -64.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.alloc_bprm.do_execveat_common.isra
      0.23 ±208%    +179.4%       0.63 ± 92%    +522.6%       1.40 ± 96%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±160%     -53.7%       0.01 ±223%     -58.2%       0.00 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.38 ±169%     +12.0%       0.43 ±180%     -92.9%       0.03 ± 99%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.01 ±172%    -100.0%       0.00         +1458.8%       0.13 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.20 ±223%     -96.7%       0.01 ±223%     -89.9%       0.02 ± 64%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.05 ±223%     +53.0%       0.08 ±205%     -91.6%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +9.3e+100%       0.09 ±200%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.08 ± 86%     -83.6%       0.01 ±144%     -83.8%       0.01 ±202%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.24 ±139%    +165.8%       0.65 ± 98%    +232.4%       0.81 ±149%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.05 ±122%     -87.3%       0.01 ±100%    +760.5%       0.42 ±188%  perf-sched.wait_time.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.03 ±161%     -74.1%       0.01 ±117%     +36.7%       0.04 ±162%  perf-sched.wait_time.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.03 ± 88%     -86.5%       0.00 ±223%     -31.8%       0.02 ±207%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
     12.58 ±194%     -99.8%       0.03 ±223%     -89.5%       1.32 ±212%  perf-sched.wait_time.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.03 ±124%   +1494.4%       0.43 ± 80%   +9839.4%       2.65 ±177%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.01 ±165%     -56.8%       0.00 ±141%     +22.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.03 ±210%    -100.0%       0.00           -81.7%       0.01 ±156%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00          -100.0%       0.00       +2.3e+100%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_lookupat.filename_lookup
      0.05 ± 85%    +305.6%       0.22 ±129%     -36.1%       0.03 ± 81%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.09 ±223%     -98.2%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.02 ±204%     -30.1%       0.02 ±223%     -86.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
      3.57 ±199%     -85.9%       0.50 ±185%     -98.7%       0.05 ± 60%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.02 ±138%    +178.4%       0.05 ±160%    +155.0%       0.05 ±181%  perf-sched.wait_time.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.01 ±147%    +266.7%       0.03 ±120%    +641.7%       0.06 ±151%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.02 ±147%    -100.0%       0.00           -12.6%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
      0.67 ± 88%    +424.6%       3.54 ± 70%    +372.1%       3.18 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00          -100.0%       0.00         +3e+101%       0.30 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.05 ±145%   +2430.7%       1.22 ±187%    +254.8%       0.17 ±171%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.02 ±138%     -90.3%       0.00 ±223%     -91.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.01 ±164%     -61.0%       0.01 ±223%     -25.6%       0.01 ± 87%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.03 ± 96%   +5154.5%       1.44 ±215%     +18.2%       0.03 ±146%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00          -100.0%       0.00       +1.3e+102%       1.28 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_kernel.open_exec.load_elf_binary
      0.00       +9.8e+100%       0.10 ±223%   +2e+100%       0.02 ±170%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.8e+100%       0.02 ±202% +1.4e+100%       0.01 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.13 ±168%     -37.6%       0.08 ±176%    +177.5%       0.36 ±187%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.06 ±164%    -100.0%       0.00          +135.8%       0.13 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.79 ±223%     -98.9%       0.01 ±112%     -99.1%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_shrink
      0.00 ±223%  +15320.0%       0.26 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.02 ±147%     +69.2%       0.03 ±130%   +7679.2%       1.56 ±220%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      1.91 ±223%     -99.0%       0.02 ±117%     -98.0%       0.04 ±185%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.01 ±165%     -27.8%       0.00 ±142%     +16.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +5.3e+100%       0.05 ±186%  +5.2e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.00       +1.6e+100%       0.02 ±223%  +4.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.vm_brk_flags
      0.18 ±184%    +817.1%       1.65 ±221%      +8.3%       0.19 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.05 ± 95%     +10.4%       0.06 ±173%     -47.2%       0.03 ±138%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00 ±223%    +911.1%       0.03 ±223%   +1305.6%       0.04 ±153%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.04 ±162%    -100.0%       0.00        +4.2e+05%     166.11 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      0.01 ±223%    -100.0%       0.00           -78.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00 ±223%    -100.0%       0.00          +353.8%       0.01 ±181%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      4.66 ± 31%     +81.9%       8.47 ± 18%     +56.9%       7.31 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.14 ±221%    -100.0%       0.00          -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00 ±223%   +4422.2%       0.07 ±223%   +1155.6%       0.02 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.11 ±184%    -100.0%       0.00           -99.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.38 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.00       +4.4e+100%       0.04 ±135% +1.7e+100%       0.02 ±143%  perf-sched.wait_time.avg.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      0.00       +1.2e+102%       1.25 ±222% +3.1e+100%       0.03 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00          -100.0%       0.00        +4.5e+99%       0.00 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__perf_event_read_value.perf_read.vfs_read
      0.00        +2.3e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.fifo_open.do_dentry_open.do_open
      0.03 ±131%     -39.7%       0.02 ±144%     +68.1%       0.06 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.02 ±152%     -25.8%       0.02 ±142%    +101.6%       0.04 ±160%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
     33.65 ±222%    +281.9%     128.52 ±163%     +68.3%      56.63 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±223%     -75.7%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.00          -100.0%       0.00        +5.7e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
    167.98 ±223%     -99.6%       0.68 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_release.__fput.task_work_run
      0.00        +2.5e+99%       0.00 ±145% +3.6e+102%       3.61 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
      2.30 ± 61%    +143.9%       5.60 ± 27%    +107.0%       4.76 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±223%    -100.0%       0.00          +130.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_interruptible.bprm_execve.do_execveat_common.isra
      0.00          -100.0%       0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_interruptible.devkmsg_read.vfs_read.ksys_read
      0.05 ± 98%     -40.4%       0.03 ±101%   +1700.0%       0.86 ±221%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00       +1.2e+100%       0.01 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.dup_mm
      0.04 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.pick_link.step_into.open_last_lookups.path_openat
      0.14 ± 86%   +4254.5%       6.15 ±206%    +349.6%       0.64 ±198%  perf-sched.wait_time.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +300.0%       0.01 ±223%     -18.2%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.10 ±223%     -94.9%       0.01 ±223%     -98.7%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.08 ±144%     +30.2%       0.11 ±138%   +2643.8%       2.22 ±214%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.14 ± 68%     -86.7%       0.02 ±223%     -99.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      5.99 ±220%    -100.0%       0.00          -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.35 ±209%     -98.8%       0.02 ±131%     -99.5%       0.01 ±108%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      2.32 ±222%     -99.4%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      3.33 ± 35%   +1384.2%      49.48 ± 71%   +1465.5%      52.19 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.01 ±223%    +152.8%       0.02 ±122%    +152.8%       0.02 ±148%  perf-sched.wait_time.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      0.02 ±113%   +5995.8%       1.20 ±209%   +3734.7%       0.75 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.09 ±219%     -92.1%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±119%    -100.0%       0.00           -93.2%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.28 ±184%     -98.9%       0.00 ±223%     -72.9%       0.08 ±170%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      3.93 ±132%     +61.4%       6.34 ± 85%    +114.4%       8.43 ±120%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      3.86 ±122%     +89.8%       7.33 ± 18%     +96.6%       7.59 ± 35%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.26 ±207%    +211.2%       3.91 ±204%     -40.2%       0.75 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.01 ±171%     -50.8%       0.01 ±223%    +266.7%       0.04 ± 74%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00 ±223%   +2270.0%       0.04 ±181%   +1830.0%       0.03 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.00          -100.0%       0.00       +2.5e+100%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.23 ±142%     -92.9%       0.02 ±112%     -90.6%       0.02 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.05 ±127%    +454.4%       0.29 ±162%     -63.1%       0.02 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.02 ±143%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.34 ± 27%    +584.4%       9.15 ± 58%    +495.0%       7.96 ± 58%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.28 ±132%   +4590.0%      13.19 ±213%     +24.2%       0.35 ±131%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    871.93 ±188%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.15 ± 56%    +107.9%       0.30 ±181%    +520.9%       0.90 ±183%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.12 ± 17%  +38424.8%      47.32 ±215%    +205.0%       0.37 ±147%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    249.95 ±223%    +200.1%     750.21 ± 63%      -0.0%     249.94 ±152%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     60.83 ±205%    -100.0%       0.00           -98.8%       0.75 ±141%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.2e+104%     222.39 ±223% +8.3e+104%     834.47 ± 56%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     14.10 ± 50%    +403.7%      71.01 ± 56%    +358.0%      64.57 ± 14%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     16.70 ± 30%    +456.1%      92.87 ± 25%    +347.1%      74.67 ± 43%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2.20 ± 95%     -85.8%       0.31 ±113%     +49.6%       3.29 ±194%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     13.81 ± 55%     +95.4%      26.98 ± 30%     +65.1%      22.80 ± 20%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.38 ±176%    +310.8%       9.79 ± 77%    +397.4%      11.86 ± 88%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     17.77 ± 27%    +122.5%      39.53 ± 10%     +96.2%      34.85 ± 10%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.97 ± 19%    +287.7%       7.64 ± 11%    +277.2%       7.43 ±  9%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.69 ± 89%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    415.63 ± 13%     -13.3%     360.38 ± 21%     -20.2%     331.55 ± 23%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork
    152.83 ± 40%     -65.4%      52.88 ± 66%     -63.7%      55.49 ± 87%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.96 ± 74%    +479.6%      22.95 ± 60%    +266.6%      14.52 ± 42%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
     17.93 ± 28%   +3575.5%     659.08 ± 51%   +2848.7%     528.76 ±102%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    128.73 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    387.76 ± 49%     +58.4%     614.18 ± 51%     +28.2%     497.15 ± 76%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.07 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
    270.04 ±178%    -100.0%       0.02 ±223%    -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.02 ± 89%    -100.0%       0.00          +152.9%       0.04 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      1.80 ±210%     -82.2%       0.32 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      6.34 ±116%     -80.7%       1.22 ±104%     -94.8%       0.33 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.06 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      1.85 ± 48%    +225.2%       6.01 ± 44%   +3708.1%      70.42 ±127%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    907.21 ± 80%     +28.4%       1164 ± 19%     +25.9%       1142 ± 30%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ±220%   +1222.8%       0.43 ±223%   +4114.7%       1.38 ±141%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     18.88 ± 14%      +8.8%      20.54 ± 15%      -5.8%      17.78 ± 14%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     22.32 ± 22%     +36.7%      30.51 ± 13%     +24.3%      27.75 ± 12%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      4.20 ± 21%    +118.9%       9.19 ± 20%     +96.6%       8.25 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    949.62 ± 30%     -14.1%     816.19 ± 14%      -9.0%     863.73 ± 24%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    415.18 ± 24%     -99.9%       0.58 ±154%     -99.8%       0.73 ±109%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.23 ±141%    +320.9%       0.98 ± 74%    +470.1%       1.32 ± 76%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    458.16 ± 10%     +89.6%     868.51 ± 13%     +75.9%     805.71 ± 11%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
      0.76 ±210%     -84.4%       0.12 ±187%     -94.7%       0.04 ±120%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00 ±223%   +1066.7%       0.05 ±178%     +25.9%       0.01 ±154%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
    839.89 ±139%     -62.6%     314.22 ± 79%     -74.7%     212.41 ± 63%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1.49 ±102%     -41.8%       0.87 ±127%     -96.3%       0.06 ±113%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    +877.8%       0.01 ±168%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00 ±223%    +577.8%       0.01 ±179%     +11.1%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00          -100.0%       0.00       +4.3e+100%       0.04 ±202%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00        +5.5e+99%       0.01 ±223% +2.2e+100%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.alloc_new_pud
      0.06 ±223%     -97.4%       0.00 ±223%     -88.1%       0.01 ±147%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.04 ±167%     -59.1%       0.02 ±223%     -95.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00        +3.2e+99%       0.00 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +3.2e+99%       0.00 ±223% +8.2e+101%       0.82 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.00 ±142%    +431.8%       0.02 ±139%  +26904.5%       0.99 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00        +1.5e+99%       0.00 ±223%  +3.8e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00          -100.0%       0.00          +3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.05 ±223%   +1038.2%       0.54 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00        +6.2e+99%       0.01 ±172%  +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00 ±223%     +11.1%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.wp_page_copy.__handle_mm_fault.handle_mm_fault
      4.10 ±215%    +213.0%      12.83 ± 82%   +2619.8%     111.52 ±194%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.06 ±223%     -66.6%       0.02 ± 67%     -91.8%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.06 ±100%    +205.4%       0.18 ±140%     -91.7%       0.00 ±155%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      1.23 ±161%      +0.4%       1.23 ±139%     -98.3%       0.02 ±104%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01 ±223%   +4312.1%       0.24 ±222%   +3515.2%       0.20 ±206%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_binary.search_binary_handler
      1.46 ±218%     -98.8%       0.02 ±223%     -88.2%       0.17 ±199%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00        +3.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±197%    +233.7%       0.05 ±223%     +31.5%       0.02 ±193%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.task_numa_fault.do_numa_page
      0.02 ±153%     -86.7%       0.00 ±223%     -53.1%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.08 ±129%     -62.2%       0.03 ±144%     -76.5%       0.02 ±106%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
      0.00       +1.2e+104%     120.73 ±160% +8.4e+101%       0.84 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +3.7e+101%       0.37 ±223%   +2e+102%       1.99 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.13 ±126%     -67.0%       0.04 ± 87%     -92.7%       0.01 ±119%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      2354 ± 24%      +3.6%       2437 ± 45%     -37.1%       1481 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.01 ±168%    -100.0%       0.00           -81.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.kernfs_fop_open.do_dentry_open
      0.01 ±223%     -77.4%       0.00 ±223%     -60.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.load_elf_binary.search_binary_handler
      0.10 ± 43%   +2807.8%       2.97 ±210%   +1114.9%       1.24 ±215%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.05 ± 61%     -38.9%       0.03 ±223%     -53.4%       0.02 ±204%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00          -100.0%       0.00       +6.4e+101%       0.64 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      7.91 ±119%     -15.0%       6.72 ±190%    +580.9%      53.86 ±214%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
    890.90 ± 38%     +87.4%       1669 ± 27%     +66.3%       1481 ± 24%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    473.09 ± 57%    +171.4%       1283 ± 27%    +130.1%       1088 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1428 ± 53%     +54.8%       2211 ± 38%     +15.7%       1652 ± 51%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00         +4e+101%       0.40 ±223%  +9.2e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      3.34 ±219%     -48.7%       1.71 ±212%     -55.9%       1.47 ±215%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.88 ±220%     -71.1%       0.25 ±160%    +364.6%       4.07 ±222%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.02 ±129%    -100.0%       0.00        +9.6e+05%     166.73 ±223%  perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.06 ±142%     +14.6%       0.07 ±162%     -68.9%       0.02 ± 94%  perf-sched.wait_time.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.05 ±214%     -74.6%       0.01 ±100%     -77.1%       0.01 ±185%  perf-sched.wait_time.max.ms.__cond_resched.count.constprop.0.isra
      0.18 ±149%     -92.6%       0.01 ±223%    +131.4%       0.41 ±141%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      3.78 ±122%     -72.1%       1.05 ±192%   +3621.6%     140.50 ±222%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.01 ±150%    +663.0%       0.07 ±206%   +9094.4%       0.83 ±221%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.2e+99%       0.01 ±154%  +1.2e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.01 ±196%   +1083.6%       0.13 ±204%     +68.7%       0.02 ±169%  perf-sched.wait_time.max.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00        +1.3e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
     29.55 ±210%     -97.3%       0.81 ±201%     -84.7%       4.53 ±144%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.08 ±207%     -93.5%       0.01 ±161%     -86.4%       0.01 ±184%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      1.22 ±223%    +103.4%       2.48 ±213%    +352.4%       5.51 ±160%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
     15.34 ±131%    +183.3%      43.46 ± 23%     +54.8%      23.74 ± 78%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00        +1.2e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.__do_sys_newuname.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.98 ±118%     -99.0%       0.02 ±110%     -98.2%       0.03 ±105%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.10 ±219%     -98.8%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exec_mmap
      0.00 ±223%    +114.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00           -40.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00        +5.3e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.open_last_lookups
      0.00       +1.4e+100%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00          -100.0%       0.00        +5.2e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.04 ±175%    -100.0%       0.00           -73.5%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±194%    +344.3%       0.06 ±200%    +302.5%       0.05 ±122%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.02 ±170%     -61.4%       0.01 ±115%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.08 ±180%     -88.7%       0.01 ±223%     -83.8%       0.01 ±157%  perf-sched.wait_time.max.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.06 ±223%     -42.4%       0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +8.3e+99%       0.01 ±223%  +2.8e+99%       0.00 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.05 ±214%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00 ±223%     +14.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.03 ±209%     -65.1%       0.01 ±178%     -93.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00       +7.7e+100%       0.08 ±223%    +4e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.01 ±223%     +34.2%       0.01 ±223%     -50.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +3.5e+99%       0.00 ±147% +7.3e+100%       0.07 ±208%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±223%    -100.0%       0.00           -85.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
     10.17 ±181%     -97.0%       0.31 ±117%     -31.3%       6.98 ±217%  perf-sched.wait_time.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.11 ± 98%     -42.3%       0.07 ± 93%   +2291.9%       2.74 ±215%  perf-sched.wait_time.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      3.39 ±209%     -99.4%       0.02 ±151%     -99.5%       0.02 ±109%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.01 ±115%     -87.6%       0.12 ±152%     -96.9%       0.03 ± 99%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.03 ±223%     -90.0%       0.00 ±223%     -86.1%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.08 ±223%    -100.0%       0.00           -90.3%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +7.2e+101%       0.72 ±141% +1.2e+102%       1.23 ±220%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +3.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.00          -100.0%       0.00          +9e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.vma_expand.shift_arg_pages
      0.00          -100.0%       0.00        +8.2e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.vma_shrink.shift_arg_pages
      0.00          -100.0%       0.00          +3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__vm_munmap.elf_map.load_elf_binary
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__vm_munmap.elf_map.load_elf_interp
      0.01 ±223%    -100.0%       0.00           -64.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.alloc_bprm.do_execveat_common.isra
      0.64 ±214%    +726.3%       5.29 ± 84%   +1990.8%      13.38 ± 91%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±160%     -23.9%       0.01 ±223%     -58.2%       0.00 ±100%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.45 ±149%      -3.1%       0.43 ±178%     -92.1%       0.04 ± 95%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.01 ±172%    -100.0%       0.00         +1458.8%       0.13 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.20 ±223%     -91.5%       0.02 ±223%     -85.6%       0.03 ± 80%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.08 ±223%      -8.4%       0.08 ±205%     -95.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +9.3e+100%       0.09 ±200%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.22 ±118%     -89.6%       0.02 ±177%     -89.0%       0.02 ±212%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.61 ±156%    +334.9%       2.66 ±119%    +720.1%       5.01 ±171%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.06 ±115%     -85.0%       0.01 ±118%    +609.6%       0.42 ±187%  perf-sched.wait_time.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.03 ±135%     -77.4%       0.01 ±115%     +16.1%       0.04 ±162%  perf-sched.wait_time.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.03 ± 88%     -86.5%       0.00 ±223%     -31.8%       0.02 ±207%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
     13.95 ±174%     -99.8%       0.03 ±223%     -89.7%       1.44 ±192%  perf-sched.wait_time.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.07 ±148%   +1477.5%       1.09 ±107%   +4648.6%       3.28 ±143%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.01 ±165%     -56.8%       0.00 ±141%     +22.7%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.03 ±210%    -100.0%       0.00           -81.7%       0.01 ±156%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00          -100.0%       0.00       +2.3e+100%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_lookupat.filename_lookup
      0.07 ± 91%    +618.5%       0.50 ±116%     +18.9%       0.08 ± 86%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.09 ±223%     -98.2%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.02 ±204%     -30.1%       0.02 ±223%     -86.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
     48.25 ±207%     -97.9%       1.04 ±176%     -99.7%       0.13 ± 74%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.02 ±133%    +153.3%       0.05 ±160%    +310.7%       0.08 ±199%  perf-sched.wait_time.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.01 ±149%    +280.0%       0.05 ±146%    +821.3%       0.12 ±149%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.02 ±147%    -100.0%       0.00           -12.6%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
    230.47 ±111%    +145.6%     566.04 ± 48%    +210.6%     715.82 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00          -100.0%       0.00         +3e+101%       0.30 ±222%  perf-sched.wait_time.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.07 ±143%   +6025.4%       4.31 ±212%    +653.1%       0.53 ±189%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.02 ±130%     -91.4%       0.00 ±223%     -92.2%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.01 ±164%     -61.0%       0.01 ±223%     -22.0%       0.01 ± 83%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.03 ±103%   +4906.1%       1.50 ±206%     +79.4%       0.05 ±142%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00          -100.0%       0.00       +1.3e+102%       1.28 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_kernel.open_exec.load_elf_binary
      0.00       +9.8e+100%       0.10 ±223% +2.1e+100%       0.02 ±163%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.8e+100%       0.02 ±202%   +2e+100%       0.02 ±152%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.19 ±186%     -56.3%       0.08 ±166%    +409.9%       0.99 ±206%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.06 ±164%    -100.0%       0.00          +135.8%       0.13 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.79 ±223%     -98.5%       0.01 ±134%     -99.1%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_shrink
      0.00 ±223%  +15320.0%       0.26 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.03 ±136%     +23.4%       0.04 ±120%  +10517.7%       3.10 ±221%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      1.91 ±223%     -98.4%       0.03 ±125%     -96.5%       0.07 ±202%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.01 ±181%     -50.9%       0.00 ±142%     -20.8%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00         +1e+101%       0.10 ±195%  +5.2e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.00       +1.6e+100%       0.02 ±223%  +4.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.vm_brk_flags
      0.29 ±184%    +474.2%       1.66 ±219%    +104.5%       0.59 ±154%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.07 ±103%     +59.6%       0.11 ±188%     +17.4%       0.08 ±186%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00 ±223%    +911.1%       0.03 ±223%   +1522.2%       0.05 ±141%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.04 ±162%    -100.0%       0.00        +4.2e+05%     166.11 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      0.01 ±223%    -100.0%       0.00           -78.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00 ±223%    -100.0%       0.00          +353.8%       0.01 ±181%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      1720 ± 48%     +17.8%       2026 ± 56%      -6.8%       1603 ± 51%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     24.41 ±222%    -100.0%       0.00          -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00 ±223%   +4422.2%       0.07 ±223%   +1800.0%       0.03 ±195%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.11 ±184%    -100.0%       0.00           -99.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.75 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.00       +4.8e+100%       0.05 ±135% +1.7e+100%       0.02 ±143%  perf-sched.wait_time.max.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      0.00       +1.2e+102%       1.25 ±222% +3.1e+100%       0.03 ±141%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00          -100.0%       0.00        +4.5e+99%       0.00 ±158%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__perf_event_read_value.perf_read.vfs_read
      0.00        +2.3e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.fifo_open.do_dentry_open.do_open
      0.05 ±160%     -61.4%       0.02 ±144%      +7.5%       0.06 ±197%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.04 ±174%     -55.8%       0.02 ±142%     +94.4%       0.07 ±183%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
    368.87 ±222%      +2.4%     377.84 ±142%     -53.8%     170.38 ±221%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±223%     -75.7%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.00          -100.0%       0.00        +5.7e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
    167.98 ±223%     -99.6%       0.68 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_release.__fput.task_work_run
      0.00        +2.8e+99%       0.00 ±150% +3.6e+102%       3.61 ±179%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
    699.28 ± 77%     +26.6%     885.46 ± 24%     +28.2%     896.31 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±223%    -100.0%       0.00          +130.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_interruptible.bprm_execve.do_execveat_common.isra
      0.00          -100.0%       0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_interruptible.devkmsg_read.vfs_read.ksys_read
      0.17 ±130%     -41.2%       0.10 ±126%    +405.7%       0.87 ±219%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00       +1.4e+100%       0.01 ±115%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.dup_mm
      0.04 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.pick_link.step_into.open_last_lookups.path_openat
      1.49 ±149%    +558.5%       9.84 ±192%     +25.9%       1.88 ±201%  perf-sched.wait_time.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +300.0%       0.01 ±223%     -18.2%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.10 ±223%     -94.9%       0.01 ±223%     -98.7%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.14 ±139%     +27.1%       0.18 ±140%   +3057.6%       4.45 ±214%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.60 ± 79%     -96.8%       0.02 ±223%     -99.7%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
     94.91 ±222%    -100.0%       0.00          -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.35 ±208%     -98.8%       0.02 ±126%     -99.5%       0.01 ±108%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      2.33 ±221%     -99.4%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    252.54 ± 85%    +286.4%     975.72 ± 60%    +206.4%     773.71 ±106%  perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.01 ±223%    +233.3%       0.02 ±130%    +261.1%       0.02 ±163%  perf-sched.wait_time.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      0.08 ±107%   +7697.6%       6.46 ±196%  +10163.4%       8.50 ±152%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.09 ±219%     -92.1%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.03 ±113%    -100.0%       0.00           -94.2%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.30 ±172%     -98.5%       0.00 ±223%     -69.0%       0.09 ±149%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
     26.81 ±135%    +297.8%     106.66 ±110%    +486.2%     157.17 ±140%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    468.72 ±153%    +102.6%     949.49 ± 35%     +28.6%     602.88 ± 38%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      6.81 ±204%     +77.6%      12.09 ±197%     -77.7%       1.52 ±126%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.01 ±171%     -17.5%       0.01 ±223%    +407.9%       0.05 ± 73%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00 ±223%   +2270.0%       0.04 ±181%   +2670.0%       0.05 ±112%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.00          -100.0%       0.00       +2.5e+100%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.62 ±162%     -97.3%       0.02 ±112%     -94.8%       0.03 ±178%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.07 ±128%   +1241.1%       0.91 ±188%     -25.9%       0.05 ±112%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.04 ±142%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    202.89 ± 40%    +289.5%     790.27 ± 78%    +311.9%     835.74 ± 59%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.44 ±153%   +1010.9%      27.13 ±207%     -46.3%       1.31 ±153%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    871.93 ±188%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.54 ± 58%     +70.5%       0.93 ±208%    +226.1%       1.77 ±187%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.58 ± 54%  +29710.3%     472.44 ±215%    +116.4%       3.43 ±121%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    499.91 ±223%    +200.1%       1500 ± 63%      -0.0%     499.84 ±152%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    681.31 ±219%    -100.0%       0.00           -99.8%       1.51 ±141%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+104%     500.46 ±223% +1.7e+105%       1669 ± 56%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1786 ± 29%     +19.9%       2142 ± 58%     +13.8%       2032 ± 41%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2454 ± 39%      -7.2%       2278 ± 33%     -40.1%       1470 ± 34%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     75.78 ±124%     -95.2%       3.65 ±115%      -6.4%      70.95 ±210%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    726.73 ±109%     +37.9%       1002 ± 43%     +45.6%       1058 ± 46%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    282.70 ±186%     -25.1%     211.85 ± 84%      +1.9%     287.99 ± 92%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    987.23 ± 61%     +85.7%       1833 ± 37%     +67.6%       1654 ± 45%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3295 ± 12%     +14.8%       3784 ± 35%     -15.6%       2780 ± 42%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     83.31 ±163%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2513 ± 26%     -36.6%       1594 ± 21%     -33.8%       1663 ± 19%  perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork
      4058 ± 14%     -15.8%       3417 ± 14%     +12.7%       4575 ± 29%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      8.16 ±121%   +4455.6%     371.66 ± 50%   +2758.1%     233.17 ± 56%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      2399 ± 67%      -9.6%       2170 ± 31%     -37.4%       1502 ±107%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1368 ±139%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      3184 ± 45%     -52.9%       1500 ± 47%     -56.2%       1393 ± 65%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.09 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
    319.62 ±155%    -100.0%       0.02 ±223%    -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.03 ±107%    -100.0%       0.00          +169.1%       0.08 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      5.35 ±211%     -94.0%       0.32 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
    114.11 ±143%     -98.6%       1.63 ± 97%     -98.9%       1.28 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.06 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
     14.55 ± 59%    +100.1%      29.12 ± 56%   +7538.2%       1111 ±151%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2604 ± 65%     +12.9%       2940 ± 31%     +19.3%       3107 ± 41%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ±220%   +1222.8%       0.43 ±223%   +4114.7%       1.38 ±141%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2189 ± 37%     -41.0%       1292 ± 49%     -54.6%     994.47 ± 77%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1030 ± 17%    +114.8%       2214 ± 17%    +103.5%       2097 ± 24%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3116 ± 16%     +13.1%       3525 ± 32%      -4.7%       2968 ± 38%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4790 ±  2%     +20.4%       5765 ± 20%     +28.4%       6153 ± 16%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      3962 ±  3%    -100.0%       1.16 ±154%    -100.0%       1.46 ±109%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.81 ±152%    +327.0%       7.73 ± 79%    +338.4%       7.94 ±104%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      4480 ±  3%     +34.7%       6033 ± 21%     +28.5%       5758 ± 16%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork
--AcJ7fDBZ8OE2OUNP
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="hackbench-6ba0286048431-ICL-Platinum-8358"
Content-Transfer-Encoding: 8bit

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp6/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
 4.883e+08 ±  5%      -5.4%  4.621e+08 ±  3%      -7.2%  4.531e+08 ±  2%  cpuidle..time
   4168912 ±  4%      -7.0%    3877247 ±  7%     -10.3%    3737609 ±  4%  cpuidle..usage
    182.32 ±  3%      +6.7%     194.55 ±  8%     +14.1%     208.03 ± 11%  uptime.boot
      5404 ± 13%      +8.4%       5859 ± 29%     +34.0%       7241 ± 34%  uptime.idle
     43.13 ± 15%     +10.9%      47.82 ± 31%     +41.0%      60.81 ± 38%  boot-time.boot
     29.24 ± 21%     +15.9%      33.89 ± 44%     +60.7%      46.98 ± 49%  boot-time.dhcp
      4718 ± 15%     +11.2%       5247 ± 32%     +40.9%       6646 ± 37%  boot-time.idle
      3.23 ± 41%     +29.7%       4.18 ± 75%    +114.7%       6.93 ± 69%  boot-time.smp_boot
     12760 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-c2c.DRAM.local
      2596 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-c2c.DRAM.remote
     25909 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-c2c.HITM.local
    256.83 ± 72%    -100.0%       0.00          -100.0%       0.00        perf-c2c.HITM.remote
     26166 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-c2c.HITM.total
      2.55 ± 11%      -0.2        2.33 ± 12%      -0.2        2.32 ±  9%  mpstat.cpu.all.idle%
      0.00 ±223%      -0.0        0.00            -0.0        0.00        mpstat.cpu.all.iowait%
      1.45            -0.3        1.19            -0.3        1.19        mpstat.cpu.all.irq%
      0.04            -0.0        0.04 ±  2%      -0.0        0.04 ±  3%  mpstat.cpu.all.soft%
     91.38            +1.0       92.36            +1.0       92.37        mpstat.cpu.all.sys%
      4.57            -0.5        4.09            -0.5        4.09        mpstat.cpu.all.usr%
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
   1085826 ± 28%     -30.4%     755552 ± 18%     -31.8%     740726 ± 22%  numa-numastat.node0.local_node
   1147403 ± 27%     -29.2%     811989 ± 19%     -27.8%     828444 ± 17%  numa-numastat.node0.numa_hit
     61576 ± 72%      -8.3%      56440 ± 50%     +42.5%      87718 ± 41%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
   1340399 ± 21%      +2.6%    1375519 ± 13%      +4.1%    1395446 ± 16%  numa-numastat.node1.local_node
   1413908 ± 22%      +2.8%    1454068 ± 13%      +2.0%    1442762 ± 14%  numa-numastat.node1.numa_hit
     73509 ± 60%      +6.9%      78548 ± 36%     -35.6%      47315 ± 76%  numa-numastat.node1.other_node
      3.17 ± 11%      -5.3%       3.00            -5.3%       3.00        vmstat.cpu.id
     90.83            +1.1%      91.83            +1.3%      92.00        vmstat.cpu.sy
      4.00            -4.2%       3.83 ±  9%     -10.0%       3.60 ± 13%  vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        vmstat.io.bi
      4.00            +0.0%       4.00            +0.0%       4.00        vmstat.memory.buff
   5537857 ± 17%     -13.9%    4769628 ±  7%     -13.4%    4794497 ± 12%  vmstat.memory.cache
 1.229e+08            +0.8%   1.24e+08            +0.8%   1.24e+08        vmstat.memory.free
      1703            +4.6%       1781            +4.2%       1774        vmstat.procs.r
   3116201            -8.8%    2842098            -8.9%    2837431        vmstat.system.cs
    545942           -10.1%     490601           -10.2%     490063        vmstat.system.in
    135.84            +5.9%     143.80            +6.3%     144.38        time.elapsed_time
    135.84            +5.9%     143.80            +6.3%     144.38        time.elapsed_time.max
  96130402            -6.0%   90340310            -5.7%   90612319        time.involuntary_context_switches
      9128 ±  3%      -6.5%       8538 ±  5%      -7.4%       8455 ±  5%  time.major_page_faults
      2048            +0.0%       2048            +0.0%       2048        time.maximum_resident_set_size
    533978            +1.6%     542323            +1.0%     539552        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        time.page_size
     12350            +0.6%      12424            +0.6%      12429        time.percent_of_cpu_this_job_got
     16030            +7.0%      17152            +7.5%      17226        time.system_time
    747.92            -4.3%     715.77            -3.7%     720.55        time.user_time
 3.329e+08            -3.1%  3.227e+08            -2.7%   3.24e+08        time.voluntary_context_switches
    455347            -5.9%     428458            -6.4%     426221        hackbench.throughput
    447699            -5.7%     422187            -6.1%     420499        hackbench.throughput_avg
    455347            -5.9%     428458            -6.4%     426221        hackbench.throughput_best
    442776            -6.2%     415425            -6.5%     414117        hackbench.throughput_worst
    135.84            +5.9%     143.80            +6.3%     144.38        hackbench.time.elapsed_time
    135.84            +5.9%     143.80            +6.3%     144.38        hackbench.time.elapsed_time.max
  96130402            -6.0%   90340310            -5.7%   90612319        hackbench.time.involuntary_context_switches
      9128 ±  3%      -6.5%       8538 ±  5%      -7.4%       8455 ±  5%  hackbench.time.major_page_faults
      2048            +0.0%       2048            +0.0%       2048        hackbench.time.maximum_resident_set_size
    533978            +1.6%     542323            +1.0%     539552        hackbench.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        hackbench.time.page_size
     12350            +0.6%      12424            +0.6%      12429        hackbench.time.percent_of_cpu_this_job_got
     16030            +7.0%      17152            +7.5%      17226        hackbench.time.system_time
    747.92            -4.3%     715.77            -3.7%     720.55        hackbench.time.user_time
 3.329e+08            -3.1%  3.227e+08            -2.7%   3.24e+08        hackbench.time.voluntary_context_switches
      3145            -1.2%       3106            -1.2%       3108        turbostat.Avg_MHz
     97.44            +0.3       97.79            +0.4       97.89        turbostat.Busy%
      3233            -1.7%       3178            -1.7%       3178        turbostat.Bzy_MHz
   1505999 ±  7%      +1.9%    1534366 ±  6%      +7.8%    1624128 ±  5%  turbostat.C1
      0.06 ±  8%      -0.0        0.05 ±  7%      -0.0        0.06 ±  8%  turbostat.C1%
   2100474 ±  9%     -16.9%    1746544 ± 17%     -26.8%    1537922 ±  7%  turbostat.C1E
      0.44 ±  9%      -0.1        0.37 ± 13%      -0.1        0.33 ±  5%  turbostat.C1E%
    367921 ±  8%      -3.5%     354919 ±  3%      -6.6%     343515 ±  3%  turbostat.C6
      2.10 ± 10%      -0.3        1.84 ±  2%      -0.3        1.76 ±  3%  turbostat.C6%
      0.68 ±  8%     -16.5%       0.56 ±  8%     -22.4%       0.52 ±  5%  turbostat.CPU%c1
      1.88 ± 11%     -12.4%       1.65 ±  2%     -15.7%       1.59 ±  3%  turbostat.CPU%c6
     77.00 ±  2%      -1.7%      75.67 ±  2%      -1.8%      75.60 ±  2%  turbostat.CoreTmp
      0.20            -4.2%       0.19            -5.0%       0.19        turbostat.IPC
  75882286            -5.2%   71943143            -4.8%   72233496        turbostat.IRQ
    113.11           +12.9      125.98           +12.3      125.45        turbostat.PKG_%
    135641 ± 21%     +30.5%     177014 ±  5%     +21.0%     164086 ± 17%  turbostat.POLL
     77.17            -1.9%      75.67            -1.5%      76.00 ±  2%  turbostat.PkgTmp
    494.12            +0.2%     495.33            +0.3%     495.45        turbostat.PkgWatt
    190.13            -1.3%     187.64           +10.1%     209.34        turbostat.RAMWatt
      0.00          -100.0%       0.00       +7.7e+104%     768.00        turbostat.SMI
      2595            +0.1%       2598            +0.1%       2598        turbostat.TSC_MHz
    203822 ± 60%    +198.6%     608701 ± 59%    +159.4%     528680 ± 65%  meminfo.Active
    203699 ± 60%    +198.8%     608573 ± 59%    +159.5%     528552 ± 65%  meminfo.Active(anon)
    122.67 ±  6%      +4.3%     128.00            +4.3%     128.00        meminfo.Active(file)
    129988 ±  4%      +1.1%     131399 ±  7%      +1.7%     132207 ±  5%  meminfo.AnonHugePages
    732895 ±  6%     -13.2%     636185 ±  7%     -12.6%     640678 ±  8%  meminfo.AnonPages
      4.00            +0.0%       4.00            +0.0%       4.00        meminfo.Buffers
   5381820 ± 17%     -14.1%    4624610 ±  8%     -13.7%    4646965 ± 12%  meminfo.Cached
  65831196            +0.0%   65831196            +0.0%   65831196        meminfo.CommitLimit
   5362198 ± 18%     -16.1%    4499421 ±  9%     -15.5%    4530443 ± 14%  meminfo.Committed_AS
 1.183e+09            +0.1%  1.184e+09            +0.1%  1.183e+09        meminfo.DirectMap1G
   9787415 ±  8%     -11.3%    8685935 ± 16%      -7.2%    9087064 ±  9%  meminfo.DirectMap2M
    548191 ± 27%     -22.2%     426331 ± 18%     -18.9%     444633 ± 11%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
   3239938 ± 32%     -38.8%    1981395 ± 38%     -35.5%    2088664 ± 46%  meminfo.Inactive
   3239758 ± 32%     -38.8%    1981215 ± 38%     -35.5%    2088484 ± 46%  meminfo.Inactive(anon)
    179.83            -0.3%     179.33            -0.2%     179.40        meminfo.Inactive(file)
    144522            -3.0%     140240            -3.0%     140145        meminfo.KReclaimable
    100281            +0.8%     101035            +1.2%     101437        meminfo.KernelStack
   1431490 ± 19%     -37.0%     902508 ± 44%     -33.2%     956103 ± 53%  meminfo.Mapped
 1.224e+08            +0.8%  1.234e+08            +0.8%  1.234e+08        meminfo.MemAvailable
  1.23e+08            +0.8%   1.24e+08            +0.8%   1.24e+08        meminfo.MemFree
 1.317e+08            +0.0%  1.317e+08            +0.0%  1.317e+08        meminfo.MemTotal
   8711265 ± 11%     -11.9%    7677995 ±  6%     -11.5%    7709567 ±  9%  meminfo.Memused
    163279            +3.0%     168167 ±  3%      +0.4%     163900 ±  2%  meminfo.PageTables
     90680            -0.6%      90152            -0.4%      90300        meminfo.Percpu
    144522            -3.0%     140240            -3.0%     140145        meminfo.SReclaimable
    631442            -0.3%     629626            -0.3%     629408        meminfo.SUnreclaim
   2711151 ± 35%     -27.9%    1953938 ± 19%     -27.1%    1976247 ± 29%  meminfo.Shmem
    775965            -0.8%     769867            -0.8%     769554        meminfo.Slab
   2670369            -0.0%    2670368            +0.0%    2670412        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    240469            +0.3%     241248            +0.5%     241622        meminfo.VmallocUsed
   8868864 ± 11%      -9.8%    8003021 ±  4%      -9.4%    8031013 ±  7%  meminfo.max_used_kB
     60623 ± 25%      -2.1%      59353 ±125%      +2.7%      62287 ±113%  numa-meminfo.node0.Active
     60540 ± 25%      -2.1%      59289 ±125%      +2.7%      62191 ±113%  numa-meminfo.node0.Active(anon)
     82.67 ± 71%     -22.6%      64.00 ±100%     +16.1%      96.00 ± 51%  numa-meminfo.node0.Active(file)
     45512 ± 55%     +35.2%      61514 ± 63%     +10.9%      50486 ± 64%  numa-meminfo.node0.AnonHugePages
    347594 ± 18%      -3.2%     336335 ± 20%     -10.0%     312751 ± 27%  numa-meminfo.node0.AnonPages
    562165 ± 18%      -2.8%     546504 ± 14%      -7.8%     518572 ± 11%  numa-meminfo.node0.AnonPages.max
   2860089 ± 57%     -35.3%    1851652 ± 58%     -21.4%    2247443 ± 37%  numa-meminfo.node0.FilePages
   1360379 ± 72%     -71.3%     389808 ± 23%     -71.3%     389917 ± 31%  numa-meminfo.node0.Inactive
   1360266 ± 72%     -71.3%     389718 ± 23%     -71.3%     389802 ± 31%  numa-meminfo.node0.Inactive(anon)
    113.33 ± 71%     -21.0%      89.50 ±100%      +0.8%     114.20 ± 66%  numa-meminfo.node0.Inactive(file)
     73362 ± 31%     -11.2%      65115 ± 38%      +3.0%      75576 ± 26%  numa-meminfo.node0.KReclaimable
     56758 ± 24%     -10.3%      50908 ± 49%      -3.7%      54664 ± 57%  numa-meminfo.node0.KernelStack
    402969 ± 74%     -57.7%     170527 ± 31%     -55.8%     177978 ± 31%  numa-meminfo.node0.Mapped
  61175514 ±  2%      +1.9%   62343890 ±  2%      +1.3%   61957100        numa-meminfo.node0.MemFree
  65658096            +0.0%   65658096            +0.0%   65658096        numa-meminfo.node0.MemTotal
   4482580 ± 36%     -26.1%    3314204 ± 39%     -17.4%    3700994 ± 25%  numa-meminfo.node0.MemUsed
     94097 ± 30%     -12.6%      82238 ± 61%      -6.9%      87559 ± 70%  numa-meminfo.node0.PageTables
     73362 ± 31%     -11.2%      65115 ± 38%      +3.0%      75576 ± 26%  numa-meminfo.node0.SReclaimable
    335026 ±  9%      -6.1%     314466 ± 23%     -12.5%     293093 ± 25%  numa-meminfo.node0.SUnreclaim
   1073509 ± 95%     -89.5%     113005 ±102%     -87.0%     139594 ±116%  numa-meminfo.node0.Shmem
    408389 ±  8%      -7.1%     379582 ± 24%      -9.7%     368670 ± 23%  numa-meminfo.node0.Slab
   1786383 ± 65%      -2.7%    1738492 ± 66%     +18.0%    2107638 ± 47%  numa-meminfo.node0.Unevictable
    140001 ± 92%    +293.9%     551466 ± 63%    +232.9%     466032 ± 69%  numa-meminfo.node1.Active
    139961 ± 92%    +294.0%     551402 ± 63%    +232.9%     466000 ± 69%  numa-meminfo.node1.Active(anon)
     40.00 ±141%     +60.0%      64.00 ±100%     -20.0%      32.00 ±154%  numa-meminfo.node1.Active(file)
     84393 ± 31%     -17.1%      69966 ± 52%      -3.2%      81728 ± 42%  numa-meminfo.node1.AnonHugePages
    385861 ± 17%     -22.2%     300225 ± 18%     -15.1%     327615 ± 15%  numa-meminfo.node1.AnonPages
    602132 ± 20%     -26.7%     441431 ± 14%     -24.1%     457230 ± 21%  numa-meminfo.node1.AnonPages.max
   2518083 ± 53%     +10.2%    2774346 ± 32%      -4.8%    2397835 ± 41%  numa-meminfo.node1.FilePages
   1879643 ± 44%     -15.3%    1591222 ± 46%      -9.7%    1697090 ± 54%  numa-meminfo.node1.Inactive
   1879576 ± 44%     -15.3%    1591132 ± 46%      -9.7%    1697025 ± 54%  numa-meminfo.node1.Inactive(anon)
     66.50 ±121%     +35.1%      89.83 ±100%      -2.0%      65.20 ±115%  numa-meminfo.node1.Inactive(file)
     71159 ± 31%      +5.6%      75179 ± 32%      -9.2%      64617 ± 30%  numa-meminfo.node1.KReclaimable
     43384 ± 32%     +15.6%      50135 ± 50%      +8.2%      46938 ± 66%  numa-meminfo.node1.KernelStack
   1030705 ± 33%     -29.1%     730755 ± 47%     -24.6%     777182 ± 58%  numa-meminfo.node1.Mapped
  61778303 ±  2%      -0.2%   61639504            +0.4%   61997485        numa-meminfo.node1.MemFree
  66004296            +0.0%   66004296            +0.0%   66004296        numa-meminfo.node1.MemTotal
   4225992 ± 31%      +3.3%    4364790 ± 24%      -5.2%    4006809 ± 26%  numa-meminfo.node1.MemUsed
     68727 ± 43%     +24.9%      85871 ± 62%     +11.5%      76658 ± 83%  numa-meminfo.node1.PageTables
     71159 ± 31%      +5.6%      75179 ± 32%      -9.2%      64617 ± 30%  numa-meminfo.node1.SReclaimable
    295876 ± 11%      +6.2%     314174 ± 23%     +13.8%     336703 ± 21%  numa-meminfo.node1.SUnreclaim
   1633990 ± 51%     +12.7%    1842316 ± 24%     +12.3%    1834963 ± 34%  numa-meminfo.node1.Shmem
    367037 ± 10%      +6.1%     389355 ± 23%      +9.3%     401321 ± 21%  numa-meminfo.node1.Slab
    883984 ±133%      +5.4%     931875 ±123%     -36.3%     562774 ±177%  numa-meminfo.node1.Unevictable
     15178 ± 25%      -1.6%      14941 ±126%      +2.9%      15623 ±113%  numa-vmstat.node0.nr_active_anon
     20.67 ± 71%     -22.6%      16.00 ±100%     +16.1%      24.00 ± 51%  numa-vmstat.node0.nr_active_file
     86797 ± 18%      -3.2%      84015 ± 20%     -10.0%      78094 ± 27%  numa-vmstat.node0.nr_anon_pages
     21.67 ± 56%     +36.2%      29.50 ± 64%     +11.7%      24.20 ± 65%  numa-vmstat.node0.nr_anon_transparent_hugepages
    715313 ± 57%     -35.3%     463017 ± 58%     -21.4%     562039 ± 37%  numa-vmstat.node0.nr_file_pages
  15293765 ±  2%      +1.9%   15585702 ±  2%      +1.3%   15489544        numa-vmstat.node0.nr_free_pages
    340214 ± 72%     -71.4%      97344 ± 23%     -71.4%      97460 ± 31%  numa-vmstat.node0.nr_inactive_anon
     28.33 ± 71%     -22.4%      22.00 ±100%      +0.2%      28.40 ± 65%  numa-vmstat.node0.nr_inactive_file
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.nr_isolated_anon
     56711 ± 24%      -9.9%      51083 ± 49%      -4.0%      54431 ± 57%  numa-vmstat.node0.nr_kernel_stack
    101165 ± 74%     -57.9%      42574 ± 31%     -55.9%      44622 ± 31%  numa-vmstat.node0.nr_mapped
     23535 ± 30%     -12.3%      20638 ± 60%      -7.5%      21771 ± 70%  numa-vmstat.node0.nr_page_table_pages
    268668 ± 95%     -89.4%      28355 ±102%     -86.9%      35077 ±116%  numa-vmstat.node0.nr_shmem
     18343 ± 31%     -11.2%      16281 ± 38%      +3.0%      18888 ± 26%  numa-vmstat.node0.nr_slab_reclaimable
     83852 ±  9%      -6.1%      78700 ± 23%     -12.9%      73007 ± 25%  numa-vmstat.node0.nr_slab_unreclaimable
    446595 ± 65%      -2.7%     434622 ± 66%     +18.0%     526908 ± 47%  numa-vmstat.node0.nr_unevictable
     15178 ± 25%      -1.6%      14941 ±126%      +2.9%      15623 ±113%  numa-vmstat.node0.nr_zone_active_anon
     20.67 ± 71%     -22.6%      16.00 ±100%     +16.1%      24.00 ± 51%  numa-vmstat.node0.nr_zone_active_file
    340213 ± 72%     -71.4%      97343 ± 23%     -71.4%      97460 ± 31%  numa-vmstat.node0.nr_zone_inactive_anon
     28.33 ± 71%     -22.4%      22.00 ±100%      +0.2%      28.40 ± 65%  numa-vmstat.node0.nr_zone_inactive_file
    446595 ± 65%      -2.7%     434622 ± 66%     +18.0%     526908 ± 47%  numa-vmstat.node0.nr_zone_unevictable
   1146748 ± 27%     -29.2%     812051 ± 19%     -27.8%     828190 ± 17%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
   1085171 ± 28%     -30.4%     755614 ± 18%     -31.8%     740472 ± 22%  numa-vmstat.node0.numa_local
     61576 ± 72%      -8.3%      56440 ± 50%     +42.5%      87718 ± 41%  numa-vmstat.node0.numa_other
     35413 ± 93%    +290.3%     138215 ± 63%    +230.2%     116928 ± 69%  numa-vmstat.node1.nr_active_anon
     10.00 ±141%     +60.0%      16.00 ±100%     -20.0%       8.00 ±154%  numa-vmstat.node1.nr_active_file
     96435 ± 16%     -22.3%      74970 ± 18%     -15.1%      81903 ± 15%  numa-vmstat.node1.nr_anon_pages
     40.50 ± 32%     -16.5%      33.83 ± 52%      -2.7%      39.40 ± 43%  numa-vmstat.node1.nr_anon_transparent_hugepages
    629218 ± 53%     +10.2%     693354 ± 32%      -4.5%     600864 ± 41%  numa-vmstat.node1.nr_file_pages
  15444792 ±  2%      -0.2%   15410531            +0.3%   15498432        numa-vmstat.node1.nr_free_pages
    469139 ± 44%     -15.4%     397102 ± 46%      -9.4%     425233 ± 55%  numa-vmstat.node1.nr_inactive_anon
     16.50 ±122%     +35.4%      22.33 ±100%      -3.0%      16.00 ±117%  numa-vmstat.node1.nr_inactive_file
      0.00          -100.0%       0.00         +4e+101%       0.40 ±200%  numa-vmstat.node1.nr_isolated_anon
     43466 ± 32%     +15.0%      49968 ± 50%      +7.4%      46698 ± 66%  numa-vmstat.node1.nr_kernel_stack
    257002 ± 33%     -29.0%     182356 ± 48%     -24.3%     194531 ± 58%  numa-vmstat.node1.nr_mapped
     17235 ± 43%     +24.1%      21392 ± 62%     +10.5%      19038 ± 83%  numa-vmstat.node1.nr_page_table_pages
    408195 ± 51%     +12.8%     460346 ± 24%     +12.7%     460146 ± 34%  numa-vmstat.node1.nr_shmem
     17777 ± 31%      +5.6%      18781 ± 32%      -9.1%      16152 ± 30%  numa-vmstat.node1.nr_slab_reclaimable
     74091 ± 11%      +5.9%      78480 ± 23%     +13.2%      83885 ± 21%  numa-vmstat.node1.nr_slab_unreclaimable
    220995 ±133%      +5.4%     232968 ±123%     -36.3%     140693 ±177%  numa-vmstat.node1.nr_unevictable
     35413 ± 93%    +290.3%     138214 ± 63%    +230.2%     116928 ± 69%  numa-vmstat.node1.nr_zone_active_anon
     10.00 ±141%     +60.0%      16.00 ±100%     -20.0%       8.00 ±154%  numa-vmstat.node1.nr_zone_active_file
    469139 ± 44%     -15.4%     397102 ± 46%      -9.4%     425232 ± 55%  numa-vmstat.node1.nr_zone_inactive_anon
     16.50 ±122%     +35.4%      22.33 ±100%      -3.0%      16.00 ±117%  numa-vmstat.node1.nr_zone_inactive_file
    220995 ±133%      +5.4%     232968 ±123%     -36.3%     140693 ±177%  numa-vmstat.node1.nr_zone_unevictable
   1413178 ± 22%      +2.9%    1454049 ± 13%      +2.1%    1442346 ± 14%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
   1339669 ± 21%      +2.7%    1375501 ± 13%      +4.1%    1395031 ± 17%  numa-vmstat.node1.numa_local
     73509 ± 60%      +6.9%      78548 ± 36%     -35.6%      47315 ± 76%  numa-vmstat.node1.numa_other
    247.83 ± 30%     -23.3%     190.17 ± 20%     -20.8%     196.40 ± 12%  proc-vmstat.direct_map_level2_splits
      2.17 ± 31%      +7.7%       2.33 ± 40%      -7.7%       2.00 ± 31%  proc-vmstat.direct_map_level3_splits
     51157 ± 60%    +197.2%     152043 ± 59%    +159.9%     132968 ± 65%  proc-vmstat.nr_active_anon
     30.67 ±  6%      +4.3%      32.00            +4.3%      32.00        proc-vmstat.nr_active_file
    183216 ±  6%     -13.1%     159176 ±  7%     -12.7%     160025 ±  8%  proc-vmstat.nr_anon_pages
     63.17 ±  3%      +0.5%      63.50 ±  7%      +1.6%      64.20 ±  5%  proc-vmstat.nr_anon_transparent_hugepages
   3053894            +0.8%    3079629            +0.8%    3078887        proc-vmstat.nr_dirty_background_threshold
   6115256            +0.8%    6166789            +0.8%    6165304        proc-vmstat.nr_dirty_threshold
   1345673 ± 17%     -14.1%    1156027 ±  8%     -13.7%    1161982 ± 12%  proc-vmstat.nr_file_pages
  30737847            +0.8%   30995577            +0.8%   30988148        proc-vmstat.nr_free_pages
    809915 ± 32%     -38.8%     495403 ± 38%     -35.6%     521385 ± 46%  proc-vmstat.nr_inactive_anon
     44.83            -1.1%      44.33            -1.0%      44.40        proc-vmstat.nr_inactive_file
      0.67 ±141%     +50.0%       1.00 ±141%    -100.0%       0.00        proc-vmstat.nr_isolated_anon
    100262            +0.8%     101078            +1.3%     101605        proc-vmstat.nr_kernel_stack
    358287 ± 19%     -36.9%     225932 ± 44%     -33.5%     238169 ± 53%  proc-vmstat.nr_mapped
     40823            +3.0%      42029 ±  3%      +0.5%      41046        proc-vmstat.nr_page_table_pages
    678005 ± 35%     -28.0%     488357 ± 19%     -27.1%     494301 ± 30%  proc-vmstat.nr_shmem
     36123            -2.9%      35063            -3.0%      35046        proc-vmstat.nr_slab_reclaimable
    157786            -0.4%     157232            -0.3%     157330        proc-vmstat.nr_slab_unreclaimable
    667592            -0.0%     667591            +0.0%     667602        proc-vmstat.nr_unevictable
     51157 ± 60%    +197.2%     152043 ± 59%    +159.9%     132968 ± 65%  proc-vmstat.nr_zone_active_anon
     30.67 ±  6%      +4.3%      32.00            +4.3%      32.00        proc-vmstat.nr_zone_active_file
    809915 ± 32%     -38.8%     495403 ± 38%     -35.6%     521385 ± 46%  proc-vmstat.nr_zone_inactive_anon
     44.83            -1.1%      44.33            -1.0%      44.40        proc-vmstat.nr_zone_inactive_file
    667592            -0.0%     667591            +0.0%     667602        proc-vmstat.nr_zone_unevictable
    245710 ± 20%     -22.5%     190365 ± 20%     -24.6%     185160 ± 14%  proc-vmstat.numa_hint_faults
    173866 ± 13%     -24.8%     130734 ± 36%     -21.2%     136965 ± 20%  proc-vmstat.numa_hint_faults_local
   2564578 ± 14%     -11.5%    2268893 ±  4%     -11.5%    2270676 ±  9%  proc-vmstat.numa_hit
     52.00 ±103%     -57.4%      22.17 ± 35%      +5.8%      55.00 ±122%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   2429492 ± 14%     -12.2%    2133272 ±  4%     -12.1%    2135643 ±  9%  proc-vmstat.numa_local
    135086            -0.1%     134989            -0.0%     135033        proc-vmstat.numa_other
     42910 ± 55%     -41.8%      24988 ± 29%     -46.9%      22803 ± 55%  proc-vmstat.numa_pages_migrated
    481291 ± 12%     -15.2%     408307 ± 11%     -11.5%     425774 ±  8%  proc-vmstat.numa_pte_updates
    168803 ± 84%    +132.6%     392645 ± 59%     +92.7%     325216 ± 67%  proc-vmstat.pgactivate
   3197394 ± 11%     -10.5%    2860892 ±  4%     -10.4%    2865154 ±  6%  proc-vmstat.pgalloc_normal
   1648445 ±  6%      -7.0%    1533339 ±  2%      -7.8%    1520590 ±  2%  proc-vmstat.pgfault
   2016126 ±  3%      +2.2%    2059688 ±  5%      +0.7%    2029790 ±  5%  proc-vmstat.pgfree
     42910 ± 55%     -41.8%      24988 ± 29%     -46.9%      22803 ± 55%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgpgin
    113635 ± 23%     -16.4%      95027 ±  5%     -18.4%      92750 ±  4%  proc-vmstat.pgreuse
     92.83 ±  3%      -2.0%      91.00 ± 10%      +0.6%      93.40 ±  6%  proc-vmstat.thp_collapse_alloc
      0.00       +1.7e+101%       0.17 ±223%   +6e+101%       0.60 ±133%  proc-vmstat.thp_deferred_split_page
     24.00            +2.1%      24.50 ±  3%      +2.5%      24.60 ±  3%  proc-vmstat.thp_fault_alloc
     11.17 ± 68%     -32.8%       7.50 ± 62%      -8.7%      10.20 ±122%  proc-vmstat.thp_migration_success
      0.00       +1.7e+101%       0.17 ±223%   +6e+101%       0.60 ±133%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     21.17            -0.8%      21.00            +0.2%      21.20        proc-vmstat.unevictable_pgs_culled
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.unevictable_pgs_rescued
   1127680            +4.7%    1180672            +4.9%    1183027        proc-vmstat.unevictable_pgs_scanned
      7.62            +0.2%       7.63            -0.1%       7.61        perf-stat.i.MPKI
  4.48e+10            -3.4%  4.327e+10            -3.9%  4.305e+10        perf-stat.i.branch-instructions
      0.45            +0.0        0.47            +0.0        0.47        perf-stat.i.branch-miss-rate%
 1.988e+08            +1.5%  2.017e+08            +1.3%  2.013e+08        perf-stat.i.branch-misses
     21.55            -1.2       20.32            -1.2       20.34        perf-stat.i.cache-miss-rate%
 3.953e+08            -9.5%  3.578e+08           -10.1%  3.552e+08        perf-stat.i.cache-misses
 1.815e+09            -3.8%  1.746e+09            -4.5%  1.733e+09        perf-stat.i.cache-references
   3161372           -10.9%    2817844           -10.1%    2842314        perf-stat.i.context-switches
      1.69            +2.7%       1.73            +3.2%       1.74        perf-stat.i.cpi
    128264            -0.1%     128173            -0.1%     128139        perf-stat.i.cpu-clock
 4.023e+11            -1.4%  3.967e+11            -1.4%  3.967e+11        perf-stat.i.cpu-cycles
    365627 ±  2%      -9.7%     330317            -9.7%     330336        perf-stat.i.cpu-migrations
      1139 ±  2%      +8.4%       1235           +11.2%       1267 ±  3%  perf-stat.i.cycles-between-cache-misses
      0.04 ± 16%      +0.0        0.04 ± 11%      +0.0        0.04 ±  5%  perf-stat.i.dTLB-load-miss-rate%
  24803278 ± 15%      -2.3%   24226955 ± 11%      +5.0%   26048000 ±  5%  perf-stat.i.dTLB-load-misses
 6.569e+10            -4.0%  6.305e+10            -4.5%  6.276e+10        perf-stat.i.dTLB-loads
      0.01 ± 37%      -0.0        0.01 ± 20%      +0.0        0.01 ± 20%  perf-stat.i.dTLB-store-miss-rate%
   4003244 ± 37%     -15.3%    3389687 ± 21%      +4.3%    4176789 ± 20%  perf-stat.i.dTLB-store-misses
 4.057e+10            -5.3%  3.841e+10            -5.8%  3.822e+10        perf-stat.i.dTLB-stores
 2.408e+11            -3.9%  2.314e+11            -4.3%  2.303e+11        perf-stat.i.instructions
      0.60            -2.6%       0.58            -3.1%       0.58        perf-stat.i.ipc
     78.56 ±  3%     -14.6%      67.11 ±  5%     -15.8%      66.16 ±  6%  perf-stat.i.major-faults
      3.14            -1.4%       3.10            -1.4%       3.10        perf-stat.i.metric.GHz
      1598           -10.7%       1427           -10.6%       1429        perf-stat.i.metric.K/sec
      1194            -4.2%       1144            -4.6%       1138        perf-stat.i.metric.M/sec
     10973 ±  7%     -15.5%       9275 ±  3%     -16.4%       9178 ±  2%  perf-stat.i.minor-faults
     26.75            +0.0       26.78            -0.1       26.65        perf-stat.i.node-load-miss-rate%
  30953814            -4.8%   29470176            -6.2%   29042619        perf-stat.i.node-load-misses
  94854027            -8.2%   87086579            -8.6%   86690715        perf-stat.i.node-loads
     10.12            +1.0       11.14 ±  2%      +0.9       11.05        perf-stat.i.node-store-miss-rate%
   6830990            -6.0%    6417970            -7.3%    6333380        perf-stat.i.node-store-misses
  67140443           -17.8%   55222136           -18.4%   54762093        perf-stat.i.node-stores
     11052 ±  7%     -15.5%       9343 ±  3%     -16.4%       9244 ±  2%  perf-stat.i.page-faults
    128264            -0.1%     128173            -0.1%     128139        perf-stat.i.task-clock
      7.54            -0.1%       7.53            -0.4%       7.51        perf-stat.overall.MPKI
      0.44            +0.0        0.47            +0.0        0.47        perf-stat.overall.branch-miss-rate%
     21.83            -1.3       20.52            -1.3       20.52        perf-stat.overall.cache-miss-rate%
      1.67            +2.5%       1.71            +3.0%       1.72        perf-stat.overall.cpi
      1015            +9.2%       1109           +10.1%       1117        perf-stat.overall.cycles-between-cache-misses
      0.04 ± 16%      +0.0        0.04 ± 11%      +0.0        0.04 ±  5%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ± 38%      -0.0        0.01 ± 20%      +0.0        0.01 ± 19%  perf-stat.overall.dTLB-store-miss-rate%
      0.60            -2.5%       0.58            -2.9%       0.58        perf-stat.overall.ipc
     24.35            +0.8       25.13            +0.6       24.97        perf-stat.overall.node-load-miss-rate%
      9.09            +1.2       10.31            +1.2       10.28        perf-stat.overall.node-store-miss-rate%
 4.443e+10            -3.3%  4.294e+10            -3.7%  4.276e+10        perf-stat.ps.branch-instructions
 1.966e+08            +1.6%  1.998e+08            +1.5%  1.996e+08        perf-stat.ps.branch-misses
 3.933e+08            -9.7%   3.55e+08           -10.3%  3.526e+08        perf-stat.ps.cache-misses
 1.801e+09            -4.0%   1.73e+09            -4.6%  1.718e+09        perf-stat.ps.cache-references
   3104212           -10.4%    2781030            -9.6%    2804668        perf-stat.ps.context-switches
    127050            +0.0%     127068            +0.0%     127100        perf-stat.ps.cpu-clock
 3.994e+11            -1.4%  3.939e+11            -1.3%  3.941e+11        perf-stat.ps.cpu-cycles
    354970            -8.9%     323401 ±  2%      -8.9%     323414        perf-stat.ps.cpu-migrations
  24565631 ± 16%      -1.9%   24093755 ± 11%      +5.7%   25970968 ±  5%  perf-stat.ps.dTLB-load-misses
 6.521e+10            -4.0%  6.258e+10            -4.4%  6.234e+10        perf-stat.ps.dTLB-loads
   4047965 ± 38%     -16.3%    3389310 ± 20%      +3.5%    4188164 ± 19%  perf-stat.ps.dTLB-store-misses
 4.029e+10            -5.4%  3.812e+10            -5.8%  3.796e+10        perf-stat.ps.dTLB-stores
 2.389e+11            -3.8%  2.297e+11            -4.2%  2.288e+11        perf-stat.ps.instructions
     66.62 ±  3%     -12.0%      58.62 ±  5%     -13.1%      57.88 ±  5%  perf-stat.ps.major-faults
     10118 ±  8%     -13.6%       8745 ±  2%     -14.4%       8664 ±  2%  perf-stat.ps.minor-faults
  30547504            -4.7%   29097293            -6.0%   28720714        perf-stat.ps.node-load-misses
  94908109            -8.6%   86722788            -9.1%   86307398        perf-stat.ps.node-loads
   6660116            -5.6%    6290369            -6.7%    6216850        perf-stat.ps.node-store-misses
  66647480           -17.9%   54727405           -18.6%   54278164        perf-stat.ps.node-stores
     10184 ±  8%     -13.6%       8803 ±  2%     -14.4%       8722 ±  2%  perf-stat.ps.page-faults
    127050            +0.0%     127068            +0.0%     127100        perf-stat.ps.task-clock
 3.261e+13            +1.6%  3.312e+13            +1.7%  3.315e+13        perf-stat.total.instructions
     18473 ±100%     +71.2%      31632 ± 44%    +103.5%      37589 ±  2%  sched_debug.cfs_rq:/.MIN_vruntime.avg
   2364639 ±100%     +71.2%    4048954 ± 44%    +103.5%    4811449 ±  2%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
    208188 ±100%     +71.2%     356479 ± 44%    +103.5%     423611 ±  2%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      9.49 ±  4%     +11.3%      10.57 ±  6%      +8.8%      10.33 ±  5%  sched_debug.cfs_rq:/.h_nr_running.avg
     26.67 ±  5%      +7.1%      28.56 ±  5%      +4.0%      27.73 ±  2%  sched_debug.cfs_rq:/.h_nr_running.max
      0.28 ± 44%     +80.0%       0.50 ± 50%     +20.0%       0.33 ± 63%  sched_debug.cfs_rq:/.h_nr_running.min
      6.37 ±  4%     +11.4%       7.10 ±  6%      +7.4%       6.84 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
     10612 ± 17%     +14.4%      12144 ± 10%     +23.4%      13096 ± 11%  sched_debug.cfs_rq:/.load.avg
    367702 ± 52%     +61.0%     591934 ± 27%     +92.5%     707712 ± 30%  sched_debug.cfs_rq:/.load.max
    469.39 ±108%    +114.0%       1004 ± 60%     +16.4%     546.40 ± 69%  sched_debug.cfs_rq:/.load.min
     35751 ± 47%     +47.6%      52755 ± 26%     +75.8%      62847 ± 30%  sched_debug.cfs_rq:/.load.stddev
     69.32 ±127%      +2.3%      70.92 ±121%    +140.5%     166.72 ±157%  sched_debug.cfs_rq:/.load_avg.avg
      5328 ±188%      +3.2%       5498 ±198%     +29.2%       6882 ±170%  sched_debug.cfs_rq:/.load_avg.max
      1.17 ± 14%      +0.0%       1.17 ± 27%     +20.0%       1.40 ± 23%  sched_debug.cfs_rq:/.load_avg.min
    496.64 ±175%      +5.3%     522.94 ±180%     +94.5%     965.76 ±171%  sched_debug.cfs_rq:/.load_avg.stddev
     18473 ±100%     +71.2%      31632 ± 44%    +103.5%      37589 ±  2%  sched_debug.cfs_rq:/.max_vruntime.avg
   2364639 ±100%     +71.2%    4048954 ± 44%    +103.5%    4811450 ±  2%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
    208188 ±100%     +71.2%     356479 ± 44%    +103.5%     423611 ±  2%  sched_debug.cfs_rq:/.max_vruntime.stddev
   7226615            +0.5%    7260631            +0.5%    7260689        sched_debug.cfs_rq:/.min_vruntime.avg
   9061493 ±  5%      -1.7%    8910843 ±  4%      -2.6%    8827149 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
   6914915            +0.8%    6970885            -0.0%    6912152        sched_debug.cfs_rq:/.min_vruntime.min
    250377 ± 10%      -6.8%     233268 ± 11%      +1.0%     252865 ±  5%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.70            +0.8%       0.70            +0.2%       0.70        sched_debug.cfs_rq:/.nr_running.avg
      1.06 ± 11%      -5.3%       1.00           +13.7%       1.20 ± 13%  sched_debug.cfs_rq:/.nr_running.max
      0.28 ± 44%     +80.0%       0.50 ± 50%     +20.0%       0.33 ± 63%  sched_debug.cfs_rq:/.nr_running.min
      0.14 ±  9%     -16.8%       0.12 ± 17%      +0.9%       0.14 ± 15%  sched_debug.cfs_rq:/.nr_running.stddev
      9.71 ± 40%     +48.9%      14.46 ± 34%    +489.5%      57.24 ±165%  sched_debug.cfs_rq:/.removed.load_avg.avg
    341.33            +0.0%     341.33         +1713.6%       6190 ±188%  sched_debug.cfs_rq:/.removed.load_avg.max
     55.31 ± 20%     +21.4%      67.14 ± 16%    +922.3%     565.42 ±180%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      3.90 ± 46%     +71.3%       6.68 ± 42%     +27.8%       4.98 ± 44%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    176.44 ±  5%      +2.0%     180.06 ±  5%      -5.7%     166.33 ±  7%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     23.27 ± 22%     +35.1%      31.44 ± 23%     +12.9%      26.28 ± 27%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      3.90 ± 46%     +71.3%       6.68 ± 42%     +27.8%       4.98 ± 44%  sched_debug.cfs_rq:/.removed.util_avg.avg
    176.44 ±  5%      +2.0%     180.06 ±  5%      -5.7%     166.33 ±  7%  sched_debug.cfs_rq:/.removed.util_avg.max
     23.27 ± 22%     +35.0%      31.43 ± 23%     +12.9%      26.28 ± 27%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      9921 ±  3%     +10.1%      10923 ±  5%      +5.5%      10470 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
     17354 ±  4%      +7.5%      18652 ±  9%     +10.0%      19087 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
      1205 ± 59%     +38.8%       1673 ± 44%     +52.3%       1836 ± 32%  sched_debug.cfs_rq:/.runnable_avg.min
      2720 ±  3%     +12.9%       3072 ±  7%     +10.7%       3012 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.01 ±223%    -100.0%       0.00          +140.0%       0.01 ±122%  sched_debug.cfs_rq:/.spread.avg
      0.67 ±223%    -100.0%       0.00          +140.0%       1.60 ±122%  sched_debug.cfs_rq:/.spread.max
      0.06 ±223%    -100.0%       0.00          +140.0%       0.14 ±122%  sched_debug.cfs_rq:/.spread.stddev
   -802332           -13.3%    -695269           -13.3%    -695410        sched_debug.cfs_rq:/.spread0.avg
   1029531 ± 40%      -6.5%     963003 ± 51%     -14.6%     879291 ± 33%  sched_debug.cfs_rq:/.spread0.max
  -1116926           -11.3%    -991037            -6.4%   -1045976        sched_debug.cfs_rq:/.spread0.min
    250004 ± 10%      -6.2%     234600 ± 11%      +0.8%     252106 ±  5%  sched_debug.cfs_rq:/.spread0.stddev
    746.59            +0.3%     748.85            +0.2%     748.19        sched_debug.cfs_rq:/.util_avg.avg
      1526 ±  4%      -1.8%       1498 ±  3%      +4.0%       1588 ±  4%  sched_debug.cfs_rq:/.util_avg.max
    118.33 ± 37%      +8.7%     128.67 ± 33%     +58.1%     187.07 ± 24%  sched_debug.cfs_rq:/.util_avg.min
    257.79 ±  3%      -1.4%     254.31 ±  4%      +1.8%     262.31 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
    309.08 ±  5%     +15.4%     356.69 ±  8%     +11.5%     344.70 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1200 ±  6%     +12.4%       1349 ±  9%     +11.2%       1334 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.max
      2.44 ±143%     -52.3%       1.17 ±223%     -50.9%       1.20 ±200%  sched_debug.cfs_rq:/.util_est_enqueued.min
    241.74 ±  5%     +16.6%     281.91 ±  6%     +13.2%     273.56 ±  3%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    428381 ±  3%      +1.7%     435830 ±  3%      +7.8%     461658 ±  8%  sched_debug.cpu.avg_idle.avg
   1035072 ± 19%     +27.5%    1319661 ± 46%     +86.7%    1932056 ± 49%  sched_debug.cpu.avg_idle.max
     21181 ± 47%      +7.6%      22783 ± 58%      -1.5%      20855 ± 39%  sched_debug.cpu.avg_idle.min
    154867 ± 15%     +10.2%     170635 ± 28%     +66.3%     257520 ± 46%  sched_debug.cpu.avg_idle.stddev
    105813 ±  6%      +4.1%     110153 ± 13%     +16.2%     123004 ± 18%  sched_debug.cpu.clock.avg
    106023 ±  6%      +4.1%     110345 ± 13%     +16.2%     123163 ± 18%  sched_debug.cpu.clock.max
    105604 ±  6%      +4.1%     109916 ± 13%     +16.3%     122816 ± 18%  sched_debug.cpu.clock.min
    121.61 ± 23%      +2.5%     124.70 ± 40%     -15.0%     103.41 ± 34%  sched_debug.cpu.clock.stddev
    104601 ±  6%      +4.3%     109053 ± 13%     +16.1%     121466 ± 18%  sched_debug.cpu.clock_task.avg
    105076 ±  6%      +4.3%     109543 ± 13%     +16.3%     122154 ± 18%  sched_debug.cpu.clock_task.max
     89692            -0.1%      89608            -0.4%      89303        sched_debug.cpu.clock_task.min
      1342 ± 43%     +30.1%       1745 ± 75%    +114.0%       2871 ± 69%  sched_debug.cpu.clock_task.stddev
     13482            +0.4%      13530            +0.4%      13542        sched_debug.cpu.curr->pid.avg
     16770            +0.2%      16805            -0.1%      16760        sched_debug.cpu.curr->pid.max
      4947 ± 27%      +3.2%       5104 ± 50%     -11.2%       4393 ± 46%  sched_debug.cpu.curr->pid.min
      1805 ±  9%      -4.5%       1724 ± 12%      -0.1%       1804 ± 13%  sched_debug.cpu.curr->pid.stddev
    505781            +0.2%     506623 ±  2%      +4.4%     528071 ±  5%  sched_debug.cpu.max_idle_balance_cost.avg
    874225 ± 46%      -9.4%     792013 ± 59%     +52.6%    1333820 ± 55%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
     37209 ±106%      -3.1%      36056 ±172%    +208.1%     114643 ± 99%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 20%      +3.8%       0.00 ± 28%     -14.8%       0.00 ± 31%  sched_debug.cpu.next_balance.stddev
      9.50 ±  4%     +11.2%      10.57 ±  5%      +8.9%      10.34 ±  5%  sched_debug.cpu.nr_running.avg
     26.67 ±  5%      +7.1%      28.56 ±  5%      +4.0%      27.73 ±  2%  sched_debug.cpu.nr_running.max
      0.44 ± 35%     +25.0%       0.56 ± 28%     -10.0%       0.40 ± 62%  sched_debug.cpu.nr_running.min
      6.35 ±  4%     +11.6%       7.09 ±  6%      +7.7%       6.84 ±  3%  sched_debug.cpu.nr_running.stddev
   1394250            -6.7%    1300659            -6.6%    1301614        sched_debug.cpu.nr_switches.avg
   1643137 ±  2%      -7.8%    1515540 ±  2%      -6.3%    1539074        sched_debug.cpu.nr_switches.max
   1207910            -7.0%    1123538            -6.3%    1132376        sched_debug.cpu.nr_switches.min
     87018 ± 17%     -15.5%      73537 ± 10%     -10.9%      77530 ±  4%  sched_debug.cpu.nr_switches.stddev
 2.134e+09 ±  6%      -3.2%  2.065e+09 ±  3%      +2.9%  2.197e+09 ±  7%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
  2.14e+09            +0.0%  2.141e+09            -0.1%  2.138e+09        sched_debug.cpu.nr_uninterruptible.stddev
    105600 ±  6%      +4.1%     109910 ± 13%     +16.3%     122811 ± 18%  sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
    104879 ±  6%      +4.1%     109186 ± 14%     +16.4%     122089 ± 19%  sched_debug.ktime
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.33            +0.0%       0.33            +0.0%       0.33        sched_debug.rt_rq:.rt_nr_migratory.max
      0.03            +0.0%       0.03            +0.0%       0.03        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.33            +0.0%       0.33            +0.0%       0.33        sched_debug.rt_rq:.rt_nr_running.max
      0.03            +0.0%       0.03            +0.0%       0.03        sched_debug.rt_rq:.rt_nr_running.stddev
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.69 ± 98%     +63.7%       1.13 ± 51%     +88.4%       1.30 ± 61%  sched_debug.rt_rq:.rt_time.avg
     88.54 ± 98%     +63.5%     144.74 ± 51%     +88.1%     166.50 ± 62%  sched_debug.rt_rq:.rt_time.max
      0.00        +1.1e+99%       0.00 ±223%  +1.5e+99%       0.00 ±200%  sched_debug.rt_rq:.rt_time.min
      7.79 ± 98%     +63.5%      12.74 ± 51%     +88.1%      14.66 ± 62%  sched_debug.rt_rq:.rt_time.stddev
     98000            -0.3%      97695            -0.6%      97446        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      2.00 ± 12%      -1.9        0.09 ±223%      -2.0        0.00        perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.78 ± 14%      -1.8        0.00            -1.8        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.66 ± 15%      -1.7        0.00            -1.7        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      6.73            -1.6        5.16 ±  4%      -1.6        5.09 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      5.06 ±  3%      -1.5        3.58 ±  2%      -1.5        3.58 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.43 ± 12%      -1.4        0.00            -1.4        0.00        perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
     53.78            -1.4       52.40            -1.4       52.39        perf-profile.calltrace.cycles-pp.__libc_read
      5.11 ±  2%      -1.3        3.80 ±  6%      -1.3        3.76 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      9.82 ±  2%      -1.2        8.62 ±  3%      -1.2        8.62 ±  3%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      9.90 ±  2%      -1.2        8.70 ±  3%      -1.2        8.70 ±  3%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      9.70 ±  2%      -1.2        8.50 ±  3%      -1.2        8.50 ±  3%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      1.90 ±  9%      -1.2        0.71 ±  8%      -1.2        0.71 ±  6%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     51.59            -1.1       50.46            -1.1       50.47        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read
     51.29            -1.1       50.17            -1.1       50.18        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      1.10 ± 15%      -1.1        0.00            -1.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      1.08 ± 16%      -1.1        0.00            -1.1        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
     49.81            -1.0       48.85            -0.9       48.89        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      5.21 ±  2%      -0.9        4.26 ±  3%      -1.0        4.25 ±  3%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      5.10 ±  2%      -0.9        4.16 ±  4%      -1.0        4.15 ±  3%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
     49.06            -0.9       48.12            -0.9       48.16        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      4.93 ±  2%      -0.9        3.99 ±  4%      -1.0        3.98 ±  3%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      5.34 ±  3%      -0.9        4.41 ±  2%      -0.9        4.45 ±  4%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      5.04 ±  3%      -0.9        4.12 ±  2%      -0.9        4.15 ±  4%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
     47.09            -0.9       46.20            -0.8       46.25        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.41            -0.9       45.54            -0.8       45.59        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     45.56            -0.9       44.71            -0.8       44.76        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     45.26            -0.8       44.42            -0.8       44.47        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      3.34 ±  2%      -0.8        2.51 ±  6%      -0.8        2.50 ±  4%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      3.72            -0.6        3.09 ±  3%      -0.6        3.09 ±  3%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.61 ±  2%      -0.5        0.09 ±223%      -0.5        0.10 ±200%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space
      2.28 ±  3%      -0.5        1.81 ±  6%      -0.5        1.79 ±  6%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      2.18 ±  3%      -0.5        1.72 ±  6%      -0.5        1.70 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.55 ±  2%      -0.4        0.19 ±141%      -0.3        0.22 ±122%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.53 ±  2%      -0.4        0.18 ±141%      -0.4        0.11 ±200%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      0.52            -0.4        0.17 ±141%      -0.4        0.10 ±200%  perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.56 ±  3%      -0.3        0.22 ±141%      -0.3        0.26 ±124%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.34 ± 70%      -0.3        0.00            -0.3        0.00        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.68 ±  2%      -0.3        0.36 ± 70%      -0.3        0.42 ± 50%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm
      0.68 ±  2%      -0.3        0.36 ± 71%      -0.3        0.42 ± 50%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree
      3.98            -0.3        3.72 ±  4%      -0.3        3.68 ±  3%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.43            -0.3        3.17 ±  5%      -0.3        3.14 ±  4%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      4.15            -0.3        3.89 ±  4%      -0.3        3.85 ±  3%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.34 ± 70%      -0.3        0.08 ±223%      -0.3        0.00        perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.68 ±  2%      -0.2        0.45 ± 45%      -0.2        0.53 ±  5%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state
      2.44 ±  3%      -0.2        2.23 ±  3%      -0.2        2.22 ±  3%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.38            -0.2        1.18 ±  2%      -0.2        1.18 ±  2%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.89            -0.2        0.70 ±  3%      -0.2        0.69 ±  3%  perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.63 ±  5%      -0.2        0.44 ± 45%      -0.2        0.43 ± 50%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.12            -0.2        0.94 ±  4%      -0.2        0.93 ±  3%  perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      0.18 ±141%      -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.59            -0.2        0.43 ± 44%      -0.3        0.32 ± 81%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.81            -0.2        1.66 ±  2%      -0.1        1.66 ±  2%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.12            -0.1        0.98 ±  5%      -0.2        0.96 ±  4%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.79            -0.1        0.65 ±  3%      -0.1        0.65 ±  7%  perf-profile.calltrace.cycles-pp.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.77 ±  2%      -0.1        0.63 ±  3%      -0.1        0.62 ±  7%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.74            -0.1        0.60 ±  4%      -0.1        0.60 ±  7%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg
      0.96 ±  2%      -0.1        0.82 ±  6%      -0.2        0.80 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      1.22 ±  6%      -0.1        1.09 ±  4%      -0.1        1.08 ±  4%  perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.96 ±  7%      -0.1        0.83 ±  5%      -0.1        0.82 ±  5%  perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      1.34            -0.1        1.24            -0.1        1.23 ±  3%  perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.73 ±  2%      -0.1        0.63 ±  2%      -0.1        0.64 ±  3%  perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.08 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_read.ksys_read.do_syscall_64
      0.08 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_write.ksys_write.do_syscall_64
      0.89            -0.1        0.82 ±  3%      -0.1        0.82 ±  3%  perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      1.23            -0.1        1.16 ±  3%      -0.1        1.16 ±  2%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.70 ±  2%      -0.1        0.63 ±  4%      -0.1        0.63 ±  4%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.39            -0.1        1.33 ±  2%      -0.1        1.33 ±  3%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write
      0.90            -0.1        0.84 ±  2%      -0.1        0.84 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.31            -0.1        1.26            -0.0        1.27 ±  2%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read
      0.68 ±  2%      -0.1        0.63 ±  3%      -0.1        0.62 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.62 ±  2%      -0.1        0.57 ±  4%      -0.1        0.56 ±  2%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.60            -0.0        0.57 ±  3%      -0.0        0.56 ±  2%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.60            -0.0        0.57 ±  2%      -0.0        0.57 ±  3%  perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.66            -0.0        0.63            -0.0        0.63 ±  2%  perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.64            -0.0        0.60 ±  2%      -0.0        0.61 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.62 ±  2%      -0.0        0.61 ±  3%      -0.0        0.61 ±  2%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.18 ±141%      +0.1        0.25 ±100%      -0.2        0.00        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.1        0.08 ±223%      +0.1        0.12 ±200%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.61            +0.1        0.76 ± 30%      +0.1        0.74 ± 33%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.2        0.18 ±141%      +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.2        0.18 ±141%      +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.2        0.18 ±141%      +0.2        0.24 ±122%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
      0.00            +0.2        0.18 ±141%      +0.3        0.33 ± 82%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg
      0.00            +0.2        0.18 ±141%      +0.2        0.24 ±124%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%      +0.2        0.24 ±124%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%      +0.2        0.24 ±124%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%      +0.3        0.34 ± 82%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00            +0.2        0.18 ±141%      +0.2        0.24 ±124%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%      +0.1        0.12 ±200%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      4.74 ±  2%      +0.2        4.93 ± 27%      +0.0        4.77 ± 31%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.00            +0.2        0.22 ±141%      +0.2        0.25 ±123%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.2        0.24 ±141%      +0.3        0.27 ±123%  perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.3        0.27 ±100%      +0.4        0.36 ± 81%  perf-profile.calltrace.cycles-pp.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00            +0.3        0.32 ±101%      +0.3        0.29 ±122%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.4        0.42 ±101%      +0.4        0.36 ±123%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.66            +0.4        1.11 ± 74%      +0.3        0.96 ±103%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.74            +0.5        1.27 ± 59%      +0.5        1.21 ± 67%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.00            +0.5        0.54 ±105%      +0.5        0.48 ±123%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.77 ±  2%      +0.5        1.31 ± 58%      +0.5        1.25 ± 66%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.88 ±  2%      +0.6        1.43 ± 56%      +0.5        1.37 ± 63%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.56 ±104%      +0.5        0.51 ±123%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.schedule_timeout
      2.09            +0.6        2.73 ± 42%      +0.6        2.65 ± 47%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      2.13            +0.7        2.78 ± 41%      +0.6        2.69 ± 47%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      2.22            +0.7        2.87 ± 41%      +0.6        2.78 ± 47%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.59 ±  2%      +0.7        3.27 ± 41%      +0.6        3.15 ± 49%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.65            +0.7        3.33 ± 39%      +0.6        3.22 ± 44%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      2.00 ±  2%      +0.8        2.76 ± 46%      +0.7        2.67 ± 54%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      1.86 ±  2%      +0.8        2.62 ± 48%      +0.7        2.54 ± 56%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      1.88 ±  2%      +0.8        2.65 ± 47%      +0.7        2.56 ± 56%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
     45.79            +0.9       46.67            +0.8       46.57        perf-profile.calltrace.cycles-pp.__libc_write
     42.50            +0.9       43.43            +1.0       43.45        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     41.56            +1.0       42.56            +1.0       42.60        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     43.75            +1.1       44.81            +1.1       44.82        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     43.46            +1.1       44.52            +1.1       44.54        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     39.64            +1.1       40.73            +1.1       40.78        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.62            +1.2       38.84            +1.3       38.89        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
     19.29            +3.7       22.98 ±  6%      +4.0       23.26 ±  5%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     15.36 ±  2%      +4.0       19.39 ±  7%      +4.3       19.63 ±  6%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     14.47 ±  2%      +4.5       18.97 ±  8%      +4.7       19.18 ±  6%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     14.22 ±  2%      +4.5       18.72 ±  8%      +4.7       18.93 ±  6%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      9.71 ±  5%      +5.0       14.71 ± 10%      +5.3       14.97 ±  7%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.50 ± 22%      +5.8        8.29 ± 17%      +6.0        8.53 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
      2.37 ± 23%      +5.8        8.17 ± 17%      +6.0        8.41 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
      2.72 ± 21%      +6.0        8.69 ± 17%      +6.2        8.93 ± 10%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      7.16 ±  5%      +6.3       13.43 ± 11%      +6.5       13.65 ±  7%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      6.78 ±  5%      +6.3       13.06 ± 11%      +6.5       13.29 ±  7%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.37 ±  6%      +6.3       12.68 ± 11%      +6.5       12.91 ±  7%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      1.55 ± 24%      +6.3        7.86 ± 17%      +6.5        8.07 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
      1.57 ± 24%      +6.3        7.92 ± 17%      +6.6        8.13 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      1.91 ± 20%      +6.6        8.49 ± 17%      +6.8        8.69 ± 10%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      2.39 ± 16%      +6.8        9.19 ± 16%      +7.0        9.42 ± 10%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      6.78            -1.6        5.21 ±  4%      -1.6        5.14 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      5.16 ±  3%      -1.5        3.68 ±  2%      -1.5        3.69 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
     53.87            -1.2       52.63            -1.2       52.65        perf-profile.children.cycles-pp.__libc_read
      9.85 ±  2%      -1.2        8.65 ±  3%      -1.2        8.65 ±  3%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      9.74 ±  2%      -1.2        8.54 ±  3%      -1.2        8.55 ±  3%  perf-profile.children.cycles-pp.__skb_datagram_iter
      9.92 ±  2%      -1.2        8.73 ±  3%      -1.2        8.73 ±  3%  perf-profile.children.cycles-pp.unix_stream_read_actor
      6.12 ±  2%      -1.1        5.00 ±  8%      -1.2        4.93 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
     49.86            -1.0       48.90            -0.9       48.93        perf-profile.children.cycles-pp.ksys_read
      5.15 ±  2%      -0.9        4.20 ±  4%      -1.0        4.19 ±  3%  perf-profile.children.cycles-pp.unix_destruct_scm
      5.24 ±  2%      -0.9        4.30 ±  3%      -1.0        4.28 ±  3%  perf-profile.children.cycles-pp.skb_release_head_state
      4.96 ±  2%      -0.9        4.02 ±  4%      -1.0        4.01 ±  3%  perf-profile.children.cycles-pp.sock_wfree
     49.15            -0.9       48.21            -0.9       48.25        perf-profile.children.cycles-pp.vfs_read
      5.37 ±  3%      -0.9        4.44 ±  2%      -0.9        4.48 ±  4%  perf-profile.children.cycles-pp._copy_to_iter
      5.14 ±  3%      -0.9        4.21 ±  2%      -0.9        4.25 ±  4%  perf-profile.children.cycles-pp.copyout
     47.12            -0.9       46.23            -0.8       46.28        perf-profile.children.cycles-pp.sock_read_iter
     46.46            -0.9       45.58            -0.8       45.64        perf-profile.children.cycles-pp.sock_recvmsg
     45.59            -0.8       44.74            -0.8       44.79        perf-profile.children.cycles-pp.unix_stream_recvmsg
     45.41            -0.8       44.57            -0.8       44.62        perf-profile.children.cycles-pp.unix_stream_read_generic
      3.36 ±  2%      -0.8        2.53 ±  6%      -0.8        2.52 ±  4%  perf-profile.children.cycles-pp.skb_set_owner_w
      3.77            -0.6        3.14 ±  3%      -0.6        3.14 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_free
      2.31 ±  3%      -0.5        1.84 ±  6%      -0.5        1.82 ±  6%  perf-profile.children.cycles-pp.skb_queue_tail
      5.12            -0.3        4.80 ±  3%      -0.4        4.76 ±  3%  perf-profile.children.cycles-pp.__check_object_size
      4.04            -0.3        3.71 ±  4%      -0.3        3.69 ±  3%  perf-profile.children.cycles-pp.check_heap_object
      2.68            -0.3        2.40 ±  2%      -0.3        2.40 ±  2%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      4.18            -0.3        3.92 ±  4%      -0.3        3.89 ±  3%  perf-profile.children.cycles-pp.simple_copy_to_iter
      3.18            -0.3        2.93 ±  2%      -0.3        2.93 ±  2%  perf-profile.children.cycles-pp.__slab_free
      2.50 ±  3%      -0.2        2.29 ±  3%      -0.2        2.28 ±  3%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.91            -0.2        0.71 ±  4%      -0.2        0.71 ±  3%  perf-profile.children.cycles-pp.__build_skb_around
      1.13            -0.2        0.95 ±  4%      -0.2        0.94 ±  3%  perf-profile.children.cycles-pp.unix_write_space
      0.76 ±  2%      -0.2        0.58 ±  5%      -0.2        0.58 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.70 ±  3%      -0.2        0.54 ±  4%      -0.2        0.54        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.65 ±  3%      -0.2        0.48 ±  5%      -0.2        0.48        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.64 ±  3%      -0.2        0.48 ±  5%      -0.2        0.48        perf-profile.children.cycles-pp.hrtimer_interrupt
      1.18 ±  4%      -0.2        1.02 ±  3%      -0.2        1.01 ±  3%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.59 ±  3%      -0.2        0.44 ±  5%      -0.2        0.44        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.54 ±  3%      -0.2        0.40 ±  5%      -0.1        0.40        perf-profile.children.cycles-pp.tick_sched_timer
      0.50 ±  3%      -0.1        0.36 ±  5%      -0.1        0.36 ±  2%  perf-profile.children.cycles-pp.update_process_times
      1.28 ±  5%      -0.1        1.14 ±  3%      -0.1        1.13 ±  4%  perf-profile.children.cycles-pp._copy_from_iter
      0.51 ±  3%      -0.1        0.38 ±  5%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      1.05 ±  7%      -0.1        0.92 ±  4%      -0.1        0.91 ±  4%  perf-profile.children.cycles-pp.copyin
      0.64 ±  7%      -0.1        0.52 ±  5%      -0.1        0.52 ±  5%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.40 ±  3%      -0.1        0.29 ±  5%      -0.1        0.29        perf-profile.children.cycles-pp.scheduler_tick
      2.18            -0.1        2.07 ±  2%      -0.1        2.09 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      0.34 ±  4%      -0.1        0.23 ±  5%      -0.1        0.24 ±  4%  perf-profile.children.cycles-pp.task_tick_fair
      0.17 ± 44%      -0.1        0.06 ±141%      -0.1        0.09 ±125%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.76 ±  2%      -0.1        0.66 ±  2%      -0.1        0.66 ±  3%  perf-profile.children.cycles-pp.skb_unlink
      1.22            -0.1        1.13 ±  2%      -0.1        1.13 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      0.46 ±  2%      -0.1        0.37            -0.1        0.37 ±  3%  perf-profile.children.cycles-pp.task_work_run
      0.45 ±  2%      -0.1        0.37 ±  2%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.12 ± 44%      -0.1        0.04 ±141%      -0.1        0.06 ±125%  perf-profile.children.cycles-pp.perf_tp_event
      1.59            -0.1        1.51 ±  2%      -0.1        1.52 ±  2%  perf-profile.children.cycles-pp.__entry_text_start
      1.26 ±  3%      -0.1        1.18 ±  4%      -0.1        1.16 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      1.10 ±  3%      -0.1        1.03 ±  4%      -0.1        1.01 ±  2%  perf-profile.children.cycles-pp.__fget_light
      0.92 ±  2%      -0.1        0.85 ±  3%      -0.1        0.85 ±  3%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.52 ±  4%      -0.1        0.45 ±  6%      -0.1        0.46        perf-profile.children.cycles-pp.__virt_addr_valid
      1.05            -0.1        0.99 ±  2%      -0.1        0.99 ±  2%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.15 ± 48%      -0.1        0.09 ±144%      -0.1        0.08 ±122%  perf-profile.children.cycles-pp.reader__read_event
      1.32            -0.1        1.27 ±  3%      -0.1        1.26        perf-profile.children.cycles-pp.security_file_permission
      0.27 ±  3%      -0.1        0.22 ±  4%      -0.1        0.21 ±  4%  perf-profile.children.cycles-pp.load_balance
      0.27 ±  3%      -0.1        0.22 ±  5%      -0.1        0.21 ±  4%  perf-profile.children.cycles-pp.newidle_balance
      0.43            -0.1        0.38 ±  2%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.mutex_unlock
      0.94            -0.1        0.89 ±  3%      -0.0        0.89 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge
      1.18            -0.0        1.14 ±  2%      -0.0        1.13 ±  3%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.14 ± 57%      -0.0        0.10 ±144%      -0.1        0.05 ±200%  perf-profile.children.cycles-pp.__cmd_record
      0.06 ± 45%      -0.0        0.02 ±141%      -0.0        0.03 ±136%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.87            -0.0        0.84 ±  2%      -0.0        0.83 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.41 ±  4%      -0.0        0.37            -0.0        0.37 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.32 ±  4%      -0.0        0.28 ±  2%      -0.0        0.28        perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.12 ± 60%      -0.0        0.09 ±144%      -0.1        0.04 ±200%  perf-profile.children.cycles-pp.record__finish_output
      0.12 ± 60%      -0.0        0.09 ±144%      -0.0        0.08 ±122%  perf-profile.children.cycles-pp.perf_session__process_events
      0.69            -0.0        0.66            -0.0        0.66 ±  2%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.10 ± 69%      -0.0        0.07 ±141%      -0.1        0.05 ±122%  perf-profile.children.cycles-pp.ordered_events__queue
      0.33            -0.0        0.30            -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.10 ± 69%      -0.0        0.07 ±141%      -0.1        0.05 ±122%  perf-profile.children.cycles-pp.process_simple
      0.10 ± 69%      -0.0        0.07 ±141%      -0.1        0.05 ±122%  perf-profile.children.cycles-pp.queue_event
      0.13 ±  2%      -0.0        0.10 ±  6%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.detach_tasks
      0.22 ±  3%      -0.0        0.19 ± 10%      -0.0        0.18 ± 10%  perf-profile.children.cycles-pp.wake_affine
      0.36 ±  2%      -0.0        0.33            -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.aa_file_perm
      0.26 ±  6%      -0.0        0.24 ±  8%      -0.0        0.23 ±  5%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.50 ±  4%      -0.0        0.47 ± 16%      -0.0        0.47 ± 26%  perf-profile.children.cycles-pp.update_curr
      0.16            -0.0        0.13 ± 11%      -0.0        0.13 ±  8%  perf-profile.children.cycles-pp.__list_add_valid
      0.16 ±  3%      -0.0        0.13 ±  9%      -0.0        0.13 ±  6%  perf-profile.children.cycles-pp.task_h_load
      0.18 ±  8%      -0.0        0.15 ±  4%      -0.0        0.16 ±  7%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.54            -0.0        0.51 ±  2%      -0.0        0.52        perf-profile.children.cycles-pp.mutex_lock
      0.05            -0.0        0.03 ±100%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.14 ±  3%      -0.0        0.12 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.73 ±  2%      -0.0        0.71 ± 18%      -0.0        0.69 ± 20%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.39            -0.0        0.37            -0.0        0.37        perf-profile.children.cycles-pp.__get_task_ioprio
      0.48            -0.0        0.46 ± 16%      -0.0        0.45 ± 17%  perf-profile.children.cycles-pp.switch_fpu_return
      0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.page_counter_try_charge
      0.13 ±  3%      -0.0        0.12 ± 12%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.33 ±  2%      -0.0        0.32 ±  2%      -0.0        0.31 ±  3%  perf-profile.children.cycles-pp.rcu_all_qs
      0.03 ±142%      -0.0        0.02 ±223%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.03 ±142%      -0.0        0.02 ±223%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.20 ±  2%      -0.0        0.19 ±  3%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.16            -0.0        0.15 ±  3%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.kfree
      0.03 ±141%      -0.0        0.02 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.36            -0.0        0.35 ± 14%      -0.0        0.34 ± 15%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.16 ±  3%      -0.0        0.15 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.24 ±  2%      -0.0        0.23            -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.wait_for_unix_gc
      1.86            -0.0        1.86 ± 15%      -0.1        1.81 ± 16%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.13            -0.0        0.12            -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.refill_stock
      0.10 ±  4%      -0.0        0.09 ±  5%      -0.0        0.09        perf-profile.children.cycles-pp.unix_passcred_enabled
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.evlist__parse_sample
      0.16            -0.0        0.15 ±  2%      -0.0        0.15 ±  5%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.05            -0.0        0.04 ± 44%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.apparmor_socket_sendmsg
      0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sched_mm_cid_remote_clear
      0.08 ±  4%      -0.0        0.07 ± 11%      -0.0        0.07 ± 17%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.53 ±  2%      -0.0        0.52 ±  2%      -0.0        0.52 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.20            -0.0        0.19 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.scm_recv
      0.09 ±  7%      -0.0        0.08 ± 21%      -0.0        0.08 ± 20%  perf-profile.children.cycles-pp.update_min_vruntime
     94.98            -0.0       94.97            +0.0       94.98        perf-profile.children.cycles-pp.do_syscall_64
      0.28 ±  2%      -0.0        0.28 ±  2%      -0.0        0.27 ±  2%  perf-profile.children.cycles-pp.kmalloc_slab
     95.44            -0.0       95.44            +0.0       95.45        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.16 ±  3%      -0.0        0.16 ±  3%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.08 ±  8%      -0.0        0.08 ± 13%      -0.0        0.08 ± 23%  perf-profile.children.cycles-pp.cpuacct_charge
      0.07 ±  6%      -0.0        0.07            -0.0        0.07        perf-profile.children.cycles-pp.should_failslab
      0.06 ±  7%      -0.0        0.06 ±  6%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.obj_cgroup_uncharge
      0.16 ±  2%      -0.0        0.16 ±  3%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      0.06 ±  6%      -0.0        0.06            -0.0        0.06        perf-profile.children.cycles-pp.__x64_sys_read
      0.14 ±  2%      -0.0        0.14 ±  3%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.put_pid
      0.07 ±  6%      -0.0        0.07 ± 15%      -0.0        0.07 ± 18%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.05            +0.0        0.05            -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.apparmor_socket_recvmsg
      0.12 ±  4%      +0.0        0.12 ±  6%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.fsnotify_perm
      0.08            +0.0        0.08            +0.0        0.08        perf-profile.children.cycles-pp.skb_put
      0.06            +0.0        0.06            +0.0        0.06        perf-profile.children.cycles-pp.kfree_skbmem
      0.24 ±  2%      +0.0        0.24 ±  4%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.06 ±  7%      +0.0        0.06 ±  7%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.__x64_sys_write
      0.15            +0.0        0.15 ±  5%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.wait_consider_task
      0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.08 ±  6%      +0.0        0.08 ±  6%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.skb_free_head
      0.07            +0.0        0.07 ± 34%      -0.0        0.07 ± 36%  perf-profile.children.cycles-pp.put_prev_entity
      0.24 ±  6%      +0.0        0.24 ± 17%      +0.0        0.25 ± 16%  perf-profile.children.cycles-pp.__switch_to_asm
      0.22            +0.0        0.22 ±  3%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.40 ±  2%      +0.0        0.41 ±  3%      -0.0        0.40 ±  2%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.11            +0.0        0.12 ±  6%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.12 ± 17%      +0.0        0.12 ± 20%      +0.0        0.12 ± 17%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.05            +0.0        0.06 ±  9%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.rb_erase
      0.18 ±  2%      +0.0        0.18 ± 23%      +0.0        0.18 ± 23%  perf-profile.children.cycles-pp.__switch_to
      0.06 ±  8%      +0.0        0.06 ± 50%      +0.0        0.07 ± 29%  perf-profile.children.cycles-pp.set_task_cpu
      0.10 ±  4%      +0.0        0.11 ± 28%      +0.0        0.11 ± 32%  perf-profile.children.cycles-pp.check_preempt_curr
      1.50            +0.0        1.51 ± 18%      -0.0        1.47 ± 20%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.09            +0.0        0.10 ± 18%      +0.0        0.10 ± 21%  perf-profile.children.cycles-pp.os_xsave
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.set_next_buddy
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__do_sys_wait4
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.kernel_wait4
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_wait
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.wait4
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.select_idle_core
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.get_any_partial
      0.06 ±  7%      +0.0        0.08 ± 35%      +0.0        0.07 ± 39%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.19            +0.0        0.21 ± 29%      +0.0        0.20 ± 30%  perf-profile.children.cycles-pp.prepare_task_switch
      0.09 ±  7%      +0.0        0.10 ± 32%      +0.0        0.10 ± 33%  perf-profile.children.cycles-pp.finish_task_switch
      0.13 ±  3%      +0.0        0.14 ±  7%      +0.0        0.15 ±  6%  perf-profile.children.cycles-pp.put_cpu_partial
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  3%      +0.0        0.14 ± 28%      +0.0        0.13 ± 35%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.50 ±  3%      +0.0        0.51 ± 24%      +0.0        0.51 ± 33%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.16 ±  2%      +0.0        0.18 ± 22%      +0.0        0.17 ± 26%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.09 ±  4%      +0.0        0.11 ± 27%      +0.0        0.11 ± 27%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.pick_next_entity
      0.02 ± 99%      +0.0        0.05 ± 73%      +0.0        0.03 ±124%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.48 ±  2%      +0.0        0.51 ±  2%      +0.0        0.50 ±  4%  perf-profile.children.cycles-pp.__check_heap_object
      0.11 ±  3%      +0.0        0.13 ± 30%      +0.0        0.12 ± 35%  perf-profile.children.cycles-pp.reweight_entity
      0.13 ±  8%      +0.0        0.15 ± 32%      +0.0        0.15 ± 26%  perf-profile.children.cycles-pp.___perf_sw_event
      0.82 ±  2%      +0.0        0.85 ± 23%      +0.0        0.82 ± 26%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00            +0.0        0.03 ±100%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.0        0.03 ±100%      +0.0        0.03 ±122%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.03 ±100%      +0.0        0.03 ±124%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.0        0.03 ±100%      +0.0        0.03 ±124%  perf-profile.children.cycles-pp.schedule_idle
      0.05 ±  7%      +0.0        0.09 ± 78%      +0.0        0.09 ± 65%  perf-profile.children.cycles-pp.available_idle_cpu
      0.00            +0.0        0.04 ±104%      +0.0        0.04 ±124%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.0        0.04 ±104%      +0.0        0.04 ±126%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.0        0.04 ±100%      +0.0        0.03 ±122%  perf-profile.children.cycles-pp.intel_idle
      0.20 ±  2%      +0.0        0.24 ± 28%      +0.0        0.23 ± 33%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.0        0.04 ±105%      +0.0        0.04 ±125%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.04 ±100%      +0.0        0.04 ±123%  perf-profile.children.cycles-pp.intel_idle_irq
      0.45            +0.1        0.50 ± 26%      +0.0        0.48 ± 28%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.07 ± 71%      +0.1        0.08 ± 54%  perf-profile.children.cycles-pp.finish_wait
      0.36 ±  3%      +0.1        0.46 ± 33%      +0.1        0.44 ± 33%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.1        0.10 ±100%      +0.1        0.09 ±122%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.1        0.10 ±100%      +0.1        0.09 ±122%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.1        0.10 ±101%      +0.1        0.11 ±129%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.00            +0.1        0.11 ±100%      +0.1        0.10 ±122%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.59 ±  2%      +0.1        0.71 ± 34%      +0.1        0.71 ± 41%  perf-profile.children.cycles-pp.enqueue_entity
      0.30 ±  3%      +0.1        0.42 ± 36%      +0.1        0.41 ± 34%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.12 ±102%      +0.1        0.13 ±128%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.1        0.13 ± 81%      +0.1        0.13 ± 69%  perf-profile.children.cycles-pp.select_idle_cpu
      0.06 ±  9%      +0.1        0.20 ± 64%      +0.1        0.19 ± 58%  perf-profile.children.cycles-pp.select_idle_sibling
      0.68            +0.2        0.84 ± 36%      +0.2        0.83 ± 43%  perf-profile.children.cycles-pp.update_load_avg
      0.45 ±  3%      +0.2        0.64 ± 30%      +0.3        0.71 ± 26%  perf-profile.children.cycles-pp.prepare_to_wait
      4.75 ±  2%      +0.2        4.94 ± 26%      +0.0        4.79 ± 30%  perf-profile.children.cycles-pp.sock_def_readable
      0.00            +0.3        0.27 ± 94%      +0.2        0.25 ±116%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.3        0.27 ± 94%      +0.3        0.25 ±116%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.3        0.27 ± 94%      +0.3        0.25 ±116%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.3        0.27 ± 94%      +0.3        0.25 ±116%  perf-profile.children.cycles-pp.do_idle
      0.96            +0.5        1.42 ± 51%      +0.4        1.37 ± 59%  perf-profile.children.cycles-pp.dequeue_task_fair
      3.01            +0.5        3.52 ± 33%      +0.4        3.43 ± 36%  perf-profile.children.cycles-pp.schedule_timeout
      3.28 ±  2%      +0.5        3.81 ± 35%      +0.4        3.69 ± 42%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.14 ±  2%      +0.6        1.70 ± 50%      +0.5        1.65 ± 57%  perf-profile.children.cycles-pp.activate_task
      1.05            +0.6        1.61 ± 52%      +0.5        1.56 ± 59%  perf-profile.children.cycles-pp.enqueue_task_fair
      1.20 ±  2%      +0.6        1.80 ± 50%      +0.5        1.74 ± 57%  perf-profile.children.cycles-pp.ttwu_do_activate
      2.69 ±  2%      +0.6        3.29 ± 38%      +0.5        3.19 ± 45%  perf-profile.children.cycles-pp.__wake_up_common
      2.56 ±  2%      +0.6        3.17 ± 39%      +0.5        3.08 ± 46%  perf-profile.children.cycles-pp.autoremove_wake_function
      3.25            +0.6        3.87 ± 34%      +0.5        3.76 ± 39%  perf-profile.children.cycles-pp.schedule
      2.48 ±  2%      +0.6        3.10 ± 39%      +0.5        3.01 ± 47%  perf-profile.children.cycles-pp.try_to_wake_up
      3.20            +0.6        3.85 ± 35%      +0.5        3.74 ± 39%  perf-profile.children.cycles-pp.__schedule
      2.66            +0.7        3.34 ± 38%      +0.6        3.24 ± 44%  perf-profile.children.cycles-pp.unix_stream_data_wait
      0.71 ±  3%      +0.8        1.52 ± 74%      +0.7        1.45 ± 84%  perf-profile.children.cycles-pp.update_cfs_group
     42.56            +0.9       43.50            +1.0       43.52        perf-profile.children.cycles-pp.ksys_write
     45.89            +1.0       46.85            +1.0       46.86        perf-profile.children.cycles-pp.__libc_write
     41.66            +1.0       42.66            +1.0       42.69        perf-profile.children.cycles-pp.vfs_write
     39.70            +1.1       40.80            +1.1       40.84        perf-profile.children.cycles-pp.sock_write_iter
     37.85            +1.2       39.07            +1.3       39.12        perf-profile.children.cycles-pp.unix_stream_sendmsg
     19.34            +3.7       23.02 ±  6%      +4.0       23.31 ±  5%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     15.43 ±  2%      +4.0       19.46 ±  7%      +4.3       19.70 ±  6%  perf-profile.children.cycles-pp.consume_skb
      4.72 ± 13%      +4.4        9.16 ± 16%      +4.7        9.39 ± 10%  perf-profile.children.cycles-pp.__unfreeze_partials
     14.51 ±  2%      +4.5       19.00 ±  8%      +4.7       19.21 ±  6%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     14.30 ±  2%      +4.5       18.80 ±  8%      +4.7       19.01 ±  6%  perf-profile.children.cycles-pp.__alloc_skb
      9.74 ±  5%      +5.0       14.74 ± 10%      +5.3       15.00 ±  7%  perf-profile.children.cycles-pp.skb_release_data
      3.36 ± 12%      +5.6        8.91 ± 16%      +5.8        9.12 ± 10%  perf-profile.children.cycles-pp.get_partial_node
      4.29 ± 10%      +5.6        9.91 ± 15%      +5.8       10.13 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
      6.85 ±  5%      +6.3       13.12 ± 11%      +6.5       13.35 ±  7%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      7.23 ±  5%      +6.3       13.51 ± 11%      +6.5       13.72 ±  7%  perf-profile.children.cycles-pp.kmalloc_reserve
      6.49 ±  5%      +6.3       12.80 ± 11%      +6.5       13.03 ±  7%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
     10.87 ±  8%      +9.4       20.22 ± 13%      +9.8       20.71 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      8.27 ± 11%     +10.0       18.23 ± 13%     +10.4       18.70 ±  7%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      5.78            -1.5        4.27 ±  5%      -1.6        4.21 ±  4%  perf-profile.self.cycles-pp.kmem_cache_free
      5.20 ±  2%      -1.1        4.08 ±  4%      -1.2        4.04 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      5.08 ±  3%      -0.9        4.17 ±  2%      -0.9        4.21 ±  4%  perf-profile.self.cycles-pp.copyout
      4.80            -0.9        3.92 ±  3%      -0.9        3.91 ±  3%  perf-profile.self.cycles-pp.unix_stream_read_generic
      3.31 ±  2%      -0.8        2.49 ±  5%      -0.8        2.49 ±  4%  perf-profile.self.cycles-pp.skb_set_owner_w
      3.80 ±  2%      -0.7        3.06 ±  4%      -0.8        3.05 ±  4%  perf-profile.self.cycles-pp.sock_wfree
      3.10 ±  2%      -0.6        2.48 ±  5%      -0.6        2.45 ±  5%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      3.42 ±  2%      -0.6        2.83 ±  4%      -0.6        2.80 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      2.65 ±  2%      -0.6        2.09 ±  5%      -0.6        2.08 ±  3%  perf-profile.self.cycles-pp.__kmem_cache_free
      2.12 ±  4%      -0.5        1.62 ±  7%      -0.5        1.60 ±  6%  perf-profile.self.cycles-pp.sock_def_readable
      3.35            -0.3        3.09 ±  5%      -0.3        3.05 ±  4%  perf-profile.self.cycles-pp.check_heap_object
      3.13            -0.2        2.88            -0.3        2.88 ±  2%  perf-profile.self.cycles-pp.__slab_free
      1.75            -0.2        1.52 ±  2%      -0.2        1.53        perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.87            -0.2        0.68 ±  4%      -0.2        0.67 ±  3%  perf-profile.self.cycles-pp.__build_skb_around
      1.48            -0.2        1.29 ±  3%      -0.2        1.30 ±  4%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      1.16            -0.2        0.98 ±  2%      -0.2        0.97 ±  4%  perf-profile.self.cycles-pp.skb_release_data
      1.01 ±  7%      -0.1        0.88 ±  4%      -0.1        0.88 ±  4%  perf-profile.self.cycles-pp.copyin
      0.59 ±  7%      -0.1        0.48 ±  5%      -0.1        0.48 ±  5%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      1.03            -0.1        0.94 ±  2%      -0.1        0.94 ±  3%  perf-profile.self.cycles-pp.__alloc_skb
      0.96            -0.1        0.88 ±  3%      -0.1        0.87 ±  2%  perf-profile.self.cycles-pp.aa_sk_perm
      0.42 ±  3%      -0.1        0.34 ±  4%      -0.1        0.34 ±  4%  perf-profile.self.cycles-pp.task_mm_cid_work
      1.93            -0.1        1.86 ±  2%      -0.1        1.86 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      0.82            -0.1        0.75 ±  2%      -0.1        0.75 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      1.06 ±  3%      -0.1        0.99 ±  4%      -0.1        0.97 ±  2%  perf-profile.self.cycles-pp.__fget_light
      0.10 ± 44%      -0.1        0.04 ±141%      -0.1        0.05 ±123%  perf-profile.self.cycles-pp.perf_tp_event
      0.48 ±  4%      -0.1        0.42 ±  6%      -0.0        0.43        perf-profile.self.cycles-pp.__virt_addr_valid
      0.82 ±  3%      -0.1        0.76 ±  3%      -0.0        0.77 ±  2%  perf-profile.self.cycles-pp.__libc_read
      1.09            -0.1        1.03 ±  2%      -0.1        1.03 ±  2%  perf-profile.self.cycles-pp.vfs_write
      0.41            -0.1        0.36 ±  2%      -0.1        0.36 ±  2%  perf-profile.self.cycles-pp.mutex_unlock
      0.54 ±  2%      -0.0        0.50 ±  3%      -0.1        0.48 ±  3%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      1.15            -0.0        1.10 ±  2%      -0.0        1.10 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.93            -0.0        0.89            -0.0        0.88 ±  2%  perf-profile.self.cycles-pp.sock_write_iter
      0.79 ±  2%      -0.0        0.75 ±  6%      -0.0        0.74        perf-profile.self.cycles-pp.__libc_write
      0.06 ± 45%      -0.0        0.02 ±141%      -0.0        0.03 ±136%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.41 ±  4%      -0.0        0.37 ±  2%      -0.0        0.37 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.42            -0.0        0.39 ±  2%      -0.0        0.38 ±  3%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.67 ±  2%      -0.0        0.64 ±  4%      -0.0        0.64 ±  3%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.59 ±  2%      -0.0        0.55 ± 16%      -0.0        0.55 ± 18%  perf-profile.self.cycles-pp.__schedule
      0.47            -0.0        0.44 ±  3%      -0.0        0.45 ±  2%  perf-profile.self.cycles-pp.__entry_text_start
      0.45            -0.0        0.42            -0.0        0.43        perf-profile.self.cycles-pp.consume_skb
      0.04 ± 45%      -0.0        0.02 ±141%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.select_task_rq
      0.10 ± 69%      -0.0        0.07 ±141%      -0.0        0.05 ±122%  perf-profile.self.cycles-pp.queue_event
      0.22            -0.0        0.19 ±  4%      -0.0        0.19 ±  2%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.31 ±  2%      -0.0        0.28            -0.0        0.28        perf-profile.self.cycles-pp.aa_file_perm
      0.16 ±  3%      -0.0        0.13 ±  9%      -0.0        0.13 ±  6%  perf-profile.self.cycles-pp.task_h_load
      0.28            -0.0        0.25            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.43            -0.0        0.40 ±  2%      -0.0        0.40        perf-profile.self.cycles-pp.unix_write_space
      0.15 ± 10%      -0.0        0.13 ±  5%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.skb_unlink
      0.15            -0.0        0.13 ±  9%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp.__list_add_valid
      0.51 ±  2%      -0.0        0.49            -0.0        0.49 ±  3%  perf-profile.self.cycles-pp.__cond_resched
      0.14 ±  3%      -0.0        0.12 ±  4%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.20 ±  5%      -0.0        0.18 ±  4%      -0.0        0.17 ±  5%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.34 ±  2%      -0.0        0.32            -0.0        0.32        perf-profile.self.cycles-pp.__get_task_ioprio
      1.02            -0.0        1.00 ±  2%      -0.0        0.99        perf-profile.self.cycles-pp.vfs_read
      0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.update_process_times
      0.12 ±  3%      -0.0        0.11 ± 13%      -0.0        0.10 ± 16%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.12 ±  3%      -0.0        0.10 ± 18%      -0.0        0.11 ± 22%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.55            -0.0        0.54 ±  3%      -0.0        0.54 ±  3%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.36            -0.0        0.35 ±  4%      -0.0        0.35 ±  2%  perf-profile.self.cycles-pp.mutex_lock
      0.14 ±  4%      -0.0        0.13 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.65            -0.0        0.63            -0.0        0.63        perf-profile.self.cycles-pp.sock_read_iter
      0.20 ±  2%      -0.0        0.19 ± 16%      -0.0        0.19 ± 15%  perf-profile.self.cycles-pp.enqueue_entity
      0.23            -0.0        0.22 ±  2%      -0.0        0.22 ±  4%  perf-profile.self.cycles-pp.rcu_all_qs
      0.13 ±  3%      -0.0        0.12 ±  4%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.check_stack_object
      0.36            -0.0        0.35 ± 14%      -0.0        0.34 ± 15%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.14 ±  2%      -0.0        0.13 ±  2%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.kfree
      0.20 ±  3%      -0.0        0.20 ±  3%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.16 ±  3%      -0.0        0.15            -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.08 ± 12%      -0.0        0.07 ±  7%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.obj_cgroup_uncharge_pages
      0.12 ±  4%      -0.0        0.10 ± 22%      -0.0        0.10 ± 25%  perf-profile.self.cycles-pp.switch_fpu_return
      0.13 ±  3%      -0.0        0.12 ± 12%      -0.0        0.11 ± 17%  perf-profile.self.cycles-pp.__wake_up_common
      0.05            -0.0        0.04 ± 72%      -0.0        0.04 ± 83%  perf-profile.self.cycles-pp.update_rq_clock
      0.10 ±  5%      -0.0        0.09 ±  5%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.try_charge_memcg
      0.08 ±  4%      -0.0        0.07            -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.unix_passcred_enabled
      0.24            -0.0        0.23 ±  2%      -0.0        0.23 ±  3%  perf-profile.self.cycles-pp._copy_from_iter
      0.09 ±  6%      -0.0        0.08 ± 19%      -0.0        0.09 ± 34%  perf-profile.self.cycles-pp.prepare_task_switch
      0.05 ±  8%      -0.0        0.05 ± 47%      +0.0        0.05 ± 14%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.49            -0.0        0.48            -0.0        0.48 ±  2%  perf-profile.self.cycles-pp.__check_object_size
      0.20 ±  2%      -0.0        0.19 ±  3%      -0.0        0.19 ±  3%  perf-profile.self.cycles-pp.ksys_write
      0.23 ±  2%      -0.0        0.23 ±  2%      -0.0        0.23 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      0.50            -0.0        0.49 ±  2%      -0.0        0.49 ±  2%  perf-profile.self.cycles-pp.refill_obj_stock
      0.24 ±  3%      -0.0        0.24 ±  3%      -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.kmalloc_slab
      0.16 ±  3%      -0.0        0.15 ±  3%      -0.0        0.15 ±  5%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.15 ±  2%      -0.0        0.14 ±  3%      -0.0        0.14 ±  2%  perf-profile.self.cycles-pp.security_socket_sendmsg
      0.09 ±  4%      -0.0        0.09 ±  5%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.wait_for_unix_gc
      0.16 ±  2%      -0.0        0.16 ±  3%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      0.24 ±  2%      -0.0        0.24 ±  3%      -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.09 ±  4%      -0.0        0.08 ±  5%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.refill_stock
      0.20 ±  2%      -0.0        0.20 ±  3%      -0.0        0.20        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.16 ±  3%      -0.0        0.15 ±  3%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.scm_recv
      0.04 ± 44%      -0.0        0.04 ±101%      -0.0        0.03 ±126%  perf-profile.self.cycles-pp.reweight_entity
      0.08 ±  8%      -0.0        0.08 ± 12%      -0.0        0.08 ± 24%  perf-profile.self.cycles-pp.cpuacct_charge
      0.34 ±  2%      -0.0        0.33 ±  2%      -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.12            -0.0        0.12 ± 18%      -0.0        0.11 ± 19%  perf-profile.self.cycles-pp.schedule_timeout
      0.08 ±  4%      -0.0        0.08 ±  6%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.simple_copy_to_iter
      0.20            -0.0        0.20 ±  3%      -0.0        0.19 ±  2%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.08 ±  5%      -0.0        0.08 ± 19%      -0.0        0.08 ± 27%  perf-profile.self.cycles-pp.update_min_vruntime
      0.18 ±  2%      -0.0        0.18 ±  2%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.12 ±  3%      -0.0        0.12 ±  5%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.22 ±  2%      -0.0        0.21 ±  3%      -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.12 ±  4%      -0.0        0.11 ±  4%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.skb_queue_tail
      0.09 ±  5%      -0.0        0.09            -0.0        0.09        perf-profile.self.cycles-pp.put_pid
      0.10 ±  4%      -0.0        0.10 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.22 ±  2%      -0.0        0.21            -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.08 ±  6%      -0.0        0.08 ±  6%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.skb_release_head_state
      0.13 ±  4%      -0.0        0.13 ±  2%      -0.0        0.13 ±  6%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.12 ±  3%      -0.0        0.12 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.rw_verify_area
      0.22 ±  2%      -0.0        0.22 ± 17%      -0.0        0.22 ± 19%  perf-profile.self.cycles-pp.update_curr
      0.10 ± 18%      -0.0        0.10 ± 22%      -0.0        0.09 ± 19%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.07 ±  6%      -0.0        0.07 ± 15%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.11            +0.0        0.11 ± 10%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.kfree_skbmem
      0.14 ±  3%      +0.0        0.14 ± 25%      -0.0        0.14 ± 27%  perf-profile.self.cycles-pp.try_to_wake_up
      0.06            +0.0        0.06            +0.0        0.06        perf-profile.self.cycles-pp.skb_free_head
      0.18 ±  2%      +0.0        0.18 ±  2%      +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__x64_sys_write
      0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.wait_consider_task
      0.07 ±  5%      +0.0        0.07 ± 16%      -0.0        0.07 ± 21%  perf-profile.self.cycles-pp.dequeue_entity
      0.10            +0.0        0.10 ± 19%      -0.0        0.10 ± 20%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.12 ±  3%      +0.0        0.12 ±  6%      +0.0        0.12 ±  5%  perf-profile.self.cycles-pp.is_vmalloc_addr
      0.17 ±  2%      +0.0        0.18 ±  2%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.18 ±  2%      +0.0        0.18 ± 22%      +0.0        0.18 ± 23%  perf-profile.self.cycles-pp.__switch_to
      0.40 ±  2%      +0.0        0.40 ±  3%      +0.0        0.40 ±  3%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.09 ±  5%      +0.0        0.10 ±  7%      -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.08 ±  6%      +0.0        0.08 ± 10%      -0.0        0.08 ± 10%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.08            +0.0        0.08 ± 25%      +0.0        0.08 ± 31%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.24 ±  6%      +0.0        0.24 ± 17%      +0.0        0.24 ± 16%  perf-profile.self.cycles-pp.__switch_to_asm
      0.06 ±  7%      +0.0        0.07 ±  7%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.skb_put
      0.11 ±  4%      +0.0        0.11 ±  9%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.fsnotify_perm
      0.06 ±  7%      +0.0        0.07 ± 27%      +0.0        0.07 ± 31%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.04 ± 44%      +0.0        0.04 ± 45%      +0.0        0.04 ± 51%  perf-profile.self.cycles-pp.rb_erase
      0.52            +0.0        0.53 ±  4%      +0.0        0.53 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.19 ±  2%      +0.0        0.20 ±  2%      +0.0        0.20 ±  3%  perf-profile.self.cycles-pp.sock_recvmsg
      0.30            +0.0        0.31 ±  4%      +0.0        0.30 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.07 ±  5%      +0.0        0.08 ± 26%      +0.0        0.08 ± 31%  perf-profile.self.cycles-pp.prepare_to_wait
      0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.rcu_note_context_switch
      0.09 ±  4%      +0.0        0.10 ± 18%      +0.0        0.10 ± 21%  perf-profile.self.cycles-pp.os_xsave
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.put_prev_entity
      0.06 ±  6%      +0.0        0.07 ± 18%      +0.0        0.07 ± 21%  perf-profile.self.cycles-pp.schedule
      0.12 ±  4%      +0.0        0.14 ±  9%      +0.0        0.14 ±  6%  perf-profile.self.cycles-pp.put_cpu_partial
      0.15 ±  2%      +0.0        0.16 ± 21%      +0.0        0.16 ± 26%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.pick_next_entity
      0.46 ±  2%      +0.0        0.47 ±  2%      +0.0        0.46 ±  3%  perf-profile.self.cycles-pp.__check_heap_object
      0.12 ±  9%      +0.0        0.13 ± 34%      +0.0        0.13 ± 25%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.select_idle_sibling
      0.11 ±  6%      +0.0        0.13 ± 28%      +0.0        0.13 ± 34%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.03 ±102%      +0.0        0.03 ±123%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.04 ±101%      +0.0        0.03 ±122%  perf-profile.self.cycles-pp.intel_idle_irq
      0.00            +0.0        0.04 ±100%      +0.0        0.03 ±122%  perf-profile.self.cycles-pp.intel_idle
      0.03 ± 70%      +0.0        0.08 ± 79%      +0.1        0.09 ± 66%  perf-profile.self.cycles-pp.available_idle_cpu
      0.44            +0.1        0.50 ± 26%      +0.0        0.48 ± 27%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.36 ±  3%      +0.1        0.42 ±  7%      +0.1        0.43 ±  6%  perf-profile.self.cycles-pp.get_partial_node
      0.92            +0.1        0.98 ±  6%      +0.1        0.98 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.1        0.06 ± 79%      +0.1        0.06 ± 62%  perf-profile.self.cycles-pp.select_idle_cpu
      0.31 ±  4%      +0.1        0.43 ±  8%      +0.1        0.44 ±  7%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.40 ±  3%      +0.1        0.53 ± 42%      +0.1        0.52 ± 52%  perf-profile.self.cycles-pp.update_load_avg
      0.71 ±  3%      +0.8        1.52 ± 74%      +0.7        1.44 ± 84%  perf-profile.self.cycles-pp.update_cfs_group
      8.25 ± 11%     +10.0       18.22 ± 13%     +10.4       18.69 ±  7%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.01 ±157%   +7177.0%       0.74 ±222%     -98.0%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00          -100.0%       0.00          +4e+98%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.07 ±223%    +783.0%       0.64 ±222%     -89.8%       0.01 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.10 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1.12 ±102%     +86.3%       2.09 ± 34%    +122.9%       2.50 ± 48%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.36 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.03 ± 99%     -92.0%       0.00 ±143%    +2e+05%      64.90 ±199%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    +800.0%       0.00 ±223%    +140.0%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.44 ±156%    +136.1%       3.40 ±  5%    +106.4%       2.97 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2.66 ± 97%    +503.2%      16.06 ± 45%    +287.0%      10.30 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.01 ±223%    +982.5%       0.07 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      2.22 ±216%    +744.1%      18.72 ±223%     -46.5%       1.19 ±191%  perf-sched.sch_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.06 ±223%    +499.7%       0.36 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%  +1.1e+06%       3.76 ±169%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00         +5e+101%       0.50 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.00 ±223%   +1300.0%       0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.5e+102%       1.53 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      1.47 ±223%     -57.3%       0.63 ±222%     -99.8%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00          +5e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.45 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00       +1.6e+101%       0.16 ±223% +6.2e+100%       0.06 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.userfaultfd_set_vm_flags.dup_userfaultfd.dup_mmap
      0.82 ±223%    +183.8%       2.32 ±142%    +267.5%       3.01 ±124%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00          -100.0%       0.00       +1.6e+102%       1.59 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.00          -100.0%       0.00          +2e+98%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00          -100.0%       0.00        +1.2e+99%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.01 ±199%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +1.8e+102%       1.77 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +2.3e+102%       2.35 ±161%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.01 ±174%     -52.9%       0.00 ±223%     -61.2%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        +33812.0%       0.28 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.copy_sighand.copy_process.kernel_clone
      0.00          -100.0%       0.00       +7.2e+102%       7.23 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +4.2e+100%       0.04 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00         +8e+100%       0.08 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.62 ±112%    +252.4%       2.19 ± 50%    +278.8%       2.36 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%  +31471.2%       2.74 ±223%  +14403.8%       1.26 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.00          -100.0%       0.00          +3e+99%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.49 ±114%    +284.9%       1.90 ± 31%    +282.8%       1.89 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +6.5e+101%       0.65 ±223% +1.8e+101%       0.18 ±199%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00 ±223%    -100.0%       0.00           -85.0%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%  +17500.0%       0.09 ±223%    +580.0%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.1e+104%     113.98 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.00 ±223%    -100.0%       0.00          +140.0%       0.00 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
     15.56 ±150%     +13.8%      17.70 ± 24%    +351.5%      70.27 ±138%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      6.45 ±217%     -32.5%       4.35 ±131%     +69.9%      10.96 ±145%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.29 ±223%     -65.1%       0.45 ± 93%   +2827.9%      37.82 ±197%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      0.32 ±132%    +747.3%       2.67 ± 51%    +267.2%       1.16 ± 89%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      3.05 ±223%     -98.7%       0.04 ±182%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +7.2e+100%       0.07 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.37 ±113%    +964.0%       3.89 ± 89%    +122.1%       0.81 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.02 ±156%    +884.4%       0.15 ±223%   +2332.0%       0.36 ±196%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.44 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.00 ±223%   +8470.0%       0.14 ±200%      -4.0%       0.00 ±145%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.25 ±222%     -84.4%       0.19 ±129%     -61.3%       0.48 ±112%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     69.72 ±222%    -100.0%       0.03 ±223%     -96.9%       2.13 ±117%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.16 ±211%     +96.4%       0.31 ±164%     -40.6%       0.09 ±182%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.39 ± 84%   +1024.5%      15.63 ± 37%   +1524.6%      22.58 ± 63%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.75 ± 76%   +1937.6%      15.34 ± 79%   +1363.8%      11.02 ± 71%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±125%     +46.0%       0.01 ±223%     -52.0%       0.00 ±176%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.85 ±172%    +171.2%       7.72 ± 68%    +469.9%      16.23 ± 89%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.16 ±123%   +1748.4%       2.96 ±117%    +238.3%       0.54 ±123%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      5.77 ± 85%    +103.9%      11.77 ± 22%    +104.9%      11.83 ± 11%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.54 ± 85%    +244.9%       1.87 ± 16%    +235.3%       1.81 ± 31%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.01 ±223%   +9651.7%       1.45 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      0.10 ± 78%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     22.92 ±131%     -71.5%       6.54 ±101%     -12.2%      20.12 ±116%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     21.91 ±223%      -6.7%      20.45 ±122%     -79.7%       4.45 ± 68%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      0.14 ± 74%    +562.8%       0.94 ±183%    +198.6%       0.42 ±188%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.29 ±185%     -96.1%       0.01 ± 48%     -94.6%       0.02 ± 26%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    106.82 ±142%     -76.0%      25.69 ±222%     -80.4%      20.98 ±191%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00        +2.6e+99%       0.00 ±200%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.01 ±217%    -100.0%       0.00           +27.0%       0.02 ±200%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.00 ±115%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      0.12 ±189%  +10355.7%      12.08 ±222%  +53447.2%      61.85 ±200%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±143%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.03 ± 97%    +152.4%       0.08 ±118%  +12414.7%       3.90 ±199%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     13.98 ±223%     -99.9%       0.01 ± 13%     -99.9%       0.01 ± 10%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      6.20 ± 75%     +91.5%      11.87 ± 47%    +309.9%      25.40 ± 96%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.44 ± 72%    +256.3%       8.71 ± 25%    +289.0%       9.50 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.10 ± 83%    +184.7%       3.14 ± 19%    +208.2%       3.40 ± 35%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.33 ±208%    +275.3%       1.24 ±221%     +99.7%       0.66 ±196%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    133.81 ±141%     -99.8%       0.24 ±223%     -98.7%       1.71 ±129%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.54 ±214%    +408.9%       2.77 ±201%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3.79 ±117%    +528.5%      23.83 ±105%    +426.9%      19.98 ±144%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.14 ±158%   +2667.4%       3.98 ±222%     -98.2%       0.00 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00          -100.0%       0.00          +8e+98%       0.00 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.34 ±223%     +87.5%       0.64 ±222%     -93.5%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.65 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1228 ± 93%      -7.4%       1137 ± 39%     +60.1%       1967 ± 70%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.08 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.65 ±110%     -96.1%       0.03 ±160%  +49565.1%     324.56 ±199%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.10 ±145%    +194.9%       0.29 ±214%     -17.5%       0.08 ±171%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    625.66 ±199%     +64.6%       1029 ± 29%      -8.4%     573.27 ± 52%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    941.66 ± 78%    +178.2%       2619 ± 21%    +165.4%       2499 ± 38%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.02 ±223%    +260.8%       0.07 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
     70.12 ±212%     +51.1%     105.92 ±223%     -75.2%      17.36 ±195%  perf-sched.sch_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.59 ±223%    +690.7%       4.65 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%  +1.1e+06%       3.76 ±169%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00         +5e+101%       0.50 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.00 ±223%    +685.7%       0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.5e+102%       1.53 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
     30.86 ±223%     -67.5%      10.03 ±223%     -99.9%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +5.4e+100%       0.05 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      1.34 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00         +8e+101%       0.80 ±223% +6.2e+100%       0.06 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.userfaultfd_set_vm_flags.dup_userfaultfd.dup_mmap
      4.09 ±223%    +387.7%      19.96 ±136%    +571.1%      27.46 ±149%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00          -100.0%       0.00       +3.2e+102%       3.19 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.00          -100.0%       0.00        +1.2e+99%       0.00 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00          -100.0%       0.00        +1.2e+99%       0.00 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.02 ±171%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +5.3e+102%       5.32 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +9.4e+102%       9.38 ±161%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.15 ±196%     -87.7%       0.02 ±223%     -80.4%       0.03 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        +33812.0%       0.28 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.copy_sighand.copy_process.kernel_clone
      0.00          -100.0%       0.00       +2.9e+103%      28.93 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +4.2e+100%       0.04 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00       +4.8e+101%       0.48 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
    624.75 ±118%    +119.9%       1373 ± 75%     +94.4%       1214 ± 78%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%  +31471.2%       2.74 ±223%  +28905.4%       2.51 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.00          -100.0%       0.00       +1.2e+100%       0.01 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
    113.31 ±164%    +511.1%     692.48 ± 32%    +485.2%     663.04 ± 47%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +6.5e+101%       0.65 ±223% +1.8e+101%       0.18 ±193%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00 ±223%    -100.0%       0.00           -70.0%       0.00 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.02 ±223%   +3059.8%       0.62 ±223%     -21.0%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.1e+104%     113.98 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00            -6.3%       0.01 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      1312 ±104%     -68.1%     419.35 ± 65%     -25.8%     974.56 ± 57%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     25.63 ±218%     -25.1%      19.21 ±103%     +64.0%      42.03 ± 97%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     12.42 ±223%     -70.2%       3.70 ± 86%   +3850.4%     490.54 ±197%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     36.52 ±137%   +1666.2%     645.04 ± 66%    +495.3%     217.43 ± 98%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     45.78 ±223%     -99.3%       0.33 ±182%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +2.1e+101%       0.21 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
     49.98 ±111%   +1263.8%     681.67 ±102%     +37.1%      68.52 ± 67%  perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.23 ±178%   +1143.8%       2.80 ±223%   +1742.3%       4.15 ±197%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.45 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.09 ±210%   +5466.4%       4.89 ±206%     -65.4%       0.03 ±124%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.25 ±222%     -77.2%       0.28 ±143%     -59.9%       0.50 ±111%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    696.86 ±222%    -100.0%       0.06 ±223%     -99.7%       2.18 ±112%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.31 ±216%     +28.1%       0.40 ±135%     -69.5%       0.09 ±182%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    698.60 ±110%    +108.6%       1457 ± 61%    +175.7%       1925 ± 32%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     95.16 ± 93%    +995.8%       1042 ± 83%    +416.4%     491.38 ± 65%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.29 ±130%     +14.5%       0.33 ±223%     -84.1%       0.05 ±123%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    178.31 ±206%    +188.7%     514.72 ± 81%    +624.5%       1291 ±106%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     19.65 ±139%    +414.3%     101.08 ±145%     -72.5%       5.40 ±119%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1070 ± 94%     +51.5%       1621 ± 22%     +41.1%       1511 ± 44%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2308 ± 72%     +70.2%       3930 ± 11%     +63.0%       3762 ± 39%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.01 ±223%   +9651.7%       1.45 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      2.56 ±166%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      1723 ± 99%     -10.9%       1535 ±134%      -9.1%       1565 ± 97%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     87.59 ±223%    +542.6%     562.84 ±137%      +8.7%      95.22 ± 83%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
     14.77 ±165%     -86.6%       1.97 ±162%     -96.9%       0.46 ±171%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.23 ±213%     -99.6%       0.01 ± 58%     -99.5%       0.02 ± 23%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      1330 ±141%     -96.1%      51.64 ±221%     -95.3%      63.01 ±191%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00          -100.0%       0.00        +2.6e+99%       0.00 ±200%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.03 ±214%    -100.0%       0.00           +40.7%       0.04 ±200%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.00 ±118%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.97 ±159%   +5136.6%     155.69 ±223%  +24861.7%     742.15 ±200%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±147%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.25 ±139%    +178.8%       0.70 ±125%   +4544.2%      11.70 ±199%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     83.85 ±223%    -100.0%       0.02 ± 33%    -100.0%       0.01 ± 28%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      1152 ± 86%     +17.1%       1350 ± 60%     +67.1%       1925 ± 52%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    810.39 ± 72%    +119.9%       1781 ± 21%    +164.8%       2145 ± 38%  perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2251 ± 73%     +60.1%       3605 ± 15%     +54.6%       3479 ± 44%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    193.53 ±220%     +54.1%     298.18 ±223%      +6.3%     205.81 ±199%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      1329 ±141%    -100.0%       0.48 ±223%     -99.8%       2.19 ±140%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      3.71 ±219%    +173.1%      10.14 ±199%    -100.0%       0.00        perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1485 ±118%     +75.0%       2599 ± 52%     -25.2%       1111 ±122%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      1.03 ± 84%    +246.0%       3.55 ± 18%    +264.8%       3.74 ± 27%  perf-sched.total_sch_delay.average.ms
      2527 ± 72%     +69.8%       4291 ± 18%     +61.9%       4093 ± 27%  perf-sched.total_sch_delay.max.ms
      4.29 ± 80%    +195.8%      12.70 ± 16%    +208.8%      13.26 ± 26%  perf-sched.total_wait_and_delay.average.ms
   2044832 ± 85%     +15.6%    2363513 ± 19%     +18.8%    2430279 ± 33%  perf-sched.total_wait_and_delay.count.ms
      4763 ± 73%     +72.4%       8212 ± 11%     +72.2%       8202 ± 27%  perf-sched.total_wait_and_delay.max.ms
      3.27 ± 80%    +180.0%       9.15 ± 16%    +191.3%       9.51 ± 26%  perf-sched.total_wait_time.average.ms
      3235 ± 70%     +66.9%       5398 ± 17%     +69.8%       5492 ± 13%  perf-sched.total_wait_time.max.ms
      1.43 ±223%    +187.5%       4.11 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     12.32 ±223%    -100.0%       0.00           -77.9%       2.72 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     13.18 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      2.47 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.58 ±223%   +1540.6%      25.86 ±223%   +8137.9%     129.83 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
     10.78 ± 71%     +87.5%      20.21 ± 28%     +70.9%      18.42 ± 65%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.62 ±223%    +222.3%       8.45 ± 71%     +97.0%       5.16 ±124%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     11.90 ± 83%    +319.8%      49.94 ± 34%    +284.5%      45.74 ± 33%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      4.50 ±223%    +739.6%      37.74 ±223%     -47.6%       2.35 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +2.9e+102%       2.90 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      3.03 ±223%    +626.2%      22.04 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00          -100.0%       0.00         +2e+104%     203.87 ±199%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00          -100.0%       0.00       +1.8e+102%       1.76 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      4.88 ±187%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00       +1.8e+102%       1.78 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.7e+102%       1.73 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +4.6e+103%      45.91 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
     37.98 ±177%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00          -100.0%       0.00       +7.2e+102%       7.23 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      1.07 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      4.34 ±120%     -47.4%       2.28 ±223%      +2.2%       4.44 ±130%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +2.7e+102%       2.74 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      3.09 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      1.74 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00          -100.0%       0.00       +2.5e+104%     253.89 ±199%  perf-sched.wait_and_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +2.3e+104%     230.51 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
    183.84 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     34.77 ±134%     +41.6%      49.22 ± 22%    +364.8%     161.59 ±144%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.84 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      6.29 ±223%     -54.7%       2.85 ±223%     +35.7%       8.54 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.88 ±223%    +146.4%       7.10 ±223%   +2507.2%      75.17 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      2.91 ±223%     -17.2%       2.41 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      8.23 ±164%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.2e+103%      11.69 ±101% +3.2e+102%       3.17 ±200%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    337.44 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     19.32 ±212%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    417.87 ±222%     +19.8%     500.43 ±152%     -28.1%     300.29 ±133%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    135.47 ±140%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    750.58 ±142%     -37.1%     472.40 ±116%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     10.22 ± 85%    +445.2%      55.73 ± 31%    +947.7%     107.10 ±111%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      5.42 ±119%    +921.9%      55.34 ± 46%    +806.6%      49.09 ± 84%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      6.16 ±118%    +480.3%      35.75 ± 25%    +707.3%      49.73 ± 60%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00         +1e+103%      10.48 ±103%   +1e+103%       9.97 ± 91%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     20.62 ± 82%    +109.6%      43.23 ± 23%    +108.7%      43.05 ± 11%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.07 ± 80%    +221.0%       6.66 ± 14%    +218.8%       6.61 ± 28%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    140.85 ±118%     -64.8%      49.63 ± 64%     -29.5%      99.31 ±101%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     53.08 ±223%     -18.2%      43.42 ±125%     -84.0%       8.51 ±122%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      3.97 ±141%   +1790.8%      75.14 ±142%  +16275.4%     650.73 ±181%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    193.74 ± 71%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    309.14 ±105%     +27.3%     393.45 ± 80%    +103.4%     628.77 ± 68%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     15.08 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      1.06 ±223%   +2310.1%      25.50 ±223%  +12976.7%     138.37 ±200%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +7.8e+103%      78.37 ±216% +5.7e+103%      56.51 ± 85%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    901.76 ± 73%     -20.5%     716.69 ± 61%     +19.6%       1078 ± 38%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     16.69 ± 73%     +75.5%      29.30 ± 51%    +262.9%      60.57 ± 88%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     16.73 ± 72%     +88.0%      31.45 ± 22%    +101.0%      33.63 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3.93 ± 79%    +177.4%      10.90 ± 18%    +199.8%      11.77 ± 35%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    633.44 ± 79%      -6.2%     594.26 ± 18%     -11.4%     561.37 ± 13%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    199.31 ±148%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00       +2.5e+102%       2.54 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    306.11 ± 71%    +109.5%     641.23 ± 17%     +89.5%     579.99 ± 15%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.67 ±223%    +775.0%       5.83 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1.67 ±223%    -100.0%       0.00           -88.0%       0.20 ±200%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      2.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
    933.50 ±147%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      5.17 ±223%     -58.1%       2.17 ±223%     -80.6%       1.00 ±200%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    174.33 ± 73%     +54.2%     268.83 ± 26%      -2.8%     169.40 ± 56%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    209.50 ±223%    +567.4%       1398 ± 77%    +306.3%     851.20 ±125%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    533.17 ± 91%     +19.4%     636.67 ± 28%     +12.7%     601.00 ± 37%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     10.00 ±223%     -90.0%       1.00 ±223%     -66.0%       3.40 ±200%  perf-sched.wait_and_delay.count.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +1.7e+101%       0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      3.50 ±223%     -47.6%       1.83 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00          -100.0%       0.00         +2e+101%       0.20 ±200%  perf-sched.wait_and_delay.count.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00          -100.0%       0.00       +2.8e+102%       2.80 ±200%  perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.50 ±152%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00         +5e+101%       0.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +6.7e+101%       0.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +1.5e+102%       1.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      5.17 ±150%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00          -100.0%       0.00         +8e+101%       0.80 ±200%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
    541.83 ±112%     -54.8%     244.67 ±223%     +46.3%     792.80 ±125%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +1.7e+101%       0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      1.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     77.83 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00          -100.0%       0.00         +8e+101%       0.80 ±200%  perf-sched.wait_and_delay.count.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.7e+101%       0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.50 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
    112.83 ±100%     -63.2%      41.50 ± 37%     -48.2%      58.40 ± 88%  perf-sched.wait_and_delay.count.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.67 ±223%    +100.0%       1.33 ±223%     +50.0%       1.00 ±200%  perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.67 ±223%     +80.0%       3.00 ±223%     +56.0%       2.60 ±200%  perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     41.17 ±223%     +82.6%      75.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      5.83 ±143%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.1e+104%     108.50 ±100% +3.5e+103%      35.20 ±200%  perf-sched.wait_and_delay.count.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     13.67 ±150%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.50 ±152%     +33.3%       0.67 ±141%    +100.0%       1.00 ±126%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.83 ±100%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.67 ±141%    +100.0%       1.33 ±103%    -100.0%       0.00        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    738.17 ± 75%     -66.2%     249.83 ± 36%     -59.8%     296.60 ± 51%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    169.67 ±102%     -44.4%      94.33 ± 25%     -69.5%      51.80 ± 60%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     52.50 ±101%    +207.0%     161.17 ± 25%    +212.4%     164.00 ± 38%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00       +1.5e+103%      14.67 ±142%   +2e+103%      19.80 ±146%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    610.50 ± 71%    +282.4%       2334 ± 24%    +233.6%       2036 ± 24%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    528932 ±100%      -6.8%     492884 ± 16%      +1.2%     535264 ± 31%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     24.67 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    132.50 ±118%    +186.8%     380.00 ± 39%    +262.0%     479.60 ±136%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.67 ±223%   +1850.0%      13.00 ±109%   +1460.0%      10.40 ±122%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork
    477.00 ±145%     -99.7%       1.50 ±142%     -99.7%       1.20 ±133%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      9.33 ± 71%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      6.00 ±100%     -47.2%       3.17 ± 64%     -50.0%       3.00 ± 51%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.33 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      6.83 ±223%     -68.3%       2.17 ±223%     -64.9%       2.40 ±200%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +4.7e+102%       4.67 ±149% +8.8e+102%       8.80 ± 77%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.50 ± 73%      +4.8%       3.67 ± 56%     +20.0%       4.20 ± 27%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    208.00 ± 73%      +8.7%     226.00 ± 54%     +11.8%     232.60 ± 53%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     77040 ± 84%    +290.0%     300458 ± 28%    +247.7%     267893 ± 27%  perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   1428129 ± 83%      +8.9%    1554630 ± 21%     +13.0%    1613199 ± 35%  perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    377.83 ± 71%     -10.5%     338.17 ± 26%     -26.5%     277.80 ± 15%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
      4.83 ±100%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00         +1e+102%       1.00 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.wait_for_partner.fifo_open.do_dentry_open.do_open
    660.33 ± 71%     -46.6%     352.33 ± 26%     -47.5%     346.60 ± 55%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
      5.69 ±223%   +1786.2%     107.37 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     38.51 ±223%    -100.0%       0.00           -92.9%       2.72 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     38.99 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1688 ±153%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     42.49 ±223%    +355.4%     193.51 ±223%   +1427.3%     648.91 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    833.48 ± 71%    +114.3%       1785 ± 39%     +21.4%       1011 ± 50%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1137 ±223%     +45.7%       1657 ± 72%     -54.9%     512.98 ±126%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2109 ± 72%    +149.7%       5266 ± 21%    +137.5%       5008 ± 38%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
    140.82 ±223%     +50.7%     212.22 ±223%     -75.8%      34.10 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +2.9e+102%       2.90 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
     63.53 ±223%    +281.0%     242.03 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00          -100.0%       0.00         +2e+104%     203.87 ±199%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00          -100.0%       0.00       +2.1e+103%      21.12 ±199%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      5.59 ±165%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00       +5.3e+102%       5.32 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +6.8e+102%       6.81 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +4.1e+104%     412.86 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
    469.71 ±159%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00          -100.0%       0.00       +2.9e+103%      28.93 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      2.14 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      1257 ±115%     -61.7%     481.03 ±223%     -32.8%     845.01 ±150%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +2.7e+102%       2.74 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
     15.68 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    610.19 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00          -100.0%       0.00         +1e+105%       1015 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +2.3e+104%     230.51 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
    551.38 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      2935 ± 91%     -67.2%     962.97 ± 55%     -28.4%       2101 ± 75%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.84 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
     25.17 ±223%     -65.0%       8.80 ±223%      -3.0%      24.41 ±199%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     26.19 ±223%    +367.4%     122.42 ±223%   +3611.4%     972.07 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    534.68 ±223%     -29.1%     379.11 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
    133.51 ±155%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.4e+105%       1442 ±105% +2.7e+104%     272.96 ±200%  perf-sched.wait_and_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    672.17 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    578.84 ±204%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    834.50 ±223%     +19.9%       1000 ±152%     -28.0%     600.43 ±133%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1329 ±141%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1500 ±142%     -44.5%     833.60 ±128%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2325 ± 74%     +33.1%       3094 ± 55%     +90.5%       4428 ± 49%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1211 ±127%     +95.7%       2369 ± 65%      +2.6%       1242 ± 65%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    266.22 ±135%    +472.7%       1524 ± 37%    +917.1%       2707 ± 99%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00       +1.6e+104%     164.50 ±123%   +2e+104%     197.56 ±158%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2440 ± 76%     +43.1%       3491 ± 26%     +33.0%       3246 ± 39%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      4626 ± 72%     +71.9%       7951 ± 11%     +63.3%       7553 ± 38%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     53.25 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2977 ± 71%     +40.5%       4183 ± 32%     +21.8%       3625 ± 23%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    203.83 ±223%    +462.6%       1146 ±144%     -28.3%     146.14 ±133%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
    720.60 ±204%     -53.7%     333.35 ±141%     +94.5%       1401 ±166%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2651 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      2249 ±100%     -45.9%       1217 ±107%      -6.7%       2099 ± 78%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     30.16 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
     39.33 ±223%    +708.9%     318.16 ±223%   +4097.3%       1650 ±200%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +7.6e+104%     757.56 ±219% +4.9e+104%     492.18 ±106%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2940 ± 72%     -40.0%       1763 ± 51%      -0.6%       2923 ± 36%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      2407 ± 85%     +15.5%       2779 ± 62%     +61.9%       3897 ± 52%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1636 ± 72%    +119.1%       3585 ± 21%    +165.8%       4348 ± 37%  perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      4470 ± 73%     +62.2%       7252 ± 15%     +57.9%       7059 ± 43%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3296 ± 72%     +54.2%       5084 ± 25%     +57.9%       5205 ± 21%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      2025 ±155%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00       +9.2e+102%       9.20 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3621 ± 75%     +57.4%       5702 ± 29%     +54.9%       5611 ±  9%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.00       +1.3e+102%       1.32 ±217% +1.2e+100%       0.01 ± 85%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00        +8.2e+99%       0.01 ±192% +7.4e+100%       0.07 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      1.75 ±176%    +197.3%       5.20 ±168%     -60.9%       0.68 ± 53%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.10 ± 88%   +1050.8%       1.19 ±128%    +682.3%       0.81 ±126%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00        +2.8e+99%       0.00 ±150%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +5.1e+100%       0.05 ±211%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.allocate_slab.___slab_alloc.constprop
      0.00          -100.0%       0.00        +2.2e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00       +1.4e+100%       0.01 ±187%  +7.4e+99%       0.01 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.00        +7.2e+99%       0.01 ±145%  +9.8e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pipe_write.vfs_write.ksys_write
      0.00 ±223%    +241.7%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +2.7e+99%       0.00 ±223% +1.5e+100%       0.02 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.01 ±205%    +139.4%       0.03 ±159%     -20.6%       0.01 ±127%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00 ±223%   +1533.3%       0.02 ±141%   +3080.0%       0.03 ±124%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00       +9.2e+100%       0.09 ±220% +8.2e+100%       0.08 ±166%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.00       +7.2e+100%       0.07 ±144%  +8.4e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.01 ±159%    +216.3%       0.03 ±160%     -46.1%       0.00 ±129%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.31 ±203%    +107.2%       0.63 ± 61%    +981.0%       3.31 ± 89%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.1e+101%       0.11 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__fput.task_work_run.do_exit.do_group_exit
      0.01 ±223%    +435.7%       0.04 ±130%     -17.1%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +4.8e+100%       0.05 ±110% +4.7e+100%       0.05 ±117%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.03 ±150%   +4450.9%       1.28 ±142%   +1767.5%       0.53 ±167%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.00       +7.5e+101%       0.75 ±222% +1.4e+101%       0.14 ±181%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.perf_read.vfs_read
      0.00        +5.8e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±155%     -85.4%       0.00 ±223%     +62.5%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.00        +8.3e+99%       0.01 ±179%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
     12.25 ±223%     -90.9%       1.12 ±164%     -77.1%       2.80 ±192%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     13.08 ±223%    -100.0%       0.00          -100.0%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.01 ± 90%    +591.6%       0.10 ±198%     -16.1%       0.01 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      0.00          -100.0%       0.00       +5.9e+100%       0.06 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.seq_read_iter.vfs_read
      3.12 ± 83%     +95.9%       6.11 ± 33%    +113.4%       6.66 ± 44%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00        +1.5e+99%       0.00 ±223%  +2.6e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.01 ±121%   +4656.4%       0.31 ± 97%  +16201.5%       1.06 ±188%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00 ±223%      -8.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.02 ±134%     +44.2%       0.02 ±208%     -65.9%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      1.82 ±188%   +1329.6%      26.06 ±221%   +3479.0%      65.24 ±198%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00          -100.0%       0.00        +1.2e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.unmap_region
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     10.78 ± 71%     +87.5%      20.20 ± 28%     +97.9%      21.33 ± 39%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.51 ±126%    +273.9%       9.37 ±  8%    +215.7%       7.92 ± 27%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      9.23 ± 80%    +266.9%      33.88 ± 30%    +283.8%      35.44 ± 37%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00          -100.0%       0.00       +8.2e+100%       0.08 ±199%  perf-sched.wait_time.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      0.01 ±113%     -29.7%       0.01 ±185%     +50.0%       0.02 ±143%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.00       +8.8e+100%       0.09 ±201% +4.5e+101%       0.45 ±189%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.04 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.03 ±146%   +1393.6%       0.43 ±191%     -73.5%       0.01 ± 94%  perf-sched.wait_time.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.01 ±223%     -31.3%       0.01 ±104%   +2694.0%       0.31 ±135%  perf-sched.wait_time.avg.ms.__cond_resched.count.constprop.0.isra
      0.02 ±183%      +0.0%       0.02 ±114%    +237.0%       0.06 ± 89%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      2.48 ±208%    +682.0%      19.39 ±218%     -34.3%       1.63 ±136%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +3.3e+100%       0.03 ±206% +1.3e+100%       0.01 ±103%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00          -100.0%       0.00       +3.9e+100%       0.04 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.open_last_lookups
      0.00        +5.8e+99%       0.01 ±223%  +8.6e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.00 ±223%     +80.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
      0.76 ±136%      -4.4%       0.73 ±152%     -94.3%       0.04 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00       +1.3e+100%       0.01 ±160%  +3.8e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.01 ±148%   +2426.7%       0.13 ±123%    +208.0%       0.02 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      0.81 ±216%    +113.9%       1.74 ±119%     -14.7%       0.69 ± 69%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00          -100.0%       0.00        +1.6e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.08 ±102%    +344.9%       0.36 ±139%     -23.6%       0.06 ±165%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.05 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+102%       1.08 ±222% +2.6e+100%       0.03 ±164%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.00       +1.3e+100%       0.01 ±194%  +1.6e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.00          -100.0%       0.00        +4.2e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00       +1.3e+100%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00       +9.5e+101%       0.95 ±215%  +1.6e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00        +5.3e+99%       0.01 ±141% +2.8e+100%       0.03 ±163%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.rmap_walk_anon.migrate_pages_batch.migrate_pages
      0.00 ±141%    +505.3%       0.02 ±139%    +790.5%       0.03 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00 ±223%    +742.9%       0.01 ±142%     +54.3%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00        +4.5e+99%       0.00 ±158% +5.7e+100%       0.06 ±164%  perf-sched.wait_time.avg.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.00          -100.0%       0.00        +7.4e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00       +1.3e+100%       0.01 ±206% +6.1e+100%       0.06 ±182%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.00        +1.7e+99%       0.00 ±223% +5.1e+100%       0.05 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223% +6.6e+100%       0.07 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.00          +1e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +2.7e+99%       0.00 ±223% +6.2e+100%       0.06 ±184%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.00 ±223%   +1214.3%       0.02 ±223%   +1940.0%       0.02 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
      1.65 ±210%   +1257.8%      22.37 ±219%     -85.4%       0.24 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +4.1e+101%       0.41 ±223%  +9.4e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.01 ±127%   +8574.0%       1.11 ±204%   +1396.1%       0.19 ± 98%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.62 ±204%     -76.7%       0.14 ± 50%     -71.1%       0.18 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.04 ±109%    +847.7%       0.37 ±125%  +5.2e+05%     203.84 ±199%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%     +75.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.00       +2.7e+100%       0.03 ±201%  +2.6e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +1.3e+100%       0.01 ±199% +6.8e+100%       0.07 ±184%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +1.1e+101%       0.11 ±199%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.00       +1.3e+100%       0.01 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.04 ±170%   +1780.0%       0.69 ± 98%   +1064.0%       0.43 ±160%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00        +9.8e+99%       0.01 ±178% +1.1e+100%       0.01 ± 95%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.00 ±150%   +1575.0%       0.06 ±100%   +4934.0%       0.17 ±131%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00         +1e+100%       0.01 ±197%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00        +5.8e+99%       0.01 ±159% +5.3e+101%       0.53 ±162%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.00       +1.3e+100%       0.01 ±141% +1.3e+101%       0.13 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +2.6e+100%       0.03 ±145%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.34 ±174%     -87.1%       0.04 ±148%     -89.7%       0.03 ±165%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      4.88 ±186%     -88.0%       0.59 ±159%     -54.6%       2.22 ±107%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00        +1.2e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.dcache_dir_close.__fput.task_work_run
      0.00        +6.7e+99%       0.01 ±223% +3.4e+100%       0.03 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.01 ±159%     -11.4%       0.01 ±121%    +266.9%       0.02 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.19 ±121%     -65.4%       0.06 ± 96%     -55.4%       0.08 ±147%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +4.1e+100%       0.04 ±145%    +7e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
      0.06 ±160%    -100.0%       0.00          +376.1%       0.27 ±151%  perf-sched.wait_time.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00 ±141%    +790.5%       0.03 ± 82%  +42437.1%       1.49 ±190%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00 ±223%   +1133.3%       0.02 ±175%   +2153.3%       0.03 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%   +3008.3%       0.06 ±137%    +180.0%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.01 ±159%    +923.7%       0.06 ±103%   +2571.6%       0.17 ±140%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00          -100.0%       0.00          +4e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.00          -100.0%       0.00       +1.4e+102%       1.38 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
      0.27 ±130%  +16951.2%      46.10 ±222%      -4.7%       0.26 ± 71%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.18 ±200%     -69.8%       0.06 ±175%     -99.6%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00          -100.0%       0.00       +1.3e+100%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.load_elf_binary.search_binary_handler
      0.00       +1.7e+100%       0.02 ±165%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.00 ±223%   +2635.7%       0.06 ±162%  +32505.7%       0.76 ±168%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00        +1.3e+99%       0.00 ±223% +2.3e+101%       0.23 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
     38.16 ±176%     -95.0%       1.90 ± 93%     -92.4%       2.88 ± 72%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.01 ±142%    +438.7%       0.07 ± 72%    +503.2%       0.08 ± 86%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%   +1166.7%       0.03 ±206%   +1960.0%       0.04 ±176%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +9.5e+99%       0.01 ±223%  +6.6e+99%       0.01 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.alloc_pid.copy_process.kernel_clone
      0.00       +7.3e+101%       0.73 ±218% +2.4e+101%       0.24 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00          -100.0%       0.00       +2.3e+100%       0.02 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.1e+100%       0.01 ±127%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.00 ±223%    +528.0%       0.03 ± 80%    +850.4%       0.04 ±118%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.00       +2.8e+100%       0.03 ±142% +4.8e+100%       0.05 ±161%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00        +8.8e+99%       0.01 ±194%  +9.6e+99%       0.01 ±133%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00        +3.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.05 ±223%     -98.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.01 ±147%    +500.0%       0.03 ±178%    +117.5%       0.01 ± 91%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00 ±223%   +1525.0%       0.03 ±110%    +230.0%       0.01 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.05 ±188%    +129.7%       0.12 ±204%     -94.9%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +3.7e+100%       0.04 ±178%  +7.2e+99%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.01 ±223%   +8138.7%       0.43 ±198%    +658.7%       0.04 ± 99%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.03 ±205%    +136.9%       0.06 ±104%    +517.6%       0.16 ±115%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      1.07 ±223%     -99.4%       0.01 ±190%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.00        +8.5e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00          +1e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      4.68 ± 97%     +60.4%       7.51 ± 29%     +74.4%       8.17 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.08 ±198%     -96.3%       0.00 ±223%     -72.1%       0.02 ±171%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00       +1.8e+100%       0.02 ±131% +9.4e+100%       0.09 ± 93%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±182%     -18.5%       0.01 ±158%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.00        +2.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.02 ±223%     -61.2%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      1.19 ±215%     -88.4%       0.14 ±223%     -94.1%       0.07 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.01 ±170%     +12.2%       0.01 ±179%    +142.4%       0.02 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.04 ±106%     -55.4%       0.02 ±136%   +1637.3%       0.65 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.00        +1.8e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.kernfs_fop_open.do_dentry_open.do_open
      0.00       +3.4e+101%       0.34 ±222%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.kernfs_seq_start.seq_read_iter.vfs_read
      0.15 ±180%    +384.4%       0.71 ±101%    +174.6%       0.40 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.00       +4.3e+100%       0.04 ±183%  +1.4e+99%       0.00 ±199%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.02 ±194%     -88.6%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
      3.86 ±175%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00          +3e+99%       0.00 ±142%  +3.4e+99%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00        +8.3e+98%       0.00 ±223% +1.4e+100%       0.01 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00         +4e+100%       0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
      2.07 ±148%    +130.3%       4.76 ± 15%    +122.0%       4.58 ± 37%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±143%      +6.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.01 ±151%    +402.7%       0.06 ±155%    +225.5%       0.04 ±129%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±150%     +73.0%       0.01 ±117%     -54.6%       0.00 ±124%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.51 ±198%     +57.8%       0.81 ±189%  +49565.5%     255.20 ±198%  perf-sched.wait_time.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00         +2300.0%       0.04 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±136%  +3.5e+05%     116.55 ±223%   +1374.5%       0.50 ±191%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.14 ±127%     -98.8%       0.00 ±223%     -48.6%       0.07 ±195%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
    183.86 ±223%    -100.0%       0.01 ±173%    -100.0%       0.08 ±176%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.14 ± 98%     -25.4%       0.10 ±130%      -5.9%       0.13 ±146%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.01 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
     19.20 ±123%     +64.1%      31.52 ± 26%    +386.4%      93.40 ±143%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.00       +4.5e+100%       0.04 ± 93%   +2e+100%       0.02 ± 79%  perf-sched.wait_time.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      2.85 ±222%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±179%  +52754.5%       0.97 ±153%  +25645.5%       0.47 ±120%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.04 ±206%     -63.1%       0.01 ±223%     +47.5%       0.05 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%     +72.7%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.02 ±144%      +4.3%       0.02 ±184%     -54.0%       0.01 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      1.74 ±200%    +460.9%       9.78 ±148%   +2183.2%      39.80 ±187%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      3.51 ±165%     +69.9%       5.96 ± 27%     +67.0%       5.86 ± 69%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      5.37 ±137%     -81.3%       1.01 ±143%     -95.3%       0.25 ± 74%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00        +7.7e+99%       0.01 ±163% +1.9e+100%       0.02 ±135%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00        +5.8e+99%       0.01 ±175% +2.6e+100%       0.03 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.02 ±223%     -86.1%       0.00 ±223%    +420.7%       0.10 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.02 ±112%     +65.5%       0.04 ±134%    +293.9%       0.10 ±190%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.02 ±156%   +1404.1%       0.24 ±150%    +323.1%       0.07 ±116%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.00       +1.7e+100%       0.02 ±202%    +5e+99%       0.00 ±140%  perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.90 ± 92%    +271.3%      10.76 ± 65%    +107.4%       6.01 ± 84%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.15 ±143%    +248.7%       0.51 ±175%    +344.6%       0.65 ± 79%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    337.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.03 ±142%    +116.0%       0.07 ±100%     +57.1%       0.05 ±139%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     19.42 ±210%     -91.2%       1.71 ±201%     -98.6%       0.28 ± 61%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    416.63 ±223%     +20.1%     500.33 ±152%     -28.0%     300.05 ±133%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     66.63 ±213%     -99.2%       0.50 ±141%     -99.4%       0.43 ±200%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    750.42 ±142%     -37.1%     472.35 ±116%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      8.83 ± 87%    +354.0%      40.10 ± 36%    +857.0%      84.51 ±124%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      5.34 ±109%    +649.1%      39.99 ± 39%    +659.4%      40.54 ± 77%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.32 ±109%     -65.3%       0.11 ± 73%     -21.2%       0.25 ± 89%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      4.83 ± 71%    +480.5%      28.03 ± 21%    +593.9%      33.50 ± 52%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.78 ±104%   +1138.9%       9.62 ± 77%   +1310.0%      10.95 ± 70%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     14.85 ± 82%    +111.8%      31.46 ± 24%    +110.2%      31.22 ± 11%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.53 ± 79%    +212.5%       4.79 ± 14%    +213.0%       4.80 ± 27%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00       +1.3e+100%       0.01 ±145% +1.1e+100%       0.01 ±200%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      3.26 ± 86%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    117.93 ±116%     -63.5%      43.09 ± 66%     -32.8%      79.19 ±116%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00          -100.0%       0.00         +9e+101%       0.90 ±200%  perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     32.77 ±210%     -18.3%      26.76 ± 99%     -72.1%       9.15 ± 37%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      5.48 ± 89%   +1270.2%      75.07 ±142%  +11777.8%     650.73 ±181%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    193.46 ± 71%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    203.12 ± 99%     +81.1%     367.80 ± 92%    +199.2%     607.80 ± 68%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±223%   +4810.7%       0.61 ±223%    +119.2%       0.03 ±200%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
     15.30 ±219%     -98.8%       0.18 ±223%     -95.5%       0.69 ±199%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.13 ±133%     +93.3%       0.25 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.14 ±127%    +540.9%      13.74 ±218%   +3472.5%      76.61 ±199%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.12 ±145%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      0.01 ±142%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.87 ±131%   +9438.8%      82.89 ±201%   +6172.5%      54.51 ± 86%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    887.78 ± 73%     -19.3%     716.68 ± 61%     +21.5%       1078 ± 38%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.76 ±219%    -100.0%       0.00           -48.8%       0.39 ±200%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     10.49 ± 72%     +77.2%      18.60 ± 38%    +235.1%      35.17 ± 83%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     14.29 ± 72%     +59.2%      22.75 ± 21%     +68.8%      24.12 ±  7%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2.82 ± 78%    +174.5%       7.75 ± 18%    +196.4%       8.37 ± 36%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    633.11 ± 79%      -6.3%     593.03 ± 18%     -11.4%     560.71 ± 13%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
     66.39 ±213%     -99.7%       0.20 ±188%     -98.7%       0.86 ±200%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ±144%   +1518.9%       0.14 ±165%   +5934.0%       0.53 ±126%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    302.32 ± 71%    +104.2%     617.40 ± 17%     +85.2%     560.01 ± 13%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
      0.00       +2.6e+102%       2.63 ±217% +1.9e+100%       0.02 ± 92%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00        +8.2e+99%       0.01 ±192% +7.4e+100%       0.07 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
     16.86 ±104%    +999.7%     185.45 ±115%    +630.8%     123.24 ±137%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.82 ±110%    +649.0%       6.11 ±122%    +334.0%       3.54 ±123%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00        +2.8e+99%       0.00 ±150%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +5.1e+100%       0.05 ±211%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.allocate_slab.___slab_alloc.constprop
      0.00          -100.0%       0.00        +2.2e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00       +1.4e+100%       0.01 ±187%  +7.4e+99%       0.01 ±142%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.00        +7.2e+99%       0.01 ±145%  +9.8e+99%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pipe_write.vfs_write.ksys_write
      0.00 ±223%    +241.7%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +2.7e+99%       0.00 ±223% +1.9e+100%       0.02 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.01 ±205%    +163.4%       0.03 ±147%     -20.6%       0.01 ±127%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00 ±223%   +1533.3%       0.02 ±141%   +3760.0%       0.04 ±122%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00       +1.8e+101%       0.18 ±221% +8.2e+100%       0.08 ±166%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.00       +7.2e+100%       0.07 ±144% +1.5e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.01 ±159%    +226.5%       0.03 ±154%     -46.1%       0.00 ±129%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      9.21 ±222%     -18.6%       7.50 ± 73%    +247.4%      31.98 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.1e+101%       0.11 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__fput.task_work_run.do_exit.do_group_exit
      0.01 ±223%    +540.5%       0.04 ±118%     -17.1%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +5.3e+100%       0.05 ±101% +9.6e+100%       0.10 ±113%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.05 ±156%   +3296.0%       1.82 ±144%   +1035.9%       0.61 ±143%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.00       +1.5e+102%       1.45 ±222% +1.4e+101%       0.14 ±175%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.perf_read.vfs_read
      0.00        +5.8e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±155%     -85.4%       0.00 ±223%     +62.5%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.00       +1.3e+100%       0.01 ±194%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
     38.36 ±223%     -97.0%       1.13 ±161%     -92.4%       2.92 ±183%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     38.82 ±223%    -100.0%       0.00          -100.0%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.02 ±106%   +1879.8%       0.34 ±216%     +15.4%       0.02 ±123%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      0.00          -100.0%       0.00       +5.9e+100%       0.06 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.seq_read_iter.vfs_read
      1525 ± 80%     +38.2%       2108 ± 28%     +44.4%       2201 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00        +1.5e+99%       0.00 ±223%  +2.6e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.01 ±137%  +14876.5%       1.70 ±134%  +37523.5%       4.26 ±186%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00 ±223%      -8.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.02 ±132%    +111.5%       0.03 ±213%     -66.2%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
     47.35 ±196%    +311.6%     194.92 ±221%    +588.3%     325.96 ±198%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00          -100.0%       0.00        +1.2e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.unmap_region
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
    833.48 ± 71%    +114.3%       1785 ± 39%     +52.4%       1270 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    697.80 ±174%    +103.1%       1417 ± 27%     +13.6%     792.76 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1558 ± 73%     +75.1%       2728 ± 20%     +90.5%       2968 ± 46%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00          -100.0%       0.00       +8.2e+100%       0.08 ±199%  perf-sched.wait_time.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      0.02 ±141%     -41.8%       0.01 ±198%     +34.8%       0.03 ±158%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.00       +9.2e+100%       0.09 ±192% +8.6e+101%       0.86 ±186%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.04 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.07 ±187%   +2290.9%       1.57 ±210%     -82.7%       0.01 ±119%  perf-sched.wait_time.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.01 ±223%     +17.9%       0.01 ±124%   +2694.0%       0.31 ±135%  perf-sched.wait_time.max.ms.__cond_resched.count.constprop.0.isra
      0.05 ±194%     -48.2%       0.03 ±126%     +36.1%       0.07 ±107%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
     76.96 ±212%     +40.5%     108.11 ±219%     -75.1%      19.19 ±172%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +3.5e+100%       0.04 ±194%   +2e+100%       0.02 ±131%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00          -100.0%       0.00       +3.9e+100%       0.04 ±200%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.open_last_lookups
      0.00        +5.8e+99%       0.01 ±223%  +8.6e+99%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.00 ±223%     +80.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00          -100.0%       0.00       +1.1e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
      9.34 ±153%     -48.1%       4.84 ±129%     -98.5%       0.14 ± 60%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00       +1.3e+100%       0.01 ±160%  +3.8e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.01 ±160%   +2059.0%       0.14 ±110%    +136.9%       0.02 ±200%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      1.16 ±201%   +5273.2%      62.29 ±137%   +1990.6%      24.24 ± 64%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00          -100.0%       0.00        +1.6e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.25 ±111%    +386.7%       1.24 ±170%     -54.9%       0.11 ±169%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.05 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+102%       1.08 ±222% +2.6e+100%       0.03 ±164%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.00       +2.4e+100%       0.02 ±206%  +1.6e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.00          -100.0%       0.00        +4.2e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00       +2.4e+100%       0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00       +1.1e+102%       1.15 ±216%  +1.6e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00        +5.3e+99%       0.01 ±141% +3.6e+100%       0.04 ±171%  perf-sched.wait_time.max.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.rmap_walk_anon.migrate_pages_batch.migrate_pages
      0.00 ±141%   +1205.3%       0.04 ±123%   +4662.1%       0.15 ±199%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00 ±223%   +1028.6%       0.01 ±141%     +54.3%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00        +4.5e+99%       0.00 ±158% +5.8e+100%       0.06 ±163%  perf-sched.wait_time.max.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.00          -100.0%       0.00        +7.4e+99%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00       +1.8e+100%       0.02 ±211% +1.2e+101%       0.12 ±185%  perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.00          +2e+99%       0.00 ±223% +5.1e+100%       0.05 ±179%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223% +1.1e+101%       0.11 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.00          +1e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +2.7e+99%       0.00 ±223% +6.4e+100%       0.06 ±184%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00        +1.7e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.00 ±223%   +1214.3%       0.02 ±223%   +1940.0%       0.02 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
     33.89 ±214%    +622.5%     244.81 ±220%     -97.1%       0.98 ±128%  perf-sched.wait_time.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +4.1e+101%       0.41 ±223%  +9.4e+99%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.01 ±116%  +22596.5%       3.25 ±208%   +7119.5%       1.03 ±126%  perf-sched.wait_time.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      1.93 ±197%     -81.5%       0.36 ± 58%     -89.1%       0.21 ± 94%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.18 ±110%    +665.9%       1.40 ±145%  +1.1e+05%     203.86 ±199%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%     +75.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.00       +2.7e+100%       0.03 ±201%  +2.6e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +2.3e+100%       0.02 ±208% +1.1e+101%       0.11 ±190%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +1.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          -100.0%       0.00       +1.1e+101%       0.11 ±199%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.00       +1.3e+100%       0.01 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.07 ±178%   +6706.2%       4.76 ± 85%   +1669.4%       1.24 ±124%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00        +9.8e+99%       0.01 ±178% +1.2e+100%       0.01 ± 91%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.00 ±150%   +2935.0%       0.10 ±117%   +5348.0%       0.18 ±118%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00       +1.1e+100%       0.01 ±200%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          +9e+99%       0.01 ±178%   +1e+102%       1.04 ±163%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.00       +1.4e+100%       0.01 ±141% +3.9e+101%       0.39 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +2.6e+100%       0.03 ±145%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.63 ±136%     -89.2%       0.07 ±128%     -84.1%       0.10 ±182%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      5.59 ±164%     -74.8%       1.41 ±130%     +91.7%      10.72 ± 88%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00        +1.2e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.dcache_dir_close.__fput.task_work_run
      0.00        +6.7e+99%       0.01 ±223% +3.7e+100%       0.04 ±118%  perf-sched.wait_time.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.01 ±159%     -11.4%       0.01 ±121%    +815.4%       0.05 ±167%  perf-sched.wait_time.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.52 ±136%     -74.8%       0.13 ±141%     -83.9%       0.08 ±147%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +4.1e+100%       0.04 ±145%    +7e+99%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
      0.07 ±171%    -100.0%       0.00          +558.9%       0.48 ±171%  perf-sched.wait_time.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00 ±141%   +1354.2%       0.06 ± 92%  +39905.0%       1.60 ±174%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00 ±223%   +1133.3%       0.02 ±175%   +2153.3%       0.03 ±154%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%   +3100.0%       0.06 ±132%    +180.0%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.01 ±185%   +1522.5%       0.19 ±130%   +7943.4%       0.95 ±176%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00          -100.0%       0.00          +4e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.00          -100.0%       0.00       +1.4e+102%       1.38 ±200%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
      4.88 ±170%   +8376.3%     413.99 ±222%     -68.8%       1.52 ±104%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.19 ±193%     -58.5%       0.08 ±172%     -99.6%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00          -100.0%       0.00       +1.3e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.load_elf_binary.search_binary_handler
      0.00       +1.7e+100%       0.02 ±165%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.00 ±223%   +4121.4%       0.10 ±161%  +66508.6%       1.55 ±164%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00        +1.3e+99%       0.00 ±223% +2.3e+101%       0.23 ±123%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
    493.62 ±149%     -68.4%     155.79 ± 62%     -44.2%     275.58 ± 48%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.02 ±155%    +791.4%       0.16 ± 89%    +974.3%       0.19 ± 84%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%   +1166.7%       0.03 ±206%   +1960.0%       0.04 ±176%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +9.5e+99%       0.01 ±223%  +8.6e+99%       0.01 ±153%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.alloc_pid.copy_process.kernel_clone
      0.00       +7.3e+101%       0.73 ±217% +6.7e+101%       0.67 ±198%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00          -100.0%       0.00       +3.4e+100%       0.03 ±133%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.1e+100%       0.01 ±127%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.00 ±223%    +892.0%       0.04 ± 93%   +2112.8%       0.09 ±119%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.00       +2.8e+100%       0.03 ±142% +4.8e+100%       0.05 ±161%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00        +8.8e+99%       0.01 ±194%  +9.6e+99%       0.01 ±133%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00        +3.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.05 ±223%     -98.0%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.01 ±147%    +578.1%       0.04 ±158%    +290.0%       0.02 ±110%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00 ±223%   +2125.0%       0.04 ±127%    +390.0%       0.01 ±171%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.06 ±170%    +106.5%       0.12 ±204%     -95.4%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +3.7e+100%       0.04 ±178% +1.3e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.01 ±223%  +22196.8%       1.15 ±211%   +1785.2%       0.10 ±106%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.03 ±205%    +261.8%       0.09 ± 93%    +825.6%       0.24 ±128%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      2.14 ±223%     -99.7%       0.01 ±190%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.00        +8.5e+99%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00          +1e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      1396 ± 83%     +28.7%       1796 ± 49%     +37.0%       1912 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.15 ±208%     -97.4%       0.00 ±223%     -85.3%       0.02 ±171%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00       +1.8e+100%       0.02 ±131% +9.4e+100%       0.09 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±182%      -5.6%       0.01 ±146%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.00        +2.5e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.02 ±223%     -61.2%       0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      1.19 ±215%     -66.4%       0.40 ±223%     -94.1%       0.07 ±200%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.01 ±170%     +12.2%       0.01 ±179%    +289.4%       0.03 ±128%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.06 ±118%     -38.4%       0.04 ±155%   +2198.2%       1.34 ±165%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.00        +1.8e+99%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.kernfs_fop_open.do_dentry_open.do_open
      0.00       +3.4e+101%       0.34 ±222%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.kernfs_seq_start.seq_read_iter.vfs_read
      0.80 ±188%    +318.9%       3.36 ± 90%    +211.1%       2.49 ±151%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.00       +4.3e+100%       0.04 ±183%  +1.4e+99%       0.00 ±199%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.02 ±194%     -87.9%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
     18.35 ±187%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00          +3e+99%       0.00 ±142%  +3.4e+99%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00        +8.3e+98%       0.00 ±223% +1.4e+100%       0.01 ±176%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00         +4e+100%       0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
    591.36 ±193%     +93.2%       1142 ± 25%     +46.8%     867.98 ± 31%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±143%      +6.3%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.03 ±183%    +353.7%       0.13 ±139%    +279.0%       0.11 ±127%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±150%    +154.1%       0.02 ±123%     -38.4%       0.00 ±124%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
     16.54 ±219%     -68.0%       5.30 ±200%   +6086.1%       1023 ±198%  perf-sched.wait_time.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00         +2300.0%       0.04 ±200%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.06 ±139%  +1.9e+05%     116.57 ±223%    +690.0%       0.50 ±191%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.80 ±149%     -99.6%       0.00 ±223%     -70.2%       0.24 ±198%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
    551.45 ±223%    -100.0%       0.04 ±213%    -100.0%       0.16 ±188%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.16 ±112%     +85.8%       0.30 ±187%     -22.2%       0.13 ±146%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.02 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      1623 ± 83%     -65.9%     554.21 ± 45%     -25.6%       1207 ± 76%  perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.00       +4.7e+100%       0.05 ± 87% +2.9e+100%       0.03 ±105%  perf-sched.wait_time.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      2.85 ±222%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±141%  +3.3e+05%       9.32 ±159%  +1.1e+05%       3.24 ±118%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.07 ±214%     -53.3%       0.03 ±223%     -22.1%       0.05 ±200%  perf-sched.wait_time.max.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +118.2%       0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.03 ±132%     -13.0%       0.02 ±184%     -61.7%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
     14.66 ±207%    +943.0%     152.95 ±170%   +3331.1%     503.14 ±191%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    603.73 ±193%     +28.1%     773.60 ± 48%     +38.0%     832.85 ± 96%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     89.38 ±137%     -94.5%       4.90 ±114%     -99.3%       0.65 ± 79%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00        +7.7e+99%       0.01 ±163% +1.9e+100%       0.02 ±136%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00        +9.2e+99%       0.01 ±191% +2.6e+100%       0.03 ±179%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.02 ±223%     -76.5%       0.00 ±223%    +420.7%       0.10 ±200%  perf-sched.wait_time.max.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.03 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.00          -100.0%       0.00       +1.7e+101%       0.17 ±200%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exec_mmap
      0.04 ±128%     +27.6%       0.05 ±130%    +137.1%       0.10 ±185%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.02 ±156%   +2047.4%       0.35 ±100%   +1197.7%       0.21 ±112%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.00       +1.7e+100%       0.02 ±202%    +5e+99%       0.00 ±140%  perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    341.18 ± 98%    +235.3%       1143 ± 61%      +7.1%     365.27 ±137%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.55 ±187%    +214.0%       4.87 ±204%    +116.7%       3.36 ± 99%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    671.72 ±223%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.05 ±132%    +162.4%       0.13 ± 94%     +57.2%       0.08 ±124%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    583.27 ±202%     -92.4%      44.37 ±206%     -99.5%       3.10 ± 89%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    833.26 ±223%     +20.1%       1000 ±152%     -28.0%     600.18 ±133%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    639.01 ±221%     -99.8%       1.01 ±141%     -99.9%       0.87 ±200%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1500 ±142%     -44.5%     833.59 ±128%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1760 ± 84%     +14.5%       2015 ± 65%     +47.0%       2588 ± 60%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1182 ±132%     +18.8%       1405 ± 47%     -24.5%     892.74 ± 55%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      8.72 ±128%     -85.1%       1.30 ± 99%     -66.7%       2.90 ± 75%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    137.80 ±100%    +730.4%       1144 ± 29%   +1091.6%       1642 ± 80%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    168.53 ±196%     +41.5%     238.45 ± 85%     +23.4%     207.96 ±147%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1459 ± 71%     +67.2%       2440 ± 22%     +33.7%       1951 ± 29%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2351 ± 72%     +72.3%       4052 ± 12%     +64.6%       3871 ± 35%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00       +1.5e+100%       0.02 ±142% +1.1e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
    165.52 ± 92%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2976 ± 71%     +18.5%       3528 ± 36%      -6.7%       2777 ± 38%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00          -100.0%       0.00         +9e+101%       0.90 ±200%  perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    118.33 ±219%    +440.4%     639.48 ±131%      -4.7%     112.74 ± 64%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      1554 ±113%     -78.6%     333.42 ±141%      -9.9%       1401 ±166%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2651 ± 70%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      2251 ± 99%     -48.2%       1166 ±115%      -6.8%       2099 ± 78%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 ±223%   +4403.5%       1.07 ±223%     +15.8%       0.03 ±200%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
     30.58 ±219%     -99.4%       0.18 ±223%     -93.8%       1.90 ±200%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.22 ±152%     +16.8%       0.25 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
     54.85 ±156%    +197.4%     163.12 ±222%   +1556.8%     908.82 ±199%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.21 ±152%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      0.03 ±144%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      9.24 ±183%   +8372.4%     782.92 ±211%   +5187.3%     488.59 ±107%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2856 ± 71%     -38.3%       1763 ± 51%      +2.4%       2923 ± 36%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.76 ±219%    -100.0%       0.00           -48.8%       0.39 ±200%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      1254 ± 85%     +18.4%       1485 ± 56%     +57.2%       1972 ± 51%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    909.09 ± 75%    +117.4%       1975 ± 18%    +143.6%       2214 ± 36%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2263 ± 73%     +61.6%       3656 ± 15%     +58.2%       3581 ± 43%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3154 ± 71%     +61.2%       5084 ± 25%     +65.0%       5205 ± 21%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
    699.58 ±221%     -99.9%       0.41 ±188%     -99.8%       1.73 ±200%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.05 ±150%    +990.2%       0.54 ±174%   +3810.0%       1.92 ±120%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3056 ± 70%     +63.8%       5007 ± 21%     +68.1%       5139 ± 19%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork

--AcJ7fDBZ8OE2OUNP--
