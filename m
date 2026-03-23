Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75D223DFB
	for <oe-lkp@lists.linux.dev>; Mon, 23 Mar 2026 02:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232907; cv=fail; b=K6/wjjzxCxjTKMxIJoJ38+Pth7U1T35KmiidGq62vJS9uZNn8qjefIT3rRz3z13CJytngTI4E/Msst1dQXL/DB7ahGk7O1AXFtJBMY9JwWYxUIMMzWvc5AV1l0MLP65B3JVKkcEJbVPRxzwuYtMYWX19I3l7YMYuNyWtLme1u5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232907; c=relaxed/simple;
	bh=gg8wBIR9KouD9tkMhTjiRIkyyJYwwA77U8HY6goDDpE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XYCO3je/QSfm25irRPmLQ3JznRUZsINwSh6C1Q0/KvMfJl+VRo65yk3yVCux1L3nwl5giU64ija7YPZV4Vfvq4Guux7th4ZgmrYxph4DYpwAgcIFvTyc8yYy7zknTt19Jg/pGEhUreGM1SRjuGCmQ/wxVkNH67eCzRdEMo5F+BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8q/FXSr; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8q/FXSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774232906; x=1805768906;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gg8wBIR9KouD9tkMhTjiRIkyyJYwwA77U8HY6goDDpE=;
  b=B8q/FXSrT1FkT8QjQqquhYEm361RX/pWOajzwzwvCghVSC2oH/sECS/W
   YXG7tG27RHK0+DjTfhgv+BCIQHHNYc1e53W5ufd75giQbVcrLoSZKvfj7
   wlWXG1B4uMaWpfRBNruX9z9+0gGjvpSCCT6kFtK24HoN7Id0ZWD5XFbBb
   K2Mquoa5HqFwSCEc/3s1FEbJIvyUHnZmdMJocIiaV68GCa3DbKEolMzDd
   nsxZzFZeJH7fkim7dmIZrn/FLhlkICscsheBUJZFksJojEgi5lb+w5Adt
   IuVXZZdE+AYf1gyUbSvev+HAErLj/2xWIIOxxtyirvB+e669E8m5GQm0J
   A==;
X-CSE-ConnectionGUID: zZwZ1pwNTzCG+xtXeEIxeg==
X-CSE-MsgGUID: I/7NdDS1TqWXwitPP6k3gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75196881"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75196881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 19:28:25 -0700
X-CSE-ConnectionGUID: 0R4Oox1jSYyKag4fCs79Sg==
X-CSE-MsgGUID: j5OCNpgbTzeEunyZVZqYGw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 19:28:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 19:28:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 19:28:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 19:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5NHxDJp5sj/WTOWk9GAW2x0Od1jRaIk4dTR7hwVOt00wNcFKthstet9Lw+/K376atSIDFxGDrOrGcDqfeXA7Cb/FAdkW2+UGzRFNCRO6K5OOaOWPhAA4/+9S48DhlSFA6jE7CtDrUrRQhOfoNtOKA95cx4051r3m+RnP4uI7wCPlgcmM4AoNJYuTbOyvBllhs0ivTJbE0y5O+Ub+e46dLz9IGg+gmiMCEHVLb9/T6RVvjhI9C3BAYfWmPE3+/KpdqyuKqUUTkOeO0Rw21bcjDLXBQiD3c9AuIm67F1vD+Mr2vTJ5kCHaryp2U604kfpo/FKq8Ei2mivEglvMy42Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD5jiBLclCRVcL9zUhj1JEVMPEPnCI1wmqYK6y9mqnU=;
 b=NJdFtbrdUxRNUIZ1HDS0iPk1F7AGWzoXCKW6vuDfsqIvKuDnBfsiPNJFQfw55dGIq/OcaFHPWH/SoF3JUdrTdta6Jy/yw/XyqSpWKZ1AFGNmh10IFAZXeDODruu282xMps53kY6os2xpyubhiCnDKIXceCAOsnVmCKB850JNZ9U7DhnEZ2zqxQUWHfP5dTQE9em0e7Zp0Uot2o9GjtGJOEG6DIL1iCLUV0qo+jxdbHdoGPHTGEXi1i89TqbNjey8A4isypm0QTyasFD9X/cIiQH91Z/Pnbm09SnxDdMdWaa2FJJWw0CXqWqQ00R5exJaWJ8ny/lspXeqnehL7t8NWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ5PPF6E320AF71.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::833) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 02:28:21 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 02:28:20 +0000
Date: Mon, 23 Mar 2026 10:28:12 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [rppt:free-late/v0.3] [memblock, treewide]  bbe3478393:
 KASAN:use-after-free_in_memblock_isolate_range
Message-ID: <acClPFM3R6AnfFvM@xsang-OptiPlex-9020>
References: <202603200841.b2d24d21-lkp@intel.com>
 <ab1MfZARoEV4scVe@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ab1MfZARoEV4scVe@kernel.org>
X-ClientProxiedBy: KU2P306CA0015.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ5PPF6E320AF71:EE_
X-MS-Office365-Filtering-Correlation-Id: 946b8ae5-12da-45fb-b931-08de8883d916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FjZtxrw46pl7qL9kQfTLecNruG48jW1Erdle/oCKFaj8x5KAYwo8P81QkhPJtXS9zlb2qFh2VXJYfPDCF8IwMpy61Dth4QxCMZnWCtkpQSA3VAOVaNoVdX8h699batC7gSU9l6XdBvPu8zI3Tr7IEwlFYfglyJtaw3c98x/5ERcYXT6lpFqtHOPRoPKvirPEY/SPU7aZfCOs5L8gWdLEr6RK1BbhLQe8Lkz9l2B/+px45tLWAj6nRr93GTFFnwpQNVwGbF3qaiw7S+8yOQ2zLxUEdoSv7tgNkcv4peC67jQ3MlI6Zo92lJgHmLTP76/GFrod565C4XqD57ku7KiK5RQfgv/s67deMZSM6j18CGCANbcXvlF4E54Ep2vo/EGRBOXcRp9vCOdzAUS8AwcaFlyZRzT3kylr3UAcPOYJ7UcOh30blkiTqQdP751B+rhjPXxgED6Tgdnx7oJ8RTCJW1hgkyOAgfyS9lJ9Usooyo+iauDqNPMzD/ssBUTgpZyQbmEV3S+2KODR4mIaAdYsx6D6tAqmYr+YTI9+obzWsSgr5N78TbaHYc8aHNin0XuciXA26DRZXJ9Yzg2IJgtQ7dLSU3IZGM8zPfWBdYIG1NC5Euny3NKyi2bdzy6dRWwWWFzMsOsb5K2Vn2X/fqQe1e2YRBT5zCNP872vBvxI7pyQ+ic1i0M46BU/6UjaACfc+8RP0sJupgJzZKC5grQl80rw9iSajXKTVIUXo4rX1n+4SmZjfucJA5LGDOCfBRBi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DiLEKwsJ9UlLl/V7UnPfCXp+EtCplM9IzoryqKBbsv+2zPPWXozuHHNigTwN?=
 =?us-ascii?Q?XiW8eTHMBTYeJKuukFGCF4qk9PU9xFnJ85OgPxquH5xW/SVhGmFe4EBftTXr?=
 =?us-ascii?Q?ZM1Ns0WpTry6FS+R6RLvOJHQowAVGmc0ClYbNh7c0Lv3V67MMbg4m2YcoWtM?=
 =?us-ascii?Q?SrFLSWEPCKGMImc8BdggwxekXmMGnce4DuEf4f2WBll9BLb8yXfAPVc8sqAq?=
 =?us-ascii?Q?kfy+oxizew60R9kP/yZzgtxyziVXya0iaB9tYEnbbtMabGpXfUuyS+S4kixD?=
 =?us-ascii?Q?29O8+eLWTkTA28VBPB0Gxeg7duhWq0hUer+MYdLFnWMmwQS/LjEjwyq+4vTF?=
 =?us-ascii?Q?K72hvmFKC75PKtvXnmZYJW19PnsRA67jYjjqSQtyTVP39R5rnND9sqa84mAH?=
 =?us-ascii?Q?FE9jLNWK7+xGqb2MjyBGynZLju3kmdDvaKtZdVvjKKpSHmWkxWHUUFjAFuE3?=
 =?us-ascii?Q?PgawbaVYUMSHrrmQLLBGTrwrqG85t0gpz07Dni55Vvqxi8qP7faHFlzYrr5J?=
 =?us-ascii?Q?zlB1lr5pnNorzYyzPaiohl8jlW7VCXtyq0Hrb29r6PU7a9E/KfaLpi2+aXsP?=
 =?us-ascii?Q?tlcpwqEPnGLYWP3rTKBx1hsvFVZUbwxE4xgZbR0UIv3+PC8d1mt6h0X0KLEB?=
 =?us-ascii?Q?dc3JsYepvG8PDnat4qM14AuqwrpqDRL8DrELQytToe38cassk8yxn3rRTVts?=
 =?us-ascii?Q?2daR36t6yDCcBnmxZOyQEf1PQ564pTjn6HZBXggonj7TLEVy7QE+CJiUo4rf?=
 =?us-ascii?Q?FxNXknG+J3BmiGcvChFZWuMMZ5gIiGbzrjRqMgEiVKE2LcEcexdP/lvxS9nA?=
 =?us-ascii?Q?T4By1EN5fWWA2+tXlGn/H4aplPSkqFIff3Lv8gceRrLBLJbI2CyFRgpCr56k?=
 =?us-ascii?Q?3AApDQQErucqx20cu/claPrmtxUFE+Xwdi9kVv5U6yVnKxtT5ghAFf4hOaBO?=
 =?us-ascii?Q?9HhOpnfJYjqlfXMhaGDfPGfD/X6rvzBWKhpG1Jk33fE/gdDS1BqHz/7KpHMR?=
 =?us-ascii?Q?+SiNz/QAh6KybHd84XQGWW0acThIxEM/VVHaUc8ZkurX1H2ddJtB84ItOm9y?=
 =?us-ascii?Q?LcuM97XaF9EKnPCZ41/ovS0XQoylytfo8ObBcDLhQ1UGn0kykHeE/dTztElG?=
 =?us-ascii?Q?EApRFD+Sb4KdntYAk67hFxM6drLa5Jq0is33Ig1mskhUl8HSUqfW7NRDtHMC?=
 =?us-ascii?Q?JwgVVpaO7vUiXpxaNFI98PxWLbGV3eJQwwc0+RLqD9JLUAgMnSa9ChAAHoWR?=
 =?us-ascii?Q?ckdBOctA+nRaJ8hbgUffj7YwDjd+LkYpPNbGLAoKClTKxOHw85n0xgO7u8+4?=
 =?us-ascii?Q?p2tAagK7fF9NyNi0bnts5Ipe5BL4pkRRYUoWB0gwjltyKE4h+WWtvYWHeZyN?=
 =?us-ascii?Q?08J8A9+wvyahtjRnrKkQYVUz292kV+lzhOAqFh1UuFoV7LQs3BFrlyWnT94L?=
 =?us-ascii?Q?285w2nrmKLs94f0O/c4BPsNw9BJTwRHvbhDXuh0Y2vTnN0jBCWs+q7bOAmwr?=
 =?us-ascii?Q?iwHF/YiIdRKbPYj429sXtqmD2g8Ofpl0791WdsuQRjpNT1kzmCnBmJ1kh5sf?=
 =?us-ascii?Q?EO4Lsz6VZtKZx9im2Vp0XLuKl+RxxtPndt1OQQpdAiLYytkeibinenHrTlNQ?=
 =?us-ascii?Q?FhcHcp0W8HBgeWWfSI/cG2yuebSKyoXjWE5a37Q8inccqWAhnb9mEuaES3gk?=
 =?us-ascii?Q?1WqV8p3usA+zKlNtwRdvP3ogKaJHKFcUMpJEPVBOwEuuH8nRc4pIRyGEDuGK?=
 =?us-ascii?Q?SPThm69Brw=3D=3D?=
X-Exchange-RoutingPolicyChecked: gYLLjpynnrWAodQsUyG7ouNitBROs8WBfiTbGd/FHGyCTnlfl2/1k31qs3IhPgKUbiMx9fgfL+JwIVQNQR2BHFokJg8CopCea5kVL1+Y2sltg8yRHxs5224ETCmHeQLgxa0u0PDu+xsVhouSb/TCR2CD1B9mi4ZSb7F+iH06/XsYBedtHObX/K8GZ2NehPA4UDXxh8qYrML9grx7vf6ecc63II3ZVn16PL0FuiB4NR9ozb/7HQojBwH0lOn6Pz0C84W2JlCubB9Mf8CmWyprCQBynNpl/yUgt9xhJngHHpCZngkEVmWE8fkflkJdIbtDbK/JUPVbJ+oE+xTdG1wd0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 946b8ae5-12da-45fb-b931-08de8883d916
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:28:20.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxotrYJy+XdY5/OY0y3dYsl9jvuRpOLxyK9/UA9C5YZR3DuhaUkPc/J15gBQK+4KutmVVTwMhjnM9WPRkVxTjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E320AF71
X-OriginatorOrg: intel.com

hi, Mike,

On Fri, Mar 20, 2026 at 03:32:45PM +0200, Mike Rapoport wrote:
> Hello,
> 
> On Fri, Mar 20, 2026 at 03:53:54PM +0800, kernel test robot wrote:
> > 
> > Hello,
> > 
> > kernel test robot noticed "KASAN:use-after-free_in_memblock_isolate_range" on:
> > 
> > commit: bbe3478393e135e2fc98f32fa8ab182de6742136 ("memblock, treewide: make memblock_free() handle late freeing")
> > https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git free-late/v0.3
> > 
> > in testcase: ltp
> > version: 
> > with following parameters:
> > 
> > 	test: uevent
> > 
> > 
> > config: x86_64-rhel-9.4-ltp
> > compiler: gcc-14
> > test machine: 22 threads 1 sockets Intel(R) Core(TM) Ultra 9 185H @ 4.5GHz (Meteor Lake) with 32G memory
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202603200841.b2d24d21-lkp@intel.com
> 
> Thanks for the report!
> 
> The patch below fixes the issue for me, I'd appreciate if you can verify it
> on your setup as well:

yes, below patch can fix the issue we reported by same test. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 780e70d4971a..3e21d6135789 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -985,15 +985,18 @@ void __init_memblock memblock_free(void *ptr, size_t size)
>  int __init_memblock memblock_phys_free(phys_addr_t base, phys_addr_t size)
>  {
>  	phys_addr_t end = base + size - 1;
> +	int ret;
>  
>  	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
>  		     &base, &end, (void *)_RET_IP_);
>  
>  	kmemleak_free_part_phys(base, size);
> +	ret = memblock_remove_range(&memblock.reserved, base, size);
> +
>  	if (slab_is_available())
>  		__free_reserved_area(base, base + size, -1);
>  
> -	return memblock_remove_range(&memblock.reserved, base, size);
> +	return ret;
>  }
>  
>  int __init_memblock __memblock_reserve(phys_addr_t base, phys_addr_t size,
> 
> -- 
> Sincerely yours,
> Mike.
> 
