Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741F7C
	for <oe-lkp@lists.linux.dev>; Tue, 24 Jan 2023 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674564657; x=1706100657;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UNgWVb/qgsivA+Omg/pq9AhSu6U0U+vMCVxhvN0RrBw=;
  b=d4vvSbwV8f9jPe+VgpzeS+MgYjZJBAi4xm2Q5tNPba4/nqlcCB2SFGgx
   grQBOfC5Wwuw1N+cstv/ID6bwu+ICXOomqRh8hwka/fDE4+97xsuLb27q
   gYIjI8q0yQo+TFb1exdSOAwog525n9/qB8REBALzozusr7x58K34Kq/yY
   VxV5/ylbm8Qnl9DUSVHAKCcUSF8x+MpOwZbAXb+CIxg8NmmyHP0u+LAeH
   82/HFOfZm+YXvgCqvp4VzuyLPPDYl8jTwY/JS+3UVDRTUHgRUxDL6f+Wx
   2j0Ld7U7RF+wMLpmsTLgv/c8bdysuI1SgLeyOJxL+dor+a426mrdNV69L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328375129"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="328375129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990860448"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="990860448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 04:50:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 04:50:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 04:50:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 04:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHIZhxu3rGeSqKyVNf4UHmw42l+H3Oi8uCJ+veqsEwjCSEb/pZ8DqQYsO1JC6Qy+pgljyGyurpBsd4mN1Yz9VOQUAWUMSQr18C2Pj+K6wfuMpZcWwg3gjTpL8LqspU6nmz6q4ViEZcgK57WkZGqIsj1KF9OUR41kDHaJ/gekWUv5iwr2rwoIEU/cwBT+AHGid7H56SxiMhOlROt5KDDF4Dp8ms5qGre9imLGAjqZIeLAfwNc+0QJW6p5DDs5l2B0f8rlpYmwc9dnczNS76G10NhBYIHvPU2t/CC22a+irGHoTD4XIHCO5WRcb8HrhSs5EFa11NRP3K9pbMQAMdPhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF7ZfxiolsvD/zz28rhy3Wgzf0LLkPenC6RQ0IqrhvM=;
 b=CQmTWFCtLIsIdM1TCXCrsyLrUExgcyTnTod0kDVcy0RG5vqa/DItFfzs9Rb13lY+4hsvH4/gn2nVdffuglsyB+EZNYt+a++NuebAsgqetxi7eao8niuZkXsC6GoQ3QIireQlAZsHQobFA5tC8W/44QW0tJucBWBF8xtCpb1Kl7A44DD+Sr11vE/DdVWDE5y2MuujEy7HPRkFLvKzJ7stLUjwpo8BfKqb8jsiDwEwKRPff8Xkurt4jcueUyp0L2iKG1X7z/iRaZkM09r7An8ibSH2LLaLUja6cYA/iGIbUevb9gDnrWRNxp7mjJ8oWsp/BSo62o6QZFvSJ0h5Rq74Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:50:53 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 12:50:53 +0000
Date: Tue, 24 Jan 2023 20:50:44 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <Y8/UJODqtDfOqPGw@xsang-OptiPlex-9020>
References: <202301171441.da2e9d11-oliver.sang@intel.com>
 <20230117082042.GA19116@lst.de>
 <Y8adDdqXX6ptkU7X@xsang-OptiPlex-9020>
 <20230119151044.GA28290@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230119151044.GA28290@lst.de>
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BN9PR11MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 62debc13-9642-414d-5b53-08dafe09a0b4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +hOFkf3l33cKhS41BSoyOITigtMDufFmlz/oMUdFY8JS4hEvhpHvTfiXhC8VYfj/oGUJGCN/FBSKwEK/SWlDpUF28JfFxWFkvxSurrivKlPMBCyY3hyf4KOXW6fupibz2QRXPKR3zl8ingyq/RdLSEVbZ4CJgubnEpkVe4fO/6plR0m5uAXOC62GMANTjjP7OE0QaTGg3RRJSipzB10L/SACyKJ7uL2xuvTupe3BcxHgV3AP9H1mMiE08ZzDUG9zkPaAixmvT+71TGiK+xOhhaKpuZBAI+pJTnMQcnyJiWSsRu5I36nQ0KD4Hc0CagSGz8/jVab4muflVH2uSPXH+6BFx9KlRv3IN+FYnsSFRMpBwVwUY2H6YM21Y0goIKcv2kOLch6jBoRVlwUqtF23fosrcXISB+D6L9vUzMioNZne5wLdHxROfh+I7u/NTrftR0vfJXG6RMH4CovqkMxwX5AShatd1YJDN8S8OFA+LnHbMHlxIF6PUQPQ/tHKVnxlQoXmvI2piCsWJdq0Gxwh9Xp89aKhGT9KbKXRolLjzM1MeRkIpKYt1wl7hd3tTruPHJTehpQt1RJMPDf9vco+7Qmywz07KgJcAtTm5M0fOn2o0z/WI+LFE87ZqUehvbJ3Vdo76SMT5UyQnyIcFU6ERW4gskUVxMxyBYaVEkUfocJHdR+3hVkC9AbMLmvPkdTfFjFI0CgNEjS5U/x0ILy9YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199015)(33716001)(38100700002)(82960400001)(86362001)(478600001)(316002)(66946007)(8676002)(6916009)(4326008)(6486002)(66476007)(66556008)(2906002)(44832011)(6506007)(83380400001)(6666004)(6512007)(9686003)(5660300002)(41300700001)(26005)(107886003)(186003)(8936002)(101420200003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jiHp+Jt/SUBEQiwss3+fR9mj8CAdvDE4PT3cqG1KHOras9u24rX/sJ6EBuKw?=
 =?us-ascii?Q?Tal8p7jFxaM7tqxP0cc3nMdCUJwBXdYmXnCHJcWLIWhdX93FqligGFLXT0+F?=
 =?us-ascii?Q?tr1PYrvUqnkHoWjhGsvFRISKnBgKHtt1IIdVzGbD/XpVPfTBs+vkjhq6N4dH?=
 =?us-ascii?Q?0fmHNs6LY/BJbY12/6kR5vPGZafspVa4TvY7mrMeGoyUrfF91HgdDBaeVIPF?=
 =?us-ascii?Q?mYcryygrrQlnvAYwNt19T5Y725uRDWwr4pXurVgiaOtEHK/L8g1K5DBawqCl?=
 =?us-ascii?Q?FK5mRfXUztJAcnkPEXNgQcu6ybJ84TG7kWdOw2e6Vqn3XagWRj2RCBF766vF?=
 =?us-ascii?Q?mAvfL+xWGhjoaUV5usrOmqPlLOi3NlMi/OrVp9UuTA/kILLeLLKN2grNtkXZ?=
 =?us-ascii?Q?8boAJE6CGmvyAJgAu7e2eWf9BS+wukRx+caYsFtz7slobJoTwMcNZ2lIlz4z?=
 =?us-ascii?Q?CXo4H9trsPrDAxOvCDA+IMCWNxouwRjdIMpRNG62uoLSdt9V697L/eohU9+L?=
 =?us-ascii?Q?ePbKWgskoIRMrpJy2Rvi7cbGYWuPdE7mcZFx/p5YZazazs59um72fgSOg1Eg?=
 =?us-ascii?Q?NWEr1b+B3et/IzX69D6y9VQQWx8gXWxSn2k18tcXWzXqXQzEUvBEtG6nJP12?=
 =?us-ascii?Q?9qTZ77wkHm5Cm09G/OBHyskGZtm2eMjQiDAe31dgJudFrBn30g4SWL2LubLO?=
 =?us-ascii?Q?nmAT0cifo6dZZ9JaffOW83q1LkhnDh3+Z8n1AgIjsQ8/ol/GAfyW83K/xv7Y?=
 =?us-ascii?Q?Odz6DEEuGaKi4WTr1FmNFWUHXaidtRaVrSlDevOTMvnMRp9yYh+YxcpmaQo2?=
 =?us-ascii?Q?iLylHPSSxSVukxp0HQD8ftgfSP3ggVYC77LpaoEs8iRtwI9PVP8j7omTMivk?=
 =?us-ascii?Q?ZIve7f+wG68p3+H/DBdw+gYW347dZ47CCBrgTttvNF9Z3ZNKdOQAh2munJt4?=
 =?us-ascii?Q?ICL2ZDd260q0GHjn/UZDqk0RbHLnpZ0E6yJY6Lzva55lcMst/cJzKBsLJll8?=
 =?us-ascii?Q?LN7JLm+IKNVhHbnB7KUIwXSoqaR+U0gCTGPwUQRONJZmuhYPtJAWQUB88zQv?=
 =?us-ascii?Q?i6+pz1b5z1Y5vz4en0aAypC8PaNSDrLyvuFJ4IMMmMle9XqstE3wYYCo+TVo?=
 =?us-ascii?Q?IjRe38FA0zk2yjm7Ro6h+XPiBZ8iwMaHAd2g/Fnl+xCa9Gn31fQ5ZYiB9uVn?=
 =?us-ascii?Q?dQ0Q33HDFfBK6iw5nmH/ZtqOFOm3wGoEFLT+GwtacXGjS1kesz9hkE3ZdKsy?=
 =?us-ascii?Q?2pyKpja6qnbk8pKHiUd2IsDxoeQkdoIQr8qxO3zH35fHV7FtCYHT1S5LV53T?=
 =?us-ascii?Q?YXba/q+UJbzFt6A1jq0GB4oH1yFhcGbcu/hJzW8u0YHPwSbGlzJmFSUNb4QX?=
 =?us-ascii?Q?g5GxKAWSJQFzRaRyb+ZCfsePI9+OQHSRYWrFwSWC8XBD4J+GvH26GZ5Ykhrf?=
 =?us-ascii?Q?OjG0u6mrU6aHRufrJM/1DIHC/4N2h2o9w183kl4/eHwvUXS4mhvNwUasqtkJ?=
 =?us-ascii?Q?JKk0cR1etDR6MMbAyQcw9DTpTRJzg2u5b8GjfVMrfhQkcXDjbIQiZGcqQLe4?=
 =?us-ascii?Q?40g7QYxshLxx4WYVq/+mpsyHeBm6V0Elybqq89Y3ChIFvd2MLZDBoLvntgZJ?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62debc13-9642-414d-5b53-08dafe09a0b4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:50:53.2556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2W2ujosd7BqnCNJRUciB8UryIa79CrbH+fhmDNqq7BTL6tQEJvb/CxwQ8tvVFCMv8Ikk+3UyeGOhwvBKXPs5Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
X-OriginatorOrg: intel.com

hi, Christoph Hellwig,

sorry for late, we are in holidays now.

made a test upon
  9ed690478287 (btrfs-bio-split) iomap: remove IOMAP_F_ZONE_APPEND
several days ago, I just checked the results, found the issue gone.

however, I noticed the branch update again,
  e304306c2534 (btrfs-bio-split) iomap: remove IOMAP_F_ZONE_APPEND

I will retest this new branch.

On Thu, Jan 19, 2023 at 04:10:44PM +0100, Christoph Hellwig wrote:
> Hi Oliver,
> 
> I've still not been able to reproduce the issue locally, but identified
> a potential issue.  Any chance you could force a re-run of this test
> group in the current hch-misc:btrfs-bio-split branch?
> 
> On Tue, Jan 17, 2023 at 09:05:17PM +0800, Oliver Sang wrote:
> > hi, Christoph Hellwig,
> > 
> > On Tue, Jan 17, 2023 at 09:20:42AM +0100, Christoph Hellwig wrote:
> > > On Tue, Jan 17, 2023 at 03:57:20PM +0800, kernel test robot wrote:
> > > > 
> > > > Greeting,
> > > > 
> > > > FYI, we noticed BUG:KASAN:use-after-free_in__blk_bios_map_sg due to commit (built with gcc-11):
> > > > 
> > > > commit: b7c9bcdc17f3d9a546470cca6dbf717254ca5291 ("btrfs: remove stripe boundary calculation for buffered I/O")
> > > 
> > > This seems like a really odd commit to hit such a bug.  How reliably
> > > was the bisection?
> > > 
> > 
> > the issue doesn't always happen, but with a relatively high rate.
> > and the parent doesn't show this issue.
> > 
> > b45951da8e8f13e6 b7c9bcdc17f3d9a546470cca6db
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :20          80%          16:20    dmesg.BUG:KASAN:use-after-free_in__blk_bios_map_sg
> > 
> > BTW,
> > we noticed the commit date is just recent, not sure if a porting commit?
> > so just sent out the report FYI
> > 
> > commit b7c9bcdc17f3d9a546470cca6dbf717254ca5291
> > Author:     Qu Wenruo <wqu@suse.com>
> > AuthorDate: Tue Nov 30 17:21:58 2021 +0800
> > Commit:     Christoph Hellwig <hch@lst.de>
> > CommitDate: Thu Jan 12 15:01:55 2023 +0100
> > 
> >     btrfs: remove stripe boundary calculation for buffered I/O
> ---end quoted text---
> 
