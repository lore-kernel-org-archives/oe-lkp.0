Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB034CDE
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410460; cv=fail; b=V1QfJZN+Ia33v4Pr6odSOS4LHRhk8pIbahQwPQZlbym6MTmFzc4F3LXNklDHdaErYbMc85gpv/a2mFMFnsf8KOdsXtdd2gjNo2ABROmsl4BFBqC1ZbUfH0YQb2uzevv5fiql24v1wHHUSzB6+9uLK477YegQzepaHNxBMZiR8Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410460; c=relaxed/simple;
	bh=vwKPlJjKKu/RzW82/NGVaOdqlpqIFjfMp5AKehO7V50=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jB84U05gQJHz2P2T3z2L5Yyivoxu3CB3WV82517sOrpQDTi+eGmKU7Lcbt7a72MP5xVgxkDfPPBXegnpASIrtA8XpONZbOqL+Gw5UJmCSrpV8iFIeENPDobra/xDb5vcBnh3S69Sn0SlduStao2Tz4POIbXIGR4u54kfQIJA7Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyZL76a5; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyZL76a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722410458; x=1753946458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwKPlJjKKu/RzW82/NGVaOdqlpqIFjfMp5AKehO7V50=;
  b=IyZL76a5CLlPqZ/RRrmyQEcVSi5TfkQRBxlcgszTa7uGjLQZzHRHJefl
   J323XfBHaMpGutK2aCnuEpurOPMIyZURWadDbuS7OvUBsr17BMOA6J9I8
   PgP183ReyFujvcT6L9WDOkMhdm9LhdrhRNnpGVZFC8gwjbp/6GXNNgNQV
   BCwBcq1p8yH127BAOabS6u9bDZnRjNACwKDUxJfronFW0AlsX5FcCoa5T
   JyvhoRuPd04S+BlTIsQ9s2k+6T7Pr2gmeedVFV7G3chR7y5Q6c18ZyUUq
   zEo8bhljCukooYwCP4TL6WGXsVr4x3U6Z1LGTgYislQBR6mkQR0euZIUc
   g==;
X-CSE-ConnectionGUID: Qkg1iYFVSNOIAnjdi/woAQ==
X-CSE-MsgGUID: kamtVUfrRY2yqYXsRPBmSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37783184"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="37783184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 00:20:30 -0700
X-CSE-ConnectionGUID: JSCejl2hS2GHE8nGZwO8+A==
X-CSE-MsgGUID: ZwLRLs+QTJeeuhJ6F0G3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54644459"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jul 2024 00:20:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 00:20:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 00:20:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 00:20:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 00:20:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbeQhFCRWIiR+nyZnQGUtyovmCzSMNMX9Yc6GK17bTQrqL0DyvXiiZeHf5wZtcyWVq6Rii4CFuyk+nACXtQzbYvYc1JGwMLlg6VJXFgvap7JZLro18yW7QkDDKqdIQa6a6MkWB8p7xQUhwmytPdteOA/XK4ZI94tAruE90xJ+j9QuSj/o2ir527pwcuXvMuPfe9tixgZSzqkoAjF0CqrJaXXnvC5HdGxruOqV5m0OyzyIT3QKe3YcWV/uAEsCoQhAApdgyvcsak2ZJPrbmyVh56B9TLgYLqZf3yxqxNbQpcFk0+TbOkB4rvkEAeq+IJXfi1J99fV083HjVCYX7OlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9Rl37IvXiabE+EE/e24mhh0MKAqX7myta53nKU9U/E=;
 b=idnHGZ5+Ul9jC1YwSQ/r/p8Cd3bACqr7qGQy4XePYzCpq0PTvRVrqrn5Rjc1BSD2qZiU/yJeQH8hXIVbVByOtyGXiGdSBshRg5m//DRsb664RoAZXb807Flsj3H1H5BCyecFsRWK3Gv8a2MsBW03mEq/CGc0aW8+z/n52WNtIQj6Vw1wgHeitbMG0J+zV7YiPJVPX3oBi1e26e8lDup41C38wkdu/HsK0rCte5nH3cArTiLoFzdAIBiQr6fe1BFp2L6zp3G26YI0DyyQ14TS/Bg6Yr5kZAXln3SbxPpb9pZrnhcg5jICoUPQ/iLkwpQfPYYlis0dMTF9rvRuIXCJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6980.namprd11.prod.outlook.com (2603:10b6:510:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 07:20:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:20:25 +0000
Date: Wed, 31 Jul 2024 15:20:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Xu
	<peterx@redhat.com>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador
	<osalvador@suse.de>, <oliver.sang@intel.com>
Subject: [linux-next:pending-fixes] [mm/hugetlb]  d3fe1a0a02:
 WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr
Message-ID: <202407311421.95f5c759-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 359a121b-c157-4307-43fd-08dcb1313f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f0ER/zzGpTGdEEdRra2IiJ0O29xJtQlyeoVRg9gyFHuvrNa4kI1aUNpE6FgB?=
 =?us-ascii?Q?D1haDHFYIp839pB+u3rjy6AWH5hpkruYWke1OmvxmBwXEoMr2+lVGYGYAJfl?=
 =?us-ascii?Q?obuPvhSY5h07e06BQccRnvUzS6lIi82ZI4MnXfELxciAs0JxJghG0ZTf9/3m?=
 =?us-ascii?Q?xfoMY4NrG5bTf8A4AEoWTO542bmM4B/LgxSHEe9w9yIhu3Ysxdntxan5rmoO?=
 =?us-ascii?Q?we5gub+L493qYrR7QtrLs5/E8qe6Pk2tY8gUyFkti6dN0F6F4eMWhQOV3cTk?=
 =?us-ascii?Q?4iXXi+rtYdGngAPVZpuom8q++g4mQkM3OhKARh3Q1l0fOWMMaTu4Sji3KdQI?=
 =?us-ascii?Q?QnWlR4a1kPmwlD65CxnBNZiCBsX7sbkjVZYPX60OR785Bayp5C+O5p16/KuK?=
 =?us-ascii?Q?u6Cj29739oUqUqDW0QMZN51OhpV9je9CT/mIDkac/4dOmpT+XsmVlv4vQNhy?=
 =?us-ascii?Q?OqK3beIgR5lOuj4TfeGyWC2jJNkGFICXQdA2JEkuTLxgwXYjPYjqt8c8f64w?=
 =?us-ascii?Q?hYywz929+DwGtIUYDCO8Qfrw6+FgXo47+Fmf6YbwTkc+LShho4rjU4JBmAQD?=
 =?us-ascii?Q?D6fd6jFk8PeMCv52/Rls5whKV2ZxAVal+kkWGrvZ4dJDiyyVMZ06nVWxynmd?=
 =?us-ascii?Q?GaMFfg9nzVz1mHVcCQ235LH1wgyIGcYSqfaJWuALAY5py/xd2RR9zXkB2jUF?=
 =?us-ascii?Q?w/m1rHkNccC57a23IuugO1+oiK0gP9fy4ZuJDdueq+AiMwUIogMiw4qNV7wY?=
 =?us-ascii?Q?l4Ns0ciLfrBzsw+CYZ+3Y3iluGQ3hvNh3bpBVHKebfdjx5TCitCKw/GdZllY?=
 =?us-ascii?Q?Qq69CqlmToLTAK6PQ+uL3HpPr42La64PC4+FnMo71H6kvDqlctb5yJZcn4Nb?=
 =?us-ascii?Q?dbfpOcBga/i+WYXfVsuTm+ublYTNr30mm0ihrwf5sG1xkaIrPgD9KvWP4lVo?=
 =?us-ascii?Q?EgCcK66UoP0yARqA3+QvtHw3aVPjIGBxR3vaxkhRJYV2EgpkEK2AS1blQxcv?=
 =?us-ascii?Q?/0GRRrm2zhqZPFBy4BXIT5bBfjLfiA7U+auhBATn8Lv1kRHnhToHDt0XywIE?=
 =?us-ascii?Q?9q71td0wyLMgJqD4YHDOt3NfTEFtn6g2fpGtyIO19r5IfNGhmiQrbrqcFliv?=
 =?us-ascii?Q?kDbDPbH0cQn/NQaPrc96xTvVwUEMWYw5744HX3atZOq5kWFff39Q5BDkmzd7?=
 =?us-ascii?Q?cdTJFfriMvz/IIvUIKpue3wYYGtfEexm9T1h2U3XGjlqpm9AeyGi6kIvkyKr?=
 =?us-ascii?Q?BwKyIP1lbAYhpNETpDLV6UUrVzlA8Ee4MNpmjTalOUJloCMKFYwurdOuObOx?=
 =?us-ascii?Q?OreJuooRDGO5o8y42mdTn2bO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L5KSyHbnx1fSUwmdgf4ygmkUG/pOvnNxVtB8V+p2hJjKOsiWbosqo0I+MXGr?=
 =?us-ascii?Q?BiPBQMnYGojhUaJABSIK41E5iItvUxdRuKPxtE95KCPYBNoK//+W/P4ZEyRy?=
 =?us-ascii?Q?1thIlEelOhOu5NNIoZnEJdfORSxLaUdxYD00UiGZNRuLjUpoauhWnjo5Cy7n?=
 =?us-ascii?Q?WZ/6+bT6O2JdqGGsCSiFshLE/NEOMudNsBvUIqVCBjXs/Bki5tTMrXAA3jSl?=
 =?us-ascii?Q?NDQhNFCx5z/Hq6aOgBLyQSuUkBC7hQcpPvplc0GLTCB2l2CsS0UoBrg49UVw?=
 =?us-ascii?Q?+wGDZcIOLv3TvwCwKTfUGmuUzT2oYijiJi2nTutwcjHV82PLKu4A0Bgt9J/R?=
 =?us-ascii?Q?23tOqJQd0c5WJAhWfOfi4LufY5PkKDaab5/d+hQkKHBqNBgBUfy0nlAuRnDB?=
 =?us-ascii?Q?CUBaOKnEJ5dUHjgx3mPe0Eu3dYTWHJ42PwFDyUZZSZd5aXe9bDqqSSzRfWh4?=
 =?us-ascii?Q?zcnmR7CjgNtOl0CB5Nlj/uKFzbxBenc97k87DypueGM7C1rh+BPXkd6KjBlO?=
 =?us-ascii?Q?JuyFDfKPmlpR2lXUZrSk9Eic9KXEDAoxWektirTDaZk6TpAACU4+L0gcorth?=
 =?us-ascii?Q?d1NFDXVRyGDb3VMACVu9+QFMditc+Dkaca6NqlGRUX17sPUI9hB0q0RkP+jj?=
 =?us-ascii?Q?ec5XCx9bMRiZkCOrZDZSWsWeo+2Rf4wj4IoUwQCwsIn3VeqSmrcoSnZOw3Tq?=
 =?us-ascii?Q?UIcrU85Fe2ECiWIX8nGF4tFwwMQ6MXyub8M/Y95COFGcvtR5qoH4W7UQRJqb?=
 =?us-ascii?Q?stxi+HDAorKCHo2q3wlTfbeBH6X4xmuRmycYvCottiUQ0Aa63r9KaVKIpwJv?=
 =?us-ascii?Q?unox8Z51KhBwCJGb882skxfK6qzjAZjuzWgnlJbEVwFfKWdYXL0UK4Ao1sJs?=
 =?us-ascii?Q?xRBbzBIHMBTIqE4zEpiFpgsN89Ok03PLjak7wmAINSoNlY/A2z43h8tfl0Bf?=
 =?us-ascii?Q?46meXnq31GIL3DXHPHrJgW8TYoAmSJU2sJf87qUg/562URivSrsL2WQSM7V0?=
 =?us-ascii?Q?IP+65oWq8dnAoiWW4Yw6G7McyTaAmi6jFNSC63KgOSFshpjaJEf5FSxGMi+b?=
 =?us-ascii?Q?h2CUglU5V0FulOX3UMER4DVwUhlBlAHEkQS/yLr+2VIWlCxvBiQx12y6hu9w?=
 =?us-ascii?Q?aJBp1ZZS3KgbxxrisRxCpWUE9sNAsfTZ850yuMgnDbCMWeBbusXRcBkbvvhU?=
 =?us-ascii?Q?n3sEw0iaoPRDRhummdd1FHgaUj5VKq3jtUHz6C+3izDL3Y2mmI39qzWE4Gxw?=
 =?us-ascii?Q?92547GfTTvxsXPMHgUPOurZv5v4ZL6QfmqFodeFyJ2MU+V6z39HLXi1VKzc+?=
 =?us-ascii?Q?UCPSCbL8uXh2HCwVQR2Yd80G10+rkkg5yx8cOW10b/qpIbqSCydLW7+YmMyS?=
 =?us-ascii?Q?UNa3W8KK4HGoSYV0qxcuNFtLmZyANOWj3u91cOV9HDPPZ2XFh5SZWNiyTA9P?=
 =?us-ascii?Q?PioUQJQBuAZxZJ9pAPUeN2AmQR9XX3Jti09uRQKaBEBYh7eAhW/vOMbZYFoT?=
 =?us-ascii?Q?wPyhJNvifWm5Znt1RKIxQnbwmKTxk2CdOmrwNS8vIeUtqI+IQOXQBa0toUWQ?=
 =?us-ascii?Q?elnCBIO88QxMbLJ7yjcfzGK6jFGLG4aLdbWglFlNWfDuGF0guLBeC0taIXX4?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 359a121b-c157-4307-43fd-08dcb1313f78
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 07:20:25.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vWKCl5ABgRR+ZiZ8KFkxOE/7zsU2+L6KfL5jbiA99Y31fu7YnBTgezfqItnyN4S6rhXbMXFFpAvIYTyNUu1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6980
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr" on:

commit: d3fe1a0a0272723474056e3000717d69923ad901 ("mm/hugetlb: fix hugetlb vs. core-mm PT locking")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git pending-fixes

[test failed on linux-next/master cd19ac2f903276b820f5d0d89de0c896c27036ed]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------+------------+------------+
|                                                      | e98970a1d2 | d3fe1a0a02 |
+------------------------------------------------------+------------+------------+
| WARNING:at_include/linux/hugetlb.h:#huge_pte_lockptr | 0          | 12         |
| EIP:huge_pte_lockptr                                 | 0          | 12         |
+------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407311421.95f5c759-lkp@intel.com


[   39.570466][ T3479] ------------[ cut here ]------------
[ 39.570921][ T3479] WARNING: CPU: 0 PID: 3479 at include/linux/hugetlb.h:948 huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[   39.571702][ T3479] Modules linked in: intel_agp intel_gtt serio_raw i6300esb agpgart floppy evbug parport_pc drm drm_panel_orientation_quirks
[   39.572772][ T3479] CPU: 0 UID: 65534 PID: 3479 Comm: trinity-main Tainted: G                T  6.10.0-12931-gd3fe1a0a0272 #1
[   39.573693][ T3479] Tainted: [T]=RANDSTRUCT
[   39.574070][ T3479] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 39.575007][ T3479] EIP: huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[ 39.581298][ T3479] Code: 29 00 55 89 e5 57 89 cf 56 89 c6 53 89 d3 e8 0c fe ff ff 3d 00 10 00 00 75 02 0f 0b 89 f0 e8 fc fd ff ff 3d ff ff 3f 00 76 02 <0f> 0b 89 f0 e8 ec fd ff ff 3d ff ff 3f 00 77 19 89 f8 8b 1d 04 ce
All code
========
   0:	29 00                	sub    %eax,(%rax)
   2:	55                   	push   %rbp
   3:	89 e5                	mov    %esp,%ebp
   5:	57                   	push   %rdi
   6:	89 cf                	mov    %ecx,%edi
   8:	56                   	push   %rsi
   9:	89 c6                	mov    %eax,%esi
   b:	53                   	push   %rbx
   c:	89 d3                	mov    %edx,%ebx
   e:	e8 0c fe ff ff       	call   0xfffffffffffffe1f
  13:	3d 00 10 00 00       	cmp    $0x1000,%eax
  18:	75 02                	jne    0x1c
  1a:	0f 0b                	ud2
  1c:	89 f0                	mov    %esi,%eax
  1e:	e8 fc fd ff ff       	call   0xfffffffffffffe1f
  23:	3d ff ff 3f 00       	cmp    $0x3fffff,%eax
  28:	76 02                	jbe    0x2c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	89 f0                	mov    %esi,%eax
  2e:	e8 ec fd ff ff       	call   0xfffffffffffffe1f
  33:	3d ff ff 3f 00       	cmp    $0x3fffff,%eax
  38:	77 19                	ja     0x53
  3a:	89 f8                	mov    %edi,%eax
  3c:	8b                   	.byte 0x8b
  3d:	1d                   	.byte 0x1d
  3e:	04 ce                	add    $0xce,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	89 f0                	mov    %esi,%eax
   4:	e8 ec fd ff ff       	call   0xfffffffffffffdf5
   9:	3d ff ff 3f 00       	cmp    $0x3fffff,%eax
   e:	77 19                	ja     0x29
  10:	89 f8                	mov    %edi,%eax
  12:	8b                   	.byte 0x8b
  13:	1d                   	.byte 0x1d
  14:	04 ce                	add    $0xce,%al
[   39.584915][ T3479] EAX: 00400000 EBX: eca06140 ECX: 00000000 EDX: 00000000
[   39.585505][ T3479] ESI: c835efe0 EDI: ed53ab50 EBP: ec42fd7c ESP: ec42fd70
[   39.586099][ T3479] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010212
[   39.586776][ T3479] CR0: 80050033 CR2: 00ef3100 CR3: 2d53a000 CR4: 00040690
[   39.590234][ T3479] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   39.590617][ T3479] DR6: fffe0ff0 DR7: 00000400
[   39.590908][ T3479] Call Trace:
[ 39.591092][ T3479] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 39.591327][ T3479] ? huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[ 39.591592][ T3479] ? __warn (kernel/panic.c:735) 
[ 39.591820][ T3479] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 39.592069][ T3479] ? huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[ 39.592333][ T3479] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 39.592579][ T3479] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 39.592815][ T3479] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
[ 39.595956][ T3479] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 39.597185][ T3479] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 39.597435][ T3479] ? huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[ 39.597702][ T3479] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 39.597947][ T3479] ? huge_pte_lockptr (include/linux/hugetlb.h:948 (discriminator 1)) 
[ 39.598224][ T3479] huge_pte_lock (include/linux/spinlock.h:351 include/linux/hugetlb.h:1234) 
[ 39.598459][ T3479] hugetlb_no_page (mm/hugetlb.c:6178 mm/hugetlb.c:6269) 
[ 39.598755][ T3479] hugetlb_fault (mm/hugetlb.c:6485) 
[ 39.599006][ T3479] ? local_clock_noinstr (kernel/sched/clock.c:301) 
[ 39.599298][ T3479] handle_mm_fault (mm/memory.c:5831) 
[ 39.602330][ T3479] ? up_read (kernel/locking/rwsem.c:1623) 
[ 39.602554][ T3479] ? hugetlb_vma_unlock_read (mm/hugetlb.c:290) 
[ 39.602873][ T3479] ? vma_pgtable_walk_end (mm/memory.c:6613) 
[ 39.603149][ T3479] ? follow_page_mask (mm/gup.c:1071) 
[ 39.603414][ T3479] __get_user_pages (mm/gup.c:1196 mm/gup.c:1493) 
[ 39.603690][ T3479] populate_vma_page_range (mm/gup.c:1932 (discriminator 4)) 
[ 39.603978][ T3479] __mm_populate (mm/gup.c:2035) 
[ 39.604221][ T3479] vm_mmap_pgoff (mm/util.c:596) 
[ 39.604468][ T3479] ksys_mmap_pgoff (mm/mmap.c:1516) 
[ 39.604732][ T3479] __ia32_sys_mmap_pgoff (mm/mmap.c:1521) 
[ 39.605008][ T3479] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-011-20240730/./arch/x86/include/generated/asm/syscalls_32.h:193) 
[ 39.605261][ T3479] do_int80_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:339) 
[ 39.605527][ T3479] entry_INT80_32 (arch/x86/entry/entry_32.S:941) 
[   39.605780][ T3479] EIP: 0xb7efc092
[ 39.605978][ T3479] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240731/202407311421.95f5c759-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

