Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325964C8E
	for <oe-lkp@lists.linux.dev>; Mon, 23 Oct 2023 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i630DfRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698043686; x=1729579686;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NRj/IteJ7eEJ7tyy/APyp/SLYoDxCOoWdSNL7eckVlI=;
  b=i630DfRt3wsD48b554QYx1RYi5dh+S/3A2hX7Yj7jLBRp0h3qxGwmdeE
   Aj3eTjUm0fL9dCMnu57vLcnGlIocxOmbLp1U+b2IvURLWEOxFW18X+CmQ
   2Ap5zprLzxoWembJyvT7eRDW4Twzg0NLScLrBEYtId9tRczqw+jq0AsAx
   7TsdvpOOGt97xYy+qZsFKSCMc5SjK7sMOgfVOiST2iEKLAx8SRWCy7R4G
   ZwDBVBAhTyo3kBuJx8AIVEk9lCQosE7rGMqXqEqAx39f1HiLlAazLGe/T
   IjqUWtRv1Mg4nxYyh5OzRxXE1c+CWnFNh+oobD3K/DBaotxH3DeWGprAy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="5400446"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5400446"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 23:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="761648387"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="761648387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Oct 2023 23:48:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 23:48:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 22 Oct 2023 23:48:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 22 Oct 2023 23:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7LwIEz5qlD7XEFt58oPAL7Rd6blevs2DyICfDfDnZ++7MUDA1CduSuNQMsIqRenaghCZb/Rhhv/hO4tTcirur8AtUOGOqLppDmhsfLByCh3LbOFABAGZMn02mlbqKO11HdZ/+BLo3DZL2w8L/BJpt+/5y/4BnfTeZKNB/j1KuV4iLJKpSGYGcqVRRTHbqOnW7hlN1ZeaCwnA3U8lSM2sCJNnU8ZKhIy6StG8lkDgzDwZcFS9uoYAss9dU6VF6YtST7UuYQoU7q1hqI2Moy45ib6hxTBZTYINSp3DZAmuT8mJy7Qu3Vn/uQXk7dk0GFAhrhDjdZFW/6Xh3bk2LjV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD4H0Zv1DCGgV+TH/acuyFWhyjFWslQ8OdUCO31l+ko=;
 b=UgsyQ057dZWGrKV4DV82vt7JuE9zBggoZH/E+tWFnj4rRMFPSFvX6LNkKEK2dsIQ0BVz8RtToHXyVWkXvIdDlflEJrbeQeV6nnZ0I1UqbJ3TpZI5s7FEOOVXqOs3cCyTjbaJboz+5MPwNzGiMM6DKLKtuWlBxe2MtSMqJW8k0PwBsAVX1c4fSJnlvSmeWb48sOWuRxMhtTVMwXxDHdvkUn3e6w6HJhvQ73MEpR/iDXLHkdcm5S65X9WXrEN+KkQtJ/d1wKIZvtUGzUTuZadwXZmT3DBatrKtgb/hFa8viGWyVypwFsqKxHwdIZ9ChrORHcSjxuHMEXnoKD452O4ITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Mon, 23 Oct
 2023 06:48:02 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Mon, 23 Oct 2023
 06:48:02 +0000
Date: Mon, 23 Oct 2023 14:47:57 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: Re: [jimc:dd-kitchen-sink] [dyndbg] 64261c3ad0:
 BUG:TASK_stack_guard_page_was_hit_at#(stack_is#..#)
Message-ID: <ZTYXHc8pj2Kf3C9K@xsang-OptiPlex-9020>
References: <202310202332.2a4dcca1-oliver.sang@intel.com>
 <CAJfuBxy=Lb+SSYyu6LADFbBDxf6Ei5EsGL2bGxXtMC=qto+w2g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxy=Lb+SSYyu6LADFbBDxf6Ei5EsGL2bGxXtMC=qto+w2g@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ade18f-9283-47f1-28ec-08dbd3940064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZ8eSSXef33+NA8y1HZJeLcnmOU4iKz73kyeyx9PCwhXn8SsIAMNOJqvnpfefol0ttfoVHfair/ytM93B5KGrGZhM35RzsvEosGA2ikRu0Cue86xppyRbek/dTIBJsQxPww0oT9a0pzk6xoe1cc9q/jzJfvoM4KOmv3i7IedmmXmEgftYlW35zblr9QPHuN+88txBWseKNWkeDRb7cVL4vknSccw5w+ZdWJEws3tggbX9W3olcVoyt/Sq20RDj21sUPjdCqTbvE9S73bWU4jbYjUmxGU1W7Xy6M77OsHyVXUmjRqriwKMsr1vjaqAb0rrxdQbsx1rHwzaKZbNn0DeNgmtybWMd07/igf/PKnBfIMk05Ltt89Iwy0Z9r/3uxKAHcZ6NW6ibCctSzhanligtZpu3UYbWfosLjDNB7MTXxuE9kBGCdHl+P/jf7ebQafgARwMMUdkmC+Diwgl7pZTBbqxMPlB9KVHKc3y8GugDK19OAP90R4DZvT5nRgn7X9P9/aKIyJcr8jVG07QmpmKzwHaLEaRkayfBWk0u3GRg8mJQ8gi2rnIWRKIY5T2dZ9CJE4seV4lm9qZzoCfaFGbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(6666004)(6506007)(53546011)(9686003)(44832011)(66946007)(66476007)(6916009)(316002)(478600001)(66556008)(5660300002)(4326008)(8936002)(8676002)(966005)(6486002)(107886003)(41300700001)(30864003)(2906002)(82960400001)(38100700002)(83380400001)(26005)(33716001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01XSGVVNVlIYzNoTXdPWjVMZWVNV0NwY2pTMGptY3pWcXpsNEJvVkdRQ21s?=
 =?utf-8?B?QXBjZWE0WHN6bE8yU3YrcGg3T0xnL2NmVFkvNmJJeDdUQXlGaXVyR29COFQ5?=
 =?utf-8?B?eHB1WVlzSXFYbEJJZFNNTE1NUGFqRXNXVFh2YWR4eXNoV0RsTCtkek00cVM4?=
 =?utf-8?B?eUd6SXEvUFMwTk0reWJoTmtyM0RpTDYzazlRdTJBaWJIVm55VTZsUUxZcjdI?=
 =?utf-8?B?WU9VZ0dXTGh3TExnajdseEo0M3UrWUlXTG5DQWUyakJTMUdDSEd3QWdoWVY4?=
 =?utf-8?B?QWZNdzFiSHQ3czJnMWx6STFXMTFBOGFTTlhDem1HL1JYRGc5eDI4SHl1UmM4?=
 =?utf-8?B?Z1ZzUjJmcHV1ZHYyR0NhSFNCTGlDQkVObUszc1FRd3BySEFVNEkwZXAxUGdN?=
 =?utf-8?B?TGlHRzZON082WTlSWkxJdHNiNkpQcmZYdUpTVHFLZkFiVUpYQzEwckttbHFS?=
 =?utf-8?B?ZlhMOVlURFZ2T3UvWUxURjJCZE9CaTVSTjVveTFqcmh2c2hXTENBbXNncktS?=
 =?utf-8?B?bFhXOTZtOXdzNkRqb1diN2JJNWp4dFJGWHZVdTloaDY3K3Rmb2tKeGdncnYy?=
 =?utf-8?B?eHFiSGF5aTFjTHNKODZrOVpKdlpoZTg4NW90bjlaSE13eXlzZnpYcmhQcGNz?=
 =?utf-8?B?bys5NXZ5OUh5SER2K1VwbmllZVc4a2o2MjhFMFlobFgrWVdwaXZYQ2FCOHc5?=
 =?utf-8?B?Y2hMcU1MVkRhQ0ZlbUdlUS83aFh5dVllWFRTSVZKSGk4MjlDeDVSclJ1NmZH?=
 =?utf-8?B?dTc0TXJLeVQyMi9XaEdvaUJBd0Y1SkdVRUNtR3VYdTJadmFlV3A0cFBvWVlZ?=
 =?utf-8?B?MHNmWitoNHJLZVNIUmVMaGd3bDR2VE1obnVIWm5vNUlaUndGcS9ldExHZlFF?=
 =?utf-8?B?cm9xNlYzaCtQQlJwYis5a3JKMng4MTlLVDJmdExUcmt3amFWOC9jQUJsVUlT?=
 =?utf-8?B?MW1xMFRoYmo3bTZwR2psODBuTGFZNVYxOVFrNmJ0L2hvV1BzNjMvSlN1aitN?=
 =?utf-8?B?QjRQMWloamxZUXNGL3Vpc2s3dVBKYVc1NmdlWFNUaHF3WWo1OGwwbjVTdGN0?=
 =?utf-8?B?TUNuaXlOVTB6KzB1Uk0zZFRKVU5QMnJrSi9wMTJhMmIrTG9XWm9uRUJ1K2FZ?=
 =?utf-8?B?c1p3VENUaUlTZkZta21RdEVvQlk5dTk0UVlYaVVOYlFKbGgxQ2UvV1lFMzhn?=
 =?utf-8?B?OHI3Qms2V2pSR1FjeFdGQ01XUlRXcFR3RkQrZW1iY0JEMjNsc0loMGZrL1RQ?=
 =?utf-8?B?M0MvbWxFaGJ4ZEVoc3l4dndTY210QW5OVlVYUHQvNzBlNFpOb0J3YWIvdW9R?=
 =?utf-8?B?YTdGR0dFRGY2US9mSHRPSzV5bng2dkJYcHdQRG1vdHJ1VmNGU0hJQU0xbDNu?=
 =?utf-8?B?RzRQUi9uczdhQjdGcFZ5SmtBV1hDTUdQcFA0SVhRMk0wQklhODg5dXV5L3Bj?=
 =?utf-8?B?WldmM0NveTNYK29VOVFUaFRCNEFJVnRlOGRQQjhuSFlzeWxINk1sNWNEZmJu?=
 =?utf-8?B?VVQ5SkxvaVB3cGU1NDVqRmh4TGxsdGppaWYrcGc0Mlo5NDBYdldmNmhlRWhZ?=
 =?utf-8?B?d0dnYjVzQ2NGRUVza2VpQTA3dXE3TWJ2R3ZyRXdPZE5qVDBOVWhDdVhHL0tO?=
 =?utf-8?B?OTRzb3BQRGRpSVdpakp0SGJQekRqaEFVTE1XUlNVK0wyY1o1WHhxUlY4TWRK?=
 =?utf-8?B?SjkveWZjaEl2U0NDMkNTSTRzK3NhRTQ5V1dIUVdxa0pIbUFuYmg3UUlELzFG?=
 =?utf-8?B?aVFiMkZBSTRmcDVQRkZOR2JTc3Yvb3JWcWIwTk56SElOK0dMeVRZYVNQSGpp?=
 =?utf-8?B?OWwwTGxEcWU3YWllb1c2ZVd1d2gzSm04WVk4a3VCWjVNTHprQzdwRTVpZldu?=
 =?utf-8?B?UnE4c0dsVDRUem8rZXhKbTgwSFVnUlV5ZXlGaEtyZzRoYk9YRHFvNEtFMU8z?=
 =?utf-8?B?d3k1aGFtYUZ5aHJZTC9ITC8zNzhneVpuQ3g3Wlp1Q0FOaHRYQllhN3c2VktZ?=
 =?utf-8?B?dzRvWHREcklXYm5Zb3M2UUh5c3dUVjB1VlNwdmt0eWVxSy9ValoxT1FhSy9U?=
 =?utf-8?B?V09TVEUyOGxpem82ZzBhbnZIamdlVWdCOXdFVjFzT2toRldNTzEyRTc5Mk1u?=
 =?utf-8?Q?u7cX14uXvdiV4aVwcvzV6rnkl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ade18f-9283-47f1-28ec-08dbd3940064
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 06:48:01.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydVqXnJS/gMHOwx9P+hvIQOemVX/MTTDln+vqwydMvGs4mvHyBOTWAyxfktK/rnTJlDLmzyEFYEO2skh9Sl3QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com

hi Jim Cromie,

On Sat, Oct 21, 2023 at 06:55:38PM -0600, jim.cromie@gmail.com wrote:
> hi Oliver, etal,
> 
> thanks for the report - Im looking...
> I noticed in the dmesg.xz this fragment:
> [  346.798552][ T3580] LTP: starting dynamic_debug01 (dynamic_debug01.sh)
> 
> I checked the lkp-test repo, I didnt find that script.
> is it available ?  it'd be handy to consult.

this is the file from ltp testsuite. repo is:
https://github.com/linux-test-project/ltp.git

./testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh

> 
> other than that, the last patch is very new, and highly suspect for this trace.
> HEAD~1 shouldnt leak, since any ptr vals stored in the tree ref to me thats
> either builtin, or managed at module-load.

if there is new patch or new branch you want us to test, please let us know.
Thanks!

> 
> 
> 
> 
> 
> 
> On Fri, Oct 20, 2023 at 9:17 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed "BUG:TASK_stack_guard_page_was_hit_at#(stack_is#..#)" on:
> >
> > commit: 64261c3ad071780c4b9455ebf4767f105ddc2b79 ("dyndbg: cache the dynamically generated prefixes per callsite")
> > https://github.com/jimc/linux.git dd-kitchen-sink
> >
> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20230715
> > with following parameters:
> >
> >         test: tracing
> >
> >
> >
> > compiler: gcc-12
> > test machine: 16 threads 1 sockets Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz (Broadwell-DE) with 48G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202310202332.2a4dcca1-oliver.sang@intel.com
> >
> >
> > [  378.654196][    C3] BUG: TASK stack guard page was hit at 000000005b787114 (stack is 0000000024ca83b8..000000000d3fb8a1)
> > [  378.654204][    C3] stack guard page: 0000 [#1] PREEMPT SMP KASAN PTI
> > [  378.654209][    C3] CPU: 3 PID: 1667 Comm: in:imklog Tainted: G S                 6.6.0-rc6-00034-g64261c3ad071 #1
> > [  378.654214][    C3] Hardware name: Supermicro SYS-5018D-FN4T/X10SDV-8C-TLN4F, BIOS 1.1 03/02/2016
> > [ 378.654217][ C3] RIP: 0010:format_decode (lib/vsprintf.c:2526)
> > [ 378.654227][ C3] Code: 90 48 b8 00 00 00 00 00 fc ff df 41 57 4c 8d 7e 07 41 56 4c 89 f9 41 55 48 c1 e9 03 49 89 f5 41 54 55 48 89 fd 53 48 83 ec 68 <48> c7 44 24 08 b3 8a b5 41 4c 8d 64 24 08 48 c7 44 24 10 b0 6b 44
> > All code
> > ========
> >    0:   90                      nop
> >    1:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
> >    8:   fc ff df
> >    b:   41 57                   push   %r15
> >    d:   4c 8d 7e 07             lea    0x7(%rsi),%r15
> >   11:   41 56                   push   %r14
> >   13:   4c 89 f9                mov    %r15,%rcx
> >   16:   41 55                   push   %r13
> >   18:   48 c1 e9 03             shr    $0x3,%rcx
> >   1c:   49 89 f5                mov    %rsi,%r13
> >   1f:   41 54                   push   %r12
> >   21:   55                      push   %rbp
> >   22:   48 89 fd                mov    %rdi,%rbp
> >   25:   53                      push   %rbx
> >   26:   48 83 ec 68             sub    $0x68,%rsp
> >   2a:*  48 c7 44 24 08 b3 8a    movq   $0x41b58ab3,0x8(%rsp)            <-- trapping instruction
> >   31:   b5 41
> >   33:   4c 8d 64 24 08          lea    0x8(%rsp),%r12
> >   38:   48                      rex.W
> >   39:   c7                      .byte 0xc7
> >   3a:   44 24 10                rex.R and $0x10,%al
> >   3d:   b0 6b                   mov    $0x6b,%al
> >   3f:   44                      rex.R
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   48 c7 44 24 08 b3 8a    movq   $0x41b58ab3,0x8(%rsp)
> >    7:   b5 41
> >    9:   4c 8d 64 24 08          lea    0x8(%rsp),%r12
> >    e:   48                      rex.W
> >    f:   c7                      .byte 0xc7
> >   10:   44 24 10                rex.R and $0x10,%al
> >   13:   b0 6b                   mov    $0x6b,%al
> >   15:   44                      rex.R
> > [  378.654230][    C3] RSP: 0018:ffffc90001737fc8 EFLAGS: 00010292
> > [  378.654237][    C3] RAX: dffffc0000000000 RBX: ffffc90001738148 RCX: 1ffff920002e7016
> > [  378.654240][    C3] RDX: 0000000000000000 RSI: ffffc900017380b0 RDI: ffffffff83e4c360
> > [  378.654243][    C3] RBP: ffffffff83e4c360 R08: 0000000000000008 R09: 0000000000000001
> > [  378.654246][    C3] R10: ffff888c7398cc3b R11: 000000000000000a R12: ffffc900017380b0
> > [  378.654249][    C3] R13: ffffc900017380b0 R14: 0000000000000008 R15: ffffc900017380b7
> > [  378.654252][    C3] FS:  00007f74749046c0(0000) GS:ffff888bcab80000(0000) knlGS:0000000000000000
> > [  378.654255][    C3] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  378.654258][    C3] CR2: ffffc90001737fb8 CR3: 0000000c71652002 CR4: 00000000003706e0
> > [  378.654261][    C3] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [  378.654264][    C3] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [  378.654267][    C3] Call Trace:
> > [  378.654270][    C3]  <#DF>
> > [ 378.654274][ C3] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447)
> > [ 378.654284][ C3] ? handle_stack_overflow (arch/x86/kernel/traps.c:327)
> > [ 378.654295][ C3] ? exc_double_fault (arch/x86/kernel/traps.c:378)
> > [ 378.654311][ C3] ? asm_exc_double_fault (arch/x86/include/asm/idtentry.h:611)
> > [ 378.654331][ C3] ? format_decode (lib/vsprintf.c:2526)
> > [  378.654340][    C3]  </#DF>
> > [  378.654342][    C3]  <TASK>
> > [ 378.654349][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.654361][ C3] vsnprintf (lib/vsprintf.c:2772)
> > [ 378.654370][ C3] ? __task_pid_nr_ns (kernel/pid.c:497)
> > [ 378.654380][ C3] ? pointer (lib/vsprintf.c:2749)
> > [ 378.654385][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419)
> > [ 378.654393][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.654398][ C3] ? __task_pid_nr_ns (kernel/pid.c:497)
> > [ 378.654412][ C3] snprintf (lib/vsprintf.c:2948)
> > [ 378.654420][ C3] ? vsprintf (lib/vsprintf.c:2948)
> > [ 378.654434][ C3] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:419)
> > [ 378.654447][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:911)
> > [ 378.654460][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.654469][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.654477][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.654488][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.654510][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.654517][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654531][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.654541][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> > [ 378.654547][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654558][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654567][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043)
> > [ 378.654578][ C3] kstrdup (mm/util.c:62)
> > [ 378.654588][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654599][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> > [ 378.654610][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.654618][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.654627][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.654638][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.654660][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.654667][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654681][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.654690][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> > [ 378.654694][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654706][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654714][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043)
> > [ 378.654725][ C3] kstrdup (mm/util.c:62)
> > [ 378.654733][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654745][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> > [ 378.654755][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.654763][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.654772][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.654783][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.654805][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.654812][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654826][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.654835][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> > [ 378.654840][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654851][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654859][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043)
> > [ 378.654870][ C3] kstrdup (mm/util.c:62)
> > [ 378.654878][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654890][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> > [ 378.654900][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.654908][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.654917][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.654928][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.654950][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.654957][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654971][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.654980][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> > [ 378.654984][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.654996][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655004][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043)
> > [ 378.655014][ C3] kstrdup (mm/util.c:62)
> > [ 378.655023][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655034][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> > [ 378.655052][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.655067][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.655082][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.655104][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.655149][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.655161][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655175][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.655184][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> > [ 378.655189][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655201][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655209][ C3] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043)
> > [ 378.655220][ C3] kstrdup (mm/util.c:62)
> > [ 378.655228][ C3] __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655240][ C3] dynamic_emit_prefix (lib/dynamic_debug.c:914)
> > [ 378.655251][ C3] __dynamic_pr_debug (lib/dynamic_debug.c:939 (discriminator 2))
> > [ 378.655259][ C3] ? dynamic_emit_prefix (lib/dynamic_debug.c:926)
> > [ 378.655267][ C3] ? ftrace_graph_stop (kernel/trace/fgraph.c:125)
> > [ 378.655278][ C3] ? function_graph_enter (arch/x86/include/asm/atomic.h:53 include/linux/atomic/atomic-arch-fallback.h:979 include/linux/atomic/atomic-instrumented.h:436 kernel/trace/fgraph.c:89 kernel/trace/fgraph.c:142)
> > [ 378.655300][ C3] ? prepare_ftrace_return (arch/x86/kernel/ftrace.c:649)
> > [ 378.655308][ C3] ? __dynamic_emit_prefix (lib/dynamic_debug.c:887)
> > [ 378.655322][ C3] kmemleak_alloc (mm/kmemleak.c:978)
> > [ 378.655330][ C3] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517)
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20231020/202310202332.2a4dcca1-oliver.sang@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
