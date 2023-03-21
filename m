Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80E1FB8
	for <oe-lkp@lists.linux.dev>; Tue, 21 Mar 2023 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679384802; x=1710920802;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bvX8i33NkUg9lGolynPMya1iLvr3KdpRt39lO86xBJw=;
  b=k2uoTb3730SAW+cwZ1W/m7ik+aLoJIVhvSz9vk1byltJl2RtqoS8QB2p
   fchIMjPSIHuCq9fxlk3u/whmfo/U0p1oFHxhxrVx9LpcblAF3xBdHVRf1
   rs9BKCfBxaf4IZYElYpu/Tw1NxSFHGzHaVy29MBdQ3Jk3s9Xanw3UuBzj
   +ckEu02O0vO1YZ7N69eAlX0u2bc2QRDRQ1MuOsLf0qCVTQwz/OjHW5lv7
   k0QVkZTW0kdLOsCHr9ygpYRZT1wQ80msutvwxtm2GRsjGt9UEfyExDmfy
   BJ4liXND3mdkE3Ea5tdTAGCSjz3L63djAbL+kfsg5vXCdvyBiRP8Ljdaf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337593233"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="337593233"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855592049"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="855592049"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 21 Mar 2023 00:46:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 00:46:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 00:46:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 00:46:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 00:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt0OwS0M5jjaKSP6wurKJfblqqijgp+zCrFRvWcUgLSGIIQxIbJ4P5TG1S7gfeseCKzVHuNY74ofk1Ox1PtmpnZn6KcR2uCZhmDtisD/JzvwyqIOgjh+6AqJ+pvA1lZCvZsTi3/bMDyWU+raATVD3UpiLtfOBqAnIkBA0/+PD+Mf8AvhqdhuHIpadB+2oV+0O/AhY0ubhpGz+eZAsd7doa9RV5hRRKgS23Tkwbl6g2aRI1qzUlpO8Xyf8t4mU9Je4gF30Mb9uO983l8kjhFE693wDWK/MsXCK2G3jpTOHNxZPpVd5Xa7Ok7Q6aykxhoG8t04pnEfKdx3iDnlPtlRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5NgBqytzSm4SMaWl7CHaCM1er9zdFMmXOKXgJAOpgM=;
 b=c+TuMhh3lO2vemFrgW/ZygQab3UqXMe1p5QyYdBXka4aqaO1Z8z/FQ205I80Gbo5SQKtkR2ESOdrEVvirzvsS8ORUPslPLaev34j0i1XiGl67ptutIghgm/ZhRz6MXuXTaGGibXFqrbOIYJXX90btJOweuSjNfQX/eUp3WlAZS5V6QV6FojxMv8y++KsAJHy0izV6M/oCaz9joEwd1SzCzovYpcv4tWc5gNx9q+r0uoRv4BJvrdF3y5vr2XX4w1fbWZCV2NF27CnCbTDK1NsyyintY7uNAvhug/rxh7S0YrsfgAb4N6u32wPSaVR+axJfnOPqxcWyBvtW0IAoJQ0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 07:46:38 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:46:38 +0000
Date: Tue, 21 Mar 2023 15:46:28 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <yu.c.chen@intel.com>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c94969-ae40-4c50-54d0-08db29e06697
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GZkomToWRCkn9AJUSpK89ngxe+skJMw+q9GYDeIo91Q5b3L3AwRwiu2sGyVC8RtFPmbQ1Nzlbb5IK7YA1Ax5ybpsXVxEhvmktujXlVjOeARKLq0/CXt4RGJOTnl91S9U4pgds0Z9RcVQNiiQg8w3juToyQL4uFyCFbGWNEkl28OLwCZtAZzygqer1KSdUwCccSv9hzVsQXb419fJxgFUcorc5/D9N94MufNy4Zy+NQSHadx2VEf+umGmGhmxVncjgfLSx7jVB2934/lY1uWQkEsrw66LCP4uAaIJ1HE+ZHbYnqqR2Lbor8DzyyEH7Tel+D1EEiw8MV6/kgsCEMEU/yIsTNcin000WXRqmXWyYBbAipzTmA6pVA4Iw27SBlKkka3FlifVQz3Et0lzm9TSIqMEMmHZiC5CBypHhJtitsGmYUhA6Nxm1dCrXirXPUIZ4HYpaEGQ3dDkfpfmDO8fa2nhKAE7lf6b2k3xw4jyCIAnzLhKURHP/UlfNcnkq7bzle6lxjWoogfweTgAKKs8DQpPSTtPZ3mjqea5VlNcez0DwLPUtiMAh4DZ6PdStHVrRdtkmO6jWBcOO+AgWaq7M1RNur2KmsEG6TOLGoNq+UfBE9+5KWT4ojYlgratlQUW6v/uMy0Fq0fsslEqreAow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(38100700002)(33716001)(83380400001)(316002)(4744005)(44832011)(8676002)(5660300002)(66476007)(66946007)(66556008)(8936002)(6916009)(4326008)(41300700001)(478600001)(2906002)(82960400001)(6666004)(107886003)(86362001)(186003)(26005)(9686003)(6506007)(6512007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3oSDkahLJV9NMvLVkWyqCkUFjrAmHrtFhjJB3FUF3yrNXCXFNym5FBH9IF0?=
 =?us-ascii?Q?Sn90WM95nxP7hxYA2/svAMfLkqV3Pn1ipIQOn8oRIWzD/3e5Eft3jpoQG8CS?=
 =?us-ascii?Q?HeuRjB91NwwiV3Kkc0NLXSVrGiQpnUuXovqeucMM/VgIa3veQ/9qh3GX4thC?=
 =?us-ascii?Q?OnRH5OWpsafm5MfFiryeomVUC/HXlj1RnooeMmDKTLiUJk82SrPc+yyhOGpA?=
 =?us-ascii?Q?78qPHKbrNynC8KEikadYjlNoMqEmVJinrN0tSj8C652w1t9eMJ+z8b+E9ZxT?=
 =?us-ascii?Q?C7oDPwNHdK5KFtooMkIuK//ME4g7qNyD1edV+LC6cKv4PoSqQu9Ju9radu+i?=
 =?us-ascii?Q?blI+r0XkRN1FzkV5zuGy5buXlWglLrrl6fG5qRyPJxw0uekzEVFluBix+F5O?=
 =?us-ascii?Q?K86OIL+l7lM2sV0yXseZ7tGhc6UgjWlXhezNF5eUlp0S/ddlYoZsNjKp2wZa?=
 =?us-ascii?Q?20gcXxPn8dct9K2ldCqMxUJ8F/sDsE92Mcn67pQc/2iK/hwGBeq55i/kaBYb?=
 =?us-ascii?Q?bAu7xnQkkXiZzGf692fKWdbx9bdS5xqsEcjcE+Ffbo+9E3Wr5/CvwsSAYC3M?=
 =?us-ascii?Q?8sKfHg968ebzHhBMisPRYVt6BlBdbM7V4t0rGeZ2fjCPWy71qZd6SA5J+nkf?=
 =?us-ascii?Q?l6bDf2I6jJ2YYrluBvP1qd7yTh1fLMJULLOBUJb10AOjTkkl1Nes94oCp4Tb?=
 =?us-ascii?Q?s0iirElRxOQE8PKuTIpA8WA1BsUVuiT35675JFueQw8aqgZFG0FRDyofpnHJ?=
 =?us-ascii?Q?AXatKIQ8uMnC73eSbIN4RK21Yo9hYXT6n80vvGqtV3cES3bYRfrENp1iLObT?=
 =?us-ascii?Q?bLx4UcoMc7ATRjuQD280sZjYlBJWQ0WMJFdqqU/I0DvM27wh4F9VHxY7UTWY?=
 =?us-ascii?Q?HJjQH3VBRW5ix2TCk+dF9qsgOCgRFqa8NefLrFs8//eErLBy397m6knsS29F?=
 =?us-ascii?Q?ZPeukcOIG6WdeooxUo9ae5yuHsiMAP0vlgF/vaPkmHqdW8J+FdFaIKUpspuP?=
 =?us-ascii?Q?EFrlLp90FUWKF1tfPc8S+pEDsIv4zdIQ7WophddB7n8mbKA3CeAMWvyHRztm?=
 =?us-ascii?Q?7ljbiAQxujupFBpNJ/Y9xZkKCR+/7Go1wO+RmvsLmHCA7wuy70a/S3D/YOuz?=
 =?us-ascii?Q?vf3xnz7MujLMdtDXLwZgVZ2SJV4MP+GLHnNC/fkgUID7iaqPjJSBXJwslM5C?=
 =?us-ascii?Q?kCcwDMDeIrQu4FfLQaAtmcv0Dqzox9xgFIS0K6tLkPPmJqhIXi/V++bws2l6?=
 =?us-ascii?Q?+fr/XB1UkzjN43+pPalwg7D23LgvqWNbVgAcBGgYCBNwM17vfQfKDDER79A0?=
 =?us-ascii?Q?tNOZBHksLzdh/PeetGPpwd6u2/rcFU3uYpIpWke57uHW7aPMjoMyzjUO9g9O?=
 =?us-ascii?Q?bpBP98AWTiBoOjqxiq+1+eOh0KTyFQ/QEEEzfCi5weG/ky5vdg/hdzVPffC/?=
 =?us-ascii?Q?MsQH2ef7zZJNzSck4WRzkPNxBTFrpF4ZrWo2EFHIJ70yfPNeXyGd/zVOaKtK?=
 =?us-ascii?Q?v1WiZLdNG42aaq6L+Ct2Gtz/42nE9sJWa1MBBvCY9SZCO2YPGh3Et7/bnPpd?=
 =?us-ascii?Q?FAhyAHBFOH4kmsjosDYGvYQK7g2Wic5ivsPQciZBv1FSZUc8LSrkajv0Lsd2?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c94969-ae40-4c50-54d0-08db29e06697
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:46:37.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PMRZUBsKuQDuKTKkQk+d4GUxI6inhA2X8Gd6ZKR8g323knmKWjIo8uzIYNIw3cb6uoqOFtdp+fj0Pfwq3WYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
X-OriginatorOrg: intel.com

Hi Peter Zijlstra,

On Mon, Mar 20, 2023 at 08:58:50AM +0100, Peter Zijlstra wrote:
> On Mon, Mar 20, 2023 at 03:46:57PM +0800, kernel test robot wrote:
> > 
> > Greeting,
> > 
> > FYI, we noticed a -18.6% regression of aim7.jobs-per-min due to commit:
> > 
> > 
> 
> Hi Oliver,
> 
> Could you do a full performance run on the current sched/eevdf
> 04c54aa28eed ("sched/eevdf: Tuning...") branch?

got it.

we will test netperf/stress-ng/schbench/hackbench/tbench

we will also pick some tests from vm-scalability and will-it-scale as reference

do you have other suggestions? Thanks

> 
> I'm expecting wins and losses (inevitable when you rip up the whole
> scheduler), but I'm hoping for nothing too drastic.
> 
> 
