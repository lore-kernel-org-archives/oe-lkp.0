Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171391CFAC
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6d5bTho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702994613; x=1734530613;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VRqaHmEfEJFn9NT24X/jK2Xey0CtebgtYYcAAWJc8mY=;
  b=I6d5bTho6EQTYq0YzVd+EMUFJwsfnGL3gUEaY2Wjtr21bAET22ugqTkp
   qdNww37ef0Zmfu+O5Um0VfRTowgr1LWW9vakzOQJZ5iKbVmOCzHRfqhU/
   K1YXj9/VEDbtKWLnMYnMwMH3qsqewhKouN/vkNHYR4o1eNRKyYTnW6zTF
   nGNnBjwS6w2tSDNzPthcNRWgUCr2T+2eoKaY4GhI/IDjSIsBulmWNzEBG
   3drvq15goJTL/RQ0Qt/y18ogW10aMjUJaJ76cXdNvRwnj6TZsYUk1+a3D
   6kcs582u8yzZobMeeWhcYsxhVl65eJT57kMG28Yx77kh9j24DlRKoGQkB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380645462"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="380645462"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="841895410"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="841895410"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2023 06:03:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 06:03:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 06:03:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 06:03:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 06:03:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCbiBz9Cp40BIZR8HVJtK0+MRYk8HQ7bo7KDBbQMdIL/1m31OoFi30DGzNDO5R5pUrm+ZOuV/ffvh+alAepoUq0r5boqiiULKWHDGCf7CQytUoKKITeND1LfWCKpGoU4vUBCCGWlIYZpddPJ+bxbmvzkeELqNORyOtq8yIeG172cQeiQEU96vBjkK841QyelRYcqUrGnuTfKeVMi/HPayKhstx+dQ6aWeA9biEvklRsAsV9WfkNGdB9pTz8af6o7HAt4kcOZVF51LN1dkpkW0fmbCnocho5ZIBKDz6qTPl20j6d5XzkiTG0penpOOdcti6jXp3oldYShavJFxZmZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIZNdNuLalmfOK8aMUT+TG2sw8H4g5+q06tIVb1Q13k=;
 b=NQOR+Rve7sU62MVggn+rlc0yFUj1VyvFeakIvCMcv5wtpFMptAlHuOrGjgCXIomBdKgVscpvFurx0dbSLXb6qdsdoVFSO80Ki0dqG9BVx9uL9PLPGoQ19b2cNH/1pBDVusw4rgPK8e5SzY75JuPW3H0rsgKOxg/Ivj07faSZckwdgJ2p7+/1M8CkSg5DLq9Rj9YYyUxSI7jYb7CfYvecnzCLuvaQYFNkKgrtV3S+ZBP70eojXZZucnQnJagw0M9ZQ51S17mU13YGXxTjPvaXDtVtltdH8POa4RsATH93y+2UbT2R1Y+ztAXLJ3IrkdSBpuRn30rFmiiFC1at4auNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 14:03:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 14:03:23 +0000
Date: Tue, 19 Dec 2023 22:03:16 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 753d63fa0e:
 phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s -95.7% regression
Message-ID: <ZYGipFO2W4VCEjxK@xsang-OptiPlex-9020>
References: <202312181550.3fa030a7-oliver.sang@intel.com>
 <CAOQ4uxizaaC1RjBYTqPkPJcXj66+-8UVqQR9ArGp40+0FZR8Mg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxizaaC1RjBYTqPkPJcXj66+-8UVqQR9ArGp40+0FZR8Mg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ad6939-4c9a-4933-6c25-08dc009b4351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emvXd7so8VbYxa01SgmCBS614FJP6xsOjXwNsnYg5crdY2yX0K0e7hVC7qsEIavyDH6mm85kkkwHnexrYtjzeeDcEeZcWI/or3PeFRC2GTDOFXJk0H1CvyVXAHAdcedXrJh21yJnuP68IEM1x9g/gwNX+428j/RIEnh2cRa58FlHHqo209ySgNNL3p3J23LeUpx3qzK7FNw1hbmcoWFvDGu0WVYlfrDVtLQqRxchGcs5S4yyUTBXcKvfnROQQLt1iaW5yMcLVXg42yGopuINCNYpyzqsWZ14U/gQ03h64f3Eb+Z8azScH+vQmS3YoIYyQY3TLOLziRZkR6oy6hkMIQRUhSHm0xcBJgxzd1QxZZObWpo/smg2ReJ7p1KG/2cyZMwyn8nszdKNjDA44YmzWqq2r0lIIUl/EbqGqAStIUpQzZHmozfcJ2/KxjU6b4CIfxqwdQdcb1lmZo+oTaSWoE+l4wRTNquZmQheAFajYfdwWaZnP8AV+C/FP1dKMB19Qiv222z7vIc1/KHSYVOqGv40El9mjW4/kdvYmsKo/Es=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(30864003)(8676002)(4326008)(5660300002)(2906002)(44832011)(19627235002)(6666004)(6506007)(9686003)(6512007)(53546011)(478600001)(66476007)(66556008)(66946007)(316002)(6916009)(966005)(33716001)(41300700001)(6486002)(38100700002)(86362001)(82960400001)(107886003)(83380400001)(26005)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9RNnhkNWxRZTU2RHJtNnF6WFEwcG0yT01lNlZPbEUzWFhqaXRYUS9LQmVI?=
 =?utf-8?B?OTIxTERVQVR0Q1BVZmhWSVBtQUFkU3RhRXpza3o1Mm9NS2RMdHpOVmFKSEVU?=
 =?utf-8?B?YkZaSUQyRzl1QnMvSUdWbjY4VWpSMlA3TUlVU25pRncwVzBrWmZlRU53elYr?=
 =?utf-8?B?emREc0ZZdGRvVEwwRVNtaEk0OHZsUGQwVnFWcjVXUEtWMEc4V3pQc2pYazVo?=
 =?utf-8?B?WWxLaytoalBYUmdhQVZva25oT2lic0RPZGFReVlMVEtqclM3ZlVET0pJRk9j?=
 =?utf-8?B?ai92MERvYjRVL0Y3ZVI4NzBBcnlTeWhqVDZQd051NUY5QVJ5clVST0dQOU5U?=
 =?utf-8?B?cyt6U29SZytJZFVrTTZOUzYrbU9rSlV2UEo2TDNRYlBVaXo4c3gyQjN1Q1Zs?=
 =?utf-8?B?YTl4SDNzRzEwNmpVV0dXWEJhd2lpczE4T0NwdERlVHROWWRWVlJEeDN0MnR0?=
 =?utf-8?B?OXU2ZUNDUVpVV3ZpQkNHL3k1QXV0RlhXZG1ST3A3VmlqVStpSWhSZkQyNjUr?=
 =?utf-8?B?KzgwdHhUaEpiOG1Gak1PSVAyUVIyZXFHTlZZMExpTnRoVjFFMXFFZEZQZkw1?=
 =?utf-8?B?dk1IdFlKTUplZzNmdDAzRzBDYlBSbW0vbTIrUForc1R1ZUp3QWNGeVlmOWZK?=
 =?utf-8?B?ViswUmp6bjN6TlZhVE1uYWt1Uk5xSUVwcmR5Vmg4d2k5MEl2cnVsVDh4Snov?=
 =?utf-8?B?VDhiYWlwTU13Nk0zY05Iak9RelJMekRUSjY2Y2cxc3d0akpaYzJ0a1ovN25a?=
 =?utf-8?B?T2NDbThKNUZwSWxZUzhHMER1L0VsakFRRFNRVVBKdWNUN1FhSkwrTW1Xd3dF?=
 =?utf-8?B?THF5MkptQjJFb1BXMXdyTXZYNDN2TU4ycll3Y2hvZ0VEMkoxQ1huQlJMdlRm?=
 =?utf-8?B?UnVsalRQRjVleURkVGJ2Nm1lWE5hd3NkUXNrTlAzMnNQUUVMT2Z1a081RVJ6?=
 =?utf-8?B?dDFxZWYwR05tZGs3NEN1dUp4WEJjOGpqY0EwNUF5dlF5dW5xbFNNc2F4ZUht?=
 =?utf-8?B?UkJpd3ZHS1hURUcvYm1ZdEVHbjZOZnpreE1FWDJMYi9tNnVNMEQ3bjBKMDlJ?=
 =?utf-8?B?NVhzcFRlOE9kajlhZXlUN3UwVEVYMWNwYXZIc2R6R1RSSWQrSzBQbGpsS1c2?=
 =?utf-8?B?RjltOVNldkFkRS9VazJoeEZ2Nmh6Y3d0OFN3c2VOQkpkSGkzN0R6NkFxUkxl?=
 =?utf-8?B?NzZYU0RDclBScG1mYWo3NDJXbjJJWWlkV0p2TlhyT3JGR3ZydHlsVGxMS0xr?=
 =?utf-8?B?Uk5WUC82WCtSbnlPOGJ5d3I2a2xvRDEycGhRaXM4bTJ4cnU5ZmtOUU5MM25o?=
 =?utf-8?B?T0t6LzhqTzdyYjJsS2pJQ3BPNkN1OHJJVGNXVjJVZkhwWVhvaHYyV0hQaHU4?=
 =?utf-8?B?enpYeTUrTEFFTGMydy81MENkcUgxamlmMTdBMkRRMTM2Mkx6cVJsenlrUTdr?=
 =?utf-8?B?ZGFIUy9BckZqa3VJY0ZMWE1yVDYwZmtUSHhMOWt1YkdLbEpQTlk3Y2RQZncv?=
 =?utf-8?B?QUU3bExQN1RTcUZ1bjBBQ0FFYmRpMGxMZE1oR1h1VDJjSVB2VnViaHJFUGlk?=
 =?utf-8?B?QVdUVHRrZHJRY3p6TWNsOExQQUZ5cGpFb3ZMay82T2U4dnZrcjc5UVBYaG5B?=
 =?utf-8?B?TUdiTXBwSXVpTjJVSUh2aUlLTEw4cktCUlJsVDNYOVJsTVZNMGN1M0xnNFFp?=
 =?utf-8?B?M2JrVWpBNEdMdTNMekQ3WjQzVDFDTDlOZ3hyU1Avckd2TG5kYjBqdDNJekdS?=
 =?utf-8?B?SU9iZGgyWWZsZ1d4V0hyVXFLQWlVcjFVMGE5SzBqOXRuaUVjL0hhVnJvd01S?=
 =?utf-8?B?cTNQR3dLVlFyWVBNNTV3S0RqYzQrZDA3YmtBZmpEMnhMUDJqNlI4VGkydVhs?=
 =?utf-8?B?YldQeC9PeFJXUnM5bjVnQTVKWmMzcU1FYUJyVXNKK0hVSytzY1V2N2tSTTla?=
 =?utf-8?B?ejhsWnY0ZnVGay9mQzl2bTlFNHc3dGRTSHI5Z2wzT1E1cEZsck44NTk4YTZS?=
 =?utf-8?B?N3JIcnVITmVMOXZiaFIzbGdaVUtuREFvT0I5MzJGRElYQnhpdVVvbk9oajNS?=
 =?utf-8?B?UkdXK1dEWkJyUVFTYk5Maml2bVBTV0JxUzBqVG1wK3BOSHNzVVR6WnRaQi9R?=
 =?utf-8?B?c3dDVHRib2Q0VHVUOEt4NTVpZ1c2WFB0Wm5EdGJDbENobTh5anMvVXh5VWtG?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ad6939-4c9a-4933-6c25-08dc009b4351
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 14:03:23.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv+xA9Ch/dZkQ+Z4SCpD/uiWQFo/6qUa/lgXf2b3OEy8Is12rEjtbn6R/CHRoMaTZumVe49o3XSpISUe5Z/4pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
X-OriginatorOrg: intel.com

hi, Amir,

On Mon, Dec 18, 2023 at 01:09:40PM +0200, Amir Goldstein wrote:
> On Mon, Dec 18, 2023 at 10:17 AM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -95.7% regression of phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s on:
> >
> >
> > commit: 753d63fa0e79bb7ad14f0351b800f856b5364ec3 ("fs: add srcu variants for mnt_{want,drop}_write() helpers")
> > https://github.com/amir73il/linux sb_write_barrier
> 
> This commit had a bug in overlayfs.
> Does the test setup use overlayfs?
> Pushed fix to branch sb_write_barrier.
> Can you please re-test this branch:
> 
> * c89fa4b25ff7 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
> * 0fed804d8eeb - fanotify: activate sb write barriers for pre-modify
> event watchers
> * e464fb4d26e7 - fs: hold s_write_srcu for pre-modify permission
> events on aio write
> * 5dc0c9b3e65b - fs: hold s_write_srcu for pre-modify permission events on write
> * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 69e1ebcf925c - fs: implement 'vfs write barriers'

seems you split previous 753d63fa0e to:
> * 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() helpers
> * 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers

our test confirmed the regression is caused by 0651230c4b05


=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/1MB/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

69e1ebcf925c2ec5 03da7318eb21a7d0f9ef4b6674e 0651230c4b0580c3ec44fd9934c
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     28.12 ± 16%     -13.8%      24.25 ± 17%     -52.0%      13.50 ± 30%  perf-c2c.DRAM.local
     38.70            -0.6%      38.48           -32.0%      26.33 ±  3%  boot-time.boot
      3223            -0.7%       3201           -36.4%       2051 ±  3%  boot-time.idle
 2.838e+09 ±  2%      +0.7%  2.858e+09 ±  2%    +296.4%  1.125e+10        cpuidle..time
   3000010 ±  2%      +0.4%    3011347 ±  2%    +294.7%   11841247        cpuidle..usage
     70.76            +0.3%      70.95          +111.9%     149.96        uptime.boot
      6191            +0.3%       6208          +117.0%      13436        uptime.idle
      0.13 ± 45%      +0.0        0.15 ± 53%      +0.7        0.88        mpstat.cpu.all.iowait%
      0.12 ±  3%      +0.0        0.12 ±  2%      +0.0        0.14 ±  4%  mpstat.cpu.all.soft%
      0.36 ±  2%      -0.0        0.36            -0.2        0.15        mpstat.cpu.all.sys%
      0.52            -0.0        0.50 ±  3%      -0.3        0.21 ±  2%  mpstat.cpu.all.usr%
   1034328 ± 12%     -23.1%     795621 ± 22%     -65.4%     357690 ± 51%  numa-meminfo.node0.Inactive(anon)
     85419 ± 11%     -25.6%      63589 ± 24%     -45.7%      46385 ± 50%  numa-meminfo.node0.Mapped
    813268 ± 16%     -25.8%     603092 ± 33%     -85.5%     118301 ±164%  numa-meminfo.node0.Shmem
      4.44 ±264%     -14.0%       3.82 ±264%  +6.1e+06%     270910 ±128%  numa-meminfo.node1.Dirty
      3189 ±  9%      +2.3%       3263 ± 10%     -62.4%       1200 ±  8%  vmstat.io.bi
      9.60 ±263%     +88.7%      18.12 ±173%  +1.1e+06%     102641        vmstat.io.bo
      0.45 ± 11%      +1.6%       0.46 ± 24%    +101.3%       0.90 ±  7%  vmstat.procs.b
      1.30 ± 12%      -5.4%       1.23 ±  4%     -66.3%       0.44 ±  6%  vmstat.procs.r
      2557 ±  2%      +1.0%       2582 ±  2%     -21.8%       1999 ±  6%  vmstat.system.cs
     95127            -0.4%      94794            +3.1%      98117        vmstat.system.in
      3061            -0.6%       3042           -95.7%     131.48        phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s
     28.79 ±  2%      +0.9%      29.04 ±  2%    +316.5%     119.91        phoronix-test-suite.time.elapsed_time
     28.79 ±  2%      +0.9%      29.04 ±  2%    +316.5%     119.91        phoronix-test-suite.time.elapsed_time.max
    173864 ±  6%      +0.0%     173896 ±  6%     +57.7%     274250 ±  4%  phoronix-test-suite.time.file_system_inputs
    480.00 ±264%     +85.8%     892.00 ±173%  +5.3e+06%   25253112        phoronix-test-suite.time.file_system_outputs
     27.12 ±  2%      -0.9%      26.88 ±  2%     -66.8%       9.00        phoronix-test-suite.time.percent_of_cpu_this_job_got
      2758            +0.4%       2768          +394.6%      13643 ± 55%  phoronix-test-suite.time.voluntary_context_switches
     28.79 ±  2%      +0.9%      29.04 ±  2%    +316.5%     119.91        time.elapsed_time
     28.79 ±  2%      +0.9%      29.04 ±  2%    +316.5%     119.91        time.elapsed_time.max
    173864 ±  6%      +0.0%     173896 ±  6%     +57.7%     274250 ±  4%  time.file_system_inputs
    480.00 ±264%     +85.8%     892.00 ±173%  +5.3e+06%   25253112        time.file_system_outputs
    168.38 ±  9%      +9.7%     184.62 ± 25%     +28.4%     216.25 ± 11%  time.involuntary_context_switches
     35.50 ± 26%      +0.0%      35.50 ± 26%    +135.2%      83.50 ± 15%  time.major_page_faults
     27.12 ±  2%      -0.9%      26.88 ±  2%     -66.8%       9.00        time.percent_of_cpu_this_job_got
      6.27            +0.7%       6.31           +61.8%      10.14        time.system_time
      2758            +0.4%       2768          +394.6%      13643 ± 55%  time.voluntary_context_switches
      0.00       +1.2e+104%     116.00 ±174%   +2e+108%    1976323 ± 77%  numa-vmstat.node0.nr_dirtied
    258614 ± 12%     -23.1%     198871 ± 22%     -65.4%      89422 ± 51%  numa-vmstat.node0.nr_inactive_anon
     21354 ± 11%     -25.5%      15904 ± 24%     -45.7%      11591 ± 50%  numa-vmstat.node0.nr_mapped
    203312 ± 16%     -25.9%     150668 ± 33%     -85.5%      29575 ±164%  numa-vmstat.node0.nr_shmem
      0.00       +1.2e+104%     116.00 ±174%   +2e+108%    1974313 ± 77%  numa-vmstat.node0.nr_written
    258613 ± 12%     -23.1%     198871 ± 22%     -65.4%      89422 ± 51%  numa-vmstat.node0.nr_zone_inactive_anon
     64.50 ±264%     -93.0%       4.50 ±264%  +1.8e+06%    1185634 ±129%  numa-vmstat.node1.nr_dirtied
      1.11 ±264%     -14.0%       0.95 ±264%  +6.1e+06%      67767 ±128%  numa-vmstat.node1.nr_dirty
     64.50 ±264%     -93.0%       4.50 ±264%  +1.8e+06%    1184435 ±129%  numa-vmstat.node1.nr_written
      1.11 ±264%     -14.0%       0.95 ±264%  +6.9e+06%      77021 ±129%  numa-vmstat.node1.nr_zone_write_pending
    182284 ±  6%      -9.3%     165309 ±  8%    +451.0%    1004341        meminfo.Active
     86665 ± 12%     -19.5%      69745 ± 20%     -73.0%      23418 ±  2%  meminfo.Active(anon)
     95619            -0.1%      95564          +925.9%     980923        meminfo.Active(file)
     72885 ± 19%     +10.3%      80389 ± 23%     +81.7%     132428 ± 12%  meminfo.AnonHugePages
   2471175            -0.5%    2459144           -30.0%    1730392        meminfo.Committed_AS
      4.30 ±264%    +112.7%       9.15 ±173%  +1.7e+07%     720974        meminfo.Dirty
   2817724            -0.2%    2811401           -29.5%    1986989        meminfo.Inactive
   1604889            -0.2%    1601524           -42.5%     922475        meminfo.Inactive(anon)
   1212835            -0.2%    1209876           -12.2%    1064514        meminfo.Inactive(file)
     71184            -0.3%      70969            -8.8%      64920        meminfo.KReclaimable
     71184            -0.3%      70969            -8.8%      64920        meminfo.SReclaimable
   1230255            -1.8%    1208723           -61.3%     475740        meminfo.Shmem
   5189604            -0.4%    5170057           -11.2%    4607285        meminfo.max_used_kB
     75.12            -0.2%      75.00           -13.8%      64.75        turbostat.Avg_MHz
      1461            -0.9%       1448           -18.4%       1192        turbostat.Bzy_MHz
      0.06 ±  9%      -0.0        0.06 ± 27%      -0.0        0.02        turbostat.C1%
     35368 ± 14%      -3.4%      34179 ± 12%    +434.5%     189039 ±  2%  turbostat.C1E
      0.39 ± 15%      +0.0        0.42 ± 19%      +0.7        1.10        turbostat.C1E%
   2901987 ±  2%      +0.8%    2923873 ±  2%    +297.2%   11528111        turbostat.C6
     26.90 ±  2%      +1.4%      27.28           +16.8%      31.41        turbostat.CPU%c6
   3026568 ±  2%      +0.4%    3037212 ±  2%    +298.7%   12067150        turbostat.IRQ
      6292 ±  4%      +0.1%       6299 ±  3%    +391.5%      30927 ± 23%  turbostat.POLL
     14.91 ±  3%      +0.1%      14.92 ±  4%     +14.1%      17.01 ±  6%  turbostat.Pkg%pc2
      7.26 ±  3%      +3.8%       7.54 ±  4%     -81.5%       1.34 ±  7%  turbostat.Pkg%pc6
    103.44            -0.8%     102.64           -16.4%      86.49        turbostat.PkgWatt
    139.03            -0.2%     138.80            +4.4%     145.11        turbostat.RAMWatt
     21546 ± 13%     -19.1%      17429 ± 20%     -72.8%       5855 ±  2%  proc-vmstat.nr_active_anon
     23904            -0.1%      23891          +925.8%     245216        proc-vmstat.nr_active_file
    114425            +0.2%     114684            +1.6%     116290        proc-vmstat.nr_anon_pages
     64.50 ±264%     +86.8%     120.50 ±173%  +4.9e+06%    3161954        proc-vmstat.nr_dirtied
      1.08 ±264%    +112.7%       2.29 ±173%  +1.7e+07%     180330        proc-vmstat.nr_dirty
    401284            -0.2%     400359           -42.5%     230623        proc-vmstat.nr_inactive_anon
    303209            -0.2%     302465           -12.2%     266073        proc-vmstat.nr_inactive_file
    307489            -1.7%     302150           -61.3%     118935        proc-vmstat.nr_shmem
     17796            -0.3%      17740            -8.8%      16230        proc-vmstat.nr_slab_reclaimable
     64.50 ±264%     +86.8%     120.50 ±173%  +4.9e+06%    3158748        proc-vmstat.nr_written
     21546 ± 13%     -19.1%      17429 ± 20%     -72.8%       5855 ±  2%  proc-vmstat.nr_zone_active_anon
     23904            -0.1%      23891          +925.8%     245216        proc-vmstat.nr_zone_active_file
    401284            -0.2%     400359           -42.5%     230623        proc-vmstat.nr_zone_inactive_anon
    303209            -0.2%     302465           -12.2%     266073        proc-vmstat.nr_zone_inactive_file
      1.08 ±264%    +112.7%       2.29 ±173%  +1.9e+07%     205284        proc-vmstat.nr_zone_write_pending
   2026941 ±  2%      -0.7%    2013074           +12.2%    2273593        proc-vmstat.numa_hit
   1982856            +0.3%    1987991           +13.8%    2257299        proc-vmstat.numa_local
     12262 ±101%     +55.1%      19021 ± 53%    +253.7%      43377 ± 31%  proc-vmstat.numa_pte_updates
   2084098            +0.3%    2090387           +14.8%    2393232        proc-vmstat.pgalloc_normal
    521180            +1.0%     526153           +69.9%     885412        proc-vmstat.pgfault
   1960252            +0.2%    1964697           +17.3%    2298816        proc-vmstat.pgfree
    102488 ± 11%      +3.5%     106035 ± 13%     +51.8%     155543 ±  4%  proc-vmstat.pgpgin
    325.50 ±264%     +88.9%     615.00 ±173%  +3.9e+06%   12663139        proc-vmstat.pgpgout
     58195            +1.2%      58865          +106.3%     120033        proc-vmstat.pgreuse
    417600 ±  2%      +0.4%     419136 ±  2%    +169.4%    1125216        proc-vmstat.unevictable_pgs_scanned
      2800 ±  2%      +6.2%       2973 ±  6%     +70.3%       4768 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.avg
     13077 ± 18%      +7.1%      14011 ± 19%    +124.6%      29377 ± 40%  sched_debug.cfs_rq:/.avg_vruntime.max
      2168 ±  7%      +8.9%       2361 ± 12%    +139.0%       5182 ± 34%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.10 ± 24%     -15.4%       0.09 ± 19%     -37.3%       0.06 ± 21%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.31 ± 12%      -6.6%       0.29 ± 12%     -21.2%       0.24 ± 12%  sched_debug.cfs_rq:/.h_nr_running.stddev
      6260 ± 85%     +17.2%       7340 ± 74%    +218.5%      19937 ± 25%  sched_debug.cfs_rq:/.load.avg
     73.94 ± 24%      -3.1%      71.64 ± 38%     -51.4%      35.95 ± 25%  sched_debug.cfs_rq:/.load_avg.avg
      1034            -5.8%     975.25 ± 15%     -27.8%     746.88 ± 16%  sched_debug.cfs_rq:/.load_avg.max
    230.51 ± 16%      -4.3%     220.55 ± 29%     -39.1%     140.33 ± 15%  sched_debug.cfs_rq:/.load_avg.stddev
      2800 ±  2%      +6.2%       2973 ±  6%     +70.3%       4768 ± 11%  sched_debug.cfs_rq:/.min_vruntime.avg
     13077 ± 18%      +7.1%      14011 ± 19%    +124.6%      29377 ± 40%  sched_debug.cfs_rq:/.min_vruntime.max
      2168 ±  7%      +8.9%       2361 ± 12%    +139.0%       5182 ± 34%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.10 ± 25%     -14.3%       0.09 ± 19%     -36.5%       0.06 ± 21%  sched_debug.cfs_rq:/.nr_running.avg
     51.69 ± 35%      -3.4%      49.93 ± 52%     -70.7%      15.15 ± 47%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1021           -12.6%     893.12 ± 37%     -62.4%     384.00 ± 29%  sched_debug.cfs_rq:/.removed.load_avg.max
    216.60 ± 18%      -7.5%     200.27 ± 42%     -66.9%      71.72 ± 32%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    506.38 ±  4%     -12.6%     442.75 ± 38%     -61.7%     193.88 ± 30%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     88.51 ± 24%      -1.9%      86.85 ± 40%     -61.3%      34.28 ± 31%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    506.38 ±  4%     -12.6%     442.75 ± 38%     -61.7%     193.79 ± 30%  sched_debug.cfs_rq:/.removed.util_avg.max
     88.49 ± 24%      -1.9%      86.85 ± 40%     -61.3%      34.27 ± 31%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    278.47 ± 11%      -4.0%     267.45 ± 13%     -68.5%      87.71 ± 15%  sched_debug.cfs_rq:/.runnable_avg.avg
      1140 ± 16%     +14.2%       1301 ± 21%     -35.1%     740.21 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
    289.34 ± 11%      +5.4%     305.07 ± 10%     -47.3%     152.56 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    277.60 ± 11%      -3.9%     266.86 ± 13%     -68.5%      87.55 ± 15%  sched_debug.cfs_rq:/.util_avg.avg
      1140 ± 16%     +14.1%       1300 ± 21%     -35.1%     739.79 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    288.97 ± 11%      +5.5%     304.84 ± 10%     -47.2%     152.52 ±  9%  sched_debug.cfs_rq:/.util_avg.stddev
     23.42 ± 15%     -20.0%      18.73 ± 31%     -73.9%       6.12 ± 33%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    760.62 ±  5%      +1.3%     770.38 ±  4%     -71.8%     214.88 ± 27%  sched_debug.cfs_rq:/.util_est_enqueued.max
    106.76 ±  7%      -8.4%      97.79 ± 10%     -69.9%      32.16 ± 26%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    857338            +0.8%     864526 ±  3%     +11.3%     953851        sched_debug.cpu.avg_idle.avg
      7192 ±138%    +220.2%      23030 ±114%   +3239.4%     240183 ± 87%  sched_debug.cpu.avg_idle.min
    229334 ± 10%      -0.7%     227769 ± 15%     -48.8%     117392 ± 17%  sched_debug.cpu.avg_idle.stddev
     40663            -0.0%      40660          +118.1%      88695        sched_debug.cpu.clock.avg
     40668            -0.0%      40665          +118.1%      88701        sched_debug.cpu.clock.max
     40658            -0.0%      40655          +118.1%      88686        sched_debug.cpu.clock.min
     40524            -0.0%      40520          +114.5%      86904        sched_debug.cpu.clock_task.avg
     40645            -0.0%      40642          +115.0%      87388        sched_debug.cpu.clock_task.max
     34635            -0.4%      34496          +133.7%      80938        sched_debug.cpu.clock_task.min
    222.00 ± 22%     -22.8%     171.28 ± 24%     -50.1%     110.79 ± 24%  sched_debug.cpu.curr->pid.avg
      2312            -0.3%       2305          +114.6%       4961        sched_debug.cpu.curr->pid.max
    840825 ± 12%      -9.6%     760472 ± 26%     -33.0%     563575 ±  6%  sched_debug.cpu.max_idle_balance_cost.max
     43111 ± 29%     -29.9%      30224 ± 84%     -79.7%       8762 ± 64%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.10 ± 22%     -20.3%       0.08 ± 27%     -64.6%       0.04 ± 28%  sched_debug.cpu.nr_running.avg
      0.31 ± 11%      -9.6%       0.28 ± 15%     -44.1%       0.17 ± 15%  sched_debug.cpu.nr_running.stddev
      1011            +0.5%       1016 ±  2%    +107.0%       2093 ±  3%  sched_debug.cpu.nr_switches.avg
      7556 ± 11%      +1.2%       7650 ± 11%    +126.7%      17130 ± 26%  sched_debug.cpu.nr_switches.max
    183.62 ±  9%      +6.9%     196.25 ±  9%    +157.2%     472.25 ±  7%  sched_debug.cpu.nr_switches.min
      1175 ±  5%      -1.9%       1153 ±  6%    +111.5%       2485 ± 15%  sched_debug.cpu.nr_switches.stddev
      0.11 ± 12%      +6.9%       0.12 ± 12%     -58.2%       0.05 ± 11%  sched_debug.cpu.nr_uninterruptible.avg
     40659            -0.0%      40656          +118.1%      88688        sched_debug.cpu_clk
     39981            -0.0%      39977          +120.1%      88009        sched_debug.ktime
     41225            +0.0%      41230          +116.5%      89261        sched_debug.sched_clk
      2.79 ±  3%      +2.0%       2.84 ±  3%     +92.2%       5.36        perf-stat.i.MPKI
 5.921e+08 ±  2%      -2.5%  5.771e+08 ±  3%     -47.3%   3.12e+08        perf-stat.i.branch-instructions
      6.97 ±  3%      +0.1        7.06 ±  2%      +1.8        8.74        perf-stat.i.branch-miss-rate%
  29742481 ±  2%      -2.6%   28965894 ±  3%     -28.2%   21352056        perf-stat.i.branch-misses
      6.06            +0.0        6.11            +0.2        6.31        perf-stat.i.cache-miss-rate%
   4554609 ±  2%      -0.3%    4539592 ±  2%      +8.4%    4936818        perf-stat.i.cache-misses
      1980            -0.1%       1979            -7.0%       1841 ±  7%  perf-stat.i.context-switches
      4.28 ±  4%      +3.2%       4.42 ±  3%     +32.3%       5.66        perf-stat.i.cpi
 5.981e+09            +0.2%  5.991e+09           -10.9%  5.332e+09        perf-stat.i.cpu-cycles
      1694 ±  3%      -0.4%       1686 ±  3%     -26.3%       1248        perf-stat.i.cycles-between-cache-misses
      0.68 ±  4%      +0.0        0.70 ±  5%      +0.2        0.84        perf-stat.i.dTLB-load-miss-rate%
 6.684e+08 ±  2%      -1.6%   6.58e+08 ±  2%     -43.4%  3.784e+08        perf-stat.i.dTLB-loads
      0.11 ±  5%      +0.0        0.11 ±  4%      +0.0        0.15        perf-stat.i.dTLB-store-miss-rate%
    177988            +1.1%     180008            +4.5%     186030        perf-stat.i.dTLB-store-misses
  3.12e+08 ±  2%      -1.6%  3.068e+08 ±  2%     -43.6%  1.761e+08        perf-stat.i.dTLB-stores
     71.63            -0.0       71.61            +1.1       72.71        perf-stat.i.iTLB-load-miss-rate%
   1144857            -0.7%    1136407           -25.2%     855820        perf-stat.i.iTLB-load-misses
    486854 ±  2%      +0.2%     487795           -30.4%     339088        perf-stat.i.iTLB-loads
  2.88e+09 ±  2%      -2.6%  2.806e+09 ±  3%     -46.7%  1.536e+09        perf-stat.i.instructions
      2287 ±  3%      -2.8%       2224 ±  3%     -29.7%       1608        perf-stat.i.instructions-per-iTLB-miss
      0.44 ±  2%      -2.5%       0.42 ±  3%     -39.4%       0.26        perf-stat.i.ipc
      1.84 ± 18%      -7.1%       1.71 ± 25%     -53.7%       0.85 ± 15%  perf-stat.i.major-faults
      0.06            +0.2%       0.06           -10.8%       0.06        perf-stat.i.metric.GHz
      1095 ±  2%      +1.0%       1105 ±  3%     -19.9%     876.81        perf-stat.i.metric.K/sec
     16.09 ±  2%      -2.0%      15.76 ±  2%     -44.2%       8.98        perf-stat.i.metric.M/sec
      9541            -0.1%       9528 ±  2%     -44.7%       5277        perf-stat.i.minor-faults
     63.10 ±  3%      +0.5       63.60 ±  3%     -32.7       30.36 ±  2%  perf-stat.i.node-load-miss-rate%
    164201 ±  7%      +3.6%     170186 ±  6%     -40.8%      97141 ±  3%  perf-stat.i.node-load-misses
    126967 ± 10%      -2.0%     124460 ± 10%    +139.0%     303425        perf-stat.i.node-loads
     35.52 ±  7%      +1.7       37.17 ±  8%      +6.4       41.90 ±  8%  perf-stat.i.node-store-miss-rate%
     71753 ± 13%      +3.4%      74170 ± 11%     -28.9%      51007 ±  8%  perf-stat.i.node-store-misses
    700643 ±  2%      -2.9%     680279 ±  3%     -67.3%     229086        perf-stat.i.node-stores
      9543            -0.1%       9530 ±  2%     -44.7%       5278        perf-stat.i.page-faults
      1.58 ±  2%      +2.3%       1.62 ±  2%    +103.2%       3.22        perf-stat.overall.MPKI
      5.02            -0.0        5.02            +1.8        6.84        perf-stat.overall.branch-miss-rate%
      5.72            -0.0        5.71 ±  2%      +0.5        6.21        perf-stat.overall.cache-miss-rate%
      2.08 ±  2%      +2.8%       2.14 ±  2%     +67.0%       3.47        perf-stat.overall.cpi
      1314 ±  2%      +0.5%       1321 ±  2%     -17.8%       1080        perf-stat.overall.cycles-between-cache-misses
      0.30 ±  4%      +0.0        0.31 ±  4%      +0.2        0.55 ±  2%  perf-stat.overall.dTLB-load-miss-rate%
      0.06 ±  2%      +0.0        0.06 ±  2%      +0.0        0.11        perf-stat.overall.dTLB-store-miss-rate%
     70.17            -0.2       69.97            +1.5       71.62        perf-stat.overall.iTLB-load-miss-rate%
      2512            -1.8%       2467 ±  2%     -28.6%       1793        perf-stat.overall.instructions-per-iTLB-miss
      0.48 ±  2%      -2.7%       0.47 ±  2%     -40.1%       0.29        perf-stat.overall.ipc
     56.42 ±  7%      +1.4       57.82 ±  6%     -32.2       24.25 ±  3%  perf-stat.overall.node-load-miss-rate%
      9.27 ± 10%      +0.6        9.84 ± 11%      +8.9       18.21 ±  7%  perf-stat.overall.node-store-miss-rate%
 5.711e+08 ±  2%      -2.4%  5.573e+08 ±  2%     -45.8%  3.093e+08        perf-stat.ps.branch-instructions
  28692777 ±  2%      -2.5%   27972329 ±  3%     -26.2%   21165670        perf-stat.ps.branch-misses
   4394661 ±  2%      -0.3%    4382294 ±  2%     +11.4%    4894724        perf-stat.ps.cache-misses
     92747            +0.0%      92783            +2.7%      95206        perf-stat.ps.cpu-clock
 5.775e+09            +0.2%  5.787e+09            -8.4%  5.287e+09        perf-stat.ps.cpu-cycles
    103.13            +0.7%     103.90            +2.8%     105.98        perf-stat.ps.cpu-migrations
   1917098 ±  3%      +1.7%    1948867 ±  3%      +7.5%    2060253        perf-stat.ps.dTLB-load-misses
 6.447e+08 ±  2%      -1.5%  6.353e+08 ±  2%     -41.8%  3.751e+08        perf-stat.ps.dTLB-loads
    171909            +1.2%     173906            +7.3%     184478        perf-stat.ps.dTLB-store-misses
  3.01e+08 ±  2%      -1.6%  2.963e+08 ±  2%     -42.0%  1.746e+08        perf-stat.ps.dTLB-stores
   1105364            -0.7%    1097965           -23.2%     848655        perf-stat.ps.iTLB-load-misses
    470003 ±  2%      +0.3%     471282           -28.5%     336263        perf-stat.ps.iTLB-loads
 2.778e+09 ±  2%      -2.5%  2.709e+09 ±  3%     -45.2%  1.522e+09        perf-stat.ps.instructions
      1.77 ± 18%      -7.1%       1.65 ± 25%     -52.4%       0.84 ± 15%  perf-stat.ps.major-faults
      9209            -0.1%       9202 ±  2%     -43.2%       5231        perf-stat.ps.minor-faults
    158446 ±  7%      +3.7%     164332 ±  6%     -39.2%      96322 ±  3%  perf-stat.ps.node-load-misses
    122463 ± 10%      -1.9%     120160 ± 10%    +145.7%     300841        perf-stat.ps.node-loads
     69247 ± 13%      +3.4%      71617 ± 11%     -27.0%      50575 ±  8%  perf-stat.ps.node-store-misses
    675665 ±  2%      -2.8%     656426 ±  3%     -66.4%     227087        perf-stat.ps.node-stores
      9210            -0.1%       9204 ±  2%     -43.2%       5232        perf-stat.ps.page-faults
     92747            +0.0%      92783            +2.7%      95206        perf-stat.ps.task-clock
 8.162e+10            -1.2%  8.063e+10          +124.8%  1.835e+11        perf-stat.total.instructions
     47.96 ± 35%     -12.2       35.79 ± 51%     -41.8        6.16 ± 19%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     47.42 ± 36%     -11.6       35.79 ± 51%     -41.3        6.16 ± 19%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.16 ± 71%      -5.1        5.02 ± 88%     -10.2        0.00        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.16 ± 71%      -5.1        5.02 ± 88%     -10.2        0.00        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.74 ± 81%      -2.4        1.33 ±180%      -3.7        0.00        perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      8.77 ± 68%      -2.4        6.40 ±144%      -8.8        0.00        perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range
      9.42 ± 68%      -2.2        7.18 ±138%      -9.4        0.00        perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      4.72 ± 83%      -1.8        2.92 ±193%      -4.7        0.00        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      4.72 ± 83%      -1.8        2.92 ±193%      -4.7        0.00        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
     23.45 ± 38%      -1.4       22.01 ± 58%     -23.4        0.00        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      2.36 ±101%      -0.8        1.57 ±173%      +2.9        5.31 ±  5%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
      2.36 ±101%      -0.8        1.57 ±173%      +3.6        6.01 ±  4%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      2.36 ±101%      -0.8        1.57 ±173%      +4.5        6.83 ±  4%  perf-profile.calltrace.cycles-pp.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.36 ±101%      -0.8        1.57 ±173%      +8.8       11.14 ±  3%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      6.40 ± 62%      -0.7        5.66 ±110%      -6.4        0.00        perf-profile.calltrace.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      4.72 ± 83%      -0.5        4.25 ±128%      -4.7        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.72 ± 83%      -0.5        4.25 ±128%      -4.7        0.00        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.72 ± 83%      -0.5        4.25 ±128%      -4.7        0.00        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.6        0.59 ±  8%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.6        0.61 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_governor_latency_req.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.0        0.00            +0.6        0.62 ±  5%  perf-profile.calltrace.cycles-pp.run_posix_cpu_timers.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +0.0        0.00            +0.6        0.64 ± 13%  perf-profile.calltrace.cycles-pp.update_blocked_averages.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.7        0.67 ± 13%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.rebalance_domains.__do_softirq
      0.00            +0.0        0.00            +0.7        0.69 ± 11%  perf-profile.calltrace.cycles-pp.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.7        0.71 ±  7%  perf-profile.calltrace.cycles-pp.update_rq_clock_task.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.7        0.74 ± 11%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu
      0.00            +0.0        0.00            +0.8        0.77 ±  9%  perf-profile.calltrace.cycles-pp.timerqueue_add.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.8        0.78 ± 11%  perf-profile.calltrace.cycles-pp.rcu_pending.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.8        0.78 ±  5%  perf-profile.calltrace.cycles-pp.timerqueue_del.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.8        0.84 ±  8%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.8        0.85 ± 13%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.0        0.96 ±  8%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.00            +0.0        0.00            +1.1        1.13 ± 10%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.2        1.18 ±  5%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +0.0        0.00            +1.3        1.26 ±  7%  perf-profile.calltrace.cycles-pp.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.4        1.45 ± 28%  perf-profile.calltrace.cycles-pp.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages
      0.00            +0.0        0.00            +1.6        1.60 ±  8%  perf-profile.calltrace.cycles-pp.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.7        1.71 ± 26%  perf-profile.calltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc
      0.00            +0.0        0.00            +1.9        1.87 ± 12%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.9        1.90 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.0        0.00            +1.9        1.92 ± 23%  perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.calltrace.cycles-pp.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops
      0.00            +0.0        0.00            +2.0        1.96 ± 10%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.0        0.00            +2.0        1.96 ± 26%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +2.0        1.96 ± 26%  perf-profile.calltrace.cycles-pp.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +2.0        1.98 ± 23%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +0.0        0.00            +2.0        2.00 ± 23%  perf-profile.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +0.0        0.00            +2.0        2.00 ± 10%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +2.6        2.65 ±  8%  perf-profile.calltrace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.0        0.00            +3.0        3.01 ± 23%  perf-profile.calltrace.cycles-pp.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +3.0        3.01 ± 23%  perf-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +0.0        0.00            +3.1        3.12 ±  7%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +4.1        4.06 ±  4%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.48 ±264%      +0.3        0.74 ±264%     +12.9       13.41 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.48 ±264%      +0.3        0.74 ±264%     +13.2       13.66 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.48 ±264%      +0.3        0.74 ±264%     +20.1       20.57 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.48 ±264%      +0.3        0.74 ±264%     +23.2       23.70 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     16.59 ± 79%      +0.3       16.89 ±104%     -16.6        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.72 ± 50%      +0.4       19.10 ± 71%     -18.7        0.00        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.get_signal
     18.72 ± 50%      +0.4       19.10 ± 71%     -18.7        0.00        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      0.00            +0.7        0.74 ±264%      +0.7        0.70 ± 16%  perf-profile.calltrace.cycles-pp.arch_scale_freq_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
     20.44 ± 34%      +0.7       21.18 ± 62%     -20.4        0.00        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
     20.44 ± 34%      +0.7       21.18 ± 62%     -20.4        0.00        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
     20.34 ± 38%      +0.8       21.18 ± 62%     -20.3        0.00        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
     19.78 ± 33%      +1.4       21.18 ± 62%     -19.8        0.00        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      6.00 ±118%      +2.1        8.12 ± 51%      -6.0        0.00        perf-profile.calltrace.cycles-pp.asm_exc_page_fault
     13.60 ± 92%      +2.5       16.05 ± 99%     -13.6        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.60 ± 92%      +2.5       16.05 ± 99%     -13.6        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.60 ± 92%      +2.5       16.05 ± 99%     -13.6        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     13.60 ± 92%      +2.5       16.05 ± 99%     -13.6        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     35.00 ± 39%     +14.7       49.72 ± 39%     +58.2       93.20        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     34.04 ± 34%     +15.7       49.72 ± 39%     +50.8       84.80        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     34.04 ± 34%     +15.7       49.72 ± 39%     +58.2       92.26        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     34.04 ± 34%     +15.7       49.72 ± 39%     +58.3       92.31        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     34.04 ± 34%     +15.7       49.72 ± 39%     +58.3       92.32        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     33.08 ± 28%     +16.6       49.72 ± 39%     +52.6       85.67        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     33.08 ± 28%     +16.6       49.72 ± 39%     +58.0       91.10        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     28.40 ± 30%     +20.6       48.98 ± 38%     +31.7       60.06        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     47.96 ± 35%     -12.2       35.79 ± 51%     -41.8        6.16 ± 19%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     47.42 ± 36%     -11.6       35.79 ± 51%     -41.3        6.16 ± 19%  perf-profile.children.cycles-pp.do_syscall_64
     10.16 ± 71%      -5.1        5.02 ± 88%     -10.2        0.00        perf-profile.children.cycles-pp.shmem_file_write_iter
     10.16 ± 71%      -5.1        5.02 ± 88%     -10.2        0.00        perf-profile.children.cycles-pp.generic_perform_write
     25.36 ± 40%      -3.3       22.01 ± 58%     -25.2        0.18 ± 21%  perf-profile.children.cycles-pp.exit_mmap
     25.36 ± 40%      -3.3       22.01 ± 58%     -25.2        0.18 ± 20%  perf-profile.children.cycles-pp.__mmput
     10.08 ± 71%      -2.9        7.18 ±138%     -10.1        0.00        perf-profile.children.cycles-pp.tlb_batch_pages_flush
      8.94 ± 77%      -2.5        6.40 ±144%      -8.8        0.10 ± 38%  perf-profile.children.cycles-pp.release_pages
      3.74 ± 81%      -2.4        1.33 ±180%      -3.2        0.50 ± 13%  perf-profile.children.cycles-pp.update_sg_lb_stats
      3.74 ± 81%      -2.4        1.33 ±180%      -3.0        0.74 ± 11%  perf-profile.children.cycles-pp.update_sd_lb_stats
      3.74 ± 81%      -1.9        1.83 ±174%      -3.7        0.04 ± 84%  perf-profile.children.cycles-pp.newidle_balance
      3.74 ± 81%      -1.9        1.83 ±174%      -3.6        0.17 ± 32%  perf-profile.children.cycles-pp.__schedule
      3.74 ± 81%      -1.9        1.83 ±174%      -2.9        0.80 ± 10%  perf-profile.children.cycles-pp.find_busiest_group
      3.74 ± 81%      -1.9        1.83 ±174%      -2.5        1.20 ±  9%  perf-profile.children.cycles-pp.load_balance
     26.43 ± 41%      -1.6       24.84 ± 48%     -26.4        0.08 ± 40%  perf-profile.children.cycles-pp.do_exit
     26.43 ± 41%      -1.6       24.84 ± 48%     -26.3        0.08 ± 41%  perf-profile.children.cycles-pp.do_group_exit
      3.02 ±117%      -1.5        1.57 ±173%      +8.3       11.35 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      3.02 ±117%      -1.5        1.57 ±173%     +10.6       13.60 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      3.02 ±117%      -1.5        1.57 ±173%     +10.8       13.82 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      3.02 ±117%      -1.5        1.57 ±173%     +17.8       20.84 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.02 ±117%      -1.5        1.57 ±173%     +19.6       22.61 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     23.45 ± 38%      -1.4       22.01 ± 58%     -23.4        0.05 ± 65%  perf-profile.children.cycles-pp.exit_mm
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     21.71 ± 53%      -1.1       20.60 ± 67%     -21.7        0.00        perf-profile.children.cycles-pp.get_signal
      2.36 ±101%      -0.8        1.57 ±173%      +3.1        5.43 ±  5%  perf-profile.children.cycles-pp.update_process_times
      2.36 ±101%      -0.8        1.57 ±173%      +3.7        6.09 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      2.36 ±101%      -0.8        1.57 ±173%      +4.6        6.93 ±  4%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      6.40 ± 62%      -0.7        5.66 ±110%      -6.4        0.01 ±264%  perf-profile.children.cycles-pp.page_remove_rmap
      0.00            +0.0        0.00            +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.hrtimer_forward
      0.00            +0.0        0.00            +0.1        0.07 ± 25%  perf-profile.children.cycles-pp.update_dl_rq_load_avg
      0.00            +0.0        0.00            +0.1        0.08 ± 27%  perf-profile.children.cycles-pp.cpuidle_select
      0.00            +0.0        0.00            +0.1        0.08 ± 24%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.00            +0.0        0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.0        0.00            +0.1        0.10 ± 23%  perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.00            +0.0        0.00            +0.1        0.10 ± 30%  perf-profile.children.cycles-pp.dup_mmap
      0.00            +0.0        0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.0        0.00            +0.1        0.11 ± 36%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.0        0.00            +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.0        0.00            +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.trigger_load_balance
      0.00            +0.0        0.00            +0.1        0.12 ± 20%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.00            +0.0        0.00            +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.0        0.00            +0.1        0.12 ± 28%  perf-profile.children.cycles-pp.dup_mm
      0.00            +0.0        0.00            +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.0        0.00            +0.1        0.13 ± 29%  perf-profile.children.cycles-pp.task_tick_idle
      0.00            +0.0        0.00            +0.1        0.13 ± 24%  perf-profile.children.cycles-pp.xas_descend
      0.00            +0.0        0.00            +0.1        0.14 ± 18%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.00            +0.0        0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.find_lock_delalloc_range
      0.00            +0.0        0.00            +0.1        0.14 ± 38%  perf-profile.children.cycles-pp.tick_program_event
      0.00            +0.0        0.00            +0.1        0.14 ± 20%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.1        0.14 ± 13%  perf-profile.children.cycles-pp.folio_activate_fn
      0.00            +0.0        0.00            +0.1        0.15 ± 32%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.0        0.00            +0.1        0.15 ± 25%  perf-profile.children.cycles-pp.account_process_tick
      0.00            +0.0        0.00            +0.2        0.15 ± 13%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.0        0.00            +0.2        0.15 ± 21%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.0        0.00            +0.2        0.16 ± 25%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.00            +0.2        0.16 ± 30%  perf-profile.children.cycles-pp.copy_process
      0.00            +0.0        0.00            +0.2        0.17 ± 22%  perf-profile.children.cycles-pp.should_we_balance
      0.00            +0.0        0.00            +0.2        0.17 ± 16%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.00            +0.2        0.17 ± 27%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +0.0        0.00            +0.2        0.17 ± 27%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +0.0        0.00            +0.2        0.18 ± 16%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.00            +0.0        0.00            +0.2        0.18 ± 23%  perf-profile.children.cycles-pp.ct_irq_enter
      0.00            +0.0        0.00            +0.2        0.18 ± 26%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.00            +0.0        0.00            +0.2        0.18 ± 29%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.0        0.00            +0.2        0.18 ± 22%  perf-profile.children.cycles-pp.menu_reflect
      0.00            +0.0        0.00            +0.2        0.18 ± 25%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.00            +0.0        0.00            +0.2        0.19 ± 14%  perf-profile.children.cycles-pp.native_apic_mem_eoi
      0.00            +0.0        0.00            +0.2        0.19 ± 29%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.0        0.00            +0.2        0.20 ± 17%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.00            +0.0        0.00            +0.2        0.20 ± 13%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.0        0.00            +0.2        0.20 ± 16%  perf-profile.children.cycles-pp.call_cpuidle
      0.00            +0.0        0.00            +0.2        0.20 ± 23%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.00            +0.0        0.00            +0.2        0.20 ± 13%  perf-profile.children.cycles-pp.task_tick_mm_cid
      0.00            +0.0        0.00            +0.2        0.21 ± 11%  perf-profile.children.cycles-pp.leave_mm
      0.00            +0.0        0.00            +0.2        0.21 ± 21%  perf-profile.children.cycles-pp.writepage_delalloc
      0.00            +0.0        0.00            +0.2        0.22 ± 14%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.00            +0.2        0.22 ± 15%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.2        0.23 ± 32%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.00            +0.0        0.00            +0.2        0.23 ± 42%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.00            +0.0        0.00            +0.2        0.24 ± 20%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.2        0.25 ± 12%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.0        0.00            +0.2        0.25 ± 15%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.3        0.26 ± 21%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.00            +0.3        0.26 ± 25%  perf-profile.children.cycles-pp.btrfs_set_range_writeback
      0.00            +0.0        0.00            +0.3        0.26 ± 11%  perf-profile.children.cycles-pp.get_cpu_device
      0.00            +0.0        0.00            +0.3        0.27 ± 34%  perf-profile.children.cycles-pp.folio_end_writeback
      0.00            +0.0        0.00            +0.3        0.27 ± 17%  perf-profile.children.cycles-pp.folio_activate
      0.00            +0.0        0.00            +0.3        0.27 ± 23%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.00            +0.0        0.00            +0.3        0.27 ± 17%  perf-profile.children.cycles-pp.irq_work_tick
      0.00            +0.0        0.00            +0.3        0.29 ± 37%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.00            +0.0        0.00            +0.3        0.31 ± 16%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.3        0.32 ±  9%  perf-profile.children.cycles-pp.check_cpu_stall
      0.00            +0.0        0.00            +0.3        0.33 ± 34%  perf-profile.children.cycles-pp.__btrfs_bio_end_io
      0.00            +0.0        0.00            +0.3        0.33 ± 34%  perf-profile.children.cycles-pp.end_bio_extent_writepage
      0.00            +0.0        0.00            +0.3        0.34 ±  9%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.3        0.34 ± 33%  perf-profile.children.cycles-pp.blk_update_request
      0.00            +0.0        0.00            +0.3        0.34 ± 33%  perf-profile.children.cycles-pp.scsi_io_completion
      0.00            +0.0        0.00            +0.3        0.34 ± 33%  perf-profile.children.cycles-pp.scsi_end_request
      0.00            +0.0        0.00            +0.3        0.34 ± 33%  perf-profile.children.cycles-pp.blk_complete_reqs
      0.00            +0.0        0.00            +0.3        0.35 ± 17%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.00            +0.4        0.37 ± 29%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.00            +0.0        0.00            +0.4        0.37 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +0.4        0.37 ± 34%  perf-profile.children.cycles-pp.btrfs_dirty_pages
      0.00            +0.0        0.00            +0.4        0.38 ± 12%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.4        0.40 ± 13%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.00            +0.0        0.00            +0.4        0.42 ± 10%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.0        0.00            +0.4        0.42 ± 18%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.5        0.45 ± 14%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.5        0.46 ± 13%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.00            +0.0        0.00            +0.5        0.46 ± 15%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.00            +0.0        0.00            +0.5        0.48 ± 13%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.00            +0.0        0.00            +0.5        0.49 ± 18%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.0        0.00            +0.5        0.50 ±  7%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.0        0.00            +0.5        0.50 ±  9%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.0        0.00            +0.5        0.53 ± 13%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.0        0.00            +0.6        0.55 ± 21%  perf-profile.children.cycles-pp.prepare_pages
      0.00            +0.0        0.00            +0.6        0.56 ±  7%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.0        0.00            +0.6        0.56 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.0        0.00            +0.6        0.58 ± 11%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.0        0.00            +0.6        0.58 ±  7%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.0        0.00            +0.6        0.59 ± 11%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.00            +0.6        0.60 ± 20%  perf-profile.children.cycles-pp.pagecache_get_page
      0.00            +0.0        0.00            +0.6        0.60 ± 20%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.00            +0.0        0.00            +0.6        0.61 ± 10%  perf-profile.children.cycles-pp.ct_idle_exit
      0.00            +0.0        0.00            +0.6        0.61 ±  8%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.6        0.63 ±  6%  perf-profile.children.cycles-pp.run_posix_cpu_timers
      0.00            +0.0        0.00            +0.6        0.63 ± 11%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.0        0.00            +0.7        0.65 ± 12%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.0        0.00            +0.7        0.67 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.7        0.68 ±  5%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.0        0.00            +0.7        0.70 ± 11%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.00            +0.0        0.00            +0.8        0.79 ±  9%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.0        0.00            +0.8        0.79 ± 10%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.0        0.00            +0.8        0.79 ±  6%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.00            +0.8        0.80 ±  5%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.0        0.00            +0.9        0.85 ±  8%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.0        0.00            +0.9        0.90 ± 13%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.9        0.92 ±  6%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.00            +1.0        0.98 ±  9%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.00            +1.0        0.99 ± 30%  perf-profile.children.cycles-pp.crc_pcl
      0.00            +0.0        0.00            +1.0        1.02 ± 31%  perf-profile.children.cycles-pp.btrfs_csum_one_bio
      0.00            +0.0        0.00            +1.0        1.03 ± 31%  perf-profile.children.cycles-pp.submit_one_bio
      0.00            +0.0        0.00            +1.0        1.03 ± 31%  perf-profile.children.cycles-pp.btrfs_submit_bio
      0.00            +0.0        0.00            +1.0        1.03 ± 31%  perf-profile.children.cycles-pp.btrfs_submit_chunk
      0.00            +0.0        0.00            +1.1        1.06 ± 31%  perf-profile.children.cycles-pp.submit_extent_page
      0.00            +0.0        0.00            +1.3        1.26 ±  6%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.00            +1.3        1.28 ±  6%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +1.5        1.46 ± 28%  perf-profile.children.cycles-pp.__extent_writepage_io
      0.00            +0.0        0.00            +1.6        1.63 ±  8%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +0.0        0.00            +1.7        1.70 ± 21%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.0        0.00            +1.7        1.71 ± 26%  perf-profile.children.cycles-pp.__extent_writepage
      0.00            +0.0        0.00            +1.9        1.91 ± 12%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.start_ordered_ops
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.extent_writepages
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.extent_write_cache_pages
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      0.00            +0.0        0.00            +1.9        1.93 ± 26%  perf-profile.children.cycles-pp.do_writepages
      0.00            +0.0        0.00            +1.9        1.94 ±  6%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.0        0.00            +2.0        1.96 ± 26%  perf-profile.children.cycles-pp.__x64_sys_fsync
      0.00            +0.0        0.00            +2.0        1.96 ± 26%  perf-profile.children.cycles-pp.btrfs_sync_file
      0.00            +0.0        0.00            +2.0        2.01 ± 23%  perf-profile.children.cycles-pp.btrfs_copy_from_user
      0.00            +0.0        0.00            +2.0        2.02 ± 10%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +0.0        0.00            +2.0        2.04 ± 10%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.00            +0.0        0.00            +3.0        3.01 ± 23%  perf-profile.children.cycles-pp.btrfs_do_write_iter
      0.00            +0.0        0.00            +3.0        3.01 ± 23%  perf-profile.children.cycles-pp.btrfs_buffered_write
      0.00            +0.0        0.00            +3.0        3.04 ±  6%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.0        0.00            +3.4        3.43 ±  3%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.0        0.00            +4.1        4.14 ±  4%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.5        0.50 ±264%      +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.filemap_map_pages
      0.00            +0.7        0.74 ±264%      +0.7        0.70 ± 16%  perf-profile.children.cycles-pp.arch_scale_freq_tick
     20.44 ± 34%      +0.7       21.18 ± 62%     -20.4        0.08 ± 31%  perf-profile.children.cycles-pp.zap_pte_range
     20.44 ± 34%      +0.7       21.18 ± 62%     -20.4        0.08 ± 31%  perf-profile.children.cycles-pp.zap_pmd_range
      0.00            +0.8        0.83 ±264%      +0.2        0.22 ± 13%  perf-profile.children.cycles-pp._raw_spin_trylock
     21.00 ± 38%      +1.0       22.01 ± 58%     -20.9        0.09 ± 30%  perf-profile.children.cycles-pp.unmap_vmas
     20.44 ± 34%      +1.6       22.01 ± 58%     -20.4        0.08 ± 30%  perf-profile.children.cycles-pp.unmap_page_range
      0.00            +2.0        2.04 ±173%      +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.do_read_fault
     35.00 ± 39%     +14.7       49.72 ± 39%     +58.2       93.20        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     35.00 ± 39%     +14.7       49.72 ± 39%     +58.2       93.20        perf-profile.children.cycles-pp.cpu_startup_entry
     35.00 ± 39%     +14.7       49.72 ± 39%     +58.2       93.20        perf-profile.children.cycles-pp.do_idle
     34.04 ± 34%     +15.7       49.72 ± 39%     +52.3       86.30        perf-profile.children.cycles-pp.cpuidle_enter_state
     34.04 ± 34%     +15.7       49.72 ± 39%     +52.5       86.50        perf-profile.children.cycles-pp.cpuidle_enter
     34.04 ± 34%     +15.7       49.72 ± 39%     +58.0       92.06        perf-profile.children.cycles-pp.cpuidle_idle_call
     34.04 ± 34%     +15.7       49.72 ± 39%     +58.3       92.32        perf-profile.children.cycles-pp.start_secondary
     28.40 ± 30%     +20.6       48.98 ± 38%     +31.7       60.15        perf-profile.children.cycles-pp.intel_idle
      5.81 ± 77%      -2.5        3.28 ±142%      -5.8        0.00        perf-profile.self.cycles-pp.page_remove_rmap
      0.00            +0.0        0.00            +0.1        0.06 ± 19%  perf-profile.self.cycles-pp.hrtimer_forward
      0.00            +0.0        0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.folio_activate_fn
      0.00            +0.0        0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.ct_idle_enter
      0.00            +0.0        0.00            +0.1        0.07 ± 25%  perf-profile.self.cycles-pp.cpuidle_select
      0.00            +0.0        0.00            +0.1        0.07 ± 25%  perf-profile.self.cycles-pp.update_dl_rq_load_avg
      0.00            +0.0        0.00            +0.1        0.08 ± 26%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.0        0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.0        0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.update_blocked_averages
      0.00            +0.0        0.00            +0.1        0.09 ± 27%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.0        0.00            +0.1        0.09 ± 19%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.00            +0.0        0.00            +0.1        0.09 ± 31%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.00            +0.0        0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.00            +0.0        0.00            +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.trigger_load_balance
      0.00            +0.0        0.00            +0.1        0.10 ± 34%  perf-profile.self.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.00            +0.1        0.10 ± 24%  perf-profile.self.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.1        0.11 ± 27%  perf-profile.self.cycles-pp.__do_softirq
      0.00            +0.0        0.00            +0.1        0.11 ± 22%  perf-profile.self.cycles-pp.ct_nmi_exit
      0.00            +0.0        0.00            +0.1        0.11 ± 19%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.0        0.00            +0.1        0.12 ± 16%  perf-profile.self.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.0        0.00            +0.1        0.12 ± 13%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.0        0.00            +0.1        0.12 ± 19%  perf-profile.self.cycles-pp.xas_descend
      0.00            +0.0        0.00            +0.1        0.12 ± 27%  perf-profile.self.cycles-pp.ct_idle_exit
      0.00            +0.0        0.00            +0.1        0.12 ± 28%  perf-profile.self.cycles-pp.ct_irq_enter
      0.00            +0.0        0.00            +0.1        0.12 ± 20%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.0        0.00            +0.1        0.12 ± 22%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.00            +0.0        0.00            +0.1        0.13 ± 29%  perf-profile.self.cycles-pp.task_tick_idle
      0.00            +0.0        0.00            +0.1        0.13 ± 27%  perf-profile.self.cycles-pp.sched_clock
      0.00            +0.0        0.00            +0.1        0.14 ± 36%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.00            +0.0        0.00            +0.1        0.14 ± 24%  perf-profile.self.cycles-pp.account_process_tick
      0.00            +0.0        0.00            +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.00            +0.0        0.00            +0.1        0.15 ± 18%  perf-profile.self.cycles-pp.menu_reflect
      0.00            +0.0        0.00            +0.2        0.15 ± 26%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.00            +0.2        0.15 ± 15%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.00            +0.0        0.00            +0.2        0.16 ± 14%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.00            +0.0        0.00            +0.2        0.16 ± 21%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.2        0.17 ± 27%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.00            +0.2        0.17 ± 15%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.0        0.00            +0.2        0.17 ± 12%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.0        0.00            +0.2        0.17 ± 16%  perf-profile.self.cycles-pp.call_cpuidle
      0.00            +0.0        0.00            +0.2        0.17 ± 27%  perf-profile.self.cycles-pp.ct_nmi_enter
      0.00            +0.0        0.00            +0.2        0.17 ± 14%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.2        0.17 ± 10%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.00            +0.2        0.18 ± 18%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.0        0.00            +0.2        0.18 ± 17%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.0        0.00            +0.2        0.18 ± 20%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.00            +0.0        0.00            +0.2        0.18 ± 19%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.0        0.00            +0.2        0.18 ± 14%  perf-profile.self.cycles-pp.native_apic_mem_eoi
      0.00            +0.0        0.00            +0.2        0.19 ± 20%  perf-profile.self.cycles-pp.cpuidle_enter
      0.00            +0.0        0.00            +0.2        0.19 ± 15%  perf-profile.self.cycles-pp.error_entry
      0.00            +0.0        0.00            +0.2        0.19 ± 17%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.0        0.00            +0.2        0.19 ± 29%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.00            +0.0        0.00            +0.2        0.19 ± 17%  perf-profile.self.cycles-pp.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.2        0.19 ± 21%  perf-profile.self.cycles-pp.irqentry_enter
      0.00            +0.0        0.00            +0.2        0.19 ± 14%  perf-profile.self.cycles-pp.task_tick_mm_cid
      0.00            +0.0        0.00            +0.2        0.19 ± 10%  perf-profile.self.cycles-pp.leave_mm
      0.00            +0.0        0.00            +0.2        0.19 ± 26%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.0        0.00            +0.2        0.20 ± 18%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.00            +0.0        0.00            +0.2        0.21 ± 16%  perf-profile.self.cycles-pp.load_balance
      0.00            +0.0        0.00            +0.2        0.21 ± 14%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.2        0.22 ± 17%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.2        0.22 ± 12%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.0        0.00            +0.2        0.22 ± 13%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.0        0.00            +0.2        0.23 ± 17%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.00            +0.0        0.00            +0.2        0.23 ± 17%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.00            +0.0        0.00            +0.2        0.23 ± 17%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.00            +0.2        0.24 ± 20%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.2        0.24 ± 18%  perf-profile.self.cycles-pp.irq_work_tick
      0.00            +0.0        0.00            +0.3        0.25 ± 12%  perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.0        0.00            +0.3        0.26 ± 14%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.0        0.00            +0.3        0.27 ± 14%  perf-profile.self.cycles-pp.tick_irq_enter
      0.00            +0.0        0.00            +0.3        0.27 ± 11%  perf-profile.self.cycles-pp.rebalance_domains
      0.00            +0.0        0.00            +0.3        0.29 ± 19%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.3        0.30 ± 16%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.3        0.31 ± 35%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.00            +0.0        0.00            +0.3        0.32 ±  9%  perf-profile.self.cycles-pp.check_cpu_stall
      0.00            +0.0        0.00            +0.3        0.33 ± 10%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.3        0.34 ± 20%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.3        0.35 ± 17%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.00            +0.4        0.37 ± 15%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +0.4        0.37 ± 12%  perf-profile.self.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.4        0.37 ± 20%  perf-profile.self.cycles-pp.scheduler_tick
      0.00            +0.0        0.00            +0.4        0.38 ± 10%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.00            +0.4        0.40 ± 15%  perf-profile.self.cycles-pp.update_process_times
      0.00            +0.0        0.00            +0.4        0.41 ±  7%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.4        0.42 ± 16%  perf-profile.self.cycles-pp.rcu_pending
      0.00            +0.0        0.00            +0.4        0.44 ± 12%  perf-profile.self.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +0.4        0.45 ±  8%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.00            +0.5        0.46 ± 12%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.0        0.00            +0.5        0.48 ± 10%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.0        0.00            +0.5        0.54 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.0        0.00            +0.6        0.55 ±  8%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.0        0.00            +0.6        0.57 ±  6%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.0        0.00            +0.6        0.59 ± 11%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.00            +0.6        0.60 ±  8%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.0        0.00            +0.6        0.61 ±  8%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.6        0.63 ±  6%  perf-profile.self.cycles-pp.run_posix_cpu_timers
      0.00            +0.0        0.00            +0.7        0.66 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.0        0.00            +1.0        0.98 ± 30%  perf-profile.self.cycles-pp.crc_pcl
      0.00            +0.0        0.00            +1.1        1.15 ± 34%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.0        0.00            +1.5        1.49 ±  6%  perf-profile.self.cycles-pp.menu_select
      0.00            +0.0        0.00            +2.3        2.35 ±  5%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.00            +0.7        0.74 ±264%      +0.7        0.70 ± 16%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.8        0.83 ±264%      +0.1        0.13 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock_irq
     28.40 ± 30%     +20.6       48.98 ± 38%     +31.7       60.15        perf-profile.self.cycles-pp.intel_idle

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/4Kb/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

69e1ebcf925c2ec5 03da7318eb21a7d0f9ef4b6674e 0651230c4b0580c3ec44fd9934c
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     38.55            +1.5%      39.13           -32.6%      25.99        boot-time.boot
      3207            +1.8%       3264           -37.1%       2018        boot-time.idle
 3.055e+09 ±  2%      +0.0%  3.056e+09 ±  2%    +296.8%  1.212e+10 ±  9%  cpuidle..time
   3220730 ±  2%      +0.2%    3225714 ±  2%    +295.4%   12735027 ±  9%  cpuidle..usage
     25.62 ± 18%      +5.9%      27.12 ± 11%     -52.7%      12.12 ± 22%  perf-c2c.DRAM.local
     71.38 ± 15%      -3.7%      68.75 ± 26%     -56.2%      31.25 ± 21%  perf-c2c.DRAM.remote
     72.97            +0.8%      73.58          +117.9%     158.96 ±  7%  uptime.boot
      6393            +0.9%       6453          +123.2%      14269 ±  8%  uptime.idle
      0.16 ± 50%      +0.0        0.19 ± 47%      +0.7        0.87 ±  2%  mpstat.cpu.all.iowait%
      0.11 ±  2%      +0.0        0.12 ±  2%      +0.0        0.14        mpstat.cpu.all.soft%
      0.39 ±  2%      +0.0        0.39 ±  2%      -0.2        0.17        mpstat.cpu.all.sys%
      0.50 ±  2%      +0.0        0.50 ±  2%      -0.3        0.21 ±  7%  mpstat.cpu.all.usr%
      7.93 ±173%     +88.9%      14.99 ±100%  +5.8e+06%     456802 ± 77%  numa-meminfo.node0.Dirty
    930556 ± 34%      -8.1%     855170 ± 40%     -62.1%     352910 ± 71%  numa-meminfo.node0.Inactive(anon)
    720204 ± 48%      -9.1%     654812 ± 54%     -83.5%     118482 ±163%  numa-meminfo.node0.Shmem
      4.06 ±264%     -77.1%       0.93 ±173%  +6.8e+06%     276075 ±128%  numa-meminfo.node1.Dirty
      3085 ±  9%      +5.9%       3268 ± 13%     -63.0%       1142 ± 10%  vmstat.io.bi
     27.91 ±129%     +28.0%      35.73 ±100%  +3.6e+05%      99142        vmstat.io.bo
      0.40 ± 26%      +3.2%       0.41 ± 32%    +118.8%       0.88 ±  4%  vmstat.procs.b
      1.39 ±  5%      -2.2%       1.36 ±  9%     -65.8%       0.48 ±  7%  vmstat.procs.r
      2446 ±  5%      +1.0%       2470 ±  5%     -20.5%       1945 ±  5%  vmstat.system.cs
     95138            +0.1%      95255            +2.8%      97815        vmstat.system.in
      1950            +0.2%       1953           -93.5%     126.38        phoronix-test-suite.iozone.4Kb.2GB.WritePerformance.mb_s
     31.16 ±  2%      -0.1%      31.14 ±  3%    +314.7%     129.22 ±  9%  phoronix-test-suite.time.elapsed_time
     31.16 ±  2%      -0.1%      31.14 ±  3%    +314.7%     129.22 ±  9%  phoronix-test-suite.time.elapsed_time.max
    167884 ±  7%      +3.6%     173948 ±  6%     +63.5%     274550 ±  4%  phoronix-test-suite.time.file_system_inputs
      1448 ±129%     +27.3%       1844 ±100%  +1.8e+06%   26321544 ± 10%  phoronix-test-suite.time.file_system_outputs
     32.25 ±  3%      -0.4%      32.12 ±  3%     -62.4%      12.12 ±  2%  phoronix-test-suite.time.percent_of_cpu_this_job_got
      7.69            +0.5%       7.73           +81.5%      13.96 ±  8%  phoronix-test-suite.time.system_time
      2763            +1.0%       2790          +340.8%      12182 ± 53%  phoronix-test-suite.time.voluntary_context_switches
     31.16 ±  2%      -0.1%      31.14 ±  3%    +314.7%     129.22 ±  9%  time.elapsed_time
     31.16 ±  2%      -0.1%      31.14 ±  3%    +314.7%     129.22 ±  9%  time.elapsed_time.max
    167884 ±  7%      +3.6%     173948 ±  6%     +63.5%     274550 ±  4%  time.file_system_inputs
      1448 ±129%     +27.3%       1844 ±100%  +1.8e+06%   26321544 ± 10%  time.file_system_outputs
    183.50 ±  8%      +0.5%     184.38 ±  8%     +41.1%     259.00 ± 14%  time.involuntary_context_switches
     30.00 ± 36%     +18.3%      35.50 ± 26%    +178.3%      83.50 ± 15%  time.major_page_faults
     32.25 ±  3%      -0.4%      32.12 ±  3%     -62.4%      12.12 ±  2%  time.percent_of_cpu_this_job_got
      7.69            +0.5%       7.73           +81.5%      13.96 ±  8%  time.system_time
      2763            +1.0%       2790          +340.8%      12182 ± 53%  time.voluntary_context_switches
    129.00 ±173%      +0.0%     129.00 ±158%  +1.5e+06%    1975591 ± 77%  numa-vmstat.node0.nr_dirtied
      1.98 ±173%     +88.9%       3.75 ±100%  +5.8e+06%     114138 ± 77%  numa-vmstat.node0.nr_dirty
    232673 ± 34%      -8.1%     213788 ± 40%     -62.1%      88228 ± 71%  numa-vmstat.node0.nr_inactive_anon
    179908 ± 48%      -9.0%     163709 ± 54%     -83.5%      29620 ±163%  numa-vmstat.node0.nr_shmem
    129.00 ±173%      +0.0%     129.00 ±158%  +1.5e+06%    1973731 ± 77%  numa-vmstat.node0.nr_written
    232672 ± 34%      -8.1%     213788 ± 40%     -62.1%      88228 ± 71%  numa-vmstat.node0.nr_zone_inactive_anon
      1.98 ±173%     +88.9%       3.75 ±100%  +6.5e+06%     129180 ± 77%  numa-vmstat.node0.nr_zone_write_pending
     65.50 ±264%     +82.4%     119.50 ±173%    +2e+06%    1319971 ±130%  numa-vmstat.node1.nr_dirtied
      1.01 ±264%     -77.1%       0.23 ±173%  +6.8e+06%      69033 ±128%  numa-vmstat.node1.nr_dirty
     65.50 ±264%     +82.4%     119.50 ±173%    +2e+06%    1318090 ±130%  numa-vmstat.node1.nr_written
      1.01 ±264%     -77.1%       0.23 ±173%  +7.7e+06%      77967 ±128%  numa-vmstat.node1.nr_zone_write_pending
     74.75            -0.2%      74.62           -13.9%      64.38        turbostat.Avg_MHz
      1470            +0.2%       1473           -18.1%       1204        turbostat.Bzy_MHz
      0.06 ± 18%      +0.0        0.06 ±  7%      -0.0        0.02 ± 17%  turbostat.C1%
     36875 ± 21%      +3.6%      38186 ± 12%    +451.7%     203434 ±  9%  turbostat.C1E
      0.42 ± 21%      +0.0        0.46 ± 19%      +0.7        1.09 ±  2%  turbostat.C1E%
   3122931 ±  2%      +0.3%    3131982 ±  2%    +297.5%   12413912 ±  9%  turbostat.C6
     26.72            -0.5%      26.59           +16.3%      31.08        turbostat.CPU%c6
   3246456 ±  3%      +0.3%    3256271 ±  2%    +299.5%   12970394 ±  9%  turbostat.IRQ
      7312 ± 12%      -1.6%       7192 ± 10%    +292.6%      28708 ± 15%  turbostat.POLL
      6.59 ±  5%      -0.6%       6.55 ±  3%     -80.6%       1.28 ±  9%  turbostat.Pkg%pc6
     47.62 ±  2%      -0.3%      47.50 ±  2%      -9.4%      43.12 ±  3%  turbostat.PkgTmp
    105.43            +0.0%     105.43           -16.7%      87.80        turbostat.PkgWatt
    139.58            +0.0%     139.64            +3.9%     145.07        turbostat.RAMWatt
    191680 ± 14%      +2.0%     195562 ± 14%    +424.2%    1004862        meminfo.Active
     94579 ± 30%      +4.0%      98340 ± 28%     -73.5%      25035 ±  8%  meminfo.Active(anon)
     97100            +0.1%      97221          +909.1%     979827        meminfo.Active(file)
     88233 ± 21%      -9.0%      80309 ± 27%     +51.3%     133463 ± 12%  meminfo.AnonHugePages
   2581022            -0.1%    2578157           -32.8%    1733300        meminfo.Committed_AS
  12225536 ± 10%     -10.8%   10910208 ±  8%     -16.0%   10264832 ±  6%  meminfo.DirectMap2M
     11.99 ±129%     +27.4%      15.28 ±100%  +6.1e+06%     732687        meminfo.Dirty
   2893062            +0.4%    2905653           -31.4%    1985946        meminfo.Inactive
   1675361            +0.2%    1678558           -45.1%     919263        meminfo.Inactive(anon)
   1217700            +0.8%    1227094           -12.4%    1066683        meminfo.Inactive(file)
     72357            -1.4%      71366            -9.8%      65274        meminfo.KReclaimable
     72357            -1.4%      71366            -9.8%      65274        meminfo.SReclaimable
   1304118 ±  2%      +0.7%    1313050 ±  2%     -63.4%     477310        meminfo.Shmem
   5257348            +0.4%    5278613           -12.3%    4612286        meminfo.max_used_kB
     23543 ± 31%      +3.5%      24360 ± 29%     -73.4%       6259 ±  8%  proc-vmstat.nr_active_anon
     24275            +0.1%      24305          +908.9%     244901        proc-vmstat.nr_active_file
    194.50 ±129%     +27.8%     248.50 ±100%  +1.7e+06%    3295561 ± 10%  proc-vmstat.nr_dirtied
      3.00 ±129%     +27.4%       3.82 ±100%  +6.1e+06%     183006        proc-vmstat.nr_dirty
    654678            +0.7%     659180 ±  2%      -3.6%     630861        proc-vmstat.nr_file_pages
    418864            +0.2%     419675           -45.1%     229836        proc-vmstat.nr_inactive_anon
    304425            +0.8%     306774           -12.4%     266608        proc-vmstat.nr_inactive_file
    325947 ±  2%      +0.7%     328071 ±  2%     -63.4%     119329        proc-vmstat.nr_shmem
     18089            -1.4%      17842            -9.8%      16318        proc-vmstat.nr_slab_reclaimable
    194.50 ±129%     +27.8%     248.50 ±100%  +1.7e+06%    3291821 ± 10%  proc-vmstat.nr_written
     23543 ± 31%      +3.5%      24360 ± 29%     -73.4%       6259 ±  8%  proc-vmstat.nr_zone_active_anon
     24275            +0.1%      24305          +908.9%     244901        proc-vmstat.nr_zone_active_file
    418864            +0.2%     419675           -45.1%     229836        proc-vmstat.nr_zone_inactive_anon
    304425            +0.8%     306774           -12.4%     266607        proc-vmstat.nr_zone_inactive_file
      3.00 ±129%     +27.4%       3.82 ±100%  +6.9e+06%     207294        proc-vmstat.nr_zone_write_pending
   2014045            -0.0%    2013868           +18.1%    2378771 ±  8%  proc-vmstat.numa_hit
   2092945            -0.2%    2089285           +18.9%    2487814 ±  8%  proc-vmstat.pgalloc_normal
    530698            -0.3%     529025           +74.2%     924648 ±  5%  proc-vmstat.pgfault
   1967179            -0.2%    1963564           +21.2%    2383970 ±  8%  proc-vmstat.pgfree
    106252 ± 12%      +6.0%     112638 ± 15%     +47.2%     156450 ±  4%  proc-vmstat.pgpgin
    984.50 ±129%     +27.8%       1258 ±100%  +1.3e+06%   13197642 ± 10%  proc-vmstat.pgpgout
     59966            +0.6%      60297          +111.4%     126764 ±  6%  proc-vmstat.pgreuse
    432768            +0.3%     433920 ±  2%    +175.0%    1190016 ±  7%  proc-vmstat.unevictable_pgs_scanned
      2849 ±  4%      +0.9%       2874 ±  3%     +71.0%       4871 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.avg
     12480 ± 14%     +11.1%      13863 ± 16%    +108.2%      25988 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.max
      2134 ±  8%     +11.5%       2378 ± 10%    +129.8%       4903 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      2090 ± 27%    +247.0%       7252 ±129%    +969.9%      22363 ± 25%  sched_debug.cfs_rq:/.load.avg
     42942 ± 19%   +1232.7%     572286 ±157%   +1252.5%     580785 ± 15%  sched_debug.cfs_rq:/.load.max
      7190 ± 15%    +730.7%      59735 ±151%   +1285.7%      99641 ± 11%  sched_debug.cfs_rq:/.load.stddev
      2849 ±  4%      +0.9%       2874 ±  3%     +71.0%       4871 ±  7%  sched_debug.cfs_rq:/.min_vruntime.avg
     12480 ± 14%     +11.1%      13863 ± 16%    +108.2%      25988 ± 20%  sched_debug.cfs_rq:/.min_vruntime.max
      2134 ±  8%     +11.5%       2378 ± 10%    +129.8%       4903 ± 18%  sched_debug.cfs_rq:/.min_vruntime.stddev
    275.48 ± 12%      +0.2%     275.96 ± 10%     -66.2%      93.00 ±  8%  sched_debug.cfs_rq:/.runnable_avg.avg
      1115 ±  8%     +16.2%       1295 ± 34%     -33.3%     743.62 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
    300.10 ±  8%      +1.3%     303.91 ± 10%     -49.5%     151.64 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
    274.79 ± 12%      +0.2%     275.37 ± 10%     -66.2%      92.81 ±  8%  sched_debug.cfs_rq:/.util_avg.avg
      1115 ±  8%     +16.0%       1293 ± 35%     -33.3%     743.50 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    299.89 ±  8%      +1.2%     303.64 ± 10%     -49.5%     151.59 ±  6%  sched_debug.cfs_rq:/.util_avg.stddev
     21.35 ± 25%      -3.0%      20.72 ± 26%     -73.0%       5.75 ± 28%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    775.25 ±  5%      -0.7%     770.12 ±  5%     -74.9%     194.58 ± 16%  sched_debug.cfs_rq:/.util_est_enqueued.max
    102.38 ± 10%      -0.3%     102.05 ±  9%     -71.3%      29.41 ± 17%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    855063            +3.5%     884874 ±  4%     +12.4%     960673 ±  2%  sched_debug.cpu.avg_idle.avg
     18728 ±150%     -82.2%       3331 ± 12%    +907.5%     188692 ± 82%  sched_debug.cpu.avg_idle.min
    212945 ± 10%     +10.8%     235966 ± 21%     -29.8%     149561 ± 28%  sched_debug.cpu.avg_idle.stddev
     40520            +1.5%      41139          +117.9%      88278        sched_debug.cpu.clock.avg
     40525            +1.5%      41145          +117.8%      88283        sched_debug.cpu.clock.max
     40515            +1.5%      41131          +117.9%      88270        sched_debug.cpu.clock.min
      2.83 ±  7%     +13.9%       3.22 ± 14%     +24.5%       3.52 ± 10%  sched_debug.cpu.clock.stddev
     40379            +1.5%      40998          +114.2%      86506        sched_debug.cpu.clock_task.avg
     40501            +1.5%      41121          +114.7%      86938        sched_debug.cpu.clock_task.max
     34556            +1.7%      35142          +133.6%      80726        sched_debug.cpu.clock_task.min
    195.72 ± 23%     -19.6%     157.37 ± 23%     -43.6%     110.31 ± 11%  sched_debug.cpu.curr->pid.avg
      2309            -0.2%       2305          +114.0%       4942        sched_debug.cpu.curr->pid.max
      0.09 ± 22%     -10.1%       0.08 ± 23%     -58.9%       0.04 ± 11%  sched_debug.cpu.nr_running.avg
      0.28 ± 10%      +3.1%       0.29 ± 21%     -40.0%       0.17 ±  6%  sched_debug.cpu.nr_running.stddev
      1014            +0.7%       1021 ±  2%    +102.2%       2051 ±  2%  sched_debug.cpu.nr_switches.avg
      7377 ±  9%      +7.5%       7933 ± 11%    +131.7%      17090 ± 21%  sched_debug.cpu.nr_switches.max
    191.12 ± 11%      +0.2%     191.50 ± 11%    +147.2%     472.46 ±  7%  sched_debug.cpu.nr_switches.min
      1164 ±  3%      +5.9%       1232 ±  8%    +110.7%       2452 ± 11%  sched_debug.cpu.nr_switches.stddev
      0.11 ± 23%      +5.7%       0.12 ± 20%     -53.6%       0.05 ±  9%  sched_debug.cpu.nr_uninterruptible.avg
     40515            +1.5%      41135          +117.9%      88272        sched_debug.cpu_clk
     39837            +1.6%      40456          +119.9%      87593        sched_debug.ktime
     41089            +1.5%      41708          +116.2%      88851        sched_debug.sched_clk
      2.21 ±  3%      -0.5%       2.19 ±  2%    +128.6%       5.04 ±  2%  perf-stat.i.MPKI
 6.009e+08 ±  2%      +0.0%  6.011e+08 ±  2%     -46.1%  3.239e+08 ±  3%  perf-stat.i.branch-instructions
      6.64 ±  2%      -0.1        6.58            +1.8        8.48        perf-stat.i.branch-miss-rate%
  28890620 ±  2%      -0.4%   28767993 ±  2%     -28.2%   20748177 ±  2%  perf-stat.i.branch-misses
      5.12            +0.1        5.19 ±  2%      +1.0        6.13        perf-stat.i.cache-miss-rate%
   3328878 ±  2%      +0.3%    3340174 ±  4%     +37.3%    4569842        perf-stat.i.cache-misses
  72235652            -0.4%   71969002            +5.8%   76442268        perf-stat.i.cache-references
      4.08 ±  3%      -1.0%       4.04 ±  2%     +34.6%       5.50        perf-stat.i.cpi
 5.971e+09            -0.1%  5.966e+09           -11.2%  5.305e+09        perf-stat.i.cpu-cycles
      1895 ±  2%      -0.5%       1886 ±  3%     -30.4%       1320        perf-stat.i.cycles-between-cache-misses
      0.64 ±  4%      +0.0        0.64 ±  2%      +0.2        0.82        perf-stat.i.dTLB-load-miss-rate%
 7.051e+08 ±  2%      +0.3%  7.075e+08 ±  2%     -42.7%  4.042e+08 ±  2%  perf-stat.i.dTLB-loads
      0.10 ±  3%      -0.0        0.10 ±  2%      +0.0        0.15        perf-stat.i.dTLB-store-miss-rate%
    174095            -0.5%     173203            +5.6%     183864        perf-stat.i.dTLB-store-misses
 3.368e+08 ±  2%      +0.1%  3.371e+08 ±  2%     -42.1%  1.949e+08 ±  2%  perf-stat.i.dTLB-stores
     75.49            +0.1       75.62            -2.4       73.10        perf-stat.i.iTLB-load-miss-rate%
   1683333            +1.9%    1716111           -46.0%     908223        perf-stat.i.iTLB-load-misses
    512968 ±  2%      -0.3%     511618 ±  3%     -31.0%     354038 ±  2%  perf-stat.i.iTLB-loads
 2.936e+09 ±  2%      +0.0%  2.936e+09 ±  2%     -45.1%  1.611e+09 ±  3%  perf-stat.i.instructions
      1922 ±  2%      -0.6%       1910 ±  2%     -17.9%       1578 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      0.45 ±  2%      +0.2%       0.45 ±  2%     -37.8%       0.28 ±  3%  perf-stat.i.ipc
      1.50 ± 24%     +20.8%       1.81 ± 22%     -41.7%       0.87 ± 25%  perf-stat.i.major-faults
      0.06            -0.1%       0.06           -11.1%       0.06        perf-stat.i.metric.GHz
      1000 ±  4%      +0.4%       1004           -14.6%     854.42        perf-stat.i.metric.K/sec
     16.83 ±  2%      +0.1%      16.86 ±  2%     -43.2%       9.56 ±  3%  perf-stat.i.metric.M/sec
      9106 ±  2%      -0.2%       9085           -43.2%       5173 ±  2%  perf-stat.i.minor-faults
     62.84 ±  3%      -0.8       62.06 ±  5%     -29.6       33.21 ± 15%  perf-stat.i.node-load-miss-rate%
    165307 ±  7%      -0.1%     165087 ± 13%     -36.6%     104750 ± 16%  perf-stat.i.node-load-misses
    117117 ±  5%     +10.7%     129687 ± 10%    +139.0%     279953 ±  7%  perf-stat.i.node-loads
     35.14 ±  9%      +1.2       36.30 ± 12%      +9.4       44.53 ±  7%  perf-stat.i.node-store-miss-rate%
     72618 ± 17%      +0.8%      73224 ± 21%     -28.5%      51929 ± 14%  perf-stat.i.node-store-misses
    206923 ±  5%      -0.1%     206735 ±  4%     -58.7%      85508 ±  3%  perf-stat.i.node-stores
      9107 ±  2%      -0.2%       9087           -43.2%       5174 ±  2%  perf-stat.i.page-faults
      1.13            +0.3%       1.14 ±  3%    +150.3%       2.84 ±  4%  perf-stat.overall.MPKI
      4.81            -0.0        4.79            +1.6        6.41        perf-stat.overall.branch-miss-rate%
      4.61 ±  2%      +0.0        4.64 ±  3%      +1.4        5.98        perf-stat.overall.cache-miss-rate%
      2.04            -0.1%       2.03 ±  2%     +61.9%       3.30 ±  3%  perf-stat.overall.cpi
      1795 ±  2%      -0.3%       1789 ±  3%     -35.3%       1161        perf-stat.overall.cycles-between-cache-misses
      0.28 ±  5%      +0.0        0.28 ±  3%      +0.2        0.50 ±  2%  perf-stat.overall.dTLB-load-miss-rate%
      0.05 ±  2%      -0.0        0.05 ±  2%      +0.0        0.09 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
     76.64            +0.4       77.03            -4.7       71.96        perf-stat.overall.iTLB-load-miss-rate%
      0.49            +0.1%       0.49 ±  2%     -38.2%       0.30 ±  3%  perf-stat.overall.ipc
     58.48 ±  5%      -2.6       55.89 ±  9%     -31.2       27.26 ± 17%  perf-stat.overall.node-load-miss-rate%
     25.92 ± 15%      +0.1       26.01 ± 15%     +11.7       37.63 ± 10%  perf-stat.overall.node-store-miss-rate%
 5.813e+08 ±  2%      +0.0%  5.815e+08 ±  2%     -44.7%  3.213e+08 ±  3%  perf-stat.ps.branch-instructions
  27939741 ±  2%      -0.4%   27826599 ±  2%     -26.4%   20576533 ±  2%  perf-stat.ps.branch-misses
   3221782 ±  2%      +0.3%    3231854 ±  4%     +40.7%    4533093        perf-stat.ps.cache-misses
  69938597            -0.4%   69681562            +8.4%   75843033        perf-stat.ps.cache-references
     92982            +0.0%      92989            +2.4%      95256        perf-stat.ps.cpu-clock
  5.78e+09            -0.1%  5.775e+09            -8.9%  5.263e+09        perf-stat.ps.cpu-cycles
    103.05            +0.8%     103.93            +2.3%     105.41        perf-stat.ps.cpu-migrations
   1916503 ±  3%      +0.9%    1933906 ±  2%      +5.9%    2029268        perf-stat.ps.dTLB-load-misses
 6.821e+08 ±  2%      +0.3%  6.844e+08 ±  2%     -41.2%   4.01e+08 ±  2%  perf-stat.ps.dTLB-loads
    168609            -0.5%     167728            +8.2%     182435        perf-stat.ps.dTLB-store-misses
 3.259e+08 ±  2%      +0.1%  3.262e+08 ±  2%     -40.7%  1.934e+08 ±  2%  perf-stat.ps.dTLB-stores
   1629134            +1.9%    1660586           -44.7%     901343        perf-stat.ps.iTLB-load-misses
    496618 ±  2%      -0.3%     495298 ±  3%     -29.3%     351320 ±  2%  perf-stat.ps.iTLB-loads
  2.84e+09 ±  2%      +0.0%   2.84e+09 ±  2%     -43.7%  1.599e+09 ±  3%  perf-stat.ps.instructions
      8819 ±  2%      -0.3%       8795           -41.8%       5134 ±  2%  perf-stat.ps.minor-faults
    160094 ±  7%      -0.2%     159763 ± 13%     -35.1%     103957 ± 16%  perf-stat.ps.node-load-misses
    113333 ±  5%     +10.7%     125467 ± 10%    +145.0%     277701 ±  7%  perf-stat.ps.node-loads
    200102 ±  5%      -0.1%     199844 ±  4%     -57.6%      84829 ±  3%  perf-stat.ps.node-stores
      8821 ±  2%      -0.3%       8797           -41.8%       5135 ±  2%  perf-stat.ps.page-faults
     92982            +0.0%      92989            +2.4%      95256        perf-stat.ps.task-clock
 8.993e+10            +0.0%  8.995e+10          +130.2%   2.07e+11 ±  5%  perf-stat.total.instructions
     13.07 ± 42%      -5.6        7.44 ±102%     -13.1        0.00        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.07 ± 42%      -5.6        7.44 ±102%     -13.1        0.00        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.24 ± 81%      -4.7        0.57 ±264%      -5.2        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.24 ± 81%      -4.7        0.57 ±264%      -5.2        0.00        perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.55 ± 80%      -4.5        0.00            -4.5        0.00        perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.55 ± 80%      -4.5        0.00            -4.5        0.00        perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      4.37 ±102%      -4.4        0.00            -4.4        0.00        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter
      3.85 ±101%      -3.9        0.00            -3.9        0.00        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault
      4.24 ± 83%      -3.0        1.19 ±173%      -4.2        0.00        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      7.06 ± 61%      -1.4        5.68 ± 93%      -7.1        0.00        perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      1.14 ±264%      -1.1        0.00            +9.5       10.68 ±  4%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.52 ±264%      -0.5        0.00           +18.8       19.37 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.52 ±264%      -0.5        0.00           +21.9       22.42 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.0        0.00            +0.6        0.62 ±  9%  perf-profile.calltrace.cycles-pp.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.7        0.69 ± 11%  perf-profile.calltrace.cycles-pp.arch_scale_freq_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.7        0.70 ± 10%  perf-profile.calltrace.cycles-pp.timerqueue_add.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.7        0.73 ± 10%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.rebalance_domains.__do_softirq
      0.00            +0.0        0.00            +0.7        0.74 ±  5%  perf-profile.calltrace.cycles-pp.update_rq_clock_task.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.7        0.74 ± 14%  perf-profile.calltrace.cycles-pp.timerqueue_del.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.7        0.75 ± 10%  perf-profile.calltrace.cycles-pp.rcu_pending.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.8        0.76 ±  7%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.8        0.78 ± 13%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.8        0.80 ± 10%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu
      0.00            +0.0        0.00            +0.9        0.92 ±  7%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.00            +0.0        0.00            +1.0        0.98 ± 15%  perf-profile.calltrace.cycles-pp.__clear_extent_bit.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +0.0        0.00            +1.0        1.05 ± 18%  perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter
      0.00            +0.0        0.00            +1.1        1.14 ±  8%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +0.0        0.00            +1.2        1.15 ±  9%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.2        1.17 ±  5%  perf-profile.calltrace.cycles-pp.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.3        1.28 ± 15%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +0.0        0.00            +1.3        1.30 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +0.0        0.00            +1.5        1.51 ± 26%  perf-profile.calltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc
      0.00            +0.0        0.00            +1.6        1.58 ±  8%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.7        1.66 ±  7%  perf-profile.calltrace.cycles-pp.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +1.7        1.72 ± 25%  perf-profile.calltrace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.calltrace.cycles-pp.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.calltrace.cycles-pp.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops
      0.00            +0.0        0.00            +1.8        1.77 ± 25%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.8        1.77 ± 25%  perf-profile.calltrace.cycles-pp.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +1.8        1.81 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.0        0.00            +1.9        1.90 ± 12%  perf-profile.calltrace.cycles-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +0.0        0.00            +2.6        2.57 ±  5%  perf-profile.calltrace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.0        0.00            +3.0        3.02 ±  6%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.0        0.00            +3.9        3.88 ±  3%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.0        0.00            +5.8        5.82 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +0.0        0.00            +5.9        5.90 ± 15%  perf-profile.calltrace.cycles-pp.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00           +12.8       12.78 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.0        0.00           +13.0       13.00 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      8.06 ±147%      +3.8       11.85 ±110%      -8.1        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.06 ±147%      +3.8       11.85 ±110%      -8.1        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.06 ±147%      +3.8       11.85 ±110%      -8.1        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      8.06 ±147%      +3.8       11.85 ±110%      -8.1        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      8.06 ±147%      +9.1       17.20 ± 63%      -8.1        0.00        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      8.06 ±147%      +9.1       17.20 ± 63%      -8.1        0.00        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.get_signal
      8.06 ±147%      +9.5       17.52 ± 61%      -8.1        0.00        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      8.06 ±147%      +9.5       17.52 ± 61%      -8.1        0.00        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      8.06 ±147%      +9.5       17.52 ± 61%      -8.1        0.00        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      8.06 ±147%      +9.5       17.52 ± 61%      -8.1        0.00        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      8.06 ±147%     +11.6       19.64 ± 66%      -8.1        0.00        perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
      8.06 ±147%     +11.6       19.64 ± 66%      -8.1        0.00        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      9.62 ±116%     +13.4       23.01 ± 42%      -9.6        0.00        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     13.07 ± 42%      -5.6        7.44 ±102%     -13.1        0.00        perf-profile.children.cycles-pp.shmem_file_write_iter
     13.07 ± 42%      -5.6        7.44 ±102%     -13.1        0.00        perf-profile.children.cycles-pp.generic_perform_write
      5.24 ± 81%      -5.2        0.00            -5.2        0.06 ± 44%  perf-profile.children.cycles-pp.path_openat
      5.24 ± 81%      -5.2        0.00            -5.2        0.06 ± 44%  perf-profile.children.cycles-pp.do_filp_open
      5.15 ±112%      -5.2        0.00            -5.1        0.02 ±129%  perf-profile.children.cycles-pp.link_path_walk
      5.24 ± 81%      -4.7        0.57 ±264%      -5.2        0.06 ± 44%  perf-profile.children.cycles-pp.do_sys_openat2
      5.24 ± 81%      -4.7        0.57 ±264%      -5.2        0.07 ± 45%  perf-profile.children.cycles-pp.__x64_sys_openat
      4.24 ± 83%      -3.0        1.19 ±173%      -4.2        0.05 ± 83%  perf-profile.children.cycles-pp.fault_in_readable
      4.24 ± 83%      -3.0        1.19 ±173%      -4.2        0.05 ± 85%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      1.66 ±188%      -1.7        0.00           +18.0       19.67 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.66 ±188%      -1.7        0.00           +19.7       21.38 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.14 ±264%      -1.1        0.00            +9.8       10.89 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.14 ±264%      -1.1        0.00           +11.8       12.98 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.14 ±264%      -1.1        0.00           +12.0       13.18 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      3.96 ±103%      -0.8        3.12 ±210%      -3.8        0.15 ± 25%  perf-profile.children.cycles-pp.__schedule
      0.00            +0.0        0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.btrfs_reserve_data_bytes
      0.00            +0.0        0.00            +0.1        0.09 ± 50%  perf-profile.children.cycles-pp.irq_work_run_list
      0.00            +0.0        0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.btrfs_calculate_inode_block_rsv_size
      0.00            +0.0        0.00            +0.1        0.09 ± 26%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.0        0.00            +0.1        0.09 ± 27%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.00            +0.0        0.00            +0.1        0.09 ± 26%  perf-profile.children.cycles-pp.rcu_needs_cpu
      0.00            +0.0        0.00            +0.1        0.09 ± 39%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.00            +0.0        0.00            +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.0        0.00            +0.1        0.10 ± 38%  perf-profile.children.cycles-pp.btrfs_reserve_metadata_bytes
      0.00            +0.0        0.00            +0.1        0.10 ± 33%  perf-profile.children.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.0        0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.00            +0.0        0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.process_one_work
      0.00            +0.0        0.00            +0.1        0.10 ± 26%  perf-profile.children.cycles-pp.update_rt_rq_load_avg
      0.00            +0.0        0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.0        0.00            +0.1        0.11 ± 43%  perf-profile.children.cycles-pp.btrfs_merge_delalloc_extent
      0.00            +0.0        0.00            +0.1        0.11 ± 27%  perf-profile.children.cycles-pp.task_tick_idle
      0.00            +0.0        0.00            +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.00            +0.0        0.00            +0.1        0.11 ± 29%  perf-profile.children.cycles-pp.btrfs_delalloc_release_extents
      0.00            +0.0        0.00            +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.free_extent_state
      0.00            +0.0        0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.0        0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.0        0.00            +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.trigger_load_balance
      0.00            +0.0        0.00            +0.1        0.12 ± 43%  perf-profile.children.cycles-pp.merge_prev_state
      0.00            +0.0        0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.account_process_tick
      0.00            +0.0        0.00            +0.1        0.13 ± 27%  perf-profile.children.cycles-pp.find_lock_delalloc_range
      0.00            +0.0        0.00            +0.1        0.13 ± 25%  perf-profile.children.cycles-pp.rw_verify_area
      0.00            +0.0        0.00            +0.1        0.13 ± 21%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.0        0.00            +0.1        0.13 ± 25%  perf-profile.children.cycles-pp.workingset_activation
      0.00            +0.0        0.00            +0.1        0.13 ± 33%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.00            +0.0        0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.btrfs_set_delalloc_extent
      0.00            +0.0        0.00            +0.1        0.13 ± 24%  perf-profile.children.cycles-pp.ct_irq_enter
      0.00            +0.0        0.00            +0.1        0.13 ± 28%  perf-profile.children.cycles-pp.tick_program_event
      0.00            +0.0        0.00            +0.1        0.14 ± 20%  perf-profile.children.cycles-pp.btrfs_check_data_free_space
      0.00            +0.0        0.00            +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.0        0.00            +0.1        0.14 ± 29%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.00            +0.0        0.00            +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.0        0.00            +0.1        0.14 ± 28%  perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.0        0.00            +0.1        0.14 ± 19%  perf-profile.children.cycles-pp.folio_activate_fn
      0.00            +0.0        0.00            +0.1        0.14 ± 22%  perf-profile.children.cycles-pp.should_we_balance
      0.00            +0.0        0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.exec_mmap
      0.00            +0.0        0.00            +0.1        0.15 ± 23%  perf-profile.children.cycles-pp.xas_descend
      0.00            +0.0        0.00            +0.1        0.15 ± 28%  perf-profile.children.cycles-pp.btrfs_set_extent_delalloc
      0.00            +0.0        0.00            +0.1        0.15 ± 31%  perf-profile.children.cycles-pp.set_state_bits
      0.00            +0.0        0.00            +0.2        0.15 ± 22%  perf-profile.children.cycles-pp.begin_new_exec
      0.00            +0.0        0.00            +0.2        0.15 ± 18%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.0        0.00            +0.2        0.16 ± 13%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.00            +0.0        0.00            +0.2        0.16 ± 26%  perf-profile.children.cycles-pp.__reserve_bytes
      0.00            +0.0        0.00            +0.2        0.16 ± 24%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.00            +0.2        0.16 ± 17%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.2        0.17 ± 27%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.00            +0.0        0.00            +0.2        0.17 ± 11%  perf-profile.children.cycles-pp.native_apic_mem_eoi
      0.00            +0.0        0.00            +0.2        0.17 ± 22%  perf-profile.children.cycles-pp.lock_extent
      0.00            +0.0        0.00            +0.2        0.17 ± 13%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.00            +0.0        0.00            +0.2        0.17 ± 30%  perf-profile.children.cycles-pp.btrfs_get_extent
      0.00            +0.0        0.00            +0.2        0.17 ± 28%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.0        0.00            +0.2        0.18 ± 19%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.0        0.00            +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.task_tick_mm_cid
      0.00            +0.0        0.00            +0.2        0.18 ± 14%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.00            +0.0        0.00            +0.2        0.18 ± 25%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.00            +0.2        0.19 ± 13%  perf-profile.children.cycles-pp.menu_reflect
      0.00            +0.0        0.00            +0.2        0.19 ± 30%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.0        0.00            +0.2        0.20 ± 19%  perf-profile.children.cycles-pp.writepage_delalloc
      0.00            +0.0        0.00            +0.2        0.20 ± 14%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.00            +0.2        0.20 ± 14%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.00            +0.0        0.00            +0.2        0.20 ± 19%  perf-profile.children.cycles-pp.leave_mm
      0.00            +0.0        0.00            +0.2        0.20 ± 24%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.00            +0.2        0.22 ± 22%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.00            +0.0        0.00            +0.2        0.22 ± 23%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.00            +0.0        0.00            +0.2        0.23 ± 20%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.2        0.23 ± 21%  perf-profile.children.cycles-pp.filemap_get_entry
      0.00            +0.0        0.00            +0.2        0.23 ± 15%  perf-profile.children.cycles-pp.btrfs_set_range_writeback
      0.00            +0.0        0.00            +0.2        0.23 ± 12%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.2        0.24 ± 20%  perf-profile.children.cycles-pp.lock_and_cleanup_extent_if_need
      0.00            +0.0        0.00            +0.2        0.24 ± 22%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.2        0.24 ± 22%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.0        0.00            +0.2        0.24 ± 29%  perf-profile.children.cycles-pp.clear_state_bit
      0.00            +0.0        0.00            +0.2        0.25 ± 16%  perf-profile.children.cycles-pp.get_cpu_device
      0.00            +0.0        0.00            +0.3        0.25 ± 17%  perf-profile.children.cycles-pp.irq_work_tick
      0.00            +0.0        0.00            +0.3        0.26 ± 19%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.0        0.00            +0.3        0.26 ± 20%  perf-profile.children.cycles-pp.folio_end_writeback
      0.00            +0.0        0.00            +0.3        0.27 ± 27%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.00            +0.0        0.00            +0.3        0.28 ± 18%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.00            +0.0        0.00            +0.3        0.28 ± 15%  perf-profile.children.cycles-pp.set_extent_bit
      0.00            +0.0        0.00            +0.3        0.28 ± 20%  perf-profile.children.cycles-pp.folio_activate
      0.00            +0.0        0.00            +0.3        0.30 ± 10%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.3        0.32 ± 12%  perf-profile.children.cycles-pp.check_cpu_stall
      0.00            +0.0        0.00            +0.3        0.32 ± 11%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.00            +0.0        0.00            +0.3        0.32 ± 19%  perf-profile.children.cycles-pp.__btrfs_bio_end_io
      0.00            +0.0        0.00            +0.3        0.32 ± 19%  perf-profile.children.cycles-pp.end_bio_extent_writepage
      0.00            +0.0        0.00            +0.3        0.33 ± 20%  perf-profile.children.cycles-pp.blk_update_request
      0.00            +0.0        0.00            +0.3        0.33 ± 18%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.00            +0.3        0.33 ± 20%  perf-profile.children.cycles-pp.scsi_io_completion
      0.00            +0.0        0.00            +0.3        0.33 ± 20%  perf-profile.children.cycles-pp.scsi_end_request
      0.00            +0.0        0.00            +0.3        0.34 ± 20%  perf-profile.children.cycles-pp.blk_complete_reqs
      0.00            +0.0        0.00            +0.3        0.34 ± 17%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.4        0.35 ± 20%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.4        0.38 ± 23%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.00            +0.0        0.00            +0.4        0.38 ± 24%  perf-profile.children.cycles-pp.btrfs_delalloc_reserve_metadata
      0.00            +0.0        0.00            +0.4        0.39 ± 16%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.0        0.00            +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.0        0.00            +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.4        0.41 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +0.4        0.42 ±  6%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.0        0.00            +0.4        0.42 ±  7%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.00            +0.0        0.00            +0.4        0.43 ± 11%  perf-profile.children.cycles-pp.__set_extent_bit
      0.00            +0.0        0.00            +0.4        0.44 ± 14%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.00            +0.0        0.00            +0.4        0.44 ±  8%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.4        0.44 ±  8%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.00            +0.0        0.00            +0.4        0.44 ± 26%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.00            +0.0        0.00            +0.5        0.45 ± 11%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.0        0.00            +0.5        0.47 ± 18%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.00            +0.0        0.00            +0.5        0.48 ± 11%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.0        0.00            +0.5        0.49 ± 10%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.0        0.00            +0.6        0.55 ±  8%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.0        0.00            +0.6        0.56 ± 13%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.0        0.00            +0.6        0.57 ± 10%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.6        0.58 ± 16%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.0        0.00            +0.6        0.58 ± 10%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.0        0.00            +0.6        0.59 ±  6%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.6        0.59 ±  9%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.0        0.00            +0.6        0.60 ± 13%  perf-profile.children.cycles-pp.run_posix_cpu_timers
      0.00            +0.0        0.00            +0.6        0.61 ±  8%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.00            +0.6        0.63 ± 10%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.00            +0.0        0.00            +0.7        0.66 ± 11%  perf-profile.children.cycles-pp.ct_idle_exit
      0.00            +0.0        0.00            +0.7        0.70 ± 17%  perf-profile.children.cycles-pp.prepare_pages
      0.00            +0.0        0.00            +0.7        0.71 ± 12%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.0        0.00            +0.7        0.72 ± 17%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.00            +0.0        0.00            +0.7        0.72 ± 17%  perf-profile.children.cycles-pp.pagecache_get_page
      0.00            +0.0        0.00            +0.7        0.73 ± 11%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.0        0.00            +0.8        0.76 ± 10%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.0        0.00            +0.8        0.76 ± 14%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.0        0.00            +0.8        0.79 ± 18%  perf-profile.children.cycles-pp.alloc_extent_state
      0.00            +0.0        0.00            +0.8        0.81 ±  7%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.8        0.81 ± 14%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.0        0.00            +0.8        0.83 ±  4%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.00            +0.8        0.84 ±  7%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.00            +0.9        0.93 ±  6%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.00            +1.2        1.19 ±  6%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +1.2        1.21 ± 12%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.0        0.00            +1.2        1.25 ±  7%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.00            +1.3        1.30 ± 15%  perf-profile.children.cycles-pp.btrfs_copy_from_user
      0.00            +0.0        0.00            +1.3        1.30 ± 30%  perf-profile.children.cycles-pp.__extent_writepage_io
      0.00            +0.0        0.00            +1.4        1.42 ± 17%  perf-profile.children.cycles-pp.__clear_extent_bit
      0.00            +0.0        0.00            +1.5        1.51 ± 26%  perf-profile.children.cycles-pp.__extent_writepage
      0.00            +0.0        0.00            +1.6        1.60 ±  8%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.0        0.00            +1.7        1.68 ±  7%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +0.0        0.00            +1.7        1.72 ± 24%  perf-profile.children.cycles-pp.start_ordered_ops
      0.00            +0.0        0.00            +1.7        1.72 ± 25%  perf-profile.children.cycles-pp.extent_writepages
      0.00            +0.0        0.00            +1.7        1.72 ± 25%  perf-profile.children.cycles-pp.extent_write_cache_pages
      0.00            +0.0        0.00            +1.7        1.73 ± 24%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      0.00            +0.0        0.00            +1.7        1.73 ± 24%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      0.00            +0.0        0.00            +1.7        1.73 ± 24%  perf-profile.children.cycles-pp.do_writepages
      0.00            +0.0        0.00            +1.8        1.77 ± 25%  perf-profile.children.cycles-pp.__x64_sys_fsync
      0.00            +0.0        0.00            +1.8        1.77 ± 25%  perf-profile.children.cycles-pp.btrfs_sync_file
      0.00            +0.0        0.00            +1.9        1.86 ±  7%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.0        0.00            +1.9        1.90 ± 12%  perf-profile.children.cycles-pp.btrfs_dirty_pages
      0.00            +0.0        0.00            +2.9        2.94 ±  4%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.0        0.00            +3.3        3.30 ±  6%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.0        0.00            +4.0        3.97 ±  3%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.0        0.00            +5.8        5.84 ± 15%  perf-profile.children.cycles-pp.btrfs_buffered_write
      0.00            +0.0        0.00            +5.9        5.90 ± 15%  perf-profile.children.cycles-pp.btrfs_do_write_iter
      0.00            +0.6        0.57 ±264%      +0.1        0.10 ± 35%  perf-profile.children.cycles-pp.dup_mmap
      0.00            +0.6        0.57 ±264%      +0.1        0.13 ± 31%  perf-profile.children.cycles-pp.dup_mm
      0.00            +0.6        0.57 ±264%      +0.2        0.16 ± 19%  perf-profile.children.cycles-pp.copy_process
      0.00            +0.6        0.57 ±264%      +0.6        0.64 ± 11%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.7        0.66 ±264%      +0.3        0.29 ± 24%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.9        0.89 ±264%      +0.8        0.80 ± 18%  perf-profile.children.cycles-pp.kmem_cache_alloc
      3.85 ±101%      +3.9        7.78 ±174%      -3.8        0.03 ±130%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      8.06 ±147%     +11.6       19.64 ± 66%      -8.1        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      8.06 ±147%     +11.6       19.64 ± 66%      -8.1        0.00        perf-profile.children.cycles-pp.arch_do_signal_or_restart
      8.06 ±147%     +11.6       19.64 ± 66%      -8.1        0.00        perf-profile.children.cycles-pp.get_signal
      8.06 ±147%     +11.6       19.64 ± 66%      -8.0        0.01 ±264%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      3.85 ±101%      -3.9        0.00            -3.8        0.02 ±175%  perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      0.00            +0.0        0.00            +0.1        0.08 ± 26%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.00            +0.0        0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.0        0.00            +0.1        0.08 ± 30%  perf-profile.self.cycles-pp.irq_work_run_list
      0.00            +0.0        0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.00            +0.0        0.00            +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.0        0.00            +0.1        0.09 ± 24%  perf-profile.self.cycles-pp.trigger_load_balance
      0.00            +0.0        0.00            +0.1        0.09 ± 27%  perf-profile.self.cycles-pp.__fsnotify_parent
      0.00            +0.0        0.00            +0.1        0.09 ± 26%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.0        0.00            +0.1        0.09 ± 38%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.00            +0.0        0.00            +0.1        0.09 ± 31%  perf-profile.self.cycles-pp.ct_irq_enter
      0.00            +0.0        0.00            +0.1        0.09 ± 25%  perf-profile.self.cycles-pp.rcu_needs_cpu
      0.00            +0.0        0.00            +0.1        0.10 ± 31%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.0        0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.tick_nohz_irq_exit
      0.00            +0.0        0.00            +0.1        0.10 ± 27%  perf-profile.self.cycles-pp.local_clock_noinstr
      0.00            +0.0        0.00            +0.1        0.10 ± 33%  perf-profile.self.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.0        0.00            +0.1        0.10 ± 24%  perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.00            +0.0        0.00            +0.1        0.10 ± 24%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.0        0.00            +0.1        0.10 ± 26%  perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.00            +0.0        0.00            +0.1        0.10 ± 17%  perf-profile.self.cycles-pp.ct_nmi_exit
      0.00            +0.0        0.00            +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.00            +0.1        0.10 ± 15%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.0        0.00            +0.1        0.11 ± 23%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.0        0.00            +0.1        0.11 ± 28%  perf-profile.self.cycles-pp.task_tick_idle
      0.00            +0.0        0.00            +0.1        0.11 ± 23%  perf-profile.self.cycles-pp.free_extent_state
      0.00            +0.0        0.00            +0.1        0.11 ± 28%  perf-profile.self.cycles-pp.clockevents_program_event
      0.00            +0.0        0.00            +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.sched_clock
      0.00            +0.0        0.00            +0.1        0.12 ± 22%  perf-profile.self.cycles-pp.ct_idle_exit
      0.00            +0.0        0.00            +0.1        0.12 ± 28%  perf-profile.self.cycles-pp.account_process_tick
      0.00            +0.0        0.00            +0.1        0.12 ± 25%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.00            +0.0        0.00            +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.0        0.00            +0.1        0.12 ± 28%  perf-profile.self.cycles-pp.tick_program_event
      0.00            +0.0        0.00            +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.0        0.00            +0.1        0.13 ± 26%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.1        0.13 ± 20%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.00            +0.0        0.00            +0.1        0.13 ± 27%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.00            +0.0        0.00            +0.1        0.13 ± 30%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.0        0.00            +0.1        0.14 ± 19%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.00            +0.1        0.14 ± 26%  perf-profile.self.cycles-pp.xas_descend
      0.00            +0.0        0.00            +0.1        0.14 ± 27%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.0        0.00            +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.00            +0.1        0.15 ± 23%  perf-profile.self.cycles-pp.btrfs_delalloc_reserve_metadata
      0.00            +0.0        0.00            +0.1        0.15 ± 31%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.00            +0.0        0.00            +0.2        0.15 ± 25%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.0        0.00            +0.2        0.15 ± 15%  perf-profile.self.cycles-pp.menu_reflect
      0.00            +0.0        0.00            +0.2        0.16 ± 19%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.0        0.00            +0.2        0.16 ± 16%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.00            +0.0        0.00            +0.2        0.16 ± 25%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.0        0.00            +0.2        0.16 ± 24%  perf-profile.self.cycles-pp.ct_nmi_enter
      0.00            +0.0        0.00            +0.2        0.16 ± 23%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.0        0.00            +0.2        0.16 ± 21%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.0        0.00            +0.2        0.16 ± 11%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.00            +0.0        0.00            +0.2        0.17 ± 15%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.0        0.00            +0.2        0.17 ± 13%  perf-profile.self.cycles-pp.tick_nohz_highres_handler
      0.00            +0.0        0.00            +0.2        0.17 ± 11%  perf-profile.self.cycles-pp.native_apic_mem_eoi
      0.00            +0.0        0.00            +0.2        0.17 ± 20%  perf-profile.self.cycles-pp.irqentry_enter
      0.00            +0.0        0.00            +0.2        0.17 ± 14%  perf-profile.self.cycles-pp.task_tick_mm_cid
      0.00            +0.0        0.00            +0.2        0.17 ± 18%  perf-profile.self.cycles-pp.cpuidle_enter
      0.00            +0.0        0.00            +0.2        0.17 ± 12%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.00            +0.0        0.00            +0.2        0.17 ± 16%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.0        0.00            +0.2        0.17 ± 28%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.00            +0.0        0.00            +0.2        0.19 ± 20%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.0        0.00            +0.2        0.19 ± 19%  perf-profile.self.cycles-pp.leave_mm
      0.00            +0.0        0.00            +0.2        0.19 ± 20%  perf-profile.self.cycles-pp.load_balance
      0.00            +0.0        0.00            +0.2        0.20 ± 25%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.0        0.00            +0.2        0.20 ± 12%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.0        0.00            +0.2        0.22 ± 20%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.0        0.00            +0.2        0.22 ± 18%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.0        0.00            +0.2        0.22 ± 18%  perf-profile.self.cycles-pp.irq_work_tick
      0.00            +0.0        0.00            +0.2        0.23 ± 14%  perf-profile.self.cycles-pp.tick_irq_enter
      0.00            +0.0        0.00            +0.2        0.24 ± 14%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.0        0.00            +0.2        0.24 ± 12%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.0        0.00            +0.2        0.24 ± 21%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.00            +0.2        0.25 ± 15%  perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.0        0.00            +0.3        0.27 ± 12%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.00            +0.0        0.00            +0.3        0.28 ±  9%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.00            +0.3        0.29 ± 12%  perf-profile.self.cycles-pp.rebalance_domains
      0.00            +0.0        0.00            +0.3        0.30 ± 10%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.0        0.00            +0.3        0.32 ± 14%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.3        0.32 ± 12%  perf-profile.self.cycles-pp.check_cpu_stall
      0.00            +0.0        0.00            +0.3        0.32 ± 11%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.00            +0.0        0.00            +0.3        0.33 ± 18%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.00            +0.3        0.33 ± 17%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.0        0.00            +0.3        0.34 ± 20%  perf-profile.self.cycles-pp.rb_next
      0.00            +0.0        0.00            +0.3        0.34 ± 17%  perf-profile.self.cycles-pp.__clear_extent_bit
      0.00            +0.0        0.00            +0.4        0.37 ± 16%  perf-profile.self.cycles-pp.scheduler_tick
      0.00            +0.0        0.00            +0.4        0.37 ± 10%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.0        0.00            +0.4        0.38 ± 27%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.00            +0.0        0.00            +0.4        0.39 ± 12%  perf-profile.self.cycles-pp.perf_rotate_context
      0.00            +0.0        0.00            +0.4        0.39 ± 16%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.0        0.00            +0.4        0.40 ± 16%  perf-profile.self.cycles-pp.rcu_pending
      0.00            +0.0        0.00            +0.4        0.40 ± 16%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.00            +0.0        0.00            +0.4        0.40 ± 14%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.0        0.00            +0.4        0.43 ±  7%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.0        0.00            +0.4        0.43 ± 22%  perf-profile.self.cycles-pp.update_process_times
      0.00            +0.0        0.00            +0.4        0.44 ± 16%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.0        0.00            +0.5        0.47 ± 15%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.0        0.00            +0.5        0.53 ±  7%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.0        0.00            +0.6        0.57 ± 16%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.0        0.00            +0.6        0.57 ± 10%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.0        0.00            +0.6        0.58 ± 11%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.0        0.00            +0.6        0.58 ±  6%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.0        0.00            +0.6        0.60 ± 13%  perf-profile.self.cycles-pp.run_posix_cpu_timers
      0.00            +0.0        0.00            +0.6        0.61 ±  8%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.0        0.00            +0.7        0.71 ± 12%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.0        0.00            +0.7        0.73 ± 15%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.0        0.00            +1.0        1.03 ± 13%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.0        0.00            +1.4        1.43 ±  5%  perf-profile.self.cycles-pp.menu_select
      0.00            +0.0        0.00            +2.3        2.29 ±  3%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.00            +0.6        0.57 ±264%      +0.1        0.12 ± 18%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.6        0.57 ±264%      +0.6        0.61 ± 10%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.7        0.66 ±264%      +0.2        0.24 ± 26%  perf-profile.self.cycles-pp.__cond_resched
      0.00            +0.9        0.89 ±264%      +0.5        0.49 ± 16%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.00            +1.5        1.52 ±176%      +0.7        0.73 ± 12%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode


> 
> Thanks,
> Amir.
