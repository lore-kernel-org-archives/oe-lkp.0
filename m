Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEBD3D544
	for <oe-lkp@lists.linux.dev>; Mon, 21 Apr 2025 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214756; cv=fail; b=nKcXiBWjSGdU6pttTkhgo3rrnD89gx0+6Om7o6vd0DGoRvS1jVMaEFDFbspMd89uO929ZZyVRF+DIDmYKJ5WzOCbSOswlW1spKHcXcvjGflztqaPk+xB+jOI4KdiVPu95vVCFeg86dBIKSN3Yiu1kda1B8ohebDdHX5KJbdG9zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214756; c=relaxed/simple;
	bh=fQAFzOaJLmqDlpzPOeqO4nxFoHm5qM9b1N7q4vmr9FE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Rc8oLGnhbzdePALeOgqaRUjAOdk/t81o/dgWT8AyBQIi5GTh0zh9vTEj4lRHA6rOQnrbSLmQ0G3G599N43zNQoeq2ne1uNJncoxCBCNHqkACuqD74Irh5bqxDi4sqlkYG3PtwPUvB4iRk9E6t5T2G56mP1tQK5rDmvtVHcB4u+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4INw+7B; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4INw+7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745214755; x=1776750755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQAFzOaJLmqDlpzPOeqO4nxFoHm5qM9b1N7q4vmr9FE=;
  b=U4INw+7BzF/vRC3vlH09JouhW+WmVJ1BXKPCvCxg3GkqIlB6gmydDZeh
   fCe0TzUTfE1bnGVAtFV1QpI//Kv2GsnN6r20ssP9wMxlNMrhrDBaYbP7k
   zOj98gNvFA9a+2kDxv7CptblN2atGAC2aO72tLSGNthwpkVjJT8+qrj/u
   Ljzk5lnbCUpK39gg52SB7Q5BwN1GF9VjRjTKu5jAarmGN0sXdLUIGwwPR
   3z33rfOQOb1JxDE/ET/2YYs76BorjtCpUOe81O8VqI9EBbq7VsPq7oQzW
   OO9H+SJN1YhfFArrpKstWyMgaSFH6Te913gXGhxq6t3z3WWqsRIZaw68E
   Q==;
X-CSE-ConnectionGUID: ts0BYoxcTpi8z9xObpQlsw==
X-CSE-MsgGUID: 1IqMFSirRRKaA+35zca8uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58121619"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="58121619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:52:34 -0700
X-CSE-ConnectionGUID: 5ISbpeMjQzCbYHzPCJ71Bw==
X-CSE-MsgGUID: RjuozTcJR+GCYMrL6ITAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132509966"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:52:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 22:52:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 22:52:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 22:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iISgTCLgmxF/QV/uBWFgpv3dFOr90BHnlDsPAxwYxrxhz/6m3dkG2vakXt/QB7VilfjE7RUv/vVaF4NsbY8vg++gkpWi0gCRNhcILu5YM18uNOOVAEdiWfQp1CHm8BRTIXRqn9DEuCmGVlKNsg2cZIAQ0DHKI9GNPd7mgjfRPfYURQsnAkDpORGBaH3q3Qrsky2II/wzxlkcZqIZvnQmm19g99T27PGoBfir7qialdjXFlwZNPkTvjeJZtEBuBDDpIZ9jrgCcPMaqp5CqLfudu1JdJRneA01Hi+alvOq3YmySlVYzgBeCy8XCp2FxU3lH8CVPMrzWXR0+tzhcsoCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC+WIsKcB/r+i8A+03Oabx6KWD07jnQJ/3Bk7ZDNI/A=;
 b=Kg4q+MdgmyMEfZsDlqF5ql5Gmsu5TsZ2e8C8AUmVufTivBi5ZN+CZJlPfCzMrMriCc4jCk/FWJLaaWTX/b8KpJg3mB12WsxBgM8411jKaSgV6Ly9rIVA/+17dxlX1zSzbKK+Z61adojA5XdDs52EcewWYlnbCKH9so/YeC2L/413alp0MGNHHFt31QD1DQq0B9NGAc5KO9yAnFYX+P4l67dVFbSlGv1c4waT5E849TJyd1q6uIeAPzu/XH93n3r7+S3LBC/5l8SOtDgWprXh7wjKzRB3YCHsZnNmEzL9M7hpcAlBGyXzUkri2gmD7z/ZhicRH+g+FqyBZaTItaakSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 05:51:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 05:51:51 +0000
Date: Mon, 21 Apr 2025 13:51:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ingo Molnar <mingo@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [mingo-tip:WIP.x86/e820] [x86/boot/e820]  00188fb170:
 UBSAN:array-index-out-of-bounds_in_arch/x86/kernel.c
Message-ID: <202504211337.244daae8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU0P306CA0043.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:29::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3769ad1f-a1bb-4dcb-0693-08dd80989cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eYk4z48QoV0AEuL19MT94rgWBH+CcxTcT7EJPojy2Otx5MUZur0w++ArO7Sp?=
 =?us-ascii?Q?h4FLNu7e7fHPVESwvDa8IOJ75jCPk/z1ESx4UM6J41cuL4fo3s3YQDp8kQd/?=
 =?us-ascii?Q?S5v2wgHGB4dgwzHI3tp5t8lSOQbof4j+jGpXlvoI19z0JqKeMJNsG3kDU0i9?=
 =?us-ascii?Q?FV1ZuSWAZDPsJnS6V7PMxd6VuP0hDxpEzL+nU3+KhS1jfXgIuVtEIfuONVQW?=
 =?us-ascii?Q?E/qMCWJUQnCbDiehAQu0dFWk3hDp8CzIiRO9U4vHaXeS1u2zHNsXV4GWEu39?=
 =?us-ascii?Q?zdycrgZbDHLcxjFzQ/XAUzhBdIM+pbe5a7Z7uASIDXBxHRcnTYA7pJ5KsJLR?=
 =?us-ascii?Q?3+4zyySW6BtznBJUgDVOFQLLHTyi25NaYF4M4kIiaq3CvmuXBx4N8LnyWpIC?=
 =?us-ascii?Q?MOOyzXDlRgz4kmGa8a3dfAkoF+E02s7RJcwp2lohstelbkhghuebZ6IwN9eD?=
 =?us-ascii?Q?kHYPihcLIQkN8uE8IME444yg9f36GqZZKttKKkbv+UqXEOx48QQI8eqnyZOt?=
 =?us-ascii?Q?YHddsp1cTa9hKb7O7bX68Uo3ebbZDhxq0u4ya5QQ0rYtd7JlVuUKBktJLWmn?=
 =?us-ascii?Q?5c5x56jGhTO1dJACKJvpL/EvaecGhdDaFGvNSNwOiNLputTzB5jLfJZmexbw?=
 =?us-ascii?Q?uS1iPiM1Gy8knkCSrzw66ajY2pInjesiVtXFohCck7U+WlupdT94vVOaAMve?=
 =?us-ascii?Q?M441lqZRIs49AntHZkwX8NtLjeNNLxee1WvCDpRxjzhpD8xOBiWJ7jS5JpLR?=
 =?us-ascii?Q?5OZerMAD2weNPHz7eaYkSRkh5+d60b3+BBX3axF9KceNMzHb92tvgIWAz78D?=
 =?us-ascii?Q?fRwrJ9MNWYCREnNpuWY3iyuuEkxXcy49xn9vLQ6z/ahF+ixrn53n7Vyldq4q?=
 =?us-ascii?Q?6eJ21LC6liJPWvarEo+Ogizvt9K4wfGgZNu1N2lh7rePSq+DgoXQ5L3ipEQO?=
 =?us-ascii?Q?9cooytMjIp9TzQ/T8sYTRY6Fu6ldgalEDyJlhTsLXBN9YrR5kj2Qx351sqlg?=
 =?us-ascii?Q?vPYBljBMHcKa7AaP2dqxSPBAkA957sSCXCI+4q28TLHQliTZwB8BhSlkc8rB?=
 =?us-ascii?Q?OT616MN+Nbxae9siHyS+583hPdM1tGmL0JKh4ZeXfU9nye1piHenQF2uTAhu?=
 =?us-ascii?Q?UTIbVIbArhFEf+ncgbS1HzZJfRP4btNXOreLxy4//T4q8dS3FbIassr+8ysJ?=
 =?us-ascii?Q?TNRHQdn3p3ebdR47JmXHTQzr1d6A1MU7697lXbErrnehVKzUnoMOCpsBxQpS?=
 =?us-ascii?Q?81ceevfZc4u5scGakNkyLUC6rZU3HH4DaGRl9z0XJ3sJ+zJwaP7Y4MkncwI8?=
 =?us-ascii?Q?meObMVNDNvK+tHPcqBRmrBKDy+cUn2B2dwFC+XzqP+MtJgc4Hh1m255Q6Z3S?=
 =?us-ascii?Q?ZCkILnDwlRIblIFo9tcWgOIl2DKi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vq+c/iyLw+FCEq386RrvckmtYL1fBWKVEleR2SmHM8OM+lsp0Lsq+Lm6Le47?=
 =?us-ascii?Q?c3IE0qO4b7X2bMyl1hH9sOHgl6jGhQa5ccwl4JTT6MV+bFwZ0hxZfeff3JYL?=
 =?us-ascii?Q?Ax/2orbjT/bgTZNOUkp3lfLHHwYA1VPCzk0n3aYuCtpD5AxuKKeZHYU9mAzu?=
 =?us-ascii?Q?LnsWfLdzhWxfh7onz/m3m3crCFNxebshUIUdnKp6Zsx9z75VMXZsYj4CRfT/?=
 =?us-ascii?Q?gW7LMrEALzHXXrWk4e0H1K1FQRr/AR+kfCnTrWYqMXCC28fJKllZR0vl8/7m?=
 =?us-ascii?Q?1RWFlIp71a0HeotB276WzTlbRzJTj5hes7NB9NTEhIuJsbK8O1eyJB6LAX0h?=
 =?us-ascii?Q?eiklqv7m0+W5xJQkOpx/7E4LdOoJ8y10Os0Uu9cVn/XcZmfVm1/ToDFfxO8L?=
 =?us-ascii?Q?LhBlsvVgYqOghMeLkM207kdkau0ixw/xy1ejzaspr+lhVvyufgj7QgxKEFsG?=
 =?us-ascii?Q?Hzq1tlssrPseHVrj+XGi+Gkxq2P1stBMi9pcGnycURpMpRt41ADponDHmL4C?=
 =?us-ascii?Q?2139Al5bU7q6Ptt0ugRCt28W3u4NUI64O1/q/vfCcQdrFG1yZ4lnByFTAjB1?=
 =?us-ascii?Q?f2MttYcHRkKdpr6K5e1DG62SvFW+3cARH7fMMKohhe+AUVnekVm96PE/qlw4?=
 =?us-ascii?Q?/HBFx6PyWwC7pHBE4XmPsickjDO4AHleHo0SuIeM6yaQJDe6zeObcnE6tZko?=
 =?us-ascii?Q?19JIdXu5RDAMZfuHRJe3JhDQ+5H4DCo/Scq0j57eSK1U+7dmqebsKszvogRf?=
 =?us-ascii?Q?msp06zVripdjdpmTDLPcFj6dvyt+OphP8Ta1EfC6vsWmCebHAQzP568An2Qn?=
 =?us-ascii?Q?BSVkbR1JHscu2R08oXr3NzU9U8xLnDCVVBqCGA+fxkAOaOBPemSmuETtFyRZ?=
 =?us-ascii?Q?tPSBulj2EW/8WsSJYJM2uPQvimlMFqIzltioSnXHLabIXyZk7VWvwrl7BTng?=
 =?us-ascii?Q?LG/0r0qPLYbDMXNoeKXtVAAvZxsL3WbmpNmmu6LZp6pGDFFLSkX7nljyT5Qh?=
 =?us-ascii?Q?HGgQ1egN7Dzotcw8FRisyvL5zeBpOZFcIA9WRqtmqTk4JEDbuoYUQn24OHfi?=
 =?us-ascii?Q?TDEiYx9kosUNoprq+Gx0pHb+3xyBBLZvEveCp/KbPeVZlfsg54kJK7QyEt6l?=
 =?us-ascii?Q?RKbfHFHZseqEHgVvlZcJ7a3DP34DCe8AOTzAqEQcdo//rvoQhOIPlxL5loS+?=
 =?us-ascii?Q?3ntEESX3qOaDUNAr9hVX0ogfyLK4su9xBJ17nYQ+jbonsahJ5ub7uBslhnRP?=
 =?us-ascii?Q?ZWxXTYnhtmiJdMbZnYmCMogO0zCejJhZytaDYXxuLTKWJNeQUl/Wd9YdpFt6?=
 =?us-ascii?Q?gx7EuogYZoFJjhlNIMTbAgbxFdZcBW6yeqAGZBaZVI0DYEbfekM2/oFlNgP4?=
 =?us-ascii?Q?JxOwhddvhwhVVbq/TbHNDQPIt84XEKjQpGvzmDYfijyKKH9J+mhIQbpiTpy3?=
 =?us-ascii?Q?6HH1FW7xwj0znsq8zn5vc11b8571WH4DDhPMJIcQR4IGj2qYp52upxiOLCer?=
 =?us-ascii?Q?yQMF8PyUZwR1uSex0zxCUC9cRzt0VbSQE1WPoGlmJaoa7pmrn24Mpn6MrLyL?=
 =?us-ascii?Q?tomK28F3venokI1rlce9HsBhAcFtpXDyLTVlwzDcGJf70jLNne1SKWahOKNI?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3769ad1f-a1bb-4dcb-0693-08dd80989cb3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 05:51:51.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfuVulRlndjBMTOlSzGtJrW/vnksgCkGGjrPSMfXuPdCTPHWTy47n//vj4lPjqEABvI61fY+zY9MF9mHu+/KSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_arch/x86/kernel.c" on:

commit: 00188fb1706a5b13228b766cb47dcda740319a86 ("x86/boot/e820: Standardize e820 table index variable types under 'u32'")
https://git.kernel.org/cgit/linux/kernel/git/mingo/tip.git WIP.x86/e820

in testcase: boot

config: x86_64-randconfig-161-20250420
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------+------------+------------+
|                                                      | 3c259dcaaa | 00188fb170 |
+------------------------------------------------------+------------+------------+
| boot_successes                                       | 12         | 0          |
| boot_failures                                        | 0          | 13         |
| UBSAN:array-index-out-of-bounds_in_arch/x86/kernel.c | 0          | 13         |
| PANIC:early_exception                                | 0          | 13         |
| RIP:e820_search_gap                                  | 0          | 13         |
+------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504211337.244daae8-lkp@intel.com


[    1.139903][    T0] ------------[ cut here ]------------
[    1.140456][    T0] UBSAN: array-index-out-of-bounds in arch/x86/kernel/e820.c:690:15
[    1.141430][    T0] index 4294967295 is out of range for type 'struct e820_entry[3200]'
[    1.142255][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc2-00508-g00188fb1706a #2 PREEMPT(undef)  def69d6756324ca31b8b85090857bf93def5fcd7
[    1.142264][    T0] Call Trace:
[    1.142266][    T0]  <TASK>
[ 1.142271][ T0] ? dump_stack_lvl (kbuild/obj/smatch/x86_64-randconfig-161-20250420/lib/dump_stack.c:123 (discriminator 1)) 
[ 1.142284][ T0] ? ubsan_epilogue (kbuild/obj/smatch/x86_64-randconfig-161-20250420/lib/ubsan.c:232 (discriminator 2)) 
[ 1.142289][ T0] ? __ubsan_handle_out_of_bounds (kbuild/obj/smatch/x86_64-randconfig-161-20250420/lib/ubsan.c:?) 
[ 1.142300][ T0] ? e820_search_gap (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/e820.c:?) 
[ 1.142311][ T0] ? e820__setup_pci_gap (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/e820.c:726) 
[ 1.142316][ T0] ? setup_arch (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/setup.c:?) 
[ 1.142320][ T0] ? start_kernel (kbuild/obj/smatch/x86_64-randconfig-161-20250420/include/linux/jump_label.h:267 kbuild/obj/smatch/x86_64-randconfig-161-20250420/init/main.c:920) 
[ 1.142326][ T0] ? x86_64_start_reservations (??:?) 
[ 1.142330][ T0] ? x86_64_start_kernel (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/head64.c:443 (discriminator 2)) 
[ 1.142336][ T0] ? common_startup_64 (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/head_64.S:419) 
[    1.142351][    T0]  </TASK>
[    1.142352][    T0] ---[ end trace ]---
PANIC: early exception 0x0d IP 10:ffffffff9f1a4b6c error 0 cr2 0xffff88843ffff000
[    1.150936][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc2-00508-g00188fb1706a #2 PREEMPT(undef)  def69d6756324ca31b8b85090857bf93def5fcd7
[ 1.152405][ T0] RIP: 0010:e820_search_gap (kbuild/obj/smatch/x86_64-randconfig-161-20250420/arch/x86/kernel/e820.c:690 (discriminator 1794)) 
[ 1.152969][ T0] Code: f8 e9 d9 fe ff ff 48 c7 c7 20 49 c4 9d 4c 89 fe e8 89 fb df fb 48 ba 00 00 00 00 00 fc ff df 4e 8d 24 b3 4c 89 e0 48 c1 e8 03 <8a> 04 10 84 c0 0f 85 f7 00 00 00 4a 8d 3c b3 48 83 c7 07 48 89 f8
All code
========
   0:	f8                   	clc
   1:	e9 d9 fe ff ff       	jmp    0xfffffffffffffedf
   6:	48 c7 c7 20 49 c4 9d 	mov    $0xffffffff9dc44920,%rdi
   d:	4c 89 fe             	mov    %r15,%rsi
  10:	e8 89 fb df fb       	call   0xfffffffffbdffb9e
  15:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  1c:	fc ff df 
  1f:	4e 8d 24 b3          	lea    (%rbx,%r14,4),%r12
  23:	4c 89 e0             	mov    %r12,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	8a 04 10             	mov    (%rax,%rdx,1),%al		<-- trapping instruction
  2d:	84 c0                	test   %al,%al
  2f:	0f 85 f7 00 00 00    	jne    0x12c
  35:	4a 8d 3c b3          	lea    (%rbx,%r14,4),%rdi
  39:	48 83 c7 07          	add    $0x7,%rdi
  3d:	48 89 f8             	mov    %rdi,%rax

Code starting with the faulting instruction
===========================================
   0:	8a 04 10             	mov    (%rax,%rdx,1),%al
   3:	84 c0                	test   %al,%al
   5:	0f 85 f7 00 00 00    	jne    0x102
   b:	4a 8d 3c b3          	lea    (%rbx,%r14,4),%rdi
   f:	48 83 c7 07          	add    $0x7,%rdi
  13:	48 89 f8             	mov    %rdi,%rax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250421/202504211337.244daae8-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

