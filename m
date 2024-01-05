Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CA2E627
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jan 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv9yHW/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704466358; x=1736002358;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pA4G4XzDe6K/vtoqOs4YCENJKe+xi5hIsrb+JshbMPY=;
  b=mv9yHW/607n3ZYNtD84uun+Fau3LMIX11/FvZb7wIDDH3KFnzsoLc4Ot
   5RAiMiQCGamqPiWy+p1JCa3TTqAaQGyvWO1uz1NyDJXsS7Tc7+2uahO3h
   MfFXtdQjAH31yQWPs32OfWmp8seF5gCp/jode3McQEWvd27+pR6Tt2fvV
   HvbkSumrWH0k55DL0M7C9HBIcSD/LINH0n/Id6NLnrrg0WzTX5/bsqKPe
   iO9Lp+fNwHwc0Ip9Lwhvy0dRwsATI9lxLMWWFIME4djXsLc/a+7PDjKvs
   6R9tp1CPw1kvOo4X0enATQ4fCft4e9lRfsYHg94f+fpZrssLOVfhxkX7u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4885748"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4885748"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 06:52:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="924236339"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="924236339"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jan 2024 06:52:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 06:52:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 06:52:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 06:52:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4gwSuXD4Fc7kK/HGwFbvA4wg3IQpzQfoXZ7fcIQYHouiXQCewKHGfUfx0BVjrpdd7f+1rIKF3U+PP7V42ym+t8gcMLCEq3wLQaVyxdBkdbbwkP4mOaENUeFJjXwq4fhD6Ar6OgqY+4IyYvCNHpniiNhz54U2b6otOt5aVZR7G8ytWX7BribMDtPDNAQjUl7jwfZxcGvuposVPVBgDjDGjAd5ZcAKqphXGWsmYEhFM+FQkeVRhjZ/3HGMGZqoDQ6joRf5A7+Mgpr4YyAy4cX0mcdJzSiVeZjZlat71TG9p3UwbUStCiBR/8rCv6QNYYuTdTssl1j1fvSHx930DiaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxvcoF8bF5C5soX7q/LPTe6EUHcaTI2TBcwr92sk5L0=;
 b=jaWmOQjB7QcT+IPUWc/IN3fXolrzPURsTehtFiRIc7LJyBurksq/KkpRNsz4/C92RQyJOdH21SEu1TF9po2oUIHDe/hhh4p+CBtqwW4G9sDPqIdJlM3TEd75r/v819zZIEUtjVZeQ4Qo0Rci3BZGJ7v+edEk3uzlZ+5DlNC0aunHBJM3evinLa8Xq0mozA4pfY+xWPH9lJcfIMK1eSTRimNFwdsrvCGAHOSFLGYbYd0osjLR/BvOawzJ8ebtmPjuF8vwb0qaCiWgQ5Xjsloa9/hLlY1C9b3x5XzgtDLiTAfpliYKhLCi6BMae4dyoTZTrV3onA5Ii1risgFZ763qnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 14:52:27 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 14:52:27 +0000
Message-ID: <6bf7037f-e1ad-453d-adb1-37be748a1364@intel.com>
Date: Fri, 5 Jan 2024 22:52:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Content-Language: en-US
To: Oliver Sang <oliver.sang@intel.com>, Yang Shi <shy828301@gmail.com>
CC: Rik van Riel <riel@surriel.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, Linux Memory Management List <linux-mm@kvack.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
	Christopher Lameter <cl@linux.com>, <ying.huang@intel.com>,
	<feng.tang@intel.com>
References: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
 <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
 <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
 <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com>
 <ZZZu1s5yAyFr0wtw@xsang-OptiPlex-9020> <ZZfL6APUYZ3VuUTv@xsang-OptiPlex-9020>
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <ZZfL6APUYZ3VuUTv@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 2931b3f0-a1d8-4bf1-4990-08dc0dfdef32
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKdJCRyRbvPGEmRHEDfiP6ku5jweWOKnxuxo2drcpRcKHTCs8ZEexWlTxMjZ5p23bqFT1wCERjD/PZ+8nTFnnKK1X3xk/i/eQ++AVpUTMUwc5V7u5Y2/0z7t6iNz+93H2bZbbty2v7ylBTuWhjKJa9QQt8SXWDtVjusll4FHnn8EBK4PpY9iEVLVigstWrnsUJmm9roeksZUj1KZznOVqK+ywUdDZ5KGhvY/RWDTeqOPThMv615D+wFaKNOKvj2z5wnjLtX9J8H6+TZaOKqnUOgNWrHCZrnq2Xj6A5Md9BPiX4Q/5I5iJD7bBO4z7MHEwxEPR4bLdewNApw+0yX93A0uwLgD9U9nO8chQYMnFBQ3rGUcrBymj5A9LAYN58eEDcv6z1GRwoliLj6YY0V9XYDPaBI1DLC1FucRCMghWHq+lg4NEehL+mcuyLsjZcIqOqgd2x4xxdwuoTPGZDeohI7UCJyGnxede8TKFTAvLyAOFxcQpEyrqRU0lIM4pqNeLUoyo4cbYsthd/19jd/8XSszudI7JPkpbuDNA4Nezk7IjuBDbqNm0cVw/fbJbYhkjIDhkvPQaOD2ROA62ZZ0NocJhzfYtoC2070J4izcgdNIA6qf6M/4WeWlbBM5WB1jhPBcDgZMRs97DclulR5clQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6486002)(2616005)(26005)(478600001)(53546011)(6512007)(6666004)(6506007)(83380400001)(66476007)(107886003)(41300700001)(2906002)(66946007)(54906003)(316002)(110136005)(4326008)(66556008)(8936002)(8676002)(5660300002)(38100700002)(36756003)(86362001)(31696002)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hYWDJaYjl2QUQrSU9xZDkxM09zMCtWNmlSYXN3TjVyZ001N1RMVHBMMlI1?=
 =?utf-8?B?WktycFBQYlF0KzlkWmtZd1M4UnF4Q1lHWERUTWM3NXo3Y0ZYV1dEZmtiTEJK?=
 =?utf-8?B?czYrbEtoNnFKNDM3TGs2OS9aS1ovSXhzVUdQTVhmcjBFWktJZ2pKZFF4QXpC?=
 =?utf-8?B?clkzbVRFTVRXRW9iU05tY0NIWUxPSmFSZFRueERoRmErY2ZsWm9WVEk0MGxX?=
 =?utf-8?B?MDc3U21mNW1wSjg0L0E3VkMzckd5R2ZWb0dyRlNhODFnSklOZkhyUGJrUHVC?=
 =?utf-8?B?OGFweWdGMTM5c3JwRlNiS2cxR0VZRnJoU3ZIRW1BUFZhYmwzOGpqTjF5cFdw?=
 =?utf-8?B?N25BeDdWRUpza1hHcndkTVVBU0RDRUVMdndjWlhUUHFORWNsMlZDSmtEV2sx?=
 =?utf-8?B?Q3RPVmwrMzJvRSsvU3d6bndHTkxSRFRmbUo0TytJVkZqYlZDSXlZcm1TMjJr?=
 =?utf-8?B?YUd1d1ppTXpPYmZ5UitiVlNXRmlaeUhHMkxZMkozUXYxdStwQ1BrK1pLYklw?=
 =?utf-8?B?YlQxbzl3RStYODFXbmdrdTBFL1Zac3NVTzF4a1JiTVJRV3ViakttTm5nRkc5?=
 =?utf-8?B?S3dNN1Fhc3dqTU44eXZOUS9Tb1p1VEFZU3ZCamcvL3ZrQnBicEo3ZEIxUHRt?=
 =?utf-8?B?TE5mV2t0UHF1UUlVWHFnVzRKdnNSMU94TzF0R2MyUXFkVjMrRVdHR2drd21U?=
 =?utf-8?B?SHkvUEpQZS9xdzZ0eEVFckNXZFNyRDJNRVIzME83azFoV0tYc3VBck5JVWN4?=
 =?utf-8?B?dHpsQ2JQREIyL3Rpb1h2Q1lJcmFrRTlCS250VXEwYkorYllBUE9QM0JoVTQr?=
 =?utf-8?B?SHJiVE9xQ3pMbDEyKzJGa0NMWmJGY29TTzRIVlg5K2czcW1sSGVzMjJnMzl3?=
 =?utf-8?B?WmpzZm1RSHlQZ2diVUZFUyt3KzBFeS9iYTBsQnVGTzIyUkJINmw1SmszckdC?=
 =?utf-8?B?YjZvczlkUFRySVR1M3U2alVySXZXMUNDLzBlUGMrMVExK2VYb3RkaEwrZWFn?=
 =?utf-8?B?Q1RKdDlTdzJIM29tNHpZY1NLVHpGYy9FUGNJbVdrZUdxNEpIbndlZU5oVnZW?=
 =?utf-8?B?aEZ1VFVFMzNHWUF2QUVMaGpwa1FjQU5UU2dDMEdBVUpUQnh5bGFKU3JTeVIy?=
 =?utf-8?B?WHAwcGJHR1MwTU9zc0FzclRSbDlmbzVGTlBXWmgvUlZBd01JSWZEaHV3Mm9h?=
 =?utf-8?B?dWFqOXl4YTJxWi82Z3ppSGNZakUwT2dRYXc3aU9SNzBUNW0vbWwwZG8xVzE5?=
 =?utf-8?B?WFYrb3IxREJqbm50NlNOR1JNbEs3SGI3YzlHZHFuQXNncXdVOGZPdjdDbHVX?=
 =?utf-8?B?ck9QSlhwa21iRk4zTHp6VHFtaGhIZVViL1R1bGhHeTVJNElsVlZnTlhDb1Bm?=
 =?utf-8?B?eFJmQmFHNHFuM05ZejJad2ZCcllXUDk1bE9IK1NEZGdUZ2Y0QXljRTVUc3Rt?=
 =?utf-8?B?VEUwZ3haK0FoMEc0K1dEcFpHSkZWRU1aR3c1NjczYmwrU3VnU0c2azRyVXc3?=
 =?utf-8?B?YzJGTnMvdjNqT2JHNTdXK2ZHcHpEbWphM0tiZFJGSmdvUnhPLzRKbEZKYzlC?=
 =?utf-8?B?aG0zaTdWU0pDR3c5RDlzcE1YR0FVa2FQZm1oMXlaSWZSWDE5NUVyODQwZ283?=
 =?utf-8?B?OVQ3Z1BLNjh4T2VMUXNaNHBGakM3WFJjanRZaFUyd25LR0oyazhDTC9rTWh2?=
 =?utf-8?B?YlNBekdsNUNtektVeUdQSEtZakVSeEEyT25JM1h5Qis4d0NoRE1ub3UrUU05?=
 =?utf-8?B?YUM1aWJzRWRUdlVMNXMwSzdyeFpxR1IyU2pncUpkR2x6cmU1N2VGTWRMMHgx?=
 =?utf-8?B?QWt5OHY4WGNzOThncUtmMkttSDhkUFhJaUtxeUZYS3I5MURJZWhVa0I3OFZm?=
 =?utf-8?B?MVpsT2M1d1JiM092MmVnWDBhZjdLRW5mOU1MZmREdlhHUG1wTzNDL2VNdmpw?=
 =?utf-8?B?bEFUdE1QQ2NGaEZydUVpQWhYOUs3bjNUTndGemZNMHlHNlFRRDQvcTd3WUw3?=
 =?utf-8?B?SVVQb2xzR3pKQ2QxNStKT1VlS2NybDR3a0xuRG1BZlJzS1lRMmhqMFdNMXNU?=
 =?utf-8?B?cHhFYld4NGxPditNRVVPRUpaK2cyQXhja2RyblRueHhoVzR2QklKNmhzeXJS?=
 =?utf-8?Q?33EVpKJu2uw1pLahIS5KChOos?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2931b3f0-a1d8-4bf1-4990-08dc0dfdef32
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 14:52:27.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfBSKRzVDCnG9FMQIRSAORau8m9aYHELLZGlV6GBFoJIMWp15XFCeBrLFCyGoFmmDPYPFPKRjH+HSvX5WRHhRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com



On 1/5/2024 5:29 PM, Oliver Sang wrote:
> hi, Yang Shi,
> 
> On Thu, Jan 04, 2024 at 04:39:50PM +0800, Oliver Sang wrote:
>> hi, Fengwei, hi, Yang Shi,
>>
>> On Thu, Jan 04, 2024 at 04:18:00PM +0800, Yin Fengwei wrote:
>>>
>>> On 2024/1/4 09:32, Yang Shi wrote:
>>
>> ...
>>
>>>> Can you please help test the below patch?
>>> I can't access the testing box now. Oliver will help to test your patch.
>>>
>>
>> since now the commit-id of
>>    'mm: align larger anonymous mappings on THP boundaries'
>> in linux-next/master is efa7df3e3bb5d
>> I applied the patch like below:
>>
>> * d8d7b1dae6f03 fix for 'mm: align larger anonymous mappings on THP boundaries' from Yang Shi
>> * efa7df3e3bb5d mm: align larger anonymous mappings on THP boundaries
>> * 1803d0c5ee1a3 mailmap: add an old address for Naoya Horiguchi
>>
>> our auto-bisect captured new efa7df3e3b as fbc for quite a number of regression
>> so far, I will test d8d7b1dae6f03 for all these tests. Thanks
>>
> 
> we got 12 regressions and 1 improvement results for efa7df3e3b so far.
> (4 regressions are just similar to what we reported for 1111d46b5c).
> by your patch, 6 of those regressions are fixed, others are not impacted.
> 
> below is a summary:
> 
> No.  testsuite       test                            status-on-efa7df3e3b  fix-by-d8d7b1dae6 ?
> ===  =========       ====                            ====================  ===================
> (1)  stress-ng       numa                            regression            NO
> (2)                  pthread                         regression            yes (on a Ice Lake server)
> (3)                  pthread                         regression            yes (on a Cascade Lake desktop)
> (4)  will-it-scale   malloc1                         regression            NO
> (5)                  page_fault1                     improvement           no (so still improvement)
> (6)  vm-scalability  anon-w-seq-mt                   regression            yes
> (7)  stream          nr_threads=25%                  regression            yes
> (8)                  nr_threads=50%                  regression            yes
> (9)  phoronix        osbench.CreateThreads           regression            yes (on a Cascade Lake server)
> (10)                 ramspeed.Add.Integer            regression            NO (and below 3, on a Coffee Lake desktop)
> (11)                 ramspeed.Average.FloatingPoint  regression            NO
> (12)                 ramspeed.Triad.Integer          regression            NO
> (13)                 ramspeed.Average.Integer        regression            NO

Hints on ramspeed just for your reference:
I did standalone ramspeed (not phoronix) testing on a IceLake 48C/96T +
192GB memory and didn't see the regressions on that testing box (The
testing box was retired at the end of last year and can't be accessed 
anymore).


Regards
Yin, Fengwei
