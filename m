Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852D468A
	for <oe-lkp@lists.linux.dev>; Sun,  9 Jul 2023 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688906431; x=1720442431;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/dSEsv135jGslnEv0k4s6X1JHU4IB+KSgB1L3ItBjCU=;
  b=ItDr0PlEjfB5q3pNOrO5wyC9AHHhe+uDvVPXp13pICHK5VUe4zuGBTmw
   Xb4dsj6b53DDTA2lhpegHHSMSami0vCI5bh1+vZQWo57eRSp634FZQKod
   NSMKwrD+1L9tXYNzwXmTrQYQd082BHkypE0YKR98GG0WXP4USb9YUs6SP
   +4+F2mwXMbgt2MWBRs2S7hpjrLvI199FfO2bWv8cW0bEzxieeV5P2NItR
   w+35XXl9KwK70hs6wqx2ELTE4QIZjSUJfHcpXLr8z+KNcQ2qf9Unc4EGn
   upNCT4Le51T70YC3NtoaIqadMmtY887yyJKnuIDDn6BYbbECNHhndP2w3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="450523924"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="450523924"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="894488213"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="894488213"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 09 Jul 2023 05:40:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 9 Jul 2023 05:40:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 9 Jul 2023 05:40:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 9 Jul 2023 05:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhAkSuZNHDQfXRKyjNx4gXX7sgUhumXK8hi7fak52LkNUDAx4+dhlNz3vFf0ZZIM08c4flopk4ImQ69RG5ESonlN9NtEvMGYkm+kw1DDfxaHrBw34lE+XRhQuCCCZTGmYAMZskZkxZ/zSko6ZycIwIdAO60qFFLNcoycNCofFKOj23hXw8UMoWf75riVBV5M31nBpPH5wGVYaWuifB9VE/7BzRr610LL/g+MNirBI3AD8ZbreIXB83s2We98nZqqsISd5JTLuyRyMFeNpclEiaDXgrkgHwehisCGxfEMHK7zUafIkki2wYvcD8bTxIkAJondRZmuxENmQA1ya4DKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOseVL5L6+ubn6KkxC5fHGXnHdXmE0cG1t+UNK/EjW0=;
 b=dA1vUVyvANzPxMNg1CdFFyb2TURyVDpx/WtqXdlwBL8kRimrNdAdaR388XWPm9+/UdDQzpQBu3H+v8BgK69kG/YzBE+4i0UUyPc89k2BEsd/L+fvviTtz+xDKF2U/Qoa2TPVbFDYRRVnEVIQFGBJWJvxunsMIFfF+b/2VpJehccIJ3u6ZoATc/oRBe0p6lar0T8GxgcLnLi165eTIL5S1ztcCJeIv8pqYdlcgZVNqKwzWry7g5Q9ppRMDwhroAQKn6IgseeHhITqOeTGhUPXMy8R3tkLMDTd3hEn0BLmStR1ODzFpC22SMlLlx+gzfUXa/SGAQ5cKyzDljq9LXvErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 12:40:22 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%7]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 12:40:21 +0000
Date: Sun, 9 Jul 2023 20:40:11 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <ZKqqq4/k5rDdVmzS@xsang-OptiPlex-9020>
References: <20230627075457.fymnpqn3vrjxjs2u@quack3>
 <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
 <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020>
 <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
 <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020>
 <CAOQ4uxgwDNW0SQH5snDHFqHOQAXPDNyPOuhNDb6buEreVPxQKg@mail.gmail.com>
 <ZKd9VrL/4dKApLz2@xsang-OptiPlex-9020>
 <CAOQ4uxikDagpJzXO9qrLxOAb3-k2e_j6C=-pjLfJC5QxMoj0Rw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxikDagpJzXO9qrLxOAb3-k2e_j6C=-pjLfJC5QxMoj0Rw@mail.gmail.com>
X-ClientProxiedBy: SGBP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::33)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 722fc20c-5a0d-4ce1-761b-08db8079a891
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E0Uw0ZisDxBom4GkPO7Fom8K7tOmPKSuLbQlJYc3EZLOMDAc9MzlDWxfWTaVQgWjJCtHkhXMrxmMiVLXH84MbrCwdvPcmC98LVU8egq8RP6k/fjSBcFMvKc6TDBjWlm722pHbPtHXAqd+CSW/bumTWHNNF7mEk7skcMwHpuKzF6Dp+FUAZJog74ZWOpGJrlEL7lrnJ1Vf1/cgpPzDRA0a87CBUIH8GUDdWwyuhNVKGNBxbGocDBXt3QIdvIlfFDMv6m7tqQpFnAk+Lwo6JxAWlGE7u+2ZJei/ku8x6UI/5DZDKpvaWVn4dJIhjDBfXnjQH9KKwt8/cDwFPkPjNyhVqewEBRtxw23lPPWN67OudFl/zH8LVmNu8k5AbJH+mrwllWC6qmtHC2XmxRKZK/hNrlLKsxcY8376zOGhP1aC1jhETyz0lCIInJAMJj4ICiJL8LTg/7RCaw1rmgHd+vDq5KUawmA7h6XIN8qnWlwl0+GB8lpGWXmheYDAcOllSjnjzNd6w6VdCYLCWqBnRGpQPH1Np1HlHHkCdkEXfo69E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(186003)(26005)(6506007)(53546011)(966005)(6512007)(9686003)(107886003)(83380400001)(41300700001)(4326008)(6916009)(66476007)(316002)(2906002)(66556008)(5660300002)(44832011)(8676002)(8936002)(66946007)(478600001)(6486002)(6666004)(33716001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NKSUxhYWhoL2ozaEk4eDRya0hEZkpBZTdFK1dvaUtNSzRFYm8wOVNRbmpt?=
 =?utf-8?B?aERxQ1VVQXIrckMwdkQ4aThaNGZzM0ozc2ErOWc5L2Fzc1pWNkpyNWdTODRW?=
 =?utf-8?B?cjE3TCtnUnY5bWZWRVZrWDE0MnhLejN4SWNHRDJSZ08reTEwMjVjNGloWm93?=
 =?utf-8?B?Y2lWQitmZGdIeTlXcFNGa2R4Y2dmZDN0YXJZbi90WEE2MHIxVER2elNmUmlw?=
 =?utf-8?B?elgxUVVUckRNbDJnTXQ4YVhhSWdOck1tTEJvZW1tZG1rUzRpSGZSbjlEUkhL?=
 =?utf-8?B?VkxwbkFjM3pnbmxjME9LdXpETlVuZ28yZWkydWxkaEFyZ0RkckNSKzNGNnhY?=
 =?utf-8?B?SnM5MnpyL0dUUkZiRVhLeEtKQm1YZHkydzd2aG5Xb20vSUg3eWdQL1hycFJ5?=
 =?utf-8?B?MGFDZCtxd3ZkRnFzcTVFQUMxTFczeTZoblBOd0M2WW44SFFCdllVTVBoNENY?=
 =?utf-8?B?QmErTHA3Q2FHK1B0ZC9HZEd2NGdUR1R5ZTlNUWZTOVFqeDRXS3JhWVBYYmpN?=
 =?utf-8?B?c3BFTzhPQmd5Mk91VXRUWnArRjZaMDJDbjhad2R5Y3JQL1M1TjJUNzk5Ty83?=
 =?utf-8?B?bHdHQklxOTg2bkd0d1lhc1hpQlBZREwyU0g4ejM1SUVzTlptSTV2UXlzQlZH?=
 =?utf-8?B?QVVNUFluRDNxMHF2YzJKUitFN0I4UXRiSW5zQVh5ZDk2TzVla1BKZU9PS2dG?=
 =?utf-8?B?RWduN1YxSm5ORFlObWovRXNTOXppaDJEY25WU1lLZFN6bytoWUd2cW9yR3FU?=
 =?utf-8?B?NU1xTFZzZVVwVU0xbVVRTnduZGpCQitmQnhOYVhMM2UrOHVJdTUzb2RXblJY?=
 =?utf-8?B?VlJ3RGxNMndPaklubytycUdXL1h2anZGTDJEblluMWRYUjlLdVNNNklIWlU3?=
 =?utf-8?B?QUJ1WU0zR2lSZE1LMWlIVFBsWDUzd3Vhbng4eThVc3E0RHljL2luKzlaL2Uv?=
 =?utf-8?B?eEZ0NFBpZ3lnVU1BMnFINmFDNDNUOXNPeVNtWldJUTRpMW5iSGVtaTBGQWdL?=
 =?utf-8?B?czZMVE5xNGJPSkZlN1FMN0RUQ29CbS9SRnRDRk9Wb0p0cmxVQ2ZWZjIzbkls?=
 =?utf-8?B?L1gyUUNBK2MvZkRqVWIzYTkrWEFRWTJpSk1WK2VKNkNxWEtPVkZvbitwQWhW?=
 =?utf-8?B?Tk9qdTZWS2llWHIvRkZyT2d3RDc4ZWk3T0NONmtHNDRoZGRYMHNpOTlXRUl1?=
 =?utf-8?B?eWlBNTRLeGMxcHVHSGV0R0twMTVrWERZSE0rWmtEeWZCbHRxMjJjM28rQUx5?=
 =?utf-8?B?bG1lanE2eG1XdW1xUkVIM2xQOTNYL3BtTmM4RTRXQkZ3QTJ6aEJLQ0dSMFRM?=
 =?utf-8?B?QmZsY0xxeWp6M3UyZzFubVI4OTFvM2pwNVVzOU51ejNFYlRXNUZISWJGUktm?=
 =?utf-8?B?dVNSZk4rR2pKOHh0ZnlPVHlIZnVXNmFtdWkrMTRCczM5bUFUU0d4d1BzUHN1?=
 =?utf-8?B?UlBPRU80UVRyMHI2NUFMUWRFbGkvRHRhYnBGT0krdzZqZG5Gb3UveUg2MTZq?=
 =?utf-8?B?d0lqa3pYOU5yWkhJT0V5OUU4bEpZb2IwTUZXaTk3Z0cxUjVJY0dWNHgwMm14?=
 =?utf-8?B?VDY1aXB1aDl3bTA3V0pROE1kemc3T0Z5Z0tKcFk1WFJXd0ZmVi94MG9lS05D?=
 =?utf-8?B?dllEdVkvM0NEWXZWWStsRFlvQWNrUHBCaDhxQklMRXpUQXIwZVhVS3U5OEtu?=
 =?utf-8?B?NFdKUlF2Z2pBYXh1WFNuMUFza2Z2ZkJ3b1U2dkxSL20wSXlROFFKdCttWGcw?=
 =?utf-8?B?VENMUVYvaFpqcHJJSkozYWVGYzZUTk9BblZsWjJqMjRTci94SUlyQWl0VWZQ?=
 =?utf-8?B?dHZWaVUyNzdyekhzT0J0OUwwQXNmMlZrTEYxLzZFclIzNHZkNmJkdkUxTUFU?=
 =?utf-8?B?bUt1Mm9MbEFXN1BpWkI0WmM0c3pYN3lHSThCdmkreE41VjZuQnp3cThhbUk4?=
 =?utf-8?B?cFlmNHRLTGIyNGdFd2FYUHF6SjFPaUtpZ1VNQVRVcG9QMUYzQThTTjFZMlkw?=
 =?utf-8?B?K1pQU2FlRkJEaGpIM2pKbmVwODJacGpnQlNkY0xBcmFwNmZ6emNHdWF1TGlq?=
 =?utf-8?B?NEtOM0prYVFPY0dhMFhHUmdKN0xibXVaeUxqWWxzNXRkZTZtZlI4S1llYXVt?=
 =?utf-8?B?MXo4a2U4bS8wcUw2cDZzRjVmYVUzcmppSVlibHFWcjdHbnlFZFY2MktXMHZM?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 722fc20c-5a0d-4ce1-761b-08db8079a891
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 12:40:21.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nno/j8aVNUBOeGazMoix7DGqAKmL23JGpdrGCExtoomDejB1b9fLzOmQUf2nWNMWTUYiAEtP7Lqj8ICPZYBzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
X-OriginatorOrg: intel.com

hi, Amir,

On Fri, Jul 07, 2023 at 07:55:41AM +0300, Amir Goldstein wrote:
> On Fri, Jul 7, 2023 at 5:50 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Wed, Jul 05, 2023 at 05:15:56PM +0300, Amir Goldstein wrote:
> >
> > ...
> >
> > > That's great :)
> > >
> > > Let's try sb_write_barrier-rc6:
> > >
> > > * ec6062fa6287 - (sb_write_barrier-rc6) vfs: prepare for pre-modify
> > > permission events on aio write
> > > * c0499c6ccdb7 - vfs: prepare for pre-modify permission events on write
> > > * 0bc594342542 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
> > > * 286af98e1d76 - fanotify: activate sb write barriers for pre-modify
> > > event watchers
> > > * 90a5c1147030 - vfs: implement 'vfs write barriers'
> > >
> > > Changes since sb_write_barrier-rc5:
> > > - Removed the "fsnotify: optimize ..." patch - I don't think it is needed
> > > - s_write_srcu is allocated lazily on first activation
> > > - safe activate/cleanup of s_write_srcu (hopefully)
> > >
> > > IOW, rc6 could be the final version if it passes the performance
> > > regression test.
> >
> > we confirmed there is no regression by this sb_write_barrier-rc6 branch:
> >
> > commit:
> >   81c0fe022bd6e (amir73il/fan_pre_access) fanotify: report file range info with FAN_PRE_ACCESSS event
> >   f7adc6e4bdc0c fsnotify: define flag for pre-modify permission events
> >   90a5c1147030d vfs: implement 'vfs write barriers'
> >   ec6062fa62872 (amir73il/sb_write_barrier-rc6, amir73il/sb_write_barrier) vfs: prepare for pre-modify permission events on aio write
> >
> > 81c0fe022bd6ebae f7adc6e4bdc0cfbd1c970a8455c 90a5c1147030dfbc24dd96267ba ec6062fa62872cdd2c8d8a0658d
> > ---------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \
> >    1445389            +0.5%    1453256            +0.7%    1456049            +0.2%    1448979        stress-ng.ramfs.ops
> >      24089            +0.5%      24220            +0.7%      24267            +0.2%      24149        stress-ng.ramfs.ops_per_sec
> >
> > detail data is attached as sb_write_barrier-rc6-tip-ec6062fa62872
> >
> 
> Thank you!
> 
> Nipping the regression before they are merged is super helpful
> but it has the unfortunate side effect of fewer Reported-by credits
> to kernel test robot.
> 
> I would like to give you credit for testing the 'vfs write barriers' commit
> if that is ok with you, like this?

yeah, this is great :)
it's always our great pleasure that we could involve like this way to help
improve the linux kernel source code quality

> 
> Tested-by: kernel test robot <oliver.sang@intel.com>
> Link: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-oliver.sang@intel.com
> 
> Maybe consider adding a recommendation of how to tag a new
> version of patch that the kernel test bot helped to improve?
> 
> Cheers,
> Amir.
