Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D764E7FBA2
	for <oe-lkp@lists.linux.dev>; Fri, 27 Feb 2026 02:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158367; cv=fail; b=twzt35TRN2m7eqQaroI78/bNxIhSMXpCoXddiDRPu/REg6cyLa6TtmSV3iqlWEh5ElQLQS0LJII1yvHUDz7RW6LouAkaPID8MqxjEwJqsvOrstPNzyNKE/+jxovw4eVelNQDgRl4Vq5KEQGRNxMdDexkRGGbr3ggzVQ2JraI00E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158367; c=relaxed/simple;
	bh=exUzhezo1Kybycvur3u5CT1ivm3/Ca7aJrkz+6fLwYM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DhLr5rw1/1FG1Ce0m+k9/CcoGZYk5xngecTi83eewk7s8WfXrtJ/6ujA4tlkBDTRX13lEjNtFGz6WwSqFGWRx9AUPqjWHZvMVJe0YMOg/w+7TK1p9ojwXX3YsgOgJt4nNy5j37qhxeWaXdIPXA7hWdNBPAjFhGBbxQXfMNmFS1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNAazBF0; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNAazBF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772158366; x=1803694366;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=exUzhezo1Kybycvur3u5CT1ivm3/Ca7aJrkz+6fLwYM=;
  b=DNAazBF0HELeiz5fB+wDdFDTTbLG5UITi6H7Gyizv0Y0Z1bQqsOOwj3D
   Oc4SOV/2lvR+wvPIvkz09kuoN9mwNqkFyhViqrZTQVgFAFXV127SmNBwJ
   GVOiaaA1Aw+Q0Ksz8CzUn71yo4Wi8dbj2aaJXnqIIRbDxhcKTCJRjQTya
   jbjiSXuQR0BughGRdHa24s7FMk/qnJlhIddR4ksFRYOVu+AhuDkY0YBDz
   bI+dlXWB2gczle0AG94DJD9mi3fg3Zr8o/CKm/soYhem7FMWsCgQjeltB
   CM3GevrMEZky3l1xbcJUw7sEoSmBBhHPVdZj3ucGH5rIpKybcIWn8WRxF
   g==;
X-CSE-ConnectionGUID: FSVSmF30TEKo15zBtQ0IZw==
X-CSE-MsgGUID: 2xAJHJlNQ+60zx1RSMFt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84590956"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="84590956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:12:45 -0800
X-CSE-ConnectionGUID: Hg9h3zE4TNGig7oHN5KDPA==
X-CSE-MsgGUID: sOsvWpqrRcGF9ippYy6b2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="221378292"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:12:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:12:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 18:12:44 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:12:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcCi7hwod9wrkMZf3XdI45NX2LmV1V9RWWHY2YBvUnJEVQhMXvxFHBswJc5MeCjg1EQSi3JxaKlH55jvftMG/CDYhXDy/v/j6vvJYdCn8hj3NEUGR/EMmeZ6zZZ65ZT2FnsuiG4i1tK/OpGp5LUKuI3n/Zp4gNb0v11qIUbtKeriRpWq0zbHIDaX9ljEYH8ddwXnlwxdqilAn6gD8E55HRh8MKAdGxKCb5xGWvFL7wGHfzfnbqThRQVG1691rb8LLAnsZnmaNiZVdQS6AqegFqrJ8QuRTVs9feSq/Amjxd6HH8GRgscHJoJL4l7+8TV1S/sO8u7uoDSXSS3eSmdr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Oz3FbmuuRHs9o8jpZdsGZQolOLJ1CGVmoaw51irJqw=;
 b=CIHC2bYktTvvPez/M9hXFRH0jUwdUh3Gx5EE24GY4w/lfIdG2uhayHbFpCmNnuTlJ7eVtBqKuwC6WvCkcl+yTtZnOJatRXC/cu084t9j8SNx8ThqViBzonCd9dXyUlBOKWUMLHaM74xlspoMLROOaw+czYopfsCTRF2HMIBg/t3zcIvKxoNfiMOw1wiaDpIHnllKiRRkZ6yR+zExbLiSanE5GwFAm+JmBoG6zIHYkJrXcJMpftT58rngOIepFk0m1wjFbC8yQJcRgdXmuT0bJNO9YexosFdv7jL+QEaR3V/subHGrjKYU3XmdfrSgnZ0vSWt69FpWzoaO+mqHuerQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 02:12:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 02:12:05 +0000
Date: Fri, 27 Feb 2026 10:11:56 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [thomas-weissschuh:b4/auxclock-nanosleep] aafb55d8d1:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <aaD9bHc0mZiMg65i@xsang-OptiPlex-9020>
References: <202602262005.2ceb43cb-lkp@intel.com>
 <1d3e70c9-8174-42e4-8e2c-e0717c32b63c@t-8ch.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d3e70c9-8174-42e4-8e2c-e0717c32b63c@t-8ch.de>
X-ClientProxiedBy: KU0P306CA0059.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 0774c222-38e1-4187-2ec0-08de75a59a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: EDCuhDO3cMbHboFDcmxZaddW4/tnnb6FLGuFHi0ai8NkRFp0XJXLgWmU+bbr2mZMCF82+xhb6N83unAI9Mk2TfwjMTZgOnHrVpYIB39u3Q13U6BjCJue96pzAs1qLXT3sqIq/aDSPRqKax+fxMEGGgDoeYxuJV9R53C7lG618UnDAey/isnOCrEdWda5ZUEfP95mkx9KAv81qp4Wj4HWhdF4red8sRZopI6Jk0jDNO27+sp58T/pgGolV5EWHKl4nf9bGr+26pAY/MG+Tor1JXuppALDV5FIrfNb1D/sLtcI3f9j/yedFeVSJKsLCAMXdCUjicGWm0Jg+zJC7bNnfwHADDJarpA86J54G1KzvV9qcGNP0M4VCy0PhE+C6eLJgz3JOPMl+b3Z16GjxUPLkYzmZVI8pUuvdGPpTpTi0CeXIFFtwYozJeqT/0bd2sFu8i2neVx3yGli+vyvjzgKAFx+Jdd+oZNzE+G2LvatWc/ulkCbXMdmXck5HMh4lhLEgrshbxPdlHCddXh36PiZFd0lJGK0jdopwAy/KC/90Kn+h6gGJMxGg8CWEg/FszI58ER2pqvRf2CBvpRfp+IEIPLtODmd8icUmvm+hILXy9X/QCwz+8LFbfUTcdaGTi4OpqVcotIVJMLwsr9ffmVl85j2md1V5gY01Pz/L0wUQiIOzRMfMv6N5vOpZokM8dqinIGpVAjiNpTjFShssmVJgpqYKm+iCWPisGWYcGnOmBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nJZo5dLQLdLo7u8J2JLEG+vmn7nKIogzOnbWggTrvv0+d8F7QDLThK3Vtt?=
 =?iso-8859-1?Q?hiXXTh5/N9xXTmj3RTLdY5I2rdX18rZ4blHVQrm7YuDHw7kqb4EM/ZqqAq?=
 =?iso-8859-1?Q?kVNVJsriUY+1C+KZpyVGXLIq5kju5aQb2FozCImE/VnFtM1zwKrHcteDbA?=
 =?iso-8859-1?Q?MwHID4TWqj2h8yNM7Oj7tz0UU3rMtwM8lwUBIZTqVQ0DZ0Tn86y1ZqX7SG?=
 =?iso-8859-1?Q?DWj5l3zPz6luPEOb2DtJ+w9OGxQUvkZTUFgFhjJv8SJ/UWNHQNMcktYLtN?=
 =?iso-8859-1?Q?NFp8js06RJKvX792OOb1QXxSFhvfbuC8eByZnolt97OQtHgrp7G/LkY6ox?=
 =?iso-8859-1?Q?A7CxWbPJnlArmrQbhl+hDoXBsKhbvuc2irCMGwNhSLLOehjkFlSPeSru9r?=
 =?iso-8859-1?Q?OD7UdSuyTSx78IihFudYqcrA6dvYZ8geZuM+tC0jaa9tUHrFadk/lcZ4on?=
 =?iso-8859-1?Q?rl1k1+leeFNqi6cgQTQotSYhhjYg73XA4KXVooAeALB5gy0BXezU5FTmAf?=
 =?iso-8859-1?Q?mGv6eT4afe3nQKpk3NVGEPD6HUh9478t148fPTT3cmUdGXGfgwh3LaH9ON?=
 =?iso-8859-1?Q?qIl7sVn8KKz63PfjJkNevtaZEPEedgYKd9hg4lN5RB89vj8BtVxMcskyRq?=
 =?iso-8859-1?Q?oFbVdav3WdMGHLNnY+c4+BcDUdSilZp2ccWz68fxpqXsQjrUe5DZzGosN5?=
 =?iso-8859-1?Q?jXSwWu1UJkeShN7mFAvYl01e9ZvN27TrwKfnYiJeOpOpoRnGwQhrPmw7YN?=
 =?iso-8859-1?Q?1Xpor1G9Feja08EAjDB+jsbx4hWLtOzIud8x0/xoQ194t9XmeBktxU83JC?=
 =?iso-8859-1?Q?ZpzQHFEGBtqo7VdLi3MytGw5BuZYqmv9au7n4mD5QgociHohFryGUWilll?=
 =?iso-8859-1?Q?KBzcV7UvAbDNsbKqSPeTL6IL2asyVv/zmUs9Bt5IhDKYd0OdK/Hdvx1x8z?=
 =?iso-8859-1?Q?b46yoGi3g96tTzSQ09qW674TV+96f6CMr5Txe9+O1QSpyZrfuqGCdHtdbL?=
 =?iso-8859-1?Q?7pdXLNpp6QJP+UcFI51gWeDkg0b8Ii7nL8IMy1zXwXmyi3+qcSWDc/IYDh?=
 =?iso-8859-1?Q?rkc3hsy1uqbw+A4HedsSdZbpgy7EaNhN3VjVA409UxTi9We7EzVtcfq5rP?=
 =?iso-8859-1?Q?kVLPtM4gkb9VNcVx4U0V/93v13Gvyh/qiCwoHymTkhchiOj0kUjuQptfc7?=
 =?iso-8859-1?Q?h10xxhBjkmlLU42LcD2p4YkHmC64A1ehwVlBVo0+ghAKfMk3fkjRC2is9z?=
 =?iso-8859-1?Q?ssCuFlnHZaI9x6324MhuvLZVLhUNw8x7tsfw4gcCwfT2mqGBTCEoFviHyP?=
 =?iso-8859-1?Q?diOYzlebt2TtZJftFHAi0BpOeEB4ubWz38R1KKVTLSMBH/91H+VipFcuDW?=
 =?iso-8859-1?Q?cT7bHE+jU3fFL2BXhAMNXqxV3vz0KulETrgBLys7yCTDCLsf0Ye3HL2YJk?=
 =?iso-8859-1?Q?09a8UbqAkYglhvtT7AeDDRzs1oUMDc+PbxdW/cr7kA76AVytz5wCMH3zKo?=
 =?iso-8859-1?Q?7xZm51OCZ82JkSFf2gzBlHi4dz3Hd3dYVjBJ1sKyql3e8W1dRk3tA8NIeW?=
 =?iso-8859-1?Q?sCe5mf7HVQj9x7n5iCX9dZmjz15mTaLKehpMuJG/jNvUR2lwh3joAlSdrM?=
 =?iso-8859-1?Q?G68LNVIAbxUENiVZ1hzwBgk/uaMilgF77Be4Qx713+QiDQN/IBqArw+eQH?=
 =?iso-8859-1?Q?6+Tlu39sTNGyBEmnvQ1qObFzo6chxsScI8i5eCWrCXmuwI8VA84mRjMv56?=
 =?iso-8859-1?Q?lECoY3M3XV+Hp3n0g8Rr9ybgVCmdsJONxwfoBq4k+b+8Fad3XDHEqOmGVp?=
 =?iso-8859-1?Q?KkusUeje2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0774c222-38e1-4187-2ec0-08de75a59a91
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 02:12:05.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06lyPXnWlN1ljjbPHrj6vgb2MYdHoNUXFMjBzaxh+QeN94yaI0oq/9s4RwqSBeFefA9VCy694hJqgcqbCAQ2ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com

hi, Thomas,

On Thu, Feb 26, 2026 at 01:46:46PM +0100, Thomas Weißschuh wrote:
> Hi,
> 
> On 2026-02-26 20:42:55+0800, kernel test robot wrote:
> > again, since we are not sure the purpose of this patch, we make out this report
> > again. if low value or you don't need this check, please let us know. thanks
> 
> Thanks for the report and sorry for not responding last time.
> Indeed, this is only a debugging commit. The warning can be ignored.

got it. thanks a lot for information. we will ignore the test results for this
commit.

> 
> 
> Thanks again for the report and LKP in general,
> Thomas
