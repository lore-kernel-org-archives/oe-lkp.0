Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B45631
	for <oe-lkp@lists.linux.dev>; Fri, 22 Dec 2023 01:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6kdFrPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703207632; x=1734743632;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=edWvmsXJjlZPg35OYI5ObcFaPo8T10dyf9xsjlL3oMU=;
  b=Q6kdFrPLaLlSzYcGGw/x0aC1zQjU5iUntWfErEHzmmapZPRpxMawmtcd
   fjY8AhNukzWVG2IXOMXEMxbc5rXdX/gXp9c4kMcan7Q2VoBZAhYWITBHc
   iyCQWNzlj3UDZPbZtkYmGdisyzaYIBEkq6nYrwGDxfXaVcEPZsQL8wtAW
   h4MrwwVimc8NVw59bP4VmoDZlZrIUmIkhYDb5lxENQRtFIykNzIxzSuLS
   +SVS50pzctoJe1nkPvRufph+0yygXXY/SoNPdnOC9gkSpt2mxExQr5rGr
   A/qBP4cUsccldtDAEZhEYLrDYlG+oGjvUvvbey7EBE+2xHS3s542wqk8S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3303122"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="3303122"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 17:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1024054936"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="1024054936"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Dec 2023 17:13:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 17:13:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 17:13:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 17:13:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYYTo+OqW8NkdkN7g5CJKB6mZGvYev1KYlQf8Ybg8ct2TyJfHG50iuGX3lc3KgxHydM1dYSQuc1r+PqflMr3VswV1wTYOtYJaaq74X4CWAdw4deS5cH/uVizcrg9v4OhgzLCJ8cdTXyIQsdxhpzdpydJlpTpL/yca4lEzUuyQMuHfJVe8Gh2m5bKWe95fhBOg0G9RLRyEhQkru8SWuTz7Al7bKIFfbSS/AhWUmGy2q9NyTqVx+aFq4Lvy8lI+TZP5Eche3d2ycp4XknfnNDekd2N5NuEtT6DJ+kRKiKpXhUUpVktstdxUM9QByKaFAai09MjISkOjNY8V9BjjkyoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NIOjUuXgZUl53rc6QLI1jNQyFHJ6HapSqB2Ozf4Ock=;
 b=KCznRyPDvReLnS6+CASiVScCiJ488AOuqJl/snE9NGylZCUU9C/pLU/S1dXySIG7JjWYf+BmZnDrpQ3VKpzA8zlZGWczKd6VTJ9mHxB1oyTHgAmB5qBD+cmJsUpexeFBPgxxwVnRJV5G3UJBipEHbVqE7yifJvSMBjJQzzM2f2Ax59amjUAYF60vQ7X+jx/it4fI193Kx8lX47MUz0ApjV89iGuQt7fC9jhIM8E7ZVBlFMdhDYTUCfz7/5fTqemmwnh4r6WdHdXOyjfP9q96n9zGw8J6qRtfVkQBV3OHmJZHJgnZX69PjIRIl/Ilf87GA21nfrTXrcl3bVUP0RK7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 01:13:48 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Fri, 22 Dec 2023
 01:13:48 +0000
Message-ID: <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
Date: Fri, 22 Dec 2023 09:13:40 +0800
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
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5cb02f-60d0-4b0d-eb94-08dc028b4023
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oayPG7HHNvIvek2o+seQ2OfG9UhtA+2qKdySDogYcmQgv8NIrN9kDcl0uZ/OJ4Ngr9kp85WxIrLbzhGrbE39vElcCQbdi9t14INmnEclcIAuxKA97znz3H8aBq9ZvFg1lHQNWycjuK0H1u6S7GwuT8dUuCcmJ8opvUEYYzPdbxsy4g7NodOQWT5ADmwZFnwUXe1BdCQWBPOfEnCVa9JEXEdjAeZgWlO7m/DfTAxw8+lTEYvVhzzQb/NwVz2gwIjraIqfh+yeJ/b4FARsSYexjmEH73P0lR2G7ZeMcYFD3qqEcK0kY85ol4HrD7LOdz/HrlS9xiiOkLpQEp/8HLnvFHVZGdUo0C3uzJ4N+50DpROh2opU02ojG4RabRkDuwJJWY29oOsEFlS4zTzLIH9e+i1CgYMeqhrpitgn3I/abIoB41vGMeKKuppAMwmQo/TURFbmXeGNqmj5DKhqh9h8yky8hlXOaMf1jET/l2sNgdbXCPXnVcCdny5c+cq5s0tXws2Ykh8oxo6fD7qKO0JgRRWP6ZEUEqwh9thbHP87+4isTCPi983BVF9FQNewqbglnWaBGiMUWu8gDejIcM6hj/wVI9hArXK1UTm9AAJU1veBe4SjOEPDVsSb3pL1lB6r7Qc4gUVxB3vIYeD/0paJ1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4326008)(8676002)(8936002)(66946007)(66556008)(66476007)(6916009)(316002)(54906003)(82960400001)(2906002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(5660300002)(2616005)(107886003)(26005)(83380400001)(6486002)(478600001)(966005)(6512007)(6506007)(53546011)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWIzMTB2OEtOSjdzQSthM0NFbmpyRmNwdWlVQWlnc1VNZGwzR0Z4L1NHS3Ev?=
 =?utf-8?B?RFFDMDlXTlhLWlZGdWdJZ3B4cTNyV0tiVkUrYjIyZDZBZkpGSHhjLzRsRlox?=
 =?utf-8?B?SjlXc0l2UG9JcE5IWm9EQ2ZVTVhtcDg1RkFGOGNhYnRLN3ZGYVlXVTZqRFVH?=
 =?utf-8?B?b3hQMm9pSjBqLzU1b251eUwva3hnMlAyK3VKeVYyL3JWR3phM2lmdGFjemIy?=
 =?utf-8?B?NHFiSWRhRGYzWUpoMEUrYi92RW1JMlB1TWhFWlhzby80SWhzMjJKeStJU0gv?=
 =?utf-8?B?NTZZRHh0ME5tczNUREtnZDhiZTFqRERBalIweUF3dHdwWjUxc0cyZEJ3WmJn?=
 =?utf-8?B?KzhLdEgvRkV3eFZNUW5iUG1ablFVV0xjUCtuTXkyZlpORXYrckU5eE9obkhC?=
 =?utf-8?B?aE00UWhaVWZMQzlmUkZ4NjRhUWZZd3JPZnlDa3pXT2NUNllBSWl1MWJXR0tG?=
 =?utf-8?B?YlRZanl6Ull3OC9uQnBnbncwb1J1WEVxUm9uT3dBZ25CTEQ3OE9KK1ZZVmlz?=
 =?utf-8?B?QXZmVTRMbG45R01NbkdnbXRpVVpWWWhuMWp5L2ViZzZDODA2dkdqc2l0ZXlP?=
 =?utf-8?B?SmI4Vm5iZ3AvOU9xYUt6S21kaXJDeU4weXp5dEw5VGZGSk02YU90MlF4TU0z?=
 =?utf-8?B?ZzlyVkU2S1FOVTBVWXkvbHFINzFsbHRlN1NKdzBrSjVCdUZQMnR4bkZZakRn?=
 =?utf-8?B?Tm5LZHIwL3A3RDdrbXlNM0lMS3puUUZPVGxFaUduZENUZmVlSkpvelRJd255?=
 =?utf-8?B?QXdYbjMzclg0MW1YQXJyNE8vaGNjM2hLRUxHRlI1VzJENnQrNlFEaUlwWC9V?=
 =?utf-8?B?cDdFYXgrbUdSVkxkTmhBY2lTdnRqenFWK0hGVk01WW9aMm84aU5YZmhpNmNG?=
 =?utf-8?B?VXh1VUtQZ2dlZ1NBZDNLUWoyVHpKS0FBbU4wekZIR2h4L1MvQVJRUytwQXQy?=
 =?utf-8?B?MS91dGovMXZpc203Z3dKOUhodjZlS0NmQjQ3akRWWHdydklYNStZWDdIZU9D?=
 =?utf-8?B?TU13SFBKampSNkwzREtsNUY1eUxoeHoyV2ZSbDZFTzBOVVJWS2lGRWJqcGsr?=
 =?utf-8?B?T1d3K1NFME5ZenJGQmZ2RzVNWTlNU1Zubk5xZ1NKOUZFMzJIb2dBN0RHR0xi?=
 =?utf-8?B?MmVrMVFFSlVuNmlOc1VFcXA1anZzSXVJaTltbVJLcXEycWFSZTZNVEZlcUN5?=
 =?utf-8?B?MEV4QkswTG15WUtFMlo5c2RXb2RWQVY2bmx6eDV6T0JldmdUR1hZeWQzTHQ5?=
 =?utf-8?B?N2MzSXY4V3JzS21FZXUrOWtQZlNLUzZja2lsTE9Gei9vbW1QbkNCQUsxT0I2?=
 =?utf-8?B?S3BhZ3d3Y0x5Q045WW9wRzJ6dWxvdk9GYklaRDZXNXlQTjZmRmxYcjJrUjBN?=
 =?utf-8?B?UFl2MHVUaWhLcEJKaVR3a3g5dFFDaW8zYjRheDI3c0huTjJwMUpIODdycDhy?=
 =?utf-8?B?ZEwvd3hjK3RrVTREbk5MRmplNGpSQXg5L2psTm13TnFDdENqM3lzVS92ZEI5?=
 =?utf-8?B?K29IcnJsQXZBaUNFNXhGNmtuY1ZYK21Jd0pzRnl5TnQyY2N1c3p2alJ1VVpZ?=
 =?utf-8?B?cTBWN0xrVHpSMzRpQ29MVUtkSlhJb2kzK21iTDhaUHAvTGJZVC9XdGhmRFE3?=
 =?utf-8?B?RlZXbzMzVG1CSy9ySlA3Tk9GWFhyaXFuV0JNWjZ6Vk02K05idkw0blpGNTk0?=
 =?utf-8?B?TTdqa0liN2gwcVZYd0NGZHoxZUJqSkpGV3RxeDVGdWlkTkxpaDZ4OTFQeUtK?=
 =?utf-8?B?SmlGQjh5TVFKOXdVajNDTEM5TFNwYjk4TlMrUVdHS0FwOUErUVlTNWpPd0h0?=
 =?utf-8?B?cEhOZ1RVendWWHFtTGIyVmJISzRGYUREbkJvYXNSaVBaMi9GYXF5NEdITkYx?=
 =?utf-8?B?QURkVSs5VExuUjI5R2FxSXYvcCtqNkhzK0lXdkpNRk9ucHZvVW9LdDVTbWYy?=
 =?utf-8?B?aFBpemlXaDJtRDZvRy96MnZqZ1lYY3F2di9yVGRtUzgxM0x0MDh4U3VNQXp4?=
 =?utf-8?B?TE1QWVVpR25pVjdVSHpYQVVwbzJxWU4rMDJVVmNpdzRFWU1GM25lQWlvODNB?=
 =?utf-8?B?MkJ0cklXMDBUUDd1aEtxZkVBVGNjNTlwTmQ5NXJKWHJBR0t3QktwbVA1TGpS?=
 =?utf-8?Q?LMp18yVLJ4ave++ZA+T5VVjxX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5cb02f-60d0-4b0d-eb94-08dc028b4023
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 01:13:48.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikErF87mqLUjtAFgey1y3hkVuGHv5sAEjQ+c2lGNigr0lL/BycFTD8I307cx1gvOP5BKDUUbu2yq7VdJbITCQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
X-OriginatorOrg: intel.com



On 12/22/2023 2:11 AM, Yang Shi wrote:
> On Thu, Dec 21, 2023 at 5:40 AM Yin, Fengwei <fengwei.yin@intel.com> wrote:
>>
>>
>>
>> On 12/21/2023 8:58 AM, Yin Fengwei wrote:
>>> But what I am not sure was whether it's worthy to do such kind of change
>>> as the regression only is seen obviously in micro-benchmark. No evidence
>>> showed the other regressionsin this report is related with madvise. At
>>> least from the perf statstics. Need to check more on stream/ramspeed.
>>> Thanks.
>>
>> With debugging patch (filter out the stack mapping from THP aligned),
>> the result of stream can be restored to around 2%:
>>
>> commit:
>>     30749e6fbb3d391a7939ac347e9612afe8c26e94
>>     1111d46b5cbad57486e7a3fab75888accac2f072
>>     89f60532d82b9ecd39303a74589f76e4758f176f  -> 1111d46b5cbad with
>> debugging patch
>>
>> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 89f60532d82b9ecd39303a74589
>> ---------------- --------------------------- ---------------------------
>>       350993           -15.6%     296081 ±  2%      -1.5%     345689
>>     stream.add_bandwidth_MBps
>>       349830           -16.1%     293492 ±  2%      -2.3%     341860 ±
>> 2%  stream.add_bandwidth_MBps_harmonicMean
>>       333973           -20.5%     265439 ±  3%      -1.7%     328403
>>     stream.copy_bandwidth_MBps
>>       332930           -21.7%     260548 ±  3%      -2.5%     324711 ±
>> 2%  stream.copy_bandwidth_MBps_harmonicMean
>>       302788           -16.2%     253817 ±  2%      -1.4%     298421
>>     stream.scale_bandwidth_MBps
>>       302157           -17.1%     250577 ±  2%      -2.0%     296054
>>     stream.scale_bandwidth_MBps_harmonicMean
>>       339047           -12.1%     298061            -1.4%     334206
>>     stream.triad_bandwidth_MBps
>>       338186           -12.4%     296218            -2.0%     331469
>>     stream.triad_bandwidth_MBps_harmonicMean
>>
>>
>> The regression of ramspeed is still there.
> 
> Thanks for the debugging patch and the test. If no one has objection
> to honor MAP_STACK, I'm going to come up with a more formal patch.
> Even though thp_get_unmapped_area() is not called for MAP_STACK, stack
> area still may be allocated at 2M aligned address theoretically. And
> it may be worse with multi-sized THP, for 1M.
Right. Filtering out MAP_STACK can't make sure no THP for stack. Just
reduce the possibility of using THP for stack.

> 
> Do you have any instructions regarding how to run ramspeed? Anyway I
> may not have time debug it until after holidays.
0Day leverages phoronix-test-suite to run ramspeed. So I don't have
direct answer here.

I suppose we could check the configuration of ramspeed in phoronix-test-
suite to understand what's the build options and command options to run
ramspeed:
https://openbenchmarking.org/test/pts/ramspeed


Regards
Yin, Fengwei

> 
>>
>>
>> Regards
>> Yin, Fengwei
