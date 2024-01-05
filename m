Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07422EF9
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jan 2024 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtdpTvyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704446975; x=1735982975;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DSdePL5dxI6tyY4wsGnORad80GtLX3l05e4KI0oH05w=;
  b=FtdpTvyDhCtS63f/lfchvUuE0gbAACGG4N083jTng8hvbGb34DfAWMmZ
   TtYkTiVXHDKoYMNLir/sqaqkhyqDSQOCBJqZTEN32gDpiER34btSZEN8T
   JbuiSeVPkvS8u+7yBY10O1jSCFZG79tAK1m065aV7cv/NyZkfxAYPlZ9f
   FjuG4UyTfzVfP+VnubPY6HcX/wtVMk8wRoDt0fH0Y36rzS8iOhS1oj+o/
   7nDaTGpodMblTC35uO7KkC8UW026mVGWiV8LksHVi+AX2ldt2EcraMg0Y
   M9HW2OJh/mSCZNtnIjzSXMNa8rGGmo9WnYU5qaZrfCCDZS9+MlMIEhfnw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463867797"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="463867797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="780715655"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="780715655"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jan 2024 01:29:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 01:29:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 01:29:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 01:29:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 01:29:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8gZMpUTBFwJatbjLHk0oB5wZ+z3XrcY8tZcr/7z9S9HoskHOi/DV0X0jNDwBT12u5IUurdvcjZSrGghGJflipAacanm/ie+fqSSv/5PQzaS7YrAWpTjpF4O1ZoSIH9Itg8PTosybOdHkWXKNYb5ILPnT4VLPtXAIL/rfEV1sMukt8QaKsKiUXD+BkZhMVAVW9sy4QXyScvPSQRI36z08crmFdXIgT66Eha/9JeNesLCP6R5uc7X4qG4nIWsSwe6n+vuzmoz59TEKZrvNKtNrwO2nj+u1x2JTHfffU1p1byjyPFYWjBaSGfblBRdjH9mGGLF9xj/feBBgtjy+woASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HedJrvL1NPgKLJR4zlptNLyGYhVVUjU7DaZsySK9/80=;
 b=mUuqT2kRG1Kt7Lje15tAQxpNYH4KoBGxzfN6ZIRjFMNeVmx+gnJDiWfggFVMITrYJy4jjBJ7qArt/f6MDHSgVqfb4zSgIrq4cOwiz73KQdebap4vK3Kr4P1FBlIpk23KWehqSg/jPuDIQnbloeM+IhMLq+WqRdF+BNkry73sRPbpYGb8etd9MwIuvP4UH5ZG3hm2F19bsy19NkZWkzC/N8lQIdOaNTaPSTO61X/JNvLH27Lr88A83l1+TZsS8teenaGE9dNA/ySMtG0HjAcWZXrBj5efP8AmqOdtP7iLqY7GizJz644TEzuCoESttneNznChrY2Pf5gGyuEGefzDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.27; Fri, 5 Jan
 2024 09:29:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 09:29:22 +0000
Date: Fri, 5 Jan 2024 17:29:12 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Yang Shi <shy828301@gmail.com>
CC: Yin Fengwei <fengwei.yin@intel.com>, Rik van Riel <riel@surriel.com>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Matthew
 Wilcox" <willy@infradead.org>, Christopher Lameter <cl@linux.com>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c:
 stress-ng.pthread.ops_per_sec -84.3% regression
Message-ID: <ZZfL6APUYZ3VuUTv@xsang-OptiPlex-9020>
References: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com>
 <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
 <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
 <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
 <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com>
 <ZZZu1s5yAyFr0wtw@xsang-OptiPlex-9020>
Content-Type: multipart/mixed; boundary="j0dMq1itEyhiQLv6"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZZu1s5yAyFr0wtw@xsang-OptiPlex-9020>
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 025975ad-0694-4a13-676f-08dc0dd0ccba
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkpE0pukMjqrqVG7viRqn2TKGhgrjewO+ELBENHSwfP7dLMI2qzKSMRY/QSMXWMbIKPH3AChUJWrt+zNbd/TrH48X8EBVpEXhfaEvmX5BdxJWFeit5ATRhWYRrNkJ8dInXKcUP74q+57jGlYvd8eslqNRDOwg5Gf7rxGw0fjXuVLIDoUZc7Nu8DoutijCTzTjnGqm+QFUGV6OCmoiTQp6+iVF5YnNQCW9th5UjXA4trHGb5lQ/oKVdoDmtUOVZZa08C2K/s1c2xqqhAtP2pJ3PUOZpR5aE5VHU4gyvm93rPqk+wuCVn+YNRzoWpI/ne42IEFzd/ijnJ5gKI4Dw/YQt2fwQZckjtOv9m5GlmUjl5Rvfq2UtprE4e3c51dLrA70Vokpg3f3mZn7I75Y/eGv7QWVXZiUIDcCZY/O7xwJZz4yvUB2zjTiiXe0lcFA+tw6CfvCql33saZqOiNDeqiesmFMsn5K9VKBFMeIHAVCCzuOH4XAEA0fBxu3cM5vem36ld8X9dmio7tFFqZOVHFFaQEscgzO1b6sECj+wscy60QUa4DQ/x2AslN7DGOC+g8Tk1qPywCWM2qapM886nwMHfMNnhtUo3R0bImkkvUmQqYdcM0ip/xduoHLMIK0bh0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(6916009)(66946007)(66556008)(54906003)(316002)(6512007)(6506007)(44144004)(53546011)(9686003)(6486002)(30864003)(6666004)(478600001)(5660300002)(8936002)(8676002)(41300700001)(235185007)(33716001)(2906002)(4326008)(44832011)(86362001)(38100700002)(82960400001)(107886003)(26005)(83380400001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q6WqmTFJyfeVvK5KdQtgzAFnOLKoA9xPgwGQR99xJf8zXtIGbFi9BzMWia?=
 =?iso-8859-1?Q?8AI22w8dm+OPG0vPkkqwjf7Yw6rd+YpozeWtQ4dqvo/k1405ZVYPNxz3BS?=
 =?iso-8859-1?Q?s4mbjr37H2RkN182Q43STp4KJE4NuPCHV9n6WMuPTgej4Um0hMGhhGrADU?=
 =?iso-8859-1?Q?zDK9FFxGcIRZoMfUbN4GmqxqNMYbzgo2savA1JVkC3aYNTZO2cq5N4tMfp?=
 =?iso-8859-1?Q?jc4x11rv+Mw3LQKckB4oi03dM/LUWw/NaaqwihbCOMnHl/OiitpoSUh2YR?=
 =?iso-8859-1?Q?1W4xTwJ9eANHiv5qo0nFHU/f+Mvkx8++vmDh/3q1lR2iTpTZSOOLUK4JwG?=
 =?iso-8859-1?Q?H97mcrcFX9ezeDBwFZ8kFG7aYeH1mb4xyvOfhYTfT/tNrF5LuxyXXh81OR?=
 =?iso-8859-1?Q?tmcGsMxzAK+2mS0QmuwfZYeynHL2fI2sSSwBomq5dR770FptTV+w68AQpg?=
 =?iso-8859-1?Q?kA9CdexundcO/QwlTERfwNgJvSbMLoxC+FRqJyV8npA9tl0v/aiKqQOefq?=
 =?iso-8859-1?Q?YNnjxTItFIaczwwy0q2XniRm6l5bg9bR7WW/p6e3ke8eiV8VUp8edCvTnr?=
 =?iso-8859-1?Q?dnVcoSJMkBIvsn66mKQbITCfaJOyr62cOeIhjN/PWOBdS1m7H5ylQkZmCY?=
 =?iso-8859-1?Q?xj/zXWEWv2fX4bPYUXzdaoZdLv65wZdVGNE9uVHCs5pAxRkEYvrXr9f333?=
 =?iso-8859-1?Q?dBvYlY7tYBM1Jbr+wjvcfd0KV3CLBtz54uvUdZSgxKoOHtDkpcz3TPqOV1?=
 =?iso-8859-1?Q?3pcGUGNb+ETbRNUNnhbNXYDTy4VTZQLpY2WUr9og8s5cQSqO7A/f2mSabh?=
 =?iso-8859-1?Q?pj3iKI4AhoG2FkuX/BKxL7RjRt6MjLeR0JlM/fwmn9mEn/NM4fs1wO1yPF?=
 =?iso-8859-1?Q?TuLkIVjMa6jaDaTZ0FiTCPZ/2N1+URsVuvJ/fWlY+09QW1xIbdiM/ISI2x?=
 =?iso-8859-1?Q?9XNttHi39zk3mXttYxtKBqgZVTlpzVMMkgEc58esAAcCpIpVzLTfU/fYpx?=
 =?iso-8859-1?Q?aULWhgo2Wv/e/h+C+kmNjIBSsQkKm4lhPYAhS+6XmGxi34HEb6nHNTtTfz?=
 =?iso-8859-1?Q?jrlUMYIDzmGVqOYtl/oJGwRUaIFGT2FN1hcMcheFQR13em6IB9WQX2WAks?=
 =?iso-8859-1?Q?49zDOvu5gXhm36DpHKaC/IOwypfKjCI/vwuT0ltwK3uvVvmmKeq0shEYFS?=
 =?iso-8859-1?Q?gEb/B3F9hkSi+6S87+T6qUHNwEw6jaHamjpRpAwWSTkG5A7YVlNnhZLKqj?=
 =?iso-8859-1?Q?GH2DsywJQw0Ag8hM2q/QuEUAQ1tszDSEo3Navq2/waTDR8jEX7z/pgtVqi?=
 =?iso-8859-1?Q?LUO7r3sdcQ2+E28WUwZshzelMcbgQX5tyMJdkO30uLlmFHetNSHSL4p8fa?=
 =?iso-8859-1?Q?kTI2CmZT9DkgzCitO3ARGbTaN0V1WhNllihGvpfWKAW9bMMxW2jSj9NRdd?=
 =?iso-8859-1?Q?I4QwzP30zMuRRmyi/HRLLSAT8ORni1ilir/1RM0D9yODTKsU6qBvsHfSId?=
 =?iso-8859-1?Q?xwiT9Uagw9OGyfU8DEkDFwkFyb+tV2t/+hRjQZCNb7zWdoJt81tKd40BpR?=
 =?iso-8859-1?Q?5hGDsf9c6Zm/vShQEWUuBtUYaL7PRT5ijYo8hSB/4UCZ8LjOAQ36BVCJIy?=
 =?iso-8859-1?Q?Pzq99KQRaw7/qx80FlxZohGjDwn2Xwuo9KrAHzJeLfmqg0D6VAU/txzw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 025975ad-0694-4a13-676f-08dc0dd0ccba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 09:29:22.6128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGP63ww/TMIdVuudXwL0tBX59Eu+m6RfV0vNl/N9bUGXchElQLrIj6QtVxUaorZ7J0tfuf3EzZ+GaR/odyOjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
X-OriginatorOrg: intel.com

--j0dMq1itEyhiQLv6
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

hi, Yang Shi,

On Thu, Jan 04, 2024 at 04:39:50PM +0800, Oliver Sang wrote:
> hi, Fengwei, hi, Yang Shi,
> 
> On Thu, Jan 04, 2024 at 04:18:00PM +0800, Yin Fengwei wrote:
> > 
> > On 2024/1/4 09:32, Yang Shi wrote:
> 
> ...
> 
> > > Can you please help test the below patch?
> > I can't access the testing box now. Oliver will help to test your patch.
> > 
> 
> since now the commit-id of
>   'mm: align larger anonymous mappings on THP boundaries'
> in linux-next/master is efa7df3e3bb5d
> I applied the patch like below:
> 
> * d8d7b1dae6f03 fix for 'mm: align larger anonymous mappings on THP boundaries' from Yang Shi
> * efa7df3e3bb5d mm: align larger anonymous mappings on THP boundaries
> * 1803d0c5ee1a3 mailmap: add an old address for Naoya Horiguchi
> 
> our auto-bisect captured new efa7df3e3b as fbc for quite a number of regression
> so far, I will test d8d7b1dae6f03 for all these tests. Thanks
>

we got 12 regressions and 1 improvement results for efa7df3e3b so far.
(4 regressions are just similar to what we reported for 1111d46b5c).
by your patch, 6 of those regressions are fixed, others are not impacted.

below is a summary:

No.  testsuite       test                            status-on-efa7df3e3b  fix-by-d8d7b1dae6 ?
===  =========       ====                            ====================  ===================
(1)  stress-ng       numa                            regression            NO
(2)                  pthread                         regression            yes (on a Ice Lake server)
(3)                  pthread                         regression            yes (on a Cascade Lake desktop)
(4)  will-it-scale   malloc1                         regression            NO
(5)                  page_fault1                     improvement           no (so still improvement)
(6)  vm-scalability  anon-w-seq-mt                   regression            yes
(7)  stream          nr_threads=25%                  regression            yes
(8)                  nr_threads=50%                  regression            yes
(9)  phoronix        osbench.CreateThreads           regression            yes (on a Cascade Lake server)
(10)                 ramspeed.Add.Integer            regression            NO (and below 3, on a Coffee Lake desktop)
(11)                 ramspeed.Average.FloatingPoint  regression            NO
(12)                 ramspeed.Triad.Integer          regression            NO
(13)                 ramspeed.Average.Integer        regression            NO


below are details, for those regressions not fixed by d8d7b1dae6, attached
full comparison.


(1) detail comparison is attached as 'stress-ng-regression'

Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with memory: 256G
=========================================================================================
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  cpu/gcc-12/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp7/numa/stress-ng/60s

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    251.12           -48.2%     130.00           -47.9%     130.75        stress-ng.numa.ops
      4.10           -49.4%       2.08           -49.2%       2.09        stress-ng.numa.ops_per_sec


(2)
Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with memory: 256G
=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp7/pthread/stress-ng/60s

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   3272223           -87.8%     400430            +0.5%    3287322        stress-ng.pthread.ops
     54516           -87.8%       6664            +0.5%      54772        stress-ng.pthread.ops_per_sec  

 
(3)
Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with memory: 128G
=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/pthread/stress-ng/60s

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   2250845           -85.2%     332370 ±  6%      -0.8%    2232820        stress-ng.pthread.ops
     37510           -85.2%       5538 ±  6%      -0.8%      37209        stress-ng.pthread.ops_per_sec  


(4) full comparison attached as 'will-it-scale-regression'

Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: 192G
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/malloc1/will-it-scale

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     10994           -86.7%       1466           -86.7%       1460        will-it-scale.per_process_ops
   1231431           -86.7%     164315           -86.7%     163624        will-it-scale.workload

	  
(5)
Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: 192G
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/thread/100%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/page_fault1/will-it-scale

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
  18858970           +44.8%   27298921           +44.9%   27330479        will-it-scale.224.threads
     56.06           +13.3%      63.53           +13.8%      63.81        will-it-scale.224.threads_idle
     84191           +44.8%     121869           +44.9%     122010        will-it-scale.per_thread_ops
  18858970           +44.8%   27298921           +44.9%   27330479        will-it-scale.workload


(6)
Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: 192G
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/300s/8T/lkp-cpl-4sp2/anon-w-seq-mt/vm-scalability

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    345968            -6.5%     323566            +0.1%     346304        vm-scalability.median
      1.91 ± 10%      -0.5        1.38 ± 20%      -0.2        1.75 ± 13%  vm-scalability.median_stddev%
  79708409            -7.4%   73839640            -0.1%   79613742        vm-scalability.throughput


(7)
Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with memory: 512G
=========================================================================================
array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/omp/rootfs/tbox_group/testcase:
  50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/25%/true/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/stream

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    349414           -16.2%     292854 ±  2%      -0.4%     348048        stream.add_bandwidth_MBps
    347727 ±  2%     -16.5%     290470 ±  2%      -0.6%     345750 ±  2%  stream.add_bandwidth_MBps_harmonicMean
    332206           -21.6%     260428 ±  3%      -0.4%     330838        stream.copy_bandwidth_MBps
    330746 ±  2%     -22.6%     255915 ±  3%      -0.6%     328725 ±  2%  stream.copy_bandwidth_MBps_harmonicMean
    301178           -16.9%     250209 ±  2%      -0.4%     299920        stream.scale_bandwidth_MBps
    300262           -17.7%     247151 ±  2%      -0.6%     298586 ±  2%  stream.scale_bandwidth_MBps_harmonicMean
    337408           -12.5%     295287 ±  2%      -0.3%     336304        stream.triad_bandwidth_MBps
    336153           -12.7%     293621            -0.5%     334624 ±  2%  stream.triad_bandwidth_MBps_harmonicMean			 


(8)
Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with memory: 512G
=========================================================================================
array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/omp/rootfs/tbox_group/testcase:
  50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/50%/true/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/stream

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    345632           -19.7%     277550 ±  3%      +0.4%     347067 ±  2%  stream.add_bandwidth_MBps
    342263 ±  2%     -19.7%     274704 ±  2%      +0.4%     343609 ±  2%  stream.add_bandwidth_MBps_harmonicMean
    343820           -17.3%     284428 ±  3%      +0.1%     344248        stream.copy_bandwidth_MBps
    341759 ±  2%     -17.8%     280934 ±  3%      +0.1%     342025 ±  2%  stream.copy_bandwidth_MBps_harmonicMean
    343270           -17.8%     282330 ±  3%      +0.3%     344276 ±  2%  stream.scale_bandwidth_MBps
    340812 ±  2%     -18.3%     278284 ±  3%      +0.3%     341672 ±  2%  stream.scale_bandwidth_MBps_harmonicMean
    364596           -19.7%     292831 ±  3%      +0.4%     366145 ±  2%  stream.triad_bandwidth_MBps
    360643 ±  2%     -19.9%     289034 ±  3%      +0.4%     362004 ±  2%  stream.triad_bandwidth_MBps_harmonicMean			 


(9)
Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with memory: 512G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Create Threads/debian-x86_64-phoronix/lkp-csl-2sp7/osbench-1.0.2/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     26.82         +1348.4%     388.43            +4.0%      27.88        phoronix-test-suite.osbench.CreateThreads.us_per_event


**** for below (10) - (13), full comparison is attached as phoronix-regressions
(they all happen on a Coffee Lake desktop)
(10)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Add/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     20115            -4.5%      19211            -4.5%      19217        phoronix-test-suite.ramspeed.Add.Integer.mb_s


(11)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Floating Point/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     19960            -2.9%      19378            -3.0%      19366        phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s


(12)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Triad/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     19667            -6.4%      18399            -6.4%      18413        phoronix-test-suite.ramspeed.Triad.Integer.mb_s


(13)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     19799            -3.5%      19106            -3.4%      19117        phoronix-test-suite.ramspeed.Average.Integer.mb_s



> 
> 
> commit d8d7b1dae6f0311d528b289cda7b317520f9a984
> Author: 0day robot <lkp@intel.com>
> Date:   Thu Jan 4 12:51:10 2024 +0800
> 
>     fix for 'mm: align larger anonymous mappings on THP boundaries' from Yang Shi
> 
> diff --git a/include/linux/mman.h b/include/linux/mman.h
> index 40d94411d4920..91197bd387730 100644
> --- a/include/linux/mman.h
> +++ b/include/linux/mman.h
> @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
>         return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
>                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
> +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
>                arch_calc_vm_flag_bits(flags);
>  }
> 
> 
> > 
> > Regards
> > Yin, Fengwei
> > 
> > > 
> > > diff --git a/include/linux/mman.h b/include/linux/mman.h
> > > index 40d94411d492..dc7048824be8 100644
> > > --- a/include/linux/mman.h
> > > +++ b/include/linux/mman.h
> > > @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
> > >          return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
> > >                 _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
> > >                 _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
> > > +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
> > >                 arch_calc_vm_flag_bits(flags);
> > >   }
> > > 

--j0dMq1itEyhiQLv6
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename="stress-ng-regression"
Content-Transfer-Encoding: 8bit

(1)
Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with memory: 256G
=========================================================================================
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  cpu/gcc-12/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp7/numa/stress-ng/60s

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     55848 ± 28%    +236.5%     187927 ±  3%    +259.4%     200733 ±  2%  meminfo.AnonHugePages
      1.80 ±  5%      -0.2        1.60 ±  5%      -0.2        1.60 ±  7%  mpstat.cpu.all.usr%
      8077 ±  7%     +11.8%       9030 ±  5%      +4.6%       8451 ±  7%  numa-vmstat.node0.nr_kernel_stack
    120605 ±  3%     -10.0%     108597 ±  3%     -10.5%     107928 ±  3%  vmstat.system.in
      1868 ± 32%     +75.1%       3271 ± 14%     +87.1%       3495 ± 20%  turbostat.C1
   9123408 ±  5%     -13.8%    7863298 ±  7%     -14.0%    7846843 ±  6%  turbostat.IRQ
     59.62 ± 49%    +125.4%     134.38 ± 88%    +267.9%     219.38 ± 85%  turbostat.POLL
     24.33 ± 43%     +69.1%      41.14 ± 35%      +9.0%      26.51 ± 53%  sched_debug.cfs_rq:/.removed.load_avg.avg
    104.44 ± 21%     +29.2%     134.94 ± 17%      +3.2%     107.78 ± 26%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    106.26 ± 16%     -17.6%      87.53 ± 21%     -24.6%      80.11 ± 21%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
     35387 ± 59%    +127.7%      80580 ± 53%    +249.2%     123565 ± 57%  sched_debug.cpu.avg_idle.min
      1156 ±  7%     -21.9%     903.06 ±  5%     -23.2%     888.25 ± 15%  sched_debug.cpu.nr_switches.min
     20719 ±111%     -51.1%      10123 ± 71%     -56.6%       8996 ± 29%  numa-meminfo.node0.Active
     20639 ±111%     -51.5%      10001 ± 72%     -56.8%       8916 ± 29%  numa-meminfo.node0.Active(anon)
     31253 ± 70%    +142.7%      75839 ± 20%    +214.1%      98180 ± 22%  numa-meminfo.node0.AnonHugePages
      8076 ±  7%     +11.8%       9029 ±  5%      +4.7%       8451 ±  7%  numa-meminfo.node0.KernelStack
     24260 ± 62%    +360.8%     111783 ± 17%    +321.2%     102184 ± 21%  numa-meminfo.node1.AnonHugePages
    283702 ± 16%     +40.9%     399633 ± 18%     +35.9%     385485 ± 11%  numa-meminfo.node1.AnonPages.max
    251.12           -48.2%     130.00           -47.9%     130.75        stress-ng.numa.ops
      4.10           -49.4%       2.08           -49.2%       2.09        stress-ng.numa.ops_per_sec
     61658           -53.5%      28697           -53.3%      28768        stress-ng.time.minor_page_faults
      3727            +2.8%       3832            +2.9%       3833        stress-ng.time.system_time
     10.41           -48.6%       5.35           -48.7%       5.34        stress-ng.time.user_time
      4313 ±  4%     -47.0%       2285 ±  8%     -48.3%       2230 ±  7%  stress-ng.time.voluntary_context_switches
     63.61            +2.5%      65.20            +2.7%      65.30        time.elapsed_time
     63.61            +2.5%      65.20            +2.7%      65.30        time.elapsed_time.max
     61658           -53.5%      28697           -53.3%      28768        time.minor_page_faults
      3727            +2.8%       3832            +2.9%       3833        time.system_time
     10.41           -48.6%       5.35           -48.7%       5.34        time.user_time
      4313 ±  4%     -47.0%       2285 ±  8%     -48.3%       2230 ±  7%  time.voluntary_context_switches
    120325            +6.1%     127672 ±  6%      +0.9%     121431        proc-vmstat.nr_anon_pages
     27.33 ± 29%    +236.0%      91.83 ±  3%    +258.6%      98.02 ±  2%  proc-vmstat.nr_anon_transparent_hugepages
    148677            +6.2%     157844 ±  4%      +0.7%     149763        proc-vmstat.nr_inactive_anon
     98.10 ± 25%     -52.8%      46.30 ± 69%     -55.3%      43.82 ± 64%  proc-vmstat.nr_isolated_file
      2809            +9.0%       3063 ± 28%      -3.9%       2698 ±  2%  proc-vmstat.nr_page_table_pages
    148670            +6.2%     157837 ±  4%      +0.7%     149765        proc-vmstat.nr_zone_inactive_anon
   2580003            -5.8%    2431297            -5.8%    2431173        proc-vmstat.numa_hit
   1488693            -5.8%    1402808            -5.8%    1401633        proc-vmstat.numa_local
   1091291            -5.8%    1028489            -5.7%    1029540        proc-vmstat.numa_other
  9.56e+08            +2.1%  9.757e+08            +2.1%  9.761e+08        proc-vmstat.pgalloc_normal
    469554            -7.6%     433894            -7.3%     435076        proc-vmstat.pgfault
 9.559e+08            +2.1%  9.756e+08            +2.1%   9.76e+08        proc-vmstat.pgfree
     17127 ± 21%     -55.4%       7647 ± 64%     -55.0%       7700 ± 52%  proc-vmstat.pgmigrate_fail
 9.554e+08            +2.1%  9.751e+08            +2.1%  9.754e+08        proc-vmstat.pgmigrate_success
   1865641            +2.1%    1904388            +2.1%    1905158        proc-vmstat.thp_migration_success
      0.43 ±  8%      -0.1        0.30 ± 10%      -0.2        0.28 ± 12%  perf-profile.children.cycles-pp.queue_pages_range
      0.43 ±  8%      -0.1        0.30 ± 10%      -0.2        0.28 ± 12%  perf-profile.children.cycles-pp.walk_page_range
      0.32 ±  8%      -0.1        0.21 ± 11%      -0.1        0.19 ± 13%  perf-profile.children.cycles-pp.__walk_page_range
      0.30 ±  8%      -0.1        0.19 ± 12%      -0.1        0.17 ± 13%  perf-profile.children.cycles-pp.walk_pud_range
      0.31 ±  9%      -0.1        0.20 ± 12%      -0.1        0.19 ± 12%  perf-profile.children.cycles-pp.walk_pgd_range
      0.30 ±  8%      -0.1        0.20 ± 11%      -0.1        0.18 ± 13%  perf-profile.children.cycles-pp.walk_p4d_range
      0.29 ±  8%      -0.1        0.18 ± 11%      -0.1        0.17 ± 13%  perf-profile.children.cycles-pp.walk_pmd_range
      0.28 ±  8%      -0.1        0.17 ± 11%      -0.1        0.16 ± 13%  perf-profile.children.cycles-pp.queue_folios_pte_range
      0.13 ± 12%      -0.1        0.07 ± 11%      -0.1        0.06 ± 17%  perf-profile.children.cycles-pp.vm_normal_folio
      0.18 ±  4%      -0.0        0.15 ±  3%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.add_page_for_migration
      0.12 ±  4%      -0.0        0.12 ±  5%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.__cond_resched
     98.65            +0.2       98.82            +0.2       98.88        perf-profile.children.cycles-pp.migrate_pages_batch
     98.66            +0.2       98.83            +0.2       98.89        perf-profile.children.cycles-pp.migrate_pages_sync
     98.68            +0.2       98.85            +0.2       98.91        perf-profile.children.cycles-pp.migrate_pages
      0.10 ± 11%      -0.0        0.05 ± 12%      -0.1        0.04 ± 79%  perf-profile.self.cycles-pp.vm_normal_folio
      0.13 ±  8%      -0.0        0.08 ± 14%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp.queue_folios_pte_range
      0.17 ± 89%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
      0.45 ± 59%    +124.4%       1.01 ± 81%   +1094.5%       5.40 ±120%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
     27.27 ± 95%     -75.2%       6.77 ± 83%     -48.4%      14.08 ± 77%  perf-sched.sch_delay.max.ms.__cond_resched.folio_copy.migrate_folio_extra.move_to_new_folio.migrate_pages_batch
      2.00 ± 88%    -100.0%       0.00          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
      4.30 ± 86%     -50.9%       2.11 ± 67%     -90.0%       0.43 ±261%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      3.31 ± 53%     -55.8%       1.46 ±218%     -81.0%       0.63 ±182%  perf-sched.sch_delay.max.ms.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
    190.22 ± 41%    +125.2%     428.42 ± 60%     +72.7%     328.46 ± 21%  perf-sched.wait_and_delay.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    294.56 ± 10%     +44.0%     424.28 ± 16%     +62.5%     478.70 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
    322.33 ±  5%     +46.1%     470.78 ± 10%     +40.8%     453.90 ± 10%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    117.25 ± 11%     -13.3%     101.62 ± 34%     -24.6%      88.38 ± 17%  perf-sched.wait_and_delay.count.__cond_resched.down_read.add_page_for_migration.do_pages_move.kernel_move_pages
    307.25 ±  7%     -54.6%     139.62 ±  4%     -55.2%     137.62 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
    406.25 ±  3%     -57.7%     171.88 ± 10%     -59.0%     166.75 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__flush_work.isra.0
    142.50 ± 33%     -76.8%      33.00 ±139%     -65.8%      48.75 ± 83%  perf-sched.wait_and_delay.count.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
      1196 ±  3%     -37.9%     743.38 ± 10%     -38.5%     736.00 ±  9%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1749 ± 19%     +45.1%       2537 ±  6%     +76.0%       3078 ± 18%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      2691 ± 15%     +48.8%       4003 ±  6%     +44.6%       3892 ± 11%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.82 ± 14%    -100.0%       0.00           -81.1%       0.53 ±264%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.migrate_to_node.do_migrate_pages.kernel_migrate_pages
    199.40 ± 29%    +114.8%     428.41 ± 60%     +64.7%     328.44 ± 21%  perf-sched.wait_time.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      3.09 ± 16%    -100.0%       0.00           -84.4%       0.48 ±264%  perf-sched.wait_time.avg.ms.__cond_resched.queue_folios_pte_range.walk_pmd_range.isra.0
      1.94 ± 50%    -100.0%       0.00           -74.2%       0.50 ±264%  perf-sched.wait_time.avg.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
    294.30 ± 10%     +44.1%     424.17 ± 16%     +62.6%     478.57 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.98 ±107%    -100.0%       0.00           -95.8%       0.04 ±264%  perf-sched.wait_time.avg.ms.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
    321.84 ±  5%     +46.1%     470.35 ± 10%     +40.8%     453.02 ± 10%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      7.31 ± 53%    -100.0%       0.00           -87.7%       0.90 ±264%  perf-sched.wait_time.max.ms.__cond_resched.down_read.migrate_to_node.do_migrate_pages.kernel_migrate_pages
      6.45 ± 16%    -100.0%       0.00           -84.5%       1.00 ±264%  perf-sched.wait_time.max.ms.__cond_resched.queue_folios_pte_range.walk_pmd_range.isra.0
      6.17 ± 45%    -100.0%       0.00           -91.9%       0.50 ±264%  perf-sched.wait_time.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
     11.63 ±118%     -93.3%       0.78 ±178%     -89.3%       1.24 ±245%  perf-sched.wait_time.max.ms.exp_funnel_lock.synchronize_rcu_expedited.lru_cache_disable.do_pages_move
      1749 ± 19%     +45.1%       2537 ±  6%     +76.0%       3078 ± 18%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      2.49 ± 88%    -100.0%       0.00           -98.4%       0.04 ±264%  perf-sched.wait_time.max.ms.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
      2691 ± 15%     +48.8%       4003 ±  6%     +44.6%       3892 ± 11%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    340.81           +38.9%     473.47           +38.4%     471.58        perf-stat.i.MPKI
 1.131e+09           -25.0%  8.485e+08           -25.2%  8.465e+08 ±  2%  perf-stat.i.branch-instructions
     68.31            +1.1       69.37            +1.1       69.37        perf-stat.i.cache-miss-rate%
     46.16           +38.1%      63.73           +37.5%      63.45        perf-stat.i.cpi
    157.48            -7.7%     145.30 ±  2%      -8.1%     144.76 ±  2%  perf-stat.i.cpu-migrations
      0.02 ±  2%      +0.0        0.02 ± 16%      +0.0        0.02        perf-stat.i.dTLB-load-miss-rate%
    165432 ±  2%      -2.9%     160583 ± 12%      -8.3%     151664        perf-stat.i.dTLB-load-misses
 1.133e+09           -21.9%  8.846e+08           -22.1%  8.823e+08 ±  2%  perf-stat.i.dTLB-loads
      0.02            -0.0        0.01 ±  3%      -0.0        0.01        perf-stat.i.dTLB-store-miss-rate%
     98452           -31.8%      67127 ±  2%     -32.2%      66739 ±  2%  perf-stat.i.dTLB-store-misses
 5.668e+08           -13.7%  4.891e+08           -13.9%  4.879e+08        perf-stat.i.dTLB-stores
 5.684e+09           -24.5%  4.292e+09           -24.7%  4.282e+09 ±  2%  perf-stat.i.instructions
      0.07 ±  2%     -14.5%       0.06 ±  3%     -14.6%       0.06 ±  5%  perf-stat.i.ipc
     88.20           -10.7%      78.73           -11.0%      78.53        perf-stat.i.metric.M/sec
 1.242e+08            +0.9%  1.254e+08            +1.0%  1.255e+08        perf-stat.i.node-load-misses
  76214273            +1.0%   76999051            +1.2%   77103845        perf-stat.i.node-loads
    247.93           +32.1%     327.57 ±  2%     +32.1%     327.56 ±  2%  perf-stat.overall.MPKI
      0.92 ±  4%      +0.2        1.13 ±  5%      +0.2        1.12 ±  5%  perf-stat.overall.branch-miss-rate%
     69.51            +0.9       70.45            +1.0       70.50        perf-stat.overall.cache-miss-rate%
     33.77           +31.3%      44.35 ±  2%     +31.3%      44.35 ±  2%  perf-stat.overall.cpi
      0.01 ±  2%      +0.0        0.02 ± 13%      +0.0        0.02 ±  2%  perf-stat.overall.dTLB-load-miss-rate%
      0.02            -0.0        0.01 ±  2%      -0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
      0.03           -23.9%       0.02 ±  2%     -23.9%       0.02        perf-stat.overall.ipc
 1.084e+09           -24.2%  8.217e+08 ±  2%     -24.2%  8.216e+08 ±  2%  perf-stat.ps.branch-instructions
    154.44            -8.0%     142.02 ±  2%      -8.6%     141.20 ±  2%  perf-stat.ps.cpu-migrations
    163178 ±  3%      -3.1%     158185 ± 12%      -8.0%     150107 ±  2%  perf-stat.ps.dTLB-load-misses
 1.089e+09           -21.1%  8.585e+08           -21.2%  8.581e+08        perf-stat.ps.dTLB-loads
     96861           -31.9%      65975 ±  2%     -32.1%      65796 ±  2%  perf-stat.ps.dTLB-store-misses
 5.503e+08           -13.1%  4.781e+08           -13.2%  4.776e+08        perf-stat.ps.dTLB-stores
 5.447e+09           -23.7%  4.157e+09           -23.7%  4.157e+09        perf-stat.ps.instructions
 1.223e+08            +1.0%  1.235e+08            +1.0%  1.235e+08        perf-stat.ps.node-load-misses
  75118302            +1.1%   75929311            +1.1%   75927016        perf-stat.ps.node-loads
 3.496e+11           -21.7%  2.737e+11           -21.7%  2.739e+11 ±  2%  perf-stat.total.instructions
--j0dMq1itEyhiQLv6
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename="will-it-scale-regression"
Content-Transfer-Encoding: 8bit

(4)
Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: 192G
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/malloc1/will-it-scale

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      3161           +46.4%       4627           +47.5%       4662        vmstat.system.cs
      0.58 ±  2%      +0.7        1.27            +0.7        1.26        mpstat.cpu.all.irq%
      0.55 ±  3%      -0.5        0.09 ±  2%      -0.5        0.09 ±  2%  mpstat.cpu.all.soft%
      1.00 ± 13%      -0.7        0.29            -0.7        0.28        mpstat.cpu.all.usr%
   1231431           -86.7%     164315           -86.7%     163624        will-it-scale.112.processes
     10994           -86.7%       1466           -86.7%       1460        will-it-scale.per_process_ops
   1231431           -86.7%     164315           -86.7%     163624        will-it-scale.workload
      0.03           -66.7%       0.01           -66.7%       0.01        turbostat.IPC
     81.38            -2.8%      79.12            -2.2%      79.62        turbostat.PkgTmp
    764.02           +17.1%     894.78           +17.0%     893.81        turbostat.PkgWatt
     19.80          +135.4%      46.59          +135.1%      46.53        turbostat.RAMWatt
    771.38 ±  5%    +249.5%       2696 ± 14%    +231.9%       2560 ± 10%  perf-c2c.DRAM.local
      3050 ±  5%     -69.8%     922.75 ±  6%     -71.5%     869.88 ±  8%  perf-c2c.DRAM.remote
     11348 ±  4%     -90.2%       1107 ±  5%     -90.6%       1065 ±  3%  perf-c2c.HITM.local
    357.50 ± 21%     -44.0%     200.38 ±  7%     -48.2%     185.25 ± 13%  perf-c2c.HITM.remote
     11706 ±  4%     -88.8%       1307 ±  4%     -89.3%       1250 ±  3%  perf-c2c.HITM.total
 1.717e+08 ±  9%     -85.5%   24955542           -85.5%   24880885        numa-numastat.node0.local_node
 1.718e+08 ±  9%     -85.4%   25046901           -85.5%   24972867        numa-numastat.node0.numa_hit
 1.945e+08 ±  7%     -87.0%   25203631           -87.1%   25104844        numa-numastat.node1.local_node
 1.946e+08 ±  7%     -87.0%   25300536           -87.1%   25180465        numa-numastat.node1.numa_hit
 2.001e+08 ±  2%     -87.5%   25098699           -87.5%   25011079        numa-numastat.node2.local_node
 2.002e+08 ±  2%     -87.4%   25173132           -87.5%   25119438        numa-numastat.node2.numa_hit
 1.956e+08 ±  6%     -87.3%   24922332           -87.3%   24784408        numa-numastat.node3.local_node
 1.957e+08 ±  6%     -87.2%   25008002           -87.3%   24874399        numa-numastat.node3.numa_hit
    766959           -45.9%     414816           -46.2%     412898        meminfo.Active
    766881           -45.9%     414742           -46.2%     412824        meminfo.Active(anon)
    391581           +12.1%     438946            +8.4%     424669        meminfo.AnonPages
    421982           +20.7%     509155           +14.8%     484430        meminfo.Inactive
    421800           +20.7%     508969           +14.8%     484244        meminfo.Inactive(anon)
     68496 ±  7%     +88.9%     129357 ±  2%     +82.9%     125252 ±  2%  meminfo.Mapped
    569270           -24.0%     432709           -24.1%     431884        meminfo.SUnreclaim
    797185           -40.2%     476420           -40.8%     471912        meminfo.Shmem
    730111           -18.8%     593041           -18.9%     592400        meminfo.Slab
    148082 ±  2%     -20.3%     118055 ±  4%     -21.7%     115994 ±  6%  numa-meminfo.node0.SUnreclaim
    197311 ± 16%     -22.5%     152829 ± 19%     -29.8%     138546 ±  9%  numa-meminfo.node0.Slab
    144635 ±  5%     -25.8%     107254 ±  4%     -25.3%     107973 ±  6%  numa-meminfo.node1.SUnreclaim
    137974 ±  2%     -24.5%     104205 ±  6%     -25.7%     102563 ±  4%  numa-meminfo.node2.SUnreclaim
    167889 ± 13%     -26.1%     124127 ±  9%     -15.0%     142771 ± 18%  numa-meminfo.node2.Slab
    607639 ± 20%     -46.2%     326998 ± 15%     -46.8%     323458 ± 13%  numa-meminfo.node3.Active
    607611 ± 20%     -46.2%     326968 ± 15%     -46.8%     323438 ± 13%  numa-meminfo.node3.Active(anon)
    679476 ± 21%     -31.3%     466619 ± 19%     -38.5%     418074 ± 16%  numa-meminfo.node3.FilePages
     20150 ± 22%    +128.4%      46020 ± 11%    +123.0%      44932 ±  8%  numa-meminfo.node3.Mapped
    138148 ±  2%     -25.3%     103148 ±  4%     -23.8%     105326 ±  7%  numa-meminfo.node3.SUnreclaim
    631930 ± 20%     -40.9%     373456 ± 15%     -41.5%     369883 ± 13%  numa-meminfo.node3.Shmem
    166777 ±  7%     -19.6%     134013 ±  9%     -20.7%     132332 ±  7%  numa-meminfo.node3.Slab
     37030 ±  2%     -20.3%      29511 ±  4%     -21.7%      28993 ±  6%  numa-vmstat.node0.nr_slab_unreclaimable
 1.718e+08 ±  9%     -85.4%   25047066           -85.5%   24973455        numa-vmstat.node0.numa_hit
 1.717e+08 ±  9%     -85.5%   24955707           -85.5%   24881472        numa-vmstat.node0.numa_local
     36158 ±  5%     -25.8%      26811 ±  4%     -25.4%      26990 ±  6%  numa-vmstat.node1.nr_slab_unreclaimable
 1.946e+08 ±  7%     -87.0%   25300606           -87.1%   25181038        numa-vmstat.node1.numa_hit
 1.945e+08 ±  7%     -87.0%   25203699           -87.1%   25105417        numa-vmstat.node1.numa_local
     34499 ±  2%     -24.5%      26050 ±  6%     -25.7%      25638 ±  4%  numa-vmstat.node2.nr_slab_unreclaimable
 2.002e+08 ±  2%     -87.4%   25173363           -87.5%   25119830        numa-vmstat.node2.numa_hit
 2.001e+08 ±  2%     -87.5%   25098930           -87.5%   25011471        numa-vmstat.node2.numa_local
    151851 ± 20%     -46.2%      81720 ± 15%     -46.8%      80848 ± 13%  numa-vmstat.node3.nr_active_anon
    169827 ± 21%     -31.3%     116645 ± 19%     -38.5%     104502 ± 16%  numa-vmstat.node3.nr_file_pages
      4991 ± 23%    +131.5%      11555 ± 11%    +125.4%      11249 ±  8%  numa-vmstat.node3.nr_mapped
    157941 ± 20%     -40.9%      93355 ± 15%     -41.5%      92454 ± 13%  numa-vmstat.node3.nr_shmem
     34570 ±  2%     -25.4%      25780 ±  4%     -23.8%      26327 ±  7%  numa-vmstat.node3.nr_slab_unreclaimable
    151851 ± 20%     -46.2%      81720 ± 15%     -46.8%      80848 ± 13%  numa-vmstat.node3.nr_zone_active_anon
 1.957e+08 ±  6%     -87.2%   25008117           -87.3%   24874649        numa-vmstat.node3.numa_hit
 1.956e+08 ±  6%     -87.3%   24922447           -87.3%   24784657        numa-vmstat.node3.numa_local
    191746           -45.9%     103734           -46.2%     103228        proc-vmstat.nr_active_anon
     97888           +12.1%     109757            +8.5%     106185        proc-vmstat.nr_anon_pages
    947825            -8.5%     867659            -8.6%     866533        proc-vmstat.nr_file_pages
    105444           +20.7%     127227           +14.9%     121113        proc-vmstat.nr_inactive_anon
     17130 ±  7%     +88.9%      32365 ±  2%     +83.4%      31420 ±  2%  proc-vmstat.nr_mapped
      4007            +4.2%       4176            +4.1%       4170        proc-vmstat.nr_page_table_pages
    199322           -40.2%     119155           -40.8%     118031        proc-vmstat.nr_shmem
    142294           -24.0%     108161           -24.1%     107954        proc-vmstat.nr_slab_unreclaimable
    191746           -45.9%     103734           -46.2%     103228        proc-vmstat.nr_zone_active_anon
    105444           +20.7%     127223           +14.9%     121106        proc-vmstat.nr_zone_inactive_anon
     40186 ± 13%     +65.0%      66320 ±  5%     +60.2%      64374 ± 13%  proc-vmstat.numa_hint_faults
     20248 ± 39%    +108.3%      42185 ± 12%    +102.6%      41033 ± 10%  proc-vmstat.numa_hint_faults_local
 7.623e+08           -86.8%  1.005e+08           -86.9%  1.002e+08        proc-vmstat.numa_hit
  7.62e+08           -86.9%  1.002e+08           -86.9%   99786408        proc-vmstat.numa_local
    181538 ±  6%     +49.5%     271428 ±  3%     +48.9%     270328 ±  6%  proc-vmstat.numa_pte_updates
    152652 ±  7%     -28.6%     108996           -29.6%     107396        proc-vmstat.pgactivate
 7.993e+08         +3068.4%  2.533e+10         +3055.6%  2.522e+10        proc-vmstat.pgalloc_normal
  3.72e+08           -86.4%   50632612           -86.4%   50429200        proc-vmstat.pgfault
  7.99e+08         +3069.7%  2.533e+10         +3056.9%  2.522e+10        proc-vmstat.pgfree
     48.75 ±  2%    +1e+08%   49362627          +1e+08%   49162408        proc-vmstat.thp_fault_alloc
  21789703 ± 10%     -20.1%   17410551 ±  7%     -18.9%   17673460 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
    427573 ± 99%   +1126.7%    5245182 ± 17%   +1104.4%    5149659 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.min
   4757464 ± 10%     -48.3%    2458136 ± 19%     -46.6%    2539001 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.44 ±  2%     -15.9%       0.37 ±  2%     -16.6%       0.37 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
    299205 ± 38%     +59.3%     476493 ± 27%     +50.6%     450561 ± 42%  sched_debug.cfs_rq:/.load.max
  21789703 ± 10%     -20.1%   17410551 ±  7%     -18.9%   17673460 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
    427573 ± 99%   +1126.7%    5245182 ± 17%   +1104.4%    5149659 ± 13%  sched_debug.cfs_rq:/.min_vruntime.min
   4757464 ± 10%     -48.3%    2458136 ± 19%     -46.6%    2539001 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.44 ±  2%     -16.0%       0.37 ±  2%     -17.2%       0.36 ±  2%  sched_debug.cfs_rq:/.nr_running.stddev
    446.75 ±  2%     -18.4%     364.71 ±  2%     -19.3%     360.46 ±  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
    445.25 ±  2%     -18.4%     363.46 ±  2%     -19.3%     359.33 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
    946.71 ±  3%     -14.7%     807.54 ±  4%     -15.4%     800.58 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.max
    281.39 ±  7%     -31.2%     193.63 ±  4%     -32.0%     191.24 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
   1131635 ±  7%     +73.7%    1965577 ±  6%     +76.5%    1997455 ±  7%  sched_debug.cpu.avg_idle.max
    223539 ± 16%    +165.4%     593172 ±  7%    +146.0%     549906 ± 11%  sched_debug.cpu.avg_idle.min
     83325 ±  4%     +64.3%     136927 ±  9%     +69.7%     141399 ± 11%  sched_debug.cpu.avg_idle.stddev
     17.57 ±  6%    +594.5%     122.01 ±  3%    +588.0%     120.88 ±  3%  sched_debug.cpu.clock.stddev
    873.33           -11.1%     776.19           -11.8%     770.20        sched_debug.cpu.clock_task.stddev
      2870           -18.1%       2351           -17.4%       2371        sched_debug.cpu.curr->pid.avg
      3003           -12.5%       2627           -12.4%       2630        sched_debug.cpu.curr->pid.stddev
    550902 ±  6%     +74.4%     960871 ±  6%     +79.8%     990291 ±  8%  sched_debug.cpu.max_idle_balance_cost.max
      4451 ± 59%   +1043.9%      50917 ± 15%   +1129.4%      54721 ± 15%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 17%    +385.8%       0.00 ± 34%    +315.7%       0.00 ±  3%  sched_debug.cpu.next_balance.stddev
      0.43           -17.5%       0.35           -16.8%       0.35        sched_debug.cpu.nr_running.avg
      1.15 ±  8%     +25.0%       1.44 ±  8%     +30.4%       1.50 ± 13%  sched_debug.cpu.nr_running.max
      0.45           -14.4%       0.39           -14.2%       0.39 ±  2%  sched_debug.cpu.nr_running.stddev
      3280 ±  5%     +32.5%       4345           +34.5%       4412        sched_debug.cpu.nr_switches.avg
    846.82 ± 11%    +109.9%       1777 ± 12%    +112.4%       1799 ±  4%  sched_debug.cpu.nr_switches.min
      0.03 ±173%    +887.2%       0.30 ± 73%    +521.1%       0.19 ± 35%  sched_debug.rt_rq:.rt_time.avg
      6.79 ±173%    +887.2%      67.01 ± 73%    +521.1%      42.16 ± 35%  sched_debug.rt_rq:.rt_time.max
      0.45 ±173%    +887.2%       4.47 ± 73%    +521.1%       2.81 ± 35%  sched_debug.rt_rq:.rt_time.stddev
      4.65           +28.0%       5.96           +28.5%       5.98        perf-stat.i.MPKI
 8.721e+09           -71.0%  2.532e+09           -71.1%  2.523e+09        perf-stat.i.branch-instructions
      0.34            +0.1        0.48            +0.1        0.48        perf-stat.i.branch-miss-rate%
  30145441           -58.6%   12471062           -58.6%   12487542        perf-stat.i.branch-misses
     33.52           -15.3       18.20           -15.2       18.27        perf-stat.i.cache-miss-rate%
 1.819e+08           -58.8%   74947458           -58.8%   74903072        perf-stat.i.cache-misses
 5.429e+08 ±  2%     -24.1%  4.123e+08           -24.4%  4.103e+08        perf-stat.i.cache-references
      3041           +48.6%       4518           +49.7%       4552        perf-stat.i.context-switches
     10.96          +212.9%      34.28          +214.1%      34.41        perf-stat.i.cpi
    309.29           -11.2%     274.59           -11.3%     274.20        perf-stat.i.cpu-migrations
      2354          +144.6%       5758          +144.7%       5761        perf-stat.i.cycles-between-cache-misses
      0.13            -0.1        0.01 ±  3%      -0.1        0.01 ±  3%  perf-stat.i.dTLB-load-miss-rate%
  12852209 ±  2%     -98.0%     261197 ±  3%     -97.9%     263864 ±  3%  perf-stat.i.dTLB-load-misses
  9.56e+09           -69.3%  2.932e+09           -69.4%  2.922e+09        perf-stat.i.dTLB-loads
      0.12            -0.1        0.03            -0.1        0.03        perf-stat.i.dTLB-store-miss-rate%
   5083186           -86.3%     693971           -86.4%     690328        perf-stat.i.dTLB-store-misses
 4.209e+09           -44.9%  2.317e+09           -45.2%  2.308e+09        perf-stat.i.dTLB-stores
     76.33           -39.7       36.61           -39.7       36.59        perf-stat.i.iTLB-load-miss-rate%
  18717931           -80.1%    3715941           -80.2%    3698121        perf-stat.i.iTLB-load-misses
   5758034            +7.7%    6202790            +7.4%    6183041        perf-stat.i.iTLB-loads
 3.914e+10           -67.8%  1.261e+10           -67.9%  1.256e+10        perf-stat.i.instructions
      2107           +73.9%       3663           +73.6%       3658        perf-stat.i.instructions-per-iTLB-miss
      0.09           -67.9%       0.03           -68.1%       0.03        perf-stat.i.ipc
    269.39           +10.6%     297.91           +10.7%     298.33        perf-stat.i.metric.K/sec
    102.78           -64.5%      36.54           -64.6%      36.40        perf-stat.i.metric.M/sec
   1234832           -86.4%     167556           -86.5%     166848        perf-stat.i.minor-faults
     87.25           -41.9       45.32           -42.2       45.09        perf-stat.i.node-load-miss-rate%
  25443233           -83.0%    4326696 ±  3%     -83.4%    4227985 ±  2%  perf-stat.i.node-load-misses
   3723342 ±  3%     +45.4%    5414430           +44.3%    5372545        perf-stat.i.node-loads
     79.20           -74.4        4.78           -74.5        4.74        perf-stat.i.node-store-miss-rate%
  14161911 ±  2%     -83.1%    2394469           -83.2%    2382317        perf-stat.i.node-store-misses
   3727955 ±  3%   +1181.6%   47776544         +1188.5%   48035797        perf-stat.i.node-stores
   1234832           -86.4%     167556           -86.5%     166849        perf-stat.i.page-faults
      4.65           +28.0%       5.95           +28.4%       5.97        perf-stat.overall.MPKI
      0.35            +0.1        0.49            +0.1        0.49        perf-stat.overall.branch-miss-rate%
     33.51           -15.3       18.19           -15.3       18.26        perf-stat.overall.cache-miss-rate%
     10.94          +212.3%      34.16          +213.4%      34.28        perf-stat.overall.cpi
      2354          +143.9%       5741          +144.1%       5746        perf-stat.overall.cycles-between-cache-misses
      0.13            -0.1        0.01 ±  3%      -0.1        0.01 ±  5%  perf-stat.overall.dTLB-load-miss-rate%
      0.12            -0.1        0.03            -0.1        0.03        perf-stat.overall.dTLB-store-miss-rate%
     76.49           -39.2       37.31           -39.2       37.29        perf-stat.overall.iTLB-load-miss-rate%
      2090           +63.4%       3416           +63.5%       3417        perf-stat.overall.instructions-per-iTLB-miss
      0.09           -68.0%       0.03           -68.1%       0.03        perf-stat.overall.ipc
     87.22           -43.1       44.12 ±  2%     -43.5       43.76        perf-stat.overall.node-load-miss-rate%
     79.16           -74.4        4.77           -74.4        4.72        perf-stat.overall.node-store-miss-rate%
   9549728          +140.9%   23005172          +141.1%   23022843        perf-stat.overall.path-length
 8.691e+09           -71.0%  2.519e+09           -71.1%   2.51e+09        perf-stat.ps.branch-instructions
  30118940           -59.1%   12319517           -59.1%   12327993        perf-stat.ps.branch-misses
 1.813e+08           -58.8%   74623919           -58.9%   74563289        perf-stat.ps.cache-misses
  5.41e+08 ±  2%     -24.2%  4.103e+08           -24.5%  4.085e+08        perf-stat.ps.cache-references
      3031           +47.9%       4485           +49.1%       4519        perf-stat.ps.context-switches
    307.72           -12.7%     268.59           -12.7%     268.66        perf-stat.ps.cpu-migrations
  12806734 ±  2%     -98.0%     260740 ±  4%     -97.9%     267782 ±  5%  perf-stat.ps.dTLB-load-misses
 9.528e+09           -69.4%  2.917e+09           -69.5%  2.907e+09        perf-stat.ps.dTLB-loads
   5063992           -86.4%     690720           -86.4%     687415        perf-stat.ps.dTLB-store-misses
 4.195e+09           -45.0%  2.306e+09           -45.2%  2.297e+09        perf-stat.ps.dTLB-stores
  18661026           -80.3%    3672024           -80.4%    3658006        perf-stat.ps.iTLB-load-misses
   5735379            +7.6%    6169096            +7.3%    6151755        perf-stat.ps.iTLB-loads
 3.901e+10           -67.8%  1.254e+10           -68.0%   1.25e+10        perf-stat.ps.instructions
   1230175           -86.4%     166708           -86.5%     166045        perf-stat.ps.minor-faults
  25346347           -83.0%    4299946 ±  2%     -83.4%    4203636 ±  2%  perf-stat.ps.node-load-misses
   3713652 ±  3%     +46.6%    5444481           +45.5%    5401831        perf-stat.ps.node-loads
  14107969 ±  2%     -83.1%    2381707           -83.2%    2368146        perf-stat.ps.node-store-misses
   3716359 ±  3%   +1179.6%   47556224         +1186.1%   47797289        perf-stat.ps.node-stores
   1230175           -86.4%     166708           -86.5%     166046        perf-stat.ps.page-faults
 1.176e+13           -67.9%   3.78e+12           -68.0%  3.767e+12        perf-stat.total.instructions
      0.01 ± 42%    +385.1%       0.03 ±  8%    +566.0%       0.04 ± 42%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ± 17%    +354.3%       0.05 ±  8%    +402.1%       0.06 ±  8%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 19%    +323.1%       0.06 ± 27%    +347.1%       0.06 ± 17%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 14%  +2.9e+05%      25.06 ±172%  +1.6e+05%      13.94 ±263%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ±129%   +7133.3%       0.03 ±  7%   +7200.0%       0.03 ±  4%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ±  8%    +396.8%       0.06 ±  2%    +402.1%       0.06 ±  2%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±  9%    +256.9%       0.03 ± 10%    +232.8%       0.02 ± 13%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 15%    +324.0%       0.05 ± 17%    +320.8%       0.05 ± 17%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ± 19%    +338.6%       0.06 ±  7%    +305.0%       0.05 ±  8%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±  9%    +298.4%       0.03 ±  2%    +304.8%       0.03        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ±  7%    +265.8%       0.03 ±  5%  +17282.9%       1.65 ±258%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.19 ± 11%     -89.3%       0.02 ± 10%     -89.4%       0.02 ± 10%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 28%    +319.8%       0.05 ± 19%    +303.0%       0.05 ± 18%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ± 14%    +338.9%       0.03 ±  9%    +318.5%       0.03 ±  4%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.02 ± 20%    +674.2%       0.12 ±137%    +267.5%       0.06 ± 15%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ± 46%    +256.9%       0.03 ± 11%   +1095.8%       0.11 ±112%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.02 ± 28%    +324.6%       0.07 ±  8%    +353.2%       0.07 ±  9%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ± 21%    +318.4%       0.07 ± 25%    +389.6%       0.08 ± 26%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 26%  +1.9e+06%     250.13 ±173%  +9.7e+05%     125.09 ±264%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.02 ± 25%    +585.6%       0.11 ± 63%    +454.5%       0.09 ± 31%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.04 ± 39%    +159.0%       0.11 ±  6%    +190.0%       0.13 ± 10%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ± 29%    +312.9%       0.06 ± 19%    +401.7%       0.07 ± 13%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.02 ± 25%    +216.8%       0.06 ± 36%    +166.4%       0.05 ±  7%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 21%    +345.8%       0.07 ± 26%    +298.3%       0.06 ± 18%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.03 ± 35%    +190.2%       0.07 ± 16%    +187.8%       0.07 ± 11%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 ± 19%    +220.8%       0.07 ± 23%  +2.9e+05%      63.06 ±263%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4.60 ±  5%     -10.7%       4.11 ±  8%     -13.4%       3.99        perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 32%    +368.0%       0.07 ± 25%    +346.9%       0.07 ± 20%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    189.60           -32.9%     127.16           -33.0%     126.98        perf-sched.total_wait_and_delay.average.ms
     11265 ±  3%     +73.7%      19568 ±  3%     +71.1%      19274        perf-sched.total_wait_and_delay.count.ms
    189.18           -32.9%     126.97           -33.0%     126.81        perf-sched.total_wait_time.average.ms
      0.50 ± 20%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.50 ± 11%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.constprop
      0.43 ± 16%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
     52.33 ± 31%    +223.4%     169.23 ±  7%    +226.5%     170.86 ±  2%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.51 ± 18%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     28.05 ±  4%     +27.8%      35.84 ±  4%     +26.0%      35.34 ±  8%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      2.08 ±  3%     +33.2%       2.76           +32.9%       2.76 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    491.80           -53.6%     227.96 ±  3%     -53.5%     228.58 ±  2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    222.00 ±  9%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      8.75 ± 33%     -84.3%       1.38 ±140%     -82.9%       1.50 ± 57%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1065 ±  3%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.constprop
    538.25 ±  9%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.unmap_region.constprop.0
    307.75 ±  6%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2458 ±  3%     -20.9%       1944 ±  4%     -20.5%       1954 ±  7%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      2577 ±  5%    +168.6%       6921 ±  4%    +165.0%       6829 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.07 ±172%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1730 ± 24%     -77.9%     382.66 ±117%     -50.1%     862.68 ± 89%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     34.78 ± 43%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.constprop
      8.04 ±179%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      9.47 ±134%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      3.96 ±  6%     +60.6%       6.36 ±  5%     +58.3%       6.27 ±  6%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.42 ± 27%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc
      0.50 ± 20%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.51 ± 17%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.59 ± 17%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.46 ± 31%     -63.3%       0.17 ± 18%     -67.7%       0.15 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.50 ± 11%     -67.8%       0.16 ±  8%     -67.6%       0.16 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.constprop
      0.43 ± 16%     -63.5%       0.16 ± 10%     -62.6%       0.16 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      0.50 ± 19%     -67.0%       0.17 ±  5%     -69.0%       0.16 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.71 ±  5%     +55.9%       2.66 ±  3%     +47.3%       2.52 ±  6%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     52.33 ± 31%    +223.4%     169.20 ±  7%    +226.5%     170.83 ±  2%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.51 ± 18%     -67.7%       0.16 ±  5%     -68.0%       0.16 ±  6%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.53 ± 17%     -65.4%       0.18 ± 56%     -66.5%       0.18 ± 10%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     27.63 ±  4%     +29.7%      35.83 ±  4%     +27.6%      35.27 ±  8%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      2.07 ±  3%     +32.1%       2.73           +31.9%       2.73 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    491.61           -53.6%     227.94 ±  3%     -53.5%     228.56 ±  2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.72 ±  5%     +58.1%       2.73 ±  3%     +50.4%       2.59 ±  7%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.42 ± 21%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc
      7.07 ±172%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.66 ± 27%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      2.05 ± 57%    -100.0%       0.00          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      1.69 ± 20%     -84.6%       0.26 ± 25%     -86.0%       0.24 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      1730 ± 24%     -76.3%     409.21 ±104%     -50.1%     862.65 ± 89%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     34.78 ± 43%     -98.9%       0.38 ± 12%     -98.8%       0.41 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.constprop
      8.04 ±179%     -96.0%       0.32 ± 18%     -95.7%       0.35 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      4.68 ±155%     -93.4%       0.31 ± 24%     -93.9%       0.28 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.42 ±  5%     +55.9%       5.33 ±  3%     +47.3%       5.03 ±  6%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      9.47 ±134%     -96.3%       0.35 ± 17%     -96.1%       0.37 ±  8%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      1.87 ± 10%     -60.9%       0.73 ±164%     -85.3%       0.28 ± 24%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.39 ±185%     -97.8%       0.05 ±165%     -98.0%       0.05 ±177%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3.95 ±  6%     +59.9%       6.32 ±  5%     +57.6%       6.23 ±  6%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.45 ±  5%     +58.1%       5.45 ±  3%     +50.4%       5.19 ±  7%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
     56.55 ±  2%     -55.1        1.45 ±  2%     -55.1        1.44 ±  2%  perf-profile.calltrace.cycles-pp.__munmap
     56.06 ±  2%     -55.1        0.96 ±  2%     -55.1        0.96 ±  2%  perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     56.50 ±  2%     -55.1        1.44           -55.1        1.44 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     56.50 ±  2%     -55.1        1.44 ±  2%     -55.1        1.43 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     56.47 ±  2%     -55.0        1.43           -55.0        1.42 ±  2%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     56.48 ±  2%     -55.0        1.44 ±  2%     -55.0        1.43 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     56.45 ±  2%     -55.0        1.42           -55.0        1.42 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     56.40 ±  2%     -55.0        1.40 ±  2%     -55.0        1.39 ±  2%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     35.28           -34.6        0.66           -34.6        0.66        perf-profile.calltrace.cycles-pp.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     35.17           -34.6        0.57           -34.6        0.57 ±  2%  perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap
     35.11           -34.5        0.57           -34.5        0.56        perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
     18.40 ±  7%     -18.4        0.00           -18.4        0.00        perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     17.42 ±  7%     -17.4        0.00           -17.4        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     17.42 ±  7%     -17.4        0.00           -17.4        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.do_vmi_align_munmap.do_vmi_munmap
     17.41 ±  7%     -17.4        0.00           -17.4        0.00        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_region.do_vmi_align_munmap
     17.23 ±  6%     -17.2        0.00           -17.2        0.00        perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge_list.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region
     16.09 ±  8%     -16.1        0.00           -16.1        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region
     16.02 ±  8%     -16.0        0.00           -16.0        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_region
     15.95 ±  8%     -16.0        0.00           -16.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb_batch_pages_flush.tlb_finish_mmu
     15.89 ±  8%     -15.9        0.00           -15.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb_batch_pages_flush
     15.86 ±  8%     -15.9        0.00           -15.9        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain
     15.82 ±  8%     -15.8        0.00           -15.8        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
      9.32 ±  9%      -9.3        0.00            -9.3        0.00        perf-profile.calltrace.cycles-pp.uncharge_folio.__mem_cgroup_uncharge_list.release_pages.tlb_batch_pages_flush.tlb_finish_mmu
      8.52 ±  8%      -8.5        0.00            -8.5        0.00        perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      7.90 ±  4%      -7.9        0.00            -7.9        0.00        perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge_list.release_pages.tlb_batch_pages_flush.tlb_finish_mmu
      7.56 ±  6%      -7.6        0.00            -7.6        0.00        perf-profile.calltrace.cycles-pp.__pte_alloc.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      7.55 ±  6%      -7.6        0.00            -7.6        0.00        perf-profile.calltrace.cycles-pp.pte_alloc_one.__pte_alloc.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      6.51 ±  8%      -6.5        0.00            -6.5        0.00        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.pte_alloc_one.__pte_alloc.do_anonymous_page.__handle_mm_fault
      6.51 ±  8%      -6.5        0.00            -6.5        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc.do_anonymous_page
      6.41 ±  8%      -6.4        0.00            -6.4        0.00        perf-profile.calltrace.cycles-pp.__memcg_kmem_charge_page.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc
      0.00            +0.5        0.54 ±  4%      +0.6        0.55 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page
      0.00            +0.7        0.70 ±  3%      +0.7        0.71 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault
      0.00            +1.4        1.39            +1.4        1.38 ±  3%  perf-profile.calltrace.cycles-pp.__cond_resched.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
     19.16 ±  6%     +57.0       76.21           +57.5       76.66        perf-profile.calltrace.cycles-pp.asm_exc_page_fault
     19.09 ±  6%     +57.1       76.16           +57.5       76.61        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     19.10 ±  6%     +57.1       76.17           +57.5       76.61        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
     18.99 ±  6%     +57.1       76.14           +57.6       76.58        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     18.43 ±  7%     +57.7       76.11           +58.1       76.56        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00           +73.0       73.00           +73.5       73.46        perf-profile.calltrace.cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00           +75.1       75.15           +75.6       75.60        perf-profile.calltrace.cycles-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00           +75.9       75.92           +76.4       76.37        perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     58.03 ±  2%     -56.0        2.05           -56.0        2.03        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     58.02 ±  2%     -56.0        2.04           -56.0        2.02        perf-profile.children.cycles-pp.do_syscall_64
     56.57 ±  2%     -55.1        1.45 ±  2%     -55.1        1.45 ±  2%  perf-profile.children.cycles-pp.__munmap
     56.06 ±  2%     -55.1        0.97           -55.1        0.96        perf-profile.children.cycles-pp.unmap_region
     56.51 ±  2%     -55.1        1.43           -55.1        1.42 ±  2%  perf-profile.children.cycles-pp.do_vmi_munmap
     56.48 ±  2%     -55.0        1.43 ±  2%     -55.0        1.43 ±  2%  perf-profile.children.cycles-pp.__vm_munmap
     56.48 ±  2%     -55.0        1.44 ±  2%     -55.0        1.43 ±  2%  perf-profile.children.cycles-pp.__x64_sys_munmap
     56.40 ±  2%     -55.0        1.40           -55.0        1.39 ±  2%  perf-profile.children.cycles-pp.do_vmi_align_munmap
     35.28           -34.6        0.66           -34.6        0.66        perf-profile.children.cycles-pp.tlb_finish_mmu
     35.18           -34.6        0.58           -34.6        0.57        perf-profile.children.cycles-pp.tlb_batch_pages_flush
     35.16           -34.6        0.57           -34.6        0.57        perf-profile.children.cycles-pp.release_pages
     32.12 ±  8%     -32.1        0.05           -32.1        0.04 ± 37%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     31.85 ±  8%     -31.8        0.06           -31.8        0.06 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     31.74 ±  8%     -31.7        0.00           -31.7        0.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     18.40 ±  7%     -18.4        0.00           -18.4        0.00        perf-profile.children.cycles-pp.do_anonymous_page
     17.43 ±  7%     -17.4        0.00           -17.4        0.00        perf-profile.children.cycles-pp.lru_add_drain
     17.43 ±  7%     -17.4        0.00           -17.4        0.00        perf-profile.children.cycles-pp.lru_add_drain_cpu
     17.43 ±  7%     -17.3        0.10 ±  5%     -17.3        0.10 ±  3%  perf-profile.children.cycles-pp.folio_batch_move_lru
     17.23 ±  6%     -17.2        0.00           -17.2        0.00        perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      9.32 ±  9%      -9.3        0.00            -9.3        0.00        perf-profile.children.cycles-pp.uncharge_folio
      8.57 ±  8%      -8.4        0.16 ±  4%      -8.4        0.15 ±  4%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      7.90 ±  4%      -7.8        0.14 ±  5%      -7.8        0.14 ±  4%  perf-profile.children.cycles-pp.uncharge_batch
      7.57 ±  6%      -7.6        0.00            -7.6        0.00        perf-profile.children.cycles-pp.__pte_alloc
      7.55 ±  6%      -7.4        0.16 ±  3%      -7.4        0.16 ±  3%  perf-profile.children.cycles-pp.pte_alloc_one
      6.54 ±  2%      -6.5        0.00            -6.5        0.00        perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      6.59 ±  8%      -6.4        0.22 ±  2%      -6.4        0.22 ±  3%  perf-profile.children.cycles-pp.alloc_pages_mpol
      6.58 ±  8%      -6.4        0.21 ±  2%      -6.4        0.22 ±  2%  perf-profile.children.cycles-pp.__alloc_pages
      6.41 ±  8%      -6.3        0.07 ±  5%      -6.3        0.07 ±  5%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      4.48 ±  2%      -4.3        0.18 ±  4%      -4.3        0.18 ±  3%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      3.08 ±  4%      -3.0        0.09 ±  7%      -3.0        0.09 ±  6%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.74 ±  8%      -1.6        0.10            -1.6        0.10 ±  4%  perf-profile.children.cycles-pp.kmem_cache_alloc
      1.72 ±  2%      -1.5        0.23 ±  2%      -1.5        0.23 ±  4%  perf-profile.children.cycles-pp.unmap_vmas
      1.71 ±  2%      -1.5        0.22 ±  3%      -1.5        0.22 ±  4%  perf-profile.children.cycles-pp.unmap_page_range
      1.70 ±  2%      -1.5        0.21 ±  3%      -1.5        0.21 ±  4%  perf-profile.children.cycles-pp.zap_pmd_range
      1.36 ± 16%      -1.3        0.09 ±  4%      -1.3        0.09 ±  4%  perf-profile.children.cycles-pp.native_irq_return_iret
      1.18 ±  2%      -1.1        0.08 ±  7%      -1.1        0.08 ±  5%  perf-profile.children.cycles-pp.page_remove_rmap
      1.16 ±  2%      -1.1        0.08 ±  4%      -1.1        0.07 ±  6%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      1.45 ±  6%      -1.0        0.44 ±  2%      -1.0        0.44 ±  2%  perf-profile.children.cycles-pp.__mmap
      1.05            -1.0        0.06 ±  7%      -1.0        0.06 ±  7%  perf-profile.children.cycles-pp.lru_add_fn
      1.03 ±  7%      -1.0        0.04 ± 37%      -1.0        0.04 ± 37%  perf-profile.children.cycles-pp.__anon_vma_prepare
      1.38 ±  6%      -1.0        0.42 ±  3%      -1.0        0.42 ±  2%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      1.33 ±  6%      -0.9        0.40 ±  2%      -0.9        0.40 ±  2%  perf-profile.children.cycles-pp.do_mmap
      0.93 ± 11%      -0.9        0.03 ± 77%      -0.9        0.02 ±100%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      1.17 ±  7%      -0.8        0.34 ±  2%      -0.8        0.34 ±  2%  perf-profile.children.cycles-pp.mmap_region
      0.87 ±  5%      -0.8        0.06 ±  5%      -0.8        0.06 ±  9%  perf-profile.children.cycles-pp.kmem_cache_free
      0.89 ±  5%      -0.7        0.19 ±  4%      -0.7        0.20 ±  2%  perf-profile.children.cycles-pp.rcu_do_batch
      0.89 ±  5%      -0.7        0.20 ±  4%      -0.7        0.20 ±  3%  perf-profile.children.cycles-pp.rcu_core
      0.90 ±  5%      -0.7        0.21 ±  4%      -0.7        0.21 ±  2%  perf-profile.children.cycles-pp.__do_softirq
      0.74 ±  6%      -0.7        0.06 ±  5%      -0.7        0.06 ±  8%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.72 ± 10%      -0.7        0.06 ±  5%      -0.7        0.06 ±  7%  perf-profile.children.cycles-pp.vm_area_alloc
      1.01 ±  4%      -0.4        0.61 ±  4%      -0.4        0.61 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.14 ±  5%      -0.1        0.02 ±100%      -0.1        0.02 ±100%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.16 ±  9%      -0.1        0.07 ±  7%      -0.1        0.07        perf-profile.children.cycles-pp.__slab_free
      0.15 ±  3%      -0.1        0.06 ±  5%      -0.1        0.06 ±  5%  perf-profile.children.cycles-pp.get_unmapped_area
      0.08 ± 22%      -0.0        0.05 ± 41%      -0.0        0.04 ± 37%  perf-profile.children.cycles-pp.generic_perform_write
      0.08 ± 22%      -0.0        0.05 ± 41%      -0.0        0.04 ± 38%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.09 ± 22%      -0.0        0.05 ± 43%      -0.0        0.05 ±  9%  perf-profile.children.cycles-pp.record__pushfn
      0.09 ± 22%      -0.0        0.05 ± 43%      -0.0        0.05 ±  9%  perf-profile.children.cycles-pp.writen
      0.09 ± 22%      -0.0        0.05 ± 43%      -0.0        0.05 ±  9%  perf-profile.children.cycles-pp.__libc_write
      0.11 ±  8%      -0.0        0.07 ±  6%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.16 ±  7%      -0.0        0.13 ±  4%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.09 ± 22%      -0.0        0.07 ± 18%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.vfs_write
      0.09 ± 22%      -0.0        0.07 ± 18%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.ksys_write
      0.15 ±  4%      -0.0        0.13 ±  3%      -0.0        0.13 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.09            -0.0        0.08 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.06            +0.0        0.09 ±  4%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.rcu_all_qs
      0.17 ±  6%      +0.0        0.20 ±  4%      +0.0        0.20 ±  3%  perf-profile.children.cycles-pp.kthread
      0.17 ±  6%      +0.0        0.20 ±  4%      +0.0        0.20 ±  3%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.17 ±  6%      +0.0        0.20 ±  4%      +0.0        0.20 ±  3%  perf-profile.children.cycles-pp.ret_from_fork
      0.12 ±  4%      +0.0        0.16 ±  3%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.08 ±  6%      +0.0        0.12 ±  2%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.vma_alloc_folio
      0.00            +0.0        0.04 ± 37%      +0.1        0.05        perf-profile.children.cycles-pp.memcg_check_events
      0.00            +0.0        0.04 ± 37%      +0.1        0.05        perf-profile.children.cycles-pp.thp_get_unmapped_area
      0.00            +0.1        0.05            +0.0        0.04 ± 57%  perf-profile.children.cycles-pp.free_tail_page_prepare
      0.00            +0.1        0.05            +0.1        0.05        perf-profile.children.cycles-pp.mas_destroy
      0.00            +0.1        0.05 ±  9%      +0.1        0.05 ±  9%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.06 ±  7%      +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.native_flush_tlb_one_user
      0.00            +0.1        0.07 ±  7%      +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.__page_cache_release
      0.00            +0.1        0.07 ±  4%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mas_topiary_replace
      0.08 ±  5%      +0.1        0.16 ±  3%      +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.mas_alloc_nodes
      0.00            +0.1        0.08 ±  4%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.prep_compound_page
      0.08 ±  6%      +0.1        0.17 ±  5%      +0.1        0.18 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.10 ±  5%      +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.folio_add_lru_vma
      0.00            +0.1        0.11 ±  4%      +0.1        0.11 ±  5%  perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.00            +0.1        0.12 ±  2%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk
      0.00            +0.1        0.13 ±  3%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.mas_split
      0.00            +0.1        0.13            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
      0.11 ±  4%      +0.1        0.24 ±  3%      +0.1        0.25 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +0.1        0.14 ±  4%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.00            +0.1        0.14 ±  3%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.mas_wr_bnode
      0.00            +0.1        0.14 ±  5%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.destroy_large_folio
      0.00            +0.1        0.15 ±  4%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.mas_spanning_rebalance
      0.00            +0.1        0.15 ±  2%      +0.2        0.15 ±  4%  perf-profile.children.cycles-pp.zap_huge_pmd
      0.00            +0.2        0.17 ±  3%      +0.2        0.17 ±  3%  perf-profile.children.cycles-pp.do_huge_pmd_anonymous_page
      0.19 ±  3%      +0.2        0.38            +0.2        0.38 ±  2%  perf-profile.children.cycles-pp.mas_store_gfp
      0.00            +0.2        0.19 ±  3%      +0.2        0.18 ±  4%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.2        0.20 ±  3%      +0.2        0.20 ±  4%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.12 ±  3%      +0.2        0.35            +0.2        0.36 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.12 ±  3%      +0.2        0.36 ±  2%      +0.2        0.36 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.14 ±  3%      +0.2        0.39            +0.3        0.40 ±  4%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.27 ±  2%      +0.3        0.52 ±  3%      +0.3        0.52 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.27 ±  2%      +0.3        0.52 ±  4%      +0.3        0.53 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.21 ±  4%      +0.3        0.48 ±  3%      +0.3        0.48 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.3        0.31 ±  2%      +0.3        0.31 ±  3%  perf-profile.children.cycles-pp.mas_wr_spanning_store
      0.00            +0.4        0.38            +0.4        0.38 ±  2%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.00            +0.4        0.39            +0.4        0.40        perf-profile.children.cycles-pp.free_unref_page
      0.13 ±  4%      +1.3        1.42            +1.3        1.41 ±  3%  perf-profile.children.cycles-pp.__cond_resched
     19.19 ±  6%     +57.0       76.23           +57.5       76.68        perf-profile.children.cycles-pp.asm_exc_page_fault
     19.11 ±  6%     +57.1       76.18           +57.5       76.63        perf-profile.children.cycles-pp.exc_page_fault
     19.10 ±  6%     +57.1       76.18           +57.5       76.62        perf-profile.children.cycles-pp.do_user_addr_fault
     19.00 ±  6%     +57.1       76.15           +57.6       76.59        perf-profile.children.cycles-pp.handle_mm_fault
     18.44 ±  7%     +57.7       76.12           +58.1       76.57        perf-profile.children.cycles-pp.__handle_mm_fault
      0.06 ±  9%     +73.3       73.38           +73.8       73.84        perf-profile.children.cycles-pp.clear_page_erms
      0.00           +75.2       75.25           +75.7       75.70        perf-profile.children.cycles-pp.clear_huge_page
      0.00           +75.9       75.92           +76.4       76.37        perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
     31.74 ±  8%     -31.7        0.00           -31.7        0.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      9.22 ±  9%      -9.2        0.00            -9.2        0.00        perf-profile.self.cycles-pp.uncharge_folio
      6.50 ±  2%      -6.5        0.00            -6.5        0.00        perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      5.56 ±  9%      -5.6        0.00            -5.6        0.00        perf-profile.self.cycles-pp.__memcg_kmem_charge_page
      1.94 ±  4%      -1.9        0.08 ±  8%      -1.9        0.08 ±  7%  perf-profile.self.cycles-pp.page_counter_uncharge
      1.36 ± 16%      -1.3        0.09 ±  4%      -1.3        0.09 ±  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.16 ±  9%      -0.1        0.07 ±  7%      -0.1        0.07        perf-profile.self.cycles-pp.__slab_free
      0.10 ±  8%      -0.0        0.07 ±  6%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.07 ±  7%      +0.0        0.08 ±  5%      +0.0        0.08 ±  7%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.00            +0.1        0.06 ±  7%      +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.01 ±264%      +0.1        0.07 ±  4%      +0.1        0.07        perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.1        0.07 ±  4%      +0.1        0.07 ±  4%  perf-profile.self.cycles-pp.__do_huge_pmd_anonymous_page
      0.00            +0.1        0.08 ±  6%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.prep_compound_page
      0.00            +0.1        0.08 ±  5%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      0.00            +0.1        0.13 ±  2%      +0.1        0.13 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.2        0.18 ±  3%      +0.2        0.18 ±  4%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.3        0.30 ±  2%      +0.3        0.30        perf-profile.self.cycles-pp.free_unref_page_prepare
      0.00            +0.6        0.58 ±  3%      +0.6        0.58 ±  5%  perf-profile.self.cycles-pp.clear_huge_page
      0.08 ±  4%      +1.2        1.25            +1.2        1.24 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.05 ±  9%     +72.8       72.81           +73.2       73.26        perf-profile.self.cycles-pp.clear_page_erms
--j0dMq1itEyhiQLv6
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename="phoronix-regressions"
Content-Transfer-Encoding: 8bit

(10)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Add/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      6787            -2.9%       6592            -2.9%       6589        vmstat.system.cs
      0.18 ± 23%      -0.0        0.15 ± 44%      -0.1        0.12 ± 23%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.08 ± 49%      +0.1        0.15 ± 16%      +0.0        0.08 ± 61%  perf-profile.self.cycles-pp.ct_kernel_enter
    352936           +42.1%     501525            +6.9%     377117        meminfo.AnonHugePages
    518885           +26.2%     654716            -2.1%     508198        meminfo.AnonPages
   1334861           +11.4%    1486492            -0.9%    1322775        meminfo.Inactive(anon)
      1.51            -0.1        1.45            -0.1        1.46        turbostat.C1E%
     24.23            -1.2%      23.93            -0.7%      24.05        turbostat.CorWatt
      2.64            -4.4%       2.52            -4.3%       2.53        turbostat.Pkg%pc2
     25.40            -1.3%      25.06            -0.9%      25.18        turbostat.PkgWatt
      3.30            -2.8%       3.20            -2.9%       3.20        turbostat.RAMWatt
     20115            -4.5%      19211            -4.5%      19217        phoronix-test-suite.ramspeed.Add.Integer.mb_s
    284.00            +3.5%     293.95            +3.5%     293.96        phoronix-test-suite.time.elapsed_time
    284.00            +3.5%     293.95            +3.5%     293.96        phoronix-test-suite.time.elapsed_time.max
    120322            +1.6%     122291            -0.2%     120098        phoronix-test-suite.time.maximum_resident_set_size
    281626           -54.7%     127627           -54.7%     127530        phoronix-test-suite.time.minor_page_faults
    259.16            +4.2%     270.02            +4.1%     269.86        phoronix-test-suite.time.user_time
    284.00            +3.5%     293.95            +3.5%     293.96        time.elapsed_time
    284.00            +3.5%     293.95            +3.5%     293.96        time.elapsed_time.max
    120322            +1.6%     122291            -0.2%     120098        time.maximum_resident_set_size
    281626           -54.7%     127627           -54.7%     127530        time.minor_page_faults
      1.72            -7.6%       1.59            -7.2%       1.60        time.system_time
    259.16            +4.2%     270.02            +4.1%     269.86        time.user_time
    129720           +26.2%     163681            -2.1%     127047        proc-vmstat.nr_anon_pages
    172.33           +42.1%     244.89            +6.8%     184.14        proc-vmstat.nr_anon_transparent_hugepages
    360027            -1.0%     356428            +0.1%     360507        proc-vmstat.nr_dirty_background_threshold
    720935            -1.0%     713729            +0.1%     721897        proc-vmstat.nr_dirty_threshold
   3328684            -1.1%    3292559            +0.1%    3333390        proc-vmstat.nr_free_pages
    333715           +11.4%     371625            -0.9%     330692        proc-vmstat.nr_inactive_anon
      1732            +5.1%       1820            +4.8%       1816        proc-vmstat.nr_page_table_pages
    333715           +11.4%     371625            -0.9%     330692        proc-vmstat.nr_zone_inactive_anon
    855883           -34.6%     560138           -34.9%     557459        proc-vmstat.numa_hit
    855859           -34.6%     560157           -34.9%     557429        proc-vmstat.numa_local
   5552895            +1.1%    5611662            +0.1%    5559236        proc-vmstat.pgalloc_normal
   1080638           -26.7%     792254           -27.0%     788881        proc-vmstat.pgfault
    109646            +3.0%     112918            +2.6%     112483        proc-vmstat.pgreuse
      9026            +7.6%       9714            +6.6%       9619        proc-vmstat.thp_fault_alloc
 1.165e+08            -3.6%  1.123e+08            -3.3%  1.126e+08        perf-stat.i.branch-instructions
      3.38            +0.1        3.45            +0.1        3.49        perf-stat.i.branch-miss-rate%
  4.13e+08            -2.7%  4.018e+08            -2.9%  4.011e+08        perf-stat.i.cache-misses
 5.336e+08            -2.3%  5.212e+08            -2.4%  5.206e+08        perf-stat.i.cache-references
      6824            -2.9%       6629            -2.9%       6624        perf-stat.i.context-switches
      4.05            +3.8%       4.20            +3.7%       4.20        perf-stat.i.cpi
    447744 ±  3%     -17.3%     370369 ±  3%     -15.0%     380580        perf-stat.i.dTLB-load-misses
 1.119e+09            -3.3%  1.082e+09            -3.4%  1.081e+09        perf-stat.i.dTLB-loads
      0.02 ± 10%      -0.0        0.01 ± 14%      -0.0        0.01 ±  3%  perf-stat.i.dTLB-store-miss-rate%
     84207 ±  7%     -58.4%      35034 ± 13%     -55.8%      37210 ±  2%  perf-stat.i.dTLB-store-misses
 7.312e+08            -3.3%  7.069e+08            -3.4%  7.065e+08        perf-stat.i.dTLB-stores
    127863            -2.8%     124330            -3.6%     123263        perf-stat.i.iTLB-load-misses
    145042            -2.5%     141459            -3.0%     140719        perf-stat.i.iTLB-loads
 2.393e+09            -3.3%  2.313e+09            -3.4%  2.313e+09        perf-stat.i.instructions
      0.28            -3.9%       0.27            -3.7%       0.27        perf-stat.i.ipc
    220.56            -3.0%     213.92            -3.1%     213.80        perf-stat.i.metric.M/sec
      3580           -31.0%       2470           -30.9%       2476        perf-stat.i.minor-faults
  49017829            +2.1%   50065997            +2.1%   50037948        perf-stat.i.node-loads
  98043570            -2.7%   95377592            -2.9%   95180579        perf-stat.i.node-stores
      3585           -31.0%       2474           -30.8%       2480        perf-stat.i.page-faults
      3.64            +3.8%       3.78            +3.8%       3.78        perf-stat.overall.cpi
     21.10            +3.2%      21.77            +3.3%      21.79        perf-stat.overall.cycles-between-cache-misses
      0.04 ±  3%      -0.0        0.03 ±  3%      -0.0        0.04        perf-stat.overall.dTLB-load-miss-rate%
      0.01 ±  7%      -0.0        0.00 ± 13%      -0.0        0.01 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      0.27            -3.7%       0.26            -3.7%       0.26        perf-stat.overall.ipc
  1.16e+08            -3.6%  1.119e+08            -3.3%  1.121e+08        perf-stat.ps.branch-instructions
 4.117e+08            -2.7%  4.006e+08            -2.9%  3.999e+08        perf-stat.ps.cache-misses
 5.319e+08            -2.3%  5.195e+08            -2.4%   5.19e+08        perf-stat.ps.cache-references
      6798            -2.8%       6605            -2.9%       6600        perf-stat.ps.context-switches
    446139 ±  3%     -17.3%     369055 ±  3%     -15.0%     379224        perf-stat.ps.dTLB-load-misses
 1.115e+09            -3.3%  1.078e+09            -3.4%  1.078e+09        perf-stat.ps.dTLB-loads
     83922 ±  7%     -58.4%      34908 ± 13%     -55.8%      37075 ±  2%  perf-stat.ps.dTLB-store-misses
 7.288e+08            -3.3%  7.047e+08            -3.4%  7.042e+08        perf-stat.ps.dTLB-stores
    127384            -2.7%     123884            -3.6%     122817        perf-stat.ps.iTLB-load-misses
    144399            -2.4%     140903            -2.9%     140152        perf-stat.ps.iTLB-loads
 2.385e+09            -3.3%  2.306e+09            -3.4%  2.305e+09        perf-stat.ps.instructions
      3566           -31.0%       2460           -30.9%       2465        perf-stat.ps.minor-faults
  48864755            +2.1%   49912372            +2.1%   49884745        perf-stat.ps.node-loads
  97730481            -2.7%   95083043            -2.9%   94887981        perf-stat.ps.node-stores
      3571           -31.0%       2465           -30.8%       2470        perf-stat.ps.page-faults


(11)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Floating Point/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      6853            -2.6%       6678            -2.7%       6668        vmstat.system.cs
    353760           +40.0%     495232            +6.4%     376514        meminfo.AnonHugePages
    519691           +25.5%     652412            -2.1%     508766        meminfo.AnonPages
   1335612           +11.1%    1484265            -0.9%    1323541        meminfo.Inactive(anon)
      1.52            -0.0        1.48            -0.0        1.48        turbostat.C1E%
      2.65            -3.0%       2.57            -2.8%       2.58        turbostat.Pkg%pc2
      3.32            -2.6%       3.23            -2.6%       3.23        turbostat.RAMWatt
     19960            -2.9%      19378            -3.0%      19366        phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s
    281.37            +3.0%     289.87            +3.1%     290.12        phoronix-test-suite.time.elapsed_time
    281.37            +3.0%     289.87            +3.1%     290.12        phoronix-test-suite.time.elapsed_time.max
    120220            +1.6%     122163            -0.1%     120158        phoronix-test-suite.time.maximum_resident_set_size
    281853           -54.7%     127777           -54.7%     127780        phoronix-test-suite.time.minor_page_faults
    257.32            +3.4%     265.97            +3.4%     265.99        phoronix-test-suite.time.user_time
    281.37            +3.0%     289.87            +3.1%     290.12        time.elapsed_time
    281.37            +3.0%     289.87            +3.1%     290.12        time.elapsed_time.max
    120220            +1.6%     122163            -0.1%     120158        time.maximum_resident_set_size
    281853           -54.7%     127777           -54.7%     127780        time.minor_page_faults
      1.74            -8.5%       1.59            -9.1%       1.58        time.system_time
    257.32            +3.4%     265.97            +3.4%     265.99        time.user_time
      0.80 ± 23%      -0.4        0.41 ± 78%      -0.3        0.54 ± 40%  perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.79 ± 21%      -0.4        0.40 ± 77%      -0.3        0.54 ± 39%  perf-profile.calltrace.cycles-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.77 ± 20%      -0.4        0.40 ± 77%      -0.3        0.52 ± 39%  perf-profile.calltrace.cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.39 ± 15%      -0.3        1.04 ± 22%      -0.2        1.20 ± 14%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      1.39 ± 15%      -0.3        1.04 ± 21%      -0.2        1.20 ± 14%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.80 ± 23%      -0.3        0.55 ± 29%      -0.2        0.60 ± 16%  perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
      0.79 ± 21%      -0.3        0.54 ± 28%      -0.2        0.60 ± 16%  perf-profile.children.cycles-pp.clear_huge_page
      0.79 ± 20%      -0.2        0.58 ± 31%      -0.2        0.58 ± 17%  perf-profile.children.cycles-pp.clear_page_erms
      0.78 ± 20%      -0.2        0.58 ± 31%      -0.2        0.58 ± 17%  perf-profile.self.cycles-pp.clear_page_erms
    129919           +25.5%     163102            -2.1%     127191        proc-vmstat.nr_anon_pages
    172.73           +40.0%     241.81            +6.4%     183.84        proc-vmstat.nr_anon_transparent_hugepages
   3328013            -1.1%    3291433            +0.1%    3332863        proc-vmstat.nr_free_pages
    333903           +11.1%     371065            -0.9%     330885        proc-vmstat.nr_inactive_anon
      1740            +4.5%       1819            +4.4%       1817        proc-vmstat.nr_page_table_pages
    333903           +11.1%     371065            -0.9%     330885        proc-vmstat.nr_zone_inactive_anon
    853676           -34.9%     556019           -34.7%     557219        proc-vmstat.numa_hit
    853653           -34.9%     555977           -34.7%     557192        proc-vmstat.numa_local
   5551461            +1.0%    5607022            +0.1%    5559594        proc-vmstat.pgalloc_normal
   1075659           -27.0%     785124           -26.9%     786363        proc-vmstat.pgfault
    108727            +2.6%     111582            +2.6%     111546        proc-vmstat.pgreuse
      9027            +7.6%       9714            +6.6%       9619        proc-vmstat.thp_fault_alloc
 1.184e+08            -3.3%  1.145e+08            -3.2%  1.146e+08        perf-stat.i.branch-instructions
   5500836            -2.4%    5367239            -2.4%    5368946        perf-stat.i.branch-misses
 4.139e+08            -2.5%  4.036e+08            -2.6%  4.034e+08        perf-stat.i.cache-misses
 5.246e+08            -2.5%  5.114e+08            -2.5%  5.117e+08        perf-stat.i.cache-references
      6889            -2.6%       6710            -2.6%       6710        perf-stat.i.context-switches
      4.31            +2.6%       4.42            +2.7%       4.43        perf-stat.i.cpi
      0.10 ±  2%      -0.0        0.09 ±  2%      -0.0        0.08 ±  3%  perf-stat.i.dTLB-load-miss-rate%
    454444           -16.1%     381426           -18.4%     370782 ±  3%  perf-stat.i.dTLB-load-misses
 8.087e+08            -3.0%  7.841e+08            -3.1%  7.839e+08        perf-stat.i.dTLB-loads
      0.02            -0.0        0.01 ±  2%      -0.0        0.01 ± 14%  perf-stat.i.dTLB-store-miss-rate%
     86294           -57.1%      36992 ±  2%     -59.7%      34809 ± 13%  perf-stat.i.dTLB-store-misses
 5.311e+08            -3.0%  5.151e+08            -3.1%  5.149e+08        perf-stat.i.dTLB-stores
    129929            -4.0%     124682            -3.3%     125639        perf-stat.i.iTLB-load-misses
    146749            -3.3%     141975            -3.7%     141337        perf-stat.i.iTLB-loads
 2.249e+09            -3.1%   2.18e+09            -3.1%  2.179e+09        perf-stat.i.instructions
      0.26            -3.0%       0.25            -2.9%       0.25        perf-stat.i.ipc
    179.65            -2.7%     174.83            -2.7%     174.79        perf-stat.i.metric.M/sec
      3614           -31.4%       2478           -31.1%       2490        perf-stat.i.minor-faults
  65665882            -0.5%   65367211            -0.8%   65111743        perf-stat.i.node-loads
      3618           -31.4%       2483           -31.1%       2494        perf-stat.i.page-faults
      3.88            +3.3%       4.01            +3.3%       4.01        perf-stat.overall.cpi
     21.10            +2.7%      21.67            +2.7%      21.67        perf-stat.overall.cycles-between-cache-misses
      0.06            -0.0        0.05            -0.0        0.05 ±  3%  perf-stat.overall.dTLB-load-miss-rate%
      0.02            -0.0        0.01 ±  2%      -0.0        0.01 ± 13%  perf-stat.overall.dTLB-store-miss-rate%
      0.26            -3.2%       0.25            -3.2%       0.25        perf-stat.overall.ipc
 1.179e+08            -3.3%   1.14e+08            -3.2%  1.141e+08        perf-stat.ps.branch-instructions
   5473781            -2.4%    5340720            -2.4%    5344770        perf-stat.ps.branch-misses
 4.126e+08            -2.5%  4.023e+08            -2.5%  4.021e+08        perf-stat.ps.cache-misses
 5.229e+08            -2.5%  5.098e+08            -2.5%    5.1e+08        perf-stat.ps.cache-references
      6864            -2.6%       6687            -2.6%       6687        perf-stat.ps.context-switches
    452799           -16.1%     380049           -18.4%     369456 ±  3%  perf-stat.ps.dTLB-load-misses
  8.06e+08            -3.0%  7.815e+08            -3.1%  7.814e+08        perf-stat.ps.dTLB-loads
     85997           -57.1%      36856 ±  2%     -59.7%      34683 ± 13%  perf-stat.ps.dTLB-store-misses
 5.294e+08            -3.0%  5.135e+08            -3.0%  5.133e+08        perf-stat.ps.dTLB-stores
    129440            -4.0%     124225            -3.3%     125181        perf-stat.ps.iTLB-load-misses
    146145            -3.2%     141400            -3.7%     140780        perf-stat.ps.iTLB-loads
 2.241e+09            -3.1%  2.172e+09            -3.1%  2.172e+09        perf-stat.ps.instructions
      3599           -31.4%       2468           -31.1%       2479        perf-stat.ps.minor-faults
  65457458            -0.5%   65162312            -0.8%   64909293        perf-stat.ps.node-loads
      3604           -31.4%       2472           -31.1%       2484        perf-stat.ps.page-faults


(12)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Triad/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    607.38 ± 15%     -24.4%     459.12 ± 24%      -6.0%     570.75 ±  5%  perf-c2c.DRAM.local
      6801            -3.4%       6570            -3.1%       6587        vmstat.system.cs
     15155            -0.9%      15024            -0.7%      15046        vmstat.system.in
    353771           +43.0%     505977 ±  3%      +7.1%     378972        meminfo.AnonHugePages
    518698           +26.5%     656280            -1.7%     509920        meminfo.AnonPages
   1334737           +11.5%    1487919            -0.8%    1324549        meminfo.Inactive(anon)
      1.50            -0.1        1.45            -0.1        1.45        turbostat.C1E%
      2.64            -4.0%       2.54            -2.8%       2.57        turbostat.Pkg%pc2
     25.32            -1.1%      25.06            -0.6%      25.17        turbostat.PkgWatt
      3.30            -3.0%       3.20            -2.8%       3.20        turbostat.RAMWatt
      1.25 ±  8%      -0.3        0.96 ± 16%      -0.1        1.15 ± 22%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.25 ±  8%      -0.3        0.96 ± 16%      -0.1        1.15 ± 22%  perf-profile.children.cycles-pp.exc_page_fault
      1.15 ±  9%      -0.3        0.88 ± 16%      -0.1        1.02 ± 22%  perf-profile.children.cycles-pp.__handle_mm_fault
      1.18 ±  9%      -0.3        0.91 ± 15%      -0.1        1.06 ± 21%  perf-profile.children.cycles-pp.handle_mm_fault
      0.23 ± 19%      +0.1        0.32 ± 18%      +0.1        0.33 ± 20%  perf-profile.children.cycles-pp.exit_mmap
      0.23 ± 19%      +0.1        0.32 ± 18%      +0.1        0.33 ± 20%  perf-profile.children.cycles-pp.__mmput
     19667            -6.4%      18399            -6.4%      18413        phoronix-test-suite.ramspeed.Triad.Integer.mb_s
    284.07            +3.7%     294.53            +3.4%     293.86        phoronix-test-suite.time.elapsed_time
    284.07            +3.7%     294.53            +3.4%     293.86        phoronix-test-suite.time.elapsed_time.max
    120102            +1.8%     122256            +0.1%     120265        phoronix-test-suite.time.maximum_resident_set_size
    281737           -54.7%     127624           -54.7%     127574        phoronix-test-suite.time.minor_page_faults
    259.49            +4.1%     270.20            +4.1%     270.14        phoronix-test-suite.time.user_time
    284.07            +3.7%     294.53            +3.4%     293.86        time.elapsed_time
    284.07            +3.7%     294.53            +3.4%     293.86        time.elapsed_time.max
    120102            +1.8%     122256            +0.1%     120265        time.maximum_resident_set_size
    281737           -54.7%     127624           -54.7%     127574        time.minor_page_faults
      1.72            -8.1%       1.58            -8.4%       1.58        time.system_time
    259.49            +4.1%     270.20            +4.1%     270.14        time.user_time
    129673           +26.5%     164074            -1.7%     127482        proc-vmstat.nr_anon_pages
    172.74           +43.0%     247.07 ±  3%      +7.1%     185.05        proc-vmstat.nr_anon_transparent_hugepages
    360059            -1.0%     356437            +0.1%     360424        proc-vmstat.nr_dirty_background_threshold
    720999            -1.0%     713747            +0.1%     721730        proc-vmstat.nr_dirty_threshold
   3328170            -1.1%    3291542            +0.1%    3330837        proc-vmstat.nr_free_pages
    333684           +11.5%     371981            -0.8%     331138        proc-vmstat.nr_inactive_anon
      1735            +5.0%       1822            +4.9%       1819        proc-vmstat.nr_page_table_pages
    333684           +11.5%     371981            -0.8%     331138        proc-vmstat.nr_zone_inactive_anon
    857533           -34.7%     559940           -34.6%     560503        proc-vmstat.numa_hit
    857463           -34.7%     560233           -34.6%     560504        proc-vmstat.numa_local
   1082386           -26.7%     793742           -26.9%     791272        proc-vmstat.pgfault
    109917            +2.8%     113044            +2.4%     112517        proc-vmstat.pgreuse
      9028            +7.5%       9707            +6.5%       9619        proc-vmstat.thp_fault_alloc
 1.168e+08            -6.9%  1.087e+08 ±  9%      -3.5%  1.127e+08        perf-stat.i.branch-instructions
      3.39            +0.1        3.47            +0.1        3.47        perf-stat.i.branch-miss-rate%
   5431805            -8.1%    4990354 ± 15%      -2.7%    5285279        perf-stat.i.branch-misses
  4.13e+08            -3.1%  4.004e+08            -2.8%  4.015e+08        perf-stat.i.cache-misses
 5.338e+08            -2.6%  5.196e+08            -2.4%  5.211e+08        perf-stat.i.cache-references
      6835            -3.4%       6604            -3.1%       6623        perf-stat.i.context-switches
      4.05            +3.8%       4.21            +3.6%       4.20        perf-stat.i.cpi
     60.96 ±  7%      +0.4%      61.20 ± 12%      -7.7%      56.27 ±  3%  perf-stat.i.cycles-between-cache-misses
      0.08 ±  3%      -0.0        0.08 ±  6%      -0.0        0.08 ±  4%  perf-stat.i.dTLB-load-miss-rate%
    455317           -16.9%     378574           -16.7%     379148        perf-stat.i.dTLB-load-misses
 1.118e+09            -3.8%  1.076e+09            -3.3%  1.082e+09        perf-stat.i.dTLB-loads
      0.02            -0.0        0.01 ±  6%      -0.0        0.01 ±  2%  perf-stat.i.dTLB-store-miss-rate%
     86796           -57.3%      37100 ±  2%     -57.3%      37097 ±  2%  perf-stat.i.dTLB-store-misses
  7.31e+08            -3.7%   7.04e+08            -3.3%  7.068e+08        perf-stat.i.dTLB-stores
    128995            -3.1%     125030 ±  2%      -4.4%     123280        perf-stat.i.iTLB-load-misses
    145739            -4.0%     139945            -3.7%     140348        perf-stat.i.iTLB-loads
 2.395e+09            -4.3%  2.291e+09 ±  2%      -3.4%  2.314e+09        perf-stat.i.instructions
      0.28            -4.2%       0.27            -3.9%       0.27        perf-stat.i.ipc
     30.30 ±  6%     -11.5%      26.81 ±  6%     -21.3%      23.84 ± 12%  perf-stat.i.metric.K/sec
    220.55            -3.5%     212.73            -3.0%     213.94        perf-stat.i.metric.M/sec
      3598           -31.3%       2473           -31.5%       2466        perf-stat.i.minor-faults
  49026239            +1.9%   49938429            +2.0%   50024868        perf-stat.i.node-loads
  98013334            -3.0%   95053521            -2.8%   95291354        perf-stat.i.node-stores
      3602           -31.2%       2477           -31.4%       2470        perf-stat.i.page-faults
      3.64            +4.6%       3.81            +3.9%       3.78        perf-stat.overall.cpi
     21.09            +3.2%      21.76            +3.3%      21.78        perf-stat.overall.cycles-between-cache-misses
      0.04            -0.0        0.04            -0.0        0.04        perf-stat.overall.dTLB-load-miss-rate%
      0.01            -0.0        0.01 ±  2%      -0.0        0.01 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      0.27            -4.3%       0.26            -3.7%       0.26        perf-stat.overall.ipc
 1.163e+08            -6.9%  1.083e+08 ±  9%      -3.5%  1.122e+08        perf-stat.ps.branch-instructions
   5405065            -8.1%    4967211 ± 15%      -2.7%    5259197        perf-stat.ps.branch-misses
 4.117e+08            -3.0%  3.992e+08            -2.8%  4.003e+08        perf-stat.ps.cache-misses
 5.321e+08            -2.6%   5.18e+08            -2.4%  5.195e+08        perf-stat.ps.cache-references
      6810            -3.4%       6579            -3.1%       6599        perf-stat.ps.context-switches
    453677           -16.9%     377215           -16.7%     377792        perf-stat.ps.dTLB-load-misses
 1.115e+09            -3.8%  1.072e+09            -3.3%  1.078e+09        perf-stat.ps.dTLB-loads
     86500           -57.3%      36965 ±  2%     -57.3%      36962 ±  2%  perf-stat.ps.dTLB-store-misses
 7.286e+08            -3.7%  7.019e+08            -3.3%  7.045e+08        perf-stat.ps.dTLB-stores
    128515            -3.1%     124573 ±  2%      -4.4%     122831        perf-stat.ps.iTLB-load-misses
    145145            -4.0%     139336            -3.7%     139772        perf-stat.ps.iTLB-loads
 2.386e+09            -4.3%  2.283e+09 ±  2%      -3.4%  2.306e+09        perf-stat.ps.instructions
      3583           -31.3%       2462           -31.5%       2455        perf-stat.ps.minor-faults
  48873391            +1.9%   49781212            +2.0%   49874192        perf-stat.ps.node-loads
  97704914            -3.0%   94765417            -2.8%   94999974        perf-stat.ps.node-stores
      3588           -31.2%       2467           -31.4%       2460        perf-stat.ps.page-faults


(13)
Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      6786            -2.9%       6587            -2.9%       6586        vmstat.system.cs
    355264 ±  2%     +41.1%     501244            +6.5%     378393        meminfo.AnonHugePages
    520377           +25.7%     654330            -2.1%     509644        meminfo.AnonPages
   1336461           +11.2%    1486141            -0.9%    1324302        meminfo.Inactive(anon)
      1.50            -0.0        1.46            -0.1        1.45        turbostat.C1E%
     24.20            -1.2%      23.90            -0.9%      23.98        turbostat.CorWatt
      2.62            -2.4%       2.56            -3.7%       2.53        turbostat.Pkg%pc2
     25.37            -1.3%      25.03            -1.0%      25.12        turbostat.PkgWatt
      3.30            -3.1%       3.20            -3.0%       3.20        turbostat.RAMWatt
     19799            -3.5%      19106            -3.4%      19117        phoronix-test-suite.ramspeed.Average.Integer.mb_s
    283.91            +3.7%     294.40            +3.6%     294.12        phoronix-test-suite.time.elapsed_time
    283.91            +3.7%     294.40            +3.6%     294.12        phoronix-test-suite.time.elapsed_time.max
    120150            +1.7%     122196            +0.2%     120373        phoronix-test-suite.time.maximum_resident_set_size
    281692           -54.7%     127689           -54.7%     127587        phoronix-test-suite.time.minor_page_faults
    259.47            +4.1%     270.04            +4.0%     269.86        phoronix-test-suite.time.user_time
    283.91            +3.7%     294.40            +3.6%     294.12        time.elapsed_time
    283.91            +3.7%     294.40            +3.6%     294.12        time.elapsed_time.max
    120150            +1.7%     122196            +0.2%     120373        time.maximum_resident_set_size
    281692           -54.7%     127689           -54.7%     127587        time.minor_page_faults
      1.72            -7.9%       1.58            -8.4%       1.58        time.system_time
    259.47            +4.1%     270.04            +4.0%     269.86        time.user_time
    130092           +25.7%     163578            -2.1%     127411        proc-vmstat.nr_anon_pages
    173.47 ±  2%     +41.1%     244.74            +6.5%     184.76        proc-vmstat.nr_anon_transparent_hugepages
   3328419            -1.1%    3292662            +0.1%    3332791        proc-vmstat.nr_free_pages
    334114           +11.2%     371530            -0.9%     331076        proc-vmstat.nr_inactive_anon
      1732            +4.7%       1814            +5.2%       1823        proc-vmstat.nr_page_table_pages
    334114           +11.2%     371530            -0.9%     331076        proc-vmstat.nr_zone_inactive_anon
    853734           -34.6%     558669           -34.2%     562087        proc-vmstat.numa_hit
    853524           -34.6%     558628           -34.1%     562074        proc-vmstat.numa_local
   5551673            +1.0%    5609595            +0.2%    5564708        proc-vmstat.pgalloc_normal
   1077693           -26.6%     791019           -26.3%     794706        proc-vmstat.pgfault
    109591            +3.1%     112941            +2.9%     112795        proc-vmstat.pgreuse
      9027            +7.6%       9714            +6.6%       9619        proc-vmstat.thp_fault_alloc
      1.58 ± 16%      -0.5        1.08 ±  8%      -0.4        1.16 ± 24%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      1.42 ± 14%      -0.4        0.97 ±  9%      -0.4        1.05 ± 24%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      1.42 ± 14%      -0.4        0.98 ±  8%      -0.4        1.05 ± 24%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      1.32 ± 14%      -0.4        0.91 ± 12%      -0.3        0.98 ± 26%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      1.30 ± 13%      -0.4        0.88 ± 13%      -0.4        0.94 ± 26%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      1.64 ± 16%      -0.5        1.12 ±  9%      -0.4        1.24 ± 22%  perf-profile.children.cycles-pp.asm_exc_page_fault
      1.48 ± 15%      -0.5        1.01 ± 10%      -0.4        1.12 ± 21%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.49 ± 14%      -0.5        1.02 ±  9%      -0.4        1.12 ± 21%  perf-profile.children.cycles-pp.exc_page_fault
      1.37 ± 14%      -0.4        0.94 ± 12%      -0.3        1.05 ± 22%  perf-profile.children.cycles-pp.handle_mm_fault
      1.34 ± 13%      -0.4        0.91 ± 13%      -0.3        1.00 ± 23%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.78 ± 20%      -0.3        0.50 ± 20%      -0.2        0.54 ± 33%  perf-profile.children.cycles-pp.clear_page_erms
      0.76 ± 20%      -0.3        0.50 ± 22%      -0.2        0.53 ± 34%  perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
      0.75 ± 20%      -0.2        0.50 ± 23%      -0.2        0.53 ± 33%  perf-profile.children.cycles-pp.clear_huge_page
      0.25 ± 28%      +0.0        0.28 ± 77%      -0.1        0.11 ± 52%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.24 ± 28%      +0.0        0.28 ± 77%      -0.1        0.11 ± 52%  perf-profile.children.cycles-pp.ret_from_fork
      0.23 ± 31%      +0.0        0.28 ± 78%      -0.1        0.09 ± 59%  perf-profile.children.cycles-pp.kthread
      0.77 ± 20%      -0.3        0.50 ± 18%      -0.2        0.54 ± 33%  perf-profile.self.cycles-pp.clear_page_erms
 1.166e+08            -3.3%  1.127e+08            -3.0%  1.131e+08        perf-stat.i.branch-instructions
      3.39            +0.1        3.49            +0.1        3.46        perf-stat.i.branch-miss-rate%
   5415570            -2.0%    5304890            -2.0%    5306531        perf-stat.i.branch-misses
 4.133e+08            -3.1%  4.005e+08            -2.9%  4.014e+08        perf-stat.i.cache-misses
 5.335e+08            -2.5%  5.203e+08            -2.4%  5.209e+08        perf-stat.i.cache-references
      6825            -3.1%       6616            -3.1%       6614        perf-stat.i.context-switches
      4.06            +3.5%       4.20            +3.3%       4.19        perf-stat.i.cpi
      0.08 ±  3%      -0.0        0.08 ±  2%      -0.0        0.08 ±  2%  perf-stat.i.dTLB-load-miss-rate%
    451852           -17.2%     374167 ±  4%     -16.1%     378935        perf-stat.i.dTLB-load-misses
  1.12e+09            -3.7%  1.079e+09            -3.5%  1.081e+09        perf-stat.i.dTLB-loads
      0.02            -0.0        0.01 ± 13%      -0.0        0.01        perf-stat.i.dTLB-store-miss-rate%
     86119           -59.0%      35274 ± 13%     -57.5%      36598        perf-stat.i.dTLB-store-misses
 7.319e+08            -3.7%  7.049e+08            -3.5%  7.066e+08        perf-stat.i.dTLB-stores
    128297            -2.6%     124925            -3.6%     123631        perf-stat.i.iTLB-load-misses
 2.395e+09            -3.6%  2.309e+09            -3.4%  2.315e+09        perf-stat.i.instructions
      0.28            -3.4%       0.27            -3.4%       0.27        perf-stat.i.ipc
    220.76            -3.3%     213.44            -3.1%     213.87        perf-stat.i.metric.M/sec
      3575           -30.9%       2470           -30.4%       2487        perf-stat.i.minor-faults
  49267237            +1.1%   49805411            +1.4%   49954320        perf-stat.i.node-loads
  98097080            -3.1%   95014639            -2.8%   95307489        perf-stat.i.node-stores
      3579           -30.9%       2475           -30.4%       2492        perf-stat.i.page-faults
      4.64            +0.1        4.71            +0.0        4.69        perf-stat.overall.branch-miss-rate%
      3.64            +3.8%       3.78            +3.7%       3.78        perf-stat.overall.cpi
     21.10            +3.3%      21.80            +3.2%      21.78        perf-stat.overall.cycles-between-cache-misses
      0.04            -0.0        0.03 ±  4%      -0.0        0.04        perf-stat.overall.dTLB-load-miss-rate%
      0.01            -0.0        0.01 ± 13%      -0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
      0.27            -3.7%       0.26            -3.6%       0.26        perf-stat.overall.ipc
 1.161e+08            -3.3%  1.122e+08            -3.0%  1.126e+08        perf-stat.ps.branch-instructions
   5390667            -2.1%    5280037            -2.0%    5282651        perf-stat.ps.branch-misses
  4.12e+08            -3.1%  3.993e+08            -2.9%  4.001e+08        perf-stat.ps.cache-misses
 5.318e+08            -2.5%  5.187e+08            -2.3%  5.193e+08        perf-stat.ps.cache-references
      6801            -3.1%       6593            -3.0%       6595        perf-stat.ps.context-switches
    450236           -17.2%     372836 ±  4%     -16.1%     377601        perf-stat.ps.dTLB-load-misses
 1.117e+09            -3.7%  1.075e+09            -3.5%  1.078e+09        perf-stat.ps.dTLB-loads
     85824           -59.0%      35147 ± 13%     -57.5%      36467        perf-stat.ps.dTLB-store-misses
 7.295e+08            -3.7%  7.027e+08            -3.4%  7.044e+08        perf-stat.ps.dTLB-stores
    127825            -2.6%     124475            -3.6%     123194        perf-stat.ps.iTLB-load-misses
 2.387e+09            -3.6%  2.302e+09            -3.3%  2.307e+09        perf-stat.ps.instructions
      3561           -30.9%       2460           -30.4%       2478        perf-stat.ps.minor-faults
  49109319            +1.1%   49654078            +1.4%   49800339        perf-stat.ps.node-loads
  97782680            -3.1%   94720369            -2.8%   95009401        perf-stat.ps.node-stores
      3566           -30.9%       2465           -30.4%       2482        perf-stat.ps.page-faults
--j0dMq1itEyhiQLv6--
