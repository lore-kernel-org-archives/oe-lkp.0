Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F91AA1F4
	for <oe-lkp@lists.linux.dev>; Fri, 24 Oct 2025 02:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274000; cv=fail; b=KIxNvMvwYu7Ar2iUoPhqES96WQXMVe9zu1W3B/si5um76vighCxo+nwKbRCRIWD62O+tnjKH/4u1fHGJeqXckg0FVvfeLRUox0AW53250vha2OMX02WrjS0FxKVzQ0JSonr0vnYysYPWCWB1JeZgM6vMWwAWJpuhMektFgjleHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274000; c=relaxed/simple;
	bh=A4dGtvytOCAkON0d1JXlpORVS5GYr71a6qHa6/UVaxk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D49wtp3aEda57uONI4eBDSq6NNof3uYNIZSMNeH0yyquFs5rNSxN7VgahmpCLCGx6OYhifziXEuEbCMHPTbXXRXbndxgwijUEUAiAtHSt5uFo+UbKEkzLerybfXPD4XG9PJ/sHUa6JniCZfoHnsTC6emj094Sa98RoM9LyNfAVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df0OMC4M; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df0OMC4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761273998; x=1792809998;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=A4dGtvytOCAkON0d1JXlpORVS5GYr71a6qHa6/UVaxk=;
  b=Df0OMC4MwLTpovIVthRcuRTMAScR/v61imaFWfwOBC3XGATZXemu0hN0
   PSLUNRkj8BEfuotBKGVez7icE+luTsWwMa7/2OImQSBkLYda/BDbMfzuo
   CTdVtS9wCuOH9pAy9bh+kgnNo7+opnMlP4Xk9f4mpomGlgPmWyMng008e
   gj57vZkjk1jV9qpUmEGq72N/uTQdYuOAbbUcwohA2FIeR/DfDH5usRjcv
   9bv97RQ/JzH5OSnmWwTGzgODhekRTt1MJ3XUGcTr+J17Y6IzGJq2nrhDB
   9giboLHaL/3YHZ/0GFwf4LhuV3b309djuqu258Y/tk884R0CMlp+0ISim
   w==;
X-CSE-ConnectionGUID: HESvDLjDQhaIvVtUWhB3Rw==
X-CSE-MsgGUID: nF1cW9TmTTuQkmtQLKBrMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67290009"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67290009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 19:46:37 -0700
X-CSE-ConnectionGUID: /EZ27OLIRxOeBFv4Iu8BXQ==
X-CSE-MsgGUID: qyB3TozJQX6KF19hY92C8A==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 19:46:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:46:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 19:46:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 19:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzCBnW9WT3Srddip8AOE7LOh8Qknr/g1QE/HFdZZ1YI29d+wf31N/ykXLYRelwY6zJUxsotGhBvrJcK1/Gfk9NvxYIh+TgRnGaNfpi3d3UbYqh74A38EUOs9st+0emU0K3z48NfM7EezasgZet7KbxoYS3ieahn8myM7woOJ7eWbWTYbzAyGTldGQMECMBGqo8TNXi5KbjiBPkr7NLc5UuffBrUF/yXOjZ3YcepCyrPJZN+/jrTlgWnx2zjmdIUjSo+lHcJOQ7ycM652pgEtQgYSQAKaVIjfJbKCvmKXArQ4Iw5tt5Y/ZYqOQpvMUP3CnSw56n/bGL/PqUGuiHj2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2HXCb56PoHs2giuBrF3G8i3ilDd4G/Xg9TXMA505V0=;
 b=ZCEsH6W/FcRjh8uiaL4pBPuQ8V/ctDfXrB/0BmGqWu0Y8VYZSn3CmatCxvR4fYz1OZtxI3acPX00M4JOUC60BHhq1czvwi/Fn4yOP9PINAQsT2aJOkfYWedx9OsSkqsBrBP7NXxi8nLvoSEv3iWRg5ZAt+iWD0P7wGFTC+i2FPL+lE7b1j9AZwPRaJPkzy5wVGvje1x4vU7N5LXQBePIk/9O1lNETIy8USaYA6x0Wat+pp6YR1NkWMQ895NBc78nOYNfg1225FpHsYb6eH59YMbqm/31gpj6bPe2/KoeUyJZu5nDEaraFBzOj6+BWEclmTyjFA5A066h24VdCXZB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:46:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:46:33 +0000
Date: Fri, 24 Oct 2025 10:46:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [sched/fair]  0800afe7f6:
 schbench.wakeup_latency_max_us 56.7% improvement
Message-ID: <202510241025.8dd8dbc0-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::30) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0fbbb0-8434-42a0-59b7-08de12a78b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dWWSd4bJ5lwKYEJurNoZoOrSGXFJsZfvgcfzjqP07gHUfBq12fEbCBvOOT?=
 =?iso-8859-1?Q?97Pn7VUr8/KP5SyKmmpLTYRj4uhjItAw5yenUA7pUkUZEILeilE5ZPp+v6?=
 =?iso-8859-1?Q?5hIFtakaIK4GwqCEJ9POpnpS1uR8ubiCoKfq9PgOv5IrnKTGnjoGyIdiOT?=
 =?iso-8859-1?Q?GPZaiSOwoFGgb1xq6LsuEXKJlsOJUilP3xinhwySzk9sssyHUQMnnEBzc+?=
 =?iso-8859-1?Q?EQhffojTqn0Q2R7gOT7fSNf6NJeZeP6BIyeuY/Gov2Oywua1RzF81//UWF?=
 =?iso-8859-1?Q?4AyGe/TK9i3QSuXv9nHHuXlc0RVeyov3tAcP+MqEotXsJN70dfOQq8qg+6?=
 =?iso-8859-1?Q?xFvi3qAo9Lj1Xq/CFF+p2cajA5wh0P2f1V/kJj90aJRFiiTQjMSL9/WkAY?=
 =?iso-8859-1?Q?ujC0WBVTu/LEagq8SASaEVhW6mQjH20lO4DnIj10Mh3SpOm7AhjGrBJKyW?=
 =?iso-8859-1?Q?JyHCFqZ2vBnufx9++I6cg51rvuHHdNa83S+Eput+/MqJoj4gk8Uzjd7Hc/?=
 =?iso-8859-1?Q?ueL7/A6E0aHwTYKpndR17p/Dba9Rs9M7x1PGCCWtXgO6ed+tQCnaRNIXkR?=
 =?iso-8859-1?Q?tuwSECWqYwM9twTZlgosGtbD8Sj3MDC5n3iraD+63RhoGZt0yrAl2DeB1Y?=
 =?iso-8859-1?Q?oyjW9w8VfmwxBZI0fo3M/xFnXixIUHTYwq5wVrR9ifdob7uusBg9JFD3Pr?=
 =?iso-8859-1?Q?wCdJwcjHoJlW3uvke9xjCxlAIavZRc7L/MSIQPqqa1PQuv6KNR2XZuTSJz?=
 =?iso-8859-1?Q?2FblUqLHnplQqBOShUQhRzahVpOzrO6HZKAJpaJ8ZdBGqwV5mXzASslIYm?=
 =?iso-8859-1?Q?GjARwlllC9p1ehto+MfuIncc227KVi8erVpAcZP41I/bpGExiNdDZEAG2P?=
 =?iso-8859-1?Q?boZwQn7hOpSQfK7i4v4V+BH2dVgcYeB74vNEEj/1qSh2NcrjStR8L/EOvq?=
 =?iso-8859-1?Q?OUAqELbm8e9SUGBhgDg1Mzsx+fXvGtSjBkD5NAazmqjoI0rfPmo8ilEmHX?=
 =?iso-8859-1?Q?USeD01VCfYD5uSQY6gmltiso7JB/GDc7DxpV//+Fb9MfVdjqGDoPcbdmVF?=
 =?iso-8859-1?Q?Xt4b9IB85RhcXxiuocIo5eRGjaRlBDjYIIaItJZqPl8vNGTcDpmOjYifFr?=
 =?iso-8859-1?Q?k3CqKcO3cEC6dJAYYZKTl13Mr08wJ68NOxHdUNtTzUnw99N5NYvbkmq4e4?=
 =?iso-8859-1?Q?ie4hp7i+IIgYTS8gtgJd+B3JX0KW1wd09z2X/gZg7cmk+7W6Yk07rJO8st?=
 =?iso-8859-1?Q?eRK6vVY6uPXNoEFbk7MDJO/ZZZTTRNdrDQ8yQP8iuxpMRzKQoTTUDpagBN?=
 =?iso-8859-1?Q?28omvh9vM5eGoT02QV1j8IxdXcrgG1owhgr+FNpW5/fAhWcjAx1hV+DQkm?=
 =?iso-8859-1?Q?ig/+ZUf0jt+mv3AkxaGmKBanTWmuqv1IPi21gBKl+7PJLRiWzz0ZXI7QKB?=
 =?iso-8859-1?Q?otZPYgHfEpQgW9moDw2vR6zXl4W3c+tPNHA2TZf+jBdoiZgRiqm79qydyk?=
 =?iso-8859-1?Q?bhMi23w/xjINu8IzPQ/zctR/L2NL/KSuas8lXhd1W1tg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QKG4/HcAw/yU0e+W3JnTGYAq/JECjw2ZiuVDmZ5Zo7uMp9BdkQ/YE6y1+K?=
 =?iso-8859-1?Q?3VxGZ9SL4O+uaP+u5MWlfXyZ17M98mx0kdNY9cV+udyJyZKjGNAMSSC7eK?=
 =?iso-8859-1?Q?XB2TdSjT1789SP8yTJWhl3jDLgIl3vs+xVAWVzNhTW5lQEI2y+n/64S3Gb?=
 =?iso-8859-1?Q?kGIwDrebfzX42V3rJWvDwNEj8FJo2FgDWFBAeapqNl3o4sHqrxWf9EGyME?=
 =?iso-8859-1?Q?jeKgkC8KsP7CzEN3iXvacJHr9m96lM+OZUp4HpuhqDJBfHZegDXT/nqcRf?=
 =?iso-8859-1?Q?CH2cy1qL6PrBkCRyRxCjR53J+FUAt8Qgwl4B/rWrBiBX4KJXn+t9NuVaZz?=
 =?iso-8859-1?Q?S+WA7yMmd6+28MXggVjF+NY6trzivAoDiIG1TLYl8kZOQcv/2uljzJN/mJ?=
 =?iso-8859-1?Q?CMsDc+ODWHTtQNgFf+QLAu/PpSVtD9a3fCM/ide/RDoYomjzqDBcG39cq8?=
 =?iso-8859-1?Q?QIIPhNf3fmDcjwrke6A9uaP61NxU8nM1Vomos+HYjKUlQOXv+SsO+p9myf?=
 =?iso-8859-1?Q?lHZBsWniCC2cKyObKJ7gzAZKKqf5m9AyFi2cjNDjfM2c3cLHsUuC0iFsPQ?=
 =?iso-8859-1?Q?MXKZ4oLjPSQ2egbHF6n133IlN8gkxqnkfxDOvrl5lfswvENkLmbx6zMp2j?=
 =?iso-8859-1?Q?CPH2S6bKPwozYgvYbKXqD+te97MQnUGd1St2LznqxqgGHHA8/Yz5lNTVw7?=
 =?iso-8859-1?Q?foYXp44vgojFrc1TdWkbxaOB7IHgsxT54lijrizIxW3gXl54QIl7bUu3VQ?=
 =?iso-8859-1?Q?vU4l95Hs93HBkCw6TPX/7XVrR9mom5PHs4VvUIYQdCL3+BFLNvrcZLhpYd?=
 =?iso-8859-1?Q?uAp4VmVD2IjAqPKESJJMIlvHJqeL+KwcCXuX9yLZW2lAvaN/npiraBrFH6?=
 =?iso-8859-1?Q?acwkpPbwE7ytR2fTYUUtsBkJDrha9vJN30ca+8BBCPkn8ZO8cI/dvU5bG2?=
 =?iso-8859-1?Q?AOI9j7yENihn8hHtc70XTOmaH+5JyaYcHWbGhWyhW6vROoqnk9pfIrZ4YZ?=
 =?iso-8859-1?Q?lfElHuRh7otDSXgDIK6ns0U5HYPrusZeVGVyfDTM7eNwgujJHAlUlK8GWM?=
 =?iso-8859-1?Q?4ASOpAdEWTycpZ+klrav2AY6AMLw5wizttHdg0MXWdnv/D4ahx66dSQFWP?=
 =?iso-8859-1?Q?hy6cCB7pcr0kxespT+R74EuRDsbxw8/4hmy6hVNz2R5no+dOwCzAYjSQ3y?=
 =?iso-8859-1?Q?hHjCmZCx1d2CYeP77bks0eLh1GRQXn5eIlgvnpIF6uxViu9RRK3pb37YGX?=
 =?iso-8859-1?Q?AxaEdsHAElXW58bs239j+fBC8sadlPXTMV6ERN5qjmGXUuEXIOK0fNWSyr?=
 =?iso-8859-1?Q?dEmRTVBLuzb+F6Jn8kseUWgQY8hyY4e+sUQ91FsHlrRU1fDzgWXk0+EjE9?=
 =?iso-8859-1?Q?7mCRvH7W3MFit8+r7pp1wEgXE2DX82yCeEdLk/mgggXzrus1kJBTNPqkjG?=
 =?iso-8859-1?Q?dw4+w7Sz8HK/ZrwRsCqcIekvf7ZIuS8ikctUkg58OElrDKdOEV1A7t6Muo?=
 =?iso-8859-1?Q?OjNnMf5g/gFncKPoJH0xtOL37NAOA7zYPKt3kxw2z3NkKAcCtu4xV8rYdC?=
 =?iso-8859-1?Q?v2L3MldDH5jTlLgxBeoh0kigQuYBB4TiWPY90Jk3RnPEOq+IOAkahKyK4M?=
 =?iso-8859-1?Q?6qEHUPgxVtWfqVrYDCmnhTZ84uAgIHOpZecd5xLU8YVacg1lUvNEnxyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0fbbb0-8434-42a0-59b7-08de12a78b17
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:46:33.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8ZId/0ZcGCIXFPxaVmNWrtR3fo8bFWILhDCzj7CETdT0hpcLWZdHDKjzasDV3osPBSl+22DsYZ/txJk6AdLUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 56.7% improvement of schbench.wakeup_latency_max_us on:


commit: 0800afe7f6fe413b1f4e03765e1d86a1ced76197 ("sched/fair: Remove sysctl_sched_migration_cost condition")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: schbench
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	iterations: 3x
	message_threads: 2
	worker_threads: 100%
	runtime: 300s
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241025.8dd8dbc0-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/message_threads/rootfs/runtime/tbox_group/testcase/worker_threads:
  gcc-12/performance/3x/x86_64-bytedance-5.15-velinux/2/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-2sp3/schbench/100%

commit: 
  9e07e61bad ("sched/fair: Wait before decaying max_newidle_lb_cost")
  0800afe7f6 ("sched/fair: Remove sysctl_sched_migration_cost condition")

9e07e61bad75f5f0 0800afe7f6fe413b1f4e03765e1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    176238 ±  2%     -14.8%     150165 ±  7%  meminfo.Mapped
 4.275e+09           -71.2%   1.23e+09 ± 16%  cpuidle..time
  49231140 ±  2%     -83.8%    7965943 ±  7%  cpuidle..usage
    107571 ±  5%      -9.3%      97560 ±  6%  numa-meminfo.node0.Mapped
     68364 ±  8%     -24.5%      51600 ± 12%  numa-meminfo.node1.Mapped
     27179 ±  5%      -9.1%      24696 ±  6%  numa-vmstat.node0.nr_mapped
     17157 ±  8%     -24.0%      13046 ± 12%  numa-vmstat.node1.nr_mapped
     11477 ±  3%     +30.6%      14987 ±  4%  perf-c2c.HITM.local
     13039 ±  3%     +26.7%      16520 ±  4%  perf-c2c.HITM.total
    198788           -20.1%     158830        vmstat.system.cs
    362453            -5.3%     343306        vmstat.system.in
      1.74            -1.2        0.49 ± 18%  mpstat.cpu.all.idle%
      0.36            +0.2        0.53 ±  3%  mpstat.cpu.all.sys%
     60.60 ± 13%    +576.9%     410.20 ± 41%  mpstat.max_utilization.seconds
    195028            -2.5%     190120        proc-vmstat.nr_inactive_anon
     44155 ±  2%     -15.0%      37533 ±  8%  proc-vmstat.nr_mapped
    195028            -2.5%     190120        proc-vmstat.nr_zone_inactive_anon
    316860 ±  2%      -8.9%     288654 ±  4%  proc-vmstat.pgactivate
      0.01            +8.6%       0.01 ±  4%  perf-stat.i.MPKI
     25.81           -11.2       14.60        perf-stat.i.cache-miss-rate%
  16378045            +5.5%   17278386        perf-stat.i.cache-misses
  63903790           +86.6%  1.192e+08 ±  2%  perf-stat.i.cache-references
    199223           -20.1%     159187        perf-stat.i.context-switches
 8.962e+11            +1.2%  9.071e+11        perf-stat.i.cpu-cycles
     27578          +133.8%      64472        perf-stat.i.cpu-migrations
     55041            -3.8%      52948        perf-stat.i.cycles-between-cache-misses
      0.01            +6.8%       0.01        perf-stat.overall.MPKI
     25.65           -11.1       14.52        perf-stat.overall.cache-miss-rate%
     54597            -4.0%      52387        perf-stat.overall.cycles-between-cache-misses
  16397216            +5.5%   17293915        perf-stat.ps.cache-misses
  63919491           +86.4%  1.192e+08 ±  2%  perf-stat.ps.cache-references
    198926           -20.1%     158928        perf-stat.ps.context-switches
 8.951e+11            +1.2%  9.059e+11        perf-stat.ps.cpu-cycles
     27538          +133.8%      64390        perf-stat.ps.cpu-migrations
      0.03 ±164%    +768.9%       0.22 ± 30%  sched_debug.cfs_rq:/.h_nr_running.min
     53.81 ±164%    +756.7%     460.99 ± 30%  sched_debug.cfs_rq:/.load.min
      0.27 ± 38%    +203.1%       0.81 ±  7%  sched_debug.cfs_rq:/.load_avg.min
   1466271 ± 10%     -29.5%    1033307 ±  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.03 ±164%    +768.9%       0.22 ± 30%  sched_debug.cfs_rq:/.nr_running.min
      0.14 ± 10%     -46.4%       0.07 ± 11%  sched_debug.cfs_rq:/.nr_running.stddev
  -9106662          -118.7%    1702366 ± 72%  sched_debug.cfs_rq:/.spread0.avg
 -11954520           -86.9%   -1562056        sched_debug.cfs_rq:/.spread0.min
   1468405 ± 10%     -30.0%    1028560 ±  8%  sched_debug.cfs_rq:/.spread0.stddev
    919184 ±  3%     -34.6%     601440 ±  2%  sched_debug.cpu.avg_idle.max
    175545 ±  4%     -57.7%      74293 ± 10%  sched_debug.cpu.avg_idle.stddev
    173.81 ±234%   +2365.5%       4285 ± 27%  sched_debug.cpu.curr->pid.min
      1976 ± 12%     -49.5%     999.29 ± 17%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 11%     +63.9%       0.00 ± 10%  sched_debug.cpu.next_balance.stddev
      0.03 ±164%    +768.9%       0.22 ± 39%  sched_debug.cpu.nr_running.min
    347225 ±  3%     -19.3%     280211 ±  2%  sched_debug.cpu.nr_switches.avg
    381001 ±  3%     -17.5%     314309 ±  2%  sched_debug.cpu.nr_switches.max
    333108 ±  4%     -20.2%     265844 ±  2%  sched_debug.cpu.nr_switches.min
      5126 ±  8%     +33.8%       6860 ±  8%  sched_debug.cpu.nr_switches.stddev
      6460           +27.5%       8240        schbench.request_end_latency_50%_us_max
     14070 ±  2%     -21.3%      11068        schbench.request_end_latency_90%_us_max
     29702           -27.5%      21548        schbench.request_end_latency_99%_us_max
     45606           -24.8%      34304        schbench.request_end_latency_99.9%_us_max
      6414           +25.7%       8061        schbench.request_latency_50%_us
      0.97 ± 14%      +0.9        1.90 ± 24%  schbench.request_latency_50%_us_stddev%
     13755           -21.1%      10851        schbench.request_latency_90%_us
     29098           -27.2%      21191        schbench.request_latency_99%_us
     45106           -24.4%      34097        schbench.request_latency_99.9%_us
  17268332           +74.6%   30153249        schbench.time.involuntary_context_switches
     25155            +1.2%      25469        schbench.time.percent_of_cpu_this_job_got
    774.11           +50.7%       1166 ±  3%  schbench.time.system_time
    225756            +1.1%     228192        schbench.time.user_time
 1.097e+08            -7.9%  1.011e+08        schbench.time.voluntary_context_switches
     19.00          +660.0%     144.40 ± 25%  schbench.wakeup_end_latency_50%_us_max
      2.03 ± 50%     +21.5       23.56 ± 55%  schbench.wakeup_end_latency_50%_us_stddev%
     10080           -10.3%       9046        schbench.wakeup_end_latency_99%_us_max
     15804           -24.8%      11881 ±  4%  schbench.wakeup_end_latency_99.9%_us_max
     18.48         +1089.1%     219.79 ±  6%  schbench.wakeup_latency_50%_us
      5.37 ± 12%     +49.9       55.26 ± 15%  schbench.wakeup_latency_50%_us_stddev%
      9925            -9.6%       8977        schbench.wakeup_latency_99%_us
     15614 ±  2%     -24.3%      11814 ±  2%  schbench.wakeup_latency_99.9%_us
      2.93 ± 48%      +4.0        6.92 ± 47%  schbench.wakeup_latency_99.9%_us_stddev%
     77431 ± 58%     -56.7%      33563 ± 12%  schbench.wakeup_latency_max_us
      3.09 ± 30%     -91.0%       0.28 ±172%  perf-sched.sch_delay.avg.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__get_user_nocheck_1
      2.79 ± 17%     -75.2%       0.69 ± 63%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      1.68 ± 18%     -80.5%       0.33 ± 89%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      1.66 ± 30%     -84.8%       0.25 ±169%  perf-sched.sch_delay.avg.ms.__cond_resched.pagecache_get_page.shmem_getpage_gfp.shmem_write_begin.generic_perform_write
      4.34 ± 15%     -42.2%       2.51 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.43 ±  2%     -19.2%       1.96 ± 13%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      3.74 ±  4%     -53.4%       1.75 ± 25%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.88 ±  4%     -32.8%       1.27 ± 17%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1.97 ±  4%     -33.1%       1.32 ± 17%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.39 ± 19%     -78.0%       0.31 ± 27%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      9.64 ± 47%     -75.1%       2.39 ± 77%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.alloc_pages_vma.shmem_alloc_page.shmem_alloc_and_acct_page
      8.73 ± 39%     -88.2%       1.03 ±156%  perf-sched.sch_delay.max.ms.__cond_resched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__get_user_nocheck_1
     12.36 ± 32%     -65.7%       4.25 ± 49%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      9.94 ± 23%     -63.7%       3.61 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    573.12 ± 18%     -44.1%     320.39 ± 23%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.10 ± 72%    +187.0%       3.16 ± 45%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.ret_from_fork
    522.48 ± 16%     -45.4%     285.03 ± 29%  perf-sched.sch_delay.max.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
     13.61 ± 23%     -48.0%       7.07 ± 32%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      5.37 ±201%    +574.1%      36.22 ± 14%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      7.72 ±  4%     -53.1%       3.62 ± 25%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      3.87 ±  4%     -32.7%       2.61 ± 17%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      4.05 ±  4%     -33.1%       2.71 ± 17%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    123.85 ±  6%     -40.0%      74.28 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     16.60 ± 31%     -78.3%       3.60 ± 83%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.alloc_pages_vma.shmem_alloc_page.shmem_alloc_and_acct_page
     11020 ±  6%     +78.8%      19703 ± 14%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      8159 ±  3%    +101.3%      16425 ± 11%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      9515 ±  2%     +94.2%      18479 ±  7%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    346229 ±  2%     -12.6%     302764 ±  5%  perf-sched.wait_and_delay.count.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
    113.30 ±  6%     +64.6%     186.50 ±  8%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2107 ±  3%     -13.7%       1817 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
    420.40 ±  4%     +28.1%     538.60 ±  7%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
      1048 ± 16%     -45.4%     572.07 ± 29%  perf-sched.wait_and_delay.max.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      5.37 ±201%    +574.1%      36.22 ± 14%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      3.98 ±  3%     -52.8%       1.88 ± 25%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.99 ±  4%     -32.5%       1.34 ± 16%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.08 ±  4%     -33.1%       1.39 ± 17%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    122.47 ±  6%     -39.6%      73.97 ±  6%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    526.19 ± 16%     -45.4%     287.34 ± 29%  perf-sched.wait_time.max.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
     95.29            -1.4       93.84        perf-profile.calltrace.cycles-pp.worker_thread
      1.66 ±  3%      +0.6        2.29 ±  2%  perf-profile.calltrace.cycles-pp.pthread_mutex_trylock@plt
      2.86 ±  3%      +1.1        3.91 ±  3%  perf-profile.calltrace.cycles-pp.pthread_mutex_trylock
     96.13            -1.1       94.99        perf-profile.children.cycles-pp.worker_thread
      0.25 ±  8%      -0.2        0.10 ± 11%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.19            -0.1        0.04 ± 50%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.19            -0.1        0.04 ± 50%  perf-profile.children.cycles-pp.do_idle
      0.19            -0.1        0.04 ± 50%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.46 ±  4%      -0.1        0.33 ± 10%  perf-profile.children.cycles-pp.update_cfs_group
      0.09 ±  3%      -0.1        0.03 ± 81%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.10 ±  2%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.11            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.07            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.09 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.enqueue_task
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
      0.04 ± 50%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.12 ±  6%      +0.0        0.15 ±  8%  perf-profile.children.cycles-pp.ktime_get
      0.24            +0.0        0.27 ±  3%  perf-profile.children.cycles-pp.__x64_sys_futex
      0.10            +0.0        0.13 ±  7%  perf-profile.children.cycles-pp.futex_wait
      0.12 ±  5%      +0.0        0.15 ±  7%  perf-profile.children.cycles-pp.clockevents_program_event
      0.23            +0.0        0.27 ±  3%  perf-profile.children.cycles-pp.do_futex
      0.29            +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.syscall
      0.08            +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.futex_wait_queue_me
      0.09 ± 11%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.05 ± 34%      +0.1        0.12 ± 11%  perf-profile.children.cycles-pp._raw_spin_lock
      0.14 ±  7%      +0.1        0.21 ± 10%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.2        0.16 ±  8%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.2        0.16 ±  7%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.17 ±  9%  perf-profile.children.cycles-pp.find_busiest_group
      0.08 ±  3%      +0.2        0.26 ±  5%  perf-profile.children.cycles-pp.common_nsleep
      0.08 ±  3%      +0.2        0.26 ±  5%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.08 ±  4%      +0.2        0.26 ±  4%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.08 ±  3%      +0.2        0.26 ±  5%  perf-profile.children.cycles-pp.do_nanosleep
      0.09 ±  5%      +0.2        0.28 ±  4%  perf-profile.children.cycles-pp.clock_nanosleep
      0.05 ±  7%      +0.2        0.26 ±  6%  perf-profile.children.cycles-pp.load_balance
      0.17 ±  3%      +0.2        0.39 ±  5%  perf-profile.children.cycles-pp.__schedule
      0.60            +0.2        0.82 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.59            +0.2        0.82 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
      0.15 ±  2%      +0.2        0.38 ±  5%  perf-profile.children.cycles-pp.schedule
      0.00            +0.3        0.26 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      0.01 ±299%      +0.3        0.27 ±  6%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.01 ±299%      +0.3        0.27 ±  5%  perf-profile.children.cycles-pp.pick_next_task
      0.92 ±  3%      +0.3        1.27 ±  2%  perf-profile.children.cycles-pp.pthread_mutex_trylock@plt
      2.93 ±  3%      +1.1        4.02 ±  3%  perf-profile.children.cycles-pp.pthread_mutex_trylock
     94.45            -1.2       93.21        perf-profile.self.cycles-pp.worker_thread
      0.21 ±  8%      -0.1        0.08 ± 11%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.46 ±  4%      -0.1        0.33 ± 11%  perf-profile.self.cycles-pp.update_cfs_group
      0.04 ± 50%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.08 ±  4%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.pthread_mutex_trylock@plt
      0.11 ±  5%      +0.0        0.15 ±  6%  perf-profile.self.cycles-pp.ktime_get
      0.09 ±  8%      +0.0        0.12 ± 10%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.1        0.09 ± 15%  perf-profile.self.cycles-pp.update_rq_clock
      0.01 ±200%      +0.1        0.11 ± 14%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.2        0.15 ±  7%  perf-profile.self.cycles-pp.update_sg_lb_stats
      2.81 ±  3%      +1.0        3.84 ±  3%  perf-profile.self.cycles-pp.pthread_mutex_trylock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

