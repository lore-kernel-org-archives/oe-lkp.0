Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E44C6D
	for <oe-lkp@lists.linux.dev>; Mon, 15 Apr 2024 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713168207; cv=fail; b=Eavlii/mWqytCxzbq5QerkoZoL7sJiVSg1KJCFjl9c312fIYEstpKchfKdALQfFaJgiac5ngU9HK+HkPTUP8eoNYW7TggScUe77I52iq3RAAhGRyTA7tQQeyqtFOmu4TdxtThB7ExWfIg10XcUHvlIktTbmmPmmNOdlMCkHCVO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713168207; c=relaxed/simple;
	bh=mkQbSi3xFc+ZJnnoZWXoOKKHiqhNY1xpgDszQ37+b/0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QxUA0bZlbT4+gIjQrZxRtM9E425RGSGn0Xx9tHW0qGBw2tiGn8YLz3OsPZdKeEc9do1TdZ1QlCXbeX6MAsNAd4Wajxpr6wh3/3rVtQnAd38AulRmx6rEP78EZSaQVPFa/EXt9BbMjcfqtZGD8By/gwB11xyH4l2/qVhEKYRcuCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkSPeQjv; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkSPeQjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713168203; x=1744704203;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=mkQbSi3xFc+ZJnnoZWXoOKKHiqhNY1xpgDszQ37+b/0=;
  b=NkSPeQjvKhKShbXHt4p6qiHbXJMoYZuBg0TRbRAS/ne0xzKuunGpK2by
   xkJb9DNA5FhAWKHzrj1RHHpbk/ix0hZu2LLvJbJIWlsROdNnCN1Z3ETeS
   aV3kd35XXExdfMy5nEqg3l272QcvY8c8hgYw1lg1SB+0V19cvC3g/GMUe
   nsWr/X6ieOsW7LYT2OJW48W/3Ja5A5zaGNJxCa1WLc25Z8TnWFJkA91St
   e6hkmoL06Nrqe6HLomh91vAWx1isArSukrmB9cmtOkOkecogo7Zoyl9SR
   1RWXqeWA8SKMdOvaoODjx4JhWVfxVqUza4iw1LsHjBcB+bOyVBjiiEnD/
   Q==;
X-CSE-ConnectionGUID: ETPDw+D5QdCtylGkk9q23Q==
X-CSE-MsgGUID: hncVhrTjS6e63h7yzt1ydg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8401054"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8401054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 01:03:20 -0700
X-CSE-ConnectionGUID: zfNXKWyNQgauDdTSHSGpqg==
X-CSE-MsgGUID: VfJ6g0oNTiir7bLmAqds5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="22406503"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 01:03:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 01:03:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 01:02:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 01:02:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 01:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em2+XfjXA7tO0VsB3kxu66DhWS1usOZUXv6pSMrweigOaCG8Vv97kbfFhVh3umShXnUunqyPSz/S2VpwWr2ZqvmkjDcdRJoXItYU7Q8fEh6LnzJku5efWKjzn7wxHZOpqppfl+CPNMQfyDIDgeKm6EEezG3NQFEIS0Ob0U978VfMP3lAWv/Dn4Zi1Rxnt5ATRVcgWFLuXNBBuVuK9F0KP60kTv/KUFYijF26MgD15wNyf29m3qr3tt84DtGU10rM2U1nB5AeOabSnRijuh4VgYwwi84TtNN2Li9J1QJzqINtmr8rlGiZNxPMpmg1x2jpJ1R8wHNi+sA9PYyKkifeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdvPPCMXk67Xgl01QL5/r8AEMzemvzPscL7ItEYTx9c=;
 b=UuG6bRYZrwNNgYrAve/xBvIvwh3BXE9bUY+HNJFQfEq9mSftpMsttLgZyA6MkRitvsqplXUnNjBo2cqVrCirgwZfpVbOWqVR7KCWK4Xb6rUb8L7QbCL+AFIcr4qqh9zDGeGYSpSidjjOl47l5uLsYrI8/buMXxrlrbpCs2dafptDmmpn4sqRQqrHBnaY8zp9uvm19NoAL3TB+TwBNP/6L45u604alm+pqpMmgKWa8bnol7ceSuqLErqsnl5nsCztIxVGY9j3BlLZaY3CQXzRBiGmFjEUP/NlnEqSw3IRzPMaiETCSu22OF4KakOD6JX1LWptsXzWv67OFbcFijsN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Mon, 15 Apr
 2024 08:02:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 08:02:47 +0000
Date: Mon, 15 Apr 2024 16:02:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [djwong-xfs:health-monitoring] [xfs]  ac96cb4f2f:  aim7.jobs-per-min
 -68.8% regression
Message-ID: <202404151528.f2a07da9-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b08424-98b9-4817-388d-08dc5d226fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Myk8vsyQ0TLx37iKv8Mqo5zPM29XGpQABap/px97ZE8JzzzBbYmQsm6YPpGEXFCofyAL4MmrYpQhkgzVIgyD93T5nMvktV9Rp6LsFArDMMrlMAiHxs/Ezlw8L/H/D9fWed+pu22kZ+lqk5AnGPpuMW2zxze4gGxgWZ7zNRZEvD8yKf7okDoe4jld0bhyDReRS7fKclgCvTAyV8T/GnxRyN9Krd0qz6Kt68IAk174oISQ/5IQhQTj/59nwstNEBjd/3Arh2P13c7TWiw7xDT3VQSjc0qZLJC5Lwdv5PvY7KTdVII2tXPRaUbhUqNBRJb3JBWlZcBbRcW9XqhLEW6rh6TLXNozevMNbB6U/d4JvLDEct6l5SjrLhoblfmgs3Wv6TNWFQ68rLoTJS0sMYrxju6cSZI6mdWly4SnuL3uJ0utVtRj+cGx/IkHNoA8eAkIniAd0CoNmdBjW8Y+0r6/7GT4qFfjHrPJ9FsFRNVGi3YeHEbd9vZEq74v58x0BaVX1HD/jzk31ynjH0RFpwcZKbQi4Mk9u/hf4POFRcos4SWIWf6FuDnpzJ9hmABO10nLR2+RQ89h6XVnxp9Rx1JiKA7RTd2ssHwIXXJo77EblqHqRH9MwmU/FJ7/uIDsfeSF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6W5ihBOJgwn41XP/sYfNugmBr4kQ2M1ArF5ypbL0yS+kOGNPWxgeCXapzY?=
 =?iso-8859-1?Q?NPm+yBPgYNjItqVMRG5Cv6/B1kZ43SSu74QSHzyV27sAH300RIi56cPgQ9?=
 =?iso-8859-1?Q?AW5Am/PNboxNoFW0SMEXIlCRfIXoBbsqxnE89Y/ekmdOmgHIJVE8Y2nfMz?=
 =?iso-8859-1?Q?ZvU4qM1j8fRyK3pXxR+aJLvqA6Pv9vObh5htA0cF0D7OPzmQwMoNIT+Hi3?=
 =?iso-8859-1?Q?vN3T89oV4ahVebYvWRK3PlF9pUW8iORLDUwww/vBR0PYrQ32S2WMaEkV9A?=
 =?iso-8859-1?Q?ka9ZRFfaKEgDhyYtYlQJWIHfBL3Es7r2eee8vmkqYmVe10pqYj/dWl3ebl?=
 =?iso-8859-1?Q?T2jXBuzCwl20cGA3nXLXBtg/oLfQexViJg4mW54veUwnXGFmVX6e6xmDbx?=
 =?iso-8859-1?Q?qieiajHxDE18GYzY3bTsTfN6eR0EoQRx2T/i0p45C1WOny4mkzQQW50jnk?=
 =?iso-8859-1?Q?lYRfZ3UwAunwW8PZH0yKs9tZ/QBHIoGiCCnWaq+hCd4lvNJoyFMTsXL9ql?=
 =?iso-8859-1?Q?qD7VFtTZQNF2splO8EJxd4PtmqlZ31ruGF4zac0SGugbFBVbKhrPRB2xXx?=
 =?iso-8859-1?Q?oGu8OF7ck4g3j9gVaQrdHagqztmCOZyMJ1dCW+RKLZBxpfGjl6JV6999vu?=
 =?iso-8859-1?Q?eFl3xS/kPKc2F94/lqxM9VNihmZKh876I7ACuSA67rKDrcePZ7BcXqNh2C?=
 =?iso-8859-1?Q?PaLzbzZTFGkvfIqL2QcDRdwpk4NLXeLqYLMoAqYR0nbaTfbAawgIOIB+lQ?=
 =?iso-8859-1?Q?SxTiz1vtSKCcawsFV+qiDyq5mx+f6CDcai73zTdEUYSrdfMJH/ebhHyq2/?=
 =?iso-8859-1?Q?AuBEqOuNoUGL+tyRPaJc/KiY5j9rtu4SXmKu38p7MklsTF75KYKcf3ahk7?=
 =?iso-8859-1?Q?9XG8bupg6JKSDysC+WvbLViRMeA8NFKBG2iD9BypEKIW61gCLVdwozRdqB?=
 =?iso-8859-1?Q?VI4AmIXKJfsxpppUYr8l6/5bB1SlgQHR2QOjlBMNHs8E9JVgKoqB2FdRo8?=
 =?iso-8859-1?Q?QyXUDpV2iVcNafNZtPbJFgktP65UMmA6i9rBvoBjnh87H5pQ2q92BanDXt?=
 =?iso-8859-1?Q?kE2yEQteyCUrSbTS8M57TV8YZLFZsTp7t2IofjE93bnReoyWYSE+riUyWF?=
 =?iso-8859-1?Q?dWcGq1ZI/jjMz+s+1Zq1aBBhMa6eWLosvRCHjYkb04oqpns6GLwUU7jKB1?=
 =?iso-8859-1?Q?rFdaTnakSK75xA4IbE95tQ+G6tFqN+ZrQyMh9vwTDXCMRXJtEQy8pihOHc?=
 =?iso-8859-1?Q?PlbKWKrj/CtUiRpD44fVYMQx2GNhLxmYPMILouET9VowQJWdNdCzsoVLqp?=
 =?iso-8859-1?Q?XXGa/OAWLb+HQOjr2TIOTzKIt2XLlky4X5pQwRTnM1WRv/6YJ9cUywwj1h?=
 =?iso-8859-1?Q?vxFOBTJAYIZtFDlABbeeZ2l0nx80u6TbPMVOi/BhLFm9Dr91UoGVXFadEM?=
 =?iso-8859-1?Q?CwRupLkyjBkKnhREhZHafVzxunIMLl30o26joNUxpkKdDArfYl9ImWmu1j?=
 =?iso-8859-1?Q?QcHfMME9x6563J7pOv8YDohPgcfmubyzAJRJF2s1LG+1guTZgZIE5bnufe?=
 =?iso-8859-1?Q?vc+sgZMSHxnpBhA3adFWxZTCMr/y5VWl89ZR+XqUBcHZLtpwvCZbXvPYVG?=
 =?iso-8859-1?Q?ND4uoHD922Mqy3XaiI0fHLN/6GTlo1A2HCBdUU2PY+ejWBjoxvoSINIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b08424-98b9-4817-388d-08dc5d226fd8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 08:02:47.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEYEqPhl+RqXDtYmtNJ5OsW4g09DJWJeETGSTrvAqPPsOGB6t9MQmEZwX3c32WK7tSgr2euMIjTZUOPjnuZbjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -68.8% regression of aim7.jobs-per-min on:


commit: ac96cb4f2f2ee36c1ff06e47104db12a3389431b ("xfs: present wait time statistics")
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git health-monitoring

testcase: aim7
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	disk: 1BRD_48G
	fs: xfs
	test: disk_cp
	load: 3000
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404151528.f2a07da9-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240415/202404151528.f2a07da9-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-13/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/disk_cp/aim7

commit: 
  ed4cedcef5 ("thread_with_file: Lift from bcachefs")
  ac96cb4f2f ("xfs: present wait time statistics")

ed4cedcef505729c ac96cb4f2f2ee36c1ff06e47104 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.468e+09           +15.4%  6.311e+09        cpuidle..time
   4319925           +27.6%    5513779        cpuidle..usage
     75.01           -62.3%      28.25        iostat.cpu.idle
     24.03 ±  4%    +197.1%      71.40        iostat.cpu.system
    109.30 ±  2%    +111.6%     231.28        uptime.boot
     11723 ±  3%      +7.8%      12643 ±  2%  uptime.idle
      2.00 ± 57%  +28083.3%     563.67 ± 29%  perf-c2c.DRAM.local
     28.33 ± 27%  +92270.0%      26171        perf-c2c.DRAM.remote
     24.33 ± 20%  +1.3e+05%      30822        perf-c2c.HITM.local
      5.67 ± 49%  +3.5e+05%      19739        perf-c2c.HITM.remote
     30.00 ± 22%  +1.7e+05%      50561        perf-c2c.HITM.total
     75.00           -62.3%      28.28        vmstat.cpu.id
     24.02 ±  4%    +197.1%      71.35        vmstat.cpu.sy
    442.36 ± 22%     -64.7%     156.00 ± 12%  vmstat.io.bo
     32.05 ±  8%    +195.6%      94.74 ±  2%  vmstat.procs.r
     38848 ±  2%     -65.5%      13409        vmstat.system.cs
    145904           +15.5%     168573        vmstat.system.in
     74.20           -46.8       27.45        mpstat.cpu.all.idle%
      0.24 ±  2%      -0.1        0.17        mpstat.cpu.all.irq%
      0.07            -0.0        0.03        mpstat.cpu.all.soft%
     24.51 ±  4%     +47.5       72.00        mpstat.cpu.all.sys%
      0.98 ±  2%      -0.6        0.35 ±  3%  mpstat.cpu.all.usr%
     25.17 ± 45%    +166.2%      67.00 ± 15%  mpstat.max_utilization.seconds
     40.86 ± 11%     +99.7%      81.60        mpstat.max_utilization_pct
    327179 ±  2%     -68.8%     102061        aim7.jobs-per-min
     55.24 ±  2%    +219.7%     176.62        aim7.time.elapsed_time
     55.24 ±  2%    +219.7%     176.62        aim7.time.elapsed_time.max
     53499 ±  3%    +282.3%     204548 ±  3%  aim7.time.involuntary_context_switches
    172192 ±  2%     +66.3%     286351        aim7.time.minor_page_faults
      3106 ±  4%    +197.9%       9255        aim7.time.percent_of_cpu_this_job_got
      1691 ±  7%    +864.9%      16320 ±  2%  aim7.time.system_time
    444140            -7.7%     409980        aim7.time.voluntary_context_switches
    154987 ±  6%    +369.1%     727058        meminfo.Active
    154139 ±  6%    +371.0%     726055        meminfo.Active(anon)
    847.58           +18.4%       1003        meminfo.Active(file)
     56386 ±  5%    +152.3%     142248 ± 12%  meminfo.AnonHugePages
   3337249           +18.1%    3940093        meminfo.Cached
   3276183           +18.7%    3889737        meminfo.Committed_AS
      9556 ±  3%    +327.8%      40880 ±  2%  meminfo.Dirty
      8084 ±  5%    +368.3%      37859 ±  2%  meminfo.Inactive(file)
     77533 ±  4%     -18.0%      63615 ±  3%  meminfo.Mapped
    188224 ±  4%    +303.6%     759619        meminfo.Shmem
      4546 ± 34%   +3356.1%     157117 ± 33%  numa-meminfo.node0.Active
      3972 ± 31%   +3833.5%     156273 ± 33%  numa-meminfo.node0.Active(anon)
      5022 ±  8%    +307.3%      20456 ±  3%  numa-meminfo.node0.Dirty
      4337 ±  8%    +339.4%      19058 ±  3%  numa-meminfo.node0.Inactive(file)
      8541 ± 13%   +1821.5%     164124 ± 32%  numa-meminfo.node0.Shmem
    150457 ±  5%    +278.9%     570014 ±  9%  numa-meminfo.node1.Active
    150186 ±  6%    +279.4%     569854 ±  9%  numa-meminfo.node1.Active(anon)
      5072 ± 18%    +302.2%      20402        numa-meminfo.node1.Dirty
      4255 ± 19%    +340.2%      18731        numa-meminfo.node1.Inactive(file)
    179979 ±  4%    +230.9%     595621 ±  9%  numa-meminfo.node1.Shmem
    993.90 ± 31%   +3828.4%      39044 ± 33%  numa-vmstat.node0.nr_active_anon
      1197 ±  9%    +332.1%       5172 ±  2%  numa-vmstat.node0.nr_dirty
      1062 ± 13%    +354.1%       4823 ±  2%  numa-vmstat.node0.nr_inactive_file
      2135 ± 13%   +1821.2%      41028 ± 32%  numa-vmstat.node0.nr_shmem
    993.90 ± 31%   +3828.4%      39044 ± 33%  numa-vmstat.node0.nr_zone_active_anon
      1063 ± 12%    +353.7%       4822 ±  2%  numa-vmstat.node0.nr_zone_inactive_file
      1202 ±  9%    +330.1%       5172 ±  2%  numa-vmstat.node0.nr_zone_write_pending
     37248 ±  5%    +282.4%     142420 ±  9%  numa-vmstat.node1.nr_active_anon
      1271 ± 10%    +310.2%       5213        numa-vmstat.node1.nr_dirty
      1056 ± 10%    +352.8%       4784        numa-vmstat.node1.nr_inactive_file
     44801 ±  4%    +232.4%     148902 ±  9%  numa-vmstat.node1.nr_shmem
     37248 ±  5%    +282.4%     142420 ±  9%  numa-vmstat.node1.nr_zone_active_anon
      1062 ± 11%    +350.4%       4784        numa-vmstat.node1.nr_zone_inactive_file
      1272 ± 10%    +309.7%       5211        numa-vmstat.node1.nr_zone_write_pending
     38384 ±  5%    +372.7%     181438        proc-vmstat.nr_active_anon
    200806            +1.0%     202810        proc-vmstat.nr_anon_pages
      2446 ±  6%    +319.4%      10262        proc-vmstat.nr_dirty
    834376           +18.1%     985049        proc-vmstat.nr_file_pages
      2094 ±  5%    +353.5%       9498        proc-vmstat.nr_inactive_file
     69864            +2.0%      71282        proc-vmstat.nr_kernel_stack
     19823 ±  4%     -17.9%      16277 ±  3%  proc-vmstat.nr_mapped
     47009 ±  4%    +303.9%     189872        proc-vmstat.nr_shmem
     36676            +3.7%      38033        proc-vmstat.nr_slab_reclaimable
     94134            +2.5%      96452        proc-vmstat.nr_slab_unreclaimable
     38384 ±  5%    +372.7%     181438        proc-vmstat.nr_zone_active_anon
      2094 ±  5%    +353.5%       9498        proc-vmstat.nr_zone_inactive_file
      2445 ±  6%    +319.6%      10261        proc-vmstat.nr_zone_write_pending
     12243 ± 46%    +645.3%      91243 ±  7%  proc-vmstat.numa_hint_faults
      6005 ± 15%    +377.2%      28657 ± 14%  proc-vmstat.numa_hint_faults_local
    134149            +1.3%     135864        proc-vmstat.numa_other
      7876 ± 91%    +643.2%      58542 ± 14%  proc-vmstat.numa_pages_migrated
     99045 ± 23%    +135.3%     233054 ± 14%  proc-vmstat.numa_pte_updates
     81005 ±  2%     +83.1%     148349        proc-vmstat.pgactivate
    528487           +85.6%     980677        proc-vmstat.pgfault
      7876 ± 91%    +643.2%      58542 ± 14%  proc-vmstat.pgmigrate_success
     19896 ±  6%    +307.3%      81032        proc-vmstat.pgreuse
      1610            +6.1%       1708        proc-vmstat.unevictable_pgs_culled
      1.36           +30.7%       1.77        perf-stat.i.MPKI
  7.44e+09 ±  2%      -7.4%  6.888e+09        perf-stat.i.branch-instructions
      1.49 ±  2%      -0.9        0.59 ±  2%  perf-stat.i.branch-miss-rate%
  43273500 ±  2%     -52.3%   20626143 ±  2%  perf-stat.i.branch-misses
     17.75 ±  2%     +11.0       28.80        perf-stat.i.cache-miss-rate%
 3.134e+08 ±  2%     -39.2%  1.904e+08        perf-stat.i.cache-references
     39569 ±  2%     -66.0%      13458        perf-stat.i.context-switches
      1.96 ±  6%    +282.2%       7.49        perf-stat.i.cpi
 8.347e+10 ±  4%    +188.3%  2.406e+11        perf-stat.i.cpu-cycles
      1354 ±  3%      +7.4%       1455        perf-stat.i.cpu-migrations
      1667 ±  4%    +149.4%       4159 ±  2%  perf-stat.i.cycles-between-cache-misses
 3.745e+10 ±  2%     -18.2%  3.062e+10        perf-stat.i.instructions
      0.65 ±  4%     -67.5%       0.21        perf-stat.i.ipc
      8512 ±  3%     -38.8%       5212        perf-stat.i.minor-faults
      8525 ±  3%     -38.8%       5216        perf-stat.i.page-faults
      1.58           +17.1%       1.85        perf-stat.overall.MPKI
      0.57            -0.3        0.30        perf-stat.overall.branch-miss-rate%
     18.86           +10.9       29.74        perf-stat.overall.cache-miss-rate%
      2.24 ±  6%    +251.5%       7.86        perf-stat.overall.cpi
      1413 ±  6%    +200.2%       4243 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.45 ±  6%     -71.7%       0.13        perf-stat.overall.ipc
 7.371e+09 ±  2%      -6.8%  6.871e+09        perf-stat.ps.branch-instructions
  42203246 ±  2%     -51.6%   20432598 ±  2%  perf-stat.ps.branch-misses
 3.112e+08 ±  2%     -38.9%  1.902e+08        perf-stat.ps.cache-references
     39155 ±  2%     -65.8%      13394        perf-stat.ps.context-switches
    125712            +1.2%     127271        perf-stat.ps.cpu-clock
  8.28e+10 ±  4%    +189.8%    2.4e+11        perf-stat.ps.cpu-cycles
      1341 ±  3%      +8.0%       1449        perf-stat.ps.cpu-migrations
 3.711e+10 ±  2%     -17.7%  3.054e+10        perf-stat.ps.instructions
      8200 ±  3%     -36.9%       5171        perf-stat.ps.minor-faults
      8212 ±  3%     -37.0%       5175        perf-stat.ps.page-faults
    125712            +1.2%     127271        perf-stat.ps.task-clock
 2.086e+12          +160.2%  5.428e+12        perf-stat.total.instructions
      2783 ±  9%  +1.7e+05%    4691883 ± 23%  sched_debug.cfs_rq:/.avg_vruntime.avg
     38308 ± 18%  +12466.4%    4814029 ± 22%  sched_debug.cfs_rq:/.avg_vruntime.max
     56.45 ± 63%  +7.6e+06%    4281742 ± 24%  sched_debug.cfs_rq:/.avg_vruntime.min
      5209 ± 15%    +865.1%      50276 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.12 ± 20%    +349.7%       0.56 ±  7%  sched_debug.cfs_rq:/.h_nr_running.avg
     22.61 ±129%  +1.4e+05%      31613 ± 41%  sched_debug.cfs_rq:/.left_deadline.avg
      2257 ±156%  +1.2e+05%    2711296 ± 33%  sched_debug.cfs_rq:/.left_deadline.max
    213.22 ±145%  +1.3e+05%     286346 ± 34%  sched_debug.cfs_rq:/.left_deadline.stddev
     22.31 ±132%  +1.4e+05%      31612 ± 41%  sched_debug.cfs_rq:/.left_vruntime.avg
      2222 ±160%  +1.2e+05%    2711257 ± 33%  sched_debug.cfs_rq:/.left_vruntime.max
    210.03 ±148%  +1.4e+05%     286343 ± 34%  sched_debug.cfs_rq:/.left_vruntime.stddev
    146.55 ± 14%     -60.1%      58.46 ±  8%  sched_debug.cfs_rq:/.load_avg.avg
      2518 ± 41%     -72.1%     703.57 ± 13%  sched_debug.cfs_rq:/.load_avg.max
    416.11 ± 15%     -66.8%     137.98 ±  8%  sched_debug.cfs_rq:/.load_avg.stddev
      2783 ±  9%  +1.7e+05%    4691883 ± 23%  sched_debug.cfs_rq:/.min_vruntime.avg
     38308 ± 18%  +12466.4%    4814029 ± 22%  sched_debug.cfs_rq:/.min_vruntime.max
     56.45 ± 63%  +7.6e+06%    4281742 ± 24%  sched_debug.cfs_rq:/.min_vruntime.min
      5209 ± 15%    +865.1%      50276 ±  6%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.12 ± 20%    +343.2%       0.55 ±  8%  sched_debug.cfs_rq:/.nr_running.avg
     31.39 ± 59%     -59.4%      12.74 ± 25%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1024           -63.9%     369.39 ± 10%  sched_debug.cfs_rq:/.removed.load_avg.max
    168.25 ± 26%     -61.5%      64.79 ± 12%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    473.33 ± 20%     -53.8%     218.47 ± 28%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     74.71 ± 35%     -55.6%      33.18 ± 19%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    473.33 ± 20%     -53.9%     218.43 ± 28%  sched_debug.cfs_rq:/.removed.util_avg.max
     74.71 ± 35%     -55.6%      33.18 ± 19%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     22.31 ±132%  +1.4e+05%      31612 ± 41%  sched_debug.cfs_rq:/.right_vruntime.avg
      2222 ±160%  +1.2e+05%    2711257 ± 33%  sched_debug.cfs_rq:/.right_vruntime.max
    210.03 ±148%  +1.4e+05%     286343 ± 34%  sched_debug.cfs_rq:/.right_vruntime.stddev
    247.04 ±  6%    +142.1%     598.20 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
    297.44 ±  6%     -25.8%     220.72 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    245.35 ±  6%    +137.8%     583.34 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
    296.47 ±  6%     -28.9%     210.90 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
     13.65 ± 44%   +2422.1%     344.40 ± 10%  sched_debug.cfs_rq:/.util_est.avg
    513.33 ± 15%    +108.9%       1072 ± 12%  sched_debug.cfs_rq:/.util_est.max
     75.58 ± 28%    +216.9%     239.55 ±  5%  sched_debug.cfs_rq:/.util_est.stddev
      4423 ± 18%   +9382.7%     419497 ± 10%  sched_debug.cpu.avg_idle.min
    223580 ±  6%     -49.6%     112717 ±  6%  sched_debug.cpu.avg_idle.stddev
     53706 ±  5%    +131.6%     124408 ±  9%  sched_debug.cpu.clock.avg
     53714 ±  5%    +131.7%     124451 ±  9%  sched_debug.cpu.clock.max
     53696 ±  5%    +131.6%     124360 ±  9%  sched_debug.cpu.clock.min
      4.42 ± 14%    +481.3%      25.68 ± 12%  sched_debug.cpu.clock.stddev
     53561 ±  5%    +131.7%     124124 ±  9%  sched_debug.cpu.clock_task.avg
     53702 ±  5%    +131.5%     124302 ±  9%  sched_debug.cpu.clock_task.max
     44775 ±  6%    +157.4%     115247 ± 10%  sched_debug.cpu.clock_task.min
    342.20 ± 16%    +759.9%       2942 ±  8%  sched_debug.cpu.curr->pid.avg
      3218          +134.3%       7540 ±  5%  sched_debug.cpu.curr->pid.max
    960.58 ±  7%    +110.3%       2020 ±  5%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 32%     +65.9%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
      0.12 ± 19%    +346.8%       0.55 ±  8%  sched_debug.cpu.nr_running.avg
      1092 ±  3%    +663.8%       8347 ± 15%  sched_debug.cpu.nr_switches.avg
     11977 ± 21%    +186.3%      34291 ± 13%  sched_debug.cpu.nr_switches.max
    141.67 ± 11%   +4398.1%       6372 ± 20%  sched_debug.cpu.nr_switches.min
      1714 ± 12%    +100.2%       3431 ± 13%  sched_debug.cpu.nr_switches.stddev
      0.01        +1.9e+05%      14.50 ±  6%  sched_debug.cpu.nr_uninterruptible.avg
     26.00 ± 26%    +171.3%      70.53 ± 20%  sched_debug.cpu.nr_uninterruptible.max
    -15.33           +83.7%     -28.17        sched_debug.cpu.nr_uninterruptible.min
      5.50 ± 10%    +217.2%      17.44 ± 21%  sched_debug.cpu.nr_uninterruptible.stddev
     53700 ±  5%    +131.6%     124361 ±  9%  sched_debug.cpu_clk
     52467 ±  5%    +134.7%     123128 ±  9%  sched_debug.ktime
     54556 ±  5%    +129.7%     125292 ±  9%  sched_debug.sched_clk
     64.57 ±  5%     -63.4        1.20 ±  6%  perf-profile.calltrace.cycles-pp.read
     63.78 ±  5%     -62.7        1.11 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     63.67 ±  5%     -62.6        1.10 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     63.32 ±  5%     -62.3        1.06 ±  6%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     62.98 ±  5%     -62.0        1.02 ±  6%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     62.11 ±  5%     -61.2        0.93 ±  7%  perf-profile.calltrace.cycles-pp.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     61.93 ±  5%     -61.0        0.90 ±  7%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64
     29.02 ±  6%     -28.4        0.61 ±  9%  perf-profile.calltrace.cycles-pp.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     26.46 ±  4%     -26.5        0.00        perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     26.36 ±  4%     -26.4        0.00        perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     22.09 ±  6%     -22.1        0.00        perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     22.03 ±  6%     -22.0        0.00        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
     12.74 ±  4%     -11.7        1.05 ±  3%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      7.47 ±  4%      -6.9        0.56 ±  2%  perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      6.27 ± 15%      -6.3        0.00        perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
      6.18 ± 15%      -6.2        0.00        perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
      6.60 ± 65%      -5.0        1.61 ±  5%  perf-profile.calltrace.cycles-pp.unlink
      6.58 ± 65%      -5.0        1.61 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      6.58 ± 65%      -5.0        1.61 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      6.52 ± 66%      -4.9        1.60 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      6.52 ± 66%      -4.9        1.60 ±  5%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      4.73 ± 10%      -4.7        0.00        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
      6.18 ± 69%      -4.7        1.48 ±  6%  perf-profile.calltrace.cycles-pp.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.18 ± 69%      -4.7        1.48 ±  6%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
      6.07 ± 71%      -4.6        1.44 ±  6%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat.__x64_sys_unlink
      5.53 ± 78%      -4.3        1.20 ±  7%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.do_unlinkat
      1.79 ± 10%      -1.0        0.83 ±  5%  perf-profile.calltrace.cycles-pp.creat64
      1.77 ± 10%      -0.9        0.83 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.77 ± 10%      -0.9        0.83 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
      1.74 ± 10%      -0.9        0.82 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.74 ± 10%      -0.9        0.82 ±  5%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      1.73 ± 10%      -0.9        0.82 ±  5%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.73 ± 10%      -0.9        0.82 ±  5%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
      1.71 ± 10%      -0.9        0.82 ±  5%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      1.23 ± 12%      -0.8        0.47 ± 44%  perf-profile.calltrace.cycles-pp.down_write.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      1.22 ± 12%      -0.8        0.47 ± 44%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.open_last_lookups.path_openat.do_filp_open
      0.47 ± 47%      +1.1        1.60 ±  8%  perf-profile.calltrace.cycles-pp.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified
      0.47 ± 47%      +1.1        1.61 ±  8%  perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.48 ± 46%      +1.1        1.62 ±  8%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      0.00            +1.5        1.51 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve
      0.00            +1.5        1.52 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc
      0.00            +1.6        1.56 ±  8%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time
      2.16 ±  5%      +3.9        6.07 ±  2%  perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      0.00            +4.1        4.15 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified
      0.00            +4.2        4.16 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks
      0.00            +4.2        4.18 ±  2%  perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write
      1.50 ±  8%      +4.5        6.00 ±  2%  perf-profile.calltrace.cycles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write
      1.16 ± 12%      +4.8        5.96 ±  2%  perf-profile.calltrace.cycles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_write
     16.03 ±  5%     +73.1       89.14        perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
     22.33 ±  5%     +73.3       95.62        perf-profile.calltrace.cycles-pp.write
     21.55 ±  5%     +74.0       95.52        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     21.45 ±  5%     +74.1       95.51        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     21.18 ±  5%     +74.3       95.47        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     20.84 ±  4%     +74.6       95.44        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     19.71 ±  4%     +75.6       95.31        perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.90 ±  6%     +85.1       88.04        perf-profile.calltrace.cycles-pp.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      2.08 ±  6%     +85.9       87.94        perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
      0.00           +86.4       86.44        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin
      0.00           +86.7       86.66        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter
      0.56 ±  6%     +86.8       87.38        perf-profile.calltrace.cycles-pp.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.00           +87.1       87.08        perf-profile.calltrace.cycles-pp.__time_stats_update.xfs_ilock_for_iomap.xfs_buffered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
     64.85 ±  5%     -63.6        1.23 ±  6%  perf-profile.children.cycles-pp.read
     63.35 ±  5%     -62.3        1.07 ±  6%  perf-profile.children.cycles-pp.ksys_read
     63.01 ±  5%     -62.0        1.03 ±  6%  perf-profile.children.cycles-pp.vfs_read
     62.12 ±  5%     -61.2        0.93 ±  7%  perf-profile.children.cycles-pp.xfs_file_read_iter
     61.97 ±  5%     -61.1        0.90 ±  7%  perf-profile.children.cycles-pp.xfs_file_buffered_read
     29.08 ±  6%     -28.5        0.62 ±  9%  perf-profile.children.cycles-pp.filemap_read
     27.41 ±  4%     -27.0        0.39 ±  3%  perf-profile.children.cycles-pp.xfs_ilock
     26.44 ±  4%     -26.2        0.24 ±  5%  perf-profile.children.cycles-pp.down_read
     22.11 ±  6%     -22.0        0.16 ±  7%  perf-profile.children.cycles-pp.touch_atime
     22.08 ±  6%     -21.9        0.16 ±  7%  perf-profile.children.cycles-pp.atime_needs_update
     12.80 ±  4%     -11.7        1.06 ±  2%  perf-profile.children.cycles-pp.iomap_write_iter
      7.51 ±  4%      -6.9        0.56 ±  2%  perf-profile.children.cycles-pp.iomap_write_begin
      7.06 ± 13%      -6.8        0.26        perf-profile.children.cycles-pp.xfs_iunlock
      8.53 ± 50%      -6.4        2.10 ±  3%  perf-profile.children.cycles-pp.down_write
      6.22 ± 15%      -6.2        0.02 ±141%  perf-profile.children.cycles-pp.up_read
      7.40 ± 59%      -5.4        2.03 ±  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      6.94 ± 63%      -5.1        1.86 ±  3%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      6.60 ± 65%      -5.0        1.61 ±  5%  perf-profile.children.cycles-pp.unlink
      6.52 ± 66%      -4.9        1.60 ±  5%  perf-profile.children.cycles-pp.__x64_sys_unlink
      6.52 ± 66%      -4.9        1.60 ±  5%  perf-profile.children.cycles-pp.do_unlinkat
      6.30 ± 69%      -4.7        1.57 ±  4%  perf-profile.children.cycles-pp.osq_lock
      4.75 ± 10%      -4.5        0.25 ± 18%  perf-profile.children.cycles-pp.filemap_get_pages
      4.50 ±  4%      -4.2        0.33 ±  2%  perf-profile.children.cycles-pp.__filemap_get_folio
      3.09 ±  6%      -2.8        0.25 ±  3%  perf-profile.children.cycles-pp.iomap_write_end
      2.70 ±  5%      -2.5        0.20 ±  2%  perf-profile.children.cycles-pp.__iomap_write_begin
      2.36 ±  5%      -2.2        0.15 ±  2%  perf-profile.children.cycles-pp.filemap_add_folio
      2.42 ±  7%      -2.2        0.24 ± 20%  perf-profile.children.cycles-pp.filemap_get_read_batch
      1.90 ±  7%      -1.7        0.21 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      1.90 ±  7%      -1.7        0.21 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.90 ±  7%      -1.7        0.21 ±  3%  perf-profile.children.cycles-pp.do_idle
      1.88 ±  7%      -1.7        0.21 ±  4%  perf-profile.children.cycles-pp.start_secondary
      1.78 ±  7%      -1.6        0.13 ±  4%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      1.74 ±  5%      -1.6        0.11 ±  3%  perf-profile.children.cycles-pp.__filemap_add_folio
      1.82 ±  7%      -1.6        0.21 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.91 ±  5%      -1.5        0.38        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.70 ±  7%      -1.5        0.19 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      1.70 ±  7%      -1.5        0.19 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.67 ±  7%      -1.5        0.19 ±  4%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.66 ±  7%      -1.5        0.19 ±  4%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.54 ±  6%      -1.4        0.16 ±  3%  perf-profile.children.cycles-pp.__close
      1.54 ±  6%      -1.4        0.16 ±  3%  perf-profile.children.cycles-pp.__x64_sys_close
      1.52 ±  6%      -1.4        0.16 ±  3%  perf-profile.children.cycles-pp.__fput
      1.51 ±  6%      -1.4        0.15 ±  2%  perf-profile.children.cycles-pp.dput
      1.50 ±  6%      -1.4        0.15 ±  2%  perf-profile.children.cycles-pp.__dentry_kill
      1.47 ±  6%      -1.3        0.15 ±  3%  perf-profile.children.cycles-pp.evict
      1.46 ±  6%      -1.3        0.15 ±  3%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      1.34 ±  7%      -1.2        0.14 ±  5%  perf-profile.children.cycles-pp.zero_user_segments
      1.30 ±  7%      -1.2        0.13 ±  5%  perf-profile.children.cycles-pp.memset_orig
      1.25 ±  5%      -1.2        0.09        perf-profile.children.cycles-pp.filemap_dirty_folio
      1.26 ±  5%      -1.0        0.26 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.10 ±  8%      -1.0        0.11 ±  4%  perf-profile.children.cycles-pp.copy_page_to_iter
      1.81 ± 10%      -1.0        0.84 ±  5%  perf-profile.children.cycles-pp.do_sys_openat2
      1.79 ± 10%      -1.0        0.83 ±  5%  perf-profile.children.cycles-pp.creat64
      1.78 ± 10%      -1.0        0.83 ±  5%  perf-profile.children.cycles-pp.do_filp_open
      1.78 ± 10%      -0.9        0.83 ±  5%  perf-profile.children.cycles-pp.path_openat
      1.74 ± 10%      -0.9        0.82 ±  5%  perf-profile.children.cycles-pp.__x64_sys_creat
      1.03 ±  6%      -0.9        0.14 ±  3%  perf-profile.children.cycles-pp.__xfs_trans_commit
      1.00 ±  8%      -0.9        0.10 ±  3%  perf-profile.children.cycles-pp._copy_to_iter
      1.71 ± 10%      -0.9        0.82 ±  5%  perf-profile.children.cycles-pp.open_last_lookups
      0.93 ±  6%      -0.8        0.11 ±  3%  perf-profile.children.cycles-pp.xlog_cil_commit
      0.87 ±  4%      -0.8        0.06 ±  7%  perf-profile.children.cycles-pp.folio_alloc
      0.79 ±  5%      -0.7        0.06 ±  6%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.71 ±  5%      -0.7        0.06 ±  9%  perf-profile.children.cycles-pp.__alloc_pages
      0.86 ±  5%      -0.7        0.20 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.84 ±  4%      -0.6        0.20 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.72 ±  7%      -0.6        0.10 ±  5%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.71 ±  8%      -0.6        0.08        perf-profile.children.cycles-pp.xas_load
      0.72 ±  8%      -0.6        0.09        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.70 ±  6%      -0.6        0.08 ± 10%  perf-profile.children.cycles-pp.rw_verify_area
      0.66 ±  4%      -0.6        0.05        perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.65 ±  8%      -0.6        0.06 ±  7%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.61 ±  6%      -0.6        0.06        perf-profile.children.cycles-pp.filemap_get_entry
      0.60 ±  6%      -0.5        0.05 ±  7%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.64 ±  5%      -0.5        0.14 ±  3%  perf-profile.children.cycles-pp.up_write
      0.53 ±  6%      -0.5        0.06 ±  6%  perf-profile.children.cycles-pp.security_file_permission
      0.72 ±  8%      -0.5        0.25 ±  3%  perf-profile.children.cycles-pp.ret_from_fork
      0.72 ±  8%      -0.5        0.25 ±  3%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.53 ±  7%      -0.5        0.06 ±  6%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.71 ±  8%      -0.5        0.25 ±  3%  perf-profile.children.cycles-pp.kthread
      0.52 ±  7%      -0.5        0.06        perf-profile.children.cycles-pp.__cond_resched
      0.52 ±  7%      -0.5        0.06 ±  8%  perf-profile.children.cycles-pp.__fdget_pos
      0.50 ±  5%      -0.5        0.04 ± 44%  perf-profile.children.cycles-pp.folios_put_refs
      0.51 ±  7%      -0.4        0.06 ±  7%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.59 ±  5%      -0.4        0.16 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.67 ±  8%      -0.4        0.24 ±  3%  perf-profile.children.cycles-pp.worker_thread
      0.86 ±  8%      -0.4        0.43 ±  2%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.48 ±  7%      -0.4        0.05 ±  8%  perf-profile.children.cycles-pp.iomap_iter_advance
      0.56 ±  5%      -0.4        0.14 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.63 ±  9%      -0.4        0.23 ±  3%  perf-profile.children.cycles-pp.process_one_work
      0.46 ±  7%      -0.4        0.07 ±  7%  perf-profile.children.cycles-pp.__schedule
      0.45 ±  7%      -0.4        0.06 ±  8%  perf-profile.children.cycles-pp.fault_in_readable
      0.60 ±  8%      -0.4        0.22 ±  2%  perf-profile.children.cycles-pp.xfs_inodegc_worker
      0.43 ±  5%      -0.4        0.05        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.59 ±  9%      -0.4        0.22 ±  2%  perf-profile.children.cycles-pp.xfs_inactive
      0.50 ±  5%      -0.4        0.13 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.40 ±  6%      -0.4        0.04 ± 44%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.41 ±  7%      -0.4        0.06        perf-profile.children.cycles-pp.schedule
      0.36 ±  6%      -0.3        0.06        perf-profile.children.cycles-pp.load_balance
      0.35 ±  7%      -0.3        0.05 ±  8%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.34 ±  7%      -0.3        0.05        perf-profile.children.cycles-pp.newidle_balance
      0.33 ± 10%      -0.3        0.06        perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.32 ±  7%      -0.3        0.05 ±  7%  perf-profile.children.cycles-pp.find_busiest_group
      0.31 ±  6%      -0.3        0.05        perf-profile.children.cycles-pp.update_sd_lb_stats
      0.29 ±  7%      -0.2        0.05        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.28 ±  9%      -0.2        0.05        perf-profile.children.cycles-pp.xfs_buf_read_map
      0.36 ±  8%      -0.2        0.14 ±  3%  perf-profile.children.cycles-pp.xfs_inactive_ifree
      0.27 ±  9%      -0.2        0.05        perf-profile.children.cycles-pp.xfs_buf_get_map
      0.32 ±  7%      -0.2        0.10 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.24 ±  7%      -0.2        0.05        perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.44 ±  7%      -0.2        0.27 ±  3%  perf-profile.children.cycles-pp.lookup_open
      0.35 ±  7%      -0.2        0.19 ±  3%  perf-profile.children.cycles-pp.xfs_generic_create
      0.27 ±  9%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.vfs_unlink
      0.26 ±  9%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.xfs_remove
      0.26 ±  9%      -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.xfs_vn_unlink
      0.34 ±  7%      -0.2        0.18 ±  2%  perf-profile.children.cycles-pp.xfs_create
      0.23 ± 10%      -0.1        0.08        perf-profile.children.cycles-pp.xfs_inactive_truncate
      0.21 ±  8%      -0.1        0.08        perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.18 ±  6%      -0.1        0.06        perf-profile.children.cycles-pp.task_tick_fair
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.main
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.run_builtin
      0.06 ± 11%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_vn_lookup
      0.06 ±  9%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_lookup
      0.05 ±  8%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.xfs_dir_lookup
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_iget
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.xfs_iget_cache_hit
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.local_clock
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.xfs_icreate
      0.00            +0.1        0.07 ±  8%  perf-profile.children.cycles-pp.xfs_ilock_data_map_shared
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.xfs_lock_two_inodes
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.00            +0.3        0.29 ±  4%  perf-profile.children.cycles-pp.time_stats_update_one
      0.66 ± 11%      +1.0        1.65 ±  8%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.64 ± 12%      +1.0        1.65 ±  8%  perf-profile.children.cycles-pp.xfs_log_reserve
      0.66 ± 11%      +1.0        1.67 ±  8%  perf-profile.children.cycles-pp.xfs_trans_alloc
      2.22 ±  5%      +3.9        6.08 ±  2%  perf-profile.children.cycles-pp.xfs_file_write_checks
     95.43            +3.9       99.29        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     95.26            +4.0       99.27        perf-profile.children.cycles-pp.do_syscall_64
      1.53 ±  8%      +4.5        6.01 ±  2%  perf-profile.children.cycles-pp.kiocb_modified
      1.16 ± 12%      +4.8        5.96 ±  2%  perf-profile.children.cycles-pp.xfs_vn_update_time
     22.63 ±  5%     +73.1       95.68        perf-profile.children.cycles-pp.write
     16.06 ±  5%     +73.1       89.14        perf-profile.children.cycles-pp.iomap_file_buffered_write
     21.25 ±  5%     +74.3       95.50        perf-profile.children.cycles-pp.ksys_write
     20.91 ±  4%     +74.6       95.47        perf-profile.children.cycles-pp.vfs_write
     19.76 ±  4%     +75.6       95.31        perf-profile.children.cycles-pp.xfs_file_buffered_write
      2.94 ±  6%     +85.1       88.04        perf-profile.children.cycles-pp.iomap_iter
      2.17 ±  6%     +85.8       87.96        perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      0.59 ±  7%     +86.8       87.42        perf-profile.children.cycles-pp.xfs_ilock_for_iomap
      0.16 ± 11%     +92.4       92.54        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.36 ±  6%     +92.4       92.80        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00           +93.3       93.28        perf-profile.children.cycles-pp.__time_stats_update
     26.23 ±  4%     -26.0        0.22 ±  5%  perf-profile.self.cycles-pp.down_read
     21.75 ±  6%     -21.6        0.14 ±  9%  perf-profile.self.cycles-pp.atime_needs_update
      6.18 ± 15%      -6.2        0.01 ±223%  perf-profile.self.cycles-pp.up_read
      6.25 ± 70%      -4.7        1.56 ±  4%  perf-profile.self.cycles-pp.osq_lock
      2.07 ±  8%      -1.9        0.20 ± 22%  perf-profile.self.cycles-pp.filemap_get_read_batch
      1.74 ±  7%      -1.6        0.12 ±  3%  perf-profile.self.cycles-pp.iomap_set_range_uptodate
      1.29 ±  7%      -1.2        0.13 ±  5%  perf-profile.self.cycles-pp.memset_orig
      1.06 ±  7%      -1.0        0.08 ±  5%  perf-profile.self.cycles-pp.filemap_read
      0.97 ±  6%      -0.9        0.05 ±  7%  perf-profile.self.cycles-pp.down_write
      0.98 ±  8%      -0.9        0.10 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      0.77 ±  7%      -0.7        0.09 ±  5%  perf-profile.self.cycles-pp.acpi_safe_halt
      0.71 ±  7%      -0.6        0.10 ±  5%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.54 ±  8%      -0.5        0.06        perf-profile.self.cycles-pp.vfs_write
      0.52 ±  7%      -0.5        0.06        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.56 ±  6%      -0.4        0.12 ±  3%  perf-profile.self.cycles-pp.up_write
      0.50 ±  7%      -0.4        0.05 ±  7%  perf-profile.self.cycles-pp.__fdget_pos
      0.48 ±  6%      -0.4        0.04 ± 44%  perf-profile.self.cycles-pp.vfs_read
      0.85 ±  8%      -0.4        0.43 ±  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.46 ±  7%      -0.4        0.05        perf-profile.self.cycles-pp.iomap_iter_advance
      0.44 ±  8%      -0.4        0.06 ±  8%  perf-profile.self.cycles-pp.fault_in_readable
      0.45 ±  7%      -0.3        0.18 ±  2%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      0.28 ±  7%      -0.2        0.10        perf-profile.self.cycles-pp.xfs_iunlock
      0.20 ±  9%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.11 ±  7%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.xfs_ilock_for_iomap
      0.21 ±  3%      +0.0        0.26 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.2        0.20 ±  2%  perf-profile.self.cycles-pp.__time_stats_update
      0.00            +0.3        0.25 ±  5%  perf-profile.self.cycles-pp.time_stats_update_one
      0.16 ± 11%     +92.4       92.54        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

