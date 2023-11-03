Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44515394
	for <oe-lkp@lists.linux.dev>; Fri,  3 Nov 2023 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5V8pTHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698990580; x=1730526580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Ye/JOswkYdicssbUePdorBxmCW8Q3UsGH6PLFdQoPg=;
  b=F5V8pTHDUSeh/bVes8ns1dtR81T8BnMUy2aNXJJcWmawDFT5TjZD600R
   u2NVRUD7J6l9sM+OWEPz5UCZSoF60V1D2yyEKH1yY6FCFcjp6LzBbpbH1
   i+5J1wawW3didZq/xh3FBubqQBXtI0vCuau9c3iFUjgCUl/OtLQTIhKH4
   oSHaiGRoRZryLMRCaJU/PeOVvCYvJC6+SrXVYTr+3kViblXI3lSFsyxjk
   Lesum9L0KkPzFDGV46sOaWMWyAoOLWInbRI+digWu0y5vaZIHiMBpS0gb
   u1AlCY7SzbiwMvMfLBUofgHz3qGcBh2MBPnKC6N0wOfIt04xFhBMk0cq0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391752494"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="391752494"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885126058"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="885126058"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 22:49:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 22:49:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 22:49:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 22:49:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 22:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQlCo9uzy9+0tXFaFz9uv/O2w4oNu37LB5FWcl3SKh8VpRvQ2YH5NI64prg6f6fduRvVSjVpvDIdN+u4t8nBLkuOsQWTf+YkIRb6q95zhozBeVu4zjAvvOW6oY5eF09LX7hRrEZe8wKro2d1ret2jutrEU1MhmnYf3bFmUsPm1Bv6J/DiIFTKfGmhLK7YhpicPB5DDluSf99RWR7rG0L9ptjg8UTKikM/EM77dPjjWGyKBPbEm00lINnJ21b7v5BS6qyBTFvbzwS9SJY9ndfnnLRtRkqNXyfxsCb9KazZQ1UUzzWkBjkPpAX8S3rXA6o5MD0F92sWblU03PmQv2Y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6lseSOJQEpW+D/5G93FE2eeKQP+02z5YlBApj12O9w=;
 b=dMZzXrK28NyErvq49JSz0m/Wma8PJEd11KopkU75ullwFUlAqCGJsw4GkjzuFpwZf8jdf7rwvSAdTE9UO/YVP7nJC6/PcYMP3yJdOfT8eGJm158aveJTFfNwYD4niiwGKtW/DnZ6vcIMkUI66YtEE9Mo8byCgJ9NB0sBSxkVnqyZ3Igl6quCVwkep/u1ZQwtiqeXIgOUF9gUanU/sBOpXfulDusq3QYKJJzZko9dS6p1b413KTvCx1gppL2ZcGer6z65226GJwpBnQMYcQvq/naZzlp+4F+4jr/Q3UwjrrVOZ/Zrajq6O+TZ7sKhusl7dbsgoZWJrxKvqe5z72yDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 05:49:35 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 05:49:35 +0000
Date: Fri, 3 Nov 2023 13:49:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [sean-jc:vmx/fb_clear_atomic] 260bf07cfb:
 WARNING:at_arch/x86/kvm/vmx/vmx.c:#is_valid_passthrough_msr[kvm_intel]
Message-ID: <202311031201.ce2c359d-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:820:1::20) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BL1PR11MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: 079d9310-e3f5-4972-e606-08dbdc30a911
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shIEKmhI2jiCB5HQO8UljFjvKu9h+vWP/R798kXcE5fVHVlqXjmTXQ5ORiMST8IdNS1SC8FVmpyFXn3DTsl6UnSNb3j2JGykbO2DO/WEyM5TqOAQODBlBj+qO+vh01F7nLzLFpWUTAyPgY4SBLER8v6JqI+NoKtDHdlfMBxM7RAOOXxCz1mDM3WNiZpiX/4YtVugwuVyckdsXeF8D+ffn/NHo9Ay1CxWg3JuWruZPoJHHaA/doJf+8ih5pbm/OTaWf2Z66b8YNu0ea3vPHWSwTYYPnH78O462JFqynyImeeHTBMuJq0mKtJ3IH8o4G2zc08FVlt8+MP3gYEo+pO14V5j3KeZy/kQm0HdyykDO8Xb6gs0J7ZxyjfXZkP/1qSVbVxCRPREIcKD1hhqjQLj7ISkxlznZgf3nCN/sS9pZxq4LricShJeL+imviqT/gTkFKcGWht/FE/dgEdLuJV4O6QXa/rMdlvcT8QnS2zYCwtausUfDdWMK1IAL2MfX7uMuhOpvB/g6JiAnGe8x01GK+i7yL0S6lpQwqBRO69ibZ9B49OuRviYIR5755GWDuGsPeiBcUT3T9YRHLVipxZwqXf9vzL2MUJ/U43bhLEkZy1qIb26htTqKL3IVSGiy5vRP1vDnT4Kdx6enwhz0hxa3FpHy4GWihEmEqrjc5FSSpj9qgt80SLmlCXPNQmtzsha
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(26005)(2616005)(38100700002)(36756003)(86362001)(82960400001)(6506007)(83380400001)(5660300002)(478600001)(45080400002)(1076003)(6666004)(966005)(8676002)(4326008)(66556008)(66946007)(2906002)(6916009)(8936002)(66476007)(316002)(107886003)(6486002)(41300700001)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8l/AAmhUDN+XfQRudQMGRBIVpOlm0hMLpBxvZQdue17hnDKL719RCkYXy4h?=
 =?us-ascii?Q?mU8OcHJa5nJcUu4vRrVOdwZQRJPSbwA7KjAaA7iWWAFHIVU5f35Y1KOr25EV?=
 =?us-ascii?Q?Y6ZbGyvSkl/6DDrWlQw8v5668+QMYzLAQ+6Qk34vOFvyUkSm2CvTsvurDw98?=
 =?us-ascii?Q?IoE9uY5NNrIZemNvXoZswxF5iM6nsjTvME7LMV+QN0qrOSzyuc5jqDVLftbd?=
 =?us-ascii?Q?n86qCa4LuYLFYyjUpK4+lsDcY5xSDThv2lWhPlGDywYImKp/ewlr/wK2NA2Y?=
 =?us-ascii?Q?lYJSMZV4AfJB9R9T+sRlnOuKY04YvyHTkTsk5r45U0tEHWN7Knc4WpRG6Rvb?=
 =?us-ascii?Q?VTQPKxsSTTLw9QjOiHhjkuTgvLijJ9oBelAe4DWAGiyl8VKGcc++5sfZQSNm?=
 =?us-ascii?Q?W5IWxe+n0yIUMqSoBbUOd/7htnVp9skZEfQTW0yIlRjNyt+dWloY0t2wg3id?=
 =?us-ascii?Q?1MSR0hm6fyD96+OQpj9eDqhOyPCKpNi4uDKerhQZsm7MhyYJbqCxsysoXJID?=
 =?us-ascii?Q?YqMhd1wVlIrV8wtQ72OSvIPUn54zbdwFxhPaMEK0dzHCF3h1pUdXQpMftSj9?=
 =?us-ascii?Q?RZoFNALB7P7SazXFSh8Ye3RAHJp1M31aFD3FOdSCLHH/bvxx7YxwPOMzMT8I?=
 =?us-ascii?Q?GF2/Ab2nrfgDFYYy1HaY7fe1bVN1boDnb2UEgBfRoy6C0ITf92ubWUyfryyg?=
 =?us-ascii?Q?15ysZRUPObEoVi8Iy3YXx2doD0PCiQfdrqOVBJPqzn/dwox0RiTJgCkuwLWL?=
 =?us-ascii?Q?g5N+1b5XNAHFsHZWL8Fsw/hJ6T5S3F08oEgqRT5Hdf1+1eIvA2LmdEDMxl5X?=
 =?us-ascii?Q?gF0foUMP30zmeNbnVIXkTGE9jACMEcbQq8xe1tsU6q9btlasDfp7JQvJXHuc?=
 =?us-ascii?Q?j1jQhNDTsuCs0RiC3cgjPMrig7y6rTAJl4BYvxDrH6YMNXrUlZQ91wWd6W+n?=
 =?us-ascii?Q?+JaS927SXDB4jeIg/WCRjNKWtYuc5z6/DxEZNfX0pTzUjTXoqhrsxtB5XRXK?=
 =?us-ascii?Q?WAe3j9OtyImp6WGoJ1ebcO8w/SViBsfxMrD4w4n3mwjPd6TiHEqeqdBvPQhd?=
 =?us-ascii?Q?F1cV1VJcheSOdn+8FhtWVzvVvG1SwRB9rxv/9fDOtLqDPWFs6ofxtjVlVlrR?=
 =?us-ascii?Q?tAfxwYvdckAQiNO5cGDpK4pFdLWqUlkekse4RJbxCMv8q0KxQryhz1auQ3Zy?=
 =?us-ascii?Q?Lv27ZEgv+UbBxeGbiWJ0Qz3CUXPp3L+gPRIU1ZFIDR0YBlcwBRdnL5qm6pTb?=
 =?us-ascii?Q?iFFVpw2Pxak/OKBd7vHmBomUjFPYKUxs6ux8Mr+Uk7VagC9ek1iHQgBUQqzq?=
 =?us-ascii?Q?tyXBAph8Roo1AnAW4sJSBQsX3bEUtL08eWHgb9CH3/M3242T6CZ+CPs/9r2f?=
 =?us-ascii?Q?hAlGx5fCGAXHbnixVDrXjYrV67w/+mc8b09xwhcHNd79imBH+YrZwNMDyarD?=
 =?us-ascii?Q?WHdwj2qIR4Ce4DFIPfJVUxVA4N0+S9MwFkOzBPLPpDFhgjOYyfE4JcvHnfk2?=
 =?us-ascii?Q?pesPDnBtD4mY936Il/2sGBLHDchtP8J3/aey5fFevt0xYV8o4K1az7Uv5RXc?=
 =?us-ascii?Q?BC/IxY/qP5m35gIFZrmt0RJm3y6a/zEGXHtPkiXz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 079d9310-e3f5-4972-e606-08dbdc30a911
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 05:49:35.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmc/kHwXDkb9JYF5se3dxS2aDLa3reFOR7ZUSujasPeKfI9hzCPMKZ9twovFTiFkC9ik20dB+OlPuc779gqymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5525
X-OriginatorOrg: intel.com


hi, Sean Christopherson,

we notice this is a 'for testing' patch, but we cannot figure what the test
purpose is. so we still send this report FYI about what the impact of this
commit is in our tests.

besides dmesg.WARNING in below formal report, we also notice below 4 test cases
are impacted while they can pass on parent.

6afbd2b4cb479a20 260bf07cfb61cec55bc9372c743
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     kernel-selftests.kvm.hardware_disable_test.fail
           :6          100%           6:6     kernel-selftests.kvm.kvm_create_max_vcpus.fail
           :6          100%           6:6     kernel-selftests.kvm.mmio_warning_test.fail
           :6          100%           6:6     kernel-selftests.kvm.recalc_apic_map_test.fail


Hello,

kernel test robot noticed "WARNING:at_arch/x86/kvm/vmx/vmx.c:#is_valid_passthrough_msr[kvm_intel]" on:

commit: 260bf07cfb61cec55bc9372c7430961be96f2e7b ("for testing")
https://github.com/sean-jc/linux vmx/fb_clear_atomic

in testcase: kernel-selftests
version: kernel-selftests-x86_64-60acb023-1_20230329
with following parameters:

	group: kvm



compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311031201.ce2c359d-oliver.sang@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231103/202311031201.ce2c359d-oliver.sang@intel.com



kern  :warn  : [  195.817839] ------------[ cut here ]------------
kern  :warn  : [  195.826248] Invalid MSR 123, please adapt vmx_possible_passthrough_msrs[]
kern  :warn  : [  195.826284] WARNING: CPU: 197 PID: 5442 at arch/x86/kvm/vmx/vmx.c:663 is_valid_passthrough_msr+0x97/0x140 [kvm_intel]
kern  :warn  : [  195.850988] Modules linked in: openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal btrfs intel_powerclamp blake2b_generic xor coretemp raid6_pq kvm_intel zstd_compress libcrc32c kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel nvme ghash_clmulni_intel sha512_ssse3 nvme_core ast t10_pi rapl mei_me drm_shmem_helper intel_cstate dax_hmem crc64_rocksoft_generic crc64_rocksoft i2c_i801 crc64 drm_kms_helper mei i2c_smbus i2c_ismt wmi ipmi_ssif acpi_ipmi ipmi_si ipmi_devintf ipmi_msghandler joydev acpi_pad acpi_power_meter binfmt_misc fuse drm ip_tables
kern  :warn  : [  195.919882] CPU: 197 PID: 5442 Comm: cpuid_test Not tainted 6.6.0-rc5-00154-g260bf07cfb61 #1
kern  :warn  : [  195.932054] RIP: 0010:is_valid_passthrough_msr+0x97/0x140 [kvm_intel]
kern  :warn  : [  195.941947] Code: 7c 08 84 d2 0f 85 a6 00 00 00 44 3b 23 74 31 83 c5 01 48 83 c3 04 83 fd 10 75 c3 44 89 e6 48 c7 c7 00 22 f5 c0 e8 b9 d6 34 c0 <0f> 0b 31 c0 5b 5d 41 5c 41 5d c3 8d 87 38 fe ff ff 83 f8 01 77 8b
kern  :warn  : [  195.965661] RSP: 0018:ffa000001a6bf930 EFLAGS: 00010282
kern  :warn  : [  195.973984] RAX: 0000000000000000 RBX: ffffffffc0f557a0 RCX: 0000000000000027
kern  :warn  : [  195.984613] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ff11003fcbca89c8
kern  :warn  : [  195.995079] RBP: 0000000000000010 R08: ffffffff816749e6 R09: ffe21c07f9795139
kern  :warn  : [  196.005646] R10: ff11003fcbca89cb R11: 0000000000000000 R12: 0000000000000123
kern  :warn  : [  196.016073] R13: dffffc0000000000 R14: ff110020aecca3c0 R15: 0000000000000001
kern  :warn  : [  196.026642] FS:  00007f7054c3f740(0000) GS:ff11003fcbc80000(0000) knlGS:0000000000000000
kern  :warn  : [  196.038127] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  196.046913] CR2: 00007f7054b335b0 CR3: 00000020a40d8003 CR4: 0000000000f73ee0
kern  :warn  : [  196.057347] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kern  :warn  : [  196.067908] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
kern  :warn  : [  196.078325] PKRU: 55555554
kern  :warn  : [  196.083873] Call Trace:
kern  :warn  : [  196.088897]  <TASK>
kern  :warn  : [  196.093678]  ? __warn+0xcd/0x2b0
kern  :warn  : [  196.099808]  ? is_valid_passthrough_msr+0x97/0x140 [kvm_intel]
kern  :warn  : [  196.108884]  ? report_bug+0x267/0x2d0
kern  :warn  : [  196.115415]  ? handle_bug+0x3c/0x70
kern  :warn  : [  196.121839]  ? exc_invalid_op+0x17/0x40
kern  :warn  : [  196.128606]  ? asm_exc_invalid_op+0x1a/0x20
kern  :warn  : [  196.135804]  ? irq_work_claim+0x16/0x60
kern  :warn  : [  196.142570]  ? is_valid_passthrough_msr+0x97/0x140 [kvm_intel]
kern  :warn  : [  196.151583]  vmx_disable_intercept_for_msr+0x71/0x460 [kvm_intel]
kern  :warn  : [  196.160996]  vmx_vcpu_create+0x250/0xbf0 [kvm_intel]
kern  :warn  : [  196.168882]  ? intel_pmu_refresh+0x3a3/0x1530 [kvm_intel]
kern  :warn  : [  196.177372]  ? vmx_disable_intercept_for_msr+0x460/0x460 [kvm_intel]
kern  :warn  : [  196.186801]  kvm_arch_vcpu_create+0x7e4/0xbd0 [kvm]
kern  :warn  : [  196.194911]  kvm_vm_ioctl_create_vcpu+0x4dd/0xe70 [kvm]
kern  :warn  : [  196.203223]  ? kvm_mmu_notifier_invalidate_range_start+0x960/0x960 [kvm]
kern  :warn  : [  196.213205]  kvm_vm_ioctl+0x94c/0xdf0 [kvm]
kern  :warn  : [  196.220382]  ? kvm_unregister_device_ops+0x90/0x90 [kvm]
kern  :warn  : [  196.229013]  ? do_vfs_ioctl+0xb2/0x11d0
kern  :warn  : [  196.235923]  ? vfs_fileattr_set+0x4f0/0x4f0
kern  :warn  : [  196.243017]  __x64_sys_ioctl+0x130/0x1a0
kern  :warn  : [  196.250016]  do_syscall_64+0x59/0x80
kern  :warn  : [  196.256502]  entry_SYSCALL_64_after_hwframe+0x5e/0xc8
kern  :warn  : [  196.264686] RIP: 0033:0x7f7054d3fbab
kern  :warn  : [  196.271053] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
kern  :warn  : [  196.294712] RSP: 002b:00007ffebc75de00 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
kern  :warn  : [  196.305833] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7054d3fbab
kern  :warn  : [  196.316328] RDX: 0000000000000000 RSI: 000000000000ae41 RDI: 0000000000000006
kern  :warn  : [  196.326992] RBP: 0000000000e27800 R08: 0000000000419238 R09: 0000000000000000
kern  :warn  : [  196.337496] R10: 000000000000041f R11: 0000000000000246 R12: 0000000000e252d8
kern  :warn  : [  196.347834] R13: 0000000000e252a0 R14: 00000000004029e0 R15: 00007f7054e64020
kern  :warn  : [  196.358301]  </TASK>
kern  :warn  : [  196.363117] irq event stamp: 21569
kern  :warn  : [  196.369360] hardirqs last  enabled at (21589): [<ffffffff8138c93d>] console_unlock+0x16d/0x180
kern  :warn  : [  196.381523] hardirqs last disabled at (21602): [<ffffffff8138c922>] console_unlock+0x152/0x180
kern  :warn  : [  196.393732] softirqs last  enabled at (21586): [<ffffffff83adc9d5>] __do_softirq+0x545/0x814
kern  :warn  : [  196.405747] softirqs last disabled at (21581): [<ffffffff811ead72>] __irq_exit_rcu+0x132/0x180
kern  :warn  : [  196.418034] ---[ end trace 0000000000000000 ]---
kern  :warn  : [  196.657200] ------------[ cut here ]------------
kern  :warn  : [  196.665196] Invalid MSR 123, please adapt vmx_possible_passthrough_msrs[]


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

