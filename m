Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E213C8EA
	for <oe-lkp@lists.linux.dev>; Mon,  8 Sep 2025 05:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757308935; cv=fail; b=lYQ7o1JeaWbh4NXZ2lLds3gZluU4N14AE8au8nV3P4iGiLLe/bibJUYKx31ljb/QV8Ij3tzqc2jdf3/Qc6R7PEIJYUo6aXi59X9TyOmJwNfbtUfkSscN3r9LELXmsaXEGQ/d60IEYEoJKmqvK3GWC3sFk7czNwC53WFE5eezlFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757308935; c=relaxed/simple;
	bh=hMjOP6M/Ot3CyzZ3uGqMt3ayKASqWRoOXGlfLbyFQmI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D4AiOgqB1146pzLzdBjXXJ+kFf1kNZhAmSthAsVFR08FIFREZC7I7cop1bcojySBUNY5ScuLn2tSknO7ea7MKMs+gVoydzUrYW5DOQkuej/ieH0T4cz3vjZ8OA2N4U6n6wCoDoClaRFlxVS7ZysvsEUFZY+zmMqsNjUeSQclIY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDSo6k9G; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDSo6k9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757308934; x=1788844934;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hMjOP6M/Ot3CyzZ3uGqMt3ayKASqWRoOXGlfLbyFQmI=;
  b=PDSo6k9G2uCYB+YeA1cGyEOsRMC6mMs5quMf6oamiJHydcj8oiSjSFL7
   zoJEDKvvNkpNgwfKXo+amuV+XLi40+5xUIjKO6DCXVG/5yoxZ3nNNMzuQ
   j0ui47qw52+/sLTGlRefTWLzJgw4m9RyghawvRwgGB+MF4J9LVwCGuvKV
   pZpXOhjrJw9Oos+iIgGhIAi/Bg78YbwyMDhQL7EFp6LjjZ3M3Gb5oFOFh
   tsRelshSFasAeRzG0+iCJ2SMbg8/V9KD1HzWWrCFvfqkOPGC8yArsmT4Y
   yQWfkjrJNvhBPENul5OGLPPTiyET/TiHmEbDzcOGKV8/3IN99Ao8u0Ys/
   Q==;
X-CSE-ConnectionGUID: /X+MI4v/Q4i9OtC0b6OlKg==
X-CSE-MsgGUID: G/uUP2J/RpaBtSH5+pgHKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="70656021"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="70656021"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 22:22:13 -0700
X-CSE-ConnectionGUID: 107cymZoRg+fnK6q4g8MWw==
X-CSE-MsgGUID: I1Djwl6QRQKQ7S1gGNUQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="172567282"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 22:22:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 7 Sep 2025 22:22:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 7 Sep 2025 22:22:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 7 Sep 2025 22:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uotw5kdkAZ/hTMdcVTJ7/Rmi2cOYBIn//gJ8pRqlIHDTI5OP+v3D8HpcUVCQiDFiGG6Gff9j5JpCYqIeU7zGtl1NneH8/VYj4bS7s5TCOL8XFsN28ut89W0Vep2m6CuCMzSxMGOAsIA+3ySL99xNk43YuXTpQIZCSfQfGUAjDQ30H7yZO8EBfaM4F/dUS//9z7PcvrGF4lwkt9TbqMQ75q1CVjbUjqOpnGEHeX/HiXadZaI2f8y7/0TVEzaoRPgjZHTUy+JhHPxhLHAflBi5F8LTRZ4GZyY4HaOGYhczoYhQRi55NmT/dUOPUHW6iAkhZ1xbCaRpVuxRAVZEkpHwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzm8masjaU+eayOruOZ29Ji7HZOXzy/RslHSywK17eM=;
 b=FWWR2PjO3uXthNHAYCujP6J+lC9vfIoUkR43/Eo5xbVlF2JQBLROJld1tnQbLnmOnlZgYIUh0XSKY9ZlZCGugLu7hldXnx75nHB6yYm0Xe2K24iwI0Y4NQiI8+Qr0T7nDI2CLni1s8SCaLQWrI7bbYuD6KLAbH69UDtIjZ+kf1n7NIm8fiJLupP5eeTI13ZTqz5Q5AUj8oqgV2mJpCLvFeYX9WlR6uWPnS894/xEvItWhxwUvzcBhX1Aop6/3J/2Xup7ooPQt1da5/w6C8Z1eFk3bXDlfnMLq1QGEHQnWCFRKFRl8WlyqHf89jdhWDzL0Du19VQn51433vHA9nNdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 8 Sep
 2025 05:22:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 05:22:09 +0000
Date: Mon, 8 Sep 2025 13:22:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [mm]  09126aca24: vm-scalability.throughput
 9.3% regression
Message-ID: <202509081322.42957d3b-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 467de8fc-e72d-4b8e-1510-08ddee97a889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Qkc/S7Vy9Zgn5ZfxUiLX6plNCltzg6uN3c3HkRic7XTOVfVFUByAUHnzrW?=
 =?iso-8859-1?Q?jBdlIWPMwqUO9h/N9uVDXRV1P1lDtDGPGi86pSqAWMJGUVns3mli9Jlokt?=
 =?iso-8859-1?Q?/+81u5DLjtXI+71ba1EZonI35mDYMrERASI0Vn4We0mvsC1rmjmOJopYZm?=
 =?iso-8859-1?Q?xIpa1/9uerhd/K2yrH/J3jx0q89PX2tlNWBLVlw0opHrMDYZbt+ds6MlVj?=
 =?iso-8859-1?Q?Bljs9Jxze+EzoFFLdPIE+5bk4x/OZ88otWf+ZY/7Wa5onanlhlfYJSFh/T?=
 =?iso-8859-1?Q?mFivoZ/ceaIteymLpkFXxQBouJlZpsF9m8rQ0wh/W/7Sq5chqTTbpbJXDh?=
 =?iso-8859-1?Q?myiTPZU+IZWqxzgRvoEKxHevrFrwkKVMqpZilC/DJ8w16Z74qedspR4FTh?=
 =?iso-8859-1?Q?j2teOqviMKLTc472SguQqpnIgz3llhedZK98t7Wyp88i9+sKfPXGROjz96?=
 =?iso-8859-1?Q?h0Uh7t/q/ETAWL5prb81MFoRc3ruSCjgEUwx5WrDcCBBdZlcJ937lV4LOe?=
 =?iso-8859-1?Q?zKDK3avDQbUxi8bd0B63qSn1uiOK43YHh5QGJB44EAsa/tlU7X6Mmydkcu?=
 =?iso-8859-1?Q?UlRnziYwh0rIHSXrVgH9xAJg/TVLTlpdhGC21i03nrIw3TKzw5mmrbDVGI?=
 =?iso-8859-1?Q?1aLRuN+0TjdS8BpebxL4dt145wTFjfVVZcA8yFVdH3rVUx/yqMllUH4Y2g?=
 =?iso-8859-1?Q?AJHTZF7L8R14vQ57W4v2PwHJDcnYme3pAjC/IjfXlUPrFi9voNdqsPDLmL?=
 =?iso-8859-1?Q?9G0hfTn2OhaELYPsgA/5dwMs19Np7DVCyL6Iz/wfG4olyzS12lIKsJTmNG?=
 =?iso-8859-1?Q?gQ2Ye+hRufdUgeeKsMOh2wHyJQLdAvh5DNHnsI6BbNGHi2uZ/eYkpcP24C?=
 =?iso-8859-1?Q?QBRLLGxYDbWOuxftDQQfZKs3a1NE/FRzVuC4WhjP2uKFqVtNf6O3uOkdUM?=
 =?iso-8859-1?Q?Jvw/gJDQdtDibRpL7GgoO/O/3MGm81pgtgMdBVyW+ZknWpNCfYYJykPJAu?=
 =?iso-8859-1?Q?NjAPoWZFq/mbz8N8+wDlEQpx9DudGH63P8Q/IDm4BZeulM7a7Q8QxHpHX3?=
 =?iso-8859-1?Q?shChUwvKitdG9j7duX7FMx/+iNOqy5qEgX8tgEXxyXJUw0POO/znnAQPDH?=
 =?iso-8859-1?Q?KYNtKmI+Tyh+gDX9vM9LmOUUrzg30z9EBRv4pE7K7Wm3rXtrOPn/8Z6nEH?=
 =?iso-8859-1?Q?4M0ZfJj+c5Cdz53F3nupTnT/m5QyHS2BWI1PAE4riKLkOUv1EH+C3cgw2D?=
 =?iso-8859-1?Q?9VKYVyUWqTB535xrpITCep1jRdHpsoapp25/sj4AruPPShplC6zgE6fctq?=
 =?iso-8859-1?Q?z1PerP2vGyJSHBZ1NZSfTnCO7qOrqXHUT5dgvQvuTChNOexkpSQtZqI2CR?=
 =?iso-8859-1?Q?0UnRsvRHywkN6yDSUrnaO0r+2eZcJOvA+GbwVrI11gxF7FGEvl37NBu7Rl?=
 =?iso-8859-1?Q?Ju1eR5pDGZS++Yco?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OePri10/xOefxUzIfGzyyHrUC5BRYy89YfscyvlcuE+fvN1EIBx9MlvZmq?=
 =?iso-8859-1?Q?EMnKMpwslySfYky41ueAdVq5D1L8FyY4EKvBe/igEPOQQ28q4vH/YJ6MRM?=
 =?iso-8859-1?Q?wp/JjHlQuHNlOejQ4TG5eADyYBXOTMhkZE2wtKb7CopCl5XBYIDVyPe1XF?=
 =?iso-8859-1?Q?KFzyLB8JvQKHDXs6wQIuWDnJG3PkGNlJtaKAqb0lI0u6hrbX/H2sdeeRVS?=
 =?iso-8859-1?Q?7OM6eZDYFqM68wq8vKRbVt3wU+B62dt2becCF1Mcla/m5UqWv+27svpSs/?=
 =?iso-8859-1?Q?AFc5nJNcj+eZ73mwMu1sdq6UPkG7Gu374ytIWbWwSxrUO6YEKGYrK2BgBd?=
 =?iso-8859-1?Q?W7bQF+Vu8/qWt1mNd3eSbRQb9aJChbR+iW+JbQ1lgZP369mn9UMcKfT3as?=
 =?iso-8859-1?Q?pIij2l84SMAm/y5MCAO7bG+a7Smatk7FSxMJ53xWXzUxxuyLjnyO+DQRrg?=
 =?iso-8859-1?Q?7XwYnGa/I0lk2mAKQ+OUSMpsnRi3YxgmK6OMe6ChV8vXc6Cxf4WruLH2WD?=
 =?iso-8859-1?Q?xPSvQjVMyWYXwuVvPyI+CLV/m4Ik0AaFFed24B0P42ZXgMVg8kiiIOK+Ur?=
 =?iso-8859-1?Q?y2HxMyJBt+Juv8g+v0o/z7kPywkmdffxsFngaZ5yZoIk9gOfQ6apDENehk?=
 =?iso-8859-1?Q?Qi2+z17Fb43uVo/fplDe5+4rX0qVJvUJN0h8QOpv/ikkh2Wla02U6VcbkK?=
 =?iso-8859-1?Q?DufSNQeFBKZeGAk9EnyFLtX50yIWM63tBJ8y4DQIl87s8B186qNOTVqxOc?=
 =?iso-8859-1?Q?Kfl9mQZiTXN3dVGfgJ39ctsUgkakRUV7mW1U1FLlAb9NK69x8ocrsILE3u?=
 =?iso-8859-1?Q?uLSpUvsiqkXZ3Ea7t2g44n/Q6rWw5WmKilQbNyOx0GVQ6rA62q9mTgdLsb?=
 =?iso-8859-1?Q?ZS9iFN/2D7mjDaJqJtafCCki327vPimmux0p5ZNkc/w0aSmJ8cJiAtwhxu?=
 =?iso-8859-1?Q?QNx6lOCf/99o/U0gnlML1/imYTmk1eIjPIw8HDk9WtuPBzwu/vvxTKhnGG?=
 =?iso-8859-1?Q?mgXCSVXxdMFK3VTtPvBzb0Q9sAmMrBPgPgsiZxTF3vWh3POKv0qOVTROBc?=
 =?iso-8859-1?Q?qA6QHgSYT+4Srr3j5hG9tS3+qWZOJNIWIxqTBjiyPMDb4sJzclqJVr4vwz?=
 =?iso-8859-1?Q?qBTgwy8JP7l5KB2X7Q9oJsGatIX6Sr43/q+PBoGzJzdTJMVDQCUVwINkyF?=
 =?iso-8859-1?Q?TUN0piVkso4bTY9sKCSjCTSX5JIqkcMlgwLHDV00XI+kPSf2vpIILnXB/o?=
 =?iso-8859-1?Q?zpz9xPYPd7Ui7QET6teDoDwlEbCoKig9KScMu77csOejBjGrIRCdxetDsi?=
 =?iso-8859-1?Q?vzpE1rkppmX6C4kLAODcJlFrfeJB5I4IqKdQueHfi1S2i49JTk3OS0o76c?=
 =?iso-8859-1?Q?1DDBl10bD+CGv0Rhr6Frly64W0sZ+TtJJi6d12MlzBO0fXVveq7/HSC6fZ?=
 =?iso-8859-1?Q?7zK7u5zHwGoCYaHerRAf+p4v7nGxFYCCtc4uZ9/C3416uDhTi0ZLaWGDz+?=
 =?iso-8859-1?Q?dq1/aXv5QdhLydF9Ed7Kjrr9cnZiuobH3hsMT1oZ5N/NUhNMYzNdNw8Hl2?=
 =?iso-8859-1?Q?PJRjZ9S9cIQBBiYnPK0TVcW+TjzVan6hKF9Jf4V9HpGG7MEL0RNCBdHlK2?=
 =?iso-8859-1?Q?kD4b2Z7wbuPkhV9ueHOCtBNde5JISSoM8u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 467de8fc-e72d-4b8e-1510-08ddee97a889
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 05:22:09.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY7TCDF1KAspDmOoXbT0ZJLAIQva/qv6FogMdWlvrgnokJlDsctp4WJ3OgRa7fOTZG85xRB8lPr9ct0+aS5F3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 9.3% regression of vm-scalability.throughput on:


commit: 09126aca2433002c7d5f69bb47f2667f8fd8b25d ("mm: tune PCP high automatically")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: vm-scalability
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	runtime: 300s
	test: lru-file-mmap-read
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509081322.42957d3b-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250908/202509081322.42957d3b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-bytedance-5.15-velinux/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-2sp3/lru-file-mmap-read/vm-scalability

commit: 
  1be8c70984 ("mm: add framework for PCP high auto-tuning")
  09126aca24 ("mm: tune PCP high automatically")

1be8c709848cf8c4 09126aca2433002c7d5f69bb47f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     30408 ± 27%     +76.6%      53710 ± 35%  meminfo.Active(file)
    677369 ± 18%     -54.8%     306339 ± 23%  meminfo.DirectMap4k
    497.23 ± 21%     +39.3%     692.51 ± 13%  sched_debug.cfs_rq:/.runnable_avg.min
    414.28 ±  8%     +36.6%     565.85 ± 10%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1084 ± 10%     +39.8%       1516 ± 10%  sched_debug.cfs_rq:/.util_est_enqueued.max
    912.12 ± 26%     +37.3%       1252 ±  9%  sched_debug.cpu.curr->pid.min
    779.95 ± 12%     -13.4%     675.71 ±  7%  sched_debug.cpu.curr->pid.stddev
 4.357e+08           -13.0%  3.791e+08 ±  3%  numa-numastat.node0.local_node
 1.046e+08 ±  7%     +41.1%  1.476e+08 ±  4%  numa-numastat.node0.numa_foreign
 4.359e+08           -13.0%  3.795e+08 ±  3%  numa-numastat.node0.numa_hit
 1.051e+08 ±  6%     +39.9%   1.47e+08 ±  4%  numa-numastat.node0.numa_miss
 1.052e+08 ±  6%     +39.8%  1.471e+08 ±  4%  numa-numastat.node0.other_node
 4.335e+08 ±  2%     -13.2%  3.764e+08 ±  3%  numa-numastat.node1.local_node
 1.051e+08 ±  6%     +39.9%   1.47e+08 ±  4%  numa-numastat.node1.numa_foreign
 4.337e+08 ±  2%     -13.2%  3.765e+08 ±  3%  numa-numastat.node1.numa_hit
 1.046e+08 ±  7%     +41.1%  1.475e+08 ±  4%  numa-numastat.node1.numa_miss
 1.047e+08 ±  7%     +41.0%  1.476e+08 ±  4%  numa-numastat.node1.other_node
    976.92 ±  2%      -8.1%     897.46 ±  2%  numa-vmstat.node0.nr_isolated_file
 1.046e+08 ±  7%     +41.1%  1.476e+08 ±  4%  numa-vmstat.node0.numa_foreign
 4.359e+08           -13.0%  3.795e+08 ±  3%  numa-vmstat.node0.numa_hit
 4.357e+08           -13.0%  3.791e+08 ±  3%  numa-vmstat.node0.numa_local
 1.051e+08 ±  6%     +39.9%   1.47e+08 ±  4%  numa-vmstat.node0.numa_miss
 1.052e+08 ±  6%     +39.8%  1.471e+08 ±  4%  numa-vmstat.node0.numa_other
 1.051e+08 ±  6%     +39.9%   1.47e+08 ±  4%  numa-vmstat.node1.numa_foreign
 4.337e+08 ±  2%     -13.2%  3.765e+08 ±  3%  numa-vmstat.node1.numa_hit
 4.335e+08 ±  2%     -13.2%  3.764e+08 ±  3%  numa-vmstat.node1.numa_local
 1.046e+08 ±  7%     +41.1%  1.475e+08 ±  4%  numa-vmstat.node1.numa_miss
 1.047e+08 ±  7%     +41.0%  1.476e+08 ±  4%  numa-vmstat.node1.numa_other
     46.75 ± 99%     -91.8%       3.85 ± 16%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.88 ± 37%     -52.2%       1.38 ± 68%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      1559 ± 21%     -52.4%     743.19 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
      3905 ±100%     -98.4%      63.79 ± 87%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2418 ±110%     -95.7%     104.02 ±179%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      3119 ± 21%     -43.1%       1775 ± 45%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
     46.75 ± 99%     -91.8%       3.85 ± 16%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.88 ± 37%     -52.2%       1.38 ± 68%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      1592 ± 21%     -28.5%       1137 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_locked.__sched_setaffinity
      3905 ±100%     -98.4%      63.79 ± 87%  perf-sched.wait_time.max.ms.__cond_resched.down_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2418 ±110%     -95.7%     104.02 ±179%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.07 ±  3%     +36.3%       0.10 ± 19%  vm-scalability.free_time
     68409            -8.6%      62504 ±  2%  vm-scalability.median
  17728194            -9.3%   16073786 ±  2%  vm-scalability.throughput
    319.99            +4.8%     335.48        vm-scalability.time.elapsed_time
    319.99            +4.8%     335.48        vm-scalability.time.elapsed_time.max
    457256            +3.9%     475107        vm-scalability.time.involuntary_context_switches
  33563166            -2.7%   32656296        vm-scalability.time.major_page_faults
  64624910            -2.5%   62992880 ±  2%  vm-scalability.time.minor_page_faults
     67772            +7.2%      72668        vm-scalability.time.system_time
      3945 ±  3%     +39.3%       5496 ±  5%  vm-scalability.time.voluntary_context_switches
 4.832e+09            -2.4%  4.716e+09        vm-scalability.workload
    108470            -6.4%     101551 ±  2%  proc-vmstat.allocstall_movable
      7708 ± 26%     +76.8%      13627 ± 34%  proc-vmstat.nr_active_file
  48995520            +3.0%   50484575        proc-vmstat.nr_mapped
      7709 ± 26%     +76.8%      13627 ± 34%  proc-vmstat.nr_zone_active_file
 2.096e+08 ±  7%     +40.5%  2.945e+08 ±  4%  proc-vmstat.numa_foreign
 8.696e+08           -13.1%   7.56e+08 ±  3%  proc-vmstat.numa_hit
 8.692e+08           -13.1%  7.555e+08 ±  3%  proc-vmstat.numa_local
 2.096e+08 ±  7%     +40.5%  2.945e+08 ±  4%  proc-vmstat.numa_miss
 2.099e+08 ±  7%     +40.4%  2.948e+08 ±  4%  proc-vmstat.numa_other
   4523100            -3.8%    4351843 ±  2%  proc-vmstat.pgalloc_dma32
 1.076e+09            -2.7%  1.047e+09        proc-vmstat.pgalloc_normal
  1.33e+08            -2.6%  1.296e+08        proc-vmstat.pgfault
 1.084e+09            -2.5%  1.056e+09        proc-vmstat.pgfree
     44710            +2.9%      46001        proc-vmstat.pgreuse
 1.894e+09            -3.4%   1.83e+09        proc-vmstat.pgscan_direct
    188.17 ± 53%    +849.4%       1786 ± 19%  proc-vmstat.pgscan_direct_throttle
 2.019e+09            -2.2%  1.974e+09        proc-vmstat.pgscan_file
 1.251e+08 ±  2%     +15.1%   1.44e+08 ±  3%  proc-vmstat.pgscan_kswapd
 9.921e+08            -3.0%  9.627e+08        proc-vmstat.pgsteal_direct
 1.013e+09            -2.8%  9.842e+08        proc-vmstat.pgsteal_file
 3.506e+10            -3.6%  3.379e+10        perf-stat.i.branch-instructions
      0.07 ±  4%      -0.0        0.07 ±  2%  perf-stat.i.branch-miss-rate%
  19028096            -5.7%   17942247 ±  2%  perf-stat.i.branch-misses
 2.697e+08            -6.8%  2.513e+08 ±  2%  perf-stat.i.cache-misses
 3.767e+08            -7.2%  3.494e+08        perf-stat.i.cache-references
      5.88            +7.0%       6.29 ±  2%  perf-stat.i.cpi
      6578 ±  3%     +15.1%       7573 ±  5%  perf-stat.i.cycles-between-cache-misses
 1.297e+11            -3.1%  1.257e+11        perf-stat.i.instructions
    105019            -8.6%      96024 ±  2%  perf-stat.i.major-faults
      1.74 ±  2%     -12.9%       1.52 ±  4%  perf-stat.i.metric.K/sec
    205980            -8.3%     188832 ±  2%  perf-stat.i.minor-faults
    310999            -8.4%     284856 ±  2%  perf-stat.i.page-faults
      2.04            -3.0%       1.98        perf-stat.overall.MPKI
      0.05            -0.0        0.05        perf-stat.overall.branch-miss-rate%
      5.96            +5.2%       6.27        perf-stat.overall.cpi
      2920            +8.4%       3167 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.17            -4.9%       0.16        perf-stat.overall.ipc
      8748            +4.3%       9123        perf-stat.overall.path-length
 3.555e+10            -3.3%  3.437e+10        perf-stat.ps.branch-instructions
  19241063            -5.0%   18269932        perf-stat.ps.branch-misses
 2.689e+08            -5.8%  2.533e+08        perf-stat.ps.cache-misses
 3.785e+08            -6.4%  3.541e+08        perf-stat.ps.cache-references
 7.853e+11            +2.1%   8.02e+11        perf-stat.ps.cpu-cycles
 1.318e+11            -2.9%  1.279e+11        perf-stat.ps.instructions
    104655            -7.2%      97097        perf-stat.ps.major-faults
    205059            -7.0%     190661 ±  2%  perf-stat.ps.minor-faults
    309715            -7.1%     287758        perf-stat.ps.page-faults




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

