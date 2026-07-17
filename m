Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936F33F582
	for <oe-lkp@lists.linux.dev>; Fri, 17 Jul 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784253985; cv=fail; b=Ske0hjW9jK9Dp/U3VeCfZUL+uM2uzZCFj3q7XRHPIn+n2fqf02bOJvHL1l8qJhY7cIKxs9E0z3p3bkQ4cshdx9RUP5yzoDUuD2AZ7G73v1AT3xzHzMI8nrsFZw6xdWyv+LhpE7o6itZIYzcEgovffJ1krrG9yYBgIbnp2aCT3d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784253985; c=relaxed/simple;
	bh=ZqrwuT4TIc0TUcrg5zZuhzvHjF9xbRv0McUResSL/Do=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qTG1IwYS/yYA2kXrmd5nk/rhRI9VRXN0be3B9bXdnxI6qerOXPbrqoQWLCf6ch+HULUxDDadd6Uf4x5d5yP/PSKB2bzoXDeybA8BqJcV+kzXQzlB0XuD0HfQ63uwmX8b43xK120aiA7b7ubvwybMvjXJ7JJxFuha6KIe/ITx2Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm2KR+Ei; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm2KR+Ei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784253984; x=1815789984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqrwuT4TIc0TUcrg5zZuhzvHjF9xbRv0McUResSL/Do=;
  b=gm2KR+Ei1AlWRzkPqhtcyVky5ijfcNM8Cujtq4QkejLMehoRhIGdVs5i
   n/IwNh9i7n2B5L8sefdGh/IZRow0ufcIrAI1xQb5Zmn0KyYbLr3R6YjUJ
   uow5CArxht5QsUWvycb4gUr8ykujx/QsS8sXmNuV4q67oKrObav3MJ0W6
   r62PVakavDH5ZUDwDxpB7V0OAHfPrhB6qrZlzxfYOEIQGtWk5hOOaR7fj
   Kr63KkAAZPB+dl8/8m/vZe0Bf5CltZnsixlKtsC9wYjMM07oqsVgkaQWi
   r5Cr4FHGHQoxUvtUZxesFE8PAW63xMZZdl/WZGLQCtE2ZHH0ZFOYe2lia
   w==;
X-CSE-ConnectionGUID: /gfZ2H6dTmaAQjetcI3LeA==
X-CSE-MsgGUID: BY0qaLaLSBW1hu7c9P6Iww==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84702005"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="84702005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 19:06:23 -0700
X-CSE-ConnectionGUID: bwm7wzPcQIyNqiYqzg1HiA==
X-CSE-MsgGUID: T0lH8p7+Sg+8YZ7u9XZwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260238973"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 19:06:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 19:06:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 19:06:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 19:06:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfY/HiOWyyER8oCo3UPiA/gwFt5fkU7EDJLLh4ONAHO+UNZhzdQMlm0gs29jqYpS9R1/RsUmymuTf7tNDSCCWSr6FrFwpYj2GGtd7lsBimL3zyR9r7N5zaSbhq59UjPVOjTCPKSNDCLSFhw4N8L/gk6E+N/cAIaWdJSZ0Ptx58U8SN5+NOwFh/pekkZZs63Yp5+lSQ1TQ7Lzxy2GTM9E+9SVjf39uDEk08WgVTskZuj/BieJs3Wh3/FjhgXBgyUM/y+X593WTbKNWeoC6uurulfSVsezoK4hF4VakzmSbSFpua2Vti0DlvA/RQCHPCaEAggyMCeCNY0m0rl31NKI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy1Kvcm1f4rDYKAscWdDRGg2x5IYv0pDyBdYi6dguJ8=;
 b=taR+AusYN5lfRNwpGAkqdXBTSuamMqcw/kHk2QweB3hzfRI87BNM7uf9MKHSu+fVGZNvetx6Kjq+2+dBoKPjcuv3m0e1S10WowAX6eq/x5KmIia/jzwwAJSW3+860TuPQShwT7GPVDGGnFc67IxBWQkHVEQ6Fcnny94sVGRdA7k7l7u/wz7QXyCAtP4lf9jobYboJTBOwJ8QDT48mIl83PnHn3r2wssVdPLr0T51susYolIyRoNUvolhCL/HogpOo9l3tOoni25zbE/8gmTOOhVMg3ckEYw7q9F3siDUq+P25ekLZKyxGAeekzjgoxzX150GkLictct4qz8H0t1jaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LV1PR11MB8791.namprd11.prod.outlook.com (2603:10b6:408:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 02:06:18 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 02:06:18 +0000
Date: Fri, 17 Jul 2026 10:06:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gregory Price <gourry@gourry.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Gregory Price
	<gourry@gourry.net>, <oliver.sang@intel.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5] [mm/page_alloc]
 78a7080812: UBSAN:array-index-out-of-bounds_in_linux/gfp.h
Message-ID: <202607170545.4e054b0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LV1PR11MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d562c89-c09f-4035-fd9b-08dee3a7fd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: l7HgpbZxLkb4d47a5cipKSrlRr3muRqdjVpV/njuqdR97Yr1Nb2n/uBqPn0XMqq9IA5AY7g/Pw1p51ox2/VkBR8BAS1BO1psnQOgeOfmO7NRHkGjdqbycVcJkAcBqfzn1BFm0uGlQhWTSyoq3w7J9yB21BED0YQNZkgOA1a5NXZVWvuBkqiNJ1cv98Ac6zUX2Pd4fX2CFYQqCrC0SEYnVTQyZ7C1gD2Qwvocp/S6r+UYmGDRa6NKFW0xexWA0HTJ8fAmAAKNtByYgfbcn7W2Mxre6W+AS4N7hv/9GoYNzje9r/kf+ch/VS0dxBP92dDDKkR0wLGad2cQ3onPoU0G0osrCvfq1voBs5s7hFXfEntsSLezVRJ2nkN5ct5ihqPRdbe1jUlOpHShMVR3sS7jGvE29VTM9+hlgTGHtAM35OTMbQB3vxiN6EjrFM0suG50AvC8AaT8/1cKLOwPjFlHnReTop3F7kVjPsR0mitz9o0XGN+52AtwKXRz0+zHjIq/8lHzl3H39Z+lIF5mAlwceAuJMoWCFBSojh1LfpJNugmqDsZ2gWO9FzwOM/BZC6mvwiynA+eiWsAWBUDrU6/oywd4Yke8zOjIjB3O667jmeFqtZn1VfxFrgfYG+4q85g+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OA5gwsuxbOF4UbDDZrscxSFX+DekwkwXZg9aiGKRb21s3a0w9NC6Q35rJNdb?=
 =?us-ascii?Q?1uDeLiS1bnqydnGrsLIsZ1TO384Sq8CKh3am5orU3FKCkLFGtKoUFSmR7Mcn?=
 =?us-ascii?Q?pprKVfDiQWBQsy5EBHvVo6F2v7xeGmzwxTxXZuQYMNFMf+IsMdv0/YuxZX06?=
 =?us-ascii?Q?nVZg2DH6om16afElKgIaXNjoYeLUvzNRxXnRDDFVQTx4jDbp4GounSzqAeKk?=
 =?us-ascii?Q?S5V/q0Dg7fEQq0KjrD/vj+4e8NtOtwzIYH3/ytTv4zIfJbyUSUsH3bVIF5dR?=
 =?us-ascii?Q?9HODWPdZ/oORpCNtBDbUN24N01wr4vAeTv29nLe7yTuGlAZH0VfXGacVlckp?=
 =?us-ascii?Q?nQqe2kAJD0pr4QXyA6EMOkKFL3qXad+ijDTNt0K6U37VT7dX6Nf/BZNrK0Hd?=
 =?us-ascii?Q?VrFEZL2VzxnJbIb/Op2OBmPD5nu0kgpQ6D9BJ01t8V42l7HmwG2U98W0mQNe?=
 =?us-ascii?Q?Vvovgv1vKOuKesbXif1VKmRB4qM6mSrNYzY1z1A5OFYArMy71JXyMu3Q29Xf?=
 =?us-ascii?Q?a8qSQjWA4mCBD79a6S/POtQgM+ToqZrOr11cqVezQ5E15k+YG367mt2qAXpb?=
 =?us-ascii?Q?uLJ5QWxZnY3Fs/QpU7IZtGQuLn3TUMMb/7gXlo98tPGMlfMLlGN0ExMyilud?=
 =?us-ascii?Q?vD0CPZ6NkG8rAaESzOcRjjtBVphCEY+rNqrrYIVQycqZQu8nijFML3iKw+4a?=
 =?us-ascii?Q?tQi/DO8WcQ2LU0mc4FTPoHiaXqaw8lKK4eXoP9GwE0H1IoU3V+oE00MEvElH?=
 =?us-ascii?Q?+IloDqWQ2UKTDNhn8L6unr/HZInNuPuYii/cfjIuNkOUDyVuUA/ej2XKP3WY?=
 =?us-ascii?Q?2s+wyHuHexD6P4xd4Do0zWI2JA7uSPArazjfBn49O3doUtYd6iBmP3uLCN3a?=
 =?us-ascii?Q?xYs3on4e0hiRO0hUv7OeFZclLlkHrvm+Gflhv3A9cLbE1syG4BCRQJlWczO4?=
 =?us-ascii?Q?d+jmZGs2NByGOo5u7sDfTlEQoRSC6yAe2ELKJKiXCA/SUOc16eNcIhYLIK+i?=
 =?us-ascii?Q?qoOJaEDL1TjEFV64ccbXhusNvQzJUy/jy6hxC+HP8ZTlVghMynxCh1AnUFlY?=
 =?us-ascii?Q?jeSW7Jvz90zqjbeP9lb7mnJOL1ZrB90d9kTk/esjhX40F3h4ZR+ETUnfSs7c?=
 =?us-ascii?Q?xeoyZPo3oPgs7np3REW37bUHRwgU3h7gqnKX45F4JXOMPU54CC4vOS7yKabm?=
 =?us-ascii?Q?BmfjvDnKx0/46GopDKtzSbM5BFJ0A7a9B4gUMWEzMI53zUVLM4ApYtOWzadf?=
 =?us-ascii?Q?x8zWG6Z2KzkTOySo2rEmaQMUfVKhewIjM1fS8ge9CUbirHyJktDgZR2Xnqmt?=
 =?us-ascii?Q?OsaVD+a8T7xfeRPo/b2fSTd+/7zJg2dhC93IACTe6nJcdg5eFktqsOJHwW+V?=
 =?us-ascii?Q?zD04lFE4SAFVOgDWwsDRZzobHB4P7GaQx8b+XEarWMYLKXp7SebYCha63iu0?=
 =?us-ascii?Q?ickUy3VY+yOrv7oYBylbXjvVK/r5JQLCJVBdnq1PdY5/0ZOtO7J/PZwH8W/p?=
 =?us-ascii?Q?xEUSu0+71+DWp1Z2nTwhNGciU+wu/rmGJYDVJVHzuG/hFtJTX+aNkxGlF5/g?=
 =?us-ascii?Q?wAPXFij0jZ8dAgx/98DexKvRfGCmXswYzTNrsVFLYblQWqN5i1msjIy7y2PK?=
 =?us-ascii?Q?LxiV0UHO2YaCcW4JHReYcslpaotZ5AIOQ0m2/xT2UXtqGZ6cD3638NMAgNVk?=
 =?us-ascii?Q?a6vZjyUmE3BxpG+kIfAYUC6K1+fE7piavXctQJt+O+QRthX9sOcxodUgMLmy?=
 =?us-ascii?Q?y4kBjbnQqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: c+2BAvhlvKlMQ3PuZHTt2HwfuMp3cJbIcXOd3H4GrtvNdhUSRXYDKjgbErxeX3kARp3LYOZgSblxDGmQK/PRCEgIPGVeu9yF3rRxvVTd/YgvacMKwmE/ODWcKeo1H3dtXrRyUNvF2ci9iojpqxVVfajtbi4OQHbn8dFTbuokYZylytT8iuNO4zefMWigt1EL7nxrKJon+eAuHeMrAmfKMQsVUCqyc+8POV8Oryra+X86aHMHtLLcOOmj3Q53low9XWdWuf0xuEkIiNYNTizlKme5EKNVPeABIXo6pb6QBPdbKCm1f42THHu97qWHsqKDO00nLLxF4ocC/c1Bw53xYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d562c89-c09f-4035-fd9b-08dee3a7fd8b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 02:06:18.6997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVo6NyJ9s54lAIUg+HluN01j2bLxGoEX8eX7HnLReHS+hZezWHsAGCTBzDJ4vEKx3yNF85dmnn8pv5Ft57uFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8791
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_linux/gfp.h" on:

commit: 78a7080812fd60e3aca2770f42185c60fb9adc4c ("mm/page_alloc: node-strict private zonelist (ZONELIST_PRIVATE_NOFALLBACK)")
https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5

in testcase: boot

config: x86_64-randconfig-r071-20260714
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607170545.4e054b0-lkp@intel.com



[    3.751402][    T0] ------------[ cut here ]------------
[    3.752820][    T0] UBSAN: array-index-out-of-bounds in linux/gfp.h:236:40
[    3.755156][    T0] index -33686020 is out of range for type 'zonelist [4]'
[    3.757047][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc2-00020-g78a7080812fd #1 PREEMPT(full)  782b3f07ed27af074729c4232601262326f9252f
[    3.757054][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    3.757060][    T0] Call Trace:
[    3.757063][    T0]  <TASK>
[    3.757076][    T0]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[    3.757087][    T0]  ubsan_epilogue (ubsan.c:233)
[    3.757093][    T0]  __ubsan_handle_out_of_bounds (ubsan.c:455)
[    3.757109][    T0]  prepare_alloc_pages+0xd6/0x330
[    3.757119][    T0]  alloc_pages_bulk_noprof (page_alloc.c:5145)
[    3.757129][    T0]  ? __alloc_pages_noprof (page_alloc.c:5358)
[    3.757134][    T0]  ? policy_nodemask (mempolicy.c:2311)
[    3.757149][    T0]  __kasan_populate_vmalloc_do (kasan/shadow.c:345 (discriminator 3) kasan/shadow.c:370 (discriminator 3))
[    3.757158][    T0]  alloc_vmap_area (linux/kasan.h:580 vmalloc.c:2123)
[    3.757170][    T0]  ? reclaim_and_purge_vmap_areas (vmalloc.c:2425)
[    3.757175][    T0]  ? local_clock (sched/clock.c:321)
[    3.757181][    T0]  ? kasan_set_track (kasan/common.c:65)
[    3.757190][    T0]  ? __kmalloc_cache_node_noprof (linux/kasan.h:263 slub.c:5534)
[    3.757197][    T0]  ? __get_vm_area_node (linux/slab.h:1174 vmalloc.c:3215)
[    3.757205][    T0]  __get_vm_area_node (vmalloc.c:3226)
[    3.757230][    T0]  ? irq_init_percpu_irqstack (x86/kernel/irq_64.c:49 x86/kernel/irq_64.c:76)
[    3.757236][    T0]  get_vm_area_caller (vmalloc.c:3277)
[    3.757241][    T0]  ? irq_init_percpu_irqstack (x86/kernel/irq_64.c:49 x86/kernel/irq_64.c:76)
[    3.757246][    T0]  vmap (vmalloc.c:3560 (discriminator 1))
[    3.757252][    T0]  ? vunmap (vmalloc.c:3519)
[    3.757255][    T0]  ? __lock_release+0x5a/0x150
[    3.757261][    T0]  ? rcu_read_unlock (linux/rcupdate.h:310 (discriminator 1) linux/rcupdate.h:871 (discriminator 1))
[    3.757274][    T0]  irq_init_percpu_irqstack (x86/kernel/irq_64.c:49 x86/kernel/irq_64.c:76)
[    3.757295][    T0]  ? fred_sysvec_thermal (??:?)
[    3.757302][    T0]  ? mp_check_pin_attr (x86/kernel/apic/io_apic.c:880)
[    3.757309][    T0]  ? alloc_ioapic_saved_registers (x86/kernel/apic/io_apic.c:226 (discriminator 3) x86/kernel/apic/io_apic.c:218 (discriminator 3))
[    3.757318][    T0]  init_IRQ (x86/kernel/irqinit.c:90 (discriminator 10))
[    3.757329][    T0]  start_kernel (main.c:1079)
[    3.757333][    T0]  x86_64_start_reservations (x86/kernel/head64.c:310)
[    3.757338][    T0]  x86_64_start_kernel (x86/kernel/head64.c:291)
[    3.757344][    T0]  common_startup_64 (x86/kernel/head_64.S:418)
[    3.757358][    T0]  </TASK>
[    3.757360][    T0] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260717/202607170545.4e054b0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

