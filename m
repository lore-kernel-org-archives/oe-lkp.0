Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F86622
	for <oe-lkp@lists.linux.dev>; Fri,  7 Jul 2023 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688698215; x=1720234215;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5RjOJaFkmCRwUpRva6bgz9HQ3Bn1agE2YQC4pSKH8wQ=;
  b=kWibdF2Sf0M4CWC8toiy8nZ/h64xwR1McXU3Ulqf3qwj89PtHS6AU268
   f0ngoiuD4USXtUBl7ZDzeBpwHct5a/JJZGVZM+GlrJ6+wTsmYLQKZBwqA
   3h8SzJy0YuUMFMp9j3WFyhlSTRH6SHK4a6P/Px/lOoghHU9GwazERhL42
   /vZKqPh6acdlniEbsqFl6Tefz4uNop/NzjUSeEnfRpnlR+9PP+Exkg6Rx
   OVa98sP0dAu8Epr2lRK9sRhFbZkC81yYIlZCstioOUqsGdfpZ+VpOr1Tp
   u1rkdFxiFRiTm37oUe7SJhfwwX7b/Qfr0KPWA2smgtjCDjKOcJ7b9f+2h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427465783"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208,209";a="427465783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 19:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713824379"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208,209";a="713824379"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 06 Jul 2023 19:50:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 19:50:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 19:50:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 19:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFf5wkO9LGGKFIx9wlsr5Yef29YlJARQf0wZ8Wv+pYH1Y2o78bYSsYIGqy12Tdcgqjk4FK1jLSU2V9+VCcgopaLBq9jyvKkFXKhXZNA/C+WGq2tWdQr+J+aPjHo7T7qcaq8+07IEcAotUPEI6oG3BLpenIid14MzXKskBIWhuD0D4yxS8as3W9yemYS+QJkDaWdBbABufPV6U3+y1mDf9CJcKNP5x4t93Of+fEx9jdddqKBQvSf3w5KsbeXAoVUuuL9TrPPeNAvSfLC4gF7cCzYtMkCLDPnqq6RzaghVebKjmIGLj6bHFLRilPtDAFxZ6JY6q+Z1WejhfYdVGcFdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bYkxEWIkDwRhNfOHpnQT8bVeGxqrSdMEhG8HLrNg1M=;
 b=Q4iuGR6g70/4//Y+546fZXDaurcoylqbJ5g5YJFLn603sVeUGw4LTl844eaZr3cXFSnpZGoImyRjaM1DtH5Yr85Eh0otkmsTLyqflJlhUYysBWopyMkAYxS4yP5+jxBAMVi/AHKd4aNRUrqjI37T16CWKCd4v95nkHKP6FNUm3dQuqcFfkCHjV3j8U/0ja5WjedGql1/mF71i8d8NGsCydOEF/IXQa4mYkVHmL7mRUY4QlTLrq+F+Pa+0YLTLjd778uj9lGCqIUuRgtaxNRL9NS50GA3ME4rf46Z0lkWpZ3fJWse/e6DDLOYEa8h2hAwLpKeYR5wuaoV9GaxkTJR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA2PR11MB5116.namprd11.prod.outlook.com (2603:10b6:806:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 02:50:09 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 02:50:08 +0000
Date: Fri, 7 Jul 2023 10:49:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <ZKd9VrL/4dKApLz2@xsang-OptiPlex-9020>
References: <20230626133142.xdcwu7akidnftrla@quack3>
 <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3>
 <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
 <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020>
 <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
 <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020>
 <CAOQ4uxgwDNW0SQH5snDHFqHOQAXPDNyPOuhNDb6buEreVPxQKg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="zg5y3VE46k+mQ/7b"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxgwDNW0SQH5snDHFqHOQAXPDNyPOuhNDb6buEreVPxQKg@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA2PR11MB5116:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a6d75b-62a6-4778-b1dc-08db7e94df96
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDxB3G8vkYmtUMzd4ucQuBZfvMuLTfJOkMXd2ngtnBnZUlnB1qGNGdS9PGXNErAVzb27Q7wveBaFHwoYohoGKmxan0fEOynqLfBXRUtlsfnoqKVQ+jiJD6PlPZDgETGwyKg0+W4Zheg9u2R6liGvN1E8BqCgQ/Ds+z4pJTMO3Paa5eoMaz59BX7m4SQZBTh3s3758yIO+VbKW3ywVeIpcweDJsaPxsMgRhnJXNwVYo9kwMt0/m4Ouh1OoGrO8800U84YUj3hn7Q1YQ59+EcK30cdiD4NPBK+hTvoUVQDJOL6PygsM3sgUTjVCHhzu75IfEhMzAyhDOXpmkRer3rHBgjM5hphgQ2REIVwGSecbSOlyZcYevtlvQxasNpyclYZ8hdaOWy9yxRK4Tm7JzTxD3+IrhY21im9Yf222D0xeQUNbMxoh/kw9CNd41E0bHOwWnkHAUs46VBCqtimxyvj8yiF4lkXkCe3bJhBkqq5wjn2/ZlRTdg3HGzdJq4h48+L+R5Orn4MPrtnhHWCvrm5+v/X+2a60UmBWPyz3RgquZStNg/cuXT5Nu8ymftyXVLEGvWkh0PLfYmYF+mnVXbYvW3j9f9wYTJfdVJn0R7NzFC/Dg5FTHIWtTHe4PJcMXk5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(235185007)(5660300002)(44832011)(186003)(6506007)(26005)(41300700001)(107886003)(66476007)(316002)(6666004)(66946007)(6486002)(82960400001)(4326008)(66556008)(6916009)(83380400001)(478600001)(6512007)(9686003)(38100700002)(33716001)(86362001)(44144004)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/XuJ8hUo9T2j2PSRBTPFQZiuMfFrvp02Te4iGy7tTs3Qhq+G8tTULc1g2hSm?=
 =?us-ascii?Q?+r3Je1enOe+tKzGLgw8nRZRO/XOm5JX4UYQlZ7/2f2B6rAZZuXQLG+Bjpf9r?=
 =?us-ascii?Q?+4G5oD0wtVrc6rqFWswH9jm5kVQgJ4i6i9ObZxNsN2QH4ITT3K8clhScVvNK?=
 =?us-ascii?Q?U9cyXKOKIq4Zsm+ArYHVC3MWmKaFUkrIxttgsSmGTK0kazSM7GZ3kNbqls8p?=
 =?us-ascii?Q?hv6RXJ8J0gYW8EejWDkJND5HMzuLzW1qIEdLAbdfhAaSWa7BqNV9ZOWzgh+K?=
 =?us-ascii?Q?3vwHlcYOI19hXRhfjHgaorNA0VRHOuw/b/nW7/24Qm0rNxF6v5nATTQb85jm?=
 =?us-ascii?Q?7ZpvAVdK9m4y3lhsWtBhgWGra93KKaqFlfJUXABTZlltzG3tsswEfH8x8MF1?=
 =?us-ascii?Q?d1WdUPuMyijveAWY7/7sKctEti5XPbABdEXI4LAdTliVvAShMnmBtgb/5NfG?=
 =?us-ascii?Q?84W3XCBmQBdT17xBg0PBvHtAK+M8J8K4iUE7l4IzCS2PFQgFN1Gt1vDgp/Qw?=
 =?us-ascii?Q?cELdNWupyKJ+JtXgRZ4VuiUkYNPbrxa0w75F2y3Mi/5Z5UR2sKoR4WWtd1YT?=
 =?us-ascii?Q?m8T/C7SfFlDHu0HfAItkskqVRaMEHyqOV9Ney7dw7/cdErOvlseO+/UGscuI?=
 =?us-ascii?Q?dHnSclT4MDWoCf8huAVuAtdapvceTfsjvpOF0dCBPI1l9BBMFwiniv+bJRCH?=
 =?us-ascii?Q?NP14W1MiwNN0Euzn0LqVXEWakRckw0VqXz4iNKItWxKiBGNrVFYH11aqOKLp?=
 =?us-ascii?Q?w3Ts0+DZu8bjhUGcDH7yUINBY2WoPIDpy13bPAliieVIA6K7PMhfR3w9sixI?=
 =?us-ascii?Q?rBwVd8EJa6OYtiEIKLMptIQnHn8BzcvbRRD20FOXKOtDZKVFatHVruKxd/A7?=
 =?us-ascii?Q?19Wvfurw60T1UskJVCzDmfMdqi/1DIfWrb/QaCKheTfjGdT+FysaKwZqQeWI?=
 =?us-ascii?Q?bPogVdL0D9ToFlidpHp08UxfSlE5HQ2GwBkrjn9KchOSCNkKnYv+BsAYnmnD?=
 =?us-ascii?Q?b2a75kEVKeFtxhiWsSLoBUdMpCFGptZgSy8od6qZCUhn23GGq6aqqKFFvU3q?=
 =?us-ascii?Q?yja4uU9fJKEcIRLltlgZ3MwaMKOM1xeLxrQkUizcDLkddntVNMS1S4/dDahy?=
 =?us-ascii?Q?ekJe/BPo9pGYeB4sPEglPUcHXqsKc2ha1k0i643OkFkF8xNHAgo+NPTHIvvs?=
 =?us-ascii?Q?5l4bHb6/z9q5N5/V2qf+T67RNcWten8FpHCpoL0CDqczWSkLEPm/QAbrwd2D?=
 =?us-ascii?Q?pDrGfm5Q49IQhe/dIhaWmmTzI9MXjWJBJFe0tNg2deSi+AFy6BMwY414CsnE?=
 =?us-ascii?Q?o0bbf6rsWTvelcM0QoVaLEI9kDbzG6WPOHKkaBG2njO7lfRAP3ueMDoLT5oN?=
 =?us-ascii?Q?yzI1RSDhgmQkztilZNOZRb0g+4KGFUxh6aRB+lTGZi8sRU4J+/ne2yH703xz?=
 =?us-ascii?Q?vkxvqxUgxk71VSRVMg7Q/QtFOFEEI/lwbg+LkmRhIau5f0mHnV6vbnqata0e?=
 =?us-ascii?Q?uknyL6L4HoJEpGmvMDd4h8qtbbc/n0KvHZhRM8fbH+Ij8A9DvnzqVh2Bqpdi?=
 =?us-ascii?Q?UVCi0phLY3sDFbwZ3vuDg0WBMVXHIVTwNxqJgqV8JzD/G4uijOSuxUg5dhXv?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a6d75b-62a6-4778-b1dc-08db7e94df96
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 02:50:08.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAS2ottrPfz9YsutO3YxmrDqwCezyMMieQ73f21qeggENADpI9iFSX+s1f/lmCzqXYhKmw188DzCjrTU1QIWVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5116
X-OriginatorOrg: intel.com

--zg5y3VE46k+mQ/7b
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

hi, Amir,

On Wed, Jul 05, 2023 at 05:15:56PM +0300, Amir Goldstein wrote:

...

> That's great :)
> 
> Let's try sb_write_barrier-rc6:
> 
> * ec6062fa6287 - (sb_write_barrier-rc6) vfs: prepare for pre-modify
> permission events on aio write
> * c0499c6ccdb7 - vfs: prepare for pre-modify permission events on write
> * 0bc594342542 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
> * 286af98e1d76 - fanotify: activate sb write barriers for pre-modify
> event watchers
> * 90a5c1147030 - vfs: implement 'vfs write barriers'
> 
> Changes since sb_write_barrier-rc5:
> - Removed the "fsnotify: optimize ..." patch - I don't think it is needed
> - s_write_srcu is allocated lazily on first activation
> - safe activate/cleanup of s_write_srcu (hopefully)
> 
> IOW, rc6 could be the final version if it passes the performance
> regression test.

we confirmed there is no regression by this sb_write_barrier-rc6 branch:

commit:
  81c0fe022bd6e (amir73il/fan_pre_access) fanotify: report file range info with FAN_PRE_ACCESSS event
  f7adc6e4bdc0c fsnotify: define flag for pre-modify permission events
  90a5c1147030d vfs: implement 'vfs write barriers'
  ec6062fa62872 (amir73il/sb_write_barrier-rc6, amir73il/sb_write_barrier) vfs: prepare for pre-modify permission events on aio write
  
81c0fe022bd6ebae f7adc6e4bdc0cfbd1c970a8455c 90a5c1147030dfbc24dd96267ba ec6062fa62872cdd2c8d8a0658d
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
   1445389            +0.5%    1453256            +0.7%    1456049            +0.2%    1448979        stress-ng.ramfs.ops
     24089            +0.5%      24220            +0.7%      24267            +0.2%      24149        stress-ng.ramfs.ops_per_sec

detail data is attached as sb_write_barrier-rc6-tip-ec6062fa62872

Thanks

> 
> Thanks,
> Amir.

--zg5y3VE46k+mQ/7b
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="sb_write_barrier-rc6-tip-ec6062fa62872"
Content-Transfer-Encoding: 8bit

=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s

commit:
  81c0fe022bd6e (amir73il/fan_pre_access) fanotify: report file range info with FAN_PRE_ACCESSS event
  f7adc6e4bdc0c fsnotify: define flag for pre-modify permission events
  90a5c1147030d vfs: implement 'vfs write barriers'
  ec6062fa62872 (amir73il/sb_write_barrier-rc6, amir73il/sb_write_barrier) vfs: prepare for pre-modify permission events on aio write
  
81c0fe022bd6ebae f7adc6e4bdc0cfbd1c970a8455c 90a5c1147030dfbc24dd96267ba ec6062fa62872cdd2c8d8a0658d
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 2.145e+09            -0.0%  2.145e+09            +0.1%  2.147e+09            +0.2%  2.149e+09        cpuidle..time
   3879929 ±  3%      -0.9%    3843119            -1.6%    3818338 ±  2%      -1.6%    3818038 ±  2%  cpuidle..usage
     93.50            -0.1%      93.38            -0.4%      93.09            -0.2%      93.31        uptime.boot
      3148            -0.2%       3143            -0.5%       3133            -0.2%       3141        uptime.idle
     20.84            -0.8%      20.68            -0.0%      20.84            -0.0%      20.84        boot-time.boot
     11.36            -0.5%      11.31            -0.3%      11.33            +0.2%      11.39        boot-time.dhcp
    704.71            -0.8%     698.79            +0.0%     704.73            -0.1%     704.16        boot-time.idle
     26.17 ± 40%      -8.9%      23.83 ± 23%     -14.0%      22.50 ± 13%      -5.1%      24.83 ± 21%  perf-c2c.DRAM.local
    255.83 ± 12%      -5.5%     241.83 ± 14%      -6.6%     238.83 ± 11%      -0.3%     255.17 ± 15%  perf-c2c.HITM.local
    255.83 ± 12%      -5.5%     241.83 ± 14%      -6.6%     238.83 ± 11%      -0.3%     255.17 ± 15%  perf-c2c.HITM.total
     93.55            -0.0%      93.54            +0.0%      93.56            -0.0%      93.55        iostat.cpu.idle
      0.21 ±  5%      +5.6%       0.23 ±  3%      +0.3%       0.21 ±  7%      +4.7%       0.22 ±  5%  iostat.cpu.iowait
      3.63            +0.0%       3.63            +0.0%       3.63            -0.3%       3.62        iostat.cpu.system
      2.61            +0.0%       2.61            -0.2%       2.60            +0.2%       2.61        iostat.cpu.user
     93.48            -0.0       93.47            -0.0       93.47            -0.0       93.47        mpstat.cpu.all.idle%
      0.20 ±  6%      +0.0        0.21 ±  4%      +0.0        0.20 ±  7%      +0.0        0.21 ±  6%  mpstat.cpu.all.iowait%
      0.57 ±  2%      +0.0        0.57 ±  2%      -0.0        0.57 ±  2%      +0.0        0.57 ±  2%  mpstat.cpu.all.irq%
      0.11 ±  5%      -0.0        0.10 ±  8%      -0.0        0.11 ±  5%      -0.0        0.10 ±  9%  mpstat.cpu.all.soft%
      2.99            +0.0        3.00            +0.0        3.00            -0.0        2.99        mpstat.cpu.all.sys%
      2.65            +0.0        2.65            -0.0        2.65            +0.0        2.65        mpstat.cpu.all.usr%
     62.04            -0.0%      62.03            -0.0%      62.04            +0.0%      62.04        time.elapsed_time
     62.04            -0.0%      62.03            -0.0%      62.04            +0.0%      62.04        time.elapsed_time.max
     12.00 ± 33%     -22.2%       9.33 ± 31%     +11.1%      13.33 ± 28%      +0.0%      12.00 ± 33%  time.file_system_inputs
   1446901            +0.5%    1454250            +0.7%    1457658            +0.3%    1450703        time.involuntary_context_switches
      0.33 ±141%    +100.0%       0.67 ±111%      +0.0%       0.33 ±141%      +0.0%       0.33 ±141%  time.major_page_faults
      6912            +0.0%       6912            +0.0%       6912            +5.3%       7276 ± 11%  time.maximum_resident_set_size
      9353            +0.2%       9372            +0.1%       9360            -0.2%       9339        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        time.page_size
     77.67            +0.4%      78.00            +0.4%      78.00            +0.4%      78.00        time.percent_of_cpu_this_job_got
     40.87            +0.4%      41.04            +0.5%      41.08            +0.5%      41.06        time.system_time
      7.70            -0.7%       7.64            -0.3%       7.68 ±  2%      +0.4%       7.73        time.user_time
    740140 ± 18%      -5.1%     702337 ±  6%      -8.9%     674190 ± 16%      -7.6%     683703 ± 16%  time.voluntary_context_switches
     93.00            +0.0%      93.00            +0.0%      93.00            +0.0%      93.00        vmstat.cpu.id
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        vmstat.cpu.sy
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.wa
     15.00            -3.3%      14.50 ±  7%      +0.0%      15.00            +0.0%      15.00        vmstat.io.bi
      4930 ± 11%      +4.9%       5172 ±  7%      +0.9%       4973 ±  9%      +1.4%       4997 ±  9%  vmstat.io.bo
     16029            +1.7%      16298            +0.6%      16124            +1.3%      16237        vmstat.memory.buff
   3247834            +0.0%    3248685            +0.0%    3249114            +0.0%    3248816        vmstat.memory.cache
 1.276e+08            -0.0%  1.276e+08            +0.0%  1.276e+08            -0.0%  1.276e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.procs.r
    159924 ±  3%      -0.6%     158907            -1.6%     157388 ±  2%      -1.6%     157405 ±  2%  vmstat.system.cs
     84092            +0.1%      84198            -0.2%      83948            +0.3%      84325        vmstat.system.in
   1445389            +0.5%    1453256            +0.7%    1456049            +0.2%    1448979        stress-ng.ramfs.ops
     24089            +0.5%      24220            +0.7%      24267            +0.2%      24149        stress-ng.ramfs.ops_per_sec
     62.04            -0.0%      62.03            -0.0%      62.04            +0.0%      62.04        stress-ng.time.elapsed_time
     62.04            -0.0%      62.03            -0.0%      62.04            +0.0%      62.04        stress-ng.time.elapsed_time.max
     12.00 ± 33%     -22.2%       9.33 ± 31%     +11.1%      13.33 ± 28%      +0.0%      12.00 ± 33%  stress-ng.time.file_system_inputs
   1446901            +0.5%    1454250            +0.7%    1457658            +0.3%    1450703        stress-ng.time.involuntary_context_switches
      0.33 ±141%    +100.0%       0.67 ±111%      +0.0%       0.33 ±141%      +0.0%       0.33 ±141%  stress-ng.time.major_page_faults
      6912            +0.0%       6912            +0.0%       6912            +5.3%       7276 ± 11%  stress-ng.time.maximum_resident_set_size
      9353            +0.2%       9372            +0.1%       9360            -0.2%       9339        stress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        stress-ng.time.page_size
     77.67            +0.4%      78.00            +0.4%      78.00            +0.4%      78.00        stress-ng.time.percent_of_cpu_this_job_got
     40.87            +0.4%      41.04            +0.5%      41.08            +0.5%      41.06        stress-ng.time.system_time
      7.70            -0.7%       7.64            -0.3%       7.68 ±  2%      +0.4%       7.73        stress-ng.time.user_time
    740140 ± 18%      -5.1%     702337 ±  6%      -8.9%     674190 ± 16%      -7.6%     683703 ± 16%  stress-ng.time.voluntary_context_switches
    264.00            +0.3%     264.83            +0.0%     264.00            -0.1%     263.83        turbostat.Avg_MHz
      7.03            +0.0        7.04            +0.0        7.03            +0.0        7.03        turbostat.Busy%
      3757            +0.0%       3758            -0.1%       3755            -0.1%       3753        turbostat.Bzy_MHz
    106271 ±  3%      +0.8%     107093 ±  2%      +1.4%     107752 ±  2%      +1.1%     107456 ±  4%  turbostat.C1
      0.30 ± 11%      +0.0        0.32 ±  2%      +0.0        0.32 ±  9%      +0.0        0.33 ± 12%  turbostat.C1%
   1191378            +0.2%    1193770            +0.0%    1191536            +0.0%    1191459        turbostat.C1E
      6.28            +0.0        6.33            +0.0        6.30            +0.0        6.32        turbostat.C1E%
   2034970            -0.1%    2033747            +0.1%    2036099            +0.1%    2037198        turbostat.C6
     86.66            -0.1       86.58            -0.0       86.63            -0.1       86.60        turbostat.C6%
     92.08            -0.1%      92.03            -0.0%      92.05            -0.1%      92.02        turbostat.CPU%c1
      0.90 ± 12%      +3.7%       0.93 ±  7%      +3.2%       0.92 ± 13%      +7.1%       0.96 ± 12%  turbostat.CPU%c6
     41.33 ±  2%      +1.2%      41.83            +1.2%      41.83            +0.4%      41.50        turbostat.CoreTmp
      0.42 ±  2%      -0.8%       0.42            +1.6%       0.43 ±  2%      +1.6%       0.43 ±  2%  turbostat.IPC
   5470164            +0.1%    5476827            +0.1%    5474002            +0.5%    5498805        turbostat.IRQ
    544126 ± 22%      -7.2%     505065 ±  7%     -11.7%     480256 ± 19%     -12.1%     478487 ± 21%  turbostat.POLL
      0.04 ± 16%      -0.0        0.04 ±  8%      -0.0        0.04 ± 10%      -0.0        0.04 ± 14%  turbostat.POLL%
      0.43 ± 15%      +8.8%       0.47 ± 18%     +13.8%       0.49 ± 25%     +17.3%       0.51 ± 20%  turbostat.Pkg%pc2
     40.83            +0.4%      41.00            +1.6%      41.50            +0.0%      40.83        turbostat.PkgTmp
     88.51            -0.1%      88.42            +0.3%      88.73            +0.3%      88.78        turbostat.PkgWatt
     10.25            +0.5%      10.30            +0.7%      10.32            +0.5%      10.30        turbostat.RAMWatt
      3000            -0.0%       3000            +0.0%       3000            +0.0%       3000        turbostat.TSC_MHz
    292892            +0.3%     293654            +0.3%     293743            +0.3%     293900        meminfo.Active
    276818            +0.2%     277293            +0.3%     277549            +0.3%     277578        meminfo.Active(anon)
     16074            +1.8%      16361            +0.7%      16194            +1.5%      16321        meminfo.Active(file)
     56074 ± 12%      +2.4%      57438 ± 13%      +1.4%      56833 ± 15%      -7.5%      51846 ± 12%  meminfo.AnonHugePages
    303960            +0.2%     304672            +0.3%     304985            +0.1%     304202        meminfo.AnonPages
     16010            +1.7%      16285            +0.6%      16108            +1.4%      16228        meminfo.Buffers
   3148894            +0.0%    3149826            +0.0%    3149807            +0.0%    3149977        meminfo.Cached
  65801592            +0.0%   65801592            +0.0%   65801592            +0.0%   65801592        meminfo.CommitLimit
    811170            +0.1%     811776            +0.0%     811491            +0.0%     811420        meminfo.Committed_AS
 1.264e+08            -0.1%  1.262e+08            +0.4%  1.269e+08            -0.1%  1.262e+08        meminfo.DirectMap1G
   7382357 ± 26%      +2.4%    7559168 ± 27%      -7.0%    6862165 ± 21%      +2.3%    7553706 ± 15%  meminfo.DirectMap2M
    173642 ±  4%      -1.2%     171594 ±  5%      -2.4%     169546 ±  8%      +2.0%     177056 ±  7%  meminfo.DirectMap4k
     14.33 ± 32%      +2.3%      14.67 ± 32%     -22.1%      11.17 ± 40%      +1.2%      14.50 ± 27%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    358551            +0.4%     359972            +0.3%     359709            +0.2%     359097        meminfo.Inactive
    328648            +0.3%     329527            +0.3%     329621            +0.0%     328761        meminfo.Inactive(anon)
     29902            +1.8%      30444            +0.6%      30086            +1.4%      30335 ±  2%  meminfo.Inactive(file)
     96749            +0.2%      96958            +0.3%      97064            +0.3%      97049        meminfo.KReclaimable
      9053            -0.0%       9051            +0.1%       9059            +0.2%       9068        meminfo.KernelStack
     48447            +0.2%      48562            +0.6%      48738            +0.1%      48485        meminfo.Mapped
 1.269e+08            +0.0%  1.269e+08            +0.0%  1.269e+08            -0.0%  1.269e+08        meminfo.MemAvailable
 1.276e+08            -0.0%  1.276e+08            +0.0%  1.276e+08            -0.0%  1.276e+08        meminfo.MemFree
 1.316e+08            +0.0%  1.316e+08            +0.0%  1.316e+08            -0.0%  1.316e+08        meminfo.MemTotal
   3965962            +0.0%    3966149            -0.0%    3965249            +0.1%    3970383        meminfo.Memused
     11.00            +0.0%      11.00            +0.0%      11.00            +0.0%      11.00        meminfo.Mlocked
      3993            -0.1%       3990            -0.2%       3984            -0.7%       3964        meminfo.PageTables
     17896            +0.1%      17916            +0.1%      17914            +0.0%      17896        meminfo.Percpu
     96749            +0.2%      96958            +0.3%      97064            +0.3%      97049        meminfo.SReclaimable
     93922            +0.1%      94057            +0.3%      94192            +0.6%      94469        meminfo.SUnreclaim
    301710            +0.1%     302056            +0.2%     302375            +0.2%     302338        meminfo.Shmem
    190672            +0.2%     191015            +0.3%     191258            +0.4%     191518        meminfo.Slab
   2817197            +0.0%    2817239            +0.0%    2817237            -0.0%    2817195        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
     20651            -0.0%      20648            +0.0%      20656            +0.2%      20684        meminfo.VmallocUsed
      0.33 ±223%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        meminfo.Writeback
   4139902            -0.0%    4139834            +0.0%    4140328            +0.2%    4147781        meminfo.max_used_kB
     69.50 ±  5%      -1.0%      68.83 ±  7%      -2.4%      67.83 ± 10%      +3.4%      71.83 ±  9%  proc-vmstat.direct_map_level2_splits
      3.50 ± 54%      +4.8%       3.67 ± 53%     -14.3%       3.00 ± 47%      +4.8%       3.67 ± 30%  proc-vmstat.direct_map_level3_splits
     69204            +0.2%      69322            +0.3%      69386            +0.3%      69394        proc-vmstat.nr_active_anon
      4017            +1.8%       4089            +0.8%       4048            +1.6%       4080        proc-vmstat.nr_active_file
     75990            +0.2%      76169            +0.3%      76247            +0.1%      76050        proc-vmstat.nr_anon_pages
     27.00 ± 13%      +2.5%      27.67 ± 13%      +1.2%      27.33 ± 15%      -8.6%      24.67 ± 13%  proc-vmstat.nr_anon_transparent_hugepages
     18.00 ± 70%      +4.6%      18.83 ± 66%     -19.4%      14.50 ± 18%     -24.1%      13.67 ± 24%  proc-vmstat.nr_dirtied
      3.17 ± 38%      +5.3%       3.33 ± 28%     -21.1%       2.50 ± 44%      +5.3%       3.33 ± 28%  proc-vmstat.nr_dirty
   3166192            +0.0%    3166210            +0.0%    3166220            -0.0%    3166100        proc-vmstat.nr_dirty_background_threshold
   6340128            +0.0%    6340162            +0.0%    6340183            -0.0%    6339942        proc-vmstat.nr_dirty_threshold
    791230            +0.0%     791527            +0.0%     791479            +0.0%     791552        proc-vmstat.nr_file_pages
     38.00            +0.0%      38.00            +0.0%      38.00            +0.0%      38.00        proc-vmstat.nr_foll_pin_acquired
     38.00            +0.0%      38.00            +0.0%      38.00            +0.0%      38.00        proc-vmstat.nr_foll_pin_released
  31909300            -0.0%   31909266            +0.0%   31909500            -0.0%   31908202        proc-vmstat.nr_free_pages
     82167            +0.3%      82383            +0.3%      82406            +0.0%      82191        proc-vmstat.nr_inactive_anon
      7475            +1.8%       7610            +0.6%       7521            +1.5%       7583 ±  2%  proc-vmstat.nr_inactive_file
      0.50 ±223%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_isolated_anon
      9053            -0.0%       9052            +0.1%       9059            +0.2%       9067        proc-vmstat.nr_kernel_stack
     12118            +0.2%      12143            +0.6%      12186            +0.0%      12123        proc-vmstat.nr_mapped
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.nr_mlock
    997.83            -0.1%     996.67            -0.2%     995.50            -0.7%     990.50        proc-vmstat.nr_page_table_pages
     75431            +0.1%      75513            +0.2%      75594            +0.2%      75585        proc-vmstat.nr_shmem
     24185            +0.2%      24239            +0.3%      24265            +0.3%      24261        proc-vmstat.nr_slab_reclaimable
     23478            +0.1%      23514            +0.3%      23546            +0.6%      23616        proc-vmstat.nr_slab_unreclaimable
    704299            +0.0%     704309            +0.0%     704309            -0.0%     704298        proc-vmstat.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_writeback
     16.50 ± 75%     -32.3%      11.17 ± 27%     -20.2%      13.17 ± 22%     -34.3%      10.83 ± 27%  proc-vmstat.nr_written
     69204            +0.2%      69322            +0.3%      69386            +0.3%      69394        proc-vmstat.nr_zone_active_anon
      4017            +1.8%       4089            +0.8%       4048            +1.6%       4080        proc-vmstat.nr_zone_active_file
     82167            +0.3%      82383            +0.3%      82406            +0.0%      82191        proc-vmstat.nr_zone_inactive_anon
      7475            +1.8%       7610            +0.6%       7521            +1.5%       7583 ±  2%  proc-vmstat.nr_zone_inactive_file
    704299            +0.0%     704309            +0.0%     704309            -0.0%     704298        proc-vmstat.nr_zone_unevictable
      3.17 ± 38%      +5.3%       3.33 ± 28%     -21.1%       2.50 ± 44%      +5.3%       3.33 ± 28%  proc-vmstat.nr_zone_write_pending
   1254854            -0.1%    1253264            +0.3%    1258917            -0.2%    1251998        proc-vmstat.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1254896            -0.3%    1251328            +0.2%    1257753            -0.2%    1251946        proc-vmstat.numa_local
    104142            +0.0%     104145            +0.1%     104282            -0.0%     104104        proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2046311            -1.1%    2023940 ±  2%      +0.3%    2052802            -0.8%    2029217 ±  2%  proc-vmstat.pgalloc_normal
    216545            +0.2%     217022            +0.2%     216933            +0.1%     216821        proc-vmstat.pgfault
   1912120            -1.2%    1890016 ±  2%      +0.3%    1918230            -0.9%    1894882 ±  2%  proc-vmstat.pgfree
      1008            -3.7%     970.67 ±  8%      +0.0%       1008            +0.0%       1008        proc-vmstat.pgpgin
    314560 ± 11%      +5.3%     331293 ±  7%      +1.1%     317974 ±  8%      +1.8%     320375 ±  9%  proc-vmstat.pgpgout
      7493            +0.9%       7558 ±  2%      +0.0%       7494            +0.2%       7512 ±  2%  proc-vmstat.pgreuse
     47.17 ±  3%      +0.0%      47.17 ±  3%      +0.0%      47.17 ±  3%      -1.8%      46.33 ±  5%  proc-vmstat.thp_collapse_alloc
      0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%    -100.0%       0.00        proc-vmstat.thp_deferred_split_page
      0.83 ±175%     +60.0%       1.33 ± 55%    +160.0%       2.17 ± 62%     +20.0%       1.00 ±141%  proc-vmstat.thp_fault_alloc
      0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
    157.50            -1.3%     155.50            -1.3%     155.50            +0.2%     157.83        proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
      3.00            +0.0%       3.00            +0.0%       3.00           -16.7%       2.50 ± 44%  proc-vmstat.unevictable_pgs_munlocked
      3.24            -0.4%       3.23            -0.6%       3.22            -0.5%       3.23        perf-stat.i.MPKI
 2.711e+09            +0.6%  2.726e+09            +0.7%  2.729e+09            +0.6%  2.727e+09        perf-stat.i.branch-instructions
      1.52            -0.0        1.51            -0.0        1.49            -0.0        1.51        perf-stat.i.branch-miss-rate%
  41136208            -0.3%   41012185            -1.3%   40620031            -0.4%   40987901        perf-stat.i.branch-misses
      4.47            -0.0        4.45 ±  2%      +0.1        4.56            +0.1        4.56 ±  3%  perf-stat.i.cache-miss-rate%
   1914520 ±  2%      -0.5%    1905651 ±  3%      +0.8%    1929280 ±  3%      +1.5%    1943240 ±  4%  perf-stat.i.cache-misses
  43319623            -0.0%   43307147            +0.2%   43394392            +0.0%   43332410        perf-stat.i.cache-references
    166171 ±  3%      -0.6%     165207            -1.2%     164122 ±  2%      -1.3%     164030 ±  2%  perf-stat.i.context-switches
      0.69            -0.2%       0.69            -0.6%       0.68            -0.4%       0.69        perf-stat.i.cpi
     36003            +0.0%      36003            +0.0%      36003            +0.0%      36005        perf-stat.i.cpu-clock
 9.159e+09            +0.3%  9.187e+09            +0.1%  9.165e+09            +0.2%  9.181e+09        perf-stat.i.cpu-cycles
    695.39 ±  4%      +4.2%     724.59 ±  3%      +1.9%     708.92 ±  2%      +2.6%     713.55 ±  4%  perf-stat.i.cpu-migrations
      8900 ±  6%      -0.6%       8849 ±  6%      -2.8%       8648 ±  5%      -0.8%       8829 ± 10%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  9%      +0.0        0.01 ±  5%      +0.0        0.01 ±  2%      -0.0        0.01 ±  7%  perf-stat.i.dTLB-load-miss-rate%
    197520 ±  7%      +1.1%     199791 ±  4%      +0.8%     199193 ±  2%      -2.1%     193346 ±  5%  perf-stat.i.dTLB-load-misses
 2.889e+09            +0.4%  2.901e+09            +0.6%  2.907e+09            +0.4%  2.901e+09        perf-stat.i.dTLB-loads
      0.01 ±  5%      +0.0        0.01            -0.0        0.01 ±  4%      +0.0        0.01 ±  4%  perf-stat.i.dTLB-store-miss-rate%
    101802 ±  5%      +1.6%     103448            -0.2%     101600 ±  5%      +1.3%     103125 ±  4%  perf-stat.i.dTLB-store-misses
  1.72e+09            +0.4%  1.727e+09            +0.5%  1.729e+09            +0.2%  1.724e+09        perf-stat.i.dTLB-stores
     65.20            -0.3       64.94            -0.0       65.19            -0.0       65.15        perf-stat.i.iTLB-load-miss-rate%
   3455763 ±  2%      -1.2%    3415078            +0.9%    3488512            -2.2%    3379094        perf-stat.i.iTLB-load-misses
   1825090            +0.0%    1825809            +0.9%    1841005 ±  2%      -2.0%    1788360 ±  2%  perf-stat.i.iTLB-loads
 1.331e+10            +0.6%  1.339e+10            +0.7%   1.34e+10            +0.6%  1.339e+10        perf-stat.i.instructions
      3938            +1.5%       3998            -0.2%       3931            +3.0%       4054        perf-stat.i.instructions-per-iTLB-miss
      1.45            +0.2%       1.46            +0.6%       1.46            +0.4%       1.46        perf-stat.i.ipc
      0.21 ± 38%     -11.5%       0.19 ± 48%      +5.1%       0.22 ± 33%      +5.1%       0.22 ± 38%  perf-stat.i.major-faults
      0.25            +0.3%       0.26            +0.1%       0.25            +0.3%       0.26        perf-stat.i.metric.GHz
    101.85 ±  6%      +3.2%     105.15 ±  5%      +2.1%     104.03 ±  4%      +4.8%     106.69 ±  3%  perf-stat.i.metric.K/sec
    204.49            +0.5%     205.45            +0.6%     205.75            +0.4%     205.39        perf-stat.i.metric.M/sec
      1973 ±  2%      -0.1%       1971            -0.1%       1971            +0.3%       1979        perf-stat.i.minor-faults
    265346 ±  4%      -0.0%     265340 ±  4%      +2.1%     270937            +2.9%     273107 ±  3%  perf-stat.i.node-loads
    564921 ±  4%      -1.3%     557335 ±  5%      -2.1%     553087 ±  3%      -0.8%     560256 ±  5%  perf-stat.i.node-stores
      1973 ±  2%      -0.1%       1971            -0.1%       1971            +0.3%       1979        perf-stat.i.page-faults
     36003            +0.0%      36003            +0.0%      36003            +0.0%      36005        perf-stat.i.task-clock
      3.25            -0.6%       3.24            -0.5%       3.24            -0.6%       3.24        perf-stat.overall.MPKI
      1.52            -0.0        1.50            -0.0        1.49            -0.0        1.50        perf-stat.overall.branch-miss-rate%
      4.42 ±  2%      -0.0        4.40 ±  3%      +0.0        4.45 ±  3%      +0.1        4.48 ±  3%  perf-stat.overall.cache-miss-rate%
      0.69            -0.3%       0.69            -0.6%       0.68            -0.4%       0.69        perf-stat.overall.cpi
      4786 ±  2%      +0.8%       4825 ±  3%      -0.6%       4755 ±  3%      -1.1%       4733 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.01 ±  7%      +0.0        0.01 ±  4%      +0.0        0.01 ±  2%      -0.0        0.01 ±  5%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ±  4%      +0.0        0.01            -0.0        0.01 ±  5%      +0.0        0.01 ±  4%  perf-stat.overall.dTLB-store-miss-rate%
     65.43            -0.3       65.16            +0.0       65.46            -0.0       65.40        perf-stat.overall.iTLB-load-miss-rate%
      3852 ±  2%      +1.8%       3920            -0.3%       3842            +2.9%       3963        perf-stat.overall.instructions-per-iTLB-miss
      1.45            +0.3%       1.46            +0.6%       1.46            +0.4%       1.46        perf-stat.overall.ipc
 2.668e+09            +0.6%  2.683e+09            +0.7%  2.686e+09            +0.6%  2.684e+09        perf-stat.ps.branch-instructions
  40483783            -0.3%   40362877            -1.3%   39976411            -0.4%   40338454        perf-stat.ps.branch-misses
   1884537 ±  2%      -0.5%    1875906 ±  3%      +0.8%    1899121 ±  3%      +1.5%    1912847 ±  4%  perf-stat.ps.cache-misses
  42632204            -0.0%   42620648            +0.2%   42706257            +0.0%   42645303        perf-stat.ps.cache-references
    163529 ±  3%      -0.6%     162583            -1.2%     161514 ±  2%      -1.3%     161424 ±  2%  perf-stat.ps.context-switches
     35432            +0.0%      35432            +0.0%      35432            +0.0%      35434        perf-stat.ps.cpu-clock
 9.014e+09            +0.3%  9.041e+09            +0.1%   9.02e+09            +0.2%  9.036e+09        perf-stat.ps.cpu-cycles
    684.34 ±  4%      +4.2%     713.08 ±  3%      +1.9%     697.66 ±  2%      +2.6%     702.22 ±  4%  perf-stat.ps.cpu-migrations
    194401 ±  7%      +1.1%     196635 ±  4%      +0.8%     196047 ±  2%      -2.1%     190295 ±  5%  perf-stat.ps.dTLB-load-misses
 2.843e+09            +0.4%  2.855e+09            +0.6%  2.861e+09            +0.4%  2.855e+09        perf-stat.ps.dTLB-loads
    100186 ±  5%      +1.6%     101808            -0.2%      99988 ±  5%      +1.3%     101489 ±  4%  perf-stat.ps.dTLB-store-misses
 1.692e+09            +0.4%    1.7e+09            +0.5%  1.701e+09            +0.2%  1.696e+09        perf-stat.ps.dTLB-stores
   3400895 ±  2%      -1.2%    3360906            +0.9%    3433170            -2.2%    3325491        perf-stat.ps.iTLB-load-misses
   1796095            +0.0%    1796826            +0.9%    1811776 ±  2%      -2.0%    1759970 ±  2%  perf-stat.ps.iTLB-loads
  1.31e+10            +0.6%  1.317e+10            +0.7%  1.319e+10            +0.6%  1.318e+10        perf-stat.ps.instructions
      0.21 ± 38%     -11.5%       0.18 ± 48%      +5.1%       0.22 ± 33%      +5.1%       0.22 ± 38%  perf-stat.ps.major-faults
      1941 ±  2%      -0.1%       1940            -0.1%       1940            +0.3%       1947        perf-stat.ps.minor-faults
    261185 ±  4%      +0.0%     261190 ±  4%      +2.1%     266694            +2.9%     268830 ±  3%  perf-stat.ps.node-loads
    556040 ±  4%      -1.3%     548594 ±  5%      -2.1%     544410 ±  3%      -0.8%     551459 ±  5%  perf-stat.ps.node-stores
      1942 ±  2%      -0.1%       1940            -0.1%       1940            +0.3%       1948        perf-stat.ps.page-faults
     35432            +0.0%      35432            +0.0%      35432            +0.0%      35434        perf-stat.ps.task-clock
 8.262e+11            +0.6%  8.309e+11            +0.7%  8.319e+11            +0.6%  8.313e+11        perf-stat.total.instructions
      0.00        +1.8e+09%      17.90 ±147%  +7.9e+09%      78.64 ±122%  +1.7e+10%     173.13 ±159%  sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +6.4e+10%     644.53 ±147%  +2.4e+11%       2377 ±126%  +5.8e+11%       5750 ±164%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +1.1e+104%     105.92 ±147%   +4e+104%     404.66 ±123% +9.5e+104%     949.26 ±163%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.38 ±  7%      +3.7%       0.39 ±  9%      +0.0%       0.38 ± 10%      +9.9%       0.41 ±  9%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.00           +33.3%       1.33 ± 35%     +66.7%       1.67 ± 44%     +50.0%       1.50 ± 50%  sched_debug.cfs_rq:/.h_nr_running.max
      0.48            +4.3%       0.50 ±  5%     +11.8%       0.54 ± 13%      +8.4%       0.52 ± 11%  sched_debug.cfs_rq:/.h_nr_running.stddev
     12494 ± 12%    +125.8%      28214 ± 80%    +268.0%      45975 ± 82%    +219.6%      39927 ± 67%  sched_debug.cfs_rq:/.load.avg
     75908 ± 19%    +678.4%     590864 ±130%   +1117.0%     923807 ± 99%   +1118.3%     924824 ± 99%  sched_debug.cfs_rq:/.load.max
     19774 ± 14%    +412.5%     101338 ±121%    +746.4%     167374 ± 97%    +688.7%     155966 ± 94%  sched_debug.cfs_rq:/.load.stddev
    578.02 ± 19%      +0.5%     580.86 ± 21%      -8.6%     528.38 ± 10%     -15.2%     490.31 ± 11%  sched_debug.cfs_rq:/.load_avg.avg
     15247 ± 18%      -3.8%      14669 ± 25%     -16.9%      12672 ±  7%     -19.5%      12280 ± 10%  sched_debug.cfs_rq:/.load_avg.max
      0.00       +1.7e+102%       1.67 ±223%   +1e+102%       1.00 ±223% +1.7e+101%       0.17 ±223%  sched_debug.cfs_rq:/.load_avg.min
      2499 ± 18%      -3.6%       2408 ± 25%     -16.7%       2081 ±  7%     -19.3%       2017 ± 10%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +1.8e+09%      17.90 ±147%  +7.9e+09%      78.69 ±121%  +1.7e+10%     173.19 ±159%  sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +6.4e+10%     644.53 ±147%  +2.4e+11%       2379 ±126%  +5.8e+11%       5752 ±164%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
      0.00       +1.1e+104%     105.92 ±147%   +4e+104%     404.91 ±123% +9.5e+104%     949.58 ±163%  sched_debug.cfs_rq:/.max_vruntime.stddev
      3119            +0.3%       3129            +0.7%       3140            +0.1%       3122        sched_debug.cfs_rq:/.min_vruntime.avg
     26285 ± 24%      +1.1%      26575 ± 24%     -23.1%      20223 ± 10%      -4.0%      25223 ± 19%  sched_debug.cfs_rq:/.min_vruntime.max
    583.59 ± 13%      -3.4%     563.56 ± 24%      -2.4%     569.59 ± 24%      +2.0%     595.13 ± 34%  sched_debug.cfs_rq:/.min_vruntime.min
      5011 ± 12%      +3.3%       5175 ± 11%      -8.5%       4584 ±  5%      -2.4%       4891 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.38 ±  9%      +1.2%       0.38 ±  7%      -1.2%       0.38 ± 10%      +8.5%       0.41 ±  9%  sched_debug.cfs_rq:/.nr_running.avg
      1.00           +33.3%       1.33 ± 35%     +66.7%       1.67 ± 44%     +50.0%       1.50 ± 50%  sched_debug.cfs_rq:/.nr_running.max
      0.48            +4.0%       0.50 ±  5%     +11.7%       0.54 ± 13%      +8.2%       0.52 ± 11%  sched_debug.cfs_rq:/.nr_running.stddev
     60.78 ± 73%     +38.2%      84.01 ± 38%     +39.1%      84.53 ± 43%      -7.6%      56.14 ± 49%  sched_debug.cfs_rq:/.removed.load_avg.avg
    847.17 ± 44%     +20.8%       1023           +20.2%       1018           +20.9%       1024        sched_debug.cfs_rq:/.removed.load_avg.max
    209.16 ± 52%     +29.6%     271.15 ± 20%     +29.7%     271.36 ± 22%      +7.3%     224.34 ± 22%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     28.57 ± 80%     -11.5%      25.27 ± 45%      +8.1%      30.87 ± 40%     -30.7%      19.81 ± 58%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    407.67 ± 47%      +9.1%     444.83 ± 17%     +22.0%     497.17 ±  9%      -7.1%     378.83 ± 41%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     97.01 ± 58%      -8.5%      88.80 ± 27%      +9.8%     106.55 ± 22%     -18.4%      79.12 ± 48%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     28.54 ± 80%     -11.5%      25.26 ± 45%      +8.2%      30.87 ± 40%     -30.7%      19.79 ± 58%  sched_debug.cfs_rq:/.removed.util_avg.avg
    407.67 ± 47%      +9.1%     444.67 ± 17%     +22.0%     497.17 ±  9%      -7.2%     378.17 ± 41%  sched_debug.cfs_rq:/.removed.util_avg.max
     96.92 ± 58%      -8.4%      88.75 ± 27%      +9.9%     106.55 ± 22%     -18.5%      79.01 ± 49%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    640.06 ±  5%      +0.3%     642.19 ±  5%      +0.6%     643.73 ±  6%      -4.6%     610.72 ±  4%  sched_debug.cfs_rq:/.runnable_avg.avg
      1768 ± 14%      -3.0%       1715 ± 23%      -3.4%       1707 ± 20%      -7.3%       1640 ± 16%  sched_debug.cfs_rq:/.runnable_avg.max
      4.50 ±114%    +274.1%      16.83 ±191%     +11.1%       5.00 ± 83%     -25.9%       3.33 ± 56%  sched_debug.cfs_rq:/.runnable_avg.min
    395.40 ± 15%      +1.7%     402.27 ± 16%      -4.3%     378.34 ± 14%      -2.1%     387.11 ± 12%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00          -100.0%       0.00       +5.6e+100%       0.06 ±223% +5.6e+100%       0.06 ±223%  sched_debug.cfs_rq:/.spread.avg
      0.00          -100.0%       0.00         +2e+102%       2.00 ±223%   +2e+102%       2.00 ±223%  sched_debug.cfs_rq:/.spread.max
      0.00          -100.0%       0.00       +3.3e+101%       0.33 ±223% +3.3e+101%       0.33 ±223%  sched_debug.cfs_rq:/.spread.stddev
    -14883           +13.1%     -16838            +8.5%     -16143           +29.5%     -19266        sched_debug.cfs_rq:/.spread0.avg
      8282 ±102%     -20.2%       6607 ±115%     -88.6%     947.79 ±105%     -65.7%       2844 ±151%  sched_debug.cfs_rq:/.spread0.max
    -17419           +11.4%     -19403            +7.5%     -18717           +25.1%     -21790        sched_debug.cfs_rq:/.spread0.min
      5011 ± 12%      +3.4%       5180 ± 11%      -8.5%       4587 ±  5%      -2.4%       4892 ± 11%  sched_debug.cfs_rq:/.spread0.stddev
    637.04 ±  4%      +0.3%     639.05 ±  5%      +0.6%     640.89 ±  6%      -4.6%     608.03 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
      1754 ± 14%      -3.0%       1701 ± 23%      -2.9%       1703 ± 20%      -6.9%       1633 ± 17%  sched_debug.cfs_rq:/.util_avg.max
      4.50 ±114%    +270.4%      16.67 ±194%      -3.7%       4.33 ± 81%     -40.7%       2.67 ± 55%  sched_debug.cfs_rq:/.util_avg.min
    393.57 ± 15%      +1.6%     399.98 ± 16%      -4.1%     377.50 ± 14%      -2.0%     385.79 ± 12%  sched_debug.cfs_rq:/.util_avg.stddev
     49.30 ± 25%      -5.3%      46.70 ± 20%      -8.2%      45.25 ± 33%     +18.0%      58.18 ± 18%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    480.33 ±  2%      -0.1%     479.83 ±  3%      -0.8%     476.33 ±  4%      +1.1%     485.67 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.max
    137.46 ± 11%      -5.1%     130.42 ± 12%      -7.2%     127.60 ± 16%      +1.9%     140.09 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    514038 ±  4%      -1.4%     506998 ±  3%      -4.6%     490245 ±  6%      -6.8%     478841 ±  3%  sched_debug.cpu.avg_idle.avg
    983370 ±  2%      +1.7%    1000000            +0.5%     988389 ±  2%      -1.8%     965285 ±  5%  sched_debug.cpu.avg_idle.max
      4135 ± 51%     -41.1%       2436 ±  6%    +325.3%      17589 ±185%     -40.6%       2455 ±  9%  sched_debug.cpu.avg_idle.min
    222213 ±  8%     +13.6%     252345 ±  2%      +3.9%     230974 ±  7%      +8.4%     240975 ± 10%  sched_debug.cpu.avg_idle.stddev
     29673 ±  2%      -0.5%      29535 ±  2%      -1.6%      29209            -1.0%      29372        sched_debug.cpu.clock.avg
     29674 ±  2%      -0.5%      29536 ±  2%      -1.6%      29210            -1.0%      29373        sched_debug.cpu.clock.max
     29672 ±  2%      -0.5%      29533 ±  2%      -1.6%      29207            -1.0%      29371        sched_debug.cpu.clock.min
      0.73 ±  6%      +5.3%       0.77 ± 11%      +0.7%       0.74 ±  9%      +7.2%       0.78 ± 16%  sched_debug.cpu.clock.stddev
     29648 ±  2%      -0.5%      29510 ±  2%      -1.6%      29184            -1.0%      29347        sched_debug.cpu.clock_task.avg
     29669 ±  2%      -0.5%      29530 ±  2%      -1.6%      29205            -1.0%      29369        sched_debug.cpu.clock_task.max
     29254 ±  2%      -0.5%      29114 ±  2%      -1.6%      28797            -1.1%      28944        sched_debug.cpu.clock_task.min
     67.93 ±  3%      +0.3%      68.17 ±  2%      -1.7%      66.80 ±  4%      +1.9%      69.24 ±  2%  sched_debug.cpu.clock_task.stddev
      1227 ±  7%      -7.0%       1141 ± 10%     -13.1%       1066 ± 15%      -6.0%       1153 ±  4%  sched_debug.cpu.curr->pid.avg
      3300            +0.0%       3301            -0.1%       3296            +0.1%       3302        sched_debug.cpu.curr->pid.max
      1552            -1.5%       1528 ±  2%      -3.7%       1495 ±  5%      -1.5%       1529        sched_debug.cpu.curr->pid.stddev
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.avg
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.max
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 19%     +12.3%       0.00 ± 35%     -15.4%       0.00 ±  7%      +2.2%       0.00 ± 16%  sched_debug.cpu.next_balance.stddev
      0.38 ±  5%      -1.2%       0.38 ±  8%      +1.2%       0.38 ± 12%      +6.1%       0.40 ±  9%  sched_debug.cpu.nr_running.avg
      1.00           +33.3%       1.33 ± 35%     +83.3%       1.83 ± 48%     +83.3%       1.83 ± 37%  sched_debug.cpu.nr_running.max
      0.48            +3.3%       0.50 ±  5%     +13.5%       0.55 ± 13%     +11.4%       0.54 ±  9%  sched_debug.cpu.nr_running.stddev
      5023            -0.1%       5018            -0.4%       5005            -0.0%       5021        sched_debug.cpu.nr_switches.avg
     24386 ± 17%     +11.5%      27184 ± 18%     +17.3%      28607 ± 16%     +29.1%      31479 ± 20%  sched_debug.cpu.nr_switches.max
    467.33 ± 24%      -7.1%     434.33 ± 30%     -23.9%     355.83 ± 27%      -1.2%     461.67 ± 42%  sched_debug.cpu.nr_switches.min
      5311 ±  6%     +14.7%       6091 ±  6%     +17.2%       6223 ± 14%     +17.2%       6223 ±  7%  sched_debug.cpu.nr_switches.stddev
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        sched_debug.cpu.nr_uninterruptible.avg
     14.33 ± 19%      -7.0%      13.33 ± 22%     -24.4%      10.83 ± 13%      -2.3%      14.00 ± 23%  sched_debug.cpu.nr_uninterruptible.max
     -8.50           +90.2%     -16.17           +11.8%      -9.50           +17.6%     -10.00        sched_debug.cpu.nr_uninterruptible.min
      4.95 ± 10%     +13.1%       5.60 ± 36%      -4.3%       4.74 ± 17%      +1.8%       5.04 ±  7%  sched_debug.cpu.nr_uninterruptible.stddev
     29672 ±  2%      -0.5%      29534 ±  2%      -1.6%      29208            -1.0%      29371        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            -0.0%  4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
     29621 ±  2%      -0.5%      29482 ±  2%      -1.6%      29157            -1.0%      29320        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
     29694 ±  2%      -0.5%      29556 ±  2%      -1.6%      29230            -1.0%      29392        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      0.38 ± 71%      -0.3        0.09 ±223%      -0.3        0.08 ±223%      -0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
      0.37 ± 71%      -0.3        0.09 ±223%      -0.1        0.27 ±100%      +0.2        0.58 ±  7%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64
      0.36 ± 71%      -0.3        0.09 ±223%      -0.4        0.00            -0.4        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      0.58 ± 45%      -0.3        0.32 ±100%      -0.1        0.48 ± 45%      -0.1        0.45 ± 45%  perf-profile.calltrace.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      9.87 ±  9%      -0.2        9.63 ±  6%      -0.5        9.40 ±  3%      -0.3        9.53 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
      0.35 ± 70%      -0.2        0.10 ±223%      +0.0        0.37 ± 71%      -0.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.36 ± 70%      -0.2        0.11 ±223%      +0.1        0.49 ± 73%      -0.2        0.19 ±142%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single
      9.85 ±  9%      -0.2        9.61 ±  7%      -0.5        9.38 ±  3%      -0.3        9.52 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      9.83 ±  9%      -0.2        9.59 ±  6%      -0.5        9.36 ±  3%      -0.3        9.50 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      9.92 ±  9%      -0.2        9.70 ±  7%      -0.5        9.45 ±  3%      -0.3        9.60 ±  2%  perf-profile.calltrace.cycles-pp.mount
      0.37 ± 71%      -0.2        0.17 ±141%      -0.3        0.08 ±223%      -0.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      8.94 ±  9%      -0.2        8.74 ±  7%      -0.4        8.56 ±  3%      -0.3        8.61 ±  3%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      0.47 ± 45%      -0.2        0.28 ±100%      -0.4        0.10 ±223%      -0.1        0.35 ± 70%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.46 ± 44%      -0.2        0.27 ±100%      -0.1        0.36 ± 71%      -0.3        0.17 ±141%  perf-profile.calltrace.cycles-pp.strcmp@plt
      0.18 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.down_write.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      0.36 ± 71%      -0.2        0.19 ±141%      -0.1        0.28 ±100%      -0.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
      0.17 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_lock_mount.do_new_mount.__x64_sys_mount
      0.36 ± 70%      -0.2        0.20 ±141%      -0.1        0.28 ±100%      -0.3        0.09 ±223%  perf-profile.calltrace.cycles-pp.__xstat64
      3.92 ±  7%      -0.1        3.78 ±  8%      -0.1        3.83 ±  2%      -0.1        3.85 ±  5%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      4.02 ±  7%      -0.1        3.89 ±  8%      -0.1        3.93 ±  2%      -0.1        3.94 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.49 ± 45%      -0.1        0.37 ± 70%      -0.2        0.27 ±100%      -0.0        0.49 ± 44%  perf-profile.calltrace.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.62 ± 10%      -0.1        0.51 ± 45%      -0.2        0.39 ± 72%      -0.1        0.48 ± 44%  perf-profile.calltrace.cycles-pp.__do_softirq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.29 ±101%      -0.1        0.18 ±141%      -0.1        0.19 ±141%      -0.1        0.22 ±141%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      2.99 ±  8%      -0.1        2.89 ± 11%      -0.2        2.79 ±  9%      -0.4        2.59 ±  7%  perf-profile.calltrace.cycles-pp.device_set_syspath.sd_device_new_from_syspath
      0.48 ± 45%      -0.1        0.38 ± 71%      -0.3        0.19 ±143%      -0.2        0.26 ±100%  perf-profile.calltrace.cycles-pp.device_read_db_internal_filename
      1.48 ± 10%      -0.1        1.38 ±  6%      -0.2        1.32 ±  7%      -0.2        1.26 ± 10%  perf-profile.calltrace.cycles-pp.siphash24_compress
      0.18 ±141%      -0.1        0.08 ±223%      -0.1        0.10 ±223%      -0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      1.58 ±  9%      -0.1        1.48 ± 13%      -0.1        1.46 ±  4%      -0.2        1.42 ±  8%  perf-profile.calltrace.cycles-pp.__close
      0.17 ±141%      -0.1        0.08 ±223%      -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.writeback_inodes_sb.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super
      0.18 ±141%      -0.1        0.09 ±223%      -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath
      3.50 ± 10%      -0.1        3.41 ±  4%      -0.2        3.28 ±  4%      -0.1        3.37 ±  2%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.get_nr_dirty_inodes.writeback_inodes_sb.sync_filesystem.generic_shutdown_super.kill_litter_super
      0.09 ±223%      -0.1        0.00            +0.0        0.10 ±223%      +0.0        0.09 ±223%  perf-profile.calltrace.cycles-pp.queue_work_on.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount
      0.18 ±141%      -0.1        0.09 ±223%      +0.0        0.18 ±141%      -0.2        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
      3.48 ± 10%      -0.1        3.40 ±  5%      -0.2        3.27 ±  4%      -0.1        3.35 ±  2%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
      1.35 ± 10%      -0.1        1.27 ± 13%      -0.1        1.26 ±  4%      -0.1        1.23 ±  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      0.76 ± 10%      -0.1        0.68 ± 11%      -0.0        0.72 ±  5%      -0.1        0.69 ± 13%  perf-profile.calltrace.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.79 ± 11%      -0.1        0.72 ± 13%      -0.0        0.75 ±  6%      -0.1        0.72 ± 14%  perf-profile.calltrace.cycles-pp.readlinkat
      1.33 ± 10%      -0.1        1.26 ± 13%      -0.1        1.24 ±  3%      -0.1        1.22 ±  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      0.77 ± 10%      -0.1        0.69 ± 12%      -0.0        0.72 ±  6%      -0.1        0.70 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.76 ± 11%      -0.1        0.69 ± 11%      -0.0        0.72 ±  6%      -0.1        0.70 ± 13%  perf-profile.calltrace.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.77 ± 11%      -0.1        0.69 ± 12%      -0.0        0.72 ±  6%      -0.1        0.70 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
      0.17 ±141%      -0.1        0.10 ±223%      -0.1        0.09 ±223%      -0.2        0.00        perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±141%      -0.1        0.10 ±223%      +0.1        0.27 ±100%      +0.0        0.17 ±141%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      2.77 ± 11%      -0.1        2.70 ± 10%      -0.2        2.58 ± 10%      -0.4        2.42 ± 12%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.80 ± 11%      -0.1        2.73 ± 10%      -0.2        2.61 ±  9%      -0.4        2.44 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.02 ±  8%      -0.1        2.94 ±  7%      -0.0        2.99 ±  2%      +0.0        3.02 ±  5%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.74 ± 12%      -0.1        0.67 ± 13%      -0.0        0.72 ±  8%      -0.0        0.70 ±  6%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      3.00 ±  8%      -0.1        2.94 ±  7%      -0.0        2.97 ±  3%      +0.0        3.01 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      2.81 ± 11%      -0.1        2.74 ± 10%      -0.2        2.61 ±  9%      -0.4        2.45 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      3.34 ±  9%      -0.1        3.28 ± 11%      -0.2        3.14 ±  9%      -0.4        2.90 ±  7%  perf-profile.calltrace.cycles-pp.sd_device_new_from_syspath
      0.25 ±100%      -0.1        0.18 ±141%      -0.1        0.19 ±141%      -0.3        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
      2.78 ± 11%      -0.1        2.72 ± 10%      -0.2        2.59 ±  9%      -0.4        2.43 ± 12%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     10.21 ±  8%      -0.1       10.14 ±  6%      -0.1       10.09            -0.0       10.20        perf-profile.calltrace.cycles-pp.umount2
      2.75 ±  7%      -0.1        2.69 ±  8%      -0.0        2.74 ±  2%      -0.0        2.74 ±  5%  perf-profile.calltrace.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.73 ±  9%      -0.1        0.67 ± 15%      -0.1        0.68 ±  8%      -0.0        0.71 ±  7%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      2.85 ± 11%      -0.1        2.80 ± 10%      -0.2        2.66 ±  9%      -0.4        2.50 ± 12%  perf-profile.calltrace.cycles-pp.read
      1.07 ±  9%      -0.1        1.02 ± 13%      -0.1        1.00 ±  5%      -0.1        0.99 ±  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      2.28 ± 11%      -0.1        2.23 ±  7%      -0.0        2.24 ±  2%      -0.0        2.25 ±  5%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
      0.81 ± 11%      -0.1        0.75 ± 12%      +0.0        0.81 ±  7%      -0.0        0.77 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      2.58 ± 11%      -0.1        2.53 ± 10%      -0.2        2.40 ±  9%      -0.3        2.24 ± 12%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.68 ± 10%      -0.1        2.62 ±  8%      -0.0        2.63 ±  3%      -0.0        2.65 ±  4%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
      2.74 ± 10%      -0.1        2.69 ±  8%      -0.1        2.68 ±  3%      -0.0        2.71 ±  4%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
      1.06 ± 10%      -0.1        1.01 ± 14%      -0.1        0.99 ±  5%      -0.1        0.98 ±  9%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      2.66 ± 11%      -0.0        2.60 ±  8%      -0.1        2.60 ±  2%      -0.0        2.62 ±  4%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
      1.41 ± 10%      -0.0        1.36 ± 11%      -0.2        1.26 ± 13%      -0.2        1.23 ± 13%  perf-profile.calltrace.cycles-pp.malloc
      0.98 ±  8%      -0.0        0.94 ± 10%      -0.0        0.94 ±  8%      -0.0        0.94 ±  4%  perf-profile.calltrace.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      0.82 ± 11%      -0.0        0.77 ± 11%      +0.0        0.83 ±  7%      -0.0        0.79 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
      0.81 ± 11%      -0.0        0.77 ± 11%      +0.0        0.82 ±  7%      -0.0        0.78 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      1.92 ±  8%      -0.0        1.87 ±  6%      -0.0        1.90 ±  3%      +0.0        1.92 ±  3%  perf-profile.calltrace.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.48 ± 12%      -0.0        1.44 ±  8%      -0.0        1.44 ±  4%      -0.0        1.45 ±  3%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
      0.40 ± 71%      -0.0        0.36 ± 71%      -0.3        0.10 ±223%      -0.1        0.28 ±100%  perf-profile.calltrace.cycles-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
      0.87 ± 11%      -0.0        0.83 ± 10%      +0.0        0.88 ±  6%      -0.0        0.83 ±  7%  perf-profile.calltrace.cycles-pp.rmdir
      1.99 ± 13%      -0.0        1.95 ± 10%      -0.1        1.86 ±  9%      -0.3        1.71 ± 13%  perf-profile.calltrace.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
      0.61 ± 10%      -0.0        0.58 ±  5%      -0.0        0.58 ±  9%      +0.0        0.66 ±  4%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.84 ±  8%      -0.0        9.80 ±  6%      -0.1        9.75            +0.0        9.86        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
      0.95 ± 14%      -0.0        0.92 ± 10%      -0.0        0.93 ±  2%      -0.0        0.94 ±  5%  perf-profile.calltrace.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      3.23 ± 10%      -0.0        3.20 ±  8%      -0.0        3.21 ±  3%      -0.0        3.18 ±  4%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.30 ±  9%      -0.0        1.27 ±  3%      -0.1        1.24 ±  6%      -0.0        1.30 ±  6%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
      0.39 ± 71%      -0.0        0.36 ± 70%      -0.2        0.18 ±141%      -0.1        0.27 ±100%  perf-profile.calltrace.cycles-pp.rdrand
      9.78 ±  8%      -0.0        9.75 ±  5%      -0.1        9.71            +0.0        9.80        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.93 ± 11%      -0.0        0.90 ±  4%      -0.1        0.87 ±  4%      -0.1        0.86 ±  2%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.93 ±  7%      -0.0        0.90 ± 10%      -0.0        0.90 ±  8%      -0.0        0.88 ±  4%  perf-profile.calltrace.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run
      2.82 ± 10%      -0.0        2.79 ±  9%      -0.1        2.76 ±  3%      -0.0        2.78 ±  4%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
      1.90 ±  8%      -0.0        1.87 ± 10%      -0.1        1.82 ± 11%      -0.2        1.66 ±  7%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64
      1.92 ±  8%      -0.0        1.89 ± 11%      -0.1        1.84 ± 11%      -0.2        1.67 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath
      0.79 ± 11%      -0.0        0.76 ±  8%      -0.0        0.77 ±  5%      +0.0        0.83 ±  9%  perf-profile.calltrace.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      2.86 ±  7%      -0.0        2.83 ±  7%      -0.1        2.72 ±  7%      -0.2        2.69 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      1.97 ±  9%      -0.0        1.94 ± 11%      -0.1        1.88 ± 11%      -0.3        1.72 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      1.96 ±  9%      -0.0        1.93 ± 11%      -0.1        1.88 ± 11%      -0.2        1.71 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      0.67 ±  7%      -0.0        0.64 ± 10%      -0.1        0.60 ± 14%      -0.2        0.52 ± 44%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      2.92 ± 11%      -0.0        2.89 ±  9%      -0.0        2.87 ±  3%      -0.0        2.87 ±  3%  perf-profile.calltrace.cycles-pp.stress_rndstr
      2.88 ±  7%      -0.0        2.85 ±  7%      -0.1        2.73 ±  7%      -0.2        2.70 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      0.48 ± 44%      -0.0        0.46 ± 44%      -0.1        0.38 ± 71%      -0.0        0.47 ± 45%  perf-profile.calltrace.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64
      0.81 ± 13%      -0.0        0.78 ± 10%      -0.0        0.78 ±  2%      -0.0        0.80 ±  6%  perf-profile.calltrace.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount
      0.94 ±  6%      -0.0        0.92 ±  6%      -0.1        0.85 ± 11%      +0.0        0.95 ±  4%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      2.80 ±  6%      -0.0        2.78 ±  7%      -0.1        2.66 ±  7%      -0.2        2.64 ±  5%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      1.42 ± 10%      -0.0        1.40 ±  4%      -0.1        1.36 ±  6%      +0.0        1.43 ±  5%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
      0.76 ±  6%      -0.0        0.75 ±  5%      -0.1        0.68 ± 12%      +0.0        0.80 ±  4%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      2.82 ±  7%      -0.0        2.80 ±  7%      -0.1        2.69 ±  7%      -0.2        2.65 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      0.88 ± 11%      -0.0        0.86 ±  9%      -0.0        0.87 ±  4%      +0.0        0.89 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.26 ±  9%      -0.0        1.25 ±  7%      +0.0        1.26 ±  3%      -0.1        1.20 ±  4%  perf-profile.calltrace.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.88 ± 11%      -0.0        0.87 ±  9%      -0.0        0.87 ±  4%      +0.0        0.89 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
      0.86 ± 10%      -0.0        0.85 ±  9%      -0.0        0.86 ±  5%      +0.0        0.88 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      3.86 ±  7%      -0.0        3.85 ±  9%      -0.2        3.68 ±  8%      -0.4        3.50 ±  5%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      3.94 ±  7%      -0.0        3.93 ±  9%      -0.2        3.78 ±  8%      -0.4        3.58 ±  5%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.12 ±  8%      -0.0        2.11 ± 10%      -0.1        2.02 ± 10%      -0.3        1.86 ±  7%  perf-profile.calltrace.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
      0.74 ±  8%      -0.0        0.73 ±  9%      +0.0        0.75 ±  5%      +0.0        0.74 ±  5%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.48 ± 20%      -0.0        1.47 ±  8%      +0.1        1.54 ± 13%      +0.2        1.63 ±  7%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.79 ± 22%      -0.0        0.78 ±  8%      +0.0        0.81 ± 12%      +0.1        0.87 ±  9%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.82 ±  9%      -0.0        0.81 ± 14%      -0.0        0.79 ± 12%      -0.1        0.70 ±  8%  perf-profile.calltrace.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      2.97 ±  7%      -0.0        2.97 ±  7%      -0.1        2.84 ±  7%      -0.2        2.80 ±  5%  perf-profile.calltrace.cycles-pp.open64
      2.04 ± 11%      -0.0        2.04 ±  5%      -0.1        1.92 ±  4%      -0.0        2.02 ±  4%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      1.36 ± 19%      -0.0        1.36 ±  9%      +0.1        1.43 ± 13%      +0.2        1.52 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.40 ± 20%      -0.0        1.39 ±  8%      +0.1        1.46 ± 13%      +0.2        1.55 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.83 ±  8%      -0.0        0.83 ±  4%      -0.0        0.80 ±  7%      -0.0        0.80 ±  6%  perf-profile.calltrace.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.07 ± 12%      -0.0        1.07 ±  7%      -0.1        1.00 ±  7%      -0.0        1.04 ±  5%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      1.03 ± 20%      -0.0        1.03 ±  7%      +0.1        1.09 ± 13%      +0.1        1.14 ±  7%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      1.39 ± 19%      -0.0        1.39 ±  9%      +0.1        1.45 ± 13%      +0.2        1.54 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.__slab_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.76 ± 12%      +0.0        0.76 ±  7%      +0.0        0.78 ±  4%      +0.0        0.78 ±  6%  perf-profile.calltrace.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.03 ± 19%      +0.0        1.03 ±  7%      +0.1        1.09 ± 13%      +0.1        1.14 ±  7%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.synchronize_rcu_expedited.namespace_unlock.do_umount
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.schedule.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.swake_up_one.rcu_note_context_switch.__schedule.schedule.exit_to_user_mode_loop
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.__queue_work.queue_work_on.synchronize_rcu_expedited.namespace_unlock
      0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited_wait_once.synchronize_rcu_expedited_wait.rcu_exp_wait_wake.process_one_work.worker_thread
      0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.__queue_work.queue_work_on.synchronize_rcu_expedited.namespace_unlock.do_umount
      0.00            +0.0        0.00            +0.2        0.18 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.rcu_note_context_switch.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +0.0        0.00            +0.3        0.27 ±100%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
      0.18 ±223%      +0.0        0.18 ±141%      -0.1        0.09 ±223%      -0.2        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.84 ± 22%      +0.0        0.85 ±  8%      +0.0        0.88 ± 13%      +0.1        0.94 ±  8%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      1.29 ± 19%      +0.0        1.29 ±  8%      +0.1        1.34 ± 13%      +0.1        1.43 ±  6%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      1.33 ± 19%      +0.0        1.33 ±  8%      +0.1        1.39 ± 13%      +0.1        1.48 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±141%      +0.0        0.18 ±141%      -0.2        0.00            -0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.__fxstat64
      0.08 ±223%      +0.0        0.09 ±223%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.04 ±  9%      +0.0        1.05 ±  7%      -0.0        1.02 ±  4%      -0.1        0.96 ±  3%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
      1.33 ± 19%      +0.0        1.33 ±  8%      +0.1        1.39 ± 13%      +0.2        1.48 ±  6%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.61 ±  7%      +0.0        1.61 ±  8%      -0.0        1.60 ±  5%      -0.0        1.58 ±  5%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.93 ±  8%      +0.0        0.94 ±  9%      +0.0        0.96 ±  4%      +0.0        0.96 ±  6%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.86 ± 22%      +0.0        0.87 ±  8%      +0.0        0.91 ± 13%      +0.1        0.96 ±  8%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      0.92 ± 12%      +0.0        0.93 ±  9%      -0.0        0.92 ±  5%      +0.0        0.93 ±  6%  perf-profile.calltrace.cycles-pp.mkdir
      0.92 ± 21%      +0.0        0.93 ±  8%      +0.1        0.98 ± 13%      +0.1        1.03 ±  8%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      1.18 ± 20%      +0.0        1.19 ±  7%      +0.1        1.24 ± 13%      +0.1        1.30 ±  7%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.26 ±100%      +0.0        0.27 ±100%      -0.1        0.19 ±141%      -0.2        0.10 ±223%  perf-profile.calltrace.cycles-pp.path_compare
      1.86 ± 10%      +0.0        1.87 ±  5%      -0.1        1.76 ±  5%      -0.0        1.85 ±  4%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
      1.19 ± 20%      +0.0        1.20 ±  7%      +0.1        1.25 ± 13%      +0.1        1.32 ±  7%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.21 ±  8%      +0.0        1.22 ±  7%      +0.0        1.22 ±  4%      +0.0        1.23 ±  5%  perf-profile.calltrace.cycles-pp.__lxstat64
      1.11 ± 14%      +0.0        1.12 ±  6%      +0.0        1.14 ±  6%      -0.0        1.11 ±  7%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.76 ±  8%      +0.0        0.77 ±  9%      -0.0        0.73 ±  9%      -0.0        0.76 ±  7%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
      1.10 ± 14%      +0.0        1.11 ±  5%      +0.0        1.12 ±  6%      +0.0        1.10 ±  7%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      1.10 ±  9%      +0.0        1.12 ±  9%      +0.0        1.12 ±  4%      +0.0        1.12 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.64 ± 14%      +0.0        0.66 ± 14%      -0.0        0.63 ±  7%      -0.0        0.60 ±  9%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      0.87 ± 16%      +0.0        0.89 ±  5%      +0.0        0.91 ±  6%      +0.0        0.90 ±  7%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      1.52 ±  5%      +0.0        1.54 ±  5%      -0.0        1.50 ±  6%      -0.0        1.50 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      1.53 ±  5%      +0.0        1.56 ±  5%      -0.0        1.52 ±  6%      -0.0        1.52 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      1.08 ±  9%      +0.0        1.11 ±  8%      +0.0        1.11 ±  4%      +0.0        1.11 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.54 ±  5%      +0.0        1.56 ±  5%      -0.0        1.52 ±  6%      -0.0        1.52 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
      1.05 ±  9%      +0.0        1.08 ±  9%      +0.0        1.08 ±  4%      +0.0        1.08 ±  6%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      1.78 ± 11%      +0.0        1.80 ±  6%      +0.0        1.78 ±  7%      -0.0        1.73 ±  4%  perf-profile.calltrace.cycles-pp.unlink
      1.65 ± 15%      +0.0        1.68 ±  4%      +0.1        1.71 ±  7%      -0.0        1.61 ±  6%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.72 ± 14%      +0.0        0.75 ± 13%      -0.0        0.70 ±  4%      -0.0        0.68 ± 10%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.58 ±  6%      +0.0        1.61 ±  5%      -0.0        1.57 ±  5%      -0.0        1.57 ±  3%  perf-profile.calltrace.cycles-pp.symlink
      1.14 ±  6%      +0.0        1.17 ± 11%      -0.1        1.08 ±  3%      -0.0        1.12 ±  4%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
      1.36 ±  6%      +0.0        1.39 ±  4%      -0.0        1.35 ±  4%      -0.0        1.34 ±  5%  perf-profile.calltrace.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.87 ± 13%      +0.0        0.90 ±  4%      -0.0        0.83 ±  6%      +0.0        0.87 ±  4%  perf-profile.calltrace.cycles-pp.stress_mwc32
      1.21 ± 13%      +0.0        1.24 ±  3%      +0.0        1.22 ±  8%      -0.0        1.18 ±  5%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.13 ±  7%      +0.0        1.17 ± 10%      -0.0        1.08 ±  3%      -0.0        1.10 ±  4%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
      1.68 ± 11%      +0.0        1.72 ±  5%      +0.0        1.71 ±  8%      -0.0        1.65 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      6.71 ±  8%      +0.0        6.76 ±  5%      -0.0        6.67            +0.0        6.72 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.70 ± 11%      +0.0        1.74 ±  6%      +0.0        1.71 ±  8%      -0.0        1.67 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      1.50 ± 12%      +0.0        1.55 ±  6%      +0.0        1.53 ±  8%      -0.0        1.48 ±  5%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      2.01 ± 15%      +0.0        2.05 ±  2%      +0.1        2.08 ±  8%      -0.0        2.00 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.66 ± 11%      +0.0        1.71 ±  5%      +0.0        1.69 ±  8%      -0.0        1.64 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      4.29 ±  9%      +0.0        4.34 ±  6%      -0.0        4.27 ±  2%      +0.1        4.34 ±  3%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.37 ± 10%      +0.0        2.42 ±  6%      -0.0        2.36 ±  4%      -0.0        2.36 ±  5%  perf-profile.calltrace.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      0.55 ±  6%      +0.0        0.60 ± 14%      +0.0        0.58 ±  7%      +0.0        0.60        perf-profile.calltrace.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      3.27 ±  5%      +0.1        3.33 ±  5%      +0.1        3.35 ±  6%      +0.0        3.32 ±  3%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      1.97 ± 15%      +0.1        2.03 ±  2%      +0.1        2.06 ±  8%      +0.0        1.98 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.23 ± 10%      +0.1        1.29 ±  8%      +0.1        1.30 ± 10%      +0.0        1.26 ±  7%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      0.64 ± 16%      +0.1        0.71 ± 16%      +0.2        0.84 ± 18%      +0.1        0.77 ± 19%  perf-profile.calltrace.cycles-pp.rcu_exp_wait_wake.process_one_work.worker_thread.kthread.ret_from_fork
      3.95 ±  5%      +0.1        4.02 ±  4%      +0.0        3.98 ±  5%      +0.0        3.97 ±  3%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.1        0.10 ±223%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      4.74 ±  8%      +0.1        4.83 ±  5%      -0.0        4.72 ±  2%      +0.0        4.75 ±  3%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.00            +0.1        0.09 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus
      0.00            +0.1        0.09 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.1        0.09 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.1        0.09 ±223%      +0.2        0.17 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.00            +0.1        0.09 ±223%      +0.2        0.18 ±142%      +0.2        0.19 ±141%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited_wait.rcu_exp_wait_wake.process_one_work.worker_thread.kthread
      0.00            +0.1        0.09 ±223%      +0.2        0.21 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      0.00            +0.1        0.09 ±223%      +0.2        0.21 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.1        0.09 ±223%      +0.2        0.22 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.1        0.09 ±223%      +0.2        0.22 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.1        0.09 ±223%      +0.2        0.22 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      6.74 ± 23%      +0.1        6.83 ± 33%      +0.8        7.57 ±  8%      +0.7        7.42 ± 29%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      0.18 ±141%      +0.1        0.27 ±100%      -0.1        0.09 ±223%      -0.2        0.00        perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      6.75 ± 23%      +0.1        6.84 ± 33%      +0.8        7.58 ±  8%      +0.7        7.44 ± 29%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      0.52 ± 48%      +0.1        0.62 ±  6%      +0.1        0.62 ±  7%      +0.1        0.64 ± 10%  perf-profile.calltrace.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle
      0.53 ± 48%      +0.1        0.63 ±  7%      +0.1        0.63 ±  7%      +0.1        0.66 ± 11%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer
      0.08 ±223%      +0.1        0.18 ±141%      +0.1        0.19 ±141%      -0.1        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.47 ± 45%      +0.1        0.58 ± 10%      -0.2        0.28 ±100%      -0.0        0.46 ± 44%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.59 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      2.89 ± 10%      +0.1        3.01 ±  7%      +0.0        2.92 ±  7%      -0.0        2.86 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.26 ±100%      +0.1        0.38 ± 71%      -0.1        0.18 ±141%      -0.0        0.26 ±100%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      3.14 ± 10%      +0.1        3.29 ±  6%      +0.0        3.19 ±  7%      -0.0        3.10 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.28 ±100%      +0.2        0.45 ± 45%      +0.1        0.36 ± 70%      +0.2        0.44 ± 44%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64
      0.09 ±223%      +0.2        0.26 ±100%      -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp
      0.00            +0.2        0.18 ±142%      +0.2        0.19 ±141%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.08 ±223%      +0.2        0.27 ±100%      +0.0        0.08 ±223%      +0.0        0.08 ±223%  perf-profile.calltrace.cycles-pp.list_lru_destroy.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      0.32 ±101%      +0.2        0.53 ± 54%      +0.2        0.51 ± 74%      +0.1        0.44 ± 71%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.39 ± 71%      +0.2        0.62 ± 10%      +0.2        0.56 ±  6%      +0.1        0.46 ± 44%  perf-profile.calltrace.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread
      0.09 ±223%      +0.3        0.37 ± 70%      -0.0        0.09 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work
     29.80 ±  9%      +0.3       30.13 ± 13%      +1.5       31.26 ±  6%      +2.6       32.35 ±  7%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.4        0.35 ± 70%      +0.1        0.08 ±223%      +0.2        0.21 ±146%  perf-profile.calltrace.cycles-pp.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      1.22 ± 15%      +0.4        1.62 ± 15%      +0.2        1.43 ± 10%      +0.4        1.61 ± 29%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
      1.24 ± 15%      +0.4        1.65 ± 15%      +0.2        1.46 ± 10%      +0.4        1.64 ± 29%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
      1.27 ± 15%      +0.4        1.68 ± 15%      +0.2        1.49 ± 10%      +0.4        1.67 ± 28%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.26 ± 15%      +0.4        1.68 ± 15%      +0.2        1.49 ± 10%      +0.4        1.67 ± 28%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.35 ± 15%      +0.4        1.77 ± 15%      +0.2        1.58 ±  9%      +0.4        1.76 ± 27%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
     29.55 ± 10%      +0.4       29.99 ± 11%      +0.9       30.43 ±  5%      +1.8       31.39 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     29.55 ± 10%      +0.4       30.00 ± 11%      +0.9       30.44 ±  5%      +1.8       31.39 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     29.53 ± 10%      +0.4       29.98 ± 11%      +0.9       30.42 ±  5%      +1.8       31.37 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     28.71 ± 10%      +0.5       29.19 ± 11%      +0.8       29.52 ±  6%      +1.9       30.56 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      5.37 ±  6%      +0.5        5.86 ±  7%      +0.3        5.63 ±  2%      +0.4        5.79 ±  9%  perf-profile.calltrace.cycles-pp.ret_from_fork
      5.37 ±  6%      +0.5        5.86 ±  7%      +0.3        5.63 ±  2%      +0.4        5.79 ±  9%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
     28.06 ± 10%      +0.5       28.55 ± 12%      +0.8       28.84 ±  6%      +1.8       29.88 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     36.32 ±  8%      +0.6       36.88 ± 10%      +1.7       38.03 ±  5%      +2.5       38.85 ±  6%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     34.56 ±  8%      +0.6       35.13 ± 11%      +1.6       36.15 ±  5%      +2.5       37.06 ±  6%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     39.99 ±  5%      -0.6       39.36 ±  6%      -1.2       38.80 ±  2%      -1.5       38.52 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     39.74 ±  5%      -0.6       39.13 ±  6%      -1.1       38.60 ±  2%      -1.4       38.30 ±  3%  perf-profile.children.cycles-pp.do_syscall_64
      1.83 ± 11%      -0.3        1.54 ± 13%      -0.3        1.50 ±  7%      -0.4        1.46 ± 17%  perf-profile.children.cycles-pp.__irq_exit_rcu
      9.83 ±  9%      -0.2        9.60 ±  6%      -0.5        9.36 ±  3%      -0.3        9.50 ±  2%  perf-profile.children.cycles-pp.__x64_sys_mount
      9.94 ±  9%      -0.2        9.72 ±  7%      -0.5        9.47 ±  3%      -0.3        9.62 ±  2%  perf-profile.children.cycles-pp.mount
      8.95 ±  9%      -0.2        8.75 ±  7%      -0.4        8.57 ±  3%      -0.3        8.62 ±  3%  perf-profile.children.cycles-pp.do_new_mount
      4.08 ±  7%      -0.1        3.94 ±  8%      -0.1        3.99 ±  2%      -0.1        4.00 ±  5%  perf-profile.children.cycles-pp.task_work_run
      4.44 ±  7%      -0.1        4.32 ±  8%      -0.1        4.30 ±  2%      -0.1        4.36 ±  5%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      4.32 ±  5%      -0.1        4.20 ±  6%      -0.2        4.10 ±  4%      -0.3        3.99 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.00 ±  8%      -0.1        2.90 ± 11%      -0.2        2.79 ±  9%      -0.4        2.59 ±  7%  perf-profile.children.cycles-pp.device_set_syspath
      1.50 ± 10%      -0.1        1.40 ±  6%      -0.2        1.34 ±  7%      -0.2        1.29 ± 10%  perf-profile.children.cycles-pp.siphash24_compress
      1.63 ±  9%      -0.1        1.54 ± 13%      -0.1        1.52 ±  5%      -0.2        1.47 ±  8%  perf-profile.children.cycles-pp.__close
      1.34 ±  7%      -0.1        1.24 ± 10%      -0.0        1.30 ±  7%      -0.1        1.27 ±  5%  perf-profile.children.cycles-pp.dput
      4.79 ±  7%      -0.1        4.70 ±  8%      +0.0        4.84 ±  4%      -0.1        4.67 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.72 ±  7%      -0.1        0.63 ±  8%      -0.1        0.67 ±  6%      -0.0        0.72 ±  5%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      5.09 ±  4%      -0.1        5.00 ±  4%      -0.2        4.84 ±  2%      -0.4        4.71 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      3.50 ± 10%      -0.1        3.41 ±  4%      -0.2        3.28 ±  4%      -0.1        3.37 ±  2%  perf-profile.children.cycles-pp.vfs_get_tree
      2.98 ±  6%      -0.1        2.89 ±  8%      -0.1        2.86 ±  3%      -0.1        2.89 ±  3%  perf-profile.children.cycles-pp.user_path_at_empty
      0.77 ±  7%      -0.1        0.69 ±  7%      -0.1        0.72 ±  6%      -0.0        0.77 ±  6%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      0.82 ± 12%      -0.1        0.74 ± 10%      -0.1        0.77 ±  7%      -0.1        0.74 ± 12%  perf-profile.children.cycles-pp.do_readlinkat
      2.78 ± 11%      -0.1        2.70 ± 10%      -0.2        2.58 ± 10%      -0.4        2.42 ± 12%  perf-profile.children.cycles-pp.vfs_read
      0.80 ± 11%      -0.1        0.72 ± 12%      -0.0        0.76 ±  7%      -0.1        0.72 ± 13%  perf-profile.children.cycles-pp.readlinkat
      3.48 ± 10%      -0.1        3.40 ±  5%      -0.2        3.27 ±  4%      -0.1        3.35 ±  2%  perf-profile.children.cycles-pp.vfs_get_super
      4.90 ±  7%      -0.1        4.82 ±  8%      +0.0        4.93 ±  4%      -0.1        4.79 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.91 ± 10%      -0.1        0.84 ±  7%      -0.1        0.85 ±  7%      -0.1        0.86 ±  4%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
      1.95 ±  3%      -0.1        1.87 ±  7%      -0.1        1.86 ±  3%      -0.1        1.81 ±  3%  perf-profile.children.cycles-pp.strncpy_from_user
      0.76 ± 11%      -0.1        0.69 ± 11%      -0.0        0.72 ±  6%      -0.1        0.70 ± 13%  perf-profile.children.cycles-pp.__x64_sys_readlinkat
      2.80 ± 11%      -0.1        2.72 ± 10%      -0.2        2.60 ± 10%      -0.4        2.44 ± 12%  perf-profile.children.cycles-pp.ksys_read
      0.74 ± 11%      -0.1        0.67 ± 13%      -0.0        0.72 ±  8%      -0.0        0.70 ±  6%  perf-profile.children.cycles-pp.do_rmdir
     10.27 ±  8%      -0.1       10.20 ±  6%      -0.1       10.16            -0.0       10.26        perf-profile.children.cycles-pp.umount2
      3.34 ±  9%      -0.1        3.28 ± 11%      -0.2        3.14 ±  9%      -0.4        2.90 ±  7%  perf-profile.children.cycles-pp.sd_device_new_from_syspath
      1.37 ± 11%      -0.1        1.31 ±  6%      -0.1        1.31 ±  7%      -0.1        1.32 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      2.54 ±  4%      -0.1        2.48 ±  7%      -0.0        2.50 ±  3%      -0.1        2.46 ±  4%  perf-profile.children.cycles-pp.getname_flags
      0.86 ± 12%      -0.1        0.79 ±  7%      -0.1        0.76 ±  9%      -0.1        0.79 ± 18%  perf-profile.children.cycles-pp.vsnprintf
      0.96 ±  7%      -0.1        0.90 ± 10%      -0.1        0.89 ±  4%      +0.0        0.96 ±  4%  perf-profile.children.cycles-pp.down_write
      0.23 ± 14%      -0.1        0.16 ± 22%      -0.0        0.20 ± 19%      -0.0        0.18 ± 13%  perf-profile.children.cycles-pp.strchr@plt
      0.74 ± 13%      -0.1        0.68 ± 16%      -0.0        0.72 ±  6%      -0.0        0.71 ±  3%  perf-profile.children.cycles-pp.evict
      2.86 ± 11%      -0.1        2.80 ± 10%      -0.2        2.67 ± 10%      -0.4        2.51 ± 12%  perf-profile.children.cycles-pp.read
      0.32 ± 21%      -0.1        0.25 ± 15%      -0.0        0.27 ± 10%      -0.1        0.24 ± 21%  perf-profile.children.cycles-pp.unit_name_is_valid
      0.48 ± 18%      -0.1        0.42 ± 10%      -0.0        0.43 ±  8%      -0.1        0.40 ±  6%  perf-profile.children.cycles-pp.ida_alloc_range
      0.68 ±  8%      -0.1        0.62 ±  9%      -0.0        0.66 ±  6%      -0.0        0.65 ±  6%  perf-profile.children.cycles-pp.dentry_kill
      2.76 ±  7%      -0.1        2.70 ±  7%      -0.0        2.74 ±  2%      -0.0        2.74 ±  5%  perf-profile.children.cycles-pp.cleanup_mnt
      1.16 ±  9%      -0.1        1.10 ± 10%      -0.1        1.02 ±  9%      -0.1        1.02 ±  7%  perf-profile.children.cycles-pp.__fxstat64
      2.59 ± 11%      -0.1        2.54 ± 10%      -0.2        2.41 ±  9%      -0.3        2.25 ± 12%  perf-profile.children.cycles-pp.seq_read_iter
      1.43 ± 10%      -0.1        1.37 ± 11%      -0.2        1.27 ± 13%      -0.2        1.24 ± 13%  perf-profile.children.cycles-pp.malloc
      3.04 ±  6%      -0.1        2.98 ±  9%      -0.1        2.94 ±  8%      -0.2        2.84 ±  6%  perf-profile.children.cycles-pp.path_lookupat
      0.40 ± 11%      -0.1        0.35 ±  9%      -0.0        0.36 ±  6%      -0.0        0.38 ± 10%  perf-profile.children.cycles-pp.d_make_root
      2.74 ± 10%      -0.1        2.69 ±  8%      -0.1        2.68 ±  2%      -0.0        2.71 ±  4%  perf-profile.children.cycles-pp.propagate_one
      2.68 ± 10%      -0.1        2.62 ±  8%      -0.0        2.63 ±  3%      -0.0        2.65 ±  4%  perf-profile.children.cycles-pp.copy_tree
      0.62 ±  8%      -0.1        0.56 ±  8%      -0.0        0.60 ±  5%      -0.0        0.58 ±  8%  perf-profile.children.cycles-pp.__dentry_kill
      0.57 ± 11%      -0.1        0.52 ± 11%      -0.1        0.51 ±  6%      -0.0        0.57 ±  7%  perf-profile.children.cycles-pp.do_lock_mount
      0.81 ± 11%      -0.0        0.76 ± 12%      +0.0        0.81 ±  7%      -0.0        0.78 ±  8%  perf-profile.children.cycles-pp.__x64_sys_rmdir
      0.98 ±  8%      -0.0        0.94 ± 10%      -0.0        0.94 ±  8%      -0.0        0.94 ±  3%  perf-profile.children.cycles-pp.kill_litter_super
      0.65 ± 15%      -0.0        0.60 ±  7%      -0.0        0.62 ± 15%      -0.1        0.58 ±  9%  perf-profile.children.cycles-pp.step_into
      4.77 ±  7%      -0.0        4.72 ±  8%      -0.2        4.57 ±  8%      -0.4        4.36 ±  6%  perf-profile.children.cycles-pp.__x64_sys_openat
      2.66 ± 11%      -0.0        2.61 ±  8%      -0.0        2.61 ±  2%      -0.0        2.63 ±  4%  perf-profile.children.cycles-pp.clone_mnt
      0.71 ± 14%      -0.0        0.67 ±  7%      -0.1        0.64 ±  8%      -0.0        0.66 ± 18%  perf-profile.children.cycles-pp.seq_printf
      0.49 ± 11%      -0.0        0.44 ± 12%      -0.0        0.47 ± 11%      -0.0        0.46 ±  6%  perf-profile.children.cycles-pp.ramfs_fill_super
      0.55 ± 11%      -0.0        0.50 ± 12%      -0.1        0.48 ± 13%      -0.1        0.48 ± 16%  perf-profile.children.cycles-pp.rdrand
      0.85 ±  8%      -0.0        0.80 ± 12%      -0.1        0.79 ±  7%      -0.0        0.84 ±  8%  perf-profile.children.cycles-pp.__fput
      0.96 ± 10%      -0.0        0.91 ±  6%      -0.0        0.93 ±  8%      -0.1        0.88 ±  2%  perf-profile.children.cycles-pp.alloc_inode
      4.74 ±  6%      -0.0        4.69 ±  8%      -0.2        4.53 ±  8%      -0.4        4.33 ±  6%  perf-profile.children.cycles-pp.do_sys_openat2
      0.65 ±  9%      -0.0        0.60 ±  8%      -0.0        0.64 ±  8%      -0.0        0.62 ±  3%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      2.00 ± 13%      -0.0        1.96 ± 10%      -0.1        1.86 ±  9%      -0.3        1.72 ± 13%  perf-profile.children.cycles-pp.show_mountinfo
      0.48 ± 13%      -0.0        0.44 ± 17%      -0.1        0.40 ± 12%      -0.1        0.41 ± 10%  perf-profile.children.cycles-pp.vfs_fstat
      0.88 ± 11%      -0.0        0.84 ± 10%      +0.0        0.89 ±  6%      -0.0        0.85 ±  8%  perf-profile.children.cycles-pp.rmdir
      0.34 ± 10%      -0.0        0.30 ± 21%      -0.0        0.32 ± 13%      -0.0        0.30 ± 15%  perf-profile.children.cycles-pp.vfs_readlink
      0.64 ± 11%      -0.0        0.60 ±  7%      -0.0        0.63 ±  9%      -0.0        0.61 ± 15%  perf-profile.children.cycles-pp.pcpu_alloc_area
      3.47 ±  9%      -0.0        3.43 ±  6%      -0.1        3.38 ±  3%      -0.0        3.44 ±  4%  perf-profile.children.cycles-pp.pcpu_alloc
      0.76 ±  9%      -0.0        0.72 ± 14%      -0.1        0.67 ±  7%      -0.1        0.67 ± 11%  perf-profile.children.cycles-pp.__do_sys_newfstat
      1.57 ±  9%      -0.0        1.53 ±  6%      -0.1        1.48 ±  7%      -0.0        1.52 ±  3%  perf-profile.children.cycles-pp._find_next_bit
      0.60 ± 10%      -0.0        0.56 ±  9%      -0.0        0.56 ± 15%      -0.1        0.49 ± 19%  perf-profile.children.cycles-pp.strcmp@plt
      0.86 ±  8%      -0.0        0.83 ±  9%      -0.0        0.83 ±  7%      -0.1        0.81 ±  6%  perf-profile.children.cycles-pp.__check_object_size
      0.35 ±  9%      -0.0        0.31 ± 12%      -0.0        0.32 ±  5%      -0.0        0.34 ±  5%  perf-profile.children.cycles-pp.__check_heap_object
      2.34 ±  6%      -0.0        2.30 ±  8%      -0.1        2.28 ±  7%      -0.1        2.26 ±  4%  perf-profile.children.cycles-pp.filename_lookup
      0.96 ± 14%      -0.0        0.92 ± 10%      -0.0        0.93 ±  2%      -0.0        0.96 ±  5%  perf-profile.children.cycles-pp.propagate_mount_busy
      0.68 ±  3%      -0.0        0.65 ±  9%      +0.0        0.69 ±  8%      +0.0        0.70 ±  4%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.25 ±  6%      -0.0        0.22 ± 12%      -0.0        0.23 ± 17%      -0.0        0.23 ± 12%  perf-profile.children.cycles-pp.___sys_sendmsg
      0.20 ± 15%      -0.0        0.16 ± 10%      +0.0        0.22 ± 18%      -0.0        0.18 ± 12%  perf-profile.children.cycles-pp.update_rq_clock_task
      2.92 ± 11%      -0.0        2.89 ±  8%      -0.1        2.87 ±  2%      -0.1        2.85 ±  5%  perf-profile.children.cycles-pp.alloc_vfsmnt
      0.26 ±  6%      -0.0        0.22 ± 12%      -0.0        0.24 ± 14%      -0.0        0.24 ± 12%  perf-profile.children.cycles-pp.__sys_sendmsg
      0.23 ± 23%      -0.0        0.20 ± 21%      -0.0        0.19 ± 15%      -0.0        0.22 ± 13%  perf-profile.children.cycles-pp._copy_from_user
      0.66 ± 10%      -0.0        0.62 ± 10%      -0.0        0.62 ±  9%      +0.0        0.67 ±  5%  perf-profile.children.cycles-pp.__d_alloc
      0.16 ± 17%      -0.0        0.12 ± 22%      -0.0        0.14 ± 24%      -0.0        0.12 ± 16%  perf-profile.children.cycles-pp.kernfs_iop_getattr
      0.29 ± 11%      -0.0        0.25 ± 19%      +0.0        0.31 ± 13%      +0.0        0.29 ± 11%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.93 ± 11%      -0.0        0.90 ±  4%      -0.1        0.87 ±  4%      -0.1        0.86 ±  2%  perf-profile.children.cycles-pp.shmem_fill_super
      0.24 ± 12%      -0.0        0.20 ± 22%      -0.0        0.23 ± 13%      -0.0        0.22 ± 14%  perf-profile.children.cycles-pp.kernfs_iop_get_link
      0.20 ± 33%      -0.0        0.17 ± 14%      -0.0        0.20 ± 19%      -0.0        0.19 ± 21%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.05 ± 46%      -0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.04 ± 45%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.93 ±  7%      -0.0        0.90 ± 10%      -0.0        0.91 ±  8%      -0.0        0.89 ±  4%  perf-profile.children.cycles-pp.generic_shutdown_super
      3.23 ± 10%      -0.0        3.20 ±  8%      -0.0        3.22 ±  3%      -0.0        3.18 ±  4%  perf-profile.children.cycles-pp.attach_recursive_mnt
      0.04 ± 72%      -0.0        0.01 ±223%      -0.0        0.03 ±102%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.inode_maybe_inc_iversion
      0.12 ± 14%      -0.0        0.09 ± 18%      -0.0        0.08 ± 17%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.xas_descend
      0.06 ± 18%      -0.0        0.03 ±102%      -0.0        0.06 ± 48%      -0.0        0.05 ± 49%  perf-profile.children.cycles-pp.vscnprintf
      0.31 ± 12%      -0.0        0.28 ± 13%      -0.0        0.28 ± 10%      -0.0        0.30 ± 15%  perf-profile.children.cycles-pp.epoll_wait
      0.22 ± 17%      -0.0        0.19 ± 11%      -0.0        0.20 ± 20%      -0.0        0.18 ±  9%  perf-profile.children.cycles-pp.__virt_addr_valid
      1.12 ± 12%      -0.0        1.09 ±  5%      -0.0        1.08 ±  9%      -0.1        1.04 ±  2%  perf-profile.children.cycles-pp.new_inode
      0.18 ±  9%      -0.0        0.15 ± 11%      -0.0        0.16 ± 13%      -0.0        0.15 ± 11%  perf-profile.children.cycles-pp.apparmor_capable
      0.57 ±  9%      -0.0        0.54 ± 12%      +0.0        0.57 ±  6%      -0.0        0.56 ± 11%  perf-profile.children.cycles-pp.__call_rcu_common
      2.82 ± 10%      -0.0        2.80 ±  9%      -0.1        2.76 ±  3%      -0.0        2.78 ±  4%  perf-profile.children.cycles-pp.propagate_mnt
      0.23 ±  7%      -0.0        0.20 ± 12%      -0.0        0.21 ± 15%      -0.0        0.21 ± 13%  perf-profile.children.cycles-pp.sock_sendmsg
      0.13 ± 16%      -0.0        0.10 ±  4%      -0.0        0.10 ± 18%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.generic_exec_single
      0.31 ± 10%      -0.0        0.28 ± 11%      -0.0        0.26 ± 14%      -0.0        0.28 ± 18%  perf-profile.children.cycles-pp.format_decode
      0.19 ± 15%      -0.0        0.16 ± 15%      -0.0        0.18 ± 11%      -0.0        0.19 ± 14%  perf-profile.children.cycles-pp.xas_create
      0.28 ± 12%      -0.0        0.25 ± 14%      -0.0        0.28 ± 14%      -0.1        0.22 ± 11%  perf-profile.children.cycles-pp.strlen
      0.50 ± 12%      -0.0        0.48 ± 15%      +0.0        0.53 ± 10%      -0.0        0.49 ±  8%  perf-profile.children.cycles-pp.schedule_idle
      0.08 ± 26%      -0.0        0.05 ± 74%      -0.0        0.07 ± 23%      -0.0        0.07 ± 19%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.56 ± 11%      -0.0        0.53 ± 13%      -0.0        0.52 ± 12%      -0.1        0.48 ± 12%  perf-profile.children.cycles-pp.device_read_db_internal_filename
      0.12 ± 18%      -0.0        0.10 ± 17%      -0.0        0.11 ± 13%      -0.0        0.12 ± 13%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.06 ± 47%      -0.0        0.03 ±100%      -0.0        0.03 ±100%      -0.0        0.03 ±108%  perf-profile.children.cycles-pp.btrfs_show_options
      1.05 ±  9%      -0.0        1.02 ± 10%      +0.0        1.05 ±  4%      -0.1        0.98 ±  5%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      1.42 ± 17%      -0.0        1.40 ±  5%      +0.1        1.50 ± 12%      +0.1        1.56 ±  6%  perf-profile.children.cycles-pp.newidle_balance
      0.27 ±  8%      -0.0        0.25 ±  9%      -0.0        0.26 ±  7%      -0.0        0.26 ± 12%  perf-profile.children.cycles-pp.update_blocked_averages
      0.26 ± 11%      -0.0        0.24 ± 18%      -0.0        0.24 ± 10%      -0.0        0.26 ± 19%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      0.24 ± 13%      -0.0        0.21 ± 18%      -0.0        0.22 ± 12%      -0.0        0.24 ± 18%  perf-profile.children.cycles-pp.ep_poll
      0.04 ± 75%      -0.0        0.02 ±142%      +0.0        0.06 ± 13%      +0.0        0.05 ± 49%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.04 ± 72%      -0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.get_partial_node
      0.08 ± 22%      -0.0        0.05 ± 49%      -0.0        0.05 ± 47%      -0.0        0.04 ± 75%  perf-profile.children.cycles-pp.mnt_fstype_is_pseudofs
      0.13 ± 21%      -0.0        0.11 ±  8%      -0.0        0.12 ± 18%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.mutex_unlock
      0.12 ± 18%      -0.0        0.10 ± 17%      -0.0        0.10 ± 22%      -0.0        0.10 ±  9%  perf-profile.children.cycles-pp.string_hash_func
      0.23 ±  7%      -0.0        0.21 ± 12%      -0.0        0.22 ± 16%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.____sys_sendmsg
      0.16 ± 14%      -0.0        0.14 ± 11%      -0.0        0.16 ± 18%      +0.0        0.16 ± 12%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.82 ± 10%      -0.0        0.80 ±  7%      -0.0        0.81 ±  5%      +0.0        0.86 ±  9%  perf-profile.children.cycles-pp.mnt_get_writers
      0.27 ±  5%      -0.0        0.25 ±  7%      -0.0        0.25 ± 12%      +0.0        0.27 ±  6%  perf-profile.children.cycles-pp.smp_call_function_single
      0.19 ± 21%      -0.0        0.17 ± 21%      -0.0        0.18 ± 13%      -0.0        0.18 ±  7%  perf-profile.children.cycles-pp.___sys_recvmsg
      0.10 ± 19%      -0.0        0.07 ± 23%      -0.0        0.08 ± 18%      -0.0        0.08 ± 16%  perf-profile.children.cycles-pp.generic_fillattr
      0.04 ± 72%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.strcmp_ptr
      0.17 ± 23%      -0.0        0.15 ± 22%      -0.0        0.15 ± 13%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.sock_recvmsg
      0.16 ± 25%      -0.0        0.14 ± 23%      -0.0        0.14 ±  8%      -0.0        0.14 ± 12%  perf-profile.children.cycles-pp.unix_stream_read_generic
      0.22 ± 15%      -0.0        0.20 ± 20%      -0.0        0.20 ± 16%      -0.0        0.18 ± 17%  perf-profile.children.cycles-pp.strchr
      0.08 ± 10%      -0.0        0.06 ± 19%      -0.0        0.07 ± 24%      -0.0        0.07 ± 24%  perf-profile.children.cycles-pp.string_table_lookup
      0.20 ± 20%      -0.0        0.18 ± 24%      -0.0        0.19 ± 13%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.__sys_recvmsg
      0.03 ±144%      -0.0        0.01 ±223%      +0.0        0.03 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.13 ± 19%      -0.0        0.11 ± 27%      -0.0        0.10 ± 17%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.__libc_recvmsg
      0.56 ±  6%      -0.0        0.54 ±  4%      -0.0        0.54 ± 10%      -0.0        0.55 ±  7%  perf-profile.children.cycles-pp.ramfs_symlink
      0.48 ± 15%      -0.0        0.46 ± 15%      -0.1        0.42 ± 13%      -0.1        0.41 ± 12%  perf-profile.children.cycles-pp.siphash24_finalize
      0.16 ± 13%      -0.0        0.14 ± 19%      -0.0        0.14 ± 12%      -0.0        0.13 ± 12%  perf-profile.children.cycles-pp.complete
      0.94 ±  5%      -0.0        0.92 ±  7%      +0.0        0.97 ±  5%      -0.0        0.90 ±  9%  perf-profile.children.cycles-pp.__filename_parentat
      0.07 ± 23%      -0.0        0.05 ± 51%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.memcpy@plt
      0.10 ± 22%      -0.0        0.08 ± 17%      -0.0        0.08 ± 34%      -0.0        0.10 ± 16%  perf-profile.children.cycles-pp.percpu_counter_destroy
      0.04 ± 72%      -0.0        0.02 ±142%      -0.0        0.02 ±144%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.timerqueue_add
      0.11 ± 25%      -0.0        0.09 ± 15%      -0.0        0.10 ± 27%      +0.0        0.11 ± 12%  perf-profile.children.cycles-pp.shmem_put_super
      0.06 ± 17%      -0.0        0.04 ± 73%      -0.0        0.06 ± 47%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.update_cfs_group
      0.02 ±144%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.strnlen
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.03 ±102%  perf-profile.children.cycles-pp.wq_worker_running
      0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.03 ±105%  perf-profile.children.cycles-pp.rmqueue
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.16 ± 25%      -0.0        0.14 ± 22%      -0.0        0.14 ±  9%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      0.10 ± 21%      -0.0        0.08 ± 22%      -0.0        0.10 ± 13%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.llist_add_batch
      0.25 ± 11%      -0.0        0.23 ± 16%      -0.0        0.23 ± 11%      -0.0        0.24 ± 18%  perf-profile.children.cycles-pp.do_epoll_wait
      0.42 ± 15%      -0.0        0.40 ±  6%      -0.1        0.36 ± 12%      -0.1        0.36 ± 11%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.26 ± 13%      -0.0        0.24 ± 17%      -0.0        0.25 ±  9%      -0.0        0.23 ± 11%  perf-profile.children.cycles-pp.__x64_sys_close
      0.17 ± 25%      -0.0        0.16 ± 21%      -0.0        0.16 ± 15%      -0.0        0.16 ±  7%  perf-profile.children.cycles-pp.____sys_recvmsg
      0.22 ±  7%      -0.0        0.20 ± 13%      -0.0        0.21 ± 14%      -0.0        0.20 ± 13%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.09 ± 22%      -0.0        0.07 ± 18%      -0.0        0.08 ± 23%      -0.0        0.08 ± 25%  perf-profile.children.cycles-pp.shmem_file_read_iter
      0.18 ± 19%      -0.0        0.16 ± 16%      -0.0        0.17 ±  7%      -0.0        0.17 ± 14%  perf-profile.children.cycles-pp.__folio_batch_release
      0.17 ± 12%      -0.0        0.15 ± 14%      +0.0        0.17 ±  7%      +0.0        0.18 ± 12%  perf-profile.children.cycles-pp.simple_lookup
      0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.02 ± 99%      -0.0        0.03 ±101%  perf-profile.children.cycles-pp.device_get_id_filename
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.rb_insert_color
      0.02 ±142%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.balance_fair
      0.06 ± 46%      -0.0        0.04 ± 77%      -0.0        0.05 ± 45%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.consume_skb
      0.06 ± 19%      -0.0        0.04 ± 77%      +0.0        0.06 ± 19%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.shmem_undo_range
      0.06 ± 54%      -0.0        0.04 ± 72%      +0.0        0.07 ± 23%      -0.0        0.05 ± 48%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.32 ± 10%      -0.0        0.30 ± 20%      -0.0        0.28 ± 17%      -0.0        0.30 ±  5%  perf-profile.children.cycles-pp.lockref_put_return
      0.12 ± 32%      -0.0        0.10 ± 25%      +0.0        0.12 ± 25%      +0.0        0.13 ± 18%  perf-profile.children.cycles-pp.__libc_sendmsg
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.07 ± 12%      -0.0        0.06 ± 71%      +0.0        0.08 ± 33%      +0.0        0.09 ± 13%  perf-profile.children.cycles-pp.__pthread_mutex_lock
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.xas_find_marked
      0.08 ± 17%      -0.0        0.06 ± 14%      -0.0        0.05 ± 45%      -0.0        0.07 ± 16%  perf-profile.children.cycles-pp.__alloc_skb
      0.06 ± 23%      -0.0        0.04 ± 45%      -0.0        0.04 ± 72%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.14 ± 13%      -0.0        0.13 ± 16%      -0.0        0.12 ± 38%      -0.0        0.11 ±  6%  perf-profile.children.cycles-pp._hashmap_first_key_and_value
      0.32 ± 17%      -0.0        0.30 ± 14%      -0.0        0.30 ±  7%      -0.0        0.28 ± 16%  perf-profile.children.cycles-pp.___slab_alloc
      0.13 ± 18%      -0.0        0.11 ± 20%      -0.0        0.12 ± 15%      -0.0        0.12 ± 14%  perf-profile.children.cycles-pp.memcpy_orig
      0.40 ± 18%      -0.0        0.38 ± 18%      -0.0        0.40 ±  7%      -0.0        0.40 ±  6%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.06 ± 46%      -0.0        0.04 ± 72%      +0.0        0.06 ± 15%      +0.0        0.06 ± 13%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.15 ± 10%      -0.0        0.13 ± 19%      +0.0        0.16 ± 15%      -0.0        0.13 ± 16%  perf-profile.children.cycles-pp.set_root
      0.12 ± 15%      -0.0        0.10 ± 30%      +0.0        0.13 ± 12%      -0.0        0.12 ± 13%  perf-profile.children.cycles-pp.kernfs_get_target_path
      0.04 ± 75%      -0.0        0.02 ± 99%      +0.0        0.06 ± 49%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.unlock_mount
      1.35 ± 11%      -0.0        1.33 ±  6%      -0.1        1.27 ±  6%      -0.1        1.28 ±  7%  perf-profile.children.cycles-pp.mntput_no_expire
      3.11 ± 12%      -0.0        3.09 ±  9%      -0.0        3.07 ±  3%      -0.0        3.08 ±  2%  perf-profile.children.cycles-pp.stress_rndstr
      0.40 ± 12%      -0.0        0.39 ±  9%      -0.0        0.38 ± 10%      -0.0        0.37 ±  6%  perf-profile.children.cycles-pp.shmem_alloc_inode
      0.13 ± 23%      -0.0        0.12 ±  9%      -0.0        0.12 ± 19%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.__destroy_inode
      0.77 ±  7%      -0.0        0.75 ±  6%      -0.1        0.69 ± 12%      +0.0        0.80 ±  4%  perf-profile.children.cycles-pp.lookup_open
      0.21 ±  8%      -0.0        0.20 ± 16%      -0.1        0.14 ± 19%      -0.0        0.17 ± 14%  perf-profile.children.cycles-pp.security_inode_getattr
      0.30 ±  6%      -0.0        0.28 ± 12%      -0.0        0.26 ± 23%      -0.0        0.27 ± 11%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.14 ± 21%      -0.0        0.12 ±  8%      -0.0        0.13 ± 20%      -0.0        0.11 ± 14%  perf-profile.children.cycles-pp.destroy_inode
      0.10 ± 15%      -0.0        0.08 ± 45%      -0.0        0.09 ± 25%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp._hashmap_iterate
      0.15 ± 18%      -0.0        0.14 ± 24%      +0.0        0.16 ± 17%      +0.0        0.15 ± 11%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.06 ± 14%      -0.0        0.05 ± 52%      -0.0        0.06 ± 50%      -0.0        0.06 ± 17%  perf-profile.children.cycles-pp.sysfs_emit_at
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.malloc@plt
      0.10 ± 34%      -0.0        0.08 ± 11%      -0.0        0.08 ± 26%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.set_anon_super_fc
      0.06 ± 51%      -0.0        0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.deactivate_super
      0.08 ± 17%      -0.0        0.06 ± 47%      -0.0        0.06 ± 50%      -0.0        0.08 ± 21%  perf-profile.children.cycles-pp.ep_send_events
      0.06 ± 11%      -0.0        0.05 ± 77%      -0.0        0.05 ± 75%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.resched_curr
      0.12 ± 21%      -0.0        0.11 ± 13%      -0.0        0.12 ± 21%      +0.0        0.13 ± 19%  perf-profile.children.cycles-pp.iput
      0.04 ±104%      -0.0        0.02 ±144%      -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.06 ± 14%      -0.0        0.05 ± 72%      -0.0        0.02 ±142%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08 ± 17%      -0.0        0.07 ± 13%      -0.0        0.06 ± 45%      -0.0        0.08 ± 18%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.15 ± 12%      -0.0        0.14 ± 16%      -0.0        0.14 ± 13%      +0.0        0.16 ± 19%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.13 ± 10%      -0.0        0.11 ± 14%      +0.0        0.13 ± 10%      -0.0        0.12 ± 10%  perf-profile.children.cycles-pp.shmem_evict_inode
      0.28 ± 18%      -0.0        0.26 ± 10%      +0.0        0.28 ±  3%      -0.0        0.24 ± 11%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.94 ±  6%      -0.0        0.93 ±  6%      -0.1        0.86 ± 10%      +0.0        0.95 ±  4%  perf-profile.children.cycles-pp.open_last_lookups
      0.14 ± 28%      -0.0        0.12 ± 11%      -0.0        0.13 ± 20%      -0.0        0.13 ± 12%  perf-profile.children.cycles-pp.idle_cpu
      0.12 ± 16%      -0.0        0.10 ± 15%      +0.0        0.12 ± 10%      -0.0        0.09 ± 17%  perf-profile.children.cycles-pp.__srcu_read_lock
      0.24 ± 19%      -0.0        0.23 ± 15%      -0.1        0.19 ± 15%      -0.0        0.22 ± 11%  perf-profile.children.cycles-pp.vfs_parse_fs_param
      0.11 ± 18%      -0.0        0.09 ± 13%      -0.0        0.08 ± 17%      -0.0        0.08 ± 19%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.13 ± 26%      -0.0        0.11 ± 20%      -0.0        0.12 ± 13%      -0.0        0.11 ± 27%  perf-profile.children.cycles-pp.mutex_lock_killable
      0.07 ± 53%      -0.0        0.06 ± 50%      +0.0        0.08 ± 18%      +0.0        0.09 ± 25%  perf-profile.children.cycles-pp.propagation_next
      0.02 ±146%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ramfs_parse_param
      0.12 ± 20%      -0.0        0.11 ± 15%      -0.0        0.12 ± 10%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.release_pages
      0.25 ± 14%      -0.0        0.24 ± 15%      -0.0        0.24 ±  9%      -0.0        0.22 ±  8%  perf-profile.children.cycles-pp.__legitimize_mnt
      0.29 ± 13%      -0.0        0.28 ± 14%      +0.0        0.30 ± 11%      -0.0        0.29 ±  7%  perf-profile.children.cycles-pp.shrink_dcache_for_umount
      0.58 ± 12%      -0.0        0.57 ±  5%      +0.0        0.60 ±  7%      -0.0        0.57 ±  8%  perf-profile.children.cycles-pp.ramfs_get_inode
      1.14 ±  8%      -0.0        1.13 ±  9%      -0.0        1.13 ±  8%      -0.1        1.07 ±  8%  perf-profile.children.cycles-pp.walk_component
      2.16 ±  8%      -0.0        2.15 ± 10%      -0.1        2.06 ± 10%      -0.3        1.91 ±  8%  perf-profile.children.cycles-pp.openat64
      3.90 ±  7%      -0.0        3.88 ±  9%      -0.2        3.73 ±  8%      -0.4        3.54 ±  5%  perf-profile.children.cycles-pp.path_openat
      1.42 ± 10%      -0.0        1.41 ±  4%      -0.1        1.36 ±  6%      +0.0        1.44 ±  5%  perf-profile.children.cycles-pp.__percpu_init_rwsem
      0.14 ± 14%      -0.0        0.12 ± 22%      -0.0        0.13 ± 15%      -0.0        0.13 ± 24%  perf-profile.children.cycles-pp.security_file_free
      0.13 ± 17%      -0.0        0.12 ± 13%      -0.0        0.13 ± 11%      +0.0        0.14 ± 17%  perf-profile.children.cycles-pp.__d_add
      0.24 ± 11%      -0.0        0.23 ± 15%      -0.0        0.24 ± 15%      -0.0        0.20 ± 12%  perf-profile.children.cycles-pp.ns_capable
      0.21 ± 11%      -0.0        0.20 ± 20%      +0.0        0.21 ±  9%      +0.0        0.22 ±  9%  perf-profile.children.cycles-pp.ida_free
      0.07 ± 20%      -0.0        0.06 ± 23%      -0.0        0.04 ± 72%      -0.0        0.04 ± 45%  perf-profile.children.cycles-pp.__mnt_want_write
      0.09 ± 19%      -0.0        0.08 ± 26%      -0.0        0.07 ± 14%      -0.0        0.05 ± 49%  perf-profile.children.cycles-pp.put_fs_context
      0.03 ±102%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.check_stack_object
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.mnt_table_next_fs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.connect
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.uncharge_batch
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.memparse
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.m_next
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.legitimize_links
      0.02 ±144%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp.pcpu_chunk_relocate
      0.02 ±144%      -0.0        0.01 ±223%      +0.0        0.04 ± 73%      +0.0        0.04 ± 73%  perf-profile.children.cycles-pp.call_cpuidle
      0.03 ±100%      -0.0        0.02 ±141%      -0.0        0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.trigger_load_balance
      0.07 ± 18%      -0.0        0.06 ± 17%      -0.0        0.05 ± 47%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.07 ± 16%      -0.0        0.06 ± 46%      -0.0        0.05 ± 77%      -0.0        0.05 ± 45%  perf-profile.children.cycles-pp.readlink_copy
      0.03 ±142%      -0.0        0.02 ±223%      +0.0        0.04 ±144%      +0.0        0.04 ±143%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.28 ±  8%      -0.0        0.27 ± 14%      -0.0        0.24 ± 20%      -0.0        0.26 ± 14%  perf-profile.children.cycles-pp.uevent_show
      0.21 ± 19%      -0.0        0.20 ± 21%      -0.0        0.19 ± 11%      -0.0        0.18 ± 13%  perf-profile.children.cycles-pp.show_type
      0.20 ± 13%      -0.0        0.19 ± 13%      -0.0        0.18 ±  9%      +0.0        0.20 ±  9%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.14 ± 18%      -0.0        0.13 ± 11%      -0.0        0.13 ± 17%      -0.0        0.14 ± 25%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.10 ± 15%      -0.0        0.09 ± 22%      -0.0        0.10 ±  5%      -0.0        0.07 ± 24%  perf-profile.children.cycles-pp.path_equal
      0.18 ± 12%      -0.0        0.17 ± 18%      -0.0        0.18 ±  5%      -0.0        0.16 ±  9%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.15 ± 16%      -0.0        0.14 ± 21%      +0.0        0.17 ± 23%      -0.0        0.13 ± 15%  perf-profile.children.cycles-pp.terminate_walk
      0.38 ±  7%      -0.0        0.37 ± 11%      -0.0        0.34 ±  7%      -0.0        0.38 ±  9%  perf-profile.children.cycles-pp.shmem_mknod
      3.97 ±  7%      -0.0        3.96 ±  9%      -0.2        3.81 ±  8%      -0.4        3.61 ±  5%  perf-profile.children.cycles-pp.do_filp_open
      0.13 ± 14%      -0.0        0.12 ± 20%      -0.1        0.08 ± 14%      -0.0        0.10 ± 22%  perf-profile.children.cycles-pp.common_perm_cond
      0.34 ± 16%      -0.0        0.34 ± 13%      -0.1        0.27 ± 16%      -0.0        0.31 ± 11%  perf-profile.children.cycles-pp.vfs_parse_fs_string
      0.18 ± 25%      -0.0        0.16 ± 17%      -0.0        0.13 ± 22%      -0.0        0.14 ± 23%  perf-profile.children.cycles-pp.sendmsg
      0.28 ±  9%      -0.0        0.27 ± 13%      -0.0        0.25 ± 22%      -0.0        0.26 ± 13%  perf-profile.children.cycles-pp.dev_attr_show
      0.14 ± 18%      -0.0        0.13 ± 16%      -0.0        0.11 ± 20%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.seq_puts
      0.14 ± 25%      -0.0        0.13 ± 16%      -0.0        0.12 ± 12%      -0.0        0.12 ± 24%  perf-profile.children.cycles-pp.alloc_fd
      0.20 ± 12%      -0.0        0.20 ± 18%      -0.0        0.19 ± 16%      -0.0        0.18 ± 10%  perf-profile.children.cycles-pp.__kmalloc
      0.08 ± 27%      -0.0        0.07 ± 30%      -0.0        0.06 ± 55%      -0.0        0.07 ± 20%  perf-profile.children.cycles-pp.free@plt
      0.08 ± 17%      -0.0        0.07 ± 28%      -0.0        0.07 ± 10%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.30 ± 13%      -0.0        0.28 ± 17%      -0.0        0.29 ±  9%      -0.0        0.25 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.39 ±  7%      -0.0        0.38 ±  9%      -0.0        0.38 ±  6%      -0.0        0.36 ± 10%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.27 ± 10%      -0.0        0.26 ±  5%      -0.0        0.27 ± 12%      +0.0        0.28 ± 19%  perf-profile.children.cycles-pp.__switch_to_asm
      0.18 ±  8%      -0.0        0.17 ± 15%      -0.0        0.18 ± 14%      -0.0        0.17 ± 16%  perf-profile.children.cycles-pp.nd_jump_root
      0.10 ± 17%      -0.0        0.08 ± 17%      +0.0        0.10 ± 30%      -0.0        0.09 ± 18%  perf-profile.children.cycles-pp._atomic_dec_and_lock
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 21%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.irq_work_run_list
      0.84 ±  6%      -0.0        0.83 ±  7%      +0.0        0.89 ±  3%      -0.0        0.82 ±  9%  perf-profile.children.cycles-pp.path_parentat
      0.06 ± 21%      -0.0        0.06 ± 50%      -0.0        0.03 ±105%      -0.0        0.06 ± 56%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.03 ±100%      -0.0        0.02 ±141%      -0.0        0.02 ±144%      -0.0        0.00        perf-profile.children.cycles-pp.fsnotify_sb_delete
      0.07 ± 18%      -0.0        0.06 ± 49%      -0.0        0.07 ± 28%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.pcpu_next_fit_region
      0.04 ± 73%      -0.0        0.03 ±101%      -0.0        0.04 ± 71%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.simple_acl_create
      0.04 ± 79%      -0.0        0.03 ±101%      +0.0        0.04 ± 75%      +0.0        0.05 ± 47%  perf-profile.children.cycles-pp.perf_pmu_nop_void
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._hashmap_size
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.02 ±141%  perf-profile.children.cycles-pp.unit_name_escape
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.putname
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.mntput
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_connect
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__sys_connect
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_path_rmdir
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_stream_connect
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.kmalloc_reserve
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.security_path_rmdir
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.drop_nlink
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.error_entry
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.sched_use_asym_prio
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.04 ± 71%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.radix_tree_delete_item
      0.04 ± 73%      -0.0        0.03 ±100%      -0.0        0.04 ± 72%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.07 ± 14%      -0.0        0.06 ± 46%      +0.0        0.07 ± 13%      -0.0        0.06 ± 14%  perf-profile.children.cycles-pp.inode_init_once
      0.16 ± 17%      -0.0        0.15 ± 19%      -0.0        0.15 ± 15%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.filp_close
      0.25 ±  9%      -0.0        0.24 ± 15%      -0.0        0.22 ± 15%      -0.0        0.24 ± 11%  perf-profile.children.cycles-pp.pagecache_get_page
      0.34 ± 16%      -0.0        0.33 ± 15%      +0.0        0.34 ± 14%      +0.0        0.35 ±  6%  perf-profile.children.cycles-pp.vfs_rmdir
      2.05 ± 11%      -0.0        2.04 ±  5%      -0.1        1.92 ±  4%      -0.0        2.02 ±  4%  perf-profile.children.cycles-pp.sget_fc
      0.15 ± 11%      -0.0        0.14 ± 25%      -0.0        0.14 ± 14%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.strlen@plt
      0.15 ± 18%      -0.0        0.14 ± 21%      +0.0        0.15 ± 14%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.14 ± 40%      -0.0        0.13 ± 44%      +0.0        0.16 ± 43%      +0.0        0.16 ± 39%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.13 ± 13%      -0.0        0.12 ± 20%      -0.0        0.11 ± 26%      +0.0        0.13 ± 21%  perf-profile.children.cycles-pp.filemap_add_folio
      0.07 ± 15%      -0.0        0.06 ± 13%      -0.0        0.06 ± 11%      +0.0        0.07 ± 17%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.08 ± 13%      -0.0        0.08 ± 30%      -0.0        0.08 ± 22%      +0.0        0.09 ± 22%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.05 ± 77%      -0.0        0.04 ± 72%      -0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.07 ± 29%      -0.0        0.06 ± 49%      -0.0        0.06 ± 45%      -0.0        0.06 ± 50%  perf-profile.children.cycles-pp.m_start
      0.07 ± 18%      -0.0        0.06 ± 73%      -0.0        0.07 ± 15%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.strcspn@plt
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.__mod_timer
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.native_apic_mem_write
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__snprintf_chk
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.set_strjoin
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.charge_memcg
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.seq_release_private
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.delete_trailing_chars
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.siphash24_init@plt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.put_prev_task_fair
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.refill_stock
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.copy_page_to_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.proc_root_getattr
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.simple_strntoull
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.d_same_name
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dput_to_list
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._hashmap_get
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.locks_remove_posix
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.handle_mm_fault
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.note_gp_changes
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.03 ± 70%  perf-profile.children.cycles-pp.ep_item_poll
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±146%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±146%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.01 ±223%      -0.0        0.00            +0.0        0.03 ±102%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.filemap_get_entry
      0.01 ±223%      -0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__d_rehash
      0.09 ±  5%      -0.0        0.08 ± 26%      -0.0        0.06 ± 46%      -0.0        0.07 ± 16%  perf-profile.children.cycles-pp.mnt_want_write
      0.08 ± 29%      -0.0        0.08 ± 23%      -0.0        0.06 ± 54%      +0.0        0.09 ± 19%  perf-profile.children.cycles-pp.d_instantiate
      0.05 ± 74%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%      +0.0        0.06 ± 16%  perf-profile.children.cycles-pp.sync_regs
      0.18 ± 14%      -0.0        0.17 ± 13%      +0.0        0.18 ±  7%      -0.0        0.18 ± 13%  perf-profile.children.cycles-pp.up_write
      0.08 ± 17%      -0.0        0.07 ± 20%      +0.0        0.09 ± 24%      -0.0        0.06 ± 21%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.21 ± 34%      -0.0        0.20 ± 29%      +0.0        0.22 ± 29%      +0.0        0.22 ± 36%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.03 ±100%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.get_random_u32
      0.71 ± 10%      -0.0        0.70 ±  6%      -0.0        0.67 ± 10%      -0.1        0.65 ±  3%  perf-profile.children.cycles-pp.shmem_get_inode
      0.86 ± 10%      -0.0        0.85 ±  8%      +0.0        0.86 ±  5%      +0.0        0.88 ±  6%  perf-profile.children.cycles-pp.__x64_sys_mkdir
      2.99 ±  7%      -0.0        2.99 ±  7%      -0.1        2.86 ±  7%      -0.2        2.83 ±  5%  perf-profile.children.cycles-pp.open64
      1.48 ± 20%      -0.0        1.48 ±  8%      +0.1        1.56 ± 13%      +0.2        1.64 ±  7%  perf-profile.children.cycles-pp.clock_nanosleep
      0.43 ± 19%      -0.0        0.42 ± 14%      -0.0        0.40 ±  9%      -0.0        0.40 ±  9%  perf-profile.children.cycles-pp.sync_filesystem
      0.44 ± 10%      -0.0        0.43 ± 12%      -0.0        0.43 ± 11%      +0.0        0.47 ±  5%  perf-profile.children.cycles-pp.xas_store
      0.24 ± 18%      -0.0        0.23 ± 15%      +0.0        0.24 ± 25%      +0.0        0.25 ±  7%  perf-profile.children.cycles-pp.clockevents_program_event
      0.06 ± 47%      -0.0        0.05 ± 46%      -0.0        0.04 ± 73%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__x64_sys_readlink
      0.07 ± 45%      -0.0        0.06 ± 14%      -0.0        0.06 ± 48%      -0.0        0.05 ± 74%  perf-profile.children.cycles-pp.file_free_rcu
      0.05 ± 49%      -0.0        0.04 ± 71%      -0.0        0.04 ± 44%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.path_compare@plt
      0.04 ± 45%      -0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.11 ± 18%      -0.0        0.10 ± 17%      -0.0        0.08 ± 13%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp.get_fs_type
      0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.rb_next
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.irq_work_run
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp._printk
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.vprintk_emit
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.console_unlock
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.console_flush_all
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.05 ± 47%      -0.0        0.04 ± 72%      +0.0        0.06 ± 17%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.irq_work_single
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._IO_feof
      0.18 ± 16%      -0.0        0.17 ± 18%      -0.0        0.14 ± 13%      -0.0        0.15 ± 13%  perf-profile.children.cycles-pp.task_work_add
      0.41 ±  5%      -0.0        0.40 ±  6%      -0.0        0.40 ± 10%      -0.0        0.41 ±  7%  perf-profile.children.cycles-pp.page_symlink
      0.24 ± 10%      -0.0        0.24 ± 13%      -0.0        0.24 ± 15%      -0.0        0.20 ± 12%  perf-profile.children.cycles-pp.security_capable
      0.38 ± 16%      -0.0        0.37 ± 10%      -0.0        0.37 ± 15%      -0.0        0.33 ±  8%  perf-profile.children.cycles-pp.check_heap_object
      0.14 ± 37%      -0.0        0.14 ± 22%      +0.0        0.16 ± 18%      -0.0        0.14 ± 14%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
      0.98 ±  8%      -0.0        0.97 ±  8%      -0.0        0.94 ±  7%      -0.1        0.91 ±  8%  perf-profile.children.cycles-pp.lookup_fast
      0.06 ± 19%      -0.0        0.06 ± 48%      +0.0        0.09 ± 13%      +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.unregister_shrinker
      0.23 ± 18%      -0.0        0.23 ± 16%      -0.0        0.19 ± 16%      -0.0        0.20 ±  9%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.06 ± 19%      -0.0        0.06 ± 50%      -0.0        0.04 ±104%      -0.0        0.06 ± 49%  perf-profile.children.cycles-pp.kernfs_fop_release
      0.08 ± 30%      -0.0        0.08 ± 18%      -0.0        0.05 ± 49%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.__prealloc_shrinker
      0.08 ± 19%      -0.0        0.07 ± 18%      -0.0        0.06 ± 48%      -0.0        0.08 ± 48%  perf-profile.children.cycles-pp.strspn@plt
      0.38 ± 15%      -0.0        0.38 ± 13%      -0.0        0.36 ± 19%      -0.0        0.33 ± 15%  perf-profile.children.cycles-pp.cfree
      0.12 ± 15%      -0.0        0.12 ± 19%      -0.0        0.10 ± 24%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.shmem_parse_options
      0.26 ± 12%      -0.0        0.25 ± 11%      -0.0        0.24 ±  9%      -0.0        0.25 ± 11%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.12 ± 19%      -0.0        0.12 ± 22%      -0.0        0.12 ± 22%      -0.0        0.11 ± 18%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.17 ± 25%      -0.0        0.16 ± 15%      -0.0        0.16 ± 21%      +0.0        0.17 ± 18%  perf-profile.children.cycles-pp.__lookup_mnt
      0.71 ±  6%      -0.0        0.70 ± 13%      -0.0        0.70 ± 10%      -0.0        0.68 ± 12%  perf-profile.children.cycles-pp.path_init
      0.07 ± 14%      -0.0        0.07 ± 23%      -0.0        0.07 ± 20%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.rwsem_wake
      0.09 ± 11%      -0.0        0.09 ± 25%      -0.0        0.09 ± 15%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.__fget_light
      0.11 ± 16%      -0.0        0.10 ± 21%      -0.0        0.11 ± 18%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.apparmor_file_free_security
      0.09 ± 14%      -0.0        0.09 ± 15%      +0.0        0.09 ± 15%      -0.0        0.08 ± 15%  perf-profile.children.cycles-pp.close_fd
      0.09 ±  9%      -0.0        0.08 ± 23%      +0.0        0.09 ± 19%      +0.0        0.09 ± 14%  perf-profile.children.cycles-pp.path_put
      0.23 ± 21%      -0.0        0.22 ± 11%      +0.0        0.23 ±  5%      -0.0        0.20 ± 12%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.14 ± 12%      -0.0        0.13 ±  9%      +0.0        0.15 ± 21%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.read_tsc
      0.09 ± 17%      -0.0        0.08 ± 29%      +0.0        0.11 ± 26%      +0.0        0.09 ± 16%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__traverse_mounts
      0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.try_charge_memcg
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.06 ± 25%      -0.0        0.06 ± 47%      +0.0        0.07 ± 14%      +0.0        0.07 ± 24%  perf-profile.children.cycles-pp.vmalloc_to_page
      0.03 ±101%      -0.0        0.02 ± 99%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.strncmp
      0.08 ± 10%      -0.0        0.08 ± 26%      -0.0        0.06 ± 50%      -0.0        0.05 ± 77%  perf-profile.children.cycles-pp.path_simplify
      0.11 ±  8%      -0.0        0.11 ± 35%      -0.0        0.10 ±  4%      -0.0        0.10 ± 12%  perf-profile.children.cycles-pp.strcmp
      0.08 ± 24%      -0.0        0.08 ± 17%      -0.0        0.08 ± 19%      -0.0        0.08 ± 16%  perf-profile.children.cycles-pp.dentry_unlink_inode
      0.12 ± 15%      -0.0        0.11 ± 15%      +0.0        0.16 ± 13%      +0.0        0.15 ± 21%  perf-profile.children.cycles-pp.alloc_fs_context
      0.34 ±  5%      -0.0        0.34 ± 11%      -0.0        0.32 ± 13%      -0.0        0.33 ±  8%  perf-profile.children.cycles-pp.simple_write_begin
      1.04 ±  8%      -0.0        1.03 ± 10%      -0.1        0.94 ±  6%      -0.0        1.01 ±  5%  perf-profile.children.cycles-pp.kmem_cache_free
      1.06 ± 19%      -0.0        1.06 ±  6%      +0.0        1.07 ± 10%      +0.1        1.16 ±  7%  perf-profile.children.cycles-pp.update_sg_lb_stats
      1.36 ± 19%      -0.0        1.36 ±  9%      +0.1        1.43 ± 13%      +0.2        1.52 ±  7%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.44 ± 13%      -0.0        0.44 ± 11%      +0.0        0.45 ±  7%      -0.0        0.42 ±  6%  perf-profile.children.cycles-pp.__legitimize_path
      0.20 ± 15%      -0.0        0.20 ± 11%      +0.0        0.24 ± 15%      -0.0        0.17 ± 11%  perf-profile.children.cycles-pp.finish_task_switch
      0.08 ± 30%      -0.0        0.08 ± 16%      -0.0        0.05 ± 49%      -0.0        0.08 ± 10%  perf-profile.children.cycles-pp.prealloc_shrinker
      0.08 ± 14%      -0.0        0.07 ± 52%      -0.0        0.06 ± 48%      +0.0        0.09 ± 14%  perf-profile.children.cycles-pp.map_id_up
      0.11 ± 18%      -0.0        0.10 ± 17%      -0.0        0.10 ± 22%      -0.0        0.10 ± 14%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.08 ± 27%      -0.0        0.08 ± 13%      -0.0        0.08 ± 18%      -0.0        0.07 ± 29%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.11 ± 25%      -0.0        0.11 ± 27%      +0.0        0.12 ± 12%      +0.0        0.12 ± 17%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.03 ±103%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.seq_dentry
      0.06 ± 47%      -0.0        0.05 ± 51%      -0.0        0.04 ± 77%      -0.0        0.04 ± 73%  perf-profile.children.cycles-pp.kernfs_fop_open
      0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp.__rw_verify_area
      0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.children.cycles-pp.handle_dots
      0.03 ±102%      -0.0        0.02 ± 99%      +0.0        0.03 ±100%      +0.0        0.04 ± 73%  perf-profile.children.cycles-pp.__unfreeze_partials
      0.16 ±  7%      -0.0        0.16 ± 16%      -0.0        0.14 ± 15%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.xas_load
      0.12 ± 10%      -0.0        0.11 ± 12%      -0.0        0.10 ± 18%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.15 ± 19%      -0.0        0.14 ± 11%      -0.0        0.14 ± 10%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.memdup_user
      0.14 ± 14%      -0.0        0.14 ± 17%      -0.0        0.13 ±  8%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.__strdup
      0.18 ± 28%      -0.0        0.18 ± 23%      -0.0        0.16 ± 18%      -0.0        0.18 ± 15%  perf-profile.children.cycles-pp.copy_mount_options
      0.16 ± 18%      -0.0        0.16 ± 20%      -0.0        0.15 ± 18%      -0.0        0.14 ± 16%  perf-profile.children.cycles-pp.mangle_path
      0.23 ± 23%      -0.0        0.23 ± 15%      +0.0        0.24 ± 16%      -0.0        0.23 ± 12%  perf-profile.children.cycles-pp.pcpu_block_update_hint_alloc
      0.37 ± 10%      -0.0        0.37 ± 14%      +0.0        0.40 ± 10%      +0.0        0.38 ±  9%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      2.69 ±  5%      -0.0        2.69 ±  7%      -0.0        2.67 ±  6%      -0.1        2.59 ±  8%  perf-profile.children.cycles-pp.link_path_walk
      0.82 ±  7%      -0.0        0.82 ±  8%      +0.0        0.82 ±  3%      -0.0        0.79 ±  8%  perf-profile.children.cycles-pp.filename_create
      0.10 ± 28%      -0.0        0.10 ± 15%      +0.0        0.11 ± 19%      -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.xas_alloc
      0.08 ± 26%      -0.0        0.08 ± 25%      -0.0        0.07 ± 17%      -0.0        0.08 ± 15%  perf-profile.children.cycles-pp.d_set_mounted
      0.08 ± 22%      -0.0        0.08 ± 18%      -0.0        0.07 ± 10%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.rcu_nocb_try_bypass
      0.10 ± 24%      -0.0        0.09 ±  7%      +0.0        0.10 ± 17%      -0.0        0.08 ± 33%  perf-profile.children.cycles-pp.shmem_show_options
      0.10 ± 31%      -0.0        0.10 ± 20%      +0.0        0.11 ± 17%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.d_walk
      0.06 ± 51%      -0.0        0.06 ± 11%      -0.0        0.04 ±101%      -0.0        0.06 ± 47%  perf-profile.children.cycles-pp.shmem_free_in_core_inode
      0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.__kmalloc_node
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.lookup_mnt
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.simple_unlink
      0.02 ±144%      -0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.hashmap_get2
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.check_cpu_stall
      0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp._dbus_type_reader_get_current_type
      0.08 ± 19%      -0.0        0.08 ± 27%      -0.0        0.07 ± 19%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.lookup_constant
      0.12 ± 22%      -0.0        0.11 ± 18%      -0.0        0.10 ±  9%      -0.0        0.11 ± 16%  perf-profile.children.cycles-pp.fput
      0.04 ± 71%      -0.0        0.04 ± 71%      -0.0        0.03 ±100%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.09 ± 18%      -0.0        0.09 ± 13%      +0.0        0.09 ± 20%      +0.0        0.09 ± 21%  perf-profile.children.cycles-pp.perf_rotate_context
      0.11 ± 22%      -0.0        0.11 ±  9%      +0.0        0.12 ± 16%      -0.0        0.09 ± 16%  perf-profile.children.cycles-pp.lockref_put_or_lock
      0.11 ±  9%      -0.0        0.11 ± 22%      +0.0        0.11 ±  9%      -0.0        0.10 ± 19%  perf-profile.children.cycles-pp.shuffle_freelist
      0.09 ± 25%      -0.0        0.09 ± 14%      +0.0        0.10 ± 14%      -0.0        0.09 ± 12%  perf-profile.children.cycles-pp.__srcu_read_unlock
      0.10 ± 17%      -0.0        0.10 ± 21%      +0.0        0.12 ± 14%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.__list_add_valid
      0.06 ± 45%      -0.0        0.06 ± 25%      +0.0        0.09 ± 14%      +0.0        0.07 ±  8%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.10 ± 21%      -0.0        0.10 ± 26%      +0.0        0.13 ± 10%      +0.0        0.11 ± 18%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.12 ± 19%      -0.0        0.11 ±  9%      -0.0        0.09 ± 17%      -0.0        0.11 ± 19%  perf-profile.children.cycles-pp.crng_make_state
      0.07 ± 21%      -0.0        0.07 ± 10%      -0.0        0.05 ± 50%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.__d_instantiate
      0.11 ± 16%      -0.0        0.11 ± 22%      -0.0        0.10 ± 25%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.17 ± 22%      -0.0        0.16 ± 12%      +0.0        0.18 ± 12%      +0.0        0.17 ± 10%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.24 ± 13%      -0.0        0.24 ±  8%      -0.0        0.22 ± 14%      +0.0        0.24 ±  8%  perf-profile.children.cycles-pp.__percpu_counter_init
      0.83 ±  8%      -0.0        0.83 ±  4%      -0.0        0.80 ±  7%      -0.0        0.80 ±  6%  perf-profile.children.cycles-pp.vfs_symlink
      1.81 ± 10%      -0.0        1.81 ±  8%      -0.0        1.76 ±  4%      -0.0        1.78 ±  4%  perf-profile.children.cycles-pp.mnt_get_count
      0.04 ± 73%      -0.0        0.04 ± 71%      -0.0        0.02 ± 99%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.object_path_is_valid
      0.41 ± 20%      +0.0        0.41 ± 14%      -0.0        0.38 ± 10%      -0.0        0.39 ± 11%  perf-profile.children.cycles-pp.writeback_inodes_sb
      0.11 ± 16%      +0.0        0.11 ±  8%      -0.0        0.09 ± 17%      -0.0        0.10 ± 23%  perf-profile.children.cycles-pp.crng_fast_key_erasure
      0.29 ± 16%      +0.0        0.29 ± 12%      -0.0        0.27 ± 12%      -0.1        0.24 ± 14%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
      0.06 ± 45%      +0.0        0.06 ± 14%      -0.0        0.04 ± 76%      -0.0        0.03 ±101%  perf-profile.children.cycles-pp.readlink
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.page_counter_uncharge
      0.30 ± 16%      +0.0        0.30 ± 14%      -0.0        0.29 ±  8%      +0.0        0.34 ± 11%  perf-profile.children.cycles-pp.pcpu_free_area
      0.14 ± 21%      +0.0        0.14 ±  9%      -0.0        0.13 ± 16%      -0.0        0.14 ± 16%  perf-profile.children.cycles-pp._get_random_bytes
      0.55 ±  7%      +0.0        0.55 ± 12%      -0.0        0.54 ± 13%      -0.1        0.49 ± 12%  perf-profile.children.cycles-pp.__xstat64
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_stream_read_actor
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__skb_datagram_iter
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_open_container
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.task_tick_fair
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.05 ± 47%      +0.0        0.05 ± 47%      -0.0        0.04 ± 75%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.build_open_flags
      0.13 ± 16%      +0.0        0.13 ± 18%      -0.0        0.12 ± 22%      -0.0        0.12 ±  9%  perf-profile.children.cycles-pp.mutex_lock
      0.09 ± 10%      +0.0        0.09 ± 14%      -0.0        0.08 ± 17%      -0.0        0.08 ± 25%  perf-profile.children.cycles-pp.zero_user_segments
      0.17 ± 10%      +0.0        0.17 ± 14%      -0.0        0.17 ± 12%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp.kfree
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.clear_inode
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_execve
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.do_execveat_common
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.execve
      0.28 ± 15%      +0.0        0.28 ± 20%      +0.0        0.28 ± 14%      -0.0        0.27 ± 14%  perf-profile.children.cycles-pp.kstrdup
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.safe_close
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mnt_cursor_del
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__memcpy
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dentry_path
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.copy_msghdr_from_user
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cgroup_show_path
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.part_uevent
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.siphash24_finalize@plt
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.atime_needs_update
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.read_counters
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.check_spread
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.posix_acl_create
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.i_callback
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.cmd_stat
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dispatch_events
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.process_interval
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.sched_setaffinity
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.invent_group_ids
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.map_id_range_down
      0.15 ± 29%      +0.0        0.15 ± 27%      +0.0        0.15 ± 10%      +0.0        0.15 ± 17%  perf-profile.children.cycles-pp.vfs_getattr_nosec
      0.04 ± 73%      +0.0        0.04 ± 47%      +0.0        0.05 ± 49%      -0.0        0.03 ±101%  perf-profile.children.cycles-pp.__put_mountpoint
      0.49 ±  7%      +0.0        0.49 ± 15%      +0.0        0.50 ± 13%      -0.0        0.44 ± 13%  perf-profile.children.cycles-pp.__do_sys_newstat
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.siphash24_compress@plt
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dbus_message_get_interface
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.clear_buddies
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.unit_name_from_path
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.seq_release
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._ordered_hashmap_ensure_allocated
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._IO_setb
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.mnt_fs_strdup_options
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._dbus_type_reader_next
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__bitmap_set
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.free_unref_page_list
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.proc_self_get_link
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.touch_atime
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.reweight_entity
      0.33 ± 12%      +0.0        0.33 ± 14%      +0.0        0.34 ± 11%      +0.0        0.33 ± 12%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.76 ± 12%      +0.0        0.76 ±  7%      +0.0        0.78 ±  4%      +0.0        0.79 ±  6%  perf-profile.children.cycles-pp.do_mkdirat
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.serial8250_console_write
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.uart_console_write
      0.09 ± 14%      +0.0        0.09 ± 14%      +0.0        0.10 ± 18%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp.rcu_exp_handler
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.04 ± 71%      +0.0        0.05 ± 48%  perf-profile.children.cycles-pp.main
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.04 ± 71%      +0.0        0.05 ± 48%  perf-profile.children.cycles-pp.run_builtin
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.04 ± 71%      +0.0        0.05 ± 48%  perf-profile.children.cycles-pp.__libc_start_main
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.04 ± 72%      -0.0        0.00        perf-profile.children.cycles-pp.___d_drop
      0.11 ± 20%      +0.0        0.11 ± 24%      +0.0        0.13 ± 12%      +0.0        0.12 ± 18%  perf-profile.children.cycles-pp.ct_idle_exit
      0.26 ± 16%      +0.0        0.26 ± 16%      +0.0        0.29 ± 10%      +0.0        0.27 ± 12%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.38 ± 13%      +0.0        0.38 ± 13%      +0.1        0.45 ± 11%      +0.0        0.41 ±  8%  perf-profile.children.cycles-pp.__wake_up_common
      0.64 ±  8%      +0.0        0.64 ± 13%      +0.1        0.73 ± 12%      +0.0        0.68 ±  4%  perf-profile.children.cycles-pp.activate_task
      0.07 ± 21%      +0.0        0.07 ± 32%      +0.0        0.08 ± 50%      +0.0        0.07 ± 20%  perf-profile.children.cycles-pp.__lookup_slow
      0.70 ± 14%      +0.0        0.70 ±  6%      -0.0        0.66 ±  6%      -0.0        0.69 ±  6%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.14 ±  7%      +0.0        0.14 ± 11%      -0.0        0.12 ± 22%      -0.0        0.14 ± 26%  perf-profile.children.cycles-pp.dev_uevent
      0.16 ± 13%      +0.0        0.17 ± 12%      +0.0        0.17 ± 26%      -0.0        0.15 ± 20%  perf-profile.children.cycles-pp._copy_to_user
      0.08 ± 20%      +0.0        0.08 ± 14%      -0.0        0.05 ± 46%      -0.0        0.07 ± 11%  perf-profile.children.cycles-pp.__get_fs_type
      0.08 ± 26%      +0.0        0.08 ± 12%      -0.0        0.07 ± 28%      -0.0        0.07 ± 11%  perf-profile.children.cycles-pp.security_file_open
      0.03 ±102%      +0.0        0.03 ±101%      +0.0        0.04 ± 72%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.04 ± 72%      +0.0        0.04 ± 72%      +0.0        0.05 ± 46%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.cpuacct_charge
      0.04 ± 72%      +0.0        0.04 ± 73%      +0.0        0.05 ± 46%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp._copy_to_iter
      0.05 ± 74%      +0.0        0.05 ± 48%      +0.0        0.07 ± 55%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.shrink_dcache_parent
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_poll_gp_seq_start_unlocked
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.03 ±100%  perf-profile.children.cycles-pp.simple_write_end
      0.04 ± 77%      +0.0        0.04 ± 72%      -0.0        0.02 ±142%      +0.0        0.06 ± 50%  perf-profile.children.cycles-pp.__fs_parse
      0.04 ± 77%      +0.0        0.04 ± 45%      +0.0        0.05 ± 45%      +0.0        0.05 ± 73%  perf-profile.children.cycles-pp.getdelim
      0.08 ± 17%      +0.0        0.08 ± 24%      +0.0        0.08 ± 14%      -0.0        0.07 ± 18%  perf-profile.children.cycles-pp.llist_reverse_order
      0.07 ± 47%      +0.0        0.07 ± 48%      +0.0        0.08 ± 10%      +0.0        0.08 ± 22%  perf-profile.children.cycles-pp.chase_symlinks
      0.14 ± 19%      +0.0        0.15 ± 13%      +0.0        0.17 ± 14%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.40 ± 22%      +0.0        0.40 ± 15%      -0.0        0.37 ±  9%      -0.0        0.38 ± 12%  perf-profile.children.cycles-pp.get_nr_dirty_inodes
      0.53 ± 11%      +0.0        0.54 ± 11%      -0.0        0.52 ±  8%      -0.0        0.49 ±  6%  perf-profile.children.cycles-pp.try_to_unlazy
      1.30 ± 19%      +0.0        1.30 ±  8%      +0.0        1.34 ± 13%      +0.1        1.43 ±  6%  perf-profile.children.cycles-pp.do_nanosleep
      1.33 ± 19%      +0.0        1.33 ±  8%      +0.1        1.39 ± 13%      +0.1        1.48 ±  6%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.11 ± 24%      +0.0        0.12 ± 13%      -0.0        0.10 ± 10%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.uuid_gen
      0.11 ± 17%      +0.0        0.12 ± 16%      -0.0        0.11 ± 32%      +0.0        0.13 ± 15%  perf-profile.children.cycles-pp.pcpu_find_block_fit
      0.15 ± 21%      +0.0        0.15 ± 21%      -0.0        0.14 ± 16%      +0.0        0.16 ± 10%  perf-profile.children.cycles-pp.refill_obj_stock
      0.24 ±  9%      +0.0        0.25 ± 13%      -0.0        0.23 ±  8%      +0.0        0.25 ± 18%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.08 ± 17%      +0.0        0.08 ± 17%      -0.0        0.06 ± 47%      -0.0        0.06 ± 14%  perf-profile.children.cycles-pp.path_startswith
      0.06 ±  9%      +0.0        0.06 ± 49%      -0.0        0.05 ± 46%      -0.0        0.05 ± 47%  perf-profile.children.cycles-pp.__bitmap_clear
      0.16 ± 13%      +0.0        0.17 ± 16%      +0.0        0.18 ± 26%      -0.0        0.14 ± 19%  perf-profile.children.cycles-pp.check_preempt_curr
      0.02 ± 99%      +0.0        0.03 ±100%      +0.0        0.05 ± 45%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp._ext4_show_options
      0.03 ±103%      +0.0        0.04 ± 71%      -0.0        0.00            -0.0        0.03 ±100%  perf-profile.children.cycles-pp.idr_alloc_u32
      0.03 ±103%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.idr_alloc
      0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.autofs_show_options
      0.04 ± 77%      +0.0        0.05 ± 50%      +0.0        0.05 ± 47%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.strextend_with_separator
      0.05 ± 71%      +0.0        0.06 ± 45%      +0.0        0.06 ± 11%      +0.0        0.06 ± 52%  perf-profile.children.cycles-pp.unit_file_find_dropin_paths
      0.06 ± 11%      +0.0        0.06 ± 47%      +0.0        0.08 ± 11%      +0.0        0.06 ± 49%  perf-profile.children.cycles-pp.sock_def_readable
      0.12 ± 20%      +0.0        0.13 ± 14%      -0.0        0.09 ± 46%      -0.0        0.10 ± 14%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.05 ± 48%      +0.0        0.05 ± 48%      -0.0        0.04 ± 72%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.strnlen_user
      0.08 ± 21%      +0.0        0.08 ± 14%      -0.0        0.08 ±  7%      +0.0        0.09 ± 17%  perf-profile.children.cycles-pp._find_next_and_bit
      0.09 ± 23%      +0.0        0.09 ± 31%      +0.0        0.10 ± 36%      +0.0        0.09 ± 15%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.12 ± 15%      +0.0        0.13 ± 20%      +0.0        0.14 ± 22%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.propagate_umount
      0.12 ± 27%      +0.0        0.13 ± 29%      +0.1        0.18 ± 24%      +0.0        0.15 ± 25%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.34 ± 17%      +0.0        0.35 ± 19%      -0.0        0.32 ± 17%      -0.1        0.28 ± 13%  perf-profile.children.cycles-pp.seq_path_root
      0.29 ± 17%      +0.0        0.30 ± 15%      +0.0        0.30 ± 13%      -0.0        0.28 ± 13%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.34 ± 10%      +0.0        0.35 ± 10%      +0.0        0.36 ±  7%      -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.__d_lookup
      1.14 ±  7%      +0.0        1.14 ± 10%      +0.0        1.17 ±  7%      -0.0        1.11 ±  7%  perf-profile.children.cycles-pp.vfs_statx
      1.61 ±  7%      +0.0        1.62 ±  9%      -0.0        1.61 ±  5%      -0.0        1.58 ±  5%  perf-profile.children.cycles-pp.deactivate_locked_super
      1.16 ± 18%      +0.0        1.17 ±  6%      +0.0        1.18 ± 10%      +0.1        1.26 ±  8%  perf-profile.children.cycles-pp.update_sd_lb_stats
      1.19 ± 17%      +0.0        1.19 ±  7%      +0.0        1.21 ± 11%      +0.1        1.29 ±  7%  perf-profile.children.cycles-pp.find_busiest_group
      0.80 ±  7%      +0.0        0.81 ±  7%      +0.0        0.83 ±  8%      -0.0        0.79 ±  5%  perf-profile.children.cycles-pp.inode_permission
      0.47 ± 10%      +0.0        0.47 ±  9%      +0.1        0.55 ± 14%      +0.0        0.50 ±  5%  perf-profile.children.cycles-pp.enqueue_entity
      0.11 ±  6%      +0.0        0.12 ± 16%      -0.0        0.10 ± 22%      -0.0        0.10 ± 31%  perf-profile.children.cycles-pp.add_uevent_var
      0.16 ± 17%      +0.0        0.16 ± 14%      +0.0        0.18 ± 16%      -0.0        0.15 ± 11%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
      0.02 ± 99%      +0.0        0.03 ±101%      +0.0        0.04 ± 71%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.copyout
      0.06 ± 71%      +0.0        0.06 ± 50%      +0.0        0.08 ±  9%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.09 ± 19%      +0.0        0.10 ± 27%      -0.0        0.06 ± 52%      -0.0        0.08 ±  8%  perf-profile.children.cycles-pp.path_hash_func
      0.14 ± 14%      +0.0        0.15 ±  7%      -0.0        0.12 ±  9%      -0.0        0.11 ± 22%  perf-profile.children.cycles-pp.realloc
      0.16 ± 16%      +0.0        0.17 ± 17%      -0.0        0.14 ± 16%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.device_read_uevent_file
      0.10 ± 17%      +0.0        0.10 ±  4%      -0.0        0.08 ± 20%      -0.0        0.09 ± 24%  perf-profile.children.cycles-pp.chacha_permute
      0.04 ± 72%      +0.0        0.05 ± 45%      -0.0        0.03 ±100%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.14 ± 11%      +0.0        0.14 ± 20%      -0.0        0.12 ± 15%      +0.0        0.16 ± 16%  perf-profile.children.cycles-pp.pcpu_block_update_hint_free
      0.10 ± 19%      +0.0        0.10 ± 20%      -0.0        0.09 ± 16%      -0.0        0.09 ± 49%  perf-profile.children.cycles-pp.hashmap_replace
      0.09 ± 10%      +0.0        0.09 ± 19%      -0.0        0.08 ± 27%      -0.0        0.08 ± 54%  perf-profile.children.cycles-pp.__alloc_pages
      0.18 ± 18%      +0.0        0.18 ± 17%      -0.0        0.17 ± 22%      +0.0        0.20 ±  7%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.17 ± 17%      +0.0        0.18 ± 16%      -0.0        0.16 ± 17%      -0.0        0.15 ± 10%  perf-profile.children.cycles-pp.shmem_mkdir
      0.20 ±  8%      +0.0        0.20 ± 11%      -0.0        0.19 ± 23%      +0.0        0.23 ± 17%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.04 ± 73%      +0.0        0.04 ± 73%      -0.0        0.04 ± 71%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.kmemdup_nul
      0.15 ± 10%      +0.0        0.15 ± 15%      +0.0        0.15 ±  6%      +0.0        0.15 ± 24%  perf-profile.children.cycles-pp.allocate_slab
      0.05 ± 46%      +0.0        0.06 ± 50%      +0.0        0.05 ± 46%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.copy_from_kernel_nofault
      0.07 ± 52%      +0.0        0.07 ± 20%      +0.0        0.07 ± 15%      -0.0        0.04 ± 74%  perf-profile.children.cycles-pp._hashmap_clear
      0.18 ± 20%      +0.0        0.18 ± 16%      +0.0        0.18 ± 21%      -0.0        0.17 ± 13%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.08 ±  8%      +0.0        0.09 ± 22%      +0.0        0.09 ± 10%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.path_mount
      0.22 ±  9%      +0.0        0.22 ± 20%      +0.0        0.24 ±  5%      +0.0        0.22 ±  8%  perf-profile.children.cycles-pp.ep_poll_callback
      0.09 ± 30%      +0.0        0.10 ± 32%      +0.0        0.11 ± 23%      +0.0        0.11 ± 11%  perf-profile.children.cycles-pp.recvmsg
      0.36 ±  7%      +0.0        0.36 ± 14%      -0.1        0.29 ± 11%      -0.0        0.35 ± 12%  perf-profile.children.cycles-pp.percpu_free_rwsem
      0.81 ±  6%      +0.0        0.82 ± 14%      +0.1        0.92 ± 15%      +0.0        0.83 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.36 ±  7%      +0.0        0.36 ± 14%      -0.0        0.30 ± 11%      +0.0        0.36 ± 13%  perf-profile.children.cycles-pp.destroy_super_work
      0.26 ±  7%      +0.0        0.26 ± 18%      -0.0        0.25 ±  7%      -0.0        0.24 ± 12%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.38 ± 11%      +0.0        0.39 ± 11%      -0.0        0.38 ±  7%      -0.0        0.37 ±  7%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.07 ± 13%      +0.0        0.08 ± 18%      +0.0        0.07 ± 14%      -0.0        0.07 ± 16%  perf-profile.children.cycles-pp.shmem_getattr
      0.32 ± 19%      +0.0        0.33 ± 10%      +0.0        0.34 ±  8%      -0.0        0.30 ±  8%  perf-profile.children.cycles-pp.down_read
      0.26 ± 20%      +0.0        0.26 ± 14%      +0.0        0.27 ± 15%      +0.0        0.26 ± 17%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.29 ±  9%      +0.0        0.29 ±  6%      +0.0        0.31 ± 15%      +0.0        0.30 ± 11%  perf-profile.children.cycles-pp.generic_permission
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.02 ±144%  perf-profile.children.cycles-pp.skb_release_data
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.04 ± 71%      -0.0        0.00        perf-profile.children.cycles-pp.stress_ramfs_umount
      0.08 ± 26%      +0.0        0.09 ± 11%      -0.0        0.06 ± 47%      +0.0        0.08 ± 20%  perf-profile.children.cycles-pp.xas_start
      0.11 ± 16%      +0.0        0.11 ± 13%      -0.0        0.10 ± 12%      +0.0        0.12 ± 11%  perf-profile.children.cycles-pp.may_delete
      0.06 ± 50%      +0.0        0.07 ± 51%      -0.0        0.06 ±  6%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.pick_next_entity
      0.04 ± 73%      +0.0        0.05 ± 50%      +0.0        0.04 ± 73%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.wake_up_q
      0.07 ± 22%      +0.0        0.07 ± 20%      +0.0        0.07 ± 20%      +0.0        0.07 ± 21%  perf-profile.children.cycles-pp.current_time
      0.09 ± 22%      +0.0        0.09 ± 18%      +0.0        0.10 ± 19%      -0.0        0.08 ± 18%  perf-profile.children.cycles-pp.pcpu_block_update
      0.02 ±144%      +0.0        0.03 ±100%      +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.12 ± 21%      +0.0        0.12 ± 19%      +0.0        0.13 ± 14%      +0.0        0.14 ± 19%  perf-profile.children.cycles-pp.ramfs_mkdir
      0.08 ± 20%      +0.0        0.09 ± 23%      -0.0        0.06 ± 50%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp.shmem_parse_one
      0.16 ± 14%      +0.0        0.17 ± 12%      -0.0        0.16 ± 11%      +0.0        0.17 ± 12%  perf-profile.children.cycles-pp.siphash24_init
      0.20 ±  9%      +0.0        0.20 ± 12%      +0.0        0.20 ±  8%      -0.0        0.18 ± 12%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.14 ± 11%      +0.0        0.15 ±  7%      -0.0        0.12 ± 15%      -0.0        0.12 ± 21%  perf-profile.children.cycles-pp.put_prev_entity
      0.94 ± 11%      +0.0        0.94 ±  9%      -0.0        0.93 ±  6%      +0.0        0.94 ±  6%  perf-profile.children.cycles-pp.mkdir
      1.33 ± 19%      +0.0        1.34 ±  8%      +0.1        1.40 ± 13%      +0.2        1.48 ±  7%  perf-profile.children.cycles-pp.common_nsleep
      0.35 ± 12%      +0.0        0.36 ± 13%      -0.0        0.34 ± 16%      +0.0        0.38 ± 14%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.14 ±  7%      +0.0        0.15 ± 14%      -0.0        0.14 ± 11%      +0.0        0.14 ± 11%  perf-profile.children.cycles-pp.inode_init_always
      0.27 ± 10%      +0.0        0.28 ± 14%      -0.0        0.27 ± 12%      -0.0        0.24 ±  7%  perf-profile.children.cycles-pp.kernfs_iop_permission
      0.54 ± 10%      +0.0        0.55 ±  9%      +0.0        0.56 ±  6%      -0.0        0.53 ±  6%  perf-profile.children.cycles-pp.kmalloc_trace
      0.21 ± 16%      +0.0        0.22 ± 25%      -0.0        0.19 ± 20%      -0.0        0.19 ± 18%  perf-profile.children.cycles-pp.up_read
      0.22 ± 13%      +0.0        0.22 ± 15%      -0.0        0.20 ± 12%      -0.0        0.20 ± 11%  perf-profile.children.cycles-pp.shmem_symlink
      0.10 ± 13%      +0.0        0.11 ±  6%      -0.0        0.09 ± 20%      -0.0        0.10 ± 21%  perf-profile.children.cycles-pp.chacha_block_generic
      0.15 ± 22%      +0.0        0.16 ± 14%      -0.0        0.15 ± 23%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.cpu_util
      0.07 ± 18%      +0.0        0.08 ± 16%      +0.0        0.07 ± 17%      -0.0        0.05 ± 76%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
      0.12 ± 19%      +0.0        0.13 ± 16%      +0.0        0.12 ± 16%      -0.0        0.11 ± 29%  perf-profile.children.cycles-pp.__memset
      0.04 ±101%      +0.0        0.04 ± 73%      +0.0        0.04 ± 71%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.rb_erase
      0.11 ± 14%      +0.0        0.12 ± 23%      +0.0        0.12 ± 13%      -0.0        0.11 ±  9%  perf-profile.children.cycles-pp.lookup_dcache
      0.05 ± 73%      +0.0        0.06 ± 50%      +0.0        0.05 ± 46%      +0.0        0.06 ± 16%  perf-profile.children.cycles-pp.exp_funnel_lock
      0.23 ± 17%      +0.0        0.24 ± 21%      +0.0        0.27 ± 11%      +0.0        0.24 ±  9%  perf-profile.children.cycles-pp.commit_tree
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.getuid
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.apparmor_path_mknod
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kernfs_unlink_open_file
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.cap_capable
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mnt_optstr_remove_option
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.seq_open
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.skb_release_head_state
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.unix_destruct_scm
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.strdup@plt
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.seq_open_private
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kernfs_refresh_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.sock_wfree
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.__seq_open_private
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.shmem_rmdir
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.__sock_create
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kmemdup
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.rcu_sync_dtor
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.radix_tree_node_rcu_free
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp._raw_read_unlock_irqrestore
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.select_idle_sibling
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp._IO_link_in
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_poll
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mnt_reset_fs
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.alloc_pages
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.devpts_show_options
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__attach_mnt
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.pick_link
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__open64_nocancel
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±144%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__poll
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.prctl
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.04 ± 75%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.04 ± 72%      +0.0        0.05 ± 73%      +0.0        0.04 ± 72%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.02 ±141%      +0.0        0.02 ± 99%      +0.0        0.02 ±142%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.default_send_IPI_single_phys
      0.06 ± 72%      +0.0        0.07 ± 18%      +0.0        0.07 ± 24%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.strlcpy
      0.46 ±  8%      +0.0        0.47 ± 14%      -0.0        0.43 ±  5%      -0.0        0.45 ±  6%  perf-profile.children.cycles-pp.mod_objcg_state
      0.18 ± 19%      +0.0        0.18 ± 20%      -0.0        0.18 ± 17%      -0.0        0.14 ± 17%  perf-profile.children.cycles-pp.__d_path
      0.16 ± 15%      +0.0        0.17 ± 12%      +0.0        0.16 ± 17%      +0.0        0.19 ± 13%  perf-profile.children.cycles-pp.update_rq_clock
      0.26 ± 12%      +0.0        0.27 ±  8%      -0.0        0.25 ± 20%      +0.0        0.28 ±  7%  perf-profile.children.cycles-pp.set_next_entity
      0.39 ± 12%      +0.0        0.40 ± 12%      +0.0        0.39 ±  6%      -0.0        0.34 ±  6%  perf-profile.children.cycles-pp.do_open
      0.62 ±  7%      +0.0        0.62 ± 13%      +0.1        0.70 ± 10%      +0.0        0.66 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.05 ± 47%      +0.0        0.06 ± 16%      -0.0        0.04 ± 73%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.09 ± 28%      +0.0        0.10 ± 18%      +0.0        0.09 ± 22%      -0.0        0.07 ± 50%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.prepare_to_wait_event
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.from_kuid_munged
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.move_linked_works
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mounts_open_common
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__put_super
      0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.04 ± 71%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp._dbus_marshal_read_uint32
      0.21 ± 21%      +0.0        0.22 ± 18%      -0.0        0.19 ± 16%      -0.0        0.20 ± 15%  perf-profile.children.cycles-pp.get_nr_inodes
      0.36 ± 18%      +0.0        0.37 ± 10%      -0.0        0.34 ± 14%      -0.0        0.32 ±  6%  perf-profile.children.cycles-pp.do_dentry_open
      0.20 ± 10%      +0.0        0.22 ± 12%      -0.0        0.20 ± 24%      -0.0        0.20 ± 17%  perf-profile.children.cycles-pp.__close_nocancel
      0.43 ± 14%      +0.0        0.44 ± 13%      -0.0        0.42 ± 10%      -0.0        0.42 ±  8%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
      0.23 ± 20%      +0.0        0.24 ± 16%      +0.0        0.23 ± 13%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.seq_escape_mem
      0.12 ±  8%      +0.0        0.12 ± 10%      +0.0        0.12 ± 11%      -0.0        0.11 ± 11%  perf-profile.children.cycles-pp.rcu_pending
      0.13 ± 16%      +0.0        0.14 ± 15%      +0.0        0.14 ± 23%      -0.0        0.12 ± 13%  perf-profile.children.cycles-pp.lockref_get
      0.58 ±  9%      +0.0        0.59 ± 14%      +0.1        0.68 ±  6%      +0.0        0.62 ±  6%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.10 ± 20%      +0.0        0.11 ± 22%      -0.0        0.09 ± 18%      -0.0        0.08 ± 28%  perf-profile.children.cycles-pp.show_mnt_opts
      0.10 ± 20%      +0.0        0.11 ± 16%      +0.0        0.11 ± 18%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp._IO_default_xsputn
      0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.02 ±144%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__socket
      0.02 ±141%      +0.0        0.03 ±102%      +0.0        0.04 ± 44%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__isoc99_sscanf
      0.08 ± 13%      +0.0        0.10 ± 22%      -0.0        0.08 ± 23%      -0.0        0.08 ± 31%  perf-profile.children.cycles-pp.folio_alloc
      0.09 ± 28%      +0.0        0.10 ± 24%      +0.0        0.09 ± 24%      -0.0        0.08 ± 48%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.04 ± 72%      +0.0        0.05 ± 47%      +0.0        0.04 ± 77%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.os_xsave
      0.16 ± 19%      +0.0        0.17 ± 16%      -0.0        0.14 ± 22%      -0.0        0.14 ± 13%  perf-profile.children.cycles-pp.__list_lru_init
      0.22 ± 13%      +0.0        0.23 ±  5%      -0.0        0.20 ± 10%      +0.0        0.23 ±  9%  perf-profile.children.cycles-pp.strndup_user
      0.22 ± 20%      +0.0        0.23 ± 15%      +0.0        0.22 ±  7%      -0.0        0.19 ± 25%  perf-profile.children.cycles-pp.number
      0.20 ± 19%      +0.0        0.21 ± 18%      +0.0        0.21 ± 14%      -0.0        0.19 ±  8%  perf-profile.children.cycles-pp.string_escape_mem
      1.86 ± 10%      +0.0        1.88 ±  4%      -0.1        1.76 ±  5%      -0.0        1.86 ±  4%  perf-profile.children.cycles-pp.alloc_super
      0.18 ±  9%      +0.0        0.19 ± 12%      -0.0        0.15 ± 14%      -0.0        0.17 ± 14%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.18 ± 12%      +0.0        0.20 ± 19%      -0.0        0.18 ± 17%      -0.0        0.18 ± 18%  perf-profile.children.cycles-pp.prepare_task_switch
      0.05 ± 46%      +0.0        0.07 ± 26%      +0.0        0.07 ± 22%      -0.0        0.04 ± 75%  perf-profile.children.cycles-pp.prepend_copy
      0.08 ± 46%      +0.0        0.09 ± 16%      -0.0        0.06 ± 49%      +0.0        0.09 ± 11%  perf-profile.children.cycles-pp.xa_load
      0.13 ± 13%      +0.0        0.15 ± 17%      -0.0        0.13 ± 15%      +0.0        0.14 ± 10%  perf-profile.children.cycles-pp.___perf_sw_event
      0.04 ± 73%      +0.0        0.06 ± 54%      +0.0        0.06 ± 14%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.__libc_calloc
      0.32 ± 12%      +0.0        0.34 ±  9%      -0.0        0.31 ± 13%      -0.0        0.29 ± 14%  perf-profile.children.cycles-pp.cp_new_stat
      0.34 ± 10%      +0.0        0.36 ±  7%      +0.0        0.36 ± 15%      -0.0        0.34 ±  9%  perf-profile.children.cycles-pp.dequeue_entity
      2.00 ± 11%      +0.0        2.01 ±  4%      +0.0        2.04 ±  9%      +0.2        2.15 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.13 ± 12%      +0.0        0.15 ± 23%      +0.0        0.13 ± 12%      +0.0        0.14 ± 13%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.07 ±  9%      +0.0        0.09 ± 24%      +0.0        0.08 ± 21%      -0.0        0.06 ± 49%  perf-profile.children.cycles-pp.stress_ramfs_child
      0.04 ±101%      +0.0        0.05 ± 47%      -0.0        0.02 ± 99%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp.xas_clear_mark
      0.15 ± 17%      +0.0        0.16 ± 14%      +0.0        0.16 ± 10%      +0.0        0.15 ± 12%  perf-profile.children.cycles-pp.d_lookup
      0.48 ± 23%      +0.0        0.50 ± 11%      +0.0        0.50 ± 12%      +0.0        0.52 ± 23%  perf-profile.children.cycles-pp.menu_select
      0.76 ±  8%      +0.0        0.78 ± 10%      -0.0        0.72 ±  5%      +0.0        0.80 ± 10%  perf-profile.children.cycles-pp.free_percpu
      0.56 ± 11%      +0.0        0.57 ±  8%      +0.0        0.56 ± 14%      +0.0        0.58 ±  5%  perf-profile.children.cycles-pp.queue_work_on
      0.08 ± 13%      +0.0        0.10 ± 26%      -0.0        0.07 ± 50%      -0.0        0.06 ± 48%  perf-profile.children.cycles-pp.generic_parse_monolithic
      0.32 ± 15%      +0.0        0.33 ±  7%      -0.0        0.30 ± 10%      +0.0        0.32 ±  5%  perf-profile.children.cycles-pp.vfs_unlink
      0.16 ± 21%      +0.0        0.18 ± 18%      +0.0        0.17 ± 18%      -0.0        0.13 ± 17%  perf-profile.children.cycles-pp.prepend_path
      0.10 ± 51%      +0.0        0.12 ± 21%      +0.0        0.12 ± 12%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.select_task_rq
      0.05 ± 72%      +0.0        0.06 ± 49%      +0.0        0.08 ± 20%      +0.0        0.07 ± 52%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.stress_mwc1
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mounts_release
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.from_kgid_munged
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.ihold
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.greedy_realloc
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.rcu_sync_init
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.04 ± 70%  perf-profile.children.cycles-pp.switch_fpu_return
      0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_gp_kthread
      0.03 ±100%      +0.0        0.04 ± 45%      +0.0        0.04 ±105%      -0.0        0.00        perf-profile.children.cycles-pp.strjoin_real
      0.10 ± 15%      +0.0        0.12 ± 28%      -0.0        0.10 ± 18%      -0.0        0.08 ± 22%  perf-profile.children.cycles-pp.xas_find
      0.20 ± 17%      +0.0        0.22 ± 23%      -0.0        0.19 ±  8%      -0.0        0.19 ± 15%  perf-profile.children.cycles-pp.__switch_to
      0.16 ±  9%      +0.0        0.18 ± 11%      -0.0        0.15 ± 17%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.get_mountpoint
      0.84 ±  7%      +0.0        0.86 ± 13%      -0.0        0.82 ± 11%      -0.1        0.72 ± 10%  perf-profile.children.cycles-pp.alloc_empty_file
      1.41 ±  7%      +0.0        1.42 ± 10%      +0.0        1.44 ±  6%      -0.0        1.39 ±  7%  perf-profile.children.cycles-pp.vfs_fstatat
      0.13 ± 14%      +0.0        0.15 ±  7%      +0.0        0.14 ± 13%      -0.0        0.12 ± 14%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.33 ± 18%      +0.0        0.35 ± 14%      +0.0        0.36 ± 15%      +0.0        0.36 ±  6%  perf-profile.children.cycles-pp.vfs_mkdir
      0.04 ± 71%      +0.0        0.06 ± 17%      -0.0        0.04 ± 72%      +0.0        0.05 ± 47%  perf-profile.children.cycles-pp.apparmor_file_open
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.security_path_mknod
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.should_failslab
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±101%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp._dbus_first_type_in_signature
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.04 ± 47%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.propagate_mount_unlock
      0.11 ± 15%      +0.0        0.13 ± 19%      +0.0        0.13 ± 18%      +0.0        0.13 ± 16%  perf-profile.children.cycles-pp.strlcat
      0.19 ± 14%      +0.0        0.21 ± 13%      +0.0        0.22 ± 11%      +0.0        0.19 ± 21%  perf-profile.children.cycles-pp.rcu_all_qs
      0.03 ±100%      +0.0        0.05 ± 49%      -0.0        0.03 ±100%      +0.0        0.05 ± 74%  perf-profile.children.cycles-pp.strscpy
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.inode_sb_list_add
      0.00            +0.0        0.02 ±144%      +0.0        0.02 ±142%      +0.0        0.04 ± 77%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.09 ± 18%      +0.0        0.11 ± 18%      -0.0        0.08 ± 22%      +0.0        0.10 ± 16%  perf-profile.children.cycles-pp.security_inode_permission
      0.02 ±142%      +0.0        0.04 ± 72%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_socket
      0.02 ±142%      +0.0        0.04 ± 72%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__sys_socket
      0.34 ±  9%      +0.0        0.36 ±  5%      +0.0        0.36 ±  7%      -0.0        0.32 ±  8%  perf-profile.children.cycles-pp.complete_walk
      0.45 ±  6%      +0.0        0.47 ± 10%      +0.1        0.51 ±  9%      +0.0        0.48 ± 13%  perf-profile.children.cycles-pp.update_load_avg
      0.31 ± 18%      +0.0        0.33 ± 26%      +0.1        0.41 ± 21%      +0.1        0.39 ± 30%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait_once
      1.52 ±  5%      +0.0        1.54 ±  5%      -0.0        1.50 ±  6%      -0.0        1.50 ±  4%  perf-profile.children.cycles-pp.__x64_sys_symlink
      0.56 ± 11%      +0.0        0.58 ±  5%      -0.0        0.56 ± 14%      -0.0        0.52 ± 18%  perf-profile.children.cycles-pp.path_compare
      0.04 ± 80%      +0.0        0.06 ± 19%      +0.0        0.06 ± 47%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.shmem_unlink
      0.10 ± 29%      +0.0        0.12 ± 27%      +0.0        0.11 ± 25%      +0.0        0.10 ± 28%  perf-profile.children.cycles-pp.make_vfsuid
      0.15 ± 26%      +0.0        0.17 ± 13%      +0.0        0.17 ± 22%      +0.0        0.17 ± 12%  perf-profile.children.cycles-pp.hrtimer_wakeup
      1.28 ±  9%      +0.0        1.30 ±  9%      -0.0        1.26 ±  9%      -0.0        1.23 ±  4%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.47 ± 10%      +0.0        0.50 ±  8%      +0.0        0.50 ± 15%      +0.0        0.49 ±  8%  perf-profile.children.cycles-pp.__queue_work
      0.98 ± 13%      +0.0        1.00 ±  4%      -0.0        0.94 ±  4%      -0.0        0.96 ±  4%  perf-profile.children.cycles-pp.stress_mwc32
      0.71 ± 10%      +0.0        0.73 ±  7%      -0.0        0.68 ±  8%      +0.0        0.72 ± 16%  perf-profile.children.cycles-pp.__slab_free
      0.27 ± 17%      +0.0        0.29 ± 17%      -0.0        0.26 ±  6%      +0.0        0.29 ± 12%  perf-profile.children.cycles-pp.native_sched_clock
      0.22 ± 15%      +0.0        0.25 ± 17%      -0.0        0.21 ±  9%      -0.0        0.19 ± 15%  perf-profile.children.cycles-pp.device_properties_prepare
      0.02 ±141%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.may_open
      0.04 ± 71%      +0.0        0.06 ± 16%      -0.0        0.00            -0.0        0.03 ±100%  perf-profile.children.cycles-pp.update_min_vruntime
      0.08 ± 22%      +0.0        0.10 ± 23%      +0.0        0.09 ± 34%      -0.0        0.07 ± 23%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.17 ± 15%      +0.0        0.19 ± 19%      +0.0        0.18 ± 20%      -0.0        0.15 ± 21%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.04 ± 71%      +0.0        0.06 ± 11%      -0.0        0.01 ±223%      +0.0        0.04 ± 75%  perf-profile.children.cycles-pp.kmalloc_slab
      0.34 ± 19%      +0.0        0.37 ± 24%      +0.1        0.44 ± 20%      +0.1        0.43 ± 26%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait
      0.42 ±  8%      +0.0        0.44 ±  9%      +0.0        0.46 ± 12%      +0.0        0.43 ± 11%  perf-profile.children.cycles-pp.dequeue_task_fair
      1.28 ± 11%      +0.0        1.31 ±  5%      +0.0        1.31 ±  5%      +0.0        1.30 ±  6%  perf-profile.children.cycles-pp.update_process_times
      1.30 ± 17%      +0.0        1.33 ±  7%      +0.0        1.35 ± 10%      +0.1        1.44 ±  7%  perf-profile.children.cycles-pp.load_balance
      0.00            +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.14 ± 22%      +0.0        0.17 ± 24%      -0.0        0.12 ± 32%      -0.0        0.14 ± 18%  perf-profile.children.cycles-pp.rebalance_domains
      0.40 ±  9%      +0.0        0.42 ±  4%      -0.0        0.39 ±  9%      -0.0        0.36 ± 10%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
      0.01 ±223%      +0.0        0.04 ± 71%      +0.0        0.02 ±143%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.prepare_to_swait_event
      1.25 ±  8%      +0.0        1.28 ±  8%      +0.0        1.26 ±  4%      +0.0        1.27 ±  5%  perf-profile.children.cycles-pp.__lxstat64
      0.22 ± 18%      +0.0        0.25 ± 11%      +0.0        0.24 ± 18%      +0.0        0.26 ± 13%  perf-profile.children.cycles-pp.ramfs_mknod
      1.30 ± 12%      +0.0        1.33 ±  5%      +0.0        1.34 ±  5%      +0.0        1.31 ±  6%  perf-profile.children.cycles-pp.tick_sched_handle
      0.42 ± 22%      +0.0        0.45 ± 42%      +0.2        0.58 ± 45%      -0.0        0.42 ± 28%  perf-profile.children.cycles-pp.swake_up_one
      0.02 ±141%      +0.0        0.05 ± 76%      +0.0        0.06 ± 72%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.find_lock_entries
      1.82 ±  8%      +0.0        1.85 ±  9%      +0.0        1.86 ±  6%      -0.1        1.76 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock
      0.38 ±  9%      +0.0        0.41 ± 13%      -0.0        0.37 ±  9%      -0.0        0.37 ±  7%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
      0.26 ± 14%      +0.0        0.29 ± 14%      -0.0        0.26 ±  9%      +0.0        0.29 ± 10%  perf-profile.children.cycles-pp.sched_clock
      0.32 ± 15%      +0.0        0.35 ± 16%      -0.0        0.32 ± 13%      -0.0        0.27 ±  8%  perf-profile.children.cycles-pp.do_faccessat
      0.38 ±  9%      +0.0        0.41 ± 19%      +0.0        0.40 ± 15%      -0.1        0.32 ± 11%  perf-profile.children.cycles-pp.init_file
      1.07 ±  9%      +0.0        1.10 ±  9%      +0.0        1.10 ±  5%      +0.0        1.08 ±  7%  perf-profile.children.cycles-pp.__do_sys_newlstat
      0.72 ± 14%      +0.0        0.75 ± 13%      -0.0        0.70 ±  4%      -0.0        0.68 ± 10%  perf-profile.children.cycles-pp.vfs_create_mount
      0.24 ± 16%      +0.0        0.27 ± 12%      +0.0        0.24 ± 11%      +0.0        0.27 ± 13%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.02 ±141%      +0.0        0.05 ± 48%      +0.0        0.02 ±142%      +0.0        0.03 ±102%  perf-profile.children.cycles-pp.d_delete
      1.01 ±  6%      +0.0        1.04 ± 12%      +0.0        1.02 ±  6%      -0.1        0.95 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      1.14 ±  6%      +0.0        1.17 ± 11%      -0.1        1.09 ±  3%      -0.0        1.12 ±  4%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
      0.22 ± 18%      +0.0        0.25 ± 12%      +0.0        0.23 ±  5%      -0.0        0.19 ± 15%  perf-profile.children.cycles-pp.device_add_property_aux
      0.26 ±  6%      +0.0        0.30 ±  8%      +0.0        0.27 ± 12%      +0.0        0.27 ±  8%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.0        0.03 ± 70%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.place_entity
      0.34 ± 14%      +0.0        0.37 ± 16%      -0.0        0.33 ± 13%      -0.0        0.30 ±  7%  perf-profile.children.cycles-pp.access
      1.01 ± 13%      +0.0        1.04 ±  6%      +0.1        1.07 ±  5%      +0.0        1.05 ±  7%  perf-profile.children.cycles-pp.scheduler_tick
      0.60 ± 13%      +0.0        0.63 ± 32%      +0.2        0.75 ± 35%      -0.0        0.60 ± 21%  perf-profile.children.cycles-pp.rcu_note_context_switch
      1.36 ±  6%      +0.0        1.39 ±  4%      -0.0        1.35 ±  4%      -0.0        1.34 ±  5%  perf-profile.children.cycles-pp.do_symlinkat
      0.41 ± 10%      +0.0        0.44 ± 13%      +0.0        0.41 ± 13%      +0.0        0.44 ±  9%  perf-profile.children.cycles-pp.d_alloc
      0.05 ± 50%      +0.0        0.09 ± 47%      +0.0        0.06 ± 87%      +0.0        0.08 ± 31%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.06 ± 46%      +0.0        0.09 ± 24%      +0.0        0.07 ± 47%      +0.0        0.08 ± 49%  perf-profile.children.cycles-pp.mnt_release_group_id
      0.71 ± 18%      +0.0        0.74 ± 18%      -0.1        0.66 ± 20%      -0.1        0.64 ± 21%  perf-profile.children.cycles-pp.intel_idle_irq
      1.79 ± 12%      +0.0        1.83 ±  6%      +0.0        1.80 ±  7%      -0.0        1.75 ±  4%  perf-profile.children.cycles-pp.unlink
      0.58 ± 10%      +0.0        0.62 ± 28%      +0.2        0.74 ± 30%      -0.0        0.54 ± 22%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.19 ± 13%      +0.0        0.22 ± 21%      +0.0        0.20 ±  8%      +0.0        0.21 ± 14%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.45 ± 10%      +0.0        0.49 ± 12%      +0.0        0.45 ±  8%      -0.0        0.44 ±  9%  perf-profile.children.cycles-pp.list_lru_destroy
      1.05 ±  6%      +0.0        1.09 ± 19%      +0.2        1.21 ± 19%      -0.0        1.01 ± 13%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      1.13 ±  7%      +0.0        1.17 ± 10%      -0.0        1.08 ±  3%      -0.0        1.11 ±  4%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
      1.41 ±  8%      +0.0        1.45 ± 20%      +0.2        1.66 ± 20%      +0.0        1.44 ±  6%  perf-profile.children.cycles-pp.try_to_wake_up
      0.11 ± 19%      +0.0        0.15 ± 19%      +0.0        0.12 ± 18%      +0.0        0.14 ± 20%  perf-profile.children.cycles-pp.change_mnt_propagation
      1.56 ±  8%      +0.0        1.60 ± 10%      -0.0        1.54 ±  3%      -0.1        1.50 ±  4%  perf-profile.children.cycles-pp.memset_orig
      1.59 ±  6%      +0.0        1.63 ±  5%      -0.0        1.58 ±  6%      -0.0        1.58 ±  3%  perf-profile.children.cycles-pp.symlink
      0.69 ± 18%      +0.0        0.73 ±  7%      +0.0        0.73 ±  6%      +0.1        0.76 ± 10%  perf-profile.children.cycles-pp.perf_event_task_tick
      2.41 ± 10%      +0.0        2.45 ±  6%      -0.0        2.41 ±  4%      -0.0        2.40 ±  5%  perf-profile.children.cycles-pp.namespace_unlock
      0.31 ±  9%      +0.0        0.35 ± 14%      +0.0        0.35 ± 25%      +0.0        0.32 ± 14%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.92 ± 12%      +0.0        1.96 ±  4%      +0.1        1.97 ±  5%      -0.0        1.88 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      6.72 ±  8%      +0.0        6.76 ±  5%      -0.0        6.67            +0.0        6.73 ±  2%  perf-profile.children.cycles-pp.__x64_sys_umount
      0.28 ± 13%      +0.0        0.32 ± 20%      +0.0        0.30 ± 19%      -0.0        0.24 ± 15%  perf-profile.children.cycles-pp.security_file_alloc
      0.68 ± 18%      +0.0        0.72 ±  6%      +0.0        0.72 ±  6%      +0.1        0.75 ± 10%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      1.41 ±  2%      +0.0        1.45 ±  6%      +0.0        1.46 ±  5%      +0.0        1.44 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.56 ±  8%      +0.0        0.60 ± 13%      +0.0        0.58 ±  6%      +0.0        0.60        perf-profile.children.cycles-pp.umount_tree
      4.29 ±  9%      +0.0        4.34 ±  6%      -0.0        4.27 ±  2%      +0.1        4.34 ±  3%  perf-profile.children.cycles-pp.do_umount
      1.51 ± 12%      +0.0        1.55 ±  6%      +0.0        1.54 ±  8%      -0.0        1.48 ±  6%  perf-profile.children.cycles-pp.do_unlinkat
      1.67 ± 11%      +0.0        1.72 ±  5%      +0.0        1.69 ±  8%      -0.0        1.64 ±  4%  perf-profile.children.cycles-pp.__x64_sys_unlink
      0.66 ±  8%      +0.0        0.71 ± 16%      +0.1        0.72 ± 12%      +0.0        0.71 ± 10%  perf-profile.children.cycles-pp.schedule_timeout
      0.56 ±  2%      +0.0        0.61 ±  6%      +0.0        0.59 ±  5%      +0.0        0.60 ±  8%  perf-profile.children.cycles-pp.__entry_text_start
      0.58 ± 14%      +0.0        0.62 ± 31%      +0.1        0.68 ± 27%      +0.0        0.60 ± 23%  perf-profile.children.cycles-pp.poll_idle
      1.41 ± 10%      +0.1        1.46 ±  3%      +0.0        1.44 ±  6%      -0.0        1.39 ±  5%  perf-profile.children.cycles-pp.tick_sched_timer
      3.28 ±  5%      +0.1        3.33 ±  5%      +0.1        3.36 ±  6%      +0.0        3.33 ±  3%  perf-profile.children.cycles-pp.process_one_work
      2.30 ± 12%      +0.1        2.36 ±  4%      +0.1        2.37 ±  7%      -0.0        2.28 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.46 ± 10%      +0.1        0.52 ± 13%      +0.0        0.48 ±  7%      +0.0        0.47 ±  8%  perf-profile.children.cycles-pp.__wait_for_common
      1.24 ± 10%      +0.1        1.29 ±  8%      +0.1        1.30 ± 10%      +0.0        1.26 ±  6%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
      0.65 ± 16%      +0.1        0.71 ± 16%      +0.2        0.84 ± 18%      +0.1        0.77 ± 19%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
      0.55 ± 10%      +0.1        0.62 ± 10%      +0.0        0.56 ±  6%      -0.0        0.54 ±  6%  perf-profile.children.cycles-pp.__flush_work
      2.27 ± 12%      +0.1        2.34 ±  3%      +0.1        2.34 ±  7%      -0.0        2.27 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.72 ±  7%      +0.1        0.79 ± 10%      +0.0        0.75 ±  6%      +0.1        0.79 ± 13%  perf-profile.children.cycles-pp.delayed_free_vfsmnt
      3.96 ±  5%      +0.1        4.04 ±  4%      +0.0        3.99 ±  5%      +0.0        3.98 ±  3%  perf-profile.children.cycles-pp.worker_thread
      0.27 ± 33%      +0.1        0.35 ± 48%      +0.1        0.32 ± 20%      +0.1        0.32 ± 35%  perf-profile.children.cycles-pp.ktime_get
      4.74 ±  8%      +0.1        4.83 ±  5%      -0.0        4.72 ±  2%      +0.0        4.75 ±  3%  perf-profile.children.cycles-pp.path_umount
      4.24 ±  5%      +0.1        4.33 ±  8%      +0.3        4.52 ±  9%      +0.1        4.33 ±  4%  perf-profile.children.cycles-pp.__schedule
      2.60 ±  6%      +0.1        2.69 ±  7%      -0.1        2.53 ±  5%      +0.1        2.67 ± 12%  perf-profile.children.cycles-pp.rcu_do_batch
      2.66 ±  6%      +0.1        2.75 ±  7%      -0.1        2.60 ±  5%      +0.1        2.74 ± 12%  perf-profile.children.cycles-pp.rcu_core
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.children.cycles-pp.x86_64_start_kernel
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.children.cycles-pp.x86_64_start_reservations
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.children.cycles-pp.start_kernel
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.children.cycles-pp.arch_call_rest_init
      6.77 ± 23%      +0.1        6.88 ± 33%      +0.8        7.60 ±  8%      +0.7        7.46 ± 29%  perf-profile.children.cycles-pp.rest_init
      0.12 ± 16%      +0.1        0.23 ± 70%      +0.0        0.12 ± 29%      +0.1        0.17 ± 67%  perf-profile.children.cycles-pp.irq_enter_rcu
      3.48 ±  4%      +0.1        3.60 ±  8%      +0.3        3.74 ±  9%      +0.1        3.61 ±  4%  perf-profile.children.cycles-pp.schedule
      0.10 ± 21%      +0.1        0.22 ± 74%      +0.0        0.11 ± 31%      +0.1        0.15 ± 79%  perf-profile.children.cycles-pp.tick_irq_enter
      3.01 ±  5%      +0.1        3.14 ±  6%      -0.1        2.90 ±  5%      +0.1        3.06 ± 11%  perf-profile.children.cycles-pp.__do_softirq
     29.80 ±  9%      +0.3       30.13 ± 13%      +1.5       31.26 ±  6%      +2.6       32.35 ±  7%  perf-profile.children.cycles-pp.intel_idle
      1.27 ± 15%      +0.4        1.68 ± 15%      +0.2        1.49 ± 10%      +0.4        1.67 ± 28%  perf-profile.children.cycles-pp.run_ksoftirqd
      1.35 ± 15%      +0.4        1.77 ± 15%      +0.2        1.58 ±  9%      +0.4        1.76 ± 27%  perf-profile.children.cycles-pp.smpboot_thread_fn
     29.55 ± 10%      +0.4       30.00 ± 11%      +0.9       30.44 ±  5%      +1.8       31.39 ±  3%  perf-profile.children.cycles-pp.start_secondary
      5.37 ±  6%      +0.5        5.86 ±  7%      +0.3        5.63 ±  2%      +0.4        5.79 ±  9%  perf-profile.children.cycles-pp.kthread
      5.37 ±  6%      +0.5        5.86 ±  7%      +0.3        5.63 ±  2%      +0.4        5.79 ±  9%  perf-profile.children.cycles-pp.ret_from_fork
     36.32 ±  8%      +0.6       36.88 ± 10%      +1.7       38.03 ±  5%      +2.5       38.85 ±  6%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     36.32 ±  8%      +0.6       36.88 ± 10%      +1.7       38.03 ±  5%      +2.5       38.85 ±  6%  perf-profile.children.cycles-pp.cpu_startup_entry
     36.31 ±  8%      +0.6       36.86 ± 10%      +1.7       38.02 ±  5%      +2.5       38.84 ±  6%  perf-profile.children.cycles-pp.do_idle
     35.47 ±  8%      +0.6       36.04 ± 11%      +1.6       37.11 ±  5%      +2.5       38.01 ±  6%  perf-profile.children.cycles-pp.cpuidle_idle_call
     34.79 ±  8%      +0.6       35.37 ± 11%      +1.6       36.40 ±  5%      +2.5       37.30 ±  6%  perf-profile.children.cycles-pp.cpuidle_enter_state
     34.80 ±  8%      +0.6       35.38 ± 11%      +1.6       36.41 ±  5%      +2.5       37.30 ±  6%  perf-profile.children.cycles-pp.cpuidle_enter
      1.42 ± 10%      -0.1        1.34 ±  5%      -0.2        1.27 ±  7%      -0.2        1.22 ± 11%  perf-profile.self.cycles-pp.siphash24_compress
      0.64 ±  8%      -0.1        0.56 ± 10%      -0.1        0.58 ±  5%      -0.0        0.62 ±  5%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.30 ± 22%      -0.1        0.24 ± 17%      -0.1        0.25 ± 10%      -0.1        0.22 ± 23%  perf-profile.self.cycles-pp.unit_name_is_valid
      1.33 ± 11%      -0.0        1.28 ± 11%      -0.1        1.19 ± 14%      -0.2        1.16 ± 13%  perf-profile.self.cycles-pp.malloc
      0.20 ± 15%      -0.0        0.16 ± 20%      -0.0        0.18 ± 20%      -0.0        0.16 ± 12%  perf-profile.self.cycles-pp.strchr@plt
      0.41 ± 15%      -0.0        0.36 ± 14%      -0.0        0.38 ± 10%      -0.1        0.35 ± 14%  perf-profile.self.cycles-pp.device_read_db_internal_filename
      0.52 ± 11%      -0.0        0.48 ± 12%      -0.1        0.46 ± 13%      -0.1        0.46 ± 16%  perf-profile.self.cycles-pp.rdrand
      0.07 ± 18%      -0.0        0.04 ± 71%      -0.0        0.04 ± 72%      -0.0        0.06 ± 48%  perf-profile.self.cycles-pp._copy_from_user
      1.16 ±  7%      -0.0        1.13 ±  6%      -0.0        1.12 ±  3%      -0.1        1.10 ±  6%  perf-profile.self.cycles-pp.strncpy_from_user
      0.34 ±  9%      -0.0        0.30 ± 11%      -0.0        0.30 ±  6%      -0.0        0.34 ±  5%  perf-profile.self.cycles-pp.__check_heap_object
      0.12 ± 16%      -0.0        0.08 ± 14%      -0.0        0.08 ± 22%      -0.0        0.10 ± 17%  perf-profile.self.cycles-pp.xas_descend
      0.07 ±  9%      -0.0        0.04 ± 72%      -0.0        0.07 ± 24%      -0.0        0.07 ± 24%  perf-profile.self.cycles-pp._atomic_dec_and_lock
      0.05 ± 47%      -0.0        0.02 ±141%      -0.0        0.03 ±100%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.fsnotify_destroy_marks
      0.03 ±101%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.seq_puts
      0.05 ± 48%      -0.0        0.02 ±145%      -0.0        0.05 ± 45%      -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.kernfs_get_target_path
      0.08 ± 17%      -0.0        0.05 ± 71%      -0.0        0.07 ± 12%      -0.0        0.05 ± 46%  perf-profile.self.cycles-pp.path_equal
      0.08 ± 25%      -0.0        0.05 ± 47%      -0.0        0.08 ± 16%      -0.0        0.05 ± 46%  perf-profile.self.cycles-pp.generic_fillattr
      0.29 ± 10%      -0.0        0.27 ± 11%      -0.0        0.25 ± 15%      -0.0        0.26 ± 20%  perf-profile.self.cycles-pp.format_decode
      0.07 ± 15%      -0.0        0.05 ± 47%      -0.0        0.04 ± 74%      -0.0        0.07 ± 25%  perf-profile.self.cycles-pp.string_table_lookup
      0.04 ± 75%      -0.0        0.02 ±144%      +0.0        0.06 ± 11%      +0.0        0.05 ± 49%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.06 ± 47%      -0.0        0.03 ±105%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.memcpy@plt
      0.18 ± 13%      -0.0        0.15 ± 10%      -0.0        0.16 ± 12%      -0.0        0.15 ± 12%  perf-profile.self.cycles-pp.apparmor_capable
      0.16 ± 26%      -0.0        0.14 ± 12%      -0.0        0.15 ± 17%      -0.0        0.14 ± 11%  perf-profile.self.cycles-pp.ida_alloc_range
      0.10 ± 13%      -0.0        0.07 ± 16%      -0.0        0.08 ± 17%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp.__close
      0.13 ± 20%      -0.0        0.10 ±  9%      -0.0        0.11 ± 18%      -0.0        0.12 ±  9%  perf-profile.self.cycles-pp.mutex_unlock
      0.30 ± 13%      -0.0        0.28 ± 22%      -0.0        0.27 ± 16%      -0.0        0.28 ±  7%  perf-profile.self.cycles-pp.lockref_put_return
      0.25 ± 18%      -0.0        0.23 ±  7%      -0.0        0.22 ± 14%      +0.0        0.26 ± 22%  perf-profile.self.cycles-pp.vsnprintf
      0.10 ± 21%      -0.0        0.08 ± 21%      -0.0        0.10 ± 15%      -0.0        0.10 ± 14%  perf-profile.self.cycles-pp.llist_add_batch
      0.03 ±101%      -0.0        0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.inode_maybe_inc_iversion
      0.02 ±142%      -0.0        0.00            +0.0        0.06 ± 47%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.terminate_walk
      1.30 ±  8%      -0.0        1.28 ±  6%      -0.1        1.23 ±  7%      -0.0        1.26 ±  3%  perf-profile.self.cycles-pp._find_next_bit
      0.35 ± 10%      -0.0        0.33 ±  8%      -0.0        0.34 ± 15%      -0.0        0.32 ±  3%  perf-profile.self.cycles-pp.step_into
      0.26 ± 12%      -0.0        0.24 ± 12%      -0.0        0.26 ± 17%      -0.1        0.21 ± 10%  perf-profile.self.cycles-pp.strlen
      0.08 ± 19%      -0.0        0.06 ± 51%      -0.0        0.06 ± 28%      +0.0        0.10 ± 23%  perf-profile.self.cycles-pp.pcpu_block_update_hint_free
      0.06 ± 11%      -0.0        0.04 ± 73%      +0.0        0.06 ± 14%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.inode_init_once
      0.12 ± 19%      -0.0        0.10 ± 19%      +0.0        0.14 ± 20%      -0.0        0.12 ± 10%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.02 ±144%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.fput
      0.02 ±144%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.strnlen
      0.02 ±144%      -0.0        0.00            +0.0        0.02 ±144%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.__d_alloc
      0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.strcmp@plt
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.03 ±100%  perf-profile.self.cycles-pp.trigger_load_balance
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.12 ± 15%      -0.0        0.10 ± 17%      -0.0        0.11 ± 15%      -0.0        0.12 ± 15%  perf-profile.self.cycles-pp.memcpy_orig
      0.07 ± 21%      -0.0        0.05 ± 47%      -0.0        0.05 ± 47%      -0.0        0.04 ± 73%  perf-profile.self.cycles-pp.mnt_fstype_is_pseudofs
      0.12 ± 17%      -0.0        0.10 ± 19%      -0.0        0.09 ± 20%      -0.0        0.10 ± 11%  perf-profile.self.cycles-pp.string_hash_func
      0.20 ± 18%      -0.0        0.18 ± 11%      -0.0        0.19 ± 21%      -0.0        0.18 ± 11%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.26 ±  8%      -0.0        0.24 ± 15%      -0.0        0.24 ± 14%      -0.0        0.24 ±  4%  perf-profile.self.cycles-pp.inode_permission
      0.35 ±  9%      -0.0        0.33 ±  9%      -0.0        0.34 ±  7%      -0.0        0.33 ± 11%  perf-profile.self.cycles-pp.__call_rcu_common
      0.12 ± 19%      -0.0        0.10 ± 17%      -0.1        0.07 ± 20%      -0.0        0.08 ± 27%  perf-profile.self.cycles-pp.common_perm_cond
      0.04 ± 72%      -0.0        0.02 ±144%      -0.0        0.02 ±144%      +0.0        0.04 ± 45%  perf-profile.self.cycles-pp.truncate_inode_pages_range
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.deactivate_super
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.error_entry
      0.44 ± 14%      -0.0        0.42 ± 15%      -0.1        0.37 ± 14%      -0.1        0.37 ± 12%  perf-profile.self.cycles-pp.siphash24_finalize
      0.20 ± 15%      -0.0        0.18 ± 20%      -0.0        0.18 ± 18%      -0.0        0.16 ± 21%  perf-profile.self.cycles-pp.strchr
      0.39 ±  6%      -0.0        0.37 ± 13%      +0.0        0.40 ±  9%      +0.0        0.40 ±  7%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.10 ± 14%      -0.0        0.08 ± 46%      +0.0        0.10 ± 13%      -0.0        0.06 ± 50%  perf-profile.self.cycles-pp.init_file
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.newidle_balance
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.unit_name_escape
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.xas_find_marked
      0.40 ± 16%      -0.0        0.39 ±  6%      -0.1        0.34 ± 13%      -0.1        0.35 ± 11%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.28 ± 11%      -0.0        0.26 ± 15%      -0.0        0.26 ±  9%      -0.0        0.24 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.23 ± 14%      -0.0        0.21 ± 19%      -0.0        0.22 ±  9%      -0.0        0.21 ± 10%  perf-profile.self.cycles-pp.__legitimize_mnt
      0.11 ±  8%      -0.0        0.09 ± 15%      -0.0        0.11 ± 10%      -0.0        0.10 ± 27%  perf-profile.self.cycles-pp.walk_component
      0.15 ± 19%      -0.0        0.13 ± 20%      +0.0        0.15 ± 15%      +0.0        0.15 ± 12%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.05 ± 46%      -0.0        0.04 ±100%      +0.0        0.06 ± 16%      +0.0        0.06 ± 47%  perf-profile.self.cycles-pp.pcpu_free_area
      0.16 ± 30%      -0.0        0.14 ± 16%      -0.0        0.16 ± 12%      -0.0        0.15 ± 15%  perf-profile.self.cycles-pp.mntput_no_expire
      0.08 ± 27%      -0.0        0.06 ± 53%      -0.0        0.07 ± 46%      -0.0        0.07 ± 28%  perf-profile.self.cycles-pp.strlen@plt
      0.14 ± 12%      -0.0        0.12 ± 19%      +0.0        0.14 ± 17%      +0.0        0.15 ± 18%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.13 ± 10%      -0.0        0.12 ± 23%      +0.0        0.14 ± 11%      +0.0        0.13 ± 21%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.07 ± 11%      -0.0        0.05 ± 71%      +0.0        0.08 ± 32%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.__pthread_mutex_lock
      0.27 ± 10%      -0.0        0.25 ± 11%      -0.0        0.26 ± 11%      -0.0        0.24 ± 13%  perf-profile.self.cycles-pp.__kmem_cache_free
      0.17 ± 16%      -0.0        0.16 ± 19%      -0.1        0.12 ± 15%      -0.0        0.14 ± 17%  perf-profile.self.cycles-pp.task_work_add
      0.07 ± 20%      -0.0        0.06 ± 18%      -0.0        0.04 ± 72%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.__mnt_want_write
      0.07 ± 31%      -0.0        0.06 ± 53%      -0.0        0.05 ± 48%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.alloc_fd
      0.07 ± 21%      -0.0        0.06 ± 18%      -0.0        0.06 ± 52%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.13 ± 15%      -0.0        0.12 ± 15%      -0.0        0.12 ± 41%      -0.0        0.10 ±  8%  perf-profile.self.cycles-pp._hashmap_first_key_and_value
      0.21 ± 12%      -0.0        0.20 ±  9%      -0.0        0.20 ± 10%      -0.0        0.20 ± 12%  perf-profile.self.cycles-pp.pcpu_alloc_area
      0.06 ± 15%      -0.0        0.04 ± 79%      -0.0        0.05 ± 75%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.resched_curr
      0.13 ± 30%      -0.0        0.12 ± 10%      -0.0        0.13 ± 23%      -0.0        0.13 ± 11%  perf-profile.self.cycles-pp.idle_cpu
      0.22 ± 11%      -0.0        0.21 ± 15%      -0.0        0.22 ±  7%      -0.0        0.20 ±  5%  perf-profile.self.cycles-pp.__d_lookup
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.shmem_free_in_core_inode
      0.12 ± 18%      -0.0        0.10 ± 25%      +0.0        0.12 ± 26%      -0.0        0.11 ± 20%  perf-profile.self.cycles-pp.umount2
      0.27 ± 10%      -0.0        0.26 ±  5%      -0.0        0.27 ± 12%      +0.0        0.28 ± 19%  perf-profile.self.cycles-pp.__switch_to_asm
      0.11 ± 17%      -0.0        0.10 ± 15%      +0.0        0.12 ± 13%      -0.0        0.09 ± 16%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.08 ± 35%      -0.0        0.07 ± 12%      -0.0        0.06 ± 55%      -0.0        0.06 ± 47%  perf-profile.self.cycles-pp.kernfs_dop_revalidate
      0.09 ± 18%      -0.0        0.08 ± 45%      -0.0        0.08 ± 23%      -0.0        0.07 ± 14%  perf-profile.self.cycles-pp._hashmap_iterate
      0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.03 ±141%      -0.0        0.03 ±101%  perf-profile.self.cycles-pp.free@plt
      0.03 ±102%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.04 ± 73%      -0.0        0.03 ±100%      +0.0        0.05 ± 45%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.kernfs_iop_permission
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.malloc@plt
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.update_rq_clock
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.02 ±144%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.02 ±144%      -0.0        0.01 ±223%      +0.0        0.04 ± 73%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.call_cpuidle
      0.03 ±142%      -0.0        0.02 ±223%      +0.0        0.04 ±144%      +0.0        0.04 ±143%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 72%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.__wake_up_common
      0.12 ±  9%      -0.0        0.11 ± 20%      +0.0        0.13 ± 17%      -0.0        0.11 ± 16%  perf-profile.self.cycles-pp.set_root
      0.15 ± 11%      -0.0        0.14 ± 16%      -0.0        0.13 ± 18%      -0.0        0.13 ± 26%  perf-profile.self.cycles-pp.free_percpu
      0.60 ±  8%      -0.0        0.59 ±  9%      -0.0        0.58 ±  5%      -0.0        0.57 ± 13%  perf-profile.self.cycles-pp.link_path_walk
      0.07 ± 18%      -0.0        0.06 ± 49%      -0.0        0.07 ± 28%      +0.0        0.08 ± 14%  perf-profile.self.cycles-pp.pcpu_next_fit_region
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.get_partial_node
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mntput
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.legitimize_links
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.rmqueue
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.kernfs_iop_getattr
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.pcpu_chunk_relocate
      0.07 ± 24%      -0.0        0.06 ± 49%      -0.0        0.06 ± 50%      -0.0        0.06 ± 46%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.06 ± 50%      -0.0        0.04 ± 47%      +0.0        0.06 ± 45%      +0.0        0.06 ± 51%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.24 ± 10%      -0.0        0.24 ± 17%      -0.0        0.20 ± 16%      -0.0        0.23 ± 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.16 ± 23%      -0.0        0.14 ± 14%      +0.0        0.16 ± 12%      -0.0        0.15 ±  9%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.10 ± 19%      -0.0        0.09 ± 20%      +0.0        0.11 ± 14%      +0.0        0.10 ± 15%  perf-profile.self.cycles-pp.__list_add_valid
      0.50 ±  9%      -0.0        0.50 ± 12%      -0.0        0.50 ± 13%      -0.0        0.48 ± 16%  perf-profile.self.cycles-pp.path_init
      0.41 ± 10%      -0.0        0.40 ± 18%      -0.0        0.40 ±  9%      -0.0        0.40 ±  8%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.17 ± 19%      -0.0        0.16 ± 12%      -0.0        0.15 ± 18%      -0.0        0.16 ± 13%  perf-profile.self.cycles-pp.filename_lookup
      0.18 ± 13%      -0.0        0.18 ± 12%      -0.0        0.17 ± 12%      +0.0        0.19 ± 10%  perf-profile.self.cycles-pp._find_next_zero_bit
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.page_counter_uncharge
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__queue_work
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.do_umount
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rb_insert_color
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.native_apic_mem_write
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.security_file_free
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.release_pages
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mnt_table_next_fs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.delete_trailing_chars
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.vfs_parse_fs_string
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.update_blocked_averages
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._hashmap_size
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.wq_worker_running
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.iput
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.drop_nlink
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp._dbus_marshal_read_uint32
      0.01 ±223%      -0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__d_rehash
      0.05 ± 74%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      +0.0        0.06 ± 16%  perf-profile.self.cycles-pp.sync_regs
      0.07 ± 21%      -0.0        0.06 ± 14%      +0.0        0.07 ± 20%      -0.0        0.07 ± 11%  perf-profile.self.cycles-pp.memcg_list_lru_alloc
      0.08 ± 17%      -0.0        0.07 ± 20%      +0.0        0.09 ± 24%      -0.0        0.06 ± 21%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.09 ± 14%      -0.0        0.08 ± 11%      -0.0        0.09 ± 25%      -0.0        0.08 ± 16%  perf-profile.self.cycles-pp.__filename_parentat
      0.06 ± 19%      -0.0        0.06 ± 11%      -0.0        0.06 ±  9%      +0.0        0.07 ± 14%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.06 ± 55%      -0.0        0.06 ± 47%      +0.0        0.07 ± 14%      +0.0        0.08 ± 21%  perf-profile.self.cycles-pp.propagation_next
      0.08 ±  8%      -0.0        0.07 ± 26%      -0.0        0.06 ± 51%      -0.0        0.04 ± 78%  perf-profile.self.cycles-pp.path_simplify
      0.07 ± 12%      -0.0        0.07 ± 22%      +0.0        0.08 ± 14%      -0.0        0.06 ± 49%  perf-profile.self.cycles-pp.task_work_run
      0.10 ± 31%      -0.0        0.10 ± 21%      +0.0        0.11 ± 22%      -0.0        0.09 ± 14%  perf-profile.self.cycles-pp.___slab_alloc
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.04 ± 75%      -0.0        0.04 ± 71%      +0.0        0.05 ± 45%      +0.0        0.05 ± 73%  perf-profile.self.cycles-pp.getdelim
      0.16 ± 25%      -0.0        0.15 ± 15%      -0.0        0.16 ± 20%      +0.0        0.16 ± 19%  perf-profile.self.cycles-pp.__lookup_mnt
      0.67 ± 10%      -0.0        0.66 ± 11%      -0.0        0.63 ±  7%      -0.0        0.64 ±  7%  perf-profile.self.cycles-pp.kmem_cache_free
      0.05 ± 47%      -0.0        0.05 ± 45%      -0.0        0.04 ± 71%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.rcu_nocb_try_bypass
      0.08 ± 20%      -0.0        0.08 ± 25%      -0.0        0.08 ± 17%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.dequeue_entity
      0.10 ± 29%      -0.0        0.09 ± 19%      -0.0        0.09 ± 17%      -0.0        0.09 ± 31%  perf-profile.self.cycles-pp.mutex_lock_killable
      0.20 ± 20%      -0.0        0.19 ± 16%      -0.0        0.19 ±  7%      -0.0        0.17 ± 21%  perf-profile.self.cycles-pp.number
      0.14 ± 14%      -0.0        0.13 ± 11%      -0.0        0.14 ± 16%      -0.0        0.13 ± 14%  perf-profile.self.cycles-pp.dput
      0.09 ± 25%      -0.0        0.09 ± 17%      +0.0        0.10 ± 10%      -0.0        0.09 ± 10%  perf-profile.self.cycles-pp.__srcu_read_unlock
      0.13 ± 12%      -0.0        0.12 ±  8%      +0.0        0.14 ± 20%      +0.0        0.14 ± 10%  perf-profile.self.cycles-pp.read_tsc
      0.12 ±  7%      -0.0        0.12 ±  9%      +0.0        0.14 ± 17%      -0.0        0.12 ± 15%  perf-profile.self.cycles-pp.enqueue_entity
      0.11 ± 26%      -0.0        0.10 ± 26%      +0.0        0.12 ± 12%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.22 ± 15%      -0.0        0.22 ± 11%      +0.0        0.24 ± 16%      +0.0        0.24 ± 13%  perf-profile.self.cycles-pp.generic_permission
      0.03 ± 70%      -0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.show_type
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±144%  perf-profile.self.cycles-pp.rb_next
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.__legitimize_path
      0.07 ± 47%      -0.0        0.06 ± 14%      -0.0        0.06 ± 48%      -0.0        0.05 ± 74%  perf-profile.self.cycles-pp.file_free_rcu
      0.06 ± 25%      -0.0        0.06 ± 47%      -0.0        0.06 ± 45%      +0.0        0.07 ± 24%  perf-profile.self.cycles-pp.vmalloc_to_page
      0.14 ±  8%      -0.0        0.13 ± 16%      +0.0        0.14 ± 19%      -0.0        0.14 ± 14%  perf-profile.self.cycles-pp.smp_call_function_single
      0.06 ± 47%      -0.0        0.06 ± 49%      -0.0        0.05 ± 73%      +0.0        0.08 ± 30%  perf-profile.self.cycles-pp.queue_work_on
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.update_process_times
      0.10 ± 19%      -0.0        0.10 ± 39%      -0.0        0.09 ± 10%      -0.0        0.09 ± 15%  perf-profile.self.cycles-pp.strcmp
      0.16 ±  8%      -0.0        0.15 ± 11%      +0.0        0.17 ± 18%      -0.0        0.15 ± 12%  perf-profile.self.cycles-pp.update_load_avg
      0.62 ± 13%      -0.0        0.62 ± 10%      -0.0        0.61 ±  4%      +0.0        0.65 ± 11%  perf-profile.self.cycles-pp.mnt_get_writers
      0.08 ± 17%      -0.0        0.08 ± 51%      -0.0        0.05 ± 46%      -0.0        0.07 ± 21%  perf-profile.self.cycles-pp.__fput
      0.11 ± 12%      -0.0        0.11 ± 26%      -0.0        0.10 ± 11%      -0.0        0.10 ± 21%  perf-profile.self.cycles-pp.__strdup
      0.08 ± 25%      -0.0        0.08 ± 24%      -0.0        0.07 ± 48%      +0.0        0.08 ± 18%  perf-profile.self.cycles-pp.slab_pre_alloc_hook
      0.08 ± 20%      -0.0        0.08 ± 12%      -0.0        0.07 ± 52%      -0.0        0.07 ± 14%  perf-profile.self.cycles-pp.__fxstat64
      0.10 ± 28%      -0.0        0.09 ± 19%      +0.0        0.10 ± 19%      -0.0        0.06 ± 47%  perf-profile.self.cycles-pp.prepend_path
      0.04 ± 72%      -0.0        0.04 ± 73%      +0.0        0.05 ± 45%      +0.0        0.06 ± 46%  perf-profile.self.cycles-pp.update_cfs_group
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.check_cpu_stall
      0.02 ±141%      -0.0        0.02 ±146%      +0.0        0.03 ±100%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.strextend_with_separator
      0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.strncmp
      0.07 ± 16%      -0.0        0.06 ± 53%      -0.0        0.06 ± 45%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.map_id_up
      0.09 ± 14%      -0.0        0.08 ± 28%      -0.0        0.08 ± 16%      +0.0        0.10 ± 15%  perf-profile.self.cycles-pp.__fget_light
      0.08 ± 21%      -0.0        0.08 ± 19%      -0.0        0.08 ±  8%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp._find_next_and_bit
      0.10 ± 13%      -0.0        0.10 ± 20%      +0.0        0.10 ± 18%      +0.0        0.11 ± 24%  perf-profile.self.cycles-pp.apparmor_file_free_security
      0.03 ±100%      -0.0        0.03 ±100%      +0.0        0.03 ±105%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.sync_rcu_exp_select_cpus
      0.06 ± 45%      -0.0        0.06 ± 25%      +0.0        0.09 ± 17%      +0.0        0.07 ± 10%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      0.14 ± 10%      -0.0        0.14 ± 19%      -0.0        0.13 ±  9%      -0.0        0.12 ± 19%  perf-profile.self.cycles-pp.show_mountinfo
      0.20 ±  9%      -0.0        0.19 ± 11%      -0.0        0.19 ± 10%      -0.0        0.18 ± 14%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.43 ±  8%      +0.0        0.43 ± 13%      -0.0        0.39 ±  6%      -0.0        0.41 ±  8%  perf-profile.self.cycles-pp.mod_objcg_state
      0.06 ± 50%      +0.0        0.06 ± 45%      -0.0        0.04 ± 72%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.13 ± 15%      +0.0        0.13 ±  6%      -0.0        0.11 ±  8%      -0.0        0.10 ± 19%  perf-profile.self.cycles-pp.realloc
      0.17 ± 24%      +0.0        0.17 ± 17%      -0.0        0.15 ± 14%      -0.0        0.16 ± 17%  perf-profile.self.cycles-pp.get_nr_inodes
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±146%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.propagate_one
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.put_prev_entity
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__fs_parse
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rebalance_domains
      0.03 ±102%      +0.0        0.03 ±103%      -0.0        0.03 ±100%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.rb_erase
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.lookup_constant
      0.08 ± 22%      +0.0        0.08 ± 47%      -0.0        0.08 ± 21%      +0.0        0.08 ± 49%  perf-profile.self.cycles-pp.hashmap_replace
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp._dbus_type_reader_get_current_type
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.lookup_open
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.seq_escape_mem
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.vfs_statx
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.vfs_read
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.select_idle_sibling
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.siphash24_finalize@plt
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__bitmap_set
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.symlink
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__dentry_kill
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.i_callback
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.map_id_range_down
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.putname
      0.08 ± 24%      +0.0        0.08 ± 19%      +0.0        0.09 ± 10%      +0.0        0.10 ± 22%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.unlink
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.mkdir
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.siphash24_compress@plt
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.evict
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp._IO_setb
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.namespace_unlock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.mnt_fs_strdup_options
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.check_stack_object
      0.03 ±101%      +0.0        0.03 ±101%      +0.0        0.04 ± 72%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.rmdir
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.02 ±142%      +0.0        0.02 ±142%      +0.0        0.03 ±102%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.pcpu_find_block_fit
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±144%      -0.0        0.00        perf-profile.self.cycles-pp.vfs_unlink
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.path_openat
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.reweight_entity
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.self.cycles-pp.___d_drop
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.stress_ramfs_umount
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.mount
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.__x64_sys_openat
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.kmalloc_trace
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.xas_create
      0.09 ± 14%      +0.0        0.09 ± 14%      +0.0        0.10 ± 18%      +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.rcu_exp_handler
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.do_open
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.34 ± 11%      +0.0        0.34 ± 12%      +0.0        0.37 ± 17%      -0.0        0.34 ± 18%  perf-profile.self.cycles-pp.__schedule
      0.08 ± 17%      +0.0        0.08 ± 24%      +0.0        0.08 ± 14%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.llist_reverse_order
      0.06 ± 53%      +0.0        0.06 ± 48%      -0.0        0.05 ± 48%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.rcu_exp_wait_wake
      0.04 ± 75%      +0.0        0.04 ± 70%      -0.0        0.03 ±101%      +0.0        0.04 ± 47%  perf-profile.self.cycles-pp.open64
      0.04 ± 47%      +0.0        0.05 ± 47%      -0.0        0.04 ± 75%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.build_open_flags
      0.09 ± 26%      +0.0        0.09 ± 30%      -0.0        0.09 ± 28%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp.mutex_lock
      0.03 ±100%      +0.0        0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.object_path_is_valid
      0.02 ± 99%      +0.0        0.03 ±100%      +0.0        0.02 ± 99%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.may_delete
      0.08 ± 27%      +0.0        0.08 ± 23%      +0.0        0.08 ± 21%      -0.0        0.08 ± 12%  perf-profile.self.cycles-pp.mangle_path
      0.04 ± 72%      +0.0        0.04 ± 72%      +0.0        0.05 ± 46%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.cpuacct_charge
      0.05 ± 50%      +0.0        0.06 ± 45%      +0.0        0.07 ± 14%      +0.0        0.06 ± 46%  perf-profile.self.cycles-pp.chase_symlinks
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._IO_feof
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.try_charge_memcg
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.pcpu_block_refresh_hint
      0.05 ± 48%      +0.0        0.05 ± 46%      -0.0        0.04 ± 72%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.strnlen_user
      0.04 ± 75%      +0.0        0.04 ± 71%      +0.0        0.04 ± 71%      +0.0        0.05 ± 49%  perf-profile.self.cycles-pp.openat64
      0.05 ± 72%      +0.0        0.05 ± 47%      +0.0        0.06 ± 13%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.strlcpy
      0.14 ± 21%      +0.0        0.14 ± 24%      -0.0        0.12 ± 20%      +0.0        0.15 ± 11%  perf-profile.self.cycles-pp.refill_obj_stock
      0.16 ±  8%      +0.0        0.16 ± 14%      +0.0        0.16 ± 11%      -0.0        0.14 ± 11%  perf-profile.self.cycles-pp.kfree
      0.10 ± 27%      +0.0        0.10 ±  8%      +0.0        0.10 ± 15%      -0.0        0.09 ± 19%  perf-profile.self.cycles-pp.lookup_fast
      0.08 ± 16%      +0.0        0.08 ± 20%      +0.0        0.08 ± 12%      -0.0        0.06 ± 55%  perf-profile.self.cycles-pp.__do_sys_newfstat
      0.16 ± 13%      +0.0        0.17 ± 28%      -0.0        0.14 ± 23%      -0.0        0.15 ± 20%  perf-profile.self.cycles-pp.up_read
      0.08 ± 28%      +0.0        0.08 ± 13%      -0.0        0.07 ± 21%      -0.0        0.07 ± 23%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.06 ±  9%      +0.0        0.06 ± 49%      -0.0        0.05 ± 46%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.__bitmap_clear
      0.14 ± 27%      +0.0        0.14 ± 19%      +0.0        0.14 ± 20%      +0.0        0.16 ±  7%  perf-profile.self.cycles-pp.xas_store
      0.11 ±  8%      +0.0        0.12 ± 22%      +0.0        0.12 ± 10%      -0.0        0.11 ± 24%  perf-profile.self.cycles-pp.do_syscall_64
      0.06 ± 72%      +0.0        0.06 ± 49%      +0.0        0.06 ± 14%      -0.0        0.04 ± 75%  perf-profile.self.cycles-pp._hashmap_clear
      0.12 ± 20%      +0.0        0.12 ± 44%      +0.1        0.17 ± 34%      -0.0        0.11 ± 20%  perf-profile.self.cycles-pp.try_to_wake_up
      0.07 ± 22%      +0.0        0.07 ± 21%      -0.0        0.06 ± 45%      -0.0        0.05 ± 45%  perf-profile.self.cycles-pp.path_startswith
      0.11 ± 25%      +0.0        0.11 ± 17%      -0.0        0.11 ± 11%      -0.0        0.10 ± 10%  perf-profile.self.cycles-pp.process_one_work
      0.07 ± 23%      +0.0        0.08 ± 28%      +0.0        0.07 ± 20%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
      0.10 ± 23%      +0.0        0.11 ± 48%      +0.0        0.11 ± 13%      +0.0        0.11 ± 30%  perf-profile.self.cycles-pp.__check_object_size
      0.14 ± 18%      +0.0        0.14 ± 14%      +0.0        0.17 ± 13%      +0.0        0.16 ± 14%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.07 ± 17%      +0.0        0.08 ± 25%      -0.0        0.07 ± 24%      -0.0        0.07 ± 12%  perf-profile.self.cycles-pp.pcpu_block_update_hint_alloc
      0.08 ± 20%      +0.0        0.08 ± 21%      -0.0        0.05 ± 73%      -0.0        0.08 ± 12%  perf-profile.self.cycles-pp.path_hash_func
      0.07 ± 17%      +0.0        0.07 ± 26%      -0.0        0.04 ± 72%      +0.0        0.07 ± 20%  perf-profile.self.cycles-pp.schedule
      0.04 ± 73%      +0.0        0.04 ± 71%      -0.0        0.02 ±141%      +0.0        0.04 ± 47%  perf-profile.self.cycles-pp.__x64_sys_umount
      0.10 ± 25%      +0.0        0.10 ± 17%      -0.0        0.09 ± 18%      +0.0        0.10 ± 10%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.04 ± 72%      +0.0        0.04 ± 73%      -0.0        0.02 ±142%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.05 ± 47%      +0.0        0.05 ± 52%      -0.0        0.04 ± 72%      -0.0        0.02 ±144%  perf-profile.self.cycles-pp.prepare_task_switch
      0.06 ± 71%      +0.0        0.06 ± 50%      +0.0        0.08 ±  9%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.10 ± 17%      +0.0        0.10 ±  4%      -0.0        0.08 ± 20%      -0.0        0.09 ± 24%  perf-profile.self.cycles-pp.chacha_permute
      0.09 ± 22%      +0.0        0.09 ± 17%      -0.0        0.08 ± 56%      -0.0        0.08 ± 25%  perf-profile.self.cycles-pp._copy_to_user
      0.04 ± 75%      +0.0        0.05 ± 47%      -0.0        0.04 ± 71%      +0.0        0.06 ± 16%  perf-profile.self.cycles-pp.d_walk
      0.18 ± 18%      +0.0        0.18 ± 17%      -0.0        0.17 ± 22%      +0.0        0.20 ±  7%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.06 ± 50%      +0.0        0.07 ± 23%      -0.0        0.06 ± 23%      -0.0        0.06 ± 47%  perf-profile.self.cycles-pp.path_lookupat
      0.13 ± 28%      +0.0        0.14 ± 29%      -0.0        0.12 ± 13%      +0.0        0.13 ± 17%  perf-profile.self.cycles-pp.vfs_getattr_nosec
      0.08 ± 22%      +0.0        0.08 ± 22%      -0.0        0.08 ± 12%      -0.0        0.06 ± 49%  perf-profile.self.cycles-pp.__memset
      0.13 ± 14%      +0.0        0.14 ± 11%      +0.0        0.13 ± 18%      +0.0        0.14 ± 14%  perf-profile.self.cycles-pp.siphash24_init
      0.15 ± 17%      +0.0        0.15 ± 28%      +0.0        0.15 ± 19%      +0.0        0.16 ± 19%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.14 ± 21%      +0.0        0.15 ± 15%      +0.0        0.14 ±  9%      -0.0        0.13 ±  9%  perf-profile.self.cycles-pp.get_nr_dirty_inodes
      0.08 ± 26%      +0.0        0.09 ± 18%      +0.0        0.09 ± 13%      +0.0        0.09 ± 11%  perf-profile.self.cycles-pp.inode_init_always
      0.08 ± 12%      +0.0        0.08 ± 19%      +0.0        0.08 ± 31%      -0.0        0.06 ± 50%  perf-profile.self.cycles-pp.do_filp_open
      0.48 ± 13%      +0.0        0.48 ± 13%      +0.0        0.49 ± 11%      -0.0        0.47 ± 10%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.10 ± 25%      +0.0        0.10 ± 26%      +0.0        0.13 ± 11%      +0.0        0.10 ± 27%  perf-profile.self.cycles-pp.finish_task_switch
      0.16 ± 11%      +0.0        0.17 ± 20%      -0.0        0.15 ±  8%      +0.0        0.18 ± 11%  perf-profile.self.cycles-pp.clone_mnt
      0.07 ± 15%      +0.0        0.08 ± 18%      -0.0        0.06 ± 46%      -0.0        0.05 ± 75%  perf-profile.self.cycles-pp.__pthread_mutex_unlock_usercnt
      0.16 ± 19%      +0.0        0.17 ± 20%      +0.0        0.16 ± 20%      +0.0        0.16 ±  5%  perf-profile.self.cycles-pp.down_read
      0.26 ± 17%      +0.0        0.27 ± 18%      +0.0        0.26 ± 15%      -0.0        0.25 ± 13%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.10 ± 20%      +0.0        0.10 ± 13%      +0.0        0.11 ± 19%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp._IO_default_xsputn
      0.26 ± 20%      +0.0        0.26 ± 14%      +0.0        0.27 ± 15%      +0.0        0.26 ± 17%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.02 ±142%      +0.0        0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.03 ±100%      +0.0        0.03 ± 70%      +0.0        0.04 ±102%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.shmem_get_inode
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.03 ±102%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.perf_pmu_nop_void
      0.08 ± 23%      +0.0        0.09 ± 12%      -0.0        0.06 ± 46%      -0.0        0.08 ± 22%  perf-profile.self.cycles-pp.xas_start
      0.12 ± 20%      +0.0        0.13 ±  8%      -0.0        0.11 ± 19%      -0.0        0.10 ± 12%  perf-profile.self.cycles-pp.cp_new_stat
      0.09 ± 28%      +0.0        0.09 ± 18%      -0.0        0.08 ± 11%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.rcu_pending
      0.03 ±101%      +0.0        0.04 ±105%      +0.0        0.04 ± 71%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.xas_find
      0.02 ±142%      +0.0        0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__do_sys_newlstat
      0.17 ± 12%      +0.0        0.17 ± 13%      -0.0        0.14 ± 14%      -0.0        0.16 ± 16%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.12 ± 15%      +0.0        0.13 ± 20%      -0.0        0.11 ± 30%      -0.0        0.11 ± 15%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.15 ± 22%      +0.0        0.16 ± 15%      -0.0        0.15 ± 23%      +0.0        0.15 ± 10%  perf-profile.self.cycles-pp.cpu_util
      0.31 ± 20%      +0.0        0.32 ± 10%      -0.0        0.29 ± 18%      -0.0        0.26 ± 15%  perf-profile.self.cycles-pp.cfree
      0.25 ±  7%      +0.0        0.26 ± 18%      -0.0        0.25 ±  7%      -0.0        0.24 ± 12%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.27 ± 11%      +0.0        0.28 ± 15%      +0.0        0.27 ±  8%      -0.0        0.26 ± 11%  perf-profile.self.cycles-pp.__cond_resched
      0.05 ± 47%      +0.0        0.06 ± 13%      +0.0        0.07 ± 26%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.umount_tree
      0.07 ± 45%      +0.0        0.08 ± 12%      -0.0        0.05 ± 46%      +0.0        0.07 ± 15%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.08 ± 27%      +0.0        0.08 ± 14%      -0.0        0.06 ± 49%      +0.0        0.08 ± 29%  perf-profile.self.cycles-pp.set_next_entity
      0.15 ± 16%      +0.0        0.16 ± 16%      -0.0        0.14 ± 15%      -0.0        0.13 ± 20%  perf-profile.self.cycles-pp.device_read_uevent_file
      0.04 ± 73%      +0.0        0.04 ± 47%      -0.0        0.03 ±100%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.strspn@plt
      0.06 ± 48%      +0.0        0.07 ± 16%      -0.0        0.05 ± 73%      +0.0        0.08 ± 25%  perf-profile.self.cycles-pp.propagate_umount
      0.04 ± 73%      +0.0        0.05 ± 46%      -0.0        0.04 ± 72%      +0.0        0.06 ± 18%  perf-profile.self.cycles-pp.security_inode_getattr
      0.13 ± 14%      +0.0        0.14 ± 11%      +0.0        0.13 ± 14%      +0.0        0.14 ± 15%  perf-profile.self.cycles-pp.up_write
      0.17 ± 20%      +0.0        0.18 ± 14%      +0.0        0.18 ± 19%      -0.0        0.16 ± 14%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.hashmap_get2
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__radix_tree_lookup
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.put_fs_context
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.ramfs_get_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.__do_softirq
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.vfs_symlink
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.apparmor_path_mknod
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.stress_mwc1
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.cap_capable
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.do_unlinkat
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.alloc_empty_file
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.memcg_init_list_lru_one
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.shmem_show_options
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.move_linked_works
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.mnt_optstr_remove_option
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.greedy_realloc
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.sd_bus_message_open_container
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.kernfs_refresh_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.radix_tree_node_rcu_free
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._hashmap_get
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.do_new_mount
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._raw_read_unlock_irqrestore
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._IO_link_in
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.dbus_message_get_interface
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.ihold
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__destroy_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.rcu_sync_init
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.shmem_getattr
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.worker_thread
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.00        perf-profile.self.cycles-pp.alloc_fs_context
      0.03 ±100%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.nd_jump_root
      0.06 ± 48%      +0.0        0.06 ± 53%      -0.0        0.05 ± 45%      +0.0        0.07 ± 20%  perf-profile.self.cycles-pp.pick_next_entity
      0.04 ± 72%      +0.0        0.05 ± 73%      +0.0        0.04 ± 72%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.04 ± 72%      +0.0        0.05 ± 74%      +0.0        0.05 ± 76%      +0.0        0.05 ± 47%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.02 ±141%      +0.0        0.02 ± 99%      +0.0        0.03 ±105%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.check_preempt_curr
      0.08 ± 23%      +0.0        0.09 ± 17%      +0.0        0.08 ± 24%      -0.0        0.07 ± 16%  perf-profile.self.cycles-pp.do_dentry_open
      0.12 ± 14%      +0.0        0.13 ± 17%      +0.0        0.14 ± 22%      +0.0        0.12 ± 14%  perf-profile.self.cycles-pp.lockref_get
      0.16 ± 10%      +0.0        0.17 ± 18%      +0.0        0.18 ± 13%      +0.0        0.16 ± 20%  perf-profile.self.cycles-pp.rcu_all_qs
      0.45 ± 11%      +0.0        0.46 ±  9%      -0.0        0.43 ± 16%      -0.0        0.42 ± 18%  perf-profile.self.cycles-pp.path_compare
      0.12 ± 17%      +0.0        0.14 ± 17%      +0.0        0.14 ± 17%      +0.0        0.15 ± 17%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru
      0.05 ± 46%      +0.0        0.06 ± 11%      +0.0        0.07 ± 21%      +0.0        0.06 ± 51%  perf-profile.self.cycles-pp.rcu_do_batch
      0.02 ± 99%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.show_mnt_opts
      0.01 ±223%      +0.0        0.02 ±144%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.percpu_free_rwsem
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.change_mnt_propagation
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._dbus_first_type_in_signature
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.04 ± 45%      -0.0        0.00        perf-profile.self.cycles-pp._ext4_show_options
      0.04 ± 72%      +0.0        0.05 ± 53%      +0.0        0.06 ± 45%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.__libc_calloc
      0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.06 ± 45%      +0.0        0.03 ±105%  perf-profile.self.cycles-pp.commit_tree
      0.33 ± 12%      +0.0        0.34 ± 12%      -0.0        0.32 ± 17%      +0.0        0.36 ± 14%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.08 ± 21%      +0.0        0.09 ± 19%      +0.0        0.09 ± 21%      -0.0        0.08 ± 23%  perf-profile.self.cycles-pp.pcpu_block_update
      0.22 ± 13%      +0.0        0.23 ±  4%      +0.0        0.22 ±  9%      -0.0        0.19 ± 12%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
      0.06 ± 49%      +0.0        0.07 ± 15%      -0.0        0.04 ± 74%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.vfs_create_mount
      0.04 ±101%      +0.0        0.05 ± 47%      -0.0        0.02 ± 99%      +0.0        0.05 ± 46%  perf-profile.self.cycles-pp.xas_clear_mark
      0.04 ± 72%      +0.0        0.05 ± 46%      -0.0        0.04 ± 71%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.ep_poll_callback
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.security_capable
      0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.copy_from_kernel_nofault
      0.04 ± 72%      +0.0        0.05 ± 47%      +0.0        0.04 ± 77%      -0.0        0.02 ±144%  perf-profile.self.cycles-pp.os_xsave
      0.24 ±  7%      +0.0        0.25 ± 14%      -0.0        0.23 ±  7%      +0.0        0.25 ± 17%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.70 ± 18%      +0.0        0.71 ±  8%      +0.0        0.71 ± 11%      +0.1        0.79 ± 10%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.14 ± 20%      +0.0        0.15 ± 22%      +0.0        0.15 ± 13%      -0.0        0.12 ± 16%  perf-profile.self.cycles-pp.check_heap_object
      0.06 ± 13%      +0.0        0.07 ± 12%      -0.0        0.04 ± 73%      -0.0        0.05 ± 49%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.08 ± 30%      +0.0        0.10 ± 24%      +0.0        0.09 ± 24%      -0.0        0.08 ± 49%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.08 ± 22%      +0.0        0.09 ± 26%      +0.0        0.10 ± 35%      +0.0        0.10 ± 24%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.20 ± 16%      +0.0        0.21 ± 25%      -0.0        0.19 ± 10%      -0.0        0.18 ± 15%  perf-profile.self.cycles-pp.__switch_to
      0.10 ± 18%      +0.0        0.12 ± 20%      +0.0        0.11 ± 20%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.strlcat
      0.06 ±  8%      +0.0        0.07 ± 31%      +0.0        0.07 ± 23%      -0.0        0.05 ± 70%  perf-profile.self.cycles-pp.stress_ramfs_child
      0.19 ± 16%      +0.0        0.21 ± 16%      +0.0        0.20 ± 12%      +0.0        0.24 ± 13%  perf-profile.self.cycles-pp.menu_select
      0.11 ± 13%      +0.0        0.13 ± 18%      +0.0        0.12 ± 17%      +0.0        0.12 ± 13%  perf-profile.self.cycles-pp.getname_flags
      0.08 ± 14%      +0.0        0.10 ± 19%      +0.0        0.10 ± 13%      +0.0        0.10 ± 18%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.close_fd
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.find_lock_entries
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.xa_load
      0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.05 ± 47%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.current_time
      0.00            +0.0        0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__flush_work
      0.03 ±100%      +0.0        0.05 ± 46%      -0.0        0.02 ±142%      +0.0        0.05 ± 74%  perf-profile.self.cycles-pp.strscpy
      0.05 ± 46%      +0.0        0.07 ± 14%      +0.0        0.08 ± 47%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.do_idle
      0.02 ±144%      +0.0        0.04 ± 71%      +0.0        0.02 ±141%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.propagate_mnt
      0.04 ± 71%      +0.0        0.06 ± 17%      -0.0        0.04 ± 73%      +0.0        0.05 ± 47%  perf-profile.self.cycles-pp.apparmor_file_open
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.select_task_rq
      0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.__lxstat64
      0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.should_failslab
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±106%      -0.0        0.00        perf-profile.self.cycles-pp.strjoin_real
      0.11 ± 20%      +0.0        0.13 ± 20%      +0.0        0.12 ± 19%      +0.0        0.12 ± 13%  perf-profile.self.cycles-pp.___perf_sw_event
      0.70 ± 12%      +0.0        0.72 ±  6%      +0.0        0.70 ±  5%      +0.1        0.78 ±  7%  perf-profile.self.cycles-pp.pcpu_alloc
      0.09 ± 32%      +0.0        0.11 ± 26%      +0.0        0.10 ± 28%      +0.0        0.10 ± 24%  perf-profile.self.cycles-pp.make_vfsuid
      0.05 ± 71%      +0.0        0.07 ± 46%      +0.0        0.06 ± 48%      +0.0        0.05 ± 59%  perf-profile.self.cycles-pp.memcg_destroy_list_lru
      0.00            +0.0        0.02 ±144%      +0.0        0.02 ±142%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.seq_printf
      0.09 ± 16%      +0.0        0.11 ± 22%      -0.0        0.08 ± 22%      +0.0        0.09 ± 17%  perf-profile.self.cycles-pp.security_inode_permission
      1.58 ±  7%      +0.0        1.60 ±  7%      +0.0        1.58 ±  6%      -0.1        1.52 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
      1.35 ± 11%      +0.0        1.37 ±  8%      +0.0        1.36 ±  4%      -0.0        1.34 ±  4%  perf-profile.self.cycles-pp.mnt_get_count
      0.76 ± 10%      +0.0        0.78 ±  4%      -0.0        0.72 ±  5%      -0.0        0.72 ±  3%  perf-profile.self.cycles-pp.stress_mwc32
      0.12 ±  7%      +0.0        0.14 ± 17%      +0.0        0.13 ± 21%      -0.0        0.12 ± 14%  perf-profile.self.cycles-pp.update_curr
      0.04 ± 71%      +0.0        0.06 ±  8%      -0.0        0.01 ±223%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.kmalloc_slab
      0.00            +0.0        0.02 ±146%      +0.0        0.01 ±223%      +0.0        0.03 ±101%  perf-profile.self.cycles-pp.strcspn@plt
      0.16 ± 16%      +0.0        0.18 ± 18%      +0.0        0.16 ± 17%      -0.0        0.14 ± 24%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.04 ± 71%      +0.0        0.06 ± 15%      -0.0        0.03 ±100%      +0.0        0.06 ± 16%  perf-profile.self.cycles-pp.try_to_unlazy
      0.20 ± 20%      +0.0        0.22 ± 14%      -0.0        0.20 ±  8%      -0.0        0.18 ± 16%  perf-profile.self.cycles-pp.device_add_property_aux
      2.93 ± 11%      +0.0        2.95 ±  8%      -0.0        2.89 ±  3%      +0.0        2.94 ±  2%  perf-profile.self.cycles-pp.stress_rndstr
      0.48 ± 14%      +0.0        0.50 ±  6%      -0.0        0.44 ±  6%      -0.0        0.47 ±  9%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.04 ± 71%      +0.0        0.06 ± 18%      -0.0        0.00            -0.0        0.03 ±100%  perf-profile.self.cycles-pp.update_min_vruntime
      0.03 ±100%      +0.0        0.05 ± 48%      -0.0        0.00            -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.synchronize_rcu_expedited
      0.01 ±223%      +0.0        0.04 ± 73%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.15 ± 10%      +0.0        0.17 ± 22%      -0.0        0.13 ± 19%      -0.0        0.14 ± 11%  perf-profile.self.cycles-pp.down_write
      0.70 ± 10%      +0.0        0.72 ±  7%      -0.0        0.67 ±  7%      +0.0        0.71 ± 16%  perf-profile.self.cycles-pp.__slab_free
      0.01 ±223%      +0.0        0.04 ± 71%      +0.0        0.04 ± 71%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.schedule_timeout
      0.02 ±141%      +0.0        0.04 ± 45%      +0.0        0.03 ± 70%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.24 ±  8%      +0.0        0.27 ± 17%      -0.0        0.24 ±  5%      +0.0        0.24 ± 11%  perf-profile.self.cycles-pp.__entry_text_start
      0.01 ±223%      +0.0        0.04 ± 71%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.complete_walk
      0.33 ± 13%      +0.0        0.36 ± 18%      +0.0        0.38 ±  9%      +0.0        0.35 ± 16%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.25 ± 19%      +0.0        0.28 ± 16%      -0.0        0.25 ±  7%      +0.0        0.28 ± 11%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.03 ±100%      +0.0        0.02 ±144%      +0.0        0.03 ±101%  perf-profile.self.cycles-pp.do_sys_openat2
      0.06 ± 47%      +0.0        0.09 ± 15%      +0.0        0.08 ± 21%      +0.0        0.07 ± 14%  perf-profile.self.cycles-pp.lockref_put_or_lock
      0.15 ± 17%      +0.0        0.18 ± 15%      +0.0        0.16 ±  9%      +0.0        0.17 ± 16%  perf-profile.self.cycles-pp.alloc_vfsmnt
      1.27 ±  3%      +0.0        1.30 ±  9%      +0.1        1.32 ±  6%      +0.0        1.28 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.07 ± 23%      +0.0        0.10 ± 23%      +0.0        0.09 ± 34%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.02 ±144%      +0.0        0.05 ± 47%      +0.0        0.06 ±  7%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.ida_free
      0.01 ±223%      +0.0        0.04 ± 79%      +0.0        0.02 ± 99%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.alloc_super
      0.38 ± 21%      +0.0        0.41 ± 13%      +0.0        0.41 ±  4%      +0.1        0.46 ± 10%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.10 ± 22%      +0.0        0.13 ± 18%      +0.0        0.12 ± 12%      +0.0        0.12 ± 24%  perf-profile.self.cycles-pp.string_escape_mem
      0.17 ± 14%      +0.0        0.20 ± 26%      +0.0        0.18 ± 14%      +0.0        0.18 ± 14%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.00            +0.0        0.03 ± 70%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.place_entity
      0.01 ±223%      +0.0        0.05 ± 71%      +0.0        0.05 ± 49%      +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.load_balance
      0.01 ±223%      +0.0        0.04 ±141%      +0.0        0.02 ±223%      +0.0        0.02 ±145%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.04 ± 71%      +0.0        0.03 ±105%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.path_umount
      0.62 ± 20%      +0.0        0.65 ± 17%      -0.0        0.58 ± 21%      -0.0        0.58 ± 23%  perf-profile.self.cycles-pp.intel_idle_irq
      0.31 ±  9%      +0.0        0.34 ± 13%      +0.0        0.34 ± 25%      +0.0        0.32 ± 14%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.56 ± 15%      +0.0        0.59 ± 31%      +0.1        0.66 ± 27%      +0.0        0.58 ± 24%  perf-profile.self.cycles-pp.poll_idle
      1.44 ±  7%      +0.1        1.50 ±  9%      +0.0        1.45 ±  4%      -0.0        1.42 ±  4%  perf-profile.self.cycles-pp.memset_orig
      0.16 ± 52%      +0.1        0.24 ± 65%      +0.0        0.19 ± 37%      +0.0        0.21 ± 51%  perf-profile.self.cycles-pp.ktime_get
     29.80 ±  9%      +0.3       30.13 ± 13%      +1.5       31.26 ±  6%      +2.6       32.35 ±  7%  perf-profile.self.cycles-pp.intel_idle

--zg5y3VE46k+mQ/7b--
