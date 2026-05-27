Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C375809
	for <oe-lkp@lists.linux.dev>; Wed, 27 May 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850799; cv=fail; b=nlxkEGQ0VFv7MKh70lkYDFTWBhZdj5hoqhKCyCaT2urh/uj0gjywtx9xz+CChxeeUEYbw6iLO5n0DM0NZZH0BuxOOU4AWx/8JIJmmizMcRau9e5O8cweTPYThDeJwCQxos6pEXhuJSoU0vbEXr38pMxsuE0SUgxpoj3JEM86SRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850799; c=relaxed/simple;
	bh=gxEInaUgm9yT2Zf8FevMwAQ7hxPPkGtcxKZgdS1vFoE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XkgzD3GMZRxIvjNolhF7OKbqTTzYj/aG/+YwomtJV7GulwkrtA8pXS+axfSni7Sw+M2mhPL5yTeXNnM6ejbitj0q12/yj2sWoMnUR3rW2SsI18Z94Sa6KAJbthL2515FnVv82fpJQtv8bZ/AmQ5wJFNIIdeYjmGPYbSMUc+eNns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euTPoFOx; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euTPoFOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779850796; x=1811386796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxEInaUgm9yT2Zf8FevMwAQ7hxPPkGtcxKZgdS1vFoE=;
  b=euTPoFOxvi62NLX5aREXjGGGThtf/avXVCsrUV3XPJJ/PqiwIhKfeMJa
   Sg1wZXlkttoV2Xfk8lsqcIQTfUSn47ccKcOu6tEYPyQ5Y1MJbj1ihOX+I
   s+9PnixTv4g46DEoWg6QmmjL7mP0f6miGv0Idg+eNkmBDSsmAGrLfwUpG
   qMoWpzrbzB3CPTzn0yYYs60wvDhaFTXuSL41nWGYdFfSQ7BFJ3Pqci3FI
   aQIBZg1YqFvTVlVYI6fMnThNVjQLXgsOzexTxJge3Ysb030aLi0Lp+dLM
   FalvRSsB+po82YtCDtkMvRsoFe9tscvWVY6an3Bb53M9UZwWnieUEjmOn
   Q==;
X-CSE-ConnectionGUID: /ErU3uy5SDCXFS+b/P/Hog==
X-CSE-MsgGUID: HyXVaXLRRrS/PUlIb+yziw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98250342"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="98250342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:59:55 -0700
X-CSE-ConnectionGUID: V6hy9gYqQKKJcX5JqbEvzQ==
X-CSE-MsgGUID: A/QNJrQBR3+VzcFrlvATSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241266752"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:59:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 19:59:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 19:59:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 19:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX9OFdAzX2C2g8K8NQhfvKsy2boDQ7fh5OK8pHvs0WW+lIIoXx/18fcEzYaGHdmAAf3EqNiPHbS+g6uUcgcsDjwINYP1x2+7mEeyCyGxZq7+VrQVOnZzoxBBN2m9xNphp5iBo5rcr4m6aUnoXBOzHJmqHC++VzGjxd1C4mVM/gv5mjyvypVj+3a5Qf2uJVB6uVEyszConO7gAfYso+sL5lBzvUx19jZe5Je/0bVimGa1KhB4F9yk13kEPb+cDo2f+49nEhIN9aA6GehAOX5sboBVo9ucAM8P1uDJFOgRCYudiewQj13DqTiM0QEzPrOyJFRV5DROt1gviVcToZF/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeBYN142ZiNxuFAbcGzEh6E06ArJnHKcZUO9X6OsHPs=;
 b=QLDPpUJiIKUngDd/4TDRjsfY2qmw1rpt1Tza0MG2vimIPWtaMikE82sEwH1wQ5O1xr7Xjq3aszcDV71GXIRxSSZFdgNBfuFHvP/GgxqhNWwFX0klWtw6jhF2B3Cvz8RR4VFeslkc3xSrEP8L5Z2AWqBxgRoIkvP4lUvcCmKKP6DY2pRuzoJB2cCVy/ipeY7CtSetM6BD7kBdhzpXZtSSrW4Hp5AiZn5M71WTjKi0tEtUpOKSskrKSNTe5RrH6Z0LzbnRdrgWy7Gyq+RKhvf5p5dLmh1w4nLOMljEuMKO0UAEMPnsDM5Xoxk2itcnlpvPfp8um0boFcEMFho+imOe7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 02:59:49 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 02:59:49 +0000
Date: Wed, 27 May 2026 10:59:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/proxy] [sched/fair]  3272406483:
 RIP:set_next_task_idle
Message-ID: <202605271046.4dc3cd8c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be66eb6-f52f-488f-5995-08debb9c0429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: g7TvJ5gPfdy7+CWUk/dMzyVT1ltH2gEJdGWm3pXLAR3izC4XBlX9D/MTYCPu/9zZ+w5M6w6HbbZrd0S+PsftdMeWR6kzAzJXNBacdvzGqpx4VEb5cI68Fg5kJEp7a8LV81rg1KRT3k8fnLRcMTwDrpXbkjS5/c71C35qZQtJkDl7g+uo3EJF/kd+dukr1c7Cmmi/d5LQzD/gze+dTSM8gSzAJenXeJQiLRZO1AcbdLKI5XQG5baVNxKX7xHIOtQd0OwJj04MvbgMpOud5z4QwgYiSkcF3WSjWjfbN1AxCzFZLwJHogU8NEn5sabC7Qbz3Qdrjg5DTn5cV+lDohDgNCWZVwXF6WavgDKhEp9IXhorXi1SfwwDEd5cmBXT9PbUmk7kDfRXNagT49eWYo+0/vRHnNZarArO1bkrii5f7DHu54BgawnYK2jkFxr4IG9bW3GahjlOx3m/pLOOE3EOUGfhYzXvlPgK/DM+21jyf6NN+bJLI3HP2mPvTXJf4JBRU/nSjpjzTHd26pUgxnqfMcrvLlyAvYrJK1Cd3h65mB66O16UIuhsmHKh/fwmmo41mlzJbkBt7xV1fT118dZxn+IrVdPrD/Ah0GHXy/z2yRerg/tChqecQvFtn95sqPnBmi8K3EPJln4ANeX3htgWjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtNaHCnMsOwqhX50drwetNYTp7v5LTgkbPXE1YPJF+fwVVaPRgimAcsb4bkK?=
 =?us-ascii?Q?DJgTEoJUbt9rzIHOr3u54f6y+9OLt5Dmz1SmL2Bb5HXmDdruSVu0AV0NUYGC?=
 =?us-ascii?Q?fKiISAQdcw/iLDsnNLr21UXYnI/AzcRvCpmTG2q9mZb3RdbceKFOQHkeoVAo?=
 =?us-ascii?Q?GdI8DtRn2Pbyh/sitaaSs9X52RQTcAcAa5oRUCE789KQLjGUd1bNDlVUL1Tp?=
 =?us-ascii?Q?GdpGdLNVRVxZKmJnUyVZWID/0vkvZpRMYMBFrE2zyK2vfW5tYfTeIY3GECLI?=
 =?us-ascii?Q?Inl5KuxquyF57ag27tcEnveze/4S/LDC7lfLavRp3tMt+YxhuHbQlfb3I6AX?=
 =?us-ascii?Q?UNB9RvAhOvpkTL+2NFx4eMFRCqNDnGbCJP/ISAPTr7nKQBoDIukqKhx4m87u?=
 =?us-ascii?Q?1XBc9Bwexo/qxFPJgMRCoabg+tsV/i+KNjodXDsYBcLsFX/49xVJmdMhowEE?=
 =?us-ascii?Q?NLvY+r36PTpjNA/hjdImAfjNjdmAk1HliTHR1w88ulDTDcIiQHsCpoBWsfQa?=
 =?us-ascii?Q?FFCn71leeuKEA6arKBT/0fo6UIQMuSzQC+E1j7mQP3mLPf33p4iKnT+rl8xp?=
 =?us-ascii?Q?YF/TL19SpzSDBXN6GorFYU0ZrNVBo8M/Wlsxb1vErhGJDK/JE6b/SY1zlscw?=
 =?us-ascii?Q?hIRyW3AQPxRiZ/za+4hC2ccYuMM1jMx6w4fGkcg5o8wixTQJa2UjzwGu4MZf?=
 =?us-ascii?Q?dAPdSFJ1cgDueBpugBYBdoRL5QxpcYkaEg+hvbRwbd9ZsbJZadw18GfS4tRe?=
 =?us-ascii?Q?Mvwu/aEwIsrHql3cdO71LyKS3AmVTHJ64vWPYuZdmb+RIqvBNWyh/0r1ZGM7?=
 =?us-ascii?Q?yVYqJsD0vbv3LYoZGdnz2OYozmPrR/4OV9GGVxiJj7kLGsZFsg3nU0EVwKWY?=
 =?us-ascii?Q?A+r/tQ2DW1ApAqR9fwrvKxfD6o6oK9sZLSjBBRpKAGPd6JXfBDe+McfvPqyj?=
 =?us-ascii?Q?UyyGP4F4LI/j5TCWhl5drdqITKUMm3q+mNQsbyAHMm26K4GSCD6kQvmEWlfx?=
 =?us-ascii?Q?2uKsqnLV7op4QKHvxDdqi3yQbLGslEnAgEb7QqO8sfbG5nLylWCPWVXXPlk0?=
 =?us-ascii?Q?4O8IcYkSwGeCSevXKLIgWxV+Rz1gnQB6LGxI5wr3v4Ea3UaYuE0oawGeHd4s?=
 =?us-ascii?Q?xv9RB2nWsdHMu3cmFNbJAYykMgMbEnSXH9GsmGGe2dDIlnvMR+IY9dEhZC7C?=
 =?us-ascii?Q?Eff0Rp7dQpD4nEBFqw82bOdhVLMMv4RRZLUEcKMqDX9LIJ2BZu2Io8tavytT?=
 =?us-ascii?Q?Fw+Er9LCR7u41zZZgnTCSoAee12hKjxRxh9mK70PN1rc48Iv78Glz3o8ntCS?=
 =?us-ascii?Q?Z+xygbFCx2HDvoa+sl8IlR+t5fUHG9WUbM+zBS3YkqebwbrHEHewO2J3FO1O?=
 =?us-ascii?Q?ur/FRXWP0R8jSiacwV8ZwB9X9H6/cRaAX1fI7X+F2OhsIkViLSIq5AkcrQkY?=
 =?us-ascii?Q?ji3H81YLmobKMpi+MOxTPBxy6KiwkF9HUoPvH8iHyn181QoadPNkfZy6or2S?=
 =?us-ascii?Q?MVM6bcU4ujB2EsTKSFHxdeRWb698hNCwIAKSRDCjO0UVr5vQKJdv6SKrfu1P?=
 =?us-ascii?Q?aYZxylu2vWwQBAg1ulwiIH/ofgWXiCYmkB/YUFcttE8Eq6JPPpQNuXO2KqJk?=
 =?us-ascii?Q?P3EN2OSxEiMoDvpNPjrhBNGN/X2FvRoUOZ1CqQmH+6ySXjFvoKiBRzROU2P/?=
 =?us-ascii?Q?wbZkylQe9CWQvJynTSDZ18wHYsesEoMOT4fWeUImIVB6w7MlxfP3qtmxStxy?=
 =?us-ascii?Q?iWUDo0cygQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: h3hZZaOu19e5Pfb0K0m+4ZvMd/TgpTbkFZnMbm7sDMKjrH1MPt4rXMj9X76zWk6eDdikIoiUx5QxSk755D0b9iKPtm25qq3WFn51k1BfmdR2OOM1hPAL5DdXK+Ms5m5jwaY8QNa0edJJrWO3sSUYJx/PdWhQc65NbO6S6vBMBOzRhXsj93akuHE8oRyq7nVESfpTPhzqA0rYHSrAEEMiBEW6VTQudujR8w4+IfzvLsNm7RDMGgxBlnrRHpCRzjYpGhHFIQAlZsNeNxwkbjStuMW2P0gxp1MXAtz8gV+5g1Co6MIn0gLokk9GWFeHrdiBP+v+8HKVi4p13ra5DEVu0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be66eb6-f52f-488f-5995-08debb9c0429
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 02:59:49.5884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2JCEDqPB4ZnEI3kjN9kBIMQyRsXPMndZfTeqmhaJAG36+vCXpvI9hq/HkIm0DxOqVAwBZ0iFyQKatGSEqbfnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "RIP:set_next_task_idle" on:

commit: 327240648305b45989b073e5e241e3aebd039570 ("sched/fair: Add newidle balance to pick_task_fair()")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/proxy

in testcase: stress-ng
version: stress-ng-x86_64-c09248db3-1_20260512
with following parameters:

	nr_threads: 100%
	testtime: 60s
	test: prctl
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605271046.4dc3cd8c-lkp@intel.com



[  247.632336][ T9849] ------------[ cut here ]------------
[  247.634037][    T0] ------------[ cut here ]------------
[  247.634058][T10006] ------------[ cut here ]------------
[  247.634062][T10006] WARNING: kernel/sched/sched.h:1788 at set_next_task_idle+0xce/0x130, CPU#216: stress-ng-prctl/10006
[  247.634068][T10006] Modules linked in: ipmi_ssif intel_ifs i10nm_edac skx_edac_common nfit x86_pkg_temp_thermal coretemp btrfs libblake2b intel_uncore_frequency_tpmi kvm_intel raid6_pq cxl_pci intel_rapl_tpmi intel_tpmi_power_domains isst_tpmi xor isst_tpmi_core intel_rapl_common intel_uncore_frequency_common cxl_mem snd_pcm kvm cxl_acpi snd_timer binfmt_misc cxl_port ast irqbypass pmt_telemetry iaa_crypto cxl_pmem snd dax_hmem nvme isst_if_mmio drm_client_lib intel_cstate qat_4xxx pmt_discovery pmt_class intel_sdsi intel_vsec_tpmi drm_shmem_helper acpi_ipmi soundcore cxl_core idxd i2c_i801 intel_qat intel_uncore pcspkr ipmi_si einj nvme_core isst_if_common intel_vsec i2c_smbus idxd_bus drm_kms_helper wmi crc8 ipmi_devintf libnvdimm ipmi_msghandler pfr_update joydev pfr_telemetry fuse drm nfnetlink
[  247.634098][T10006] CPU: 216 UID: 0 PID: 10006 Comm: stress-ng-prctl Not tainted 7.1.0-rc2+ #1 PREEMPTLAZY
[  247.634100][T10006] Hardware name: IEIT SYSTEMS NF5180-M8-A0-R0-00/NF5180-M8-A0-R0-00, BIOS 02.03.00 03/03/2025
[  247.634102][T10006] RIP: 0010:set_next_task_idle (sched/sched.h:1788 (discriminator 1) sched/sched.h:1802 (discriminator 1) sched/pelt.h:80 (discriminator 1) sched/pelt.h:157 (discriminator 1) sched/idle.c:498 (discriminator 1))
[  247.634104][T10006] Code: 0b 00 00 5b 5d c3 cc cc cc cc 83 83 f8 0d 00 00 01 83 bb 60 0b 00 00 01 0f 87 68 ff ff ff 0f 0b e9 61 ff ff ff 83 f9 01 77 a6 <0f> 0b 0f 0b eb a0 0f 0b 48 8b 83 58 0b 00 00 48 01 d0 48 2b 83 48
All code
========
   0:	0b 00                	or     (%rax),%eax
   2:	00 5b 5d             	add    %bl,0x5d(%rbx)
   5:	c3                   	ret
   6:	cc                   	int3
   7:	cc                   	int3
   8:	cc                   	int3
   9:	cc                   	int3
   a:	83 83 f8 0d 00 00 01 	addl   $0x1,0xdf8(%rbx)
  11:	83 bb 60 0b 00 00 01 	cmpl   $0x1,0xb60(%rbx)
  18:	0f 87 68 ff ff ff    	ja     0xffffffffffffff86
  1e:	0f 0b                	ud2
  20:	e9 61 ff ff ff       	jmp    0xffffffffffffff86
  25:	83 f9 01             	cmp    $0x1,%ecx
  28:	77 a6                	ja     0xffffffffffffffd0
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	0f 0b                	ud2
  2e:	eb a0                	jmp    0xffffffffffffffd0
  30:	0f 0b                	ud2
  32:	48 8b 83 58 0b 00 00 	mov    0xb58(%rbx),%rax
  39:	48 01 d0             	add    %rdx,%rax
  3c:	48                   	rex.W
  3d:	2b                   	.byte 0x2b
  3e:	83                   	.byte 0x83
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	0f 0b                	ud2
   4:	eb a0                	jmp    0xffffffffffffffa6
   6:	0f 0b                	ud2
   8:	48 8b 83 58 0b 00 00 	mov    0xb58(%rbx),%rax
   f:	48 01 d0             	add    %rdx,%rax
  12:	48                   	rex.W
  13:	2b                   	.byte 0x2b
  14:	83                   	.byte 0x83
  15:	48                   	rex.W
[  247.634106][T10006] RSP: 0018:ffa0000032147b70 EFLAGS: 00010097
[  247.634107][T10006] RAX: 000000000175bccb RBX: ff11062cb6c31d00 RCX: 0000000000000000
[  247.634108][T10006] RDX: 00000039a6323750 RSI: ff11060e88082100 RDI: ff11062cb6c31d00
[  247.634109][T10006] RBP: ff11060e88082100 R08: ffffffff813c52d0 R09: ff11060e97964200
[  247.634110][T10006] R10: 000000000000006c R11: 000000000000001a R12: ffffffff83f09d00
[  247.634111][T10006] R13: ff11062cb6c31d00 R14: ff11060e88082100 R15: ff11062cb6c31d00
[  247.634112][T10006] FS:  0000000000000000(0000) GS:ff11062d32d28000(0000) knlGS:0000000000000000
[  247.634113][T10006] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.634114][T10006] CR2: 000055f864cf9c90 CR3: 0000062d81422001 CR4: 0000000000f73ef0
[  247.634114][T10006] PKRU: 55555554
[  247.634115][T10006] Call Trace:
[  247.634118][T10006]  <TASK>
[  247.634120][T10006]  pick_next_task (sched/sched.h:2737 sched/core.c:6346)
[  247.634123][T10006]  __schedule (sched/core.c:7120)
[  247.634126][T10006]  do_task_dead (sched/core.c:7223)
[  247.634128][T10006]  do_exit (trace/events/sched.h:335 (discriminator 4) trace/events/sched.h:335 (discriminator 4) exit.c:975 (discriminator 4))
[  247.634131][T10006]  do_group_exit (exit.c:1128)
[  247.634133][T10006]  __x64_sys_exit_group (exit.c:1157)
[  247.634135][T10006]  x64_sys_call (x86/entry/syscall_64.c:37)
[  247.634136][T10006]  do_syscall_64 (x86/entry/syscall_64.c:63 (discriminator 1) x86/entry/syscall_64.c:94 (discriminator 1))
[  247.634138][T10006]  ? __x64_sys_rt_sigaction (signal.c:4646 signal.c:4630 signal.c:4630)
[  247.634140][T10006]  ? do_syscall_64 (x86/include/asm/atomic64_64.h:15 linux/atomic/atomic-arch-fallback.h:2583 linux/atomic/atomic-long.h:38 linux/atomic/atomic-instrumented.h:3189 linux/unwind_deferred.h:37 linux/irq-entry-common.h:278 linux/entry-common.h:320 x86/entry/syscall_64.c:100)
[  247.634142][T10006]  ? restore_altstack (signal.c:4469)
[  247.634143][T10006]  ? __do_sys_rt_sigreturn (x86/kernel/signal_64.c:268 (discriminator 1))
[  247.634146][T10006]  ? do_syscall_64 (x86/include/asm/atomic64_64.h:15 linux/atomic/atomic-arch-fallback.h:2583 linux/atomic/atomic-long.h:38 linux/atomic/atomic-instrumented.h:3189 linux/unwind_deferred.h:37 linux/irq-entry-common.h:278 linux/entry-common.h:320 x86/entry/syscall_64.c:100)
[  247.634147][T10006]  ? __perf_sw_event (events/internal.h:229 events/core.c:11020 events/core.c:11045)
[  247.634149][T10006]  ? handle_mm_fault (linux/perf_event.h:1604 memory.c:6617 memory.c:6744)
[  247.634151][T10006]  ? syscall_user_dispatch (entry/syscall_user_dispatch.c:51 (discriminator 2))
[  247.634152][    T0] ------------[ cut here ]------------
[  247.634152][T10006]  ? do_user_addr_fault (x86/mm/fault.c:1335)
[  247.634155][T10006]  ? do_syscall_64 (x86/include/asm/preempt.h:95 linux/randomize_kstack.h:58 x86/entry/syscall_64.c:92)
[  247.634157][T10006]  ? irqentry_exit (x86/include/asm/atomic64_64.h:15 linux/atomic/atomic-arch-fallback.h:2583 linux/atomic/atomic-long.h:38 linux/atomic/atomic-instrumented.h:3189 linux/unwind_deferred.h:37 linux/irq-entry-common.h:278 linux/irq-entry-common.h:325 entry/common.c:162)
[  247.634155][    T0] WARNING: kernel/sched/fair.c:7617 at hrtick_start_fair+0x88/0xb0, CPU#67: swapper/67/0
[  247.634160][T10006]  entry_SYSCALL_64_after_hwframe (x86/entry/entry_64.S:130)
[  247.634161][    T0] Modules linked in: ipmi_ssif intel_ifs i10nm_edac
[  247.634163][T10006] RIP: 0033:0x7fd729a742d5
[  247.634165][    T0]  skx_edac_common
[  247.634166][    T0]  nfit
[  247.634168][T10006] Code: Unable to access opcode bytes at 0x7fd729a742ab.

Code starting with the faulting instruction
===========================================
[  247.634170][    T0]  x86_pkg_temp_thermal
[  247.634171][T10006] RSP: 002b:00007fff9cf52e58 EFLAGS: 00000202
[  247.634173][    T0]  coretemp
[  247.634172][    T0] ------------[ cut here ]------------
[  247.634173][T10006]  ORIG_RAX: 00000000000000e7
[  247.634175][    T0]  btrfs libblake2b
[  247.634177][T10006] RAX: ffffffffffffffda RBX: 00007fd7290a35c8 RCX: 00007fd729a742d5
[  247.634179][    T0]  intel_uncore_frequency_tpmi
[  247.634180][T10006] RDX: 00000000000000e7 RSI: fffffffffffffc20 RDI: 0000000000000000
[  247.634177][    T0] WARNING: kernel/sched/fair.c:6316 at set_next_entity+0x1cc/0x270, CPU#71: swapper/71/0
[  247.634182][    T0]  kvm_intel
[  247.634183][T10006] RBP: 0000000000002716 R08: 00000000ffffffff R09: 0000000000000178
[  247.634185][    T0] Modules linked in:
[  247.634185][T10006] R10: 0000000000000019 R11: 0000000000000202 R12: 00007fff9cf52e64
[  247.634185][    T0]  raid6_pq
[  247.634188][    T0]  ipmi_ssif
[  247.634189][T10006] R13: 00007fd6ff030000 R14: 000055f86505e0e0 R15: 00000000000026b5
[  247.634190][    T0]  cxl_pci
[  247.634192][    T0]  intel_ifs
[  247.634193][T10006]  </TASK>
[  247.634194][    T0]  intel_rapl_tpmi
[  247.634195][    T0]  i10nm_edac
[  247.634196][T10006] ---[ end trace 0000000000000000 ]---
[  247.634197][    T0]  intel_tpmi_power_domains
[  247.634198][    T0]  skx_edac_common
[  247.634200][    T0]  isst_tpmi


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260527/202605271046.4dc3cd8c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

