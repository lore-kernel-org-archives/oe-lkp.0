Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B413F43A
	for <oe-lkp@lists.linux.dev>; Thu, 29 Feb 2024 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709222502; cv=fail; b=jGelGQzdZKEkCFs0L2RUaJNtbr9YkAItDMSibp51wc4R8SXthdSFmMfhPrXf0Utq6NHdGHL5lUHyoYEO3d6dw8ybVxteAQ7Sksddkh8tBrAzftqzP/CZ+9zMWggURMR0NjPcvOKattuCsZP5vfxvaHkTCw3msEYfJDfLr4wUOEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709222502; c=relaxed/simple;
	bh=QU3+wLYOGt7m5FofTbTie6Bj3MZbM94sAu1fq2ETa4U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oh5ig/PpDmqzyEAgXBVXizhWoZJUISrSS0I9k2wVefgdRCcyARxLWXZ1JZS51Fn5bN5nT7l5mCY3NscN+vEyi5r9dXgiVOMGr0oPzPPJN7+vG9QMWgdH0zEzjwXTt2MiZPoSdvQnoC/vYkAvEGhFWXnLGTrXW7POgHzsxm1RFLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBA1Ceuz; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBA1Ceuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709222498; x=1740758498;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=QU3+wLYOGt7m5FofTbTie6Bj3MZbM94sAu1fq2ETa4U=;
  b=YBA1CeuzHJ34ateQPuEJorllmT3DViddjhjgsXRKyf0ddF5ATQQt3iOF
   ssHorpbXujdvdDnIwKaAw9htj6T2PoZo4K13+LwtRNVph7/tgmDt1fNOz
   r70H1CQXJoj5eOomXeSHvgPSHQlwjtbgu92ffUdbsaXrNcT25aSwotc/N
   lAOzlx5BGTuJSSrgQ1YyXvwZXX5bIASfwQey2u/jQCX+G9a8afHsMkYCi
   G5n0v5xnt8pkj3sC6zfRGo2/z4EVrm0+Wr+uDKvdMZE+K0fcyhzruaub6
   4XMK+p/LhwPBjE7UWxyrPv9aiMs+MOlgQ1d3wpTXEsbI/fRhz+95/1b2W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3865658"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3865658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 08:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12523264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Feb 2024 08:01:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 08:01:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 08:01:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 08:01:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2r7vV60XXMvXUYL/u15QEgDxbGVTmfUzdFdchmp067sglIbgKzE2fnuwRMSpx++Yj7kSroTkR6s/5MV1+l/pIFc7RcsYnRhMErXir0QCZtgmT1KN8JxjzoV1+4tsCEfDihDJy/OuFN8P6w7x0/DHo+NF0rqIx4Q+jlQDmf9u9K+aZc7IIkhg7VPomVgK7XEzgMYTO/GvrbV7znGUnyAeNpMaPQ2gkZ2DN9K7flZCPFpIuEmq0tWsc0d/7y1T7pB695PC5eSNfcQWc/x9kEN9L4a1uc2jFYvp4W9ioNP0Yct27NG0AOtDdxTAD1vR2zflhdmL5zs8yUeeASpDdZ0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCHVNFknPEFpY3d2rRUlR8R358vAKo2XNALh7Rv6oPU=;
 b=i8HPXPF3hjtq8XPcWxFwGMr85heUBd2kfQvRq3zi7QiTu4GO6EJVwX4j9DcoCMK1C7bvigtOV9qs4mE4Erx2iBMm5TiWvZH4EmiYnqCLH8Klhx67bWAouprVeWmMXv5FvFqRN0gFh4NmcHvYGqW40dtbh5mlFoKLHG3rRIY7gqSQdl+b0GjI/Qe2LE4TxO5wCp5Yrlaqo0PHbBc3vz7pYCireDtf+RUPC4GGg5Pwm837nDpIUADr6A7vd/lqbIxesWD3LT0uju1JQB1rUSRmJLtPhErczUwPivkjhCB+bf2Gn/J/Do4psXogjToU6M7CwAhQ0I5+3LoT/OQsyJKItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 16:01:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 16:01:26 +0000
Date: Fri, 1 Mar 2024 00:01:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Uladzislau Rezki <urezki@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Baoquan He
	<bhe@redhat.com>, Christoph Hellwig <hch@lst.de>, Dave Chinner
	<david@fromorbit.com>, Joel Fernandes <joel@joelfernandes.org>, "Kazuhito
 Hagio" <k-hagio-ab@nec.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>, Matthew Wilcox <willy@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  8f33a2ff30:  stress-ng.resched.ops_per_sec
 -10.3% regression
Message-ID: <202402292306.8520763a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 089e1bc1-bdfb-4acf-26fb-08dc393faee6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukKiRTCRsL6doDbiV4MqkTG+cqBaGv38yN6aA2FYM9oaWnOfIrONOOS2STVikbz5jIKgtqK0v1BcuLWpvWw8JJsBJn8kNSXSiew+c955xy+3NQOd5lnmpee9ROZ3AqiXpf3HZruH1aKDRAynhib5NMHkKjbSGWpPSxBTDUWMyCvBRr/H3oTxIyI/cE/BtAdGC2oKqsfYSyGLnK7pIrmCk3b4hj71NbohitfbzxOY7JL8nohQBBwGc3T9ScnOGwO39LRM3NExgexR4YWBkCpo1icd88gVSMF++WwV4pAX12tMEmAW2jPsMHa9Y6oMGsp1GqlBYLXwEfyzm6PYGxozkHuR3QR0HsFeLpXy9Qmrd9J9/yjIXvyC6PPWlnoBakhnrnOUy9R9DvcxsfTpK1fOxat2g1sfqUSDjTq9FiEV9+/bVTrtNUrd/wZVAM2jVYK75YH/C0Ylm0ZXYLpe9vemudI0MjmLZeJOsl1dUogpraqbkxCXhnkwzHileCWK1YEztTJt8h5HM17FdLmEtCIlP8UZv9XY+/pJi4uUIY3DwSE1VXKJJKBxU0AkWEPmDr5TQ4rMUBSOYm75YG0MjapO2sYSoWgiXhuZUayPefRIU1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C5QGzh0q5JX00a3ZZAwOp6LweIvcVeGoToIePferUbvGykXgy6TFUKtFHq?=
 =?iso-8859-1?Q?v25Yw26C+xDLIT5EmJ7HllGDbEgxFVOmizR4EifnrXbATX8QwMM02cnYGy?=
 =?iso-8859-1?Q?L9sVlt0NOzWGThTqYN+mcb6Ctl/X45m8RFYRCe2xoYJAqrOmik5cwVlOyD?=
 =?iso-8859-1?Q?DEbYhnlvW9liXEQJ6uQ8QowcmXnYnda5Fu6UX264XeI4oNQHLbWMNUYbYI?=
 =?iso-8859-1?Q?JiF8cWP1dWcR1blejvZ+DlAJiHEhhY/YK9L4bUDsL4fxxfcUX+7/vtYFV2?=
 =?iso-8859-1?Q?yJYhCb3wi5ReS1lExn24R0isP54SzhehOlX2ZbDVWlty8HWypLVtrlixXg?=
 =?iso-8859-1?Q?ekQvisQjNlXxDZCXDlakybr6rGWxdKlLzqIA5tP/06OkjnYq2LNcdW8GoG?=
 =?iso-8859-1?Q?Hj2h5sNOZPeiSeYFDzWjU7G7YK1Nx8ppo/IACG4EhgOIXRS6dZRuLY0HVT?=
 =?iso-8859-1?Q?Uy4YnJjlyYU496y5o/wvzHpvHZ07/8OS8tENqXklRPf63M8ivSIhEsPlOD?=
 =?iso-8859-1?Q?xKSyo3sFtKi6n3ISqVScnuQ4QyWL6C4tD2bGtPKt+qZVDw/p2uVY1q+0js?=
 =?iso-8859-1?Q?VAaRKBhL+pd2xzo6Mb7UbAV4ZzIQk2XYHtt1euNP8BAsDiyzPqNtYnMWbg?=
 =?iso-8859-1?Q?sC4dgNQBv5A+dAhccZpKmtze/I3dfMHHbS0uMYL3ocHEGNM9k915e14ikY?=
 =?iso-8859-1?Q?r9NL7PsY5pSsFutbSLPJQTyPicm/qfb81wvLC3GCtljUxHXFry5YxQzig8?=
 =?iso-8859-1?Q?xX+OuF97vkedS9f4V+NDmflmI+Mmc/aN1uPr2zpvUPrXOrLL4cIZliY0j0?=
 =?iso-8859-1?Q?F6Z+7a6xtE8BADtN3x9lQ6Y7y3KOiftjq9dVUU2FtFakoFKgjeTlLxj0sG?=
 =?iso-8859-1?Q?khVSa4wIYSthBB+AE0jjhMPW7jZCAd1OBLI8SkSIk7r0hRdnF6mJN4DvTU?=
 =?iso-8859-1?Q?YFsqN3YTiQlHG/zd3Ar6bElDmKV8Pmp1R8r5rMIR/1ZV3i+P4KqZTg5KLK?=
 =?iso-8859-1?Q?XvE9Ma3OJD3gd9qO1/S9JAESKxqsGaWTEx45NJQGJIpFlW1U3AC/gSjI97?=
 =?iso-8859-1?Q?nIPhxhosTdCUtFqynQ6nwPZ7MKWzEzg13alYwwu/jZbIuKk9vSueVmoTeU?=
 =?iso-8859-1?Q?GP9u3PZvePqK4gTxLWvbnqDZesGVOw8OemnSCQ/pzuWxJlSCkFiibgv0Ft?=
 =?iso-8859-1?Q?bCCBOCZkhn2tBye3L244G17qzAHoO2cJenyqxyJFCv5lnIY6Fz4W1tWO+U?=
 =?iso-8859-1?Q?/eZZ6/dF/83BNdonfEbfwACXwolTezKlcP6QsZqbXXA2zFobYwThfXLcrM?=
 =?iso-8859-1?Q?Ym4CUtoNpKlvaTqxJUQ5rQ4B/yEJPwQxnPgorwYykBDOOzr0ploz2lOq6n?=
 =?iso-8859-1?Q?lJwODzVeoNW8O5TvJI9laeWshWOK5JaDbp5/9AP+8xYtfzCjT729LIBDug?=
 =?iso-8859-1?Q?lPstdPPKqNOdir8XfY/BrgnBPM1dAyd/xdz40XZ4/grKOePdNq3bvu2cAN?=
 =?iso-8859-1?Q?GjKnw/0EGFB2IMrpRfT/w33Oa35HdHZ/9PhFxd8MAXbPtpcGsvDpgZ/Ckm?=
 =?iso-8859-1?Q?bZ/CvUoNqGWbmAIuFgkCjKz2OmiQTv3wk4MXWi9xFgG0Nl+HPYTq2zw434?=
 =?iso-8859-1?Q?sDnkEn8e1QBBvcjjM5AwdHfVK1Kl3+Pqd2Lcmer90hPXBOtxB9X3tRbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 089e1bc1-bdfb-4acf-26fb-08dc393faee6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 16:01:26.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROe4betyd4czEsM2PRunN58mgVxdibC2J6q1oiLu9jrNhYt0B/HjpU6GeKzDC0O9Rm3WTZIXQmLjOtZfvZt5nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -10.3% regression of stress-ng.resched.ops_per_sec on:


commit: 8f33a2ff307248c3e55a7696f60b3658b28edb57 ("mm: vmalloc: set nr_nodes based on CPUs in a system")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: resched
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.pthread.ops_per_sec 23.0% improvement                                |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                              |
|                  | nr_threads=100%                                                                           |
|                  | test=pthread                                                                              |
|                  | testtime=60s                                                                              |
+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.fstat.ops_per_sec 14.2% improvement                                  |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                              |
|                  | disk=1HDD                                                                                 |
|                  | fs=xfs                                                                                    |
|                  | nr_threads=100%                                                                           |
|                  | test=fstat                                                                                |
|                  | testtime=60s                                                                              |
+------------------+-------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402292306.8520763a-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240229/202402292306.8520763a-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/resched/stress-ng/60s

commit: 
  8e1d743f2c ("mm: vmalloc: support multiple nodes in vmallocinfo")
  8f33a2ff30 ("mm: vmalloc: set nr_nodes based on CPUs in a system")

8e1d743f2c2671aa 8f33a2ff307248c3e55a7696f60 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      7.48            -0.8        6.73        mpstat.cpu.all.nice%
  10439977           -10.4%    9351864        vmstat.system.cs
  14670714 ±  3%     +18.1%   17330709 ±  5%  numa-numastat.node0.local_node
  14688319 ±  3%     +18.1%   17348214 ±  5%  numa-numastat.node0.numa_hit
  14538034 ±  3%     +15.7%   16824234 ±  4%  numa-numastat.node1.local_node
  14556613 ±  3%     +15.6%   16834659 ±  4%  numa-numastat.node1.numa_hit
  14685240 ±  3%     +18.0%   17334251 ±  5%  numa-vmstat.node0.numa_hit
  14667635 ±  3%     +18.1%   17316745 ±  5%  numa-vmstat.node0.numa_local
  14551744 ±  3%     +15.6%   16815047 ±  4%  numa-vmstat.node1.numa_hit
  14533165 ±  3%     +15.6%   16804623 ±  4%  numa-vmstat.node1.numa_local
 9.153e+08           -10.3%  8.208e+08        stress-ng.resched.ops
  15220752           -10.3%   13651349        stress-ng.resched.ops_per_sec
 6.584e+08           -10.8%  5.871e+08        stress-ng.time.involuntary_context_switches
  35101341           +21.1%   42492742        stress-ng.time.minor_page_faults
    493.99            -2.7%     480.71        stress-ng.time.user_time
   1601471           +12.4%    1800237        stress-ng.time.voluntary_context_switches
     45682            -3.0%      44323        proc-vmstat.nr_mapped
  29224899 ±  2%     +17.0%   34204857 ±  2%  proc-vmstat.numa_hit
  29188715 ±  2%     +17.1%   34175695 ±  2%  proc-vmstat.numa_local
  30387517 ±  2%     +17.2%   35613193 ±  2%  proc-vmstat.pgalloc_normal
  35499048           +20.8%   42900524        proc-vmstat.pgfault
  30089249 ±  2%     +17.4%   35314084 ±  2%  proc-vmstat.pgfree
   1666293           +42.7%    2377510 ± 18%  proc-vmstat.pgreuse
     79.74 ±  9%     +74.6%     139.24 ± 11%  sched_debug.cfs_rq:/.util_est.avg
    189.94 ± 12%     +26.7%     240.58 ±  7%  sched_debug.cfs_rq:/.util_est.stddev
    412906           +18.4%     488720        sched_debug.cpu.curr->pid.max
    156755 ±  6%     +36.2%     213484 ±  4%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 16%    +101.6%       0.00 ± 44%  sched_debug.cpu.next_balance.stddev
   5061074           -10.8%    4515433        sched_debug.cpu.nr_switches.avg
   3577309 ±  3%     -11.1%    3178495 ±  4%  sched_debug.cpu.nr_switches.min
    337514 ±  5%     +16.2%     392071 ±  6%  sched_debug.cpu.nr_switches.stddev
      0.03 ± 25%     -94.9%       0.00 ±806%  sched_debug.cpu.nr_uninterruptible.avg
     29.75 ± 20%     +59.7%      47.50 ± 14%  sched_debug.cpu.nr_uninterruptible.max
    -30.88           +54.7%     -47.75        sched_debug.cpu.nr_uninterruptible.min
     12.23 ±  7%     +45.3%      17.77 ±  6%  sched_debug.cpu.nr_uninterruptible.stddev
      0.85           +13.1%       0.96        perf-stat.i.MPKI
 2.291e+10            -4.8%  2.181e+10        perf-stat.i.branch-instructions
  2.15e+08 ±  2%      -5.8%  2.025e+08        perf-stat.i.branch-misses
  94725284 ±  2%      +9.2%  1.034e+08        perf-stat.i.cache-misses
 3.899e+08            +9.9%  4.284e+08        perf-stat.i.cache-references
  10801186           -10.6%    9652627        perf-stat.i.context-switches
      1.64            +4.5%       1.72        perf-stat.i.cpi
      7950            +1.9%       8102        perf-stat.i.cpu-migrations
      2050            -8.8%       1869        perf-stat.i.cycles-between-cache-misses
  1.18e+11            -4.6%  1.125e+11        perf-stat.i.instructions
      0.61            -4.2%       0.58        perf-stat.i.ipc
      0.84 ± 13%     +60.7%       1.34 ± 23%  perf-stat.i.major-faults
    186.08            -7.3%     172.43        perf-stat.i.metric.K/sec
    583305           +20.0%     700152        perf-stat.i.minor-faults
    583306           +20.0%     700154        perf-stat.i.page-faults
      0.80           +14.4%       0.91        perf-stat.overall.MPKI
      1.65            +4.6%       1.73        perf-stat.overall.cpi
      2073            -8.6%       1895        perf-stat.overall.cycles-between-cache-misses
      0.61            -4.4%       0.58        perf-stat.overall.ipc
 2.216e+10            -3.9%  2.129e+10        perf-stat.ps.branch-instructions
 2.096e+08            -5.0%  1.991e+08        perf-stat.ps.branch-misses
  90903308           +10.0%      1e+08        perf-stat.ps.cache-misses
 3.769e+08           +11.2%   4.19e+08        perf-stat.ps.cache-references
  10477313           -10.3%    9400275        perf-stat.ps.context-switches
 1.141e+11            -3.8%  1.098e+11        perf-stat.ps.instructions
      0.74 ±  8%     +74.9%       1.30 ± 24%  perf-stat.ps.major-faults
    563331           +21.7%     685594        perf-stat.ps.minor-faults
    563332           +21.7%     685595        perf-stat.ps.page-faults
 6.921e+12            -4.7%  6.596e+12        perf-stat.total.instructions
     28.42            -4.4       23.99 ±  2%  perf-profile.calltrace.cycles-pp.__sched_setscheduler
     27.16            -4.2       22.91 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     26.98            -4.2       22.76 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     26.47            -4.2       22.31 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     26.43            -4.1       22.29 ±  2%  perf-profile.calltrace.cycles-pp.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     25.70            -3.4       22.32 ±  2%  perf-profile.calltrace.cycles-pp.__sched_yield
     21.03            -2.8       18.28 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
     22.34            -2.7       19.60        perf-profile.calltrace.cycles-pp._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.87            -2.7       18.14 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     21.74            -2.7       19.05        perf-profile.calltrace.cycles-pp.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
     15.28            -2.0       13.27 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     12.85            -1.7       11.14 ±  2%  perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      4.78 ±  2%      -1.2        3.58 ±  6%  perf-profile.calltrace.cycles-pp.capable.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      4.74 ±  2%      -1.2        3.54 ±  6%  perf-profile.calltrace.cycles-pp.security_capable.capable.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      4.64 ±  2%      -1.2        3.47 ±  6%  perf-profile.calltrace.cycles-pp.apparmor_capable.security_capable.capable.__sched_setscheduler._sched_setscheduler
     12.46            -1.1       11.36 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.51            -0.7        4.77 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      5.34            -0.7        4.66 ±  2%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      5.16            -0.7        4.50 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      4.46            -0.6        3.86 ±  2%  perf-profile.calltrace.cycles-pp.stress_resched_child
      3.94            -0.5        3.40 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      3.50            -0.5        3.02        perf-profile.calltrace.cycles-pp.__sched_getscheduler
      3.29 ±  2%      -0.4        2.89 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      2.69            -0.4        2.34 ±  2%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      2.64            -0.3        2.29 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      0.58            -0.3        0.26 ±100%  perf-profile.calltrace.cycles-pp.___perf_sw_event.prepare_task_switch.__schedule.schedule.__x64_sys_sched_yield
      2.10            -0.3        1.80 ±  2%  perf-profile.calltrace.cycles-pp.set_next_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      0.54            -0.3        0.26 ±100%  perf-profile.calltrace.cycles-pp.idr_find.find_task_by_vpid.__x64_sys_sched_getscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.19            -0.3        1.91 ±  2%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.15            -0.3        1.87        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      1.88            -0.3        1.60 ±  2%  perf-profile.calltrace.cycles-pp.set_next_entity.set_next_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      2.06            -0.3        1.79 ±  2%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.97            -0.2        1.73        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      2.15            -0.2        1.94        perf-profile.calltrace.cycles-pp.find_task_by_vpid.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.69            -0.2        1.49 ±  3%  perf-profile.calltrace.cycles-pp.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.46            -0.2        1.27 ±  2%  perf-profile.calltrace.cycles-pp.switch_fpu_return.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.65            -0.2        1.46 ±  3%  perf-profile.calltrace.cycles-pp.put_prev_entity.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield
      0.62 ±  4%      -0.2        0.43 ± 44%  perf-profile.calltrace.cycles-pp.update_curr.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield
      1.56            -0.2        1.38 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_getscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      1.18            -0.2        1.01 ±  3%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.38            -0.2        1.21 ±  2%  perf-profile.calltrace.cycles-pp.put_prev_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      0.73 ±  2%      -0.2        0.56 ±  4%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.40            -0.2        1.23 ±  3%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield
      1.28            -0.2        1.12 ±  2%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.96 ±  2%      -0.2        0.81        perf-profile.calltrace.cycles-pp.task_rq_lock.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      1.27            -0.2        1.12 ±  3%  perf-profile.calltrace.cycles-pp.put_prev_entity.put_prev_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.36            -0.2        1.21 ±  2%  perf-profile.calltrace.cycles-pp.find_task_by_vpid.__x64_sys_sched_getscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_getscheduler
      1.14            -0.1        1.00        perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94            -0.1        0.81 ±  2%  perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.set_next_task_fair.__sched_setscheduler._sched_setscheduler
      1.26 ±  2%      -0.1        1.13 ±  4%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__sched_setscheduler._sched_setscheduler
      0.90            -0.1        0.78 ±  2%  perf-profile.calltrace.cycles-pp.pick_eevdf.pick_next_task_fair.__schedule.schedule.__x64_sys_sched_yield
      0.84            -0.1        0.72 ±  3%  perf-profile.calltrace.cycles-pp.__switch_to_asm.__sched_yield
      0.85            -0.1        0.73 ±  4%  perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64
      0.96 ±  2%      -0.1        0.86 ±  2%  perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__sched_setscheduler._sched_setscheduler
      0.75            -0.1        0.65 ±  4%  perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.syscall_exit_to_user_mode
      0.79            -0.1        0.70 ±  2%  perf-profile.calltrace.cycles-pp.__enqueue_entity.enqueue_entity.enqueue_task_fair.__sched_setscheduler._sched_setscheduler
      0.94 ±  2%      -0.1        0.84        perf-profile.calltrace.cycles-pp.__radix_tree_lookup.find_task_by_vpid.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
      0.66 ±  2%      -0.1        0.57 ±  2%  perf-profile.calltrace.cycles-pp.__radix_tree_lookup.find_task_by_vpid.__x64_sys_sched_getscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.75            -0.1        0.67        perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_task_fair.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      0.64            -0.1        0.56 ±  2%  perf-profile.calltrace.cycles-pp.__dequeue_entity.set_next_entity.set_next_task_fair.__sched_setscheduler._sched_setscheduler
      0.60            -0.1        0.52 ±  2%  perf-profile.calltrace.cycles-pp.place_entity.enqueue_entity.enqueue_task_fair.__sched_setscheduler._sched_setscheduler
      0.79 ±  2%      -0.1        0.70 ±  4%  perf-profile.calltrace.cycles-pp.__dequeue_entity.set_next_entity.pick_next_task_fair.__schedule.schedule
      0.62            -0.1        0.54 ±  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__sched_yield
      0.72 ±  2%      -0.1        0.64 ±  4%  perf-profile.calltrace.cycles-pp.__enqueue_entity.put_prev_entity.pick_next_task_fair.__schedule.schedule
      0.87 ±  2%      -0.1        0.80 ±  4%  perf-profile.calltrace.cycles-pp.update_curr.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64
      0.78            -0.1        0.72        perf-profile.calltrace.cycles-pp.idr_find.find_task_by_vpid.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
      0.54 ±  2%      +0.0        0.59 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_free.__vm_area_free.exit_mmap.__mmput.exit_mm
      0.59            +0.1        0.65 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.exit_mmap.__mmput.exit_mm.do_exit
      0.60 ±  2%      +0.1        0.67 ±  2%  perf-profile.calltrace.cycles-pp.__vm_area_free.exit_mmap.__mmput.exit_mm.do_exit
      0.88            +0.1        0.94 ±  2%  perf-profile.calltrace.cycles-pp.vma_interval_tree_insert_after.dup_mmap.dup_mm.copy_process.kernel_clone
      0.56 ±  2%      +0.1        0.64 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.71 ±  3%      +0.1        0.80 ±  3%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm
      0.70            +0.1        0.80 ±  2%  perf-profile.calltrace.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.__mmput.exit_mm
      0.64 ±  2%      +0.1        0.75 ±  3%  perf-profile.calltrace.cycles-pp.down_write.dup_mmap.dup_mm.copy_process.kernel_clone
      0.83            +0.1        0.97 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap
      0.86            +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp.__anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.90            +0.2        1.07        perf-profile.calltrace.cycles-pp._compound_head.copy_present_ptes.copy_pte_range.copy_p4d_range.copy_page_range
      1.47 ±  2%      +0.2        1.64 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm.copy_process
      0.62 ±  2%      +0.2        0.80 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.anon_vma_clone
      0.99 ±  3%      +0.2        1.18 ±  2%  perf-profile.calltrace.cycles-pp.folio_remove_rmap_ptes.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
      1.17            +0.2        1.36 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.71            +0.2        0.92 ±  3%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.anon_vma_fork
      1.94 ±  2%      +0.3        2.20 ±  3%  perf-profile.calltrace.cycles-pp.vm_area_dup.dup_mmap.dup_mm.copy_process.kernel_clone
      0.76            +0.3        1.03 ±  3%  perf-profile.calltrace.cycles-pp.release_pages.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      0.58            +0.3        0.85 ±  5%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.anon_vma_fork
      1.40            +0.3        1.68 ±  3%  perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault
      1.60            +0.3        1.91 ±  2%  perf-profile.calltrace.cycles-pp.copy_present_ptes.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.72            +0.3        1.05 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables
      0.75            +0.3        1.08 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.18            +0.4        1.54 ±  2%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput.exit_mm
      1.20            +0.4        1.56 ±  2%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.exit_mm.do_exit
      0.98            +0.4        1.35 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork
      1.01            +0.4        1.38 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      2.28            +0.4        2.65        perf-profile.calltrace.cycles-pp.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap.dup_mm
      0.96            +0.4        1.34 ±  3%  perf-profile.calltrace.cycles-pp.down_write.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      1.90            +0.4        2.28 ±  3%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      1.96            +0.4        2.34 ±  3%  perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.96            +0.4        2.35 ±  3%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      1.19            +0.4        1.58 ±  4%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      2.09            +0.4        2.48 ±  3%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.16            +0.4        2.56 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.16            +0.4        2.57 ±  2%  perf-profile.calltrace.cycles-pp._compound_head.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
      2.38            +0.4        2.80 ±  2%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.39            +0.4        2.81 ±  2%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      2.56 ±  2%      +0.4        2.98        perf-profile.calltrace.cycles-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
      2.48            +0.4        2.92 ±  2%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      2.62            +0.4        3.06        perf-profile.calltrace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
      1.38 ±  2%      +0.5        1.88 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap
      1.40 ±  2%      +0.5        1.93 ±  4%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.anon_vma_fork.dup_mmap.dup_mm
      1.48 ±  2%      +0.5        2.02 ±  4%  perf-profile.calltrace.cycles-pp.down_write.anon_vma_fork.dup_mmap.dup_mm.copy_process
      3.42            +0.6        4.00 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      3.63 ±  2%      +0.7        4.34 ±  2%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      4.53            +0.8        5.33        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      4.62            +0.8        5.43        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      4.72            +0.8        5.55        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      5.12            +0.9        6.00        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      4.16            +0.9        5.06 ±  2%  perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.exit_mm
      5.73            +1.1        6.83 ±  2%  perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      0.00            +1.1        1.14 ± 18%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.1        1.14 ± 18%  perf-profile.calltrace.cycles-pp.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.03            +1.2        7.21 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      8.36            +1.8       10.20 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
     13.84            +2.6       16.40        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     13.87            +2.6       16.43        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
     13.90            +2.6       16.46        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     14.28            +2.6       16.90        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.28            +2.6       16.90        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.28            +2.6       16.90        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.46            +3.0       20.48 ±  2%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.26            +3.0       19.30 ±  2%  perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
     17.82            +3.1       20.89 ±  2%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     17.82            +3.1       20.89 ±  2%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     17.84            +3.1       20.92 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
     17.84            +3.1       20.92 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
     16.59            +3.1       19.68 ±  2%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
     18.23            +3.1       21.36 ±  2%  perf-profile.calltrace.cycles-pp._Fork
     14.42            +4.8       19.20 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.42            +4.8       19.23 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     50.80            -7.2       43.56        perf-profile.children.cycles-pp.__sched_setscheduler
     26.43            -3.5       22.98 ±  2%  perf-profile.children.cycles-pp.__sched_yield
     26.61            -3.1       23.53        perf-profile.children.cycles-pp.__x64_sys_sched_setscheduler
     26.56            -3.1       23.48        perf-profile.children.cycles-pp.do_sched_setscheduler
     22.42            -2.8       19.62        perf-profile.children.cycles-pp._sched_setscheduler
     15.35            -1.3       14.04        perf-profile.children.cycles-pp.__x64_sys_sched_yield
     13.03            -1.1       11.94        perf-profile.children.cycles-pp.schedule
     12.79            -1.0       11.74        perf-profile.children.cycles-pp.__schedule
      4.79 ±  2%      -1.0        3.77 ±  6%  perf-profile.children.cycles-pp.capable
      4.76 ±  2%      -1.0        3.74 ±  6%  perf-profile.children.cycles-pp.security_capable
      4.66 ±  2%      -1.0        3.66 ±  6%  perf-profile.children.cycles-pp.apparmor_capable
      4.61            -0.6        3.99 ±  2%  perf-profile.children.cycles-pp.stress_resched_child
      3.92            -0.5        3.39        perf-profile.children.cycles-pp.__sched_getscheduler
      5.64            -0.5        5.11 ±  2%  perf-profile.children.cycles-pp.dequeue_task_fair
      5.64            -0.5        5.17        perf-profile.children.cycles-pp.update_load_avg
      5.51            -0.4        5.08        perf-profile.children.cycles-pp.pick_next_task_fair
      5.79            -0.4        5.36        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      4.08            -0.4        3.70        perf-profile.children.cycles-pp.enqueue_task_fair
      3.47            -0.3        3.16        perf-profile.children.cycles-pp.set_next_entity
      3.44 ±  2%      -0.3        3.16 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
      1.60 ±  2%      -0.3        1.33        perf-profile.children.cycles-pp._raw_spin_lock
      3.76            -0.3        3.49 ±  3%  perf-profile.children.cycles-pp.update_curr
      2.81            -0.2        2.57        perf-profile.children.cycles-pp.enqueue_entity
      2.16            -0.2        1.92        perf-profile.children.cycles-pp.set_next_task_fair
      2.74            -0.2        2.51 ±  2%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      1.68            -0.2        1.46 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      3.10            -0.2        2.88 ±  2%  perf-profile.children.cycles-pp.put_prev_entity
      1.40            -0.2        1.18 ±  2%  perf-profile.children.cycles-pp.update_cfs_group
      3.56            -0.2        3.35        perf-profile.children.cycles-pp.find_task_by_vpid
      2.24            -0.2        2.05 ±  2%  perf-profile.children.cycles-pp.do_sched_yield
      1.86            -0.2        1.67        perf-profile.children.cycles-pp.__update_load_avg_se
      0.21 ±  5%      -0.2        0.04 ± 44%  perf-profile.children.cycles-pp.__get_vm_area_node
      2.15            -0.2        1.98 ±  2%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.32 ±  3%      -0.2        0.16 ±  3%  perf-profile.children.cycles-pp.__vmalloc_node_range
      0.39 ±  3%      -0.2        0.23        perf-profile.children.cycles-pp.alloc_thread_stack_node
      0.48 ±  2%      -0.1        0.35        perf-profile.children.cycles-pp.dup_task_struct
      1.74            -0.1        1.61 ±  2%  perf-profile.children.cycles-pp.yield_task_fair
      1.61            -0.1        1.48 ±  2%  perf-profile.children.cycles-pp.__x64_sys_sched_getscheduler
      1.28            -0.1        1.15        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.02            -0.1        0.90        perf-profile.children.cycles-pp.task_rq_lock
      1.44            -0.1        1.32 ±  2%  perf-profile.children.cycles-pp.put_prev_task_fair
      1.23            -0.1        1.12 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      1.64 ±  2%      -0.1        1.52        perf-profile.children.cycles-pp.__radix_tree_lookup
      1.75            -0.1        1.64 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      1.50            -0.1        1.39        perf-profile.children.cycles-pp.switch_fpu_return
      1.53            -0.1        1.42 ±  2%  perf-profile.children.cycles-pp.__dequeue_entity
      0.20 ± 51%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.worker_thread
      0.31 ±  3%      -0.1        0.20 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.21 ± 47%      -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.kthread
      0.18 ± 56%      -0.1        0.08        perf-profile.children.cycles-pp.process_one_work
      0.90            -0.1        0.80 ±  2%  perf-profile.children.cycles-pp.__calc_delta
      1.70 ±  2%      -0.1        1.60 ±  2%  perf-profile.children.cycles-pp.__enqueue_entity
      1.37            -0.1        1.27 ±  2%  perf-profile.children.cycles-pp.rseq_ip_fixup
      1.01            -0.1        0.91 ±  2%  perf-profile.children.cycles-pp.update_rq_clock
      0.40 ± 26%      -0.1        0.30 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      0.41 ± 24%      -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.94            -0.1        0.85        perf-profile.children.cycles-pp.__switch_to
      0.89            -0.1        0.80 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.98            -0.1        0.90        perf-profile.children.cycles-pp.pick_eevdf
      0.48 ±  2%      -0.1        0.39 ±  3%  perf-profile.children.cycles-pp.reweight_task
      0.89            -0.1        0.81 ±  2%  perf-profile.children.cycles-pp.__switch_to_asm
      0.88 ±  2%      -0.1        0.80 ±  3%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.44 ±  2%      -0.1        0.37 ±  4%  perf-profile.children.cycles-pp.reweight_entity
      0.74            -0.1        0.67 ±  2%  perf-profile.children.cycles-pp.sched_clock_cpu
      1.16            -0.1        1.09        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.64            -0.1        0.58        perf-profile.children.cycles-pp.sched_clock
      0.65            -0.1        0.59        perf-profile.children.cycles-pp.place_entity
      0.79 ±  2%      -0.1        0.73 ±  3%  perf-profile.children.cycles-pp.__get_user_8
      0.58            -0.1        0.52 ±  2%  perf-profile.children.cycles-pp.native_sched_clock
      0.46            -0.1        0.41        perf-profile.children.cycles-pp.avg_vruntime
      0.10            -0.0        0.05        perf-profile.children.cycles-pp.delayed_vfree_work
      0.10            -0.0        0.05        perf-profile.children.cycles-pp.vfree
      1.05            -0.0        1.00        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.48            -0.0        0.43 ±  2%  perf-profile.children.cycles-pp.blkcg_maybe_throttle_current
      0.44            -0.0        0.40 ±  2%  perf-profile.children.cycles-pp.update_curr_se
      0.58            -0.0        0.53 ±  2%  perf-profile.children.cycles-pp.os_xsave
      0.44            -0.0        0.40 ±  2%  perf-profile.children.cycles-pp.rt_mutex_adjust_pi
      0.34 ±  5%      -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.sched_yield@plt
      0.38 ±  2%      -0.0        0.34 ±  8%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.27 ±  6%      -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.sched_getscheduler@plt
      0.21 ±  2%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.44            -0.0        0.40 ±  2%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.71            -0.0        0.67 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.39 ±  2%      -0.0        0.35        perf-profile.children.cycles-pp.update_rq_clock_task
      0.33            -0.0        0.30        perf-profile.children.cycles-pp.vruntime_eligible
      0.29            -0.0        0.26        perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.18 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.20            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.33            -0.0        0.31 ±  2%  perf-profile.children.cycles-pp.__put_user_8
      0.12            -0.0        0.10 ±  5%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.12 ±  4%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp.rebalance_domains
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.security_task_setscheduler
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.18 ±  2%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.15 ±  2%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.rb_next
      0.13            -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.check_cfs_rq_runtime
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.do_task_dead
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.perf_iterate_sb
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.mas_wr_walk
      0.07            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.sched_move_task
      0.07            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.wait_consider_task
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__put_task_struct
      0.08            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__exit_signal
      0.08            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.15 ±  2%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.task_tick_fair
      0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.__memcpy
      0.07            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.arch_dup_task_struct
      0.08            +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.mas_next_node
      0.09 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.rcu_all_qs
      0.06 ±  7%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.queued_write_lock_slowpath
      0.09 ±  4%      +0.0        0.11        perf-profile.children.cycles-pp.__percpu_counter_sum
      0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__perf_sw_event
      0.10            +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.__put_user_4
      0.07            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.vm_normal_page
      0.16 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.18            +0.0        0.20        perf-profile.children.cycles-pp.rcu_core
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.xas_find
      0.25            +0.0        0.27 ±  2%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.10            +0.0        0.12        perf-profile.children.cycles-pp.mas_wr_store_entry
      0.12 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.28 ±  3%      +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      0.20 ±  3%      +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.scheduler_tick
      0.27 ±  2%      +0.0        0.29 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.12 ±  4%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.sync_regs
      0.14 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.rcu_do_batch
      0.13 ±  3%      +0.0        0.15 ±  4%  perf-profile.children.cycles-pp.release_task
      0.11 ±  4%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.memset_orig
      0.28            +0.0        0.31 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.11            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.19 ±  2%      +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.unmap_single_vma
      0.16            +0.0        0.19        perf-profile.children.cycles-pp.stress_parent_died_alarm
      0.18            +0.0        0.21        perf-profile.children.cycles-pp.getpid@plt
      0.14 ±  3%      +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.wait_task_zombie
      0.15 ±  2%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.refill_obj_stock
      0.16 ±  3%      +0.0        0.18 ±  5%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.16 ±  2%      +0.0        0.19 ±  2%  perf-profile.children.cycles-pp.mas_store
      0.34 ±  4%      +0.0        0.37        perf-profile.children.cycles-pp.clear_page_erms
      0.16            +0.0        0.19        perf-profile.children.cycles-pp.pcpu_alloc
      0.26            +0.0        0.30        perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.35 ±  2%      +0.0        0.39 ±  4%  perf-profile.children.cycles-pp.dup_userfaultfd
      0.35 ±  6%      +0.0        0.38 ±  2%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.14 ±  3%      +0.0        0.18 ±  5%  perf-profile.children.cycles-pp.folio_add_file_rmap_ptes
      0.29            +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.acct_collect
      0.34 ±  2%      +0.0        0.37 ±  2%  perf-profile.children.cycles-pp._exit
      0.18            +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.prctl
      0.28            +0.0        0.32 ±  2%  perf-profile.children.cycles-pp.find_idlest_cpu
      0.31 ±  2%      +0.0        0.35        perf-profile.children.cycles-pp.select_task_rq_fair
      0.27            +0.0        0.31        perf-profile.children.cycles-pp.find_idlest_group
      0.18 ±  4%      +0.0        0.22 ±  6%  perf-profile.children.cycles-pp.__mmdrop
      0.36 ±  5%      +0.0        0.40 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.29            +0.0        0.34 ±  2%  perf-profile.children.cycles-pp.mm_init
      0.44            +0.0        0.48        perf-profile.children.cycles-pp.__rb_erase_color
      0.01 ±173%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.xas_load
      0.28            +0.0        0.34        perf-profile.children.cycles-pp.mas_next_slot
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.folio_batch_move_lru
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.lru_add_drain
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.mas_ascend
      0.37            +0.1        0.42 ±  2%  perf-profile.children.cycles-pp.__libc_fork
      0.34            +0.1        0.39        perf-profile.children.cycles-pp.wake_up_new_task
      0.36            +0.1        0.42 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.25            +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.__do_wait
      0.36 ±  2%      +0.1        0.42 ±  2%  perf-profile.children.cycles-pp.mas_find
      0.15            +0.1        0.21 ±  6%  perf-profile.children.cycles-pp.osq_unlock
      0.27 ±  2%      +0.1        0.33 ±  3%  perf-profile.children.cycles-pp.set_pte_range
      0.33 ±  2%      +0.1        0.39 ±  3%  perf-profile.children.cycles-pp.do_wait
      0.40 ±  2%      +0.1        0.47 ±  3%  perf-profile.children.cycles-pp.wait4
      0.61 ±  2%      +0.1        0.68 ±  2%  perf-profile.children.cycles-pp.__vm_area_free
      0.34 ±  2%      +0.1        0.41 ±  4%  perf-profile.children.cycles-pp.kernel_wait4
      0.34 ±  2%      +0.1        0.41 ±  4%  perf-profile.children.cycles-pp.__do_sys_wait4
      0.88            +0.1        0.94 ±  2%  perf-profile.children.cycles-pp.vma_interval_tree_insert_after
      0.31 ±  2%      +0.1        0.38 ±  2%  perf-profile.children.cycles-pp.fput
      0.40            +0.1        0.48 ±  2%  perf-profile.children.cycles-pp.remove_vma
      0.39 ±  2%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.__put_anon_vma
      0.71            +0.1        0.80        perf-profile.children.cycles-pp.__slab_free
      0.73 ±  5%      +0.1        0.81 ±  2%  perf-profile.children.cycles-pp.__alloc_pages
      0.41            +0.1        0.49        perf-profile.children.cycles-pp.free_swap_cache
      0.74 ±  5%      +0.1        0.82 ±  2%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.42            +0.1        0.51        perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.29            +0.1        0.38 ± 18%  perf-profile.children.cycles-pp.stress_resched
      0.70            +0.1        0.80 ±  2%  perf-profile.children.cycles-pp.unlink_file_vma
      0.78            +0.1        0.90 ±  2%  perf-profile.children.cycles-pp.mod_objcg_state
      0.86            +0.1        1.00 ±  2%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      1.23 ±  2%      +0.2        1.40 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      1.00 ±  3%      +0.2        1.19 ±  2%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      1.52            +0.2        1.72 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      1.95 ±  2%      +0.3        2.21 ±  3%  perf-profile.children.cycles-pp.vm_area_dup
      1.26 ±  2%      +0.3        1.53 ±  3%  perf-profile.children.cycles-pp.up_write
      0.78            +0.3        1.05 ±  3%  perf-profile.children.cycles-pp.release_pages
      2.67 ±  2%      +0.3        2.97 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc
      1.61            +0.3        1.92 ±  2%  perf-profile.children.cycles-pp.copy_present_ptes
      2.62            +0.3        2.95 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      1.20            +0.4        1.56 ±  2%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      1.20            +0.4        1.56 ±  2%  perf-profile.children.cycles-pp.tlb_finish_mmu
      2.28            +0.4        2.66        perf-profile.children.cycles-pp.copy_pte_range
      2.57            +0.4        2.99        perf-profile.children.cycles-pp.copy_p4d_range
      2.63            +0.4        3.06        perf-profile.children.cycles-pp.copy_page_range
      1.98 ±  3%      +0.5        2.43 ±  3%  perf-profile.children.cycles-pp.next_uptodate_folio
      1.87            +0.6        2.42 ±  3%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      3.44            +0.6        4.02 ±  2%  perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      3.08            +0.6        3.66        perf-profile.children.cycles-pp._compound_head
      2.66 ±  3%      +0.6        3.26 ±  3%  perf-profile.children.cycles-pp.filemap_map_pages
      2.75 ±  3%      +0.6        3.38 ±  3%  perf-profile.children.cycles-pp.do_fault
      2.74 ±  3%      +0.6        3.37 ±  3%  perf-profile.children.cycles-pp.do_read_fault
     83.90            +0.6       84.54        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.28            +0.6        1.93 ±  5%  perf-profile.children.cycles-pp.osq_lock
      3.21 ±  2%      +0.7        3.89 ±  2%  perf-profile.children.cycles-pp.__handle_mm_fault
      3.32 ±  2%      +0.7        4.01 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
     83.14            +0.7       83.85        perf-profile.children.cycles-pp.do_syscall_64
      3.68 ±  2%      +0.7        4.41 ±  2%  perf-profile.children.cycles-pp.zap_present_ptes
      3.67 ±  2%      +0.7        4.40 ±  2%  perf-profile.children.cycles-pp.do_user_addr_fault
      3.68 ±  2%      +0.7        4.42 ±  2%  perf-profile.children.cycles-pp.exc_page_fault
      3.92 ±  2%      +0.8        4.71 ±  2%  perf-profile.children.cycles-pp.asm_exc_page_fault
      4.55            +0.8        5.35        perf-profile.children.cycles-pp.zap_pte_range
      4.63            +0.8        5.44        perf-profile.children.cycles-pp.zap_pmd_range
      4.73            +0.8        5.56        perf-profile.children.cycles-pp.unmap_page_range
      5.12            +0.9        6.00        perf-profile.children.cycles-pp.unmap_vmas
      4.17            +0.9        5.07 ±  2%  perf-profile.children.cycles-pp.unlink_anon_vmas
      5.74            +1.1        6.84 ±  2%  perf-profile.children.cycles-pp.free_pgtables
      6.04            +1.2        7.22 ±  2%  perf-profile.children.cycles-pp.anon_vma_clone
      3.41            +1.3        4.70 ±  4%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      3.53            +1.3        4.85 ±  4%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      5.33            +1.6        6.90 ±  3%  perf-profile.children.cycles-pp.down_write
      8.37            +1.8       10.21 ±  2%  perf-profile.children.cycles-pp.anon_vma_fork
     13.86            +2.6       16.41        perf-profile.children.cycles-pp.exit_mmap
     13.87            +2.6       16.43        perf-profile.children.cycles-pp.__mmput
     13.91            +2.6       16.48        perf-profile.children.cycles-pp.exit_mm
     14.61            +2.7       17.27        perf-profile.children.cycles-pp.__x64_sys_exit_group
     14.61            +2.7       17.27        perf-profile.children.cycles-pp.do_group_exit
     14.61            +2.7       17.26        perf-profile.children.cycles-pp.do_exit
     17.47            +3.0       20.48 ±  2%  perf-profile.children.cycles-pp.copy_process
     16.29            +3.0       19.33 ±  2%  perf-profile.children.cycles-pp.dup_mmap
     17.82            +3.1       20.89 ±  2%  perf-profile.children.cycles-pp.__do_sys_clone
     17.82            +3.1       20.89 ±  2%  perf-profile.children.cycles-pp.kernel_clone
     16.59            +3.1       19.68 ±  2%  perf-profile.children.cycles-pp.dup_mm
     18.26            +3.1       21.40 ±  2%  perf-profile.children.cycles-pp._Fork
      4.62 ±  2%      -1.0        3.62 ±  6%  perf-profile.self.cycles-pp.apparmor_capable
      4.18            -0.6        3.59 ±  2%  perf-profile.self.cycles-pp.stress_resched_child
      2.70            -0.2        2.47 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      1.34            -0.2        1.13 ±  2%  perf-profile.self.cycles-pp.update_cfs_group
      2.17            -0.2        1.98        perf-profile.self.cycles-pp.update_load_avg
      1.57            -0.2        1.39 ±  2%  perf-profile.self.cycles-pp.__sched_setscheduler
      1.64            -0.2        1.48        perf-profile.self.cycles-pp.__update_load_avg_se
      1.68            -0.1        1.54        perf-profile.self.cycles-pp.__schedule
      1.24            -0.1        1.12        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.60 ±  2%      -0.1        1.49        perf-profile.self.cycles-pp.__radix_tree_lookup
      1.34            -0.1        1.23        perf-profile.self.cycles-pp._raw_spin_lock
      1.10            -0.1        0.99        perf-profile.self.cycles-pp.do_sched_setscheduler
      0.30 ±  2%      -0.1        0.20 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.65            -0.1        1.55 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      1.66 ±  2%      -0.1        1.56 ±  2%  perf-profile.self.cycles-pp.__enqueue_entity
      0.82 ±  2%      -0.1        0.72        perf-profile.self.cycles-pp.__calc_delta
      1.55            -0.1        1.46 ±  2%  perf-profile.self.cycles-pp.update_curr
      0.88            -0.1        0.80 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.90            -0.1        0.82        perf-profile.self.cycles-pp.__switch_to
      0.80            -0.1        0.71        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.19            -0.1        1.11 ±  2%  perf-profile.self.cycles-pp.__dequeue_entity
      0.88            -0.1        0.80 ±  2%  perf-profile.self.cycles-pp.__switch_to_asm
      0.98 ±  2%      -0.1        0.90 ±  3%  perf-profile.self.cycles-pp.__sched_yield
      0.84            -0.1        0.76 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.15            -0.1        1.08        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.94            -0.1        0.87        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.60            -0.1        0.54 ±  2%  perf-profile.self.cycles-pp.dequeue_entity
      0.44            -0.1        0.38 ±  3%  perf-profile.self.cycles-pp.__sched_getscheduler
      0.56            -0.1        0.49 ±  2%  perf-profile.self.cycles-pp.native_sched_clock
      0.78            -0.1        0.72 ±  3%  perf-profile.self.cycles-pp.__get_user_8
      0.63            -0.1        0.57 ±  2%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.62            -0.1        0.56 ±  2%  perf-profile.self.cycles-pp.prepare_task_switch
      0.58            -0.1        0.52 ±  3%  perf-profile.self.cycles-pp.find_task_by_vpid
      0.67            -0.1        0.62 ±  2%  perf-profile.self.cycles-pp.pick_eevdf
      0.40            -0.1        0.35 ±  2%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.43            -0.1        0.38 ±  2%  perf-profile.self.cycles-pp.avg_vruntime
      0.65            -0.1        0.60        perf-profile.self.cycles-pp.dequeue_task_fair
      0.44            -0.0        0.40        perf-profile.self.cycles-pp.set_next_entity
      0.52            -0.0        0.47 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.46            -0.0        0.42 ±  2%  perf-profile.self.cycles-pp.blkcg_maybe_throttle_current
      0.45            -0.0        0.40 ±  2%  perf-profile.self.cycles-pp._sched_setscheduler
      0.57            -0.0        0.52 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.48 ±  2%      -0.0        0.43 ±  2%  perf-profile.self.cycles-pp.enqueue_entity
      0.12 ±  8%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp.reweight_task
      0.36            -0.0        0.32 ±  2%  perf-profile.self.cycles-pp.reweight_entity
      0.37 ±  2%      -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.update_curr_se
      0.45            -0.0        0.41 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.43            -0.0        0.39 ±  2%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.20 ±  2%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.34            -0.0        0.30 ±  3%  perf-profile.self.cycles-pp.switch_fpu_return
      0.36            -0.0        0.32 ±  2%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.32            -0.0        0.29        perf-profile.self.cycles-pp.place_entity
      0.24 ±  7%      -0.0        0.21 ±  3%  perf-profile.self.cycles-pp.sched_yield@plt
      0.60 ±  2%      -0.0        0.57 ±  2%  perf-profile.self.cycles-pp.___perf_sw_event
      0.28            -0.0        0.24 ±  3%  perf-profile.self.cycles-pp.put_prev_entity
      0.35 ±  2%      -0.0        0.32 ±  2%  perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.19 ± 10%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.sched_getscheduler@plt
      0.18 ±  2%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.set_next_task_fair
      0.29            -0.0        0.26        perf-profile.self.cycles-pp.vruntime_eligible
      0.28            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.29            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.__put_user_8
      0.30            -0.0        0.28 ±  2%  perf-profile.self.cycles-pp.schedule
      0.12            -0.0        0.10 ±  6%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.17 ±  4%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.__x64_sys_sched_getscheduler
      0.16            -0.0        0.14        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.24            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.update_rq_clock
      0.18 ±  2%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.do_sched_yield
      0.17 ±  2%      -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.20            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.__x64_sys_sched_yield
      0.16 ±  2%      -0.0        0.14 ±  2%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.14 ±  3%      -0.0        0.13        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.08 ±  6%      -0.0        0.06        perf-profile.self.cycles-pp.security_task_setscheduler
      0.15            -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.task_rq_lock
      0.16 ±  2%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.finish_task_switch
      0.10            -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.12            -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.rb_next
      0.17            -0.0        0.16        perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.__vm_area_free
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.mas_find
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.rcu_all_qs
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.zap_pmd_range
      0.09            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.unmap_page_range
      0.06 ±  7%      +0.0        0.07        perf-profile.self.cycles-pp.copy_p4d_range
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.__pte_offset_map
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.10 ±  4%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.vm_normal_page
      0.11 ±  3%      +0.0        0.13        perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.09            +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.__put_anon_vma
      0.08 ±  6%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.set_pte_range
      0.12 ±  4%      +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.sync_regs
      0.10 ±  4%      +0.0        0.13        perf-profile.self.cycles-pp.memset_orig
      0.14 ±  3%      +0.0        0.16 ±  4%  perf-profile.self.cycles-pp.refill_obj_stock
      0.18 ±  2%      +0.0        0.21 ±  3%  perf-profile.self.cycles-pp.unmap_single_vma
      0.11            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.33 ±  2%      +0.0        0.36 ±  3%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.12 ±  7%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
      0.14 ±  3%      +0.0        0.17 ±  5%  perf-profile.self.cycles-pp.folio_add_file_rmap_ptes
      0.22 ±  3%      +0.0        0.25 ±  3%  perf-profile.self.cycles-pp.acct_collect
      0.19 ±  2%      +0.0        0.22 ±  4%  perf-profile.self.cycles-pp.anon_vma_fork
      0.34 ±  4%      +0.0        0.37        perf-profile.self.cycles-pp.clear_page_erms
      0.27            +0.0        0.30 ±  3%  perf-profile.self.cycles-pp.kmem_cache_free
      0.11 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.rwsem_down_write_slowpath
      0.15            +0.0        0.18 ±  5%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.26            +0.0        0.29 ±  5%  perf-profile.self.cycles-pp.__cond_resched
      0.20 ±  2%      +0.0        0.23 ±  2%  perf-profile.self.cycles-pp.mas_next_slot
      0.38            +0.0        0.42        perf-profile.self.cycles-pp.__rb_erase_color
      0.25            +0.0        0.29        perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.queued_write_lock_slowpath
      0.46 ±  2%      +0.1        0.52 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.15 ±  2%      +0.1        0.20 ±  6%  perf-profile.self.cycles-pp.osq_unlock
      0.47 ±  3%      +0.1        0.54 ±  4%  perf-profile.self.cycles-pp.anon_vma_clone
      0.30            +0.1        0.38 ±  2%  perf-profile.self.cycles-pp.fput
      0.86            +0.1        0.94 ±  2%  perf-profile.self.cycles-pp.vma_interval_tree_insert_after
      0.70            +0.1        0.78        perf-profile.self.cycles-pp.__slab_free
      0.45 ±  3%      +0.1        0.53 ±  3%  perf-profile.self.cycles-pp.vm_area_dup
      0.39 ±  2%      +0.1        0.47        perf-profile.self.cycles-pp.free_swap_cache
      0.40 ±  3%      +0.1        0.48 ±  4%  perf-profile.self.cycles-pp.filemap_map_pages
      0.89            +0.1        0.98 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.41            +0.1        0.51 ±  2%  perf-profile.self.cycles-pp.zap_present_ptes
      0.66            +0.1        0.76        perf-profile.self.cycles-pp.mod_objcg_state
      0.91 ±  2%      +0.1        1.03 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.60 ±  2%      +0.1        0.74 ±  2%  perf-profile.self.cycles-pp.dup_mmap
      0.68 ±  2%      +0.1        0.82 ±  2%  perf-profile.self.cycles-pp.copy_present_ptes
      0.85            +0.1        0.99 ±  2%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.98 ±  3%      +0.2        1.16 ±  2%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      1.58 ±  2%      +0.2        1.80 ±  2%  perf-profile.self.cycles-pp.down_write
      0.67            +0.2        0.90 ±  3%  perf-profile.self.cycles-pp.release_pages
      1.22 ±  2%      +0.3        1.47 ±  3%  perf-profile.self.cycles-pp.up_write
      1.90 ±  3%      +0.4        2.34 ±  3%  perf-profile.self.cycles-pp.next_uptodate_folio
      1.85            +0.6        2.40 ±  3%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      3.41            +0.6        3.98 ±  2%  perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      3.04            +0.6        3.61        perf-profile.self.cycles-pp._compound_head
      1.28            +0.6        1.92 ±  5%  perf-profile.self.cycles-pp.osq_lock


***************************************************************************************************
lkp-icl-2sp7: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/pthread/stress-ng/60s

commit: 
  8e1d743f2c ("mm: vmalloc: support multiple nodes in vmallocinfo")
  8f33a2ff30 ("mm: vmalloc: set nr_nodes based on CPUs in a system")

8e1d743f2c2671aa 8f33a2ff307248c3e55a7696f60 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.103e+08 ±  2%     -11.2%  2.756e+08 ±  2%  cpuidle..time
   3645538 ±  3%     +20.1%    4377830 ±  4%  cpuidle..usage
    272.08 ±  5%     +30.7%     355.48 ±  4%  vmstat.procs.r
    519616           +29.0%     670384        vmstat.system.cs
      7.26 ±  3%      -0.9        6.35 ±  2%  mpstat.cpu.all.idle%
      1.31            -0.2        1.10 ±  7%  mpstat.cpu.all.soft%
      7.25 ±  3%      +1.0        8.24 ±  2%  mpstat.cpu.all.usr%
  31593569           +19.4%   37720051        numa-numastat.node0.local_node
  31610997           +19.4%   37737951        numa-numastat.node0.numa_hit
  30945450           +21.1%   37487443        numa-numastat.node1.local_node
  30968214           +21.1%   37501191        numa-numastat.node1.numa_hit
  31583274           +19.7%   37815649        numa-vmstat.node0.numa_hit
  31565846           +19.7%   37797719        numa-vmstat.node0.numa_local
  30943642           +21.4%   37559226        numa-vmstat.node1.numa_hit
  30920878           +21.4%   37545478        numa-vmstat.node1.numa_local
     88554           -14.7%      75562        stress-ng.pthread.nanosecs_to_start_a_pthread
   7746286           +23.0%    9525052        stress-ng.pthread.ops
    128866           +23.0%     158508        stress-ng.pthread.ops_per_sec
   2862008           +26.3%    3613525        stress-ng.time.involuntary_context_switches
  15732085           +22.5%   19274305        stress-ng.time.minor_page_faults
      3992            -4.9%       3796        stress-ng.time.percent_of_cpu_this_job_got
      2238            -5.9%       2106        stress-ng.time.system_time
    170.24            +7.1%     182.34        stress-ng.time.user_time
  17777919           +23.9%   22030981        stress-ng.time.voluntary_context_switches
     91213 ±  3%      -8.0%      83905 ±  5%  proc-vmstat.nr_active_anon
    939871            -1.8%     923098        proc-vmstat.nr_file_pages
     88399            +6.1%      93817        proc-vmstat.nr_page_table_pages
    182874            -9.2%     166087 ±  2%  proc-vmstat.nr_shmem
    190925            -4.4%     182575        proc-vmstat.nr_slab_unreclaimable
     91213 ±  3%      -8.0%      83905 ±  5%  proc-vmstat.nr_zone_active_anon
  62577695           +20.2%   75189015        proc-vmstat.numa_hit
  62537504           +20.2%   75157354        proc-vmstat.numa_local
  74903745           +11.8%   83730454        proc-vmstat.pgalloc_normal
  16196518           +21.6%   19694122        proc-vmstat.pgfault
  74132261           +11.0%   82322036        proc-vmstat.pgfree
   2086791           -14.0%    1794913 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
   2615784 ± 20%     -23.4%    2003134 ±  6%  sched_debug.cfs_rq:/.left_deadline.max
    986660 ±  3%     -14.3%     845553 ±  4%  sched_debug.cfs_rq:/.left_deadline.stddev
   2615743 ± 20%     -23.4%    2003024 ±  6%  sched_debug.cfs_rq:/.left_vruntime.max
    986630 ±  3%     -14.3%     845517 ±  4%  sched_debug.cfs_rq:/.left_vruntime.stddev
   2086803           -14.0%    1794916 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
   2615743 ± 20%     -23.4%    2003024 ±  6%  sched_debug.cfs_rq:/.right_vruntime.max
    986633 ±  3%     -14.3%     845518 ±  4%  sched_debug.cfs_rq:/.right_vruntime.stddev
    355.42 ±  5%     -18.5%     289.57 ±  9%  sched_debug.cfs_rq:/.util_est.avg
     13972 ± 11%     +82.3%      25471 ± 66%  sched_debug.cpu.avg_idle.min
    469287 ± 21%     -45.9%     253874 ± 12%  sched_debug.cpu.curr->pid.avg
   1753786           -69.3%     539091 ±  3%  sched_debug.cpu.curr->pid.max
    749368 ±  8%     -66.6%     250306 ±  4%  sched_debug.cpu.curr->pid.stddev
    253995           +28.9%     327477        sched_debug.cpu.nr_switches.avg
    395274 ±  7%     +33.6%     528250 ±  6%  sched_debug.cpu.nr_switches.max
     33244 ± 14%     +95.8%      65107 ± 15%  sched_debug.cpu.nr_switches.stddev
    241.42 ± 18%    +155.2%     616.08 ± 12%  sched_debug.cpu.nr_uninterruptible.max
   -249.75          +103.9%    -509.17        sched_debug.cpu.nr_uninterruptible.min
     92.52 ± 10%    +147.9%     229.32 ± 12%  sched_debug.cpu.nr_uninterruptible.stddev
      7.37 ±  2%    -100.0%       0.00        perf-stat.i.MPKI
 6.298e+09          -100.0%       0.00        perf-stat.i.branch-instructions
      0.88 ± 12%      -0.9        0.00        perf-stat.i.branch-miss-rate%
  55807581 ± 12%    -100.0%       0.00        perf-stat.i.branch-misses
     56.56           -56.6        0.00        perf-stat.i.cache-miss-rate%
  2.26e+08          -100.0%       0.00        perf-stat.i.cache-misses
 4.001e+08          -100.0%       0.00        perf-stat.i.cache-references
    534506          -100.0%       0.00        perf-stat.i.context-switches
      5.96          -100.0%       0.00        perf-stat.i.cpi
     64073          -100.0%       0.00        perf-stat.i.cpu-clock
 1.836e+11          -100.0%       0.00        perf-stat.i.cpu-cycles
    169069          -100.0%       0.00        perf-stat.i.cpu-migrations
    804.83          -100.0%       0.00        perf-stat.i.cycles-between-cache-misses
 3.052e+10          -100.0%       0.00        perf-stat.i.instructions
      0.18          -100.0%       0.00        perf-stat.i.ipc
      0.13 ± 42%    -100.0%       0.00        perf-stat.i.major-faults
     21.28          -100.0%       0.00        perf-stat.i.metric.K/sec
    267224          -100.0%       0.00        perf-stat.i.minor-faults
    393341          -100.0%       0.00        perf-stat.i.page-faults
     64073          -100.0%       0.00        perf-stat.i.task-clock
      7.41          -100.0%       0.00        perf-stat.overall.MPKI
      0.89 ± 11%      -0.9        0.00        perf-stat.overall.branch-miss-rate%
     56.48           -56.5        0.00        perf-stat.overall.cache-miss-rate%
      6.02          -100.0%       0.00        perf-stat.overall.cpi
    812.63          -100.0%       0.00        perf-stat.overall.cycles-between-cache-misses
      0.17          -100.0%       0.00        perf-stat.overall.ipc
 6.043e+09          -100.0%       0.00        perf-stat.ps.branch-instructions
  53842439 ± 11%    -100.0%       0.00        perf-stat.ps.branch-misses
 2.168e+08          -100.0%       0.00        perf-stat.ps.cache-misses
 3.838e+08          -100.0%       0.00        perf-stat.ps.cache-references
    512812          -100.0%       0.00        perf-stat.ps.context-switches
     61418          -100.0%       0.00        perf-stat.ps.cpu-clock
 1.761e+11          -100.0%       0.00        perf-stat.ps.cpu-cycles
    162170          -100.0%       0.00        perf-stat.ps.cpu-migrations
 2.928e+10          -100.0%       0.00        perf-stat.ps.instructions
      0.12 ± 41%    -100.0%       0.00        perf-stat.ps.major-faults
    256057          -100.0%       0.00        perf-stat.ps.minor-faults
    377071          -100.0%       0.00        perf-stat.ps.page-faults
     61418          -100.0%       0.00        perf-stat.ps.task-clock
 1.377e+12 ±  3%    -100.0%       0.00        perf-stat.total.instructions
     61.37           -61.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     61.36           -61.4        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     44.06           -44.1        0.00        perf-profile.calltrace.cycles-pp.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     44.04           -44.0        0.00        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     41.22           -41.2        0.00        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     31.33           -31.3        0.00        perf-profile.calltrace.cycles-pp.dup_task_struct.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64
     30.02           -30.0        0.00        perf-profile.calltrace.cycles-pp.alloc_thread_stack_node.dup_task_struct.copy_process.kernel_clone.__do_sys_clone3
     23.52           -23.5        0.00        perf-profile.calltrace.cycles-pp.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct.copy_process.kernel_clone
     21.74           -21.7        0.00        perf-profile.calltrace.cycles-pp.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct.copy_process
     19.93           -19.9        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     19.73           -19.7        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     19.63           -19.6        0.00        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     17.94           -17.9        0.00        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     17.90           -17.9        0.00        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     17.62           -17.6        0.00        perf-profile.calltrace.cycles-pp.delayed_vfree_work.process_one_work.worker_thread.kthread.ret_from_fork
     17.58           -17.6        0.00        perf-profile.calltrace.cycles-pp.vfree.delayed_vfree_work.process_one_work.worker_thread.kthread
     17.28           -17.3        0.00        perf-profile.calltrace.cycles-pp.remove_vm_area.vfree.delayed_vfree_work.process_one_work.worker_thread
     16.70           -16.7        0.00        perf-profile.calltrace.cycles-pp.find_unlink_vmap_area.remove_vm_area.vfree.delayed_vfree_work.process_one_work
     16.36           -16.4        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.find_unlink_vmap_area.remove_vm_area.vfree.delayed_vfree_work
     16.22           -16.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.find_unlink_vmap_area.remove_vm_area.vfree
     15.36           -15.4        0.00        perf-profile.calltrace.cycles-pp.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     14.45           -14.4        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node
     14.32           -14.3        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range
     13.79           -13.8        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.78           -13.8        0.00        perf-profile.calltrace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.58           -10.6        0.00        perf-profile.calltrace.cycles-pp.exit_notify.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.30 ±  3%      -6.3        0.00        perf-profile.calltrace.cycles-pp.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64
      6.25 ±  2%      -6.3        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
      6.25 ±  2%      -6.2        0.00        perf-profile.calltrace.cycles-pp.find_vm_area.alloc_thread_stack_node.dup_task_struct.copy_process.kernel_clone
      6.25 ±  2%      -6.2        0.00        perf-profile.calltrace.cycles-pp.find_vmap_area.find_vm_area.alloc_thread_stack_node.dup_task_struct.copy_process
      6.18 ±  2%      -6.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node
      6.10 ±  2%      -6.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.find_vmap_area.find_vm_area.alloc_thread_stack_node.dup_task_struct
      6.04 ±  2%      -6.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.find_vmap_area.find_vm_area.alloc_thread_stack_node
      5.98 ±  4%      -6.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone3
      5.63            -5.6        0.00        perf-profile.calltrace.cycles-pp.release_task.exit_notify.do_exit.__x64_sys_exit.do_syscall_64
     73.20           -73.2        0.00        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     73.12           -73.1        0.00        perf-profile.children.cycles-pp.do_syscall_64
     60.66           -60.7        0.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     44.70           -44.7        0.00        perf-profile.children.cycles-pp._raw_spin_lock
     44.06           -44.1        0.00        perf-profile.children.cycles-pp.__do_sys_clone3
     44.05           -44.1        0.00        perf-profile.children.cycles-pp.kernel_clone
     41.24           -41.2        0.00        perf-profile.children.cycles-pp.copy_process
     31.33           -31.3        0.00        perf-profile.children.cycles-pp.dup_task_struct
     30.02           -30.0        0.00        perf-profile.children.cycles-pp.alloc_thread_stack_node
     23.53           -23.5        0.00        perf-profile.children.cycles-pp.__vmalloc_node_range
     21.75           -21.8        0.00        perf-profile.children.cycles-pp.__get_vm_area_node
     19.94           -19.9        0.00        perf-profile.children.cycles-pp.ret_from_fork_asm
     19.73           -19.7        0.00        perf-profile.children.cycles-pp.ret_from_fork
     19.63           -19.6        0.00        perf-profile.children.cycles-pp.kthread
     17.94           -17.9        0.00        perf-profile.children.cycles-pp.worker_thread
     17.90           -17.9        0.00        perf-profile.children.cycles-pp.process_one_work
     17.62           -17.6        0.00        perf-profile.children.cycles-pp.delayed_vfree_work
     17.58           -17.6        0.00        perf-profile.children.cycles-pp.vfree
     17.28           -17.3        0.00        perf-profile.children.cycles-pp.remove_vm_area
     16.70           -16.7        0.00        perf-profile.children.cycles-pp.find_unlink_vmap_area
     15.37           -15.4        0.00        perf-profile.children.cycles-pp.alloc_vmap_area
     15.22 ±  2%     -15.2        0.00        perf-profile.children.cycles-pp.queued_write_lock_slowpath
     13.79           -13.8        0.00        perf-profile.children.cycles-pp.do_exit
     13.79           -13.8        0.00        perf-profile.children.cycles-pp.__x64_sys_exit
     10.60           -10.6        0.00        perf-profile.children.cycles-pp.exit_notify
      6.25 ±  2%      -6.2        0.00        perf-profile.children.cycles-pp.find_vm_area
      6.25 ±  2%      -6.2        0.00        perf-profile.children.cycles-pp.find_vmap_area
      5.64            -5.6        0.00        perf-profile.children.cycles-pp.release_task
     60.10           -60.1        0.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp8: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/1HDD/xfs/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/fstat/stress-ng/60s

commit: 
  8e1d743f2c ("mm: vmalloc: support multiple nodes in vmallocinfo")
  8f33a2ff30 ("mm: vmalloc: set nr_nodes based on CPUs in a system")

8e1d743f2c2671aa 8f33a2ff307248c3e55a7696f60 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    997288 ±  3%     -15.4%     843597        cpuidle..usage
      7.03 ±  2%      -0.6        6.40 ±  2%  mpstat.cpu.all.usr%
    484098 ± 28%     -13.3%     419786 ± 29%  numa-meminfo.node1.AnonPages
    663480           +10.8%     734941        vmstat.system.cs
      5.27            -2.2%       5.16        iostat.cpu.idle
      6.86 ±  2%      -9.0%       6.25 ±  2%  iostat.cpu.user
  24680350           +11.8%   27601129        numa-numastat.node0.local_node
  24698967           +11.8%   27610564        numa-numastat.node0.numa_hit
  24477203           +11.8%   27360272        numa-numastat.node1.local_node
  24488895           +11.8%   27372319        numa-numastat.node1.numa_hit
  49190007           +11.8%   54985573        proc-vmstat.numa_hit
  49159697           +11.8%   54964091        proc-vmstat.numa_local
  67800330           +10.1%   74622778        proc-vmstat.pgalloc_normal
  67318347           +10.2%   74165586        proc-vmstat.pgfree
  24698615           +11.8%   27610688        numa-vmstat.node0.numa_hit
  24679998           +11.8%   27601254        numa-vmstat.node0.numa_local
    121091 ± 28%     -13.3%     105042 ± 29%  numa-vmstat.node1.nr_anon_pages
  24490961           +11.8%   27374365        numa-vmstat.node1.numa_hit
  24479269           +11.8%   27362318        numa-vmstat.node1.numa_local
    193769 ± 12%    +380.1%     930191 ± 11%  sched_debug.cpu.curr->pid.avg
    337915 ±  3%    +367.9%    1581106        sched_debug.cpu.curr->pid.max
    163867 ±  4%    +369.2%     768798 ±  2%  sched_debug.cpu.curr->pid.stddev
    322732           +10.7%     357272        sched_debug.cpu.nr_switches.avg
     14389 ±  3%     +16.2%      16727 ±  2%  sched_debug.cpu.nr_switches.stddev
   4436668           +14.2%    5068589        stress-ng.fstat.ops
     73944           +14.2%      84476        stress-ng.fstat.ops_per_sec
  13090195            -5.6%   12355268        stress-ng.time.involuntary_context_switches
      4542            -2.9%       4410        stress-ng.time.percent_of_cpu_this_job_got
      2526            -2.3%       2469        stress-ng.time.system_time
    203.49 ±  2%     -10.8%     181.49 ±  2%  stress-ng.time.user_time
   7093521           +11.1%    7880973        stress-ng.time.voluntary_context_switches
      1.50           +17.5%       1.76        perf-stat.i.MPKI
 2.274e+10            -5.9%   2.14e+10        perf-stat.i.branch-instructions
      0.43 ±  2%      +0.0        0.45        perf-stat.i.branch-miss-rate%
     24.81            +0.2       25.03        perf-stat.i.cache-miss-rate%
  1.86e+08           +10.2%   2.05e+08        perf-stat.i.cache-misses
 7.477e+08            +9.2%  8.166e+08        perf-stat.i.cache-references
    692032           +10.5%     764968        perf-stat.i.context-switches
      1.80            +6.9%       1.93        perf-stat.i.cpi
    162778            +9.1%     177635        perf-stat.i.cpu-migrations
      1203            -8.9%       1096        perf-stat.i.cycles-between-cache-misses
 1.225e+11            -6.2%  1.148e+11        perf-stat.i.instructions
      0.57            -6.3%       0.53        perf-stat.i.ipc
     13.32           +10.2%      14.68        perf-stat.i.metric.K/sec
      1.53           +18.0%       1.81        perf-stat.overall.MPKI
      0.34            +0.0        0.36        perf-stat.overall.branch-miss-rate%
     25.05            +0.3       25.34        perf-stat.overall.cache-miss-rate%
      1.83            +6.8%       1.96        perf-stat.overall.cpi
      1194            -9.5%       1080        perf-stat.overall.cycles-between-cache-misses
      0.55            -6.4%       0.51        perf-stat.overall.ipc
 2.192e+10            -6.0%  2.061e+10        perf-stat.ps.branch-instructions
 1.809e+08           +10.6%      2e+08        perf-stat.ps.cache-misses
  7.22e+08            +9.3%  7.891e+08        perf-stat.ps.cache-references
    663930           +10.8%     735472        perf-stat.ps.context-switches
    156779            +9.2%     171252        perf-stat.ps.cpu-migrations
  1.18e+11            -6.3%  1.106e+11        perf-stat.ps.instructions
 7.023e+12            -7.1%  6.524e+12 ±  2%  perf-stat.total.instructions
     50.41           -50.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     50.39           -50.4        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.84           -26.8        0.00        perf-profile.calltrace.cycles-pp.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.79           -26.8        0.00        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.52           -23.5        0.00        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.36           -22.4        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.36           -22.4        0.00        perf-profile.calltrace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.68           -19.7        0.00        perf-profile.calltrace.cycles-pp.fstatat64
     18.43           -18.4        0.00        perf-profile.calltrace.cycles-pp.exit_notify.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.13           -17.1        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.fstatat64
     16.79           -16.8        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fstatat64
     16.02           -16.0        0.00        perf-profile.calltrace.cycles-pp.statx
     15.91           -15.9        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newfstatat.do_syscall_64.entry_SYSCALL_64_after_hwframe.fstatat64
     13.78           -13.8        0.00        perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newfstatat.do_syscall_64.entry_SYSCALL_64_after_hwframe.fstatat64
     13.36           -13.4        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.statx
     13.06           -13.1        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.statx
     12.18           -12.2        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_statx.do_syscall_64.entry_SYSCALL_64_after_hwframe.statx
     11.15           -11.1        0.00        perf-profile.calltrace.cycles-pp.dup_task_struct.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64
     10.32           -10.3        0.00        perf-profile.calltrace.cycles-pp.alloc_thread_stack_node.dup_task_struct.copy_process.kernel_clone.__do_sys_clone3
      9.61            -9.6        0.00        perf-profile.calltrace.cycles-pp.release_task.exit_notify.do_exit.__x64_sys_exit.do_syscall_64
      9.45            -9.5        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      9.25            -9.3        0.00        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      9.10            -9.1        0.00        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      8.80            -8.8        0.00        perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newfstatat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.55            -8.6        0.00        perf-profile.calltrace.cycles-pp.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone3.do_syscall_64
      8.50            -8.5        0.00        perf-profile.calltrace.cycles-pp.queued_write_lock_slowpath.exit_notify.do_exit.__x64_sys_exit.do_syscall_64
      8.30            -8.3        0.00        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      8.22            -8.2        0.00        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      8.20            -8.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone3
      8.14            -8.1        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.exit_notify.do_exit.__x64_sys_exit
      8.11            -8.1        0.00        perf-profile.calltrace.cycles-pp.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct.copy_process.kernel_clone
      8.10            -8.1        0.00        perf-profile.calltrace.cycles-pp.delayed_vfree_work.process_one_work.worker_thread.kthread.ret_from_fork
      8.06            -8.1        0.00        perf-profile.calltrace.cycles-pp.vfree.delayed_vfree_work.process_one_work.worker_thread.kthread
      7.91            -7.9        0.00        perf-profile.calltrace.cycles-pp.queued_write_lock_slowpath.release_task.exit_notify.do_exit.__x64_sys_exit
      7.80            -7.8        0.00        perf-profile.calltrace.cycles-pp.remove_vm_area.vfree.delayed_vfree_work.process_one_work.worker_thread
      7.54            -7.5        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.release_task.exit_notify.do_exit
      7.34            -7.3        0.00        perf-profile.calltrace.cycles-pp.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct.copy_process
      7.18            -7.2        0.00        perf-profile.calltrace.cycles-pp.find_unlink_vmap_area.remove_vm_area.vfree.delayed_vfree_work.process_one_work
      6.97            -7.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.find_unlink_vmap_area.remove_vm_area.vfree.delayed_vfree_work
      6.92            -6.9        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.find_unlink_vmap_area.remove_vm_area.vfree
      6.28            -6.3        0.00        perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newfstatat.do_syscall_64
      6.03            -6.0        0.00        perf-profile.calltrace.cycles-pp.do_statx.__x64_sys_statx.do_syscall_64.entry_SYSCALL_64_after_hwframe.statx
      5.44            -5.4        0.00        perf-profile.calltrace.cycles-pp.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
      5.40            -5.4        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newfstatat
     83.05           -83.0        0.00        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     82.50           -82.5        0.00        perf-profile.children.cycles-pp.do_syscall_64
     42.03           -42.0        0.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     26.84           -26.8        0.00        perf-profile.children.cycles-pp.__do_sys_clone3
     26.79           -26.8        0.00        perf-profile.children.cycles-pp.kernel_clone
     24.96           -25.0        0.00        perf-profile.children.cycles-pp.queued_write_lock_slowpath
     23.54           -23.5        0.00        perf-profile.children.cycles-pp.copy_process
     22.37           -22.4        0.00        perf-profile.children.cycles-pp.do_exit
     22.36           -22.4        0.00        perf-profile.children.cycles-pp.__x64_sys_exit
     19.73           -19.7        0.00        perf-profile.children.cycles-pp.fstatat64
     18.44           -18.4        0.00        perf-profile.children.cycles-pp.exit_notify
     16.39           -16.4        0.00        perf-profile.children.cycles-pp._raw_spin_lock
     16.08           -16.1        0.00        perf-profile.children.cycles-pp.statx
     15.97           -16.0        0.00        perf-profile.children.cycles-pp.__do_sys_newfstatat
     13.86           -13.9        0.00        perf-profile.children.cycles-pp.vfs_fstatat
     13.56           -13.6        0.00        perf-profile.children.cycles-pp.vfs_statx
     12.28           -12.3        0.00        perf-profile.children.cycles-pp.__x64_sys_statx
     11.15           -11.2        0.00        perf-profile.children.cycles-pp.dup_task_struct
     10.32           -10.3        0.00        perf-profile.children.cycles-pp.alloc_thread_stack_node
      9.66            -9.7        0.00        perf-profile.children.cycles-pp.filename_lookup
      9.62            -9.6        0.00        perf-profile.children.cycles-pp.release_task
      9.45            -9.5        0.00        perf-profile.children.cycles-pp.ret_from_fork_asm
      9.25            -9.3        0.00        perf-profile.children.cycles-pp.ret_from_fork
      9.11            -9.1        0.00        perf-profile.children.cycles-pp.getname_flags
      9.10            -9.1        0.00        perf-profile.children.cycles-pp.kthread
      8.30            -8.3        0.00        perf-profile.children.cycles-pp.worker_thread
      8.22            -8.2        0.00        perf-profile.children.cycles-pp.process_one_work
      8.15            -8.2        0.00        perf-profile.children.cycles-pp.path_lookupat
      8.11            -8.1        0.00        perf-profile.children.cycles-pp.__vmalloc_node_range
      8.10            -8.1        0.00        perf-profile.children.cycles-pp.delayed_vfree_work
      8.06            -8.1        0.00        perf-profile.children.cycles-pp.vfree
      7.80            -7.8        0.00        perf-profile.children.cycles-pp.remove_vm_area
      7.34            -7.3        0.00        perf-profile.children.cycles-pp.__get_vm_area_node
      7.18            -7.2        0.00        perf-profile.children.cycles-pp.find_unlink_vmap_area
      6.07            -6.1        0.00        perf-profile.children.cycles-pp.do_statx
      5.51            -5.5        0.00        perf-profile.children.cycles-pp.strncpy_from_user
      5.44            -5.4        0.00        perf-profile.children.cycles-pp.alloc_vmap_area
     41.98           -42.0        0.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

