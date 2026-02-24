Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F926C3BE
	for <oe-lkp@lists.linux.dev>; Tue, 24 Feb 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919355; cv=fail; b=j2TQRARYBEAhBLokMv1RS4+ISIIX+qmzTh717JmPzFy1f0d7cRkoEBHvOBGWBUtx3zQ6vDkXR5gpetSeSWjRvJxqLF26QBQAjTIc7DftlsVsr/abndBB++o4goYBYkzC8jEPrzgiyjZkC2zs8iJPd7tZvHvKJckhAXbbwhHjJAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919355; c=relaxed/simple;
	bh=gql38lRgMKtC6vFktc6RMI6V45uhs8E9bBWfFoFs0Rs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Yx2fQa7Ept/RfoEs7UR3l7eUp/C26DfZuW1rvz2gj98SE+rNcqeNWHEfK5GV3Jx2QYXup5i7lif4gPG/ijrQpRhfy/YBFsGLLE7bg6wzLsI+BzYY85f1HrTectJj/ALZz3XzKjNuD9NMjQnrWto+WbdHiyqqZ4zRM1tTNBN8Adk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL4qH/A9; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL4qH/A9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771919352; x=1803455352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gql38lRgMKtC6vFktc6RMI6V45uhs8E9bBWfFoFs0Rs=;
  b=GL4qH/A9WAQ3UUifX9FUlzaZSALAIlFabUpjcmnEyMcKEPkO+V94RHMy
   mc21ec2QMI1slmpx6HlY6BILrYr8SXk764EOotm4ovQYa1lJZoXj3pZuD
   8BJ076KneYN5S2H8XbRt5OuUl4o2BTC0yV5vuRsjcsGai3mwmeeDsOZGq
   9KQYQkglppv6hG44w8EWVzFN6NyL6+PToU1pL3gdD9I7jcZfDsY7fcA9w
   07xg5SGB0DMIH91BjwCFR8h3YKCqgDNvuHTU4+lE1Tk4bK481D5ajiISu
   /D0j78xvHLbwZbln4lNhvPRt4EA58mdwgU7b5ju27qdxK1Qse6AnMrfVy
   Q==;
X-CSE-ConnectionGUID: jprtVNATRaSpfSPUhfFORQ==
X-CSE-MsgGUID: ytBFonsVRdapbwwkVsGh9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75535741"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="75535741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:49:11 -0800
X-CSE-ConnectionGUID: mhB3wk2MSYe8g41x5VopsA==
X-CSE-MsgGUID: dGOlVe3vQzSkvx07lmtJiQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:49:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 23:49:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 23:49:10 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 23:49:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S13nWDLj3bwKt0lhn9LyqNvPuZJeeWqhHUcLobIJq79Qv+8QKO9iALM91zTbblRK9XU29UPIdnGaTnmPmXfn921tdLqFQSs0nNs5CY93cEj3ZTUi8WGuyqiIaw21z05Xj+ZwcAuq3X6v5pxcUPtiI/c07Y1xpLbApU9hXPfQ3Eaa0eaFa62M07feH++5czSNpIcTEY2R4uj2Us0CZUniYNivOAFkCRIjEfPTxh4s3Z7Xj7u2hoChy0emOWhDAtPT+GaPs12dccpdAQb+Ej8ZCJgZin6vXn50CmVs4tG9wNB7ro07KyKxJ0qAW4VM+rhRDg5GWPIDpegjwVS4O4TKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqs9+0CbqAMNy3ElfvLtdBU/hzAYz7SmTbb2LKF32f8=;
 b=vZff0abBcwP+nTLk8c2br4UrLdHV/3UPoeJ2OPSnXROZm2w8wTyMZu7LcjlfytxkefFfjSonTln8JaWEUOz9mtgxMTtPqd9BWBiitsaEUXELCD+dklc0LiU+HN57keyoxNhPcDLgmg24UVYz+NCADAg6umX9bhtDcVuFAbJfMJA17FXorZGRw95yD9YrfkC7mePG4ynLzoFK54OQGKwFacexGdOjuI19CFeyneNrFU22ynGXeU8RfNeg6oUCoQQg1+PgYB6ZcYWSebuVicLxaOINJf8ZKS6yuhDRI5j4CEsSbv/TkKr4xg8VavtAkKeyoq8SwHvt96FhcDdjg0f11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 07:49:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:49:02 +0000
Date: Tue, 24 Feb 2026 15:48:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/flat] [sched/eevdf]  2bd899617c:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202602240818.6fd9e413-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU1PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:802:19::34) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dab43cb-6b4f-4a9d-7ed4-08de73792d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTDqQ9x7x0VT3ojLuqWXLTDPaPB2Nb4ftWQtlG4Bn/Y/OtSmh9Dshzm7Nygs?=
 =?us-ascii?Q?v0tsy1ElCJJ6uoxbQLTtG3TKYLx3tWbmdl0Wgz4LHaUB45jW4G2VJyHmVlW9?=
 =?us-ascii?Q?+gSDo+enTQzSbVvw5yChCYBfMneHWgS6aCQ2RPM8IcMXChhaC2MTrp0rj5tk?=
 =?us-ascii?Q?jo2z/f/Qb6Kmwhr+SQzfXsLOrCmSUGqSKcLK7x7/2t8ImYqOIAmoXUSVRbuZ?=
 =?us-ascii?Q?o1O/icBspLCG5Ze/h881b3V8UMXuqxJspyy7quEr/qxTbQ7ASq9btTLNwbPA?=
 =?us-ascii?Q?vB5A0gvqQT9WPmY0u6Gqfco4zn72UTwG8T1UMKR5iOA0EWeRTeDRp5aeoUjZ?=
 =?us-ascii?Q?Dp4m4DI5RF3dYWhaOFTSXl5Zfdv8sDrchaHcDj5DzTYMxQhKfVnis/2qmtyO?=
 =?us-ascii?Q?TXoZt7jAT7zkna6jcp6ozXWwB2b4PUYhAMdEbhrCWRqJ5ql1+f/dNKNF0b+M?=
 =?us-ascii?Q?vylwRUzhyeE3BQZaYlQ7QuvDm0NHA2692Rg9gdLmcMJv0cyQgV6em7dvysTx?=
 =?us-ascii?Q?XZrRvXit9ufivjH8g3bkzTa5WTzvaFeAqQVVxhUFoFWrkPDEvUfl7jJs49ZU?=
 =?us-ascii?Q?si2Z56ES7+cLkRrBI+6Q4Qq7GdB9OM94kelzNvjXIExLztLLuGZLjqe2TTRE?=
 =?us-ascii?Q?FkaRHoW2OMx4MDR2q9kj79PdnmF6JpY7LgJ/oI6MQ7URfKgq26hMGWol2r1s?=
 =?us-ascii?Q?jabhbCpTs3vayy2zKZ1SFlcw0sF7pJyBdrRCSDZv0zXOlIHlcZcc5m9OlUF5?=
 =?us-ascii?Q?kLJLUas6JCCgbUX7Dla8mTCgS6xlZBVfHvlyAAcYjsjaOvMzCotmd8iI+OFi?=
 =?us-ascii?Q?FSeWq46DmFTq0GYCTOkq5BvpZYc19UJD5LAEbG5DFClOwmD4qp5MxFQro09c?=
 =?us-ascii?Q?n1f45LXuseq5wuC9FqTB4wS7yHOvYKA9nex0uK7Ll+HRoiTeg1uEZ6V6UF2r?=
 =?us-ascii?Q?5h0HMVooxRQr0PtZUpNdQAkuFABFby4Z5LuyqgAx6EPPQJ2GimFk2GsulRnC?=
 =?us-ascii?Q?p0sgh4p9TtGejO+7MR3zgbs3Lw8YbDyfsfapqWRpUMB5JALHR/ekcrfBd3Mt?=
 =?us-ascii?Q?at3+lk8fiEBLylsv28ExS72TPPxLQ35reCnxdoLRifew8TNYRD+2OqvX3OMj?=
 =?us-ascii?Q?AVwulLowxqQ2u5b7iTjPPw4uXC2RSn83M/6hJoHiA6p0z0CI4CB8I+YWvt0f?=
 =?us-ascii?Q?/ngX/6lHv1PJ922iEnefwxGzi1cg5+Pp/+p2j7q9NmDHchSNvMypJQAiIfFg?=
 =?us-ascii?Q?WvO0WTYeG9PTosgeJlq7juqYruhH1J4KQpD6FXE4lg0+SdJQCOHXg8Cno6b7?=
 =?us-ascii?Q?kvBRxGX275TwJJySwr5zhuOoCIBE+MrU5W/HdXAn20aX435JlamMOsPKuV+O?=
 =?us-ascii?Q?Cofk0QVgFkzNrDZ93C1DaCx2umEH9Am8VWz32I1KIVVtxZXrIC24klHMEYP9?=
 =?us-ascii?Q?re7UTuAPJaJ3QT7+bGJ13WVBPo2wMm+L/N8mHhh7wlA5PPdtD9zlwpwGsbJ5?=
 =?us-ascii?Q?/RA9mT6QNNuO9RhVjWP3pGJ8Tf0bgR/jVnbX6c3IEDmjSzCTfcDGpA59IYMa?=
 =?us-ascii?Q?n5a0wbkNOx0M4uUQYdHxYCpkOcepbzDSCj24eGuB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ra4oNhw6OOMqZsCGV5npNHmfKWtFdrF6P0AHCVNyteO1tmRfbZ4LL9OCuDE?=
 =?us-ascii?Q?A/JQwfWZ4Z8GaxbATAh4pp+rvpwutGiyg/31WDIS9bLpYAhlCbvs4C0rT4Q9?=
 =?us-ascii?Q?05PW/qSLqXGVIsbAyTDhzbAbLsQySxSKM7wzdsFALHjJA+NUb7y/Ou/ssE+e?=
 =?us-ascii?Q?frO0YsFKNcldD4ePQjvEhWToFTxLeEbcE3j9GszQ/5T3aveenPg9ntnF+C0L?=
 =?us-ascii?Q?vujAiMUgiSb0qFPB48xm1JQsk3PI9hPVRSyG2XM8DHbpgIfxTtI6sfI2FKkL?=
 =?us-ascii?Q?/SPZTPzmIYoie4YzsENTACeAp/ZKSv2aEo8NQRj3SsiV9zkf40/pM40a/xum?=
 =?us-ascii?Q?bcDVQox6srV9aLnS69QpXU1MhZgvmmLqbhfiDaB2ngbd1jeqDIRoW19pzbbm?=
 =?us-ascii?Q?N/K+Y0yrdEr1VRN59wrc7kvYWfMP2NZ6bMolhFVhNvamypqAoRzUJg4QJmIp?=
 =?us-ascii?Q?XjRBujr5lmwcYWLCDcI9l/bAw0Yo6vqlOpDU/HLpQ8zlym+L1w0kSfF5HOYR?=
 =?us-ascii?Q?mXiZQ0V3K/Ip+S1SnxYf/MqvnGhanr2iKCXFeb8gLGKTbTcIYM6Vj5dnNDBv?=
 =?us-ascii?Q?g0OkKM3V0qUIS/JNr3QmnwsUcB65Y3UmHmJ3rlfBy2bFzCSC4RpgLnT3UHbp?=
 =?us-ascii?Q?ynHlbKePuctSJ04lNey/RKFh7FqPoxm3+2mVs2lYJTNukWTItlb50NkpYKTC?=
 =?us-ascii?Q?955XRPnK6GAaxU5DiwK4sFuWEYoLHqM6MSgSr+7QAzIKqDfZ/QvtAfUgkqzn?=
 =?us-ascii?Q?pBTPqsxrzFGpMY/NiCpyoB7BPwuxYIlf3zsn8sJMgUCvX9bK0WQ96G46ySQN?=
 =?us-ascii?Q?G2TE2GuYlaF0kF78f/DBs7NfnxiqBdUfbD2ztAE0LBEzDaNu3ApzP8OSKYt5?=
 =?us-ascii?Q?Cy0IBSf50Kw41z/WJ7AeSDHi8N00qgr18/SQvyCsV7vQoXwh4ghmEb0mar0o?=
 =?us-ascii?Q?6Yts7GdGKpzS2mXd3xV1Ppz1+UXjYw9f5fJ7O0jw8Nwqh2eBFfk4BW415zl7?=
 =?us-ascii?Q?CHbDVpfmVKYwTA3yYHe8ZixxATZ0k74JjlnVRiHBuXWMMzYTEx37StJOatah?=
 =?us-ascii?Q?YgficKe6uHR1e4fcWtKo22XwrsGKsYJulWiwv26qX99omhUppQfZxKKjCXNR?=
 =?us-ascii?Q?vTDjtfyLozTgWALGUjgWa9cu6NCzhmPWFCjSWfSxHrIfifZIj1DESE4QMLRM?=
 =?us-ascii?Q?bW9fPviUQLMllibM7C950VUTj8488m3BvTfeV9rg8j2CoI+sUq3bErWnRxAL?=
 =?us-ascii?Q?TWnI/0WecQ0ZI1rel921ZLh/pmo+RmMLVfMJ/CKqKYYQw5DtlGPD6fBoXuzT?=
 =?us-ascii?Q?ewakYeObIDpEw8J0JR20Luo1z/BAKjYmmHLxchuV/jTE6i6PBHBpKKe+dsqD?=
 =?us-ascii?Q?3f8Jaol4fVsqmKzpSLYcOXUwFsKlz2oEv4wNpIkNkpUMM9vZfBiQ64K5zN85?=
 =?us-ascii?Q?M6ZCu+L6QMbBOYhEU7HKuVDYvsFoumTSse1qHlqyNfSUT4xjRuU7lGJgbv3Q?=
 =?us-ascii?Q?0mq7n4hpr7obyOWREZgOHPsFWoZGhVZfnwN0AACUxjU9v29WmGWD7dh82TYV?=
 =?us-ascii?Q?aVDSDQ8k917wBWWcpCjPB8c6SqWRvDKyEOw6acuVYwoJ2jPZBA/mFQa9AwrN?=
 =?us-ascii?Q?78vIq9vS2nDXNOUw9g5ftReDQ5oatLKMdxFmaD4GLyCLybRmOCTW2YIL/xMs?=
 =?us-ascii?Q?ufQjfuoMj4iRbSRsUk75Dc+YDnmXuUHz0fRaXcewYP9CvmBeQ3Fy/dY0EYX0?=
 =?us-ascii?Q?2o538p5OPA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab43cb-6b4f-4a9d-7ed4-08de73792d59
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:49:02.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nzxpF/WC11zTAiCwsYxPKPzhPBchzbJ4SYgVX+uhFXI4hh0Tr2n53k+cCxgdzYvtCBSzpzjymXUOy4qosL6KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: 2bd899617ca34f2df57f351bf912d5630958d855 ("sched/eevdf: Move to a single runqueue")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/flat

in testcase: boot

config: x86_64-randconfig-2005-20250721
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we run both 2bd899617c and its parent around 500 times, found the issues
happen randomly, but parent keeps clean.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb/boot/quantal-i386-core-20190426.cgz/x86_64-randconfig-2005-20250721/gcc-14/1

d80ef4715d611ac0 2bd899617ca34f2df57f351bf91
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :500         13%          64:522   last_state.booting
           :500         13%          66:522   last_state.is_incomplete_run
           :500          0%           2:522   last_state.running
           :500         13%          67:522   dmesg.BUG:workqueue_lockup-pool
           :500          0%           1:522   dmesg.RIP:ftrace_likely_update
           :500         17%          86:522   dmesg.RIP:pick_task_fair
           :500         17%          86:522   dmesg.WARNING:possible_circular_locking_dependency_detected
           :500          1%           3:522   dmesg.WARNING:possible_circular_locking_dependency_detected_modprobe_is_trying_to_acquire_lock:at:console_lock_spinning_enable_but_task_is_already_holding_lock:at:raw_spin_rq_lock_nested
           :500          0%           1:522   dmesg.WARNING:possible_circular_locking_dependency_detected_rb_consumer_is_trying_to_acquire_lock:at:console_lock_spinning_enable_but_task_is_already_holding_lock:at:raw_spin_rq_lock_nested
           :500          5%          27:522   dmesg.WARNING:possible_circular_locking_dependency_detected_rcu_preempt_is_trying_to_acquire_lock:at:console_lock_spinning_enable_but_task_is_already_holding_lock:at:raw_spin_rq_lock_nested
           :500         11%          55:522   dmesg.WARNING:possible_circular_locking_dependency_detected_udevd_is_trying_to_acquire_lock:at:console_lock_spinning_enable_but_task_is_already_holding_lock:at:raw_spin_rq_lock_nested
           :500         17%          86:522   dmesg.boot_failures


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602240818.6fd9e413-lkp@intel.com



[   22.650678][  T239] ------------[ cut here ]------------
[   22.650872][  T239]
[   22.650880][  T239] ======================================================
[   22.650888][  T239] WARNING: possible circular locking dependency detected
[   22.650899][  T239] 6.19.0-09429-g2bd899617ca3 #1 Tainted: G                T
[   22.650912][  T239] ------------------------------------------------------
[   22.650918][  T239] udevd/239 is trying to acquire lock:
[   22.650927][  T239] ffffffff84fe5fc0 (console_owner){..-.}-{0:0}, at: console_lock_spinning_enable (kernel/printk/printk.c:1902 (discriminator 1))
[   22.650984][  T239]
[   22.650984][  T239] but task is already holding lock:
[   22.650990][  T239] ffffffff84fb67e0 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested (kernel/sched/core.c:649)
[   22.651041][  T239]
[   22.651041][  T239] which lock already depends on the new lock.
[   22.651041][  T239]
[   22.651047][  T239]
[   22.651047][  T239] the existing dependency chain (in reverse order) is:
[   22.651054][  T239]
[   22.651054][  T239] -> #4 (&rq->__lock){-.-.}-{2:2}:
[   22.651081][  T239]        validate_chain (kernel/locking/lockdep.c:3285 kernel/locking/lockdep.c:3908)
[   22.651101][  T239]        __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   22.651121][  T239]        lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[   22.651139][  T239]        _raw_spin_lock_nested (kernel/locking/spinlock.c:379)
[   22.651168][  T239]        raw_spin_rq_lock_nested (kernel/sched/core.c:649)
[   22.651192][  T239]        raw_spin_rq_lock (kernel/sched/sched.h:1622)
[   22.651216][  T239]        ___task_rq_lock (kernel/sched/sched.h:2403 (discriminator 2) kernel/sched/core.c:726 (discriminator 2))
[   22.651240][  T239]        wake_up_new_task (kernel/sched/core.c:4826)
[   22.651258][  T239]        kernel_clone (kernel/fork.c:2688 (discriminator 1))
[   22.651275][  T239]        user_mode_thread (kernel/fork.c:2722)
[   22.651292][  T239]        rest_init (init/main.c:725)
[   22.651308][  T239]        start_kernel (init/main.c:1210)
[   22.651330][  T239]        x86_64_start_reservations (arch/x86/kernel/head64.c:310)
[   22.651353][  T239]        x86_64_start_kernel (??:?)
[   22.651374][  T239]        common_startup_64 (arch/x86/kernel/head_64.S:419)
[   22.651401][  T239]
[   22.651401][  T239] -> #3 (&p->pi_lock){-.-.}-{2:2}:
[   22.651429][  T239]        validate_chain (kernel/locking/lockdep.c:3285 kernel/locking/lockdep.c:3908)
[   22.651448][  T239]        __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   22.651467][  T239]        lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[   22.651486][  T239]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:133 kernel/locking/spinlock.c:162)
[   22.651513][  T239]        try_to_wake_up (include/linux/spinlock.h:570 kernel/sched/core.c:4176)
[   22.651530][  T239]        default_wake_function (kernel/sched/core.c:7285)
[   22.651548][  T239]        woken_wake_function (kernel/sched/wait.c:464)
[   22.651573][  T239]        __wake_up_common (kernel/sched/wait.c:109)
[   22.651595][  T239]        __wake_up_common_lock (include/linux/spinlock.h:407 kernel/sched/wait.c:127)
[   22.651633][  T239]        __wake_up (kernel/sched/wait.c:147)
[   22.651653][  T239]        tty_wakeup (drivers/tty/tty_io.c:520)
[   22.651674][  T239]        n_tty_check_unthrottle (drivers/tty/n_tty.c:262)
[   22.651699][  T239]        n_tty_read (drivers/tty/n_tty.c:2279)
[   22.651723][  T239]        iterate_tty_read (drivers/tty/tty_io.c:848)
[   22.651743][  T239]        tty_read (drivers/tty/tty_io.c:922)
[   22.651762][  T239]        vfs_read (fs/read_write.c:494 (discriminator 1) fs/read_write.c:574 (discriminator 1))
[   22.651789][  T239]        ksys_read (fs/read_write.c:718)
[   22.651813][  T239]        __ia32_sys_read (fs/read_write.c:724)
[   22.651837][  T239]        ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-2005-20250721/./arch/x86/include/generated/asm/syscalls_32.h:4)
[   22.651854][  T239]        do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172)
[   22.651876][  T239]        asm_int80_emulation (arch/x86/include/asm/idtentry.h:569)
[   22.651894][  T239]
[   22.651894][  T239] -> #2 (&tty->write_wait){-...}-{3:3}:
[   22.651923][  T239]        validate_chain (kernel/locking/lockdep.c:3285 kernel/locking/lockdep.c:3908)
[   22.651942][  T239]        __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   22.651961][  T239]        lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[   22.651979][  T239]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:133 kernel/locking/spinlock.c:162)
[   22.652007][  T239]        __wake_up_common_lock (kernel/sched/wait.c:125)
[   22.652028][  T239]        __wake_up (kernel/sched/wait.c:147)
[   22.652048][  T239]        tty_wakeup (drivers/tty/tty_io.c:520)
[   22.652067][  T239]        tty_port_default_wakeup (include/linux/tty_port.h:276 drivers/tty/tty_port.c:66)
[   22.652087][  T239]        tty_port_tty_wakeup (drivers/tty/tty_port.c:405)
[   22.652104][  T239]        uart_write_wakeup (drivers/tty/serial/serial_core.c:122)
[   22.652129][  T239]        serial8250_tx_chars (drivers/tty/serial/8250/8250_port.c:1726)
[   22.652156][  T239]        serial8250_handle_irq (drivers/tty/serial/8250/8250_port.c:1827)
[   22.652183][  T239]        serial8250_default_handle_irq (drivers/tty/serial/8250/8250.h:182 (discriminator 1) drivers/tty/serial/8250/8250_port.c:1843 (discriminator 1))
[   22.652210][  T239]        serial8250_interrupt (drivers/tty/serial/8250/8250_core.c:86 (discriminator 1))
[   22.652231][  T239]        __handle_irq_event_percpu (kernel/irq/handle.c:209)
[   22.652258][  T239]        handle_irq_event_percpu (kernel/irq/handle.c:248)
[   22.652284][  T239]        handle_irq_event (kernel/irq/handle.c:265)
[   22.652310][  T239]        handle_edge_irq (kernel/irq/chip.c:857)
[   22.652330][  T239]        __common_interrupt (include/linux/irqdesc.h:187 arch/x86/kernel/irq.c:262 arch/x86/kernel/irq.c:318 arch/x86/kernel/irq.c:333)
[   22.652353][  T239]        common_interrupt (arch/x86/kernel/irq.c:326 (discriminator 35))
[   22.652375][  T239]        asm_common_interrupt (arch/x86/include/asm/idtentry.h:569)
[   22.652392][  T239]        _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:179 (discriminator 1) kernel/locking/spinlock.c:194 (discriminator 1))
[   22.652409][  T239]        uart_port_unlock_irqrestore (include/linux/serial_core.h:789)
[   22.652436][  T239]        uart_port_unlock_deref (drivers/tty/serial/serial_core.c:92)
[   22.652462][  T239]        uart_write (drivers/tty/serial/serial_core.c:635)
[   22.652479][  T239]        process_output_block (drivers/tty/n_tty.c:557)
[   22.652502][  T239]        n_tty_write (drivers/tty/n_tty.c:2367)
[   22.652526][  T239]        iterate_tty_write (drivers/tty/tty_io.c:1007)
[   22.652548][  T239]        file_tty_write+0x240/0x280
[   22.652570][  T239]        tty_write (drivers/tty/tty_io.c:1103)
[   22.652591][  T239]        vfs_write (fs/read_write.c:596 (discriminator 1) fs/read_write.c:688 (discriminator 1))
[   22.652615][  T239]        ksys_write (fs/read_write.c:741)
[   22.652639][  T239]        __ia32_sys_write (fs/read_write.c:748)
[   22.652664][  T239]        ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-2005-20250721/./arch/x86/include/generated/asm/syscalls_32.h:5)
[   22.652680][  T239]        do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172)
[   22.652701][  T239]        asm_int80_emulation (arch/x86/include/asm/idtentry.h:569)
[   22.652718][  T239]
[   22.652718][  T239] -> #1 (&port_lock_key){-.-.}-{3:3}:
[   22.652746][  T239]        validate_chain (kernel/locking/lockdep.c:3285 kernel/locking/lockdep.c:3908)
[   22.652765][  T239]        __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   22.652784][  T239]        lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[   22.652802][  T239]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:133 kernel/locking/spinlock.c:162)
[   22.652830][  T239]        uart_port_lock_irqsave (include/linux/serial_core.h:717 (discriminator 2))
[   22.652853][  T239]        serial8250_console_write (drivers/tty/serial/8250/8250_port.c:3294)
[   22.652870][  T239]        univ8250_console_write (drivers/tty/serial/8250/8250_core.c:399)
[   22.652891][  T239]        console_emit_next_record (kernel/printk/printk.c:3100 (discriminator 1) kernel/printk/printk.c:3184 (discriminator 1))
[   22.652911][  T239]        console_flush_all (kernel/printk/printk.c:3270 kernel/printk/printk.c:3343)
[   22.652929][  T239]        console_unlock (kernel/printk/printk.c:3374 kernel/printk/printk.c:3413)
[   22.652947][  T239]        vprintk_emit (kernel/printk/printk.c:2480)
[   22.652965][  T239]        vprintk_default (kernel/printk/printk.c:2495)
[   22.652984][  T239]        vprintk (kernel/printk/printk_safe.c:83)
[   22.653003][  T239]        _printk (kernel/printk/printk.c:2499)
[   22.653025][  T239]        register_console (kernel/printk/printk.c:4225)
[   22.653044][  T239]        univ8250_console_init (drivers/tty/serial/8250/8250_core.c:516)
[   22.653070][  T239]        console_init (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/initcall.h:48 kernel/printk/printk.c:4424)
[   22.653094][  T239]        start_kernel (init/main.c:1148)
[   22.653110][  T239]        x86_64_start_reservations (arch/x86/kernel/head64.c:310)
[   22.653131][  T239]        x86_64_start_kernel (??:?)
[   22.653152][  T239]        common_startup_64 (arch/x86/kernel/head_64.S:419)
[   22.653177][  T239]
[   22.653177][  T239] -> #0 (console_owner){..-.}-{0:0}:
[   22.653205][  T239]        check_noncircular (kernel/locking/lockdep.c:2179)
[   22.653224][  T239]        check_prev_add (kernel/locking/lockdep.c:3166 (discriminator 2))
[   22.653242][  T239]        validate_chain (kernel/locking/lockdep.c:3285 kernel/locking/lockdep.c:3908)
[   22.653260][  T239]        __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[   22.653279][  T239]        lock_acquire (kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
[   22.653297][  T239]        console_lock_spinning_enable (kernel/printk/printk.c:1903)
[   22.653316][  T239]        console_emit_next_record (kernel/printk/printk.c:3180)
[   22.653336][  T239]        console_flush_all (kernel/printk/printk.c:3270 kernel/printk/printk.c:3343)
[   22.653354][  T239]        console_unlock (kernel/printk/printk.c:3374 kernel/printk/printk.c:3413)
[   22.653372][  T239]        vprintk_emit (kernel/printk/printk.c:2480)
[   22.653390][  T239]        vprintk_default (kernel/printk/printk.c:2495)
[   22.653409][  T239]        vprintk (kernel/printk/printk_safe.c:83)
[   22.653427][  T239]        _printk (kernel/printk/printk.c:2499)
[   22.653450][  T239]        __report_bug (lib/bug.c:244)
[   22.653472][  T239]        report_bug (include/linux/context_tracking.h:159 lib/bug.c:282)
[   22.653493][  T239]        handle_bug (arch/x86/kernel/traps.c:435)
[   22.653513][  T239]        exc_invalid_op (arch/x86/kernel/traps.c:489 (discriminator 1))
[   22.653534][  T239]        asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:569)
[   22.653551][  T239]        pick_task_fair (kernel/sched/fair.c:9022 (discriminator 1))
[   22.653577][  T239]        __pick_next_task+0x95/0x200
[   22.653600][  T239]        __schedule (kernel/sched/core.c:6887)
[   22.653621][  T239]        schedule (kernel/sched/core.c:7028 kernel/sched/core.c:7042)
[   22.653641][  T239]        schedule_hrtimeout_range_clock (kernel/time/sleep_timeout.c:208)
[   22.653668][  T239]        schedule_hrtimeout_range (kernel/time/sleep_timeout.c:265)
[   22.653695][  T239]        ep_poll (fs/eventpoll.c:2027 (discriminator 2))
[   22.653714][  T239]        do_epoll_wait (fs/eventpoll.c:2461)
[   22.653732][  T239]        __do_sys_epoll_wait (fs/eventpoll.c:2466)
[   22.653751][  T239]        __ia32_sys_epoll_wait (fs/eventpoll.c:2464)
[   22.653770][  T239]        ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-2005-20250721/./arch/x86/include/generated/asm/syscalls_32.h:257)
[   22.653786][  T239]        do_int80_emulation (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:172)
[   22.653807][  T239]        asm_int80_emulation (arch/x86/include/asm/idtentry.h:569)
[   22.653824][  T239]
[   22.653824][  T239] other info that might help us debug this:
[   22.653824][  T239]
[   22.653830][  T239] Chain exists of:


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260224/202602240818.6fd9e413-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

