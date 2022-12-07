Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0841C1367
	for <oe-lkp@lists.linux.dev>; Wed,  7 Dec 2022 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670400624; x=1701936624;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H12EbpdbssYA9GdyAtc3EFarBB8+oZ3IR3/MFiVPxmw=;
  b=GczSDWCqbh/L83OhK6dfsNqne2ekXehL8u538h9HLfFiF65HURNva/vH
   RNp3BlONmpHUEg6lzNKGhxsh7/rBC5tQXUcksuteO+LV8+jnYwwNAKyH2
   rJzxVhZ/JZzluUixEnNfY6RW1IMIOno+vX5cQAHRcTMbgH8Ghdtc45k/Y
   wxR5WjhLQdUlQRQCnaMymLrzaB9hxIDb0/UiVCAVPqQNkLhXeWnZE3YwC
   d2BoP4zEbkxw93R++3eBiY4pNWNakoSjcnX+bNKuEPskY3FWXcPlQYHeI
   DXmLzBfXfHFnF8qaY5TZ/dqqEnQE+Rm3VzpEy2kHmqogW/zcvg4uz8KM6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="381125835"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="381125835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 00:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="975375512"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="975375512"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2022 00:10:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 00:10:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 00:10:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 00:10:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 00:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj35OPH5h3fdF8yvhjs3dnHHnaABOp+Iv5JYon3LVmxEewgGszz5B/mmvNcv0Dex9+cDvFNGLNpNcdU9O7HNIHubgzQowN6OGzGnoZp4f3JPfdj4MlHMc1KX2SpxFTUy26Q1Vh6awGSBt3j+0ipmG1jO/ub2hlSOfw5QDHvZBZUPo871KWzadZolJtInol/mq1dQC6urNRvvenLOFZHPnRtwNNIWkQ7AmKaOY3Q9tbiNBtzt96Dw8PhoPSFL4NsEqFpPT0BsepkwJNH6kqZszmZZJRPVNanL7v3eBKri5eyfU4Um1uq4Osyw+tYidt2s8gEdou9iE048tsNRUlKQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvPQ/3fhAy7cbLS2ZXzVhVCoP5uot0fXIx3/LD3IWUc=;
 b=IHISAcpXeZqN78vScvHXmWn9RNfItND2UyydoUbzd9wCVeCAGSt8NL/vPZv6U20ky3PKbnyVaDQ+Qis/EuIiAiE2zsyzx2t741pSmspi2Zg1CfqRoNJPRTv8UhwgLUxLc9emZx6OCu3HpvWoXnRKsB3QQfXUy581YvSflXCgZESAeDkmqMc8GNQ0jBsPHVgPAx29JXQUeVpKnOW0EHFGkR+zjwjVjD1J+sAGU/Wv+2R7bbHcjQggVYaLeB/PDWIFc/bBT3GqK50KfV5BFi0IYT2xY1yv785RLRZnR840dNLy+XXNAhN7DomoT/C3fnHBAg0DXc3o1724n5wATA86eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 08:10:17 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::15c8:6dea:24bb:b4c8]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::15c8:6dea:24bb:b4c8%8]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:10:17 +0000
Date: Wed, 7 Dec 2022 16:10:08 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, kbuild test robot <lkp@intel.com>, Jan Kara
	<jack@suse.cz>
Subject: Re: [amir73il:sb_write_barrier] [vfs] 95586ea7c5: unixbench.score
 -4.9% regression
Message-ID: <Y5BKYEF4pB+gIU+l@xsang-OptiPlex-9020>
References: <202212032038.a5aa4002-oliver.sang@intel.com>
 <CAOQ4uxj317GyWPbHQiw2-45+xjMvAjEHstEHcJmr_Fmv29xFUw@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxj317GyWPbHQiw2-45+xjMvAjEHstEHcJmr_Fmv29xFUw@mail.gmail.com>
X-ClientProxiedBy: SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: b57f5573-6f4f-4e4f-5424-08dad82a791c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpYDX/V3SNqPNJCM5MeodMCQn29vgp4UUrZP5ehw4g1P/IuD1zvDfFC/eqMZYaY7vqikhqZStDNVrpqkBSxLp1hEy8Ur+pPzGTRcXYjYuXeRjGJu+RHAH4p/5PDlVhC3tYDDs7R5Eoy45JKkpleS3ds99O2gFK3RS4s/Joyd0wmQ/9oLyhoY7l7N7oe4guBy9hOV8rAlLB914mnkVooEgEwAPgSt2A4cuZcBpSwPKbW9y/iu/GvX/AyUpn98DqUDLWQjV3YzbA0zziIFDLuxvPJzAmg+YBMrayA6u1q0M2XOuYcyfXK9N2QPkI4xwvlvKluntsDb240DS/7Y0W8fGn7me7ddF+w+faEjxHVGB7s8ZihR/WGtJaSqKfzJmVxQ4+mp5O+WDbLuXmjz8pAHCPVQmI24VyrXpGrxRLhbC6vyRCZnoohS2RA23Stcndde1hmdAB18uXjYm6sXlqSO8qDSW4PzUkpPLUTmKEaZYxnkD3oqzTu51T129xCz7X75e8jGrIL8F/8i0WQwK08wBYpnjZpqCUsDwtRSmDcadvQfzw+nUnvmUSE+p6JavW+N9NaAVMwcIV4iD+VkMEETIuBSOqwDIPM4G0WfGXgWABwRsY41BgqKi3mHkDzJCIeb+NWVECzWDM/VNMcpmDe2DV8TwwhjnxPLdCjpIJDithpJzM9bbMJZ8XCh5w+fDOMZoVD+4dpdcJyxXmVtJRr7Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(8936002)(19627235002)(966005)(54906003)(82960400001)(316002)(66476007)(6486002)(6916009)(86362001)(41300700001)(8676002)(4326008)(66946007)(30864003)(44832011)(2906002)(5660300002)(66556008)(6512007)(478600001)(9686003)(6666004)(38100700002)(26005)(186003)(6506007)(33716001)(83380400001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QMKGDHBbLm8Af8qX3iiF30eI4MyLLd1teAHyAbgmjw8lNb8lT2k1WPSG9w?=
 =?iso-8859-1?Q?9aJwyxX/XmFoF9NSXisvfHKKU7d9lymAI6pAOBPAkxpi13+sZKjtEOUwxt?=
 =?iso-8859-1?Q?t7JUrkDBHFN4vDV+KD8NbZjhMi8amB6phQMpOVraZim9vNBbOzw8z3wf9J?=
 =?iso-8859-1?Q?HoqU8uvmHVPpaEpEdeqJ2AwLBnRd9Qt8pL/T3MirKK6y3/tffh30UqS5bv?=
 =?iso-8859-1?Q?Rixy1CewN4QRJ7njG8aBilXoXmxepUamEtHcCqO+wNTHyevj/tQXQrEQjQ?=
 =?iso-8859-1?Q?2vKzJVX3Eig6exJtvJaEQMBFktRGv6AMPqilAsNFuNgdtuliwMyMY0p/uh?=
 =?iso-8859-1?Q?Y6kaM4xnLwzlEYd+ciWQvGvlpdcMnqveRX4YG7b8WQKoCidNXnB+u7u+Y/?=
 =?iso-8859-1?Q?0zk1oKSnMlDRIZsIIC68HpBTNei8yt4XVLB55NIZIzq3iXR96r5mTkcBL6?=
 =?iso-8859-1?Q?yOuHXTnWWAIzvqBHTPsQoOYpI6dGkMzMUF41HCpvi5pxdl/9l7iYZsjvlu?=
 =?iso-8859-1?Q?t75YR5Ydaw2G6QyGOEG1a9pTDIEpP3ywDIuOsmttlkJWZ8r0QoUOhiHKwQ?=
 =?iso-8859-1?Q?D7iBJcTIGRzzivQ7QypG0qMqGnHvfCQhzRnwCMu1+SifhNHfyRDusSWrDl?=
 =?iso-8859-1?Q?JSncxWrYmW+fpR5wc53wmnJEjlCTZjc85ZCt/17xgvIZ1aKKfS7GecPvFs?=
 =?iso-8859-1?Q?SUN7QC/TozlKIemgAdMoPuvAa+nUAZYn/p+2GeZjGMzi1SwD/1fg04j0Iq?=
 =?iso-8859-1?Q?wB8SQRwJrvVxaBUNbxyb3CGo/DTCqbjD42Hh6rHtkcWsWkUoh6OIRDKp5f?=
 =?iso-8859-1?Q?N1JqT2r7A2Xtq7dY8EcvODDWY2HSGrYv7VrCTHda5Oh+EwAMDSmkKs+Ghf?=
 =?iso-8859-1?Q?1InPNd+mslP1y1bF/+RQ353/PP0aKRR26yepkA9dkI00FFe4B78Ga6k2xZ?=
 =?iso-8859-1?Q?Y/XuWkvwqh3ONqkxWnQBc/C5882INVxQhb1YUoe2igrASmaEaML9E//5Uy?=
 =?iso-8859-1?Q?CQIcD8TTVuSf5yq1Mi/9x9PJ+Ro1qZGooAnWOsGzn9uLRkSVz3qG3/5twd?=
 =?iso-8859-1?Q?5dgeLtesyGAMg4w2QBGgRWPmFtm9fztPJZo47PPhhXDVjAiJj/3pAQFGa2?=
 =?iso-8859-1?Q?2EY9L1e1HDnyrP7Mit6MnZg6YRaMs4lXVMzfMfBzhQsHHTkEpBzair1eKA?=
 =?iso-8859-1?Q?LWJ4jWqM1webwq/91X8DF7klAV7hgbRiDAs01tcDMuA2qFDk3o6RVloJKC?=
 =?iso-8859-1?Q?otkdZT8IdKAd1iEJo+JJCcafEVk2p0LWu8L/C28CpqIMBs+CZVYt9PGCHv?=
 =?iso-8859-1?Q?6ontco9tB/sdKKzxdAb06gMTVBAf1dWMgknwO1uhab3gSLgdnLdj+lvv0N?=
 =?iso-8859-1?Q?ZgqLNOj+2C9gyE0ym4KsNikCb157F0mPU1eVe2ifKrCd6GmUXgd5CF0p/b?=
 =?iso-8859-1?Q?LouTiNHq7oADyMhCM26LwbWD8RrXx7t8y0evXqmGhryYS2pviGgPrYfkos?=
 =?iso-8859-1?Q?v3wCQCxvEhunlrfEum1LymtJC5v1Mwi0N0XUgS5Zv8gVA3UIHTg/gUkKdO?=
 =?iso-8859-1?Q?T5LXNk+3tyi48x33Wi8VsaGlrgK6BKFTe6XT7AuvfRkxRublzMHOQ8h2iO?=
 =?iso-8859-1?Q?MOw3LXcqMhTrlLR49yMZ1QUEsxSRr2mIBa/DfY69Z6vzwIyt+v+fY14w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f5573-6f4f-4e4f-5424-08dad82a791c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:10:17.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OLGIayMejwgWgQJBdfV206k7DYtv9QP4d2HhDTPI0Z3LzH9wWIIjqQ0C34OaomPCBSGxxIQ7Ds0IreokeOLsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-OriginatorOrg: intel.com

hi Amir,

On Mon, Dec 05, 2022 at 06:30:12PM +0200, Amir Goldstein wrote:
> On Sat, Dec 3, 2022, 3:06 PM kernel test robot <oliver.sang@intel.com>
> wrote:
> 
> >
> > Greeting,
> >
> > FYI, we noticed a -4.9% regression of unixbench.score due to commit:
> >
> >
> > commit: 95586ea7c597ef4e9712ceb101d03438c1ccde20 ("vfs: prepare for
> > pre-modify permission events on write")
> > https://github.com/amir73il/linux sb_write_barrier
> >
> 
> Hi Oliver,
> 
> I pushed a fixed version for this branch
> Can you please re-test?

we tested on new branch, found the new commit
  91d26357ebf0 ("vfs: prepare for pre-modify permission events on write")
doesn't cause regression any longer, comparing to its parent.
but the branch HEAD
  0f7a8c0b37ad ("syncfs: wait for in-progress write operations")
seems still introduce a small regression

e8a2a30b4b2edf99 91d26357ebf095c16183cdc5c77 0f7a8c0b37adcdf306f5aa3a778
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      3538            -0.1%       3534            -1.9%       3469        unixbench.score

BTW, the score for v6.1-rc6 in our tests is about 3505

not sure if the small regression on HEAD is still a concern?

below is detail comparison FYI.


=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/fstime/unixbench

commit:
  e8a2a30b4b2e ("vfs: implement 'vfs write barriers'")
  91d26357ebf0 ("vfs: prepare for pre-modify permission events on write")
  0f7a8c0b37ad ("syncfs: wait for in-progress write operations")

e8a2a30b4b2edf99 91d26357ebf095c16183cdc5c77 0f7a8c0b37adcdf306f5aa3a778
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      3538            -0.1%       3534            -1.9%       3469        unixbench.score
    480.50            -0.0%     480.33            -0.0%     480.28        unixbench.time.elapsed_time
    480.50            -0.0%     480.33            -0.0%     480.28        unixbench.time.elapsed_time.max
    184.00 ±101%     -23.9%     140.00 ±133%     -17.4%     152.00 ±132%  unixbench.time.file_system_inputs
      2332 ±110%     -17.2%       1932 ±137%      -0.2%       2328 ±129%  unixbench.time.file_system_outputs
    221.25 ±  7%      -9.1%     201.12 ±  9%      -6.4%     207.12 ± 11%  unixbench.time.involuntary_context_switches
     10534            -0.8%      10449            -0.7%      10460        unixbench.time.maximum_resident_set_size
     20681            +0.3%      20749            -0.0%      20678        unixbench.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        unixbench.time.page_size
     70.00            +0.0%      70.00            +0.0%      70.00        unixbench.time.percent_of_cpu_this_job_got
    305.51            +0.1%     305.76            +0.4%     306.76        unixbench.time.system_time
     34.03            -0.7%      33.80            -3.7%      32.78        unixbench.time.user_time
    543.00 ±  8%      -2.2%     530.88 ±  7%      +1.3%     550.25 ± 10%  unixbench.time.voluntary_context_switches
 6.728e+08            -0.1%  6.719e+08            -2.0%  6.596e+08        unixbench.workload
 6.153e+10            -0.0%  6.151e+10            +0.0%  6.153e+10        cpuidle..time
   1189251            +2.1%    1214078 ±  2%      +1.2%    1203611 ±  2%  cpuidle..usage
      3.75 ±129%     -33.3%       2.50 ±173%     +33.3%       5.00 ±100%  dmesg.bootstage:last
    215.78 ±108%     +62.0%     349.65 ± 76%      -0.1%     215.48 ±106%  dmesg.timestamp:last
    556.65            +0.0%     556.90            +0.2%     557.93        uptime.boot
     70261            +0.1%      70299            +0.2%      70419        uptime.idle
     70.78 ±  3%      +0.4%      71.09 ±  3%      +1.8%      72.04 ±  3%  boot-time.boot
     44.65 ±  2%      -1.2%      44.14            -1.0%      44.20        boot-time.dhcp
      8441 ±  4%      +0.5%       8487 ±  3%      +1.9%       8599 ±  3%  boot-time.idle
      1.56            +0.0%       1.56            +0.0%       1.56        boot-time.smp_boot
     99.41            +0.0       99.41            -0.0       99.41        mpstat.cpu.all.idle%
      0.00 ±111%      -0.0        0.00 ±185%      -0.0        0.00 ±129%  mpstat.cpu.all.iowait%
      0.00 ±  5%      -0.0        0.00 ±  7%      +0.0        0.00 ±  7%  mpstat.cpu.all.irq%
      0.00 ±  9%      +0.0        0.00 ± 11%      -0.0        0.00 ±  9%  mpstat.cpu.all.soft%
      0.51            +0.0        0.51            +0.0        0.51        mpstat.cpu.all.sys%
      0.08            -0.0        0.08            -0.0        0.07        mpstat.cpu.all.usr%
     99.00            +0.0%      99.00            +0.0%      99.00        vmstat.cpu.id
      0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.sy
      0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.us
     12.75 ±100%     -24.5%       9.62 ±129%     -23.5%       9.75 ±129%  vmstat.io.bi
      2.25 ±110%     -16.7%       1.88 ±137%      +0.0%       2.25 ±129%  vmstat.io.bo
      7.50 ± 46%     -11.7%       6.62 ± 51%     -11.7%       6.62 ± 51%  vmstat.memory.buff
   3905002            -0.0%    3904529            -0.0%    3903325        vmstat.memory.cache
 2.252e+08            -0.0%  2.252e+08            +0.0%  2.252e+08        vmstat.memory.free
      0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.r
      1650            -0.7%       1639 ±  3%      -0.3%       1645 ±  2%  vmstat.system.cs
      3414            +1.0%       3450            +0.5%       3433 ±  2%  vmstat.system.in
    480.50            -0.0%     480.33            -0.0%     480.28        time.elapsed_time
    480.50            -0.0%     480.33            -0.0%     480.28        time.elapsed_time.max
    184.00 ±101%     -23.9%     140.00 ±133%     -17.4%     152.00 ±132%  time.file_system_inputs
      2332 ±110%     -17.2%       1932 ±137%      -0.2%       2328 ±129%  time.file_system_outputs
    221.25 ±  7%      -9.1%     201.12 ±  9%      -6.4%     207.12 ± 11%  time.involuntary_context_switches
     10534            -0.8%      10449            -0.7%      10460        time.maximum_resident_set_size
     20681            +0.3%      20749            -0.0%      20678        time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        time.page_size
     70.00            +0.0%      70.00            +0.0%      70.00        time.percent_of_cpu_this_job_got
    305.51            +0.1%     305.76            +0.4%     306.76        time.system_time
     34.03            -0.7%      33.80            -3.7%      32.78        time.user_time
    543.00 ±  8%      -2.2%     530.88 ±  7%      +1.3%     550.25 ± 10%  time.voluntary_context_switches
     16.00            -0.8%      15.88 ±  2%      +0.0%      16.00        turbostat.Avg_MHz
      0.60            +0.0        0.60            +0.0        0.60        turbostat.Busy%
      2600            +0.0%       2600            +0.0%       2600        turbostat.Bzy_MHz
   1150965            +2.1%    1174873 ±  2%      +1.3%    1165982 ±  2%  turbostat.C1
     99.41            +0.0       99.41            +0.0       99.41        turbostat.C1%
     99.40            +0.0%      99.40            +0.0%      99.40        turbostat.CPU%c1
     63.00            +0.4%      63.25 ±  3%      +2.0%      64.25        turbostat.CoreTmp
      1.88            +0.6%       1.89            +1.1%       1.90        turbostat.IPC
   1564515            +1.3%    1584740            +0.9%    1578844 ±  2%  turbostat.IRQ
    440.88 ±  4%      +3.1%     454.62 ±  6%      +4.3%     459.62 ± 10%  turbostat.POLL
     63.00            +0.4%      63.25 ±  3%      +2.0%      64.25        turbostat.PkgTmp
    240.95            +0.2%     241.43            +0.4%     242.00        turbostat.PkgWatt
     28.76            -0.4%      28.65            -0.5%      28.61        turbostat.RAMWatt
      1995            +0.0%       1995            +0.0%       1995        turbostat.TSC_MHz
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    276045 ± 21%     -29.2%     195572 ± 58%     -13.3%     239449 ± 48%  numa-numastat.node0.local_node
    276059 ± 21%     -29.1%     195630 ± 58%     -13.3%     239463 ± 48%  numa-numastat.node0.numa_hit
     13.75 ±162%    +326.4%      58.62 ± 94%      +0.9%      13.88 ±165%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
    212107 ± 41%     +23.9%     262768 ± 31%     -14.9%     180581 ± 29%  numa-numastat.node1.local_node
    212244 ± 41%     +23.9%     262913 ± 31%     -14.8%     180744 ± 29%  numa-numastat.node1.numa_hit
    137.62 ± 35%      -0.3%     137.25 ± 26%     +18.0%     162.38 ± 21%  numa-numastat.node1.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node2.interleave_hit
    206430 ± 47%      +8.3%     223603 ± 48%     +11.9%     231025 ± 49%  numa-numastat.node2.local_node
    206566 ± 47%      +8.3%     223721 ± 48%     +11.9%     231184 ± 49%  numa-numastat.node2.numa_hit
    135.50 ± 36%     -12.7%     118.25 ± 39%     +17.4%     159.12 ± 30%  numa-numastat.node2.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        numa-numastat.node3.interleave_hit
    232624 ± 36%      +3.9%     241806 ± 57%     +18.0%     274455 ± 33%  numa-numastat.node3.local_node
    232765 ± 36%      +3.9%     241951 ± 57%     +18.0%     274614 ± 33%  numa-numastat.node3.numa_hit
    140.50 ± 41%      +2.9%     144.62 ± 30%     +13.0%     158.75 ± 31%  numa-numastat.node3.other_node
      6724 ±  6%      -1.1%       6649 ±  6%      -0.5%       6690 ±  7%  meminfo.Active
      6189            -0.2%       6176            -0.3%       6174        meminfo.Active(anon)
    534.00 ± 77%     -11.4%     472.88 ± 90%      -3.3%     516.25 ± 91%  meminfo.Active(file)
    192123            -0.1%     191895            +0.1%     192408        meminfo.AnonHugePages
    253315            +0.3%     254010            +0.4%     254293        meminfo.AnonPages
      7.50 ± 46%     -11.7%       6.62 ± 51%     -11.7%       6.62 ± 51%  meminfo.Buffers
   3788960            -0.0%    3788479            -0.0%    3787310        meminfo.Cached
 1.154e+08            +0.0%  1.154e+08            +0.0%  1.154e+08        meminfo.CommitLimit
    350459            +0.4%     351768            +0.9%     353679        meminfo.Committed_AS
 2.219e+08            -0.1%  2.218e+08            -0.2%  2.214e+08        meminfo.DirectMap1G
  14470656 ± 12%      +1.2%   14646784 ±  9%      +2.8%   14871296 ±  8%  meminfo.DirectMap2M
   1296540 ± 12%      -3.5%    1251484 ± 14%      +9.5%    1420188 ± 15%  meminfo.DirectMap4k
      1.00 ±173%      +0.0%       1.00 ±173%     +50.0%       1.50 ±129%  meminfo.Dirty
      2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
    267537 ±  2%      -0.4%     266594 ±  2%      -0.3%     266841 ±  2%  meminfo.Inactive
    261469            +0.2%     262099            +0.4%     262502        meminfo.Inactive(anon)
      6067 ± 97%     -25.9%       4494 ±124%     -28.5%       4339 ±123%  meminfo.Inactive(file)
    116019            +0.0%     116027            -0.0%     115986        meminfo.KReclaimable
     21169            -0.4%      21079            -0.1%      21153        meminfo.KernelStack
     21775            -0.3%      21713            -0.5%      21659        meminfo.Mapped
 2.242e+08            -0.0%  2.242e+08            +0.0%  2.242e+08        meminfo.MemAvailable
 2.252e+08            -0.0%  2.252e+08            +0.0%  2.252e+08        meminfo.MemFree
 2.307e+08            +0.0%  2.307e+08            +0.0%  2.307e+08        meminfo.MemTotal
   5477859            +0.0%    5479031            -0.0%    5476571        meminfo.Memused
    837.38            +0.0%     837.38            -0.1%     836.88        meminfo.Mlocked
      3570            +0.3%       3581            +0.3%       3580        meminfo.PageTables
     68553            +0.3%      68740            +0.1%      68623        meminfo.Percpu
    116019            +0.0%     116027            -0.0%     115986        meminfo.SReclaimable
    240258            +0.4%     241201            -0.1%     240027        meminfo.SUnreclaim
      8128            -0.0%       8127            +0.0%       8128        meminfo.Shmem
    356279            +0.3%     357229            -0.1%     356014        meminfo.Slab
   3774353            +0.0%    3775506            +0.0%    3774449        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    297102            -0.0%     297011            -0.0%     297091        meminfo.VmallocUsed
      0.00          -100.0%       0.00          -100.0%       0.00        meminfo.Writeback
   5772320            -0.1%    5766019            +0.1%    5780795        meminfo.max_used_kB
    611.38 ± 13%      -3.6%     589.62 ± 14%      +9.9%     671.88 ± 15%  proc-vmstat.direct_map_level2_splits
      6.38 ± 15%      +3.9%       6.62 ± 19%      +2.0%       6.50 ±  7%  proc-vmstat.direct_map_level3_splits
      1550            -0.2%       1546            -0.2%       1547        proc-vmstat.nr_active_anon
    133.25 ± 77%     -11.4%     118.00 ± 90%      -3.5%     128.62 ± 92%  proc-vmstat.nr_active_file
     63341            +0.3%      63515            +0.4%      63585        proc-vmstat.nr_anon_pages
     93.38            -0.1%      93.25            +0.1%      93.50        proc-vmstat.nr_anon_transparent_hugepages
    299.50 ±111%     -16.7%     249.50 ±137%      +1.2%     303.00 ±129%  proc-vmstat.nr_dirtied
      0.25 ±173%      +0.0%       0.25 ±173%     +50.0%       0.38 ±129%  proc-vmstat.nr_dirty
   5594623            -0.0%    5594553            -0.0%    5594613        proc-vmstat.nr_dirty_background_threshold
  11202927            -0.0%   11202786            -0.0%   11202907        proc-vmstat.nr_dirty_threshold
    947246            -0.0%     947125            -0.0%     946834        proc-vmstat.nr_file_pages
  56311623            -0.0%   56311330            +0.0%   56311958        proc-vmstat.nr_free_pages
     65377            +0.2%      65536            +0.4%      65634        proc-vmstat.nr_inactive_anon
      1517 ± 97%     -25.9%       1124 ±124%     -28.4%       1085 ±123%  proc-vmstat.nr_inactive_file
     21168            -0.4%      21082            -0.1%      21155        proc-vmstat.nr_kernel_stack
      5452            -0.3%       5435            -0.6%       5421        proc-vmstat.nr_mapped
    208.75            +0.1%     208.88            +0.0%     208.75        proc-vmstat.nr_mlock
    897.25            +0.4%     900.62            +0.4%     900.75        proc-vmstat.nr_page_table_pages
      2035            -0.0%       2034            +0.0%       2035        proc-vmstat.nr_shmem
     29004            +0.0%      29006            -0.0%      28996        proc-vmstat.nr_slab_reclaimable
     60064            +0.4%      60299            -0.1%      60006        proc-vmstat.nr_slab_unreclaimable
    943588            +0.0%     943876            +0.0%     943613        proc-vmstat.nr_unevictable
    301.50 ±111%     -16.9%     250.50 ±137%      +0.5%     303.00 ±129%  proc-vmstat.nr_written
      1550            -0.2%       1546            -0.2%       1547        proc-vmstat.nr_zone_active_anon
    133.25 ± 77%     -11.4%     118.00 ± 90%      -3.5%     128.62 ± 92%  proc-vmstat.nr_zone_active_file
     65377            +0.2%      65536            +0.4%      65634        proc-vmstat.nr_zone_inactive_anon
      1517 ± 97%     -25.9%       1124 ±124%     -28.4%       1085 ±123%  proc-vmstat.nr_zone_inactive_file
    943588            +0.0%     943876            +0.0%     943613        proc-vmstat.nr_zone_unevictable
      0.25 ±173%      +0.0%       0.25 ±173%     +50.0%       0.38 ±129%  proc-vmstat.nr_zone_write_pending
     10346 ± 52%     -27.8%       7470 ± 29%     -16.9%       8598 ±  9%  proc-vmstat.numa_hint_faults
      3882 ±113%     -39.9%       2335 ±122%     -16.6%       3239 ± 98%  proc-vmstat.numa_hint_faults_local
    930649            -0.3%     927447            -0.1%     929318        proc-vmstat.numa_hit
     69.25 ± 43%     +10.3%      76.38 ± 25%      -1.3%      68.38 ± 43%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
    930221            -0.3%     926982            -0.2%     928824        proc-vmstat.numa_local
    427.50 ± 32%      +7.4%     459.00 ± 28%     +15.6%     494.25 ± 25%  proc-vmstat.numa_other
     11977 ± 59%     -16.1%      10045 ± 50%     -35.4%       7736 ± 49%  proc-vmstat.numa_pages_migrated
     61388 ± 32%      -3.6%      59152 ± 22%      -6.6%      57327 ± 38%  proc-vmstat.numa_pte_updates
    505.38 ± 30%      -7.8%     465.75 ± 27%     +18.8%     600.62 ± 38%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   1021207            -0.3%    1018121            -0.4%    1017530        proc-vmstat.pgalloc_normal
   1350068            -0.2%    1347029            -0.1%    1349046        proc-vmstat.pgfault
   1076285            -1.0%    1065067            -1.1%    1064943 ±  2%  proc-vmstat.pgfree
     11977 ± 59%     -16.1%      10045 ± 50%     -35.4%       7736 ± 49%  proc-vmstat.pgmigrate_success
      6312 ±100%     -24.7%       4754 ±129%     -24.0%       4798 ±129%  proc-vmstat.pgpgin
      1215 ±111%     -16.9%       1009 ±137%      +0.5%       1221 ±129%  proc-vmstat.pgpgout
     55710            +0.5%      56013            -0.4%      55465        proc-vmstat.pgreuse
    104.50            +0.4%     104.88            +1.2%     105.75        proc-vmstat.thp_collapse_alloc
      2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.thp_deferred_split_page
      1.12 ± 29%    +211.1%       3.50 ±168%     +55.6%       1.75 ± 47%  proc-vmstat.thp_fault_alloc
     11.25 ± 90%     -14.4%       9.62 ± 69%     -55.6%       5.00 ± 48%  proc-vmstat.thp_migration_success
      6.50 ± 36%      -7.7%       6.00 ± 16%      -1.9%       6.38 ± 22%  proc-vmstat.thp_scan_exceed_share_pte
      2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
     10107            +0.0%      10108            +0.1%      10117        proc-vmstat.unevictable_pgs_culled
    607.62            +0.0%     607.62            +0.1%     608.25        proc-vmstat.unevictable_pgs_mlocked
      3.62 ± 13%      +0.0%       3.62 ± 19%     +17.2%       4.25 ± 15%  proc-vmstat.unevictable_pgs_munlocked
      3.62 ± 13%      +0.0%       3.62 ± 19%     +17.2%       4.25 ± 15%  proc-vmstat.unevictable_pgs_rescued
      2480 ± 79%      +1.6%       2519 ± 84%     -51.8%       1196 ±117%  numa-meminfo.node0.Active
      2473 ± 79%      -6.5%       2311 ± 92%     -56.6%       1073 ±130%  numa-meminfo.node0.Active(anon)
      7.50 ±139%   +2665.0%     207.38 ±154%   +1535.0%     122.62 ±238%  numa-meminfo.node0.Active(file)
     37803 ±114%     +12.0%      42330 ± 68%     +78.9%      67633 ± 79%  numa-meminfo.node0.AnonHugePages
     53259 ± 94%     +10.3%      58737 ± 56%     +66.0%      88423 ± 70%  numa-meminfo.node0.AnonPages
    105297 ± 46%      +1.0%     106377 ± 34%     +32.4%     139372 ± 42%  numa-meminfo.node0.AnonPages.max
      0.00         +5e+101%       0.50 ±264%   +5e+101%       0.50 ±264%  numa-meminfo.node0.Dirty
   2283733 ± 76%     -76.6%     534820 ±216%     -38.5%    1404509 ±121%  numa-meminfo.node0.FilePages
     58857 ± 87%     +10.1%      64782 ± 48%     +61.7%      95150 ± 66%  numa-meminfo.node0.Inactive
     57159 ± 89%     +10.1%      62945 ± 53%     +62.7%      93009 ± 66%  numa-meminfo.node0.Inactive(anon)
      1697 ±121%      +8.2%       1836 ±167%     +26.1%       2140 ±146%  numa-meminfo.node0.Inactive(file)
     52327 ± 47%     -51.4%      25435 ± 67%     -27.0%      38179 ± 63%  numa-meminfo.node0.KReclaimable
      5647 ±  8%      +2.4%       5784 ±  8%      +4.2%       5884 ±  8%  numa-meminfo.node0.KernelStack
     13551 ± 76%     -79.5%       2777 ±259%     -39.9%       8149 ±127%  numa-meminfo.node0.Mapped
  63200635 ±  2%      +2.9%   65044230            +1.4%   64092949 ±  2%  numa-meminfo.node0.MemFree
  66052128            +0.0%   66052128            +0.0%   66052128        numa-meminfo.node0.MemTotal
   2851492 ± 61%     -64.7%    1007896 ±120%     -31.3%    1959177 ± 90%  numa-meminfo.node0.MemUsed
    570.00 ± 61%     -65.7%     195.75 ±126%     -31.7%     389.12 ± 88%  numa-meminfo.node0.Mlocked
      1059 ± 18%      -7.1%     984.25 ± 27%     +12.6%       1193 ± 15%  numa-meminfo.node0.PageTables
     52327 ± 47%     -51.4%      25435 ± 67%     -27.0%      38179 ± 63%  numa-meminfo.node0.SReclaimable
     83850 ±  9%      -9.1%      76193 ±  7%      -1.8%      82321 ± 10%  numa-meminfo.node0.SUnreclaim
      3022 ± 62%      -5.4%       2859 ± 77%     -43.8%       1698 ± 79%  numa-meminfo.node0.Shmem
    136178 ± 17%     -25.4%     101630 ± 19%     -11.5%     120501 ± 24%  numa-meminfo.node0.Slab
   2279126 ± 76%     -76.7%     530021 ±218%     -38.5%    1400667 ±122%  numa-meminfo.node0.Unevictable
      1856 ± 91%     -65.1%     648.38 ± 90%      +0.9%       1873 ± 73%  numa-meminfo.node1.Active
      1589 ±112%     -62.4%     597.25 ± 99%      +5.5%       1676 ± 89%  numa-meminfo.node1.Active(anon)
    266.50 ±120%     -80.9%      50.88 ±110%     -26.4%     196.25 ±170%  numa-meminfo.node1.Active(file)
     44344 ± 62%     +33.7%      59296 ± 50%     -10.2%      39829 ± 90%  numa-meminfo.node1.AnonHugePages
     58613 ± 55%     +32.4%      77585 ± 42%      -4.3%      56107 ± 74%  numa-meminfo.node1.AnonPages
    103684 ± 35%     +15.7%     119995 ± 34%      +1.5%     105282 ± 46%  numa-meminfo.node1.AnonPages.max
      0.50 ±264%      +0.0%       0.50 ±264%    -100.0%       0.00        numa-meminfo.node1.Dirty
   1428105 ±121%    +120.8%    3152886 ± 37%     +27.6%    1822234 ± 98%  numa-meminfo.node1.FilePages
     60690 ± 51%     +31.6%      79847 ± 41%      -6.2%      56920 ± 73%  numa-meminfo.node1.Inactive
     59008 ± 55%     +32.9%      78451 ± 42%      -4.1%      56563 ± 73%  numa-meminfo.node1.Inactive(anon)
      1680 ±142%     -17.0%       1395 ±151%     -78.8%     356.75 ±138%  numa-meminfo.node1.Inactive(file)
     37193 ± 73%     +78.6%      66416 ± 25%      +8.3%      40274 ± 68%  numa-meminfo.node1.KReclaimable
      5138 ±  6%      +1.0%       5190 ±  8%      +1.1%       5196 ± 10%  numa-meminfo.node1.KernelStack
      8140 ±128%    +131.9%      18879 ± 37%     +32.3%      10771 ± 99%  numa-meminfo.node1.Mapped
  63799869 ±  2%      -2.9%   61953773            -0.7%   63358188 ±  2%  numa-meminfo.node1.MemFree
  65637072            +0.0%   65637072            +0.0%   65637072        numa-meminfo.node1.MemTotal
   1837201 ± 95%    +100.5%    3683297 ± 33%     +24.0%    2278882 ± 78%  numa-meminfo.node1.MemUsed
    267.12 ±129%    +134.1%     625.25 ± 37%     +34.4%     359.00 ±100%  numa-meminfo.node1.Mlocked
    764.25 ± 29%     +32.5%       1012 ± 26%     +13.6%     868.38 ± 20%  numa-meminfo.node1.PageTables
     37193 ± 73%     +78.6%      66416 ± 25%      +8.3%      40274 ± 68%  numa-meminfo.node1.SReclaimable
     52433 ± 10%     +14.2%      59884 ±  9%      +9.3%      57294 ± 10%  numa-meminfo.node1.SUnreclaim
      2078 ± 81%     -49.8%       1042 ± 61%      +0.3%       2083 ± 71%  numa-meminfo.node1.Shmem
     89628 ± 29%     +40.9%     126302 ± 16%      +8.9%      97569 ± 29%  numa-meminfo.node1.Slab
   1424076 ±122%    +121.2%    3150394 ± 37%     +27.8%    1819594 ± 98%  numa-meminfo.node1.Unevictable
      1077 ±129%     +33.1%       1435 ±113%    +124.4%       2419 ± 78%  numa-meminfo.node2.Active
    886.38 ±159%     +54.0%       1364 ±119%    +153.2%       2244 ± 86%  numa-meminfo.node2.Active(anon)
    191.38 ±179%     -63.3%      70.25 ±124%      -8.9%     174.38 ±163%  numa-meminfo.node2.Active(file)
     62518 ± 79%     -27.9%      45050 ± 37%     -37.4%      39127 ± 87%  numa-meminfo.node2.AnonHugePages
     75973 ± 76%     -20.2%      60592 ± 33%     -30.0%      53197 ± 77%  numa-meminfo.node2.AnonPages
    125428 ± 50%      +1.8%     127679 ± 22%     -26.4%      92329 ± 42%  numa-meminfo.node2.AnonPages.max
      0.50 ±264%    -100.0%       0.00            +0.0%       0.50 ±264%  numa-meminfo.node2.Dirty
     29716 ±113%     +52.2%      45243 ± 97%   +1664.3%     524284 ±229%  numa-meminfo.node2.FilePages
     77598 ± 76%     -19.6%      62359 ± 34%     -29.4%      54777 ± 75%  numa-meminfo.node2.Inactive
     76484 ± 75%     -19.9%      61293 ± 33%     -29.7%      53737 ± 76%  numa-meminfo.node2.Inactive(anon)
      1113 ±183%      -4.3%       1065 ±181%      -6.7%       1039 ±194%  numa-meminfo.node2.Inactive(file)
     14762 ± 37%     -27.6%      10688 ± 39%     +40.4%      20729 ± 97%  numa-meminfo.node2.KReclaimable
      5272 ±  9%      -2.1%       5160 ±  7%      -4.2%       5051 ±  6%  numa-meminfo.node2.KernelStack
     67.12 ±157%     -73.6%      17.75 ±181%   +3986.4%       2743 ±260%  numa-meminfo.node2.Mapped
  49154001            -0.0%   49137950            -1.0%   48675444 ±  2%  numa-meminfo.node2.MemFree
  49538112            +0.0%   49538112            +0.0%   49538112        numa-meminfo.node2.MemTotal
    384109 ± 16%      +4.2%     400160 ± 23%    +124.6%     862667 ±141%  numa-meminfo.node2.MemUsed
      0.00       +1.5e+103%      15.12 ±264% +8.9e+103%      89.25 ±264%  numa-meminfo.node2.Mlocked
    807.75 ± 29%      -9.8%     728.75 ± 26%      -3.0%     783.88 ± 22%  numa-meminfo.node2.PageTables
     14762 ± 37%     -27.6%      10688 ± 39%     +40.4%      20729 ± 97%  numa-meminfo.node2.SReclaimable
     50755 ±  9%     +11.5%      56575 ± 11%      -0.7%      50398 ± 10%  numa-meminfo.node2.SUnreclaim
      1259 ±130%     +63.3%       2056 ± 87%    +119.5%       2764 ± 73%  numa-meminfo.node2.Shmem
     65518 ± 10%      +2.7%      67263 ± 11%      +8.6%      71128 ± 32%  numa-meminfo.node2.Slab
     27150 ±123%     +54.9%      42064 ±105%   +1816.4%     520303 ±231%  numa-meminfo.node2.Unevictable
      1317 ±115%     +55.9%       2053 ±108%      -8.0%       1212 ±107%  numa-meminfo.node3.Active
      1248 ±122%     +52.9%       1909 ±106%      -4.8%       1189 ±110%  numa-meminfo.node3.Active(anon)
     68.62 ±134%    +110.2%     144.25 ±193%     -66.1%      23.25 ±203%  numa-meminfo.node3.Active(file)
     47471 ± 59%      -4.8%      45209 ± 68%      -3.5%      45819 ± 88%  numa-meminfo.node3.AnonHugePages
     65482 ± 51%     -12.8%      57102 ± 60%     -13.6%      56588 ± 81%  numa-meminfo.node3.AnonPages
    124675 ± 33%     -28.5%      89128 ± 29%     -14.7%     106289 ± 49%  numa-meminfo.node3.AnonPages.max
      0.00          -100.0%       0.00         +5e+101%       0.50 ±264%  numa-meminfo.node3.Dirty
     47427 ±116%     +17.1%      55547 ±101%     -23.4%      36310 ± 91%  numa-meminfo.node3.FilePages
     70391 ± 44%     -15.3%      59600 ± 57%     -14.8%      60008 ± 77%  numa-meminfo.node3.Inactive
     68811 ± 47%     -13.7%      59398 ± 58%     -14.0%      59198 ± 78%  numa-meminfo.node3.Inactive(anon)
      1579 ±211%     -87.2%     201.88 ±210%     -48.8%     809.50 ±216%  numa-meminfo.node3.Inactive(file)
     11735 ± 47%     +14.9%      13485 ± 52%     +43.2%      16801 ± 20%  numa-meminfo.node3.KReclaimable
      5099 ±  9%      -3.1%       4939 ±  6%      -1.7%       5012 ±  6%  numa-meminfo.node3.KernelStack
     21.00 ±163%    +125.6%      47.38 ±109%     -67.9%       6.75 ± 45%  numa-meminfo.node3.Mapped
  49091999            +0.0%   49109348            +0.1%   49121205        numa-meminfo.node3.MemFree
  49496916            +0.0%   49496916            +0.0%   49496916        numa-meminfo.node3.MemTotal
    404915 ± 17%      -4.3%     387567 ± 18%      -7.2%     375709 ± 13%  numa-meminfo.node3.MemUsed
    942.00 ± 25%      -8.6%     860.62 ± 28%     -21.1%     743.00 ± 15%  numa-meminfo.node3.PageTables
     11735 ± 47%     +14.9%      13485 ± 52%     +43.2%      16801 ± 20%  numa-meminfo.node3.SReclaimable
     53218 ±  9%      -8.8%      48546 ±  7%      -6.0%      50013 ± 11%  numa-meminfo.node3.SUnreclaim
      1777 ± 75%     +22.4%       2175 ± 93%     -10.5%       1591 ± 81%  numa-meminfo.node3.Shmem
     64954 ± 13%      -4.5%      62033 ± 15%      +2.9%      66815 ± 10%  numa-meminfo.node3.Slab
     43998 ±126%     +20.5%      53024 ±107%     -23.0%      33885 ± 96%  numa-meminfo.node3.Unevictable
      0.00        +1.7e+09%      17.27 ±153%      +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +1.8e+11%       1793 ±137%      +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +1.7e+104%     166.21 ±141%    -100.0%       0.00        sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.08 ±  4%      +4.5%       0.08 ±  4%      +3.1%       0.08 ±  3%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.00            +2.8%       1.03 ±  4%      +0.0%       1.00        sched_debug.cfs_rq:/.h_nr_running.max
      0.26 ±  2%      +2.3%       0.27 ±  2%      +1.5%       0.27        sched_debug.cfs_rq:/.h_nr_running.stddev
     23998 ±  6%      +7.0%      25675 ±  9%      +1.6%      24383 ±  3%  sched_debug.cfs_rq:/.load.avg
    374625 ±  6%     +15.3%     432125 ± 17%      -2.2%     366260        sched_debug.cfs_rq:/.load.max
     85459 ±  4%      +8.7%      92904 ± 10%      -0.1%      85397        sched_debug.cfs_rq:/.load.stddev
     35.86 ± 16%      +1.8%      36.50 ± 11%      +7.6%      38.58 ± 20%  sched_debug.cfs_rq:/.load_avg.avg
    546.36 ± 18%      -0.1%     546.08 ±  9%     +55.9%     851.57 ± 97%  sched_debug.cfs_rq:/.load_avg.max
    122.62 ± 13%      +0.8%     123.65 ±  8%     +21.3%     148.69 ± 48%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +1.7e+09%      17.27 ±153%      +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +1.8e+11%       1793 ±137%      +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.min
      0.00       +1.7e+104%     166.21 ±141%    -100.0%       0.00        sched_debug.cfs_rq:/.max_vruntime.stddev
     35457 ± 11%     -12.7%      30970 ± 12%     +11.3%      39474 ± 13%  sched_debug.cfs_rq:/.min_vruntime.avg
    116804 ± 21%     +13.8%     132890 ± 18%     +16.4%     136011 ± 16%  sched_debug.cfs_rq:/.min_vruntime.max
     21984 ± 16%     -23.2%      16878 ± 18%      +8.5%      23858 ± 22%  sched_debug.cfs_rq:/.min_vruntime.min
     15717 ± 22%     +21.5%      19101 ± 21%     +18.8%      18676 ± 20%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.08 ±  4%      +4.5%       0.08 ±  4%      +3.0%       0.08 ±  3%  sched_debug.cfs_rq:/.nr_running.avg
      1.00            +2.8%       1.03 ±  4%      +0.0%       1.00        sched_debug.cfs_rq:/.nr_running.max
      0.26 ±  2%      +2.3%       0.27 ±  2%      +1.5%       0.27        sched_debug.cfs_rq:/.nr_running.stddev
      6.36 ± 87%      -7.6%       5.87 ± 60%     -12.9%       5.54 ± 47%  sched_debug.cfs_rq:/.removed.load_avg.avg
    170.39 ± 88%      +0.2%     170.67 ± 47%     -16.5%     142.22 ± 34%  sched_debug.cfs_rq:/.removed.load_avg.max
     31.55 ± 87%      -6.7%      29.44 ± 51%     -16.5%      26.33 ± 36%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      2.64 ± 99%      -4.5%       2.52 ± 63%     -18.3%       2.16 ± 54%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     85.74 ± 88%      -3.5%      82.76 ± 52%     -19.2%      69.28 ± 40%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     13.79 ± 99%      -4.4%      13.18 ± 57%     -20.4%      10.98 ± 47%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      2.64 ± 99%      -4.5%       2.52 ± 63%     -18.3%       2.16 ± 54%  sched_debug.cfs_rq:/.removed.util_avg.avg
     85.74 ± 88%      -3.5%      82.76 ± 52%     -19.2%      69.28 ± 40%  sched_debug.cfs_rq:/.removed.util_avg.max
     13.79 ± 99%      -4.4%      13.18 ± 57%     -20.4%      10.98 ± 47%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     69.63 ±  5%      +1.8%      70.87 ±  5%      -0.5%      69.29 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
    938.38            +1.3%     950.81 ±  2%      +1.3%     950.39        sched_debug.cfs_rq:/.runnable_avg.max
    187.50 ±  2%      +1.5%     190.27 ±  2%      +1.3%     189.90 ±  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
      2118 ±268%     +95.2%       4135 ±104%    -161.1%      -1295        sched_debug.cfs_rq:/.spread0.avg
     83470 ± 30%     +27.1%     106066 ± 26%     +14.1%      95247 ± 24%  sched_debug.cfs_rq:/.spread0.max
    -11352           -12.3%      -9959           +49.0%     -16914        sched_debug.cfs_rq:/.spread0.min
     15718 ± 22%     +21.5%      19102 ± 21%     +18.8%      18676 ± 20%  sched_debug.cfs_rq:/.spread0.stddev
     69.61 ±  5%      +1.8%      70.84 ±  5%      -0.5%      69.24 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
    938.29            +1.3%     950.60 ±  2%      +1.3%     950.35        sched_debug.cfs_rq:/.util_avg.max
    187.48 ±  2%      +1.5%     190.24 ±  2%      +1.2%     189.81 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
     19.11 ±  3%      +1.9%      19.47 ±  5%      +3.7%      19.82 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    653.33            -0.5%     650.03            -0.7%     649.08        sched_debug.cfs_rq:/.util_est_enqueued.max
    102.82            +1.0%     103.82 ±  2%      +1.1%     103.98        sched_debug.cfs_rq:/.util_est_enqueued.stddev
    963096            +0.1%     964043            -0.0%     963080        sched_debug.cpu.avg_idle.avg
   1015135            +0.2%    1017046            +0.3%    1018271        sched_debug.cpu.avg_idle.max
    203775 ± 60%     +12.0%     228250 ± 63%     -23.1%     156682 ± 50%  sched_debug.cpu.avg_idle.min
    111934 ±  9%      -3.5%     108043 ± 13%      +2.2%     114368 ±  4%  sched_debug.cpu.avg_idle.stddev
    314330            +0.1%     314774            +0.4%     315544        sched_debug.cpu.clock.avg
    314336            +0.1%     314780            +0.4%     315550        sched_debug.cpu.clock.max
    314322            +0.1%     314764            +0.4%     315536        sched_debug.cpu.clock.min
      3.31 ± 17%      -1.4%       3.26 ±  9%      -8.7%       3.02 ±  5%  sched_debug.cpu.clock.stddev
    314022            +0.1%     314464            +0.4%     315235        sched_debug.cpu.clock_task.avg
    314310            +0.1%     314754            +0.4%     315524        sched_debug.cpu.clock_task.max
    296663            +0.1%     296970            +0.4%     297873        sched_debug.cpu.clock_task.min
      1553            +0.8%       1565            +0.0%       1553        sched_debug.cpu.clock_task.stddev
    221.57 ±  4%      -0.3%     220.92 ±  2%      +2.3%     226.57 ±  3%  sched_debug.cpu.curr->pid.avg
     12544            -0.0%      12541            +0.0%      12551        sched_debug.cpu.curr->pid.max
      1520            +0.0%       1520            +0.5%       1528        sched_debug.cpu.curr->pid.stddev
    500193            +0.0%     500242            +0.0%     500194        sched_debug.cpu.max_idle_balance_cost.avg
    511669            +0.7%     515223 ±  2%      -0.1%     511140        sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      1285 ± 54%     +24.9%       1605 ± 67%      -2.7%       1250 ± 60%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 54%     -30.9%       0.00 ± 25%     -25.2%       0.00 ± 52%  sched_debug.cpu.next_balance.stddev
      0.03 ±  9%      +2.0%       0.03 ±  5%      +4.9%       0.03 ±  6%  sched_debug.cpu.nr_running.avg
      1.00            +2.8%       1.03 ±  4%      +0.0%       1.00        sched_debug.cpu.nr_running.max
      0.15 ±  5%      +1.4%       0.15 ±  4%      +2.5%       0.15 ±  3%  sched_debug.cpu.nr_running.stddev
      5787            -1.2%       5715 ±  2%      -0.8%       5743 ±  2%  sched_debug.cpu.nr_switches.avg
    104611 ± 18%      +8.6%     113566 ± 23%      -5.3%      99104 ± 20%  sched_debug.cpu.nr_switches.max
    937.46 ±  6%      -5.5%     886.21 ± 11%      -3.8%     902.04 ±  6%  sched_debug.cpu.nr_switches.min
     11667 ±  8%      +2.5%      11958 ± 14%      -3.6%      11241 ± 10%  sched_debug.cpu.nr_switches.stddev
 2.115e+09 ±  6%      +0.6%  2.128e+09 ±  8%      -4.0%  2.031e+09 ±  3%  sched_debug.cpu.nr_uninterruptible.avg
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterruptible.max
 2.143e+09            -0.1%   2.14e+09            +0.0%  2.143e+09        sched_debug.cpu.nr_uninterruptible.stddev
    314327            +0.1%     314772            +0.4%     315541        sched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
    313062            +0.1%     313506            +0.4%     314276        sched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
    315626            +0.1%     315792            +0.3%     316627        sched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
  58611259            +0.0%   58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysctl_sched_features
      0.75            +0.0%       0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysctl_sched_idle_min_granularity
     24.00            +0.0%      24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
    618.00 ± 79%      -6.5%     577.62 ± 92%     -56.7%     267.88 ±130%  numa-vmstat.node0.nr_active_anon
      1.75 ±142%   +2850.0%      51.62 ±155%   +1642.9%      30.50 ±239%  numa-vmstat.node0.nr_active_file
     13313 ± 94%     +10.3%      14683 ± 56%     +66.0%      22105 ± 70%  numa-vmstat.node0.nr_anon_pages
     18.12 ±115%     +11.0%      20.12 ± 70%     +79.3%      32.50 ± 80%  numa-vmstat.node0.nr_anon_transparent_hugepages
      0.00       +1.5e+104%     151.00 ±179%   +1e+104%     100.50 ±252%  numa-vmstat.node0.nr_dirtied
      0.00       +1.2e+101%       0.12 ±264% +1.2e+101%       0.12 ±264%  numa-vmstat.node0.nr_dirty
    570932 ± 76%     -76.6%     133705 ±216%     -38.5%     351127 ±121%  numa-vmstat.node0.nr_file_pages
  15800160 ±  2%      +2.9%   16261069            +1.4%   16023249 ±  2%  numa-vmstat.node0.nr_free_pages
     14288 ± 89%     +10.1%      15736 ± 53%     +62.7%      23252 ± 66%  numa-vmstat.node0.nr_inactive_anon
    424.25 ±121%      +8.2%     459.00 ±167%     +26.1%     535.00 ±146%  numa-vmstat.node0.nr_inactive_file
      5655 ±  8%      +2.3%       5785 ±  8%      +4.1%       5886 ±  8%  numa-vmstat.node0.nr_kernel_stack
      3389 ± 76%     -79.5%     694.50 ±259%     -39.9%       2038 ±127%  numa-vmstat.node0.nr_mapped
    142.38 ± 61%     -65.8%      48.75 ±126%     -31.8%      97.12 ± 89%  numa-vmstat.node0.nr_mlock
    265.25 ± 18%      -7.3%     246.00 ± 28%     +12.7%     299.00 ± 15%  numa-vmstat.node0.nr_page_table_pages
    755.12 ± 62%      -5.4%     714.38 ± 77%     -43.9%     423.75 ± 79%  numa-vmstat.node0.nr_shmem
     13081 ± 47%     -51.4%       6358 ± 67%     -27.0%       9544 ± 63%  numa-vmstat.node0.nr_slab_reclaimable
     20962 ±  9%      -9.1%      19047 ±  7%      -1.8%      20580 ± 10%  numa-vmstat.node0.nr_slab_unreclaimable
    569781 ± 76%     -76.7%     132505 ±218%     -38.5%     350167 ±122%  numa-vmstat.node0.nr_unevictable
      0.00       +1.5e+104%     151.00 ±179%   +1e+104%     100.50 ±252%  numa-vmstat.node0.nr_written
    618.00 ± 79%      -6.5%     577.62 ± 92%     -56.7%     267.88 ±130%  numa-vmstat.node0.nr_zone_active_anon
      1.75 ±142%   +2850.0%      51.62 ±155%   +1642.9%      30.50 ±239%  numa-vmstat.node0.nr_zone_active_file
     14288 ± 89%     +10.1%      15736 ± 53%     +62.7%      23252 ± 66%  numa-vmstat.node0.nr_zone_inactive_anon
    424.25 ±121%      +8.2%     459.00 ±167%     +26.1%     535.00 ±146%  numa-vmstat.node0.nr_zone_inactive_file
    569781 ± 76%     -76.7%     132505 ±218%     -38.5%     350167 ±122%  numa-vmstat.node0.nr_zone_unevictable
      0.00       +1.2e+101%       0.12 ±264% +1.2e+101%       0.12 ±264%  numa-vmstat.node0.nr_zone_write_pending
    276137 ± 21%     -29.1%     195769 ± 58%     -13.2%     239661 ± 48%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    276123 ± 21%     -29.1%     195711 ± 58%     -13.2%     239647 ± 48%  numa-vmstat.node0.numa_local
     13.75 ±162%    +326.4%      58.62 ± 94%      +0.9%      13.88 ±165%  numa-vmstat.node0.numa_other
    397.38 ±112%     -62.5%     149.12 ± 99%      +5.4%     418.75 ± 89%  numa-vmstat.node1.nr_active_anon
     66.25 ±120%     -81.1%      12.50 ±111%     -26.0%      49.00 ±170%  numa-vmstat.node1.nr_active_file
     14654 ± 55%     +32.4%      19395 ± 42%      -4.3%      14027 ± 74%  numa-vmstat.node1.nr_anon_pages
     21.12 ± 63%     +35.5%      28.62 ± 50%     -11.2%      18.75 ± 93%  numa-vmstat.node1.nr_anon_transparent_hugepages
    151.50 ±180%     -97.4%       4.00 ±264%     -37.3%      95.00 ±264%  numa-vmstat.node1.nr_dirtied
      0.12 ±264%      +0.0%       0.12 ±264%    -100.0%       0.00        numa-vmstat.node1.nr_dirty
    357026 ±121%    +120.8%     788222 ± 37%     +27.6%     455559 ± 98%  numa-vmstat.node1.nr_file_pages
  15949968 ±  2%      -2.9%   15488444            -0.7%   15839547 ±  2%  numa-vmstat.node1.nr_free_pages
     14753 ± 55%     +32.9%      19610 ± 42%      -4.1%      14141 ± 73%  numa-vmstat.node1.nr_inactive_anon
    419.75 ±142%     -16.9%     348.75 ±151%     -78.8%      89.00 ±138%  numa-vmstat.node1.nr_inactive_file
      5141 ±  6%      +1.0%       5193 ±  8%      +1.1%       5197 ± 10%  numa-vmstat.node1.nr_kernel_stack
      2036 ±128%    +131.9%       4722 ± 37%     +32.3%       2694 ± 99%  numa-vmstat.node1.nr_mapped
     66.75 ±129%    +133.9%     156.12 ± 37%     +34.1%      89.50 ±100%  numa-vmstat.node1.nr_mlock
    191.62 ± 29%     +31.6%     252.25 ± 26%     +12.9%     216.38 ± 20%  numa-vmstat.node1.nr_page_table_pages
    518.88 ± 81%     -49.8%     260.25 ± 61%      +0.4%     520.75 ± 71%  numa-vmstat.node1.nr_shmem
      9298 ± 73%     +78.6%      16603 ± 25%      +8.3%      10068 ± 68%  numa-vmstat.node1.nr_slab_reclaimable
     13108 ± 10%     +14.2%      14970 ±  9%      +9.3%      14323 ± 10%  numa-vmstat.node1.nr_slab_unreclaimable
    356019 ±122%    +121.2%     787598 ± 37%     +27.8%     454899 ± 98%  numa-vmstat.node1.nr_unevictable
    152.50 ±179%     -97.4%       4.00 ±264%     -37.7%      95.00 ±264%  numa-vmstat.node1.nr_written
    397.38 ±112%     -62.5%     149.12 ± 99%      +5.4%     418.75 ± 89%  numa-vmstat.node1.nr_zone_active_anon
     66.25 ±120%     -81.1%      12.50 ±111%     -26.0%      49.00 ±170%  numa-vmstat.node1.nr_zone_active_file
     14753 ± 55%     +32.9%      19610 ± 42%      -4.1%      14141 ± 73%  numa-vmstat.node1.nr_zone_inactive_anon
    419.75 ±142%     -16.9%     348.75 ±151%     -78.8%      89.00 ±138%  numa-vmstat.node1.nr_zone_inactive_file
    356019 ±122%    +121.2%     787598 ± 37%     +27.8%     454899 ± 98%  numa-vmstat.node1.nr_zone_unevictable
      0.12 ±264%      +0.0%       0.12 ±264%    -100.0%       0.00        numa-vmstat.node1.nr_zone_write_pending
    212339 ± 41%     +23.9%     263017 ± 31%     -14.9%     180767 ± 29%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
    212201 ± 41%     +23.9%     262873 ± 31%     -14.9%     180604 ± 29%  numa-vmstat.node1.numa_local
    137.62 ± 35%      -0.3%     137.25 ± 26%     +18.0%     162.38 ± 21%  numa-vmstat.node1.numa_other
    221.25 ±159%     +54.0%     340.62 ±120%    +153.4%     560.75 ± 87%  numa-vmstat.node2.nr_active_anon
     47.75 ±180%     -63.6%      17.38 ±125%      -9.7%      43.12 ±164%  numa-vmstat.node2.nr_active_file
     18998 ± 76%     -20.3%      15147 ± 33%     -30.0%      13300 ± 77%  numa-vmstat.node2.nr_anon_pages
     30.12 ± 79%     -28.6%      21.50 ± 38%     -38.2%      18.62 ± 90%  numa-vmstat.node2.nr_anon_transparent_hugepages
    148.00 ±178%    -100.0%       0.00           -30.1%     103.50 ±253%  numa-vmstat.node2.nr_dirtied
      0.12 ±264%    -100.0%       0.00            +0.0%       0.12 ±264%  numa-vmstat.node2.nr_dirty
      7429 ±113%     +52.2%      11310 ± 97%   +1664.2%     131071 ±229%  numa-vmstat.node2.nr_file_pages
  12288496            -0.0%   12284487            -1.0%   12168862 ±  2%  numa-vmstat.node2.nr_free_pages
     19127 ± 75%     -19.9%      15321 ± 33%     -29.8%      13435 ± 76%  numa-vmstat.node2.nr_inactive_anon
    278.25 ±183%      -4.3%     266.38 ±181%      -6.7%     259.50 ±194%  numa-vmstat.node2.nr_inactive_file
      5273 ±  9%      -2.1%       5162 ±  8%      -4.2%       5054 ±  6%  numa-vmstat.node2.nr_kernel_stack
     16.88 ±157%     -73.3%       4.50 ±174%   +3968.9%     686.62 ±260%  numa-vmstat.node2.nr_mapped
      0.00       +3.8e+102%       3.75 ±264% +2.2e+103%      22.25 ±264%  numa-vmstat.node2.nr_mlock
    201.88 ± 29%     -10.0%     181.62 ± 26%      -2.9%     196.00 ± 22%  numa-vmstat.node2.nr_page_table_pages
    314.50 ±130%     +63.3%     513.62 ± 87%    +119.6%     690.75 ± 73%  numa-vmstat.node2.nr_shmem
      3690 ± 37%     -27.6%       2671 ± 39%     +40.4%       5182 ± 97%  numa-vmstat.node2.nr_slab_reclaimable
     12688 ±  9%     +11.5%      14143 ± 11%      -0.7%      12599 ± 10%  numa-vmstat.node2.nr_slab_unreclaimable
      6787 ±123%     +54.9%      10515 ±105%   +1816.4%     130075 ±231%  numa-vmstat.node2.nr_unevictable
    148.00 ±178%     -99.3%       1.00 ±264%     -30.1%     103.50 ±253%  numa-vmstat.node2.nr_written
    221.25 ±159%     +54.0%     340.62 ±120%    +153.4%     560.75 ± 87%  numa-vmstat.node2.nr_zone_active_anon
     47.75 ±180%     -63.6%      17.38 ±125%      -9.7%      43.12 ±164%  numa-vmstat.node2.nr_zone_active_file
     19127 ± 75%     -19.9%      15321 ± 33%     -29.8%      13435 ± 76%  numa-vmstat.node2.nr_zone_inactive_anon
    278.25 ±183%      -4.3%     266.38 ±181%      -6.7%     259.50 ±194%  numa-vmstat.node2.nr_zone_inactive_file
      6787 ±123%     +54.9%      10515 ±105%   +1816.4%     130075 ±231%  numa-vmstat.node2.nr_zone_unevictable
      0.12 ±264%    -100.0%       0.00            +0.0%       0.12 ±264%  numa-vmstat.node2.nr_zone_write_pending
    206694 ± 47%      +8.3%     223771 ± 48%     +11.9%     231327 ± 49%  numa-vmstat.node2.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node2.numa_interleave
    206558 ± 47%      +8.3%     223653 ± 48%     +11.9%     231168 ± 49%  numa-vmstat.node2.numa_local
    135.50 ± 36%     -12.7%     118.25 ± 39%     +17.4%     159.12 ± 30%  numa-vmstat.node2.numa_other
    311.75 ±122%     +53.0%     477.12 ±106%      -4.8%     296.75 ±110%  numa-vmstat.node3.nr_active_anon
     17.00 ±134%    +111.8%      36.00 ±193%     -66.9%       5.62 ±205%  numa-vmstat.node3.nr_active_file
     16369 ± 51%     -12.8%      14277 ± 60%     -13.6%      14147 ± 81%  numa-vmstat.node3.nr_anon_pages
     22.75 ± 59%      -4.4%      21.75 ± 69%      -3.3%      22.00 ± 88%  numa-vmstat.node3.nr_anon_transparent_hugepages
      0.00       +9.4e+103%      94.50 ±264%   +4e+102%       4.00 ±264%  numa-vmstat.node3.nr_dirtied
      0.00          -100.0%       0.00       +1.2e+101%       0.12 ±264%  numa-vmstat.node3.nr_dirty
     11856 ±116%     +17.1%      13886 ±101%     -23.4%       9076 ± 91%  numa-vmstat.node3.nr_file_pages
  12273007            +0.0%   12277345            +0.1%   12280299        numa-vmstat.node3.nr_free_pages
     17201 ± 47%     -13.7%      14852 ± 58%     -14.0%      14799 ± 78%  numa-vmstat.node3.nr_inactive_anon
    394.75 ±211%     -87.2%      50.38 ±209%     -48.8%     202.12 ±216%  numa-vmstat.node3.nr_inactive_file
      5103 ±  9%      -3.2%       4942 ±  6%      -1.7%       5017 ±  6%  numa-vmstat.node3.nr_kernel_stack
      5.50 ±156%    +111.4%      11.62 ±111%     -70.5%       1.62 ± 68%  numa-vmstat.node3.nr_mapped
    235.75 ± 25%      -8.3%     216.25 ± 28%     -21.2%     185.88 ± 15%  numa-vmstat.node3.nr_page_table_pages
    443.75 ± 75%     +22.5%     543.50 ± 93%     -10.5%     397.12 ± 81%  numa-vmstat.node3.nr_shmem
      2933 ± 47%     +14.9%       3371 ± 52%     +43.2%       4200 ± 20%  numa-vmstat.node3.nr_slab_reclaimable
     13304 ±  9%      -8.8%      12136 ±  7%      -6.0%      12502 ± 11%  numa-vmstat.node3.nr_slab_unreclaimable
     10999 ±126%     +20.5%      13255 ±107%     -23.0%       8470 ± 96%  numa-vmstat.node3.nr_unevictable
      1.00 ±264%   +9350.0%      94.50 ±264%    +300.0%       4.00 ±264%  numa-vmstat.node3.nr_written
    311.75 ±122%     +53.0%     477.12 ±106%      -4.8%     296.75 ±110%  numa-vmstat.node3.nr_zone_active_anon
     17.00 ±134%    +111.8%      36.00 ±193%     -66.9%       5.62 ±205%  numa-vmstat.node3.nr_zone_active_file
     17201 ± 47%     -13.7%      14852 ± 58%     -14.0%      14799 ± 78%  numa-vmstat.node3.nr_zone_inactive_anon
    394.75 ±211%     -87.2%      50.38 ±209%     -48.8%     202.12 ±216%  numa-vmstat.node3.nr_zone_inactive_file
     10999 ±126%     +20.5%      13255 ±107%     -23.0%       8470 ± 96%  numa-vmstat.node3.nr_zone_unevictable
      0.00          -100.0%       0.00       +1.2e+101%       0.12 ±264%  numa-vmstat.node3.nr_zone_write_pending
    232686 ± 36%      +4.1%     242181 ± 57%     +18.1%     274695 ± 33%  numa-vmstat.node3.numa_hit
      0.00          -100.0%       0.00          -100.0%       0.00        numa-vmstat.node3.numa_interleave
    232545 ± 36%      +4.1%     242037 ± 57%     +18.1%     274536 ± 33%  numa-vmstat.node3.numa_local
    140.50 ± 41%      +2.9%     144.62 ± 30%     +13.0%     158.75 ± 31%  numa-vmstat.node3.numa_other
    192317            -0.1%     192072            -0.1%     192095        slabinfo.Acpi-Operand.active_objs
      3433            -0.1%       3429            -0.1%       3430        slabinfo.Acpi-Operand.active_slabs
    192317            -0.1%     192072            -0.1%     192095        slabinfo.Acpi-Operand.num_objs
      3433            -0.1%       3429            -0.1%       3430        slabinfo.Acpi-Operand.num_slabs
      4170 ±  3%      -8.3%       3823 ±  9%      -8.1%       3832 ± 10%  slabinfo.Acpi-Parse.active_objs
     57.12 ±  3%      -8.3%      52.38 ±  9%      -8.1%      52.50 ± 10%  slabinfo.Acpi-Parse.active_slabs
      4170 ±  3%      -8.3%       3823 ±  9%      -8.1%       3832 ± 10%  slabinfo.Acpi-Parse.num_objs
     57.12 ±  3%      -8.3%      52.38 ±  9%      -8.1%      52.50 ± 10%  slabinfo.Acpi-Parse.num_slabs
      2537 ±  4%      -8.5%       2320 ± 10%      -9.5%       2295 ± 12%  slabinfo.Acpi-State.active_objs
     49.75 ±  4%      -8.5%      45.50 ± 10%      -9.5%      45.00 ± 12%  slabinfo.Acpi-State.active_slabs
      2537 ±  4%      -8.5%       2320 ± 10%      -9.5%       2295 ± 12%  slabinfo.Acpi-State.num_objs
     49.75 ±  4%      -8.5%      45.50 ± 10%      -9.5%      45.00 ± 12%  slabinfo.Acpi-State.num_slabs
     33.75 ± 17%      +6.7%      36.00            +6.7%      36.00        slabinfo.DCCP.active_objs
      1.88 ± 17%      +6.7%       2.00            +6.7%       2.00        slabinfo.DCCP.active_slabs
     33.75 ± 17%      +6.7%      36.00            +6.7%      36.00        slabinfo.DCCP.num_objs
      1.88 ± 17%      +6.7%       2.00            +6.7%       2.00        slabinfo.DCCP.num_slabs
     31.88 ± 17%      +6.7%      34.00            +6.7%      34.00        slabinfo.DCCPv6.active_objs
      1.88 ± 17%      +6.7%       2.00            +6.7%       2.00        slabinfo.DCCPv6.active_slabs
     31.88 ± 17%      +6.7%      34.00            +6.7%      34.00        slabinfo.DCCPv6.num_objs
      1.88 ± 17%      +6.7%       2.00            +6.7%       2.00        slabinfo.DCCPv6.num_slabs
    256.00            +4.7%     268.00 ±  8%      +0.0%     256.00        slabinfo.RAW.active_objs
      8.00            +4.7%       8.38 ±  8%      +0.0%       8.00        slabinfo.RAW.active_slabs
    256.00            +4.7%     268.00 ±  8%      +0.0%     256.00        slabinfo.RAW.num_objs
      8.00            +4.7%       8.38 ±  8%      +0.0%       8.00        slabinfo.RAW.num_slabs
    201.50 ±  5%      +0.0%     201.50 ±  5%      -3.2%     195.00 ±  6%  slabinfo.RAWv6.active_objs
      7.75 ±  5%      +0.0%       7.75 ±  5%      -3.2%       7.50 ±  6%  slabinfo.RAWv6.active_slabs
    201.50 ±  5%      +0.0%     201.50 ±  5%      -3.2%     195.00 ±  6%  slabinfo.RAWv6.num_objs
      7.75 ±  5%      +0.0%       7.75 ±  5%      -3.2%       7.50 ±  6%  slabinfo.RAWv6.num_slabs
     56.00            +2.9%      57.62 ±  7%      +0.0%      56.00        slabinfo.TCP.active_objs
      4.00            +0.0%       4.00            +0.0%       4.00        slabinfo.TCP.active_slabs
     56.00            +2.9%      57.62 ±  7%      +0.0%      56.00        slabinfo.TCP.num_objs
      4.00            +0.0%       4.00            +0.0%       4.00        slabinfo.TCP.num_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.TCPv6.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.TCPv6.active_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.TCPv6.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.TCPv6.num_slabs
    114.00 ±  9%      +5.2%     119.88 ±  9%      +0.0%     114.00 ±  9%  slabinfo.UDPv6.active_objs
      4.75 ±  9%      +2.6%       4.88 ±  6%      +0.0%       4.75 ±  9%  slabinfo.UDPv6.active_slabs
    114.00 ±  9%      +5.2%     119.88 ±  9%      +0.0%     114.00 ±  9%  slabinfo.UDPv6.num_objs
      4.75 ±  9%      +2.6%       4.88 ±  6%      +0.0%       4.75 ±  9%  slabinfo.UDPv6.num_slabs
      2318 ±  9%      +4.2%       2415 ±  3%      +4.0%       2410 ±  9%  slabinfo.UNIX.active_objs
     76.88 ±  8%      +4.2%      80.12 ±  3%      +3.9%      79.88 ±  9%  slabinfo.UNIX.active_slabs
      2318 ±  9%      +4.2%       2415 ±  3%      +4.0%       2410 ±  9%  slabinfo.UNIX.num_objs
     76.88 ±  8%      +4.2%      80.12 ±  3%      +3.9%      79.88 ±  9%  slabinfo.UNIX.num_slabs
     22854 ±  2%      +3.8%      23718 ±  4%      +0.3%      22914 ±  2%  slabinfo.anon_vma.active_objs
    603.75 ±  2%      +3.4%     624.50 ±  4%      +0.4%     605.88 ±  3%  slabinfo.anon_vma.active_slabs
     23567 ±  2%      +3.4%      24372 ±  4%      +0.3%      23647 ±  3%  slabinfo.anon_vma.num_objs
    603.75 ±  2%      +3.4%     624.50 ±  4%      +0.4%     605.88 ±  3%  slabinfo.anon_vma.num_slabs
     28584 ±  2%      +2.0%      29155 ±  2%      +0.9%      28828 ±  2%  slabinfo.anon_vma_chain.active_objs
    468.12 ±  3%      +2.3%     478.75 ±  2%      +0.5%     470.50 ±  2%  slabinfo.anon_vma_chain.active_slabs
     29982 ±  3%      +2.3%      30676 ±  2%      +0.5%      30139 ±  2%  slabinfo.anon_vma_chain.num_objs
    468.12 ±  3%      +2.3%     478.75 ±  2%      +0.5%     470.50 ±  2%  slabinfo.anon_vma_chain.num_slabs
    115.00 ± 11%     -13.0%     100.00 ± 14%      -8.7%     105.00 ±  8%  slabinfo.bdev_cache.active_objs
      5.75 ± 11%     -13.0%       5.00 ± 14%      -8.7%       5.25 ±  8%  slabinfo.bdev_cache.active_slabs
    115.00 ± 11%     -13.0%     100.00 ± 14%      -8.7%     105.00 ±  8%  slabinfo.bdev_cache.num_objs
      5.75 ± 11%     -13.0%       5.00 ± 14%      -8.7%       5.25 ±  8%  slabinfo.bdev_cache.num_slabs
    951.12 ± 29%      -8.1%     873.75 ± 33%      -1.6%     935.88 ± 35%  slabinfo.bio-120.active_objs
     14.50 ± 28%      -6.9%      13.50 ± 32%      -0.9%      14.38 ± 33%  slabinfo.bio-120.active_slabs
    951.12 ± 29%      -8.1%     873.75 ± 33%      -1.6%     935.88 ± 35%  slabinfo.bio-120.num_objs
     14.50 ± 28%      -6.9%      13.50 ± 32%      -0.9%      14.38 ± 33%  slabinfo.bio-120.num_slabs
    669.75 ± 19%      -7.9%     616.88 ± 15%      +2.3%     685.25 ± 21%  slabinfo.bio-184.active_objs
     15.50 ± 21%      -7.3%      14.38 ± 16%      +4.0%      16.12 ± 20%  slabinfo.bio-184.active_slabs
    669.75 ± 19%      -7.9%     616.88 ± 15%      +2.3%     685.25 ± 21%  slabinfo.bio-184.num_objs
     15.50 ± 21%      -7.3%      14.38 ± 16%      +4.0%      16.12 ± 20%  slabinfo.bio-184.num_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.bio-216.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-216.active_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        slabinfo.bio-216.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.bio-216.num_slabs
    136.00 ± 15%      -5.9%     128.00            -5.9%     128.00        slabinfo.bio-248.active_objs
      2.12 ± 15%      -5.9%       2.00            -5.9%       2.00        slabinfo.bio-248.active_slabs
    136.00 ± 15%      -5.9%     128.00            -5.9%     128.00        slabinfo.bio-248.num_objs
      2.12 ± 15%      -5.9%       2.00            -5.9%       2.00        slabinfo.bio-248.num_slabs
    401.25 ± 58%     -15.6%     338.50 ± 68%     -14.5%     343.00 ± 63%  slabinfo.bio-344.active_objs
      9.12 ± 56%     -15.1%       7.75 ± 66%     -13.7%       7.88 ± 61%  slabinfo.bio-344.active_slabs
    401.25 ± 58%     -15.6%     338.50 ± 68%     -14.5%     343.00 ± 63%  slabinfo.bio-344.num_objs
      9.12 ± 56%     -15.1%       7.75 ± 66%     -13.7%       7.88 ± 61%  slabinfo.bio-344.num_slabs
     32.00            -6.2%      30.00 ± 17%      +0.0%      32.00        slabinfo.biovec-128.active_objs
      2.00            -6.2%       1.88 ± 17%      +0.0%       2.00        slabinfo.biovec-128.active_slabs
     32.00            -6.2%      30.00 ± 17%      +0.0%      32.00        slabinfo.biovec-128.num_objs
      2.00            -6.2%       1.88 ± 17%      +0.0%       2.00        slabinfo.biovec-128.num_slabs
    312.00 ± 16%      -2.6%     304.00 ± 18%      +2.6%     320.00 ± 18%  slabinfo.biovec-64.active_objs
      9.75 ± 16%      -2.6%       9.50 ± 18%      +2.6%      10.00 ± 18%  slabinfo.biovec-64.active_slabs
    312.00 ± 16%      -2.6%     304.00 ± 18%      +2.6%     320.00 ± 18%  slabinfo.biovec-64.num_objs
      9.75 ± 16%      -2.6%       9.50 ± 18%      +2.6%      10.00 ± 18%  slabinfo.biovec-64.num_slabs
    133.12 ± 34%      -8.9%     121.25 ± 39%      -9.9%     120.00 ± 34%  slabinfo.biovec-max.active_objs
     16.25 ± 32%      -8.5%      14.88 ± 37%      -9.2%      14.75 ± 33%  slabinfo.biovec-max.active_slabs
    133.12 ± 34%      -8.9%     121.25 ± 39%      -9.9%     120.00 ± 34%  slabinfo.biovec-max.num_objs
     16.25 ± 32%      -8.5%      14.88 ± 37%      -9.2%      14.75 ± 33%  slabinfo.biovec-max.num_slabs
    442.00 ±100%     -27.2%     321.88 ±129%     -26.2%     326.12 ±129%  slabinfo.btrfs_free_space.active_objs
     11.00 ±100%     -26.1%       8.12 ±129%     -26.1%       8.12 ±129%  slabinfo.btrfs_free_space.active_slabs
    442.00 ±100%     -27.2%     321.88 ±129%     -26.2%     326.12 ±129%  slabinfo.btrfs_free_space.num_objs
     11.00 ±100%     -26.1%       8.12 ±129%     -26.1%       8.12 ±129%  slabinfo.btrfs_free_space.num_slabs
    197.88 ± 55%      -5.4%     187.12 ± 55%      -2.5%     193.00 ± 65%  slabinfo.btrfs_inode.active_objs
      6.75 ± 52%      -3.7%       6.50 ± 53%      +0.0%       6.75 ± 64%  slabinfo.btrfs_inode.active_slabs
    197.88 ± 55%      -5.4%     187.12 ± 55%      -2.5%     193.00 ± 65%  slabinfo.btrfs_inode.num_objs
      6.75 ± 52%      -3.7%       6.50 ± 53%      +0.0%       6.75 ± 64%  slabinfo.btrfs_inode.num_slabs
     25.25 ±107%      +0.5%      25.38 ±129%     -19.3%      20.38 ±136%  slabinfo.btrfs_ordered_extent.active_objs
      0.25 ±173%     +50.0%       0.38 ±129%      +0.0%       0.25 ±173%  slabinfo.btrfs_ordered_extent.active_slabs
     25.25 ±107%      +0.5%      25.38 ±129%     -19.3%      20.38 ±136%  slabinfo.btrfs_ordered_extent.num_objs
      0.25 ±173%     +50.0%       0.38 ±129%      +0.0%       0.25 ±173%  slabinfo.btrfs_ordered_extent.num_slabs
    549.75 ± 15%      -7.3%     509.50 ± 11%      -2.2%     537.75 ±  8%  slabinfo.buffer_head.active_objs
     13.62 ± 17%      -6.4%      12.75 ± 12%      -3.7%      13.12 ±  9%  slabinfo.buffer_head.active_slabs
    549.75 ± 15%      -7.3%     509.50 ± 11%      -2.2%     537.75 ±  8%  slabinfo.buffer_head.num_objs
     13.62 ± 17%      -6.4%      12.75 ± 12%      -3.7%      13.12 ±  9%  slabinfo.buffer_head.num_slabs
      7846            +1.4%       7957 ±  2%      +2.2%       8015        slabinfo.cred_jar.active_objs
    186.62            +1.0%     188.50 ±  2%      +1.7%     189.88        slabinfo.cred_jar.active_slabs
      7875            +1.0%       7957 ±  2%      +1.8%       8015        slabinfo.cred_jar.num_objs
    186.62            +1.0%     188.50 ±  2%      +1.7%     189.88        slabinfo.cred_jar.num_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dax_cache.active_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        slabinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
    115027            +0.3%     115421            -0.2%     114755        slabinfo.dentry.active_objs
      2755            +0.3%       2762            -0.0%       2755        slabinfo.dentry.active_slabs
    115766            +0.3%     116055            -0.0%     115734        slabinfo.dentry.num_objs
      2755            +0.3%       2762            -0.0%       2755        slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.num_slabs
    507.12 ±  6%      +7.9%     547.25 ±  9%      -1.2%     501.00 ±  6%  slabinfo.dmaengine-unmap-16.active_objs
     11.62 ±  9%      +6.5%      12.38 ± 10%      +0.0%      11.62 ±  7%  slabinfo.dmaengine-unmap-16.active_slabs
    507.12 ±  6%      +7.9%     547.25 ±  9%      -1.2%     501.00 ±  6%  slabinfo.dmaengine-unmap-16.num_objs
     11.62 ±  9%      +6.5%      12.38 ± 10%      +0.0%      11.62 ±  7%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.num_slabs
     27595 ±  4%      -4.4%      26377 ±  6%      -3.2%      26720 ±  3%  slabinfo.ep_head.active_objs
    107.50 ±  4%      -4.3%     102.88 ±  6%      -2.9%     104.38 ±  3%  slabinfo.ep_head.active_slabs
     27595 ±  4%      -4.4%      26377 ±  6%      -3.2%      26720 ±  3%  slabinfo.ep_head.num_objs
    107.50 ±  4%      -4.3%     102.88 ±  6%      -2.9%     104.38 ±  3%  slabinfo.ep_head.num_slabs
    964.00 ±  7%      -2.6%     938.50 ± 10%      -0.7%     957.38 ±  4%  slabinfo.file_lock_cache.active_objs
     25.38 ±  7%      -1.5%      25.00 ± 11%      +0.0%      25.38 ±  4%  slabinfo.file_lock_cache.active_slabs
    964.00 ±  7%      -2.6%     938.50 ± 10%      -0.7%     957.38 ±  4%  slabinfo.file_lock_cache.num_objs
     25.38 ±  7%      -1.5%      25.00 ± 11%      +0.0%      25.38 ±  4%  slabinfo.file_lock_cache.num_slabs
      5780 ±  3%      +2.6%       5928            +1.4%       5863        slabinfo.files_cache.active_objs
    125.00 ±  3%      +2.5%     128.12            +1.4%     126.75        slabinfo.files_cache.active_slabs
      5780 ±  3%      +2.6%       5928            +1.4%       5863        slabinfo.files_cache.num_objs
    125.00 ±  3%      +2.5%     128.12            +1.4%     126.75        slabinfo.files_cache.num_slabs
     21199            -0.1%      21182 ±  2%      +0.2%      21246        slabinfo.filp.active_objs
    367.62            -0.3%     366.50            +0.2%     368.50 ±  2%  slabinfo.filp.active_slabs
     23561            -0.3%      23489            +0.2%      23617 ±  2%  slabinfo.filp.num_objs
    367.62            -0.3%     366.50            +0.2%     368.50 ±  2%  slabinfo.filp.num_slabs
      2475 ±  9%      +0.3%       2482 ±  8%      -4.1%       2373 ± 15%  slabinfo.fsnotify_mark_connector.active_objs
     18.88 ±  9%      +0.0%      18.88 ± 10%      -3.3%      18.25 ± 15%  slabinfo.fsnotify_mark_connector.active_slabs
      2475 ±  9%      +0.3%       2482 ±  8%      -4.1%       2373 ± 15%  slabinfo.fsnotify_mark_connector.num_objs
     18.88 ±  9%      +0.0%      18.88 ± 10%      -3.3%      18.25 ± 15%  slabinfo.fsnotify_mark_connector.num_slabs
     29920            -0.9%      29643            -0.7%      29696        slabinfo.ftrace_event_field.active_objs
    352.00            -0.9%     348.75            -0.7%     349.38        slabinfo.ftrace_event_field.active_slabs
     29920            -0.9%      29643            -0.7%      29696        slabinfo.ftrace_event_field.num_objs
    352.00            -0.9%     348.75            -0.7%     349.38        slabinfo.ftrace_event_field.num_slabs
    390.50 ± 71%     -19.3%     315.00 ± 83%     -12.9%     340.25 ± 86%  slabinfo.fuse_request.active_objs
      6.50 ± 69%     -15.4%       5.50 ± 82%      -9.6%       5.88 ± 85%  slabinfo.fuse_request.active_slabs
    390.50 ± 71%     -19.3%     315.00 ± 83%     -12.9%     340.25 ± 86%  slabinfo.fuse_request.num_objs
      6.50 ± 69%     -15.4%       5.50 ± 82%      -9.6%       5.88 ± 85%  slabinfo.fuse_request.num_slabs
     98.00            +6.2%     104.12 ± 15%      -6.2%      91.88 ± 17%  slabinfo.hugetlbfs_inode_cache.active_objs
      2.00            +6.2%       2.12 ± 15%      -6.2%       1.88 ± 17%  slabinfo.hugetlbfs_inode_cache.active_slabs
     98.00            +6.2%     104.12 ± 15%      -6.2%      91.88 ± 17%  slabinfo.hugetlbfs_inode_cache.num_objs
      2.00            +6.2%       2.12 ± 15%      -6.2%       1.88 ± 17%  slabinfo.hugetlbfs_inode_cache.num_slabs
     95695            -0.1%      95597            -0.1%      95562        slabinfo.inode_cache.active_objs
      1875            -0.1%       1874            -0.1%       1873        slabinfo.inode_cache.active_slabs
     95695            -0.1%      95605            -0.1%      95570        slabinfo.inode_cache.num_objs
      1875            -0.1%       1874            -0.1%       1873        slabinfo.inode_cache.num_slabs
    173.38 ± 20%     +15.8%     200.75 ± 15%      +5.3%     182.50 ± 20%  slabinfo.ip_fib_alias.active_objs
      2.38 ± 20%     +15.8%       2.75 ± 15%      +5.3%       2.50 ± 20%  slabinfo.ip_fib_alias.active_slabs
    173.38 ± 20%     +15.8%     200.75 ± 15%      +5.3%     182.50 ± 20%  slabinfo.ip_fib_alias.num_objs
      2.38 ± 20%     +15.8%       2.75 ± 15%      +5.3%       2.50 ± 20%  slabinfo.ip_fib_alias.num_slabs
    201.88 ± 20%     +15.8%     233.75 ± 15%      +5.3%     212.50 ± 20%  slabinfo.ip_fib_trie.active_objs
      2.38 ± 20%     +15.8%       2.75 ± 15%      +5.3%       2.50 ± 20%  slabinfo.ip_fib_trie.active_slabs
    201.88 ± 20%     +15.8%     233.75 ± 15%      +5.3%     212.50 ± 20%  slabinfo.ip_fib_trie.num_objs
      2.38 ± 20%     +15.8%       2.75 ± 15%      +5.3%       2.50 ± 20%  slabinfo.ip_fib_trie.num_slabs
    103609            -0.0%     103602            +0.0%     103617        slabinfo.kernfs_node_cache.active_objs
      1619            -0.0%       1618            +0.0%       1619        slabinfo.kernfs_node_cache.active_slabs
    103627            -0.0%     103602            +0.0%     103635        slabinfo.kernfs_node_cache.num_objs
      1619            -0.0%       1618            +0.0%       1619        slabinfo.kernfs_node_cache.num_slabs
      2784 ± 11%      -5.2%       2639 ±  9%      -1.0%       2755 ±  6%  slabinfo.khugepaged_mm_slot.active_objs
     76.62 ± 11%      -5.2%      72.62 ±  9%      -1.0%      75.88 ±  6%  slabinfo.khugepaged_mm_slot.active_slabs
      2784 ± 11%      -5.2%       2639 ±  9%      -1.0%       2755 ±  6%  slabinfo.khugepaged_mm_slot.num_objs
     76.62 ± 11%      -5.2%      72.62 ±  9%      -1.0%      75.88 ±  6%  slabinfo.khugepaged_mm_slot.num_slabs
     11944            +0.9%      12054            -0.1%      11927        slabinfo.kmalloc-128.active_objs
    190.75 ±  2%      +1.2%     193.12            +0.1%     191.00        slabinfo.kmalloc-128.active_slabs
     12242            +1.1%      12375            +0.0%      12242        slabinfo.kmalloc-128.num_objs
    190.75 ±  2%      +1.2%     193.12            +0.1%     191.00        slabinfo.kmalloc-128.num_slabs
     45692            +0.5%      45938            +1.0%      46146        slabinfo.kmalloc-16.active_objs
    180.62            -0.3%     180.12            +0.6%     181.62        slabinfo.kmalloc-16.active_slabs
     46240            -0.3%      46112            +0.6%      46507        slabinfo.kmalloc-16.num_objs
    180.62            -0.3%     180.12            +0.6%     181.62        slabinfo.kmalloc-16.num_slabs
      6572            +0.7%       6620            +0.6%       6615        slabinfo.kmalloc-192.active_objs
    157.62            +0.6%     158.50            +0.9%     159.00        slabinfo.kmalloc-192.active_slabs
      6655            +0.4%       6682            +0.7%       6703        slabinfo.kmalloc-192.num_objs
    157.62            +0.6%     158.50            +0.9%     159.00        slabinfo.kmalloc-192.num_slabs
      7225            -2.3%       7060            -1.7%       7101 ±  2%  slabinfo.kmalloc-1k.active_objs
    227.12            -2.0%     222.50            -1.6%     223.50 ±  2%  slabinfo.kmalloc-1k.active_slabs
      7280            -2.1%       7130            -1.6%       7163 ±  2%  slabinfo.kmalloc-1k.num_objs
    227.12            -2.0%     222.50            -1.6%     223.50 ±  2%  slabinfo.kmalloc-1k.num_slabs
     12052 ±  2%      -1.2%      11905 ±  2%      -0.3%      12012        slabinfo.kmalloc-256.active_objs
    196.12 ±  2%      -1.3%     193.62 ±  2%      -0.3%     195.50 ±  2%  slabinfo.kmalloc-256.active_slabs
     12559 ±  2%      -1.2%      12407 ±  2%      -0.1%      12543        slabinfo.kmalloc-256.num_objs
    196.12 ±  2%      -1.3%     193.62 ±  2%      -0.3%     195.50 ±  2%  slabinfo.kmalloc-256.num_slabs
      4855            +0.1%       4862            -0.1%       4849        slabinfo.kmalloc-2k.active_objs
    305.88            -0.2%     305.25            -0.2%     305.12        slabinfo.kmalloc-2k.active_slabs
      4897            -0.1%       4892            -0.2%       4888        slabinfo.kmalloc-2k.num_objs
    305.88            -0.2%     305.25            -0.2%     305.12        slabinfo.kmalloc-2k.num_slabs
     50368            +0.0%      50385            +0.2%      50455        slabinfo.kmalloc-32.active_objs
    397.00            -0.1%     396.62            -0.1%     396.75        slabinfo.kmalloc-32.active_slabs
     50916            -0.1%      50844            -0.2%      50839        slabinfo.kmalloc-32.num_objs
    397.00            -0.1%     396.62            -0.1%     396.75        slabinfo.kmalloc-32.num_slabs
      1896            -1.7%       1863            +0.3%       1902        slabinfo.kmalloc-4k.active_objs
    239.12            -2.0%     234.38            -0.2%     238.62        slabinfo.kmalloc-4k.active_slabs
      1914            -1.9%       1877            -0.1%       1912        slabinfo.kmalloc-4k.num_objs
    239.12            -2.0%     234.38            -0.2%     238.62        slabinfo.kmalloc-4k.num_slabs
     22012 ±  2%      +1.7%      22376            +0.9%      22209        slabinfo.kmalloc-512.active_objs
    353.75            +1.1%     357.75            +0.8%     356.62        slabinfo.kmalloc-512.active_slabs
     22664            +1.2%      22930            +0.9%      22862        slabinfo.kmalloc-512.num_objs
    353.75            +1.1%     357.75            +0.8%     356.62        slabinfo.kmalloc-512.num_slabs
     54007            +0.0%      54014            +0.1%      54081        slabinfo.kmalloc-64.active_objs
    845.12            +0.0%     845.25            +0.1%     845.88        slabinfo.kmalloc-64.active_slabs
     54134            +0.0%      54135            +0.1%      54178        slabinfo.kmalloc-64.num_objs
    845.12            +0.0%     845.25            +0.1%     845.88        slabinfo.kmalloc-64.num_slabs
     82020 ±  3%      -0.1%      81918 ±  2%      +1.4%      83150 ±  2%  slabinfo.kmalloc-8.active_objs
    172.12 ±  3%      +0.2%     172.50 ±  2%      +0.9%     173.62 ±  2%  slabinfo.kmalloc-8.active_slabs
     88319 ±  3%      +0.3%      88591 ±  2%      +1.0%      89233 ±  2%  slabinfo.kmalloc-8.num_objs
    172.12 ±  3%      +0.2%     172.50 ±  2%      +0.9%     173.62 ±  2%  slabinfo.kmalloc-8.num_slabs
      1317            +0.0%       1317            +0.2%       1319        slabinfo.kmalloc-8k.active_objs
    328.75            +0.0%     328.88            +0.2%     329.25        slabinfo.kmalloc-8k.active_slabs
      1318            +0.0%       1318            +0.1%       1319        slabinfo.kmalloc-8k.num_objs
    328.75            +0.0%     328.88            +0.2%     329.25        slabinfo.kmalloc-8k.num_slabs
     13551 ±  3%      -0.5%      13487 ±  4%      -2.6%      13204 ±  2%  slabinfo.kmalloc-96.active_objs
    333.12 ±  3%      +0.0%     333.25 ±  4%      -2.7%     324.12 ±  2%  slabinfo.kmalloc-96.active_slabs
     14012 ±  3%      -0.1%      13997 ±  4%      -2.8%      13619 ±  2%  slabinfo.kmalloc-96.num_objs
    333.12 ±  3%      +0.0%     333.25 ±  4%      -2.7%     324.12 ±  2%  slabinfo.kmalloc-96.num_slabs
      1160 ±  9%      +4.1%       1208 ±  9%      +2.1%       1184 ± 11%  slabinfo.kmalloc-cg-128.active_objs
     18.12 ±  9%      +4.1%      18.88 ±  9%      +2.1%      18.50 ± 11%  slabinfo.kmalloc-cg-128.active_slabs
      1160 ±  9%      +4.1%       1208 ±  9%      +2.1%       1184 ± 11%  slabinfo.kmalloc-cg-128.num_objs
     18.12 ±  9%      +4.1%      18.88 ±  9%      +2.1%      18.50 ± 11%  slabinfo.kmalloc-cg-128.num_slabs
      3840 ±  6%      +8.0%       4149 ± 11%      +0.0%       3842 ± 10%  slabinfo.kmalloc-cg-16.active_objs
     14.62 ±  6%      +7.7%      15.75 ± 11%      -0.9%      14.50 ± 10%  slabinfo.kmalloc-cg-16.active_slabs
      3840 ±  6%      +8.0%       4149 ± 11%      +0.0%       3842 ± 10%  slabinfo.kmalloc-cg-16.num_objs
     14.62 ±  6%      +7.7%      15.75 ± 11%      -0.9%      14.50 ± 10%  slabinfo.kmalloc-cg-16.num_slabs
      5025 ±  3%      -0.1%       5017 ±  3%      -0.7%       4990 ±  2%  slabinfo.kmalloc-cg-192.active_objs
    119.38 ±  3%      -0.5%     118.75 ±  3%      -0.8%     118.38 ±  2%  slabinfo.kmalloc-cg-192.active_slabs
      5025 ±  3%      -0.1%       5017 ±  3%      -0.7%       4990 ±  2%  slabinfo.kmalloc-cg-192.num_objs
    119.38 ±  3%      -0.5%     118.75 ±  3%      -0.8%     118.38 ±  2%  slabinfo.kmalloc-cg-192.num_slabs
      4027 ±  4%      +3.0%       4148 ±  3%      +1.9%       4105 ±  2%  slabinfo.kmalloc-cg-1k.active_objs
    125.62 ±  4%      +3.1%     129.50 ±  3%      +1.7%     127.75 ±  2%  slabinfo.kmalloc-cg-1k.active_slabs
      4027 ±  4%      +3.4%       4164 ±  3%      +1.9%       4105 ±  2%  slabinfo.kmalloc-cg-1k.num_objs
    125.62 ±  4%      +3.1%     129.50 ±  3%      +1.7%     127.75 ±  2%  slabinfo.kmalloc-cg-1k.num_slabs
    384.00 ± 14%      +8.3%     416.00 ±  7%      +6.2%     408.00 ± 15%  slabinfo.kmalloc-cg-256.active_objs
      6.00 ± 14%      +8.3%       6.50 ±  7%      +6.2%       6.38 ± 15%  slabinfo.kmalloc-cg-256.active_slabs
    384.00 ± 14%      +8.3%     416.00 ±  7%      +6.2%     408.00 ± 15%  slabinfo.kmalloc-cg-256.num_objs
      6.00 ± 14%      +8.3%       6.50 ±  7%      +6.2%       6.38 ± 15%  slabinfo.kmalloc-cg-256.num_slabs
    383.62 ±  9%     +11.5%     427.75 ±  7%      -1.1%     379.25 ± 11%  slabinfo.kmalloc-cg-2k.active_objs
     23.50 ± 10%     +12.2%      26.38 ±  7%      -0.5%      23.38 ± 12%  slabinfo.kmalloc-cg-2k.active_slabs
    383.62 ±  9%     +11.5%     427.75 ±  7%      -1.1%     379.25 ± 11%  slabinfo.kmalloc-cg-2k.num_objs
     23.50 ± 10%     +12.2%      26.38 ±  7%      -0.5%      23.38 ± 12%  slabinfo.kmalloc-cg-2k.num_slabs
     15521 ±  2%      -0.0%      15513            -0.7%      15411 ±  3%  slabinfo.kmalloc-cg-32.active_objs
    120.62 ±  2%      -0.1%     120.50            -0.7%     119.75 ±  3%  slabinfo.kmalloc-cg-32.active_slabs
     15521 ±  2%      -0.0%      15513            -0.7%      15411 ±  3%  slabinfo.kmalloc-cg-32.num_objs
    120.62 ±  2%      -0.1%     120.50            -0.7%     119.75 ±  3%  slabinfo.kmalloc-cg-32.num_slabs
      1039            -0.1%       1038            +0.0%       1039        slabinfo.kmalloc-cg-4k.active_objs
    129.88            -0.1%     129.75            +0.0%     129.88        slabinfo.kmalloc-cg-4k.active_slabs
      1039            -0.1%       1038            +0.0%       1039        slabinfo.kmalloc-cg-4k.num_objs
    129.88            -0.1%     129.75            +0.0%     129.88        slabinfo.kmalloc-cg-4k.num_slabs
      7960            +0.1%       7970            +0.3%       7982        slabinfo.kmalloc-cg-512.active_objs
    124.38            +0.1%     124.50            +0.1%     124.50        slabinfo.kmalloc-cg-512.active_slabs
      7960            +0.1%       7970            +0.3%       7982        slabinfo.kmalloc-cg-512.num_objs
    124.38            +0.1%     124.50            +0.1%     124.50        slabinfo.kmalloc-cg-512.num_slabs
      1295 ±  8%     +12.3%       1454 ± 11%      +5.2%       1362 ± 14%  slabinfo.kmalloc-cg-64.active_objs
     19.50 ±  8%     +13.5%      22.12 ± 12%      +5.1%      20.50 ± 15%  slabinfo.kmalloc-cg-64.active_slabs
      1295 ±  8%     +12.3%       1454 ± 11%      +5.2%       1362 ± 14%  slabinfo.kmalloc-cg-64.num_objs
     19.50 ±  8%     +13.5%      22.12 ± 12%      +5.1%      20.50 ± 15%  slabinfo.kmalloc-cg-64.num_slabs
     66047            +0.0%      66047            +0.0%      66047        slabinfo.kmalloc-cg-8.active_objs
    128.88            +0.0%     128.88            +0.0%     128.88        slabinfo.kmalloc-cg-8.active_slabs
     66047            +0.0%      66047            +0.0%      66047        slabinfo.kmalloc-cg-8.num_objs
    128.88            +0.0%     128.88            +0.0%     128.88        slabinfo.kmalloc-cg-8.num_slabs
     37.38 ±  8%      -3.0%      36.25 ± 11%      +0.3%      37.50 ±  9%  slabinfo.kmalloc-cg-8k.active_objs
      9.00 ±  7%      -4.2%       8.62 ± 11%      +1.4%       9.12 ± 11%  slabinfo.kmalloc-cg-8k.active_slabs
     37.38 ±  8%      -3.0%      36.25 ± 11%      +0.3%      37.50 ±  9%  slabinfo.kmalloc-cg-8k.num_objs
      9.00 ±  7%      -4.2%       8.62 ± 11%      +1.4%       9.12 ± 11%  slabinfo.kmalloc-cg-8k.num_slabs
    335.12 ±  8%      +3.1%     345.38 ±  5%      -3.2%     324.50 ±  5%  slabinfo.kmalloc-cg-96.active_objs
      7.12 ±  8%      +1.8%       7.25 ±  5%      -5.3%       6.75 ±  6%  slabinfo.kmalloc-cg-96.active_slabs
    335.12 ±  8%      +3.1%     345.38 ±  5%      -3.2%     324.50 ±  5%  slabinfo.kmalloc-cg-96.num_objs
      7.12 ±  8%      +1.8%       7.25 ±  5%      -5.3%       6.75 ±  6%  slabinfo.kmalloc-cg-96.num_slabs
    488.00 ±  9%      +0.0%     488.00 ±  9%      +4.9%     512.00 ±  6%  slabinfo.kmalloc-rcl-128.active_objs
      7.62 ±  9%      +0.0%       7.62 ±  9%      +4.9%       8.00 ±  6%  slabinfo.kmalloc-rcl-128.active_slabs
    488.00 ±  9%      +0.0%     488.00 ±  9%      +4.9%     512.00 ±  6%  slabinfo.kmalloc-rcl-128.num_objs
      7.62 ±  9%      +0.0%       7.62 ±  9%      +4.9%       8.00 ±  6%  slabinfo.kmalloc-rcl-128.num_slabs
    141.75 ± 14%     -11.1%     126.00 ± 16%      -3.7%     136.50 ± 13%  slabinfo.kmalloc-rcl-192.active_objs
      3.38 ± 14%     -11.1%       3.00 ± 16%      -3.7%       3.25 ± 13%  slabinfo.kmalloc-rcl-192.active_slabs
    141.75 ± 14%     -11.1%     126.00 ± 16%      -3.7%     136.50 ± 13%  slabinfo.kmalloc-rcl-192.num_objs
      3.38 ± 14%     -11.1%       3.00 ± 16%      -3.7%       3.25 ± 13%  slabinfo.kmalloc-rcl-192.num_slabs
      8385 ±  4%      +0.7%       8445 ±  5%      +3.9%       8712 ±  5%  slabinfo.kmalloc-rcl-64.active_objs
    131.38 ±  4%      +1.2%     133.00 ±  4%      +4.6%     137.38 ±  5%  slabinfo.kmalloc-rcl-64.active_slabs
      8437 ±  4%      +1.2%       8538 ±  4%      +4.6%       8823 ±  5%  slabinfo.kmalloc-rcl-64.num_objs
    131.38 ±  4%      +1.2%     133.00 ±  4%      +4.6%     137.38 ±  5%  slabinfo.kmalloc-rcl-64.num_slabs
      1321 ±  5%      -0.8%       1310 ±  7%      +3.3%       1365 ±  6%  slabinfo.kmalloc-rcl-96.active_objs
     31.25 ±  4%      -1.2%      30.88 ±  8%      +3.6%      32.38 ±  5%  slabinfo.kmalloc-rcl-96.active_slabs
      1321 ±  5%      -0.8%       1310 ±  7%      +3.3%       1365 ±  6%  slabinfo.kmalloc-rcl-96.num_objs
     31.25 ±  4%      -1.2%      30.88 ±  8%      +3.6%      32.38 ±  5%  slabinfo.kmalloc-rcl-96.num_slabs
      1400 ±  8%     +12.6%       1576 ±  4%      +8.0%       1512 ±  9%  slabinfo.kmem_cache.active_objs
     21.88 ±  8%     +12.6%      24.62 ±  4%      +8.0%      23.62 ±  9%  slabinfo.kmem_cache.active_slabs
      1400 ±  8%     +12.6%       1576 ±  4%      +8.0%       1512 ±  9%  slabinfo.kmem_cache.num_objs
     21.88 ±  8%     +12.6%      24.62 ±  4%      +8.0%      23.62 ±  9%  slabinfo.kmem_cache.num_slabs
      1945 ±  5%      +8.9%       2117 ±  3%      +5.3%       2049 ±  6%  slabinfo.kmem_cache_node.active_objs
     31.00 ±  5%      +9.3%      33.88 ±  2%      +5.2%      32.62 ±  6%  slabinfo.kmem_cache_node.active_slabs
      1984 ±  5%      +9.3%       2168 ±  2%      +5.2%       2088 ±  6%  slabinfo.kmem_cache_node.num_objs
     31.00 ±  5%      +9.3%      33.88 ±  2%      +5.2%      32.62 ±  6%  slabinfo.kmem_cache_node.num_slabs
     23077            -1.2%      22801            -0.3%      23013        slabinfo.lsm_file_cache.active_objs
    135.50 ±  2%      -1.0%     134.12            -0.3%     135.12        slabinfo.lsm_file_cache.active_slabs
     23077            -1.2%      22801            -0.3%      23013        slabinfo.lsm_file_cache.num_objs
    135.50 ±  2%      -1.0%     134.12            -0.3%     135.12        slabinfo.lsm_file_cache.num_slabs
     10523            +1.6%      10691            -0.5%      10473        slabinfo.maple_node.active_objs
    169.25            +0.6%     170.25            -0.8%     167.88        slabinfo.maple_node.active_slabs
     10832            +0.7%      10903            -0.8%      10749        slabinfo.maple_node.num_objs
    169.25            +0.6%     170.25            -0.8%     167.88        slabinfo.maple_node.num_slabs
      4085            -0.0%       4084            -0.5%       4063        slabinfo.mm_struct.active_objs
    135.50            +0.1%     135.62            -0.5%     134.88        slabinfo.mm_struct.active_slabs
      4085            -0.0%       4084            -0.5%       4063        slabinfo.mm_struct.num_objs
    135.50            +0.1%     135.62            -0.5%     134.88        slabinfo.mm_struct.num_slabs
      1370 ±  5%      +1.4%       1389 ±  7%      -3.3%       1326 ±  7%  slabinfo.mnt_cache.active_objs
     26.88 ±  5%      +1.4%      27.25 ±  7%      -3.3%      26.00 ±  7%  slabinfo.mnt_cache.active_slabs
      1370 ±  5%      +1.4%       1389 ±  7%      -3.3%       1326 ±  7%  slabinfo.mnt_cache.num_objs
     26.88 ±  5%      +1.4%      27.25 ±  7%      -3.3%      26.00 ±  7%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.num_slabs
      1024            +0.1%       1025            +0.1%       1025        slabinfo.names_cache.active_objs
    128.00            +0.1%     128.12            +0.1%     128.12        slabinfo.names_cache.active_slabs
      1024            +0.1%       1025            +0.1%       1025        slabinfo.names_cache.num_objs
    128.00            +0.1%     128.12            +0.1%     128.12        slabinfo.names_cache.num_slabs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.net_namespace.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.net_namespace.active_slabs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.net_namespace.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.net_namespace.num_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.nfs_commit_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_commit_data.active_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.nfs_commit_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_commit_data.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.nfs_read_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_read_data.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        slabinfo.nfs_read_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.nfs_read_data.num_slabs
    259.00 ± 15%      -2.7%     252.00 ± 11%      -5.4%     245.00 ± 11%  slabinfo.nsproxy.active_objs
      4.62 ± 15%      -2.7%       4.50 ± 11%      -5.4%       4.38 ± 11%  slabinfo.nsproxy.active_slabs
    259.00 ± 15%      -2.7%     252.00 ± 11%      -5.4%     245.00 ± 11%  slabinfo.nsproxy.num_objs
      4.62 ± 15%      -2.7%       4.50 ± 11%      -5.4%       4.38 ± 11%  slabinfo.nsproxy.num_slabs
    180.00            +0.0%     180.00            +0.0%     180.00        slabinfo.numa_policy.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.numa_policy.active_slabs
    180.00            +0.0%     180.00            +0.0%     180.00        slabinfo.numa_policy.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        slabinfo.numa_policy.num_slabs
     12192            +0.3%      12228            -0.4%      12141 ±  2%  slabinfo.pde_opener.active_objs
    118.75            +0.2%     119.00            -0.3%     118.38 ±  2%  slabinfo.pde_opener.active_slabs
     12192            +0.3%      12228            -0.4%      12141 ±  2%  slabinfo.pde_opener.num_objs
    118.75            +0.2%     119.00            -0.3%     118.38 ±  2%  slabinfo.pde_opener.num_slabs
      3328            +0.0%       3328            +0.0%       3328        slabinfo.perf_event.active_objs
    128.00            +0.0%     128.00            +0.0%     128.00        slabinfo.perf_event.active_slabs
      3328            +0.0%       3328            +0.0%       3328        slabinfo.perf_event.num_objs
    128.00            +0.0%     128.00            +0.0%     128.00        slabinfo.perf_event.num_slabs
      9558            +1.5%       9703            -0.5%       9512        slabinfo.pid.active_objs
    149.25            +1.1%     150.88            -0.3%     148.88        slabinfo.pid.active_slabs
      9573            +1.4%       9710            +0.0%       9575        slabinfo.pid.num_objs
    149.25            +1.1%     150.88            -0.3%     148.88        slabinfo.pid.num_slabs
      6242            -0.2%       6227            +0.6%       6277 ±  2%  slabinfo.proc_dir_entry.active_objs
    148.88            -0.3%     148.50            +0.4%     149.50 ±  2%  slabinfo.proc_dir_entry.active_slabs
      6252            -0.3%       6237            +0.4%       6279 ±  2%  slabinfo.proc_dir_entry.num_objs
    148.88            -0.3%     148.50            +0.4%     149.50 ±  2%  slabinfo.proc_dir_entry.num_slabs
     10683            -0.7%      10603            -0.5%      10632        slabinfo.proc_inode_cache.active_objs
    231.88            -0.5%     230.62            -0.3%     231.25        slabinfo.proc_inode_cache.active_slabs
     10694            -0.7%      10619            -0.3%      10665        slabinfo.proc_inode_cache.num_objs
    231.88            -0.5%     230.62            -0.3%     231.25        slabinfo.proc_inode_cache.num_slabs
     38293            +0.2%      38360            +0.2%      38378        slabinfo.radix_tree_node.active_objs
    685.00            +0.0%     685.25            +0.1%     685.88        slabinfo.radix_tree_node.active_slabs
     38387            +0.0%      38404            +0.1%      38443        slabinfo.radix_tree_node.num_objs
    685.00            +0.0%     685.25            +0.1%     685.88        slabinfo.radix_tree_node.num_slabs
    245.00 ± 12%      -1.8%     240.62 ±  8%      +0.0%     245.00 ± 15%  slabinfo.request_queue.active_objs
      7.00 ± 12%      -1.8%       6.88 ±  8%      +0.0%       7.00 ± 15%  slabinfo.request_queue.active_slabs
    245.00 ± 12%      -1.8%     240.62 ±  8%      +0.0%     245.00 ± 15%  slabinfo.request_queue.num_objs
      7.00 ± 12%      -1.8%       6.88 ±  8%      +0.0%       7.00 ± 15%  slabinfo.request_queue.num_slabs
      0.00       +6.2e+102%       6.25 ±264%    -100.0%       0.00        slabinfo.request_sock_TCP.active_objs
      0.00          -100.0%       0.00          -100.0%       0.00        slabinfo.request_sock_TCP.active_slabs
      0.00       +6.2e+102%       6.25 ±264%    -100.0%       0.00        slabinfo.request_sock_TCP.num_objs
      0.00          -100.0%       0.00          -100.0%       0.00        slabinfo.request_sock_TCP.num_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.active_slabs
     46.00            +0.0%      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.num_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        slabinfo.scsi_sense_cache.active_objs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.scsi_sense_cache.active_slabs
    448.00            +0.0%     448.00            +0.0%     448.00        slabinfo.scsi_sense_cache.num_objs
      7.00            +0.0%       7.00            +0.0%       7.00        slabinfo.scsi_sense_cache.num_slabs
      8704            +0.0%       8704            +0.0%       8704        slabinfo.seq_file.active_objs
    128.00            +0.0%     128.00            +0.0%     128.00        slabinfo.seq_file.active_slabs
      8704            +0.0%       8704            +0.0%       8704        slabinfo.seq_file.num_objs
    128.00            +0.0%     128.00            +0.0%     128.00        slabinfo.seq_file.num_slabs
      6087 ±  2%      -0.1%       6078 ±  2%      -0.4%       6061 ±  4%  slabinfo.shmem_inode_cache.active_objs
    144.62 ±  2%      -0.2%     144.38 ±  2%      -0.5%     143.88 ±  4%  slabinfo.shmem_inode_cache.active_slabs
      6087 ±  2%      -0.1%       6078 ±  2%      -0.4%       6061 ±  4%  slabinfo.shmem_inode_cache.num_objs
    144.62 ±  2%      -0.2%     144.38 ±  2%      -0.5%     143.88 ±  4%  slabinfo.shmem_inode_cache.num_slabs
      3039            +1.3%       3079            +0.2%       3045        slabinfo.sighand_cache.active_objs
    206.25            +0.8%     207.88            +0.2%     206.62        slabinfo.sighand_cache.active_slabs
      3097            +0.9%       3124            +0.2%       3104        slabinfo.sighand_cache.num_objs
    206.25            +0.8%     207.88            +0.2%     206.62        slabinfo.sighand_cache.num_slabs
      5120            +1.6%       5201            +0.3%       5136 ±  2%  slabinfo.signal_cache.active_objs
    185.75            +1.3%     188.25            +1.1%     187.88 ±  2%  slabinfo.signal_cache.active_slabs
      5221            +1.3%       5290            +1.2%       5283 ±  2%  slabinfo.signal_cache.num_objs
    185.75            +1.3%     188.25            +1.1%     187.88 ±  2%  slabinfo.signal_cache.num_slabs
      7074            +1.1%       7154 ±  2%      +0.5%       7112        slabinfo.sigqueue.active_objs
    138.50            +0.7%     139.50 ±  2%      +0.2%     138.75        slabinfo.sigqueue.active_slabs
      7098            +0.8%       7155 ±  2%      +0.3%       7119        slabinfo.sigqueue.num_objs
    138.50            +0.7%     139.50 ±  2%      +0.2%     138.75        slabinfo.sigqueue.num_slabs
    128.75           +18.3%     152.25 ± 40%      +0.1%     128.88        slabinfo.skbuff_fclone_cache.active_objs
      2.00           +12.5%       2.25 ± 29%      +0.0%       2.00        slabinfo.skbuff_fclone_cache.active_slabs
    128.75           +18.3%     152.25 ± 40%      +0.1%     128.88        slabinfo.skbuff_fclone_cache.num_objs
      2.00           +12.5%       2.25 ± 29%      +0.0%       2.00        slabinfo.skbuff_fclone_cache.num_slabs
      9336 ±  2%      -0.6%       9279 ±  2%      +0.9%       9415 ±  2%  slabinfo.skbuff_head_cache.active_objs
    145.88 ±  2%      -0.5%     145.12 ±  2%      +0.9%     147.12 ±  2%  slabinfo.skbuff_head_cache.active_slabs
      9336 ±  2%      -0.3%       9311 ±  2%      +0.9%       9416 ±  2%  slabinfo.skbuff_head_cache.num_objs
    145.88 ±  2%      -0.5%     145.12 ±  2%      +0.9%     147.12 ±  2%  slabinfo.skbuff_head_cache.num_slabs
      4000 ±  6%      +2.7%       4109            +1.0%       4038 ±  6%  slabinfo.sock_inode_cache.active_objs
    102.25 ±  6%      +2.4%     104.75            +0.7%     103.00 ±  6%  slabinfo.sock_inode_cache.active_slabs
      4000 ±  6%      +2.7%       4109            +1.0%       4038 ±  6%  slabinfo.sock_inode_cache.num_objs
    102.25 ±  6%      +2.4%     104.75            +0.7%     103.00 ±  6%  slabinfo.sock_inode_cache.num_slabs
      1472 ±  9%      +5.9%       1559 ±  5%      -1.0%       1457 ±  6%  slabinfo.task_group.active_objs
     28.38 ± 10%      +5.7%      30.00 ±  6%      -1.3%      28.00 ±  6%  slabinfo.task_group.active_slabs
      1472 ±  9%      +5.9%       1559 ±  5%      -1.0%       1457 ±  6%  slabinfo.task_group.num_objs
     28.38 ± 10%      +5.7%      30.00 ±  6%      -1.3%      28.00 ±  6%  slabinfo.task_group.num_slabs
      2172            +0.8%       2190            -0.8%       2154        slabinfo.task_struct.active_objs
      2178            +0.9%       2197            -0.9%       2159        slabinfo.task_struct.active_slabs
      2178            +0.9%       2197            -0.9%       2159        slabinfo.task_struct.num_objs
      2178            +0.9%       2197            -0.9%       2159        slabinfo.task_struct.num_slabs
    223.38 ±  7%      +2.1%     228.12 ±  5%      +2.1%     228.12 ±  5%  slabinfo.taskstats.active_objs
      4.88 ±  6%      +0.0%       4.88 ±  6%      +0.0%       4.88 ±  6%  slabinfo.taskstats.active_slabs
    223.38 ±  7%      +2.1%     228.12 ±  5%      +2.1%     228.12 ±  5%  slabinfo.taskstats.num_objs
      4.88 ±  6%      +0.0%       4.88 ±  6%      +0.0%       4.88 ±  6%  slabinfo.taskstats.num_slabs
      2723 ±  2%      +0.4%       2734 ±  2%      -1.7%       2677        slabinfo.trace_event_file.active_objs
     59.00 ±  2%      +0.2%      59.12 ±  2%      -1.7%      58.00        slabinfo.trace_event_file.active_slabs
      2723 ±  2%      +0.4%       2734 ±  2%      -1.7%       2677        slabinfo.trace_event_file.num_objs
     59.00 ±  2%      +0.2%      59.12 ±  2%      -1.7%      58.00        slabinfo.trace_event_file.num_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_slabs
     74.00            +0.0%      74.00            +0.0%      74.00        slabinfo.uts_namespace.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.uts_namespace.active_slabs
     74.00            +0.0%      74.00            +0.0%      74.00        slabinfo.uts_namespace.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        slabinfo.uts_namespace.num_slabs
     29846 ±  3%      +0.2%      29908 ±  3%      -1.0%      29545 ±  2%  slabinfo.vm_area_struct.active_objs
    549.50 ±  4%      +0.6%     552.75 ±  3%      -1.2%     542.75 ±  2%  slabinfo.vm_area_struct.active_slabs
     30794 ±  4%      +0.6%      30976 ±  3%      -1.2%      30423 ±  2%  slabinfo.vm_area_struct.num_objs
    549.50 ±  4%      +0.6%     552.75 ±  3%      -1.2%     542.75 ±  2%  slabinfo.vm_area_struct.num_slabs
     23549            +0.6%      23683            +1.1%      23820        slabinfo.vmap_area.active_objs
    374.12            +0.6%     376.25            +1.0%     377.88        slabinfo.vmap_area.active_slabs
     23980            +0.6%      24119            +1.0%      24219        slabinfo.vmap_area.num_objs
    374.12            +0.6%     376.25            +1.0%     377.88        slabinfo.vmap_area.num_slabs
> 
> Thanks,
> Amir.
> 
> 
> > in testcase: unixbench
> > on test machine: 128 threads 4 sockets Intel(R) Xeon(R) Gold 6338 CPU @
> > 2.00GHz (Ice Lake) with 256G memory
> > with following parameters:
> >
> >         runtime: 300s
> >         nr_task: 1
> >         test: fstime
> >         cpufreq_governor: performance
> >
> > test-description: UnixBench is the original BYTE UNIX benchmark suite aims
> > to test performance of Unix-like system.
> > test-url: https://github.com/kdlucas/byte-unixbench
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Link:
> > https://lore.kernel.org/oe-lkp/202212032038.a5aa4002-oliver.sang@intel.com
> >
> >
> > Details are as below:
> >
> > -------------------------------------------------------------------------------------------------->
> >
> >
> > To reproduce:
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         sudo bin/lkp install job.yaml           # job file is attached in
> > this email
> >         bin/lkp split-job --compatible job.yaml # generate the yaml file
> > for lkp run
> >         sudo bin/lkp run generated-yaml-file
> >
> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >
> >
> > =========================================================================================
> >
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >
> > gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/fstime/unixbench
> >
> > commit:
> >   ebdcc71d4f ("vfs: implement 'vfs write barriers'")
> >   95586ea7c5 ("vfs: prepare for pre-modify permission events on write")
> >
> > ebdcc71d4f8d163a 95586ea7c597ef4e9712ceb101d
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       3500            -4.9%       3326        unixbench.score
> >  6.655e+08            -5.0%  6.324e+08        unixbench.workload
> >     768.83 ± 45%    +290.7%       3004 ± 57%  numa-meminfo.node1.Active
> >     704.83 ± 47%    +291.6%       2760 ± 65%
> > numa-meminfo.node1.Active(anon)
> >       1048 ± 20%    +209.6%       3247 ± 50%  numa-meminfo.node1.Shmem
> >     175.83 ± 48%    +292.2%     689.67 ± 65%
> > numa-vmstat.node1.nr_active_anon
> >     261.83 ± 20%    +209.9%     811.33 ± 50%  numa-vmstat.node1.nr_shmem
> >     175.83 ± 48%    +292.2%     689.67 ± 65%
> > numa-vmstat.node1.nr_zone_active_anon
> >  9.504e+08            -3.2%  9.204e+08
> > perf-stat.i.branch-instructions
> >   39929153            -3.7%   38433092        perf-stat.i.cache-references
> >   1.36e+09            -2.6%  1.325e+09        perf-stat.i.dTLB-loads
> >  7.458e+08            -2.7%  7.254e+08        perf-stat.i.dTLB-stores
> >  4.588e+09            -3.2%  4.443e+09        perf-stat.i.instructions
> >     312.11            -3.8%     300.38        perf-stat.i.metric.K/sec
> >      23.87            -2.8%      23.21        perf-stat.i.metric.M/sec
> >       3316            +1.9%       3378        perf-stat.overall.path-length
> >  9.487e+08            -3.2%  9.187e+08
> > perf-stat.ps.branch-instructions
> >   39859575            -3.8%   38362352        perf-stat.ps.cache-references
> >  1.357e+09            -2.6%  1.322e+09        perf-stat.ps.dTLB-loads
> >  7.444e+08            -2.7%   7.24e+08        perf-stat.ps.dTLB-stores
> >   4.58e+09            -3.2%  4.434e+09        perf-stat.ps.instructions
> >  2.207e+12            -3.2%  2.136e+12        perf-stat.total.instructions
> >       0.14 ± 15%      -0.1        0.09 ± 24%
> > perf-profile.children.cycles-pp.w_test
> >       0.14 ± 10%      -0.0        0.10 ± 21%
> > perf-profile.children.cycles-pp.r_test
> >       0.18 ± 18%      -0.0        0.14 ± 23%
> > perf-profile.children.cycles-pp.syscall_return_via_sysret
> >       0.14 ±  6%      -0.0        0.11 ± 18%
> > perf-profile.children.cycles-pp.__x64_sys_execve
> >       0.14 ±  7%      -0.0        0.11 ± 18%
> > perf-profile.children.cycles-pp.do_execveat_common
> >       0.08 ± 16%      -0.0        0.04 ± 45%
> > perf-profile.children.cycles-pp.do_fault
> >       0.09 ± 22%      +0.0        0.12 ± 12%
> > perf-profile.children.cycles-pp.sched_clock
> >       0.13 ± 13%      +0.0        0.17 ± 11%
> > perf-profile.children.cycles-pp.enqueue_hrtimer
> >       0.00            +0.2        0.17 ± 34%
> > perf-profile.children.cycles-pp.__srcu_read_unlock
> >       0.00            +0.2        0.18 ± 17%
> > perf-profile.children.cycles-pp.__srcu_read_lock
> >       0.00            +0.6        0.60 ± 22%
> > perf-profile.children.cycles-pp.file_start_write_area
> >       0.29 ± 11%      -0.1        0.17 ± 44%
> > perf-profile.self.cycles-pp.rebalance_domains
> >       0.13 ± 17%      -0.1        0.07 ± 48%
> > perf-profile.self.cycles-pp.w_test
> >       0.18 ± 18%      -0.0        0.14 ± 23%
> > perf-profile.self.cycles-pp.syscall_return_via_sysret
> >       0.13 ± 15%      -0.0        0.09 ± 25%
> > perf-profile.self.cycles-pp.r_test
> >       0.00            +0.1        0.14 ± 30%
> > perf-profile.self.cycles-pp.file_start_write_area
> >       0.00            +0.2        0.16 ± 33%
> > perf-profile.self.cycles-pp.__srcu_read_unlock
> >       0.00            +0.2        0.17 ± 19%
> > perf-profile.self.cycles-pp.__srcu_read_lock
> >
> >
> >
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are
> > provided
> > for informational purposes only. Any difference in system hardware or
> > software
> > design or configuration may affect actual performance.
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> >
> >
> >
