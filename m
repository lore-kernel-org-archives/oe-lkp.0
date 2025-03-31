Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99E78F5D
	for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404607; cv=fail; b=r0SVnvmjrWMRsUtmFJRuCxtn4dVYm3O0Y8W1MFT056z9dlKfmajm+UwWvCeXUd3Yo1VNhfmzipaD/ZhkTyvX/0TQd7QjEByx4Tbq/WYE50lKQqZZSJ/9q6urZRKD13gHTWzFc6zBMYax5oDOb98bHuYdd6ZwNtSm59JfKZYln/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404607; c=relaxed/simple;
	bh=ZBrnpI0RW+/l0TTcyMokDL/eXCiF+b5T6rjuhGVE41g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ONMq/Cd69BZMA/HtwRHhAM4saFuEl5U2/4CLGCR+jzSK6ClilCzTRHTOMTqTuFE6sB2rQfc1/mLqn2NzYaQnZUJqlrjsMiiFKrVdVmmVL2ptC2q1v0wR/XqfNXEYMHpYblb1mtrdJkzx9bTTx+Gw5k3V6lnjVQDHHwpYmHxUj9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aR2lmMA8; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aR2lmMA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404604; x=1774940604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZBrnpI0RW+/l0TTcyMokDL/eXCiF+b5T6rjuhGVE41g=;
  b=aR2lmMA8EiSse1WQJelpIH3dZu0AjJ8a3+pXNGbNb+aKksrgRFj/RR3b
   8S8q2yrEsHbLGL8DYq1alcG8J4KtGqD3ZpTVYzb8wgcs0MKNaTXoprfUu
   tfzQTZHMWnEfTOKJQzfWh66Acg9fZQzE3qWVeenX/zsN+/kWvokznrtma
   AmzcMEaKzNQbom6yJM30M319tuyDvjgWoqhepcA0j/+wdPQCKM9GGCWmL
   aePq+3zq0g9yWVo8s+Ov5+cH8PcjXV+zvF1OZRgRRQUGNWiQnyfxt2/M0
   WSI2EVCXOwq6XTBDzq6MXDzk/J631QflWRKftlqjOWDJmviC6V2eCAZD9
   Q==;
X-CSE-ConnectionGUID: cFw/JlKXSUuv93vcg0Lt9Q==
X-CSE-MsgGUID: m0AxrYrbRR2hd3Pj9HUXyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55331866"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="xz'341?scan'341,208,341";a="55331866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:03:23 -0700
X-CSE-ConnectionGUID: mRBH5nuETcWFcdfqx/3zIQ==
X-CSE-MsgGUID: yza44tDkQL2es96AmW8BGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="xz'341?scan'341,208,341";a="131022270"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 00:03:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 00:03:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 00:03:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 00:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrJHe1uT0KffL1MGXvxogL/mZ78x7Vtvd++TA5An+j8g4u1EzV0E0DLgt8XEhr63DNorsYzK5drMw2QBI6Y6VDqq61zLfWrhTUPiu9JQg+Zlc9qPHQL55aQ3Gyg4pF4YzLJV+EQYkRkCjDYG1Wdt7/giBsVHMZP3+fKo0NTqgkJs9nj/qOL63l7YetqA6QSyiwlW6YqUOqJqMrKACtkqCatv54umVYL0NT9xAZv2AhhhBShnZVU4thDP9BunyakCNqpCOSWmmRbdau9NrvkFIQ5ODAUilNvGesOp5kekxMV6iYsGFgxUsvWBy8jFr0nmXc6SIV3y5HuTCJyDc3JrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rxsrmaIJXEH1j1RQw8yrI36W6DEqZzFWl9kr/RGvoI=;
 b=hjQlJfaV+TUW16nmQVit7/+YZu+SBZyK0DD1tVNvl1YHHjWOotyv8h/iqt0laZrwAZXbBpqqlrDdJ+rzrstADczFt5wnNotzMqdWF+c/gOlHk7KZnHCfMKdqoC1t0o71tZmyky+gL3j+m0bkuakHcbLiiQCBFuNYNvBa9zokikclgeh/i7Qwm6LY69+R8Syjr4ad/OpAL/P8+FTRpexExJ4MxqGS4FW82hs8jw1bHhSQEhSEXUUX7GnAQte5JgrOQRgTKaSUeKIbS24pdzt3mBOBlV5IfOvo6wj2gdUQM10z+ppRaTlKRzCjgCJ8XmqgV4BgxsSLYTbpjTRX/i6ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 07:02:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 07:02:38 +0000
Date: Mon, 31 Mar 2025 15:02:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:rcu/for-next] [rcutorture]  1506e3f369:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown_cleanup[rcutorture]
Message-ID: <202503311431.f51ceb6d-lkp@intel.com>
Content-Type: multipart/mixed; boundary="iHarfWprLGQX0OEa"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 6629a70f-eccb-4da4-1d9b-08dd70220588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x2PpcRq3zuHX8FrYgWZV7YQVT6L8HoyklFdRnSZuORRR6VEclw6QlYe6ZJrr?=
 =?us-ascii?Q?6P97focrNKATaaueGzkbr/3CubOXbSlUb00HO8kBSDxlll+RPGSKJPfTtW56?=
 =?us-ascii?Q?vcBzwj/1vlr4Xir/OdSGr1IT9oBd6lYrMu0s+T7Rvo+lRKtoimCJu0J59Jbv?=
 =?us-ascii?Q?6VZjMQLrxMhS3mWlE4wdLPU4awuZKzxeOLZ1BzLCxH209GxVa/7d+eTEHZzQ?=
 =?us-ascii?Q?A/fRqwoBUmiKnY5hegf8AOgyetVKx/3ZKtX08BVH/G8BmEA6SlIxZAxAXoV5?=
 =?us-ascii?Q?nqRmK89hwRCoNGSCQfo9uZXTux3S47aOy5jkKC8bYlwcoYDBbUkEaCiVQDbk?=
 =?us-ascii?Q?rXO7rfJrdaFZ1BVQqo5VaV6+gmB0dgbpc+xLEB1UYVXgbz3LkmGdujK+gOYF?=
 =?us-ascii?Q?FDM1yPmlfUvZ9hgtWydRegbkzuwiGs+WA+ClHL4smiFoAkIiHTmylzyCLXKE?=
 =?us-ascii?Q?0Zs9d43Sq74btpvKJoId7k5A10VeT3jMXb267qS5J7CWxgMuNYBvrJbzepB0?=
 =?us-ascii?Q?hj/6f/8CZ/XPfPoJvXlJab8A4T4pRsP9rYtOTp17JlnyKtvt5j7nVmAqtjst?=
 =?us-ascii?Q?Oxh0sATYR/RpNlsCNy/7SkNpvQGv8cH1qKMyXxxZNxTf0XcdJ2lN4HzBPBVf?=
 =?us-ascii?Q?N36Fc861ddkrtGq2PDi3nD7Fq6+AnQIHZHH/NeFBIQwrK4P7fO0pMTeafm0W?=
 =?us-ascii?Q?9WPPu//1GLGHrlcvoKG1rRhjnnQSn5JqFqZK0jsWxtLD5x7S721lrJQAXozV?=
 =?us-ascii?Q?q0jtnInAvMV5kyPUBNIn9ufIMY/ctMe6T0HzVsoGFXqnccrHz7GqCwcZ8mNU?=
 =?us-ascii?Q?XCfva8SS46h5nktOw7ATsE/0+UaTxuFFg5e2/H1JtpqLW7jQL5UJbdFVG0iG?=
 =?us-ascii?Q?NiZntLlzTmoFw8/SAS5X0PxZkkaR8Qm2LxPLLATEvCt3gsJD7/NHb5j2eCMz?=
 =?us-ascii?Q?X68rMqn5lUGoy1OKFd5cyyQivOqFMqW1gT7v5bcftECnI9hc+oRZGubcXtl4?=
 =?us-ascii?Q?pE5PetNICKNnlLSPIAuZofyvCo5zU914w8aGIGuUvpNaXAUIQYhI9RqZpyIg?=
 =?us-ascii?Q?NbuPS/p4K1ohEcStDPlyaqn4H5qHEw2xSi3ZIAn4ILOywlMREpBnUb6hHFey?=
 =?us-ascii?Q?1aTVkubZcFL2s9sQ1pvJKF/8GhJTYUJxcvJQ1Iqn24d2XtjHdOzoJzYUQGsx?=
 =?us-ascii?Q?6E1648q79I261BqOCB+qEPhxpq3f4Y8/MtRfDlJc2UIDAhB1LvlU6jaVwDac?=
 =?us-ascii?Q?b2ygz37RbAZR/nOCli0kORf9WCuYNkHSpPWLr41oyFyDCNUppbtjFNFBeibV?=
 =?us-ascii?Q?nmw5tE4U/j5B2WxH6SA+4nzPtUoF1+aNn4LijTUE/ozJCeRvcI+GqUdpPdUE?=
 =?us-ascii?Q?3bsdK9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3TjdJpZJo1YpHC4hYB1W6Oln/dTP6IsY+rrL9RCZ8IBMgye1dgwhGVXdf3sQ?=
 =?us-ascii?Q?SIOjLnG4xQZCS8vb75e0ic5j9uo2YjVZm7AiRMuf/V0QMnAg2JjCoJnAHIXY?=
 =?us-ascii?Q?3G1pdhuzyD/AfHSLSB14Bh3lDhU0ONN49576YYmgFlaZ4UILP1uNaaY36cvb?=
 =?us-ascii?Q?rYDM6B7yodPiaPTPAx2JkxYgwTSUVkrhjM7ZjZ6MBQwwq3tO1fRnSDJncIoG?=
 =?us-ascii?Q?qo5dMcziTlNubpzHljAxuYCapeM3HsISPq5AlYrDFKQdEbWu3wsXlpBJGa6/?=
 =?us-ascii?Q?gSH/rpJUDJRbUae2CMOJyK/VYXnK1B0Uy5fZwZ3MZ4+QEEHehJUPaBqjxKjx?=
 =?us-ascii?Q?a05P5eQhs1ClGrON3o4OEuXtPiCbCluXEZdHuzglEpvSjaBsD9Pr+OeXCpe7?=
 =?us-ascii?Q?ygQ/iVDwIT1er2KT0Xi3TerQ1DPitpt83GDugmgcNx2fum8Q8+5Q0aTD+/O7?=
 =?us-ascii?Q?2nADppMkedIVWqSV7tlZaNp3hADg5Rt0J1yxy8qMJm4QRahdEI8/zDAtKDgb?=
 =?us-ascii?Q?wKIfPv+XzDLnbz97f8ufpiyFlge64XX+tH5EZV9SH+mgs7twyiRTKjQsxs8f?=
 =?us-ascii?Q?YQ2QnvIEcpgejqnk1+rlzFUuRTPr562ncL4FLRoIfJBP+ceYlIADh4OSsanJ?=
 =?us-ascii?Q?2adkLyBlAXB68RQxazxCWf3UpcLr1C8BOQIjXevifHZCpp9ptYf+YzomFV5O?=
 =?us-ascii?Q?2bsN0woooGSFvgKbarE8BybK1NYrRQtqE8uzTe5N64QdF7VsDKEEf2zsUJn2?=
 =?us-ascii?Q?ktGp5fwtiWQ81Qhem7AkU0PFxQjuhBhNctr4dSL7cDvb/hjikWa89aHVJ7zS?=
 =?us-ascii?Q?RM8+LYkwxmPAz/5lok7g1MZ7svWQPqcNiseX6BHr3bVwrsl3kXNGH/Mlji5g?=
 =?us-ascii?Q?9hO8OiHJQ2v5ORRFfzohqRNdMckKLSeyG+qcG5ENxYjjICDcyI/1+/quIJHH?=
 =?us-ascii?Q?hfxBjQlKZ5+XL1UcRnr9/PMjM5DXmNdsKiu52dKL9Ns1RHI0U2qG5cGysrpi?=
 =?us-ascii?Q?VJQ5c9iwj1iIESLlgK0Pa/JvEAoze68IQ9Qps3lpZgR+XHnLJ6H2+d+79zZh?=
 =?us-ascii?Q?NwVnEkAgAOSqs/WubVvtYx3BT3YMd7hdKpsWNxOuBJa6ABK0K4bA0wfuq9Qf?=
 =?us-ascii?Q?OFRkpboZMf1qOXRX46dgw2Dzk46xjobOLYb6SQkYGgmZta156KOuDwZ835D+?=
 =?us-ascii?Q?vlxJ5L/OqW/E83MzA2fhLnmwBYFRUAL5F1TOYw8kFHVwsVGCAAqsklbtZokx?=
 =?us-ascii?Q?rAao82R5rMVYVwCtMCA7jrt4PxnrHyoaT5goWLaN0YuwY3ZqdwAdEKd9sr5/?=
 =?us-ascii?Q?RhrHNvUhjQ0Mqvy3GHAwA7OpJQYfOGwihBKLUy6KyDmnAO4mLHbL53vamtvU?=
 =?us-ascii?Q?n9LM6wlguqVB2Uve+HEopppjvw2sp/usz+RtA3jse+V3J0jFFBTQxj5ZHCoq?=
 =?us-ascii?Q?//SZ6viKegf+qH1ZX//O/MWtHkpdq35eufmIoS+P6FzuNMmZVaWEe25fiM/q?=
 =?us-ascii?Q?oGwu8UmdbhH+9ukuFl/ASjncgp7jlE2KqLkzOjwXQw+ZSxXrmz0mL0/6wQF0?=
 =?us-ascii?Q?FCPyVv2crdB4DOoV5pJX7rYRO6vN9c66gKHUel/tP+NlozXlDHcWTxRMLjGh?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6629a70f-eccb-4da4-1d9b-08dd70220588
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:02:38.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeE+fzSeHJowR9C2b5OuZV0goVJH31OgBuYGHuFegIFQntTqcaYOY0edMRd8lTB9YdlWGqmRl7sBBTDX3xMiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
X-OriginatorOrg: intel.com

--iHarfWprLGQX0OEa
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi, Joel Fernandes,

this is not regression report. we just use this report FYI that there is a WARN
in our tests. the WARN seems change the stats after this commit.

BTW, for both this commit and its parent, it's still possible that whole test
finishes without the WARN as below table. parent shows WARN 5 times out of 6
runs, while 1506e3f369 shows WARN 4 times out of 6 runs.

at the same time, we noticed "task_blocked_for_more_than#seconds" issue on
parent, but seems not reproduce on 1506e3f369 (an improvement?)

also attached a parent dmesg dmesg-874b6ebb5f.xz.

874b6ebb5f6be13d 1506e3f3698375b69e429f53167
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          5:6          -83%            :6     dmesg.INFO:task_blocked_for_more_than#seconds    <---- (1)
          5:6          -83%            :6     dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
           :6           67%           4:6     dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown_cleanup[rcutorture]

below is detail report.


Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown_cleanup[rcutorture]" on:

commit: 1506e3f3698375b69e429f531679dbaf93c90344 ("rcutorture: Check for ->up_read() without matching ->down_read()")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git rcu/for-next

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: srcu



config: x86_64-randconfig-007-20250327
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503311431.f51ceb6d-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503311431.f51ceb6d-lkp@intel.com


[  472.007606][  T698] ------------[ cut here ]------------
[  472.007637][  T698] WARNING: CPU: 1 PID: 698 at kernel/rcu/rcutorture.c:2506 rcu_torture_updown_cleanup+0xb2/0x1e0 [rcutorture]
[  472.007779][  T698] Modules linked in: rcutorture(-)
[  472.010000][  T706] srcu-torture: torture_stutter is stopping
[  472.010232][  T698]  torture sha256_ssse3 aesni_intel rapl input_leds parport_pc serio_raw tiny_power_button parport button fuse ip_tables autofs4
[  472.017572][  T691] srcu-torture: rcu_torture_reader is stopping
[  472.027768][  T698] CPU: 1 UID: 0 PID: 698 Comm: rcu_torture_upd Tainted: G                T  6.14.0-rc1-00091-g1506e3f36983 #1 46db128b3c388323da38fc0fcd6f406cc3f08136
[  472.029134][  T698] Tainted: [T]=RANDSTRUCT
[  472.029539][  T698] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  472.030822][  T698] RIP: 0010:rcu_torture_updown_cleanup+0xb2/0x1e0 [rcutorture]
[  472.032257][  T698] Code: 00 48 01 f8 48 39 c3 72 9e e8 ea 4f 6a e1 5b 48 c7 05 6e 08 01 00 00 00 00 00 41 5c 41 5d 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3 <0f> 0b 31 c9 31 d2 be 01 00 00 00 48 c7 c7 48 87 0e a0 e8 67 c4 49
[  472.045720][  T698] RSP: 0018:ffff88812549be60 EFLAGS: 00010202
[  472.046759][  T698] RAX: 0000000000000000 RBX: ffff888123c98a98 RCX: 0000000000000000
[  472.058330][  T698] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  472.059629][  T698] RBP: ffff88812549be78 R08: 0000000000000000 R09: 0000000000000000
[  472.061135][  T698] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
[  472.067715][  T698] R13: 0000000000000ba7 R14: 0000000000000000 R15: 00000000fffffffc
[  472.070834][  T698] FS:  0000000000000000(0000) GS:ffff88842fd00000(0000) knlGS:0000000000000000
[  472.072249][  T698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  472.073372][  T698] CR2: 000000005658f691 CR3: 0000000151c96000 CR4: 00000000000406b0
[  472.074856][  T698] Call Trace:
[  472.081006][  T698]  <TASK>
[  472.082274][  T698]  ? show_regs+0x67/0x80
[  472.083145][  T698]  ? __warn+0xb7/0x170
[  472.084001][  T698]  ? rcu_torture_updown_cleanup+0xb2/0x1e0 [rcutorture 8771654986afe5f49a2167f3607f27b0cca53fca]
[  472.089846][  T698]  ? report_bug+0x228/0x300
[  472.090812][  T698]  ? handle_bug+0x5f/0xa0
[  472.097780][  T698]  ? exc_invalid_op+0x21/0x60
[  472.098578][  T698]  ? asm_exc_invalid_op+0x1b/0x20
[  472.099496][  T698]  ? rcu_torture_updown_cleanup+0xb2/0x1e0 [rcutorture 8771654986afe5f49a2167f3607f27b0cca53fca]
[  472.101362][  T698]  rcu_torture_updown+0x115/0x170 [rcutorture 8771654986afe5f49a2167f3607f27b0cca53fca]
[  472.109200][  T698]  ? rcu_torture_updown_cleanup+0x1e0/0x1e0 [rcutorture 8771654986afe5f49a2167f3607f27b0cca53fca]
[  472.111066][  T698]  kthread+0x17e/0x390
[  472.111783][  T698]  ? kthread_fetch_affinity+0x100/0x100
[  472.117036][  T698]  ret_from_fork+0x87/0xa0
[  472.117784][  T698]  ? kthread_fetch_affinity+0x100/0x100
[  472.118658][  T698]  ret_from_fork_asm+0x11/0x20
[  472.119607][  T698]  </TASK>
[  472.120110][  T698] irq event stamp: 2072991
[  472.125806][  T698] hardirqs last  enabled at (2073021): [<ffffffff814154bc>] __up_console_sem+0x7c/0xa0
[  472.127465][  T698] hardirqs last disabled at (2073030): [<ffffffff814154a1>] __up_console_sem+0x61/0xa0
[  472.133128][  T698] softirqs last  enabled at (2073052): [<ffffffff813509d7>] handle_softirqs+0x257/0x460
[  472.134760][  T698] softirqs last disabled at (2073041): [<ffffffff81350d06>] __irq_exit_rcu+0xb6/0x150
[  472.140328][  T698] ---[ end trace 0000000000000000 ]---
[  472.143141][  T698] srcu-torture: rcu_torture_updown is stopping


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--iHarfWprLGQX0OEa
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg-874b6ebb5f.xz"
Content-Transfer-Encoding: base64

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

--iHarfWprLGQX0OEa--
