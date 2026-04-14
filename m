Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48F340273
	for <oe-lkp@lists.linux.dev>; Tue, 14 Apr 2026 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149564; cv=fail; b=ro5crXTNP5Avg1OzN3HLJaYnrkbkgemPIwQWduFw7jOmbjP3r6bmFWwmgfd7YmAKaQGS5L5AJv8gREQJfANDxpeCUpgIFItazcSEmqTcNOSmFYjJJByictOf4j+ucrN0hu0+mjgSY2Jd2oyK3VEQyKDtfiTpQ0f4E5tCqQHyIgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149564; c=relaxed/simple;
	bh=ccZRekypZMMkSb4+h5Qu4vnvAX6eXI+QsdeLLpjihNY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EnbOeMgQ/WW7eOMrdqGt2SORTbaeM3xzFcHZiOMX6dFIG78HArNZKu8FIm0kf/rv7Ij+Axf+4UxYsslh3+QZq1suWVWfEZYPZnXiLye9gOAOCrqq6buwcBCOTOQpBYGLovKO4OUNpklE1uSyfi1hmP2+dluK22Qux5mB0IXZ8PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWobKXAf; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWobKXAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776149561; x=1807685561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ccZRekypZMMkSb4+h5Qu4vnvAX6eXI+QsdeLLpjihNY=;
  b=LWobKXAfKCKKcgFhx1ZfHkgRMdkDeRJUp/tTgWWwR7dfMhNmXYb58TRX
   fr8GV+cOi46P4dNUnRO9kfNpVSQazzyorLv3fseSf6nYUFgfY1tJhQXTR
   b+FMS1JD6zACq5HKBsBpK2HRZEd5XW6vM1bNQj7i7AqslkS/r3l5RU7II
   P+L0cTBcQds+skddwM/DQueStjQz8PceDNta2BlnacQrSrYN5VYUxeKx8
   AD91YVjZGVw87laLcgfrR4blbepe7XeUfUabCPOFCOomLANsrH75nNb4P
   7x4wwUbzHVm1LYPSrpUT/+gde4XjUkTWuL8axxFKE5P7sdQwAZnA4shNK
   Q==;
X-CSE-ConnectionGUID: wMG2dOdvRdeKIV/MMdE/Qw==
X-CSE-MsgGUID: l4/tYC4RTZuF6L+0ehIgrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76979143"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76979143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 23:52:41 -0700
X-CSE-ConnectionGUID: PKv4AtfOSN22cVhdZTsvyQ==
X-CSE-MsgGUID: 6o7BQt1KSCqQFVfTpET5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="228969966"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 23:52:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 23:52:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 23:52:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 23:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmcuo0fQocvHjxWBYTxle2ekSwxBEydl8EmTmYQ5IceD50pzJVFX7r/LAZJkrjamhrtkE0W+/JFC1LwiLs3j31irxzUiqkIHPMagRSa2MOTDT91Znb6GvyfQmVk9v2Cx4F1I47IKT5zbXLv3ykTzUCK1+wayh/o/ULs81Muri5U+Ad4+f4U79yk1vZKEy3DNbPZ+gLOX68/7SNX9zE/DO/Tn5NKn8QydZMtRnBLDA0SgitzwbeJoQ7PWW1ipnfdiEH9simxsKWEx9w+k3Yr2OLBTATwP45sY3FJVqp1G1Gn8kErKfSfkNTqfY0QhzS2iwK4EcuDzS1SAGM+RME5rIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lMAUfuZhTY0iEfodn1Sxz4EJtXDFsKigM5S6Rbtido=;
 b=INXU7WxmKTUuBG+szvSgQwNNaMxf84dI2GOs/P8YiSNbDvjEoG1FjxUAA59uf37M7pq02ySebtzYl4pwaVEQIoqMQtZjPC22tSQXYroHTFk8WGvF0TAmPHLnqJZnJzbDPv+oMwal93A4VR966oHocTOioOPqJWaf586a10cHhyjjKMB/wYLRJRtSoN5b1CUxVYNu5KZU5szO1cBQ1wDXp5tbZiE6wTo1kGcKV+eggzJlRolg3S+sIC/baMBrCDBqo0HOLTzpA28T3160O+KFQEaBVV6eLGRndl3PSbwgQRLPo6eVoW1S2eahA+SmezjXNd5V6twNtHAXZ0Ao3Ytpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Tue, 14 Apr
 2026 06:52:31 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:52:31 +0000
Date: Tue, 14 Apr 2026 14:52:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:fix-dmac-race-v1] [RDMA/core]  74e2711bb2:
 BUG:KASAN:invalid-free_in_gid_table_release_one
Message-ID: <202604140828.9866ad14-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: da40adc9-bc99-4f95-d86d-08de99f2666b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: tDwYCqNeOZAmO6cMBUDo0ycPBMt5bdWF9fkPXSWdCE1Y+c32h5icTBm8WmqreZ/DZe6pJO1fsRygBAeq+omF4jtvzlqxjzvtapkX9RdffGTD0fsu8CHF3kERCP2WRRMp7O8EjqUCSU/KHnCUc/LVE6Hj8IW/cr0ULQie4txk5XDluTY4OSBmHKJs2GZONyk23m4RHO4nI8OWAn/4Fzh3/kmv6NatCmZj3yRnlnc5IHHwHREyfxzJZb+4eeLTAGPYL+OWwJUQwnumEbvFm6hhmZLJW9wAS0e/Wmum38tgGjUz08nsLMmbtK+zs0FHL81hFgtLSUhzSUayqOSMwfFk27zhSyQIT474CFjLthjs8IT6ITvP7pSZDKJkDdw3LOkM+uvxZvxEP7n02O5gHntunaUKZORYuU1g0Xi+Qw8seow3jwsFnGDsqtB/zf/UhZ/yOGdre+CHeY0C2clZ37BrZAN+8MB3Cm98mKJg9EmZ3yUQiKKbX+GzILXBMqUnX/rw5zlIwDDEoaTOpMuWXbDN3C1PmGJcogcMwZsT2jQSSUSiId/zb3qqw/WAJUN5GNcJIZ4WI28P6OxGs5R2w+raVgDyjFPYwBTG3iRm6v6dH54kFok2MY8do0kuztTU3bDWPozITXKAwrlCuEAPxYevItidnSJOEOB6apmfMWu8cvp0jPea/h+oLU/XZykTbTLa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NM4SnGR2GBxKZdXTqS8/WSWQ7CLbNH9xSF19SDj3qn8RfrldMzOI02RlEFqf?=
 =?us-ascii?Q?9NildrAODx8z9uWCErptY1qyHHd9AYlYqS31/W368H4TMZ7rJcdmvkZovSwa?=
 =?us-ascii?Q?W8vcgABLL/HXwM1+jOCUOFe6h5awh0iBvORpsAqQluJ64UDV1jONjJSR4NZk?=
 =?us-ascii?Q?YZpK7bM1b8yO5encXk8Z3SfwXaxOOGgwhAAmmV0d3MchebTfHn4SpeVW9GrG?=
 =?us-ascii?Q?okjocv1cJ3mpsLsn9UKSkOJ28IeqXDljt+FAKm77sdCg6I3qonQM9VLH3Mpi?=
 =?us-ascii?Q?8mGauNAIZ/AJ5GTaiAZfTmOtbfQc8te/KQn0Md4HAB50rxNkPqEYFu/yNazj?=
 =?us-ascii?Q?lej267aZp7I1+tbKLzObVQWiaAOAatr6d+BLHBL+CbnnrogySHUZ4O4A2zgF?=
 =?us-ascii?Q?K8FGqL1vVu2VnB+7WMxUtb7tim9oRAXpnq7MhKNWMLYHBdE+CNp3os5DM66K?=
 =?us-ascii?Q?nba6hsEFjaKaAOmkidZPsyJP2C96bqb4VU1a8sZBjRGsfFLMRsnxw1kaz9WL?=
 =?us-ascii?Q?m6CyiLpZvgGx8TjpBix3xEJx8CkM7GIcAFbI14UWQp23Rr9GbFLrUSc72YVp?=
 =?us-ascii?Q?VfRKZkA0dTLuEtNeI5/BAoNkWSTSyZ7p6ZwV75sWM+0Kxq/sc6UkBqZdhcEk?=
 =?us-ascii?Q?oDECIiQ0vFhz1j1dWiLXriH4QtSG5NP6OYNQO68S/+ngIt8jXCrC50fpf5dq?=
 =?us-ascii?Q?H3L5C425YjWeGgZe/kFXYvMewahZBI6Qx8AYOi+4CxOIPB3FA9BD+AnoMq41?=
 =?us-ascii?Q?gYRsJN3O4gqwVsHv8ZwejW3R6BWZjdfrHMWEzIRFy88rS4k/cXevF2KbipCj?=
 =?us-ascii?Q?unRbPnTV/Dkxtt/nRdmluBSzYiOikOveOe/eL2+3KQm2sXIuW8Oq0wENZ+AW?=
 =?us-ascii?Q?84AEkIG03Yrnjoy30iHwY5gHBkzSWWTknfj0Z1K/3wY/HdlokGXtA+t9gUq3?=
 =?us-ascii?Q?y8WbBNzMygS69OHXIi/Qldr4vh5GaaXQdWz4QNYgLHjmvYeIuY7VaOoC1Dqw?=
 =?us-ascii?Q?62nPyy7n84PqoKWG6tR3dpd6Bm95IcnSbFfUIgSVx7ih0/S1qymi+g+BxgwT?=
 =?us-ascii?Q?DJunNL69pBckiYVPgXauhcp8+BQpihUNf2R01TfRdYQH0RLZx+f2xbLPIcW9?=
 =?us-ascii?Q?5s4/Iy+Xa7cV6oXMBiJHsYUNmzFTo0+1bwronwZ8BNG4U4z+qg/1gCWdFwx/?=
 =?us-ascii?Q?B2WBGu/Q6fetrY+lziAT+J25q9E1SeUQuH3r0jvaMjAtewhb1JVuFn4HrGJ0?=
 =?us-ascii?Q?mRc84NvjzEMJJm9kBcIOkDJnryMAsPA9zcFZwEOGQcYB/H1cJN3kdC7RbbCo?=
 =?us-ascii?Q?mevILg/UjSUp5xzv8peHvLcJu3ZOGf6zI87R9owM4+frt+tMBJU2a4xCT6f+?=
 =?us-ascii?Q?RoFtXomh1X7PKDVGPaO0h4c5+MHxc3I/BXuedWSPNJjMufZSJ3huRjrofi6l?=
 =?us-ascii?Q?Wyp+1ks9JX4rfePUMmk4h8KEevKLsLY0W2yZ8aImHEUrLCFkFzZfoFvXLAEQ?=
 =?us-ascii?Q?zv0GkLYXlvkLT/+ocpgu1RyQHZhGhpqRQeyXW0c+PsDHs4QW705N28mpqjBP?=
 =?us-ascii?Q?bYHLoTcMlzrKoogk7xPbHA/mEL7dlnqQB2mIT9TRPGsdMbHmSIm/Pm5N2Kb+?=
 =?us-ascii?Q?Bcy9hqE3tsEfRBehfkMfXDMJSNZWyTOr1eYQwr96h8ybiOBjO3kZn3uURlj6?=
 =?us-ascii?Q?PvXc+j9+BYLaVdzPX0y4J1BSujsq03XDlKlaZzDZ0r2iFxItuVbVWbTQs5FX?=
 =?us-ascii?Q?LKs45YJSUw=3D=3D?=
X-Exchange-RoutingPolicyChecked: nIH6skteKB4Vuw/pbVU5f3DZFcGjMVzpmGJ8kXwVbkM84Fonu/WEPBy2eGAO6b84iN6TJ4mb2rVA+FY6cvFQ1fZpoSiZY/syzLiyUlXbSPYzHOWaR1/dzavj6KUM6vyiBZ9BhVh85wyuAG1QLv/57elPgPU569B7/PnHg15d/jMwfVZBXY4DjxEOvxduuvzvczK9YzICC8ccuiW8kKlVESLPyQ/TbGnXihK2K5FxrNgNjxQIBeFhw7dP/wu4SbxIiz3sqM1errngR7EIFbyLx6ljnJNSOpeekeZxkFUxIxVtMnz8o15kivbxvFCxvLp4gewp0n8+a8EkOPri/Ju8KQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da40adc9-bc99-4f95-d86d-08de99f2666b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:52:31.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwqacjhOeoxt09O8xehHnj+6HV/DwvJYHzXayppqaW7bxDnvdr9Q9bSwciSiID3Z+i22zrOSY+neZY5ltn6OBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:invalid-free_in_gid_table_release_one" on:

commit: 74e2711bb2afbc0ac79c375b239f6b95730ff8bd ("RDMA/core: Use kzalloc_flex for GID table")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git fix-dmac-race-v1


in testcase: blktests
version: blktests-x86_64-dd55eba-1_20260402
with following parameters:

	disk: 1SSD
	test: nvme-group-01
	nvme_trtype: rdma



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604140828.9866ad14-lkp@intel.com



kern  :err   : [   42.474510] [   T1376] BUG: KASAN: invalid-free in gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.487078] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7ad000-0x3f7adfff], got write-back
kern  :err   : [   42.494556] [   T1376] Free of addr ffff8881d3e24ab8 by task rdma/1376

kern  :err   : [   42.494561] [   T1376] CPU: 2 UID: 0 PID: 1376 Comm: rdma Tainted: G S      W           7.0.0-rc6-00097-g74e2711bb2af #1 PREEMPT(lazy)
kern  :err   : [   42.494564] [   T1376] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
kern  :err   : [   42.494565] [   T1376] Hardware name: LENOVO 90XW004HPL/336B, BIOS M5LKT1CA 01/06/2025
kern  :err   : [   42.494567] [   T1376] Call Trace:
kern  :err   : [   42.494568] [   T1376]  <TASK>
kern  :err   : [   42.494569] [   T1376]  dump_stack_lvl (lib/dump_stack.c:122)
kern  :err   : [   42.494573] [   T1376]  print_address_description+0x88/0x320
kern  :err   : [   42.494577] [   T1376]  ? gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494579] [   T1376]  print_report (mm/kasan/report.c:483)
kern  :err   : [   42.494581] [   T1376]  ? __virt_addr_valid (include/linux/mmzone.h:2114 (discriminator 1) include/linux/mmzone.h:2196 (discriminator 1) arch/x86/mm/physaddr.c:54 (discriminator 1))
kern  :err   : [   42.494583] [   T1376]  ? gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494585] [   T1376]  ? gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494587] [   T1376]  kasan_report_invalid_free (mm/kasan/report.c:563)
kern  :err   : [   42.494591] [   T1376]  ? gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494593] [   T1376]  ? gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494595] [   T1376]  check_slab_allocation (mm/kasan/common.c:231)
kern  :err   : [   42.494597] [   T1376]  kfree (mm/slub.c:2608 (discriminator 4) mm/slub.c:6165 (discriminator 4) mm/slub.c:6483 (discriminator 4))
kern  :err   : [   42.494600] [   T1376]  gid_table_release_one (drivers/infiniband/core/cache.c:805 drivers/infiniband/core/cache.c:877)
kern  :err   : [   42.494602] [   T1376]  ib_device_release (drivers/infiniband/core/device.c:483)
kern  :err   : [   42.494604] [   T1376]  device_release (drivers/base/core.c:2571)
kern  :err   : [   42.494607] [   T1376]  kobject_cleanup (lib/kobject.c:693)
kern  :err   : [   42.494611] [   T1376]  nldev_dellink (drivers/infiniband/core/nldev.c:1821)
kern  :err   : [   42.494613] [   T1376]  ? __pfx_nldev_dellink (drivers/infiniband/core/nldev.c:1821)
kern  :err   : [   42.494619] [   T1376]  ? down_read (arch/x86/include/asm/atomic64_64.h:20 include/linux/atomic/atomic-arch-fallback.h:2629 include/linux/atomic/atomic-long.h:79 include/linux/atomic/atomic-instrumented.h:3224 kernel/locking/rwsem.c:177 kernel/locking/rwsem.c:182 kernel/locking/rwsem.c:257 kernel/locking/rwsem.c:1260 kernel/locking/rwsem.c:1274 kernel/locking/rwsem.c:1539)
kern  :err   : [   42.494621] [   T1376]  ? __pfx_down_read (kernel/locking/rwsem.c:1535)
kern  :err   : [   42.494623] [   T1376]  ? security_capable (security/security.c:635 (discriminator 1))
kern  :err   : [   42.494626] [   T1376]  rdma_nl_rcv_msg (drivers/infiniband/core/netlink.c:195)
kern  :err   : [   42.494628] [   T1376]  ? __pfx_rdma_nl_rcv_msg (drivers/infiniband/core/netlink.c:154)
kern  :err   : [   42.494630] [   T1376]  ? netlink_recvmsg (net/netlink/af_netlink.c:1974 (discriminator 2))
kern  :err   : [   42.494632] [   T1376]  rdma_nl_rcv_skb+0x226/0x3b0
kern  :err   : [   42.494634] [   T1376]  ? __pfx_rdma_nl_rcv_skb+0x10/0x10
kern  :err   : [   42.494637] [   T1376]  netlink_unicast (net/netlink/af_netlink.c:1319 net/netlink/af_netlink.c:1344)
kern  :err   : [   42.494639] [   T1376]  ? __pfx_netlink_unicast (net/netlink/af_netlink.c:1329)
kern  :err   : [   42.494640] [   T1376]  ? __virt_addr_valid (include/linux/mmzone.h:2114 (discriminator 1) include/linux/mmzone.h:2196 (discriminator 1) arch/x86/mm/physaddr.c:54 (discriminator 1))
kern  :err   : [   42.494642] [   T1376]  ? check_heap_object (mm/usercopy.c:190 (discriminator 1))
kern  :err   : [   42.494644] [   T1376]  netlink_sendmsg (net/netlink/af_netlink.c:1894)
kern  :err   : [   42.494646] [   T1376]  ? __pfx_netlink_sendmsg (net/netlink/af_netlink.c:1813)
kern  :err   : [   42.494648] [   T1376]  ? _inline_copy_from_user (arch/x86/include/asm/uaccess_64.h:121 arch/x86/include/asm/uaccess_64.h:121 arch/x86/include/asm/uaccess_64.h:141 include/linux/uaccess.h:185)
kern  :err   : [   42.494652] [   T1376]  __sys_sendto (net/socket.c:727 (discriminator 1) net/socket.c:742 (discriminator 1) net/socket.c:2206 (discriminator 1))
kern  :err   : [   42.494654] [   T1376]  ? __pfx___sys_sendto (net/socket.c:2173)
kern  :err   : [   42.494656] [   T1376]  ? do_sock_setsockopt (net/socket.c:2291)
kern  :err   : [   42.494659] [   T1376]  ? __pfx_netlink_setsockopt (net/netlink/af_netlink.c:1644)
kern  :err   : [   42.494661] [   T1376]  ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
kern  :err   : [   42.494663] [   T1376]  ? __asan_memset (mm/kasan/shadow.c:84 (discriminator 2))
kern  :err   : [   42.494664] [   T1376]  ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:133 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4))
kern  :err   : [   42.494666] [   T1376]  ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161)
kern  :err   : [   42.494669] [   T1376]  __x64_sys_sendto (net/socket.c:2209)
kern  :err   : [   42.494670] [   T1376]  ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:121 arch/x86/include/asm/uaccess_64.h:121 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:206 lib/usercopy.c:26)
kern  :err   : [   42.494673] [   T1376]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
kern  :err   : [   42.494674] [   T1376]  ? move_addr_to_user (net/socket.c:306 (discriminator 1))
kern  :err   : [   42.494677] [   T1376]  ? do_getsockname (net/socket.c:532 net/socket.c:2148)
kern  :err   : [   42.494679] [   T1376]  ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:2170 (discriminator 4) include/linux/atomic/atomic-instrumented.h:1302 (discriminator 4) include/asm-generic/qspinlock.h:111 (discriminator 4) include/linux/spinlock.h:187 (discriminator 4) include/linux/spinlock_api_smp.h:133 (discriminator 4) kernel/locking/spinlock.c:162 (discriminator 4))
kern  :err   : [   42.494681] [   T1376]  ? __pfx_do_getsockname (net/socket.c:2119)
kern  :err   : [   42.494683] [   T1376]  ? netlink_insert (net/netlink/af_netlink.c:591)
kern  :err   : [   42.494685] [   T1376]  ? __wake_up (kernel/sched/wait.c:129 kernel/sched/wait.c:146)
kern  :err   : [   42.494687] [   T1376]  ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 (discriminator 2) include/linux/atomic/atomic-instrumented.h:50 (discriminator 2) fs/file.c:1196 (discriminator 2) fs/file.c:1210 (discriminator 2))
kern  :err   : [   42.494690] [   T1376]  ? __sys_getsockname (include/linux/file.h:62 (discriminator 1) include/linux/file.h:83 (discriminator 1) net/socket.c:2144 (discriminator 1))
kern  :err   : [   42.494692] [   T1376]  ? __x64_sys_getsockname (net/socket.c:2154)
kern  :err   : [   42.494694] [   T1376]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
kern  :err   : [   42.494695] [   T1376]  ? __pfx___sys_bind (net/socket.c:1889)
kern  :err   : [   42.494697] [   T1376]  ? sock_alloc_file (include/linux/fs.h:2832 net/socket.c:499)
kern  :err   : [   42.494699] [   T1376]  ? __sys_socket (net/socket.c:516 net/socket.c:1756)
kern  :err   : [   42.494700] [   T1376]  ? __pfx___sys_socket (net/socket.c:1743)
kern  :err   : [   42.494702] [   T1376]  ? __x64_sys_bind (net/socket.c:1908)
kern  :err   : [   42.494704] [   T1376]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
kern  :err   : [   42.494705] [   T1376]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
kern  :err   : [   42.494706] [   T1376]  ? do_syscall_64 (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/entry-common.h:327 arch/x86/entry/syscall_64.c:100)
kern  :err   : [   42.494708] [   T1376]  ? do_user_addr_fault (arch/x86/include/asm/atomic.h:93 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:949 (discriminator 4) include/linux/atomic/atomic-instrumented.h:401 (discriminator 4) include/linux/refcount.h:389 (discriminator 4) include/linux/refcount.h:432 (discriminator 4) include/linux/mmap_lock.h:196 (discriminator 4) include/linux/mmap_lock.h:217 (discriminator 4) include/linux/mmap_lock.h:264 (discriminator 4) arch/x86/mm/fault.c:1336 (discriminator 4))
kern  :err   : [   42.494712] [   T1376]  ? irqentry_exit (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/unwind_deferred.h:37 include/linux/irq-entry-common.h:296 include/linux/irq-entry-common.h:341 kernel/entry/common.c:219)
kern  :err   : [   42.494713] [   T1376]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
kern  :err   : [   42.494715] [   T1376] RIP: 0033:0x7ff472790687
kern  :err   : [   42.494717] [   T1376] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
All code
========
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	4c 89 df             	mov    %r11,%rdi
   6:	e8 58 b3 00 00       	call   0xb363
   b:	8b 93 08 03 00 00    	mov    0x308(%rbx),%edx
  11:	59                   	pop    %rcx
  12:	5e                   	pop    %rsi
  13:	48 83 f8 fc          	cmp    $0xfffffffffffffffc,%rax
  17:	74 1a                	je     0x33
  19:	5b                   	pop    %rbx
  1a:	c3                   	ret
  1b:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  22:	00 
  23:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  28:	0f 05                	syscall
  2a:*	5b                   	pop    %rbx		<-- trapping instruction
  2b:	c3                   	ret
  2c:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  33:	83 e2 39             	and    $0x39,%edx
  36:	83 fa 08             	cmp    $0x8,%edx
  39:	75 de                	jne    0x19
  3b:	e8 23 ff ff ff       	call   0xffffffffffffff63

Code starting with the faulting instruction
===========================================
   0:	5b                   	pop    %rbx
   1:	c3                   	ret
   2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   9:	83 e2 39             	and    $0x39,%edx
   c:	83 fa 08             	cmp    $0x8,%edx
   f:	75 de                	jne    0xffffffffffffffef
  11:	e8 23 ff ff ff       	call   0xffffffffffffff39
kern  :err   : [   42.494719] [   T1376] RSP: 002b:00007ffc34e27fe0 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
kern  :err   : [   42.494722] [   T1376] RAX: ffffffffffffffda RBX: 00007ff4727000c0 RCX: 00007ff472790687
kern  :err   : [   42.494724] [   T1376] RDX: 0000000000000018 RSI: 00005556f9bdc2a0 RDI: 0000000000000005
kern  :err   : [   42.494725] [   T1376] RBP: 0000000069cf668e R08: 00007ff472905000 R09: 000000000000000c
kern  :err   : [   42.494726] [   T1376] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffc34e28240
kern  :err   : [   42.494727] [   T1376] R13: 00005556e3446750 R14: 00005556e3468de0 R15: 00007ffc34e28240
kern  :err   : [   42.494729] [   T1376]  </TASK>

kern  :err   : [   42.507109] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f8e5000-0x3f8e5fff], got write-back
kern  :err   : [   42.513375] [   T1376] Allocated by task 1303:
kern  :warn  : [   42.513376] [   T1376]  kasan_save_stack (mm/kasan/common.c:58)
kern  :err   : [   42.515615] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7ac000-0x3f7acfff], got write-back
kern  :warn  : [   42.527517] [   T1376]  kasan_save_track (mm/kasan/common.c:70 (discriminator 1) mm/kasan/common.c:79 (discriminator 1))
kern  :warn  : [   42.527519] [   T1376]  __kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
kern  :err   : [   42.533046] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7ab000-0x3f7abfff], got write-back
kern  :warn  : [   42.540707] [   T1376]  __kmalloc_noprof (include/linux/kasan.h:263 mm/slub.c:5260 mm/slub.c:5272)
kern  :warn  : [   42.540709] [   T1376]  _gid_table_setup_one (drivers/infiniband/core/cache.c:773 (discriminator 4) drivers/infiniband/core/cache.c:888 (discriminator 4))
kern  :err   : [   42.547832] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f880000-0x3f880fff], got write-back
kern  :warn  : [   42.548182] [   T1376]  ib_cache_setup_one (drivers/infiniband/core/cache.c:918 drivers/infiniband/core/cache.c:1606)
kern  :err   : [   42.552581] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f881000-0x3f881fff], got write-back
kern  :warn  : [   42.559034] [   T1376]  ib_register_device (drivers/infiniband/core/device.c:1426 drivers/infiniband/core/device.c:1405)
kern  :warn  : [   42.559036] [   T1376] siw_newlink (drivers/infiniband/sw/siw/siw_main.c:71 drivers/infiniband/sw/siw/siw_main.c:430) siw
kern  :err   : [   42.564390] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7d8000-0x3f7d8fff], got write-back
kern  :warn  : [   42.568756] [   T1376]  nldev_newlink (drivers/infiniband/core/nldev.c:1812 (discriminator 1))
kern  :warn  : [   42.568758] [   T1376]  rdma_nl_rcv_msg (drivers/infiniband/core/netlink.c:195)
kern  :err   : [   42.573677] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7d7000-0x3f7d7fff], got write-back
kern  :warn  : [   42.578997] [   T1376]  rdma_nl_rcv_skb+0x226/0x3b0
kern  :warn  : [   42.578998] [   T1376]  netlink_unicast (net/netlink/af_netlink.c:1319 net/netlink/af_netlink.c:1344)
kern  :err   : [   42.584348] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7d1000-0x3f7d1fff], got write-back
kern  :warn  : [   42.589665] [   T1376]  netlink_sendmsg (net/netlink/af_netlink.c:1894)
kern  :warn  : [   42.589667] [   T1376]  __sys_sendto (net/socket.c:727 (discriminator 1) net/socket.c:742 (discriminator 1) net/socket.c:2206 (discriminator 1))
kern  :err   : [   42.595020] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7ce000-0x3f7cefff], got write-back
kern  :warn  : [   42.600338] [   T1376]  __x64_sys_sendto (net/socket.c:2209)
kern  :warn  : [   42.600339] [   T1376]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
kern  :err   : [   42.605436] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7ca000-0x3f7cafff], got write-back
kern  :warn  : [   42.609194] [   T1376]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)

kern  :err   : [   42.609196] [   T1376] The buggy address belongs to the object at ffff8881d3e24a80
which belongs to the cache kmalloc-64 of size 64
kern  :err   : [   42.614375] [   T1143] x86/PAT: bmc-watchdog:1143 map pfn expected mapping type uncached-minus for [mem 0x3f7bc000-0x3f7bcfff], got write-back
kern  :err   : [   42.619087] [   T1376] The buggy address is located 56 bytes inside of
64-byte region [ffff8881d3e24a80, ffff8881d3e24ac0)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260414/202604140828.9866ad14-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

