Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13A33C52A
	for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773124539; cv=fail; b=BtvVO6U6gCzbO5DPoo8RJeWz8GgGgZF7Ea6HYBeWOqgYCKeoXL/7eVUTkI3nTvANZ/dAEc2Xs5ypXjmvi50lzA+7YR2VXKPqIxpNsd3haE//fW9X79RNvBY1a4c065oxQCv9ih/INuRrVi78hiZR4ngtD95CzCx9Q6lvpM7ShxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773124539; c=relaxed/simple;
	bh=RNgSVfg8EtlaVY1Z33hGsw55nkgYf5w8+AXyNrIqqcY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qk7BAE5rdebssojOmFBRCBbUI0de7MsMwfjiiplujXgF4d1aH6Jflac/10wg+E0fcynY3MYLGEfvCqjNPojnRxFodYTaZV3XyfP77SBJqf08hi34fENblQYuqothZv5Z2ufczDVjA4hT8LuFZF/0ZUAw3c2WovHPC8ZLvuqri8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOkaMA+a; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOkaMA+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773124537; x=1804660537;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=RNgSVfg8EtlaVY1Z33hGsw55nkgYf5w8+AXyNrIqqcY=;
  b=fOkaMA+aOiQh4YS1RjofIxrjZw5MQNP6k9RHluckMOVnZrFkBMJKOSZu
   D1SOc3bxwsEJ7dodUqKqSFi1SHmghVwPUtKdceIS0uFm7656kakJ3wRR4
   V42Y8RtM830l3T7OVFILFp0xX0Y1ohg7b6mAhCRmBglJM+qTUAdHBqCtg
   p3IClQt7fSdmx9FYt09SsvjV3mFnvgEjS+zmtlO/pv+HzuQwjuxGnJgMO
   SrIeLV+Hlrs01+4efzvIrH461uF7GqEfAyzSSdIC9jaibQzB8sxs0Knu7
   UgxwO97zAF2J9MK0ak0onfoFE1SOxvyCdcoF/xWJrCEl6rOREQqHIGz4c
   w==;
X-CSE-ConnectionGUID: UUMGsu2fR8qBXFta49y8eg==
X-CSE-MsgGUID: jAMZQGe2RIaw46tqjiP/mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74240435"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74240435"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:35:36 -0700
X-CSE-ConnectionGUID: CvbQSquSQ1OZVinaFBL9qA==
X-CSE-MsgGUID: CTkh69iRTcSfSpGTrbraOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="245823946"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:35:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:35:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 23:35:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kL2XMoE23F5H1cvpSH8Aou7j0N5ASXIvrO/CKbU0YRk4bQURYTA+OkS6UcTvQci1yyBLGQaohY9WbMYbnSUKfD5SB/X4adh++GkUqKdx80rApHZvn/IIT7IJNig4rTLX5YqHelQOKTVdct3Avcz7wPNTP9Khqm+s6ktEfY/qEHMb9+Ww/lhuW3jh2f7SZD70tsVsEJiRsonhwWEOCSLCEkcL62p+7w0qJkB2j2HuwVblLogsqdPUCxDsbiRKSLQ6f0SYob3HbIqeCkDgMbfqh3lQpw9W6/C2e+Rjux17qEFTJIw/EGvNDnUxQC3gZjg/Bt9K+jYnG6qgHXfhZZjUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aV/PA60ES2on/3Aawh1gLznftK4Jk8jVROsy2KfElg=;
 b=H5XQkC4uSRj2qEaL782hVlsjtrdWI6lOiPiUdHWxeV3h7r9lFk+PP0B/xT/PgFVveHjGG4wGCi9CUDo1qNKUfDAXRBYRxcqFhO5QJkhDoZUOUUVmdbjoWf39cbooCVmzJ+qydPFHwuI3a5tUaD3BZffctbM6bKfSeWcfghItgDGoFdZ0PrvzBzlReitE6Mv5w3/k6WMWf24oSV3JebFCKPJUWm7pd1nbcx32GTyZbLB4MIrj3Kv6JtEoPbS0FT43lYwCh9PGF6kIsbQXXWGAD6Xhvit/ASoABwY4NoDRvExslfD2lQnc+aDB+dO4CDe41z1WCIHcRDpERkOH+vJlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 06:35:24 +0000
Received: from BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1]) by BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 06:35:24 +0000
Date: Tue, 10 Mar 2026 14:35:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>,
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>,
	"Chuyi Zhou" <zhouchuyi@bytedance.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH v2 12/12] x86/mm: Enable preemption during
 flush_tlb_kernel_range
Message-ID: <202603101347.ef3b298c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260302075216.2170675-13-zhouchuyi@bytedance.com>
X-ClientProxiedBy: SG2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:3:18::31) To BN6PR11MB4033.namprd11.prod.outlook.com
 (2603:10b6:405:78::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:EE_|CH8PR11MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: a32976ae-3469-4608-846a-08de7e6f35d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: zMvTj++Lzfabe38OIddwMfM5WfA9WeWRRS2sP4UQU/J9i/8LU9SiVwRokCgTpq4oQ0kIzyxMbuoMRts/XpkNPksCtzoiyI+p/x9L7IHpD2HB9LsRuEzrr/wVC2Ug0LQ1whygRfFr4W8XK7PcSpdpnUb3M8BvjGfhg+6tXfFqxui26VK/eILrHm+GSqqlWVA4tnF37cvAfp1KkltxTTT7nrcx5UEan9774kwHRZa2+kuNWsBSVltNr5Q1sqjUNUBxLLw0KssQbwdj3rsY0LzXEcBeVTfNyX5dkpPcAQImt3BfumAa2R16hnQRKrxKSrFaUoyw0sDVqVY31A6XMjZJ8X8VBbPU+3Xn6vl9ecw3ig0lVSszEG3n+ps+fzq4A21WvYZvIoTGmsGGOdCjb+nvhV5WKonTpW6Bo/icy7iYCxDNn/V1perNomBEeAnNGB7CasTbRSslz178MoEYu0J3nPee5FgShSNCWtaCSoXSjpssNWioV7IM/D6pD6bN8C7sqLgdbCV34zhGIEuA390ytigcpCddmP9d6A6q0L5tvkk6gmvyXs8xnauPY+0xdI2Pp3Jfj6ZpQmeifYheeGdKjc3X20GggAoet/quE+5HJQ03MtS+I4ME7qtbBljwtwANwTW5gKHp8gjBdg+CNs5GtOKApOWBonzHqL2OnHZuI6fgdSjFbd7mq+zp4NOTj3Kf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sz+Mq90JiKqch2q+Nsv2gd9jXj29JCP0ArWGEgvqBzlFrMXcWlPBoXnaDxaJ?=
 =?us-ascii?Q?qQsLZ3aCtg9WFUoK6QgVeTVMULguOX5Tf4u5CnVlliXECzptrsPZKYlAR8aY?=
 =?us-ascii?Q?kk6xqGM/nbeQsV4/kGijY4UMw1fNtQU53evvbLES3BA/T+kA4zDAQMP6ZBK1?=
 =?us-ascii?Q?E4L3DNC+07dh/Mm65Fspk23YjnJo5iTdzQhGtGpmx7itjGH731B3Ve1y0utC?=
 =?us-ascii?Q?k1Zf5DJUB13Rbzuw9Pztl9zohBm19LGLc8UB5l3jlFlNWHr14PX3Cx6bmYn3?=
 =?us-ascii?Q?82d2zj0DQrSFHpv8sos1s8wM4vIX2aSbc4z/Jwkm8SO3eWVwj6VoctfqTg2S?=
 =?us-ascii?Q?R4NNmsVvNU2dG8/mTQYkZOZ1rLr6I/UVQGayEm3boPbtovlfNB6EIjkikwit?=
 =?us-ascii?Q?Pf5dmW/LqKEduwsYWTW2TH1PnavKEqn5Gfjc9X1UB7MEh9v4IHT0Npp0Hxts?=
 =?us-ascii?Q?SRGJ+Vtamui/Ku4Swg9zqb4Ap0e9TWxzMl9R3U1NFA+OIXww6xqKABcUeLYE?=
 =?us-ascii?Q?IdvBuRXOBrS7fgaX+li7qNWMrStfp5DqisQGPvN5/t30UG5KHy4IJUTRMgy1?=
 =?us-ascii?Q?TrpQgjbbp/ba+XpsHXKB9NrUDwKF1481WktF+UCSTXvDTwJJBznP2f/HRvwZ?=
 =?us-ascii?Q?eaQ8Hvnh9YL5pyXRUvwY/ceIcj2TUNK9oA8g4FH7EFYJAc+fECG/hh6FP4CR?=
 =?us-ascii?Q?eimPdNFT9fIqpEeJF4Y6Gi8y0k43TMAhZwxgbXfROR+iV91m30BTjmeEYT4J?=
 =?us-ascii?Q?w+miZ5JrQVHnQnkz8pUthjsTChHcb9uSDqluJJa5EB/iIbQy1QoZyF/ryzJY?=
 =?us-ascii?Q?ceuqU7n7qKIyI0OxOXHiNL9BIp/9YfDyO4XqzSINtkVjGnTpya4qn6RWQLGu?=
 =?us-ascii?Q?CYrmuLC+fJeCTFS4QEkvf3gvH1vetokLuyiF0UPrfE8O6tl9WVnLlM4MEp5S?=
 =?us-ascii?Q?q68JI3Q2FJwO0ojFurRLmMkp7m6GQNMTnFrAIjMyEVNxWRx/NSQFtEbOSHTi?=
 =?us-ascii?Q?yeN1rNgjbRbeOdOsVB49XQz0l8u2mNrfC6y5g4EHwaFzb01VvWuiKi7OUqcQ?=
 =?us-ascii?Q?aqmjN102zqavPQam83c6S1AObxrQO6F0JC2/FcQd2VgNUoCauZvJPG5Fw+A3?=
 =?us-ascii?Q?RRrHyl+icFTG30t0yRFx3kQK/lqHPFhLByOGG76A6SQ1UGF9pr9xi3WzEzlY?=
 =?us-ascii?Q?M+5u9HmATUC8GrT6OTAnEGL8nH2gD2AusgYgepKtcEyjgB0a0mA8eq3113M1?=
 =?us-ascii?Q?eF8hDVpA/WXaEuFutAQpIfRsWzmEcbxYSvgpjALCtsAE3zXnYXUfE3AmTIfs?=
 =?us-ascii?Q?xGo8FDIjoFE7NxwT0wFUjIs0qQU+94zT9onUTRwOuNI0STmEE8xupl7laECR?=
 =?us-ascii?Q?uur7Z/+jSKN229jjJasSiDzTUfGTO1/uMDz93S0ocqnQdt9Ajk08L8dY2tqA?=
 =?us-ascii?Q?GEVhMEtAbP+DgVX3bl1R/6ZUyMjxOrnajUBR1lsCffE+y+d94sHfBD0l1giM?=
 =?us-ascii?Q?ZF2+psMaOlrAe8T6thaMuwGW3J02P4/qNE/9Jy3U/PooSSHJ/E8fvHCeb2uI?=
 =?us-ascii?Q?VQ5mKe7VVr72NDC4i4Cuu3Yai8yJW9BLfIVh02zUt2F2cGxvWZ+XUR6nlfB8?=
 =?us-ascii?Q?yMyUyIBzzFc1NHBdNoExx3Ng+41eE79lG4jsVmPD1WMlN8xUIsS6/TFrWHmB?=
 =?us-ascii?Q?YMscmWAbZyaOkQ201w8llbyAb9tplnyHaWClkgSX4mbwgYJChE/3LaapjsIu?=
 =?us-ascii?Q?KxUIUt+Ohg=3D=3D?=
X-Exchange-RoutingPolicyChecked: q2+SEDCOjBSutRDImBQm1nBPJ3k7yMbkbp3JLe54N9eWFB/eCn77C5MnmOUcSV63qadItXg3tH2Km7XEFurjN3ZcZb3xmkxiWPqFQR6tEXbN8GLyjwS6/EIbBZnGSWnnT2rSI2CaN+mmxRUM/d9EMpeuP+y61v9p7IVagaCuh1mc7GtG29U6CUtpQtdITPSwH5EGbDMAMU2q3LfGCvhCW/SIJzKcRF5tZa8Hk/v+G6nbmDEonXhj+TxL+h558gYis0nFbJCYk7EZcqm/Z+lGcsPIOYy7J7EG5syt1OcSXypEheHd12qiasIBAM9w4yLaZAqzU0EPIV+s6Ttvx0q/wA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a32976ae-3469-4608-846a-08de7e6f35d4
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:35:24.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOH90tJ3Byfem5vdK6Tr8v4Xu973Rw19yjRTE7bxNeOUrQ7uG/Sma5D9YI5Ji/9LqhS/p3K279kidpGm0L/ONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:

commit: 71316421085260ada767336b7d506cf68cd54501 ("[PATCH v2 12/12] x86/mm: Enable preemption during flush_tlb_kernel_range")
url: https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/smp-Disable-preemption-explicitly-in-__csd_lock_wait/20260302-155954
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 07fff0001f755de9063652eb09f9c46a108fd7e2
patch link: https://lore.kernel.org/all/20260302075216.2170675-13-zhouchuyi@bytedance.com/
patch subject: [PATCH v2 12/12] x86/mm: Enable preemption during flush_tlb_kernel_range

in testcase: boot

config: i386-randconfig-012-20250528
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603101347.ef3b298c-lkp@intel.com



[    0.311796][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
[    0.312917][    T1] caller is debug_smp_processor_id (lib/smp_processor_id.c:59)
[    0.313674][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.0.0-rc1-00532-g713164210852 #1 PREEMPT(full)
[    0.313680][    T1] Tainted: [T]=RANDSTRUCT
[    0.313682][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.313684][    T1] Call Trace:
[    0.313686][    T1]  ? show_stack (arch/x86/kernel/dumpstack.c:338)
[    0.313701][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[    0.313715][    T1]  dump_stack (lib/dump_stack.c:130)
[    0.313723][    T1]  check_preemption_disabled (lib/smp_processor_id.c:47)
[    0.313737][    T1]  debug_smp_processor_id (lib/smp_processor_id.c:59)
[    0.313743][    T1]  flush_tlb_kernel_range (arch/x86/mm/tlb.c:1528)
[    0.313764][    T1]  cpa_flush (arch/x86/mm/pat/set_memory.c:455)
[    0.313774][    T1]  change_page_attr_set_clr (arch/x86/mm/pat/set_memory.c:2054)
[    0.313802][    T1]  set_memory_ro (arch/x86/mm/pat/set_memory.c:2305)
[    0.313815][    T1]  bpf_prog_select_runtime (kernel/bpf/core.c:2560 (discriminator 1))
[    0.313829][    T1]  bpf_prepare_filter (net/core/filter.c:1323 net/core/filter.c:1371)
[    0.313847][    T1]  bpf_prog_create (net/core/filter.c:1412 (discriminator 1))
[    0.313858][    T1]  ptp_classifier_init (net/core/ptp_classifier.c:227 (discriminator 2))
[    0.313863][    T1]  ? find_next_fd (include/linux/find.h:192 fs/file.c:564)
[    0.313871][    T1]  sock_init (net/socket.c:3314)
[    0.313882][    T1]  ? sock_alloc_inode (net/socket.c:347)
[    0.313888][    T1]  ? damon_sample_wsse_init (net/socket.c:3268)
[    0.313895][    T1]  do_one_initcall (init/main.c:1382)
[    0.313904][    T1]  ? parse_args (kernel/params.c:130 (discriminator 2) kernel/params.c:186 (discriminator 2))
[    0.313923][    T1]  ? debug_smp_processor_id (lib/smp_processor_id.c:59)
[    0.313930][    T1]  ? rcu_is_watching (include/linux/context_tracking.h:128 kernel/rcu/tree.c:752)
[    0.313948][    T1]  do_initcalls (init/main.c:1443 (discriminator 3) init/main.c:1460 (discriminator 3))
[    0.313964][    T1]  kernel_init_freeable (init/main.c:1694)
[    0.313969][    T1]  ? rest_init (init/main.c:1574)
[    0.313973][    T1]  kernel_init (init/main.c:1584)
[    0.313978][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.313982][    T1]  ? rest_init (init/main.c:1574)
[    0.313989][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.313996][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260310/202603101347.ef3b298c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

