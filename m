Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF360187840
	for <oe-lkp@lists.linux.dev>; Mon, 23 Sep 2024 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079265; cv=fail; b=GJ9Yb/V6I7H+/ucy54raYUUB5hgJ0UD1c6fmrw6F53M3Xn7MSFdN2T5oiaNnp5u33UoSxtXfYTfcSpO5YCN9ahopEyFD7+GxfdkwrmoXFaAynabruv1SvGHb6QIhAWlZHJHEny8WYz1kEKQqUWlzBnPIswRc5YiSuBnMTMIBkcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079265; c=relaxed/simple;
	bh=GsX1MaPftJ8p3iWZoAgvSQgM0GMNun5EM5OF8jjcmbg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=npEsv0bQWfw1B6gGW+GpGcSMhVwQaP5RjzD6e5gP1jwzvL2LWFeXg/zzpr7Z+hRlVAK1N9PRm1bL7FaQTaLJCK7UQLXRMADSsoZfMlvToVlg7gMWc1jyfxYQnz/e8uWhjflPS5/wL175iBQICqSFjc+960280MOExdLGaO+8Z6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6fla5gv; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6fla5gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727079264; x=1758615264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GsX1MaPftJ8p3iWZoAgvSQgM0GMNun5EM5OF8jjcmbg=;
  b=m6fla5gv7PY3l3b8wH6AsYhelWQoc17d9BESDxKZAHGsmER/3Mmrvjr9
   5KnXO8aOue6e86lO/6HbEl1DqH2Tk+XKGXOqnU9DUCJxSYpjRm2sENVlu
   Uz1o9t0rWwcfHP3tLKpFcLbmB+PKHzasBMdVK/uyLrtBGO/cTyO/Llnkv
   2Irjuw+/l5DR/+rs5VgeW5XgBbb+Kk5Evde3akBkbnLCWntVGvKl9deE7
   89i0yA+BqvPgyaLtIQqnqZnLbDaVfgc2tA3+6f5voGEGpsSwWUkHwC1ed
   cX9oJdtRrr4iZrSAmGpVWUcAbvnGZ52XOAbvPnJQhI3Frkhm9hwIEO98m
   A==;
X-CSE-ConnectionGUID: cO0FOlDES56mEa1imsogSA==
X-CSE-MsgGUID: 8zB2mfNhQfetQ7NhAxwX9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25964585"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25964585"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:14:23 -0700
X-CSE-ConnectionGUID: 9q/XhrI/QUaa3SVfjx8uCQ==
X-CSE-MsgGUID: yBX5GFVqRSaPG5ie6ONlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75549485"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Sep 2024 01:14:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 01:14:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 01:14:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 01:14:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 01:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQw+FHDTM1oOYwJsldtaKZKUc5vNWzKS6ALLjsrvU5cCUifDx6UstFyKzqBDPeQh8ruGwNyrMQ+jR7MOBagg6yXIaGqrq7rEUmj87oIpdob1pPC6MOxlhMdZfCOZ5OuVHC7dUZ96JQV+mtqmhbhjBkYh5nVxHAYSydwyVfPG3dbIhItvWdxIasB5t6GXLLgII6P+Yh4ZfFJLOvErmuCoy7ZSzzgg2xzDLrjqIWPLXAKdfcPHsojlYFDMmwxJchQKLIzHC9t7LJElrnqdpqM7QyjrXGT4fpSDJYtVuCUrhxtxS6MMa1mqLdGqJA+WTZuA48gWtZpcosE3hcJ6N9Aqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skfviAMzrHUl8nqi8RDqldcJb8ATLfECLUrrO5TVMFI=;
 b=WcAutQEC17aX4Pn3yPKv6jTc2bLE8JElGswxn75cYwdytK90tpyJK+5GWyxySVraJzeEmZKI6q1VeV1jnoskJWD0BMFeKv3st1BYQ5zElB/JbpzdRSIci1DYhP0REU4AiZo3xjeSHetw9GbUwSq5cd7RjNNCbYFcBqVbFK9pAIdXzvlkaE4xZN78xrIDXKpNdLuVX6dy8xdTuqOrj2BYvCwpoZHXsrkOHlBRAy5pmSjPYbApmbWnEkRAfDroP6k6AQu6ZGMT+KWXRnX0uicQ4nwj0OLz1LlPlwB7tSW515Ski/PKUnij7RKDzeeRPrjyX7i4v6uhAIdGPmlMfJ2vUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB4854.namprd11.prod.outlook.com (2603:10b6:510:35::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:14:18 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 08:14:18 +0000
Date: Mon, 23 Sep 2024 16:14:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:dma-split-wip] [nvme]  dd0782c9fc:
 Oops:stack_segment:#[##]SMP_NOPTI
Message-ID: <202409231544.903e0cb-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB4854:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef80252-8dbc-4b17-949c-08dcdba7b861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i+xZUBO3CZVMEPwzA/yopnwpt6P4mAff14JdGwqxfDs6YqlRJ3QkNus6kaMV?=
 =?us-ascii?Q?+9k5LMcZUi2UxOAV2654sOsBZMhVo91hsoYuJAxGGyz+lo67u2l+7rv4mycE?=
 =?us-ascii?Q?IoEOER8ohVBQqdZ510CeKg1RQZ6ngh3djOO3DjkBheaJLMpMbKO75y34w6nn?=
 =?us-ascii?Q?9mvE3TOr6dCiA7c9aIbrY77VQly8Qx54dBPfJfdkenqrVEfniEW6G8oMjNjL?=
 =?us-ascii?Q?7239LdZ2Nc+BgBTKE15fHaVnPEhLNi/oVbwoIy8wKtQIJPyGaG5dcscFYjrF?=
 =?us-ascii?Q?qtXX7OjqDRk/jLAxLHitO6fPwugEZn+3JV0lOSH2n/k1QzPCSWpQTm0qoGkN?=
 =?us-ascii?Q?HzpejolCIDXthEz6XeUCzA0ECsVLTbGr35OE09Xm8P2S+BOFhDrANmhay1oh?=
 =?us-ascii?Q?cLgG0Fp/ohhfKfmODh3fs+YI9xjJWc7rlc336eHdJk3Dg0+xlDHEwjXCl3Et?=
 =?us-ascii?Q?YHuzKnwQlv0ghnyCbdJqzGCUfFC9aoZh+ohFUAqMYJNE38uJEIr4LOY8LvZ/?=
 =?us-ascii?Q?MgtZ+whh0fdcQpKQ04A+l2Gl8KjG3A5FNrUYy91CyvboHWiFVGY7hDKEvabv?=
 =?us-ascii?Q?/dSCjzpofiVxHKode9yrXCWqG7l9RjYM4gOc/8+kcL56Ss8QP8oK6S1cZd++?=
 =?us-ascii?Q?TJ2Y782MCqSUTJR5td/NYOjNRUh730Dw4EBcd/IuhuAU4aUqjd/5qrFz6BKe?=
 =?us-ascii?Q?DOMW+vWeGHoWU4t/JHkbxjPCBPAYgPe+0OQ22CCTbx/ZcOAhEnldCY47ygmj?=
 =?us-ascii?Q?YECD9CtQpSQVRtg2v0i165sNFB7kB/KVggWAggxctgJE3OXV3CqpMsxXONuO?=
 =?us-ascii?Q?FyjOnTIUskoX1/zJjL5tEwblLRrHTyjRTg/vqSjfC0De5aABUTmoBtCikey4?=
 =?us-ascii?Q?syfeDPcy6M4ohGKZq2Tl6IGs/SBL3nj0SIPGcAeyI2gWS7HFK+4+egmrwcUp?=
 =?us-ascii?Q?hmZIlW5BpZPOosT5wgv/zleH7MXlzREi+2i2N54fcMq2/hBEIfJL1P8psy0W?=
 =?us-ascii?Q?Cc5RSL2jtm5B7Kwg6ZZeSDZ5sNZsHTtWA29RJ4bCuWvr7sucEMn3zpBECRgv?=
 =?us-ascii?Q?POIptFL/ZUS9GMJ+cSj9C5PekGFf0aXcyG4UzVOKWathxK9Txey0wsptbGWW?=
 =?us-ascii?Q?KgXONfQYydbjhbLx47NijeTojvmOLyFxIA3VRO7i15RXKVt/AD0Ew41/txUl?=
 =?us-ascii?Q?Uie2Buc+2IpM0btFSFubLJu3LU4JsbZapPDk68uMz1A1A4VLM6HH+sRmQood?=
 =?us-ascii?Q?j604j4K5N6swVXEMia0VDcy4ZQpxNDjb9WeSdi36+u2S1NXCt2mDVEc6nNP+?=
 =?us-ascii?Q?CBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+EdnsZ2dTQtXqy8HEVlNGNei3NFJq7K+82pVwr8V28y8qdrowihnqNxIK2Y?=
 =?us-ascii?Q?xZ8gLQqBAMDGQbyLfHkdQv2HZij0LwHIWb40K9ahn+qR45aBvwYaCYXCFMKf?=
 =?us-ascii?Q?t954/ffXfzWHTuVXfamlJLCv7uHYmaOA4h1wxf62UHwnWbZ8GvF6jrACeGOy?=
 =?us-ascii?Q?cmj5QzO4BFcqccttAhFKGrw2iraQPTokNbciTAGOHVg9eXbX7i22uBhu56ED?=
 =?us-ascii?Q?rq9/rYCDJfHJKCO+YUYsP5Ei51FAR0vm9ZHGIFSPqddU0aNrUkhYFHUth1Xw?=
 =?us-ascii?Q?wQEcIjXccXYw5RyF+6idFt7fwx94s7//UJLavUfv5fbcrsNTuzAqm74vLbv0?=
 =?us-ascii?Q?/yCKWKkjam4j08xwntuEGNuDjQn5Sxziy3D0KP3YAhKlNUaRoBpWu8iEOO5o?=
 =?us-ascii?Q?u9aFnU/zwYoEXwO2nZsAymna+/8VgcvXewqdjq9Kym0SsRP3m5xpSu6c4giK?=
 =?us-ascii?Q?gMFiWjT7ser02mQcqMq1ROR/VWGdKAXqeILRPSo7NuXocCLer55W/TqFP4HI?=
 =?us-ascii?Q?+fy7NjgJDLKVz5ACcQDdz0Xj5pc15Sv58c0gZdoVtiKxFpqKtID9M03XzFXk?=
 =?us-ascii?Q?3vcLCsQqbWMz3AnxDwhl/5NNs12Byx5NbnPwsAWz7YHeAlvghBE0hsT5xp1X?=
 =?us-ascii?Q?/JPr4yXjTMajTh00YUxjQHKwDsMI2Jhrlq1erCmdMThgZt+N9TM/rpJ9PicD?=
 =?us-ascii?Q?JJ9gXKTwRBAbQGO3vNWN1Ka/nOsK1xyLozFh/YDiue1iOXQWcgrO68l8XAb7?=
 =?us-ascii?Q?eLqbQaIyvVKRszhIc3vXwMeFK2H26yWI3D4RezXNfRP+njRN2avYtTzF2+ip?=
 =?us-ascii?Q?rMMXYhNXbbyx6/SwVORrgd5QuDHfeck12F0/tzGLjdP/jhgyIsZegyyQrUCa?=
 =?us-ascii?Q?SgEpfpuAExEzbA63FPvEeBpqh4008IN1Z3qu2vrpKde8LHqulnhYzlWlOwzi?=
 =?us-ascii?Q?ViYF3UVT6upyKNM9duP3nm9G8WRWTqs5GxyiSukyU210zBbX4kKw+c/mEDGB?=
 =?us-ascii?Q?iYOlwhtBimv9dvAAxSAu0o8QNHRLIoX1VeppSXUAsIlRTp12aPtVfZ9TgqAR?=
 =?us-ascii?Q?HKBz74I9macOZ+Vz85S1yNQAJRX52zIAJ27VMVqtEzIn0vB18B9RQH6n2x+j?=
 =?us-ascii?Q?E2BO/yuhD7/sHBKSV0Z99Wu1gpDyciBoTWnuXHEp6nJSQoMElfoZL2/QSdo9?=
 =?us-ascii?Q?o+XxNqSyy5nG0PEiXiDY5GLi1rm7f+3E8On/Q8ox//L5boaq35Q9vlUDr970?=
 =?us-ascii?Q?o9d4RUGIEnp7n31SXuOBEfSoYkOjVaZ1ZYIhQa1hSxLoLDqOVl3j2LItjpUZ?=
 =?us-ascii?Q?k3DPsWusETxyNyM97McvXB65g3swAh8KYb37gcRF8HlxN9SUWb2ONtKpQZzm?=
 =?us-ascii?Q?QhJdWQYZOSTLOEBRx8l0Awi4r2jsHcB/1Bfwo6TG1dUOWsjrQC6xdHxawop5?=
 =?us-ascii?Q?CHRj7ZuqFsKFHDfjoryNTCUtKtjCVnxgiOANRarlTC40efBt0aHE0uqHWhtb?=
 =?us-ascii?Q?LijhgNx6mV9p4DH03d7gUEmSe2OL8wH022/8pJ31Agq2w8R3RjmhpA7Mc91F?=
 =?us-ascii?Q?PtfIFdCGjLGY9wFM0T4+HY6omgqYGwH9Rl4TQfUiJ1+LpjEManorh2UxxSzR?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef80252-8dbc-4b17-949c-08dcdba7b861
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:14:18.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8jma8iuqFTE56VqOv1ei62BnMJ124DR8PW0qRWagPHnFZEy6VFEC8VBJhFmnayWFIThDVWC3pc+dA831dnsmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:stack_segment:#[##]SMP_NOPTI" on:

commit: dd0782c9fcb73487b60939a11f381411464f0572 ("nvme-pci: use new dma API")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git dma-split-wip

in testcase: stress-ng
version: stress-ng-x86_64-3be6dc267-1_20240912
with following parameters:

	nr_threads: 100%
	testtime: 60s
	test: matrix
	cpufreq_governor: performance



compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409231544.903e0cb-oliver.sang@intel.com


[   34.758891][  T880] megaraid_sas 0000:ca:00.0: FW supports sync cache	: No
[   34.758896][  T880] megaraid_sas 0000:ca:00.0: megasas_disable_intr_fusion is called outbound_intr_mask:0x40000009
[   34.765023][  T559] ast 0000:04:00.0: vgaarb: deactivate vga console
[   34.767360][   C13] nvme0n1: I/O Cmd(0x2) @ LBA 7814036224, 32 blocks, I/O Error (sct 0x0 / sc 0x13) DNR
[   34.767366][   C13] I/O error, dev nvme0n1, sector 7814036224 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[   34.767386][  T727] Oops: stack segment: 0000 [#1] SMP NOPTI
[   34.767390][  T727] CPU: 13 UID: 0 PID: 727 Comm: (udev-worker) Not tainted 6.11.0-rc6-00025-gdd0782c9fcb7 #1
[   34.767394][  T727] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
[ 34.767396][ T727] RIP: 0010:dma_pool_alloc (kbuild/src/consumer/mm/dmapool.c:186 kbuild/src/consumer/mm/dmapool.c:428) 
[ 34.767409][ T727] Code: f4 55 53 48 89 fb 48 83 ec 08 81 e6 00 04 00 00 75 68 4c 8d 73 10 4c 89 f7 e8 cc 48 c7 00 48 8b 6b 18 48 89 c7 48 85 ed 74 57 <48> 8b 45 00 48 83 43 28 01 48 89 43 18 48 89 fe 4c 89 f7 e8 e8 47
All code
========
   0:	f4                   	hlt    
   1:	55                   	push   %rbp
   2:	53                   	push   %rbx
   3:	48 89 fb             	mov    %rdi,%rbx
   6:	48 83 ec 08          	sub    $0x8,%rsp
   a:	81 e6 00 04 00 00    	and    $0x400,%esi
  10:	75 68                	jne    0x7a
  12:	4c 8d 73 10          	lea    0x10(%rbx),%r14
  16:	4c 89 f7             	mov    %r14,%rdi
  19:	e8 cc 48 c7 00       	callq  0xc748ea
  1e:	48 8b 6b 18          	mov    0x18(%rbx),%rbp
  22:	48 89 c7             	mov    %rax,%rdi
  25:	48 85 ed             	test   %rbp,%rbp
  28:	74 57                	je     0x81
  2a:*	48 8b 45 00          	mov    0x0(%rbp),%rax		<-- trapping instruction
  2e:	48 83 43 28 01       	addq   $0x1,0x28(%rbx)
  33:	48 89 43 18          	mov    %rax,0x18(%rbx)
  37:	48 89 fe             	mov    %rdi,%rsi
  3a:	4c 89 f7             	mov    %r14,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	e8                   	.byte 0xe8
  3f:	47                   	rex.RXB

Code starting with the faulting instruction
===========================================
   0:	48 8b 45 00          	mov    0x0(%rbp),%rax
   4:	48 83 43 28 01       	addq   $0x1,0x28(%rbx)
   9:	48 89 43 18          	mov    %rax,0x18(%rbx)
   d:	48 89 fe             	mov    %rdi,%rsi
  10:	4c 89 f7             	mov    %r14,%rdi
  13:	e8                   	.byte 0xe8
  14:	e8                   	.byte 0xe8
  15:	47                   	rex.RXB
[   34.767411][  T727] RSP: 0018:ffa000000f07b928 EFLAGS: 00010002
[   34.767414][  T727] RAX: 0000000000000246 RBX: ff110002419a8b80 RCX: 0000000000000004
[   34.767416][  T727] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000246
[   34.767417][  T727] RBP: 730834ba4e01314c R08: ffffffff83d54760 R09: 0000000000000000
[   34.767419][  T727] R10: ff1100025a788b40 R11: 0000000000000001 R12: 0000000000000820
[   34.767420][  T727] R13: ffa000000f07b9b8 R14: ff110002419a8b90 R15: ff1100034aed8400
[   34.767421][  T727] FS:  00007f6cbef558c0(0000) GS:ff11001fff880000(0000) knlGS:0000000000000000
[   34.767424][  T727] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   34.767425][  T727] CR2: 00007f6cbe23e000 CR3: 0000000124cbe006 CR4: 0000000000771ef0
[   34.767427][  T727] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   34.767429][  T727] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   34.767430][  T727] PKRU: 55555554
[   34.767431][  T727] Call Trace:
[   34.767436][  T727]  <TASK>
[ 34.767438][ T727] ? die (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:434 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:447) 
[ 34.767460][ T727] ? do_trap (kbuild/src/consumer/arch/x86/kernel/traps.c:114 kbuild/src/consumer/arch/x86/kernel/traps.c:155) 
[ 34.767474][ T727] ? do_error_trap (kbuild/src/consumer/arch/x86/include/asm/traps.h:58 kbuild/src/consumer/arch/x86/kernel/traps.c:176) 
[ 34.767476][ T727] ? exc_stack_segment (kbuild/src/consumer/arch/x86/kernel/traps.c:288) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240923/202409231544.903e0cb-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

