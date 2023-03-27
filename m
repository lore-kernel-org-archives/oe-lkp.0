Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5923DA
	for <oe-lkp@lists.linux.dev>; Mon, 27 Mar 2023 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679925115; x=1711461115;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xVo/AK2zr/OeqzLcJnvq5Nk6rSrvaIGf7CGF1ZBvK/Y=;
  b=Q3D0bSuyCsYjuADakKIbF9Agg4F3CE10bc7ysxjvj7g+gZ63WP/LiOKs
   2yQQYAUauY/rwZgWA+wUGz3H3mEXCko0PbQalJ82zDQ/m/XFr6AJTsJl+
   dgL4bM0HuFbrBjplQFiesEw0bcCluAa0JC8nq5NhEqiZF9y7fuglQ7/Gd
   sWyEaQYBgk21TWrzjqBEKxjoSTTcTujgb4QHSpQvB5bsOLEF7Pv+dMqm/
   ebQYWZ8oRJqTsxPA9n+MNH1kKrCGjTIzaGA51Snprv/iilKPKvfsMpFPu
   fkj+2ty33HrjTv2ju/kZDF1CkOwff5wxiw9txWcqAac9qFNkpGUZdYTQg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="341840661"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="341840661"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 06:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="685976768"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="685976768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 06:51:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 06:51:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 06:51:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 06:51:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 06:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqfLpCRnzpzsAYqMzS/9OCeqBwyixv/1c+Ij9/+cx8CNlktbKCSVFKCc4ol3nDz+hVBP8IM3iuPoObwJJZfg9xbV6VmGZtDQ3KH3JJvXExQZzrJrYourgbirvthznzop8DqUP++/fPZU+14Se6VcCQtcW/omnJLBbhiXRlPYqmfyVjxYfuRTF3Xv2WSYIext9ux7HK/uiCmHCdxe8vSakn1JNqawn9Gzra4gyD8SYgDu7Cout79cOfn13JpHpRPPln6IxsG0JfdqU/z9DfyS2cAdf44SR5SgGXOJVJyR24PnEnSDvHrpWdcLZF9Hn2mUjTDwhz14AYfj86BKKmDfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpj7Lc6fLgaMEbtCsVezqA81deGmwazIGiwTb1drLfE=;
 b=PLygONod+DGKxvbK43sYKrH5ME4YiEGz3i6LoyA0vTg2WrwnnYcpSvv4O1M7jCcPIK+MuefgB+hFJeBLRYruFEOoT8iwLZH9Fep3DHTbdEeu2tjeasThIRbeKpfd4I1+QveQSRfdce+ZCk/tiZ+eG4AJY5Te/58BPbJRN9wh8CgFNAZX8xtr1E0NQOVd89RnMxAiBZgKhx+hEFu3jEHKOWzEFxVdiotdlUPGh1QTTQrpBVXfdHvwIBSTbl7kZQhtRdswEwuwFQCa+2JmBaJP+TcMZcHdqiL1N42JRTwkL+0zoRqeaOhSLK9639/9c1339viI7C1/88AprbA0ZpbxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 13:51:47 +0000
Received: from MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f]) by MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f%3]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 13:51:47 +0000
Date: Mon, 27 Mar 2023 21:51:33 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Oliver Sang
	<oliver.sang@intel.com>, Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar
	<mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <ZCGfZdrM0XIZjx18@chenyu5-mobl1>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
 <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6206:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fef07a-30d4-41c5-8ac9-08db2eca6837
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atlfdh9kR0/JfEHodFH0c4z4oyBLf70UbbRWq0jsPuLqvxVX+Z9J9W1pYzV+s8Ptuw5lWjJBL4q0PTNPydyLk+K8/LlKUkTuk80sMRFakgIjDh4GcHSu4qnDtkKPBz02aXuN3sRSCYJgXEM938G0vffEjCfKeUS0/h+iQmqEL0fjneTDvUIcHv04rkHc2ixWcQhpl0tDS/iqHT7hhki6Ouo5mNP/7xwoCVVruLbuhF+hNuzxPLf24Tkr6jfyd3q3IYRSObrJPuODAUWfBynjZqXyfQZTdRQlSyKJMJBw96Z+JcpZY1ybniXNXWMinQy6GOqn6XwHYagdMxjLOs2f+EqWzQgJpUlEArhWSc6RB9uC45ZikTrh2ZHm2S94utluzAPXibWVmbhR/z+r3inVOoE1xOzdmS+wIWvDXZlkSOAeMlvDshcqTLCqQtnn6cHASUOAtPF0K1t/3pjqNJE4lAZzygOR2MNTOLpawcpSiR5JIl5OmynjLFhRnt4PBjvJPet1gKeS/m1n0YBEoKP2GW/G9qxVPIOxEEq3znaczodPf4YDGeIkrkLL2Eb28xP8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(5660300002)(6486002)(66946007)(66556008)(54906003)(8676002)(6916009)(66476007)(4326008)(316002)(82960400001)(26005)(53546011)(8936002)(186003)(6506007)(41300700001)(478600001)(6512007)(9686003)(83380400001)(38100700002)(33716001)(86362001)(6666004)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?spU2v0bUWYJPWgqqi8mGdMIO/WbPMTa//jhVd0gwGhBLcG5siA3pxnwbO4?=
 =?iso-8859-1?Q?SOD3Rtp/hC9kQnaam8YyjG8D2EW0oTHYkyoME7cpb6pVTlfAOzQznw+eUc?=
 =?iso-8859-1?Q?S5ZtMlD7BfIaR3oHbuA5+HFpZ9PIKInkh0hHGNl4UFzkLHdmprdXAqamxB?=
 =?iso-8859-1?Q?MXC3Reu38ejAxaszhvNAq/JfFbGc+kb6B83hKxWPxKhRHZYOhAyfz+9Ap3?=
 =?iso-8859-1?Q?O3hQ53A0PTcz4LfK46MX2P6zENDptY3cYrwLjoAHQbrRztw5HV6w55p1tF?=
 =?iso-8859-1?Q?NMFscCl+ZmQtT8Km2QSQWpy9Gvssku0Ah11sXft2yE8+ENEUgn8xxA3kNY?=
 =?iso-8859-1?Q?iV3U1DVgzPRoUPywbTh1siXR5Fr7FqbY/Ly0zv0KhlbKcdSi1Xv/7OilR3?=
 =?iso-8859-1?Q?+neVlwX6+pvR9mLnfsGWUVByHIMXGix7uugaMQ1wIfyxflIPJfBjRXZVE2?=
 =?iso-8859-1?Q?R78M81Kt49Hby81Qelvkgmc5ogdswi0ZohQGwlnzqaYiy3m/So+aATNHzU?=
 =?iso-8859-1?Q?mxuIbJENxe4ZQsgz9RLvAnIvS+rw7Uf7gcUjX4JqmjxDbLSlykgQHnRAC7?=
 =?iso-8859-1?Q?7BiMT4kHMsrsRNvoFcLKdkYi73NhfaqP4bL70RZpz9BDVXiGzpqlhioa/x?=
 =?iso-8859-1?Q?D/4U2c2A2Xb4PHw/fqZw1MYAcvbWcPp6AIdBxWRGrFIwC5ix2jKwFhfuZz?=
 =?iso-8859-1?Q?xMNm62WxPKR86gf3wdZ7+kRHSE+Rp4F9yHR3COMT5VO4QotfsQOlCw6NOe?=
 =?iso-8859-1?Q?YlGtgjY8UPBxfuukmLqRXGdRqc1T3rEPRmltHOGX80YyxAdAWckVWD+Y9Q?=
 =?iso-8859-1?Q?TuPI+Bd1Stve7G16dPEdEHWsqqEAy6JjmGdV+LIZMZqG57xkddBAmaCMwL?=
 =?iso-8859-1?Q?6YYh1TC/3jdiOelkfKhMuYiEnpTPQGFADbfkWON94gGWT7VTMCFUY1XE9N?=
 =?iso-8859-1?Q?BzVygh1HFjOiS50visg2VSQ5N2MyuwbpyeJCDcurQTSGtmCd50lW8AQFzT?=
 =?iso-8859-1?Q?LxhmohI8/o/4sj6MvWsI5NnopvHTFwJlwbHqRHVryn9M2kLmnvebS76MU5?=
 =?iso-8859-1?Q?upRyh0Weo1v1yW9igO3qpukQfaFBGHkRwsPMLNoCexHoDdgie+A7+d0en8?=
 =?iso-8859-1?Q?CNwLc+d2RK0GGGZg30maq82IZwkLiOHBTuREAM+6RU47r5EwjRlXc539L5?=
 =?iso-8859-1?Q?I3kckjFktFyDbgBXYkhWSu+bfmy3PcxGG1kSTDu0qwTxIt9KncAgxhyGaE?=
 =?iso-8859-1?Q?ifc0Q2pf+OrQ+uIt57ab5PRdRFwlqHveeUzFsqBkr0MlnkEbvB7O3fbXuh?=
 =?iso-8859-1?Q?u9TUn9XIysGMLzpNgBL4WQ5xT2n17L5SjBFoMFnFdOKx1zgY8W7/z8XzP/?=
 =?iso-8859-1?Q?GNMx09pZb8qeDf1RsDsbVUPdadIfrYxw0ePWw3qmvvdKcaRichfB6TZ3Rl?=
 =?iso-8859-1?Q?MeNANYujYcb+EhQ1BFuxIHcS3jtp4r15OkzQ2LCTM0fV4cde5bjX8uYFNP?=
 =?iso-8859-1?Q?hl0gEhnzx1P9S/Kk65tWz85WMSm5XpeEEJ/pSkNvUNGn0wEy/OdgdyvhsU?=
 =?iso-8859-1?Q?2z/XGwcGCxPsjNla0hASsZy6Xivjlz03eQldkNSUa43G1f2Fj6/tUnEyjl?=
 =?iso-8859-1?Q?88wW7fg+/XSch0mqn0QN3hjM5c3n2WA9dt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fef07a-30d4-41c5-8ac9-08db2eca6837
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 13:51:47.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gebEr0nuNsKEcDJDXJfeXqNu657cphopuhr9llr+Ey9YnmyG9AmsXI8kxAE//dGdUEo0wQ47xc6K/LzdRoQKpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com

On 2023-03-26 at 13:00:24 +0200, Peter Zijlstra wrote:
> On Thu, Mar 23, 2023 at 08:23:21PM +0800, Chen Yu wrote:
> 
> >     stress-ng (throughput, higher is better)
> >     ==============================================================================
> >     case                    nr_instance            baseline(std%)  compare%( std%)
> 
> >     futex                   25%                      1.00 (<2%)    -3.2 (<2%)
> >     futex                   50%                      1.00 (3%)     -19.9 (5%)
> >     futex                   75%                      1.00 (6%)     -19.1 (2%)
> >     futex                   100%                     1.00 (16%)    -30.5 (10%)
> >     futex                   125%                     1.00 (25%)    -39.3 (11%)
> >     futex                   150%                     1.00 (20%)    -27.2% (17%)
> >     futex                   175%                     1.00 (<2%)    -18.6 (<2%)
> >     futex                   200%                     1.00 (<2%)    -47.5 (<2%)
> 
> >     It seems that when the load increases, there would be regression in "switch" and
> >     "futex" case. In the futex case, the regression seems to be caused by fewer context
> >     switch. The stress-ng futex would create a lot of 1:1 futex_wait/futex_wake pairs.
> >     And it seems that with the patch applied, there are more wakeup, but less successful
> >     wakeup. It is possible that the wakers are stacked on 1 CPU which delay the
> >     wakeup.
> > 
> >     For example, more wakeup attempts:
> > 
> >     49.27 ±  4%     +13.4       62.63        perf-profile.calltrace.cycles-pp.futex_wake.do_futex
> > 
> >     However less successful wakeups(context switch):
> > 
> >     852533 ± 18%        -35.0%     553996 ±  9%  sched_debug.cpu.nr_switches.avg
> >     1.01e+08 ± 24%      -36.2%   64471512 ±  9%  stress-ng.time.involuntary_context_switches
> >     1.271e+08 ± 15%     -34.0%   83868905 ±  8%  stress-ng.time.voluntary_context_switches
> > 
> >     BTW, I thought this is a use case for short task wakeup placement. Waking
> >     up the short task on current CPU when the system is overloaded might mitigate
> >     this issue.
> 
> There's only a few hundred migrations in this workload at 100%,
> placement is not an issue (nor should it be at that point).
> 
> What does seem to be the issue is sleeper bonus. The way this benchmark
> is constructed (see stress-futex.c) is:
> 
> parent:
> 
> 	do {
> 		futex_wake();
> 	} while (keep_stressing());
> 
> child:
> 
> 	do {
> 		futex_wait();
> 		inc_counter();
> 	} while (keep_stressing());
> 
> That is, the parent is always running, while the child is blocking.
> Consider the parent 100% running and the child 50%, then a truely fair
> scheduler will make it 67% vs 33% runtime -- this is what EEVDF does
> now. And as you can see, since the child gets less runtime, the counter
> increases less and the benchmark drops.
>
Does the 67% vs 33% comes from the lag placement but not from
the deadline pick policy?  Because the 'lag' remains consistent during
task migration across several CPUs. So no matter how long the task sleeps,
it only gets the time slice it deserved to run after migation and gets no
sleep bonus?
> CFS has sleeper bonus, which gives (short) blocking tasks a small
> advantage to make it 50% vs 50%. And if you compute the drop from 50% to
> 33% then you get -33% and that's exactly the drop you see around the
> 100% case.
It seems that EEVDF is actually the real 'CFS' : )

thanks,
Chenyu
