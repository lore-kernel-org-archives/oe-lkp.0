Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE615A2
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 03:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689822081; x=1721358081;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C0AkfuZ4bzVNET44yeHH96IOCtcN1i+nlfFHG0Mq540=;
  b=mUE+Kfm7IJXhYQyVCKRqxhkdpLdS92k8QqipsHlP6Va8z45yIE4nDF/r
   7yb9RoichpZDZB/93Kuyt1EBoJFyPsdL2cb51yY4kOGaNyl6UoVWOcLtk
   Xrvpn6wpkgs0SwMOFE6xGWyprjObbgzB6lFzaHW3JpkReUulQgvNhP+aZ
   1x1nPdkvPnEM9/cxakDofDQcUMlg47jWn93PLhj+z1st5VQbmfixx289M
   CW2RCAHWkOQlwBVbfTWjKq9s5apMtsNCNJi+jCHIV2qtVF1OvUr5kP/UZ
   JtSjo/C+vvhP7sL6f38n1UKeRtAO1e4hMhY0g3YK44ndM+nnyOoTEoS4y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397491443"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208,209";a="397491443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 20:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674533934"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208,209";a="674533934"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 20:01:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 20:01:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 20:01:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 20:01:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 20:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2iU2QirL85RStcQrpBRLurdoAqgkGeLIQL7tjBQU4XFJnl++dGdDXLRHFylO8FnTJVrTVCfiBRT4mUE8D51fz9QEIqoSL0V6O2rFwVbg+fVgsxJDV4xQZStcCdVRzYCjyleR6BQnsOmuc4B4snQKNAXEi3Jreoduqb7MlE2EaMpGkk+by1D2j8sB/J1M+FX14Kz3m78b6z8wbyriDw2JfmSfzlhWjoWhvksyrwyNrz8fyW0hJfctw4IQcIqfEIPpYJdeisPemg/e6VTuxcl99UBFWLiX02c3hNO/rmuE+izL0MEZotJ63EmwOfn8+Jyt5Uv4bv2DBAlb8TR9spnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Gl2ccuG83kvNE7rBKOHwr1oSCoc9tjQXLJ93PYS2kE=;
 b=Do8xmTBGbWl4dt3e2lXLHrmY3bcx4VXgyNG7orWMnHD7845BpDEobimH89FiCFRANPM7H5Wta8dLpwq9Q8eNe9o+E1j9AEmRJlW7HZQUrQ7hATibDpRVJmQsPSDWk86zg1dDmXnV/YD0XJCjcaXjGvJsjZfz8dkT52Tc3wcThDzJNJ63f86s5p+V7m9EIk8SsFpcUNzBzUH8JSgU6pBoUZ62W63QGAfx/Xt0tNJoTsRdAYUPU/bYwF46W1MtGkoyp4+3Zkmh/jpURn0AP4A8t4BTwk8ImANNl15lU5cROr7LjqBymW3rv3nuz8htwJ7dg2w/idbpef5apZsTeNtNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 03:01:08 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b2e3:de01:2d96:724e]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b2e3:de01:2d96:724e%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 03:01:08 +0000
Date: Thu, 20 Jul 2023 11:00:55 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Jay Patel <jaypatel@linux.ibm.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-mm@kvack.org>, <ying.huang@intel.com>,
	<feng.tang@intel.com>, <fengwei.yin@intel.com>, <cl@linux.com>,
	<penberg@kernel.org>, <rientjes@google.com>, <iamjoonsoo.kim@lge.com>,
	<akpm@linux-foundation.org>, <vbabka@suse.cz>, <aneesh.kumar@linux.ibm.com>,
	<tsahu@linux.ibm.com>, <piyushs@linux.ibm.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Message-ID: <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="JtH+0i4DenAC9eAc"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: e1893606-0dfc-42c7-732b-08db88cd8fbf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzHA44dM4OSqtSwSo8+cKmGfaT0scdUGhsCdc6v8GCpQMosQ9K6ca4wrAlAMso5EyMUvB9FtfsPOzim9eyraJiyYiee8eX2zszE/d7bryrrl6sAUkgiUHWvZv6FV2m5RwQWQdbjggMHCCuvUUx7pUKj5Xz/sa36Qmu/MNyNS1lj/ZVQAq7iPqOmYaMZftQ+75BRgRpGtphNj86reWA1rr5N9Kieb+OjT7EFsawZMjABL2U2qxgxtpKdJT9/nZs1mGNWztL5ZwVseZx2/8ZD+8SavkLyow0Tr6vCRPWGVhEcxrmsQRcOg20Zar1UiBZ0thqkf2/w169A/Rw4GRXvcu4ZCEhStlUl5sytcl16ezr0mEk/MfecdLWai2kuw/+MKEg+iFNg/WZCGX+PfthIAyZ87VHWL1UXfMWQuw/sD1+I427lovg1nEjQYGYdj8L4/We3Gl09WY5pWQPOmnY2IqOtCx2jW5wBttbT0TFnCs79EeGios+pcqDXx8ynOug6o+4KWcK2z4brNrukw34udoTFlFezobKGyQt47oblOgL3ixkM7jew1j3kQ0/CPTt3+qb1E7vptOpemA7yFdqcu5FpWy2WEbpPuneVLOrCL4cKbpyJ9Yj4WSCsuT/bWUkUTc3FBq5hxxVzgnKJab8ND2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(5660300002)(33716001)(316002)(8676002)(41300700001)(8936002)(66946007)(66556008)(4326008)(235185007)(66476007)(6916009)(83380400001)(38100700002)(82960400001)(478600001)(86362001)(186003)(966005)(2906002)(53546011)(6506007)(26005)(6666004)(33964004)(7416002)(6486002)(44144004)(44832011)(107886003)(9686003)(6512007)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJkeXpwUkFyRkZsb2ZFZEpGMlVFeVpiR1V0QUlwNjFUVUcrOTJXK1JFay9G?=
 =?utf-8?B?dUlWbDl6WGV2a05FbzFYYU1pY2g0UnVXWEREaE43dWVwQmdkYktLZ2czR3Yz?=
 =?utf-8?B?MDlPTnBKa0tkT3BhSDVkM01aOVN3dkxidHllZytwODVDeExDdGFLeFc4U09Q?=
 =?utf-8?B?cGNxSlZFUmtHTzFtR01CK3pjUHd5ak1hbXRkVGZ1OUpyZUdpaGhyOVltL1N3?=
 =?utf-8?B?T3U1a3RwZU1MT2xYM3lITXRDaldoL2N4U2pnMEtzRVZsc2dLaC9LZmZDT0FW?=
 =?utf-8?B?Z1hVU2xDSmhNK0xWYlZ4b0FQa1FrZm0wVUhJYlZ4VEdlVWJITHlUaHo0Zzk0?=
 =?utf-8?B?MUdmSkJWWlpNeVJDZERsRGkxUnkreE0xVlVvZEp2OUlzMGkvM3NhL1NQZWp4?=
 =?utf-8?B?dE5LODE1T2c2amQvbUlQd2F0YlY3UE14d2htbEVvOG4vY0haRDRpSzg4djkr?=
 =?utf-8?B?Q3RaTFBBb3Y3MHRrdG1kclQzWUd4aG4ybDVxSldDQWFVWmFudnpITXcrMEJU?=
 =?utf-8?B?dWFPYWdOeG5LQ2hRYUM0eGh6Sm1KTkZ3cDQ1ZGJnN0ZMZ1Y5dmhhWjNUZklC?=
 =?utf-8?B?M2hFV1hLSEhMcERvYkp1N0RuM2NoRStyMDdPVlhEL2RNc05BNWt4TndIREh4?=
 =?utf-8?B?T2dYNkxaWUJQRkVoRDNQRXBjcGJJc0hyN1VaOTZ0UWU5dnpTTDIwcUFnVURN?=
 =?utf-8?B?SlZsLyt3UVBjVXZDQjBGbVQ1QkhaOXVUWXF3dExMZkdYOGI1K09uZ1FmRlRG?=
 =?utf-8?B?cVBKYUh4WVpkNlNwZDBOQlpUQ0Y3SkRGNFhxUzYzTURiSlc2eHU0UW9uTTlt?=
 =?utf-8?B?MmJYcE1aV2xhcW9LcE96MVBOMTg5NGFnNnlXazZDcWowZHFiOXFSRFRBTk9w?=
 =?utf-8?B?RTRVaXdNb3N4cUpIZzVlaGdsUDRKSkltdHlNRldpSk5BOVhIMFlTNG96bjJE?=
 =?utf-8?B?dWFubFFFY2dkWGtZSVR0RnFUUVkxYlpyT3NnS3orNWJHMElnT05POGlvTkxi?=
 =?utf-8?B?d1h5Yy9VUzNnd3pkalFxcllJa050TVR4RW9zUFJuVHdwT0M0cU9kS3ltb2Nl?=
 =?utf-8?B?MmJhZnA0NjRlQVpvWTlKM2p1TTE1SDhadUx5b1lEalkxQzlNMVdIbWN5czRZ?=
 =?utf-8?B?bjlhS0NMVEo3aHN6SXREQUV3RVVqZ3cvUFdsVWZlWk1LcWVKN3crNTZCQUNk?=
 =?utf-8?B?aUNxMDFjKzdxQ1NkOS92RkhQaXI1Tm5EZGpsbkFocDRsVzlhU1RaaUNrN2Zq?=
 =?utf-8?B?WG5CZXpuOXhReFdFNDFqdGFEUTlQU01oejJWcmV2c3BjQkt6R3BiV2g0TU9C?=
 =?utf-8?B?c1N0b1g2WlJZWG0xdGVZdnlaZjU5Yk01QzQ3NFJuMitIZkVsVXBkK3pVZVhB?=
 =?utf-8?B?WE1oSC8rcXhRcFpwbEc3WUxXM0pHZldmTGVwSXdzcHZwaWRkL0xLTEtFL2xw?=
 =?utf-8?B?NkZvNkFsZE5JWWNFU3M3Q1h0cXdaSWVObEZNMDdWSHFTT2lGbW56MzJLbERk?=
 =?utf-8?B?MUpHNlh2NjUrd0tPVkJ6Uk9PSkhQczlpSUpRMlE2b3dCOEZFQUNxeEJ4L0k1?=
 =?utf-8?B?aEVLdXZrK3p0VGlmVWd4bE16RmFxMmtYcmg1a2FUMnZBaE9VZjU1RHRoVVN5?=
 =?utf-8?B?QmFJMjdyUmsyK0pkL01DbUJ1K3Z5VkgwNXVmT0Q1WlV5cXd6UVlSYm45UkFL?=
 =?utf-8?B?N2xzeTNOYUs1TGdQQkQwMjBUL0dNY0IyOXlSdkdXSnhjU3QrTGJHYWczZVNz?=
 =?utf-8?B?TUs0T2cvcXVld1NSWGlrTUdLc1JNYkFDZFp4cG9EZUVlQzBOczE2MXdlYkhO?=
 =?utf-8?B?WWpEaDVpVFdKR3FEckIwT2N2NHFmN3RPZDFlM1Z6UmxSVEhWUlFRcVJsR1Y0?=
 =?utf-8?B?ZERqTFF4aHJ4NGhpTGlkQVl5eVBFUkFxbm16MXQvSjBENmYxbkVoNENYYmpE?=
 =?utf-8?B?TnJzZWtRZjRqU0hWbHNxd3k5STNEdFZndTBiRGphWWs0T3c2dy9KdzMzTUIz?=
 =?utf-8?B?OENtSUt1SGpYSjRuamN1Y2NGUjlEeUtwQjRiQUFySlJyYi9mTXU4K21hUzlM?=
 =?utf-8?B?S055djBWdDcxSGZUZmEweDJTc0RaUWUzbnYxM1RGNnE4UXRMSnhZaXVraHdH?=
 =?utf-8?B?bzBwS1lvMUdMVGFKeDJJcy9UYUljYkVNUmxMTjRybVZFN0MraTBYMm41V21Y?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1893606-0dfc-42c7-732b-08db88cd8fbf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 03:01:07.5353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhNzeQ1J6jBhqq8bH37PEbnbJekEckZ4kthUcx5YDSSvrNQg1Ie//YHXyDSvcP8TviG8v+sf7zjkVLHdK+klMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com

--JtH+0i4DenAC9eAc
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

hi, Hyeonggon Yoo,

On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> On Mon, Jul 17, 2023 at 10:41â€¯PM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -12.5% regression of hackbench.throughput on:
> >
> >
> > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage")
> > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-slub-Optimize-slub-memory-usage/20230628-180050
> > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-next
> > patch link: https://lore.kernel.org/all/20230628095740.589893-1-jaypatel@linux.ibm.com/
> > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
> >
> > testcase: hackbench
> > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> > parameters:
> >
> >         nr_threads: 100%
> >         iterations: 4
> >         mode: process
> >         ipc: socket
> >         cpufreq_governor: performance
> >
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-oliver.sang@intel.com
> >
> >
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         sudo bin/lkp install job.yaml           # job file is attached in this email
> >         bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
> >         sudo bin/lkp run generated-yaml-file
> >
> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >
> > =========================================================================================
> > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
> >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> >
> > commit:
> >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> >
> > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >     222503 Ä… 86%    +108.7%     464342 Ä… 58%  numa-meminfo.node1.Active
> >     222459 Ä… 86%    +108.7%     464294 Ä… 58%  numa-meminfo.node1.Active(anon)
> >      55573 Ä… 85%    +108.0%     115619 Ä… 58%  numa-vmstat.node1.nr_active_anon
> >      55573 Ä… 85%    +108.0%     115618 Ä… 58%  numa-vmstat.node1.nr_zone_active_anon
> 
> I'm quite baffled while reading this.
> How did changing slab order calculation double the number of active anon pages?
> I doubt two experiments were performed on the same settings.

let me introduce our test process.

we make sure the tests upon commit and its parent have exact same environment
except the kernel difference, and we also make sure the config to build the
commit and its parent are identical.

we run tests for one commit at least 6 times to make sure the data is stable.

such like for this case, we rebuild the commit and its parent's kernel, the
config is attached FYI.

then retest on this test machine:
128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory

we noticed the regression still exists (datail comparison is attached
as hackbench-a0fd217e6d-ICL-Gold-6338):

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
    479042           -12.5%     419357        hackbench.throughput

the real data is as below,

for 7bc162d5cc:
  "hackbench.throughput": [
    480199.7631014502,
    478713.21886768367,
    480692.1967633392,
    476795.9313413859,
    478545.2225235285,
    479309.7938967886
  ],

for a0fd217e6d:
  "hackbench.throughput": [
    422654.2688081149,
    419017.82222470525,
    416817.183983105,
    423286.39557524625,
    414307.41610274825,
    420062.1692010417
  ],


we also rerun the tests on another test machine:
128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

still found a regression
(detail as attached hackbench-a0fd217e6d-ICL-Platinum-8358):

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp6/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
    455347            -5.9%     428458        hackbench.throughput


> 
> >    1377834 Ä…  2%     -10.7%    1230013        sched_debug.cpu.nr_switches.avg
> >    1218144 Ä…  2%     -13.3%    1055659 Ä…  2%  sched_debug.cpu.nr_switches.min
> >    3047631 Ä…  2%     -13.2%    2646560        vmstat.system.cs
> >     561797           -13.8%     484137        vmstat.system.in
> >     280976 Ä… 66%    +122.6%     625459 Ä… 52%  meminfo.Active
> >     280881 Ä… 66%    +122.6%     625365 Ä… 52%  meminfo.Active(anon)
> >     743351 Ä…  4%      -9.7%     671534 Ä…  6%  meminfo.AnonPages
> >       1.36            -0.1        1.21        mpstat.cpu.all.irq%
> >       0.04 Ä…  4%      -0.0        0.03 Ä…  4%  mpstat.cpu.all.soft%
> >       5.38            -0.8        4.58        mpstat.cpu.all.usr%
> >       0.26           -11.9%       0.23        turbostat.IPC
> >     160.93           -19.3      141.61        turbostat.PKG_%
> >      60.48            -8.9%      55.10        turbostat.RAMWatt
> >      70049 Ä… 68%    +124.5%     157279 Ä… 52%  proc-vmstat.nr_active_anon
> >     185963 Ä…  4%      -9.8%     167802 Ä…  6%  proc-vmstat.nr_anon_pages
> >      37302            -1.2%      36837        proc-vmstat.nr_slab_reclaimable
> >      70049 Ä… 68%    +124.5%     157279 Ä… 52%  proc-vmstat.nr_zone_active_anon
> >    1101451           +12.0%    1233638        proc-vmstat.unevictable_pgs_scanned
> >     477310           -12.5%     417480        hackbench.throughput
> >     464064           -12.0%     408333        hackbench.throughput_avg
> >     477310           -12.5%     417480        hackbench.throughput_best
> >     435294            -9.5%     394098        hackbench.throughput_worst
> >     131.28           +13.4%     148.89        hackbench.time.elapsed_time
> >     131.28           +13.4%     148.89        hackbench.time.elapsed_time.max
> >   90404617            -5.2%   85662614 Ä…  2%  hackbench.time.involuntary_context_switches
> >      15342           +15.0%      17642        hackbench.time.system_time
> >     866.32            -3.2%     838.32        hackbench.time.user_time
> >  4.581e+10           -11.2%  4.069e+10        perf-stat.i.branch-instructions
> >       0.45            +0.1        0.56        perf-stat.i.branch-miss-rate%
> >  2.024e+08           +11.8%  2.263e+08        perf-stat.i.branch-misses
> >      21.49            -1.1       20.42        perf-stat.i.cache-miss-rate%
> >  4.202e+08           -16.6%  3.505e+08        perf-stat.i.cache-misses
> >  1.935e+09           -11.5%  1.711e+09        perf-stat.i.cache-references
> >    3115707 Ä…  2%     -13.9%    2681887        perf-stat.i.context-switches
> >       1.31           +13.2%       1.48        perf-stat.i.cpi
> >     375155 Ä…  3%     -16.3%     314001 Ä…  2%  perf-stat.i.cpu-migrations
> >  6.727e+10           -11.2%  5.972e+10        perf-stat.i.dTLB-loads
> >  4.169e+10           -12.2%  3.661e+10        perf-stat.i.dTLB-stores
> >  2.465e+11           -11.4%  2.185e+11        perf-stat.i.instructions
> >       0.77           -11.8%       0.68        perf-stat.i.ipc
> >     818.18 Ä…  5%     +61.8%       1323 Ä…  2%  perf-stat.i.metric.K/sec
> >       1225           -11.6%       1083        perf-stat.i.metric.M/sec
> >      11341 Ä…  4%     -12.6%       9916 Ä…  4%  perf-stat.i.minor-faults
> >   1.27e+08           -13.2%  1.102e+08        perf-stat.i.node-load-misses
> >    3376198           -15.4%    2855906        perf-stat.i.node-loads
> >   72756698           -22.9%   56082330        perf-stat.i.node-store-misses
> >    4118986 Ä…  2%     -19.3%    3322276        perf-stat.i.node-stores
> >      11432 Ä…  3%     -12.6%       9991 Ä…  4%  perf-stat.i.page-faults
> >       0.44            +0.1        0.56        perf-stat.overall.branch-miss-rate%
> >      21.76            -1.3       20.49        perf-stat.overall.cache-miss-rate%
> >       1.29           +13.5%       1.47        perf-stat.overall.cpi
> >     755.39           +21.1%     914.82        perf-stat.overall.cycles-between-cache-misses
> >       0.77           -11.9%       0.68        perf-stat.overall.ipc
> >  4.546e+10           -11.0%  4.046e+10        perf-stat.ps.branch-instructions
> >  2.006e+08           +12.0%  2.246e+08        perf-stat.ps.branch-misses
> >  4.183e+08           -16.8%   3.48e+08        perf-stat.ps.cache-misses
> >  1.923e+09           -11.7%  1.699e+09        perf-stat.ps.cache-references
> >    3073921 Ä…  2%     -13.9%    2647497        perf-stat.ps.context-switches
> >     367849 Ä…  3%     -16.1%     308496 Ä…  2%  perf-stat.ps.cpu-migrations
> >  6.683e+10           -11.2%  5.938e+10        perf-stat.ps.dTLB-loads
> >  4.144e+10           -12.2%  3.639e+10        perf-stat.ps.dTLB-stores
> >  2.447e+11           -11.2%  2.172e+11        perf-stat.ps.instructions
> >      10654 Ä…  4%     -11.5%       9428 Ä…  4%  perf-stat.ps.minor-faults
> >  1.266e+08           -13.5%  1.095e+08        perf-stat.ps.node-load-misses
> >    3361116           -15.6%    2836863        perf-stat.ps.node-loads
> >   72294146           -23.1%   55573600        perf-stat.ps.node-store-misses
> >    4043240 Ä…  2%     -19.4%    3258771        perf-stat.ps.node-stores
> >      10734 Ä…  4%     -11.6%       9494 Ä…  4%  perf-stat.ps.page-faults
> 
> <...>
> 
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
> >
> 

--JtH+0i4DenAC9eAc
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc3-00017-ga0fd217e6d6f"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.4.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-12 (Debian 12.2.0-14) 12.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24000
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_INTEL_TDX_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
# CONFIG_ADDRESS_MASKING is not set
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_CALL_PADDING=y
CONFIG_HAVE_CALL_THUNKS=y
CONFIG_CALL_THUNKS=y
CONFIG_PREFIX_SYMBOLS=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_RETPOLINE=y
CONFIG_RETHUNK=y
CONFIG_CALL_DEPTH_TRACKING=y
# CONFIG_CALL_THUNKS_DEBUG is not set
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
CONFIG_ACPI_HMAT=y
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# SLAB allocator options
#
# CONFIG_SLAB_DEPRECATED is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_PER_VMA_LOCK=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_BPF_LINK=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
# CONFIG_NETFILTER_XTABLES_COMPAT is not set

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_MQPRIO_LIB=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_DW_PLAT_HOST is not set
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_DEBUG=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_HMEM_REPORTING=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_SOFT_RESERVE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_SGI_XP is not set
CONFIG_HP_ILO=m
# CONFIG_SGI_GRU is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
CONFIG_MEGARAID_NEWGEN=y
CONFIG_MEGARAID_MM=m
CONFIG_MEGARAID_MAILBOX=m
CONFIG_MEGARAID_LEGACY=m
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_PARPORT is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_T1S_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_HYPERV_NET=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ELKHARTLAKE is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_VIRTIO_GPU_KMS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_USS720 is not set
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_UIO is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_TASK=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
# CONFIG_HYPERV_VTL_MODE is not set
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_WMI is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_LENOVO_YMC is not set
CONFIG_SENSORS_HDAPS=m
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
# CONFIG_MSI_EC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
# CONFIG_IOMMUFD is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_HMEM=m
CONFIG_DEV_DAX_HMEM_DEVICES=y
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_DRAIN_INTENTS=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
# CONFIG_CIFS_DEBUG is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_SLUB_DEBUG is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_PER_VMA_LOCK_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# CONFIG_UNWINDER_GUESS is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--JtH+0i4DenAC9eAc
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="hackbench-a0fd217e6d-ICL-Gold-6338"
Content-Transfer-Encoding: 8bit

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

commit:
  7bc162d5cc4de5c33c5570dba2719a01506a9fd0
  a0fd217e6d6fbd23e91f8796787b621e7d576088

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
  5.32e+08 ±  5%      -0.5%  5.291e+08 ±  7%  cpuidle..time
   3717253 ±  7%      -6.0%    3495436 ±  8%  cpuidle..usage
    197.86 ±  7%      +6.9%     211.47        uptime.boot
      8150 ± 19%      -5.3%       7719 ±  6%  uptime.idle
     64.22 ± 23%      -6.7%      59.94 ±  7%  boot-time.boot
     38.40 ± 41%     -15.7%      32.37 ± 11%  boot-time.dhcp
      7475 ± 21%      -5.7%       7046 ±  7%  boot-time.idle
      3.80 ± 83%     -31.8%       2.59 ± 28%  boot-time.smp_boot
     18981 ±  4%      -8.7%      17323 ±  2%  perf-c2c.DRAM.local
      3875 ±  6%      -2.5%       3778        perf-c2c.DRAM.remote
     40096 ±  4%      +6.3%      42611        perf-c2c.HITM.local
    390.50 ± 14%     +10.8%     432.83 ± 15%  perf-c2c.HITM.remote
     40487 ±  4%      +6.3%      43044 ±  2%  perf-c2c.HITM.total
      2.85 ±  9%      -0.4        2.46 ±  5%  mpstat.cpu.all.idle%
      0.00            +0.0        0.00 ±152%  mpstat.cpu.all.iowait%
      1.36            -0.1        1.22        mpstat.cpu.all.irq%
      0.04 ±  4%      -0.0        0.03        mpstat.cpu.all.soft%
     90.36            +1.3       91.67        mpstat.cpu.all.sys%
      5.39            -0.8        4.62        mpstat.cpu.all.usr%
      0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    646925 ± 26%     +25.4%     811509 ± 29%  numa-numastat.node0.local_node
    693386 ± 20%     +30.4%     904091 ± 27%  numa-numastat.node0.numa_hit
     46461 ± 81%    +102.6%      94126 ± 31%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
   1571252 ± 18%     -14.3%    1346549 ± 13%  numa-numastat.node1.local_node
   1663884 ± 16%     -16.3%    1393406 ± 13%  numa-numastat.node1.numa_hit
     92593 ± 39%     -49.5%      46769 ± 61%  numa-numastat.node1.other_node
    130.57           +13.6%     148.34        time.elapsed_time
    130.57           +13.6%     148.34        time.elapsed_time.max
  90258628            -3.3%   87299873 ±  3%  time.involuntary_context_switches
     11065 ± 10%      -0.4%      11021 ± 11%  time.major_page_faults
      2048            +0.0%       2048        time.maximum_resident_set_size
    537871            +0.5%     540478        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
     12341            +0.6%      12414        time.percent_of_cpu_this_job_got
     15255           +15.2%      17572        time.system_time
    860.68            -1.9%     844.07        time.user_time
 3.188e+08            -0.7%  3.167e+08        time.voluntary_context_switches
      3.83 ±  9%     -21.7%       3.00        vmstat.cpu.id
     89.83            +1.5%      91.17        vmstat.cpu.sy
      5.00           -20.0%       4.00        vmstat.cpu.us
      0.00         +3e+102%       3.00 ±223%  vmstat.io.bi
      4.00            +0.0%       4.00        vmstat.memory.buff
   5007806 ± 11%      -3.4%    4837228 ±  6%  vmstat.memory.cache
 2.553e+08            +0.2%  2.558e+08        vmstat.memory.free
      0.00          -100.0%       0.00        vmstat.procs.b
      1708 ±  2%      +4.4%       1783        vmstat.procs.r
   3085235           -12.8%    2690078 ±  2%  vmstat.system.cs
    566013           -13.8%     487865        vmstat.system.in
    479042           -12.5%     419357        hackbench.throughput
    466774           -12.2%     409886        hackbench.throughput_avg
    479042           -12.5%     419357        hackbench.throughput_best
    440206           -10.5%     393835        hackbench.throughput_worst
    130.57           +13.6%     148.34        hackbench.time.elapsed_time
    130.57           +13.6%     148.34        hackbench.time.elapsed_time.max
  90258628            -3.3%   87299873 ±  3%  hackbench.time.involuntary_context_switches
     11065 ± 10%      -0.4%      11021 ± 11%  hackbench.time.major_page_faults
      2048            +0.0%       2048        hackbench.time.maximum_resident_set_size
    537871            +0.5%     540478        hackbench.time.minor_page_faults
      4096            +0.0%       4096        hackbench.time.page_size
     12341            +0.6%      12414        hackbench.time.percent_of_cpu_this_job_got
     15255           +15.2%      17572        hackbench.time.system_time
    860.68            -1.9%     844.07        hackbench.time.user_time
 3.188e+08            -0.7%  3.167e+08        hackbench.time.voluntary_context_switches
      2483            +0.7%       2502        turbostat.Avg_MHz
     97.00            +0.4       97.36        turbostat.Busy%
      2566            +0.4%       2575        turbostat.Bzy_MHz
   3675150 ±  7%      -6.0%    3453995 ±  8%  turbostat.C1
      3.11 ±  5%      -0.4        2.74 ±  7%  turbostat.C1%
      3.00 ±  5%     -12.0%       2.64 ±  7%  turbostat.CPU%c1
     71.83            -1.2%      71.00        turbostat.CoreTmp
      0.26           -11.5%       0.23        turbostat.IPC
  75755770            -2.4%   73904719        turbostat.IRQ
    160.88           -18.6      142.24        turbostat.PKG_%
      7091 ±  8%      -2.0%       6951 ±  9%  turbostat.POLL
     72.00            -0.7%      71.50        turbostat.PkgTmp
    405.59            +0.0%     405.77        turbostat.PkgWatt
     61.85            -9.4%      56.03        turbostat.RAMWatt
      1995            +0.0%       1995        turbostat.TSC_MHz
    229526 ± 92%    +221.6%     738269 ± 41%  meminfo.Active
    229430 ± 92%    +221.7%     738173 ± 42%  meminfo.Active(anon)
     95.83            +0.0%      95.83        meminfo.Active(file)
    139168 ±  2%      +5.2%     146469 ±  4%  meminfo.AnonHugePages
    738504 ±  4%     -10.2%     662901 ±  6%  meminfo.AnonPages
      4.00            +0.0%       4.00        meminfo.Buffers
   4852249 ± 11%      -3.5%    4683501 ±  6%  meminfo.Cached
 1.319e+08            +0.0%  1.319e+08        meminfo.CommitLimit
   4835545 ± 11%      -5.0%    4591417 ±  7%  meminfo.Committed_AS
 2.599e+08            +0.1%  2.602e+08        meminfo.DirectMap1G
   9765546 ± 24%      -3.5%    9423189 ± 19%  meminfo.DirectMap2M
    538728 ± 10%      -1.3%     531560 ± 25%  meminfo.DirectMap4k
      2048            +0.0%       2048        meminfo.Hugepagesize
   2690463 ± 26%     -28.0%    1937074 ± 33%  meminfo.Inactive
   2690315 ± 26%     -28.0%    1936752 ± 33%  meminfo.Inactive(anon)
    147.00          +118.6%     321.33 ±121%  meminfo.Inactive(file)
    148773            -1.3%     146801        meminfo.KReclaimable
    100939            +0.9%     101825        meminfo.KernelStack
   1530025 ± 24%     -35.8%     982209 ± 34%  meminfo.Mapped
 2.543e+08            +0.2%  2.547e+08        meminfo.MemAvailable
 2.553e+08            +0.2%  2.558e+08        meminfo.MemFree
 2.638e+08            +0.0%  2.638e+08        meminfo.MemTotal
   8407546 ±  7%      -4.8%    8001846 ±  5%  meminfo.Memused
    165566            +2.6%     169934 ±  3%  meminfo.PageTables
     82492 ±  3%      +0.0%      82498 ±  2%  meminfo.Percpu
    148773            -1.3%     146801        meminfo.SReclaimable
    603043            -0.5%     600188        meminfo.SUnreclaim
   2181543 ± 25%      -7.7%    2012621 ± 15%  meminfo.Shmem
    751817            -0.6%     746989        meminfo.Slab
   2670466            -0.0%    2670465        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    339920            +0.3%     340860        meminfo.VmallocUsed
   8648896 ±  6%      -1.8%    8495615 ±  3%  meminfo.max_used_kB
     75590 ± 68%    +164.6%     199992 ±114%  numa-meminfo.node0.Active
     75510 ± 68%    +164.8%     199976 ±114%  numa-meminfo.node0.Active(anon)
     79.83 ± 44%     -80.2%      15.83 ±223%  numa-meminfo.node0.Active(file)
     64106 ± 72%     -48.3%      33165 ± 79%  numa-meminfo.node0.AnonHugePages
    307465 ± 40%     -40.4%     183238 ± 23%  numa-meminfo.node0.AnonPages
    534180 ± 18%     -42.4%     307787 ± 20%  numa-meminfo.node0.AnonPages.max
   1523129 ± 87%     +12.9%    1720107 ± 54%  numa-meminfo.node0.FilePages
    424558 ± 42%     +66.6%     707490 ±105%  numa-meminfo.node0.Inactive
    424440 ± 42%     +66.6%     707292 ±105%  numa-meminfo.node0.Inactive(anon)
    116.83 ± 45%     +69.9%     198.50 ±192%  numa-meminfo.node0.Inactive(file)
     69073 ± 29%     -12.4%      60531 ± 36%  numa-meminfo.node0.KReclaimable
     28145 ± 48%     +24.1%      34917 ± 74%  numa-meminfo.node0.KernelStack
    232636 ±  8%     +57.0%     365262 ± 97%  numa-meminfo.node0.Mapped
 1.286e+08            -0.0%  1.286e+08        numa-meminfo.node0.MemFree
 1.317e+08            +0.0%  1.317e+08        numa-meminfo.node0.MemTotal
   3089636 ± 41%      +0.8%    3113259 ± 30%  numa-meminfo.node0.MemUsed
     36894 ± 77%     +33.0%      49073 ±111%  numa-meminfo.node0.PageTables
     69073 ± 29%     -12.4%      60531 ± 36%  numa-meminfo.node0.SReclaimable
    256086 ± 15%      +3.6%     265430 ± 24%  numa-meminfo.node0.SUnreclaim
    192771 ± 95%    +275.7%     724295 ±107%  numa-meminfo.node0.Shmem
    325160 ± 12%      +0.2%     325962 ± 21%  numa-meminfo.node0.Slab
   1330159 ± 96%     -25.2%     995597 ±118%  numa-meminfo.node0.Unevictable
    157438 ±101%    +240.2%     535547 ± 46%  numa-meminfo.node1.Active
    157422 ±101%    +240.1%     535467 ± 46%  numa-meminfo.node1.Active(anon)
     16.00 ±223%    +400.0%      80.00 ± 44%  numa-meminfo.node1.Active(file)
     75024 ± 62%     +50.9%     113233 ± 25%  numa-meminfo.node1.AnonHugePages
    431769 ± 34%     +11.1%     479715 ± 14%  numa-meminfo.node1.AnonPages
    695068 ± 14%     +24.7%     866432 ±  8%  numa-meminfo.node1.AnonPages.max
   3329293 ± 40%     -11.0%    2963533 ± 27%  numa-meminfo.node1.FilePages
   2263257 ± 34%     -45.5%    1232508 ± 39%  numa-meminfo.node1.Inactive
   2263226 ± 34%     -45.5%    1232384 ± 39%  numa-meminfo.node1.Inactive(anon)
     30.17 ±175%    +307.7%     123.00 ± 44%  numa-meminfo.node1.Inactive(file)
     79734 ± 25%      +8.2%      86276 ± 25%  numa-meminfo.node1.KReclaimable
     72957 ± 18%      -8.4%      66806 ± 38%  numa-meminfo.node1.KernelStack
   1295066 ± 27%     -52.2%     618571 ± 41%  numa-meminfo.node1.Mapped
 1.267e+08            +0.3%  1.272e+08        numa-meminfo.node1.MemFree
 1.321e+08            +0.0%  1.321e+08        numa-meminfo.node1.MemTotal
   5320190 ± 26%      -8.1%    4887055 ± 15%  numa-meminfo.node1.MemUsed
    129038 ± 23%      -6.6%     120578 ± 45%  numa-meminfo.node1.PageTables
     79734 ± 25%      +8.2%      86276 ± 25%  numa-meminfo.node1.SReclaimable
    347879 ± 10%      -4.0%     333923 ± 18%  numa-meminfo.node1.SUnreclaim
   1988939 ± 26%     -35.2%    1288462 ± 48%  numa-meminfo.node1.Shmem
    427614 ±  9%      -1.7%     420199 ± 16%  numa-meminfo.node1.Slab
   1340305 ± 95%     +25.0%    1674866 ± 70%  numa-meminfo.node1.Unevictable
     18769 ± 67%    +167.8%      50269 ±115%  numa-vmstat.node0.nr_active_anon
     19.83 ± 44%     -80.7%       3.83 ±223%  numa-vmstat.node0.nr_active_file
     76860 ± 40%     -40.3%      45882 ± 23%  numa-vmstat.node0.nr_anon_pages
     31.00 ± 73%     -48.9%      15.83 ± 81%  numa-vmstat.node0.nr_anon_transparent_hugepages
    380652 ± 87%     +13.0%     430216 ± 54%  numa-vmstat.node0.nr_file_pages
  32149678            -0.0%   32142905        numa-vmstat.node0.nr_free_pages
    106078 ± 42%     +66.7%     176807 ±105%  numa-vmstat.node0.nr_inactive_anon
     28.83 ± 45%     +71.7%      49.50 ±192%  numa-vmstat.node0.nr_inactive_file
     28085 ± 48%     +24.9%      35069 ± 74%  numa-vmstat.node0.nr_kernel_stack
     58217 ±  8%     +56.7%      91240 ± 97%  numa-vmstat.node0.nr_mapped
      9194 ± 77%     +34.4%      12354 ±110%  numa-vmstat.node0.nr_page_table_pages
     48062 ± 95%    +277.1%     181262 ±107%  numa-vmstat.node0.nr_shmem
     17261 ± 29%     -12.3%      15131 ± 36%  numa-vmstat.node0.nr_slab_reclaimable
     63882 ± 15%      +3.9%      66379 ± 24%  numa-vmstat.node0.nr_slab_unreclaimable
    332539 ± 96%     -25.2%     248898 ±118%  numa-vmstat.node0.nr_unevictable
     18769 ± 67%    +167.8%      50269 ±115%  numa-vmstat.node0.nr_zone_active_anon
     19.83 ± 44%     -80.7%       3.83 ±223%  numa-vmstat.node0.nr_zone_active_file
    106078 ± 42%     +66.7%     176806 ±105%  numa-vmstat.node0.nr_zone_inactive_anon
     28.83 ± 45%     +71.7%      49.50 ±192%  numa-vmstat.node0.nr_zone_inactive_file
    332539 ± 96%     -25.2%     248898 ±118%  numa-vmstat.node0.nr_zone_unevictable
    694257 ± 20%     +30.3%     904324 ± 27%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    647796 ± 25%     +25.3%     811742 ± 29%  numa-vmstat.node0.numa_local
     46461 ± 81%    +102.6%      94126 ± 31%  numa-vmstat.node0.numa_other
     39733 ± 97%    +238.4%     134448 ± 47%  numa-vmstat.node1.nr_active_anon
      4.00 ±223%    +400.0%      20.00 ± 44%  numa-vmstat.node1.nr_active_file
    107783 ± 34%     +11.2%     119866 ± 14%  numa-vmstat.node1.nr_anon_pages
     36.33 ± 63%     +50.5%      54.67 ± 25%  numa-vmstat.node1.nr_anon_transparent_hugepages
    831888 ± 40%     -10.9%     741122 ± 27%  numa-vmstat.node1.nr_file_pages
  31687037            +0.3%   31794474        numa-vmstat.node1.nr_free_pages
    564839 ± 34%     -45.5%     307690 ± 39%  numa-vmstat.node1.nr_inactive_anon
      7.17 ±181%    +325.6%      30.50 ± 44%  numa-vmstat.node1.nr_inactive_file
      0.00          -100.0%       0.00        numa-vmstat.node1.nr_isolated_anon
     72790 ± 18%      -8.3%      66721 ± 38%  numa-vmstat.node1.nr_kernel_stack
    323061 ± 27%     -52.4%     153929 ± 41%  numa-vmstat.node1.nr_mapped
     32157 ± 22%      -6.4%      30113 ± 45%  numa-vmstat.node1.nr_page_table_pages
    496799 ± 26%     -35.1%     322354 ± 48%  numa-vmstat.node1.nr_shmem
     19923 ± 25%      +8.2%      21564 ± 25%  numa-vmstat.node1.nr_slab_reclaimable
     86856 ± 10%      -4.0%      83385 ± 18%  numa-vmstat.node1.nr_slab_unreclaimable
    335075 ± 95%     +25.0%     418716 ± 70%  numa-vmstat.node1.nr_unevictable
     39733 ± 97%    +238.4%     134448 ± 47%  numa-vmstat.node1.nr_zone_active_anon
      4.00 ±223%    +400.0%      20.00 ± 44%  numa-vmstat.node1.nr_zone_active_file
    564839 ± 34%     -45.5%     307690 ± 39%  numa-vmstat.node1.nr_zone_inactive_anon
      7.17 ±181%    +325.6%      30.50 ± 44%  numa-vmstat.node1.nr_zone_inactive_file
    335075 ± 95%     +25.0%     418716 ± 70%  numa-vmstat.node1.nr_zone_unevictable
   1664626 ± 16%     -16.3%    1393482 ± 13%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
   1571994 ± 18%     -14.3%    1346624 ± 13%  numa-vmstat.node1.numa_local
     92593 ± 39%     -49.5%      46769 ± 61%  numa-vmstat.node1.numa_other
    246.33 ± 11%      -1.1%     243.67 ± 27%  proc-vmstat.direct_map_level2_splits
      3.17 ± 61%     -21.1%       2.50 ± 55%  proc-vmstat.direct_map_level3_splits
     57837 ± 90%    +219.0%     184528 ± 41%  proc-vmstat.nr_active_anon
     23.83            +0.0%      23.83        proc-vmstat.nr_active_file
    184521 ±  4%     -10.2%     165770 ±  6%  proc-vmstat.nr_anon_pages
     67.17 ±  2%      +5.7%      71.00 ±  4%  proc-vmstat.nr_anon_transparent_hugepages
   6345930            +0.2%    6355941        proc-vmstat.nr_dirty_background_threshold
  12707377            +0.2%   12727424        proc-vmstat.nr_dirty_threshold
   1211851 ± 11%      -3.4%    1170700 ±  6%  proc-vmstat.nr_file_pages
  63837076            +0.2%   63937291        proc-vmstat.nr_free_pages
    670775 ± 26%     -27.8%     484074 ± 33%  proc-vmstat.nr_inactive_anon
     36.00          +123.1%      80.33 ±121%  proc-vmstat.nr_inactive_file
      0.00          -100.0%       0.00        proc-vmstat.nr_isolated_anon
    101115            +0.8%     101944        proc-vmstat.nr_kernel_stack
    380272 ± 24%     -35.6%     245022 ± 34%  proc-vmstat.nr_mapped
     41476            +2.6%      42541 ±  3%  proc-vmstat.nr_page_table_pages
    544174 ± 25%      -7.6%     502979 ± 15%  proc-vmstat.nr_shmem
     37161            -1.2%      36701        proc-vmstat.nr_slab_reclaimable
    150709            -0.5%     149975        proc-vmstat.nr_slab_unreclaimable
    667616            -0.0%     667615        proc-vmstat.nr_unevictable
     57837 ± 90%    +219.0%     184528 ± 41%  proc-vmstat.nr_zone_active_anon
     23.83            +0.0%      23.83        proc-vmstat.nr_zone_active_file
    670775 ± 26%     -27.8%     484074 ± 33%  proc-vmstat.nr_zone_inactive_anon
     36.00          +123.1%      80.33 ±121%  proc-vmstat.nr_zone_inactive_file
    667616            -0.0%     667615        proc-vmstat.nr_zone_unevictable
    222747 ±  8%      +2.7%     228701 ± 15%  proc-vmstat.numa_hint_faults
    173635 ± 18%      +9.2%     189634 ± 13%  proc-vmstat.numa_hint_faults_local
   2357897 ±  7%      -2.4%    2300524 ±  4%  proc-vmstat.numa_hit
     28.50 ± 29%      -4.1%      27.33 ± 22%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   2218804 ±  8%      -2.6%    2161084 ±  4%  proc-vmstat.numa_local
    139054 ±  2%      +1.3%     140896        proc-vmstat.numa_other
     35583 ± 62%     -70.6%      10476 ± 66%  proc-vmstat.numa_pages_migrated
    457100 ±  6%      +7.0%     489039 ±  8%  proc-vmstat.numa_pte_updates
    256118 ± 89%    +117.0%     555654 ± 38%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2970781 ±  6%      -2.2%    2905577 ±  3%  proc-vmstat.pgalloc_normal
   1567160 ±  2%      +0.6%    1576924 ±  2%  proc-vmstat.pgfault
   1931711 ±  5%      +8.4%    2093989 ±  4%  proc-vmstat.pgfree
     35583 ± 62%     -70.6%      10476 ± 66%  proc-vmstat.pgmigrate_success
      0.00       +4.7e+104%     469.33 ±223%  proc-vmstat.pgpgin
    106956 ± 16%     -19.2%      86437 ±  4%  proc-vmstat.pgreuse
     96.50 ±  2%      -0.9%      95.67 ±  6%  proc-vmstat.thp_collapse_alloc
      0.17 ±223%    -100.0%       0.00        proc-vmstat.thp_deferred_split_page
     24.33            -1.4%      24.00        proc-vmstat.thp_fault_alloc
      7.50 ± 20%     -37.8%       4.67 ± 90%  proc-vmstat.thp_migration_success
      0.17 ±223%    -100.0%       0.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     20.00            +0.0%      20.00        proc-vmstat.unevictable_pgs_culled
      0.00          -100.0%       0.00        proc-vmstat.unevictable_pgs_rescued
   1088256           +12.5%    1224704        proc-vmstat.unevictable_pgs_scanned
      7.89            -0.1%       7.88        perf-stat.i.MPKI
 4.614e+10           -10.3%  4.138e+10        perf-stat.i.branch-instructions
      0.44            +0.1        0.56        perf-stat.i.branch-miss-rate%
 2.032e+08           +13.2%    2.3e+08        perf-stat.i.branch-misses
     21.66            -1.4       20.25        perf-stat.i.cache-miss-rate%
 4.248e+08           -17.0%  3.525e+08        perf-stat.i.cache-misses
 1.944e+09           -10.9%  1.733e+09        perf-stat.i.cache-references
   3077431 ±  2%     -11.9%    2711580        perf-stat.i.context-switches
      1.29           +13.0%       1.46        perf-stat.i.cpi
    128146            -0.1%     128076        perf-stat.i.cpu-clock
 3.185e+11            +0.7%  3.206e+11        perf-stat.i.cpu-cycles
    368288 ±  2%     -12.0%     324115 ±  3%  perf-stat.i.cpu-migrations
    867.41           +15.2%     999.42 ±  3%  perf-stat.i.cycles-between-cache-misses
      0.04 ±  4%      +0.0        0.04 ± 18%  perf-stat.i.dTLB-load-miss-rate%
  25038705 ±  5%      -5.3%   23712086 ± 17%  perf-stat.i.dTLB-load-misses
 6.782e+10           -10.7%  6.054e+10        perf-stat.i.dTLB-loads
      0.01 ± 15%      -0.0        0.01 ± 35%  perf-stat.i.dTLB-store-miss-rate%
   4738345 ± 15%     -25.3%    3539963 ± 35%  perf-stat.i.dTLB-store-misses
 4.205e+10           -11.8%   3.71e+10        perf-stat.i.dTLB-stores
 2.484e+11           -10.7%  2.219e+11        perf-stat.i.instructions
      0.78           -11.3%       0.69        perf-stat.i.ipc
     95.24 ±  9%     -12.7%      83.12 ± 11%  perf-stat.i.major-faults
      2.49            +0.7%       2.50        perf-stat.i.metric.GHz
      1683           -16.9%       1398        perf-stat.i.metric.K/sec
      1233           -10.9%       1099        perf-stat.i.metric.M/sec
     11041           -12.0%       9716 ±  2%  perf-stat.i.minor-faults
     26.22            +0.5       26.76 ±  2%  perf-stat.i.node-load-miss-rate%
  31681729            -9.3%   28747178        perf-stat.i.node-load-misses
 1.002e+08           -15.6%   84491070        perf-stat.i.node-loads
      9.66 ±  4%      +1.6       11.28 ±  2%  perf-stat.i.node-store-miss-rate%
   6766738 ±  4%      -7.1%    6289457 ±  2%  perf-stat.i.node-store-misses
  71320362           -24.9%   53545044        perf-stat.i.node-stores
     11137           -12.0%       9800 ±  2%  perf-stat.i.page-faults
    128146            -0.1%     128076        perf-stat.i.task-clock
      7.83            -0.4%       7.79        perf-stat.overall.MPKI
      0.44            +0.1        0.56        perf-stat.overall.branch-miss-rate%
     21.88            -1.5       20.34        perf-stat.overall.cache-miss-rate%
      1.28           +12.7%       1.45        perf-stat.overall.cpi
    749.20           +21.8%     912.24        perf-stat.overall.cycles-between-cache-misses
      0.04 ±  5%      +0.0        0.04 ± 17%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ± 15%      -0.0        0.01 ± 35%  perf-stat.overall.dTLB-store-miss-rate%
      0.78           -11.3%       0.69        perf-stat.overall.ipc
     23.89            +1.4       25.28        perf-stat.overall.node-load-miss-rate%
      8.58 ±  4%      +1.9       10.44 ±  3%  perf-stat.overall.node-store-miss-rate%
 4.572e+10           -10.1%   4.11e+10        perf-stat.ps.branch-instructions
 2.013e+08           +13.3%  2.281e+08        perf-stat.ps.branch-misses
 4.217e+08           -17.1%  3.495e+08        perf-stat.ps.cache-misses
 1.928e+09           -10.9%  1.718e+09        perf-stat.ps.cache-references
   3050235 ±  3%     -12.3%    2674258        perf-stat.ps.context-switches
    126888            +0.2%     127125        perf-stat.ps.cpu-clock
  3.16e+11            +0.9%  3.188e+11        perf-stat.ps.cpu-cycles
    361946 ±  3%     -12.1%     318006 ±  3%  perf-stat.ps.cpu-migrations
  24904656 ±  5%      -5.4%   23558605 ± 17%  perf-stat.ps.dTLB-load-misses
 6.727e+10           -10.6%  6.012e+10        perf-stat.ps.dTLB-loads
   4770322 ± 15%     -25.9%    3533622 ± 35%  perf-stat.ps.dTLB-store-misses
 4.172e+10           -11.7%  3.683e+10        perf-stat.ps.dTLB-stores
 2.463e+11           -10.5%  2.204e+11        perf-stat.ps.instructions
     83.83 ± 10%     -12.4%      73.46 ± 11%  perf-stat.ps.major-faults
     10457 ±  2%     -11.3%       9276 ±  2%  perf-stat.ps.minor-faults
  31324505            -9.3%   28413788        perf-stat.ps.node-load-misses
  99780092           -15.8%   83992541        perf-stat.ps.node-loads
   6637608 ±  3%      -6.9%    6177673 ±  2%  perf-stat.ps.node-store-misses
  70688406           -25.1%   52979008        perf-stat.ps.node-stores
     10540 ±  2%     -11.3%       9349 ±  2%  perf-stat.ps.page-faults
    126888            +0.2%     127125        perf-stat.ps.task-clock
 3.228e+13            +1.7%  3.283e+13        perf-stat.total.instructions
      6012 ±223%    +406.4%      30451 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.avg
    769638 ±223%    +406.4%    3897744 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
     67760 ±223%    +406.4%     343166 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      9.80 ±  4%      +2.2%      10.01 ±  6%  sched_debug.cfs_rq:/.h_nr_running.avg
     26.22 ±  4%      +6.4%      27.89 ±  5%  sched_debug.cfs_rq:/.h_nr_running.max
      0.39 ± 31%     +28.6%       0.50 ± 33%  sched_debug.cfs_rq:/.h_nr_running.min
      6.24 ±  6%      +7.1%       6.69 ±  4%  sched_debug.cfs_rq:/.h_nr_running.stddev
      8564 ± 14%     +17.8%      10086 ± 25%  sched_debug.cfs_rq:/.load.avg
    139984 ±116%    +123.7%     313160 ± 97%  sched_debug.cfs_rq:/.load.max
    971.61 ± 37%      -0.2%     969.83 ± 87%  sched_debug.cfs_rq:/.load.min
     14292 ± 97%    +103.6%      29100 ± 89%  sched_debug.cfs_rq:/.load.stddev
     67.10 ±118%      +5.5%      70.81 ±114%  sched_debug.cfs_rq:/.load_avg.avg
      5505 ±185%      +0.0%       5505 ±190%  sched_debug.cfs_rq:/.load_avg.max
      1.50 ± 42%      +7.4%       1.61 ± 22%  sched_debug.cfs_rq:/.load_avg.min
    512.15 ±173%      +1.7%     520.94 ±174%  sched_debug.cfs_rq:/.load_avg.stddev
      6012 ±223%    +406.4%      30451 ± 44%  sched_debug.cfs_rq:/.max_vruntime.avg
    769639 ±223%    +406.4%    3897744 ± 44%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
     67760 ±223%    +406.4%     343166 ± 44%  sched_debug.cfs_rq:/.max_vruntime.stddev
   7166188            +0.8%    7226375        sched_debug.cfs_rq:/.min_vruntime.avg
   8577120 ±  4%      -1.0%    8492779 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
   6820655            +0.8%    6876208        sched_debug.cfs_rq:/.min_vruntime.min
    245447 ± 15%      -8.6%     224223 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.70            +0.5%       0.70        sched_debug.cfs_rq:/.nr_running.avg
      1.11 ± 14%      +0.0%       1.11 ± 14%  sched_debug.cfs_rq:/.nr_running.max
      0.39 ± 31%     +28.6%       0.50 ± 33%  sched_debug.cfs_rq:/.nr_running.min
      0.13 ± 18%      -6.3%       0.12 ± 19%  sched_debug.cfs_rq:/.nr_running.stddev
     11.89 ± 50%     +33.2%      15.84 ± 13%  sched_debug.cfs_rq:/.removed.load_avg.avg
    341.33            +0.0%     341.33        sched_debug.cfs_rq:/.removed.load_avg.max
     60.18 ± 24%     +18.4%      71.23 ±  6%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      5.62 ± 50%     +23.0%       6.91 ± 15%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    178.83 ±  5%      -2.9%     173.67        sched_debug.cfs_rq:/.removed.runnable_avg.max
     28.95 ± 25%      +9.6%      31.74 ± 10%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      5.62 ± 50%     +23.0%       6.91 ± 15%  sched_debug.cfs_rq:/.removed.util_avg.avg
    178.83 ±  5%      -2.9%     173.67        sched_debug.cfs_rq:/.removed.util_avg.max
     28.95 ± 25%      +9.6%      31.74 ± 10%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      9664 ±  2%      +5.9%      10237 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
     17420 ±  9%      +5.8%      18425 ±  8%  sched_debug.cfs_rq:/.runnable_avg.max
      1437 ± 24%     +26.9%       1824 ± 67%  sched_debug.cfs_rq:/.runnable_avg.min
      2599 ± 10%     +11.2%       2890 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.01 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.avg
      0.67 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.max
      0.06 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.stddev
   -766365           -12.3%    -672372        sched_debug.cfs_rq:/.spread0.avg
    645136 ± 73%      -7.4%     597334 ± 51%  sched_debug.cfs_rq:/.spread0.max
  -1117523            -7.6%   -1033142        sched_debug.cfs_rq:/.spread0.min
    247419 ± 16%      -8.1%     227321 ± 11%  sched_debug.cfs_rq:/.spread0.stddev
    737.45            +1.1%     745.64        sched_debug.cfs_rq:/.util_avg.avg
      1600 ±  7%      -2.6%       1557 ±  2%  sched_debug.cfs_rq:/.util_avg.max
    155.44 ± 51%      -3.9%     149.44 ± 53%  sched_debug.cfs_rq:/.util_avg.min
    254.16 ±  3%      +2.8%     261.35 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
    297.23 ±  6%      +7.8%     320.27 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1152 ± 10%      +5.4%       1214 ±  8%  sched_debug.cfs_rq:/.util_est_enqueued.max
      6.33 ± 71%     -15.8%       5.33 ±112%  sched_debug.cfs_rq:/.util_est_enqueued.min
    227.09 ±  8%     +11.4%     252.94 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    399944 ±  7%      -1.5%     393920        sched_debug.cpu.avg_idle.avg
   1018824 ± 23%      -2.4%     994041 ± 16%  sched_debug.cpu.avg_idle.max
     21801 ± 29%     +16.2%      25333 ± 28%  sched_debug.cpu.avg_idle.min
    149545 ± 17%      -2.0%     146605 ±  6%  sched_debug.cpu.avg_idle.stddev
    126941 ± 11%      -3.3%     122789 ±  3%  sched_debug.cpu.clock.avg
    127115 ± 11%      -3.3%     122959 ±  3%  sched_debug.cpu.clock.max
    126785 ± 12%      -3.3%     122578 ±  3%  sched_debug.cpu.clock.min
     94.97 ± 15%     +18.6%     112.61 ± 17%  sched_debug.cpu.clock.stddev
    125577 ± 11%      -3.1%     121735 ±  3%  sched_debug.cpu.clock_task.avg
    126079 ± 11%      -3.1%     122117 ±  3%  sched_debug.cpu.clock_task.max
    107169 ±  2%      +1.9%     109203 ±  2%  sched_debug.cpu.clock_task.min
      1655 ± 82%     -31.4%       1135 ± 28%  sched_debug.cpu.clock_task.stddev
     13029            +0.8%      13134        sched_debug.cpu.curr->pid.avg
     16269            +0.4%      16327        sched_debug.cpu.curr->pid.max
      5580 ± 34%     +10.2%       6152 ± 45%  sched_debug.cpu.curr->pid.min
      1689 ±  8%      +0.1%       1691 ± 12%  sched_debug.cpu.curr->pid.stddev
    512493 ±  2%      -1.9%     502714        sched_debug.cpu.max_idle_balance_cost.avg
    792415 ± 48%     -18.6%     645400 ± 21%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
     38802 ±121%     -58.1%      16259 ±100%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            -0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            -0.0%       4294        sched_debug.cpu.next_balance.max
      4294            -0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 15%     +17.2%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
      9.78 ±  4%      +2.7%      10.04 ±  6%  sched_debug.cpu.nr_running.avg
     26.22 ±  4%      +6.4%      27.89 ±  5%  sched_debug.cpu.nr_running.max
      0.44 ± 35%      +0.0%       0.44 ± 35%  sched_debug.cpu.nr_running.min
      6.25 ±  5%      +7.0%       6.69 ±  4%  sched_debug.cpu.nr_running.stddev
   1385407           -10.1%    1245150        sched_debug.cpu.nr_switches.avg
   1679912 ±  6%      -9.6%    1519284        sched_debug.cpu.nr_switches.max
   1217710           -11.1%    1083080 ±  2%  sched_debug.cpu.nr_switches.min
     77056 ± 20%      +2.6%      79059 ± 14%  sched_debug.cpu.nr_switches.stddev
 2.071e+09 ±  3%      +3.1%  2.134e+09 ±  5%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
 2.144e+09            -0.1%  2.142e+09        sched_debug.cpu.nr_uninterruptible.stddev
    126784 ± 12%      -3.3%     122575 ±  3%  sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
    125555 ± 12%      -3.4%     121347 ±  3%  sched_debug.ktime
      0.00 ± 70%     +25.0%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.avg
      0.22 ± 70%     +25.0%       0.28 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.max
      0.02 ± 70%     +25.0%       0.02 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ± 70%     +25.0%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_running.avg
      0.22 ± 70%     +25.0%       0.28 ± 44%  sched_debug.rt_rq:.rt_nr_running.max
      0.02 ± 70%     +25.0%       0.02 ± 44%  sched_debug.rt_rq:.rt_nr_running.stddev
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.00        +4.3e+98%       0.00 ±223%  sched_debug.rt_rq:.rt_throttled.avg
      0.00       +5.6e+100%       0.06 ±223%  sched_debug.rt_rq:.rt_throttled.max
      0.00        +4.9e+99%       0.00 ±223%  sched_debug.rt_rq:.rt_throttled.stddev
      0.96 ± 77%     +30.4%       1.26 ± 59%  sched_debug.rt_rq:.rt_time.avg
    123.43 ± 77%     +30.1%     160.60 ± 59%  sched_debug.rt_rq:.rt_time.max
      0.00        +1.3e+99%       0.00 ±223%  sched_debug.rt_rq:.rt_time.min
     10.87 ± 77%     +30.1%      14.14 ± 59%  sched_debug.rt_rq:.rt_time.stddev
    116194 ±  2%      +1.6%     118042 ±  2%  sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      5.74 ±  2%      -1.7        4.00 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.68 ± 14%      -1.7        0.00        perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.48 ± 15%      -1.5        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.40 ± 16%      -1.4        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      8.92            -1.3        7.58 ±  4%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      9.03            -1.3        7.69 ±  4%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      8.74            -1.3        7.43 ±  4%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      5.61            -1.3        4.32 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.17 ± 13%      -1.2        0.00        perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      1.58 ± 10%      -1.0        0.57 ±  7%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      4.85            -1.0        3.87 ±  4%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
     52.86            -0.9       51.92        perf-profile.calltrace.cycles-pp.__libc_read
      4.60            -0.9        3.66 ±  5%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.60            -0.9        2.66 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.94 ± 17%      -0.9        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      0.92 ± 17%      -0.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
      4.45            -0.9        3.53 ±  5%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      4.41            -0.9        3.51 ±  4%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      4.19            -0.9        3.32 ±  5%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
     46.92            -0.8       46.13        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     47.92            -0.8       47.14        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     49.96            -0.8       49.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read
     49.54            -0.7       48.81        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      3.52            -0.7        2.85 ±  5%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.37            -0.6        2.74 ±  4%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.60 ±  4%      -0.6        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state
      0.60 ±  4%      -0.6        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm
      0.59 ±  4%      -0.6        0.00        perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree
      0.53            -0.5        0.00        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      2.27            -0.5        1.79 ±  7%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.91 ±  2%      -0.5        1.44 ± 12%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.46 ± 44%      -0.5        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space
      1.77 ±  2%      -0.4        1.32 ± 12%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.61            -0.4        0.17 ±141%  perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.44 ± 44%      -0.4        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
     44.14            -0.4       43.71        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67            -0.4        0.27 ±100%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg
      2.10            -0.4        1.71 ±  5%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.80            -0.4        1.42 ±  4%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.98            -0.3        1.63 ±  4%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write
      0.70            -0.3        0.37 ± 70%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.62 ±  3%      -0.3        1.30 ±  4%  perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.76            -0.3        1.45 ±  4%  perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.87            -0.3        1.58 ±  4%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read
      0.46 ± 44%      -0.3        0.17 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      3.58            -0.3        3.30 ±  5%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      1.68            -0.3        1.40 ±  4%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     43.12            -0.3       42.84        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
      3.33            -0.3        3.06 ±  5%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      0.62 ±  2%      -0.3        0.35 ± 70%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.60            -0.3        0.34 ± 70%  perf-profile.calltrace.cycles-pp.mod_objcg_state.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      1.22 ±  5%      -0.3        0.97 ±  4%  perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.72            -0.3        0.47 ± 45%  perf-profile.calltrace.cycles-pp.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.17 ±  2%      -0.3        0.91 ±  6%  perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      1.27            -0.2        1.06 ±  4%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.64            -0.2        0.44 ± 44%  perf-profile.calltrace.cycles-pp.mod_objcg_state.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      0.64            -0.2        0.46 ± 44%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_write.ksys_write.do_syscall_64
      1.10            -0.2        0.91 ±  6%  perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      2.58            -0.2        2.40 ±  5%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.84 ±  2%      -0.2        0.68 ±  4%  perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.84            -0.1        0.70 ±  3%  perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.92            -0.1        0.78 ±  3%  perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.88            -0.1        0.74 ±  4%  perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.80 ±  2%      -0.1        0.67 ±  7%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.74 ±  4%      -0.1        0.61 ±  5%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.72            -0.1        0.59 ±  4%  perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.83            -0.1        0.70 ±  4%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.88            -0.1        0.76 ±  4%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            -0.1        0.54 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.68            -0.1        0.56 ±  4%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
     41.91            -0.1       41.80        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.82            -0.1        0.70 ±  6%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.68            -0.1        0.57 ±  4%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_read.ksys_read.do_syscall_64
      0.63            -0.1        0.53 ±  4%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      0.72            -0.1        0.63 ±  7%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.mutex_unlock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     41.50            -0.1       41.43        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      1.11            -0.1        1.05 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.54 ±  3%      -0.1        0.48 ± 44%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            -0.0        0.63 ±  3%  perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.89            -0.0        0.86 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.63 ±  2%      +0.0        0.63 ±  7%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     42.41            +0.2       42.59        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.2        0.20 ±144%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.20 ±144%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.20 ±144%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.21 ±144%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.3        0.27 ±100%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
     46.68            +0.3       47.01        perf-profile.calltrace.cycles-pp.__libc_write
     41.23            +0.3       41.57        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.65            +0.5        1.17 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.5        0.53 ±  2%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.5        0.54 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.6        0.56 ± 10%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.6        0.57 ±  6%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.6        0.60 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg
      0.00            +0.6        0.60 ±  9%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.61 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00            +0.6        0.61 ± 11%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.6        0.62 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.6        0.64 ±  5%  perf-profile.calltrace.cycles-pp.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00            +0.6        0.64 ± 10%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.schedule_timeout
     43.99            +0.6       44.63        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     43.57            +0.7       44.25        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.7        0.70 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.54            +0.8       39.32        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.59 ±  2%      +1.0        1.55 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.53            +1.0        1.49 ±  5%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.62 ±  2%      +1.0        1.60 ±  5%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +1.0        0.99 ±  3%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.75            +1.1        1.81 ±  4%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     35.84            +1.2       37.07        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      3.95 ±  3%      +1.4        5.38 ±  4%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.84            +1.7        3.56 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      1.89            +1.7        3.63 ±  3%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      1.97            +1.8        3.76 ±  3%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.59 ±  3%      +1.9        3.44 ±  6%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      2.28 ±  4%      +1.9        4.15 ±  5%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.62 ±  3%      +1.9        3.49 ±  6%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      1.72 ±  3%      +1.9        3.61 ±  6%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      2.36            +2.0        4.39 ±  2%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     19.25            +2.7       21.94 ±  5%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     15.50            +3.0       18.48 ±  7%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     15.12            +3.0       18.17 ±  7%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     13.84            +3.4       17.23 ±  7%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      8.66            +4.4       13.08 ± 11%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      7.34            +5.1       12.49 ± 12%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      6.80            +5.2       12.04 ± 13%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.24            +5.3       11.56 ± 13%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      1.34 ±  7%      +5.5        6.87 ± 24%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
      1.43 ±  7%      +5.5        6.95 ± 24%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
      0.90 ±  8%      +5.7        6.61 ± 25%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
      1.62 ±  7%      +5.7        7.34 ± 23%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.91 ±  8%      +5.7        6.65 ± 25%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      1.15 ±  7%      +6.0        7.10 ± 24%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      1.57 ±  5%      +6.2        7.74 ± 22%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      5.90 ±  2%      -1.8        4.14 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      8.96            -1.4        7.62 ±  4%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      9.08            -1.3        7.73 ±  4%  perf-profile.children.cycles-pp.unix_stream_read_actor
      8.81            -1.3        7.48 ±  4%  perf-profile.children.cycles-pp.__skb_datagram_iter
      5.68            -1.3        4.39 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      4.90            -1.0        3.91 ±  4%  perf-profile.children.cycles-pp._copy_to_iter
     52.96            -1.0       52.01        perf-profile.children.cycles-pp.__libc_read
      4.65            -0.9        3.70 ±  5%  perf-profile.children.cycles-pp.skb_release_head_state
      4.55            -0.9        3.62 ±  4%  perf-profile.children.cycles-pp.copyout
      4.51            -0.9        3.59 ±  5%  perf-profile.children.cycles-pp.unix_destruct_scm
      4.24            -0.9        3.36 ±  5%  perf-profile.children.cycles-pp.sock_wfree
     47.07            -0.8       46.25        perf-profile.children.cycles-pp.vfs_read
     48.00            -0.8       47.21        perf-profile.children.cycles-pp.ksys_read
      3.91            -0.7        3.21 ±  4%  perf-profile.children.cycles-pp.__slab_free
      3.60            -0.7        2.91 ±  5%  perf-profile.children.cycles-pp.__kmem_cache_free
      3.59            -0.7        2.90 ±  4%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      3.46            -0.6        2.82 ±  4%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      4.58            -0.5        4.05 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
      4.97            -0.5        4.45 ±  5%  perf-profile.children.cycles-pp.__check_object_size
      3.07            -0.5        2.56 ±  3%  perf-profile.children.cycles-pp.mod_objcg_state
      1.96 ±  2%      -0.5        1.48 ± 11%  perf-profile.children.cycles-pp.skb_queue_tail
      2.30            -0.5        1.81 ±  7%  perf-profile.children.cycles-pp.skb_set_owner_w
     44.18            -0.4       43.76        perf-profile.children.cycles-pp.sock_read_iter
      2.26            -0.4        1.88 ±  4%  perf-profile.children.cycles-pp.__entry_text_start
      1.69 ±  3%      -0.3        1.36 ±  4%  perf-profile.children.cycles-pp._copy_from_iter
      3.40            -0.3        3.08 ±  5%  perf-profile.children.cycles-pp.check_heap_object
      3.63            -0.3        3.34 ±  5%  perf-profile.children.cycles-pp.simple_copy_to_iter
     43.20            -0.3       42.90        perf-profile.children.cycles-pp.sock_recvmsg
      1.69            -0.3        1.41 ±  3%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.35 ±  4%      -0.3        1.08 ±  4%  perf-profile.children.cycles-pp.copyin
      1.84            -0.3        1.58 ±  4%  perf-profile.children.cycles-pp.security_file_permission
      1.47 ±  2%      -0.3        1.21 ±  5%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      1.19 ±  2%      -0.3        0.93 ±  6%  perf-profile.children.cycles-pp.unix_write_space
      1.52            -0.2        1.28 ±  6%  perf-profile.children.cycles-pp.aa_sk_perm
      1.32            -0.2        1.08 ±  4%  perf-profile.children.cycles-pp.obj_cgroup_charge
      1.43            -0.2        1.20 ±  4%  perf-profile.children.cycles-pp.apparmor_file_permission
      1.15            -0.2        0.95 ±  6%  perf-profile.children.cycles-pp.security_socket_sendmsg
      1.28            -0.2        1.09 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.89 ±  2%      -0.2        0.72 ±  4%  perf-profile.children.cycles-pp.skb_unlink
      0.96            -0.2        0.82 ±  3%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.75 ±  6%      -0.1        0.61 ±  5%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.80            -0.1        0.67 ±  3%  perf-profile.children.cycles-pp.refill_obj_stock
      0.64            -0.1        0.51 ±  3%  perf-profile.children.cycles-pp.__build_skb_around
     41.96            -0.1       41.84        perf-profile.children.cycles-pp.unix_stream_recvmsg
      1.54 ±  2%      -0.1        1.43 ±  6%  perf-profile.children.cycles-pp.__fdget_pos
      0.15 ± 47%      -0.1        0.04 ±223%  perf-profile.children.cycles-pp.record__finish_output
     41.72            -0.1       41.62        perf-profile.children.cycles-pp.unix_stream_read_generic
      0.71 ±  2%      -0.1        0.61 ±  5%  perf-profile.children.cycles-pp.__check_heap_object
      0.14 ± 72%      -0.1        0.04 ±223%  perf-profile.children.cycles-pp.__cmd_record
      0.64 ±  3%      -0.1        0.55 ±  4%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.51            -0.1        0.42 ±  4%  perf-profile.children.cycles-pp.mutex_unlock
      0.52            -0.1        0.44 ±  3%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.47            -0.1        0.39 ±  5%  perf-profile.children.cycles-pp.aa_file_perm
      0.48            -0.1        0.40 ±  4%  perf-profile.children.cycles-pp.rcu_all_qs
      0.57            -0.1        0.49 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.16 ± 44%      -0.1        0.09 ±141%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.40 ±  4%      -0.1        0.33 ±  5%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      1.31 ±  2%      -0.1        1.23 ±  7%  perf-profile.children.cycles-pp.__fget_light
      0.48 ±  2%      -0.1        0.40 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.47 ±  2%      -0.1        0.40 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.53 ±  2%      -0.1        0.46 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.15 ± 47%      -0.1        0.08 ±142%  perf-profile.children.cycles-pp.perf_session__process_events
      0.15 ± 47%      -0.1        0.08 ±142%  perf-profile.children.cycles-pp.reader__read_event
      0.36 ±  2%      -0.1        0.30 ±  4%  perf-profile.children.cycles-pp.wait_for_unix_gc
      0.12 ± 60%      -0.1        0.06 ±145%  perf-profile.children.cycles-pp.process_simple
      0.42 ±  3%      -0.1        0.36 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.42 ±  2%      -0.1        0.36 ±  3%  perf-profile.children.cycles-pp.kmalloc_slab
      0.59            -0.1        0.53 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.36 ±  3%      -0.1        0.30 ±  7%  perf-profile.children.cycles-pp.tick_sched_handle
      0.38 ±  5%      -0.1        0.32 ±  6%  perf-profile.children.cycles-pp.tick_sched_timer
      0.44            -0.1        0.39 ±  5%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.35 ±  3%      -0.1        0.29 ±  6%  perf-profile.children.cycles-pp.update_process_times
      0.12 ± 73%      -0.1        0.06 ±145%  perf-profile.children.cycles-pp.queue_event
      0.12 ± 73%      -0.1        0.06 ±145%  perf-profile.children.cycles-pp.ordered_events__queue
      0.33 ±  3%      -0.1        0.28 ±  8%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.11 ± 44%      -0.1        0.06 ±141%  perf-profile.children.cycles-pp.perf_tp_event
      0.22 ±  6%      -0.1        0.17 ±  7%  perf-profile.children.cycles-pp.task_tick_fair
      0.28 ±  3%      -0.1        0.22 ±  7%  perf-profile.children.cycles-pp.scheduler_tick
      0.33 ±  2%      -0.0        0.28 ±  3%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.33 ±  2%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.34            -0.0        0.29 ±  3%  perf-profile.children.cycles-pp.task_work_run
      0.24            -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      0.24            -0.0        0.20 ±  4%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.22            -0.0        0.18 ± 12%  perf-profile.children.cycles-pp.newidle_balance
      0.71            -0.0        0.67 ±  3%  perf-profile.children.cycles-pp.mutex_lock
      0.29 ±  2%      -0.0        0.25 ±  4%  perf-profile.children.cycles-pp.scm_recv
      0.24 ±  2%      -0.0        0.20 ±  4%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.22            -0.0        0.18 ± 12%  perf-profile.children.cycles-pp.load_balance
      0.21 ±  2%      -0.0        0.17 ±  5%  perf-profile.children.cycles-pp.put_pid
      0.22 ±  2%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.kfree
      0.27            -0.0        0.24 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.22 ±  4%      -0.0        0.18 ±  6%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.22            -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.18 ±  2%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.fsnotify_perm
      0.16            -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.refill_stock
      0.10            -0.0        0.08 ± 14%  perf-profile.children.cycles-pp.detach_tasks
      0.12 ±  3%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.unix_passcred_enabled
      0.34            -0.0        0.32 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.15 ±  3%      -0.0        0.13 ±  4%  perf-profile.children.cycles-pp.try_charge_memcg
      0.11            -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.should_failslab
      0.10            -0.0        0.08        perf-profile.children.cycles-pp.obj_cgroup_uncharge
      0.14 ±  8%      -0.0        0.12 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.11 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.skb_free_head
      0.06            -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.apparmor_socket_getpeersec_dgram
      0.12            -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.skb_put
      0.22            -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.09            -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.kfree_skbmem
      0.03 ±143%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.03 ±143%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.04 ± 44%      -0.0        0.03 ±141%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.07 ±  6%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.apparmor_socket_recvmsg
      0.07 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.apparmor_socket_sendmsg
      0.14 ±  8%      -0.0        0.14 ± 18%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.12 ±  3%      +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.task_h_load
      0.18 ±  2%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.select_idle_core
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.14            +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.put_cpu_partial
      0.11 ±  3%      +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.06            +0.0        0.07 ±  9%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.set_next_buddy
      0.07 ±  7%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.cpuacct_charge
      0.05 ±  7%      +0.0        0.07        perf-profile.children.cycles-pp.rb_erase
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.wait_consider_task
      0.08 ±  5%      +0.0        0.11        perf-profile.children.cycles-pp.update_min_vruntime
     94.09            +0.0       94.12        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.12 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.__list_add_valid
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.get_any_partial
      0.05            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.native_sched_clock
      0.02 ±141%      +0.0        0.05        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.04 ± 45%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.set_task_cpu
      0.00            +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.wait4
      0.00            +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.__do_sys_wait4
      0.00            +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.kernel_wait4
      0.00            +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.do_wait
      0.10 ±  5%      +0.0        0.14 ±  4%  perf-profile.children.cycles-pp.__x64_sys_write
      0.06            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.10            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.os_xsave
      0.09 ±  5%      +0.0        0.14 ±  4%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.00            +0.1        0.05 ± 46%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp._find_next_bit
      0.28            +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.06 ±  7%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.09 ±  5%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.finish_task_switch
      0.13 ±  2%      +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.check_preempt_curr
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.schedule_idle
     93.42            +0.1       93.48        perf-profile.children.cycles-pp.do_syscall_64
      0.10 ±  5%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.pick_next_entity
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.22 ±  3%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.__switch_to_asm
      0.19            +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.__switch_to
      0.13            +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.13 ±  2%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.reweight_entity
      0.34            +0.1        0.43        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.17 ±  4%      +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.13 ±  2%      +0.1        0.24 ±  5%  perf-profile.children.cycles-pp.___perf_sw_event
      0.44            +0.1        0.56        perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.finish_wait
      0.18 ±  2%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.prepare_task_switch
      0.20 ±  2%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.set_next_entity
      0.09 ±  4%      +0.2        0.24 ±  6%  perf-profile.children.cycles-pp.__x64_sys_read
      0.45 ±  3%      +0.2        0.60 ±  6%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.2        0.17 ± 14%  perf-profile.children.cycles-pp.available_idle_cpu
     42.50            +0.2       42.67        perf-profile.children.cycles-pp.ksys_write
      0.00            +0.2        0.19 ± 18%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.2        0.20 ± 18%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.41 ±  3%      +0.2        0.63 ±  5%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.2        0.22 ± 19%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.66            +0.2        0.91 ±  2%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.3        0.28 ± 16%  perf-profile.children.cycles-pp.select_idle_cpu
      0.47 ±  2%      +0.3        0.77 ±  2%  perf-profile.children.cycles-pp.switch_mm_irqs_off
     46.80            +0.3       47.12        perf-profile.children.cycles-pp.__libc_write
     41.36            +0.3       41.68        perf-profile.children.cycles-pp.vfs_write
      0.06 ±  7%      +0.3        0.40 ± 15%  perf-profile.children.cycles-pp.select_idle_sibling
      0.51 ±  2%      +0.4        0.86 ±  3%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.4        0.36 ± 21%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.28 ±  2%      +0.4        0.64 ±  9%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.32 ±  4%      +0.4        0.69 ±  7%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.4        0.38 ± 19%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.00            +0.4        0.38 ± 19%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.00            +0.4        0.39 ± 19%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.4        0.39 ± 18%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.4        0.42 ± 19%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.68            +0.4        1.10 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      1.94            +0.4        2.38        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.42            +0.5        1.92        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.5        0.51 ± 18%  perf-profile.children.cycles-pp.start_secondary
      0.60            +0.5        1.12 ±  3%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.5        0.52 ± 18%  perf-profile.children.cycles-pp.do_idle
      0.00            +0.5        0.52 ± 18%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.5        0.52 ± 18%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.42 ±  4%      +0.5        0.95 ±  3%  perf-profile.children.cycles-pp.prepare_to_wait
     38.64            +0.8       39.40        perf-profile.children.cycles-pp.sock_write_iter
      0.77            +0.9        1.68 ±  5%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.85 ±  2%      +1.0        1.89 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.93 ±  2%      +1.1        1.99 ±  4%  perf-profile.children.cycles-pp.activate_task
      0.40 ±  4%      +1.1        1.53 ±  9%  perf-profile.children.cycles-pp.update_cfs_group
      1.02 ±  2%      +1.2        2.18 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
     36.19            +1.2       37.36        perf-profile.children.cycles-pp.unix_stream_sendmsg
      3.97 ±  3%      +1.4        5.40 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      2.70            +1.6        4.31 ±  3%  perf-profile.children.cycles-pp.schedule_timeout
      2.21 ±  3%      +1.7        3.92 ±  6%  perf-profile.children.cycles-pp.autoremove_wake_function
      2.14 ±  4%      +1.7        3.85 ±  6%  perf-profile.children.cycles-pp.try_to_wake_up
      2.89 ±  4%      +1.7        4.61 ±  5%  perf-profile.children.cycles-pp.__wake_up_common_lock
      2.32 ±  3%      +1.7        4.04 ±  5%  perf-profile.children.cycles-pp.__wake_up_common
      2.92            +2.0        4.94 ±  3%  perf-profile.children.cycles-pp.schedule
      2.37            +2.0        4.42 ±  2%  perf-profile.children.cycles-pp.unix_stream_data_wait
      2.88            +2.1        4.94 ±  3%  perf-profile.children.cycles-pp.__schedule
     19.32            +2.7       22.00 ±  5%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     15.55            +3.0       18.52 ±  7%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     15.24            +3.0       18.27 ±  7%  perf-profile.children.cycles-pp.__alloc_skb
     13.95            +3.4       17.32 ±  7%  perf-profile.children.cycles-pp.consume_skb
      3.30 ±  9%      +4.4        7.68 ± 23%  perf-profile.children.cycles-pp.__unfreeze_partials
      8.71            +4.4       13.12 ± 11%  perf-profile.children.cycles-pp.skb_release_data
      2.34 ±  9%      +5.1        7.44 ± 23%  perf-profile.children.cycles-pp.get_partial_node
      7.46            +5.1       12.59 ± 12%  perf-profile.children.cycles-pp.kmalloc_reserve
      3.15 ±  7%      +5.2        8.32 ± 21%  perf-profile.children.cycles-pp.___slab_alloc
      6.90            +5.2       12.12 ± 12%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      6.41            +5.3       11.71 ± 13%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      8.25 ±  5%      +9.1       17.40 ± 18%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      5.92 ±  8%      +9.8       15.75 ± 21%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      4.31            -1.1        3.25 ±  5%  perf-profile.self.cycles-pp.kmem_cache_free
      4.50            -0.9        3.58 ±  4%  perf-profile.self.cycles-pp.copyout
      4.20            -0.8        3.42 ±  5%  perf-profile.self.cycles-pp.unix_stream_read_generic
      3.86            -0.7        3.15 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
      2.84            -0.7        2.15 ±  9%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      3.84            -0.7        3.15 ±  4%  perf-profile.self.cycles-pp.__slab_free
      3.02            -0.6        2.41 ±  5%  perf-profile.self.cycles-pp.sock_wfree
      2.93            -0.5        2.44 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      2.26            -0.5        1.78 ±  6%  perf-profile.self.cycles-pp.skb_set_owner_w
      2.75            -0.5        2.28 ±  3%  perf-profile.self.cycles-pp.mod_objcg_state
      2.27            -0.5        1.81 ±  4%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      1.64 ±  2%      -0.4        1.19 ± 12%  perf-profile.self.cycles-pp.sock_def_readable
      2.06            -0.4        1.63 ±  6%  perf-profile.self.cycles-pp.__kmem_cache_free
      1.64            -0.3        1.37 ±  3%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.30 ±  4%      -0.3        1.03 ±  4%  perf-profile.self.cycles-pp.copyin
      1.54            -0.3        1.28 ±  3%  perf-profile.self.cycles-pp.vfs_write
      1.32            -0.2        1.10 ±  4%  perf-profile.self.cycles-pp.sock_write_iter
      1.30            -0.2        1.08 ±  4%  perf-profile.self.cycles-pp.__alloc_skb
      2.53            -0.2        2.31 ±  5%  perf-profile.self.cycles-pp.check_heap_object
      1.38            -0.2        1.17 ±  2%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      1.02 ±  2%      -0.2        0.81 ±  3%  perf-profile.self.cycles-pp.skb_release_data
      1.47            -0.2        1.29 ±  3%  perf-profile.self.cycles-pp.vfs_read
      1.12            -0.2        0.95 ±  6%  perf-profile.self.cycles-pp.aa_sk_perm
      1.05            -0.2        0.88 ±  3%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.84            -0.2        0.68 ±  4%  perf-profile.self.cycles-pp.obj_cgroup_charge
      1.02            -0.2        0.88 ±  4%  perf-profile.self.cycles-pp.__libc_write
      0.93 ±  2%      -0.1        0.78 ±  5%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.97            -0.1        0.84 ±  3%  perf-profile.self.cycles-pp.sock_read_iter
      0.69 ±  6%      -0.1        0.56 ±  6%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.71 ±  2%      -0.1        0.59 ±  4%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.74            -0.1        0.62 ±  3%  perf-profile.self.cycles-pp.refill_obj_stock
      0.66            -0.1        0.54 ±  5%  perf-profile.self.cycles-pp.__entry_text_start
      0.59            -0.1        0.47 ±  3%  perf-profile.self.cycles-pp.__build_skb_around
      0.76            -0.1        0.65 ±  3%  perf-profile.self.cycles-pp.__cond_resched
      0.52            -0.1        0.42 ±  4%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.59            -0.1        0.50 ±  3%  perf-profile.self.cycles-pp.consume_skb
      0.72            -0.1        0.63 ±  3%  perf-profile.self.cycles-pp.__check_object_size
      0.66 ±  3%      -0.1        0.57 ±  5%  perf-profile.self.cycles-pp.__check_heap_object
      0.49            -0.1        0.40 ±  3%  perf-profile.self.cycles-pp.mutex_unlock
      1.05 ±  4%      -0.1        0.97 ±  5%  perf-profile.self.cycles-pp.__libc_read
      0.56            -0.1        0.48 ±  4%  perf-profile.self.cycles-pp.unix_write_space
      0.59 ±  2%      -0.1        0.51 ±  4%  perf-profile.self.cycles-pp.__virt_addr_valid
      1.25 ±  2%      -0.1        1.18 ±  7%  perf-profile.self.cycles-pp.__fget_light
      0.56            -0.1        0.49 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.45            -0.1        0.38 ±  4%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.41 ±  2%      -0.1        0.34 ±  6%  perf-profile.self.cycles-pp.aa_file_perm
      0.36            -0.1        0.29 ±  5%  perf-profile.self.cycles-pp._copy_from_iter
      0.37            -0.1        0.31 ±  4%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.34            -0.1        0.28 ±  4%  perf-profile.self.cycles-pp.rcu_all_qs
      0.11 ± 73%      -0.1        0.06 ±144%  perf-profile.self.cycles-pp.queue_event
      0.34 ±  2%      -0.1        0.29 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      0.77            -0.1        0.71 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.31            -0.1        0.25 ±  4%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.36 ±  3%      -0.1        0.31 ±  4%  perf-profile.self.cycles-pp.kmalloc_slab
      0.10 ± 44%      -0.1        0.04 ±141%  perf-profile.self.cycles-pp.perf_tp_event
      0.32            -0.1        0.28 ±  5%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.05            -0.1        0.00        perf-profile.self.cycles-pp.apparmor_socket_sendmsg
      0.05            -0.1        0.00        perf-profile.self.cycles-pp.apparmor_socket_recvmsg
      0.20 ±  7%      -0.0        0.15 ± 10%  perf-profile.self.cycles-pp.skb_unlink
      0.30 ±  2%      -0.0        0.25 ±  4%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.32            -0.0        0.27 ±  3%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.30 ±  2%      -0.0        0.26 ±  3%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.50            -0.0        0.45 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.26            -0.0        0.22 ±  7%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.45            -0.0        0.40 ±  3%  perf-profile.self.cycles-pp.security_file_permission
      0.38            -0.0        0.33 ±  5%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.24 ±  2%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.23 ±  3%      -0.0        0.19 ±  4%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.22 ±  2%      -0.0        0.18 ±  4%  perf-profile.self.cycles-pp.security_socket_sendmsg
      0.12 ± 14%      -0.0        0.08 ± 10%  perf-profile.self.cycles-pp.obj_cgroup_uncharge_pages
      0.29            -0.0        0.26 ±  4%  perf-profile.self.cycles-pp.ksys_write
      0.20            -0.0        0.17 ±  4%  perf-profile.self.cycles-pp.kfree
      0.19 ±  3%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.03 ± 70%      -0.0        0.00        perf-profile.self.cycles-pp.obj_cgroup_uncharge
      0.24            -0.0        0.20 ±  4%  perf-profile.self.cycles-pp.__fdget_pos
      0.25 ±  5%      -0.0        0.22 ±  5%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.19 ±  2%      -0.0        0.15 ±  4%  perf-profile.self.cycles-pp.rw_verify_area
      0.17 ±  2%      -0.0        0.14 ±  5%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.18 ±  2%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.17 ±  2%      -0.0        0.14 ±  5%  perf-profile.self.cycles-pp.skb_queue_tail
      0.29            -0.0        0.26 ±  4%  perf-profile.self.cycles-pp.sock_recvmsg
      0.30            -0.0        0.27 ±  3%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.22 ±  2%      -0.0        0.20 ±  4%  perf-profile.self.cycles-pp.scm_recv
      0.16 ±  2%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.16 ±  3%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.fsnotify_perm
      0.17            -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.check_stack_object
      0.14 ±  2%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.put_pid
      0.10            -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.unix_passcred_enabled
      0.26 ±  2%      -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.14 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.wait_for_unix_gc
      0.24            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.04 ± 44%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.select_task_rq
      0.12 ±  4%      -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.simple_copy_to_iter
      0.14 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.46            -0.0        0.44 ±  3%  perf-profile.self.cycles-pp.mutex_lock
      0.14 ±  5%      -0.0        0.12 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06            -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.should_failslab
      0.18 ±  2%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.refill_stock
      0.09            -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.skb_free_head
      0.10 ±  5%      -0.0        0.08 ±  7%  perf-profile.self.cycles-pp.skb_put
      0.11            -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.skb_release_head_state
      0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.try_charge_memcg
      0.04 ± 44%      -0.0        0.03 ±141%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.07 ±  5%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.kfree_skbmem
      0.12 ±  8%      -0.0        0.11 ± 17%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.17            -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.is_vmalloc_addr
      0.12 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.task_h_load
      0.11            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.set_next_buddy
      0.14 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.put_cpu_partial
      0.06            +0.0        0.07 ±  8%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.05            +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.rb_erase
      0.28 ±  2%      +0.0        0.30 ±  3%  perf-profile.self.cycles-pp.ksys_read
      0.06 ±  7%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__wake_up_common
      0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.08 ±  6%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.wait_consider_task
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.__list_add_valid
      0.06            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.dequeue_entity
      0.05            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.09 ±  5%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.switch_fpu_return
      0.06            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.schedule
      0.11            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.02 ± 99%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.05 ±  8%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.reweight_entity
      0.02 ±141%      +0.0        0.05 ±  7%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.00            +0.0        0.04 ± 71%  perf-profile.self.cycles-pp._find_next_bit
      0.06 ±  6%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.07 ±  7%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08 ±  6%      +0.0        0.12 ± 12%  perf-profile.self.cycles-pp.prepare_task_switch
      0.02 ± 99%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.11            +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.schedule_timeout
      0.09            +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.10            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.os_xsave
      0.18 ±  4%      +0.0        0.22        perf-profile.self.cycles-pp.enqueue_entity
      0.08 ±  6%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.prepare_to_wait
      0.05            +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.__x64_sys_write
      0.27            +0.1        0.32        perf-profile.self.cycles-pp.__list_del_entry_valid
      0.11 ±  4%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.pick_next_entity
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__calc_delta
      0.28 ±  3%      +0.1        0.34 ±  4%  perf-profile.self.cycles-pp.get_partial_node
      0.79            +0.1        0.86 ±  2%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.select_idle_sibling
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.07 ±  8%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.20 ±  2%      +0.1        0.28 ±  6%  perf-profile.self.cycles-pp.update_curr
      0.18 ±  2%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.__switch_to
      0.22 ±  4%      +0.1        0.30 ±  4%  perf-profile.self.cycles-pp.__switch_to_asm
      0.12            +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.34            +0.1        0.43        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.15 ±  3%      +0.1        0.25 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.12 ±  4%      +0.1        0.22 ±  4%  perf-profile.self.cycles-pp.___perf_sw_event
      0.49            +0.1        0.62 ±  3%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.select_idle_cpu
      0.30 ±  3%      +0.1        0.44 ±  5%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.05            +0.2        0.20 ±  6%  perf-profile.self.cycles-pp.__x64_sys_read
      0.00            +0.2        0.16 ± 15%  perf-profile.self.cycles-pp.available_idle_cpu
      0.00            +0.2        0.18 ± 21%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.46 ±  2%      +0.3        0.76 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.31 ±  2%      +0.3        0.63 ±  4%  perf-profile.self.cycles-pp.update_load_avg
      0.40 ±  5%      +1.1        1.52 ±  9%  perf-profile.self.cycles-pp.update_cfs_group
      5.90 ±  8%      +9.8       15.74 ± 21%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      6.70 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.01 ±166%     -55.4%       0.00 ±142%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00       +9.8e+100%       0.10 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00       +1.2e+102%       1.25 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00       +3.6e+101%       0.36 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00 ±223%  +1.2e+07%      19.53 ±211%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +6.3e+102%       6.32 ±211%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +1.8e+100%       0.02 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.77 ± 77%    +153.0%       1.95 ± 31%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00       +4.6e+102%       4.63 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00 ±152%  +3.1e+05%       1.56 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%     +90.9%       0.00 ±135%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.28 ± 26%    +282.3%       4.90 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2.22 ± 71%    +238.8%       7.52 ± 42%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.00        +6.7e+98%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00       +8.4e+101%       0.84 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.count.constprop.0.isra
      0.31 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.04 ±222%     -97.7%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00 ±152%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      1.32 ±207%     -38.1%       0.82 ±124%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      2.46 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      8.09 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00       +1.6e+100%       0.02 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.6e+102%       1.63 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00         +2e+101%       0.20 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      3.15 ±222%     -99.9%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%     -67.2%       0.45 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00       +1.6e+101%       0.16 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.copy_signal.copy_process.kernel_clone
      0.00       +1.3e+102%       1.28 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +9.6e+100%       0.10 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      1.55 ± 78%     +48.6%       2.30 ± 45%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.90 ± 44%    +161.2%       2.35 ± 42%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±203%  +13200.0%       0.29 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±180%  +46569.4%       3.81 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.82 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      2.62 ± 53%   +1362.8%      38.28 ± 82%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      1.07 ±140%     -14.8%       0.91 ±119%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.92 ±174%     -16.8%       0.76 ± 73%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      2.54 ±175%     +35.4%       3.44 ± 37%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.01 ±136%   +3637.2%       0.27 ±218%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.5e+101%       0.15 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.22 ±102%   +1628.9%       3.83 ± 91%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.02 ±199%    +348.7%       0.09 ±190%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    171.37 ±222%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.00 ±115%  +4.6e+06%      46.34 ±218%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.01 ±190%   +4270.1%       0.63 ±124%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    260.71 ± 70%     -99.7%       0.79 ±223%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.11 ±221%    +297.0%       0.44 ±111%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      3.59 ± 69%    +559.6%      23.69 ± 80%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     11.23 ± 26%    +235.8%      37.72 ± 46%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.88 ±185%     -64.3%       0.32 ±169%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      3.87 ± 57%    +163.6%      10.21 ± 33%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.93 ±161%    +200.9%       2.80 ± 82%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      7.37 ± 24%    +125.7%      16.63 ± 13%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.63 ± 33%    +371.1%       2.98 ± 11%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00        +2.8e+99%       0.00 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      0.21 ± 74%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.06 ± 14%     +49.6%       0.09 ±  2%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork
     24.62 ± 92%     -65.9%       8.38 ± 61%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 50%  +2.2e+05%      13.31 ± 81%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      1.28 ±122%     -43.6%       0.72 ± 98%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     99.66 ±141%    -100.0%       0.01 ± 46%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     73.92 ±207%     -99.4%       0.47 ±193%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
      0.01 ±140%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      0.11 ±122%     -87.6%       0.01 ±161%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.01 ± 29%   +1767.6%       0.11 ±120%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 25%     +40.0%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     12.20 ± 25%     -10.1%      10.97 ± 16%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5.29 ± 22%    +126.5%      11.97 ± 14%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.53 ± 22%    +147.3%       3.78 ± 19%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.51 ±210%     -98.0%       0.01 ± 10%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
     63.43 ±216%     -98.8%       0.76 ±181%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00 ± 55%  +29770.6%       0.85 ±196%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      6.52 ±117%   +1570.9%     108.91 ± 55%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
     13.39 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.14 ±191%     -94.8%       0.01 ±158%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00       +9.8e+100%       0.10 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00       +1.2e+102%       1.25 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00       +1.4e+102%       1.45 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00 ±223%  +4.1e+06%      20.43 ±201%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +2.4e+103%      24.13 ±217%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +1.8e+100%       0.02 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
    720.33 ±132%     +52.2%       1096 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00       +4.6e+102%       4.63 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.01 ±181%  +68214.6%       4.67 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.51 ±218%     +51.3%       0.77 ±135%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    309.97 ± 46%    +238.7%       1049 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    898.29 ± 81%     +83.6%       1649 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.00        +6.2e+99%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00       +8.4e+101%       0.84 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.count.constprop.0.isra
      2.20 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.66 ±222%     -99.7%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00 ±141%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      3.49 ±216%    +194.1%      10.28 ±156%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      2.46 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      8.09 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00       +1.1e+101%       0.11 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.6e+102%       1.63 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.00         +6e+101%       0.60 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
     44.25 ±221%    -100.0%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%     +31.3%       1.79 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00       +1.6e+101%       0.16 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.copy_signal.copy_process.kernel_clone
      0.00       +2.6e+102%       2.56 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +2.9e+101%       0.29 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      1220 ± 79%      -3.9%       1173 ± 84%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
    282.46 ± 58%    +162.0%     740.06 ± 28%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.01 ±213%  +10443.9%       1.44 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.07 ±140%  +10506.7%       7.60 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.82 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    242.88 ± 90%    +255.7%     864.01 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      4.32 ±137%     +69.1%       7.30 ±111%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      5.37 ±155%    +104.3%      10.98 ± 83%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    380.44 ±188%     +98.7%     756.12 ± 37%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.08 ±161%   +2582.2%       2.11 ±221%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.5e+101%       0.15 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
     45.93 ±141%   +1332.1%     657.83 ±102%  perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.23 ±197%     +43.3%       0.33 ±205%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    171.37 ±222%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00        +6.8e+99%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.03 ± 86%  +1.4e+06%     463.33 ±218%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.02 ±178%   +6592.4%       1.03 ±134%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2607 ± 70%    -100.0%       0.79 ±223%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.11 ±221%    +354.0%       0.50 ± 97%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1287 ± 54%     +12.6%       1448 ± 78%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1979 ± 30%     -25.2%       1481 ± 81%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     33.83 ±204%     -84.1%       5.38 ±147%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    269.43 ± 84%    +192.2%     787.28 ± 58%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    122.68 ±149%     -45.6%      66.74 ±104%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    892.37 ± 63%     +62.4%       1449 ± 27%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3127 ± 12%     +14.8%       3591 ± 39%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00        +2.8e+99%       0.00 ±223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      1.43 ± 77%    -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.10 ± 10%      -4.4%       0.09 ±  2%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork
      2123 ± 79%     -13.8%       1829 ± 26%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 53%  +3.2e+06%     282.54 ± 60%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
    136.30 ±131%     -97.7%       3.08 ± 98%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1295 ±141%    -100.0%       0.01 ± 51%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    746.98 ±200%     -99.9%       0.96 ±165%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
      0.03 ±156%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.35 ±117%     -97.2%       0.07 ±185%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.01 ± 67%   +7684.5%       1.09 ±108%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 37%     +12.3%       0.01 ± 11%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2017 ± 47%     -42.1%       1167 ± 56%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    976.48 ± 20%    +120.3%       2151 ± 17%  perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3109 ± 16%     +12.7%       3503 ± 32%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    191.46 ±217%     -99.9%       0.20 ± 52%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
    688.08 ±220%     -99.9%       0.99 ±164%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ± 72%  +83535.1%       5.16 ±185%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1774 ±108%    +128.5%       4054 ± 26%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      1.38 ± 24%    +260.0%       4.96 ± 13%  perf-sched.total_sch_delay.average.ms
      4033 ± 12%      +5.2%       4243 ± 26%  perf-sched.total_sch_delay.max.ms
      5.84 ± 25%    +200.2%      17.53 ± 12%  perf-sched.total_wait_and_delay.average.ms
   3216638 ± 29%     -26.2%    2373769 ± 16%  perf-sched.total_wait_and_delay.count.ms
      7265 ± 12%     +16.5%       8466 ± 35%  perf-sched.total_wait_and_delay.max.ms
      4.46 ± 25%    +181.7%      12.57 ± 12%  perf-sched.total_wait_time.average.ms
      4790 ±  2%     +29.5%       6202 ± 19%  perf-sched.total_wait_time.max.ms
      6.70 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      9.00 ±143%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.90 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      1.43 ±223%   +1199.7%      18.64 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +4.3e+103%      43.24 ±156%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.97 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +4.6e+102%       4.63 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00       +3.5e+102%       3.52 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
     12.16 ± 45%     +68.2%      20.45 ± 51%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.62 ±102%    +102.9%       5.32 ±141%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      9.57 ± 56%    +250.2%      33.50 ± 35%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      7.04 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      3.22 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.24 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      2.46 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
     20.66 ±205%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      6.39 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      1.91 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      3.89 ±108%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.09 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
     33.45 ±223%    +283.9%     128.43 ±163%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
    167.97 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00       +9.6e+102%       9.56 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      5.93 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      4.13 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      3.92 ±101%   +2139.3%      87.76 ± 76%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      4.56 ±143%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      4.47 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00       +3.6e+102%       3.64 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +5.2e+102%       5.15 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +1.3e+103%      12.71 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1042 ±193%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +9.1e+103%      91.31 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    249.96 ±223%    +200.4%     750.84 ± 63%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    320.75 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.2e+104%     222.43 ±223%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     16.49 ± 59%    +474.3%      94.70 ± 59%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     27.93 ± 24%    +367.5%     130.59 ± 26%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2.46 ±154%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     17.68 ± 51%    +110.3%      37.19 ± 24%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.67 ±223%    +193.8%       7.85 ±141%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     25.14 ± 25%    +123.4%      56.16 ± 11%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.60 ± 22%    +307.9%      10.62 ± 11%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.29 ±154%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    415.69 ± 13%     -13.3%     360.47 ± 21%  perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork
    177.44 ± 37%     -67.7%      57.30 ± 78%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      2.35 ±156%   +1362.5%      34.32 ± 78%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
     19.21 ± 30%   +3333.9%     659.81 ± 51%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    227.59 ± 74%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    461.68 ± 19%     +33.0%     613.98 ± 51%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    270.02 ±178%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      1.72 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      5.55 ±142%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    907.21 ± 80%     +28.4%       1164 ± 19%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     31.07 ± 18%      +1.4%      31.51 ± 15%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     27.61 ± 16%     +53.9%      42.49 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      5.73 ± 21%    +126.5%      12.97 ± 20%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    950.13 ± 30%     -14.1%     816.20 ± 14%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    478.61 ± 33%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    464.68 ± 11%    +110.3%     977.43 ± 12%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
     31.67 ±142%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.17 ±223%      +0.0%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +1.2e+102%       1.17 ±143%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
    473.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    243.50 ± 45%     -11.3%     216.00 ± 54%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    567.00 ±101%     +94.3%       1101 ±141%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    719.17 ± 48%     +22.1%     878.17 ± 21%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.50 ±152%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      2.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
    675.33 ±101%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      1.83 ±223%     -18.2%       1.50 ±142%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00       +3.3e+101%       0.33 ±223%  perf-sched.wait_and_delay.count.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      2.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
     90.00 ±115%     -52.8%      42.50 ± 73%  perf-sched.wait_and_delay.count.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.50 ±145%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     27.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +4.8e+103%      48.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +3.3e+101%       0.33 ±223%  perf-sched.wait_and_delay.count.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.33 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +1.7e+102%       1.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.33 ±223%    +400.0%       1.67 ± 44%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.67 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    883.50 ± 49%     -80.2%     174.50 ± 22%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    298.17 ± 17%     -70.9%      86.67 ± 27%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     15.00 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    120.00 ± 23%    +103.8%     244.50 ± 22%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     21.17 ±223%     -42.5%      12.17 ±147%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    709.33 ± 14%    +264.5%       2585 ± 18%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    944215 ± 39%     -58.1%     395720 ± 22%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     26.33 ±155%    -100.0%       0.00        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     12.00 ± 15%      +2.8%      12.33 ± 12%  perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork
    137.33 ± 61%     +59.0%     218.33 ± 83%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.17 ±143%   +2871.4%      34.67 ± 54%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork
      1107 ± 91%     -99.6%       4.83 ± 25%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     10.33 ± 47%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     14.00 ± 13%     -77.4%       3.17 ± 61%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.50 ±152%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      6.83 ±171%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      3.67 ± 51%     +40.9%       5.17 ± 13%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    266.83 ± 16%      -0.1%     266.50 ± 16%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     81307 ± 17%    +363.5%     376823 ± 18%  perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   2176277 ± 27%     -27.4%    1580808 ± 17%  perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    557.17 ± 13%     -39.7%     336.17 ± 23%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
     10.17 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.count.syslog_print.do_syslog.kmsg_read.vfs_read
      1000 ±  8%     -67.9%     320.67 ± 23%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
     13.39 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
    832.01 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.90 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      1.43 ±223%   +1199.7%      18.64 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00       +1.4e+104%     137.69 ±150%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
    323.75 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00       +4.6e+102%       4.63 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      0.00       +1.1e+103%      10.53 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    871.44 ± 44%     +68.7%       1470 ± 52%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    364.18 ±113%     +54.7%     563.28 ±143%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1955 ± 76%     +70.5%       3334 ± 35%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     28.14 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      3.22 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      3.41 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      2.46 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
     22.03 ±191%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
     89.20 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      1.36 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      1.91 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      2119 ±105%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     24.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
    367.73 ±223%      +2.6%     377.39 ±142%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
    167.97 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00       +1.6e+103%      16.27 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
     94.70 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      4.13 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    374.20 ±135%    +391.6%       1839 ± 65%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     29.57 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    676.11 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00       +1.1e+103%      10.88 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +2.9e+104%     288.94 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00       +2.5e+103%      25.43 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1042 ±193%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.00       +9.1e+104%     912.75 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    499.91 ±223%    +200.2%       1500 ± 63%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3278 ± 44%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+104%     500.57 ±223%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2431 ± 65%     +27.3%       3096 ± 72%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      4073 ± 29%      -9.4%       3692 ± 51%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    101.20 ±149%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    895.24 ± 88%     +89.2%       1694 ± 51%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    330.28 ±223%     -47.4%     173.58 ±141%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1793 ± 63%     +67.8%       3010 ± 22%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      6314 ± 12%     +14.2%       7208 ± 39%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     15.47 ±167%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2513 ± 26%     -36.6%       1594 ± 21%  perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork
      5814 ± 27%     -50.4%       2880 ± 74%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      5.83 ±188%  +10569.2%     622.17 ± 63%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      2399 ± 67%      -9.5%       2171 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2654 ± 70%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      3862 ±  6%     -61.2%       1499 ± 47%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    319.58 ±155%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      5.10 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
    101.24 ±168%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      2604 ± 65%     +12.9%       2940 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      4206 ± 41%     -41.5%       2460 ± 52%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1978 ± 19%    +118.9%       4331 ± 17%  perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      6221 ± 16%     +12.9%       7026 ± 32%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4978 ±  9%     +15.8%       5765 ± 20%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      4649 ± 33%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      4706 ±  8%     +72.8%       8131 ± 37%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.75 ±213%     -84.9%       0.11 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00 ±223%   +1552.6%       0.05 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      9.19 ±138%     -70.3%       2.73 ± 74%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.19 ±108%    +196.0%       0.56 ±124%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    +666.7%       0.01 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00 ±223%    +577.8%       0.01 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00        +5.5e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.alloc_new_pud
      0.06 ±223%     -97.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.04 ±167%     -77.3%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00        +3.2e+99%       0.00 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +3.2e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.00 ±141%    +460.0%       0.02 ±146%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.05 ±223%   +1038.2%       0.54 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00        +6.2e+99%       0.01 ±172%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00 ±223%     +11.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.wp_page_copy.__handle_mm_fault.handle_mm_fault
      0.19 ±168%    +410.5%       0.99 ±135%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.06 ±223%     -72.9%       0.02 ± 57%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.06 ±104%     +35.4%       0.08 ±151%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      1.06 ±184%     -41.2%       0.63 ±137%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01 ±223%   +4312.1%       0.24 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_binary.search_binary_handler
      1.45 ±220%     -98.8%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00        +3.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±197%    +233.7%       0.05 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.task_numa_fault.do_numa_page
      0.02 ±153%     -86.7%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.07 ±119%     -58.0%       0.03 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
      0.00         +4e+103%      39.71 ±161%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +3.7e+101%       0.37 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.11 ±146%     -65.4%       0.04 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      3.64 ± 21%     +89.4%       6.89 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.01 ±168%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.kernfs_fop_open.do_dentry_open
      0.01 ±223%     -77.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.load_elf_binary.search_binary_handler
      0.05 ± 39%   +1143.1%       0.62 ±201%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.03 ± 47%     -30.3%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.47 ± 97%    +436.3%       2.51 ±170%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     12.35 ± 41%     +87.3%      23.14 ± 26%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.33 ± 19%    +277.2%      12.58 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      7.80 ± 41%    +233.1%      25.98 ± 35%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00         +4e+101%       0.40 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      0.51 ±210%     +61.4%       0.82 ±207%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.87 ±220%     -81.1%       0.16 ±139%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.02 ±129%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.03 ±118%     -41.5%       0.02 ± 97%  perf-sched.wait_time.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.03 ±209%     -61.3%       0.01 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.count.constprop.0.isra
      0.15 ±179%     -91.1%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      0.97 ± 96%     -46.7%       0.52 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.01 ±150%    +307.4%       0.04 ±191%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.2e+99%       0.01 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.01 ±196%   +1077.6%       0.13 ±205%  perf-sched.wait_time.avg.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
      7.28 ±214%     -97.4%       0.19 ±169%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.08 ±207%     -93.5%       0.01 ±161%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.80 ±223%    +209.3%       2.48 ±213%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      0.87 ±133%     +60.2%       1.40 ± 43%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00        +1.2e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.__do_sys_newuname.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.33 ± 78%     -94.7%       0.02 ±111%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.04 ±213%     -97.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exec_mmap
      0.00 ±223%    +114.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00        +5.3e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.open_last_lookups
      0.00       +1.4e+100%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.04 ±172%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±190%    +131.9%       0.03 ±182%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.02 ±175%     -67.9%       0.01 ±106%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.08 ±180%     -94.9%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.06 ±223%     -42.4%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +8.3e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.05 ±214%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00 ±223%     +14.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.03 ±209%     -65.1%       0.01 ±178%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00       +7.7e+100%       0.08 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.01 ±223%     +34.2%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +3.5e+99%       0.00 ±147%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
      1.19 ±198%     -88.9%       0.13 ± 99%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.04 ± 78%      -4.5%       0.04 ± 95%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      3.28 ±218%     -99.4%       0.02 ±152%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.15 ± 97%     -46.5%       0.08 ±134%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.03 ±223%     -90.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.08 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +5.3e+101%       0.53 ±146%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +3.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.alloc_bprm.do_execveat_common.isra
      0.23 ±208%    +179.4%       0.63 ± 92%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±160%     -53.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.38 ±169%     +12.0%       0.43 ±180%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.01 ±172%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.20 ±223%     -96.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.05 ±223%     +53.0%       0.08 ±205%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +9.3e+100%       0.09 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.08 ± 86%     -83.6%       0.01 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.24 ±139%    +165.8%       0.65 ± 98%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.05 ±122%     -87.3%       0.01 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.03 ±161%     -74.1%       0.01 ±117%  perf-sched.wait_time.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.03 ± 88%     -86.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
     12.58 ±194%     -99.8%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.03 ±124%   +1494.4%       0.43 ± 80%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.01 ±165%     -56.8%       0.00 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.03 ±210%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.05 ± 85%    +305.6%       0.22 ±129%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.09 ±223%     -98.2%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.02 ±204%     -30.1%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
      3.57 ±199%     -85.9%       0.50 ±185%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.02 ±138%    +178.4%       0.05 ±160%  perf-sched.wait_time.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.01 ±147%    +266.7%       0.03 ±120%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.02 ±147%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
      0.67 ± 88%    +424.6%       3.54 ± 70%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.05 ±145%   +2430.7%       1.22 ±187%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.02 ±138%     -90.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.01 ±164%     -61.0%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.03 ± 96%   +5154.5%       1.44 ±215%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +9.8e+100%       0.10 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.8e+100%       0.02 ±202%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.13 ±168%     -37.6%       0.08 ±176%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.06 ±164%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.79 ±223%     -98.9%       0.01 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_shrink
      0.00 ±223%  +15320.0%       0.26 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.02 ±147%     +69.2%       0.03 ±130%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      1.91 ±223%     -99.0%       0.02 ±117%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.01 ±165%     -27.8%       0.00 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +5.3e+100%       0.05 ±186%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.00       +1.6e+100%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.vm_brk_flags
      0.18 ±184%    +817.1%       1.65 ±221%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.05 ± 95%     +10.4%       0.06 ±173%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00 ±223%    +911.1%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.04 ±162%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      4.66 ± 31%     +81.9%       8.47 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.14 ±221%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00 ±223%   +4422.2%       0.07 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.11 ±184%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.38 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.00       +4.4e+100%       0.04 ±135%  perf-sched.wait_time.avg.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      0.00       +1.2e+102%       1.25 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.fifo_open.do_dentry_open.do_open
      0.03 ±131%     -39.7%       0.02 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.02 ±152%     -25.8%       0.02 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
     33.65 ±222%    +281.9%     128.52 ±163%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±223%     -75.7%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
    167.98 ±223%     -99.6%       0.68 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.16 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_release.__fput.task_work_run
      0.00        +2.5e+99%       0.00 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
      2.30 ± 61%    +143.9%       5.60 ± 27%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_interruptible.bprm_execve.do_execveat_common.isra
      0.05 ± 98%     -40.4%       0.03 ±101%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00       +1.2e+100%       0.01 ±119%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.dup_mm
      0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.pick_link.step_into.open_last_lookups.path_openat
      0.14 ± 86%   +4254.5%       6.15 ±206%  perf-sched.wait_time.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +300.0%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.10 ±223%     -94.9%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.08 ±144%     +30.2%       0.11 ±138%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.14 ± 68%     -86.7%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      5.99 ±220%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.35 ±209%     -98.8%       0.02 ±131%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      2.32 ±222%     -99.4%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      3.33 ± 35%   +1384.2%      49.48 ± 71%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.01 ±223%    +152.8%       0.02 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      0.02 ±113%   +5995.8%       1.20 ±209%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.09 ±219%     -92.1%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.28 ±184%     -98.9%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      3.93 ±132%     +61.4%       6.34 ± 85%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      3.86 ±122%     +89.8%       7.33 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.26 ±207%    +211.2%       3.91 ±204%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.01 ±171%     -50.8%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00 ±223%   +2270.0%       0.04 ±181%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.23 ±142%     -92.9%       0.02 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.05 ±127%    +454.4%       0.29 ±162%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.02 ±143%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.34 ± 27%    +584.4%       9.15 ± 58%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.28 ±132%   +4590.0%      13.19 ±213%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    871.93 ±188%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.15 ± 56%    +107.9%       0.30 ±181%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.12 ± 17%  +38424.8%      47.32 ±215%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    249.95 ±223%    +200.1%     750.21 ± 63%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     60.83 ±205%    -100.0%       0.00        perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00       +2.2e+104%     222.39 ±223%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     14.10 ± 50%    +403.7%      71.01 ± 56%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     16.70 ± 30%    +456.1%      92.87 ± 25%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2.20 ± 95%     -85.8%       0.31 ±113%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     13.81 ± 55%     +95.4%      26.98 ± 30%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.38 ±176%    +310.8%       9.79 ± 77%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     17.77 ± 27%    +122.5%      39.53 ± 10%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.97 ± 19%    +287.7%       7.64 ± 11%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.69 ± 89%    -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    415.63 ± 13%     -13.3%     360.38 ± 21%  perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork
    152.83 ± 40%     -65.4%      52.88 ± 66%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.96 ± 74%    +479.6%      22.95 ± 60%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
     17.93 ± 28%   +3575.5%     659.08 ± 51%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    128.73 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    387.76 ± 49%     +58.4%     614.18 ± 51%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.07 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
    270.04 ±178%    -100.0%       0.02 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.02 ± 89%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      1.80 ±210%     -82.2%       0.32 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      6.34 ±116%     -80.7%       1.22 ±104%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.06 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      1.85 ± 48%    +225.2%       6.01 ± 44%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    907.21 ± 80%     +28.4%       1164 ± 19%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ±220%   +1222.8%       0.43 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     18.88 ± 14%      +8.8%      20.54 ± 15%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     22.32 ± 22%     +36.7%      30.51 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      4.20 ± 21%    +118.9%       9.19 ± 20%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    949.62 ± 30%     -14.1%     816.19 ± 14%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    415.18 ± 24%     -99.9%       0.58 ±154%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.23 ±141%    +320.9%       0.98 ± 74%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    458.16 ± 10%     +89.6%     868.51 ± 13%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
      0.76 ±210%     -84.4%       0.12 ±187%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00 ±223%   +1066.7%       0.05 ±178%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
    839.89 ±139%     -62.6%     314.22 ± 79%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1.49 ±102%     -41.8%       0.87 ±127%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    +877.8%       0.01 ±168%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00 ±223%    +577.8%       0.01 ±179%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.00        +5.5e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.alloc_new_pud
      0.06 ±223%     -97.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.04 ±167%     -59.1%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00        +3.2e+99%       0.00 ±141%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +3.2e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.00 ±142%    +431.8%       0.02 ±139%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.05 ±223%   +1038.2%       0.54 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00        +6.2e+99%       0.01 ±172%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.00 ±223%     +11.1%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.wp_page_copy.__handle_mm_fault.handle_mm_fault
      4.10 ±215%    +213.0%      12.83 ± 82%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.06 ±223%     -66.6%       0.02 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.06 ±100%    +205.4%       0.18 ±140%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      1.23 ±161%      +0.4%       1.23 ±139%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01 ±223%   +4312.1%       0.24 ±222%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_binary.search_binary_handler
      1.46 ±218%     -98.8%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00        +3.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±197%    +233.7%       0.05 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.task_numa_fault.do_numa_page
      0.02 ±153%     -86.7%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.08 ±129%     -62.2%       0.03 ±144%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
      0.00       +1.2e+104%     120.73 ±160%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.00       +3.7e+101%       0.37 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.13 ±126%     -67.0%       0.04 ± 87%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      2354 ± 24%      +3.6%       2437 ± 45%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.01 ±168%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.kernfs_fop_open.do_dentry_open
      0.01 ±223%     -77.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.load_elf_binary.search_binary_handler
      0.10 ± 43%   +2807.8%       2.97 ±210%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.05 ± 61%     -38.9%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      7.91 ±119%     -15.0%       6.72 ±190%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
    890.90 ± 38%     +87.4%       1669 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    473.09 ± 57%    +171.4%       1283 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1428 ± 53%     +54.8%       2211 ± 38%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.00         +4e+101%       0.40 ±223%  perf-sched.wait_time.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_empty_file
      3.34 ±219%     -48.7%       1.71 ±212%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.88 ±220%     -71.1%       0.25 ±160%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.02 ±129%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.06 ±142%     +14.6%       0.07 ±162%  perf-sched.wait_time.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.05 ±214%     -74.6%       0.01 ±100%  perf-sched.wait_time.max.ms.__cond_resched.count.constprop.0.isra
      0.18 ±149%     -92.6%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      3.78 ±122%     -72.1%       1.05 ±192%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.01 ±150%    +663.0%       0.07 ±206%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.2e+99%       0.01 ±154%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.01 ±196%   +1083.6%       0.13 ±204%  perf-sched.wait_time.max.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.do_page_mkwrite.do_wp_page.__handle_mm_fault.handle_mm_fault
     29.55 ±210%     -97.3%       0.81 ±201%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.08 ±207%     -93.5%       0.01 ±161%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      1.22 ±223%    +103.4%       2.48 ±213%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
     15.34 ±131%    +183.3%      43.46 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.00        +1.2e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.strncpy_from_user
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.__do_sys_newuname.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.98 ±118%     -99.0%       0.02 ±110%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.10 ±219%     -98.8%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exec_mmap
      0.00 ±223%    +114.3%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.get_arg_page.copy_string_kernel.do_execveat_common
      0.00        +5.3e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.open_last_lookups
      0.00       +1.4e+100%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.04 ±175%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±194%    +344.3%       0.06 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.02 ±170%     -61.4%       0.01 ±115%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.08 ±180%     -88.7%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.06 ±223%     -42.4%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +8.3e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_cow_fault.do_fault
      0.05 ±214%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00 ±223%     +14.3%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.03 ±209%     -65.1%       0.01 ±178%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00       +7.7e+100%       0.08 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.01 ±223%     +34.2%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +3.5e+99%       0.00 ±147%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
     10.17 ±181%     -97.0%       0.31 ±117%  perf-sched.wait_time.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.11 ± 98%     -42.3%       0.07 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      3.39 ±209%     -99.4%       0.02 ±151%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.01 ±115%     -87.6%       0.12 ±152%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.03 ±223%     -90.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.08 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +7.2e+101%       0.72 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +3.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.alloc_bprm.do_execveat_common.isra
      0.64 ±214%    +726.3%       5.29 ± 84%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±160%     -23.9%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.45 ±149%      -3.1%       0.43 ±178%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.01 ±172%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.20 ±223%     -91.5%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.08 ±223%      -8.4%       0.08 ±205%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +9.3e+100%       0.09 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.22 ±118%     -89.6%       0.02 ±177%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.61 ±156%    +334.9%       2.66 ±119%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.06 ±115%     -85.0%       0.01 ±118%  perf-sched.wait_time.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.03 ±135%     -77.4%       0.01 ±115%  perf-sched.wait_time.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.03 ± 88%     -86.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
     13.95 ±174%     -99.8%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.07 ±148%   +1477.5%       1.09 ±107%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.01 ±165%     -56.8%       0.00 ±141%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.03 ±210%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.07 ± 91%    +618.5%       0.50 ±116%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.09 ±223%     -98.2%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.walk_component.link_path_walk.part
      0.02 ±204%     -30.1%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exec_mmap.begin_new_exec
     48.25 ±207%     -97.9%       1.04 ±176%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.02 ±133%    +153.3%       0.05 ±160%  perf-sched.wait_time.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.01 ±149%    +280.0%       0.05 ±146%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.02 ±147%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
    230.47 ±111%    +145.6%     566.04 ± 48%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.07 ±143%   +6025.4%       4.31 ±212%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.02 ±130%     -91.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.01 ±164%     -61.0%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.03 ±103%   +4906.1%       1.50 ±206%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +9.8e+100%       0.10 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00       +1.8e+100%       0.02 ±202%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.19 ±186%     -56.3%       0.08 ±166%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.06 ±164%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.79 ±223%     -98.5%       0.01 ±134%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_shrink
      0.00 ±223%  +15320.0%       0.26 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.03 ±136%     +23.4%       0.04 ±120%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      1.91 ±223%     -98.4%       0.03 ±125%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.01 ±181%     -50.9%       0.00 ±142%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00         +1e+101%       0.10 ±195%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.00       +1.6e+100%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.vm_brk_flags
      0.29 ±184%    +474.2%       1.66 ±219%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.07 ±103%     +59.6%       0.11 ±188%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00 ±223%    +911.1%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.04 ±162%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      1720 ± 48%     +17.8%       2026 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     24.41 ±222%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00 ±223%   +4422.2%       0.07 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.11 ±184%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.75 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.00       +4.8e+100%       0.05 ±135%  perf-sched.wait_time.max.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      0.00       +1.2e+102%       1.25 ±222%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.fifo_open.do_dentry_open.do_open
      0.05 ±160%     -61.4%       0.02 ±144%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.04 ±174%     -55.8%       0.02 ±142%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
    368.87 ±222%      +2.4%     377.84 ±142%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±223%     -75.7%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
    167.98 ±223%     -99.6%       0.68 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.16 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_release.__fput.task_work_run
      0.00        +2.8e+99%       0.00 ±150%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
    699.28 ± 77%     +26.6%     885.46 ± 24%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_interruptible.bprm_execve.do_execveat_common.isra
      0.17 ±130%     -41.2%       0.10 ±126%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00       +1.4e+100%       0.01 ±115%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.dup_mm
      0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.pick_link.step_into.open_last_lookups.path_openat
      1.49 ±149%    +558.5%       9.84 ±192%  perf-sched.wait_time.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +300.0%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.10 ±223%     -94.9%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.14 ±139%     +27.1%       0.18 ±140%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.60 ± 79%     -96.8%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
     94.91 ±222%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.35 ±208%     -98.8%       0.02 ±126%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      2.33 ±221%     -99.4%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
    252.54 ± 85%    +286.4%     975.72 ± 60%  perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.01 ±223%    +233.3%       0.02 ±130%  perf-sched.wait_time.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      0.08 ±107%   +7697.6%       6.46 ±196%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.09 ±219%     -92.1%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.03 ±113%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.30 ±172%     -98.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
     26.81 ±135%    +297.8%     106.66 ±110%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    468.72 ±153%    +102.6%     949.49 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      6.81 ±204%     +77.6%      12.09 ±197%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.01 ±171%     -17.5%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00 ±223%   +2270.0%       0.04 ±181%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.62 ±162%     -97.3%       0.02 ±112%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.07 ±128%   +1241.1%       0.91 ±188%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.04 ±142%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    202.89 ± 40%    +289.5%     790.27 ± 78%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.44 ±153%   +1010.9%      27.13 ±207%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    871.93 ±188%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.54 ± 58%     +70.5%       0.93 ±208%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1.58 ± 54%  +29710.3%     472.44 ±215%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    499.91 ±223%    +200.1%       1500 ± 63%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    681.31 ±219%    -100.0%       0.00        perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00         +5e+104%     500.46 ±223%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1786 ± 29%     +19.9%       2142 ± 58%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2454 ± 39%      -7.2%       2278 ± 33%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     75.78 ±124%     -95.2%       3.65 ±115%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    726.73 ±109%     +37.9%       1002 ± 43%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    282.70 ±186%     -25.1%     211.85 ± 84%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    987.23 ± 61%     +85.7%       1833 ± 37%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3295 ± 12%     +14.8%       3784 ± 35%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     83.31 ±163%    -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2513 ± 26%     -36.6%       1594 ± 21%  perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork
      4058 ± 14%     -15.8%       3417 ± 14%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      8.16 ±121%   +4455.6%     371.66 ± 50%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      2399 ± 67%      -9.6%       2170 ± 31%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1368 ±139%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      3184 ± 45%     -52.9%       1500 ± 47%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.09 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_user_addr_fault
    319.62 ±155%    -100.0%       0.02 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.03 ±107%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      5.35 ±211%     -94.0%       0.32 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
    114.11 ±143%     -98.6%       1.63 ± 97%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.06 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
     14.55 ± 59%    +100.1%      29.12 ± 56%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2604 ± 65%     +12.9%       2940 ± 31%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ±220%   +1222.8%       0.43 ±223%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2189 ± 37%     -41.0%       1292 ± 49%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1030 ± 17%    +114.8%       2214 ± 17%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3116 ± 16%     +13.1%       3525 ± 32%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4790 ±  2%     +20.4%       5765 ± 20%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      3962 ±  3%    -100.0%       1.16 ±154%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.81 ±152%    +327.0%       7.73 ± 79%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      4480 ±  3%     +34.7%       6033 ± 21%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork

--JtH+0i4DenAC9eAc
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="hackbench-a0fd217e6d-ICL-Platinum-8358"
Content-Transfer-Encoding: 8bit

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp6/hackbench

7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 4.883e+08 ±  5%      -5.4%  4.621e+08 ±  3%  cpuidle..time
   4168912 ±  4%      -7.0%    3877247 ±  7%  cpuidle..usage
    182.32 ±  3%      +6.7%     194.55 ±  8%  uptime.boot
      5404 ± 13%      +8.4%       5859 ± 29%  uptime.idle
     43.13 ± 15%     +10.9%      47.82 ± 31%  boot-time.boot
     29.24 ± 21%     +15.9%      33.89 ± 44%  boot-time.dhcp
      4718 ± 15%     +11.2%       5247 ± 32%  boot-time.idle
      3.23 ± 41%     +29.7%       4.18 ± 75%  boot-time.smp_boot
     12760 ± 70%    -100.0%       0.00        perf-c2c.DRAM.local
      2596 ± 70%    -100.0%       0.00        perf-c2c.DRAM.remote
     25909 ± 70%    -100.0%       0.00        perf-c2c.HITM.local
    256.83 ± 72%    -100.0%       0.00        perf-c2c.HITM.remote
     26166 ± 70%    -100.0%       0.00        perf-c2c.HITM.total
      2.55 ± 11%      -0.2        2.33 ± 12%  mpstat.cpu.all.idle%
      0.00 ±223%      -0.0        0.00        mpstat.cpu.all.iowait%
      1.45            -0.3        1.19        mpstat.cpu.all.irq%
      0.04            -0.0        0.04 ±  2%  mpstat.cpu.all.soft%
     91.38            +1.0       92.36        mpstat.cpu.all.sys%
      4.57            -0.5        4.09        mpstat.cpu.all.usr%
      0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
   1085826 ± 28%     -30.4%     755552 ± 18%  numa-numastat.node0.local_node
   1147403 ± 27%     -29.2%     811989 ± 19%  numa-numastat.node0.numa_hit
     61576 ± 72%      -8.3%      56440 ± 50%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
   1340399 ± 21%      +2.6%    1375519 ± 13%  numa-numastat.node1.local_node
   1413908 ± 22%      +2.8%    1454068 ± 13%  numa-numastat.node1.numa_hit
     73509 ± 60%      +6.9%      78548 ± 36%  numa-numastat.node1.other_node
      3.17 ± 11%      -5.3%       3.00        vmstat.cpu.id
     90.83            +1.1%      91.83        vmstat.cpu.sy
      4.00            -4.2%       3.83 ±  9%  vmstat.cpu.us
      0.00          -100.0%       0.00        vmstat.io.bi
      4.00            +0.0%       4.00        vmstat.memory.buff
   5537857 ± 17%     -13.9%    4769628 ±  7%  vmstat.memory.cache
 1.229e+08            +0.8%   1.24e+08        vmstat.memory.free
      1703            +4.6%       1781        vmstat.procs.r
   3116201            -8.8%    2842098        vmstat.system.cs
    545942           -10.1%     490601        vmstat.system.in
    135.84            +5.9%     143.80        time.elapsed_time
    135.84            +5.9%     143.80        time.elapsed_time.max
  96130402            -6.0%   90340310        time.involuntary_context_switches
      9128 ±  3%      -6.5%       8538 ±  5%  time.major_page_faults
      2048            +0.0%       2048        time.maximum_resident_set_size
    533978            +1.6%     542323        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
     12350            +0.6%      12424        time.percent_of_cpu_this_job_got
     16030            +7.0%      17152        time.system_time
    747.92            -4.3%     715.77        time.user_time
 3.329e+08            -3.1%  3.227e+08        time.voluntary_context_switches
    455347            -5.9%     428458        hackbench.throughput
    447699            -5.7%     422187        hackbench.throughput_avg
    455347            -5.9%     428458        hackbench.throughput_best
    442776            -6.2%     415425        hackbench.throughput_worst
    135.84            +5.9%     143.80        hackbench.time.elapsed_time
    135.84            +5.9%     143.80        hackbench.time.elapsed_time.max
  96130402            -6.0%   90340310        hackbench.time.involuntary_context_switches
      9128 ±  3%      -6.5%       8538 ±  5%  hackbench.time.major_page_faults
      2048            +0.0%       2048        hackbench.time.maximum_resident_set_size
    533978            +1.6%     542323        hackbench.time.minor_page_faults
      4096            +0.0%       4096        hackbench.time.page_size
     12350            +0.6%      12424        hackbench.time.percent_of_cpu_this_job_got
     16030            +7.0%      17152        hackbench.time.system_time
    747.92            -4.3%     715.77        hackbench.time.user_time
 3.329e+08            -3.1%  3.227e+08        hackbench.time.voluntary_context_switches
      3145            -1.2%       3106        turbostat.Avg_MHz
     97.44            +0.3       97.79        turbostat.Busy%
      3233            -1.7%       3178        turbostat.Bzy_MHz
   1505999 ±  7%      +1.9%    1534366 ±  6%  turbostat.C1
      0.06 ±  8%      -0.0        0.05 ±  7%  turbostat.C1%
   2100474 ±  9%     -16.9%    1746544 ± 17%  turbostat.C1E
      0.44 ±  9%      -0.1        0.37 ± 13%  turbostat.C1E%
    367921 ±  8%      -3.5%     354919 ±  3%  turbostat.C6
      2.10 ± 10%      -0.3        1.84 ±  2%  turbostat.C6%
      0.68 ±  8%     -16.5%       0.56 ±  8%  turbostat.CPU%c1
      1.88 ± 11%     -12.4%       1.65 ±  2%  turbostat.CPU%c6
     77.00 ±  2%      -1.7%      75.67 ±  2%  turbostat.CoreTmp
      0.20            -4.2%       0.19        turbostat.IPC
  75882286            -5.2%   71943143        turbostat.IRQ
    113.11           +12.9      125.98        turbostat.PKG_%
    135641 ± 21%     +30.5%     177014 ±  5%  turbostat.POLL
     77.17            -1.9%      75.67        turbostat.PkgTmp
    494.12            +0.2%     495.33        turbostat.PkgWatt
    190.13            -1.3%     187.64        turbostat.RAMWatt
      2595            +0.1%       2598        turbostat.TSC_MHz
    203822 ± 60%    +198.6%     608701 ± 59%  meminfo.Active
    203699 ± 60%    +198.8%     608573 ± 59%  meminfo.Active(anon)
    122.67 ±  6%      +4.3%     128.00        meminfo.Active(file)
    129988 ±  4%      +1.1%     131399 ±  7%  meminfo.AnonHugePages
    732895 ±  6%     -13.2%     636185 ±  7%  meminfo.AnonPages
      4.00            +0.0%       4.00        meminfo.Buffers
   5381820 ± 17%     -14.1%    4624610 ±  8%  meminfo.Cached
  65831196            +0.0%   65831196        meminfo.CommitLimit
   5362198 ± 18%     -16.1%    4499421 ±  9%  meminfo.Committed_AS
 1.183e+09            +0.1%  1.184e+09        meminfo.DirectMap1G
   9787415 ±  8%     -11.3%    8685935 ± 16%  meminfo.DirectMap2M
    548191 ± 27%     -22.2%     426331 ± 18%  meminfo.DirectMap4k
      2048            +0.0%       2048        meminfo.Hugepagesize
   3239938 ± 32%     -38.8%    1981395 ± 38%  meminfo.Inactive
   3239758 ± 32%     -38.8%    1981215 ± 38%  meminfo.Inactive(anon)
    179.83            -0.3%     179.33        meminfo.Inactive(file)
    144522            -3.0%     140240        meminfo.KReclaimable
    100281            +0.8%     101035        meminfo.KernelStack
   1431490 ± 19%     -37.0%     902508 ± 44%  meminfo.Mapped
 1.224e+08            +0.8%  1.234e+08        meminfo.MemAvailable
  1.23e+08            +0.8%   1.24e+08        meminfo.MemFree
 1.317e+08            +0.0%  1.317e+08        meminfo.MemTotal
   8711265 ± 11%     -11.9%    7677995 ±  6%  meminfo.Memused
    163279            +3.0%     168167 ±  3%  meminfo.PageTables
     90680            -0.6%      90152        meminfo.Percpu
    144522            -3.0%     140240        meminfo.SReclaimable
    631442            -0.3%     629626        meminfo.SUnreclaim
   2711151 ± 35%     -27.9%    1953938 ± 19%  meminfo.Shmem
    775965            -0.8%     769867        meminfo.Slab
   2670369            -0.0%    2670368        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    240469            +0.3%     241248        meminfo.VmallocUsed
   8868864 ± 11%      -9.8%    8003021 ±  4%  meminfo.max_used_kB
     60623 ± 25%      -2.1%      59353 ±125%  numa-meminfo.node0.Active
     60540 ± 25%      -2.1%      59289 ±125%  numa-meminfo.node0.Active(anon)
     82.67 ± 71%     -22.6%      64.00 ±100%  numa-meminfo.node0.Active(file)
     45512 ± 55%     +35.2%      61514 ± 63%  numa-meminfo.node0.AnonHugePages
    347594 ± 18%      -3.2%     336335 ± 20%  numa-meminfo.node0.AnonPages
    562165 ± 18%      -2.8%     546504 ± 14%  numa-meminfo.node0.AnonPages.max
   2860089 ± 57%     -35.3%    1851652 ± 58%  numa-meminfo.node0.FilePages
   1360379 ± 72%     -71.3%     389808 ± 23%  numa-meminfo.node0.Inactive
   1360266 ± 72%     -71.3%     389718 ± 23%  numa-meminfo.node0.Inactive(anon)
    113.33 ± 71%     -21.0%      89.50 ±100%  numa-meminfo.node0.Inactive(file)
     73362 ± 31%     -11.2%      65115 ± 38%  numa-meminfo.node0.KReclaimable
     56758 ± 24%     -10.3%      50908 ± 49%  numa-meminfo.node0.KernelStack
    402969 ± 74%     -57.7%     170527 ± 31%  numa-meminfo.node0.Mapped
  61175514 ±  2%      +1.9%   62343890 ±  2%  numa-meminfo.node0.MemFree
  65658096            +0.0%   65658096        numa-meminfo.node0.MemTotal
   4482580 ± 36%     -26.1%    3314204 ± 39%  numa-meminfo.node0.MemUsed
     94097 ± 30%     -12.6%      82238 ± 61%  numa-meminfo.node0.PageTables
     73362 ± 31%     -11.2%      65115 ± 38%  numa-meminfo.node0.SReclaimable
    335026 ±  9%      -6.1%     314466 ± 23%  numa-meminfo.node0.SUnreclaim
   1073509 ± 95%     -89.5%     113005 ±102%  numa-meminfo.node0.Shmem
    408389 ±  8%      -7.1%     379582 ± 24%  numa-meminfo.node0.Slab
   1786383 ± 65%      -2.7%    1738492 ± 66%  numa-meminfo.node0.Unevictable
    140001 ± 92%    +293.9%     551466 ± 63%  numa-meminfo.node1.Active
    139961 ± 92%    +294.0%     551402 ± 63%  numa-meminfo.node1.Active(anon)
     40.00 ±141%     +60.0%      64.00 ±100%  numa-meminfo.node1.Active(file)
     84393 ± 31%     -17.1%      69966 ± 52%  numa-meminfo.node1.AnonHugePages
    385861 ± 17%     -22.2%     300225 ± 18%  numa-meminfo.node1.AnonPages
    602132 ± 20%     -26.7%     441431 ± 14%  numa-meminfo.node1.AnonPages.max
   2518083 ± 53%     +10.2%    2774346 ± 32%  numa-meminfo.node1.FilePages
   1879643 ± 44%     -15.3%    1591222 ± 46%  numa-meminfo.node1.Inactive
   1879576 ± 44%     -15.3%    1591132 ± 46%  numa-meminfo.node1.Inactive(anon)
     66.50 ±121%     +35.1%      89.83 ±100%  numa-meminfo.node1.Inactive(file)
     71159 ± 31%      +5.6%      75179 ± 32%  numa-meminfo.node1.KReclaimable
     43384 ± 32%     +15.6%      50135 ± 50%  numa-meminfo.node1.KernelStack
   1030705 ± 33%     -29.1%     730755 ± 47%  numa-meminfo.node1.Mapped
  61778303 ±  2%      -0.2%   61639504        numa-meminfo.node1.MemFree
  66004296            +0.0%   66004296        numa-meminfo.node1.MemTotal
   4225992 ± 31%      +3.3%    4364790 ± 24%  numa-meminfo.node1.MemUsed
     68727 ± 43%     +24.9%      85871 ± 62%  numa-meminfo.node1.PageTables
     71159 ± 31%      +5.6%      75179 ± 32%  numa-meminfo.node1.SReclaimable
    295876 ± 11%      +6.2%     314174 ± 23%  numa-meminfo.node1.SUnreclaim
   1633990 ± 51%     +12.7%    1842316 ± 24%  numa-meminfo.node1.Shmem
    367037 ± 10%      +6.1%     389355 ± 23%  numa-meminfo.node1.Slab
    883984 ±133%      +5.4%     931875 ±123%  numa-meminfo.node1.Unevictable
     15178 ± 25%      -1.6%      14941 ±126%  numa-vmstat.node0.nr_active_anon
     20.67 ± 71%     -22.6%      16.00 ±100%  numa-vmstat.node0.nr_active_file
     86797 ± 18%      -3.2%      84015 ± 20%  numa-vmstat.node0.nr_anon_pages
     21.67 ± 56%     +36.2%      29.50 ± 64%  numa-vmstat.node0.nr_anon_transparent_hugepages
    715313 ± 57%     -35.3%     463017 ± 58%  numa-vmstat.node0.nr_file_pages
  15293765 ±  2%      +1.9%   15585702 ±  2%  numa-vmstat.node0.nr_free_pages
    340214 ± 72%     -71.4%      97344 ± 23%  numa-vmstat.node0.nr_inactive_anon
     28.33 ± 71%     -22.4%      22.00 ±100%  numa-vmstat.node0.nr_inactive_file
      0.00          -100.0%       0.00        numa-vmstat.node0.nr_isolated_anon
     56711 ± 24%      -9.9%      51083 ± 49%  numa-vmstat.node0.nr_kernel_stack
    101165 ± 74%     -57.9%      42574 ± 31%  numa-vmstat.node0.nr_mapped
     23535 ± 30%     -12.3%      20638 ± 60%  numa-vmstat.node0.nr_page_table_pages
    268668 ± 95%     -89.4%      28355 ±102%  numa-vmstat.node0.nr_shmem
     18343 ± 31%     -11.2%      16281 ± 38%  numa-vmstat.node0.nr_slab_reclaimable
     83852 ±  9%      -6.1%      78700 ± 23%  numa-vmstat.node0.nr_slab_unreclaimable
    446595 ± 65%      -2.7%     434622 ± 66%  numa-vmstat.node0.nr_unevictable
     15178 ± 25%      -1.6%      14941 ±126%  numa-vmstat.node0.nr_zone_active_anon
     20.67 ± 71%     -22.6%      16.00 ±100%  numa-vmstat.node0.nr_zone_active_file
    340213 ± 72%     -71.4%      97343 ± 23%  numa-vmstat.node0.nr_zone_inactive_anon
     28.33 ± 71%     -22.4%      22.00 ±100%  numa-vmstat.node0.nr_zone_inactive_file
    446595 ± 65%      -2.7%     434622 ± 66%  numa-vmstat.node0.nr_zone_unevictable
   1146748 ± 27%     -29.2%     812051 ± 19%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
   1085171 ± 28%     -30.4%     755614 ± 18%  numa-vmstat.node0.numa_local
     61576 ± 72%      -8.3%      56440 ± 50%  numa-vmstat.node0.numa_other
     35413 ± 93%    +290.3%     138215 ± 63%  numa-vmstat.node1.nr_active_anon
     10.00 ±141%     +60.0%      16.00 ±100%  numa-vmstat.node1.nr_active_file
     96435 ± 16%     -22.3%      74970 ± 18%  numa-vmstat.node1.nr_anon_pages
     40.50 ± 32%     -16.5%      33.83 ± 52%  numa-vmstat.node1.nr_anon_transparent_hugepages
    629218 ± 53%     +10.2%     693354 ± 32%  numa-vmstat.node1.nr_file_pages
  15444792 ±  2%      -0.2%   15410531        numa-vmstat.node1.nr_free_pages
    469139 ± 44%     -15.4%     397102 ± 46%  numa-vmstat.node1.nr_inactive_anon
     16.50 ±122%     +35.4%      22.33 ±100%  numa-vmstat.node1.nr_inactive_file
      0.00          -100.0%       0.00        numa-vmstat.node1.nr_isolated_anon
     43466 ± 32%     +15.0%      49968 ± 50%  numa-vmstat.node1.nr_kernel_stack
    257002 ± 33%     -29.0%     182356 ± 48%  numa-vmstat.node1.nr_mapped
     17235 ± 43%     +24.1%      21392 ± 62%  numa-vmstat.node1.nr_page_table_pages
    408195 ± 51%     +12.8%     460346 ± 24%  numa-vmstat.node1.nr_shmem
     17777 ± 31%      +5.6%      18781 ± 32%  numa-vmstat.node1.nr_slab_reclaimable
     74091 ± 11%      +5.9%      78480 ± 23%  numa-vmstat.node1.nr_slab_unreclaimable
    220995 ±133%      +5.4%     232968 ±123%  numa-vmstat.node1.nr_unevictable
     35413 ± 93%    +290.3%     138214 ± 63%  numa-vmstat.node1.nr_zone_active_anon
     10.00 ±141%     +60.0%      16.00 ±100%  numa-vmstat.node1.nr_zone_active_file
    469139 ± 44%     -15.4%     397102 ± 46%  numa-vmstat.node1.nr_zone_inactive_anon
     16.50 ±122%     +35.4%      22.33 ±100%  numa-vmstat.node1.nr_zone_inactive_file
    220995 ±133%      +5.4%     232968 ±123%  numa-vmstat.node1.nr_zone_unevictable
   1413178 ± 22%      +2.9%    1454049 ± 13%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
   1339669 ± 21%      +2.7%    1375501 ± 13%  numa-vmstat.node1.numa_local
     73509 ± 60%      +6.9%      78548 ± 36%  numa-vmstat.node1.numa_other
    247.83 ± 30%     -23.3%     190.17 ± 20%  proc-vmstat.direct_map_level2_splits
      2.17 ± 31%      +7.7%       2.33 ± 40%  proc-vmstat.direct_map_level3_splits
     51157 ± 60%    +197.2%     152043 ± 59%  proc-vmstat.nr_active_anon
     30.67 ±  6%      +4.3%      32.00        proc-vmstat.nr_active_file
    183216 ±  6%     -13.1%     159176 ±  7%  proc-vmstat.nr_anon_pages
     63.17 ±  3%      +0.5%      63.50 ±  7%  proc-vmstat.nr_anon_transparent_hugepages
   3053894            +0.8%    3079629        proc-vmstat.nr_dirty_background_threshold
   6115256            +0.8%    6166789        proc-vmstat.nr_dirty_threshold
   1345673 ± 17%     -14.1%    1156027 ±  8%  proc-vmstat.nr_file_pages
  30737847            +0.8%   30995577        proc-vmstat.nr_free_pages
    809915 ± 32%     -38.8%     495403 ± 38%  proc-vmstat.nr_inactive_anon
     44.83            -1.1%      44.33        proc-vmstat.nr_inactive_file
      0.67 ±141%     +50.0%       1.00 ±141%  proc-vmstat.nr_isolated_anon
    100262            +0.8%     101078        proc-vmstat.nr_kernel_stack
    358287 ± 19%     -36.9%     225932 ± 44%  proc-vmstat.nr_mapped
     40823            +3.0%      42029 ±  3%  proc-vmstat.nr_page_table_pages
    678005 ± 35%     -28.0%     488357 ± 19%  proc-vmstat.nr_shmem
     36123            -2.9%      35063        proc-vmstat.nr_slab_reclaimable
    157786            -0.4%     157232        proc-vmstat.nr_slab_unreclaimable
    667592            -0.0%     667591        proc-vmstat.nr_unevictable
     51157 ± 60%    +197.2%     152043 ± 59%  proc-vmstat.nr_zone_active_anon
     30.67 ±  6%      +4.3%      32.00        proc-vmstat.nr_zone_active_file
    809915 ± 32%     -38.8%     495403 ± 38%  proc-vmstat.nr_zone_inactive_anon
     44.83            -1.1%      44.33        proc-vmstat.nr_zone_inactive_file
    667592            -0.0%     667591        proc-vmstat.nr_zone_unevictable
    245710 ± 20%     -22.5%     190365 ± 20%  proc-vmstat.numa_hint_faults
    173866 ± 13%     -24.8%     130734 ± 36%  proc-vmstat.numa_hint_faults_local
   2564578 ± 14%     -11.5%    2268893 ±  4%  proc-vmstat.numa_hit
     52.00 ±103%     -57.4%      22.17 ± 35%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   2429492 ± 14%     -12.2%    2133272 ±  4%  proc-vmstat.numa_local
    135086            -0.1%     134989        proc-vmstat.numa_other
     42910 ± 55%     -41.8%      24988 ± 29%  proc-vmstat.numa_pages_migrated
    481291 ± 12%     -15.2%     408307 ± 11%  proc-vmstat.numa_pte_updates
    168803 ± 84%    +132.6%     392645 ± 59%  proc-vmstat.pgactivate
   3197394 ± 11%     -10.5%    2860892 ±  4%  proc-vmstat.pgalloc_normal
   1648445 ±  6%      -7.0%    1533339 ±  2%  proc-vmstat.pgfault
   2016126 ±  3%      +2.2%    2059688 ±  5%  proc-vmstat.pgfree
     42910 ± 55%     -41.8%      24988 ± 29%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00        proc-vmstat.pgpgin
    113635 ± 23%     -16.4%      95027 ±  5%  proc-vmstat.pgreuse
     92.83 ±  3%      -2.0%      91.00 ± 10%  proc-vmstat.thp_collapse_alloc
      0.00       +1.7e+101%       0.17 ±223%  proc-vmstat.thp_deferred_split_page
     24.00            +2.1%      24.50 ±  3%  proc-vmstat.thp_fault_alloc
     11.17 ± 68%     -32.8%       7.50 ± 62%  proc-vmstat.thp_migration_success
      0.00       +1.7e+101%       0.17 ±223%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     21.17            -0.8%      21.00        proc-vmstat.unevictable_pgs_culled
      0.00          -100.0%       0.00        proc-vmstat.unevictable_pgs_rescued
   1127680            +4.7%    1180672        proc-vmstat.unevictable_pgs_scanned
      7.62            +0.2%       7.63        perf-stat.i.MPKI
  4.48e+10            -3.4%  4.327e+10        perf-stat.i.branch-instructions
      0.45            +0.0        0.47        perf-stat.i.branch-miss-rate%
 1.988e+08            +1.5%  2.017e+08        perf-stat.i.branch-misses
     21.55            -1.2       20.32        perf-stat.i.cache-miss-rate%
 3.953e+08            -9.5%  3.578e+08        perf-stat.i.cache-misses
 1.815e+09            -3.8%  1.746e+09        perf-stat.i.cache-references
   3161372           -10.9%    2817844        perf-stat.i.context-switches
      1.69            +2.7%       1.73        perf-stat.i.cpi
    128264            -0.1%     128173        perf-stat.i.cpu-clock
 4.023e+11            -1.4%  3.967e+11        perf-stat.i.cpu-cycles
    365627 ±  2%      -9.7%     330317        perf-stat.i.cpu-migrations
      1139 ±  2%      +8.4%       1235        perf-stat.i.cycles-between-cache-misses
      0.04 ± 16%      +0.0        0.04 ± 11%  perf-stat.i.dTLB-load-miss-rate%
  24803278 ± 15%      -2.3%   24226955 ± 11%  perf-stat.i.dTLB-load-misses
 6.569e+10            -4.0%  6.305e+10        perf-stat.i.dTLB-loads
      0.01 ± 37%      -0.0        0.01 ± 20%  perf-stat.i.dTLB-store-miss-rate%
   4003244 ± 37%     -15.3%    3389687 ± 21%  perf-stat.i.dTLB-store-misses
 4.057e+10            -5.3%  3.841e+10        perf-stat.i.dTLB-stores
 2.408e+11            -3.9%  2.314e+11        perf-stat.i.instructions
      0.60            -2.6%       0.58        perf-stat.i.ipc
     78.56 ±  3%     -14.6%      67.11 ±  5%  perf-stat.i.major-faults
      3.14            -1.4%       3.10        perf-stat.i.metric.GHz
      1598           -10.7%       1427        perf-stat.i.metric.K/sec
      1194            -4.2%       1144        perf-stat.i.metric.M/sec
     10973 ±  7%     -15.5%       9275 ±  3%  perf-stat.i.minor-faults
     26.75            +0.0       26.78        perf-stat.i.node-load-miss-rate%
  30953814            -4.8%   29470176        perf-stat.i.node-load-misses
  94854027            -8.2%   87086579        perf-stat.i.node-loads
     10.12            +1.0       11.14 ±  2%  perf-stat.i.node-store-miss-rate%
   6830990            -6.0%    6417970        perf-stat.i.node-store-misses
  67140443           -17.8%   55222136        perf-stat.i.node-stores
     11052 ±  7%     -15.5%       9343 ±  3%  perf-stat.i.page-faults
    128264            -0.1%     128173        perf-stat.i.task-clock
      7.54            -0.1%       7.53        perf-stat.overall.MPKI
      0.44            +0.0        0.47        perf-stat.overall.branch-miss-rate%
     21.83            -1.3       20.52        perf-stat.overall.cache-miss-rate%
      1.67            +2.5%       1.71        perf-stat.overall.cpi
      1015            +9.2%       1109        perf-stat.overall.cycles-between-cache-misses
      0.04 ± 16%      +0.0        0.04 ± 11%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ± 38%      -0.0        0.01 ± 20%  perf-stat.overall.dTLB-store-miss-rate%
      0.60            -2.5%       0.58        perf-stat.overall.ipc
     24.35            +0.8       25.13        perf-stat.overall.node-load-miss-rate%
      9.09            +1.2       10.31        perf-stat.overall.node-store-miss-rate%
 4.443e+10            -3.3%  4.294e+10        perf-stat.ps.branch-instructions
 1.966e+08            +1.6%  1.998e+08        perf-stat.ps.branch-misses
 3.933e+08            -9.7%   3.55e+08        perf-stat.ps.cache-misses
 1.801e+09            -4.0%   1.73e+09        perf-stat.ps.cache-references
   3104212           -10.4%    2781030        perf-stat.ps.context-switches
    127050            +0.0%     127068        perf-stat.ps.cpu-clock
 3.994e+11            -1.4%  3.939e+11        perf-stat.ps.cpu-cycles
    354970            -8.9%     323401 ±  2%  perf-stat.ps.cpu-migrations
  24565631 ± 16%      -1.9%   24093755 ± 11%  perf-stat.ps.dTLB-load-misses
 6.521e+10            -4.0%  6.258e+10        perf-stat.ps.dTLB-loads
   4047965 ± 38%     -16.3%    3389310 ± 20%  perf-stat.ps.dTLB-store-misses
 4.029e+10            -5.4%  3.812e+10        perf-stat.ps.dTLB-stores
 2.389e+11            -3.8%  2.297e+11        perf-stat.ps.instructions
     66.62 ±  3%     -12.0%      58.62 ±  5%  perf-stat.ps.major-faults
     10118 ±  8%     -13.6%       8745 ±  2%  perf-stat.ps.minor-faults
  30547504            -4.7%   29097293        perf-stat.ps.node-load-misses
  94908109            -8.6%   86722788        perf-stat.ps.node-loads
   6660116            -5.6%    6290369        perf-stat.ps.node-store-misses
  66647480           -17.9%   54727405        perf-stat.ps.node-stores
     10184 ±  8%     -13.6%       8803 ±  2%  perf-stat.ps.page-faults
    127050            +0.0%     127068        perf-stat.ps.task-clock
 3.261e+13            +1.6%  3.312e+13        perf-stat.total.instructions
     18473 ±100%     +71.2%      31632 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.avg
   2364639 ±100%     +71.2%    4048954 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
    208188 ±100%     +71.2%     356479 ± 44%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      9.49 ±  4%     +11.3%      10.57 ±  6%  sched_debug.cfs_rq:/.h_nr_running.avg
     26.67 ±  5%      +7.1%      28.56 ±  5%  sched_debug.cfs_rq:/.h_nr_running.max
      0.28 ± 44%     +80.0%       0.50 ± 50%  sched_debug.cfs_rq:/.h_nr_running.min
      6.37 ±  4%     +11.4%       7.10 ±  6%  sched_debug.cfs_rq:/.h_nr_running.stddev
     10612 ± 17%     +14.4%      12144 ± 10%  sched_debug.cfs_rq:/.load.avg
    367702 ± 52%     +61.0%     591934 ± 27%  sched_debug.cfs_rq:/.load.max
    469.39 ±108%    +114.0%       1004 ± 60%  sched_debug.cfs_rq:/.load.min
     35751 ± 47%     +47.6%      52755 ± 26%  sched_debug.cfs_rq:/.load.stddev
     69.32 ±127%      +2.3%      70.92 ±121%  sched_debug.cfs_rq:/.load_avg.avg
      5328 ±188%      +3.2%       5498 ±198%  sched_debug.cfs_rq:/.load_avg.max
      1.17 ± 14%      +0.0%       1.17 ± 27%  sched_debug.cfs_rq:/.load_avg.min
    496.64 ±175%      +5.3%     522.94 ±180%  sched_debug.cfs_rq:/.load_avg.stddev
     18473 ±100%     +71.2%      31632 ± 44%  sched_debug.cfs_rq:/.max_vruntime.avg
   2364639 ±100%     +71.2%    4048954 ± 44%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
    208188 ±100%     +71.2%     356479 ± 44%  sched_debug.cfs_rq:/.max_vruntime.stddev
   7226615            +0.5%    7260631        sched_debug.cfs_rq:/.min_vruntime.avg
   9061493 ±  5%      -1.7%    8910843 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
   6914915            +0.8%    6970885        sched_debug.cfs_rq:/.min_vruntime.min
    250377 ± 10%      -6.8%     233268 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.70            +0.8%       0.70        sched_debug.cfs_rq:/.nr_running.avg
      1.06 ± 11%      -5.3%       1.00        sched_debug.cfs_rq:/.nr_running.max
      0.28 ± 44%     +80.0%       0.50 ± 50%  sched_debug.cfs_rq:/.nr_running.min
      0.14 ±  9%     -16.8%       0.12 ± 17%  sched_debug.cfs_rq:/.nr_running.stddev
      9.71 ± 40%     +48.9%      14.46 ± 34%  sched_debug.cfs_rq:/.removed.load_avg.avg
    341.33            +0.0%     341.33        sched_debug.cfs_rq:/.removed.load_avg.max
     55.31 ± 20%     +21.4%      67.14 ± 16%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      3.90 ± 46%     +71.3%       6.68 ± 42%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    176.44 ±  5%      +2.0%     180.06 ±  5%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     23.27 ± 22%     +35.1%      31.44 ± 23%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      3.90 ± 46%     +71.3%       6.68 ± 42%  sched_debug.cfs_rq:/.removed.util_avg.avg
    176.44 ±  5%      +2.0%     180.06 ±  5%  sched_debug.cfs_rq:/.removed.util_avg.max
     23.27 ± 22%     +35.0%      31.43 ± 23%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      9921 ±  3%     +10.1%      10923 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
     17354 ±  4%      +7.5%      18652 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
      1205 ± 59%     +38.8%       1673 ± 44%  sched_debug.cfs_rq:/.runnable_avg.min
      2720 ±  3%     +12.9%       3072 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.01 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.avg
      0.67 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.max
      0.06 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.stddev
   -802332           -13.3%    -695269        sched_debug.cfs_rq:/.spread0.avg
   1029531 ± 40%      -6.5%     963003 ± 51%  sched_debug.cfs_rq:/.spread0.max
  -1116926           -11.3%    -991037        sched_debug.cfs_rq:/.spread0.min
    250004 ± 10%      -6.2%     234600 ± 11%  sched_debug.cfs_rq:/.spread0.stddev
    746.59            +0.3%     748.85        sched_debug.cfs_rq:/.util_avg.avg
      1526 ±  4%      -1.8%       1498 ±  3%  sched_debug.cfs_rq:/.util_avg.max
    118.33 ± 37%      +8.7%     128.67 ± 33%  sched_debug.cfs_rq:/.util_avg.min
    257.79 ±  3%      -1.4%     254.31 ±  4%  sched_debug.cfs_rq:/.util_avg.stddev
    309.08 ±  5%     +15.4%     356.69 ±  8%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1200 ±  6%     +12.4%       1349 ±  9%  sched_debug.cfs_rq:/.util_est_enqueued.max
      2.44 ±143%     -52.3%       1.17 ±223%  sched_debug.cfs_rq:/.util_est_enqueued.min
    241.74 ±  5%     +16.6%     281.91 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    428381 ±  3%      +1.7%     435830 ±  3%  sched_debug.cpu.avg_idle.avg
   1035072 ± 19%     +27.5%    1319661 ± 46%  sched_debug.cpu.avg_idle.max
     21181 ± 47%      +7.6%      22783 ± 58%  sched_debug.cpu.avg_idle.min
    154867 ± 15%     +10.2%     170635 ± 28%  sched_debug.cpu.avg_idle.stddev
    105813 ±  6%      +4.1%     110153 ± 13%  sched_debug.cpu.clock.avg
    106023 ±  6%      +4.1%     110345 ± 13%  sched_debug.cpu.clock.max
    105604 ±  6%      +4.1%     109916 ± 13%  sched_debug.cpu.clock.min
    121.61 ± 23%      +2.5%     124.70 ± 40%  sched_debug.cpu.clock.stddev
    104601 ±  6%      +4.3%     109053 ± 13%  sched_debug.cpu.clock_task.avg
    105076 ±  6%      +4.3%     109543 ± 13%  sched_debug.cpu.clock_task.max
     89692            -0.1%      89608        sched_debug.cpu.clock_task.min
      1342 ± 43%     +30.1%       1745 ± 75%  sched_debug.cpu.clock_task.stddev
     13482            +0.4%      13530        sched_debug.cpu.curr->pid.avg
     16770            +0.2%      16805        sched_debug.cpu.curr->pid.max
      4947 ± 27%      +3.2%       5104 ± 50%  sched_debug.cpu.curr->pid.min
      1805 ±  9%      -4.5%       1724 ± 12%  sched_debug.cpu.curr->pid.stddev
    505781            +0.2%     506623 ±  2%  sched_debug.cpu.max_idle_balance_cost.avg
    874225 ± 46%      -9.4%     792013 ± 59%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
     37209 ±106%      -3.1%      36056 ±172%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 20%      +3.8%       0.00 ± 28%  sched_debug.cpu.next_balance.stddev
      9.50 ±  4%     +11.2%      10.57 ±  5%  sched_debug.cpu.nr_running.avg
     26.67 ±  5%      +7.1%      28.56 ±  5%  sched_debug.cpu.nr_running.max
      0.44 ± 35%     +25.0%       0.56 ± 28%  sched_debug.cpu.nr_running.min
      6.35 ±  4%     +11.6%       7.09 ±  6%  sched_debug.cpu.nr_running.stddev
   1394250            -6.7%    1300659        sched_debug.cpu.nr_switches.avg
   1643137 ±  2%      -7.8%    1515540 ±  2%  sched_debug.cpu.nr_switches.max
   1207910            -7.0%    1123538        sched_debug.cpu.nr_switches.min
     87018 ± 17%     -15.5%      73537 ± 10%  sched_debug.cpu.nr_switches.stddev
 2.134e+09 ±  6%      -3.2%  2.065e+09 ±  3%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
  2.14e+09            +0.0%  2.141e+09        sched_debug.cpu.nr_uninterruptible.stddev
    105600 ±  6%      +4.1%     109910 ± 13%  sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
    104879 ±  6%      +4.1%     109186 ± 14%  sched_debug.ktime
      0.00            +0.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.33            +0.0%       0.33        sched_debug.rt_rq:.rt_nr_migratory.max
      0.03            +0.0%       0.03        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00            +0.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.33            +0.0%       0.33        sched_debug.rt_rq:.rt_nr_running.max
      0.03            +0.0%       0.03        sched_debug.rt_rq:.rt_nr_running.stddev
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.69 ± 98%     +63.7%       1.13 ± 51%  sched_debug.rt_rq:.rt_time.avg
     88.54 ± 98%     +63.5%     144.74 ± 51%  sched_debug.rt_rq:.rt_time.max
      0.00        +1.1e+99%       0.00 ±223%  sched_debug.rt_rq:.rt_time.min
      7.79 ± 98%     +63.5%      12.74 ± 51%  sched_debug.rt_rq:.rt_time.stddev
     98000            -0.3%      97695        sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      2.00 ± 12%      -1.9        0.09 ±223%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.78 ± 14%      -1.8        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.66 ± 15%      -1.7        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      6.73            -1.6        5.16 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      5.06 ±  3%      -1.5        3.58 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.43 ± 12%      -1.4        0.00        perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
     53.78            -1.4       52.40        perf-profile.calltrace.cycles-pp.__libc_read
      5.11 ±  2%      -1.3        3.80 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      9.82 ±  2%      -1.2        8.62 ±  3%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      9.90 ±  2%      -1.2        8.70 ±  3%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      9.70 ±  2%      -1.2        8.50 ±  3%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      1.90 ±  9%      -1.2        0.71 ±  8%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     51.59            -1.1       50.46        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read
     51.29            -1.1       50.17        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      1.10 ± 15%      -1.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      1.08 ± 16%      -1.1        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
     49.81            -1.0       48.85        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      5.21 ±  2%      -0.9        4.26 ±  3%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      5.10 ±  2%      -0.9        4.16 ±  4%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
     49.06            -0.9       48.12        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      4.93 ±  2%      -0.9        3.99 ±  4%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      5.34 ±  3%      -0.9        4.41 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      5.04 ±  3%      -0.9        4.12 ±  2%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
     47.09            -0.9       46.20        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.41            -0.9       45.54        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     45.56            -0.9       44.71        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     45.26            -0.8       44.42        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      3.34 ±  2%      -0.8        2.51 ±  6%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      3.72            -0.6        3.09 ±  3%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.61 ±  2%      -0.5        0.09 ±223%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space
      2.28 ±  3%      -0.5        1.81 ±  6%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      2.18 ±  3%      -0.5        1.72 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.55 ±  2%      -0.4        0.19 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.53 ±  2%      -0.4        0.18 ±141%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      0.52            -0.4        0.17 ±141%  perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.56 ±  3%      -0.3        0.22 ±141%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.34 ± 70%      -0.3        0.00        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.68 ±  2%      -0.3        0.36 ± 70%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm
      0.68 ±  2%      -0.3        0.36 ± 71%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.unix_write_space.sock_wfree
      3.98            -0.3        3.72 ±  4%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.43            -0.3        3.17 ±  5%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      4.15            -0.3        3.89 ±  4%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.34 ± 70%      -0.3        0.08 ±223%  perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.68 ±  2%      -0.2        0.45 ± 45%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state
      2.44 ±  3%      -0.2        2.23 ±  3%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.38            -0.2        1.18 ±  2%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.89            -0.2        0.70 ±  3%  perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.63 ±  5%      -0.2        0.44 ± 45%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.12            -0.2        0.94 ±  4%  perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      0.18 ±141%      -0.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.59            -0.2        0.43 ± 44%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.81            -0.2        1.66 ±  2%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.12            -0.1        0.98 ±  5%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.79            -0.1        0.65 ±  3%  perf-profile.calltrace.cycles-pp.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.77 ±  2%      -0.1        0.63 ±  3%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.74            -0.1        0.60 ±  4%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg
      0.96 ±  2%      -0.1        0.82 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      1.22 ±  6%      -0.1        1.09 ±  4%  perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.96 ±  7%      -0.1        0.83 ±  5%  perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      1.34            -0.1        1.24        perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.73 ±  2%      -0.1        0.63 ±  2%  perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_read.ksys_read.do_syscall_64
      0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_write.ksys_write.do_syscall_64
      0.89            -0.1        0.82 ±  3%  perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      1.23            -0.1        1.16 ±  3%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.70 ±  2%      -0.1        0.63 ±  4%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.39            -0.1        1.33 ±  2%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write
      0.90            -0.1        0.84 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.31            -0.1        1.26        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read
      0.68 ±  2%      -0.1        0.63 ±  3%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.62 ±  2%      -0.1        0.57 ±  4%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.60            -0.0        0.57 ±  3%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.60            -0.0        0.57 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.66            -0.0        0.63        perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      0.64            -0.0        0.60 ±  2%  perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.62 ±  2%      -0.0        0.61 ±  3%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±141%      +0.1        0.25 ±100%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.61            +0.1        0.76 ± 30%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      4.74 ±  2%      +0.2        4.93 ± 27%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.00            +0.2        0.22 ±141%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.2        0.24 ±141%  perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.3        0.27 ±100%  perf-profile.calltrace.cycles-pp.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00            +0.3        0.32 ±101%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.4        0.42 ±101%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.66            +0.4        1.11 ± 74%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.74            +0.5        1.27 ± 59%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.00            +0.5        0.54 ±105%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.77 ±  2%      +0.5        1.31 ± 58%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.88 ±  2%      +0.6        1.43 ± 56%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.56 ±104%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.schedule_timeout
      2.09            +0.6        2.73 ± 42%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      2.13            +0.7        2.78 ± 41%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      2.22            +0.7        2.87 ± 41%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.59 ±  2%      +0.7        3.27 ± 41%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.65            +0.7        3.33 ± 39%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      2.00 ±  2%      +0.8        2.76 ± 46%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      1.86 ±  2%      +0.8        2.62 ± 48%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      1.88 ±  2%      +0.8        2.65 ± 47%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
     45.79            +0.9       46.67        perf-profile.calltrace.cycles-pp.__libc_write
     42.50            +0.9       43.43        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     41.56            +1.0       42.56        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     43.75            +1.1       44.81        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     43.46            +1.1       44.52        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     39.64            +1.1       40.73        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.62            +1.2       38.84        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
     19.29            +3.7       22.98 ±  6%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     15.36 ±  2%      +4.0       19.39 ±  7%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     14.47 ±  2%      +4.5       18.97 ±  8%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     14.22 ±  2%      +4.5       18.72 ±  8%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      9.71 ±  5%      +5.0       14.71 ± 10%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.50 ± 22%      +5.8        8.29 ± 17%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
      2.37 ± 23%      +5.8        8.17 ± 17%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
      2.72 ± 21%      +6.0        8.69 ± 17%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      7.16 ±  5%      +6.3       13.43 ± 11%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      6.78 ±  5%      +6.3       13.06 ± 11%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.37 ±  6%      +6.3       12.68 ± 11%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      1.55 ± 24%      +6.3        7.86 ± 17%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
      1.57 ± 24%      +6.3        7.92 ± 17%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      1.91 ± 20%      +6.6        8.49 ± 17%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      2.39 ± 16%      +6.8        9.19 ± 16%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      6.78            -1.6        5.21 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      5.16 ±  3%      -1.5        3.68 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
     53.87            -1.2       52.63        perf-profile.children.cycles-pp.__libc_read
      9.85 ±  2%      -1.2        8.65 ±  3%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      9.74 ±  2%      -1.2        8.54 ±  3%  perf-profile.children.cycles-pp.__skb_datagram_iter
      9.92 ±  2%      -1.2        8.73 ±  3%  perf-profile.children.cycles-pp.unix_stream_read_actor
      6.12 ±  2%      -1.1        5.00 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
     49.86            -1.0       48.90        perf-profile.children.cycles-pp.ksys_read
      5.15 ±  2%      -0.9        4.20 ±  4%  perf-profile.children.cycles-pp.unix_destruct_scm
      5.24 ±  2%      -0.9        4.30 ±  3%  perf-profile.children.cycles-pp.skb_release_head_state
     49.15            -0.9       48.21        perf-profile.children.cycles-pp.vfs_read
      4.96 ±  2%      -0.9        4.02 ±  4%  perf-profile.children.cycles-pp.sock_wfree
      5.37 ±  3%      -0.9        4.44 ±  2%  perf-profile.children.cycles-pp._copy_to_iter
      5.14 ±  3%      -0.9        4.21 ±  2%  perf-profile.children.cycles-pp.copyout
     47.12            -0.9       46.23        perf-profile.children.cycles-pp.sock_read_iter
     46.46            -0.9       45.58        perf-profile.children.cycles-pp.sock_recvmsg
     45.59            -0.8       44.74        perf-profile.children.cycles-pp.unix_stream_recvmsg
     45.41            -0.8       44.57        perf-profile.children.cycles-pp.unix_stream_read_generic
      3.36 ±  2%      -0.8        2.53 ±  6%  perf-profile.children.cycles-pp.skb_set_owner_w
      3.77            -0.6        3.14 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_free
      2.31 ±  3%      -0.5        1.84 ±  6%  perf-profile.children.cycles-pp.skb_queue_tail
      5.12            -0.3        4.80 ±  3%  perf-profile.children.cycles-pp.__check_object_size
      4.04            -0.3        3.71 ±  4%  perf-profile.children.cycles-pp.check_heap_object
      2.68            -0.3        2.40 ±  2%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      4.18            -0.3        3.92 ±  4%  perf-profile.children.cycles-pp.simple_copy_to_iter
      3.18            -0.3        2.93 ±  2%  perf-profile.children.cycles-pp.__slab_free
      2.50 ±  3%      -0.2        2.29 ±  3%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.91            -0.2        0.71 ±  4%  perf-profile.children.cycles-pp.__build_skb_around
      1.13            -0.2        0.95 ±  4%  perf-profile.children.cycles-pp.unix_write_space
      0.76 ±  2%      -0.2        0.58 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.70 ±  3%      -0.2        0.54 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.65 ±  3%      -0.2        0.48 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.64 ±  3%      -0.2        0.48 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.18 ±  4%      -0.2        1.02 ±  3%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.59 ±  3%      -0.2        0.44 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.54 ±  3%      -0.2        0.40 ±  5%  perf-profile.children.cycles-pp.tick_sched_timer
      0.50 ±  3%      -0.1        0.36 ±  5%  perf-profile.children.cycles-pp.update_process_times
      1.28 ±  5%      -0.1        1.14 ±  3%  perf-profile.children.cycles-pp._copy_from_iter
      0.51 ±  3%      -0.1        0.38 ±  5%  perf-profile.children.cycles-pp.tick_sched_handle
      1.05 ±  7%      -0.1        0.92 ±  4%  perf-profile.children.cycles-pp.copyin
      0.64 ±  7%      -0.1        0.52 ±  5%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.40 ±  3%      -0.1        0.29 ±  5%  perf-profile.children.cycles-pp.scheduler_tick
      2.18            -0.1        2.07 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      0.34 ±  4%      -0.1        0.23 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.17 ± 44%      -0.1        0.06 ±141%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.76 ±  2%      -0.1        0.66 ±  2%  perf-profile.children.cycles-pp.skb_unlink
      1.22            -0.1        1.13 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      0.46 ±  2%      -0.1        0.37        perf-profile.children.cycles-pp.task_work_run
      0.45 ±  2%      -0.1        0.37 ±  2%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.12 ± 44%      -0.1        0.04 ±141%  perf-profile.children.cycles-pp.perf_tp_event
      1.59            -0.1        1.51 ±  2%  perf-profile.children.cycles-pp.__entry_text_start
      1.26 ±  3%      -0.1        1.18 ±  4%  perf-profile.children.cycles-pp.__fdget_pos
      1.10 ±  3%      -0.1        1.03 ±  4%  perf-profile.children.cycles-pp.__fget_light
      0.92 ±  2%      -0.1        0.85 ±  3%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.52 ±  4%      -0.1        0.45 ±  6%  perf-profile.children.cycles-pp.__virt_addr_valid
      1.05            -0.1        0.99 ±  2%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.15 ± 48%      -0.1        0.09 ±144%  perf-profile.children.cycles-pp.reader__read_event
      1.32            -0.1        1.27 ±  3%  perf-profile.children.cycles-pp.security_file_permission
      0.27 ±  3%      -0.1        0.22 ±  4%  perf-profile.children.cycles-pp.load_balance
      0.27 ±  3%      -0.1        0.22 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      0.43            -0.1        0.38 ±  2%  perf-profile.children.cycles-pp.mutex_unlock
      0.94            -0.1        0.89 ±  3%  perf-profile.children.cycles-pp.obj_cgroup_charge
      1.18            -0.0        1.14 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.14 ± 57%      -0.0        0.10 ±144%  perf-profile.children.cycles-pp.__cmd_record
      0.06 ± 45%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.87            -0.0        0.84 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.41 ±  4%      -0.0        0.37        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.32 ±  4%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.12 ± 60%      -0.0        0.09 ±144%  perf-profile.children.cycles-pp.record__finish_output
      0.12 ± 60%      -0.0        0.09 ±144%  perf-profile.children.cycles-pp.perf_session__process_events
      0.69            -0.0        0.66        perf-profile.children.cycles-pp.security_socket_recvmsg
      0.10 ± 69%      -0.0        0.07 ±141%  perf-profile.children.cycles-pp.ordered_events__queue
      0.33            -0.0        0.30        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.10 ± 69%      -0.0        0.07 ±141%  perf-profile.children.cycles-pp.process_simple
      0.10 ± 69%      -0.0        0.07 ±141%  perf-profile.children.cycles-pp.queue_event
      0.13 ±  2%      -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.detach_tasks
      0.36 ±  2%      -0.0        0.33        perf-profile.children.cycles-pp.aa_file_perm
      0.22 ±  3%      -0.0        0.19 ± 10%  perf-profile.children.cycles-pp.wake_affine
      0.26 ±  6%      -0.0        0.24 ±  8%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.50 ±  4%      -0.0        0.47 ± 16%  perf-profile.children.cycles-pp.update_curr
      0.16            -0.0        0.13 ± 11%  perf-profile.children.cycles-pp.__list_add_valid
      0.16 ±  3%      -0.0        0.13 ±  9%  perf-profile.children.cycles-pp.task_h_load
      0.18 ±  8%      -0.0        0.15 ±  4%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.54            -0.0        0.51 ±  2%  perf-profile.children.cycles-pp.mutex_lock
      0.05            -0.0        0.03 ±100%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.73 ±  2%      -0.0        0.71 ± 18%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.39            -0.0        0.37        perf-profile.children.cycles-pp.__get_task_ioprio
      0.48            -0.0        0.46 ± 16%  perf-profile.children.cycles-pp.switch_fpu_return
      0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.page_counter_try_charge
      0.13 ±  3%      -0.0        0.12 ± 12%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.33 ±  2%      -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.03 ±142%      -0.0        0.02 ±223%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.03 ±142%      -0.0        0.02 ±223%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.20 ±  2%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.16            -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.kfree
      0.03 ±141%      -0.0        0.02 ±223%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.36            -0.0        0.35 ± 14%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.16 ±  3%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.24 ±  2%      -0.0        0.23        perf-profile.children.cycles-pp.wait_for_unix_gc
      1.86            -0.0        1.86 ± 15%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.13            -0.0        0.12        perf-profile.children.cycles-pp.refill_stock
      0.10 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.unix_passcred_enabled
      0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.16            -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.05            -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.apparmor_socket_sendmsg
      0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.sched_mm_cid_remote_clear
      0.08 ±  4%      -0.0        0.07 ± 11%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.53 ±  2%      -0.0        0.52 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.20            -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.scm_recv
      0.09 ±  7%      -0.0        0.08 ± 21%  perf-profile.children.cycles-pp.update_min_vruntime
     94.98            -0.0       94.97        perf-profile.children.cycles-pp.do_syscall_64
      0.28 ±  2%      -0.0        0.28 ±  2%  perf-profile.children.cycles-pp.kmalloc_slab
     95.44            -0.0       95.44        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.16 ±  3%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.08 ±  8%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.cpuacct_charge
      0.07 ±  6%      -0.0        0.07        perf-profile.children.cycles-pp.should_failslab
      0.06 ±  7%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.obj_cgroup_uncharge
      0.16 ±  2%      -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      0.06 ±  6%      -0.0        0.06        perf-profile.children.cycles-pp.__x64_sys_read
      0.14 ±  2%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.put_pid
      0.07 ±  6%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.24 ±  2%      +0.0        0.24 ±  4%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.15            +0.0        0.15 ±  5%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.12 ±  4%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.fsnotify_perm
      0.08            +0.0        0.08        perf-profile.children.cycles-pp.skb_put
      0.06 ±  7%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__x64_sys_write
      0.06            +0.0        0.06        perf-profile.children.cycles-pp.kfree_skbmem
      0.05            +0.0        0.05        perf-profile.children.cycles-pp.apparmor_socket_recvmsg
      0.08 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.skb_free_head
      0.24 ±  6%      +0.0        0.24 ± 17%  perf-profile.children.cycles-pp.__switch_to_asm
      0.07            +0.0        0.07 ± 34%  perf-profile.children.cycles-pp.put_prev_entity
      0.40 ±  2%      +0.0        0.41 ±  3%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.22            +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.11            +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.12 ± 17%      +0.0        0.12 ± 20%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.05            +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.rb_erase
      0.18 ±  2%      +0.0        0.18 ± 23%  perf-profile.children.cycles-pp.__switch_to
      0.06 ±  8%      +0.0        0.06 ± 50%  perf-profile.children.cycles-pp.set_task_cpu
      0.10 ±  4%      +0.0        0.11 ± 28%  perf-profile.children.cycles-pp.check_preempt_curr
      1.50            +0.0        1.51 ± 18%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.09            +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.os_xsave
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.set_next_buddy
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.get_any_partial
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.wait4
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__do_sys_wait4
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.kernel_wait4
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_wait
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.select_idle_core
      0.06 ±  7%      +0.0        0.08 ± 35%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.19            +0.0        0.21 ± 29%  perf-profile.children.cycles-pp.prepare_task_switch
      0.09 ±  7%      +0.0        0.10 ± 32%  perf-profile.children.cycles-pp.finish_task_switch
      0.13 ±  3%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.put_cpu_partial
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  3%      +0.0        0.14 ± 28%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.50 ±  3%      +0.0        0.51 ± 24%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.16 ±  2%      +0.0        0.18 ± 22%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.09 ±  4%      +0.0        0.11 ± 27%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.pick_next_entity
      0.02 ± 99%      +0.0        0.05 ± 73%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.48 ±  2%      +0.0        0.51 ±  2%  perf-profile.children.cycles-pp.__check_heap_object
      0.11 ±  3%      +0.0        0.13 ± 30%  perf-profile.children.cycles-pp.reweight_entity
      0.01 ±223%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.13 ±  8%      +0.0        0.15 ± 32%  perf-profile.children.cycles-pp.___perf_sw_event
      0.82 ±  2%      +0.0        0.85 ± 23%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.schedule_idle
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.native_sched_clock
      0.05 ±  7%      +0.0        0.09 ± 78%  perf-profile.children.cycles-pp.available_idle_cpu
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.0        0.04 ±104%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.0        0.04 ±100%  perf-profile.children.cycles-pp.intel_idle
      0.20 ±  2%      +0.0        0.24 ± 28%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.0        0.04 ±105%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.0        0.04 ±100%  perf-profile.children.cycles-pp.intel_idle_irq
      0.45            +0.1        0.50 ± 26%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.07 ± 71%  perf-profile.children.cycles-pp.finish_wait
      0.36 ±  3%      +0.1        0.46 ± 33%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.1        0.10 ±100%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.1        0.10 ±100%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.1        0.10 ±101%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.00            +0.1        0.11 ±100%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.59 ±  2%      +0.1        0.71 ± 34%  perf-profile.children.cycles-pp.enqueue_entity
      0.30 ±  3%      +0.1        0.42 ± 36%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.12 ±102%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.1        0.13 ± 81%  perf-profile.children.cycles-pp.select_idle_cpu
      0.06 ±  9%      +0.1        0.20 ± 64%  perf-profile.children.cycles-pp.select_idle_sibling
      0.68            +0.2        0.84 ± 36%  perf-profile.children.cycles-pp.update_load_avg
      0.45 ±  3%      +0.2        0.64 ± 30%  perf-profile.children.cycles-pp.prepare_to_wait
      4.75 ±  2%      +0.2        4.94 ± 26%  perf-profile.children.cycles-pp.sock_def_readable
      0.00            +0.3        0.27 ± 94%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.3        0.27 ± 94%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.00            +0.3        0.27 ± 94%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.3        0.27 ± 94%  perf-profile.children.cycles-pp.do_idle
      0.96            +0.5        1.42 ± 51%  perf-profile.children.cycles-pp.dequeue_task_fair
      3.01            +0.5        3.52 ± 33%  perf-profile.children.cycles-pp.schedule_timeout
      3.28 ±  2%      +0.5        3.81 ± 35%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.14 ±  2%      +0.6        1.70 ± 50%  perf-profile.children.cycles-pp.activate_task
      1.05            +0.6        1.61 ± 52%  perf-profile.children.cycles-pp.enqueue_task_fair
      1.20 ±  2%      +0.6        1.80 ± 50%  perf-profile.children.cycles-pp.ttwu_do_activate
      2.69 ±  2%      +0.6        3.29 ± 38%  perf-profile.children.cycles-pp.__wake_up_common
      2.56 ±  2%      +0.6        3.17 ± 39%  perf-profile.children.cycles-pp.autoremove_wake_function
      3.25            +0.6        3.87 ± 34%  perf-profile.children.cycles-pp.schedule
      2.48 ±  2%      +0.6        3.10 ± 39%  perf-profile.children.cycles-pp.try_to_wake_up
      3.20            +0.6        3.85 ± 35%  perf-profile.children.cycles-pp.__schedule
      2.66            +0.7        3.34 ± 38%  perf-profile.children.cycles-pp.unix_stream_data_wait
      0.71 ±  3%      +0.8        1.52 ± 74%  perf-profile.children.cycles-pp.update_cfs_group
     42.56            +0.9       43.50        perf-profile.children.cycles-pp.ksys_write
     45.89            +1.0       46.85        perf-profile.children.cycles-pp.__libc_write
     41.66            +1.0       42.66        perf-profile.children.cycles-pp.vfs_write
     39.70            +1.1       40.80        perf-profile.children.cycles-pp.sock_write_iter
     37.85            +1.2       39.07        perf-profile.children.cycles-pp.unix_stream_sendmsg
     19.34            +3.7       23.02 ±  6%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     15.43 ±  2%      +4.0       19.46 ±  7%  perf-profile.children.cycles-pp.consume_skb
      4.72 ± 13%      +4.4        9.16 ± 16%  perf-profile.children.cycles-pp.__unfreeze_partials
     14.51 ±  2%      +4.5       19.00 ±  8%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     14.30 ±  2%      +4.5       18.80 ±  8%  perf-profile.children.cycles-pp.__alloc_skb
      9.74 ±  5%      +5.0       14.74 ± 10%  perf-profile.children.cycles-pp.skb_release_data
      3.36 ± 12%      +5.6        8.91 ± 16%  perf-profile.children.cycles-pp.get_partial_node
      4.29 ± 10%      +5.6        9.91 ± 15%  perf-profile.children.cycles-pp.___slab_alloc
      6.85 ±  5%      +6.3       13.12 ± 11%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      7.23 ±  5%      +6.3       13.51 ± 11%  perf-profile.children.cycles-pp.kmalloc_reserve
      6.49 ±  5%      +6.3       12.80 ± 11%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
     10.87 ±  8%      +9.4       20.22 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      8.27 ± 11%     +10.0       18.23 ± 13%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      5.78            -1.5        4.27 ±  5%  perf-profile.self.cycles-pp.kmem_cache_free
      5.20 ±  2%      -1.1        4.08 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock
      5.08 ±  3%      -0.9        4.17 ±  2%  perf-profile.self.cycles-pp.copyout
      4.80            -0.9        3.92 ±  3%  perf-profile.self.cycles-pp.unix_stream_read_generic
      3.31 ±  2%      -0.8        2.49 ±  5%  perf-profile.self.cycles-pp.skb_set_owner_w
      3.80 ±  2%      -0.7        3.06 ±  4%  perf-profile.self.cycles-pp.sock_wfree
      3.10 ±  2%      -0.6        2.48 ±  5%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      3.42 ±  2%      -0.6        2.83 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      2.65 ±  2%      -0.6        2.09 ±  5%  perf-profile.self.cycles-pp.__kmem_cache_free
      2.12 ±  4%      -0.5        1.62 ±  7%  perf-profile.self.cycles-pp.sock_def_readable
      3.35            -0.3        3.09 ±  5%  perf-profile.self.cycles-pp.check_heap_object
      3.13            -0.2        2.88        perf-profile.self.cycles-pp.__slab_free
      1.75            -0.2        1.52 ±  2%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      1.48            -0.2        1.29 ±  3%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.87            -0.2        0.68 ±  4%  perf-profile.self.cycles-pp.__build_skb_around
      1.16            -0.2        0.98 ±  2%  perf-profile.self.cycles-pp.skb_release_data
      1.01 ±  7%      -0.1        0.88 ±  4%  perf-profile.self.cycles-pp.copyin
      0.59 ±  7%      -0.1        0.48 ±  5%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      1.03            -0.1        0.94 ±  2%  perf-profile.self.cycles-pp.__alloc_skb
      0.96            -0.1        0.88 ±  3%  perf-profile.self.cycles-pp.aa_sk_perm
      0.42 ±  3%      -0.1        0.34 ±  4%  perf-profile.self.cycles-pp.task_mm_cid_work
      1.93            -0.1        1.86 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      0.82            -0.1        0.75 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      1.06 ±  3%      -0.1        0.99 ±  4%  perf-profile.self.cycles-pp.__fget_light
      0.10 ± 44%      -0.1        0.04 ±141%  perf-profile.self.cycles-pp.perf_tp_event
      0.48 ±  4%      -0.1        0.42 ±  6%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.82 ±  3%      -0.1        0.76 ±  3%  perf-profile.self.cycles-pp.__libc_read
      1.09            -0.1        1.03 ±  2%  perf-profile.self.cycles-pp.vfs_write
      0.41            -0.1        0.36 ±  2%  perf-profile.self.cycles-pp.mutex_unlock
      0.54 ±  2%      -0.0        0.50 ±  3%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      1.15            -0.0        1.10 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.93            -0.0        0.89        perf-profile.self.cycles-pp.sock_write_iter
      0.79 ±  2%      -0.0        0.75 ±  6%  perf-profile.self.cycles-pp.__libc_write
      0.06 ± 45%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.41 ±  4%      -0.0        0.37 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.42            -0.0        0.39 ±  2%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.67 ±  2%      -0.0        0.64 ±  4%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.59 ±  2%      -0.0        0.55 ± 16%  perf-profile.self.cycles-pp.__schedule
      0.47            -0.0        0.44 ±  3%  perf-profile.self.cycles-pp.__entry_text_start
      0.45            -0.0        0.42        perf-profile.self.cycles-pp.consume_skb
      0.04 ± 45%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.select_task_rq
      0.10 ± 69%      -0.0        0.07 ±141%  perf-profile.self.cycles-pp.queue_event
      0.31 ±  2%      -0.0        0.28        perf-profile.self.cycles-pp.aa_file_perm
      0.22            -0.0        0.19 ±  4%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.16 ±  3%      -0.0        0.13 ±  9%  perf-profile.self.cycles-pp.task_h_load
      0.28            -0.0        0.25        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.43            -0.0        0.40 ±  2%  perf-profile.self.cycles-pp.unix_write_space
      0.15 ± 10%      -0.0        0.13 ±  5%  perf-profile.self.cycles-pp.skb_unlink
      0.15            -0.0        0.13 ±  9%  perf-profile.self.cycles-pp.__list_add_valid
      0.51 ±  2%      -0.0        0.49        perf-profile.self.cycles-pp.__cond_resched
      0.14 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.34 ±  2%      -0.0        0.32        perf-profile.self.cycles-pp.__get_task_ioprio
      0.20 ±  5%      -0.0        0.18 ±  4%  perf-profile.self.cycles-pp.memcg_account_kmem
      1.02            -0.0        1.00 ±  2%  perf-profile.self.cycles-pp.vfs_read
      0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.update_process_times
      0.12 ±  3%      -0.0        0.10 ± 18%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.12 ±  3%      -0.0        0.11 ± 13%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.55            -0.0        0.54 ±  3%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.36            -0.0        0.35 ±  4%  perf-profile.self.cycles-pp.mutex_lock
      0.14 ±  4%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.65            -0.0        0.63        perf-profile.self.cycles-pp.sock_read_iter
      0.23            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.20 ±  2%      -0.0        0.19 ± 16%  perf-profile.self.cycles-pp.enqueue_entity
      0.13 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.check_stack_object
      0.36            -0.0        0.35 ± 14%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.20 ±  3%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.16 ±  3%      -0.0        0.15        perf-profile.self.cycles-pp.security_socket_recvmsg
      0.14 ±  2%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp.kfree
      0.08 ± 12%      -0.0        0.07 ±  7%  perf-profile.self.cycles-pp.obj_cgroup_uncharge_pages
      0.13 ±  3%      -0.0        0.12 ± 12%  perf-profile.self.cycles-pp.__wake_up_common
      0.12 ±  4%      -0.0        0.10 ± 22%  perf-profile.self.cycles-pp.switch_fpu_return
      0.10 ±  5%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.try_charge_memcg
      0.05            -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.update_rq_clock
      0.08 ±  4%      -0.0        0.07        perf-profile.self.cycles-pp.unix_passcred_enabled
      0.24            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
      0.09 ±  6%      -0.0        0.08 ± 19%  perf-profile.self.cycles-pp.prepare_task_switch
      0.05 ±  8%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.49            -0.0        0.48        perf-profile.self.cycles-pp.__check_object_size
      0.20 ±  2%      -0.0        0.19 ±  3%  perf-profile.self.cycles-pp.ksys_write
      0.23 ±  2%      -0.0        0.23 ±  2%  perf-profile.self.cycles-pp._copy_to_iter
      0.50            -0.0        0.49 ±  2%  perf-profile.self.cycles-pp.refill_obj_stock
      0.24 ±  2%      -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.24 ±  3%      -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.kmalloc_slab
      0.20 ±  2%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.16 ±  2%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      0.16 ±  3%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.15 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.security_socket_sendmsg
      0.16 ±  3%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.scm_recv
      0.09 ±  4%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.wait_for_unix_gc
      0.09 ±  4%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.refill_stock
      0.04 ± 44%      -0.0        0.04 ±101%  perf-profile.self.cycles-pp.reweight_entity
      0.08 ±  8%      -0.0        0.08 ± 12%  perf-profile.self.cycles-pp.cpuacct_charge
      0.34 ±  2%      -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.12            -0.0        0.12 ± 18%  perf-profile.self.cycles-pp.schedule_timeout
      0.08 ±  4%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.simple_copy_to_iter
      0.22 ±  2%      -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.22 ±  2%      -0.0        0.21        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.20            -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.18 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.12 ±  3%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.10 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.12 ±  4%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.skb_queue_tail
      0.09 ±  5%      -0.0        0.09        perf-profile.self.cycles-pp.put_pid
      0.08 ±  5%      -0.0        0.08 ± 19%  perf-profile.self.cycles-pp.update_min_vruntime
      0.12 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.rw_verify_area
      0.13 ±  4%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.08 ±  6%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.skb_release_head_state
      0.22 ±  2%      -0.0        0.22 ± 17%  perf-profile.self.cycles-pp.update_curr
      0.10 ± 18%      -0.0        0.10 ± 22%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.07 ±  6%      -0.0        0.07 ± 15%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.18 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.14 ±  3%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.try_to_wake_up
      0.11            +0.0        0.11 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06            +0.0        0.06        perf-profile.self.cycles-pp.skb_free_head
      0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.kfree_skbmem
      0.10            +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.07 ±  5%      +0.0        0.07 ± 16%  perf-profile.self.cycles-pp.dequeue_entity
      0.12 ±  3%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.is_vmalloc_addr
      0.17 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.18 ±  2%      +0.0        0.18 ± 22%  perf-profile.self.cycles-pp.__switch_to
      0.40 ±  2%      +0.0        0.40 ±  3%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.24 ±  6%      +0.0        0.24 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.11 ±  4%      +0.0        0.11 ±  9%  perf-profile.self.cycles-pp.fsnotify_perm
      0.09 ±  5%      +0.0        0.10 ±  7%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.08            +0.0        0.08 ± 25%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08 ±  6%      +0.0        0.08 ± 10%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.06 ±  7%      +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.skb_put
      0.06 ±  7%      +0.0        0.07 ± 27%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.04 ± 44%      +0.0        0.04 ± 45%  perf-profile.self.cycles-pp.rb_erase
      0.52            +0.0        0.53 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.19 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.sock_recvmsg
      0.30            +0.0        0.31 ±  4%  perf-profile.self.cycles-pp.security_file_permission
      0.07 ±  5%      +0.0        0.08 ± 26%  perf-profile.self.cycles-pp.prepare_to_wait
      0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.09 ±  4%      +0.0        0.10 ± 18%  perf-profile.self.cycles-pp.os_xsave
      0.01 ±223%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.put_prev_entity
      0.06 ±  6%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.schedule
      0.12 ±  4%      +0.0        0.14 ±  9%  perf-profile.self.cycles-pp.put_cpu_partial
      0.15 ±  2%      +0.0        0.16 ± 21%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.pick_next_entity
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.46 ±  2%      +0.0        0.47 ±  2%  perf-profile.self.cycles-pp.__check_heap_object
      0.12 ±  9%      +0.0        0.13 ± 34%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.select_idle_sibling
      0.11 ±  6%      +0.0        0.13 ± 28%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.03 ±102%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.04 ±101%  perf-profile.self.cycles-pp.intel_idle_irq
      0.00            +0.0        0.04 ±100%  perf-profile.self.cycles-pp.intel_idle
      0.03 ± 70%      +0.0        0.08 ± 79%  perf-profile.self.cycles-pp.available_idle_cpu
      0.44            +0.1        0.50 ± 26%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.36 ±  3%      +0.1        0.42 ±  7%  perf-profile.self.cycles-pp.get_partial_node
      0.92            +0.1        0.98 ±  6%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.1        0.06 ± 79%  perf-profile.self.cycles-pp.select_idle_cpu
      0.31 ±  4%      +0.1        0.43 ±  8%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.40 ±  3%      +0.1        0.53 ± 42%  perf-profile.self.cycles-pp.update_load_avg
      0.71 ±  3%      +0.8        1.52 ± 74%  perf-profile.self.cycles-pp.update_cfs_group
      8.25 ± 11%     +10.0       18.22 ± 13%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.01 ±157%   +7177.0%       0.74 ±222%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.07 ±223%    +783.0%       0.64 ±222%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.10 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1.12 ±102%     +86.3%       2.09 ± 34%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.36 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.03 ± 99%     -92.0%       0.00 ±143%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    +800.0%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.44 ±156%    +136.1%       3.40 ±  5%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2.66 ± 97%    +503.2%      16.06 ± 45%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.02 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.01 ±223%    +982.5%       0.07 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      2.22 ±216%    +744.1%      18.72 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.06 ±223%    +499.7%       0.36 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%  +1.1e+06%       3.76 ±169%  perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00         +5e+101%       0.50 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.00 ±223%   +1300.0%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.5e+102%       1.53 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      1.47 ±223%     -57.3%       0.63 ±222%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00          +5e+99%       0.01 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.45 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00       +1.6e+101%       0.16 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.userfaultfd_set_vm_flags.dup_userfaultfd.dup_mmap
      0.82 ±223%    +183.8%       2.32 ±142%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.01 ±199%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +1.8e+102%       1.77 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +2.3e+102%       2.35 ±161%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.01 ±174%     -52.9%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.16 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.copy_sighand.copy_process.kernel_clone
      0.00       +4.2e+100%       0.04 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00         +8e+100%       0.08 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.62 ±112%    +252.4%       2.19 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%  +31471.2%       2.74 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.49 ±114%    +284.9%       1.90 ± 31%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +6.5e+101%       0.65 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.00 ±223%  +17500.0%       0.09 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.1e+104%     113.98 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
     15.56 ±150%     +13.8%      17.70 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      6.45 ±217%     -32.5%       4.35 ±131%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.29 ±223%     -65.1%       0.45 ± 93%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      0.32 ±132%    +747.3%       2.67 ± 51%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      3.05 ±223%     -98.7%       0.04 ±182%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +7.2e+100%       0.07 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.37 ±113%    +964.0%       3.89 ± 89%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.02 ±156%    +884.4%       0.15 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.44 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.00 ±223%   +8470.0%       0.14 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.25 ±222%     -84.4%       0.19 ±129%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     69.72 ±222%    -100.0%       0.03 ±223%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.16 ±211%     +96.4%       0.31 ±164%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.39 ± 84%   +1024.5%      15.63 ± 37%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.75 ± 76%   +1937.6%      15.34 ± 79%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±125%     +46.0%       0.01 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.85 ±172%    +171.2%       7.72 ± 68%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.16 ±123%   +1748.4%       2.96 ±117%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      5.77 ± 85%    +103.9%      11.77 ± 22%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.54 ± 85%    +244.9%       1.87 ± 16%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.01 ±223%   +9651.7%       1.45 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      0.10 ± 78%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     22.92 ±131%     -71.5%       6.54 ±101%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     21.91 ±223%      -6.7%      20.45 ±122%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      0.14 ± 74%    +562.8%       0.94 ±183%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.29 ±185%     -96.1%       0.01 ± 48%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    106.82 ±142%     -76.0%      25.69 ±222%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±217%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.00 ±115%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      0.12 ±189%  +10355.7%      12.08 ±222%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±143%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.03 ± 97%    +152.4%       0.08 ±118%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     13.98 ±223%     -99.9%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      6.20 ± 75%     +91.5%      11.87 ± 47%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.44 ± 72%    +256.3%       8.71 ± 25%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.10 ± 83%    +184.7%       3.14 ± 19%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.33 ±208%    +275.3%       1.24 ±221%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    133.81 ±141%     -99.8%       0.24 ±223%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.54 ±214%    +408.9%       2.77 ±201%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3.79 ±117%    +528.5%      23.83 ±105%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.14 ±158%   +2667.4%       3.98 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__p4d_alloc.__handle_mm_fault
      0.34 ±223%     +87.5%       0.64 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.65 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1228 ± 93%      -7.4%       1137 ± 39%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.08 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.65 ±110%     -96.1%       0.03 ±160%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.10 ±145%    +194.9%       0.29 ±214%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    625.66 ±199%     +64.6%       1029 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    941.66 ± 78%    +178.2%       2619 ± 21%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.02 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.02 ±223%    +260.8%       0.07 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
     70.12 ±212%     +51.1%     105.92 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.59 ±223%    +690.7%       4.65 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00 ±223%  +1.1e+06%       3.76 ±169%  perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      0.00         +5e+101%       0.50 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.00 ±223%    +685.7%       0.01 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.5e+102%       1.53 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
     30.86 ±223%     -67.5%      10.03 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +5.4e+100%       0.05 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      1.34 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00         +8e+101%       0.80 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.userfaultfd_set_vm_flags.dup_userfaultfd.dup_mmap
      4.09 ±223%    +387.7%      19.96 ±136%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.02 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.02 ±171%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +5.3e+102%       5.32 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +9.4e+102%       9.38 ±161%  perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.15 ±196%     -87.7%       0.02 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.16 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.copy_sighand.copy_process.kernel_clone
      0.00       +4.2e+100%       0.04 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00       +4.8e+101%       0.48 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
    624.75 ±118%    +119.9%       1373 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.01 ±223%  +31471.2%       2.74 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
    113.31 ±164%    +511.1%     692.48 ± 32%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +6.5e+101%       0.65 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.02 ±223%   +3059.8%       0.62 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.1e+104%     113.98 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.01 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      1312 ±104%     -68.1%     419.35 ± 65%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     25.63 ±218%     -25.1%      19.21 ±103%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     12.42 ±223%     -70.2%       3.70 ± 86%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     36.52 ±137%   +1666.2%     645.04 ± 66%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     45.78 ±223%     -99.3%       0.33 ±182%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +2.1e+101%       0.21 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
     49.98 ±111%   +1263.8%     681.67 ±102%  perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.23 ±178%   +1143.8%       2.80 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.45 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.09 ±210%   +5466.4%       4.89 ±206%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.25 ±222%     -77.2%       0.28 ±143%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    696.86 ±222%    -100.0%       0.06 ±223%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.31 ±216%     +28.1%       0.40 ±135%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    698.60 ±110%    +108.6%       1457 ± 61%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     95.16 ± 93%    +995.8%       1042 ± 83%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.29 ±130%     +14.5%       0.33 ±223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    178.31 ±206%    +188.7%     514.72 ± 81%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     19.65 ±139%    +414.3%     101.08 ±145%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1070 ± 94%     +51.5%       1621 ± 22%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2308 ± 72%     +70.2%       3930 ± 11%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.01 ±223%   +9651.7%       1.45 ±223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      2.56 ±166%    -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      1723 ± 99%     -10.9%       1535 ±134%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     87.59 ±223%    +542.6%     562.84 ±137%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
     14.77 ±165%     -86.6%       1.97 ±162%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.23 ±213%     -99.6%       0.01 ± 58%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      1330 ±141%     -96.1%      51.64 ±221%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.03 ±214%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.00 ±118%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.97 ±159%   +5136.6%     155.69 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00 ±147%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.25 ±139%    +178.8%       0.70 ±125%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     83.85 ±223%    -100.0%       0.02 ± 33%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      1152 ± 86%     +17.1%       1350 ± 60%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    810.39 ± 72%    +119.9%       1781 ± 21%  perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2251 ± 73%     +60.1%       3605 ± 15%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    193.53 ±220%     +54.1%     298.18 ±223%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      1329 ±141%    -100.0%       0.48 ±223%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      3.71 ±219%    +173.1%      10.14 ±199%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1485 ±118%     +75.0%       2599 ± 52%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork
      1.03 ± 84%    +246.0%       3.55 ± 18%  perf-sched.total_sch_delay.average.ms
      2527 ± 72%     +69.8%       4291 ± 18%  perf-sched.total_sch_delay.max.ms
      4.29 ± 80%    +195.8%      12.70 ± 16%  perf-sched.total_wait_and_delay.average.ms
   2044832 ± 85%     +15.6%    2363513 ± 19%  perf-sched.total_wait_and_delay.count.ms
      4763 ± 73%     +72.4%       8212 ± 11%  perf-sched.total_wait_and_delay.max.ms
      3.27 ± 80%    +180.0%       9.15 ± 16%  perf-sched.total_wait_time.average.ms
      3235 ± 70%     +66.9%       5398 ± 17%  perf-sched.total_wait_time.max.ms
      1.43 ±223%    +187.5%       4.11 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     12.32 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     13.18 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      2.47 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.58 ±223%   +1540.6%      25.86 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
     10.78 ± 71%     +87.5%      20.21 ± 28%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.62 ±223%    +222.3%       8.45 ± 71%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     11.90 ± 83%    +319.8%      49.94 ± 34%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      4.50 ±223%    +739.6%      37.74 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +2.9e+102%       2.90 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      3.03 ±223%    +626.2%      22.04 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      4.88 ±187%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00       +1.8e+102%       1.78 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.7e+102%       1.73 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +4.6e+103%      45.91 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
     37.98 ±177%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      1.07 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      4.34 ±120%     -47.4%       2.28 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.16 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +2.7e+102%       2.74 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      3.09 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      1.74 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +2.3e+104%     230.51 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
    183.84 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     34.77 ±134%     +41.6%      49.22 ± 22%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.84 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      6.29 ±223%     -54.7%       2.85 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.88 ±223%    +146.4%       7.10 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      2.91 ±223%     -17.2%       2.41 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      8.23 ±164%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.2e+103%      11.69 ±101%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    337.44 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     19.32 ±212%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    417.87 ±222%     +19.8%     500.43 ±152%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    135.47 ±140%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    750.58 ±142%     -37.1%     472.40 ±116%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     10.22 ± 85%    +445.2%      55.73 ± 31%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      5.42 ±119%    +921.9%      55.34 ± 46%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      6.16 ±118%    +480.3%      35.75 ± 25%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00         +1e+103%      10.48 ±103%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     20.62 ± 82%    +109.6%      43.23 ± 23%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.07 ± 80%    +221.0%       6.66 ± 14%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    140.85 ±118%     -64.8%      49.63 ± 64%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     53.08 ±223%     -18.2%      43.42 ±125%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      3.97 ±141%   +1790.8%      75.14 ±142%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    193.74 ± 71%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    309.14 ±105%     +27.3%     393.45 ± 80%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     15.08 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      1.06 ±223%   +2310.1%      25.50 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +7.8e+103%      78.37 ±216%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    901.76 ± 73%     -20.5%     716.69 ± 61%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     16.69 ± 73%     +75.5%      29.30 ± 51%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     16.73 ± 72%     +88.0%      31.45 ± 22%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3.93 ± 79%    +177.4%      10.90 ± 18%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    633.44 ± 79%      -6.2%     594.26 ± 18%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    199.31 ±148%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00       +2.5e+102%       2.54 ±223%  perf-sched.wait_and_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    306.11 ± 71%    +109.5%     641.23 ± 17%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
      0.67 ±223%    +775.0%       5.83 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      2.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
    933.50 ±147%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      5.17 ±223%     -58.1%       2.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    174.33 ± 73%     +54.2%     268.83 ± 26%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    209.50 ±223%    +567.4%       1398 ± 77%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    533.17 ± 91%     +19.4%     636.67 ± 28%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     10.00 ±223%     -90.0%       1.00 ±223%  perf-sched.wait_and_delay.count.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
      3.50 ±223%     -47.6%       1.83 ±223%  perf-sched.wait_and_delay.count.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.50 ±152%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00         +5e+101%       0.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +6.7e+101%       0.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +1.5e+102%       1.50 ±223%  perf-sched.wait_and_delay.count.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      5.17 ±150%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
    541.83 ±112%     -54.8%     244.67 ±223%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      1.00 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     77.83 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +1.7e+101%       0.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.50 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
    112.83 ±100%     -63.2%      41.50 ± 37%  perf-sched.wait_and_delay.count.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.67 ±223%    +100.0%       1.33 ±223%  perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.67 ±223%     +80.0%       3.00 ±223%  perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     41.17 ±223%     +82.6%      75.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      5.83 ±143%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.1e+104%     108.50 ±100%  perf-sched.wait_and_delay.count.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     13.67 ±150%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.50 ±152%     +33.3%       0.67 ±141%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.83 ±100%    -100.0%       0.00        perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.67 ±141%    +100.0%       1.33 ±103%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    738.17 ± 75%     -66.2%     249.83 ± 36%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    169.67 ±102%     -44.4%      94.33 ± 25%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     52.50 ±101%    +207.0%     161.17 ± 25%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00       +1.5e+103%      14.67 ±142%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    610.50 ± 71%    +282.4%       2334 ± 24%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    528932 ±100%      -6.8%     492884 ± 16%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     24.67 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    132.50 ±118%    +186.8%     380.00 ± 39%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.67 ±223%   +1850.0%      13.00 ±109%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork
    477.00 ±145%     -99.7%       1.50 ±142%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      9.33 ± 71%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      6.00 ±100%     -47.2%       3.17 ± 64%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.33 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      6.83 ±223%     -68.3%       2.17 ±223%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +4.7e+102%       4.67 ±149%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.50 ± 73%      +4.8%       3.67 ± 56%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    208.00 ± 73%      +8.7%     226.00 ± 54%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     77040 ± 84%    +290.0%     300458 ± 28%  perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   1428129 ± 83%      +8.9%    1554630 ± 21%  perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    377.83 ± 71%     -10.5%     338.17 ± 26%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
      4.83 ±100%    -100.0%       0.00        perf-sched.wait_and_delay.count.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00         +1e+102%       1.00 ±223%  perf-sched.wait_and_delay.count.wait_for_partner.fifo_open.do_dentry_open.do_open
    660.33 ± 71%     -46.6%     352.33 ± 26%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
      5.69 ±223%   +1786.2%     107.37 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     38.51 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     38.99 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1688 ±153%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     42.49 ±223%    +355.4%     193.51 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
    833.48 ± 71%    +114.3%       1785 ± 39%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1137 ±223%     +45.7%       1657 ± 72%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2109 ± 72%    +149.7%       5266 ± 21%  perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
    140.82 ±223%     +50.7%     212.22 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +2.9e+102%       2.90 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__put_user_4
     63.53 ±223%    +281.0%     242.03 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      5.59 ±165%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00       +5.3e+102%       5.32 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +6.8e+102%       6.81 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00       +4.1e+104%     412.86 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
    469.71 ±159%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      2.14 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      1257 ±115%     -61.7%     481.03 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.16 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.00       +2.7e+102%       2.74 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
     15.68 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    610.19 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00       +2.3e+104%     230.51 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
    551.38 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      2935 ± 91%     -67.2%     962.97 ± 55%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      2.84 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
     25.17 ±223%     -65.0%       8.80 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     26.19 ±223%    +367.4%     122.42 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    534.68 ±223%     -29.1%     379.11 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
    133.51 ±155%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00       +1.4e+105%       1442 ±105%  perf-sched.wait_and_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    672.17 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
     17.52 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    578.84 ±204%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    834.50 ±223%     +19.9%       1000 ±152%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1329 ±141%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1500 ±142%     -44.5%     833.60 ±128%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2325 ± 74%     +33.1%       3094 ± 55%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1211 ±127%     +95.7%       2369 ± 65%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    266.22 ±135%    +472.7%       1524 ± 37%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00       +1.6e+104%     164.50 ±123%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2440 ± 76%     +43.1%       3491 ± 26%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      4626 ± 72%     +71.9%       7951 ± 11%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     53.25 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2977 ± 71%     +40.5%       4183 ± 32%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    203.83 ±223%    +462.6%       1146 ±144%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
    720.60 ±204%     -53.7%     333.35 ±141%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2651 ± 70%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      2249 ±100%     -45.9%       1217 ±107%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     30.16 ±223%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
     39.33 ±223%    +708.9%     318.16 ±223%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.00       +7.6e+104%     757.56 ±219%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2940 ± 72%     -40.0%       1763 ± 51%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      2407 ± 85%     +15.5%       2779 ± 62%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1636 ± 72%    +119.1%       3585 ± 21%  perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      4470 ± 73%     +62.2%       7252 ± 15%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3296 ± 72%     +54.2%       5084 ± 25%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      2025 ±155%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00       +9.2e+102%       9.20 ±223%  perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3621 ± 75%     +57.4%       5702 ± 29%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork
      0.00       +1.3e+102%       1.32 ±217%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00        +8.2e+99%       0.01 ±192%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      1.75 ±176%    +197.3%       5.20 ±168%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.10 ± 88%   +1050.8%       1.19 ±128%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00        +2.8e+99%       0.00 ±150%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +5.1e+100%       0.05 ±211%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.allocate_slab.___slab_alloc.constprop
      0.00       +1.4e+100%       0.01 ±187%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.00        +7.2e+99%       0.01 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00 ±223%    +241.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +2.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.01 ±205%    +139.4%       0.03 ±159%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00 ±223%   +1533.3%       0.02 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00       +9.2e+100%       0.09 ±220%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.00       +7.2e+100%       0.07 ±144%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.01 ±159%    +216.3%       0.03 ±160%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      0.31 ±203%    +107.2%       0.63 ± 61%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.01 ±223%    +435.7%       0.04 ±130%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +4.8e+100%       0.05 ±110%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.03 ±150%   +4450.9%       1.28 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.00       +7.5e+101%       0.75 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.perf_read.vfs_read
      0.00        +5.8e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±155%     -85.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.00        +8.3e+99%       0.01 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
     12.25 ±223%     -90.9%       1.12 ±164%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     13.08 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.01 ± 90%    +591.6%       0.10 ±198%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      3.12 ± 83%     +95.9%       6.11 ± 33%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.01 ±121%   +4656.4%       0.31 ± 97%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00 ±223%      -8.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.02 ±134%     +44.2%       0.02 ±208%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
      1.82 ±188%   +1329.6%      26.06 ±221%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     10.78 ± 71%     +87.5%      20.20 ± 28%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.51 ±126%    +273.9%       9.37 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      9.23 ± 80%    +266.9%      33.88 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.01 ±113%     -29.7%       0.01 ±185%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.00       +8.8e+100%       0.09 ±201%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.03 ±146%   +1393.6%       0.43 ±191%  perf-sched.wait_time.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.01 ±223%     -31.3%       0.01 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.count.constprop.0.isra
      0.02 ±183%      +0.0%       0.02 ±114%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
      2.48 ±208%    +682.0%      19.39 ±218%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +3.3e+100%       0.03 ±206%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.8e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.00 ±223%     +80.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.76 ±136%      -4.4%       0.73 ±152%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00       +1.3e+100%       0.01 ±160%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.01 ±148%   +2426.7%       0.13 ±123%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      0.81 ±216%    +113.9%       1.74 ±119%  perf-sched.wait_time.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.08 ±102%    +344.9%       0.36 ±139%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.05 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+102%       1.08 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.00       +1.3e+100%       0.01 ±194%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.00       +1.3e+100%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00       +9.5e+101%       0.95 ±215%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00        +5.3e+99%       0.01 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.rmap_walk_anon.migrate_pages_batch.migrate_pages
      0.00 ±141%    +505.3%       0.02 ±139%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00 ±223%    +742.9%       0.01 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00        +4.5e+99%       0.00 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00       +1.3e+100%       0.01 ±206%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.00          +1e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +2.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.00 ±223%   +1214.3%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
      1.65 ±210%   +1257.8%      22.37 ±219%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +4.1e+101%       0.41 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.01 ±127%   +8574.0%       1.11 ±204%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.62 ±204%     -76.7%       0.14 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.04 ±109%    +847.7%       0.37 ±125%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%     +75.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.00       +2.7e+100%       0.03 ±201%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +1.3e+100%       0.01 ±199%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00       +1.3e+100%       0.01 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.04 ±170%   +1780.0%       0.69 ± 98%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00        +9.8e+99%       0.01 ±178%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.00 ±150%   +1575.0%       0.06 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00         +1e+100%       0.01 ±197%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00        +5.8e+99%       0.01 ±159%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.00       +1.3e+100%       0.01 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +2.6e+100%       0.03 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.34 ±174%     -87.1%       0.04 ±148%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      4.88 ±186%     -88.0%       0.59 ±159%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00        +1.2e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.dcache_dir_close.__fput.task_work_run
      0.00        +6.7e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.01 ±159%     -11.4%       0.01 ±121%  perf-sched.wait_time.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.19 ±121%     -65.4%       0.06 ± 96%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +4.1e+100%       0.04 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
      0.06 ±160%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00 ±141%    +790.5%       0.03 ± 82%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00 ±223%   +1133.3%       0.02 ±175%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%   +3008.3%       0.06 ±137%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.01 ±159%    +923.7%       0.06 ±103%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.27 ±130%  +16951.2%      46.10 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.18 ±200%     -69.8%       0.06 ±175%  perf-sched.wait_time.avg.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.7e+100%       0.02 ±165%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.00 ±223%   +2635.7%       0.06 ±162%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
     38.16 ±176%     -95.0%       1.90 ± 93%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.01 ±142%    +438.7%       0.07 ± 72%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%   +1166.7%       0.03 ±206%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +9.5e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.alloc_pid.copy_process.kernel_clone
      0.00       +7.3e+101%       0.73 ±218%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +1.1e+100%       0.01 ±127%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.00 ±223%    +528.0%       0.03 ± 80%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.00       +2.8e+100%       0.03 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00        +8.8e+99%       0.01 ±194%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00        +3.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.05 ±223%     -98.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.01 ±147%    +500.0%       0.03 ±178%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00 ±223%   +1525.0%       0.03 ±110%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.05 ±188%    +129.7%       0.12 ±204%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +3.7e+100%       0.04 ±178%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.01 ±223%   +8138.7%       0.43 ±198%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.03 ±205%    +136.9%       0.06 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      1.07 ±223%     -99.4%       0.01 ±190%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.00        +8.5e+99%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00          +1e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      4.68 ± 97%     +60.4%       7.51 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.08 ±198%     -96.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00       +1.8e+100%       0.02 ±131%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±182%     -18.5%       0.01 ±158%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.00        +2.5e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.02 ±223%     -61.2%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      1.19 ±215%     -88.4%       0.14 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.01 ±170%     +12.2%       0.01 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.04 ±106%     -55.4%       0.02 ±136%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.00        +1.8e+99%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.kernfs_fop_open.do_dentry_open.do_open
      0.00       +3.4e+101%       0.34 ±222%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.kernfs_seq_start.seq_read_iter.vfs_read
      0.15 ±180%    +384.4%       0.71 ±101%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.00       +4.3e+100%       0.04 ±183%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.02 ±194%     -88.6%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
      3.86 ±175%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00          +3e+99%       0.00 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00        +8.3e+98%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00         +4e+100%       0.04 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
      2.07 ±148%    +130.3%       4.76 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±143%      +6.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.01 ±151%    +402.7%       0.06 ±155%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±150%     +73.0%       0.01 ±117%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
      0.51 ±198%     +57.8%       0.81 ±189%  perf-sched.wait_time.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.03 ±136%  +3.5e+05%     116.55 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.14 ±127%     -98.8%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
    183.86 ±223%    -100.0%       0.01 ±173%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.14 ± 98%     -25.4%       0.10 ±130%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.01 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
     19.20 ±123%     +64.1%      31.52 ± 26%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.00       +4.5e+100%       0.04 ± 93%  perf-sched.wait_time.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      2.85 ±222%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±179%  +52754.5%       0.97 ±153%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.04 ±206%     -63.1%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%     +72.7%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.02 ±144%      +4.3%       0.02 ±184%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      1.74 ±200%    +460.9%       9.78 ±148%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      3.51 ±165%     +69.9%       5.96 ± 27%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      5.37 ±137%     -81.3%       1.01 ±143%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00        +7.7e+99%       0.01 ±163%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00        +5.8e+99%       0.01 ±175%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.02 ±223%     -86.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.02 ±112%     +65.5%       0.04 ±134%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.02 ±156%   +1404.1%       0.24 ±150%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.00       +1.7e+100%       0.02 ±202%  perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.90 ± 92%    +271.3%      10.76 ± 65%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.15 ±143%    +248.7%       0.51 ±175%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    337.00 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.03 ±142%    +116.0%       0.07 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     19.42 ±210%     -91.2%       1.71 ±201%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    416.63 ±223%     +20.1%     500.33 ±152%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     66.63 ±213%     -99.2%       0.50 ±141%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    750.42 ±142%     -37.1%     472.35 ±116%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      8.83 ± 87%    +354.0%      40.10 ± 36%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      5.34 ±109%    +649.1%      39.99 ± 39%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.32 ±109%     -65.3%       0.11 ± 73%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      4.83 ± 71%    +480.5%      28.03 ± 21%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.78 ±104%   +1138.9%       9.62 ± 77%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     14.85 ± 82%    +111.8%      31.46 ± 24%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.53 ± 79%    +212.5%       4.79 ± 14%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00       +1.3e+100%       0.01 ±145%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
      3.26 ± 86%    -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
    117.93 ±116%     -63.5%      43.09 ± 66%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     32.77 ±210%     -18.3%      26.76 ± 99%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
      5.48 ± 89%   +1270.2%      75.07 ±142%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    193.46 ± 71%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    203.12 ± 99%     +81.1%     367.80 ± 92%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±223%   +4810.7%       0.61 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
     15.30 ±219%     -98.8%       0.18 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.13 ±133%     +93.3%       0.25 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      2.14 ±127%    +540.9%      13.74 ±218%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.12 ±145%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      0.01 ±142%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.87 ±131%   +9438.8%      82.89 ±201%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    887.78 ± 73%     -19.3%     716.68 ± 61%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.76 ±219%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     10.49 ± 72%     +77.2%      18.60 ± 38%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     14.29 ± 72%     +59.2%      22.75 ± 21%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2.82 ± 78%    +174.5%       7.75 ± 18%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    633.11 ± 79%      -6.3%     593.03 ± 18%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
     66.39 ±213%     -99.7%       0.20 ±188%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ±144%   +1518.9%       0.14 ±165%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    302.32 ± 71%    +104.2%     617.40 ± 17%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork
      0.00       +2.6e+102%       2.63 ±217%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      0.00        +8.2e+99%       0.01 ±192%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
     16.86 ±104%    +999.7%     185.45 ±115%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.82 ±110%    +649.0%       6.11 ±122%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.00        +2.8e+99%       0.00 ±150%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__get_free_pages.pgd_alloc.mm_init
      0.00       +5.1e+100%       0.05 ±211%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.__handle_mm_fault.handle_mm_fault
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__pmd_alloc.move_page_tables.shift_arg_pages
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.allocate_slab.___slab_alloc.constprop
      0.00       +1.4e+100%       0.01 ±187%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.__handle_mm_fault
      0.00        +7.2e+99%       0.01 ±145%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.get_zeroed_page.__pud_alloc.alloc_new_pud
      0.00 ±223%    +241.7%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_cow_fault
      0.00        +2.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__do_fault.do_read_fault
      0.01 ±205%    +163.4%       0.03 ±147%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.do_anonymous_page
      0.00 ±223%   +1533.3%       0.02 ±141%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.__pte_alloc.move_page_tables
      0.00       +1.8e+101%       0.18 ±221%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pte_alloc_one.do_read_fault.do_fault
      0.00       +7.2e+100%       0.07 ±144%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.01 ±159%    +226.5%       0.03 ±154%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_cow_fault.do_fault.__handle_mm_fault
      9.21 ±222%     -18.6%       7.50 ± 73%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      0.01 ±223%    +540.5%       0.04 ±118%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.00       +5.3e+100%       0.05 ±101%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.05 ±156%   +3296.0%       1.82 ±144%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.00       +1.5e+102%       1.45 ±222%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.load_elf_phdrs.load_elf_binary
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.perf_read.vfs_read
      0.00        +5.8e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.security_prepare_creds.prepare_creds
      0.01 ±155%     -85.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__sched_setaffinity
      0.00       +1.3e+100%       0.01 ±194%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.alloc_cpumask_var_node.__x64_sys_sched_setaffinity
     38.36 ±223%     -97.0%       1.13 ±161%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     38.82 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.02 ±106%   +1879.8%       0.34 ±216%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      1525 ± 80%     +38.2%       2108 ± 28%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.alloc_bprm.do_execveat_common
      0.01 ±137%  +14876.5%       1.70 ±134%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.perf_event_mmap_event.perf_event_mmap
      0.00 ±223%      -8.3%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.proc_pid_readlink.vfs_readlink
      0.02 ±132%    +111.5%       0.03 ±213%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.task_numa_work.task_work_run
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.vmstat_start.seq_read_iter
     47.35 ±196%    +311.6%     194.92 ±221%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
    833.48 ± 71%    +114.3%       1785 ± 39%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    697.80 ±174%    +103.1%       1417 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1558 ± 73%     +75.1%       2728 ± 20%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.02 ±141%     -41.8%       0.01 ±198%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.change_prot_numa
      0.00       +9.2e+100%       0.09 ±192%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.change_p4d_range.change_protection_range.mprotect_fixup
      0.04 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.07 ±187%   +2290.9%       1.57 ±210%  perf-sched.wait_time.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.01 ±223%     +17.9%       0.01 ±124%  perf-sched.wait_time.max.ms.__cond_resched.count.constprop.0.isra
      0.05 ±194%     -48.2%       0.03 ±126%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.__fput.task_work_run
     76.96 ±212%     +40.5%     108.11 ±219%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.proc_invalidate_siblings_dcache.release_task
      0.00       +3.5e+100%       0.04 ±194%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.link_path_walk
      0.00        +5.8e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.step_into.path_lookupat
      0.00 ±223%     +80.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      9.34 ±153%     -48.1%       4.84 ±129%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.[unknown]
      0.00       +1.3e+100%       0.01 ±160%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_user
      0.01 ±160%   +2059.0%       0.14 ±110%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.copyout
      1.16 ±201%   +5273.2%      62.29 ±137%  perf-sched.wait_time.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.fault_in_readable
      0.25 ±111%    +386.7%       1.24 ±170%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      0.05 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+102%       1.08 ±222%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.do_group_exit
      0.00       +2.4e+100%       0.02 ±206%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      0.00       +2.4e+100%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_dop_revalidate.lookup_fast.walk_component
      0.00       +1.1e+102%       1.15 ±216%  perf-sched.wait_time.max.ms.__cond_resched.down_read.kernfs_iop_permission.inode_permission.link_path_walk
      0.00        +5.3e+99%       0.01 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.rmap_walk_anon.migrate_pages_batch.migrate_pages
      0.00 ±141%   +1205.3%       0.04 ±123%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.00 ±223%   +1028.6%       0.01 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.00        +4.5e+99%       0.00 ±158%  perf-sched.wait_time.max.ms.__cond_resched.down_read_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__sock_release.sock_close.__fput
      0.00       +1.8e+100%       0.02 ±211%  perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_clone.__split_vma.mprotect_fixup
      0.00          +2e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.__do_sys_brk.do_syscall_64
      0.00        +2.3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.load_elf_interp
      0.00          +1e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_brk_flags.vm_brk_flags.set_brk
      0.00        +2.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00        +1.7e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.00 ±223%   +1214.3%       0.02 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.exit_mmap.__mmput.exit_mm
     33.89 ±214%    +622.5%     244.81 ±220%  perf-sched.wait_time.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.__mmput
      0.00       +4.1e+101%       0.41 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.01 ±116%  +22596.5%       3.25 ±208%  perf-sched.wait_time.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      1.93 ±197%     -81.5%       0.36 ± 58%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.18 ±110%    +665.9%       1.40 ±145%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.exit_mmap
      0.00 ±223%     +75.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_file_vma.free_pgtables.unmap_region
      0.00       +2.7e+100%       0.03 ±201%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.do_vmi_align_munmap
      0.00       +2.3e+100%       0.02 ±208%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_prepare.__split_vma.mprotect_fixup
      0.00        +1.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00       +1.3e+100%       0.01 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.07 ±178%   +6706.2%       4.76 ± 85%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00        +9.8e+99%       0.01 ±178%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.search_binary_handler
      0.00 ±150%   +2935.0%       0.10 ±117%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00       +1.1e+100%       0.01 ±200%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00          +9e+99%       0.01 ±178%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_binary
      0.00       +1.4e+100%       0.01 ±141%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_map.load_elf_interp
      0.00       +2.6e+100%       0.03 ±145%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.63 ±136%     -89.2%       0.07 ±128%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      5.59 ±164%     -74.8%       1.41 ±130%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.00        +1.2e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.dcache_dir_close.__fput.task_work_run
      0.00        +6.7e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.nd_jump_root.pick_link.step_into
      0.01 ±159%     -11.4%       0.01 ±121%  perf-sched.wait_time.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.52 ±136%     -74.8%       0.13 ±141%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.exit_fs.do_exit
      0.00       +4.1e+100%       0.04 ±145%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
      0.07 ±171%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.proc_invalidate_siblings_dcache.release_task.wait_task_zombie
      0.00 ±141%   +1354.2%       0.06 ± 92%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00 ±223%   +1133.3%       0.02 ±175%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%   +3100.0%       0.06 ±132%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.01 ±185%   +1522.5%       0.19 ±130%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      4.88 ±170%   +8376.3%     413.99 ±222%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.19 ±193%     -58.5%       0.08 ±172%  perf-sched.wait_time.max.ms.__cond_resched.exit_signals.do_exit.do_group_exit.__x64_sys_exit_group
      0.00       +1.7e+100%       0.02 ±165%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.load_elf_phdrs.load_elf_binary
      0.00 ±223%   +4121.4%       0.10 ±161%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00        +1.3e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
    493.62 ±149%     -68.4%     155.79 ± 62%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.vfs_write
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork
      0.02 ±155%    +791.4%       0.16 ± 89%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat
      0.00 ±223%   +1166.7%       0.03 ±206%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault
      0.00        +9.5e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.__anon_vma_prepare.do_cow_fault.do_fault
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.alloc_pid.copy_process.kernel_clone
      0.00       +7.3e+101%       0.73 ±217%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00       +1.1e+100%       0.01 ±127%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.expand_downwards
      0.00 ±223%    +892.0%       0.04 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.mmap_region
      0.00       +2.8e+100%       0.03 ±142%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_expand
      0.00        +8.8e+99%       0.01 ±194%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.vma_link
      0.00        +3.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mm_alloc.alloc_bprm.do_execveat_common
      0.05 ±223%     -98.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.prepare_creds.prepare_exec_creds.bprm_execve
      0.01 ±147%    +578.1%       0.04 ±158%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_file
      0.00 ±223%   +2125.0%       0.04 ±127%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.__install_special_mapping.map_vdso
      0.06 ±170%    +106.5%       0.12 ±204%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.alloc_bprm.do_execveat_common
      0.00       +3.7e+100%       0.04 ±178%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.01 ±223%  +22196.8%       1.15 ±211%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      0.03 ±205%    +261.8%       0.09 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.do_vmi_align_munmap
      2.14 ±223%     -99.7%       0.01 ±190%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.mprotect_fixup
      0.00        +8.5e+99%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00          +1e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk.mas_alloc_nodes.mas_preallocate.mmap_region
      1396 ± 83%     +28.7%       1796 ± 49%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.15 ±208%     -97.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      0.00       +1.8e+100%       0.02 ±131%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±182%      -5.6%       0.01 ±146%  perf-sched.wait_time.max.ms.__cond_resched.mmput.exit_mm.do_exit.do_group_exit
      0.00        +2.5e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.filename_create.do_mkdirat.__x64_sys_mkdir
      0.02 ±223%     -61.2%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.move_page_tables.shift_arg_pages.setup_arg_pages.load_elf_binary
      1.19 ±215%     -66.4%       0.40 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.01 ±170%     +12.2%       0.01 ±179%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.06 ±118%     -38.4%       0.04 ±155%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.00        +1.8e+99%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.kernfs_fop_open.do_dentry_open.do_open
      0.00       +3.4e+101%       0.34 ±222%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.kernfs_seq_start.seq_read_iter.vfs_read
      0.80 ±188%    +318.9%       3.36 ± 90%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.00       +4.3e+100%       0.04 ±183%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.02 ±194%     -87.9%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_for_each_child._perf_ioctl.perf_ioctl
     18.35 ±187%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00          +3e+99%       0.00 ±142%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_read.vfs_read.ksys_read
      0.00        +8.3e+98%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.00         +4e+100%       0.04 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.seq_read_iter.vfs_read.ksys_read
    591.36 ±193%     +93.2%       1142 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.00 ±143%      +6.3%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.uprobe_clear_state.__mmput.exit_mm
      0.03 ±183%    +353.7%       0.13 ±139%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.01 ±150%    +154.1%       0.02 ±123%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.mm_init.alloc_bprm
     16.54 ±219%     -68.0%       5.30 ±200%  perf-sched.wait_time.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.mmap_region
      0.06 ±139%  +1.9e+05%     116.57 ±223%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
      0.80 ±149%     -99.6%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
    551.45 ±223%    -100.0%       0.04 ±213%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      0.16 ±112%     +85.8%       0.30 ±187%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.02 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache.release_task
      1623 ± 83%     -65.9%     554.21 ± 45%  perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.00       +4.7e+100%       0.05 ± 87%  perf-sched.wait_time.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      2.85 ±222%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ±141%  +3.3e+05%       9.32 ±159%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.07 ±214%     -53.3%       0.03 ±223%  perf-sched.wait_time.max.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±223%    +118.2%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.task_numa_work.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.03 ±132%     -13.0%       0.02 ±184%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
     14.66 ±207%    +943.0%     152.95 ±170%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
    603.73 ±193%     +28.1%     773.60 ± 48%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     89.38 ±137%     -94.5%       4.90 ±114%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.00        +7.7e+99%       0.01 ±163%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.00        +9.2e+99%       0.01 ±191%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.02 ±223%     -76.5%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.try_to_migrate_one.rmap_walk_anon.try_to_migrate.migrate_folio_unmap
      0.03 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.04 ±128%     +27.6%       0.05 ±130%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.02 ±156%   +2047.4%       0.35 ±100%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.00       +1.7e+100%       0.02 ±202%  perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
    341.18 ± 98%    +235.3%       1143 ± 61%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.55 ±187%    +214.0%       4.87 ±204%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    671.72 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      0.05 ±132%    +162.4%       0.13 ± 94%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    583.27 ±202%     -92.4%      44.37 ±206%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    833.26 ±223%     +20.1%       1000 ±152%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    639.01 ±221%     -99.8%       1.01 ±141%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1500 ±142%     -44.5%     833.59 ±128%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1760 ± 84%     +14.5%       2015 ± 65%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1182 ±132%     +18.8%       1405 ± 47%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      8.72 ±128%     -85.1%       1.30 ± 99%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    137.80 ±100%    +730.4%       1144 ± 29%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    168.53 ±196%     +41.5%     238.45 ± 85%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1459 ± 71%     +67.2%       2440 ± 22%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2351 ± 72%     +72.3%       4052 ± 12%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00       +1.5e+100%       0.02 ±142%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
    165.52 ± 92%    -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      2976 ± 71%     +18.5%       3528 ± 36%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    118.33 ±219%    +440.4%     639.48 ±131%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      1554 ±113%     -78.6%     333.42 ±141%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2651 ± 70%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      2251 ± 99%     -48.2%       1166 ±115%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 ±223%   +4403.5%       1.07 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
     30.58 ±219%     -99.4%       0.18 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.rmap_walk_anon
      0.22 ±152%     +16.8%       0.25 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
     54.85 ±156%    +197.4%     163.12 ±222%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.21 ±152%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma
      0.03 ±144%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      9.24 ±183%   +8372.4%     782.92 ±211%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2856 ± 71%     -38.3%       1763 ± 51%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.76 ±219%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      1254 ± 85%     +18.4%       1485 ± 56%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    909.09 ± 75%    +117.4%       1975 ± 18%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2263 ± 73%     +61.6%       3656 ± 15%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3154 ± 71%     +61.2%       5084 ± 25%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
    699.58 ±221%     -99.9%       0.41 ±188%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.05 ±150%    +990.2%       0.54 ±174%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3056 ± 70%     +63.8%       5007 ± 21%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork

--JtH+0i4DenAC9eAc--
