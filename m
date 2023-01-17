Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70EC256A
	for <oe-lkp@lists.linux.dev>; Tue, 17 Jan 2023 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673960730; x=1705496730;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=k6UjSCYoH5hH4PzCraDozuOx2xcz+Em7qrMxUPKiJN8=;
  b=UhLeV8Fpcg1zbl4pd9KiYLRDkDjs39XFB+O0BB9BIPfvSqUaHFw5x5ZA
   QMcTrJlZMg/DZu8MaIdwDNPNkXoJO2OOjVGpC6wIWaj9YvrZzjPIwPI8b
   AKdTFTC9XusK6USDp13SbM2909pHalMYOnNADehy+qRG25CZt/BPblV27
   Yy/Fr9sjMgBTGfqIEHukPfun4IP6/G6x6iceqrHH860ZiJu2r8H8Zo4Yh
   1/NTGS0mAQuiAsOtOJM7YYlOGssZvJVoXxYl9we+HltOlRkWcOnBTgliM
   uAT9Je/zv+RiTIAI2QcLnnW0ltXxkxpseqmw8UrgSuJMrHWurSUKrxZaO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389188687"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="389188687"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 05:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="988114987"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="988114987"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 05:05:29 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 05:05:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 05:05:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 05:05:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1/7gpTYQAThTIjA/3ojkaDo9BF5dnbmACquWpC3qETIylEfeezolw/3tSfDGsO3pTo70Pk/A2cpCsmHiAmo8pyA3GmJy0j31CjygrFx5UMP/R6qyeSqmCkBjBHWM/GswIT5S0V9CEJ+870cH7nyqCUThy5aqXVXtIM1X4bjdd180kPyfN4Ab1P94T59r5S11K9ie3BnWxJqgGflRJXRg/A6CQziSNvVHBoa+YwTjn+2cJmt4MTzqnL0CgzelPzfqzRjoAmYSnIxIhiWPMRmUkbBF5ILbgtxXF9n8rPQn+I1yTtQiSZ/zPMQex3pIqgvBDcdIEZDSDUOJiftII76VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnNtFltWbfDR9EQpt8ZfHX6x7xslKxSQFoZ+Vot0w6A=;
 b=VW43TlcIPi0md/mEAFJTM/y7RlNB8SQuNCSFloaqif8s2hUu+7aAiIiqNXLqDSJBwBFMqE6Hlh7WAOPFgC+UWUY/QRTXsAWGsMqBpFr9ZKcbtM+RPqipWNSjmiJMWP/2r/2YnMW56Vismh6Sh8TxHgqlp/CN01R8qaNqDMVz+M7CvQBLSbHnx1P0hCNGzszvkizhYyZxBXabyFgS1BXsm+wHE0Ng7vCeZqda2aitm3IVGpO5ctMRmIMCgaP+sB5rl2xvgXiTEzTi9539rRr10JowZ5y7omdKwPON4M0fX7CkDVbusV7RlGWGwxs77OMkj5tG6ItLLM5NpvDAWO0QZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 13:05:27 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 13:05:26 +0000
Date: Tue, 17 Jan 2023 21:05:17 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: Re: [hch-misc:btrfs-bio-split] [btrfs]  b7c9bcdc17:
 BUG:KASAN:use-after-free_in__blk_bios_map_sg
Message-ID: <Y8adDdqXX6ptkU7X@xsang-OptiPlex-9020>
References: <202301171441.da2e9d11-oliver.sang@intel.com>
 <20230117082042.GA19116@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117082042.GA19116@lst.de>
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 34cfdd94-c6e5-4a15-c830-08daf88b8069
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKD2aQLTsoArGBWlhxjhxP2dakO+dQar2RMnn1TK+CNjtGhjlFrDpAASJB5ZdwZ8tUQ8I1eRy0l14wc47ijAegR8oTcKXDw2fTTWj0R2QJLx5zcFjvZm/Bf2wOZI8Jd6dyYpY6yfYT6Me8ceYDTyUT8psi93D+N6ngHNftTVi2I7hI0qDe5PbEZ1Iz9EUYQ00K3Ek1O8NVmg5L8XJMZD6TfJ9T48FX9jhRMwFes2MOi9Siwzk3YmGY991IQoStsBMhJ+vDxQGtbJoRadlv6YKnri1R8pd6FNyKLJFZ9SXNlBaK7OeZ5TcTUQ2zBW+ZjxT8jqzst/ha3eqHznOY2554ha5f6wAujq+N4v9cSK8ax4y68/+aMcJ9WazsQRBohURYmZrnOZzQq1tSezKXtaWVWgqDqUeDKYttsA/FSeoFNEQW8cOJO3IjclwTGEDorJnmq9VieWTzBI1+XKlJQ/bbklz7rhp5YJV94NwViTsdKnX6SkFSEOhaFd9MxRfUVCBqylasFv7H2lZusSWeqhSuolTMH6Dq2kg44AN6JxBhKjhvAJz1Z3TSzBFSJ+Bkl9XsQCrsp9icGCIBOpvCxvl35+vdaUXYq1+8utbEK76rs78wyvUCZBUAnP2+2GDMGblsBSOSnO66PK4MNLyCXVEFC77iQJHD72MA3Y4KEpo7b/pD9vjzNNCttYFGSaI2QQuEwEQ/4odSYOpLl4f3vjqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(5660300002)(8936002)(41300700001)(44832011)(2906002)(316002)(66556008)(66946007)(6916009)(66476007)(6666004)(107886003)(8676002)(6486002)(4326008)(478600001)(6506007)(83380400001)(33716001)(82960400001)(38100700002)(26005)(6512007)(186003)(9686003)(86362001)(101420200003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1s6cJNpE1sZIEJaCpAejnylB0CGwNbDZ/B1jkTNtBxhBKFqKxC7sUNM+W6e?=
 =?us-ascii?Q?NFDcBXXp/VWOurkj9Svt7/5SBwyUwtiBCoDcycVoDzcQ7KkNY1aKvjJFzLju?=
 =?us-ascii?Q?2sEn2nbopNMutc6Moe9IR2uh3HGui2HQv1JdDkbvykiOUCGBy0L3W7M/cjQI?=
 =?us-ascii?Q?2Moo34pmUfJjP3xor+BA9Y1sJEcrKkrmtiHCng/JYj9YNyLfiNRrARyrI3nl?=
 =?us-ascii?Q?Yt9yZOaldt3jcF/0i7t9wEB1YotOWHlvoM4LfiOlkXChkNNDKnJjQawBqSuT?=
 =?us-ascii?Q?YyGZTqX5MlzhoF+4Y8VEAUY+uUxMxfF/Qkb0BM49f44Q70dV0/Mx+EqNEKZD?=
 =?us-ascii?Q?JqMRDWSbJAYJratU84u1PUEaY0jfJjwFih960nmBBCfn+23gwflXfqUPM0kw?=
 =?us-ascii?Q?Z1R+zB8+/OuRYJDhS4LHm9CmopGhazTau6p9RRt5y2MxNMfATiHeAQ3c8iR6?=
 =?us-ascii?Q?De7581983sDMMYBVf5vkJ8HK/DMn5pbIHIXDjsgdJ7+J2UTxtCCzf/0K/gTL?=
 =?us-ascii?Q?NOSJbciFaZv8ylM7wcgy+7IprBupjZEBBSz65IaWJtwrL2FGpxUMHrEu6PyU?=
 =?us-ascii?Q?kFEjCfy/wFHhnnRDvrRHUDKgML10Nxci7AGEiQhZ8KurndjdeklnFpcstmVJ?=
 =?us-ascii?Q?kbiZhraUxED424gpAl78Ug9e+y/DBlJDKSxDzLPnZ4QgjvM35zCqa14of2Gs?=
 =?us-ascii?Q?2ycmBmsPBqp9clrWahKV32q9HJcbgw0Q32F8HnXYSUWedfhhWLqLRfce86go?=
 =?us-ascii?Q?jxuovYSdHmVlJBqjowIxOgkkJ/regpPsl3uhOsguwEAV2QCxHTW2e4KhSF+P?=
 =?us-ascii?Q?VE4ihNYvoUCuD0E+mwFo1B0KaSh4OT9QzpHQTUwCBuvcZFLHCkSPO9DOqHPr?=
 =?us-ascii?Q?RArlw0ymV0zml+47RiSe80lDKXNawdfnBYhv7BIi4zVfk1GEpuJ/27nYDzBS?=
 =?us-ascii?Q?wHX5S7MAMxKgfVd8Vv9oUg/odnMWpLDXHSMvvYMnFgTi9BYEAsr5N7SBogua?=
 =?us-ascii?Q?dpiWdKlin0UPsVvDMoJ8z3rKXrwFUSQl5wkdGuwvg5veqiIkPcQs4hToJXt+?=
 =?us-ascii?Q?+SXkzyjwknn1zkv+tdre7WkSiMu25hGubvVU7dcsVeGQq3krbWQcujgomQu+?=
 =?us-ascii?Q?rkQ2uHX/yI8YL+NRmF3iaRgNjGCF6BN23/Pxor/HBZvXyhSTv8wlSAW+Fz5w?=
 =?us-ascii?Q?+dOtYQ61N4St6Nx9UF6tu2q1pvympFrB8C1YvZ2J/rJHln6Crouq1PBiaaGr?=
 =?us-ascii?Q?lksvwZf+3RK1CG2cGezBQ+pYlpoMakr+ljUwfBOaolFkxaoOHhb3H5YLJ28v?=
 =?us-ascii?Q?pRtTrF6tuSWbJRd9WTj1VfLJOpAKf50dXO7UWOUesZ5pUGla9uphySiHD603?=
 =?us-ascii?Q?gaKb2YC0/tonpHwIwUKNMIBqb4fbn+y0fkApis6hEuGswzSKcl8rCetHcvO+?=
 =?us-ascii?Q?heyC0JAVGMOhOQaIqQvgNBQw/yEEaitKW00FjMTdKsmJTfVWPoHfNJqwQLBl?=
 =?us-ascii?Q?YTX0amxI9128eCb+NsmTUR05twO1ldywxpp6yYmcgTgdNM33qeJrNfeaN/cH?=
 =?us-ascii?Q?l1nbYAu1VG6qbM5bTpAX+Tbm5worB0MtJRRi5lRO6joLRQJt1S5wN5adPVdo?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cfdd94-c6e5-4a15-c830-08daf88b8069
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 13:05:26.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QS7fC8wTl9MJay7No1KtzhAR+BJvsNrev6a6eOe7usgsVrwKj7ARN8yjVNcGnZsMx4unO7wU8Nw5dzmu0og16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

hi, Christoph Hellwig,

On Tue, Jan 17, 2023 at 09:20:42AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 17, 2023 at 03:57:20PM +0800, kernel test robot wrote:
> > 
> > Greeting,
> > 
> > FYI, we noticed BUG:KASAN:use-after-free_in__blk_bios_map_sg due to commit (built with gcc-11):
> > 
> > commit: b7c9bcdc17f3d9a546470cca6dbf717254ca5291 ("btrfs: remove stripe boundary calculation for buffered I/O")
> 
> This seems like a really odd commit to hit such a bug.  How reliably
> was the bisection?
> 

the issue doesn't always happen, but with a relatively high rate.
and the parent doesn't show this issue.

b45951da8e8f13e6 b7c9bcdc17f3d9a546470cca6db
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20          80%          16:20    dmesg.BUG:KASAN:use-after-free_in__blk_bios_map_sg

BTW,
we noticed the commit date is just recent, not sure if a porting commit?
so just sent out the report FYI

commit b7c9bcdc17f3d9a546470cca6dbf717254ca5291
Author:     Qu Wenruo <wqu@suse.com>
AuthorDate: Tue Nov 30 17:21:58 2021 +0800
Commit:     Christoph Hellwig <hch@lst.de>
CommitDate: Thu Jan 12 15:01:55 2023 +0100

    btrfs: remove stripe boundary calculation for buffered I/O

