Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B72119
	for <oe-lkp@lists.linux.dev>; Tue,  6 Jun 2023 06:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686031549; x=1717567549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sUDv+XDyElVll9oNzhKSf7UAUCYTlNlwVh+30e9AzHQ=;
  b=NqgZhyZkY4Acx78Mn7yKwTaLkCprZhhBrcoCzf1n/8OYaJSV/9ccztRS
   m5rieHtvEdnGtm3P13hIV0YVqdx7PdifCkfXFsfTW7j0WKwA0noOsFK46
   FoEPnzCryp1gEZ02FvSMf0oA1Jntl0RptCIwlVmsGlb89MWvTbQM95dlL
   rXOtgFy7R2zOpCDG99Ka92IcbwDUn9G0jrUPuHHYZzUvUuYR/hWPrznFU
   h715UfjEVHStX7dH70MUBapFswg5CAnXgYlg4Fi+xb1cSBNmeye6GTb4q
   MfJ6KLmvtJXDAq7zYQEyH33AMQGXjbHcBrjKYtqd5/zhtMqhnl2gl+Nct
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384881458"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="xz'341?scan'341,208,341";a="384881458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 23:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686396013"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="xz'341?scan'341,208,341";a="686396013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 05 Jun 2023 23:05:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 23:05:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 23:05:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 23:05:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 23:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCFzTwxDIeMpdj8p0Lc+A3JD30Qpb2tZC0eE4OZIApsQ7UkianjCufbw96LiOpetfbQWXzXWp5SqyR1EKQNY3o+liHDgK7Ku2DhYwSZqNiFm7/Aufw+2LwZDqFdTpK9jhVqDTBbbh8umpmABdLp9585IzgrBbqV/L5MVZZ7tuiCkMIH1k8LAc/mcuo8E/df7o25uslTMzXEigVknvVbaTxq2AmC1bmFsWS3GkFpnQ4sbC4zwh4fAq46mdsJUo5dyg8wjV9WiOPQm3xdAq4vcZ78HhuMv+5scAckGZejw8jxdY4hxTlcldTL5ymhcXRwMtpCko0cD3uQOy44oo8Kl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE308ZFH+noPTx0Ge25vdwyNriw5bvDUsY/Emtg9xMU=;
 b=BlUxVB4QR0E1B7wc9vERxcpDXd/bs/DgG68Ku9Ia33anYaRqzU+JktyoTsPUXgcpLhJDTTIHpvXy0gYjRHfRJsleK7XYoKN8F1WmaIh8C/wveFUllSvYHJEkuduSsTkqiTtZIlQ4u1CKpBeMDQdzhAwkDDA7V9lGp09IAhAl6EN/051niAZsbbyMupdtQtsSR/jNRgghhrscMr39ilf4qY2FH/++TJAtG5yoooyKD3sMFOgBpSm0REpZxJvY4LS6lGT4IMHaWp3qSYno3bDP8WAmXsga7AHxL5m/P3cxCwqQN7B/pVDxrwdEEBlLMHfp5Qg6cWHI/gF/7DzkCv5fkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 06:05:17 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 06:05:17 +0000
Date: Tue, 6 Jun 2023 14:05:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:jitalloc/v0.1] [x86]  b99e562f2f: kernel_BUG_at_mm/vmalloc.c
Message-ID: <202306061203.7bd05cf5-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="/iPzH0e0Z6Fhq5gi"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f46638a-b5ed-4dff-1953-08db6653ffb9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKToWFTBtYKZhU4aDub2Kqq9MMTwnht3x8RXghqEQ+ynoeGrMc0utihohmmpiFCku7TZJL+R+tTO6Ovxnxi621MiM2UxMwKIWgPuRHt7w2Ai8dqiiLdqrazg+Ph2cz0xaBgKkvkyCoVfxJiRq7rmhNHZ1zxY8sGUtYfAfKn70wciyzQgl0QvnbCFGRyRNA8asDzaBHxfuvKPYiMkPKLqQDyC2uToe/4EHDIAedl3DtCI3jgAYyiB6cnHkd/LWNrdu8yY/X2N6HLT2D7GrDwj760yVrvbIRPtDDnPIRuMiiquZqLQhqcqA1CMzYLZL6qEoyX+hkNGCBqEVuWImGQUINjEGCsVSAbZgVO5fuuQ93G2HM1L8n+EBv7q6j9R2Yxhj6Z+vwfnqpKGhkczGVZk1QadYp+PC8eEmEJrWNao0Vdo+IfitlHPksOjbQzFsuSUP2++cw7Zqh4aaT1YBIeja9z9Wqi+s4hyszHotbCeyrE8AgDDjGJ1nN64NFRIWTeQvDUtKc4Od562ssOenc1fqvUZCrAjti6sE2ItLlfU6/NwBZmDmjTfj7GNCq1/FMiHTSIOTECBPoVQnRClcLQrwSieXp8DCFSM7iLerEZMFXHS99Kj15XLuY2ovB/0yYu98CR8UKRQmpg26deE9K/SsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(478600001)(6916009)(235185007)(8936002)(8676002)(2906002)(36756003)(86362001)(5660300002)(4326008)(66556008)(66476007)(316002)(66946007)(82960400001)(6506007)(38100700002)(2616005)(41300700001)(6512007)(107886003)(1076003)(26005)(83380400001)(186003)(966005)(6486002)(44144004)(6666004)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CBBVvIpmazbnq0EVl9dD4hsdR/aT+k0lU3bAo0Xwzk2AtbdsW/eRVug8f5QR?=
 =?us-ascii?Q?yeaX+wvjhqTmeZgO9OHm6mjUxQr2sVDK5uI5P+UD1phVcvXDSzRCWL7hRrLT?=
 =?us-ascii?Q?4r1Q2a9XWF4oMlslPS4xqSxGQQOhsD+voHvPEZEhgZIt9tKW7xw9vE/gDT68?=
 =?us-ascii?Q?NSZy2PMs3D5RwY29/uW5XfKn3hG7NlF6gArnAqvnCBJAfeSjo/AADe4+B5w8?=
 =?us-ascii?Q?chf03HkyfSlbkNu4BHqBBqXjff/WIaNRQMFxh0FVNpU9Z/FM74/L9Z/FMx0d?=
 =?us-ascii?Q?87Xn5PM1v6sZrRmBEPrLRuug/ZTRAEceMXqUY1kvFi+vqnH6XiBU8IpiXuka?=
 =?us-ascii?Q?vew+ckRWLTwTFvpFnf/MWaNwU2orFx/Oic9JAAtP1J9S3gaI2YpDMzKUrhMJ?=
 =?us-ascii?Q?/RH/7xraEy6Q5ojmyM+LnLhCfZuOWh45uFF2jnPthSc0m2pfln+6sewbEIbq?=
 =?us-ascii?Q?IqXXHXfVHpTjmXjLkNOTvrYrqZy9kz2rUQbab+Co17l1QF1d95id2pCVVf0B?=
 =?us-ascii?Q?3nbCIi8RLGofKADeNr3GR94xyxsDHHRR/YD9Yf4kwwzbeIn4DGSQmH+c7PHB?=
 =?us-ascii?Q?KilaW2/5P8SEenMlWX1FKtgCX0mYStNhVi+5NRFA373+2n/igKKxAnp0cxqr?=
 =?us-ascii?Q?1PSeCuZTiu/Hkm1OQDFeXRIhHTZbGjHh0XfpNTLhtJexW7R0g5PrzfA0cL3U?=
 =?us-ascii?Q?oFNIDneOVukoOFGPoIOjJhYmuZ4hfedL2JVfam/+AlfMcM4wb9disiAm2982?=
 =?us-ascii?Q?536byoCK1zQ9+lNe7HJIugDFFKbhxeWh+1uCQPgkIaB4X9KNGHPlWYEybAJx?=
 =?us-ascii?Q?IfRwiebSFmH0uRB/QzU9CLl/aZFBVpPQp1i9Ml3hfVt6RhgfZHh8RKM9awkn?=
 =?us-ascii?Q?RVfPSKJBYm0DPqqS6jJurEjegeeWz1/rrxPS7ARzQLXX2L4CkTr3B2aNdvIt?=
 =?us-ascii?Q?LE5MeGX+cokZZDcjTPWddz8r07a2HApMcQb76knDAK8GNLwqin2Rl52ERezd?=
 =?us-ascii?Q?KexyP7Zv+Zdsiq5Lw+AdYL7TUrmEgQhlTnuvTsQPOR1YqhGaCEW6Q/65u53c?=
 =?us-ascii?Q?YLC3MVD62BO2ElFYDSz8ICgrf+LAxjtnwEB5W/4uTDaH7rOE5HdA8IyldGEH?=
 =?us-ascii?Q?JJzQobkDbwzdMQe9mUudxvGLtETMJMHZUjXKLeFdMQhb5s6qEV8kn4w2I3J9?=
 =?us-ascii?Q?gtbOmsOox3U2SeaupIeYHLol+a+A6SIJXub52ovqIPFb/vtxVaJy1R3ZbG0J?=
 =?us-ascii?Q?uk0SoR144ohttdDLt6rBjn9bNzuJ9O2dc1aOXujSGfEpUjUfvkWZD9+H/quG?=
 =?us-ascii?Q?m5pbq3H0sHLI08L3Y+6p/dM8mxWS94Fe6yMni+SqUIdOgwc+JtWuSKa3bVTQ?=
 =?us-ascii?Q?8xAFLJAa6o2Qj2zoKGi4TSpxEJSSAsdIWOO6Dl+oY9HvQR0bbWecFgpsbPCm?=
 =?us-ascii?Q?1Yalckai9pWJj7KFqotP6n+di6FJ+mBpqpjf/83hY4XZ0hsDfzpzvQVqwfDN?=
 =?us-ascii?Q?WhbLS9OGoCR9HFS+LgXblmberMpKemPvAWcRPAmZ19RaKzm0lxYlzVofJ47V?=
 =?us-ascii?Q?mL1M0SSv5tJAGvHEHaEXhhe989IYH2wODGYfOYsCssIep1LX65l9vBs+loxu?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f46638a-b5ed-4dff-1953-08db6653ffb9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 06:05:16.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQjGPlDndphwcJV/VWiUUYERYIUO7z8U7sriGrXvMhu7C9BamUnRDbAsXMDurVaBbpM7Mjg2O1CZuHLkk6IP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
X-OriginatorOrg: intel.com

--/iPzH0e0Z6Fhq5gi
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "kernel_BUG_at_mm/vmalloc.c" on:

commit: b99e562f2ff2ff567b283d6502986246ab698544 ("x86: prepare to allocate exectuatble memory as ROX")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git jitalloc/v0.1

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | c59913959d | b99e562f2f |
+------------------------------------------+------------+------------+
| boot_successes                           | 11         | 0          |
| boot_failures                            | 0          | 12         |
| kernel_BUG_at_mm/vmalloc.c               | 0          | 12         |
| invalid_opcode:#[##]                     | 0          | 12         |
| RIP:vmalloc_to_page                      | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
+------------------------------------------+------------+------------+


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306061203.7bd05cf5-oliver.sang@intel.com


[   36.922440][    T1] ------------[ cut here ]------------
[   36.923077][    T1] kernel BUG at mm/vmalloc.c:673!
[   36.923567][    T1] invalid opcode: 0000 [#1] PREEMPT KASAN
[   36.924039][    T1] CPU: 0 PID: 1 Comm: systemd Not tainted 6.4.0-rc3-00009-gb99e562f2ff2 #1
[ 36.924728][ T1] RIP: 0010:vmalloc_to_page (mm/vmalloc.c:673 (discriminator 1)) 
[ 36.925171][ T1] Code: c7 28 18 32 84 e8 8f a2 03 00 48 89 dd 48 89 df 48 c1 ed 24 81 e5 f8 0f 00 00 48 03 2d 83 39 f8 02 e8 bb b8 ff ff 85 c0 75 02 <0f> 0b 48 89 ea b8 ff ff 37 00 48 c1 ea 03 48 c1 e0 2a 80 3c 02 00
All code
========
   0:	c7                   	(bad)  
   1:	28 18                	sub    %bl,(%rax)
   3:	32 84 e8 8f a2 03 00 	xor    0x3a28f(%rax,%rbp,8),%al
   a:	48 89 dd             	mov    %rbx,%rbp
   d:	48 89 df             	mov    %rbx,%rdi
  10:	48 c1 ed 24          	shr    $0x24,%rbp
  14:	81 e5 f8 0f 00 00    	and    $0xff8,%ebp
  1a:	48 03 2d 83 39 f8 02 	add    0x2f83983(%rip),%rbp        # 0x2f839a4
  21:	e8 bb b8 ff ff       	callq  0xffffffffffffb8e1
  26:	85 c0                	test   %eax,%eax
  28:	75 02                	jne    0x2c
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	48 89 ea             	mov    %rbp,%rdx
  2f:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  34:	48 c1 ea 03          	shr    $0x3,%rdx
  38:	48 c1 e0 2a          	shl    $0x2a,%rax
  3c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	48 89 ea             	mov    %rbp,%rdx
   5:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
   a:	48 c1 ea 03          	shr    $0x3,%rdx
   e:	48 c1 e0 2a          	shl    $0x2a,%rax
  12:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
[   36.926713][    T1] RSP: 0000:ffffc9000001f788 EFLAGS: 00210246
[   36.927207][    T1] RAX: 0000000000000000 RBX: ffff88814d07b000 RCX: 1ffffffff097c4d8
[   36.927847][    T1] RDX: ffff8881ad07b000 RSI: ffff88814d07b000 RDI: ffffbf814d07b000
[   36.928504][    T1] RBP: ffffffff83c4f888 R08: fffffbfff0b50b0d R09: ffffffff85a85867
[   36.929157][    T1] R10: ffffc9000001f870 R11: ffffffff811548c0 R12: 0000000000000140
[   36.929799][    T1] R13: ffff88814d07b000 R14: 0000000000000140 R15: 0000000000000000
[   36.930401][    T1] FS:  0000000000000000(0000) GS:ffffffff83c70000(0063) knlGS:00000000f72ba840
[   36.931062][    T1] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   36.931589][    T1] CR2: 00000000f7df7fc0 CR3: 000000014a5a0000 CR4: 00000000000406b0
[   36.932228][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   36.932883][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   36.933552][    T1] Call Trace:
[   36.933836][    T1]  <TASK>
[ 36.934088][ T1] __text_poke (arch/x86/kernel/alternative.c:1572) 
[ 36.934458][ T1] ? __text_poke (arch/x86/kernel/alternative.c:1547) 
[ 36.934848][ T1] ? text_poke_loc_init (arch/x86/kernel/alternative.c:1556) 
[ 36.935287][ T1] text_poke_set (arch/x86/kernel/alternative.c:1769) 
[ 36.935660][ T1] ? text_poke_copy (arch/x86/kernel/alternative.c:1754) 
[ 36.936051][ T1] ? trace_kmalloc (include/trace/events/kmem.h:54 (discriminator 23)) 
[ 36.936446][ T1] ? __kmalloc_node (mm/slab_common.c:968 mm/slab_common.c:973) 
[ 36.936850][ T1] bpf_jit_binary_pack_alloc (kernel/bpf/core.c:1097) 
[ 36.937319][ T1] ? cmp_ips (arch/x86/net/bpf_jit_comp.c:227) 
[ 36.937672][ T1] ? bpf_prog_pack_free (kernel/bpf/core.c:1069) 
[ 36.938105][ T1] ? __cant_sleep (kernel/sched/core.c:10108) 
[ 36.938502][ T1] bpf_int_jit_compile (arch/x86/net/bpf_jit_comp.c:2569) 
[ 36.938938][ T1] ? bpf_arch_text_copy (arch/x86/net/bpf_jit_comp.c:2453) 
[ 36.939360][ T1] bpf_prog_select_runtime (kernel/bpf/core.c:2205) 
[ 36.939811][ T1] ? __kmalloc_node_track_caller (mm/slab_common.c:968 mm/slab_common.c:986) 
[ 36.940303][ T1] bpf_prepare_filter (net/core/filter.c:1299 net/core/filter.c:1346) 
[ 36.940732][ T1] ? bpf_convert_filter (net/core/filter.c:1314) 
[ 36.941193][ T1] ? bpf_prog_store_orig_filter (net/core/filter.c:1146) 
[ 36.941708][ T1] sk_attach_filter (net/core/filter.c:1533) 
[ 36.942109][ T1] sk_setsockopt (net/core/sock.c:1297) 
[ 36.942514][ T1] ? sock_set_timestamping (net/core/sock.c:1089) 
[ 36.942966][ T1] ? __lock_acquire (kernel/locking/lockdep.c:5074) 
[ 36.943385][ T1] ? __might_fault (mm/memory.c:5731) 
[ 36.943783][ T1] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5693) 
[ 36.944184][ T1] ? __fget_light (fs/file.c:1017) 
[ 36.944576][ T1] ? fdget (include/linux/file.h:64) 
[ 36.944901][ T1] ? sockfd_lookup_light (net/socket.c:551) 
[ 36.945346][ T1] __sys_setsockopt (net/socket.c:2269) 
[ 36.945756][ T1] ? __x64_sys_recv (net/socket.c:2238) 
[ 36.946133][ T1] __do_compat_sys_socketcall (net/compat.c:492) 
[ 36.946583][ T1] ? __ia32_compat_sys_recvmmsg_time32 (net/compat.c:424) 
[ 36.947092][ T1] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:4333) 
[ 36.947575][ T1] do_int80_syscall_32 (arch/x86/entry/common.c:112 arch/x86/entry/common.c:132) 
[ 36.947981][ T1] entry_INT80_compat (arch/x86/entry/entry_64_compat.S:354) 
[   36.948381][    T1] RIP: 0023:0xf7f58092
[ 36.948720][ T1] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)  
   6:	ff                   	(bad)  
   7:	ff                   	(bad)  
   8:	ff a3 24 00 00 00    	jmpq   *0x24(%rbx)
   e:	68 30 00 00 00       	pushq  $0x30
  13:	e9 80 ff ff ff       	jmpq   0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmpq   *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	retq   		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	retq   
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	retq   
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	retq   
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc3-00009-gb99e562f2ff2 .config
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--/iPzH0e0Z6Fhq5gi
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc3-00009-gb99e562f2ff2"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.4.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-12 (Debian 12.2.0-14) 12.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24000
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
# CONFIG_UAPI_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_DEFAULT_ON=y
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_FORCE=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_INITRAMFS_PRESERVE_MTIME=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
# CONFIG_UID16 is not set
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_PCSPKR_PLATFORM=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
# CONFIG_X86_MPPARSE is not set
CONFIG_GOLDFISH=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
CONFIG_IOSF_MBI_DEBUG=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_PROCESSOR_SELECT=y
# CONFIG_CPU_SUP_INTEL is not set
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
# CONFIG_DMI is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
CONFIG_UP_LATE_INIT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
# end of Performance monitoring

CONFIG_X86_VSYSCALL_EMULATION=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
# CONFIG_X86_5LEVEL is not set
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
# CONFIG_X86_UMIP is not set
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
# CONFIG_ADDRESS_MASKING is not set
CONFIG_COMPAT_VDSO=y
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
# CONFIG_MODIFY_LDT_SYSCALL is not set
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
# CONFIG_LIVEPATCH is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=59
CONFIG_FUNCTION_PADDING_BYTES=64
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_TABLE_LIB=y
# CONFIG_ACPI_DEBUGGER is not set
# CONFIG_ACPI_SPCR_TABLE is not set
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
CONFIG_ACPI_EC_DEBUGFS=y
# CONFIG_ACPI_AC is not set
# CONFIG_ACPI_BATTERY is not set
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
# CONFIG_ACPI_THERMAL is not set
CONFIG_ACPI_PLATFORM_PROFILE=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
CONFIG_ACPI_HED=m
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_ACPI_PFRUT=m
# CONFIG_ACPI_PCC is not set
CONFIG_ACPI_FFH=y
CONFIG_PMIC_OPREGION=y
# CONFIG_XPOWER_PMIC_OPREGION is not set
# CONFIG_BXT_WC_PMIC_OPREGION is not set
CONFIG_CHT_DC_TI_PMIC_OPREGION=y
CONFIG_ACPI_VIOT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_PCI_CNB20LE_QUIRK=y
# CONFIG_ISA_BUS is not set
# CONFIG_ISA_DMA_API is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
CONFIG_X86_X32_ABI=y
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT_64B=y
CONFIG_FUNCTION_ALIGNMENT=64
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
CONFIG_MODULE_DEBUG=y
# CONFIG_MODULE_STATS is not set
CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS=y
# CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE is not set
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_VMAP_PFN=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_DMAPOOL_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_SECRETMEM is not set
# CONFIG_USERFAULTFD is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
# CONFIG_LRU_GEN_STATS is not set
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_JIT_ALLOC=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=y
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_ILA is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
# CONFIG_BRIDGE_NETFILTER is not set

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
# CONFIG_NETFILTER_NETLINK_ACCT is not set
# CONFIG_NETFILTER_NETLINK_QUEUE is not set
# CONFIG_NETFILTER_NETLINK_LOG is not set
# CONFIG_NETFILTER_NETLINK_OSF is not set
# CONFIG_NF_CONNTRACK is not set
# CONFIG_NF_LOG_SYSLOG is not set
# CONFIG_NF_TABLES is not set
# CONFIG_NETFILTER_XTABLES is not set
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
# CONFIG_NF_SOCKET_IPV4 is not set
# CONFIG_NF_TPROXY_IPV4 is not set
# CONFIG_NF_DUP_IPV4 is not set
# CONFIG_NF_LOG_ARP is not set
# CONFIG_NF_LOG_IPV4 is not set
# CONFIG_NF_REJECT_IPV4 is not set
# CONFIG_IP_NF_IPTABLES is not set
# CONFIG_IP_NF_ARPTABLES is not set
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
# CONFIG_NF_SOCKET_IPV6 is not set
# CONFIG_NF_TPROXY_IPV6 is not set
# CONFIG_NF_DUP_IPV6 is not set
# CONFIG_NF_REJECT_IPV6 is not set
# CONFIG_NF_LOG_IPV6 is not set
# CONFIG_IP6_NF_IPTABLES is not set
# end of IPv6: Netfilter Configuration

# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_LLC=y
CONFIG_LLC2=m
CONFIG_ATALK=m
# CONFIG_DEV_APPLETALK is not set
CONFIG_X25=m
CONFIG_LAPB=y
CONFIG_PHONET=y
# CONFIG_6LOWPAN is not set
CONFIG_IEEE802154=m
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
# CONFIG_IEEE802154_SOCKET is not set
# CONFIG_MAC802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
# CONFIG_BATMAN_ADV_BATMAN_V is not set
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_MCAST=y
# CONFIG_BATMAN_ADV_DEBUG is not set
CONFIG_BATMAN_ADV_TRACING=y
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
CONFIG_NETLINK_DIAG=y
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
# CONFIG_MPLS_ROUTING is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
CONFIG_QRTR=m
CONFIG_QRTR_SMD=m
CONFIG_QRTR_TUN=m
# CONFIG_QRTR_MHI is not set
# CONFIG_NET_NCSI is not set
CONFIG_MAX_SKB_FRAGS=17
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=m
CONFIG_AX25_DAMA_SLAVE=y
# CONFIG_NETROM is not set
# CONFIG_ROSE is not set

#
# AX.25 network device drivers
#
# CONFIG_MKISS is not set
# CONFIG_6PACK is not set
CONFIG_BPQETHER=m
CONFIG_BAYCOM_SER_FDX=m
CONFIG_BAYCOM_SER_HDX=m
# CONFIG_BAYCOM_PAR is not set
CONFIG_YAM=m
# end of AX.25 network device drivers

CONFIG_CAN=y
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=y
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=y
CONFIG_CAN_ISOTP=y
CONFIG_BT=y
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=y
CONFIG_BT_RFCOMM_TTY=y
# CONFIG_BT_BNEP is not set
# CONFIG_BT_CMTP is not set
CONFIG_BT_HIDP=y
# CONFIG_BT_HS is not set
CONFIG_BT_LE=y
CONFIG_BT_LE_L2CAP_ECRED=y
CONFIG_BT_LEDS=y
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_AOSPEXT is not set
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_FEATURE_DEBUG=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=y
CONFIG_BT_BCM=y
CONFIG_BT_RTL=y
CONFIG_BT_MTK=y
CONFIG_BT_HCIBTUSB=y
# CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
CONFIG_BT_HCIBTUSB_POLL_SYNC=y
CONFIG_BT_HCIBTUSB_BCM=y
CONFIG_BT_HCIBTUSB_MTK=y
CONFIG_BT_HCIBTUSB_RTL=y
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_SERDEV=y
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_NOKIA=m
# CONFIG_BT_HCIUART_BCSP is not set
CONFIG_BT_HCIUART_ATH3K=y
CONFIG_BT_HCIUART_LL=y
CONFIG_BT_HCIUART_3WIRE=y
CONFIG_BT_HCIUART_INTEL=y
CONFIG_BT_HCIUART_RTL=y
# CONFIG_BT_HCIUART_QCA is not set
CONFIG_BT_HCIUART_AG6XX=y
CONFIG_BT_HCIUART_MRVL=y
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBCM4377 is not set
CONFIG_BT_HCIBPA10X=y
CONFIG_BT_HCIBFUSB=y
CONFIG_BT_HCIVHCI=m
# CONFIG_BT_MRVL is not set
# CONFIG_BT_ATH3K is not set
CONFIG_BT_MTKSDIO=y
# CONFIG_BT_MTKUART is not set
# CONFIG_BT_VIRTIO is not set
CONFIG_BT_NXPUART=m
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_PRIV=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=y
CONFIG_NET_9P=y
# CONFIG_NET_9P_FD is not set
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
CONFIG_EISA_PCI_EISA=y
# CONFIG_EISA_VIRTUAL_ROOT is not set
# CONFIG_EISA_NAMES is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
# CONFIG_PCIEASPM is not set
CONFIG_PCIE_PTM=y
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=m
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_PCIE_BUS_TUNE_OFF=y
# CONFIG_PCIE_BUS_DEFAULT is not set
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=m
CONFIG_CXL_PCI=m
CONFIG_CXL_MEM_RAW_COMMANDS=y
CONFIG_CXL_ACPI=m
# CONFIG_CXL_MEM is not set
CONFIG_CXL_PORT=m
# CONFIG_CXL_REGION is not set
CONFIG_PCCARD=m
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
# CONFIG_YENTA_RICOH is not set
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
# CONFIG_YENTA_TOSHIBA is not set
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DMA_ENGINE is not set
# CONFIG_RAPIDIO_DEBUG is not set
# CONFIG_RAPIDIO_ENUM_BASIC is not set
CONFIG_RAPIDIO_CHMAN=m
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=m
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=m
CONFIG_REGMAP_SOUNDWIRE_MBQ=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=m
CONFIG_MHI_BUS_EP=y
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_FW_CFG_SYSFS=m
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_FW_CS_DSP=m
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
# CONFIG_GNSS_UBX_SERIAL is not set
# CONFIG_GNSS_USB is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=m
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
# CONFIG_MTD_OOPS is not set
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_OTP is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=m
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=m
CONFIG_MTD_ESB2ROM=m
# CONFIG_MTD_CK804XROM is not set
# CONFIG_MTD_SCB2_FLASH is not set
CONFIG_MTD_NETtel=m
CONFIG_MTD_L440GX=m
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=m
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_ONENAND=m
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=m
CONFIG_MTD_ONENAND_OTP=y
CONFIG_MTD_ONENAND_2X_PROGRAM=y
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
CONFIG_IBM_ASM=m
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HP_ILO=m
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
CONFIG_INTEL_MEI_TXE=m
CONFIG_INTEL_MEI_GSC=m
CONFIG_INTEL_MEI_HDCP=m
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_VMWARE_VMCI is not set
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=m
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
CONFIG_MISC_RTSX_USB=y
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
# CONFIG_FIREWIRE_NET is not set
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
CONFIG_EQUALIZER=m
CONFIG_NET_TEAM=m
CONFIG_NET_TEAM_MODE_BROADCAST=m
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
# CONFIG_MACVTAP is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
CONFIG_RIONET=m
CONFIG_RIONET_TX_SIZE=128
CONFIG_RIONET_RX_SIZE=128
# CONFIG_TUN is not set
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
# CONFIG_MHI_NET is not set
CONFIG_SUNGEM_PHY=m
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=m
# CONFIG_ARCNET_1051 is not set
# CONFIG_ARCNET_RAW is not set
# CONFIG_ARCNET_CAP is not set
CONFIG_ARCNET_COM90xx=m
CONFIG_ARCNET_COM90xxIO=m
CONFIG_ARCNET_RIM_I=y
CONFIG_ARCNET_COM20020=m
CONFIG_ARCNET_COM20020_PCI=m
CONFIG_ETHERNET=y
CONFIG_MDIO=m
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
CONFIG_VORTEX=y
CONFIG_TYPHOON=m
CONFIG_NET_VENDOR_ADAPTEC=y
CONFIG_ADAPTEC_STARFIRE=y
# CONFIG_NET_VENDOR_AGERE is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_NET_VENDOR_ATHEROS is not set
CONFIG_CX_ECAT=m
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=y
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
CONFIG_BCMGENET=y
CONFIG_BNX2=y
CONFIG_CNIC=y
CONFIG_TIGON3=y
# CONFIG_TIGON3_HWMON is not set
CONFIG_BNX2X=m
# CONFIG_BNX2X_SRIOV is not set
CONFIG_SYSTEMPORT=m
CONFIG_BNXT=m
# CONFIG_BNXT_SRIOV is not set
# CONFIG_BNXT_FLOWER_OFFLOAD is not set
# CONFIG_BNXT_HWMON is not set
# CONFIG_NET_VENDOR_CADENCE is not set
# CONFIG_NET_VENDOR_CAVIUM is not set
CONFIG_NET_VENDOR_CHELSIO=y
CONFIG_CHELSIO_T1=m
# CONFIG_CHELSIO_T1_1G is not set
# CONFIG_CHELSIO_T3 is not set
CONFIG_CHELSIO_T4=m
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_INLINE_CRYPTO=y
CONFIG_NET_VENDOR_CIRRUS=y
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=m
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_NET_VENDOR_DAVICOM is not set
CONFIG_DNET=m
# CONFIG_NET_VENDOR_DEC is not set
CONFIG_NET_VENDOR_DLINK=y
CONFIG_DL2K=m
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
CONFIG_BE2NET_HWMON=y
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
# CONFIG_BE2NET_LANCER is not set
# CONFIG_BE2NET_SKYHAWK is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=m
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
CONFIG_IXGBE=m
# CONFIG_IXGBE_HWMON is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
CONFIG_SKGE=y
CONFIG_SKGE_DEBUG=y
# CONFIG_SKGE_GENESIS is not set
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
CONFIG_MLX5_CORE=m
CONFIG_MLX5_FPGA=y
# CONFIG_MLX5_CORE_EN is not set
CONFIG_MLXSW_CORE=m
# CONFIG_MLXSW_CORE_HWMON is not set
CONFIG_MLXSW_CORE_THERMAL=y
CONFIG_MLXSW_PCI=m
CONFIG_MLXSW_I2C=m
CONFIG_MLXSW_MINIMAL=m
CONFIG_MLXFW=m
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_NET_VENDOR_MICROSOFT is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
CONFIG_FEALNX=y
CONFIG_NET_VENDOR_NI=y
CONFIG_NI_XGE_MANAGEMENT_ENET=y
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=y
CONFIG_S2IO=y
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_NVIDIA=y
CONFIG_FORCEDETH=m
# CONFIG_NET_VENDOR_OKI is not set
CONFIG_ETHOC=y
# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
# CONFIG_NET_VENDOR_PENSANDO is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
CONFIG_NETXEN_NIC=m
# CONFIG_QED is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_RDC is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_NET_VENDOR_RENESAS is not set
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SILAN=y
CONFIG_SC92031=y
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_EPIC100=m
CONFIG_SMSC911X=m
CONFIG_SMSC9420=y
# CONFIG_NET_VENDOR_SOCIONEXT is not set
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=y
# CONFIG_STMMAC_SELFTESTS is not set
CONFIG_STMMAC_PLATFORM=m
CONFIG_DWMAC_GENERIC=m
CONFIG_DWMAC_INTEL=m
CONFIG_DWMAC_LOONGSON=m
# CONFIG_STMMAC_PCI is not set
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=m
CONFIG_SUNGEM=m
CONFIG_CASSINI=m
CONFIG_NIU=y
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=m
CONFIG_DWC_XLGMAC_PCI=m
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=m
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
CONFIG_VIA_RHINE=m
CONFIG_VIA_RHINE_MMIO=y
# CONFIG_VIA_VELOCITY is not set
# CONFIG_NET_VENDOR_WANGXUN is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=y
CONFIG_XILINX_EMACLITE=y
CONFIG_XILINX_AXI_EMAC=y
CONFIG_XILINX_LL_TEMAC=y
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_NET_SB1000=m
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_SFP=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=y
# CONFIG_ADIN1100_PHY is not set
CONFIG_AQUANTIA_PHY=m
CONFIG_AX88796B_PHY=y
CONFIG_BROADCOM_PHY=y
CONFIG_BCM54140_PHY=m
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_CICADA_PHY=y
CONFIG_CORTINA_PHY=m
CONFIG_DAVICOM_PHY=m
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=y
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88X2222_PHY=m
CONFIG_MAXLINEAR_GPHY=y
CONFIG_MEDIATEK_GE_PHY=y
CONFIG_MICREL_PHY=m
# CONFIG_MICROCHIP_T1S_PHY is not set
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=m
CONFIG_MOTORCOMM_PHY=m
# CONFIG_NATIONAL_PHY is not set
CONFIG_NXP_CBTX_PHY=m
CONFIG_NXP_C45_TJA11XX_PHY=m
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_NCN26000_PHY=y
# CONFIG_AT803X_PHY is not set
# CONFIG_QSEMI_PHY is not set
# CONFIG_REALTEK_PHY is not set
CONFIG_RENESAS_PHY=y
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=y
CONFIG_TERANETICS_PHY=m
CONFIG_DP83822_PHY=y
CONFIG_DP83TC811_PHY=m
CONFIG_DP83848_PHY=y
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=m
CONFIG_DP83TD510_PHY=y
CONFIG_VITESSE_PHY=y
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_VCAN=m
CONFIG_CAN_VXCAN=m
CONFIG_CAN_NETLINK=y
# CONFIG_CAN_CALC_BITTIMING is not set
CONFIG_CAN_RX_OFFLOAD=y
CONFIG_CAN_CAN327=m
CONFIG_CAN_KVASER_PCIEFD=m
CONFIG_CAN_SLCAN=m
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
CONFIG_CAN_CC770_ISA=m
CONFIG_CAN_CC770_PLATFORM=m
CONFIG_CAN_CTUCANFD=m
CONFIG_CAN_CTUCANFD_PCI=m
# CONFIG_CAN_IFI_CANFD is not set
CONFIG_CAN_M_CAN=m
CONFIG_CAN_M_CAN_PCI=m
# CONFIG_CAN_M_CAN_PLATFORM is not set
CONFIG_CAN_PEAK_PCIEFD=m
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
# CONFIG_CAN_KVASER_PCI is not set
# CONFIG_CAN_PEAK_PCI is not set
CONFIG_CAN_PLX_PCI=m
CONFIG_CAN_SJA1000_ISA=m
# CONFIG_CAN_SJA1000_PLATFORM is not set
CONFIG_CAN_SOFTING=m

#
# CAN USB interfaces
#
CONFIG_CAN_8DEV_USB=m
CONFIG_CAN_EMS_USB=m
CONFIG_CAN_ESD_USB=m
CONFIG_CAN_ETAS_ES58X=m
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_CAVIUM=y
CONFIG_MDIO_I2C=y
CONFIG_MDIO_MVUSB=y
# CONFIG_MDIO_MSCC_MIIM is not set
CONFIG_MDIO_THUNDER=y

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
CONFIG_PCS_XPCS=y
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
CONFIG_SLIP=y
CONFIG_SLHC=y
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
CONFIG_SLIP_MODE_SLIP6=y
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_CATC=m
CONFIG_USB_KAWETH=m
CONFIG_USB_PEGASUS=m
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=m
CONFIG_USB_LAN78XX=m
# CONFIG_USB_USBNET is not set
CONFIG_USB_HSO=m
CONFIG_USB_IPHETH=m
# CONFIG_WLAN is not set
# CONFIG_WAN is not set
# CONFIG_IEEE802154_DRIVERS is not set

#
# Wireless WAN
#
CONFIG_WWAN=y
# CONFIG_WWAN_DEBUGFS is not set
CONFIG_WWAN_HWSIM=y
CONFIG_MHI_WWAN_CTRL=m
# CONFIG_MHI_WWAN_MBIM is not set
CONFIG_RPMSG_WWAN_CTRL=m
CONFIG_IOSM=y
# CONFIG_MTK_T7XX is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_MISDN=y
CONFIG_MISDN_DSP=m
CONFIG_MISDN_L1OIP=y

#
# mISDN hardware drivers
#
# CONFIG_MISDN_HFCPCI is not set
CONFIG_MISDN_HFCMULTI=y
CONFIG_MISDN_HFCUSB=m
# CONFIG_MISDN_AVMFRITZ is not set
# CONFIG_MISDN_SPEEDFAX is not set
# CONFIG_MISDN_INFINEON is not set
CONFIG_MISDN_W6692=m
# CONFIG_MISDN_NETJET is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5520 is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=m
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
# CONFIG_JOYSTICK_GF2K is not set
CONFIG_JOYSTICK_GRIP=m
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_USB=y
# CONFIG_JOYSTICK_IFORCE_232 is not set
CONFIG_JOYSTICK_WARRIOR=m
# CONFIG_JOYSTICK_MAGELLAN is not set
CONFIG_JOYSTICK_SPACEORB=m
CONFIG_JOYSTICK_SPACEBALL=m
CONFIG_JOYSTICK_STINGER=m
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
# CONFIG_JOYSTICK_DB9 is not set
# CONFIG_JOYSTICK_GAMECON is not set
# CONFIG_JOYSTICK_TURBOGRAFX is not set
# CONFIG_JOYSTICK_AS5011 is not set
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=m
# CONFIG_JOYSTICK_XPAD_FF is not set
CONFIG_JOYSTICK_XPAD_LEDS=y
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=m
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=y
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
CONFIG_TABLET_USB_HANWANG=m
# CONFIG_TABLET_USB_KBTAB is not set
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=m
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_88PM860X is not set
CONFIG_TOUCHSCREEN_AD7879=y
# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=m
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
CONFIG_TOUCHSCREEN_CY8CTMG110=y
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP5=y
# CONFIG_TOUCHSCREEN_DA9034 is not set
CONFIG_TOUCHSCREEN_DYNAPRO=y
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
# CONFIG_TOUCHSCREEN_EETI is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=m
CONFIG_TOUCHSCREEN_FUJITSU=m
# CONFIG_TOUCHSCREEN_GOODIX is not set
CONFIG_TOUCHSCREEN_HIDEEP=y
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=m
# CONFIG_TOUCHSCREEN_ILI210X is not set
CONFIG_TOUCHSCREEN_ILITEK=m
# CONFIG_TOUCHSCREEN_S6SY761 is not set
CONFIG_TOUCHSCREEN_GUNZE=m
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=y
CONFIG_TOUCHSCREEN_ELO=y
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=m
CONFIG_TOUCHSCREEN_MMS114=m
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MSG2638=m
CONFIG_TOUCHSCREEN_MTOUCH=m
CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS=y
CONFIG_TOUCHSCREEN_IMAGIS=m
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=m
CONFIG_TOUCHSCREEN_PENMOUNT=y
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=m
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_WM831X=y
CONFIG_TOUCHSCREEN_WM97XX=m
# CONFIG_TOUCHSCREEN_WM9705 is not set
CONFIG_TOUCHSCREEN_WM9712=y
CONFIG_TOUCHSCREEN_WM9713=y
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
# CONFIG_TOUCHSCREEN_USB_PANJIT is not set
# CONFIG_TOUCHSCREEN_USB_3M is not set
# CONFIG_TOUCHSCREEN_USB_ITM is not set
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
# CONFIG_TOUCHSCREEN_USB_GUNZE is not set
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
# CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
# CONFIG_TOUCHSCREEN_USB_GOTOP is not set
# CONFIG_TOUCHSCREEN_USB_JASTEC is not set
# CONFIG_TOUCHSCREEN_USB_ELO is not set
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
# CONFIG_TOUCHSCREEN_USB_NEXIO is not set
# CONFIG_TOUCHSCREEN_USB_EASYTOUCH is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
CONFIG_TOUCHSCREEN_SX8654=y
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=m
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
CONFIG_TOUCHSCREEN_ZINITIX=m
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=y
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM860X_ONKEY=y
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
# CONFIG_INPUT_ARIZONA_HAPTICS is not set
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_PCSPKR=m
CONFIG_INPUT_MAX8925_ONKEY=y
CONFIG_INPUT_MC13783_PWRBUTTON=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=y
CONFIG_INPUT_GPIO_BEEPER=m
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_GPIO_VIBRA=y
CONFIG_INPUT_ATLAS_BTNS=m
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
CONFIG_INPUT_CM109=m
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
CONFIG_INPUT_AXP20X_PEK=m
CONFIG_INPUT_TWL4030_PWRBUTTON=y
CONFIG_INPUT_TWL4030_VIBRA=m
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=m
CONFIG_INPUT_PCF8574=m
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=m
CONFIG_INPUT_DA9055_ONKEY=m
# CONFIG_INPUT_DA9063_ONKEY is not set
CONFIG_INPUT_WM831X_ON=y
CONFIG_INPUT_ADXL34X=m
CONFIG_INPUT_ADXL34X_I2C=m
CONFIG_INPUT_IBM_PANEL=m
CONFIG_INPUT_IMS_PCU=y
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=m
# CONFIG_INPUT_IQS7222 is not set
CONFIG_INPUT_CMA3000=y
# CONFIG_INPUT_CMA3000_I2C is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
# CONFIG_INPUT_RAVE_SP_PWRBUTTON is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=m
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
# CONFIG_SERIAL_8250_PNP is not set
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
# CONFIG_SERIAL_8250_DMA is not set
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=m
CONFIG_SERIAL_8250_EXAR=m
CONFIG_SERIAL_8250_MEN_MCB=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_LPSS is not set
CONFIG_SERIAL_8250_MID=m
CONFIG_SERIAL_8250_PERICOM=m

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_ALTERA_JTAGUART=m
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=m
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=y
CONFIG_N_HDLC=m
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_N_GSM is not set
CONFIG_NOZOMI=m
CONFIG_NULL_TTY=m
CONFIG_HVC_DRIVER=y
CONFIG_RPMSG_TTY=m
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_TTY_PRINTK is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_SSIF_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_INTEL is not set
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_APPLICOM=m
# CONFIG_MWAVE is not set
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=m
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_ALI1535 is not set
CONFIG_I2C_ALI1563=m
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_ISMT=y
CONFIG_I2C_PIIX4=m
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=y
# CONFIG_I2C_SIS5595 is not set
CONFIG_I2C_SIS630=m
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_CP2615=m
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_PCI1XXXX=m
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_CROS_EC_TUNNEL=m
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=m
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=m
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_CY8C95X0=m
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_CHERRYVIEW=m
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=y
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=m
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=m
CONFIG_PINCTRL_ICELAKE=y
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
CONFIG_PINCTRL_LEWISBURG=m
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_EXAR=m
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_ICH=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_SIOX=y
CONFIG_GPIO_TANGIER=y
CONFIG_GPIO_VX855=m
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH=m
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=m
# CONFIG_GPIO_DA9055 is not set
CONFIG_GPIO_DLN2=m
CONFIG_GPIO_ELKHARTLAKE=y
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TWL4030=m
CONFIG_GPIO_WHISKEY_COVE=m
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=m
CONFIG_GPIO_ML_IOH=m
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_PCIE_IDIO_24=y
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_LATCH=y
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=m
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=m
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_IP5XXX_POWER=m
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=m
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=m
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
# CONFIG_BATTERY_DA9030 is not set
# CONFIG_BATTERY_DA9150 is not set
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=m
# CONFIG_CHARGER_88PM860X is not set
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MT6360=y
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=m
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=y
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_RT9467=m
# CONFIG_CHARGER_RT9471 is not set
CONFIG_CHARGER_BD99954=m
# CONFIG_CHARGER_WILCO is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=y
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_CORSAIR_CPRO=y
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
# CONFIG_I8K is not set
CONFIG_SENSORS_DA9055=m
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=m
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=y
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_I5500=y
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
CONFIG_SENSORS_LTC2992=y
CONFIG_SENSORS_LTC4151=m
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
CONFIG_SENSORS_MAX6620=m
# CONFIG_SENSORS_MAX6621 is not set
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MC34VR500=y
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=m
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
CONFIG_SENSORS_NZXT_SMART2=y
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_OXP=m
CONFIG_SENSORS_PCF8591=m
# CONFIG_SENSORS_PECI_CPUTEMP is not set
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
# CONFIG_PMBUS is not set
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_SY7636A=y
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_STTS751=m
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA238=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=m
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_XGENE=y

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_SENSORS_ASUS_WMI=m
CONFIG_SENSORS_ASUS_EC=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_DEVFREQ_THERMAL is not set
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_BXT_PMIC_THERMAL=y
# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
# CONFIG_DA9055_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=m
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_MENF21BMC_WATCHDOG=m
CONFIG_MENZ069_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=m
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_RAVE_SP_WATCHDOG=m
CONFIG_CADENCE_WATCHDOG=m
CONFIG_DW_WATCHDOG=y
# CONFIG_TWL4030_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
# CONFIG_ALIM1535_WDT is not set
CONFIG_ALIM7101_WDT=m
CONFIG_EBC_C384_WDT=y
# CONFIG_EXAR_WDT is not set
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_IBMASR is not set
CONFIG_WAFER_WDT=m
CONFIG_I6300ESB_WDT=m
CONFIG_IE6XX_WDT=y
CONFIG_ITCO_WDT=y
# CONFIG_ITCO_VENDOR_SUPPORT is not set
# CONFIG_IT8712F_WDT is not set
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
# CONFIG_KEMPLD_WDT is not set
CONFIG_SC1200_WDT=y
CONFIG_PC87413_WDT=y
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
CONFIG_CPU5_WDT=m
# CONFIG_SMSC_SCH311X_WDT is not set
CONFIG_SMSC37B787_WDT=y
CONFIG_TQMX86_WDT=y
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=y
# CONFIG_W83877F_WDT is not set
CONFIG_W83977F_WDT=y
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=y
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
CONFIG_NIC7018_WDT=m
CONFIG_SIEMENS_SIMATIC_IPC_WDT=m
CONFIG_MEN_A21_WDT=m

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=m
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_CROS_EC_DEV is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_CS47L15 is not set
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_PMIC_DA903X=y
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=m
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=m
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_INTEL_SOC_PMIC_BXTWC=y
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
CONFIG_INTEL_SOC_PMIC_CHTDC_TI=y
# CONFIG_INTEL_SOC_PMIC_MRFLD is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=m
CONFIG_MFD_INTEL_PMC_BXT=y
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=m
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
CONFIG_MFD_SY7636A=y
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_PALMAS=m
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=m
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=m
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_RAVE_SP_CORE=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM8607=m
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
CONFIG_REGULATOR_ARIZONA_MICSUPP=m
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_DA903X=m
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=m
# CONFIG_REGULATOR_LP8788 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=m
CONFIG_REGULATOR_MAX14577=m
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=m
# CONFIG_REGULATOR_MAX8925 is not set
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX20411=m
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_MT6315=m
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=m
# CONFIG_REGULATOR_MT6332 is not set
# CONFIG_REGULATOR_MT6357 is not set
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
# CONFIG_REGULATOR_MT6360 is not set
CONFIG_REGULATOR_MT6370=y
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PALMAS=m
# CONFIG_REGULATOR_PCA9450 is not set
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RC5T583=y
# CONFIG_REGULATOR_RT4801 is not set
# CONFIG_REGULATOR_RT4803 is not set
# CONFIG_REGULATOR_RT4831 is not set
CONFIG_REGULATOR_RT5033=m
CONFIG_REGULATOR_RT5190A=m
# CONFIG_REGULATOR_RT5739 is not set
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6190=y
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=y
# CONFIG_REGULATOR_RTQ6752 is not set
CONFIG_REGULATOR_SKY81452=m
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_SY7636A=m
# CONFIG_REGULATOR_TPS51632 is not set
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=m
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_WM831X=m
CONFIG_REGULATOR_WM8400=m
CONFIG_REGULATOR_WM8994=m
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=m
# CONFIG_LIRC is not set
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
# CONFIG_IR_MCE_KBD_DECODER is not set
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=m
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=m
CONFIG_IR_IMON=m
CONFIG_IR_IMON_RAW=m
CONFIG_IR_ITE_CIR=m
CONFIG_IR_MCEUSB=m
# CONFIG_IR_NUVOTON is not set
CONFIG_IR_REDRAT3=m
# CONFIG_IR_SERIAL is not set
CONFIG_IR_STREAMZAP=m
CONFIG_IR_TOY=m
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=y
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM=y
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=y
CONFIG_DRM_BUDDY=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=y
CONFIG_DRM_I915_FORCE_PROBE=""
# CONFIG_DRM_I915_CAPTURE_ERROR is not set
# CONFIG_DRM_I915_USERPTR is not set

#
# drm/i915 Debugging
#
CONFIG_DRM_I915_WERROR=y
# CONFIG_DRM_I915_DEBUG is not set
CONFIG_DRM_I915_DEBUG_MMIO=y
CONFIG_DRM_I915_DEBUG_GEM=y
CONFIG_DRM_I915_DEBUG_GEM_ONCE=y
CONFIG_DRM_I915_ERRLOG_GEM=y
CONFIG_DRM_I915_TRACE_GEM=y
# CONFIG_DRM_I915_TRACE_GTT is not set
CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=y
CONFIG_DRM_I915_SW_FENCE_CHECK_DAG=y
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=y
CONFIG_DRM_I915_DEBUG_RUNTIME_PM=y
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=m
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=y
CONFIG_DRM_UDL=y
# CONFIG_DRM_AST is not set
CONFIG_DRM_MGAG200=m
# CONFIG_DRM_QXL is not set
CONFIG_DRM_VIRTIO_GPU=y
# CONFIG_DRM_VIRTIO_GPU_KMS is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=m
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_BOCHS=y
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_GM12U320=m
CONFIG_DRM_SIMPLEDRM=m
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
CONFIG_DRM_SSD130X=y
CONFIG_DRM_SSD130X_I2C=y
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=y
# CONFIG_FB_PM2 is not set
CONFIG_FB_CYBER2000=m
# CONFIG_FB_CYBER2000_DDC is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
CONFIG_FB_IMSTT=y
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
# CONFIG_FB_N411 is not set
CONFIG_FB_HGA=m
CONFIG_FB_OPENCORES=m
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=y
# CONFIG_FB_RIVA_I2C is not set
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=y
CONFIG_FB_LE80578=y
CONFIG_FB_CARILLO_RANCH=y
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
CONFIG_FB_ATY=m
# CONFIG_FB_ATY_CT is not set
CONFIG_FB_ATY_GX=y
# CONFIG_FB_ATY_BACKLIGHT is not set
CONFIG_FB_S3=y
CONFIG_FB_S3_DDC=y
CONFIG_FB_SAVAGE=m
CONFIG_FB_SAVAGE_I2C=y
# CONFIG_FB_SAVAGE_ACCEL is not set
# CONFIG_FB_SIS is not set
CONFIG_FB_VIA=y
CONFIG_FB_VIA_DIRECT_PROCFS=y
CONFIG_FB_VIA_X_COMPATIBILITY=y
CONFIG_FB_NEOMAGIC=m
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=m
# CONFIG_FB_VT8623 is not set
CONFIG_FB_TRIDENT=y
CONFIG_FB_ARK=y
# CONFIG_FB_PM3 is not set
CONFIG_FB_CARMINE=y
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
CONFIG_FB_SM501=m
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=m
# CONFIG_FB_METRONOME is not set
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_PLATFORM=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=m
CONFIG_BACKLIGHT_KTZ8866=y
CONFIG_BACKLIGHT_CARILLO_RANCH=m
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_MAX8925=y
CONFIG_BACKLIGHT_MT6370=y
CONFIG_BACKLIGHT_APPLE=y
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=m
CONFIG_BACKLIGHT_SAHARA=m
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP5520=y
CONFIG_BACKLIGHT_ADP8860=m
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_88PM860X=m
CONFIG_BACKLIGHT_LM3639=m
# CONFIG_BACKLIGHT_PANDORA is not set
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=m
# CONFIG_BACKLIGHT_ARCXCNN is not set
CONFIG_BACKLIGHT_RAVE_SP=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_DRM_ACCEL=y
# CONFIG_DRM_ACCEL_HABANALABS is not set
# CONFIG_DRM_ACCEL_QAIC is not set
CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
CONFIG_SND_PCM_OSS=m
# CONFIG_SND_PCM_OSS_PLUGINS is not set
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VERBOSE_PRINTK=y
# CONFIG_SND_CTL_FAST_LOOKUP is not set
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
# CONFIG_SND_PCM_XRUN_DEBUG is not set
CONFIG_SND_CTL_INPUT_VALIDATION=y
# CONFIG_SND_CTL_DEBUG is not set
# CONFIG_SND_JACK_INJECTION_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_CTL_LED=m
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
# CONFIG_SND_ALS300 is not set
CONFIG_SND_ALI5451=m
CONFIG_SND_ASIHPI=m
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
CONFIG_SND_AU8830=m
CONFIG_SND_AW2=m
CONFIG_SND_AZT3328=m
CONFIG_SND_BT87X=m
CONFIG_SND_BT87X_OVERCLOCK=y
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
CONFIG_SND_CS4281=m
CONFIG_SND_CS46XX=m
CONFIG_SND_CS46XX_NEW_DSP=y
CONFIG_SND_CTXFI=m
# CONFIG_SND_DARLA20 is not set
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
# CONFIG_SND_LAYLA24 is not set
CONFIG_SND_MONA=m
# CONFIG_SND_MIA is not set
CONFIG_SND_ECHO3G=m
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
CONFIG_SND_INDIGODJ=m
CONFIG_SND_INDIGOIOX=m
# CONFIG_SND_INDIGODJX is not set
CONFIG_SND_EMU10K1=m
CONFIG_SND_EMU10K1X=m
CONFIG_SND_ENS1370=m
# CONFIG_SND_ENS1371 is not set
CONFIG_SND_ES1938=m
# CONFIG_SND_ES1968 is not set
CONFIG_SND_FM801=m
# CONFIG_SND_HDSP is not set
CONFIG_SND_HDSPM=m
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
CONFIG_SND_KORG1212=m
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
CONFIG_SND_MAESTRO3=m
# CONFIG_SND_MAESTRO3_INPUT is not set
CONFIG_SND_MIXART=m
CONFIG_SND_NM256=m
CONFIG_SND_PCXHR=m
CONFIG_SND_RIPTIDE=m
CONFIG_SND_RME32=m
CONFIG_SND_RME96=m
# CONFIG_SND_RME9652 is not set
CONFIG_SND_SONICVIBES=m
CONFIG_SND_TRIDENT=m
CONFIG_SND_VIA82XX=m
CONFIG_SND_VIA82XX_MODEM=m
CONFIG_SND_VIRTUOSO=m
CONFIG_SND_VX222=m
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_GENERIC_LEDS=y
# CONFIG_SND_HDA_INTEL is not set
# CONFIG_SND_HDA_HWDEP is not set
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_SCODEC_CS35L41=m
CONFIG_SND_HDA_CS_DSP_CONTROLS=m
CONFIG_SND_HDA_SCODEC_CS35L41_I2C=m
CONFIG_SND_HDA_CODEC_REALTEK=m
# CONFIG_SND_HDA_CODEC_ANALOG is not set
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CS8409=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
# CONFIG_SND_HDA_CODEC_CA0110 is not set
# CONFIG_SND_HDA_CODEC_CA0132 is not set
CONFIG_SND_HDA_CODEC_CMEDIA=m
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_USB=y
# CONFIG_SND_USB_AUDIO is not set
# CONFIG_SND_USB_UA101 is not set
CONFIG_SND_USB_USX2Y=m
CONFIG_SND_USB_CAIAQ=m
# CONFIG_SND_USB_CAIAQ_INPUT is not set
CONFIG_SND_USB_US122L=m
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=m
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
CONFIG_SND_DICE=m
CONFIG_SND_OXFW=m
# CONFIG_SND_ISIGHT is not set
CONFIG_SND_FIREWORKS=m
CONFIG_SND_BEBOB=m
CONFIG_SND_FIREWIRE_DIGI00X=m
CONFIG_SND_FIREWIRE_TASCAM=m
# CONFIG_SND_FIREWIRE_MOTU is not set
# CONFIG_SND_FIREFACE is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
# CONFIG_SND_SOC_AMD_ACP5x is not set
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_SOC_AMD_PS is not set
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_BCM63XX_I2S_WHISTLER=m
CONFIG_SND_DESIGNWARE_I2S=m
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=m
# CONFIG_SND_SOC_FSL_SAI is not set
CONFIG_SND_SOC_FSL_AUDMIX=m
# CONFIG_SND_SOC_FSL_SSI is not set
CONFIG_SND_SOC_FSL_SPDIF=m
CONFIG_SND_SOC_FSL_ESAI=m
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_EASRC=m
CONFIG_SND_SOC_FSL_XCVR=m
CONFIG_SND_SOC_FSL_UTILS=m
CONFIG_SND_SOC_FSL_RPMSG=m
CONFIG_SND_SOC_IMX_AUDMUX=m
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
CONFIG_SND_SOC_IMG=y
# CONFIG_SND_SOC_IMG_I2S_IN is not set
CONFIG_SND_SOC_IMG_I2S_OUT=m
# CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
# CONFIG_SND_SOC_IMG_SPDIF_IN is not set
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
# CONFIG_SND_SOC_INTEL_AVS is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
CONFIG_SND_SOC_SOF_TOPLEVEL=y
CONFIG_SND_SOC_SOF_PCI=m
CONFIG_SND_SOC_SOF_ACPI=m
# CONFIG_SND_SOC_SOF_AMD_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
CONFIG_SND_SOC_XTFPGA_I2S=m
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=m
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
CONFIG_SND_SOC_ADAU1372_I2C=m
# CONFIG_SND_SOC_ADAU1701 is not set
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_ADAU7118=m
CONFIG_SND_SOC_ADAU7118_HW=m
CONFIG_SND_SOC_ADAU7118_I2C=m
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4375 is not set
CONFIG_SND_SOC_AK4458=m
CONFIG_SND_SOC_AK4554=m
# CONFIG_SND_SOC_AK4613 is not set
# CONFIG_SND_SOC_AK4642 is not set
CONFIG_SND_SOC_AK5386=m
CONFIG_SND_SOC_AK5558=m
CONFIG_SND_SOC_ALC5623=m
CONFIG_SND_SOC_AW8738=m
# CONFIG_SND_SOC_AW88395 is not set
# CONFIG_SND_SOC_BD28623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
CONFIG_SND_SOC_CROS_EC_CODEC=m
CONFIG_SND_SOC_CS35L32=m
# CONFIG_SND_SOC_CS35L33 is not set
CONFIG_SND_SOC_CS35L34=m
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS35L41_LIB=m
CONFIG_SND_SOC_CS35L41=m
CONFIG_SND_SOC_CS35L41_I2C=m
CONFIG_SND_SOC_CS35L45=m
CONFIG_SND_SOC_CS35L45_I2C=m
CONFIG_SND_SOC_CS35L56=m
CONFIG_SND_SOC_CS35L56_SHARED=m
# CONFIG_SND_SOC_CS35L56_I2C is not set
CONFIG_SND_SOC_CS35L56_SDW=m
CONFIG_SND_SOC_CS42L42_CORE=m
# CONFIG_SND_SOC_CS42L42 is not set
# CONFIG_SND_SOC_CS42L42_SDW is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
CONFIG_SND_SOC_CS42L52=m
CONFIG_SND_SOC_CS42L56=m
# CONFIG_SND_SOC_CS42L73 is not set
CONFIG_SND_SOC_CS42L83=m
CONFIG_SND_SOC_CS4234=m
CONFIG_SND_SOC_CS4265=m
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
# CONFIG_SND_SOC_CS43130 is not set
CONFIG_SND_SOC_CS4341=m
CONFIG_SND_SOC_CS4349=m
CONFIG_SND_SOC_CS53L30=m
CONFIG_SND_SOC_CX2072X=m
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DMIC=m
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8316=m
# CONFIG_SND_SOC_ES8326 is not set
# CONFIG_SND_SOC_ES8328_I2C is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDA=m
CONFIG_SND_SOC_ICS43432=m
CONFIG_SND_SOC_INNO_RK3036=m
CONFIG_SND_SOC_MAX98088=m
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98357A=m
CONFIG_SND_SOC_MAX98504=m
CONFIG_SND_SOC_MAX9867=m
# CONFIG_SND_SOC_MAX98927 is not set
CONFIG_SND_SOC_MAX98520=m
CONFIG_SND_SOC_MAX98363=m
CONFIG_SND_SOC_MAX98373=m
# CONFIG_SND_SOC_MAX98373_I2C is not set
CONFIG_SND_SOC_MAX98373_SDW=m
# CONFIG_SND_SOC_MAX98390 is not set
# CONFIG_SND_SOC_MAX98396 is not set
CONFIG_SND_SOC_MAX9860=m
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
CONFIG_SND_SOC_PCM1681=m
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
CONFIG_SND_SOC_PCM186X=m
CONFIG_SND_SOC_PCM186X_I2C=m
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
CONFIG_SND_SOC_PCM5102A=m
# CONFIG_SND_SOC_PCM512x_I2C is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT1308_SDW=m
CONFIG_SND_SOC_RT1316_SDW=m
CONFIG_SND_SOC_RT1318_SDW=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
CONFIG_SND_SOC_RT5640=m
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT5682=m
CONFIG_SND_SOC_RT5682_SDW=m
# CONFIG_SND_SOC_RT700_SDW is not set
CONFIG_SND_SOC_RT711=m
CONFIG_SND_SOC_RT711_SDW=m
CONFIG_SND_SOC_RT711_SDCA_SDW=m
# CONFIG_SND_SOC_RT712_SDCA_SDW is not set
CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW=m
# CONFIG_SND_SOC_RT715_SDW is not set
CONFIG_SND_SOC_RT715_SDCA_SDW=m
# CONFIG_SND_SOC_RT9120 is not set
# CONFIG_SND_SOC_SDW_MOCKUP is not set
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
CONFIG_SND_SOC_SIMPLE_MUX=m
CONFIG_SND_SOC_SMA1303=m
CONFIG_SND_SOC_SPDIF=m
CONFIG_SND_SOC_SRC4XXX_I2C=m
CONFIG_SND_SOC_SRC4XXX=m
CONFIG_SND_SOC_SSM2305=m
CONFIG_SND_SOC_SSM2518=m
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=m
CONFIG_SND_SOC_STI_SAS=m
CONFIG_SND_SOC_TAS2552=m
CONFIG_SND_SOC_TAS2562=m
# CONFIG_SND_SOC_TAS2764 is not set
CONFIG_SND_SOC_TAS2770=m
CONFIG_SND_SOC_TAS2780=m
CONFIG_SND_SOC_TAS5086=m
CONFIG_SND_SOC_TAS571X=m
CONFIG_SND_SOC_TAS5720=m
# CONFIG_SND_SOC_TAS5805M is not set
CONFIG_SND_SOC_TAS6424=m
CONFIG_SND_SOC_TDA7419=m
CONFIG_SND_SOC_TFA9879=m
CONFIG_SND_SOC_TFA989X=m
CONFIG_SND_SOC_TLV320ADC3XXX=m
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC3X=m
CONFIG_SND_SOC_TLV320AIC3X_I2C=m
# CONFIG_SND_SOC_TLV320ADCX140 is not set
CONFIG_SND_SOC_TS3A227E=m
CONFIG_SND_SOC_TSCS42XX=m
# CONFIG_SND_SOC_TSCS454 is not set
CONFIG_SND_SOC_UDA1334=m
CONFIG_SND_SOC_WCD_MBHC=m
CONFIG_SND_SOC_WCD938X=m
CONFIG_SND_SOC_WCD938X_SDW=m
CONFIG_SND_SOC_WM8510=m
CONFIG_SND_SOC_WM8523=m
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
CONFIG_SND_SOC_WM8711=m
# CONFIG_SND_SOC_WM8728 is not set
CONFIG_SND_SOC_WM8731=m
CONFIG_SND_SOC_WM8731_I2C=m
CONFIG_SND_SOC_WM8737=m
# CONFIG_SND_SOC_WM8741 is not set
CONFIG_SND_SOC_WM8750=m
CONFIG_SND_SOC_WM8753=m
CONFIG_SND_SOC_WM8776=m
# CONFIG_SND_SOC_WM8782 is not set
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
CONFIG_SND_SOC_WM8903=m
CONFIG_SND_SOC_WM8904=m
CONFIG_SND_SOC_WM8940=m
# CONFIG_SND_SOC_WM8960 is not set
CONFIG_SND_SOC_WM8961=m
# CONFIG_SND_SOC_WM8962 is not set
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
# CONFIG_SND_SOC_WM8985 is not set
CONFIG_SND_SOC_WSA881X=m
CONFIG_SND_SOC_WSA883X=m
CONFIG_SND_SOC_MAX9759=m
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_MT6660=m
CONFIG_SND_SOC_NAU8315=m
CONFIG_SND_SOC_NAU8540=m
# CONFIG_SND_SOC_NAU8810 is not set
CONFIG_SND_SOC_NAU8821=m
CONFIG_SND_SOC_NAU8822=m
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_TPA6130A2=m
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
CONFIG_SND_SOC_LPASS_VA_MACRO=m
CONFIG_SND_SOC_LPASS_RX_MACRO=m
CONFIG_SND_SOC_LPASS_TX_MACRO=m
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
# CONFIG_SND_X86 is not set
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACCUTOUCH=m
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_APPLEIR=m
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
CONFIG_HID_BETOP_FF=y
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=y
CONFIG_HID_CORSAIR=m
CONFIG_HID_COUGAR=m
CONFIG_HID_MACALLY=y
# CONFIG_HID_PRODIKEYS is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CREATIVE_SB0540=m
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=m
# CONFIG_HID_HOLTEK is not set
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_GOOGLE_HAMMER=m
CONFIG_HID_VIVALDI=m
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_UCLOGIC=y
# CONFIG_HID_WALTOP is not set
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_VRC2=m
CONFIG_HID_XIAOMI=y
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=m
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LETSKETCH=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_LOGITECH_FF=y
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=m
CONFIG_HID_MAYFLASH=m
CONFIG_HID_MEGAWORLD_FF=m
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=y
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PXRC=y
CONFIG_HID_RAZER=m
# CONFIG_HID_PRIMAX is not set
CONFIG_HID_RETRODE=y
CONFIG_HID_ROCCAT=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SAMSUNG=m
CONFIG_HID_SEMITEK=y
CONFIG_HID_SIGMAMICRO=y
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=y
# CONFIG_STEAM_FF is not set
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=m
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=m
CONFIG_HID_THINGM=m
# CONFIG_HID_THRUSTMASTER is not set
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_U2FZERO=m
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=m
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
# CONFIG_HID_ALPS is not set
CONFIG_HID_MCP2221=y
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y
# end of USB HID support

# CONFIG_I2C_HID is not set

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

#
# Surface System Aggregator Module HID support
#
# CONFIG_SURFACE_KBD is not set
# end of Surface System Aggregator Module HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PCI_RENESAS=m
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=m
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_OHCI_HCD=m
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=m
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USBIP_CORE=m
# CONFIG_USBIP_VHCI_HCD is not set
CONFIG_USBIP_HOST=m
# CONFIG_USBIP_VUDC is not set
# CONFIG_USBIP_DEBUG is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=m
CONFIG_USB_CDNS3=m
# CONFIG_USB_CDNS3_GADGET is not set
# CONFIG_USB_CDNS3_HOST is not set
CONFIG_USB_MUSB_HDRC=m
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
CONFIG_USB_MUSB_DUAL_ROLE=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
# CONFIG_USB_DWC3_HOST is not set
# CONFIG_USB_DWC3_GADGET is not set
CONFIG_USB_DWC3_DUAL_ROLE=y

#
# Platform Glue Driver Support
#
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
CONFIG_USB_ISP1760_GADGET_ROLE=y
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=y
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
# CONFIG_USB_SERIAL_CH341 is not set
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=y
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=m
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=m
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=m
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=m
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
CONFIG_USB_SERIAL_SAFE_PADDED=y
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=m
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=m
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=m
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=m
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=m
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=y
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=m
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
CONFIG_USB_GR_UDC=m
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_PXA27X=m
CONFIG_USB_MV_UDC=y
CONFIG_USB_MV_U3D=m
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=m
CONFIG_USB_NET2272=m
CONFIG_USB_NET2272_DMA=y
# CONFIG_USB_DUMMY_HCD is not set
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_U_AUDIO=m
CONFIG_USB_F_SERIAL=m
CONFIG_USB_F_OBEX=m
CONFIG_USB_F_NCM=m
CONFIG_USB_F_ECM=y
CONFIG_USB_F_SUBSET=m
CONFIG_USB_F_RNDIS=m
CONFIG_USB_F_FS=m
CONFIG_USB_F_UAC2=m
CONFIG_USB_F_HID=y
# CONFIG_USB_CONFIGFS is not set

#
# USB Gadget precomposed configurations
#
# CONFIG_USB_ZERO is not set
CONFIG_USB_AUDIO=m
# CONFIG_GADGET_UAC1 is not set
CONFIG_USB_ETH=m
# CONFIG_USB_ETH_RNDIS is not set
# CONFIG_USB_ETH_EEM is not set
CONFIG_USB_G_NCM=m
# CONFIG_USB_GADGETFS is not set
CONFIG_USB_FUNCTIONFS=m
# CONFIG_USB_FUNCTIONFS_ETH is not set
CONFIG_USB_FUNCTIONFS_RNDIS=y
# CONFIG_USB_FUNCTIONFS_GENERIC is not set
CONFIG_USB_G_SERIAL=m
# CONFIG_USB_MIDI_GADGET is not set
# CONFIG_USB_G_PRINTER is not set
CONFIG_USB_CDC_COMPOSITE=y
CONFIG_USB_G_HID=y
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_RAW_GADGET=m
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_ROLES_INTEL_XHCI=y
CONFIG_MMC=y
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=y
# CONFIG_MMC_SDHCI_PCI is not set
CONFIG_MMC_SDHCI_ACPI=y
CONFIG_MMC_SDHCI_PLTFM=y
CONFIG_MMC_SDHCI_F_SDH30=m
CONFIG_MMC_TIFM_SD=m
CONFIG_MMC_CB710=y
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_REALTEK_PCI=m
# CONFIG_MMC_REALTEK_USB is not set
# CONFIG_MMC_CQHCI is not set
CONFIG_MMC_HSQ=m
CONFIG_MMC_TOSHIBA_PCI=y
# CONFIG_MMC_MTK is not set
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=y
CONFIG_MEMSTICK_R592=y
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=m
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=m
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_ADP5520 is not set
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_MENF21BMC is not set
CONFIG_LEDS_IS31FL319X=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_NIC78BX=y
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_LM3601X=m
# CONFIG_LEDS_MT6370_FLASH is not set
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_NETDEV=m
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
CONFIG_LEDS_SIEMENS_SIMATIC_IPC=m
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_ALTERA_MSGDMA=y
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD_COMPAT is not set
# CONFIG_INTEL_IOATDMA is not set
CONFIG_PLX_DMA=m
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
CONFIG_QCOM_HIDMA_MGMT=m
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
# CONFIG_DW_DMAC_PCI is not set
CONFIG_SF_PDMA=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=m
# CONFIG_HD44780 is not set
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=y
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_UIO_AEC=m
# CONFIG_UIO_SERCOS3 is not set
CONFIG_UIO_PCI_GENERIC=y
CONFIG_UIO_NETX=m
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=m
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
CONFIG_VFIO_PCI_VGA=y
# CONFIG_VFIO_PCI_IGD is not set
# CONFIG_MLX5_VFIO_PCI is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=m
# CONFIG_VBOXGUEST is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=m
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_VIRTIO_DMA_SHARED_BUFFER=y
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_TASK=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
CONFIG_COMEDI_ISA_DRIVERS=y
CONFIG_COMEDI_PCL711=y
CONFIG_COMEDI_PCL724=y
CONFIG_COMEDI_PCL726=m
# CONFIG_COMEDI_PCL730 is not set
CONFIG_COMEDI_PCL812=y
CONFIG_COMEDI_PCL816=m
CONFIG_COMEDI_PCL818=m
# CONFIG_COMEDI_PCM3724 is not set
# CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
CONFIG_COMEDI_AMPLC_PC236_ISA=m
# CONFIG_COMEDI_AMPLC_PC263_ISA is not set
CONFIG_COMEDI_RTI800=m
# CONFIG_COMEDI_RTI802 is not set
CONFIG_COMEDI_DAC02=m
CONFIG_COMEDI_DAS16M1=y
CONFIG_COMEDI_DAS08_ISA=m
# CONFIG_COMEDI_DAS16 is not set
# CONFIG_COMEDI_DAS800 is not set
CONFIG_COMEDI_DAS1800=m
# CONFIG_COMEDI_DAS6402 is not set
# CONFIG_COMEDI_DT2801 is not set
CONFIG_COMEDI_DT2811=y
CONFIG_COMEDI_DT2814=m
CONFIG_COMEDI_DT2815=y
# CONFIG_COMEDI_DT2817 is not set
# CONFIG_COMEDI_DT282X is not set
CONFIG_COMEDI_DMM32AT=m
CONFIG_COMEDI_FL512=m
CONFIG_COMEDI_AIO_AIO12_8=m
# CONFIG_COMEDI_AIO_IIRO_16 is not set
CONFIG_COMEDI_II_PCI20KC=m
CONFIG_COMEDI_C6XDIGIO=m
# CONFIG_COMEDI_MPC624 is not set
# CONFIG_COMEDI_ADQ12B is not set
CONFIG_COMEDI_NI_AT_A2150=m
# CONFIG_COMEDI_NI_AT_AO is not set
# CONFIG_COMEDI_NI_ATMIO is not set
CONFIG_COMEDI_NI_ATMIO16D=y
# CONFIG_COMEDI_NI_LABPC_ISA is not set
CONFIG_COMEDI_PCMAD=m
CONFIG_COMEDI_PCMDA12=m
# CONFIG_COMEDI_PCMMIO is not set
CONFIG_COMEDI_PCMUIO=m
# CONFIG_COMEDI_MULTIQ3 is not set
CONFIG_COMEDI_S526=y
# CONFIG_COMEDI_PCI_DRIVERS is not set
# CONFIG_COMEDI_USB_DRIVERS is not set
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=m
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_DAS08=m
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
CONFIG_FB_SM750=m
CONFIG_STAGING_MEDIA=y
CONFIG_LTE_GDM724X=m
CONFIG_KS7010=m
CONFIG_FIELDBUS_DEV=y
CONFIG_QLGE=m
# CONFIG_VME_BUS is not set
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
CONFIG_CHROMEOS_PSTORE=y
# CONFIG_CHROMEOS_TBMC is not set
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
CONFIG_CROS_EC_ISHTP=y
CONFIG_CROS_EC_UART=m
CONFIG_CROS_EC_LPC=y
CONFIG_CROS_EC_PROTO=y
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
# CONFIG_CROS_HPS_I2C is not set
CONFIG_CHROMEOS_PRIVACY_SCREEN=y
CONFIG_WILCO_EC=y
CONFIG_WILCO_EC_DEBUGFS=y
CONFIG_WILCO_EC_EVENTS=m
CONFIG_WILCO_EC_TELEMETRY=m
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=y
# CONFIG_SURFACE_ACPI_NOTIFY is not set
# CONFIG_SURFACE_AGGREGATOR_CDEV is not set
# CONFIG_SURFACE_DTX is not set
# CONFIG_SURFACE_HOTPLUG is not set
CONFIG_SURFACE_PRO3_BUTTON=m
CONFIG_SURFACE_AGGREGATOR=m
# CONFIG_SURFACE_AGGREGATOR_BUS is not set
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=y
# CONFIG_WMI_BMOF is not set
CONFIG_MXM_WMI=y
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
CONFIG_XIAOMI_WMI=m
# CONFIG_GIGABYTE_WMI is not set
CONFIG_YOGABOOK_WMI=m
CONFIG_ACERHDF=y
CONFIG_ACER_WIRELESS=y
CONFIG_ACER_WMI=m
# CONFIG_ADV_SWBUTTON is not set
# CONFIG_APPLE_GMUX is not set
CONFIG_ASUS_LAPTOP=m
CONFIG_ASUS_WIRELESS=m
CONFIG_ASUS_TF103C_DOCK=m
# CONFIG_MERAKI_MX100 is not set
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
# CONFIG_FUJITSU_LAPTOP is not set
CONFIG_FUJITSU_TABLET=m
CONFIG_GPD_POCKET_FAN=m
CONFIG_X86_PLATFORM_DRIVERS_HP=y
CONFIG_HP_ACCEL=m
CONFIG_HP_WMI=y
CONFIG_WIRELESS_HOTKEY=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_LENOVO_YMC is not set
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_LMI=y
CONFIG_INTEL_ATOMISP2_PDX86=y
# CONFIG_INTEL_ATOMISP2_LED is not set
CONFIG_INTEL_ATOMISP2_PM=y
CONFIG_INTEL_SAR_INT1092=y
# CONFIG_INTEL_SKL_INT3472 is not set
CONFIG_INTEL_PMC_CORE=y
CONFIG_INTEL_PMT_CLASS=y
# CONFIG_INTEL_PMT_TELEMETRY is not set
CONFIG_INTEL_PMT_CRASHLOG=y

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

# CONFIG_INTEL_TELEMETRY is not set
CONFIG_INTEL_WMI=y
CONFIG_INTEL_WMI_SBL_FW_UPDATE=y
# CONFIG_INTEL_WMI_THUNDERBOLT is not set

#
# Intel Uncore Frequency Control
#
CONFIG_INTEL_UNCORE_FREQ_CONTROL=y
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_BXTWC_PMIC_TMU is not set
CONFIG_INTEL_CHTDC_TI_PWRBTN=y
CONFIG_INTEL_ISHTP_ECLITE=y
CONFIG_INTEL_PUNIT_IPC=y
CONFIG_INTEL_RST=m
CONFIG_INTEL_SDSI=y
CONFIG_INTEL_SMARTCONNECT=m
# CONFIG_INTEL_TPMI is not set
CONFIG_INTEL_VSEC=y
CONFIG_MSI_LAPTOP=m
# CONFIG_MSI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set
CONFIG_BARCO_P50_GPIO=m
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
CONFIG_TOSHIBA_HAPS=m
CONFIG_TOSHIBA_WMI=m
# CONFIG_ACPI_CMPC is not set
CONFIG_COMPAL_LAPTOP=m
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=y
CONFIG_SONYPI_COMPAT=y
CONFIG_TOPSTAR_LAPTOP=y
CONFIG_MLX_PLATFORM=m
CONFIG_FW_ATTR_CLASS=y
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=m
# CONFIG_INTEL_SCU_IPC_UTIL is not set
CONFIG_SIEMENS_SIMATIC_IPC=m
CONFIG_WINMATE_FM07_KEYS=y
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=m
CONFIG_COMMON_CLK_MAX9485=m
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=m
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_CS2000_CP=m
CONFIG_COMMON_CLK_PALMAS=m
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
# CONFIG_IOMMUFD is not set
CONFIG_VIRTIO_IOMMU=m

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=m
# CONFIG_RPMSG_NS is not set
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
CONFIG_SOUNDWIRE_AMD=m
CONFIG_SOUNDWIRE_CADENCE=m
CONFIG_SOUNDWIRE_INTEL=m
CONFIG_SOUNDWIRE_QCOM=m
CONFIG_SOUNDWIRE_GENERIC_ALLOCATION=m

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=m
CONFIG_DEVFREQ_GOV_USERSPACE=m
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_AXP288 is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_INTEL_INT3496 is not set
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=m
# CONFIG_EXTCON_PALMAS is not set
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_EXTCON_USBC_CROS_EC=y
CONFIG_MEMORY=y
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_AMD is not set
CONFIG_NTB_IDT=m
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
CONFIG_NTB_SWITCHTEC=m
CONFIG_NTB_PINGPONG=m
CONFIG_NTB_TOOL=m
CONFIG_NTB_PERF=m
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=y
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_SIMPLE is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_USB_LGM_PHY=m
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=m
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_HSIC=m
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
CONFIG_MCB_PCI=m
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
CONFIG_NVMEM_LAYOUT_ONIE_TLV=m
# end of Layout Types

CONFIG_NVMEM_RAVE_SP_EEPROM=m
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
# CONFIG_MUX_GPIO is not set
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_INTEL_QEP=m
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_MOST is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=m
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
CONFIG_VIRTIO_FS=m
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_STATS is not set
CONFIG_FSCACHE_DEBUG=y
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=m
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=m
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=m
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=m
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=m
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=m
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y

#
# No trust source selected!
#
# CONFIG_ENCRYPTED_KEYS is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=m
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARIA=y
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=m
# CONFIG_CRYPTO_KHAZAD is not set
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=m
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_POLYVAL=m
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=m
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=m
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=m
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_CURVE25519_X86=y
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_BLOWFISH_X86_64=y
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64=y
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_AVX2=m
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
CONFIG_CRYPTO_POLY1305_X86_64=m
# CONFIG_CRYPTO_SHA1_SSSE3 is not set
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SM3_AVX_X86_64=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y
# CONFIG_CRYPTO_CRC32C_INTEL is not set
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=y
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=m
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
# CONFIG_CRYPTO_DEV_CCP is not set
CONFIG_CRYPTO_DEV_QAT=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_4XXX=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CRYPTO_DEV_VIRTIO=m
CONFIG_CRYPTO_DEV_SAFEXCEL=m
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=m
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
# end of Library routines

CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZLIB=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B=y
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
CONFIG_DEBUG_OBJECTS_WORK=y
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# CONFIG_CSD_LOCK_WAIT_DEBUG_DEFAULT is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_NMI_CHECK_CPU=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_LATENCYTOP is not set
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
# CONFIG_FUNCTION_GRAPH_TRACER is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_FPROBE=y
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_STACK_TRACER=y
CONFIG_IRQSOFF_TRACER=y
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_KPROBE_EVENTS_ON_NOTRACE=y
# CONFIG_UPROBE_EVENTS is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
# CONFIG_SYNTH_EVENTS is not set
CONFIG_USER_EVENTS=y
# CONFIG_HIST_TRIGGERS is not set
CONFIG_TRACE_EVENT_INJECT=y
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
CONFIG_DA_MON_EVENTS=y
CONFIG_DA_MON_EVENTS_ID=y
CONFIG_RV=y
CONFIG_RV_MON_WWNR=y
# CONFIG_RV_REACTORS is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
CONFIG_SAMPLE_TRACE_EVENTS=m
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
CONFIG_SAMPLE_TRACE_PRINTK=m
CONFIG_SAMPLE_FTRACE_DIRECT=m
CONFIG_SAMPLE_FTRACE_DIRECT_MULTI=m
CONFIG_SAMPLE_FTRACE_OPS=m
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
CONFIG_SAMPLE_KPROBES=m
CONFIG_SAMPLE_KRETPROBES=m
CONFIG_SAMPLE_HW_BREAKPOINT=m
# CONFIG_SAMPLE_FPROBE is not set
CONFIG_SAMPLE_KFIFO=m
CONFIG_SAMPLE_RPMSG_CLIENT=m
CONFIG_SAMPLE_CONFIGFS=m
CONFIG_SAMPLE_CONNECTOR=m
CONFIG_SAMPLE_HIDRAW=y
# CONFIG_SAMPLE_LANDLOCK is not set
CONFIG_SAMPLE_PIDFD=y
CONFIG_SAMPLE_TIMER=y
# CONFIG_SAMPLE_UHID is not set
CONFIG_SAMPLE_VFIO_MDEV_MTTY=m
CONFIG_SAMPLE_VFIO_MDEV_MDPY=m
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
CONFIG_SAMPLE_ANDROID_BINDERFS=y
# CONFIG_SAMPLE_VFS is not set
CONFIG_SAMPLE_INTEL_MEI=y
CONFIG_SAMPLE_WATCHDOG=y
CONFIG_SAMPLE_WATCH_QUEUE=y
# CONFIG_SAMPLE_KMEMLEAK is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_FAULT_INJECTION_CONFIGFS=y
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--/iPzH0e0Z6Fhq5gi
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot-300s.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='rppt/jitalloc/v1.1'
	export commit='b99e562f2ff2ff567b283d6502986246ab698544'
	export kconfig='x86_64-randconfig-a004-20230531'
	export nr_vm=300
	export submit_id='647a3114d98420c89ef8153c'
	export job_file='/lkp/jobs/scheduled/vm-meta-72/boot-300-debian-11.1-i386-20220923.cgz-b99e562f2ff2ff567b283d6502986246ab698544-20230603-51358-l7br0s-0.yaml'
	export id='393a88f569e8442bcc9ff76777f2b78401eea62a'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-12'
	export enqueue_time='2023-06-03 02:12:36 +0800'
	export _id='647a3114d98420c89ef8153c'
	export _rt='/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544/3'
	export scheduler_version='/lkp/lkp/.src-20230602-160545'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544/vmlinuz-6.4.0-rc3-00009-gb99e562f2ff2
branch=rppt/jitalloc/v1.1
job=/lkp/jobs/scheduled/vm-meta-72/boot-300-debian-11.1-i386-20220923.cgz-b99e562f2ff2ff567b283d6502986246ab698544-20230603-51358-l7br0s-0.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a004-20230531
commit=b99e562f2ff2ff567b283d6502986246ab698544
initcall_debug
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export meta_host='vm-meta-72'
	export kernel='/pkg/linux/x86_64-randconfig-a004-20230531/gcc-12/b99e562f2ff2ff567b283d6502986246ab698544/vmlinuz-6.4.0-rc3-00009-gb99e562f2ff2'
	export dequeue_time='2023-06-03 02:46:35 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-72/boot-300-debian-11.1-i386-20220923.cgz-b99e562f2ff2ff567b283d6502986246ab698544-20230603-51358-l7br0s-0.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 300
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--/iPzH0e0Z6Fhq5gi
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--/iPzH0e0Z6Fhq5gi--
