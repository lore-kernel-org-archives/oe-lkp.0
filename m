Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A33A9DA1
	for <oe-lkp@lists.linux.dev>; Fri, 29 May 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045015; cv=fail; b=oPFKxasNWqeoGLxv1ergICdVfuJvjfnXUYIeFteWjsWiyQAVuBTQ83x+Wl6K2LjVqnJhIP5/NW+c92VMJNdNpyAGFj7oQO71x+x1LPE7uQI7qYcxiANzVo+zrJI8FsI+pwcZzW89ltGfPycF7lX2OJVNI3MvTZvXwKJIZ5Ow1qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045015; c=relaxed/simple;
	bh=FRz4nzcaJvuhhlP7yVH0dv4uK+WCUMaIbjaWRtAHJH4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Md9w69cCLbu3RIXo5vE1j/0+wQYG0t+/JpFoL4jspnkfilp2F8lIK2unrGWAyZXoK+4lhbdXeNyHolKKMcW7IUhIO+hBCSlu4ey3Z2P9MOBSvqxocsJSAHiWYLr5LlbcYfm8NaZLDqktRmmhuR8zmy7ezdUQbGgzWSfQC3iCsuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQXwN8YP; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQXwN8YP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780045013; x=1811581013;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=FRz4nzcaJvuhhlP7yVH0dv4uK+WCUMaIbjaWRtAHJH4=;
  b=HQXwN8YP5H6e0kGK7NI6xG2g4FbmJFAqIACtD/Hl0kgKopTkHur1euCw
   AasHQcDmJjB3WT9lQZnGI984Mo6epXV8U0467tcJjoabkMgL0F3JNTGPU
   je6PoBZWG5VzlilOKuV+Uyqp9yJ/3zgfALM6LjcGpNMfP1PsQfRMiRE02
   RWzxI1PNQxnykGWHH+jbd9mKXTp6pUpd+2BpTV3SN8kjr89MSgtt8uPK+
   SnS5DWXKkM2Q7ZbOaPAZfweITnpibe3ujUq43j83Z/kYBRjT63/KjvNLh
   VKPL3qR0HyrdcKtZuPcPC3Jd4B5jLB13JJ+nUSn8XOzsZyyrT+ttRTc/m
   w==;
X-CSE-ConnectionGUID: cANpj0gLTK64U8ChQv9YUw==
X-CSE-MsgGUID: xigu7m93TwS3I9fKhhqljA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="103567830"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="103567830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 01:56:52 -0700
X-CSE-ConnectionGUID: i/+dKOj7Tj6Rd9vlwR9eGw==
X-CSE-MsgGUID: LF+fJ8gITOyOAzLuJtG/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="266421770"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 01:56:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 01:56:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 01:56:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 01:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJHdXnJgZLGgFqDbrzVMTDpJ4A6zZ+ElINk2+aw7jur1OiftLuH/b+KQvUIlemriv0CkEGzefMgqGsB8vyJhXU+dJ1WuAMDYijB+OsrQ4cM+PtZTK6D4b1xS6GNkhzxAxDBn0EL1pFVVPw/CCd+rYYLJh0Vj+iFp8m5g/zB2X4wNzQ7GUlbaURWw90rlq2Wx25RmGWfBtsxrkOzYArIFkk2C7tSRjdc1DZUY1EGm3xpQH/nVe+62py6KfIIQq1KWoZc+CQK1wPF6vT+OyU0XoNI6YnIR8PGGJuOdBJIZ2KMEsbklP9HVNoEp8CQT6xUMy3DiKMvrzixJeDfKQE4RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsR9i/t3kuXXP+/Sp3JZ5MQkRNjxgAzhlSORBrwbjxc=;
 b=xHPasO0wk0bl3gkso2Sn1NsnGEg6p/TqBxUu5x9C6GP6VuK1geviDfxtuG9Ex6s52glDvSe1xtFM4GcsRPZald6Wk9rsfRd1U79fZeBL5d7rjRl9DxYcPt5UaXdzDhwsXY4DflzSZdO+76lhS+LyC97XLLvBvUCIjhQhTBSOKBPuGEHcgQBaVnHH3beMJ43lpc2c0kdT0/hiAfBoT6VHCnwMgotxQEKrKsB7FusDmywBHTwWChMygu3efbTwb83t2YDe88uQOMmm2Ez4ValDAg0FSJ+KCfjw3KyATfSp5HJbL6UzOfVpbP39dbtc87nP5GIxd9MXLMqCseEjpXBXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 08:56:47 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0048.019; Fri, 29 May 2026
 08:56:46 +0000
Date: Fri, 29 May 2026 16:56:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo
	<tj@kernel.org>, <aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>,
	<oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/rt]  dd29c017ae: stress-ng.mutex.ops_per_sec
 50.7% regression
Message-ID: <202605291602.aff7d092-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: e752b26d-0bf3-48a1-36d8-08debd6036ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: G4SOFZ7CYNtJeA6fSCLOBvqMtZkVB2kGe0Wxd1qdrVhnoREy4C1q2SrbyzEqkbLog6POZ+edOpX58mo1SZ9cUGbstDD7FxKJEMH8GXIcGKM3sSOjRs94gCbGSjjCeqzoUknJG/wg/wpOfkJoSmmtvJ0tUT2k0Q1WcjRRPrvs+UkWDTtJw1YpLf/i9kogetBJqTiGAT0sxoKnpZ//ZgZriFGkNYKTT1RKUzIbLUG+SGK+Wp4OW0Fvwmn27J01+v5GEJ1wel0mcvDw8EtTzLLGhi6Wd6wMPh9/rb//iIMUqzkXo7I3I0Kbv6rIUil+jVWWchi8QXNr/OP50cNNOg0sUZXvZvT6LDYt5izGwYp9yRCvUGCRacOh4z5ewgaNXA+4Iym2FgXAKgYsYuQtDsSyIqUsLaU+VzXMN6iWnQhFoSRcLm3ykIyWQBhrrdtUyKe9HglImuW0FIpOKZpkKTmzXNfHicyuM92FOIjAan9P2oCvzRDwHWOGMTY/ivJd3EXRiCLM+RBdeXatzn7VF8ad6uBSea1SnHAQkcy2KsRwwwM4BCpkdXFhxmHwRwUAkFZHIqeIrIyb2+OZP10isgcH/7tLNtmRQDJ3ZbmIYz192ku99Eak53+rBpoMxTeHcW8j100bOR5uSHd5rKzpCp8W/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0yfHjA5xVAUZ/wNyx+ZFmnEf+g0lh0pWGlnmpZwlmC+aeheNDU2dwbfeFF?=
 =?iso-8859-1?Q?EgDwtRDbSI8v/AduxwaXRppBoYQ5JXxtQ4gFQ96xEar7vf+fbwhRjlRcbs?=
 =?iso-8859-1?Q?tVvkjFCL8925Adm3ShDYIsXmlCZuEEG5U8h5d7mWaCl+p4eQTQK4RFqWSv?=
 =?iso-8859-1?Q?GKbXmNgL+gqq9WXyL2aHod7zq+ceq9rcQOnHraEKgB9hndX4Ork811SQBt?=
 =?iso-8859-1?Q?yu3AQ0E5Us9SrOwJwLL/72l+rVfVnuzR4IubnmuCelsLxRTTLzfMMhbvke?=
 =?iso-8859-1?Q?uFB9T6Aw/AR3kIY+B5yqR9aXUyZg2+BThX1G2i5aZZpKHZAB3t3OIzcXMA?=
 =?iso-8859-1?Q?8Mm54YJtcNIgsvwCUlKw/rZCZzIOMbGLe/84At6jLQ6FEjvJFuVjNNgujz?=
 =?iso-8859-1?Q?m76+MYoOrE0iUjsw54Ksi12jNo9bXz6Ify0yQofaBZ4doH6usobZmjV57K?=
 =?iso-8859-1?Q?D3h/Otw7WRKW3m9cT0X66sez6juijsekOq5SUM6+UBIYP5F+upy/kGWA2Z?=
 =?iso-8859-1?Q?rb6eH7foDayYr1we8qYksc6v634CsLbyk6uklmfyjEJ0WdGX0mcKJBpMMu?=
 =?iso-8859-1?Q?+ux2aOxAwBlyY8RRvCtuw4FD34/O9eHUSWH/mOfflmi7b77CvH7jtQ4IAT?=
 =?iso-8859-1?Q?X2CNcBoSqjOBCBg2YN2WXN7QKIjKT6MrEzRSz+iLRL9AhJ+kzEif6dabaQ?=
 =?iso-8859-1?Q?uv6hgk5pfdJY/uTHYffjKwyLLR0Lq5Np6HgeFtFmTp9jkjH9pz7XbI5Lkd?=
 =?iso-8859-1?Q?f8T4yvKEQZuN/FB03VTebC1hFYQf9BWmqFdAURinuGKjHx4izF1jYcced+?=
 =?iso-8859-1?Q?2tmDfBRdRTMFNGscAR4hpQqfub2HvT9n97XGqYAXuq50tz+tRxckikwmMR?=
 =?iso-8859-1?Q?8zAI5KIhqi0DCubIwNnKgEDZiM38tTCgtsYjzHSlgqkX9aJ4w7zfpxLRw+?=
 =?iso-8859-1?Q?qlJmuTZA0K0R7fJAjfVYysje6pfwQlaApSews65XUVWYUuxPLAAGgD2XMU?=
 =?iso-8859-1?Q?HlKV8bDzEh50SQFeg8G1cbINWPdQOxJZNUdCv/dA7pWt4lq8ZU0U1GBGeO?=
 =?iso-8859-1?Q?srAHjI0VYrGiPVyr/Z2GE9RytIe+tZMBYZfLtgwmRsq1+xipnTa1GAY6s/?=
 =?iso-8859-1?Q?N7YTXeiIoqGdxjH6gj80veyqFut34FoOtU/cE3RCMdWx+CdVycJ23ouvl8?=
 =?iso-8859-1?Q?7wgyCLl57KdvufMPYAeyGQbtutDEG8HreMdYJu/cTZZbAT8C3GUredFRHg?=
 =?iso-8859-1?Q?Vohtj4xa/0dos5nM3rvopzClQ0zlZyVJwL//TiDW8LGD7GaKihdRy4TKI2?=
 =?iso-8859-1?Q?QU8mEW/jDA675M/gUIA7QRqV8dulrDMifc8hBQn1ItAuQF2zWFX8a2KRW+?=
 =?iso-8859-1?Q?UTKS0d/iIS3iXCaXAL/n5SqWxCQo4Zo0IYKksTcCESrx0AxNBvswD9/9Qm?=
 =?iso-8859-1?Q?Gd/MELV1mjD4EkbPMnhKtOOKnhlpfvg+dojBMA5LyB1kuH6q6x7FOmKBAw?=
 =?iso-8859-1?Q?ELkUYxwLe0rJ8bgtji1cnGMvVGm2hn/nVBsw22iv8txrXoYbUjLJR1PUw0?=
 =?iso-8859-1?Q?TMDOxteVIm9h55BHeMSdP0QB1ZrbXZTmdp5ywsx3QTmwMQefRN+kal7XzR?=
 =?iso-8859-1?Q?4jEJBI6+yYE+jDtvV2EvfZoEpwCgSaewqTXwOG6Y4bUJHcQkRMZN2991cI?=
 =?iso-8859-1?Q?92eA1zIw2i54d3rmV7K40PmEIvexPbBL4rd9iP1oiTMlDV81os0hk/Mtv/?=
 =?iso-8859-1?Q?OJY3QF6QQ/D4IqLmKua8guEaF56QTPX8MPTbdd0I+7E3k5+tNMm553sDRA?=
 =?iso-8859-1?Q?S7fiHkR4rg=3D=3D?=
X-Exchange-RoutingPolicyChecked: rwTDU+ZXQlSGyxxdsZPFGBv45fPx8zAKlPz3WgYB+Vfh4CB/Qh5k5zQAMR2tEmRGieZcV61k04Ga9FDrmWZj02uTRtnAKhH1Dw7MStIv+OlR+yv85cLhAGkusNLybfnla60lqd073ACOO2CzN6ujVQwAjRagqD7j1NYjUopxyH/gy5geGUvso8ORPUQZ9EWQhj4fuKX+W2eV0jxxmlc/X11jRWteMBRc7uVJkxSwAP11hWUHJPg1RQ30cE00bzgtk4FHIXZ/4lVseaZRQiWWaW4HtM+8FHphSto241tuvco1i3sNIxdENGQXkfd52bj7M0rr4k3gRLV8vvgGJaB3bQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e752b26d-0bf3-48a1-36d8-08debd6036ae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 08:56:46.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqiaSHXArmxHQpKoD44m81pjko8N5VSMfMAEQn21fjuSG7Go3dB8cjpJycSUg71tKKllBd1UhaySYBaGAx/r6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
X-OriginatorOrg: intel.com



Hello,


this report is just FYI.

in the config for this test:
https://download.01.org/0day-ci/archive/20260529/202605291602.aff7d092-lkp@intel.com/config-7.1.0-rc2+
there is:
# CONFIG_PREEMPT_RT is not set


below is full report.


kernel test robot noticed a 50.7% regression of stress-ng.mutex.ops_per_sec on:


commit: dd29c017aed628076e915fe4cdfb5392fd4c5cab ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mutex
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.cyclic.ops_per_sec  24.5% regression |
| test parameters  | cpufreq_governor=performance                              |
|                  | method=itimer                                             |
|                  | nr_threads=100%                                           |
|                  | test=cyclic                                               |
|                  | testtime=60s                                              |
+------------------+-----------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605291602.aff7d092-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260529/202605291602.aff7d092-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mutex/stress-ng/60s

commit: 
  04f80f8b12 ("sched: Switch rq->next_class on proxy_resched_idle()")
  dd29c017ae ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")

04f80f8b12a02fa2 dd29c017aed628076e915fe4cdf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    122431 ±  2%     +75.5%     214822 ±  2%  stress-ng.mutex.nanosecs_per_mutex
  83537984 ±  2%     -50.7%   41168990 ±  3%  stress-ng.mutex.ops
   1392295 ±  2%     -50.7%     686172 ±  3%  stress-ng.mutex.ops_per_sec
  61961307           -80.4%   12130280 ± 11%  stress-ng.time.involuntary_context_switches
     17589            +6.7%      18771        stress-ng.time.percent_of_cpu_this_job_got
     10505            +8.7%      11422        stress-ng.time.system_time
     94.11 ±  2%     -52.6%      44.61 ±  4%  stress-ng.time.user_time
  31792837           -82.8%    5467214 ± 13%  stress-ng.time.voluntary_context_switches
 7.297e+08 ±  3%     -20.0%  5.836e+08 ±  6%  cpuidle..time
   7504726 ±  2%     -97.7%     169892 ±  2%  cpuidle..usage
      5.47            +2.8        8.24 ±  4%  mpstat.cpu.all.idle%
      3.76 ±  2%      -3.4        0.38 ±  5%  mpstat.cpu.all.irq%
      0.06 ±  3%      -0.1        0.00 ± 33%  mpstat.cpu.all.soft%
      1.14 ±  3%      -0.7        0.42 ±  4%  mpstat.cpu.all.usr%
   1663498 ± 32%     -84.8%     252442 ± 12%  numa-numastat.node0.local_node
   1765403 ± 32%     -82.2%     314101 ±  2%  numa-numastat.node0.numa_hit
   1495124 ± 38%     -84.7%     228979 ± 13%  numa-numastat.node1.local_node
   1589196 ± 37%     -76.9%     367155 ±  3%  numa-numastat.node1.numa_hit
  11584135           -63.1%    4268754        vmstat.memory.cache
    239.87           +31.5%     315.47        vmstat.procs.r
   1612425           -71.2%     464479 ± 13%  vmstat.system.cs
   1346465           -35.8%     864394 ±  5%  vmstat.system.in
    455.50 ± 25%     -91.4%      39.33 ± 22%  perf-c2c.DRAM.local
     11832 ± 24%     -96.5%     413.00 ± 11%  perf-c2c.DRAM.remote
     34487 ± 28%     -98.7%     459.67 ± 10%  perf-c2c.HITM.local
      9397 ± 24%     -96.2%     354.33 ± 11%  perf-c2c.HITM.remote
     43884 ± 27%     -98.1%     814.00 ±  9%  perf-c2c.HITM.total
      6.01 ±  3%      -2.1        3.93 ± 45%  turbostat.C1%
      5.49 ±  3%     -28.5%       3.92 ± 45%  turbostat.CPU%c1
  85685316           -68.1%   27369485 ± 44%  turbostat.IRQ
   8044027           -22.4%    6238674 ± 45%  turbostat.NMI
     17.67           -17.8%      14.53 ± 44%  turbostat.RAMWatt
    192382          +525.9%    1204140 ± 36%  perf-stat.i.cpu-clock
      0.23 ±142%   +1094.0%       2.70 ± 70%  perf-stat.i.major-faults
      7047 ± 17%    +282.2%      26931 ± 20%  perf-stat.i.minor-faults
      7047 ± 17%    +282.2%      26934 ± 20%  perf-stat.i.page-faults
    192382          +525.9%    1204176 ± 36%  perf-stat.i.task-clock
   1659840           -86.8%     219060 ± 24%  perf-stat.ps.context-switches
    440129 ±  2%     -90.3%      42896 ± 27%  perf-stat.ps.cpu-migrations
      6827 ± 17%     -69.1%       2109 ± 35%  perf-stat.ps.minor-faults
      6827 ± 17%     -69.1%       2109 ± 35%  perf-stat.ps.page-faults
   8414745           -87.1%    1084149        meminfo.Active
   8414714           -87.1%    1084117        meminfo.Active(anon)
    756769            -7.6%     699135        meminfo.AnonHugePages
   1141093            -7.8%    1052032        meminfo.AnonPages
  11370849           -63.7%    4126678        meminfo.Cached
  12667118           -61.8%    4845108        meminfo.Committed_AS
    156321           -12.5%     136739        meminfo.KReclaimable
    469540 ±  6%     -77.1%     107321 ±  4%  meminfo.Mapped
  15939063           -46.8%    8473455        meminfo.Memused
    156321           -12.5%     136739        meminfo.SReclaimable
   7280155           -99.5%      36009 ± 19%  meminfo.Shmem
  16088016           -46.3%    8645299        meminfo.max_used_kB
   4142244 ± 35%     -89.8%     423565 ± 52%  numa-meminfo.node0.Active
   4142225 ± 35%     -89.8%     423547 ± 52%  numa-meminfo.node0.Active(anon)
    266266 ± 38%     -67.0%      87783 ±  4%  numa-meminfo.node0.Mapped
   3897747 ± 37%     -99.8%       9633 ± 47%  numa-meminfo.node0.Shmem
   4282655 ± 35%     -84.7%     653838 ± 32%  numa-meminfo.node1.Active
   4282642 ± 35%     -84.7%     653824 ± 32%  numa-meminfo.node1.Active(anon)
    891410 ±  7%     -29.6%     627760 ± 35%  numa-meminfo.node1.AnonPages
    927124 ±  8%     -28.1%     666546 ± 33%  numa-meminfo.node1.AnonPages.max
   5283722 ± 53%     -98.5%      80849 ±135%  numa-meminfo.node1.FilePages
     82055 ± 29%     -47.2%      43290 ± 35%  numa-meminfo.node1.KReclaimable
    205816 ± 56%     -89.9%      20793 ± 34%  numa-meminfo.node1.Mapped
   7685906 ± 38%     -72.0%    2153232 ± 17%  numa-meminfo.node1.MemUsed
     82055 ± 29%     -47.2%      43290 ± 35%  numa-meminfo.node1.SReclaimable
   3392847 ± 45%     -99.2%      26506 ± 30%  numa-meminfo.node1.Shmem
   1035914 ± 35%     -89.8%     105497 ± 51%  numa-vmstat.node0.nr_active_anon
     66703 ± 38%     -67.2%      21869 ±  4%  numa-vmstat.node0.nr_mapped
    974835 ± 37%     -99.8%       2388 ± 46%  numa-vmstat.node0.nr_shmem
   1035910 ± 35%     -89.8%     105496 ± 51%  numa-vmstat.node0.nr_zone_active_anon
   1765534 ± 32%     -82.2%     314433 ±  3%  numa-vmstat.node0.numa_hit
   1663629 ± 32%     -84.8%     252773 ± 12%  numa-vmstat.node0.numa_local
   1071000 ± 35%     -84.7%     163351 ± 33%  numa-vmstat.node1.nr_active_anon
    222784 ±  7%     -29.8%     156346 ± 36%  numa-vmstat.node1.nr_anon_pages
   1321330 ± 53%     -98.4%      20714 ±134%  numa-vmstat.node1.nr_file_pages
     51564 ± 56%     -89.1%       5634 ± 45%  numa-vmstat.node1.nr_mapped
    848611 ± 45%     -99.2%       7129 ± 38%  numa-vmstat.node1.nr_shmem
     20515 ± 29%     -47.2%      10831 ± 35%  numa-vmstat.node1.nr_slab_reclaimable
   1070997 ± 35%     -84.7%     163350 ± 33%  numa-vmstat.node1.nr_zone_active_anon
   1589301 ± 37%     -76.9%     367554 ±  3%  numa-vmstat.node1.numa_hit
   1495229 ± 38%     -84.7%     229379 ± 13%  numa-vmstat.node1.numa_local
   2104201           -87.2%     270347        proc-vmstat.nr_active_anon
    285274            -8.0%     262490        proc-vmstat.nr_anon_pages
   6055069            +3.1%    6241788        proc-vmstat.nr_dirty_background_threshold
  12124944            +3.1%   12498839        proc-vmstat.nr_dirty_threshold
   2843227           -63.7%    1031516        proc-vmstat.nr_file_pages
  60921938            +3.1%   62791869        proc-vmstat.nr_free_pages
  60844285            +3.0%   62661195        proc-vmstat.nr_free_pages_blocks
     42156            -3.1%      40855        proc-vmstat.nr_kernel_stack
    117492 ±  6%     -77.2%      26844 ±  5%  proc-vmstat.nr_mapped
   1820554           -99.5%       8848 ± 21%  proc-vmstat.nr_shmem
     39080           -12.6%      34150        proc-vmstat.nr_slab_reclaimable
   2104201           -87.2%     270347        proc-vmstat.nr_zone_active_anon
    160577 ± 48%     -98.9%       1782 ± 53%  proc-vmstat.numa_hint_faults
    136651 ± 57%     -98.9%       1458 ± 59%  proc-vmstat.numa_hint_faults_local
   3357291           -79.6%     684548        proc-vmstat.numa_hit
   3161259           -84.7%     484712        proc-vmstat.numa_local
     16807 ± 47%     -98.1%     324.17 ± 63%  proc-vmstat.numa_pages_migrated
    173687 ± 47%     -97.3%       4674        proc-vmstat.numa_pte_updates
   3507405           -76.5%     824225        proc-vmstat.pgalloc_normal
    577848 ± 15%     -47.6%     302746 ±  2%  proc-vmstat.pgfault
    510633 ±  4%     -14.7%     435432 ±  6%  proc-vmstat.pgfree
     16807 ± 47%     -98.1%     324.17 ± 63%  proc-vmstat.pgmigrate_success
     33009 ± 22%     -57.0%      14180 ±  2%  proc-vmstat.pgreuse
      0.18 ±  9%     +27.7%       0.24 ± 12%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.18 ±  9%     +27.7%       0.24 ± 12%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      8069 ± 57%    +241.5%      27554 ± 39%  sched_debug.cfs_rq:/.load.avg
    541768          +112.9%    1153311 ± 16%  sched_debug.cfs_rq:/.load.max
     56659 ± 28%    +147.8%     140379 ± 20%  sched_debug.cfs_rq:/.load.stddev
      1.00           +58.3%       1.58 ± 11%  sched_debug.cfs_rq:/.nr_queued.max
      0.18 ±  9%     +32.0%       0.24 ± 13%  sched_debug.cfs_rq:/.nr_queued.stddev
    512.00         +2893.2%      15325 ±136%  sched_debug.cfs_rq:/.removed.load_avg.max
    263.17 ±  2%     +40.0%     368.42 ± 29%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    263.17 ±  2%     +38.8%     365.25 ± 29%  sched_debug.cfs_rq:/.removed.util_avg.max
     89.41 ±  9%     +94.7%     174.11 ± 11%  sched_debug.cfs_rq:/.runnable_avg.avg
    899.00 ± 14%     +47.7%       1328 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
    171.19 ± 11%     +66.7%     285.38 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    727143           +25.7%     914236        sched_debug.cpu.avg_idle.avg
     32319 ± 42%    +289.9%     126004 ± 50%  sched_debug.cpu.avg_idle.min
    243831 ±  6%     -35.3%     157840 ± 10%  sched_debug.cpu.avg_idle.stddev
    629.39           -21.0%     497.13 ±  6%  sched_debug.cpu.clock_task.stddev
      4472           -90.9%     407.17 ± 54%  sched_debug.cpu.curr->pid.avg
      9062            -6.3%       8493        sched_debug.cpu.curr->pid.max
      0.68 ±  4%     -90.9%       0.06 ± 53%  sched_debug.cpu.nr_running.avg
      2.33 ± 10%     -32.1%       1.58 ± 21%  sched_debug.cpu.nr_running.max
      0.55 ±  3%     -53.5%       0.25 ± 26%  sched_debug.cpu.nr_running.stddev
    264436           -81.9%      47857 ± 11%  sched_debug.cpu.nr_switches.avg
    351496 ±  4%     -73.8%      92003 ±  8%  sched_debug.cpu.nr_switches.max
    204437 ±  8%     -87.4%      25742 ± 16%  sched_debug.cpu.nr_switches.min
     40064 ± 26%     -67.5%      13025 ±  4%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 46%    +656.2%       0.05 ± 21%  sched_debug.dl_rq:.dl_nr_running.avg
      0.06 ± 26%    +169.6%       0.15 ±  9%  sched_debug.dl_rq:.dl_nr_running.stddev
      0.67 ±  4%     -98.3%       0.01 ±141%  sched_debug.rt_rq:.rt_nr_running.avg
      1.92 ±  9%     -82.6%       0.33 ±141%  sched_debug.rt_rq:.rt_nr_running.max
      0.43           -89.4%       0.05 ±141%  sched_debug.rt_rq:.rt_nr_running.stddev


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/method/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/itimer/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/cyclic/stress-ng/60s

commit: 
  04f80f8b12 ("sched: Switch rq->next_class on proxy_resched_idle()")
  dd29c017ae ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")

04f80f8b12a02fa2 dd29c017aed628076e915fe4cdf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.326e+08           -24.5%  1.001e+08 ±  3%  stress-ng.cyclic.ops
   2209225           -24.5%    1667869 ±  3%  stress-ng.cyclic.ops_per_sec
      2723 ±  3%     +57.8%       4297 ±  8%  stress-ng.time.involuntary_context_switches
      1383 ±  2%     +51.1%       2090        stress-ng.time.percent_of_cpu_this_job_got
    746.65 ±  3%     +56.6%       1169        stress-ng.time.system_time
 1.326e+08           -24.5%  1.001e+08 ±  3%  stress-ng.time.voluntary_context_switches
    185499 ± 18%     -29.7%     130318 ±  9%  numa-meminfo.node0.SUnreclaim
     46376 ± 18%     -29.7%      32579 ±  9%  numa-vmstat.node0.nr_slab_unreclaimable
    119846            -9.7%     108272        uptime.idle
 1.299e+10 ±  2%     -86.7%   1.73e+09 ± 10%  cpuidle..time
 1.434e+08           -72.9%   38905147 ± 15%  cpuidle..usage
    185.17 ± 19%    +503.1%       1116 ± 15%  perf-c2c.DRAM.local
     15049 ±  9%    +787.8%     133612 ±  8%  perf-c2c.DRAM.remote
      7338 ± 10%    +819.8%      67498 ±  8%  perf-c2c.HITM.local
      9511 ± 11%    +634.1%      69819 ±  7%  perf-c2c.HITM.remote
     16849 ±  9%    +715.0%     137318 ±  7%  perf-c2c.HITM.total
     88.18           -51.7       36.43 ±  9%  mpstat.cpu.all.idle%
      5.68 ±  6%     +21.3       27.02 ±  2%  mpstat.cpu.all.irq%
      0.27 ±  2%      +0.3        0.61 ± 10%  mpstat.cpu.all.soft%
      4.93 ±  3%     +28.0       32.96 ±  7%  mpstat.cpu.all.sys%
      0.95 ±  2%      +2.0        2.98 ±  4%  mpstat.cpu.all.usr%
     13.75 ±  3%    +422.8%      71.88 ±  5%  mpstat.max_utilization_pct
   4349738           -24.1%    3301294 ±  3%  perf-stat.i.context-switches
      5133 ± 24%    +174.8%      14108 ±  4%  perf-stat.i.cpu-migrations
      8760 ±  5%     +16.1%      10171 ± 16%  perf-stat.i.minor-faults
      8760 ±  5%     +16.1%      10171 ± 16%  perf-stat.i.page-faults
   4278510           -24.5%    3230305 ±  3%  perf-stat.ps.context-switches
      5048 ± 24%    +175.7%      13919 ±  4%  perf-stat.ps.cpu-migrations
     88.48           -56.6%      38.41 ±  7%  vmstat.cpu.id
     10.61 ±  4%    +452.9%      58.67 ±  5%  vmstat.cpu.sy
  11022070           -38.2%    6806541 ±  7%  vmstat.memory.cache
     28.03 ±  6%     +26.8%      35.53 ±  4%  vmstat.procs.r
   4125078           -23.1%    3172394 ±  3%  vmstat.system.cs
   2451475           -20.5%    1948155 ±  3%  vmstat.system.in
   7840060 ±  2%     -52.5%    3722855 ± 15%  meminfo.Active
   7840030 ±  2%     -52.5%    3722823 ± 15%  meminfo.Active(anon)
  10777487           -38.6%    6620517 ±  7%  meminfo.Cached
  12341767           -33.1%    8256625 ±  6%  meminfo.Committed_AS
    164951            -6.7%     153849        meminfo.KReclaimable
    486167 ± 13%     -31.8%     331454 ± 18%  meminfo.Mapped
  15528823           -26.0%   11494524 ±  5%  meminfo.Memused
    164951            -6.7%     153849        meminfo.SReclaimable
   6686934           -62.2%    2529965 ± 19%  meminfo.Shmem
  15719893           -26.4%   11571834 ±  5%  meminfo.max_used_kB
   1960224 ±  2%     -52.4%     932360 ± 15%  proc-vmstat.nr_active_anon
   6165572            +1.6%    6266159        proc-vmstat.nr_dirty_background_threshold
  12346220            +1.6%   12547641        proc-vmstat.nr_dirty_threshold
   2694591           -38.5%    1656705 ±  7%  proc-vmstat.nr_file_pages
  61977276            +1.6%   62984623        proc-vmstat.nr_free_pages
  61815520            +1.6%   62825650        proc-vmstat.nr_free_pages_blocks
    121600 ± 13%     -31.5%      83270 ± 18%  proc-vmstat.nr_mapped
   1671954           -62.1%     634068 ± 19%  proc-vmstat.nr_shmem
     41239            -6.7%      38470        proc-vmstat.nr_slab_reclaimable
    117718            -3.3%     113792        proc-vmstat.nr_slab_unreclaimable
   1960224 ±  2%     -52.4%     932360 ± 15%  proc-vmstat.nr_zone_active_anon
   3537898 ±  3%     -42.0%    2050618 ±  9%  proc-vmstat.numa_hit
   3137152 ±  4%     -47.3%    1653712 ± 11%  proc-vmstat.numa_local
   3898926           -41.2%    2293957 ±  9%  proc-vmstat.pgalloc_normal
   1141747 ±  5%     -32.1%     775361 ± 10%  proc-vmstat.pgfree
     36360 ±  2%     -10.0%      32721        proc-vmstat.pgreuse
    563.67 ±  4%    +360.0%       2593        turbostat.Avg_MHz
     19.98 ±  4%     +69.6       89.54        turbostat.Busy%
      2821            +2.6%       2895        turbostat.Bzy_MHz
      0.03 ± 17%      +0.0        0.06 ± 13%  turbostat.C1%
     71.82 ±  2%     -64.5        7.32 ± 15%  turbostat.C1E%
      9.14 ± 22%      -5.9        3.28 ±  5%  turbostat.C6%
     59.26           -96.4%       2.12 ± 20%  turbostat.CPU%c1
      5.02 ± 33%     -42.4%       2.89 ±  6%  turbostat.CPU%c6
     55.33 ±  5%     +23.8%      68.50 ±  7%  turbostat.CoreTmp
      0.30 ±  4%     -70.2%       0.09        turbostat.IPC
 1.574e+08           -22.1%  1.226e+08 ±  3%  turbostat.IRQ
   2707717 ±  2%    +211.2%    8426390 ±  3%  turbostat.NMI
      0.77 ± 85%     -86.8%       0.10 ±158%  turbostat.Pkg%pc2
     61.00 ±  3%     +16.9%      71.33 ±  4%  turbostat.PkgTmp
    426.05           +34.8%     574.16        turbostat.PkgWatt
     19.05            +7.9%      20.54        turbostat.RAMWatt
      2887 ±  5%     +18.0%       3405 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.avg
    124.94 ± 57%    +145.2%     306.40 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.min
      3.86 ±223%    +793.7%      34.51 ± 50%  sched_debug.cfs_rq:/.left_deadline.avg
      3.86 ±223%    +789.0%      34.31 ± 50%  sched_debug.cfs_rq:/.left_vruntime.avg
      3.86 ±223%    +789.0%      34.31 ± 50%  sched_debug.cfs_rq:/.right_vruntime.avg
    148.15 ±  2%     +20.8%     178.99 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
 -45447168         -7551.4%  3.386e+09 ± 57%  sched_debug.cfs_rq:/.sum_w_vruntime.avg
 7.257e+08 ±223%   +4278.1%  3.177e+10 ± 61%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
    146.20 ±  2%     +15.0%     168.13 ±  6%  sched_debug.cfs_rq:/.util_avg.stddev
      7.89 ±  6%     +92.5%      15.20 ± 21%  sched_debug.cfs_rq:/.util_est.avg
     72.73 ±  4%     +42.4%     103.58 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
      2887 ±  5%     +18.0%       3405 ±  6%  sched_debug.cfs_rq:/.zero_vruntime.avg
    124.94 ± 57%    +145.2%     306.40 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.min
     22127 ±  2%    +146.7%      54579 ±  2%  sched_debug.cpu.avg_idle.min
    193969 ±  9%     -28.7%     138382 ±  7%  sched_debug.cpu.avg_idle.stddev
     15.74 ±  3%    +217.6%      49.99 ± 19%  sched_debug.cpu.clock.stddev
    780.35 ± 12%    +497.0%       4658 ±  2%  sched_debug.cpu.curr->pid.avg
      2511 ±  5%     +17.1%       2941 ±  3%  sched_debug.cpu.curr->pid.stddev
      0.00 ±  4%    +199.9%       0.00 ± 18%  sched_debug.cpu.next_balance.stddev
      1.00           +50.0%       1.50        sched_debug.cpu.nr_running.max
    510666           -24.4%     385912 ±  3%  sched_debug.cpu.nr_switches.avg
    608446 ±  3%     -30.8%     421159 ±  2%  sched_debug.cpu.nr_switches.max
     68790 ±131%    +405.2%     347530 ±  6%  sched_debug.cpu.nr_switches.min
     94965 ± 20%     -81.2%      17852 ± 49%  sched_debug.cpu.nr_switches.stddev
      3.73 ±  6%     +43.9%       5.36 ± 28%  sched_debug.cpu.nr_uninterruptible.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

