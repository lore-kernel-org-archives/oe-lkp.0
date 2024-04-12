Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707E548E7
	for <oe-lkp@lists.linux.dev>; Fri, 12 Apr 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712912167; cv=fail; b=gkqRxEbH1D7+5C4mshR3YC3uUUzYb2njhujTZMr7abLXKrbojd0n8GSacx3JMGpHQIpOO8vZJszC3rMsj5RPXUUSgl5P3DoP27KsJzxV3N9yZ03PdaYGHa6SutJ3Sc8sYlxR5omuI5228hi/1ay84MAgs2ndKwXh6XFbayeGqcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712912167; c=relaxed/simple;
	bh=fbSe8UMhWTwF/X9y5GYaRAlQH6MLtrPIjse9afoSLjI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=q57qzk30FdzHyzB2wY9eUCKI9ie+Y5gIJJB+0Vlfv/HDgZSnHdJ+xEfnuI5+pdVMquZCptAfmR6m9yAQloMszN+wwCPxD+PdpJKvtdnSELhd2Wo8QB8x7OVFOX6pmq7Q5NpXkB0aOQrDu8NliTBpMGw1LjIj7grkunopyrAbJxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gymQ0HTS; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gymQ0HTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712912165; x=1744448165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbSe8UMhWTwF/X9y5GYaRAlQH6MLtrPIjse9afoSLjI=;
  b=gymQ0HTS2pxEEDL93G6q5NsJtDWepo61wJDXAozp3SLwFzuE9a3x8hcT
   7ugqE8yiopcyxBBXaVK+ST78iZtXz49alB+vc+Lrpxmr4lUoOH2be9lw8
   9TebMuDY4xVtPqwPSmzijtq1Wgd170qb/EadUVqQ2HLJcb7+E4E32L4BN
   YP54qSVtcn1K9/HLHRVj/oF0X54IOJiGo5i4JLSIPjgXmZduvhIYMO6eT
   ne4yLLWrRGniUQ+h0v+SZLvmqwKIaCQDVrq1NYfpgnl1rjGEZHaprUmPm
   T3Bc/Dg7DyuW37KOAlxzXndRjbZFxWUGJQeEnpy+vXanuLU4do2PqUhra
   A==;
X-CSE-ConnectionGUID: 3bsoWPT+Q2qvwBrQuvIrdw==
X-CSE-MsgGUID: ApiuV3VfTcCLM1ugTi11Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18917812"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="18917812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 01:56:05 -0700
X-CSE-ConnectionGUID: Ez0ZqrkhStqjo9MUMGuOBQ==
X-CSE-MsgGUID: 3UNsYxZGQoG8VoApwL+KwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25965549"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Apr 2024 01:56:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 01:56:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 01:56:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 01:56:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 01:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpN6tGRmJEnqOJryVZhXNL5Cz84F3SF7TPN0RpCojETv1RH0YIm/UupNPDTnqlgqCqBbCC5t79nlH5vIHzmJ/znN0WYYA0fLbEsoavEE1vkTjoU/GmJKBYiuaZE4dv3q8X5S2DKDf37RL9K2dAPrDi4ta1hq/8uSYqmiJbybsJE+BfxTSZ+A3wiaNJ7YNU6Nc6KFf41kC4NiUgWI0I4HWeH5lzcSkH5L7TqyvWzeJV/kXlOXB9RpbREO+PeZPl1HHu71NYXk+nqqXxQkxk7FDhItmQuvU847GJBPdbcxUAKdpckKjVmZRBQoCH2vDY4ZRnHAxR9ThzkB0RM5/eaqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecNAJ4l8DvNqyY8R910KOq3cQBi/vbvdyr3u+901kpo=;
 b=JHPzvdkbJEK5T9AcYp8ns86kmWOlJyUFQCKNdQiaXhw7WhXaHxKbeBVeifPT3zUg4m2JtmYcmSc+CXAMHcDeAA510vec6Axs+h3PVy/3aOioi2SK511aRQGcqbh7UHgeVAwE9pqaHZZQkEYaEAdKxTh8XRn44P4gHqyD86WT0c/5f3dyzNYNsXQ0DvNujIRwSJ712IyvjrSEPdytJYL6CxTYFYN6E4K8bu80NwYDFo02le2nXnGlHQJYOZjNydv3UYSTTvPW35HlOWUadXVqm3G7qFqJUdfyfjdKJRtaqsCMZqOPFEGlKCrcTDuGZD1Ksjojm32vdHX4ra4AGHxswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 08:55:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 08:55:56 +0000
Date: Fri, 12 Apr 2024 16:55:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:execmem/v4+x86-rox] [x86/module]  11bf65858a:
 kernel_BUG_at_arch/x86/kernel/alternative.c
Message-ID: <202404121651.1abc867e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e86c11-a3f0-427a-ea5e-08dc5ace5dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G0uSIrwypxPtjKDVQCVXtnWjhF1x+hkCdHSA2hKf1cZANkwKta98Pd4tCBdYuuRr1QJKMC801qz4CFGIMqyWQIReSfQL860/YKEZU3NzDGkN9jSxfaxV0wjPgsKJCQOrK4ZO9FQa+Jtit/OMiay4Na/n5sNVRgmlrnSATbeJtrtMZCvbRSr3a6Cbw1WjAk2zVIV5qqhH77z+GGkEI74FR6RFttlnQKlTNChRYKHS8K2Px7sMvFTobm1cqLMcVsm5AMmZTLNFMTv/4JXV3vfifw7weYuexYS3rV3z+2I6ypqgj8cLPJL9mcu5SvgKEit7egw+C9Av7s2P2JaiRA/H+pl5oKsoZt9sH3L1+vMVXdYFU9oQHLcIMUuBxK6pPzjv0j6ZWxDnsxtP4a76Gx61XUngyxs3VrzZnpGoueh5Jov06AgjwHgZVq0FbkmTA8DUlcge6iCMe3Zgd5On4/LTRFtR4Vge60So3fyhDPaY0LAwOMi8pWc1HtBbLr7j84BYZLyPZY1Hnyn/tc0F78n+NpX7CNaBj9nnZelDY44skuCL89F1AOH54CHdVmxz/dWDj8TwtUoHVMdz9TVpjG5R8/NdnqHNhC36EwEm/LY8G6KE6lMhB8NmU+sAeZMaAyeE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcpHyVEr7HdoCKebmtyotZcsR/RNQkAa4rndWGPqkEve+AcxyW3fxybJuEUz?=
 =?us-ascii?Q?BX6jyE5A4nln8jFmfzIGpVKXZOwaD/yOziE+PO+XymxXMs/mwVmvDdeBte6X?=
 =?us-ascii?Q?nHwg+pbfece1eVRGaaIZz96PYzmWK01Hj2x5pi/z1KAzKDd1rGQuxCCZ/6/R?=
 =?us-ascii?Q?SURUkfBDQHOKpz3zwFkfyGSuAl8ffYZOlfzQaYYSiGzVK673/cdnzMptfy2J?=
 =?us-ascii?Q?6yPhxVTiiziG9yasHfEBwIdVCe50zSX6QfLhAjomt3vEhX+wuXhxqtEf8eKA?=
 =?us-ascii?Q?ESb2NnPwaQxdyMTrweMfBHvUi1BBmyz39zxM28E260n8sb5+0A3lypOoj70s?=
 =?us-ascii?Q?OF9Wr9+JIROCO7QzYXdAja4FtxoKTidkq2Zj1DqbI0RTKwY7KOn75GIDmgMa?=
 =?us-ascii?Q?+KLae8OSAIYGIeMGiUlMhjS/d73+N0etYeDjz6anFKDKecI/uQdknbwKm4t2?=
 =?us-ascii?Q?FyZcRh3YzgLwwP6Lad8eALEtGWJXI2doNtDIWyWPp/BDTL/0H7Dvx2d3rTDr?=
 =?us-ascii?Q?iuI5XZrbQRUT//2L6w/9t4i+w4dVgS0tGNoCglETUVstsjxiegcd9/Xsfem/?=
 =?us-ascii?Q?ntKMRt8Ahtx/uTkwkgArXOevN5+MQWZ7lWePm5QmV04ycVdNZ7yAfLzI1yOn?=
 =?us-ascii?Q?ECbOIKq6g/UjSUN4nmKQ1K+tnrcx2c1FFZ+MVmn1qXVetle+nGm2aVsnsVL+?=
 =?us-ascii?Q?CDtz292QXTpIatBY1A0ZysYO+M3cggJvueJ2wnSllNOGPuRgWO9yQXD/uHez?=
 =?us-ascii?Q?0UVi8r5AbXQzOusz+hc07s6zsKdWiaWHRw/R1x+CfJyyuhQZAJqm77tgKZWD?=
 =?us-ascii?Q?VSzMnXxkCa0mFfTMvR4xH7ZwfxJO3Y+CjptYc5uyTQA2uHj4pF/JIcHVanTd?=
 =?us-ascii?Q?002PPbvuch86+IrdrjlgNdSE7ce5qLRCYq3BZdeFS0ncu/y2YHXVRQ8oVQMb?=
 =?us-ascii?Q?8Xu6p5YZnD5P3g98fl7tV09LdujGfsm9aDR4FPw2zXIARxTQJjRy1DCfcO/U?=
 =?us-ascii?Q?qMt+b0V63ejlnWl3WxhoLPAFxQtLMSyLXpWMDluWLxkled5AL03rGUrb4OBC?=
 =?us-ascii?Q?A/PV+B4Q7b6u4CzMfHtmohS6BqwItVOlcoG34Nnvf+Fm9WDLPnGfM7K7ecQB?=
 =?us-ascii?Q?zE7dnheXZJFnlqgGfv5BMtdvq0cQixQvt/3mvqZ5Gl8+hS0CoBA16Qb5qhKZ?=
 =?us-ascii?Q?zvCRHUarMuo3GIfq3UVLUR0zY8uh29O9pWvaJQMdPNOO0AXKOiYUR5PmhY7K?=
 =?us-ascii?Q?acHy/UWDIARFbs6PxvdEa0tsTTtktDhjhvUokN7iu+UJeRt6eyfjVvJb7WtQ?=
 =?us-ascii?Q?33JBX0G0bnox6qCyptN+hfPKJJgQKUfy1MbTcYpM43zoO0J1gdmVgc+svhPx?=
 =?us-ascii?Q?898wVAtCwE/fJJtzcIRebeCPQoTfj6PeGc8/GEc9GaxuQPJnEkOhXryt52Y+?=
 =?us-ascii?Q?wgfaoK82eVHVcOuxHWpjv3aJUFw/JSjQkPmJEU84W0z5G4JMxBveAUA0+Dsj?=
 =?us-ascii?Q?t773fYmPQcN19MnxmBlEgNSC/1O7tn2Ad9OnQlRdCnxqwNx7YUC2eXFZ3GXr?=
 =?us-ascii?Q?QAhbmdW+lAHEF1+T0RP3qOK0uZ2zWC1KrlNseIayrFokLha4RFEr2DmH6Fwt?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e86c11-a3f0-427a-ea5e-08dc5ace5dea
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 08:55:56.8078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9rhYJRIC54T/DK2jCCq/HHlVRXSIL/i3BEq5yIsRRLrRxgvDE5Zwg+RWSuiGlJ/L9qzQEZT0j5RCLlPtM31Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/kernel/alternative.c" on:

commit: 11bf65858a2a6495668af60f9ff2843f2938718c ("x86/module: enable ROX caches for module text")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | e5e8f8cc14 | 11bf65858a |
+---------------------------------------------+------------+------------+
| boot_successes                              | 12         | 0          |
| boot_failures                               | 0          | 13         |
| kernel_BUG_at_arch/x86/kernel/alternative.c | 0          | 13         |
| invalid_opcode:#[##]                        | 0          | 13         |
| RIP:apply_alternatives                      | 0          | 13         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 13         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404121651.1abc867e-oliver.sang@intel.com


[    8.362824][  T106] ------------[ cut here ]------------

[    8.365312][  T106] kernel BUG at arch/x86/kernel/alternative.c:428!
[    8.365321][  T106] invalid opcode: 0000 [#1] SMP PTI
[    8.365324][  T106] CPU: 1 PID: 106 Comm: modprobe Not tainted 6.9.0-rc2-00022-g11bf65858a2a #1
[    8.365326][  T106] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 8.365327][ T106] RIP: 0010:apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365335][ T106] Code: b6 02 e9 74 fe ff ff 48 8b 04 24 e9 61 ff ff ff 48 c7 c7 a0 de 33 b0 e8 09 76 16 00 0f 0b 48 c7 c7 f8 de 33 b0 e8 fb 75 16 00 <0f> 0b e8 74 ca ff 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f
All code
========
   0:	b6 02                	mov    $0x2,%dh
   2:	e9 74 fe ff ff       	jmpq   0xfffffffffffffe7b
   7:	48 8b 04 24          	mov    (%rsp),%rax
   b:	e9 61 ff ff ff       	jmpq   0xffffffffffffff71
  10:	48 c7 c7 a0 de 33 b0 	mov    $0xffffffffb033dea0,%rdi
  17:	e8 09 76 16 00       	callq  0x167625
  1c:	0f 0b                	ud2    
  1e:	48 c7 c7 f8 de 33 b0 	mov    $0xffffffffb033def8,%rdi
  25:	e8 fb 75 16 00       	callq  0x167625
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e8 74 ca ff 00       	callq  0xffcaa5
  31:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  38:	00 00 00 00 
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	2e                   	cs
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e8 74 ca ff 00       	callq  0xffca7b
   7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
   e:	00 00 00 00 
  12:	66                   	data16
  13:	66                   	data16
  14:	2e                   	cs
  15:	0f                   	.byte 0xf
[    8.365337][  T106] RSP: 0018:ffffaa5ec050fb30 EFLAGS: 00210246
[    8.365340][  T106] RAX: 0000000000000049 RBX: ffffffffc0609075 RCX: 0000000000000000
[    8.365342][  T106] RDX: 0000000000000000 RSI: ffff9f102fd20b00 RDI: ffff9f102fd20b00
[    8.365343][  T106] RBP: ffffffffc0542768 R08: 0000000000000000 R09: 0000000000000003
[    8.365344][  T106] R10: ffffaa5ec050f9d8 R11: ffffffffb09d56a8 R12: ffffffffc06454b4
[    8.365346][  T106] R13: ffffaa5ec050fb52 R14: ffffaa5ec0b734b4 R15: ffffffffc0503f40
[    8.365350][  T106] FS:  0000000000000000(0000) GS:ffff9f102fd00000(0063) knlGS:00000000f7a7a700
[    8.365352][  T106] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[    8.365353][  T106] CR2: 00000000f7ae1d20 CR3: 000000042fde4000 CR4: 00000000000406f0
[    8.365355][  T106] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    8.365356][  T106] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    8.365357][  T106] Call Trace:
[    8.365373][  T106]  <TASK>
[ 8.365375][ T106] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 8.365379][ T106] ? do_trap (arch/x86/kernel/traps.c:114 arch/x86/kernel/traps.c:155) 
[ 8.365382][ T106] ? apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365385][ T106] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:176) 
[ 8.365386][ T106] ? apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365389][ T106] ? exc_invalid_op (arch/x86/kernel/traps.c:267) 
[ 8.365393][ T106] ? apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365396][ T106] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 8.365401][ T106] ? apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365403][ T106] ? insn_get_opcode (arch/x86/lib/insn.c:297 (discriminator 1)) 
[ 8.365407][ T106] module_finalize (arch/x86/kernel/module.c:289) 
[ 8.365415][ T106] ? add_kallsyms (kernel/module/kallsyms.c:217) 
[ 8.365420][ T106] post_relocation (kernel/module/main.c:2482) 
[ 8.365423][ T106] load_module (kernel/module/main.c:2990) 
[ 8.365425][ T106] init_module_from_file (kernel/module/main.c:3215) 
[ 8.365428][ T106] idempotent_init_module (include/linux/spinlock.h:351 kernel/module/main.c:3178 kernel/module/main.c:3232) 
[ 8.365431][ T106] __ia32_sys_finit_module (include/linux/file.h:47 kernel/module/main.c:3254 kernel/module/main.c:3236 kernel/module/main.c:3236) 
[ 8.365434][ T106] __do_fast_syscall_32 (arch/x86/entry/common.c:165 (discriminator 1) arch/x86/entry/common.c:321 (discriminator 1)) 
[ 8.365437][ T106] do_fast_syscall_32 (arch/x86/entry/common.c:346 (discriminator 1)) 
[ 8.365439][ T106] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:121) 
[    8.365442][  T106] RIP: 0023:0xf7f8c589
[ 8.365445][ T106] Code: 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
All code
========
   0:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter 
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq   
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	retq   
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
[    8.365447][  T106] RSP: 002b:00000000ffa8431c EFLAGS: 00200206 ORIG_RAX: 000000000000015e
[    8.365449][  T106] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000056585214
[    8.365450][  T106] RDX: 0000000000000000 RSI: 00000000580f2170 RDI: 00000000580f20c0
[    8.365451][  T106] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[    8.365451][  T106] R10: 0000000000000000 R11: 0000000000200206 R12: 0000000000000000
[    8.365452][  T106] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    8.365454][  T106]  </TASK>
[    8.365454][  T106] Modules linked in: ip_tables
[    8.365458][  T106] ---[ end trace 0000000000000000 ]---
[ 8.365459][ T106] RIP: 0010:apply_alternatives (arch/x86/kernel/alternative.c:428 arch/x86/kernel/alternative.c:530) 
[ 8.365462][ T106] Code: b6 02 e9 74 fe ff ff 48 8b 04 24 e9 61 ff ff ff 48 c7 c7 a0 de 33 b0 e8 09 76 16 00 0f 0b 48 c7 c7 f8 de 33 b0 e8 fb 75 16 00 <0f> 0b e8 74 ca ff 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f
All code
========
   0:	b6 02                	mov    $0x2,%dh
   2:	e9 74 fe ff ff       	jmpq   0xfffffffffffffe7b
   7:	48 8b 04 24          	mov    (%rsp),%rax
   b:	e9 61 ff ff ff       	jmpq   0xffffffffffffff71
  10:	48 c7 c7 a0 de 33 b0 	mov    $0xffffffffb033dea0,%rdi
  17:	e8 09 76 16 00       	callq  0x167625
  1c:	0f 0b                	ud2    
  1e:	48 c7 c7 f8 de 33 b0 	mov    $0xffffffffb033def8,%rdi
  25:	e8 fb 75 16 00       	callq  0x167625
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e8 74 ca ff 00       	callq  0xffcaa5
  31:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  38:	00 00 00 00 
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	2e                   	cs
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e8 74 ca ff 00       	callq  0xffca7b
   7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
   e:	00 00 00 00 
  12:	66                   	data16
  13:	66                   	data16
  14:	2e                   	cs
  15:	0f                   	.byte 0xf


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240412/202404121651.1abc867e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

