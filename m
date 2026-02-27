Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1023290CA
	for <oe-lkp@lists.linux.dev>; Fri, 27 Feb 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178133; cv=fail; b=gqV0A4hyUrCyHikv1aWWWnCM9zWgpfxZ4TQeFyKKENoFhtCc9xI7/rkDcmpeg4b9XQ/+S6LeUm47KPtpSj6SYDVh34/URJ4LlzOiBhv8tVwi7vkzyvp42yccdoszygc6SvfOIOPa1z2K+pL89+fS7WHkj69UgkiiXgwDdi61a+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178133; c=relaxed/simple;
	bh=8lqDT22/gD9HpNTpJWD8gyZ1yhKEqdoqUcHoAv2uT5o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N3k/3MEqD13iWJoZ4/+CPfFA08EQwdkwYwnJhYwORKz9QGn8+uy19g4pX+9CUexyAEuEOuQZGQh9QDIso2I4jfgXVrNmrdpj+nCecS9wz202dJuu5t0gL2i9WDqYo+DEpGqSTc7PleyO+sZVXCF2S+7224j/T6N0i3Zh1wTxFNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7RWwtZ6; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7RWwtZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772178131; x=1803714131;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=8lqDT22/gD9HpNTpJWD8gyZ1yhKEqdoqUcHoAv2uT5o=;
  b=M7RWwtZ6AYlTK92uqaGc5O4iNCtQpoybOiqYxrOxwlfwYtVk+hJDxYKS
   GI7X/3LCkxcrK7M+ZHmfR9bMbaVVQjW+553MnBnOh3wh9lleg7koeR63Y
   kjshS3OFXg7gxMG5+WxjCdY7UkAxvYqimZgaeqGyn+VlfSEUvPW6ftObV
   rpaKNzAX4pY0Sf8tNw/q11nZqUx4WpqhPl7XIsb34LMt+aCs4BWlZrsqU
   XLEFHrxI+zNvU8bkZUtROvYcsZWpmDzLr7aetNsY+tG1rigluDofYjQTB
   9YMdurobL3sLq7/IKdwRA6uYDs0YN4elbyWGCxnpj/AJTv9QbidbZB7QA
   g==;
X-CSE-ConnectionGUID: q+fRfcr4RyaNUqRZhBgEmw==
X-CSE-MsgGUID: x/7cytetTsuPm1oyH71NLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90659811"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="90659811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:42:11 -0800
X-CSE-ConnectionGUID: sN9zAdzvTaevosU5wZYcyw==
X-CSE-MsgGUID: n18KJVGWTRed5WmSGyNFoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="220972640"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:42:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 23:42:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 23:42:10 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 23:42:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xruyKg/bR5KPymHCeF/43lsWhajSBh+NShPpJ8ywHvHcP8XREh+FpATY1otmVVISkOx21r2O5el5zRKiyJy6cm+BIPfP9SGAfDdASepaHf/Gxql9KIjNapZV93sNs+wKO5ZNpqlX94gWIwGY/+GE8KRxDIxqp8b4g8RpnDkYObvmGLAoFryk0rXtlvN/wbDo4lY6i/qJXb5ZhiDyqdS2H6y+tcDDwgooHYIcDemIZ4/tiDGDC0iIDUotTz+z/bAQdEX8xMM9MJZKXP1QIeuw1irTUoKYNJMvps1ERQwh99XK738F3rmW8IlPcRNuWosuJvTw02ddKA4Uvr/iL+GhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26IFF2maTh9um6EzogiFEfRuxeyYt5TUQNmqOOyYfIE=;
 b=vd4ULo3Dum4xLoE6CjjS7ljFX5CTi63s4cr5rbF1NKF91wxJKeHj855jc8vO3elki1hgPo1WKo3LimNwtDbzUy6hcJrahGZfDKrkzR58ThN3/jG9v2InZZBuu06sGfzw6tE1NhwNwUUWECrABOevnyYq8S4GN1u/SXT8mI8tTnDS1tzztYhw9+rKNga1BxIsACSOCQ+pogJgk2+wL9Aek0XyuvCo61BXtqCxhn6GuqQvL4DSQMFR+qUdZCCuJTwIvZ9XOsL0JnrhQbvmmfwGP/B/2vZ3SRUXGcKMALnKZzKLdpXJ8sDEDl89vQRZ1ISsm4JmShMBpuJT0DZS8/xkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PPF4C5964328.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 27 Feb
 2026 07:42:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:42:08 +0000
Date: Fri, 27 Feb 2026 15:41:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Christian Brauner <brauner@kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [ns]  c0aac5975b: stress-ng.bind-mount.ops_per_sec
 5.0% improvement
Message-ID: <202602271512.37537e7e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU0P306CA0011.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PPF4C5964328:EE_
X-MS-Office365-Filtering-Correlation-Id: af56570c-1933-4c33-f6a5-08de75d3b5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 12Vi7g52hp1T6pW+EK4r8boOGqSLQ8CsqzANgPWPJDoi+0y2Dv4X1AFYVDyE7m01eK3X9l8pilvlmLz8m9xE7JV6qDCoLhOSlndY7p6VCzL0o/verk9ER6vW/ZKXZVIAbJ9v5NaELWyVyKXxAisNXaBvlAu1NbdKZW5uV7uSENuxkrqcKBHCO6bI56K4Mq2aIOQc5PWMb2unszx5MW63O3D9ap2v6uX2EhT8Nkbcsxx1BMBRFNANPvMSlTfNqJDmYpXKNR+KGX9Mt2fLsKNKCjhKHuIcloBGQipoGZyDyDx1rWKXJvkea230/JhLB3XQME5Wq5hVW+rcpqoKWm670ROWkF4bGrnyCE0ALNfgQVj5DK4OjCL8lyqjX8CnGmtsmQJOUQT45BkY6uL2/Jq0QRdOL6r0+MCYC2fTirzdHipE0dmTN2EwLnR3lyOZt2y306ty2mwxaDvhwk/Q02d5vK+Llc33/KfuNz1u4d5KTJJLDtvJ9BasTAXgsdTvIoZXf/m+Eo8BWbCy2vLSfpvKTVwW0ns1++qVWdYsRvnRaMbaZCFSIPNHmVSpQKwDkSOrPdeUcAlGWyDD2qN0RiTyiZJA+LfGY7+ulosBjRvajpyz9w4SsMgkMhaMBFtkOUZWZGSg87ldb0baP8c0vdF+JT3jrWHlAovbql/FpOK4wCi9wYkI6uyZPxRJvIxdfwI1bkdJ8DHIdW6J2ahkhV7qyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HeDGTh/AtgojNsb+iguoYybJYaWPMrzHwU04XYxH5qrM6nfPWbaEihS667?=
 =?iso-8859-1?Q?sSSEXcoHbWSlw65nMk8jME0jdfXmmGI8pIroljVzn44bxAxY0Jn23CuOlE?=
 =?iso-8859-1?Q?77C8IAQMxjAKZ73tiaqceatSDZPwCL01uKfAd1UrYpqDOONr0dybGqfhSC?=
 =?iso-8859-1?Q?JpSDHyvuimc/epnOaZ9Tly9SZLirqwjVkHoWcw6HsePlskenfgPy7bfiud?=
 =?iso-8859-1?Q?CuUGnMONtZFO3iWXZV7xpinUcw43Eu1i5F18jvtueRu7msP7RiT994ZBW9?=
 =?iso-8859-1?Q?VZCRTJXPafmQQZHjU0bnZX7WhsaJS8XOwn3WDgCbkv/PaifuFinkwwl+pg?=
 =?iso-8859-1?Q?JDIWoeVtmlOab8RcL90wUSvTlhmISRMECIiULEuQuYjPD8a9eokbSlg63I?=
 =?iso-8859-1?Q?l26uIFGWQcm8TEbdqcET6cxupfZXxOUX2DrGMTN+D6/m1+hZl6/OoCteGr?=
 =?iso-8859-1?Q?K+hs7XVNdiDDARbOdpBH8FfmYGZA0tNphmacjHnhFA1Ndhpr0Gv5u2VxmO?=
 =?iso-8859-1?Q?TMgLJ5pfXACrfOGHald9UKKEzbFsstbHMcfCHAG19Vc+ms7x8c1qJyFEZt?=
 =?iso-8859-1?Q?SvdLCM2aeII+dk1r1xDpcaiA28cW0vRSxtP69a5v/su/MpLgOx9TkUnn5z?=
 =?iso-8859-1?Q?I1mgicPKavYxMb6NDq5Wriw63y+bnxOKO5dILI5+FD4/tI5CQDJ4cfEZwH?=
 =?iso-8859-1?Q?4VhXii3+exLOH9cTGzDTT3eKiHwKiBN1jCIncDd6rR7xRoOF/K7gAclgx3?=
 =?iso-8859-1?Q?5qLVuljRIu61mgWniHeEJHaxi22nJf/NvsF8OJl5Ok0661KOXzSzWmkHFn?=
 =?iso-8859-1?Q?elpKH1Bd7Pci3wDoDsPn82xlel1h42wka14JB4ggHVvqoGI7Fg2xx1gX2P?=
 =?iso-8859-1?Q?iaHNJs0WTbTkD5NehM2SUZ2thBg4fG8LgrPJP9zTNmM9n7P1puIlHo3q6p?=
 =?iso-8859-1?Q?AQ3ykoZa/JJ2fQ2eX2xRZQimLhpxCeG74nOI5+MGr1Rph7wQzWbENNXkkQ?=
 =?iso-8859-1?Q?DNuydG0UW34U7KM8QLmtG9hGbnZ/ZNcswfm16euKhltAVxFQWeAfbJ3fZN?=
 =?iso-8859-1?Q?Zv+gmz+K59xgcueiOkzvwUOmzuIgkgvlu2x6E+xB2cKww9kjBnQh0GXJJO?=
 =?iso-8859-1?Q?sdzzj1q6mUMdJMgu1SkhMklLKms9Sd8uc7H3KWhFZZUUQUiep3N8uoJ2Ao?=
 =?iso-8859-1?Q?0lSuROvovuBDYvV4j0tB6PFZXsK/RA7CHyZU8WREb2y/uR3Z1w1kXY0AjR?=
 =?iso-8859-1?Q?UD74T/kRDQ/NzFG4VY6wkpJX3EnPV8HiX90tq8OWDlSLnyQ2/l+no0Ytdj?=
 =?iso-8859-1?Q?T3AVHnQQ76MnzM7Rlv16nZqaTYFexap81aSnj72OqNkg5eU0usee7AdvWt?=
 =?iso-8859-1?Q?EtM63oGC7q68eJkuxVnde9vip1XBETGLyyz7unIdunCXlVveTyt+awnFzC?=
 =?iso-8859-1?Q?flvU4MTYEnDz4Qk1T2hIAFbn14Z5p4kEP5jlmwe62uB/G24e3DCRt0H7oF?=
 =?iso-8859-1?Q?q/6d7yzhmTgw0lps7iC25e05N6nsfCfCutLknoP87wNjSfq4ismP0fGO6d?=
 =?iso-8859-1?Q?4pZG7Vgv6qdQ0kURiXS797twbcorZ8DO7e3QfKZZ61EpLzDapS/Ro9RK1a?=
 =?iso-8859-1?Q?RCgiZMi680uUteFe7719qjsicj/jL+E2w5nD91QRhp1DJpaXnc33niKJGr?=
 =?iso-8859-1?Q?Li3K52NgB1Rjh3OU9qTT+BdCEOPMk18z9NxFyINdhPIRw6Y6QBb05mmPI4?=
 =?iso-8859-1?Q?hBaT25LE5hX+MEYVwQk78urFStZsz5EIPjBhkl1RoeO3CChApYpgpol9Me?=
 =?iso-8859-1?Q?lNfSjA6tvw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af56570c-1933-4c33-f6a5-08de75d3b5f5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:42:08.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOLVi8uE4Tg3F5cNcUb1h585lPlGtMT8pFl8iz8gOoe8ySI/ZrGUTChAbtCjYjxYhWggmXmak25m2P4F0VBvmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C5964328
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.0% improvement of stress-ng.bind-mount.ops_per_sec on:


commit: c0aac5975bafc86f6817b14e9f71dcb5064a9183 ("ns: pad refcount")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	disk: 1HDD
	testtime: 60s
	fs: xfs
	test: bind-mount
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260227/202602271512.37537e7e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/1HDD/xfs/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp8/bind-mount/stress-ng/60s

commit: 
  887e97745e ("fs: track the inode having file locks with a flag in ->i_opflags")
  c0aac5975b ("ns: pad refcount")

887e97745ec336c2 c0aac5975bafc86f6817b14e9f7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      2345            -3.9%       2254        stress-ng.bind-mount.microsecs_per_mount
      3070            -5.5%       2902        stress-ng.bind-mount.microsecs_per_umount
    704181            +4.9%     739032        stress-ng.bind-mount.ops
     11736            +5.0%      12318        stress-ng.bind-mount.ops_per_sec
     10287            +6.3%      10937 ±  3%  stress-ng.time.involuntary_context_switches
   1810201            +4.6%    1893350        stress-ng.time.voluntary_context_switches
      1.54            +0.1        1.62        mpstat.cpu.all.soft%
    157837            +5.0%     165680        vmstat.system.cs
    179327            +3.9%     186257        vmstat.system.in
 2.772e+09            +3.3%  2.863e+09 ±  2%  perf-stat.i.branch-instructions
  64587234            +2.2%   65980821        perf-stat.i.cache-references
    163281            +5.0%     171502        perf-stat.i.context-switches
 1.305e+10            +3.4%   1.35e+10 ±  2%  perf-stat.i.instructions
      0.45            +2.6%       0.46        perf-stat.i.ipc
      2.48            +5.1%       2.61        perf-stat.i.metric.K/sec
 2.728e+09            +3.3%  2.818e+09 ±  2%  perf-stat.ps.branch-instructions
  63500861            +2.2%   64868461        perf-stat.ps.cache-references
    160406            +5.0%     168462        perf-stat.ps.context-switches
 1.285e+10            +3.4%  1.329e+10 ±  2%  perf-stat.ps.instructions
 7.871e+11            +3.5%  8.143e+11 ±  2%  perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

