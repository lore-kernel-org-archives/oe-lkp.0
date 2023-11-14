Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC360B66D
	for <oe-lkp@lists.linux.dev>; Tue, 14 Nov 2023 04:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwwOr0Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699937283; x=1731473283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RY6UvW5R7QysgglzVeqv9tlA78bkw0xu1Ya0qaNpUGY=;
  b=AwwOr0Q0YU2RYnvBbM9Wn17ZOGZyU9AuQKFmzr7TOOBVf26W/nQa+9Eg
   5KGuouwXRn2uNSVxEyn5U/SzYu1aY4Zqx2tzOck7ZRrVWcURA8pru+Bgc
   7PLbgDfZkhxbpXgxxa8Mw6uLvQ+8ZJQZhnAC7gjXrqlQdw9l9jl7a7D2X
   uHedIEuXLixVlfk0TkrayzrChkuIn9VSSj6dkDDX8GUgJUzLLWatQD19w
   1YI5a6Et6NOkThIoYA3Th/i7WwkqHxHENZakObGu4MGeGhXI8j+G5CgEz
   0ILEKIgWVJXHIqRFWMkL4nUMOuV3807SGr0Vj3Vf935rTu0/m9gqJ2D4p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457073323"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="457073323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 20:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="888136988"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="888136988"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 20:48:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 20:48:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 20:48:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 20:48:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 20:48:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpkfqZmLt9nmPa2LQxGtyvEjpitkWVqnhx/xwiUjm4d0V2LFmk5spXxTKoRLKbbr+Rx0A6LKvJk2YmKwuXUzkuEu5RfjS/DlICNcOjQ8Vyk03FH7wMykNZ/3bwI6lqfiwoOFke283q2hen9bZDc94DiFtbx535RgF8OluVO5Hl9tFKgm38l9004W1X8xyn8UI8GWdbEKZSK03NShq6P7HCvPpjCdbgm2N2J4w5SNXG8fiCjPmu5Yksi7rSvQ9s54NI98chH58FhfsQuDWKVgwk/d5k4Pebj4tBqwkccKqLWRk3tWP3bBCFX8vSWopB5V/ngtiysB/c3RL86nnVTlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38LqCEnFa0vCcxVgzoovcCfGpEe4XAW1m6QubK2HenU=;
 b=oY1rUGKIf+amr4+7pNKMcCIbdwUF9UuyFghp9rrnQX85wE9LDCaezFUbR2YSUBXJpxwKK74JtnWyY00HKQKqwUcpixhHSb+rKq8VR4+pPvt8yOrTLiY+C4G2Kf/KQR//zZIa92xLcYEUXsb+y7zuJYEfBrj8wj9K9smPBmg5Km2ajSlX7fAQtOWbeXz10Dm31834Vop7fQMLQ//cjT3kyGeUUpMOKNjAWjy/EiL/25dEDMJ1GH89F8WHqja/CDS9wsdThjhOwvHEM6f85RsJcD/eNnbCkVqarKMfQs+0cUtXXpWy7UzygSuCLk3s9hSr15uzK8iGqptia8KwyqcDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 04:47:55 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 04:47:53 +0000
Date: Tue, 14 Nov 2023 12:47:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:devmem] [skbuff]  998988c708:
 WARNING:at_include/linux/skbuff.h:#skb_append_pagefrags
Message-ID: <202311141054.94dd4864-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0245.apcprd06.prod.outlook.com
 (2603:1096:4:ac::29) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: b185d8f4-05d7-432c-9f89-08dbe4ccdce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ZiJum9zaNsJ6e4E7JhcqMh0JQCYFvzFCMepRjo35G6J3qt3MF4pSPyZI93ZT+GReRaYn40uwm5h5V/TTrtLQStPAQUoznrsUjEPkbLZSNDwoG8dpV+2/3RS5o8Qz1/eNRkhR/LLBTJjuBPUevEfcqNErFwnZVIdYZrfw1E5OahcfKAtsH3a7xQ493T/sc/WZIL7P0xwx8xmgAQhzfLE29P7+RCkShsctSkfR0yWJ5duwHRq5E0aD4hKRa2TzCOfbN1JerTMEYv+mqcx5SIT1rhZRslHH2NnA7wUFDasG6DNrz1IN24Fp2wdOLmFVFF/rh/m23pU9la6yb+qBCmdAvIZTwpQUNgaChK4MIoYRbDGMmwtJ+bOhxM7mRAyHijyWg4gfWCfu7g3lvt9k9DAWQOWFYdqsW4lBIjizc4sOAX3tXdGSEss1Xnz+v+glD/xgcKG/qaIhh1DDmFZnkI3P5chsxHtYUzkmNM+eAa3jZSoq5u9Q4M9rJqXoQByR/CsD2DDluTjySxP1CFYywbEu9Bg65Re3+qyYImErMVThoys1nXJBUYAQnkB1MiOexwLctaDmJQFeb2raHUdcgcKVdt8wPa3wQhEbJ/brEmrn2b5vqkY4ObugW3x3rQXGnzYkXST/3GevWDf7MZmnx7TuAGol/vMwp2wy8opHMTlW6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799009)(451199024)(64100799003)(8936002)(4326008)(8676002)(6512007)(2906002)(26005)(6666004)(6506007)(83380400001)(38100700002)(41300700001)(45080400002)(478600001)(82960400001)(5660300002)(2616005)(1076003)(107886003)(6486002)(316002)(36756003)(66946007)(66556008)(66476007)(6916009)(86362001)(966005)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzMdiMjl0+BgzPrsPb3CW4Gk6/l7MAQ8cj8wrgB0KReAZNNpez8qSgN7CXSK?=
 =?us-ascii?Q?n+okTY2FzYoTrz+EGrIYnuWfxljeZEt5bV/ODI+9rRMtu94e4wYJNBf6OSxX?=
 =?us-ascii?Q?M2uiISpomjPthfUDP301ywwQdNynNj2fT6BKxj/mnQQzZ1oWtaD7I3kN1s5y?=
 =?us-ascii?Q?flPc/J7mRapmFKVVixYYRcTUkaa2jyeHIgYHOcV07RpA2epTQu5ji15uN62F?=
 =?us-ascii?Q?9YJG0xK/YkM/X6T+lLplPe+pAvZNtvK2CWoXcLNoXwYtm+LLynSRp6YEMtbq?=
 =?us-ascii?Q?2E7lEka7XNHKEmSdEam09qUnoJ1icMWI1/iRvtP4vEfHTDFpeSUG8Pe+pFV8?=
 =?us-ascii?Q?hpW7yuh/fsX5NciE/x4BXj+RkbQ8lvI+ZZNfbCBnGRVs5ofmCvenOmewITAO?=
 =?us-ascii?Q?j+ZjdXd4Eo/vOkuRiNX1mOPRwMpgI9P6qytoLlJj4b63ulpszdORbuTZQMeF?=
 =?us-ascii?Q?OYhau44jxNavuCGvUZyRN5kkCHBrCTpFmTgDYBcxZtkLVhjcpxot5i2iQJWr?=
 =?us-ascii?Q?lBOjFcx5s0nlQd6PYNcPQNM+RFxG5e7UJarD5bO7boeKpM5DfTZV0CosObuq?=
 =?us-ascii?Q?JSw7rHrxEhExEkSimOb94dffjooK12x0lwHviGrJbz+KtHvbpMV41S5t4OPz?=
 =?us-ascii?Q?FOQzHH228n9WWyZmeDm72R2leGN1tYzIETA4KTkrv+BEVEx+mi1cshplDxD3?=
 =?us-ascii?Q?fOttQbBcFh6qTOaq2YVeF6C5xJmyNNFTS5CpPb1iitE33ZTN/t+KjCOCupIW?=
 =?us-ascii?Q?VmPdPJF0YepWzhIzaN0JCO7vbB1DnSsnRnwGLmZKsfaeggDdvXGfa3fe5dZu?=
 =?us-ascii?Q?hhhuB/GW6wncyj5y2uuinQDhHM/l3/mg+i75R4GobAK6VjlOFjvEloBarYmc?=
 =?us-ascii?Q?JWqhx0kAz8rzqPT5Lh9F1I1uTXF0JTZlSzG8Nz/oSZ603Y84ohRj3Zr+cBTL?=
 =?us-ascii?Q?WCjw/2fVW7orei/7c8xtB564BLVzSAYK4otjRaXE2dNnhQxSY7a6GdpFUvoe?=
 =?us-ascii?Q?zNfwH7LFZsnIZ50LgkigaxZ8fBFaIuEymq4uLxUS+U+NXUKbj85h5CKvxBc+?=
 =?us-ascii?Q?xwhv64pzAK1drrM6ennjKxaLZdZg86dVRcQcmNYvakkk0GkNuow+UG6kTPWf?=
 =?us-ascii?Q?qq+Mh38u9OR3cl8UFGyHFnllH9mKI1IKnt9pgbE25/J//bmOggv38pIHbvjc?=
 =?us-ascii?Q?4XBbOR+qM6An/P4fx75wI6jWK7iwm0/J3muPPQqE839fMQqN7Fmnysdak4Bm?=
 =?us-ascii?Q?KnOV787GC1Z2sd0/ls9SUvsvP5WLrIvFQZTEXLE/cAUPYWqkOPZ+Okdq8u/5?=
 =?us-ascii?Q?QKT0rm5aW70t1Bogz66HF1tjT2Qo9kAvr42QMeVe6W4u/CZaNSwDxIP9PLDg?=
 =?us-ascii?Q?ZgXFasJw7ObDg1rd1ZpG8+l2t58LCzniCWusU53BMTzx4wZfkmwMigmeslxM?=
 =?us-ascii?Q?K61QY/6EVedsU9MESZGZxtjcu5P0GTWKgg3GkPKYOCD3HWVmwnUAQrPy9E/M?=
 =?us-ascii?Q?zKYz3MkBtRp+Sde3fmsaEJFcSX1f8pzUdrKJdP4uA+Gj65R132OqGsb6/Va5?=
 =?us-ascii?Q?RzH55uHYkQVKUT/b3h5aRApZgUHb3j6xtdx3WZtj37Z9TcTM8sq3CDBHq/xp?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b185d8f4-05d7-432c-9f89-08dbe4ccdce5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 04:47:53.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOzS3q4iszmRxSmTUEup71uxH80cqX4YnaPPJ7+L4hXDJ7QEKdbhapTREHzjmftKhdTU4b3xZVgNCWPt52LPNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
X-OriginatorOrg: intel.com


hi, Yunsheng Lin,

the WARN added in this commit was hit in our tests, but we don't the ability
to figure out which 'caller' raises it. so still send this report to you FYI.


Hello,

kernel test robot noticed "WARNING:at_include/linux/skbuff.h:#skb_append_pagefrags" on:

commit: 998988c7080cc2577b66fc00b54b9c500bb14444 ("skbuff: explicitize the semantics of skb_frag_fill_page_desc()")
https://github.com/gestionlin/linux.git devmem

in testcase: fsmark
version: fsmark-x86_64-2628be5-1_20230209
with following parameters:

	iterations: 1x
	nr_threads: 1t
	disk: 1BRD_32G
	fs: ext4
	fs2: nfsv4
	filesize: 4K
	test_size: 4G
	sync_method: fsyncBeforeClose
	nr_files_per_directory: 1fpd
	cpufreq_governor: performance



compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311141054.94dd4864-oliver.sang@intel.com


kern  :warn  : [   42.903239] ------------[ cut here ]------------
kern :warn : [   42.908819] WARNING: CPU: 49 PID: 3530 at include/linux/skbuff.h:2427 skb_append_pagefrags (include/linux/skbuff.h:2427 include/linux/skbuff.h:2445 include/linux/skbuff.h:2525 net/core/skbuff.c:4297) 
kern  :warn  : [   42.919023] Modules linked in: rpcsec_gss_krb5 nfsv4 dns_resolver nfsd auth_rpcgss dm_mod brd intel_rapl_msr intel_rapl_common btrfs blake2b_generic x86_pkg_temp_thermal xor coretemp raid6_pq libcrc32c kvm_intel kvm ses irqbypass enclosure crct10dif_pclmul sd_mod scsi_transport_sas crc32_pclmul crc32c_intel sg ghash_clmulni_intel nvme ipmi_ssif sha512_ssse3 nvme_core t10_pi rapl ahci ast crc64_rocksoft_generic intel_cstate libahci acpi_ipmi crc64_rocksoft mei_me drm_shmem_helper intel_uncore dax_hmem ioatdma i2c_i801 megaraid_sas crc64 ipmi_si libata drm_kms_helper mei i2c_smbus joydev intel_pch_thermal dca wmi ipmi_devintf ipmi_msghandler acpi_power_meter drm fuse ip_tables
kern  :warn  : [   42.980697] CPU: 49 PID: 3530 Comm: nfsd Not tainted 6.6.0-13882-g998988c7080c #1
kern  :warn  : [   42.989069] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
kern :warn : [   42.997096] RIP: 0010:skb_append_pagefrags (include/linux/skbuff.h:2427 include/linux/skbuff.h:2445 include/linux/skbuff.h:2525 net/core/skbuff.c:4297) 
kern :warn : [ 43.003130] Code: eb ad f7 c6 ff 0f 00 00 75 89 48 8b 06 a8 40 74 82 48 8b 46 48 a8 01 0f 84 76 ff ff ff 48 83 e8 01 48 39 c6 0f 84 69 ff ff ff <0f> 0b 48 8b 46 08 a8 01 0f 85 b3 00 00 00 66 90 48 89 f0 eb 51 48
All code
========
   0:	eb ad                	jmp    0xffffffffffffffaf
   2:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
   8:	75 89                	jne    0xffffffffffffff93
   a:	48 8b 06             	mov    (%rsi),%rax
   d:	a8 40                	test   $0x40,%al
   f:	74 82                	je     0xffffffffffffff93
  11:	48 8b 46 48          	mov    0x48(%rsi),%rax
  15:	a8 01                	test   $0x1,%al
  17:	0f 84 76 ff ff ff    	je     0xffffffffffffff93
  1d:	48 83 e8 01          	sub    $0x1,%rax
  21:	48 39 c6             	cmp    %rax,%rsi
  24:	0f 84 69 ff ff ff    	je     0xffffffffffffff93
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 8b 46 08          	mov    0x8(%rsi),%rax
  30:	a8 01                	test   $0x1,%al
  32:	0f 85 b3 00 00 00    	jne    0xeb
  38:	66 90                	xchg   %ax,%ax
  3a:	48 89 f0             	mov    %rsi,%rax
  3d:	eb 51                	jmp    0x90
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 8b 46 08          	mov    0x8(%rsi),%rax
   6:	a8 01                	test   $0x1,%al
   8:	0f 85 b3 00 00 00    	jne    0xc1
   e:	66 90                	xchg   %ax,%ax
  10:	48 89 f0             	mov    %rsi,%rax
  13:	eb 51                	jmp    0x66
  15:	48                   	rex.W
kern  :warn  : [   43.023046] RSP: 0018:ffa000000f24fb20 EFLAGS: 00010202
kern  :warn  : [   43.029176] RAX: ffd4000101950601 RBX: ffd40001019507c0 RCX: 0000000000000004
kern  :warn  : [   43.037223] RDX: ff1100208a108640 RSI: ffd40001019507c0 RDI: ff1100405def2e00
kern  :warn  : [   43.045266] RBP: ffa000000f24fb90 R08: 0000000000000011 R09: 0000000000000018
kern  :warn  : [   43.053316] R10: 0000000008000000 R11: ffffffff81caf7b0 R12: 0000000000000000
kern  :warn  : [   43.061364] R13: 0000000000000ffc R14: 0000000000000004 R15: 0000000000000000
kern  :warn  : [   43.069416] FS:  0000000000000000(0000) GS:ff11003fc0840000(0000) knlGS:0000000000000000
kern  :warn  : [   43.078420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [   43.085081] CR2: 00007f965b80f6f4 CR3: 000000407ea18004 CR4: 0000000000771ef0
kern  :warn  : [   43.093130] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kern  :warn  : [   43.101184] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
kern  :warn  : [   43.109232] PKRU: 55555554
kern  :warn  : [   43.112889] Call Trace:
kern  :warn  : [   43.116258]  <TASK>
kern :warn : [   43.119268] ? skb_append_pagefrags (include/linux/skbuff.h:2427 include/linux/skbuff.h:2445 include/linux/skbuff.h:2525 net/core/skbuff.c:4297) 
kern :warn : [   43.124709] ? __warn (kernel/panic.c:677) 
kern :warn : [   43.128872] ? skb_append_pagefrags (include/linux/skbuff.h:2427 include/linux/skbuff.h:2445 include/linux/skbuff.h:2525 net/core/skbuff.c:4297) 
kern :warn : [   43.134308] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
kern :warn : [   43.138910] ? handle_bug (arch/x86/kernel/traps.c:237) 
kern :warn : [   43.143301] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
kern :warn : [   43.148040] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:568) 
kern :warn : [   43.153125] ? __alloc_skb (net/core/skbuff.c:641) 
kern :warn : [   43.157778] ? skb_append_pagefrags (include/linux/skbuff.h:2427 include/linux/skbuff.h:2445 include/linux/skbuff.h:2525 net/core/skbuff.c:4297) 
kern :warn : [   43.163206] skb_splice_from_iter (net/core/skbuff.c:6927) 
kern :warn : [   43.168456] tcp_sendmsg_locked (net/ipv4/tcp.c:1249) 
kern :warn : [   43.173532] ? __pfx_nfsd (fs/nfsd/nfssvc.c:930) nfsd
kern :warn : [   43.178557] tcp_sendmsg (net/ipv4/tcp.c:1341) 
kern :warn : [   43.182883] sock_sendmsg (net/socket.c:733 net/socket.c:745 net/socket.c:767) 
kern :warn : [   43.187355] svc_tcp_sendmsg (net/sunrpc/svcsock.c:1257) 
kern :warn : [   43.192172] svc_tcp_sendto (net/sunrpc/svcsock.c:1288) 
kern :warn : [   43.196827] svc_send (net/sunrpc/svc_xprt.c:922) 
kern :warn : [   43.200878] svc_handle_xprt (net/sunrpc/svc_xprt.c:816) 
kern :warn : [   43.205684] ? __pfx_nfsd (fs/nfsd/nfssvc.c:930) nfsd
kern :warn : [   43.210689] svc_recv (include/linux/sunrpc/bc_xprt.h:39 net/sunrpc/svc_xprt.c:877) 
kern :warn : [   43.214917] nfsd (include/linux/sunrpc/svc.h:320 fs/nfsd/nfssvc.c:953) nfsd
kern :warn : [   43.219226] kthread (kernel/kthread.c:388) 
kern :warn : [   43.223245] ? __pfx_kthread (kernel/kthread.c:341) 
kern :warn : [   43.227891] ret_from_fork (arch/x86/kernel/process.c:147) 
kern :warn : [   43.232334] ? __pfx_kthread (kernel/kthread.c:341) 
kern :warn : [   43.236950] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
kern  :warn  : [   43.241730]  </TASK>
kern  :warn  : [   43.244777] ---[ end trace 0000000000000000 ]---
user  :notice: [   43.269494] mount nfs success



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231114/202311141054.94dd4864-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

