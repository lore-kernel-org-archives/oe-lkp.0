Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55825199D4
	for <oe-lkp@lists.linux.dev>; Wed, 11 Oct 2023 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFbZjirM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697018664; x=1728554664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBOf60w2Si0uK5wXe3CTF+2lrrWJgN7t9HPXdyPfie0=;
  b=NFbZjirMpJarCL+8DcI8fEFIF6NIKfKjyeZ1FEkRMP/SmAGDhjJ13FXN
   N/0E9ostMh/pZUQGkzLik5p11Cvp/OS/Xvxoo4RP+mmWttpisNR5ajR8L
   myMCjztDTkcEdQpQz26D4uK8iGh5b/8yxAgPsbrlH1f6fzHaBD4oBzjEF
   e8SfFkhmlqtqDmOti/Ke3Bt6ikxIK1OjtTVpTqLFhWgO5KKHcRqemThOz
   zi3ovIyjuxPO0FANjFQlqP3moMcLdaUTkb9NRRcMYOz2Cd0N2l/6QEn5X
   zjj+RD1meM+7uJcJroRhSQI3evO6F5vUe61wPHqet7csqIO35fpEWk48G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415669858"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="415669858"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1085173820"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="1085173820"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 03:04:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 03:04:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 03:04:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 03:04:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 03:04:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXBV/CabjS3YADc/F8d+H3K0fXAx6FSe+Hjz54svx4GWhJKH0ZNAQktm6pwdZ8jNIFMzbhbJ+UHoNYy3oTEp+mS4U2vjHP5wAoLRyS3ojyaS9ASfSdRA9Sn3+vgwKDnR4TV/b2UmfoHZTzKog/DhYg+Eb3he4Kod/agCPB6zOlNI0Knnmgp/heaE0U5rDz8Xfrh+zI1BMvL68t6blhpistipstsVMThq6Tt4MJ/0TwwSWrQsmY5AfFOgL/qtrjwrVzemNLd6VEGC2TLVqy9f1SZE9dngBy+4l0Gxy7a9K8nUg5IjqDKochdyV12WrmFMTc4b6pQTBy3OGkJZBn7fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqvaAmGuEv1+AwecXf/p537wyrRo/LeSq4sZjZEE37k=;
 b=eaYRCqUiSa49hepi4/B2/gdWESXYAaBxPouRbinTXZzWeMnkNiej64buwAFJWzlmK9entkoqE1AHbVDqx8MdTtMHJM1SlM/UJIIutyvDw06iemegab+PUqsEH8SjabeVPQzxsm7aQskYC1xqHEqdKXDHK+h2p1Pb0+ENYVWzkd5kxInA4qWxIbnq67ZTDu6aS+Ub3+HShx6GCwwULDc8dsXCZ9BH8G9ov04QXg1NtxtfcM0GnPNQpQ2kP6sofTSo+Iqw2RDCOHRtQnZD9hPacTsa9wq73ehcusZcpra+h3q5cEmwGtVeBi/dcnXZKdd+kw29ruAxtDb30kxQEUhuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 10:04:17 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6838.029; Wed, 11 Oct 2023
 10:04:17 +0000
Date: Wed, 11 Oct 2023 18:03:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-usb@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan
	<skhan@linuxfoundation.org>, <oliver.sang@intel.com>
Subject: [usb:usb-next] [usbip]  b8aaf639b4:
 BUG:KASAN:slab-out-of-bounds_in_vhci_setup
Message-ID: <202310111714.cb804a0c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH3PR11MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ec6b57-7a67-48e5-3315-08dbca4162c5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqvKVhtYJd2hdy5n2/tneEPjI2PxbeopmsYzfYu92u/eL7HY7kRHfeuGvsvzV3bguMt6R8ufObAE8UCE42rSx1Jy1QU/o9pslg8WD6eEJnGWHHgxDCwEchhJhKdxrsl9PC+KpU7dPQbjtf2NGDKrbymzvkYn5fkUADxZA+mo8If1pJdLsmKt5Q9MHhNtVlcnVQLyVfiP2iv+M5l1/P6/nJQ+EwKLpfRtqKoNztmVC8356DxTAFbuH8bQ0CTLOfNE5EjCJJFoJi46ukxsylln6CMWJk0rBVCg589nxdEq1VsSOmW1cSmPBoMgrppaiw7J613IOY2Ptsf4tu4+gFn3g519EgBOuUFf4vhCj5ycwIyfQXCZfZsNCH9Pjb7cTT9GOzuBx0YPqNlkIE0/2VR0jQF1BYTCVlxecn67XjzuzZkPkRAhRicmGETdcdroWv69J/oh436C7YAvl3awy5qhZmwN9nPP3JltZJzUESyIczLNVlKTu1cC1RIpQbvQb847a7ZuJpREcgzpSAPeLidU1U/a24FacOsSgaZTieCNYtEU3gC7UqOwiQ6DaS7qFL07CzlERAP8cym1/B0xZe6uKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6666004)(6512007)(6506007)(26005)(36756003)(478600001)(6486002)(966005)(1076003)(2616005)(66946007)(83380400001)(66556008)(66476007)(316002)(6916009)(54906003)(38100700002)(41300700001)(8936002)(8676002)(4326008)(5660300002)(2906002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BhZRmER9zEoKZrktt9BTpmQibw6KW8IwL9sc6xn13jTa4TKwkTJ7Pd0ftmHl?=
 =?us-ascii?Q?Nu3LxaKf0BS4xomKYLC9W1MRdIT90Ho08z9XnfP1diI+C6OVH8voNd/VUWDn?=
 =?us-ascii?Q?GsJoiRSnQbQ5fWmXd33Fj7Z1gejodPvGgWdXVUOevs9Wl4LQl22iWjmxMkiN?=
 =?us-ascii?Q?oRNwuwaLvCcmWWFd1qY+rvt9hFes3zPxjIU2iSCLu/EjvUcmIYmXFTYY5RSZ?=
 =?us-ascii?Q?OhAzq5Fhtmb+gGBJFVO4VpNxLUn3hSDBzsPaL/OhY0I/F/AuSnQ7i1l5EjzT?=
 =?us-ascii?Q?VF65+nBpc+DDIt/efpR4ifeCcdRHfceMTAN5mh7cOIloXLiqLYUs9G8AtYQR?=
 =?us-ascii?Q?A/Qr9PKbTKCkssuvui1kQP9JFXfdjNTOILHfEfqXa+skq7vfFHAXEdrPvgKz?=
 =?us-ascii?Q?lqsxgx8flxfxyxWjujuZL82MYnFIVsJ5IWP2hMQairJCrPmy1qR0vBJcb/V4?=
 =?us-ascii?Q?EYs51AmvJJI18h5y46xe0kTgMW/l+JiZs8Jroj2R2VmNubvhrTftZPBLRrP/?=
 =?us-ascii?Q?xaxurwY0aC4LJZPHGUQ1Uj0LoZ73d8O8uFR7jPrgLAAGpzvytQi8dOGp7VJT?=
 =?us-ascii?Q?2dZRwLZ/iLIITwd7dIBQqIvGO0u3zPEKsPh+PoFwO9rcAI1GIV04ZHKt8W+h?=
 =?us-ascii?Q?87R4QGZGTidSnzyDTBjnvEMf+EdIqEjoYLlLSrR9tfCz6RcauJ2hKa0RCFXg?=
 =?us-ascii?Q?NyCuXp+0zP37T9wYVkop8IDGhTwB+46R7qusb7EzwpsGzgTpksmJZat04XwO?=
 =?us-ascii?Q?66B8hvUyvejcg8jJeusKSLVM4FoxKrtb0Kq8wSY5yTVGudY3BH5MYNxdtI7z?=
 =?us-ascii?Q?S9IY3o0nIDX954a7mrLScVCwA1xNQxGRglvZM3lH8sVziu91Pf3g2jzZIJED?=
 =?us-ascii?Q?FSrhkYZX4zEJQnDjz28yeCsYVQzPAwRpeYKcAJ1BoepZ0U3NmFrEVUqH19sM?=
 =?us-ascii?Q?bgsLrAR2tu1n0xpPRgfrQQyTAb9U/5iSy1h7MjZOsgVNPiYTJtMXSoSVMEuF?=
 =?us-ascii?Q?o9Ti5BMf5wR2yQpS6oGipT2XZT3mQPKPhWWmtqAp9+Lo6io7J6k1wxbntJmu?=
 =?us-ascii?Q?cuUcLqr3WJVHdIcc6S83oGiaXHIPbwK04YuSRFlHR1GHTgUkGur4+54drB/9?=
 =?us-ascii?Q?wJ+xrJGwJbBSActzlPm0koYNLmPr8EwyH/YaO6EfZTCHX7xhqrL5tFmlWW3+?=
 =?us-ascii?Q?MTtDrDOCo1MEVaQnEWh22YRnICy69+yEFukHClCgT/usWyifAlZKq9NyYbO8?=
 =?us-ascii?Q?GhsdRqoBJcPBk+I5U4oitJL0PyVD6dmB/vLdYwqRIgGYVae7JQMEvXvTMYp1?=
 =?us-ascii?Q?8tH+quc9tWB0TJJv5PNPjrX5QkQeX6TU70+0XoDE2iF2351GOwDAybVz4Egj?=
 =?us-ascii?Q?qP8fDx5svGWgnbOH/4vOgDy8NFY8QaStD+JFfX2Myx0gNrO+VMi+rMOP9a7u?=
 =?us-ascii?Q?UYsuSR8jv/AOO9FahJTMDiDXuHHrRA9JQ+GbiUvYWbf1Y8X+L2ah/oLpZfl/?=
 =?us-ascii?Q?3Dl2pFuM4qXk6+ce8ur8/8bmhamzY6iZJ3+sQP8fiOkqVyTg2RcJp0kw7M0c?=
 =?us-ascii?Q?0vq8NHWjxQ1/SGvasuMPcqxv9CeQF98qj7ofZnERNBY1HSdqhAN3qbGbZi1P?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ec6b57-7a67-48e5-3315-08dbca4162c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 10:03:58.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+sxskyB+MGX2gvKPplwM8dTapX7ahoTh7JuVGC50ZI8YOrauzv/IX52opMSyqLIzSWxWZXIV0kL3AiQsC8Xzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in_vhci_setup" on:

commit: b8aaf639b403f01d132c9ac1e906c45debfb0218 ("usbip: Use platform_device_register_full()")
https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git usb-next

[test failed on linux-next/master 2a860505b617cf8fda4ebff6cf05d3f774145440]

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310111714.cb804a0c-oliver.sang@intel.com


[ 55.719220][ T1] BUG: KASAN: slab-out-of-bounds in vhci_setup (drivers/usb/usbip/vhci_hcd.c:1145) 
[   55.719220][    T1] Write of size 8 at addr ffff88814f4140e8 by task swapper/1
[   55.719220][    T1]
[   55.719220][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                T  6.6.0-rc4-00066-gb8aaf639b403 #1
[   55.719220][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   55.719220][    T1] Call Trace:
[   55.719220][    T1]  <TASK>
[ 55.719220][ T1] dump_stack_lvl (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 lib/dump_stack.c:107) 
[ 55.719220][ T1] print_address_description+0x2c/0x390 
[ 55.719220][ T1] print_report (mm/kasan/report.c:476) 
[ 55.719220][ T1] ? vhci_setup (drivers/usb/usbip/vhci_hcd.c:1145) 
[ 55.719220][ T1] kasan_report (mm/kasan/report.c:590) 
[ 55.719220][ T1] ? vhci_setup (drivers/usb/usbip/vhci_hcd.c:1145) 
[ 55.719220][ T1] vhci_setup (drivers/usb/usbip/vhci_hcd.c:1145) 
[ 55.719220][ T1] usb_add_hcd (drivers/usb/core/hcd.c:2911) 
[ 55.719220][ T1] ? kernfs_create_link (fs/kernfs/symlink.c:48) 
[ 55.719220][ T1] vhci_hcd_probe (drivers/usb/usbip/vhci_hcd.c:1363) 
[ 55.719220][ T1] platform_probe (drivers/base/platform.c:1404) 
[ 55.719220][ T1] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658) 
[ 55.719220][ T1] __driver_probe_device (drivers/base/dd.c:800) 
[ 55.719220][ T1] driver_probe_device (drivers/base/dd.c:830) 
[ 55.719220][ T1] __device_attach_driver (drivers/base/dd.c:959) 
[ 55.719220][ T1] ? driver_probe_device (drivers/base/dd.c:922) 
[ 55.719220][ T1] bus_for_each_drv (drivers/base/bus.c:414 drivers/base/bus.c:456) 
[ 55.719220][ T1] ? bus_for_each_dev (drivers/base/bus.c:445) 
[ 55.719220][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194) 
[ 55.719220][ T1] __device_attach (drivers/base/dd.c:1030) 
[ 55.719220][ T1] ? device_driver_attach (drivers/base/dd.c:1001) 
[ 55.719220][ T1] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 55.719220][ T1] bus_probe_device (drivers/base/bus.c:532) 
[ 55.719220][ T1] device_add (drivers/base/core.c:3631) 
[ 55.719220][ T1] ? __fw_devlink_link_to_suppliers (drivers/base/core.c:3507) 
[ 55.719220][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 55.719220][ T1] ? __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 55.719220][ T1] platform_device_add (drivers/base/platform.c:717 (discriminator 3)) 
[ 55.719220][ T1] ? kmemdup (mm/util.c:135) 
[ 55.719220][ T1] platform_device_register_full (drivers/base/platform.c:844) 
[ 55.719220][ T1] ? driver_register (drivers/base/driver.c:258) 
[ 55.719220][ T1] vhci_hcd_init (drivers/usb/usbip/vhci_hcd.c:1532) 
[ 55.719220][ T1] ? usbip_core_init (drivers/usb/usbip/vhci_hcd.c:1507) 
[ 55.719220][ T1] ? rng_is_initialized (drivers/char/random.c:918) 
[ 55.719220][ T1] ? usbip_core_init (drivers/usb/usbip/vhci_hcd.c:1507) 
[ 55.719220][ T1] do_one_initcall (init/main.c:1232) 
[ 55.719220][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223) 
[ 55.719220][ T1] ? parameq (kernel/params.c:171) 
[ 55.719220][ T1] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 55.719220][ T1] kernel_init_freeable (init/main.c:1551) 
[ 55.719220][ T1] ? rest_init (init/main.c:1429) 
[ 55.719220][ T1] kernel_init (init/main.c:1439) 
[ 55.719220][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:160 kernel/locking/spinlock.c:202) 
[ 55.719220][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 55.719220][ T1] ? rest_init (init/main.c:1429) 
[ 55.719220][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[   55.719220][    T1]  </TASK>
[   55.719220][    T1]
[   55.719220][    T1] Allocated by task 1:
[ 55.719220][ T1] kasan_save_stack (mm/kasan/common.c:46) 
[ 55.719220][ T1] kasan_set_track (mm/kasan/common.c:52) 
[ 55.719220][ T1] __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 55.719220][ T1] __kmalloc_node_track_caller (mm/slab_common.c:1024 mm/slab_common.c:1043) 
[ 55.719220][ T1] kvasprintf (lib/kasprintf.c:25) 
[ 55.719220][ T1] kobject_set_name_vargs (lib/kobject.c:272) 
[ 55.719220][ T1] device_create_groups_vargs (drivers/base/core.c:4307) 
[ 55.719220][ T1] device_create (drivers/base/core.c:4353) 
[ 55.719220][ T1] mon_bin_add (drivers/usb/mon/mon_bin.c:1369 (discriminator 4)) 
[ 55.719220][ T1] mon_bus_init (drivers/usb/mon/mon_main.c:291) 
[ 55.719220][ T1] mon_notify (drivers/usb/mon/mon_main.c:189 drivers/usb/mon/mon_main.c:219) 
[ 55.719220][ T1] notifier_call_chain (kernel/notifier.c:95 (discriminator 2)) 
[ 55.719220][ T1] blocking_notifier_call_chain (kernel/notifier.c:389) 
[ 55.719220][ T1] usb_add_hcd (drivers/usb/core/hcd.c:912 drivers/usb/core/hcd.c:2852) 
[ 55.719220][ T1] vhci_hcd_probe (drivers/usb/usbip/vhci_hcd.c:1363) 
[ 55.719220][ T1] platform_probe (drivers/base/platform.c:1404) 
[ 55.719220][ T1] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658) 
[ 55.719220][ T1] __driver_probe_device (drivers/base/dd.c:800) 
[ 55.719220][ T1] driver_probe_device (drivers/base/dd.c:830) 
[ 55.719220][ T1] __device_attach_driver (drivers/base/dd.c:959) 
[ 55.719220][ T1] bus_for_each_drv (drivers/base/bus.c:414 drivers/base/bus.c:456) 
[ 55.719220][ T1] __device_attach (drivers/base/dd.c:1030) 
[ 55.719220][ T1] bus_probe_device (drivers/base/bus.c:532) 
[ 55.719220][ T1] device_add (drivers/base/core.c:3631) 
[ 55.719220][ T1] platform_device_add (drivers/base/platform.c:717 (discriminator 3)) 
[ 55.719220][ T1] platform_device_register_full (drivers/base/platform.c:844) 
[ 55.719220][ T1] vhci_hcd_init (drivers/usb/usbip/vhci_hcd.c:1532) 
[ 55.719220][ T1] do_one_initcall (init/main.c:1232) 
[ 55.719220][ T1] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 55.719220][ T1] kernel_init_freeable (init/main.c:1551) 
[ 55.719220][ T1] kernel_init (init/main.c:1439) 
[ 55.719220][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 55.719220][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[   55.719220][    T1]
[   55.719220][    T1] The buggy address belongs to the object at ffff88814f4140c8
[   55.719220][    T1]  which belongs to the cache kmalloc-8 of size 8
[   55.719220][    T1] The buggy address is located 24 bytes to the right of
[   55.719220][    T1]  allocated 8-byte region [ffff88814f4140c8, ffff88814f4140d0)
[   55.719220][    T1]
[   55.719220][    T1] The buggy address belongs to the physical page:
[   55.719220][    T1] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14f414
[   55.719220][    T1] flags: 0x4000000000000800(slab|zone=1)
[   55.719220][    T1] page_type: 0xffffffff()
[   55.719220][    T1] raw: 4000000000000800 ffff888100041280 dead000000000122 0000000000000000
[   55.719220][    T1] raw: 0000000000000000 0000000080660066 00000001ffffffff 0000000000000000


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231011/202310111714.cb804a0c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

