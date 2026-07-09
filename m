Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1373E9C2D
	for <oe-lkp@lists.linux.dev>; Thu,  9 Jul 2026 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586901; cv=fail; b=hiBua+QAn/ydgu2SHvuXim5rKL+ErZv6jr6qXsrPpAymNDgxgcmXurngUnlg0C1I4MYLUqG894Rh1dyvwbn8sssjLKwWLRUfHQ2wmiUkNAXXkf6TMT8F+XRynG8zOcyeln9K7tutOlL8HBE3jdpUzcPCtPL6a4dpqoFXpiGJ6cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586901; c=relaxed/simple;
	bh=T9CC4cpJ1BJ3HBsVmpA6UjR3ljMSQnIZlgK/vYH2ZcE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JKRs4GiWHC8I7NKWqRpnOIqX51xWfbEXRX4YbXSoBLuq80xXYeBx+cwFLkWQ2e3zhHhcbCYF8Rcdg5jaCXWS9cFx7M8s5T+mKlCToJd+KOwuX98+nHK226coThViYnoPjA8GwzsomxWR3qHXznf6z4L5r3RnAKdv8tmkKj1Al88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfipJouZ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfipJouZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783586899; x=1815122899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9CC4cpJ1BJ3HBsVmpA6UjR3ljMSQnIZlgK/vYH2ZcE=;
  b=FfipJouZHgM2Tpc98ZTg9nnCz6kCz4SXWtRrS+KtQhugN2WaRFnSeOAn
   fAn+h22yh5oamibh5yAfHmwG6PX0ek86pzV8FuZofKP8YtbCvkj8O2JOb
   iQHIrD5cwULdz8tgIDMED8j5Q4Y3VZQOCBm4dDaEcqjRujVtECDpp/TM7
   UUi1Ytn7vAilYwP+eaaTUj1ru3gMJ4TH8FyPlVBP+f3WWYkmBhZaH2Cab
   QE69ExcKCS1y4IVDyXjBl+Lh3c91ifPChl38kwQn3a5DYy4rMrGVkmP/K
   xpOUIOgXOndVsD2tMoE939lnC3V7m/FyPTvO/2SUIrLeZ8SWeIfW9QVD5
   w==;
X-CSE-ConnectionGUID: Eh4Dh5WKSFqGScQtmnOw8w==
X-CSE-MsgGUID: xszy987NQN2RB5y906pP4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101809174"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101809174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:48:18 -0700
X-CSE-ConnectionGUID: s9zAKyWGS0mGV0u3nWWIvA==
X-CSE-MsgGUID: AC2mN0BjRGq+6kkucdoTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250542291"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:48:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 01:48:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 01:48:17 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 01:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJvnSHuW2EIWay5McPQq/ezWArUG/MIoq6NoQoMQUPVRzHjs/SuBLPQOox2AFT/dg9rNuyPWnhx4bLaZwiTutAGNNKOCOZnmAzysTG6IE3qhgRHsIwynSBmrhsnVzmyjxDahZO87Lw1JcVYS0A/zV78Df9N/1L4JzgK5sGo5IqJgPoM3MRKD15Kr0e2CZUwAzsOguc6RYLGdYeOrAy4RgCwDOAoAYrcis5Tw6Bv9vMcwsJ5jq02nveYtPmR////fk16mULcvA1xFsw3YewsfaITVcSuMGbcLftJvbnt1JtmH3M/bHAHTnVd5r0teLDqAZxwketqQMNwWfKPxL8ktyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQkfKqZNQNd8ozLeGUiouZa6u7qERHyCDLPAVbelYeU=;
 b=VeKdSzlThCUmu5frpVoOA52sGjzQgYqiwWMaaZ1HifwlaTm9UMYZsAMHgCtZqjYZ1cWsQossFZDuSgw/zxu22xtywK/QQWgn4Jit3NPzsjSEgCaBBCoxgwq2w9oNW6vTlcfVIA0HOGLDRSgvojMj59ugvRpXQgbyGkj7e5KGvh2nmtzz2ROipw7kPDP+bTqdWNkbQN/XsNeHrYTV2MTSrch6CITS3UbodtNVAfQkRpauMCACfuUz94C9LCokg9050QNmaUMYpy9KDTtxhR2p2LKIy+GvhkihOX6ZMBDdgGe8jIjne1+8Bfu11km/8BeuYFRv06ZK74RQwhgj+kIkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM4PR11MB6383.namprd11.prod.outlook.com (2603:10b6:8:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 08:48:08 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 08:48:08 +0000
Date: Thu, 9 Jul 2026 16:48:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Harry Yoo <harry@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Danielle Constantino
	<dconstantino@meta.com>, Shakeel Butt <shakeel.butt@linux.dev>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [harry:kmalloc-no-objext-rfc-v1r1] [mm/slab]  6bc21472e7:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202607091002.cdfe5a08-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: JH0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM4PR11MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: a282a028-c8df-4a49-533e-08dedd96cc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bxCTtrgN5d2Xx244B4A3oN95nE+E1scgJA5JnAlyKM1687Qs8FrB0MdkH0oHIZCDU9DuZUx7AI9FTEOkcYAKIguXveobMxcEAcaVtu4gbNcsZDbGlT2T2E4aJZIHPT2uP0Pizhi/PPJdGVTHc9P6soVTa7B0wu2CWW+/U5ZIMVsRhPaLk3V0zNPSRmVNST0zZ5UU47of0okBgKxw8WWugXrWIvfCFQaaINhaQbi4p5eq+HEFTF6uAE0ulexSl6wqukVnhGbCm1LjUjT2IPPq66X+DyO6/B5TsjLeiZWIDMkK/UtzT2WYt2tT8WUeRoOJ5u9QVV8LZvXB61ORjEl3Y7tACrVfksLJGkBCleumxJmhPEj4avZAx4K8Dafau66FaOVLWY72lgW0nvFhOLv+6poPUetrTX1/CXEEeM1YUBIxITFIbiKnlryPgtTzSgdnQvjz+ookERUYFjkCwOeAlUpBqicdi1FvsI14B+Y9DjuN3fnLNCw7RbI92a4Cv38VNFzPYsr7x5vFlI+VZHrAffpM5CbSHGRaHNaccFLCo98be35o7RQGNjjNEx2gEfxgVlYf749BW6QKHAwVcmIxv+CMJX1W1tUwNAzDTiPF0W0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/wvC4gkRn17FyAda87BrrXWv6M4QzfDx39emeaUtV4pqDbmqFZ00eufnUI0?=
 =?us-ascii?Q?EAo8Mde7vu8LVJQYWZskjCkKJrjm2yse7U/lbsscEY4NpT/X0kiFRMGrMbWz?=
 =?us-ascii?Q?+eld+8PQ5M0APRtyOM/c3ma7iRQHcrqwAz4Caqd+LBMtJ8FgA/CegISzeDM/?=
 =?us-ascii?Q?JiuwVJLqDpJWN0cIrCwmH/zLOWjr0KfkZ6g6Gu70YJ0ebC8y7Owc+TXm82mc?=
 =?us-ascii?Q?1xusntARlzS2+YQprqkRU5PaLke222FRBSkZ+kDkPynhV26SzrkuHJG6Uk3O?=
 =?us-ascii?Q?szwm7X6E7tfxDbGKylYhf/91Y2DLDZwzmCTFq/r9tEEtxgGcePO3NUcXh86m?=
 =?us-ascii?Q?pxhVchW5lAWXDlw64ku/LMTmWn0FDHLzMuXQYYapolrwGsMTtUUbniohtgDP?=
 =?us-ascii?Q?SZyL2HIeMRqN5MuazIGbBT8QshW25nOXZ+H7hykJ8LYgTQowxolBGASkW0Sj?=
 =?us-ascii?Q?FJTemSwtELJL6Y2hIFG/V8We8q8kQi3qpasj20ILv93FcZFs+5LgG4IcexnR?=
 =?us-ascii?Q?lSdpTMVABaIwiEfLt3OAanP9KS2YVOsQdgvFEfk0CLAgEZXOEJxmueveNBkk?=
 =?us-ascii?Q?IYvgQ0E6f+pbhWsWyDhl529TsMWPYTPP9ZSqjxDid4JoeLYnqtoXAvA8XwRK?=
 =?us-ascii?Q?Ng8Ae+cg7NBZ+mOkfka8QthIJQpnZ8ZvtdQWtZPNUP+kAkOfNwDcvjbGqhFT?=
 =?us-ascii?Q?K5JxpQatDagUl2OGpqHUxb29KKBbv+cF00XO5H+lKRVNGfoZGlfMIcSuukR2?=
 =?us-ascii?Q?yhsn+oCTmNlhWKo74b8+wVa9qhKovMdNiT0jQ+k3jYQ+cK5VcvYi5gJexSW0?=
 =?us-ascii?Q?6LXGfG8BYuTpp/GCNI1QIIQScBG+suWvqs9frJQh7nFuBCv0kWgOOcX5y4pg?=
 =?us-ascii?Q?XNugrCL0Gr/XrmaUHhdhb8uYYuBHFGHNC/I90vQeJcnnQKX/t/fC0e3GGGp0?=
 =?us-ascii?Q?mqoWKfsh3kGhJyh2xKkx7r1imNOssKlp3NeoiHwMoBDA3ErGFPK5EUJwykME?=
 =?us-ascii?Q?ifU+Un2dIBPnEfxYapGBIf6R74WDM4e5eO1PsNPL0GMtmYLdWffzsyyOCsku?=
 =?us-ascii?Q?+LnflXDI8IFli8ohnym3hper8DKJ5lczugF0c9wu/WbTDKgHPUXytymtFT2D?=
 =?us-ascii?Q?I21dPPVnTev8pf0lI/A/Bj6LISY55o6KpFhMr4/s8Iumu/5eyI9HimhMs7qZ?=
 =?us-ascii?Q?goow7BebhpWuNC+rBPBwJ6H/Rae3YWBGqNRbs96Ial6ZtHYSgNVQ9g4LZD7f?=
 =?us-ascii?Q?TOcnYMWsLBLiDvaPY/4INZY1xPB8AQAixJvmzeJn/5ql/g02SWXmX+ka9KCJ?=
 =?us-ascii?Q?YSJoGpS1mwHV7fIrB3f8nPGAGZZle8JKD8IKXbx31G7ntOanAidJI44/CDDS?=
 =?us-ascii?Q?OcHXiGPNuco9GVTTX86A8wa/P0PHzLF/GgisWv4NMAqhbkocOKDLmhZi9F3F?=
 =?us-ascii?Q?hBzyuMzzZQ+tC3GWzW/JkThOboRcZRJWt11/8vHTZUVUkJO0Hdn8bRlWQcLN?=
 =?us-ascii?Q?cNqTzcQ790mea0yPwfGJzKfMeSv48uAwIaNJw0Ouf6WJT29FRaCay7XOM1DD?=
 =?us-ascii?Q?euZhmA5JJO0WLMqx/3KWkHeYFehMPKFx7Oik8R0PmWv7w7FfAvdquo2YtnCu?=
 =?us-ascii?Q?WDE+ZuzwJM5XS/t5OuESFzTeXNYXICULjuiXh/jbE8P8/2aObGxtqDF8pSKN?=
 =?us-ascii?Q?D0IprXjaFdm/Pj53EHeqi+qRIZHQuEhzLLt5Uz4I2vduEIpRrZRMrdkYgqLN?=
 =?us-ascii?Q?Aklw9pBwiQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Kmyta63dG6WCAoOBuG/YHHaPLpbXBN0TlLrRNg2hN1/z9CGPUGfAObH5vKSnqX3ah4yh+yuetLq/nXUfsMNkxIevgS5MY8sHQVqlgK8j2K7THpPePjB+J1ngEt/XStVo8uXHyzCXqaXkYyCEwoCu+7mfR8IRh2FhGIxqIlkdFuDugMh7p/0YYYhPYhNXkbgH6jEzbYBG7Yuu9GtDSG7L7hvIOY9Za1atKuoO+WBGWMS3hiNKXe4KJqcwzcKf+9tvI+Gg0pVlVCcIlJdQiALkOVsXlbaw+I/SwtegyqPqJagNtMmncAfCbrc+lKKZQmzfvyj0HvpxHhJng2p5uWCFXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a282a028-c8df-4a49-533e-08dedd96cc8c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 08:48:08.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFjIvZvJdMa/832UfykpRgZ2vceNVbXUONo7rnPrriBWdp1dXYy2hROUdwvZmgD7plRRPfMnB6oZHUvVoRoYxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6383
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 6bc21472e7eb9f8c771ffdf86266aa6d9dcb1dac ("mm/slab: prevent unbounded recursion due to obj_exts in free path")
https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r1

in testcase: boot

config: i386-randconfig-2006-20250804
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607091002.cdfe5a08-lkp@intel.com



[    0.183091][    T0] BUG: kernel NULL pointer dereference, address: 0000000c
[    0.183772][    T0] #PF: supervisor read access in kernel mode
[    0.184312][    T0] #PF: error_code(0x0000) - not-present page
[    0.184851][    T0] *pde = 00000000
[    0.185186][    T0] Oops: Oops: 0000 [#1]
[    0.185561][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.2.0-rc1+ #1 PREEMPT  27a7cd77b6ab41253c0455bf8bac7f75db905e14
[    0.186647][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.187601][    T0] EIP: __kmalloc_flags_noprof (slub.c:5311 slub.c:5506)
[    0.188122][    T0] Code: 7d d7 00 74 0a 84 d2 74 06 31 c0 89 df f3 aa ff 75 e8 89 da 89 f0 8b 4d dc e8 47 28 00 00 59 8b 45 e0 89 da ff 75 0c ff 75 dc <ff> 76 0c 8b 4d d8 e8 00 da ff ff 83 c4 0c eb 16 8d 45 e0 50 ff 75
All code
========
   0:	7d d7                	jge    0xffffffffffffffd9
   2:	00 74 0a 84          	add    %dh,-0x7c(%rdx,%rcx,1)
   6:	d2 74 06 31          	shlb   %cl,0x31(%rsi,%rax,1)
   a:	c0 89 df f3 aa ff 75 	rorb   $0x75,-0x550c21(%rcx)
  11:	e8 89 da 89 f0       	call   0xfffffffff089da9f
  16:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  19:	e8 47 28 00 00       	call   0x2865
  1e:	59                   	pop    %rcx
  1f:	8b 45 e0             	mov    -0x20(%rbp),%eax
  22:	89 da                	mov    %ebx,%edx
  24:	ff 75 0c             	push   0xc(%rbp)
  27:	ff 75 dc             	push   -0x24(%rbp)
  2a:*	ff 76 0c             	push   0xc(%rsi)		<-- trapping instruction
  2d:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  30:	e8 00 da ff ff       	call   0xffffffffffffda35
  35:	83 c4 0c             	add    $0xc,%esp
  38:	eb 16                	jmp    0x50
  3a:	8d 45 e0             	lea    -0x20(%rbp),%eax
  3d:	50                   	push   %rax
  3e:	ff                   	.byte 0xff
  3f:	75                   	.byte 0x75

Code starting with the faulting instruction
===========================================
   0:	ff 76 0c             	push   0xc(%rsi)
   3:	8b 4d d8             	mov    -0x28(%rbp),%ecx
   6:	e8 00 da ff ff       	call   0xffffffffffffda0b
   b:	83 c4 0c             	add    $0xc,%esp
   e:	eb 16                	jmp    0x26
  10:	8d 45 e0             	lea    -0x20(%rbp),%eax
  13:	50                   	push   %rax
  14:	ff                   	.byte 0xff
  15:	75                   	.byte 0x75
[    0.189928][    T0] EAX: b11c8b96 EBX: 00000000 ECX: b18bdac5 EDX: 00000000
[    0.190574][    T0] ESI: 00000000 EDI: 00000150 EBP: b1e17df0 ESP: b1e17db8
[    0.191220][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.191925][    T0] CR0: 80050033 CR2: 0000000c CR3: 0253b000 CR4: 00000090
[    0.192579][    T0] Call Trace:
[    0.192877][    T0]  ? alloc_from_new_slab (linux/spinlock.h:408 slub.c:4416)
[    0.193350][    T0]  ? alloc_slab_obj_exts (slab.h:39 slub.c:2149)
[    0.193823][    T0]  alloc_slab_obj_exts (slab.h:39 slub.c:2149)
[    0.194280][    T0]  __alloc_tagging_slab_alloc_hook (slub.c:2329 slub.c:2358)
[    0.194833][    T0]  alloc_tagging_slab_alloc_hook (slub.c:2381)
[    0.195372][    T0]  __kmalloc_cache_node_noprof (slub.c:4596 slub.c:4893 slub.c:5482)
[    0.195903][    T0]  ? init_kmem_cache_nodes (linux/slab.h:1192 slub.c:7732)
[    0.196400][    T0]  init_kmem_cache_nodes (linux/slab.h:1192 slub.c:7732)
[    0.196882][    T0]  do_kmem_cache_create (slub.c:8646)
[    0.197354][    T0]  create_boot_cache (slab_common.c:717)
[    0.197788][    T0]  new_kmalloc_cache (slab_common.c:735 slab_common.c:996)
[    0.198237][    T0]  create_kmalloc_caches (slab_common.c:1019)
[    0.198701][    T0]  kmem_cache_init (slub.c:8555)
[    0.199125][    T0]  mm_core_init (mm_init.c:2728)
[    0.199533][    T0]  start_kernel (main.c:1034)
[    0.199939][    T0]  i386_start_kernel (x86/kernel/head32.c:79)
[    0.200368][    T0]  startup_32_smp (x86/kernel/head_32.S:292)
[    0.200791][    T0] Modules linked in:
[    0.201141][    T0] CR2: 000000000000000c
[    0.201513][    T0] ---[ end trace 0000000000000000 ]---
[    0.202004][    T0] EIP: __kmalloc_flags_noprof (slub.c:5311 slub.c:5506)
[    0.202522][    T0] Code: 7d d7 00 74 0a 84 d2 74 06 31 c0 89 df f3 aa ff 75 e8 89 da 89 f0 8b 4d dc e8 47 28 00 00 59 8b 45 e0 89 da ff 75 0c ff 75 dc <ff> 76 0c 8b 4d d8 e8 00 da ff ff 83 c4 0c eb 16 8d 45 e0 50 ff 75
All code
========
   0:	7d d7                	jge    0xffffffffffffffd9
   2:	00 74 0a 84          	add    %dh,-0x7c(%rdx,%rcx,1)
   6:	d2 74 06 31          	shlb   %cl,0x31(%rsi,%rax,1)
   a:	c0 89 df f3 aa ff 75 	rorb   $0x75,-0x550c21(%rcx)
  11:	e8 89 da 89 f0       	call   0xfffffffff089da9f
  16:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  19:	e8 47 28 00 00       	call   0x2865
  1e:	59                   	pop    %rcx
  1f:	8b 45 e0             	mov    -0x20(%rbp),%eax
  22:	89 da                	mov    %ebx,%edx
  24:	ff 75 0c             	push   0xc(%rbp)
  27:	ff 75 dc             	push   -0x24(%rbp)
  2a:*	ff 76 0c             	push   0xc(%rsi)		<-- trapping instruction
  2d:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  30:	e8 00 da ff ff       	call   0xffffffffffffda35
  35:	83 c4 0c             	add    $0xc,%esp
  38:	eb 16                	jmp    0x50
  3a:	8d 45 e0             	lea    -0x20(%rbp),%eax
  3d:	50                   	push   %rax
  3e:	ff                   	.byte 0xff
  3f:	75                   	.byte 0x75

Code starting with the faulting instruction
===========================================
   0:	ff 76 0c             	push   0xc(%rsi)
   3:	8b 4d d8             	mov    -0x28(%rbp),%ecx
   6:	e8 00 da ff ff       	call   0xffffffffffffda0b
   b:	83 c4 0c             	add    $0xc,%esp
   e:	eb 16                	jmp    0x26
  10:	8d 45 e0             	lea    -0x20(%rbp),%eax
  13:	50                   	push   %rax
  14:	ff                   	.byte 0xff
  15:	75                   	.byte 0x75


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260709/202607091002.cdfe5a08-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

