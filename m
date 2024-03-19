Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDCF6518E
	for <oe-lkp@lists.linux.dev>; Tue, 19 Mar 2024 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710815192; cv=fail; b=dijrq+l/hX7lRXO14P88lony3VGf99p//qHT+DVkxmyV4GOpB0sTR8vtsfJILtKYpdGz76+DG0DngFbIhfRcihhaHfDWuhpFcFisbNkHUDnoNn/a+L721dj88AzJVms/9mmpn5QwzpN2kSez7xWaIqhWOd+ehGuS96UMfmAOjT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710815192; c=relaxed/simple;
	bh=mY1cx/bIQp4iZJcMA1gabjZGJD9zgvSxNOUrtFyKZ7I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cm17AL3zlYPk3z4uNL7I/li+5yi5hAiHv9eky0XmGtheDwCpQkNAvT1EhbxLrgTMvOHdv3liNtndn6okc3+p0waBmE+QvbzUuXg2iUgMGQTN6KqTkFSgk+4ujqDC+TxPGuvxpZjwYhpRy+riK0Vrq3SFLBOLOT/TzYPJ03Qkjwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9+8kmoo; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9+8kmoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710815190; x=1742351190;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mY1cx/bIQp4iZJcMA1gabjZGJD9zgvSxNOUrtFyKZ7I=;
  b=M9+8kmoo3+XTzG0Ew9IYxYgdpiW1tTy5DO072f0Yy+PXdOp3vU+w4kms
   ze4IcCBW9E9LN2BX4NwAjfuSsw81AQ+azOLAuw6m0AO1Te1faXvzVUDyp
   uOHkZQNfaU8GjmVNkaT+nLlCSxcD5v1c3IWt0e7SZFlUqGdPMR3UMO7f/
   l/f2NAwRdMaKE/nnDGgZ+mhrme1vAoJhpyDlozU4luF093bdzlzgMyvfD
   NOsG2sxkDtnnOfFa3EqQNHwTW1o33vZmNdNaUMKNKfajSaHcvug6Dn/Ul
   x7ZkbVu6lVjZv0v2x8ytXMc6pceE2dK62YpW2/zz1247tEJeIlXdF31VF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5509856"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5509856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 19:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="14041233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Mar 2024 19:26:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 19:26:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 19:26:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 19:26:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNzIbUYE/F6lB9hfnZRe9o2zFiVr5OB3WZfLd5k2LNxaEF0u3KSdU87uqtyGnLR0VUgQ41y8tJspI7YXFPybKYoNaH3GU6izYMi/zzu+/XUVivyVszZU4j9Hd3Pw2OCw8ZIsJdehAzEFxIRCB+orumzWnnHQ21cUhUb5S7U1aoTbHfO1VOReHLdNXT1hjmrFtcsm1zj/WBvb0tGhwwi81YhXCm8IQp5y9CDehQitwTfsMEe3198CK1Elzx0N9yFERTPVrG75VlYxgaoRgYNmGh/cY+nl2+FPjYr4bFW9g9e4zFrajcjckTWzbabktAucC6B/lLQSS8gSvoCDacMPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RCHFyX0vEBJld4od4W17hNySBsgawHgSmYFWHUWZU0=;
 b=dKAJANBRLX3g2LN7CjquAPHtkk9uO2SBBbn3Ljc/YZOKh8KEjAq9+DboXcBs2pO/3L8WjBs5vrXZQTkcSn2FPI3Gb1t8k8lU2QPPDJv1FrkkpD6RKa4gZKgdKnGgxbMIDcbsbae/uj9eYDcQ9WEK/+SY0i4ckOLJVTfsL7MVcXEWHL3ORBaotLDYCzpIgyPGOY6xp5TOOfa/eg01MYghT/Nqff39VEY1tR0CRmhciaxGTKnoYnPTAHUsSxgm4ddgdV7y35kGiK3foJadWQpYnUVx2l34LfNbe+r9S8VfsmfBbscsN4w6RacODxzGaDINFKvty0aa5f1PDjRypn3mkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.9; Tue, 19 Mar
 2024 02:26:25 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 02:26:25 +0000
Date: Tue, 19 Mar 2024 10:26:11 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jan Kara <jack@suse.cz>, "Jens
 Axboe" <axboe@kernel.dk>, <oliver.sang@intel.com>
Subject: Re: [amir73il:fsnotify-sbconn] [fsnotify] 629f30e073:
 unixbench.throughput 5.8% improvement
Message-ID: <Zfj3wxDHolB1qCGO@xsang-OptiPlex-9020>
References: <202403141505.807a722b-oliver.sang@intel.com>
 <CAOQ4uxg=+fYa6cGeb3_FSCdSQMS8nW_9_XMheEGSQ_m1HafmZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxg=+fYa6cGeb3_FSCdSQMS8nW_9_XMheEGSQ_m1HafmZA@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pAVXm3kmKjGa5FsbKKbCUZfcZAxDWN83Yf70Z7o9C2ag/B5iUH3ptDbxOcOQH1x5TSl9A5fUy3zzrE7gp4anaCn9PhAf1T8ck1SXprfReWY9+cKFEnV3VmuzPumBshk3KAzR73rttySogxVxwsCJs4qpUzyfK8DuWrlY1KbI7zIlCKxo0e2eJDOhE39TTmdFa8GQr2Q9TAtA8Xd1qtDOgFB0kP1ugkKHGq8cSkTmZsAEG+5ymsGmzx+faMXleGt45rOsNxZ5jezJDKPP3o9+WeRrwPGeSy/pW9TYbQr199J++XfdPP+DDBTjjPajeQZ/yI/ayCUhU/6187bWOjXsH2vWoQkxy3/eBoZLis7/8IyWkm7el4xqGSig4XikljcIL96QlthkxZEuOCeW6iLlB5uPJ3eswAUKHy716zKhngGAa4dLIiPnb4/d4yBVqN9yowgLe+LwN3O1jshJ4QQkTUqe9la/Vq3niFpj3yL0auQVrleMGCXrxNUEQP1P0do/IUxU0NEXOedaFZ2elXCvYba1VcwbjmBe2r1ME+q5P5dEQgpd5bekR1DCuveQ//+z4a/JMi8jMy8AEkL2MTLAC65Je1ISHk5q6uwUTMrPleZcm+Xj8W5RgJwsPJZEDeVU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHZYSlh2MHkxY2pMZnVpN0NnczBmQW5VcC9ab1VNSmxpazZDUGdPc1pRUGlE?=
 =?utf-8?B?c3luM3ZwMy9wMGR5L3BFNXd0WkNPYStGOXd5RGhYdW4zZ1JvcGhqcldnT1hB?=
 =?utf-8?B?TmpnalZuTUk5MEExcDZQVU1IS0ZLZy9MWDJVZ0RSRlBaQUVSTkZraVlxV290?=
 =?utf-8?B?VHJNWWhRV0labUdSQmg1VGs3VU42ZCt4K2gvYTIxNnpNbzN6Y1AvMks5akJH?=
 =?utf-8?B?d0xHbGF4SmEwcGlzRktxc2VFbUxxT0lEamxLVTJzakx3TnpZZ0h3Q2dmbTBr?=
 =?utf-8?B?TFd6RVdQSFNkNVpTa2dDaXliQkVoWS9ZUEt3dVpEV1E4MVhsMmtrdE5aazlV?=
 =?utf-8?B?b25pNW8rOXNIaGpFbnZEOS9Hc0gxVFZSZmV5S2Q1NFNWOGlXYytLdFJIMFJS?=
 =?utf-8?B?WnV2dk42QWxHY0cyWjBCSGlGRnNMSzBIaEM4TFZ5Z3FwUkFyV2Y4S1pib2Jo?=
 =?utf-8?B?NGN4ajhOSDlJT1dYbWFwRDU3Z2JiQUNwd2lJN3gzSUE0dXJXdkEvaTNVd1lM?=
 =?utf-8?B?dzUwZTUzRnIzS2ljS1ZuL2dVY0NGd0psTVZzWDFYK0o1QTNuRGlVeU04Vlpp?=
 =?utf-8?B?Y3hueGRIVlVLcVhkR3laWllYRlcxaHgvK1FlQlE0b1VCaW44dTc1aXJXeHhY?=
 =?utf-8?B?Zy9ETXlzc2FMN2kyQVJ0RHhaL1lrUGlWanJkTzlTekZ4SFhJU1E0bldzT1N5?=
 =?utf-8?B?T2lnY2k0czZxb0RxV0NOSWVkekhGeDBibUE2TjkvbUtiWCsvdnpUa1d2dm9q?=
 =?utf-8?B?Vit5bnAyOFRZV25ja2pnMCsrWmwvOVljS25LMHlxald1K2crbitBNmR4dkU2?=
 =?utf-8?B?MFVTQlIxYW9kRXBZZVVqejdzRjlpWGdmVnFYSXZqSVJhQlAxdmN6ZEhWWFNv?=
 =?utf-8?B?UXIyRGs2VGtneE9mUnExMUFrTlg4MmxqN0RzRFJzTTdyVWZjTHdQTlB4VSsr?=
 =?utf-8?B?ZnErdnFKRFpER05VVEVOTWhZa0laek1kUXhIbEM3c2FVdWFvUXAvV2tIRTd0?=
 =?utf-8?B?OEVjVXVwT0VVOFFQSk02OHpTTDBHS010a3JMQXFacVRmaGlUS0NtajJmZHJP?=
 =?utf-8?B?Sk93dFRHdTFiRmdlQ1BacUdmWXNaM3dzTUhTaUVGUWNCZTk2VDVNTDAwbTFP?=
 =?utf-8?B?YWRUbU1XemN3SlpvQzZIeFp0eEZCaDZIMTFYd3BCSGlYaHVvUmdDbFlaYy9V?=
 =?utf-8?B?bExxQ0hDc1ZKdnBPVUNvRDVqWVYxM1ErUEE4bHRqaldBRE44VTZ4Yk5aVlJk?=
 =?utf-8?B?ZC8yNUovM2xBMktRSDFCbENLSlZXN2pXdDBKTHZCWUJUTjZMMWxnYUozdVlw?=
 =?utf-8?B?djVHdVE3Y2ZmZitUWnJGdEp2Q2NNaDd6NDJmTWcrV3BTT3BUUDNNZmI0ZjhJ?=
 =?utf-8?B?dmpzS3Q2TTN4dSs2ckV5MUs3RXdpdGcrRU00NERDd2RQY1lPakU4N3UwSVRw?=
 =?utf-8?B?TTZJM2ZaUEVTRFRwL2Rtd3AvMEd5VitxSGNyaTRQVmExcFFMS1o1T1dUNDRM?=
 =?utf-8?B?YzRJZzBMamVpYnR2UWkrUnZML1VDRys3OVc1aWFWREc2R1lxTE9UM3VYWFlx?=
 =?utf-8?B?WHFNOFVRQ3oyRmUxbjlmSDgrM1FJK0Npb0tDRVhPV3IxdmVOeHdIZEt0c09n?=
 =?utf-8?B?T3JwaXZHd2ZONW0yZVNhMzJyOWpmN3phZUdEMG1ZMHpmWHBUYk95cnhuam5S?=
 =?utf-8?B?QjlWRlFNeEEzb2p2c2pxdDFneWJldjJrZ2RyeWZYbGxLSFBxU0VUdVFQeW5n?=
 =?utf-8?B?MmhBT2pIdXhaTG5qdk5TaXZZaGFmQjBCN1pLdWE0NUsyVTlOU0JHQXFFazdG?=
 =?utf-8?B?K01zdG9YRVV6WkM4eDVHMGhKWGJlRkc3TWhIcS9YSmtteWNsQ2Fzc0VJbzZn?=
 =?utf-8?B?TUFHdVY5U0NVbEwwbm83RkEyTG1LOWFnYkNJM1BYcUR0VDFZTXB6RUhOR090?=
 =?utf-8?B?Yk9DNXlIUWJNSEpmWCtjcXh2QzhRZzAxSy9scUd3b1QvS0tDWndiUDd4dklE?=
 =?utf-8?B?cWprMUExRmtQOHVYZ0R5dDAxaFVOekh3T2JaNlh1bVd3bmhObkthUUNzRStp?=
 =?utf-8?B?elVzUlhNb05LN1oydWlzMmdJbXZsZm5JSDlrSjZoVXJ3OGVnZzJxRGJ4QnlI?=
 =?utf-8?Q?8wIb2x/UIje5t/fZYDoU6Brah?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4970665a-be82-4783-614e-08dc47bbf95e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 02:26:25.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPDZQ64Kfn02+Io+qffo5JaQQEhr33G2/e/A40fJ8B9rjW7vx81/zH6/xqP4pITwfpR92IF+700w7e62daoNBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
X-OriginatorOrg: intel.com

hi, Amir,

On Thu, Mar 14, 2024 at 11:21:50AM +0200, Amir Goldstein wrote:
> On Thu, Mar 14, 2024 at 10:23 AM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> >
> > hi, Amir Goldstein,
> >
> > while for report
> > "[amir73il:sb_write_barrier] [fsnotify] 9c13a708ef: will-it-scale.per_thread_ops -4.2% regression"
> > by our tests, "fsnotify: optimize the case of no permission event watchers"
> > caused some performance improvements in will-it-scale tests.
> > (https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/)
> >
> > we report below just FYI what its behavior on another branch 'fsnotify-sbconn'
> > with unixbench tests.
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 5.8% improvement of unixbench.throughput on:
> >
> >
> > commit: 629f30e073f457c2209aa2517dd653fe7da9bfd6 ("fsnotify: optimize the case of no permission event watchers")
> > https://github.com/amir73il/linux fsnotify-sbconn
> >
> > testcase: unixbench
> > test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> > parameters:
> >
> >         runtime: 300s
> >         nr_task: 100%
> >         test: fstime-r
> >         cpufreq_governor: performance
> >
> 
> Thanks Oliver, that's interesting.
> The thing is that I had expected this performance improvement for the
> "small buffered read/write" workloads, so I was a bit surprised not to
> see it reported earlier.
> 
> Specifically, the reduction of fsnotify_parent cycles is expected, because the
> optimization avoids many fsnotify_parent() calls.
> Commit 082fd1ea1f98 ("fsnotify: optimize the case of no parent watcher")
> that was merged upstream yesterday should have reduced fsnotify_parent cycles
> considerably (as well as fsnotify() cycles) and this commit is expected to
> further reduce them in some workloads.
> 
> The problem with the report on the fsnotify-sbconn branch is that this branch
> currently has a bug (that was also in the first version of fsnotify-sbinfo).
> AFAIK, this bug does not result in false report of improvements, if anything
> it breaks some optimizations, but I cannot say for sure.
> 
> Can you try to rerun unixbench benchmark on the latest fsnotify-sbinfo branch:
> 
> * 7252b8296541 - (github/fsnotify-sbinfo) fsnotify: optimize the case
> of no permission event watchers
> * b05b4e647f7a - fsnotify: use an enum for group priority constants
> * 850b57bda1e8 - fsnotify: move s_fsnotify_connectors into fsnotify_sb_info
> * 78ed046d7030 - fsnotify: lazy attach fsnotify_sb_info state to sb
> 
> It is mostly identical to the commit on fsnotify-perf that you tested
> will-it-scale
> manually, just a couple of minor review changes that should not affect
> these tests.
> 
> The main difference between fsnotify-sbinfo and fsnotify-sbconn is the commit
> 78ed046d7030 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
> If we find out that fsnotify-sbinfo does not yield the same unixbench
> improvement
> as fsnotify-sbconn does this is something that needs to be investigated.

on fsnotify-sbinfo branch, we still observed similar performance improvement.
(I chose 14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next")
as base since I noticed it's also the base for fsnotify-sbconn)

the 78ed046d7030 ("fsnotify: lazy attach fsnotify_sb_info state to sb") seems
not introduce further impact.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/fstime-r/unixbench

commit:
  14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next")
  78ed046d70300 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
  b05b4e647f7a7 ("fsnotify: use an enum for group priority constants")
  7252b8296541d ("fsnotify: optimize the case of no permission event watchers")

14c141dab0a87876 78ed046d703006625177ad110c8 b05b4e647f7a7fa293b5c158f62 7252b8296541ded934ebaa47609
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
 1.338e+08            +0.4%  1.344e+08            +0.3%  1.342e+08            +5.8%  1.416e+08        unixbench.throughput
 5.759e+10            +0.4%  5.784e+10            +0.2%  5.772e+10            +5.8%  6.094e+10        unixbench.workload

detail is at [1]


> 
> I have also pushed a fixed version of fsnotify-sbconn with the bug
> fixed for comparison:
> 
> * 939c68368456 - (github/fsnotify-sbconn) fsnotify: optimize the case
> of no permission event watchers
> * 20e86594ebad - fsnotify: use an enum for group priority constants
> * 9ee2d92d59cc - fsnotify: move s_fsnotify_connectors into sb connector
>

on new fsnotify-sbconn, still observed similar performance improvement.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/fstime-r/unixbench

commit:
  14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next")
  20e86594ebade fsnotify: use an enum for group priority constants
  939c683684560 ("fsnotify: optimize the case of no permission event watchers")

14c141dab0a87876 20e86594ebade045d589ef3ea7c 939c6836845602989da2043b956
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
 1.338e+08            -0.2%  1.336e+08            +5.2%  1.408e+08        unixbench.throughput
 5.759e+10            -0.2%  5.748e+10            +5.2%  6.058e+10        unixbench.workload


detail is at [2]
 
> Thanks,
> Amir.
> 

[1]
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/fstime-r/unixbench

commit:
  14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next")
  78ed046d70300 ("fsnotify: lazy attach fsnotify_sb_info state to sb")
  b05b4e647f7a7 ("fsnotify: use an enum for group priority constants")
  7252b8296541d ("fsnotify: optimize the case of no permission event watchers")

14c141dab0a87876 78ed046d703006625177ad110c8 b05b4e647f7a7fa293b5c158f62 7252b8296541ded934ebaa47609
---------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \
      1679            -0.3%       1675            -0.5%       1671            +2.6%       1723        time.user_time
 1.338e+08            +0.4%  1.344e+08            +0.3%  1.342e+08            +5.8%  1.416e+08        unixbench.throughput
      1679            -0.3%       1675            -0.5%       1671            +2.6%       1723        unixbench.time.user_time
 5.759e+10            +0.4%  5.784e+10            +0.2%  5.772e+10            +5.8%  6.094e+10        unixbench.workload
      3.30            +0.2%       3.30            -0.8%       3.27            +5.2%       3.47        perf-stat.i.MPKI
  2.64e+10            +0.4%  2.652e+10            +0.9%  2.665e+10            +2.4%  2.704e+10        perf-stat.i.branch-instructions
  28834151            -0.1%   28805905            -0.0%   28821542            +4.9%   30245244        perf-stat.i.branch-misses
     27.39            +0.1       27.45            -0.0       27.35            +0.3       27.69        perf-stat.i.cache-miss-rate%
 5.195e+08            +0.8%  5.234e+08            +0.0%  5.197e+08            +6.9%  5.554e+08        perf-stat.i.cache-misses
 1.661e+09            +0.5%  1.669e+09            +0.1%  1.663e+09            +5.4%   1.75e+09        perf-stat.i.cache-references
      3.70            +0.3%       3.72            -0.6%       3.68            +6.2%       3.94        perf-stat.overall.MPKI
      0.11            -0.0        0.11            -0.0        0.11            +0.0        0.11        perf-stat.overall.branch-miss-rate%
     31.27            +0.1       31.36            -0.0       31.26            +0.5       31.73        perf-stat.overall.cache-miss-rate%
    302.77            -0.5%     301.23            -0.3%     301.80            -6.8%     282.31        perf-stat.overall.cycles-between-cache-misses
      1049            -0.0%       1049            +0.4%       1054            -4.8%     999.30        perf-stat.overall.path-length
 2.637e+10            +0.5%  2.649e+10            +0.9%  2.662e+10            +2.4%  2.702e+10        perf-stat.ps.branch-instructions
  28794853            -0.1%   28770967            -0.0%   28782790            +4.9%   30207845        perf-stat.ps.branch-misses
 5.189e+08            +0.8%  5.229e+08            +0.0%  5.191e+08            +6.9%   5.55e+08        perf-stat.ps.cache-misses
 1.659e+09            +0.5%  1.667e+09            +0.1%  1.661e+09            +5.4%  1.749e+09        perf-stat.ps.cache-references
     57.94            -0.2       57.72            -0.4       57.50            +2.9       60.81        perf-profile.calltrace.cycles-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.59            -0.2       28.39 ±  2%      +0.1       28.68            +1.9       30.48        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
     29.95            -0.2       29.77 ±  2%      +0.0       29.98            +1.9       31.86        perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
     12.70            -0.1       12.56            -0.4       12.33            +0.2       12.92        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.vfs_read.ksys_read.do_syscall_64
     78.91            -0.1       78.80            +0.0       78.93            -0.9       78.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     82.87            -0.1       82.79            +0.1       82.93            -0.6       82.26        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     86.80            -0.1       86.73            -0.0       86.75            -0.6       86.19        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     88.16            -0.1       88.09            -0.0       88.12            -0.5       87.64        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      1.26            -0.0        1.24            -0.1        1.20 ±  2%      -0.1        1.16 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.read
      0.72            -0.0        0.71            +0.0        0.72            +0.0        0.74        perf-profile.calltrace.cycles-pp.__cond_resched.filemap_read.vfs_read.ksys_read.do_syscall_64
      0.73            -0.0        0.73            +0.0        0.73            +0.0        0.77        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read
      0.74            +0.0        0.74 ±  2%      +0.0        0.74            +0.1        0.79        perf-profile.calltrace.cycles-pp.generic_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.41            +0.0        1.41            -0.1        1.28            +0.0        1.42        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
     98.50            +0.0       98.50            -0.0       98.47            -0.1       98.37        perf-profile.calltrace.cycles-pp.read
      1.53            +0.0        1.54            -0.1        1.46            -0.1        1.48        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.80            +0.0        0.81            +0.0        0.84            +0.1        0.89        perf-profile.calltrace.cycles-pp.r_test
      0.79            +0.0        0.80 ±  5%      +0.0        0.79 ±  3%      +0.1        0.86        perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
      4.47            +0.0        4.48 ±  2%      +0.4        4.83 ±  2%      +0.0        4.50        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.18            +0.0        3.20            -0.1        3.04            +0.1        3.30        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read
      2.74            +0.0        2.75 ±  3%      +0.0        2.76 ±  2%      +0.3        2.99 ±  3%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.15            +0.0        3.16 ±  2%      +0.1        3.22            +0.2        3.36 ±  2%  perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_read.ksys_read.do_syscall_64
      2.42            +0.0        2.44 ±  2%      +0.1        2.48 ±  2%      +0.2        2.61 ±  2%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read.ksys_read
      1.67            +0.0        1.70 ±  2%      -0.0        1.65            +0.1        1.76        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.filemap_read.vfs_read
      4.47            +0.0        4.50 ±  2%      -0.0        4.46            +0.2        4.69        perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.vfs_read.ksys_read.do_syscall_64
      3.84            +0.0        3.87 ±  2%      -0.0        3.82            +0.2        4.01        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.vfs_read.ksys_read
      8.09            +0.1        8.16            +0.0        8.12            +0.5        8.55        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
      8.55            +0.1        8.63 ±  2%      -0.1        8.48            -4.1        4.42        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     58.48            -0.2       58.28            -0.4       58.04            +2.9       61.37        perf-profile.children.cycles-pp.filemap_read
     28.70            -0.2       28.50 ±  2%      +0.1       28.79            +1.9       30.60        perf-profile.children.cycles-pp._copy_to_iter
     30.17            -0.2       30.00 ±  2%      +0.0       30.20            +1.9       32.08        perf-profile.children.cycles-pp.copy_page_to_iter
     12.90            -0.1       12.76            -0.4       12.53            +0.2       13.13        perf-profile.children.cycles-pp.filemap_get_pages
     79.31            -0.1       79.21            +0.0       79.35            -0.9       78.42        perf-profile.children.cycles-pp.vfs_read
     83.27            -0.1       83.19            +0.1       83.32            -0.6       82.67        perf-profile.children.cycles-pp.ksys_read
     88.35            -0.1       88.28            -0.0       88.32            -0.5       87.82        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     87.30            -0.1       87.24            -0.0       87.26            -0.6       86.72        perf-profile.children.cycles-pp.do_syscall_64
      1.40            -0.0        1.38            -0.1        1.34 ±  2%      -0.1        1.30        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.20            -0.0        0.20 ±  2%      +0.0        0.23            +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.83            -0.0        0.83            +0.0        0.83            +0.0        0.87        perf-profile.children.cycles-pp.aa_file_perm
      1.22            +0.0        1.22            +0.0        1.26            +0.1        1.32        perf-profile.children.cycles-pp.r_test
     98.78            +0.0       98.78            -0.0       98.74            -0.1       98.69        perf-profile.children.cycles-pp.read
      1.62            +0.0        1.62            -0.1        1.48            +0.0        1.63        perf-profile.children.cycles-pp.xas_descend
      0.39            +0.0        0.39            +0.0        0.39            +0.0        0.42        perf-profile.children.cycles-pp.make_vfsgid
      0.54            +0.0        0.54            -0.1        0.48            -0.1        0.48 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.30            +0.0        0.30 ±  2%      +0.0        0.30            +0.0        0.32        perf-profile.children.cycles-pp.amd_clear_divider
      0.84            +0.0        0.84 ±  2%      +0.0        0.84            +0.1        0.90        perf-profile.children.cycles-pp.generic_file_read_iter
      0.39            +0.0        0.39            +0.0        0.39            +0.0        0.41        perf-profile.children.cycles-pp.make_vfsuid
      0.33            +0.0        0.34 ±  2%      +0.0        0.33            +0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_read
      0.92            +0.0        0.93            +0.0        0.94            +0.0        0.97        perf-profile.children.cycles-pp.__cond_resched
      0.52            +0.0        0.53 ±  3%      -0.0        0.52 ±  2%      +0.0        0.55        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      1.84            +0.0        1.85            -0.1        1.76            -0.0        1.79        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.89            +0.0        0.90 ±  4%      +0.0        0.89 ±  3%      +0.1        0.96        perf-profile.children.cycles-pp.xas_start
      0.33            +0.0        0.34 ±  2%      +0.0        0.34 ±  2%      +0.0        0.37        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.0        0.02 ±141%      +0.0        0.02 ±141%      +0.1        0.05        perf-profile.children.cycles-pp.irqtime_account_irq
      3.44            +0.0        3.46 ±  2%      +0.1        3.51            +0.2        3.67 ±  2%  perf-profile.children.cycles-pp.security_file_permission
      4.66            +0.0        4.68 ±  2%      +0.4        5.02 ±  2%      +0.0        4.70        perf-profile.children.cycles-pp.rw_verify_area
      3.59            +0.0        3.61            -0.1        3.44            +0.1        3.72        perf-profile.children.cycles-pp.xas_load
      2.83            +0.0        2.85 ±  3%      +0.0        2.86 ±  2%      +0.3        3.09 ±  3%  perf-profile.children.cycles-pp.__fdget_pos
      2.63            +0.0        2.65 ±  2%      +0.1        2.70 ±  2%      +0.2        2.83 ±  2%  perf-profile.children.cycles-pp.apparmor_file_permission
      1.87            +0.0        1.89 ±  2%      -0.0        1.84            +0.1        1.97        perf-profile.children.cycles-pp.current_time
      4.66            +0.0        4.70 ±  2%      -0.0        4.65            +0.2        4.89        perf-profile.children.cycles-pp.touch_atime
      4.22            +0.0        4.25 ±  2%      -0.0        4.21            +0.2        4.42        perf-profile.children.cycles-pp.atime_needs_update
      4.69            +0.0        4.72            +0.0        4.70            +0.3        4.94        perf-profile.children.cycles-pp.entry_SYSCALL_64
      3.59            +0.0        3.63            +0.0        3.62            +0.2        3.79        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      8.77            +0.1        8.84 ±  2%      -0.1        8.69            -4.2        4.53        perf-profile.children.cycles-pp.__fsnotify_parent
     28.41            -0.2       28.23 ±  2%      +0.1       28.52            +1.9       30.30        perf-profile.self.cycles-pp._copy_to_iter
      1.40            -0.0        1.38            -0.1        1.34 ±  2%      -0.1        1.30        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.17            -0.0        0.16 ±  2%      +0.0        0.21 ±  2%      +0.0        0.21        perf-profile.self.cycles-pp.folio_mark_accessed
      1.76            -0.0        1.76 ±  2%      +0.0        1.76            +0.1        1.81        perf-profile.self.cycles-pp.atime_needs_update
      0.71            -0.0        0.71            +0.0        0.71            +0.0        0.74        perf-profile.self.cycles-pp.aa_file_perm
      2.35            -0.0        2.35            -0.0        2.31            +0.1        2.43        perf-profile.self.cycles-pp.filemap_get_pages
      1.13            -0.0        1.13            +0.0        1.14            +0.1        1.19        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.10            -0.0        1.09            +0.0        1.13            +0.1        1.19        perf-profile.self.cycles-pp.r_test
      0.20            -0.0        0.20 ±  2%      -0.0        0.20            +0.0        0.21        perf-profile.self.cycles-pp.amd_clear_divider
      0.44            +0.0        0.44 ±  2%      -0.1        0.38            -0.1        0.38 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      1.32            +0.0        1.32            -0.0        1.30            +0.0        1.37        perf-profile.self.cycles-pp.ksys_read
      0.89            +0.0        0.89            +0.0        0.90            +0.0        0.94        perf-profile.self.cycles-pp.security_file_permission
      1.22            +0.0        1.22 ±  3%      +0.3        1.51 ±  8%      -0.2        1.03        perf-profile.self.cycles-pp.rw_verify_area
      0.29            +0.0        0.29 ±  2%      +0.0        0.30            +0.0        0.30        perf-profile.self.cycles-pp.make_vfsuid
      0.29            +0.0        0.29 ±  2%      +0.0        0.30            +0.0        0.31        perf-profile.self.cycles-pp.make_vfsgid
      0.43            +0.0        0.43            +0.0        0.43            +0.0        0.46        perf-profile.self.cycles-pp.touch_atime
      2.06            +0.0        2.06 ±  2%      -0.0        2.05            +0.1        2.12        perf-profile.self.cycles-pp.do_syscall_64
      1.20            +0.0        1.20            -0.0        1.17            +0.0        1.23        perf-profile.self.cycles-pp.xas_load
      1.39            +0.0        1.40            -0.1        1.27            +0.0        1.41        perf-profile.self.cycles-pp.xas_descend
      0.73            +0.0        0.74 ±  2%      +0.0        0.73            +0.1        0.78        perf-profile.self.cycles-pp.generic_file_read_iter
      0.54            +0.0        0.55 ±  2%      +0.0        0.56            +0.0        0.59        perf-profile.self.cycles-pp.__cond_resched
      1.27            +0.0        1.27 ±  2%      +0.0        1.27            +0.1        1.32        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.78            +0.0        0.79 ±  5%      +0.0        0.78 ±  3%      +0.1        0.86        perf-profile.self.cycles-pp.xas_start
      0.42 ±  2%      +0.0        0.43 ±  3%      -0.0        0.42 ±  2%      +0.0        0.45 ±  2%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      1.00            +0.0        1.00            -0.0        0.97            -0.0        0.99        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.32            +0.0        0.34 ±  2%      +0.0        0.33 ±  2%      +0.0        0.36 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      6.81            +0.0        6.83            +0.2        7.02            +0.3        7.06        perf-profile.self.cycles-pp.vfs_read
      1.46            +0.0        1.48            -0.1        1.40            +0.0        1.48        perf-profile.self.cycles-pp.copy_page_to_iter
      2.72            +0.0        2.74 ±  3%      +0.0        2.74 ±  2%      +0.2        2.97 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      1.34            +0.0        1.36            -0.0        1.32            +0.1        1.41        perf-profile.self.cycles-pp.current_time
      1.72            +0.0        1.74 ±  3%      +0.1        1.78 ±  3%      +0.1        1.86 ±  3%  perf-profile.self.cycles-pp.apparmor_file_permission
      3.45            +0.0        3.49            +0.0        3.48            +0.2        3.65        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.91            +0.0        3.95            +0.0        3.93            +0.2        4.15        perf-profile.self.cycles-pp.read
      8.51            +0.1        8.58 ±  2%      -0.1        8.43            -4.1        4.40        perf-profile.self.cycles-pp.__fsnotify_parent
      9.90            +0.1        9.98            -0.1        9.76            +0.4       10.33        perf-profile.self.cycles-pp.filemap_read


[2]
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/fstime-r/unixbench

commit:
  14c141dab0a87 ("Merge remote-tracking branch 'jack/fsnotify' into next")
  20e86594ebade fsnotify: use an enum for group priority constants
  939c683684560 ("fsnotify: optimize the case of no permission event watchers")

14c141dab0a87876 20e86594ebade045d589ef3ea7c 939c6836845602989da2043b956
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      1679            -1.9%       1647            +3.3%       1734        time.user_time
 1.338e+08            -0.2%  1.336e+08            +5.2%  1.408e+08        unixbench.throughput
      1679            -1.9%       1647            +3.3%       1734        unixbench.time.user_time
 5.759e+10            -0.2%  5.748e+10            +5.2%  6.058e+10        unixbench.workload
      3.30            -0.5%       3.28            +5.0%       3.46        perf-stat.i.MPKI
  2.64e+10            +0.6%  2.656e+10            +1.8%  2.687e+10        perf-stat.i.branch-instructions
  28834151           +13.4%   32709153            +4.7%   30184061        perf-stat.i.branch-misses
 5.195e+08            -0.0%  5.194e+08            +6.1%  5.509e+08        perf-stat.i.cache-misses
 1.661e+09            -0.2%  1.657e+09            +4.8%   1.74e+09        perf-stat.i.cache-references
      3.70            -0.3%       3.69            +6.0%       3.93        perf-stat.overall.MPKI
      0.11            +0.0        0.12            +0.0        0.11        perf-stat.overall.branch-miss-rate%
     31.27            +0.1       31.34            +0.4       31.66        perf-stat.overall.cache-miss-rate%
    302.77            +0.1%     302.95            -6.1%     284.34        perf-stat.overall.cycles-between-cache-misses
      1049            +0.4%       1054            -4.9%     998.18        perf-stat.overall.path-length
 2.637e+10            +0.6%  2.653e+10            +1.8%  2.684e+10        perf-stat.ps.branch-instructions
  28794853           +13.4%   32654626            +4.7%   30143924        perf-stat.ps.branch-misses
 5.189e+08            -0.0%  5.188e+08            +6.1%  5.504e+08        perf-stat.ps.cache-misses
 1.659e+09            -0.2%  1.656e+09            +4.8%  1.739e+09        perf-stat.ps.cache-references
     57.94            -0.5       57.41            +2.5       60.39        perf-profile.calltrace.cycles-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     12.70            -0.4       12.28            +0.2       12.93        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.vfs_read.ksys_read.do_syscall_64
     10.23            -0.3        9.89            +0.1       10.36        perf-profile.calltrace.cycles-pp.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read.ksys_read
     29.95            -0.1       29.80            +1.4       31.37        perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
     28.59            -0.1       28.46            +1.4       30.00        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
      8.55            -0.1        8.42            -4.1        4.45        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.26            -0.1        1.17 ±  2%      -0.0        1.23 ±  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.read
      1.53            -0.1        1.44            -0.0        1.51        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     98.50            -0.1       98.45            -0.1       98.37        perf-profile.calltrace.cycles-pp.read
      1.41            -0.0        1.36            +0.0        1.43        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
      3.18            -0.0        3.17            +0.1        3.31        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read
      0.73            -0.0        0.73            +0.0        0.77 ±  2%  perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read
      0.74            +0.0        0.74 ±  2%      +0.0        0.79        perf-profile.calltrace.cycles-pp.generic_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.47            +0.0        4.49            +0.3        4.75        perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.vfs_read.ksys_read.do_syscall_64
      3.84            +0.0        3.86            +0.2        4.07        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.vfs_read.ksys_read
      8.09            +0.0        8.11            +0.5        8.58        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
     86.80            +0.0       86.82            -0.7       86.08        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.67            +0.0        1.70 ±  2%      +0.1        1.78        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.filemap_read.vfs_read
     88.16            +0.0       88.19            -0.6       87.52        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      2.74            +0.0        2.77 ±  2%      +0.2        2.97        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.80            +0.0        0.84            +0.1        0.88        perf-profile.calltrace.cycles-pp.r_test
      0.79            +0.0        0.82 ±  3%      +0.1        0.84 ±  3%  perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
     78.91            +0.1       79.04            -1.1       77.84        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.15            +0.1        3.29            +0.2        3.30        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_read.ksys_read.do_syscall_64
      2.42            +0.1        2.56            +0.1        2.54        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read.ksys_read
     82.87            +0.2       83.02            -0.8       82.09        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.47            +0.5        4.93 ±  2%      +0.0        4.51        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     58.48            -0.5       57.95            +2.5       60.95        perf-profile.children.cycles-pp.filemap_read
     12.90            -0.4       12.48            +0.2       13.14        perf-profile.children.cycles-pp.filemap_get_pages
     10.53            -0.3       10.19            +0.2       10.68        perf-profile.children.cycles-pp.filemap_get_read_batch
     30.17            -0.1       30.02            +1.4       31.60        perf-profile.children.cycles-pp.copy_page_to_iter
      8.77            -0.1        8.63            -4.2        4.56        perf-profile.children.cycles-pp.__fsnotify_parent
     28.70            -0.1       28.57            +1.4       30.12        perf-profile.children.cycles-pp._copy_to_iter
      1.40            -0.1        1.31 ±  2%      -0.0        1.38 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.84            -0.1        1.74            -0.0        1.83        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.54            -0.1        0.48 ±  3%      -0.0        0.51 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      1.62            -0.1        1.57            +0.0        1.64        perf-profile.children.cycles-pp.xas_descend
     98.78            -0.0       98.75            -0.1       98.68        perf-profile.children.cycles-pp.read
      3.59            -0.0        3.58            +0.1        3.74        perf-profile.children.cycles-pp.xas_load
      0.83            -0.0        0.82            +0.0        0.87        perf-profile.children.cycles-pp.aa_file_perm
      3.59            -0.0        3.59            +0.2        3.81        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.39            +0.0        0.39            +0.0        0.41        perf-profile.children.cycles-pp.make_vfsuid
      0.39            +0.0        0.39            +0.0        0.42        perf-profile.children.cycles-pp.make_vfsgid
      0.84            +0.0        0.84 ±  2%      +0.1        0.89        perf-profile.children.cycles-pp.generic_file_read_iter
      0.33            +0.0        0.33            +0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_read
      4.69            +0.0        4.69            +0.3        4.96        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.92            +0.0        0.93            +0.0        0.96        perf-profile.children.cycles-pp.__cond_resched
      0.33            +0.0        0.34            +0.0        0.36        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.52            +0.0        0.54 ±  4%      +0.0        0.56 ±  3%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      4.22            +0.0        4.24            +0.3        4.48        perf-profile.children.cycles-pp.atime_needs_update
      4.66            +0.0        4.69            +0.3        4.96        perf-profile.children.cycles-pp.touch_atime
      1.87            +0.0        1.90            +0.1        1.99        perf-profile.children.cycles-pp.current_time
     87.30            +0.0       87.34            -0.7       86.61        perf-profile.children.cycles-pp.do_syscall_64
      2.83            +0.0        2.86 ±  2%      +0.2        3.07        perf-profile.children.cycles-pp.__fdget_pos
     88.35            +0.0       88.38            -0.6       87.72        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.22            +0.0        1.26            +0.1        1.33        perf-profile.children.cycles-pp.r_test
      0.89            +0.0        0.93 ±  2%      +0.1        0.95 ±  3%  perf-profile.children.cycles-pp.xas_start
      0.20            +0.0        0.24 ±  2%      +0.0        0.24        perf-profile.children.cycles-pp.folio_mark_accessed
     79.31            +0.1       79.45            -1.1       78.26        perf-profile.children.cycles-pp.vfs_read
      3.44            +0.1        3.57            +0.2        3.61        perf-profile.children.cycles-pp.security_file_permission
      2.63            +0.1        2.77            +0.1        2.76        perf-profile.children.cycles-pp.apparmor_file_permission
     83.27            +0.1       83.42            -0.8       82.50        perf-profile.children.cycles-pp.ksys_read
      4.66            +0.5        5.13 ±  2%      +0.1        4.71        perf-profile.children.cycles-pp.rw_verify_area
      8.51            -0.1        8.37            -4.1        4.43        perf-profile.self.cycles-pp.__fsnotify_parent
     28.41            -0.1       28.29            +1.4       29.82        perf-profile.self.cycles-pp._copy_to_iter
      1.40            -0.1        1.30 ±  2%      -0.0        1.37 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      2.35            -0.1        2.28            +0.1        2.45        perf-profile.self.cycles-pp.filemap_get_pages
      0.44            -0.1        0.38 ±  3%      -0.0        0.40 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      9.90            -0.0        9.85            +0.4       10.34        perf-profile.self.cycles-pp.filemap_read
      1.00            -0.0        0.96            +0.0        1.00        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.39            -0.0        1.36            +0.0        1.42        perf-profile.self.cycles-pp.xas_descend
      1.32            -0.0        1.30            +0.1        1.38        perf-profile.self.cycles-pp.ksys_read
      2.06            -0.0        2.04            +0.1        2.14        perf-profile.self.cycles-pp.do_syscall_64
      1.20            -0.0        1.18            +0.1        1.25        perf-profile.self.cycles-pp.xas_load
      1.76            -0.0        1.75            +0.1        1.85        perf-profile.self.cycles-pp.atime_needs_update
      0.89            -0.0        0.89            +0.0        0.94        perf-profile.self.cycles-pp.security_file_permission
      1.27            -0.0        1.26            +0.1        1.33        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.29            -0.0        0.29            +0.0        0.31        perf-profile.self.cycles-pp.make_vfsuid
      0.29            +0.0        0.29 ±  2%      +0.0        0.31        perf-profile.self.cycles-pp.make_vfsgid
      1.13            +0.0        1.14            +0.1        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.45            +0.0        3.46            +0.2        3.66        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.73            +0.0        0.74 ±  2%      +0.0        0.78        perf-profile.self.cycles-pp.generic_file_read_iter
      0.43            +0.0        0.43 ±  2%      +0.0        0.46 ±  2%  perf-profile.self.cycles-pp.touch_atime
      0.32            +0.0        0.34            +0.0        0.36 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.54            +0.0        0.56            +0.0        0.58        perf-profile.self.cycles-pp.__cond_resched
      1.34            +0.0        1.35            +0.1        1.42        perf-profile.self.cycles-pp.current_time
      0.42 ±  2%      +0.0        0.44 ±  5%      +0.0        0.46 ±  4%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      3.91            +0.0        3.93            +0.2        4.16        perf-profile.self.cycles-pp.read
      2.72            +0.0        2.75 ±  2%      +0.2        2.94        perf-profile.self.cycles-pp.__fdget_pos
      1.10            +0.0        1.13            +0.1        1.20        perf-profile.self.cycles-pp.r_test
      0.78            +0.0        0.82 ±  3%      +0.1        0.84 ±  3%  perf-profile.self.cycles-pp.xas_start
      0.17            +0.0        0.22            +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.folio_mark_accessed
      1.72            +0.1        1.86 ±  2%      +0.1        1.80        perf-profile.self.cycles-pp.apparmor_file_permission
      1.22            +0.3        1.54 ±  9%      -0.1        1.10 ±  4%  perf-profile.self.cycles-pp.rw_verify_area
      6.81            +0.3        7.15            +0.5        7.30        perf-profile.self.cycles-pp.vfs_read
