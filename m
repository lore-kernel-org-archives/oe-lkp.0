Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17113AD508
	for <oe-lkp@lists.linux.dev>; Tue, 24 Mar 2026 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360633; cv=fail; b=k4mhJl3JSTFc8eIDiyFgw6tF0Wulr9P275yAyh2U+eJVQR8fW0yUwyQ6NyFcrOmMsCf90Vsm1oyYaOAsXN9K58X/ymPibpxP6uoiav04lOWHGpMgFlUqEt7DqA28yxb+8RI4Fz6/4TKVLlaq+lzN3xKhknzVIkI+M4+AkmoNAS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360633; c=relaxed/simple;
	bh=/WEzgWisb+PNKn4ZBfU6o20ZpNYEYOVmiH2V27TINt8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhUObTUEwfMt4lZmbjHnz+MQyUoi/Sx4HEJza+biZRDE26ty/AGWELfJ+Jax4LvOvY1dKAB5mb1+i4ofSwygma8+R0LyDjF+rvuCuBvqVdTLiP20EO0GpAHLBV0OSn1Pn6ksSMQPVXIlASDWknZDsN9IEeEBIxqNWLO0ROukmr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkWQ5f3j; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkWQ5f3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774360632; x=1805896632;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=/WEzgWisb+PNKn4ZBfU6o20ZpNYEYOVmiH2V27TINt8=;
  b=GkWQ5f3jZ4mf5WkR/+kDaE8RFuWCd7goO8ynkAms7HwwJHklgBx+iWYT
   3bHyHBmS0bNAjGCLpT101qpMkwAI5sWdGX0isDHwpwkniewSvBFuXRAuI
   yo7wxyC49bDA3GALxHHOUEN8zICvJvrd/3s0PZWjftg4z6ATwfDsskKS/
   jWHezopk00IsCfqU6Mj+Mkv9Oo4YTl17NYy9EZhLHHMahzibjkhXj8Hyk
   jnh2pebvPfwLBiqIUYLAKKmcEb6qHsgCZSfl7m3vRz69cxHZc4VLUVMZm
   8JS3Wmn87dq8L/Twx/jGkXbEjKmS3KLIWMv3Hc0J8AaB0yZ65IUSjGXuX
   g==;
X-CSE-ConnectionGUID: h400OoMBQ8+G2KjA9o+Nfw==
X-CSE-MsgGUID: P6XPuhQYScuiEPD3ExbU9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86073853"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86073853"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:57:11 -0700
X-CSE-ConnectionGUID: QzDfOWvGThu3hdL3oHtGAg==
X-CSE-MsgGUID: 88Shf3ImT7a+9GGZppKSgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224601909"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:57:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:57:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 06:57:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q76pjfyvE6ZK8DElTwaC7bFtsYSj9zpLG1T6/f39jck7N16vrznuREwpU9OSX2Jxo1Yg8sMOsrtPZeeq2coBe/wMr7Ut4Ut7aE1MvfGokKArhRPRRZTD4I5HHD/oz2awCDN45BiROOnM0TrvR3NgO+NPn7r93h9Ntzr7Dr9qADXf7S3DPETD4A/FVGC3fypet8abhC3irHwUxerSl2aXkt4YLNHeLY4KoSeURSXHMY9FbvnMqC0Bzh41RhPyafhuywsgiPZF5EXVBhXI2PRiM5nu4pybq0AO8l244XyiGkakdWqLQyOBRsumsnJ5gN4n83vyr0PRP52q2WVABSeGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUpoy7ROQZk7F5yHRvZFRkXARlB46utfPdGfoYOjJJY=;
 b=IqGk3E9VOnmm8+bOV5/AlDl1vauhnOpWGnyufKLK13AbR6kjfY210M6O2LmuZFW1Lz5POKdE/WQBVijmDX5NMPo88mCEEzHJ+oRHxlR57scjh99UrUGpWOB89w3ho+TXySiy4z6EipbbEDMbT1qYjwiO50tndATH8HVEjusEj3Bu7fSot1y3kaEQglRVrE0L0DTxezYtHnyg4P00B6MxAm9HUbDcwqsYxo4qp9D6jVCUkcLzTU5zgTYsIHMdnyheyTcXTUUcj3bgOvtVI+FttSwXYurEEYz5+/4aKpo85SPVeZ1jOGB5HeF7rqlUTqyuhu0+Ly5Jker0QncezkdhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 13:57:06 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 13:57:06 +0000
Date: Tue, 24 Mar 2026 21:56:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chen Jinghuang <chenjinghuang2@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Chen Jinghuang
	<chenjinghuang2@huawei.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <bsegall@google.com>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<steve.sistare@oracle.com>, <oliver.sang@intel.com>
Subject: Re: [RFC PATCH v5 4/9] sched/fair: Dynamically update
 cfs_overload_cpus
Message-ID: <202603242133.f66e336f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260320055920.2518389-5-chenjinghuang2@huawei.com>
X-ClientProxiedBy: TP0P295CA0041.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::7)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 938b7740-0b3d-40a9-d7fc-08de89ad3c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|22082099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info: azf1FHq2OQJAbVGoB0luvuPVJG80EWhJmRzp239JiP92P9QJaTuEV9BCZaZ4JeupGKbnBuBtZbochFEyILbx7Poh4R72yEto0skgXYz4COcvOFr5hMn+QhTcl13XKbAIG9YCKWBvUWAT9KSraOmXDUIca8TosoJcO4EgkZBMp9nG7J5j10qhkh4Y+rMEaJ1iXDEt2Pr3+Qdp+vd0W4ioK08DKF1efYGyEzY8DwCT9GSH/ayPZMne3/XCWYLhbrVh75501MpbKiXIFBPPrN7u8QEc5YPH1R806toNaensJkpxoz+YyiwZI1/A3/o7QS3T70IIRFpk9cS+fv8fcdqYYnD9uldzCpiu2BmWsmLZRbVf3U7iAz47bPO7scphe/iQmStUPZr6ffm2EIuwY84sdQKQMCcAkc7zc5717gGVM36+vwi4NrTAAqnAFuB3edl4SFBy+DJcaWU+bQZwF0MmWThlIac2iJ+D6E0uKaVdXHRm6q5SMKDPTHWLMVIr/DqHWg9PD6KmVr8znCc8l6oD9lSWwWeFTZqAt4pglTw7a2qN6toBlOtGkBBW13n1Ucc5ZYQ981SGYs14Wt5kX9RZN/yV9e2R1ca/pxHTkrzD7V51gUpFWJGht+OqQRzXtrZ3KvUFhOJ1zIA5XHG+xNNaHdvpsThkqGX3rujYduOF/OuyDMU03l486pDrsUh45bXf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(22082099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqL2EEteTg+zjbegR9SPn23LQKq8wXvYLk45kM6e9XiBtbVlM4zRf1ZjlJNK?=
 =?us-ascii?Q?qGchUl8e6L9Bp+oebjB18BvdA7i1JdNXwAOo/xQEIaiKpwG+fP6OffcSUzUS?=
 =?us-ascii?Q?XnA9elskOtrXYpgg0kc+nAZ40cBJMW/h37OVpPGvCCw+nTRp+Cgb1yC4ltuM?=
 =?us-ascii?Q?KEjp2diGEuMKz5Z7z8vxgoYwdPwA08rfOgqZphM4y5osMKYieOlzF8UoqC0j?=
 =?us-ascii?Q?8KKw/L5QABEDq/hS+8Xx9JYs1+JLXW/fe/+0KCCkQpu0UJtir7sAkRaa1Zx6?=
 =?us-ascii?Q?ceW4T/w0xnJOawb3LopH27EM5rUwCd/H8V7ZX9KkxAFdIv+GtpREj60uRnfT?=
 =?us-ascii?Q?/Sz5YzyUgyRoCv0uNn6J6GomzaGCxJ6NLOKOnA2I1luO7XDsa00BaANkxxqJ?=
 =?us-ascii?Q?D5vUjxWE8qcclQ0rTLVij05J3GmdrX2AnAAk1nnSOEIOFmYqwhuYSdSIHZt1?=
 =?us-ascii?Q?x7H9MaqleVTpKvqiVpiZ+ZbzE6hS3GMZAoNjk0tzhbITqCOkV31E0luClPHr?=
 =?us-ascii?Q?JMhOjgCGqeyAWrrLnMLsRQ1y46FNI2qkC8Rr99CHOE2LfGUkwtHzvjAkMpFL?=
 =?us-ascii?Q?ydOzVbeUzw0dq+fVzbIwoWKbATepmVEVzaCcztbI8nyQWk0jhK3DODM5kj0G?=
 =?us-ascii?Q?vDBwuI/jNeJAH7UjdoY5x0+jAOuvleikzRxkmIDu+67EtcCKgBsbIZ794n6c?=
 =?us-ascii?Q?4kunnlQe1cNHJHBa2d+14rtivkhWBieAE3dJbJ67wl8re/6tsTJezF5HMHWp?=
 =?us-ascii?Q?9YhTVzDmPcddVViXlTVeb4I8Q8O4mJ/grAGFtIaUkx8Xu3h24cS/UmRAjFyz?=
 =?us-ascii?Q?1OIZvXNJl1eGoaJXhoZqkoY825hOQ3Sy51P803LVeZwhROCpdDo75zCGyy85?=
 =?us-ascii?Q?wCwGx9pwdL/zofg+ObKYU4KmwSlUFq4qqXemdIot6pK/LTSLMWWS2YbEq2Tm?=
 =?us-ascii?Q?Qqz5HOlCM5Biovbpmba+hf2gf6W9vYN6wmm4fL70kQ5bFfmVPn5NatklbUFe?=
 =?us-ascii?Q?wL67bGH0+WURh3edPYPU2rQBR1G0tLuPdi3uak6QXvgEAX8X19eEYVaaDBcq?=
 =?us-ascii?Q?zJIIzeO9CbaF+UzUlTT5s5EphjA2kswonbLqZ5fKakWEJNIM5Rw9GFHI6xTL?=
 =?us-ascii?Q?v1aXVrHmcrTSdsfSfasc7d+Srm74J+aD67So7xAOpQJ0MI3/+VTN3LJ81Idi?=
 =?us-ascii?Q?j3I35mwQuG8BD4JmU7gdiCPrLxXVSJq2FXU4ZDv8j8Ai9C73UT+01Sa2ndPb?=
 =?us-ascii?Q?MoXPng0Ehc7UbDMbTeeDMZEzfsZv3GPE80Rs48uaLlJKvyWebs3qRUCX5K0j?=
 =?us-ascii?Q?eMNsJ2xEcyvd4d4nUNxwlNMU9J+Apk0sKaszN1AgB85pjC0GgOLXpbEuGwIX?=
 =?us-ascii?Q?Q5PYt7+5RmkWK/no6JbXWhMdNqhunxZXFTi4aXOnkhW4bEde26dCfS1Uw3Kf?=
 =?us-ascii?Q?qyTY+3taCvGGD8yl3Z0IaZzUzTytj4SMNsy83LsC4TpXXiLNPgf9ZbKe2IoC?=
 =?us-ascii?Q?0GM9LTFHyZ12FM9gouRx2L3fACX41E3z2mQs84LJqAYLukNlQC4uI90EAAYf?=
 =?us-ascii?Q?qtYHphBB6Fr9tiD3U+/k9GCjdcCIQNelrl3gPUzTlKBcB65rh5zEZkNjsJoB?=
 =?us-ascii?Q?nEDYjAnTmJ8TN/Py56eahDhcQ21nKFGeflhQknmKW+FS3Xzk7p94g7O+SLPp?=
 =?us-ascii?Q?Dq1/WEm3X0JkDMYkBbpy3zQ1dMJ9tu/XbySnHolPfdkHaJcO5HnHB4ydP4AB?=
 =?us-ascii?Q?fyqD6zcEhg=3D=3D?=
X-Exchange-RoutingPolicyChecked: bIm88Y1Lni+6H4fPs82X5R/hJBU/rWL+T8WrkizYUPFbrvG3MoJh7cpKda7R5SknIFOw+PuB08IpV0DtYdjAzFynt8uLq9W8c2J2UgZ5cIHh2saQ6EbPU5JE1BSjPKS+QN4RXCdgLW0DPm4Km7oLqppHQbfMP7VC8zPCTxZiq86bybdDbo1rwpYhGHjMikJRQ2oZDPMAG05SBIg6ox5nJ0fejv9BTsqZ655y5sVy9cmOU7JUtqx1IiXKxeE5VAuM93egDJVbqs5bOFvW4aRhAAe9BxkITDnnGcZtnEbo1Uyx0hYcXz3BKXEjSyOVZ2r7Yikj5c9sDPqEsOrGw/OTAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 938b7740-0b3d-40a9-d7fc-08de89ad3c23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:57:06.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb50vMBei/op5cZ/JccBYHwVV8Uo8c6Zb718qNHDzqPwiSL8Tv2/hXiKdcn2QyONeNgTvDFWOXyrP8nrIRRP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_kernel/sched/sparsemask.h" on:

commit: 7c86475c501e5d551136d0c2c8702d7c61a6b73f ("[RFC PATCH v5 4/9] sched/fair: Dynamically update cfs_overload_cpus")
url: https://github.com/intel-lab-lkp/linux/commits/Chen-Jinghuang/sched-Provide-sparsemask-a-reduced-contention-bitmap/20260321-084706
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 42bddab0563fe67882b2722620a66dd98c8dbf33
patch link: https://lore.kernel.org/all/20260320055920.2518389-5-chenjinghuang2@huawei.com/
patch subject: [RFC PATCH v5 4/9] sched/fair: Dynamically update cfs_overload_cpus

in testcase: boot

config: x86_64-randconfig-016-20260323
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603242133.f66e336f-lkp@intel.com



[    3.884372][    T1] ------------[ cut here ]------------
[    3.884372][    T1] UBSAN: array-index-out-of-bounds in kernel/sched/sparsemask.h:181:32
[    3.884372][    T1] index 0 is out of range for type 'struct sparsemask_chunk[0]'
[    3.884372][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc4-00274-g7c86475c501e #1 PREEMPT  3f169c7b099bc50b6180dc864130cea2b43f07ba
[    3.884372][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    3.884372][    T1] Call Trace:
[    3.884372][    T1]  <TASK>
[    3.884372][    T1]  __dump_stack (lib/dump_stack.c:95)
[    3.884372][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[    3.884372][    T1]  dump_stack (lib/dump_stack.c:130)
[    3.884372][    T1]  ubsan_epilogue (lib/ubsan.c:234 (discriminator 2))
[    3.884372][    T1]  __ubsan_handle_out_of_bounds (lib/ubsan.c:?)
[    3.884372][    T1]  ? overload_set (include/linux/rcupdate.h:312 (discriminator 1) include/linux/rcupdate.h:850 (discriminator 1) kernel/sched/fair.c:5164 (discriminator 1))
[    3.884372][    T1]  overload_set (kernel/sched/sparsemask.h:181 (discriminator 4) kernel/sched/fair.c:5167 (discriminator 4))
[    3.884372][    T1]  ? overload_set (include/linux/rcupdate.h:312 (discriminator 1) include/linux/rcupdate.h:850 (discriminator 1) kernel/sched/fair.c:5164 (discriminator 1))
[    3.884372][    T1]  enqueue_task_fair (kernel/sched/fair.c:401 kernel/sched/fair.c:7092)
[    3.884372][    T1]  enqueue_task (kernel/sched/core.c:2111)
[    3.884372][    T1]  ttwu_do_activate (kernel/sched/core.c:2149 (discriminator 4) kernel/sched/core.c:3667 (discriminator 4))
[    3.884372][    T1]  try_to_wake_up (kernel/sched/sched.h:1883 kernel/sched/sched.h:1969 kernel/sched/core.c:3919 kernel/sched/core.c:4242)
[    3.884372][    T1]  wake_up_process (kernel/sched/core.c:4374)
[    3.884372][    T1]  __kthread_create_on_node (kernel/kthread.c:?)
[    3.884372][    T1]  kthread_create_on_node (kernel/kthread.c:562)
[    3.884372][    T1]  rcu_spawn_tasks_kthread_generic (kernel/rcu/tasks.h:682 (discriminator 512))
[    3.884372][    T1]  rcu_init_tasks_generic (kernel/rcu/tasks.h:1587)
[    3.884372][    T1]  do_one_initcall (init/main.c:1382)
[    3.884372][    T1]  ? stack_depot_save_flags (lib/stackdepot.c:?)
[    3.884372][    T1]  ? tasks_cblist_init_generic (kernel/rcu/tasks.h:1577)
[    3.884372][    T1]  ? kasan_save_track (arch/x86/include/asm/current.h:25 (discriminator 3) mm/kasan/common.c:70 (discriminator 3) mm/kasan/common.c:79 (discriminator 3))
[    3.884372][    T1]  ? kasan_save_track (mm/kasan/common.c:58 mm/kasan/common.c:78)
[    3.884372][    T1]  ? kasan_save_alloc_info (mm/kasan/generic.c:571 (discriminator 1))
[    3.884372][    T1]  ? __kasan_kmalloc (mm/kasan/common.c:419)
[    3.884372][    T1]  ? __kmalloc_noprof (mm/slub.c:5261 mm/slub.c:5272)
[    3.884372][    T1]  ? do_initcalls (init/main.c:1454)
[    3.884372][    T1]  ? do_basic_setup (init/main.c:1480)
[    3.884372][    T1]  ? kernel_init_freeable (init/main.c:1694)
[    3.884372][    T1]  ? kernel_init (init/main.c:1584)
[    3.884372][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:164)
[    3.884372][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_64.S:258)
[    3.884372][    T1]  ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:179 (discriminator 1) kernel/locking/spinlock.c:194 (discriminator 1))
[    3.884372][    T1]  ? stack_depot_save_flags (lib/stackdepot.c:?)
[    3.884372][    T1]  ? stack_depot_save (lib/stackdepot.c:747)
[    3.884372][    T1]  ? set_track_prepare (mm/slub.c:1036)
[    3.884372][    T1]  ? do_initcalls (init/main.c:1454)
[    3.884372][    T1]  ? do_basic_setup (init/main.c:1480)
[    3.884372][    T1]  ? kernel_init_freeable (init/main.c:1694)
[    3.884372][    T1]  ? kernel_init (init/main.c:1584)
[    3.884372][    T1]  ? ret_from_fork (arch/x86/kernel/process.c:164)
[    3.884372][    T1]  ? ret_from_fork_asm (arch/x86/entry/entry_64.S:258)
[    3.884372][    T1]  ? next_arg (lib/cmdline.c:273)
[    3.884372][    T1]  ? parameq (kernel/params.c:90 (discriminator 1) kernel/params.c:99 (discriminator 1))
[    3.884372][    T1]  ? parse_args (kernel/params.c:153 kernel/params.c:186)
[    3.884372][    T1]  do_initcall_level (init/main.c:1443 (discriminator 6))
[    3.884372][    T1]  do_initcalls (init/main.c:1457 (discriminator 2))
[    3.884372][    T1]  ? kernel_init (init/main.c:1584)
[    3.884372][    T1]  do_basic_setup (init/main.c:1480)
[    3.884372][    T1]  kernel_init_freeable (init/main.c:1694)
[    3.884372][    T1]  ? rest_init (init/main.c:1574)
[    3.884372][    T1]  kernel_init (init/main.c:1584)
[    3.884372][    T1]  ? rest_init (init/main.c:1574)
[    3.884372][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    3.884372][    T1]  ? rest_init (init/main.c:1574)
[    3.884372][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:258)
[    3.884372][    T1]  </TASK>
[    3.884372][    T1] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260324/202603242133.f66e336f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

