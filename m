Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17E168B7
	for <oe-lkp@lists.linux.dev>; Mon, 20 May 2024 05:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716182114; cv=fail; b=Hv7G/g/oe14bblbJY4drrde6vwS1jVd0C2YuDuGmdVgTDE9jWs+tq6a7o9wpt5md1FofpwkHE4EAlN/IK1nZ3IMFqbuesU7QvS5wlW095CJB6pSUd63of3TUp0/8jLRK/MQAosOL9IfpJatFdrhtvgobbEd3OPxWLlJy21EyVqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716182114; c=relaxed/simple;
	bh=QF8KYghNF+UexwEDnyYILRCeO7vz7TnpWNFylGk226I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ue4kEEJpmG0e4GSnoPtsNr3mZb9FGdEj5e64IWobeBGxsmm+nG8DuNqx2xa5M2oRFIWzFTUQ2UO/t+nhcDrTs+m3rY3iH1n1KQT+TSASKH0p1Z5UhQCKMkWHuaX7/1oc+EYrlrgK5o87FknzW/ushOD3A9tVRjXtQpSQwGK0iao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9dwqtmM; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9dwqtmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716182112; x=1747718112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QF8KYghNF+UexwEDnyYILRCeO7vz7TnpWNFylGk226I=;
  b=M9dwqtmMwe7CuJZYW3G/D1Ax3KGBp6bu169rFL5GzfUCD62j5je9jTJ5
   vDDmIVYXYAan9StYQzkL+Dgy++DDoLYt0kWg5al1Wqv6tWqogdALfoBXP
   KvNPPV9g/c2QO6U/zDaNmNS1QUgfwNBx+MjiI/PQZBi/a9Ki7gug0sOWd
   AEotoKbxfmHtOWYGgry6PVOOwHVim0g+N1jFSlyHWT630dt0GlHELNd50
   X0resbX3y6vT6hGhXFz0d+sOthnYsnLrrHV0aOxy6SJwHc97ttzBMNxVt
   uC6FSjkRZVS/5JPXPJg2QgJfjQ7WeMXSv0PEYqdijPLtDKNYWU10cMewv
   w==;
X-CSE-ConnectionGUID: mLvnoj3NQ2OXZLBJuVKIDg==
X-CSE-MsgGUID: vFFbDQrqRxmBITi660we8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="29802335"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="29802335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 22:15:11 -0700
X-CSE-ConnectionGUID: yZK0iKrHQfSsmvBzwFPJJQ==
X-CSE-MsgGUID: Oau6ef82TmaFycGB4mAoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32974681"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 May 2024 22:15:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 22:15:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 22:15:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 19 May 2024 22:15:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWKLH1DVE3zblMLL/F/Gb92osDRR+KKiekXnsHeDOW+GyIlcaXO43WJmdQhpVAZm+pFKkl9UK+ZJ0C9QyTnNsyQsWv+joRqebWkAW2AYk4YgS0NystAXv4Dl/9cVH6WadOhh9OO+cnKiOv6qQfvFcHZ1JTUIvQIJeZtOkhPX5a6VjdfXYwQguBjGBRzKCcuFaKudVjbC2WAnVIXnuUJYjrE8Y8T/3Gl50EFJCzza0/S7m9ienvMMDh6u+bKizkPUN6SgfS35vSwtXqFRWNEU+7BHCWwdEiAHvsYlBMf8SWcv31UEDPiuT/mRex4mLiC5IV8IwpjJ9TsDRe8uuiKp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqIj+2vYUssh/Aeim3UABp1YFsc+AJ0tJa+NPm3TYBE=;
 b=W1cBPE5Bpvy0TLzVEUdK7FgyWe1/pwzruY2In5j9GiNndQaKL3gI8h4/E/1/CS0qa2eAc5hjY5HoUmpYIItKhlYfigYdVeA9IeArfzCcdNxN8iQYl9DQVDnJrfad6s8ifrDzvP2E4r2P6289vjhuxS/0lShWpz3k8EuI7wkdGOI/W8XPU75e+511UDLdu9BmLhztNiJXn4Jok6sQI+LVPffYzfdSiiGLPHQyxfI0ca4k1IjpTDNfF9OiF6aiVdr2S3j8NRZ6Sgn9LkbcKrb9j8bE2MpC/gIRHp1T7Z/rPshXQxZrI9oJWq7vOyddJj71bxyqwyp9UmYvYm95soM4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Mon, 20 May
 2024 05:15:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 05:15:07 +0000
Date: Mon, 20 May 2024 13:15:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache_v5_0518]  e6543161a8:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202405201213.ef74ef6c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a83078b-6c0a-41b3-79ef-08dc788bd052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oGd+5JiSKLs1gsq2OK4T7lRnK4zmKjLtdBYp+LZTHC/UXttD2/19wswPYu7J?=
 =?us-ascii?Q?MyxEv5DmaW2o4p9FXG2WPYnnwMonM/zsQDYZrMgqTp5uEoAZ5d4+TNx4J0K/?=
 =?us-ascii?Q?z4GEQXadq4rNTbIADcgTzDPaqHPiBGyoksmxM7aXlX61i/h+vjHF0z+qOat1?=
 =?us-ascii?Q?1nfj55C68kceM5JY63Er6gr/JYbBHB/mbx7QwCwt7dtvrezLefSkkQJ+LVJ/?=
 =?us-ascii?Q?7iQxuztbHwp87juVe7PHB84z5NHn2B8eCwfY1kV/NHRzNQ305TAXAftGw7hr?=
 =?us-ascii?Q?tvsSuA3suJg1vKJ3QptmKExmzJMEcfUgnAesRYxUSfUuoGKYxg5hHqiQBdlx?=
 =?us-ascii?Q?AFOujcddfPQgPJ3bHrI7Fk8Ei2bC0kpzDer3n6Yez9T0PJJ2IfIOV0+mO+lG?=
 =?us-ascii?Q?WkiTXRcIAekjWg3oBIQMmxdQG+TrOeI/BziGKIuserNEuzj36wIEGaCU0pzz?=
 =?us-ascii?Q?1JB5fsPsH1p8SHSLsjlmi0Md+upCg/FLPYlClZaJTVkkaDoE+bHEW9ENntoR?=
 =?us-ascii?Q?R0ftGGQb8/Y3X3a0n+2pAqbByveFL3LBKm6Xl3m7vMWb/mdhfYMz3azOViLc?=
 =?us-ascii?Q?KyN+Ed81tA8NQT0/AfN4kSBcuQCjn3DZkcMGBxYoAgBFXguQE/ODt2Wov6Qn?=
 =?us-ascii?Q?ClnEQ4eulXpjarRjy87++Re72uZiuPhOCF8kL6Fs+QMb1EgHPPBs9Nipvb0D?=
 =?us-ascii?Q?uV2vac1b4e1MxF4Uj5lKnUN3sxLhR9jhyNNX+kGLzXAmgR0MShHoxuYV7zAS?=
 =?us-ascii?Q?XIW9rDwxswrnjO1TpBRpLaUXgp3m6X1b5YTK3kpgTRe7mblil7P8aWwtEjTu?=
 =?us-ascii?Q?EbnlxuRBBLEc408Ttd0cDLNoi3KCS11MXLWoohZf5C8q3rsQ6YMBDQjehnsW?=
 =?us-ascii?Q?n17MZPP7i0uYDwHGmwsq7PP2fEzMsV9+Im1ueFG7BQpOR9ApDE6STRQbRnyF?=
 =?us-ascii?Q?6nsbNlV9Ty1iN5kcqF7LkwfEs8F9VenCn2dVqEHp4CCqbTY8naG9v3g3aymK?=
 =?us-ascii?Q?IEhLXuDqZvFCUO2F9Mcz0TrHiffbEZ1Ut7pybeWLhbI36O6GG8CrWPEmTV8Y?=
 =?us-ascii?Q?vrrU3Zjxt6pjJ5rpoHJgnZEDmSuYHVAc21bcNZxSllcP/tV9sHSyEnL+1BCi?=
 =?us-ascii?Q?WfjWu5TvPXVg9ifAhNjgbKF1xZDs1EvZp1sL6wbnZ3CW/AeaXjNoP/0/EU7d?=
 =?us-ascii?Q?MOvtNNA4A7qM2v85rqdLHFZvlsSwB6DnZvZOdNld97D72ewpRcrohAf0piE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3e12t24FlYkEqXcAlmkv/GfJYktlPcqOojjpoYvg0RELkYrjgQ7MPDEBrRMY?=
 =?us-ascii?Q?eDuw9/6i77cLT5JbDdoNWWzCaLX5NDcGV6SAunx6VgT4SIw5wf6yXWLI60Pf?=
 =?us-ascii?Q?6txYuARZhf+oiUouu0ST7b2+Yx1hdmJsJiqBI+FxtFW7MKHMqv8N2apemqZZ?=
 =?us-ascii?Q?GSOrdm+T6NPQdhZJxDlqDrGdIC2kYyel7Xhd77eq40jkuVpIX5s3RsO8mbog?=
 =?us-ascii?Q?D+kcRM72wvk6bcDkShWA3hXRHplpmqPmD2gJifdNqR8kEjjXiG1qQD0L4fem?=
 =?us-ascii?Q?enZ2t538XrpBI6Wgy7rEIS7j0xOjPIb5l5C5g4yZLkLt5hFfDmoT9U51tKkW?=
 =?us-ascii?Q?RnmOn7Kvv7A8rdMrBuxiNUbxULqzkMA+wo+3vmyy6XlojrmG3uaIeEBXjo4o?=
 =?us-ascii?Q?b7+DHZPCYhj3EAAqcu6MUAw0KbJZ65MV81I9UADbIwxsUJlNEMse5W42KAiv?=
 =?us-ascii?Q?uCjqBBx1jeZolvasyyM58umS2RIWb6em76ZGytP3iQtKPPizIbO9vb9CK2GP?=
 =?us-ascii?Q?u/mPXehU7YSxI05Wb9wdArOjEhNemB747WY6q/8Kwemv5LzWKp1WzqUrHWOu?=
 =?us-ascii?Q?Qvol9mFWvDov1uDO7oo2nats+BgF0hiYae5GyiOEgajTjHy0I6j4OqC4wmKx?=
 =?us-ascii?Q?vE1SR87+kBVBN4fywKY4bHJPz6NgEkRQVGWwM9yMPlvA9Z7HIocubSiDitMV?=
 =?us-ascii?Q?dgdqM5GjXulJnFrPtCQMz9tWUyBojlmzKhSFHRMU9iqQA1MDqsRIwc453oPS?=
 =?us-ascii?Q?FtDeRdoiNMD7gp1kSFpu43rlEbiniXZ1nedbd/b3+knYVu8SxnTN/FvSqhbe?=
 =?us-ascii?Q?nA9dTKBwm0q7vsdFmNylk/UXinZkTWLU1qHcPKQv8H+vXnhWSRgnQi2Emu3i?=
 =?us-ascii?Q?bKmVPnVu8Z2Hmfv4oE/9BFuutiN3KCJ3Uycd4Scf3WLVj7JSWgH3VKsZ6sWH?=
 =?us-ascii?Q?7Mgz6FYnB6dMX2RI4KU9uc/eDe/c5RJuimYEzy6EM3QP+cUeJTYVzuis6hun?=
 =?us-ascii?Q?GlXjEOvqN1WZ1msC9m9dgnbsfoPWCffHranRjFck+z43M80RtaWCMGTrsQjg?=
 =?us-ascii?Q?7yTAMNvij7roQZlSUP//tiTaEsw7Mjc0qZmkGe1uNz6KWejLkdqlmzcep00k?=
 =?us-ascii?Q?nBj6YBTQMZQbrAUIuT/DpQ9QqBDhD2K+5zAZom3ZvSx+MOY84wIlwW7NnVYs?=
 =?us-ascii?Q?lHleBVUz2S5G1p1k/iGKFb0L4sqpMZZsJRm1ockSy86OWrzrsk7BejnT0OFh?=
 =?us-ascii?Q?n1uvuAOKD7z+GhKk6o04g5BPHNGaNa9P5VyB2T/BTM8osXT5TDlgaAPFtUi0?=
 =?us-ascii?Q?BmXfUUOyeFdt3uignbqKXQ57pP3ATbdEvxPikaE/2JSkyXOlV2YvhKgRdpNp?=
 =?us-ascii?Q?SDNKa7YQTGtVBz0z0aiMKg7jdglKitXX3nqeew7vZdaKQB3QscG+RUwuIow/?=
 =?us-ascii?Q?iLCfENdr2M0xWNfZpgOZUkhgzrG8lN8amXPXYtRP16V4N9hqwG8jZFR2aFE2?=
 =?us-ascii?Q?LrNLJyzXxXFOs2GN1dw9ro2qKfF0sfzEFujXEKxs5Tw4KZdqtP1DnHUPDSxe?=
 =?us-ascii?Q?oaxjvOixUIXKRe3NROuyHGLbWuIGL17y3ypnNxIEe/+DWjeWTxHzlIykXesQ?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83078b-6c0a-41b3-79ef-08dc788bd052
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 05:15:07.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlbJ2eeGghoNy+lT4ngsXY2e19T/kQ082dpLNhcDcqC1wKt37IbxlzoBUH3CF7VsNEADTYzUtgcfgznoPIJLbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: e6543161a8d13e28e244803a755a007021b9dea7 ("add alloc_pg api and refactor alloc_va api")
https://github.com/gestionlin/linux.git page_frag_cache_v5_0518

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------+------------+------------+
|                                            | cfd73c13f7 | e6543161a8 |
+--------------------------------------------+------------+------------+
| kernel_BUG_at_arch/x86/mm/physaddr.c       | 0          | 11         |
| Oops:invalid_opcode:#[##]PREEMPT_KASAN_PTI | 0          | 11         |
| RIP:__phys_addr                            | 0          | 11         |
| Kernel_panic-not_syncing:Fatal_exception   | 0          | 11         |
+--------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405201213.ef74ef6c-lkp@intel.com


[   68.422007][    T1] ------------[ cut here ]------------
[   68.422772][    T1] kernel BUG at arch/x86/mm/physaddr.c:28!
[   68.423486][    T1] Oops: invalid opcode: 0000 [#1] PREEMPT KASAN PTI
[   68.424304][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.9.0-08558-ge6543161a8d1 #6
[   68.425342][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 68.426634][ T1] RIP: 0010:__phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.427271][ T1] Code: 80 e1 07 38 c1 7c 95 48 c7 c7 b9 98 d0 86 e8 15 aa 4e 00 eb 87 48 c7 c7 50 6a d1 85 48 89 de 4c 89 f2 e8 b1 53 c7 00 eb 81 90 <0f> 0b 90 0f 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
All code
========
   0:	80 e1 07             	and    $0x7,%cl
   3:	38 c1                	cmp    %al,%cl
   5:	7c 95                	jl     0xffffffffffffff9c
   7:	48 c7 c7 b9 98 d0 86 	mov    $0xffffffff86d098b9,%rdi
   e:	e8 15 aa 4e 00       	call   0x4eaa28
  13:	eb 87                	jmp    0xffffffffffffff9c
  15:	48 c7 c7 50 6a d1 85 	mov    $0xffffffff85d16a50,%rdi
  1c:	48 89 de             	mov    %rbx,%rsi
  1f:	4c 89 f2             	mov    %r14,%rdx
  22:	e8 b1 53 c7 00       	call   0xc753d8
  27:	eb 81                	jmp    0xffffffffffffffaa
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	0f 0b                	ud2
  2f:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  36:	00 00 
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	0f 0b                	ud2
   5:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   c:	00 00 
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[   68.429752][    T1] RSP: 0000:ffff8881036777d8 EFLAGS: 00010206
[   68.430533][    T1] RAX: 1ffffffff0b4f449 RBX: 0000778000001040 RCX: dffffc0000000000
[   68.431472][    T1] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: 0000000000001040
[   68.432465][    T1] RBP: 1ffff92000216c00 R08: ffffffff880ffeaf R09: 1ffffffff101ffd5
[   68.433443][    T1] R10: dffffc0000000000 R11: fffffbfff101ffd6 R12: 0000000000001040
[   68.434425][    T1] R13: ffffc900010b6000 R14: 0000000080001040 R15: dffffc0000000000
[   68.435390][    T1] FS:  0000000000000000(0000) GS:ffffffff85ced000(0000) knlGS:0000000000000000
[   68.436530][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.437360][    T1] CR2: ffff88843ffff000 CR3: 0000000005cd2000 CR4: 00000000000406f0
[   68.438384][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   68.439369][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   68.440345][    T1] Call Trace:
[   68.440763][    T1]  <TASK>
[ 68.441135][ T1] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 68.441676][ T1] ? die (arch/x86/kernel/dumpstack.c:? arch/x86/kernel/dumpstack.c:447) 
[ 68.442147][ T1] ? do_trap (arch/x86/kernel/traps.c:129) 
[ 68.442651][ T1] ? do_error_trap (arch/x86/include/asm/traps.h:? arch/x86/kernel/traps.c:174) 
[ 68.443226][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.443784][ T1] ? do_error_trap (arch/x86/kernel/traps.c:175) 
[ 68.444371][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.444932][ T1] ? handle_invalid_op (arch/x86/kernel/traps.c:212) 
[ 68.445539][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.446095][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:266) 
[ 68.446681][ T1] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 68.447309][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.447888][ T1] e1000_alloc_rx_buffers (include/linux/dma-mapping.h:341) 
[ 68.448614][ T1] e1000_configure (drivers/net/ethernet/intel/e1000/e1000_main.c:?) 
[ 68.449232][ T1] e1000_open (drivers/net/ethernet/intel/e1000/e1000_main.c:?) 
[ 68.449786][ T1] ? notifier_call_chain (kernel/notifier.c:93) 
[ 68.450464][ T1] __dev_open (net/core/dev.c:1472) 
[ 68.450977][ T1] __dev_change_flags (net/core/dev.c:?) 
[ 68.451606][ T1] dev_change_flags (net/core/dev.c:8853) 
[ 68.452200][ T1] ic_open_devs (net/ipv4/ipconfig.c:242) 
[ 68.452795][ T1] ip_auto_config (net/ipv4/ipconfig.c:1515) 
[ 68.453384][ T1] do_one_initcall (init/main.c:1248) 
[ 68.453989][ T1] ? __pfx_ip_auto_config (net/ipv4/ipconfig.c:1477) 
[ 68.454627][ T1] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
[ 68.455221][ T1] ? kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68) 
[ 68.455829][ T1] ? __kasan_kmalloc (mm/kasan/common.c:391) 
[ 68.456459][ T1] ? __kmalloc (include/linux/kasan.h:211 mm/slub.c:4039 mm/slub.c:4052) 
[ 68.457011][ T1] ? do_initcalls (init/main.c:1320) 
[ 68.457583][ T1] ? kernel_init_freeable (init/main.c:1563) 
[ 68.458261][ T1] ? kernel_init (init/main.c:1450) 
[ 68.458801][ T1] ? ret_from_fork (arch/x86/kernel/process.c:153) 
[ 68.459370][ T1] ? ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[ 68.459985][ T1] ? irqentry_exit (kernel/entry/common.c:358) 
[ 68.460560][ T1] ? __pfx_ignore_unknown_bootoption (init/main.c:1294) 
[ 68.461314][ T1] ? strlen (lib/string.c:402) 
[ 68.461809][ T1] ? parameq (kernel/params.c:99) 
[ 68.462351][ T1] ? __pfx_ignore_unknown_bootoption (init/main.c:1294) 
[ 68.463122][ T1] ? parse_args (kernel/params.c:153) 
[ 68.463710][ T1] do_initcall_level (init/main.c:1309) 
[ 68.464363][ T1] do_initcalls (init/main.c:1323) 
[ 68.464906][ T1] kernel_init_freeable (init/main.c:1563) 
[ 68.465531][ T1] ? __pfx_kernel_init (init/main.c:1440) 
[ 68.466144][ T1] kernel_init (init/main.c:1450) 
[ 68.466669][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 68.467207][ T1] ? __pfx_kernel_init (init/main.c:1440) 
[ 68.467817][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   68.468435][    T1]  </TASK>
[   68.468812][    T1] Modules linked in:
[   68.469534][    T1] ---[ end trace 0000000000000000 ]---
[ 68.470223][ T1] RIP: 0010:__phys_addr (arch/x86/mm/physaddr.c:28) 
[ 68.470834][ T1] Code: 80 e1 07 38 c1 7c 95 48 c7 c7 b9 98 d0 86 e8 15 aa 4e 00 eb 87 48 c7 c7 50 6a d1 85 48 89 de 4c 89 f2 e8 b1 53 c7 00 eb 81 90 <0f> 0b 90 0f 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90
All code
========
   0:	80 e1 07             	and    $0x7,%cl
   3:	38 c1                	cmp    %al,%cl
   5:	7c 95                	jl     0xffffffffffffff9c
   7:	48 c7 c7 b9 98 d0 86 	mov    $0xffffffff86d098b9,%rdi
   e:	e8 15 aa 4e 00       	call   0x4eaa28
  13:	eb 87                	jmp    0xffffffffffffff9c
  15:	48 c7 c7 50 6a d1 85 	mov    $0xffffffff85d16a50,%rdi
  1c:	48 89 de             	mov    %rbx,%rsi
  1f:	4c 89 f2             	mov    %r14,%rdx
  22:	e8 b1 53 c7 00       	call   0xc753d8
  27:	eb 81                	jmp    0xffffffffffffffaa
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	0f 0b                	ud2
  2f:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  36:	00 00 
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	0f 0b                	ud2
   5:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   c:	00 00 
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240520/202405201213.ef74ef6c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

