Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200623AD
	for <oe-lkp@lists.linux.dev>; Fri, 22 Dec 2023 01:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb7ARWHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703207197; x=1734743197;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=97CwWVSWTqNayVSLbZLEHAkBYS3NsneLlfgS368HRrU=;
  b=Qb7ARWHssKMj1ATAW/CIvAYnETpNXieplDUCGMGHCCXr+ms3/w4yCqaH
   Y6rVfzmrQBDQ8SW0LMcmChCJJtCyiQ1amieZmnoIb1slzWiyao7wTTbHT
   7vVUykEtBd0LYrHS5Nu42YfXukzVG26QqNDTXyQRzhYsa0PvMyCe5etqG
   lr8mAJnOxRo/te4Z4MAt0SOc8DmlUMJd7WCwi2Wu8YqEcTHcV+br8xcDZ
   UXrod8TVlR1TGUprcA6stVRDx1L/zrlIAvYOD5NEsMPUm+u9O92+eCrWa
   dQqGvQ6f8MMsY9YZjqpDUFZkTZEoGBrSf59HIMG5qPverpLQCT61pJ26G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3302424"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="3302424"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 17:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1024052594"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="1024052594"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Dec 2023 17:06:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 17:06:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 17:06:13 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 17:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Liy4F00JKgVJ7lc59zUPvFvPUK3FM+kGaG9aATi7hLdiWpeswGOnbRIIqX3W2whzRAw586JE3+YPSZBgSjRzv1YuDDergTw5s5Es1EunDAOhNDFQ0dtOF6P9zWhZWNhVnUAt4Ut0FJ+9g6IRhW3q2yRCE6Q9+SNvvHHDGx5t1GejL5jB88VjNpwmTOqETci4OIb7OyoGY1Gk1QzzC7Gy1FoLU8uYvn3OPr51B/2Xy2cA+HUj+rn5FCY3+vtFOmZkX4fO9ghbDW1G2wZcEkc7XI1YDiKmdZh+iZFyUxEFjeTq15J2Nne/u7D7Loq1j2g6Zpdxz0r3qTeueyynPERs3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsA+DPTvdLELvCX3DwW+UwAKstROIA3nK09Z1nuOQLI=;
 b=M1kHwaezPaniY/ARRWPaPKf3nGxQbejVKW6Hcn3MeiEUyk/dkSnPh/uM6956p9xkkQBeZs+Hb6qQPK9H+OfPGrVtwsVD/cYV4g7olcvv+WTiMKIHhNJJoOdyqJbEuM+aSwqkb4cr72GIXXA051TqHHfi1V1jldN51xTdI//Wvv5GkS+GJxZ9vQWJlAyqGt+Vd/g9XVHj0/dp2YVXn5A+px2z3M0u7/e40iUNQXcjnh6H+hK9ibcPHLqgKjcsSGu0yzdIVpiXBAkIZXECQ+fZAG0hXFS4PXlvCPSNHpXQsF/6mXR+YDfe9FnAGrhqXqPC4h7dtSVGmM8tHVEuCkkhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 01:06:10 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Fri, 22 Dec 2023
 01:06:10 +0000
Message-ID: <ef768b7e-0c91-4ccc-b083-42e05da752f6@intel.com>
Date: Fri, 22 Dec 2023 09:06:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
To: Matthew Wilcox <willy@infradead.org>, Yang Shi <shy828301@gmail.com>
CC: kernel test robot <oliver.sang@intel.com>, Rik van Riel
	<riel@surriel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Christopher Lameter <cl@linux.com>,
	<ying.huang@intel.com>, <feng.tang@intel.com>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <ZYPDwCcAjX+r+g6s@casper.infradead.org>
 <CAHbLzkpX29RGTrRwVpK+nh5uWyC9pJnyCjQcjjreEy2N=4QsqA@mail.gmail.com>
 <ZYSAcThKd/FbH/Bt@casper.infradead.org>
Content-Language: en-US
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <ZYSAcThKd/FbH/Bt@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f76425d-2cc4-4727-530c-08dc028a2f76
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHVfs00ESqnki4VVy0JnH8PM8P6P2X5gWYySXztmtwxk0j4tZ/d9wwZL0YzlHxM/9I9CuQ184dDaeMtEtoT0cxN3gfi9QaUwdbY7+w5kFS1/WdrZmqS4E9IthG09ILWHpYwOw2S/Pz0el3swrXRSp+2xlNmn+ivCzod6vTgyiu8Yr/AAqF1qkPGAo3pb1mEmM0b8iWRAs8YDVrbhvLHaIkSlYTb29T9k2hl2KGRxEUwIecQSS7kyHbMT4uLEETtsAqQVsf/rB+sFH+3IRVAUHzo41THLdzWvSsfIznZ6DwsHMmKQwE0+EQ64Bc3LisUkjYzAwDgz76IiMZuT56imSG7kkgGJuhV/Aw/Rq+m9uVRof0vxz1lieILv7Uc26p4WfAL1xFS3XErrwN9M2iKXooA+lDdU7MAtnaX7H707stSopQlZ2IsG4UixnfIGHJICNjl8t6V8rZHsSxQSYJDEGlk33cO8s+l50+tNyLqYLyzwD11F9MO/Ii+tX+UkBJOLHTYCx9ZbdtYML/9PnXV7svKBxfFzOWueP93IwYpsr0k0bMVZUy1XRXNiiI6p6+HxCrmIbDkH+/p3CQo4fzU20vUSwKzWLOIkWaNpMYLg6O81gz4x3sczFkJgYedraq9LvzmvCOTWvkOs9VcWZyoZbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4326008)(8676002)(8936002)(66946007)(66556008)(66476007)(316002)(110136005)(54906003)(82960400001)(2906002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(5660300002)(2616005)(107886003)(26005)(6486002)(478600001)(6512007)(6506007)(53546011)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmlBOVRoL1VMbjN5MTlzR2diUkJheDl2QXMrNk4xU3RkcFVjMkk4UGtVdGoz?=
 =?utf-8?B?KzZ0V2VqczdzMnRRRlI4aDB1MUtqYzB5NStkd0xlUURrMUdMNGp3dWN4V0NS?=
 =?utf-8?B?eGhScTl3MHFETUwzYjMwSThXOXVoL01yNG44ZTFBV1NidVdyWFJBTGNoTzJV?=
 =?utf-8?B?blB3MFFhbnNhMXVwaTlZbWw1YTlEM3dVT25xNEU4OGZhWWU4QjVEZmhOMVVq?=
 =?utf-8?B?cmFBcyt3Z2pkYnc1YjJIQ0huaEVlWUNzQmpaWTFMR21NYWZaaHp4c3lGRzAy?=
 =?utf-8?B?bHhhV2YzWnJIY0hsaGQrSUlFVm1mOG5mZjVoUXdMeUFGajY5NUZtdDc0TU5s?=
 =?utf-8?B?ajFkQXEySmhYbXJReUxXQ1hGdlRubW56MmNHb1VzUGpsN01QdE8zN3AzZjRJ?=
 =?utf-8?B?VXdWenVETmx4V2QraGppc3ZBa1Bnby9yZkZYMU9yN2NkbGZLRlN3WWt1WWd5?=
 =?utf-8?B?VjRoQ1d1ZmFMRWFPeTJpdkRKUHhFQ3FiRVJIeXlsbGVZN2pYUWdLc0tGMEpL?=
 =?utf-8?B?K1pSZGdjcmpoT3JsQzRYYkV5dXVhWm54RDVtamg4L0xOQzh1N2pyQXVhei8z?=
 =?utf-8?B?N3lZejgyTVkrdFBWeGtlRU9GdFlEaGZ3SGZDUXVLc0t2cWU3bVJtZGZSaDhL?=
 =?utf-8?B?Q3ozYWxGRjBSSGdORkxPYS93TC9Jb3Bnbjh5aUlvWFNKZVRnY3d4VjVxV1Y1?=
 =?utf-8?B?ZjM2cjFhREZWaE1ETUpvYklLejhJNnEyQldCVVMwdFUxT3JyejMwQnp0Rm5w?=
 =?utf-8?B?RmpZQkg1cEFzQ2NZSkVZOGRHdFRsWFpjWUgvRWJ1VmYwaU1EbXJaWXRMY3FO?=
 =?utf-8?B?QzR2VGVzVTFWSW5IY1k0QmhmcDhPV1dtc2ZSK25qWi93Ry9nOVdMYk5JeWJQ?=
 =?utf-8?B?TkFaQTVHS1JjSzRjK3N3QTA0TFQ3ZzdSdlFrOVN3U1JzTi9zanRyK3BVOHp4?=
 =?utf-8?B?MXd4OVhjWWxySGFOdTVaZXI4T1JOeEV5YWtlZVZiRnFtaXR2cGZHa05oZmlm?=
 =?utf-8?B?cDdabkxGb1pnRXY0UEk5UHFoZUFBRU53WXh5WWRLNk1qVzJwdVlMN1R0V0J4?=
 =?utf-8?B?NHI2dHluUW5ON1FpbGh5ekoydGRXdnAxelpzSXJDOWdHOXdKZ3FsY0lwQ2FV?=
 =?utf-8?B?czZ4ekxnRFhVWVJFaDBwb1BqWUlMQVNaQkh5K3pGK3dOVVdCTjRlTUlzTk1o?=
 =?utf-8?B?alUvbTEvVDVROXNKODNYZzg1NzZUVk12V1dWUHpPMHhYaXRRYXl5K1k4cVk1?=
 =?utf-8?B?ZysyZ1lTN3pJOVJiSWZ2SUNIaUV1dEpvV1Y5THRPWU9mWnVOSWtjY0tiUXlR?=
 =?utf-8?B?VUZ5M2U3N0hTaDdYZkpHeXczS3pvNXhtTGhXNmQyaWxPYzJxZXJydGtrN1Nn?=
 =?utf-8?B?eDlLWHBHWWlKdXdsOG9BbUNrejFPQlNsbUk1b0VLZDR6NWpKRkdzMHcyaFRD?=
 =?utf-8?B?V3QxTk1pSjRsTGhHODYvdW1qeGk1ZUhtRWVjcEswdEhRTUc2K2dubGg3ZHBW?=
 =?utf-8?B?RGZ5TllzUFhxTzg0WGJxcFVnZU5JRmxSdkRRcWhBVlFLeHNqRWJmZFNXVmFM?=
 =?utf-8?B?aC9ZM09kcWxrZWg3eFA2NFF5MEdZN3B2OVpnMmxzYWt0QnhSVlB5Q28vMmx1?=
 =?utf-8?B?QXhxT1JCaEFJV1gyYWtFSm10ZWhhcytlcndIbGVYbml0eTJpOXl3QjZVVzFP?=
 =?utf-8?B?Zko1V1dLL084WmZLQ0Fub0ZLaUo1elpTNDNTNXR2VkRCTmpxa3Z4RFFOT2pB?=
 =?utf-8?B?NXUrVkY0bzZyR0ZsUytSdnd1RldDSVJmWGw5dHlwM3E2dXpDdFBiTENOU2VT?=
 =?utf-8?B?WVRid0wzS0ZqUGJxazVSSVoydlp1bzRSTC85ZlFFYkFLbGUwbzRGQVBjZTFQ?=
 =?utf-8?B?ajNhMTVSTVBQNk4zVVh2ZFVlRk5JN3g4YmZZYUNxcXJuTHpyZEhpRWZXdDRC?=
 =?utf-8?B?bkQwWGpKVklnTTRkeTRTZ2Z5Zm1jRThHcldKdHd2SzEyRE50WlExWHZlT3ZN?=
 =?utf-8?B?M1pPVmF5U3Nma3JsZUg1Z2pPNWZGcVgydW0xTFI4cHFUY2ROV0VLbXhYYWMr?=
 =?utf-8?B?MHF2N1NUWVdxZzZ2WXZMYXBRaCtrZXE0ekd6REZ4OThKdHduaUtsenhGZWli?=
 =?utf-8?Q?Fkr9gJgCkIsv3rgITDK+MQqYC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f76425d-2cc4-4727-530c-08dc028a2f76
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 01:06:10.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAIyg6fZkPEfLH2CaZEca3dGIPAqjys1TemSIPZutNqd7D+uqypwuAgUkXXywIEnfVJS7sfwsTNMaNmUa3iHlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
X-OriginatorOrg: intel.com



On 12/22/2023 2:14 AM, Matthew Wilcox wrote:
> On Thu, Dec 21, 2023 at 10:07:09AM -0800, Yang Shi wrote:
>> On Wed, Dec 20, 2023 at 8:49 PM Matthew Wilcox <willy@infradead.org> wrote:
>>>
>>> On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
>>>> Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
>>>> filter out of the MAP_STACK mapping based on this patch. The regression
>>>> in stress-ng.pthread was gone. I suppose this is kind of safe because
>>>> the madvise call is only applied to glibc allocated stack.
>>>>
>>>>
>>>> But what I am not sure was whether it's worthy to do such kind of change
>>>> as the regression only is seen obviously in micro-benchmark. No evidence
>>>> showed the other regressionsin this report is related with madvise. At
>>>> least from the perf statstics. Need to check more on stream/ramspeed.
>>>
>>> FWIW, we had a customer report a significant performance problem when
>>> inadvertently using 2MB pages for stacks.  They were able to avoid it by
>>> using 2044KiB sized stacks ...
>>
>> Thanks for the report. This provided more justification regarding
>> honoring MAP_STACK on Linux. Some applications, for example, pthread,
>> just allocate a fixed size area for stack. This confuses kernel
>> because kernel tell stack by VM_GROWSDOWN | VM_GROWSUP.
>>
>> But I'm still a little confused by why THP for stack could result in
>> significant performance problems. Unless the applications resize the
>> stack quite often.
> 
> We didn't delve into what was causing the problem, only that it was
> happening.  The application had many threads, so it could have been as
> simple as consuming all the available THP and leaving fewer available
> for other uses.  Or it could have been a memory consumption problem;
> maybe the app would only have been using 16-32kB per thread but was
> now using 2MB per thread and if there were, say, 100 threads, that's an
> extra 199MB of memory in use.
One thing I know is related with the memory zeroing. This is from
the perf data in this report:

       0.00           +16.7       16.69 ±  7% 
perf-profile.calltrace.cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault

Zeroing 2M memory costs much more CPU than zeroing 16-32KB memory if
there are many threads.


Regards
Yin, Fengwei
