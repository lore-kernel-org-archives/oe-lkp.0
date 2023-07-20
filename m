Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F7182C0
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689862584; x=1721398584;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ymz10fFXQOWqUfrPe9mXcmmANJK74KD4vZAcvtzUa38=;
  b=MKmChfo7oafFZTdhqYwkBES0ZaOxgDh4LwQjtvuyvlwNY69G4JZxOn3P
   Hi4ejoN7MarWXAd1ZOAwM6zn04KeGLnwG/eUlZbfYBf2D9yY6M3YG2zp8
   D62UfupwnizHfoP8ilBy3q6oUiNWyedaCRvGMQYLr/UmDujUxTdwoh97N
   6S5WmQoeRZzkI49QAYDn3vnUs0qGqHqXCzFI1eN0aeVOml4IYYzg7Ieat
   FEW+i3r5kEAjgo5PxZN5w9TeGyMKC/ZeQphWBxV6eazIlFgIjTbn9prsz
   27yrxkURKPnRh9legc/UPThNPVITVMJjutZr0LtDUQ4FLADdzUHQbQTjn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356725046"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="356725046"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 06:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701651175"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="701651175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 06:57:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 06:57:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 06:57:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 06:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2hZclNq7h4v8GwIYlpj3ZmtxX7OsNxf4EHT4Q0XB2cVoCtKKkzI3MLNeeyyFyzB9WOcHAYIQe8Aae6121o3ZLKteNwucnE+WmLIwiYvBA0iAFZ7gdB/oAYWhC4jYRJcA2XAEjmpQPrQ4hL+h+vmSMJ6+0kVhcyODaUoKJQG6qd4GnLTw1G+VxTq6/yfADurJCMMxkYDAVItAcbKTriMyVIqvazPP9iD3oyCpe6NFfecuweJVACKThF87UMTai9hlfqDbRpYfJyncxKxM9eg5NXia0Opyv28f6BxsUENZxnN1Kia/a3kWicOYcOxYCYpX2nKmAYJtxgUovlBG+Demw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RzXx1J5JoKnK+Y6/hVcrBGtWLrxKPyi0QkxPZ0zsVk=;
 b=KxD834aXM1Axu4Gr89SaPWOt9CIY9JR+Zy2elJItKNzxoAbsVImn1M5wFiLmLL3vbjQw1fyj3nuBc+gYUBN0pppxSecunvBpmzab09eQVPrCQA+B5As05dRj/5Qsk03ROu83g5AlSiXzZ30les7ywa9t/mxuKSO8O1YVvn9kmZs9smVEQJwyVTSlDk0stzlcB8ydbqKm+wNdUnoE0Sy71kPYFG98E4y7kchYCaf5ejfdfjAFAgm9IZbRzzzUfaEhfhOTu/HLkawvZn2x2ZnsHnei4MXAI0Jic0X9WfAoBLoGcVBv/GPISOwj5N/yjhKGNPQPdiLd837Qph0b4IF/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 13:57:04 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::57e7:80ff:c440:c53a%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 13:57:04 +0000
Date: Thu, 20 Jul 2023 21:49:06 +0800
From: Feng Tang <feng.tang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel
	<jaypatel@linux.ibm.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
	lkp <lkp@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying"
	<ying.huang@intel.com>, "Yin, Fengwei" <fengwei.yin@intel.com>,
	"cl@linux.com" <cl@linux.com>, "penberg@kernel.org" <penberg@kernel.org>,
	"rientjes@google.com" <rientjes@google.com>, "iamjoonsoo.kim@lge.com"
	<iamjoonsoo.kim@lge.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"tsahu@linux.ibm.com" <tsahu@linux.ibm.com>, "piyushs@linux.ibm.com"
	<piyushs@linux.ibm.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Message-ID: <ZLk7UpWWLf5agKDW@feng-clx>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
X-ClientProxiedBy: SG2PR03CA0091.apcprd03.prod.outlook.com
 (2603:1096:4:7c::19) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: f28df63f-fb10-4452-d715-08db89293229
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8fifLZtke55gENCh6OuU/G3xaCjxAWQZqag2gvRA5nxZ6Y2GPbsDK1ZrDnp7RIVBTv4EXIhNFaVXcDBKBY/qU1U9JjqCIu3ykTlUcfCrIZrPUNCk6f1L7uXLCsw1YPS6Eq0/3+qBrCfBm6ys+AHoPeNni7ANqMjFHSRjoOxW6DUDivRz9wualiRNznbE3jQZzbt3zT1EBcl/L8rc8xo4/Vqg3JHXCz/SsHA5QVTB8Y5LYdYzeb7Um2DybZVU+qqp+BNW00wno0eUivV03iDF45owVR/LLYkOl7QGkjkRVcMTdFt7D3W6JCSS1n3gWRDbPVu+1YBvZ0HPXiGPv++QUKph6D4bS+VuiHivHT682CHGH+JcOmmpuxvQ/uhYrFyAysXv9TKTKAwmC4dM0tBH9sYHD74Oj2u1tPCQIe9z3U5ORa6967wbkMPsgK1GnMms6xFYzcR36rd9JF9yPj1yNAC4pN7YJU/Ran3u8/DfnKdB/YUX7fgm80uPSUO3/l1T2HwInhiIMxfjgIcspwYL7JosQ4qXlb2t7DpAb0tVOvpojVVLx3V+FpGn+sC58wM8SZCbVZXH8Af3k6AGMsPwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199021)(41300700001)(53546011)(6506007)(26005)(186003)(478600001)(4326008)(66476007)(66556008)(66946007)(6916009)(316002)(44832011)(8936002)(8676002)(5660300002)(7416002)(6512007)(6486002)(9686003)(966005)(54906003)(2906002)(83380400001)(38100700002)(82960400001)(33716001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEdqa2dxdDcrT0d2Ym5rZFZvL2d2ZUh1TzJVYlRnL2c0eXpNNDBpVzFKSHlp?=
 =?utf-8?B?bVIrd0pCTVgrd0NndU1HN2Y0ZHEvc1RINDU0MUl0ZCtkazhHOUg3MU9QYndY?=
 =?utf-8?B?Z3ZwUm4xYjE1OWNjblpTMHFVUkRPQ1kwUTNjQXBKWjQvSldjOCtQczUvWnBr?=
 =?utf-8?B?YVl0VC8vNXhod1dZVHdKdE80RVdSOGljVzVoVWFCTy9NOXBPN2plaGhWZzVK?=
 =?utf-8?B?aVhQeFphRjFSTmRXdUk2RjFmYTUwdUZOZ3duZ2sxd084V1lUWFVZTllteHI0?=
 =?utf-8?B?TXFVUUluUVdUOHhIWHJUS3ZLVXk5Rk5KOUlnbzJPQkpBS1UwbkkvZ1orZlV5?=
 =?utf-8?B?N0tYQ1ZqRzhJUC9ybjZLYXAzREZIcitnWUN3SjE5cGZ0TVlmYy9LaVFlNnVR?=
 =?utf-8?B?ejI2YkVjaWpXWHd1RGxESEUxbHdFZ0pHdjRPSUc0V2ZpV3hNSFhRYzFDTUQz?=
 =?utf-8?B?eS9ycmVCQmNsOUVHeUY5VDQ2aHdOTVhyOXVtYmlPV1JTWGllTWt3Rkd3OFV3?=
 =?utf-8?B?cnBWOEVqMktlY043WkNEMnhMdU16RFc3b3ZJVTNOWU84dEkrNHZDT3E1cm92?=
 =?utf-8?B?YjkxNFhGQnExN0dxQVNzR2hWb0JmTWlldndCU3pEdHE1bitVWUo5OUdsRUZp?=
 =?utf-8?B?dHB0U2ZCTnZsb3pOQmU4bEg3UmtRUDNjNWFja2pWekR5Q1dJM3NiRWtzZ096?=
 =?utf-8?B?WUJSV2VLQ3VSQUp2SHpyOHZmVGtsYVFITzBjSllxK29KNGxJZHJLRTQ4VTdZ?=
 =?utf-8?B?M2lqWURFaGFvdlJNS0NqMTlJNlpwNDNabU8rMW92UCtnME5sMHEzNTRreWpa?=
 =?utf-8?B?bnNMUWE3ZmFXK2U5SC85SVVLN0N6NW1kaXBuVEE2c25laFRleGc0QzU3a2U5?=
 =?utf-8?B?S2psbUNUVWR3Q1U4aHVTcUFoeHFFM2NZdlZpYVg1Myt5ZlFRWTVJWHlsS2hW?=
 =?utf-8?B?dS9VTStkZkttT3BZN1lxL2daUG1RREhneTJQTGRkVVRmK014YXN1VWlITzJ1?=
 =?utf-8?B?QjdQeWZ6dy9sbDVnMFRaSjYvWllGUkpadlZJMzhXazlxWHBaL3B4OVcrMkdC?=
 =?utf-8?B?d1hWNUg2YXZkZEh2Sk52aDVoRENpb2NZOExIVUQ4SWhDZThET1dpSTYvRGZK?=
 =?utf-8?B?cVRZZ0JuMzVodFVCM0pBT1hsWTRDWlRZUHE1cXpiNmRZZWhiSmx3WjRqRnZK?=
 =?utf-8?B?cjI4blBXYzBGRzE0UTNYdHUxcVAzRmM0SEVBRVh2UUl2RWk5UHBlYW9HY2ZB?=
 =?utf-8?B?dEZZbUtYeVRuWW40Um5NcU45dmxVMmVRRW15QXF2cEIwQXc3NDJxQjIyL0Fk?=
 =?utf-8?B?enJKdTZRenJoU3dDcnJDdTVydm5FcDF1OEM3MFpzSkpLNEZXTmlibm5EN2Fx?=
 =?utf-8?B?am9CcFRlYTg5d0tzSGkzMHljY3l1NlcvSmZORmZPcU9nZzJVVXgxMzJRUE1B?=
 =?utf-8?B?VVJMZm5LYi91QU96dW91VDBoQzN1eklrdUtQd2tCYW9QZUY2VWxSZnJXdjd2?=
 =?utf-8?B?OXZ4ZEdtS2IxNC9ERWpSVVlVRUhUNlhmN0VQcDdkamZaeTlXeklkeXN2L2Qv?=
 =?utf-8?B?VGZ4b0NaYlZaTjQ4Sit1TExBcXMxM0gyZzczdEV0TGJGM1Y1MnVYZVZ5N2kr?=
 =?utf-8?B?VkgvYWhBYndhVTV2b3ZMQWlkK1haeS9JMTFaQUQxcVMyL0MwcTJKVkJ1S1Q4?=
 =?utf-8?B?aHZoYWc3cFNEWXQ1dytRdk9Dd3EwNDhwMFRpVVcwNE9WQWhjTU56RUNFeWEr?=
 =?utf-8?B?ZEdTTjBHaHBWcjVXd0JRempCZkNWbWUyTklNWFN2MWNZOTZGZEFwWkJmSXBG?=
 =?utf-8?B?ZFkyMHNoQmIyTjlOV0J1amJwOWZWRWk2SW9rVzZGRWhNYkhhVjVlZ2N0dFRB?=
 =?utf-8?B?K3dWOCtFUFAySDJvbGJ3SklBU2NpeGJFQ0UyTnJSa0ovZnVJWEkrSjNZYksx?=
 =?utf-8?B?eWRIUVprRmZ0UnQwNWY0bzVIem84RHk2TlhtZVdvVS9IeXFSWE1nTlVSbmdW?=
 =?utf-8?B?NFpCTXMxS1NnQWxNM0YraE81VVhrbVg4SG5qQ0NoK3NocDI5SWVPUXBMckdr?=
 =?utf-8?B?T3NxaUNiZmtFSG9VMWNCRG05c3JZUkJ5bklUdVZDbzhBRHkzQk4yK0NzbWFB?=
 =?utf-8?Q?Ss3o2YkUlZYB3+vk0Rm1DZ810?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f28df63f-fb10-4452-d715-08db89293229
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:57:03.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8WnKN53h4/GGvA/5rLyb+2dyCkPFPc2a7sHxQzScE/t75CI80wEXYm56B9LCqBjcaL9hdiWY7Lrkwdr+GjpkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-OriginatorOrg: intel.com

Hi Hyeonggon,

On Thu, Jul 20, 2023 at 08:59:56PM +0800, Hyeonggon Yoo wrote:
> On Thu, Jul 20, 2023 at 12:01 PM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Hyeonggon Yoo,
> >
> > On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> > > On Mon, Jul 17, 2023 at 10:41 PM kernel test robot
> > > <oliver.sang@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a -12.5% regression of hackbench.throughput on:
> > > >
> > > >
> > > > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage")
> > > > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-slub-Optimize-slub-memory-usage/20230628-180050
> > > > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-next
> > > > patch link: https://lore.kernel.org/all/20230628095740.589893-1-jaypatel@linux.ibm.com/
> > > > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
> > > >
> > > > testcase: hackbench
> > > > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> > > > parameters:
> > > >
> > > >         nr_threads: 100%
> > > >         iterations: 4
> > > >         mode: process
> > > >         ipc: socket
> > > >         cpufreq_governor: performance
> > > >
> > > >
> > > >
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-oliver.sang@intel.com
> > > >
> > > >
> > > > Details are as below:
> > > > -------------------------------------------------------------------------------------------------->
> > > >
> > > >
> > > > To reproduce:
> > > >
> > > >         git clone https://github.com/intel/lkp-tests.git
> > > >         cd lkp-tests
> > > >         sudo bin/lkp install job.yaml           # job file is attached in this email
> > > >         bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
> > > >         sudo bin/lkp run generated-yaml-file
> > > >
> > > >         # if come across any failure that blocks the test,
> > > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > > >
> > > > =========================================================================================
> > > > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
> > > >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> > > >
> > > > commit:
> > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > >
> > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >     222503 ą 86%    +108.7%     464342 ą 58%  numa-meminfo.node1.Active
> > > >     222459 ą 86%    +108.7%     464294 ą 58%  numa-meminfo.node1.Active(anon)
> > > >      55573 ą 85%    +108.0%     115619 ą 58%  numa-vmstat.node1.nr_active_anon
> > > >      55573 ą 85%    +108.0%     115618 ą 58%  numa-vmstat.node1.nr_zone_active_anon
> > >
> > > I'm quite baffled while reading this.
> > > How did changing slab order calculation double the number of active anon pages?
> > > I doubt two experiments were performed on the same settings.
> >
> > let me introduce our test process.
> >
> > we make sure the tests upon commit and its parent have exact same environment
> > except the kernel difference, and we also make sure the config to build the
> > commit and its parent are identical.
> >
> > we run tests for one commit at least 6 times to make sure the data is stable.
> >
> > such like for this case, we rebuild the commit and its parent's kernel, the
> > config is attached FYI.
> 
> Hello Oliver,
> 
> Thank you for confirming the testing environment is totally fine.
> and I'm sorry. I didn't mean to offend that your tests were bad.
> 
> It was more like  "oh, the data totally doesn't make sense to me"
> and I blamed the tests rather than my poor understanding of the data ;)
> 
> Anyway,
> as the data shows a repeatable regression,
> let's think more about the possible scenario:
> 
> I can't stop thinking that the patch must've affected the system's
> reclamation behavior in some way.
> (I think more active anon pages with a similar number total of anon
> pages implies the kernel scanned more pages)
> 
> It might be because kswapd was more frequently woken up (possible if
> skbs were allocated with GFP_ATOMIC)
> But the data provided is not enough to support this argument.
> 
> >  2.43 ± 7% +4.5 6.90 ± 11% perf-profile.children.cycles-pp.get_partial_node
> >  3.23 ±  5%      +4.5        7.77 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
> >  7.51 ±  2%      +4.6       12.11 ±  5%  perf-profile.children.cycles-pp.kmalloc_reserve
> > 6.94 ±  2%      +4.7       11.62 ±  6%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
> > 6.46 ±  2%      +4.8       11.22 ±  6%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
> >  8.48 ±  4%      +7.9       16.42 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> >  6.12 ±  6%      +8.6       14.74 ±  9%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
> 
> And this increased cycles in the SLUB slowpath implies that the actual
> number of objects available in
> the per cpu partial list has been decreased, possibly because of
> inaccuracy in the heuristic?
> (cuz the assumption that slabs cached per are half-filled, and that
> slabs' order is s->oo)

From the patch:

 static unsigned int slub_max_order =
-	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
+	IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;

Could this be related? that it reduces the order for some slab cache,
so each per-cpu slab will has less objects, which makes the contention
for per-node spinlock 'list_lock' more severe when the slab allocation
is under pressure from many concurrent threads.

I don't have direct data to backup it, and I can try some experiment.

Thanks,
Feng

> Any thoughts, Vlastimil or Jay?
> 
> >
> > then retest on this test machine:
> > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
