Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D40140E26
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714490414; cv=fail; b=GxhOMDmTq6cxfP4mi/1YC0No9K2Hwze2u845LS88jfxY7OqkFljm9jCWzbFy9XwA7IFZeA88JpqHKGYtL6DsfVXGMVoDpqh6ij0uo7UT6Uf/bQCC/mxfdrWb1eK6Y2yYkDS1NmdFCHLmY33pjw7CuytvgbaaW/FEpi8KHnwsKoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714490414; c=relaxed/simple;
	bh=GrT0+0it7gfyFAJRoAj0+2PjXUa/upv5+x3dXVGxdeI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s0m29lYsbJXb40DvctXEAx4tDYlXzUFPted1pHTOcFuXpxU2fSTg3v3pckILP+XQXC/rWRB12lb2jyiLToesyK3AmQ/YkVnmatv9w67qGyZXbzGQon756Ij5m0r6l34iDrSAy70y77mg7PGfoyBe16gCo1pqktkyLGBsKgeDPYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjWMBS/x; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjWMBS/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714490413; x=1746026413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrT0+0it7gfyFAJRoAj0+2PjXUa/upv5+x3dXVGxdeI=;
  b=XjWMBS/xLZlem5e8RuL9+sVeiaBkz+GCanrLx07l+w2x6JGfrbTsMFZd
   7FDqTScVmXzRU1cJahFixCsVmwK1Qfy66zLSO8kWtn5vZp06pybVsTJir
   Sb9pdmVBInD/y9tIuHXVYTHQT9gqaemKwIrm8btqQCw+8WK5/TZj2IwdO
   CopBjC4o51JqJcupb0M9eAg5kjTxoGU2we8njzgyjDnLUL/NmZjdn3hAq
   SnlNm5L8x80VQg/JRuwZgOyqpvpkQFdNiMLE5P4YAXe42oeNW0AZyXtRZ
   wWOqKo8E+MWfBx2aFxrezF6Czx98Gxjv/syen13vB35Oinca5iJbdOBUe
   w==;
X-CSE-ConnectionGUID: JD5YHkkVTOS+X4pCQ/1p4A==
X-CSE-MsgGUID: YBbWTl74Q7q4I7Xhq3qqdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="13997894"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="13997894"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:20:12 -0700
X-CSE-ConnectionGUID: fVrTAUntQ+eInr79UySXnA==
X-CSE-MsgGUID: GqHQXr5XTc6YnWuYrCE5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="30932134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 08:20:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:20:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:20:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 08:20:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 08:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9ZqAN7W+YU4xfVB0Pg4b3b/ITJIqnQ2x3o227clo48udMnYzpBnoPkgqlteWXZyPjl2ZRTBS3UuywKiELf0978IMJj1Mhy+5LejMEQGTEfmmAZdBsy7nDaMDlt43xVqSCWNIMYiZMarpe6JMHcIfvQPMHgqz8x/Cj/Uz3oAuX8FNsVYu/OoSQWcAvr6AdiKjndApn88ddffOEkbOfz4n5+SWGSzwojecSwzBCxYzMwuZ4pTAncifAtYNOWAeNvnWPHJpHRL9g+qDH5mV8PfBvqa2MrkkVO9olC+1Rfcq3BMHHLxA5s6JfW0V/OQGAhjMfDuZiNawrzcWsz2vA5oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HQmISeOZY+MlSLuW6MJsYDv6/M7Gzkgdkp2mBEwMhA=;
 b=AzflAB1rbRYrp5AZJTeFEUnxwustM6/TvufBZAGFUQEElqbcx5W5BKcM+5S1hrJwi2H6TIGbSzcfrSjCEgldAdW86Pv1d6rMa78nmOIH6K5h36ojaqHFvAgf47Lmx8sIh304KlaB1CdO3i04G/PB82cTtmfMduOBAFRANxuq3mypkdjTM+FybZxOUodkDSDfy0sRlObJbJt2Ge8n2MMI+zv6ZhIPmk4S4HEdVr9uoZE4CSQY50XoRR++fQo0j3EZFh/B7TUk39HrMpyabh2MkByYeP9s8UkQZACNr9iMhqFOhY5y2Y5tUwoTyhk5SVw2hhPhbKo3Iee/GzK0Mx9m8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 15:20:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 15:20:06 +0000
Date: Tue, 30 Apr 2024 23:19:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:rcu/dev] [rcu/nocb]  0e250956fc:
 BUG:using_smp_processor_id()in_preemptible
Message-ID: <202404302322.1b0d3358-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fa35f5-c4ce-4f0f-f802-08dc692903e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBNx8mWL0qJzne13KGN4opgCy7n+ZoOajlBOlvMnwUqtOG6m2UVScQQpdUu2?=
 =?us-ascii?Q?3m0Lqn//Xx8O8Pm+9UUuZj7rPBHB8lmXgP/0Nvwa8BXPRlLj+3SBg22q5Mt2?=
 =?us-ascii?Q?80Wkfwk6CAyq5E74OtlMKiqOVHnJWEDTSthNDlQXbWQ+mMU+pq1xz50og7QG?=
 =?us-ascii?Q?PAd/Dmuxq9nHwZeE0HZ4l76h3h50jYLdJWeq5W999s9LfbsMNsBmRuOV6VWO?=
 =?us-ascii?Q?rwgpJDX85iDJtn+DvLqCbpOGtQTRPFOls1HM5y5gMRwUOVQ1Dgh9g1sqhf9I?=
 =?us-ascii?Q?nx6Ww5t1f+PHBwvDJ9nN2EVcRwR3o/GTPs2tUvE3H+UXdqFUV83lswCnJjsz?=
 =?us-ascii?Q?iOBmIuFJjf46MgXaTL0IVjbnKvDsoVgoiQ0JynAlwnwxlK8LkwLvVStsBV9T?=
 =?us-ascii?Q?9Amnxpo6dWBMCgDTJr0sXKiL5rQzljQRIPaHElU66FniVMhhqP03kKAF7Db6?=
 =?us-ascii?Q?3x6sIwcMwrOcudMcylngbeIkBQL0aId9KrQUWiSYpxhazfMoXHLeu+YABSB+?=
 =?us-ascii?Q?L82zuTplH7sPzp72NWQ2YMGxh078D///yvRXIqCfprnw5FWTG9sSf//vEYXq?=
 =?us-ascii?Q?1UBbI+V+MV5VWLJ93M/pxYWFkhI+OlkhPbAdVjEw/WYGWFnsEhbkW60zfdD5?=
 =?us-ascii?Q?2E0AHaw336nA9m5p4zggJS4rWTbURDtdfJpdvDMLZrt3SXRC+5OcBnbC3GBC?=
 =?us-ascii?Q?pSiwxzcOYvf5RIDQ0ETfbOL4h3DFtElUGURqKcXOkPtdkK20r0kVMKAw5gUk?=
 =?us-ascii?Q?qFzOQ3b9Aa5xifeG5RPvVyloHBM1Cmn9oJ5FKr6UKkc7BSCOZ38bdR9B1U+8?=
 =?us-ascii?Q?bSV62/OFiiumbpxt9lYYB050epqwRbzQwTtHDUcCiRVPRI8SiOa0XIOqQRs+?=
 =?us-ascii?Q?MAyI0x5xN0b4aGWO+jr5gWxtym1A7XpLUS60l15oMaXbKoo38fzAJiyoeNcF?=
 =?us-ascii?Q?N7efzTkJhot1XPWA92dl25xu9RglBzWtUBy6OqDZu7nFvRKQ0UzkGcqWTD2t?=
 =?us-ascii?Q?W/WLpudOx+IdQI4d20ViTEh5glU3qx0maysMubVkJyf5gP+3qBv9XE8va+Zw?=
 =?us-ascii?Q?6M8dlefQQ91zJSxLt/nRf5UI7cSck9mkjnSbwGItfpvZPrJX8YGN8BXRYDyc?=
 =?us-ascii?Q?TF75HGGE8Kn3Q5KiYHbM5VR8W87vBGVTnraSn7pCbEzjHx47clqozED/2146?=
 =?us-ascii?Q?9yXBjrkNZ2FmbSOsqG0GcVImE98v75ggLsEZ/DbFbv/dsbfJ1oF1MdwG0PU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ik94pTgV8rEza+T2c3ni/3uutf/e7UxBqIblplffcu/2ROlWM5nxMdyDeO5?=
 =?us-ascii?Q?ee6CWiqigU7tQdaeAbb8tLLrZ7OAWRy8/V8BHrRczZpNjKUhFgN0sqbLajNc?=
 =?us-ascii?Q?UkNAhG6RNMiAK6EbFW8FWx1fRsEtZHxB1h64JHMuooovPZ2lC0RP8YKNxsoP?=
 =?us-ascii?Q?d5goYPSf80M0jkmy+3BIL/1Qg2QhvI0vGrw7oXbPRxB5m04EUhmHfa1vh+hd?=
 =?us-ascii?Q?S/EsqO4ksMA1ltmjoGilqXgGW4OI2Cq5ddO+yetFYoS3MIEW4/3oAl0sxIMY?=
 =?us-ascii?Q?9BFXT/AipcPIDWmrawT1NT2r9ajSlRbTyGVUQOVEa4ATyV4oFSyWYwU/Juws?=
 =?us-ascii?Q?OpvV7c7qZG23n+/Lnx+/h8YIJVuWTBdJQmHQgKD4fPA4Za9Tt99kqmE8d7lU?=
 =?us-ascii?Q?8dDDj5Qprdgx7ALi7PHEcath6y+UJa9QrNrQAzLLf6vS71okghIxi1UC9lDy?=
 =?us-ascii?Q?GXG+g5T9ZyVJrdnSAL2xGoIQLerYzzaMlLxesrkgOJ0IlhLvyNsRo5UGiVF9?=
 =?us-ascii?Q?V8L+J2ex9ADgmbuKSTsgZQZRH9mLb2N8iF2cJyFVkCVo8a0EiB98T8foxIYX?=
 =?us-ascii?Q?iVWozOO6sjvld6+aOcNC/uxlLZYGweeHW8zKYVe7NNNIg/xEmtehHUdlnroR?=
 =?us-ascii?Q?UhXhUjUgUYh0XCKtCxYuPBn2yLHrdRHoNMDFxMcLDbE5ejEx0MFGVRSH/DqU?=
 =?us-ascii?Q?57yNIhQuFLR8vyMQKy/lL16tjeqOAA45X2MNO1HbdH4ScWcPHODOkWYZBNun?=
 =?us-ascii?Q?cLF8i8H7wlg2JObrDsUHxbCdha/Q9sTwDvzx6xugUL2FxAHhI0MKnJpcJdIc?=
 =?us-ascii?Q?3MOWaIbjqh3jMCf0mRTGQpkIizMqInXqRdBlUwz4QsR9Wd6uf4PybEcuQoBl?=
 =?us-ascii?Q?6QLrZqWM9gQzVxJtpYQOVdy+YothzBPFj5Nd9UOcrHaUCPn+O5u+jRLenv9/?=
 =?us-ascii?Q?EATVSxzBEaoaXo+qmknLJMLuTC+u+XOkq6OFMm6v0fBch+XSTydDmTquwF9k?=
 =?us-ascii?Q?2mMg1A2KmUPO8K84bR9MnDUjeciSLWMiyEIbMGZFlrJ/QUMJfucXpKa6pC5B?=
 =?us-ascii?Q?YZonLzCYXrer9QYFVaBAqp9Ss6gJp8/qJ0fcfISqGwPdf6O2fuMUs5cDO7qW?=
 =?us-ascii?Q?N+nOr+FFMkWAp53aOhbcYlnbI8s6GMmrgnoqUcsw/jlBe/GueMy7PjjiCkb4?=
 =?us-ascii?Q?3AlODfLJknek5go1hqDe7OPzU2INS4gIz3yJjAsH1cfzSCmgyrExNzZwzFKu?=
 =?us-ascii?Q?kUzydhsn3HXnxWzn00dJD0WEDMu8Fi+YncSVpd4qCbGsJPnwipRKbFGni0KH?=
 =?us-ascii?Q?1tQKE0vgtx48Hqg437v4gdu8EjEvOhtdbzzwHk/+VSIWdpe5wSlv3OoMOVcX?=
 =?us-ascii?Q?P7/a1FUiPMhhfJj3v0bAf90Ogo9cJDvlziMrmgjQ4btRVM3DP47K5pDgTiLV?=
 =?us-ascii?Q?RDtTS0fIi+eW0SArbbv/bLDcY88S+JVG3LQfT3zaKZyGPBa8N2OPvxnSpZHN?=
 =?us-ascii?Q?e+1YMZ9xOUAah+OBNSzoWxvByWEM420261QJYrFrQXoGrg1NlHwGfb5ya23j?=
 =?us-ascii?Q?ZxRkuqm72SzhbC1tYwWnVWrp+jA77btVM08injVbmx/O5khvY3dBdDWlGhj6?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fa35f5-c4ce-4f0f-f802-08dc692903e3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 15:20:06.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVYfWJsc98TGyt78zQtc37wloBLp0CjxXXA0+9kLCBhQPZJ/wUnEg2D7qymE4/49pEyI1HyAOmYWtCwSeWMdcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:

commit: 0e250956fc1ab130068a2ca8a0e2c349da4a9cdc ("rcu/nocb: Use kthread parking instead of ad-hoc implementation")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git rcu/dev

in testcase: boot

compiler: gcc-8
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------+------------+------------+
|                                                    | d52b617a48 | 0e250956fc |
+----------------------------------------------------+------------+------------+
| BUG:using_smp_processor_id()in_preemptible         | 0          | 12         |
+----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404302322.1b0d3358-oliver.sang@intel.com


[    0.817839][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.817908][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.818778][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.820106][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.821704][   T17] Call Trace:
[    0.821874][   T17]  <TASK>
[ 0.821874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.821874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.821874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.821874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.821874][ T17] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:103 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194) 
[ 0.821874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.821874][ T17] kthread (kernel/kthread.c:388) 
[ 0.821874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.821874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.821874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.821874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.821874][   T17]  </TASK>
[    0.822254][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.823604][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.824520][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.825854][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.825874][   T17] Call Trace:
[    0.825874][   T17]  <TASK>
[ 0.825874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.825874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.825874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.825874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.825874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.825874][ T17] kthread (kernel/kthread.c:388) 
[ 0.825874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.825874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.825874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.825874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.825874][   T17]  </TASK>
[    0.831550][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.832960][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.833897][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.835238][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.836824][   T17] Call Trace:
[    0.837330][   T17]  <TASK>
[ 0.837782][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.837874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.837874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.837874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.837874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.837874][ T17] kthread (kernel/kthread.c:388) 
[ 0.837874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.837874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.837874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.837874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.837874][   T17]  </TASK>
[    0.838640][    T1] smp: Bringing up secondary CPUs ...
[    0.839832][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.841208][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.841901][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.843443][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.845092][   T17] Call Trace:
[    0.845604][   T17]  <TASK>
[ 0.845874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.845874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.845874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.845874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.845874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.845874][ T17] kthread (kernel/kthread.c:388) 
[ 0.845874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.845874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.845874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.845874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.845874][   T17]  </TASK>
[    0.847305][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.848655][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.849576][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.849874][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.849874][   T17] Call Trace:
[    0.849874][   T17]  <TASK>
[ 0.849874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.849874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.849874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.849874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.849874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.849874][ T17] kthread (kernel/kthread.c:388) 
[ 0.849874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.849874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.849874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.849874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.849874][   T17]  </TASK>
[    0.850627][    T1] smpboot: x86: Booting SMP configuration:
[    0.851575][    T1] .... node  #0, CPUs:      #1
[    0.852509][   T29] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/1/29
[    0.052466][    T0] masked ExtINT on CPU#1
[ 0.853358][ T29] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.857578][   T29] CPU: 0 PID: 29 Comm: rcuop/1 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.857874][   T29] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.857874][   T29] Call Trace:
[    0.857874][   T29]  <TASK>
[ 0.857874][ T29] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.857874][ T29] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.857874][ T29] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.857874][ T29] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.857874][ T29] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:103 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194) 
[ 0.857874][ T29] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.857874][ T29] kthread (kernel/kthread.c:388) 
[ 0.857874][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.857874][ T29] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.857874][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.857874][ T29] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.857874][   T29]  </TASK>
[    0.857979][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.859295][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.860172][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.861449][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.861874][   T17] Call Trace:
[    0.861874][   T17]  <TASK>
[ 0.861874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.861874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.861874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.861874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.861874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.861874][ T17] kthread (kernel/kthread.c:388) 
[ 0.861874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.861874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.861874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.861874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.861874][   T17]  </TASK>
[    0.862467][    T1] smp: Brought up 1 node, 2 CPUs
[    0.863219][    T1] smpboot: Total of 2 processors activated (10774.03 BogoMIPS)
[    0.871835][    T1] devtmpfs: initialized
[    0.876771][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.877915][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.878875][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.880223][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.881840][   T17] Call Trace:
[    0.881874][   T17]  <TASK>
[ 0.881874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.881874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.881874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.881874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.881874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.881874][ T17] kthread (kernel/kthread.c:388) 
[ 0.881874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.881874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.881874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.881874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.881874][   T17]  </TASK>
[    0.881909][   T29] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/1/29
[ 0.883248][ T29] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.884180][   T29] CPU: 0 PID: 29 Comm: rcuop/1 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.885538][   T29] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.885874][   T29] Call Trace:
[    0.885874][   T29]  <TASK>
[ 0.885874][ T29] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.885874][ T29] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.885874][ T29] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.885874][ T29] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.885874][ T29] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.885874][ T29] kthread (kernel/kthread.c:388) 
[ 0.885874][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.885874][ T29] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.885874][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.885874][ T29] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.885874][   T29]  </TASK>
[    0.885986][   T17] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/17
[ 0.887343][ T17] caller is rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[    0.885994][    T1] Running RCU synchronous self tests
[    0.888231][   T17] CPU: 0 PID: 17 Comm: rcuop/0 Not tainted 6.9.0-rc2-00084-g0e250956fc1a #1
[    0.888238][   T17] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.889874][   T17] Call Trace:
[    0.889874][   T17]  <TASK>
[ 0.889874][ T17] dump_stack_lvl (lib/dump_stack.c:117) 
[ 0.889874][ T17] check_preemption_disabled (lib/smp_processor_id.c:49) 
[ 0.889874][ T17] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 7)) 
[ 0.889874][ T17] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:936 kernel/rcu/tree_nocb.h:982) 
[ 0.889874][ T17] ? rcu_momentary_dyntick_idle (kernel/rcu/tree_nocb.h:976) 
[ 0.889874][ T17] kthread (kernel/kthread.c:388) 
[ 0.889874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.889874][ T17] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.889874][ T17] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 0.889874][ T17] ret_from_fork_asm (arch/x86/entry/entry_64.S:256) 
[    0.889874][   T17]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240430/202404302322.1b0d3358-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

