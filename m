Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8535950
	for <oe-lkp@lists.linux.dev>; Sun, 22 Mar 2026 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189827; cv=fail; b=BYMgdsp3HEDV/sL2x9yxOvs5UT29no+Oowhnjin7n0h+RyOE73qR25jZHFE5hDmEHDN52r4+tDdrHKOR3fWa8D2PJbYvSn0EfNqPbN+J8oMYyjuKDtIG6fIIsiW8XNmB7Hvf/XxRzE5hFqSuo8xNZ/Gq3qedINkVFR2RvHlLPic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189827; c=relaxed/simple;
	bh=7vsuIrUZFupmy3IQD8M+kVZgGQgLwLoNr14jibKqPpI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lF3M2FyhxhmyM9a/g8GZD+4W71K5JxTDPRKL6w5srLM49iNJhbC9MBDdOYKZc1z8wIZkTGNnli5STcsElCof6dlFB8akSFntqoHfLr7cxdLB/C21/lH+qnaJ7ZjzCkQ1UQC2NOOSkvJgqlBz9BnJ3LMsj3EdME8pF3uSGJDwd74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=af8LPXOo; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="af8LPXOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774189823; x=1805725823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vsuIrUZFupmy3IQD8M+kVZgGQgLwLoNr14jibKqPpI=;
  b=af8LPXOop98t+dPeRlCMf4cQ64Sm4ui82uQ/mQVaFG6Xk3Mqo16xeAtD
   oerbRzywnrST7H/7sEGN4ZcqM9Y7XI6/ekjJ47S6ZRZcXgXA2iqJ7gGIt
   AJSXrIUItK0OcNtyeim0U8noTDC05XJVOG3ntP003gOhh8SPxH1n4Arin
   ufhmtzY1+IgsuAMnLIBYGVdEcVTh1fCzBVf7ZJ3lnUSgNdeu560p+gfy8
   NvvqDz8FDM/DI2pNYpwO1prkfpVendcYRq1h67FBOruYadVMwjwvlt0mN
   c4cAS5kNPEvIdpC4kSratywzzLf1c9X+G03EJkeuNy8gmL24N4FPyEZ9m
   A==;
X-CSE-ConnectionGUID: yyHj2FtQS7q4KF7ZR50jpA==
X-CSE-MsgGUID: yvZcNHnHTAuole6CqZLaUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85521808"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="85521808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:30:22 -0700
X-CSE-ConnectionGUID: 8aUN0la9QRazp5d37N88WA==
X-CSE-MsgGUID: vTbOwo4RQDa2zyltymPsKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="247664487"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 07:30:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 07:30:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 07:30:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 07:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSRJD0XnJ5eIzi4D02QbvP6JVt1AzFC65kHR8hUBzPs7Qoy+Xby4AcDmA85GWKG9cIc+NL6derJ8RBlB6Zp4ICFe9UWyhlfDICZA6vXgImHrLuZucgIoOsFS38eRKYvvkdTApJfZaHEgRBbB9fDF9He2+S/9ZkD9pNkDZGGHenfkEhnn5NnH4Bnji1mw1ld6ClfmaLE2gXxXVC/GBWSE14T9MgFBlTS/EzXOas0wR9S1RmyFeOfa+4vT2Ww+cF9IciHADqWC6XjwfgXPpvbYDKLR8ReKDS4ANgja+C7V9t6GoPK043HM/rZIPpaWZ/dMvxDEQlE1PcKW+q555xsGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbTK3gUssSPIEFfm7VOW1wPTnwZQ8FxhybbcOvS9zME=;
 b=h7VSOIrS2Akq8YpPN5TvkzFKeWAg0ugbPwQREMMoVN6oQVvaNKT6R5wIlYSkTyIbjbsWUunzrb1nocNCmZUJAzKMJ7t2lOgT7eiDmLt5vkm4QPouedzP+U22IbLOpL62Ypg6Bzzg/puMSkrplS77cE31FHUZcPr9iQendO6Dq511rtUM/Efi4uGy1IR+zXXjKSDOCoQ0EYRPmQH8Fuyu9w6ToKjufTJn3mxzaRoMSYveC5TZfYrkGf8O4478YdLhh+CJ7jA4LcJtXlUQDxXAu5cRZXdaUd3xAlAZriRgH9DnqJ3cEzNGqf0DguNw5omzC29HCz5J+ygAg7VCvyy2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.19; Sun, 22 Mar 2026 14:30:15 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 14:30:15 +0000
Date: Sun, 22 Mar 2026 22:30:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Saravana Kannan
	<saravanak@kernel.org>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [paulmckrcu:dev.2026.03.04a] [rcutorture]  569ac6a1d7:
 BUG:KASAN:stack-out-of-bounds_in__list_del_entry
Message-ID: <202603222245.6c112aee-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2769d72e-418b-4ab6-c2f4-08de881f88df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: q3S5UUavak4ByVHUxiJsHN1STiTk2c6rGfQBCpMFH9KAl+VB04d0AjATsrMiOqYJECidUSLKX14IBsadi4VtNmy0vUF9gXAJOGOPNFwiCkW0Pyu5btX6j/btoLglWX+gYszkmKKMZrsSqTtVQ/N1GYquVRrGmo94turBu49jGtx9gGATiyBrj+xDpYQy+W0c+Cc3fljwbY9VPx/HtqseDARSqK7jPQApL/YPspx7Tmd+aONSCdCvtCc8WYd1vS9eTncDQ7GyYIM1MX08HgKyIgfG/5ROQE4793KIx5FPoTWbEtt4fP5h1LiH43NGLUheqDTMX4RLo0XuK0cZjkek1OIKZM/m0LAb8sefHFXUrwIhSAfiSNNh8ColrBMvX1K0yVuI13rwUFXf+4UqQ9Y7TMTBLhQdZoRSrocL115rrvgx5gDjzeXrjCQIyftlFysPmJj3zmGERMoTZkNmLGZBYr9Fk8jVRS1soEXl+9g7nkWbQKvYzFR9jPKBOBgk9Q96THu8xYfw2u7DRGDDi/labo4fKyadXaj3O/UmtrQrmVGaVdihAO849qvxnw8zmV7r5xX8kQJeXSXXK3Mm5LxH2kRaUwtRo2Gv0+o6zXXrCrQEG1HqBVQ5ZyVukW38FNt7uqt8Glb7iscS8BYWpBPvcgvzkgHuhbjwCxoGl7D0w/wfCsx4WRIH8p74j/hppzXm8327LXkuRyr1vzEs4C95pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4SVZafUXWBm4k0XUii8ipgH1cqpe6c2HKvU6vTTlXS9PJ8ppUeR25sgozBou?=
 =?us-ascii?Q?qN9OB7ZfvVBv22NphOWeOYyRoMuHxouEfKfGJlHuZ2wzFuc+0mKqRCqhg8mT?=
 =?us-ascii?Q?vsLlONPS5dvjUdFIeqwb1ty6DNKhSdRvRei++Q5btBFtkwzoayHT6/pFY/YX?=
 =?us-ascii?Q?89dIdhRC4Zb7+heTncbu4Wwn8NHXQkG8ZHw5VQL4TgLrb4wSrLO0L9Xdgfnw?=
 =?us-ascii?Q?ggd/Hwy3e4uHcw3HjmN9fY52wiZdRWKPFzjkbtXUKWyhgIHQXaPQOzWxC0oP?=
 =?us-ascii?Q?XA4Etk5TmHLgGxUy6bhSQt9eXWnb9+NPhfoQJ3Sm3KayhTxMusAHp1fbmRIv?=
 =?us-ascii?Q?XiNYkg3dmHXP/TsEyMGstL9ObBxpWRFwdKtjaxjjqZlPyAuo84ni9ZABaWSv?=
 =?us-ascii?Q?HgA+28IZ2IT6KpvcNtfAHCtMyaJs67+IQGJCNHBGJHnikzLYmehmQe8+eWiK?=
 =?us-ascii?Q?Dl8Svqh/uqIOObzegNvYVwqBNf6zXnGKnKn+JmZ0tW1WL9wIXiih+Uh85/4U?=
 =?us-ascii?Q?JoVAjzQccfAppFnsa7S2Mmt0R8vbEz0h5tF2i8CktGqdw0xcFn0N0GV3wyx7?=
 =?us-ascii?Q?FBE396eu28zhBVzTWSt/R8gByYSZ2f030rqcRonOWehv/5X3lAenmbklMFGl?=
 =?us-ascii?Q?4FFdYXFIDukv9fljwXP7igTjtrecG61/037q3bb0/e2jbMZO2bTmhmi22rxP?=
 =?us-ascii?Q?oHUa3WY2GlMRwzNEF4mpCzk5w/os1O8/1T6D4pYISaSD3qKbzAFQLlVQS2Kz?=
 =?us-ascii?Q?jOoOpKzjfjlhn5MzeRjy+zCp/TtAueT0ATKi4xXYhTUEXR1AEaN7ClARXsS6?=
 =?us-ascii?Q?Yee+42mjZQymbc/FaGhqzwU7J+B3NdsH92vZ5m/37DjWrEU6giEeT9D6QQYS?=
 =?us-ascii?Q?9bDXJsVxDEtqodpAM5lpnXFVJSeEZ22xr9sQz6I6Ms7y9dDomSGRmrUedVsq?=
 =?us-ascii?Q?n51z8bwjUw/C+dvk7tA6IDR1YPgxsa8YbwzJfcCiNLLsR1JoD8KsELjYOYpZ?=
 =?us-ascii?Q?yZ2JhTu28iJQq4nklq7oR+DSaHw9nDfO0o48wO65lbYecyqZ9ccbpy68dpEy?=
 =?us-ascii?Q?qgJQkJw5ug14xUfKz3FB30tx6OlAs63TBbIniKi2I6to7M5fSgmwpqAr6rjB?=
 =?us-ascii?Q?1CHTgABdeydr8+IuLAyoF/ixxAl8gWx7I08OpE4VAfGhlJSOSNeVVunVfEV7?=
 =?us-ascii?Q?9aaJHVh3HIld9Axc+/3wgvebi4faYpW+Y35jgtJsJPzq0Z8vHwUiQAtsyDMs?=
 =?us-ascii?Q?EUFEEWyZmI3iQbWtahUOi+RTLy9MC0ZQ511w4WbgH6zOvxqxtUH01zb7v5Z3?=
 =?us-ascii?Q?DJhzvIOW1NeNBDMIhFk5wASQKWzd2riB4qmJ1oAeKfIhtXg1YkrwkmOCdJJM?=
 =?us-ascii?Q?tGYj0PQEbgr6gEuM8TogCQIpXbtRuCX6bCIyFHPYd52OKZ90TH1iwjm6dNrj?=
 =?us-ascii?Q?GxfbYwXsH+wPi31AwpjoZ5tKvfTwMPl/ptR+d1WxTtV3tNbm6lD5UmoJ76JX?=
 =?us-ascii?Q?Wy36Dh2eiWlnY3rXJMRFk5JGNCeD2+XllaVyLNDN1bSzdgtDOL/vrJYdVf3D?=
 =?us-ascii?Q?g4VhUyo//Mz7HvsYFHiZTNSqNWrjzRev5Asy2MCPCBLLHgCR04TQ8wyOeUcT?=
 =?us-ascii?Q?lsozC1yZa/DB0MAYZeWs9AbtfxQWNPT6vWz9jatV2P5xCjzJDZgWkjp9rIwq?=
 =?us-ascii?Q?wRjS3Fok6+BtjiNMPoBLDfjxpwg4A4lmm9WUKJwkCquGx9AEyaFHn0SZ5HIR?=
 =?us-ascii?Q?NHkw2wUaKg=3D=3D?=
X-Exchange-RoutingPolicyChecked: d9w1e4T4KO02W5OQMV8kCHaaE71f54JfDFYT73tsZZetf3PECGLHpQPF4HdIXkfAUN1kWKUfcmgL1I1ufOAj6mbRN0MzXw7sWglMwCHthvbnvKbf/IG79wQRQcAQ2/dvNaT4U9jZmkUrKV6zNLEHhv/eeQyz/xvMCn+o5qsm8bLE4PQChRjmv5Ys2TiwoP1AeUlpATTLkUeeVmDcAm+S7Qr7WgiHy59cIMPk+zMM7wLFT+0aq0/9BUJGIr7eVwYTqy/968DxsfLsZE/XBEfaTIAc9n0JvOMigemqYHsiAk6VXsL2r+L5hRFids3fldoRjyI85w4j/uHxtRX/nf0jtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2769d72e-418b-4ab6-c2f4-08de881f88df
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 14:30:15.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrgETpVbfBhCX+QxWimME9rpKCyVNg+WIsYJp1l0kY5YgEGSz+YlSvoEhbXGZY+WMJGWR51y074ECMyRGlgVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
X-OriginatorOrg: intel.com


hi, Paul, if the issue is fixed in newer branch, please just ignore. thanks


Hello,

kernel test robot noticed "BUG:KASAN:stack-out-of-bounds_in__list_del_entry" on:

commit: 569ac6a1d7999442e2a381fc4785e1d22699a726 ("rcutorture: Fully test lazy RCU")
https://github.com/paulmckrcu/linux dev.2026.03.04a

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: tasks


config: x86_64-randconfig-161-20250618
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603222245.6c112aee-lkp@intel.com



[  364.629232][   T11] BUG: KASAN: stack-out-of-bounds in __list_del_entry (include/linux/list.h:127 (discriminator 1) include/linux/list.h:223 (discriminator 1))
[  364.630180][   T11] Read of size 8 at addr ffffc90001edfdd8 by task kworker/0:1/11
[  364.631050][   T11]
[  364.631438][   T11] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Tainted: GF               T   7.0.0-rc1-00026-g569ac6a1d799 #1 PREEMPT(lazy)  2d0a7e949e4836aaa2820a29d36737f9b4ef5506
[  364.631476][   T11] Tainted: [F]=FORCED_MODULE, [T]=RANDSTRUCT
[  364.631485][   T11] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  364.631500][   T11] Workqueue:  0x0 (events)
[  364.631526][   T11] Call Trace:
[  364.631534][   T11]  <TASK>
[  364.631543][   T11]  dump_stack_lvl (lib/dump_stack.c:122)
[  364.631573][   T11]  print_address_description+0x6e/0x300
[  364.631599][   T11]  print_report (mm/kasan/report.c:483)
[  364.631618][   T11]  ? kasan_complete_mode_report_info (mm/kasan/report_generic.c:166 (discriminator 1))
[  364.631655][   T11]  ? __list_del_entry (include/linux/list.h:127 (discriminator 1) include/linux/list.h:223 (discriminator 1))
[  364.631684][   T11]  kasan_report (mm/kasan/report.c:597)
[  364.631715][   T11]  ? __list_del_entry (include/linux/list.h:127 (discriminator 1) include/linux/list.h:223 (discriminator 1))
[  364.631744][   T11]  __asan_report_load8_noabort (mm/kasan/report_generic.c:381)
[  364.631779][   T11]  __list_del_entry (include/linux/list.h:127 (discriminator 1) include/linux/list.h:223 (discriminator 1))
[  364.631807][   T11]  list_move_tail (include/linux/list.h:319)
[  364.631834][   T11]  move_linked_works (kernel/workqueue.c:1157)
[  364.631862][   T11]  assign_work (kernel/workqueue.c:1219)
[  364.631889][   T11]  worker_thread (kernel/workqueue.c:3438 (discriminator 1))
[  364.631923][   T11]  ? __sanitizer_cov_trace_pc (kernel/kcov.c:217 (discriminator 1))
[  364.631953][   T11]  ? process_scheduled_works (kernel/workqueue.c:3385)
[  364.631989][   T11]  kthread (kernel/kthread.c:467)
[  364.632024][   T11]  ? kthread_affine_node (kernel/kthread.c:412)
[  364.632058][   T11]  ret_from_fork (arch/x86/kernel/process.c:164)
[  364.632080][   T11]  ? write_comp_data (kernel/kcov.c:246 (discriminator 1))
[  364.632105][   T11]  ? arch_exit_to_user_mode_prepare+0x180/0x180
[  364.632130][   T11]  ? __switch_to (arch/x86/kernel/process_64.c:714)
[  364.632158][   T11]  ? kthread_affine_node (kernel/kthread.c:412)
[  364.632192][   T11]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[  364.632227][   T11]  </TASK>
[  364.632235][   T11]
[  364.661844][   T11] The buggy address belongs to a vmalloc virtual mapping
[  364.662681][   T11] The buggy address belongs to the physical page:
[  364.663447][   T11] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x144e2f
[  364.664574][   T11] flags: 0x2fffc0000000000(node=0|zone=2|lastcpupid=0x3fff)
[  364.665426][   T11] raw: 02fffc0000000000 ffffea0005138bc8 ffffea0005138bc8 0000000000000000
[  364.666438][   T11] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[  364.667466][   T11] page dumped because: kasan: bad access detected
[  364.668240][   T11]
[  364.668604][   T11] Memory state around the buggy address:
[  364.669267][   T11]  ffffc90001edfc80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  364.670217][   T11]  ffffc90001edfd00: 00 00 00 f1 f1 f1 f1 00 00 f3 f3 00 00 00 00 00
[  364.671190][   T11] >ffffc90001edfd80: 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00
[  364.672177][   T11]                                                     ^
[  364.672989][   T11]  ffffc90001edfe00: 00 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00
[  364.673969][   T11]  ffffc90001edfe80: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00 f3
[  364.674932][   T11] ==================================================================
[  364.675950][   T11]  vmalloc memory
[  364.676287][   T11] list_del corruption. next->prev should be ffff88871f432230, but was 0000000041b58ab3. (next=ffffc90001edfdd0)
[  364.677649][   T11] ------------[ cut here ]------------
[  364.678321][   T11] kernel BUG at lib/list_debug.c:65!
[  364.678988][   T11] Oops: invalid opcode: 0000 [#1] SMP KASAN
[  364.679710][   T11] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Tainted: GF   B           T   7.0.0-rc1-00026-g569ac6a1d799 #1 PREEMPT(lazy)  2d0a7e949e4836aaa2820a29d36737f9b4ef5506
[  364.681229][   T11] Tainted: [F]=FORCED_MODULE, [B]=BAD_PAGE, [T]=RANDSTRUCT
[  364.681755][   T11] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  364.684523][   T11] Workqueue:  0x0 (events)
[  364.684967][   T11] RIP: 0010:__list_del_entry_valid_or_report (lib/list_debug.c:65 (discriminator 1))
[  364.685495][   T11] Code: ea 03 48 c1 e0 2a 80 3c 02 00 74 08 4c 89 e7 e8 be d0 64 00 49 8b 55 08 4c 89 e9 48 89 de 48 c7 c7 c0 13 d1 b8 e8 f8 66 fe ff <0f> 0b 5b b0 01 41 5c 41 5d 5d c3 cc cc cc cc cc cc cc cc cc cc cc
All code
========
   0:	ea                   	(bad)
   1:	03 48 c1             	add    -0x3f(%rax),%ecx
   4:	e0 2a                	loopne 0x30
   6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   a:	74 08                	je     0x14
   c:	4c 89 e7             	mov    %r12,%rdi
   f:	e8 be d0 64 00       	call   0x64d0d2
  14:	49 8b 55 08          	mov    0x8(%r13),%rdx
  18:	4c 89 e9             	mov    %r13,%rcx
  1b:	48 89 de             	mov    %rbx,%rsi
  1e:	48 c7 c7 c0 13 d1 b8 	mov    $0xffffffffb8d113c0,%rdi
  25:	e8 f8 66 fe ff       	call   0xfffffffffffe6722
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	5b                   	pop    %rbx
  2d:	b0 01                	mov    $0x1,%al
  2f:	41 5c                	pop    %r12
  31:	41 5d                	pop    %r13
  33:	5d                   	pop    %rbp
  34:	c3                   	ret
  35:	cc                   	int3
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	5b                   	pop    %rbx
   3:	b0 01                	mov    $0x1,%al
   5:	41 5c                	pop    %r12
   7:	41 5d                	pop    %r13
   9:	5d                   	pop    %rbp
   a:	c3                   	ret
   b:	cc                   	int3
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3
[  364.686805][   T11] RSP: 0000:ffffc900000bfd10 EFLAGS: 00210086
[  364.687267][   T11] RAX: 000000000000006d RBX: ffff88871f432230 RCX: 0000000000000000
[  364.687872][   T11] RDX: 000000000000006d RSI: ffff888100993780 RDI: fffff52000017f98
[  364.688473][   T11] RBP: ffffc900000bfd28 R08: 0000000000000000 R09: 0000000000000001
[  364.689088][   T11] R10: 0000000000000000 R11: ffff888100993780 R12: ffffc90001edfdd8
[  364.689688][   T11] R13: ffffc90001edfdd0 R14: ffff88810092aa40 R15: dffffc0000000000
[  364.690292][   T11] FS:  0000000000000000(0000) GS:ffff888764cee000(0000) knlGS:0000000000000000
[  364.690957][   T11] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  364.691447][   T11] CR2: 00000000f6930000 CR3: 00000001314f6000 CR4: 00000000000406b0
[  364.692071][   T11] Call Trace:
[  364.692364][   T11]  <TASK>
[  364.692646][   T11]  __list_del_entry (include/linux/list.h:224)
[  364.693032][   T11]  list_move_tail (include/linux/list.h:319)
[  364.693413][   T11]  move_linked_works (kernel/workqueue.c:1157)
[  364.693821][   T11]  assign_work (kernel/workqueue.c:1219)
[  364.694194][   T11]  worker_thread (kernel/workqueue.c:3438 (discriminator 1))
[  364.694577][   T11]  ? __sanitizer_cov_trace_pc (kernel/kcov.c:217 (discriminator 1))
[  364.695012][   T11]  ? process_scheduled_works (kernel/workqueue.c:3385)
[  364.695453][   T11]  kthread (kernel/kthread.c:467)
[  364.695806][   T11]  ? kthread_affine_node (kernel/kthread.c:412)
[  364.696230][   T11]  ret_from_fork (arch/x86/kernel/process.c:164)
[  364.696611][   T11]  ? write_comp_data (kernel/kcov.c:246 (discriminator 1))
[  364.696998][   T11]  ? arch_exit_to_user_mode_prepare+0x180/0x180
[  364.697507][   T11]  ? __switch_to (arch/x86/kernel/process_64.c:714)
[  364.697890][   T11]  ? kthread_affine_node (kernel/kthread.c:412)
[  364.698427][   T11]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[  364.699047][   T11]  </TASK>
[  364.699491][   T11] Modules linked in: rcutorture(F-) torture(F) ipmi_msghandler(F) input_leds(F) led_class(F) evdev(F) mac_hid(F) parport_pc(F) parport(F)
[  364.706068][   T11] ---[ end trace 0000000000000000 ]---
[  364.706752][   T11] RIP: 0010:__list_del_entry_valid_or_report (lib/list_debug.c:65 (discriminator 1))
[  364.707583][   T11] Code: ea 03 48 c1 e0 2a 80 3c 02 00 74 08 4c 89 e7 e8 be d0 64 00 49 8b 55 08 4c 89 e9 48 89 de 48 c7 c7 c0 13 d1 b8 e8 f8 66 fe ff <0f> 0b 5b b0 01 41 5c 41 5d 5d c3 cc cc cc cc cc cc cc cc cc cc cc
All code
========
   0:	ea                   	(bad)
   1:	03 48 c1             	add    -0x3f(%rax),%ecx
   4:	e0 2a                	loopne 0x30
   6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   a:	74 08                	je     0x14
   c:	4c 89 e7             	mov    %r12,%rdi
   f:	e8 be d0 64 00       	call   0x64d0d2
  14:	49 8b 55 08          	mov    0x8(%r13),%rdx
  18:	4c 89 e9             	mov    %r13,%rcx
  1b:	48 89 de             	mov    %rbx,%rsi
  1e:	48 c7 c7 c0 13 d1 b8 	mov    $0xffffffffb8d113c0,%rdi
  25:	e8 f8 66 fe ff       	call   0xfffffffffffe6722
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	5b                   	pop    %rbx
  2d:	b0 01                	mov    $0x1,%al
  2f:	41 5c                	pop    %r12
  31:	41 5d                	pop    %r13
  33:	5d                   	pop    %rbp
  34:	c3                   	ret
  35:	cc                   	int3
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	5b                   	pop    %rbx
   3:	b0 01                	mov    $0x1,%al
   5:	41 5c                	pop    %r12
   7:	41 5d                	pop    %r13
   9:	5d                   	pop    %rbp
   a:	c3                   	ret
   b:	cc                   	int3
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260322/202603222245.6c112aee-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

