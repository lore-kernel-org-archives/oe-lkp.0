Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123746A2
	for <oe-lkp@lists.linux.dev>; Thu, 14 Mar 2024 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710404603; cv=fail; b=CVPp5bMuR3mAgVProHZLHs0PI/Afof0/Le5ITN5xAI3xbrXVV1Ifwlpid/p6Xo+JID/UPxp0b8RqTD4OyeCFRNUvIB/mFMFj8yskLIT+XtqbCz1u7OuQ2YzLAoLHFgj0Fhu47vFBSgAtLwZgfv+NCMyRU55/b1536F1NNDuKvoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710404603; c=relaxed/simple;
	bh=gL9cZoXBZgEaLrKS5rQjm/ojlALXT4XbvJ7ppwSR6cA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Nf6+PWP5//GQCUT6yBwiRoFUdAvQTYvuRtaDTyiUTh4sst5g1BKt+jWTaCeqPE9P7rvBPZx80wGB0lU1mEZVMDkfz7RW0mEGHuXl4Shu9tRPakxye76XokEg7IFr74JJMJUAmzFl9nr4A+uuuoT6+Nt3cBEA6knlRNeXfI7/Gi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGOetEyE; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGOetEyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710404600; x=1741940600;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=gL9cZoXBZgEaLrKS5rQjm/ojlALXT4XbvJ7ppwSR6cA=;
  b=cGOetEyE2LooJoIlYaUrxmDaLl9hPylfub6hdAyO2/OR4SmGKBNfND94
   2JE5gFtLReMHlYWlcz/4r6iOb35mRvSl/dWkDzYX29s+GobqTgTHKYubl
   cYL02z1EEuAeVTn7/Lv6gCOvY14b3N0psV+iW2/NTeprXcCLfn+yABLrH
   KL2yMo+UmNfqDN1MNkDt6CwFi2XQXghpkNFgIQg63KXk8TEtHdzhWamRe
   yMs49lEzzi8GOHgnugZixCOZa2t7n/kX0t0xGloi5rgjFIGl9vS3TzSFw
   BN9OOz167lRsJsEmmJ5MxcUeUva3P99ZN7ljkFOnT0r5DJzG3X5hCW+j0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15767973"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="15767973"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 01:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12104344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Mar 2024 01:23:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:23:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 01:23:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 01:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5DuP/MWiGy3sYdOfllKw2HmGMZcAGNnGc7in8+ZCV+gaUvcFPfcxEv7B4NIsaGFS5QC+WucG4MA+Ohkhsxbzas/Fm/qS3V3eCBkPQ6xzDEB5TPrvGD+guX5kO4QqifCMOTG4Wctz3+mXMnBW/xa1GAv6p1VUam3j3/baiWBHbFguEMibphfIU88/EGAy+0hx/eggS+LT/EQKUuXbHIpD9gR2MN85KBo3eKMSrxphjgkDgJsu7vrMoAKG+Ss9R1i5kvTOy349QzWiRijmrmOYwjATNAqtWaXsbh2/KsZLgWYx9jjlGlL+sHIxAosg2kAbogeV2Kj6bScsfzwBtf79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INEHxAQUVd5j8vCdrpeMewg6G+YrfhMAGeruJ4z+W2s=;
 b=e863dbVASwjzByHldFzZuwN6HtqpBk9jHZJFiaFcrXFXvHg3lEd6B1nDpaBrE9z21/SnP19YLoPSszqKsz1TtJu4tt4xWm+05Y3RUuO4iF1ZOWgXH91TOr40FEmu0C2Q2PDVBWppiDRLKhSOUY3nvBtkdw2Y35+kG1HQfZx9JtbiGn8bhVlEI0uhnXh2bZYFam71Sa+ITZNvPd5AfgYfpkAd7OL7oguaUZwhEClwbWO8mQa4SuPBzJBL7Dc0l/QCd1dp6WlhGwWJX512OG4gr+NpAU/vK8aNjlBe9d/bWvVdYYPXGziGCFeyN801+dg1fZlvsRwrNEGsrdAlxpmj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 08:23:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 08:23:17 +0000
Date: Thu, 14 Mar 2024 16:23:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:fsnotify-sbconn] [fsnotify]  629f30e073:
 unixbench.throughput 5.8% improvement
Message-ID: <202403141505.807a722b-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: e9747a1b-4826-4c63-8cbc-08dc44000020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pl5CDeD7xGslatPsxsn/FYt5nziI04M4CrO8eZWARJyWvBTKJ+f4HAMrArz/DrHikXW8T6VxKM2Z4MLrousrdRjtQ/SXv0aGJAA+XyUo04BXYGAmmR7iw26r0D5wd2mSr4hQcBVWhAUNG1jegOxtla1gAmKeZMcckOEcwY+P28aO6TBvO4YqjUjNrQ3GBfleokMlHnly68k1ykXjlOiqb5fxpfrEhVdS+0n6saj642PxlhYbPkpsuW2pr3c6Pe/3ktyAk30x8Kz/EtITeEW/Oo0QOiTumKaKffVsjcX80QG0BzWVRjLy14UbikSYiRmRvhoJIpjAqDgNjXd6o0nctyjJTtb8usYJmFDtnTAeP85g7E/cLUtZBA9RLJgEStj/Lm3gTR4njbBzNgtHh8NMfaZLwbKf902NvyShyaU6iOP2k1sKnZYdaKjm1CK84CYBI4T7/Xn6FO4fHqI94l0xBhflMaZCMMC8iFw5aPqn2321KqefeZO5K4jb0ur02G9DTv8F7/6b6g9MEuLltwhim4gsx56BRPjk1mixyBj7n/8JrdrZv4kAYKHND02wD2VDnzzC+R2afnoq30/FHoKh8fkj406CsKMRrvyMgeN3/rh6XTJSDf0tCt4NecTNHbp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uRW7IL+bmL3P8Xtb50QG6XpecQKMkXqyyLBvnPmuojmgkcWH3de7y7mw3R?=
 =?iso-8859-1?Q?FZWbug5EMmhkYMhqgF5LZbt2c67upGr+bvDX/tjz8jh1F/hTuo80B/+2VI?=
 =?iso-8859-1?Q?kLsok14cvys3mA76RWIBl0p6LLqlXmI3muUp3GeyGJEZza6hP7DUIjGpsl?=
 =?iso-8859-1?Q?dL6C94xeZ52Gn9RoTJ4qvjhGC78HhnELPQft7wSUAtSK8XWp5Z2uRp5Ccb?=
 =?iso-8859-1?Q?6FWh/ATj4p3iEN5KnOqBto9T6AKYha61qrpAqphQHrMFeAdivPcH6g2iBp?=
 =?iso-8859-1?Q?zSx2sdnVh4u0lJL38OkEu5MxMBRVjsKwrIyd28RKd5cxcJtdTl+9atgg+R?=
 =?iso-8859-1?Q?gQgSGoCuZH7z0+gMzjo4i4fDK8Gj1yPweWOK2Rz3gqZyGtMbkxsNWA6jc9?=
 =?iso-8859-1?Q?0hq0a4a1p6w8VABV3TU3adgmpGEow/I7JCwKJG32947ZqS3jKcbp6CsjNr?=
 =?iso-8859-1?Q?u9bJ+u3pFASrVGccvG9vWeai5E8fjOTEl68MKi7LGRoNgVXX/2F4SW/W9t?=
 =?iso-8859-1?Q?+bho2UY609eTVrt4XDMGq49mD95KmpRfZPDN4NR6dd5f77mAv1RLFtvA3X?=
 =?iso-8859-1?Q?ElzEF/IoZ1oRtitMrdjORiawC1Xw2UbdJn5+ffysVkLA3Oku51le4DgMYY?=
 =?iso-8859-1?Q?OlMib/maKX8R4km1TnUmgHlLHyodWA090EcSA15YQpB+vcJgyasmouApIG?=
 =?iso-8859-1?Q?R9/sk/NOZ+ymGTH+XYQVg+uOfGW8PZiavQxUHV2SSbV85Ct0zcaUJrclRX?=
 =?iso-8859-1?Q?xY/ZmNojBc/MAcN97emFHqmtAZgLSLHUqvY+DYxqt0hdQlaoTV5wQJ/XJc?=
 =?iso-8859-1?Q?i6aaDoDqxbDOCKUdFy9PuXw7Tu+YDKga3RC9fcWXLxfl0itAYztc8IRu1Z?=
 =?iso-8859-1?Q?XtLmaakEYQXZaanbRiPHDJ/ErtoPxtOZcGP2iysgqamoKbZT1hGB1uePXi?=
 =?iso-8859-1?Q?vFjQA3MraZ0wM870iRzPjIZMo+6JrcLwv7KkCEc/ylaUXYLvJZ1l+EQ+qt?=
 =?iso-8859-1?Q?Uq/ePE09AjHO4Vveh797J73dP1MzijjWNQO4A97o4QLIEuZPd+s/NKk8uT?=
 =?iso-8859-1?Q?LXV3nc1+5D9V5t4aE9ZjqXKkNOamuwkxE8PVIWbawrHuM+xaVCr1OwGDBO?=
 =?iso-8859-1?Q?kqla9VzCa0X09EvJrkgkizTBXz6LyqzsgeQEI7wbeGsNwrYBx06KhaW7Ez?=
 =?iso-8859-1?Q?/NSV8T1HZWgS0/Y1FCSFd7Tp8U33iYcwk/bSfBIxfSg1a/QZN/BCLlVgCP?=
 =?iso-8859-1?Q?u6pd+1n3msFHQJ88iD9C329Dejv3OVEYCE9jzF0lRSseKFx/OEU5HQrWPR?=
 =?iso-8859-1?Q?PN/nbfy7BhWxAcxwx0V6q0hbdGEbHFMK0iQHJbZ7YEFwhtGUg4k2vHa1A+?=
 =?iso-8859-1?Q?00ZljYT5MyDIhgz5yNBQlUyprs6Q7bGMtsIXaxLsV985GynqrpgQEQGHbS?=
 =?iso-8859-1?Q?QDcnFWZ2geNHrc9Rnu1x748N0hOBf8Px5YsnldXt/MjHDP4QAVWBAdmkVb?=
 =?iso-8859-1?Q?q/m9TdUKt64+ly9NuQykS9tegFvaXE2ZgIn5q88VTNLvZwTJbsgnhNV57y?=
 =?iso-8859-1?Q?0Ai6Ub9v53jNxpqb8TUWxg7zOjGrjb/tm1zxmDDfYB1ZufCbEnfxCk/NR+?=
 =?iso-8859-1?Q?sllqmxXFyn9IRQmxB5q0ae08Q23MMOQzdlEQiAUM8BRta3fs7EUozobw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9747a1b-4826-4c63-8cbc-08dc44000020
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 08:23:17.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PVDulIhHcIE4IMsJLZmoNXZ7//ED1tQdVzGPA+BkBEQVJuMCXSyeiT3q+ycpVqeX0ANRdeIlj9kzJvc8rBiwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
X-OriginatorOrg: intel.com


hi, Amir Goldstein,

while for report
"[amir73il:sb_write_barrier] [fsnotify] 9c13a708ef: will-it-scale.per_thread_ops -4.2% regression"
by our tests, "fsnotify: optimize the case of no permission event watchers"
caused some performance improvements in will-it-scale tests.
(https://lore.kernel.org/all/Zc7KmlQ1cYVrPMQ+@xsang-OptiPlex-9020/)

we report below just FYI what its behavior on another branch 'fsnotify-sbconn'
with unixbench tests.


Hello,

kernel test robot noticed a 5.8% improvement of unixbench.throughput on:


commit: 629f30e073f457c2209aa2517dd653fe7da9bfd6 ("fsnotify: optimize the case of no permission event watchers")
https://github.com/amir73il/linux fsnotify-sbconn

testcase: unixbench
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	nr_task: 100%
	test: fstime-r
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240314/202403141505.807a722b-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/fstime-r/unixbench

commit: 
  20e86594eb ("fsnotify: use an enum for group priority constants")
  629f30e073 ("fsnotify: optimize the case of no permission event watchers")

20e86594ebade045 629f30e073f457c2209aa2517dd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3568            -1.7%       3507        proc-vmstat.nr_page_table_pages
 1.334e+08            +5.8%  1.412e+08        unixbench.throughput
      1648            +5.3%       1735        unixbench.time.user_time
  5.74e+10            +5.9%  6.082e+10        unixbench.workload
      3.28            +5.2%       3.45        perf-stat.i.MPKI
 2.653e+10            +1.6%  2.695e+10        perf-stat.i.branch-instructions
  32649261            -7.4%   30238184        perf-stat.i.branch-misses
 5.186e+08            +6.1%  5.504e+08        perf-stat.i.cache-misses
 1.655e+09            +5.3%  1.743e+09        perf-stat.i.cache-references
    472.59 ±  2%      -4.8%     450.03 ±  2%  perf-stat.i.cycles-between-cache-misses
      3.69            +6.0%       3.91        perf-stat.overall.MPKI
      0.12            -0.0        0.11        perf-stat.overall.branch-miss-rate%
     31.34            +0.2       31.58        perf-stat.overall.cache-miss-rate%
    303.09            -6.3%     284.06        perf-stat.overall.cycles-between-cache-misses
      1054            -5.5%     997.35        perf-stat.overall.path-length
  2.65e+10            +1.6%  2.693e+10        perf-stat.ps.branch-instructions
  32593661            -7.3%   30202456        perf-stat.ps.branch-misses
  5.18e+08            +6.2%    5.5e+08        perf-stat.ps.cache-misses
 1.653e+09            +5.3%  1.741e+09        perf-stat.ps.cache-references
      8.43            -4.0        4.42        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     79.00            -1.0       77.96        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     82.99            -0.8       82.14        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     86.80            -0.7       86.12        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     88.17            -0.6       87.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      4.90 ±  2%      -0.3        4.55 ±  2%  perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     98.46            -0.1       98.37        perf-profile.calltrace.cycles-pp.read
      0.72            +0.1        0.78        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_read
      0.84            +0.1        0.89        perf-profile.calltrace.cycles-pp.r_test
      1.37            +0.1        1.44        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read
      3.18            +0.1        3.31        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read
      3.85            +0.2        4.02        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.vfs_read.ksys_read
      4.49            +0.2        4.69        perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.vfs_read.ksys_read.do_syscall_64
      8.11            +0.5        8.57        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
      9.90 ±  2%      +0.6       10.51        perf-profile.calltrace.cycles-pp.filemap_get_read_batch.filemap_get_pages.filemap_read.vfs_read.ksys_read
     12.29            +0.8       13.07        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.vfs_read.ksys_read.do_syscall_64
     28.37            +1.8       30.19        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
     29.72            +1.8       31.56        perf-profile.calltrace.cycles-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
     57.38            +3.2       60.61        perf-profile.calltrace.cycles-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.64            -4.1        4.53        perf-profile.children.cycles-pp.__fsnotify_parent
     79.41            -1.0       78.38        perf-profile.children.cycles-pp.vfs_read
     83.38            -0.8       82.55        perf-profile.children.cycles-pp.ksys_read
     87.31            -0.7       86.65        perf-profile.children.cycles-pp.do_syscall_64
     88.36            -0.6       87.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.10 ±  2%      -0.3        4.76        perf-profile.children.cycles-pp.rw_verify_area
     98.75            -0.1       98.68        perf-profile.children.cycles-pp.read
      0.33            +0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_read
      0.39            +0.0        0.41        perf-profile.children.cycles-pp.make_vfsgid
      0.39            +0.0        0.41        perf-profile.children.cycles-pp.make_vfsuid
      0.54            +0.0        0.57        perf-profile.children.cycles-pp.read@plt
      0.34            +0.0        0.37        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.30 ±  3%      +0.0        0.33 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.84 ±  2%      +0.0        0.88        perf-profile.children.cycles-pp.generic_file_read_iter
      0.82            +0.1        0.88        perf-profile.children.cycles-pp.aa_file_perm
      1.75 ±  2%      +0.1        1.81        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.25            +0.1        1.33        perf-profile.children.cycles-pp.r_test
      1.57            +0.1        1.66        perf-profile.children.cycles-pp.xas_descend
      3.54            +0.1        3.66 ±  2%  perf-profile.children.cycles-pp.security_file_permission
      3.59            +0.1        3.74        perf-profile.children.cycles-pp.xas_load
      3.60            +0.2        3.79        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      4.24            +0.2        4.43        perf-profile.children.cycles-pp.atime_needs_update
      4.69            +0.2        4.90        perf-profile.children.cycles-pp.touch_atime
      4.70            +0.3        4.96        perf-profile.children.cycles-pp.entry_SYSCALL_64
     10.20 ±  2%      +0.6       10.83        perf-profile.children.cycles-pp.filemap_get_read_batch
     12.50            +0.8       13.28        perf-profile.children.cycles-pp.filemap_get_pages
     28.48            +1.8       30.31        perf-profile.children.cycles-pp._copy_to_iter
     29.94            +1.9       31.80        perf-profile.children.cycles-pp.copy_page_to_iter
     57.92            +3.3       61.17        perf-profile.children.cycles-pp.filemap_read
      8.38            -4.0        4.40        perf-profile.self.cycles-pp.__fsnotify_parent
      1.54 ±  7%      -0.5        1.09 ±  4%  perf-profile.self.cycles-pp.rw_verify_area
      0.20            +0.0        0.21        perf-profile.self.cycles-pp.__x64_sys_read
      0.29            +0.0        0.31        perf-profile.self.cycles-pp.make_vfsgid
      0.29            +0.0        0.31        perf-profile.self.cycles-pp.make_vfsuid
      0.43            +0.0        0.46        perf-profile.self.cycles-pp.touch_atime
      0.34            +0.0        0.36        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.74 ±  2%      +0.0        0.77        perf-profile.self.cycles-pp.generic_file_read_iter
      0.70            +0.0        0.75        perf-profile.self.cycles-pp.aa_file_perm
      1.35            +0.0        1.40        perf-profile.self.cycles-pp.current_time
      0.88            +0.0        0.94        perf-profile.self.cycles-pp.security_file_permission
      1.14            +0.1        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.30            +0.1        1.37        perf-profile.self.cycles-pp.ksys_read
      1.26            +0.1        1.33        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.36            +0.1        1.43        perf-profile.self.cycles-pp.xas_descend
      1.12            +0.1        1.20        perf-profile.self.cycles-pp.r_test
      1.18            +0.1        1.26        perf-profile.self.cycles-pp.xas_load
      1.75            +0.1        1.83        perf-profile.self.cycles-pp.atime_needs_update
      2.04            +0.1        2.15        perf-profile.self.cycles-pp.do_syscall_64
      2.28            +0.2        2.44        perf-profile.self.cycles-pp.filemap_get_pages
      3.47            +0.2        3.65        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.94            +0.2        4.16        perf-profile.self.cycles-pp.read
      9.88            +0.4       10.28        perf-profile.self.cycles-pp.filemap_read
      6.57 ±  3%      +0.5        7.05 ±  2%  perf-profile.self.cycles-pp.filemap_get_read_batch
     28.21            +1.8       30.01        perf-profile.self.cycles-pp._copy_to_iter




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

