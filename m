Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB41CFB6
	for <oe-lkp@lists.linux.dev>; Tue, 30 Apr 2024 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491432; cv=fail; b=jzlKt0YLaVn0rxu9Q8Eb5WjsUUaZ7U21johkSqwfkP+9uWsLt9qXoVFKoR1pxzfZGW3DA19aUKi9SY/osmMMnUpsNrowoPOiLFnsISPPrkZMQToU5VAEgz68GZMytxIGoTVIiE3NsvcfjNprkip4Chf2AASYquAlWe8kySzhpGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491432; c=relaxed/simple;
	bh=CGULLn1+13cESgUsOdzexkXoZEIm/Zvn/XyjBDAPhPY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lhb8P41+B8NfPgdK3jl9Pr0ZGhU2FE/GYIbktyYISIdjVkOJA9ysNc/4kbX3rPTtjYWBHcJyGHdhZXcDpSjG6o+Xohn4ZJbFGMqFkPDTFjG3YkX+xLS73Gu66KRgJVHhkREULKgQiCBqawsEL6Nyaq0bwswKdIU7UaXVeRSCtX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIpDsVaY; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIpDsVaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714491430; x=1746027430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGULLn1+13cESgUsOdzexkXoZEIm/Zvn/XyjBDAPhPY=;
  b=cIpDsVaYcpQMgNTIANqstuivs6s0oYAsPulMimfdvisXHtW/TfHO3lwR
   YPnTSwymop4SdZqyK0gS1orGsXJG1PR71j1qE/1HSSj83ezUx+hz11RXO
   XxXJ++bQk6GIJD9ZLZfvg+BbFz/IFbezJaiXMxmrhuYy7gDO+HHJ9Wrm8
   wKzTLPVgs3HC1YmIy7clhfVeVF+K9RadBupOrbWRgjvRCuYRKO7fTUO83
   BykWSFMjU6f9zgC3CzmEY1Y7sFSKAHNsp9wtO9i/TJSOtttCwNcgj6A3M
   oXM6MWV4xVZyzqvaX0Yq3JrpZOmtZTCz3LPj+W0sVTy5nJEI6SkJI5/me
   w==;
X-CSE-ConnectionGUID: +K5weiekT2SCCLqD8eRLFg==
X-CSE-MsgGUID: c7jo0a+RRt2JoSEEZddONA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10082319"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10082319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:37:09 -0700
X-CSE-ConnectionGUID: tdyZ3yS3SyiA6wqBqbekKA==
X-CSE-MsgGUID: NzPmC0E0TgexZUbMfqoIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31308184"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 08:37:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:37:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:37:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 08:37:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 08:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1+NU0mMV8xZsHcTCdtrDQSmX+WTfAFCJ6nlTJo2qR6ptVBQNuGgBGvlsiN3G1alVBfyknQZqxVg6xB2lW6b6MAK0MnVHSZDckAZzxDtHDYmxMewhJtuqafh7QCwkz8xQCKtNEGR9ly+9eNylCB52V5U7tyUHT8ldbGuUJQFIefbl/SRr20qCK/HZqEFOvs087w3hwl8fm7glFjQEmWKJJ8cCx3t6MRwNTbOEUvKs72bTTgvpT4zdLxp/yuoZt/sckS3Dhhl64QItw6x70vr/N4TlGpYnKHfFvo8s0L79MwPAlYBzfuRZWn3YSew32c912+zYZRtmGUyt4AOckXyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjS5LMQaiq1/wgypU1LT0235UuaFAsaZRaw7hXI7sEA=;
 b=L8JP4GNe9svADfTRnvU29pZR797RBodxFt/fUs3+hgg3CMtlXdshSfvHSjyLzHWzCwvQ4fnywrHhmyth0uCTlEpfIANZ2x7EMQm30nD90ZvSyyKNfkK0+ErGLcYpMIhNAa9aJNdyQ1F1EoyKiHaNbi9ASOs4/7ewahKmMv5cP7zF+UCFVc7rq52jkM2d063FzniYtfj9WyQSVHHS33YUoWbrDd2I8WrNKKwZ8dby3wfI1XglXJhrUI7zat8AXzLg54q0i6gAY1MkfdWQCL0of7aDrob7T0CTc0kfQLck9hRzX+x5wvGuqsaTcnclfbVYUYcsJdsszX0HYRwkLFAjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Tue, 30 Apr
 2024 15:37:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 15:37:05 +0000
Date: Tue, 30 Apr 2024 23:36:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink-4] [dyndbg]  d635e975dc:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202404302341.c696afcb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:4:7c::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: cf42aaa9-ac23-4b6f-c4a1-08dc692b6323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wQpXBkTvjqR45eyCQRY4IS4aJzbFI5adVehm9WXzGaTOLo/U/6Kr3nH8np43?=
 =?us-ascii?Q?MppXBQQ+kTwjPa1NhBH6MYuICSRrViR20i2gK8uK/sNAGVk8dYPO4NR4tQiA?=
 =?us-ascii?Q?pFiGQd8J6fBBPvGn8DxzKWDbF4NyERnqGu2FZ+X2w5+Vw0GTvBre1h4RkYAA?=
 =?us-ascii?Q?BYih9mZmR+vo3lkAz/ZrSAHLkWjBsbqPycFrNWE24ld06WthpU86zhVdHngo?=
 =?us-ascii?Q?PmbPUfxJbiNWOSCUR7prHBKRxXqRdEicSZAvCuVYTRY3V7N0JbouTzronvmC?=
 =?us-ascii?Q?LevqD92z9VV8hWGP2ONRiaRDLzWg211MLjWr1puyXRM06Z66pI5usfAiJjsi?=
 =?us-ascii?Q?UjpokI4vbI5pU08THHWa9EtL0eTaLjxghGIQAEM/3qGvzV1RF3bLczM7U9+n?=
 =?us-ascii?Q?vcYIN+pNy/uq0ScWEefY1MtejGfOeChwmyhLUo2lDEo2KIWD/Z+ccoR2U2yD?=
 =?us-ascii?Q?YHp0rz9ylXtOAN7dQ2xSKW5vHsyoJC2pppZ/WUgM40f9tYAIECwVKT2aU6Ey?=
 =?us-ascii?Q?swwQ46/3RcpapExKLndXBcj9IHitX3WCYc9nUT7CKp6kPXOeu9ESAdRmb/A5?=
 =?us-ascii?Q?xrb0fzOwtbyVmdYSgZaMS+mN8LMZ2uW3V4g26ex6R9eZl58qwhY3hcPSZkQL?=
 =?us-ascii?Q?mx6MDjhAMq27Oh789gRf5INU+vUBWrL/FwvS01lkICqhZqPp0TQybHdZNRRG?=
 =?us-ascii?Q?arIvqI5yk/PV/bh/S8ou8XGvWXSmsYB0qVA8xHfs5wOncCQy0PgekJ1xBsmz?=
 =?us-ascii?Q?vAUGY3raRnAdpHrnMxc8X09xyBVjzW8zuoIH17/JTiWFDjuy0NNcWlb9+id+?=
 =?us-ascii?Q?CCqA5I8sNncNK9qo2MbvQ8wc7KNfYmvLI2smtyZMVc7HOre1hM2ylayzqJPf?=
 =?us-ascii?Q?Pv7zr39c24jTsM7qjhb92AUruuv3uqWLC2JY8BLGsAdBQCVYMAe+78ygVzhR?=
 =?us-ascii?Q?JbPUVH/WPBFzXXGg3fqCf/gM4wwrfWrvHqRLolXKfM//iEoVN6qEUGT1eEDX?=
 =?us-ascii?Q?zYhMX18r5RVYDJvqvCpPCTTejRC8X7eGjEDyoXlQTBhoi+LjvUcbpEsxu9jU?=
 =?us-ascii?Q?BV+bCqFkj+bR7o+veCywALQJ0UY75jobb4HEgwMpDR0VZ4dhCTcZz4aMD+Ym?=
 =?us-ascii?Q?W3oB10WMyiga1e94NaVWATysIncu6Jx7cyc9sBYdYi2EJuhRmZ/wvcfEbavR?=
 =?us-ascii?Q?dO6n6qonC7y0xiZA/sv/vSxDB8F8KEpHNfe4XDul7V803174FShj2vohmIM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjjqLWzZTl12BvEzlKo2wtBo8yai9ZrhyKV2jseO/otLDS802gYCVkW7uu6T?=
 =?us-ascii?Q?Tx+XOguFu/hH2aMvNvipEGaGkwitOWmtoeDMCPaGdzVtanpi9KBkJyUVNdSG?=
 =?us-ascii?Q?RSC4az+UQ7xiIm4uDzOfSwWhxyXwh/Pi6reZbtGIfz79v/9w+pf4kBHTNvLF?=
 =?us-ascii?Q?2CcBnz8dkwTr8vO9v7zA5Pd0dXq/23TSE9Y4hboPiTqfmTXnm3gMV3zedFD8?=
 =?us-ascii?Q?Z72eDQkadwTLVk6HhcBJmhXJOe/cHu9N50gHriQgbnt+yh48Xdlje9PYA+5U?=
 =?us-ascii?Q?pcAgvjkA4PktBbDc58EgYv6ZYxLZrmS21URJT7AMxjlmWj3KWbl3gzbEzSu7?=
 =?us-ascii?Q?J4aZTPZWYQgKpB6iTEh2dn5AHO2V0W/imaR1pWIHI2hWMQRhftC8JPyhKGlj?=
 =?us-ascii?Q?SSyWtm+XVIxXjL9RIOgJM6+yIJHKK082jWLr3s9hVWt8esq45ZvSjonXv59/?=
 =?us-ascii?Q?/bl6Kk0Yqh54QOUkbkPVieuU6m8Y9HYkt7QNkdeJdtbE/xh2DFldAcj1bFnD?=
 =?us-ascii?Q?l5TTqGA9vMI1uK9Lhbo+v6va8rAkXvwSdKFu8djAFEByECXKyuoFHKRx35qN?=
 =?us-ascii?Q?5+DpmwVCa1sSW8Nmz3ezjEbz5J6qmQ7Bjrg2CH6eUDYcKHCdJUqzuEQsI8Rr?=
 =?us-ascii?Q?F5jh5efhE9Woe1+8NUhaNvZFBLrMNwCdpk/pXKQ7NWyko4mU1Fd9QmTsrAHK?=
 =?us-ascii?Q?T9o0qpQFeL+HHVry/gjW2PuYOBECZjY+mITN7tpUJTdsRMbypRBXENZeW8zy?=
 =?us-ascii?Q?1zfLRcFEI9Ou38lLHQea0XIiw0H0BVeOjfk0MuluW8EBD6hcBGHNoAluCZv2?=
 =?us-ascii?Q?WHHi9WysLVgYYRZMGmTcrtRBCe0KJuqIWduEjmAOXki9YsTbPh8LJoDoY8bo?=
 =?us-ascii?Q?eBKyhgizPGHo9XRlZVrSXY+6ZxLqGiUNxOKJHDPc3cFrz0gmLMtUU809CaOg?=
 =?us-ascii?Q?bMLmIR9IJnQ57hSFcHvqKQ2afFn2LI7Z6+TEEHEuyj+gxvOsNFyesXQj8mPV?=
 =?us-ascii?Q?3Mwffh+LHIk8p8yYr4sDb5R7F1qZ0Dho7bspuAV3CC+qxALsijrF8Sya8fY5?=
 =?us-ascii?Q?VMv3S7gKRBEviCUlWeEUsqV1580Z0QghAiYdplsU+6rs4DyssRLaBsplQdmp?=
 =?us-ascii?Q?7FM3wGskuyu52kek2WrZ5OnuAmadmHr5tBJN6amkNW8KovV0BU7KWO39HVs+?=
 =?us-ascii?Q?EWSLpQs51Buw5MYKQ5ykI/2AJG4990mApZYuPoXmrIZGZ/1jVsDYrDrNICes?=
 =?us-ascii?Q?WU9oj0HTYod3Mp4tMrRtDuDWyaHwZGCSeH9E/9SsgvW5b1dkpleLElOre85B?=
 =?us-ascii?Q?oAiSEl/jZ9IpuI3WPrDekWmNKg30EdAH/bzAZnEKUH/+rYeSuNDAzezef+42?=
 =?us-ascii?Q?vGJFZGNSW2RmavVc6+/cUlPHWNxYKs+f1O5FPGZ9uban8PbYPE6otaek/Vi5?=
 =?us-ascii?Q?zEw7vG+/uVO8rJ0RF+AyG8CcFiPcTYlRtVKDP/igozg5uoc8Nd7UQAZj+s65?=
 =?us-ascii?Q?OysU6+jPOfM7NI+nSPoZfEdkcjVgfYMYeAiuwtCV6rniLR8kmVdQ4H1m4422?=
 =?us-ascii?Q?EOvgX6X3Pla6tWt9S/lD8QnYW0kL6Dv0CIlaQBa76Dhrfmx+/bR3L4Oyi24K?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf42aaa9-ac23-4b6f-c4a1-08dc692b6323
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 15:37:05.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8W+kOvXyHLF077PzsvrQ5o6JAYVv0POBA9nXd3VpLCue7Cm/g+80iWzsHB6Fj5fsSIRRZZgrLdi7JJrFzSY8sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: d635e975dc33c767a5b59144ce3993f569b42397 ("dyndbg: prep to avoid using _ddebug.site with site_*() macros")
https://github.com/jimc/linux.git dd-shrink-4

in testcase: boot

compiler: gcc-13
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 4d0c4b32ef | d635e975dc |
+---------------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address       | 0          | 6          |
| Oops:#[##]                                        | 0          | 6          |
| EIP:strcmp                                        | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception          | 0          | 6          |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404302341.c696afcb-lkp@intel.com


[  238.612271][  T359] BUG: kernel NULL pointer dereference, address: 00000000
[  238.612843][  T359] #PF: supervisor read access in kernel mode
[  238.613306][  T359] #PF: error_code(0x0000) - not-present page
[  238.613771][  T359] *pde = 00000000
[  238.614093][  T359] Oops: 0000 [#1] SMP
[  238.614428][  T359] CPU: 0 PID: 359 Comm: modprobe Tainted: G        W        N 6.9.0-rc5-00045-gd635e975dc33 #1 cd26bf5796f45b52d1744ef978c49e829efea625
[  238.615432][  T359] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 238.616214][ T359] EIP: strcmp (arch/x86/lib/string_32.c:100) 
[ 238.616582][ T359] Code: 31 c0 f2 ae 4f 89 d1 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 5b 5e 5f 5d 31 d2 31 c9 c3 8d 76 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d 31 d2 c3
All code
========
   0:	31 c0                	xor    %eax,%eax
   2:	f2 ae                	repnz scas %es:(%rdi),%al
   4:	4f 89 d1             	rex.WRXB mov %r10,%r9
   7:	49 78 06             	rex.WB js 0x10
   a:	ac                   	lods   %ds:(%rsi),%al
   b:	aa                   	stos   %al,%es:(%rdi)
   c:	84 c0                	test   %al,%al
   e:	75 f7                	jne    0x7
  10:	31 c0                	xor    %eax,%eax
  12:	aa                   	stos   %al,%es:(%rdi)
  13:	89 d8                	mov    %ebx,%eax
  15:	5b                   	pop    %rbx
  16:	5e                   	pop    %rsi
  17:	5f                   	pop    %rdi
  18:	5d                   	pop    %rbp
  19:	31 d2                	xor    %edx,%edx
  1b:	31 c9                	xor    %ecx,%ecx
  1d:	c3                   	ret
  1e:	8d 76 00             	lea    0x0(%rsi),%esi
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	31 d2                	xor    %edx,%edx
  3f:	c3                   	ret

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	31 d2                	xor    %edx,%edx
  15:	c3                   	ret
[  238.617972][  T359] EAX: 00000000 EBX: ef4a6a04 ECX: 00000000 EDX: ef4ec465
[  238.618505][  T359] ESI: 00000000 EDI: ef4ec465 EBP: e9953dac ESP: e9953da4
[  238.619034][  T359] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210246
[  238.619642][  T359] CR0: 80050033 CR2: 00000000 CR3: 27071000 CR4: 00040690
[  238.620169][  T359] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  238.620695][  T359] DR6: fffe0ff0 DR7: 00000400
[  238.621071][  T359] Call Trace:
[ 238.621364][ T359] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 238.621725][ T359] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 238.622053][ T359] ? page_fault_oops (arch/x86/mm/fault.c:713) 
[ 238.622445][ T359] ? kernelmode_fixup_or_oops+0x88/0xe8 
[ 238.622946][ T359] ? __bad_area_nosemaphore+0x136/0x22c 
[ 238.623444][ T359] ? up_read (kernel/locking/rwsem.c:1623) 
[ 238.623788][ T359] ? lock_mm_and_find_vma (mm/memory.c:5706) 
[ 238.624218][ T359] ? bad_area_nosemaphore (arch/x86/mm/fault.c:864) 
[ 238.624623][ T359] ? do_user_addr_fault (arch/x86/mm/fault.c:1476) 
[ 238.625036][ T359] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1513 arch/x86/mm/fault.c:1563) 
[ 238.625422][ T359] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 238.625891][ T359] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 238.626306][ T359] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 238.626781][ T359] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 238.627112][ T359] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 238.627581][ T359] ? strcmp (arch/x86/lib/string_32.c:100) 
[ 238.627909][ T359] ddebug_condense_sites (lib/dynamic_debug.c:1448 (discriminator 1)) 
[ 238.628326][ T359] ddebug_add_module (lib/dynamic_debug.c:1492) 
[ 238.628714][ T359] ddebug_module_notify (lib/dynamic_debug.c:1589) 
[ 238.629116][ T359] notifier_call_chain (kernel/notifier.c:95) 
[ 238.629530][ T359] blocking_notifier_call_chain_robust (kernel/notifier.c:129 kernel/notifier.c:353 kernel/notifier.c:341) 
[ 238.630017][ T359] load_module (include/linux/notifier.h:208 kernel/module/main.c:2791 kernel/module/main.c:2972) 
[ 238.630383][ T359] init_module_from_file (kernel/module/main.c:3175) 
[ 238.630796][ T359] __ia32_sys_finit_module (kernel/module/main.c:3191 kernel/module/main.c:3212 kernel/module/main.c:3195 kernel/module/main.c:3195) 
[ 238.631225][ T359] ia32_sys_call (arch/x86/entry/syscall_32.c:42) 
[ 238.631601][ T359] __do_fast_syscall_32 (arch/x86/entry/common.c:165 (discriminator 1) arch/x86/entry/common.c:386 (discriminator 1)) 
[ 238.632021][ T359] do_fast_syscall_32 (arch/x86/entry/common.c:411 (discriminator 1)) 
[ 238.632411][ T359] do_SYSENTER_32 (arch/x86/entry/common.c:450) 
[ 238.632781][ T359] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836) 
[  238.633177][  T359] EIP: 0xb7eee579
[ 238.633489][ T359] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d 76 00             	lea    0x0(%rsi),%esi
  35:	58                   	pop    %rax
  36:	b8 77 00 00 00       	mov    $0x77,%eax
  3b:	cd 80                	int    $0x80
  3d:	90                   	nop
  3e:	8d                   	.byte 0x8d
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d 76 00             	lea    0x0(%rsi),%esi
   b:	58                   	pop    %rax
   c:	b8 77 00 00 00       	mov    $0x77,%eax
  11:	cd 80                	int    $0x80
  13:	90                   	nop
  14:	8d                   	.byte 0x8d
  15:	76                   	.byte 0x76


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240430/202404302341.c696afcb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

