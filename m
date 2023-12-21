Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EAF185D
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3cqW5IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703120635; x=1734656635;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EbpEkyxVh+AqwHgcALHnVzjQSlupaefe0i9ba/8VH5E=;
  b=Q3cqW5IUSH5HxOIfw4CjQ+CI9ZpnPRPIRKDf7dwGB0NadYlvic9kem9M
   FydkHZW4v9h2CR3yE81RGCBNmBIAgTGS/p+zKaHwiunl+burAbDLFerPl
   U3VOvhB0S1tQIOB73X9fhm7ZCnDozr4Kjf5QEUUDuU0FuSoyGe+gbt75I
   47nEhcAEE4/G3S56Bh/V+jn9NlDUNaEJpLL7tCcAE9uSfTdRXfDmNb/WZ
   nktA9FzWO54bTeVSjd0XNLsR8cQjBgaEESL1aQLjv+EAAXnoVUAMiCRti
   Rkgs2nlJpCRSPDOJdSmJPyhbjK43uo5YRLcxHv0TyQNvk/fL6UdD4BjWr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="399733233"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="399733233"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 17:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1107910488"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="1107910488"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2023 17:03:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:03:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:03:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 17:03:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 17:03:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO5nEzNUoCUsiXhAS0Y/5ySPILog50fUbulppjCNJKGdT4iNA0VDuN260ZJk+CUqMjCgO5Tp7zCkk8rOd6a4hyV+QjhH/AQ9CPmgoglRHTFQSQ1xrvuvY/UDuwsfCYxzltnLWBuclMP+GfxdmaXCG8504mCYAxK73FJu6RHF0ooUSesVeC5KLX9UsKm9Rtq0tHpArxKYUlGCXH7xeohkHn/wx0JDloQcZYGpeiiGu+wh2cC536mcRTPqUYRVfv4OJ4tOiBmeCcx6bzYvgGlhetS7Vmtb8KzE8QiFQJdYjfzFqHZU/IzOxsyHcroWDWFTZqPgFnaJ0VsNpRAahq3h6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM5B87Ad5WissNvk648egvpq1N9gp9Nh6aGALH4tXuU=;
 b=kB9F36dYhgEdh7aIxiDMuNzH2HuFz19XBTYzPERI+VCy3/9+EXuTQrvM+UBh6Pz9Y5lM0ObbDKnXfGlUoTfLUbBEqp+2K/tt74+zMWvwCNJi5t9usb4V9xz76vVkquSrebw9yL8/ZLaqRI0hw2BukH7mAXCjGF0Nogqzxn6hvhKAuaeievBlbxW7HumkXIivbl1YKAWZnz1LAlRAB2IWdOjwRug22D7FwGMh6pTXHpzzaDbYZqzoa5iI28mYLs2ceDo569gWcvqgkVlvz8MS5yvHEctgyjCtxVjbu04I1P1YRZZn4Y+i31X63B0pgB1CSJJeJnds1VE3lZSrTq4HVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ0PR11MB5677.namprd11.prod.outlook.com (2603:10b6:a03:37e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 01:03:50 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 01:03:50 +0000
Message-ID: <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
Date: Thu, 21 Dec 2023 08:58:42 +0800
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
From: Yin Fengwei <fengwei.yin@intel.com>
In-Reply-To: <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SJ0PR11MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8549544b-9fb5-48a0-9786-08dc01c0b152
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkjhdU9w5RDCu1E/s87ms+8jVpa4WtZtPD0dkOMg0uJKe6VN1ayz+UFaCx/fBeXTx4SJF6cLHyyGPYhfaXpXS1PTXuZFLp0vNXfU9m6Y0SDvbQAi7w58bm2Xjfuz/gTL4Cz8Kn6aleW1dDhl85chca08OQ9rrRewZUni50iyKvElLh3+5CY+wE2778uvi2ByzF+2vFtSViRoSjKvlFrzN6vr2HYyJosAToL9Bi/VtGM76jUPUAf31pqGyJoxuUBam1tFPR7bcVH2Hi2zJ8JLSCf99CxdAwGvbtsEGtD06Wd/HL7A42k9MJlgvHY4eBeEPl7w/51JvqMOXGYYfxBFEHSgEYpXV+UJNgM2tbd50gEn4Dg+unQRC9yHvYEVyilpV8hqmycuRaRi15Brp3D6LujBJvMl/bd0ZXB8KfFscTS6xP8FUiD5vDRmef+ven+0qwwMRRNx5E3zavd4ZXweOmOAlQ7JqNswp5cx8h51i+gcrzbqfuUJ003rkyTEwQiCR97DKS6J+tYfdmhM7qaDioXUY9rd1wgXb7MR214S517LQPepUQ5hW6vDJCBAfQdHesi3C4UI5B4DojxToUH7UbzQkyaHuo6j2T44lF3Nudebd9hmobCcvDXUA7TlV0qidq+7CaLemYU/9jABD1VR2d4/7scSOmiyLWxGclfty1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(2906002)(36756003)(82960400001)(8936002)(8676002)(5660300002)(30864003)(4326008)(478600001)(26005)(107886003)(6486002)(2616005)(41300700001)(966005)(6506007)(53546011)(6512007)(31686004)(83380400001)(31696002)(66946007)(86362001)(66476007)(66556008)(6666004)(6916009)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxCOEIveFlCdHZMU2xHSW40UjlPV3ZRTFl4UVVqQXB1ejA1bGFRMU8zelBD?=
 =?utf-8?B?ZUFxUC9lb25uQU9pSnJhZUNZckNNYmxWL1FKUndYcEcrQXFlODN2OURHb1d6?=
 =?utf-8?B?VTBUUnJ1OE1aNThUeHhDR2xzRXZtSFFZckpDMUM2YnFRVFdPL0dFMXJlVFlm?=
 =?utf-8?B?aG9vOFNXVk5LUEp4RjUzUVY4eWh4TGdxVzVRcEE4Q2crN0JMK2hEYytzSXl2?=
 =?utf-8?B?WXJSWVJqcHY3V3hwOEFnSkZaQUVOM2dOdVZXVS9SNHdSS1I1cm11aHhweFFy?=
 =?utf-8?B?SjdwTXhhVERsenlKOTdGOFhseEw2YjdNTXd4YnFML3lrMjJJZHpwU0N5cWJz?=
 =?utf-8?B?a0xrdGkzZWZEYlRDZFZ4MGVtUVRtb2hhdy9IdWFaMzlFSS91ODN6VWxvUVVW?=
 =?utf-8?B?N0hadUFNUDZxR3lZV3RNOG5ueG8yWjF3bVUrTWJBdk9VdjJMdVVSL0o3TGQv?=
 =?utf-8?B?UGVkZHlNeXFDM0t1L1k4Y2hlWWxCWmh2N2tNY0RRa0RBLzRUc3FjUUlkU09L?=
 =?utf-8?B?dkt4S09EaExBQmcvVjh0M3FGY2IvK3F4Skt6WGlsSVJNOGQ0cThqVUpzWTc2?=
 =?utf-8?B?YkZ4OHRDQ0xITFFuVHVSU3V6NVNDWnN3MC9GK1NyQjhNWC8zQ0dRQy9QajdC?=
 =?utf-8?B?Y0hLOWlzYlhlVVRIS3VlSFl1QVErYUgrbUNodzFWbmZFdHJvUHBORzhRUktM?=
 =?utf-8?B?NjRuWW1yVEtkQUhxOTJQVWxHK0Z0N2N4Z1ljUU9rQXVWeVA0ZHJvTjZQV0ZH?=
 =?utf-8?B?QTViQzFsZ21XdEgyZURnTW54UzBCdW9zMVB0R3VxNGZNQlRvN2NMdkhva3BR?=
 =?utf-8?B?TCtPQ25OQ1kzTWd5b3lGM25HdENqQWFmQnBEd0JxNnl1TU1hRmR6cTJDNzMx?=
 =?utf-8?B?aEdNSjVlbTMvY09KeEFVOUFHVFBuQ0pjLzd1TTlmc2N4MnpEb2pDa3VzOEJk?=
 =?utf-8?B?aVRIZUhETjU4OEQ5V0hZVmdRYXFSeFJmck8yVXp6TWRTTjkvR01WcjZhOC9R?=
 =?utf-8?B?Qm9FY2FubHVXdS8wOE5Zc2pabGVrYmFQT2ZnVytSenZqQXVJNzRsY24xZXhM?=
 =?utf-8?B?RFZaeTVnU0psNjlWSkJVTG9XNDBsWFU2VXpDS2l4RzN4TzZ5UUJWYit4ZkpC?=
 =?utf-8?B?cXZTZW1YeXM3S0lxUEZFYkNKMWlIbW5PNWpMRkQzSkxHN1VvWEsxVU9FVXdw?=
 =?utf-8?B?ckFqZTFIY005QzN1bERGVGdjSHZRUkRKbUZ0VFVrVDdMeDNmRVZQOWlKQS9p?=
 =?utf-8?B?dVUxUFc0UDJSd2hyTFBvUU1JUEdpcGw5MlhoUXpEQzc3bElzV05FRmNYZHpM?=
 =?utf-8?B?UUV5OGJHSld3cTFSRGlHcUFWSjQrYk1lRldDcHUxbEY0V3VRdG5GWXhpNDhx?=
 =?utf-8?B?SEYvaDF6VkJNdmlscjQwM1pJRUEvYUlrWm0wd0VLZmRTd3hzMlV6UzZlVElw?=
 =?utf-8?B?em1FNTVQODBJZVJrQkZiZzZzQ2FzTG1WUVFMR1MyaHBFTUpLNmFyNHJWaVJR?=
 =?utf-8?B?ZW1vYzFNc3ZQNHcvd1QrTWliU1J3NVM1Sm5jMFJFMlRHVDNUZWJHN0FPcERP?=
 =?utf-8?B?VkFCalJEVlVNZm9yejdabUdmWWhtUjdwQVJqVWY5M2wzYUI4cGVsbDg0RTk0?=
 =?utf-8?B?dGJyUUxVSUxKd3lUS3ZuNlRQZ2Q0TWVjOTNpRU40eDVoOXhRYURTbHZHYXN2?=
 =?utf-8?B?Y0YyR21YVDcwVjRRQnFWZWFGU0NQYjZ4cWNyYVRGTHhxTEJEQnVCRktDWTNH?=
 =?utf-8?B?bnZ2bVpLUlBLNzFOcWdFdXBuOUVXR01sbjVzNkxDcWJDSW1LZG9HMitZKzhy?=
 =?utf-8?B?UWtKK293S0VTMjEvZS9VV1l3NkVLbWtNUzNKN3EvQ2I2OGhYSG9IU1NicjBh?=
 =?utf-8?B?Zjg5RnVlczFwbnIvRW9CK1EzSDkrY3V6am1EUXVJRTRxdjN6dG5Xd3lva3JU?=
 =?utf-8?B?Vjl1aExSVlZKaWM5REdoY293eGtnVWdxOXhhNi9rajRlTE5sQ01tNDVyaFAy?=
 =?utf-8?B?L3Z0K3VKNXlTWHFCWGVwdjNFclFjU3U3VTdOV3Y1cEpPdjVSL0V1MWZvY0Z0?=
 =?utf-8?B?SkwxWGpkaGNEaFY0RTQ3bzN2U3NuemwrVzhsWHZ6clg5Sml1eFhtRFRNZFdZ?=
 =?utf-8?Q?ZhNr8h0gvwePrpqEQoMz3UiuH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8549544b-9fb5-48a0-9786-08dc01c0b152
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 01:03:50.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqMFwbd4UDhjcFfqd8uL+8GOal4MovHS1blA3EP9T+XCKNdAY6Oe1r7oV7rdnPvfiHilFNr1wVjXPfXPwcUExA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5677
X-OriginatorOrg: intel.com



On 2023/12/21 08:26, Yang Shi wrote:
> On Wed, Dec 20, 2023 at 12:09 PM Yang Shi <shy828301@gmail.com> wrote:
>>
>> On Wed, Dec 20, 2023 at 12:34 AM Yin Fengwei <fengwei.yin@intel.com> wrote:
>>>
>>>
>>>
>>> On 2023/12/20 13:27, Yang Shi wrote:
>>>> On Tue, Dec 19, 2023 at 7:41 AM kernel test robot <oliver.sang@intel.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> Hello,
>>>>>
>>>>> for this commit, we reported
>>>>> "[mm]  96db82a66d:  will-it-scale.per_process_ops -95.3% regression"
>>>>> in Aug, 2022 when it's in linux-next/master
>>>>> https://lore.kernel.org/all/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020/
>>>>>
>>>>> later, we reported
>>>>> "[mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression"
>>>>> in Oct, 2022 when it's in linus/master
>>>>> https://lore.kernel.org/all/202210181535.7144dd15-yujie.liu@intel.com/
>>>>>
>>>>> and the commit was reverted finally by
>>>>> commit 0ba09b1733878afe838fe35c310715fda3d46428
>>>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>>>> Date:   Sun Dec 4 12:51:59 2022 -0800
>>>>>
>>>>> now we noticed it goes into linux-next/master again.
>>>>>
>>>>> we are not sure if there is an agreement that the benefit of this commit
>>>>> has already overweight performance drop in some mirco benchmark.
>>>>>
>>>>> we also noticed from https://lore.kernel.org/all/20231214223423.1133074-1-yang@os.amperecomputing.com/
>>>>> that
>>>>> "This patch was applied to v6.1, but was reverted due to a regression
>>>>> report.  However it turned out the regression was not due to this patch.
>>>>> I ping'ed Andrew to reapply this patch, Andrew may forget it.  This
>>>>> patch helps promote THP, so I rebased it onto the latest mm-unstable."
>>>>
>>>> IIRC, Huang Ying's analysis showed the regression for will-it-scale
>>>> micro benchmark is fine, it was actually reverted due to kernel build
>>>> regression with LLVM reported by Nathan Chancellor. Then the
>>>> regression was resolved by commit
>>>> 81e506bec9be1eceaf5a2c654e28ba5176ef48d8 ("mm/thp: check and bail out
>>>> if page in deferred queue already"). And this patch did improve kernel
>>>> build with GCC by ~3% if I remember correctly.
>>>>
>>>>>
>>>>> however, unfortunately, in our latest tests, we still observed below regression
>>>>> upon this commit. just FYI.
>>>>>
>>>>>
>>>>>
>>>>> kernel test robot noticed a -84.3% regression of stress-ng.pthread.ops_per_sec on:
>>>>
>>>> Interesting, wasn't the same regression seen last time? And I'm a
>>>> little bit confused about how pthread got regressed. I didn't see the
>>>> pthread benchmark do any intensive memory alloc/free operations. Do
>>>> the pthread APIs do any intensive memory operations? I saw the
>>>> benchmark does allocate memory for thread stack, but it should be just
>>>> 8K per thread, so it should not trigger what this patch does. With
>>>> 1024 threads, the thread stacks may get merged into one single VMA (8M
>>>> total), but it may do so even though the patch is not applied.
>>> stress-ng.pthread test code is strange here:
>>>
>>> https://github.com/ColinIanKing/stress-ng/blob/master/stress-pthread.c#L573
>>>
>>> Even it allocates its own stack, but that attr is not passed
>>> to pthread_create. So it's still glibc to allocate stack for
>>> pthread which is 8M size. This is why this patch can impact
>>> the stress-ng.pthread testing.
>>
>> Aha, nice catch, I overlooked that.
>>
>>>
>>>
>>> My understanding is this is different regression (if it's a valid
>>> regression). The previous hotspot was in:
>>>      deferred_split_huge_page
>>>         deferred_split_huge_page
>>>            deferred_split_huge_page
>>>               spin_lock
>>>
>>> while this time, the hotspot is in (pmd_lock from do_madvise I suppose):
>>>      - 55.02% zap_pmd_range.isra.0
>>>         - 53.42% __split_huge_pmd
>>>            - 51.74% _raw_spin_lock
>>>               - 51.73% native_queued_spin_lock_slowpath
>>>                  + 3.03% asm_sysvec_call_function
>>>            - 1.67% __split_huge_pmd_locked
>>>               - 0.87% pmdp_invalidate
>>>                  + 0.86% flush_tlb_mm_range
>>>         - 1.60% zap_pte_range
>>>            - 1.04% page_remove_rmap
>>>                 0.55% __mod_lruvec_page_state
>>>
>>>
>>>>
>>>>>
>>>>>
>>>>> commit: 1111d46b5cbad57486e7a3fab75888accac2f072 ("mm: align larger anonymous mappings on THP boundaries")
>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>>
>>>>> testcase: stress-ng
>>>>> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
>>>>> parameters:
>>>>>
>>>>>           nr_threads: 1
>>>>>           disk: 1HDD
>>>>>           testtime: 60s
>>>>>           fs: ext4
>>>>>           class: os
>>>>>           test: pthread
>>>>>           cpufreq_governor: performance
>>>>>
>>>>>
>>>>> In addition to that, the commit also has significant impact on the following tests:
>>>>>
>>>>> +------------------+-----------------------------------------------------------------------------------------------+
>>>>> | testcase: change | stream: stream.triad_bandwidth_MBps -12.1% regression                                         |
>>>>> | test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory   |
>>>>> | test parameters  | array_size=50000000                                                                           |
>>>>> |                  | cpufreq_governor=performance                                                                  |
>>>>> |                  | iterations=10x                                                                                |
>>>>> |                  | loop=100                                                                                      |
>>>>> |                  | nr_threads=25%                                                                                |
>>>>> |                  | omp=true                                                                                      |
>>>>> +------------------+-----------------------------------------------------------------------------------------------+
>>>>> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.Integer.mb_s -3.5% regression       |
>>>>> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
>>>>> | test parameters  | cpufreq_governor=performance                                                                  |
>>>>> |                  | option_a=Average                                                                              |
>>>>> |                  | option_b=Integer                                                                              |
>>>>> |                  | test=ramspeed-1.4.3                                                                           |
>>>>> +------------------+-----------------------------------------------------------------------------------------------+
>>>>> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s -3.0% regression |
>>>>> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
>>>>> | test parameters  | cpufreq_governor=performance                                                                  |
>>>>> |                  | option_a=Average                                                                              |
>>>>> |                  | option_b=Floating Point                                                                       |
>>>>> |                  | test=ramspeed-1.4.3                                                                           |
>>>>> +------------------+-----------------------------------------------------------------------------------------------+
>>>>>
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-lkp/202312192310.56367035-oliver.sang@intel.com
>>>>>
>>>>>
>>>>> Details are as below:
>>>>> -------------------------------------------------------------------------------------------------->
>>>>>
>>>>>
>>>>> The kernel config and materials to reproduce are available at:
>>>>> https://download.01.org/0day-ci/archive/20231219/202312192310.56367035-oliver.sang@intel.com
>>>>>
>>>>> =========================================================================================
>>>>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>>>>>     os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/pthread/stress-ng/60s
>>>>>
>>>>> commit:
>>>>>     30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>>>>>     1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>>>>>
>>>>> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
>>>>> ---------------- ---------------------------
>>>>>            %stddev     %change         %stddev
>>>>>                \          |                \
>>>>>     13405796           -65.5%    4620124        cpuidle..usage
>>>>>         8.00            +8.2%       8.66 ą  2%  iostat.cpu.system
>>>>>         1.61           -60.6%       0.63        iostat.cpu.user
>>>>>       597.50 ą 14%     -64.3%     213.50 ą 14%  perf-c2c.DRAM.local
>>>>>         1882 ą 14%     -74.7%     476.83 ą  7%  perf-c2c.HITM.local
>>>>>      3768436           -12.9%    3283395        vmstat.memory.cache
>>>>>       355105           -75.7%      86344 ą  3%  vmstat.system.cs
>>>>>       385435           -20.7%     305714 ą  3%  vmstat.system.in
>>>>>         1.13            -0.2        0.88        mpstat.cpu.all.irq%
>>>>>         0.29            -0.2        0.10 ą  2%  mpstat.cpu.all.soft%
>>>>>         6.76 ą  2%      +1.1        7.88 ą  2%  mpstat.cpu.all.sys%
>>>>>         1.62            -1.0        0.62 ą  2%  mpstat.cpu.all.usr%
>>>>>      2234397           -84.3%     350161 ą  5%  stress-ng.pthread.ops
>>>>>        37237           -84.3%       5834 ą  5%  stress-ng.pthread.ops_per_sec
>>>>>       294706 ą  2%     -68.0%      94191 ą  6%  stress-ng.time.involuntary_context_switches
>>>>>        41442 ą  2%   +5023.4%    2123284        stress-ng.time.maximum_resident_set_size
>>>>>      4466457           -83.9%     717053 ą  5%  stress-ng.time.minor_page_faults
>>>>
>>>> The larger RSS and fewer page faults are expected.
>>>>
>>>>>       243.33           +13.5%     276.17 ą  3%  stress-ng.time.percent_of_cpu_this_job_got
>>>>>       131.64           +27.7%     168.11 ą  3%  stress-ng.time.system_time
>>>>>        19.73           -82.1%       3.53 ą  4%  stress-ng.time.user_time
>>>>
>>>> Much less user time. And it seems to match the drop of the pthread metric.
>>>>
>>>>>      7715609           -80.2%    1530125 ą  4%  stress-ng.time.voluntary_context_switches
>>>>>        76728           -80.8%      14724 ą  4%  perf-stat.i.minor-faults
>>>>>      5600408           -61.4%    2160997 ą  5%  perf-stat.i.node-loads
>>>>>      8873996           +52.1%   13499744 ą  5%  perf-stat.i.node-stores
>>>>>       112409           -81.9%      20305 ą  4%  perf-stat.i.page-faults
>>>>>         2.55           +89.6%       4.83        perf-stat.overall.MPKI
>>>>
>>>> Much more TLB misses.
>>>>
>>>>>         1.51            -0.4        1.13        perf-stat.overall.branch-miss-rate%
>>>>>        19.26           +24.5       43.71        perf-stat.overall.cache-miss-rate%
>>>>>         1.70           +56.4%       2.65        perf-stat.overall.cpi
>>>>>       665.84           -17.5%     549.51 ą  2%  perf-stat.overall.cycles-between-cache-misses
>>>>>         0.12 ą  4%      -0.1        0.04        perf-stat.overall.dTLB-load-miss-rate%
>>>>>         0.08 ą  2%      -0.0        0.03        perf-stat.overall.dTLB-store-miss-rate%
>>>>>        59.16            +0.9       60.04        perf-stat.overall.iTLB-load-miss-rate%
>>>>>         1278           +86.1%       2379 ą  2%  perf-stat.overall.instructions-per-iTLB-miss
>>>>>         0.59           -36.1%       0.38        perf-stat.overall.ipc
>>>>
>>>> Worse IPC and CPI.
>>>>
>>>>>    2.078e+09           -48.3%  1.074e+09 ą  4%  perf-stat.ps.branch-instructions
>>>>>     31292687           -61.2%   12133349 ą  2%  perf-stat.ps.branch-misses
>>>>>     26057291            -5.9%   24512034 ą  4%  perf-stat.ps.cache-misses
>>>>>    1.353e+08           -58.6%   56072195 ą  4%  perf-stat.ps.cache-references
>>>>>       365254           -75.8%      88464 ą  3%  perf-stat.ps.context-switches
>>>>>    1.735e+10           -22.4%  1.346e+10 ą  2%  perf-stat.ps.cpu-cycles
>>>>>        60838           -79.1%      12727 ą  6%  perf-stat.ps.cpu-migrations
>>>>>      3056601 ą  4%     -81.5%     565354 ą  4%  perf-stat.ps.dTLB-load-misses
>>>>>    2.636e+09           -50.7%    1.3e+09 ą  4%  perf-stat.ps.dTLB-loads
>>>>>      1155253 ą  2%     -83.0%     196581 ą  5%  perf-stat.ps.dTLB-store-misses
>>>>>    1.473e+09           -57.4%  6.268e+08 ą  3%  perf-stat.ps.dTLB-stores
>>>>>      7997726           -73.3%    2131477 ą  3%  perf-stat.ps.iTLB-load-misses
>>>>>      5521346           -74.3%    1418623 ą  2%  perf-stat.ps.iTLB-loads
>>>>>    1.023e+10           -50.4%  5.073e+09 ą  4%  perf-stat.ps.instructions
>>>>>        75671           -80.9%      14479 ą  4%  perf-stat.ps.minor-faults
>>>>>      5549722           -61.4%    2141750 ą  4%  perf-stat.ps.node-loads
>>>>>      8769156           +51.6%   13296579 ą  5%  perf-stat.ps.node-stores
>>>>>       110795           -82.0%      19977 ą  4%  perf-stat.ps.page-faults
>>>>>    6.482e+11           -50.7%  3.197e+11 ą  4%  perf-stat.total.instructions
>>>>>         0.00 ą 37%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
>>>>>         0.01 ą 18%   +8373.1%       0.73 ą 49%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
>>>>>         0.01 ą 16%   +4600.0%       0.38 ą 24%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
>>>>
>>>> More time spent in madvise and munmap. but I'm not sure whether this
>>>> is caused by tearing down the address space when exiting the test. If
>>>> so it should not count in the regression.
>>> It's not for the whole address space tearing down. It's for pthread
>>> stack tearing down when pthread exit (can be treated as address space
>>> tearing down? I suppose so).
>>>
>>> https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
>>> https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576
>>
>> It explains the problem. The madvise() does have some extra overhead
>> for handling THP (splitting pmd, deferred split queue, etc).
>>
>>>
>>> Another thing is whether it's worthy to make stack use THP? It may be
>>> useful for some apps which need large stack size?
>>
>> Kernel actually doesn't apply THP to stack (see
>> vma_is_temporary_stack()). But kernel can't know whether the VMA is
>> stack or not by checking VM_GROWSDOWN | VM_GROWSUP flags. So if glibc
>> doesn't set the proper flags to tell kernel the area is stack, kernel
>> just treats it as normal anonymous area. So glibc should set up stack
>> properly IMHO.
> 
> If I read the code correctly, nptl allocates stack by the below code:
> 
> mem = __mmap (NULL, size, (guardsize == 0) ? prot : PROT_NONE,
>                          MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
> 
> See https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L563
> 
> The MAP_STACK is used, but it is a no-op on Linux. So the alternative
> is to make MAP_STACK useful on Linux instead of changing glibc. But
> the blast radius seems much wider.
Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
filter out of the MAP_STACK mapping based on this patch. The regression
in stress-ng.pthread was gone. I suppose this is kind of safe because
the madvise call is only applied to glibc allocated stack.


But what I am not sure was whether it's worthy to do such kind of change
as the regression only is seen obviously in micro-benchmark. No evidence
showed the other regressionsin this report is related with madvise. At
least from the perf statstics. Need to check more on stream/ramspeed. 
Thanks.


Regards
Yin, Fengwei

> 
>>
>>>
>>>
>>> Regards
>>> Yin, Fengwei
