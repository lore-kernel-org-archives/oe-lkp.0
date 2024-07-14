Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835C2BD18
	for <oe-lkp@lists.linux.dev>; Sun, 14 Jul 2024 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720954992; cv=fail; b=gydf9PgO2/wloobPXgnreKfyR4n8ns45F5l6ZHY8mbskCNoa7F3lU7LNDj/y8usjJJN2W4Sbcqdx+qJun9Jn6KAnHrluaYvl6U+IgwjTM23RM2MC8avcq91rpL206NgAsghhYUnxXW1c5bbD0L0PrnnG/ZfAGwlXe6x/FyOspp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720954992; c=relaxed/simple;
	bh=INzjv4If7xZJqDSmJknW64MVCKVSL2sMFHruuPpSrhQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nel8nm9zOW2U2+ODwsVCnyqeL09DtJ9z6KKeO9k645bq429T2wZmSdIS61CMVmjhoC+MGwtdvMxBW0c33aRQLeDXORABUmWP4U8ISq1DPZl3UIVMD47WXscQPoBG5SwZOxy8w0XaEi3gYl4GuTT4Guyes3fpEWnu9SF8NW/TybA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeIMku/I; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeIMku/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720954991; x=1752490991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=INzjv4If7xZJqDSmJknW64MVCKVSL2sMFHruuPpSrhQ=;
  b=MeIMku/IfTYq2PUEtL1G402qafm03rMFBZ6uLDygziOfb/8FN0v5zzfG
   fzYm8Mlh5QErv2fvlqSJihMvSeDi/+FBzhUqGzcTjZ6UrZgNDmlwFuCpT
   XF93R+jV5HCCy9QTu4CrGGasyH1JUcjFCpEdfRapqb/vBis2rXnylG6HS
   LdDUwIVLikoXslihSPbNQfs64UkJCCCqB4Mmdc0QfTDrF8rTeMovXZoTH
   +/3bEKxuW5gkyzrU01prUv3EiftDVzyWBA7xtLRW11mdXHWwcnw02Vifs
   kKpxpgI0fJKevSDNdbCc1v8HnOiQf9Qb623tiDVmyJKsH5RN5ICEasEbf
   g==;
X-CSE-ConnectionGUID: y+UoyIY4QROhRN/Cbu7bNA==
X-CSE-MsgGUID: aR3kgQrARNyfotWJ7V/x3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18189510"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18189510"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 04:03:08 -0700
X-CSE-ConnectionGUID: ks6QdKWcQ4K+DYojusZ5mw==
X-CSE-MsgGUID: 1/T5dLtKSwWS/suRvIcOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="50107121"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jul 2024 04:03:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 04:03:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 04:03:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 04:03:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbEkpuUCEI5E2yJC1OK35xN2RBO7+Vvy5bIpOviC9Fzmga5qSG4o3j5+V2zC5jdG1x6fR407z4eK8kUAokwS7+CcxxtBF65Qd+hbWonzJTd5kPKPtOrQQp/srOUIu2J2iB1qYl26ZgWz2SgAfsvQ271/ZZiZzy2AagJ1Tk+HfFqnoUI6Eqqzv4qrV3BVMHQIK6ZyO29iKh85nteRUfNV6m4UmBv72+7pgbA6+hETJIDlLSCmArxt14Vax+ObaA6G5k9vzloHnFYh4on2+SxJMR7zrT6nGQBQMktvhcqDp0kExPi+zsJE5PO3pkimP2tq15/mM5fhjy7FSgItMHY1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xrIGAVcyiw3bIo75p1BwyVoeYGCS1ZBvw0OGXHFUCg=;
 b=HjTAYqwk22yVuoSOopG+ksERuFWBc+nldwoZwhDVfJK6eyn3Dc5I+XFuYL1qiMAzI5QmwcTzcH8/sutRDXDuplMvTCLqyXsCUTjN2+BjfQ/8pM8C+N4l3R2N6kCqf/r4lLpxQ/OeL3b4Vc7vTBDn3c7SUwwnxmo4q0I168kSrpdHwz4sl8jC/aeaJLVh5CUfLS3QsCgCo4bSFVpjWd/g24+dUbEtP3p/yFpbcGgQ/SMzQjuRiZoTHv8/47fxWt/3BEsWkxNsBrUXGTFcK4s2oy0mYLB7h1zKN+4rmoLTOi7uS8WorLpRFOfZ224Ify9lLCH8hF5LeoP+12FfONwwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Sun, 14 Jul
 2024 11:03:04 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%6]) with mapi id 15.20.7762.025; Sun, 14 Jul 2024
 11:03:03 +0000
Date: Sun, 14 Jul 2024 19:02:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [jlayton:mgtime] [tmpfs]  6602c8010f:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202407141802.19588609-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: cc74768b-cea5-4ded-5992-08dca3f48855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nH38H4rNM/hTOkjeio6V8wo7BO2Ua4V1vKnkqkZi6/chUVt1uTVTJ6IQ2i4x?=
 =?us-ascii?Q?M97eG3cJ5hc5ke7UMsvG+WR/YtBkSARKYyz0G31OzN4SqXqADwO+Owfr7Qn7?=
 =?us-ascii?Q?P7Gk1IUXumwGJI/p2CpqxVnlX8JTSyF3zyt3rJZYG054WLe+fiD8I7gEf6Qm?=
 =?us-ascii?Q?4CfSA1tMYzobqP0LQvHqf5xpN93vlCCiUM9A1OGITFQH8onGmmw6llWdbBxp?=
 =?us-ascii?Q?/JWGJ+bocc2Q/JJbvZF2Wcz070kz8dMgAvMqhLqLVcOBzncHDsJG32GqGoY+?=
 =?us-ascii?Q?O4KDhVy485uFMqgWQnURdopvWiz/9dqpaQnmB0XzGx++P6/iCXHj8x0naWxx?=
 =?us-ascii?Q?WZpM/RvV4VrtBZZ9SSpbGwu+Nc0WgjM8ZHvMMKRz2ZPmp8ZqIyQBJw5TVZNT?=
 =?us-ascii?Q?/NamJKYGvWPw1hReDo7JTNXA9XtrHDs0EQKvS+JtC/d9Ei4qgnh+wvPDCXji?=
 =?us-ascii?Q?aTN0M1kaK0sD097MZ5WYDSwsS90UndrwbeEdOE3N7oQC2TobXWg9eDCcYVYX?=
 =?us-ascii?Q?pugdijPoi0VY6Jsh6zsKXnOyXKzi9iYARtvhAymSchpwGXz9Axe1/7/kMVU/?=
 =?us-ascii?Q?TTHdZxyqEBMnaU2OH8Ac0EF5sRjS0gJll0SJMOCMz9ooL9/BUIb5zXekfoZN?=
 =?us-ascii?Q?r8t1djr9+mQTWWikpTs6aMg0jZt2d3PdWspu20RrIGzuV3s6w4l44dqPUVMM?=
 =?us-ascii?Q?PxIdmDDqcDaFMwFmUMm46y8nk1U3mOhLTOPAmK5PgtSPS7Oqi6MyTkhuFGFV?=
 =?us-ascii?Q?fDF6Za2dpMf1DIkfKc7K8HK8lTV4KK+yrUvKj/OUHBHQINtVI5yzNuDbTyAJ?=
 =?us-ascii?Q?j9+D1oPLVFeANK//hHvfCvNu+kYn4XATBC7VMJXEAbgiexkjX4b0lHmzqnAX?=
 =?us-ascii?Q?RfLFpcK/5RtjCYKz1MXO/B1UZfdIHJmBuL5Rt0lu9nf3r6gJmpMWgmy+R+g9?=
 =?us-ascii?Q?TMY0a+hqZFchOE7cMQIShB/hVxFYgbrUzM6FHyGUlCMILS6BJQv/z/ha3HW7?=
 =?us-ascii?Q?7X0zWUCvkJ9XQSK6993/Vj0iC3b7P9IsPj0JMoBHWId/37wNbjJHrb9XEBg0?=
 =?us-ascii?Q?AFmax0esHaaUVUgixQcZvTcWg45wrLa3DvuL3KuseWheT2gM/VkLSnP4bq9E?=
 =?us-ascii?Q?Dfkc7LtVQa9JbcVBkvn+O0J+JCniLz4Lp+Uq0jdY8E8L9GtkgCbmG5/A0urW?=
 =?us-ascii?Q?OM9lFcBwvXhtTNpOLeQDRVqLeZfmi611L7UIAR0TZRHwVPJWL2ctsMbjX+IB?=
 =?us-ascii?Q?kMFHQH6+5PXL0slhiJL8iDMkYg7RJQdNQLrrGcXLQb9UXnDQLyN53BPjxCg2?=
 =?us-ascii?Q?T1t/b9bCLBxzrSsPhthZcZTN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vOxZTqZPdreX02cuYT/Jw/fpbMKFoX7Y6NoAcTXkAOEbQ0PLU/PAI+b7aU1?=
 =?us-ascii?Q?Tx+uGMjmWoE09bMdKZNA+GM7dEYP4R3V5+QoeDOZgnIKgtdlOUZuQzH6Pgs1?=
 =?us-ascii?Q?5TOjZ0O2dstPhRXYQGeLd1tl3+kiJDPYvUtFFAAlVrytY9V+p1ovDm8heWd6?=
 =?us-ascii?Q?/0W0YohU5xGOgswAUR+EBvWAY9S4Kmit/hAYLG72PdCnT9uasQtLLXbP9yzo?=
 =?us-ascii?Q?ncogq6CzaaWgZpvrKksUbdVTYEQzWWSNj+gC9TbL3290qjQbF6t9ogujrsV2?=
 =?us-ascii?Q?kVEJmw5aM5i2vUomtputS4mup7oLoPtaBfsCxo/PelhmjSPrxMaRDv5AQFpf?=
 =?us-ascii?Q?3/ZhMq/kD7MuG/245icD3dR+9LKXlUmzEMHo5Y6Yni0v8UuMJU58cVRYPP9s?=
 =?us-ascii?Q?bkXcmKx/cdjX13760FsiBRB4XXaFE9Knp7a4mZPTtfq1Vu2lb+TRMb5AfnUH?=
 =?us-ascii?Q?QRbSXfUWKDYM6YFMgYou3RKw1b8TrkqjnYWMKRDMQop6rYg57n3sEpKVYyjI?=
 =?us-ascii?Q?55fkzaCIoerpaQQI2Y78xl67FTmAbgxXJwuITdKemI/nx90NmE9PYGR5FbHZ?=
 =?us-ascii?Q?SGnFHf//Iq+JksRPpmBNj8TxqP3afy+WUtxzGHETiNbXYe5Nu0zhOKwEBLUC?=
 =?us-ascii?Q?f2yjufwsx1y02lvwcHjOC2P0MS+w5s7SbLfn8toUT//yUeaxkudlq98R2qDm?=
 =?us-ascii?Q?EM2piXw8ELisbGxUqrCuL8BgjkUBDiEt1ESBaoXvtAFygCrUe7MfnIORPCbV?=
 =?us-ascii?Q?VvDZXWe9mDTS5wjdS4emc/HqI3ziC/6Vyl0MAaY70u5fROBfocvwG9xZVCDR?=
 =?us-ascii?Q?dv1o7YR/jvsDeB6X8r5Lf5bidtzavcShSNLvpr4yRUfviIaPOyjPTyfZqbMq?=
 =?us-ascii?Q?E/WhxmosN2LPVCtr4P69fJ0r1+s1MxKCM4QoNBeYrr9ClJNm7Bn7An7w10Ey?=
 =?us-ascii?Q?z5Epxi88Q49u6biJVFH32FSD4i8xw45F7CkDOSiKjnQohRkiLPgjQFUlF23P?=
 =?us-ascii?Q?0VfEWeyOTSUuehtYIf/ImjqkPl4jdba1xh2FCjz2zwoOR4KbS99EaybN0JXc?=
 =?us-ascii?Q?MSZBuGSXZz0aehvsqqOOQEcl4EEH0Brj9o1ZqSyj0CYj5S1Y5uBUI3K8eoNx?=
 =?us-ascii?Q?xSjm68NgiItNyeD6zoux0Svx+bg2aBrH4IDRL9BA6/xSYnZWAuIgU8kvCgOo?=
 =?us-ascii?Q?n/nz9ICTCet8AnZNERizty+c/9Gea1Y2N9A6meES/9j+9nWBoFRDbAIxHdPg?=
 =?us-ascii?Q?J1OXx/MpQa57UWcM/nmJTJk5asXEarR/Bjq4wLx7bxoJEPzEJJCNtz1f95Ko?=
 =?us-ascii?Q?u1epZp2D5zqWKc0+frfWv4P9ZnVVVs6rJhsuG6qDczCRQS0Zn1I/bQsM0lCy?=
 =?us-ascii?Q?NsKKloOhfnwKZbgLrwJQKffKbgH5WdseCAPMYlT4JadJnudVtRdUZW5foTO3?=
 =?us-ascii?Q?M5biiHzGA3IMcoZ1LtXeV6d0Nrgq1I74upU0P3tJFvfHnJbE2wml+GfTDoed?=
 =?us-ascii?Q?TJcZxGujNkdcMC8w5CkWDHARX92h6TAaV9YYYXnRH01o+2WF2xM8ck5v4a/b?=
 =?us-ascii?Q?mtRKokT6PkN2Wn4olftgCou9DqqVyMHbvPlRRa/r3qe/DRMvfjfGDP2N295o?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc74768b-cea5-4ded-5992-08dca3f48855
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 11:03:03.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THukfrdq//nRw8vmBOq1YO49tfAQcoavdNXYrDvkMbxNrczxecboMrzlY4aGqO6vKgyMHUeNTCh7UIQzAt1mYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 6602c8010ff4cabd759599c11175fa4d1bcd7800 ("tmpfs: add support for multigrain timestamps")
https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git mgtime

in testcase: boot

compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | ff453163c6 | 6602c8010f |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 7          |
| BUG:unable_to_handle_page_fault_for_address | 0          | 7          |
| Oops                                        | 0          | 7          |
| EIP:percpu_counter_add_batch                | 0          | 7          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 7          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407141802.19588609-lkp@intel.com


[    0.638478][    T0] BUG: unable to handle page fault for address: 20c4e000
[    0.639256][    T0] #PF: supervisor read access in kernel mode
[    0.639920][    T0] #PF: error_code(0x0000) - not-present page
[    0.640224][    T0] *pdpt = 0000000000000000 *pde = 0000000000000000
[    0.640224][    T0] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
[    0.640224][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-rc7-00242-g6602c8010ff4 #1
[    0.640224][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.640224][ T0] EIP: percpu_counter_add_batch (lib/percpu_counter.c:93 (discriminator 4)) 
[ 0.640224][ T0] Code: 00 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d 31 c0 31 d2 31 c9 e9 3e 7d 8b 00 8d b4 26 00 00 00 00 8d 76 00 e8 f7 22 91 ff 8b 4b 3c <64> 8b 01 89 45 e0 89 c6 89 c7 c1 ff 1f 03 75 ec 13 7d f0 89 f2 f7
All code
========
   0:	00 8b 5d f4 8b 75    	add    %cl,0x758bf45d(%rbx)
   6:	f8                   	clc
   7:	8b 7d fc             	mov    -0x4(%rbp),%edi
   a:	89 ec                	mov    %ebp,%esp
   c:	5d                   	pop    %rbp
   d:	31 c0                	xor    %eax,%eax
   f:	31 d2                	xor    %edx,%edx
  11:	31 c9                	xor    %ecx,%ecx
  13:	e9 3e 7d 8b 00       	jmp    0x8b7d56
  18:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  1f:	8d 76 00             	lea    0x0(%rsi),%esi
  22:	e8 f7 22 91 ff       	call   0xffffffffff91231e
  27:	8b 4b 3c             	mov    0x3c(%rbx),%ecx
  2a:*	64 8b 01             	mov    %fs:(%rcx),%eax		<-- trapping instruction
  2d:	89 45 e0             	mov    %eax,-0x20(%rbp)
  30:	89 c6                	mov    %eax,%esi
  32:	89 c7                	mov    %eax,%edi
  34:	c1 ff 1f             	sar    $0x1f,%edi
  37:	03 75 ec             	add    -0x14(%rbp),%esi
  3a:	13 7d f0             	adc    -0x10(%rbp),%edi
  3d:	89 f2                	mov    %esi,%edx
  3f:	f7                   	.byte 0xf7

Code starting with the faulting instruction
===========================================
   0:	64 8b 01             	mov    %fs:(%rcx),%eax
   3:	89 45 e0             	mov    %eax,-0x20(%rbp)
   6:	89 c6                	mov    %eax,%esi
   8:	89 c7                	mov    %eax,%edi
   a:	c1 ff 1f             	sar    $0x1f,%edi
   d:	03 75 ec             	add    -0x14(%rbp),%esi
  10:	13 7d f0             	adc    -0x10(%rbp),%edi
  13:	89 f2                	mov    %esi,%edx
  15:	f7                   	.byte 0xf7
[    0.640224][    T0] EAX: 00000000 EBX: c38590e0 ECX: 00000000 EDX: 00000000
[    0.640224][    T0] ESI: c3d440d8 EDI: c28d9e20 EBP: c28d9d68 ESP: c28d9d48
[    0.640224][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[    0.640224][    T0] CR0: 80050033 CR2: 20c4e000 CR3: 03112000 CR4: 000406b0
[    0.640224][    T0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    0.640224][    T0] DR6: fffe0ff0 DR7: 00000400
[    0.640224][    T0] Call Trace:
[ 0.640224][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 0.640224][ T0] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 0.640224][ T0] ? oops_enter (kernel/panic.c:582 kernel/panic.c:640) 
[ 0.640224][ T0] ? page_fault_oops (arch/x86/mm/fault.c:715 (discriminator 1)) 
[ 0.640224][ T0] ? kernelmode_fixup_or_oops+0x78/0x94 
[ 0.640224][ T0] ? __bad_area_nosemaphore+0x145/0x280 
[ 0.640224][ T0] ? coarse_ctime (fs/inode.c:2164) 
[ 0.640224][ T0] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91 (discriminator 2)) 
[ 0.640224][ T0] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:267) 
[ 0.640224][ T0] ? local_clock_noinstr (kernel/sched/clock.c:270 kernel/sched/clock.c:306) 
[ 0.640224][ T0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 0.640224][ T0] ? do_user_addr_fault (arch/x86/mm/fault.c:1452) 
[ 0.640224][ T0] ? coarse_ctime (fs/inode.c:2164) 
[ 0.640224][ T0] ? local_clock (arch/x86/include/asm/preempt.h:94 (discriminator 1) kernel/sched/clock.c:316 (discriminator 1)) 
[ 0.640224][ T0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.640224][ T0] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.640224][ T0] ? percpu_counter_add_batch (lib/percpu_counter.c:93 (discriminator 4)) 
[ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 0.640224][ T0] ? percpu_counter_add_batch (lib/percpu_counter.c:93 (discriminator 4)) 
[ 0.640224][ T0] inode_set_ctime_current (fs/inode.c:2681) 
[ 0.640224][ T0] ? get_random_u32 (drivers/char/random.c:532 (discriminator 1)) 
[ 0.640224][ T0] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:94 (discriminator 1) include/linux/spinlock_api_smp.h:143 (discriminator 1) kernel/locking/spinlock.c:186 (discriminator 1)) 
[ 0.640224][ T0] simple_inode_init_ts (fs/libfs.c:2101) 
[ 0.640224][ T0] __shmem_get_inode (mm/shmem.c:2526 (discriminator 3)) 
[ 0.640224][ T0] shmem_get_inode (mm/shmem.c:2586 (discriminator 1)) 
[ 0.640224][ T0] shmem_fill_super (mm/shmem.c:4432 (discriminator 1)) 
[ 0.640224][ T0] ? shmem_add_to_page_cache+0x2dc/0x2dc 
[ 0.640224][ T0] get_tree_nodev (fs/super.c:1270 fs/super.c:1288) 
[ 0.640224][ T0] shmem_get_tree (mm/shmem.c:4451) 
[ 0.640224][ T0] vfs_get_tree (fs/super.c:1790) 
[ 0.640224][ T0] vfs_kern_mount (fs/namespace.c:1281) 
[ 0.640224][ T0] kern_mount (fs/namespace.c:5487 (discriminator 1)) 
[ 0.640224][ T0] shmem_init (mm/shmem.c:4686 (discriminator 1)) 
[ 0.640224][ T0] ? shmem_parse_one (mm/shmem.c:4500) 
[ 0.640224][ T0] mnt_init (fs/namespace.c:5471) 
[ 0.640224][ T0] ? files_init (fs/file_table.c:519) 
[ 0.640224][ T0] vfs_caches_init (fs/dcache.c:3217) 
[ 0.640224][ T0] start_kernel (init/main.c:1086) 
[ 0.640224][ T0] ? obsolete_checksetup (init/main.c:544) 
[ 0.640224][ T0] i386_start_kernel (arch/x86/kernel/head32.c:69) 
[ 0.640224][ T0] startup_32_smp (arch/x86/kernel/head_32.S:292) 
[    0.640224][    T0] Modules linked in:
[    0.640224][    T0] CR2: 0000000020c4e000
[    0.640224][    T0] ---[ end trace 0000000000000000 ]---
[ 0.640224][ T0] EIP: percpu_counter_add_batch (lib/percpu_counter.c:93 (discriminator 4)) 
[ 0.640224][ T0] Code: 00 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d 31 c0 31 d2 31 c9 e9 3e 7d 8b 00 8d b4 26 00 00 00 00 8d 76 00 e8 f7 22 91 ff 8b 4b 3c <64> 8b 01 89 45 e0 89 c6 89 c7 c1 ff 1f 03 75 ec 13 7d f0 89 f2 f7
All code
========
   0:	00 8b 5d f4 8b 75    	add    %cl,0x758bf45d(%rbx)
   6:	f8                   	clc
   7:	8b 7d fc             	mov    -0x4(%rbp),%edi
   a:	89 ec                	mov    %ebp,%esp
   c:	5d                   	pop    %rbp
   d:	31 c0                	xor    %eax,%eax
   f:	31 d2                	xor    %edx,%edx
  11:	31 c9                	xor    %ecx,%ecx
  13:	e9 3e 7d 8b 00       	jmp    0x8b7d56
  18:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  1f:	8d 76 00             	lea    0x0(%rsi),%esi
  22:	e8 f7 22 91 ff       	call   0xffffffffff91231e
  27:	8b 4b 3c             	mov    0x3c(%rbx),%ecx
  2a:*	64 8b 01             	mov    %fs:(%rcx),%eax		<-- trapping instruction
  2d:	89 45 e0             	mov    %eax,-0x20(%rbp)
  30:	89 c6                	mov    %eax,%esi
  32:	89 c7                	mov    %eax,%edi
  34:	c1 ff 1f             	sar    $0x1f,%edi
  37:	03 75 ec             	add    -0x14(%rbp),%esi
  3a:	13 7d f0             	adc    -0x10(%rbp),%edi
  3d:	89 f2                	mov    %esi,%edx
  3f:	f7                   	.byte 0xf7

Code starting with the faulting instruction
===========================================
   0:	64 8b 01             	mov    %fs:(%rcx),%eax
   3:	89 45 e0             	mov    %eax,-0x20(%rbp)
   6:	89 c6                	mov    %eax,%esi
   8:	89 c7                	mov    %eax,%edi
   a:	c1 ff 1f             	sar    $0x1f,%edi
   d:	03 75 ec             	add    -0x14(%rbp),%esi
  10:	13 7d f0             	adc    -0x10(%rbp),%edi
  13:	89 f2                	mov    %esi,%edx
  15:	f7                   	.byte 0xf7


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240714/202407141802.19588609-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

