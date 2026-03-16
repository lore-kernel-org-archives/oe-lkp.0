Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19102BEC41
	for <oe-lkp@lists.linux.dev>; Mon, 16 Mar 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668747; cv=fail; b=kVj4gc6EMMsN9hELNRl27zfJGVvbxjAUTMwO997+5W1Esy8iN91EUuafwuPLWgSaTnFiJxcM/a58Rs35xic9i4MKfPI2T6snwoX0ObYpN3WnUMHPyx0/bjRpe2wDHGGTuhquDmFQGLM2wr6r83u2uWL8eHs05AAWKS8OFnRK1TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668747; c=relaxed/simple;
	bh=QuyHcM0wgX5uMC+C0QAAgrnn7lNhyOv5MsimRxyOAy4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PGMftmwbjEnYLyg68Ke5cvEzsY1hqT0ub99WWIA2gev9UAaflszPGkAtiSyjRYSvUgilbWUTLoOCWBJwjIQIZu16ykRh4oJIoBAReqlECWXXS1hngArqGHrEmXCKq/6AHd6RJVFUj2HtZ9fWGj0XvyZVkQW/xkJRjLuULxicfZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx6fth7a; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx6fth7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773668745; x=1805204745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuyHcM0wgX5uMC+C0QAAgrnn7lNhyOv5MsimRxyOAy4=;
  b=bx6fth7agfkEx6GBrxnIvkMuisCp780wqz/tJGprGPKLEevsLAOE8/jO
   a/HvAWZL1HfEhI0y4Prj/SYqHv66+J7KnIxc5m55DV8bPz/CUA2ySOjRa
   4ShEaaLo7/dVmeL+MV0kaAIXGBfp+YI5qGiZyCFyu1E90FDIDxmjU7Cpu
   nzQ5pCU8sq/PddSUl+YzsbEqb1U9UEiPsGkbcg2dvrfgpfmq8T+0gZAAW
   nOGLC+3QIKIA3g4X9YcKatH0qesxHPM0N9q3jmrl6Pkda9OYuKekg+O8m
   JCs6ZmeWp+ApdpYzh8Y53zBzIlo5jZLzCfqlrnRW0yuRIm4joiucg3MgR
   g==;
X-CSE-ConnectionGUID: hfwRlB2jRSunYSTNdN562Q==
X-CSE-MsgGUID: v1u/4mauQ4exvAQVaTjS0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85764148"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85764148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:45:45 -0700
X-CSE-ConnectionGUID: wxAx4sgQQc606HzkW+OBOQ==
X-CSE-MsgGUID: pAAIq380QICAtrI2zKaAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221867803"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:45:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:45:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 06:45:42 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8zm0ku6iRkIZG4oSg1fEioO3U3JgsL2VuVf75BHM594JnCIg/N0ijW9edgXhUFY/1cki0/ULPrJta7GSN+k8RL2JxvddFcS4r4vTBnFJoJYg4CBcSXAPkxAJGZo8E1vGNVJjNT/ATnUOQyQs7S+OjKsrtGhh4Zn98EQX9IMlcg2mDnUF7pnaoN5/9hkhbxTAEUeWfRiLfJnxuwMgIeGywS3BvKC8sKuLCjsvy3MRdTGtvIul7a8hz9qJT2XjPi3OzWclmb8nV3XpCnxFwXJ9LHSn1WzFUbOrONzVlg1NV606ToWdIlpxqseNTv4Qvra5CdajS8wF/oA0DqZoqac2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfBstRD4leLlgp0F2DK/az3z38yJkskfoa+/hGW4URg=;
 b=evXqjP9ehPmSVcRUkRsY1f3zcSZ3HWQRq4eXifjXbg6lrRrF3dEC+hcG18d7kCvliL4J+BfboxRAeb1V+m0DzrsSeMMqtwaR1rXBLdCJHmjbLun2HJ9JloFzXPbLqEkYouW7mSA9h9XD3nyU3jxCgMerlAnzv5awp2Ip2imCFlE1RzpjLIVppsiPybh/OX0a7sURV9RVO6GptieUJK/GutoMRmSbnXjakaA2G1+3m1VIvz7Ag7vU/B9nt48JGKlawz6Kb214LF98CZ6PS/7ESpC2WLsd0OhECIwKc12jm6qDbyupf17WYAqbWV+8BpfBBxCHDJ0QUs43EPEaEurUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 13:45:36 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 13:45:36 +0000
Date: Mon, 16 Mar 2026 21:45:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Oleg Nesterov
	<oleg@redhat.com>, <linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [clone]  4a34da4356:
 BUG:kernel_hang_in_boot_stage
Message-ID: <202603161449.201e2f5f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: ad46274a-69c2-48d1-9db0-08de83624d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: BEfo0yYqlmaRt0IhFzBoBIxEu5MMGOWmHRcdNJkjz7VJ6ZROcc4dXQEIHVjIgPbg8O7IC4IjLUHB8PMDRNZO4uPPBqDroalQxQoeHjNdagfV1afvgcpAKMj/MPE6bi/DVujFQNBG9cbw9RbaAzseeQAFPNNSBvNQ2IYST4UVPC6nuFEFgAtDmYeftBseCxThPoIC86f4Yp64a9VvmwjE21FjXdNHAOACBXTtpgksFUb+p+8CzB14GmR2UxvYUQebpoQXc2SQvf0PCx3G3MY8kdQ+gFacLVQv6a2p82IzWt0vhDVKWhjkhrc3r58kPntWWO2DMmVH+Cz0COqaUGFfnoDlO3cK4/hDZvG0dqz/bFZlwftnKnCcpsVwGEJ8q7DDCNv2Qoui3rCRN6I7fylCri8a2UeMMDYix/PoqI3IgLlOjzhHCKMeDRM4OQZKFh5+roA/GOQp0m6zC91dHU6IMkf6woK7rUtYIHZwIYP46aERflp2YAG1aTJ8SOP2vyUWd52LlD/GtL0Ga8mUjdnQgdw06mmHZzU/ia8Alq552Wqc58b7VJpBJ4Mi2Pd4Ww7TT40e6ng8fiN3gzkAle4MFGAdWXqsLydaBrv+TmJxZu8I8EWBGSK+N64xGjl+DAmSbPZ0FGgfI7Gqbd9/Hfeto5EfpN/VSLvSSwDQUQ8fBadtsksIFVKhOBQSB5WnxRg4hbU6DK0A8t6gW+AtqO+puw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q7xoPVe+tosVbFzYGazN9EB4y8dd8ZeTUPpxrw/HeW2DjuloNEEKCH1kNqKJ?=
 =?us-ascii?Q?dGB8CVLFzkPc80WRYYzJhLo+6tSXoz0CgVsNRc3BvrBGDEA6ByOJQ/zlYRUY?=
 =?us-ascii?Q?JB6TRsgn9akFBj4UPb9KKH4FrXmEJ753fY9RU4x6F1drKlxcwYchJklHi75M?=
 =?us-ascii?Q?iiHQs04A/d6U7fNqHqw32tFcqFcWhegV6Kg+1HVlC2wBlZGZZz6LXEicwt+9?=
 =?us-ascii?Q?izVC9M0EARpoDbJWbAI/VCa65ZG+9SjLopGcZc0aAO1UpIVHt2kFAvWA5qfm?=
 =?us-ascii?Q?8vyBAvzOgK95jh5pw3FxaZizz8ARbWJ0ew9v8rEMgFKtFTgJkSzJJUPV7fGA?=
 =?us-ascii?Q?Hv3EF2cP/Wb8veRXvUu/1ik2zBuShTnOTFJrOUv9t0BT0Smz6y7XO6DTuPh7?=
 =?us-ascii?Q?84xasJlZ22Z7MgefdZuJZs+piMb3BbSZ1LqsEAaPGajpBpv3ce0zt8miu/+X?=
 =?us-ascii?Q?M6Jv2QGi6/nZvVP1xZDrv2uY7p5T8wZmQmmxSO2dTiEqkqMCeyN+xFt8bg+D?=
 =?us-ascii?Q?ePdUr6PINETAoIt5Ee51cvrDiv1kyMv5s6zaH5AZ8usDTsbeWzE5gbdk1ukE?=
 =?us-ascii?Q?m+5cAgq08DRHylWKnmeRzktNBLmY1aPpCHGacnZGiV25feieu0VNGkqFOBXa?=
 =?us-ascii?Q?slQQRsfkzgAbT89sv2B15Cd/K7qCpVf+0i3XPn627WvjgISFD2i+qbZOldS3?=
 =?us-ascii?Q?xJ65TXa7M9kf5kltroTF5Tt7jptPE9J+QRNeGTSFR3ZJfOJOSYGEJ/AtK7RB?=
 =?us-ascii?Q?k4Na1NDAjaryXEOEHivLHWZ51ZPuLN9aaj3AE3YKbL4LGT8wNmLcHpw5qzSr?=
 =?us-ascii?Q?81n7T0Tk0aqZxLysDU489xaLr7mg8GMSBigpwSaAkViZyeGffaZCN2BTM5rK?=
 =?us-ascii?Q?duJ7buU6KXTYeu9CQLD9J6wB3lPrEFrJVTVLU8n/aRLQ7SiAjMSJueF2DrUZ?=
 =?us-ascii?Q?PMIUHWV+ugFXr7aI2frVGj7usnp9bmmkgHveMvsoOVPw8GGySJhc2nvAoiKg?=
 =?us-ascii?Q?DWqXTL8eIC73mr722tWk1OmhParEHRsS2nrkpcBaatRxf9fJmzgmWGRz61FN?=
 =?us-ascii?Q?yFz5Tl3qQXI0nIaNPENHgs9I0wEGV//jdg/YG3AJ4NAYvdWdaQ2kp3S6xqwA?=
 =?us-ascii?Q?uqXHP6sJ5MSBQBFmuA6n1Hd6RyVaNl9JDNVEoNPtMfsi6FmWfo4IPOg4gKwq?=
 =?us-ascii?Q?Xr9Rrx5d3xDUvNHUyNQTuzx1orN7AC0fqIh0Y9KeSLfow0UA5sNzFtD9oRzT?=
 =?us-ascii?Q?9ANqR0jIUo5Ty0+VRz7b/SF/7adY6a9hQ1nQUFErixCDQINM1mhPSHsMUsXL?=
 =?us-ascii?Q?KXrTkcbbFSy1HTs1fj5Po3mIgz9kM6ldOhOXwc3DcQyGiaWFAXJDC6F+rCJ1?=
 =?us-ascii?Q?W+Fn6Ojh1Um15JVw4B4h1gnTxQtMQlZKLspXMafk4XcrJ+YOYasp8UO/5KpV?=
 =?us-ascii?Q?DOVYgjPxyFtOq41Fgcc5IoxvA5PP3G4XvjIjh5NwW3O4pFf3/xYD+NwYXCU4?=
 =?us-ascii?Q?43YL5Ze30mxEvcbi5SyUmA1ztbOHHoOlzC7gGTZudLcI2kB7+Cp/Uj2tEo7B?=
 =?us-ascii?Q?RzQLLRxL+0zQIQd6gs7sqqVk4GUHuDxNoNnCPf1nfonCWVN+5V00TPi5OIUr?=
 =?us-ascii?Q?utU2jDXMrSqrEn9ez7eO+vWvlkP3HiKXWCkWmtl146DN+ZKt4mbkww95YeKw?=
 =?us-ascii?Q?1duXkTV/PRr69nsZgT0HXshxFxtztKyEbnIEBa7+6Ld4T/7yyiG8KFk2MZfb?=
 =?us-ascii?Q?0+K0RqrI3w=3D=3D?=
X-Exchange-RoutingPolicyChecked: J4iWqHDVvhzRFjloEbI9pq7+XWr6A9ph68R5/FzrhcS830LJ4v2oGyufjYexQKUb7sj1YuOyNiLViLbj/2DFrsY19OANCX11YjFmxs6EZfLYbtwZxrt6O8iDb6UOBJKGkwF1aS2ng88B37Zhrpgl5DP1JdTLno2PlyE7T+rrFghxLmM+NYX+RH64oFovmGg82PmExhgvZ+xu35eBIOH0S2k/89pb0hHVzzUPCtPf+IyTs4IF3scYWNX6CKxVK48r0mPEJtxNwi0SwP/14pWR3yK6IkObCDiMwdYyAdHjCsMYQC+3QOSI2NtJqE8YGI0eIM7WEhWji67t89K5GIcVhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad46274a-69c2-48d1-9db0-08de83624d9a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:45:36.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXICZpf613xIo8dMCoUs8pvyEcJPRwM5txWLjA7Kt40CIcyTj2comtMLEm6DB0mVVyeMU9L7MBN04OreJWirtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
X-OriginatorOrg: intel.com



Hello,


we don't have enough knowledge to analyze the connection, but after rebuilding
kernel and rerun tests up to 100 times, the parent keeps clean, 4a34da4356
shows consistent boot issues.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb-i386/boot/yocto-i386-minimal-20190520.cgz/i386-randconfig-2006-20250804/gcc-14/1

ec93d3ee27d535ec 4a34da43569a1e0f7268e7dbd43
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :100        100%         100:100   last_state.booting
           :100         97%          97:100   dmesg.BUG:kernel_hang_in_boot_stage
           :100          3%           3:100   dmesg.BUG:workqueue_lockup-pool
           :100        100%         100:100   dmesg.boot_failures

unfortunately, there is less information in dmesg. below report is just FTI.


kernel test robot noticed "BUG:kernel_hang_in_boot_stage" on:

commit: 4a34da43569a1e0f7268e7dbd435ad1eab5ff1b9 ("clone: add CLONE_NNP")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7]

in testcase: boot

config: i386-randconfig-2006-20250804
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603161449.201e2f5f-lkp@intel.com



[    0.289043][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.290216][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.291271][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.292235][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.293181][    T0] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260316/202603161449.201e2f5f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

