Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651591C1AD3
	for <oe-lkp@lists.linux.dev>; Wed, 21 Aug 2024 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229538; cv=fail; b=DeFeDND5cDqgOFBHRYjFjNg0PfdtPZgnHoMmnaAgSx5ktdG1WXsF4E5RcxgEJFjB/hsiN4H/b9r5ybk+renBdeKMPLIsDY6SBS7U/6K5/JVP3tlpEWFtSRT+rTTQW3XeRKT82U+nj8VBPFLQMx8ItUwDjOS6BPtwtzvqbKV8R90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229538; c=relaxed/simple;
	bh=25sVVNIqNpR88IJsPu1D/JIAux5qgcqnImTAC6EZCb8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=safSrulPsTwbgRfXA+BG5/NqCRl8wSVG+9MO/neWzSyTFLXbS+ePv+PUEmxvaDoMJPtIqjNQkynx47DDZL5U3a4U7JcijNym6EOhByQPUEVgCEyp+yMOIOOQysCfhrDJ0bxq8JdwSLbGPLH1lvcu2ICIk9s6JIQaBS9viePE2RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+Tn+W6D; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+Tn+W6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724229534; x=1755765534;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=25sVVNIqNpR88IJsPu1D/JIAux5qgcqnImTAC6EZCb8=;
  b=G+Tn+W6DiHBXEYth0d9Z+Wil4GNgUAXDPrtciurRVx+9oU3u2ouiPhpu
   DsMkI01Zl77WswY3QlvH567LPFf24oUZySEuydUxkYqJ9kIv6F01SfbpU
   HeQ5EGwF3vIaYBW1Qn5OmlUWDNIAsR2DIRTkl2ma7L5IysdXRmta9eRxp
   esrhERg4jPz3r4W8Ktnvd6RfsEpJ7h2nvGQW8nGRXftvTHT6uVaZgcbb8
   8dJo5txtAcUSmzPqLKuwu3UIhwkwbfeXry/Vmk9B/mGP8CoLyH9ZKYCRd
   OSp+xFVsdGl/3UbD9mi34xfD5oiucnL6iuKl41VWkl8VHOdYe1jA/OkZj
   Q==;
X-CSE-ConnectionGUID: dke+ycoNSTexeosFuYqY/Q==
X-CSE-MsgGUID: 0Ha27ytfQUCdsdSkU9LTAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33141026"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33141026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 01:38:53 -0700
X-CSE-ConnectionGUID: F0tRlaRgQVegGegLj+eAZw==
X-CSE-MsgGUID: XISByatORb2rZnc8bPB6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65221417"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Aug 2024 01:38:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 01:38:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 01:38:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 01:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEuTWzUMgIhG+yH2792OKbwG4JbdnhRP0gJE7uIZcV3poQpKzjw6LmN7KvKPFm6UyZFo70Z8tbHZY+xWnBjDnV6BppQ+k5woeYxm3S3YSnxELFSenJ9CqKcwmQ9PORl1T6/T6t3dOsxj/Ip9Tob3qpLAZeVBVJaXudaHwzOBDRZ4GtTElOXHP/1LBO6YvhqoT/VYjgjaEe5uxXx/oWUsA6GTraqFla6UdXJsSjOjdtky2YvHIrqFY6LVRtz0cqVI4atkC9/tE0sMd55y6uM4s7ngDOTlcUBd+72aa6wR2/lQMUSZuHmIBag6SP/Cx27E8B/7CFNp4FP+5uQ+r8Zv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH3bjsgQ1aKQU9GqDcfmSHu0Y3QbNx6/8F5bEnN3wmg=;
 b=hoVV07cCvWNGFdJrG0ZOMDMb25H33UZekZSrUcOuyf+/ApIB35mdscKoifDjCHi69Pktt6+hOOBZpBaCWtIHHDG9TEzbIjsPneFfyEXXN2eZEI3al9wAffdPeSfmI1bwsZEKHTbXecXorWXS2YbWtLWqafd+QdnEIHLx4IVOErP5vpdaitSptjvz6diEBx5KycsRuHqc3xr+9wvNm0QHhCK44P/h7zeaOOyclIMDLZJ7XHwySNgI1ZCSwZyfuSoGhzxQv9GxQ284WEda8WPcETzgzAV9oEsTEvY2FApJnY4lnBO5wuRXWiUuxsA60DOSgKex2fePoXnePk86AVKZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 08:38:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 08:38:49 +0000
Date: Wed, 21 Aug 2024 16:38:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/ptp/timekeeping] [timekeeping]  18400c1aa7:
 stress-ng.clock.ops_per_sec 25.8% improvement
Message-ID: <202408211618.ed61ca0a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c61a12-c357-465b-02fa-08dcc1bcad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?51esKxtG6ms9rMRmg9kUHfHzL+xgz41hyzL2nB6iSTcuJ25ib06i+o4e68?=
 =?iso-8859-1?Q?z006LCmMFjUuSAn8bW2hCw0sgGy391ReqCQpZptTydW9o1iz9QRkl5c7nF?=
 =?iso-8859-1?Q?OlNifkOv6IiKirCF4LqJySPfxjlsl/5wT5jGvDzSOY5yrI/an26rn3WYcL?=
 =?iso-8859-1?Q?zmXqRyOv4V2/3jZsSIC7rAvegvH8EFZIsg633KzAHvqCqxgcQrEYT6H9Ev?=
 =?iso-8859-1?Q?UfhZsHMR9PKm9COdPMvVndG89HxcYxWep+2oua+JgbjlIcvdtSRSikp6QL?=
 =?iso-8859-1?Q?Bd78AMws5BfjA4AVpT1GSvkvBR1bcG6PMouGiNiTriFLBKEkLLVBFu24DD?=
 =?iso-8859-1?Q?Jc/IWhmY+2ok1UTw4ulrFcOR6yY/ZMze/PByynJdO6Wk0SbAipMrEtzgtX?=
 =?iso-8859-1?Q?JDH2HnP6+AUlrXBPFOC3N7cU/JKZSGspkqCDb+uXHNso+FfzzlsKWRz4jj?=
 =?iso-8859-1?Q?R9B9H5cqlMoGb9ZtZqitbSnNXbi1g+Ip2nbq8MnWuhikSKHFw1WzG9Ur3a?=
 =?iso-8859-1?Q?M/29Nlb77FZMleRPWS/EVUyQP6RLolsPe4S2ZjuNwjSon9eVsC1bAT2rgU?=
 =?iso-8859-1?Q?IIH8vDtYqrrjtWzCzP+elLhpqZ32Zd2LzadbyJ1+tsVtEPoTauPflw0YWr?=
 =?iso-8859-1?Q?1PMLWok0sSDlbVWf+bnPW0fOfJ/nvqcG014XZvyNyI9X7oUocRQc8AtLKW?=
 =?iso-8859-1?Q?VnetcMSTDMYis3sZPlRvUf7ggUL/vkF3nMN0VJKiWHc1fsnLYSJFWAf2hc?=
 =?iso-8859-1?Q?2fImmZ17B8BIn3QcLETHV7/jmLzcRzJFFM71WC65I1BBg6AmxrUz8OAD2T?=
 =?iso-8859-1?Q?qAkYI3/6lmL+MJ2zmZGzfFl6eA3hU8Pzl4azyM35ZNB3Nja+E/jesj4OiV?=
 =?iso-8859-1?Q?paMF4FBRXbcCdVZztbhiGyT/R43/CliDo+GVXT6Yw1YM8/O71m90OXK7M5?=
 =?iso-8859-1?Q?21dpSdZtK7Ooeqa1BWBsS3obopL9BvuAc8N/WyP3Lc/4bURHxpNGLtuQ51?=
 =?iso-8859-1?Q?3ufEUkiIAAlxIQCeM1a4dh6tXIMYrS8aUzswP3/W7v3n27Il5Bb2lf7Djk?=
 =?iso-8859-1?Q?X9YVm/fBzbvtSdU2KPY1dI11xQZKeFV6AD2OP8uIg+/B/rb1FEyF41yHgN?=
 =?iso-8859-1?Q?aMpZjGNgO5nyzNbmYZW6iZ3CeeT0rkT4cqjUSih+gQQhkQQ0c7doXAB0jU?=
 =?iso-8859-1?Q?fud4UHuQpL1gSwGzt1Gta7rBm9MuMV+58Cl3pu3d4iI12QSgSpSwmpeNvc?=
 =?iso-8859-1?Q?iQMMqpTegN6L6cRnqx6u28sHoYGf/JC1kBb0LDj52VYIw5WWjKKcdsevr+?=
 =?iso-8859-1?Q?KYxBGvqZQaXxOAQAzCTENQzHcBFccc8Ix0vS4It7honZULIxTvhi5EzpM8?=
 =?iso-8859-1?Q?l7WNdCcMfp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LVlesjixUn74sr7Xv/IgzkxmO3EVguh9YVCJQgaPFNYr8vNFMtMaezwUZo?=
 =?iso-8859-1?Q?yNGNkAF4peAc3+4ROAmR4uKjRL1kp/czYUjws9GziODtl0JqaVabyBCKaq?=
 =?iso-8859-1?Q?KXE0NeGGoilhy8ObAHX4hBt/+3kRaGOIzfHo7W0Lmm4HgEB4P3QLz1MNF3?=
 =?iso-8859-1?Q?Hl3182i6c6YsR1yKLAeTUaWjXgpkNbn3u8uuwXouZEmv0QhGVEWY9VtcV5?=
 =?iso-8859-1?Q?J6gWLeeQceembHmDyLzAdSODOVgCao+PEnvvD+n/gh1eLgo6B/sJrmTSTR?=
 =?iso-8859-1?Q?XzG+DBNkBo7IbN9+zdPps69L6Qy665/8E6q+ttRD3QL1Knh9xLqS1nWh6G?=
 =?iso-8859-1?Q?74dQGqFhlsX1zDvqtQbXLvGiWF6z1pJnvGfcQzzWir4PmUo2UlOcQI8K+C?=
 =?iso-8859-1?Q?caz9q50pyK2iIA7aoSXkNrwtWQlYO0UwueJGuck9DcRuiizZNE8upHoApI?=
 =?iso-8859-1?Q?YY0p3uSaQ2PRzmcKTbM5aEchrN4z8n34dZz0CsmLFVvr9Y8LgkBRURtqei?=
 =?iso-8859-1?Q?1UalruN4YvjkN+T7MXhj1NavOQ7G1hBE0Wva5QFKLwRydTxllz14vXfJGG?=
 =?iso-8859-1?Q?kUrulahV77H8MImGiJ+Wp43wcDCU0aaM1Aa5GFNH3RJGXXDFm2HvHUFLu5?=
 =?iso-8859-1?Q?tGIvzw4qdwF7DhSJWftxL2Rw/m8btWD5R8d8BQhfPDbAYMRRwaBwmExhdj?=
 =?iso-8859-1?Q?dOoDaZG9gB2L1SyT8Ws+1LhJr20kT89a1p7a6Z9AnxO8EJK469O3BeM0jc?=
 =?iso-8859-1?Q?K3eB2PRrVWAcduhUENJgaiH4we9ly/R8+KZsiuXi4Oh3YkuzW3U9ISDlzw?=
 =?iso-8859-1?Q?hHspPs7XZgC61C/seIXTH9HkH/i2NW9ienAQOq8c49/t9MrXt1ghOW4dAy?=
 =?iso-8859-1?Q?xMNMPPMawL0ZGvOeTjFwK7KmKU7wONXArX+g2FfEEGs/9d4L2CuMzujo+R?=
 =?iso-8859-1?Q?OiPOzVkT+UKNuYHiFBlH345zImIonxmwb/G9NpKEvZuruFKIvh0Ks7qM8b?=
 =?iso-8859-1?Q?ZRQtdNlEc9J5pkqKu1raPaytL/cDNr2fGjQRKfdTCq11L9+C/X260+013Z?=
 =?iso-8859-1?Q?T1NUKuN0oV23op/AsqScfipGMA+dsmnf8yggUScYGhr4xs/9D809MUaLyW?=
 =?iso-8859-1?Q?jz3RCCB5eWZV6ExIFeZolTS4Go2nHJxeVua5xfee2YeYAYugQCY9njvEMI?=
 =?iso-8859-1?Q?jgpPs7pWxwcGvD360U7Nid7Cr0Om9hlUJk5oW0Wd7cIxfIipFHGYWMldsw?=
 =?iso-8859-1?Q?elV/mNyrWTy9iGAow10vM/Nn/O2Y/G9wanlbMAGggu3gylwURJgI5rgMKW?=
 =?iso-8859-1?Q?pj32FLJrnDO8R3DHiO8RdTRvdu2SFdbnVtjiBuB9uRSf7g5M9CXWqOOzvC?=
 =?iso-8859-1?Q?zW3h/R4xaP/9Fl+lHK91ZsHvSh29shv8hRCcAGNUcWhVA4UIqplJqF6i/o?=
 =?iso-8859-1?Q?NHFOPnf3dfyNzlj5aRqvnUGC9m0H8/HIJt0jp6p504EOWu8lCQNQJrIs+g?=
 =?iso-8859-1?Q?cMzTygToM9R2uW5si1SJxlrLIm9lGUSs3NtpqVkWE4/aMNsF2/btFq9042?=
 =?iso-8859-1?Q?GhXJpeG3GsITBBdKEpBiFLSuRPCcBZr6D9z6kcDxg4UkzBdhdurD5pvbDF?=
 =?iso-8859-1?Q?+98z/bZLyEQmtmEILwwS4hUhr9RyMNDRXJVvePoRXMNd+3e+rSJVf9vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c61a12-c357-465b-02fa-08dcc1bcad9b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 08:38:49.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDVttZFzcoSe8nML10OUL3az66+oXY13VY6OtpFkcqCf2q6Xs8gJrg549YyxUCFTOCgrq/gBvfz5PQfbeB08WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 25.8% improvement of stress-ng.clock.ops_per_sec on:


commit: 18400c1aa73868a0fff510682ab99a598cec995f ("timekeeping: Rework timekeeping_inject_offset() to use shadow_timekeeper")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: clock
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240821/202408211618.ed61ca0a-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp8/clock/stress-ng/60s

commit: 
  d31e35d297 ("timekeeping: Rework do_settimeofday64() to use shadow_timekeeper")
  18400c1aa7 ("timekeeping: Rework timekeeping_inject_offset() to use shadow_timekeeper")

d31e35d29765c46e 18400c1aa73868a0fff510682ab 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.329e+09 ±  3%     +10.1%  1.463e+09        cpuidle..time
  16872457           +31.0%   22098367        cpuidle..usage
   1003649 ±  9%     +30.8%    1312654 ±  6%  numa-numastat.node1.local_node
   1034719 ±  9%     +29.9%    1343740 ±  6%  numa-numastat.node1.numa_hit
     43.16 ±  4%      -7.6%      39.88 ±  4%  vmstat.procs.r
    909248           +24.8%    1135192        vmstat.system.cs
    632618           +20.7%     763619        vmstat.system.in
     32.18 ±  2%      +3.3       35.52 ±  2%  mpstat.cpu.all.idle%
      2.22            -0.4        1.83 ±  3%  mpstat.cpu.all.irq%
      0.23            +0.0        0.26        mpstat.cpu.all.soft%
      1.65 ±  2%      +0.2        1.87        mpstat.cpu.all.usr%
   1898926 ± 15%     +35.5%    2573761 ±  9%  numa-meminfo.node1.Active
   1898900 ± 15%     +35.5%    2573736 ±  9%  numa-meminfo.node1.Active(anon)
    196393 ± 18%     +50.2%     294953 ± 17%  numa-meminfo.node1.Mapped
   1973768 ± 14%     +34.8%    2660638 ± 10%  numa-meminfo.node1.Shmem
   2305486           +22.7%    2827764        meminfo.Active
   2305445           +22.7%    2827716        meminfo.Active(anon)
   3756667           +14.2%    4289200        meminfo.Committed_AS
    312768 ±  2%     +28.9%     403259 ±  4%  meminfo.Mapped
   2445089           +21.5%    2969854        meminfo.Shmem
    475117 ± 15%     +35.5%     643917 ±  9%  numa-vmstat.node1.nr_active_anon
     49805 ± 18%     +49.6%      74534 ± 17%  numa-vmstat.node1.nr_mapped
    493902 ± 14%     +34.8%     665739 ± 10%  numa-vmstat.node1.nr_shmem
    475116 ± 15%     +35.5%     643917 ±  9%  numa-vmstat.node1.nr_zone_active_anon
   1034174 ±  9%     +29.9%    1343098 ±  6%  numa-vmstat.node1.numa_hit
   1003104 ±  9%     +30.8%    1312011 ±  6%  numa-vmstat.node1.numa_local
  10571160           +25.8%   13295623        stress-ng.clock.ops
    176184           +25.8%     221591        stress-ng.clock.ops_per_sec
      4095            -5.7%       3862        stress-ng.time.percent_of_cpu_this_job_got
      2433            -6.0%       2287        stress-ng.time.system_time
     26.09           +24.8%      32.56 ±  2%  stress-ng.time.user_time
  28644785           +24.7%   35718709        stress-ng.time.voluntary_context_switches
    576672           +22.7%     707322        proc-vmstat.nr_active_anon
   1382620            +9.5%    1513913        proc-vmstat.nr_file_pages
     78791 ±  2%     +28.8%     101520 ±  4%  proc-vmstat.nr_mapped
    611633           +21.5%     742922        proc-vmstat.nr_shmem
     25056            +1.8%      25519        proc-vmstat.nr_slab_reclaimable
    576672           +22.7%     707322        proc-vmstat.nr_zone_active_anon
   1468711           +22.3%    1796947        proc-vmstat.numa_hit
   1402509           +23.4%    1730732        proc-vmstat.numa_local
   1948104           +31.4%    2558958        proc-vmstat.pgalloc_normal
   1069307           +39.5%    1492013 ±  2%  proc-vmstat.pgfree
    822711           -12.4%     721052 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.48 ±  5%      -8.2%       0.44 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
    822711           -12.4%     721052 ±  3%  sched_debug.cfs_rq:/.min_vruntime.min
      0.48 ±  4%      -8.0%       0.44 ±  4%  sched_debug.cfs_rq:/.nr_running.stddev
    234.63 ±  6%     -15.1%     199.10 ±  5%  sched_debug.cfs_rq:/.util_est.stddev
      3035 ±  5%      -9.1%       2758 ±  6%  sched_debug.cpu.avg_idle.min
      0.49 ±  4%      -9.5%       0.44 ±  3%  sched_debug.cpu.nr_running.stddev
    444356           +24.4%     552965        sched_debug.cpu.nr_switches.avg
    473076           +23.5%     584167        sched_debug.cpu.nr_switches.max
    382849 ±  4%     +26.4%     483753 ±  4%  sched_debug.cpu.nr_switches.min
      2.21           +12.3%       2.48 ±  2%  perf-stat.i.MPKI
  9.34e+09            +8.7%  1.015e+10        perf-stat.i.branch-instructions
  83670402           +11.6%   93360967        perf-stat.i.branch-misses
     31.93            +1.3       33.27        perf-stat.i.cache-miss-rate%
  97944768           +21.4%  1.189e+08        perf-stat.i.cache-misses
  3.06e+08           +16.5%  3.565e+08 ±  2%  perf-stat.i.cache-references
    945168           +24.7%    1178747        perf-stat.i.context-switches
      3.65           -12.8%       3.19        perf-stat.i.cpi
 1.616e+11            -5.6%  1.526e+11        perf-stat.i.cpu-cycles
      4867            +6.7%       5191 ±  2%  perf-stat.i.cpu-migrations
      1652           -22.0%       1288        perf-stat.i.cycles-between-cache-misses
 4.478e+10            +8.5%  4.857e+10        perf-stat.i.instructions
      0.28           +14.8%       0.33        perf-stat.i.ipc
     14.80           +24.7%      18.46        perf-stat.i.metric.K/sec
      1.83 ± 44%     +34.3%       2.45 ±  2%  perf-stat.overall.MPKI
     26.63 ± 44%      +6.7       33.33        perf-stat.overall.cache-miss-rate%
      0.23 ± 44%     +37.9%       0.32        perf-stat.overall.ipc
 7.642e+09 ± 44%     +30.4%  9.968e+09        perf-stat.ps.branch-instructions
  68015058 ± 44%     +33.9%   91056449        perf-stat.ps.branch-misses
  80259095 ± 44%     +45.7%  1.169e+08        perf-stat.ps.cache-misses
 2.511e+08 ± 44%     +39.7%  3.508e+08 ±  2%  perf-stat.ps.cache-references
    774384 ± 44%     +49.7%    1159387        perf-stat.ps.context-switches
      3990 ± 44%     +28.0%       5108 ±  2%  perf-stat.ps.cpu-migrations
 3.664e+10 ± 44%     +30.2%  4.769e+10        perf-stat.ps.instructions
 2.254e+12 ± 44%     +29.8%  2.927e+12        perf-stat.total.instructions
      9.97            -2.6        7.33 ±  6%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.clock_was_set.timekeeping_inject_offset.do_adjtimex.__do_sys_clock_adjtime
     19.01            -2.4       16.63 ±  5%  perf-profile.calltrace.cycles-pp.timekeeping_inject_offset.do_adjtimex.__do_sys_clock_adjtime.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.57            -2.1       18.47 ±  4%  perf-profile.calltrace.cycles-pp.do_adjtimex.__do_sys_clock_adjtime.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_adjtime
     20.76            -2.0       18.73 ±  4%  perf-profile.calltrace.cycles-pp.__do_sys_clock_adjtime.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_adjtime
     20.85            -2.0       18.84 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_adjtime
     20.95            -2.0       18.96 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_adjtime
     17.28            -2.0       15.33 ±  5%  perf-profile.calltrace.cycles-pp.clock_was_set.timekeeping_inject_offset.do_adjtimex.__do_sys_clock_adjtime.do_syscall_64
     21.17            -1.9       19.26 ±  4%  perf-profile.calltrace.cycles-pp.clock_adjtime
      3.35            -0.8        2.54 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_gettime.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.32            -0.7        0.64 ±  5%  perf-profile.calltrace.cycles-pp.inode_set_ctime_current.simple_recursive_removal.debugfs_remove.ptp_release.posix_clock_release
      1.32            -0.7        0.63 ±  6%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_set_ctime_current.simple_recursive_removal.debugfs_remove.ptp_release
      2.26 ±  2%      -0.7        1.58 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.clock_was_set.timekeeping_inject_offset.do_adjtimex
      3.81            -0.7        3.14 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.87            -0.6        3.24 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      1.44            -0.5        0.98 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_idle_enter.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      4.75            -0.3        4.40 ±  3%  perf-profile.calltrace.cycles-pp.syscall
      0.95            -0.3        0.61 ±  4%  perf-profile.calltrace.cycles-pp.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.79            -0.3        0.47 ± 44%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_gettime
      0.76            -0.3        0.44 ± 44%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_gettime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_gettime
      1.02            -0.3        0.71 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      1.04            -0.3        0.73 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      1.04            -0.3        0.74 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_settime
      1.11            -0.3        0.83 ±  2%  perf-profile.calltrace.cycles-pp.timer_settime
      0.79            -0.2        0.56 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_gettime
      0.68            -0.2        0.46 ± 44%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.tick_nohz_idle_enter.do_idle.cpu_startup_entry.start_secondary
      0.88            -0.2        0.67 ±  3%  perf-profile.calltrace.cycles-pp.timer_gettime
      1.36            -0.1        1.26 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      0.76            -0.1        0.67        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.78            -0.1        0.70        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.56 ±  2%      -0.0        0.52 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      0.68            -0.0        0.64 ±  3%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep_timens.__x64_sys_clock_nanosleep.do_syscall_64
      0.70            -0.0        0.67 ±  3%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep_timens.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.71            -0.0        0.68 ±  3%  perf-profile.calltrace.cycles-pp.common_nsleep_timens.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.73            +0.2        0.91 ±  3%  perf-profile.calltrace.cycles-pp.add_device_randomness.do_adjtimex.__do_sys_clock_adjtime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66 ±  5%      +0.2        0.86 ±  2%  perf-profile.calltrace.cycles-pp.do_timer_create.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.70 ±  5%      +0.2        0.91 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_create.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      0.73 ±  5%      +0.2        0.94 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_create
      0.72 ±  4%      +0.2        0.94 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_create
      1.64 ±  2%      +0.2        1.87 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.82 ±  4%      +0.3        1.07 ±  2%  perf-profile.calltrace.cycles-pp.timer_create
      0.98            +0.3        1.31 ±  2%  perf-profile.calltrace.cycles-pp.igb_rd32.igb_ptp_gettimex_82580.pc_clock_gettime.__x64_sys_clock_gettime.do_syscall_64
      0.80            +0.4        1.17 ±  5%  perf-profile.calltrace.cycles-pp.mntput_no_expire.simple_recursive_removal.debugfs_remove.ptp_release.posix_clock_release
      3.76            +0.4        4.16 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.77            +0.4        4.18 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      3.90            +0.4        4.34 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      3.37            +0.5        3.83        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.09 ±223%      +0.5        0.60 ±  3%  perf-profile.calltrace.cycles-pp.timer_delete
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.timekeeping_update_staged.timekeeping_inject_offset.do_adjtimex.__do_sys_clock_adjtime.do_syscall_64
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.simple_recursive_removal.debugfs_remove.ptp_release
      0.00            +0.6        0.59 ±  4%  perf-profile.calltrace.cycles-pp.mntput_no_expire.ptp_release.posix_clock_release.__fput.__x64_sys_close
      0.00            +0.6        0.62 ±  2%  perf-profile.calltrace.cycles-pp.clear_bhb_loop.syscall
      2.72            +0.7        3.38        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.41            +0.7        2.12 ±  4%  perf-profile.calltrace.cycles-pp.igb_ptp_gettimex_82580.pc_clock_gettime.__x64_sys_clock_gettime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.72 ±  9%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.igb_ptp_gettimex_82580.pc_clock_gettime.__x64_sys_clock_gettime
      1.49            +0.8        2.24 ±  4%  perf-profile.calltrace.cycles-pp.pc_clock_gettime.__x64_sys_clock_gettime.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_gettime
      1.51            +0.8        2.27 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_gettime
      1.51            +0.8        2.26 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_gettime.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_gettime
      1.52            +0.8        2.27 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_gettime
      1.54            +0.8        2.31 ±  4%  perf-profile.calltrace.cycles-pp.clock_gettime
      0.00            +0.8        0.77 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.igb_ptp_gettimex_82580.pc_clock_gettime.__x64_sys_clock_gettime.do_syscall_64
     10.94            -3.1        7.84 ±  6%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
     19.02            -2.4       16.64 ±  5%  perf-profile.children.cycles-pp.timekeeping_inject_offset
     20.57            -2.1       18.47 ±  4%  perf-profile.children.cycles-pp.do_adjtimex
     20.78            -2.0       18.74 ±  4%  perf-profile.children.cycles-pp.__do_sys_clock_adjtime
     17.36            -1.9       15.44 ±  5%  perf-profile.children.cycles-pp.clock_was_set
     21.22            -1.9       19.32 ±  4%  perf-profile.children.cycles-pp.clock_adjtime
      4.11            -1.7        2.43 ±  5%  perf-profile.children.cycles-pp.ktime_get
      2.69            -1.4        1.33 ±  5%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      2.17            -1.1        1.08 ±  5%  perf-profile.children.cycles-pp.inode_set_ctime_current
     90.83            -0.8       90.00        perf-profile.children.cycles-pp.do_syscall_64
     91.03            -0.8       90.26        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.48            -0.6        2.86 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.49            -0.4        1.04 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      2.37            -0.4        1.93 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.42            -0.4        2.00 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.85            -0.4        0.44 ±  5%  perf-profile.children.cycles-pp.simple_inode_init_ts
      0.86            -0.4        0.45 ±  3%  perf-profile.children.cycles-pp.tick_irq_enter
      0.87 ±  2%      -0.4        0.47 ±  3%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.80            -0.4        0.44 ±  4%  perf-profile.children.cycles-pp.common_hrtimer_arm
      0.76            -0.4        0.41 ±  5%  perf-profile.children.cycles-pp.ktime_get_real_ts64
      0.84            -0.4        0.48 ±  5%  perf-profile.children.cycles-pp.common_timer_set
      0.67            -0.3        0.34 ±  5%  perf-profile.children.cycles-pp.posix_get_realtime_timespec
      0.95            -0.3        0.62 ±  3%  perf-profile.children.cycles-pp.do_timer_settime
      1.02            -0.3        0.71 ±  3%  perf-profile.children.cycles-pp.__x64_sys_timer_settime
      4.94            -0.3        4.66 ±  3%  perf-profile.children.cycles-pp.syscall
      0.63            -0.3        0.35 ±  6%  perf-profile.children.cycles-pp.common_timer_get
      1.12            -0.3        0.85 ±  2%  perf-profile.children.cycles-pp.timer_settime
      0.71            -0.3        0.45 ±  5%  perf-profile.children.cycles-pp.do_timer_gettime
      0.52            -0.3        0.27 ±  6%  perf-profile.children.cycles-pp.posix_get_realtime_coarse
      0.76            -0.2        0.52 ±  5%  perf-profile.children.cycles-pp.__x64_sys_timer_gettime
      4.28            -0.2        4.06 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.06            -0.2        0.84 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      0.89            -0.2        0.69 ±  4%  perf-profile.children.cycles-pp.timer_gettime
      0.59            -0.2        0.40 ±  2%  perf-profile.children.cycles-pp.timekeeping_update
      0.88            -0.2        0.70 ±  5%  perf-profile.children.cycles-pp.ktime_get_with_offset
      0.89            -0.2        0.73 ±  4%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.59 ±  3%      -0.2        0.44 ±  3%  perf-profile.children.cycles-pp.finish_task_switch
      0.56            -0.1        0.44 ±  5%  perf-profile.children.cycles-pp.posix_get_tai_timespec
      0.42            -0.1        0.31 ±  4%  perf-profile.children.cycles-pp.ktime_get_ts64
      0.44            -0.1        0.33 ±  4%  perf-profile.children.cycles-pp.posix_get_monotonic_timespec
      0.80            -0.1        0.72        perf-profile.children.cycles-pp.schedule_idle
      0.39            -0.1        0.30 ±  5%  perf-profile.children.cycles-pp.ktime_get_raw_ts64
      0.40            -0.1        0.32 ±  5%  perf-profile.children.cycles-pp.posix_get_monotonic_raw
      0.20 ±  2%      -0.1        0.13 ±  2%  perf-profile.children.cycles-pp.update_vsyscall
      0.35 ±  8%      -0.1        0.27 ±  9%  perf-profile.children.cycles-pp.poll_idle
      0.72            -0.0        0.68 ±  2%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.34            -0.0        0.30 ±  5%  perf-profile.children.cycles-pp.posix_get_boottime_timespec
      0.71            -0.0        0.68 ±  3%  perf-profile.children.cycles-pp.common_nsleep_timens
      0.16 ±  2%      -0.0        0.14 ±  6%  perf-profile.children.cycles-pp.retrigger_next_event
      0.12 ±  4%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.timekeeping_forward_now
      0.10 ±  3%      -0.0        0.08 ±  7%  perf-profile.children.cycles-pp.ktime_mono_to_any
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__d_add
      0.05            +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__do_adjtimex
      0.07 ±  5%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.05 ±  8%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.hrtimer_active
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.resched_curr
      0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.05 ±  7%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.09 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.task_rq_lock
      0.05            +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.__srcu_read_lock
      0.06 ±  7%      +0.0        0.08        perf-profile.children.cycles-pp.__switch_to_asm
      0.06 ±  7%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.apparmor_capable
      0.06 ±  7%      +0.0        0.08        perf-profile.children.cycles-pp.set_next_entity
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.kobject_get
      0.06 ±  8%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.dentry_unlink_inode
      0.06 ±  8%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.generic_permission
      0.06 ±  7%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.thread_group_cputime
      0.07            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.wakeup_preempt
      0.05 ±  8%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__x64_sys_clock_settime
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.do_dec_rlimit_put_ucounts
      0.08 ±  4%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.select_task_rq
      0.07 ±  5%      +0.0        0.09        perf-profile.children.cycles-pp.update_rq_clock_task
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.d_instantiate
      0.05            +0.0        0.07 ±  8%  perf-profile.children.cycles-pp.__legitimize_path
      0.05            +0.0        0.07        perf-profile.children.cycles-pp.simple_lookup
      0.05            +0.0        0.07 ±  8%  perf-profile.children.cycles-pp.try_to_unlazy
      0.04 ± 44%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.get_itimerspec64
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.07            +0.0        0.09        perf-profile.children.cycles-pp.posix_cpu_timer_set
      0.06            +0.0        0.08        perf-profile.children.cycles-pp.terminate_walk
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.08 ±  6%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.security_capable
      0.06 ±  6%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.07 ±  5%      +0.0        0.09        perf-profile.children.cycles-pp.___perf_sw_event
      0.08            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.08 ±  6%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.capable
      0.07            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.cpu_clock_sample_group
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.04 ± 44%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.05            +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.up_read
      0.08 ±  4%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.menu_select
      0.05            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.complete_walk
      0.06 ±  6%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.security_file_alloc
      0.08            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.sigqueue_free
      0.09 ±  4%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.07 ±  7%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.init_file
      0.09            +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.sprintf
      0.09            +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.vsnprintf
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.wake_q_add
      0.08 ±  4%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.do_sys_poll
      0.06 ±  8%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.get_clock_desc
      0.10            +0.0        0.13        perf-profile.children.cycles-pp.update_rq_clock
      0.10 ±  4%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.__d_alloc
      0.09 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__x64_sys_poll
      0.11 ±  3%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      0.10 ±  4%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.sched_clock
      0.11 ±  3%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      0.08 ±  4%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.10 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.native_sched_clock
      0.10 ±  3%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.07 ±  8%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.kobject_put
      0.10 ±  8%      +0.0        0.13 ±  9%  perf-profile.children.cycles-pp.inode_permission
      0.10 ±  8%      +0.0        0.13 ± 11%  perf-profile.children.cycles-pp.rwsem_mark_wake
      0.10            +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.d_invalidate
      0.12 ±  3%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.08 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.__switch_to
      0.10 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__lock_timer
      0.32 ±  6%      +0.0        0.35 ±  2%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.02 ± 99%      +0.0        0.06        perf-profile.children.cycles-pp.get_timespec64
      0.12 ±  4%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.__kmalloc_cache_noprof
      0.10 ±  4%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
      0.12            +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.memset_orig
      0.11 ±  4%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  3%      +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.__call_rcu_common
      0.08 ±  4%      +0.0        0.12 ± 26%  perf-profile.children.cycles-pp.osq_unlock
      0.09 ±  5%      +0.0        0.13 ±  5%  perf-profile.children.cycles-pp.inode_init_always
      0.10 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.alloc_empty_file
      0.15 ±  2%      +0.0        0.19        perf-profile.children.cycles-pp.timer_getoverrun
      0.14 ±  2%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.24            +0.0        0.28 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
      0.05            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.alloc_cpumask_var_node
      0.02 ±141%      +0.0        0.06        perf-profile.children.cycles-pp.clock_settime
      0.12 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.12 ±  4%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.__slab_free
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.do_poll
      0.12 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.mod_objcg_state
      0.08 ±  4%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.14 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.14 ±  2%      +0.0        0.19        perf-profile.children.cycles-pp.stress_clock
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.08 ±  4%      +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.down_read
      0.15 ±  4%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.destroy_inode
      0.10 ±  3%      +0.1        0.15 ±  5%  perf-profile.children.cycles-pp.lockref_get
      0.15 ±  5%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.__destroy_inode
      0.14 ±  2%      +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.__poll
      0.22            +0.1        0.27 ±  3%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.___slab_alloc
      0.01 ±223%      +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.15 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.__sigqueue_alloc
      0.20 ±  2%      +0.1        0.25        perf-profile.children.cycles-pp.cpu_clock_sample
      0.17 ±  2%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.d_alloc
      0.23 ±  2%      +0.1        0.28 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.05            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.__traverse_mounts
      0.15 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.security_inode_alloc
      0.22            +0.1        0.27 ±  3%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.llist_reverse_order
      0.14 ±  3%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.lockref_put_return
      0.10 ±  3%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__kmalloc_node_noprof
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.pc_clock_getres
      0.25            +0.1        0.31 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
      0.24            +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.17 ±  2%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.19 ±  2%      +0.1        0.25 ±  4%  perf-profile.children.cycles-pp.__x64_sys_clock_getres
      0.21 ±  3%      +0.1        0.28        perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.14 ±  3%      +0.1        0.21 ±  3%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.48            +0.1        0.55 ±  2%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.41            +0.1        0.48 ±  2%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.18 ±  2%      +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.evict
      0.23            +0.1        0.30        perf-profile.children.cycles-pp.posix_cpu_clock_get
      0.24            +0.1        0.31        perf-profile.children.cycles-pp.task_sched_runtime
      0.08 ±  6%      +0.1        0.15 ±  8%  perf-profile.children.cycles-pp.step_into
      0.27            +0.1        0.34        perf-profile.children.cycles-pp.dequeue_task_fair
      0.28 ±  8%      +0.1        0.35 ±  4%  perf-profile.children.cycles-pp.posix_timer_unhash_and_free
      0.22 ±  2%      +0.1        0.30        perf-profile.children.cycles-pp.put_timespec64
      0.23 ±  2%      +0.1        0.30 ±  2%  perf-profile.children.cycles-pp._find_next_bit
      0.16 ±  4%      +0.1        0.24 ±  4%  perf-profile.children.cycles-pp.kthread
      0.16 ±  4%      +0.1        0.24 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
      0.23 ±  3%      +0.1        0.31 ±  3%  perf-profile.children.cycles-pp._copy_from_user
      0.16 ±  4%      +0.1        0.24 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.18 ±  2%      +0.1        0.26 ±  5%  perf-profile.children.cycles-pp.alloc_inode
      0.40 ±  3%      +0.1        0.48        perf-profile.children.cycles-pp.__irq_exit_rcu
      0.30 ±  2%      +0.1        0.38        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.74            +0.1        0.82 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.59            +0.1        1.67        perf-profile.children.cycles-pp.__schedule
      0.25 ±  2%      +0.1        0.33        perf-profile.children.cycles-pp.d_alloc_parallel
      0.32            +0.1        0.40 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.23 ±  3%      +0.1        0.32 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.30            +0.1        0.39 ±  3%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.23 ±  2%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.1        0.09 ±  8%  perf-profile.children.cycles-pp.lookup_mnt
      0.27            +0.1        0.36 ±  2%  perf-profile.children.cycles-pp._copy_to_user
      0.12 ±  3%      +0.1        0.21 ±  7%  perf-profile.children.cycles-pp.link_path_walk
      0.29            +0.1        0.38 ±  3%  perf-profile.children.cycles-pp.blake2s_compress
      0.30            +0.1        0.40 ±  2%  perf-profile.children.cycles-pp.__lookup_slow
      0.38 ±  6%      +0.1        0.48 ±  3%  perf-profile.children.cycles-pp.__x64_sys_timer_delete
      0.28 ±  2%      +0.1        0.38 ±  2%  perf-profile.children.cycles-pp.wake_up_q
      1.30 ±  2%      +0.1        1.41 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.34            +0.1        0.45 ±  2%  perf-profile.children.cycles-pp.blake2s_update
      0.26 ±  2%      +0.1        0.37 ±  3%  perf-profile.children.cycles-pp.new_inode
      0.35            +0.1        0.46        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.19 ±  3%      +0.1        0.31 ±  8%  perf-profile.children.cycles-pp.simple_release_fs
      0.31 ±  2%      +0.1        0.44        perf-profile.children.cycles-pp.rcu_do_batch
      0.35            +0.1        0.47        perf-profile.children.cycles-pp.kmem_cache_free
      0.46 ±  2%      +0.1        0.59        perf-profile.children.cycles-pp.handle_softirqs
      0.34 ±  2%      +0.1        0.47        perf-profile.children.cycles-pp.rcu_core
      0.49 ±  5%      +0.1        0.62 ±  3%  perf-profile.children.cycles-pp.timer_delete
      0.42 ±  2%      +0.1        0.56        perf-profile.children.cycles-pp.lookup_one_len
      0.47            +0.1        0.61 ±  2%  perf-profile.children.cycles-pp.read_tsc
      0.22 ±  2%      +0.1        0.36 ±  5%  perf-profile.children.cycles-pp.path_init
      0.45 ±  2%      +0.2        0.60 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.24            +0.2        0.41 ±  5%  perf-profile.children.cycles-pp.simple_pin_fs
      0.45            +0.2        0.62 ±  2%  perf-profile.children.cycles-pp.rwsem_wake
      0.56            +0.2        0.74 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
      0.82 ±  3%      +0.2        1.00        perf-profile.children.cycles-pp.schedule
      0.73            +0.2        0.91 ±  3%  perf-profile.children.cycles-pp.add_device_randomness
      0.56            +0.2        0.76        perf-profile.children.cycles-pp.__dentry_kill
      0.66 ±  5%      +0.2        0.86 ±  2%  perf-profile.children.cycles-pp.do_timer_create
      0.63            +0.2        0.83 ±  2%  perf-profile.children.cycles-pp.mnt_get_count
      0.71 ±  5%      +0.2        0.92 ±  2%  perf-profile.children.cycles-pp.__x64_sys_timer_create
      0.56 ±  2%      +0.2        0.77        perf-profile.children.cycles-pp.up_write
      0.84 ±  4%      +0.3        1.09 ±  2%  perf-profile.children.cycles-pp.timer_create
      0.72            +0.3        0.99 ±  2%  perf-profile.children.cycles-pp.dput
      0.86            +0.3        1.14        perf-profile.children.cycles-pp.clear_bhb_loop
      0.98            +0.3        1.31 ±  2%  perf-profile.children.cycles-pp.igb_rd32
      3.83 ±  2%      +0.4        4.23 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
      3.84 ±  2%      +0.4        4.24 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
      3.96 ±  2%      +0.4        4.41 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
      3.42            +0.5        3.88        perf-profile.children.cycles-pp.acpi_safe_halt
      3.43            +0.5        3.89        perf-profile.children.cycles-pp.acpi_idle_enter
      0.00            +0.5        0.54 ±  2%  perf-profile.children.cycles-pp.timekeeping_update_staged
      1.20            +0.6        1.76 ±  4%  perf-profile.children.cycles-pp.mntput_no_expire
      1.41            +0.7        2.13 ±  4%  perf-profile.children.cycles-pp.igb_ptp_gettimex_82580
      1.49            +0.8        2.24 ±  4%  perf-profile.children.cycles-pp.pc_clock_gettime
      1.54            +0.8        2.31 ±  4%  perf-profile.children.cycles-pp.clock_gettime
      1.83 ±  3%      +0.9        2.68 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock
     10.61            -3.2        7.42 ±  6%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      4.03            -1.7        2.33 ±  5%  perf-profile.self.cycles-pp.ktime_get
      2.66            -1.4        1.31 ±  5%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.74            -0.4        0.38 ±  5%  perf-profile.self.cycles-pp.ktime_get_real_ts64
      0.85            -0.2        0.68 ±  6%  perf-profile.self.cycles-pp.ktime_get_with_offset
      0.41            -0.1        0.29 ±  6%  perf-profile.self.cycles-pp.ktime_get_ts64
      0.16 ±  3%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.timekeeping_inject_offset
      0.38            -0.1        0.29 ±  5%  perf-profile.self.cycles-pp.ktime_get_raw_ts64
      0.20 ±  2%      -0.1        0.13 ±  2%  perf-profile.self.cycles-pp.update_vsyscall
      0.11            -0.1        0.06        perf-profile.self.cycles-pp.timekeeping_update
      0.11 ±  4%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.timekeeping_forward_now
      0.10            -0.0        0.08 ±  7%  perf-profile.self.cycles-pp.ktime_mono_to_any
      0.05            +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.finish_task_switch
      0.05            +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.update_cfs_group
      0.06            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.resched_curr
      0.08 ±  4%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.update_load_avg
      0.06 ±  8%      +0.0        0.07        perf-profile.self.cycles-pp.___perf_sw_event
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.__srcu_read_lock
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.do_dec_rlimit_put_ucounts
      0.05 ±  7%      +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.05            +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.hrtimer_active
      0.05            +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.menu_select
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.update_curr
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.__lock_timer
      0.06 ±  6%      +0.0        0.08        perf-profile.self.cycles-pp.__update_load_avg_se
      0.05 ±  8%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.do_adjtimex
      0.06 ±  8%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.kobject_get
      0.06            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.apparmor_capable
      0.06 ±  9%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.__call_rcu_common
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.__switch_to_asm
      0.08 ±  6%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.04 ± 44%      +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.05 ±  8%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.05            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.generic_permission
      0.05            +0.0        0.07 ±  9%  perf-profile.self.cycles-pp.up_read
      0.06            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__x64_sys_clock_gettime
      0.07 ±  5%      +0.0        0.09        perf-profile.self.cycles-pp.clock_adjtime
      0.10 ±  3%      +0.0        0.12 ±  5%  perf-profile.self.cycles-pp.x64_sys_call
      0.09 ±  5%      +0.0        0.11 ±  5%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.08            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08 ±  6%      +0.0        0.10        perf-profile.self.cycles-pp.kmem_cache_free
      0.09 ±  5%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__do_sys_clock_adjtime
      0.09 ±  5%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.11 ±  3%      +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.08 ±  4%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.try_to_wake_up
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.wake_q_add
      0.11            +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__schedule
      0.08            +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.d_alloc_parallel
      0.04 ± 45%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.poll_idle
      0.09 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.08            +0.0        0.11        perf-profile.self.cycles-pp.__switch_to
      0.09 ±  4%      +0.0        0.12        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.10 ±  3%      +0.0        0.13        perf-profile.self.cycles-pp.native_sched_clock
      0.07 ±  5%      +0.0        0.10        perf-profile.self.cycles-pp.kobject_put
      0.02 ± 99%      +0.0        0.06        perf-profile.self.cycles-pp.__do_adjtimex
      0.02 ± 99%      +0.0        0.06        perf-profile.self.cycles-pp.ptp_open
      0.12 ±  4%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.memset_orig
      0.10 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.mod_objcg_state
      0.11 ±  4%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.10 ±  4%      +0.0        0.14 ±  5%  perf-profile.self.cycles-pp.__destroy_inode
      0.10 ±  5%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.inc_rlimit_get_ucounts
      0.11 ±  3%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.stress_clock
      0.05            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.08            +0.0        0.12 ± 27%  perf-profile.self.cycles-pp.osq_unlock
      0.02 ± 99%      +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.12 ±  4%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.10 ±  9%      +0.0        0.15 ± 10%  perf-profile.self.cycles-pp.up_write
      0.12 ±  4%      +0.0        0.17 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.08 ±  6%      +0.0        0.12 ±  5%  perf-profile.self.cycles-pp.down_read
      0.14 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.11 ±  4%      +0.0        0.16 ±  5%  perf-profile.self.cycles-pp.rwsem_down_write_slowpath
      0.11            +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__slab_free
      0.10 ±  3%      +0.1        0.15 ±  4%  perf-profile.self.cycles-pp.lockref_get
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.do_idle
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.tick_nohz_idle_enter
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.vsnprintf
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.inode_init_always
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.llist_reverse_order
      0.18 ±  2%      +0.1        0.23        perf-profile.self.cycles-pp.do_timer_create
      0.17 ±  4%      +0.1        0.23 ±  3%  perf-profile.self.cycles-pp._find_next_bit
      0.10 ±  3%      +0.1        0.16 ±  6%  perf-profile.self.cycles-pp.mntput_no_expire
      0.13 ±  2%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.lockref_put_return
      0.20 ±  2%      +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.22 ±  3%      +0.1        0.29 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      0.20 ±  2%      +0.1        0.27 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.08 ±  9%  perf-profile.self.cycles-pp.lookup_mnt
      0.24            +0.1        0.32 ±  2%  perf-profile.self.cycles-pp.syscall
      0.27            +0.1        0.36 ±  2%  perf-profile.self.cycles-pp._copy_to_user
      0.29            +0.1        0.38 ±  3%  perf-profile.self.cycles-pp.blake2s_compress
      0.26 ±  3%      +0.1        0.36 ±  9%  perf-profile.self.cycles-pp.down_write
      0.34            +0.1        0.44        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.19            +0.1        0.32 ±  4%  perf-profile.self.cycles-pp.path_init
      0.45            +0.1        0.59 ±  2%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.1        0.14 ±  2%  perf-profile.self.cycles-pp.timekeeping_update_staged
      0.50            +0.2        0.67 ±  2%  perf-profile.self.cycles-pp.mnt_get_count
      1.22            +0.3        1.50 ±  2%  perf-profile.self.cycles-pp.clock_was_set
      0.85            +0.3        1.13        perf-profile.self.cycles-pp.clear_bhb_loop
      0.98            +0.3        1.31 ±  2%  perf-profile.self.cycles-pp.igb_rd32
      0.98            +0.4        1.35 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      1.35            +0.6        1.93        perf-profile.self.cycles-pp.acpi_safe_halt
      3.68            +1.3        4.94 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

