Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F8257B
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 01:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKZlfugy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703120892; x=1734656892;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CarGK4mNjLyyBqStNr6HM3SLklQ63CGa2/z6tsI1lfI=;
  b=TKZlfugyKxwb1KtGUjc6XFQ/YWFhwVSQpYMrZna1+eZHMpxB3X/FvsIM
   qHKQUIUGwjbEz3McxxvvXuky3BWWDtELNMkTcW/8cwk2oFN0DeALkJ28x
   dYdQJZ2l7wR0ne9+e0EYWYuzThA8HewBxFv2M2q7/SfbyWo37ZSHNb+I3
   dgzf+/sDikokd9ckGACVp3Jn0ppjf9Gez60LcITATpPYXGh8jkBvduzvy
   K8ZFSlklbvKfynbiEZZVfjz0dcpFXyy6s/AA74N+J2V4lerO0Q37RvGpF
   Du31Iy57wb9UcUCSzcGYYNUWT84DRU0egkAZJLHUOU0QY1U5yQ3UvdEAJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="395621362"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="395621362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 17:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="18155638"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2023 17:08:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:08:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 17:08:09 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 17:08:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ewq62dTfbZWMqCE8Qk93vzuwvE+cU6aB9+uszBUtGZzoOA7SEyKOCqE1BzHZ7oP7rhFBounWnM4Xk5lxlp+qrMf+v7xfnkoc9s61Yx4P6zVt2qiJE/HcC8BrBScr//F72T18qtgl1LirbDfj0Ven/wYe/rgxOxoeQSGTeTHqktNRLK7R5SwK9rBMUv2GCghETqYaoNghi2TLhi4bCzqDiwtgQzxFthpnTYqU4O0Xj0fxyKsL20/28IuMWrr3nVzczdg64oiyRNtYVnPPeUNzLlAoPkEs/fTfgKzh3fSgJVetn+UsWxsj0yL7ML/0cSxkVQnfzx2ZUGWfxkxQoRchsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy7GbLUEuAmcELsGq3Sot6qlp5bGKmEwqqPrLcopMO4=;
 b=YZwc2Xeeo43Hg+Mm5i9tXN2cBkvO1eP7jkkjhLv0299XRHupxMimdB2Z9aWjlylaJLEj2pYSBkY0nDiL5nyzhqAlbCI2cCIjsbvy/WBY9+BOZEtxkoQ7V1+o9S9U9f18nFBl0n/aQkIXij6nWBn9njahcjYVuJZix+Zzqtmsk6+IbjhphJrzZbSrEj/50PW3pKX7X4LdVO0ASJH0Q6X2KtTUWe2emquCfqCtv9TfAV1ulQUtj5uPzyQ2hfiBUi6UjCwk93yA1qbC4b/ApOcal71i7vMKK9rMM3aXtB9fY4MsBzIT/JBprSC00+0oZJ5wjt+HcMT4SzZAvI/4E4BmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Thu, 21 Dec 2023 01:08:02 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 01:08:02 +0000
Message-ID: <c739da04-9ea7-49c5-80b0-d9117f2c8f44@intel.com>
Date: Thu, 21 Dec 2023 09:02:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Content-Language: en-US
From: Yin Fengwei <fengwei.yin@intel.com>
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
In-Reply-To: <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e92f71a-be03-427a-57e5-08dc01c147be
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbh5i10JKGt3tnkQ2DyYhXucIXn46IZaYFhPvQomqOePkfoYRby9KYs1metrMyYPpFHt7eJcWZ5jP4Ob2u6rGClu6dL7uC31z4qG4IpFNgZ7EJ21rZ38OM28PvLjWw6hyRecDEG5sgirV5u/dF7W+AfCg312LzRhZeZJmnCoA0JTP/zsLPpAPBUaJTBcnzKKKdu1LCqxYaFTQNoXe/uK8om4wU75GT8RvVcjQ3GTzWRL1c0oy5921tZDw7iC5FFw7ocLEhIZbh8GxT0QONPwmxR7Q+2EL072yp/XXxpWV/Y3JiYy1KBEDDXzX9NRBndua4lx47QG9YNyETDA8TcGr9v04AV8Hz4pCjgiS8mFCfHflezFvmyzsx4jsE3nS8H0r424+5heegmWRPZgHZzLbrwWUmgclt8PmNNnklJIs70Zoi0O5HymD3MO8Dz+8szER3cBQK52SDXP76KaiupcCP6sCJkLwO8NGTvV+mhqg1JMF8U0MBRH3AIZtzizZ95ypFZosGxZYmSDY/9YC7RH3mPjnV7XTxOwdMyM3pwIz6AYw8ZtDt8hFjoPsZCqZyoPhXGDgG0ATNoqOJ84KqQEHho3wT/Rk8Vnl7Yj7wYKb3RLgaLsFzhRjzNwVGOn7ml51qMirNIO9YrQMyM+pbSWsMLWr34zJeR8sQUuiDmq6zs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(2906002)(66946007)(8936002)(4326008)(8676002)(5660300002)(316002)(6506007)(66556008)(66476007)(6512007)(6916009)(6666004)(54906003)(86362001)(31696002)(83380400001)(2616005)(26005)(82960400001)(966005)(478600001)(107886003)(6486002)(41300700001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2hoQnZvemdDdE0vdkVVVWJtbTd6U3N5akdKcXhEdkdWVElsbWpBWmpLRlFo?=
 =?utf-8?B?VGtwcVpEcmYrMVIwcTk3ekxMdDBqbUZYN3MybWkzN2M4OGZqNlAwaWlSVWI5?=
 =?utf-8?B?amdhbmU0Q3ExcGYxTlU0Q2V0bmMzRy8yT0JubW5tWmNVUW5ZeHBYWXZpeVl4?=
 =?utf-8?B?eGk3aEFmTFdkSGs3eG9BMkdYZEk0RDJHM0EwUmZQV0t5RzRHTFUxelFOaUdM?=
 =?utf-8?B?Z2ZJeWJFeDNqWWtSS2pOazRKZktlK2lGRWpwcU5BRDhoNEVOOUdJdUZxVTFq?=
 =?utf-8?B?T1QzVDdWdlpxajU0a1pqOExGZjBoNkk0Uk9WOThHcmJUdnh2VkJrdERjVUE1?=
 =?utf-8?B?SHJxejRMUFhDZkVrdzdHVnZVL1puam0yQi9iM2JocWluTVhWTTZMWTRlcUM2?=
 =?utf-8?B?Vkl3Rk1oMVZDT09jMktHM2lWSjJoUG82U09tSm1sdFJITFJrWmxwYURLaUpp?=
 =?utf-8?B?VFhESzdXckVCSXBmVVJWNkhOekRUR09IaHdzQUgvSzVzNGxUWXowV1Q1WmFO?=
 =?utf-8?B?WXJjTUNyZGdvZktPMStOYklCSlNvdXMzSGV6SytVWHNib1VwSUFudXdIcjFM?=
 =?utf-8?B?VjQ3SmwzdXE0ckxUbDc4bEFTSFdXU0NyS0ZMbkM2MWp5UXJ1OWZUNVdvN1dq?=
 =?utf-8?B?OHZWZ2ZrZmQ0UVR5T21BNUx0TjV5TmlkbFhFMzBJVXl6M1g3UUx3UFdGTjhN?=
 =?utf-8?B?TEZZQkpiZWk1ODBBY2Vxd0xxMkN1aDhDTytvOWR6NGJCYVZuOERMT0J2RVJO?=
 =?utf-8?B?U2tzYVBxTkI1U3JGa08zRE9zVEt0Yk5QMHNCclhJVVNuMWxDUmZ6ZlhXazhy?=
 =?utf-8?B?WEdPdHRWeTZ5dzRVNUxnMzN1KzJIU1BLdkxiMzBmN0VyM3p0TXVkdUxnVlBh?=
 =?utf-8?B?R3RiQTl1OWdCSlNObklRdGt0QmphUzdBUHZ6Rldpd3FyNHRvV2dNUm1BcU1m?=
 =?utf-8?B?NTBSWVVSaFcyMTErVStIZ0kvNy85RENaK2h0NkZRWlVwNVA4UVBLTHJjM1U4?=
 =?utf-8?B?amJvOEppMWhONTlYZ0E0blhJWlVjazl5UzlXV2d5QWljdTBhOWFkQ21KWmVL?=
 =?utf-8?B?ZTBDajNJc1g3RHRUZ053dUI0U212eDNkSUNJWjRTU1ltaXE3eFV0OEU2TFZH?=
 =?utf-8?B?aGR4Q1QrNHJVNFhIbGp0aTVWc3RYM1FmdGVyeVlSMitPYWZ2TDRHMUVSSDJv?=
 =?utf-8?B?YTRxV2JOMXhKazhXTTM4MGR6NytvK2lDK3Eyc21FN09MbHlGQjNsSHVrQkxV?=
 =?utf-8?B?enZsSkdwZzkwTnNsZU5xREVNRUtjbmFUMjhqdUhmOFMwelJ2bmIwcSs5Rmdv?=
 =?utf-8?B?M2JxV1RJVkVxYjNpK0RNSmNZTFJTM2xlT3NCZXk5MVhrT1NILzZ4K1FwRkh6?=
 =?utf-8?B?ditwK09WYkNzQkFmN2dUbjZ1V25LTHh2WnVYbDEyTFE4NThxdXZXY3YzdHR0?=
 =?utf-8?B?cWdaMU9EcGNnenM2d2ROM2lwOURtNGMrZUp5OGpUSmgrd1R3bFVQeGFFeXpo?=
 =?utf-8?B?MFNMQ1RvSm9VYWEvbXc2WHJ6dDcyM2JKRG03VkwvMFJQVmtKd1BZL2VWT3Bx?=
 =?utf-8?B?dkZ6bDUrc2ZLc2h1d0hKb2ppSnE1TDZhZm1kZ1hQRkt6Tm1RTUQ0bHJaLzNT?=
 =?utf-8?B?VklrRi92NFpTclpMbjlBVmpiSXB5SVBkWFAzTzdVNUk5b2lsRWNaWmY0UWJY?=
 =?utf-8?B?K2ljV0NZa3FFOXRuL3greXRBeFFEaTk1WVNwVHJrY1pKYzZLL09rVnR2QjEx?=
 =?utf-8?B?OEYwOS8vM1FqVDlTK25sM0NRaGFjUVJ3aGNtT1A1NTJUald4N0VDVEN4dWdq?=
 =?utf-8?B?cTdrWDRBUjl2d2VNamdlZXdvWmcwY216Uy9GVEh6VllwRllUc1JjUVA0aHRO?=
 =?utf-8?B?bDFBek5jY2F2YTNjZHdiMW91VkZNSTRWd1o0cGk3elRvV3hYZ2ltNGhSSnR5?=
 =?utf-8?B?RG4yRmVHbk5XaGJ2RUZ1ZE9VQkxkWGFMZy91VVoxeUZraVRGS0FZc2oxUmc3?=
 =?utf-8?B?M3I2Vm9HYi91czlTdklUWEw2Y09zYVhWTGdXMkJqNVZveUM3K1N5U01SWFJX?=
 =?utf-8?B?ZlUxTkM4SFZJZTNuKzJieGJmZTlNbTRkdVdBMWNEeGFJbXhiT1lNWDV3bUFT?=
 =?utf-8?B?UjhzUEpwQlYzcXNBUEZSNXFKZDhTN1BCVm5nbUJUZGwyRmtkS1cwc1MxMFpo?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e92f71a-be03-427a-57e5-08dc01c147be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 01:08:02.6327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPqqG3QUb2nR4lyPh8yWZjM/cuX0mEL8AP0WeXsQ6g5tfnFbm+LA2i8ct9UGiAJb9Pn7rnF6jcf5tgcdJcKdrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-OriginatorOrg: intel.com


>>>>
>>>> https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
>>>> https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576
>>>
>>> It explains the problem. The madvise() does have some extra overhead
>>> for handling THP (splitting pmd, deferred split queue, etc).
>>>
>>>>
>>>> Another thing is whether it's worthy to make stack use THP? It may be
>>>> useful for some apps which need large stack size?
>>>
>>> Kernel actually doesn't apply THP to stack (see
>>> vma_is_temporary_stack()). But kernel can't know whether the VMA is
>>> stack or not by checking VM_GROWSDOWN | VM_GROWSUP flags. So if glibc
>>> doesn't set the proper flags to tell kernel the area is stack, kernel
>>> just treats it as normal anonymous area. So glibc should set up stack
>>> properly IMHO.
>>
>> If I read the code correctly, nptl allocates stack by the below code:
>>
>> mem = __mmap (NULL, size, (guardsize == 0) ? prot : PROT_NONE,
>>                          MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
>>
>> See 
>> https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L563
>>
>> The MAP_STACK is used, but it is a no-op on Linux. So the alternative
>> is to make MAP_STACK useful on Linux instead of changing glibc. But
>> the blast radius seems much wider.
> Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
> filter out of the MAP_STACK mapping based on this patch. The regression
> in stress-ng.pthread was gone. I suppose this is kind of safe because
> the madvise call is only applied to glibc allocated stack.

The patch I tested against stress-ng.pthread:

diff --git a/mm/mmap.c b/mm/mmap.c
index b78e83d351d2..1fd510aef82e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1829,7 +1829,8 @@ get_unmapped_area(struct file *file, unsigned long 
addr, unsigned long len,
                  */
                 pgoff = 0;
                 get_area = shmem_get_unmapped_area;
-       } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
+       } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
+                               !(flags & MAP_STACK)) {
                 /* Ensures that larger anonymous mappings are THP 
aligned. */
                 get_area = thp_get_unmapped_area;
         }


> 
> 
> But what I am not sure was whether it's worthy to do such kind of change
> as the regression only is seen obviously in micro-benchmark. No evidence
> showed the other regressionsin this report is related with madvise. At
> least from the perf statstics. Need to check more on stream/ramspeed. 
> Thanks.
> 
> 
> Regards
> Yin, Fengwei
> 
>>
>>>
>>>>
>>>>
>>>> Regards
>>>> Yin, Fengwei
