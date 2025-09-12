Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8723ABB0
	for <oe-lkp@lists.linux.dev>; Fri, 12 Sep 2025 04:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757652544; cv=fail; b=DeuxKCQKpe0jdLf+h4rFzxgu7kffgW/QQz9kr857o3x+a9ypBSwId02Vgc7r7SHbzafEwfSOTu6lpr3YAUKvG1wnAReOSrYwYLeSPeF6rn93c4NxHTr635/feP1MIW6Y9SIskF8kBzMhkmYs5YsVXQGcJbm+YcCmN/oBYzbkgTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757652544; c=relaxed/simple;
	bh=qt/sA1qVTrslsQi13e5P4W0PS08rld62sNCI6wTAoZU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dlvKI2XJrkIl64IIrbtQACC3L5weaLbqLGUFxyOMkQfwRdbaoz43yoAo/OBWjL/jvn/p0D3KVEYvnsczodLfMUl//fd+/r87fgK9Ws1mCbM+Rw5wvLhWMxHmFNr6JMKJHvEQMo5pT6b3SsCo8C7o9LnxspuiAR+z4TXWNkZYRZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzJUIZ2H; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzJUIZ2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757652542; x=1789188542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qt/sA1qVTrslsQi13e5P4W0PS08rld62sNCI6wTAoZU=;
  b=LzJUIZ2HdbgFtFUuIy2HBPNggKNhIfC68S0rB+t6EZlxXhHIZR8X/xYZ
   qeD3jGo6nybONJS/nHQebAp2gn+Lz1bGZnjSxJIT0n+dokCtK9/52f2VT
   h7JqPW+/MiCy9xcKpGkalRLmE9fnQc6JK6hprgBr5hQfiVfq93ErVZEYT
   QULynUljl20fRsW9JzIfsZsIHfCV2cAYLMjvvpp9SYqmNj+u2mz229/Mq
   Wp+odIV14ZpuQl1xRBPax7Hi9wAG74yUB4xKn64kOIvP2umU6vaPWhsch
   KbepqR2rXmlypHDi/HGHLLa+aRTEgCA7B/D4Js+kASVk6NAjAX4bFzlh9
   Q==;
X-CSE-ConnectionGUID: KwMYRiTgRp6/GEqcJRWxKQ==
X-CSE-MsgGUID: HrwLjHp5RPi541Exk3caqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="47563942"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="47563942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 21:49:01 -0700
X-CSE-ConnectionGUID: Y8L1l8+UTuKpBe2lObZE2Q==
X-CSE-MsgGUID: YPBoDOU4RQSEft41sMtV8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174655884"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 21:49:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 21:49:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 21:49:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 21:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJMXY+vAQQkX76XHtQjiH8csmR2zNhFYZpcVGbVA0hYZ9R+PtdGngTPjwQwopXzkSbWi0UShIiCmKoobCswCJ8WFrROuSMYh7PEkQHH39C8J0sbjozuTb1Nx7Ofdn5GZi0kepqwMjqDxD+LG127xxiOzSLRG3uShS+8sWjQtloCs0R0vuyWeSpPRU+jDvk5CxeieTWdQpJt3B7YIvwdoRvrQuIDEi4nRW9DkSeuOEob0FJK6lqwli6jc6/owURorys/BtmcLxTx/JB/uYk7vQLyFWiSTGMPabhkISgOfm3jVXND7LLlpFwdGRzGt7P5bP9uG3xb+Uyd1cUVbDja+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnjaIPEk0bOBzcpwb2zaXgXC/3QTkbaFP1lJj/7Jufo=;
 b=Y3PwjbONAlLs7Pw69y6aBXKmB2AO1pLuvthpCJNJ+GoHpP/fHItLdRdlcedNb2melMpbbagAOAEmlZVGzecYhE3Ck9Y4NQeKhlWn3A80REPo1Hfpgrap+gKduO7MIhoa47hxuzkj0w98cOA5PcOtixPoyDwH7qg9Uh+ASC3KvfBGNWMJ6fUC8AF20Z0ylFNTUMqkTAdGc48iKqtYso/+jGfW8fmJit83b+k38izW54dFlrNOqd7W8Qla9aYnfj0sWoJ0gHuDgohaKV5kX/d9SLfh6Lfgavrwh7R2Bvp5gCq707xOaZ4a6YTnX1aK7iEDnViwiDP8e57CjNyWDxHfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:48:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 04:48:58 +0000
Date: Fri, 12 Sep 2025 12:48:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2] [vdso/datastore]
 6436f5c960: Bad_pagetable
Message-ID: <202509121258.599356dc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV2PR11MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f2242a-8515-462e-7ee5-08ddf1b7af77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ObnuYGF3ynzQwukr4QiTwze6rJaSYIAe5RICNmR4tdWEl7yGnldYQZeZ1kPZ?=
 =?us-ascii?Q?4dMM0SJ8xmIDqb/hGe64Mzhp5u6eFkNTufKj+eqQfyEzV5B1Sy4aFdFsEN1v?=
 =?us-ascii?Q?uUxsZHz+trda6ZgGx4fKtn24I9X4NTPJbkgpGoFLHjXY2Uy/nZ4neEhbR72t?=
 =?us-ascii?Q?4ovdIv60VZhCVwtSWVvfrmLlpmaI3hKdpwKWL3sr9ts8A1IC9kiBF2SZ/ll3?=
 =?us-ascii?Q?tyiBNC8tGWnlKZzAsbvwwhwRG/0QcTe93v5OippEIND0ZysgeeqcGtCEh4mb?=
 =?us-ascii?Q?zZ1bzXH2M4DB54nr1/Q85aUSGyv0/MaeA8mKkAJxsW/q1mDPVsy0yTt4h7LB?=
 =?us-ascii?Q?+hOSg9OX7kJckmgFIQEBmV8eQJDOQ+y4AHHtFRR74ZhSff4YLqmBJwCYZyyJ?=
 =?us-ascii?Q?PHDTeHldZii1f4CzNQ4DrCGYYwMwUNwQ5jgm9KZztfa9ob2GjNZunpxdPzbG?=
 =?us-ascii?Q?8ugDBgvRaFO7d0cADZU5KsWD0o2CEQAFinMnNbu6K/Jwp3qbBzVdkWy8i+8h?=
 =?us-ascii?Q?/5NrOj08xFub17dSdnxWKAzETiE0P0/JIcKlzFNfGIyKeI4seJBJ+o8TMT4P?=
 =?us-ascii?Q?ONJU3ViKOtZgzSk8O2FNZNzCxn1vI4Ib7A+EKIwiicHoA3KlL2ky/dhXHnMm?=
 =?us-ascii?Q?MLnyb6sxkZAp6k8NKTEmOD1iExpU3+N/4Ey1osIZbXQ2S1nDGAvwLrvw5pdg?=
 =?us-ascii?Q?HR83r2vp4Kcfsirg1WE2RDe+aDU73bHw/vbwRfzDnxQyUqujHW83//fLC7Vm?=
 =?us-ascii?Q?kOt7BGSxWxy3+hdUwpEDPN2atsFd5D01VFN7UDVx+FpGUPd6eGCJO+2SWd0U?=
 =?us-ascii?Q?UsWzq2ERiCyJRPWOlU9KqQ1QrGs8JWLek54RL7zNF3aO2sh/i/L9KTTKEGHl?=
 =?us-ascii?Q?+4gDy9DXbJCJ/XvzRn6wTEGHpLf2Sx72uiANRyFNG6UrfCOmMJdbnP0+7PCi?=
 =?us-ascii?Q?5BV7x51SUBpd3GyykEQQnoJ7kfNJKrMLoVJS2/7qFkZzzXcGXceg7HxxTcjO?=
 =?us-ascii?Q?lc/VVbuh4jznXnuziOsG3LLeidBop6z0q7ASJGuUj2BO6Ts6W/IaA25fDZ69?=
 =?us-ascii?Q?yyJ/H/AYVdPZ39z8LwYkNs3w2nHhHs0k9ZXCeHVq5y6eFCQWqDBSzRLPHy/g?=
 =?us-ascii?Q?gTX0t/M6dUao0z/aT2q5elCut22A7EKHQ+vhRqC+i2S5SZV2n0U5D49Y5nrx?=
 =?us-ascii?Q?QVyfNSp/QcSKVLnkVQNxrDawVZ2aYkTUvVVDov8QwFkVXFVOXCSpspng+NnM?=
 =?us-ascii?Q?/zT5ABuQrHd9JCA9wLkMNT5whHsht6sgHFVCvqPMaSjLS1GcrnLqDKpN6XxT?=
 =?us-ascii?Q?wFvo32g3pj3f9ZyaOcI3Hruou80+vBZlyTKNb6TQOnZHJ1qZApu8lqGtwI9y?=
 =?us-ascii?Q?8qFuKUHpUwYF+8zE5dIhSyIpD6Ti?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aw/bERbSQwQv9cQMHv5Q9OfXUVdyhruzVpQ/XnbSdSHf32Rn7LA+XGqJuGL2?=
 =?us-ascii?Q?0rJLIuYRYtV9dtcs9Up3J2FYNyo9ZerLt/6zH+SpTf2qVMxhjkAnvVcvteyK?=
 =?us-ascii?Q?8LtbXfSZB6RMskV5JL4uhFpaa6qw3WnMZivf/tmDU2oiiJNKpS6ACV6z0v2I?=
 =?us-ascii?Q?TWA0icP7RYnJmE2VjddJevLM1AMVp1GiwpYEIEzhIx/JDmvBDg4YbKDkNRrd?=
 =?us-ascii?Q?95c9OtegL86Vr4aiE0/TbX4iA1Cd47ld8nBnWYoRJc1zqOFHxKzCaA4ZJG2W?=
 =?us-ascii?Q?pczSZZB2wiCU+aqPPhcq5sK1SHre0EnD/pEoEm/Pcx5tAbns1C+o3QcI5lY1?=
 =?us-ascii?Q?q7fVJLUrpLBCdPqEvACPbEQrlkdA5tZvsvR7gyFvd9+Alg/f9ARhDlEzCTc7?=
 =?us-ascii?Q?YlFuHIahZvKycPVL5zTnOZgBlxm7lxDLO+XFec7kislWCUMcUlvRuF3SaEmk?=
 =?us-ascii?Q?SP67kiq9kJDtCAC6/fKAgvcA3ZpV6KHWfeBKCUT5voWaTuG4pTFqbr8DVFSU?=
 =?us-ascii?Q?VnvCO1nP+oEchblB8/hUTLlAWvvOnQg1PNIAmaF3+QBDJQsGRsMKL8w4AJoN?=
 =?us-ascii?Q?HDYlrob0YLDdRiQ2QLrxPZutGyLX5awc0jd7kO9JWp2ZfW2F8Aq274fndd1E?=
 =?us-ascii?Q?yYZn6zRS0+ZSKlX1LFUv03gu7DGojCWxwNrn+ZPqol3hmcYw/iyA3W7pOVev?=
 =?us-ascii?Q?5f65agFkA8mIq8ZHQxidiNmtSfVhXi1tJ0R4qtzeT1KiNGH09J4jv8V0FmaX?=
 =?us-ascii?Q?RrDehu7CI3iy5eJeGML9X4rwfTo0QUnf0hs3JQhJaFxCbCeRXOm6Q6bn8fML?=
 =?us-ascii?Q?cZWF86gw1KY3Vzp+6AX2YopH6n/bpQovM62ZghLNvPGnjkH1dXrXXlvzedO5?=
 =?us-ascii?Q?np/7IWg3wcEpam0f1ajzjnu1IKnRHS1vw/NyurH1NLQvZL0y6UTbcbOOWtJT?=
 =?us-ascii?Q?kKxBxm7txbho2PwzeYvH29Z0SbwuQqzL61LlHVPzOuoOsqyKmrwYvXM1fXEO?=
 =?us-ascii?Q?cySyxypvZItM7D/o82m7PewDnCU292POeSNEdSOYfUBxRKF+j7qKAcsoTarn?=
 =?us-ascii?Q?nSCwo+gNIj+6m2Hs67uAQy/kEslp5ru/oYOEd6GGl1OzxQki9AbCAyOdZQQr?=
 =?us-ascii?Q?cD/jslH3J/YHw8QA2bQq+UkVlI1nMpTBubLDdbYuRl9o+RUjqxhH75ud5vq6?=
 =?us-ascii?Q?F+aq+v95qitjIKdDRbcTeJqf4y/wZna2sknBz2IyCyjK2TiBY86FHjwUp5dW?=
 =?us-ascii?Q?SShrVKsGHaGvoyhYFTOGaDGH6lxO4wNLID0Zo1OCPLx4seseC7FAOEmBwBp9?=
 =?us-ascii?Q?wn6jp5Zp9qNr4TjyFkR7w/wlVw/w6gFmyAAG1itQiyGUZ/8MLD52vXc3nCf6?=
 =?us-ascii?Q?Il1czM0c20BIfHBxXprKiEa8K4vRr5hY7jNNSlEBJMdjGsETuNSkmVlnslLi?=
 =?us-ascii?Q?QUyAOEMczkql+5+xwtmEAQrpZh/4S8jJWbF6tsjt2jIBrNCi5H5oA/RmMDU2?=
 =?us-ascii?Q?pNQuZr9qqTYYsqFCPitByJ5G5+xYIifmaTikG6Mbr094qQICHPEFDopHiRO0?=
 =?us-ascii?Q?eWt4QgcaWllhBgBXssNcQLfQyWm9uj3IZGcTE/y7BiehTpRxa+Pne2Klnw2E?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f2242a-8515-462e-7ee5-08ddf1b7af77
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:48:58.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Us+3ZIJw0BrJp1xugLTGxwGTAqHxR36Xnlh4TKkBiZfuSDT1H+6ABk0RU6J7BKSNVvR3lkK35eZOLtul4okIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Bad_pagetable" on:

commit: 6436f5c960638cb098424b38f2e9781154112380 ("vdso/datastore: Allocate data pages dynamically")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2

in testcase: boot

config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | 22d81ce14c | 6436f5c960 |
+------------------------------------------+------------+------------+
| boot_successes                           | 12         | 0          |
| boot_failures                            | 0          | 12         |
| Bad_pagetable                            | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509121258.599356dc-lkp@intel.com


INIT: version 2.88 booting
[    5.689575][ T1530] init: Corrupted page table at address 7fdfcc79d000
[    5.690579][ T1530] PGD 8000000124a1d067 P4D 8000000124a1d067 PUD 124dc0067 PMD 124db9067 PTE 800f88818ca10235
[    5.696374][ T1530] Oops: Bad pagetable: 000d [#1] SMP PTI
[    5.697220][ T1530] CPU: 0 UID: 0 PID: 1530 Comm: init Not tainted 6.17.0-rc4-00029-g6436f5c96063 #1 PREEMPT(voluntary)
[    5.698735][ T1530] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.700209][ T1530] RIP: 0033:0x7fdfcc7a3746
[ 5.700911][ T1530] Code: 41 55 41 54 53 48 83 ec 10 48 85 ff 0f 84 29 01 00 00 48 bb ff ff ff ff ff ff ff 7f 49 be ff ff ff ff ff ff ff 3f 4d 8d 7e 01 <44> 8b 25 b3 98 ff ff 41 f6 c4 01 75 5f 8b 05 ab 98 ff ff 83 f8 01
All code
========
   0:	41 55                	push   %r13
   2:	41 54                	push   %r12
   4:	53                   	push   %rbx
   5:	48 83 ec 10          	sub    $0x10,%rsp
   9:	48 85 ff             	test   %rdi,%rdi
   c:	0f 84 29 01 00 00    	je     0x13b
  12:	48 bb ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rbx
  19:	ff ff 7f 
  1c:	49 be ff ff ff ff ff 	movabs $0x3fffffffffffffff,%r14
  23:	ff ff 3f 
  26:	4d 8d 7e 01          	lea    0x1(%r14),%r15
  2a:*	44 8b 25 b3 98 ff ff 	mov    -0x674d(%rip),%r12d        # 0xffffffffffff98e4		<-- trapping instruction
  31:	41 f6 c4 01          	test   $0x1,%r12b
  35:	75 5f                	jne    0x96
  37:	8b 05 ab 98 ff ff    	mov    -0x6755(%rip),%eax        # 0xffffffffffff98e8
  3d:	83 f8 01             	cmp    $0x1,%eax

Code starting with the faulting instruction
===========================================
   0:	44 8b 25 b3 98 ff ff 	mov    -0x674d(%rip),%r12d        # 0xffffffffffff98ba
   7:	41 f6 c4 01          	test   $0x1,%r12b
   b:	75 5f                	jne    0x6c
   d:	8b 05 ab 98 ff ff    	mov    -0x6755(%rip),%eax        # 0xffffffffffff98be
  13:	83 f8 01             	cmp    $0x1,%eax
[    5.703533][ T1530] RSP: 002b:00007ffe81dbc808 EFLAGS: 00010206
[    5.704387][ T1530] RAX: 00007ffe81dbc898 RBX: 7fffffffffffffff RCX: 00007fdfcc67e1b0
[    5.705546][ T1530] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffe81dbc860
[    5.706691][ T1530] RBP: 00007ffe81dbc840 R08: 0000000000000001 R09: 00007ffe81dbcbc0
[    5.708168][ T1530] R10: 0000000000000000 R11: 00007fdfcc758c10 R12: 0000557d503f1339
[    5.709332][ T1530] R13: 0000557d503f668c R14: 3fffffffffffffff R15: 4000000000000000
[    5.710539][ T1530] FS:  00007fdfcc79b580 GS:  0000000000000000
[    5.711508][ T1530] Modules linked in:
[    5.712129][ T1530] ---[ end trace 0000000000000000 ]---
[    5.712925][ T1530] RIP: 0033:0x7fdfcc7a3746
[    5.713600][ T1530] RSP: 002b:00007ffe81dbc808 EFLAGS: 00010206
[    5.714464][ T1530] RAX: 00007ffe81dbc898 RBX: 7fffffffffffffff RCX: 00007fdfcc67e1b0
[    5.715696][ T1530] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffe81dbc860
[    5.716941][ T1530] RBP: 00007ffe81dbc840 R08: 0000000000000001 R09: 00007ffe81dbcbc0
[    5.718145][ T1530] R10: 0000000000000000 R11: 00007fdfcc758c10 R12: 0000557d503f1339
[    5.719403][ T1530] R13: 0000557d503f668c R14: 3fffffffffffffff R15: 4000000000000000
[    5.720582][ T1530] FS:  00007fdfcc79b580(0000) GS:ffff8884ac416000(0000) knlGS:0000000000000000
[    5.721848][ T1530] CS:  0033 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.722759][ T1530] CR2: 00007fdfcc79d000 CR3: 0000000124cce000 CR4: 00000000000406f0
[    5.728314][ T1530] Kernel panic - not syncing: Fatal exception
[    5.729402][ T1530] Kernel Offset: disabled



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250912/202509121258.599356dc-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

