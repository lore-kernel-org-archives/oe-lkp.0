Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160817C
	for <oe-lkp@lists.linux.dev>; Fri, 28 Jul 2023 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690504429; x=1722040429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blPFWjcHbnFjCP/Hf0YOLeuOONsdaduUecbmpHOyZ5o=;
  b=H73tpZrP7QaXwNedSO+yC+W0lFBGSa3Ss1d1bRy4L8ohBAGajcdEJxjl
   DfEFfGMB7Bd3wNY1RrBL/MMLwLZF4VtOoJmVI+jBkgkVFak+p389onFI6
   7PP5IybMl/JaZmtMq/XsmRljAn85fAPpgFy0zz0ijglk3F0mbg2MJ79kQ
   SliQTTTA+Bk9gHKaIPddswt5/LaVSQyc7/WLNEILnqrYY4aZg0IzEwYr+
   y9DpqGwR6BEQm37L+AoGxhX/g8YtLpDyx06NDwrIZQ/aZzYSkJqw0UTpz
   UXmRBHVXMKWEawktZuBgZ5in+q3hzOkTiZcYouZhlZWBJNle7Ucnhoda1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371169977"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="xz'341?yaml'341?scan'341,208,341";a="371169977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 17:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="xz'341?yaml'341?scan'341,208,341";a="870641329"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 17:33:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:33:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:33:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 17:33:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 17:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOalwfQD+U5EmHMf+Nt/4iIw95Pqnd42jJXXRGFpCLI96YAabRBxHh0IxstJYTGTalP4kZNienywILu4qcnnDZbifvkpkV0OD6nmCYc4v25+9NcxSGqJzZDAPb/X+MGA9BTylIUaZlgx0jrGNIWqsOr64Vy0mTVa11DuUolj6hwRF5QLJjGT2IHgO9k8aLJLn/ULx6pfsgBlj0Yl4loOXDPP4ORQGfi4oBiYJEFQN8t4oLJ+pDx+jW9XgTUpRPrwxribbczrVG7OewlqrvTXIm5HRi4YwqPWEEZ4R3pG+LIMRnzNkHQ8sTOfd7+UH0c680NpeBuSeGcPVomubjURzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV2rF5/h/+D1TaWuTa7IfW85W+gQ5zuXpk6iVb++JHE=;
 b=MT7mKz9QWjFNAikMiH9ERktRzc21V87gXw+4BnyMQFv5WDUJhltrh99RmlCUbdaa8Nkh072erJwiOWyrO9DLRq6PhX1uy3YJhW/b4edNI3KuPUusGO2az6h+FssdY1awNrD6fuzYqqCi+R6pk2zoB40Xj9/o+JRyAGH8Sm3CncV5fXYuJbSABY1uQgfanmHDATiL3Pr+04Bet9OzrsDSYfxrkhYIt7NlKkQGOTqIONdh5pJ0N6JXNHSFiNPzOenFbvAysKQ/+jAdWhqLb9t4KAA98PDUHz2cgBzQ6R3wrqwpKnXvyu0Ubn0Rk0HTbZXQIoOq11ycERmhV9ZCIETgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 00:33:22 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:33:22 +0000
Date: Fri, 28 Jul 2023 08:33:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Rik van Riel <riel@surriel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm,memblock]  9e46e4dcd9:
 WARNING:at_mm/memblock.c:#memblock_remove_region
Message-ID: <202307271656.447aa17e-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="yCzEYK6s5u2mHX8K"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:4:7c::34) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 393c99c9-387c-41d3-6533-08db8f023eff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Au/4n11JLOjFAKtGR4mHts0xzTih+YQqktEPJbrPeLcmjdI31deeBt8JZJRahLvDmIFOccMC8yFhE+VT6cLANfExiNRaa1FJBjJ7dQosWF+UiQ2Mfn1TaJos62JK+6bvNNOtDzs43mws51QAKchLcfpeKEeed2zY5yJ02d3HalajFfHv+1Am+afjnqUNhXkb9W32O9g45DGVaHaje8MGuD5mlchx6WqdtkcdBjdxzts1RDZeKnbjuUvQBfdGvjuTNVa3Odqqo4Qh18nLhE+K8T/uVpkjv/nHfMgVxcM3udtvolBm4JrhW71eCKfoewsfVY1XYZwH8kOvZTvEe4jGzNneNTvyMTcSIcn2/iJn6GbO3zWT1Ii4+v5MTB3qWyDVx9GYNOVdBg33Yz4EQeXhM3GbmjsAXEonw/OIf9gGOY99BrTZmaD6YyYqQ1tMimJ64GAl9PFu7f2exhh87K24mDgAfkiUXxSuIwV6wdWYc4qNYDff+qnqYMeR7CF7Fovg3FF+fg/lmUpF6OO4I3/o4eG10uA+LLP8miaSYRLJTxPymcfn9gSJN3Gxq6WIj3WnVhQrdZE8IaTFKNsCgbQEzKFt+ZxWaw83YzY2GfUysbaSZcIzDdiw/FtGTCinP5N5uGyy7CCSaA74Bh5STcFZ6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(66556008)(6916009)(66946007)(66476007)(26005)(41300700001)(4326008)(6666004)(44144004)(6486002)(8936002)(6506007)(1076003)(8676002)(107886003)(21490400003)(5660300002)(235185007)(54906003)(45080400002)(186003)(316002)(966005)(6512007)(478600001)(30864003)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(82960400001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhSIGb7vla026iMbpPsIYiCKk9xKp8SeYtRLJF1xmMDkT9iex9LgumsrVPMl?=
 =?us-ascii?Q?g6ItDLi4Aual1AY7vSCAlTivfyk8EUzre4RvYYVbViOPmxK9KYnhk/VeeCt6?=
 =?us-ascii?Q?kYLegbIVxg9fT7Pmz1WuT87bJto+VpmwR9rkDMCFTX0q/EyCo6kn5+2MPbts?=
 =?us-ascii?Q?RBmZ7HefHvIPFjaHL/k5GaDYRqEfwBCSHO5RHa8AfhmhSBRRRQ/r5xWoo53X?=
 =?us-ascii?Q?rszkf8p4Ij0nwKODBBS7Wj4pxjmsIHwSVal9kFXJeBRZjQmgCOzCu7QOuIo9?=
 =?us-ascii?Q?SIa+cs5UKCag/iztzM6YcchJjfjtCIo5BtfdDms4xHOiTQbzY51BdlrdLeT4?=
 =?us-ascii?Q?rXM7GDn4oLT6NB1yunSqswdcvsqiZHZyhlNNEOTdQGcnJSqHGPyEUWidUuep?=
 =?us-ascii?Q?1CYwmpoqU/+wJlqHrz1JTuxN8lNBLmOqYCmYFq5S0NJmZ+CqB38wZ/10oV5F?=
 =?us-ascii?Q?YEe+U5b1ZWd26R1w7Z7a0JtNz47mHxl2bSUmo3bz+0UlIqILA2g9ta0dQ1Xo?=
 =?us-ascii?Q?teDMYDGhtNmPPL9DxEnb0t+UrjRoTd/Pj2wOyTsSWnufFmfjPaSk3NTDykrf?=
 =?us-ascii?Q?sfGUBOIQpJhKkDL1tCVviWrxG57zY+9/hO0CXLkNydIVUxaYGc6FCkCoSBH0?=
 =?us-ascii?Q?3N3qSTJshgusmBOLwoffxQUHlGAZ/gjK1T4c9B9A5yzrGeCfzZnRV7068jam?=
 =?us-ascii?Q?eisiLZ2COQKTbm7epGu9sb+ImsAc85g+5TwReZG86mIyPU6uQ3eQj0Ugnrmi?=
 =?us-ascii?Q?/ZmBUkQGFPeRzG1XgGAbOJl/Q4G3aM9Qkz4DQTgC9tToufgD5LaMFH7G2+/D?=
 =?us-ascii?Q?F9QYoHO92HQZF/0JeiJ+AlIKIFs+NT8oG7x50nHkvn35gl1uoqgWIlMA9si0?=
 =?us-ascii?Q?sPEWe1P9HbKGsXVqCIaMHbuMMuFpNadBTqY1ChTj/H5aXT2CckKuTCIWyK0H?=
 =?us-ascii?Q?eL/QiM2FyvX05SRvxHO3MSZm2qbN5d5lsfjbNo9p8G5Yzg6VzUG2fn2CXzXx?=
 =?us-ascii?Q?Q/fdxFFW0Atom+hCbh5vbpEwtcp8kWFMOyba5zlHGsZcSenIgmkBriAfKxCU?=
 =?us-ascii?Q?ndrJ2KQWeOrpKnRgUWkwQenGqHymOSt1QRrIgSfI4xSXz3Vm07upWA5+qH/D?=
 =?us-ascii?Q?sQlzcmLJpIiDYE4NAOFQHbCbKA2I5crktvtzaVzidNI6ZW/LT3sDx1eyGgTu?=
 =?us-ascii?Q?o0AGMhduWjCW/jN6cgLofuXRtboHwgPENZDhruwujB3Zw3tJeqomBpP8lOjY?=
 =?us-ascii?Q?5pcn1DQYDuAPjSIdCvx5hdTGnVPg5xgo7oMb8AgcF/r+e3OOUSbWFnk0D+p9?=
 =?us-ascii?Q?bZYlZnKl0YQ6ntXddZLbWYI8QsXe5Mmb+nTCSAOVR6sLGXUYD4n9cd1m9Uyu?=
 =?us-ascii?Q?ioK4JLDk9ZFbZUJWH0JzPUDiNXiElKVn2DBelopEfvqCWZV/FK8YRuMlzaxa?=
 =?us-ascii?Q?MyD0WmvzHeub+Dv9n2k+emUoOfSwYrmS4tB2YWIymnAosGgYnUc8mvm+8H3T?=
 =?us-ascii?Q?WI1lhcKgaGkrKqw37QzzrlRkQ0w72jgGVWDa70uyMzWcByEeQlaUsdl7GRUT?=
 =?us-ascii?Q?JAWEE60yNvIL1N8bg8K8AlFw/SNiyeoq4Sr0RIT0zTm+fubKMV7SRTaKlNY7?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 393c99c9-387c-41d3-6533-08db8f023eff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:33:22.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nsq601KnaCEqAAJNwN4c2PrbfrNMobmAWRrWncImz/kt+tEXQvIajZQfya6teNvSufi752efw3dbFnlD/wUKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
X-OriginatorOrg: intel.com

--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:at_mm/memblock.c:#memblock_remove_region" on:

commit: 9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c ("mm,memblock: reset memblock.reserved to system init state to prevent UAF")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 0ba5d07205771c50789fd9063950aa75e7f1183f]

in testcase: vm-scalability
version: vm-scalability-x86_64-1.0-0_20220518
with following parameters:

	runtime: 300
	thp_enabled: always
	thp_defrag: always
	nr_task: 8
	nr_ssd: 1
	priority: 1
	test: swap-w-seq-mt
	cpufreq_governor: performance

test-description: The motivation behind this suite is to exercise functions and regions of the mm/ of the Linux kernel which are of interest to us.
test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability.git/


compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202307271656.447aa17e-oliver.sang@intel.com


[    4.971006][    T1] ------------[ cut here ]------------
[ 4.971904][ T1] WARNING: CPU: 0 PID: 1 at mm/memblock.c:352 memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:352 (discriminator 1)) 
[    4.972901][    T1] Modules linked in:
[    4.973901][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc3-00001-g9e46e4dcd9d6 #2
[ 4.974901][ T1] RIP: 0010:memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:352 (discriminator 1)) 
[ 4.975900][ T1] Code: 00 00 48 8b 43 18 48 c7 40 08 00 00 00 00 48 8b 43 18 c7 40 10 00 00 00 00 48 8b 43 18 c7 40 14 00 04 00 00 5b c3 cc cc cc cc <0f> 0b eb c2 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	48 8b 43 18          	mov    0x18(%rbx),%rax
   6:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   d:	00 
   e:	48 8b 43 18          	mov    0x18(%rbx),%rax
  12:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%rax)
  19:	48 8b 43 18          	mov    0x18(%rbx),%rax
  1d:	c7 40 14 00 04 00 00 	movl   $0x400,0x14(%rax)
  24:	5b                   	pop    %rbx
  25:	c3                   	retq   
  26:	cc                   	int3   
  27:	cc                   	int3   
  28:	cc                   	int3   
  29:	cc                   	int3   
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	eb c2                	jmp    0xfffffffffffffff0
  2e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  35:	00 00 00 00 
  39:	66                   	data16
  3a:	66                   	data16
  3b:	2e                   	cs
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)  
  3e:	84 00                	test   %al,(%rax)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	eb c2                	jmp    0xffffffffffffffc6
   4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
   b:	00 00 00 00 
   f:	66                   	data16
  10:	66                   	data16
  11:	2e                   	cs
  12:	0f                   	.byte 0xf
  13:	1f                   	(bad)  
  14:	84 00                	test   %al,(%rax)
[    4.976901][    T1] RSP: 0000:ffa0000000077e78 EFLAGS: 00010206
[    4.977900][    T1] RAX: ffffffff82f4bc40 RBX: ffffffff82f4bc18 RCX: 0000000000000000
[    4.978900][    T1] RDX: 0000000000000000 RSI: ffffffff82f4bc58 RDI: ffffffff82f4bc40
[    4.979900][    T1] RBP: 0000000000000000 R08: ff1100207ffd4d00 R09: 0000000000000002
[    4.980901][    T1] R10: ffd4000081ff9d00 R11: ff1100207ffd4000 R12: 0000000000000000
[    4.981900][    T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    4.982900][    T1] FS:  0000000000000000(0000) GS:ff1100103f200000(0000) knlGS:0000000000000000
[    4.983900][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.984899][    T1] CR2: ff1100207fc00000 CR3: 000000207ea18001 CR4: 0000000000771ef0
[    4.985900][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    4.986900][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    4.987900][    T1] PKRU: 55555554
[    4.988899][    T1] Call Trace:
[    4.989902][    T1]  <TASK>
[ 4.990900][ T1] ? memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:352 (discriminator 1)) 
[ 4.991900][ T1] ? __warn (kbuild/src/x86_64/kernel/panic.c:673) 
[ 4.992901][ T1] ? memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:352 (discriminator 1)) 
[ 4.993900][ T1] ? report_bug (kbuild/src/x86_64/lib/bug.c:180 kbuild/src/x86_64/lib/bug.c:219) 
[ 4.994900][ T1] ? handle_bug (kbuild/src/x86_64/arch/x86/kernel/traps.c:324) 
[ 4.995899][ T1] ? exc_invalid_op (kbuild/src/x86_64/arch/x86/kernel/traps.c:345 (discriminator 1)) 
[ 4.996899][ T1] ? asm_exc_invalid_op (kbuild/src/x86_64/arch/x86/include/asm/idtentry.h:568) 
[ 4.997900][ T1] ? memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:352 (discriminator 1)) 
[ 4.998900][ T1] ? memblock_remove_region (kbuild/src/x86_64/mm/memblock.c:348) 
[ 4.999899][ T1] memblock_discard (kbuild/src/x86_64/mm/memblock.c:383) 
[ 5.000901][ T1] page_alloc_init_late (kbuild/src/x86_64/include/linux/find.h:208 kbuild/src/x86_64/include/linux/nodemask.h:266 kbuild/src/x86_64/mm/mm_init.c:2405) 
[ 5.001900][ T1] kernel_init_freeable (kbuild/src/x86_64/init/main.c:1325 kbuild/src/x86_64/init/main.c:1546) 
[ 5.002901][ T1] ? __pfx_kernel_init (kbuild/src/x86_64/init/main.c:1429) 
[ 5.003900][ T1] kernel_init (kbuild/src/x86_64/init/main.c:1439) 
[ 5.004900][ T1] ret_from_fork (kbuild/src/x86_64/arch/x86/kernel/process.c:145) 
[ 5.005900][ T1] ? __pfx_kernel_init (kbuild/src/x86_64/init/main.c:1429) 
[ 5.006900][ T1] ret_from_fork_asm (kbuild/src/x86_64/arch/x86/entry/entry_64.S:298) 
[    5.007900][    T1] RIP: 0000:0x0
[ 5.008902][ T1] Code: Unable to access opcode bytes at 0xffffffffffffffd6.

Code starting with the faulting instruction
===========================================
[    5.009900][    T1] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
[    5.010900][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    5.011900][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    5.012900][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[    5.013900][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    5.014900][    T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    5.015900][    T1]  </TASK>
[    5.016900][    T1] ---[ end trace 0000000000000000 ]---
[    5.020980][    T1] devtmpfs: initialized
[    5.024945][    T1] x86/mm: Memory block size: 2048MB
[    5.030509][    T1] ACPI: PM: Registering ACPI NVS region [mem 0x67dae000-0x68fdefff] (19075072 bytes)
[    5.040153][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    5.049937][    T1] futex hash table entries: 32768 (order: 9, 2097152 bytes, vmalloc)
[    5.058123][    T1] pinctrl core: initialized pinctrl subsystem
[    5.066539][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    5.073099][    T1] audit: initializing netlink subsys (disabled)
[    5.078923][  T812] audit: type=2000 audit(1690400749.912:1): state=initialized audit_enabled=0 res=1
[    5.079041][    T1] thermal_sys: Registered thermal governor 'fair_share'
[    5.087902][    T1] thermal_sys: Registered thermal governor 'bang_bang'
[    5.094900][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    5.101900][    T1] thermal_sys: Registered thermal governor 'user_space'
[    5.108901][    T1] cpuidle: using governor menu
[    5.111023][    T1] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    5.118064][    T1] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x80000000-0x8fffffff] (base 0x80000000)
[    5.127904][    T1] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved as E820 entry
[    5.135915][    T1] PCI: Using configuration type 1 for base access
[    5.147971][    T1] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    5.157965][    T1] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    5.164901][    T1] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    5.171900][    T1] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    5.179900][    T1] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    5.186967][    T1] cryptd: max_cpu_qlen set to 1000
[    5.192050][    T1] ACPI: Added _OSI(Module Device)
[    5.196901][    T1] ACPI: Added _OSI(Processor Device)
[    5.201900][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
[    5.207900][    T1] ACPI: Added _OSI(Processor Aggregator Device)
[    5.310712][    T1] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    5.341828][    T1] ACPI: Dynamic OEM Table Load:
[    5.425053][    T1] ACPI: Dynamic OEM Table Load:
[    5.445470][    T1] ACPI: Dynamic OEM Table Load:
[    5.505735][    T1] ACPI: Dynamic OEM Table Load:
[    5.696225][    T1] ACPI: Interpreter enabled
[    5.700912][    T1] ACPI: PM: (supports S0 S5)
[    5.704901][    T1] ACPI: Using IOAPIC for interrupt routing
[    5.710943][    T1] HEST: Table parsing has been initialized.
[    5.716964][    T1] GHES: APEI firmware first mode is enabled by APEI bit and WHEA _OSC.
[    5.724901][    T1] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    5.734901][    T1] PCI: Using E820 reservations for host bridge windows
[    5.754166][    T1] ACPI: Enabled 5 GPEs in block 00 to 7F
[    5.831967][    T1] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-15])
[    5.838903][    T1] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    5.866885][    T1] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR]
[    5.875130][    T1] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    5.885142][    T1] PCI host bridge to bus 0000:00
[    5.889901][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    5.896901][    T1] pci_bus 0000:00: root bus resource [io  0x1000-0x4fff window]
[    5.904911][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    5.912949][    T1] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cffff window]
[    5.920928][    T1] pci_bus 0000:00: root bus resource [mem 0xfe010000-0xfe010fff window]
[    5.928905][    T1] pci_bus 0000:00: root bus resource [mem 0x90000000-0x9b7fffff window]
[    5.936901][    T1] pci_bus 0000:00: root bus resource [mem 0x380000000000-0x383fffffffff window]
[    5.945901][    T1] pci_bus 0000:00: root bus resource [bus 00-15]
[    5.951934][    T1] pci 0000:00:00.0: [8086:09a2] type 00 class 0x088000
[    5.959002][    T1] pci 0000:00:00.1: [8086:09a4] type 00 class 0x088000
[    5.965965][    T1] pci 0000:00:00.2: [8086:09a3] type 00 class 0x088000
[    5.972964][    T1] pci 0000:00:00.4: [8086:0998] type 00 class 0x060000
[    5.978965][    T1] pci 0000:00:01.0: [8086:0b00] type 00 class 0x088000
[    5.985909][    T1] pci 0000:00:01.0: reg 0x10: [mem 0x383ffff60000-0x383ffff63fff 64bit]
[    5.994010][    T1] pci 0000:00:01.1: [8086:0b00] type 00 class 0x088000
[    6.000908][    T1] pci 0000:00:01.1: reg 0x10: [mem 0x383ffff5c000-0x383ffff5ffff 64bit]
[    6.009009][    T1] pci 0000:00:01.2: [8086:0b00] type 00 class 0x088000
[    6.015909][    T1] pci 0000:00:01.2: reg 0x10: [mem 0x383ffff58000-0x383ffff5bfff 64bit]


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.5.0-rc3-00001-g9e46e4dcd9d6"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.5.0-rc3 Kernel Configuration
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
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
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
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_CACHESTAT_SYSCALL=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
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
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_INTEL_TDX_GUEST is not set
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
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
# CONFIG_ADDRESS_MASKING is not set
CONFIG_HOTPLUG_CPU=y
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_CALL_PADDING=y
CONFIG_HAVE_CALL_THUNKS=y
CONFIG_CALL_THUNKS=y
CONFIG_PREFIX_SYMBOLS=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_RETPOLINE=y
CONFIG_RETHUNK=y
CONFIG_CALL_DEPTH_TRACKING=y
# CONFIG_CALL_THUNKS_DEBUG is not set
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
CONFIG_ACPI_HMAT=y
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_HOTPLUG_CORE_SYNC=y
CONFIG_HOTPLUG_CORE_SYNC_DEAD=y
CONFIG_HOTPLUG_CORE_SYNC_FULL=y
CONFIG_HOTPLUG_SPLIT_STARTUP=y
CONFIG_HOTPLUG_PARALLEL=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
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
CONFIG_ARCH_HAS_CPU_FINALIZE_INIT=y
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
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
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
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
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
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_EXCLUSIVE_LOADS_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# SLAB allocator options
#
# CONFIG_SLAB_DEPRECATED is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_PER_VMA_LOCK=y
CONFIG_LOCK_MM_AND_FIND_VMA=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_BPF_LINK=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
# CONFIG_NETFILTER_XTABLES_COMPAT is not set

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_MQPRIO_LIB=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_DW_PLAT_HOST is not set
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
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_DEBUG=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_HMEM_REPORTING=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

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
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_SOFT_RESERVE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_SGI_XP is not set
CONFIG_HP_ILO=m
# CONFIG_SGI_GRU is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_INTEL_MEI_GSC_PROXY is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
CONFIG_MEGARAID_NEWGEN=y
CONFIG_MEGARAID_MM=m
CONFIG_MEGARAID_MAILBOX=m
CONFIG_MEGARAID_LEGACY=m
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_PARPORT is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_T1S_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_HYPERV_NET=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
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
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ELKHARTLAKE is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_MAX31827 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
# CONFIG_SENSORS_HP_WMI is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77541 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS6594_I2C is not set
# CONFIG_MFD_TPS6594_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
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
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
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

# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_VIRTIO_GPU_KMS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_IO_HELPERS=y
CONFIG_FB_SYS_HELPERS=y
CONFIG_FB_SYS_HELPERS_DEFERRED=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_USS720 is not set
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# CONFIG_TYPEC_MUX_NB7VPQ904M is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
# CONFIG_LEDS_AW200XX is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_UIO is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y

#
# VFIO support for PCI devices
#
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
# end of VFIO support for PCI devices

CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_TASK=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
# CONFIG_HYPERV_VTL_MODE is not set
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_WMI is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_LENOVO_YMC is not set
CONFIG_SENSORS_HDAPS=m
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
# CONFIG_MSI_EC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
# CONFIG_IOMMUFD is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

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

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_HMEM=m
CONFIG_DEV_DAX_HMEM_DEVICES=y
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_DRAIN_INTENTS=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
# CONFIG_CIFS_DEBUG is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,selinux,smack,tomoyo,apparmor,bpf"

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
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG2=y
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
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE is not set
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
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
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_FLAGS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

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
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
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
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
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
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_PER_VMA_LOCK_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
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
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_HARDLOCKUP_DETECTOR_PREFER_BUDDY is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
# CONFIG_HARDLOCKUP_DETECTOR_BUDDY is not set
# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
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
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_FUNCTION_GRAPH_RETVAL is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
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
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='vm-scalability'
	export testcase='vm-scalability'
	export category='benchmark'
	export runtime=300
	export size=
	export nr_task=8
	export job_origin='vm-scalability-swap-1ssd.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-icl-2sp6'
	export tbox_group='lkp-icl-2sp6'
	export submit_id='64c0f3abf533738274ae49ea'
	export job_file='/lkp/jobs/queued/validate/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-33396-j54j4f-2.yaml'
	export id='7f0315fb080f7a99dc75ee8e4d2785930fdf4c5f'
	export queuer_version='/zday/lkp'
	export model='Ice Lake'
	export nr_node=2
	export nr_cpu=128
	export memory='128G'
	export nr_ssd_partitions=3
	export nr_hdd_partitions=6
	export hdd_partitions='/dev/disk/by-id/ata-WDC_WD20SPZX-08UA7_WD-WXE2EA06X8DA-part*'
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL4204002V800RGN-part*'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BA400G4_BTHV634503K8400NGN-part1'
	export kernel_cmdline_hw='acpi_rsdp=0x699fd014'
	export brand='Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz'
	export need_kconfig='{"XFS_DEBUG"=>"n"}
{"XFS_WARN"=>"y"}
{"PM_DEBUG"=>"n"}
{"PM_SLEEP_DEBUG"=>"n"}
{"DEBUG_ATOMIC_SLEEP"=>"n"}
{"DEBUG_SPINLOCK_SLEEP"=>"n"}
{"CIFS_DEBUG"=>"n"}
{"SCSI_DEBUG"=>"n"}
{"NFS_DEBUG"=>"n"}
{"SUNRPC_DEBUG"=>"n"}
{"DM_DEBUG"=>"n"}
{"DEBUG_SHIRQ"=>"n"}
{"OCFS2_DEBUG_MASKLOG"=>"n"}
{"DEBUG_MEMORY_INIT"=>"n"}
{"EXPERT"=>"y"}
{"PREEMPT_VOLUNTARY"=>"y"}
{"PREEMPT_NONE"=>"n"}
{"PREEMPT"=>"n"}
{"PREEMPT_RT"=>"n"}
{"PREEMPT_DYNAMIC"=>"n"}
{"PREEMPT_VOLUNTARY_BEHAVIOUR"=>"y"}
{"PREEMPT_BEHAVIOUR"=>"n"}
{"PREEMPT_NONE_BEHAVIOUR"=>"n"}
{"PREEMPT_DYNAMIC"=>"n"}
{"PREEMPT_VOLUNTARY"=>"y"}
{"PREEMPT_NONE"=>"n"}
{"PREEMPT"=>"n"}
{"PREEMPT_RT"=>"n"}
BLK_DEV_SD
SCSI
{"BLOCK"=>"y"}
SATA_AHCI
SATA_AHCI_PLATFORM
ATA
{"PCI"=>"y"}
{"SWAP"=>"y"}
{"MMU"=>"y"}
{"BLOCK"=>"y"}
BLK_DEV_LOOP'
	export commit='9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c'
	export ucode='0xd000389'
	export kconfig='x86_64-rhel-8.3'
	export enqueue_time='2023-07-26 18:21:32 +0800'
	export _id='64c0f3adf533738274ae49eb'
	export _rt='/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c'
	export compiler='gcc-12'
	export head_commit='c1df6a9bf7d948986dc6a733e86807682f2c5e91'
	export base_commit='6eaae198076080886b9e7d57f4ae06fa782f90ef'
	export branch='linux-next/master'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/vmlinuz-6.5.0-rc3-00001-g9e46e4dcd9d6
branch=linux-next/master
job=/lkp/jobs/scheduled/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-33396-j54j4f-2.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3
commit=9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c
nmi_watchdog=0
acpi_rsdp=0x699fd014
max_uptime=2100
LKP_SERVER=internal-lkp-server
nokaslr
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/vm-scalability_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/vm-scalability-x86_64-1.0-0_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20230406.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='lkp-wsx01'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export job_initrd='/lkp/jobs/scheduled/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-33396-j54j4f-2.cgz'
	export last_kernel='6.5.0-rc3-01162-gc9228b7b2ec9'
	export acpi_rsdp='0x699fd014'
	export repeat_to=8
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/vmlinuz-6.5.0-rc3-00001-g9e46e4dcd9d6'
	export result_root='/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/3'

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

	run_setup thp_enabled='always' thp_defrag='always' $LKP_SRC/setup/transparent_hugepage

	run_setup nr_ssd=1 $LKP_SRC/setup/disk

	run_setup priority=1 $LKP_SRC/setup/swap

	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'

	run_setup $LKP_SRC/setup/sanity-check

	run_monitor $LKP_SRC/monitors/wrapper perf-node
	run_monitor delay=90 $LKP_SRC/monitors/no-stdout/wrapper perf-profile
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper uptime
	run_monitor $LKP_SRC/monitors/wrapper iostat
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
	run_monitor $LKP_SRC/monitors/wrapper proc-stat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper slabinfo
	run_monitor $LKP_SRC/monitors/wrapper interrupts
	run_monitor $LKP_SRC/monitors/wrapper lock_stat
	run_monitor lite_mode=1 $LKP_SRC/monitors/wrapper perf-sched
	run_monitor $LKP_SRC/monitors/wrapper softirqs
	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
	run_monitor $LKP_SRC/monitors/wrapper diskstats
	run_monitor $LKP_SRC/monitors/wrapper nfsstat
	run_monitor $LKP_SRC/monitors/wrapper cpuidle
	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
	run_monitor $LKP_SRC/monitors/wrapper turbostat
	run_monitor $LKP_SRC/monitors/wrapper sched_debug
	run_monitor $LKP_SRC/monitors/wrapper perf-stat
	run_monitor $LKP_SRC/monitors/wrapper mpstat
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-c2c
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='swap-w-seq-mt' $LKP_SRC/tests/wrapper vm-scalability
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper perf-node
	env delay=90 $LKP_SRC/stats/wrapper perf-profile
	env test='swap-w-seq-mt' $LKP_SRC/stats/wrapper vm-scalability
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper uptime
	$LKP_SRC/stats/wrapper iostat
	$LKP_SRC/stats/wrapper vmstat
	$LKP_SRC/stats/wrapper numa-numastat
	$LKP_SRC/stats/wrapper numa-vmstat
	$LKP_SRC/stats/wrapper numa-meminfo
	$LKP_SRC/stats/wrapper proc-vmstat
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper slabinfo
	$LKP_SRC/stats/wrapper interrupts
	$LKP_SRC/stats/wrapper lock_stat
	env lite_mode=1 $LKP_SRC/stats/wrapper perf-sched
	$LKP_SRC/stats/wrapper softirqs
	$LKP_SRC/stats/wrapper diskstats
	$LKP_SRC/stats/wrapper nfsstat
	$LKP_SRC/stats/wrapper cpuidle
	$LKP_SRC/stats/wrapper turbostat
	$LKP_SRC/stats/wrapper sched_debug
	$LKP_SRC/stats/wrapper perf-stat
	$LKP_SRC/stats/wrapper mpstat
	$LKP_SRC/stats/wrapper perf-c2c

	$LKP_SRC/stats/wrapper time vm-scalability.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--yCzEYK6s5u2mHX8K
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj44GHg65dACIZSGcigsEOvS5SJPSSiEZN91kUwkoEoc4C
r7bBXWVIIW1d8ua7xL90VOjS12pSkksYKGnr3QZkrpcjQY85mvAb7yj9lWdQr5WSxmD0IAWBqslv
gFOt+ReQDvAKKD81VKyPcEh2Bfim09n/Bypgr3r42rA7QDzd5X8NQiKWL1DMmzMPWXXe+I/06XP6
0udrYmzv0TqcmEoQKHC847qdssQ0ms4aR818iyS/dAU+D5753yhKb8H5LDvRa+cAOXofKAdQYKeG
x76KpjCWjDOdvd7ougct2Md3zqLmL9c+ZTryNZDSFeLLEp9LwN2KuGEROGXm/CK2Kp78pKWjJC6O
yOBwL6LV5ML3XDf31QvGWPkFbzLvuWnc0+ejsd6Qgd8sEFIyIOh5nYhaYmzyIGixbvFdrM1UeB3b
DXOwvCLy7PTd9xkgoHaEtMyYpDBSCgW8ElO2dOTopVd0ZFOYc4MnYYaxjCOYM5CxQFXq/v1GoC5Y
deKVJC26Lx4DyaFHQkUGViukEuv+2muBiSe111x7pI09X1ONPcNxsCBW7i20KawgN4p0spI7p9zS
tzD9GSZop1rDpA7G9NiHNWLReB/sjOXCCA6BtXZKliC4Lde9yvLwjcSdQYxmrGkXHyk63TBWhZlX
N4irb990mwrnq37GcdopqAE22nbuwmsENaURxqw8xZB1i82spfzKTLjy7vMhbf46DUnvO25peCO0
0GJUSlHwDzM53U8TBq4v0nc8iixXsgiBoSsJsJ3R/3ABzuuxIoXyC9fi+Yz+GBVWWMr9VHKBnvsP
0gpvKDtbJEyhMQwWOBpu2PlhRrqFZKH1YIjAExZiIQUPv4vxw3uK+jg/By+Ea0APqM8Fdf31Ll8P
/apbNDlRsm25jNy8CPN9oKw2RGKG7ILJtxEcyWUeDV6yP5MxIxxvNAS3rcLcCLAhLLJoM9PlHMl3
L/Tby+aH3bihatb13YaTs2q7XbKTbtTLoul0z2tk5KXVkZ2vLlvVsb9UljsSLyAJy6vYrvfeob+X
cyXtsSxhfQnekDbv9kpqRdQ6DK3NrVPrdefLTt0dgrNaj3sRf9P3pBUqAaXxIlmrr3X2fyeQO6gh
CR0Bz1jWKiDqlG0OhPLwwadZQHxNNCeSmWBT3NDAhHIMmLTY5r3mYftsbac2zIrfk+wekjLrGU4H
ZzRXwB0CHjaj/A1ek7xeWqPADX2Q0qruLlDwreILpQ/gxHHay4FHe7qR6/zdTRQguhdXfoQDRzKS
VjTicBrS1j8ozQFs2OSXaLBfD3JFyJCc4OktKTsGrffrfXXCA92H/umrMr0H9pxbWYy8N5Bz8FDd
SA36OXVxbbHpkrxu0QhASt/ljg9lLBoiZ9eDLVFwm37iClwlKlKI8f4yvRV7P2Ak/dxP3mAwaNn2
M3z+6sMBdl4MxGYwGIOuWQZzPBYXdH1r87QCVwLtuq6CW2b3caUfYEXM+NE9HsVNGgt/OhWYWLLb
Mf0WD8IUUjo0napatiBz4YO7xyKswf9/QTHSKW5VnPJu0MnQ5VKgW1Zzpol3Kv0SoYhDBfMeWF+D
qM9oEP2li7Z3g5fTYrzE7gjhqFg9aFgkzi82ZGCcxdHcixoQQT3FapAHM6YhI6FTDMPgR5aIEUs+
s30aT6HmeLQvsl+ypjtEHMTts2QVIktl8qZqz98SqZaOEXCnRb/HSjfi0iYZQlvleKPcW1xco4F8
D5M3jPKXQDw7KQbSZ9nmTCkfDBpy+AWn0NSijDc5xLKBAcHtLqF6CiEZLHVzR8chefTeE2IH2Jns
BnuDIs9LyFu0TooZxtg8BUHMFae0pHUQwLfXdSS58kRS40lbY+dK2OOjJgNnVJbTH9EpNqkeREtW
T10No5d4NiYBgWSKNjDw9ll+dzORgkhRlOwzaVDEgclBOsUctsrCuA/v3HcKEmT0Xcyd302sb3P/
VPDmLe6qh8JwFfCkgHmYUsKAXLitJ0knSKbXGLm9vm5KQowm8uRn7fcJ9RtDxUTilL0CTx6wYiz5
Rtdvddy98XlTfMihOaWsDwRJo1KwRk98T00fNj/n/ZebIvioUanU0UHTm0b0ZDCRe0Vjkz3vWLX4
dLLZQMtAxuuoTfI4sQXGp0DO2BQnd1XUPDJl+aNW2GTpJ+UBK2SjYS3NeJJJDxdE/lDIapJQYRnu
lcd11/DMHcOg09NUab89cOKiLEKPKxEWC2uWxlUyPszZGzyKlVxQCNIOtGEGJkuK6ougIcHMFJYv
TpRkEnGzNZu+9yiddr3QAzvFug1uDhWGxQaSFjFH95YCCoFmYw/CBe+Pg/HnoOkcoRM5VkwkeZLh
0Tzz2cL6OkpFvugG1Rlb73+0UoYua67VuoZq0Qpba5r0eUsvlVYm7SJNg+wSJz6kO9A9Gel+jL7z
kX3exQu0ap9dBy0CWorMzXrnppS9Y6/68zMTMwwspBj7lCZapPG3JYle5y1At/s81uQDgqxKoWbn
0QOqxD+caoVNbk7tL5GRUPIXwiAMDMLiRu3Ekza13KPHlqyi26OsLQwct0Qav6GuaII5V49yo1+/
fmshYbtrp2lGR6/Qb783NYMFzZKnL3pAEMGGAzRJVRIj9zKtTMr7xbmUMnIPyQgbfX1hZ7hwnxFt
DAqzsHqBC3fo6ctYFZKyhLMhIZOfm4Xx/nsJVHPbOTtktbHbjOMmdKo0+1NFARHbbfFCRKI0jnMA
IV4zUN8PoxqYF69f41+275vL66xhngftpU5lwgbq+8HTDlLq+WhXLmFzPZQZYqny17VkIexW259f
16t54SV1bLeFfUcH1oBVDtliEnJLeyNPeo+mKeznzSnOYK3wlhVoy23RWMyrb4v7r721Pzk32GP5
OVKdARefxyVT0i9s21sHsguALvcaJj1C9GFxjezaAH80eizkvK5jXZ9PovR3zONulQxHLhZmRk3W
v1/PhJfhIr/JYW/QaTVM3lpCxwKHQHZSHXojt5NB50RYkg/iBSSShX5ikXbg0tQGZYZwo+Ppb12F
kMAhWox2p2QgF0wYkqilGYK3SQZBiz6iPzhwhzWn4RAj1Dx14RdkImVuFrmUR/sdnWaCuj4bWml+
EgK+dZtM3ZI8R6bFzUG40VhXPrQ6bkiu8mbAjGel4hp4WS4YZgxFnOI9aPVk8J/eEs8SxT1Zg3U7
Sijwwk0/L2QsaEH5iIQQBvKtufn/O8A74h1EpcN2fmTw+CTteMjjQ6Kkd0br00EpHaqVCnAB1yRi
nsk83NZ2Ops0CLdkKfrVn13NoGevraMZIasHB30DyF/v3Sw28QHHk3PjMCUqmVOdimllaaja1rA2
bW97rrub/nFiMVYQdrooMb9i51AHWetTK31dEUcjLXqImF9pkt7vedBNlyXP90+mymRp/eSVT+qd
2ySY95NN8lY9jzgx821AmYchifvNlMvKRMnm+WdDJH1lKBfj45OkD8nktKfFxEDk5JSaUq8w1FZu
hCJKXLLKkoYHqcKDzmqnCYulbxuVJsF/gbQK13VXEff+DeIqs14o2oIi7nBkzEVNxT4GnUmTD+L+
yl1+4bDux8p+oiTPEb0pLTNl2yChPuvkrXP8SUvedbeeGw/OIvWZOVxf1asgWwdomQUXT+j+t2TS
kpgiUr3XIb3Y+NoJ2P/o+m3pwdcVMwwSufX+2I9bPXFK54CdEfUvHCKnz/+bJ2qeqTxjT9BvKq2M
ZAiMSzV7hym18K+YxsJCeYKNe/pdWXfcGlWTuCCcr/hA1gH5zHcue5BqivnpHUBO4UTsRmlUkexW
KbNKtV2Q6liefLIkf4gUfyY8vgAnbkGRjCRWSosNq0H2arAw8SL1hoZFlzBWD2VPsFTcqf61fGBT
47HTr/X+tg116DGzxM0WpD5CZ+gbSuEKsEf8ID4MlnFlwnesT/OiXzi14r/GrJTIRfD+zv5n4q0/
nysZcoN3meKvHOzNcWzE3FyncPgdwCkvodB0soxUWD0bVJPha4RB1EYKYITmutG5WGkzqJnjpJkz
dUMAEPBg1hR/7ScYMuk0pnrV9mdA9tR4GfrbbHccX7AoB58Wg+ZcAcXTUywZPyCf5STxc/bKwP1H
YH+kyd7Vbl2wYfzCOeT5X4pxSVy9rkMQWYOAEliTvfwmLbygpHPf9UPuTKDXr/TXCc2mOrUOeQLI
LxmWBDxtYmU/Pp2RvLZbp+NtBZXYKsCiyAjWvntLtjnhwb/38oAW8A4B4uNTeubc/0QGGDferVDM
4tN4jSHS0OPrL6b/WMrWG27cfeoJ42jJ8rl7VUWPnm4aqi/Mt2HggLB/nsaPEU+hH+fkJ9R7xi3f
aWzXEiF/p9Hlc63LMkqE1fAz7Bwv0h9dZt9JM9rQSZ25fG6o90p/358Wf1uVs46RUdHB1Vc4XYZP
m+QHIeYqmyQp0FDbh30q0SJlDdnsJ3+NU1E3UYkE/hYafAR/Eh6c9Q2ZPbP1iDiNe/qhQq1L1Y0k
cxipcoNgzdfwUrPiA8GjbmZjIHrolELhNJAANejjIcyS1zgQjpf4PNuk+J7Vv/XSbAmV/+pYHi4k
+HVkFvbffRLXH/hZeQP4KztiGhZyr9u30tiYAJI5s3O8NX9JPmQFufCNXJnIEgdy6PCVfAVYUR0P
bOIlm/I/SJFapzCwCfwEeUwxtZsHTqo8E5WQ5ZQnmWAPb8u914kYlxQta27jzM8oilfmR5vEMsHh
vv7WJu/rcmUdxyo/Xm/WW1WbHt2QIDbFzpu9FSNK9YamxT2LsaDeAqMNfXBim75r57cBZo23IVIL
GqR8LTdCI5bjKa0/JdDaUIqZliostbEDSYanX9zY+e9VA1i98F6Rws1GTH3C1meMCV2v6uo851no
Rbc7XWJ2165nX6TY0bGMXdFrrPxJlgsXI2rwGXYuhwt2yISbkIEqLfyS5DSRt4cgHjE9n2QPq5Sx
Em2CqJpTZKTXbRAiiuWIgaJvN6HrZ6zzIlJayhi4Xtp1EOzD2RSgMY/mLzhq50GtyQ0I682Ez3Ng
MQH1rO4Vd2LGa9yvY2Nrc1NRTtdtXQsB12O4anVVb71CXjMU8wlE0HX5qx9VTVdoQ+kpJVY9U0to
PkLDXd0hn562loQJgfFoPoWeNtV9TtwiNpDjgxO2zyXc/uAgmMghAMNdP/VCKMFE1qfC4hH+eDk8
hzXmDIzw8fX/nhO2J3LnFz5gnBi/QaxoyDsI7KOILyvzzboeqh/FhxcGCE/l+YsGSFv5+vmIiyJg
ekjY78QPE1lcn17brI16aC01oVRLycakcS6nLczcRNXCsnKz1rTsPcEwqDMh5qNbClb2GV4QTSZ6
TNI37Y7gz9GHQ4XsgYXhpzuTTkHgYpS9s9prMZlYDwil45gAmf1oLmiSQWhKVilrLEnKr1PRpdGm
OP2tMw5xkAwc8DScwNbj/Or6o5rkos0rMfqCUlHVs7EbAUbDlb7YcZyP7D4t4oUQh3bBhcWweiT2
SPYUaNPKn2V2cl+dWg9m/6a61KNO/AKkMsdoxQQclv4XuG8BuGYLk06Spsvh9eIoG2BTBw/ozIS1
fHTPI4Q3uDnARPRf7XGO+6nzpvQy6L5UsLO4WNrFkwdtyu3lPbW0FpDPfB/EVSduIbU/6SuIIG7L
KrqzRpjigBHXjiopPQZ+UhEhWg5wxGTN+aAD1bcWoTR5+Dv6lnyHemV0MjA6HEDQNVCXPWtv3Axq
iicXjMcGWTwpIrSDKxsd7dASB2QEyYHpsoHap6UDzF9I7DNugm49LZBOB4urMO0RNmaHAX2TkRE+
xm72ABfSl2UhIkWYsYr9/Ai8yL/ZfJvvixjxiUlHvQ+4P2RBdZoDB+U0B4ZT4TiXE7waiwNPcC/V
MmQGzGo1G1uAaIdVuVzAcDKkpvOPz0u9PavJAUy+qx6ZKxL0a/lC6l+J3uozPbY9QpWWOxiaiETt
GlHSRzrLpaFiyiQgPoQzOGqwXtD6Ad5+QnuUXQ9H4lDhc7MK47VI2FWhyjCelKGEEzfvQPp7rmFk
inIR4a5zFVFwcxynwrmQr4zNJ6Lk1jeJnbn98MrRttM5qHjJ3FqO3J/p4T22jXiBYKiUbjne5S3E
/kGGlRzhaRp27mW1aNpPATvcpLNUl3BXWkucWE+egTi+lLDkYYn2/f+3TZN43mqC+g1gko2RNkqX
arTZXzdATKJEHAaDVMxJfffVIWgylB4Vlnt+9kFrDCK+BdNvD+b+egtJgTGkFTelRA9TFK31jZZb
mU+WuwpIVLt8t1AhizPRsMzlYusehENto8PBvhDYKl0kYgQrg3Zl2aWGfRMFBBrO9h/bSgk/r76o
mmnkhm1VU6wdhxfoSzKVbAohlLciKJa83WxhMruvWhbet6yp0falppNZtzfNDqrsLPzhcMtJCa0a
21u5OAXFfIjXsHRtcYBikDovq8LRhnZniYbARLe365nPX1JzmX7JPgwobayMu0JNTx3kC7j8X7ao
k9Lrl7hx6ED3FjnvRDZtPQv9VBfsKIJ61O5KdK50MELVXrZOkKmKmshihzcrc/4ll1I9PpcnrEGS
X+P9Gx+ZAzPM70C0MnTAphkoDz9xRm7iB/6lv37kwy2zsWQ/41PPBnkZrmGoHI3ta4sEsQaD06hN
R/40Nu3EjOvW1fFCP7d0YMJq+qtL1yn0l/GF4fghYlagzuco06AkQzE0FnNZ/AScUMindWObQTH4
eGePPHfnXORFzVAmCqHL7q2n1ac5Seiw2zwLUZtvMz0qs4vZQfZtT3eP7vdIAFbOKUWgQmHfHjW5
Y5k65X9zWRzNHssqe0pDTSBverSzGDqV9OFeVS/p05XxPF83n17ivaLs951ny1dn7xlWauC4kwvg
h8V0wRomBERXCfvxBMKumn4pog0gGOghHLgJ8jW9aNSmTQM7lQNiN9vn6LR5UKHGbWYoW+WNUYR8
5zeRIofYzfEZgStc2WaBV8QbAyDzlqLGxCdQU9DcDbomJSe8WQReKPPcCSOchD6Q5UjEjslwieDz
zlhmLkhQenrI12qRM3ytp7JB9h19uujn2hwbB6PnLn4h5Frsh26U77Ol9FXfIs/y7R1bISjlBGlT
0K9V4NinljIs1x6PJWaGEKY8feLAuB8RHFrCsKZ/1ISSlp1KyEaFqxuHnOgxRiq8/+O1qrU0lLwk
Grz034g3oOqNn/teatULEJ0nCu/9OY4naZVEOTUsCURrD7zUG4QGpz4O6W6i9wvgH76r/4wXpbGx
zXgAjlYBtCcJJtQbEoKFkIziSBerwnal3BHuipt5rsBD3smJMqe3RBTTgbOhQKLg+OxnYbo2l574
D1/uXocSbADWzUgQP9xOtDC3epRCbVWp+LOR4wDHsvDXrGYeJtZYeIrsymWIbF40mIklaVmFx6ID
rN6/JlDktgJqCxbVeqQDrG+wdlLBDluI8qTLCb1Xg+yn5eULmXucz3+CPB0LdT6aOM+Z36uZ1yMa
I0dMvLuxHmenTgcK75NTOXq7FWU3671M0mOFG+FHn+QDUDSLKeWYiIcV0TQRF3uR7nO5ZBzcpGuZ
8InS3rBJjRlYxWwKiNp+/u0XeYKD98dOnmqDt/TWE+dkjx55wjLj6Dmw7M2D5qL/CytabJTahVEC
TcmgHshtvATgBYzziaF+ZKiU1Nc90w+BZ5ZjVeNgtb6TqnOT8kMLN9xrM+JLuiAcnvOyGT0CQqkI
7cHd/1YK2r3whyeS4U3j4c1Q+514ptWvWlN7jMFB3wCwY4Q+MjCKm97YdlnLiuoCOTW9OChDI9T8
4TTos+R/iqCCUPV19Guhftn721eVuT6cCCKpG3qt1D3X3Hc3MQHjvYRYQSRmPD+5yXGrnnO1aVqN
QyHAU4uxZlP1h+dMIoo0ZZMoiX4r9NOPTZjUCShj4NIDG5vihYsIEgsQ9N0lgQsiV0WNJXdJguKe
E5uJG0RFusomLr0EvbxRflTjr1K4rnwo1yThYCrjuW+Q+STXPVyZnc5Cm5XCuT6Wd5ELhuHur0vd
bRTJEF2+cF5xuxtXd2iiq2btkbqaTGKTJgZNy1ZXH6cx6sQU4jKTTZSuxLP+Ogix6Yy0dSF62+bC
uZB52lOrnmrfrJCUD0cQ424d2yTwsk6/UdZFfgIKgYErgH6x5fAjEPnbY4eeXkEvqyntiGqH03U4
K4yw4ImsD0uLSYKW9xe+Uzp0UPRCpSYanjl8en5r0NhIbOPzoNJzQw7vaysjTQ7FBXjCUp/zKsQv
Jqu07iO/0EG2GGDBJKtT0FikC5fnFhGnVgnbA2kBXAGVCGMfCfAysg0uGkSRt4OipY7M2R7a6+47
uDYmq+kvGnW0rtJ26SX9OQEcxH+N+XPUZ+tJnG2V3GfYuOD2zb8kKjdiDpcrwYYF49uZLYdbO1fw
srnXMQS7wVVvsFzBklvZLgFOh2BcdgnAU4s8y3lcO1lJBzf9xHayybvLpD7NC4rxLkY4SG/VsFBR
JDc/b6N+aNDF2cnQSJrRhoOkb0+njTSvO0kTdnYobEYdEQOdCnAJkKTBangtUDxQ/aXatIyiqIkd
mWsKdKH6/4FHn91lhOeGHHwazBzBZR2Td2m4ZJSv2Lzh5yzpeTIvaDX2Y20GUWnALEqltYtTl11e
PWzxycESWFlgOl/c1/NdzLHNITy+aQWX4/M4uZzKBlKND4xvvRMUc1T8Lfy2iysQsPXzzs/DDXFm
KhuUPvVP9nDapxGK7cn3MBQLj+nz8fTmsD2punxSivTzi40jVq6hzB46r0B/XXla642Cjoh7Vn2n
myoGzjt0r9IeMgNAuqKqVoTF5oWeg/oLAkAVK2g/qBY8SfnV8UV28I4EnGsqveXWrEvl3C5KP4kg
Mv0k1UE6B4cbo1Sw84ypyCzT5VGwsw0BU/+aGoNoyDD8X9ob2FGzrC4m2SgO/dq0Clhqr9+XABSK
zDzkJH3rNnHSVii18R1oUU/x4JZL/FiiBVZKbuF50GD4HTNyj5ogKqeWIsmTwmkqc13Jvo1we/SW
20QwtK6ubrJLMTHEpPcDcI6KemUjYRGNdShwyA2DelhrsJYezG4951VLJjteNcLlgmWhGCIcYHZM
vzI5CFXAspetLV9kefWMTTeR8pfZCoQvJZjQoSgAapVS2EX6cYfElBN1kJYn3nZFsVBNwpQ/MNxj
4vgPvRRzDnhvhjmvtsI2DJDlCgJDpZ1SPiwmHoSQNrXIgp7iEArWqlCkj3LZ6csiAIUJGlnw3Zpr
FEJ7eD6JmpVvqk6N5Xa5xwz99ISytp9WwNDyb/lPwG8LAitHvlCZfkV27G5A14CL9AeYwZvmVHK2
ME9en9XyzlFiqA0S1izguHiWAVm/s78GzC624oM1RpLCauZ0OSAIXIeVsuK0DFqunoOlSHAUqptG
gVzyMwseYzKhjmZcNWQEnfUpe+tvlisxOi/QU588HEMPTi5VOukNc+9ebAsRN5suGaR+nthMgyGM
sjSjxf/TRs8wKw8agO7K42E40L6wV3V/X7hNDvhNDAQg0lO1FYGmx+7jsdMv0ZgssGlZNUhPEyOz
+SLbyNb9wgTPFKWIzPA80YeM1nxkHR1ZS/Tp2VLQ4zJSaxlppx4dkjDMUJpwuJlS5D2qny69LlJ4
jjF8Av1lSmIAX3afawAHKqmyYL+aYNrUPfJvOp2ru4HpeDc+NjmTRmjSOB9Y8p/1i4CIZLCkEeUa
TvV9woV+Rlaviid5HDIMh2ZLXRo54x71btR62b6Nxw2TfxNqW+wO9+cI6EbLtbc3KMcGlH1QnJzh
kTEhm8Lcz9McYgbmxZsy7jIhRv9Rx8zbzMXirGJNOoA1EbFnsn6C1fiIGAS0c2uzLjcWbJPgKhLs
qRvfryovIQZXxR3hkmf8WMKvsx84pgxlTMaq9kEBl8iHdX5/MBFwZC5xqu2z/bQEu6aqpA5Vl43l
/mhH3mCcu1vnJwe1rA3w2NE1P/0lqbBFj4V0xvUU8gQ9cnNXp2pdM4YzyOGAoyks1u550G8e+K9s
ToNtNMxfdB2iqchPOddlJq6ZmJzmY6ro3HzyEYeZrkIFyJIqJd10LFSU+xs6+HdVQjn+FtI4bf9S
zIk2lGDWknRbtxLXm0gdJ2/W7L8uZIGkujL35gZwOrIx6GsTENxoxiJA3tPT5rYJjf+ZQf/8KpwF
ww40tT3bf81xHF8+Zju1I9eoAzhxuRFA8MDnylYTYVY9uRuaDBW8XPJFt0z/0bebJWexKLO8ozZO
Qy0AzFrvKMH/dfqD9Qqkq1dH7Ls0Sr3tq9elwVRTJgOcsBBiVowIS0Vu3y6oYj1dLMPiKG7YVYpz
9UOJmSD9RSfK6MhCoYsTpEFP//nIHTOsGU3bT9CqImSzMiZuLJvLgbwVOVpRomvZlHpqsgvphXum
/c7kjrtN8xnHTEfHw+9qS/JKVdU0p7aLake9vl3CpeFKwXDZEl8D60IV4E0eEn8u/nK4/ruiAwtb
5AVHz7b1tTU7HBjDbHuVoCVx1nGYMLhgA3nfLVGVUDC0Y8tBHku0a4nTiO86UJi79up1ZlLRyKNK
xZTKp4l7dM56nFvZFLj+ZhV9UDo+Vnu5QK6UlBHQhd7vOuHujO95Oe5s6zUPkJY2VrPLricxaxw1
wAKL9g3nP+sm2MBOQ9UdUIu0W4bV9rZDc9r44f1Yrjz/vzQySOCCM3+zPsLgYr4Ejllz0ZDGEkHo
TwZXg3jgQuFW/D4b7bPXzrHFDUvtZvzy1pK6O2AcPBOjBwNjbF8c4B0OwRsJkyL4rPMXIv2AVRVH
AEetv2LTH4xlVtxyCapT71Ud3tuk5u/w0LDGTdD0/DVxXrfr/nicFWUo3DIRO0flZ6RGGbHC4UXX
ihnu6pon1+jdUL0g1EipTJNTCkSA0uSF4RUGU7ftFkVEyZg1lD/LIrBgUiW0/mQU8f0NarOIQeeG
mpqQhYaMeD565Vei/r3TBQtawuDrnpqzWnOPsBosAVqHQ7c6YJlgkSDY9mEFm2CGp0966DvAEG/m
rXCxp3fk28/0lDEncKWs4DKEmKCubqi7npywUhsxLw3BGJlmaQw3NzKwqZ2KiI17tATKFV5BIjT6
p29C1jEDsW2t8nOSp18iORoyrRC5JiovIJrinNaOveoaKvKDhTXCvJXN9PSijBeJ6K3mv7Aawa7W
REN13wI1AzgR0nxoNYGSZnkWs1+wGLAqFT5zwRAtsWo35AQmWP63yReGwo2zpyhXvZi4rStS6+rn
EJF31He+UX53UHEDqCKK3KRs/+/f35fnbx7uBmrvCAjEXQKsjNQLuWvjTZkewsvmonZctAeVhwL8
6cisxqQ7mVdA819I7sFMc4bfYgcpShjGkuv/ZO9tb1OVOGwVDGjGVZbiQ4FR3z4mm/YYCkHb+E/D
hX4efjFdVufSCSQA640IaCjihGc8Ya8+wJBknpQLOk23ShC6bJbu+t208fXFjPDM33YiMdXR0SGZ
loTpEJvnuEv+FMyRYl/bagBKgykHl1Ya/a7VytxBP8vcl3N7LJfbvNHFCe/8m4ykbgKfiI3Pqz4v
kcXO2H/+Y2qwxX9bTImdd7nr+rU+NXJeTHfFSN8mDUKhM17TJqpYOylkAb9s3Rn7QG+N6lEKWMXc
Bm9MB4tO6ykmCT/9oa2RKtjqWZzgYg5hU3gbd5HArLcpSQQgXMzWT2ZYJOIe0VKLWqrXynvSK2mI
7H+8jccZZdtiWwW6GJjxsvIqmmAPrBwaF+egBWpLYZbzAlfz/vJ9vEjbZkwJ5CPl488UpmuB3LdI
BjsR8Rq3Oy+YVsiaqEfK89sAtFzmdf00tMqw2B2jz8E0a50Pe84yPXr1HyOzb3uyJWfJMmdyvMxb
sVXhh5wcMS+dSBAeX1SPHfWek0ds0Doiu96tfAxTFaTLyYlxdu189Q3WB2kD5DQzb4HZvppT/iUW
4sfbuS5nFA8eW0UM6DAnSoW02I58oKknNuqAHgvbAEtIxCKiBu1oCzyBrS9rQSw69Yk6V8B2ta/2
251rV+8ktUh58C1AccqLGqdCWhAKMp5g9Zoo4F1975yFhUELIU8vm95mkkJeQNbHGBWgkM/3kjp9
1mrXAprXhdhxSB4bNiuiwo/n1dNL5wdBahAFapGWzmCd/GFJOeq484IcZYo/18pVXTRhcC+V8dvP
XgjloTT3P9rj9NQvUVmiumrSUKs6z5o0HykM7v5eDZBOAL0ZKy4OOLSHG85wxum6l49X+Yq70sS0
AlpWucl4JbI+2YP9sOTPipKAf7/GcMcxeWyz/mHuJRn+y+WN7Azz0HVtPOTvO+WVbHUI+s0BWZcg
62twWHS3LEtp05uqbm8s2LM+h52XxIjuT5ym+u8+Tn45ggKK4p/kvr2KZuom/zrAR90pMR/E/zE/
MTm6sPM5EuLoE012L+JsdNaVyapjgNPEUR+Lzqng3vqCwshZ4/UR1arhYCQ9vOVNQp+eGZFXvfCY
mWyoklmzbsXKH9PHn34QqPEXwB9AStcYTJiUuCz2Rb0RcuOO+tLXNeybddp5A+6W3MwdVjLOX192
LHY6wOzSpKVcDk8ffdL8ykiuibXMhy5Aak3Wl83T9+YzABp5ewcrjtFkNJeR40jqvIwN5BCvkt4s
uD5Aq6rELEPs8yIASrPOVEUYFGx2tHzGug6e9TTRg1cZCFSjdYkj+5AoDrpwamV81sfQDNoB4ZaT
+Vm4sIW7cqAaMq6el5hFNGH49QmJAXWUoEXrX66RCXHwj2sivTbBDEKkzWXhJQy1O1yzSLaBliVV
o6/GIUV55GY2G5X1r76srBoqD1jvgayGxgNWokCIaNvy7kxdSaOx4HgsDmV2RJcnux5P4Gtkr+8Z
dGYb8FCTzaBmxLpR7ekkFKWaR8nUcs9U+VsW+swRae6bg380fs1LuIjdj7dbBIbqbICELNHBgIE7
D4yOKTyWzu2XEvprNJYmHPknxsE3Epe+R+1hwH70wq2M8G0L7v+vitedsvbDTe7rCvsxJnpnQlDj
6xyZixgG7IdUYk9YUxtrWlRJhJ/9D2clEVqOdumOEJOjtlYWGVpiYV45SWRy00lstsTdS3I6CmjZ
4qWREYp4A3ONwF40ovevkvAlvWAG897AioQtSLG9TQd8VWyojTDzF1yWkaQCFm8TaD3pp0ZOwm+c
/3pbdkMjwHtIli4BPkdLjB6F707DqUz/kucDb6h7ItR4OQv2a6bKVZQB7zv7aZtyLNzacEg2PXoy
gLGXK8qIW3x5nurFYY5ZQNM7/yp6NGRcQu6qypcrG/IK2G1hibhicAU+wIx6hE6FjiaJJGyDibwa
5VeYZMdmtYx0oboXNDSkf6Is6uL4JgCgqmJ9orrIqhucPIGZOJgwsPH833Tg8UHfBsNK2NfIK21G
U661OxRBKy6R12DqalMnwfm9O9y2b5ytILhrqFRdFsC7Xtu2trsPBByzgld0LVLBcs1of+vHcXeS
s+h6xZeERFk00Ww1P6F7P8xFeCnmuIlqqlM0Gxrn96Bhf7spSIowqkUo9caw/MrRo9UlrN6l/znJ
20c3yMRKC610dzm9kL9aBdIF3xfvZtwwrNZaD2PtGGoBSPbLvpPXwcDDNvWeKtgYHzZ4zeowrOMc
zG0+L4+jtzWrQKUv6gNdngaXX9Pl/5iXsvmJCYbLhNlDMSXeH029bvxeTuslfime5mV6Cmu+LR91
X5VgCBXWV8jWpRoQVt+VWrzEojA1L40hLLe+AWDrcvTpcTiSknCxx5SOKai1nh48wsr2+jEHyZN5
vnkwDop8k7bA4yrcXUE7NmmYnm1zCXoLz00Yy7Cp6O+m1K+7OBcRcuVWHpRYun+8H1PkUWUh/4dR
PPuujCnGLGxVadsoA52K/RoSomgTqvs+zd2aBqkp5MDo3r/Nsfgx89MIJwpcQxMLvDvu/YoCzbiR
/+xA4SZkFYf8GhhcLofdq/muJwKvIhcFKB2rAYUcEzvQCq8AtSP07CBULURmvbsMHZeGfl7/N+YP
q0EcrMaau3G1aXCeIOC3b0eVTT6ON2vF+RITQ+3v7v/mm+ZIPLStxhNzFpKfu2um9q5vCw094XAd
VE5hEuHHq2hn19cfmQHdJeaL/TXsOHHdBQRqby2LffvjzMZyxZzoC8Z2Q83Pg4VqSYXRNBOF+Cuz
Q+iETlPQ/Mw3Nz6NoLq5VUotfJGpKWZOS4a9+McL52QsAR92hPG6pBEVBzRPL8Dr2rYn9MjIZHJm
/NsWBKF/bTFP25KrC3G3woHjfqlLHHDhlF8Skd6VMaeYpmHA55CzSYC14QXUucqlAoTNQTzN2tKr
bbLMXhrFF/sK1E2XxTfFzWSC37Wx89p3/X5mOmFQhfsn3iaj33Mi9jWsHuqKBdLjCfuLrsmkbFfV
1TKmAj265o835xc60IPoZyQQjlPhvH1TBHH2iEuHeNGStUCn2xboF1PM9BwDyc5Dcbj7HkdpIIJa
Lo0jzCEhoyLA3UALPjZ/wUdLO0n/BSTdwVBAO28KH3Ne1QJ9LsR8vW0GyV01M+U942Y+r9uUijRm
iZ+2W3yRkI1SY862lCtlv1kTbJF3knlWagRpQeSKecftotEyODGzAkBVsQ0utK+IzTjFOSNGka2O
ArzTdRo40YFeYppSSdSQ3an7ENKV+YuPS/9pTcWjfJQzPk1Qg183YiyE6Ob1b3vYt8e9vYEn6592
PrUXJDsJ3xgY96Tdzp97rXKeHc4f8fPBKJp7iWVlWo9Gv3UGqmdMcOuPj4mZPwhIHZ5iC0I29Vz/
+ZiUEdt3BfV97hotdYsjWf3yxuLhkgHt6d9pqDiOMs/qbOogn8MPvEUGFCn1fNy6eJU5rjO6jLD5
bJPHCExn/ThAKtcnQJaf5V+QfL/8yJW4m7HtQuHye0Vxxzq5AfNKdDmWxlT648jJ+QOnnnMxXC4x
IaDNlqCDCn+CPl5qhqQrDr5JRiy3sItzMhHlYAsk12lI05z0ENKoDUtWW1UvI+ULIjVIoAUEwJlG
jDExsDVmb53CT8SHSBDqNAQlhDd8z8JoVf8gpRIQv31i/z7wJ3CkwxEgMkMipvgODnfxhypJPVrX
j6l1AWxEg2+EkoYaDxJs4gGtDNz/eWOFp8Pqf6CAQBjaL4HjDEE1rKDUyx4IYhNRw2jtUyiRB70p
z/TOxTU9aHcKFG+rdyTSAWTAyGA1mnAYvotjqTeC6ZYHYRQf8Z057pNuba0h8XgBV96nIAt2i0v7
KUbbDVz3KmcvAODGJrJC74QZYM5vnlZpbT92NwYszJ4gVqu060zo0lQixNuCFbtTfHFu1q+bGBJ2
iU7aSb9n4dsMRhyRJ1UQyv4NnRZKevELwjqH2AGrQtS7/+nqDtqAcC7hymPfhzaflOF807p4FPB7
/mcRIs2/Mtd8SPk5sSZqj1M4JhStQZrzdhR3U0CA2QMW0GId2BpJGukApOMd9uScyxdaR5ZKvLvX
y6jfy0XrYTL0FNmUQiziEN+9PrflfD+ya/XVOquTYJdi4HQhNX42IWTIvO3YHSLfhU9O/+XErcX/
ir54GD4OjyxoDRWdO0PUSUNlmCOREexRMAkPoe1dOhjRW3ClxPzGMaGql67RTC91tyV/fKIHSme6
vYLKs1LvRVpBzKE4/I3hKqDcPbySvoqK1/PqIhyxzlPhjw/O/BYy8HihF/gZi0zNiMTvPJtbLKn1
i053Rp6yVlpy6u+U+uHr9kF+DqWFw4ZchDOusi7BrgGzUXcogXVkpbLlpuAe1lElACv11FNi7SRG
kbyuy2bq3DdnTFGDFVC7mpR4FQoqP6lGyTfF+JHktPfvZKht62m8TBjb2dp3evFPXEkKN6G7aCq6
i7nvX2tFyXxfd2mKNMEkYuOQzL9uHa/U9hdC0oCnkXCDMoV12iKjEtul8mKR7BXUfZfrZy+D8Afl
iWceLJs/KCJGYaLrXF7Zce3uUT9uk/cACg6ce5+y2lwcKS8WFVXCfyna18jG8aYJx1R9uBw+94b0
6o0VcCcCAuGHb/R7wfCPCjn6lCiXFfPSocxpc/vBDWOX8o5YJZiwi4fIyAde/RqDO3HRelWfaAcr
tlVVjt2Hwm0vmqdAqxuvlBfz6pG5D8AoVAUR8qiLUX4sip4OrF8BwEdOnwXwu5EAXSdaAcb6sWQw
2lHFzE91ahjdCotwvbQ0gT1AG1YR4P3osA8fxJ4hkrecKoYRlbdMobC3ep78iHyJ68AkQKkhwQMp
zbm6zJ76jYhYgwqWw2fihQ6sKJgrLXUOXhhpndOFSmsffcuZ4How3ymZD55bSWoHTg277tYRCubF
l87ulTGNjpwYHAQYQFCMZoa66Xv93GUUyOmgvI/MTk90Kd1SGS8X8XCne1fCez7Xh3df5JqrDAfa
i83S6wU+OHDYS9+SK+QKqxs3cuM2tNKVUvzaJqJtKrpRwPR2TLFZAHgA6tApxtn8YbVQCfNXX2dt
A1BT1lc+YkvQrgmSYVatSgw1Sox5QdeOrQKm9J8vU8nRb1lUp7wy0vEa53u9gS/lRw6EWjQlUZdF
X7I3VvvYSce+Qc/ncnG6pcX0n6NgkL+AEHvobaAUGWAtnFNDCBxOPx5uoBF7WGzr3e+EQHKhZa0s
NgnM1McyHVv/CVnH1ImCp54maJdyeHWfh8QMX2cOB9TZ26DULjTW8G5Dg8RmhlI6QIJ9+ZM1cJvu
cIaxTieyIBIYwDdfem00/jhS3w3eiz/2HFg2fgMkpx7AeaOzqEb23CCwfUJpcpCJeqDBJZbsnPxF
K7wVwxBekyK2LZ3CJUW5LKGlZy2lF09ezyyQCN6ZX6LNQhAORS3Syib0zn4MsNIxt78+Gk4BJWZG
gBfZIn3wJ7j23zLUCA4qKPvDaffho06i2QEybugGFdMIEii8Qa1zd9FhZGjVFAhr8RqqYGkWCWZZ
4kBRdTaFrh47x2Xy4gXLrUDi3RuROfDwY7ZM6T3ykClSv5tZgJ2AdSQ+Qmzjcl5Nk4kQePjnS6Jj
OmAy/av8jRYyL231mJndFMMrZIYujEc+r8mTKUICDXKcRZEZrl1Aaw1z9g6Kua80CvOUzfaXorB+
bKhfTl3NuvZ6//s3pJMFk9aJhPeOSGgdz/PcYniOHNu6kNF8J0O+gM5EYzSMfmn72BcI8FxOQFgt
dZTaE23rYKkEmBM2yyXmoE3/yd5ZnUE1nK5Uw2AbNS1Z+K2lgqY/tfIJnA8Dx3OS+9y9brZfr4ks
iZ/BItCZ5WyZZSni/f1mMtHhh82BkvZu3pcBFdIMxjVEU5ZYkBpWghNsG+dVFJ2uuQn8SPoIbosx
J9NqkE0q+ENzetof7F/U/PLDwZb/JUR/3Aj9eaQ9NydvSpehEzTQjALOt7PnVTlPiPowfB3bLpp9
JFULTfxz9kzXYYRPGoHjuULLDy5RKZGRMxeddFQCzfcuyp1+63WEU+QbEN6/BQMDeI0o/pvvvBAr
2UiAT4EvhhT261IphKFaYVsFf0e3Q0vzOgSDBtBG85cs2eqfmKOsVNKQo1BHQpLbWFMQ5Mo7KlLx
0StsoHeZaL/ms2CEnXdiG/3XE6/cIXKG8jBDNZRMPyl5MUeTpapZYPqEIkP77A1vAJpGBl5lHThd
uuatXH+LCzSQ+mpD3O0sN4N8nQtN/Ld5TCig+s/ANuIWwYZ7e6/Gqze5GEnw1WHQIvWgSN9Ab5p7
A4LGsjKI4IQ+ww9q0P3g7lI2ZcBAO/lSbqgpoId9Y73m2XYcL0i9ZysZdlMMmY3c7Oq+d2Ao/ia/
/31hXfPNEcXaubCAHJPwwV6iRbp0LsarsFslTE7i7La5QMn+Q9ZZHuueeCxme7CYgsG3HoQljm5f
Tb4TFTPi2Vh+2/Tx5EmEg2cEs1QS2LXxyNECCON7MjY2uhlP4LE3kPuI+60YglEokj/ky4wrbQm6
Z1cmRvVIx+2oaLXZCe5RTOaDAgCcyD+1C1aYGHu/yFej6vTr6lLx/kHSoJ7nbKHNRvMjanyJwDzx
+7IqUfZy7DxO6gjbvAdRf6P/0iuiLqBUmivn4uzcVNbDzjqzFdmGoc97txi0stSODaPeDilCosYX
8rAVIuMb1bBtlMLxhChLSEHGwE9AZmbf9QEGOfiLibRH6Z29/0tJwBqHTbOHhDCFC6Ca81t8zC5Q
FyEPuIofa0TTixfyg7AoAyk/37Y6Trgf2RfiTHkp7x2jYJdN7zQ+A9UjYvRkqsynNWuhPDkBkx8t
Ni808heFFrRFmIXawYT0K3cUV5ufyyLrHOIxqDNkyJeL3dCQbUHLL3c5d74nlTLAy2lq0vPlZKBm
jxb2/WWPEChpA4VWOCL06ET4raT8rBBBLGnnxmXQwTPPeJmdMLJ6/0pUFpBQYNafcE4YHN7q+LOY
y8WfF+jd77JbLvyxSoMiaXDMAKSUEA2Ayy9e9bGslY3jihtIl0C9Qz8Lt3oB2xjF8hObD0ubBgpA
ojLdZcicgD8wIIWym5eIF2oLL/XRLm/DYNCfCCBp7/Yn47iEP7dOZf5cRprzrgoAB4/x7MCoDxIK
BVcGiGxv1ufClsIInbIJWlLH6IVxfsJyOfWdNu8f7hTerD0AWio4XsMXmJJmi9dJxtGIqfemY+Lp
MjarjEsJ/qyswq9QpZGGICuCpS8o0peMYXzWiPewhjfu0pJ9zBYVr6kVsMG7/4Y4F5WOs8qiSP5s
BmnyeQ50A9cfk6SdJ2NheulSKQmxsEI/dxVQzxPjZE9omG47dH155Yfs6l/iqqtWDtGjJ/rFiZFx
AzBQcqjDD2uuJbNx5EfHRHFLFBD04O/1+JoG3Q9W+K7MGAgkQo0V8YRuGmPGIqMYEhhIMrxsBaNZ
fojIHHqlORov0iJ2xZoC3ro9AOFy/TYhfEXpj+9oDXniD2iBslY/d3H0nIZYLWDJ241zuc2nuZuE
YteTY81z5PP5EIcau1bHJGlfp8Hk1frO8IvH9hIEM1VMaquTbrn9Z6l00lzEx6BrzAcSK1pnkLWg
jG/o3fTsrqIimtmyDM3HxJrCXsbiZVI32s43+a63/ztdpgv6/1THdyRuEx50Lb0HPmSvXLKpHLdb
unUn3Erekgztjq0o9sgPcfsoc88D5XJ/xFoXHjuel/eG6Ln1XnKoATlvOwJ2sNUAL+W3EoSwAKf9
f+4x3r4oxhyyx7U+1dlNbMdFUK+d/jlloVnIYto47HtoCGbE4TK4WJnQCsRgvwxZRQMxwfHnPyk2
3IveUsPQhjPSAjcszNU7nz5F64VaJvZGhQjUdd7EUCeH1QkuMryv48Tj/aJsxCM1XYQZgv3T4XT9
iij6gQpHbcVO/IxTFQXOmhfqcxxXYQ5yMXFJXdFj67ECVaNUR8jUooa2dMxlDCaqBsQBWG91p288
bbSCfXfwpY8X95q19HeFkLAeBIqYJ6daI4opghhHkAzVeTclCQDq6T/4D8bkDrAdwIbxRytqs+z9
Asn/hJGVH8zYgiCZ1JAyCP5X+ZDxq1dVjEdMlvpeVizb5cDjg+IAjlJYGoPRb8Z49yX4Rrh/5wpY
A/38spysF9q+y+r44TZPoo4UM+sCQmJA1ZDedt7Jxj0N3dYApJjPeTuRkK8AX19oqlIihuqY0/Z0
crdN3h+LAvIeESgavsWFDSyeFzxk+ZmwxaQhumo4UZ86lcAwJNskhyluFkx8TPTmhYoXynDCeNN7
k2MfmhszD4jo8uO/sV/xp5iNhW6HNgU6PYco24WjWggyTKn5PQEXFnwzz4SWHzXwh7aXg5kVroSa
MfgP9WARlYGyaoaEGH7XltwuKYOp6l7Lpof8i2nA2Z7OHSv3tnGS+YejStRk+VgN0pW2iGgXuiED
QSps5OyYRSw2aXjs9B7q7PBIr/OYyQsioEyuXV3iWaAGVFyTdyu1GCXe3J7QRfDn63+IjLa9LAFn
wGzyZyWc5jcUxs1ht9j8/M7yjs85r+ryUXuJNyigHfu1rEhvFD1IptOkZ7DoHeoXwlH+san3qxOi
FSA+Pt4+kJvVCCBfTlv/r490HEMmj+lhnlMtqN5zXXE1yQSjQiZN5wEULDLmcrN1A3f8ocGZ3NQl
/dPOHEW7F0PThmuZbsLcwiZk00jAOVlZ4MranBaZ7Qw0xilydZe5JGcNr7OPjdodTW3HZHVMb72U
jEM8MWu1krM80+RRCAkDWaYPUM4XjK1696ZtJZTdTbp8J5AfrSumoF2m3A2LpzWB+pIRAHUs/8G6
lKbQ+4MPWRPpqBKW6xuBK6T0/td44ZHX5Zv+NHpdy8iK3MZ7XUWNFEXlADcsv0acg08jrGwcP2TY
NbO14RJAytLTyKF4lTXCyYn3x4a4p4dQjkpV/dFF9FLHXPYhYrBjbTp5668upzwehGXhD4Y5oEpm
/MhNfxLNJGFa1J6u5rrc+wdx7b8KoRTXoz/jJiAoJCFVNTJOJx8FA8Y06hl2MgQDu1+L3E25DcOa
6KNm5fb4Q5d+Wx25OkzGGM7Mf/+qCasAMdOv2wL04+tSWPd56JQHDmbxPirpenP7tV5rP3uttNIw
LMa91MuPwINOyyhoRq/uXK5aEUh2Qidc7ldTHTvmSw6oRlOH1Ee/RNwhVQO8MPqYrmb1eiADimvm
bCT1lZ5LMIit8FHV5wMJkLMIdZ2BrKWBsWaIzF+BNVqEJ2QwhM1pUJc18vEH/3hTEzire7vhokYW
QPKVPfJgqj901B8d8XyztAp3DH4DlK38vGWslDaYvhA2TgwXSYjBqa8qgnvh0poT+yMiOCunmCPp
diOYl0DlyAl1U1b0RRiL2LJnUahowWJrj+K9zujNl05UTzPmXFMvPHWfILZbbPnr9k+/DzSlvSNh
aVH13j2bKzw654ZmTvJtdpxz0ZZWoEm+h5aiz6VTrCXkZhC9aFA7pYzEfsFT2MLEqhIPwzWwBR2j
6H4hRPb34MzZsizRZbHKNMyusDb7xnEmE9ZtK6z3h8jQutKeP1/GeClGC1bbk/hO8lQ2HK9WaFpE
jtJ3GD3IRQbYizwsUk0l3GV6TFYEt12nSZa1RRug6Oqm4AFRC93h8Kn1FqljEXkaKEhQeqIgsuCI
/l8NHImH5vwuBxQpvpDFwBuFkpLK2dkyRAtYK3NKnGqPS3LumdmLqr/shN9UoaKymTU/ZMTu5uAc
mBcjJ5oefOV61I5GV1bKqa3ZNpjY9j5hPKQVQGXSgNHeVNybY6PsbcbcmCIOMvv9bDl8APikw4Q0
4E9FV7nE1JaC1UtTeApAnC1F6q7gs8mAkhUqidwhwSZtpctU73XEcVgfzZ/ueatt/OuMb7wnn8NE
AkZlC/w4BPOC30n4MCAJaCfOIsU8A4kRxdZIK2lMnPqanklH64vysOOke4cc/G49nvmyuNrpO4Pw
o7tzfnWgpFHp9pUDVaTTNBT5Jgz/ViEyciBLPHU2ix0DPWbEcsvO2/qX1vFr7euceW57wVfMa43C
XhH1NEVHwSIx8IXtsqHopyv4HjPpQLo6v3FQb/qeTFljwQsGYVzVxf9z0TXO4IbHC1N5uChks1CI
wTog+Mib+yIkWqNHvplpLJupkY4C7JZwd1JNl7a1SnaC5YBh8OYUKwjlwMWXe7ikUAul3bhMuP0H
Ghh5s5Yf1qSFhBUbjFb0zShYxlh8BUAhKD5JqoIk3RgQkNDqIfeVyByt9+ok89nt0l05s6yDzS2W
N3xbQhJ/RZUlml7kMZXJK+tm0jMZ3lCS3C8zct/6FaaOMXUt8HdBAbb0Fg8ic+VT9qTjIqMYL2bZ
gQPxuXY4D0GZeqBtEYN1h0IALL4ItPmg7ncxIJXWSv56fZwOxJvTWfTgKLl6O8GZlvDfNx6vqkqL
66tNYwtVxH++UvhSrqIvH5vaUdo/rGd1o6GeObWdoiwPMimjW8BnVl9YM6wd1hq9zorgug0VlCR+
YkDVSW+0OdrGTl/OrYhXS0mEb0QHQgs9ENp8ORH2Me9Au6VBUbh74SzzNSg/yEQwchIErJR+9/+U
ZPuaar9B1e/ervVSAJBBOvpz/caSXKPieijwAsJQVg4TDxPPl66b0q5schmBBMbj30dtVzvr0R3U
sJhZf4X80ZK1D0hJClOL3Qe+sreoF0eJIE3wN34VUfOQV9yIYrsRVHQJu08RmgL7ya/CeOm/r+PN
PHTJUD1SKzWWDKGBuhDJQOCbuQtQjvc08l2Ckr1cDkkAEVlSown0f0/jh4bFqmayDE/r7LSCUW0Z
/ntRULIjCKPWAweWIOCaNuY5JI8e3lwCu4jKdFG0k/24eWE0nWB76pqr7mFs7enEh2OOCdRVYRjw
WU9MfweGrhigKaroDmw6JTBfTYH5mCC1oCrNbMC632i8pl/2ULyEo7aKKSFAo/jTsOL2uo+itd46
J7m7ofKAWWSjj7tm89Cc4SiILiIV9jUsmp6uWcnOFAbio0Qbj6yW129Tmua9m9qH23H9eJ1jmQ01
KdBLCAXHNnLA+K4Y/GVJ3QnSEWrr+6i4+tk1SmWhxMk67Vp8gLMgexjW5HLZfqmBF3PMbtu8RD4T
ZU1zkNN2YGTJY2QQzfgoBzIlcR4lEIDESlGE/aGFWQd1VmA9pqG/ssSp3XFrlkQW1Xpz7bF52vIK
u2W6XXT6m1WbdBeOqm7cg+h7F+4gvVZipoyi2jiFTL6J1U7Vm+LUA9CGhWUiUNF4szEgk0+jkGhv
pnkPSmIhVCbDjKi8dJfb+l9wbHmHz6Nth46aAS2WPQMOqQQDyYB7+l+DFWTW6oXmzWHVD6YlYXY8
TYVFyFcelxRQbnWAP34GWTKIxvlcgSiwt81EyynDVo+dyLHFQM0sOOohjHeiXZNQ04rWTh0B8zPF
aEgvEhdh0AycvR5F4RvG2ICTG+QG0SaNuh7/YaG+M871XnZhdNmCpN45PWZM/UV+3lZBeBAuwatv
i8pBi/IVDu5X6B2u0zP+c2B1RXo8NSfjI28+DbGzfEgU5anI8h0DmLtWNDE5DKFUsWYon2J9yuYD
BMPGflAyNiAh7YSUFb+Q+AirA0eMmwBrYkkDeDWXgW/MotQtsIzpObL54DrzDUnEBYz/HrXLOrZZ
eWVH/Y8VrmZcVfAFQ1h4mIp3fdumhCbtuSj0XaO2eFU9wgcbl5Lfjji/fq3qnvYqfsi0K7nEGhra
/alW9aKSGE4Yvri12eJq2/rIe6xBn5g0pdkzTIy3+Nxfw+Rs/U5R+PwbmGmwOMxLhqM9ez5+/aLu
VETNm1Y/8sLGRhgCIg6F7EYuHQgxAl1mIwS5e53s/yBi6z/lXy5u/WNrm2c2nmWYhNXgpTdz1Uzh
ULDwgVbbesUueUJ7jHxtEmkc2v+bZ4FITssCpg0PQG9qYer6OWMwzboFaPMDtyInWB3LoWDjKf11
SW+A8x8FSKR6BIuVRnP5ytmJICx7a/S3Fe74IIUpbYQqxx+S/ty/Jve+sQa1ovj7E+Zp5dfulcGz
ocwILydCsPsZR4yHBpniBUCwE6qtkzQIG813oaa4iHQWdiwMP1KX1xu8NHV9rGKDlogZiI8zRkjS
Z+JAkPb+a83EQNmyGr3M77NGJdsiJc4QlOjKhnQVK8bRnCrBJQ1ebr6btYVXvN0RXg/s/Ndo4Oes
Dc56Vmpuf6FEsambAfNi53TvtRnP3Gg6Jrm67uNBAdBE6fufIDjzzdEbEGhYHC/RbPpq2ScgMSvP
1Ba6S9s2K2nymMyOjR4pMuh9oHXhTzbg2ADQe2a1E5DDV87zO6UiLcy/OHHWqOKh8cLSFgxvJ4ek
m2qTwnpW0a3U+yhSo/rrIHtLHmFzD8cEqr1I1KTvMoOhDL0WRBssviGLz5PRyOi0xorzpPHvyXCg
1TXOuh3/nb1+mW1a3wWl6V4Lih8b0qUpgmcVhkwYtqtGsWDrJDKi+FpS9LZaE+s51WKcDDZOXpEW
Ze+xrGBWgk/Oaj7g6Em6G8EuBvit4+ooKeQjcaBLjqcCCWNLUQusL7dZAO5TqHhSO9bcSssEdGTi
xoqvrnoBsYDDvYlTJsAA2kqnAfMUp2hSNdvLv1kbQnc4grvosKqDa+C6WAu/f1F8dIcUuw2UTkTy
YOBWlwBcxW/i0KUeWbiGurbu2fD5FdlEgzTLw8b7S4WqM7AwPuB5jo4YKp5hJsSuxWhWYaoE2UG8
Q8FukUZslAM7Or8CgB0KvRc2wQHGBODaG/ujXmNlTDBkvWcofN6GDIuX5koIMGrzhYHxd1mCDpLU
UaVUvYvE4ITbZxaCNdhnH51DCE20+fUhgJ2/U5T9xOv4b6pGp1FtilNPN849waow30Qs3mzSEiMZ
0HG+CzqF98dpcsydBuknSwEtvcZD4CF51frQXYWpGmtVr73Bx2yD7W6Ze0SuEQRyz9uiRmoV5/iq
GAMxDA7ukDSEfKwD4npHag6MqHE3G61KokqhkLzTo8UwOYHi+14vv0Ui2hpJaAgFZ4AqsjIEKdlb
WkQa1r40EWxNaJ+nCLEFC4uwINx7aF0bjjoCOrBihLd7EWf/FV/AUEjEc6HkNlaN+KRYsFtsksS3
nFBDC5oJ1MDwzvwYHiWv1OJ0CRaKmEIKmhyQNStqMv6jYdhQTN/b5GPn1TWnaf9Ww9uetiV391sM
dtoPYXgL8ls4Z+rOB4awWXaGzgUiaFEbYcm6Vml89WMgPe1IvGDuQ6OL8JBG16THe7R312OmjPF/
cw8a7z/V/jkTP0MWoTEzfHD9OH6UKJj1elvNMueUgqFYFqnHlCeCZzTWtEHLkKckBTWiP0oGHfpx
uCZiMcLXj69+/Z6+vCMZVXEWCUH90IgyKOh4fpee8O3/7yUgykWkQF8aQq27MBXLvU0DszcRZAr6
f+9HbYDEMjYpUr5YBHXLgai9XEYRHx0hc1f/GQEZnqu+qVLgonW07aKar5K6+s3+Awmr5s/Mw+AL
HFz1odQLY3gXXsNyNM+qdlL2dXRdiG9d0H5Ig05oFUT8mm0+OANKKgKdzrOEYVbXr5vSYD6IwS+X
aoMsCrJHOQ3d0e3ffPM9nyzWhddZcSZcoOBbEItZIgdW1fxSPrLTOAsqAr/9Q9hp9ezjjUjgPl3l
PSr7GT0NIE3Qcz918SI/7tsbr40/S9SGJo8H7cQ16ied23xUoT06Fbk1wV2e3EZcus0dNUEHZkzz
nmv0BQkS2a408pFWMEL1nNGsjjhDBD25aPez3GPf0l/ZuqVCfn8of6Xy0+JZbk+jiYKBrX5yMcpb
ILMbCKFkUFYiqXuHOLwDoM8DMSDqIK6uMOifOSx42JyjJomau4WVsRevF+jOibyk+ID72k1yg5iA
Fki544RYftAO24MiuOKYDqTi9JVrJB2Cf4ESNOsP2lX54y2fpDNevSfmWk7wyjxwRPn7mDM7H30b
DZENF6m4mwqK7Q8Pibkdl5/wBMmCJVk3QMQptuMhQobAL2Fu3LA3kI1Nt/E7puN9e0lrElgXaL4M
VLybkkY70epJkAodXHW/aT2EyxJitwjWa4LUkWqXKf+8pspSskenV3wIMR4oe8pmxmRLyjZbWZ9H
3lRjDXmYKCKuJ2OsT3S/gaCfZNnDQp8H2A37qs86CcjWGuB4APZXT2pKWpTl66OnUKKhBPhqYU5B
oaJ/VIjF/SrJJ7lHt3+a83+HUFtaOEjTbhQ51MEUZC9wkc1U/ioRH2Y7T5+auxmHbrsqQipMx8ZO
20f1+M9mHwvC+z0CQK2eXQ9llncrd5XHpaYWyAnfjv6kE+27NiMCfrew+P8Cj/T5MJqwaJNTmre5
5JW30jjT+ioK4niEESXBXsqxZ/A57yofkgYsS7Fgi9X106wTZOgZsZaupPXtOzfoT/9l1KiQpbJw
6skiaWaWgfAypF3sC28Tux9xY+R03KOwXcg5DKZPO4vQrE/d+fJ4MxuEgSJi5QonDPngOBd1/7wW
SGqPUxwh5E2cepi8jMQ1zlIAtSCNyXYVN4fR6ZsIZC/HYMB5KJADPwFJSBl062ZykueegQ1dFJLl
b7BZ7u54sgstrb1TEBNIgsrnSLhvjWas6E1yPbSV1Tx99LGoFU6wFJtCDh9s8bt8unzgb8bN7TN8
hXD4J3Wq25S9TYjm4BANEjgaT8CDOOLfVbX2wJHpGSmh5Hcglk2k0cghTEws8VkRSpHAxWsYW2O2
jz7bru54ntCwhjKtjFpDTeiSO1yuIbD0ry0a7dIGuArXWlLxTvve6T/52ctTJOon3spqy3VlB4SY
dxBKML9UmxWR0MsD6xMpOS0F8UOJzucVppHu/Fx/AxHnM6D1sFUdujDgFGayybE9nxi4QiAnsqYf
JPtH0zoUIZSJJx3dFDHCptSazZfcyHAzyoQ++QId51z1z9jgSPa7RBoJrMgolNLbwH1SZDOOjzRb
+CPdKnA9S6HhTzIUDNhfcntNSkHrp/EYzmFbLFpwnBdtiKp1fOFEAj0wVR0AVwWkleK4VlrWZ+Qm
/kp1Hg1SP4K45A8GZjuTa0v0Wfoel0u88yq+vKQ177OHuCEHaOiu60T8GKl8s6SDNIudPFfXURiD
3tC9OVHd0QOt7EMf9eFQRFrNIe1qyr5kNdI/yHihwtXnMrB968k1TQV2FcckiZX08HVW64wu+u/h
TdUjkj3USm4YV0/j6E3U2cmRFOCsx3YF9X1PfctR80FKURYXBr3vE1vHqWiu95JWNYASU2alelcn
2qq78h7gnKJtUXXecTiqj4NvSthIrfOhC0bhLjzZOjbg0/glmoDy4nqznzb2haknkxqWh+RzrSuT
yaX485hLF6Zh93YM8OXsvPfDesEIrFaVu6bfCxgc/sLtAqO58Gdtp4Ls67v43NRHf7ORqMb/teEj
A1USkXsUZ8Pa1PMV3GU/Rr+irxJoXGW6yY9i8hS2rklcaCnybUGQoGjmL4cDxYdfaMKn2xOBMzQ7
Qc/Ow4NuXjsQv4SC+Exf9+7yztrNsLVpFtSiisCIzaq30Lhg2h3ibF0aqcI+THvgR0jJ0SjVPXaI
jHxG5H0QXU3hud/3PtKE3djrsfdm9gTqZ3sc/++IJ7AqlrNgDEaBXWr7KdaWClVY1IIC6Yo3CrXm
4i6oSrMoPeaCIZcmFuDyQXf5LaPrGdtcHdKpTG51m/wucJFBYvL5ripyEnlKTzh7ppW2vUpXz5ni
iwNYbNZq78CoG+UB5s4OvhKdRhSlDp1k/O07lZSG224LAYoygGA0X7artGTeXH9mWWT2ic+UBvQC
jEX1mXxMackbmmDHMd3Wqpnb5yc7EoYPRN4Mx+tdQysu9Jxu8Abj2MMYm2T68adG1AcMd/+xbRHH
JSCeMn734oZ8IeyTyn7Ytdnsrxi4TXxE83VhKZ0rjpcNIqFOdp1HjMV3/7mbgztMxSL6YzrvFEpp
CfVh9E9MSjCjIkn9dsPUHkzyJzCThLGncHGyOOMh4Ock6MYY14qx0zHO9XCXv8aMtgPfhOc0VUSG
sMiwL/60ACFp+muPX1Cu+nJTqEXDkpUXJCIZ9DxPj/P1QIbjJPY/UPqBy4+njLl0l4oo0+MbM4jP
oIp5lWVoQI8xjXn5UtYY0CNsfnV4MUToEoM76ER1hSRCWE9NJc7AdB667LZ3Lpy68bfbiTQhiP/2
WSD/223cvzCixrJMfE7ybVsQqkaWjUdvEPjBXL6opJO40XkuB8IlBSP+nmK8NT9VY7T0bvOguxc6
2sx0e5Tvsbo9XdJX+1PpfE+acezt9eUWSzKr+mOlU8AjVRkH4AbaomOIE9ELAH7dBOFxJYX58BtR
mpRuDcHY1zHhdlU+H2uGWwwr1DN08VifzgNHP9b/PHKLuJDs2T3+pf31DC4FyplwIxK9BKfWLJdB
Trt+LT56q4PGMLohn2K53/vFcamdDngRGZ1Tq+Gq/x+VSljwbl5nFAp6sEXRVBH08ZOZ+8SrQu40
0LIDKM/cAhsDwe4C9qZniYYtkq9uofyx6H/Jb4lLYFeB0dJLwGdAkEQaSY+8Zmv6ojSrLH7Cumr3
v2NTPNR+TBaol7H6+Qetc+jQjwj1GNze4bKU5pknV0hOqQoGo0DIS5P2cj55mcCJ8eEYDyGsGAF8
9tVcjlA5rSEtFjjG+PCof08/dznrZLeNvX94e6tfkXfefU05ApSpqzK14eLFgEGDaMZQD9En1fu0
NFPCqJs0jVyTXG8Guc7/URAckQBGYbWQKqkUjpofxnViVSMtagFWJDyBHTPZAJnZBslI0nPTC8bZ
u0P9jptHu3Lo/id4j5EXzMErT6dWQysnhVQHcb757PzZsruUgcwi0hPJM8ycnmoVtfVcsXLRou+0
sq5X37SBww/JFa5i53i0XddDeGUnAGhr2e+BnakRHw3++PUfoozzi6Kdrpb/qPuBMzCcrE+XgXaG
2ag/dbKatsBVIaX4s4ISdcc17aBacdY9+PzfuGXX5kak9J9ZbwuJmJGVzxbyCRFxhyCZ26dR/Hey
KGXPUmJalgPgsSJ/mlj9TGhWq1YqV2qJCYh2kE4QWApiyp5JMgMdYd/g965p7vQ0Hac87hFQTVJd
wg9Vu85zQIk2wUNzVgxo8zNMyyezzGWreVfo4sfs3/m8RNYnVGtLgS2QJAA2dgv9jloN6AaJJg8+
A6CFCIYit6KzVy04f8Y+1GuJORJxlHbLsxfZaHPmuX8sVLQfbg3hAfNJRFoji4IW7SJdet8G9aaO
h3wSDFEoi0ryxlb9cbNgoBzoA6ADgomrWklKsvvJ0YbBINxSMLVSzFaw5HvCLId44+vC//zKmKyu
ZWxL78Uya2NUe+sCFkyMWWUk+8j67zkBm1qdbMsW5IqnfYH3Zsw4bzohK4H8Whp7/hagIHwvKrMl
Ospwn0ZSpFcXd24QpVW9DgF+/uY3sjDc7t7qH6W4y/PnSoPHG+UDdi22a4XS3WmThoFlvLcSbPYa
tlGV9tHe2m1wywXUCFIP2HyMWUevi9vrx53VWzcO+hUQqP9xDlMeEKseZtgxClbLoAN2NPJR3ZhT
Oijhc+KD9mkNKBy5RvJdfx4tRMoqgiN8A1cwteu7p8e+cEUS124wS18VRTqmr96xP9iCDwbYhTKQ
NwIHRucsVjVYgNETtxXz+8M3ZfFMErS/OZW70q1boaO3fgKeXfAwOS4zN4jQUHPwwCNFgXskzePL
s7oUqhCY9cdDerv2PfjD904FB4YSMR41ikXt039ChclJv3eEv6M0v8bIY06hCvskHfSe7wTkn8zy
Fd0cLTpjBO8m/mMO8bujYSa4a4/10372LGQOzzon6Fd/GdWEPPUTSK3zQQIEKUVnuBgiwKlIA64S
uxgLjJEB9GvshqYoJv2i9a8bXaUHuPFhDWfIY9SsFqtD24MBcG0I8hbcRdIyuiM6AovlKM2GBeFs
h0PCDEM8r/y/VnWH1NsIlHS/ZftNOWzXpgvuCn8QaaqrRpAUpWSxzvdkFAJf/bDkmHDaAQwM5idR
U3802qejQkwZhe32SHH/aOFp4WfdtecAOwpTannNEZ2Fqfry0KsImSirlfzXC9NkUReee7wFNwI4
CZyslbClowLGladf3wFprkYAfuCn9O+lorHl9Km2NL0G7W5kJxpPF513cXP6TiDBfTEEHv53Hr5z
wO1EZnzZRk8EGTCbutFBEDNyIDCmWctVnrSdJXeN9fGSZ91Ybl4+qKNIM66H81sh7fzP2HBt1qhf
KWCuKwF40JYpXG0B/i/9nOfgaU7lIzYoDHqqIKymQPnQrQSdm1BFteA5SFrc67orm5mK5k4MbccW
1cBObiRdEo+aF+rVrYZLmaQI8pgjLMxmncMXqHjzAMsS20urzzXiPl04pTYvxhlI5Gq24O30T5HH
OIAujv2Bvbkgdwo6rpK5jwgSjTm/udBSIU/18iagG/OWP89VAxU56H6bWBlt+p/KrnmCBeCZg3+/
Cu9DmkyKClDAj4GgNMSxBdvfocrOpjkYf75R55nnql4ST6uN3TG3+XncJK/HMcWldE+gJbijSZ8J
uzjLge6VUHJ5yvxnwk8G6ceH6iaQW/9irQED2TxLpshnE0pTR9x5Rb15h6rPPdlZaVxmFRfLQatz
/cd/rl2r5H56CXVK7+jsVsGpJWjKltMpbv3ez7cIpauxPuyutZmtkDQK+ztESxOSDJPTXktObAAT
SbHpbpNjVdtQJ8Ht/s12sQBs7iRYv1IymaZ92LXNjdx+UyMnwABK2+ON2xhUTFh3ga6VZHzNE+Ty
5dveGaEf4KNF7jnf2KG2QsEk7UTHiWNimtCyFZa7XflQapy/hBYlOxwQ2vbjhXgAn5jgv9cVrBLy
dzxV+I3p/ne65AJUgALsHOmuWTMMRsjJNAG2RkFPCL5CVutUQZvZd9ZM6B36yjF/EhCFOXHGkH4N
ZfH4WVbYj2ZSZvPzKr/b56RwbBamrwZnTqGaPHErzsB3DmfFNs1JCPyMGlgGRpH4xOhszihF36DH
cCgFc4R0v29fOnPzr2YFaOZuT3VQ/3TCKKmDS+KXAo8iwiMABnI1npK1JJLtemT9kA0P+/ob8FqS
DAhgE5g+EI3U1iQPaSTbQvpADzGfowg7iHX/97Vvf/b7gEAsYm6tDcypFzsCCwD2czzzPCu16siy
9HqdFzXBV+mW54eD8gMA2OoxwiJ3y8CbvlaFcwZ3FRlyvLLKbOpnGcZk0cvd1qHHRwth4610D83k
F3dCiO8k59rjlD8/kp1GtogHGqzWQ36mZXmOwnOSsa9DJfsR7kfHxd1KaX9mjLFj6HhqooAqmGQr
Eqss/lSKE0jLXYLSJI6XzmWJvrqkgk6LfhBXniYnbbCMQuQq+JEAlOwXCapyd8YdPtzw1hb5kABA
qcx1WOmgG3b212HETXbPs5DXFUui2cC+/Y1KQ4V7wFvsuAzwyUoLLvapZ29JAiliVFPyJo3SsDFe
MvnZEWG6JiAG/A8uC+WShss0jHThA+R0+MjI/eNZwjqXmD4zMRwqUhNJIJtKf9r3El9YjdlLa8kU
tPRphQgG1UochhlZX/kA6y5de5nh2rR7nQKoxJOb/O8UJtRWnXr5f+O5fr7SWNlFvTHkkFXanEij
4ur6elRJH2OGveyyM7MJyEyE9aVw/yZEVSHRiCRx7xJbnqZHBq5pu5nlORN9pHScVEkiPX+m7uXg
VmpAH3+A9x2EZqYToPFn/ZdjF8B5FNga65ZCxaOLAXjHfDFq+pxDMIZhR0UL8T0EqD7De85rSwQi
QWbKTApdO72j1/nGl3v21HlhWvOaM6OrWXDZ8+eqcMpU4STr/5lbUJ0voFMt5s2+Pg6KuDWQyYfU
OkdBPviXSNJfdgEwYavYpOqydws939WdBQsf7fbuxxYZbMm1qilgm0uZAaNMABVJYYR1TiNNQjYE
a/X6Z7PX/vXZt//fA7o/az6g08YQtIXsh/Hzq7Opr7m6ONzEkg7DsYZ2XTl8g5OqrgGlvEiy1EDA
rfPJ8UApjTqU0Ansf0hv2GPopkNtIXEUhAEXvN+FwJoEoOkVAOSreOE4X/4RcPo2tkUh6NX+7FAq
735nPSgzadBMwgDUWFoWVpWUiF2TCGzEC1CrSI8s8W8sGQ/SbRWudtYN6t2MrP0sBsjzKM8IHBCJ
eMwOIwvJD3log1+Py7TCR83/xjSyL/D0h2RHL1FZ9WDmjX9QiV5PGJ4UByblLvlzFKXd/gELgVLR
COoNUkvOnrNZvZZp1Jefsz9vjl+GFtUh0v0JZcknaUWzpVOjocSwkZ6fwD1yht55OBr5+K/vbzhC
6/9FsBHW60T67PrtxNHeNlBMDtc/Brdl2nK25fBP+oDfccbu2uKTZ/FGfUD5CtRKftvfrPJ0220B
LUDv08DTRmO9JA1sj/A8CMNObdWjl+kFnJ/P3WBDnR+YmzbaGLdJm6eCwzxIAxuZgknyHHywavC1
fY1aj+VgQzPgdYhaoYoSrwDkqUXyMZ8CedXv3NM8Fx4mXgDoHlYB8c2jkCm7SbaEw6iMLfZBh3LA
1S2oMbo9SgfjjI5YKiCVmXK82UgcENVObDfBQyNsRJfwZko0EBES6INyyEakdNo6sB9+waqjC57L
xppOWlueFVMqJhoaWCyVlXJssI8oPJQJG9n6tcOo9LqLP92A+2hkPhXmeD4PepJUTzgsA1hoWydP
j5CnCQjYfD5hGICpMatcqCukOEM8fVUhv2/TCt2cB9+boV5YHodm10IqFEL3k0Bc5FkFqQOGYN2w
cNR0yByZI2h1ll820kGntAOMMR4c5GTvu00hIrV3E87b3+jiJ6u35qgvcKEbT/aCG4olZen1LTUz
1PWD0Zj0KPhlG9Djzi3cTTf6b7742hVIWpn0PgBi1923oSP4dXyLseqVl4ZhXl/tcZeTzm8Fy3lg
vqraYs3D56UGODhkWM50brHvJxtjoIAT0pUFMowQiDzLJS8agi9ZZ2siiWLWUrDBBu1bPnnwx6F8
imAHKm8za4PR3xbBHu/c7JE4f7H7SJutMgoVzhJEYVpdKfeKaAI7yZJR4LRyRJjS0a+LCeA0R5qL
rc8OmiYrl51iT5Ju3l7rqgAuOZvq915sJzH+rSA/YgS66J0U+WnQwZJSGZxYdB6uPuohuOcRtZAh
lAezOBfNQrTOGa/WDJv2DRnFMNXuKr9qQZa+9dQLr1S8NuKGHB9Ek4yIzr0fsIDFdjIfvRJwm0s+
USWzuvFRf7jfO3IQV+MP9Qvk/2KeLmiMC0m5xKVyOjrC/RvcLOloAbUN+T99GhgGnNhsKxKDzalI
EvYb8nNTjPYayjsFoLIqvwYlzyvmw7/bUhFgyIcT5ZuMt10ucqNVECeHsq0jeaJ1izIEm6p6X63z
ZU5mDNTjl/E+mfYsC9VGhOolLB0kfmcdnhMBcZaHcqNwGArYL6c9REbG1WyySybT8hJX4AbbzCYm
ZZWfj6UZ594ynhFITP9poBQn9cNfAybT23bvGeaLDfl+VJ1JLOOBieYSNDEOsnzu6wryemTP3PJs
+go4/HHStzSpt7Rq+/wi++9m/mIVHI2qdSE0DlOw7sBtwTFvl17k1tGVKW04WWXTuuLNIwL29JJt
mYBjUfYHvyW7jh3DipD2sJn1aPsBI9dzM5dDnobiF8kj3dNPyKGkJ9YFDjuSslo/RrjJs8ToTBK4
dwNbWByqWyEapmJVU6yUamwcKF1MPtprcRXigyCe25ASh1H88vY8sMqD+qY7etgACTO+j/GMiDfg
D+CUbcijaF8nRePTCRGVG5voVHhX026Mqc7HD/1PnVOw0Q2Gcxax7BPE8ESxquxJbCiIZXSonf5w
OePBBcYM6OP2DLCl9alalAxkfk7ZALk4LGaMXax+8N2QIL8ee5gMJAI0vSAzqeCtr6OVLoDb0gcJ
KIPOhNCQSrTPwnUyVWczMMtgyB2YNOvfs5p2dHNLOJwEZq2Cw55+ErLgzUWTqRchhUiIDQFc/Csc
OnTe/9VQiv3aNVqFI3Nt5wYBif3YZSF0Bsl+v+ZWvyITQaQUSe3l4bY/R1FodXRkFt76kGG7cM/7
VyLoPFMaUtPF67SPmB/ZTgudA/rn8rKtREOsyy2ryS/OF+1V2rVPwt7MZREr+I2p9HWAQGRiUw9D
EdKLIN7W4QGQewU2vZLeO4P2xSUnhHPzOlSVIrO1DheHQKJxMYPCAePJoKR1Me9yljkjMcb+bdMG
D9KFrUs+ZCyAHiysPaMp0GAhubMt5e5MrOlmfyVa0EwEO/iCncHIImvcf+14x5xB5YqDIzBYoFN1
3Gj3a5J/1v9WGeLMR2mLQrJ1hUaJqhMoc5+PsSu/XpWJF8syCnt1H5QRezP9Diewdq12yqoZoO5j
K1aqAZWFLv+R8/tqg+xiSu3FETF9cdAvBXEYvqs9HoPojoot2a7sxaVf1PqYBfIvQNsLYyoW/rxN
v8xGOdiDFg04diN7tkom1tIPyboIuWOrfwQ09SCeIJ69/d3N4JcXfpa/LLe5KKGank0fAcn2fqen
zrd9+VguJqOm6CS0OWUYgAijagZgrs4LTuDVZwTzqKGctHR5BqW704q5aWu4toJT14a8roh3gXjg
/QIQeSnlMQFkwIqJabJdmqp6LBH32LJzpyhIKysRRLw+L71uZBZQ1FGC0ldPX2kM+hD63fa1+PEZ
yZ/1ctTAcjbJovnmtK5jo+S7bj0KICROtOFRbxXrvU+8mubW6qfvsbe/bpknZfpSgH88tGOL95f5
xQxRBGs4iRT/2TEoWlM545AcPsUz86THJByvmB+rK9j0alEXpKZmHadEyb5aII61MI9PnGEoLsCZ
7NTQ2WRJFLoY6HJWNqOum8vMUNyZMKWtRToTqH0siKslUQJWpzCUvp0Z+wCRzEaCO4rKqjNyYS91
/SYIivNpKqmJXX6VtnQoKvpeoo44nKLSfaCVuXeJmJ+VxqgH1CSiBKVmkiC/2kVJnF8Y+4JfSfcS
askC/cw5h096k2oDAgV0WWV9IpA+u0p9gEXI73aN/XUBBgJ+DVORwgGIQgyTmpt+P+Tcw/s2R4su
pyqo7zTlxKoKjPdj9W9/F61zurq793hC7rxOhmNQkRFhy3ub+3aYFiWQaa0Ywdun/NadxkHQWl+M
xYw4s1WHFTUJRjX1xGm/Ch63q9DR7VEZjP5Th9ua6W6Bgqw/nnxUYXo7SsYS/AC9GjGGV0EPesGW
MtITXJdL/QHQIxXtPjRwtYOofZbSFv8wZi3z6RgbsRCcKz5QTzNo2Hefg4P8aEfhCZWu+AW3GwmL
o6n+1H/yzJazeS+uNIlfT3bBUuXmTi8IGTLCA2qSOAMox2ovfggD0vZQHltbrmp2i6mkhoDOVQCQ
jGIi/leCqHxpcU6vUKOc1Z9b7Vhw6xVEjmFV4V4njdxt4zJCHJD+H3ppmLgNDJ65trr1yb58NxGd
mgE2nv4N6OQG2YMorWbsWA4DESo1l/dDKBBnQCBjgRrn+ogM8JLqFJD7X58DAIHDtE17PVqJTWCp
ROtnLX5IT/UYiiBUouQF+53SOjt/zOVSlurAaNoCM4JzcdY1gSrNGQUR4wsyGobkda1UXqm13TNq
0UTTe+6lSZ2W8a447ayzpHnDA78B3J3Py97QSf39Sh1RVgC4nrZe7YBocfqndgKrKSrXTh8qf+E+
Yk3PwYAlsOYYTdo6y52cr6d8Fxs/8rbVnCvXVh52TkBTvqeNE8QVor/M4NWFjDXP1SWxxyeuNbtJ
TLIA9NGPg9x91m5DkqMysuliyH4KZQZgdsGScICHQlUuLxDaj6aYFek+1HJctl9awEPSTAFinRhm
ZvLj6ZOo+9EdXElKz7ljlJnHHs+ASZxcFda5K6M47S0+N1MrzUus8iQk+TMs91ZFHXoLp31jNaPa
edAeocOY3aimJckOVlZ33l0NYhNVigBifUksdEePgSBkhfOT7iHS+viWDbYWFfo1yDpkKasZ5lnL
dLpUPe2qrnIpstxQPob+jRFvFBU4+fxol9Zv9U7seA4sbdRqrq5e6afC2wHEYAkIU/aP6tRaTCly
a+cL0eYz0PqgZfZWb5jNrkXdSs+x3ZU4BDYpA0O0QoA3iRwRXJRQiNYjNBgQMMAXdJlVdwaQSFZU
ne9KHAAO+zSDmkS982XsYurxkHBE7CuNzjGUK1Q2ELwNJEKhtEzm6GAbr2zHouGaE6/ZpYQ/10/N
2n4KKBe4bOthf6mS2LE5uOcrUM7L8dGrw2n7dqlWuSaYS0RQ7cvlhHUUAYGkYzLbIVpN2aKrFMVC
+/IUrrTwfIz1sKz/I2Z4Icx1F9fLVbAnDhgij7Zfyku92nCTf+co74pR2yYahscu/Q13bSXT7xkL
Pap9U3xGvDDoY+5rUWiBYYRTIYrnEx8y7SVSjiuJlXxVM7ydV+yWkR3c9PWJwZCPpRxD8u6CHp8U
PHDH8+u2mc5X3WEexKPdbES4lTlgKzyrfb9ZCrdkC0IgeJlqCA/tjgUCOM51409RpCLzpKxVBwmg
M4zjYk4gj92QEJdiE5RdxPDpUto3u96VzQIUUy8zYOGGFOKJcB4BZUxanl6WqorM4nHgRVsVXm0d
HzOZyoZnQuXewaGChoFYHD2q8/d4EykvmyfeVoDIpwq8+Wwo7UjInvAZvClDvEYnOsqJwToqzC9z
Lpzpsd34FAM8pcxnLja9WctEEDkK27xNs9UupSPMdJAsL6P/ufL3AK8flthtmnsprO3PRq7Psiot
xzwS5nCV9v+0RajGHuPhMvgENjv6uCQVfRDT2AIcudCpInVw3rq7VevaKIVBhaayqMErjxYPEU55
cFa3LyIM+qLpjk9Op1NrozJ4hGYgEJDmwXJnc6fz6IQrJ9Ri58eSsyGmE7GS8xcsKsr6NecO71RG
BU7a6Czkt70K+Ib9AQxFuotYRR0zePNi4ewVPOOknY/pwhc+MtL8SJ0tv3wu9ef2y+q6lYBy0OWf
jUHbNzYDXRe//EUBCoYoWOjxS22ldou6/Mapqfzl1FuRqNxqDpBCiQ08mYp1K0MCmBorjsUCaHAK
KuiDpS0TlFV87FLx6XYodKVOmPBcNW+fh+2Qu3LsY5aSdiiptNKY2WMc7X13yOWxXYW1RGkWlu58
sq7Tgvn2YXxvR6eAe4zX+WmUEMWxQr4jN0HfoxoYBgbuqJ1Bd9wYU3/IjlPIwGItCgHOBSa8wnIm
BDCt0Ns0O2avyJPHyiN1ZgjfpUVx1HS+C3h/L6Pj2NUJRh/U3bOmegYwx6ihs7NzPZqkSaIol2WB
ZViF3keTsv6LyaQ+8l2L4MIUrN1g3xTCUdPbGq3Tk8HYYt0cwveRhy2h6fXOV0MYJ8HR6C3+rrRB
TTp2LuVvJ1PCA6QHd+pzTabhFZRDAmEl9pCC2PpLJ4NOQ9NERQKQa3rzEvsp9NzQHWilesP3ae9T
0AGAP2WuLHPhnJaInd7wGUCTN5HEv5vHUoXwCt8pUizWV8/7vyI+P+H7yFoqhv5R+XA5A74oeYQd
JkanNvzU0zZ0kSwNRuZqV3zsyDvd6ywAa5GtuaPQ37WjZ1kh49+YuezT3xX6JyhpX3hKcY/ITEEK
nTHk2U6WOX/6ivCMqT6NoG7K8NaFnn2kEoG/ym6cdAl4r0C2gwCGPlx4F45l2L+h0PkEOgwcdgi0
Ginvwf2uv7NgUD4qwZ/OI9Aq/koc3CpUyZpmpLPXo2/iHdYoINKSWas4MD3Ynd1KJJyaaYxxbX3q
fN3GfaX+E+oDxMMjKSVrTU03LIxi575gGuaPeCFwKdQzdLBiJcmvzymKQVZP5I34A66lcsota/SU
u/3Qb3Y5ounUFH8w6JBThzs/Z/h8rXnSaqnoGS2blS/hlEtfspDyKMREVVV04B4ossTCkFNo9RyW
H9Eqt/zHhJ1HvHVsVqJ4dguLKaNzdEBfucGUwtzvzqVmjrbv1N3uK3vMqMFIhf3hi+KX6E2QtwDZ
39LWbNnoppPcWCIUYn1YWtS7p1RQ8IgOTgBy6T6KKbc5Zr1sW3lPH3wr5O6twYcCNEoxFG7arRal
hL7ttnWhmhKgYVLeDAhvjDHtYOEm7XPdSwQ/XuwPemesQcs0IT3nK+cS4k7H1zprIfumfuJIMl3P
gmIrjq34XIxtPLyoI4mU8JGzKaALzR92tQrP47wGxaK53sUoN8EX9EPR+VfuqdYsYc1GoVrLlVDl
mXpcX94pKA+eXQXxl0MUk/4KN6f1G899GS6HXYhKsb+OsF9qzzCrz1PuIU93mqN5uV7RUrQA+G9S
zEwPDsuSza4vuKpIfoSAGxyJE8H6LfL020NJnkZy8JjUbQMvk7nOiDWHGhnVKnRK9JFGUrVcdY+C
Wdsxu70yIwzw6FsgmuU9jfwF6izPBUxivDaHRQdWQczlT87aVOf/asrJC2k878+5xddK7hVAsz8N
/S0nB/meQ3HU+P2Ig9QVIFJrMTzuN7jziioEOYfP4PeOcq9arow+3z0C5sebGIbOd/8h5Z5k5Oay
5c8tKLDvJjcgyV79RJhR+G/22JT8mLbTmaQgzG/KUTM3+iOPkL823KdCQPIsRap2O8DganNm7tAL
zbJiIvPwGyR39NawhyFB79ff8EcpZ9+cOy+1Xm8fOdZFm3u4BZSbjTX4LQrFflVJJ0qi4rsIBGsX
iiYCuWr37lvDnHRUx5zu/ZMUJEPCZmpbSH9+JRMgPNf098ZiyQ1yMPN+NmsC+BDvKtRDCuGmSE3g
qSWa2FUpAI30OS2ZLRX7XLkSjnJA6iUCTmZFdemSI756aLxoY6cHH6Z6XL8cJotU6cuAQVCuO+ty
xHI/nR13MsrwE+sk7p3DzBIvSiCxb7tHZXATnMfKm8+Lbyf7/EU7iia1mM4C8d+AIzd/q+y0mKNy
UuyEb9aRVutowQl6ku5hYPvYmZKhxaDBfMDKm0DeMvhxCn96BZPGEb4/ltMtcCAYBCF1BfPiUBFl
WBvRoOqSbLZhwKQkUOd+GeBqPdwyTcWLirbxQ6TRSshSE0hxQiMLvN92S1P1wGRTlnkU3H1PJJNF
VYdx6k/otqiCwLAqxdwlaWJrmjgDNYtxzb0WpM/IGtdSLv7ATYTE62VVTJ3m0KEiWbsnGHTRKLuK
OMjrsHdSIvYODT6zGvJUbNQzPLWGcaDO+jG1pU3hARO/13NKUzoMSXQd2eDmezhU/G4tpaTrHfdI
RKvjWfd10u5L9fG5tPjCU7V02JMjWtFhyBjoEQM7JST7HGxaASzlMFiHTIV3FZ82c/XtWOsPl7R4
zusPgh0j3+vTMlTIXovFNT8+T/LMF3BP2yvKyPCRVeNo4iwBn3tPz7iHwaHARJKVDxuCWMqt3YY2
JPn2MK3jRLESjD3yaUIiYw1GFKh+VBMv+Qz4RqiCczoUksZ0fI0vgq/aXoPE5UgCRQ/iECjiiZQl
0Dvi+CVDXNkXS+IZCpJ1UC++Qvnqou9kte3L8YQ/R1ZeSBs/JDcKrMPGyh7wD/94VOlEmw/+QlE/
6tZf9w5BUE5MChA4mqtD/bFQrsmVDZilBnTsL5eso0W5OGNsSqnwAWhvkWHsEjIY8QjVRAJ1oyJr
2ubBlNdgHfBGOhgDJ2bVOymU+fd2LxEBXWUtg+xECLGy3iqhSQV4K+FsW5XOatX40vpgApttIAle
068+y1wzyI/1ASkUJ/CBDS8aksUmu3CC7Owg9qQ7kaoJCtpfyPQGCd7cYAOugoeRo+cQh1gFB24O
yiBjPuYwvCDMq9kUPzZUNBVoKwXYqdYekKn36DKk7G3GXmGKmnIaSeC1efmVbeVBmeVK08ij1O6o
PWzNzgh6YKY+eBbRD5vMWJqQFnTF2iL7oabhMv/DuH2aAze54iziWNo++4o0GtrL1dOD+aCRn5NE
asUOwykrnjhsJH5tfaKKpgocPvwlwgM7F/5e/ltKtBY5CbBxZhouUkH5wGb5gNTRyIhO61HOvs7Y
PHn0xWf17SGvE3tHzDttwgAgDfOHC5+3UODa0ZhZKUYkoNefWjkuOHns4/q0LaxBtTcOQgUx3F/u
qV6TuepNhGN7fuFuUccJ7M4dDUw8KEjCwM2rHgGlCiZbKBauiKWaTUuYwB4AFV8nWT+Eri6fObik
fYU4JRAOYvnvX/UaG4V/l40+zcI0tEd0TGWObmXKdDt8Mr1vDYeQ6EDBIhojb0+vINDOwM0XWYW1
JshJMjbtJop9yJVV5SD9evAAjzSZd6PuTGt8pYKGrY9YA55VQ731W/wZITEyhyyh2Ct7ckAci93a
1YDflaT7pVNeVbdvwiu8gKwk/pr4vFGOcy4VN95uSAHP5nrY/3ZXo0Y+XefQs1hjNKt3a2BV9OO3
MCZXJI6nY1ZVBjH6Iho69u7ORWHgfUo6hQ3PjtquA0msOzNDY3a4grGgVlOMnEqaE34vhN6hWq6f
7JvXJHJ9aCg+Z045K8dprNMarjNjBviKDVCnHC8PWDnQFhTJA1EkmVcH31Jd6hC55ROnANSg/N1K
UZESJygPzSOmf9autZCYC9MoFMNuMQCC/+7iulI4DmxpLp/Fx72MBk4M+txJb+sM5In/iM7qMW0J
NbohDGRORHpw/YDb9Y56ktfN+AGiNK4vWaA1e1VfLs80hsU86URNe/imbA8q0WJ7hFJ1ECSqv6SH
s4OhtofUwugOykQNxPCaKOjaUrJsSDDvDMc5OK9x00YL2pL9PluA2HY+ab+zyLqRKzZLzFvvl5rd
hfZjnJtSSCo0WRqCttBli5Z0TXb9k1nSoCN6jmbhbSEwhw2bTAjofTG/spWmikFscK+qGw8Z55tr
cdqgrGlHLbTMj4XreBi6vjCJt/bVRDQkN0EInsem6eNBhJsJ58XU6IbFKu/kVtq4jeNo83mcoW3S
6Grb4bMJkPP41aE7ToRX/sSMlAI0WJj8/LxMhLhDYZzfknzA6wvZdd2HV0dv7d8R74+veTRMmY+R
MvIAgde62KrmZIJPL6QTpKjTcxF8gm6P7uugsfzALWVjvpFatx/bBXe3U54k++eYTyyUVjMXg8wP
dQ25C5uhcQGEt/sqGTK8ck+pl3LuWveuNDgSoxTDQvBbbChUH2YIhKVLS8JvzVO1bVPQt+akhjGB
0BB0UfxZTG5C/svDznojg59wzD1MLU5Bje5yvJq/Sfe1lkLOyJm/k9zhGlatMb2sS03S2Y/xBFFQ
FcHaDmsmwlItgsF6JEOZTUpbsSacM9tsbVAyRU++Fe+C//Nvz0BCXdbP0jRJi4Rs1/V6W418CXYP
QYZnocdE2E8R11FX+GFbxXeoUyjKrxwX7jm+cvPNzIgoa1ZPMFoky1BFlRUU3ruw0MQm9wZBaamV
BZvedF1X2utj53bOcMIEAr18kiJO0gvzwykNXd1eXCUqZ1Q4trE6tfs66AJYjSahpjIrUWPNhS8Q
Iuq9jqje8BLSFPvH/t9jUWA8+OvgiSvEi9yK9Kym2q43MhkhuE7P2rbt9BEyg9Xev6PLEVlhlJCN
e68OEU+QSwbF1O8lv/2edGh3RcAww2DO++3E+ksvql/KadQjyaSzZE8EpzTl3QZTl5RF1Bg3AT7A
hGTrB2lJVreFgnUCntiq88vbTtxy0XfEQcATmuEc6gvqVmiWH2bgQ67MCsUt7xFEzTI1dUGHTAbF
MhukIolVY19oxBibD8AXtVHHFsO2CZ2M+4oy8pD2tpUQLH3Wb/mO85dkmbs+Q7iMnCe6PTdh3znR
NKbRS5qDfMMv8H8ylmRNFE967RzMNpegcEvSUgZxWlRM++3upHhRIxW3XCc8U2jTdxctWPFNl1vt
mR3aFmCxICU0vJSaow0JSG5dAYAFTk0MNM2E8LAohWPRW/QuROyfBgq1CPqsYeCkHx2zkbfAgKoz
HOMsiKazxDlr7thkz/q0/SD2W9AoQHpQ7sQdTUKbYYmGYCaHrkehMKZFBldrItuECgBwS9lL3qCX
xbHh8bJB7Lwc2EkW8XQCxZUHCg0ALendlX2MbBiepd3Z2pulGvPi0OpBo2P9+/dM6rkjT4HivlBg
G2SrJfCfGVVGqln7MHLk6902nk/RGnGAGbhofjphAk1nJMZMDlSAvmpQ63BfrlLXUb94qvZEys/i
ClBQEvDhkzLL/1to6SMeaagQN6Ejh3gReBGhQBNykBC3W08vsGSL9xbek4OQ/dAJy9PE0EPHkJyX
AGRlcbyZZL26JZtj9w5+mkUodFG8Y3MUBj0x+C6lYO9fHz6G4vApfJOU1+20UQNsU+/7s9pJU2TZ
9nTYvphfQwnYnv0GwnnPjNte6yCOFm5EUXprvZo7aiWi9LJpQYmQwSL55mnQWDzfbMotgxOxnCO8
bMHCqFhoVEhGe7Bypov3V7gm5SPOSBmYPX3HwnREQT60siYb/SD7zUjBswEVoOsY7U4UKpmJb6WT
4SU+0EiLhCe2YLKyJS0cQd49A+ds9QaFgt9npWF9brjCO40xEaVhI63yaoKXSyz45ehV/dFVKPai
zhzzcqJ0fOht9gh+6SD4uEwZkB7NIgvukw5rk0vGk83tWZh7DfZKpDiG8clKzVrVlgErgohS+tcp
AspwlahnhbSeFg1p48WwcIQzs14zykeouXil5uwGTPLzC8xNaHn7jw8Aem6R6wwLYP+QjZxMarPK
PfkDkKYk0lNNo+xgXiDxgDCVKZ1lOn4VOd9Ms1tL2J+I9M/skLlfFL3qYyZy8p1DBcgLHzIbKjlL
MmnO/0GHa9GUpbDRSbuRAwgU9I36XOtWrRF9ik7ercmZJhQqiMup08SwqTe/U5hl7DBCLJ/pJ8oa
O/HGKhjfwVlx+idrOzLwljLeI/CZf2eurBR60ZQtR6NIGMIND2DLmWtWYJrhipDtyigSNMjw2bLe
2ypLNZ5WO8F19al3Ms4bsR0YvIjRhci4qLJ6bvWrZBPN2ZpGDUIYuHxJY1IUlEtbWrEsoffwPbtp
roourGH+cIA+cTuMVM++grbpMVpie7Yaa9fhpzDZeHuYCVsmfzBDG/3VQbob4/uM1eNRwXbZ9veV
BqfE+DWEGZYtmNVsiBubkCL3ww4fEY62R6Ue3kremPJrQW8PLo9jOy9WM8wttbSRT22dolWj1Z+K
DwyW2Q2swcUkw7I4p2gC435lP2t4kMjzSCCgfgxq9wCNq1Wq4Jwrwl8UDzo5gx3FsxX0C8IQbgj5
T38q2eSENUQUYPUnDRHGXNbZ0HEgBAEjuwbXtkf2QL8jTppSPoGcZdxriEDOtXY63mQTSHjHFl4F
0ZVrVTowAqwsM8xFhUwudlYW6hhT96qsm7ETTGWWs0nFr5/Qt86qyW9I1GRjSWvwcMhYXzPmXpXq
87D/ovNO7paT62wCeaSJBLrcE+KldJI8CRUBWDrJRIcJ401cbPSloeYTrK1zyOK3gv0aGszEY95j
OakivIGr3LpN/y2hiJB/VNXqlYS9VPrq5RvO039cKyBNDSJuWreI9++LiwkOnl+ZB4yKJ2K3Pc1Z
gU6WhQKiCmPPfy+HVtl4QCyhv9Wpq1+4lhQq0u0kas4sHXrhIaSxYoDvryfckKfbpnsOM8lsj/hp
itNbJuLxb9+Yy/oMUzxeL9xSVdbQvl26T6wtzNLhUVo7cwutLYzf0IqLqwIUxygO2qCoaXX3MKuZ
CcP9DJTRWCnDhxVAmVmWmOazJQdCgr4fsOQcMT5RAJ9RPbTiGk91uinoq3LerLZ0ZGZrXo4GQhdw
tzB841dYfWEBdtyTNnba0JgZ9WGfvQ62HsROqiqoB0Rl/4Sk6Ve833ArJ1fkvRBxb5Xpjg9WVM5C
zzjBC1X7iZt2KzUxG+zvQIAhlpC9w+F6HdmRJqXmbqE0T4hYRO1RrG6lB20GdQalRe4YzNQ2n/o8
CUEyKQbUlLzNsqObebeOeO24vRfnyQAMxoR9EA7HGBNH/nhggc8CXIOdhb8sf82wmQZmm7IgTG/s
yhC2Mdh12HLzIewfcNiRu1Cog0UMJATdAp9Rh6JMcH5GQJ4/dVxGjUhdvKSwv9jXCbWHvuzNi4it
UwjJTMGEf0NCx1Bn7QUWagHGLOX/5oO9Qz9BZx8GkDJb2UEGOfmDZQc8v8fBRl04pAM33sORndD4
z5wSPw5MTTBHTNHIc3W2eW9/E+EmESA540OLCD+jjDw0pdX3dnim4rep4fjAzJX8t+QSLM5Wntse
ZdzN1zuZ3B4rg0Q37cjWBk3Sa/NrxSpM3MLLzrFLu4wkvpGsNDY2OsMX1q8GyQsKs49DqCxED0Ru
5dqcSysq0EK8Nwyfiku9F1R/kS4qyO/cyQ72qpYvYIr1bmfCtH5XUiiy846Ur1iea1h3NSLKB4wV
V/zTf3KRIOgcIL6NBhR7ZeATMArO8ijICNY7+z5K2cHpNkA+k5mZMDIkRDilr22BzxvB8H3J3Lly
pltX261iutiB+B342/fLI86PbTh0cpBCZWAReh8coFJjDfVeqD3ZHgmcrTPBR8i/jW3WPozhlZgL
f3lxkzZxQgu8T0J1mH9+XSo09gieGXGxJVvgf6u3sLL2UdxRcsLy3copAepIhmyKI4B9sUpm+o/4
6S2JrPyPHAEc9gnZm1iWSbKeCvcBZSs9pI33L/9akmrYx/MYabL0vkU3zqqtL9918DcKK6oEqABr
ghV5GQhEwUcX5OpexaRBFM2Eo9aydg6F41I7HG66hBYKCpXFhGdEN+lvxoHU70faL1UxQRX+b+uq
BH14fW11PxjfVh4r2ARtOkMPJpZf0k+vDBnXVmtEMtvMRlYFxUYKavoioWjBSsTtvlNsZ9NHYxay
8Y2tq5ZL4vi7PonaM8yD4uAh+l2c/0LLqCCYGgJujOI3DmToClxW3a+eYA+ZKJw/0QdEl/lnPj2m
GOnl2Nx1AVkC1ZTObRhugEUGY7rMZImbTLXY5diHeEFzeqNnzhkRFIKEuu8g7ayMUAWeFWeCJZv7
FILE/XFiNacBIZbNOIJWFe4Kmk/GuH9SJoMBgPBb3UQH7awp15DDwcKRc8bF/vPaXoHHED7U+KaB
1prkigN5r1/V+L9vsIjpSaYAsnVgbh3b1yJQnrx5tR7OY9vyZ6Av+5liL1MFmjSO9XyYa3FI6Qc/
b+P+982PWxyr9/jH9roAX5EhZd2NBOg8IK0qbleLMu8o5zQ9G5z2uvuj0uX6aZaqXI1E2peqPRM/
AeExL96HAjzg+pw+GkjX50nU0WBFWnJuwytMT8OIbSaRj2PmM7G70CnxBbhiF9l0pLHDo7ssk6q5
gp+/H9U68wdjMBofo21YquPeNg8mq3P7TxM8ynvYkWcnfNY/0hychKypDQU7wiB/+droSVQOKYVQ
bxwSSpCLcrc6wZb9kjCHxhbKSImbNMsR3lvrNPwycvYU/cYeF5Aw7mTU8MUdd/iz+vkxcV4IZWY6
CQq8zr6CWG+Xz/loGBNRGc6kW8h3KOOBJ8bZls2zsaAR8pPwDxBiH5R0dGxBm9eDCGmGARCi2Vat
TEei6lVFqRs/iXcGm4Z+dPUN6iTlzLpBqrSB/0BhjmWkXEjDD98Oq53+ShQ5VbHMjB7DnTdfutSR
ebWzc8pPg373RE2lrcpoS9Jqgi1/Hcneg/e64LcNQJl5/4S/KonQqje41WEQb19hFcAv8T/cuTGz
jRL9xIRJQ/Gvl9e62G3RbNH5IZ3oF60a+qVrF2/Z/KW3jh6VzCEzv8AFvWQFELVMxyTSULQi0iVl
TDDpaoNtD6p1Z/YTi7n/8ZIB8+t2jfEcgin2zIpahIO2QdDlHvGRRyOaBz3T/kq+L2mvELXhuF6W
yJTVu3NhmwIg6W+lGrQEelj21VeBZ1LJUgzZsWDFvaSyttZ4CakeVe9dCr8O/ETwh3J/gA7/lF5W
xYvl7P/430wuckPVHhpiMvDyOIinUB0LLvRVzG8x3PjSbeTIqGbkBYssmBjFjxWTJbNS3cgiAAAA
/8tXE9tDl3EAAcqHAoiDDrHh2cKxxGf7AgAAAAAEWVo=

--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="vm-scalability"

2023-07-26 10:42:58 cd /lkp/benchmarks/vm-scalability
2023-07-26 10:42:58  mount -t tmpfs -o size=100% vm-scalability-tmp /tmp/vm-scalability-tmp
2023-07-26 10:42:58  truncate -s 134822256640 /tmp/vm-scalability-tmp/vm-scalability.img
2023-07-26 10:42:59  mkfs.xfs -q /tmp/vm-scalability-tmp/vm-scalability.img
2023-07-26 10:42:59  mount -o loop /tmp/vm-scalability-tmp/vm-scalability.img /tmp/vm-scalability-tmp/vm-scalability
2023-07-26 10:42:59  ./case-swap-w-seq-mt
2023-07-26 10:42:59  ./usemem --runtime 300 -t 8 32195141760
36219534480 bytes / 206695402 usecs = 171124 KB/s
454860 usecs to free memory
36219534480 bytes / 208436687 usecs = 169694 KB/s
455819 usecs to free memory
36219534480 bytes / 209022378 usecs = 169219 KB/s
36219534480 bytes / 209417096 usecs = 168900 KB/s
419861 usecs to free memory
442852 usecs to free memory
36219534480 bytes / 209953975 usecs = 168468 KB/s
36219534480 bytes / 210258746 usecs = 168224 KB/s
463283 usecs to free memory
36219534480 bytes / 210278639 usecs = 168208 KB/s
563992 usecs to free memory
36219534480 bytes / 210829070 usecs = 167769 KB/s
805476 usecs to free memory
791404 usecs to free memory
2023-07-26 10:46:31  umount /tmp/vm-scalability-tmp/vm-scalability
2023-07-26 10:46:31  rm /tmp/vm-scalability-tmp/vm-scalability.img
2023-07-26 10:46:31  umount /tmp/vm-scalability-tmp

--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/vm-scalability-swap-1ssd.yaml
suite: vm-scalability
testcase: vm-scalability
category: benchmark
runtime: 300
transparent_hugepage:
  thp_enabled: always
  thp_defrag: always
size:
nr_task: 8
disk:
  nr_ssd: 1
swap:
  priority: 1
perf-node:
perf-profile:
  delay: 90
vm-scalability:
  test: swap-w-seq-mt
job_origin: vm-scalability-swap-1ssd.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-icl-2sp6
tbox_group: lkp-icl-2sp6
submit_id: 64c0ebc6f533737f77b913f5
job_file: "/lkp/jobs/scheduled/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-32631-15udlva-0.yaml"
id: 4d60dffcc9b0e31463ac3da5fcb51f85ab904fea
queuer_version: "/zday/lkp"

#! /db/releases/20230723201600/lkp-src/hosts/lkp-icl-2sp6
model: Ice Lake
nr_node: 2
nr_cpu: 128
memory: 128G
nr_ssd_partitions: 3
nr_hdd_partitions: 6
hdd_partitions: "/dev/disk/by-id/ata-WDC_WD20SPZX-08UA7_WD-WXE2EA06X8DA-part*"
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL4204002V800RGN-part*"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BA400G4_BTHV634503K8400NGN-part1"
kernel_cmdline_hw: acpi_rsdp=0x699fd014
brand: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz

#! /db/releases/20230723201600/lkp-src/include/category/benchmark
need_kconfig:
- XFS_DEBUG: n
- XFS_WARN: y
- PM_DEBUG: n
- PM_SLEEP_DEBUG: n
- DEBUG_ATOMIC_SLEEP: n
- DEBUG_SPINLOCK_SLEEP: n
- CIFS_DEBUG: n
- SCSI_DEBUG: n
- NFS_DEBUG: n
- SUNRPC_DEBUG: n
- DM_DEBUG: n
- DEBUG_SHIRQ: n
- OCFS2_DEBUG_MASKLOG: n
- DEBUG_MEMORY_INIT: n
- EXPERT: y
- PREEMPT_VOLUNTARY: y
- PREEMPT_NONE: n
- PREEMPT: n
- PREEMPT_RT: n
- PREEMPT_DYNAMIC: n
- PREEMPT_VOLUNTARY_BEHAVIOUR: y
- PREEMPT_BEHAVIOUR: n
- PREEMPT_NONE_BEHAVIOUR: n
- PREEMPT_DYNAMIC: n
- PREEMPT_VOLUNTARY: y
- PREEMPT_NONE: n
- PREEMPT: n
- PREEMPT_RT: n
- BLK_DEV_SD
- SCSI
- BLOCK: y
- SATA_AHCI
- SATA_AHCI_PLATFORM
- ATA
- PCI: y
- SWAP: y
- MMU: y
- BLOCK: y
- BLK_DEV_LOOP
kmsg:
boot-time:
uptime:
iostat:
heartbeat:
vmstat:
numa-numastat:
numa-vmstat:
numa-meminfo:
proc-vmstat:
proc-stat:
meminfo:
slabinfo:
interrupts:
lock_stat:
perf-sched:
  lite_mode: 1
softirqs:
bdi_dev_mapping:
diskstats:
nfsstat:
cpuidle:
cpufreq-stats:
turbostat:
sched_debug:
perf-stat:
mpstat:
perf-c2c:

#! /db/releases/20230723201600/lkp-src/include/category/ALL
cpufreq_governor: performance
sanity-check:

#! /db/releases/20230723201600/lkp-src/include/disk/nr_ssd

#! /db/releases/20230723201600/lkp-src/include/swap

#! /db/releases/20230723201600/lkp-src/include/vm-scalability

#! /db/releases/20230723201600/lkp-src/include/queue/cyclic
commit: 9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c

#! /db/releases/20230723201600/lkp-src/include/testbox/lkp-icl-2sp6
ucode: '0xd000389'
kconfig: x86_64-rhel-8.3
enqueue_time: 2023-07-26 17:47:50.726705503 +08:00
_id: 64c0ebc6f533737f77b913f5
_rt: "/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c"
compiler: gcc-12
head_commit: c1df6a9bf7d948986dc6a733e86807682f2c5e91
base_commit: 6eaae198076080886b9e7d57f4ae06fa782f90ef
branch: linux-devel/devel-hourly-20230725-041349
rootfs: debian-11.1-x86_64-20220510.cgz

#! schedule options
user: lkp
LKP_SERVER: internal-lkp-server
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/vmlinuz-6.5.0-rc3-00001-g9e46e4dcd9d6
- branch=linux-devel/devel-hourly-20230725-041349
- job=/lkp/jobs/scheduled/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-32631-15udlva-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- commit=9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c
- nmi_watchdog=0
- acpi_rsdp=0x699fd014
- max_uptime=2100
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/vm-scalability_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/vm-scalability-x86_64-1.0-0_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20230406.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: lkp-wsx01

#! /db/releases/20230725104851/lkp-src/include/site/lkp-wsx01
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
job_initrd: "/lkp/jobs/scheduled/lkp-icl-2sp6/vm-scalability-performance-1-8-1-300-swap-w-seq-mt-always-always-debian-11.1-x86_64-20220510.cgz-9e46e4dcd9d6-20230726-32631-15udlva-0.cgz"
last_kernel: 6.5.0-rc3-wt-ath-05971-gc1df6a9bf7d9
acpi_rsdp: '0x699fd014'

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/vmlinuz-6.5.0-rc3-00001-g9e46e4dcd9d6"
result_root: "/result/vm-scalability/performance-1-8-1-300-swap-w-seq-mt-always-always/lkp-icl-2sp6/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/9e46e4dcd9d6cd88342b028dbfa5f4fb7483d39c/0"

#! /db/releases/20230726164648/lkp-src/include/site/lkp-wsx01
dequeue_time: 2023-07-26 17:57:51.811565082 +08:00
job_state: finished
loadavg: 8.75 5.80 2.48 1/1222 13212
start_time: '1690365558'
end_time: '1690365802'
version: "/lkp/lkp/.src-20230726-162138:25256444519b:ed00671de32e"

--yCzEYK6s5u2mHX8K
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

echo 'always' > /sys/kernel/mm/transparent_hugepage/enabled
echo 'always' > /sys/kernel/mm/transparent_hugepage/defrag
swapoff -a
mkswap /dev/sdc1
swapon /dev/sdc1 -p 1

for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file="$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file="$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

cd /lkp/benchmarks/vm-scalability
 mount -t tmpfs -o size=100% vm-scalability-tmp /tmp/vm-scalability-tmp
 truncate -s 134822256640 /tmp/vm-scalability-tmp/vm-scalability.img
 mkfs.xfs -q /tmp/vm-scalability-tmp/vm-scalability.img
 mount -o loop /tmp/vm-scalability-tmp/vm-scalability.img /tmp/vm-scalability-tmp/vm-scalability
 ./case-swap-w-seq-mt
 ./usemem --runtime 300 -t 8 32195141760
 umount /tmp/vm-scalability-tmp/vm-scalability
 rm /tmp/vm-scalability-tmp/vm-scalability.img
 umount /tmp/vm-scalability-tmp

--yCzEYK6s5u2mHX8K--
