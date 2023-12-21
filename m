Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75198F52
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3HcFH+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703134712; x=1734670712;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sP9ypIPsIE7p1OHcLQrTQ63JLCaxAq7Pm1/rlliwTUE=;
  b=c3HcFH+24pIDfzZ2b+1zeXSRxBi2rX7sXJY9Hag8km1QOSOezPlfokKz
   EzVnS33x9DRbbTc3dF8N+3641fAXN+xj/uy4SLmpsGcTfN4U/5Xprg2J3
   739d6zweYzy8m0JcjSTJ0oi/R12XHLbWe3qCSCqHmKITKIO5YokwruZYX
   /7k+9GAuRn5DsfRfEB7vD0bUEpbQJQLt7X7ShOmj4FIYPrFS8rGRyfWsW
   QIVyksbVUtO0aoYkx1tO/Y3UmyWs+1jsmdoVMg9kWcEc0mPiVmpyT0z4B
   glZhXNtsq0rXBxthXINFw9mWwIV6G+0EYVoBBSf8bzNcFICotW+t18oyR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17476422"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="17476422"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 20:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023731356"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1023731356"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2023 20:58:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 20:58:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 20:58:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 20:58:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAxarA9zFjBPl7JgkBrun9duVNm/WbU/h6F0BLyEuAJTg1uST45XxXTCY7PEmfIldBMC3GUOOFEbZn4vyjs0GguYGeec0PU2F1eeSonTUp6MuJNWelr1nudnXEijS6IRa8FQUf0ncMiOHXu48Mi6Ip5Iouuwh61CvWYafd6c3NmscILb8c1Vqj2FvGPkwTivo2W2TScND4P3TXFvoEf9Lb4PEeRys4bKYIpKvtfzO3R1XfoPimO4bQpYYX3F9qHxbG4zNP38erE0oz6OsQLJU1WGDj1HmjPfPMeN0buUsVuGHwk4nCBHLJoY0ebNqy26+kRTdcEL8Bs5cOZb0x4MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri7GGoHlnuvdK2P1mPIreu/UlIMs8G9AiLKd+kB5RGg=;
 b=JCsC7XjlseL2Ui6cjexe8t1D9C0PyqaQ20Bb5IyxiotnJ6avzDWP7JyqDq5DDIoNUu+TBsH8KeKwgzBQoSulK3LdoAoFT27dMjBRzyBdXxmFTlz2jIbeg3PRgo3ZDMfeRU3KeGpiwzzkUk545/1CB50H8o72+NKDnttrjIiKOptRGF+R/8uzF+jubcJjeGyuuiiwM4dqVpdmXqGEHSN+orhV0doWIN+3wHyBCtn6YFvpjhMF5Qsxn2m763nWLUqTH7BMCUrnVanYyG6U3I+25w32F51F/w0+Ck9YjHFKNTGeyiT3IwGbB/KFQF+Zoz6tBtkPEN+NgvNnGmK41/fBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 04:58:26 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::3d83:82ce:9f3b:7e20%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 04:58:26 +0000
Message-ID: <fa447f0b-0ff2-49a3-8f4f-16677e9a726f@intel.com>
Date: Thu, 21 Dec 2023 12:58:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
To: Matthew Wilcox <willy@infradead.org>
CC: Yang Shi <shy828301@gmail.com>, kernel test robot <oliver.sang@intel.com>,
	Rik van Riel <riel@surriel.com>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Christopher Lameter <cl@linux.com>,
	<ying.huang@intel.com>, <feng.tang@intel.com>
References: <202312192310.56367035-oliver.sang@intel.com>
 <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <ZYPDwCcAjX+r+g6s@casper.infradead.org>
Content-Language: en-US
From: Yin Fengwei <fengwei.yin@intel.com>
In-Reply-To: <ZYPDwCcAjX+r+g6s@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: cda54113-a830-4663-395e-08dc01e17758
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYzZ5qaPF7mGDALF/2k1ZmAeu93807Hez7sqKVDdrZMpOs81BSr4KQNC3jvO9KXijE6Bau/txba6A8fzR845ntVL2M3mm33c2gwzTVPC8cJlUGM+yBOuO8014Sb/hg8dflVaC5n3LXh2iD0KwWnYufYuYo+vgouwSS2+7vL2mWHtJbZwo0JEeP+Ece1ciwLhUmbw4uEe6zizqYRB+AUuUSgH5/6ebOyxkXyjXtNNCAou3mZgxRtIIbxEtJ9glKGfG6pCNTvPcSLpLq8RNz707vc3CfgmHs1hx2GeTdocntVEERFSOzI6L8E+PtCYhqzR2CNnwJrLR7UiRwNecA3wrlEThNMgWYp10MnbsyJK0k2UmqDmKP7ccrmb2HjPLs/WHnqQ5ZMMgU3+PfD++svt3fzL+n+l2cjV9UWQXlIX32jJokiK2Jqwc1JW0b5Rs804OSc58NeClt1FaUUwFZi+TOw3M4js0V6I0KnzK8XUVuDxvM3QiO1yVGKL/bZy+vQN04EdJTDo22gFm1BTJ1uRDw4M4lvfbfnalz00N5a7AHkPuTUetgl/nXq/NUgpW38MmYs5NS2GdkZdHI+tOUr57wu5h/AwJPuz0+Qw9Rhw9NSkDLsYNrfERaImAi6cxrfHMHFuVbdnSbKvu0Zme6flCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82960400001)(41300700001)(86362001)(31696002)(8676002)(8936002)(4326008)(6916009)(66476007)(66556008)(66946007)(54906003)(316002)(4744005)(5660300002)(2906002)(478600001)(6486002)(6512007)(6506007)(36756003)(53546011)(6666004)(26005)(31686004)(107886003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NMSWZxeUM5YTZlSnVQUHM2cXlKWkNSUlowaHFEYTNuL2NpUThGRzZETEFv?=
 =?utf-8?B?OXBCMlpDTHVaVzhzNm9oV2gyZ25SdU1KamV1b29Hc0d6azQ3U2VmbVVQNGRz?=
 =?utf-8?B?a2MrTGNSSjhqdURUcllxa3VVWjVFZ0UzUm0vYVY0SHYyK3IxSlR5VkxmZW5U?=
 =?utf-8?B?TkRtV0NpWnZKMGtDbEpLVC8rN2JjNEJJdDhGdjM5ZUJjMkRlUjRzY285SEtM?=
 =?utf-8?B?b0tuLzlvUXZtQnV3Q1BNL3VFQTFMWFFPTnV1NWNJK2sxeFE4SEZab3EwU1Vm?=
 =?utf-8?B?U0hBZEJibUk3dVdNK1IrcUdwU240d25GOXcrc29TTDVHalFrK1VUTURVVEkx?=
 =?utf-8?B?OG9IQWUwYkt0aTZ2akw4UVIzOEdyemFjUEd0Z1FtNzlBL1dZbVVqN2pXR1RY?=
 =?utf-8?B?b3dhNHFSZ28vVVp4ZEdXL2tnbVpYWmFQUmVXeUd3L1FXT20xWkZNVGNYZUx3?=
 =?utf-8?B?d3F6RDd4MGsyWmNxVFp5UHVSSUJScjZWUkJCczFnMVp2VGd2S1hMZzZ4Wkhu?=
 =?utf-8?B?Q2ZTc1NVV3hQR2hXRnpHblgyc0RabzhMR21NYVgxdmZRRlFxVzBRUGtGeGxR?=
 =?utf-8?B?dTlhb2VFdFNUM1FkVFNCZy9rU21Vb0RWRXdUODhiN2o1NUVBTEtsMjhNU2Rq?=
 =?utf-8?B?TzQwWTllalZaME9EallQdG82SHh0TWdKMGwvaTcxVSs1MlB6Um96K2xLczRP?=
 =?utf-8?B?dTFhMHRUekcyNVY0Mi9wYlVsQlhBSTJ6bVk5SXNYM2h2MzNVOFVYbHFSQTdL?=
 =?utf-8?B?dDNNY1VHcSs0SzdOU1lEWERNdy9DVzdONGpGY2hLQjl3SDloS2lSVExoSFAx?=
 =?utf-8?B?ZVYrR0hrMUFXUUxqR0U2Q0tZY2RnU2hkemdzZzRQdlhITnlBSHBpQU14RUNF?=
 =?utf-8?B?NE9qcTNUZUx5Y3k5Z3dCQlh4dGQwdUFMZTRzckUydmw4QUFoSjhwdkRtS0F4?=
 =?utf-8?B?b2xoM29xdFpnOXhDdzl5ME9IRGlMU1JjZHNab2VIK3Mwc3RBcE40clJ5WkQy?=
 =?utf-8?B?SjFmVlRGakduSjEySEM0VHAvaENCOFAvalIvM0p3NFl4NGtQU1FyMmJZL0NS?=
 =?utf-8?B?b05KSjhYNURCdGovMWlpWDFpRHlLVFFMZ0dTWm01TWZ5cmJzVHN0Z2MvSXR5?=
 =?utf-8?B?L3RITk16OE9oOVhrOWRMUHNzbHhBWWVmVWpudXU1aDNkMWZja3hMMFh4cWtu?=
 =?utf-8?B?S2U4c290bUk2cldvbmFGUlZPOWFWL2lsdFZicm1lRXVHRUgzRlBzaUF3aExm?=
 =?utf-8?B?RG84ZWRxeXhCeFQ1OUZVY1hNQmZkVWp1V29NMVQxWlVKV3VHV0RrbHZKZ3Uz?=
 =?utf-8?B?RkFKb2F3L3Q3MjlCNE14SlhGS3F1QWxBTG9KU2pNSStraDRwaldMWXlwRjhx?=
 =?utf-8?B?aGl1b3VSaEtUcUFDVzRPMzRIdHdCV0hWU1A5VHdQU0VaSkNSblY4U0pob3Jr?=
 =?utf-8?B?b0JCb1Nzcm55a3lwRGRRaVdwZXV0UWNCNXRJNmwxL3E2RVhDc2V5Q2EvZW5U?=
 =?utf-8?B?NWJOSXQzd29yQzA2bWFTUHNhNGYzZG9uMUtlQTN0VDZpRUN6M0tRSnphZlMy?=
 =?utf-8?B?eWtjWHBiUUh4YWVsb1F5Vjd2WHh2RUpKSmIyR2xrdDlUMW5VcEJMYjhZSVcw?=
 =?utf-8?B?Qm5ENjhGNG94V2ExSkVlcWNSQURpVnRZVXpscHJ5SGNhNERKT2pmMXZrUC9y?=
 =?utf-8?B?QUVxVjZtZkYvSEQvaWFZUi9uWHVmT0RnK3JEWmNLb3ZHYkx0RkZ3MVRiVmg5?=
 =?utf-8?B?aEEzcDk2TFNiLzdXSjRBdjh1VXo5YWdJVEIvUXdkQWt1dzdXb0pNM0VvSVpa?=
 =?utf-8?B?SXlZeGJqMlBRbGwzTUlDNHRiTkJHRTkyUWdhd1Z3dGVBejN1YUN1ejR6UGNt?=
 =?utf-8?B?K1ZveXNFRWYwNllpVEg0K1Avd042TFFEd0xhL0xVZ2lyK2M5QW9zWnkyMkp5?=
 =?utf-8?B?cWVTRGZybzVRYTVDOGFHZkc5OHlJeWdpZEdOSkpsSXBIT2h2aDVwSUpLbnYr?=
 =?utf-8?B?dmwza0VpN1NXSERBendsWkFRTVRIaE16dVJ2dXRaMmw5aExwa0lhMXNUNzNS?=
 =?utf-8?B?T3ZZMktvS1MrT3IyRi9oM3NlcWZPTXVWbk9rSmg2bGNVVUpSUndXa01wOEkw?=
 =?utf-8?B?eFNxL3VuOG14YU1PRkplcndVaHFQSHNSZkprclN1ZUhxTTBvcGtCZGNqQ1ZP?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda54113-a830-4663-395e-08dc01e17758
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 04:58:26.4316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1IebV1shnFbhVB+OyHDaaxnkyNBY6NoEETZxgOVvcQdCIk9PqOGEteKFLWacvXcmY6GWJqEUm7j3VN/BdWlDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
X-OriginatorOrg: intel.com



On 2023/12/21 12:49, Matthew Wilcox wrote:
> On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
>> Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
>> filter out of the MAP_STACK mapping based on this patch. The regression
>> in stress-ng.pthread was gone. I suppose this is kind of safe because
>> the madvise call is only applied to glibc allocated stack.
>>
>>
>> But what I am not sure was whether it's worthy to do such kind of change
>> as the regression only is seen obviously in micro-benchmark. No evidence
>> showed the other regressionsin this report is related with madvise. At
>> least from the perf statstics. Need to check more on stream/ramspeed.
> 
> FWIW, we had a customer report a significant performance problem when
> inadvertently using 2MB pages for stacks.  They were able to avoid it by
> using 2044KiB sized stacks ...
Looks like related with this regression. So we may need to consider
avoiding THP for stack.


Regards
Yin, Fengwei

