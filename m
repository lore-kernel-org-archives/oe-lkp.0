Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045730C157
	for <oe-lkp@lists.linux.dev>; Wed, 12 Aug 2026 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520259; cv=fail; b=gZEG3hy4aZcVjhVNbIKZzhCcbDnktCwGQwNt4mGNqX8FHbESAmPZlP6UOxpnoOAC1nyVyyfVxt/7DNDl+327jHoxjaex2bSKxWbvli7lHNlKJee63jQqviI4nb6kQvD7gJ/FxLKVI7Pas50KmbwyHyQip7cSftX7jOpLvb3uEsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520259; c=relaxed/simple;
	bh=oeycdKICTl1stRe6CBqJa8gsjsvsB1tsRgM0JvUz/eM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RumLYG0sLZVEtDsmHTlm383vF9Xu+wVxzE5x8n+GnQVc75QvlgB/y5zL7jnfyhSkCE1pUEOiHCZE0nd7CEaB+81If04VktLnh5O1Do94sEdr5feUtUob27hl5QIoYthQaj9RN/c8ho9LOFfFVa5fE3CtjwH783wKOhcpcdZYjFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLlXHAJP; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLlXHAJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786520256; x=1818056256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeycdKICTl1stRe6CBqJa8gsjsvsB1tsRgM0JvUz/eM=;
  b=HLlXHAJPQi5EpVKO3yzdXDVX9ipW4VQrZQGXuq5A1f6Est3SiN1c39MZ
   bC8Ps64TkKGkIWK17s4mbGjMMKygrQmubQnVFefVGrbZmHza+yuhy1hpV
   fAnfdBGKQNXBPXyfLjmeHaDzEoGKpu9WeWOEwJQVER01Jx8iPkRVSiUe+
   PIAXNNIg6VBa3TD1YC44EshD8IUei0ByJ51MzUoRizyibwsgPsdwewkIO
   N0NCDDR+/X5hfgAvVrUYk1OPWy/1iBBpsLwbivQ+BI/MYlPX3zed5lkLR
   LUZ/TaiUvWRIH1nzu2PNTxMemEdJLUem068ZoCOzS7qovJhnY7yxef5Oz
   w==;
X-CSE-ConnectionGUID: dKA/9B65Qa2MhHblb7H9eg==
X-CSE-MsgGUID: MwOtXVnxR/a7kf4aVTDg/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86021535"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86021535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:37:35 -0700
X-CSE-ConnectionGUID: D6elyxnJTCWOThFqiq4OjA==
X-CSE-MsgGUID: nuG5MvaNQiC6CuQU9Pwhbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="262254628"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:37:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:37:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 00:37:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:37:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zS2/V0wlj4n8T1OGT2IPtwRGPRMvd1jJw9HssQ46pm7rNyVXx9lnKKU9hwiw3EaOrw56+w5j4dRgBw/h/zNOFuNVPLtIw4hmCnpqPlsvkq41BYES50JX8HwNrZZ5ROQ7AwxE4n7ar5f1fNLLOqc4E7pcC2IVJDK21Y2PaXYBrVGgyuK9Ug4v/qNwHaFj5/buzz334Ir7GbK49QvC6QUIFnawe2QkL1Q5b/4XMpDWtigXfRs7OnGe3imoQPkWR/IQNQ79VzP8c1DnecmaGEU5MAfFgDUZbzb0Eo7uDavEdvrEInyW3ej27N218t1tqR0y3fsoc3s1ByvYIaanKhcl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyR+VcMl7LaMyp6nIQYJVz7NbUtuqdh42LHxJn4xWM8=;
 b=Kf2KfLFCoNnBuleOf75q2Rizb3nhVH9BvyUopb9q+G39U39t7l00lHsn9EfjTp3N6MILK2aPGI2PxehkctOsEbVrAsoqIKTdvh0a/1lsYF8dNisXbVa2qnMxY3GQMjoWfMHG6rJICddavD/cVVxgtgLHDjfy08PPE+dESU8MnznQNeFLZVI4er7NZkkzyQHsdaMUBliM7JlxaoY769jqSybZblMYN/1uFX/pNmdYWeZzOmPO4tF3alwW4Vz/6gvLnY3sdrgn4lusgPeKRtkZPM7oua1QpZ7/KBRMR/SbMoyqb+eTQN634M39jnH6uHzYw/7g9A4Yvog1AlhAGAP2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DSVPR11MB9696.namprd11.prod.outlook.com (2603:10b6:8:352::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:37:33 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 07:37:33 +0000
Date: Wed, 12 Aug 2026 15:37:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <ynorov@nvidia.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [lib]  f4806cc63c:
 INFO:trying_to_register_non-static_key
Message-ID: <202608121556.f0a5b5ad-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DSVPR11MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bedf84-6510-4193-dca2-08def8449266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: h2yR2jsnnMzqonX75709ZhT+D4sHQ5KbFry13yK1Cysb7MYfCM//8F5LG1YSjHQSsrbe1JPNwgtvEfGgggeSIlFg7GeQRTIYhDNQiCsEs/gvWVSYGF6j7mknrP9N5Y1ugMnAsfaqxnd/Tg5VD8cmzl2iABS1YzPGXR/s7QoAFzOHa7iqJy3flRpf0Lu614OdXCxlgBHfYN81hsQ78bpg5xqAzvgV0h+kqFC/W7kreHSpXBuD6gjGYGuEHlhJYay/vm+YuLP3AyaOdU9LW91aUlbK9BJoZ9sZB8uMjabZ9sa4uifcMPDNa3pW/P496d9XhTEP4w2Z5PEX3kAj89hhyTk0iKhUcPl/DI5apTjv4PZ9GyNJ41tzFcyRAiyUsXi4DOv1B01Vrk3VqXFGF225juH6778vxntR2AhnJtfJcUT58Qfp/ibToo4tlkbhmdDX/EozOdCh/Yzmr7oWbqkyPgJqGoGJFQeyDvVLNNQWE/WffYAaJw4mUe7wTgo8KX/s6Rors09vrmV3P3i3kVp/HY2WYQKRQZrn1TbL+UC3UhhLNZ25OY4uVuzVTPwVwvFvrjrc/SE+ZVGmrIMaTNeHN95NVplaSWQSfrXqop32rFjKlQkl0NtNW57HJwCA77phrcuq13iSG5pUpCDwQPr718ys77kvTXeIUCZYflcrDuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LDYlPFtai+mwhb36i4M2BXcOMwZciwhgtESgw5MtyrG6Ti7iaU5SzyDP6Z1V?=
 =?us-ascii?Q?NuvlRnC3KfcXIzv2MBWxo5fZZlE6dMNQXtQ0495wBBc/ZNi3Jd8EoIh7RByt?=
 =?us-ascii?Q?L95iKR6QCtlVGSpVFGweRvFhvyo60CjpYFiPzVMgeyVxATTAezjfEEqdeRBn?=
 =?us-ascii?Q?6UxWneGwEA+N8WA0CcohpK7X6NIkb7E4qr+KsvQrkyDcfwdjTC/73GqV0hgl?=
 =?us-ascii?Q?b6Z9HgRY7HrD2WtgeBA2AVirQ/e1EQ4Cl/hULaR7oXxDywJOmiKnfkDJSvR7?=
 =?us-ascii?Q?cjNLSO7817+c4ObbShg2Q+BeRCk87FUF/SlX+qZDFWfwWZ+MlzS+uf9PqeUt?=
 =?us-ascii?Q?4XsYExBJEFs0LzPabjSRTBxzIM4Q/K2jTApOoJX7BgjOeRByy8Cj/ZfrF0LZ?=
 =?us-ascii?Q?fRX77GQZ3eVA5g96YQwCPGYt181x3rs5+cCA7Jo1q0lo8UqSOYROl1mBDNyo?=
 =?us-ascii?Q?5jmj68DDl20f/nJkJyBSALp2U0lTju0WCn2wQLwcBv+eqv4zpCExzCzyOKYd?=
 =?us-ascii?Q?qfdVvz/xkGKl52vkjW4bKFsOqJRQcAbJPrKugCUbreEtx2Prq1+7viTEiO6N?=
 =?us-ascii?Q?yZHL6vo9khKekC/r1q1P89szmaRrCg8aESK0FUYmOmGOi5vtAiufpP+xMWHP?=
 =?us-ascii?Q?/CziVT9FoLOL++ucttRCDUGscfBMgApsRcev3AmFd404xADAI3A7oiaEUBAB?=
 =?us-ascii?Q?0RolZJF0JvQlou9Uz6g4gfKOSZAaK6rMdEIWXt+AYGWPyQrMwjDTeamwhauc?=
 =?us-ascii?Q?U73NU82zzKtPqSfMLBwG+ZXcSjunYAvO9pNykT2LlqWlFNaXvvqkQQiVvSw7?=
 =?us-ascii?Q?4AGodrobrD5hCZOVzmHfZ4iGGrmJeDq5j+BJT7i4ZslEGGy9NdaYcgp9tdN2?=
 =?us-ascii?Q?/TyZleaUcoiiy5iJ9AkMfa7VyMNUa9UkesBFbAJh0FQLO38mcaHFmpaxpQfh?=
 =?us-ascii?Q?y/WLdLZiluBqdR/41u8xAAjBd/QFVK1e8gt+6mxVP4vjStt5J5j5QkXc1Q4e?=
 =?us-ascii?Q?o/QZxwxB24CCe9+8NiJv+pEIwBwnE+5Kpg6VPOWrHSBhd3vbz7zMvp/GDG8+?=
 =?us-ascii?Q?xHXaBZIwvFjq9IXEfnhPsSNBFtPgJcVdtNrqTytYEOAa+TTktdtV/yweMqpV?=
 =?us-ascii?Q?p0sA38PO7uvxImem/7Y9q7kx3FdKNA3SMNVuRylyeBu+XpUZp0Owvpc3E3/+?=
 =?us-ascii?Q?dRcObVUVxTAdAJ0VHlQMbES7WI5jTtKjbFJFjMXnkMmwGJCqUBqAItAAFk7F?=
 =?us-ascii?Q?tkhtL9ArTpC63mnN+X52IhoV/Xh2vDfgOJk+2vEfqHJqhB/SZjylqUCbk3sa?=
 =?us-ascii?Q?2pQwwjq4aVtZvhSL9rmuHeccqN6HMvrCYPdZEC4JJ6pqkF5D9KzhzzvryKiB?=
 =?us-ascii?Q?hnyWhmy/B/vx+40DWvw3MhYtIdGmqEmyJ3b2nuYhQItufQV9AN/Fa7vbfkl3?=
 =?us-ascii?Q?9bYs2uGMBjPFbEKtI2muO/7KXaFVO/YiKVkFwYl6NWv2xo43IVUNUxXygBsE?=
 =?us-ascii?Q?Cojoo/x4hR0XTGutwEfLgmfZB/mp72i70l3QPGkiMhsvrDfpB5ZkOKTDoAiW?=
 =?us-ascii?Q?50082j8Dev7aw3L+iAcQLUQmO20UVejhW+dSBt3s++442OOUjp8eqibcG5jr?=
 =?us-ascii?Q?UDJboUaxjl/RWSD+C6YEzIQyyvFM4hifGxtXN9pNTNBJNFG8WFOj6C+3+mbg?=
 =?us-ascii?Q?VFICFeAe4PJDfmFjErk6u12czh4a+uFnj1A7y3JuDFF+WmZ4ekstNhmK7gY9?=
 =?us-ascii?Q?Kvx8ulr2YQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ETiDnQ8EbRXeJE+0OWTwF2AM8ndkryJNg7Bc38OnGe1/nbQS1+zfnrKVSBSDiYpXbS7qvO3IrnP+OePb5advETl4hHIHQTK2g56ckWNiDu1BFQx/cyF3HnxQyImmtecVYQgfeUjj9paUZAm42EpqY/1nMjkW1ZEfv3E2BaTRY5r8iQGj4DIzZbxn5uLT6bN3Sqx0Ee8eMZMBbgtMBijUI3ipvTau8fTiR9x2K3YOCsF2ovTXECLdhTInV9ss/R/bbpkgi1dgMh05ELWZL6fRyGS1iEqIHjlBqeE3Nvmzse1WPMkKnSZaUj+DyvSGZ13eRbB+mtYf5yjme1jnCbMvvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bedf84-6510-4193-dca2-08def8449266
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:37:33.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjkDd+k+RaKB5oAkNMxdz+F+hoEsK8yEW//zHf7qo6kYdwqHKqplBXHHqM6BJVOVg+jlja5y6vHijLjd4uh7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9696
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:trying_to_register_non-static_key" on:

commit: f4806cc63cc65bd752fd72d84937614dca6504ec ("lib: test bitmap vs IDA vs Maple Tree performance for region allocations")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 415606a7be939835db9b0d6b711887586646346d]

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: x86_64-randconfig-r071-20260801
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202608121556.f0a5b5ad-lkp@intel.com



[   17.750298][    T1] INFO: trying to register non-static key.
[   17.752032][    T1] The code is fine but needs lockdep annotation, or maybe
[   17.752032][    T1] you didn't initialize this object before use?
[   17.752032][    T1] turning off the locking correctness validator.
[   17.752032][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.2.0-rc4-00086-gf4806cc63cc6 #1 PREEMPT(full)
[   17.752032][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   17.752032][    T1] Call Trace:
[   17.752032][    T1]  <TASK>
[   17.752032][    T1]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[   17.752032][    T1]  register_lock_class (locking/lockdep.c:1332)
[   17.752032][    T1]  ? __lock_release+0x53/0x10d
[   17.752032][    T1]  ? mtree_alloc_range (linux/spinlock.h:342 maple_tree.c:5800)
[   17.752032][    T1]  __lock_acquire (locking/lockdep.c:5112)
[   17.752032][    T1]  ? mtree_alloc_range (linux/spinlock.h:342 maple_tree.c:5800)
[   17.752032][    T1]  lock_acquire (trace/events/lock.h:23 locking/lockdep.c:5831)
[   17.752032][    T1]  ? mtree_alloc_range (linux/spinlock.h:342 maple_tree.c:5800)
[   17.752032][    T1]  ? lock_acquire (trace/events/lock.h:23 locking/lockdep.c:5831)
[   17.752032][    T1]  _raw_spin_lock (linux/spinlock_api_smp.h:158 locking/spinlock.c:158)
[   17.752032][    T1]  ? mtree_alloc_range (linux/spinlock.h:342 maple_tree.c:5800)
[   17.752032][    T1]  mtree_alloc_range (linux/spinlock.h:342 maple_tree.c:5800)
[   17.752032][    T1]  ? mtree_insert (maple_tree.c:5783)
[   17.752032][    T1]  ? kvm_clock_read (x86/kernel/kvmclock.c:80)
[   17.752032][    T1]  benchmark_maple_tree (region_alloc_benchmark.c:136)
[   17.752032][    T1]  ? benchmark_bitmap (region_alloc_benchmark.c:58 (discriminator 3))
[   17.752032][    T1]  ? _printk (printk/printk.c:2504)
[   17.752032][    T1]  ? benchmark_bitmap (region_alloc_benchmark.c:54 (discriminator 3))
[   17.752032][    T1]  region_alloc_benchmark (region_alloc_benchmark.c:197)
[   17.752032][    T1]  ? bfq_init (bfq-iosched.c:7649)
[   17.752032][    T1]  ? benchmark_ida (region_alloc_benchmark.c:124)
[   17.752032][    T1]  do_one_initcall (main.c:1347)
[   17.752032][    T1]  ? rcu_lock_acquire (linux/rcupdate.h:960)
[   17.752032][    T1]  ? __kmalloc_noprof (slub.c:5363 slub.c:5387)
[   17.752032][    T1]  ? do_initcalls (linux/slab.h:973 linux/slab.h:1290 main.c:1418)
[   17.752032][    T1]  do_initcalls (main.c:1409 main.c:1425)
[   17.752032][    T1]  kernel_init_freeable (main.c:1445 main.c:1658)
[   17.752032][    T1]  ? rest_init (main.c:717)
[   17.752032][    T1]  kernel_init (main.c:1548)
[   17.752032][    T1]  ret_from_fork (x86/kernel/process.c:158)
[   17.752032][    T1]  ? arch_exit_to_user_mode_prepare+0x74/0x74
[   17.752032][    T1]  ? rest_init (main.c:717)
[   17.752032][    T1]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[   17.752032][    T1]  </TASK>
[   24.013548][    T1] Maple     3779202887    2484049644     60575   1000000     1550928
[   24.990890][    T1] IDA        575247255     396825927     60575   1000000      134928
[   25.327943][    T1] Bitmap       8349201         80133      6156    100000       12504
[   25.366002][   T29] Freeing initrd memory: 118776K
[   25.842057][    T1] Maple      293091941     215862643      6156    100000      157776
[   25.941163][    T1] IDA         59238562      34683461      6156    100000       14352
[   25.989651][    T1] Bitmap        109541          8255       612     10000        1256
[   26.030185][    T1] Maple       19150121      16184256       612     10000       15952
[   26.042611][    T1] IDA          4157285       3069915       612     10000        1936
[   26.054183][    T1] Bitmap          7207          1471        55      1000         128
[   26.066923][    T1] Maple        1873335       1797272        55      1000        1616
[   26.075720][    T1] IDA           680707        581315        55      1000         208
[   26.082353][    T1] Bitmap          2691           523        22       100          16
[   26.087980][    T1] Maple         177500        187648        22       100         848
[   26.093213][    T1] IDA            62046         36889        22       100         208
[   26.098353][    T1] Bitmap          1028           314        10        10           8
[   26.103600][    T1] Maple          49537         47114        10        10         336
[   26.108703][    T1] IDA             6863          4643        10        10          80
[   26.113754][    T1] Region allocation benchmark complete


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260812/202608121556.f0a5b5ad-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

