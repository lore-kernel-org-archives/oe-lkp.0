Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083C2C21CD
	for <oe-lkp@lists.linux.dev>; Fri, 29 Aug 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457299; cv=fail; b=XNIr+xhu0POkJJsofxubfVXfdI6n3oRw51qp2/Uj/klb018bFyQLMPO6Ss81T4PRhfeRcHkLemVEEl3qSNULbg1uI3ts69qple6FiwYM9CRVlam1dMmpjsVH7WjYGHG7CRHznix3gL2ZrP4/atFpgTe+J6FenRQfBwFx7CjnB0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457299; c=relaxed/simple;
	bh=4v3gQkVKBz9viGr7mbuoefDyHCVQAsvyLlqvks2dGiA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=epWRf7JuEZi5Znh5oOXAfyn/ZhGGb5UCDKV9dPNqzaTAX4/h/uvDr4au5AMLKv345TVJIIDSgHHJzVP0w/CMImNC8+zu6zHrpbCycBMm6XnwK54FSaIL04pPxKvFsloS4cAwEtdN0Z0C3bjwc/km00tPb2cYU75ngWNbzx4KfWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a26yOtmL; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a26yOtmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756457298; x=1787993298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4v3gQkVKBz9viGr7mbuoefDyHCVQAsvyLlqvks2dGiA=;
  b=a26yOtmLQNiRwgeKu8q1TbQAoCYVA/h9QjO93pNlWD5EllLoIZbxYpdI
   52nnVbssynjyhBVzf2/uP8H+Z5cswiI8etKHucwWitPm23ZhKlaBnjpu9
   ZUBKX7KY3vmWwh4oeKafQGm1BowUB6a6nlwXVcd5bFyj9o/KN+ESn7Qnt
   YcJBGJwBAtVoucMsMGWaFa/A6oQHbs6EuHaZhAbTuQOxWrSU6mXJUnT8Y
   9lczzQpF5EY6GaDOIK8V9Kynz0Yq4VJ/PwbqL59hVHoFyJMNbm29+hYFu
   NElHLlwiDhg0NoGybyklLZv5fHOgHbjnPs6RvAnb6Q6FoneiXUOmk6FjT
   w==;
X-CSE-ConnectionGUID: o4yUmTkiSVCDWNyjEWzLCQ==
X-CSE-MsgGUID: P1H/rki3SsKcb5zRgkzPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69014025"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="69014025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:48:17 -0700
X-CSE-ConnectionGUID: CUnvEBhcSISzUM5GjeqZ9g==
X-CSE-MsgGUID: +gKrozLeQHa+rD+g+XhMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169635597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:48:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 01:48:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 01:48:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.53)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 01:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckT2WRvpgMLH1Zne2USOCxGppxhr38GI2V694G6sqviyQ9FrOzPRqTP8TmZoWLVI7UVne4ZyJPrLksON9Ne+8ozioi3SmTZ2raBUPcvp7Hryzs+6SQRNi+TtoYAeFzotNme7iOzTtE/lWJcpdDOoPnwVt61iceEkd10xGMqjgKaL7VdIaY1SNMENSPr2jGiugtFlU1RgjmaEOtNUIY5vBntO0/6fBZIB+LfGZid0RzMVrzBc48xqSQvQLGaLWHXI+ggJ6zg4MqRb76qdofM6vpPoTGjOMaayrOklJQZFUoCTGlW/6q2tKdn9HP476OWwUCgItno47efToNdI0BKzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6bfmcB0bU6I4quiybImjKbG6rfougbPvgWfZKsfJLg=;
 b=UAlXl6ssJwET0/SrW9CnyhVs9VxCUhxoj9Q+mDzbaW4FZ2e2jKYu+Bekvi5K3ZlSoBPFyPTag7zPiUqZYE/dXapfw2rfzLObDMufzBdeFVyNJ5Ddv3zYwmEXy2CbZn4jydQedFvYVhFJjMZ9kFNHOD/OgVZKGdkgz3UYgcwn+QKRCocreAgEYByKWFsvYqb/JfgyMb1focKzJP8ErO4RyM5ScRVgD0J5rwgysh0DKoSb6uoaL3Fkfau3Zdg2jbQbVmkgYkSOWm3DYiRmjcOcpRCbZ47iX6lRYzjsYHxMnbEyvcCoCZ4cbNtsWNjftt4BkkYKlm0vjY9jqweUGirweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB7858.namprd11.prod.outlook.com (2603:10b6:8:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 08:48:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 08:48:08 +0000
Date: Fri, 29 Aug 2025 16:48:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jirislaby:devel]  7692ca4ea5:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202508291640.97e82aad-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4c4551-68af-4b2f-efd4-08dde6d8c740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oYptXa6Ha0xq2rltnZmaTc8rtRQMQXp3YjpCs2FIayNiSkWXAxm4gWmmcIDB?=
 =?us-ascii?Q?1qnDPnOtn1+eMT+C66yl6C45duUGqXdxVfsjcHHpTsz2MJ3S7tfCEKmuchaI?=
 =?us-ascii?Q?FptGtA/kdXbuyXqF/o7/shS9tAW71Gvl+Z5Iz2cfeS97Ybt8KssQCqScxxIz?=
 =?us-ascii?Q?OAha8xLcLviiPp6C53JGGEwQhZjleoGMGpIQP0tkgr6EFH8BBI7GuJGUdlpA?=
 =?us-ascii?Q?dLExvtPbtV/2KLByGzMZxllFm6qKeUCPxuzvwAqN3RziP5UAHdk4UkdnKuIR?=
 =?us-ascii?Q?FOOWM3aTVM2HI2fWgbWVh5y/vGkcMxB+Tio5jV3idusnPOiAeurEKqQXrtHa?=
 =?us-ascii?Q?ekIw7c3MfO6WEqiMtVb4ZUAcxFG2/nEzLYWhqemtS02Z0GLecv8BLwADFStk?=
 =?us-ascii?Q?CIoBE6jzGDI3wtbRCbYJ5tljPWuICLtvj60db30NJYffaSDc+nfGYwynvyoi?=
 =?us-ascii?Q?uloantA//DYlapVZnXmTjAYZyZSRbeHdrWQ/eNyM6IA4TyXDHxy7WaxYbR7J?=
 =?us-ascii?Q?tJNGtcDvh+fZYYI48met0Ur3KBhT6BWxteKLc+CYDHyBcqhw4AIFCOAA7OYz?=
 =?us-ascii?Q?R4Sz5uNBOj8Zq/VRK+bmhA3No/yLkHJjUkZdpYuS3b8k9gRje72LmLckPQER?=
 =?us-ascii?Q?qW0VdvBS5WOQFUvHJRe2E2yReNvJhEpUO6j0vGYz3wk/L2NV9Kgh+VJGHKeW?=
 =?us-ascii?Q?pIoYZSTtpwe5pRTEa4mTqYwMJMIFPIXeaBrcpX1kg3i7Ra7h1cHocMBo05O9?=
 =?us-ascii?Q?b5YQbtGXyVMd62E/SNI3ndqwrzg1MjpDekIHh4G8XtMXvi/SLXfU/4OQ3oVJ?=
 =?us-ascii?Q?WRVc4i8z3rowXa8OGsapz1Cpt/pL+CjjRoTO678UnUSSbcHyBoOl2JxgnFI/?=
 =?us-ascii?Q?Zj+QBACFNG0R6F27s9N3Eh1UweCBJXsiVQJ+oMEyYLzVYVKbuKG1S1lg1fTl?=
 =?us-ascii?Q?Fc6cxkyIEByfzIINWWyje5K2ntH8KxmnzunJ6Jsz4WVdpbflGgpPj+FRayU5?=
 =?us-ascii?Q?p4Ys414GT1vtZWmzmIdpGOQjyuLRPGOObd3wA5JrIXkxuSHgqp+HYmpi6d60?=
 =?us-ascii?Q?Tux+8f8kUbXhwdBCPDkt9LtlqXPJiuxvu4Dynt5Sz3MBJe2QXicjfEzAndLh?=
 =?us-ascii?Q?i01KpqbBoKotTdAgIwN5/JCdYB8bCVyjUQ+rRYHYR0purzUWUc7Hn/kyGPvu?=
 =?us-ascii?Q?1wYX5R7YlwPCYxmefeMez7Pj44E1Jycso5+C77f6siY8A6X1DXNN4KqqpVBI?=
 =?us-ascii?Q?wpP5apq/J1B8qK1NV/dIdaADwMGH3dZ2fY8YWMOOdHFSB+P/264bkeE03P2i?=
 =?us-ascii?Q?vgcmOecl/BRGOppHy68bCsXRnAmjIOyeLJQJMfOX8N25Gj04eyAXW5/3R8x9?=
 =?us-ascii?Q?MiP+9GMZofHAaGSaCgahZWgaKzLZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5633I6KYoE54LusLezCu9tqrEZbM3bUz67fiIb59AcU3CloFsb8Lwplh5j4y?=
 =?us-ascii?Q?fqiYtl308e7kgn1xOeLzbF3ylgDNiuHIqGh6u/xT2Ib0mPvos+ple3luKeRi?=
 =?us-ascii?Q?8j71MhauouNul7YnmsEl2QDu/VyQz9x1vjH9WDYAh6hkZHgvzMAGZV1a9Ej1?=
 =?us-ascii?Q?9+63brXruBc276dA0IQkr5OLinSbW9RkrMQ75rpQcPRCvG2Wl85H2GInNj0V?=
 =?us-ascii?Q?2/4MNs99u63LBtKit7a7DNY8hCogBaHmxg89QPGhIqVMVXtoeLwT2MIMMJdd?=
 =?us-ascii?Q?krlDokDKpy/1oqgB1VihnxX0R+Z/zzTfdOAeLBN4+wjPIbjPHmRY89Xb5Zxt?=
 =?us-ascii?Q?Z/MupVrhWDKZ/JLbYqq2P1aP95+k3HxhPcFNvzcOHqHp5VVjgSpCV3VSOQe6?=
 =?us-ascii?Q?0wysd/4CJk9HKkpKQbbxGo4Ve73Dtrt9gP90XREIZG7fVQQza/cjAR/tatbu?=
 =?us-ascii?Q?yRDdDQkzdgsHCeZK+4BFMMqWEKiqA1Zhuxk6JMX5ANoKKAMxZ4MY6/lPd3LQ?=
 =?us-ascii?Q?VLCY1K/1onqpXl9d5WUwMpawQHjGVgBPkpUPQ3KL2PEU4KloSwP1mpXLtXBb?=
 =?us-ascii?Q?lQkIwZhJLCEUt0NXsQ4Bxq480tgnAhk+LDHtuSpoLr4JXBbzj+1vBJWoLghn?=
 =?us-ascii?Q?u3pMDUo37XlTuRDBV3U8fQYieivbxQDTB0BfMZtWxtrJFI4f3wVN/Jj3qkRc?=
 =?us-ascii?Q?SKV8R0cCGIp9nxmnyTaaPxatBnM57Cpe+NpyUvEpHEUgi5lscXV/4BT3hL2K?=
 =?us-ascii?Q?pZuigqaKoXxe7uXGDhH1mKBcXawFrFCJ9Jca8+GbJivpjWB8q7Ma2SWTF/pF?=
 =?us-ascii?Q?CxPDh6LYCNk2EcvJ0nCmH1IfCKpgftaeCWnmFr2/er6j3O1h1Z2bp1MCWEit?=
 =?us-ascii?Q?Yi55UbnBGex84tpW+2fuSlAX1beYpq4QdOFBvIybMucQxKPW0evHrEMs/bMF?=
 =?us-ascii?Q?/tGjmVdx73mZodQqTJLUHhN68Hh8T3LFpk9IQRRbHP7ADV9ucNZYCFX6OB6m?=
 =?us-ascii?Q?R43yWJdhaGGh8zg0pHFICuy7kbw+/9xlS63weKJLaXwf8/FjoLyaJ+bLgrp+?=
 =?us-ascii?Q?bj7aJiv1nEwanUllMeuWQ5cKQXi2kdjvCTjlre0IT4HeliPkdOHAFB6amwpd?=
 =?us-ascii?Q?YFpbbx8jm9eUTD7Dqh/Dy4noSeJJGisTHiJD25VASCQvlhNH+f6H9Kvr/jpE?=
 =?us-ascii?Q?1AMSgz++3jiWOC9eSDhtcPK9eaCNcdzfxFM6+i9+SiZ539QB1ZbIQp2mlOvv?=
 =?us-ascii?Q?k8Sox6fZB+kE85yuETpGWbFQiJxpdktCkRVXKP/iQqx2F/YhfLdXBlsx9MXO?=
 =?us-ascii?Q?KWp+FLuB3eUlTQmsgtbjcZhdm05Ww5P4XeB/BaQYmXaHI7/H5vX9Ay7Zm56b?=
 =?us-ascii?Q?GeYxjAtA/2DHg6prcvmBrduaWptN+Hy85xE9ip4Sh3ymdQrTSiB+Gt9jclpR?=
 =?us-ascii?Q?FyLAAimjK4NpBGHtksLLcFd7WYwKBG6JboOLzC/wizlVBYne+xubF+QI/04s?=
 =?us-ascii?Q?ICcc7enlMwhpVPSLTJHNTzxJRkx/hSnQOgIl+xHsMQ44S1Di69sI58kDgYlm?=
 =?us-ascii?Q?xt7f7++hV6zriKvelrNkDaOD98mpV+zrSy+/eg7ugedjTVAdBDwtyanYjbi5?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4c4551-68af-4b2f-efd4-08dde6d8c740
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:48:08.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXeMxL7aFGJnBQIGzmm59JAhwDTGT7SNujd50B0g2F+ZmNdnZrPte8y8nePtJoJGlxJOT4XNR7O36HPnbG+KSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7858
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 7692ca4ea522fb744009ed8f49a77e96eb1097cb ("8250 ops")
https://git.kernel.org/cgit/linux/kernel/git/jirislaby/linux.git devel

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d6c7cdb02e | 7692ca4ea5 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 18         | 0          |
| boot_failures                               | 0          | 19         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 19         |
| Oops                                        | 0          | 19         |
| RIP:serial8250_register_8250_port           | 0          | 19         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 19         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508291640.97e82aad-lkp@intel.com


[   22.467865][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000028
[   22.468492][    T1] #PF: supervisor read access in kernel mode
[   22.468492][    T1] #PF: error_code(0x0000) - not-present page
[   22.468492][    T1] PGD 0 P4D 0
[   22.468492][    T1] Oops: Oops: 0000 [#1] SMP PTI
[   22.468492][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc2-next-20250819-00042-g7692ca4ea522 #1 PREEMPT(voluntary)
[   22.468492][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 22.468492][ T1] RIP: 0010:serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:740) 
[ 22.468492][ T1] Code: 49 89 86 a0 01 00 00 48 8b 83 90 01 00 00 48 8b 8b 98 01 00 00 49 89 8e 98 01 00 00 49 89 86 90 01 00 00 48 8b 83 80 02 00 00 <48> 8b 40 28 49 8b 8e 80 02 00 00 48 89 41 28 48 8b 83 80 02 00 00
All code
========
   0:	49 89 86 a0 01 00 00 	mov    %rax,0x1a0(%r14)
   7:	48 8b 83 90 01 00 00 	mov    0x190(%rbx),%rax
   e:	48 8b 8b 98 01 00 00 	mov    0x198(%rbx),%rcx
  15:	49 89 8e 98 01 00 00 	mov    %rcx,0x198(%r14)
  1c:	49 89 86 90 01 00 00 	mov    %rax,0x190(%r14)
  23:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax
  2a:*	48 8b 40 28          	mov    0x28(%rax),%rax		<-- trapping instruction
  2e:	49 8b 8e 80 02 00 00 	mov    0x280(%r14),%rcx
  35:	48 89 41 28          	mov    %rax,0x28(%rcx)
  39:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax

Code starting with the faulting instruction
===========================================
   0:	48 8b 40 28          	mov    0x28(%rax),%rax
   4:	49 8b 8e 80 02 00 00 	mov    0x280(%r14),%rcx
   b:	48 89 41 28          	mov    %rax,0x28(%rcx)
   f:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax
[   22.468492][    T1] RSP: 0000:ffffcf4f000136a8 EFLAGS: 00010202
[   22.468492][    T1] RAX: 0000000000000000 RBX: ffffcf4f000136d0 RCX: 0000000000000000
[   22.468492][    T1] RDX: 0000000000000000 RSI: ffffcf4f000136d0 RDI: ffffffffaf293700
[   22.468492][    T1] RBP: 0000000000000001 R08: 0000000000000401 R09: 0000000000000000
[   22.468492][    T1] R10: ffffcf4f000136d0 R11: ffffffffacfecab0 R12: ffff8e5b417916a0
[   22.468492][    T1] R13: ffffcf4f00013a98 R14: ffffffffaf293700 R15: 00000000ffffffed
[   22.468492][    T1] FS:  0000000000000000(0000) GS:ffff8e5ec0c2e000(0000) knlGS:0000000000000000
[   22.468492][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.468492][    T1] CR2: 0000000000000028 CR3: 00000002b9620000 CR4: 00000000000406f0
[   22.468492][    T1] Call Trace:
[   22.468492][    T1]  <TASK>
[ 22.468492][ T1] serial_pnp_probe (drivers/tty/serial/8250/8250_pnp.c:480) 
[ 22.468492][ T1] pnp_device_probe (drivers/pnp/driver.c:113) 
[ 22.468492][ T1] really_probe (drivers/base/dd.c:583) 
[ 22.468492][ T1] __driver_probe_device (drivers/base/dd.c:?) 
[ 22.468492][ T1] driver_probe_device (drivers/base/dd.c:831) 
[ 22.468492][ T1] __driver_attach (drivers/base/dd.c:1218) 
[ 22.468492][ T1] ? driver_attach (drivers/base/dd.c:1158) 
[ 22.468492][ T1] bus_for_each_dev (drivers/base/bus.c:369) 
[ 22.468492][ T1] bus_add_driver (drivers/base/bus.c:678) 
[ 22.468492][ T1] driver_register (drivers/base/driver.c:250) 
[ 22.468492][ T1] serial8250_init (drivers/tty/serial/8250/8250_platform.c:322) 
[ 22.468492][ T1] ? __serial8250_isa_init_ports (drivers/tty/serial/8250/8250_platform.c:302) 
[ 22.468492][ T1] do_one_initcall (init/main.c:1281) 
[ 22.468492][ T1] ? chacha_block_generic (lib/crypto/chacha.c:86) 
[ 22.468492][ T1] ? crng_fast_key_erasure (include/linux/string.h:366 drivers/char/random.c:330) 
[ 22.468492][ T1] ? crng_make_state (include/linux/spinlock.h:406 drivers/char/random.c:363) 
[ 22.468492][ T1] ? get_random_u32 (include/linux/string.h:366 include/crypto/chacha.h:119 drivers/char/random.c:425 drivers/char/random.c:554) 
[ 22.468492][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050) 
[ 22.468492][ T1] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 22.468492][ T1] ? parameq (kernel/params.c:? kernel/params.c:91 kernel/params.c:99) 
[ 22.468492][ T1] ? parameq (kernel/params.c:90 kernel/params.c:99) 
[ 22.468492][ T1] ? do_initcall_level (init/main.c:1327) 
[ 22.468492][ T1] ? parse_args (kernel/params.c:153) 
[ 22.468492][ T1] do_initcall_level (init/main.c:1342) 
[ 22.468492][ T1] do_initcalls (init/main.c:1356) 
[ 22.468492][ T1] kernel_init_freeable (init/main.c:1593) 
[ 22.468492][ T1] ? rest_init (init/main.c:1473) 
[ 22.468492][ T1] kernel_init (init/main.c:1483) 
[ 22.468492][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 22.468492][ T1] ? rest_init (init/main.c:1473) 
[ 22.468492][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
[   22.468492][    T1]  </TASK>
[   22.468492][    T1] Modules linked in:
[   22.468492][    T1] CR2: 0000000000000028
[   22.468492][    T1] ---[ end trace 0000000000000000 ]---
[ 22.468492][ T1] RIP: 0010:serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:740) 
[ 22.468492][ T1] Code: 49 89 86 a0 01 00 00 48 8b 83 90 01 00 00 48 8b 8b 98 01 00 00 49 89 8e 98 01 00 00 49 89 86 90 01 00 00 48 8b 83 80 02 00 00 <48> 8b 40 28 49 8b 8e 80 02 00 00 48 89 41 28 48 8b 83 80 02 00 00
All code
========
   0:	49 89 86 a0 01 00 00 	mov    %rax,0x1a0(%r14)
   7:	48 8b 83 90 01 00 00 	mov    0x190(%rbx),%rax
   e:	48 8b 8b 98 01 00 00 	mov    0x198(%rbx),%rcx
  15:	49 89 8e 98 01 00 00 	mov    %rcx,0x198(%r14)
  1c:	49 89 86 90 01 00 00 	mov    %rax,0x190(%r14)
  23:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax
  2a:*	48 8b 40 28          	mov    0x28(%rax),%rax		<-- trapping instruction
  2e:	49 8b 8e 80 02 00 00 	mov    0x280(%r14),%rcx
  35:	48 89 41 28          	mov    %rax,0x28(%rcx)
  39:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax

Code starting with the faulting instruction
===========================================
   0:	48 8b 40 28          	mov    0x28(%rax),%rax
   4:	49 8b 8e 80 02 00 00 	mov    0x280(%r14),%rcx
   b:	48 89 41 28          	mov    %rax,0x28(%rcx)
   f:	48 8b 83 80 02 00 00 	mov    0x280(%rbx),%rax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250829/202508291640.97e82aad-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

