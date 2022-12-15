Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948C7B
	for <oe-lkp@lists.linux.dev>; Thu, 15 Dec 2022 02:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671072359; x=1702608359;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eOLy2iE5etknRAI+oCkN6vcE28T9YKtIhSwDKIBIvRA=;
  b=HR14RpSklaEkFBasTEqbBcAePpDY1a9C6pqlMSlTa4DJck8+Haf5JrHz
   YMPRJxXmLear5vqdSFWU/EkPXP/x7bPeboE91S0qmMvEotaC3wjY38Kvo
   c9w37sXfRas/zBEAjB304NhMTLQVsU+8saBYFmn3rzRYY6yGN2cjiTj2S
   Sm0Pu7HDv0Su1L5n3uG0XL/lf/YabLS2QwQEU7gkAOqqI95bD5mmd8jle
   +CVBJgRUav61TL8y7aWHjdbm5cNySyhRIO+LXDvn49PGlsBoR8UeywjqO
   DytLfBg6l9XIXkiRbgJaiH/BT3GD8ktrxlsMCntT6BATUuXlf4Poe0SjQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="380763886"
X-IronPort-AV: E=Sophos;i="5.96,246,1665471600"; 
   d="scan'208";a="380763886"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 18:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="679950517"
X-IronPort-AV: E=Sophos;i="5.96,246,1665471600"; 
   d="scan'208";a="679950517"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 18:45:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 14 Dec 2022 18:45:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 14 Dec 2022 18:45:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 14 Dec 2022 18:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2s4DU5V7rTIuaO6mYx8dOXDWmuP3HSl+F9PnsnDDCCjagK4D2bimuEytX1slqkV9t0hisLlN1rK0cD1R14sR3Rot44aGj7cOdK1uV1tVMkcMX8wf0Y9nezu1WyxvxXtpq140OYiK78wFQsc8w4MK8JHDQ1h3KNnmQfwIsFx5gNPDkJXB9fH46IA89t7Q1xk+NJtxnVUtC2QH6yZeJ2kI1oQOGji1Kdh0co1RqT/AHnX7fiDEk0HPaRGMhHTKaZanbr4Ryw2DQOvlJRiThezRBwjROa7hADGurWWEMrXE+rt8k9b76HhIWCxNhRaLwVZh3NW0riLvmSu4r60FYZ1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2hsrgtqy/R7TJX16BhcARy4gJFCbv7UTUajCKg6Bqg=;
 b=PcShnbHhG634Tn3MjJT0fko6CCniTUxU5s9Im+PQuoeX7IdWlkXbqlyUsvx4g/bbs0SuQ1nq9heT4Go4TslneOEJlk0ZnE7kscxI+YzDrPaGGgz57YJzNy+j7wOC85+vZQdF120msh4JQt+wksuteJ0rZd1F3W3r9Uobv36rYowiv2J9idmdebpBrpgqQwzZX9AyyegSDRhEHuK55MbHMRDYXIWvDN7kdRGAzJp3gbXJFc4yXNeVJKLAsZJ1cx7KmJEOHeIvoOri1cfE76Ff2VSpBXOkcavauyQwAKV5AgrjlPxojrDgqFRekMhe97sbH0j09YFFJ8W0pP34qYtTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 02:45:54 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%7]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 02:45:54 +0000
Date: Thu, 15 Dec 2022 10:43:43 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>
Subject: Re: [amir73il:fan_pre_modify] [fanotify] 884a248730: unixbench.score
 -1.4% regression
Message-ID: <Y5qJ3xPqvYmysOIr@yujie-X299>
References: <202212081500.58dd9ea4-yujie.liu@intel.com>
 <CAOQ4uxh-TDSwxOHc2aL3HpiC_Pd_qNaWCLLe1SUgfOZF7DQ6_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxh-TDSwxOHc2aL3HpiC_Pd_qNaWCLLe1SUgfOZF7DQ6_w@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: 017bd634-076a-4665-0ee8-08dade467c32
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+Tnpx963EhzP2zrg1j0DXL8PyvElpMjm1ofrcVBus8slT50bG70VBaBmKd9qJ09sh0zF0a/tUUyaHSpKEfyCgNih6o4mD/yQAYviQGHXHZqjz3UHwiSpwVK5aiETyr699GEp5Uuo7a0a1hKLvEJwnaBN57VlWC3ibm8Qz3EGtpeUNqJBQsFDjX8z/GBu9RNceL0EynvLH6/BHs/eCLVlcuv8+81mIwW0rXvHFXXF/uJ4yGjfWkruu9bfoSR2dpy0FdiF/cDooezLke/vs8CrAUm23n9zGALHVdXqMSr7vlgT7SgQYZcMbTXMAcF3PILHXYJQGUsAxYT4IZiCpSyaoc4hd/Hf/gqZeUIk+LKt7cnDjmdbLEu5x0aDoGRKSVQf4GFeD4HvEy4I0JnjwBY1Y3djF4Yf3Zb+YK4MLXe+pZj7FpS8skPdK2SJNxA8XKggsb9JOCMzVKMhjWJtwt6nxEkzzWVlfTM8CunZVHcD78Dwekoih8ZgQ5lU70V761pmxFk9Ua7MUKHX/0fMdXk5ZnDgFnIBpJNsOdGeYoYn/nmq1TfDmnqRXLUFXNPD9hedd29eOUc9/Jd99IoQHo44JBTAf/U4TOUaKgidK0ocRmAZxCCBjRMnYEQ8uIMOWRCu7eR2oQK9pprMs3sR7EAIFnpDWa3Wsywf5MKvhW1BQfoYGbDevJFa9GfBJPnWj4F4IWNSHRmX2U7oUpAwmjpgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(2906002)(186003)(44832011)(316002)(66574015)(6916009)(33716001)(83380400001)(66946007)(6666004)(6506007)(86362001)(966005)(53546011)(6486002)(478600001)(26005)(9686003)(6512007)(82960400001)(38100700002)(41300700001)(8676002)(66476007)(4326008)(5660300002)(8936002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhIYXNORW5Gb2J0eWl2bDFuU1ZKUXIrTnJ2MUNaaXVqSUJpSGVhN3VxMHp1?=
 =?utf-8?B?OW1PMkwvMncxUUlOSVlVaW0vWE4zNFVjQ24wQWxMUWdZUWtNQU9ZQ2tZTmhC?=
 =?utf-8?B?bHVSN1ozQWdBN1NDcG96VzFSY3ZKZlVHRGQvNUJJVXh3eGkyVnNHVk5VNlh4?=
 =?utf-8?B?QnkxREhmRkwvR3FKYTVJRHBXc3M4SVV4cWlqS3M2SEVsQzB5WEFOVGFkM1dj?=
 =?utf-8?B?ZkwwZzZ3YW4rSlJjSmtqQk00cDhJZGJ1enpzS2x6cWhpVUtjWnU3bW9LZlRa?=
 =?utf-8?B?N0graS9FT1dWUTkzaTEvREdRQm9xUTFuZnB3Uk90eGRXK0pzRjBoZG82MkdH?=
 =?utf-8?B?b3IwQjNEZWNaWUtUeEZyOHJVVlFQOWpKcmhLd1hVeEF1Z1d3MWVzeldqcHdq?=
 =?utf-8?B?TFZ6RkNoRFdRY241RVl3alVjZnN1VkRFa2lkVVBYZzVEeHBxNDVEdm15QnI4?=
 =?utf-8?B?SkFSc1JFU3ZMYmJ0YTMvampYSGhveEh3cmFPeE1YSFg3SW11b0kzWlJ2UkVC?=
 =?utf-8?B?TEdPYXNlSjhVNlVicUllRy9jY2VSeXBpaHNwaDdZaVBVS25lMm1SVmVwUTFR?=
 =?utf-8?B?YnJ3R2dlOWl1b2E4RHliMVR6Z0kzTm44WXRjdjRaOWF3Q0d6SDhnRXJwN1FN?=
 =?utf-8?B?RDNqSURoNmR5SEZibzZTQ2RWUXVmc21uUnRoVlJLbytVakhzNFV4QlNEUkF5?=
 =?utf-8?B?UERmaGk5NXFGeXZRUk9VY21QU3FncXN3VEE5SkpoWTRuVXozeUJuSnBmdm5L?=
 =?utf-8?B?T25tUmtsYnZSekd4RlRYYzM2S2kxQ080N094RXhpejY2Nm9ZVDFCeHNZLzVP?=
 =?utf-8?B?MWh0dFVSdTRBcXBXbksvNk9YRFNKV2Q2RXFjOUE1MG1zaGNEZ0hrdVpEZjMv?=
 =?utf-8?B?YjFCM2VvaVYwU3NFUGZ6ZHk4U25VaEZabnFKSFhzWXliUkxwMEF6ZnZnaGxW?=
 =?utf-8?B?akxVbFdaM0lGNEdTdXh1VU5ZZzAySW9sNmJNSG1TVFREVC94NlVXdXVNa0VH?=
 =?utf-8?B?d2xKTG5nN0FKWjJuTjV1SjcwVmN4WEk0dWlTOVlPZFU1bXNHbmJnem1RZ21L?=
 =?utf-8?B?L1FDTGZScHZMSXNMZGg0VEp2YkhsU0p3NGhETERaWEpsZGtqZDVVa1Z1TWZP?=
 =?utf-8?B?QjkxaWdmM2IwK0srKzdTQ3FVcE5IaFZOU3pXd1JXU0pVeHFrUDE0YzFTcXk4?=
 =?utf-8?B?dUxnZGhYb2JjTHVZd0xnaEI4K2xaaW93VWdMaFpIeGp5K09VYmI1ZmFGbUx6?=
 =?utf-8?B?Z2lTVmhBT2pHdzkrNFdTcnQwd1NsQWs3cVFZT2xNS0Vha3RCZVh5Q3R0Rm9E?=
 =?utf-8?B?Mkt5bnpuck1WL3c4eEx0aDJjTG1jWEhkYWVkVHgvQXRvbnppV3hYZEZkRUkw?=
 =?utf-8?B?NC8xV2xobjJRUDN0Rm04VHFONHJJUDBCSHNQMURIUVArKzFoREVMMWFScXE4?=
 =?utf-8?B?VDdERmEwNmZtM1NUZzhaR2krNE43YTRXSU42NG1ReElibUNtMnFrcTRjVUZ4?=
 =?utf-8?B?SlN4R3czVHQ1WmNhR3pXY2pnRm1NQ1Aza3IxaDkyazVWTUxoTHUzVlJFQkhL?=
 =?utf-8?B?ejdQQWJmeGZudUZUa3RPSU9DR0ttMXpNSko0QWt5U0hXNTRRa1I3S1k3Y3Fi?=
 =?utf-8?B?ejVONmNLODZTQmhFUWswSVBBMzJrd0RpRkpHdnAzL3FEeXN0Kyt3TVVYUnk1?=
 =?utf-8?B?SURrbTBGNzFCTTZyeUh1a0V2Vzl0elJzMW1OQWNZOXBEdDZ6T1licWx5am04?=
 =?utf-8?B?Z01yVFMrQ1EzdXZYZnhsQWJiTlVZL09zdzlodW9oaFFVbHY5bkZKVWUrNkpQ?=
 =?utf-8?B?OXdGL0lkSHdodlJiOEJXOVI0d2lhRER0bXhybDI2bHJtL29BNkx1VXdGZ2R2?=
 =?utf-8?B?b29uWE5HeHUza1VIdzBMbXVvZ1JtMVM5bTU5VnJHbjNEWHRQVUtTZmNaaGZI?=
 =?utf-8?B?TVhyd3M5OWpYVVZ1eDJ2ZGlCL2JnMnZMdms0UjVwb2Rrbi9oczhRVmJlSXY0?=
 =?utf-8?B?RXcvcWY5MFNNbEczU3FFU29vS0h3MnpGSEtNQ21uN1AyZXNkWTU5U2lxYmI4?=
 =?utf-8?B?UXNhMDc0ZmU4dW9PUGQ5MDlZaVVkazVyWW5aMEJHb2crdnRnNWdOam1xNDFV?=
 =?utf-8?Q?fMq6xzIk+UYDjuLz6DP+CzG5F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 017bd634-076a-4665-0ee8-08dade467c32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 02:45:54.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2CBSA7mLPbm2SmI2vbXzKisCNsxLMPYyOP6D1dLmBEpdcXnEDFtyLNPAVStMU9su7e3ebf+htB+rtbMRTOhRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
X-OriginatorOrg: intel.com

Hi Amir,

On Fri, Dec 09, 2022 at 01:30:44PM +0200, Amir Goldstein wrote:
> ..
> 
> On Fri, Dec 9, 2022 at 8:46 AM kernel test robot <yujie.liu@intel.com> wrote:
> >
> > Hi Amir,
> >
> > We noticed a minor performance change on your fan_pre_modify branch.
> > We tested commit 884a248730 and its parent 99f3242105 each for 8 runs,
> > and the data is stable.
> 
> Thank you for testing this branch!
> It was a good choice.
> 
> I am curious how do you choose which branches to test from my github,
> because sometimes I push WIP or old backup branches which are not very
> interesting to test.

Sorry for late reply.

For now, we don't have preference in choosing branches. All branches
from you github repo will be tested. It would be nice if you could give
some info like which branches are expected to be tested and which
could be ingored (regexp pattern is supported), then we can setup branch
filter for you.

> >
> > commit 884a248730:
> > - 3453.2
> > - 3454.0
> > - 3463.3
> > - 3466.0
> > - 3470.9
> > - 3478.6
> > - 3485.7
> > - 3488.2
> >
> > commit 99f3242105:
> > - 3515.5
> > - 3518.5
> > - 3531.8
> > - 3536.6
> > - 3543.8
> > - 3545.7
> > - 3556.0
> > - 3562.0
> >
> > Please check below report for details.
> 
> I pushed a new head 90b7623e35a9 to branch fan_pre_modify.
> 
> Added an optimization commit before the reported regression:
>  eb235508a99b fanotify: introduce FAN_PRE_MODIFY permission event
>  42f4f971729e fsnotify: optimize the case of no permission marks of any type
>  ffb549cff3df fsnotify: define flags for pre-modify permission events
> 
> My expectation is that the optimization commit will improve performance
> compared to its parent (and to Linus master) and that the rest of the commits
> on branch fan_pre_modify will not loose any of the performance win.
> 
> My assumption is that the filesystem on which unixbench is executed
> has some inotify watches (probably systemd) and that it does not have
> any fanotify permission watches (i.e. no Anti-Malware installed).
> 
> Please re-test.
> Thanks,
> Amir.

The branch has below structure when we started retesting:

55b152460a1348 (amir73il/fan_pre_modify) fanotify: introduce FAN_MARK_SYNC flag
e466b00a05141f nfsd: generate pre-modify path permission events
6afa7ff562d610 fanotify: introduce directory entry pre-modify permission events
0d926ca959b14d fsnotify: prepare for directory entry pre-modify permission events
5294322406fc39 fanotify: introduce FAN_PRE_ATTRIB permission event
5b8915ed5531ff fanotify: introduce FAN_PRE_MODIFY permission event
d6126aa1fc8db3 fsnotify: optimize the case of no permission marks of any type
ffb549cff3dfb4 fsnotify: define flags for pre-modify permission events
...


The score of "fsnotify: define flags for pre-modify permission events"
dropped from 3535 to 3474 after this branch was updated.

Seems both the optimization commit and the regression commit we reported
don't affect the score after the branch was updated.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/fstime/unixbench

commit:
  ffb549cff3dfb4 ("fsnotify: define flags for pre-modify permission events")
  5b8915ed5531ff ("fanotify: introduce FAN_PRE_MODIFY permission event")
  d6126aa1fc8db3 ("fsnotify: optimize the case of no permission marks of any type")

ffb549cff3dfb4d7 5b8915ed5531ff290bdcf18f05e d6126aa1fc8db332ad0cf607ff4
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      3474            +0.2%       3481            -0.1%       3472        unixbench.score
    480.40            -0.0%     480.33            +1.5%     487.68 ±  3%  unixbench.time.elapsed_time
    480.40            -0.0%     480.33            +1.5%     487.68 ±  3%  unixbench.time.elapsed_time.max
    560.83 ±  4%      -2.3%     547.67 ±  4%      +2.5%     574.67 ±  3%  unixbench.time.involuntary_context_switches
     10499            -0.1%      10489            -0.0%      10496        unixbench.time.maximum_resident_set_size
     20708            +0.2%      20759            -0.2%      20676        unixbench.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        unixbench.time.page_size
     70.00            +0.0%      70.00            -1.4%      69.00 ±  3%  unixbench.time.percent_of_cpu_this_job_got
    303.32            -0.1%     303.13            -0.2%     302.76        unixbench.time.system_time
     33.71            +0.5%      33.88            +1.0%      34.05        unixbench.time.user_time
    543.33 ±  9%      -3.2%     526.17 ±  8%      +7.0%     581.17 ±  9%  unixbench.time.voluntary_context_switches
 6.604e+08            +0.2%   6.62e+08            +0.0%  6.606e+08        unixbench.workload


The unixbench score is persistent on the head of fan_pre_modify branch,
which means the rest of the commits don't impact the score.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/fstime/unixbench

commit:
  5b8915ed5531ff ("fanotify: introduce FAN_PRE_MODIFY permission event")
  55b152460a1348 ("fanotify: introduce FAN_MARK_SYNC flag")

5b8915ed5531ff29 55b152460a13486e5525f2d56d0
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
      3481            -0.2%       3475        unixbench.score
    480.33            -0.0%     480.32        unixbench.time.elapsed_time
    480.33            -0.0%     480.32        unixbench.time.elapsed_time.max
    547.67 ±  4%      -2.6%     533.67 ±  2%  unixbench.time.involuntary_context_switches
     10489            +0.3%      10525        unixbench.time.maximum_resident_set_size
     20759            +0.1%      20781        unixbench.time.minor_page_faults
      4096            +0.0%       4096        unixbench.time.page_size
     70.00            +0.0%      70.00        unixbench.time.percent_of_cpu_this_job_got
    303.13            -0.2%     302.66        unixbench.time.system_time
     33.88            +1.1%      34.26 ±  3%  unixbench.time.user_time
    526.17 ±  8%      +3.3%     543.67 ±  9%  unixbench.time.voluntary_context_switches
  6.62e+08            -0.2%  6.606e+08        unixbench.workload


--
Best Regards,
Yujie

> >
> >
> > Greeting,
> >
> > FYI, we noticed a -1.4% regression of unixbench.score due to commit:
> >
> > commit: 884a2487305bbf19dc6f105f6e3a4f368217a3cd ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > https://github.com/amir73il/linux fan_pre_modify
> >
> > in testcase: unixbench
> > on test machine: 128 threads 4 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> > with following parameters:
> >
> >         runtime: 300s
> >         nr_task: 1
> >         test: fstime
> >         cpufreq_governor: performance
> >
> > test-description: UnixBench is the original BYTE UNIX benchmark suite aims to test performance of Unix-like system.
> > test-url: https://github.com/kdlucas/byte-unixbench
> >
> > Details are as below:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/fstime/unixbench
> >
> > commit:
> >   99f3242105 ("fsnotify: define flags for pre-modify permission events")
> >   884a248730 ("fanotify: introduce FAN_PRE_MODIFY permission event")
> >
> > 99f3242105d7f6ae 884a2487305bbf19dc6f105f6e3
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       3535            -1.4%       3484        unixbench.score
> >     480.28            -0.0%     480.26        unixbench.time.elapsed_time
> >     480.28            -0.0%     480.26        unixbench.time.elapsed_time.max
> >     207.50 ą  7%      +1.0%     209.67 ą  7%  unixbench.time.involuntary_context_switches
> >      10514            -0.3%      10488        unixbench.time.maximum_resident_set_size
> >      20814            +0.0%      20819        unixbench.time.minor_page_faults
> >       4096            +0.0%       4096        unixbench.time.page_size
> >      70.00            +0.0%      70.00        unixbench.time.percent_of_cpu_this_job_got
> >     305.20            +0.1%     305.57        unixbench.time.system_time
> >      34.35            -1.1%      33.98        unixbench.time.user_time
> >     535.83 ą  9%      -1.8%     526.00 ą  8%  unixbench.time.voluntary_context_switches
> >  6.721e+08            -1.4%  6.626e+08        unixbench.workload
> >
> >
> > If you fix the issue, kindly add following tag
> > | Reported-by: kernel test robot <yujie.liu@intel.com>
> > | Link: https://lore.kernel.org/oe-lkp/202212081500.58dd9ea4-yujie.liu@intel.com
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
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
