Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26ED3E5585
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jun 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461207; cv=fail; b=StjHyDYpFpDSBfaNN9tZlP+sRcqIgnY3ttaBCj6QViMOrLvnMSrFOw3cZ8q5awxm5PNDiNzBhs3vDzl+N2/OSOWLEU0mJxWR2t7Ycc73FuyPD04o9hS3YhwvDT1LxPdzEFATLG+pPLdYGoV2RF7J2I45PDbPkt9Ki+cukZKIges=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461207; c=relaxed/simple;
	bh=/Mj5StNR/fCfGOmCoFTUJt4I4e4ra+9Mf88PEFy8g4E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PR9KsKYrS7PLIsvoRqqCbxLaOD3Pr8KmjKPE/NxYYLhYeOYf7oucKqZVKDClYi8h4+ZQYTAALkjxoZLtkKISVNbSw2QA6L4RpnpIKsu7mD65tWzYQRRt8e3myTmmpaEwZ7RorXopRTuTjn9TKFu7trpa5s9e9VrDI60qxN01GvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tsy2THpF; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tsy2THpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782461199; x=1813997199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Mj5StNR/fCfGOmCoFTUJt4I4e4ra+9Mf88PEFy8g4E=;
  b=Tsy2THpFmYG35knWYynhxr7Z87D8Sex3NPGNtvrghWs/z8ul62GGaGF/
   3AkhHnxuo6NfOpN3i5BJANd+t/fOfvgCPkkZsZ5sD1UXzvkg0afKA2wwo
   NG6Wz5+YXPQBE1rk0qtpCjwPMcOfSpuQ47VXbRCItM9EJ29jX5PEqAC1Y
   ZLUq3L2g93/bwSF232pd9ZdFloeRCz1GiK+0mfIdxK3aGeF0E7YvTxRvR
   9lrMC/9aFtiNnop4WN322xymiXSwv2fI0E9mffUSlepYYE2mqWv6tpeKI
   3awuRrBX5XWPxjUn5TcswuLvRrnMBrVhjRHCj3mw7IWdq2SLhZmK5E36i
   g==;
X-CSE-ConnectionGUID: ljxYQ6X/Q0qCE2BBqRDZeA==
X-CSE-MsgGUID: VOjnezLOSDmgdU+DsFANwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83310910"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83310910"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:06:37 -0700
X-CSE-ConnectionGUID: HY4lIflyTxiVa/+BATOc5w==
X-CSE-MsgGUID: U+G++WjqQK2a+39OUe6lTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="254881826"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:06:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:06:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:06:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLu4zZoCSb/2KlAHZb5NsTBjVWckpgrLTO5b0fV7OuEiXG5MHF4+uwrLL6iqB3qKmWbesf7yCoRpU2zeVQuOE+N0I7AyXyr09FMPX+Ny0XFu1eIwmdwLte9C9qxN9qOzMKCi5ow+MANJCrJpbbh1GwkaFpsuHn/K6/ZZ3L7NhM6hcn2wS0HSNdKhWl6fSzEX+tPWtpIOOISLtzKgvr5bUj6Ew3iqyK6gKk0slDdAB/mB9mMoQfu0g+50bkJlSagSOJKTegb2cb0oMCe8W7D6gl/LZBUhwCgNGxjz74DX49owIq03TSkZBbF4/xTsH+cFGqi9lYq0crx//9hObuKW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8+RyXg1idOKSzJh0YETGQsKsK3AVSXMBazwGW6nAXY=;
 b=rx7PgdIt4AadvsqSPJdKWvAu8YaWNC1lDnA483duCyeajaVyGa6f4cbxvqjrWtSHhhFYMqwEQJ7YSeUdbiy8cNal0litfwSd2Bsb9oiphmj1y7q6q6TRypkfDkHcyL4QNXaDDEvug3sXjTOeUOHzBSidypJ4ixxm5f9gp2+Qcn9LcrqPNwzYZ+ZcfUxUYtUS9gOxnxutlMf4/WhalbwCYfK3ybBQ49Ra2ixtZIZt7XwY38TXo6PHyly0g/QJdAbqqvZkSAGA77MvGnAoQAY2nCwSDQ3AKN5ZbDvGIYyncGuvoZP6ynSz4TPC1VGtPIFejorM7jdVIiLpOukfhVO9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 26 Jun
 2026 08:06:34 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 08:06:33 +0000
Date: Fri, 26 Jun 2026 16:06:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Gregory Price <gourry@gourry.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Gregory Price
	<gourry@gourry.net>, <oliver.sang@intel.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5] [mm] 5719619cfd:
 Oops:divide_error:#[##]
Message-ID: <202606261549.2de78c5b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA4PR11MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 30dc9ee9-bd36-4c87-148b-08ded359d65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: KdpvNQvubNewvRPtTWJETDqYPlbswMppdakefo2xYQA9gbGO0ZzkOYwJNS58FAHDRgn8DEYhiQ+MLFHyXt+b5ruQrc3yeyQvtOCx61jW3+ecpQpdl5o0ODwE3AmZbBBkghctxBs74sizNKqxIA13E1ycaBS1bex1qTC6uky/rNA8YwMQmIKIaGwwI83v8vlKGqbK7XDtX1uw8JPuj1DttmvZlWoi6La8Ol95PTiIZp+CSM30K5wp4E/qhOUWzzTP0EHjBeYzyTROSyoevUZibDPi9UMhy7coeiGp6ZY7Eqe15HITm1dZhJPGhiDUHLHQ2FbwYHfrmNTDWl3aSDL/CZCIuc0tmw2xEUN5KzsQUNr5Zj5MsOX5DAowZIZfPtTgEbmr0BIAwB56xLg8pLIF5TIcYJe63DuTvgsv0p3pafJRLejrlHdGPlsn80IBqBr/gC8iL+5Yz9CgMTa5YzUTPu5TrZ5axz4V8QtbRm4eI/zapOAXwnWJjP2OEwILqlvluCQrM3t0UZt5USBd5z68Oo1kiM5pGUZm9oUCMjZUZLsCNPAC8xTMGiBDtCl1DFK2vhMygbzB/FZ+LCBdp4t32F5WfeiDoFBE4nOsCFjxLKLfW8Vff9hqC3yHmjsPNOCfTDdgR2uGEfjCLXwW8aaQ6gjOwhH7Gh/65GMeXqe98vc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAss+m3/VXd1QP/1NFlBv7dgxfxRRxZb30P49cZH5il8UHrELQSc2R9m4I+d?=
 =?us-ascii?Q?EkiM+oQmsbIYpddnkTyV5xiHg8WlxEwZakGAzB5liRcJyZx/EJxV4+6rIGzn?=
 =?us-ascii?Q?1i9oStqkA03hFwnzjzu7Xo9QN9Nazs3qovRnPbHFTYXOgnypbl2r1FnpaYuy?=
 =?us-ascii?Q?X2HiW/qBkDzLwEsWpKUQs2d/j9+0pAoqA7+Ep630t31s4xcLvqF2VDrz61MJ?=
 =?us-ascii?Q?2XISRdJyBteNS+q/Q/QTMBearLSsYEOY/VEKBviLW9zgKo2hLDPaB1q6dblt?=
 =?us-ascii?Q?NMgGiWFsRsH1eixuuM5ceG3wPoKUrQeCNY21FPvVFmtUT4YgLdqmeHvQPj6I?=
 =?us-ascii?Q?Qxf1wnwxHXlzSJMSVakeE/VVmBMuzvX4NtfLzsaz+JMwjfeV1weeUeu6B3xp?=
 =?us-ascii?Q?Z7KBy/x66loq0onIbbzAj6ftTp6Owxy/4GVrhTsSV6zNCkVM1tuh5R82vhBC?=
 =?us-ascii?Q?YqYBhAz7Vo80FIvHLysWqagD3oy5H3Scq1ol5L0kwQnj1ayrbmYwUSmpBfur?=
 =?us-ascii?Q?I9G4mv03BdsP1RQKF8CEyv7p74MhZ8UvD3lne07G8mKEMZLeVqbl1INH1AIH?=
 =?us-ascii?Q?lwAb925da34pCClbDEVBDUFe9PtSHHGy82/VOg/9gPK662hWnABPTUGaJI0h?=
 =?us-ascii?Q?RA0eL9ev8bT3o+RgX22UCfR3chcBwKKimgTKcyQnabBihXxwhZP5T1Qtx7Z5?=
 =?us-ascii?Q?0xhK2qc197ZhIdm+nD25QbGCbNEBHColTkp5mJR1eP9So/ocIx/xZIPWqs2e?=
 =?us-ascii?Q?vxaU9onxODOV1XFHETcggQuZpuVUfElucBpcGMajfA+D882hOkVQMBLi0fdE?=
 =?us-ascii?Q?AnN4S8UquKvueP4IlTXaWoo60dLPHJz+O65iTKcuYttVk6t0V4XgaJ4sAzU/?=
 =?us-ascii?Q?ziXTuE6udC423pOKf+I1HOhyZiRP/+WWsgp8CBPTxp71YOY+luiCYa8I+72U?=
 =?us-ascii?Q?YJFzZMYhDEzM7UfgiQLkj3LZId8kkWmoigMW8l6ZOURr/jpNUk7FukgCL/Yl?=
 =?us-ascii?Q?P3sjMgFdWaucm7XnYpwSff/RiZEJ3E3Gdm0EG3SaQWglODcEUnDZunY57rqE?=
 =?us-ascii?Q?eXyDQhfpeivfzx1s4Zd8oCfzJNScCxLIcI8y/ZI7eVOb56qkBL3NWuMBBLrq?=
 =?us-ascii?Q?l4iIYasQTn3DBQzUsrkhZP0/4GdOtI0CZvKyD7i9aWDbD0y2x7kPJcI7kvV5?=
 =?us-ascii?Q?lENdOfUehBuVab7MeKiHCeKAUBGt6Iizx0zGrLRIREYPwVKr76RAxgxNfIav?=
 =?us-ascii?Q?rr6kfUnZOBM5xYq119/LM9ZYiyOOtqmZGzVLgQpBIi+CSqdsvhHBI2mpVAN0?=
 =?us-ascii?Q?6a7Jv/yik+jgORE5O6d91on2dvkG3ZT39/4UJYMsc5tJf8p/FLcrla6Lyo7j?=
 =?us-ascii?Q?g9vey4mJ2dajYTf1Hv3dayxKcqLIJCH+zGrcD6CDL9JQ67dj+WXAypj6fw2O?=
 =?us-ascii?Q?j6drhIK6Xg4HjT0PbCOJ8h8lt6q3aUqYQiUlDPlvCWKqq9tH7kqrWVVWdKSC?=
 =?us-ascii?Q?9V2xWRrAyFNq91ZXR0qvnWyI6/LrycCJuO6J0U4WK1stCNp8fccLLqUscP8P?=
 =?us-ascii?Q?VIe/q/6VszsHw2lHFr0VNjH3n3I9cOEEuqQw5sF5ZtKAw+Y121YNk6PNfGNg?=
 =?us-ascii?Q?f7fi/mi5xo8j17a+WwK4joBQ+gZIgtKsKbuIlDZelThWkvswDPRrr1t4MgR6?=
 =?us-ascii?Q?PVJGyUvOtwwAJQ1qUvqczp3tU7IwS7f/iX9Pscir/41TybXgiRi3taJA8UF9?=
 =?us-ascii?Q?gFb01U6M8g=3D=3D?=
X-Exchange-RoutingPolicyChecked: itMXaQvx+78VzIFPqtfeYZsp3GS4yStDtwkihdgA9crCRVoEzDBnNZoPscER8MBXMOtrE7Z07zL36vnJP2DSZKP5QQiB8+MVZmVNf1mqzCk9Cz+abcTulfACfu3YaXDlSbZt4OWd/USFGxVJ+RkGEuypGio19HEamBNPV72sOqEclAD7ZkbuCHtJs9r87VNt99GY3n2kD65uQ7bH3Ov2SUlo1sTA379R1V3e+40uCxa4EObHcGPk+CIhZeDrx6QS6l/rlZGorGRq9rD1I2NFk9YNc4AN4ZCDmmagDZdPKzKBhYmFDDcyQqAXOG4/fSRhJwXIwlX51UzHJRg/u4r36g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dc9ee9-bd36-4c87-148b-08ded359d65e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:06:33.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atDe4X80eRjVkR1idGkUZk6LqisqcndxxMiqMEOtXNxij+XtsqjyVOQzP+d0eZq5tVj5fd+blZg8L6me6qTkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:divide_error:#[##]" on:

commit: 5719619cfde5ab0de3c5e23d5148d16f8e099b95 ("mm: add NODE_PRIVATE_CAP_RECLAIM for opted-in private node reclaim")
https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5

in testcase: boot

config: i386-randconfig-015-20260625
compiler: clang-22
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606261549.2de78c5b-lkp@intel.com



[    0.382314][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.385543][    T1] futex hash table entries: 256 (15360 bytes on 1 NUMA nodes, total 15 KiB, linear).
[    0.388779][    T1] xor: automatically using best checksumming function   avx
[    0.392592][    T1] regulator-dummy: 2147483647 mW budget, enabled
[    0.395918][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.404973][    T1] Oops: divide error: 0000 [#1]
[    0.406138][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.1.0-rc5-00530-g5719619cfde5 #1 PREEMPT(full)  450d841d236e32aa9c517c2f2614cf10e667100e
[    0.406138][    T1] Tainted: [T]=RANDSTRUCT
[    0.406138][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.406138][    T1] EIP: setup_per_zone_wmarks (kbuild/src/mm/page_alloc.c:6586 (discriminator 256) kbuild/src/mm/page_alloc.c:6649 (discriminator 256))
[    0.406138][    T1] Code: 01 00 00 89 c6 c1 7d f0 02 90 90 90 90 8d be e8 01 00 00 89 f8 e8 a3 04 c9 01 89 c3 8d 4e 44 f6 c1 03 75 67 8b 01 0f af 45 f0 <f7> 35 94 23 44 cc 8b 56 44 81 fa 00 84 00 00 89 d0 73 05 b8 ff 83
All code
========
   0:	01 00                	add    %eax,(%rax)
   2:	00 89 c6 c1 7d f0    	add    %cl,-0xf823e3a(%rcx)
   8:	02 90 90 90 90 8d    	add    -0x726f6f70(%rax),%dl
   e:	be e8 01 00 00       	mov    $0x1e8,%esi
  13:	89 f8                	mov    %edi,%eax
  15:	e8 a3 04 c9 01       	call   0x1c904bd
  1a:	89 c3                	mov    %eax,%ebx
  1c:	8d 4e 44             	lea    0x44(%rsi),%ecx
  1f:	f6 c1 03             	test   $0x3,%cl
  22:	75 67                	jne    0x8b
  24:	8b 01                	mov    (%rcx),%eax
  26:	0f af 45 f0          	imul   -0x10(%rbp),%eax
  2a:*	f7 35 94 23 44 cc    	divl   -0x33bbdc6c(%rip)        # 0xffffffffcc4423c4		<-- trapping instruction
  30:	8b 56 44             	mov    0x44(%rsi),%edx
  33:	81 fa 00 84 00 00    	cmp    $0x8400,%edx
  39:	89 d0                	mov    %edx,%eax
  3b:	73 05                	jae    0x42
  3d:	b8                   	.byte 0xb8
  3e:	ff                   	.byte 0xff
  3f:	83                   	.byte 0x83

Code starting with the faulting instruction
===========================================
   0:	f7 35 94 23 44 cc    	divl   -0x33bbdc6c(%rip)        # 0xffffffffcc44239a
   6:	8b 56 44             	mov    0x44(%rsi),%edx
   9:	81 fa 00 84 00 00    	cmp    $0x8400,%edx
   f:	89 d0                	mov    %edx,%eax
  11:	73 05                	jae    0x18
  13:	b8                   	.byte 0xb8
  14:	ff                   	.byte 0xff
  15:	83                   	.byte 0x83
[    0.406138][    T1] EAX: 08b919c8 EBX: 00000207 ECX: ccfe6c24 EDX: cc791333
[    0.406138][    T1] ESI: ccfe6be0 EDI: ccfe6dc8 EBP: c05b9c4c ESP: c05b9c38
[    0.406138][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010002
[    0.406138][    T1] CR0: 80050033 CR2: ffdd9000 CR3: 0d2c9000 CR4: 00040690
[    0.406138][    T1] Call Trace:
[    0.406138][    T1]  init_per_zone_wmark_min (kbuild/src/mm/page_alloc.c:6703)
[    0.406138][    T1]  do_one_initcall (kbuild/src/init/main.c:1392)
[    0.406138][    T1]  ? __dequeue_entity (kbuild/src/include/linux/rbtree_augmented.h:339 kbuild/src/kernel/sched/fair.c:1051)
[    0.406138][    T1]  ? kvm_sched_clock_read (kbuild/src/arch/x86/kernel/kvmclock.c:92 (discriminator 1))
[    0.406138][    T1]  ? sched_clock_noinstr (kbuild/src/arch/x86/kernel/tsc.c:274)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260626/202606261549.2de78c5b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

