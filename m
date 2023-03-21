Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104A1FB8
	for <oe-lkp@lists.linux.dev>; Tue, 21 Mar 2023 08:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679385876; x=1710921876;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q/VwwMBwMTYrHGs0ckxJVGKxAdVKkhPtdLe+6BCmg90=;
  b=JA6UuCFUHlUWLivhMQ03IZbhPePqZ+RbBJezwHQl8/SelNB+ndbn9gja
   f/xpo/HpHn7rtSfMN/8+YAtvCj4M+jkEVK7+KDCOIdLEGvOKkZ2uGtFhV
   Na1yYm/YElq/C5ZTLTzZ6SJZDnyc+D3mJb6J2cO0gNn0ew/jyjoYlqtJH
   Bhe3+i2bJLNTrOl6Shafu373wXk94G05buaa6PrTBJt8afoPK/lesYTuP
   Vcmn7MdUpp9DY1Pj7B55HpwS25LWfejfMYwuYPmPXsgDi5GQA8djjxwog
   N/g096ZwTlg+TDBZgWMd6EsLcONP/TogGR+R+9/LjLQtTHivN76y0pFPY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340421551"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="340421551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 01:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713891073"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="713891073"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 21 Mar 2023 01:04:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 01:04:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 01:04:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 01:04:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 01:04:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOkyZ4qoevh/LWqnxZn2RGAS3ZBKnbcvc/uvMnfZCsZR8heNSkzManopHLYToq+BbDKa/ohe4+yjG6zxMbzg+6/KD/aL8KxBk0oNXenguktYHedoxsxueGqDKzLTpMvpCi/mFzgffJY8Bw/y/kjSr0DlKs3YMHlr95h2DWJqCFzKdGUc9jaNX4sPZl4kGGS5fFpvv+D6pRH+VbAHe5I9H4HgR1Iz/TVwc7Cr4MK0/r5zKR63meLEjf6QKNJh65y+KCGiexmymaMO0eTijBpnIkRdO+ZIm0hXtSGqE1kSBJviVHhZ1ZtvyAxFxyFj+6GcgrinhHl9yC34I2fyg5owmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfWbcgYUVCm4ANmsJQ/4YT74vjrjEEIMYFuTWij8oCs=;
 b=WTEt+z5n0RoxSTqkx/U43EeLap1/lkVfirb4nMP2xicey0SXKfJGdM+8eU2Z2jC1YSwlgxjrv2T6yhppEBTOvMaKjyyCL3Y5DP4oDxCyxufJLJhpSFOQrkyLfaoS8u46KagrXb0I1tJk8DgW5p7Ng1OM/SIItimlj5TwU3i0UaCwwC7E/ZhzS+4YVh8Yn4vYMSUl9vJfW+k76ARc5Nj1vCxbb5HbhEAleePnFQ2QOt4ogehc0zUOjZlnd0ObZ4MO9YCBtjOJikKGTT26o46JJ0Vqf6k3FNaWbbzihF7dMvKInRrteSaysbN+8GN4QGoEOX5On7gOn3jRy3Ngy79+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:04:33 +0000
Received: from MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f]) by MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:04:33 +0000
Date: Tue, 21 Mar 2023 16:04:19 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Oliver Sang
	<oliver.sang@intel.com>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6206:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7a0dfc-e289-440b-7a09-08db29e2e787
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZIYoFGhL4FO5Ud+Mxr0mEU+eEecM2ONOhjy+9OtlAYVXq/yQ7BQS9CmwyEEfXNyLJRJduM1/LHbz8T0TWLhAmsuaRm+r9EY6qgBiOWhO727lBnMG+AQPkkUcMAL7ieGeJFGstZApgL/90ydaa755FJmnHQpSN9Or3JP5MpNSYGD2zxpgzVZDPvPIWHgI7iSQLWKnIOhK83YE0teXMm2L7P5dzmmoNLQTIvWMgYGRAvPQvDXzioT/nFLCfeQHouvdyDVb9u6zsoEBXrSd+LIYGn/UXz1Hzg29Nrybb7iBLnbcOQcih2RDiwoaUJca9XuM470+sMtOjEQ9RObVKvPvnxKXq9cDC0XajOEAXoNb3U8wRU+HajxvH5RhhJTQkQ6ooWHIhZ6bJ7zGTOLQXhRb6gchOecayFteFTQkGUj5aR4K25X6cpvXVB9+3+FvqKqbuUKSh649EdYf/q8nmNNSrmaO0sX4H9pGr41MFIoJON1nNbz4dp4xKGDwhLYGoxIfZQ8unmiQdgEDKtizT3i3r2zoYChy8jwMZK7Ix6ATyKTdDTAkDAgF0dSMSispy9NCJBV5qlKwIrtD8rbEMC/ARTzGRgAWd37rcv/9CAdkU3EdIrku7RypmyFLM7Ky6Hh7OHkXd+JTtLNsdhuXgbI9Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(66946007)(6486002)(5660300002)(66556008)(66476007)(4326008)(8676002)(6916009)(316002)(6512007)(6666004)(8936002)(26005)(107886003)(41300700001)(6506007)(83380400001)(53546011)(186003)(9686003)(478600001)(86362001)(33716001)(38100700002)(2906002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPII41+9kNeah9PuFcvBMIaX9VPWse5WPStmkr+DeJj3JT7WrdHGfeJi5fhz?=
 =?us-ascii?Q?g31wKNhNmFpgGR4KqkOOT9FN+Ia391kwl0EbuucmFQsf17ZZgIBnUzBd7dnY?=
 =?us-ascii?Q?Fv8f6YMzFq6UpOowQLWATdRQwl0+yK5aGIb3GBGXgr10rrxY29XySswQi4S1?=
 =?us-ascii?Q?hO/Yuc3+Fe13re2qPVvNmGdWm4iAxHOZfs6iU7sjebzTHpqONrbWtBCRF4zT?=
 =?us-ascii?Q?s8aj2ZqIby7bc03XC8zTorDSEmFORDATA9gt12wlQKoFqNLV5q2hogFt6qVB?=
 =?us-ascii?Q?T3scYVAfZJcYkkIYlKoCeh20CsIaFBmEq67xxn0shTR7kNMqX3D+RIoF9xZx?=
 =?us-ascii?Q?3Vtkdu4SZ/hxh5NhJcZkG6rpCOs5Ww4ER7z4fDlJCM26eKp7p3mj3fu18pSL?=
 =?us-ascii?Q?HeS8dMWuLSJWzYdjzskRxm2pFCYKwKt0Wf60yodGit/Ck8BzK63go6tUZn9C?=
 =?us-ascii?Q?nGJrDSKaRa1EpJ1rndDCL5KKJ8my8/C7kZFn6N8uktXhtfWUcrvkSaSdrKtc?=
 =?us-ascii?Q?iysmYpMm+WlCvAPPoUcsacAjeae/o9Hytu1P9auFTAsR5IA/bAbd9TkOe+vR?=
 =?us-ascii?Q?b2FEqoAApddS5oSwNalI02SULfiyJ3mdwCUlWP8Kk6wE7z4T++0tPswk/e+3?=
 =?us-ascii?Q?PI5MXP0e//Osl3CzlvrE9/qBZSmN7/ldfMcY8TTJHK7K3Edo77t1WgV2jrLV?=
 =?us-ascii?Q?vekjzRbjAtqFbUvlPfmkNVs0VKqFGJ3tI3ggiOmPbl37sluFdA+ZhEzsEjfE?=
 =?us-ascii?Q?SZt1ZqHihGExAJiw++YgGrwCf58CcKddxVCB4vl9JGDIsyNF1y0RzKdlz3gt?=
 =?us-ascii?Q?zhklbn/VpHxrX5LcdesOmW1ExhtABBjuyGVqiJZGt9ZkTG4ijroyb+9/XU/m?=
 =?us-ascii?Q?f6HMg+7Z8PpKmQu66spjHwloZwNyEM8UyKevWYgVNg/3/8A12rLOXkBqhOIT?=
 =?us-ascii?Q?2tLLhVQHeVXcBn07t3D275KF0jth8prHqLDLKkiigdL8iy+kaPD52F0LFJHK?=
 =?us-ascii?Q?1h7kdoow0EDThHXXsEKV8be3pIP60yDubbcPWB8hZyj65KYfuTAxkq6xLPrM?=
 =?us-ascii?Q?SfAcO6k4my6McQuD1sf4z5XKnvzC0JKAvVeVZVL97Sscqr78uctTbK7mLlGZ?=
 =?us-ascii?Q?CIjIPVmpB+8HnJxle7Xg0732e/q/bhWQxMIXaqbBojv/Gbqr/7hKSw7ei8Yt?=
 =?us-ascii?Q?piW5xNAUAdksMsqS4suIGKNkgBOmeC/uEAR7jtIad6Fzwa2NblHWsrKQdDwk?=
 =?us-ascii?Q?GGgMwL80WV9YzdMkj0acxvmD7NfLhzjx/FM92YKfKAMVMlIT/b3iYyL05TfW?=
 =?us-ascii?Q?1M+GxC04x7TKYUnyBaCT9U44ZASxBF2GgCm8eB7BcR+YisvkG2Kz2rUgbm47?=
 =?us-ascii?Q?SQMRUfGjZQ0unyqDoQqn7dt3rZ6oGGyHHzySPlJFHUFXs77SO02H9RvSeUZH?=
 =?us-ascii?Q?iQawolg/ugsXfICA65SQt1S0nB85wiwn4ai8wwzXkhEitnG7NHwNmscW75gz?=
 =?us-ascii?Q?wshXJdr9MdxzptFidx0NZCikE1vCdP2pju1j6810YRovjJetUd9WrFVNoLf7?=
 =?us-ascii?Q?nkddr+wJxkDqZSGIyD5Rkkz45MWWtpcVaVyV2wZi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7a0dfc-e289-440b-7a09-08db29e2e787
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 08:04:32.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkOuTDMQBkMP3aYiq0tn5oViav8sk01BbKsKEI/x2ztyPlt8VFS5vxokM8hK3MfWhwSL6MC/pk2F1VKJjesC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-OriginatorOrg: intel.com

On 2023-03-21 at 15:46:28 +0800, Oliver Sang wrote:
> Hi Peter Zijlstra,
> 
> On Mon, Mar 20, 2023 at 08:58:50AM +0100, Peter Zijlstra wrote:
> > On Mon, Mar 20, 2023 at 03:46:57PM +0800, kernel test robot wrote:
> > > 
> > > Greeting,
> > > 
> > > FYI, we noticed a -18.6% regression of aim7.jobs-per-min due to commit:
> > > 
> > > 
> > 
> > Hi Oliver,
> > 
> > Could you do a full performance run on the current sched/eevdf
> > 04c54aa28eed ("sched/eevdf: Tuning...") branch?
> 
> got it.
> 
> we will test netperf/stress-ng/schbench/hackbench/tbench
>
Every test we will launch
25%, 50%, 75%, 100%, 125%, 150%, 175%, 200% of instances per the number
of CPUs.
Both the latency and througput will be monitored.

However currently we do not enable the latency nice for these tests. Later
we can enabled this once above tests finish.

thanks,
Chenyu
> we will also pick some tests from vm-scalability and will-it-scale as reference
> 
> do you have other suggestions? Thanks
> 
> > 
> > I'm expecting wins and losses (inevitable when you rip up the whole
> > scheduler), but I'm hoping for nothing too drastic.
> > 
> > 
