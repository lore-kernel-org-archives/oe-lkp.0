Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC562F56
	for <oe-lkp@lists.linux.dev>; Wed, 12 Nov 2025 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762916138; cv=fail; b=CDzors447S7oSLgmg5oPWtWKXaamhN2v009ZcYZR2NEgTE9V/DjGLEpEODsy0AawGN67Zle1gfNLmGo7ZWx5I5Gb/ZvXONLarEP944D0oI2VtPUIJgwuUa21oMuA5tx7KDrktWGtI7BVCbREyDxreYWMKXlma1LZEFzx2ZqA41I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762916138; c=relaxed/simple;
	bh=m4VyaqwqB7U/flAOjtXdmCeuulfugGjBCZU/3NjIf8c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pfa4PmvFYBe0W1mRXWV3YKZ20v9usubdFnvqAkz6gUnZnl+M72AhEVeEl6zeqW4IyrJJ5+DXlJkvHykX/qIU5jUzj3u2Bq2wrpp+IaGrgHChsGOAbu8KeK3Fsq75OTYODt/glrHPLudSEnldzK3+hb8FxXEzTr2NDH2YeXbDBmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFaxkO6o; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFaxkO6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762916136; x=1794452136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4VyaqwqB7U/flAOjtXdmCeuulfugGjBCZU/3NjIf8c=;
  b=VFaxkO6otaYmYFCNx3rv2gJrwGHLdTXGwnc/iRgwsA1gU45W2Ql32QGU
   U5YO3o3a+eJNQv7aJOyCGoT18MUHjlOfzbNS5eWXF44r/ORf0lGSbB69M
   6T7y5+KoarjgeDc9qekuekHHO58TZxhnuJ3Iwf4zcGyNpgpt1g+KUM/ht
   vA7UjOK7B/diyXZFw4ZlTG3qqO1jeNK1gdqvL9pV6AFAVb/j0OZMhi6MQ
   8mSspdkauqPy5TWQp0NgWSYoluySRU2J8G6iO8ZM6C4x0jQvsWxjMFkjG
   UjZKt3VAxBi9E1ck9hrY/lfsVNdCc5bAf+93RCXrCu21hwpmj42u/WuvX
   Q==;
X-CSE-ConnectionGUID: yxS4NVdUSASMlupkzXH6jg==
X-CSE-MsgGUID: 4lDRoV3NQC6FmxzA649SVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75591111"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="xz'341?scan'341,208,341";a="75591111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 18:55:35 -0800
X-CSE-ConnectionGUID: JkeXwr0dR+2AWb9S5mumow==
X-CSE-MsgGUID: bMaYW9meQEq+CSnC51SO+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="xz'341?scan'341,208,341";a="193214185"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 18:55:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 18:55:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 18:55:33 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 18:55:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOFeb+IViZ+JmCsZumAEGGHSKV/0boOFAJW4A/x14A+tf5EuVYjG5L8cDATTcOw+OEjYAYscsrsYVDYEFro80VESPUs2mR48ePgx99WHJFb8PNxeZPCdsr5oH9zmgIWe7vMGFeNjjSbS/5Iow1qgKXzxXbqJ63xmsI7FqJMZYaZ/NE0ACJx4cCjn5T6Qf6aQ0LXAG2fbyppSKwpN7inDXlpKJZ60zprKRwAg90czeK5srglzQBSAx26kTUPEBGVOpiLCoSW4RdWNVPlXFz03eHdkIIo9qk8jupGu5om8t1JYdjaaxBe/uaTsw0PIShpzAdJE8FzZuV9ZzdUA60hsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRnmLnahX63jJ5SkPvHmyVYRz3fo4kqaNX9YZ3ZdJzg=;
 b=E5lfP5DuX153grGf8XgdKZRKBxxVvZc0YV99yFwBm9zeT/MvFwK939EgTs9SiH+1P5t0KNVEzK22iLgVTJ9ER8okXTvrmfuk8wXqyULoxSWjkBwba7YjVvSeFI3+APOjqsmNbat9f4hbeciMlZg1PdqvZTjdENEzoeeWQ5jrhQuKuEG3RUPSmzmL+4YPD12aqDJyGfCvb/dC+q1HSremd/Bo0ydwjeIaVece8GSBSrLhMP7cQeNmuaMkkjmiKTEEg2fMdf9CfW4lMVhdKfz81j/GC6XTBv0LIxgbJhahW7dY2SKhYlnnkiW75LAUxWHaOf++ByKWc5nm8iw67PT+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 02:55:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 02:55:29 +0000
Date: Wed, 12 Nov 2025 10:55:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-drm-fix] [drm]  e2a703d652: WARNING:suspicious_RCU_usage
Message-ID: <202511111514.ecbaaa39-lkp@intel.com>
Content-Type: multipart/mixed; boundary="bVVCK/4fzbXlK8oX"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a9aac9-98dd-401a-a64e-08de2196f052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uX8aFskHOGqedw6vKTVtQ2oiX0yTdtZ6XZs2b0LUgq+frT+06KffufNoggxE?=
 =?us-ascii?Q?909HtRdUwAuc8DI2G8AoTT0Wum3KSO+CvbRT/lm7d1hnD8Cl+lb//5mtKOKL?=
 =?us-ascii?Q?buR4m2Z3qa28qfsua0+CWtM8nhy6y8/EaQMGrubny+BCbL72zfv+3Wr/6ZSb?=
 =?us-ascii?Q?HbG5j8VZ627GmEz88Qx8EeRBRUmbz8G71mfyl7L/uOEGGIOzD8F71IoK7akM?=
 =?us-ascii?Q?ZB873igzbhzqJCXND7jNhBVzB6L44wegHvW+GTNRhIfZw4IyDVGC5dCmQTBP?=
 =?us-ascii?Q?dYdiuRRpwkUW5fPzuwl/adGTVg0G0PvvQfn+tngk74yhc9b/AsrFgtRI62mQ?=
 =?us-ascii?Q?tZByoQ265DWbnIYIC+D/MAmoxamwLd9j5zPKj9g19TLC6iw8RHjJVfWFRvJY?=
 =?us-ascii?Q?lDaO0xw2MvhjVxqebwlxEKb6idOnkax8VIqt0cnZgbB7YsGDvQeM38+kltcp?=
 =?us-ascii?Q?8UnswZg5osyBIWe7xA0KZ48KhPsxGnoDyUi6SmhKYg/4WOLSYt/1htNJG+Cr?=
 =?us-ascii?Q?qkVWzYpMB1BHCM2APdPVPTT5DqL2MocW46Sb36uvQ8M9G0iF7Q5lt9LSzE06?=
 =?us-ascii?Q?z8XqQ8MT7eAIfif2IRja5lf+zhe42rJ7T4i5g6Rmoq5AKK+F5KA8LtvMTRmS?=
 =?us-ascii?Q?kFXmk82lfWGWcWJXVKolYQHxVeUSW6sKZjkx3ok7Pww0/mrcOB2LWhcVVySA?=
 =?us-ascii?Q?5DqQG1QwWlKS4a89AGEx4jLZz56iG4fW+j49rhvOe5/R7QhevlmoWs73bZFS?=
 =?us-ascii?Q?/YYX8OXH2y/8u51DvOmqH1exnR7fsKhHmxIiXZlFmTMZtUdaWqH5xY4Wl0HT?=
 =?us-ascii?Q?MJHAbiIZKmpgIP7M/k/TDMQXEALMOZirbW1j0E4oU8/z+tmHELjc+aOXg52A?=
 =?us-ascii?Q?hqPib5YUKkr9lrMu54eR7FSMRjjYlz0eF34LtlYKz+BUnickmszVECrauxGb?=
 =?us-ascii?Q?qLbwTMq7F6GCIFy5HvZCbLK27qTz6zKCVE58S9X1+E+OAC+bmiHkFglMcIi1?=
 =?us-ascii?Q?2lCUzUSamGJwHIzYl4dmcpaRmfkXh0eGTJxocjMFStOInMb9WvRZ+J9tuPPz?=
 =?us-ascii?Q?QyVOtPNxHJ5bldAYuoXMTpGUaVAjTLFJJrNKSxXomAmwQG5JRnKXt9q71HuU?=
 =?us-ascii?Q?cJTbFLOGUAwK83HotPdfuFN/LXpGOPhw33gIA0uOYRQ/hvqQyneNmWva0NyN?=
 =?us-ascii?Q?7Ze3danEUO72G0HuvjR7/ZlPQuxpmU5J6P0CwGBMzDosTsqVqIr0N9bXqS3X?=
 =?us-ascii?Q?77AWrb/DAfs/XZRHbYIZ5o7ysQnSeZBfsQAgEaljpaYjnb0fL6RQDWT0/cP5?=
 =?us-ascii?Q?6ElrYuW+8vvhwdMiv5fWfCQkDZpODkdv6CoYmCjKfkoM7XA76rZAQnxQJHN3?=
 =?us-ascii?Q?kBwT8n3nwm87JC54KulCYMtE51+C7aDwq982+kqMm5aW9W6+stgn5tRzzZsl?=
 =?us-ascii?Q?9A9KdAFJMGk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mu54+nbz2Do3D71xjslf1P8PvRc7E5g/o3sxyb7jCrI91IPDXhd2BNiTDqhi?=
 =?us-ascii?Q?8dqLfhk/iCvuVbXNQRxHtA5vUGhOPwsaDc9UtuMvDRAzlrkyY+z6xpWFY59y?=
 =?us-ascii?Q?NIFYjVeGaRi8/l22yg5az1y6IoljVO1Ho1TYKFYJ8bEQgZ3+8s3t9Ficjoyg?=
 =?us-ascii?Q?Nc6vBYWAQbWMoyZtU2zXPRRwgGT92hSGhJQfb1jkBECDFyulHrgh4oi/l/7G?=
 =?us-ascii?Q?PfLFaWaF6cWfIOKa7h3cntyIXVWJRMFwSrRJnskufdSoxOqoFBmiUnp0wmUr?=
 =?us-ascii?Q?Er7bduMPPATgU5Mw7u0mG5UNoJhMP/Vn47rkp9t//S8t/83Uxea7CuOl23Ol?=
 =?us-ascii?Q?/bOzuI0EtYRODrEM2jCYd3IXdZ5A5kmwB7d37wbTe9BUD4xVGFoHmWK3hORp?=
 =?us-ascii?Q?eqLduJyWMzTt8OFr1mIVHIrmIQu9bkPQuUoi+PuEitPDZ7DUASKjaPBvJE9V?=
 =?us-ascii?Q?4AypgmQnhWXIRuQWVFx5umDkjnG1qMo7oWsDwoWFOodbLYLYrhpcemwxXmhL?=
 =?us-ascii?Q?UbBoRyAf0OPUANHcWslbP+qeehXt226pgDcKsC+UG/N70DWtxncx6wUNwED2?=
 =?us-ascii?Q?tQfLegib8MJNhjOxtt7FxsOQXhZ57wO7SEs6rPYEiUSgEqZEYH7RYCiHJRRv?=
 =?us-ascii?Q?X9i47PRTRbNG9bsXVQF27O37oh6crKR2yS6Xi13OS3ojINNe/P3oojYcsluX?=
 =?us-ascii?Q?QEuOOeYkHtMATq+DksHSpLgJAukWjcfgWQ+wki80qsnUYkV8gKljP6JMpuX6?=
 =?us-ascii?Q?ishNkfLcTLnCTQi4liAoDvhdJiLAOVe3D18+TLwLodi1kaX2ui2y5LPCFJT/?=
 =?us-ascii?Q?EOFSKx2GaaTU4OmbVLGZOKhEiwFKY+69B8EavA2LQOah/ZhE5QHRdErdZ7l4?=
 =?us-ascii?Q?Y3zCsmeQpcP/seopcol4lmWKa4GYQp5TOxmrvD76FSw1Lsq6B+2k2XRLnUSt?=
 =?us-ascii?Q?jN1dCnoSzMWM68AaHD5TVWLTZQZ3qRJCu9H0UthgkNjg3Eh5cGJH2Wc2U6IR?=
 =?us-ascii?Q?Vh0uWd7ioukQncxILHgWpf/+g4T/gBSgSULvqxvMujMirZn7d2rOlivvGrhj?=
 =?us-ascii?Q?51H6LY3jJY8k3sDSnvrn2Eh9VrrqBv1lfHCjdHVis62qdVnMs36BD4g8UNkK?=
 =?us-ascii?Q?k2nFp2cwawPD5zPf0vkXIe8oJ0sLWsDi7KpUQwtyiwt4wdwqY6ANuUp10Wqk?=
 =?us-ascii?Q?YkOy2ZKLcvah25xOdQKcOhqrRX48r4K3NO5zzrjmPzsUDiozhv/CIECPNM6m?=
 =?us-ascii?Q?D+C8xNPH1rerVGsVeds7OeJNim2rGiRV+EXwE5GKBbMg+Qfq2DjhnmvBi7aT?=
 =?us-ascii?Q?LrrijaeUwXbV+rmM2Ba1eknnRpIbVyZzi25xqja339Ud5XqOo+HegGiuCubC?=
 =?us-ascii?Q?xEIj0K2aUEKFNIQS1sDYO+NSDgRePD9pOR/B+AgNJFnLTfjZhRRcpBnGvFbI?=
 =?us-ascii?Q?ce8uBkVd53WAEhN7s766RWwO5GIVL8e9AK+ja8hhNKDEyIVNaJBxPLaoOp1V?=
 =?us-ascii?Q?tUpmv+NTIHq7tR1Bbe5XSLLY5l3W++bxUbcafqBl62Ay+QOcHfPaflIZUCsR?=
 =?us-ascii?Q?mXOeNUnfOds5wdAldkyn2gS6sTjyuwv7i1gNkAV0LxqgHUkqx3Eg4XPg76ca?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a9aac9-98dd-401a-a64e-08de2196f052
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 02:55:29.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ixmo+ZnXxO42BI2mEmK9Jyg79P6KFr/1d3WMkV5LmZBeGDx2lZwSHCRFjWkW8+xghcEurc4/kNa2xbKVxSQLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
X-OriginatorOrg: intel.com

--bVVCK/4fzbXlK8oX
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi, Jim,

this report is just FYI.

for parent commit
f8241f5267959 drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
we actuall observe seemingly more severe issues, that crash early.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/runtime/group/nr_groups:
  vm-snb/trinity/yocto-i386-minimal-20190520.cgz/i386-randconfig-015-20251110/clang-20/300s/group-03/5

f8241f526795939e e2a703d65295b8bce9b8a7e4663
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6         -100%            :6     dmesg.BUG:kernel_NULL_pointer_dereference,address
          6:6         -100%            :6     dmesg.EIP:ddebug_condense_sites
          6:6         -100%            :6     dmesg.Kernel_panic-not_syncing:Fatal_exception
          6:6         -100%            :6     dmesg.Oops
           :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage
           :6          100%           6:6     dmesg.lib/maple_tree.c:#suspicious_rcu_dereference_check()usage

one dmesg is attached as dmesg-f8241f5267.xz

[    0.405069][    T1] Performance Events: unsupported CPU family 6 model 42 no PMU driver, software events only.
[    0.406705][    T1] signal: max sigframe size: 1760
[    0.407679][    T1] BUG: kernel NULL pointer dereference, address: 00000004
[    0.408501][    T1] #PF: supervisor read access in kernel mode
[    0.409175][    T1] #PF: error_code(0x0000) - not-present page
[    0.409860][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53 
[    0.410580][    T1] Oops: Oops: 0000 [#1] PTI
[    0.411093][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00058-gf8241f526795 #1 PREEMPTLAZY 
[    0.411135][    T1] EIP: ddebug_condense_sites+0x76/0x4c0
[    0.411135][    T1] Code: 89 d3 89 d7 eb 22 90 90 90 90 90 90 90 90 90 90 90 90 90 90 ff 45 e0 89 fa 83 c7 18 83 c3 18 3b 7d e8 0f 83 83 00 00 00 8b 02 <8b> 70 04 8b 07 3b 70 04 74 e5 8d 4b e8 83 3d f0 3f 94 8c 03 7d 2d
[    0.411135][    T1] EAX: 00000000 EBX: 8c0bcb14 ECX: 811a5c7c EDX: 8c0bcb14
[    0.411135][    T1] ESI: 8c1e3d04 EDI: 8c0bcb14 EBP: 811a5c28 ESP: 811a5c00
[    0.411135][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010287
[    0.411135][    T1] CR0: 80050033 CR2: 00000004 CR3: 0c1f8000 CR4: 000406b0
[    0.411135][    T1] Call Trace:
[    0.411135][    T1]  ? up_write+0xc6/0x180
[    0.411135][    T1]  dynamic_debug_init+0xaa/0x210
[    0.411135][    T1]  ? _raw_spin_unlock_irqrestore+0x58/0x94
[    0.411135][    T1]  ? add_device_randomness+0x57/0x80
[    0.411135][    T1]  ? trace_preempt_on+0xf/0x50
[    0.411135][    T1]  ? _raw_spin_unlock_irqrestore+0x58/0x94
[    0.411135][    T1]  ? preempt_count_sub+0x7b/0xe0
[    0.411135][    T1]  do_one_initcall+0xb0/0x2c0
[    0.411135][    T1]  ? dyndbg_setup+0x8/0x8
[    0.411135][    T1]  ? kvm_sched_clock_read+0xd/0x1c
[    0.411135][    T1]  ? sched_clock_noinstr+0x8/0xc
[    0.411135][    T1]  ? local_clock_noinstr+0x38/0x120
[    0.411135][    T1]  ? kvm_sched_clock_read+0xd/0x1c
[    0.411135][    T1]  ? sched_clock_noinstr+0x8/0xc
[    0.411135][    T1]  ? kvm_sched_clock_read+0xd/0x1c
[    0.411135][    T1]  ? local_clock_noinstr+0x38/0x120
[    0.411135][    T1]  ? kvm_sched_clock_read+0xd/0x1c
[    0.411135][    T1]  ? sched_clock_noinstr+0x8/0xc
[    0.411135][    T1]  ? local_clock_noinstr+0x38/0x120
[    0.411135][    T1]  ? __lock_acquire+0x564/0x2a40
[    0.411135][    T1]  ? kvm_sched_clock_read+0xd/0x1c
[    0.411135][    T1]  ? sched_clock_noinstr+0x8/0xc
[    0.411135][    T1]  ? local_clock_noinstr+0x38/0x120
[    0.411135][    T1]  ? __this_cpu_preempt_check+0xf/0x17
[    0.411135][    T1]  ? _raw_spin_unlock+0x27/0x40
[    0.411135][    T1]  ? __register_sysctl_table+0x5bc/0x600
[    0.411135][    T1]  ? trace_preempt_on+0xf/0x50
[    0.411135][    T1]  ? _raw_spin_unlock+0x27/0x40
[    0.411135][    T1]  ? preempt_count_sub+0x7b/0xe0
[    0.411135][    T1]  ? _raw_spin_unlock+0x27/0x40
[    0.411135][    T1]  ? __register_sysctl_table+0x5bc/0x600
[    0.411135][    T1]  ? rest_init+0xfc/0xfc
[    0.411135][    T1]  do_pre_smp_initcalls+0x2a/0x6c
[    0.411135][    T1]  ? rest_init+0xfc/0xfc
[    0.411135][    T1]  kernel_init_freeable+0x52/0xcc
[    0.411135][    T1]  kernel_init+0x17/0x128
[    0.411135][    T1]  ret_from_fork+0x137/0x1e0
[    0.411135][    T1]  ? rest_init+0xfc/0xfc
[    0.411135][    T1]  ret_from_fork_asm+0x12/0x18
[    0.411135][    T1]  entry_INT80_32+0x107/0x107
[    0.411135][    T1] Modules linked in:
[    0.411135][    T1] CR2: 0000000000000004
[    0.411135][    T1] ---[ end trace 0000000000000000 ]---
[    0.411135][    T1] EIP: ddebug_condense_sites+0x76/0x4c0
[    0.411135][    T1] Code: 89 d3 89 d7 eb 22 90 90 90 90 90 90 90 90 90 90 90 90 90 90 ff 45 e0 89 fa 83 c7 18 83 c3 18 3b 7d e8 0f 83 83 00 00 00 8b 02 <8b> 70 04 8b 07 3b 70 04 74 e5 8d 4b e8 83 3d f0 3f 94 8c 03 7d 2d
[    0.411135][    T1] EAX: 00000000 EBX: 8c0bcb14 ECX: 811a5c7c EDX: 8c0bcb14
[    0.411135][    T1] ESI: 8c1e3d04 EDI: 8c0bcb14 EBP: 811a5c28 ESP: 811a5c00
[    0.411135][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010287
[    0.411135][    T1] CR0: 80050033 CR2: 00000004 CR3: 0c1f8000 CR4: 000406b0
[    0.411135][    T1] Kernel panic - not syncing: Fatal exception


we don't have enough knowledge if e2a703d652 is just the fix of above issue.
since now kernel will not crash but show "WARNING:suspicious_RCU_usage" still
in very early time, we just make out this report FYI what we observed in our
tests.



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: e2a703d65295b8bce9b8a7e4663c409fa25bd194 ("drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper")
https://github.com/jimc/linux.git dd-drm-fix

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



config: i386-randconfig-015-20251110
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511111514.ecbaaa39-lkp@intel.com


[    0.526141][    T1] WARNING: suspicious RCU usage
[    0.527180][    T1] 6.17.0-00059-ge2a703d65295 #1 Not tainted
[    0.528409][    T1] -----------------------------
[    0.529086][    T1] lib/maple_tree.c:844 suspicious rcu_dereference_check() usage!
[    0.530839][    T1]
[    0.530839][    T1] other info that might help us debug this:
[    0.530839][    T1]
[    0.533092][    T1]
[    0.533092][    T1] rcu_scheduler_active = 2, debug_locks = 1
[    0.534816][    T1] no locks held by swapper/0/1.
[    0.535841][    T1]
[    0.535841][    T1] stack backtrace:
[    0.537088][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00059-ge2a703d65295 #1 PREEMPTLAZY
[    0.539384][    T1] Call Trace:
[    0.540260][    T1]  __dump_stack (lib/dump_stack.c:95)
[    0.541066][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 3))
[    0.541066][    T1]  dump_stack (lib/dump_stack.c:129)
[    0.541066][    T1]  lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877)
[    0.541066][    T1]  mas_start (lib/maple_tree.c:?)
[    0.541066][    T1]  mas_find (lib/maple_tree.c:284 lib/maple_tree.c:3630 lib/maple_tree.c:4939 lib/maple_tree.c:6018 lib/maple_tree.c:6058)
[    0.541066][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1972 (discriminator 1))
[    0.541066][    T1]  ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
[    0.541066][    T1]  do_one_initcall (init/main.c:1269)
[    0.541066][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1931)
[    0.541066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.541066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.541066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.541066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.541066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.541066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.541066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.541066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.541066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.541066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.541066][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
[    0.541066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.541066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.541066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.541066][    T1]  ? __this_cpu_preempt_check (lib/smp_processor_id.c:65)
[    0.541066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.541066][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    0.541066][    T1]  ? trace_preempt_on (kernel/trace/trace_preemptirq.c:122)
[    0.541066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.541066][    T1]  ? preempt_count_sub (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:5864 (discriminator 1))
[    0.541066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.541066][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    0.541066][    T1]  ? rest_init (init/main.c:1461)
[    0.541066][    T1]  do_pre_smp_initcalls (init/main.c:1374 (discriminator 2))
[    0.541066][    T1]  ? rest_init (init/main.c:1461)
[    0.541066][    T1]  kernel_init_freeable (init/main.c:1569)
[    0.541066][    T1]  kernel_init (init/main.c:1471)
[    0.541066][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[    0.541066][    T1]  ? rest_init (init/main.c:1461)
[    0.541066][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.541066][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    0.541090][    T1]
[    0.541618][    T1] =============================
[    0.542722][    T1] WARNING: suspicious RCU usage
[    0.543814][    T1] 6.17.0-00059-ge2a703d65295 #1 Not tainted
[    0.545085][    T1] -----------------------------
[    0.546167][    T1] lib/maple_tree.c:800 suspicious rcu_dereference_check() usage!
[    0.547824][    T1]
[    0.547824][    T1] other info that might help us debug this:
[    0.547824][    T1]
[    0.549088][    T1]
[    0.549088][    T1] rcu_scheduler_active = 2, debug_locks = 1
[    0.550905][    T1] no locks held by swapper/0/1.
[    0.553083][    T1]
[    0.553083][    T1] stack backtrace:
[    0.554374][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00059-ge2a703d65295 #1 PREEMPTLAZY
[    0.556518][    T1] Call Trace:
[    0.557066][    T1]  __dump_stack (lib/dump_stack.c:95)
[    0.557066][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 3))
[    0.557066][    T1]  dump_stack (lib/dump_stack.c:129)
[    0.557066][    T1]  lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877)
[    0.557066][    T1]  mtree_range_walk (lib/maple_tree.c:?)
[    0.557066][    T1]  mas_find (lib/maple_tree.c:279 lib/maple_tree.c:4940 lib/maple_tree.c:6018 lib/maple_tree.c:6058)
[    0.557066][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1972 (discriminator 1))
[    0.557066][    T1]  ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
[    0.557066][    T1]  do_one_initcall (init/main.c:1269)
[    0.557066][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1931)
[    0.557066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.557066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.557066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.557066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.557066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.557066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.557066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.557066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.557066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.557066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.557066][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
[    0.557066][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.557066][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271)
[    0.557066][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:272 kernel/sched/clock.c:309)
[    0.557066][    T1]  ? __this_cpu_preempt_check (lib/smp_processor_id.c:65)
[    0.557066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.557066][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    0.557066][    T1]  ? trace_preempt_on (kernel/trace/trace_preemptirq.c:122)
[    0.557066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.557066][    T1]  ? preempt_count_sub (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:5864 (discriminator 1))
[    0.557066][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.557066][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:1399)
[    0.557066][    T1]  ? rest_init (init/main.c:1461)
[    0.557066][    T1]  do_pre_smp_initcalls (init/main.c:1374 (discriminator 2))
[    0.557066][    T1]  ? rest_init (init/main.c:1461)
[    0.557066][    T1]  kernel_init_freeable (init/main.c:1569)
[    0.557066][    T1]  kernel_init (init/main.c:1471)
[    0.557066][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[    0.557066][    T1]  ? rest_init (init/main.c:1461)
[    0.557066][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.557066][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251111/202511111514.ecbaaa39-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--bVVCK/4fzbXlK8oX
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg-f8241f5267.xz"
Content-Transfer-Encoding: base64

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
UvYAAcUrpZcBAMwzk6+xxGf7AgAAAAAEWVo=

--bVVCK/4fzbXlK8oX--
