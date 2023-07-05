Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93E81F
	for <oe-lkp@lists.linux.dev>; Wed,  5 Jul 2023 03:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688526560; x=1720062560;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YH3GUKrZUvgOXCxqmB/cofRnTP+m5/ElyzPnldplDgc=;
  b=ludAtGFglDxfVA5NDaNvl4G7TfgycGz+HxFVzWOvVqFFmArlBduAg89r
   g2WTKQj+OrU+c7SjZDwpV/XI8rSzTqtYTFruRedXxeSiQqAsNFE6LbCKJ
   5VsNUh9ilkU+knGMpeRzHZc/uZEOk/s//nyZFrGBNSDUAMzzKu2wLm7fE
   Upw3lPk9Lo/cDD1bXu0aRFjCMOcQEgtQU5kcQDbbeBYPtyrD0adyvTBbz
   CZLY3gtFkecd1CyGarXhkK/rTZ7nCUCNM2o/SqpSAuv7oR3JbO78tjisH
   brOZCvwV2e9iAjshggf5ew/v9wTiFNc50KDolKeaqSXWxPqWFx+Ldlobg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="363269021"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208,209";a="363269021"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 20:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="1049553910"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208,209";a="1049553910"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jul 2023 20:09:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 20:09:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 20:09:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 20:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glt3zJUt6LchhgagiMqJydku8L6ZU63OCNQZW29FsY85LHAI/z3zi7LRX2yddEV7ChF4A62ziYrgzBKIE5FP/p7EJ5j8RnIUPEqMXMOWYaVYL67dQDTPWGzt6qRthqMJsp6imOV4hvslECexfSY9xVADzlkEI49fMMH02fqFrCYfLx5mESsn3nPBf9QjDYQbOdiBJnqlBkwLxcXFHTuBLoYOh0TL0cctdFXUxvv3RIGVg+fx5w4TGd5Lae8zM+e7f/EX1sSnkLUiyPOwrmPoA9N/r0ckUtx2p7SH5MnfyHo3RTZ5l6k20vdTmPTiJY/ZQvyLr9O122DDnSkO03YUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZylEdRxzZXTnahpBMyQEaQ4WmmTPHcd7y59l6l5LbEA=;
 b=dGXWeJ8ebc4QXl6ogwyfbRGePnU+hGlDe9XeiUmW+X+9zbaXO8QNYIEndv0I0eUjqlK35LR9RNl8iXfH2ogi+ScWyrASpR/dlOtF4pl91OY/EvKs1JXVLjNiXp6K5sE2m3XBnAZt2MtvZLDPc9hBBH/QYAeAmnbAE8ZrAxx08kh77Z8qb3eI2jHD/PDGJIPglbojeGsBsuFNFYYiiOQcEAQWVX6b9nW+AzGngwXFj7TAsPjxQIIvQcTH3Oq6FstV45ZOSznHKZSizW0WuvMf6UVkPNdSqGg640/lJ81esGO5kHE3uXj8YqbWsotLa0Q7SCZEHuxuwFv7cieg84mMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 03:09:02 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 03:09:02 +0000
Date: Wed, 5 Jul 2023 11:08:52 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<fengwei.yin@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <ZKTexGQMR0Z90yPN@xsang-OptiPlex-9020>
References: <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020>
 <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
 <20230626133142.xdcwu7akidnftrla@quack3>
 <CAOQ4uxhf2UkZUtrB42d=5Nti1eS3Fn_Jg7gsqNRkQVS=GWmPTQ@mail.gmail.com>
 <20230627075457.fymnpqn3vrjxjs2u@quack3>
 <CAOQ4uxi4KmMD0xh6Mfk-Rqb_Rwyfb0WL_yiWmonb6qQswNNG=g@mail.gmail.com>
 <ZJ5BT57HFAa52hB8@xsang-OptiPlex-9020>
 <CAOQ4uxgjc4eLvMtKd0yLktinZWfC_Zt9h9YjaOH5+2C9e-GLKw@mail.gmail.com>
 <ZKJ17aRBNGryOvQD@xsang-OptiPlex-9020>
 <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
Content-Type: multipart/mixed; boundary="jyq0xK9ygSt56qNv"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxh_xHTtT77+_+P3hmvFs72C=FccJVU8eWi=uK+RHtuL+g@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff7223f-cb70-4680-2962-08db7d052e75
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIkP/uF166mT7uQaTU6BJJGQhDrsBgMUlFqZoZuI6shzU8pfMg2f8j5wi8h+LSjYxHV3XS8Xxb8JvJDywaB5ZYt/WRLSl+NYhC1z/HL4lLUMt+d2YDaD4aU8zQKO2XbRDdjWl4i/nlcWdX8IjF7xMW0IiP2a2dwDFsNTLKAM0ef5QmoRLNVfSdm5MiXdvjNNHGKIWm/gmgjwYte3xGcpaj/95UVSxSlapswu1+heHIa9MV+TFu6ProMU65AySwvhFe3cuN4Jb4JJVCuCHCnQ4E5tBYhFxIVGTHe/6rE0PTQyJpbtYYO+zzLzBDpdoroEJoR8ZyVrK+4QaHaHoGkrwokr+rGRzbuswhXorvAKXknQa8OThFlAMccJOzRcjN3ENpor5oFGfuxQ6MSpuMVfCEwxWje2W9Ej2Q2AL1nsD1+EwdrcKOsv1wQ3crgJqd24ilRRtQxD2R4hAIKtF/UIGMmT1Xnxh07wCtZk8H+lHGD2bZRIvHcyZe5a2erOUBDkE2Xz+KTHvF/87d8T2430HRlmFp95wozLCfO3Iog8PwHgQDBu6UvMZoWKDGSV1A9/8gi6wijf7cDSF4OmhJ07OESH4toOj9YpfjskQj67rc7Y16Vvf8oDrDjLxkR/oI5s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(6666004)(6486002)(44144004)(9686003)(478600001)(6512007)(86362001)(83380400001)(33716001)(2906002)(107886003)(186003)(26005)(6506007)(316002)(38100700002)(82960400001)(6916009)(4326008)(66946007)(66476007)(44832011)(5660300002)(8936002)(66556008)(235185007)(8676002)(41300700001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lklxBA8lJ67GMtWJJl2Zt72gNGf9dYzzOl1Bv+/xY8PYiP4UIcAABrNurxaH?=
 =?us-ascii?Q?N2maOPDmbIkEuJscGpcj95KMBueR8oOuHcN+SdJ5pXRM+VKWKKJCwjCCRqbD?=
 =?us-ascii?Q?Aiv5k9kJtER0w/LZvZsyGmBtzwBChlVksp10yaizU8wL9Mjp8sgraf6vejvm?=
 =?us-ascii?Q?k1YTeKFPIY8Gg3A6r7/vnqqMWf81JAfYtJCqvgN2HQif+x9Y8FiRLxnvIGA8?=
 =?us-ascii?Q?JalMjZ2bSytmXyTm2AtSk7vjfqZt413n11YGCcOyRPsAT8JX75sF0TuOxsi3?=
 =?us-ascii?Q?MWJD3Wa/BAN1ZY58I8xliKTveD+6BWjFx8PiMw1jnKigmbukaaF8zlJyuD9O?=
 =?us-ascii?Q?5MTd8nJVZD7sKLeqJR5HGcALNIKtF/DVz32EAXNzazOZYAkpvooCD4rjqU2/?=
 =?us-ascii?Q?YGigWdx7A8f9vf0tybziRbJLRFEjNudermux2x4gW/t+Wtg1afKLwGrj/fno?=
 =?us-ascii?Q?KBFoviqCkS4/4nAJZuWCsMLA87tqESJhW//LWx5T5rLRx+iYgpKQOFn8HToJ?=
 =?us-ascii?Q?kcpIG44eRsOzdXLUybupSbasWd5HYv8ZW+puWEOW5w22V6qXVTaZ8+ZOGowT?=
 =?us-ascii?Q?AhDAi9FMQZxPIb5XMXE89cK+mmjcX9aPI+nXtHjVBcIo2rJcdONJSNmmT8kD?=
 =?us-ascii?Q?hzT7xnpun5tJuvO4f84tND822Xrck149UXlkwLbsJhvYgunDyhKeks3hm4hV?=
 =?us-ascii?Q?bhPPy5be3IBb/U74CRt34c0+4tPHsS1aflsj3mV1NQekqO7rQ/QNtSWx60Ti?=
 =?us-ascii?Q?13vCR4js4AAANpInFqGh5RD8+lLAjWsQ3HeaYqK+VucU6MOLNpPgEvrFjw3Q?=
 =?us-ascii?Q?pHEhq/5NFCCPQkbKkt+wSP9HEWLTpLMwjipbN7qI9KR+AY/SOFvPrMnFZW5z?=
 =?us-ascii?Q?x6XRrJ4FyMZMxlmtjFF64pivr3d5LGxbFQP8a7Pfxoyb/59EyERPypMt6zad?=
 =?us-ascii?Q?bvoz1v8y7RqvF7RotA0/C4IzEKvX4qn7hVoS1BgI1JWUPYKSuBY1OdonHLR1?=
 =?us-ascii?Q?tP02HU82GRQCFztaGkLgQbb5NiFFrfhRfpk2wPbl2MNBX0JPHKUpVy2CblRu?=
 =?us-ascii?Q?qZgDng0H6nVqD6p7T9yoezydmlZRzAYo+43eWzBdt7g2U/3N3aXA/8TR9Gz6?=
 =?us-ascii?Q?P3WpgE5vpxbssl2c680fRYg3rRP15Qmo3wsLLdnSY96d84pjtEqDtLRN+B/g?=
 =?us-ascii?Q?2LZB6iT+ytx5a5/qPCc8XHiihavMIfxkTmPMqhXJqhrgtlDCCo5HHb05iv54?=
 =?us-ascii?Q?JrmOUb2s4JU+g16gYruwsMm4HxI4vKG1xNcFzbN7WBuxFbZuQ3hv2LOKrIAG?=
 =?us-ascii?Q?bMV33RnxUkHutL5IhUHUtpvXPaRiVsJc9kBhdUkIAIi1KFp0+FMwhbMfINVZ?=
 =?us-ascii?Q?ArW7OIsUKGP02KV3k6ENYu1/H6nDmzoEbrkNTqasq1dqlS3DBScSNks7LW2j?=
 =?us-ascii?Q?y3mtsY3+8UQVzn3gKIvnjvpTQdlslMfzn4N2t4TqdlxE9V7eMLCgMmznHJV7?=
 =?us-ascii?Q?lltUyPRrcH+/gShM3XHnWrt9uVYOntJWzhELz46THHY6hPAEAkO5cUSyE9cw?=
 =?us-ascii?Q?SH2CeWTQKVaKhFlPxPpYsBejd6ywdUNOXDS9SKKA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff7223f-cb70-4680-2962-08db7d052e75
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 03:09:02.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KL79EetijElxFg9cgaYzsO7ftOh73u3u8NGTg8AWR6cmpnWKbovCvO2Z34tB2PFaOGoP3Hmszja1wsmFMkcJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
X-OriginatorOrg: intel.com

--jyq0xK9ygSt56qNv
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

hi, Amir,

On Mon, Jul 03, 2023 at 06:09:43PM +0300, Amir Goldstein wrote:

...

> >
> 
> Excellent! We have finally made progress :)
> I've pushed this branch to sb_write_barrier-rc4 for future reference.
> 
> I now also realize that stress-ng exercises fanotify permission events.
> I was under the wrong impression that the patches are hurting performance
> of workloads that do not include fanotify permission event watchers.
> 
> The optimization patches
> "fsnotify: optimize the case of no permission event watchers" and
> "fsnotify: activate sb write barriers for permission event watchers"
> are therefore not effective with this workload.
> 
> sb_write_barrier() is not needed for the legacy fanotify permission events,
> so I've changed the optimization patches to activate sb_write_barrier()
> only for the new pre-modify event, which stress-ng is not aware of.
> 
> I also deferred init_srcu_struct() to sb_write_barrier_activate(), which is
> not expected to happen in this workload at all.
> 
> The code is not fully correct, not checking error from init_srcu_struct()
> and possibly needs synchronize_srcu() before cleanup_srcu_struct(),
> but for the purpose of checking performance regressions for existing
> workloads that do not use the new events, that should suffice.
> 
> I pushed these changes to branch sb_write_barrier-rc5:
> 
> * 18ab3ccc03f8 - (sb_write_barrier-rc5) vfs: prepare for pre-modify
> permission events on aio write
> * a6375febb518 - vfs: prepare for pre-modify permission events on write
> * d4d8be7b9987 - vfs: add srcu variants for mnt_{want,drop}_write() helpers
> * 92f4fe8a0643 - fsnotify: activate sb write barriers for pre-modify
> event watchers
> * 9de2ba3f2757 - vfs: implement 'vfs write barriers'
> * 925188d1c20d - fsnotify: optimize the case of no pre-modify event watchers
> 
> Oliver,
> 
> If you can re-test once again, that would be great.
> Sorry that this is taking so long and thanks for your patience.

always our pleasure :)

by new branch, we noticed the regression gone
(I only list the branch base 81c0fe022bd6ebae,
"vfs: implement 'vfs write barriers'" and its parent, and the branch tip,
details are as attached, if you need data for other commits, please let
me know, thanks):

81c0fe022bd6ebae 925188d1c20dde0a5c241100514 9de2ba3f275796bdad641b214a8 18ab3ccc03f835ae3f1fb1f5d98
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
   1445389            +0.1%    1447167            +1.0%    1460309            -0.3%    1440392        stress-ng.ramfs.ops
     24089            +0.1%      24119            +1.0%      24338            -0.3%      24006        stress-ng.ramfs.ops_per_sec

meminfo side:

     17896            +0.2%      17935            +0.1%      17914            -0.2%      17868        meminfo.Percpu
     93922            +0.3%      94175            +0.5%      94388            +0.6%      94531        meminfo.SUnreclaim
    190672            +0.2%     191020            +0.4%     191360            +0.5%     191608        meminfo.Slab
     20651            +0.2%      20683            +0.1%      20664            +0.1%      20665        meminfo.VmallocUsed

> 
> Amir.


--jyq0xK9ygSt56qNv
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="sb_write_barrier-rc5-tip-18ab3ccc03f83"
Content-Transfer-Encoding: 8bit

=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s

commit:
  81c0fe022bd6e (amir73il/fan_pre_access) fanotify: report file range info with FAN_PRE_ACCESSS event
  925188d1c20dd fsnotify: optimize the case of no pre-modify event watchers
  9de2ba3f27579 vfs: implement 'vfs write barriers'
  18ab3ccc03f83 (amir73il/sb_write_barrier-rc5) vfs: prepare for pre-modify permission events on aio write
  
81c0fe022bd6ebae 925188d1c20dde0a5c241100514 9de2ba3f275796bdad641b214a8 18ab3ccc03f835ae3f1fb1f5d98
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 2.145e+09            +0.1%  2.147e+09            +0.8%  2.162e+09            +1.3%  2.173e+09 ±  2%  cpuidle..time
   3879929 ±  3%      -0.3%    3869432            -3.0%    3764807            +2.2%    3964069        cpuidle..usage
     93.50            -0.4%      93.14            -0.1%      93.41            +0.5%      93.96        uptime.boot
      3148            -0.4%       3135            -0.1%       3144            +0.5%       3164        uptime.idle
     20.84            -1.2%      20.60            -1.3%      20.58            -0.5%      20.73        boot-time.boot
     11.36            -0.5%      11.31            -0.5%      11.30            -0.3%      11.32        boot-time.dhcp
    704.71            -1.2%     695.98            -1.3%     695.25            -0.6%     700.63        boot-time.idle
     26.17 ± 40%      -8.3%      24.00 ± 26%     -24.2%      19.83 ± 30%      -8.3%      24.00 ± 19%  perf-c2c.DRAM.local
    255.83 ± 12%      +1.1%     258.67 ±  9%      -5.9%     240.67 ± 19%      -0.8%     253.67 ± 12%  perf-c2c.HITM.local
    255.83 ± 12%      +1.1%     258.67 ±  9%      -5.9%     240.67 ± 19%      -0.8%     253.67 ± 12%  perf-c2c.HITM.total
     93.55            +0.0%      93.56            +0.0%      93.57            +0.0%      93.60        iostat.cpu.idle
      0.21 ±  5%      +2.3%       0.22 ±  6%      -0.5%       0.21 ±  3%      +4.3%       0.22 ±  7%  iostat.cpu.iowait
      3.63            -0.0%       3.62            -0.1%       3.62            -0.3%       3.62        iostat.cpu.system
      2.61            -0.3%       2.60            -0.2%       2.60            -1.8%       2.56 ±  2%  iostat.cpu.user
     93.48            +0.0       93.48            +0.0       93.50            +0.0       93.52        mpstat.cpu.all.idle%
      0.20 ±  6%      +0.0        0.21 ±  6%      -0.0        0.20 ±  3%      +0.0        0.21 ±  7%  mpstat.cpu.all.iowait%
      0.57 ±  2%      +0.0        0.57 ±  2%      +0.0        0.58 ±  4%      +0.0        0.60 ±  8%  mpstat.cpu.all.irq%
      0.11 ±  5%      -0.0        0.09 ± 14%      -0.0        0.11 ±  5%      -0.0        0.10 ±  8%  mpstat.cpu.all.soft%
      2.99            +0.0        3.01            -0.0        2.97            -0.0        2.97 ±  2%  mpstat.cpu.all.sys%
      2.65            -0.0        2.64            -0.0        2.64            -0.0        2.60 ±  2%  mpstat.cpu.all.usr%
     62.04            +0.0%      62.04            +0.0%      62.04            +0.0%      62.04        time.elapsed_time
     62.04            +0.0%      62.04            +0.0%      62.04            +0.0%      62.04        time.elapsed_time.max
     12.00 ± 33%     +22.2%      14.67 ± 20%      +0.0%      12.00 ± 33%     +11.1%      13.33 ± 28%  time.file_system_inputs
   1446901            +0.0%    1447284            +1.0%    1461325            -0.4%    1440877        time.involuntary_context_switches
      0.33 ±141%    -100.0%       0.00          +100.0%       0.67 ±165%      +0.0%       0.33 ±141%  time.major_page_faults
      6912            +0.0%       6912            +0.0%       6912 ±  2%      +0.7%       6960        time.maximum_resident_set_size
      9353            -0.1%       9344            +0.3%       9378            +0.4%       9392        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        time.page_size
     77.67            +0.2%      77.83            +0.9%      78.33            -0.2%      77.50        time.percent_of_cpu_this_job_got
     40.87            +0.5%      41.09            +0.7%      41.17            -0.1%      40.85        time.system_time
      7.70            -2.5%       7.51            +0.8%       7.76            -1.8%       7.56        time.user_time
    740140 ± 18%      -0.9%     733294 ±  9%     -20.5%     588580 ± 14%      +9.9%     813141 ±  4%  time.voluntary_context_switches
     93.00            +0.0%      93.00            +0.0%      93.00            +0.0%      93.00        vmstat.cpu.id
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        vmstat.cpu.sy
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.wa
     15.00            +0.0%      15.00            +0.0%      15.00            -1.1%      14.83 ±  2%  vmstat.io.bi
      4930 ± 11%      +3.2%       5086 ± 11%      +1.8%       5020 ±  9%      -0.6%       4900 ±  8%  vmstat.io.bo
     16029            -0.4%      15957            +0.7%      16134 ±  2%      +1.2%      16227        vmstat.memory.buff
   3247834            +0.0%    3248327            +0.1%    3249766            +0.1%    3251276        vmstat.memory.cache
 1.276e+08            +0.0%  1.276e+08            -0.0%  1.276e+08            -0.0%  1.276e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
      2.00            +0.0%       2.00            +0.0%       2.00            -8.3%       1.83 ± 20%  vmstat.procs.r
    159924 ±  3%      -0.2%     159569            -4.2%     153239 ±  2%      +0.4%     160555 ±  2%  vmstat.system.cs
     84092            +0.2%      84264            -1.0%      83245            -0.1%      83986        vmstat.system.in
   1445389            +0.1%    1447167            +1.0%    1460309            -0.3%    1440392        stress-ng.ramfs.ops
     24089            +0.1%      24119            +1.0%      24338            -0.3%      24006        stress-ng.ramfs.ops_per_sec
     62.04            +0.0%      62.04            +0.0%      62.04            +0.0%      62.04        stress-ng.time.elapsed_time
     62.04            +0.0%      62.04            +0.0%      62.04            +0.0%      62.04        stress-ng.time.elapsed_time.max
     12.00 ± 33%     +22.2%      14.67 ± 20%      +0.0%      12.00 ± 33%     +11.1%      13.33 ± 28%  stress-ng.time.file_system_inputs
   1446901            +0.0%    1447284            +1.0%    1461325            -0.4%    1440877        stress-ng.time.involuntary_context_switches
      0.33 ±141%    -100.0%       0.00          +100.0%       0.67 ±165%      +0.0%       0.33 ±141%  stress-ng.time.major_page_faults
      6912            +0.0%       6912            +0.0%       6912 ±  2%      +0.7%       6960        stress-ng.time.maximum_resident_set_size
      9353            -0.1%       9344            +0.3%       9378            +0.4%       9392        stress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        stress-ng.time.page_size
     77.67            +0.2%      77.83            +0.9%      78.33            -0.2%      77.50        stress-ng.time.percent_of_cpu_this_job_got
     40.87            +0.5%      41.09            +0.7%      41.17            -0.1%      40.85        stress-ng.time.system_time
      7.70            -2.5%       7.51            +0.8%       7.76            -1.8%       7.56        stress-ng.time.user_time
    740140 ± 18%      -0.9%     733294 ±  9%     -20.5%     588580 ± 14%      +9.9%     813141 ±  4%  stress-ng.time.voluntary_context_switches
    264.00            +0.4%     265.00            -0.4%     262.83            -0.8%     262.00        turbostat.Avg_MHz
      7.03            +0.0        7.05            -0.0        7.02            +0.0        7.03        turbostat.Busy%
      3757            -0.1%       3755            -0.5%       3740            -0.7%       3730        turbostat.Bzy_MHz
    106271 ±  3%      -2.3%     103855 ±  2%      +2.3%     108741 ±  4%      -5.0%     100943 ±  2%  turbostat.C1
      0.30 ± 11%      +0.0        0.32 ±  7%      +0.0        0.34 ±  7%      -0.0        0.29 ±  4%  turbostat.C1%
   1191378            +0.4%    1196371            -0.1%    1189861            -0.2%    1188858        turbostat.C1E
      6.28            +0.1        6.36            -0.0        6.26            -0.1        6.17 ±  2%  turbostat.C1E%
   2034970            +0.0%    2035773            +0.8%    2051695            +1.5%    2065103 ±  2%  turbostat.C6
     86.66            -0.1       86.55            +0.0       86.67            +0.2       86.81        turbostat.C6%
     92.08            -0.1%      92.00            -0.3%      91.80            -0.6%      91.56        turbostat.CPU%c1
      0.90 ± 12%      +5.8%       0.95 ± 14%     +31.5%       1.18 ± 39%     +57.4%       1.41 ± 55%  turbostat.CPU%c6
     41.33 ±  2%      +1.6%      42.00            +0.0%      41.33            -0.8%      41.00        turbostat.CoreTmp
      0.42 ±  2%      +0.4%       0.42            -0.8%       0.42            -1.6%       0.42 ±  2%  turbostat.IPC
   5470164            +0.4%    5494662            -0.3%    5455838            +1.4%    5544901        turbostat.IRQ
    544126 ± 22%      -2.5%     530528 ± 11%     -24.5%     410884 ± 18%     +11.5%     606623 ±  5%  turbostat.POLL
      0.04 ± 16%      +0.0        0.04 ± 11%      -0.0        0.04 ± 12%      +0.0        0.05 ± 10%  turbostat.POLL%
      0.43 ± 15%     +21.9%       0.53 ± 22%     +61.9%       0.70 ± 52%    +112.7%       0.92 ± 81%  turbostat.Pkg%pc2
     40.83            +0.8%      41.17 ±  2%      -0.8%      40.50            -0.8%      40.50 ±  2%  turbostat.PkgTmp
     88.51            +0.1%      88.59            -0.6%      88.00            -0.9%      87.75        turbostat.PkgWatt
     10.25            +0.8%      10.33            +0.2%      10.28            -0.4%      10.21        turbostat.RAMWatt
      3000            +0.0%       3000            +0.0%       3001            +0.0%       3001        turbostat.TSC_MHz
    292892            +0.3%     293852            +0.7%     295054            +1.2%     296540        meminfo.Active
    276818            +0.4%     277842            +0.7%     278866            +1.2%     280266        meminfo.Active(anon)
     16074            -0.4%      16009            +0.7%      16187 ±  2%      +1.2%      16273        meminfo.Active(file)
     56074 ± 12%      -4.0%      53813 ±  9%      +1.5%      56920 ± 13%      +1.4%      56835 ±  3%  meminfo.AnonHugePages
    303960            +0.0%     304029            +0.1%     304378            -0.1%     303546        meminfo.AnonPages
     16010            -0.4%      15939            +0.7%      16118 ±  2%      +1.3%      16213        meminfo.Buffers
   3148894            +0.0%    3149643            +0.1%    3150967            +0.1%    3152354        meminfo.Cached
  65801592            +0.0%   65801592            +0.0%   65801592            +0.0%   65801592        meminfo.CommitLimit
    811170            +0.0%     811416            +0.1%     812048            +0.1%     812211        meminfo.Committed_AS
 1.264e+08            -1.7%  1.243e+08 ±  3%      +0.4%  1.269e+08            -0.3%   1.26e+08        meminfo.DirectMap1G
   7382357 ± 26%     +28.3%    9467904 ± 43%      -7.1%    6856362 ± 15%      +4.9%    7743146 ± 16%  meminfo.DirectMap2M
    173642 ±  4%      +6.7%     185248 ± 14%      +1.0%     175349 ± 11%      -6.5%     162378 ± 12%  meminfo.DirectMap4k
     14.33 ± 32%      +0.0%      14.33 ± 31%      +0.0%      14.33 ± 28%     +22.1%      17.50 ±  2%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    358551            +0.0%     358655            +0.1%     358939            -0.1%     358090        meminfo.Inactive
    328648            +0.1%     328898            +0.1%     328829            -0.3%     327792        meminfo.Inactive(anon)
     29902            -0.5%      29756            +0.7%      30110 ±  2%      +1.3%      30298        meminfo.Inactive(file)
     96749            +0.1%      96844            +0.2%      96971            +0.3%      97077        meminfo.KReclaimable
      9053            +0.2%       9068            +0.0%       9056            +0.1%       9058        meminfo.KernelStack
     48447            +1.2%      49032            +0.2%      48528            +0.4%      48647        meminfo.Mapped
 1.269e+08            +0.0%  1.269e+08            -0.0%  1.269e+08            -0.0%  1.269e+08        meminfo.MemAvailable
 1.276e+08            +0.0%  1.276e+08            -0.0%  1.276e+08            -0.0%  1.276e+08        meminfo.MemFree
 1.316e+08            +0.0%  1.316e+08            +0.0%  1.316e+08            -0.0%  1.316e+08        meminfo.MemTotal
   3965962            -0.0%    3965785            +0.1%    3969576            +0.1%    3968997        meminfo.Memused
     11.00            +0.0%      11.00            -3.0%      10.67 ±  4%      -3.0%      10.67 ±  4%  meminfo.Mlocked
      3993            -0.6%       3970            -0.0%       3992            -0.7%       3966        meminfo.PageTables
     17896            +0.2%      17935            +0.1%      17914            -0.2%      17868        meminfo.Percpu
     96749            +0.1%      96844            +0.2%      96971            +0.3%      97077        meminfo.SReclaimable
     93922            +0.3%      94175            +0.5%      94388            +0.6%      94531        meminfo.SUnreclaim
    301710            +0.3%     302565            +0.6%     303539            +1.0%     304769        meminfo.Shmem
    190672            +0.2%     191020            +0.4%     191360            +0.5%     191608        meminfo.Slab
   2817197            +0.0%    2817234            +0.0%    2817232            -0.0%    2817193        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
     20651            +0.2%      20683            +0.1%      20664            +0.1%      20665        meminfo.VmallocUsed
      0.33 ±223%    -100.0%       0.00          -100.0%       0.00            +0.0%       0.33 ±223%  meminfo.Writeback
   4139902            +0.1%    4142754            +0.2%    4148436            +0.2%    4147921        meminfo.max_used_kB
     69.50 ±  5%      +8.9%      75.67 ± 17%      +1.4%      70.50 ± 14%      -7.9%      64.00 ± 15%  proc-vmstat.direct_map_level2_splits
      3.50 ± 54%     +57.1%       5.50 ± 71%     -14.3%       3.00 ± 33%      +9.5%       3.83 ± 31%  proc-vmstat.direct_map_level3_splits
     69204            +0.4%      69460            +0.7%      69716            +1.2%      70066        proc-vmstat.nr_active_anon
      4017            -0.4%       4002            +0.7%       4046 ±  2%      +1.2%       4067        proc-vmstat.nr_active_file
     75990            +0.0%      76008            +0.1%      76094            -0.1%      75889        proc-vmstat.nr_anon_pages
     27.00 ± 13%      -3.7%      26.00 ±  9%      +1.2%      27.33 ± 12%      +1.2%      27.33 ±  4%  proc-vmstat.nr_anon_transparent_hugepages
     18.00 ± 70%      +3.7%      18.67 ± 80%     -29.6%      12.67 ± 21%      +5.6%      19.00 ± 65%  proc-vmstat.nr_dirtied
      3.17 ± 38%      +5.3%       3.33 ± 28%      +5.3%       3.33 ± 28%     +26.3%       4.00        proc-vmstat.nr_dirty
   3166192            +0.0%    3166193            -0.0%    3166110            -0.0%    3166132        proc-vmstat.nr_dirty_background_threshold
   6340128            +0.0%    6340129            -0.0%    6339962            -0.0%    6340006        proc-vmstat.nr_dirty_threshold
    791230            +0.0%     791396            +0.1%     791775            +0.1%     792146        proc-vmstat.nr_file_pages
     38.00            +0.4%      38.17            +0.4%      38.17            +0.0%      38.00        proc-vmstat.nr_foll_pin_acquired
     38.00            +0.4%      38.17            +0.4%      38.17            +0.0%      38.00        proc-vmstat.nr_foll_pin_released
  31909300            +0.0%   31909362            -0.0%   31908392            -0.0%   31908541        proc-vmstat.nr_free_pages
     82167            +0.1%      82226            +0.1%      82212            -0.3%      81954        proc-vmstat.nr_inactive_anon
      7475            -0.5%       7439            +0.7%       7527 ±  2%      +1.3%       7574        proc-vmstat.nr_inactive_file
      0.50 ±223%    -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_isolated_anon
      9053            +0.2%       9068            +0.0%       9055            +0.1%       9058        proc-vmstat.nr_kernel_stack
     12118            +1.2%      12258            +0.1%      12133            +0.4%      12165        proc-vmstat.nr_mapped
      2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.nr_mlock
    997.83            -0.6%     992.00            +0.0%     997.83            -0.7%     991.17        proc-vmstat.nr_page_table_pages
     75431            +0.3%      75641            +0.6%      75889            +1.0%      76196        proc-vmstat.nr_shmem
     24185            +0.1%      24210            +0.2%      24242            +0.3%      24269        proc-vmstat.nr_slab_reclaimable
     23478            +0.3%      23541            +0.5%      23595            +0.6%      23630        proc-vmstat.nr_slab_unreclaimable
    704299            +0.0%     704308            +0.0%     704307            -0.0%     704298        proc-vmstat.nr_unevictable
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_writeback
     16.50 ± 75%     -31.3%      11.33 ± 29%     -32.3%      11.17 ± 27%     -10.1%      14.83 ± 87%  proc-vmstat.nr_written
     69204            +0.4%      69460            +0.7%      69716            +1.2%      70066        proc-vmstat.nr_zone_active_anon
      4017            -0.4%       4002            +0.7%       4046 ±  2%      +1.2%       4067        proc-vmstat.nr_zone_active_file
     82167            +0.1%      82226            +0.1%      82212            -0.3%      81954        proc-vmstat.nr_zone_inactive_anon
      7475            -0.5%       7439            +0.7%       7527 ±  2%      +1.3%       7574        proc-vmstat.nr_zone_inactive_file
    704299            +0.0%     704308            +0.0%     704307            -0.0%     704298        proc-vmstat.nr_zone_unevictable
      3.17 ± 38%      +5.3%       3.33 ± 28%      +5.3%       3.33 ± 28%     +31.6%       4.17 ±  8%  proc-vmstat.nr_zone_write_pending
   1254854            -0.7%    1246420            +0.6%    1261952            -1.2%    1240080        proc-vmstat.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1254896            -0.6%    1246972            +0.4%    1260464            -1.2%    1240080        proc-vmstat.numa_local
    104142            +0.1%     104240            +0.1%     104283            +0.3%     104464        proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2046311            -2.1%    2004020            -0.4%    2038967            -2.7%    1991419        proc-vmstat.pgalloc_normal
    216545            +1.4%     219617            +0.9%     218586            +1.2%     219094        proc-vmstat.pgfault
   1912120            -2.2%    1869150            -0.4%    1904304            -2.9%    1856717        proc-vmstat.pgfree
      1008            +0.0%       1008            +0.0%       1008            +0.0%       1008        proc-vmstat.pgpgin
    314560 ± 11%      +3.8%     326516 ± 11%      +2.8%     323448 ±  9%      +1.1%     317983 ±  8%  proc-vmstat.pgpgout
      7493            -0.5%       7459            +1.3%       7590 ±  2%      +1.8%       7625 ±  2%  proc-vmstat.pgreuse
     47.17 ±  3%      +0.0%      47.17 ±  3%      -0.4%      47.00 ±  3%      +4.6%      49.33 ±  6%  proc-vmstat.thp_collapse_alloc
      0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%    -100.0%       0.00        proc-vmstat.thp_deferred_split_page
      0.83 ±175%     +40.0%       1.17 ± 91%     +60.0%       1.33 ± 70%     +40.0%       1.17 ± 58%  proc-vmstat.thp_fault_alloc
      0.00       +1.7e+101%       0.17 ±223% +1.7e+101%       0.17 ±223%    -100.0%       0.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
    157.50            +1.7%     160.17            -0.2%     157.17            +0.0%     157.50        proc-vmstat.unevictable_pgs_culled
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
      3.00           -16.7%       2.50 ± 44%      +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_munlocked
      3.24            +0.5%       3.26           +12.2%       3.64 ± 26%     +28.8%       4.18 ± 49%  perf-stat.i.MPKI
 2.711e+09            +0.1%  2.715e+09            +0.2%  2.716e+09            -0.9%  2.688e+09        perf-stat.i.branch-instructions
      1.52            -0.0        1.52            +0.0        1.54 ±  4%      +0.1        1.59 ± 10%  perf-stat.i.branch-miss-rate%
  41136208            -0.2%   41069979            -0.9%   40752213            -1.9%   40344050        perf-stat.i.branch-misses
      4.47            +0.0        4.50 ±  2%      -0.0        4.45 ±  3%      -0.1        4.41 ±  2%  perf-stat.i.cache-miss-rate%
   1914520 ±  2%      -0.8%    1898546 ±  3%      -1.4%    1888249 ±  3%      -2.4%    1868438        perf-stat.i.cache-misses
  43319623            +0.6%   43595202            -0.7%   43006340            -0.2%   43247542        perf-stat.i.cache-references
    166171 ±  3%      +0.1%     166334            -4.0%     159577 ±  2%      +1.1%     168069        perf-stat.i.context-switches
      0.69            +0.3%       0.69            +4.3%       0.72 ± 10%     +10.7%       0.76 ± 21%  perf-stat.i.cpi
     36003            +0.0%      36003            +0.0%      36004            +0.0%      36004        perf-stat.i.cpu-clock
 9.159e+09            +0.5%  9.203e+09            -0.2%  9.137e+09            -0.4%  9.119e+09        perf-stat.i.cpu-cycles
    695.39 ±  4%      +5.1%     731.11 ±  3%      +2.6%     713.33 ±  3%      -1.2%     687.15        perf-stat.i.cpu-migrations
      8900 ±  6%      +1.1%       8998 ±  6%      +1.2%       9004 ±  8%      +2.8%       9153 ±  3%  perf-stat.i.cycles-between-cache-misses
      0.01 ±  9%      -0.0        0.01 ±  7%      +0.0        0.01 ±102%      +0.0        0.02 ±140%  perf-stat.i.dTLB-load-miss-rate%
    197520 ±  7%      -2.9%     191738 ±  7%      +6.1%     209531 ±  6%      +5.5%     208342 ±  9%  perf-stat.i.dTLB-load-misses
 2.889e+09            +0.1%   2.89e+09            -0.1%  2.886e+09            -0.8%  2.865e+09        perf-stat.i.dTLB-loads
      0.01 ±  5%      -0.0        0.01 ±  5%      +0.0        0.01 ± 43%      +0.0        0.01 ± 69%  perf-stat.i.dTLB-store-miss-rate%
    101802 ±  5%      -2.5%      99271 ±  5%      +2.9%     104794 ±  4%      +1.2%     103013 ±  4%  perf-stat.i.dTLB-store-misses
  1.72e+09            -0.0%  1.719e+09            -0.2%  1.717e+09            -0.8%  1.705e+09        perf-stat.i.dTLB-stores
     65.20            +1.1       66.31            -0.1       65.14            -0.1       65.06        perf-stat.i.iTLB-load-miss-rate%
   3455763 ±  2%      +3.9%    3590603 ±  3%      -1.2%    3415556            -2.8%    3358694 ±  3%  perf-stat.i.iTLB-load-misses
   1825090            -1.3%    1802127 ±  2%      -0.6%    1813951 ±  3%      -1.8%    1791551 ±  3%  perf-stat.i.iTLB-loads
 1.331e+10            +0.1%  1.333e+10            +0.2%  1.334e+10            -0.9%   1.32e+10        perf-stat.i.instructions
      3938            -3.4%       3804 ±  3%      +1.1%       3982            +1.7%       4003 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      1.45            -0.3%       1.45            +0.2%       1.46            -0.8%       1.44        perf-stat.i.ipc
      0.21 ± 38%     +20.5%       0.25 ± 25%     -17.0%       0.17 ± 35%      +6.6%       0.22 ± 30%  perf-stat.i.major-faults
      0.25            +0.5%       0.26            -0.2%       0.25            -0.4%       0.25        perf-stat.i.metric.GHz
    101.85 ±  6%      +2.9%     104.76 ±  3%      +7.9%     109.94 ±  8%     +20.7%     122.88 ± 26%  perf-stat.i.metric.K/sec
    204.49            +0.1%     204.61            -0.0%     204.45            -0.9%     202.75        perf-stat.i.metric.M/sec
      1973 ±  2%      +2.3%       2018            +0.5%       1982            +0.8%       1988        perf-stat.i.minor-faults
    265346 ±  4%      -1.0%     262680 ±  4%      +1.1%     268333 ±  4%      -3.2%     256933 ±  5%  perf-stat.i.node-loads
    564921 ±  4%      -3.2%     546825 ±  6%      -2.9%     548309 ±  6%      -6.0%     531040 ±  3%  perf-stat.i.node-stores
      1973 ±  2%      +2.3%       2018            +0.5%       1982            +0.8%       1988        perf-stat.i.page-faults
     36003            +0.0%      36003            +0.0%      36004            +0.0%      36004        perf-stat.i.task-clock
      3.25            +0.5%       3.27            -0.9%       3.22            +0.7%       3.28        perf-stat.overall.MPKI
      1.52            -0.0        1.51            -0.0        1.50            -0.0        1.50        perf-stat.overall.branch-miss-rate%
      4.42 ±  2%      -0.1        4.36 ±  3%      -0.0        4.39 ±  3%      -0.1        4.32        perf-stat.overall.cache-miss-rate%
      0.69            +0.3%       0.69            -0.5%       0.69            +0.4%       0.69        perf-stat.overall.cpi
      4786 ±  2%      +1.4%       4851 ±  3%      +1.2%       4843 ±  3%      +2.0%       4880        perf-stat.overall.cycles-between-cache-misses
      0.01 ±  7%      -0.0        0.01 ±  7%      +0.0        0.01 ±  6%      +0.0        0.01 ± 11%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ±  4%      -0.0        0.01 ±  5%      +0.0        0.01 ±  4%      +0.0        0.01 ±  5%  perf-stat.overall.dTLB-store-miss-rate%
     65.43            +1.1       66.57            -0.1       65.32            -0.2       65.22        perf-stat.overall.iTLB-load-miss-rate%
      3852 ±  2%      -3.5%       3716 ±  3%      +1.4%       3906            +2.0%       3931 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      1.45            -0.3%       1.45            +0.5%       1.46            -0.4%       1.45        perf-stat.overall.ipc
 2.668e+09            +0.1%  2.672e+09            +0.2%  2.673e+09            -0.9%  2.645e+09        perf-stat.ps.branch-instructions
  40483783            -0.2%   40418387            -0.9%   40110645            -1.9%   39709678        perf-stat.ps.branch-misses
   1884537 ±  2%      -0.8%    1868850 ±  3%      -1.4%    1858910 ±  3%      -2.4%    1839465        perf-stat.ps.cache-misses
  42632204            +0.6%   42903248            -0.7%   42328951            -0.2%   42567495        perf-stat.ps.cache-references
    163529 ±  3%      +0.1%     163689            -4.0%     157058 ±  2%      +1.2%     165418        perf-stat.ps.context-switches
     35432            +0.0%      35432            +0.0%      35437            +0.0%      35437        perf-stat.ps.cpu-clock
 9.014e+09            +0.5%  9.057e+09            -0.2%  8.993e+09            -0.4%  8.975e+09        perf-stat.ps.cpu-cycles
    684.34 ±  4%      +5.1%     719.48 ±  3%      +2.6%     702.08 ±  3%      -1.2%     676.32        perf-stat.ps.cpu-migrations
    194401 ±  7%      -2.9%     188716 ±  7%      +6.1%     206247 ±  6%      +5.5%     205102 ±  9%  perf-stat.ps.dTLB-load-misses
 2.843e+09            +0.1%  2.844e+09            -0.1%  2.841e+09            -0.8%   2.82e+09        perf-stat.ps.dTLB-loads
    100186 ±  5%      -2.5%      97695 ±  5%      +3.0%     103143 ±  4%      +1.2%     101395 ±  4%  perf-stat.ps.dTLB-store-misses
 1.692e+09            -0.0%  1.691e+09            -0.2%  1.689e+09            -0.8%  1.678e+09        perf-stat.ps.dTLB-stores
   3400895 ±  2%      +3.9%    3533563 ±  3%      -1.2%    3361714            -2.8%    3305810 ±  3%  perf-stat.ps.iTLB-load-misses
   1796095            -1.3%    1773484 ±  2%      -0.6%    1785338 ±  3%      -1.8%    1763316 ±  3%  perf-stat.ps.iTLB-loads
  1.31e+10            +0.1%  1.312e+10            +0.2%  1.313e+10            -0.8%  1.299e+10        perf-stat.ps.instructions
      0.21 ± 38%     +20.5%       0.25 ± 25%     -17.0%       0.17 ± 35%      +6.6%       0.22 ± 30%  perf-stat.ps.major-faults
      1941 ±  2%      +2.3%       1986            +0.5%       1951            +0.8%       1957        perf-stat.ps.minor-faults
    261185 ±  4%      -1.0%     258571 ±  4%      +1.1%     264156 ±  4%      -3.2%     252940 ±  5%  perf-stat.ps.node-loads
    556040 ±  4%      -3.2%     538233 ±  6%      -2.9%     539751 ±  6%      -6.0%     522758 ±  3%  perf-stat.ps.node-stores
      1942 ±  2%      +2.3%       1986            +0.5%       1951            +0.8%       1957        perf-stat.ps.page-faults
     35432            +0.0%      35432            +0.0%      35437            +0.0%      35437        perf-stat.ps.task-clock
 8.262e+11            +0.1%  8.274e+11            +1.0%  8.346e+11            +0.2%  8.277e+11        perf-stat.total.instructions
      0.00        +6.5e+08%       6.52 ±223%  +4.2e+09%      41.51 ±200%  +7.2e+08%       7.15 ±223%  sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +2.3e+10%     234.76 ±223%  +1.2e+11%       1213 ±194%  +2.6e+10%     257.50 ±223%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +3.9e+103%      38.58 ±223%   +2e+104%     204.12 ±195% +4.2e+103%      42.32 ±223%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.38 ±  7%      +2.5%       0.38 ± 20%      +6.2%       0.40 ±  9%      +4.9%       0.39 ± 14%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.00           +16.7%       1.17 ± 31%     +50.0%       1.50 ± 50%     +16.7%       1.17 ± 31%  sched_debug.cfs_rq:/.h_nr_running.max
      0.48            +1.2%       0.49 ±  5%     +11.9%       0.54 ± 18%      +2.1%       0.49 ±  5%  sched_debug.cfs_rq:/.h_nr_running.stddev
     12494 ± 12%    +116.3%      27023 ±127%    +233.4%      41649 ±100%     +82.8%      22835 ± 97%  sched_debug.cfs_rq:/.load.avg
     75908 ± 19%    +439.3%     409337 ±184%    +891.2%     752426 ±102%    +439.5%     409546 ±184%  sched_debug.cfs_rq:/.load.max
     19774 ± 14%    +296.1%      78327 ±170%    +652.3%     148767 ±111%    +270.2%      73197 ±164%  sched_debug.cfs_rq:/.load.stddev
    578.02 ± 19%      -0.3%     576.30 ± 13%      -5.5%     546.25 ± 12%      +1.1%     584.47 ± 13%  sched_debug.cfs_rq:/.load_avg.avg
     15247 ± 18%      -1.5%      15011 ± 19%     -11.6%      13473 ± 17%      +2.9%      15681 ± 22%  sched_debug.cfs_rq:/.load_avg.max
      0.00       +1.7e+101%       0.17 ±223% +2.7e+102%       2.67 ±155% +1.7e+101%       0.17 ±223%  sched_debug.cfs_rq:/.load_avg.min
      2499 ± 18%      -1.3%       2466 ± 19%     -11.4%       2214 ± 17%      +3.0%       2573 ± 22%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +6.5e+08%       6.52 ±223%  +4.2e+09%      41.57 ±200%  +7.2e+08%       7.15 ±223%  sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +2.3e+10%     234.76 ±223%  +1.2e+11%       1215 ±194%  +2.6e+10%     257.50 ±223%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
      0.00       +3.9e+103%      38.58 ±223%   +2e+104%     204.44 ±195% +4.2e+103%      42.32 ±223%  sched_debug.cfs_rq:/.max_vruntime.stddev
      3119            +0.6%       3138            -0.1%       3115            -0.4%       3105        sched_debug.cfs_rq:/.min_vruntime.avg
     26285 ± 24%      -4.2%      25171 ±  9%      -9.4%      23809 ± 12%     +13.8%      29914 ± 18%  sched_debug.cfs_rq:/.min_vruntime.max
    583.59 ± 13%     -13.1%     507.21 ± 29%      -2.4%     569.37 ± 21%      -0.6%     580.11 ± 22%  sched_debug.cfs_rq:/.min_vruntime.min
      5011 ± 12%      -0.3%       4995 ±  6%      -3.3%       4843 ±  6%      +5.9%       5309 ± 11%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.38 ±  9%      +1.2%       0.38 ± 20%      +4.9%       0.40 ±  9%      +3.7%       0.39 ± 14%  sched_debug.cfs_rq:/.nr_running.avg
      1.00           +16.7%       1.17 ± 31%     +50.0%       1.50 ± 50%     +16.7%       1.17 ± 31%  sched_debug.cfs_rq:/.nr_running.max
      0.48            +1.0%       0.49 ±  5%     +11.8%       0.54 ± 18%      +2.0%       0.49 ±  5%  sched_debug.cfs_rq:/.nr_running.stddev
     60.78 ± 73%     +15.3%      70.07 ± 30%     +39.0%      84.49 ± 54%      +7.2%      65.13 ± 53%  sched_debug.cfs_rq:/.removed.load_avg.avg
    847.17 ± 44%     +20.9%       1024           +20.0%       1016           +19.6%       1013        sched_debug.cfs_rq:/.removed.load_avg.max
    209.16 ± 52%     +21.2%     253.40 ± 13%     +27.9%     267.46 ± 26%     +13.2%     236.70 ± 26%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     28.57 ± 80%     -18.9%      23.18 ± 20%     +15.7%      33.06 ± 53%     -19.0%      23.13 ± 79%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    407.67 ± 47%      +6.1%     432.67 ± 21%     +19.5%     487.00 ± 13%      +1.6%     414.17 ± 26%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     97.01 ± 58%      -6.7%      90.52 ± 18%     +17.0%     113.54 ± 27%     -11.3%      86.03 ± 47%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     28.54 ± 80%     -19.1%      23.10 ± 21%     +15.7%      33.03 ± 53%     -19.0%      23.13 ± 79%  sched_debug.cfs_rq:/.removed.util_avg.avg
    407.67 ± 47%      +6.1%     432.50 ± 21%     +19.5%     487.00 ± 13%      +1.6%     414.17 ± 26%  sched_debug.cfs_rq:/.removed.util_avg.max
     96.92 ± 58%      -6.8%      90.35 ± 18%     +17.1%     113.45 ± 27%     -11.2%      86.03 ± 47%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    640.06 ±  5%      -4.2%     612.95 ±  5%      -4.1%     613.69 ±  2%      -2.2%     625.70 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
      1768 ± 14%      -3.4%       1707 ± 28%     -11.0%       1573 ± 10%     -12.6%       1546 ± 17%  sched_debug.cfs_rq:/.runnable_avg.max
      4.50 ±114%     -51.9%       2.17 ± 67%    +188.9%      13.00 ±129%     -51.9%       2.17 ± 90%  sched_debug.cfs_rq:/.runnable_avg.min
    395.40 ± 15%      -4.6%     377.34 ± 16%      -9.4%     358.33 ± 13%      -5.0%     375.55 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00          -100.0%       0.00       +5.6e+100%       0.06 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.avg
      0.00          -100.0%       0.00         +2e+102%       2.00 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.max
      0.00          -100.0%       0.00       +3.3e+101%       0.33 ±223%    -100.0%       0.00        sched_debug.cfs_rq:/.spread.stddev
    -14883           +48.2%     -22063           +29.6%     -19283           +53.9%     -22910        sched_debug.cfs_rq:/.spread0.avg
      8282 ±102%    -100.0%       0.00           -82.8%       1425 ±223%     -52.8%       3911 ±147%  sched_debug.cfs_rq:/.spread0.max
    -17419           +41.8%     -24694           +25.3%     -21831           +46.0%     -25434        sched_debug.cfs_rq:/.spread0.min
      5011 ± 12%      -0.2%       5000 ±  6%      -3.3%       4845 ±  6%      +6.0%       5311 ± 11%  sched_debug.cfs_rq:/.spread0.stddev
    637.04 ±  4%      -4.2%     610.38 ±  5%      -4.2%     610.13 ±  2%      -2.1%     623.50 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
      1754 ± 14%      -2.8%       1705 ± 28%     -10.9%       1563 ± 10%     -12.1%       1542 ± 17%  sched_debug.cfs_rq:/.util_avg.max
      4.50 ±114%     -48.1%       2.33 ± 68%    +177.8%      12.50 ±130%     -48.1%       2.33 ± 80%  sched_debug.cfs_rq:/.util_avg.min
    393.57 ± 15%      -4.3%     376.48 ± 16%      -9.2%     357.21 ± 13%      -4.9%     374.33 ±  9%  sched_debug.cfs_rq:/.util_avg.stddev
     49.30 ± 25%     +26.5%      62.35 ± 26%      +2.5%      50.52 ± 30%     +19.9%      59.13 ± 20%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    480.33 ±  2%      +1.9%     489.67 ±  5%      +0.3%     481.67 ±  4%      -0.1%     480.00        sched_debug.cfs_rq:/.util_est_enqueued.max
    137.46 ± 11%      +9.5%     150.45 ± 12%      -2.8%     133.61 ± 17%      +4.5%     143.58 ±  9%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    514038 ±  4%      -5.7%     484867 ±  4%      -2.7%     500266 ±  4%      -2.7%     500011 ±  6%  sched_debug.cpu.avg_idle.avg
    983370 ±  2%      -3.6%     947898 ±  5%      +1.7%    1000000            -0.2%     981583 ±  4%  sched_debug.cpu.avg_idle.max
      4135 ± 51%     +22.8%       5080 ± 92%      -8.9%       3766 ± 42%     -39.0%       2523 ±  6%  sched_debug.cpu.avg_idle.min
    222213 ±  8%      -2.3%     217115 ± 13%      +6.5%     236632 ±  5%     +11.3%     247333 ±  9%  sched_debug.cpu.avg_idle.stddev
     29673 ±  2%      -1.5%      29236 ±  2%      -2.0%      29078            -1.2%      29319        sched_debug.cpu.clock.avg
     29674 ±  2%      -1.5%      29237 ±  2%      -2.0%      29079            -1.2%      29321        sched_debug.cpu.clock.max
     29672 ±  2%      -1.5%      29234 ±  2%      -2.0%      29076            -1.2%      29318        sched_debug.cpu.clock.min
      0.73 ±  6%      +0.3%       0.73 ± 16%      -6.8%       0.68 ±  9%     +12.2%       0.82 ± 10%  sched_debug.cpu.clock.stddev
     29648 ±  2%      -1.5%      29211 ±  2%      -2.0%      29052            -1.2%      29294        sched_debug.cpu.clock_task.avg
     29669 ±  2%      -1.5%      29231 ±  2%      -2.0%      29074            -1.2%      29314        sched_debug.cpu.clock_task.max
     29254 ±  2%      -1.5%      28809 ±  2%      -2.1%      28647            -1.3%      28886        sched_debug.cpu.clock_task.min
     67.93 ±  3%      +1.9%      69.25            +2.8%      69.82            +3.0%      69.94        sched_debug.cpu.clock_task.stddev
      1227 ±  7%      -3.6%       1183 ± 11%      -3.4%       1185 ±  9%      -6.0%       1153 ± 11%  sched_debug.cpu.curr->pid.avg
      3300            +0.0%       3301            -0.1%       3298            -0.0%       3300        sched_debug.cpu.curr->pid.max
      1552            -1.2%       1534 ±  2%      -0.9%       1538 ±  2%      -1.5%       1529 ±  2%  sched_debug.cpu.curr->pid.stddev
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.avg
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.max
      4294            -0.0%       4294            -0.0%       4294            -0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 19%     +17.3%       0.00 ± 17%     +10.7%       0.00 ± 15%      -4.5%       0.00 ± 14%  sched_debug.cpu.next_balance.stddev
      0.38 ±  5%      +0.0%       0.38 ± 15%      +4.9%       0.40 ±  6%      -2.4%       0.37 ± 14%  sched_debug.cpu.nr_running.avg
      1.00            +0.0%       1.00           +66.7%       1.67 ± 66%     +16.7%       1.17 ± 31%  sched_debug.cpu.nr_running.max
      0.48            -0.7%       0.48 ±  2%     +13.0%       0.55 ± 20%      +0.7%       0.49 ±  6%  sched_debug.cpu.nr_running.stddev
      5023            -0.2%       5014            -0.2%       5015            -0.4%       5002        sched_debug.cpu.nr_switches.avg
     24386 ± 17%     +20.5%      29387 ± 16%      +6.6%      25995 ± 23%     +17.5%      28659 ± 32%  sched_debug.cpu.nr_switches.max
    467.33 ± 24%      +9.9%     513.50 ± 29%      -8.6%     427.33 ± 24%      +5.0%     490.50 ± 35%  sched_debug.cpu.nr_switches.min
      5311 ±  6%     +16.6%       6192 ±  7%      +9.7%       5828 ± 16%     +14.4%       6075 ± 19%  sched_debug.cpu.nr_switches.stddev
      0.00        -4.6e+99%      -0.00        +9.3e+99%       0.01 ±141%    -100.0%       0.00        sched_debug.cpu.nr_uninterruptible.avg
     14.33 ± 19%      +8.1%      15.50 ± 11%      +2.3%      14.67 ± 22%     -14.0%      12.33 ± 32%  sched_debug.cpu.nr_uninterruptible.max
     -8.50            +7.8%      -9.17           +17.6%     -10.00           +13.7%      -9.67        sched_debug.cpu.nr_uninterruptible.min
      4.95 ± 10%      +2.6%       5.08 ±  9%      -1.2%       4.89 ± 10%      -5.1%       4.70 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
     29672 ±  2%      -1.5%      29235 ±  2%      -2.0%      29077            -1.2%      29318        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            -0.0%  4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
     29621 ±  2%      -1.5%      29183 ±  2%      -2.0%      29025            -1.2%      29267        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
     29694 ±  2%      -1.5%      29257 ±  2%      -2.0%      29099            -1.2%      29340        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
      9.87 ±  9%      -0.6        9.23 ±  2%      -0.3        9.58 ±  4%      -0.4        9.42 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
      9.85 ±  9%      -0.6        9.21 ±  2%      -0.3        9.56 ±  4%      -0.4        9.41 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      9.83 ±  9%      -0.6        9.19 ±  2%      -0.3        9.54 ±  4%      -0.5        9.37 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      9.92 ±  9%      -0.6        9.29 ±  2%      -0.3        9.65 ±  4%      -0.4        9.47 ±  3%  perf-profile.calltrace.cycles-pp.mount
      8.94 ±  9%      -0.5        8.39 ±  2%      -0.2        8.70 ±  3%      -0.4        8.54 ±  3%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
      0.48 ± 45%      -0.5        0.00            -0.0        0.47 ± 45%      -0.0        0.47 ± 45%  perf-profile.calltrace.cycles-pp.device_read_db_internal_filename
      0.46 ± 44%      -0.5        0.00            -0.1        0.35 ± 70%      -0.1        0.37 ± 71%  perf-profile.calltrace.cycles-pp.strcmp@plt
      0.62 ± 10%      -0.4        0.19 ±141%      -0.1        0.50 ± 46%      -0.2        0.42 ± 73%  perf-profile.calltrace.cycles-pp.__do_softirq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.38 ± 71%      -0.4        0.00            -0.3        0.10 ±223%      -0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
      0.37 ± 71%      -0.4        0.00            -0.2        0.18 ±141%      -0.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      0.36 ± 71%      -0.4        0.00            -0.3        0.09 ±223%      -0.4        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      2.81 ± 11%      -0.4        2.46 ±  9%      -0.1        2.68 ±  5%      -0.0        2.81 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      2.80 ± 11%      -0.3        2.45 ±  9%      -0.1        2.67 ±  5%      -0.0        2.80 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.77 ± 11%      -0.3        2.42 ±  9%      -0.1        2.64 ±  5%      -0.0        2.77 ±  8%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.78 ± 11%      -0.3        2.44 ±  9%      -0.1        2.66 ±  5%      -0.0        2.78 ±  8%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.85 ± 11%      -0.3        2.51 ±  9%      -0.1        2.74 ±  5%      +0.0        2.86 ±  8%  perf-profile.calltrace.cycles-pp.read
      3.34 ±  9%      -0.3        3.01 ±  6%      -0.2        3.17 ±  8%      -0.1        3.28 ±  7%  perf-profile.calltrace.cycles-pp.sd_device_new_from_syspath
      2.58 ± 11%      -0.3        2.25 ±  9%      -0.1        2.46 ±  5%      -0.0        2.58 ±  9%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.94 ±  7%      -0.3        3.62 ±  2%      -0.1        3.84 ±  5%      -0.0        3.90 ±  5%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.99 ±  8%      -0.3        2.68 ±  6%      -0.2        2.81 ±  8%      -0.1        2.92 ±  7%  perf-profile.calltrace.cycles-pp.device_set_syspath.sd_device_new_from_syspath
      3.86 ±  7%      -0.3        3.55 ±  2%      -0.1        3.74 ±  4%      -0.1        3.81 ±  5%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.40 ± 71%      -0.3        0.09 ±223%      -0.1        0.28 ±100%      -0.0        0.36 ± 71%  perf-profile.calltrace.cycles-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
     10.21 ±  8%      -0.3        9.90 ±  2%      -0.2        9.99 ±  4%      +0.2       10.38 ±  2%  perf-profile.calltrace.cycles-pp.umount2
      1.99 ± 13%      -0.3        1.70 ±  9%      -0.1        1.90 ±  6%      -0.1        1.94 ±  8%  perf-profile.calltrace.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
      0.67 ±  7%      -0.3        0.38 ± 71%      -0.1        0.54 ± 45%      -0.0        0.63 ± 16%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.58 ± 45%      -0.3        0.29 ±100%      +0.0        0.60 ± 11%      -0.1        0.51 ± 44%  perf-profile.calltrace.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
      9.84 ±  8%      -0.3        9.57 ±  2%      -0.2        9.64 ±  4%      +0.2       10.02 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
      9.78 ±  8%      -0.3        9.53 ±  2%      -0.2        9.60 ±  4%      +0.2        9.98 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.35 ± 70%      -0.3        0.09 ±223%      -0.2        0.18 ±141%      +0.0        0.37 ± 71%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      3.48 ± 10%      -0.2        3.27 ±  3%      -0.2        3.30 ±  2%      -0.2        3.32 ±  3%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
      3.50 ± 10%      -0.2        3.29 ±  3%      -0.2        3.31 ±  2%      -0.2        3.35 ±  3%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.80 ±  6%      -0.2        2.59 ±  3%      -0.0        2.76 ±  3%      -0.1        2.74 ±  6%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      1.41 ± 10%      -0.2        1.20 ±  4%      -0.1        1.34 ±  9%      -0.1        1.33 ±  7%  perf-profile.calltrace.cycles-pp.malloc
      2.88 ±  7%      -0.2        2.67 ±  2%      -0.0        2.83 ±  4%      -0.1        2.80 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      2.86 ±  7%      -0.2        2.66 ±  2%      -0.0        2.82 ±  4%      -0.1        2.79 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.82 ±  7%      -0.2        2.62 ±  2%      -0.0        2.79 ±  3%      -0.0        2.77 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      0.39 ± 71%      -0.2        0.19 ±142%      -0.3        0.09 ±223%      -0.1        0.28 ±100%  perf-profile.calltrace.cycles-pp.rdrand
      2.97 ±  7%      -0.2        2.77 ±  3%      -0.0        2.94 ±  4%      -0.1        2.91 ±  5%  perf-profile.calltrace.cycles-pp.open64
      0.36 ± 71%      -0.2        0.18 ±141%      +0.1        0.45 ± 45%      -0.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
      0.18 ±141%      -0.2        0.00            +0.2        0.35 ± 70%      -0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.down_write.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      0.18 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt
      0.18 ±141%      -0.2        0.00            -0.2        0.00            -0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      2.12 ±  8%      -0.2        1.94 ±  6%      -0.1        2.03 ±  8%      -0.0        2.11 ±  8%  perf-profile.calltrace.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
      0.18 ±141%      -0.2        0.00            -0.1        0.09 ±223%      -0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.__fxstat64
      0.17 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.writeback_inodes_sb.sync_filesystem.generic_shutdown_super.kill_litter_super.deactivate_locked_super
      0.17 ±141%      -0.2        0.00            -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_lock_mount.do_new_mount.__x64_sys_mount
      3.92 ±  7%      -0.2        3.75 ±  3%      -0.1        3.82 ±  3%      -0.1        3.87 ±  3%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.26 ±100%      -0.2        0.09 ±223%      -0.0        0.26 ±100%      +0.0        0.28 ±100%  perf-profile.calltrace.cycles-pp.path_compare
      0.25 ±100%      -0.2        0.08 ±223%      -0.2        0.10 ±223%      +0.0        0.27 ±100%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
      4.02 ±  7%      -0.2        3.86 ±  3%      -0.1        3.95 ±  3%      -0.0        3.97 ±  3%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.23 ± 10%      -0.2        3.08 ±  4%      -0.0        3.19 ±  4%      -0.1        3.14 ±  3%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.97 ±  9%      -0.2        1.82 ±  6%      -0.1        1.89 ±  7%      -0.0        1.94 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      6.71 ±  8%      -0.1        6.56            -0.2        6.55 ±  5%      +0.2        6.89 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.96 ±  9%      -0.1        1.81 ±  6%      -0.1        1.88 ±  8%      -0.0        1.94 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
      2.66 ± 11%      -0.1        2.51 ±  5%      -0.1        2.60 ±  5%      -0.1        2.52 ±  2%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
      0.64 ± 14%      -0.1        0.49 ± 45%      -0.0        0.62 ± 11%      -0.0        0.60 ±  6%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64
      2.74 ± 10%      -0.1        2.60 ±  5%      -0.0        2.70 ±  5%      -0.1        2.60 ±  2%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
      2.68 ± 10%      -0.1        2.54 ±  5%      -0.0        2.63 ±  5%      -0.1        2.54 ±  2%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
      1.92 ±  8%      -0.1        1.78 ±  6%      -0.1        1.84 ±  7%      -0.0        1.89 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath
      1.90 ±  8%      -0.1        1.76 ±  6%      -0.1        1.81 ±  7%      -0.0        1.88 ±  8%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64
      0.79 ± 11%      -0.1        0.66 ±  9%      -0.1        0.73 ± 11%      -0.0        0.77 ± 11%  perf-profile.calltrace.cycles-pp.readlinkat
      2.82 ± 10%      -0.1        2.69 ±  4%      -0.0        2.78 ±  4%      -0.1        2.69 ±  2%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
      0.76 ± 10%      -0.1        0.63 ±  9%      -0.1        0.70 ± 12%      -0.0        0.74 ± 10%  perf-profile.calltrace.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.76 ± 11%      -0.1        0.63 ±  9%      -0.1        0.70 ± 12%      -0.0        0.74 ±  9%  perf-profile.calltrace.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      1.58 ±  9%      -0.1        1.44 ±  4%      -0.1        1.50 ±  2%      -0.0        1.54 ±  4%  perf-profile.calltrace.cycles-pp.__close
      0.77 ± 10%      -0.1        0.64 ±  9%      -0.1        0.70 ± 12%      -0.0        0.75 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
      0.93 ± 11%      -0.1        0.80 ±  2%      -0.1        0.84 ±  3%      -0.1        0.84 ±  7%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.77 ± 11%      -0.1        0.64 ±  9%      -0.1        0.70 ± 12%      -0.0        0.75 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
      1.48 ± 10%      -0.1        1.36 ±  8%      -0.1        1.38 ±  9%      -0.0        1.44 ±  7%  perf-profile.calltrace.cycles-pp.siphash24_compress
      2.28 ± 11%      -0.1        2.16 ±  3%      -0.0        2.25 ±  6%      -0.1        2.14 ±  2%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
      0.47 ± 45%      -0.1        0.37 ± 70%      +0.0        0.48 ± 45%      -0.2        0.28 ±100%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
      3.02 ±  8%      -0.1        2.92 ±  4%      -0.0        3.00 ±  3%      +0.0        3.03 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      3.00 ±  8%      -0.1        2.91 ±  4%      -0.0        2.98 ±  4%      +0.0        3.02 ±  3%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.48 ± 12%      -0.1        1.39 ±  6%      -0.0        1.44 ±  8%      -0.1        1.39 ±  3%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
      0.36 ± 70%      -0.1        0.26 ±100%      -0.1        0.27 ±100%      +0.0        0.37 ± 70%  perf-profile.calltrace.cycles-pp.__xstat64
      0.94 ±  6%      -0.1        0.85 ±  6%      -0.0        0.92 ± 10%      -0.0        0.92 ±  4%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.37 ± 71%      -0.1        0.28 ±100%      -0.1        0.28 ±100%      +0.0        0.39 ± 70%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64
      0.18 ±141%      -0.1        0.09 ±223%      -0.1        0.10 ±223%      +0.2        0.37 ± 71%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath
      2.75 ±  7%      -0.1        2.66 ±  5%      +0.0        2.76 ±  3%      +0.0        2.76 ±  4%  perf-profile.calltrace.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.17 ±141%      -0.1        0.09 ±223%      -0.2        0.00            -0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.09 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.get_nr_dirty_inodes.writeback_inodes_sb.sync_filesystem.generic_shutdown_super.kill_litter_super
      0.09 ±223%      -0.1        0.00            -0.0        0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.queue_work_on.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount
      1.33 ± 10%      -0.1        1.25 ±  6%      -0.1        1.27 ±  3%      -0.1        1.28 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      0.08 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.08 ±223%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.list_lru_destroy.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      1.58 ±  6%      -0.1        1.50 ±  6%      +0.0        1.59 ±  5%      -0.0        1.57 ±  4%  perf-profile.calltrace.cycles-pp.symlink
      4.29 ±  9%      -0.1        4.20 ±  3%      -0.2        4.13 ±  5%      +0.1        4.40 ±  2%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±141%      -0.1        0.09 ±223%      +0.0        0.18 ±141%      +0.1        0.27 ±100%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      1.35 ± 10%      -0.1        1.27 ±  5%      -0.0        1.30 ±  3%      -0.0        1.30 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      1.52 ±  5%      -0.1        1.44 ±  6%      +0.0        1.53 ±  5%      -0.0        1.50 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.72 ± 14%      -0.1        0.64 ±  8%      -0.0        0.70 ± 11%      -0.1        0.66 ±  6%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.53 ±  5%      -0.1        1.46 ±  6%      +0.0        1.54 ±  5%      -0.0        1.51 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      1.54 ±  5%      -0.1        1.46 ±  6%      +0.0        1.55 ±  6%      -0.0        1.52 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
      1.07 ±  9%      -0.1        1.00 ±  7%      -0.1        1.02 ±  4%      -0.0        1.03 ±  7%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      1.26 ±  9%      -0.1        1.19 ±  5%      -0.0        1.24 ±  4%      -0.0        1.26 ±  4%  perf-profile.calltrace.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.74 ± 12%      -0.1        0.67 ±  8%      +0.0        0.75 ±  6%      -0.0        0.72 ± 10%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      1.92 ±  8%      -0.1        1.84 ±  5%      -0.0        1.90 ±  4%      +0.1        1.98 ±  2%  perf-profile.calltrace.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      1.06 ± 10%      -0.1        0.99 ±  7%      -0.1        1.00 ±  4%      -0.0        1.01 ±  7%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      0.76 ±  6%      -0.1        0.69 ±  6%      -0.0        0.75 ± 11%      -0.0        0.74 ±  5%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      4.74 ±  8%      -0.1        4.67 ±  2%      -0.1        4.60 ±  6%      +0.1        4.85 ±  2%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
      0.36 ± 70%      -0.1        0.29 ±100%      -0.1        0.29 ±101%      +0.2        0.58 ± 45%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single
      1.36 ±  6%      -0.1        1.29 ±  6%      +0.0        1.37 ±  4%      -0.0        1.34 ±  6%  perf-profile.calltrace.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
      0.87 ± 11%      -0.1        0.81 ±  8%      +0.0        0.90 ±  5%      -0.0        0.86 ±  9%  perf-profile.calltrace.cycles-pp.rmdir
      2.37 ± 10%      -0.1        2.30 ±  5%      -0.2        2.22 ±  8%      +0.1        2.48 ±  5%  perf-profile.calltrace.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      1.07 ± 12%      -0.1        1.01 ±  6%      -0.1        1.00 ±  6%      -0.0        1.03 ±  5%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      2.04 ± 11%      -0.1        1.98 ±  4%      -0.1        1.94 ±  3%      -0.1        1.98 ±  3%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.81 ± 11%      -0.1        0.75 ±  8%      +0.0        0.84 ±  5%      -0.0        0.80 ±  9%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      0.81 ± 11%      -0.1        0.76 ±  7%      +0.0        0.85 ±  5%      -0.0        0.81 ±  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
      1.04 ±  9%      -0.1        0.99 ±  4%      -0.0        1.02 ±  5%      -0.0        1.01 ±  4%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
      2.92 ± 11%      -0.1        2.86 ±  4%      -0.0        2.90 ±  5%      -0.0        2.90 ±  3%  perf-profile.calltrace.cycles-pp.stress_rndstr
      0.83 ±  8%      -0.1        0.78 ± 10%      -0.0        0.80 ±  6%      -0.0        0.80 ±  8%  perf-profile.calltrace.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.78 ± 11%      -0.1        1.73 ±  5%      -0.0        1.75 ±  4%      -0.0        1.73 ±  7%  perf-profile.calltrace.cycles-pp.unlink
      0.82 ± 11%      -0.1        0.76 ±  7%      +0.0        0.85 ±  6%      -0.0        0.81 ±  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
      0.73 ±  9%      -0.1        0.68 ±  5%      -0.1        0.66 ±  3%      -0.0        0.68 ±  7%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.61 ±  7%      -0.0        1.56 ±  5%      -0.0        1.59 ±  5%      -0.0        1.60 ±  6%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      1.50 ± 12%      -0.0        1.46 ±  5%      -0.0        1.47 ±  5%      -0.0        1.48 ±  7%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.82 ±  9%      -0.0        0.77 ±  7%      -0.0        0.78 ± 11%      +0.0        0.84 ±  8%  perf-profile.calltrace.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.74 ±  8%      -0.0        0.70 ±  6%      +0.0        0.75 ±  6%      +0.0        0.78 ±  7%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.86 ± 10%      -0.0        1.82 ±  4%      -0.1        1.78 ±  3%      -0.1        1.80 ±  3%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
      0.93 ±  8%      -0.0        0.89 ±  5%      +0.0        0.95 ±  8%      +0.1        0.98 ±  6%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.49 ± 45%      -0.0        0.45 ± 44%      +0.0        0.50 ± 45%      +0.1        0.57 ±  6%  perf-profile.calltrace.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.98 ±  8%      -0.0        0.94 ±  6%      -0.0        0.94 ±  7%      -0.0        0.94 ±  6%  perf-profile.calltrace.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
      1.21 ± 13%      -0.0        1.17 ±  3%      -0.1        1.12 ±  7%      -0.1        1.15 ± 14%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.70 ± 11%      -0.0        1.66 ±  5%      -0.0        1.67 ±  5%      -0.0        1.65 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      1.21 ±  8%      -0.0        1.17 ±  5%      +0.0        1.23 ±  6%      +0.1        1.30 ±  3%  perf-profile.calltrace.cycles-pp.__lxstat64
      1.68 ± 11%      -0.0        1.65 ±  5%      -0.0        1.66 ±  4%      -0.1        1.63 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      1.10 ± 14%      -0.0        1.06 ±  5%      -0.1        1.01 ± 11%      -0.1        1.03 ± 12%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      1.30 ±  9%      -0.0        1.27 ±  5%      -0.1        1.23 ±  4%      -0.0        1.27 ±  5%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
      0.81 ± 13%      -0.0        0.78 ±  6%      -0.0        0.78 ±  5%      +0.0        0.81 ± 11%  perf-profile.calltrace.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount
      1.66 ± 11%      -0.0        1.63 ±  5%      -0.0        1.64 ±  4%      -0.0        1.62 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      1.11 ± 14%      -0.0        1.08 ±  5%      -0.1        1.02 ± 11%      -0.1        1.04 ± 13%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.93 ±  7%      -0.0        0.90 ±  7%      -0.0        0.91 ±  7%      -0.0        0.90 ±  6%  perf-profile.calltrace.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run
      1.65 ± 15%      -0.0        1.62 ±  2%      -0.0        1.62 ± 11%      -0.1        1.54 ± 11%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.42 ± 10%      -0.0        1.39 ±  5%      -0.1        1.34 ±  3%      -0.0        1.39 ±  5%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
      0.79 ± 11%      -0.0        0.76 ±  4%      +0.0        0.81 ±  4%      +0.0        0.81 ±  5%  perf-profile.calltrace.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.48 ± 44%      -0.0        0.46 ± 45%      -0.1        0.36 ± 71%      -0.1        0.39 ± 71%  perf-profile.calltrace.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64
      1.05 ±  9%      -0.0        1.04 ±  4%      +0.0        1.09 ±  8%      +0.1        1.13 ±  5%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.47 ± 45%      -0.0        0.45 ± 44%      -0.0        0.45 ± 44%      -0.2        0.28 ±100%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.10 ±  9%      -0.0        1.08 ±  4%      +0.0        1.13 ±  8%      +0.1        1.18 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.95 ± 14%      -0.0        0.93 ±  6%      -0.1        0.90 ±  5%      -0.0        0.93 ±  9%  perf-profile.calltrace.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      0.61 ± 10%      -0.0        0.60 ± 11%      -0.0        0.60 ±  9%      +0.0        0.66 ±  8%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±141%      -0.0        0.17 ±141%      +0.1        0.27 ±100%      +0.1        0.26 ±100%  perf-profile.calltrace.cycles-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
      0.76 ±  8%      -0.0        0.75 ±  7%      -0.0        0.71 ±  6%      -0.0        0.75 ±  6%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
      1.08 ±  9%      -0.0        1.07 ±  4%      +0.0        1.12 ±  7%      +0.1        1.17 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
      0.87 ± 13%      -0.0        0.86 ±  7%      +0.1        0.93 ±  3%      +0.0        0.88 ± 10%  perf-profile.calltrace.cycles-pp.stress_mwc32
      1.23 ± 10%      -0.0        1.23 ±  7%      -0.1        1.15 ± 12%      +0.2        1.40 ±  8%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount.__x64_sys_umount
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.08 ±223%  perf-profile.calltrace.cycles-pp.page_symlink.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.0        0.00            +0.0        0.00            +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +0.0        0.00            +0.3        0.33 ±100%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited_wait_once.synchronize_rcu_expedited_wait.rcu_exp_wait_wake.process_one_work.worker_thread
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      0.00            +0.0        0.00            +0.0        0.00            +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.26 ±100%      +0.0        0.26 ±100%      +0.0        0.27 ±100%      -0.1        0.18 ±141%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      0.08 ±223%      +0.0        0.08 ±223%      +0.0        0.10 ±223%      +0.1        0.19 ±141%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.4        0.36 ± 70%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.2        0.18 ±141%  perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      0.87 ± 16%      +0.0        0.87 ±  4%      -0.1        0.81 ± 13%      -0.0        0.84 ± 12%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
      0.18 ±223%      +0.0        0.19 ±223%      -0.1        0.09 ±223%      -0.2        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.79 ± 22%      +0.0        0.81 ±  7%      +0.1        0.84 ± 14%      +0.0        0.82 ± 11%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.55 ±  6%      +0.0        0.57 ±  5%      +0.0        0.57 ±  5%      -0.0        0.53 ± 45%  perf-profile.calltrace.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
      0.88 ± 11%      +0.0        0.90 ±  4%      +0.0        0.91 ±  7%      -0.0        0.86 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      0.88 ± 11%      +0.0        0.91 ±  4%      +0.0        0.92 ±  7%      -0.0        0.86 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
      0.92 ± 12%      +0.0        0.95 ±  5%      +0.0        0.96 ±  5%      -0.0        0.90 ±  6%  perf-profile.calltrace.cycles-pp.mkdir
      1.14 ±  6%      +0.0        1.17 ±  3%      +0.1        1.19 ±  7%      -0.1        1.09 ±  5%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
      0.86 ± 10%      +0.0        0.89 ±  4%      +0.0        0.91 ±  7%      -0.0        0.85 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      0.76 ± 12%      +0.0        0.80 ±  7%      +0.0        0.80 ±  7%      +0.0        0.76 ±  8%  perf-profile.calltrace.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
      1.13 ±  7%      +0.0        1.16 ±  3%      +0.1        1.18 ±  7%      -0.0        1.08 ±  5%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
      2.01 ± 15%      +0.0        2.04 ±  4%      +0.0        2.04 ± 10%      -0.1        1.93 ± 14%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.84 ± 22%      +0.0        0.88 ±  6%      +0.1        0.92 ± 13%      +0.0        0.87 ± 11%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      1.97 ± 15%      +0.0        2.01 ±  3%      +0.0        2.02 ± 10%      -0.1        1.91 ± 14%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.03 ± 20%      +0.0        1.07 ±  5%      +0.1        1.10 ± 11%      +0.0        1.05 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      1.03 ± 19%      +0.0        1.07 ±  5%      +0.1        1.10 ± 11%      +0.0        1.05 ± 10%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.92 ± 21%      +0.0        0.96 ±  6%      +0.1        1.00 ± 12%      +0.0        0.95 ± 11%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      0.86 ± 22%      +0.0        0.90 ±  7%      +0.1        0.94 ± 12%      +0.0        0.89 ± 11%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      1.18 ± 20%      +0.1        1.24 ±  5%      +0.1        1.27 ± 10%      +0.0        1.22 ±  9%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      1.19 ± 20%      +0.1        1.24 ±  5%      +0.1        1.28 ± 10%      +0.0        1.23 ±  9%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.33 ± 19%      +0.1        1.38 ±  5%      +0.1        1.43 ± 10%      +0.0        1.35 ±  9%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.36 ± 19%      +0.1        1.42 ±  5%      +0.1        1.47 ± 10%      +0.0        1.38 ±  9%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.33 ± 19%      +0.1        1.39 ±  4%      +0.1        1.43 ± 10%      +0.0        1.36 ±  9%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.29 ± 19%      +0.1        1.35 ±  5%      +0.1        1.39 ±  9%      +0.0        1.32 ±  9%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      1.39 ± 19%      +0.1        1.45 ±  5%      +0.1        1.49 ± 10%      +0.0        1.40 ±  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.40 ± 20%      +0.1        1.46 ±  5%      +0.1        1.50 ± 10%      +0.0        1.41 ±  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      3.95 ±  5%      +0.1        4.02            +0.0        3.97 ±  6%      +0.2        4.18 ±  7%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
      1.48 ± 20%      +0.1        1.55 ±  4%      +0.1        1.58 ± 10%      +0.0        1.49 ±  9%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      2.89 ± 10%      +0.1        2.96 ±  5%      +0.0        2.94 ±  7%      -0.0        2.85 ± 14%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.28 ±100%      +0.1        0.35 ± 70%      +0.1        0.37 ± 71%      +0.2        0.48 ± 45%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64
      3.14 ± 10%      +0.1        3.22 ±  5%      +0.1        3.23 ±  7%      -0.0        3.10 ± 13%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.52 ± 48%      +0.1        0.61 ±  8%      -0.1        0.39 ± 71%      -0.0        0.52 ± 45%  perf-profile.calltrace.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle
      0.00            +0.1        0.09 ±223%      +0.1        0.09 ±223%      +0.4        0.43 ± 72%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited_wait.rcu_exp_wait_wake.process_one_work.worker_thread.kthread
      0.00            +0.1        0.09 ±223%      +0.2        0.19 ±141%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus
      0.09 ±223%      +0.1        0.18 ±141%      +0.2        0.28 ±100%      +0.0        0.10 ±223%  perf-profile.calltrace.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp
      0.29 ±101%      +0.1        0.38 ± 71%      -0.1        0.20 ±142%      -0.1        0.18 ±141%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.53 ± 48%      +0.1        0.62 ±  6%      -0.1        0.40 ± 71%      -0.0        0.53 ± 45%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer
      3.27 ±  5%      +0.1        3.37            +0.0        3.29 ±  7%      +0.3        3.54 ±  6%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
      0.64 ± 16%      +0.1        0.79 ± 10%      +0.1        0.70 ± 17%      +0.4        1.02 ± 17%  perf-profile.calltrace.cycles-pp.rcu_exp_wait_wake.process_one_work.worker_thread.kthread.ret_from_fork
      0.00            +0.2        0.17 ±141%      +0.1        0.10 ±223%      +0.1        0.09 ±223%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.32 ±101%      +0.2        0.49 ± 46%      +0.0        0.32 ±102%      +0.5        0.83 ± 12%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.2        0.17 ±141%      +0.1        0.10 ±223%      +0.4        0.39 ± 70%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
      0.00            +0.2        0.18 ±141%      +0.1        0.10 ±223%      +0.2        0.18 ±142%  perf-profile.calltrace.cycles-pp.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
      0.39 ± 71%      +0.2        0.61 ±  6%      +0.2        0.62 ± 12%      +0.2        0.59 ± 10%  perf-profile.calltrace.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread
      0.09 ±223%      +0.3        0.36 ± 71%      +0.3        0.38 ± 71%      +0.3        0.37 ± 71%  perf-profile.calltrace.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work
      1.22 ± 15%      +0.4        1.59 ± 17%      +0.1        1.36 ± 26%      +0.2        1.44 ± 25%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
      1.24 ± 15%      +0.4        1.61 ± 17%      +0.1        1.39 ± 26%      +0.2        1.46 ± 25%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
      1.26 ± 15%      +0.4        1.64 ± 17%      +0.1        1.41 ± 26%      +0.2        1.48 ± 25%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.27 ± 15%      +0.4        1.65 ± 17%      +0.1        1.41 ± 26%      +0.2        1.48 ± 25%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      1.35 ± 15%      +0.4        1.75 ± 17%      +0.1        1.49 ± 25%      +0.2        1.56 ± 24%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
      5.37 ±  6%      +0.5        5.83 ±  5%      +0.2        5.53 ±  4%      +0.4        5.80 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork
      5.37 ±  6%      +0.5        5.83 ±  5%      +0.2        5.53 ±  4%      +0.4        5.80 ±  7%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
     28.06 ± 10%      +0.7       28.74 ±  4%      +1.1       29.17 ±  7%      +0.4       28.46 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     29.55 ± 10%      +0.7       30.27 ±  3%      +1.1       30.65 ±  7%      +0.5       30.02 ±  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     29.55 ± 10%      +0.7       30.27 ±  3%      +1.1       30.66 ±  7%      +0.5       30.02 ±  5%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     29.53 ± 10%      +0.7       30.25 ±  3%      +1.1       30.63 ±  7%      +0.5       30.01 ±  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     28.71 ± 10%      +0.8       29.46 ±  4%      +1.1       29.83 ±  7%      +0.4       29.12 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      6.74 ± 23%      +2.2        8.93 ± 17%      +0.1        6.83 ± 14%      -0.5        6.29 ± 22%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      6.75 ± 23%      +2.2        8.95 ± 17%      +0.1        6.84 ± 14%      -0.5        6.29 ± 22%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
     29.80 ±  9%      +2.8       32.57 ±  3%      +1.1       30.90 ±  8%      -0.1       29.71 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     34.56 ±  8%      +2.9       37.43 ±  2%      +1.2       35.72 ±  6%      -0.1       34.51 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     36.32 ±  8%      +2.9       39.24 ±  2%      +1.2       37.53 ±  5%      +0.0       36.32 ±  3%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     39.99 ±  5%      -2.1       37.90            -0.8       39.22 ±  3%      -0.4       39.57 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     39.74 ±  5%      -2.1       37.68            -0.8       38.98 ±  3%      -0.4       39.33 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
      9.83 ±  9%      -0.6        9.19 ±  2%      -0.3        9.54 ±  4%      -0.5        9.38 ±  3%  perf-profile.children.cycles-pp.__x64_sys_mount
      9.94 ±  9%      -0.6        9.30 ±  2%      -0.3        9.66 ±  4%      -0.5        9.49 ±  3%  perf-profile.children.cycles-pp.mount
      8.95 ±  9%      -0.6        8.40 ±  2%      -0.2        8.71 ±  3%      -0.4        8.55 ±  3%  perf-profile.children.cycles-pp.do_new_mount
      1.83 ± 11%      -0.4        1.41 ± 18%      -0.2        1.64 ± 10%      -0.4        1.46 ± 12%  perf-profile.children.cycles-pp.__irq_exit_rcu
      2.78 ± 11%      -0.4        2.43 ±  9%      -0.1        2.65 ±  5%      -0.0        2.78 ±  8%  perf-profile.children.cycles-pp.vfs_read
      2.80 ± 11%      -0.4        2.44 ±  9%      -0.1        2.66 ±  5%      -0.0        2.78 ±  8%  perf-profile.children.cycles-pp.ksys_read
      4.74 ±  6%      -0.3        4.39 ±  3%      -0.1        4.60 ±  4%      -0.1        4.65 ±  6%  perf-profile.children.cycles-pp.do_sys_openat2
      4.77 ±  7%      -0.3        4.43 ±  3%      -0.1        4.65 ±  4%      -0.1        4.69 ±  6%  perf-profile.children.cycles-pp.__x64_sys_openat
      2.86 ± 11%      -0.3        2.52 ±  9%      -0.1        2.74 ±  5%      +0.0        2.88 ±  8%  perf-profile.children.cycles-pp.read
      2.59 ± 11%      -0.3        2.26 ±  9%      -0.1        2.48 ±  5%      -0.0        2.58 ±  8%  perf-profile.children.cycles-pp.seq_read_iter
      3.34 ±  9%      -0.3        3.01 ±  6%      -0.2        3.17 ±  8%      -0.1        3.28 ±  7%  perf-profile.children.cycles-pp.sd_device_new_from_syspath
      3.90 ±  7%      -0.3        3.58 ±  2%      -0.1        3.78 ±  4%      -0.1        3.84 ±  5%  perf-profile.children.cycles-pp.path_openat
      3.97 ±  7%      -0.3        3.65 ±  2%      -0.1        3.86 ±  4%      -0.1        3.92 ±  5%  perf-profile.children.cycles-pp.do_filp_open
      3.00 ±  8%      -0.3        2.68 ±  6%      -0.2        2.81 ±  8%      -0.1        2.92 ±  7%  perf-profile.children.cycles-pp.device_set_syspath
     10.27 ±  8%      -0.3        9.96 ±  2%      -0.2       10.06 ±  4%      +0.2       10.45 ±  2%  perf-profile.children.cycles-pp.umount2
      2.00 ± 13%      -0.3        1.72 ±  8%      -0.1        1.91 ±  6%      -0.1        1.95 ±  8%  perf-profile.children.cycles-pp.show_mountinfo
      2.98 ±  6%      -0.2        2.75 ±  4%      -0.1        2.90 ±  4%      -0.0        2.96 ±  3%  perf-profile.children.cycles-pp.user_path_at_empty
      1.43 ± 10%      -0.2        1.21 ±  4%      -0.1        1.35 ±  8%      -0.1        1.34 ±  6%  perf-profile.children.cycles-pp.malloc
      3.48 ± 10%      -0.2        3.27 ±  3%      -0.2        3.30 ±  2%      -0.2        3.32 ±  3%  perf-profile.children.cycles-pp.vfs_get_super
      3.50 ± 10%      -0.2        3.29 ±  3%      -0.2        3.31 ±  2%      -0.2        3.35 ±  3%  perf-profile.children.cycles-pp.vfs_get_tree
      2.99 ±  7%      -0.2        2.79 ±  3%      -0.0        2.96 ±  4%      -0.1        2.93 ±  5%  perf-profile.children.cycles-pp.open64
      4.32 ±  5%      -0.2        4.12 ±  9%      -0.1        4.23 ±  7%      -0.4        3.96 ±  9%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.47 ±  9%      -0.2        3.27 ±  3%      -0.1        3.33 ±  5%      -0.1        3.34 ±  4%  perf-profile.children.cycles-pp.pcpu_alloc
      5.09 ±  4%      -0.2        4.90 ±  9%      -0.1        5.02 ±  5%      -0.5        4.58 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.92 ± 11%      -0.2        2.74 ±  4%      -0.0        2.88 ±  5%      -0.2        2.74 ±  3%  perf-profile.children.cycles-pp.alloc_vfsmnt
      1.16 ±  9%      -0.2        0.98 ±  6%      -0.1        1.08 ± 11%      -0.1        1.08 ±  8%  perf-profile.children.cycles-pp.__fxstat64
      2.16 ±  8%      -0.2        1.98 ±  6%      -0.1        2.07 ±  7%      +0.0        2.17 ±  8%  perf-profile.children.cycles-pp.openat64
      4.44 ±  7%      -0.2        4.27 ±  3%      -0.1        4.37 ±  3%      -0.0        4.41 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.69 ±  5%      -0.2        2.53 ±  4%      -0.0        2.67 ±  4%      -0.0        2.69 ±  5%  perf-profile.children.cycles-pp.link_path_walk
      3.04 ±  6%      -0.2        2.88 ±  3%      -0.1        2.97 ±  7%      +0.0        3.09 ±  5%  perf-profile.children.cycles-pp.path_lookupat
      4.08 ±  7%      -0.2        3.92 ±  3%      -0.1        4.00 ±  2%      -0.0        4.04 ±  3%  perf-profile.children.cycles-pp.task_work_run
      3.23 ± 10%      -0.2        3.08 ±  4%      -0.0        3.19 ±  4%      -0.1        3.15 ±  3%  perf-profile.children.cycles-pp.attach_recursive_mnt
      6.72 ±  8%      -0.1        6.56            -0.2        6.55 ±  5%      +0.2        6.89 ±  2%  perf-profile.children.cycles-pp.__x64_sys_umount
      2.74 ± 10%      -0.1        2.60 ±  5%      -0.0        2.70 ±  5%      -0.1        2.60 ±  2%  perf-profile.children.cycles-pp.propagate_one
      2.66 ± 11%      -0.1        2.52 ±  5%      -0.1        2.61 ±  5%      -0.1        2.53 ±  2%  perf-profile.children.cycles-pp.clone_mnt
      2.68 ± 10%      -0.1        2.54 ±  5%      -0.0        2.63 ±  5%      -0.1        2.54 ±  2%  perf-profile.children.cycles-pp.copy_tree
      1.37 ± 11%      -0.1        1.23 ±  4%      -0.0        1.36 ±  7%      -0.1        1.32 ±  7%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      0.82 ± 12%      -0.1        0.68 ± 10%      -0.1        0.76 ± 12%      -0.0        0.80 ±  9%  perf-profile.children.cycles-pp.do_readlinkat
      1.63 ±  9%      -0.1        1.50 ±  4%      -0.1        1.56 ±  2%      -0.0        1.59 ±  4%  perf-profile.children.cycles-pp.__close
      0.80 ± 11%      -0.1        0.66 ±  9%      -0.1        0.74 ± 12%      -0.0        0.77 ± 10%  perf-profile.children.cycles-pp.readlinkat
      0.76 ± 11%      -0.1        0.63 ±  9%      -0.1        0.70 ± 12%      -0.0        0.74 ±  9%  perf-profile.children.cycles-pp.__x64_sys_readlinkat
      1.95 ±  3%      -0.1        1.82 ±  3%      -0.1        1.88 ±  3%      -0.1        1.83 ±  4%  perf-profile.children.cycles-pp.strncpy_from_user
      0.93 ± 11%      -0.1        0.80 ±  2%      -0.1        0.84 ±  3%      -0.1        0.84 ±  7%  perf-profile.children.cycles-pp.shmem_fill_super
      1.50 ± 10%      -0.1        1.37 ±  9%      -0.1        1.40 ±  8%      -0.0        1.47 ±  7%  perf-profile.children.cycles-pp.siphash24_compress
      2.34 ±  6%      -0.1        2.21 ±  3%      -0.0        2.30 ±  7%      +0.0        2.39 ±  4%  perf-profile.children.cycles-pp.filename_lookup
      2.82 ± 10%      -0.1        2.70 ±  4%      -0.0        2.78 ±  4%      -0.1        2.69 ±  3%  perf-profile.children.cycles-pp.propagate_mnt
      2.54 ±  4%      -0.1        2.42 ±  4%      -0.0        2.54 ±  3%      -0.0        2.51 ±  3%  perf-profile.children.cycles-pp.getname_flags
      1.34 ±  7%      -0.1        1.22 ±  7%      -0.0        1.30 ±  6%      -0.1        1.29 ±  4%  perf-profile.children.cycles-pp.dput
      0.86 ± 12%      -0.1        0.74 ±  9%      -0.1        0.79 ±  7%      +0.0        0.86 ± 10%  perf-profile.children.cycles-pp.vsnprintf
      0.96 ± 10%      -0.1        0.84 ±  4%      +0.0        0.97 ±  7%      -0.0        0.91        perf-profile.children.cycles-pp.alloc_inode
      0.74 ± 13%      -0.1        0.65 ±  7%      -0.1        0.66 ±  9%      -0.1        0.65 ±  9%  perf-profile.children.cycles-pp.evict
      1.82 ±  8%      -0.1        1.72 ±  5%      -0.1        1.74 ±  9%      +0.0        1.86 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
      1.12 ± 12%      -0.1        1.02 ±  6%      +0.0        1.12 ±  5%      -0.0        1.08 ±  4%  perf-profile.children.cycles-pp.new_inode
      0.91 ± 10%      -0.1        0.82 ±  4%      -0.0        0.90 ±  7%      -0.0        0.87 ±  7%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
      0.84 ±  7%      -0.1        0.75 ±  6%      -0.1        0.79 ±  8%      -0.0        0.82 ± 11%  perf-profile.children.cycles-pp.alloc_empty_file
      0.94 ±  6%      -0.1        0.86 ±  6%      -0.0        0.92 ± 11%      -0.0        0.92 ±  4%  perf-profile.children.cycles-pp.open_last_lookups
      2.76 ±  7%      -0.1        2.67 ±  5%      +0.0        2.77 ±  3%      +0.0        2.77 ±  4%  perf-profile.children.cycles-pp.cleanup_mnt
      0.76 ±  9%      -0.1        0.68 ±  7%      -0.1        0.70 ± 12%      -0.0        0.72 ±  8%  perf-profile.children.cycles-pp.__do_sys_newfstat
      0.68 ±  8%      -0.1        0.59 ±  6%      -0.1        0.62 ± 10%      -0.1        0.61 ±  6%  perf-profile.children.cycles-pp.dentry_kill
      0.71 ± 10%      -0.1        0.62 ± 11%      -0.0        0.69 ± 16%      -0.1        0.64 ± 14%  perf-profile.children.cycles-pp.__slab_free
      1.05 ±  9%      -0.1        0.96 ±  2%      +0.0        1.06 ±  6%      +0.0        1.05 ±  8%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.71 ± 14%      -0.1        0.63 ±  8%      -0.0        0.68 ±  7%      -0.0        0.71 ± 10%  perf-profile.children.cycles-pp.seq_printf
      0.60 ± 10%      -0.1        0.51 ±  3%      -0.1        0.54 ± 11%      -0.0        0.58 ±  9%  perf-profile.children.cycles-pp.strcmp@plt
      0.56 ± 11%      -0.1        0.48 ±  8%      -0.0        0.54 ± 10%      -0.0        0.56 ±  7%  perf-profile.children.cycles-pp.device_read_db_internal_filename
      4.29 ±  9%      -0.1        4.21 ±  3%      -0.2        4.13 ±  5%      +0.1        4.40 ±  2%  perf-profile.children.cycles-pp.do_umount
      1.04 ±  8%      -0.1        0.96 ± 11%      -0.0        0.99 ± 16%      -0.1        0.97 ± 10%  perf-profile.children.cycles-pp.kmem_cache_free
      0.40 ± 12%      -0.1        0.32 ±  7%      -0.0        0.39 ± 10%      -0.0        0.38 ±  5%  perf-profile.children.cycles-pp.shmem_alloc_inode
      1.52 ±  5%      -0.1        1.44 ±  6%      +0.0        1.54 ±  5%      -0.0        1.50 ±  5%  perf-profile.children.cycles-pp.__x64_sys_symlink
      0.71 ± 10%      -0.1        0.63 ±  6%      -0.0        0.71 ±  6%      -0.0        0.68 ±  4%  perf-profile.children.cycles-pp.shmem_get_inode
      1.56 ±  8%      -0.1        1.48 ±  7%      -0.0        1.54 ±  6%      +0.0        1.56 ±  7%  perf-profile.children.cycles-pp.memset_orig
      1.59 ±  6%      -0.1        1.51 ±  5%      +0.0        1.60 ±  5%      -0.0        1.58 ±  4%  perf-profile.children.cycles-pp.symlink
      0.72 ± 14%      -0.1        0.64 ±  8%      -0.0        0.70 ± 11%      -0.1        0.66 ±  6%  perf-profile.children.cycles-pp.vfs_create_mount
      2.41 ± 10%      -0.1        2.34 ±  4%      -0.1        2.26 ±  8%      +0.1        2.51 ±  5%  perf-profile.children.cycles-pp.namespace_unlock
      0.88 ± 11%      -0.1        0.81 ±  8%      +0.0        0.91 ±  5%      -0.0        0.87 ±  9%  perf-profile.children.cycles-pp.rmdir
      0.48 ± 15%      -0.1        0.41 ±  8%      -0.0        0.44 ± 13%      -0.0        0.46 ± 15%  perf-profile.children.cycles-pp.siphash24_finalize
      0.62 ±  8%      -0.1        0.54 ±  5%      -0.1        0.56 ± 12%      -0.1        0.56 ±  6%  perf-profile.children.cycles-pp.__dentry_kill
      0.77 ±  7%      -0.1        0.70 ±  6%      -0.0        0.76 ± 11%      -0.0        0.74 ±  5%  perf-profile.children.cycles-pp.lookup_open
      0.74 ± 11%      -0.1        0.67 ±  8%      +0.0        0.75 ±  6%      -0.0        0.72 ± 10%  perf-profile.children.cycles-pp.do_rmdir
      4.90 ±  7%      -0.1        4.82 ±  4%      -0.0        4.86 ±  5%      +0.2        5.10 ±  5%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      4.79 ±  7%      -0.1        4.72 ±  3%      -0.0        4.76 ±  5%      +0.2        4.98 ±  5%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.34 ± 17%      -0.1        0.28 ± 12%      -0.0        0.33 ± 14%      -0.0        0.31 ±  7%  perf-profile.children.cycles-pp.seq_path_root
      4.74 ±  8%      -0.1        4.68 ±  2%      -0.1        4.60 ±  6%      +0.1        4.85 ±  2%  perf-profile.children.cycles-pp.path_umount
      2.05 ± 11%      -0.1        1.98 ±  4%      -0.1        1.94 ±  3%      -0.1        1.98 ±  3%  perf-profile.children.cycles-pp.sget_fc
      1.36 ±  6%      -0.1        1.29 ±  6%      +0.0        1.37 ±  4%      -0.0        1.34 ±  6%  perf-profile.children.cycles-pp.do_symlinkat
      0.86 ±  8%      -0.1        0.80 ±  7%      -0.1        0.80 ±  6%      -0.0        0.85 ±  6%  perf-profile.children.cycles-pp.__check_object_size
      0.70 ± 14%      -0.1        0.64 ±  8%      +0.0        0.71 ±  7%      -0.0        0.69 ±  7%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.48 ± 13%      -0.1        0.42 ±  7%      -0.1        0.41 ± 13%      -0.1        0.41 ±  8%  perf-profile.children.cycles-pp.vfs_fstat
      0.65 ±  9%      -0.1        0.59 ±  5%      +0.0        0.65 ±  5%      -0.0        0.64 ±  7%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      1.35 ± 11%      -0.1        1.29 ±  6%      -0.0        1.31 ±  6%      -0.0        1.33 ±  4%  perf-profile.children.cycles-pp.mntput_no_expire
      0.32 ± 21%      -0.1        0.26 ± 10%      -0.0        0.26 ± 16%      -0.0        0.28 ±  6%  perf-profile.children.cycles-pp.unit_name_is_valid
      0.81 ± 11%      -0.1        0.75 ±  8%      +0.0        0.84 ±  5%      -0.0        0.80 ± 10%  perf-profile.children.cycles-pp.__x64_sys_rmdir
      0.54 ± 10%      -0.1        0.48 ±  4%      +0.0        0.55 ±  5%      +0.0        0.57 ± 10%  perf-profile.children.cycles-pp.kmalloc_trace
      0.55 ± 11%      -0.1        0.50 ± 15%      -0.1        0.48 ±  8%      -0.0        0.50 ± 10%  perf-profile.children.cycles-pp.rdrand
      0.37 ± 10%      -0.1        0.32 ± 13%      +0.0        0.37 ± 12%      +0.0        0.37 ± 13%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      1.79 ± 12%      -0.1        1.74 ±  5%      -0.0        1.76 ±  5%      -0.0        1.76 ±  7%  perf-profile.children.cycles-pp.unlink
      0.83 ±  8%      -0.1        0.78 ± 10%      -0.0        0.80 ±  7%      -0.0        0.80 ±  8%  perf-profile.children.cycles-pp.vfs_symlink
      1.61 ±  7%      -0.1        1.56 ±  5%      -0.0        1.60 ±  5%      -0.0        1.60 ±  6%  perf-profile.children.cycles-pp.deactivate_locked_super
      1.28 ±  9%      -0.1        1.23 ±  6%      +0.0        1.29 ±  6%      -0.0        1.27 ±  5%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.34 ± 10%      -0.1        0.29 ± 14%      -0.0        0.31 ± 16%      -0.0        0.33 ± 13%  perf-profile.children.cycles-pp.vfs_readlink
      0.80 ±  7%      -0.1        0.75 ±  3%      -0.0        0.80 ±  9%      +0.0        0.80 ±  8%  perf-profile.children.cycles-pp.inode_permission
      1.14 ±  8%      -0.0        1.09 ±  7%      +0.0        1.15 ±  7%      +0.1        1.21 ±  9%  perf-profile.children.cycles-pp.walk_component
      0.39 ± 12%      -0.0        0.34 ± 10%      -0.0        0.36 ± 11%      -0.0        0.35 ± 11%  perf-profile.children.cycles-pp.do_open
      0.98 ±  8%      -0.0        0.93 ±  8%      -0.0        0.97 ±  7%      +0.0        1.03 ±  9%  perf-profile.children.cycles-pp.lookup_fast
      0.33 ± 12%      -0.0        0.28 ±  8%      +0.0        0.33 ± 11%      -0.0        0.31 ± 12%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.64 ± 11%      -0.0        0.60 ±  6%      -0.0        0.63 ±  8%      -0.0        0.64 ±  7%  perf-profile.children.cycles-pp.pcpu_alloc_area
      0.21 ±  8%      -0.0        0.16 ± 22%      -0.1        0.15 ± 16%      -0.0        0.16 ± 19%  perf-profile.children.cycles-pp.security_inode_getattr
      0.32 ± 17%      -0.0        0.27 ± 12%      -0.0        0.30 ± 18%      -0.0        0.27 ± 13%  perf-profile.children.cycles-pp.___slab_alloc
      0.96 ±  7%      -0.0        0.91 ±  6%      +0.0        0.98 ±  7%      -0.0        0.92 ±  8%  perf-profile.children.cycles-pp.down_write
      1.57 ±  9%      -0.0        1.52 ±  3%      -0.1        1.48 ±  4%      -0.1        1.51 ±  3%  perf-profile.children.cycles-pp._find_next_bit
      0.82 ±  7%      -0.0        0.77 ±  6%      -0.0        0.81 ±  5%      -0.0        0.79 ± 10%  perf-profile.children.cycles-pp.filename_create
      0.65 ± 15%      -0.0        0.61 ±  5%      -0.0        0.65 ±  3%      -0.0        0.62 ±  3%  perf-profile.children.cycles-pp.step_into
      0.24 ± 13%      -0.0        0.20 ±  9%      -0.0        0.20 ± 10%      -0.0        0.22 ± 11%  perf-profile.children.cycles-pp.__percpu_counter_init
      0.22 ± 15%      -0.0        0.18 ± 14%      -0.0        0.20 ± 18%      -0.0        0.20 ± 13%  perf-profile.children.cycles-pp.strchr
      0.42 ± 15%      -0.0        0.38 ±  9%      -0.0        0.38 ± 13%      -0.0        0.39 ±  7%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.57 ± 11%      -0.0        0.53 ±  7%      +0.0        0.59 ±  8%      +0.0        0.57 ±  6%  perf-profile.children.cycles-pp.do_lock_mount
      1.51 ± 12%      -0.0        1.46 ±  5%      -0.0        1.47 ±  5%      -0.0        1.48 ±  7%  perf-profile.children.cycles-pp.do_unlinkat
      0.32 ± 10%      -0.0        0.28 ±  7%      -0.0        0.31 ±  8%      -0.0        0.30 ± 14%  perf-profile.children.cycles-pp.lockref_put_return
      0.14 ± 13%      -0.0        0.10 ± 17%      -0.0        0.14 ± 18%      -0.0        0.13 ±  8%  perf-profile.children.cycles-pp._hashmap_first_key_and_value
      0.26 ± 16%      -0.0        0.22 ± 11%      -0.0        0.25 ± 15%      -0.0        0.25 ± 18%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.21 ± 16%      -0.0        0.17 ± 14%      -0.0        0.21 ± 15%      -0.0        0.20 ± 21%  perf-profile.children.cycles-pp.up_read
      0.85 ±  8%      -0.0        0.81 ±  3%      -0.1        0.80 ±  2%      -0.0        0.83 ±  6%  perf-profile.children.cycles-pp.__fput
      0.23 ± 14%      -0.0        0.19 ± 14%      -0.0        0.20 ± 24%      -0.0        0.20 ± 20%  perf-profile.children.cycles-pp.strchr@plt
      3.11 ± 12%      -0.0        3.07 ±  4%      -0.0        3.11 ±  5%      +0.0        3.12 ±  3%  perf-profile.children.cycles-pp.stress_rndstr
      0.94 ±  5%      -0.0        0.90 ±  7%      +0.0        0.95 ±  5%      -0.0        0.91 ±  6%  perf-profile.children.cycles-pp.__filename_parentat
      0.05 ± 46%      -0.0        0.01 ±223%      +0.0        0.05 ±  7%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.40 ±  9%      -0.0        0.36 ±  3%      -0.0        0.37 ± 15%      -0.0        0.36 ± 13%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
      0.72 ±  7%      -0.0        0.68 ±  5%      +0.0        0.74 ±  6%      -0.1        0.66 ±  9%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      0.08 ± 26%      -0.0        0.04 ± 72%      -0.0        0.07 ± 24%      -0.0        0.06 ± 48%  perf-profile.children.cycles-pp.d_set_mounted
      0.48 ± 18%      -0.0        0.44 ± 12%      -0.0        0.44 ± 11%      -0.0        0.46 ± 11%  perf-profile.children.cycles-pp.ida_alloc_range
      0.38 ± 16%      -0.0        0.34 ± 12%      -0.0        0.33 ± 11%      -0.0        0.37 ±  7%  perf-profile.children.cycles-pp.check_heap_object
      0.56 ±  6%      -0.0        0.52 ± 13%      -0.0        0.52 ±  8%      -0.0        0.55 ± 10%  perf-profile.children.cycles-pp.ramfs_symlink
      0.06 ± 51%      -0.0        0.02 ±141%      -0.0        0.04 ± 45%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.deactivate_super
      0.26 ±  7%      -0.0        0.22 ± 14%      -0.0        0.25 ± 18%      -0.0        0.24 ± 10%  perf-profile.children.cycles-pp.native_irq_return_iret
      1.25 ±  8%      -0.0        1.21 ±  5%      +0.0        1.27 ±  6%      +0.1        1.35 ±  3%  perf-profile.children.cycles-pp.__lxstat64
      1.86 ± 10%      -0.0        1.83 ±  4%      -0.1        1.78 ±  3%      -0.1        1.81 ±  3%  perf-profile.children.cycles-pp.alloc_super
      0.98 ±  8%      -0.0        0.95 ±  6%      -0.0        0.94 ±  7%      -0.0        0.94 ±  6%  perf-profile.children.cycles-pp.kill_litter_super
      0.29 ± 13%      -0.0        0.26 ± 14%      -0.0        0.25 ±  5%      -0.0        0.29 ± 15%  perf-profile.children.cycles-pp.shrink_dcache_for_umount
      0.38 ± 15%      -0.0        0.34 ±  9%      +0.0        0.40 ± 16%      +0.0        0.43 ±  8%  perf-profile.children.cycles-pp.cfree
      0.04 ± 73%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.object_path_is_valid
      0.13 ± 14%      -0.0        0.09 ± 20%      -0.0        0.08 ± 21%      -0.0        0.08 ± 34%  perf-profile.children.cycles-pp.common_perm_cond
      0.23 ± 23%      -0.0        0.20 ± 22%      -0.0        0.21 ± 12%      -0.0        0.21 ± 12%  perf-profile.children.cycles-pp._copy_from_user
      2.60 ±  6%      -0.0        2.56 ± 13%      -0.0        2.55 ± 17%      -0.2        2.41 ± 11%  perf-profile.children.cycles-pp.rcu_do_batch
      0.30 ±  6%      -0.0        0.26 ± 17%      -0.0        0.27 ± 11%      +0.0        0.31 ±  9%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.43 ± 14%      -0.0        0.39 ± 10%      +0.0        0.43 ± 14%      +0.0        0.43 ±  9%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
      1.67 ± 11%      -0.0        1.63 ±  5%      -0.0        1.64 ±  5%      -0.0        1.62 ±  7%  perf-profile.children.cycles-pp.__x64_sys_unlink
      0.28 ±  9%      -0.0        0.25 ± 16%      -0.0        0.25 ± 10%      +0.0        0.30 ± 10%  perf-profile.children.cycles-pp.dev_attr_show
      0.28 ±  8%      -0.0        0.24 ± 16%      -0.0        0.25 ± 11%      +0.0        0.29 ± 11%  perf-profile.children.cycles-pp.uevent_show
      0.29 ± 16%      -0.0        0.26 ± 16%      -0.0        0.26 ±  9%      -0.0        0.28 ± 14%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
      0.50 ± 12%      -0.0        0.47 ± 12%      -0.0        0.46 ± 14%      +0.0        0.52 ±  9%  perf-profile.children.cycles-pp.schedule_idle
      0.34 ± 16%      -0.0        0.31 ± 11%      -0.0        0.32 ± 17%      -0.0        0.31 ± 12%  perf-profile.children.cycles-pp.vfs_parse_fs_string
      0.21 ± 19%      -0.0        0.18 ±  7%      -0.0        0.20 ± 12%      -0.0        0.20 ± 24%  perf-profile.children.cycles-pp.show_type
      0.40 ± 11%      -0.0        0.37 ±  9%      -0.0        0.39 ±  6%      -0.0        0.40 ±  7%  perf-profile.children.cycles-pp.d_make_root
      0.77 ±  7%      -0.0        0.74 ±  5%      +0.0        0.80 ±  6%      -0.1        0.72 ±  8%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      1.81 ± 10%      -0.0        1.78 ±  3%      -0.1        1.73 ±  4%      +0.0        1.82 ±  4%  perf-profile.children.cycles-pp.mnt_get_count
      0.09 ±  5%      -0.0        0.06 ± 49%      -0.0        0.08 ± 24%      -0.0        0.08 ± 10%  perf-profile.children.cycles-pp.mnt_want_write
      0.07 ± 20%      -0.0        0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.05 ± 46%  perf-profile.children.cycles-pp.__mnt_want_write
      0.04 ± 72%      -0.0        0.01 ±223%      -0.0        0.02 ±144%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.get_partial_node
      0.40 ± 18%      -0.0        0.37 ± 15%      -0.0        0.35 ± 13%      -0.1        0.35 ± 15%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.12 ± 18%      -0.0        0.09 ± 21%      -0.0        0.09 ± 38%      -0.0        0.09 ± 22%  perf-profile.children.cycles-pp.string_hash_func
      0.16 ± 18%      -0.0        0.13 ± 10%      -0.0        0.15 ± 19%      -0.0        0.15 ± 13%  perf-profile.children.cycles-pp.mangle_path
      1.28 ± 11%      -0.0        1.25 ±  4%      -0.1        1.20 ± 10%      -0.1        1.21 ± 11%  perf-profile.children.cycles-pp.update_process_times
      0.13 ± 17%      -0.0        0.10 ± 10%      -0.0        0.12 ± 24%      -0.0        0.12 ± 16%  perf-profile.children.cycles-pp.__d_add
      0.09 ± 19%      -0.0        0.06 ± 47%      -0.0        0.07 ± 47%      -0.0        0.08 ± 25%  perf-profile.children.cycles-pp.path_hash_func
      0.18 ± 25%      -0.0        0.14 ± 21%      -0.0        0.16 ± 14%      +0.0        0.18 ± 11%  perf-profile.children.cycles-pp.sendmsg
      0.17 ± 12%      -0.0        0.14 ± 14%      -0.0        0.16 ± 16%      -0.0        0.16 ±  9%  perf-profile.children.cycles-pp.simple_lookup
      0.44 ± 10%      -0.0        0.40 ±  8%      -0.0        0.43 ± 11%      +0.0        0.44 ± 12%  perf-profile.children.cycles-pp.xas_store
      0.08 ± 26%      -0.0        0.05 ± 45%      -0.0        0.07 ± 14%      -0.0        0.08 ± 15%  perf-profile.children.cycles-pp.xas_start
      0.06 ± 18%      -0.0        0.03 ±100%      -0.0        0.04 ± 72%      -0.0        0.04 ± 73%  perf-profile.children.cycles-pp.vscnprintf
      0.22 ± 17%      -0.0        0.19 ± 10%      -0.0        0.18 ± 25%      -0.0        0.21 ± 13%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.22 ± 20%      -0.0        0.18 ± 10%      -0.0        0.21 ±  4%      -0.0        0.21 ± 18%  perf-profile.children.cycles-pp.number
      0.84 ±  6%      -0.0        0.81 ±  6%      +0.0        0.86 ±  6%      -0.0        0.82 ±  5%  perf-profile.children.cycles-pp.path_parentat
      1.41 ±  7%      -0.0        1.38 ±  3%      +0.0        1.42 ±  6%      +0.1        1.49 ±  5%  perf-profile.children.cycles-pp.vfs_fstatat
      3.01 ±  5%      -0.0        2.98 ± 11%      -0.0        2.96 ± 15%      -0.1        2.86 ± 11%  perf-profile.children.cycles-pp.__do_softirq
      0.13 ± 16%      -0.0        0.10 ± 16%      -0.0        0.12 ±  8%      -0.0        0.10 ± 19%  perf-profile.children.cycles-pp.generic_exec_single
      0.14 ± 18%      -0.0        0.11 ± 13%      -0.0        0.13 ±  8%      -0.0        0.13 ± 15%  perf-profile.children.cycles-pp.seq_puts
      0.13 ± 10%      -0.0        0.10 ± 21%      -0.0        0.10 ± 16%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.shmem_evict_inode
      0.28 ± 12%      -0.0        0.25 ± 12%      -0.0        0.25 ±  8%      -0.0        0.25 ±  8%  perf-profile.children.cycles-pp.strlen
      0.27 ± 10%      -0.0        0.24 ± 12%      -0.0        0.26 ± 15%      -0.0        0.26 ± 17%  perf-profile.children.cycles-pp.kernfs_iop_permission
      0.17 ± 10%      -0.0        0.14 ± 11%      -0.0        0.16 ± 22%      +0.0        0.18 ± 11%  perf-profile.children.cycles-pp.kfree
      0.06 ± 11%      -0.0        0.03 ±102%      -0.0        0.05 ± 80%      +0.0        0.08 ± 20%  perf-profile.children.cycles-pp.resched_curr
      0.08 ± 10%      -0.0        0.05 ± 72%      -0.0        0.07 ± 11%      -0.0        0.07 ± 32%  perf-profile.children.cycles-pp.path_simplify
      0.07 ± 16%      -0.0        0.04 ± 75%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.readlink_copy
      0.16 ± 14%      -0.0        0.13 ± 21%      -0.0        0.16 ± 20%      +0.0        0.18 ± 13%  perf-profile.children.cycles-pp.siphash24_init
      0.35 ±  9%      -0.0        0.32 ±  6%      -0.0        0.32 ±  9%      -0.0        0.34 ± 16%  perf-profile.children.cycles-pp.__check_heap_object
      0.03 ±102%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.check_stack_object
      0.06 ± 14%      -0.0        0.04 ± 71%      -0.0        0.06 ± 13%      -0.0        0.05 ± 47%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.03 ±100%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.93 ±  7%      -0.0        0.90 ±  6%      -0.0        0.91 ±  6%      -0.0        0.90 ±  6%  perf-profile.children.cycles-pp.generic_shutdown_super
      0.23 ± 18%      -0.0        0.20 ± 24%      -0.0        0.22 ± 19%      -0.0        0.20 ±  5%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.12 ± 14%      -0.0        0.09 ± 16%      -0.0        0.10 ± 18%      -0.0        0.08 ± 17%  perf-profile.children.cycles-pp.xas_descend
      0.29 ±  9%      -0.0        0.26 ±  6%      -0.0        0.28 ± 21%      +0.0        0.30 ± 12%  perf-profile.children.cycles-pp.generic_permission
      0.18 ± 19%      -0.0        0.15 ± 17%      +0.0        0.18 ± 22%      -0.0        0.17 ± 17%  perf-profile.children.cycles-pp.__d_path
      0.22 ± 13%      -0.0        0.19 ± 15%      +0.0        0.22 ±  7%      -0.0        0.20 ±  8%  perf-profile.children.cycles-pp.shmem_symlink
      0.34 ± 10%      -0.0        0.32 ± 11%      +0.0        0.36 ± 11%      +0.0        0.38 ±  7%  perf-profile.children.cycles-pp.__d_lookup
      0.56 ±  2%      -0.0        0.53 ±  3%      +0.0        0.60 ± 12%      +0.1        0.63 ±  4%  perf-profile.children.cycles-pp.__entry_text_start
      1.01 ±  6%      -0.0        0.98 ±  3%      -0.1        0.95 ± 12%      +0.0        1.03 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.15 ± 11%      -0.0        0.12 ± 17%      +0.0        0.15 ± 24%      -0.0        0.14 ± 17%  perf-profile.children.cycles-pp.strlen@plt
      0.36 ± 18%      -0.0        0.33 ±  8%      -0.0        0.33 ± 17%      -0.0        0.33 ±  8%  perf-profile.children.cycles-pp.do_dentry_open
      0.09 ± 19%      -0.0        0.07 ± 22%      -0.0        0.07 ± 17%      -0.0        0.08 ± 29%  perf-profile.children.cycles-pp.put_fs_context
      0.04 ± 73%      -0.0        0.02 ±142%      -0.0        0.03 ±100%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.__put_mountpoint
      0.12 ± 18%      -0.0        0.10 ± 15%      -0.0        0.12 ± 12%      -0.0        0.11 ± 20%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.03 ±100%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.try_charge_memcg
      0.06 ± 47%      -0.0        0.03 ±100%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.btrfs_show_options
      0.08 ± 29%      -0.0        0.06 ± 47%      -0.0        0.05 ± 75%      -0.0        0.08 ± 14%  perf-profile.children.cycles-pp.d_instantiate
      0.08 ± 22%      -0.0        0.05 ± 46%      -0.0        0.06 ± 47%      -0.0        0.06 ± 19%  perf-profile.children.cycles-pp.mnt_fstype_is_pseudofs
      2.66 ±  6%      -0.0        2.63 ± 13%      -0.0        2.62 ± 17%      -0.2        2.47 ± 11%  perf-profile.children.cycles-pp.rcu_core
      0.53 ± 11%      -0.0        0.51 ± 10%      -0.0        0.51 ±  7%      -0.0        0.50 ±  6%  perf-profile.children.cycles-pp.try_to_unlazy
      0.19 ± 15%      -0.0        0.17 ±  9%      -0.0        0.19 ± 21%      -0.0        0.18 ± 13%  perf-profile.children.cycles-pp.xas_create
      0.14 ± 21%      -0.0        0.12 ± 10%      -0.0        0.11 ± 23%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.destroy_inode
      0.13 ± 16%      -0.0        0.10 ± 15%      -0.0        0.12 ± 11%      -0.0        0.11 ±  8%  perf-profile.children.cycles-pp.mutex_lock
      0.13 ± 21%      -0.0        0.10 ± 20%      -0.0        0.12 ± 12%      -0.0        0.10 ± 14%  perf-profile.children.cycles-pp.mutex_unlock
      0.08 ± 46%      -0.0        0.05 ± 46%      -0.0        0.07 ± 18%      -0.0        0.08 ± 24%  perf-profile.children.cycles-pp.xa_load
      0.12 ± 19%      -0.0        0.10 ± 25%      +0.0        0.13 ±  8%      -0.0        0.12 ± 11%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.02 ± 99%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.06 ± 23%      -0.0        0.04 ± 71%      -0.0        0.03 ±102%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.04 ± 73%      -0.0        0.02 ±141%      -0.0        0.03 ±105%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.24 ± 19%      -0.0        0.22 ±  7%      -0.0        0.22 ± 15%      -0.0        0.21 ± 14%  perf-profile.children.cycles-pp.vfs_parse_fs_param
      0.08 ± 17%      -0.0        0.06 ± 49%      -0.0        0.06 ± 52%      -0.0        0.08 ± 28%  perf-profile.children.cycles-pp.__alloc_skb
      0.16 ± 13%      -0.0        0.13 ± 17%      -0.0        0.14 ± 13%      +0.0        0.16 ± 12%  perf-profile.children.cycles-pp.complete
      0.18 ± 16%      -0.0        0.15 ± 10%      -0.0        0.16 ± 14%      -0.0        0.16 ± 16%  perf-profile.children.cycles-pp.task_work_add
      0.22 ± 18%      -0.0        0.19 ± 23%      -0.0        0.21 ± 21%      -0.0        0.21 ± 12%  perf-profile.children.cycles-pp.device_add_property_aux
      0.24 ± 12%      -0.0        0.21 ± 14%      -0.0        0.23 ± 20%      +0.0        0.24 ± 15%  perf-profile.children.cycles-pp.kernfs_iop_get_link
      1.30 ± 12%      -0.0        1.27 ±  4%      -0.1        1.22 ±  9%      -0.1        1.22 ± 12%  perf-profile.children.cycles-pp.tick_sched_handle
      1.42 ± 10%      -0.0        1.40 ±  6%      -0.1        1.34 ±  3%      -0.0        1.40 ±  5%  perf-profile.children.cycles-pp.__percpu_init_rwsem
      0.71 ±  6%      -0.0        0.68 ± 10%      +0.0        0.71 ±  7%      +0.0        0.72 ±  6%  perf-profile.children.cycles-pp.path_init
      0.31 ± 10%      -0.0        0.28 ± 10%      -0.0        0.30 ± 16%      +0.0        0.32 ±  8%  perf-profile.children.cycles-pp.format_decode
      0.34 ± 14%      -0.0        0.31 ±  4%      +0.0        0.35 ± 17%      +0.0        0.34 ±  5%  perf-profile.children.cycles-pp.access
      0.11 ± 18%      -0.0        0.08 ± 19%      -0.0        0.08 ± 26%      -0.0        0.08 ±  8%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.03 ±103%      -0.0        0.01 ±223%      +0.0        0.04 ± 72%      +0.0        0.06 ± 46%  perf-profile.children.cycles-pp.seq_dentry
      0.07 ±  9%      -0.0        0.05 ± 74%      +0.0        0.08 ± 19%      -0.0        0.06 ± 48%  perf-profile.children.cycles-pp.stress_ramfs_child
      0.32 ± 15%      -0.0        0.30 ±  6%      +0.0        0.34 ± 18%      +0.0        0.32 ±  6%  perf-profile.children.cycles-pp.do_faccessat
      1.14 ±  7%      -0.0        1.12 ±  4%      +0.0        1.14 ±  7%      +0.1        1.20 ±  7%  perf-profile.children.cycles-pp.vfs_statx
      0.13 ± 23%      -0.0        0.11 ±  9%      -0.0        0.10 ± 28%      -0.0        0.12 ± 11%  perf-profile.children.cycles-pp.__destroy_inode
      0.13 ± 26%      -0.0        0.10 ± 13%      -0.0        0.11 ± 14%      -0.0        0.10 ± 17%  perf-profile.children.cycles-pp.mutex_lock_killable
      0.04 ± 72%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.timerqueue_add
      0.36 ±  7%      -0.0        0.33 ± 11%      -0.1        0.30 ± 13%      -0.1        0.29 ± 17%  perf-profile.children.cycles-pp.destroy_super_work
      0.36 ±  7%      -0.0        0.33 ± 11%      -0.1        0.30 ± 13%      -0.1        0.29 ± 17%  perf-profile.children.cycles-pp.percpu_free_rwsem
      0.25 ±  6%      -0.0        0.23 ± 10%      -0.0        0.23 ± 18%      +0.0        0.26 ± 19%  perf-profile.children.cycles-pp.___sys_sendmsg
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__traverse_mounts
      0.06 ±  9%      -0.0        0.03 ± 70%      -0.0        0.04 ± 45%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__bitmap_clear
      0.08 ± 27%      -0.0        0.06 ± 48%      -0.0        0.08 ± 14%      -0.0        0.06 ± 71%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.05 ± 48%      -0.0        0.03 ±100%      +0.0        0.05 ± 46%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.strnlen_user
      0.20 ± 12%      -0.0        0.18 ±  9%      -0.0        0.20 ±  7%      -0.0        0.19 ± 16%  perf-profile.children.cycles-pp.__kmalloc
      0.16 ±  9%      -0.0        0.14 ± 16%      +0.0        0.16 ± 14%      +0.0        0.17 ± 10%  perf-profile.children.cycles-pp.get_mountpoint
      0.38 ±  7%      -0.0        0.36 ± 10%      +0.0        0.39 ±  6%      -0.0        0.37 ±  4%  perf-profile.children.cycles-pp.shmem_mknod
      1.41 ± 10%      -0.0        1.39 ±  3%      -0.1        1.33 ±  6%      -0.1        1.36 ± 12%  perf-profile.children.cycles-pp.tick_sched_timer
      0.26 ±  6%      -0.0        0.24 ± 10%      -0.0        0.24 ± 17%      +0.0        0.27 ± 18%  perf-profile.children.cycles-pp.__sys_sendmsg
      0.96 ± 14%      -0.0        0.94 ±  5%      -0.1        0.90 ±  5%      -0.0        0.93 ±  9%  perf-profile.children.cycles-pp.propagate_mount_busy
      0.38 ±  9%      -0.0        0.36 ±  8%      -0.0        0.35 ± 12%      +0.0        0.39 ±  8%  perf-profile.children.cycles-pp.init_file
      0.23 ±  7%      -0.0        0.21 ± 14%      -0.0        0.21 ± 20%      +0.0        0.23 ± 16%  perf-profile.children.cycles-pp.sock_sendmsg
      0.56 ± 11%      -0.0        0.54 ±  2%      -0.0        0.55 ± 14%      -0.0        0.55 ±  5%  perf-profile.children.cycles-pp.queue_work_on
      0.45 ± 10%      -0.0        0.43 ± 10%      -0.0        0.45 ±  8%      -0.0        0.44 ±  6%  perf-profile.children.cycles-pp.list_lru_destroy
      0.16 ± 21%      -0.0        0.14 ± 16%      +0.0        0.17 ± 21%      -0.0        0.16 ± 15%  perf-profile.children.cycles-pp.prepend_path
      0.15 ± 18%      -0.0        0.13 ± 20%      +0.0        0.15 ±  8%      +0.0        0.15 ± 17%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.98 ± 13%      -0.0        0.96 ±  7%      +0.1        1.04            +0.0        0.98 ±  9%  perf-profile.children.cycles-pp.stress_mwc32
      0.07 ± 29%      -0.0        0.05 ± 73%      -0.0        0.06 ± 13%      -0.0        0.06 ± 71%  perf-profile.children.cycles-pp.m_start
      0.11 ± 25%      -0.0        0.09 ± 19%      -0.0        0.10 ± 20%      +0.0        0.12 ± 24%  perf-profile.children.cycles-pp.shmem_put_super
      0.11 ± 18%      -0.0        0.09 ± 27%      -0.0        0.10 ± 17%      -0.0        0.08 ± 27%  perf-profile.children.cycles-pp.get_fs_type
      0.02 ±144%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.uncharge_batch
      0.10 ± 21%      -0.0        0.08 ± 14%      -0.0        0.10 ± 15%      -0.0        0.10 ± 13%  perf-profile.children.cycles-pp.llist_add_batch
      0.07 ± 21%      -0.0        0.05 ± 50%      -0.0        0.04 ± 71%      +0.0        0.08 ± 27%  perf-profile.children.cycles-pp.__d_instantiate
      0.12 ±  8%      -0.0        0.10 ± 24%      -0.0        0.11 ± 16%      -0.0        0.11 ± 19%  perf-profile.children.cycles-pp.rcu_pending
      0.26 ± 12%      -0.0        0.24 ± 16%      +0.0        0.27 ± 17%      +0.0        0.27 ± 15%  perf-profile.children.cycles-pp.set_next_entity
      0.27 ±  5%      -0.0        0.25 ±  5%      -0.0        0.25 ± 11%      -0.0        0.26 ± 12%  perf-profile.children.cycles-pp.smp_call_function_single
      0.08 ± 26%      -0.0        0.06 ± 51%      -0.0        0.03 ±100%      -0.0        0.07 ± 23%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.18 ± 19%      -0.0        0.16 ± 16%      -0.0        0.14 ±  8%      -0.0        0.16 ± 20%  perf-profile.children.cycles-pp.__folio_batch_release
      0.10 ± 19%      -0.0        0.08 ±  9%      -0.0        0.08 ± 20%      -0.0        0.09 ± 12%  perf-profile.children.cycles-pp.generic_fillattr
      0.10 ± 22%      -0.0        0.08 ± 23%      -0.0        0.08 ± 23%      -0.0        0.10 ± 22%  perf-profile.children.cycles-pp.percpu_counter_destroy
      0.13 ± 14%      -0.0        0.11 ± 16%      -0.0        0.12 ± 17%      -0.0        0.12 ± 17%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.16 ±  7%      -0.0        0.14 ± 18%      -0.0        0.15 ± 10%      -0.0        0.12 ± 11%  perf-profile.children.cycles-pp.xas_load
      0.08 ± 26%      -0.0        0.06 ± 48%      -0.0        0.08 ± 16%      -0.0        0.06 ± 50%  perf-profile.children.cycles-pp.security_file_open
      0.02 ±142%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.unit_name_escape
      0.07 ± 18%      -0.0        0.06 ± 47%      -0.0        0.06 ± 48%      +0.0        0.08 ± 30%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rb_insert_color
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.error_entry
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp._hashmap_size
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.wq_worker_running
      0.08 ± 17%      -0.0        0.06 ± 49%      -0.0        0.07 ±  9%      -0.0        0.06 ± 49%  perf-profile.children.cycles-pp.llist_reverse_order
      0.02 ±142%      -0.0        0.00            +0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.sched_use_asym_prio
      0.02 ±142%      -0.0        0.00            +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.mntput
      0.02 ±142%      -0.0        0.00            +0.0        0.03 ±101%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.putname
      0.25 ±  9%      -0.0        0.23 ± 16%      -0.0        0.22 ± 14%      +0.0        0.26 ± 10%  perf-profile.children.cycles-pp.pagecache_get_page
      0.39 ±  7%      -0.0        0.37 ±  9%      -0.0        0.37 ±  6%      +0.0        0.39 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.16 ± 17%      -0.0        0.14 ± 17%      -0.0        0.15 ± 25%      -0.0        0.14 ± 14%  perf-profile.children.cycles-pp.kernfs_iop_getattr
      0.14 ± 14%      -0.0        0.13 ± 29%      -0.0        0.14 ± 19%      +0.0        0.15 ± 22%  perf-profile.children.cycles-pp.realloc
      0.22 ±  7%      -0.0        0.20 ± 12%      -0.0        0.20 ± 20%      +0.0        0.22 ± 17%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.18 ±  9%      -0.0        0.16 ± 19%      -0.0        0.16 ± 13%      -0.0        0.17 ± 10%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.08 ± 19%      -0.0        0.06 ± 47%      +0.0        0.08 ± 24%      +0.0        0.08 ± 27%  perf-profile.children.cycles-pp.strspn@plt
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp._ext4_show_options
      0.07 ± 14%      -0.0        0.06 ± 47%      +0.0        0.08 ± 14%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.rwsem_wake
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.default_send_IPI_single_phys
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.xas_find_marked
      0.34 ±  5%      -0.0        0.33 ± 16%      -0.0        0.32 ± 10%      +0.0        0.35 ± 12%  perf-profile.children.cycles-pp.simple_write_begin
      0.26 ± 12%      -0.0        0.24 ± 14%      -0.0        0.24 ± 11%      +0.0        0.27 ± 11%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.14 ± 28%      -0.0        0.12 ± 27%      -0.0        0.12 ± 20%      -0.0        0.12 ± 28%  perf-profile.children.cycles-pp.idle_cpu
      0.06 ± 14%      -0.0        0.05 ± 46%      -0.0        0.05 ± 72%      -0.0        0.06 ± 52%  perf-profile.children.cycles-pp.sysfs_emit_at
      0.22 ± 13%      -0.0        0.20 ± 19%      -0.0        0.20 ± 10%      -0.0        0.21 ± 16%  perf-profile.children.cycles-pp.strndup_user
      0.06 ± 21%      -0.0        0.05 ± 49%      -0.0        0.06 ± 51%      -0.0        0.04 ± 45%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.06 ± 45%      -0.0        0.05 ± 46%      +0.0        0.07 ± 49%      +0.0        0.08 ± 22%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.11 ± 14%      -0.0        0.10 ±  7%      +0.0        0.12 ± 11%      +0.0        0.14 ± 14%  perf-profile.children.cycles-pp.lookup_dcache
      0.15 ± 21%      -0.0        0.13 ± 18%      +0.0        0.16 ± 27%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.refill_obj_stock
      0.04 ± 75%      -0.0        0.02 ± 99%      +0.0        0.06 ± 18%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.unlock_mount
      0.16 ± 19%      -0.0        0.14 ± 12%      -0.0        0.14 ± 11%      -0.0        0.13 ± 20%  perf-profile.children.cycles-pp.__list_lru_init
      1.07 ±  9%      -0.0        1.05 ±  4%      +0.0        1.11 ±  8%      +0.1        1.15 ±  4%  perf-profile.children.cycles-pp.__do_sys_newlstat
      0.10 ± 17%      -0.0        0.08 ± 23%      -0.0        0.09 ± 18%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp._atomic_dec_and_lock
      0.07 ± 13%      -0.0        0.05 ± 48%      +0.0        0.07 ± 23%      +0.0        0.08 ± 17%  perf-profile.children.cycles-pp.shmem_getattr
      0.04 ± 71%      -0.0        0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.device_get_id_filename
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.malloc@plt
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      -0.0        0.02 ±144%  perf-profile.children.cycles-pp.rb_next
      0.07 ± 23%      -0.0        0.06 ± 46%      -0.0        0.04 ± 71%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.memcpy@plt
      0.10 ± 34%      -0.0        0.08 ± 16%      -0.0        0.08 ± 13%      -0.0        0.08 ± 24%  perf-profile.children.cycles-pp.set_anon_super_fc
      0.09 ± 22%      -0.0        0.08 ± 19%      -0.0        0.07 ± 15%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.shmem_file_read_iter
      0.08 ± 17%      -0.0        0.07 ± 18%      +0.0        0.08 ± 13%      -0.0        0.07 ± 48%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.04 ± 79%      -0.0        0.02 ± 99%      -0.0        0.01 ±223%      +0.0        0.05 ± 48%  perf-profile.children.cycles-pp.perf_pmu_nop_void
      0.04 ± 72%      -0.0        0.02 ±141%      -0.0        0.04 ± 71%      +0.0        0.05 ± 77%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.16 ± 16%      -0.0        0.15 ± 21%      -0.0        0.15 ±  6%      -0.0        0.15 ± 12%  perf-profile.children.cycles-pp.device_read_uevent_file
      0.23 ±  7%      -0.0        0.22 ± 14%      -0.0        0.22 ± 21%      +0.0        0.24 ± 17%  perf-profile.children.cycles-pp.____sys_sendmsg
      0.16 ± 14%      -0.0        0.14 ± 19%      +0.0        0.18 ± 20%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.18 ± 28%      -0.0        0.17 ± 24%      -0.0        0.17 ± 12%      +0.0        0.18 ± 21%  perf-profile.children.cycles-pp.copy_mount_options
      0.20 ± 13%      -0.0        0.18 ± 12%      +0.0        0.20 ±  9%      -0.0        0.20 ± 12%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.38 ± 11%      -0.0        0.37 ± 12%      +0.0        0.39 ± 13%      -0.0        0.36 ± 12%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      0.28 ± 15%      -0.0        0.26 ± 15%      +0.0        0.29 ± 10%      -0.0        0.25 ± 12%  perf-profile.children.cycles-pp.kstrdup
      0.82 ± 10%      -0.0        0.81 ±  4%      +0.0        0.86 ±  4%      +0.0        0.86 ±  5%  perf-profile.children.cycles-pp.mnt_get_writers
      0.44 ± 13%      -0.0        0.43 ± 12%      -0.0        0.43 ± 10%      -0.0        0.42 ±  6%  perf-profile.children.cycles-pp.__legitimize_path
      0.20 ± 15%      -0.0        0.18 ± 11%      -0.0        0.18 ± 12%      +0.0        0.21 ± 20%  perf-profile.children.cycles-pp.finish_task_switch
      0.11 ±  6%      -0.0        0.10 ± 17%      -0.0        0.10 ± 17%      +0.0        0.13 ± 19%  perf-profile.children.cycles-pp.add_uevent_var
      0.13 ± 18%      -0.0        0.12 ± 20%      +0.0        0.14 ± 11%      +0.0        0.14 ± 15%  perf-profile.children.cycles-pp.memcpy_orig
      0.08 ± 17%      -0.0        0.06 ± 11%      -0.0        0.06 ± 13%      +0.0        0.08 ± 19%  perf-profile.children.cycles-pp.path_startswith
      0.12 ± 20%      -0.0        0.11 ± 27%      -0.0        0.12 ± 25%      +0.0        0.14 ± 28%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.18 ± 14%      -0.0        0.16 ± 13%      -0.0        0.17 ± 13%      -0.0        0.17 ±  9%  perf-profile.children.cycles-pp.up_write
      0.04 ± 77%      -0.0        0.03 ±105%      +0.0        0.04 ± 73%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.strextend_with_separator
      0.02 ±146%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.ramfs_parse_param
      0.03 ±103%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.idr_alloc_u32
      0.03 ±101%      -0.0        0.02 ±141%      -0.0        0.02 ±144%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.strncmp
      0.04 ± 73%      -0.0        0.03 ±100%      +0.0        0.06 ± 47%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.wake_up_q
      0.41 ±  5%      -0.0        0.40 ± 15%      -0.0        0.39 ±  8%      +0.0        0.42 ± 12%  perf-profile.children.cycles-pp.page_symlink
      0.55 ±  7%      -0.0        0.54 ±  6%      -0.0        0.54 ± 13%      +0.0        0.57 ±  8%  perf-profile.children.cycles-pp.__xstat64
      0.66 ± 10%      -0.0        0.64 ±  6%      +0.0        0.66 ±  7%      -0.0        0.65 ± 10%  perf-profile.children.cycles-pp.__d_alloc
      0.29 ± 17%      -0.0        0.28 ± 16%      +0.0        0.32 ±  8%      +0.0        0.30 ± 15%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.10 ± 20%      -0.0        0.08 ± 24%      +0.0        0.11 ± 12%      -0.0        0.09 ± 14%  perf-profile.children.cycles-pp.show_mnt_opts
      0.07 ± 18%      -0.0        0.06 ± 13%      -0.0        0.06 ± 45%      -0.0        0.04 ± 77%  perf-profile.children.cycles-pp.pcpu_next_fit_region
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.mnt_table_next_fs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.handle_dots
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.memparse
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±144%  perf-profile.children.cycles-pp.pcpu_chunk_relocate
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.connect
      0.04 ± 45%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.03 ±103%      -0.0        0.02 ±142%      -0.0        0.02 ± 99%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.idr_alloc
      0.03 ±101%      -0.0        0.02 ±142%      +0.0        0.03 ±101%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.rmqueue
      0.03 ±100%      -0.0        0.02 ±141%      +0.0        0.03 ±103%      +0.0        0.05 ± 71%  perf-profile.children.cycles-pp.strjoin_real
      0.07 ± 22%      -0.0        0.06 ± 50%      +0.0        0.08 ± 25%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.current_time
      0.32 ± 19%      -0.0        0.31 ± 15%      -0.0        0.29 ± 11%      +0.0        0.32 ± 11%  perf-profile.children.cycles-pp.down_read
      0.10 ± 17%      -0.0        0.09 ± 20%      -0.0        0.08 ± 20%      -0.0        0.08 ± 14%  perf-profile.children.cycles-pp.chacha_permute
      0.08 ± 17%      -0.0        0.07 ± 15%      -0.0        0.06 ± 51%      -0.0        0.07 ± 10%  perf-profile.children.cycles-pp.ep_send_events
      0.12 ± 10%      -0.0        0.10 ± 22%      -0.0        0.10 ± 22%      +0.0        0.14 ± 13%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.15 ± 29%      -0.0        0.14 ± 10%      -0.0        0.14 ± 20%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.vfs_getattr_nosec
      0.30 ± 13%      -0.0        0.28 ± 12%      -0.0        0.28 ± 10%      -0.0        0.26 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.34 ± 16%      -0.0        0.33 ±  6%      +0.0        0.37 ±  9%      +0.0        0.36 ±  8%  perf-profile.children.cycles-pp.vfs_rmdir
      0.58 ± 12%      -0.0        0.57 ±  4%      +0.0        0.62 ±  6%      +0.0        0.58 ±  4%  perf-profile.children.cycles-pp.ramfs_get_inode
      0.07 ± 15%      -0.0        0.06 ± 18%      -0.0        0.05 ± 49%      -0.0        0.06 ± 49%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.27 ±  8%      -0.0        0.26 ± 15%      -0.0        0.24 ±  5%      +0.0        0.31 ± 14%  perf-profile.children.cycles-pp.update_blocked_averages
      0.18 ±  9%      -0.0        0.17 ±  9%      -0.0        0.16 ±  9%      -0.0        0.16 ± 15%  perf-profile.children.cycles-pp.apparmor_capable
      0.13 ± 13%      -0.0        0.12 ± 18%      -0.0        0.12 ± 18%      +0.0        0.16 ± 11%  perf-profile.children.cycles-pp.filemap_add_folio
      0.09 ± 14%      -0.0        0.08 ± 20%      -0.0        0.08 ± 30%      +0.0        0.09 ± 23%  perf-profile.children.cycles-pp.rcu_exp_handler
      0.11 ± 22%      -0.0        0.10 ± 25%      -0.0        0.11 ± 13%      -0.0        0.11 ± 13%  perf-profile.children.cycles-pp.lockref_put_or_lock
      0.20 ± 15%      -0.0        0.19 ± 15%      +0.0        0.20 ± 21%      +0.0        0.21 ± 12%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.18 ± 12%      -0.0        0.18 ± 13%      +0.0        0.19 ± 11%      -0.0        0.18 ± 25%  perf-profile.children.cycles-pp.prepare_task_switch
      0.10 ± 28%      -0.0        0.09 ± 16%      +0.0        0.10 ± 28%      -0.0        0.09 ± 14%  perf-profile.children.cycles-pp.xas_alloc
      0.11 ± 18%      -0.0        0.10 ± 15%      +0.0        0.12 ± 17%      +0.0        0.11 ± 16%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.49 ± 11%      -0.0        0.48 ±  7%      +0.0        0.50 ± 10%      -0.0        0.48 ±  8%  perf-profile.children.cycles-pp.ramfs_fill_super
      0.08 ± 27%      -0.0        0.07 ± 18%      +0.0        0.09 ± 15%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.free@plt
      0.20 ± 33%      -0.0        0.19 ± 25%      +0.0        0.22 ± 36%      -0.0        0.16 ± 15%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.06 ± 54%      -0.0        0.05 ± 48%      -0.0        0.03 ±101%      -0.0        0.06 ± 47%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.05 ± 49%      -0.0        0.04 ± 75%      -0.0        0.03 ±101%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.path_compare@plt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_path_rmdir
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.simple_unlink
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.unix_stream_connect
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.security_path_rmdir
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.check_cpu_stall
      0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.lookup_mnt
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.03 ± 70%  perf-profile.children.cycles-pp.__x64_sys_connect
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      +0.0        0.03 ± 70%  perf-profile.children.cycles-pp.__sys_connect
      0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.update_min_vruntime
      0.08 ± 19%      -0.0        0.07 ± 21%      -0.0        0.06 ± 53%      -0.0        0.08 ± 26%  perf-profile.children.cycles-pp.lookup_constant
      0.06 ± 47%      -0.0        0.04 ± 74%      -0.0        0.04 ± 73%      +0.0        0.06 ± 11%  perf-profile.children.cycles-pp.kernfs_fop_open
      0.08 ± 17%      -0.0        0.07 ± 18%      -0.0        0.08 ± 23%      +0.0        0.09 ± 31%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.12 ± 15%      -0.0        0.11 ± 14%      -0.0        0.12 ± 19%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.shmem_parse_options
      0.09 ± 10%      -0.0        0.08 ± 14%      +0.0        0.09 ± 27%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp.__alloc_pages
      0.24 ± 10%      -0.0        0.23 ± 10%      -0.0        0.23 ±  5%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.security_capable
      0.14 ±  7%      -0.0        0.13 ± 16%      -0.0        0.12 ± 16%      +0.0        0.16 ± 15%  perf-profile.children.cycles-pp.dev_uevent
      0.22 ± 15%      -0.0        0.22 ± 12%      +0.0        0.22 ± 10%      +0.0        0.23 ±  7%  perf-profile.children.cycles-pp.device_properties_prepare
      0.13 ± 12%      -0.0        0.12 ± 19%      -0.0        0.12 ± 19%      -0.0        0.13 ± 20%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.10 ± 15%      -0.0        0.09 ± 17%      +0.0        0.10 ± 24%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp._hashmap_iterate
      0.10 ± 24%      -0.0        0.09 ± 17%      +0.0        0.10 ±  5%      +0.0        0.12 ± 17%  perf-profile.children.cycles-pp.shmem_show_options
      0.09 ±  9%      -0.0        0.08 ± 20%      +0.0        0.10 ± 14%      +0.0        0.10 ± 26%  perf-profile.children.cycles-pp.path_put
      0.11 ± 17%      -0.0        0.10 ± 13%      +0.0        0.12 ±  8%      -0.0        0.10 ± 17%  perf-profile.children.cycles-pp.pcpu_find_block_fit
      0.06 ± 17%      -0.0        0.06 ± 46%      -0.0        0.06 ± 11%      -0.0        0.06 ± 17%  perf-profile.children.cycles-pp.update_cfs_group
      0.04 ± 72%      -0.0        0.03 ±101%      +0.0        0.05 ± 45%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.inode_maybe_inc_iversion
      0.06 ± 19%      -0.0        0.06 ± 50%      +0.0        0.08 ± 17%      +0.0        0.08 ± 16%  perf-profile.children.cycles-pp.kernfs_fop_release
      0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.04 ± 75%  perf-profile.children.cycles-pp.__socket
      0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.05 ± 46%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.fsnotify_sb_delete
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.native_apic_mem_write
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__snprintf_chk
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.charge_memcg
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.seq_release_private
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.delete_trailing_chars
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.siphash24_init@plt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.put_prev_task_fair
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.dput_to_list
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.refill_stock
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.copy_page_to_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.proc_root_getattr
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.simple_strntoull
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.unix_stream_read_actor
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__skb_datagram_iter
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.filemap_get_entry
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_open_container
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.set_strjoin
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.siphash24_compress@plt
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.rcu_poll_gp_seq_start_unlocked
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp._IO_feof
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__isoc99_sscanf
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__libc_start_main
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.main
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.run_builtin
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.reweight_entity
      0.13 ± 19%      -0.0        0.12 ± 15%      -0.0        0.10 ± 22%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.__libc_recvmsg
      0.18 ±  8%      -0.0        0.17 ± 11%      -0.0        0.17 ± 12%      -0.0        0.17 ± 17%  perf-profile.children.cycles-pp.nd_jump_root
      0.03 ±100%      -0.0        0.02 ±144%      -0.0        0.02 ±144%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.trigger_load_balance
      0.06 ± 45%      -0.0        0.05 ± 51%      -0.0        0.06 ± 47%      +0.0        0.06 ± 19%  perf-profile.children.cycles-pp.readlink
      0.05 ± 74%      -0.0        0.04 ± 72%      +0.0        0.05 ± 46%      +0.0        0.06 ± 23%  perf-profile.children.cycles-pp.sync_regs
      0.10 ± 17%      -0.0        0.10 ± 17%      -0.0        0.10 ±  7%      +0.0        0.12 ± 19%  perf-profile.children.cycles-pp.__list_add_valid
      0.26 ± 11%      -0.0        0.25 ± 12%      -0.0        0.25 ± 11%      -0.0        0.24 ±  3%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      0.47 ± 10%      -0.0        0.47 ±  5%      -0.0        0.45 ± 15%      +0.0        0.50 ±  5%  perf-profile.children.cycles-pp.__queue_work
      0.56 ± 11%      -0.0        0.55 ±  8%      +0.0        0.56 ±  5%      +0.0        0.60 ±  6%  perf-profile.children.cycles-pp.path_compare
      0.21 ± 11%      -0.0        0.20 ±  7%      -0.0        0.20 ± 13%      +0.0        0.24 ± 10%  perf-profile.children.cycles-pp.ida_free
      0.16 ± 17%      -0.0        0.16 ± 16%      +0.0        0.16 ± 13%      -0.0        0.15 ± 15%  perf-profile.children.cycles-pp.filp_close
      0.11 ± 25%      -0.0        0.10 ± 19%      +0.0        0.12 ± 20%      -0.0        0.10 ± 30%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.08 ± 22%      -0.0        0.07 ± 21%      +0.0        0.08 ± 28%      -0.0        0.06 ± 52%  perf-profile.children.cycles-pp.rcu_nocb_try_bypass
      0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.04 ± 70%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.06 ± 47%      -0.0        0.05 ± 49%      -0.0        0.05 ± 45%      -0.0        0.05 ± 47%  perf-profile.children.cycles-pp.__x64_sys_readlink
      0.04 ± 72%      -0.0        0.03 ±103%      -0.0        0.03 ±103%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.cpuacct_charge
      0.06 ± 46%      -0.0        0.06 ± 46%      -0.0        0.06 ± 47%      -0.0        0.05 ± 46%  perf-profile.children.cycles-pp.consume_skb
      0.09 ± 14%      -0.0        0.08 ± 48%      -0.0        0.09 ± 15%      +0.0        0.09 ± 29%  perf-profile.children.cycles-pp.close_fd
      0.12 ± 22%      -0.0        0.11 ± 19%      +0.0        0.12 ± 15%      -0.0        0.11 ± 18%  perf-profile.children.cycles-pp.fput
      0.08 ± 20%      -0.0        0.07 ± 21%      +0.0        0.08 ± 19%      -0.0        0.06 ± 72%  perf-profile.children.cycles-pp.__get_fs_type
      0.12 ± 19%      -0.0        0.11 ± 28%      +0.0        0.13 ± 14%      +0.0        0.14 ± 28%  perf-profile.children.cycles-pp.__memset
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp._hashmap_get
      0.03 ±100%      -0.0        0.02 ± 99%      +0.0        0.05 ± 48%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.strscpy
      0.06 ± 19%      -0.0        0.05 ± 46%      -0.0        0.01 ±223%      -0.0        0.05 ± 46%  perf-profile.children.cycles-pp.shmem_undo_range
      0.08 ± 24%      -0.0        0.08 ± 28%      -0.0        0.06 ± 55%      -0.0        0.08 ± 30%  perf-profile.children.cycles-pp.dentry_unlink_inode
      0.10 ± 13%      -0.0        0.10 ± 18%      -0.0        0.09 ± 18%      -0.0        0.09 ± 14%  perf-profile.children.cycles-pp.chacha_block_generic
      0.17 ± 23%      -0.0        0.16 ± 11%      -0.0        0.16 ± 18%      -0.0        0.15 ± 20%  perf-profile.children.cycles-pp.sock_recvmsg
      0.15 ± 10%      -0.0        0.14 ±  8%      -0.0        0.14 ±  8%      -0.0        0.14 ± 19%  perf-profile.children.cycles-pp.set_root
      0.11 ±  8%      -0.0        0.11 ± 22%      -0.0        0.11 ± 17%      -0.0        0.10 ± 24%  perf-profile.children.cycles-pp.strcmp
      0.13 ± 13%      -0.0        0.13 ±  9%      +0.0        0.14 ± 15%      -0.0        0.12 ± 20%  perf-profile.children.cycles-pp.___perf_sw_event
      0.16 ± 13%      -0.0        0.16 ± 20%      +0.0        0.17 ± 20%      +0.0        0.18 ± 11%  perf-profile.children.cycles-pp.check_preempt_curr
      0.34 ±  9%      -0.0        0.34 ± 11%      +0.0        0.35 ±  9%      -0.0        0.32 ± 12%  perf-profile.children.cycles-pp.complete_walk
      0.15 ± 17%      -0.0        0.14 ±  5%      +0.0        0.17 ± 20%      +0.0        0.18 ±  8%  perf-profile.children.cycles-pp.d_lookup
      0.38 ±  9%      -0.0        0.37 ± 11%      -0.0        0.36 ± 10%      -0.0        0.37 ± 10%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
      0.13 ± 16%      -0.0        0.12 ±  8%      -0.0        0.12 ± 27%      +0.0        0.14 ± 15%  perf-profile.children.cycles-pp.lockref_get
      0.14 ± 14%      -0.0        0.13 ± 14%      -0.0        0.12 ± 14%      -0.0        0.12 ± 15%  perf-profile.children.cycles-pp.security_file_free
      0.09 ± 17%      -0.0        0.08 ± 13%      -0.0        0.07 ± 20%      +0.0        0.11 ± 18%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.18 ± 20%      -0.0        0.17 ± 26%      -0.0        0.17 ± 10%      -0.0        0.17 ± 16%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.25 ± 14%      -0.0        0.24 ±  7%      -0.0        0.24 ± 17%      -0.0        0.22 ±  4%  perf-profile.children.cycles-pp.__legitimize_mnt
      0.16 ± 25%      -0.0        0.16 ± 13%      -0.0        0.15 ± 20%      -0.0        0.14 ± 20%  perf-profile.children.cycles-pp.unix_stream_read_generic
      0.16 ± 25%      -0.0        0.16 ± 13%      -0.0        0.16 ± 19%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      0.10 ± 20%      -0.0        0.09 ± 24%      -0.0        0.09 ±  7%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp._IO_default_xsputn
      0.26 ± 13%      -0.0        0.26 ±  4%      -0.0        0.26 ± 10%      -0.0        0.26 ±  8%  perf-profile.children.cycles-pp.__x64_sys_close
      0.09 ± 10%      -0.0        0.08 ± 51%      -0.0        0.08 ± 17%      -0.0        0.08 ± 17%  perf-profile.children.cycles-pp.zero_user_segments
      0.22 ±  9%      -0.0        0.21 ± 15%      +0.0        0.22 ± 18%      +0.0        0.25 ± 12%  perf-profile.children.cycles-pp.ep_poll_callback
      0.12 ± 21%      -0.0        0.12 ± 19%      +0.0        0.12 ± 13%      +0.0        0.12 ± 11%  perf-profile.children.cycles-pp.iput
      0.15 ± 16%      -0.0        0.14 ± 11%      +0.0        0.16 ± 13%      +0.0        0.16 ± 10%  perf-profile.children.cycles-pp.terminate_walk
      0.03 ±144%      -0.0        0.03 ±143%      -0.0        0.03 ±147%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.07 ± 47%      -0.0        0.06 ± 47%      -0.0        0.06 ± 49%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.chase_symlinks
      0.06 ± 25%      -0.0        0.06 ± 47%      +0.0        0.07 ± 14%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.vmalloc_to_page
      0.06 ± 72%      -0.0        0.06 ± 52%      +0.0        0.07 ± 20%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.strlcpy
      0.08 ± 10%      -0.0        0.08 ± 23%      -0.0        0.06 ± 11%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.string_table_lookup
      0.08 ± 13%      -0.0        0.08 ± 17%      -0.0        0.08 ± 63%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.generic_parse_monolithic
      0.20 ±  9%      -0.0        0.19 ±  6%      +0.0        0.20 ± 20%      +0.0        0.21 ± 17%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.23 ± 23%      -0.0        0.23 ± 12%      +0.0        0.24 ± 19%      -0.0        0.22 ± 15%  perf-profile.children.cycles-pp.pcpu_block_update_hint_alloc
      0.19 ± 14%      -0.0        0.18 ± 11%      +0.0        0.20 ± 19%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.rcu_all_qs
      1.92 ± 12%      -0.0        1.91 ±  2%      -0.0        1.89 ± 11%      -0.1        1.79 ± 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.57 ±  9%      -0.0        0.56 ±  6%      -0.0        0.56 ± 12%      -0.0        0.56 ± 12%  perf-profile.children.cycles-pp.__call_rcu_common
      0.30 ± 16%      -0.0        0.30 ± 14%      -0.0        0.28 ± 18%      -0.0        0.27 ± 17%  perf-profile.children.cycles-pp.pcpu_free_area
      0.15 ± 19%      -0.0        0.14 ± 15%      -0.0        0.14 ± 11%      +0.0        0.16 ± 18%  perf-profile.children.cycles-pp.memdup_user
      0.24 ± 11%      -0.0        0.24 ± 11%      +0.0        0.25 ±  6%      -0.0        0.21 ± 10%  perf-profile.children.cycles-pp.ns_capable
      0.17 ± 25%      -0.0        0.17 ±  7%      +0.0        0.19 ± 31%      -0.0        0.16 ± 20%  perf-profile.children.cycles-pp.__lookup_mnt
      0.09 ± 18%      -0.0        0.09 ± 21%      +0.0        0.10 ±  9%      -0.0        0.09 ± 19%  perf-profile.children.cycles-pp.security_inode_permission
      0.04 ± 71%      -0.0        0.04 ± 72%      +0.0        0.06 ± 47%      -0.0        0.04 ± 72%  perf-profile.children.cycles-pp.apparmor_file_open
      0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.legitimize_links
      0.03 ±142%      -0.0        0.03 ±146%      -0.0        0.02 ±223%      -0.0        0.02 ±223%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.05 ± 47%      -0.0        0.04 ± 73%      -0.0        0.04 ± 72%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.build_open_flags
      0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.hashmap_get2
      0.04 ± 72%      -0.0        0.04 ± 71%      -0.0        0.04 ± 71%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.strcmp_ptr
      0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.strnlen
      0.04 ± 72%      -0.0        0.04 ± 71%      +0.0        0.06 ±  9%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp._copy_to_iter
      0.02 ±144%      -0.0        0.02 ±141%      +0.0        0.04 ± 72%      +0.0        0.04 ± 71%  perf-profile.children.cycles-pp.m_next
      0.04 ± 80%      -0.0        0.04 ± 75%      +0.0        0.07 ± 23%      +0.0        0.05 ± 46%  perf-profile.children.cycles-pp.shmem_unlink
      0.14 ± 21%      -0.0        0.14 ± 12%      -0.0        0.12 ± 10%      -0.0        0.12 ± 15%  perf-profile.children.cycles-pp._get_random_bytes
      0.14 ± 14%      -0.0        0.14 ± 20%      -0.0        0.13 ± 24%      -0.0        0.14 ± 14%  perf-profile.children.cycles-pp.__strdup
      0.14 ± 11%      -0.0        0.13 ± 17%      -0.0        0.13 ± 19%      -0.0        0.12 ± 23%  perf-profile.children.cycles-pp.pcpu_block_update_hint_free
      0.19 ± 21%      -0.0        0.18 ± 10%      +0.0        0.19 ± 19%      -0.0        0.17 ± 17%  perf-profile.children.cycles-pp.___sys_recvmsg
      0.08 ± 21%      -0.0        0.08 ± 17%      +0.0        0.08 ± 18%      -0.0        0.07 ± 12%  perf-profile.children.cycles-pp._find_next_and_bit
      0.23 ± 17%      -0.0        0.22 ± 12%      +0.0        0.24 ± 17%      +0.0        0.27 ± 13%  perf-profile.children.cycles-pp.commit_tree
      0.10 ± 15%      -0.0        0.10 ± 27%      -0.0        0.07 ± 57%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.path_equal
      0.10 ± 19%      -0.0        0.10 ± 14%      -0.0        0.10 ± 20%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.hashmap_replace
      0.32 ± 12%      -0.0        0.32 ±  7%      +0.0        0.35 ± 12%      +0.1        0.38 ±  7%  perf-profile.children.cycles-pp.cp_new_stat
      0.27 ± 10%      -0.0        0.27 ± 14%      -0.0        0.24 ± 18%      +0.0        0.28 ±  9%  perf-profile.children.cycles-pp.__switch_to_asm
      0.24 ± 13%      -0.0        0.23 ± 11%      -0.0        0.22 ± 12%      -0.0        0.23 ±  4%  perf-profile.children.cycles-pp.ep_poll
      0.23 ± 20%      -0.0        0.23 ± 18%      +0.0        0.23 ± 18%      +0.0        0.24 ± 16%  perf-profile.children.cycles-pp.seq_escape_mem
      0.14 ± 25%      -0.0        0.14 ± 16%      -0.0        0.13 ± 18%      -0.0        0.12 ± 24%  perf-profile.children.cycles-pp.alloc_fd
      0.14 ± 18%      -0.0        0.14 ± 17%      -0.0        0.13 ± 21%      -0.0        0.13 ± 10%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.14 ± 12%      -0.0        0.13 ± 19%      -0.0        0.13 ± 21%      -0.0        0.13 ± 10%  perf-profile.children.cycles-pp.read_tsc
      0.20 ± 19%      -0.0        0.20 ± 21%      +0.0        0.20 ± 21%      +0.0        0.21 ± 15%  perf-profile.children.cycles-pp.string_escape_mem
      0.11 ± 20%      -0.0        0.10 ± 21%      +0.0        0.12 ± 20%      -0.0        0.10 ± 17%  perf-profile.children.cycles-pp.ct_idle_exit
      0.21 ± 21%      -0.0        0.21 ± 18%      +0.0        0.23 ± 18%      -0.0        0.19 ± 14%  perf-profile.children.cycles-pp.get_nr_inodes
      0.05 ± 77%      -0.0        0.05 ± 72%      -0.0        0.04 ±105%      +0.0        0.06 ± 51%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.04 ± 71%      -0.0        0.04 ±104%      +0.0        0.04 ± 72%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.05 ± 46%      -0.0        0.05 ± 49%      +0.0        0.07 ± 19%      +0.0        0.06 ± 33%  perf-profile.children.cycles-pp.prepend_copy
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.drop_nlink
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.kmalloc_reserve
      0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.skb_release_data
      0.07 ± 18%      -0.0        0.07 ± 45%      -0.0        0.06 ± 50%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.strcspn@plt
      0.09 ± 28%      -0.0        0.08 ± 17%      +0.0        0.09 ± 21%      +0.0        0.09 ± 33%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.09 ± 23%      -0.0        0.09 ± 24%      +0.0        0.09 ± 31%      +0.0        0.11 ± 18%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.07 ± 14%      -0.0        0.06 ± 19%      +0.0        0.07 ± 23%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.inode_init_once
      0.09 ± 11%      -0.0        0.09 ± 27%      +0.0        0.10 ± 19%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.__fget_light
      0.04 ± 72%      -0.0        0.04 ± 73%      +0.0        0.05 ± 74%      +0.0        0.05 ± 49%  perf-profile.children.cycles-pp.os_xsave
      0.05 ± 46%      -0.0        0.05 ± 48%      +0.0        0.06 ± 48%      +0.0        0.05 ± 52%  perf-profile.children.cycles-pp.copy_from_kernel_nofault
      0.25 ± 11%      -0.0        0.25 ± 11%      -0.0        0.24 ± 10%      -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.do_epoll_wait
      0.11 ± 16%      -0.0        0.11 ± 20%      -0.0        0.11 ± 14%      +0.0        0.14 ± 13%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.07 ± 21%      -0.0        0.07 ± 15%      +0.0        0.08 ± 17%      +0.0        0.08 ± 27%  perf-profile.children.cycles-pp.__lookup_slow
      0.49 ±  7%      -0.0        0.48 ±  7%      +0.0        0.49 ± 12%      +0.0        0.52 ±  8%  perf-profile.children.cycles-pp.__do_sys_newstat
      1.24 ± 10%      +0.0        1.24 ±  7%      -0.1        1.15 ± 12%      +0.2        1.40 ±  8%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
      0.28 ± 18%      +0.0        0.28 ± 10%      -0.0        0.26 ± 13%      -0.0        0.27 ± 13%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.10 ± 31%      +0.0        0.10 ± 10%      -0.0        0.09 ± 12%      +0.0        0.11 ± 23%  perf-profile.children.cycles-pp.d_walk
      0.11 ± 24%      +0.0        0.11 ± 12%      -0.0        0.10 ±  6%      -0.0        0.10 ± 11%  perf-profile.children.cycles-pp.uuid_gen
      0.12 ± 20%      +0.0        0.12 ± 19%      -0.0        0.11 ± 20%      -0.0        0.10 ± 18%  perf-profile.children.cycles-pp.release_pages
      0.08 ± 17%      +0.0        0.08 ± 20%      -0.0        0.07 ± 53%      -0.0        0.05 ± 49%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.11 ± 16%      +0.0        0.11 ± 20%      -0.0        0.10 ± 13%      -0.0        0.09 ±  9%  perf-profile.children.cycles-pp.crng_fast_key_erasure
      0.28 ± 13%      +0.0        0.28 ± 11%      -0.0        0.26 ± 14%      +0.0        0.31 ± 12%  perf-profile.children.cycles-pp.security_file_alloc
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__x64_sys_socket
      0.02 ±142%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__sys_socket
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.handle_mm_fault
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.locks_remove_posix
      0.15 ± 12%      +0.0        0.15 ± 10%      -0.0        0.14 ± 11%      +0.0        0.16 ± 15%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.17 ± 25%      +0.0        0.17 ± 11%      -0.0        0.17 ± 20%      -0.0        0.16 ± 18%  perf-profile.children.cycles-pp.____sys_recvmsg
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.stress_ramfs_umount
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp._dbus_type_reader_get_current_type
      0.04 ± 73%      +0.0        0.04 ± 73%      +0.0        0.04 ± 73%      -0.0        0.02 ±141%  perf-profile.children.cycles-pp.simple_acl_create
      0.15 ± 10%      +0.0        0.15 ± 11%      +0.0        0.15 ± 19%      -0.0        0.13 ± 25%  perf-profile.children.cycles-pp.allocate_slab
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.ep_item_poll
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.may_open
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.d_same_name
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.get_unused_fd_flags
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.umount@plt
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.make_vfsgid
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__sock_create
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp._ordered_hashmap_ensure_allocated
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.apparmor_inode_getattr
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_sys_poll
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_poll
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.string
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.copy_msghdr_from_user
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_group_exit
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.make_kuid
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.d_set_d_op
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.atime_needs_update
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.clear_buddies
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±141%  perf-profile.children.cycles-pp.invent_group_ids
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.dbus_message_get_reply_serial
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.lock_timer_base
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.from_kgid_munged
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.03 ±147%  perf-profile.children.cycles-pp.switch_fpu_return
      0.08 ± 14%      +0.0        0.08 ± 26%      +0.0        0.08 ± 19%      +0.0        0.10 ± 12%  perf-profile.children.cycles-pp.map_id_up
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.04 ± 72%  perf-profile.children.cycles-pp.should_failslab
      0.14 ± 37%      +0.0        0.14 ± 15%      +0.0        0.15 ± 18%      -0.0        0.14 ± 28%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
      0.32 ± 15%      +0.0        0.32 ± 16%      +0.0        0.32 ±  9%      +0.0        0.32 ±  5%  perf-profile.children.cycles-pp.vfs_unlink
      0.02 ± 99%      +0.0        0.02 ± 99%      +0.0        0.03 ± 70%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.copyout
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.task_tick_fair
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_kthread
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.blkcg_maybe_throttle_current
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.security_sb_umount
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.from_kuid_munged
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.shmem_reserve_inode
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.read_full_stream_full
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_append
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mounts_open_common
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp._raw_read_unlock_irqrestore
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.serial8250_console_write
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.uart_console_write
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.proc_self_get_link
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.pick_link
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__errno_location
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.simple_rmdir
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.ihold
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp._find_first_bit
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.bus_label_unescape_n
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.__d_rehash
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.__poll
      0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.___d_drop
      0.11 ± 16%      +0.0        0.11 ± 22%      +0.0        0.12 ± 13%      +0.0        0.13 ± 13%  perf-profile.children.cycles-pp.may_delete
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.prepare_to_wait_event
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±149%  perf-profile.children.cycles-pp.place_entity
      0.08 ± 20%      +0.0        0.08 ± 14%      +0.0        0.10 ± 18%      +0.0        0.09 ± 25%  perf-profile.children.cycles-pp.shmem_parse_one
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.pick_file
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.mounts_release
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.kernfs_unlink_open_file
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.children.cycles-pp._IO_link_in
      0.10 ± 29%      +0.0        0.10 ± 21%      +0.0        0.10 ±  9%      +0.0        0.11 ± 20%  perf-profile.children.cycles-pp.make_vfsuid
      0.14 ± 19%      +0.0        0.14 ± 12%      +0.0        0.17 ± 31%      +0.0        0.18 ±  7%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.46 ±  8%      +0.0        0.46 ± 12%      -0.0        0.43 ± 11%      -0.0        0.43 ±  8%  perf-profile.children.cycles-pp.mod_objcg_state
      0.35 ± 12%      +0.0        0.35 ±  8%      +0.0        0.38 ± 11%      +0.0        0.39 ± 12%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.12 ± 16%      +0.0        0.12 ± 12%      -0.0        0.10 ± 18%      -0.0        0.10 ± 20%  perf-profile.children.cycles-pp.__srcu_read_lock
      0.20 ± 20%      +0.0        0.20 ±  9%      -0.0        0.20 ± 19%      -0.0        0.18 ± 14%  perf-profile.children.cycles-pp.__sys_recvmsg
      0.08 ± 30%      +0.0        0.09 ± 24%      -0.0        0.08 ±  8%      -0.0        0.07 ± 14%  perf-profile.children.cycles-pp.prealloc_shrinker
      0.08 ± 22%      +0.0        0.08 ± 20%      +0.0        0.08 ± 17%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±143%  perf-profile.children.cycles-pp.touch_atime
      0.04 ±104%      +0.0        0.04 ± 71%      -0.0        0.02 ± 99%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.24 ±  9%      +0.0        0.25 ± 18%      -0.0        0.23 ± 24%      -0.0        0.23 ± 15%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.17 ± 15%      +0.0        0.17 ± 12%      -0.0        0.16 ± 12%      +0.0        0.19 ± 14%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.20 ±  8%      +0.0        0.20 ±  9%      -0.0        0.18 ±  9%      +0.0        0.21 ± 21%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.10 ± 21%      +0.0        0.10 ± 19%      +0.0        0.10 ± 22%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.15 ± 18%      +0.0        0.15 ± 14%      +0.0        0.18 ± 14%      +0.0        0.16 ± 18%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.20 ± 17%      +0.0        0.20 ± 16%      +0.0        0.23 ± 28%      +0.0        0.23 ± 14%  perf-profile.children.cycles-pp.__switch_to
      0.71 ± 18%      +0.0        0.71 ± 17%      -0.0        0.67 ± 20%      -0.2        0.51 ± 15%  perf-profile.children.cycles-pp.intel_idle_irq
      0.31 ± 12%      +0.0        0.31 ± 10%      -0.0        0.30 ± 15%      -0.0        0.30 ±  4%  perf-profile.children.cycles-pp.epoll_wait
      0.07 ± 45%      +0.0        0.07 ± 41%      -0.0        0.06 ± 23%      -0.0        0.06 ± 54%  perf-profile.children.cycles-pp.file_free_rcu
      0.12 ± 32%      +0.0        0.12 ± 12%      -0.0        0.12 ± 24%      +0.0        0.12 ± 24%  perf-profile.children.cycles-pp.__libc_sendmsg
      0.04 ± 71%      +0.0        0.04 ± 72%      -0.0        0.03 ±100%      +0.0        0.05 ± 50%  perf-profile.children.cycles-pp.kmalloc_slab
      0.04 ± 73%      +0.0        0.04 ± 76%      +0.0        0.05 ± 76%      +0.0        0.06 ± 13%  perf-profile.children.cycles-pp.kmemdup_nul
      0.04 ± 71%      +0.0        0.04 ± 72%      +0.0        0.05 ± 49%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.__kmalloc_node
      0.03 ±102%      +0.0        0.03 ±100%      +0.0        0.04 ± 45%      +0.0        0.06 ± 13%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.12 ± 19%      +0.0        0.12 ± 16%      -0.0        0.10 ± 14%      -0.0        0.10 ± 13%  perf-profile.children.cycles-pp.crng_make_state
      0.07 ± 12%      +0.0        0.08 ± 14%      -0.0        0.06 ± 58%      -0.0        0.06 ± 45%  perf-profile.children.cycles-pp.__pthread_mutex_lock
      0.08 ± 30%      +0.0        0.09 ± 24%      -0.0        0.08 ± 10%      -0.0        0.07 ± 17%  perf-profile.children.cycles-pp.__prealloc_shrinker
      0.07 ± 52%      +0.0        0.07 ± 14%      -0.0        0.06 ± 51%      -0.0        0.06 ± 14%  perf-profile.children.cycles-pp._hashmap_clear
      0.11 ± 16%      +0.0        0.11 ± 17%      -0.0        0.10 ± 10%      -0.0        0.08 ± 18%  perf-profile.children.cycles-pp.apparmor_file_free_security
      0.11 ±  9%      +0.0        0.11 ± 16%      +0.0        0.11 ± 23%      -0.0        0.10 ± 23%  perf-profile.children.cycles-pp.shuffle_freelist
      0.06 ± 46%      +0.0        0.06 ± 48%      +0.0        0.06 ± 21%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.14 ± 11%      +0.0        0.14 ± 20%      +0.0        0.14 ± 14%      -0.0        0.14 ± 21%  perf-profile.children.cycles-pp.put_prev_entity
      0.18 ± 12%      +0.0        0.18 ±  9%      +0.0        0.19 ± 14%      -0.0        0.18 ± 16%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.16 ± 15%      +0.0        0.16 ± 20%      +0.0        0.17 ± 13%      +0.0        0.19 ± 12%  perf-profile.children.cycles-pp.update_rq_clock
      0.17 ± 22%      +0.0        0.17 ± 14%      +0.0        0.18 ± 21%      +0.0        0.17 ± 15%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.76 ±  8%      +0.0        0.77 ± 14%      -0.0        0.73 ± 14%      -0.0        0.71 ± 15%  perf-profile.children.cycles-pp.free_percpu
      0.43 ± 19%      +0.0        0.43 ±  9%      +0.0        0.43 ±  7%      -0.0        0.40 ±  4%  perf-profile.children.cycles-pp.sync_filesystem
      0.16 ± 17%      +0.0        0.16 ± 14%      +0.0        0.16 ±  9%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
      0.19 ± 13%      +0.0        0.19 ± 17%      +0.0        0.19 ± 15%      +0.0        0.19 ± 19%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.02 ±142%      +0.0        0.02 ±143%      -0.0        0.00            -0.0        0.01 ±223%  perf-profile.children.cycles-pp.balance_fair
      0.02 ±141%      +0.0        0.03 ±102%      +0.0        0.03 ±102%      +0.0        0.05 ± 45%  perf-profile.children.cycles-pp.autofs_show_options
      0.02 ±142%      +0.0        0.02 ±143%      +0.0        0.03 ± 70%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.note_gp_changes
      0.07 ± 53%      +0.0        0.08 ± 45%      -0.0        0.05 ± 49%      -0.0        0.06 ± 14%  perf-profile.children.cycles-pp.propagation_next
      0.09 ± 28%      +0.0        0.09 ± 17%      -0.0        0.08 ± 48%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.34 ± 10%      +0.0        0.35 ±  8%      -0.0        0.34 ± 11%      +0.0        0.38 ±  9%  perf-profile.children.cycles-pp.dequeue_entity
      0.04 ± 77%      +0.0        0.05 ± 48%      -0.0        0.04 ± 72%      +0.0        0.06 ± 48%  perf-profile.children.cycles-pp.getdelim
      0.08 ± 13%      +0.0        0.09 ± 27%      +0.0        0.09 ± 24%      -0.0        0.07 ± 11%  perf-profile.children.cycles-pp.folio_alloc
      0.17 ± 17%      +0.0        0.18 ± 15%      +0.0        0.18 ±  9%      -0.0        0.17 ±  9%  perf-profile.children.cycles-pp.shmem_mkdir
      0.07 ± 18%      +0.0        0.08 ± 14%      +0.0        0.08 ± 13%      +0.0        0.08 ± 28%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
      0.06 ± 50%      +0.0        0.06 ± 50%      +0.0        0.08 ± 20%      +0.0        0.09 ± 20%  perf-profile.children.cycles-pp.pick_next_entity
      0.05 ± 74%      +0.0        0.05 ± 49%      +0.0        0.06 ± 17%      +0.0        0.06 ± 45%  perf-profile.children.cycles-pp.shrink_dcache_parent
      0.41 ± 10%      +0.0        0.41 ±  8%      +0.0        0.41 ±  6%      +0.0        0.41 ± 15%  perf-profile.children.cycles-pp.d_alloc
      0.09 ± 25%      +0.0        0.10 ± 19%      +0.0        0.10 ± 20%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp.__srcu_read_unlock
      0.16 ± 13%      +0.0        0.17 ±  4%      +0.0        0.19 ± 12%      +0.0        0.20 ± 17%  perf-profile.children.cycles-pp._copy_to_user
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.clear_inode
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.irq_work_run
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.irq_work_single
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp._printk
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.vprintk_emit
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.console_unlock
      0.05 ± 47%      +0.0        0.05 ±  8%      -0.0        0.04 ± 73%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.console_flush_all
      0.09 ± 22%      +0.0        0.09 ± 25%      -0.0        0.08 ± 26%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.pcpu_block_update
      0.10 ± 15%      +0.0        0.10 ± 22%      -0.0        0.10 ± 17%      -0.0        0.08 ± 10%  perf-profile.children.cycles-pp.xas_find
      0.08 ± 13%      +0.0        0.09 ± 26%      +0.0        0.10 ± 21%      -0.0        0.07 ± 14%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.05 ± 47%  perf-profile.children.cycles-pp.find_lock_entries
      0.06 ± 11%      +0.0        0.07 ± 23%      -0.0        0.06 ± 51%      +0.0        0.08 ± 22%  perf-profile.children.cycles-pp.sock_def_readable
      0.12 ± 15%      +0.0        0.12 ± 18%      +0.0        0.13 ± 25%      +0.0        0.14 ± 15%  perf-profile.children.cycles-pp.kernfs_get_target_path
      0.45 ±  6%      +0.0        0.46 ± 10%      +0.0        0.50 ± 16%      +0.1        0.54 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      0.23 ± 21%      +0.0        0.24 ± 15%      -0.0        0.21 ± 16%      -0.0        0.22 ± 14%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.68 ±  3%      +0.0        0.69 ±  4%      -0.0        0.68 ±  7%      +0.0        0.72 ± 11%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.14 ± 22%      +0.0        0.15 ± 24%      +0.0        0.16 ± 23%      +0.0        0.17 ± 31%  perf-profile.children.cycles-pp.rebalance_domains
      0.04 ± 77%      +0.0        0.05 ± 46%      +0.0        0.06 ± 19%      -0.0        0.02 ±146%  perf-profile.children.cycles-pp.__fs_parse
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.tick_program_event
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.apparmor_sb_mount
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kernfs_refresh_inode
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.search_binary_handler
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.bprm_execve
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_init
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.security_file_permission
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.prctl
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.select_idle_sibling
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.map_id_range_down
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.radix_tree_node_rcu_free
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.free_unref_page_list
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.cap_capable
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.seq_release
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.cgroup_show_path
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.mnt_reset_fs
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.memcmp@plt
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±143%      +0.0        0.00        perf-profile.children.cycles-pp.rcu_exp_jiffies_till_stall_check
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.03 ±111%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.dbus_message_get_interface
      0.02 ±141%      +0.0        0.02 ± 99%      +0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      0.12 ± 15%      +0.0        0.12 ± 13%      +0.0        0.14 ± 24%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.alloc_fs_context
      0.14 ± 40%      +0.0        0.15 ± 47%      -0.0        0.13 ± 44%      -0.0        0.11 ± 41%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.05 ± 47%      +0.0        0.06            -0.0        0.04 ± 73%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.irq_work_run_list
      0.02 ±144%      +0.0        0.03 ±101%      +0.0        0.02 ±141%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.__rw_verify_area
      0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.children.cycles-pp.devpts_show_options
      0.01 ±223%      +0.0        0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_dtor
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_execve
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.do_execveat_common
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.execve
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.seq_open
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.get_cpu_device
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.strcmp_ptr@plt
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__calc_delta
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ± 99%      +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.inode_sb_list_add
      0.04 ± 73%      +0.0        0.05 ± 46%      -0.0        0.02 ±142%      +0.0        0.05 ± 47%  perf-profile.children.cycles-pp.__libc_calloc
      0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.00            +0.0        0.02 ± 99%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.15 ± 22%      +0.0        0.16 ± 14%      -0.0        0.14 ± 17%      +0.0        0.17 ± 12%  perf-profile.children.cycles-pp.cpu_util
      0.04 ± 72%      +0.0        0.05 ± 47%      -0.0        0.04 ± 72%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.41 ± 20%      +0.0        0.42 ±  9%      +0.0        0.43 ±  7%      -0.0        0.39 ±  4%  perf-profile.children.cycles-pp.writeback_inodes_sb
      0.08 ±  8%      +0.0        0.09 ± 20%      +0.0        0.10 ± 15%      +0.0        0.09 ± 17%  perf-profile.children.cycles-pp.path_mount
      1.05 ±  6%      +0.0        1.06 ± 11%      +0.0        1.07 ± 11%      +0.2        1.26 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.29 ± 11%      +0.0        0.30 ±  6%      +0.0        0.33 ± 10%      +0.0        0.31 ±  6%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.05 ± 47%      +0.0        0.06 ± 23%      -0.0        0.04 ± 71%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.06 ± 19%      +0.0        0.08 ± 25%      +0.0        0.08 ± 22%      +0.0        0.06 ± 46%  perf-profile.children.cycles-pp.unregister_shrinker
      0.09 ± 18%      +0.0        0.10 ± 18%      +0.0        0.11 ± 11%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.perf_rotate_context
      0.26 ±  6%      +0.0        0.28 ±  5%      +0.0        0.28 ± 12%      +0.1        0.34 ±  8%  perf-profile.children.cycles-pp.update_curr
      0.24 ± 18%      +0.0        0.25 ± 13%      +0.0        0.28 ± 18%      -0.0        0.22 ± 17%  perf-profile.children.cycles-pp.clockevents_program_event
      0.02 ±142%      +0.0        0.03 ±105%      -0.0        0.01 ±223%      +0.0        0.07 ± 56%  perf-profile.children.cycles-pp.__mod_timer
      0.01 ±223%      +0.0        0.02 ±144%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.children.cycles-pp.simple_write_end
      0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.children.cycles-pp.propagate_mount_unlock
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.05 ± 71%      +0.0        0.06 ± 21%      +0.0        0.06 ± 31%      +0.0        0.07 ± 54%  perf-profile.children.cycles-pp.unit_file_find_dropin_paths
      0.20 ± 10%      +0.0        0.22 ± 17%      +0.0        0.21 ±  8%      +0.0        0.24 ± 14%  perf-profile.children.cycles-pp.__close_nocancel
      0.12 ± 21%      +0.0        0.13 ± 11%      +0.0        0.12 ± 24%      +0.0        0.12 ± 21%  perf-profile.children.cycles-pp.ramfs_mkdir
      0.40 ± 22%      +0.0        0.42 ±  9%      +0.0        0.43 ±  7%      -0.0        0.38 ±  4%  perf-profile.children.cycles-pp.get_nr_dirty_inodes
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp._dbus_first_type_in_signature
      0.12 ± 15%      +0.0        0.14 ± 17%      +0.0        0.13 ± 10%      +0.0        0.16 ± 15%  perf-profile.children.cycles-pp.propagate_umount
      0.18 ± 18%      +0.0        0.19 ±  9%      +0.0        0.22 ± 14%      +0.0        0.18 ± 20%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.38 ± 13%      +0.0        0.39 ± 12%      +0.0        0.38 ± 11%      +0.1        0.53 ± 15%  perf-profile.children.cycles-pp.__wake_up_common
      0.04 ±101%      +0.0        0.05 ± 46%      +0.0        0.05 ± 52%      -0.0        0.02 ±152%  perf-profile.children.cycles-pp.rb_erase
      0.03 ±100%      +0.0        0.05 ± 45%      -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.children.cycles-pp.get_random_u32
      0.04 ±101%      +0.0        0.05 ± 49%      -0.0        0.02 ±144%      -0.0        0.03 ±101%  perf-profile.children.cycles-pp.xas_clear_mark
      0.27 ± 17%      +0.0        0.28 ±  6%      +0.0        0.28 ± 13%      +0.0        0.29 ± 20%  perf-profile.children.cycles-pp.native_sched_clock
      0.09 ± 30%      +0.0        0.11 ± 15%      +0.0        0.13 ± 18%      +0.0        0.10 ± 23%  perf-profile.children.cycles-pp.recvmsg
      0.15 ± 26%      +0.0        0.16 ±  9%      +0.0        0.19 ± 14%      +0.0        0.15 ± 13%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.i_callback
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.05 ± 73%      +0.0        0.06 ± 17%      -0.0        0.04 ± 72%      +0.0        0.05 ± 45%  perf-profile.children.cycles-pp.exp_funnel_lock
      0.03 ±102%      +0.0        0.04 ± 47%      +0.0        0.04 ± 71%      +0.0        0.04 ± 45%  perf-profile.children.cycles-pp.__unfreeze_partials
      0.21 ± 34%      +0.0        0.22 ± 23%      -0.0        0.20 ± 28%      -0.0        0.17 ± 31%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.24 ± 16%      +0.0        0.25 ±  6%      +0.0        0.25 ± 12%      +0.0        0.27 ± 21%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.56 ±  8%      +0.0        0.57 ±  5%      +0.0        0.58 ±  5%      +0.1        0.62 ± 12%  perf-profile.children.cycles-pp.umount_tree
      1.01 ± 13%      +0.0        1.03 ±  3%      -0.0        0.96 ± 12%      -0.0        0.98 ± 12%  perf-profile.children.cycles-pp.scheduler_tick
      0.14 ±  7%      +0.0        0.16 ± 11%      +0.0        0.18 ±  7%      +0.0        0.15 ± 27%  perf-profile.children.cycles-pp.inode_init_always
      0.06 ± 51%      +0.0        0.08 ± 22%      +0.0        0.07 ± 18%      -0.0        0.05 ± 46%  perf-profile.children.cycles-pp.shmem_free_in_core_inode
      0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.greedy_realloc
      0.02 ±144%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.02 ±142%      +0.0        0.04 ± 73%      +0.0        0.02 ±146%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.radix_tree_delete_item
      0.11 ± 19%      +0.0        0.13 ± 17%      +0.0        0.14 ±  8%      +0.0        0.16 ± 16%  perf-profile.children.cycles-pp.change_mnt_propagation
      0.00            +0.0        0.02 ±144%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.security_sb_mount
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.alloc_pages
      0.00            +0.0        0.02 ±144%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.02 ±141%      +0.0        0.04 ± 73%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%  perf-profile.children.cycles-pp.d_delete
      0.58 ± 14%      +0.0        0.60 ± 11%      -0.0        0.57 ± 21%      +0.3        0.85 ± 11%  perf-profile.children.cycles-pp.poll_idle
      0.72 ±  7%      +0.0        0.74 ± 11%      +0.0        0.73 ± 15%      -0.0        0.69 ± 10%  perf-profile.children.cycles-pp.delayed_free_vfsmnt
      0.11 ± 15%      +0.0        0.13 ± 13%      +0.0        0.13 ± 25%      +0.0        0.13 ± 21%  perf-profile.children.cycles-pp.strlcat
      0.94 ± 11%      +0.0        0.96 ±  6%      +0.0        0.98 ±  5%      -0.0        0.91 ±  5%  perf-profile.children.cycles-pp.mkdir
      0.26 ± 20%      +0.0        0.28 ±  9%      -0.0        0.25 ± 14%      -0.0        0.25 ± 13%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.06 ± 71%      +0.0        0.08 ± 14%      +0.0        0.07 ± 16%      +0.0        0.07 ± 14%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.10 ± 51%      +0.0        0.13 ± 22%      +0.0        0.11 ± 24%      +0.0        0.14 ± 14%  perf-profile.children.cycles-pp.select_task_rq
      0.01 ±223%      +0.0        0.04 ± 71%      +0.0        0.04 ± 75%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp._dbus_marshal_read_uint32
      0.00            +0.0        0.03 ±100%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.nr_iowait_cpu
      0.22 ± 18%      +0.0        0.25 ±  8%      +0.0        0.24 ± 24%      +0.0        0.26 ± 15%  perf-profile.children.cycles-pp.ramfs_mknod
      0.26 ± 14%      +0.0        0.29 ±  5%      +0.0        0.28 ± 12%      +0.0        0.28 ± 20%  perf-profile.children.cycles-pp.sched_clock
      0.58 ±  9%      +0.0        0.60 ±  9%      +0.0        0.60 ± 11%      +0.2        0.74 ± 13%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.14 ±  6%      +0.0        1.17 ±  3%      +0.1        1.19 ±  7%      -0.1        1.09 ±  5%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
      0.05 ± 72%      +0.0        0.08 ± 24%      +0.0        0.06 ± 47%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.42 ±  8%      +0.0        0.45 ±  6%      -0.0        0.42 ± 13%      +0.1        0.50 ±  5%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.06 ± 46%      +0.0        0.09 ± 20%      +0.0        0.08 ± 23%      +0.0        0.09 ± 17%  perf-profile.children.cycles-pp.mnt_release_group_id
      0.86 ± 10%      +0.0        0.89 ±  4%      +0.0        0.91 ±  7%      -0.0        0.85 ±  7%  perf-profile.children.cycles-pp.__x64_sys_mkdir
      0.01 ±223%      +0.0        0.04 ± 75%      +0.0        0.03 ±101%      +0.1        0.07 ± 54%  perf-profile.children.cycles-pp.prepare_to_swait_event
      0.02 ±144%      +0.0        0.05 ±  8%      +0.0        0.03 ±100%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.call_cpuidle
      0.12 ± 27%      +0.0        0.16 ± 18%      +0.0        0.14 ± 34%      +0.1        0.23 ± 32%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.05 ± 50%      +0.0        0.09 ± 64%      +0.0        0.10 ± 69%      +0.1        0.10 ± 80%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      1.13 ±  7%      +0.0        1.16 ±  4%      +0.1        1.18 ±  7%      -0.0        1.08 ±  5%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
      0.76 ± 12%      +0.0        0.80 ±  6%      +0.0        0.81 ±  7%      +0.0        0.76 ±  8%  perf-profile.children.cycles-pp.do_mkdirat
      0.64 ±  8%      +0.0        0.68 ±  4%      +0.1        0.73 ± 11%      +0.1        0.79 ±  9%  perf-profile.children.cycles-pp.activate_task
      2.27 ± 12%      +0.0        2.31 ±  3%      +0.0        2.32 ± 10%      -0.1        2.20 ± 12%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.33 ± 18%      +0.0        0.37 ± 11%      +0.1        0.38 ± 10%      +0.0        0.34 ±  6%  perf-profile.children.cycles-pp.vfs_mkdir
      0.69 ± 18%      +0.0        0.73 ±  5%      -0.0        0.67 ± 11%      +0.0        0.69 ± 14%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.68 ± 18%      +0.0        0.72 ±  6%      -0.0        0.66 ± 12%      +0.0        0.68 ± 14%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      1.41 ±  2%      +0.0        1.45 ±  4%      -0.0        1.40 ±  9%      +0.0        1.44 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.62 ±  7%      +0.0        0.66 ±  4%      +0.1        0.70 ± 11%      +0.1        0.76 ±  9%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.30 ± 12%      +0.0        2.34 ±  3%      +0.0        2.34 ± 10%      -0.1        2.21 ± 12%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.47 ± 10%      +0.0        0.51 ±  6%      +0.1        0.55 ± 13%      +0.1        0.61 ±  8%  perf-profile.children.cycles-pp.enqueue_entity
      0.81 ±  6%      +0.0        0.86 ±  6%      +0.1        0.90 ± 13%      +0.2        0.99 ±  8%  perf-profile.children.cycles-pp.ttwu_do_activate
      1.06 ± 19%      +0.1        1.12 ±  6%      +0.0        1.10 ± 11%      +0.0        1.09 ± 13%  perf-profile.children.cycles-pp.update_sg_lb_stats
      1.30 ± 19%      +0.1        1.35 ±  5%      +0.1        1.40 ±  9%      +0.0        1.32 ±  9%  perf-profile.children.cycles-pp.do_nanosleep
      0.55 ± 10%      +0.1        0.61 ±  6%      +0.1        0.62 ± 12%      +0.0        0.59 ± 10%  perf-profile.children.cycles-pp.__flush_work
      0.48 ± 23%      +0.1        0.54 ± 12%      +0.0        0.50 ± 15%      -0.0        0.48 ± 14%  perf-profile.children.cycles-pp.menu_select
      1.36 ± 19%      +0.1        1.42 ±  5%      +0.1        1.47 ± 10%      +0.0        1.38 ±  9%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      1.33 ± 19%      +0.1        1.39 ±  4%      +0.1        1.43 ± 10%      +0.0        1.35 ±  9%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      1.33 ± 19%      +0.1        1.39 ±  4%      +0.1        1.44 ± 10%      +0.0        1.36 ±  9%  perf-profile.children.cycles-pp.common_nsleep
      0.31 ±  9%      +0.1        0.37 ±  6%      +0.0        0.31 ± 12%      +0.1        0.36 ± 17%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.46 ± 10%      +0.1        0.53 ±  7%      +0.1        0.54 ± 10%      +0.1        0.52 ± 12%  perf-profile.children.cycles-pp.__wait_for_common
      3.96 ±  5%      +0.1        4.03            +0.0        3.99 ±  6%      +0.2        4.19 ±  7%  perf-profile.children.cycles-pp.worker_thread
      0.58 ± 10%      +0.1        0.65 ± 16%      +0.0        0.62 ± 23%      +0.2        0.80 ± 21%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      1.48 ± 20%      +0.1        1.56 ±  5%      +0.1        1.59 ± 10%      +0.0        1.49 ±  9%  perf-profile.children.cycles-pp.clock_nanosleep
      0.31 ± 18%      +0.1        0.39 ± 13%      +0.0        0.32 ± 27%      +0.2        0.54 ± 20%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait_once
      0.66 ±  8%      +0.1        0.74 ± 10%      +0.1        0.72 ± 16%      +0.2        0.86 ±  5%  perf-profile.children.cycles-pp.schedule_timeout
      2.00 ± 11%      +0.1        2.08 ±  5%      +0.1        2.06 ± 10%      +0.1        2.09 ±  7%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.34 ± 19%      +0.1        0.43 ± 13%      +0.0        0.38 ± 24%      +0.2        0.59 ± 19%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait
      1.16 ± 18%      +0.1        1.25 ±  6%      +0.1        1.22 ± 10%      +0.0        1.20 ± 13%  perf-profile.children.cycles-pp.update_sd_lb_stats
      1.19 ± 17%      +0.1        1.28 ±  6%      +0.1        1.25 ± 10%      +0.0        1.22 ± 13%  perf-profile.children.cycles-pp.find_busiest_group
      1.42 ± 17%      +0.1        1.51 ±  5%      +0.0        1.45 ± 10%      +0.0        1.45 ± 10%  perf-profile.children.cycles-pp.newidle_balance
      3.28 ±  5%      +0.1        3.38            +0.0        3.30 ±  7%      +0.3        3.55 ±  6%  perf-profile.children.cycles-pp.process_one_work
      0.60 ± 13%      +0.1        0.70 ± 25%      +0.0        0.62 ± 31%      +0.3        0.87 ± 23%  perf-profile.children.cycles-pp.rcu_note_context_switch
      1.30 ± 17%      +0.1        1.40 ±  7%      +0.1        1.38 ± 10%      +0.0        1.34 ± 13%  perf-profile.children.cycles-pp.load_balance
      0.42 ± 22%      +0.1        0.56 ± 26%      +0.0        0.45 ± 42%      +0.3        0.70 ± 27%  perf-profile.children.cycles-pp.swake_up_one
      0.65 ± 16%      +0.1        0.79 ± 10%      +0.1        0.71 ± 17%      +0.4        1.02 ± 17%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
      1.41 ±  8%      +0.2        1.57 ± 11%      +0.1        1.48 ± 17%      +0.4        1.81 ± 10%  perf-profile.children.cycles-pp.try_to_wake_up
      4.24 ±  5%      +0.2        4.40 ±  4%      +0.1        4.29 ± 11%      +0.5        4.75 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.12 ± 16%      +0.2        0.28 ± 57%      +0.0        0.16 ± 42%      +0.1        0.21 ± 78%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.10 ± 21%      +0.2        0.27 ± 61%      +0.1        0.15 ± 45%      +0.1        0.20 ± 80%  perf-profile.children.cycles-pp.tick_irq_enter
      0.27 ± 33%      +0.2        0.45 ± 32%      +0.1        0.36 ± 29%      +0.1        0.34 ± 48%  perf-profile.children.cycles-pp.ktime_get
      3.48 ±  4%      +0.2        3.70 ±  3%      +0.2        3.64 ± 11%      +0.5        3.94 ±  6%  perf-profile.children.cycles-pp.schedule
      1.27 ± 15%      +0.4        1.65 ± 17%      +0.1        1.41 ± 26%      +0.2        1.48 ± 25%  perf-profile.children.cycles-pp.run_ksoftirqd
      1.35 ± 15%      +0.4        1.75 ± 17%      +0.1        1.49 ± 25%      +0.2        1.56 ± 24%  perf-profile.children.cycles-pp.smpboot_thread_fn
      5.37 ±  6%      +0.5        5.83 ±  5%      +0.2        5.53 ±  4%      +0.4        5.80 ±  7%  perf-profile.children.cycles-pp.ret_from_fork
      5.37 ±  6%      +0.5        5.83 ±  5%      +0.2        5.53 ±  4%      +0.4        5.80 ±  7%  perf-profile.children.cycles-pp.kthread
     29.55 ± 10%      +0.7       30.27 ±  3%      +1.1       30.66 ±  7%      +0.5       30.02 ±  5%  perf-profile.children.cycles-pp.start_secondary
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.children.cycles-pp.x86_64_start_kernel
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.children.cycles-pp.x86_64_start_reservations
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.children.cycles-pp.start_kernel
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.children.cycles-pp.arch_call_rest_init
      6.77 ± 23%      +2.2        8.97 ± 17%      +0.1        6.88 ± 14%      -0.5        6.30 ± 22%  perf-profile.children.cycles-pp.rest_init
     29.80 ±  9%      +2.8       32.57 ±  3%      +1.1       30.90 ±  8%      -0.1       29.71 ±  3%  perf-profile.children.cycles-pp.intel_idle
     34.79 ±  8%      +2.9       37.67 ±  2%      +1.2       35.99 ±  6%      -0.0       34.74 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
     34.80 ±  8%      +2.9       37.68 ±  2%      +1.2       36.00 ±  6%      -0.0       34.75 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
     36.32 ±  8%      +2.9       39.24 ±  2%      +1.2       37.53 ±  5%      +0.0       36.32 ±  3%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     36.32 ±  8%      +2.9       39.24 ±  2%      +1.2       37.53 ±  5%      +0.0       36.32 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
     36.31 ±  8%      +2.9       39.23 ±  2%      +1.2       37.52 ±  5%      +0.0       36.32 ±  3%  perf-profile.children.cycles-pp.do_idle
     35.47 ±  8%      +2.9       38.41 ±  2%      +1.2       36.68 ±  6%      -0.0       35.42 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.33 ± 11%      -0.2        1.14 ±  4%      -0.1        1.27 ± 10%      -0.1        1.25 ±  6%  perf-profile.self.cycles-pp.malloc
      1.58 ±  7%      -0.1        1.45 ±  6%      -0.1        1.51 ±  8%      -0.0        1.57 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock
      1.42 ± 10%      -0.1        1.31 ±  9%      -0.1        1.32 ±  9%      -0.0        1.38 ±  6%  perf-profile.self.cycles-pp.siphash24_compress
      0.70 ± 10%      -0.1        0.62 ± 11%      -0.0        0.68 ± 16%      -0.1        0.64 ± 13%  perf-profile.self.cycles-pp.__slab_free
      0.44 ± 14%      -0.1        0.37 ±  6%      -0.0        0.40 ± 15%      -0.0        0.42 ± 14%  perf-profile.self.cycles-pp.siphash24_finalize
      0.41 ± 15%      -0.1        0.34 ±  7%      -0.0        0.40 ± 13%      +0.0        0.41 ±  7%  perf-profile.self.cycles-pp.device_read_db_internal_filename
      1.16 ±  7%      -0.1        1.10 ±  3%      -0.0        1.16 ±  3%      -0.1        1.08 ±  5%  perf-profile.self.cycles-pp.strncpy_from_user
      0.67 ± 10%      -0.1        0.61 ±  9%      -0.0        0.65 ± 12%      -0.0        0.65 ± 10%  perf-profile.self.cycles-pp.kmem_cache_free
      0.30 ± 22%      -0.1        0.25 ± 10%      -0.1        0.25 ± 17%      -0.0        0.26 ±  8%  perf-profile.self.cycles-pp.unit_name_is_valid
      0.48 ± 14%      -0.1        0.42 ± 10%      +0.0        0.50 ±  9%      +0.0        0.48 ±  6%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      1.30 ±  8%      -0.0        1.25 ±  2%      -0.1        1.24 ±  6%      -0.0        1.26 ±  4%  perf-profile.self.cycles-pp._find_next_bit
      0.52 ± 11%      -0.0        0.47 ± 15%      -0.1        0.47 ±  9%      -0.0        0.48 ± 10%  perf-profile.self.cycles-pp.rdrand
      0.13 ± 15%      -0.0        0.09 ± 22%      -0.0        0.12 ± 19%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp._hashmap_first_key_and_value
      0.64 ±  8%      -0.0        0.59 ±  5%      +0.0        0.64 ±  6%      -0.1        0.58 ± 10%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.41 ± 10%      -0.0        0.36 ±  7%      +0.0        0.41 ± 10%      +0.0        0.42 ±  7%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.40 ± 16%      -0.0        0.36 ± 10%      -0.0        0.37 ± 15%      -0.0        0.38 ±  8%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.17 ± 16%      -0.0        0.13 ± 13%      -0.0        0.15 ± 12%      -0.0        0.14 ± 14%  perf-profile.self.cycles-pp.task_work_add
      0.31 ± 20%      -0.0        0.27 ± 10%      +0.0        0.32 ± 17%      +0.0        0.34 ±  7%  perf-profile.self.cycles-pp.cfree
      0.30 ± 13%      -0.0        0.26 ±  7%      -0.0        0.29 ± 11%      -0.0        0.28 ± 17%  perf-profile.self.cycles-pp.lockref_put_return
      1.44 ±  7%      -0.0        1.40 ±  8%      +0.0        1.44 ±  7%      +0.0        1.46 ±  8%  perf-profile.self.cycles-pp.memset_orig
      0.04 ± 72%      -0.0        0.00            -0.0        0.03 ±101%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.truncate_inode_pages_range
      0.20 ± 20%      -0.0        0.16 ± 12%      -0.0        0.18 ±  6%      -0.0        0.19 ± 21%  perf-profile.self.cycles-pp.number
      0.76 ± 10%      -0.0        0.72 ±  5%      +0.0        0.81            -0.0        0.74 ± 11%  perf-profile.self.cycles-pp.stress_mwc32
      0.25 ±  7%      -0.0        0.22 ± 14%      -0.0        0.25 ± 18%      -0.0        0.24 ± 10%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.10 ± 13%      -0.0        0.06 ± 47%      -0.0        0.08 ± 16%      -0.0        0.09 ± 15%  perf-profile.self.cycles-pp.__close
      0.20 ± 15%      -0.0        0.16 ± 13%      -0.0        0.18 ± 15%      -0.0        0.17 ± 13%  perf-profile.self.cycles-pp.strchr
      0.22 ± 15%      -0.0        0.19 ± 10%      -0.0        0.21 ± 28%      +0.0        0.23 ± 11%  perf-profile.self.cycles-pp.generic_permission
      0.07 ± 20%      -0.0        0.04 ± 75%      -0.0        0.03 ±100%      -0.0        0.05 ± 45%  perf-profile.self.cycles-pp.__mnt_want_write
      0.03 ± 70%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.show_type
      0.12 ± 19%      -0.0        0.08 ± 22%      -0.0        0.08 ± 20%      -0.0        0.07 ± 53%  perf-profile.self.cycles-pp.common_perm_cond
      0.20 ± 15%      -0.0        0.17 ± 11%      -0.0        0.18 ± 22%      -0.0        0.18 ± 23%  perf-profile.self.cycles-pp.strchr@plt
      0.25 ± 18%      -0.0        0.22 ± 16%      -0.0        0.23 ± 13%      -0.0        0.25 ± 14%  perf-profile.self.cycles-pp.vsnprintf
      0.08 ±  8%      -0.0        0.05 ± 71%      -0.0        0.07 ±  7%      -0.0        0.07 ± 37%  perf-profile.self.cycles-pp.path_simplify
      0.12 ± 17%      -0.0        0.08 ± 21%      -0.0        0.08 ± 33%      -0.0        0.09 ± 23%  perf-profile.self.cycles-pp.string_hash_func
      0.05 ± 48%      -0.0        0.02 ±142%      -0.0        0.05 ± 47%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.strnlen_user
      0.16 ± 13%      -0.0        0.14 ± 14%      -0.0        0.16 ± 16%      -0.0        0.15 ± 23%  perf-profile.self.cycles-pp.up_read
      0.07 ± 18%      -0.0        0.04 ± 73%      -0.0        0.05 ± 45%      -0.0        0.06 ± 46%  perf-profile.self.cycles-pp._copy_from_user
      0.03 ±101%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.seq_puts
      0.17 ± 19%      -0.0        0.14 ± 18%      -0.0        0.16 ± 18%      +0.0        0.17 ± 10%  perf-profile.self.cycles-pp.filename_lookup
      0.03 ±100%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.08 ± 23%      -0.0        0.05 ± 45%      -0.0        0.05 ± 46%      -0.0        0.07 ± 16%  perf-profile.self.cycles-pp.xas_start
      0.08 ± 20%      -0.0        0.05 ± 48%      +0.0        0.08 ± 22%      +0.0        0.08 ± 19%  perf-profile.self.cycles-pp.__fxstat64
      0.29 ± 10%      -0.0        0.27 ± 12%      -0.0        0.28 ± 15%      +0.0        0.31 ±  7%  perf-profile.self.cycles-pp.format_decode
      0.06 ± 15%      -0.0        0.03 ±102%      -0.0        0.04 ± 79%      +0.0        0.07 ± 20%  perf-profile.self.cycles-pp.resched_curr
      0.05 ± 47%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.fsnotify_destroy_marks
      0.03 ±100%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.object_path_is_valid
      0.06 ± 13%      -0.0        0.03 ±103%      -0.0        0.04 ± 72%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.08 ± 27%      -0.0        0.06 ± 45%      -0.0        0.08 ± 27%      -0.0        0.08 ± 18%  perf-profile.self.cycles-pp.mangle_path
      0.20 ± 18%      -0.0        0.17 ± 16%      -0.0        0.17 ± 25%      +0.0        0.20 ± 17%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.16 ±  8%      -0.0        0.13 ± 10%      -0.0        0.14 ± 24%      +0.0        0.17 ± 13%  perf-profile.self.cycles-pp.kfree
      0.13 ± 20%      -0.0        0.10 ± 19%      -0.0        0.12 ± 12%      -0.0        0.10 ± 12%  perf-profile.self.cycles-pp.mutex_unlock
      0.26 ± 12%      -0.0        0.24 ± 10%      -0.0        0.22 ±  8%      -0.0        0.24 ± 11%  perf-profile.self.cycles-pp.strlen
      0.20 ± 20%      -0.0        0.17 ± 25%      -0.0        0.18 ± 22%      -0.0        0.18 ± 13%  perf-profile.self.cycles-pp.device_add_property_aux
      0.12 ± 16%      -0.0        0.09 ± 16%      -0.0        0.10 ± 16%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.xas_descend
      0.07 ± 21%      -0.0        0.04 ± 47%      -0.0        0.05 ± 48%      -0.0        0.06 ± 19%  perf-profile.self.cycles-pp.mnt_fstype_is_pseudofs
      0.08 ± 16%      -0.0        0.05 ± 47%      +0.0        0.08 ± 13%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.__do_sys_newfstat
      0.08 ± 25%      -0.0        0.06 ± 48%      +0.0        0.08 ± 21%      -0.0        0.06 ± 21%  perf-profile.self.cycles-pp.slab_pre_alloc_hook
      0.05 ± 47%      -0.0        0.02 ±141%      -0.0        0.03 ±105%      +0.0        0.05 ± 75%  perf-profile.self.cycles-pp.prepare_task_switch
      0.13 ± 14%      -0.0        0.11 ± 14%      +0.0        0.14 ± 20%      +0.0        0.15 ± 15%  perf-profile.self.cycles-pp.siphash24_init
      0.35 ± 10%      -0.0        0.33 ± 10%      -0.0        0.35 ± 11%      -0.0        0.33 ±  5%  perf-profile.self.cycles-pp.step_into
      0.08 ± 20%      -0.0        0.06 ± 48%      -0.0        0.06 ± 52%      +0.0        0.08 ± 28%  perf-profile.self.cycles-pp.path_hash_func
      0.34 ±  9%      -0.0        0.32 ±  7%      -0.0        0.31 ±  8%      -0.0        0.32 ± 15%  perf-profile.self.cycles-pp.__check_heap_object
      0.06 ±  9%      -0.0        0.03 ± 70%      -0.0        0.04 ± 45%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.__bitmap_clear
      0.10 ± 21%      -0.0        0.08 ± 14%      -0.0        0.10 ± 15%      -0.0        0.10 ± 13%  perf-profile.self.cycles-pp.llist_add_batch
      0.10 ± 31%      -0.0        0.08 ± 23%      +0.0        0.10 ± 14%      -0.0        0.09 ± 13%  perf-profile.self.cycles-pp.___slab_alloc
      0.07 ± 12%      -0.0        0.05 ± 46%      +0.0        0.07 ± 20%      -0.0        0.06 ± 46%  perf-profile.self.cycles-pp.task_work_run
      0.02 ±142%      -0.0        0.00            +0.0        0.03 ±100%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.rb_next
      0.27 ± 10%      -0.0        0.25 ± 14%      -0.0        0.24 ±  3%      +0.0        0.27 ±  8%  perf-profile.self.cycles-pp.__kmem_cache_free
      0.03 ±102%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.memcg_account_kmem
      0.07 ± 18%      -0.0        0.05 ± 46%      -0.0        0.06 ± 45%      -0.0        0.04 ± 77%  perf-profile.self.cycles-pp.pcpu_next_fit_region
      0.07 ± 21%      -0.0        0.05 ± 46%      -0.0        0.06 ± 47%      -0.0        0.04 ± 74%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.08 ± 27%      -0.0        0.06 ± 51%      +0.0        0.09 ± 21%      -0.0        0.08 ± 30%  perf-profile.self.cycles-pp.strlen@plt
      0.07 ±  9%      -0.0        0.05 ± 47%      -0.0        0.05 ± 48%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp._atomic_dec_and_lock
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.__wake_up_common
      0.24 ±  8%      -0.0        0.22 ± 12%      +0.0        0.26 ± 14%      +0.0        0.26 ± 11%  perf-profile.self.cycles-pp.__entry_text_start
      0.50 ±  9%      -0.0        0.48 ± 11%      +0.0        0.51 ± 10%      +0.0        0.52 ±  7%  perf-profile.self.cycles-pp.path_init
      0.45 ± 11%      -0.0        0.43 ±  8%      +0.0        0.46 ±  5%      +0.0        0.47 ±  3%  perf-profile.self.cycles-pp.path_compare
      0.48 ± 13%      -0.0        0.46 ± 11%      +0.0        0.49 ±  7%      +0.0        0.48 ±  9%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.22 ± 11%      -0.0        0.21 ± 12%      -0.0        0.22 ± 15%      +0.0        0.23 ±  8%  perf-profile.self.cycles-pp.__d_lookup
      0.04 ± 75%      -0.0        0.02 ±144%      -0.0        0.02 ±144%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.open64
      0.08 ± 25%      -0.0        0.06 ± 11%      -0.0        0.06 ± 48%      -0.0        0.07 ± 15%  perf-profile.self.cycles-pp.generic_fillattr
      0.02 ±142%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.__legitimize_path
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.error_entry
      0.02 ±142%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.deactivate_super
      0.04 ± 73%      -0.0        0.02 ±142%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.kernfs_iop_permission
      0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±144%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.strncmp
      0.08 ± 17%      -0.0        0.06 ± 49%      -0.0        0.07 ±  9%      -0.0        0.06 ± 49%  perf-profile.self.cycles-pp.llist_reverse_order
      0.13 ± 30%      -0.0        0.12 ± 28%      -0.0        0.11 ± 21%      -0.0        0.12 ± 28%  perf-profile.self.cycles-pp.idle_cpu
      0.13 ± 28%      -0.0        0.11 ± 14%      -0.0        0.12 ± 20%      -0.0        0.12 ± 12%  perf-profile.self.cycles-pp.vfs_getattr_nosec
      0.16 ± 26%      -0.0        0.14 ± 15%      -0.0        0.14 ±  7%      -0.0        0.16 ±  7%  perf-profile.self.cycles-pp.ida_alloc_range
      0.17 ± 12%      -0.0        0.15 ± 19%      -0.0        0.16 ± 12%      -0.0        0.16 ± 12%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.10 ± 14%      -0.0        0.08 ± 14%      -0.0        0.08 ± 28%      -0.0        0.08 ±  9%  perf-profile.self.cycles-pp.init_file
      0.10 ± 29%      -0.0        0.08 ± 16%      -0.0        0.08 ± 16%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp.mutex_lock_killable
      0.10 ± 28%      -0.0        0.08 ± 17%      -0.0        0.09 ± 31%      -0.0        0.08 ± 12%  perf-profile.self.cycles-pp.prepend_path
      0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.show_mnt_opts
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__queue_work
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.unit_name_escape
      0.02 ±141%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±223%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.02 ±141%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.xas_find_marked
      0.02 ±141%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.commit_tree
      0.04 ± 71%      -0.0        0.02 ±144%      +0.0        0.05 ± 44%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.try_to_unlazy
      0.11 ±  8%      -0.0        0.09 ± 28%      -0.0        0.10 ± 48%      -0.0        0.10 ± 15%  perf-profile.self.cycles-pp.walk_component
      0.06 ± 45%      -0.0        0.05 ± 46%      +0.0        0.07 ± 49%      +0.0        0.08 ± 22%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      2.93 ± 11%      -0.0        2.91 ±  5%      -0.0        2.92 ±  5%      +0.0        2.96 ±  3%  perf-profile.self.cycles-pp.stress_rndstr
      0.15 ± 11%      -0.0        0.13 ± 28%      -0.0        0.13 ± 19%      -0.0        0.14 ± 10%  perf-profile.self.cycles-pp.free_percpu
      0.14 ± 10%      -0.0        0.13 ± 23%      -0.0        0.12 ± 19%      +0.0        0.14 ± 13%  perf-profile.self.cycles-pp.show_mountinfo
      0.05 ± 47%      -0.0        0.04 ± 71%      -0.0        0.05 ± 75%      -0.0        0.03 ±105%  perf-profile.self.cycles-pp.rcu_nocb_try_bypass
      0.07 ± 21%      -0.0        0.06 ± 11%      +0.0        0.08 ± 25%      +0.0        0.08 ± 19%  perf-profile.self.cycles-pp.memcg_list_lru_alloc
      0.04 ± 73%      -0.0        0.02 ±142%      +0.0        0.04 ± 73%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.strspn@plt
      0.08 ± 17%      -0.0        0.07 ± 18%      +0.0        0.08 ± 13%      -0.0        0.07 ± 48%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.06 ±  8%      -0.0        0.04 ± 73%      +0.0        0.07 ± 48%      -0.0        0.05 ± 46%  perf-profile.self.cycles-pp.stress_ramfs_child
      0.04 ± 72%      -0.0        0.02 ±141%      -0.0        0.04 ± 71%      +0.0        0.05 ± 75%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.08 ± 22%      -0.0        0.06 ± 50%      +0.0        0.08 ± 13%      +0.0        0.09 ± 27%  perf-profile.self.cycles-pp.__memset
      0.12 ± 15%      -0.0        0.11 ± 17%      +0.0        0.13 ± 14%      +0.0        0.13 ± 15%  perf-profile.self.cycles-pp.memcpy_orig
      0.14 ± 21%      -0.0        0.12 ± 18%      +0.0        0.15 ± 28%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp.refill_obj_stock
      0.18 ± 13%      -0.0        0.17 ± 11%      +0.0        0.19 ± 10%      +0.0        0.18 ± 15%  perf-profile.self.cycles-pp._find_next_zero_bit
      0.22 ± 13%      -0.0        0.21 ±  6%      -0.0        0.20 ± 20%      -0.0        0.20 ± 19%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
      0.15 ± 16%      -0.0        0.14 ± 19%      -0.0        0.14 ±  6%      -0.0        0.14 ± 13%  perf-profile.self.cycles-pp.device_read_uevent_file
      0.08 ± 20%      -0.0        0.07 ± 27%      -0.0        0.07 ± 15%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.dequeue_entity
      0.13 ± 15%      -0.0        0.12 ± 35%      -0.0        0.12 ± 23%      +0.0        0.14 ± 16%  perf-profile.self.cycles-pp.realloc
      0.16 ± 11%      -0.0        0.15 ± 19%      -0.0        0.16 ± 15%      +0.0        0.18 ±  8%  perf-profile.self.cycles-pp.clone_mnt
      0.09 ± 26%      -0.0        0.08 ± 20%      +0.0        0.09 ± 17%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp.mutex_lock
      0.04 ± 72%      -0.0        0.02 ± 99%      -0.0        0.02 ±144%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08 ± 27%      -0.0        0.06 ± 47%      -0.0        0.07 ± 47%      -0.0        0.06 ± 45%  perf-profile.self.cycles-pp.set_next_entity
      0.12 ± 18%      -0.0        0.10 ± 20%      -0.0        0.10 ± 17%      -0.0        0.11 ± 21%  perf-profile.self.cycles-pp.umount2
      0.15 ± 10%      -0.0        0.14 ± 15%      +0.0        0.15 ± 15%      +0.0        0.16 ± 13%  perf-profile.self.cycles-pp.down_write
      0.24 ± 10%      -0.0        0.23 ± 10%      -0.0        0.24 ± 15%      -0.0        0.24 ± 14%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.07 ± 31%      -0.0        0.06 ± 49%      -0.0        0.05 ± 49%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.alloc_fd
      0.09 ± 32%      -0.0        0.08 ± 15%      -0.0        0.09 ± 15%      +0.0        0.10 ± 20%  perf-profile.self.cycles-pp.make_vfsuid
      0.09 ± 18%      -0.0        0.08 ± 16%      +0.0        0.09 ± 28%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp._hashmap_iterate
      0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp.update_min_vruntime
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.malloc@plt
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.strnlen
      0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.fput
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.05 ± 50%  perf-profile.self.cycles-pp.perf_pmu_nop_void
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.update_process_times
      0.07 ± 22%      -0.0        0.06 ± 13%      -0.0        0.04 ± 44%      +0.0        0.07 ± 23%  perf-profile.self.cycles-pp.path_startswith
      0.06 ± 19%      -0.0        0.05 ± 13%      -0.0        0.05 ± 49%      -0.0        0.06 ± 49%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.28 ± 11%      -0.0        0.27 ± 10%      -0.0        0.26 ± 10%      -0.0        0.24 ± 15%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.10 ± 17%      -0.0        0.09 ± 20%      -0.0        0.08 ± 20%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp.chacha_permute
      0.06 ± 49%      -0.0        0.05 ± 47%      -0.0        0.05 ± 52%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.vfs_create_mount
      0.08 ± 24%      -0.0        0.07 ± 14%      +0.0        0.09 ± 18%      +0.0        0.09 ± 34%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.09 ± 14%      -0.0        0.08 ± 20%      -0.0        0.08 ± 30%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.rcu_exp_handler
      0.10 ± 20%      -0.0        0.09 ± 24%      -0.0        0.09 ±  9%      +0.0        0.10 ± 14%  perf-profile.self.cycles-pp._IO_default_xsputn
      0.21 ± 12%      -0.0        0.20 ± 13%      -0.0        0.21 ±  8%      +0.0        0.22 ± 12%  perf-profile.self.cycles-pp.pcpu_alloc_area
      0.27 ± 11%      -0.0        0.26 ±  9%      -0.0        0.26 ± 15%      -0.0        0.25 ± 10%  perf-profile.self.cycles-pp.__cond_resched
      0.60 ±  8%      -0.0        0.59 ± 14%      +0.0        0.61 ±  6%      -0.0        0.57 ±  7%  perf-profile.self.cycles-pp.link_path_walk
      0.06 ± 11%      -0.0        0.05 ± 48%      -0.0        0.06 ± 50%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.inode_init_once
      0.04 ± 72%      -0.0        0.03 ±102%      +0.0        0.05 ± 75%      +0.0        0.07 ± 13%  perf-profile.self.cycles-pp.free@plt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.legitimize_links
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rmqueue
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.check_cpu_stall
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.get_partial_node
      0.01 ±223%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.pcpu_chunk_relocate
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.mntput
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.__lxstat64
      0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.02 ±144%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.trigger_load_balance
      0.09 ± 28%      -0.0        0.08 ± 24%      -0.0        0.08 ± 24%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp.rcu_pending
      0.70 ± 12%      -0.0        0.69 ±  8%      -0.0        0.67 ±  7%      -0.0        0.70 ±  9%  perf-profile.self.cycles-pp.pcpu_alloc
      0.11 ±  8%      -0.0        0.10 ± 18%      -0.0        0.10 ± 13%      +0.0        0.13 ± 14%  perf-profile.self.cycles-pp.do_syscall_64
      0.07 ± 17%      -0.0        0.06 ± 48%      -0.0        0.06 ± 51%      -0.0        0.07 ± 20%  perf-profile.self.cycles-pp.pcpu_block_update_hint_alloc
      0.12 ± 17%      -0.0        0.12 ± 13%      +0.0        0.12 ±  4%      +0.0        0.13 ±  8%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru
      0.11 ± 25%      -0.0        0.10 ± 10%      +0.0        0.11 ± 20%      +0.0        0.12 ± 28%  perf-profile.self.cycles-pp.process_one_work
      0.05 ± 72%      -0.0        0.04 ± 75%      +0.0        0.05 ± 48%      -0.0        0.05 ± 73%  perf-profile.self.cycles-pp.strlcpy
      0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.try_charge_memcg
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.native_apic_mem_write
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.security_file_free
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.release_pages
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mnt_table_next_fs
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.rebalance_domains
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.delete_trailing_chars
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.vfs_parse_fs_string
      0.01 ±223%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.drop_nlink
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__fs_parse
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._ext4_show_options
      0.01 ±223%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._hashmap_size
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_insert_color
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__radix_tree_lookup
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.update_blocked_averages
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.wq_worker_running
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.ramfs_get_inode
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.put_fs_context
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.propagate_one
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.path_openat
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.do_umount
      0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.check_stack_object
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__d_rehash
      0.01 ±223%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.reweight_entity
      0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.___d_drop
      0.01 ±223%      -0.0        0.00            +0.0        0.03 ±100%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.change_mnt_propagation
      0.02 ±142%      -0.0        0.01 ±223%      +0.0        0.05 ± 47%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.pcpu_find_block_fit
      0.08 ± 17%      -0.0        0.07 ± 20%      -0.0        0.04 ±104%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.path_equal
      0.08 ± 35%      -0.0        0.08 ± 32%      -0.0        0.08 ± 19%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.kernfs_dop_revalidate
      0.05 ± 46%      -0.0        0.04 ± 47%      +0.0        0.05 ± 51%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.pcpu_free_area
      0.08 ± 17%      -0.0        0.07 ± 10%      +0.0        0.08 ± 22%      -0.0        0.06 ± 45%  perf-profile.self.cycles-pp.__fput
      0.05 ± 74%      -0.0        0.04 ± 72%      +0.0        0.05 ± 46%      +0.0        0.06 ± 23%  perf-profile.self.cycles-pp.sync_regs
      0.14 ± 27%      -0.0        0.13 ±  9%      +0.0        0.14 ± 10%      +0.0        0.15 ± 13%  perf-profile.self.cycles-pp.xas_store
      0.06 ± 47%      -0.0        0.06 ± 48%      +0.0        0.08 ± 21%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.queue_work_on
      0.07 ± 24%      -0.0        0.06 ± 11%      +0.0        0.08 ± 13%      -0.0        0.06 ± 46%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.10 ± 19%      -0.0        0.09 ± 21%      -0.0        0.09 ±  7%      +0.0        0.11 ± 22%  perf-profile.self.cycles-pp.__list_add_valid
      0.20 ±  9%      -0.0        0.19 ±  9%      -0.0        0.19 ± 20%      +0.0        0.20 ± 18%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      1.35 ± 11%      -0.0        1.34 ±  5%      -0.0        1.31 ±  6%      +0.0        1.36 ±  5%  perf-profile.self.cycles-pp.mnt_get_count
      0.26 ±  8%      -0.0        0.25 ±  9%      -0.0        0.26 ±  7%      +0.0        0.26 ± 12%  perf-profile.self.cycles-pp.inode_permission
      0.17 ± 24%      -0.0        0.16 ± 15%      +0.0        0.17 ± 16%      -0.0        0.15 ± 22%  perf-profile.self.cycles-pp.get_nr_inodes
      0.04 ± 73%      -0.0        0.03 ±105%      -0.0        0.01 ±223%      +0.0        0.06 ± 51%  perf-profile.self.cycles-pp.__x64_sys_umount
      0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.04 ± 70%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.10 ± 25%      -0.0        0.09 ± 28%      -0.0        0.08 ± 19%      +0.0        0.12 ± 37%  perf-profile.self.cycles-pp.finish_task_switch
      0.04 ± 72%      -0.0        0.03 ±103%      -0.0        0.03 ±102%      +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.cpuacct_charge
      0.12 ±  9%      -0.0        0.12 ±  8%      -0.0        0.12 ± 13%      -0.0        0.12 ± 19%  perf-profile.self.cycles-pp.set_root
      0.08 ± 21%      -0.0        0.08 ± 16%      +0.0        0.08 ± 16%      -0.0        0.07 ± 12%  perf-profile.self.cycles-pp._find_next_and_bit
      0.03 ±100%      -0.0        0.02 ±141%      +0.0        0.03 ±101%      -0.0        0.02 ±146%  perf-profile.self.cycles-pp.copy_from_kernel_nofault
      0.12 ± 15%      -0.0        0.11 ± 47%      +0.0        0.12 ± 19%      -0.0        0.11 ± 15%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.11 ± 26%      -0.0        0.10 ± 20%      +0.0        0.12 ± 20%      -0.0        0.10 ± 31%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.03 ±100%      -0.0        0.02 ± 99%      +0.0        0.05 ± 48%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.strscpy
      0.18 ± 13%      -0.0        0.17 ±  8%      -0.0        0.16 ± 11%      -0.0        0.15 ± 13%  perf-profile.self.cycles-pp.apparmor_capable
      0.08 ± 12%      -0.0        0.07 ± 23%      +0.0        0.08 ± 23%      +0.0        0.08 ± 11%  perf-profile.self.cycles-pp.do_filp_open
      0.35 ±  9%      -0.0        0.34 ± 11%      -0.0        0.33 ± 11%      -0.0        0.31 ± 11%  perf-profile.self.cycles-pp.__call_rcu_common
      0.06 ± 47%      -0.0        0.05 ± 46%      -0.0        0.03 ±100%      +0.0        0.06 ± 48%  perf-profile.self.cycles-pp.memcpy@plt
      0.02 ± 99%      -0.0        0.02 ±144%      -0.0        0.01 ±223%      -0.0        0.02 ±142%  perf-profile.self.cycles-pp.newidle_balance
      0.05 ± 47%      -0.0        0.05 ± 45%      -0.0        0.04 ± 71%      +0.0        0.06 ± 46%  perf-profile.self.cycles-pp.umount_tree
      0.09 ± 14%      -0.0        0.08 ± 30%      -0.0        0.08 ± 13%      +0.0        0.09 ± 11%  perf-profile.self.cycles-pp.__filename_parentat
      0.23 ± 14%      -0.0        0.22 ±  9%      -0.0        0.22 ± 16%      -0.0        0.21 ±  5%  perf-profile.self.cycles-pp.__legitimize_mnt
      0.12 ± 20%      -0.0        0.12 ± 19%      -0.0        0.12 ± 13%      +0.0        0.13 ± 15%  perf-profile.self.cycles-pp.cp_new_stat
      0.12 ± 14%      -0.0        0.12 ±  8%      +0.0        0.12 ± 27%      +0.0        0.13 ± 17%  perf-profile.self.cycles-pp.lockref_get
      0.15 ± 17%      -0.0        0.15 ± 13%      +0.0        0.16 ± 14%      -0.0        0.13 ± 14%  perf-profile.self.cycles-pp.alloc_vfsmnt
      0.06 ± 50%      -0.0        0.06 ± 50%      +0.0        0.07 ± 20%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.path_lookupat
      0.14 ± 14%      -0.0        0.13 ± 19%      +0.0        0.15 ± 18%      +0.0        0.14 ± 13%  perf-profile.self.cycles-pp.dput
      0.16 ± 25%      -0.0        0.15 ±  8%      +0.0        0.18 ± 29%      -0.0        0.15 ± 21%  perf-profile.self.cycles-pp.__lookup_mnt
      0.26 ± 17%      -0.0        0.26 ± 16%      +0.0        0.29 ±  7%      +0.0        0.26 ± 15%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.06 ± 25%      -0.0        0.06 ± 47%      +0.0        0.07 ± 14%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.vmalloc_to_page
      0.07 ± 15%      -0.0        0.07 ± 27%      -0.0        0.05 ± 46%      +0.0        0.08 ± 25%  perf-profile.self.cycles-pp.string_table_lookup
      0.43 ±  8%      -0.0        0.43 ± 13%      -0.0        0.39 ± 12%      -0.0        0.40 ±  6%  perf-profile.self.cycles-pp.mod_objcg_state
      0.27 ± 10%      -0.0        0.27 ± 14%      -0.0        0.24 ± 18%      +0.0        0.28 ±  8%  perf-profile.self.cycles-pp.__switch_to_asm
      0.14 ± 20%      -0.0        0.13 ± 20%      -0.0        0.13 ± 20%      -0.0        0.14 ± 16%  perf-profile.self.cycles-pp.check_heap_object
      0.04 ± 47%      -0.0        0.04 ± 73%      -0.0        0.03 ±101%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.build_open_flags
      0.07 ± 45%      -0.0        0.06 ± 17%      -0.0        0.05 ± 49%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.10 ± 19%      -0.0        0.10 ± 23%      +0.0        0.10 ± 15%      -0.0        0.10 ± 23%  perf-profile.self.cycles-pp.strcmp
      0.05 ± 48%      -0.0        0.05 ± 46%      +0.0        0.06 ± 17%      -0.0        0.05 ± 73%  perf-profile.self.cycles-pp.kernfs_get_target_path
      0.04 ± 71%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.kmalloc_slab
      0.03 ±142%      -0.0        0.03 ±146%      -0.0        0.02 ±223%      -0.0        0.02 ±223%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.04 ± 71%      -0.0        0.04 ± 72%      +0.0        0.05 ± 48%      -0.0        0.04 ± 72%  perf-profile.self.cycles-pp.apparmor_file_open
      0.03 ±101%      -0.0        0.03 ±100%      -0.0        0.02 ±141%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.xas_find
      0.03 ±101%      -0.0        0.03 ±100%      -0.0        0.02 ±141%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.strcmp@plt
      0.13 ± 14%      -0.0        0.13 ± 13%      -0.0        0.12 ± 14%      +0.0        0.13 ± 18%  perf-profile.self.cycles-pp.up_write
      0.04 ± 75%      -0.0        0.04 ± 72%      -0.0        0.03 ± 70%      +0.0        0.05 ± 49%  perf-profile.self.cycles-pp.getdelim
      0.16 ± 23%      -0.0        0.15 ± 13%      +0.0        0.16 ± 20%      +0.0        0.16 ± 15%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.09 ± 16%      -0.0        0.08 ± 24%      +0.0        0.10 ±  9%      -0.0        0.08 ± 20%  perf-profile.self.cycles-pp.security_inode_permission
      0.16 ± 10%      -0.0        0.16 ± 14%      -0.0        0.16 ± 29%      -0.0        0.16 ± 16%  perf-profile.self.cycles-pp.rcu_all_qs
      0.11 ± 12%      -0.0        0.11 ± 25%      -0.0        0.10 ± 28%      -0.0        0.10 ± 13%  perf-profile.self.cycles-pp.__strdup
      0.05 ± 50%      -0.0        0.05 ± 49%      -0.0        0.04 ± 72%      +0.0        0.07 ± 13%  perf-profile.self.cycles-pp.chase_symlinks
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.percpu_free_rwsem
      0.02 ±142%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.kernfs_iop_getattr
      0.02 ±144%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      +0.0        0.04 ± 73%  perf-profile.self.cycles-pp.propagate_mnt
      0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.06 ± 50%      -0.0        0.06 ± 11%      -0.0        0.05 ± 45%      +0.0        0.07 ± 26%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.03 ±100%      -0.0        0.02 ± 99%      +0.0        0.03 ±105%      +0.0        0.05 ± 47%  perf-profile.self.cycles-pp.shmem_get_inode
      0.04 ± 72%      -0.0        0.04 ± 73%      +0.0        0.05 ± 74%      +0.0        0.05 ± 49%  perf-profile.self.cycles-pp.os_xsave
      0.03 ±100%      +0.0        0.03 ±100%      -0.0        0.02 ±142%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.nd_jump_root
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._IO_feof
      0.08 ± 19%      +0.0        0.08 ±  6%      -0.0        0.07 ± 23%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.pcpu_block_update_hint_free
      0.16 ±  8%      +0.0        0.16 ± 19%      -0.0        0.15 ± 18%      +0.0        0.19 ± 16%  perf-profile.self.cycles-pp.update_load_avg
      0.17 ± 20%      +0.0        0.17 ± 27%      -0.0        0.17 ± 10%      -0.0        0.17 ± 16%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.13 ± 12%      +0.0        0.13 ± 21%      +0.0        0.13 ± 19%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp.read_tsc
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.iput
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.hashmap_get2
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.dbus_message_get_reply_serial
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._find_first_bit
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.get_unused_fd_flags
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.unlink
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.add_uevent_var
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.xa_load
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.clear_inode
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.apparmor_inode_getattr
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.sget_fc
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.do_open
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.swake_up_one
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.find_lock_entries
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.d_same_name
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.activate_task
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.d_set_d_op
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.close_fd
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.attach_recursive_mnt
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.clear_buddies
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±141%  perf-profile.self.cycles-pp.map_id_range_down
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.00            +0.0        0.00            +0.0        0.00            +0.0        0.02 ±149%  perf-profile.self.cycles-pp.switch_fpu_return
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.04 ± 72%  perf-profile.self.cycles-pp.should_failslab
      0.08 ± 30%      +0.0        0.08 ± 17%      +0.0        0.09 ± 21%      +0.0        0.09 ± 33%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp._IO_link_in
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.namespace_unlock
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.vfs_mkdir
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_show_options
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.blkcg_maybe_throttle_current
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.memcmp@plt
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__filemap_get_folio
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.mnt_reset_fs
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.pick_file
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.strcspn@plt
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._raw_read_unlock_irqrestore
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.get_mountpoint
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±223%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.ihold
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.xas_create
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.bus_label_unescape_n
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.security_capable
      0.09 ± 14%      +0.0        0.09 ± 24%      +0.0        0.10 ± 20%      +0.0        0.10 ± 14%  perf-profile.self.cycles-pp.__fget_light
      0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.lookup_open
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±144%      +0.0        0.05 ± 72%  perf-profile.self.cycles-pp.strjoin_real
      0.11 ± 20%      +0.0        0.11 ± 11%      +0.0        0.13 ± 12%      -0.0        0.11 ± 20%  perf-profile.self.cycles-pp.___perf_sw_event
      0.03 ±101%      +0.0        0.03 ±101%      +0.0        0.05 ± 45%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.inode_maybe_inc_iversion
      0.00            +0.0        0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.putname
      0.00            +0.0        0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._hashmap_get
      0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.00        perf-profile.self.cycles-pp.__destroy_inode
      0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.00        perf-profile.self.cycles-pp.dbus_message_get_interface
      0.62 ± 13%      +0.0        0.62 ±  6%      +0.0        0.64 ±  6%      +0.0        0.64 ±  6%  perf-profile.self.cycles-pp.mnt_get_writers
      0.15 ± 19%      +0.0        0.15 ± 16%      +0.0        0.17 ± 15%      +0.0        0.15 ± 17%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.06 ± 48%      +0.0        0.06 ± 48%      +0.0        0.07 ± 21%      +0.0        0.08 ± 24%  perf-profile.self.cycles-pp.pick_next_entity
      0.15 ± 17%      +0.0        0.15 ± 12%      +0.0        0.15 ± 11%      +0.0        0.15 ± 19%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.11 ± 13%      +0.0        0.12 ± 14%      +0.0        0.14 ± 12%      +0.0        0.14 ± 19%  perf-profile.self.cycles-pp.getname_flags
      0.20 ± 16%      +0.0        0.20 ± 15%      +0.0        0.23 ± 27%      +0.0        0.22 ± 17%  perf-profile.self.cycles-pp.__switch_to
      0.06 ± 53%      +0.0        0.06 ± 47%      -0.0        0.06 ± 74%      +0.0        0.07 ± 19%  perf-profile.self.cycles-pp.rcu_exp_wait_wake
      0.10 ± 13%      +0.0        0.10 ± 18%      -0.0        0.10 ± 11%      -0.0        0.08 ± 18%  perf-profile.self.cycles-pp.apparmor_file_free_security
      0.08 ± 22%      +0.0        0.08 ± 16%      +0.0        0.09 ± 17%      +0.0        0.10 ± 20%  perf-profile.self.cycles-pp.hashmap_replace
      0.09 ± 22%      +0.0        0.09 ± 21%      +0.0        0.10 ± 13%      +0.0        0.11 ± 12%  perf-profile.self.cycles-pp._copy_to_user
      0.02 ±142%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.02 ±142%  perf-profile.self.cycles-pp.lookup_constant
      0.02 ±141%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.02 ±141%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._dbus_type_reader_get_current_type
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.put_prev_entity
      0.02 ±144%      +0.0        0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.02 ± 99%  perf-profile.self.cycles-pp.__d_alloc
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.pcpu_block_refresh_hint
      0.34 ± 11%      +0.0        0.34 ± 14%      -0.0        0.33 ± 17%      +0.1        0.40 ± 15%  perf-profile.self.cycles-pp.__schedule
      0.16 ± 19%      +0.0        0.17 ± 15%      -0.0        0.14 ± 24%      +0.0        0.17 ± 12%  perf-profile.self.cycles-pp.down_read
      0.14 ± 12%      +0.0        0.14 ± 12%      -0.0        0.14 ± 10%      +0.0        0.16 ± 14%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.07 ± 15%      +0.0        0.07 ± 14%      +0.0        0.08 ± 12%      +0.0        0.07 ± 24%  perf-profile.self.cycles-pp.__pthread_mutex_unlock_usercnt
      0.08 ± 28%      +0.0        0.08 ± 28%      +0.0        0.09 ± 14%      -0.0        0.08 ± 22%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.04 ± 75%      +0.0        0.05 ± 48%      -0.0        0.02 ±144%      +0.0        0.05 ± 74%  perf-profile.self.cycles-pp.d_walk
      0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.vfs_unlink
      0.04 ± 72%      +0.0        0.05 ± 46%      +0.0        0.06 ±  8%      -0.0        0.04 ± 73%  perf-profile.self.cycles-pp.update_cfs_group
      0.02 ±142%      +0.0        0.02 ± 99%      -0.0        0.02 ±142%      +0.0        0.03 ±101%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.08 ± 23%      +0.0        0.08 ± 21%      -0.0        0.08 ± 39%      -0.0        0.08 ± 24%  perf-profile.self.cycles-pp.do_dentry_open
      0.09 ± 25%      +0.0        0.10 ± 22%      -0.0        0.09 ± 14%      +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.__srcu_read_unlock
      0.10 ± 27%      +0.0        0.10 ± 19%      +0.0        0.11 ±  6%      +0.0        0.12 ± 13%  perf-profile.self.cycles-pp.lookup_fast
      0.14 ± 18%      +0.0        0.14 ± 10%      +0.0        0.17 ± 29%      +0.0        0.18 ±  9%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.11 ± 17%      +0.0        0.12 ± 12%      -0.0        0.09 ± 20%      -0.0        0.10 ± 23%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.07 ± 23%      +0.0        0.08 ± 22%      +0.0        0.08 ± 16%      +0.0        0.10 ± 25%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.04 ±101%      +0.0        0.04 ± 73%      -0.0        0.02 ±144%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.xas_clear_mark
      0.04 ± 72%      +0.0        0.04 ± 45%      -0.0        0.01 ±223%      +0.0        0.05 ± 72%  perf-profile.self.cycles-pp.ep_poll_callback
      0.02 ±144%      +0.0        0.02 ± 99%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.update_rq_clock
      0.07 ± 47%      +0.0        0.07 ± 41%      -0.0        0.06 ± 23%      -0.0        0.06 ± 54%  perf-profile.self.cycles-pp.file_free_rcu
      0.16 ± 16%      +0.0        0.16 ± 11%      -0.0        0.15 ± 11%      +0.0        0.18 ± 16%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.06 ± 48%      +0.0        0.07 ± 54%      -0.0        0.06 ± 47%      +0.0        0.09 ± 16%  perf-profile.self.cycles-pp.propagate_umount
      0.07 ± 16%      +0.0        0.07 ± 31%      -0.0        0.06 ± 50%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.map_id_up
      0.16 ± 30%      +0.0        0.16 ± 10%      +0.0        0.18 ± 11%      +0.0        0.16 ± 21%  perf-profile.self.cycles-pp.mntput_no_expire
      0.03 ±101%      +0.0        0.04 ±105%      +0.0        0.05 ± 47%      -0.0        0.00        perf-profile.self.cycles-pp.xas_load
      0.15 ± 22%      +0.0        0.16 ± 14%      -0.0        0.13 ± 16%      +0.0        0.17 ± 11%  perf-profile.self.cycles-pp.cpu_util
      0.17 ± 14%      +0.0        0.18 ± 19%      -0.0        0.16 ± 13%      +0.0        0.18 ± 19%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.07 ± 17%      +0.0        0.08 ± 18%      -0.0        0.07 ± 50%      +0.0        0.07 ± 46%  perf-profile.self.cycles-pp.schedule
      0.13 ± 10%      +0.0        0.14 ±  9%      +0.0        0.14 ±  6%      +0.0        0.15 ±  8%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.03 ±100%      +0.0        0.03 ± 70%      -0.0        0.01 ±223%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.synchronize_rcu_expedited
      0.02 ±141%      +0.0        0.03 ±105%      +0.0        0.03 ±101%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.strextend_with_separator
      0.04 ± 72%      +0.0        0.04 ± 45%      -0.0        0.01 ±223%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.__libc_calloc
      0.07 ± 11%      +0.0        0.07 ± 12%      -0.0        0.04 ± 78%      -0.0        0.06 ± 47%  perf-profile.self.cycles-pp.__pthread_mutex_lock
      0.06 ± 55%      +0.0        0.07 ± 46%      -0.0        0.05 ± 49%      -0.0        0.04 ± 73%  perf-profile.self.cycles-pp.propagation_next
      0.08 ± 21%      +0.0        0.09 ± 24%      -0.0        0.08 ± 26%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.pcpu_block_update
      0.02 ±142%      +0.0        0.03 ±102%      +0.0        0.03 ±100%      -0.0        0.00        perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.02 ±142%      +0.0        0.02 ± 99%      +0.0        0.02 ± 99%      +0.0        0.02 ±142%  perf-profile.self.cycles-pp.__do_sys_newlstat
      1.27 ±  3%      +0.0        1.28 ±  5%      -0.0        1.25 ±  8%      +0.0        1.31 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.33 ± 12%      +0.0        0.34 ±  8%      +0.0        0.35 ± 12%      +0.0        0.37 ± 10%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.03 ±102%      +0.0        0.04 ± 72%      -0.0        0.02 ±145%      -0.0        0.02 ±149%  perf-profile.self.cycles-pp.rb_erase
      0.04 ± 73%      +0.0        0.05 ± 51%      -0.0        0.04 ± 72%      -0.0        0.03 ±106%  perf-profile.self.cycles-pp.security_inode_getattr
      0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00            +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.select_task_rq
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.vfs_read
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.memcg_init_list_lru_one
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.note_gp_changes
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.tick_program_event
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.locks_remove_posix
      0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±141%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__do_softirq
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__flush_work
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.radix_tree_node_rcu_free
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.cap_capable
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.shmem_getattr
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.security_inode_init_security
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ±143%      +0.0        0.00        perf-profile.self.cycles-pp.alloc_fs_context
      0.00            +0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.__x64_sys_openat
      0.06 ± 50%      +0.0        0.06 ± 17%      +0.0        0.08 ± 20%      +0.0        0.08 ± 12%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.08 ± 26%      +0.0        0.09 ± 14%      +0.0        0.10 ± 15%      +0.0        0.10 ± 32%  perf-profile.self.cycles-pp.inode_init_always
      0.10 ± 25%      +0.0        0.11 ± 17%      -0.0        0.10 ± 36%      +0.0        0.11 ± 12%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.12 ± 19%      +0.0        0.13 ± 20%      +0.0        0.13 ± 36%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.stress_ramfs_umount
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp._dbus_first_type_in_signature
      0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.0        0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.seq_printf
      0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.04 ± 80%      +0.0        0.03 ±103%  perf-profile.self.cycles-pp.complete_walk
      0.02 ±141%      +0.0        0.03 ±100%      +0.0        0.03 ±102%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.check_preempt_curr
      0.03 ±100%      +0.0        0.04 ± 72%      -0.0        0.02 ±142%      -0.0        0.02 ± 99%  perf-profile.self.cycles-pp.sync_rcu_exp_select_cpus
      0.03 ±100%      +0.0        0.04 ± 73%      +0.0        0.04 ±101%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp.current_time
      0.24 ±  7%      +0.0        0.24 ± 17%      -0.0        0.22 ± 24%      -0.0        0.22 ± 16%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.10 ± 23%      +0.0        0.12 ± 19%      +0.0        0.12 ± 26%      +0.0        0.11 ± 14%  perf-profile.self.cycles-pp.__check_object_size
      0.04 ± 72%      +0.0        0.05 ± 51%      -0.0        0.03 ±103%      +0.0        0.07 ± 20%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.06 ± 72%      +0.0        0.07 ± 16%      +0.0        0.06 ± 49%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp._hashmap_clear
      0.12 ±  7%      +0.0        0.14 ± 11%      +0.0        0.14 ± 28%      +0.0        0.16 ± 11%  perf-profile.self.cycles-pp.update_curr
      0.14 ±  8%      +0.0        0.15 ± 11%      -0.0        0.12 ± 20%      +0.0        0.16 ±  9%  perf-profile.self.cycles-pp.smp_call_function_single
      0.02 ± 99%      +0.0        0.04 ± 71%      +0.0        0.05 ± 46%      +0.0        0.05 ± 47%  perf-profile.self.cycles-pp.may_delete
      0.05 ± 46%      +0.0        0.06 ± 53%      +0.0        0.05 ± 71%      -0.0        0.05 ± 47%  perf-profile.self.cycles-pp.rcu_do_batch
      0.05 ± 71%      +0.0        0.06 ± 54%      +0.0        0.06 ± 47%      +0.0        0.06 ± 50%  perf-profile.self.cycles-pp.memcg_destroy_list_lru
      0.02 ±142%      +0.0        0.04 ± 71%      -0.0        0.02 ±142%      +0.0        0.06 ± 19%  perf-profile.self.cycles-pp.terminate_walk
      0.07 ± 23%      +0.0        0.09 ± 14%      +0.0        0.08 ± 27%      -0.0        0.06 ± 48%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
      0.10 ± 22%      +0.0        0.11 ± 22%      +0.0        0.12 ± 31%      +0.0        0.13 ± 17%  perf-profile.self.cycles-pp.string_escape_mem
      0.18 ± 18%      +0.0        0.19 ±  9%      +0.0        0.22 ± 14%      +0.0        0.18 ± 20%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.33 ± 13%      +0.0        0.35 ±  9%      +0.1        0.39 ± 11%      +0.0        0.36 ± 10%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.02 ±144%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.02 ±141%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.02 ±141%      +0.1        0.06 ± 25%  perf-profile.self.cycles-pp.schedule_timeout
      0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.03 ±102%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.greedy_realloc
      0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.01 ±223%  perf-profile.self.cycles-pp.i_callback
      0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp.do_sys_openat2
      0.01 ±223%      +0.0        0.02 ± 99%      +0.0        0.01 ±223%      +0.0        0.01 ±223%  perf-profile.self.cycles-pp._dbus_marshal_read_uint32
      0.02 ±142%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      -0.0        0.01 ±223%  perf-profile.self.cycles-pp.shmem_free_in_core_inode
      0.25 ± 19%      +0.0        0.27 ±  6%      +0.0        0.27 ± 11%      +0.0        0.28 ± 21%  perf-profile.self.cycles-pp.native_sched_clock
      0.04 ± 75%      +0.0        0.06 ± 23%      +0.0        0.06 ± 47%      +0.0        0.08 ± 43%  perf-profile.self.cycles-pp.openat64
      0.56 ± 15%      +0.0        0.58 ± 10%      -0.0        0.55 ± 23%      +0.3        0.82 ± 12%  perf-profile.self.cycles-pp.poll_idle
      0.14 ± 21%      +0.0        0.16 ±  8%      +0.0        0.14 ± 13%      +0.0        0.14 ±  9%  perf-profile.self.cycles-pp.get_nr_dirty_inodes
      0.05 ± 46%      +0.0        0.07 ± 27%      +0.0        0.07 ± 25%      +0.0        0.07 ± 59%  perf-profile.self.cycles-pp.do_idle
      0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ± 70%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.worker_thread
      0.10 ± 18%      +0.0        0.12 ± 14%      +0.0        0.11 ± 26%      +0.0        0.12 ± 27%  perf-profile.self.cycles-pp.strlcat
      0.06 ± 47%      +0.0        0.08 ± 20%      +0.0        0.08 ± 17%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.lockref_put_or_lock
      0.01 ±223%      +0.0        0.03 ±101%      +0.1        0.06 ± 26%      +0.0        0.02 ±141%  perf-profile.self.cycles-pp.alloc_super
      0.62 ± 20%      +0.0        0.64 ± 18%      -0.0        0.61 ± 21%      -0.2        0.46 ± 17%  perf-profile.self.cycles-pp.intel_idle_irq
      0.39 ±  6%      +0.0        0.41 ±  6%      +0.0        0.41 ±  6%      +0.0        0.42 ± 12%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.08 ± 22%      +0.0        0.10 ± 15%      +0.0        0.08 ± 20%      +0.0        0.11 ± 18%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.12 ±  7%      +0.0        0.15 ± 21%      +0.0        0.14 ± 20%      +0.0        0.16 ± 16%  perf-profile.self.cycles-pp.enqueue_entity
      0.02 ±144%      +0.0        0.04 ± 73%      +0.0        0.06 ± 54%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp.ida_free
      0.26 ± 20%      +0.0        0.28 ±  9%      -0.0        0.25 ± 14%      -0.0        0.25 ± 13%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.06 ± 71%      +0.0        0.08 ± 14%      +0.0        0.07 ± 16%      +0.0        0.07 ± 14%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.0        0.03 ±100%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.03 ±100%      +0.0        0.02 ±142%      +0.0        0.02 ±144%  perf-profile.self.cycles-pp.path_umount
      0.12 ± 20%      +0.0        0.14 ± 24%      +0.0        0.12 ± 24%      +0.0        0.16 ± 22%  perf-profile.self.cycles-pp.try_to_wake_up
      0.38 ± 21%      +0.0        0.41 ±  6%      -0.0        0.38 ± 16%      +0.0        0.40 ± 15%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.02 ±144%      +0.0        0.05 ±  8%      +0.0        0.03 ±100%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.call_cpuidle
      0.08 ± 14%      +0.0        0.11 ± 28%      +0.0        0.11 ± 20%      +0.0        0.08 ± 50%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.19 ± 16%      +0.0        0.23 ± 13%      +0.0        0.22 ± 13%      +0.0        0.23 ± 12%  perf-profile.self.cycles-pp.menu_select
      0.01 ±223%      +0.0        0.05 ± 47%      +0.0        0.06 ±  8%      +0.0        0.03 ±101%  perf-profile.self.cycles-pp.load_balance
      0.01 ±223%      +0.1        0.06 ± 90%      +0.1        0.07 ±109%      +0.1        0.08 ±101%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.31 ±  9%      +0.1        0.37 ±  6%      +0.0        0.31 ± 12%      +0.1        0.36 ± 17%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.70 ± 18%      +0.1        0.77 ±  8%      +0.1        0.77 ± 16%      +0.0        0.73 ± 14%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.16 ± 52%      +0.2        0.34 ± 43%      +0.1        0.25 ± 37%      +0.1        0.24 ± 69%  perf-profile.self.cycles-pp.ktime_get
     29.80 ±  9%      +2.8       32.57 ±  3%      +1.1       30.90 ±  8%      -0.1       29.71 ±  3%  perf-profile.self.cycles-pp.intel_idle

--jyq0xK9ygSt56qNv--
