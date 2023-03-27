Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A292102
	for <oe-lkp@lists.linux.dev>; Mon, 27 Mar 2023 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679924387; x=1711460387;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aVt/IUPH+tXdgfy1HGNH9PwQLyhZdvPJkImW5Xaej2U=;
  b=aOIosV5zJKAZB2ByIamGM2SnaY6GLN84iqTeepNWCM+n8q+B6Secqfb7
   iHZG+O0tDInXdBX0LAEFC0utA7JZlNKJLU3qwYJtPu2xf6DUYErtlPGas
   LySed484F+0P0pknWh9y4zh6IUEGamS6y/Xd+AObXLvCyU0/Eivn8cCKE
   pCzwjnDGfPR5Vsi7bUTXL+Il2i8RX3D72xJFBBSR5G+BQ4XAoA48QtZ10
   OfdLTJo2rCtAbol7SRAExJYS8YP52ts0EHxOwcBGv2cPOLSohr80pmg1G
   us27iqEW/sagw892GJBbBlVG78VAijavhEDjZ5407U64PyQZxsca9sDhy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="338985578"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="338985578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 06:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807484327"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="807484327"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 27 Mar 2023 06:39:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 06:39:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 06:39:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 06:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO1X6Kw39m6O9ke0zoWqdG+gj8C/+0x5rxaK37hDSxFfbfZR1krD1nRJ8LIZS6luibWqvQW/GCU37UhNmgeTdk6txrugMxQaKPMdPZ62A9SZ/7SogsAvrbtW5U3eYt033ormO8Dkvp9WMsnxfQXE/De9V2MDypVN7m80/KkWcyGnhiuMw2mo2YWLiFFE8tVfbtuE2GM9SAC5sXSY30yXQn7IgUSvcTk9aqJE0z+K/0KVM2YBcfavsMcYlRwQfgSN7d+zfpwYs8PPZDa/dgVmn4/jVzFBPrWRhGG2PaEG7eQ7ICMXt7A8+xbkpNf5sIl+Wx06YIWW9+uJ1S2XSpeMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qnchc976sdYaXrLDuQlOqvVhYfhBAqYnEuKEvM3sNHs=;
 b=QSAb7gfemHeydcbc0/zuErT8s7Th4aEt2zzbPvt4HgbIpbwX/PeUbkQyjGmK2cP+ByXuBvvF083FVTXPTbiZfw75eokugoxGVoxT4SNNx5gMQXSsNp2+/IOY7dRK0wQ3DDHL3Evnr5MRjggSw2P4OgN1epoJc9E54q8WAlO9Asa+IfIEvdODrkPYfFz4FM+lCLOYsHNS+q3AGlHbREjhYNxezRPmO4nuJFMYzf7FKSiQ/8csG9iUS/k/eCMtxzppw1mB2thStfpnxF24O4r9l437Wz1vHOFVKGCPWZW9ubQgHt9O9lJUoQpInr/QZWHwpiQA27eHnisSRsm0tF8yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 13:39:40 +0000
Received: from MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f]) by MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::9bf2:9ab9:c6e0:1b2f%3]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 13:39:40 +0000
Date: Mon, 27 Mar 2023 21:39:25 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Oliver Sang
	<oliver.sang@intel.com>, Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar
	<mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <ZCGcjTneO2C/+fV2@chenyu5-mobl1>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
 <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
 <20230326133851.GA2994912@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230326133851.GA2994912@hirez.programming.kicks-ass.net>
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6206:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: be6e1da7-4105-473b-e024-08db2ec8b6f9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B+zCkFUOxcLTkS4yYuQo0+Afg41ZbR/1C9g8lQsWb71RVtPhipUtaVVQn29K5QCU60fz1OMTGoGSx0fLt79pkN0xPOu8X6wmc4U/QUp3bAzC1lrVCPK5LJmVEVTGSSyVjOk/AZPNam+2jGsbikl8b2tWbVnVYzzEiYZPVUjqz/RqvncpMhmmJ9uWRad3GVzuRRZcZ2FwC0LC/06dqEUyBtD0XlQWlNtf1mmNJlz1/aRksleVVmP6uPIFr6euDzbyHDrrGqCMS1KuQ1uZpS0Heo9m9BHTUTR6md0S/9meqA7iqPhrN+b7A6iYN5NsygMobccy8bdCFPEWOBHM8ww/V36ngzrTKUJ3Ikn6lSSHMmQNW6LKEcea/BSdVWw3HAbEtye1Y0R896eMB0/C0O1Cd0fx5KD1lPIdW8FsPVNjs1GQL5sdZoRjjlT4YWYafoLAvAK9dKulqdxih5OzCdwcjhQXPcnvrHmx5lpNgcbkUc/9x5f0HQAByTT3sunqEHy+ss68Nw6Eei8lKOxXkfxigqzftTmYu6oZ2iR7zrzYIAEjHbpc3AKG0EmrwSOtKYi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(316002)(54906003)(478600001)(8936002)(5660300002)(82960400001)(33716001)(86362001)(38100700002)(2906002)(4326008)(8676002)(6916009)(66556008)(66476007)(66946007)(41300700001)(6666004)(186003)(26005)(9686003)(6506007)(53546011)(6512007)(83380400001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L0pfObqfaYGlTwtTVH5I52lrAL4PhajiZS4kGXD7ljQn9DjVwOcvAWcGmJbA?=
 =?us-ascii?Q?Fj9PtTIi62Q9RMYKoT4V+jM05SR7q8d8+VVGPQODr85Xsxo65TCFr9270NTS?=
 =?us-ascii?Q?gLkHVAJ++y1PYQ9xLlf/35qgMT5YJTGBRQx3Yjsw6Rqy4vad7si+sYiOYsB+?=
 =?us-ascii?Q?9FzfOFEl3ImCnx5dnYIJuAbD9sqjRv5WyEk7OG4j7j71wVEr4k3+FMWe0fnj?=
 =?us-ascii?Q?p+mklozEK6hKgaB0ZP2hzv+VGj829gMk4wGdbpqhJnDt8+EF3TLmTiguuP4q?=
 =?us-ascii?Q?E6hXnr+B2X6G6r2U4tNBWZTBKNQSBAWiHeqiSyhz2WzSeGwehLxxzp+wTfUQ?=
 =?us-ascii?Q?xyUgmOr9DOo0Q8mKihCvUKUYPdir91/1pWTKTBuFo+h4u5d4QkBGG5QXd3aU?=
 =?us-ascii?Q?09ejQHwJpKdZYZLtXTzhwJlsrfCLFtLkaL5DbPYATvAqYgti7TZBosvldcPx?=
 =?us-ascii?Q?INsDvSDP4ZNjBNBuVIhWOoc5D9/1NDHr41NaRJeJJyDA6XY+dItEHQ6YxKdv?=
 =?us-ascii?Q?tigXESTW1zp0AEsVWL2du/TaMFG3wtraULQ7+vHLWShawrF3JEUSi4+fOwMa?=
 =?us-ascii?Q?bUHhuOGwUesHglo4nVH5F92meaVwjALF+4xJRSab5dJ0ETQ0haVm9GJT9/zt?=
 =?us-ascii?Q?2sLoDCwzceY8aPgq7ZlUz4VfSMd8hyOJ7m/H9BLm4gZqJDvfzflj5u6KAJ/3?=
 =?us-ascii?Q?VvaXkU4f8WBDjWZ5rD/5aEgoRj94eDkHWNWuGg3yj5SdLkMsmzGFaYUy5DAQ?=
 =?us-ascii?Q?ajAFmBWjp7NA2zZd0eLmql0Y5VhBgMTH85INLVtQEj5L8LLtfuYzvDYLCZ1H?=
 =?us-ascii?Q?Dnq/hkkpyF3zYT7p5WCOyo/B4UXr7rINeyIsW5+qZi3a+fid0vqFWEeYs5If?=
 =?us-ascii?Q?fTmGvGlHW4UzY0fSXV6geHv9s+oOgopPndcaRzvj2otO42xp8hPpoNNHHqAk?=
 =?us-ascii?Q?7ITxYOVZythiNWtcZ69oy5e+0EXUKGZRDngHWVQ3A/bmg72j9oABW31wPjrP?=
 =?us-ascii?Q?8BTmvgvrdpp63nnKh78laF4y+yXbDe2SGyZ0PIh1vgGE0Zxa6rtx6V0Pc8Bf?=
 =?us-ascii?Q?P+JMrgIpvBjhTkqrSH+fOJNRSEmkDqvj6aWyhN+FjFYnlfD/21ckkkGknGLj?=
 =?us-ascii?Q?+vRSXrMQXPOzx4B0O4wN2+QrUc+P/LKNWcX4c1Ync9zgGNckCbTD4VZGaVi3?=
 =?us-ascii?Q?cXKAsmPuxyIwyHSkrhbcgNtHSaq/lJusiUuRs7KvMyHf2LQO7NpLpPRsa6qh?=
 =?us-ascii?Q?pSFxhdADx2+tls1YEfv9w2sGe2VZodqiDOLPfKF7couHQt8UeYZgPKt+7Av8?=
 =?us-ascii?Q?Aq5kHcOFsGaInCD5wf1zf4YRZa673+FwdotjJ3QsoZQVIECApe9N6iaIYUt/?=
 =?us-ascii?Q?EHX/W9dmg4qf8vS7gPLUVq9Bqjkvnc75m/vC2CfZsULlyqKr5crqVdq/ircE?=
 =?us-ascii?Q?K/i63saw7Bd+/3gGZAQsCVV136mvSFbzrpX82AsAiiHofCb/O2W//91tMLYf?=
 =?us-ascii?Q?Ah/2aEDLYC8sclLgyonvmLZAIhWyB/y7s9IIJX/+kiJ3UZUJ/+7+O63Xm9BD?=
 =?us-ascii?Q?yq4PGYPEQ+4q7C5fTlXmNwDZzelEH57dPuVDb0aH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be6e1da7-4105-473b-e024-08db2ec8b6f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 13:39:40.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjToVa9e62bpwik8+2O0jdxKNwnDZK/Im5UREYGAVv9IbOOFNYt5Nekj3bJF7u46hD32ddX0XNyI2YLemr5f8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
X-OriginatorOrg: intel.com

On 2023-03-26 at 15:38:51 +0200, Peter Zijlstra wrote:
> On Sun, Mar 26, 2023 at 01:00:24PM +0200, Peter Zijlstra wrote:
> > sched/eevdf + place_bonus (based on tip/sched/urgent -- will push out
> > later today)
> > 
> > root@ivb-ep:~# echo NO_PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
> > stress-ng: info:  [2373] futex           6541589      5.00      4.28    194.83   1308211.07       32854.97        99.54          2288
> > root@ivb-ep:~# echo PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
> > stress-ng: info:  [2537] futex           9745715      5.00      5.38    194.55   1948945.01       48745.49        99.96          2288
> > 
> > 
> > The whole sleeper bonus is something that's fairly controversial but it
> > was needed in CFS to make some 'starvation' cases go away -- the lag
> > based placement cures them too. And given the whole (recent) trainwreck with:
> > 
> >   829c1651e9c4 ("sched/fair: sanitize vruntime of entity being placed")
> >   a53ce18cacb4 ("sched/fair: Sanitize vruntime of entity being migrated")
> > 
> > I'm happy to delete all that. Still, let me think a little, perhaps I
> > can come up with something slightly less horrible than all that which we
> > can default-disable for now...
> 
> OK, pushed a new version of sched/eevdf that includes a default
> disabled PLACE_BONUS.
> 
> (and lots of other cleanups, eg. moved to scale_load_down() for
> avg_vruntime and measured the max delta to be ~44 bits for a
> systemd/cgroup using kernel build -- after I fixed a cgroup placement
> issue).
I tested stress-ng 100% futex(instance equals to cpu number)
on top of sched/eevdf:

baseline: Commit a53ce18cacb4 ("sched/fair: Sanitize vruntime of entity being migrated"),
NO_PLACE_BONUS + Commit 757a8ca40738 ("sched/eevdf: Debug / validation crud")
PLACE_BONUS + Commit 757a8ca40738

In summary the PLACE_BONUS has restored the throughput(and even better than baseline):

baseline:
2023-03-27 13:25:36 stress-ng --timeout 60 --times --verify --metrics-brief --futex 128
stress-ng: info:  [5930] setting to a 60 second run per stressor
stress-ng: info:  [5930] dispatching hogs: 128 futex
stress-ng: info:  [5930] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: info:  [5930]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: info:  [5930] futex         129599510     60.00    205.28   7296.59   2159865.69       17275.62

757a8ca40738 + NO_PLACE_BONUS:
2023-03-27 12:51:02 stress-ng --timeout 60 --times --verify --metrics-brief --futex 128
stress-ng: info:  [5968] setting to a 60 second run per stressor
stress-ng: info:  [5968] dispatching hogs: 128 futex
stress-ng: info:  [5968] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: info:  [5968]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: info:  [5968] futex          63869149     60.00     87.55   7289.74   1064478.29        8657.53

757a8ca40738 + PLACE_BONUS:
2023-03-27 12:46:38 stress-ng --timeout 60 --times --verify --metrics-brief --futex 128
stress-ng: info:  [5902] setting to a 60 second run per stressor
stress-ng: info:  [5902] dispatching hogs: 128 futex
stress-ng: info:  [5902] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: info:  [5902]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: info:  [5902] futex         134332423     60.27    152.41   7224.27   2228839.17       18210.41

I'll launch more tests tomorrow with/without PLACE_BONUS.

thanks,
Chenyu
