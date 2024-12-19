Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E33217641
	for <oe-lkp@lists.linux.dev>; Thu, 19 Dec 2024 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597649; cv=fail; b=ZXSZ2UZJQfNuSWcDp5nNCHNMnr28G0W4ofKXMZJX8k/B761H5ZNb4x+ATZc7/ujeRR7vSyVh8QTkMj8mxfd8WPWKwcamfyEQf8/KffbLm8HUlPNTYmI2sk+ifImowyJhAogrOeJsc11qu95y76QhDd9b9WZub2QCh+0I+ht3yWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597649; c=relaxed/simple;
	bh=BAKQjQ3PPfMtRGTgb/YrJuqOKHotSPU0urZlTwh7edU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KKatfB1QgpsNiLzmcQYITaoDDyBI5lmS5hxskIC5HAax7i49alukp/aKPFrhHovPuEkpEXgMOrujzeV6ri2RWbaABEso/MbBuS1lNbJwzxsZUznPFRkSbFemYbzarTSBhB5ZRe+FnGDNsvqZpykxaYdZQhMyRL1/6J32nOkJg3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pbu66G7n; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pbu66G7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734597647; x=1766133647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BAKQjQ3PPfMtRGTgb/YrJuqOKHotSPU0urZlTwh7edU=;
  b=Pbu66G7nVkYRuE3w1FO3I0M7TIPSIScQMII1Gaq8HBHSAbzDvlI1VabM
   IbgbPjuZe1Luy0PfePqYzVvDvcjCFFecxj4O8vSETUcB0P4/uQvniywNw
   VWf7Vsb4M4l2vCFguozD9KVAJQXLV394zNr0n1W3yu9CI66VXxKOVx2Jf
   uIpyDk4Zj/amsCB8iuerh7tZTzu656K11WHCU/vYSXuwzSwf0BYz/xTPl
   Loeo7xPBwnU9nrm3NgLdRmrJHs3SLx3bXpDA+HFzBUtiiQwO8Gfhhn039
   UI0Vlez+B8sVTxgHDar8Wum9zLExU6AhrSpRPhuZSTa+aH1YWi8NcrYzs
   g==;
X-CSE-ConnectionGUID: 3KRMe46/SaWDHYOPQi4G4Q==
X-CSE-MsgGUID: E/InVjV9QhG6JL+FOjN+zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="37942631"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="37942631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 00:40:46 -0800
X-CSE-ConnectionGUID: 7bXHG4RmRASCqJqjqcsWFg==
X-CSE-MsgGUID: 9qambbeJR2+Yga9h9MCJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102265949"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 00:40:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 00:40:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 00:40:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 00:40:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nvtt8K9QrWghoKwz6hQVDcz4QvZITbc/JVBH+2Wi8yWviEorFKDg8mN9F8b1Qk4Eexl5SZ9Fl73RvRCViOjmAVb92YmVe4opQw5wPEwidGfu7buIzjuUE1eabTX1B+0xZsG8+hzAc7xvZZMWNrJ+sPW6NQZB+N0wX/UBH0OcHN2+7fOB2juygXGdK9JRJgYkPwuGmzxkvZ2pCFQFnTPyUGZ+b2iVXK+ZcUKsz0qvOZpMwGn4zGJcJZoAENbWQquxWAFRgX9Hfx/XqmiQEO3l3lqiIn0F4xfWinRf7ffqEeLoPKiSG49bALxLe7BB3dosMR+MndYYLf8h1tWtnroPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BZDxVxtl14sfXatgKCReKKbicatVnWXNemqUJRfMqU=;
 b=xxi99CdguRWsY4f1M20x1ibcO/7wQONp/oXIEfc07tD6kfZ+z5Bk02YFY297CGvt9fplyAM8Q2d1u0zjXfBuiIPF15KX5NDz0hcZ8w3zIy+lX2jcBpXLqshLUrKAjwUEXoPOa3RVx7rw1Gi2w9iKEMC0fAnA1wvv7POJeKqBsqxCZ7gBw/m9SrnKS9e35wbUG5LGyWd0lB02YQ9NtlniJN4wqEuG5G0D9IvS69gBCvfQWl4hvKyJ9K8oikUcnJw33xF5Ynx6FA1UWsjNBij02EokbQ8T983cgDALRmROntfD9QmqoxTuzg/ht+JUPAQmGtyKS0uT2HMRwik87+HGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 08:40:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 08:40:15 +0000
Date: Thu, 19 Dec 2024 16:40:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, <oliver.sang@intel.com>
Subject: [linus:master] [clocksource]  76031d9536:  RIP:clocksource_watchdog
Message-ID: <202412191612.fdac00f9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: e70a7c13-c34d-4d59-e320-08dd2008c273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pXeouXadboD19LeFHJL4XKuGBQiaMstfxtV7k2VemcVriJMo4RvQTucTrG83?=
 =?us-ascii?Q?uxGc3hFKgbGTVgKufWNaGPEmPylH2U9itbCMove5wjDrRqcNoYcgHtI8gT0t?=
 =?us-ascii?Q?LA6G6lFfY/FdqJf6Avt4TMVKvnY5mALrbx3RCrkGiFBe2EceQSa/acu5+dUK?=
 =?us-ascii?Q?3YibDzwD/J8Eim2tbqn7tMb4DFhKranGXogCTEpeJUlCP2+wJcPKmWM7NMB6?=
 =?us-ascii?Q?tkM94e6EysyUpvmpjpRXj68UO/Vxrn+qqDbXAtbl3Wrp1Tx7Vq2x3Ua7gUIq?=
 =?us-ascii?Q?let0E34S70FfRchzw1nbi4uUB/xdZplk8ZdL/XznhXXzxrisGGhx/iSueR3s?=
 =?us-ascii?Q?Mn4yZ1AFp4QyFFR3y4jDC3E4lUn/rL4xD+yMIjTl3qrpuqOdiKW35lXYn4GO?=
 =?us-ascii?Q?MOA6PNWtvG2Ed9a/vtuHG+u6NhLYW3ULk0Shqtob6YF2lKMj8snj66aoJmWW?=
 =?us-ascii?Q?6XyZuTk+faiJMpsJLsLjw1/87302eH5brgAcJA6xu9IavUhpnSDPP8umzHOC?=
 =?us-ascii?Q?rlkI4lAHV/5ehpN+n8HLvvQUiT1GXHuP2cNhxgMnLlcYIWRUxaucAh7BcFYY?=
 =?us-ascii?Q?VjQo8Wr/IdDmKBJeReo0xCuw5JS+ixXmfOcfaYGB2Jzld69qPJMVPrrhIDRi?=
 =?us-ascii?Q?A0WvT/Y5wFL4FYdjfUnp3afJloJECuqPB+st78tuAUhWg/iCLbK/0MNy60mR?=
 =?us-ascii?Q?xiRmZHPEdwHPI/drL5Srmsw8t5trP/8M34YiVuQ7tedLjc+8RmVFjJNRZ0Qj?=
 =?us-ascii?Q?1afzloo8dA+XUh1oSnbN0VeKFJ4VVAtI+TieoTh0vH03DFmSNyPIH1OUDSCR?=
 =?us-ascii?Q?7ShkNM7+94JCpZzmgyNieez6NoXuEz9hk3BLZUa1H7SDCe780qmgwPk+mpSz?=
 =?us-ascii?Q?kiOm5Cnvgks6Vta6UxCVYfcIQGSlpiEPgUSYnOPFWhL84bz6MIWInZF7gEo2?=
 =?us-ascii?Q?SGSKatPz6gT4EQz+tddYXKdZvtoaxqdODKG0wwxI7XyBMj9xqqztsXx5FTzs?=
 =?us-ascii?Q?MctPCosUm/DfM85haWyqKQwUrg93PBAARnz25gpPFh5qb5Df+5VGl6f1fBdz?=
 =?us-ascii?Q?bPZoa2O9Yftf6Kvx9pv8PG1lVhqmlheifsCirlxWC8KV3OEhA2dzeMH0E5k9?=
 =?us-ascii?Q?0bYmSKJ/SM9GTpgQQmWDkmwb/xEMqFlBvtqYUVlpFbORE99+QhpsJtzLHt+F?=
 =?us-ascii?Q?zZRFLqbYmDIs4CJIgKyj779MnLeppuS1gah6UXSS7H+pLbjJbSmHN0U8A1wL?=
 =?us-ascii?Q?OrgcUZbCnSRiqF5DMjMwNADc8V0phh3sYmT00IJrHFURn8IaUnkVnK+UnJO6?=
 =?us-ascii?Q?+M3QuDzTniR6yIjUOuTkdxlxTER+OYy6eC1VJXmt57mubQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qMKX30aROpFJR+7Wv8LDuR12pvU76cYM0Ho+JmP3Gw/GSzYs5mjRm58dZ2t+?=
 =?us-ascii?Q?VHuAya/t40occsgZUM08LkHr+9Pwk/4TYCximZwGFYRRNZm7JIoQ6qDYscNb?=
 =?us-ascii?Q?yxJI6KoxGMCNbXu+le7z5pf+l2/IzoEVFAVPVGifCsvGpslhMQQC2QUVAG9Y?=
 =?us-ascii?Q?vAMEBqOPURPIB8Uy+5aZnl8/1seNE0hUCWZPunll+67TzqmuPFxXVaaACeRu?=
 =?us-ascii?Q?Mp6DpjBpjHFtl5ODKo9a659UjnqVYNdI7qr0mNcCZI9WWUIHjW7IUKPNYZ1U?=
 =?us-ascii?Q?kYk6Qz3Q0P7RuU33iV2D8sNt/0wTLI9XcpWxlw9MCDqyEqYzaTqJBblvjMh6?=
 =?us-ascii?Q?iuPowCUTg0KeGAqoymPrTCaznPdydnbSVdD7qDtrbNNpMKFQ9zij0UWsQH7H?=
 =?us-ascii?Q?6YLTDRIluwnAYZ5LeESLwQ9x7sq/4cqDfeVqFdL59qYfAChvfRvEH0R0OBER?=
 =?us-ascii?Q?N59sL1+RwYKJv65T1p6QdEo4dtdVUcGNZUAELNkJxvJg+rq66lqpMs6T6OIc?=
 =?us-ascii?Q?69KSoT5JZXm0tcxu0lBrqMFpc7AsYVyvmxJRJdkmgJgKeYub3RYjCdLBZYF5?=
 =?us-ascii?Q?lTLr+YmMKkeF0NxBpVS8GtyhXmiLG2VpgkGLCIUZ6stbOaNXd18vCFAUy97Z?=
 =?us-ascii?Q?2qGaYwnFNuDNgD9WG5KexbaHRW4ubIhYAi7EtfcS6lV0T5y9qKKSOT4gSTTX?=
 =?us-ascii?Q?T0BnVASaYoa6IWSVgHHlRVuqUXE+y15S3MSv2ZT088bV4kB3mNSS5V1/36eQ?=
 =?us-ascii?Q?zE3PHTsCGnSxR4CBfODAwf6l8mTGSVEdrIFEfAMh6nhYElKgP6o4w3OGQHLW?=
 =?us-ascii?Q?X0iFcUUUxiB2dn9Bt4ePhnrv+7aK49x5GyrBIiOAFacv9sNmwzNm1TkDDfNx?=
 =?us-ascii?Q?U8SRBJCUMdA2sYStiCT1IEQGoQ9ZZ/xfmwOiJuB4W2qGZ8chB3VpzIeXFE3U?=
 =?us-ascii?Q?Xg+7ll4ANEaeE/VZk3U4SHzxmSmdPSee+jWYI3DsrpbhpSlkr6KlIUuFWNwb?=
 =?us-ascii?Q?a2B4lWd2mwRdd/Qi4W0yFlRhMSUDsJXFd3df/2jze/fOklV5DbXp5bLAZczR?=
 =?us-ascii?Q?o0Ga+2ak3yO6RV2yDqi2Ha82sE6u+b26T1WZaOWmko8gdWaiheBfLbo23C5m?=
 =?us-ascii?Q?Lv8iHtZZN7BLY4fnGV1fxNqT4GAHtHA09aVbC5Ixi7gsNmgRzwgC61JuGCMQ?=
 =?us-ascii?Q?umbtPZNmI5qpeFHkkMdfSmz0O5/VlkpvwqWh4wQfvrL6FcLjFQdVOpoqQ9wD?=
 =?us-ascii?Q?/JvNKlSCQd3b8uW32k9MGr/lVrLGjrWM1bnOYOZ6H4yZ6Hm7yZuB37cR1Ea4?=
 =?us-ascii?Q?ma0tsqZTMS1ZE6FD5JWwS3bnHBVAlBzmg3nhY0tRAnpvSoRHg6g9JkxtfYRi?=
 =?us-ascii?Q?7MtNV4D5ch45NTbxkj5pjvW63XFJit60yArq6Aa4qRk2d6b+pyRZSPrCO/uW?=
 =?us-ascii?Q?e8gO7RwlWK4dQ3vkQOhmFy86Bz7pbZFE2wjnBEr1tbEHx7JAgA52idnzmyTT?=
 =?us-ascii?Q?kvVcyV1CCRVx7iN58xK0ajDIjGMu9aIRLpU2bcEe+wurj7iKC6yfCpThuv8G?=
 =?us-ascii?Q?FkXdXANJM/HSokLtddILNgBMV5Fg5HH/jTIkWNNiaP5vqKoEtEQqp6xd2qRE?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e70a7c13-c34d-4d59-e320-08dd2008c273
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 08:40:15.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D9tMZlrPg61N4W+3sLGdif7QWiiv7glMMbMhCSPz/lTwH8fdDTq27lKXuJbLGovudjMUFvzPMqbmjYJrhArnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "RIP:clocksource_watchdog" on:

commit: 76031d9536a076bf023bedbdb1b4317fc801dd67 ("clocksource: Make negative motion detection more robust")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: kunit
version: 
with following parameters:

	group: group-01



config: x86_64-rhel-9.4-kunit
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412191612.fdac00f9-lkp@intel.com



[  747.568289][    C0] Oops: general protection fault, probably for non-canonical address 0xee0da9ec6bec8dc6: 0000 [#1] PREEMPT SMP KASAN PTI
[  747.571923][ T6047] raid6test: test_disks(1, 4): faila=  1(D)  failb=  4(Q)  OK
[  747.584305][    C0] KASAN: maybe wild-memory-access in range [0x706d6f635f646e30-0x706d6f635f646e37]
[  747.584309][    C0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S  B   W        N 6.13.0-rc1-00002-g76031d9536a0 #1
[  747.591625][ T6047] raid6test: test_disks(2, 3): faila=  2(D)  failb=  3(P)  OK
[  747.600721][    C0] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [W]=WARN, [N]=TEST
[  747.600722][    C0] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[ 747.600724][ C0] RIP: 0010:clocksource_watchdog (kbuild/src/consumer/kernel/time/clocksource.c:446)
[  747.611497][ T6047] raid6test: test_disks(2, 4): faila=  2(D)  failb=  4(Q)  OK
[ 747.618774][ C0] Code: 08 00 00 49 8b 84 24 a0 00 00 00 4c 8d a0 60 ff ff ff 48 3d a0 65 a1 85 0f 84 a9 05 00 00 4d 8d 74 24 60 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 0f 85 2b 08 00 00 41 f6 44 24 60 40 75 9e 48 8d 84
All code
========
   0:	08 00                	or     %al,(%rax)
   2:	00 49 8b             	add    %cl,-0x75(%rcx)
   5:	84 24 a0             	test   %ah,(%rax,%riz,4)
   8:	00 00                	add    %al,(%rax)
   a:	00 4c 8d a0          	add    %cl,-0x60(%rbp,%rcx,4)
   e:	60                   	(bad)
   f:	ff                   	(bad)
  10:	ff                   	(bad)
  11:	ff 48 3d             	decl   0x3d(%rax)
  14:	a0 65 a1 85 0f 84 a9 	movabs 0x5a9840f85a165,%al
  1b:	05 00 
  1d:	00 4d 8d             	add    %cl,-0x73(%rbp)
  20:	74 24                	je     0x46
  22:	60                   	(bad)
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)		<-- trapping instruction
  2f:	0f 85 2b 08 00 00    	jne    0x860
  35:	41 f6 44 24 60 40    	testb  $0x40,0x60(%r12)
  3b:	75 9e                	jne    0xffffffffffffffdb
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	84                   	.byte 0x84

Code starting with the faulting instruction
===========================================
   0:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   5:	0f 85 2b 08 00 00    	jne    0x836
   b:	41 f6 44 24 60 40    	testb  $0x40,0x60(%r12)
  11:	75 9e                	jne    0xffffffffffffffb1
  13:	48                   	rex.W
  14:	8d                   	.byte 0x8d
  15:	84                   	.byte 0x84
[  747.618778][    C0] RSP: 0018:ffffc90000007cc8 EFLAGS: 00010206
[  747.626349][ T6047] raid6test: test_disks(3, 4): faila=  3(P)  failb=  4(Q)  OK
[  747.634233][    C0] RAX: 0e0dadec6bec8dc6 RBX: ffffffffc12501e0 RCX: ffffffff812d27b5
[  747.634235][    C0] RDX: fffffbfff0b42cad RSI: 0000000000000008 RDI: ffffffffc1255c20
[  747.634237][    C0] RBP: 0000000000000000 R08: 0000000000000001 R09: fffffbfff0b42cac
[  747.634249][    C0] R10: ffffffff85a16567 R11: 1ffff11074f88ce0 R12: 706d6f635f646dd3
[  747.643325][ T6047] raid6test: testing the 11-disk case...
[  747.647354][    C0] R13: ffff8883a7c31b40 R14: 706d6f635f646e33 R15: dffffc0000000000
[  747.647357][    C0] FS:  0000000000000000(0000) GS:ffff8883a7c00000(0000) knlGS:0000000000000000
[  747.647359][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  747.647361][    C0] CR2: 000055850fddbb28 CR3: 000000041b46c004 CR4: 00000000001726f0
[  747.647373][    C0] DR0: ffffffff8788e584 DR1: ffffffff8788e585 DR2: ffffffff8788e582
[  747.647375][    C0] DR3: ffffffff8788e583 DR6: 00000000fffe0ff0 DR7: 0000000000000600
[  747.666802][ T6047] raid6test: test_disks(0, 1): faila=  0(D)  failb=  1(D)  OK
[  747.672676][    C0] Call Trace:
[  747.672677][    C0]  <IRQ>
[ 747.672679][ C0] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460)
[ 747.672694][ C0] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751 kbuild/src/consumer/arch/x86/kernel/traps.c:693)
[  747.680000][ T6047] raid6test: test_disks(0, 2): faila=  0(D)  failb=  2(D)  OK
[ 747.687783][ C0] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:617)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241219/202412191612.fdac00f9-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

