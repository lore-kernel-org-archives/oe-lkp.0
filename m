Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289C8F4A
	for <oe-lkp@lists.linux.dev>; Thu, 23 Mar 2023 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679574231; x=1711110231;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+AzZpIfcSPbtJ7igLkykn4WoJlKSul3SbtxLRNcfHVg=;
  b=NxrpESKj9UA7CIDxQZhHafaXvTG9s+ZTINDgLlnYkUcilAR7bl4CJEhG
   B2cq8hIeaujMB15lr5bVojzqPUylnMcZtGhzXH6oqRLNPfF+VG52szcgP
   naC9EEBgIITQUfGOxtUTp2XPMZMe6n59+vLI548p9BHRFdOh9FDgHtldL
   XZuMkZEoGD7Twhs5MaiSNRvsRoM/LhrKMg9LusWUm+IT2Dcy0VWf7vPZY
   UWkGVuNFyma9waU7kxAD7mfd0T0ZEvwcK5vMWsDvxwrlQ8m+opSd9rS6p
   3Y6rp7clWkycctyBBgj4k9cGej4RH4C7UF+iggjfbIR3PqR5SjWeuVX6u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319125266"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319125266"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 05:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751473028"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="751473028"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2023 05:23:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 05:23:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 05:23:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 05:23:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 05:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6DUSOeWWDd7n1GX+dg2+7NDihss07TFuJTBi3V8Gjj5xbN+ZBik1vW3AN6rf+I30K6IIqQqV/9VFaeviIyuwYzHpiTKXiHXrEJrHqQvAmi5i1HuL5k/AOSo8xD2oqSVsPGaMKhKUWWCcddH+LVDeKWf5TdhohuUldfh1ETqwHX7JJ2Dq4hZSNnT62I8kjMcKDOGVhKk4lvfeq9/tLJAjrl9Nr0GlqjqfanQiQumjK8PqresYUj3Zony+SisreB0lqj5Oe5gnuydp6hPsLlTvpywu+TCNsTjjmkHP4XCBHwpVn7WpwofRlRaJAeKOoqZ+y00hfSXZVryqBZCbs2OUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BxYaZhTrbNR5zmptfHQJXX5h8bdFJsGDIgSm5YNwRY=;
 b=OJcTbwGVlyytNnwZuDpenCNOe5edYVpBsT2xvGUEeyJm9oli9f7QJHbPWnAVPxYFpjDHLgrp9Q2Zdq+0MK5j9w+iJMcQZtm/yL6OJbCM9J2EDi52eHgYss0VHNxgeGrT6pZhYY+WkI7tP+fAE9fztbsGsKGzpwLHEwpErvhcvVsTbnvQqJ7rWu3ZMIOmKsIgP/sIs/QLxMPGkU9jYxPzjkl0kTwHN7o13D+GCSmtcy8NJ4HtWNh2kzdvF6LRwouL7a5f7xGLYTxrVFPLmVV3Fi8Sb0FDpx9ZzCFiqmKDkf12zFCPs7V1uZCA1LG5DvXu7VOmqRKwnHPf/WNTxMNeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:23:41 +0000
Received: from MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f]) by MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f%4]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 12:23:41 +0000
Date: Thu, 23 Mar 2023 20:23:21 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Oliver Sang
	<oliver.sang@intel.com>, Chen Yu <yu.chen.surf@gmail.com>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <ZBxEuboumEifedjG@chenyu5-mobl1>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6206:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4a5d25-29eb-4a7c-d449-08db2b996fbc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJcwCH1BcWVIL3PYl3LpYQCUXstom4UuCb8/dOxNMTs+xqBTGEIX1RMShH3fLC/qc2m57IpVJkWD5AdnVqbkbw1uv/yHJrWB+9WmfkMoqnbIjoHtzU+doZ1YxH6udvF2BbDGa3WrINKAMSEGNyhbCk9n7FLL6TKTQffsNqZp0e9U74U/G7rHg+nDQd4hIfhI9Xu27MWClidQRjmcRjEryF/Q4ynzJ2f+30tCjS7aEo8ocZaGFI9s+CfcPxZsnPNEsScjYnAJ3EC3DMyqZcEltNJzf56oDkXJIlbvt69BwKn822M/PGvMWcKQ+gRsjWLZz4wc4BECj/iAcbDslc7tPYKJiCVIgPzkWjJZvRHnJnAHZu6S3DidVDQfZ+faUIKRkGsHNXqrdRMSFxASzHF9NZqbI52YgY1WaW6qTDX6t/JgvU8XjB9DFkB7cbu94dIxRVSOf0U10LHNq/qQbCUdHrAJe3sg0WM0hsSTlHgdRy5CYOAnXSr6oHJ1YhC9o9GN8x9hJ7wq1D3KjFe7pq2Qz+7uoQ7qUu3kk0mu+e+qcJ4+fNT0bcBOu3jAud0IFx4ufIeZ6Ne7Gt3XeiQMNeLvYYnYRkACDUDuihpM9MPnyudeuZ5fHCkW2zq5d7oYeyVPKsIp/sgvRLL9whKk9uBfWtMMHR/CbZDSajg7L6REJKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199018)(26005)(186003)(6512007)(6506007)(53546011)(6666004)(83380400001)(33716001)(86362001)(38100700002)(82960400001)(9686003)(8936002)(66476007)(66556008)(66946007)(8676002)(6916009)(4326008)(478600001)(5660300002)(316002)(41300700001)(54906003)(6486002)(966005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3gVXMGUOkevq8gKHQBAuff/C8xMG/DeAqs+9NcOELgvkA1xXu2WWqau1ia?=
 =?iso-8859-1?Q?IB+PBqqhZmbV9Jy1KqXsIGtPUeR6k61ievoMriviGII+F8tgWNWpJ3ahUl?=
 =?iso-8859-1?Q?QzkqEWRfl/KQwJiGyGPBRHm4T1C6Ty8szJE8RpE/KrI+FAnD9dqtqhE9p8?=
 =?iso-8859-1?Q?CKd2BuAnZE3W2S0tE5YaVVw7gpq5NjEwSfEnDS48JGhggQ6dZaNEwaDXUv?=
 =?iso-8859-1?Q?D6dmplNZYzdrD+eNYNYW/LzOdYSbDJ36aOZZNvBvciQ74HgWNVlsnEhiS1?=
 =?iso-8859-1?Q?03XJKB6bVK+ycZg1db9MN0bStSHvJbxoHtjdh91gs6UzAbXl6TsVQhZs1R?=
 =?iso-8859-1?Q?oD6mv1g8Jq3r1oQRwvALbkbZF9NdlvDLfUPNWKm0sZ7xJ53umUrOzCfoIV?=
 =?iso-8859-1?Q?J72Ofulp2D5KQMuBpKrWpYuyUNSLbzF1XRp3tqf8uMPAovDd707BaoMRnZ?=
 =?iso-8859-1?Q?Crp+NG9a5o8LDJoLTChdMr3QOSluG1mdUC/GKT+7UXFkAqkEwVVGUuIdmY?=
 =?iso-8859-1?Q?5dAd26ZwaSe8kocgKUtr/6IvC6GJlNeea6UexoRPfuZZ9YS12QxHHy5Nx+?=
 =?iso-8859-1?Q?mWgfBJgYP50+9UJ/cTA0KQPSsBCtHxsHexkqRwrV6fo71kXzh0nFoLfh/t?=
 =?iso-8859-1?Q?k9ekxATHi2156VN0b604+5yMR95eXJUL/DOVDjYFaXKkzhUbK8hAeK1v7Z?=
 =?iso-8859-1?Q?vaZyouhpGB/ypqwT/FEnSQy266SBHoTV6Nkxh7NO3LwH3R80T7L5R8Oz/z?=
 =?iso-8859-1?Q?hH4Ahrw8CaARz7e/oRv8/YaL+tp298uDJTRIivK3tlERC+UTMuqTGnq7kg?=
 =?iso-8859-1?Q?Sy0+L1lLHCWQv1VO7iH8gM44D4ZgRL0kQMh/O3RSPYaeCoA+4uoGY3JgJx?=
 =?iso-8859-1?Q?+3tUX5kH/pSthx9h6Ju+/CMLyC6XUP+hIr8VOBlNchJi9G+IL5eK4q9Gb9?=
 =?iso-8859-1?Q?Lj1mogbM1T+im+TPgqpsFI0nFLJuEMKs2cNqdM8ZU3Rbk7pu1v3m9uOfUJ?=
 =?iso-8859-1?Q?6d/a+eddT0qjTk2ih8oo4apov8Y66pXgr0d/btnRrLrstO9Z4G+3RywqKy?=
 =?iso-8859-1?Q?2mupARB8lcgwdc///dYUjerB2Jb66WkJ9gPI9J9vjXSPt38DJ7fr3byhLK?=
 =?iso-8859-1?Q?asLBZwFxE50nXJtnWW9HiDjrONtvE79icQObuODNuTUOsxgc5PToRi+anD?=
 =?iso-8859-1?Q?gkatpxwK76WzxFvcp2wVsIxODTeo/HGQvQAc8baNZ0T+k2US4h1QYkq8sR?=
 =?iso-8859-1?Q?mIDdRGWYJR49Dk1xPQYYS068M/fJs+oDevRfK8f0mHvKbJnJ0nT3EOUxmz?=
 =?iso-8859-1?Q?5x1IdJMhzz52ckoBNdqfqIIJsltCIocohMfE/gSxAgCROctSOa0bDDZoTC?=
 =?iso-8859-1?Q?UUsrvJ+k0IfrL1rnUD7IhpBnMdVvxFeHnQRYcCQcIT4W+gsDRyefjq3Wdz?=
 =?iso-8859-1?Q?il69X6bHZHvvxFH/WK3SO4/fAKTvOMD+X7QvlfYZdDb5QGmn5uLC2fg3YB?=
 =?iso-8859-1?Q?+LOOnzb3h1dX3LO0LVjbpwxW8Zc5DRNnd2uvXOEfgBwR4jucrMYpbnyIOU?=
 =?iso-8859-1?Q?YBsaXtgyGxprH1i6gs+rlnbvPS8wmpjrRSErIZOtlZ+koWbCWQ/hk7mvVQ?=
 =?iso-8859-1?Q?BHv1RbAgrQhSxi9LR1pCCAP9waFeAStVKn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4a5d25-29eb-4a7c-d449-08db2b996fbc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:23:41.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioQ0ryiyEU2v5+VNE8iR5DeBYuw87WS6tPPDaK/NvLavNipG3giJ7e5TVGzE2jZ41dm3jEHpUx/XO6Degom8pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com

On 2023-03-21 at 10:03:18 +0100, Peter Zijlstra wrote:
> On Tue, Mar 21, 2023 at 04:04:19PM +0800, Chen Yu wrote:
> > On 2023-03-21 at 15:46:28 +0800, Oliver Sang wrote:
> > > Hi Peter Zijlstra,
> > > 
> > > On Mon, Mar 20, 2023 at 08:58:50AM +0100, Peter Zijlstra wrote:
> > > > On Mon, Mar 20, 2023 at 03:46:57PM +0800, kernel test robot wrote:
> > > > > 
> > > > > Greeting,
> > > > > 
> > > > > FYI, we noticed a -18.6% regression of aim7.jobs-per-min due to commit:
> > > > > 
> > > > > 
> > > > 
> > > > Hi Oliver,
> > > > 
> > > > Could you do a full performance run on the current sched/eevdf
> > > > 04c54aa28eed ("sched/eevdf: Tuning...") branch?
> > > 
> > > got it.
> > > 
> > > we will test netperf/stress-ng/schbench/hackbench/tbench
> > >
> > Every test we will launch
> > 25%, 50%, 75%, 100%, 125%, 150%, 175%, 200% of instances per the number
> > of CPUs.
> > Both the latency and througput will be monitored.
> 
> Excellent!
> 
> > However currently we do not enable the latency nice for these tests. Later
> > we can enabled this once above tests finish.
> 
> Yeah, just the normal numbers, thanks! No point looking at shiny new
> features when the base is all messed up ;-)
>
We have finished the first cycle of tests on a Ice Lake Server. It is a
32C * 2 Sockets system, and 128 CPUs in total.
The baseline commit is v6.3-rc2, the test commit is on top of sched/eevdf
commit 04c54aa28eed ("sched/eevdf: Tuning...")

The raw benchmark test results with perf profiling comparison are uploaded here:

schbench:
https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/schbench-lkp-icl-2sp6.log

hackbench:
https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/hackbench-lkp-icl-2sp5.log

stress-ng:
https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/stress-ng-lkp-icl-2sp6.log

unixbench:
https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/unixbench-lkp-icl-2sp2.log

netperf:
https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/netperf-lkp-icl-2sp5.log

The followings are the summary per my understanding:

    schbench  (95% tail latency, lower is better)
    =================================================================================
    case                    nr_instance            baseline(std%)    compare%( std%)
    normal                   25%                     1.00  (2.49%)    -81.2%   (4.27%)
    normal                   50%                     1.00  (2.47%)    -84.5%   (0.47%)
    normal                   75%                     1.00  (2.5%)     -81.3%   (1.27%)
    normal                  100%                     1.00  (3.14%)    -79.2%   (0.72%)
    normal                  125%                     1.00  (3.07%)    -77.5%   (0.85%)
    normal                  150%                     1.00  (3.35%)    -76.4%   (0.10%)
    normal                  175%                     1.00  (3.06%)    -76.2%   (0.56%)
    normal                  200%                     1.00  (3.11%)    -76.3%   (0.39%)

    There is a universal huge win in schbench in every load range. I think this is because
    the wakee is more likely to preempt current task after we reduce the vruntime by
    lag during task wake up.
    ==================================================================================



    hackbench (throughput, higher is better)
    ==============================================================================
    case                    nr_instance            baseline(std%)  compare%( std%)
    threads-pipe              25%                      1.00 (<2%)    -17.5 (<2%)
    threads-socket            25%                      1.00 (<2%)    -1.9 (<2%)
    threads-pipe              50%                      1.00 (<2%)     +6.7 (<2%)
    threads-socket            50%                      1.00 (<2%)    -6.3  (<2%)
    threads-pipe              100%                     1.00 (3%)     +110.1 (3%)
    threads-socket            100%                     1.00 (<2%)    -40.2 (<2%)
    threads-pipe              150%                     1.00 (<2%)    +125.4 (<2%)
    threads-socket            150%                     1.00 (<2%)    -24.7 (<2%)
    threads-pipe              200%                     1.00 (<2%)    -89.5 (<2%)
    threads-socket            200%                     1.00 (<2%)    -27.4 (<2%)
    process-pipe              25%                      1.00 (<2%)    -15.0 (<2%)
    process-socket            25%                      1.00 (<2%)    -3.9 (<2%)
    process-pipe              50%                      1.00 (<2%)    -0.4  (<2%)
    process-socket            50%                      1.00 (<2%)    -5.3  (<2%)
    process-pipe              100%                     1.00 (<2%)    +62.0 (<2%)
    process-socket            100%                     1.00 (<2%)    -39.5  (<2%)
    process-pipe              150%                     1.00 (<2%)    +70.0 (<2%)
    process-socket            150%                     1.00 (<2%)    -20.3 (<2%)
    process-pipe              200%                     1.00 (<2%)    +79.2 (<2%)
    process-socket            200%                     1.00 (<2%)    -22.4  (<2%)

    There are pros and cons on hackbench. Most benefits come from pipe mode. While
    in socket mode, most cases have regression. I think this is related to the behavior
    of hackbench: hackbench does not want to be preempted, and this
    patch set somehow make wakee easier to preempt the current. For example, in 150% nr_instance
    case, we saw 21.4% increasement of preemption:

    75747402 ±  2%     +21.4%   91946710 ±  5%  hackbench.time.involuntary_context_switches

    which is close to the throughput decrease ratio:

    511478           -20.3%     407468        hackbench.throughput

    The behavior of hackbench is that, each instance open 20 pipes, and wakes up 20 workers
    via the 20 pipes. I have a stupid thought, if the wakee->wakee_flips is too high, should
    we still give lag bonus to this wakee? If we give lag bonus to it, it might introduce
    contention because it will bring another 20 tasks into the room.
    =======================================================================================



    stress-ng (throughput, higher is better)
    ==============================================================================
    case                    nr_instance            baseline(std%)  compare%( std%)
    switch                  25%                      1.00 (<2%)    -6.5 (<2%)
    switch                  50%                      1.00 (<2%)    -9.2 (<2%)
    switch                  75%                      1.00 (<2%)    -1.2 (<2%)
    switch                  100%                     1.00 (<2%)    +11.1 (<2%)
    switch                  125%                     1.00 (<2%)    -16.7% (9%)
    switch                  150%                     1.00 (<2%)    -13.6 (<2%)
    switch                  175%                     1.00 (<2%)    -16.2 (<2%)
    switch                  200%                     1.00 (<2%)    -19.4% (<2%)
    fork                    50%                      1.00 (<2%)    -0.1 (<2%)
    fork                    75%                      1.00 (<2%)    -0.3 (<2%)
    fork                    100%                     1.00 (<2%)    -0.1 (<2%)
    fork                    125%                     1.00 (<2%)    -6.9 (<2%)
    fork                    150%                     1.00 (<2%)    -8.8 (<2%)
    fork                    200%                     1.00 (<2%)    -3.3 (<2%)
    futex                   25%                      1.00 (<2%)    -3.2 (<2%)
    futex                   50%                      1.00 (3%)     -19.9 (5%)
    futex                   75%                      1.00 (6%)     -19.1 (2%)
    futex                   100%                     1.00 (16%)    -30.5 (10%)
    futex                   125%                     1.00 (25%)    -39.3 (11%)
    futex                   150%                     1.00 (20%)    -27.2% (17%)
    futex                   175%                     1.00 (<2%)    -18.6 (<2%)
    futex                   200%                     1.00 (<2%)    -47.5 (<2%)
    nanosleep               25%                      1.00 (<2%)    -0.1 (<2%)
    nanosleep               50%                      1.00 (<2%)    -0.0% (<2%)
    nanosleep               75%                      1.00 (<2%)    +15.2% (<2%)
    nanosleep               100%                     1.00 (<2%)    -26.4 (<2%)
    nanosleep               125%                     1.00 (<2%)    -1.3 (<2%)
    nanosleep               150%                     1.00 (<2%)    +2.1  (<2%)
    nanosleep               175%                     1.00 (<2%)    +8.3 (<2%)
    nanosleep               200%                     1.00 (<2%)    +2.0% (<2%)
    
    It seems that when the load increases, there would be regression in "switch" and
    "futex" case. In the futex case, the regression seems to be caused by fewer context
    switch. The stress-ng futex would create a lot of 1:1 futex_wait/futex_wake pairs.
    And it seems that with the patch applied, there are more wakeup, but less successful
    wakeup. It is possible that the wakers are stacked on 1 CPU which delay the
    wakeup.

    For example, more wakeup attempts:

    49.27 ±  4%     +13.4       62.63        perf-profile.calltrace.cycles-pp.futex_wake.do_futex

    However less successful wakeups(context switch):

    852533 ± 18%        -35.0%     553996 ±  9%  sched_debug.cpu.nr_switches.avg
    1.01e+08 ± 24%      -36.2%   64471512 ±  9%  stress-ng.time.involuntary_context_switches
    1.271e+08 ± 15%     -34.0%   83868905 ±  8%  stress-ng.time.voluntary_context_switches

    BTW, I thought this is a use case for short task wakeup placement. Waking
    up the short task on current CPU when the system is overloaded might mitigate
    this issue.
    ===============================================================================


    unixbench (throughput, higher is better)
    ==============================================================================
    case                    nr_instance            baseline(std%)  compare%( std%)
    spawn                   125%                      1.00 (<2%)    +8.1 (<2%)
    context1                100%                      1.00 (6%)     +17.4 (6%)
    context1                75%                       1.00 (13%)    +18.8 (8%)

    We tested spawn, pipe, context1 and execl cases. Most cases did not show <= 3%
    difference in terms of throughput. And context1 case show significant improvement
    when the system is near overloaded.
    =================================================================================


    netperf  (throughput, higher is better)
    ===========================================================================
    case                    nr_instance          baseline(std%)  compare%( std%)
    UDP_RR                  25%                   1.00    (<2%)    -1.5%  (<2%)
    UDP_RR                  50%                   1.00    (<2%)    -0.3%  (<2%)
    UDP_RR                  75%                   1.00    (<2%)    +12.5% (<2%)
    UDP_RR                 100%                   1.00    (<2%)    -4.3%  (<2%)
    UDP_RR                 125%                   1.00    (<2%)    -4.9%  (<2%)
    UDP_RR                 150%                   1.00    (<2%)    -4.7%  (<2%)
    UDP_RR                 175%                   1.00    (<2%)    -6.1%  (<2%)
    UDP_RR                 200%                   1.00    (<2%)    -6.6%  (<2%)
    TCP_RR                  25%                   1.00    (<2%)    -1.4%  (<2%)
    TCP_RR                  50%                   1.00    (<2%)    -0.2%  (<2%)
    TCP_RR                  75%                   1.00    (<2%)    -3.9%  (<2%)
    TCP_RR                 100%                   1.00    (2%)     +3.6%  (5%)
    TCP_RR                 125%                   1.00    (<2%)    -4.2%  (<2%)
    TCP_RR                 150%                   1.00    (<2%)    -6.0%  (<2%)
    TCP_RR                 175%                   1.00    (<2%)    -7.4%  (<2%)
    TCP_RR                 200%                   1.00    (<2%)    -8.4%  (<2%)

    It seems that there is no much impact on netperf, except for 75% case.
    ==========================================================================


thanks,
Chenyu
