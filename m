Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF66801
	for <oe-lkp@lists.linux.dev>; Fri, 14 Jun 2024 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718333876; cv=fail; b=LUf3Vr3V03HfwbEhnq95D8VfYOaiSPdaoyqgBP4TXRo3scZO7iWgRJyetBaOg46aEKRCCokSaQwhCjBJ7Pe2oSaeXd8HWmYJHcPTmD662HT/WBD0ZJUgoEWn4T1zoY/pDHQlqgyKzqOWDdK5j5c0APZbdNPcOzXxx3tn+hpWAiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718333876; c=relaxed/simple;
	bh=R+38D0YQMX0v0ZC7XFk4RPUQd8OmYCGrADWjH92dzIU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JBB3MOLY8rsmSlMtYAhpS+ZilJVpCrQCg3FYj8wiUz/PNzhgLu19thHOYXPK44kk8Sl3IFMdsI/qRoRJ527NYYKXwYvcahaAc0LJbCv5IywvCVQaotlxNNPhueFR69GOnBXk1xTrJ7GJNDoBYtsx29XTP/ockPfxW0oJLeeVE90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq7L6IfA; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq7L6IfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718333874; x=1749869874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+38D0YQMX0v0ZC7XFk4RPUQd8OmYCGrADWjH92dzIU=;
  b=Kq7L6IfAAyC1ALMfI+tzMmLkcGpG3LT5GlTpa1p5FCEr5EXpcdd/lbtd
   2b2vc6YW/fdkwBNospBFmy6GEjy4eZXR6K2ucazgFkoZ39gNXww2A2vLu
   g0eRmqTYtylgO/dKAPlMvZ/cOvcrSkvYAs4hEeRSuqJQoRCc2mgkv+OcR
   J8zjLZaVPIPqQ0coQPAReWCDx3ugTf3oV5etFMn50V5+liqnQaG6qvnpY
   +xLhfZ7dXG815qcCD5DWYf0wvMRc4KBfzF1wbeAHI6z6YIVn2MhZqTIVk
   mknt/l281kwQAleDPtEwdSFI4viBooOE3/V06gIogy0QMojaHZjJ5+WDT
   w==;
X-CSE-ConnectionGUID: MhQ2Wy4ISB2bE7fy5QpxZA==
X-CSE-MsgGUID: opR2lNusRpqFU6T/kUWZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15353658"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15353658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 19:57:54 -0700
X-CSE-ConnectionGUID: kRBx5q0ITae/oD7/HjtTkQ==
X-CSE-MsgGUID: Jb1Q0jtOSNa2CRni85t4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="77834523"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 19:57:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 19:57:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 19:57:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 19:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUgrCaiw0Tp2ISwJgM0cIesLHHYwRrVjl7vRkhWmAK2UhFPnB1on49y74T7uIMwlS3+ptMw3BGl/NqgLi7kNpQILBPWsH4i7kj94cQu/NVlj+tYUYaqdoWN5q4ZXlchDLC5zDtRnutXW57gVPwzVFEjDJzpY4bWBZz85vfIyGNyGczz+4lhMLqUeeAVPlSrvQ7vuXCG3PD8ZTrk4tWc7MfY2/k/8mt3JO9SNqemubX3jTG4ZB9FhBifo9GYYTHXQN3vAeDEy1fK40LuRXKX/DCSQLoM1wqN8+1tcwJAx6aOtNWb4h76I1nlF6GPyWu9azc4b/pIFSkBsAPnHf39m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt+Dv85gzOQ3gDh2XfECLlA55mhiOuaOCeICU27XjsQ=;
 b=lMfZ04UnPhTVAgk0RFqwsVokgcAwOaByZziQUhUCBscMYKfSp5xxOMOU18CqKX5JC61CMVItJwQyDIMv+XuFFnY9ZrqhK+pplRBc39pYLOMMs5p7M4m6D75/odV6hqPUMK4hS/LMKQPYtaUVV9CdMm2v3wNtX8eP9bh8Kw3CukpucFRu1PC6PC0y2+MAvosJY95SFN90ucBOkxVIBIaJdC+aAQyG4OIvDtwp5EZkhT6/GF8ft7Nhc9q6fHmxHlVnAUVl4nzAuNarVZPoca3C9CDIVAQae1bPvERaA2ENw3yZ872O3QX2ygwa87yfEb120PtVU2LBqheqkMMVAob/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 02:57:50 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 02:57:50 +0000
Date: Fri, 14 Jun 2024 10:57:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-reservations] [mm, mempool]  5cc815e628:
 UBSAN:array-index-out-of-bounds_in_mm/slab.h
Message-ID: <202406141007.1d556925-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e66408c-8468-47ff-4fe3-08dc8c1dc6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|366011|1800799019;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PQ35K7UrG0EHs3M8ILBvmdPuXC6w3atW7hE1EV9m/25k6Z4o8cIQj0/WxxRW?=
 =?us-ascii?Q?Ks51Zkd5RNu+pwr5zyfaaqLemeVzdLTIra7zIjhvRkJpMRSEI9Ad9o7bHtFO?=
 =?us-ascii?Q?c8f0YsgHWct1QVBFLDUseVSs/argaRabZv/vZw7Qm8XI+tVEMz06Oa2X4qkF?=
 =?us-ascii?Q?96qMaskWluWuLRsFMatQ+t7QrgxpOPI1c2wv+onbc+yLfVsUMTNTXXv+N07Q?=
 =?us-ascii?Q?PiEgx9IhcrGX34AOpT3C/hKzLU/PiMULknvHjYBUKNnXZNJzcbf1d2EUIaoT?=
 =?us-ascii?Q?VhdeXIHwt/GAqtobFEGx8oV+O9tNSlhWKjIUeFswufDKbUZdMKUBOc+9q23L?=
 =?us-ascii?Q?vtsmlAWBP/+CiIkrSu8t62ULHzt/5kZsmnm9tKaLnsQ1l1C8Bo4Sa08ce2l+?=
 =?us-ascii?Q?d4DfZTG1EHgfjuy2MqVCQ5CLXS8gO5VKVfYxg9JdWhge5w4eBemTnazvhRYb?=
 =?us-ascii?Q?ciKwNT6516cHxDDrtNCNdES/EwdsScZLcKEBV71WmnoJJ/xkKLbjhk4AVwWk?=
 =?us-ascii?Q?q/+2pq9YanPhRywSzyqaLkB7vMtIP4xyQqb+l9XO4foEcYqCK9DLmDaPmMJ5?=
 =?us-ascii?Q?0J6FDQt4JTGMEXlH6gIpe0ApnW2uoVkW6kaj1KzPfKAsJkyvs9nPkmS/lYzS?=
 =?us-ascii?Q?AqYk3aPGLld5Kbz9zYJlzNgqq0OXxdzQpoSv2OckPiXbpQPIHJ6z9a4eZdAj?=
 =?us-ascii?Q?2sG1BXAct9VBKioikaRl4Bev7NH097mdqjEUp7gd2RqcIzGMSiQI84l8QALe?=
 =?us-ascii?Q?1Tt06gohJt0WfcYaWrgmt6oKKmq2JxtfwLd9tD09x1/VZCVLKV8OfGxiKCjs?=
 =?us-ascii?Q?jddUrfoqWxazSOYP8b6y4VroWvFkgQ2uKFPZsJADxViq4txWqbEWjWc5l2QQ?=
 =?us-ascii?Q?qlPAJ8fJ9KhDdkxcDTovyBgA2OK5PR4869OhPNXPoI43aNSbO5/Yg/mEgKf1?=
 =?us-ascii?Q?VwDwgJTp6cwV6OdCPbWyakgYI/qIu9+xJ06AgXBJTh8cLYsnOOyMyzTAoH0o?=
 =?us-ascii?Q?0WFg0JgIOzt3qVQkJLpGIgrF3m3xc8XWdU0epS+8ABH19FDijD97hZ6HllwD?=
 =?us-ascii?Q?MPX+J52t5YvOTD9QpbxJvXs8PpD8pDZqwfEvMTQvlGTvkz7hNWMQqf7mQVrF?=
 =?us-ascii?Q?S8CFKMMtXqw9CLTRUu2D0MWR2Q4L62gYceTvAHA5ra9VN2tKc0o9kooLnIEv?=
 =?us-ascii?Q?01tnZeeCW5Y9trsP57qZqg2EeQIk7F23WAGDNudTss4jYmrgUGGuDbPqYT7v?=
 =?us-ascii?Q?5dIOZC8RJWsfmBuNcbHRQvUai3ot0V1dlgmSt6aOgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(366011)(1800799019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bZcnmxB7yB0ak0h8r8wPC+u/bKrwX/L1N+oa3af47isZoluswmyDMXCilmnR?=
 =?us-ascii?Q?dtXld3OsCOLswgs4rQym0oK9z2LmR9LEChySS8Q5qElB4dSO4z77sUhBDOmH?=
 =?us-ascii?Q?PwbYaqIk/BUlR5BXtxGYLrHHtUpIFrloZnxaugEcyk5RtPTxUDwMAKaDJrit?=
 =?us-ascii?Q?7cJHXoVHI/oWTA4kV0htYXPAFze2c38E8vegzWbZQUb+0m6FhXRy4C/li2fz?=
 =?us-ascii?Q?sT6I7KkWM0QXM1EeTFyVLuCfa4D+R9rqMZcGACidovD9LTXKNuR5fg6xQ4Ea?=
 =?us-ascii?Q?B9ZAvG0EPtS6oXzYAdb5rv+mTdr3sF5+3wqhsoWSj8OCvqsjSH5/Wpq5zhro?=
 =?us-ascii?Q?AfAGBtNFQhDwbR5cqN0j5mMC9Bvry8WOh/LPi2IIucEKhKTvoY1DQrTmO81h?=
 =?us-ascii?Q?an0WcbwcCiWa+rpjGidkHOu6vy5+/bm+f8gUv56JzG+Ue2O+KMnsC3s+ZMNQ?=
 =?us-ascii?Q?UuOPiZ2olVI/7vXxOT8yj3DGmuNvwq+oKV/oJQ/WeYlgA1ZzAWD0FHM+WEJu?=
 =?us-ascii?Q?t4n8qJGsCUxDZQTSDAFPuu33X+8XPY2WoiBHgsT3sUA8NWQR1zOVHFic1hI1?=
 =?us-ascii?Q?xtieP77JsUPZaf3c79MDETBA2jOrwhm+2UsywvG94p0pMCaKFQUZKTYxv1W0?=
 =?us-ascii?Q?Pl9V1KVQru6dmDp8MHhPnfhw3WxwNCSDL5TZqWx2elb8yzXCUvWo3A5DnBkw?=
 =?us-ascii?Q?7V6Zngj/NbchbUvpWQex0jx81ZA9nfExksM4CI12U2mExvBcQtjHlXzy+YVj?=
 =?us-ascii?Q?CGHZ161KFy10QMQ64+Ah8sUnhOD1f1XJU1mM/jCPBP7pcxgnoYdMOck+k/uI?=
 =?us-ascii?Q?IDbit65qNXVQo6Mx1gmUqO8m6e0EoCSoAuIgLmb4cbviavmCOUmXbYDtE0n0?=
 =?us-ascii?Q?KezSgFd4egZ9DSMFctbp54INuROCVAa7v+O2QXPRQEWFUhVu6dYoWdAD5hIM?=
 =?us-ascii?Q?i1ZYegmOvXHkvpdvrVF1GetvvHHNtOlfDJhEzJFgiJBVtJah/iNpVoBcXTkj?=
 =?us-ascii?Q?YjHa01PqeKKcU+PG55+MimE6l+y83hLNDmQyh4/OzX2unMcAYYWz1xgfXwSx?=
 =?us-ascii?Q?A9BYXOC+zMIEls0IJlL2wDWNo7sGAKev4/qBMt7u09f/1bv4Pldew1mEmwc4?=
 =?us-ascii?Q?iFQR7dsElDItnNwd2tCaKgmbrYULQMJHdB6oKkfAAXM32oAdtPe8FN8yJ8Io?=
 =?us-ascii?Q?ucPzulSX42eqS1vcbN+rd56OxOjtaM1DVQLzcCGuPmVI+aX/9wNRpXK16nAZ?=
 =?us-ascii?Q?yeZSw6mYweJVBrBE3uCwVGZx86HQWHeRmzqP+3W06IH85bzszcUd7Nb6iPu6?=
 =?us-ascii?Q?tqha60K7lbyYs5dgjBYMDTbgk6HBLsERo9geeW+KBs+qnOz9PwgXj0z2Y0md?=
 =?us-ascii?Q?6ToP6B2oYqG7f+IwqxVD6CzB1ZDzQJ46PgZiRX7wn8M4qzRNJCcek7r1IMOU?=
 =?us-ascii?Q?B6JcosBkqVGPKzcPLLJ7YxufkNb2AAu4jRu4/CyA14gQhzR7WQfNKNbzI+O1?=
 =?us-ascii?Q?IUvt1+mcawZOMopsHWR5ign6YgqZEMNbc0VSp38yxN5WyOsDtQY9Jg523SCP?=
 =?us-ascii?Q?WWY6VzBUKc0o0bI4sYfvkpRuAjksPJdjKtyTcEOWe3f9TisOh8MvkebBbSJy?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e66408c-8468-47ff-4fe3-08dc8c1dc6de
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 02:57:49.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrzyYmBgwg/4XXYYIYLmFXaCgaagZcSMJoOJPYdGS1Hl7i9lj21xuyFNsfEWZjvO0PF3PQMgvpSJIprPLVXafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_mm/slab.h" on:

commit: 5cc815e628b86839f757b37f7d175044493010d4 ("mm, mempool: reimplement kmalloc pool as slab pool")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-reservations

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------+------------+------------+
|                                              | a0e111f656 | 5cc815e628 |
+----------------------------------------------+------------+------------+
| UBSAN:array-index-out-of-bounds_in_mm/slab.h | 0          | 6          |
| BUG:kernel_NULL_pointer_dereference,address  | 0          | 6          |
| Oops                                         | 0          | 6          |
| EIP:do_raw_spin_trylock                      | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception     | 0          | 6          |
+----------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406141007.1d556925-lkp@intel.com


[   11.396435][    T1] ------------[ cut here ]------------
[   11.397649][    T1] UBSAN: array-index-out-of-bounds in mm/slab.h:428:9
[   11.399568][    T1] index 14 is out of range for type 'struct kmem_cache *[14]'
[   11.401151][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.10.0-rc1-00009-g5cc815e628b8 #1
[   11.403035][    T1] Call Trace:
[ 11.403833][ T1] dump_stack_lvl (lib/dump_stack.c:116) 
[ 11.404927][ T1] ? init_caches (fs/ceph/super.c:964) 
[ 11.405112][ T1] dump_stack (lib/dump_stack.c:123) 
[ 11.405112][ T1] __ubsan_handle_out_of_bounds (lib/ubsan.c:232 lib/ubsan.c:429) 
[ 11.405112][ T1] ? mempool_create_kmalloc_pool (mm/mempool.c:356) 
[ 11.405112][ T1] ? v4l2_ctrl_get_name (drivers/media/v4l2-core/v4l2-ctrls-defs.c:789) 
[ 11.405112][ T1] ? init_caches (fs/ceph/super.c:964) 
[ 11.405112][ T1] mempool_create_kmalloc_pool (mm/slab.h:428) 
[ 11.405112][ T1] init_caches (fs/ceph/super.c:964) 
[ 11.405112][ T1] init_ceph (fs/ceph/super.c:1619) 
[ 11.405112][ T1] do_one_initcall (init/main.c:1267) 
[ 11.405112][ T1] ? bcachefs_init (fs/ceph/super.c:1618) 
[ 11.405112][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 11.405112][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 11.405112][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 11.405112][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 11.405112][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 11.405112][ T1] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4421) 
[ 11.405112][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 11.405112][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 11.405112][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 11.405112][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4599) 
[ 11.405112][ T1] ? prep_new_page (mm/page_alloc.c:1478) 
[ 11.405112][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 11.405112][ T1] ? __should_fail_alloc_page (mm/fail_page_alloc.c:42) 
[ 11.405112][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 11.405112][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 11.405112][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 11.405112][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 11.405112][ T1] ? ___slab_alloc (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 mm/slub.c:3594) 
[ 11.405112][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 11.405112][ T1] ? next_arg (lib/cmdline.c:273) 
[ 11.405112][ T1] ? parse_args (kernel/params.c:153) 
[ 11.405112][ T1] do_initcall_level (init/main.c:1328) 
[ 11.405112][ T1] ? rest_init (init/main.c:1459) 
[ 11.405112][ T1] do_initcalls (init/main.c:1342) 
[ 11.405112][ T1] ? rest_init (init/main.c:1459) 
[ 11.405112][ T1] do_basic_setup (init/main.c:1365) 
[ 11.405112][ T1] kernel_init_freeable (init/main.c:1582) 
[ 11.405112][ T1] kernel_init (init/main.c:1469) 
[ 11.405112][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 11.405112][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 11.405112][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[   11.450934][    T1] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240614/202406141007.1d556925-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

