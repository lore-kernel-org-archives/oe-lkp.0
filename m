Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE01DDC3
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jan 2024 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idq5dUm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704357612; x=1735893612;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/VETKKXsgOqyNra2TLYIyhGdfeq/Nr+Qhsww4x4vk8k=;
  b=Idq5dUm0XydYTYfP0tpeOuUdQTYvzBdkG5ojiA+N27z3Yyr+RGvfgGPR
   G17ILSsVwpMdZ59LUm5YDgYlaI0n5ejh9BCOF9Qyz2zDE9wDkLgEPZFBA
   9UuVwoOzWEq811v+/KzEaCCiuG8gADdmFlxwL1+lKZF9jemr+fo4cWV/i
   LcVJAchuOO4k6EK5IihLj7UY5lZPy4Bx9crHel92YTwVsCMEpRcZGuiRn
   EHeSGj0ec5uBYV0VeuzxmHUZfbTu7bxvvf4MenvHMt0RlXZ8fe2LqV2kh
   C3/SWGHdjbGC6UEdyQlKxGaV5sGgFeSsLyfcuaVxV7YiI7qLT+17Z3Ebj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428327537"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="428327537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 00:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="22102878"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2024 00:40:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 00:40:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 00:40:06 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 00:40:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk+RW/aAGOY/CRUDdWh7UiOMLcaZ6vsEVLdIt95WB9C0cS9L64Fa2D69jU5C2Ez0SFGR+GI6g3xJNEp6FFMcbZLA8J6+Wii+BheaPcq92myAUSawPad89LGlngdoH291FOzjlUyFfQ283SsSgLlcHSQgQ6XwZnbkZKrvv+L3mq4YxORLjICM+VLgS5mhAiCz96Aqq0VG5idT6KZHSBeNdX5fw5vkFvgqoZ4o5h7fGw5+t9ZzmEs1SzWtxA8/MuBwyrV4KUqyxBrn2G59DECaTODWC+bkezSsKf2XFwhUp2G3BSkiME2WyM+XqsIiJpn1+tbipb/1b5/1dw0P9s1zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuXFuksYH7b+ERX14OxB7XTeVVH6FHIFbwBDOi45fmQ=;
 b=i1hEGuXmjM6I+SmvQ2ShsxkkuBFL6MjDZmGd3JPOe+h70FYmSYoyXU8um2AmXA6T2NOoTHyqV4XQIXqxBtIOYVMTmoAcg2JllAPfI8DwpXQHovn5+E05djvrwLXtCklVHnHn3ncuI0RBvtR76Ag/n7WLQqUatI1xqxnJ2On88eYwX+gIZ3OAQ3BHxQMxwGlBRQGKomq1cF7I9q0c5HgRxs0ilklVymShLbYrLH1BKt4wjY0gC7K4iQFqGXn2g0/Cqyx9HaHDLu2X+n802f3jDBurN7sTfCsbWeKlFLSsef1kNYKk4yavxTvXCqeBhlmEbC/g5n3zAipZgmPVkIeyfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Thu, 4 Jan
 2024 08:39:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 08:39:58 +0000
Date: Thu, 4 Jan 2024 16:39:50 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Yin Fengwei <fengwei.yin@intel.com>
CC: Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Matthew
 Wilcox" <willy@infradead.org>, Christopher Lameter <cl@linux.com>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Message-ID: <ZZZu1s5yAyFr0wtw@xsang-OptiPlex-9020>
References: <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
 <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
 <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
 <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com>
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc97854-da55-4ef2-833c-08dc0d00bc2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KmBGqhCQg6iwcGWTF29Tv+7//XjLhRy6TqyPXdH18Vp9yDCFGc4MmLTsiuIf3ufEDsrwxjzgFWI+xyomahoxem0HVU+ZAQBYgIZgyYHRYiVDX8gr1p1VU8PaUMczfsLVLxKYzPide4+HLz8ro1S0ULlu9EO0028m8qawsft6KnEouu++we+cQRVTjoToyWJeIZvN7Z/BYoRqLjn/5JgblHYui9c63W3463GxUX6hF8cWwzeXkTLPGDZkT7drI370wKfgt0/wKwRVr27k3+i/WTwDgXqs/76ufV7Vr1qEKrHG2+XWQR0WT2/qQq2FNBOWR7hikz9DFhqPogCgy+GwZTb5DwZSkOVMDsnFVVsDKiPpaCIz5kWh1HmP0hFgL2NKDTqj6NYytXTjG1LUri2lB6BVnCPMxP1zS3mJSB9U0enrFWQ7S14SlCtnpKUKpP22T3vWMkApMtPupx3sjUq89uWmIEi/CYJ6G1POJZ2BDo830a/41d2BUqgO2LqHRpldwnAX2XwQx871/zUJfC7Mn6ASo+rbalUC6KrSqQkxg1n0vJ28gNMtMzUc1KAIRuL4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(9686003)(53546011)(26005)(6666004)(478600001)(6486002)(6512007)(6506007)(83380400001)(107886003)(5660300002)(2906002)(33716001)(41300700001)(54906003)(66476007)(66556008)(66946007)(316002)(6636002)(44832011)(8936002)(8676002)(4326008)(6862004)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mcZETfwU42o8lS1lhhQBX9lFoOX/MC0BIiTEGcRXEqvyd++DAr0TnqaAI9a?=
 =?us-ascii?Q?quPNnt6jxEKQdHCj6aQrK88kHX1r/FizIMKhu6nccn/+ru0u3FBT4GmdSWLB?=
 =?us-ascii?Q?LOHxFRwpuw2r6DahpksX7hio0f+FDqMqVKoiGxH4LJZz615XvvCIxY/VNN7x?=
 =?us-ascii?Q?IDG1OJ1QpGmB/fjxKA8xXmdsDa1ywDf1XW671Z6L7mBfziNTNOWjlulE8A/6?=
 =?us-ascii?Q?lv95Sz+yqmsFxrVuBGv9dTA68wPaZoYAJY8zDQ6VCBKc4Y8viam5v8VVzON2?=
 =?us-ascii?Q?2+nNBSoxQZQV4eqWCQREzSzS1FBlM6rThIbeiV4f7b+4nIVqFHcpIyUMN2T1?=
 =?us-ascii?Q?q+75Y1t3IXBMOLzp5bJwocbYpJe0JZIqykUZHC+NO1jmLGiBOb0Af9ONJ+ws?=
 =?us-ascii?Q?MwQ8fjYtmgcQ6rXpmOvhue4tHXjNhra4ojkO4u8F9vkjz4suz+FY4qPZZMAz?=
 =?us-ascii?Q?gpeA1ohoJ3zM2bHioNZhycM++RaomSLiSPUjRxR92/Df+jrDhYjCA8m3UnBP?=
 =?us-ascii?Q?R5te3iAppovL3YBoylq01wagnlPp9FSTGaotlle8ozjt1U4igxM9JTJR3zTi?=
 =?us-ascii?Q?QDKIHGBV4yt6KQkiAt8S52PKHIgzJD1K30ptJb0q5SfDM0KOba1P3z1Z7QxL?=
 =?us-ascii?Q?xLOIQHbmCd3ZJmvFNV4Qoq/BBKxMGtMzkWBkA9AGz2cvnCGkFkLBI0QsQFzF?=
 =?us-ascii?Q?+ed4DIbJg1JSdP5tChmPEQ1rIAew7YzUn8Yl8cKmFvpfP34kUoxcrJmw2vUe?=
 =?us-ascii?Q?1pNW42rF3Iie9Sfh4bcOWpUYiA1ajT2gWH90UtWVbb1DXYCAKqa309UIih54?=
 =?us-ascii?Q?Ch5PceQ3yTyilrcAjKnxtXUcyYu0Sh6BJmFr17D8NtID4sudy0j6+tlHTOk8?=
 =?us-ascii?Q?jFeDAeB6kluIZpZMwvKxkPnNZSNz94oywzntZx7eByQycS2vqxr4UcK3Uted?=
 =?us-ascii?Q?nZ3CErdDhFUz3xepufCkhEU26uBEq9sX+f+yh0a40p7LfeUUP2NevuvcxhYV?=
 =?us-ascii?Q?tu8aXH6YF1zKqNiIZyliOUkGfOcdmtRNMzUC/80rhL+QSMTccn+XVxYbFTOe?=
 =?us-ascii?Q?EbzEIsDg0yMFO1YISovnU2YGFYTCvSy1XN5/zjtKnoqefRUz1uasiSabP5CH?=
 =?us-ascii?Q?m+ILuoShyLC2ObEP9prNWn12kN664uLhMFkgYefqOngb1gqsXONfDSloCUEz?=
 =?us-ascii?Q?Fwd7gv/G9ly6nWoxkTE48bbdTE7TRsT1h/aqSYvP30gv2vBg9CeOi7BsFOzC?=
 =?us-ascii?Q?10dPZ6CXzeS/1LlOmcXx2TAVfccDYYuyrquF/yabPPArQRyo9NBcIqihetCW?=
 =?us-ascii?Q?FxB9Cp0gsLJurTjLEvkJaXtjmJh0S3IvO059aKKjHssvf+DVxBE48zGAxJOB?=
 =?us-ascii?Q?9OGDre3a/6nL7hkFOmmgMfB12rhpokAEsdCqvdzoqVwS0Vmccym+9kjw76rU?=
 =?us-ascii?Q?T9EINjliozJNGYGKGL93IxAjcL/+zLZM5JU9GNMDPhiWnSFgpK8oDAl8jZSn?=
 =?us-ascii?Q?vziBoOly98RP7pYSkeRJAMR22IAL/wMJWD5Zz2FfiqKdp0bAnzB1IWUU/VLo?=
 =?us-ascii?Q?nXelbKa99U/kimdjB0ytiaU8R1JUMZU4zg0O0eV1ToU+qa4yf7xmnMM6lb4K?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc97854-da55-4ef2-833c-08dc0d00bc2d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 08:39:58.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVPbglIJYsYSFW+bVg2y2E9ylkOSTqE+UYnD9fOHmshKXVxq/ySdxHbGFb+N1+WSok8rs0RgXM7NmUR58ieDIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-OriginatorOrg: intel.com

hi, Fengwei, hi, Yang Shi,

On Thu, Jan 04, 2024 at 04:18:00PM +0800, Yin Fengwei wrote:
> 
> On 2024/1/4 09:32, Yang Shi wrote:

...

> > Can you please help test the below patch?
> I can't access the testing box now. Oliver will help to test your patch.
> 

since now the commit-id of
  'mm: align larger anonymous mappings on THP boundaries'
in linux-next/master is efa7df3e3bb5d
I applied the patch like below:

* d8d7b1dae6f03 fix for 'mm: align larger anonymous mappings on THP boundaries' from Yang Shi
* efa7df3e3bb5d mm: align larger anonymous mappings on THP boundaries
* 1803d0c5ee1a3 mailmap: add an old address for Naoya Horiguchi

our auto-bisect captured new efa7df3e3b as fbc for quite a number of regression
so far, I will test d8d7b1dae6f03 for all these tests. Thanks



commit d8d7b1dae6f0311d528b289cda7b317520f9a984
Author: 0day robot <lkp@intel.com>
Date:   Thu Jan 4 12:51:10 2024 +0800

    fix for 'mm: align larger anonymous mappings on THP boundaries' from Yang Shi

diff --git a/include/linux/mman.h b/include/linux/mman.h
index 40d94411d4920..91197bd387730 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
        return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
               _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
               _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
+              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
               arch_calc_vm_flag_bits(flags);
 }


> 
> Regards
> Yin, Fengwei
> 
> > 
> > diff --git a/include/linux/mman.h b/include/linux/mman.h
> > index 40d94411d492..dc7048824be8 100644
> > --- a/include/linux/mman.h
> > +++ b/include/linux/mman.h
> > @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
> >          return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
> >                 _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
> >                 _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
> > +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
> >                 arch_calc_vm_flag_bits(flags);
> >   }
> > 
