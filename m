Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7B3E0258
	for <oe-lkp@lists.linux.dev>; Wed,  6 May 2026 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054957; cv=fail; b=m/K5jsyQi/uRTzXaVpVyrUtbaRs0Jue5+XKN/bttYluucY8yvaKgKdgkIJabOxSqHY5o7yNtmBPQTtxFW5D2/wJbSiEYrI36h52QBEzqL2dx8jl29r4xMIujJOXsRzuK/mnLGT8pnD1+rLpBhlI/UhgODP4eNunZcy1peYP5JKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054957; c=relaxed/simple;
	bh=SoBdV+j/HD/E+AgcqPgJZuJukgeaOxuEY8lt8hssZx0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tzFLbGDzS9x384+DtJKyqZo7in0A81hKeQKYc7UZ8ym11XistInRY6DEgAuj+riICw1l1VdU06nAQZ4aCTjOoJ32nMmMEBnw6zkAwjWXMn7S/VzAxl+7ijrg4ChaEAU4PV5wM7w68jbPGglDFTbSFLmpHTonmCIO7mMVQ1XxrIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkeMIfGS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkeMIfGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778054956; x=1809590956;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SoBdV+j/HD/E+AgcqPgJZuJukgeaOxuEY8lt8hssZx0=;
  b=lkeMIfGSQ6KB1sR711rRA+BB6VK8BHamXzLb9NRLy7kcxBj9CxV6aMts
   CsyWqfZkg3kxn/0k9sL1KcRzldQeeMdwwSx641rxQtFIKnZ466L0/FgsT
   N/GXjxji77IrV8hfkphbjalLovrJiWDOXfORxn2avPzMCoZBqHavFkE3I
   qboX7C+dFm+zVX0cgnP/VYvsOLprYybRs0NzMH3MK0iA77ehStD5rHLTd
   t6gN2cUkUkmWFE3Fd6SocNImgxPPRSsYmMukh8Jg9fyLCw2El6E5AyNMO
   hPpNwmwPeORAoS+5uZ32RVdzWThmao29R4gOiCgmeekp80ILvBtTcbkzs
   w==;
X-CSE-ConnectionGUID: 2T6iPA3wQGCM86zPs9BJ2Q==
X-CSE-MsgGUID: Pe6SQJsFSMK6cwz0JXTzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89565152"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89565152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:09:15 -0700
X-CSE-ConnectionGUID: 9PSgp+UMS0GydzBwfi830Q==
X-CSE-MsgGUID: vgFeaVFGQI6J9ddK8kr3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259764279"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:09:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:09:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:09:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQRB91J1tm9Ld8+wD1CzHXDwOLhz7jSg2mFLwRKp08WvHR6Qkl89Vs9bZicKIqkQ9Ue1PoQoa+6G1vR0G1jMhPEsf5i3U0fcgGKqa49EoMU4eeEzuVOxKtiQ9rYcrgq+NlVEknjEnhuHTXwyVDwMH0VF2e5gFvxx3XfzTr7o05UvaWgWtKawa/YtvfwdCaIFHle8P7/ZZ/SxVbMGib4A5DFL+R92cepgKHPtjw5PpjVxBZBq00q6gvyZPzrhPeFBixNTO9ebPzhG8yPn81beALneAEKHhARaNAJX/rC2fb2AdqELczSdb6EopZTTQqcuwFnnqClCuSStVVeFqWwbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCDDrzOhGhup37a3Sy5VsMA3XKCgwsi1uBExoie9zew=;
 b=jP6w/ceAUPgtgTneYrPtSh9Yl2H+OfA8r0rYUzc/tJCa+wCzyxRunsrVWLIUqaKkzPQDbWdClRkpz53GL3Y78Rb2TVNLhKs4BWwSsGySfmYM6jveQwg8S/0bqbRqzQNvjPC4WEg91eebQsBqDAOmQiGozrzSpYks2nDO4kOG7FRj++/jG2xg/CdvrczfozxyTFrM7I3c8cHz3FhbLFtDdAA16/4QdcN/nSL224+TTXxfgUqBM5qvFCmyA+1UfQs5VQ0/re1+84+eBr3A3FMizasbFG41tKzOX5zUNjVyOEoXV3nf2bg4oqNACXzHeiIAp1Bh7d2tdaxrN4d6aZP6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:09:10 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:09:10 +0000
Date: Wed, 6 May 2026 16:09:02 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>, Shubhang Kaushik
	<shubhang@os.amperecomputing.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <afr3Hp/CgemmL3eY@xsang-OptiPlex-9020>
References: <202605052050.8156b7e0-lkp@intel.com>
 <20260505152918.GY3126523@noisy.programming.kicks-ass.net>
 <afroZfHCMPrKFD01@xsang-OptiPlex-9020>
 <20260506074858.GB3126523@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506074858.GB3126523@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e3e32b-883f-4c5f-b2f7-08deab46c094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gZHjMruqUdDHnDJeP52YZUIzIIIlNx77V6BSZ4k6auOPhxZ283WTYgg/aCKFVd5SHRD8MhLl4Etbyh8STpQHtyljkzf7nvKBkxpP7M2nQa1IxTLgBuxqfmmk8g3Eh3oVLfhj2Q4RFItpVQolkeKlPnHoNp1Q5ml6hX3JDTUNW3+HxOY5MTVk3h3ele/f/VpSxWNaEH21kRCcIjhaMlBsCYcfMtkVlcZbk97cRMfBHybUGo9fgfVfzr+8i1he2WE1Li+Y8NYk9N43MXkkB2x3PsujvUBuoU7tOV1yowVqCSCbxaBcR/7X/+GmRopLYHqVffXOeW7fi9nzcu/4iI19I031+Qee4OT7XQZun11TM5yPD80148gZKRUoMVD/bJMp5fbb2ZZ6qe1jVSIfhIqrxXS6S1zilRom0edHc6AiG/7Zbj+BJ5TW+KILNN6nJxM6/yIkiVIee2hERAk4OcEqhvNCDP7vOnWdNnmP0d7ll+uXfZWVKbxDXiT9dDC4V7wNADoXl+3K60avXVvf/jJYu/HTqFce55XMnHe56nVan4UmKqb89o6E+8WJm9XNcHfFXs4kw5sIP8SADYxWvdv4M9OUxW75Yf6v/z5S8ksxuiZVhNWStL6vsCnyz609fJTXA9i19HArxw0g1O514IMA5XTD7Hf1CtbEIqKWSaHoQTnpQTIjBDi/zPSEnWUysMUC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?msmNFHCJlMB5HeCd/VGvDo7gU1pW4y6/wOAjpX1u/O5Tay9uoRXc4KWZWLD2?=
 =?us-ascii?Q?HhHBZVMt20HgPILmVWVyfvYMI6AfNaq0c7WcB2qtuFI23rXojbCRi28YSGvT?=
 =?us-ascii?Q?jAZeXpybzsuFifg709GSLIT0vrklmDEuwSvhwp/iC2kBXUPbyVZ5DxMXL2Ub?=
 =?us-ascii?Q?RZqvtC3LowS4ISOVxbHaV/zuSx6OmKN8F72vQNPUoLIRf3TbJbC6thFyM4BL?=
 =?us-ascii?Q?sMIG1V0533/O0nyurZ2liGdkvT61WuX4YV8YIa5aF01s4Phipu71M3BpWLbd?=
 =?us-ascii?Q?D2vzk5cmJs4qMZ2fDLgxJPjt45f3FzxwIc7VHq+IptVuz7JWWZjxmiPynGfO?=
 =?us-ascii?Q?KC/ArA+OgGgweS+/hvqME8fYiP7BgPpJy+HufapwIZXWgGNSq/T9M43SUZOS?=
 =?us-ascii?Q?97FVVPwxTKZVo1rxPL/Q3oShk4A9cWktKEyg6BrhdJxGN5CM03bKOyA7q9qA?=
 =?us-ascii?Q?ZAuK+2Pr3nI+NrL5SvTvToF7BZ1LqunNDjXkV4VKMaUK0Vj2s/LcuvbrofIR?=
 =?us-ascii?Q?p8JHpUcX//t3vxgbm4RyrlVjFjlBe/lzcA674lVPSaokf3qhCcWS0Pg89xrW?=
 =?us-ascii?Q?G4Z6okLukuB5GBfA3CLDPnxDen2ZsfHE/3Sq0SFidfsL6UN9dyljFU7MZsPv?=
 =?us-ascii?Q?UXPJ9mDS2Or5C/2xnnOrbmTXIongQdipID0/S2HrFBRcchhBJQYac49Iwt1Z?=
 =?us-ascii?Q?+80v+9pXJhQTYT0puSec3oyk4VfXiXLvW/5iUq99VK1Ikv6A7Zf8VLqOHaVo?=
 =?us-ascii?Q?qI02p5xrjDMVn7C5A9oGENpxgUhC6nF5j32UMN6cHnN5YrH/p/a0E1UpGqYi?=
 =?us-ascii?Q?ubOBxi43kb5dRGlkLO66f8nLdN25jRtdizEwbpHq5pZRtjgcXPdos6saFrFv?=
 =?us-ascii?Q?LQcpEhyb/KqhLYC0k/R7WorAsvwGyEk/eN/HQYnVsK9ekTvkxBhkS3e/jVal?=
 =?us-ascii?Q?Nr5Xl492691f6LNhbLeP9+R4KsUwsBgRUxpKCDAA0mzRckcmgDw7zUtBlgLm?=
 =?us-ascii?Q?0MLRNAR0NKoUjrKPLfvxqguOVjRCxFuuKZY6wi+fV3KU4DbcQG3mSCFuorWg?=
 =?us-ascii?Q?/U0+EPS+Fcr6oPZ0l5aDQa/nC0nNWVxnwCZ+Of4yPBKa1g3tegSlQqYSkgo4?=
 =?us-ascii?Q?JZdkLqSgXu/vanFnvSJhCxG6RoIb3v08PGs54Ce8QU6VOjBKPh3QNR0mBrEI?=
 =?us-ascii?Q?Sz0jeVy3JfNtv52duk7wAU23d97Ru1MNubTksQFRzBIdf0m8Gf3yQa78n/kV?=
 =?us-ascii?Q?z41HfeFFgjwEh9Au7A/A4GeoHPTPMSNyNquHJQQB/TJfGVAzPRtfOo3mRMVV?=
 =?us-ascii?Q?O3gmYuBAq16VXeRZ+amFKec7eYtvLaztPeoWdwTXf/3/q6CksH4N+EJ0SAnH?=
 =?us-ascii?Q?TNHwZSIcMU8JLof/iI01m+RJdJZYtlwFjpqKbkv43nMPjfiWniuPodgM7/qn?=
 =?us-ascii?Q?Uxy/jYAEXfOpK1sXm/cgVsjH9axMeNp7wB3X3AR0d9c7tVtnQiIjkmpKPhC0?=
 =?us-ascii?Q?P5p8cmrCFrqV9lbw7ajnGS+LK1/l0YofQV6viQRtzb1NgLheCgLbm2KIdj2n?=
 =?us-ascii?Q?QaoizmqWdrIddxw5KAGvIDc0TBT48+hspiJ01ilFqTamE69GwUoa2sOmH/Zc?=
 =?us-ascii?Q?rUqeka6d3jTPgbsBZBJkWfyu6OQqYZdDdnOwaOcY7UZFDMJPA7ndjdRX2BFC?=
 =?us-ascii?Q?fFc8mXTqBZLpg8wBlF471ZNDdbhuwRZbnOrlwBR7yUWFuEXLJC6el1x5fePJ?=
 =?us-ascii?Q?STJjVsJHdA=3D=3D?=
X-Exchange-RoutingPolicyChecked: HEklAPeMJu9x8tjCmyFnpTzttd1MAQGc5PqyzRw7f+MOb7C6z3N8QBtFX3BsY2oPAOSuAsXM8ntOGib7s53wIgEAfXqeu9/Zja6+2pPecF1/Fb9mC/Y9yaNG8ls8g22ty+lx3DzMRxNBQtOFEisOz1XoqWtDxgsgZyf8gnwGqDTvDVLPmZ2JMxOQxMOcAIKy/OUYxf0v3wEaxIcDVv0iWjxp2JrDv25aCUMpG/bVn9v9oflZTwpd+0tIilS41YBXa3ZUcvFN1wR93iKsntC3YfKyBoscLu7lx9OLh5CmjAsoxsA28PMfDdYmWq3n4ZcVy+euDBz0ERZzjMi7gBCpMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e3e32b-883f-4c5f-b2f7-08deab46c094
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:09:10.1735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+u8jOzRMFGLfrxcYCD8S2DbM7k8gctMGZ/v6zhxWztnVTtWxHlygrBBwIwIb2VdNLyu701CvvaOd8lOIV71hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Wed, May 06, 2026 at 09:48:58AM +0200, Peter Zijlstra wrote:
> On Wed, May 06, 2026 at 03:06:13PM +0800, Oliver Sang wrote:
> 
> > we tested upon below commit:
> > 0c0cf14be4909 (tip/sched/urgent) sched/fair: Fix wakeup_preempt_fair() for not waking up task
> > 
> > found most issues are still existing
> 
> Moo :-(
> 
> > =========================================================================================
> > compiler/kconfig/rootfs/sleep/tbox_group/testcase:
> >   gcc-14/i386-randconfig-2006-20250804/yocto-i386-minimal-20190520.cgz/1/vm-snb/boot
> > 
> > 9fe89f022c05d99c 4823725d9d1d9cc5b36647e0cb8 0c0cf14be490975a7431e9d49fc
> > ---------------- --------------------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
> >            |             |             |             |             |
> >            :499         13%          64:499          5%          23:1001  last_state.booting
> >            :499          6%          29:499          3%          13:1001  dmesg.BUG:kernel_hang_in_boot_stage
> >            :499          7%          33:499          2%          10:1001  dmesg.BUG:workqueue_lockup-pool
> >            :499          0%           1:499          0%           1:1001  dmesg.EIP:_raw_spin_unlock_irqrestore
> >            :499          1%           3:499          0%           1:1001  dmesg.EIP:finish_task_switch
> >            :499          0%           1:499          0%            :1001  dmesg.EIP:handle_softirqs
> >            :499          0%           2:499          0%           1:1001  dmesg.EIP:lock_acquire
> >            :499          0%           1:499          0%           2:1001  dmesg.EIP:lock_release
> >            :499          0%           1:499          0%            :1001  dmesg.EIP:on_each_cpu_cond_mask
> >            :499          0%           1:499          0%            :1001  dmesg.EIP:rcu_preempt_deferred_qs_irqrestore
> >            :499          1%           3:499          0%           1:1001  dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
> >            :499          3%          14:499          2%          10:1001  dmesg.INFO:task_blocked_for_more_than#seconds
> > 
> > the config used for 0c0cf14be4909 is attached as config-7.1.0-rc1+
> > one dmesg from 0c0cf14be4909 for dmesg.INFO:task_blocked_for_more_than#seconds
> > is attached as dmesg-0c0cf14be4.decoded.xz
> 
> Do you have a URL for that yocto image? git grep yocto on the lkp repo
> didn't immediately find me one, and I don't appear to have it in my
> .lkp/cache either.

it's here:
https://download.01.org/0day-ci/lkp-qemu/osimage/yocto/yocto-i386-minimal-20190520.cgz

> 
