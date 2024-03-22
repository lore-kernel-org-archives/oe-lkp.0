Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99218057
	for <oe-lkp@lists.linux.dev>; Fri, 22 Mar 2024 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711097907; cv=fail; b=O7KGZWeprvT4vl5hWMxjJ+aj+UcFk5bRHrTERnxTcDOEj2g1dXtsltTSETj02FcBc6W1ayNRmX99p3nvy74K7NkOj7m8NSYfTpucYjP8bXX5Ej010fZ7V10ftoTCLaSydYnJ11trbq6lmHTDuqAFrk01XC5wnaOKQ9AxA1Xr1ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711097907; c=relaxed/simple;
	bh=t4Rw+UsejqdHsqGUxoCxcKkNnaY4/pTWesn2EQ6oJZg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WSmlz/ZKi6le7n5S8jSTZdfk5jn5WrjJL2m1rB6fYc6fVzHLozNTI6oirGpBZaUrqXnCjRZlWBZ+PMUuAMb1uq0WHcBM1SByQv3fLX3vQ4zPe+HcweYfWNtD9NIqBxxZIcIuHOYkx+9o8YxJ6rFqq9inx8yjjZhD4S1i88Zrn6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+WUCFRq; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+WUCFRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711097905; x=1742633905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4Rw+UsejqdHsqGUxoCxcKkNnaY4/pTWesn2EQ6oJZg=;
  b=m+WUCFRqGzk7J4t2uY3Q+EEs+Qjcpzzy2e+Wo0eTG9mV3h5efWYRHZ9H
   j3+g33mQM+bVMalpMVhVl9wSRr/ME55+cJ2PmX2lRtfRuCKCJ7xYpJ6mK
   DlR3tGokMh7ithSFPEfLGd80fJi8gBfkUkFSCINLBwq0UqTdPEZOdAOXN
   h6lN7Cw4BPGNOS+wfvV1ZdZkfCm+cNaTkPWxBshwisxmThWMkISZJfz54
   v/pHUSttwZfV3r3JTQ7leXSYtAIcJjQ2x13pe0tPzAfUOSjWjY7eJc3Uj
   lAEIsStEwSoUDW8QFf2zQ6dBl9x7yw8wHKIj9iAWa30L/D82aWD3X4wMr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9086548"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9086548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 01:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="15254795"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Mar 2024 01:58:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 01:58:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 01:58:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 01:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7YnDOuDycfVo0kHDmkmstMiq0V3N8Ff+fBV9pma45b9vJiIMufo3LbpPAb7ieYauKrdVcC8oB5krMgAmSeBwcby8dTV8etg7wdKUpiW9qFhYqrUYN9vFKG02uwe+EquBva7l6QK2q52yWUrU8rbHTh8Es8v5EIskJdM2+YjyVteuoq1eCWOKmDSRCdE8qYIX7V2B9CXPBnwDWm80tAuRge8migwAKp6+FMmAQrUhR0+NT6m2D5sg6YLsjildaTNA6o5e+6Vnl4/LWmPBUfJJ8e2/IObuIwZGB8HrhJy01xf6ndviueTHTn3i7m4BPtKpjzqFlG8bCnoeuW4y+bVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T/IgkHX3nNX6sO3L4lali5Sxisn4Xe9CLTd8RxmvFQ=;
 b=eWGHpL1FF/LgqIpvLDb9EJ09rQqV3CiKdXe6UtGhBcuDy4qX6CZ+pNhmUyMbI3hSTSMc5Pj01hPaySce7d69FlfcH6vrdboKFlblWD7k05KY/Mmh/kaz5GvEeyWGyTD6ODwlML2jmuCB7AnWLyEgx5OyqUlshvkJbLx49EWNiHhCw89SJ9dBek8Kx9gXHWHDtPKHKdBOX45z5VXfPHfpGKJlFVUgCVM3qfxy8OjSNV4VPcuDpN4MIBWzKyj7EqO97jMtt3Z+U/kHtHnNkZ26gMzJdJWriJ+w5xtFG1251o67HN3btxMNOuE0FWrgfxnKvUeEr8oAB8dqK2r74wlqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 08:58:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7409.010; Fri, 22 Mar 2024
 08:58:20 +0000
Date: Fri, 22 Mar 2024 16:58:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kernel@openeuler.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [openeuler:OLK-6.6]  f04c0f3eb9:
 WARNING:at_kernel/events/core.c:#__se_sys_perf_event_open
Message-ID: <202403221606.ef6e1314-oliver.sang@intel.com>
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e928d4-c48e-497f-1456-08dc4a4e38ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCLaBhNdscFoV7XMGoLuJ4S81F3uajneYY1UythliRcaubGDsgcuc0IsDXxOWGNRRugrlbizYFljNE6ptLmo51S4BG/H5FFfiFfet/K9e/MLJaGdAFi+xmz0fAsNnAGl0z6HVqMdEQQwxaIzvAuSh9Q0A9k7h2xE/53mNJCL037BuzfAAGecVnQ4mh8q0PKKaki0/QjndJa96lC3kluMA+w1xyY368zGNPmEhXWRw9YPoqFo8TeaTbmueuzrQvqHWnOlzSId778Qd+OibDKjuWTVNWCiFsSmVcFrgIAx24knSEJ8lJCfyzU8xsD8ztIKJ3Y7hu3Cq9gdVQPxYpbsf7simL9lLvamsa95fd0x3tbRKVMZ3UEO+Ei7jxPAfx0y2CaYDWHFTdPStepFXSsSeQqqz9Z0qu5a6hE6GFAlimrUJlnd4cIfVAJ0UscjCzJQnsR6GWW0CuI8Ozjk5rnUnnSU49q9pNNuFHZ4U8Fi8zN/i3KJgGjvmo7gRiJvj4hW8vLU80HTXj0MmDu24jEJ1qBjJOSc6XbEwfGvzPGR3dOABkvOTK2iugcNXKL/3f7shHINL2EuqzdhUgk0SpAJdw19A0lZCBbzliObH3eHGNFoH6ul+Igik1aqMyEBtc4L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R78TSTa6y2kAKu5/pEh2hrA1JPXx6OI+u8tg9VtGw9HstVaGh8VShbSxDGp1?=
 =?us-ascii?Q?vDL1dx9sn1w3ydLdyYZY+I7YyzZti3YjO4WTXc+dFV2lPHPbERcDc7ekcPN0?=
 =?us-ascii?Q?7UEDJgpBafkQiENpN0pz8kY/VyBPnFsSp/qzFS01UX/0zT5tv0RJgvO3HL8R?=
 =?us-ascii?Q?T12iRbiXE7cUExJh8DlmPjrA8xKatnSel13nc2/RyTvOWKpSmh89e5DHxkGu?=
 =?us-ascii?Q?tU1mlkjrlLUBneP7NTaRjFI6eRGgFwRJhCWBabsWHqecvsv+MBXEQM0Qjf+I?=
 =?us-ascii?Q?MPXx1UMhRNwDOida98Rl6TB/Idsn+QyK/L+4BmanpeaZswgUJ+zos8XI2WoH?=
 =?us-ascii?Q?vcrQegaxTLiroLclSus1nXzHDw5mWOn2gBTx3v7zp1rnEZ+pp+oswxIlK93D?=
 =?us-ascii?Q?6M63EWn+Zj7LYXY8hW0XUFlFtFJBMJxHrBgmGCw+GcwY67ryTa4mFW6rnDWl?=
 =?us-ascii?Q?tu7rYoH/hA/04l/VVcFUcZOsGbkdwqi4lrEj5MJsCwiwVTYeH6PYSOdmZdpn?=
 =?us-ascii?Q?ftvDLI4+x5A/7sThkwWrpblgVLWvA9k3Cal44T84ohU4rdr0tEJav+WYzLi7?=
 =?us-ascii?Q?OzHTA/sUfoxAs68+OZGMDOJggjKq2oGplfCrL4G6DXT6av83k9s0HMj+/8Is?=
 =?us-ascii?Q?E1ybxH+MKiD0CKSQgGtzRZPg4ynCajGqaDU/k9ZZl3lw84eqgYXUkrN83V9s?=
 =?us-ascii?Q?wkIbFNx+v+8Yhc8h39t1Wk9JF7iwtFitrp1pf5LmI38u/IhqzpDrvyRlh1Tb?=
 =?us-ascii?Q?FWiewGkLEOV9zwadlzpKEZ8shKX1RrsRs2tO3NU1BRlusGe6e8/PaPHtM9B6?=
 =?us-ascii?Q?4554vx94xykxVykY3VeudoCnYGEG0fvueE/QoQ+U/cIAAZwd4TuDeXIfsGNu?=
 =?us-ascii?Q?vZvJLe7ikeXPLhLiObK14yD1Z0yOYcQ6W1kOBVXledlfpyLJaxyWEli3YWEF?=
 =?us-ascii?Q?oKgYVC5bvUp1MygsrVjvf3uDCs2W2v77aJs8FbbG0f6YceCcdGd3don1PqJ5?=
 =?us-ascii?Q?EZofQVpcbZ1KD0TflMvK9lHjvftWaMSLOxE8IELyROO+yedPtbcbUzEbQxUc?=
 =?us-ascii?Q?NFT+IkT2DeCBVxmXYLHPq+5Wd5mSOUXW+q160nk4yyjSesbgW12AE3y5ysOI?=
 =?us-ascii?Q?iNwMgCQi0ByTeoYplM7vgjOCRYTsrhUPPvksrjrjiIx1SrlfsWT5h+Ei1oaY?=
 =?us-ascii?Q?T4DQqnwjp45IS/q2S+eDqZJhEq68BEDku04Hzg+U4zYMbv9yyirYNWngP/YT?=
 =?us-ascii?Q?MjanRL3U6a2tNu1/GLiF7J10qytWEfcWuuyGgsCLnvyHLnLJNwOIPzGOgvqh?=
 =?us-ascii?Q?Elq3UiaB7xO5D0fCAaNTiK9SIQL6GZj43sb8adygpjHtfwKyzsCgl+zhk7Or?=
 =?us-ascii?Q?7mkf/sJvsTQ78PGZdLdRHEy+SUGgjao7TFfSx3fCTSkwxpcd2nfZL27RGdf1?=
 =?us-ascii?Q?QTfp++JzX3X4xWtwSEodLPAoW+y7bwo/furN3N5y8nfLiBkg94yp3bjvS2Rn?=
 =?us-ascii?Q?Th6UGRfjjoD1ak7wtDLplrePuycgP0Y9dMEtlJ9iPMHBoj6+MZua/MSjbOj6?=
 =?us-ascii?Q?hC9EvDLWe70mIXYh713GGDoSd3uqS9umH+me9BVkFRA/Ht/bsIAQLQvZmugS?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e928d4-c48e-497f-1456-08dc4a4e38ba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 08:58:20.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AL3EIgIqeATHnRVYsLhd0QGw3utXjdV8hqBPnbS+eMPmZUk3AtHPxcWB76kv+4Cw1EHkjUzcWHQ1pYyqLDDyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/events/core.c:#__se_sys_perf_event_open" on:

commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b ("make OPTIMIZE_INLINING config editable")
https://gitee.com/openeuler/kernel.git OLK-6.6

in testcase: kernel-selftests
version: kernel-selftests-x86_64-4306b286-1_20240301
with following parameters:

	group: kvm



compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


we noticed there is config diff for the build of this commit comparing to
its parent:

==================== PARENT FIRST_BAD KCONFIGS 56cf5545eddd8cebeb2eed8f7c1b6727d59a529a ====================
--- /pkg/linux/x86_64-openeuler_defconfig-OLK-6.6-kselftests/gcc-12/56cf5545eddd8cebeb2eed8f7c1b6727d59a529a/.config    2024-03-17 05:06:25.898486325 +0800
+++ /pkg/linux/x86_64-openeuler_defconfig-OLK-6.6-kselftests/gcc-12/f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b/.config    2024-03-16 00:01:36.829873758 +0800
@@ -9245,7 +9245,7 @@ CONFIG_FRAME_WARN=2048
 CONFIG_STRIP_ASM_SYMS=y
 # CONFIG_READABLE_ASM is not set
 # CONFIG_HEADERS_INSTALL is not set
-CONFIG_OPTIMIZE_INLINING=y
+# CONFIG_OPTIMIZE_INLINING is not set
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_SECTION_MISMATCH_WARN_ONLY=y
 # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set


we also noticed there is another warning for parent in this test:

56cf5545eddd8ceb f04c0f3eb9b49427c273cd3e4d5
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6          -83%            :6     dmesg.WARNING:at_kernel/events/core.c:#__do_sys_perf_event_open
           :6          100%           6:6     dmesg.WARNING:at_kernel/events/core.c:#__se_sys_perf_event_open


we are not sure if they are just same issue and if the difference is caused by
config diff. just report what we observed in our tests FYI.



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403221606.ef6e1314-oliver.sang@intel.com


kern  :warn  : [  101.829579] ------------[ cut here ]------------
kern :warn : [  101.837366] WARNING: CPU: 31 PID: 3360 at kernel/events/core.c:1950 __se_sys_perf_event_open (kernel/events/core.c:1950 kernel/events/core.c:12643 kernel/events/core.c:12376) 
kern  :warn  : [  101.850445] Modules linked in: intel_rapl_msr intel_rapl_common intel_ifs i10nm_edac nfit libnvdimm x86_pkg_temp_thermal intel_powerclamp coretemp btrfs kvm_intel xor kvm raid6_pq libcrc32c irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel sha512_ssse3 nvme snd_pcm snd_timer nvme_core dax_hmem snd ast t10_pi ipmi_ssif cxl_acpi rapl soundcore drm_shmem_helper intel_cstate cxl_core isst_if_mmio pcspkr isst_if_mbox_pci mei_me crc64_rocksoft_generic idxd crc64_rocksoft isst_if_common i2c_i801 idxd_bus cdc_ether drm_kms_helper crc64 mei i2c_smbus i2c_ismt wmi acpi_ipmi ipmi_si ipmi_devintf ipmi_msghandler pinctrl_emmitsburg acpi_pad acpi_power_meter joydev binfmt_misc fuse loop drm dm_mod ip_tables
kern  :warn  : [  101.928047] CPU: 31 PID: 3360 Comm: ovsdb-server Not tainted 6.6.0-02358-gf04c0f3eb9b4 #1
kern :warn : [  101.939446] RIP: 0010:__se_sys_perf_event_open (kernel/events/core.c:1950 kernel/events/core.c:12643 kernel/events/core.c:12376) 
kern :warn : [ 101.947893] Code: 44 49 8b 86 28 02 00 00 83 ce ff 4c 89 54 24 38 48 8d b8 a8 00 00 00 e8 48 fd 5e 02 4c 8b 54 24 38 83 e8 01 0f 84 4b f4 ff ff <0f> 0b e9 44 f4 ff ff 4c 89 54 24 38 e8 e9 d4 26 00 4c 8b 54 24 38
All code
========
   0:	44                   	rex.R
   1:	49 8b 86 28 02 00 00 	mov    0x228(%r14),%rax
   8:	83 ce ff             	or     $0xffffffff,%esi
   b:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
  10:	48 8d b8 a8 00 00 00 	lea    0xa8(%rax),%rdi
  17:	e8 48 fd 5e 02       	call   0x25efd64
  1c:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
  21:	83 e8 01             	sub    $0x1,%eax
  24:	0f 84 4b f4 ff ff    	je     0xfffffffffffff475
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 44 f4 ff ff       	jmp    0xfffffffffffff475
  31:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
  36:	e8 e9 d4 26 00       	call   0x26d524
  3b:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 44 f4 ff ff       	jmp    0xfffffffffffff44b
   7:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
   c:	e8 e9 d4 26 00       	call   0x26d4fa
  11:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
kern  :warn  : [  101.971209] RSP: 0018:ffa000001fa17ca0 EFLAGS: 00010297
kern  :warn  : [  101.979348] RAX: 00000000ffffffff RBX: ff110001c78b8800 RCX: 0000000000000000
kern  :warn  : [  101.989724] RDX: 0000000000000000 RSI: 00000000000000a8 RDI: ff110004e4b10ee8
kern  :warn  : [  101.999912] RBP: ff110004e4b10040 R08: 0000000000000001 R09: fffffbfff0e4038e
kern  :warn  : [  102.010156] R10: 0000000000000000 R11: ffffffff86d9fb60 R12: ff1100010970bdc8
kern  :warn  : [  102.020466] R13: 0000000000000002 R14: ff1100010970bdc8 R15: 1ff4000003f42f9d
kern  :warn  : [  102.030576] FS:  00007fe9bd77ea00(0000) GS:ff110017fd780000(0000) knlGS:0000000000000000
kern  :warn  : [  102.041834] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  102.050606] CR2: 0000560e77e04148 CR3: 00000004e4a18006 CR4: 0000000000f71ee0
kern  :warn  : [  102.060770] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kern  :warn  : [  102.070958] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
kern  :warn  : [  102.081205] PKRU: 55555554
kern  :warn  : [  102.086508] Call Trace:
kern  :warn  : [  102.091509]  <TASK>
kern :warn : [  102.095979] ? __warn (kernel/panic.c:673) 
kern :warn : [  102.101695] ? __se_sys_perf_event_open (kernel/events/core.c:1950 kernel/events/core.c:12643 kernel/events/core.c:12376) 
kern :warn : [  102.109641] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
kern :warn : [  102.115872] ? handle_bug (arch/x86/kernel/traps.c:242) 
kern :warn : [  102.121861] ? exc_invalid_op (arch/x86/kernel/traps.c:263 (discriminator 1)) 
kern :warn : [  102.128369] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
kern :warn : [  102.135276] ? __se_sys_perf_event_open (kernel/events/core.c:1950 kernel/events/core.c:12643 kernel/events/core.c:12376) 
kern :warn : [  102.143105] ? perf_event_set_output (kernel/events/core.c:12376) 
kern :warn : [  102.150553] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4566) 
kern :warn : [  102.159201] do_syscall_64 (arch/x86/entry/common.c:51 arch/x86/entry/common.c:81) 
kern :warn : [  102.165447] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
kern  :warn  : [  102.173312] RIP: 0033:0x7fe9bda2d719
kern :warn : [ 102.179574] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
kern  :warn  : [  102.202805] RSP: 002b:00007fffe75bf638 EFLAGS: 00000246 ORIG_RAX: 000000000000012a
kern  :warn  : [  102.213627] RAX: ffffffffffffffda RBX: 00007fffe75bf840 RCX: 00007fe9bda2d719
kern  :warn  : [  102.223757] RDX: 00000000ffffffff RSI: 0000000000000000 RDI: 00007fffe75bf640
kern  :warn  : [  102.233930] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000008000000000
kern  :warn  : [  102.244158] R10: 00000000ffffffff R11: 0000000000000246 R12: 00007fffe75bf820
kern  :warn  : [  102.254432] R13: 0000560e77df57c0 R14: 0000560e79a93b10 R15: 0000000000000000
kern  :warn  : [  102.264524]  </TASK>
kern  :warn  : [  102.269182] irq event stamp: 10473
kern :warn : [  102.275213] hardirqs last enabled at (10487): console_unlock (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 arch/x86/include/asm/irqflags.h:135 kernel/printk/printk.c:347 kernel/printk/printk.c:2718 kernel/printk/printk.c:3037) 
kern :warn : [  102.287149] hardirqs last disabled at (10500): console_unlock (kernel/printk/printk.c:345 kernel/printk/printk.c:2718 kernel/printk/printk.c:3037) 
kern :warn : [  102.299013] softirqs last enabled at (10424): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
kern :warn : [  102.310645] softirqs last disabled at (10523): irq_exit_rcu (kernel/softirq.c:427 kernel/softirq.c:632 kernel/softirq.c:644) 
kern  :warn  : [  102.322451] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240322/202403221606.ef6e1314-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

