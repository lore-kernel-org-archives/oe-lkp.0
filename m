Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983220E32B
	for <oe-lkp@lists.linux.dev>; Thu, 17 Oct 2024 23:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729208776; cv=fail; b=p9BITRUMCBOhA2pxFLVhIWAre4hXToLUu+ODqcRBBCPJEJ2eTDG9kxofRWLWZNeW0i2CvP7Yd4QJs6OV3ZaYDAaqcUVlqXtR3jHPQmFEHuYa6UDvJJFny6k5yVlBEXq0ndKYkuxZT2gsJxDG6gbDmM4wTcsBEwNI3MxaczBNxBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729208776; c=relaxed/simple;
	bh=YDOyg79JZ0wqkSIQ6ht0KQ2Xs0SbrF9QdmuBkgKHfbw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hqT4cAZTfCxkiOcmdiTLcCLCbunBth/HIZEpL3xhm42xXXSbG76FlBnxAluhuW8a72VIFWOOeFsprZuIlzJFlhpTesI+cN3Ab9Uf8lm+3SGxmqxRGycQEfepCbnT7KLvOTRt7NgNrQTx7TK4UF1JeUjvuarwJMSSFVruf/Ripn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7FfkKW7; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7FfkKW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729208771; x=1760744771;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=YDOyg79JZ0wqkSIQ6ht0KQ2Xs0SbrF9QdmuBkgKHfbw=;
  b=k7FfkKW7J2pHHHDj/WM4DG2G1VGAOyltoGJecjrvj8dqfjAzSxh8DTWp
   bzQ8/SUTFGe5EX+iP08ggEbTJCzYDu3rQ1Ik7GpSUHqQWHGpAG2CzYEIH
   ADdhIhvzmxDoCquf4w1qym8YCb9vHKc4xTgZJtWwd7Ovw0RjCQy5NpUwM
   Bw8c+Wn0YwY6xksM0QmmnAe0dLaqJOkVO+QeFK15ctHSWr4rG0k4oAmhk
   +r8HLq4V2xPZIrgLtQV6EoBErzLOaocsmVEdBXIPlO/5sr7D2Vs1MLta9
   ykQJQVNRfsL6gSplFETyvWbbrypd2zrftstUnzLoIvNvU/VhIdW0i7DLh
   A==;
X-CSE-ConnectionGUID: y2SZHQVFQ3qr8OYMXN5TiQ==
X-CSE-MsgGUID: LSaBKPAVTU686XCB8GZG3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39268306"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39268306"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 16:46:11 -0700
X-CSE-ConnectionGUID: 6K6yemskSd6Qqmqiup14mg==
X-CSE-MsgGUID: Bj437TAAThi6HmvOcYndxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="82664429"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2024 16:46:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:46:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:46:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 16:46:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 16:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgNihwrhMRZU72Ti5vFi1TZqAaavx+GZW16DvetrpwAxE+WZntVpavV+Zb7c2iODCr2ZHs1LPw/IpCjz/l54igq6yub+O4LrycJvSYj9MVVoWifaYmox4M5Qd3I/cYQqd2cdr+J4BCypf5Uyf71mF2C4jMOPJqBzT+E9kEITCInvuo8x8RUIL9ZGWI2NvKTLLxb4wCglaOS9//H5CHM+IOeE3rfflepcAm4Fh3QLGmAAD/YIMxqEANxK+i+hJRJQ1ZDgRm7BRs+8KQjVKVas9RSDWc3HOZKFnd5iMG7KyNv93fS92jrcHZbIUiJ5enss0IkG3ki45SWsMKH7XRJvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqrziw0tG2/X/8+g1Y2w+8x+PmqqHILSOMGysYZQQa4=;
 b=FxB1C99tgvMBpBDp3/CEFWSX5In3ZL7Nspa8YhmmLOryWLuO6aKxQP9uQfl70zfaWUscKpHzOIf7QD7/5lqJ3UNNpcwaRsJ6CGcqPHInE21moyMmL99xeMPEC8NsDCIYf+BOWdQYC8/HecpCdWbqbaDac7Hyekpbj8ltPbaiF0rxNAWV9LO0EeYw2NO/qHhHmG+h7qm0efH66oetMreOSRheOYLEQnsd7sD4vMXkXH7o7BvrOkJTGy03xH4Na0VQrs6bfesuEfAbZX7JJNKp7YCTZYgE67x6umur+m7Hy7nrKVGLpBskh7lymPrMjltBfoqSbWKPMXKAEZIaXyM9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Thu, 17 Oct
 2024 23:46:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 23:46:01 +0000
Date: Fri, 18 Oct 2024 07:45:51 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <wu.zheng@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [tcp]  b7d8ea62f1:  netperf.Throughput_tps
 29.5% improvement
Message-ID: <202410171637.707fa37b-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0031.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: de1a4112-f973-4c23-834a-08dcef05dad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0Z8hqqTRF1FXnwxL7cYrwOKPfz0u8cz1cwomnjbOFkpmfqq4XUAAL/ljjv?=
 =?iso-8859-1?Q?YSnCBydNRowZFoCyV60yHWOrklkLLI5dVwF2CDdL0NP+v4SX/n8+ogJ3DJ?=
 =?iso-8859-1?Q?D2I6mAScRdrfUz5XRLtD+4nKXxTsu/i2G6JwyJbJfQNIwyuauTUZa2OPoH?=
 =?iso-8859-1?Q?vebIr2wIyyjymhaDWfreZ7P0Jfs301lef57i8xqZ/pbmVpa8sjv+ktstZE?=
 =?iso-8859-1?Q?ebEEO/3ZQNWGuLEiHA1eG51FciKZgtMqDS83dxsgU1iq0GG5w5VG2VtGHy?=
 =?iso-8859-1?Q?3gJZ/r3EovRryhHlt0/H7P5mx5diu8VvbYMYZ2udOyMep+oH6JqL7fMaLS?=
 =?iso-8859-1?Q?7EECBtxf7FtCVVb+YvJmaES1bkWx4Ba67qglITi4rlzM5gRsjZ8zRMgzeD?=
 =?iso-8859-1?Q?C2Hn09KEFS+RZz9vsZikr1+pHlJbMZawgTX7sHCNBd6iEXXh1dPv9BI57J?=
 =?iso-8859-1?Q?eq7WNb16uVHVvOYeBNHq5lVfEIfvggsnnTgS6g0nOYyUonta8To5AtKUKp?=
 =?iso-8859-1?Q?Yeeapl59bwQnoceQFbPGaObMvf4socvGgigg8hsBTb4QT5PRdYpDiP84IF?=
 =?iso-8859-1?Q?7QZlD0bh0cfBS+ZucPwNfa6hZZuN7jhO1YRgueG4xlkyCmOHjLxqNh/9vV?=
 =?iso-8859-1?Q?Xec0ujRX64zTmyhXVLfy1z6GF+MywTu2WJMuroSmPvz4VJHroJjx5TEQzs?=
 =?iso-8859-1?Q?8hkyBJi1ctk4J+B0RjV3ReVu07fja9+mWuywwNw4M14Zh3gZVw3Ppqcme9?=
 =?iso-8859-1?Q?cIA/i96Ayj4zWlnOebQjLB4389E4vnau3hopnnhdPQBwRzGXGJ07Tl8qeH?=
 =?iso-8859-1?Q?DHsnPtmzUcWbx2zWZGa5X/VluldoXlASAi7Aog+8kJ5PZjZncI2VTJ2Ppi?=
 =?iso-8859-1?Q?yX6Ie9XxmkRcsFeYmPSdlo3f9XfotN9saeknOYJ+s2GHIjdssmXVRPImTX?=
 =?iso-8859-1?Q?QUytJd7iungJF9Irx3hmwQtHdPNU/DEsQhlOqgJUKxbOTBUQsi/CDGHN9M?=
 =?iso-8859-1?Q?AZNL8BTqKBq+uOmbaaPJVMXN9V7pRGAf1VxW+Tx5PzMMGSN9jm9c/rlYkR?=
 =?iso-8859-1?Q?4ZlhBstgi+0rW1OFibIS8JWTaOJSOKs1AoFEiHuAqE18f10BVdTXt3DJBQ?=
 =?iso-8859-1?Q?XL2+JU9YKv9XqGRXC1PWUVv9lpFfQDcOeNZmnPzb5qrdcG7bqlrhVYisQz?=
 =?iso-8859-1?Q?+4i9o0iZYi7VKn38RX6oRF2xRHKU4blIzzDzi6LD6liEfqd/wy59fzcnUn?=
 =?iso-8859-1?Q?vGcSpo3MYqycjgrn+zS21h405RcdT7bmBWrauRH3ROQ7WksFQi5H25FD0O?=
 =?iso-8859-1?Q?DpqY2kpQszR7fG0h+ae+OoOp4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TpO31aM8NCz8ApVpKknFYkLaQ+KAVXE+wgXFFR9YmHccsdzP6V2Fq/gN6n?=
 =?iso-8859-1?Q?dIqQI/YxCKsqbsCv1EtIdE3Pqy3WZ744lDzVmAzkTdZwIk6dPvvuPsiMSv?=
 =?iso-8859-1?Q?do5oIvUfc66UWeAI1n4HU5UFK5ZaYbNxjeLtlS/QyM380+REEpA/g2dWjC?=
 =?iso-8859-1?Q?Nt5Jgr2IFoliu//A7bbvCGJmRg4XpBwuqA/IcTcEBxtdaGgoFOb2E8fZtD?=
 =?iso-8859-1?Q?UEqISHN/dJp7TAiOQJ6QTjsPTihGgw8LVzkSxhncKCImMqDy9BviiAyCGZ?=
 =?iso-8859-1?Q?mLiU/9ifW3TqgZRSJAX1/DcOKHif/nncLaY0gS0JBWE3rk9oC6GOihX91U?=
 =?iso-8859-1?Q?qv/tENQt6/FpVx9aMa7LAvijZZxVGuCfGg8zr2ygX/Ov7dTsqHu9kugvay?=
 =?iso-8859-1?Q?Dba4Pl4IauxryV198BwjCXJnnPtjAcV+QjN8KEZMEqJYMjXPQDfFzrSMfM?=
 =?iso-8859-1?Q?quoSNGS+oiquWetvDGJ1aypX2S/vad2ipdpN58UhadZ5UOPR0IbYs3CrAi?=
 =?iso-8859-1?Q?/IcdD0y13WSYj7pc9oA9enyRf92bK6MezjNiZAFe98JZs4rkSNqtQDhn1y?=
 =?iso-8859-1?Q?yBABIGWDIeavtRLRKUoygAJ94CgPXVZAiKZHpwVZBu+yBuP/6y8tDDDc2H?=
 =?iso-8859-1?Q?hayG7Jra4/ClHzeLpIOIHb82MbvTmWgz+xh6Pody921adrxlAuYh/eqCSQ?=
 =?iso-8859-1?Q?uozyGb/ZbG10zvok7cjR1+At7HjvJD/LefWnQrX0DBUqzoHWTldoqso1pw?=
 =?iso-8859-1?Q?Y6PW//hLx6TXGnbtx2f0u2SNkS+yhQv3FrzJUY6pxuEhniVbVW1ZzbaKmG?=
 =?iso-8859-1?Q?Eh6FeM27kTmISRIOwHBGuzohinqOGPXmSwKATrUGpyNFI24iKz7RMMNnzB?=
 =?iso-8859-1?Q?6eAATmqNFz1BzIuH4CvXsVjWcBIB7qIRsl/egogx/2P1yKrhXFP8ES3srx?=
 =?iso-8859-1?Q?Y9k9FmSZiOvRlNgzSvmvoUMbC+GGgYYL7XQFlosRcheHZif8OWusDWi+QL?=
 =?iso-8859-1?Q?b06gCRp2gFf6gN+r+6sxM9sZzrnI5q3c7hVzewVGdoMMx7SnQIUBeaCCBV?=
 =?iso-8859-1?Q?th9xQ86QDLyWrVAqx4A5unEdARPTYk2P1AziDSyPFQ+yP47Ml+yS/yGEHc?=
 =?iso-8859-1?Q?1cX2HX3c6aO2rsCnMmaexRpN2jnzBPGhFEqGnvNFjM/vHAUONyTtS3BfRe?=
 =?iso-8859-1?Q?AH/7/xI1MrauR6I1lPlQhmp61XrWA8lk2Y+q/xTDrPREnF/Gc0e2K9bcX+?=
 =?iso-8859-1?Q?WWjaUPvAucSUK/oxG/zEKEAkDr6uNR90+fgfohnrkEv53sDgONkuukQed9?=
 =?iso-8859-1?Q?olvZK1a392w0CN7u+5nnYa1FPxY8a9+zTCE0Ujh2x2NHbvwdQJoEwL1tqA?=
 =?iso-8859-1?Q?8kD/2OcvdvM9I6JAGCsfl1tIp/iva+D0ZFecBuhS6rpjIOW8ObsNTamwEB?=
 =?iso-8859-1?Q?vS+ukS1LvG171Bi1vkkiFGsnckCBcG6P9l4UC5M5HwUoDsQMgvlBgAaA0R?=
 =?iso-8859-1?Q?LOlr87vLIStvh01btbPMe7yDm1/faO3lt1P8eajfSqJp2+bR2EoZ/At5jo?=
 =?iso-8859-1?Q?GT7eTgHlhQH2CYzZzJAsSlWc/Q7PPl8dx1qfRFDRp4NO/WCpPxO3Qff2qF?=
 =?iso-8859-1?Q?mq+z+h5P67W895JnD5S4l7rAY9lCV4xXFKxLpPkvsT8C41/10i/iFL8g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de1a4112-f973-4c23-834a-08dcef05dad1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:46:01.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D54AbNU820+AiEp2nnB/VbL1Ogm6tfRgIQw4KTnGjHK8yKxpSFQfNkrnATAD3evOv9YUUDzzJVPnS2+wXbbLzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 29.5% improvement of netperf.Throughput_tps on:


commit: b7d8ea62f1f89469fc274b951485254c66cabf91 ("Revert "tcp: avoid the lookup process failing to get sk in ehash table"")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	test: TCP_CRR
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241017/202410171637.707fa37b-oliver.sang@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/50%/debian-12-x86_64-20240206.cgz/300s/lkp-gnr-1ap1/TCP_CRR/netperf

commit: 
  99b74dee7f ("net:ipv6: check return value of pskb_trim()")
  b7d8ea62f1 ("Revert "tcp: avoid the lookup process failing to get sk in ehash table"")

99b74dee7f685043 b7d8ea62f1f89469fc274b95148 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 2.317e+10           +44.8%  3.356e+10 ±  6%  cpuidle..time
     85512           +12.6%      96312 ±  2%  uptime.idle
     32.85           +43.2%      47.06 ±  6%  vmstat.cpu.id
    160.78           -20.6%     127.71 ±  5%  vmstat.procs.r
    308473           -12.3%     270420 ±  2%  vmstat.system.in
     32.39           +14.4       46.76 ±  6%  mpstat.cpu.all.idle%
     22.79            -4.9       17.86 ±  5%  mpstat.cpu.all.soft%
     43.56            -9.3       34.24 ±  5%  mpstat.cpu.all.sys%
      1.26            -0.1        1.14        mpstat.cpu.all.usr%
    171.83 ±  3%     -97.7%       4.00        mpstat.max_utilization.seconds
   1778341           -25.6%    1322831 ±  6%  netperf.ThroughputBoth_total_tps
     14840           +29.5%      19216 ±  4%  netperf.ThroughputBoth_tps
   1778341           -25.6%    1322831 ±  6%  netperf.Throughput_total_tps
     14840           +29.5%      19216 ±  4%  netperf.Throughput_tps
   4993190           -25.0%    3742653 ±  6%  netperf.time.involuntary_context_switches
      9876           -17.7%       8130 ±  4%  netperf.time.percent_of_cpu_this_job_got
     29714           -17.8%      24424 ±  4%  netperf.time.system_time
    420.47            -9.2%     381.94 ±  2%  netperf.time.user_time
 5.335e+08           -25.6%  3.968e+08 ±  6%  netperf.workload
    693551           -14.2%     594881 ±  4%  meminfo.Active
    693551           -14.2%     594881 ±  4%  meminfo.Active(anon)
  14996403            -7.7%   13843490 ±  3%  meminfo.Cached
  12522463 ±  2%      -9.3%   11361478 ±  4%  meminfo.Committed_AS
  11640235 ±  2%      -9.1%   10583647 ±  5%  meminfo.Inactive
  11640235 ±  2%      -9.1%   10583647 ±  5%  meminfo.Inactive(anon)
    356066 ±  5%     -12.5%     311536        meminfo.KReclaimable
    356066 ±  5%     -12.5%     311536        meminfo.SReclaimable
  11475068 ±  2%     -10.0%   10322153 ±  5%  meminfo.Shmem
  20447709            -7.5%   18904611 ±  2%  meminfo.max_used_kB
    173377           -14.2%     148694 ±  4%  proc-vmstat.nr_active_anon
   3749096            -7.7%    3460724 ±  3%  proc-vmstat.nr_file_pages
   2910076 ±  2%      -9.1%    2645799 ±  5%  proc-vmstat.nr_inactive_anon
     36748            -1.3%      36281        proc-vmstat.nr_kernel_stack
   1019005            +8.1%    1101631        proc-vmstat.nr_mapped
   2868762 ±  2%     -10.1%    2580390 ±  5%  proc-vmstat.nr_shmem
    173377           -14.2%     148694 ±  4%  proc-vmstat.nr_zone_active_anon
   2910076 ±  2%      -9.1%    2645799 ±  5%  proc-vmstat.nr_zone_inactive_anon
   8730991 ±  6%     -24.8%    6569420 ±  6%  proc-vmstat.numa_hit
   8730991 ±  6%     -24.8%    6569420 ±  6%  proc-vmstat.numa_local
    115646 ± 10%     -39.3%      70212 ±  6%  proc-vmstat.pgactivate
   8745099 ±  6%     -24.7%    6583006 ±  6%  proc-vmstat.pgalloc_normal
   4407219 ± 13%     -39.7%    2657232 ± 11%  proc-vmstat.pgfree
      0.10 ±  8%     -19.6%       0.08 ±  7%  perf-stat.i.MPKI
 4.493e+10            +2.5%  4.606e+10        perf-stat.i.branch-instructions
      0.36            -0.0        0.33        perf-stat.i.branch-miss-rate%
 1.608e+08            -8.4%  1.472e+08        perf-stat.i.branch-misses
      0.93 ±  5%      -0.2        0.69 ± 14%  perf-stat.i.cache-miss-rate%
  11181735 ±  8%     -40.1%    6698898 ±  7%  perf-stat.i.cache-misses
 1.452e+09            -5.1%  1.377e+09        perf-stat.i.cache-references
      2.74           -21.5%       2.15 ±  4%  perf-stat.i.cpi
 5.872e+11           -20.1%  4.689e+11 ±  5%  perf-stat.i.cpu-cycles
     39495 ± 28%     -91.5%       3368 ± 28%  perf-stat.i.cpu-migrations
 2.263e+11            +2.7%  2.325e+11        perf-stat.i.instructions
      0.39           +33.7%       0.52 ±  5%  perf-stat.i.ipc
      0.06 ±  9%     -47.3%       0.03 ±  8%  perf-stat.overall.MPKI
      0.36            -0.0        0.32        perf-stat.overall.branch-miss-rate%
      0.89 ±  9%      -0.4        0.51 ±  8%  perf-stat.overall.cache-miss-rate%
      2.60           -22.3%       2.02 ±  5%  perf-stat.overall.cpi
     45722 ± 11%     +46.6%      67015 ±  9%  perf-stat.overall.cycles-between-cache-misses
      0.39           +29.1%       0.50 ±  4%  perf-stat.overall.ipc
    129830           +38.8%     180179 ±  5%  perf-stat.overall.path-length
 4.478e+10            +2.5%  4.591e+10        perf-stat.ps.branch-instructions
 1.603e+08            -8.4%  1.467e+08        perf-stat.ps.branch-misses
  12964300 ± 10%     -45.8%    7021891 ±  8%  perf-stat.ps.cache-misses
  1.45e+09            -5.3%  1.373e+09        perf-stat.ps.cache-references
 5.859e+11           -20.2%  4.676e+11 ±  5%  perf-stat.ps.cpu-cycles
     40433 ± 28%     -91.6%       3398 ± 28%  perf-stat.ps.cpu-migrations
 2.256e+11            +2.7%  2.318e+11        perf-stat.ps.instructions
      1.67            +2.3%       1.71        perf-stat.ps.major-faults
 6.926e+13            +2.8%  7.124e+13        perf-stat.total.instructions
  16463502 ±  7%     -31.8%   11227307 ± 13%  sched_debug.cfs_rq:/.MIN_vruntime.max
   2273231 ± 17%     -27.8%    1641202 ± 10%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.58 ±  2%     -21.2%       0.45 ±  3%  sched_debug.cfs_rq:/.h_nr_running.avg
    189.90 ± 16%     -86.9%      24.95 ± 10%  sched_debug.cfs_rq:/.load_avg.avg
      4349 ± 68%     -94.1%     255.83 ± 29%  sched_debug.cfs_rq:/.load_avg.max
      8.64 ± 25%     -98.6%       0.12 ±159%  sched_debug.cfs_rq:/.load_avg.min
    335.00 ± 55%     -91.2%      29.64 ± 15%  sched_debug.cfs_rq:/.load_avg.stddev
  16463508 ±  7%     -31.8%   11227307 ± 13%  sched_debug.cfs_rq:/.max_vruntime.max
   2273232 ± 17%     -27.8%    1641202 ± 10%  sched_debug.cfs_rq:/.max_vruntime.stddev
  16215386 ±  7%     -33.1%   10848834 ± 13%  sched_debug.cfs_rq:/.min_vruntime.avg
  17346446 ±  8%     -29.8%   12170319 ± 12%  sched_debug.cfs_rq:/.min_vruntime.max
  14705583 ±  7%     -36.1%    9396726 ± 12%  sched_debug.cfs_rq:/.min_vruntime.min
    226569 ±  9%     +36.4%     309059 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.57 ±  2%     -21.0%       0.45 ±  3%  sched_debug.cfs_rq:/.nr_running.avg
    567.05           -23.6%     433.50 ±  4%  sched_debug.cfs_rq:/.runnable_avg.avg
      1282 ±  7%     -23.3%     983.47 ±  2%  sched_debug.cfs_rq:/.runnable_avg.max
    161.62 ± 59%     -99.9%       0.12 ±106%  sched_debug.cfs_rq:/.runnable_avg.min
    179.73 ±  2%     +40.7%     252.89 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
     37333 ±321%    +733.9%     311324 ± 49%  sched_debug.cfs_rq:/.spread0.avg
    226692 ±  9%     +36.3%     308927 ± 14%  sched_debug.cfs_rq:/.spread0.stddev
    558.55           -23.6%     426.60 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
      1246 ±  5%     -21.2%     981.83 ±  2%  sched_debug.cfs_rq:/.util_avg.max
    131.01 ± 59%     -99.9%       0.12 ±106%  sched_debug.cfs_rq:/.util_avg.min
    179.19 ±  2%     +39.8%     250.57 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
    380.72 ±  3%     -22.9%     293.36 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1017 ±  7%     -11.9%     896.83 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.max
    168736 ±  6%     +30.1%     219587 ± 10%  sched_debug.cpu.avg_idle.avg
    635361 ± 23%     +56.3%     992946 ±  3%  sched_debug.cpu.avg_idle.max
     68088 ± 13%    +195.1%     200926 ± 16%  sched_debug.cpu.avg_idle.stddev
      3380           -22.1%       2632 ±  3%  sched_debug.cpu.curr->pid.avg
      0.00 ±  9%     -21.9%       0.00 ±  4%  sched_debug.cpu.next_balance.stddev
      0.57           -21.7%       0.45 ±  3%  sched_debug.cpu.nr_running.avg
     20.44            -4.8       15.68 ± 13%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close.recv_omni.process_requests
     20.45            -4.8       15.69 ± 13%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.__close.recv_omni.process_requests.spawn_child
     20.51            -4.7       15.76 ± 13%  perf-profile.calltrace.cycles.__close.recv_omni.process_requests.spawn_child.accept_connection
     20.31            -4.7       15.59 ± 13%  perf-profile.calltrace.cycles.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close.recv_omni
     40.96            -4.6       36.37 ±  4%  perf-profile.calltrace.cycles.inet_release.__sock_release.sock_close.__fput.task_work_run
     41.30            -4.6       36.73 ±  4%  perf-profile.calltrace.cycles.sock_close.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
     41.29            -4.6       36.73 ±  4%  perf-profile.calltrace.cycles.__sock_release.sock_close.__fput.task_work_run.exit_to_user_mode_loop
     41.89            -4.5       37.40 ±  4%  perf-profile.calltrace.cycles.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     42.10            -4.4       37.69 ±  4%  perf-profile.calltrace.cycles.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     42.24            -4.4       37.88 ±  4%  perf-profile.calltrace.cycles.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     42.26            -4.4       37.89 ±  4%  perf-profile.calltrace.cycles.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
     28.74            -3.3       25.40 ±  6%  perf-profile.calltrace.cycles.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     32.15            -2.8       29.38 ±  5%  perf-profile.calltrace.cycles.accept_connection.accept_connections.main
     32.15            -2.8       29.38 ±  5%  perf-profile.calltrace.cycles.accept_connections.main
     32.15            -2.8       29.38 ±  5%  perf-profile.calltrace.cycles.process_requests.spawn_child.accept_connection.accept_connections.main
     32.15            -2.8       29.38 ±  5%  perf-profile.calltrace.cycles.spawn_child.accept_connection.accept_connections.main
      9.41            -2.8        6.64 ± 19%  perf-profile.calltrace.cycles.release_sock.tcp_close.inet_release.__sock_release.sock_close
      9.30 ±  2%      -2.6        6.73 ± 16%  perf-profile.calltrace.cycles.__sk_destruct.inet_release.__sock_release.sock_close.__fput
      8.46            -2.5        5.93 ± 19%  perf-profile.calltrace.cycles.__release_sock.release_sock.tcp_close.inet_release.__sock_release
      8.02            -2.5        5.50 ± 20%  perf-profile.calltrace.cycles.tcp_v4_do_rcv.__release_sock.release_sock.tcp_close.inet_release
      8.00            -2.5        5.48 ± 20%  perf-profile.calltrace.cycles.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock.release_sock.tcp_close
      4.84 ±  2%      -2.4        2.40 ± 32%  perf-profile.calltrace.cycles.native_queued_spin_lock_slowpath._raw_spin_lock.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      4.87 ±  3%      -2.4        2.43 ± 32%  perf-profile.calltrace.cycles._raw_spin_lock.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
     31.54            -2.0       29.52 ±  2%  perf-profile.calltrace.cycles.tcp_close.inet_release.__sock_release.sock_close.__fput
      5.78            -1.9        3.84 ± 20%  perf-profile.calltrace.cycles.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock.release_sock
      5.74            -1.9        3.80 ± 20%  perf-profile.calltrace.cycles.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock
      4.27 ±  2%      -1.7        2.56 ± 24%  perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv
      4.16 ±  2%      -1.7        2.47 ± 25%  perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_fin.tcp_data_queue.tcp_rcv_state_process
      4.05 ±  2%      -1.7        2.38 ± 25%  perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_fin.tcp_data_queue
      3.98 ±  2%      -1.7        2.32 ± 25%  perf-profile.calltrace.cycles.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_fin
      6.38            -1.0        5.39 ± 10%  perf-profile.calltrace.cycles.inet_csk_clone_lock.tcp_create_openreq_child.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_rcv
      6.36            -1.0        5.37 ± 10%  perf-profile.calltrace.cycles.sk_clone_lock.inet_csk_clone_lock.tcp_create_openreq_child.tcp_v4_syn_recv_sock.tcp_check_req
      6.48            -1.0        5.51 ±  9%  perf-profile.calltrace.cycles.tcp_create_openreq_child.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_rcv.ip_protocol_deliver_rcu
      7.23            -1.0        6.26 ±  8%  perf-profile.calltrace.cycles.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      7.41            -1.0        6.45 ±  8%  perf-profile.calltrace.cycles.tcp_check_req.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
      7.30            -0.9        6.40 ±  8%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.__socket.omni_create_data_socket.send_omni_inner.send_tcp_conn_rr
      7.28            -0.9        6.38 ±  8%  perf-profile.calltrace.cycles.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket
      7.28            -0.9        6.38 ±  8%  perf-profile.calltrace.cycles.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket.omni_create_data_socket
      7.29            -0.9        6.40 ±  8%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.__socket.omni_create_data_socket.send_omni_inner
      7.34            -0.9        6.46 ±  8%  perf-profile.calltrace.cycles.__socket.omni_create_data_socket.send_omni_inner.send_tcp_conn_rr.main
      6.36            -0.9        5.48 ±  9%  perf-profile.calltrace.cycles.inet_create.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64
      6.04            -0.9        5.17 ± 10%  perf-profile.calltrace.cycles.sk_alloc.inet_create.__sock_create.__sys_socket.__x64_sys_socket
      6.67            -0.9        5.81 ±  8%  perf-profile.calltrace.cycles.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.74 ±  2%      -0.1        0.62 ±  5%  perf-profile.calltrace.cycles.tcp_ack.tcp_rcv_synsent_state_process.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock
      1.39 ±  2%      -0.1        1.30 ±  3%  perf-profile.calltrace.cycles.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      0.96 ±  2%      +0.1        1.01 ±  3%  perf-profile.calltrace.cycles.handle_internal_command.main
      0.96 ±  2%      +0.1        1.01 ±  3%  perf-profile.calltrace.cycles.run_builtin.handle_internal_command.main
      0.59 ±  2%      +0.1        0.65 ±  3%  perf-profile.calltrace.cycles.__schedule.schedule.schedule_timeout.inet_csk_accept.inet_accept
      0.61 ±  2%      +0.1        0.67 ±  3%  perf-profile.calltrace.cycles.schedule.schedule_timeout.inet_csk_accept.inet_accept.do_accept
      3.51            +0.1        3.58        perf-profile.calltrace.cycles.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.send_omni_inner
      0.75            +0.1        0.82 ±  2%  perf-profile.calltrace.cycles.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
      0.78            +0.1        0.85 ±  2%  perf-profile.calltrace.cycles.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      0.55            +0.1        0.64 ±  7%  perf-profile.calltrace.cycles.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.55            +0.1        0.64 ±  7%  perf-profile.calltrace.cycles.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.55            +0.1        0.64 ±  7%  perf-profile.calltrace.cycles.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.76            +0.1        0.86 ±  5%  perf-profile.calltrace.cycles.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_child_process
      0.75            +0.1        0.86 ±  5%  perf-profile.calltrace.cycles.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      0.76 ±  2%      +0.1        0.86 ±  4%  perf-profile.calltrace.cycles.schedule_timeout.inet_csk_accept.inet_accept.do_accept.__sys_accept4_file
      0.51            +0.1        0.62 ±  5%  perf-profile.calltrace.cycles.__inet_bind.__sys_bind.__x64_sys_bind.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.52 ±  2%      +0.1        0.63 ±  4%  perf-profile.calltrace.cycles.tcp_send_fin.__tcp_close.tcp_close.inet_release.__sock_release
      0.56            +0.1        0.68 ±  5%  perf-profile.calltrace.cycles.__sys_bind.__x64_sys_bind.do_syscall_64.entry_SYSCALL_64_after_hwframe.bind
      0.57            +0.1        0.69 ±  5%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.bind.omni_create_data_socket.send_omni_inner
      0.94            +0.1        1.06 ±  3%  perf-profile.calltrace.cycles.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
      0.56            +0.1        0.68 ±  5%  perf-profile.calltrace.cycles.__x64_sys_bind.do_syscall_64.entry_SYSCALL_64_after_hwframe.bind.omni_create_data_socket
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.__cmd_record.cmd_record.cmd_sched.run_builtin.handle_internal_command
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.cmd_record.cmd_sched.run_builtin.handle_internal_command.main
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.cmd_sched.run_builtin.handle_internal_command.main
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.perf_session__process_events.record__finish_output.__cmd_record.cmd_record.cmd_sched
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record.cmd_record
      0.56            +0.1        0.68 ±  4%  perf-profile.calltrace.cycles.record__finish_output.__cmd_record.cmd_record.cmd_sched.run_builtin
      0.57            +0.1        0.70 ±  5%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.bind.omni_create_data_socket.send_omni_inner.send_tcp_conn_rr
      0.98            +0.1        1.10 ±  2%  perf-profile.calltrace.cycles.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      0.59            +0.1        0.72 ±  5%  perf-profile.calltrace.cycles.bind.omni_create_data_socket.send_omni_inner.send_tcp_conn_rr.main
      0.87            +0.1        1.01 ±  5%  perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_child_process.tcp_v4_rcv
      1.01 ±  2%      +0.1        1.15 ±  4%  perf-profile.calltrace.cycles.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.89            +0.1        1.03 ±  5%  perf-profile.calltrace.cycles.__wake_up_common_lock.sock_def_readable.tcp_child_process.tcp_v4_rcv.ip_protocol_deliver_rcu
      1.01            +0.2        1.18 ±  5%  perf-profile.calltrace.cycles.sock_def_readable.tcp_child_process.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      0.72            +0.2        0.90 ±  5%  perf-profile.calltrace.cycles.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue
      1.25            +0.2        1.43 ±  3%  perf-profile.calltrace.cycles.tcp_conn_request.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      4.18            +0.2        4.38        perf-profile.calltrace.cycles.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.86            +0.2        1.07 ±  4%  perf-profile.calltrace.cycles.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      4.18            +0.2        4.39        perf-profile.calltrace.cycles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.86            +0.2        1.08 ±  5%  perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established
      0.88            +0.2        1.10 ±  5%  perf-profile.calltrace.cycles.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      0.89            +0.2        1.12 ±  4%  perf-profile.calltrace.cycles.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.92            +0.2        1.15 ±  5%  perf-profile.calltrace.cycles.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      2.30            +0.3        2.56 ±  2%  perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_connect.tcp_v4_connect
      1.52            +0.3        1.77 ±  3%  perf-profile.calltrace.cycles.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      2.75            +0.3        3.01 ±  2%  perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect
      2.52            +0.3        2.78 ±  2%  perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_connect.tcp_v4_connect.__inet_stream_connect
      5.44            +0.3        5.71 ±  2%  perf-profile.calltrace.cycles.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      2.20            +0.3        2.48 ±  2%  perf-profile.calltrace.cycles.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_connect
      1.56            +0.3        1.84 ±  4%  perf-profile.calltrace.cycles.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      1.17            +0.3        1.47 ±  5%  perf-profile.calltrace.cycles.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      1.86            +0.3        2.17 ±  5%  perf-profile.calltrace.cycles.inet_csk_accept.inet_accept.do_accept.__sys_accept4_file.__sys_accept4
      2.06            +0.4        2.43 ±  3%  perf-profile.calltrace.cycles.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      1.61            +0.4        2.00 ±  4%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.recv_omni.process_requests
      1.61            +0.4        2.00 ±  4%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.recv.recv_omni.process_requests.spawn_child
      1.65            +0.4        2.04 ±  4%  perf-profile.calltrace.cycles.recv.recv_omni.process_requests.spawn_child.accept_connection
      1.58            +0.4        1.98 ±  4%  perf-profile.calltrace.cycles.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.recv_omni
      0.54 ±  2%      +0.4        0.95 ± 14%  perf-profile.calltrace.cycles.release_sock.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      2.14            +0.4        2.57 ±  5%  perf-profile.calltrace.cycles.inet_accept.do_accept.__sys_accept4_file.__sys_accept4.__x64_sys_accept
      1.94 ±  9%      +0.4        2.39 ±  7%  perf-profile.calltrace.cycles.__sk_destruct.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
      3.37            +0.5        3.82 ±  3%  perf-profile.calltrace.cycles.tcp_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.__sys_connect
      2.89            +0.5        3.39 ±  5%  perf-profile.calltrace.cycles.do_accept.__sys_accept4_file.__sys_accept4.__x64_sys_accept.do_syscall_64
      2.98            +0.5        3.49 ±  5%  perf-profile.calltrace.cycles.__sys_accept4_file.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.02            +0.5        3.53 ±  5%  perf-profile.calltrace.cycles.__sys_accept4.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept
      3.04            +0.5        3.55 ±  5%  perf-profile.calltrace.cycles.__x64_sys_accept.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept.process_requests
      3.18            +0.5        3.70 ±  5%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.accept.process_requests.spawn_child
      3.21            +0.5        3.72 ±  5%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.accept.process_requests.spawn_child.accept_connection
      3.38            +0.6        3.93 ±  5%  perf-profile.calltrace.cycles.accept.process_requests.spawn_child.accept_connection.accept_connections
      0.79            +0.6        1.35 ± 24%  perf-profile.calltrace.cycles.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      3.99            +0.6        4.58 ±  3%  perf-profile.calltrace.cycles.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.__sys_connect.__x64_sys_connect
      0.00            +0.6        0.58 ±  5%  perf-profile.calltrace.cycles.skb_release_data.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      5.14            +0.7        5.80 ±  3%  perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      5.01            +0.7        5.69 ±  3%  perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked
      0.00            +0.7        0.71 ± 16%  perf-profile.calltrace.cycles.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      8.22            +0.8        9.05 ±  2%  perf-profile.calltrace.cycles.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      8.29            +0.8        9.12 ±  2%  perf-profile.calltrace.cycles.secondary_startup_64_no_verify
      8.25            +0.8        9.09 ±  2%  perf-profile.calltrace.cycles.cpu_startup_entry.secondary_startup_64_no_verify
      6.40            +0.9        7.35 ±  3%  perf-profile.calltrace.cycles.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      6.40            +0.9        7.35 ±  3%  perf-profile.calltrace.cycles.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      6.39            +1.0        7.40 ±  3%  perf-profile.calltrace.cycles.__send.recv_omni.process_requests.spawn_child.accept_connection
      6.30            +1.0        7.31 ±  3%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.recv_omni.process_requests
      6.30            +1.0        7.32 ±  3%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.__send.recv_omni.process_requests.spawn_child
      6.25            +1.0        7.29 ±  3%  perf-profile.calltrace.cycles.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.recv_omni
      9.74            +1.1       10.86 ±  2%  perf-profile.calltrace.cycles.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send
      9.58            +1.1       10.72 ±  2%  perf-profile.calltrace.cycles.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      9.62            +1.2       10.78 ±  2%  perf-profile.calltrace.cycles.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.99            +1.2        9.18 ±  3%  perf-profile.calltrace.cycles.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto
      4.90            +1.2        6.10 ±  5%  perf-profile.calltrace.cycles.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      4.42            +1.4        5.78 ±  6%  perf-profile.calltrace.cycles.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner
      4.61            +1.4        5.97 ±  6%  perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner.send_tcp_conn_rr
      4.64            +1.4        6.01 ±  6%  perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner.send_tcp_conn_rr.main
      4.90            +1.4        6.31 ±  6%  perf-profile.calltrace.cycles.recv.send_omni_inner.send_tcp_conn_rr.main
      0.93 ± 11%      +1.5        2.44 ± 37%  perf-profile.calltrace.cycles.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv
      0.96 ± 11%      +1.5        2.51 ± 37%  perf-profile.calltrace.cycles.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      0.85 ± 13%      +1.6        2.41 ± 40%  perf-profile.calltrace.cycles.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock.__tcp_close.tcp_close
      0.85 ± 13%      +1.6        2.42 ± 40%  perf-profile.calltrace.cycles.tcp_v4_do_rcv.__release_sock.__tcp_close.tcp_close.inet_release
      0.86 ± 12%      +1.6        2.43 ± 39%  perf-profile.calltrace.cycles.__release_sock.__tcp_close.tcp_close.inet_release.__sock_release
      9.07            +1.7       10.75 ±  8%  perf-profile.calltrace.cycles.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.__tcp_close
      9.38            +1.7       11.07 ±  8%  perf-profile.calltrace.cycles.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.__tcp_close.tcp_close
      5.72            +1.7        7.41 ±  6%  perf-profile.calltrace.cycles.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
      5.79            +1.7        7.51 ±  6%  perf-profile.calltrace.cycles.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.98            +1.7        7.72 ±  6%  perf-profile.calltrace.cycles.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv
     10.02            +1.9       11.93 ±  8%  perf-profile.calltrace.cycles.__tcp_push_pending_frames.__tcp_close.tcp_close.inet_release.__sock_release
     10.02            +1.9       11.93 ±  8%  perf-profile.calltrace.cycles.tcp_write_xmit.__tcp_push_pending_frames.__tcp_close.tcp_close.inet_release
      2.72 ±  3%      +2.1        4.85 ± 23%  perf-profile.calltrace.cycles.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
     55.76            +2.3       58.10 ±  2%  perf-profile.calltrace.cycles.send_tcp_conn_rr.main
     55.75            +2.3       58.08 ±  2%  perf-profile.calltrace.cycles.send_omni_inner.send_tcp_conn_rr.main
     13.16            +2.4       15.53 ±  7%  perf-profile.calltrace.cycles.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     13.78            +2.4       16.18 ±  6%  perf-profile.calltrace.cycles.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames
      6.15            +2.6        8.76 ± 14%  perf-profile.calltrace.cycles.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
     40.96            -4.6       36.37 ±  4%  perf-profile.children.cycles.inet_release
     41.29            -4.6       36.73 ±  4%  perf-profile.children.cycles.__sock_release
     41.29            -4.6       36.73 ±  4%  perf-profile.children.cycles.sock_close
     41.89            -4.5       37.40 ±  4%  perf-profile.children.cycles.__fput
     42.10            -4.4       37.69 ±  4%  perf-profile.children.cycles.task_work_run
     42.60            -4.4       38.22 ±  4%  perf-profile.children.cycles.exit_to_user_mode_prepare
     42.66            -4.4       38.28 ±  4%  perf-profile.children.cycles.syscall_exit_to_user_mode
     42.66            -4.4       38.29 ±  4%  perf-profile.children.cycles.__close
     42.45            -4.3       38.10 ±  4%  perf-profile.children.cycles.exit_to_user_mode_loop
      7.17 ±  2%      -3.4        3.74 ± 22%  perf-profile.children.cycles.native_queued_spin_lock_slowpath
     28.74            -3.3       25.40 ±  6%  perf-profile.children.cycles.recv_omni
     32.15            -2.8       29.38 ±  5%  perf-profile.children.cycles.accept_connection
     32.15            -2.8       29.38 ±  5%  perf-profile.children.cycles.accept_connections
     32.15            -2.8       29.38 ±  5%  perf-profile.children.cycles.process_requests
     32.15            -2.8       29.38 ±  5%  perf-profile.children.cycles.spawn_child
      7.39 ±  2%      -2.3        5.08 ± 15%  perf-profile.children.cycles._raw_spin_lock
     11.65            -2.2        9.48 ± 11%  perf-profile.children.cycles.__sk_destruct
     31.54            -2.0       29.52 ±  2%  perf-profile.children.cycles.tcp_close
     24.03            -1.8       22.25 ±  3%  perf-profile.children.cycles.release_sock
      6.38            -1.0        5.39 ± 10%  perf-profile.children.cycles.inet_csk_clone_lock
      6.36            -1.0        5.37 ± 10%  perf-profile.children.cycles.sk_clone_lock
      6.48            -1.0        5.51 ±  9%  perf-profile.children.cycles.tcp_create_openreq_child
      7.23            -1.0        6.27 ±  8%  perf-profile.children.cycles.tcp_v4_syn_recv_sock
      7.41            -1.0        6.45 ±  8%  perf-profile.children.cycles.tcp_check_req
      7.28            -0.9        6.38 ±  8%  perf-profile.children.cycles.__sys_socket
      7.28            -0.9        6.38 ±  8%  perf-profile.children.cycles.__x64_sys_socket
      7.34            -0.9        6.46 ±  8%  perf-profile.children.cycles.__socket
      6.36            -0.9        5.48 ±  9%  perf-profile.children.cycles.inet_create
      6.04            -0.9        5.17 ± 10%  perf-profile.children.cycles.sk_alloc
      6.67            -0.9        5.81 ±  8%  perf-profile.children.cycles.__sock_create
      6.02 ±  4%      -0.7        5.34        perf-profile.children.cycles.kmem_cache_free
      4.62 ±  6%      -0.6        4.00 ±  4%  perf-profile.children.cycles.rcu_core
      4.58 ±  6%      -0.6        3.97 ±  4%  perf-profile.children.cycles.rcu_do_batch
      1.50 ± 14%      -0.6        0.92 ±  5%  perf-profile.children.cycles.__slab_free
      2.21 ± 10%      -0.5        1.66 ±  3%  perf-profile.children.cycles._raw_spin_lock_irqsave
      0.20 ± 14%      -0.1        0.09 ±  6%  perf-profile.children.cycles.update_cfs_group
      0.31            -0.1        0.21 ± 17%  perf-profile.children.cycles.alloc_fd
      0.16 ± 16%      -0.1        0.08 ± 13%  perf-profile.children.cycles.rcu_cblist_dequeue
      0.39 ±  4%      -0.1        0.30 ± 13%  perf-profile.children.cycles.record__mmap_read_evlist
      0.37 ±  3%      -0.1        0.29 ± 13%  perf-profile.children.cycles.perf_mmap__push
      0.20 ± 11%      -0.1        0.12 ±  7%  perf-profile.children.cycles.___slab_alloc
      0.18 ±  3%      -0.1        0.13 ± 10%  perf-profile.children.cycles.record__pushfn
      0.18 ±  3%      -0.0        0.14 ± 10%  perf-profile.children.cycles.write
      0.18 ±  3%      -0.0        0.14 ± 10%  perf-profile.children.cycles.writen
      0.16 ±  3%      -0.0        0.12 ± 11%  perf-profile.children.cycles.ksys_write
      0.15 ±  4%      -0.0        0.11 ±  9%  perf-profile.children.cycles.generic_file_write_iter
      0.14 ±  3%      -0.0        0.11 ±  4%  perf-profile.children.cycles.tcp_ack_update_window
      0.16 ±  3%      -0.0        0.12 ± 11%  perf-profile.children.cycles.vfs_write
      0.14 ±  4%      -0.0        0.10 ± 10%  perf-profile.children.cycles.generic_perform_write
      0.15 ±  4%      -0.0        0.11 ±  9%  perf-profile.children.cycles.new_sync_write
      0.12 ±  8%      -0.0        0.09        perf-profile.children.cycles.available_idle_cpu
      0.14 ±  2%      -0.0        0.11 ±  8%  perf-profile.children.cycles.__generic_file_write_iter
      0.10            -0.0        0.08 ± 10%  perf-profile.children.cycles.inet_sock_destruct
      0.18            -0.0        0.16 ±  3%  perf-profile.children.cycles.__netif_receive_skb_core
      0.07            -0.0        0.06 ±  8%  perf-profile.children.cycles.__xfrm_policy_check2
      0.22            -0.0        0.21        perf-profile.children.cycles.__x64_sys_close
      0.09 ±  4%      -0.0        0.08        perf-profile.children.cycles.syscall_enter_from_user_mode
      0.05            +0.0        0.06        perf-profile.children.cycles.__update_load_avg_se
      0.05            +0.0        0.06        perf-profile.children.cycles.iput
      0.09            +0.0        0.10        perf-profile.children.cycles.tcp_validate_incoming
      0.08            +0.0        0.09 ±  4%  perf-profile.children.cycles.tick_nohz_idle_enter
      0.20 ±  2%      +0.0        0.22 ±  3%  perf-profile.children.cycles.validate_xmit_skb
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles.inet_csk_complete_hashdance
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles.tcp_openreq_init_rwin
      0.17 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles.kfree_skbmem
      0.14 ±  3%      +0.0        0.16 ±  2%  perf-profile.children.cycles.sockfd_lookup_light
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles.__destroy_inode
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles.__put_user_nocheck_8
      0.06            +0.0        0.08 ±  6%  perf-profile.children.cycles.__wrgsbase_inactive
      0.05 ±  7%      +0.0        0.07 ±  7%  perf-profile.children.cycles._copy_to_user
      0.05 ±  8%      +0.0        0.07 ±  5%  perf-profile.children.cycles.move_addr_to_kernel
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.children.cycles.secure_tcp_seq
      0.15 ±  2%      +0.0        0.17 ±  2%  perf-profile.children.cycles.__fget_light
      0.08            +0.0        0.10 ±  5%  perf-profile.children.cycles.__mkroute_output
      0.08            +0.0        0.10 ±  5%  perf-profile.children.cycles.get_obj_cgroup_from_current
      0.14 ±  2%      +0.0        0.16 ±  4%  perf-profile.children.cycles.inet_csk_route_req
      0.05            +0.0        0.07 ±  7%  perf-profile.children.cycles.destroy_inode
      0.09            +0.0        0.11 ±  4%  perf-profile.children.cycles.__cond_resched
      0.11 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles.fib_lookup_good_nhc
      0.07            +0.0        0.09 ±  5%  perf-profile.children.cycles.rcu_read_unlock_strict
      0.10 ±  3%      +0.0        0.12 ±  3%  perf-profile.children.cycles.tcp_wfree
      0.06            +0.0        0.08 ±  6%  perf-profile.children.cycles.d_instantiate
      0.06            +0.0        0.08 ±  6%  perf-profile.children.cycles.inet_lhash2_lookup
      0.05 ±  7%      +0.0        0.07 ±  5%  perf-profile.children.cycles.inet_sk_rx_dst_set
      0.11            +0.0        0.13 ±  3%  perf-profile.children.cycles.perf_trace_sched_wakeup_template
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles.tcp_queue_rcv
      0.07            +0.0        0.09 ±  4%  perf-profile.children.cycles._copy_from_user
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles.inet_bind_bucket_create
      0.05            +0.0        0.07 ± 10%  perf-profile.children.cycles.tcp_mtu_probe
      0.08            +0.0        0.10 ±  3%  perf-profile.children.cycles.___perf_sw_event
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles._raw_spin_unlock_irqrestore
      0.09 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles.arch_local_irq_enable
      0.08            +0.0        0.10 ±  3%  perf-profile.children.cycles.save_fpregs_to_fpstate
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles.skb_queue_purge
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles.tcp_data_ready
      0.08            +0.0        0.10 ±  3%  perf-profile.children.cycles.tick_nohz_idle_exit
      0.10            +0.0        0.12 ±  4%  perf-profile.children.cycles.__x64_sys_setsockopt
      0.05            +0.0        0.07 ±  8%  perf-profile.children.cycles.inet_getname
      0.09            +0.0        0.11 ±  3%  perf-profile.children.cycles.__inet_lookup_listener
      0.13 ±  2%      +0.0        0.15 ±  3%  perf-profile.children.cycles.evict
      0.18 ±  2%      +0.0        0.20 ±  3%  perf-profile.children.cycles.menu_select
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles.__sys_setsockopt
      0.19 ±  2%      +0.0        0.21 ±  2%  perf-profile.children.cycles.ip_local_out
      0.08 ±  4%      +0.0        0.10 ±  6%  perf-profile.children.cycles.enqueue_timer
      0.11 ±  3%      +0.0        0.14 ±  5%  perf-profile.children.cycles.sock_getsockopt
      0.15            +0.0        0.17 ±  4%  perf-profile.children.cycles.__switch_to_asm
      0.13 ±  2%      +0.0        0.15 ±  4%  perf-profile.children.cycles.prepare_task_switch
      0.17 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles.rseq_ip_fixup
      0.12 ±  4%      +0.0        0.14 ±  2%  perf-profile.children.cycles.kmem_cache_alloc_node
      0.09            +0.0        0.12 ±  4%  perf-profile.children.cycles.cpus_share_cache
      0.07 ±  6%      +0.0        0.10 ± 11%  perf-profile.children.cycles.inet_twsk_alloc
      0.09 ±  5%      +0.0        0.12 ±  4%  perf-profile.children.cycles.__build_skb_around
      0.14 ±  3%      +0.0        0.16 ±  5%  perf-profile.children.cycles.__hrtimer_run_queues
      0.22 ±  2%      +0.0        0.24 ±  3%  perf-profile.children.cycles.enqueue_to_backlog
      0.15 ±  2%      +0.0        0.18 ±  4%  perf-profile.children.cycles.ip_send_check
      0.12 ±  3%      +0.0        0.15 ±  5%  perf-profile.children.cycles.tick_sched_handle
      0.06 ±  8%      +0.0        0.08 ±  8%  perf-profile.children.cycles.prepare_to_wait_exclusive
      0.13 ±  2%      +0.0        0.16 ±  6%  perf-profile.children.cycles.tick_sched_timer
      0.30            +0.0        0.33        perf-profile.children.cycles.dst_release
      0.18 ±  2%      +0.0        0.21 ±  4%  perf-profile.children.cycles.__ip_local_out
      0.18 ±  2%      +0.0        0.21 ±  4%  perf-profile.children.cycles.__switch_to
      0.13            +0.0        0.16 ±  3%  perf-profile.children.cycles.pick_next_task_fair
      0.12            +0.0        0.15 ±  5%  perf-profile.children.cycles.update_process_times
      0.14 ±  3%      +0.0        0.17 ±  5%  perf-profile.children.cycles.__call_rcu
      0.22 ±  4%      +0.0        0.25 ±  3%  perf-profile.children.cycles.fib_table_lookup
      0.15 ±  2%      +0.0        0.18 ±  6%  perf-profile.children.cycles.__x64_sys_getsockopt
      0.25            +0.0        0.28 ±  3%  perf-profile.children.cycles.netif_rx
      0.24            +0.0        0.27 ±  3%  perf-profile.children.cycles.netif_rx_internal
      0.12 ±  3%      +0.0        0.15 ±  7%  perf-profile.children.cycles.tcp_check_space
      0.15 ±  3%      +0.0        0.18 ±  6%  perf-profile.children.cycles.__sys_getsockopt
      0.16            +0.0        0.20 ±  3%  perf-profile.children.cycles.setsockopt
      0.22            +0.0        0.25 ±  3%  perf-profile.children.cycles.__sysvec_apic_timer_interrupt
      0.13 ±  2%      +0.0        0.17 ±  6%  perf-profile.children.cycles._raw_write_lock_bh
      0.21 ±  3%      +0.0        0.25 ±  4%  perf-profile.children.cycles.hrtimer_interrupt
      0.18 ±  2%      +0.0        0.21 ±  4%  perf-profile.children.cycles.ip_route_output_key_hash
      0.13            +0.0        0.17 ±  6%  perf-profile.children.cycles.migrate_disable
      0.20 ±  2%      +0.0        0.23        perf-profile.children.cycles.mem_cgroup_uncharge_skmem
      0.02 ±141%      +0.0        0.06 ±  9%  perf-profile.children.cycles.clockevents_program_event
      0.41            +0.0        0.44 ±  2%  perf-profile.children.cycles.tcp_v4_send_synack
      0.08            +0.0        0.12 ± 15%  perf-profile.children.cycles.skb_rbtree_purge
      0.25            +0.0        0.29 ±  4%  perf-profile.children.cycles.inet_csk_reqsk_queue_hash_add
      0.18            +0.0        0.22 ±  3%  perf-profile.children.cycles.native_sched_clock
      0.16            +0.0        0.20 ±  5%  perf-profile.children.cycles.pick_next_task
      0.08 ±  6%      +0.0        0.12 ± 10%  perf-profile.children.cycles.poll_idle
      0.20 ±  2%      +0.0        0.25 ±  4%  perf-profile.children.cycles.__kmalloc_node_track_caller
      0.24            +0.0        0.29 ±  4%  perf-profile.children.cycles.__rseq_handle_notify_resume
      0.20 ±  2%      +0.0        0.24 ±  2%  perf-profile.children.cycles.remove_wait_queue
      0.10            +0.0        0.15 ± 10%  perf-profile.children.cycles.cubictcp_acked
      0.22            +0.0        0.27 ±  5%  perf-profile.children.cycles.kmalloc_reserve
      0.20            +0.0        0.25 ±  3%  perf-profile.children.cycles.sched_clock_cpu
      0.26            +0.0        0.30 ±  3%  perf-profile.children.cycles.del_timer
      0.34 ±  2%      +0.0        0.39 ±  3%  perf-profile.children.cycles.ip_route_output_flow
      0.10            +0.0        0.15 ± 15%  perf-profile.children.cycles.rb_first
      0.08 ±  9%      +0.1        0.13 ±  5%  perf-profile.children.cycles.reweight_entity
      0.00            +0.1        0.05        perf-profile.children.cycles.add_wait_queue
      0.28 ±  2%      +0.1        0.33 ±  6%  perf-profile.children.cycles.inet_put_port
      0.17 ±  2%      +0.1        0.22 ±  2%  perf-profile.children.cycles.tcp_add_backlog
      0.28 ±  2%      +0.1        0.33 ±  2%  perf-profile.children.cycles.ip_finish_output
      0.21            +0.1        0.26 ±  6%  perf-profile.children.cycles.skb_page_frag_refill
      0.21            +0.1        0.27 ±  7%  perf-profile.children.cycles.sk_page_frag_refill
      0.26            +0.1        0.32 ±  4%  perf-profile.children.cycles.sk_prot_alloc
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles.sk_free
      0.95            +0.1        1.01 ±  3%  perf-profile.children.cycles.__cmd_record
      0.31            +0.1        0.37 ±  3%  perf-profile.children.cycles.__tcp_send_ack
      0.95            +0.1        1.01 ±  3%  perf-profile.children.cycles.cmd_record
      0.96 ±  2%      +0.1        1.01 ±  3%  perf-profile.children.cycles.handle_internal_command
      0.96 ±  2%      +0.1        1.01 ±  3%  perf-profile.children.cycles.run_builtin
      0.41            +0.1        0.47 ±  3%  perf-profile.children.cycles.__cgroup_bpf_run_filter_skb
      0.27 ±  5%      +0.1        0.33 ±  3%  perf-profile.children.cycles.__mod_memcg_state
      0.27            +0.1        0.33 ±  5%  perf-profile.children.cycles.getsockopt
      0.47            +0.1        0.53 ±  3%  perf-profile.children.cycles.__dentry_kill
      0.27            +0.1        0.34 ±  6%  perf-profile.children.cycles.inet_csk_bind_conflict
      0.40 ±  3%      +0.1        0.47 ±  3%  perf-profile.children.cycles.ip_route_output_key_hash_rcu
      0.20 ±  2%      +0.1        0.26 ±  7%  perf-profile.children.cycles.__inet_check_established
      0.26 ±  2%      +0.1        0.32 ±  5%  perf-profile.children.cycles.__d_alloc
      0.21 ±  2%      +0.1        0.28 ±  5%  perf-profile.children.cycles.__inet_hash_connect
      0.13 ±  3%      +0.1        0.20 ± 10%  perf-profile.children.cycles.tcp_cleanup_rbuf
      0.64            +0.1        0.70 ±  3%  perf-profile.children.cycles.slab_free_freelist_hook
      0.12 ±  3%      +0.1        0.18 ±  6%  perf-profile.children.cycles.sk_forced_mem_schedule
      0.32            +0.1        0.38 ±  5%  perf-profile.children.cycles.inet_csk_clear_xmit_timers
      0.50            +0.1        0.57 ±  2%  perf-profile.children.cycles.loopback_xmit
      0.26 ±  2%      +0.1        0.33 ±  6%  perf-profile.children.cycles.d_alloc_pseudo
      0.38 ±  2%      +0.1        0.44 ±  5%  perf-profile.children.cycles.ip_rcv_finish_core
      0.36 ±  2%      +0.1        0.42 ±  3%  perf-profile.children.cycles.__skb_clone
      0.50            +0.1        0.56 ±  4%  perf-profile.children.cycles.dentry_kill
      0.60            +0.1        0.66 ±  2%  perf-profile.children.cycles.dev_hard_start_xmit
      0.16 ±  3%      +0.1        0.22 ±  8%  perf-profile.children.cycles._raw_spin_lock_irq
      0.27            +0.1        0.34 ±  5%  perf-profile.children.cycles.llist_reverse_order
      0.26            +0.1        0.33 ±  5%  perf-profile.children.cycles.tcp_mstamp_refresh
      0.24            +0.1        0.30 ±  6%  perf-profile.children.cycles.memcpy_erms
      0.46            +0.1        0.53 ±  2%  perf-profile.children.cycles.__ksize
      0.56            +0.1        0.63 ±  2%  perf-profile.children.cycles.xmit_one
      0.35            +0.1        0.42 ±  4%  perf-profile.children.cycles.sk_stop_timer
      0.30            +0.1        0.37 ±  5%  perf-profile.children.cycles.set_sock_buffer
      0.46            +0.1        0.54 ±  3%  perf-profile.children.cycles.tcp_v4_destroy_sock
      1.08            +0.1        1.16        perf-profile.children.cycles.inet_csk_destroy_sock
      0.30            +0.1        0.37 ±  3%  perf-profile.children.cycles.flush_smp_call_function_queue
      0.54 ±  2%      +0.1        0.62 ±  4%  perf-profile.children.cycles.dput
      0.14 ±  8%      +0.1        0.22 ± 11%  perf-profile.children.cycles.obj_cgroup_charge_pages
      0.28            +0.1        0.36 ±  4%  perf-profile.children.cycles.sock_rfree
      0.63 ±  2%      +0.1        0.71 ±  3%  perf-profile.children.cycles.ip_rcv
      0.35            +0.1        0.43 ±  5%  perf-profile.children.cycles.create_data_socket
      0.17 ±  6%      +0.1        0.25 ± 10%  perf-profile.children.cycles.obj_cgroup_charge
      0.31            +0.1        0.39 ±  5%  perf-profile.children.cycles.read_tsc
      0.27            +0.1        0.35 ±  7%  perf-profile.children.cycles.simple_copy_to_iter
      0.29            +0.1        0.37 ±  6%  perf-profile.children.cycles.tcp_rcv_space_adjust
      0.35 ±  2%      +0.1        0.43 ±  4%  perf-profile.children.cycles.__entry_text_start
      0.30            +0.1        0.38 ±  6%  perf-profile.children.cycles._copy_to_iter
      0.40            +0.1        0.48 ±  4%  perf-profile.children.cycles.psi_group_change
      0.55            +0.1        0.64 ±  7%  perf-profile.children.cycles.process_simple
      0.55            +0.1        0.64 ±  7%  perf-profile.children.cycles.ordered_events__queue
      0.55            +0.1        0.64 ±  7%  perf-profile.children.cycles.queue_event
      0.27            +0.1        0.36 ±  4%  perf-profile.children.cycles.raw_spin_rq_lock_nested
      0.35            +0.1        0.44 ±  4%  perf-profile.children.cycles.send_call_function_single_ipi
      0.36            +0.1        0.45 ±  6%  perf-profile.children.cycles.copy_user_generic_unrolled
      0.44            +0.1        0.53 ±  5%  perf-profile.children.cycles.inet_csk_get_port
      0.34            +0.1        0.44 ±  3%  perf-profile.children.cycles.update_rq_clock
      0.30            +0.1        0.39 ±  7%  perf-profile.children.cycles.__check_object_size
      0.76            +0.1        0.86 ±  5%  perf-profile.children.cycles.autoremove_wake_function
      0.57            +0.1        0.67 ±  4%  perf-profile.children.cycles.tcp_event_new_data_sent
      0.61            +0.1        0.72 ±  5%  perf-profile.children.cycles.sock_alloc_file
      0.60            +0.1        0.71 ±  5%  perf-profile.children.cycles.alloc_file_pseudo
      0.50            +0.1        0.60 ±  4%  perf-profile.children.cycles.psi_task_switch
      0.51            +0.1        0.62 ±  5%  perf-profile.children.cycles.__inet_bind
      1.28            +0.1        1.39        perf-profile.children.cycles.kfree
      1.08            +0.1        1.19 ±  2%  perf-profile.children.cycles.wait_woken
      0.65            +0.1        0.77 ±  3%  perf-profile.children.cycles.lock_timer_base
      0.56            +0.1        0.68 ±  5%  perf-profile.children.cycles.__sys_bind
      0.48            +0.1        0.60 ±  4%  perf-profile.children.cycles.ktime_get
      0.56            +0.1        0.68 ±  5%  perf-profile.children.cycles.__x64_sys_bind
      0.81            +0.1        0.93 ±  3%  perf-profile.children.cycles.__mod_timer
      0.56            +0.1        0.68 ±  4%  perf-profile.children.cycles.cmd_sched
      0.56            +0.1        0.68 ±  4%  perf-profile.children.cycles.perf_session__process_events
      0.56            +0.1        0.68 ±  4%  perf-profile.children.cycles.reader__read_event
      0.56            +0.1        0.68 ±  4%  perf-profile.children.cycles.record__finish_output
      1.46            +0.1        1.60 ±  2%  perf-profile.children.cycles.schedule
      0.62            +0.1        0.75 ±  5%  perf-profile.children.cycles.bind
      0.66            +0.1        0.79 ±  3%  perf-profile.children.cycles.ttwu_queue_wakelist
      0.85            +0.1        0.99 ±  6%  perf-profile.children.cycles.lock_sock_nested
      1.02 ±  2%      +0.1        1.16 ±  4%  perf-profile.children.cycles.sched_ttwu_pending
      1.76            +0.1        1.90        perf-profile.children.cycles.skb_release_data
      0.85            +0.2        1.02 ±  4%  perf-profile.children.cycles.sk_reset_timer
      1.25            +0.2        1.43 ±  3%  perf-profile.children.cycles.tcp_conn_request
      1.30            +0.2        1.49 ±  2%  perf-profile.children.cycles.__dev_queue_xmit
      0.87 ±  2%      +0.2        1.06 ±  4%  perf-profile.children.cycles.tcp_send_fin
      0.22 ±  7%      +0.2        0.42 ± 18%  perf-profile.children.cycles.page_counter_uncharge
      0.23 ±  7%      +0.2        0.43 ± 19%  perf-profile.children.cycles.drain_stock
      4.20            +0.2        4.40        perf-profile.children.cycles.mwait_idle_with_hints
      1.22            +0.2        1.43 ±  2%  perf-profile.children.cycles.__alloc_skb
      4.20            +0.2        4.40        perf-profile.children.cycles.intel_idle
      1.79            +0.2        2.00 ±  2%  perf-profile.children.cycles.schedule_timeout
      0.59            +0.2        0.80 ±  8%  perf-profile.children.cycles.skb_release_head_state
      0.90            +0.2        1.12 ±  4%  perf-profile.children.cycles.schedule_idle
      1.81            +0.2        2.03 ±  4%  perf-profile.children.cycles.__inet_lookup_established
      0.33 ±  5%      +0.2        0.57 ± 15%  perf-profile.children.cycles.refill_stock
      0.81            +0.2        1.05 ±  6%  perf-profile.children.cycles.skb_copy_datagram_iter
      0.81            +0.2        1.05 ±  6%  perf-profile.children.cycles.__skb_datagram_iter
      3.15            +0.2        3.39 ±  2%  perf-profile.children.cycles.tcp_ack
      0.19 ± 10%      +0.2        0.44 ± 23%  perf-profile.children.cycles.page_counter_try_charge
      2.16            +0.3        2.42 ±  3%  perf-profile.children.cycles.tcp_clean_rtx_queue
      1.66            +0.3        1.92 ±  2%  perf-profile.children.cycles.sk_wait_data
      1.73            +0.3        1.99 ±  3%  perf-profile.children.cycles.try_to_wake_up
      5.47            +0.3        5.74 ±  2%  perf-profile.children.cycles.cpuidle_idle_call
      3.65            +0.3        3.93 ±  2%  perf-profile.children.cycles.memcg_slab_free_hook
      1.57            +0.3        1.85 ±  4%  perf-profile.children.cycles.flush_smp_call_function_from_idle
      0.54 ±  3%      +0.3        0.83 ± 12%  perf-profile.children.cycles.__sk_mem_reduce_allocated
      0.81            +0.3        1.11 ±  7%  perf-profile.children.cycles.sk_stream_alloc_skb
      1.86            +0.3        2.17 ±  5%  perf-profile.children.cycles.inet_csk_accept
      2.04            +0.3        2.37 ±  3%  perf-profile.children.cycles.__wake_up_common
      2.29            +0.3        2.62 ±  3%  perf-profile.children.cycles.__schedule
      3.12            +0.3        3.47 ±  3%  perf-profile.children.cycles.__mod_memcg_lruvec_state
      2.11            +0.3        2.46 ±  3%  perf-profile.children.cycles.__wake_up_common_lock
      2.02            +0.4        2.37 ±  3%  perf-profile.children.cycles.__kfree_skb
      3.25            +0.4        3.62 ±  3%  perf-profile.children.cycles.mod_objcg_state
      2.05            +0.4        2.45 ±  4%  perf-profile.children.cycles.sock_def_readable
      0.52 ±  5%      +0.4        0.93 ± 17%  perf-profile.children.cycles.mem_cgroup_charge_skmem
      0.40 ±  8%      +0.4        0.82 ± 21%  perf-profile.children.cycles.try_charge_memcg
      2.14            +0.4        2.57 ±  5%  perf-profile.children.cycles.inet_accept
      3.37            +0.5        3.82 ±  3%  perf-profile.children.cycles.tcp_connect
      2.89            +0.5        3.39 ±  5%  perf-profile.children.cycles.do_accept
      2.98            +0.5        3.49 ±  5%  perf-profile.children.cycles.__sys_accept4_file
      3.02            +0.5        3.53 ±  5%  perf-profile.children.cycles.__sys_accept4
      3.04            +0.5        3.55 ±  5%  perf-profile.children.cycles.__x64_sys_accept
      4.03            +0.5        4.58 ±  3%  perf-profile.children.cycles.tcp_rcv_established
      3.38            +0.6        3.93 ±  5%  perf-profile.children.cycles.accept
      3.99            +0.6        4.58 ±  3%  perf-profile.children.cycles.tcp_v4_connect
      8.29            +0.8        9.12 ±  2%  perf-profile.children.cycles.cpu_startup_entry
      8.26            +0.8        9.09 ±  2%  perf-profile.children.cycles.do_idle
      8.29            +0.8        9.12 ±  2%  perf-profile.children.cycles.secondary_startup_64_no_verify
     10.07            +1.1       11.13 ±  2%  perf-profile.children.cycles.__send
     32.64            +1.1       33.71        perf-profile.children.cycles.__tcp_transmit_skb
      9.76            +1.1       10.87 ±  2%  perf-profile.children.cycles.__x64_sys_sendto
      9.74            +1.1       10.86 ±  2%  perf-profile.children.cycles.__sys_sendto
      9.58            +1.1       10.72 ±  2%  perf-profile.children.cycles.tcp_sendmsg
      9.62            +1.2       10.78 ±  2%  perf-profile.children.cycles.sock_sendmsg
      7.99            +1.2        9.19 ±  3%  perf-profile.children.cycles.tcp_sendmsg_locked
      4.90            +1.2        6.10 ±  5%  perf-profile.children.cycles.tcp_recvmsg_locked
      5.72            +1.7        7.41 ±  6%  perf-profile.children.cycles.tcp_recvmsg
      5.79            +1.7        7.51 ±  6%  perf-profile.children.cycles.inet_recvmsg
      5.98            +1.7        7.72 ±  6%  perf-profile.children.cycles.__sys_recvfrom
      6.00            +1.8        7.75 ±  6%  perf-profile.children.cycles.__x64_sys_recvfrom
      6.58            +1.8        8.39 ±  5%  perf-profile.children.cycles.recv
     55.76            +2.3       58.10 ±  2%  perf-profile.children.cycles.send_tcp_conn_rr
     55.79            +2.3       58.12 ±  2%  perf-profile.children.cycles.send_omni_inner
     16.42            +2.9       19.28 ±  6%  perf-profile.children.cycles.tcp_write_xmit
     16.43            +2.9       19.28 ±  6%  perf-profile.children.cycles.__tcp_push_pending_frames
      7.16 ±  2%      -3.4        3.73 ± 22%  perf-profile.self.cycles.native_queued_spin_lock_slowpath
      9.90            -2.9        7.01 ± 16%  perf-profile.self.cycles.__tcp_close
     10.63            -1.9        8.72 ± 10%  perf-profile.self.cycles.__sk_destruct
      5.84            -1.0        4.87 ± 10%  perf-profile.self.cycles.sk_clone_lock
      5.70            -0.9        4.80 ± 10%  perf-profile.self.cycles.sk_alloc
      0.20 ± 14%      -0.1        0.09 ±  6%  perf-profile.self.cycles.update_cfs_group
      0.16 ± 16%      -0.1        0.08 ± 13%  perf-profile.self.cycles.rcu_cblist_dequeue
      0.66            -0.0        0.62 ±  3%  perf-profile.self.cycles.kmem_cache_free
      0.42            -0.0        0.38        perf-profile.self.cycles.memcg_slab_free_hook
      0.12 ±  8%      -0.0        0.09        perf-profile.self.cycles.available_idle_cpu
      0.12            -0.0        0.09        perf-profile.self.cycles.tcp_ack_update_window
      0.09            -0.0        0.07 ±  5%  perf-profile.self.cycles.do_syscall_64
      0.15 ±  2%      -0.0        0.13 ±  5%  perf-profile.self.cycles.__softirqentry_text_start
      0.15 ±  2%      -0.0        0.13 ±  2%  perf-profile.self.cycles.ip_protocol_deliver_rcu
      0.18            -0.0        0.16 ±  3%  perf-profile.self.cycles.__netif_receive_skb_core
      0.07 ±  5%      -0.0        0.05 ±  8%  perf-profile.self.cycles.__alloc_file
      0.07 ±  5%      -0.0        0.06 ±  8%  perf-profile.self.cycles.__netif_receive_skb_one_core
      0.07            -0.0        0.06 ±  8%  perf-profile.self.cycles.__xfrm_policy_check2
      0.08 ±  5%      -0.0        0.07        perf-profile.self.cycles.syscall_enter_from_user_mode
      0.07            -0.0        0.06        perf-profile.self.cycles.ip_output
      0.07            -0.0        0.06        perf-profile.self.cycles.tcp_current_mss
      0.06            -0.0        0.05        perf-profile.self.cycles.tcp_rack_update_reo_wnd
      0.05            +0.0        0.06        perf-profile.self.cycles.__update_load_avg_se
      0.11            +0.0        0.12        perf-profile.self.cycles.__sk_mem_reduce_allocated
      0.08            +0.0        0.09        perf-profile.self.cycles.finish_task_switch
      0.06            +0.0        0.07        perf-profile.self.cycles.psi_task_switch
      0.09            +0.0        0.10        perf-profile.self.cycles.tcp_validate_incoming
      0.12            +0.0        0.13 ±  2%  perf-profile.self.cycles.inet_csk_destroy_sock
      0.10            +0.0        0.11 ±  4%  perf-profile.self.cycles.___slab_alloc
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles.__wrgsbase_inactive
      0.05 ±  8%      +0.0        0.07 ±  5%  perf-profile.self.cycles.__cond_resched
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.self.cycles.tcp_set_state
      0.62            +0.0        0.64        perf-profile.self.cycles.tcp_clean_rtx_queue
      0.05            +0.0        0.07 ±  7%  perf-profile.self.cycles.__inet_check_established
      0.09            +0.0        0.11 ±  4%  perf-profile.self.cycles.__call_rcu
      0.10 ±  3%      +0.0        0.12 ±  3%  perf-profile.self.cycles.enqueue_entity
      0.09            +0.0        0.11 ±  4%  perf-profile.self.cycles.process_backlog
      0.07            +0.0        0.09 ±  5%  perf-profile.self.cycles.rcu_read_unlock_strict
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.self.cycles.sched_ttwu_pending
      0.07            +0.0        0.09 ±  5%  perf-profile.self.cycles.tcp_queue_rcv
      0.06            +0.0        0.08 ±  6%  perf-profile.self.cycles.inet_lhash2_lookup
      0.05 ±  7%      +0.0        0.07 ±  5%  perf-profile.self.cycles.inet_sk_rx_dst_set
      0.08 ±  4%      +0.0        0.10 ±  3%  perf-profile.self.cycles.tcp_release_cb
      0.10            +0.0        0.12 ±  3%  perf-profile.self.cycles.tcp_wfree
      0.07            +0.0        0.09 ±  4%  perf-profile.self.cycles.__rseq_handle_notify_resume
      0.07            +0.0        0.09 ±  4%  perf-profile.self.cycles.arch_local_irq_enable
      0.09            +0.0        0.11 ±  3%  perf-profile.self.cycles.exit_to_user_mode_loop
      0.12            +0.0        0.14 ±  4%  perf-profile.self.cycles.cpuidle_idle_call
      0.12            +0.0        0.14 ±  2%  perf-profile.self.cycles.entry_SYSCALL_64_after_hwframe
      0.09 ±  5%      +0.0        0.11 ±  3%  perf-profile.self.cycles.kmem_cache_alloc_node
      0.08            +0.0        0.10 ±  3%  perf-profile.self.cycles.save_fpregs_to_fpstate
      0.06            +0.0        0.08 ±  4%  perf-profile.self.cycles.tcp_data_ready
      0.10 ±  3%      +0.0        0.12 ±  5%  perf-profile.self.cycles.__local_bh_enable_ip
      0.09 ±  5%      +0.0        0.11 ±  6%  perf-profile.self.cycles.mod_objcg_state
      0.20 ±  2%      +0.0        0.22 ±  2%  perf-profile.self.cycles.__cgroup_bpf_run_filter_skb
      0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles.tcp_skb_entail
      0.12 ±  4%      +0.0        0.15 ±  5%  perf-profile.self.cycles.ip_route_output_key_hash_rcu
      0.09 ±  4%      +0.0        0.12 ±  6%  perf-profile.self.cycles.tcp_event_new_data_sent
      0.08 ±  4%      +0.0        0.10 ±  6%  perf-profile.self.cycles.enqueue_timer
      0.20            +0.0        0.22 ±  3%  perf-profile.self.cycles.__mod_timer
      0.15            +0.0        0.17 ±  4%  perf-profile.self.cycles.__switch_to_asm
      0.24            +0.0        0.26 ±  2%  perf-profile.self.cycles.__schedule
      0.11 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles.__kmalloc_node_track_caller
      0.09            +0.0        0.12 ±  4%  perf-profile.self.cycles.cpus_share_cache
      0.09            +0.0        0.12 ±  8%  perf-profile.self.cycles.sk_stop_timer
      0.07            +0.0        0.10 ±  9%  perf-profile.self.cycles.inet_recvmsg
      0.07            +0.0        0.10 ±  9%  perf-profile.self.cycles.inet_twsk_alloc
      0.15 ±  3%      +0.0        0.17 ±  4%  perf-profile.self.cycles.ip_send_check
      0.10            +0.0        0.13 ±  2%  perf-profile.self.cycles.tcp_add_backlog
      0.30            +0.0        0.33        perf-profile.self.cycles.dst_release
      0.07 ±  5%      +0.0        0.10 ±  8%  perf-profile.self.cycles.sk_stream_alloc_skb
      0.18 ±  2%      +0.0        0.21 ±  4%  perf-profile.self.cycles.__switch_to
      0.12 ±  4%      +0.0        0.15 ±  6%  perf-profile.self.cycles.tcp_check_space
      0.46            +0.0        0.50 ±  3%  perf-profile.self.cycles.skb_release_data
      0.30            +0.0        0.33 ±  2%  perf-profile.self.cycles.tcp_write_xmit
      0.11 ±  4%      +0.0        0.14 ±  7%  perf-profile.self.cycles.refill_stock
      0.35 ±  2%      +0.0        0.39 ±  2%  perf-profile.self.cycles.tcp_rcv_state_process
      0.13 ±  2%      +0.0        0.16 ±  5%  perf-profile.self.cycles.migrate_disable
      0.13            +0.0        0.17 ±  6%  perf-profile.self.cycles._raw_write_lock_bh
      0.18 ±  2%      +0.0        0.22 ±  6%  perf-profile.self.cycles.ttwu_queue_wakelist
      0.18            +0.0        0.22 ±  3%  perf-profile.self.cycles.native_sched_clock
      0.10            +0.0        0.14 ±  8%  perf-profile.self.cycles.cubictcp_acked
      0.18            +0.0        0.22 ±  6%  perf-profile.self.cycles.sock_def_readable
      0.09            +0.0        0.14 ± 11%  perf-profile.self.cycles.sk_reset_timer
      0.20 ±  2%      +0.0        0.24 ±  4%  perf-profile.self.cycles.ktime_get
      0.20 ±  2%      +0.0        0.25 ±  4%  perf-profile.self.cycles.tcp_conn_request
      0.01 ±223%      +0.0        0.06 ±  8%  perf-profile.self.cycles.create_data_socket
      0.10            +0.0        0.15 ± 15%  perf-profile.self.cycles.rb_first
      0.00            +0.1        0.05        perf-profile.self.cycles._raw_spin_unlock_irqrestore
      0.00            +0.1        0.05        perf-profile.self.cycles.loopback_xmit
      0.23 ±  7%      +0.1        0.28 ±  4%  perf-profile.self.cycles.__mod_memcg_state
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles.mem_cgroup_uncharge_skmem
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles.sk_wait_data
      0.08 ± 10%      +0.1        0.13 ±  5%  perf-profile.self.cycles.reweight_entity
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles.inet_reqsk_alloc
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles.sk_free
      0.36            +0.1        0.42 ±  3%  perf-profile.self.cycles.__alloc_skb
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles.sk_prot_alloc
      0.19            +0.1        0.25 ±  4%  perf-profile.self.cycles.inet_csk_accept
      0.21 ±  2%      +0.1        0.26 ±  6%  perf-profile.self.cycles.skb_page_frag_refill
      0.45            +0.1        0.51        perf-profile.self.cycles.release_sock
      0.27            +0.1        0.33 ±  6%  perf-profile.self.cycles.inet_csk_bind_conflict
      0.63            +0.1        0.69 ±  4%  perf-profile.self.cycles.slab_free_freelist_hook
      0.12 ±  3%      +0.1        0.18 ±  8%  perf-profile.self.cycles.sk_forced_mem_schedule
      0.20 ±  6%      +0.1        0.27 ±  5%  perf-profile.self.cycles.tcp_send_fin
      0.31            +0.1        0.38 ±  3%  perf-profile.self.cycles.__skb_clone
      0.37 ±  2%      +0.1        0.44 ±  5%  perf-profile.self.cycles.ip_rcv_finish_core
      0.13            +0.1        0.20 ±  9%  perf-profile.self.cycles.tcp_cleanup_rbuf
      0.33            +0.1        0.40 ±  2%  perf-profile.self.cycles.try_to_wake_up
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles.poll_idle
      0.23 ±  2%      +0.1        0.30 ±  5%  perf-profile.self.cycles.__skb_datagram_iter
      0.45            +0.1        0.52 ±  3%  perf-profile.self.cycles.__ksize
      0.16 ±  3%      +0.1        0.22 ±  8%  perf-profile.self.cycles._raw_spin_lock_irq
      0.27            +0.1        0.34 ±  5%  perf-profile.self.cycles.llist_reverse_order
      0.24            +0.1        0.30 ±  6%  perf-profile.self.cycles.memcpy_erms
      0.28            +0.1        0.35 ±  4%  perf-profile.self.cycles.sock_rfree
      0.24 ±  2%      +0.1        0.32 ±  6%  perf-profile.self.cycles.tcp_rcv_space_adjust
      0.29            +0.1        0.36 ±  4%  perf-profile.self.cycles.__wake_up_common
      0.28            +0.1        0.35 ±  4%  perf-profile.self.cycles.update_rq_clock
      0.25            +0.1        0.32 ±  5%  perf-profile.self.cycles.flush_smp_call_function_from_idle
      0.48            +0.1        0.56 ±  4%  perf-profile.self.cycles.tcp_sendmsg_locked
      0.33            +0.1        0.41 ±  3%  perf-profile.self.cycles.schedule_timeout
      0.35 ±  2%      +0.1        0.43 ±  4%  perf-profile.self.cycles.__entry_text_start
      0.55            +0.1        0.64 ±  7%  perf-profile.self.cycles.queue_event
      0.25            +0.1        0.34 ±  7%  perf-profile.self.cycles.__check_object_size
      0.36            +0.1        0.44 ±  6%  perf-profile.self.cycles.copy_user_generic_unrolled
      0.30            +0.1        0.39 ±  5%  perf-profile.self.cycles.read_tsc
      0.40            +0.1        0.48 ±  4%  perf-profile.self.cycles.psi_group_change
      0.35            +0.1        0.44 ±  4%  perf-profile.self.cycles.send_call_function_single_ipi
      0.34            +0.1        0.44 ±  5%  perf-profile.self.cycles.__dev_queue_xmit
      0.39 ±  2%      +0.1        0.50 ±  7%  perf-profile.self.cycles.__ip_queue_xmit
      0.55            +0.1        0.68 ±  4%  perf-profile.self.cycles.tcp_recvmsg_locked
      0.71            +0.1        0.84 ±  5%  perf-profile.self.cycles.__tcp_transmit_skb
      0.18 ±  5%      +0.2        0.34 ± 19%  perf-profile.self.cycles.try_charge_memcg
      0.20 ±  6%      +0.2        0.38 ± 18%  perf-profile.self.cycles.page_counter_uncharge
      2.12            +0.2        2.30        perf-profile.self.cycles._raw_spin_lock
      4.20            +0.2        4.40        perf-profile.self.cycles.mwait_idle_with_hints
      0.18 ± 11%      +0.2        0.41 ± 23%  perf-profile.self.cycles.page_counter_try_charge
      1.37            +0.3        1.64 ±  3%  perf-profile.self.cycles._raw_spin_lock_irqsave
      3.12            +0.3        3.46 ±  3%  perf-profile.self.cycles.__mod_memcg_lruvec_state
      1.94 ±  7%      +0.8        2.76 ± 17%  perf-profile.self.cycles._raw_spin_lock_bh




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

