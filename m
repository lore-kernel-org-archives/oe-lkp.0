Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6439E180;
	Sat, 13 Jun 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781336324; cv=fail; b=n+XVklyTq1P86nEZx+h/BRgd+gs8TUI6UCpZ2Ry+jxMGxzt/PiFgNi7xQShu/9f/MpUwLNb6ICuytlI+qb3Qqh0pA/82GxAqERK2sS9ZuqApvfWo0hArh4hEjHWVMweRNhSzhcGC3XlFie40ur5YKLo+M20Z65IDRAaXhno3t1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781336324; c=relaxed/simple;
	bh=Md87oE9GN0gmGRgPUJHUsyrzAIOhN0y8u8bKFstLxRM=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=BocXG4e4VQ9n7wyOhbPOvPNsJUxXu/SWlCxIqjz0XMxoxvnJT5lHNhJFFBNOYW67gBZQgYUcfJaWHnKVKcMwyQr6mqdFua2imn6yIyjDOfTMHC22ahzdFzhxgpO4VnIHtwisJ+TmPbNc+V/Dg7x45nLkgHZW2CWCqb+0DuD/QUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqJIoz6p; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqJIoz6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781336322; x=1812872322;
  h=date:from:to:subject:message-id:mime-version;
  bh=Md87oE9GN0gmGRgPUJHUsyrzAIOhN0y8u8bKFstLxRM=;
  b=hqJIoz6p9qtSuO8S7QogpdrLkJtFVHujh69AzSITrzjC7WezeZ75VrHJ
   uoRnhiPUoUP37WHRyJXD+0Xw3iiCe8FYSs/SG3mPmhZx9SrS3b8eM/xkD
   bRSVjSh15dATiDdl6WjkVO0glnCIf8/FdjJi/4fpcE2Z+gHnc1m18WrWv
   Fw4mR1jYWElz9ESxsUhL8Z3HmOfdeWZ2wrzoCaCwoO2KCX/7izawFuT2s
   8v3ORigESCwE2vTQdJZ+dEosulmrokQxhP1xBzmQxEIIeVYStYcty7W0T
   tV4bpHDANYf2fDIR2nZaa1FzP7uPOH2IFc0hvheSoMNkbZlvJZLXMxtaN
   g==;
X-CSE-ConnectionGUID: oVPPf2jjRcG/bm8NTAmVlA==
X-CSE-MsgGUID: u3CdIRK4RSaFS+2CO/Zbww==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99580067"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="99580067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 00:38:41 -0700
X-CSE-ConnectionGUID: 5hIXj0VWS8q0+35dDE4nFw==
X-CSE-MsgGUID: 3yXEL2PiT3COkeabbTO9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246114299"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 00:38:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 13 Jun 2026 00:38:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 13 Jun 2026 00:38:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 13 Jun 2026 00:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJFG8N4zkyWVyEQJzb7mQ+NQ7C9tQwTxvJwYGJOgvvdXUug7VNY6xrQXWg5HiCFi+sirWjOXVNKflGVo9/1ScU6OmMKzCjuRdZP7Av5afjfC3SP8TF2ZJHTDXTodxTlzbwp5eHGpYKBLBwsyduGOf/SWW8R+M6WiIrRzu5ZSQABcdPReg8MGokr9c8HKwSEBkt5TqMg8KrV93VAoicTEllKiJooPt89zPEJzJzIMeuS4Q76fABOCBA8ROv9xdI06t+/9e4OMkQYXbYbKuTk24CrjJBCxgqDDD5I6z33y8Ai/E9gbGfrCjNZ3gXq+rx60FrcxHL+SFqHBB4UWNE45EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md87oE9GN0gmGRgPUJHUsyrzAIOhN0y8u8bKFstLxRM=;
 b=SuntIJgadDeVZ0J25ubtYDY3lTA78yK52KhKggg9EnI0eWE9BEYPhFQIVd3fmmW56eiZ9KCi6HmQtT7C8JBm38k7N2CIuZMtwEoWcCpQPfs3EpobqsOSEE6sVWB6Sd0GoXvvBIJErXp1qicRnkZN/9AxM1ornPzNFDDIdj9/Aiuc8HLRNOBOBwMlEnbXiobZ/rRohwPaDPuARO9cYwqwK4rJGndNdpNTZSSsktzGb3ociTP7Wyf6CkgxgNF6jVyYO2+z7hoQ++bgzB3JRK7xahZJj2Wbqu/dBzKHpCOIMh3CxImArPv9M1nt4oQcT7MQTt7FWm7MOtFrckwSOZL99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Sat, 13 Jun
 2026 07:38:38 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0113.014; Sat, 13 Jun 2026
 07:38:37 +0000
Date: Sat, 13 Jun 2026 15:38:29 +0800
From: Philip Li <philip.li@intel.com>
To: <oe-kbuild-all@lists.linux.dev>, <oe-lkp@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: [NOTICE] kernel test bot: =?utf-8?Q?tempor?=
 =?utf-8?Q?ary_service_pause_for_lab_maintenance_=28June_18=E2=80=9322=29?=
Message-ID: <ai0I9Q4V+h3sNAlM@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:d10:33::13) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ef4e29-a6e5-4e49-27e8-08dec91ec798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tBla+Rnb5Blx9fabQSQ6T+1jbhe5W+xjGDjbRNSHfxQ0EdtRYTov1rvDFRrJyWaqHeGea5fla1Ik+9rNkZHo27x3GJhzJDdZhD59Az4rh4sHWi/Z/DB/2YzsrjDnUdSc3jwaYEN2OHL1Pfzv+EDSygNOlxLuGau+xaG+PeCDv2XaucHLTmBVQkOgAaH2SU4HsfEi8m29KywtfIGkS28+VYDTt9S3dAGKaKW20BroS9Whp/rbE5ktfaXaGrB4b0iFBCzVXQRsuvFeblZZ+qadlicBRqDEpLk7eARJGbuChNvBFL1pdflUinLPh/cjMPRl/EWGMt5o0EgLXVh0AuLZeYm7/I33wQrnV/lHJ2wUv7SdH/9QyVkqI0UgXmkv7jVNzGl+zqg/epOc89ZTxAVz2kfmQPdtizGJ9uvtvyBvBReb+W4HWarLgeFq+9s7GRWVRXpyMTDYczbNdqTpDiA6uLIy9myVUL0qDsyYVwCwLuBQwfdZc+2fkCe76sdJl3dj8jyiumz2rIjpyFePV9hiWJdiGrRCkAxFO6c9FbWwUBDiWsNP85+mMDjyA3iKaTioB5uW713wxMSBA/ZGg/H9u12ksrUYfDce4Ay2jIgjQEEchwsAcAvUqyuRO7IwI7ciYPp452GxrYLW+aPEjUkHs9olM3mBpN7t8n0KA/tmTvJ3tAZz2DzLzz0DHeklXzua
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?urcOqc6Ju98ibUWL8xI8iJO/4qMpBBzoLwhg2nuBXO2rpY83smheYg8EEAzC?=
 =?us-ascii?Q?5FyZIxmAoocDimz7ourXOk6lyv6k2ZbwUE7c0lZpQkrdulkA1eO9QYq30j7h?=
 =?us-ascii?Q?+W760MhwNjrWEW4dsfEyObKmQeIE61HLKqcTzNIT9qQVEOFRXaM+9ZoIyHok?=
 =?us-ascii?Q?9HmSAZxCyXOsfCw6WTObq6awsrYQzNkWiaxgO0bS69G6gtNVwZJwZ44FxDJB?=
 =?us-ascii?Q?NTJ5A2T3wiVyLaC3DpiGaG5jWO6OuKFeHZ0a1LdMrHtiPraeQ0UNm8MHVmMT?=
 =?us-ascii?Q?6lQsXzc/Hs9bqk6NZH6yZ+usjFrotst2gEJ2z10tkB1u4oxdkeHTmZYIluNY?=
 =?us-ascii?Q?8Lzq10+ApNWNYRp32c1QwlXhQrpoBs2PPUMuJB6JpQK3x0bB6AEROaRGqIop?=
 =?us-ascii?Q?zteTZMAVkK78RWGHmpuHKmDe0X68hrjN1NfuvAl/2so3YnoOuCbYpbrcYc0k?=
 =?us-ascii?Q?SGskxJ+lCMhsaeChVuN6E8UZNVcKzNl5awtavouaVLZacaaB5FNH8+dfuHvj?=
 =?us-ascii?Q?l/koB45MS7hAVSFOFzDXyOeBrvbO3YtaVT6UgygMCjkGQHbu0OdP44aUVyEG?=
 =?us-ascii?Q?+ugyLykUYECnUZ265R5VGBYXCaECOW7gOxvAHShh2JcNksUN+PxlOj3Uor29?=
 =?us-ascii?Q?NH+H/JdhsVpJ7xCsLh+fpPi7TBngztmPEEGKwjwEW3b8ASVzeLWrqRbYtCrs?=
 =?us-ascii?Q?TKg59kIMiVnCcNX45jsoNN9nz3Vk/HRO6Y71n5m/ihondAS6L9BiYmasCIfj?=
 =?us-ascii?Q?WZKtJln4WrKGqZmzvePiY3y6SCP7B7l/UMMRtuEVAg+Octwb9B2alFX7F82W?=
 =?us-ascii?Q?L8Bkb9vh0+BYJMQWIvBGgP29yuyYZTn+BS0sZKtPVWowYmQijq41AuTRKq3k?=
 =?us-ascii?Q?xFn+No6Fru/6RD8DggtqmlhjMb7Lx9jj5bThMhAP+lcZPO9RLs9EQe7q0r+N?=
 =?us-ascii?Q?8FmRmuwzxGzzNExZ7j92Ex+1UQ3BD2k1RlrC+y7AXLAHfN4VGGK5RECATvDf?=
 =?us-ascii?Q?3GCGeKWkKboMf3J35KVUomwz1IK03y/Yln05ljL3xpVyYFlOSPWW2YvpdWV4?=
 =?us-ascii?Q?xOZ1yHrAavCZVbQdTIR5QSIQfuLY0RmgwnPc06J6bxYiesdlgAl80yf+HOtg?=
 =?us-ascii?Q?6Cwh7POqPCLMeKxClA4G14Rlh5+dyKSr32I8JufeHVXTGg2vuNWiKA7CSAsu?=
 =?us-ascii?Q?F2IPaiNrVkOJN4if37o/R6lcQhBQ32wQ1vcNE/xJSwek9ecLKXoSZCtEqtFw?=
 =?us-ascii?Q?lWpFtmOzUH4d7RC4sUQmiCH1lOjJNJNkkzYUd72GFAR2q2l60XuitNlikru1?=
 =?us-ascii?Q?ZktQx11ya9sRcLYSYA5B7AgD+afXvx/MOmtMJKG76u7D8AghFi4wvL6XLNqv?=
 =?us-ascii?Q?aNPT3W9uXbvQTYJq62VB92G67UW3hh3UAIDMWfhX9dx2pcg62JDwB6bissDK?=
 =?us-ascii?Q?+bExzO6WUK5ey+HPXADZnzJv/DRVfn5tHiMV59QvfQuB3XB7J2kv5cI/oXb7?=
 =?us-ascii?Q?+Ax7aNKf6iUkcbqttwE6X5pVtGtUDqZc4qak1zfTFhquGYQ4Y62/ukbrLJNT?=
 =?us-ascii?Q?NsOnojl21auiH2oxLZU6mV+VEpHtciriVLuj1RR9kkA8pE908yatc90X4k4k?=
 =?us-ascii?Q?SFnBgf3wHi2owaApPRDJ2AiLyGzzCwbSBoq55uO88cJZv029uUq4qk46iQlX?=
 =?us-ascii?Q?1voBstMAceYwaiE9g2RZvWQEfPEUH/WiQDlg/uqIQdZOA4d1WmEjhweA+F40?=
 =?us-ascii?Q?GlDYrsIUsQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fYeABwtALttsFodP30x8ZGUwSz7lOZCozzjEh0GgizZpn4YR0xUBU0UQZqhnPv85KV149oPEShfZHfPxOhjJw8WyF+4fqtTEpPiOelaV/RmTkYQy3UFkoyUR6gKgCd+i+PONMwyvWEYiOtqMh2bs+O/HX0tptxRPf6pXJA6ZzR7Q34bFU7qw+ESozZFr2fErJl0M3iU/6AVgJnL0sGnRTRcXIsXKWZFLzaoHD+ZSVjxBreGpNqsGTknQKGkuN8V7v/vvmMMTq3d45QvMsdlo10uXM1qf45gljha9xlKX6gcFMhI9J9XoownO0wVjMdLxRpM84xQBfEmqRQJ2E0aM1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ef4e29-a6e5-4e49-27e8-08dec91ec798
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 07:38:37.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8El0Vz9r6Kd7cVJjO9jS7accyn3CSJU0otgt//5fqIvU1oBmN3iqV3sBCMS2CXcfyh88fOTMGMLLQLFoVQ3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
X-OriginatorOrg: intel.com

Hello everyone,

Thank you for your continued support of the kernel test bot.

Please be advised that we will be undergoing scheduled lab power
maintenance, which requires us to temporarily pause the service
for 4 days.

Downtime window:
June 18, 2026, 6:00 PM to June 22, 2026, 6:00 PM (PRC time, UTC+8).

We apologize for any inconvenience this temporary interruption
may cause, and we will work to restore the service promptly once
the maintenance is completed.

Thanks
