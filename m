Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF45FDA7
	for <oe-lkp@lists.linux.dev>; Fri, 10 Jul 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783647102; cv=fail; b=Z3yfOvMxMbThcryh1vqadZ4tOSHnxkpxj8jDlNPg4PxFtdv7hHnu2rEJZvkVJcyKLaPjtBkPAO2Qd7/akihOXuNbH3pMY1nAUhFid/Q1MlSa+kiuiM+vnODcUQ+Kmsjp64J+YhI8kzvuw5mBuEBUD9bIjB46CU+f1Y3uH/sxPxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783647102; c=relaxed/simple;
	bh=aEituAYe3ExA4hdtcN/DUGSNl1U9yWKUNJKBwi+dJ4E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X0bHVGJnnLamB/DULF6pnQDW8evS0bzvOU/KyEeVzzZ59oeJP5fsvmaogsiu5p8uxpj0H28LFqhx4phJEN56ymeV8eO5GCPUO+RPFarT+8r+h50TDT+1khSFw3UDvTs7H3spfhpqVDjDwgN2BqGJxVGbF/MsO4Z8rmdYqv+ZvtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1JxkUl0; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1JxkUl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783647100; x=1815183100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aEituAYe3ExA4hdtcN/DUGSNl1U9yWKUNJKBwi+dJ4E=;
  b=S1JxkUl0faqrFpgK6FcSGdKQRiAv+xbceSz9bPoCIFMgOVqEvmJk3h+G
   lXIO/HF311m6PnNQ/dINVY8ioAwcz9i8Zik9BzEXivjmylZKu+1qPj8cv
   cZ6f0SCMsvPWcg4rlG2JQSv0+ENiUB+dj0PoivwxMSeReFYlzsiJ+A7Au
   TcLdeYT6KJW/H0OUi1+GaMNF/lveDR0/eKMTPUhZXk4gj9uni0GQe+FlG
   y2VQh7g9pGVTdwCwYRTvRo6I2X4iRma6HbJuZNsx2mBcmj6SWNZ1Z4J1b
   ba59ivvx2H06Cj8lBF1A2XzsLlt9t4KXmcynzyPZ9O+zVJTqjsTftVyu+
   A==;
X-CSE-ConnectionGUID: nCiHBGG/Se6z5xyJ9tmR9g==
X-CSE-MsgGUID: o85yqpOfTy+EdctQhyyqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83462799"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83462799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 18:31:40 -0700
X-CSE-ConnectionGUID: 45VBpmAnRO2uNw2oR+nf7Q==
X-CSE-MsgGUID: 3DYmXBOEQYue3c5TmkWJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253011323"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 18:31:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 18:31:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 18:31:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 18:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNSuA68LV5S/SU4Y+1PUrrGKKxAkmCBvs3I598chjElCeCJte+vcTluXG2h9BmhxBEsxpEq6s6A1/w7/XlncwEDOKh4lxRc21K9/rxGQ7NsLpnf9gYpoDeOPN0vDsAm6ewFqZ62tps3FLYzT1JWkrCIJL2q63399CHOfWycxAWfJgFounw2QNhv2yT320V0mzeKfUtZoOdsKRO8wSVfXwHCc2skyQUaKZrN5WOty8uPUYhhHy1paP3xqf1Wug0LfLFknRAnOxOxledAVMZFtmlMaUF2c5R6PSOXSrggziOuStGNt4O+qLk9myITqJ8mIEJGu0dtcNiqIPhRMO9tmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkUEGqNETnWyyBGqG2wU2df73AOApiwg+FYo28P0Qqs=;
 b=solwYKfqA+s3ZisO7NT0Pr2lR6wsbDfLvXLsmkXKYHwty6AaeF6XDN2VrG9E64Fu5iaM6TGvbOcv2ppx85Lqhi9MOI7xjuQTB/KgPgATX1yBs7Xt8o67rUVDQE9BRjT3Nf2g2hIVUMtsQhkOdBO1GfMwmtC75G5z7esmirO5Cm/WzGTQPF1SzKJWMiyJ/caRrhZCxA++4q6dqlUlmwQHintD4tCjdEzWXWZCmAQQ2BSTPRlVa/Qd3SjRtvyzBtTybpw1/El41pJBca0XpSA4719zSiJOBLOZCAeIJtKcNvyYMgBF2TdfCCOteEl0YNhFSs7oUCfqeFlA4OFQCQbdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA3PR11MB9461.namprd11.prod.outlook.com (2603:10b6:806:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 01:31:38 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 01:31:37 +0000
Date: Fri, 10 Jul 2026 09:31:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-ratelimit] [dyndbg]  b65e77782e:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202607091658.e03b7a5b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA3PR11MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: c92c7e5a-896a-483a-ecda-08dede22fc41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aFqktg+sekVHftiQgEQ7TdKz2W19pp4goBTpxgUAjiCfbegHwiDk80qVFbNtthf1X0wTpmdxG0ecb0i93QHOx79ELo/aulRcmndz2tMx3a5BlOnC/wb+/9dcShD1HpB9pXRvnJSh8N3wydYpZPzZ61AD+K7Y4lf6FTnAgDHYtP8kIPVZeQTcBoScHDtKPcY9F5yVwOYOVdio9wWamu+olYFWGGYsRxqmmEfyAH3vpv9RRbG+VxsAp8dmBAMFd+donq/6R+8g1LJIWkBGYm9O2xjk1H2kAdsfNKaWtiSIsPcMCLrp+DqBs6HZWQc8hm7CtydjiAgXTljtN1XoF0LI+Eewju/K84zJYSM1NbOfCfVr7fa+GapJjTs+O1GyA3okiWJSgJ4GHCKYdPMPuj/LrNGbGQtkeuXka4GJbmOB41EirNTf6ULvJGO535c6v8sr2o+LafQcTC2HVprxUiRrn1KZXMZgY54LNF1FQ1jHTwaDCdyjoI1pGy0v7jLVM/lWuaFLQJVor/0eONbG71PUBMrbTJN/jZJrEA/2Dj7RttIZs8/fe34UD/xOxO1/JJJeTeRPvgK0yBrUjhLuv7SX4RcYF0TrXbhB0jVl0dg2hbamFBrNjTh2GZ2l6AKf8ygQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCSGePvmgoUNO5h5Lx1MkV8mcUeJe9sQdwUpTIIfKu2hKSOs2NMU1F6zH3FL?=
 =?us-ascii?Q?UkSSRCmy7zJAu0GEL+iZAfH55eK8gQ1IrH3RU7lUjK7AnjyfYhZQ3WjOSoDR?=
 =?us-ascii?Q?+q6c7iZtn9MopVoyjTAhmUE4l+fFqU6bC8hRXeUrOh0NKSeJfSJaPKvxuSV9?=
 =?us-ascii?Q?QnjxsfwDXA9wVr5dZSa99ZoutvYqMqPOUHxIfQfciN7aG9RQI2yOliMP5y6s?=
 =?us-ascii?Q?4NH4DFUJ1v72MRuS4fDw0TMJGeuZOovVsPzW3w/iO+E06n7cOuZRZJfT/X3O?=
 =?us-ascii?Q?EPWPRfegia4eSLavzPBYn3/bimOSkOC8omJDRSrKbGXtpBCvmSmXrkI1TQhp?=
 =?us-ascii?Q?buNhF3mz/RCh4AA19e5Ool/Gf812W1IiNQ7tqXOw7tM0RLe50RT7Ymi0GteS?=
 =?us-ascii?Q?g3p97Z0LvDnHgEniJ+m1zafFSO0/CD22L7McOfftbWvqSxBCVB3nQl4SBGah?=
 =?us-ascii?Q?1km+UYhQ2ebM7B+WnFsMWC8PDg50e7tX3d7rfWoUP6oQmeDLFGJp4/HE5m4l?=
 =?us-ascii?Q?DIM2qhbp5BChg/PBYHMlT4ZiS3o+q74joDq6oIY+GQ2gJpfvrNwJpVTxJZKG?=
 =?us-ascii?Q?XvrRHkfuc6MTyDGSMPdPHRvl8LQ5NzdAg9MdkjkwlogJKKPJhTJtP/+3uz+p?=
 =?us-ascii?Q?MB8X6MUkSl83D9rF1RlCL7wNg+LCe9O5U/IukK/s1GyHvvqB+lS20zK09EXC?=
 =?us-ascii?Q?BpLqwd+H0cw3XX2IP5srRBpuJuEcZBhvsKtFtxKLqUrT5M1YJtnITxoys9hT?=
 =?us-ascii?Q?QrzADHcVemlRq6+m8G6OSci/r9/U1Ev5yoQ/17gaP61pcbw1xmOYzsEGhWNC?=
 =?us-ascii?Q?oCvcVZ0tu6uBi/9/x+995EwdWm6aYkuBcbbP0jJT7XSIZWemqZ9aADTQeR3L?=
 =?us-ascii?Q?EWI4xr7o6yLHXoYOXf6/1yRio7dOSV2pdnq94SZYCvjOatdGkqzgQbU7E8YT?=
 =?us-ascii?Q?hXeqcM/+oUwZ2EMtnZsiF66gXD6Y7scNMdzi6sp2fbGgdk3t5BgS92FspEix?=
 =?us-ascii?Q?CzH8w63QFxmT3dqugOWpYVAfYjfH3V76nubJumvspmBB7dxDqfkvNovzexGm?=
 =?us-ascii?Q?XnH+cYjD4ObtN4q3jl+35lGIRuQfCYuX7AuGpHRjzR5QUXuyrMCtdAhMmXSV?=
 =?us-ascii?Q?EC686S0zs2WkFyORDr5CAdGlOOTTZ4TkG8d5XCCUkCz62HxvF4kWN/8uzcbb?=
 =?us-ascii?Q?bHR5K8HCUk/g0u7RxdRaks0Blzj5OYXeJ/fqwfliJODSUUsotnCS9TXkugZP?=
 =?us-ascii?Q?ppjIoNRtajKL4d04TFVLeOD8clLjBVbLU5qqd+AsBUxqGSX3TTtVOcqqCS0S?=
 =?us-ascii?Q?A0ZqUmFgvMXTWM6PFVnBpUkkHDUrBrOjqRXXkYZ+5ix7XpuEl73C6i5v1YKL?=
 =?us-ascii?Q?gYapErym8AvdFFAlsQjmtbhKLaVdR32CFtBgIlOTOaKVnU5bbSZzG0pFCwT0?=
 =?us-ascii?Q?3Z7iQ9nWNDUz5aBpTkzp0r/84AJMlSoJhKbP6kB+1d50z2IL2fSKjm6Alp0m?=
 =?us-ascii?Q?rFyLWRRtJ1Nfpf/u7cA+Z5tHUwttCeK0WycyJ/pfRNFhVqpg+Y2gnHco5XvD?=
 =?us-ascii?Q?YlWOZ3VCDkCgjrDaAWFPLd9EYuZu/++3wT6WG5meXUg5X3GFtjaUb5PGY4Qk?=
 =?us-ascii?Q?bIdBp7tt3xhlQodrzgZJEO/W5S0DjyiHZZGcakLiYBry14H9WA5TClXyb0jb?=
 =?us-ascii?Q?82vbF0q/QwXzmHTso5rjhNrQNBK0Tky6emenexY7nJqhN/wu58BbiMucEbxQ?=
 =?us-ascii?Q?zXdKw+3+qQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QF6LF9Dnqhi3lLhinD+S8J67VKowEehiFWBhTIoy0SaF+HPXJUGnlKloG1xfrlF2mfSKIuk5/pDT7m/mGI/q73GtLkfNVEcMO50NieRGxjO9sSf1qECD42x+YHgP+GtBva41lEFk6SKqdNE/D8mBRwvc318dxiAT1xTGJEVLB5Tdo5lU8KTBXqr56Rxn0J81fTwWH8GSrWYnQh579nGN98i1uomKEqj4bqF1N4/SreljnYLkkH/Vrj57CWCrPF6u9P+5xAp5oqdVlpPolKuYDDQQ1Sjq+bh75xJAMZVQhxLPkvUjZWGUy3KfC02oiHEf/slghzT8qvIg/dwVGLNo9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c92c7e5a-896a-483a-ecda-08dede22fc41
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 01:31:37.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W+GHsm5ThicR5ReXAn4RyVq1STes7vhZImxiHLOvHziFYaKsoI2HL2+V4hRHVCm3hAIuStGl1G7dwDx7xtT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9461
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: b65e77782ef0e657869ec5093935ffdda0cb4b28 ("dyndbg: consolidate site ranges")
https://github.com/jimc/linux.git dd-ratelimit

in testcase: boot

config: i386-randconfig-011-20260706
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607091658.e03b7a5b-lkp@intel.com



[    7.855146][  T112] BUG: kernel NULL pointer dereference, address: 00000000
[    7.857470][  T112] #PF: supervisor read access in kernel mode
[    7.859313][  T112] #PF: error_code(0x0000) - not-present page
[    7.861248][  T112] *pde = 00000000
[    7.862470][  T112] Oops: Oops: 0000 [#1] SMP
[    7.863891][  T112] CPU: 0 UID: 0 PID: 112 Comm: systemd-udevd Tainted: G        W           7.2.0-rc1-00062-gb65e77782ef0 #1 PREEMPT(lazy)  d791b41899d215960b78e1ce16355c682d1dd07f
[    7.868778][  T112] Tainted: [W]=WARN
[    7.869984][  T112] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    7.872988][  T112] EIP: strcmp+0xa/0x20
[    7.874870][  T112] Code: 31 c0 83 c9 ff f2 ae 4f 8b 4d f0 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 5e 89 d8 5b 5e 5f 5d c3 90 55 89 e5 57 56 89 d7 89 c6 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 8d 76 00
All code
========
   0:	31 c0                	xor    %eax,%eax
   2:	83 c9 ff             	or     $0xffffffff,%ecx
   5:	f2 ae                	repnz scas %es:(%rdi),%al
   7:	4f 8b 4d f0          	rex.WRXB mov -0x10(%r13),%r9
   b:	49 78 06             	rex.WB js 0x14
   e:	ac                   	lods   %ds:(%rsi),%al
   f:	aa                   	stos   %al,%es:(%rdi)
  10:	84 c0                	test   %al,%al
  12:	75 f7                	jne    0xb
  14:	31 c0                	xor    %eax,%eax
  16:	aa                   	stos   %al,%es:(%rdi)
  17:	5e                   	pop    %rsi
  18:	89 d8                	mov    %ebx,%eax
  1a:	5b                   	pop    %rbx
  1b:	5e                   	pop    %rsi
  1c:	5f                   	pop    %rdi
  1d:	5d                   	pop    %rbp
  1e:	c3                   	ret
  1f:	90                   	nop
  20:	55                   	push   %rbp
  21:	89 e5                	mov    %esp,%ebp
  23:	57                   	push   %rdi
  24:	56                   	push   %rsi
  25:	89 d7                	mov    %edx,%edi
  27:	89 c6                	mov    %eax,%esi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	5e                   	pop    %rsi
  3a:	5f                   	pop    %rdi
  3b:	5d                   	pop    %rbp
  3c:	c3                   	ret
  3d:	8d 76 00             	lea    0x0(%rsi),%esi

Code starting with the faulting instruction
===========================================
   0:	ae                   	scas   %es:(%rdi),%al
   1:	75 08                	jne    0xb
   3:	84 c0                	test   %al,%al
   5:	75 f8                	jne    0xffffffffffffffff
   7:	31 c0                	xor    %eax,%eax
   9:	eb 04                	jmp    0xf
   b:	19 c0                	sbb    %eax,%eax
   d:	0c 01                	or     $0x1,%al
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5d                   	pop    %rbp
  12:	c3                   	ret
  13:	8d 76 00             	lea    0x0(%rsi),%esi
[    7.878857][  T112] EAX: f78a2071 EBX: 4161ebf0 ECX: f78ab00c EDX: 00000000
[    7.880299][  T112] ESI: f78a2009 EDI: 00000000 EBP: 57fd1b24 ESP: 57fd1b1c
[    7.881734][  T112] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210282
[    7.883357][  T112] CR0: 80050033 CR2: 00000000 CR3: 17fb6000 CR4: 00040690
[    7.884788][  T112] Call Trace:
[    7.885500][  T112]  ? ddebug_grow_tree+0x9a/0x110
[    7.886521][  T112]  ? ddebug_condense_sites+0x68/0xe0
[    7.887595][  T112]  ? ddebug_get_filename+0x10/0x10
[    7.888640][  T112]  ? ddebug_get_function+0x10/0x10
[    7.890488][  T112]  ? ddebug_proc_next+0x40/0x40
[    7.891513][  T112]  ? ddebug_add_module+0x85/0x500
[    7.892553][  T112]  ? preempt_count_add+0x51/0x60
[    7.893587][  T112]  ? __mutex_unlock_slowpath+0x2de/0x300
[    7.894736][  T112]  ? mutex_unlock+0xb/0x10
[    7.895651][  T112]  ? ddebug_add_module+0x500/0x500
[    7.896723][  T112]  ? ddebug_module_notify+0x41/0xd0
[    7.897798][  T112]  ? notifier_call_chain+0xc7/0xf0
[    7.898847][  T112]  ? notifier_call_chain_robust+0x20/0x50
[    7.900036][  T112]  ? blocking_notifier_call_chain_robust+0x31/0x50
[    7.901380][  T112]  ? load_module+0x496/0x6e0
[    7.902353][  T112]  ? init_module_from_file+0x78/0x80
[    7.903440][  T112]  ? __ia32_sys_finit_module+0x149/0x220
[    7.904603][  T112]  ? ia32_sys_call+0xccd/0x1110
[    7.905619][  T112]  ? do_int80_syscall_32+0x11a/0x260
[    7.906713][  T112]  ? lockdep_hardirqs_on+0xe0/0x110
[    7.907776][  T112]  ? do_int80_syscall_32+0x258/0x260
[    7.908874][  T112]  ? sched_clock_noinstr+0x8/0x10
[    7.909925][  T112]  ? __bpf_prog_run32+0x3a/0x50
[    7.910947][  T112]  ? __bpf_prog_run32+0x3a/0x50
[    7.911962][  T112]  ? debug_smp_processor_id+0x12/0x20
[    7.913105][  T112]  ? get_lock_stats+0x12/0x50
[    7.914085][  T112]  ? preempt_latency_start+0x1f/0x50
[    7.915184][  T112]  ? preempt_count_add+0x51/0x60
[    7.916212][  T112]  ? seccomp_run_filters+0x285/0x2b0
[    7.917317][  T112]  ? debug_smp_processor_id+0x12/0x20
[    7.918399][  T112]  ? __seccomp_filter+0x9c/0x1f0
[    7.919401][  T112]  ? do_int80_syscall_32+0xd7/0x260
[    7.920481][  T112]  ? entry_INT80_32+0xf0/0xf0
[    7.921480][  T112] Modules linked in: qemu_fw_cfg(+) intel_gtt agpgart autofs4
[    7.923058][  T112] CR2: 0000000000000000
[    7.924040][  T112] ---[ end trace 0000000000000000 ]---
[  OK  ] Finished Coldplug All udev Devices.
[  OK  ] Reached target System Initialization.


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260709/202607091658.e03b7a5b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

