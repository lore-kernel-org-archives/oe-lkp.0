Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BA7B3B5
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHNPhG9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703166010; x=1734702010;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5/BpvyKj6XQmwDRMdFW1m9XHqueRMpI3ae/MPt/7ZZA=;
  b=EHNPhG9mpEWrw68KtJ/fKALhfbw4UUujEwF+J0/F5VjKRUdJtn7vK1BD
   k0khbcXnuhuT7wN2RbKQrU/dX4bABS9c6N1A/oNj/zb+8/av2PkqTTzfp
   IkULPpsCLjqhrWxa3FA5ouM6klVhyFMvqMOlobtyJRZEkK3M8aaoUyaKa
   GU+0QV/zsf5xAVKajFuJHnUqcAlAtmLZSJhphcgt/sGK0oW42z2mbDTG3
   QQsYX/QUL2mOZAuLqXKT5yx5ROlXxwf+q8/CLuWY1/Py4w7LxNtuEqHJw
   EEHxcPoTW5ldAFesWO8Yco4SumdLBF/XQfR0P/lMFLX/vl9EuGukCUdHc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="462417601"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="462417601"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023862503"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1023862503"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Dec 2023 05:40:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 05:40:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 05:40:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 05:40:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 05:40:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN3e/XL3QrLAj3DujX/Jibdv/IlGmyuToBdXrUe9jW1opJT35g14R1Jq6kCM87Onjln64Mp7ynckCcc8mDm+sTNf0VCyl67CrCYi8HETREjpe+K8TXNUc2aU+78I3iII+Nz1AqcKTlfXmH8alPRqBpUk10fMQvc0xq1LFUc6BEkBOGxpKjNsgudWaaGV4tbeWIkNidj56fIk8i5NKi7P9bbUf3Bc7afnvpz1WvoGPsLvxtowHr2AJVjt0gJQisJbzANLoGvjllCcYyvPB+qyJVJTDB1nonh1KlD/MGEA5eIX8RtaTuXD/SnKLEtDmrkz+sDSF0GvqfrMWTrHh6A55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttrtcHMhvKLSDZiR+KefvqcD0I3HGJF/3IZmJ5cVMHM=;
 b=auBQQM+yGnHVueJ/rpnHaskZkgPq6DL8miu7q5pW+FLKLTv2E4SC+WLd78SWh4c0OjJBRuaOVdzhF4iQJNHpUNCZTznOh1mpsxHScjU2fmqY6srL3S+AdxDV/qjhNzUChnlkM7+RZI3Yjn+hexHvA6WSF2wLKylPMvRDADrSEJ7HkqohqIYbyn2hjQ6ww6E/ANZbmux/Bk8FnuQe2VW1ZOh4XkIi5NTvobUH92G4XbUBLCVyFEcAqZPWzUc9WV04uNWBTOnzJ/18UeOPe2X/DoDQyFgnghuNiqxjGLaPHJbJOt3EHTDmEW1ktxzDpu0yO1WBlaZs6XovPdhhP9xFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by MW3PR11MB4699.namprd11.prod.outlook.com (2603:10b6:303:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 13:40:05 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 13:40:05 +0000
Message-ID: <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
Date: Thu, 21 Dec 2023 21:39:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Content-Language: en-US
From: "Yin, Fengwei" <fengwei.yin@intel.com>
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
X-ClientProxiedBy: SG2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:3:18::15) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|MW3PR11MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 18314a02-7a81-49d0-4ad5-08dc022a56e4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWH8sDToZ1yxRtrQ0BFZHOrdJW3k4fGwLg/Qv9nlWGaHQFhjhs9S7c5pEkyb9RjtmIZGoWWxJLjN67Cq4DQwzDkT1fqRHX7oVP/sGL/Yp2Mdt+B9vOi2ske4U23qT0raQKHNNNgahz45d9Fk61g2bwhKf1D6b7m7W8O30uy331pVigYo+tMCYxYG/gp6TDm69ptRYXK2Nj6Strv5dxl/o54+pZ//01fqfeS9ZbHSdouZgZzsezplbKvsR8xkLrqv7Ns/5kaFluDMtqPVlka/eMgVcFvwFoenraHqvmZMGZpQTvUFpeUg5kylhyjKf4esNHgYGWs9+KaFbl80U0dV083DjNRjeG4C3gVEnbK2Nr/71x5hbbUBF21sB7fc3Rt+ya+zaFcb/TO3qbWCwt2IXAf3kqukP8zv00u4Azb013xCo7P5CWaaEBZKteubohK4EGf3AvKEfZnYS3uXeubdOMlCwQ5SWy4GCHYrJLV/VLogdIWp205yIAunXot6VYHwtdeonHBRKJq8RgU51tyxOtwMvvUJXKWU33Bk2vmhPo35lRiH+tM4fIoAgcSwKF+XYM5v8L78BluoyjFfZFLtEAieDQ3xXF6I7KhecoUehu0cpOLGeH5xk1u8L/JrtulgbmkzkVaMfFQPhZxIi63fog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82960400001)(41300700001)(86362001)(31696002)(8676002)(8936002)(83380400001)(4326008)(66476007)(66556008)(66946007)(6916009)(54906003)(316002)(5660300002)(2906002)(478600001)(6486002)(6512007)(6506007)(36756003)(53546011)(6666004)(26005)(107886003)(31686004)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFTU28wR251MUtvazJHclRDUld3V2dmUEMrV2ZNRGdkWmI4eENtaERvNHV1?=
 =?utf-8?B?NDhqQm05SzM2RDZDWE1LM1ZLQXYvaS9UcjRoaFdsTWtSRFRIZVhXWUdIYjJq?=
 =?utf-8?B?bWFGMnNFL3ZCSWl2VHZvMXlwMHVmQ0t5K2hXM09NbTVWRmFiYlNCTVNSRmY2?=
 =?utf-8?B?QUpYVU1JU1F4b2tzZTIwNytaaWgzZEJlT2E5UW9VNW1uUFMwUlNCZ0RublEx?=
 =?utf-8?B?NWlxVUQ2cFJpdXVuUHk2OEx6aU5kRU1teVYyRFBudy84M09nWGVGaUtydWNG?=
 =?utf-8?B?aTNGc0xzc2d0RjFNUFZMbldoc3YzRVc1SHFteWFVZ0tDaExJVzY2RCtYNU9O?=
 =?utf-8?B?NzRWYUpOOWVrUEtIWWZ1VG11Y1A0T2N4cTg2ZVBoNkNVTUNmb1NGeXo3MzJN?=
 =?utf-8?B?WlBOT0ZzWi9rN2dDVXNQRUg3blp0UWNHOUFMSk85N2d4MFhacnVhaWRPZFdk?=
 =?utf-8?B?R0Y1QkZ5OThRYWsxM2pUMXJ1aVlGOXp3d3MwZEVmbW9TVWQ2MTUzQnhteHhp?=
 =?utf-8?B?Y2FEWVRtVURTQjlvZTJkS2lwUDE5dlVTQlpEdzFmRTZVL2s4bUM2TzJXV0wz?=
 =?utf-8?B?Tzd5bkpwbjA3VGlwTkFySmtvbkdNUkwvOEtudWhoV2owNVZFcUpJemR1NzZj?=
 =?utf-8?B?UjFsOEw2anBOa3J1UG5uNFRiMktRcEEvZ2d3aTJ5OE9WVWpVY3cwYXk4Uk1i?=
 =?utf-8?B?c1oxZEZBYmNGVGVvL3JqK0U5cDdhTGNSUGhCSDMzSzNQQ2hrMnRMRmgzU2l0?=
 =?utf-8?B?ZXZjZm5md0dsalFJZUE0VXVNKzBuM2U2cGQvTVJjd2ZwWC9zcUNaNGhmU29X?=
 =?utf-8?B?cXlYRFh2TS80RCtldUlFKzB6QytPUzc4cmozb1ZoNnpDdGpQa2Y0b3ZhMkVs?=
 =?utf-8?B?Z09GYUFHZkxEZE1OTy83NFBDRk5WamVwV0dGSDVad2pZZkE0ZzB5MVJXcXEy?=
 =?utf-8?B?clBUbnV2UXoyQnZsQit6bDc3eEhFNVVtVHVEbzM1dkpHVzVkSGVXOVpNc0h3?=
 =?utf-8?B?eFlSaVdFMzVJN1phMS9Bb1NhZ1FaUUVuTjh2MEIwNXgyWngwVk1OMUVHbWtY?=
 =?utf-8?B?aWpHc2p6MmMvTllaSG9sWFd4Sk05QTFwckVPd3o0SENMelJRK3FTV0piOG9u?=
 =?utf-8?B?WWlaRFgyU1JCOGZIbmQ1MVB4YzJYeGF1TVhKUFNoVzBMbGRIUmRQcmZhbVJr?=
 =?utf-8?B?MmtQSnRrWnZkT3Z5OWV0aW0wU0EyekRpblFwL0tIVWdBSE5Fa1BVT21lV092?=
 =?utf-8?B?WndxVGdsSEFBNDZ2bkVpU3ZHdWprWWlZNXFiQzFSZE1SR2twbkFkZldTc050?=
 =?utf-8?B?TEFFcjh4TlpYK2pnZGNIMEk2YjZncHJ6NjdsRmhwRE96TGYvYms5cFJiOVZR?=
 =?utf-8?B?bGdtdE5lNE1rdlNDSnlmZm1KaXBsckplcUJmRzQyd0NBb1lrWDhsdU1tNjNO?=
 =?utf-8?B?ck5Bem1NSENNdUV2dU1nMHdiSWxYQTJSTVRkUWxYNk5UbWZDaUd0MmFlUlhI?=
 =?utf-8?B?eUZsODdYNHhzbVpTUHVoc3lEOFdaYk53MGh6ZFZGc0RRbkdiTGJEYmFISGFL?=
 =?utf-8?B?b2ZIbjZMS3dzN0ljdUhqWnF1bXMrbU4vcnpkSGdERHNjaHpWdGFlZkNPWGp0?=
 =?utf-8?B?VWFzMHpOZmNlc2JKbVhDc3pyQVQvMUZuclMrcHc0aFZJclVVNzhyUE9zK1Q3?=
 =?utf-8?B?NnJyRVd5MTVEYWRwY0pFdTJKcENoZERUYXNKZHFhcE9MSmdUYis4Zm5XZ3d5?=
 =?utf-8?B?TWE3MWhuemQ5OWVCSmVlcTNyM0lWQWJJK1B4cnZPaTdVVjJndmNPZ21VSFha?=
 =?utf-8?B?emtnTUhNVHNvOU5ySXU3WE92VU5RMjZ0VFp5M2Y1T1pDQkVQRHdvdkd2REhm?=
 =?utf-8?B?d2xEN2JFL0gzcEFzNWh4Z1JIcFdlSVlya3RMWDF0NzVhbmN3ZVRISndsMW1I?=
 =?utf-8?B?ZVBmQzY2akZzaUZ5ZW0vMmdqNmZEQ2dxS1YwdkhYemF3L29IbWZjMGxYTk9r?=
 =?utf-8?B?alQ0YlJtazhqcUxPV3pqU3lFZkw5bis2aEkxaXdHNTh5OWZ4MXQ4YW1EblZP?=
 =?utf-8?B?WVNUblFubi9EU2ZZbFVCME8vM2UyQmVXMENVcTFQQW5uWnorMjZCZldlS3Bu?=
 =?utf-8?Q?zvXxAKefatPvUPysb1a77VnNR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18314a02-7a81-49d0-4ad5-08dc022a56e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 13:40:05.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfKgKWwKCRCNeKd2UJ/uGGmELZEo1WPg4CZaEiR1TkKxDyMX7344Dmo/F1LhrQ89RI0PeTBrQUYUdejS8PQFsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
X-OriginatorOrg: intel.com



On 12/21/2023 8:58 AM, Yin Fengwei wrote:
> But what I am not sure was whether it's worthy to do such kind of change
> as the regression only is seen obviously in micro-benchmark. No evidence
> showed the other regressionsin this report is related with madvise. At
> least from the perf statstics. Need to check more on stream/ramspeed. 
> Thanks.

With debugging patch (filter out the stack mapping from THP aligned),
the result of stream can be restored to around 2%:

commit:
   30749e6fbb3d391a7939ac347e9612afe8c26e94
   1111d46b5cbad57486e7a3fab75888accac2f072
   89f60532d82b9ecd39303a74589f76e4758f176f  -> 1111d46b5cbad with 
debugging patch

30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 89f60532d82b9ecd39303a74589
---------------- --------------------------- ---------------------------
     350993           -15.6%     296081 ±  2%      -1.5%     345689 
   stream.add_bandwidth_MBps
     349830           -16.1%     293492 ±  2%      -2.3%     341860 ± 
2%  stream.add_bandwidth_MBps_harmonicMean
     333973           -20.5%     265439 ±  3%      -1.7%     328403 
   stream.copy_bandwidth_MBps
     332930           -21.7%     260548 ±  3%      -2.5%     324711 ± 
2%  stream.copy_bandwidth_MBps_harmonicMean
     302788           -16.2%     253817 ±  2%      -1.4%     298421 
   stream.scale_bandwidth_MBps
     302157           -17.1%     250577 ±  2%      -2.0%     296054 
   stream.scale_bandwidth_MBps_harmonicMean
     339047           -12.1%     298061            -1.4%     334206 
   stream.triad_bandwidth_MBps
     338186           -12.4%     296218            -2.0%     331469 
   stream.triad_bandwidth_MBps_harmonicMean


The regression of ramspeed is still there.


Regards
Yin, Fengwei
