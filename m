Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E870200B2
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jan 2024 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YubFYGY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704356293; x=1735892293;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=85I0AwCfaNWeRTZQr+unw/C5DxyPSA+iy+GyGzCMnS4=;
  b=YubFYGY4wnfPej5JZ1+AoSNgq5lUbLAY6AAxCNMH7FyJFUfvl0KUSUc9
   vLF3rpAopZPnTdxM09/B127SfVymTwpD7uEuTKFmvKjZr3dUa6LvdesRo
   iL3JYxHu842jgkmEEgg6LxZrLGvz+iZtJ2MIUePKGHUn2z/fQKHEaO9Ri
   74cP+j8xS2qD++JZC6tYAGJLFcUvPYae1uh5jO8Q27S5BGMFlLygq+CQu
   EYgwuSfpLiByJHFk1hrPSXkhrvJAoTW7f81cWBePfJdItnSWakUwnCgJO
   oUfuT8mHauGugoeh0R2IVjZdsT9Khu80JmHYaXB5ufL3keJOob+76G7OQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461474393"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="461474393"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 00:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780298545"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="780298545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2024 00:18:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 00:18:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 00:18:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 00:18:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUckMeoiboqhmCGWLmfRlXh6wrEd9k6vQ0OqpASHc0vAJ9+OiYzHL8ULesS4ZV8Xhx6qxrVQq7X27a+/VVTJYF8MDsAHvepxbhE6/q7OSy81GfmFFIHYrAt9oV76LNTHE15yS/9oe1k7gl6zCONeObkDFn41mUhN/NgapWfL45kR5ZwK9mtIND70EtgdO0DjcB9nlZ8Cw8LALiYy2K1L9hq79/4ubak6UqVX04CxoU7xS31o5yE8eoz/sKGbkHdo3tw+7ccO5yXh7OPDkPAVV4x5h3N9AZDFhYMuKDqbNj5n9u94eWmLxrlDq0IoZkr5HdgBYONAV6bvOLie3w6g6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNbCtj2vEffOt+GpTf9BeuxSuTSTf5fe/ME+ZCH5kN0=;
 b=KA9icqhgjEN5Le4oenwULRwxQs052R4XSZONz0PimlIqkUJQkcEfVXY+a55NV9XuT1j3kmkYj8c3mR0Z9RKi7kzC9ltvt+K3KLBtlduZkgPoK6P3y5cHfpHv9N1eKcoFaWQk1S1Nahd1RVbFYYTPzavBMSaAFcol8o7oKALVTdGRuPOT9vrCB4qw4imxcGVN2n7n5/Asfl1M0BRsepuv1xg7o9AzMe8F0nwwGkA8a5dTX2LSWYAWJyjmejIXXfQTWewb8Z7f0pZUQkP+bNp2hUkbMp/5EBUBWBywG6yV4YF+CGIfkEk6XAzbSfLH0eKA3G7DR/ZczmUs0hTROwvT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DM4PR11MB5502.namprd11.prod.outlook.com (2603:10b6:5:39e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 08:18:09 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 08:18:09 +0000
Message-ID: <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com>
Date: Thu, 4 Jan 2024 16:18:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Content-Language: en-US
To: Yang Shi <shy828301@gmail.com>
CC: kernel test robot <oliver.sang@intel.com>, Rik van Riel
	<riel@surriel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
	Christopher Lameter <cl@linux.com>, <ying.huang@intel.com>,
	<feng.tang@intel.com>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
 <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
 <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
From: Yin Fengwei <fengwei.yin@intel.com>
In-Reply-To: <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14)
 To CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|DM4PR11MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a98360-92ea-4ed9-063d-08dc0cfdafa9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR+tjtNxHz13rFFTbIuNj+YF4+5KV4AUx/1wc4ZL60kT3QIpno0QY24gRZqYqqckaRAurg8CQ8S7jP2gJ00a5hjK+as/3fkGjATeGzLN4lKPDBLgh9M1upJTqtZhzV2gaVRbS6u5mwjW1l5YIQNLjsFLOc+hMISgTTB77+lA9T8Z9D+BcWePu++gfAbkGhPU3IIFPQfT8Y+vNVQtW1+DmwPtAQf0IA2tSsnmrmTaDdHzv62Ib4VQw1k9MoWndN8zDrx3PVC0+PDQ/YEqaAMqIM3mjJFZqdTPmgzmXKPlXBjPoMxPfmn7NAMlzFcf0iY9JUvb2HUt8BQajxINgzIVhR84X0zW3b8RibLuCUWNNSpuM9i8PAgwF0UbC0J4ogMT77tEqo/Y+Ci7xGcq8rOqWw4Gi0Lf16bnAM1VWXFvBFOtXHwLnPcXtARvGF92HquYthRXIZ8aQi76TRMwFt0FH8dK9XA9wGzaHBU+v4VPIFJXBXlQPdAMZD90bkHuydz2sntwLM3MMP5tnGetALik1irs0NenBTEu9rPgyOVlqxTkVodFXeKqdjaan9QZlLu0YbarLfMUIGFxx87WwXg6tBN/4MWot2r4z6N1mXC/ozwmNz68C8BdWkYKcbhARILY/NQle1LEG85SN3oQXNrghw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(2906002)(4326008)(316002)(8676002)(8936002)(66556008)(66476007)(54906003)(6916009)(66946007)(31686004)(107886003)(2616005)(6512007)(26005)(83380400001)(41300700001)(38100700002)(82960400001)(36756003)(86362001)(31696002)(6506007)(478600001)(6666004)(53546011)(966005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDI2MHViRy84YVMyWkJidmloLzR0R3RSUExzSkdjMzFzZmRya3o4VUF0Q0tC?=
 =?utf-8?B?V1JGWWpUK3Q0bWlUcmVoZ2I1SkF1S1o0UjdvUzlkREpzNFJWSmM2Z0FWcVhj?=
 =?utf-8?B?YU80c290WU5LSFVxdzBhbktVOFFCZitQRHJkZ1hiRWwvWGpENnljcjZIYjF3?=
 =?utf-8?B?eDRIRTU0ejhWQTQwM1J6VDBYelp3K1pJRXZsOENLVnU0RzBJaHF1dFYxdnJa?=
 =?utf-8?B?TmZHdU95RCszRzVKS3dONEQwTzVoanErZDhCVjFPZFhxWGw1QUR6ZWY0QTVs?=
 =?utf-8?B?Uk1ocnVaTkdRUk5yVGxhZlh3NzBqZ1h3Q3ZFQkpEZG8rWGVZKzlzQ0xtOGpW?=
 =?utf-8?B?eGNHNGRzd2wxbFRreTVEL21OSkk0a1Z1SUZac3ZtVmJWTWpReFp1NmR0UnNG?=
 =?utf-8?B?dTg3TjlxMkZCMDBKekpjYW9USE5GZ2RhVEt3bnoxekt0K1ZZWXFEV0VGTTl6?=
 =?utf-8?B?YSszcXhvNVhiRnVHYWNkbjBOY3ROY1FrSHBpU0ZGZVE3SVBiaUlOMDRHTU1h?=
 =?utf-8?B?UTdpL0ZidzlOQUUxWVcwMHRLMjArdkt4SzRTK1JaeWhVelIzMjJjTXhIS1d1?=
 =?utf-8?B?QVdmWG9OK0Rmb3YyU0NmZDZTY1NDdGdOODliU2JMWndoV1BaNWpab1N4WUky?=
 =?utf-8?B?d1NBdUgxbFcrRTlaU3Fsby9QaEtVSkF0T1JYeTEvcldoWDB2WUxBUFI2Q0Y3?=
 =?utf-8?B?WU9xSUc1akVQTERpUHU5Z1RLNkxSUGxlWVM2SmdYK2QyMG5XNlZsQ0hqcDBu?=
 =?utf-8?B?YzYxaWVFUUZSNTN1SkFGYVNHamE5cXNpaTlXd0dpMDA0alVibnVVc1AwTzJw?=
 =?utf-8?B?UUE5dktPZ2VKaGF1eEZRc1ZxSGFVcnovbVljRm1LUnhtUHdPdFJ1anZLTW9E?=
 =?utf-8?B?QlIzSW1HV21lZzIrNGJEbm1hNG1JekNEZ1JXN3crUVhqUGtZMEVmMkkrL3BG?=
 =?utf-8?B?MHpBbXphc0lrOUFhcjk3a0dYZkVta3NVc25XMXlXTXNobFhBc0lkc2F3NS83?=
 =?utf-8?B?YjVmbjAxcjRkYkRiZjNpRUtLMFNoZy9JS0JBVU41RGl0TStVOTlQb203VnF2?=
 =?utf-8?B?UFhseW5DcWZ3TTNFbHJRRUx4N203WGdWeHpIdFRRM2ZKRnF6bkVaVkx3SGtY?=
 =?utf-8?B?S0FOMkNlT1pyNmdraStGN2lrbEllNUxMeUdIMERvMmc3TFREcXNMSDhyemhq?=
 =?utf-8?B?UG1aOFNZancxbVJpM2NLdzNBaE5zeWtaWE9BNTRQVHVmV3pjWE82cU0vWlpj?=
 =?utf-8?B?UUkwYi8rQWxqTEk3ci8ybS9EQ2Z6VFFuRXJMSTVpcmgyZ3I5VmE0Vm0xd0xq?=
 =?utf-8?B?eGpMMjUrdWtwY2RFQ2kxbWJJNHJ0OW9tYlNySyt5TnhyYjRvdEFwdFVPbnpi?=
 =?utf-8?B?aTEvNW4yYno4S01jSjl2azd2OGNBWW80Q0wyYjdiUW8xRS94MzNNSWcwb1BU?=
 =?utf-8?B?WU0rdmpDM1poWncxR2F4MHU1WCtOcEpUVFhnaGtyUy9OUnR1WEliTzdIVHJ4?=
 =?utf-8?B?cVdrNUpaSDNUczZ5empPZ1NuUk5rWEFDQWwzVXl1ejNYcUx4WmFPbmVLZWNG?=
 =?utf-8?B?U0RkWHV6L0F6STR1YlZYRGdMWjMvRGZ0eTlVcUVGVDJ4WVgwZHlVYVVZb0lx?=
 =?utf-8?B?U1MwTXFSMXdOdXk0QkVwVnJDL0UrbGE1cGRjNXdQTnBESUcrOVdKVDdsTEoy?=
 =?utf-8?B?Y0hSbUZYUWFxU29xY3drRjZ4Zi93UklnUC9hNCtPZXExN04vekcwNUdiTXZ5?=
 =?utf-8?B?SUkvTy9Dci9WYzhKcVh4VTEzMlc5NDBhNlJ6WlN2eG5Td2R3NmdXT2x5c1dE?=
 =?utf-8?B?RGdLWjJFYlBxeU83MUdOeHNDd0xJOGpSRDNoQUk0TmFSYURwUTIzZGI1L1NH?=
 =?utf-8?B?Z1lkMkwvWStRQVNxU2U4UHpIMUxIVUFFS0RTbFUrbENOaTlaRnBUZ0J4WmRB?=
 =?utf-8?B?SFBUck42ZnEwcGhvYkQ0Mno5ZDVPS3ZWK1hZU3ZUVHJhempWaGFkTGwzTENn?=
 =?utf-8?B?bzdRVlk3Zlh5bkdzdndxZmd0T2hzbmE1VWtQcDhGMEVtT3JTbWNCQ05KRVhv?=
 =?utf-8?B?bkdpU1ZSbEFGaTk0YndSYSsvd2lpTDFmT2lUc2orNXErd0RlUnAxNFloWXNz?=
 =?utf-8?B?LzRxUHArSGMrYlkxdm9yV2V5dnNsakdUa1Z3N0FxUUtVVllsOFhaOHB2dU91?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a98360-92ea-4ed9-063d-08dc0cfdafa9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 08:18:09.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwoknxtGU6B6DMW8npgT2tah0PvAwm5hwckyEN1KKGKLzfD5PXhJMtEHCc8M1rP96DhaE//M+aX+gTCb1f79QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5502
X-OriginatorOrg: intel.com



On 2024/1/4 09:32, Yang Shi wrote:
> On Thu, Dec 21, 2023 at 5:13 PM Yin, Fengwei <fengwei.yin@intel.com> wrote:
>>
>>
>>
>> On 12/22/2023 2:11 AM, Yang Shi wrote:
>>> On Thu, Dec 21, 2023 at 5:40 AM Yin, Fengwei <fengwei.yin@intel.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/21/2023 8:58 AM, Yin Fengwei wrote:
>>>>> But what I am not sure was whether it's worthy to do such kind of change
>>>>> as the regression only is seen obviously in micro-benchmark. No evidence
>>>>> showed the other regressionsin this report is related with madvise. At
>>>>> least from the perf statstics. Need to check more on stream/ramspeed.
>>>>> Thanks.
>>>>
>>>> With debugging patch (filter out the stack mapping from THP aligned),
>>>> the result of stream can be restored to around 2%:
>>>>
>>>> commit:
>>>>      30749e6fbb3d391a7939ac347e9612afe8c26e94
>>>>      1111d46b5cbad57486e7a3fab75888accac2f072
>>>>      89f60532d82b9ecd39303a74589f76e4758f176f  -> 1111d46b5cbad with
>>>> debugging patch
>>>>
>>>> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 89f60532d82b9ecd39303a74589
>>>> ---------------- --------------------------- ---------------------------
>>>>        350993           -15.6%     296081 ±  2%      -1.5%     345689
>>>>      stream.add_bandwidth_MBps
>>>>        349830           -16.1%     293492 ±  2%      -2.3%     341860 ±
>>>> 2%  stream.add_bandwidth_MBps_harmonicMean
>>>>        333973           -20.5%     265439 ±  3%      -1.7%     328403
>>>>      stream.copy_bandwidth_MBps
>>>>        332930           -21.7%     260548 ±  3%      -2.5%     324711 ±
>>>> 2%  stream.copy_bandwidth_MBps_harmonicMean
>>>>        302788           -16.2%     253817 ±  2%      -1.4%     298421
>>>>      stream.scale_bandwidth_MBps
>>>>        302157           -17.1%     250577 ±  2%      -2.0%     296054
>>>>      stream.scale_bandwidth_MBps_harmonicMean
>>>>        339047           -12.1%     298061            -1.4%     334206
>>>>      stream.triad_bandwidth_MBps
>>>>        338186           -12.4%     296218            -2.0%     331469
>>>>      stream.triad_bandwidth_MBps_harmonicMean
>>>>
>>>>
>>>> The regression of ramspeed is still there.
>>>
>>> Thanks for the debugging patch and the test. If no one has objection
>>> to honor MAP_STACK, I'm going to come up with a more formal patch.
>>> Even though thp_get_unmapped_area() is not called for MAP_STACK, stack
>>> area still may be allocated at 2M aligned address theoretically. And
>>> it may be worse with multi-sized THP, for 1M.
>> Right. Filtering out MAP_STACK can't make sure no THP for stack. Just
>> reduce the possibility of using THP for stack.
> 
> Can you please help test the below patch?
I can't access the testing box now. Oliver will help to test your patch.


Regards
Yin, Fengwei

> 
> diff --git a/include/linux/mman.h b/include/linux/mman.h
> index 40d94411d492..dc7048824be8 100644
> --- a/include/linux/mman.h
> +++ b/include/linux/mman.h
> @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
>          return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
>                 _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>                 _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
> +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
>                 arch_calc_vm_flag_bits(flags);
>   }
> 
> But I can't reproduce the pthread regression on my aarch64 VM. It
> might be due to the guard stack (the 64K guard stack is at 2M aligned,
> the 8M stack is right next to it which starts at 2M + 64K). But I can
> see the stack area is not THP eligible anymore with this patch. See:
> 
> fffd18e10000-fffd19610000 rw-p 00000000 00:00 0
> Size:               8192 kB
> KernelPageSize:        4 kB
> MMUPageSize:           4 kB
> Rss:                  12 kB
> Pss:                  12 kB
> Pss_Dirty:            12 kB
> Shared_Clean:          0 kB
> Shared_Dirty:          0 kB
> Private_Clean:         0 kB
> Private_Dirty:        12 kB
> Referenced:           12 kB
> Anonymous:            12 kB
> KSM:                   0 kB
> LazyFree:              0 kB
> AnonHugePages:         0 kB
> ShmemPmdMapped:        0 kB
> FilePmdMapped:         0 kB
> Shared_Hugetlb:        0 kB
> Private_Hugetlb:       0 kB
> Swap:                  0 kB
> SwapPss:               0 kB
> Locked:                0 kB
> THPeligible:           0
> VmFlags: rd wr mr mw me ac nh
> 
> The "nh" flag is set.
> 
>>
>>>
>>> Do you have any instructions regarding how to run ramspeed? Anyway I
>>> may not have time debug it until after holidays.
>> 0Day leverages phoronix-test-suite to run ramspeed. So I don't have
>> direct answer here.
>>
>> I suppose we could check the configuration of ramspeed in phoronix-test-
>> suite to understand what's the build options and command options to run
>> ramspeed:
>> https://openbenchmarking.org/test/pts/ramspeed
> 
> Downloaded the test suite. It looks phronix just runs test 3 (int) and
> 6 (float). They basically does 4 sub tests to benchmark memory
> bandwidth:
> 
>   * copy
>   * scale copy
>   * add copy
>   * triad copy
> 
> The source buffer is initialized (page fault is triggered), but the
> destination area is not. So the page fault + page clear time is
> accounted to the result. Clearing huge page may take a little bit more
> time. But I didn't see noticeable regression on my aarch64 VM either.
> Anyway I'm supposed such test should be run with THP off.
> 
>>
>>
>> Regards
>> Yin, Fengwei
>>
>>>
>>>>
>>>>
>>>> Regards
>>>> Yin, Fengwei
