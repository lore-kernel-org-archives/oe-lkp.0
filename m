Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993351BDC0
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTjjNUmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703061274; x=1734597274;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Pue3kPwDAex0PfAFOe1uaWa4VqYm3OObzphTSbU3G4=;
  b=bTjjNUmyXlgo6jU+d8KtcVEh1zq5iS9iSGV42ienqGylIWmRtH8HE2oa
   XPoUAEKQ4YNGudrDf6BzVkDYDg0gfDhMITAp3ZAAqCLHILJG9nclb+s3n
   pKV/DX+F5T0467ijzrPPyY3YuG0JneVAE1bvp4P0nZ7uy4BKeoB2QLnVV
   vwG87Kk9APCSz2YViy5EGNuGYSmtft3rDehyJv+mrBdeu2+ugU7aw0i23
   VjIGoPiEyznfkFNjjA/tgYXTmeHEHZoL8Mv2Ccc65y/GeJihZuStIUWKW
   HSme0U3EPDm1XTWW79co0565nQqLPaHITohud6jwBG6Oo+Y+1LIuikXRx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375938121"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="375938121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 00:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="24498769"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2023 00:34:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 00:34:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 00:34:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 00:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hxwlt6cS4gW9JiuJJpYmVBtqsR9XJWe6XZWSjzKVRJc8LKIraWk2YS/AMhmdnHIA5ZXGVK8N2RkuOLC8VF/zz0Zxi7mD8MPmx6PkcWd2TXoyGBMIYp36AEFAYr+A+bfjrGPaYth3zo7d188hDGyFNpuwTOn8T6h3KM1nBkVIdh2hc75ErAQiGeQWFETaRgdBOKyBKREuzEzRJP3N4zXuSiwvqjoFf70dQhNeKxdxIYu+ZTLTjfhiannmQ9iWuRplcXFhI8O8EjCkOZO/v9jjY4Dsol5F616IVlS6qWNL0QwWsr3+NIxEd3jyTKe+V1zzxU8Up+XsNCQi2l411aoUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06cxWR9ahWuip8vOvuqKxgd2dBamOCkY0C2OKrV4FVg=;
 b=Lo82jStUbMEMM8SWBPmkgBsEQ0C363CNr5QaRtW6GsRpqpzkSLpDCzO2IFzPVp//23L5HZpnC6/iIh27LTa1t6PEehxLyqtjjzu/fEVRBxos3YtRul7twFQgo5/xy1aZdCqgUdZlE511SHCD0ZyPQk2xMZ1/vhoq/5fbWmc/ywq1sp/wDwY5rpHS8ODPhyxObO/K+vA3ZD2TtU2DL6dRTVmOF8/mSJBevMg3zvmeuqdo2SBZtTe9hWAUz8o/eo4J74nEz50e/Pz+sVPz1/fYx6T1bgrUXWtQ80tKfTNKVlncgGpbAxZixAOP+Ph012jpeRkEHiPZqffucoihbFgebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 08:34:29 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 08:34:29 +0000
Message-ID: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
Date: Wed, 20 Dec 2023 16:29:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Content-Language: en-US
To: Yang Shi <shy828301@gmail.com>, kernel test robot <oliver.sang@intel.com>
CC: Rik van Riel <riel@surriel.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, Linux Memory Management List <linux-mm@kvack.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
	Christopher Lameter <cl@linux.com>, <ying.huang@intel.com>,
	<feng.tang@intel.com>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
From: Yin Fengwei <fengwei.yin@intel.com>
In-Reply-To: <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c92ce7a-e88b-4014-03cc-08dc01367b71
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nG/N3geN27fbtOPjuKrnsoqwgsRooP+m2lZaCySNqk9V5Z41iDfB6Xbs76lTQSY6RLICnLzxMfVfJqJi4nNTjV9G/dmJ+Q3JHj+W/bfxcyw0blRfaBkgwdM2OaGKRh06DM8/o2BsHXpwfgIgzOw7P4zEtsNuNUtXsqkSnwkdG5LMRlnPzl2heRoJivLW/mq96XeMMkdxV41d5rDZSNqhMDxzX74DJB8DdlxGve00OQx2/Xqx3h8O5vQeTu87v8dHaDlG9w3+fFOPrvBlamG3bXzGG9teaoJILbWppnx9yWjKStECTE5/7GU5tDc4m8TBzzlRIenL31acsIwFpbCr7qHP8OQzMrICO18epXhqfNmU5waXWsiGEB32N5FGODXUv7pzujVf2dmdUnnpOssCxv23YftAvHt0aAT80WecNDWC874sG3JNC0lwPJypXQHhyRbYBdM4qA4mDncImXBVnbWYb3k4bm5kRIKbAXc+xJzaG+d1nI7ZeDezJXhkcIB8kQuJUYMopkknAgtaxDhiM+NKcAXUKV3OxBlRWxYSG7dmh2jZrFD5Y2WfYprq/4FEspcomvWFXi2zU0bgaNgDEXNH80j4B6D/L/AjNYsvBG51VAQ7c58rCYMBwJIs/jk3fyHpu7bLBGWFA5vCqCSaoi/ZKDj/rrnofO2eFBICNEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(316002)(6636002)(6486002)(30864003)(6666004)(53546011)(2906002)(26005)(54906003)(66556008)(66946007)(110136005)(66476007)(6512007)(4326008)(2616005)(6506007)(478600001)(83380400001)(107886003)(8676002)(86362001)(8936002)(31696002)(5660300002)(38100700002)(966005)(36756003)(41300700001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWUycjlVMXNkOHhVeHRuOWJXK3YxcWFmU2lRMTBIbURVTTJocENxT0pQcHFP?=
 =?utf-8?B?OHl2MmFiRHlzRjBFZmd3anNDVk5FR2VZVW9MMXRGSDBjY2JacXZNeFRPMmFs?=
 =?utf-8?B?dmYzQ0VhbENUTndxK1RqRDBQZTd3a2pRamlxT1A2NlNtUy9QeFpwNFF6T3NR?=
 =?utf-8?B?Z2poUEp2UldWcUk4MlptcmM4QkZRS014Z2kwRkgrUHZlNHpYUkVOR1BEZHd3?=
 =?utf-8?B?QTV0R0VRTDROV1BvbEorUmVCUGR2VGUrMVBkWXN3K3FZUmllMzhmMGhYMzhB?=
 =?utf-8?B?dVIvSTdwUnVPY0w5NVBoYXVyVVd3RWtqT2FRdEd0eGdFelpZbVlBczJFT3o0?=
 =?utf-8?B?cUFRc0hyNHZlQkFjbmZ4SE5acjlDT1FXcG4raUpma25aNHlBbmxqV0ZNUUxX?=
 =?utf-8?B?S0QxclhEWUlUVVVDRU93MlhJMmYyNmljazcxSUFJNVNpQ1dyMzh4U1FFcEw0?=
 =?utf-8?B?Q3ZJazNBYm1aVmNYWFZscWw1aEZ1R2UzWFNxUUNZYUsyTmMyQ0F6QUNXT2FU?=
 =?utf-8?B?bnVKZ2wwZlVMQUJqYzlFUVZxQWpTQ000L1cvVkhDZHY1MHRmMzYzOUIzOFEy?=
 =?utf-8?B?NE81K1R5ZTVmaHI0VnhDNHdieVBpTzVOb1dXRGlQMGp3TGdCbjQxcVd0N2dC?=
 =?utf-8?B?YmhIRVkxS0ZEaTNia2NMRit1U2JtY0dXMDlVY0MxTDdJZEp5U1AraEdZelBX?=
 =?utf-8?B?aGRCWXNVcnJiRm5DSXFHSm5OWk55KzcrV1FDdWFjSjBmSHo2YWNIbkFkcTRU?=
 =?utf-8?B?eFluUlRxMmdyZCtSS2Q4V2xKc3ZYeDlFN21wdkZYRVYrc3pLdlBYZERPcElQ?=
 =?utf-8?B?dUNDeFI2YmozYnFpYWdCTGxLTDhmb1drYi9BVzJPMi9mRVFwRXhsNEpuNS9T?=
 =?utf-8?B?MGVNWC9pcDIyNjVqdnB2bjNCRHVlTW8zWi9wNlRHZDZLS3J6WDRETFhEcWZB?=
 =?utf-8?B?aU9MRlFsWjhEczRaRVJtek1zK3BDSWkwSWJsZkRIL25vWjJidktyelRraTBq?=
 =?utf-8?B?WFZ1RFpFTU9DRlhRNlN5ejJMMnZmM2packY3OGNrMndWVnRudFlQbVhTMGFn?=
 =?utf-8?B?V0VONllnSlovMUJweFZzSm91djNadHExdStsaitzcG5yYm5mWkZaQkxTNWQy?=
 =?utf-8?B?cUlGbnU1M1VLRmtmWTkyU2J4dW9haUJWNndDM2h0TkxhT1V5OUJSdzZMZGo2?=
 =?utf-8?B?WUtVaVZVZUlrUVA1NnpqcGx1TzhMZUhoL3l5ZG5OeWZ5SXBWdlZvcU5wUGQ5?=
 =?utf-8?B?c05GZTEwS3hDUHZ1clhCRXl5ZVN4R1BJZk9SbExTSkJsZDQ0OTIrdTR5L0tw?=
 =?utf-8?B?aVVQejJxdVoxVk5kVjJOV1c2alQ5WTZQOHJIRk55dlFFTjZKS1FrTzRCVDBF?=
 =?utf-8?B?YVBPV1U2L3RJRHBsSXdtSno4MlhEQ294RUpMekJPa2FjWmNsY0tIeS9pZmdN?=
 =?utf-8?B?UTA0SmFDUVZrdXVSY0c2MnVnbkZlQ0xWV2tNT25idkFpZXhMOWVKZmpYcGhp?=
 =?utf-8?B?S0RMeXh1UjRFZG96WGo2c2pWVWlYaU9kZjRSK2dsOVA5ZjlEa08vNVc5b0R2?=
 =?utf-8?B?cG1LbVh0dUF4VCtKcU9jMjR2UXNKRVdmQ2hRRG5Rc0hhdHhCb0V5OGxkNGVF?=
 =?utf-8?B?aUhxUVFwZFAzMUN3V2ZOZnRhZmtocCtRVEFHWGcwL0FwUi9iZFZpRXFjdTc2?=
 =?utf-8?B?SCtTWXh3WVMvT2FhRWZGT1NIZ1VBNktGcG5vRW8yMGZiRVZmb2hBR1RpeDkx?=
 =?utf-8?B?cUxDVWpBcFFBaG52NVo0TWYvUFRBeVduVU9YWG1jcXVtSEN0WkEwSVduZFFB?=
 =?utf-8?B?dUh4Z2pTV29VQ0VlTTRFNmFDSEFwMkk2TzkzYWsrM0JzT0tRYlE0TXFGVjFE?=
 =?utf-8?B?VEtpdWlkUzk4MURWYlJ1WndyUHMwVHVPck1UOHFHK09IZXJaUHMxMlFCTHpM?=
 =?utf-8?B?RkM3VzRVWSt2M0JDYmV2aTZLWXVYTlozSFZmTEJzTSsyYjNHZG5iVUVPNGhw?=
 =?utf-8?B?M016K0NZV2FFRmJNc1RVdUNHcDRpRDZVOURvTWV2alBTckFNVC9XV1hnaXZx?=
 =?utf-8?B?am1VV1gxSTJmWjNpWncrMGZQWUhSZCsySkt0YmZPL250Mkh0a2MzQkJhUHNM?=
 =?utf-8?Q?gpcbuS7wGtub95fBF+xl48GAP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c92ce7a-e88b-4014-03cc-08dc01367b71
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 08:34:29.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QrExchWcjRHIfdQ4kVwkDDJyZh9mn8rx/RPDgWQPnukfQB7bOc3U96jxcQen4cQYxfEJ5JkFJviwSxZndmeAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
X-OriginatorOrg: intel.com



On 2023/12/20 13:27, Yang Shi wrote:
> On Tue, Dec 19, 2023 at 7:41 AM kernel test robot <oliver.sang@intel.com> wrote:
>>
>>
>>
>> Hello,
>>
>> for this commit, we reported
>> "[mm]  96db82a66d:  will-it-scale.per_process_ops -95.3% regression"
>> in Aug, 2022 when it's in linux-next/master
>> https://lore.kernel.org/all/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020/
>>
>> later, we reported
>> "[mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression"
>> in Oct, 2022 when it's in linus/master
>> https://lore.kernel.org/all/202210181535.7144dd15-yujie.liu@intel.com/
>>
>> and the commit was reverted finally by
>> commit 0ba09b1733878afe838fe35c310715fda3d46428
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Sun Dec 4 12:51:59 2022 -0800
>>
>> now we noticed it goes into linux-next/master again.
>>
>> we are not sure if there is an agreement that the benefit of this commit
>> has already overweight performance drop in some mirco benchmark.
>>
>> we also noticed from https://lore.kernel.org/all/20231214223423.1133074-1-yang@os.amperecomputing.com/
>> that
>> "This patch was applied to v6.1, but was reverted due to a regression
>> report.  However it turned out the regression was not due to this patch.
>> I ping'ed Andrew to reapply this patch, Andrew may forget it.  This
>> patch helps promote THP, so I rebased it onto the latest mm-unstable."
> 
> IIRC, Huang Ying's analysis showed the regression for will-it-scale
> micro benchmark is fine, it was actually reverted due to kernel build
> regression with LLVM reported by Nathan Chancellor. Then the
> regression was resolved by commit
> 81e506bec9be1eceaf5a2c654e28ba5176ef48d8 ("mm/thp: check and bail out
> if page in deferred queue already"). And this patch did improve kernel
> build with GCC by ~3% if I remember correctly.
> 
>>
>> however, unfortunately, in our latest tests, we still observed below regression
>> upon this commit. just FYI.
>>
>>
>>
>> kernel test robot noticed a -84.3% regression of stress-ng.pthread.ops_per_sec on:
> 
> Interesting, wasn't the same regression seen last time? And I'm a
> little bit confused about how pthread got regressed. I didn't see the
> pthread benchmark do any intensive memory alloc/free operations. Do
> the pthread APIs do any intensive memory operations? I saw the
> benchmark does allocate memory for thread stack, but it should be just
> 8K per thread, so it should not trigger what this patch does. With
> 1024 threads, the thread stacks may get merged into one single VMA (8M
> total), but it may do so even though the patch is not applied.
stress-ng.pthread test code is strange here:

https://github.com/ColinIanKing/stress-ng/blob/master/stress-pthread.c#L573

Even it allocates its own stack, but that attr is not passed
to pthread_create. So it's still glibc to allocate stack for
pthread which is 8M size. This is why this patch can impact
the stress-ng.pthread testing.


My understanding is this is different regression (if it's a valid
regression). The previous hotspot was in:
    deferred_split_huge_page
       deferred_split_huge_page
          deferred_split_huge_page
             spin_lock

while this time, the hotspot is in (pmd_lock from do_madvise I suppose):
    - 55.02% zap_pmd_range.isra.0
       - 53.42% __split_huge_pmd
          - 51.74% _raw_spin_lock
             - 51.73% native_queued_spin_lock_slowpath
                + 3.03% asm_sysvec_call_function
          - 1.67% __split_huge_pmd_locked
             - 0.87% pmdp_invalidate
                + 0.86% flush_tlb_mm_range
       - 1.60% zap_pte_range
          - 1.04% page_remove_rmap
               0.55% __mod_lruvec_page_state


> 
>>
>>
>> commit: 1111d46b5cbad57486e7a3fab75888accac2f072 ("mm: align larger anonymous mappings on THP boundaries")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> testcase: stress-ng
>> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
>> parameters:
>>
>>          nr_threads: 1
>>          disk: 1HDD
>>          testtime: 60s
>>          fs: ext4
>>          class: os
>>          test: pthread
>>          cpufreq_governor: performance
>>
>>
>> In addition to that, the commit also has significant impact on the following tests:
>>
>> +------------------+-----------------------------------------------------------------------------------------------+
>> | testcase: change | stream: stream.triad_bandwidth_MBps -12.1% regression                                         |
>> | test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory   |
>> | test parameters  | array_size=50000000                                                                           |
>> |                  | cpufreq_governor=performance                                                                  |
>> |                  | iterations=10x                                                                                |
>> |                  | loop=100                                                                                      |
>> |                  | nr_threads=25%                                                                                |
>> |                  | omp=true                                                                                      |
>> +------------------+-----------------------------------------------------------------------------------------------+
>> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.Integer.mb_s -3.5% regression       |
>> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
>> | test parameters  | cpufreq_governor=performance                                                                  |
>> |                  | option_a=Average                                                                              |
>> |                  | option_b=Integer                                                                              |
>> |                  | test=ramspeed-1.4.3                                                                           |
>> +------------------+-----------------------------------------------------------------------------------------------+
>> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s -3.0% regression |
>> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
>> | test parameters  | cpufreq_governor=performance                                                                  |
>> |                  | option_a=Average                                                                              |
>> |                  | option_b=Floating Point                                                                       |
>> |                  | test=ramspeed-1.4.3                                                                           |
>> +------------------+-----------------------------------------------------------------------------------------------+
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202312192310.56367035-oliver.sang@intel.com
>>
>>
>> Details are as below:
>> -------------------------------------------------------------------------------------------------->
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20231219/202312192310.56367035-oliver.sang@intel.com
>>
>> =========================================================================================
>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>>    os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/pthread/stress-ng/60s
>>
>> commit:
>>    30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>>    1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>>
>> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>    13405796           -65.5%    4620124        cpuidle..usage
>>        8.00            +8.2%       8.66 ą  2%  iostat.cpu.system
>>        1.61           -60.6%       0.63        iostat.cpu.user
>>      597.50 ą 14%     -64.3%     213.50 ą 14%  perf-c2c.DRAM.local
>>        1882 ą 14%     -74.7%     476.83 ą  7%  perf-c2c.HITM.local
>>     3768436           -12.9%    3283395        vmstat.memory.cache
>>      355105           -75.7%      86344 ą  3%  vmstat.system.cs
>>      385435           -20.7%     305714 ą  3%  vmstat.system.in
>>        1.13            -0.2        0.88        mpstat.cpu.all.irq%
>>        0.29            -0.2        0.10 ą  2%  mpstat.cpu.all.soft%
>>        6.76 ą  2%      +1.1        7.88 ą  2%  mpstat.cpu.all.sys%
>>        1.62            -1.0        0.62 ą  2%  mpstat.cpu.all.usr%
>>     2234397           -84.3%     350161 ą  5%  stress-ng.pthread.ops
>>       37237           -84.3%       5834 ą  5%  stress-ng.pthread.ops_per_sec
>>      294706 ą  2%     -68.0%      94191 ą  6%  stress-ng.time.involuntary_context_switches
>>       41442 ą  2%   +5023.4%    2123284        stress-ng.time.maximum_resident_set_size
>>     4466457           -83.9%     717053 ą  5%  stress-ng.time.minor_page_faults
> 
> The larger RSS and fewer page faults are expected.
> 
>>      243.33           +13.5%     276.17 ą  3%  stress-ng.time.percent_of_cpu_this_job_got
>>      131.64           +27.7%     168.11 ą  3%  stress-ng.time.system_time
>>       19.73           -82.1%       3.53 ą  4%  stress-ng.time.user_time
> 
> Much less user time. And it seems to match the drop of the pthread metric.
> 
>>     7715609           -80.2%    1530125 ą  4%  stress-ng.time.voluntary_context_switches
>>       76728           -80.8%      14724 ą  4%  perf-stat.i.minor-faults
>>     5600408           -61.4%    2160997 ą  5%  perf-stat.i.node-loads
>>     8873996           +52.1%   13499744 ą  5%  perf-stat.i.node-stores
>>      112409           -81.9%      20305 ą  4%  perf-stat.i.page-faults
>>        2.55           +89.6%       4.83        perf-stat.overall.MPKI
> 
> Much more TLB misses.
> 
>>        1.51            -0.4        1.13        perf-stat.overall.branch-miss-rate%
>>       19.26           +24.5       43.71        perf-stat.overall.cache-miss-rate%
>>        1.70           +56.4%       2.65        perf-stat.overall.cpi
>>      665.84           -17.5%     549.51 ą  2%  perf-stat.overall.cycles-between-cache-misses
>>        0.12 ą  4%      -0.1        0.04        perf-stat.overall.dTLB-load-miss-rate%
>>        0.08 ą  2%      -0.0        0.03        perf-stat.overall.dTLB-store-miss-rate%
>>       59.16            +0.9       60.04        perf-stat.overall.iTLB-load-miss-rate%
>>        1278           +86.1%       2379 ą  2%  perf-stat.overall.instructions-per-iTLB-miss
>>        0.59           -36.1%       0.38        perf-stat.overall.ipc
> 
> Worse IPC and CPI.
> 
>>   2.078e+09           -48.3%  1.074e+09 ą  4%  perf-stat.ps.branch-instructions
>>    31292687           -61.2%   12133349 ą  2%  perf-stat.ps.branch-misses
>>    26057291            -5.9%   24512034 ą  4%  perf-stat.ps.cache-misses
>>   1.353e+08           -58.6%   56072195 ą  4%  perf-stat.ps.cache-references
>>      365254           -75.8%      88464 ą  3%  perf-stat.ps.context-switches
>>   1.735e+10           -22.4%  1.346e+10 ą  2%  perf-stat.ps.cpu-cycles
>>       60838           -79.1%      12727 ą  6%  perf-stat.ps.cpu-migrations
>>     3056601 ą  4%     -81.5%     565354 ą  4%  perf-stat.ps.dTLB-load-misses
>>   2.636e+09           -50.7%    1.3e+09 ą  4%  perf-stat.ps.dTLB-loads
>>     1155253 ą  2%     -83.0%     196581 ą  5%  perf-stat.ps.dTLB-store-misses
>>   1.473e+09           -57.4%  6.268e+08 ą  3%  perf-stat.ps.dTLB-stores
>>     7997726           -73.3%    2131477 ą  3%  perf-stat.ps.iTLB-load-misses
>>     5521346           -74.3%    1418623 ą  2%  perf-stat.ps.iTLB-loads
>>   1.023e+10           -50.4%  5.073e+09 ą  4%  perf-stat.ps.instructions
>>       75671           -80.9%      14479 ą  4%  perf-stat.ps.minor-faults
>>     5549722           -61.4%    2141750 ą  4%  perf-stat.ps.node-loads
>>     8769156           +51.6%   13296579 ą  5%  perf-stat.ps.node-stores
>>      110795           -82.0%      19977 ą  4%  perf-stat.ps.page-faults
>>   6.482e+11           -50.7%  3.197e+11 ą  4%  perf-stat.total.instructions
>>        0.00 ą 37%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
>>        0.01 ą 18%   +8373.1%       0.73 ą 49%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
>>        0.01 ą 16%   +4600.0%       0.38 ą 24%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
> 
> More time spent in madvise and munmap. but I'm not sure whether this
> is caused by tearing down the address space when exiting the test. If
> so it should not count in the regression.
It's not for the whole address space tearing down. It's for pthread
stack tearing down when pthread exit (can be treated as address space
tearing down? I suppose so).

https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576

Another thing is whether it's worthy to make stack use THP? It may be
useful for some apps which need large stack size?


Regards
Yin, Fengwei
