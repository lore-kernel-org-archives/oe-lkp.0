Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7B5C61E
	for <oe-lkp@lists.linux.dev>; Thu, 14 Mar 2024 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710403983; cv=fail; b=WrIOngngHz1C/sSFqcwNccSqWg2YMBByZDqtYgtQQ0FqvdvDwg9JYS1dTeaOmYIp6KNMVg3d1/3WOxgotP90ObjAo/WoKDzf05iKnu0Yr5u9HaWq7W9Lg9zTcOJ2PWgJe7mRo8/HvocvRCa2q+vMPhKx2qm3p2/HbTjkPf/NhEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710403983; c=relaxed/simple;
	bh=ZsqQGr8ghWxbr3GDe9WvGIgENdqvNeygPpZXLaP1X5o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NPTVyZLXnDRYTU7nq+wWvd8Kl/y0JegedSSFsqF2I6rEo5V7EGAh7sUTsif/xFIrnve9TtrkkP/P7KZvkMM28iV2z5Hxd3Aub831pGvJCuPupF3EcHNSuTQ5Ttykmw0cZTf3Souyc5dmVojbzQBFLuha+aV1vMVhIrGxm/d+ycY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEsnBNiP; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEsnBNiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710403982; x=1741939982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZsqQGr8ghWxbr3GDe9WvGIgENdqvNeygPpZXLaP1X5o=;
  b=jEsnBNiPyWdPuuSadwz+oj0cqT9TZUWKQwLVV0eqzkDpnsbmbkuDQqDB
   gm5YThjg+6aujzytalXlW53JUTrOZJ/vzqppVxZqvX5DKfr0HrgbeB5zT
   aKeUGyHnisofOHVcHUddEiIbbUpwi4mFq9eiTNSrHVF+cOpJkQejIs9CJ
   YPTqo4p5IcxciJyfheb90izzRhJA2hTktdRu0j5e5YoXZ3bOKkgg94qDf
   6HS3jkX8mVLYCkuBz79NO+ye+8ftBDu6TJYj9CeyK6xwqZE7DZ1+gJIFv
   vr+NGpfpDAVtCExXySP7cyxyD3/7LOi39KwySfc+4L92wZVYTQDgMGJpO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16657870"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16657870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 01:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="43130406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Mar 2024 01:12:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:12:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:12:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 01:12:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 01:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFO0hdRNq/0ysIsvGvbLXjmzzEVsc2V4qPW1EXW/4+uq/1QmBVuvjx1JKCb0ePKvw6aIuYdaSj4Nm8twO2Dq2odcZBpfZOZZTiqiXV9cEngGEiZxgigZpZau+oIzGTbOYKkKuY6oTu0auT3rLMxku/U/6xYLAFs9Z7358DGFphifeeyoLIKtGcSxqSCF9ThdQlNvETwrEv2OGI79ije/Hpdk6ME+g1EPgNAMYmGT0t5XW3+/Ja5uycYsp5KiunQeu4v4B+kn5HMUbreldeAsBWo+ztvSSXp5NQ+/JU5t/ADqRz67ckYoAP97YBAEf4DLoTdFBKybXccyN8JiJr5isQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEvL1xzZjHJGYHd/6XpYIa0N4gcRdaNhfaoyzP9OXms=;
 b=J0XzDvGyPd738UjqwbzntVeB/u9U/UcuG4vjhC9PT1DA+v2bIyO3SHXhat6ugMMXyp0siKbE7e4uybMyM5vOEAHtw+t82tNiHbGVqc9pGnYqpV7LydqCahoootFAYEVj66mLprFtFWc/Re96qlp6sGBTYm25hXd6ZdrBWrQTBBsNGIr3qHhIQmmI87QGntKGYucw7boIyfv8BePLdWco1uvgk71iccLso6cxdOTjjo7kV93WxgLhkXXglSNbs4U+/KzWrsm5C031fcS8pYd/3NtHhfAbz7ZfdOKMz7MQmlbQ853RUw0pGIAuKzSxB1HEqQhvQ9VoP6EL/SblDakzag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6878.namprd11.prod.outlook.com (2603:10b6:510:22a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 08:12:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 08:12:55 +0000
Date: Thu, 14 Mar 2024 16:12:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [kees:dev/v6.8-rc2/kmem_buckets] [util] e7c4d1a3f4:
 WARNING:at_mm/util.c:#__kvmalloc_node
Message-ID: <202403141515.e5c24085-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 9269db52-a73a-41fe-7096-08dc43fe8d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reMIe2V1ZJ6XMfMZZIKXGsW78AqYo7JLMJGSmksZNngPoE4tZGQ0ZSQWCc1Y6alzbNlhUvVYAnUrdAk7diGKuYZKD885x3vge2bNBHviGHQdb/urKsSWJwoXkADQqlrgpT65Yj5lNlz53NjP4Oavlx8wzdvA28n0O74f2v4t/1Ingtp9yiTj9tFZQxPmmOUFk0yXAlG+cYUHDQcFM/RTQQs8W3JC4Wc0C8Z5AcITD6NLgt/sbKroZNWl8uHek7hC5nSec4irO3MLSSFlBy1Zql+NNRPW/cNx/bD31TsnO0AgQj1Wv14h35rmDFvpPboZ+BXGyoqOrVrqBfQGR72aYNWEYbqlb6tncyIPkDnBBwSfTi65dhylKMp5Gl02u9fI5apjkEzgMHaIhEIeoBdsWl5iudS3SUzWJnsCmUMXTsOwqWK8Gj2SVUpK99B6wLR5AcmAMIL8gcwTtFEA1LwE7HmsBMpOgNvWW8CoHJSZPXKjyADW3pKLOwIO6U8RQtQqFyeae2OGaylP68cdxJYt+54JSTGVxjnLxE054PAFmHxdP5ZXY9GcBa/nK18sz2oQ4S6aNTYLAm9SjBjFjFbuBL9Dilf5rmrtZe9Vdvp2AToUP2R9Yp8vRr7BO5tcjYpt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wewm5hlmDAUyhx5CkKjZhAFvBnLsjnJ3IseYIUZKBi232xUmZFF7nngb4uK8?=
 =?us-ascii?Q?63A2+vaGFGNHB0X6+EpeBLcb2cFeeRqvOdt4OzJ6J8i3x0gxm1EH8b5SyGrg?=
 =?us-ascii?Q?+yXCLcgz/YsqFLG0o0BO1i5AnvgOlUKGfNVUK0fIfMR8uG2CKr9IVoecSw8e?=
 =?us-ascii?Q?AOS4jhMVRYcafgIkDMVPjRC5p05jAHaAZIe3abMRwYXssYFS46el5wVONX6w?=
 =?us-ascii?Q?4hDzaF8BmRRbh6xS8tS+JIuon93Ln7+wcPyJS4EcquEqZUzNrCcbX5B9PCvR?=
 =?us-ascii?Q?Ds4Aj3qKWp+anuE5m7CurnE2WqRLoc+SBozH0KOsoJsFLRLt5d9FHdnAk1UB?=
 =?us-ascii?Q?tXB65SHjN80hj+4JVsvFUNpPOxhazdMPNnOHlMTh54QGShsGXHTLWA0jp48F?=
 =?us-ascii?Q?Taw0ONitGXjJ9qWsGoEO734BoaGrj35hG37nk7mUZMBTSo9SKWUh4yS3mlFr?=
 =?us-ascii?Q?yYBvcVCTA46dvnkvGo0t1a7/W5VFA+qzSk9RZFB77iW3kt1jdzq6Knd+0XCd?=
 =?us-ascii?Q?GZ48KpmGJuKB/+Qon/iNnk42PVn6JhsnRPexR3dbWkYlME5Opq9b6fAYuAPn?=
 =?us-ascii?Q?5qrydNqoXkX2cJRn+LwoydC5h3IcpdvXKACXR0X0hKUXDriXct/PNGCjHJW8?=
 =?us-ascii?Q?mwcq4eFVBAQxqt/VWe1rMGDUxCAqyGS6PaDtKB5yo++ilsun9AhcSqZkdIVb?=
 =?us-ascii?Q?Zl6ODnho8hRonC3nqJCgOIt1MnDOj2S1V+J8HQ3+rpmzT2ru4Hpx+1Ld2z57?=
 =?us-ascii?Q?a/lIGzrU0dAKbxAoObleXbnge7ulKkAq8tlSyopQ1shT92dm0Surf5JtPn93?=
 =?us-ascii?Q?jTVpb6xVlJPK8fE8feq4vG7g//O1YrUZsHxGX0yp694gSQzpy3L4G1gkeSmU?=
 =?us-ascii?Q?XwgyEATZCJWMy4UQQdIL6vS1pj9/5FyWbzsKzY4ySpodH92YuvKNr0za/nAf?=
 =?us-ascii?Q?5VU/K5bF9io3TKyc4IjrmDgawWmPyflutCsTxXgZQ3y4ZRBVmpCfBzDMc5aR?=
 =?us-ascii?Q?wIQoCNv7daB7Cr46YI3xg8Vci47S8amtkoA4HKNR0LfLa3biGHqP5Y/D6+i/?=
 =?us-ascii?Q?VjDj37ZSqRK4M8monwm0VLJCfI5TmO+45c3GWoOtfTH6xvdADVmoSSSdcIGj?=
 =?us-ascii?Q?Bu1NtQNnC9Lnp5qj3VOFF0iuki9PePv6ZQVcpxXkPgbxz1hTme6/4I5UdlmZ?=
 =?us-ascii?Q?jgbT04phvo1tsDWyuoqSoVEwPihDpaLbCVz8UwMs5nSiWEgIGDZhUtRZZtIG?=
 =?us-ascii?Q?JZ4lYw/gY/oW+PBnoZ5v+5koeeUzQTJxB/5uQR6iGnYVN80AEySNkKzIQtqe?=
 =?us-ascii?Q?9yPQHl2o3RQHZGwT2rKRe8CWzqLuQyv4nWTH3021R2L++rg0s4p7OPlWObPp?=
 =?us-ascii?Q?grU9sOmtkZgcvvAKdFkXPBMTRBriJurG4eIDVCIBh7CjhalwZ9VCeMzxs6nS?=
 =?us-ascii?Q?0wj1BrLiOyA4b57Se+71/OSeFXwTsdelvM7HQSly0ruzf2KpvvltYps3M9kK?=
 =?us-ascii?Q?lR93ruujuEML48fz9GTeuxWR/W+Z3sk5iqLqy2AvS0QthfiSK+4CBNRBSr13?=
 =?us-ascii?Q?qeGyb666+9sfvmo2yF8/ptZJnsX4MO5dszUCpmWIfTw0PVFSn3cInDddcI8h?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9269db52-a73a-41fe-7096-08dc43fe8d7f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 08:12:55.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVeKN/xjLNjSHH+kZLT3p8ITqzKoB7NQnEqmwqkBQFZtoH4S6mQgHCJFBCuzvpKrWpct2bwXyqlGsOwtyRG7JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6878
X-OriginatorOrg: intel.com


hi, Kees Cook,

we notice this warning shows in a different way on e7c4d1a3f4 comparing to its
parent due to the code change.

0f8a68fd1a9999d4 e7c4d1a3f4b23eac0bbcfc11f63
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     dmesg.RIP:__kvmalloc_node
          6:6         -100%            :6     dmesg.RIP:kvmalloc_node
           :6          100%           6:6     dmesg.WARNING:at_mm/util.c:#__kvmalloc_node
          6:6         -100%            :6     dmesg.WARNING:at_mm/util.c:#kvmalloc_node

but we failed to bisect "WARNING:at_mm/util.c:#kvmalloc_node", so here just send
below report FYI what we observed in our tests. not sure if it's helpful to
uncover any problem.


Hello,

kernel test robot noticed "WARNING:at_mm/util.c:#__kvmalloc_node" on:

commit: e7c4d1a3f4b23eac0bbcfc11f630edbe31869ed0 ("util: Introduce __kvmalloc_node() that can take kmem_buckets argument")
https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git dev/v6.8-rc2/kmem_buckets

in testcase: igt
version: igt-x86_64-bcf069415-1_20240306
with following parameters:

	group: gem_exec_reloc



compiler: gcc-12
test machine: 20 threads 1 sockets (Commet Lake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403141515.e5c24085-lkp@intel.com



[  941.391629][ T7017] ------------[ cut here ]------------
[  941.396975][ T7017] WARNING: CPU: 0 PID: 7017 at mm/util.c:633 __kvmalloc_node+0x13b/0x190
[  941.405262][ T7017] Modules linked in: netconsole ipmi_devintf ipmi_msghandler btrfs blake2b_generic intel_rapl_msr intel_rapl_common xor intel_uncore_frequency intel_uncore_frequency_common raid6_pq x86_pkg_temp_thermal intel_powerclamp zstd_compress coretemp libcrc32c kvm_intel sd_mod t10_pi kvm crc64_rocksoft_generic crc64_rocksoft crc64 sg i915 irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel sha512_ssse3 drm_buddy rapl sdhci_pci intel_gtt ahci intel_cstate drm_display_helper cqhci libahci intel_uncore wmi_bmof intel_wmi_thunderbolt mei_me sdhci ppdev ttm libata idma64 mei i2c_designware_platform mmc_core drm_kms_helper i2c_designware_core intel_pch_thermal video parport_pc parport wmi pinctrl_cannonlake acpi_pad acpi_tad serio_raw binfmt_misc loop drm fuse dm_mod ip_tables
[  941.476046][ T7017] CPU: 0 PID: 7017 Comm: gem_exec_reloc Not tainted 6.8.0-rc2-00003-ge7c4d1a3f4b2 #1
[  941.485360][ T7017] RIP: 0010:__kvmalloc_node+0x13b/0x190
[  941.490797][ T7017] Code: 4c 16 ff e8 f7 f4 0c 00 48 83 c4 18 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e c3 49 be 00 00 00 00 00 20 00 00 eb a3 80 e7 20 75 e2 <0f> 0b eb de 48 c7 c7 90 49 90 84 e8 25 6f 17 00 e9 43 ff ff ff 48
[  941.510229][ T7017] RSP: 0000:ffffc90000b67700 EFLAGS: 00010246
[  941.516206][ T7017] RAX: 0000000000000000 RBX: 00000000000000c0 RCX: 0000000000052cc0
[  941.524050][ T7017] RDX: 0000000000000001 RSI: 0000000080000000 RDI: 0000000000000000
[  941.531903][ T7017] RBP: 0000000080000000 R08: 0000000000000012 R09: 0000000000000000
[  941.539753][ T7017] R10: ffffc90000b67700 R11: 0000000000042c40 R12: 00000000ffffffff
[  941.547606][ T7017] R13: 0000000000000000 R14: 0000000004000000 R15: 0000000000000000
[  941.555494][ T7017] FS:  00007f5d678ea8c0(0000) GS:ffff8883ef400000(0000) knlGS:0000000000000000
[  941.564340][ T7017] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  941.570823][ T7017] CR2: 00007f5d677e9000 CR3: 0000000171fee003 CR4: 00000000003706f0
[  941.578688][ T7017] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  941.586580][ T7017] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  941.594470][ T7017] Call Trace:
[  941.597669][ T7017]  <TASK>
[  941.600522][ T7017]  ? __warn+0xcd/0x260
[  941.604538][ T7017]  ? __kvmalloc_node+0x13b/0x190
[  941.609335][ T7017]  ? report_bug+0x267/0x2d0
[  941.613733][ T7017]  ? handle_bug+0x3c/0x70
[  941.617957][ T7017]  ? exc_invalid_op+0x17/0x40
[  941.622570][ T7017]  ? asm_exc_invalid_op+0x1a/0x20
[  941.627524][ T7017]  ? __kvmalloc_node+0x13b/0x190
[  941.632325][ T7017]  eb_copy_relocations+0x15f/0x450 [i915]
[  941.638108][ T7017]  eb_relocate_parse_slow+0xd8/0x8a0 [i915]
[  941.643948][ T7017]  i915_gem_do_execbuffer+0xa11/0x2550 [i915]
[  941.649992][ T7017]  ? arch_stack_walk+0xa2/0xf0
[  941.654620][ T7017]  ? eb_select_engine+0x1500/0x1500 [i915]
[  941.660371][ T7017]  ? __virt_addr_valid+0x1ce/0x290
[  941.665350][ T7017]  ? preempt_notifier_dec+0x20/0x20
[  941.670415][ T7017]  ? check_heap_object+0x137/0x4b0
[  941.675389][ T7017]  i915_gem_execbuffer2_ioctl+0x2b7/0x6b0 [i915]
[  941.681720][ T7017]  ? i915_gem_do_execbuffer+0x2550/0x2550 [i915]
[  941.687988][ T7017]  drm_ioctl_kernel+0x168/0x2e0 [drm]
[  941.693260][ T7017]  ? drm_setversion+0x7e0/0x7e0 [drm]
[  941.698537][ T7017]  drm_ioctl+0x4ca/0xac0 [drm]
[  941.703219][ T7017]  ? i915_gem_do_execbuffer+0x2550/0x2550 [i915]
[  941.709526][ T7017]  ? drm_ioctl_kernel+0x2e0/0x2e0 [drm]
[  941.714967][ T7017]  ? __fget_light+0x58/0x410
[  941.719421][ T7017]  __x64_sys_ioctl+0x130/0x1a0
[  941.724098][ T7017]  do_syscall_64+0x63/0x170
[  941.728502][ T7017]  entry_SYSCALL_64_after_hwframe+0x63/0x6b
[  941.734254][ T7017] RIP: 0033:0x7f5d69c94c5b
[  941.738538][ T7017] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[  941.757945][ T7017] RSP: 002b:00007ffe77db2920 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  941.766206][ T7017] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f5d69c94c5b
[  941.774032][ T7017] RDX: 00007ffe77db2a30 RSI: 0000000040406469 RDI: 0000000000000004
[  941.781858][ T7017] RBP: 00007ffe77db2a30 R08: 0000000000000004 R09: 0000000100000000
[  941.789685][ T7017] R10: 00007f5d69d85120 R11: 0000000000000246 R12: 0000000040406469
[  941.797512][ T7017] R13: 0000000000000004 R14: 00007f5ce78e9000 R15: 0000000000000002
[  941.805341][ T7017]  </TASK>
[  941.808243][ T7017] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240314/202403141515.e5c24085-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

