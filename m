Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82012482F7
	for <oe-lkp@lists.linux.dev>; Fri, 12 Jan 2024 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5WDCZcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705048785; x=1736584785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d35c7PyUxd8x91xVpjAnOdgCjIIAnb3esUpVxt228Vk=;
  b=W5WDCZcMg5nYI22mefxiLItGnbI5s7cTIDHyxmxv62M80lynYdNDVT++
   zkn4C600B2Vt495ebdHF1ihc3fTwnps7AqIWLSsaghWF3nMsgqGS2+Vlt
   MKSpyZzHlWYBLr0yQmzM7dSEFnEaUQoUg6tzQGEEjAT9TfqJMaXWypT+J
   fIHPv2wBJM0rCOZAyuX3otTi2UVttrf7w0ZUf3g01XuXMm6f2kE/jjDYv
   7QqLynogaclSWKjUPdbi30bjXo6PPUx/HQf9Wc9N0yhzjVl7Eh7CEH5F3
   9E/vZMqxU0UGu0eOmk56xmrYcCoupnKIDTnjf+1M4ufb6qEPN7zBCs+jE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463399555"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="463399555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 00:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="31307754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2024 00:39:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 00:39:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 00:39:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 00:39:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 00:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMiqMXeHwggEKnsF2/HwhMRBBQwkeOfYvRebJOfJptx/N3iT3RoW4I3AFK8TIKy4kVb1n0M8jT3bCZ93ykXkAq97CRNCobRBuGNdMMSfGCqDYQQuOcGZU+KGao0WxtNzn7xdBzgRtfBadm66ef684AOpMOXrgF/GCLKEx2n9v8Q8jzOoZucIbOwG0S74T1eBBRkdmgi1mmKRB4T0L/9qJKBg4nlxBRrS1MN7e5gQYrKupgDt7NULiweyw9Jmw4/JnZLrT996rJ8drR3a+NJMdabu6Poj58VzIk+xh/ZO2rvvIJi8p42DLLcYpB3Bt42ZVxt0mXHFwHoYkLME2RA9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CAVEOGaVxh7npV46/31r+QQy6iZ2AppRO62M6zsSH0=;
 b=JOwvOwX+bSwdItb2STMN5qL5xcyj+SYk7P/x1O/iQg0e8MmUSMz2ah9EUsbAaILmgMB1B6cquUjEZVXpLxWACRUFKIc1pcyv6PbGW3j/2ItsZJIqjWEfbHXIF8O4X5zPw3S9DmnNEfGGEA/0tj6TzGtqQ4Bi5G7RCbWqRe5K6oWOjIJM4DOzffYfBYCan7KydKXz6Ut4NG9/3fjRXFI8qwyCn3Suz3otWMPPx/KWviSUNsWoxvPJFh5mxL8bjCal5ACDK2++Wq8CQ0rKfwMQuvBEosiK1jCJs//apBq5AOU0HqoZYGwv4NjGtGn15//gcBnHy+pfuQrLiiFnOnr/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 08:39:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 08:39:29 +0000
Date: Fri, 12 Jan 2024 16:39:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:xfile-diet] [shmem]  eb7cb5031d:
 WARNING:at_mm/shmem.c:#shmem_get_folio_gfp
Message-ID: <202401121633.69a3e4c8-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5584b13d-dd70-4c34-442f-08dc1349fd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tnatf+N0Xcv7cl1a0qTFoyv+u8LMgfx4DITmN0j5cEPozf7QzUr815zm8JbVaVWVn7ASwFKOsIDZ8ajQB0dH5IlqDlPEQtJNdNX5gx8IWs+P37My9lQb4hlOzcRnDaCqw6SlC66AACaIU8gfLfHRzBVkulJ4vWDYRDsOh14YRxQA4upeDvxWPr9sHdggwLgxClUO0x24IomEFtfOU6rUjq+aXOb8ngWYbau/d8LUX0Lex5BUc3IDXjSM/1BoCjvzfsOENPXDr6e4DsvI6NoNwhXdXw5XSlNfCbZu3R15S4JFsX9UWwVhllF0WwaHumJhZvIrPcXa72RRfWnuLnoyEOT10L/mowzAtpUn8U5RCOYsbqKI+ShgOe5aaC5hZRakZR4FyS+bdd9EAOO4zei/2ooDh23CB2VmBKJ7hFH8VyeuKoIQSEBGp/5F579/c+MpZfFGGwRRxa5MJHrEVKQRd5E/CXsdoIUiWSK7njXGWk/jjnyc0H/9gsuGC2w7mQ/Jd0HWyRv8d9hE6RUuogpoAyf1oLa4HylaGO052Z0ZwQ/tJMZfFOliFLkOrCl3jitRLfiQzwVD6dbZlm69VpwdvsWPIZY1/MHCRdFXDj6jTIMR3vLVUp0Wohw0hxlqrXOJa0p2yPPzDEvJl20O/Odlpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(966005)(478600001)(5660300002)(6666004)(2616005)(6512007)(107886003)(86362001)(45080400002)(41300700001)(8936002)(6486002)(6916009)(66946007)(66556008)(66476007)(38100700002)(316002)(26005)(83380400001)(8676002)(1076003)(82960400001)(36756003)(4326008)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uEtl0ivWkrDvtICqFjCLLYckbIj0DljXhpsfphxL7rKob6FoDxojFwmpcAgD?=
 =?us-ascii?Q?w6TPQ+Ylc4UM+6Kjh+YJQxqJQ6zCvOWc1rcV6QS76u6NwBR+FnZJcV4GqCuB?=
 =?us-ascii?Q?S/znBPeZ1dLg7gRQwPCn3BLAKPrNK88+glyhiU30cknPf0Rc5s/HdKmU96qv?=
 =?us-ascii?Q?DRDbaEnY28nR1mvV1UmINx9/cZjgKjiSgpUsRal+p+2+YFotVh179+Hi54CI?=
 =?us-ascii?Q?Co5Et1GeCA1yxBD8c3DBQBFgkOt2ysg6s55azhHel9CEvjFRVuVJagyeRPH0?=
 =?us-ascii?Q?2ENQGMMJ0V6cqGITfdp6vIkX87v+XtzX+AQGxYUdS6BWycOd+FSkjQG4e1lY?=
 =?us-ascii?Q?H5tcJ4Nw2r3E4k6oY/BsdQ4bKSTlGkM8qlk9Ykb/LyHcBDX/y0ZL6O/qE3li?=
 =?us-ascii?Q?XzRxA058KwRFKBEnOjRmokgQnSK2m41oC++xZte6EpCIy1t5HJWAjGnn52nx?=
 =?us-ascii?Q?8ggH8jTXt4t4K5Ew89MtilmjFTelb9FIkrLOn9OfCGQsfHRDhPzf8RzZaB1f?=
 =?us-ascii?Q?unviQ427nGGhaeJdt0PWmd9pPQhzPmK6S16Gu789gpAd8GEKLiQaLR7echqs?=
 =?us-ascii?Q?4u/a8vA5zGG4Ch27Ljqc2FeqvOvDUClKjs20teFuObZEgcMQvcPngdmEWfKY?=
 =?us-ascii?Q?UrltHfujCob8pbSZubLTdQhUCNTfUZdn36jqreycW9JFVAozMY7vQ4Mf4Tbh?=
 =?us-ascii?Q?XaB0qb4FtgxJBg1yIkgboXg5Qb63Dy2Qp6pFPhfwjCotH/ZoJWw+YQYk8Zlf?=
 =?us-ascii?Q?HzZXwyAVNbu1+dAFjsXkc0c6f4Fk8x8gEjlsyDbUbYuXI0FrWj7LHtQVYCR2?=
 =?us-ascii?Q?sJ33HNFEmJZUQU6U3XSPpZcwMUeH/FHHIMPv9om7avIdXSFyLltX4mcK56Dx?=
 =?us-ascii?Q?F6hATaWL2dmCXorr5+NDYK2PWQoxxmtB5j87DgalJDLhuB9HEae8h4ns01IX?=
 =?us-ascii?Q?FWf4uw0t7lgHmuXqRJtoQ0QVj1desna9kskYde+2bam+x18CTiIt9t6HTCDa?=
 =?us-ascii?Q?kn2IQhBJx8fdv8Te4IyWdxdWWVTtpD3W1YlQIB3x85+uPhP83Rn4WP7i5Dok?=
 =?us-ascii?Q?8mIHiwc9DpiqqbH8LnTezhOzNGbQA0msX1uV3AQJymf5fJnearCNukWLlqUs?=
 =?us-ascii?Q?rQjPFKAcPvF9/VOXqNEZdaTBlYMw+WdVm90SrVSTmEAqEzSInfFfY6XuWdny?=
 =?us-ascii?Q?/Q73bV8eRhtoNRgBsnoofhxMpuDEJm8AFFVVw68D8j13whvfqgzgazfnsLck?=
 =?us-ascii?Q?SVDddZ8UNUkpOb8UQpdTMuOiRZNWtmCjyeKucmVpK52/SwCg74++TJQO/vd8?=
 =?us-ascii?Q?/vDQQUQ6Pu7VbQN8ZTZEJKZ23gz0F9+eY5LJJ+vQ6MArgp3jNmqmuEKoGMeZ?=
 =?us-ascii?Q?PJHZWPvZWFkVVCAvY6mFfBxW/I8VWTSFdG30I83LKu+EHyuCHKxmF0IOXVgO?=
 =?us-ascii?Q?7Ga5/mzJP4SRDdzFLHJlR7YJyblbInBhmWAkF0EQipFKYYi2PaObCbfXPx3Q?=
 =?us-ascii?Q?CBI4hio4Zy6ILjUsy3XprXVDfuylOqNs7ldE1wa13wglC56OCBpPgTyLNLhX?=
 =?us-ascii?Q?I3HjdiO1NOHYU8F7z/5Rmb03L7zTwTQ78P9hOX0rGt+PJ7ZIPB5uhh0SGvZ3?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5584b13d-dd70-4c34-442f-08dc1349fd8c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:39:29.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LHCgMryyb7fz/uLPKHIE0NKyFYnd/xIam6pqhOox8/3D+nQn6ZpcDKk9myTorr5LjQSfB0E8kJDZnZaYILeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/shmem.c:#shmem_get_folio_gfp" on:

commit: eb7cb5031d6ee0344fa3f2940be9c71649b04c92 ("shmem: move the shmem_mapping assert into shmem_get_folio_gfp")
git://git.infradead.org/users/hch/misc.git xfile-diet

in testcase: avocado
version: avocado-x86_64-18bebb9c9-1_20240108
with following parameters:

	test_group: group_02



compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


we noticed a BUG_ON moved as a WARN_ON_ONCE, but parent seems clean in our
tests:

bcdfae6ee520b665 eb7cb5031d6ee0344fa3f2940be
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6           83%           5:5     dmesg.RIP:shmem_get_folio_gfp
           :6           83%           5:5     dmesg.WARNING:at_mm/shmem.c:#shmem_get_folio_gfp
           :6           83%           5:5     dmesg.boot_failures



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202401121633.69a3e4c8-oliver.sang@intel.com


[  322.579297][ T3823] ------------[ cut here ]------------
[ 322.584656][ T3823] WARNING: CPU: 2 PID: 3823 at mm/shmem.c:1954 shmem_get_folio_gfp (mm/shmem.c:1954 (discriminator 1)) 
[  322.593560][ T3823] Modules linked in: btrfs blake2b_generic xor raid6_pq zstd_compress libcrc32c intel_rapl_msr intel_rapl_common sd_mod x86_pkg_temp_thermal t10_pi intel_powerclamp coretemp crc64_rocksoft_generic crc64_rocksoft crc64 sg ipmi_devintf kvm_intel ipmi_msghandler i915 kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel sha512_ssse3 drm_buddy rapl intel_gtt mei_wdt drm_display_helper ahci intel_cstate ttm drm_kms_helper libahci intel_uncore mei_me i2c_designware_platform video wmi_bmof libata i2c_designware_core mei idma64 wmi pinctrl_sunrisepoint intel_pmc_core acpi_pad drm fuse ip_tables
[  322.648910][ T3823] CPU: 2 PID: 3823 Comm: avocado Not tainted 6.7.0-rc4-00137-geb7cb5031d6e #1
[  322.657589][ T3823] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 12/22/2016
[ 322.665649][ T3823] RIP: 0010:shmem_get_folio_gfp (mm/shmem.c:1954 (discriminator 1)) 
[ 322.671469][ T3823] Code: 48 8b 14 24 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 84 c5 f8 ff ff 48 8b 3c 24 e8 db bc 17 00 e9 b7 f8 ff ff <0f> 0b 41 b8 ea ff ff ff e9 b8 f8 ff ff 83 f8 ef 0f 84 bc f6 ff ff
All code
========
   0:	48 8b 14 24          	mov    (%rsp),%rdx
   4:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   b:	fc ff df 
   e:	48 c1 ea 03          	shr    $0x3,%rdx
  12:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  16:	0f 84 c5 f8 ff ff    	je     0xfffffffffffff8e1
  1c:	48 8b 3c 24          	mov    (%rsp),%rdi
  20:	e8 db bc 17 00       	callq  0x17bd00
  25:	e9 b7 f8 ff ff       	jmpq   0xfffffffffffff8e1
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	41 b8 ea ff ff ff    	mov    $0xffffffea,%r8d
  32:	e9 b8 f8 ff ff       	jmpq   0xfffffffffffff8ef
  37:	83 f8 ef             	cmp    $0xffffffef,%eax
  3a:	0f 84 bc f6 ff ff    	je     0xfffffffffffff6fc

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	41 b8 ea ff ff ff    	mov    $0xffffffea,%r8d
   8:	e9 b8 f8 ff ff       	jmpq   0xfffffffffffff8c5
   d:	83 f8 ef             	cmp    $0xffffffef,%eax
  10:	0f 84 bc f6 ff ff    	je     0xfffffffffffff6d2
[  322.690840][ T3823] RSP: 0018:ffffc9000c3afc78 EFLAGS: 00010202
[  322.696742][ T3823] RAX: 0000000000000000 RBX: ffff88815c36a2e0 RCX: ffff88815c36a310
[  322.704542][ T3823] RDX: dffffc0000000000 RSI: 1ffff1102b86d498 RDI: ffff88815c36a4c0
[  322.712340][ T3823] RBP: 0000000000000003 R08: 0000000000100cc0 R09: 0000000000000000
[  322.720138][ T3823] R10: ffffc9000c3afc5c R11: 0000000000000001 R12: 0000000000000000
[  322.727939][ T3823] R13: 0000000000000000 R14: 1ffff92001875f98 R15: ffff88815c36a458
[  322.735739][ T3823] FS:  00007f04921a8740(0000) GS:ffff88879d100000(0000) knlGS:0000000000000000
[  322.744489][ T3823] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  322.750907][ T3823] CR2: 00007f0491ee57b0 CR3: 0000000212e26004 CR4: 00000000003706f0
[  322.758705][ T3823] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  322.766504][ T3823] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  322.774302][ T3823] Call Trace:
[  322.777439][ T3823]  <TASK>
[ 322.780229][ T3823] ? __warn (kernel/panic.c:677) 
[ 322.784147][ T3823] ? shmem_get_folio_gfp (mm/shmem.c:1954 (discriminator 1)) 
[ 322.789363][ T3823] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 322.793720][ T3823] ? handle_bug (arch/x86/kernel/traps.c:237) 
[ 322.797899][ T3823] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 322.802425][ T3823] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
[ 322.807303][ T3823] ? shmem_get_folio_gfp (mm/shmem.c:1954 (discriminator 1)) 
[ 322.812524][ T3823] ? shmem_is_huge (mm/shmem.c:1947) 
[ 322.817138][ T3823] ? d_add (include/linux/spinlock.h:391 fs/dcache.c:2796 fs/dcache.c:2816) 
[ 322.821057][ T3823] shmem_symlink (mm/shmem.c:3492) 
[ 322.825493][ T3823] ? shmem_fallocate (mm/shmem.c:3457) 
[ 322.830274][ T3823] vfs_symlink (fs/namei.c:4464 fs/namei.c:4448) 
[ 322.834536][ T3823] do_symlinkat (fs/namei.c:3925 fs/namei.c:4492) 
[ 322.838885][ T3823] ? __x64_sys_unlinkat (fs/namei.c:4472) 
[ 322.843754][ T3823] ? getname_flags (fs/namei.c:3934) 
[ 322.848877][ T3823] __x64_sys_symlink (fs/namei.c:4509) 
[ 322.853485][ T3823] do_syscall_64 (arch/x86/entry/common.c:51 arch/x86/entry/common.c:82) 
[ 322.857747][ T3823] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:129) 
[  322.863476][ T3823] RIP: 0033:0x7f0492298007
[ 322.867736][ T3823] Code: f0 ff ff 73 01 c3 48 8b 0d 86 0e 0e 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 58 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 0e 0e 00 f7 d8 64 89 01 48
All code
========
   0:	f0 ff                	lock (bad) 
   2:	ff 73 01             	pushq  0x1(%rbx)
   5:	c3                   	retq   
   6:	48 8b 0d 86 0e 0e 00 	mov    0xe0e86(%rip),%rcx        # 0xe0e93
   d:	f7 d8                	neg    %eax
   f:	64 89 01             	mov    %eax,%fs:(%rcx)
  12:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  16:	c3                   	retq   
  17:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  1e:	00 00 00 
  21:	66 90                	xchg   %ax,%ax
  23:	b8 58 00 00 00       	mov    $0x58,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 59 0e 0e 00 	mov    0xe0e59(%rip),%rcx        # 0xe0e93
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 59 0e 0e 00 	mov    0xe0e59(%rip),%rcx        # 0xe0e69
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[  322.887109][ T3823] RSP: 002b:00007ffcebb4bee8 EFLAGS: 00000246 ORIG_RAX: 0000000000000058
[  322.895346][ T3823] RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00007f0492298007
[  322.903151][ T3823] RDX: 0000000000000000 RSI: 00007f049054c390 RDI: 00007f0490540b90
[  322.910956][ T3823] RBP: 00007ffcebb4bf00 R08: 0000000000000000 R09: 0000000000000000
[  322.918755][ T3823] R10: 0000000000755d64 R11: 0000000000000246 R12: 00007ffcebb4bf20
[  322.926557][ T3823] R13: 00007ffcebb4bf70 R14: 00000000011bc010 R15: 00007f04920a8a40
[  322.934362][ T3823]  </TASK>
[  322.937240][ T3823] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240112/202401121633.69a3e4c8-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

