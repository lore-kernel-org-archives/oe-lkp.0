Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D546AC
	for <oe-lkp@lists.linux.dev>; Tue, 31 Oct 2023 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWPlBX/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698720936; x=1730256936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9eTOAog+C3CUvGoypt7CLoupeALHHh2JUJamf4iMIu4=;
  b=FWPlBX/YAmaEjvgbdfbMlnbIa761PoelVnOvUqmMzz7JZhQhJ+TXtv6H
   7OuJhfpcm/kb1Bwwgx08RSuwVbjczhfohdvA42wm5iRZDheau94ycq+Al
   592jG6SoLieEsxjdTaf9M+othlNXxi7OkYKspB9nLIFuywAsYhKX3Vsqf
   rDxXAqY+cH414kAdNroj09obuISMRHjOFwp5sjANaBPxxPT9sA51sRNIe
   ryU/HTg7+Z9mket1pzTP9c3HQExvi5MdfZnHA7KNVGy4aY8YRXqSY0zTH
   cd5O/IHD9YJwWyd4P65n2SxRLlXHWf89pSzvR5zhv+zfcAh0YE6QWnLLh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387082966"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="387082966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="736934196"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="736934196"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 19:55:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:55:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:55:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 19:55:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 19:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+vCKlOpwgQOQ2dhig/SBsusP2c4kNf4egkHlrBtonhgeebP5n8mgNjzYc6efk26DP/akkWbxYzAldXLSfzoEweo+vD9fxCKM+e3AGUFsy8VrKHNo0AUvOg/KjILlP2iZIz9Ha7psCulEF9U/E+aUDbZqIu0utce2QGvC8MNZKBeyIEm5z352xRvIggq1XtV+hnldaH9Hmv3Gzif7LqpHSoYa/x/XEbQfzlW5Tg7DzLqHl1zvlYoaR8bxPxbrKbTUDo3y8PaqnsmcLuahK8+XWh0cZ/5RD1pCxZYTKXgNqCSChbhvBqtdWmMyqohxeWihoy3tE3PhVPCS8YAoqpM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvRWHnBMWVI4kqIKDhnkBqLP68+WrMyfqdiBFODOdUo=;
 b=JKl1cZcof6UkmF8/5Lv+V/IBhe6Qv6QbSDKerVCT0mHbO4e8qTNjPd6wAsT4vjDNXjpKK5yrOjlLpXyYlfM0R8v6Ekj45PjTd/2TFcCVRh2+wqkPI70uYwWzuNRzBo+ehR26gIm+EsveeLLi+dxaTL3OakQh0uRBROCAm+Xp28Kyg7VykOpLavbmHrKs3/Pu/tTe9Sd8hPjvqKxjAvJbSec4M/GZyiddwe3LpwHLGq88yq5zIzsNiUihBD1hHEoIUuxVppaJYDWPVgww7mT7+5205lnFN8JtHjoVogzYd7OW34xiUYe+GWliKIfeJJ4ldQZBbXtHg384GRd0IFtKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 02:55:20 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6933.026; Tue, 31 Oct 2023
 02:55:20 +0000
Date: Tue, 31 Oct 2023 10:55:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-kitchen-sink] [dyndbg]  b4808c4275:
 kernel_BUG_at_lib/dynamic_debug.c
Message-ID: <202310311053.912f184-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 3255e96d-27ed-4a5f-6995-08dbd9bcd21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cToBWNypCbp0KeEEBzlLnuPZy7JvNZAeDmzpkukKMJtFMZYX9Z58fiu9wyO3AcByyUZ+KYtsOpdvwq3/V183e5MLDg0xWMNNbKnb6iSAL7pCqQBTkMlPidONH+7u3n6kwhi44w3036LhFoZz3mk9XiFS9FLcGzI6vOo6AWubsNiORyylpRjR+ej35A3Ds1RQSjoolbA6yaMqG1MQUoIOc4nLHv+ukx6wHcU0Wox8HFNLIMk4bN5pHW9LGzoLrXZyclMXdHWag404RocQfpdMr01fpn80OBupmZ0Zjsb01b6dgaYF7D73bjbBfXsgNuGXH5G/rAaxBLg1cESNbk0ia4UDp+BrlClSxuK2eB25Jj9+2TQH8CJAv5yfmgK0rabEF1BLzeWpF1dDSnI6QjOulE9wv/hdZm6bbveVm2KSSfCn4oGOljN2CVEv9rUFr9BuG2l9oE1v4WuQz3UYqrmZ2xKhCUxXgX9xmDkQZ0p2HMuew4hEH4IhAmQHwVegpRVtDcblJlLaYve+tM1TFDJ7/y4GAin4QEqQjPqz4ZkMyz8WddVDr21CNNfClFUX2adBbk8tDRZp5ilkIvp5Slf5sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(107886003)(8936002)(4326008)(8676002)(6506007)(6512007)(6666004)(6916009)(66476007)(2616005)(316002)(66946007)(1076003)(2906002)(66556008)(83380400001)(5660300002)(26005)(38100700002)(86362001)(45080400002)(966005)(82960400001)(6486002)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7CSK7npVM/tlz6iG/aM+NJKaEyvtBIHvdbea6ue9qOpBXTClxu994iuG0DBs?=
 =?us-ascii?Q?f6T06rIvAwSr+rru0LD7RdgcW2+NtrVvpLaOIhz74jk00xqi4SKUCrk9i+XI?=
 =?us-ascii?Q?jYOtpVltb4Wb++ieUrpk2nD+fkOWy7mp1mDMh1dn1YlIsDUNxNn4c4pGjyCr?=
 =?us-ascii?Q?X3ETxfJvhoRhhiBn+7wjn1af3M2Mc6Ob/yRBjMS/CDo3cG40/kJH82k/7GJv?=
 =?us-ascii?Q?3VOGfPjwIw6Ndmhl165hG4c59rdHl2wKKyUrNDHt88NY7VxfoiXJoNEk89PR?=
 =?us-ascii?Q?8OFbZ3YSgrkiY/omSAzwJzE/LS5ZCpALvOEoic5goaQe270594qqrUTMIpwO?=
 =?us-ascii?Q?nN7Ule5cbhezGrBqjydjy5UCJGLc3h/9BcVBKbf2Ip7OcEp40F5BzTGHaqYl?=
 =?us-ascii?Q?yfRwCH8nrJw+lngfBtenVWdX66FszxnJwdQES1Uq4AY0nAxXKG0qCu02Tuhb?=
 =?us-ascii?Q?jNpXvvItmrQQkk8bhPuY+Tmfij3WFW1kO6DrcGilD38oZ4lluOrI/OV+nq02?=
 =?us-ascii?Q?xiorKciFeqRY5apIvOjWZZcDp4sxw8MQUN0Vsqf7MlYA4IbrhW89oJrOKMCQ?=
 =?us-ascii?Q?xY95qwO3A34OsRgep2EMG/iXG4aVChElAOZ7T2pCKEoSl6jQ+qEUmbl8mNuX?=
 =?us-ascii?Q?wvkDbwBkSuVQFdIu+WBOmRNQ9nVDJQqx56BtmDW30wR6zXcTHhVoDNBT3Zw3?=
 =?us-ascii?Q?ITux6jphZsP+XfgFB8vTrImIRviq3Vma/cFDuvVsmxsYlQSxJr/lDIrQWvPS?=
 =?us-ascii?Q?bgsDZGzoWGsSYNXDqgJdX8aC5sVHA/cmk19mhf/n2Ikgi7SXNmVptC/Cb1gi?=
 =?us-ascii?Q?LFDLFG4+i+bu+YKDSS5PCEK5n/i+S/WdTFOyhhfnAMbFv9oS1I/NVrxHBeIy?=
 =?us-ascii?Q?lYd77hQe9XS0W1q73dD+FDKyrf0tRGZDIuI02Ze4g0HHvlKWOUuWXx8I+ovd?=
 =?us-ascii?Q?3d/tMIK7hYTwLZjmMqf7x4gNPyJ5GUGbuv8yqFSPdVWZ8O6D9o+/FQXKBh6D?=
 =?us-ascii?Q?1Z+WyCLADMb2DFzR3Y2DIjU62gqL8s2X3WaJeIKu6u01J9+IxGZwtW0O/Pz/?=
 =?us-ascii?Q?QNxXtmTkrNwppXuBvEhoO7jmCw1KKYRKvqVbadR0n+Aa4mD29ZVk6mIfdQV0?=
 =?us-ascii?Q?FBuFfHwZRC3cCMHoNw2cM+o7UP1CywpaZoy2/oyayGc0aOEhh1R5H130YDXj?=
 =?us-ascii?Q?w9zZlq5XlqNeO93jGoyAptFRytWKKK5pL8T3V8X6HxqB434srLO2nMeSVc5a?=
 =?us-ascii?Q?RgUpeipwTvp5ZKuAQHphd1Kwt4DgDblOmRfO245b8UplyMnUi4Tep/HWk//g?=
 =?us-ascii?Q?8FQ0Obn4eB5KenFrYp73kOKTaFMNjF0GlM9f51k7+HKBVOXuUPBAbRm/yonr?=
 =?us-ascii?Q?Cr+MDRo+fvaMqYqJLXE5WM3lVRR35coOU+7wCGftzCq7tcET4OTj1suuXzf7?=
 =?us-ascii?Q?2o6230y9W1mURh8GRLBtgoR5Cng2stoZwwnenriH6Aoob2OAIbReasDy1wJ1?=
 =?us-ascii?Q?IKwK0+SrLiaXJUHcTyJIw+G6ohNSyE0kHS76labn6eImY01Hu5FwJcwXKU/m?=
 =?us-ascii?Q?jN/pB5zCuk97eTXyGaz9/WfHHYW3/3sS0j9Ygdel1ObplmryYsS+ibZhrIWA?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3255e96d-27ed-4a5f-6995-08dbd9bcd21a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 02:55:20.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFx6eiq0Z/kWwFg0qK34uanTVDOHL9PdmijS4RYZGiuutbuNzg4K33kT+YmcrZekT6kpFZTUYfcZ4ocqm+gwoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_lib/dynamic_debug.c" on:

commit: b4808c42751b0750080b2c52c0cabf6fd5e41328 ("dyndbg: add 2nd cursor pair to init-fn")
https://github.com/jimc/linux.git dd-kitchen-sink

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------+------------+------------+
|                                                              | 735f754af2 | b4808c4275 |
+--------------------------------------------------------------+------------+------------+
| kernel_BUG_at_lib/dynamic_debug.c                            | 0          | 7          |
| invalid_opcode:#[##]                                         | 0          | 7          |
| EIP:dynamic_debug_init                                       | 0          | 7          |
| Kernel_panic-not_syncing:Fatal_exception                     | 0          | 7          |
+--------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310311053.912f184-oliver.sang@intel.com


[    1.813094][    T1] ------------[ cut here ]------------
[    1.815005][    T1] kernel BUG at lib/dynamic_debug.c:1516!
[    1.816770][    T1] invalid opcode: 0000 [#1] PREEMPT
[    1.818415][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.6.0-rc7-00027-gb4808c42751b #1
[    1.818493][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 1.818493][ T1] EIP: dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.818493][ T1] Code: b8 3b 46 1e c2 6a 00 6a 00 6a 00 6a 00 e8 00 e3 63 fe 89 f0 e8 89 93 7e fe 83 c4 14 81 eb 3f 7e 98 52 e9 2c ff ff ff 8d 76 00 <0f> 0b b8 4c 0f 88 c2 e8 b0 98 ad fe 8d 74 26 00 68 0c 42 1e c2 c1
All code
========
   0:	b8 3b 46 1e c2       	mov    $0xc21e463b,%eax
   5:	6a 00                	push   $0x0
   7:	6a 00                	push   $0x0
   9:	6a 00                	push   $0x0
   b:	6a 00                	push   $0x0
   d:	e8 00 e3 63 fe       	call   0xfffffffffe63e312
  12:	89 f0                	mov    %esi,%eax
  14:	e8 89 93 7e fe       	call   0xfffffffffe7e93a2
  19:	83 c4 14             	add    $0x14,%esp
  1c:	81 eb 3f 7e 98 52    	sub    $0x52987e3f,%ebx
  22:	e9 2c ff ff ff       	jmp    0xffffffffffffff53
  27:	8d 76 00             	lea    0x0(%rsi),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 4c 0f 88 c2       	mov    $0xc2880f4c,%eax
  31:	e8 b0 98 ad fe       	call   0xfffffffffead98e6
  36:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  3a:	68 0c 42 1e c2       	push   $0xffffffffc21e420c
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 4c 0f 88 c2       	mov    $0xc2880f4c,%eax
   7:	e8 b0 98 ad fe       	call   0xfffffffffead98bc
   c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  10:	68 0c 42 1e c2       	push   $0xffffffffc21e420c
  15:	c1                   	.byte 0xc1
[    1.818493][    T1] EAX: 000018c9 EBX: b9ad402b ECX: 00000000 EDX: 00001297
[    1.818493][    T1] ESI: c2a3c074 EDI: 00000000 EBP: c392df14 ESP: c392dec8
[    1.818493][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010293
[    1.818493][    T1] CR0: 80050033 CR2: ffdd8000 CR3: 02aeb000 CR4: 00040690
[    1.818493][    T1] Call Trace:
[ 1.818493][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 1.818493][ T1] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 1.818493][ T1] ? do_trap (arch/x86/kernel/traps.c:112 arch/x86/kernel/traps.c:153) 
[ 1.818493][ T1] ? do_error_trap (arch/x86/include/asm/traps.h:59 arch/x86/kernel/traps.c:174) 
[ 1.818493][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.818493][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.818493][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:265) 
[ 1.818493][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.818493][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1499) 
[ 1.818493][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1056) 
[ 1.818493][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1499) 
[ 1.818493][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.818493][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.818493][ T1] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 1.818493][ T1] ? dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.818493][ T1] ? dynamic_debug_init_control (lib/dynamic_debug.c:1499) 
[ 1.818493][ T1] do_one_initcall (init/main.c:1232) 
[ 1.818493][ T1] kernel_init_freeable (init/main.c:1337 init/main.c:1537) 
[ 1.818493][ T1] ? rest_init (init/main.c:1429) 
[ 1.818493][ T1] kernel_init (init/main.c:1439) 
[ 1.818493][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1.818493][ T1] ? rest_init (init/main.c:1429) 
[ 1.818493][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 1.818493][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[    1.818493][    T1] Modules linked in:
[    1.818510][    T1] ---[ end trace 0000000000000000 ]---
[ 1.820150][ T1] EIP: dynamic_debug_init (lib/dynamic_debug.c:1516 (discriminator 1)) 
[ 1.822506][ T1] Code: b8 3b 46 1e c2 6a 00 6a 00 6a 00 6a 00 e8 00 e3 63 fe 89 f0 e8 89 93 7e fe 83 c4 14 81 eb 3f 7e 98 52 e9 2c ff ff ff 8d 76 00 <0f> 0b b8 4c 0f 88 c2 e8 b0 98 ad fe 8d 74 26 00 68 0c 42 1e c2 c1
All code
========
   0:	b8 3b 46 1e c2       	mov    $0xc21e463b,%eax
   5:	6a 00                	push   $0x0
   7:	6a 00                	push   $0x0
   9:	6a 00                	push   $0x0
   b:	6a 00                	push   $0x0
   d:	e8 00 e3 63 fe       	call   0xfffffffffe63e312
  12:	89 f0                	mov    %esi,%eax
  14:	e8 89 93 7e fe       	call   0xfffffffffe7e93a2
  19:	83 c4 14             	add    $0x14,%esp
  1c:	81 eb 3f 7e 98 52    	sub    $0x52987e3f,%ebx
  22:	e9 2c ff ff ff       	jmp    0xffffffffffffff53
  27:	8d 76 00             	lea    0x0(%rsi),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 4c 0f 88 c2       	mov    $0xc2880f4c,%eax
  31:	e8 b0 98 ad fe       	call   0xfffffffffead98e6
  36:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  3a:	68 0c 42 1e c2       	push   $0xffffffffc21e420c
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 4c 0f 88 c2       	mov    $0xc2880f4c,%eax
   7:	e8 b0 98 ad fe       	call   0xfffffffffead98bc
   c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  10:	68 0c 42 1e c2       	push   $0xffffffffc21e420c
  15:	c1                   	.byte 0xc1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231031/202310311053.912f184-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

