Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315F3D9E
	for <oe-lkp@lists.linux.dev>; Fri, 23 Jun 2023 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687531720; x=1719067720;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jho9xUKa1I80QZ3T8urrGfc7puLiVekl2TSq6PaJCfw=;
  b=mxx6d/2H2ug7Eky6baP9CUgJj2DfeHroQc4il/+PweSASkQK52QAORR2
   9pb1WaJ01Kblc7Baa2srOtrZnqnycRnfhcSjmEurWYgGuyHvgj0PrsXa5
   enbv1sNNYVnUVWf397cyQBEusqoVuvx3Oe9fg1aNqRhFx4mxdP67B7I77
   mRdImc2yrXvBHH12BS7rWBEirInh7LUN4topqZD0+P4/5ygl/B/BLZgSN
   q+btqK0Jx82OR1kMPeNKkV7YEeAX82KTZF7YZRCWpG42+4Q8+a0J9Pt/e
   qcmvmtnP31e6RhZ7OS8IlNFAXARM1jlvolqk5jAgO2Hzne9Im08qTIvav
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="345534558"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="345534558"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 07:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="718536323"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="718536323"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2023 07:48:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 07:48:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 07:48:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 07:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgN71Hn83bLrGgHtVWQjiOjh4FNNaZUY6A6HgKprSU/hcUb0LpjUXjVa/zS7/Iqh1OaNiLRKM3z+RU/Nwi0nJB9KdT/q8zXGUdOgj3Nq0QuMqmgVqU3AP7cumo+HGQuJyBbsIWDTdSJ6iFELZ6G2TlOqCVJwZwOPSUCj+NiqB/C4j/0q3AKbEfr/Eaib4kzQ7vlPx+xi86AMqRD0GrHJXS0RPK5hsVo9U+znBO+Ht0VlfEzgruXaz/Xat7WPY4/Ab5XQUG/Y/EUyWeK1cLZZGzaMow+q3WMWGvftKkMa5ZonhN84LYnoVtKprsB1rK0DEwYOY2eXvXn+4o+2q3iWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1cqIrpNfCJD5RD8DtHtIi7nJufVz2J2fsFcRFA6np4=;
 b=GFOVNxS/H/FoBo6YISMOcMfdiqFe+0NZRaqHe1Qu1XXuyyRvmzAC9PwcfXDNNA2RJKOL6/Ss768MMg7Fa/roJI1zl25Tw62z3/Dvrr+k4bzzf8XZYHaSyPdC2GUF8QiT2mVh5hdDYbx653T8OBzyk7N8HV+YKY8Vo8Gd1H6u/oEeFlZdBf3JcgM/QLosq9q4AC2tULyXf3D7Ph2jX56YA6xv4wrrLcctRDVc5CthQY3eVvrQXur7/CgQoWg333sc7apqpemF+T9DLzfYr5kxJPA8Vj3Z0Jl/i3b7SPywMKcIBIXoSE3WqUcNuqt2wJD3308vI4lTAtKljg7QO5Fw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 14:48:27 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Fri, 23 Jun 2023
 14:48:27 +0000
Date: Fri, 23 Jun 2023 22:48:12 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020>
References: <202306192245.d77d7216-oliver.sang@intel.com>
 <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
Content-Type: multipart/mixed; boundary="rh1RUZXSVt+NoVOj"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
X-ClientProxiedBy: SCYP215CA0006.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:31::21) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2ebbba-fd5a-4eac-9a3a-08db73f8e5c0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtefxqybsC8OtwV7o9ShglGUbrFwozuOso/PlMzFBRK6L5XdWpoi1V7SCy6U6qTs0Vvc/uy39o4fXb2by0rZqksiGNzOi+nwtfE97hUMhkIymUz42y5iENDkfSFVw96bmahEIoYV/nm6mFEBAVjUScgd/ovmK0T7pHZ8D6eSbdo/KXlDbkTcfwHRfpHi06NTud7yxuDylBLCNWYUGcuTCjsilIx3xEkjeIAjGmn0FfElowJn5HWAs2NHES1nWE6VU66JlaR0VpaR9xdAt8Y71jqd8R3tkqnYrUR7sADadfBy3XZm0OwPy74w3Y2dlWkVCyojYbFkGZgvOKX8CxMdm0gJHyH0hA2QA2wd+jdtKru9nB+KbZ3Wzlmr9762Uv6+1FILaTkCLJ5KfEWjU1LFOL1+P2rFxvaZG6mWLkWhj1FQKnqbMyUZ513h1IOUM0b5Ycx21AEudpcau5rLb0TUgOVUs7H6MSCw4+1tsA6zH3IZ85IOqaEsIl9ZsoTpIuj1COE/d82TVZkrsp2t/cSHlJgSDB2R2EriuE5aMCsG6yObmaiilxFcHKtR4FV6jLtJL8+t/vpr+ggtjt0E/qjIDP4cqgGeyvG+iQkt7mHb3eQ+LJl/45uINCz6mHNNDHq6YQ1uIDk93O49OWQdVUkH1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(82960400001)(38100700002)(33716001)(86362001)(44144004)(6666004)(966005)(44832011)(6486002)(8676002)(26005)(33964004)(478600001)(107886003)(235185007)(5660300002)(53546011)(41300700001)(6506007)(8936002)(30864003)(316002)(186003)(83380400001)(2906002)(66946007)(19627235002)(4326008)(6512007)(6916009)(9686003)(66476007)(66556008)(2700100001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDIySkJDRzV5MUpXYkhwb3Z4UWpFTFBHek1pVkF5N09CanpCZkREbTdrNmdB?=
 =?utf-8?B?K3NRL1AyVnNiSUFUbDF1ckMyQnVFZjN0V2gxeHJzM2xoM3dYSWlVZUcraUt4?=
 =?utf-8?B?YW5WeThjdCtsM09DbS80d2FBa2cvQnJuSWdmUWNJbjU4Qk91NVNDRDRYZnZ1?=
 =?utf-8?B?QjZQS1BlNGtxZVB5Q1BqVkpiYlhhcU1kVy9uSkgrTW5DSHpsbXFuNkMxUVVN?=
 =?utf-8?B?RDQ3dXM4ZHF2WlVzTHIzRFpFaEdmbnFhUGRteTRldnBoMFRwZ2VjYWlxYVo3?=
 =?utf-8?B?ZnJqY3dDZTMwTmJGS3cvQjdjQzlkUWJvMmZaV2RsZHZBSFZ1RGFKenpLMlZC?=
 =?utf-8?B?UG5UL0Rpckxnd3lFNEV3bHRpYzYxTmVBK0ZUajBoUmxsVVhuZ3NveG9kbGs2?=
 =?utf-8?B?M2hLRXhlOFZMSHVvb1ZjLzFYdVdlKzlnVHllZ2tnNjB5d1BMblJrOU9NWnNT?=
 =?utf-8?B?U0I5eXpDUW9HL21wRmlSTDVyeEV5Qm1BTStYOGhBRnNmNGlzUEZaU1lqcm9y?=
 =?utf-8?B?bSs3bWx0Tzc1eXdwZmIyb3hxc3NqdC84S0MxeDJHcktiREJPVjVxc3JyRktX?=
 =?utf-8?B?Vm5PcFc2dTBPZnJFTVd3V1RyelJoVzFURlR4dVE4Qy9EeDdwbHE1ZEVya3Yy?=
 =?utf-8?B?Vm83LzBmaHdyajlrM0VMQ2hmYko1Zk1aV1B0NDl5L3VYQUtnOVdFS0ZEUHlN?=
 =?utf-8?B?MkhqN0dZSE9sVExmcXAxeG55dkVUR3p3elhsWktxckpmT0lwbHhSNDBLMWx2?=
 =?utf-8?B?YVB5RmM1RFh5dVJ6ckdjM0drQkQ3WmZsMlBQMzVkUkZEY25zY2Z5aFhVTXk2?=
 =?utf-8?B?M2ZhMDVTYzJER1EvVVAxT2NWWWZJZ1JVOVZZQXFVVjFGTHgybytacURGQjNj?=
 =?utf-8?B?OUV6b0VhWURKR1NlMEUrM0d6QTBUYjZHUjlSa2JSVytmYjFjRWhGU3RPWHBq?=
 =?utf-8?B?b1Z1VXFyZUNzTldQeG5ZZ0hUZUJodHZNWkxWRk1oOC9nemtCV25nTHVmR1Fi?=
 =?utf-8?B?OVRDMWNsOTZGaUNBa0VIS3FXT241UGlGRHNnZXhuakc0N2xOaVFJN1FQTWc2?=
 =?utf-8?B?NElkS0dPWk1yTzVDL2NxM3lVcjVmdzJyUGhwYllGUjU3TjZORngreGFSbk05?=
 =?utf-8?B?NnZYbGxQTXlOWDVWZjVaRm8zNWdFTEZVajV2aE9KNEdhN0RFMzdBSWNaaTEw?=
 =?utf-8?B?M3orOGVWaWhPYk1sQ2lEQmxJdEY5QWo0bktYQUFnanpXT0RnQXEyYU9yS00w?=
 =?utf-8?B?dWZUM2lLTUppRy9XbWxTeEF5L3FkT1YxZUgyTEIzNWEvMWdsTGgyNEdFOUx6?=
 =?utf-8?B?OWZ1Y2JPa1RaQzlsVlpzRXBGYWd4a3h4dEhwQnU2K3BJa0VVMHB4dU9qeU1J?=
 =?utf-8?B?RTgwR0lXMVB5QlVpQ2JqN2VvMTlqRndZTXdweEdYZmp5QlE5UGpRbmpjcGpL?=
 =?utf-8?B?T2ExUjZ0QWdsZ2NWcXZ0a1BFZ3BlZ0Y0R2pRTjJDTmpjUGJWQ1I1aUxEU1pL?=
 =?utf-8?B?OXlxTi94Q0psaytWU3k2aGxvWUdwZlUvRVVZQWpjaTVjMkhCNUZtYnIwazJB?=
 =?utf-8?B?dVFwZ0puYzhHQ21lWVBBTzhyY2xjMFBvSWQ5U0NUTEdHV25WRE5xWWJHZ3FH?=
 =?utf-8?B?eUl1cE1walpmR1V0SWRXWTdpdzkxbjRvYmNMRUpCbndJa2VJVGFxS0dDY0pM?=
 =?utf-8?B?a0FUQllZS25oQzJvMnBhUzVEWFJWemFtWlJmT2toQ1NDbDJaSkkxa2VTTzE5?=
 =?utf-8?B?MkNNVWkzSmprVktrR2dGVEJETWt6L2NVMG55bHY1MXBVeDByd2IxY2dETzFs?=
 =?utf-8?B?MlN5TWcvTHpqNWc1OFNhd2lUN2JBWEUvQ2xlTkFLQVBBWHZTWTQ2YWNIanZK?=
 =?utf-8?B?QzZnNkdEdTdCY3lEMFJldmZMM2FwRzB3OXhnbm5WVVpZaGxPVWtWaDkvVEV6?=
 =?utf-8?B?dk1EeHVqS0RacSt4RFpoeW5UV2V2cm8zM1QzYkJYNVpINmM4WXhNdW5qbzdQ?=
 =?utf-8?B?Qk40WEZiUVJ3T0kwcEQ1QUx6d014aGZmWUptUGpCM241MHRmRmF2cGlwMW1r?=
 =?utf-8?B?UVJXRDMyT0VMUEpWL3hpRmNSZnVKK2RXb003b3hiMTJLV2NHbFRtV2hDbVdy?=
 =?utf-8?Q?og9EyRRpvHXhwcODz3atcQkLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2ebbba-fd5a-4eac-9a3a-08db73f8e5c0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 14:48:27.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRIuC4cyX1/N2DNI9qvPh+a4jAYNHGz1qVvaBVuaVPdfhrMgbTpqnvDoTIc085n0YnVYu88k6/GFP2qy2x3R2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
X-OriginatorOrg: intel.com

--rh1RUZXSVt+NoVOj
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

hi, Amir,

On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> On Tue, Jun 20, 2023 at 4:44 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -13.0% regression of stress-ng.ramfs.ops_per_sec on:
> >
> >
> > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement 'vfs write barriers'")
> > https://github.com/amir73il/linux sb_write_barrier
> >
> 
> Considering that this commit only adds helpers but never uses them
> this regression is a bit surprising.
> 
> You had reported regressions in the past on the next commit:
> "vfs: prepare for pre-modify permission events on write"
> 
> which made sense and I had since fixed and you verified.
> 
> The only suspect I can think of is that adding the new s_write_*
> members to struct super_block had split the frequently access
> members s_fsnotify_connectors and s_readonly_remount into
> different cachelines.
> 
> I've moved those new members to another location in the
> super_block struct and pushed the new branch to:
> 
> https://github.com/amir73il/linux sb_write_barrier
> 
> I've added another commit at the tip of this branch:
> 67d1802889f0 ("fsnotify: activate sb write barriers for permission
> event watchers")
> 
> This commit also adds a new member to struct super_block,
> next to s_fsnotify_connectors and s_readonly_remount, but this
> new member is also frequently accessed.
> 
> I am hoping that you can also verify that the tip commit does not
> cause a regression.

I finished the test on updated branch, but seems regression not be fixed.

  d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
  f995c9620bfd7 vfs: implement 'vfs write barriers'
  309b0dd357c60 vfs: prepare for pre-modify permission events on write
  67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers

d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
   1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
     22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec

all detail comparison is as below, I also attached the config to build all
these four kernels.


=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s

commit:
  d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
  f995c9620bfd7 vfs: implement 'vfs write barriers'
  309b0dd357c60 vfs: prepare for pre-modify permission events on write
  67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers

d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
  2.15e+09            -0.2%  2.146e+09            -0.1%  2.147e+09            -0.3%  2.144e+09        cpuidle..time
   3626267            +2.7%    3723533            +0.5%    3643077            -2.4%    3540533        cpuidle..usage
     94.20            +0.4%      94.59            +0.8%      94.96 ±  2%      -0.4%      93.83        uptime.boot
      3164            +0.3%       3172            +0.7%       3186            -0.4%       3151        uptime.idle
     21.92            +1.1%      22.16 ±  7%      +1.5%      22.24 ±  8%      -0.7%      21.75        boot-time.boot
     12.15 ±  2%      +4.3%      12.67 ±  9%      +5.4%      12.81 ± 15%      +0.3%      12.18        boot-time.dhcp
    730.73            +0.5%     734.39 ±  5%      +0.8%     736.74 ±  6%      -0.8%     725.09        boot-time.idle
     93.62            -0.0%      93.59            +0.0%      93.65            -0.0%      93.60        iostat.cpu.idle
      0.16 ± 19%     +19.7%       0.19 ± 19%      -2.4%       0.15 ±  7%      +9.0%       0.17 ± 50%  iostat.cpu.iowait
      3.63            +1.1%       3.67            +1.0%       3.67            +1.2%       3.68        iostat.cpu.system
      2.59            -1.8%       2.54            -2.5%       2.53            -1.4%       2.55        iostat.cpu.user
     93.55            -0.0       93.53            +0.0       93.58            -0.0       93.53        mpstat.cpu.all.idle%
      0.15 ± 21%      +0.0        0.17 ± 15%      -0.0        0.14 ± 10%      +0.0        0.16 ± 55%  mpstat.cpu.all.iowait%
      0.56 ±  2%      +0.0        0.57 ±  2%      +0.0        0.57 ±  2%      -0.0        0.55        mpstat.cpu.all.irq%
      0.14 ±  2%      -0.0        0.10 ± 34%      -0.0        0.11 ± 25%      -0.0        0.11 ± 32%  mpstat.cpu.all.soft%
      2.97            +0.1        3.04            +0.1        3.03            +0.1        3.04        mpstat.cpu.all.sys%
      2.63            -0.0        2.59            -0.1        2.57            -0.0        2.60        mpstat.cpu.all.usr%
     62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        time.elapsed_time
     62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        time.elapsed_time.max
     14.40 ± 22%      -7.4%      13.33 ± 28%     -25.9%      10.67 ± 35%     -11.1%      12.80 ± 30%  time.file_system_inputs
   2760309           -12.4%    2418439 ±  2%     -13.0%    2401566           -12.5%    2414316        time.involuntary_context_switches
      0.40 ±122%     +66.7%       0.67 ±111%    +108.3%       0.83 ±107%    -100.0%       0.00        time.major_page_faults
      6969 ±  3%      -1.5%       6864 ±  2%      -0.1%       6960 ±  2%      +0.0%       6969        time.maximum_resident_set_size
      9403            -0.3%       9371            -0.3%       9376            -0.4%       9361        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        time.page_size
     75.00            +0.4%      75.33            +0.9%      75.67            +1.6%      76.20        time.percent_of_cpu_this_job_got
     40.03            +3.2%      41.31            +4.0%      41.64            +4.7%      41.89        time.system_time
      6.85           -15.5%       5.79 ±  8%     -16.3%       5.73 ±  2%     -16.6%       5.71 ±  2%  time.user_time
    355622 ± 14%     +42.2%     505661 ± 13%     +21.1%     430817 ± 15%     -13.4%     308012 ± 12%  time.voluntary_context_switches
     93.00            +0.0%      93.00            +0.0%      93.00            +0.0%      93.00        vmstat.cpu.id
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        vmstat.cpu.sy
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.wa
     15.00            +0.0%      15.00            +0.0%      15.00            +0.0%      15.00        vmstat.io.bi
    375.00 ±  4%      +9.3%     409.83 ± 19%     +14.4%     429.00 ± 21%      -4.6%     357.60 ±  3%  vmstat.io.bo
      2052            +0.2%       2056            +1.0%       2073            +0.5%       2062        vmstat.memory.buff
   3257813            -0.7%    3235379            -0.8%    3232739            -0.8%    3233180        vmstat.memory.cache
 1.276e+08            -6.7%  1.191e+08            -6.7%  1.191e+08            -6.7%  1.191e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
      2.00            +0.0%       2.00            +0.0%       2.00           -10.0%       1.80 ± 22%  vmstat.procs.r
    184174            -4.0%     176739            -7.4%     170573 ±  3%     -10.7%     164543        vmstat.system.cs
     81544            -0.6%      81066            -2.8%      79288            -4.8%      77608        vmstat.system.in
   1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
     22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
     62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        stress-ng.time.elapsed_time
     62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        stress-ng.time.elapsed_time.max
     14.40 ± 22%      -7.4%      13.33 ± 28%     -25.9%      10.67 ± 35%     -11.1%      12.80 ± 30%  stress-ng.time.file_system_inputs
   2760309           -12.4%    2418439 ±  2%     -13.0%    2401566           -12.5%    2414316        stress-ng.time.involuntary_context_switches
      0.40 ±122%     +66.7%       0.67 ±111%    +108.3%       0.83 ±107%    -100.0%       0.00        stress-ng.time.major_page_faults
      6969 ±  3%      -1.5%       6864 ±  2%      -0.1%       6960 ±  2%      +0.0%       6969        stress-ng.time.maximum_resident_set_size
      9403            -0.3%       9371            -0.3%       9376            -0.4%       9361        stress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        stress-ng.time.page_size
     75.00            +0.4%      75.33            +0.9%      75.67            +1.6%      76.20        stress-ng.time.percent_of_cpu_this_job_got
     40.03            +3.2%      41.31            +4.0%      41.64            +4.7%      41.89        stress-ng.time.system_time
      6.85           -15.5%       5.79 ±  8%     -16.3%       5.73 ±  2%     -16.6%       5.71 ±  2%  stress-ng.time.user_time
    355622 ± 14%     +42.2%     505661 ± 13%     +21.1%     430817 ± 15%     -13.4%     308012 ± 12%  stress-ng.time.voluntary_context_switches
    260.40            +0.5%     261.67            -0.0%     260.33            +0.1%     260.60        turbostat.Avg_MHz
      6.93            +0.0        6.96            -0.0        6.92            -0.0        6.93        turbostat.Busy%
      3753            +0.1%       3758            +0.1%       3758            +0.2%       3760        turbostat.Bzy_MHz
    158528           -20.0%     126746 ±  2%     -23.7%     121031 ±  4%     -19.3%     128009 ±  4%  turbostat.C1
      0.20 ±  3%      -0.0        0.18 ±  6%      -0.0        0.18 ±  7%      -0.0        0.18 ±  8%  turbostat.C1%
   1192913            -0.1%    1192259            -1.0%    1180912            -0.5%    1187383        turbostat.C1E
      5.87            +0.0        5.88            -0.2        5.72            +0.0        5.87 ±  6%  turbostat.C1E%
   2048935            -0.2%    2045629            +0.0%    2049836            -0.2%    2043994        turbostat.C6
     87.27            -0.0       87.25            +0.2       87.45            +0.0       87.27        turbostat.C6%
     92.04            +0.1%      92.16            +0.2%      92.22            +0.2%      92.22        turbostat.CPU%c1
      1.02 ± 12%     -13.9%       0.88 ± 11%     -16.0%       0.86 ± 14%     -16.8%       0.85 ±  4%  turbostat.CPU%c6
     41.00            +0.8%      41.33 ±  2%      +0.0%      41.00 ±  2%      -0.5%      40.80        turbostat.CoreTmp
      0.43            -2.6%       0.42            +0.1%       0.43 ±  2%      -0.9%       0.42        turbostat.IPC
   5306984            -0.7%    5272062            -2.6%    5169631            -5.1%    5034120        turbostat.IRQ
    222417 ± 21%     +59.9%     355585 ± 15%     +29.7%     288493 ± 17%     -20.0%     177907 ± 19%  turbostat.POLL
      0.02 ± 20%      +0.0        0.04 ± 14%      +0.0        0.03 ± 19%      -0.0        0.02        turbostat.POLL%
      0.52 ± 24%     -19.3%       0.42 ± 50%      -7.0%       0.48 ± 17%     -12.4%       0.45 ±  7%  turbostat.Pkg%pc2
     40.20            +0.7%      40.50 ±  3%      -0.1%      40.17 ±  3%      +0.5%      40.40 ±  2%  turbostat.PkgTmp
     87.87            +0.3%      88.17            +0.4%      88.20            +0.6%      88.40        turbostat.PkgWatt
     10.04           +12.4%      11.29           +12.2%      11.26           +12.6%      11.30        turbostat.RAMWatt
      3001            -0.0%       3000            -0.0%       3000            -0.0%       3000        turbostat.TSC_MHz
    314265            -4.1%     301274            -5.0%     298490            -4.8%     299238        meminfo.Active
    312130            -4.2%     299145            -5.1%     296340            -4.8%     297104        meminfo.Active(anon)
      2134            -0.3%       2128            +0.7%       2149            -0.0%       2134        meminfo.Active(file)
     53077 ±  9%      +0.3%      53222 ±  8%     +10.7%      58778 ±  9%      +5.9%      56198 ± 14%  meminfo.AnonHugePages
    304406            -0.3%     303490            +0.1%     304645            +0.1%     304617        meminfo.AnonPages
      2051            +0.2%       2055            +1.0%       2072            +0.5%       2061        meminfo.Buffers
   3160005            -0.7%    3137936            -0.8%    3134924            -0.8%    3135847        meminfo.Cached
  65801604            -0.0%   65801600            -0.0%   65801600            -0.0%   65801600        meminfo.CommitLimit
    839115            -2.7%     816130            -3.1%     813419            -3.0%     814330        meminfo.Committed_AS
  1.25e+08 ±  2%      +2.1%  1.276e+08            +1.8%  1.272e+08            +1.0%  1.262e+08        meminfo.DirectMap1G
   8610611 ± 40%     -30.0%    6030336 ± 23%     -26.0%    6374741 ± 22%     -14.6%    7351910 ± 14%  meminfo.DirectMap2M
    308537 ± 17%      -2.0%     302325 ± 16%      -0.4%     307445 ± 10%      +0.1%     308947 ±  9%  meminfo.DirectMap4k
     13.00 ± 28%     +12.8%      14.67 ± 30%      +3.8%      13.50 ± 23%     +23.1%      16.00 ±  5%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    340650            -3.0%     330534            -2.8%     331152            -2.6%     331690        meminfo.Inactive
    340463            -3.0%     330348            -2.8%     330961            -2.6%     331497        meminfo.Inactive(anon)
    186.60            -0.5%     185.67            +1.9%     190.17 ±  4%      +3.1%     192.40 ±  3%  meminfo.Inactive(file)
     95703            -0.3%      95413            -0.2%      95485            -0.4%      95332        meminfo.KReclaimable
      9046            +0.2%       9060            -0.1%       9034            -0.3%       9017        meminfo.KernelStack
     54598           -16.7%      45490           -16.3%      45704           -16.0%      45866        meminfo.Mapped
 1.268e+08            -6.6%  1.184e+08            -6.6%  1.185e+08            -6.6%  1.184e+08        meminfo.MemAvailable
 1.276e+08            -6.6%  1.192e+08            -6.5%  1.193e+08            -6.6%  1.193e+08        meminfo.MemFree
 1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08        meminfo.MemTotal
   3958498          +212.2%   12357945          +211.2%   12317930          +212.1%   12353184        meminfo.Memused
     11.00            +0.0%      11.00            +0.0%      11.00            +0.0%      11.00        meminfo.Mlocked
      4014            -0.2%       4007            -0.2%       4006            +0.6%       4040        meminfo.PageTables
     17796        +48024.2%    8564575        +47827.4%    8529539        +48034.7%    8566438        meminfo.Percpu
     95703            -0.3%      95413            -0.2%      95485            -0.4%      95332        meminfo.SReclaimable
     91742          +311.6%     377568          +310.0%     376107          +311.2%     377278        meminfo.SUnreclaim
    347928            -6.3%     325861            -7.2%     322842            -6.9%     323773        meminfo.Shmem
    187447          +152.3%     472983          +151.6%     471592          +152.1%     472612        meminfo.Slab
   2811804            +0.0%    2811809            +0.0%    2811810            -0.0%    2811803        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
     20441         +2173.2%     464664         +2164.2%     462832         +2173.5%     464731        meminfo.VmallocUsed
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        meminfo.Writeback
   4134235          +198.9%   12358013          +198.0%   12317956          +198.8%   12353188        meminfo.max_used_kB
    136.40 ± 19%      -2.9%     132.50 ± 17%      -1.0%     135.00 ± 11%      +0.3%     136.80 ± 10%  proc-vmstat.direct_map_level2_splits
      5.00 ± 65%     -53.3%       2.33 ± 58%     -46.7%       2.67 ± 51%     -24.0%       3.80 ± 34%  proc-vmstat.direct_map_level3_splits
     78032            -4.2%      74786            -5.1%      74084            -4.8%      74275        proc-vmstat.nr_active_anon
    533.20            -0.3%     531.83            +0.7%     537.00            +0.0%     533.20        proc-vmstat.nr_active_file
     76105            -0.3%      75876            +0.1%      76160            +0.1%      76154        proc-vmstat.nr_anon_pages
     25.60 ±  9%      +0.3%      25.67 ±  8%     +10.0%      28.17 ±  9%      +4.7%      26.80 ± 15%  proc-vmstat.nr_anon_transparent_hugepages
     10.40 ± 13%      -3.8%      10.00 ± 11%     +69.9%      17.67 ± 68%     -11.5%       9.20 ±  4%  proc-vmstat.nr_dirtied
      3.20 ± 30%      +9.4%       3.50 ± 31%      -1.0%       3.17 ± 28%     +12.5%       3.60 ± 13%  proc-vmstat.nr_dirty
   3165293            -6.6%    2955608            -6.6%    2956609            -6.6%    2955729        proc-vmstat.nr_dirty_background_threshold
   6338326            -6.6%    5918443            -6.6%    5920448            -6.6%    5918685        proc-vmstat.nr_dirty_threshold
    790516            -0.7%     785001            -0.8%     784249            -0.8%     784477        proc-vmstat.nr_file_pages
  31911204            -6.6%   29811282            -6.5%   29821300            -6.6%   29812487        proc-vmstat.nr_free_pages
     85121            -3.0%      82592            -2.8%      82739            -2.6%      82877        proc-vmstat.nr_inactive_anon
     46.40            -0.9%      46.00            +1.7%      47.17 ±  4%      +2.6%      47.60 ±  3%  proc-vmstat.nr_inactive_file
      9046            +0.2%       9061            -0.1%       9035            -0.3%       9016        proc-vmstat.nr_kernel_stack
     13656           -16.7%      11375           -16.3%      11427           -16.0%      11469        proc-vmstat.nr_mapped
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.nr_mlock
      1003            -0.2%       1001            -0.2%       1001            +0.7%       1010        proc-vmstat.nr_page_table_pages
     86984            -6.3%      81468            -7.2%      80710            -6.9%      80944        proc-vmstat.nr_shmem
     23925            -0.3%      23853            -0.2%      23870            -0.4%      23831        proc-vmstat.nr_slab_reclaimable
     22933          +311.6%      94392          +310.0%      94026          +311.3%      94320        proc-vmstat.nr_slab_unreclaimable
    702950            +0.0%     702951            +0.0%     702952            -0.0%     702950        proc-vmstat.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_writeback
      9.20 ± 15%      -2.2%       9.00 ± 16%      -2.2%       9.00 ± 12%     -10.9%       8.20 ±  4%  proc-vmstat.nr_written
     78032            -4.2%      74786            -5.1%      74084            -4.8%      74275        proc-vmstat.nr_zone_active_anon
    533.20            -0.3%     531.83            +0.7%     537.00            +0.0%     533.20        proc-vmstat.nr_zone_active_file
     85121            -3.0%      82592            -2.8%      82739            -2.6%      82877        proc-vmstat.nr_zone_inactive_anon
     46.40            -0.9%      46.00            +1.7%      47.17 ±  4%      +2.6%      47.60 ±  3%  proc-vmstat.nr_zone_inactive_file
    702950            +0.0%     702951            +0.0%     702952            -0.0%     702950        proc-vmstat.nr_zone_unevictable
      3.00 ± 42%     +11.1%       3.33 ± 28%      -5.6%       2.83 ± 42%     +20.0%       3.60 ± 13%  proc-vmstat.nr_zone_write_pending
   1198017          +343.6%    5314240 ±  2%    +341.8%    5292895          +342.8%    5304308        proc-vmstat.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1198053          +343.5%    5313831 ±  2%    +341.3%    5287476          +342.7%    5304308        proc-vmstat.numa_local
    119617            -6.2%     112166            -7.2%     111048            -6.8%     111519        proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   1872854 ±  3%    +209.6%    5799179 ±  2%    +208.3%    5774057          +207.9%    5767226        proc-vmstat.pgalloc_normal
    208042            -1.2%     205567            -1.0%     206000            -0.6%     206729        proc-vmstat.pgfault
   1734145 ±  3%     -27.1%    1265016 ±  4%     -26.7%    1270273 ±  2%     -28.4%    1242297 ±  3%  proc-vmstat.pgfree
      1008            +0.0%       1008            +0.0%       1008            +0.1%       1008        proc-vmstat.pgpgin
     23484 ±  4%      +9.7%      25752 ± 19%     +14.0%      26763 ± 24%      -5.2%      22257 ±  3%  proc-vmstat.pgpgout
      7594            +1.8%       7734 ±  3%      -0.6%       7546            +2.2%       7759 ±  2%  proc-vmstat.pgreuse
     47.20 ±  3%      -0.1%      47.17 ±  3%      +1.7%      48.00            -0.4%      47.00 ±  4%  proc-vmstat.thp_collapse_alloc
      0.20 ±200%     -16.7%       0.17 ±223%     -16.7%       0.17 ±223%      +0.0%       0.20 ±200%  proc-vmstat.thp_deferred_split_page
      1.20 ± 97%     -58.3%       0.50 ±100%     +25.0%       1.50 ± 74%      +0.0%       1.20 ± 97%  proc-vmstat.thp_fault_alloc
      0.20 ±200%     -16.7%       0.17 ±223%     -16.7%       0.17 ±223%      +0.0%       0.20 ±200%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
    155.20            +1.1%     156.83            +2.2%     158.67 ±  3%      +2.7%     159.40 ±  2%  proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
      3.00            +0.0%       3.00           -16.7%       2.50 ± 44%      +0.0%       3.00        proc-vmstat.unevictable_pgs_munlocked
      3.38           +16.3%       3.93 ±  2%     +15.9%       3.92           +13.9%       3.85        perf-stat.i.MPKI
 2.722e+09            -2.8%  2.646e+09            -2.9%  2.642e+09            -1.7%  2.676e+09        perf-stat.i.branch-instructions
      1.51            +0.0        1.54            +0.0        1.54            +0.0        1.54        perf-stat.i.branch-miss-rate%
  40905304            -0.6%   40670573            -0.9%   40554409            -0.0%   40900878        perf-stat.i.branch-misses
      2.80 ±  3%      +9.7       12.51 ±  2%      +9.7       12.54            +9.8       12.61        perf-stat.i.cache-miss-rate%
   1279219 ±  2%    +405.4%    6465648          +404.7%    6456091          +408.2%    6501132        perf-stat.i.cache-misses
  45100283           +14.9%   51811443 ±  2%     +14.7%   51711839           +14.3%   51548096        perf-stat.i.cache-references
    191751            -4.0%     184047            -7.2%     177903 ±  2%     -10.9%     170818        perf-stat.i.context-switches
      0.68            +2.0%       0.69            +1.3%       0.69            +0.1%       0.68        perf-stat.i.cpi
     36001            +0.0%      36001            +0.0%      36001            -0.0%      36001        perf-stat.i.cpu-clock
 9.046e+09            +0.4%   9.08e+09            -0.3%  9.021e+09            -0.0%  9.043e+09        perf-stat.i.cpu-cycles
    801.69 ±  3%      +5.5%     845.41 ±  8%      -7.3%     743.06 ± 12%      -5.3%     759.06 ± 12%  perf-stat.i.cpu-migrations
     29639 ± 13%     -95.0%       1483           -95.0%       1481           -95.0%       1471        perf-stat.i.cycles-between-cache-misses
      0.01 ±  2%      +0.0        0.01 ±  9%      +0.0        0.01 ± 15%      +0.0        0.01 ±  7%  perf-stat.i.dTLB-load-miss-rate%
    185154 ±  2%     +40.1%     259332 ±  9%     +38.0%     255444 ± 14%     +24.0%     229505 ±  6%  perf-stat.i.dTLB-load-misses
 2.909e+09            -0.2%  2.904e+09            +0.2%  2.915e+09            +1.5%  2.952e+09        perf-stat.i.dTLB-loads
      0.01 ±  6%      +0.0        0.01 ±  2%      +0.0        0.01 ±  4%      +0.0        0.01        perf-stat.i.dTLB-store-miss-rate%
    100360 ±  6%    +131.3%     232163          +130.1%     230934 ±  3%    +126.1%     226935        perf-stat.i.dTLB-store-misses
 1.714e+09            +2.8%  1.761e+09            +3.4%  1.771e+09            +4.7%  1.794e+09        perf-stat.i.dTLB-stores
     65.01            -2.2       62.84            -2.1       62.95            -1.8       63.22        perf-stat.i.iTLB-load-miss-rate%
   3401759 ±  2%     -10.4%    3046756 ±  2%     -11.2%    3021917 ±  3%     -10.1%    3059770        perf-stat.i.iTLB-load-misses
   1811706            -1.4%    1786901 ±  2%      -2.8%    1761199 ±  2%      -2.7%    1762394        perf-stat.i.iTLB-loads
 1.333e+10            -1.7%  1.311e+10            -1.6%  1.312e+10            -0.2%  1.331e+10        perf-stat.i.instructions
      4008 ±  2%      +9.4%       4386 ±  2%     +10.5%       4427 ±  3%     +10.7%       4438 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      1.47            -1.9%       1.44            -1.2%       1.46            -0.1%       1.47        perf-stat.i.ipc
      0.07 ± 54%    +324.4%       0.30 ± 24%    +464.6%       0.40 ± 22%    +200.1%       0.21 ± 29%  perf-stat.i.major-faults
      0.25            +0.4%       0.25            -0.3%       0.25            -0.0%       0.25        perf-stat.i.metric.GHz
     83.36          +105.3%     171.11 ±  8%     +98.1%     165.17 ±  3%     +94.4%     162.07 ±  3%  perf-stat.i.metric.K/sec
    205.25            -0.4%     204.51            -0.1%     204.97            +1.1%     207.60        perf-stat.i.metric.M/sec
      1821            -1.7%       1789            -1.6%       1792            -0.9%       1804        perf-stat.i.minor-faults
    178289 ±  3%     +80.4%     321568 ±  3%     +78.1%     317486 ±  2%     +73.8%     309946 ±  2%  perf-stat.i.node-loads
    250794 ±  5%   +1108.3%    3030370 ± 10%   +1026.1%    2824270 ±  6%    +988.8%    2730537 ±  4%  perf-stat.i.node-stores
      1821            -1.7%       1789            -1.6%       1792            -0.9%       1804        perf-stat.i.page-faults
     36001            +0.0%      36001            +0.0%      36001            -0.0%      36001        perf-stat.i.task-clock
      3.38           +16.8%       3.95 ±  2%     +16.5%       3.94           +14.5%       3.87        perf-stat.overall.MPKI
      1.50            +0.0        1.54            +0.0        1.53            +0.0        1.53        perf-stat.overall.branch-miss-rate%
      2.84 ±  3%      +9.7       12.49 ±  3%      +9.6       12.49            +9.8       12.61        perf-stat.overall.cache-miss-rate%
      0.68            +2.1%       0.69            +1.3%       0.69            +0.2%       0.68        perf-stat.overall.cpi
      7074 ±  2%     -80.1%       1404           -80.2%       1397           -80.3%       1391        perf-stat.overall.cycles-between-cache-misses
      0.01 ±  2%      +0.0        0.01 ±  9%      +0.0        0.01 ± 14%      +0.0        0.01 ±  6%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ±  6%      +0.0        0.01 ±  2%      +0.0        0.01 ±  3%      +0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
     65.24            -2.2       63.03            -2.1       63.16            -1.8       63.45        perf-stat.overall.iTLB-load-miss-rate%
      3921 ±  2%      +9.8%       4306 ±  2%     +10.9%       4348 ±  3%     +10.9%       4350        perf-stat.overall.instructions-per-iTLB-miss
      1.47            -2.0%       1.44            -1.3%       1.45            -0.2%       1.47        perf-stat.overall.ipc
 2.678e+09            -2.8%  2.604e+09            -2.9%    2.6e+09            -1.7%  2.634e+09        perf-stat.ps.branch-instructions
  40256213            -0.6%   40026001            -0.9%   39911551            -0.0%   40251975        perf-stat.ps.branch-misses
   1259329 ±  2%    +405.3%    6363306          +404.5%    6353871          +408.1%    6398089        perf-stat.ps.cache-misses
  44384348           +14.9%   50989645 ±  2%     +14.7%   50891131           +14.3%   50729049        perf-stat.ps.cache-references
    188703            -4.0%     181127            -7.2%     175079 ±  2%     -10.9%     168103        perf-stat.ps.context-switches
     35429            -0.0%      35429            +0.0%      35430            -0.0%      35429        perf-stat.ps.cpu-clock
 8.903e+09            +0.4%  8.936e+09            -0.3%  8.878e+09            -0.0%    8.9e+09        perf-stat.ps.cpu-cycles
    788.95 ±  3%      +5.5%     832.00 ±  8%      -7.3%     731.27 ± 12%      -5.3%     746.99 ± 12%  perf-stat.ps.cpu-migrations
    182239 ±  2%     +40.1%     255227 ±  9%     +38.0%     251400 ± 14%     +23.9%     225874 ±  6%  perf-stat.ps.dTLB-load-misses
 2.863e+09            -0.2%  2.858e+09            +0.2%  2.869e+09            +1.5%  2.905e+09        perf-stat.ps.dTLB-loads
     98768 ±  6%    +131.3%     228477          +130.1%     227267 ±  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses
 1.686e+09            +2.8%  1.733e+09            +3.4%  1.743e+09            +4.7%  1.766e+09        perf-stat.ps.dTLB-stores
   3347701 ±  2%     -10.4%    2998429 ±  2%     -11.2%    2973969 ±  3%     -10.1%    3011153        perf-stat.ps.iTLB-load-misses
   1782901            -1.4%    1758532 ±  2%      -2.8%    1733226 ±  2%      -2.7%    1734372        perf-stat.ps.iTLB-loads
 1.312e+10            -1.6%  1.291e+10            -1.6%  1.291e+10            -0.2%   1.31e+10        perf-stat.ps.instructions
      0.07 ± 54%    +324.2%       0.30 ± 24%    +464.4%       0.39 ± 22%    +200.0%       0.21 ± 29%  perf-stat.ps.major-faults
      1792            -1.8%       1760            -1.6%       1764            -0.9%       1776        perf-stat.ps.minor-faults
    175514 ±  3%     +80.3%     316505 ±  3%     +78.0%     312489 ±  2%     +73.8%     305064 ±  2%  perf-stat.ps.node-loads
    246889 ±  5%   +1108.0%    2982338 ± 10%   +1025.8%    2779488 ±  6%    +988.4%    2687177 ±  4%  perf-stat.ps.node-stores
      1792            -1.7%       1761            -1.6%       1764            -0.9%       1776        perf-stat.ps.page-faults
     35429            -0.0%      35429            +0.0%      35430            -0.0%      35429        perf-stat.ps.task-clock
 8.277e+11            -1.6%  8.141e+11            -1.6%  8.146e+11            -0.2%  8.262e+11        perf-stat.total.instructions
      2891            +0.2%       2897            +0.0%       2892            +0.1%       2894        softirqs.BLOCK
     99.40            +0.4%      99.83            -0.9%      98.50            +0.0%      99.40        softirqs.HI
     68.40 ±  3%      +0.1%      68.50            +0.4%      68.67 ±  2%      +3.2%      70.60 ±  2%  softirqs.NET_RX
      4.00            +0.0%       4.00            +0.0%       4.00            +0.0%       4.00        softirqs.NET_TX
    705640 ±  4%     +37.2%     968304 ± 28%     +16.5%     822138 ± 31%      +9.5%     772471 ± 49%  softirqs.RCU
    326452 ±  3%      +2.2%     333791            +1.6%     331596 ±  5%      -2.5%     318406 ±  4%  softirqs.SCHED
    580.40            +0.8%     585.17            +0.5%     583.17            +0.7%     584.40        softirqs.TASKLET
     16668 ±  2%      +0.7%      16789            -0.5%      16592 ±  3%      -0.6%      16567 ±  4%  softirqs.TIMER
   1797799           -11.6%    1589634           -13.0%    1563259 ±  2%     -13.5%    1554661        interrupts.CAL:Function_call_interrupts
    245.40            -4.8%     233.67            -5.7%     231.33            -5.6%     231.60        interrupts.IWI:IRQ_work_interrupts
   3191028            -0.1%    3187387            -0.1%    3187700            -0.2%    3185238        interrupts.LOC:Local_timer_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        interrupts.MCP:Machine_check_polls
     63377 ±  2%      +9.3%      69282 ±  4%      +5.0%      66568 ±  5%      +3.8%      65768 ±  6%  interrupts.NMI:Non-maskable_interrupts
     63377 ±  2%      +9.3%      69282 ±  4%      +5.0%      66568 ±  5%      +3.8%      65768 ±  6%  interrupts.PMI:Performance_monitoring_interrupts
    193638 ± 24%     +85.7%     359502 ± 18%     +48.7%     287850 ± 21%     -14.6%     165355 ± 24%  interrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        interrupts.RTR:APIC_ICR_read_retries
    314.80 ±  6%     -12.5%     275.50 ±  7%     -14.9%     267.83 ±  5%     -14.7%     268.40 ±  9%  interrupts.TLB:TLB_shootdowns
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        perf-sched.total_sch_delay.average.ms
      1.37 ± 33%     -35.2%       0.89 ± 41%      +4.8%       1.44 ± 72%     -36.2%       0.88 ± 34%  perf-sched.total_sch_delay.max.ms
      0.86 ±  4%      +5.5%       0.90            +8.1%       0.92 ±  2%      +7.4%       0.92        perf-sched.total_wait_and_delay.average.ms
    629234            -7.2%     584017            -7.8%     580183            -7.4%     582793 ±  2%  perf-sched.total_wait_and_delay.count.ms
      4101 ± 10%      -9.9%       3696 ± 11%     -12.1%       3604 ± 24%     -12.7%       3579 ± 27%  perf-sched.total_wait_and_delay.max.ms
      0.85 ±  4%      +5.6%       0.90            +8.1%       0.92 ±  2%      +7.4%       0.92        perf-sched.total_wait_time.average.ms
      4101 ± 10%      -9.9%       3696 ± 11%     -12.1%       3604 ± 24%     -12.7%       3579 ± 27%  perf-sched.total_wait_time.max.ms
     42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     42.13 ± 23%      -6.7       35.40 ±  9%      -8.5       33.67 ± 11%      -9.4       32.78 ±  8%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     41.50 ± 23%      -6.7       34.82 ±  9%      -8.4       33.10 ± 11%      -9.3       32.24 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     40.93 ± 24%      -6.6       34.35 ±  9%      -8.4       32.52 ± 11%      -9.3       31.68 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     41.24 ± 23%      -6.5       34.76 ±  9%      -8.2       33.00 ± 11%      -8.9       32.35 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     36.93 ± 26%      -6.2       30.72 ± 10%      -8.2       28.69 ± 12%      -8.6       28.30 ±  8%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      3.27 ± 14%      -0.5        2.76 ± 12%      -0.2        3.04 ± 23%      -0.6        2.65 ± 13%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.96 ± 14%      -0.4        2.51 ± 13%      -0.2        2.75 ± 23%      -0.6        2.40 ± 14%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.24 ± 11%      -0.3        1.92 ±  9%      -0.1        2.16 ± 20%      -0.5        1.77 ± 11%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      2.22 ± 11%      -0.3        1.90 ±  9%      -0.1        2.14 ± 20%      -0.5        1.75 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.48 ± 51%      -0.3        0.18 ±141%      -0.4        0.09 ±223%      -0.4        0.12 ±200%  perf-profile.calltrace.cycles-pp.__xstat64
      1.46 ± 15%      -0.3        1.20 ± 19%      +0.0        1.50 ± 25%      -0.2        1.27 ± 20%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      1.84 ± 12%      -0.3        1.58 ±  8%      -0.1        1.73 ± 21%      -0.4        1.39 ± 10%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.44 ± 50%      -0.3        0.18 ±141%      -0.4        0.08 ±223%      -0.4        0.00        perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.28 ± 15%      -0.2        1.04 ± 19%      +0.0        1.31 ± 25%      -0.2        1.13 ± 21%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.36 ± 15%      -0.2        1.12 ± 19%      +0.0        1.40 ± 25%      -0.2        1.19 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.34 ± 14%      -0.2        1.10 ± 19%      +0.0        1.37 ± 25%      -0.2        1.17 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.36 ± 15%      -0.2        1.13 ± 19%      +0.0        1.41 ± 25%      -0.2        1.21 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.17 ± 30%      -0.2        0.94 ± 16%      -0.2        0.96 ± 18%      -0.2        0.99 ± 11%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
      0.23 ±122%      -0.2        0.00            -0.0        0.18 ±141%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.22 ±123%      -0.2        0.00            -0.1        0.08 ±223%      +0.0        0.23 ±122%  perf-profile.calltrace.cycles-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      1.17 ± 16%      -0.2        0.95 ± 20%      +0.0        1.19 ± 24%      -0.1        1.05 ± 20%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.07 ± 30%      -0.2        0.86 ± 17%      -0.2        0.88 ± 17%      -0.2        0.91 ± 12%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
      1.16 ± 16%      -0.2        0.94 ± 21%      +0.0        1.18 ± 24%      -0.1        1.04 ± 20%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.36 ± 14%      -0.2        1.16 ± 10%      -0.1        1.28 ± 21%      -0.3        1.04 ±  9%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.83 ± 16%      -0.2        0.64 ± 48%      -0.0        0.82 ± 47%      -0.2        0.67 ± 51%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      1.25 ± 12%      -0.2        1.07 ± 11%      -0.1        1.18 ± 19%      -0.3        0.99 ±  9%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.66 ± 10%      -0.2        0.48 ± 46%      -0.1        0.56 ± 46%      -0.1        0.59 ±  9%  perf-profile.calltrace.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle
      0.78 ± 16%      -0.2        0.60 ± 48%      -0.0        0.76 ± 47%      -0.2        0.62 ± 52%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      1.24 ± 11%      -0.2        1.06 ± 11%      -0.1        1.16 ± 19%      -0.3        0.98 ±  9%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      0.76 ± 16%      -0.2        0.58 ± 48%      -0.0        0.74 ± 47%      -0.2        0.61 ± 52%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      0.96 ± 16%      -0.2        0.81 ± 20%      +0.0        1.00 ± 27%      -0.1        0.88 ± 22%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.95 ± 16%      -0.2        0.80 ± 20%      -0.0        0.90 ± 47%      -0.1        0.88 ± 22%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.69 ± 16%      -0.1        0.54 ± 49%      -0.0        0.67 ± 47%      -0.1        0.56 ± 52%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.98 ± 10%      -0.1        0.84 ±  9%      -0.1        0.93 ± 16%      -0.2        0.82 ±  9%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.22 ±122%      -0.1        0.09 ±223%      -0.1        0.10 ±223%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      1.20 ± 23%      -0.1        1.07 ± 16%      -0.1        1.14 ±  6%      +0.0        1.24 ± 16%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
      0.23 ±123%      -0.1        0.10 ±223%      -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.strcmp@plt
      0.22 ±122%      -0.1        0.08 ±223%      -0.1        0.09 ±223%      -0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      3.33 ± 25%      -0.1        3.20 ± 10%      +0.1        3.45 ± 11%      +0.2        3.57 ±  9%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      3.35 ± 24%      -0.1        3.22 ± 10%      +0.1        3.46 ± 11%      +0.2        3.58 ±  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.21 ±122%      -0.1        0.08 ±223%      -0.2        0.00            -0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.22 ±122%      -0.1        0.09 ±223%      -0.0        0.18 ±141%      +0.1        0.35 ± 81%  perf-profile.calltrace.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64
      0.13 ±200%      -0.1        0.00            -0.0        0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
      0.32 ± 81%      -0.1        0.19 ±141%      -0.2        0.09 ±223%      -0.3        0.00        perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
      3.07 ± 25%      -0.1        2.95 ± 10%      +0.1        3.19 ± 11%      +0.2        3.29 ±  9%  perf-profile.calltrace.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      4.13 ± 22%      -0.1        4.02 ±  8%      +0.1        4.26 ±  9%      +0.2        4.37 ±  7%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      4.25 ± 21%      -0.1        4.14 ±  8%      +0.1        4.38 ±  8%      +0.3        4.50 ±  7%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__fxstat64
      0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
      0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.10 ±200%      -0.1        0.00            -0.0        0.10 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus
      0.10 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath
      0.68 ± 10%      -0.1        0.58 ± 11%      -0.1        0.58 ± 46%      -0.1        0.61 ±  9%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer
      9.18 ± 25%      -0.1        9.10 ± 12%      +0.4        9.63 ± 11%      +0.7        9.89 ± 10%  perf-profile.calltrace.cycles-pp.umount2
      0.36 ± 82%      -0.1        0.28 ±100%      -0.1        0.30 ±100%      -0.0        0.34 ± 81%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
      1.82 ± 24%      -0.1        1.75 ± 16%      -0.0        1.81 ±  9%      +0.1        1.95 ± 16%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
      8.78 ± 25%      -0.1        8.71 ± 12%      +0.4        9.22 ± 11%      +0.7        9.47 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      8.82 ± 25%      -0.1        8.75 ± 12%      +0.4        9.26 ± 11%      +0.7        9.52 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
      0.37 ± 81%      -0.1        0.30 ±101%      +0.0        0.39 ± 73%      -0.0        0.36 ± 82%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      0.24 ±122%      -0.1        0.18 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
      0.24 ±122%      -0.1        0.18 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.24 ±122%      -0.1        0.17 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.33 ± 81%      -0.1        0.26 ±100%      +0.1        0.40 ± 71%      -0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.36 ± 83%      -0.1        0.30 ±100%      +0.1        0.46 ± 46%      -0.0        0.35 ± 81%  perf-profile.calltrace.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      0.15 ±199%      -0.1        0.10 ±223%      -0.0        0.13 ±223%      +0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.14 ±200%      -0.1        0.09 ±223%      -0.0        0.13 ±223%      +0.1        0.21 ±122%  perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.33 ± 82%      -0.1        0.28 ±100%      -0.1        0.28 ±100%      -0.3        0.00        perf-profile.calltrace.cycles-pp.path_compare
      0.35 ± 81%      -0.0        0.30 ±100%      -0.3        0.10 ±223%      -0.3        0.00        perf-profile.calltrace.cycles-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
      1.89 ± 25%      -0.0        1.84 ±  9%      -0.0        1.85 ± 13%      -0.1        1.76 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath
      1.87 ± 25%      -0.0        1.83 ±  9%      -0.0        1.84 ± 12%      -0.1        1.74 ± 10%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64
      0.93 ± 23%      -0.0        0.89 ± 18%      +0.0        0.93 ± 17%      +0.1        0.99 ± 12%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      1.94 ± 25%      -0.0        1.90 ±  9%      -0.0        1.90 ± 13%      -0.1        1.81 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      2.09 ± 24%      -0.0        2.05 ± 15%      +0.1        2.14 ±  8%      +0.2        2.26 ± 14%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
      2.14 ± 23%      -0.0        2.10 ± 16%      +0.1        2.20 ±  8%      +0.2        2.34 ± 15%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
      2.06 ± 23%      -0.0        2.02 ± 15%      +0.1        2.12 ±  8%      +0.2        2.24 ± 15%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
      1.92 ± 25%      -0.0        1.88 ±  9%      -0.0        1.89 ± 13%      -0.1        1.80 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      0.59 ± 52%      -0.0        0.56 ± 48%      +0.1        0.68 ± 17%      +0.1        0.73 ± 10%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
      0.82 ± 26%      -0.0        0.79 ±  6%      +0.1        0.87 ± 14%      +0.1        0.88 ±  9%  perf-profile.calltrace.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      2.20 ± 24%      -0.0        2.17 ± 16%      +0.1        2.26 ±  8%      +0.2        2.39 ± 15%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
      0.78 ± 27%      -0.0        0.76 ± 19%      +0.0        0.79 ± 14%      +0.0        0.83 ± 13%  perf-profile.calltrace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thread.kthread
      0.11 ±200%      -0.0        0.09 ±223%      -0.0        0.11 ±223%      -0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp
      2.07 ± 25%      -0.0        2.05 ±  9%      -0.0        2.04 ± 13%      -0.1        1.96 ± 10%  perf-profile.calltrace.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
      0.97 ± 22%      -0.0        0.96 ±  8%      +0.0        1.00 ±  5%      -0.0        0.97 ±  7%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.37 ± 82%      -0.0        0.36 ± 70%      -0.4        0.00            -0.0        0.33 ± 81%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64
      0.66 ± 54%      -0.0        0.66 ± 12%      +0.0        0.71 ± 15%      +0.1        0.71 ±  8%  perf-profile.calltrace.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.__filename_parentat.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__wait_for_common.__synchronize_srcu.unregister_shrinker.deactivate_locked_super.cleanup_mnt
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64
      0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.99 ± 23%      +0.0        1.00 ±  8%      +0.0        1.03 ±  6%      -0.0        0.99 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.00 ± 23%      +0.0        1.01 ±  8%      +0.0        1.04 ±  6%      -0.0        1.00 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
      3.68 ± 16%      +0.0        3.68 ±  4%      +0.0        3.72 ±  9%      -0.1        3.60 ±  2%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      1.85 ± 23%      +0.0        1.86 ± 10%      -0.2        1.69 ± 12%      -0.1        1.74 ±  8%  perf-profile.calltrace.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
      0.65 ± 23%      +0.0        0.66 ±  5%      +0.0        0.67 ±  8%      +0.0        0.68 ±  6%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.41 ± 81%      +0.0        0.42 ± 72%      +0.1        0.52 ± 48%      +0.1        0.51 ± 51%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.84 ± 22%      +0.0        0.85 ±  9%      +0.0        0.86 ±  6%      -0.0        0.84 ±  7%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      3.77 ± 16%      +0.0        3.78 ±  4%      +0.0        3.82 ±  9%      -0.1        3.68 ±  2%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.36 ± 81%      +0.0        0.36 ± 71%      -0.1        0.28 ±100%      -0.2        0.21 ±122%  perf-profile.calltrace.cycles-pp.rdrand
      0.99 ± 18%      +0.0        1.00 ±  4%      +0.0        1.00 ±  8%      -0.0        0.98 ±  6%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.10 ± 25%      +0.0        1.11 ±  9%      +0.0        1.13 ±  6%      +0.0        1.10 ±  7%  perf-profile.calltrace.cycles-pp.__lxstat64
      1.64 ± 24%      +0.0        1.66 ± 13%      +0.1        1.72 ±  8%      +0.1        1.75 ± 12%  perf-profile.calltrace.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.98 ± 18%      +0.0        1.00 ±  4%      +0.0        0.99 ±  8%      -0.0        0.97 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.41 ± 23%      +0.0        1.42 ±  7%      -0.1        1.33 ± 14%      -0.1        1.31 ±  7%  perf-profile.calltrace.cycles-pp.siphash24_compress
      1.99 ± 24%      +0.0        2.00 ± 10%      +0.2        2.15 ± 10%      +0.2        2.23 ± 10%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.83 ± 25%      +0.0        0.85 ± 18%      +0.2        0.98 ± 10%      +0.1        0.93 ± 13%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
      2.53 ± 25%      +0.0        2.56 ± 15%      +0.1        2.65 ± 10%      +0.3        2.81 ± 13%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.72 ± 23%      +0.0        1.75 ± 16%      +0.1        1.78 ± 13%      +0.1        1.84 ± 11%  perf-profile.calltrace.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      1.00 ± 24%      +0.0        1.03 ± 18%      +0.1        1.15 ±  9%      +0.1        1.11 ± 14%  perf-profile.calltrace.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.15 ±200%      +0.0        0.18 ±142%      -0.0        0.14 ±223%      +0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.70 ± 50%      +0.0        0.74 ± 13%      +0.1        0.77 ± 14%      +0.1        0.76 ± 16%  perf-profile.calltrace.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      3.72 ± 26%      +0.0        3.76 ± 14%      +0.2        3.93 ± 13%      +0.3        4.04 ± 11%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.23 ±122%      +0.0        0.27 ±100%      +0.1        0.29 ±100%      -0.0        0.22 ±122%  perf-profile.calltrace.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.33 ± 26%      +0.0        3.38 ± 15%      +0.2        3.55 ± 13%      +0.3        3.63 ± 11%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.39 ± 23%      +0.0        2.44 ±  9%      -0.1        2.25 ± 13%      -0.1        2.31 ±  9%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.59 ± 32%      +0.1        1.64 ± 11%      +0.1        1.70 ± 12%      +0.2        1.75 ± 12%  perf-profile.calltrace.cycles-pp.unlink
      0.88 ± 25%      +0.1        0.93 ± 15%      +0.1        0.93 ± 11%      +0.1        0.96 ± 13%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
      2.58 ± 24%      +0.1        2.64 ±  9%      -0.1        2.46 ± 13%      -0.1        2.47 ±  8%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.25 ±125%      +0.1        0.31 ±100%      +0.0        0.30 ±103%      +0.1        0.35 ± 81%  perf-profile.calltrace.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread
      0.88 ± 25%      +0.1        0.94 ± 16%      +0.1        0.94 ± 12%      +0.1        0.97 ± 13%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
      2.80 ± 25%      +0.1        2.86 ±  8%      -0.0        2.79 ± 13%      -0.1        2.73 ±  9%  perf-profile.calltrace.cycles-pp.device_set_syspath.sd_device_new_from_syspath
      0.87 ± 28%      +0.1        0.93 ± 15%      +0.1        0.96 ± 17%      +0.1        1.00 ± 13%  perf-profile.calltrace.cycles-pp.process_srcu.process_one_work.worker_thread.kthread.ret_from_fork
      5.39 ± 26%      +0.1        5.45 ± 14%      +0.3        5.71 ± 11%      +0.4        5.83 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      2.60 ± 24%      +0.1        2.66 ±  9%      -0.1        2.49 ± 13%      -0.1        2.48 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.56 ± 24%      +0.1        2.63 ±  9%      -0.1        2.44 ± 13%      -0.1        2.45 ±  8%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.60 ± 24%      +0.1        2.67 ±  9%      -0.1        2.50 ± 13%      -0.1        2.49 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      2.48 ± 28%      +0.1        2.54 ± 12%      +0.2        2.64 ± 15%      +0.3        2.77 ± 10%  perf-profile.calltrace.cycles-pp.stress_rndstr
      0.58 ± 54%      +0.1        0.65 ± 50%      +0.2        0.75 ± 46%      +0.3        0.90 ± 26%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      1.23 ± 18%      +0.1        1.30 ±  4%      +0.1        1.30 ±  8%      +0.0        1.27 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      0.12 ±200%      +0.1        0.18 ±141%      -0.0        0.12 ±223%      -0.0        0.11 ±200%  perf-profile.calltrace.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work
      2.76 ± 17%      +0.1        2.83 ±  7%      +0.1        2.88 ±  8%      +0.1        2.85 ±  5%  perf-profile.calltrace.cycles-pp.open64
      1.34 ± 31%      +0.1        1.41 ± 11%      +0.1        1.46 ± 13%      +0.2        1.50 ± 12%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      1.52 ± 32%      +0.1        1.59 ± 12%      +0.1        1.64 ± 12%      +0.2        1.68 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      1.20 ± 18%      +0.1        1.28 ±  4%      +0.1        1.27 ±  8%      +0.1        1.25 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.50 ± 32%      +0.1        1.57 ± 12%      +0.1        1.63 ± 12%      +0.2        1.67 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.62 ± 55%      +0.1        0.69 ± 20%      +0.1        0.72 ± 16%      +0.1        0.75 ± 13%  perf-profile.calltrace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_work.worker_thread
      0.68 ± 54%      +0.1        0.75 ±  6%      +0.2        0.84 ± 14%      +0.2        0.84 ±  9%  perf-profile.calltrace.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run
      0.42 ± 82%      +0.1        0.50 ± 44%      -0.1        0.37 ± 70%      +0.2        0.58 ±  9%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.72 ± 24%      +0.1        0.80 ± 10%      +0.1        0.79 ±  8%      +0.1        0.81 ± 11%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      0.10 ±200%      +0.1        0.18 ±141%      +0.2        0.34 ± 70%      +0.2        0.27 ±126%  perf-profile.calltrace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.53 ± 82%      +0.1        0.61 ± 47%      +0.2        0.74 ± 19%      +0.2        0.75 ± 12%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.__slab_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.47 ± 50%      +0.1        0.56 ±  9%      -0.1        0.38 ± 71%      -0.1        0.34 ± 82%  perf-profile.calltrace.cycles-pp.device_read_db_internal_filename
      2.65 ± 24%      +0.1        2.73 ±  9%      -0.1        2.55 ± 13%      -0.1        2.53 ±  7%  perf-profile.calltrace.cycles-pp.read
      1.47 ± 32%      +0.1        1.56 ± 12%      +0.1        1.62 ± 12%      +0.2        1.65 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.69 ± 55%      +0.1        0.78 ± 11%      +0.2        0.86 ± 13%      +0.2        0.89 ± 12%  perf-profile.calltrace.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      1.29 ± 31%      +0.1        1.38 ±  8%      +0.0        1.30 ± 12%      +0.0        1.32 ± 12%  perf-profile.calltrace.cycles-pp.malloc
      2.65 ± 17%      +0.1        2.74 ±  7%      +0.1        2.78 ±  8%      +0.1        2.75 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      1.10 ± 29%      +0.1        1.19 ± 10%      +0.1        1.16 ±  9%      +0.1        1.19 ± 14%  perf-profile.calltrace.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      3.15 ± 24%      +0.1        3.24 ±  8%      +0.0        3.15 ± 13%      -0.1        3.08 ±  9%  perf-profile.calltrace.cycles-pp.sd_device_new_from_syspath
      2.63 ± 16%      +0.1        2.73 ±  6%      +0.1        2.76 ±  8%      +0.1        2.73 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      0.77 ± 23%      +0.1        0.86 ± 10%      +0.1        0.84 ±  7%      +0.1        0.86 ± 11%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
      2.59 ± 16%      +0.1        2.69 ±  6%      +0.1        2.72 ±  9%      +0.1        2.69 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.57 ± 16%      +0.1        2.68 ±  6%      +0.1        2.70 ±  9%      +0.1        2.67 ±  4%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      0.56 ± 53%      +0.1        0.67 ±  9%      +0.1        0.68 ±  6%      +0.1        0.64 ±  6%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.42 ± 17%      +0.1        1.53 ±  4%      +0.1        1.50 ±  9%      +0.0        1.44 ±  7%  perf-profile.calltrace.cycles-pp.__close
      0.00            +0.1        0.11 ±223%      +0.1        0.12 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.24 ± 29%      +0.1        1.36 ± 11%      +0.1        1.30 ± 10%      +0.1        1.35 ± 14%  perf-profile.calltrace.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      1.26 ± 28%      +0.1        1.38 ± 11%      +0.1        1.33 ±  9%      +0.1        1.36 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
      0.64 ± 54%      +0.1        0.76 ± 11%      +0.2        0.82 ± 12%      +0.1        0.79 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.26 ± 29%      +0.1        1.38 ± 11%      +0.1        1.32 ±  9%      +0.1        1.36 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.13 ±200%      +0.1        0.26 ±100%      +0.2        0.35 ± 70%      +0.1        0.21 ±122%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64
      0.66 ± 53%      +0.1        0.78 ± 16%      +0.1        0.76 ± 16%      +0.2        0.81 ± 13%  perf-profile.calltrace.cycles-pp.stress_mwc32
      0.65 ± 54%      +0.1        0.77 ± 11%      +0.2        0.83 ± 13%      +0.1        0.79 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      0.44 ± 82%      +0.1        0.57 ± 47%      +0.2        0.67 ± 14%      +0.2        0.69 ±  9%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      0.65 ± 53%      +0.1        0.78 ± 12%      +0.2        0.83 ± 12%      +0.1        0.80 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
      0.61 ± 53%      +0.1        0.74 ± 16%      +0.1        0.75 ± 15%      +0.2        0.77 ± 12%  perf-profile.calltrace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      0.38 ± 82%      +0.1        0.51 ± 45%      +0.0        0.41 ± 71%      +0.2        0.58 ±  8%  perf-profile.calltrace.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      1.30 ± 28%      +0.1        1.43 ± 11%      +0.1        1.37 ±  9%      +0.1        1.42 ± 12%  perf-profile.calltrace.cycles-pp.symlink
      0.60 ± 54%      +0.1        0.74 ± 18%      +0.2        0.76 ± 16%      +0.2        0.78 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      0.40 ± 81%      +0.1        0.54 ± 46%      +0.1        0.54 ± 48%      +0.2        0.64 ± 12%  perf-profile.calltrace.cycles-pp.__synchronize_srcu.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run
      0.60 ± 54%      +0.1        0.74 ± 18%      +0.2        0.77 ± 15%      +0.2        0.78 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
      0.68 ± 53%      +0.1        0.82 ± 12%      +0.2        0.88 ± 11%      +0.2        0.84 ± 12%  perf-profile.calltrace.cycles-pp.mkdir
      0.70 ± 54%      +0.2        0.85 ± 14%      +0.2        0.85 ± 17%      +0.2        0.85 ±  9%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.63 ± 54%      +0.2        0.80 ± 18%      +0.2        0.81 ± 15%      +0.2        0.82 ± 13%  perf-profile.calltrace.cycles-pp.rmdir
      0.61 ± 53%      +0.2        0.78 ± 24%      +0.2        0.79 ± 46%      +0.3        0.96 ± 25%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      0.63 ± 55%      +0.2        0.80 ± 15%      +0.2        0.80 ±  8%      +0.2        0.80 ± 13%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      0.00            +0.2        0.17 ±141%      +0.0        0.00            +0.2        0.21 ±122%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.60 ± 51%      +0.2        0.78 ±  3%      +0.2        0.78 ± 13%      +0.1        0.70 ± 11%  perf-profile.calltrace.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.48 ± 82%      +0.2        0.66 ± 14%      +0.2        0.68 ± 18%      +0.2        0.67 ±  8%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      0.61 ± 51%      +0.2        0.79 ±  3%      +0.2        0.78 ± 12%      +0.1        0.71 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.61 ± 51%      +0.2        0.80 ±  3%      +0.2        0.79 ± 12%      +0.1        0.72 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
      0.61 ± 51%      +0.2        0.80 ±  3%      +0.2        0.78 ± 13%      +0.1        0.72 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.49 ± 82%      +0.2        0.68 ± 12%      +0.2        0.70 ± 14%      +0.3        0.76 ± 13%  perf-profile.calltrace.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount
      0.00            +0.2        0.19 ±141%      +0.0        0.00            +0.2        0.25 ±122%  perf-profile.calltrace.cycles-pp.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.48 ± 81%      +0.2        0.68 ± 13%      +0.3        0.74 ± 13%      +0.2        0.71 ± 11%  perf-profile.calltrace.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      0.62 ± 50%      +0.2        0.83 ±  4%      +0.2        0.82 ± 12%      +0.1        0.74 ± 11%  perf-profile.calltrace.cycles-pp.readlinkat
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      0.47 ± 82%      +0.2        0.70 ±  8%      +0.2        0.68 ± 11%      +0.3        0.73 ± 15%  perf-profile.calltrace.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.49 ± 82%      +0.2        0.73 ± 17%      +0.3        0.75 ± 15%      +0.3        0.76 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      3.47 ± 25%      +0.6        4.06 ± 14%      +0.7        4.18 ± 11%      +0.8        4.22 ± 10%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      4.38 ± 24%      +0.7        5.08 ± 13%      +0.8        5.17 ± 10%      +0.9        5.25 ± 10%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
      0.32 ± 81%      +0.7        1.04 ± 90%      +0.3        0.64 ±113%      +0.7        1.04 ± 97%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +0.9        0.94 ± 15%      +0.9        0.87 ± 14%      +0.9        0.87 ± 11%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
      0.00            +1.0        0.97 ± 92%      +0.6        0.57 ±113%      +1.0        0.98 ± 98%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
      0.00            +1.0        0.98 ± 92%      +0.6        0.58 ±113%      +1.0        0.99 ± 98%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
      0.00            +1.0        1.00 ± 92%      +0.6        0.58 ±113%      +1.0        1.00 ± 98%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +1.0        1.00 ± 92%      +0.6        0.58 ±113%      +1.0        1.00 ± 98%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.calltrace.cycles-pp.ret_from_fork
      4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
      0.00            +1.5        1.45 ± 50%      +2.1        2.08 ± 21%      +2.3        2.34 ±  4%  perf-profile.calltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
      0.00            +4.3        4.27 ± 29%      +5.5        5.47 ± 17%      +6.0        5.96 ±  5%  perf-profile.calltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
      2.84 ± 30%      +4.6        7.44 ± 18%      +6.1        8.92 ± 16%      +6.6        9.42 ±  6%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
      2.85 ± 30%      +4.6        7.46 ± 18%      +6.1        8.94 ± 16%      +6.6        9.44 ±  6%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.97 ± 28%      +4.7       12.64 ± 14%      +6.3       14.28 ± 13%      +7.1       15.02 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
      7.93 ± 28%      +4.7       12.60 ± 14%      +6.3       14.25 ± 13%      +7.0       14.98 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      1.56 ± 29%      +4.7        6.23 ± 21%      +6.0        7.55 ± 16%      +6.5        8.04 ±  5%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
      7.95 ± 28%      +4.7       12.62 ± 14%      +6.3       14.27 ± 13%      +7.0       15.00 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      8.02 ± 28%      +4.7       12.69 ± 14%      +6.3       14.34 ± 13%      +7.1       15.07 ±  8%  perf-profile.calltrace.cycles-pp.mount
      1.68 ± 30%      +4.7        6.36 ± 21%      +6.0        7.72 ± 16%      +6.5        8.20 ±  5%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      7.20 ± 28%      +4.7       11.89 ± 15%      +6.3       13.52 ± 13%      +7.0       14.19 ±  9%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      0.00            +4.9        4.90 ± 25%      +6.2        6.17 ± 16%      +6.6        6.61 ±  5%  perf-profile.calltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
     42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.children.cycles-pp.start_secondary
     42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.cpu_startup_entry
     42.91 ± 22%      -6.6       36.32 ±  8%      -8.2       34.68 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.do_idle
     42.18 ± 23%      -6.6       35.61 ±  9%      -8.2       33.97 ± 11%      -9.0       33.21 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
     41.57 ± 23%      -6.5       35.07 ±  9%      -8.2       33.34 ± 11%      -9.0       32.58 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
     41.57 ± 23%      -6.5       35.08 ±  9%      -8.2       33.35 ± 11%      -9.0       32.58 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
     37.09 ± 26%      -6.1       30.96 ± 10%      -8.1       28.98 ± 12%      -8.5       28.64 ±  8%  perf-profile.children.cycles-pp.intel_idle
      5.40 ±  7%      -1.0        4.35 ± 11%      -0.4        5.01 ± 14%      -1.0        4.37 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      5.01 ±  6%      -1.0        4.00 ± 12%      -0.4        4.64 ± 15%      -1.0        4.02 ± 17%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      2.16 ± 21%      -0.7        1.51 ± 51%      -0.3        1.87 ± 41%      -0.6        1.55 ± 61%  perf-profile.children.cycles-pp.__irq_exit_rcu
      2.51 ± 11%      -0.3        2.19 ±  8%      -0.1        2.46 ± 16%      -0.4        2.11 ±  9%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.53 ± 11%      -0.3        2.21 ±  8%      -0.0        2.48 ± 16%      -0.4        2.13 ±  9%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.47 ± 15%      -0.3        1.20 ± 19%      +0.0        1.51 ± 25%      -0.2        1.29 ± 20%  perf-profile.children.cycles-pp.clock_nanosleep
      2.09 ± 12%      -0.2        1.85 ±  7%      -0.1        2.02 ± 16%      -0.4        1.72 ±  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      1.31 ± 15%      -0.2        1.07 ± 19%      +0.0        1.34 ± 25%      -0.2        1.15 ± 21%  perf-profile.children.cycles-pp.common_nsleep
      1.28 ± 15%      -0.2        1.04 ± 19%      +0.0        1.31 ± 25%      -0.2        1.13 ± 21%  perf-profile.children.cycles-pp.do_nanosleep
      1.34 ± 14%      -0.2        1.10 ± 19%      +0.0        1.37 ± 25%      -0.2        1.17 ± 21%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      1.18 ± 30%      -0.2        0.94 ± 16%      -0.2        0.97 ± 18%      -0.2        1.00 ± 11%  perf-profile.children.cycles-pp.__percpu_init_rwsem
      1.56 ± 13%      -0.2        1.38 ±  8%      -0.1        1.51 ± 17%      -0.3        1.30 ±  8%  perf-profile.children.cycles-pp.tick_sched_timer
      1.43 ± 11%      -0.2        1.26 ±  9%      -0.1        1.38 ± 15%      -0.2        1.21 ±  7%  perf-profile.children.cycles-pp.tick_sched_handle
      1.42 ± 11%      -0.2        1.25 ±  9%      -0.1        1.37 ± 15%      -0.2        1.20 ±  7%  perf-profile.children.cycles-pp.update_process_times
      1.34 ± 15%      -0.2        1.18 ± 17%      +0.1        1.41 ± 27%      -0.1        1.26 ± 17%  perf-profile.children.cycles-pp.newidle_balance
      1.26 ± 14%      -0.1        1.12 ± 17%      +0.0        1.31 ± 26%      -0.1        1.15 ± 16%  perf-profile.children.cycles-pp.load_balance
      1.12 ± 15%      -0.1        0.98 ± 18%      +0.0        1.17 ± 25%      -0.1        1.02 ± 17%  perf-profile.children.cycles-pp.update_sd_lb_stats
      1.15 ± 15%      -0.1        1.01 ± 18%      +0.0        1.19 ± 26%      -0.1        1.04 ± 17%  perf-profile.children.cycles-pp.find_busiest_group
      4.71 ± 20%      -0.1        4.57 ±  7%      +0.1        4.83 ±  7%      +0.2        4.91 ±  7%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.13 ±  9%      -0.1        1.00 ±  8%      -0.0        1.09 ± 12%      -0.1        0.99 ±  8%  perf-profile.children.cycles-pp.scheduler_tick
      4.32 ± 21%      -0.1        4.19 ±  7%      +0.1        4.44 ±  8%      +0.2        4.54 ±  7%  perf-profile.children.cycles-pp.task_work_run
      1.00 ± 16%      -0.1        0.88 ± 19%      +0.0        1.03 ± 25%      -0.1        0.92 ± 18%  perf-profile.children.cycles-pp.update_sg_lb_stats
      3.08 ± 25%      -0.1        2.96 ± 10%      +0.1        3.20 ± 11%      +0.2        3.30 ±  9%  perf-profile.children.cycles-pp.cleanup_mnt
      0.79 ± 26%      -0.1        0.68 ± 11%      -0.0        0.74 ± 15%      -0.0        0.76 ±  8%  perf-profile.children.cycles-pp.mnt_get_writers
      0.69 ± 18%      -0.1        0.60 ± 13%      -0.1        0.60 ± 12%      -0.1        0.57 ± 10%  perf-profile.children.cycles-pp.path_init
      0.49 ± 19%      -0.1        0.40 ± 10%      -0.0        0.48 ± 19%      +0.0        0.50 ± 14%  perf-profile.children.cycles-pp.menu_select
      0.59 ± 33%      -0.1        0.50 ± 17%      -0.0        0.57 ± 12%      -0.0        0.57 ± 14%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      0.81 ± 31%      -0.1        0.72 ± 14%      -0.0        0.80 ± 13%      -0.0        0.79 ± 13%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
      0.77 ±  8%      -0.1        0.69 ± 10%      -0.0        0.76 ± 15%      -0.1        0.72 ±  8%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.27 ± 19%      -0.1        0.19 ± 25%      -0.1        0.20 ± 23%      -0.1        0.17 ± 19%  perf-profile.children.cycles-pp.ep_poll
      0.21 ± 37%      -0.1        0.14 ± 24%      -0.0        0.21 ± 33%      +0.0        0.23 ± 30%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      9.23 ± 26%      -0.1        9.16 ± 12%      +0.5        9.68 ± 11%      +0.7        9.94 ± 10%  perf-profile.children.cycles-pp.umount2
      0.28 ± 21%      -0.1        0.20 ± 24%      -0.1        0.22 ± 23%      -0.1        0.19 ± 16%  perf-profile.children.cycles-pp.do_epoll_wait
      0.76 ±  8%      -0.1        0.68 ± 10%      -0.0        0.75 ± 16%      -0.0        0.71 ±  7%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.34 ± 18%      -0.1        0.26 ± 25%      -0.1        0.28 ± 21%      -0.1        0.24 ± 12%  perf-profile.children.cycles-pp.epoll_wait
      1.94 ± 15%      -0.1        1.87 ± 10%      +0.1        2.07 ± 18%      -0.0        1.92 ±  8%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.28 ± 19%      -0.1        0.21 ± 26%      -0.1        0.22 ± 23%      -0.1        0.19 ± 16%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      2.33 ± 24%      -0.1        2.27 ± 16%      +0.0        2.35 ± 11%      +0.2        2.49 ± 15%  perf-profile.children.cycles-pp.alloc_vfsmnt
      0.28 ± 10%      -0.1        0.22 ± 21%      +0.0        0.28 ± 17%      -0.0        0.24 ± 20%  perf-profile.children.cycles-pp.clockevents_program_event
      0.14 ± 56%      -0.1        0.08 ± 23%      +0.0        0.16 ± 39%      +0.0        0.18 ± 36%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.47 ± 20%      -0.1        0.42 ± 12%      -0.0        0.42 ± 17%      -0.0        0.45 ±  5%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.18 ± 23%      -0.1        1.12 ± 16%      +0.0        1.20 ± 16%      +0.1        1.26 ± 11%  perf-profile.children.cycles-pp.mntput_no_expire
      1.17 ± 30%      -0.1        1.12 ± 12%      +0.0        1.21 ± 13%      +0.0        1.20 ± 14%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      0.33 ± 21%      -0.0        0.28 ±  8%      -0.0        0.31 ± 10%      -0.0        0.29 ± 13%  perf-profile.children.cycles-pp.dequeue_entity
      0.16 ± 22%      -0.0        0.11 ± 38%      -0.0        0.11 ± 35%      -0.1        0.09 ± 37%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.08 ± 27%      -0.0        0.03 ±100%      -0.0        0.07 ± 23%      -0.0        0.04 ± 87%  perf-profile.children.cycles-pp.llist_reverse_order
      0.39 ± 59%      -0.0        0.34 ± 64%      -0.1        0.34 ± 87%      -0.0        0.38 ± 64%  perf-profile.children.cycles-pp.ktime_get
      0.06 ± 56%      -0.0        0.01 ±223%      -0.0        0.03 ±102%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp._ext4_show_options
      0.56 ± 29%      -0.0        0.51 ± 11%      -0.1        0.48 ± 10%      -0.1        0.50 ± 16%  perf-profile.children.cycles-pp.__xstat64
      0.20 ± 23%      -0.0        0.15 ± 23%      -0.0        0.15 ± 30%      -0.1        0.15 ± 20%  perf-profile.children.cycles-pp.__sys_recvmsg
      0.42 ± 32%      -0.0        0.37 ± 18%      +0.0        0.44 ± 12%      +0.0        0.45 ± 21%  perf-profile.children.cycles-pp.ramfs_fill_super
      0.18 ± 11%      -0.0        0.13 ± 16%      -0.0        0.15 ± 23%      -0.0        0.15 ± 32%  perf-profile.children.cycles-pp.read_tsc
      1.23 ± 20%      -0.0        1.19 ±  8%      +0.1        1.29 ±  9%      +0.0        1.28 ± 11%  perf-profile.children.cycles-pp.dput
      0.53 ± 27%      -0.0        0.49 ± 16%      -0.0        0.49 ±  8%      -0.1        0.47 ± 12%  perf-profile.children.cycles-pp.strcmp@plt
      0.13 ± 36%      -0.0        0.08 ± 13%      -0.0        0.09 ± 19%      -0.0        0.08 ± 15%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
      0.28 ±  8%      -0.0        0.24 ± 19%      -0.0        0.27 ± 19%      -0.0        0.25 ± 12%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.54 ± 29%      -0.0        0.50 ± 14%      +0.0        0.56 ± 14%      +0.0        0.56 ± 18%  perf-profile.children.cycles-pp.__dentry_kill
      1.56 ± 24%      -0.0        1.52 ± 14%      +0.0        1.60 ± 15%      +0.2        1.74 ± 10%  perf-profile.children.cycles-pp.mnt_get_count
      0.60 ± 30%      -0.0        0.56 ± 13%      +0.0        0.62 ± 15%      +0.0        0.62 ± 17%  perf-profile.children.cycles-pp.dentry_kill
      0.18 ± 21%      -0.0        0.14 ± 26%      -0.0        0.14 ± 29%      -0.0        0.14 ± 20%  perf-profile.children.cycles-pp.___sys_recvmsg
      2.09 ± 23%      -0.0        2.05 ± 15%      +0.1        2.14 ±  8%      +0.2        2.26 ± 14%  perf-profile.children.cycles-pp.copy_tree
      0.13 ± 17%      -0.0        0.09 ± 23%      -0.0        0.11 ± 23%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.28 ± 22%      -0.0        0.24 ± 15%      -0.0        0.24 ± 16%      -0.0        0.25 ±  5%  perf-profile.children.cycles-pp.__wake_up_common
      0.16 ± 26%      -0.0        0.12 ± 27%      -0.0        0.14 ± 29%      -0.0        0.12 ± 19%  perf-profile.children.cycles-pp.____sys_recvmsg
      2.06 ± 23%      -0.0        2.02 ± 15%      +0.1        2.12 ±  8%      +0.2        2.24 ± 15%  perf-profile.children.cycles-pp.clone_mnt
      0.21 ± 13%      -0.0        0.17 ± 22%      +0.0        0.22 ± 20%      -0.0        0.19 ± 21%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.16 ± 25%      -0.0        0.12 ± 28%      -0.0        0.13 ± 28%      -0.0        0.12 ± 21%  perf-profile.children.cycles-pp.sock_recvmsg
      0.08 ± 18%      -0.0        0.04 ± 72%      -0.0        0.05 ± 73%      -0.0        0.05 ± 57%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
      0.13 ± 18%      -0.0        0.09 ± 27%      -0.0        0.11 ± 24%      -0.0        0.09 ±  8%  perf-profile.children.cycles-pp.ct_kernel_enter
      1.20 ± 15%      -0.0        1.16 ±  6%      -0.0        1.18 ±  8%      -0.0        1.15 ±  9%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.14 ± 16%      -0.0        0.10 ± 27%      -0.0        0.11 ± 23%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.ct_idle_exit
      0.24 ± 10%      -0.0        0.20 ± 12%      -0.0        0.20 ± 19%      -0.0        0.20 ± 11%  perf-profile.children.cycles-pp.update_blocked_averages
      2.14 ± 23%      -0.0        2.11 ± 16%      +0.1        2.20 ±  8%      +0.2        2.34 ± 15%  perf-profile.children.cycles-pp.propagate_one
      0.21 ± 34%      -0.0        0.18 ± 10%      -0.0        0.19 ± 13%      -0.0        0.19 ± 20%  perf-profile.children.cycles-pp.up_read
      0.74 ± 27%      -0.0        0.71 ± 20%      +0.0        0.74 ± 15%      +0.0        0.79 ± 14%  perf-profile.children.cycles-pp.try_check_zero
      0.07 ± 61%      -0.0        0.03 ±100%      -0.0        0.05 ± 76%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.xas_find
      0.25 ± 29%      -0.0        0.21 ± 18%      -0.1        0.19 ± 19%      -0.1        0.19 ± 22%  perf-profile.children.cycles-pp.__sys_sendmsg
      0.03 ± 82%      -0.0        0.00            +0.0        0.04 ±102%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.idr_alloc
      0.05 ± 53%      -0.0        0.02 ±142%      -0.0        0.05 ± 80%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.23 ± 25%      -0.0        0.20 ±  6%      -0.0        0.21 ± 21%      -0.1        0.18 ± 23%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.22 ± 28%      -0.0        0.18 ± 15%      -0.1        0.16 ± 23%      -0.1        0.16 ± 20%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.20 ± 28%      -0.0        0.17 ± 24%      -0.0        0.18 ± 14%      -0.0        0.18 ± 20%  perf-profile.children.cycles-pp.pcpu_block_update_hint_alloc
      0.22 ± 30%      -0.0        0.19 ± 13%      -0.1        0.17 ± 20%      -0.1        0.17 ± 21%  perf-profile.children.cycles-pp.sock_sendmsg
      0.03 ± 82%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.strcmp_ptr
      0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.execve
      0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.do_execveat_common
      0.03 ± 82%      -0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.__isoc99_sscanf
      0.03 ± 82%      -0.0        0.00            +0.0        0.04 ±102%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.idr_alloc_u32
      0.15 ± 25%      -0.0        0.12 ± 30%      -0.0        0.11 ± 32%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.unix_stream_read_generic
      0.15 ± 25%      -0.0        0.12 ± 30%      -0.0        0.11 ± 30%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      0.13 ± 23%      -0.0        0.10 ± 34%      -0.0        0.08 ± 28%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp.__libc_recvmsg
      0.22 ± 28%      -0.0        0.19 ± 14%      -0.0        0.18 ± 20%      -0.1        0.17 ± 21%  perf-profile.children.cycles-pp.____sys_sendmsg
      0.13 ± 29%      -0.0        0.10 ± 19%      -0.0        0.12 ± 12%      -0.0        0.11 ± 19%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.03 ± 81%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_stream_read_actor
      0.03 ±200%      -0.0        0.00            +0.0        0.04 ±147%      +0.0        0.07 ± 81%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.38 ± 20%      -0.0        0.35 ±  8%      +0.0        0.40 ± 12%      +0.0        0.38 ± 14%  perf-profile.children.cycles-pp.dequeue_task_fair
      4.75 ± 19%      -0.0        4.72 ±  7%      +0.1        4.88 ±  7%      +0.2        4.99 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      4.87 ± 19%      -0.0        4.84 ±  7%      +0.1        5.00 ±  7%      +0.2        5.09 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.17 ± 44%      -0.0        0.14 ± 21%      -0.0        0.15 ± 14%      -0.0        0.17 ±  8%  perf-profile.children.cycles-pp.apparmor_capable
      0.09 ± 26%      -0.0        0.06 ± 11%      -0.0        0.08 ± 52%      -0.1        0.04 ± 87%  perf-profile.children.cycles-pp.__pthread_mutex_lock
      0.09 ± 39%      -0.0        0.06 ± 49%      -0.0        0.08 ± 14%      -0.0        0.07 ± 20%  perf-profile.children.cycles-pp.__get_fs_type
      0.04 ± 82%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.calc_global_load_tick
      0.33 ± 20%      -0.0        0.30 ± 13%      -0.1        0.28 ± 14%      -0.0        0.29 ± 10%  perf-profile.children.cycles-pp.seq_path_root
      0.69 ± 22%      -0.0        0.66 ± 14%      -0.1        0.59 ± 13%      -0.1        0.57 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.24 ± 30%      -0.0        0.21 ± 16%      -0.0        0.19 ± 19%      -0.0        0.19 ± 22%  perf-profile.children.cycles-pp.___sys_sendmsg
      0.04 ± 87%      -0.0        0.01 ±223%      -0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.enqueue_hrtimer
      0.10 ± 10%      -0.0        0.07 ± 47%      -0.0        0.08 ± 26%      -0.0        0.09 ± 11%  perf-profile.children.cycles-pp.path_put
      0.06 ± 15%      -0.0        0.04 ± 71%      -0.0        0.05 ± 45%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.04 ± 88%      -0.0        0.02 ±141%      +0.0        0.05 ± 56%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.strjoin_real
      0.22 ± 47%      -0.0        0.20 ± 23%      -0.0        0.19 ± 16%      -0.0        0.22 ±  9%  perf-profile.children.cycles-pp.security_capable
      0.06 ± 51%      -0.0        0.04 ± 71%      -0.0        0.06 ± 52%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.49 ± 29%      -0.0        0.46 ± 10%      +0.0        0.52 ± 11%      +0.0        0.52 ± 21%  perf-profile.children.cycles-pp.ramfs_get_inode
      2.20 ± 24%      -0.0        2.18 ± 16%      +0.1        2.27 ±  8%      +0.2        2.39 ± 15%  perf-profile.children.cycles-pp.propagate_mnt
      0.82 ± 26%      -0.0        0.79 ±  6%      +0.1        0.87 ± 14%      +0.1        0.88 ±  9%  perf-profile.children.cycles-pp.kill_litter_super
      0.11 ± 27%      -0.0        0.08 ± 27%      +0.0        0.12 ± 28%      +0.0        0.11 ± 28%  perf-profile.children.cycles-pp.xas_load
      0.72 ± 30%      -0.0        0.69 ± 19%      +0.0        0.75 ± 19%      +0.0        0.76 ± 12%  perf-profile.children.cycles-pp.shmem_fill_super
      0.03 ±127%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.03 ±127%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_add
      0.15 ± 35%      -0.0        0.12 ± 14%      -0.0        0.12 ± 31%      -0.0        0.12 ± 29%  perf-profile.children.cycles-pp.sendmsg
      0.03 ± 84%      -0.0        0.01 ±223%      -0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.__libc_start_main
      0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.main
      0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.run_builtin
      0.07 ± 55%      -0.0        0.05 ± 72%      -0.0        0.05 ± 46%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.sock_def_readable
      0.10 ± 28%      -0.0        0.07 ± 21%      +0.0        0.10 ± 41%      -0.0        0.06 ± 56%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.04 ± 83%      -0.0        0.01 ±223%      +0.0        0.06 ± 50%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.perf_pmu_nop_void
      0.28 ± 33%      -0.0        0.25 ± 13%      -0.1        0.22 ± 11%      -0.1        0.21 ± 17%  perf-profile.children.cycles-pp.unit_name_is_valid
      0.06 ± 21%      -0.0        0.03 ±102%      -0.0        0.05 ± 80%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.current_time
      0.78 ± 27%      -0.0        0.76 ± 19%      +0.0        0.79 ± 14%      +0.0        0.83 ± 13%  perf-profile.children.cycles-pp.srcu_advance_state
      0.10 ± 30%      -0.0        0.08 ± 21%      -0.0        0.08 ± 49%      -0.0        0.08 ± 28%  perf-profile.children.cycles-pp.recvmsg
      0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.seq_release
      0.02 ±125%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.balance_fair
      0.08 ± 19%      -0.0        0.06 ± 48%      -0.0        0.07 ± 19%      -0.0        0.07 ± 22%  perf-profile.children.cycles-pp.ep_send_events
      0.19 ± 15%      -0.0        0.16 ± 14%      -0.0        0.18 ±  8%      -0.0        0.15 ± 12%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.79 ± 15%      -0.0        0.77 ±  9%      +0.1        0.85 ±  6%      +0.0        0.80 ±  8%  perf-profile.children.cycles-pp.inode_permission
      0.21 ± 42%      -0.0        0.19 ± 24%      -0.0        0.19 ± 14%      +0.0        0.21 ± 12%  perf-profile.children.cycles-pp.ns_capable
      0.05 ± 58%      -0.0        0.03 ±103%      -0.0        0.01 ±223%      -0.0        0.03 ±123%  perf-profile.children.cycles-pp.consume_skb
      0.12 ± 15%      -0.0        0.10 ± 11%      -0.0        0.09 ± 20%      -0.0        0.09 ± 25%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.02 ±123%      -0.0        0.00            -0.0        0.00            +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.___d_drop
      0.02 ±123%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.get_random_u32
      0.28 ± 24%      -0.0        0.26 ± 15%      -0.1        0.22 ± 10%      -0.1        0.22 ±  9%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.21 ± 11%      -0.0        0.19 ± 10%      -0.0        0.20 ± 15%      -0.0        0.19 ± 12%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.27 ± 29%      -0.0        0.25 ± 18%      -0.0        0.26 ± 26%      -0.0        0.23 ± 21%  perf-profile.children.cycles-pp.smp_call_function_single
      0.59 ± 28%      -0.0        0.57 ± 13%      -0.0        0.58 ± 14%      +0.0        0.60 ±  9%  perf-profile.children.cycles-pp.__d_alloc
      0.41 ± 24%      -0.0        0.38 ±  9%      -0.1        0.35 ± 10%      -0.0        0.36 ± 13%  perf-profile.children.cycles-pp.do_dentry_open
      0.06 ± 53%      -0.0        0.04 ±109%      -0.0        0.03 ±106%      -0.0        0.03 ±122%  perf-profile.children.cycles-pp.sync_regs
      0.15 ± 21%      -0.0        0.12 ± 21%      -0.0        0.13 ± 35%      -0.0        0.12 ± 20%  perf-profile.children.cycles-pp.rebalance_domains
      0.03 ± 84%      -0.0        0.01 ±223%      -0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.asm_exc_page_fault
      0.05 ± 52%      -0.0        0.03 ±103%      -0.0        0.03 ±100%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.device_get_id_filename
      0.12 ± 29%      -0.0        0.10 ±  8%      -0.0        0.10 ± 16%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.shmem_show_options
      2.88 ± 15%      -0.0        2.86 ±  5%      -0.0        2.84 ±  7%      -0.1        2.78 ±  4%  perf-profile.children.cycles-pp.path_lookupat
      0.25 ± 26%      -0.0        0.23 ±  9%      -0.0        0.24 ± 11%      -0.0        0.25 ± 12%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.05 ± 55%      -0.0        0.03 ±100%      -0.0        0.03 ±100%      -0.0        0.03 ± 84%  perf-profile.children.cycles-pp.update_cfs_group
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__d_rehash
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__skb_datagram_iter
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp._find_first_bit
      0.02 ±122%      -0.0        0.00            -0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.greedy_realloc
      0.02 ±122%      -0.0        0.00            -0.0        0.02 ±141%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.21 ± 20%      -0.0        0.19 ± 17%      -0.0        0.19 ± 13%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.ep_poll_callback
      0.48 ± 22%      -0.0        0.46 ± 10%      +0.0        0.50 ± 12%      +0.0        0.49 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      0.03 ±124%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.36 ± 23%      -0.0        0.34 ±  8%      -0.0        0.36 ± 12%      +0.0        0.40 ±  8%  perf-profile.children.cycles-pp.sync_filesystem
      0.21 ± 21%      -0.0        0.19 ±  9%      -0.0        0.20 ± 13%      -0.0        0.18 ±  9%  perf-profile.children.cycles-pp.rcu_all_qs
      0.12 ± 17%      -0.0        0.10 ± 22%      -0.0        0.11 ± 10%      -0.0        0.09 ± 17%  perf-profile.children.cycles-pp.perf_rotate_context
      0.13 ± 23%      -0.0        0.11 ± 22%      -0.0        0.09 ± 34%      -0.0        0.08 ± 20%  perf-profile.children.cycles-pp.__libc_sendmsg
      0.82 ± 22%      -0.0        0.80 ±  3%      -0.0        0.81 ±  9%      -0.0        0.80 ±  6%  perf-profile.children.cycles-pp.__fput
      0.29 ± 26%      -0.0        0.27 ± 25%      -0.0        0.28 ± 13%      +0.0        0.31 ±  9%  perf-profile.children.cycles-pp.srcu_gp_start_if_needed
      0.78 ± 26%      -0.0        0.76 ±  6%      +0.1        0.85 ± 14%      +0.1        0.84 ±  9%  perf-profile.children.cycles-pp.generic_shutdown_super
      0.32 ± 32%      -0.0        0.30 ± 22%      +0.0        0.34 ± 18%      +0.0        0.36 ± 19%  perf-profile.children.cycles-pp.d_make_root
      0.91 ± 31%      -0.0        0.90 ± 14%      +0.1        0.99 ± 15%      +0.0        0.95 ± 18%  perf-profile.children.cycles-pp.new_inode
      0.20 ± 35%      -0.0        0.18 ± 18%      -0.0        0.18 ± 15%      +0.0        0.22 ± 16%  perf-profile.children.cycles-pp.vfs_parse_fs_param
      0.20 ± 29%      -0.0        0.18 ± 15%      -0.0        0.19 ± 11%      +0.0        0.20 ± 16%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.49 ± 30%      -0.0        0.47 ± 13%      -0.1        0.43 ± 10%      -0.0        0.44 ± 16%  perf-profile.children.cycles-pp.__do_sys_newstat
      0.29 ± 20%      -0.0        0.27 ±  7%      -0.0        0.27 ±  7%      -0.0        0.26 ±  8%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.24 ± 15%      -0.0        0.22 ± 11%      -0.0        0.22 ± 20%      -0.0        0.21 ± 11%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.03 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.trigger_load_balance
      0.04 ± 90%      -0.0        0.02 ±144%      -0.0        0.02 ±142%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.11 ± 36%      -0.0        0.09 ± 26%      -0.0        0.10 ± 12%      -0.0        0.09 ± 19%  perf-profile.children.cycles-pp.get_fs_type
      0.03 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.check_stack_object
      0.08 ± 62%      -0.0        0.06 ± 15%      -0.0        0.06 ± 23%      +0.0        0.08 ± 51%  perf-profile.children.cycles-pp.generic_parse_monolithic
      0.32 ± 24%      -0.0        0.31 ± 14%      +0.0        0.33 ± 15%      -0.0        0.30 ± 15%  perf-profile.children.cycles-pp.cp_new_stat
      0.30 ± 29%      -0.0        0.29 ±  9%      +0.0        0.32 ± 10%      +0.0        0.35 ± 13%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
      0.43 ± 20%      -0.0        0.42 ± 10%      -0.0        0.39 ±  7%      -0.0        0.41 ±  7%  perf-profile.children.cycles-pp.do_open
      0.20 ± 25%      -0.0        0.18 ± 27%      -0.0        0.18 ± 14%      -0.0        0.17 ± 18%  perf-profile.children.cycles-pp.finish_task_switch
      0.14 ± 39%      -0.0        0.12 ± 26%      -0.0        0.13 ± 14%      +0.0        0.15 ±  6%  perf-profile.children.cycles-pp.__list_lru_init
      0.09 ± 24%      -0.0        0.07 ±  9%      -0.0        0.07 ± 55%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.87 ± 22%      -0.0        0.85 ±  8%      -0.0        0.85 ± 11%      -0.0        0.86 ±  9%  perf-profile.children.cycles-pp.kmem_cache_free
      0.15 ± 23%      -0.0        0.13 ± 16%      -0.0        0.14 ±  9%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.set_root
      0.02 ±200%      -0.0        0.00            +0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.inode_init_once
      0.19 ± 11%      -0.0        0.17 ± 16%      -0.0        0.18 ± 30%      -0.1        0.13 ±  8%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.36 ± 11%      -0.0        0.34 ±  6%      -0.0        0.31 ± 10%      -0.0        0.33 ±  7%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
      0.35 ± 17%      -0.0        0.33 ± 10%      +0.0        0.35 ± 16%      +0.0        0.35 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.mounts_open_common
      0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.fsnotify_sb_delete
      0.02 ±125%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±123%  perf-profile.children.cycles-pp.try_charge_memcg
      0.03 ± 82%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__socket
      0.09 ± 20%      -0.0        0.08 ± 22%      -0.0        0.09 ± 33%      -0.0        0.08 ± 17%  perf-profile.children.cycles-pp.__fget_light
      0.03 ± 82%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__sys_socket
      0.16 ± 20%      -0.0        0.14 ± 11%      -0.0        0.13 ± 24%      -0.0        0.13 ± 12%  perf-profile.children.cycles-pp.mangle_path
      0.16 ± 53%      -0.0        0.14 ± 29%      +0.0        0.16 ± 15%      -0.0        0.15 ± 15%  perf-profile.children.cycles-pp.__lookup_mnt
      0.17 ± 19%      -0.0        0.16 ± 21%      -0.0        0.16 ±  9%      -0.0        0.16 ± 11%  perf-profile.children.cycles-pp.nd_jump_root
      0.30 ± 35%      -0.0        0.28 ± 14%      -0.0        0.28 ± 12%      +0.0        0.31 ± 15%  perf-profile.children.cycles-pp.vfs_parse_fs_string
      0.09 ± 56%      -0.0        0.07 ± 20%      -0.0        0.08 ± 24%      +0.0        0.09 ± 15%  perf-profile.children.cycles-pp.strspn@plt
      0.06 ± 58%      -0.0        0.04 ± 72%      -0.0        0.04 ± 71%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.31 ± 19%      -0.0        0.29 ± 12%      +0.0        0.31 ± 16%      -0.0        0.29 ±  9%  perf-profile.children.cycles-pp.down_read
      0.16 ± 23%      -0.0        0.15 ± 25%      -0.0        0.14 ± 29%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.02 ±144%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.task_tick_fair
      0.17 ± 24%      -0.0        0.16 ± 11%      +0.0        0.18 ± 15%      +0.0        0.18 ± 10%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.11 ±  6%      -0.0        0.10 ± 23%      -0.0        0.10 ± 30%      -0.0        0.10 ± 16%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.05 ± 90%      -0.0        0.04 ± 72%      -0.0        0.04 ±105%      -0.0        0.03 ±123%  perf-profile.children.cycles-pp.mnt_fstype_is_pseudofs
      0.03 ± 82%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_socket
      0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_kthread
      0.09 ± 23%      -0.0        0.08 ±  8%      -0.0        0.07 ± 47%      -0.0        0.08 ± 19%  perf-profile.children.cycles-pp.generic_fillattr
      0.39 ± 17%      -0.0        0.38 ± 20%      -0.0        0.36 ± 22%      -0.0        0.36 ± 13%  perf-profile.children.cycles-pp.schedule_idle
      0.40 ± 22%      -0.0        0.39 ±  9%      -0.0        0.38 ±  9%      +0.0        0.43 ±  9%  perf-profile.children.cycles-pp.vfs_fstat
      0.03 ± 81%      -0.0        0.02 ±141%      +0.0        0.05 ± 48%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.handle_dots
      0.35 ± 23%      -0.0        0.33 ±  7%      -0.0        0.34 ± 13%      +0.0        0.38 ±  7%  perf-profile.children.cycles-pp.writeback_inodes_sb
      0.02 ±122%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._dbus_marshal_read_uint32
      0.07 ± 32%      -0.0        0.06 ± 52%      +0.0        0.08 ± 16%      +0.0        0.09 ±  9%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.15 ± 20%      -0.0        0.14 ± 18%      -0.0        0.13 ± 12%      +0.0        0.17 ±  7%  perf-profile.children.cycles-pp.kernfs_iop_getattr
      0.17 ± 23%      -0.0        0.16 ± 17%      +0.0        0.17 ± 13%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp._copy_to_user
      0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.may_open
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.xas_expand
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.map_id_range_down
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.reweight_entity
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rb_insert_color
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.check_spread
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.radix_tree_delete_item
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.siphash24_compress@plt
      0.05 ± 55%      -0.0        0.04 ± 75%      +0.0        0.07 ± 27%      +0.0        0.06 ± 12%  perf-profile.children.cycles-pp.getdelim
      0.11 ± 20%      -0.0        0.10 ± 26%      -0.0        0.10 ±  6%      -0.0        0.07 ± 55%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.06 ± 57%      -0.0        0.05 ± 77%      +0.0        0.08 ± 24%      +0.0        0.07 ± 20%  perf-profile.children.cycles-pp.xas_start
      0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.strncmp
      0.09 ± 19%      -0.0        0.08 ±  9%      +0.0        0.09 ± 30%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.pcpu_block_update
      3.69 ± 15%      -0.0        3.68 ±  9%      +0.2        3.86 ± 12%      -0.0        3.65 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.07 ± 58%      -0.0        0.06 ± 53%      +0.0        0.08 ± 14%      +0.0        0.08 ± 19%  perf-profile.children.cycles-pp.__srcu_read_unlock
      0.41 ± 19%      -0.0        0.40 ±  9%      -0.0        0.41 ± 13%      +0.0        0.45 ± 10%  perf-profile.children.cycles-pp.mod_objcg_state
      0.22 ± 23%      -0.0        0.21 ± 10%      -0.0        0.20 ± 11%      -0.0        0.19 ± 12%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.15 ± 16%      -0.0        0.14 ± 21%      +0.0        0.18 ± 15%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.mutex_lock
      0.04 ± 85%      -0.0        0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._dbus_type_reader_recurse
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.dentry_path
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_inode_getattr
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.timekeeping_advance
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.update_wall_time
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.hashmap_get2@plt
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.update_rt_rq_load_avg
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.delete_trailing_chars
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._IO_setb
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.srcu_gp_start
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.siphash24_init@plt
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.strsep
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.error_entry
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.radix_tree_node_rcu_free
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.make_kuid
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_release_head_state
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_destruct_scm
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_init
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sock_wfree
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_path_mkdir
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_open
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.object_path_is_valid
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__poll
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.putname
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__errno_location
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.irq_work_run_list
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_open_container
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rb_next
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.stress_ramfs_umount
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp._hashmap_size
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.connect
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.page_counter_uncharge
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ±144%      -0.0        0.00        perf-profile.children.cycles-pp.security_path_unlink
      0.03 ±130%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.strnlen
      0.07 ± 53%      -0.0        0.06 ± 48%      -0.0        0.06 ± 18%      -0.0        0.05 ± 56%  perf-profile.children.cycles-pp.readlink
      0.05 ± 53%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.29 ± 22%      -0.0        0.28 ±  9%      -0.0        0.28 ±  8%      -0.0        0.24 ± 11%  perf-profile.children.cycles-pp.security_file_alloc
      0.03 ±123%      -0.0        0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.hashmap_get2
      0.08 ± 19%      -0.0        0.07 ± 50%      +0.0        0.09 ± 18%      +0.0        0.09 ± 22%  perf-profile.children.cycles-pp.common_perm_cond
      0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._hashmap_get
      0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.02 ±145%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.deactivate_super
      0.27 ± 23%      -0.0        0.26 ± 13%      -0.0        0.24 ± 15%      -0.0        0.24 ± 13%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.08 ± 59%      -0.0        0.08 ± 55%      -0.0        0.08 ± 23%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.path_mount
      0.06 ± 58%      -0.0        0.06 ± 47%      -0.0        0.04 ±104%      -0.0        0.06 ± 10%  perf-profile.children.cycles-pp.rwsem_wake
      0.10 ± 35%      -0.0        0.10 ± 28%      -0.0        0.09 ± 26%      -0.1        0.05 ± 55%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      1.08 ± 17%      -0.0        1.07 ±  9%      -0.0        1.04 ±  7%      -0.1        1.01 ±  5%  perf-profile.children.cycles-pp.vfs_statx
      0.05 ± 53%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.__mnt_want_write
      0.05 ± 56%      -0.0        0.04 ± 73%      -0.0        0.05 ± 51%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.lookup_constant
      0.05 ± 92%      -0.0        0.04 ± 75%      +0.0        0.07 ± 15%      +0.0        0.05 ± 50%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.10 ± 28%      -0.0        0.09 ± 19%      -0.0        0.08 ± 20%      -0.0        0.09 ±  9%  perf-profile.children.cycles-pp._hashmap_iterate
      0.06 ± 54%      -0.0        0.05 ± 49%      -0.0        0.05 ± 46%      -0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__x64_sys_readlink
      0.12 ± 24%      -0.0        0.11 ± 17%      +0.0        0.13 ± 18%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.lockref_get
      0.21 ± 14%      -0.0        0.20 ± 12%      +0.0        0.22 ± 11%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.__switch_to
      1.33 ± 16%      -0.0        1.32 ±  8%      -0.0        1.29 ±  5%      -0.1        1.27 ±  3%  perf-profile.children.cycles-pp.vfs_fstatat
      0.14 ± 43%      -0.0        0.13 ± 17%      -0.0        0.12 ± 23%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.memdup_user
      0.05 ± 53%      -0.0        0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.04 ± 82%  perf-profile.children.cycles-pp.copy_from_kernel_nofault
      0.09 ± 23%      -0.0        0.08 ± 25%      +0.0        0.09 ± 12%      -0.0        0.08 ± 50%  perf-profile.children.cycles-pp.chacha_block_generic
      0.12 ± 33%      -0.0        0.11 ± 27%      -0.0        0.11 ± 14%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp._get_random_bytes
      0.15 ± 39%      -0.0        0.14 ± 15%      +0.0        0.15 ± 21%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
      0.06 ± 53%      -0.0        0.06 ± 53%      -0.0        0.05 ± 48%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.kernfs_fop_open
      0.04 ± 88%      -0.0        0.04 ± 73%      -0.0        0.03 ±100%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp._copy_to_iter
      0.98 ± 22%      -0.0        0.98 ±  8%      +0.0        1.01 ±  6%      -0.0        0.98 ±  7%  perf-profile.children.cycles-pp.__do_sys_newlstat
      0.19 ± 31%      -0.0        0.18 ± 11%      -0.0        0.18 ± 21%      +0.0        0.19 ± 13%  perf-profile.children.cycles-pp._copy_from_user
      0.83 ± 21%      -0.0        0.82 ±  4%      -0.0        0.80 ± 10%      -0.1        0.75 ±  8%  perf-profile.children.cycles-pp.alloc_empty_file
      0.22 ± 24%      -0.0        0.21 ± 28%      -0.0        0.21 ± 13%      +0.0        0.24 ± 11%  perf-profile.children.cycles-pp.srcu_funnel_gp_start
      0.24 ± 22%      -0.0        0.23 ± 16%      -0.0        0.22 ±  7%      -0.0        0.23 ± 12%  perf-profile.children.cycles-pp.seq_escape_mem
      0.10 ± 29%      -0.0        0.09 ± 31%      -0.0        0.10 ± 41%      +0.0        0.10 ± 24%  perf-profile.children.cycles-pp.generic_exec_single
      0.16 ± 10%      -0.0        0.15 ± 12%      +0.0        0.16 ± 20%      -0.0        0.15 ± 19%  perf-profile.children.cycles-pp.terminate_walk
      0.20 ± 35%      -0.0        0.19 ± 21%      +0.0        0.21 ± 19%      +0.0        0.22 ± 16%  perf-profile.children.cycles-pp.ramfs_mknod
      0.15 ± 11%      -0.0        0.14 ± 12%      +0.0        0.16 ± 30%      -0.0        0.13 ± 16%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.67 ± 23%      -0.0        0.66 ±  8%      -0.0        0.65 ±  9%      +0.0        0.69 ±  7%  perf-profile.children.cycles-pp.__do_sys_newfstat
      0.14 ± 20%      -0.0        0.13 ± 29%      -0.0        0.12 ± 48%      -0.0        0.11 ±  9%  perf-profile.children.cycles-pp.rcu_pending
      0.16 ± 27%      -0.0        0.15 ± 13%      +0.0        0.16 ± 13%      +0.0        0.16 ± 28%  perf-profile.children.cycles-pp.___perf_sw_event
      0.07 ± 53%      -0.0        0.06 ± 46%      +0.0        0.08 ± 29%      +0.0        0.08 ± 24%  perf-profile.children.cycles-pp.folio_alloc
      0.06 ± 62%      -0.0        0.05 ± 47%      -0.0        0.04 ± 73%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.shmem_unlink
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.malloc@plt
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.mntput
      0.12 ± 46%      -0.0        0.12 ± 12%      -0.0        0.12 ± 18%      +0.0        0.13 ± 17%  perf-profile.children.cycles-pp.change_mnt_propagation
      0.08 ± 12%      -0.0        0.08 ±  8%      +0.0        0.10 ± 14%      -0.0        0.08 ± 24%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.33 ± 33%      -0.0        0.33 ± 19%      +0.0        0.36 ± 16%      -0.0        0.32 ± 12%  perf-profile.children.cycles-pp.shmem_alloc_inode
      0.39 ± 22%      -0.0        0.39 ± 12%      -0.0        0.38 ± 12%      -0.0        0.36 ±  5%  perf-profile.children.cycles-pp.d_alloc
      0.05 ± 53%      -0.0        0.05 ± 71%      -0.0        0.05 ± 46%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.rb_erase
      0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.07 ± 50%      +0.0        0.03 ±127%  perf-profile.children.cycles-pp.os_xsave
      0.12 ± 22%      -0.0        0.12 ± 25%      +0.0        0.13 ± 18%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp.idle_cpu
      0.06 ± 14%      -0.0        0.06 ± 47%      -0.0        0.06 ± 15%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.prepend_copy
      0.36 ± 28%      -0.0        0.36 ± 10%      +0.0        0.40 ± 10%      +0.1        0.44 ± 12%  perf-profile.children.cycles-pp.list_lru_destroy
      0.16 ± 17%      -0.0        0.15 ± 14%      -0.0        0.15 ± 15%      -0.0        0.14 ± 14%  perf-profile.children.cycles-pp.task_work_add
      0.26 ± 17%      -0.0        0.25 ± 17%      -0.0        0.25 ± 15%      -0.0        0.23 ±  7%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.34 ± 23%      -0.0        0.33 ±  6%      -0.0        0.33 ± 11%      +0.0        0.37 ±  5%  perf-profile.children.cycles-pp.get_nr_dirty_inodes
      0.11 ± 27%      -0.0        0.10 ± 20%      +0.0        0.11 ± 15%      +0.0        0.13 ± 19%  perf-profile.children.cycles-pp.destroy_inode
      0.05 ± 86%      -0.0        0.04 ± 72%      -0.0        0.03 ±105%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.exp_funnel_lock
      0.07 ± 53%      -0.0        0.06 ± 47%      -0.0        0.06 ± 50%      -0.0        0.05 ± 53%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.07 ± 63%      -0.0        0.06 ± 21%      +0.0        0.07 ± 23%      +0.0        0.08 ± 17%  perf-profile.children.cycles-pp.mnt_release_group_id
      0.14 ± 24%      -0.0        0.13 ± 14%      -0.0        0.12 ± 28%      -0.0        0.11 ± 18%  perf-profile.children.cycles-pp.vfs_getattr_nosec
      0.19 ± 24%      -0.0        0.18 ± 13%      -0.0        0.17 ± 14%      +0.0        0.19 ± 19%  perf-profile.children.cycles-pp.show_type
      0.08 ± 51%      -0.0        0.07 ± 21%      +0.0        0.08 ± 17%      -0.0        0.05 ± 51%  perf-profile.children.cycles-pp.kernfs_fop_release
      0.14 ± 31%      -0.0        0.13 ± 20%      +0.0        0.15 ± 23%      -0.0        0.12 ± 30%  perf-profile.children.cycles-pp.xas_create
      0.04 ± 89%      -0.0        0.04 ± 72%      +0.0        0.06 ± 55%      -0.0        0.03 ±122%  perf-profile.children.cycles-pp.shuffle_freelist
      0.03 ± 82%      -0.0        0.03 ±101%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.build_open_flags
      0.07 ± 52%      -0.0        0.07 ± 48%      +0.0        0.09 ± 23%      +0.0        0.08 ± 20%  perf-profile.children.cycles-pp.xas_descend
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.handle_mm_fault
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__handle_mm_fault
      0.15 ± 16%      -0.0        0.15 ± 16%      +0.0        0.16 ± 18%      +0.0        0.16 ± 18%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.10 ± 22%      -0.0        0.10 ±  7%      -0.0        0.09 ± 21%      -0.0        0.09 ± 14%  perf-profile.children.cycles-pp.__srcu_read_lock
      0.16 ± 14%      -0.0        0.16 ± 14%      -0.0        0.14 ± 20%      -0.0        0.15 ± 14%  perf-profile.children.cycles-pp.prepend_path
      0.09 ± 15%      -0.0        0.09 ± 41%      -0.0        0.08 ± 50%      -0.0        0.08 ±  9%  perf-profile.children.cycles-pp._find_next_and_bit
      0.09 ± 33%      -0.0        0.09 ± 29%      -0.0        0.08 ± 37%      -0.0        0.09 ± 32%  perf-profile.children.cycles-pp.select_task_rq
      0.08 ± 22%      -0.0        0.08 ± 31%      +0.0        0.09 ± 14%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.28 ± 23%      -0.0        0.28 ± 16%      +0.0        0.30 ±  9%      +0.0        0.29 ±  9%  perf-profile.children.cycles-pp.generic_permission
      0.06 ± 54%      -0.0        0.06 ±  9%      +0.0        0.06 ± 47%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.m_start
      0.79 ± 31%      -0.0        0.78 ± 15%      +0.1        0.84 ± 15%      +0.0        0.81 ± 18%  perf-profile.children.cycles-pp.alloc_inode
      0.04 ± 85%      -0.0        0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.copyout
      0.07 ± 24%      -0.0        0.06 ± 46%      -0.0        0.04 ±109%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.pick_next_entity
      0.09 ± 29%      -0.0        0.08 ± 14%      -0.0        0.08 ± 19%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.security_inode_permission
      0.27 ± 22%      -0.0        0.26 ± 10%      -0.0        0.26 ± 17%      +0.0        0.27 ± 14%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.29 ± 18%      -0.0        0.28 ± 12%      +0.0        0.30 ± 16%      +0.0        0.31 ± 11%  perf-profile.children.cycles-pp.lockref_put_return
      0.59 ± 26%      -0.0        0.59 ± 12%      +0.0        0.64 ± 12%      +0.0        0.63 ± 16%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.16 ± 17%      -0.0        0.16 ± 16%      -0.0        0.15 ± 19%      -0.0        0.15 ± 16%  perf-profile.children.cycles-pp.__d_path
      0.05 ± 54%      -0.0        0.05 ± 49%      -0.0        0.04 ± 79%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.readlink_copy
      0.08 ± 51%      -0.0        0.08 ± 29%      +0.0        0.09 ± 24%      +0.0        0.11 ± 20%  perf-profile.children.cycles-pp.crng_make_state
      0.12 ± 23%      -0.0        0.12 ± 18%      -0.0        0.10 ± 25%      -0.0        0.11 ± 25%  perf-profile.children.cycles-pp.pcpu_block_update_hint_free
      0.03 ± 82%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._IO_feof
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.unit_name_escape
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.__put_mountpoint
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.exc_page_fault
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.do_user_addr_fault
      0.02 ±123%      -0.0        0.02 ±144%      +0.0        0.03 ±100%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.02 ±123%      -0.0        0.02 ±144%      +0.0        0.04 ± 73%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.should_failslab
      0.14 ± 27%      -0.0        0.14 ± 12%      -0.0        0.13 ± 22%      +0.0        0.15 ± 26%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.14 ± 21%      -0.0        0.14 ± 20%      +0.0        0.14 ± 20%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      3.02 ± 15%      -0.0        3.02 ± 11%      +0.2        3.21 ± 14%      -0.0        3.01 ±  7%  perf-profile.children.cycles-pp.schedule
      0.06 ± 55%      -0.0        0.06 ± 49%      -0.0        0.05 ± 50%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.__alloc_skb
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_del
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unit_type_from_string
      0.02 ±122%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.uncharge_batch
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.place_entity
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_release_private
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.ramfs_parse_param
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.propagate_mount_unlock
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.proc_self_get_link
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.touch_atime
      0.16 ± 29%      -0.0        0.16 ± 26%      +0.0        0.16 ± 18%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.queue_delayed_work_on
      0.34 ± 33%      -0.0        0.34 ± 14%      +0.0        0.36 ± 16%      +0.0        0.34 ± 24%  perf-profile.children.cycles-pp.xas_store
      0.79 ± 29%      -0.0        0.79 ± 12%      +0.1        0.86 ± 14%      +0.1        0.89 ± 13%  perf-profile.children.cycles-pp.propagate_mount_busy
      0.06 ± 58%      -0.0        0.06 ± 48%      +0.0        0.09 ± 17%      +0.0        0.06 ± 52%  perf-profile.children.cycles-pp.propagation_next
      0.08 ± 59%      -0.0        0.08 ± 25%      -0.0        0.08 ± 25%      -0.0        0.07 ± 25%  perf-profile.children.cycles-pp.xa_load
      0.08 ± 61%      -0.0        0.08 ± 24%      -0.0        0.08 ± 19%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.shmem_parse_one
      0.21 ± 20%      -0.0        0.20 ± 13%      -0.0        0.18 ± 20%      -0.0        0.18 ±  4%  perf-profile.children.cycles-pp.strchr
      0.10 ± 25%      -0.0        0.10 ± 19%      -0.0        0.07 ± 10%      -0.0        0.07 ± 53%  perf-profile.children.cycles-pp.swake_up_one
      0.11 ± 24%      -0.0        0.10 ± 16%      +0.0        0.11 ± 27%      +0.0        0.12 ± 16%  perf-profile.children.cycles-pp.__memset
      0.06 ± 56%      -0.0        0.06 ± 47%      -0.0        0.05 ± 51%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.06 ± 54%      -0.0        0.06 ± 52%      +0.0        0.08 ± 31%      +0.0        0.08 ± 24%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.08 ± 51%      -0.0        0.08 ± 25%      +0.0        0.08 ± 20%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.crng_fast_key_erasure
      0.17 ± 23%      -0.0        0.16 ± 10%      +0.0        0.20 ± 22%      -0.0        0.16 ± 16%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.03 ±123%      -0.0        0.02 ± 99%      +0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._dbus_first_type_in_signature
      0.23 ± 30%      -0.0        0.23 ± 11%      -0.0        0.23 ± 11%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.__close_nocancel
      0.20 ± 33%      -0.0        0.20 ± 22%      +0.0        0.22 ± 13%      +0.0        0.23 ± 18%  perf-profile.children.cycles-pp.__list_del_entry_valid
      2.21 ± 16%      -0.0        2.21 ±  4%      -0.0        2.17 ±  5%      -0.1        2.12 ±  3%  perf-profile.children.cycles-pp.filename_lookup
      0.10 ± 32%      -0.0        0.10 ± 25%      -0.0        0.10 ± 29%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.__d_add
      0.29 ± 36%      -0.0        0.29 ± 11%      -0.0        0.29 ± 13%      -0.0        0.29 ± 17%  perf-profile.children.cycles-pp.vfs_unlink
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.mount_too_revealing
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp._ordered_hashmap_ensure_allocated
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.bprm_execve
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.search_binary_handler
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.stress_mwc1
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.rcu_exp_jiffies_till_stall_check
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__seq_open_private
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_open_private
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__x64_sys_poll
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.apparmor_sb_mount
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_sys_poll
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.from_kuid_munged
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.locks_remove_posix
      0.24 ± 18%      +0.0        0.24 ± 13%      +0.0        0.24 ± 11%      +0.0        0.26 ±  4%  perf-profile.children.cycles-pp.strlen
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__fsnotify_parent
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.free_and_strdup
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.simple_strntoull
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.memparse
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sysvec_irq_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__sysvec_irq_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.irq_work_run
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.irq_work_single
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._printk
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.vprintk_emit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.console_unlock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.console_flush_all
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sched_clock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sprintf
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.read_counters
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_connect
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__sys_connect
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__traverse_mounts
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__put_super
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.i_callback
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_inode_init_security
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.default_send_IPI_single_phys
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.insert_work
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.xas_find_marked
      0.02 ±122%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.local_clock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.wake_up_bit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.vmap_pages_pud_range
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.alloc_pages
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.simple_unlink
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.free_unref_page_list
      0.02 ±122%      +0.0        0.02 ±144%      +0.0        0.03 ±100%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.__unfreeze_partials
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.__bitmap_set
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.cmd_stat
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.ihold
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.dispatch_events
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.process_interval
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.__calc_delta
      0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.04 ± 85%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.00        perf-profile.children.cycles-pp.cpu_stopper_thread
      0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.00        perf-profile.children.cycles-pp.invent_group_ids
      0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.clear_page_erms
      0.37 ± 22%      +0.0        0.37 ±  9%      -0.0        0.34 ±  7%      -0.0        0.33 ± 11%  perf-profile.children.cycles-pp.init_file
      0.52 ± 24%      +0.0        0.52 ± 11%      -0.0        0.50 ± 16%      -0.1        0.46 ± 10%  perf-profile.children.cycles-pp.rdrand
      0.18 ± 36%      +0.0        0.18 ± 21%      -0.0        0.17 ± 23%      -0.0        0.17 ± 15%  perf-profile.children.cycles-pp.strndup_user
      0.12 ± 27%      +0.0        0.12 ± 18%      +0.0        0.12 ± 27%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.fput
      2.10 ± 25%      +0.0        2.10 ±  9%      -0.0        2.08 ± 13%      -0.1        2.00 ± 10%  perf-profile.children.cycles-pp.openat64
      0.02 ±125%      +0.0        0.02 ± 99%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.inode_maybe_inc_iversion
      0.08 ± 54%      +0.0        0.08 ± 24%      +0.0        0.09 ± 22%      +0.0        0.11 ± 18%  perf-profile.children.cycles-pp.uuid_gen
      0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.inode_sb_list_add
      0.20 ± 36%      +0.0        0.20 ±  9%      -0.0        0.19 ± 25%      +0.0        0.22 ± 10%  perf-profile.children.cycles-pp.commit_tree
      0.26 ± 33%      +0.0        0.26 ± 11%      +0.0        0.30 ±  5%      +0.0        0.29 ± 11%  perf-profile.children.cycles-pp.kernfs_iop_permission
      0.11 ± 16%      +0.0        0.11 ± 19%      -0.0        0.10 ± 21%      -0.0        0.10 ±  9%  perf-profile.children.cycles-pp.strcmp
      0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.dbus_message_get_interface
      0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±123%  perf-profile.children.cycles-pp.ep_item_poll
      0.09 ± 58%      +0.0        0.09 ± 14%      +0.0        0.10 ±  7%      +0.0        0.12 ± 16%  perf-profile.children.cycles-pp.shmem_parse_options
      0.13 ± 31%      +0.0        0.13 ± 17%      +0.0        0.14 ± 18%      +0.0        0.14 ± 21%  perf-profile.children.cycles-pp._hashmap_first_key_and_value
      0.15 ± 35%      +0.0        0.15 ± 13%      +0.0        0.16 ± 18%      +0.0        0.16 ± 16%  perf-profile.children.cycles-pp.siphash24_init
      0.10 ± 21%      +0.0        0.10 ± 25%      +0.0        0.10 ± 13%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.__destroy_inode
      0.04 ± 83%      +0.0        0.04 ± 71%      -0.0        0.00            +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.xas_clear_mark
      0.07 ± 67%      +0.0        0.08 ± 14%      -0.0        0.06 ± 46%      -0.0        0.05 ± 53%  perf-profile.children.cycles-pp.string_table_lookup
      0.14 ± 25%      +0.0        0.15 ± 24%      +0.0        0.15 ± 16%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.security_inode_getattr
      0.18 ± 30%      +0.0        0.19 ± 14%      +0.0        0.21 ± 18%      +0.0        0.23 ± 11%  perf-profile.children.cycles-pp.ida_free
      0.06 ± 57%      +0.0        0.06 ± 19%      -0.0        0.06 ± 75%      -0.0        0.06 ± 21%  perf-profile.children.cycles-pp._hashmap_clear
      0.16 ± 30%      +0.0        0.16 ± 21%      +0.0        0.19 ± 17%      +0.0        0.16 ± 12%  perf-profile.children.cycles-pp.__percpu_counter_init
      0.17 ± 36%      +0.0        0.18 ± 15%      +0.0        0.19 ± 16%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.__kmalloc
      0.36 ± 16%      +0.0        0.36 ± 11%      -0.0        0.34 ± 14%      +0.0        0.39 ±  9%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.21 ± 24%      +0.0        0.21 ± 13%      -0.0        0.19 ± 12%      -0.0        0.20 ± 15%  perf-profile.children.cycles-pp.string_escape_mem
      0.06 ± 61%      +0.0        0.06 ± 52%      +0.0        0.07 ± 16%      +0.0        0.06 ± 54%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.04 ± 90%      +0.0        0.04 ± 73%      +0.0        0.08 ± 20%      +0.0        0.07 ± 28%  perf-profile.children.cycles-pp.set_anon_super_fc
      0.13 ± 30%      +0.0        0.13 ± 20%      -0.0        0.11 ± 20%      +0.0        0.13 ± 25%  perf-profile.children.cycles-pp.up_write
      0.24 ± 36%      +0.0        0.24 ± 18%      +0.1        0.29 ± 17%      +0.0        0.26 ± 16%  perf-profile.children.cycles-pp.shrink_dcache_for_umount
      0.22 ± 28%      +0.0        0.22 ± 15%      -0.0        0.22 ± 10%      -0.0        0.20 ± 11%  perf-profile.children.cycles-pp.number
      0.14 ± 18%      +0.0        0.14 ± 10%      +0.0        0.15 ± 10%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.mutex_unlock
      0.06 ± 51%      +0.0        0.07 ± 30%      +0.0        0.07 ± 13%      -0.0        0.06 ± 51%  perf-profile.children.cycles-pp.chacha_permute
      0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.simple_write_end
      0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.06 ± 51%      +0.0        0.07 ± 53%      +0.0        0.07 ± 18%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.mnt_want_write
      0.06 ± 82%      +0.0        0.07 ± 47%      +0.0        0.08 ± 20%      +0.0        0.09 ± 25%  perf-profile.children.cycles-pp.zero_user_segments
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 46%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.d_delete
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 48%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.update_min_vruntime
      0.02 ±123%      +0.0        0.03 ±100%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.m_next
      0.03 ± 82%      +0.0        0.04 ± 73%      +0.0        0.05 ± 45%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.15 ± 25%      +0.0        0.16 ± 19%      +0.0        0.15 ± 24%      +0.0        0.17 ± 13%  perf-profile.children.cycles-pp.copy_mount_options
      0.07 ± 56%      +0.0        0.08 ± 35%      +0.0        0.10 ± 20%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.free@plt
      0.11 ± 20%      +0.0        0.12 ± 14%      +0.0        0.12 ± 21%      +0.0        0.12 ± 13%  perf-profile.children.cycles-pp.refill_obj_stock
      0.13 ± 32%      +0.0        0.14 ± 16%      -0.0        0.12 ± 26%      -0.0        0.11 ± 12%  perf-profile.children.cycles-pp.simple_lookup
      0.10 ± 32%      +0.0        0.10 ± 12%      +0.0        0.10 ± 16%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.iput
      0.03 ±122%      +0.0        0.03 ±111%      +0.0        0.05 ± 74%      +0.0        0.05 ± 52%  perf-profile.children.cycles-pp.kmalloc_slab
      0.04 ± 83%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.wake_up_q
      0.04 ± 85%      +0.0        0.04 ± 73%      +0.0        0.04 ± 72%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.__fs_parse
      0.04 ± 87%      +0.0        0.04 ± 75%      -0.0        0.03 ±101%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.synchronize_srcu
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.02 ±144%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.find_lock_entries
      0.07 ± 60%      +0.0        0.08 ± 28%      +0.0        0.08 ± 22%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.shmem_file_read_iter
      0.09 ± 25%      +0.0        0.10 ± 18%      +0.0        0.10 ± 11%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp._IO_default_xsputn
      0.07 ± 57%      +0.0        0.08 ± 42%      +0.0        0.08 ± 36%      +0.0        0.07 ± 87%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.06 ± 57%      +0.0        0.07 ± 49%      +0.0        0.07 ± 14%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.rcu_exp_handler
      0.19 ± 21%      +0.0        0.20 ± 15%      +0.0        0.20 ± 21%      +0.0        0.23 ± 24%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.autofs_show_options
      0.02 ±122%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.note_gp_changes
      0.28 ± 28%      +0.0        0.28 ± 20%      +0.0        0.30 ± 18%      +0.0        0.29 ±  7%  perf-profile.children.cycles-pp.set_next_entity
      0.10 ± 23%      +0.0        0.10 ± 18%      -0.0        0.09 ± 15%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.filemap_add_folio
      0.07 ± 57%      +0.0        0.07 ± 10%      +0.0        0.09 ± 33%      -0.0        0.06 ± 54%  perf-profile.children.cycles-pp.xas_alloc
      0.11 ± 25%      +0.0        0.12 ± 28%      +0.0        0.12 ± 15%      +0.0        0.12 ± 18%  perf-profile.children.cycles-pp.realloc
      0.01 ±200%      +0.0        0.02 ±146%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.check_cpu_stall
      0.06 ± 50%      +0.0        0.07 ± 45%      +0.0        0.08 ± 21%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.__lookup_slow
      0.11 ± 38%      +0.0        0.12 ± 23%      +0.0        0.12 ± 23%      +0.0        0.12 ± 14%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.06 ± 85%      +0.0        0.07 ± 20%      +0.0        0.08 ± 30%      -0.0        0.06 ± 56%  perf-profile.children.cycles-pp.stress_ramfs_child
      1.14 ± 25%      +0.0        1.15 ±  9%      +0.0        1.17 ±  6%      -0.0        1.13 ±  6%  perf-profile.children.cycles-pp.__lxstat64
      0.03 ± 81%      +0.0        0.04 ± 75%      +0.0        0.04 ± 45%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.strscpy
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.memcmp@plt
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.copy_msghdr_from_user
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.genuine_random_bytes
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.available_idle_cpu
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.put_cpu_partial
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.set_strjoin
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.cap_capable
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mnt_table_next_fs
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.do_mmap
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.ksys_write
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.vfs_write
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mmap_region
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.string
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.from_kgid_munged
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.pick_file
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_sb_mount
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±123%  perf-profile.children.cycles-pp.mnt_reset_fs
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.strdup@plt
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_dtor
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._IO_link_in
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_path_mknod
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.lru_add_fn
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.call_cpuidle
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.devpts_show_options
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__vmap_pages_range_noflush
      0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.05 ± 46%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.17 ± 27%      +0.0        0.18 ± 11%      +0.0        0.17 ± 10%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.12 ± 56%      +0.0        0.13 ± 18%      -0.0        0.11 ± 20%      -0.0        0.11 ± 26%  perf-profile.children.cycles-pp.strlcat
      0.05 ± 53%      +0.0        0.06 ± 47%      +0.0        0.07 ± 15%      +0.0        0.05 ± 55%  perf-profile.children.cycles-pp.rcu_nocb_try_bypass
      0.05 ± 84%      +0.0        0.06 ± 50%      +0.0        0.08 ± 22%      -0.0        0.05 ± 90%  perf-profile.children.cycles-pp.d_set_mounted
      0.24 ±109%      +0.0        0.25 ± 91%      -0.0        0.21 ±133%      +0.0        0.27 ± 89%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.33 ± 32%      +0.0        0.34 ± 17%      +0.0        0.33 ± 13%      +0.0        0.34 ±  9%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.07 ± 53%      +0.0        0.08 ± 26%      -0.0        0.03 ±100%      -0.0        0.04 ± 85%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.10 ± 37%      +0.0        0.10 ± 20%      +0.0        0.11 ± 18%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.ramfs_mkdir
      0.23 ±114%      +0.0        0.24 ± 92%      -0.0        0.19 ±145%      +0.0        0.26 ± 91%  perf-profile.children.cycles-pp.tick_irq_enter
      0.06 ± 30%      +0.0        0.07 ± 25%      +0.0        0.08 ± 57%      +0.0        0.06 ± 12%  perf-profile.children.cycles-pp.chase_symlinks
      0.03 ± 82%      +0.0        0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.06 ± 12%      +0.0        0.07 ± 20%      -0.0        0.05 ± 73%      -0.0        0.05 ± 51%  perf-profile.children.cycles-pp.security_file_open
      0.09 ± 81%      +0.0        0.10 ± 19%      +0.0        0.10 ± 22%      +0.0        0.12 ± 26%  perf-profile.children.cycles-pp.may_delete
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.set_cached_acl
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.pcpu_chunk_relocate
      0.01 ±200%      +0.0        0.02 ±144%      +0.0        0.02 ±143%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.vmalloc_to_page
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.pick_link
      0.00            +0.0        0.01 ±223%      +0.0        0.04 ±101%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.clear_inode
      0.23 ± 20%      +0.0        0.24 ± 14%      -0.0        0.22 ± 19%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.pcpu_free_area
      0.08 ± 51%      +0.0        0.09 ± 23%      +0.0        0.10 ± 21%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.lockref_put_or_lock
      0.19 ± 30%      +0.0        0.20 ± 13%      +0.0        0.20 ± 10%      -0.0        0.19 ± 20%  perf-profile.children.cycles-pp.prepare_task_switch
      0.66 ± 29%      +0.0        0.67 ± 15%      +0.0        0.69 ± 18%      +0.0        0.67 ±  7%  perf-profile.children.cycles-pp.lookup_open
      0.06 ± 58%      +0.0        0.07 ± 14%      +0.0        0.07 ± 14%      +0.0        0.06 ± 50%  perf-profile.children.cycles-pp.d_instantiate
      0.03 ±123%      +0.0        0.04 ± 71%      -0.0        0.02 ±146%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.seq_dentry
      0.29 ± 16%      +0.0        0.30 ± 24%      +0.0        0.32 ±  9%      +0.0        0.31 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.07 ± 57%      +0.0        0.08 ± 28%      +0.0        0.10 ± 31%      +0.0        0.08 ± 15%  perf-profile.children.cycles-pp.shmem_put_super
      0.16 ± 23%      +0.0        0.18 ±  5%      +0.0        0.17 ±  9%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.get_nr_inodes
      0.27 ± 14%      +0.0        0.28 ± 10%      +0.0        0.28 ± 10%      -0.0        0.26 ±  9%  perf-profile.children.cycles-pp.native_sched_clock
      0.04 ± 85%      +0.0        0.05 ± 49%      -0.0        0.02 ±144%      -0.0        0.03 ±127%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.10 ± 28%      +0.0        0.11 ± 10%      -0.0        0.10 ± 26%      +0.0        0.11 ± 25%  perf-profile.children.cycles-pp.add_uevent_var
      0.07 ± 25%      +0.0        0.08 ± 20%      +0.0        0.07 ± 21%      -0.0        0.05 ± 56%  perf-profile.children.cycles-pp.map_id_up
      0.70 ± 28%      +0.0        0.71 ± 16%      +0.0        0.71 ± 16%      -0.0        0.70 ±  8%  perf-profile.children.cycles-pp.filename_create
      0.27 ± 25%      +0.0        0.28 ± 17%      +0.1        0.32 ± 13%      +0.1        0.32 ± 17%  perf-profile.children.cycles-pp.__switch_to_asm
      0.11 ± 36%      +0.0        0.12 ± 17%      +0.0        0.12 ± 29%      +0.0        0.11 ± 17%  perf-profile.children.cycles-pp.shmem_evict_inode
      0.13 ± 33%      +0.0        0.14 ±  9%      -0.0        0.12 ± 18%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.seq_puts
      1.86 ± 23%      +0.0        1.87 ± 10%      -0.2        1.70 ± 13%      -0.1        1.76 ±  8%  perf-profile.children.cycles-pp.show_mountinfo
      1.43 ± 23%      +0.0        1.45 ±  7%      -0.1        1.36 ± 14%      -0.1        1.34 ±  7%  perf-profile.children.cycles-pp.siphash24_compress
      0.13 ± 22%      +0.0        0.15 ± 12%      -0.0        0.12 ± 21%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.alloc_fd
      0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ±103%      +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.__bitmap_clear
      0.09 ± 39%      +0.0        0.11 ± 40%      -0.0        0.08 ± 58%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.llist_add_batch
      0.06 ± 59%      +0.0        0.08 ± 27%      +0.0        0.09 ± 32%      +0.0        0.07 ± 19%  perf-profile.children.cycles-pp.percpu_counter_destroy
      0.01 ±200%      +0.0        0.02 ±145%      +0.0        0.03 ±100%      +0.0        0.03 ± 81%  perf-profile.children.cycles-pp.path_compare@plt
      0.07 ± 57%      +0.0        0.08 ± 44%      -0.0        0.07 ± 16%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.path_hash_func
      0.08 ± 23%      +0.0        0.10 ± 16%      +0.0        0.08 ± 11%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.03 ± 81%      +0.0        0.04 ± 73%      -0.0        0.00            +0.0        0.05 ± 51%  perf-profile.children.cycles-pp.cpuacct_charge
      0.10 ± 26%      +0.0        0.11 ± 14%      -0.0        0.10 ± 24%      +0.0        0.11 ± 23%  perf-profile.children.cycles-pp.hashmap_replace
      0.05 ± 52%      +0.0        0.06 ± 17%      +0.0        0.05 ± 47%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.kmemdup_nul
      0.04 ± 82%      +0.0        0.05 ± 71%      +0.0        0.06 ± 46%      +0.0        0.05 ± 52%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.07 ± 61%      +0.0        0.08 ± 16%      -0.0        0.06 ± 45%      +0.0        0.09 ± 30%  perf-profile.children.cycles-pp.strcspn@plt
      0.04 ± 83%      +0.0        0.05 ± 47%      +0.0        0.06 ± 47%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.shmem_free_in_core_inode
      0.65 ± 19%      +0.0        0.66 ± 15%      +0.0        0.67 ± 13%      +0.0        0.68 ± 12%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.05 ± 82%      +0.0        0.07 ± 15%      +0.0        0.10 ± 42%      +0.0        0.08 ± 52%  perf-profile.children.cycles-pp.prealloc_shrinker
      0.11 ± 20%      +0.0        0.13 ± 15%      +0.0        0.12 ±  6%      +0.0        0.14 ± 17%  perf-profile.children.cycles-pp.kernfs_get_target_path
      0.05 ± 81%      +0.0        0.07 ± 14%      +0.0        0.09 ± 43%      +0.0        0.08 ± 51%  perf-profile.children.cycles-pp.__prealloc_shrinker
      0.07 ± 57%      +0.0        0.09 ± 17%      +0.0        0.10 ± 25%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.allocate_slab
      0.09 ± 57%      +0.0        0.10 ± 18%      +0.0        0.10 ± 30%      +0.0        0.13 ± 14%  perf-profile.children.cycles-pp.release_pages
      0.01 ±200%      +0.0        0.02 ± 99%      +0.0        0.02 ±143%      -0.0        0.00        perf-profile.children.cycles-pp.strnlen_user
      0.24 ± 17%      +0.0        0.26 ± 18%      +0.0        0.26 ± 13%      +0.0        0.27 ± 12%  perf-profile.children.cycles-pp.update_curr
      0.18 ± 20%      +0.0        0.19 ± 16%      +0.0        0.18 ± 21%      +0.0        0.22 ± 24%  perf-profile.children.cycles-pp.pagecache_get_page
      0.11 ± 38%      +0.0        0.12 ± 40%      -0.0        0.10 ± 33%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.05 ± 52%      +0.0        0.06 ± 11%      +0.0        0.05 ± 47%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.vscnprintf
      0.09 ± 29%      +0.0        0.10 ± 26%      +0.0        0.10 ± 19%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.string_hash_func
      0.53 ± 33%      +0.0        0.55 ± 17%      +0.1        0.59 ± 20%      +0.0        0.54 ± 15%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      0.06 ± 58%      +0.0        0.08 ± 23%      +0.0        0.07 ± 15%      +0.0        0.07 ± 33%  perf-profile.children.cycles-pp.path_simplify
      0.12 ± 27%      +0.0        0.14 ± 11%      +0.0        0.14 ± 17%      +0.0        0.14 ± 22%  perf-profile.children.cycles-pp.dev_uevent
      1.00 ± 15%      +0.0        1.02 ± 13%      +0.0        1.04 ±  6%      +0.0        1.01 ±  8%  perf-profile.children.cycles-pp.__cond_resched
      0.03 ± 82%      +0.0        0.05 ± 77%      +0.0        0.06 ± 11%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.strlcpy
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kernfs_unlink_open_file
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.d_same_name
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.resched_curr
      0.04 ± 88%      +0.0        0.06 ± 49%      +0.0        0.04 ± 73%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.btrfs_show_options
      0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.03 ±102%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__rw_verify_area
      0.05 ± 90%      +0.0        0.06 ± 46%      +0.0        0.07 ± 54%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.56 ± 26%      +0.0        0.58 ± 15%      +0.0        0.59 ± 17%      +0.0        0.61 ± 13%  perf-profile.children.cycles-pp.vfs_create_mount
      0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.03 ±101%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.apparmor_file_open
      0.16 ± 17%      +0.0        0.18 ± 22%      +0.0        0.17 ± 28%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.update_rq_clock
      3.71 ± 16%      +0.0        3.73 ±  4%      +0.1        3.76 ±  9%      -0.1        3.64 ±  2%  perf-profile.children.cycles-pp.path_openat
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.cgroup_show_path
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.04 ± 51%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.09 ± 28%      +0.0        0.11 ± 19%      +0.0        0.10 ± 14%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.make_vfsuid
      3.80 ± 16%      +0.0        3.82 ±  4%      +0.0        3.85 ±  9%      -0.1        3.71 ±  2%  perf-profile.children.cycles-pp.do_filp_open
      0.44 ± 24%      +0.0        0.46 ± 11%      +0.0        0.45 ± 16%      +0.1        0.52 ± 17%  perf-profile.children.cycles-pp.ramfs_symlink
      0.33 ± 19%      +0.0        0.34 ± 19%      +0.0        0.36 ± 17%      +0.0        0.36 ±  7%  perf-profile.children.cycles-pp.check_heap_object
      0.15 ± 32%      +0.0        0.16 ± 16%      +0.0        0.16 ± 37%      +0.0        0.17 ± 17%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.12 ± 24%      +0.0        0.14 ± 17%      +0.0        0.14 ± 13%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.02 ±122%      +0.0        0.04 ±104%      +0.0        0.04 ± 71%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.__libc_calloc
      0.00            +0.0        0.02 ±141%      +0.0        0.05 ± 45%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__alloc_pages_bulk
      0.00            +0.0        0.02 ±141%      +0.0        0.05 ± 46%      +0.0        0.02 ±125%  perf-profile.children.cycles-pp.__vmalloc_area_node
      0.06 ± 58%      +0.0        0.08 ± 16%      +0.0        0.06 ± 51%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.dentry_unlink_inode
      1.99 ± 24%      +0.0        2.01 ± 10%      +0.2        2.16 ± 10%      +0.2        2.23 ± 10%  perf-profile.children.cycles-pp.deactivate_locked_super
      0.13 ± 21%      +0.0        0.15 ± 15%      -0.0        0.12 ± 25%      +0.0        0.15 ± 12%  perf-profile.children.cycles-pp.check_preempt_curr
      0.09 ± 25%      +0.0        0.12 ± 12%      -0.0        0.09 ± 21%      -0.0        0.09 ± 19%  perf-profile.children.cycles-pp.d_walk
      0.16 ± 33%      +0.0        0.18 ± 11%      +0.0        0.18 ± 17%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.73 ± 22%      +0.0        0.75 ± 13%      +0.1        0.79 ±  9%      +0.1        0.79 ±  5%  perf-profile.children.cycles-pp.__check_object_size
      0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__vmalloc_node
      0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.pcpu_alloc_chunk
      0.58 ± 37%      +0.0        0.60 ± 17%      +0.0        0.62 ± 20%      +0.0        0.61 ± 13%  perf-profile.children.cycles-pp.shmem_get_inode
      0.05 ± 54%      +0.0        0.07 ± 11%      +0.0        0.06 ± 47%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.sysfs_emit_at
      0.05 ± 53%      +0.0        0.07 ± 11%      +0.0        0.07 ± 14%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.path_startswith
      0.59 ± 24%      +0.0        0.61 ± 11%      +0.0        0.61 ± 15%      +0.1        0.64 ± 14%  perf-profile.children.cycles-pp.delayed_free_vfsmnt
      0.65 ± 25%      +0.0        0.67 ±  5%      +0.0        0.67 ± 17%      +0.0        0.67 ± 15%  perf-profile.children.cycles-pp.__slab_free
      0.06 ± 53%      +0.0        0.08 ± 15%      +0.0        0.07 ± 47%      +0.0        0.08 ± 26%  perf-profile.children.cycles-pp.memcpy@plt
      0.09 ± 34%      +0.0        0.11 ± 14%      +0.0        0.12 ± 15%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.lookup_dcache
      0.07 ± 55%      +0.0        0.10 ± 15%      -0.0        0.06 ± 49%      +0.0        0.08 ± 13%  perf-profile.children.cycles-pp.path_equal
      0.25 ± 28%      +0.0        0.28 ± 14%      +0.0        0.26 ± 19%      +0.1        0.31 ± 20%  perf-profile.children.cycles-pp.simple_write_begin
      0.27 ± 36%      +0.0        0.30 ±  9%      +0.0        0.29 ±  9%      +0.0        0.30 ±  8%  perf-profile.children.cycles-pp.__check_heap_object
      0.05 ± 55%      +0.0        0.08 ± 24%      +0.0        0.09 ± 27%      +0.0        0.09 ± 27%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.01 ±200%      +0.0        0.04 ±101%      +0.0        0.02 ±142%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.unlock_mount
      0.05 ± 90%      +0.0        0.07 ± 12%      -0.0        0.03 ±100%      -0.0        0.04 ± 82%  perf-profile.children.cycles-pp.unit_file_find_dropin_paths
      0.08 ± 53%      +0.0        0.10 ± 22%      +0.0        0.09 ±  9%      +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.apparmor_file_free_security
      0.09 ± 52%      +0.0        0.11 ± 22%      +0.0        0.10 ± 17%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.security_file_free
      0.35 ± 33%      +0.0        0.37 ± 18%      +0.0        0.39 ± 17%      +0.0        0.37 ±  7%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
      0.12 ± 32%      +0.0        0.14 ± 27%      +0.0        0.14 ± 16%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.propagate_umount
      0.03 ±123%      +0.0        0.05 ± 46%      +0.0        0.06 ± 47%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__d_instantiate
      0.04 ± 87%      +0.0        0.06 ± 16%      +0.0        0.05 ± 71%      +0.0        0.07 ± 15%  perf-profile.children.cycles-pp.shmem_getattr
      2.53 ± 25%      +0.0        2.56 ± 16%      +0.1        2.66 ± 10%      +0.3        2.81 ± 13%  perf-profile.children.cycles-pp.attach_recursive_mnt
      0.17 ± 28%      +0.0        0.20 ± 12%      +0.0        0.19 ± 13%      +0.0        0.19 ± 13%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.08 ± 59%      +0.0        0.10 ± 13%      +0.0        0.09 ± 27%      +0.0        0.11 ± 14%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.19 ± 22%      +0.0        0.22 ± 12%      +0.0        0.21 ± 17%      +0.0        0.20 ± 16%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.01 ±200%      +0.0        0.04 ± 71%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.filemap_get_entry
      0.18 ± 27%      +0.0        0.21 ± 29%      +0.0        0.20 ± 14%      +0.0        0.20 ±  9%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.strextend_with_separator
      0.05 ± 82%      +0.0        0.08 ± 37%      +0.0        0.08 ± 16%      +0.1        0.11 ± 13%  perf-profile.children.cycles-pp.put_fs_context
      0.14 ± 24%      +0.0        0.17 ± 15%      +0.0        0.16 ± 27%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.filp_close
      0.04 ± 93%      +0.0        0.07 ± 22%      +0.0        0.05 ± 78%      +0.0        0.07 ± 24%  perf-profile.children.cycles-pp.shmem_undo_range
      0.00            +0.0        0.03 ±100%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.wq_worker_running
      0.11 ± 19%      +0.0        0.14 ± 11%      +0.0        0.12 ± 12%      +0.0        0.12 ± 15%  perf-profile.children.cycles-pp.memcpy_orig
      0.33 ± 28%      +0.0        0.36 ± 14%      +0.0        0.33 ± 18%      +0.1        0.39 ± 21%  perf-profile.children.cycles-pp.page_symlink
      0.14 ± 25%      +0.0        0.16 ±  4%      +0.0        0.14 ± 17%      +0.1        0.19 ± 11%  perf-profile.children.cycles-pp.kfree
      0.63 ± 29%      +0.0        0.65 ± 17%      +0.1        0.70 ± 15%      +0.0        0.67 ±  8%  perf-profile.children.cycles-pp.evict
      0.04 ± 83%      +0.0        0.06 ± 25%      +0.0        0.08 ± 15%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.pcpu_next_fit_region
      0.29 ± 37%      +0.0        0.32 ± 13%      -0.0        0.29 ± 13%      +0.0        0.31 ± 14%  perf-profile.children.cycles-pp.complete_walk
      0.10 ± 39%      +0.0        0.13 ± 21%      +0.0        0.12 ± 15%      +0.0        0.15 ± 24%  perf-profile.children.cycles-pp.mutex_lock_killable
      0.22 ± 18%      +0.0        0.25 ± 12%      +0.0        0.23 ± 12%      +0.0        0.25 ± 17%  perf-profile.children.cycles-pp.kernfs_iop_get_link
      0.11 ± 24%      +0.0        0.14 ± 24%      +0.0        0.13 ± 30%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.inode_init_always
      0.07 ± 55%      +0.0        0.10 ± 23%      +0.0        0.08 ± 29%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.show_mnt_opts
      0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.03 ±100%      +0.0        0.04 ± 51%  perf-profile.children.cycles-pp.get_partial_node
      0.00            +0.0        0.03 ±102%      +0.1        0.06 ± 56%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.pcpu_map_pages
      0.62 ± 25%      +0.0        0.65 ± 18%      +0.1        0.67 ± 14%      +0.1        0.70 ±  9%  perf-profile.children.cycles-pp.do_rmdir
      0.26 ± 26%      +0.0        0.28 ±  5%      +0.0        0.28 ± 16%      +0.0        0.28 ± 19%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.15 ± 41%      +0.0        0.18 ± 17%      +0.0        0.19 ± 18%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.shmem_symlink
      0.08 ± 56%      +0.0        0.11 ± 17%      +0.0        0.12 ± 23%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.__list_add_valid
      0.57 ± 32%      +0.0        0.60 ± 16%      +0.1        0.64 ± 19%      +0.0        0.60 ± 17%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      0.12 ± 40%      +0.0        0.15 ± 21%      +0.0        0.13 ± 17%      +0.0        0.15 ± 11%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait
      0.05 ± 83%      +0.0        0.08 ± 10%      +0.0        0.08 ± 17%      +0.0        0.07 ± 16%  perf-profile.children.cycles-pp._atomic_dec_and_lock
      0.00            +0.0        0.03 ±101%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.pcpu_create_chunk
      0.00            +0.0        0.03 ±101%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__vmalloc_node_range
      0.66 ± 27%      +0.0        0.69 ± 13%      +0.1        0.74 ± 14%      +0.1        0.71 ± 11%  perf-profile.children.cycles-pp.do_mkdirat
      0.16 ± 21%      +0.0        0.19 ± 25%      +0.0        0.18 ± 12%      +0.0        0.17 ± 17%  perf-profile.children.cycles-pp.put_prev_entity
      0.84 ± 25%      +0.0        0.88 ± 16%      -0.0        0.84 ± 16%      +0.1        0.90 ± 12%  perf-profile.children.cycles-pp.stress_mwc32
      0.10 ± 40%      +0.0        0.13 ± 21%      +0.0        0.11 ± 20%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait_once
      0.01 ±200%      +0.0        0.04 ± 71%      +0.0        0.05 ± 50%      +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.ktime_get_mono_fast_ns
      0.31 ± 28%      +0.0        0.34 ± 18%      +0.0        0.34 ± 15%      +0.0        0.35 ±  4%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
      0.52 ± 18%      +0.0        0.55 ± 12%      +0.0        0.55 ± 11%      +0.0        0.54 ± 11%  perf-profile.children.cycles-pp.__call_rcu_common
      0.34 ± 19%      +0.0        0.37 ± 12%      -0.0        0.34 ±  9%      -0.0        0.33 ± 11%  perf-profile.children.cycles-pp.access
      0.59 ± 21%      +0.0        0.62 ±  6%      +0.0        0.62 ± 11%      +0.0        0.63 ±  5%  perf-profile.children.cycles-pp.step_into
      0.07 ± 63%      +0.0        0.10 ± 30%      -0.0        0.06 ± 48%      +0.0        0.07 ± 20%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.01 ±200%      +0.0        0.05 ± 47%      +0.0        0.06 ± 23%      +0.0        0.06 ± 23%  perf-profile.children.cycles-pp.__kmalloc_node
      0.24 ± 14%      +0.0        0.28 ±  9%      +0.0        0.26 ± 12%      +0.0        0.25 ± 22%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
      1.47 ± 28%      +0.0        1.50 ± 13%      +0.2        1.63 ± 10%      +0.2        1.71 ±  7%  perf-profile.children.cycles-pp._find_next_bit
      0.11 ± 28%      +0.0        0.14 ± 23%      +0.0        0.12 ± 30%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.alloc_fs_context
      0.49 ± 30%      +0.0        0.52 ± 19%      +0.0        0.54 ± 19%      +0.0        0.53 ± 12%  perf-profile.children.cycles-pp.__flush_work
      0.73 ± 27%      +0.0        0.76 ± 11%      +0.1        0.82 ± 12%      +0.1        0.79 ± 12%  perf-profile.children.cycles-pp.__x64_sys_mkdir
      0.18 ± 29%      +0.0        0.22 ±  9%      -0.0        0.18 ± 21%      +0.0        0.19 ±  6%  perf-profile.children.cycles-pp.strchr@plt
      0.10 ± 21%      +0.0        0.14 ± 27%      +0.0        0.13 ± 21%      +0.0        0.14 ± 20%  perf-profile.children.cycles-pp.__strdup
      0.03 ±123%      +0.0        0.06 ± 21%      +0.0        0.05 ± 49%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.33 ± 33%      +0.0        0.36 ± 16%      +0.0        0.36 ± 14%      +0.1        0.38 ±  5%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.08 ± 27%      +0.0        0.11 ± 13%      +0.0        0.12 ± 30%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.14 ± 28%      +0.0        0.18 ± 17%      +0.0        0.16 ± 23%      +0.0        0.14 ± 27%  perf-profile.children.cycles-pp.device_read_uevent_file
      0.24 ± 24%      +0.0        0.28 ±  5%      +0.0        0.26 ± 15%      +0.0        0.27 ± 21%  perf-profile.children.cycles-pp.dev_attr_show
      0.70 ± 25%      +0.0        0.74 ± 16%      +0.1        0.75 ± 15%      +0.1        0.78 ± 12%  perf-profile.children.cycles-pp.unregister_shrinker
      0.53 ± 25%      +0.0        0.56 ±  9%      -0.0        0.53 ± 15%      +0.0        0.53 ± 11%  perf-profile.children.cycles-pp.device_read_db_internal_filename
      0.32 ± 20%      +0.0        0.36 ± 11%      +0.0        0.33 ±  9%      -0.0        0.31 ± 10%  perf-profile.children.cycles-pp.do_faccessat
      0.02 ±200%      +0.0        0.05 ± 49%      +0.0        0.02 ±144%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.simple_acl_create
      0.30 ± 27%      +0.0        0.34 ± 22%      +0.0        0.32 ± 20%      +0.0        0.34 ± 11%  perf-profile.children.cycles-pp.vfs_rmdir
      0.12 ± 44%      +0.0        0.16 ± 12%      +0.1        0.17 ± 17%      +0.0        0.15 ± 21%  perf-profile.children.cycles-pp.shmem_mkdir
      0.14 ± 25%      +0.0        0.18 ±  9%      +0.0        0.18 ± 21%      +0.0        0.17 ± 16%  perf-profile.children.cycles-pp.get_mountpoint
      1.75 ± 23%      +0.0        1.79 ± 17%      +0.1        1.82 ± 12%      +0.1        1.88 ± 11%  perf-profile.children.cycles-pp.namespace_unlock
      0.23 ± 23%      +0.0        0.27 ±  5%      +0.0        0.26 ± 16%      +0.0        0.27 ± 22%  perf-profile.children.cycles-pp.uevent_show
      0.31 ± 23%      +0.0        0.35 ±  9%      +0.0        0.32 ± 10%      +0.0        0.34 ± 16%  perf-profile.children.cycles-pp.vfs_readlink
      0.65 ± 22%      +0.0        0.69 ± 12%      -0.0        0.61 ± 16%      -0.0        0.64 ±  6%  perf-profile.children.cycles-pp.seq_printf
      1.45 ± 19%      +0.0        1.49 ±  6%      +0.1        1.56 ±  7%      +0.1        1.54 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.49 ± 30%      +0.0        0.53 ± 15%      +0.1        0.54 ± 13%      +0.1        0.55 ± 10%  perf-profile.children.cycles-pp.umount_tree
      0.29 ± 21%      +0.0        0.34 ± 17%      +0.1        0.38 ± 10%      +0.1        0.40 ± 11%  perf-profile.children.cycles-pp.ida_alloc_range
      3.72 ± 26%      +0.0        3.76 ± 14%      +0.2        3.94 ± 13%      +0.3        4.05 ± 11%  perf-profile.children.cycles-pp.path_umount
      0.21 ± 23%      +0.0        0.25 ± 11%      +0.0        0.22 ± 18%      +0.0        0.21 ± 22%  perf-profile.children.cycles-pp.device_properties_prepare
      0.39 ± 20%      +0.0        0.43 ± 14%      +0.1        0.44 ± 16%      +0.0        0.42 ± 16%  perf-profile.children.cycles-pp.enqueue_entity
      0.03 ±124%      +0.0        0.07 ± 48%      +0.0        0.05 ± 77%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.file_free_rcu
      0.15 ± 27%      +0.0        0.19 ± 18%      +0.0        0.16 ± 35%      +0.0        0.16 ± 27%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.34 ± 16%      +0.0        0.39 ± 10%      +0.0        0.37 ± 15%      +0.0        0.39 ± 13%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.22 ± 37%      +0.0        0.26 ± 18%      +0.0        0.24 ± 12%      +0.0        0.26 ± 15%  perf-profile.children.cycles-pp.kstrdup
      0.14 ± 35%      +0.0        0.18 ± 18%      +0.0        0.16 ± 22%      +0.1        0.19 ± 13%  perf-profile.children.cycles-pp.__pagevec_release
      0.43 ± 33%      +0.0        0.48 ± 10%      +0.0        0.47 ± 17%      -0.0        0.41 ± 15%  perf-profile.children.cycles-pp.siphash24_finalize
      0.94 ± 10%      +0.0        0.98 ±  4%      -0.0        0.94 ± 14%      +0.0        0.98 ±  6%  perf-profile.children.cycles-pp.lookup_fast
      0.07 ± 25%      +0.0        0.12 ± 39%      +0.0        0.10 ± 41%      +0.0        0.10 ± 30%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.99 ± 19%      +0.0        1.04 ±  5%      +0.0        1.01 ±  7%      +0.0        1.04 ±  6%  perf-profile.children.cycles-pp.__fxstat64
      0.69 ± 25%      +0.0        0.74 ± 18%      +0.1        0.76 ± 15%      +0.1        0.77 ± 11%  perf-profile.children.cycles-pp.__x64_sys_rmdir
      0.12 ± 28%      +0.0        0.16 ± 20%      +0.0        0.12 ± 27%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp.sched_ttwu_pending
      3.33 ± 26%      +0.0        3.38 ± 15%      +0.2        3.55 ± 13%      +0.3        3.63 ± 11%  perf-profile.children.cycles-pp.do_umount
      0.09 ± 33%      +0.0        0.14 ± 16%      +0.0        0.14 ± 14%      +0.0        0.14 ± 18%  perf-profile.children.cycles-pp.strlen@plt
      0.11 ± 38%      +0.0        0.16 ± 17%      +0.1        0.18 ± 20%      +0.1        0.17 ±  7%  perf-profile.children.cycles-pp.d_lookup
      0.04 ± 83%      +0.0        0.08 ± 21%      -0.0        0.03 ±101%      +0.0        0.07 ± 25%  perf-profile.children.cycles-pp.shrink_dcache_parent
      0.74 ± 30%      +0.0        0.78 ± 16%      +0.0        0.78 ± 13%      +0.1        0.84 ± 14%  perf-profile.children.cycles-pp.path_parentat
      0.80 ± 29%      +0.0        0.85 ± 15%      +0.0        0.85 ± 12%      +0.1        0.92 ± 13%  perf-profile.children.cycles-pp.__filename_parentat
      0.06 ± 51%      +0.1        0.11 ± 11%      +0.0        0.10 ± 16%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.close_fd
      2.39 ± 23%      +0.1        2.44 ±  9%      -0.1        2.26 ± 13%      -0.1        2.31 ±  9%  perf-profile.children.cycles-pp.seq_read_iter
      0.30 ± 41%      +0.1        0.36 ± 16%      +0.1        0.36 ± 18%      +0.0        0.34 ± 14%  perf-profile.children.cycles-pp.shmem_mknod
      1.08 ± 10%      +0.1        1.13 ±  4%      +0.0        1.09 ± 12%      +0.0        1.13 ±  6%  perf-profile.children.cycles-pp.walk_component
      1.61 ± 32%      +0.1        1.66 ± 10%      +0.1        1.72 ± 12%      +0.2        1.77 ± 12%  perf-profile.children.cycles-pp.unlink
      0.55 ± 22%      +0.1        0.60 ±  3%      +0.0        0.56 ± 12%      +0.0        0.57 ± 10%  perf-profile.children.cycles-pp.__entry_text_start
      0.70 ± 31%      +0.1        0.75 ± 16%      +0.1        0.77 ± 18%      +0.0        0.73 ± 15%  perf-profile.children.cycles-pp.down_write
      2.59 ± 24%      +0.1        2.64 ±  9%      -0.1        2.48 ± 13%      -0.1        2.48 ±  7%  perf-profile.children.cycles-pp.ksys_read
      0.56 ± 24%      +0.1        0.62 ± 16%      +0.1        0.62 ± 19%      +0.1        0.64 ± 11%  perf-profile.children.cycles-pp.__synchronize_srcu
      0.37 ± 21%      +0.1        0.42 ±  7%      +0.0        0.39 ± 20%      +0.0        0.38 ± 12%  perf-profile.children.cycles-pp.cfree
      0.53 ± 18%      +0.1        0.58 ± 10%      +0.1        0.60 ± 15%      +0.0        0.56 ± 13%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.88 ± 25%      +0.1        0.93 ± 15%      +0.1        0.93 ± 11%      +0.1        0.96 ± 13%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
      0.26 ± 38%      +0.1        0.32 ± 10%      +0.1        0.35 ± 12%      +0.0        0.31 ± 20%  perf-profile.children.cycles-pp.vfs_mkdir
      2.53 ± 16%      +0.1        2.59 ±  5%      +0.1        2.63 ±  7%      +0.1        2.60        perf-profile.children.cycles-pp.link_path_walk
      0.19 ± 27%      +0.1        0.25 ± 16%      +0.0        0.23 ± 11%      +0.0        0.22 ± 14%  perf-profile.children.cycles-pp.percpu_free_rwsem
      0.00            +0.1        0.06 ± 52%      +0.1        0.08 ± 19%      +0.1        0.06 ± 53%  perf-profile.children.cycles-pp.init_timer_key
      0.22 ± 26%      +0.1        0.27 ± 22%      -0.0        0.21 ± 22%      +0.0        0.23 ±  6%  perf-profile.children.cycles-pp.device_add_property_aux
      0.80 ± 27%      +0.1        0.85 ± 14%      +0.1        0.86 ± 17%      +0.1        0.86 ±  9%  perf-profile.children.cycles-pp.open_last_lookups
      0.43 ± 31%      +0.1        0.48 ± 13%      +0.1        0.50 ± 15%      +0.0        0.44 ± 21%  perf-profile.children.cycles-pp.do_lock_mount
      0.18 ± 31%      +0.1        0.24 ± 20%      +0.0        0.20 ± 20%      +0.0        0.20 ± 15%  perf-profile.children.cycles-pp.__legitimize_mnt
      0.78 ± 26%      +0.1        0.84 ± 12%      +0.1        0.88 ± 12%      +0.1        0.85 ± 12%  perf-profile.children.cycles-pp.mkdir
      0.54 ± 27%      +0.1        0.60 ±  8%      +0.0        0.56 ± 15%      -0.0        0.53 ±  8%  perf-profile.children.cycles-pp.path_compare
      2.80 ± 25%      +0.1        2.86 ±  8%      -0.0        2.80 ± 13%      -0.1        2.73 ±  9%  perf-profile.children.cycles-pp.device_set_syspath
      0.17 ± 15%      +0.1        0.22 ± 39%      +0.0        0.20 ± 24%      +0.1        0.23 ± 23%  perf-profile.children.cycles-pp.complete
      2.57 ± 24%      +0.1        2.63 ±  9%      -0.1        2.45 ± 13%      -0.1        2.46 ±  8%  perf-profile.children.cycles-pp.vfs_read
      0.19 ± 27%      +0.1        0.25 ± 16%      +0.0        0.23 ± 11%      +0.0        0.22 ± 14%  perf-profile.children.cycles-pp.destroy_super_work
      0.88 ± 25%      +0.1        0.94 ± 16%      +0.1        0.94 ± 12%      +0.1        0.97 ± 13%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
      0.52 ± 22%      +0.1        0.58 ± 10%      +0.0        0.57 ± 13%      +0.0        0.55 ± 15%  perf-profile.children.cycles-pp.free_percpu
      0.26 ± 20%      +0.1        0.32 ± 13%      -0.0        0.26 ± 21%      +0.0        0.28 ± 11%  perf-profile.children.cycles-pp.format_decode
      5.39 ± 26%      +0.1        5.45 ± 14%      +0.3        5.71 ± 11%      +0.4        5.83 ± 11%  perf-profile.children.cycles-pp.__x64_sys_umount
      2.65 ± 28%      +0.1        2.71 ± 13%      +0.2        2.82 ± 15%      +0.3        2.94 ± 11%  perf-profile.children.cycles-pp.stress_rndstr
      0.87 ± 28%      +0.1        0.93 ± 15%      +0.1        0.96 ± 17%      +0.1        1.00 ± 13%  perf-profile.children.cycles-pp.process_srcu
      0.22 ± 33%      +0.1        0.28 ± 12%      +0.1        0.31 ± 12%      +0.1        0.29 ± 10%  perf-profile.children.cycles-pp.___slab_alloc
      0.76 ± 24%      +0.1        0.83 ± 10%      -0.0        0.74 ± 14%      -0.0        0.76 ±  9%  perf-profile.children.cycles-pp.vsnprintf
      0.64 ± 28%      +0.1        0.70 ±  8%      +0.0        0.68 ± 11%      +0.1        0.74 ± 15%  perf-profile.children.cycles-pp.vfs_symlink
      2.59 ± 19%      +0.1        2.65 ±  8%      +0.2        2.74 ±  7%      +0.1        2.66 ±  7%  perf-profile.children.cycles-pp.user_path_at_empty
      0.23 ± 21%      +0.1        0.29 ±  8%      +0.0        0.27 ± 14%      +0.0        0.28 ± 14%  perf-profile.children.cycles-pp.__x64_sys_close
      0.74 ± 25%      +0.1        0.81 ± 18%      +0.1        0.81 ± 15%      +0.1        0.83 ± 12%  perf-profile.children.cycles-pp.rmdir
      0.74 ± 27%      +0.1        0.80 ± 15%      +0.1        0.80 ±  8%      +0.1        0.81 ± 13%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
      0.55 ± 18%      +0.1        0.61 ± 10%      +0.1        0.63 ± 15%      +0.0        0.59 ± 14%  perf-profile.children.cycles-pp.activate_task
      2.78 ± 17%      +0.1        2.85 ±  6%      +0.1        2.90 ±  7%      +0.1        2.87 ±  5%  perf-profile.children.cycles-pp.open64
      0.32 ± 20%      +0.1        0.39 ±  6%      +0.1        0.39 ± 19%      +0.1        0.40 ±  9%  perf-profile.children.cycles-pp.__d_lookup
      4.47 ± 16%      +0.1        4.54 ±  4%      +0.1        4.57 ±  8%      -0.0        4.45 ±  2%  perf-profile.children.cycles-pp.do_sys_openat2
      4.50 ± 16%      +0.1        4.58 ±  4%      +0.1        4.61 ±  8%      -0.0        4.49 ±  2%  perf-profile.children.cycles-pp.__x64_sys_openat
      1.60 ± 22%      +0.1        1.68 ± 14%      +0.2        1.78 ±  7%      +0.2        1.79 ±  8%  perf-profile.children.cycles-pp.strncpy_from_user
      0.37 ± 31%      +0.1        0.45 ± 13%      +0.0        0.41 ± 14%      +0.0        0.41 ±  7%  perf-profile.children.cycles-pp.__legitimize_path
      1.34 ± 31%      +0.1        1.42 ± 11%      +0.1        1.47 ± 13%      +0.2        1.50 ± 12%  perf-profile.children.cycles-pp.do_unlinkat
      0.00            +0.1        0.08 ± 16%      +0.1        0.08 ± 52%      +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.pcpu_next_md_free_region
      0.11 ± 26%      +0.1        0.19 ± 42%      +0.1        0.17 ± 31%      +0.1        0.20 ± 31%  perf-profile.children.cycles-pp.srcu_invoke_callbacks
      0.09 ± 33%      +0.1        0.17 ± 43%      +0.1        0.16 ± 84%      +0.1        0.16 ± 59%  perf-profile.children.cycles-pp.srcu_gp_end
      0.43 ± 30%      +0.1        0.52 ± 13%      +0.0        0.46 ± 15%      +0.1        0.49 ± 11%  perf-profile.children.cycles-pp.try_to_unlazy
      2.65 ± 24%      +0.1        2.74 ±  9%      -0.1        2.56 ± 13%      -0.1        2.55 ±  7%  perf-profile.children.cycles-pp.read
      0.75 ± 21%      +0.1        0.84 ±  3%      +0.1        0.83 ± 12%      -0.0        0.75 ± 10%  perf-profile.children.cycles-pp.do_readlinkat
      1.47 ± 32%      +0.1        1.56 ± 12%      +0.1        1.62 ± 12%      +0.2        1.65 ± 12%  perf-profile.children.cycles-pp.__x64_sys_unlink
      0.15 ± 24%      +0.1        0.24 ± 13%      +0.1        0.24 ± 19%      +0.1        0.24 ±  5%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      1.30 ± 31%      +0.1        1.39 ±  9%      +0.0        1.32 ± 12%      +0.0        1.32 ± 12%  perf-profile.children.cycles-pp.malloc
      1.10 ± 29%      +0.1        1.19 ± 10%      +0.1        1.16 ±  9%      +0.1        1.19 ± 14%  perf-profile.children.cycles-pp.do_symlinkat
      0.01 ±200%      +0.1        0.10 ± 13%      +0.1        0.12 ± 31%      +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
      0.47 ± 27%      +0.1        0.56 ± 18%      +0.1        0.56 ± 16%      +0.1        0.60 ± 28%  perf-profile.children.cycles-pp.intel_idle_irq
      0.00            +0.1        0.09 ± 28%      +0.1        0.11 ± 14%      +0.1        0.10 ± 14%  perf-profile.children.cycles-pp.rmqueue_bulk
      3.15 ± 24%      +0.1        3.24 ±  8%      +0.0        3.15 ± 13%      -0.1        3.08 ±  9%  perf-profile.children.cycles-pp.sd_device_new_from_syspath
      2.14 ± 19%      +0.1        2.23 ± 14%      +0.2        2.35 ±  6%      +0.2        2.33 ±  8%  perf-profile.children.cycles-pp.getname_flags
      0.27 ± 23%      +0.1        0.37 ± 40%      +0.0        0.28 ± 27%      +0.0        0.30 ± 26%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.69 ± 21%      +0.1        0.79 ±  3%      +0.1        0.78 ± 12%      +0.0        0.71 ± 11%  perf-profile.children.cycles-pp.__x64_sys_readlinkat
      0.68 ± 18%      +0.1        0.78 ± 11%      +0.1        0.75 ± 16%      +0.1        0.77 ± 13%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.49 ± 23%      +0.1        0.59 ± 14%      +0.1        0.61 ± 23%      +0.1        0.59 ± 14%  perf-profile.children.cycles-pp.schedule_timeout
      2.45 ± 18%      +0.1        2.55 ±  6%      +0.1        2.54 ± 12%      +0.1        2.56 ±  7%  perf-profile.children.cycles-pp.__do_softirq
      1.08 ± 21%      +0.1        1.19 ± 12%      +0.1        1.16 ± 12%      +0.2        1.26 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.52 ± 26%      +0.1        0.63 ± 13%      +0.1        0.64 ± 22%      +0.2        0.68 ± 18%  perf-profile.children.cycles-pp.__queue_work
      1.24 ± 29%      +0.1        1.36 ± 11%      +0.1        1.30 ± 10%      +0.1        1.35 ± 14%  perf-profile.children.cycles-pp.__x64_sys_symlink
      0.44 ± 27%      +0.1        0.56 ± 11%      +0.1        0.57 ± 23%      +0.1        0.57 ± 23%  perf-profile.children.cycles-pp.queue_work_on
      0.71 ± 21%      +0.1        0.83 ±  4%      +0.1        0.82 ± 13%      +0.0        0.74 ± 11%  perf-profile.children.cycles-pp.readlinkat
      1.47 ± 17%      +0.1        1.59 ±  5%      +0.1        1.56 ± 10%      +0.0        1.49 ±  7%  perf-profile.children.cycles-pp.__close
      1.02 ± 18%      +0.1        1.14 ± 14%      +0.1        1.09 ± 18%      +0.1        1.11 ± 13%  perf-profile.children.cycles-pp.try_to_wake_up
      0.54 ± 25%      +0.1        0.66 ±  9%      +0.1        0.69 ± 14%      +0.2        0.71 ±  8%  perf-profile.children.cycles-pp.pcpu_alloc_area
      0.00            +0.1        0.12 ±118%      +0.0        0.05 ±182%      +0.1        0.10 ±122%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      1.31 ± 28%      +0.1        1.44 ± 11%      +0.1        1.38 ±  9%      +0.1        1.44 ± 12%  perf-profile.children.cycles-pp.symlink
      2.08 ± 22%      +0.1        2.20 ±  5%      +0.1        2.22 ± 12%      +0.2        2.27 ±  8%  perf-profile.children.cycles-pp.rcu_do_batch
      0.66 ± 24%      +0.1        0.79 ± 15%      +0.1        0.78 ± 21%      +0.1        0.76 ± 11%  perf-profile.children.cycles-pp.__wait_for_common
      0.23 ± 18%      +0.1        0.37 ± 47%      +0.1        0.30 ± 82%      +0.1        0.28 ± 62%  perf-profile.children.cycles-pp.poll_idle
      0.45 ± 15%      +0.1        0.60 ± 13%      +0.1        0.58 ± 10%      +0.2        0.60 ±  4%  perf-profile.children.cycles-pp.kmalloc_trace
      2.13 ± 22%      +0.1        2.28 ±  5%      +0.1        2.27 ± 12%      +0.2        2.31 ±  8%  perf-profile.children.cycles-pp.rcu_core
      0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.start_kernel
      0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.2        0.17 ± 16%      +0.2        0.20 ± 22%      +0.2        0.19 ± 14%  perf-profile.children.cycles-pp.rcu_segcblist_init
      0.86 ± 22%      +0.2        1.03 ± 11%      +0.2        1.02 ±  6%      +0.2        1.07 ±  4%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.01 ±200%      +0.2        0.19 ± 22%      +0.2        0.21 ± 14%      +0.2        0.20 ±  7%  perf-profile.children.cycles-pp.rmqueue
      0.03 ± 82%      +0.2        0.23 ± 25%      +0.2        0.24 ± 17%      +0.2        0.23 ± 12%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.2        0.22 ± 24%      +0.2        0.23 ± 20%      +0.2        0.23 ± 11%  perf-profile.children.cycles-pp.pcpu_alloc_pages
      0.05 ± 55%      +0.2        0.28 ± 22%      +0.2        0.29 ± 22%      +0.2        0.29 ± 12%  perf-profile.children.cycles-pp.__alloc_pages
      0.00            +0.3        0.27 ± 23%      +0.3        0.30 ± 22%      +0.3        0.27 ± 11%  perf-profile.children.cycles-pp.pcpu_populate_chunk
      0.00            +0.3        0.32 ± 19%      +0.4        0.36 ± 21%      +0.3        0.33 ± 14%  perf-profile.children.cycles-pp.pcpu_balance_populated
      0.00            +0.3        0.32 ± 19%      +0.4        0.36 ± 21%      +0.3        0.33 ± 15%  perf-profile.children.cycles-pp.pcpu_balance_workfn
      3.48 ± 25%      +0.6        4.08 ± 14%      +0.7        4.19 ± 11%      +0.8        4.23 ± 10%  perf-profile.children.cycles-pp.process_one_work
      4.38 ± 24%      +0.7        5.10 ± 13%      +0.8        5.19 ± 10%      +0.9        5.26 ± 10%  perf-profile.children.cycles-pp.worker_thread
      0.47 ± 21%      +0.7        1.19 ± 67%      +0.4        0.84 ± 66%      +0.7        1.15 ± 78%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.39 ± 24%      +0.7        1.13 ± 69%      +0.4        0.76 ± 68%      +0.7        1.09 ± 82%  perf-profile.children.cycles-pp.run_ksoftirqd
      1.28 ± 23%      +0.9        2.18 ± 14%      +0.9        2.16 ±  9%      +0.9        2.20 ±  9%  perf-profile.children.cycles-pp.memset_orig
      4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.children.cycles-pp.ret_from_fork
      4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.children.cycles-pp.kthread
      0.09 ± 35%      +1.5        1.55 ± 44%      +2.1        2.16 ± 21%      +2.3        2.43 ±  5%  perf-profile.children.cycles-pp.pcpu_find_block_fit
      2.83 ± 27%      +3.9        6.73 ± 20%      +5.3        8.09 ± 15%      +5.8        8.66 ±  6%  perf-profile.children.cycles-pp.pcpu_alloc
      2.84 ± 30%      +4.6        7.44 ± 18%      +6.1        8.92 ± 16%      +6.6        9.42 ±  6%  perf-profile.children.cycles-pp.vfs_get_super
      2.85 ± 30%      +4.6        7.46 ± 18%      +6.1        8.94 ± 16%      +6.6        9.44 ±  6%  perf-profile.children.cycles-pp.vfs_get_tree
      7.93 ± 28%      +4.7       12.61 ± 14%      +6.3       14.26 ± 13%      +7.0       14.98 ±  8%  perf-profile.children.cycles-pp.__x64_sys_mount
      1.56 ± 30%      +4.7        6.23 ± 21%      +6.0        7.55 ± 16%      +6.5        8.05 ±  5%  perf-profile.children.cycles-pp.alloc_super
      8.03 ± 28%      +4.7       12.71 ± 14%      +6.3       14.36 ± 13%      +7.1       15.09 ±  8%  perf-profile.children.cycles-pp.mount
      1.68 ± 30%      +4.7        6.37 ± 21%      +6.0        7.72 ± 16%      +6.5        8.20 ±  5%  perf-profile.children.cycles-pp.sget_fc
      7.20 ± 28%      +4.7       11.90 ± 15%      +6.3       13.53 ± 13%      +7.0       14.20 ±  9%  perf-profile.children.cycles-pp.do_new_mount
     35.29 ± 18%      +4.7       40.03 ±  7%      +7.1       42.35 ±  8%      +7.6       42.87 ±  5%  perf-profile.children.cycles-pp.do_syscall_64
     35.50 ± 18%      +4.7       40.25 ±  7%      +7.1       42.56 ±  8%      +7.6       43.07 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +4.9        4.91 ± 25%      +6.2        6.18 ± 16%      +6.6        6.61 ±  5%  perf-profile.children.cycles-pp.init_srcu_struct_fields
     37.09 ± 26%      -6.1       30.96 ± 10%      -8.1       28.98 ± 12%      -8.5       28.64 ±  8%  perf-profile.self.cycles-pp.intel_idle
      0.80 ± 15%      -0.1        0.70 ± 17%      +0.0        0.84 ± 24%      -0.1        0.73 ± 21%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.40 ± 19%      -0.1        0.32 ±  8%      -0.0        0.37 ± 19%      -0.1        0.33 ± 17%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.48 ± 24%      -0.1        0.41 ± 16%      -0.1        0.40 ± 16%      -0.1        0.38 ± 12%  perf-profile.self.cycles-pp.path_init
      0.57 ± 24%      -0.1        0.51 ± 12%      -0.0        0.57 ± 15%      +0.0        0.59 ±  8%  perf-profile.self.cycles-pp.mnt_get_writers
      0.58 ± 24%      -0.1        0.53 ± 19%      +0.0        0.58 ± 18%      +0.0        0.60 ± 16%  perf-profile.self.cycles-pp.try_check_zero
      0.08 ± 27%      -0.0        0.03 ±100%      -0.0        0.07 ± 23%      -0.0        0.04 ± 87%  perf-profile.self.cycles-pp.llist_reverse_order
      1.16 ± 23%      -0.0        1.12 ± 14%      -0.0        1.16 ± 15%      +0.1        1.29 ± 12%  perf-profile.self.cycles-pp.mnt_get_count
      0.17 ± 11%      -0.0        0.12 ± 15%      -0.0        0.14 ± 28%      -0.0        0.14 ± 35%  perf-profile.self.cycles-pp.read_tsc
      0.44 ±  5%      -0.0        0.40 ± 10%      +0.0        0.45 ± 15%      -0.0        0.43 ±  9%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.28 ±  8%      -0.0        0.24 ± 19%      -0.0        0.27 ± 19%      -0.0        0.25 ± 12%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.07 ± 16%      -0.0        0.03 ±100%      -0.0        0.05 ± 74%      -0.0        0.04 ± 88%  perf-profile.self.cycles-pp.__pthread_mutex_unlock_usercnt
      0.05 ± 57%      -0.0        0.01 ±223%      -0.0        0.05 ± 48%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.strspn@plt
      0.13 ± 17%      -0.0        0.09 ± 23%      -0.0        0.11 ± 22%      -0.0        0.09 ± 15%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.21 ± 13%      -0.0        0.17 ± 22%      +0.0        0.22 ± 20%      -0.0        0.19 ± 21%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.05 ± 56%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._ext4_show_options
      0.06 ± 10%      -0.0        0.02 ± 99%      -0.0        0.03 ±101%      -0.0        0.03 ± 81%  perf-profile.self.cycles-pp.load_balance
      0.04 ± 88%      -0.0        0.01 ±223%      -0.0        0.03 ±108%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.strjoin_real
      0.03 ±200%      -0.0        0.00            +0.0        0.04 ±147%      +0.0        0.07 ± 81%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.04 ± 82%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.calc_global_load_tick
      0.27 ± 35%      -0.0        0.24 ± 14%      -0.1        0.21 ± 17%      -0.1        0.20 ± 15%  perf-profile.self.cycles-pp.unit_name_is_valid
      0.08 ± 32%      -0.0        0.06 ± 47%      -0.0        0.06 ± 48%      -0.0        0.06 ± 18%  perf-profile.self.cycles-pp.slab_pre_alloc_hook
      0.17 ± 45%      -0.0        0.14 ± 21%      -0.0        0.14 ± 15%      -0.0        0.16 ±  8%  perf-profile.self.cycles-pp.apparmor_capable
      0.09 ± 23%      -0.0        0.06 ± 11%      -0.0        0.07 ± 53%      -0.0        0.04 ± 85%  perf-profile.self.cycles-pp.__pthread_mutex_lock
      0.17 ± 38%      -0.0        0.14 ± 11%      -0.0        0.16 ±  9%      -0.0        0.16 ± 20%  perf-profile.self.cycles-pp.up_read
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.sched_clock_cpu
      0.09 ± 17%      -0.0        0.07 ± 47%      -0.0        0.08 ± 52%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.__fget_light
      0.04 ± 50%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.seq_printf
      0.02 ±123%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±200%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.02 ±123%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.___d_drop
      0.05 ± 90%      -0.0        0.03 ±102%      -0.0        0.03 ±106%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.mnt_fstype_is_pseudofs
      0.06 ± 53%      -0.0        0.04 ±109%      -0.0        0.03 ±106%      -0.0        0.03 ±122%  perf-profile.self.cycles-pp.sync_regs
      0.05 ± 55%      -0.0        0.03 ±105%      +0.0        0.07 ± 28%      +0.0        0.06 ± 12%  perf-profile.self.cycles-pp.getdelim
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.vfs_read
      0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__d_rehash
      0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.pcpu_free_area
      0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rcu_note_context_switch
      0.03 ±130%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.shmem_show_options
      0.04 ± 90%      -0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.truncate_inode_pages_range
      0.04 ± 83%      -0.0        0.02 ±142%      -0.0        0.02 ± 99%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.ep_poll_callback
      0.03 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.self.cycles-pp.trigger_load_balance
      0.07 ± 57%      -0.0        0.05 ± 74%      +0.0        0.08 ± 18%      +0.0        0.08 ± 19%  perf-profile.self.cycles-pp.__srcu_read_unlock
      0.11 ± 15%      -0.0        0.09 ± 34%      +0.0        0.12 ± 36%      -0.0        0.09 ± 19%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.05 ± 86%      -0.0        0.03 ±102%      +0.0        0.05 ±  8%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.do_idle
      0.09 ± 35%      -0.0        0.08 ± 25%      -0.0        0.08 ± 14%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.17 ± 26%      -0.0        0.15 ± 13%      -0.0        0.16 ± 15%      -0.0        0.15 ±  7%  perf-profile.self.cycles-pp.rcu_all_qs
      0.15 ± 48%      -0.0        0.13 ± 30%      +0.0        0.15 ± 14%      -0.0        0.15 ± 15%  perf-profile.self.cycles-pp.__lookup_mnt
      0.13 ± 15%      -0.0        0.11 ± 26%      +0.0        0.14 ± 18%      +0.0        0.14 ± 16%  perf-profile.self.cycles-pp.check_heap_object
      0.24 ± 15%      -0.0        0.22 ± 11%      -0.0        0.22 ± 20%      -0.0        0.21 ± 11%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.02 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__flush_work
      0.21 ± 21%      -0.0        0.20 ± 14%      +0.0        0.24 ± 13%      +0.0        0.23 ± 12%  perf-profile.self.cycles-pp.generic_permission
      0.24 ± 34%      -0.0        0.22 ± 10%      -0.0        0.21 ± 21%      -0.0        0.21 ± 17%  perf-profile.self.cycles-pp.vsnprintf
      0.09 ± 21%      -0.0        0.07 ±  9%      -0.0        0.07 ± 55%      -0.0        0.07 ± 15%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.21 ± 17%      -0.0        0.20 ±  8%      -0.0        0.19 ± 19%      -0.0        0.20 ± 15%  perf-profile.self.cycles-pp.menu_select
      0.04 ± 53%      -0.0        0.03 ±101%      -0.0        0.04 ± 75%      -0.0        0.02 ±122%  perf-profile.self.cycles-pp.terminate_walk
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.08 ± 25%      -0.0        0.07 ± 14%      -0.0        0.05 ± 73%      -0.0        0.05 ± 85%  perf-profile.self.cycles-pp.mangle_path
      0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.check_stack_object
      0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._dbus_first_type_in_signature
      0.03 ±122%      -0.0        0.02 ±141%      -0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.open64
      0.04 ± 85%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 85%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.14 ± 20%      -0.0        0.13 ± 24%      -0.0        0.14 ± 17%      -0.0        0.12 ± 21%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.06 ± 54%      -0.0        0.04 ± 77%      +0.0        0.06 ± 48%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.xas_start
      0.03 ±123%      -0.0        0.01 ±223%      +0.0        0.04 ± 72%      -0.0        0.02 ±122%  perf-profile.self.cycles-pp.perf_pmu_nop_void
      0.07 ± 32%      -0.0        0.06 ± 52%      +0.0        0.08 ± 16%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.16 ± 18%      -0.0        0.15 ± 21%      -0.0        0.16 ± 18%      -0.0        0.15 ±  7%  perf-profile.self.cycles-pp.update_load_avg
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__get_fs_type
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.map_id_range_down
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.xa_load
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.reweight_entity
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.change_mnt_propagation
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.fput
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ±146%      -0.0        0.00        perf-profile.self.cycles-pp.update_process_times
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.self.cycles-pp.hashmap_get2
      0.04 ± 85%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.03 ± 84%  perf-profile.self.cycles-pp.update_cfs_group
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.complete_walk
      0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp._dbus_marshal_read_uint32
      0.03 ±130%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.strnlen
      0.04 ± 81%      -0.0        0.02 ± 99%      -0.0        0.00            -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.seq_puts
      0.16 ± 33%      -0.0        0.15 ± 11%      -0.0        0.16 ± 19%      -0.0        0.13 ± 27%  perf-profile.self.cycles-pp.smp_call_function_single
      0.07 ± 20%      -0.0        0.06 ± 50%      +0.0        0.08 ± 20%      +0.0        0.08 ± 20%  perf-profile.self.cycles-pp.common_perm_cond
      0.21 ± 15%      -0.0        0.20 ± 12%      -0.0        0.18 ± 14%      -0.0        0.19 ± 12%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
      0.20 ± 15%      -0.0        0.19 ± 12%      +0.0        0.21 ± 10%      -0.0        0.20 ±  6%  perf-profile.self.cycles-pp.__switch_to
      0.05 ± 56%      -0.0        0.04 ± 72%      -0.0        0.03 ±103%      +0.0        0.07 ± 11%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.alloc_empty_file
      0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.03 ±101%      +0.0        0.06 ± 51%  perf-profile.self.cycles-pp.memcg_destroy_list_lru
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.seq_read_iter
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.asm_sysvec_call_function_single
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._dbus_type_reader_recurse
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__list_lru_init
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.iput
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mntput
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.xas_expand
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.delete_trailing_chars
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.sd_bus_message_open_container
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.siphash24_init@plt
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.strsep
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.copy_tree
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.radix_tree_node_rcu_free
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.xas_create
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.select_task_rq
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.filemap_get_entry
      0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.page_counter_uncharge
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.srcu_advance_state
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__d_alloc
      0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.put_fs_context
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_insert_color
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.do_umount
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.vfs_unlink
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_next
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.greedy_realloc
      0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.inode_init_once
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.lookup_open
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.kmalloc_trace
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.deactivate_super
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.try_charge_memcg
      0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.should_failslab
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_load
      0.01 ±200%      -0.0        0.00            +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.self.cycles-pp.hrtimer_interrupt
      0.01 ±200%      -0.0        0.00            +0.0        0.03 ±103%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.newidle_balance
      0.38 ± 22%      -0.0        0.37 ±  8%      -0.0        0.38 ± 13%      +0.0        0.41 ± 10%  perf-profile.self.cycles-pp.mod_objcg_state
      0.11 ± 50%      -0.0        0.10 ± 21%      +0.0        0.12 ± 16%      +0.0        0.13 ± 31%  perf-profile.self.cycles-pp.xas_store
      0.06 ± 54%      -0.0        0.05 ± 46%      -0.0        0.05 ± 51%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.memcg_list_lru_alloc
      0.05 ± 51%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.worker_thread
      0.14 ± 26%      -0.0        0.13 ± 14%      +0.0        0.15 ± 14%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.___perf_sw_event
      0.03 ±123%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.__wake_up_common
      0.04 ± 83%      -0.0        0.03 ±100%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.d_walk
      0.08 ± 36%      -0.0        0.08 ± 21%      +0.0        0.09 ± 23%      +0.0        0.09 ± 19%  perf-profile.self.cycles-pp.__fput
      0.08 ± 17%      -0.0        0.08 ± 10%      +0.0        0.09 ± 30%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.pcpu_block_update
      0.10 ± 35%      -0.0        0.10 ± 28%      -0.0        0.09 ± 26%      -0.1        0.05 ± 55%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.10 ± 22%      -0.0        0.09 ± 25%      -0.0        0.08 ± 49%      -0.0        0.10 ± 12%  perf-profile.self.cycles-pp.rcu_pending
      0.09 ± 27%      -0.0        0.08 ± 20%      -0.0        0.09 ± 18%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp._copy_to_user
      0.06 ± 51%      -0.0        0.05 ± 49%      -0.0        0.02 ±144%      -0.0        0.04 ± 83%  perf-profile.self.cycles-pp.pcpu_block_update_hint_free
      0.05 ± 52%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.05 ± 51%  perf-profile.self.cycles-pp.__mnt_want_write
      0.03 ±122%      -0.0        0.02 ±142%      -0.0        0.03 ±100%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.02 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.07 ± 22%      -0.0        0.06 ± 19%      -0.0        0.06 ± 48%      -0.0        0.06 ± 54%  perf-profile.self.cycles-pp.generic_fillattr
      0.12 ± 29%      -0.0        0.11 ± 14%      +0.0        0.12 ± 18%      +0.0        0.13 ± 23%  perf-profile.self.cycles-pp._hashmap_first_key_and_value
      0.03 ±130%      -0.0        0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.02 ±125%  perf-profile.self.cycles-pp.strcspn@plt
      0.17 ± 24%      -0.0        0.16 ± 11%      +0.0        0.17 ± 15%      +0.0        0.18 ± 12%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.xas_clear_mark
      0.02 ±125%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._hashmap_get
      0.07 ± 52%      -0.0        0.07 ± 48%      +0.0        0.09 ± 23%      +0.0        0.08 ± 20%  perf-profile.self.cycles-pp.xas_descend
      0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.02 ±123%  perf-profile.self.cycles-pp.strncmp
      0.12 ± 22%      -0.0        0.12 ± 26%      +0.0        0.13 ± 17%      +0.0        0.13 ± 21%  perf-profile.self.cycles-pp.idle_cpu
      0.27 ± 17%      -0.0        0.26 ± 12%      +0.0        0.28 ± 16%      +0.0        0.28 ± 14%  perf-profile.self.cycles-pp.lockref_put_return
      0.11 ± 26%      -0.0        0.10 ± 33%      -0.0        0.11 ± 20%      +0.0        0.11 ± 22%  perf-profile.self.cycles-pp.realloc
      0.03 ±123%      -0.0        0.02 ±144%      -0.0        0.02 ±141%      +0.0        0.03 ± 81%  perf-profile.self.cycles-pp.fsnotify_destroy_marks
      0.15 ± 10%      -0.0        0.14 ± 18%      +0.0        0.15 ± 19%      -0.0        0.13 ±  8%  perf-profile.self.cycles-pp.filename_lookup
      0.24 ± 17%      -0.0        0.24 ±  7%      -0.0        0.24 ±  7%      -0.0        0.24 ± 11%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.11 ± 22%      -0.0        0.11 ± 16%      +0.0        0.12 ± 10%      +0.0        0.11 ± 10%  perf-profile.self.cycles-pp.set_root
      0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.copy_from_kernel_nofault
      0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.07 ± 50%      +0.0        0.03 ±127%  perf-profile.self.cycles-pp.os_xsave
      0.08 ± 34%      -0.0        0.08 ± 22%      -0.0        0.07 ± 54%      -0.0        0.07 ± 20%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.25 ± 25%      -0.0        0.24 ± 11%      +0.0        0.25 ± 12%      -0.0        0.23 ± 12%  perf-profile.self.cycles-pp.inode_permission
      0.08 ± 28%      -0.0        0.07 ± 18%      -0.0        0.08 ± 12%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.__memset
      0.06 ± 21%      -0.0        0.06 ± 51%      -0.0        0.05 ± 71%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.try_to_wake_up
      0.03 ± 82%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.build_open_flags
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.pcpu_block_refresh_hint
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.unit_name_escape
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__lxstat64
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_find
      0.03 ±128%      -0.0        0.03 ±102%      -0.0        0.03 ±101%      +0.0        0.06 ± 12%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.50 ± 24%      -0.0        0.50 ± 11%      -0.0        0.49 ± 16%      -0.1        0.45 ±  8%  perf-profile.self.cycles-pp.rdrand
      0.11 ± 21%      -0.0        0.11 ± 24%      +0.0        0.13 ± 11%      +0.0        0.13 ± 13%  perf-profile.self.cycles-pp.mutex_lock
      0.03 ± 81%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._IO_feof
      0.09 ± 15%      -0.0        0.09 ± 41%      -0.0        0.08 ± 50%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp._find_next_and_bit
      0.19 ± 25%      -0.0        0.19 ± 13%      -0.0        0.18 ± 13%      -0.0        0.18 ± 13%  perf-profile.self.cycles-pp.number
      0.08 ± 22%      -0.0        0.08 ± 31%      +0.0        0.09 ± 16%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06 ± 82%      -0.0        0.05 ± 80%      -0.0        0.06 ± 81%      -0.0        0.05 ± 91%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.27 ±  5%      -0.0        0.26 ±  9%      +0.0        0.28 ± 13%      +0.0        0.27 ± 15%  perf-profile.self.cycles-pp.__cond_resched
      0.09 ± 17%      -0.0        0.09 ± 11%      -0.0        0.08 ± 20%      -0.0        0.09 ± 17%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.11 ± 28%      -0.0        0.11 ± 17%      +0.0        0.12 ± 16%      -0.0        0.10 ± 17%  perf-profile.self.cycles-pp.lockref_get
      0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      +0.0        0.04 ± 82%  perf-profile.self.cycles-pp.may_delete
      0.16 ± 24%      -0.0        0.16 ± 13%      +0.0        0.19 ± 21%      +0.0        0.16 ± 17%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.show_type
      0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.04 ± 45%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.rcu_nocb_try_bypass
      0.06 ± 23%      -0.0        0.06 ± 45%      -0.0        0.03 ±106%      -0.0        0.04 ± 50%  perf-profile.self.cycles-pp.pick_next_entity
      0.05 ± 50%      -0.0        0.05 ± 47%      -0.0        0.04 ± 47%      +0.0        0.05 ± 54%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.09 ± 58%      -0.0        0.09 ± 11%      +0.0        0.11 ± 17%      +0.0        0.10 ± 21%  perf-profile.self.cycles-pp.do_dentry_open
      0.02 ±122%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.propagate_mnt
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.malloc@plt
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.memcg_init_list_lru_one
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.place_entity
      0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.siphash24_compress@plt
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.namespace_unlock
      0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__queue_work
      0.09 ± 17%      -0.0        0.09 ± 20%      -0.0        0.08 ± 23%      -0.0        0.08 ± 27%  perf-profile.self.cycles-pp.prepend_path
      0.09 ± 47%      -0.0        0.09 ± 24%      +0.0        0.10 ± 24%      +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.lookup_fast
      0.03 ±127%      -0.0        0.02 ± 99%      +0.0        0.03 ±100%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.vfs_create_mount
      0.23 ± 25%      -0.0        0.22 ±  9%      +0.0        0.24 ± 17%      +0.0        0.24 ±  4%  perf-profile.self.cycles-pp.__kmem_cache_free
      0.03 ± 82%      -0.0        0.03 ± 70%      -0.0        0.03 ±100%      +0.0        0.05 ± 57%  perf-profile.self.cycles-pp.ida_free
      0.08 ± 33%      -0.0        0.08 ± 16%      -0.0        0.08 ± 21%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.security_inode_permission
      0.06 ± 56%      -0.0        0.06 ± 50%      +0.0        0.07 ± 25%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.dequeue_entity
      0.12 ± 15%      +0.0        0.12 ± 13%      -0.0        0.11 ± 12%      +0.0        0.13 ± 16%  perf-profile.self.cycles-pp.string_escape_mem
      0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.security_capable
      0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.put_prev_entity
      0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.nd_jump_root
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.object_path_is_valid
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.pick_file
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.release_pages
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.shmem_getattr
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp._hashmap_size
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.security_inode_init_security
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.lookup_constant
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.locks_remove_posix
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.stress_mwc1
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.d_alloc_parallel
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.ktime_get_mono_fast_ns
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.apparmor_sb_mount
      0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.putname
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__fsnotify_parent
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.srcu_gp_start_if_needed
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.deactivate_locked_super
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.unlink
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.evict
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.lookup_one_qstr_excl
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.chacha_block_generic
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.dentry_kill
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_free_in_core_inode
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_evict_inode
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.ihold
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.i_callback
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.stress_ramfs_umount
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_find_marked
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.wake_up_bit
      0.07 ± 12%      +0.0        0.07 ± 16%      +0.0        0.08 ± 20%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.path_lookupat
      0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.vmalloc_to_page
      0.14 ± 19%      +0.0        0.14 ± 14%      +0.0        0.16 ± 19%      +0.0        0.15 ± 16%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.__bitmap_set
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.call_cpuidle
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.clear_page_erms
      0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.do_open
      0.00            +0.0        0.00            +0.0        0.02 ±146%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.00        perf-profile.self.cycles-pp.__dentry_kill
      0.08 ± 26%      +0.0        0.08 ± 27%      +0.0        0.11 ± 11%      +0.0        0.10 ± 13%  perf-profile.self.cycles-pp.__check_object_size
      0.00            +0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__x64_sys_umount
      0.05 ± 53%      +0.0        0.05 ± 46%      +0.0        0.08 ± 14%      +0.0        0.05 ± 56%  perf-profile.self.cycles-pp.propagation_next
      0.06 ± 53%      +0.0        0.06 ± 47%      +0.0        0.07 ± 20%      +0.0        0.07 ± 23%  perf-profile.self.cycles-pp.lockref_put_or_lock
      0.02 ±125%      +0.0        0.02 ±145%      +0.0        0.04 ± 72%      +0.0        0.04 ± 85%  perf-profile.self.cycles-pp.umount_tree
      0.02 ±125%      +0.0        0.02 ± 99%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.self.cycles-pp.inode_maybe_inc_iversion
      0.08 ± 17%      +0.0        0.08 ± 21%      +0.0        0.08 ±  5%      +0.0        0.09 ± 19%  perf-profile.self.cycles-pp.walk_component
      0.04 ± 82%      +0.0        0.04 ± 72%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.rb_erase
      0.13 ± 22%      +0.0        0.13 ±  8%      +0.0        0.14 ± 13%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.get_nr_inodes
      0.12 ± 29%      +0.0        0.12 ± 24%      +0.0        0.13 ± 11%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.update_curr
      0.14 ± 16%      +0.0        0.14 ± 15%      +0.0        0.14 ± 20%      +0.0        0.14 ± 14%  perf-profile.self.cycles-pp.task_work_add
      0.14 ± 25%      +0.0        0.14 ± 10%      -0.0        0.12 ± 22%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.13 ± 29%      +0.0        0.13 ± 22%      +0.0        0.13 ± 14%      +0.0        0.13 ±  6%  perf-profile.self.cycles-pp.get_nr_dirty_inodes
      0.02 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.rcu_do_batch
      0.12 ± 32%      +0.0        0.12 ± 22%      -0.0        0.11 ± 21%      +0.0        0.14 ± 26%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.__wait_for_common
      0.07 ± 23%      +0.0        0.08 ± 12%      -0.0        0.07 ± 24%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.task_work_run
      0.08 ± 20%      +0.0        0.08 ± 24%      +0.0        0.08 ± 27%      -0.0        0.08 ± 25%  perf-profile.self.cycles-pp.do_filp_open
      0.06 ± 14%      +0.0        0.06 ± 14%      -0.0        0.06 ± 46%      -0.0        0.05 ± 50%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.13 ± 17%      +0.0        0.13 ± 16%      +0.0        0.14 ± 15%      +0.0        0.15 ± 12%  perf-profile.self.cycles-pp.dput
      0.11 ± 19%      +0.0        0.11 ± 26%      +0.0        0.12 ± 12%      +0.0        0.13 ± 23%  perf-profile.self.cycles-pp.clone_mnt
      0.40 ± 26%      +0.0        0.40 ±  9%      -0.0        0.38 ± 13%      +0.0        0.40 ± 16%  perf-profile.self.cycles-pp.device_read_db_internal_filename
      0.27 ± 13%      +0.0        0.27 ± 12%      +0.0        0.28 ± 10%      -0.0        0.25 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.01 ±200%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.check_preempt_curr
      0.06 ± 65%      +0.0        0.07 ± 15%      -0.0        0.05 ± 48%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.string_table_lookup
      0.06 ± 51%      +0.0        0.07 ± 30%      +0.0        0.07 ± 13%      -0.0        0.06 ± 51%  perf-profile.self.cycles-pp.chacha_permute
      0.22 ± 20%      +0.0        0.23 ± 13%      +0.0        0.23 ± 10%      +0.0        0.25 ±  4%  perf-profile.self.cycles-pp.strlen
      0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 47%      +0.0        0.03 ± 84%  perf-profile.self.cycles-pp.update_min_vruntime
      0.11 ± 24%      +0.0        0.12 ± 13%      -0.0        0.11 ± 28%      -0.0        0.10 ± 20%  perf-profile.self.cycles-pp.vfs_getattr_nosec
      0.03 ± 81%      +0.0        0.04 ±101%      -0.0        0.00            +0.0        0.05 ± 51%  perf-profile.self.cycles-pp.cpuacct_charge
      0.08 ± 54%      +0.0        0.08 ± 20%      +0.0        0.08 ± 22%      -0.0        0.07 ± 13%  perf-profile.self.cycles-pp._hashmap_iterate
      0.12 ± 38%      +0.0        0.12 ± 14%      +0.0        0.14 ± 17%      +0.0        0.12 ± 18%  perf-profile.self.cycles-pp.siphash24_init
      0.06 ± 56%      +0.0        0.06 ± 14%      -0.0        0.05 ± 74%      -0.0        0.04 ± 83%  perf-profile.self.cycles-pp._hashmap_clear
      0.06 ± 59%      +0.0        0.06 ± 14%      +0.0        0.06 ± 14%      +0.0        0.07 ± 25%  perf-profile.self.cycles-pp.__do_sys_newfstat
      1.37 ± 23%      +0.0        1.38 ±  7%      -0.1        1.30 ± 14%      -0.1        1.27 ±  7%  perf-profile.self.cycles-pp.siphash24_compress
      0.09 ± 14%      +0.0        0.10 ± 23%      +0.0        0.10 ± 18%      +0.0        0.10 ± 20%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.10 ± 20%      +0.0        0.11 ± 13%      +0.0        0.11 ± 14%      +0.0        0.12 ± 27%  perf-profile.self.cycles-pp.do_syscall_64
      0.06 ± 50%      +0.0        0.07 ± 47%      +0.0        0.08 ± 24%      +0.0        0.07 ± 21%  perf-profile.self.cycles-pp.propagate_umount
      0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.02 ±144%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.current_time
      0.06 ± 57%      +0.0        0.07 ± 49%      +0.0        0.06 ± 45%      -0.0        0.06 ± 12%  perf-profile.self.cycles-pp.rcu_exp_handler
      0.45 ± 16%      +0.0        0.46 ± 15%      +0.0        0.46 ± 12%      -0.0        0.44 ± 10%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.alloc_super
      0.06 ± 54%      +0.0        0.07 ± 16%      -0.0        0.05 ± 72%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.path_equal
      0.04 ± 83%      +0.0        0.05 ± 71%      +0.0        0.06 ± 11%      -0.0        0.03 ± 84%  perf-profile.self.cycles-pp.kernfs_iop_permission
      0.06 ± 61%      +0.0        0.06 ± 24%      +0.0        0.07 ± 20%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.03 ±123%      +0.0        0.03 ±111%      +0.0        0.05 ± 73%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp.kmalloc_slab
      0.05 ± 86%      +0.0        0.05 ± 49%      +0.0        0.07 ± 24%      +0.0        0.05 ± 54%  perf-profile.self.cycles-pp.stress_ramfs_child
      0.18 ± 33%      +0.0        0.18 ± 27%      +0.0        0.19 ± 14%      +0.0        0.20 ± 20%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.24 ± 20%      +0.0        0.25 ±  7%      -0.0        0.23 ± 21%      +0.0        0.25 ±  9%  perf-profile.self.cycles-pp.__entry_text_start
      0.05 ± 58%      +0.0        0.06 ± 21%      -0.0        0.04 ± 78%      -0.0        0.05 ± 52%  perf-profile.self.cycles-pp._copy_from_user
      0.01 ±200%      +0.0        0.02 ±146%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.self.cycles-pp.check_cpu_stall
      0.06 ± 23%      +0.0        0.07 ± 23%      +0.0        0.08 ± 10%      +0.0        0.08 ± 31%  perf-profile.self.cycles-pp.kernfs_dop_revalidate
      0.09 ± 25%      +0.0        0.10 ± 20%      -0.0        0.08 ± 21%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.up_write
      0.10 ± 30%      +0.0        0.11 ± 10%      +0.0        0.12 ± 13%      +0.0        0.12 ± 25%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru
      0.01 ±200%      +0.0        0.02 ±144%      +0.0        0.02 ±142%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.try_to_unlazy
      0.34 ± 16%      +0.0        0.35 ± 12%      -0.0        0.33 ± 16%      +0.0        0.37 ±  9%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.21 ± 26%      +0.0        0.22 ±  6%      -0.0        0.20 ± 17%      -0.0        0.19 ± 15%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.10 ± 23%      +0.0        0.11 ± 16%      +0.0        0.12 ± 27%      +0.0        0.12 ± 16%  perf-profile.self.cycles-pp.refill_obj_stock
      0.01 ±200%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.kernfs_iop_getattr
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.seq_escape_mem
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.memcg_account_kmem
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_partial_node
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.available_idle_cpu
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.put_cpu_partial
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_page_from_freelist
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.pcpu_chunk_relocate
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_mountpoint
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.dbus_message_get_interface
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.string
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.percpu_free_rwsem
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±123%  perf-profile.self.cycles-pp.propagate_one
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.attach_recursive_mnt
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp._IO_link_in
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.show_mnt_opts
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__alloc_pages
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.05 ± 50%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.path_openat
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.path_umount
      0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ± 70%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.00        perf-profile.self.cycles-pp.__unfreeze_partials
      0.05 ± 57%      +0.0        0.06 ± 47%      -0.0        0.03 ±103%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.alloc_fd
      0.14 ± 20%      +0.0        0.15 ± 23%      +0.0        0.16 ± 21%      +0.0        0.16 ± 20%  perf-profile.self.cycles-pp.free_percpu
      0.10 ± 16%      +0.0        0.11 ± 20%      -0.0        0.09 ± 19%      +0.0        0.10 ±  9%  perf-profile.self.cycles-pp.strcmp
      0.07 ± 17%      +0.0        0.08 ± 25%      +0.0        0.09 ± 26%      -0.0        0.06 ± 51%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.09 ± 26%      +0.0        0.10 ± 17%      +0.0        0.09 ± 11%      +0.0        0.10 ± 21%  perf-profile.self.cycles-pp._IO_default_xsputn
      0.07 ± 53%      +0.0        0.08 ± 26%      -0.0        0.03 ±100%      -0.0        0.04 ± 85%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.26 ± 94%      +0.0        0.26 ± 84%      -0.0        0.24 ±115%      +0.0        0.30 ± 78%  perf-profile.self.cycles-pp.ktime_get
      0.03 ± 84%      +0.0        0.04 ± 73%      -0.0        0.02 ±144%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.sync_rcu_exp_select_cpus
      0.06 ± 30%      +0.0        0.07 ± 20%      -0.0        0.06 ± 17%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.map_id_up
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.__legitimize_path
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.srcu_invoke_callbacks
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__x64_sys_openat
      0.11 ± 30%      +0.0        0.12 ± 17%      +0.0        0.11 ± 23%      +0.0        0.12 ±  9%  perf-profile.self.cycles-pp.show_mountinfo
      0.06 ± 61%      +0.0        0.07 ± 25%      +0.0        0.07 ± 11%      +0.0        0.07 ± 16%  perf-profile.self.cycles-pp.finish_task_switch
      0.08 ± 13%      +0.0        0.09 ± 18%      -0.0        0.06 ± 48%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.init_file
      0.10 ± 33%      +0.0        0.12 ± 22%      +0.0        0.12 ± 20%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.cp_new_stat
      0.01 ±200%      +0.0        0.02 ± 99%      +0.0        0.04 ± 77%      -0.0        0.00        perf-profile.self.cycles-pp.tick_sched_do_timer
      0.32 ± 17%      +0.0        0.33 ± 12%      +0.0        0.35 ±  8%      +0.0        0.34 ± 14%  perf-profile.self.cycles-pp.__call_rcu_common
      0.18 ± 19%      +0.0        0.19 ± 14%      -0.0        0.17 ± 18%      -0.0        0.16 ±  6%  perf-profile.self.cycles-pp.strchr
      0.15 ± 25%      +0.0        0.17 ± 12%      -0.0        0.15 ± 13%      -0.0        0.14 ±  7%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.05 ± 53%      +0.0        0.07 ± 57%      +0.0        0.08 ± 14%      +0.0        0.08 ± 23%  perf-profile.self.cycles-pp.pcpu_block_update_hint_alloc
      0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ±103%      +0.1        0.07 ± 12%  perf-profile.self.cycles-pp.__bitmap_clear
      0.09 ± 28%      +0.0        0.10 ± 14%      -0.0        0.08 ± 29%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.hashmap_replace
      0.26 ± 26%      +0.0        0.28 ± 16%      +0.1        0.32 ± 13%      +0.1        0.32 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.06 ± 10%      +0.0        0.07 ± 51%      +0.0        0.08 ± 27%      +0.0        0.09 ± 18%  perf-profile.self.cycles-pp.inode_init_always
      0.04 ± 82%      +0.0        0.05 ± 71%      +0.0        0.06 ± 45%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      0.08 ± 24%      +0.0        0.09 ± 11%      +0.0        0.08 ± 13%      -0.0        0.08 ± 21%  perf-profile.self.cycles-pp.__fxstat64
      0.10 ±  9%      +0.0        0.11 ± 28%      +0.0        0.10 ± 12%      +0.0        0.11 ± 19%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.42 ±  9%      +0.0        0.43 ±  6%      +0.0        0.44 ±  6%      -0.0        0.41 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.03 ±123%      +0.0        0.04 ± 73%      -0.0        0.02 ±144%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.shmem_get_inode
      0.04 ± 83%      +0.0        0.05 ± 46%      +0.0        0.05 ± 45%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.queue_work_on
      0.56 ± 25%      +0.0        0.58 ± 10%      -0.0        0.56 ± 12%      -0.0        0.55 ±  9%  perf-profile.self.cycles-pp.kmem_cache_free
      0.10 ± 13%      +0.0        0.12 ±  7%      +0.0        0.12 ± 26%      +0.0        0.12 ± 28%  perf-profile.self.cycles-pp.enqueue_entity
      0.05 ± 50%      +0.0        0.07 ± 19%      +0.0        0.06 ± 54%      +0.0        0.08 ± 22%  perf-profile.self.cycles-pp.__filename_parentat
      0.01 ±200%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.strcmp@plt
      0.12 ± 22%      +0.0        0.14 ±  9%      +0.0        0.14 ±  8%      +0.0        0.15 ± 13%  perf-profile.self.cycles-pp.mutex_unlock
      0.06 ± 56%      +0.0        0.08 ± 46%      +0.0        0.07 ± 15%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.set_next_entity
      0.14 ± 26%      +0.0        0.15 ± 16%      +0.0        0.14 ± 13%      -0.0        0.11 ± 11%  perf-profile.self.cycles-pp.getname_flags
      0.05 ± 52%      +0.0        0.06 ± 48%      +0.0        0.05 ± 75%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.openat64
      0.27 ± 13%      +0.0        0.28 ± 25%      +0.0        0.30 ± 10%      +0.0        0.29 ± 13%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.06 ± 50%      +0.0        0.08 ± 23%      +0.0        0.07 ± 16%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.schedule
      0.06 ± 56%      +0.0        0.08 ± 22%      +0.0        0.07 ± 16%      +0.0        0.07 ± 36%  perf-profile.self.cycles-pp.path_simplify
      0.11 ± 25%      +0.0        0.13 ± 21%      +0.0        0.13 ± 14%      +0.0        0.11 ± 11%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.close_fd
      0.02 ±122%      +0.0        0.04 ±101%      +0.0        0.02 ± 99%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp.__libc_calloc
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.do_sys_openat2
      0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.synchronize_rcu_expedited
      0.18 ± 24%      +0.0        0.20 ± 14%      +0.0        0.18 ± 10%      +0.0        0.20 ± 12%  perf-profile.self.cycles-pp.pcpu_alloc_area
      0.11 ± 24%      +0.0        0.12 ± 15%      +0.0        0.12 ± 17%      +0.0        0.12 ± 25%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.09 ± 41%      +0.0        0.10 ± 37%      -0.0        0.08 ± 58%      +0.0        0.09 ± 18%  perf-profile.self.cycles-pp.llist_add_batch
      0.08 ± 22%      +0.0        0.10 ± 31%      +0.0        0.08 ± 34%      -0.0        0.07 ± 34%  perf-profile.self.cycles-pp.__close
      0.08 ± 27%      +0.0        0.10 ± 19%      +0.0        0.09 ± 18%      +0.0        0.09 ±  8%  perf-profile.self.cycles-pp.make_vfsuid
      0.65 ± 25%      +0.0        0.66 ±  6%      +0.0        0.67 ± 17%      +0.0        0.67 ± 14%  perf-profile.self.cycles-pp.__slab_free
      0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.strextend_with_separator
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.commit_tree
      0.00            +0.0        0.02 ±142%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.update_rq_clock
      0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.rcu_exp_wait_wake
      0.02 ±122%      +0.0        0.04 ± 75%      +0.0        0.04 ± 44%      +0.0        0.06 ± 54%  perf-profile.self.cycles-pp.strscpy
      0.14 ± 17%      +0.0        0.16 ± 10%      +0.0        0.16 ± 17%      +0.0        0.15 ± 18%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.06 ± 59%      +0.0        0.08 ± 44%      -0.0        0.06 ± 46%      -0.0        0.05 ± 51%  perf-profile.self.cycles-pp.path_hash_func
      0.45 ± 32%      +0.0        0.47 ± 15%      +0.0        0.50 ± 18%      +0.0        0.47 ± 15%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.08 ± 30%      +0.0        0.10 ± 25%      +0.0        0.10 ± 18%      +0.0        0.10 ± 22%  perf-profile.self.cycles-pp.string_hash_func
      0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.03 ±100%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.apparmor_file_open
      0.00            +0.0        0.02 ±144%      +0.0        0.01 ±223%      +0.0        0.03 ±127%  perf-profile.self.cycles-pp.__do_sys_newlstat
      0.08 ± 52%      +0.0        0.10 ± 18%      +0.0        0.12 ± 13%      +0.0        0.12 ± 21%  perf-profile.self.cycles-pp.ida_alloc_range
      0.10 ± 21%      +0.0        0.12 ± 19%      +0.0        0.10 ± 18%      +0.0        0.11 ± 10%  perf-profile.self.cycles-pp.down_write
      0.00            +0.0        0.02 ±146%      +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.rmqueue
      0.02 ±200%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      +0.0        0.04 ± 87%  perf-profile.self.cycles-pp.security_inode_getattr
      0.16 ± 28%      +0.0        0.18 ± 10%      +0.0        0.18 ± 12%      +0.0        0.17 ± 10%  perf-profile.self.cycles-pp._find_next_zero_bit
      0.04 ± 50%      +0.0        0.06 ± 17%      +0.0        0.07 ± 10%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.path_startswith
      0.56 ± 17%      +0.0        0.58 ±  5%      +0.0        0.59 ±  6%      +0.0        0.58 ±  4%  perf-profile.self.cycles-pp.link_path_walk
      0.45 ± 26%      +0.0        0.47 ±  9%      +0.0        0.48 ± 13%      -0.0        0.44 ±  6%  perf-profile.self.cycles-pp.path_compare
      0.14 ± 25%      +0.0        0.16 ± 14%      +0.0        0.16 ± 26%      +0.0        0.15 ± 21%  perf-profile.self.cycles-pp.mntput_no_expire
      0.10 ± 37%      +0.0        0.13 ± 32%      +0.0        0.13 ±  9%      +0.0        0.13 ± 19%  perf-profile.self.cycles-pp.alloc_vfsmnt
      0.07 ± 55%      +0.0        0.10 ± 23%      +0.0        0.09 ±  9%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.apparmor_file_free_security
      0.04 ± 85%      +0.0        0.06 ± 32%      +0.0        0.07 ± 21%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.free@plt
      0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.alloc_fs_context
      0.00            +0.0        0.02 ± 99%      +0.0        0.02 ±143%      +0.0        0.00        perf-profile.self.cycles-pp.strnlen_user
      0.16 ± 22%      +0.0        0.18 ± 15%      +0.0        0.18 ± 10%      +0.0        0.17 ±  8%  perf-profile.self.cycles-pp.down_read
      0.03 ± 84%      +0.0        0.06 ± 13%      +0.0        0.04 ± 45%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp._atomic_dec_and_lock
      0.29 ± 29%      +0.0        0.32 ± 12%      +0.0        0.34 ± 10%      +0.1        0.36 ± 13%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.10 ± 17%      +0.0        0.13 ± 10%      +0.0        0.11 ± 15%      +0.0        0.11 ± 15%  perf-profile.self.cycles-pp.memcpy_orig
      0.27 ± 32%      +0.0        0.30 ± 11%      +0.0        0.28 ±  9%      +0.0        0.29 ±  7%  perf-profile.self.cycles-pp.__check_heap_object
      0.04 ± 85%      +0.0        0.06 ± 14%      +0.0        0.07 ± 14%      +0.0        0.07 ± 34%  perf-profile.self.cycles-pp.strlen@plt
      0.07 ± 86%      +0.0        0.09 ± 23%      +0.0        0.08 ± 23%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.umount2
      0.04 ± 83%      +0.0        0.06 ± 25%      +0.0        0.08 ± 15%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.pcpu_next_fit_region
      0.13 ± 27%      +0.0        0.15 ±  9%      +0.0        0.13 ± 18%      +0.0        0.18 ± 14%  perf-profile.self.cycles-pp.kfree
      0.34 ± 14%      +0.0        0.37 ±  8%      +0.0        0.36 ± 16%      +0.0        0.38 ± 11%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.17 ± 33%      +0.0        0.20 ± 29%      +0.0        0.18 ± 16%      +0.0        0.19 ±  5%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.17 ± 36%      +0.0        0.20 ±  9%      -0.0        0.16 ± 22%      +0.0        0.17 ± 10%  perf-profile.self.cycles-pp.strchr@plt
      0.07 ± 25%      +0.0        0.10 ± 13%      +0.0        0.11 ± 35%      +0.0        0.11 ± 13%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.15 ± 34%      +0.0        0.18 ± 11%      +0.0        0.17 ± 17%      +0.0        0.19 ± 11%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.01 ±200%      +0.0        0.04 ± 73%      +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.prepare_task_switch
      0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.04 ± 71%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.strlcpy
      0.09 ± 79%      +0.0        0.12 ± 16%      +0.0        0.10 ± 14%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.strlcat
      0.07 ± 57%      +0.0        0.10 ± 18%      +0.0        0.11 ± 19%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.__list_add_valid
      0.11 ± 54%      +0.0        0.14 ± 25%      +0.0        0.14 ± 23%      +0.0        0.15 ± 16%  perf-profile.self.cycles-pp.process_one_work
      0.04 ± 85%      +0.0        0.07 ± 14%      +0.0        0.06 ± 46%      +0.0        0.07 ± 56%  perf-profile.self.cycles-pp.memcpy@plt
      0.08 ± 25%      +0.0        0.12 ± 22%      +0.0        0.10 ± 23%      +0.0        0.11 ± 24%  perf-profile.self.cycles-pp.__strdup
      0.13 ± 27%      +0.0        0.16 ± 15%      +0.0        0.15 ± 21%      +0.0        0.14 ± 23%  perf-profile.self.cycles-pp.device_read_uevent_file
      0.03 ±127%      +0.0        0.06 ± 17%      +0.0        0.04 ± 77%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.kernfs_get_target_path
      0.40 ± 33%      +0.0        0.44 ± 11%      +0.0        0.44 ± 19%      -0.0        0.39 ± 17%  perf-profile.self.cycles-pp.siphash24_finalize
      0.03 ±122%      +0.0        0.06 ± 17%      +0.1        0.09 ± 21%      +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.31 ± 22%      +0.0        0.34 ±  6%      +0.0        0.31 ± 21%      -0.0        0.30 ±  9%  perf-profile.self.cycles-pp.cfree
      0.02 ±200%      +0.0        0.05 ± 50%      +0.0        0.06 ± 54%      +0.0        0.06 ±  8%  perf-profile.self.cycles-pp.chase_symlinks
      0.02 ±122%      +0.0        0.06 ± 21%      +0.0        0.05 ± 47%      +0.0        0.05 ± 53%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.65 ± 27%      +0.0        0.68 ± 16%      -0.0        0.64 ± 16%      +0.1        0.71 ± 10%  perf-profile.self.cycles-pp.stress_mwc32
      0.05 ± 82%      +0.0        0.09 ± 15%      +0.0        0.08 ± 17%      +0.1        0.10 ± 27%  perf-profile.self.cycles-pp.mutex_lock_killable
      0.03 ±124%      +0.0        0.07 ± 48%      +0.0        0.05 ± 77%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.file_free_rcu
      0.03 ± 81%      +0.0        0.07 ± 20%      +0.0        0.08 ± 49%      +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
      1.34 ± 18%      +0.0        1.38 ±  6%      +0.1        1.47 ±  6%      +0.1        1.43 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock
      0.30 ± 32%      +0.0        0.35 ±  7%      +0.0        0.34 ±  6%      +0.1        0.36 ±  4%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.07 ± 23%      +0.0        0.12 ± 39%      +0.0        0.10 ± 41%      +0.0        0.10 ± 32%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.19 ± 30%      +0.0        0.24 ± 20%      +0.0        0.19 ± 22%      +0.0        0.19 ±  8%  perf-profile.self.cycles-pp.device_add_property_aux
      0.09 ± 60%      +0.0        0.14 ± 16%      +0.1        0.15 ± 19%      +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.___slab_alloc
      0.17 ± 29%      +0.1        0.22 ± 19%      +0.0        0.19 ± 20%      +0.0        0.18 ± 14%  perf-profile.self.cycles-pp.__legitimize_mnt
      0.00            +0.1        0.05 ± 50%      +0.1        0.07 ± 15%      +0.1        0.06 ± 53%  perf-profile.self.cycles-pp.init_timer_key
      0.27 ± 22%      +0.1        0.32 ±  9%      +0.0        0.30 ±  8%      +0.1        0.32 ± 10%  perf-profile.self.cycles-pp.step_into
      0.24 ± 21%      +0.1        0.30 ± 15%      +0.0        0.25 ± 21%      +0.0        0.27 ±  9%  perf-profile.self.cycles-pp.format_decode
      0.00            +0.1        0.06 ± 49%      +0.1        0.09 ± 21%      +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.26 ± 10%      +0.1        0.33 ± 23%      +0.1        0.33 ± 21%      +0.1        0.31 ± 11%  perf-profile.self.cycles-pp.__schedule
      0.18 ± 24%      +0.1        0.26 ±  9%      +0.1        0.25 ± 25%      +0.1        0.26 ± 16%  perf-profile.self.cycles-pp.__d_lookup
      0.91 ± 22%      +0.1        0.99 ± 15%      +0.1        1.05 ±  5%      +0.2        1.08 ± 12%  perf-profile.self.cycles-pp.strncpy_from_user
      0.00            +0.1        0.08 ± 16%      +0.1        0.08 ± 52%      +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.pcpu_next_md_free_region
      1.18 ± 28%      +0.1        1.26 ± 13%      +0.2        1.35 ±  9%      +0.2        1.41 ±  6%  perf-profile.self.cycles-pp._find_next_bit
      1.03 ± 22%      +0.1        1.11 ± 13%      +0.1        1.09 ± 10%      +0.2        1.18 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.15 ± 23%      +0.1        0.23 ± 14%      +0.1        0.23 ± 18%      +0.1        0.23 ±  7%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      1.24 ± 32%      +0.1        1.33 ±  8%      +0.0        1.25 ± 13%      +0.0        1.26 ± 12%  perf-profile.self.cycles-pp.malloc
      0.39 ± 31%      +0.1        0.49 ± 24%      +0.1        0.47 ± 20%      +0.2        0.55 ± 32%  perf-profile.self.cycles-pp.intel_idle_irq
      2.44 ± 28%      +0.1        2.55 ± 11%      +0.2        2.63 ± 13%      +0.3        2.78 ± 10%  perf-profile.self.cycles-pp.stress_rndstr
      0.21 ± 18%      +0.2        0.36 ± 48%      +0.1        0.28 ± 84%      +0.1        0.27 ± 62%  perf-profile.self.cycles-pp.poll_idle
      0.00            +0.2        0.16 ± 14%      +0.2        0.20 ± 20%      +0.2        0.19 ± 13%  perf-profile.self.cycles-pp.rcu_segcblist_init
      0.00            +0.3        0.25 ± 13%      +0.2        0.25 ± 19%      +0.2        0.23 ± 12%  perf-profile.self.cycles-pp.init_srcu_struct_fields
      1.16 ± 22%      +0.9        2.05 ± 13%      +0.9        2.04 ±  9%      +0.9        2.06 ±  9%  perf-profile.self.cycles-pp.memset_orig
      0.57 ± 27%      +1.3        1.86 ± 28%      +1.8        2.39 ± 15%      +2.1        2.70 ±  6%  perf-profile.self.cycles-pp.pcpu_alloc
      0.02 ±125%      +1.5        1.49 ± 45%      +2.1        2.08 ± 21%      +2.3        2.37 ±  5%  perf-profile.self.cycles-pp.pcpu_find_block_fit



> 
> Thanks!
> Amir.
> 
> > testcase: stress-ng
> > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
> > parameters:
> >
> >         nr_threads: 1
> >         disk: 1HDD
> >         testtime: 60s
> >         fs: ext4
> >         class: os
> >         test: ramfs
> >         cpufreq_governor: performance
> >
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-oliver.sang@intel.com
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
> > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> >   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
> >
> > commit:
> >   1af0557e94 ("fanotify: report file range info with FAN_ACCESSS_PERM")
> >   e796a59711 ("vfs: implement 'vfs write barriers'")
> >
> > 1af0557e94fc3d07 e796a59711433d5400947b2dbfa
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       0.14 ą  4%      -0.0        0.13 ą  5%  mpstat.cpu.all.soft%
> >     144866 ą  5%     -17.1%     120041 ą  5%  turbostat.C1
> >      10.15           +15.2%      11.70        turbostat.RAMWatt
> >     187740 ą  2%     -10.7%     167653 ą  2%  vmstat.system.cs
> >      82600            -5.3%      78240        vmstat.system.in
> >    1371303           -13.0%    1193418 ą  2%  stress-ng.ramfs.ops
> >      22854           -13.0%      19890 ą  2%  stress-ng.ramfs.ops_per_sec
> >    2747427           -11.6%    2429872 ą  2%  stress-ng.time.involuntary_context_switches
> >    3637751          +234.9%   12182075        meminfo.Memused
> >      17971        +48231.5%    8685746        meminfo.Percpu
> >      90936          +318.7%     380776        meminfo.SUnreclaim
> >      38661 ą  9%     -15.1%      32830        meminfo.Shmem
> >     185820          +155.8%     475366        meminfo.Slab
> >      20482         +2199.2%     470939        meminfo.VmallocUsed
> >    4118313          +196.0%   12189340        meminfo.max_used_kB
> >    3173298            -6.7%    2960000        proc-vmstat.nr_dirty_background_threshold
> >    6354356            -6.7%    5927238        proc-vmstat.nr_dirty_threshold
> >   31991368            -6.7%   29855261        proc-vmstat.nr_free_pages
> >      84482            -1.8%      82927        proc-vmstat.nr_inactive_anon
> >       9666 ą  9%     -15.1%       8208        proc-vmstat.nr_shmem
> >      22729          +318.8%      95193        proc-vmstat.nr_slab_unreclaimable
> >      84482            -1.8%      82927        proc-vmstat.nr_zone_inactive_anon
> >    1201688          +345.6%    5354530 ą  2%  proc-vmstat.numa_hit
> >    1197711          +347.0%    5353325 ą  2%  proc-vmstat.numa_local
> >     117966            -5.9%     110951        proc-vmstat.pgactivate
> >    1887107 ą  2%    +211.6%    5880960 ą  2%  proc-vmstat.pgalloc_normal
> >    1867687 ą  2%     -23.1%    1435439 ą  4%  proc-vmstat.pgfree
> >       3.47 ą  2%     +13.1%       3.92        perf-stat.i.MPKI
> >    2.7e+09            -1.4%  2.661e+09        perf-stat.i.branch-instructions
> >       2.94 ą  2%      +9.7       12.62 ą  2%  perf-stat.i.cache-miss-rate%
> >    1385785 ą  2%    +377.9%    6622542        perf-stat.i.cache-misses
> >   45772191           +14.2%   52251891        perf-stat.i.cache-references
> >     196041 ą  2%     -10.7%     174973 ą  2%  perf-stat.i.context-switches
> >     781.05 ą  2%      -8.0%     718.25 ą  3%  perf-stat.i.cpu-migrations
> >      26083 ą 14%     -94.4%       1461        perf-stat.i.cycles-between-cache-misses
> >     162575 ą  7%     +30.9%     212809 ą  3%  perf-stat.i.dTLB-load-misses
> >       0.01 ą  4%      +0.0        0.01 ą  3%  perf-stat.i.dTLB-store-miss-rate%
> >     102941 ą  3%    +119.0%     225459 ą  2%  perf-stat.i.dTLB-store-misses
> >  1.719e+09            +4.1%   1.79e+09        perf-stat.i.dTLB-stores
> >      64.33            -1.6       62.68        perf-stat.i.iTLB-load-miss-rate%
> >    3323983 ą  3%      -7.4%    3079335 ą  2%  perf-stat.i.iTLB-load-misses
> >       4052 ą  2%      +8.0%       4375 ą  2%  perf-stat.i.instructions-per-iTLB-miss
> >       0.07 ą 48%    +306.5%       0.27 ą 23%  perf-stat.i.major-faults
> >      91.27 ą  3%     +85.0%     168.88 ą  7%  perf-stat.i.metric.K/sec
> >     167705 ą  5%     +83.6%     307965 ą  3%  perf-stat.i.node-loads
> >     294581 ą  8%    +866.8%    2848095 ą 12%  perf-stat.i.node-stores
> >       3.45           +14.3%       3.95        perf-stat.overall.MPKI
> >       3.03 ą  3%      +9.7       12.68 ą  2%  perf-stat.overall.cache-miss-rate%
> >       6505 ą  3%     -79.1%       1359        perf-stat.overall.cycles-between-cache-misses
> >       0.01 ą  8%      +0.0        0.01 ą  3%  perf-stat.overall.dTLB-load-miss-rate%
> >       0.01 ą  3%      +0.0        0.01 ą  3%  perf-stat.overall.dTLB-store-miss-rate%
> >      64.58            -1.7       62.93        perf-stat.overall.iTLB-load-miss-rate%
> >       3994 ą  3%      +7.7%       4301 ą  2%  perf-stat.overall.instructions-per-iTLB-miss
> >  2.657e+09            -1.4%  2.619e+09        perf-stat.ps.branch-instructions
> >    1364289 ą  2%    +377.7%    6517813        perf-stat.ps.cache-misses
> >   45049468           +14.1%   51423471        perf-stat.ps.cache-references
> >     192941 ą  2%     -10.8%     172197 ą  2%  perf-stat.ps.context-switches
> >     768.70 ą  2%      -8.0%     706.85 ą  3%  perf-stat.ps.cpu-migrations
> >     160021 ą  7%     +30.9%     209447 ą  3%  perf-stat.ps.dTLB-load-misses
> >     101316 ą  3%    +119.0%     221881 ą  2%  perf-stat.ps.dTLB-store-misses
> >  1.692e+09            +4.1%  1.761e+09        perf-stat.ps.dTLB-stores
> >    3271471 ą  3%      -7.4%    3030527 ą  2%  perf-stat.ps.iTLB-load-misses
> >       0.07 ą 48%    +306.3%       0.27 ą 23%  perf-stat.ps.major-faults
> >     165092 ą  5%     +83.6%     303115 ą  3%  perf-stat.ps.node-loads
> >     290015 ą  8%    +866.5%    2802974 ą 12%  perf-stat.ps.node-stores
> >      10.46 ą  7%      -1.9        8.54 ą 16%  perf-profile.calltrace.cycles-pp.umount2
> >      10.08 ą  7%      -1.8        8.23 ą 16%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
> >      10.03 ą  7%      -1.8        8.19 ą 16%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       6.16 ą  8%      -1.1        5.06 ą 17%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       4.23 ą  7%      -0.8        3.46 ą 17%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       4.74 ą  7%      -0.8        3.98 ą  7%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       3.82 ą  7%      -0.8        3.07 ą 15%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       3.84 ą  7%      -0.7        3.09 ą 15%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       4.62 ą  7%      -0.7        3.88 ą  8%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
> >       3.80 ą  7%      -0.7        3.14 ą 16%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       3.07 ą  6%      -0.6        2.45 ą 14%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       2.64 ą  6%      -0.5        2.10 ą 13%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
> >       2.53 ą  6%      -0.5        2.02 ą 13%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
> >       2.83 ą  7%      -0.5        2.32 ą 12%  perf-profile.calltrace.cycles-pp.stress_rndstr
> >       2.48 ą  7%      -0.5        1.96 ą 12%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
> >       2.44 ą  7%      -0.5        1.94 ą 13%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
> >       2.39 ą  8%      -0.5        1.91 ą 16%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
> >       2.11 ą  7%      -0.4        1.68 ą 12%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
> >       1.31 ą  9%      -0.4        0.88 ą 16%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> >       1.85 ą  8%      -0.4        1.46 ą 11%  perf-profile.calltrace.cycles-pp.unlink
> >       1.20 ą  9%      -0.4        0.81 ą 16%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
> >       1.77 ą  9%      -0.4        1.39 ą 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       1.77 ą  8%      -0.4        1.40 ą 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
> >       1.74 ą  9%      -0.4        1.38 ą 11%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       1.40 ą  9%      -0.3        1.05 ą 15%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
> >       1.59 ą  8%      -0.3        1.26 ą 11%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       0.66 ą 12%      -0.3        0.37 ą 70%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.86 ą 12%      -0.3        0.58 ą 46%  perf-profile.calltrace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thread.kthread
> >       0.87 ą  9%      -0.3        0.60 ą 46%  perf-profile.calltrace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
> >       0.83 ą  6%      -0.2        0.58 ą 45%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> >       0.78 ą 12%      -0.2        0.54 ą 45%  perf-profile.calltrace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_work.worker_thread
> >       0.75 ą  7%      -0.2        0.51 ą 45%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
> >       1.07 ą  7%      -0.2        0.84 ą 17%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
> >       0.59 ą  2%      -0.2        0.36 ą 70%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
> >       1.08 ą  6%      -0.2        0.85 ą 17%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
> >       1.03 ą 11%      -0.2        0.80 ą 16%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
> >       0.73 ą  4%      -0.2        0.52 ą 46%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
> >       0.69 ą  7%      -0.2        0.49 ą 44%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       1.03 ą  3%      -0.2        0.84 ą 16%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
> >       0.92 ą  7%      -0.2        0.75 ą  9%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       1.09            -0.2        0.92 ą  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       1.10            -0.2        0.94 ą  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       1.19            -0.2        1.04 ą  6%  perf-profile.calltrace.cycles-pp.__lxstat64
> >       0.85 ą 11%      -0.2        0.69 ą  7%  perf-profile.calltrace.cycles-pp.rmdir
> >       1.06            -0.2        0.90 ą  6%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       0.78 ą 10%      -0.1        0.63 ą  6%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.79 ą 11%      -0.1        0.65 ą  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.79 ą 11%      -0.1        0.65 ą  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.94 ą  3%      -0.1        0.80 ą  8%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       0.74 ą  3%      -0.1        0.64 ą  7%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.64 ą 12%      +0.1        0.78 ą 14%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
> >       1.07 ą 10%      +0.2        1.24 ą 11%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
> >       1.06 ą  9%      +0.2        1.24 ą 11%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
> >       1.18 ą  9%      +0.2        1.37 ą  9%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
> >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.24 ą 11%      +0.2        1.45 ą 10%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.26 ą 11%      +0.2        1.47 ą 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.27 ą 11%      +0.2        1.48 ą 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.34 ą 11%      +0.2        1.58 ą  9%  perf-profile.calltrace.cycles-pp.clock_nanosleep
> >       0.00            +0.8        0.79 ą 20%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> >       0.00            +1.6        1.61 ą 31%  perf-profile.calltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> >       9.19 ą  7%      +3.2       12.40 ą 11%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       9.28 ą  7%      +3.2       12.49 ą 11%  perf-profile.calltrace.cycles-pp.mount
> >       9.21 ą  7%      +3.2       12.43 ą 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       9.23 ą  7%      +3.2       12.44 ą 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
> >       8.33 ą  7%      +3.4       11.70 ą 11%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       3.18 ą  6%      +4.3        7.52 ą 14%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
> >       3.19 ą  6%      +4.3        7.54 ą 14%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.00            +4.5        4.48 ą 22%  perf-profile.calltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
> >       1.87 ą  8%      +4.6        6.48 ą 15%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> >       1.73 ą  9%      +4.6        6.37 ą 16%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
> >       0.00            +5.1        5.13 ą 19%  perf-profile.calltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> >      10.53 ą  7%      -1.9        8.60 ą 16%  perf-profile.children.cycles-pp.umount2
> >       6.16 ą  8%      -1.1        5.06 ą 17%  perf-profile.children.cycles-pp.__x64_sys_umount
> >       4.24 ą  7%      -0.8        3.46 ą 17%  perf-profile.children.cycles-pp.path_umount
> >       4.77 ą  7%      -0.7        4.09 ą  6%  perf-profile.children.cycles-pp.task_work_run
> >       3.07 ą  6%      -0.6        2.46 ą 14%  perf-profile.children.cycles-pp.attach_recursive_mnt
> >       2.71 ą  7%      -0.6        2.13 ą 12%  perf-profile.children.cycles-pp.alloc_vfsmnt
> >       3.03 ą  7%      -0.5        2.48 ą 12%  perf-profile.children.cycles-pp.stress_rndstr
> >       2.64 ą  6%      -0.5        2.10 ą 13%  perf-profile.children.cycles-pp.propagate_mnt
> >       2.54 ą  7%      -0.5        2.02 ą 13%  perf-profile.children.cycles-pp.propagate_one
> >       2.48 ą  7%      -0.5        1.97 ą 12%  perf-profile.children.cycles-pp.copy_tree
> >       2.45 ą  7%      -0.5        1.96 ą 12%  perf-profile.children.cycles-pp.clone_mnt
> >       2.39 ą  8%      -0.5        1.91 ą 16%  perf-profile.children.cycles-pp.deactivate_locked_super
> >       1.31 ą  9%      -0.4        0.89 ą 16%  perf-profile.children.cycles-pp.__percpu_init_rwsem
> >       1.86 ą  8%      -0.4        1.47 ą 11%  perf-profile.children.cycles-pp.unlink
> >       2.50 ą  8%      -0.4        2.12 ą  8%  perf-profile.children.cycles-pp.getname_flags
> >       1.75 ą  9%      -0.4        1.38 ą 11%  perf-profile.children.cycles-pp.__x64_sys_unlink
> >       1.76 ą  8%      -0.3        1.41 ą 15%  perf-profile.children.cycles-pp.mnt_get_count
> >       1.59 ą  8%      -0.3        1.26 ą 11%  perf-profile.children.cycles-pp.do_unlinkat
> >       1.90 ą  8%      -0.3        1.59 ą  7%  perf-profile.children.cycles-pp.strncpy_from_user
> >       1.33 ą  8%      -0.3        1.07 ą  3%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> >       1.36 ą  9%      -0.3        1.10 ą 14%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
> >       0.89 ą 13%      -0.2        0.64 ą 20%  perf-profile.children.cycles-pp.__wait_for_common
> >       1.07 ą  7%      -0.2        0.84 ą 17%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
> >       1.08 ą  6%      -0.2        0.85 ą 17%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
> >       0.97 ą  5%      -0.2        0.74 ą 13%  perf-profile.children.cycles-pp.__filename_parentat
> >       0.90 ą  5%      -0.2        0.68 ą 13%  perf-profile.children.cycles-pp.path_parentat
> >       0.86 ą 11%      -0.2        0.67 ą 15%  perf-profile.children.cycles-pp.srcu_advance_state
> >       0.82 ą 12%      -0.2        0.64 ą 15%  perf-profile.children.cycles-pp.try_check_zero
> >       0.93 ą  8%      -0.2        0.74 ą 14%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
> >       0.67 ą 14%      -0.2        0.49 ą 18%  perf-profile.children.cycles-pp.schedule_timeout
> >       0.93 ą 10%      -0.2        0.75 ą 17%  perf-profile.children.cycles-pp.alloc_inode
> >       0.83 ą  6%      -0.2        0.65 ą 17%  perf-profile.children.cycles-pp.shmem_fill_super
> >       0.93 ą  7%      -0.2        0.76 ą  8%  perf-profile.children.cycles-pp.open_last_lookups
> >       1.24            -0.2        1.07 ą  6%  perf-profile.children.cycles-pp.__lxstat64
> >       0.88 ą  5%      -0.2        0.71 ą 11%  perf-profile.children.cycles-pp.__check_object_size
> >       0.75 ą  7%      -0.2        0.60 ą 10%  perf-profile.children.cycles-pp.lookup_open
> >       0.86 ą 10%      -0.2        0.70 ą  6%  perf-profile.children.cycles-pp.rmdir
> >       0.66 ą 12%      -0.2        0.51 ą 15%  perf-profile.children.cycles-pp.vfs_create_mount
> >       1.07            -0.2        0.92 ą  7%  perf-profile.children.cycles-pp.__do_sys_newlstat
> >       0.78 ą 10%      -0.1        0.63 ą  6%  perf-profile.children.cycles-pp.__x64_sys_rmdir
> >       0.69 ą  5%      -0.1        0.56 ą 11%  perf-profile.children.cycles-pp.__d_alloc
> >       0.73 ą  2%      -0.1        0.60 ą 15%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
> >       0.69 ą  7%      -0.1        0.57 ą  8%  perf-profile.children.cycles-pp.do_rmdir
> >       0.41 ą  4%      -0.1        0.30 ą 17%  perf-profile.children.cycles-pp.xas_store
> >       0.16 ą 22%      -0.1        0.06 ą 60%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
> >       0.47 ą  9%      -0.1        0.38 ą 13%  perf-profile.children.cycles-pp.d_alloc
> >       0.41 ą 10%      -0.1        0.33 ą 12%  perf-profile.children.cycles-pp.truncate_inode_pages_range
> >       0.39 ą  5%      -0.1        0.32 ą 13%  perf-profile.children.cycles-pp.check_heap_object
> >       0.39 ą  4%      -0.1        0.32 ą 15%  perf-profile.children.cycles-pp.list_lru_destroy
> >       0.33 ą  5%      -0.1        0.27 ą 14%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
> >       0.24 ą  7%      -0.1        0.17 ą 14%  perf-profile.children.cycles-pp.finish_task_switch
> >       0.16 ą  9%      -0.1        0.10 ą 28%  perf-profile.children.cycles-pp.change_mnt_propagation
> >       0.60 ą  8%      -0.1        0.54 ą  5%  perf-profile.children.cycles-pp.__dentry_kill
> >       0.24 ą 11%      -0.1        0.18 ą 21%  perf-profile.children.cycles-pp.__virt_addr_valid
> >       0.24 ą 15%      -0.1        0.18 ą 12%  perf-profile.children.cycles-pp.security_capable
> >       0.23 ą  3%      -0.1        0.17 ą  9%  perf-profile.children.cycles-pp.copy_mount_options
> >       0.18 ą  5%      -0.1        0.12 ą 21%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
> >       0.09 ą 15%      -0.0        0.04 ą 73%  perf-profile.children.cycles-pp.mnt_release_group_id
> >       0.22 ą  6%      -0.0        0.18 ą 21%  perf-profile.children.cycles-pp.fsnotify_grab_connector
> >       0.11 ą 16%      -0.0        0.07 ą 24%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
> >       0.12 ą 25%      -0.0        0.08 ą 21%  perf-profile.children.cycles-pp.__smp_call_single_queue
> >       0.18 ą  5%      -0.0        0.14 ą 23%  perf-profile.children.cycles-pp.wq_worker_sleeping
> >       0.12 ą 11%      +0.0        0.16 ą 15%  perf-profile.children.cycles-pp.read_tsc
> >       0.08 ą  9%      +0.1        0.14 ą 28%  perf-profile.children.cycles-pp.tick_nohz_next_event
> >       0.15 ą  6%      +0.1        0.22 ą 18%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
> >       0.00            +0.1        0.07 ą 20%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
> >       0.00            +0.1        0.08 ą 14%  perf-profile.children.cycles-pp.init_timer_key
> >       0.00            +0.1        0.10 ą 29%  perf-profile.children.cycles-pp.rmqueue_bulk
> >       0.04 ą 50%      +0.2        0.21 ą 19%  perf-profile.children.cycles-pp.get_page_from_freelist
> >       0.00            +0.2        0.18 ą 19%  perf-profile.children.cycles-pp.rcu_segcblist_init
> >       0.00            +0.2        0.18 ą 20%  perf-profile.children.cycles-pp.rmqueue
> >       0.08 ą  9%      +0.2        0.26 ą 11%  perf-profile.children.cycles-pp.__alloc_pages
> >       1.18 ą  9%      +0.2        1.37 ą  9%  perf-profile.children.cycles-pp.do_nanosleep
> >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.children.cycles-pp.hrtimer_nanosleep
> >       1.21 ą 10%      +0.2        1.41 ą  9%  perf-profile.children.cycles-pp.common_nsleep
> >       1.24 ą 11%      +0.2        1.45 ą 10%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
> >       0.00            +0.2        0.22 ą 19%  perf-profile.children.cycles-pp.pcpu_alloc_pages
> >       1.35 ą 11%      +0.2        1.59 ą  9%  perf-profile.children.cycles-pp.clock_nanosleep
> >       0.00            +0.3        0.27 ą 18%  perf-profile.children.cycles-pp.pcpu_populate_chunk
> >       0.00            +0.3        0.33 ą 16%  perf-profile.children.cycles-pp.pcpu_balance_populated
> >       0.00            +0.3        0.34 ą 15%  perf-profile.children.cycles-pp.pcpu_balance_workfn
> >       1.41 ą  7%      +0.5        1.95 ą 12%  perf-profile.children.cycles-pp.memset_orig
> >       0.12 ą 21%      +1.6        1.70 ą 30%  perf-profile.children.cycles-pp.pcpu_find_block_fit
> >       9.20 ą  7%      +3.2       12.41 ą 11%  perf-profile.children.cycles-pp.__x64_sys_mount
> >       9.29 ą  7%      +3.2       12.51 ą 11%  perf-profile.children.cycles-pp.mount
> >       8.34 ą  7%      +3.4       11.70 ą 11%  perf-profile.children.cycles-pp.do_new_mount
> >       3.22 ą  9%      +3.6        6.81 ą 15%  perf-profile.children.cycles-pp.pcpu_alloc
> >       3.18 ą  6%      +4.3        7.52 ą 14%  perf-profile.children.cycles-pp.vfs_get_super
> >       3.19 ą  6%      +4.3        7.54 ą 14%  perf-profile.children.cycles-pp.vfs_get_tree
> >       1.87 ą  8%      +4.6        6.48 ą 15%  perf-profile.children.cycles-pp.sget_fc
> >       1.73 ą  9%      +4.6        6.37 ą 16%  perf-profile.children.cycles-pp.alloc_super
> >       0.00            +5.1        5.14 ą 19%  perf-profile.children.cycles-pp.init_srcu_struct_fields
> >       2.80 ą  7%      -0.5        2.30 ą 13%  perf-profile.self.cycles-pp.stress_rndstr
> >       1.30 ą  6%      -0.3        1.04 ą 16%  perf-profile.self.cycles-pp.mnt_get_count
> >       1.25 ą  7%      -0.2        1.02 ą  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
> >       1.08 ą 10%      -0.1        0.93 ą  7%  perf-profile.self.cycles-pp.strncpy_from_user
> >       0.61 ą 12%      -0.1        0.48 ą 16%  perf-profile.self.cycles-pp.try_check_zero
> >       0.63 ą  8%      -0.1        0.50 ą 17%  perf-profile.self.cycles-pp.mnt_get_writers
> >       0.68 ą  6%      -0.1        0.58 ą  4%  perf-profile.self.cycles-pp.link_path_walk
> >       0.40 ą  3%      -0.1        0.32 ą 15%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
> >       0.15 ą 14%      -0.1        0.08 ą 51%  perf-profile.self.cycles-pp.xas_store
> >       0.29 ą  6%      -0.1        0.22 ą 18%  perf-profile.self.cycles-pp.inode_permission
> >       0.16 ą 12%      -0.0        0.12 ą 18%  perf-profile.self.cycles-pp.filename_lookup
> >       0.06 ą  6%      -0.0        0.03 ą 70%  perf-profile.self.cycles-pp.cpuidle_idle_call
> >       0.12 ą 11%      +0.0        0.15 ą 16%  perf-profile.self.cycles-pp.read_tsc
> >       0.04 ą 83%      +0.0        0.08 ą 12%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
> >       0.00            +0.1        0.07 ą 15%  perf-profile.self.cycles-pp.init_timer_key
> >       0.00            +0.2        0.16 ą 19%  perf-profile.self.cycles-pp.rcu_segcblist_init
> >       0.00            +0.2        0.24 ą 14%  perf-profile.self.cycles-pp.init_srcu_struct_fields
> >       1.28 ą  8%      +0.5        1.79 ą 11%  perf-profile.self.cycles-pp.memset_orig
> >       0.69 ą 17%      +1.3        2.00 ą 26%  perf-profile.self.cycles-pp.pcpu_alloc
> >       0.04 ą 85%      +1.6        1.62 ą 31%  perf-profile.self.cycles-pp.pcpu_find_block_fit
> >
> >
> >
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

--rh1RUZXSVt+NoVOj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc6-00098-g67d1802889f0"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.4.0-rc6 Kernel Configuration
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
# CONFIG_SLAB is not set
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
CONFIG_SMBFS=m
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
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
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

--rh1RUZXSVt+NoVOj--
