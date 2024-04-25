Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6511E4A6
	for <oe-lkp@lists.linux.dev>; Thu, 25 Apr 2024 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714034014; cv=fail; b=nJppBeYeV5yZYye5X2UqOUg0TLyv7MuoBkGDxULS1PqgBDgTgh8BQgq2pSmH7oiOjkuizY4Z0Lz9rzIkwXOnICz4sEHH5cfKJesuJ9x+sY9QGYBYr3N93Yk+mZzVxN65AOgogpu49IRTbq/1AqO9c7IImo4Yxdj7Ig6CiDjBnFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714034014; c=relaxed/simple;
	bh=G9B0uOqQnIKJwBo1S2u6y3hlGnUoVkCp4DvUsFPnDWQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oaF093/lvagUjKm+9fOGB4+J/CIhpTq3R66GHFt1h08LIjOkXCJvjpQ373QTcb6rZ2JYNYnTZWqTXN4yrhPxUMp77cRnvuIOhbf+724Nu0gRkSGHFsdw5A78AIOPe99/rxQvBiJXv9SZl1aqSb4ict7taPTXBcuqWVO67SCPEzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYQwFS80; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYQwFS80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714034011; x=1745570011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9B0uOqQnIKJwBo1S2u6y3hlGnUoVkCp4DvUsFPnDWQ=;
  b=UYQwFS80eBeYQ6Fjz+lRi1s4O0RsflcW8IP0rF2+Cr1Xa3qQPGiPI7qo
   Tscz1VvxJ4rHZPLjVOcldcWf3ZSaNrmmtEJCzycRZvkwTTZF0jlUtKKCS
   PVB9b4Fu7+9mtC8VI+GvK1jQkakdwNu/4C7q0DaGtlZIpAS81qwTaB1Sl
   geoOCoYGrcrBFsydkd9bCJip+wO2jcdvVbzpc7PfoU190vTSo+Vp6zZdB
   d9ScVG9k3vAcsY+ak1FBZHNN7wUhDjqvHHI/zb0QD96BBntreYffTwo0d
   9/lGCJr+6xh9xIi+QPKnj5tnROEqCISwnaxGtrkP4l+4aegByZVA71Ax3
   Q==;
X-CSE-ConnectionGUID: pFKED4ugRPuveEO3ayQqVQ==
X-CSE-MsgGUID: V+GXmQ4NRWmrm1Z/GJjpCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12638499"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="12638499"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:33:30 -0700
X-CSE-ConnectionGUID: w1adQunURIaJroOF0hXRww==
X-CSE-MsgGUID: vZ26Ss9aSXu6miMlJOHbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25613585"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Apr 2024 01:33:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 01:33:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 01:33:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 01:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7RdxYSFm+hgSrddBOL5S/FzGY4Wlv9IT3AfWTjPVlQfJxOqeDYOw4pd37Ga8jjaeDKXQPlAusRbHhLgajvyzNrleB3XD0XTbsitEMQTI5pX7iXS/cNPz9CvZvRCDaOLzRKPWsVk3hdo6oDfWY78oaIiiwdrufRGXLvdogdVPhMG2zonr7a/Um1YnwfNoy9boOUy4KYI2kbWyZ3WoVcqET2fJPJfkNYXvvRoT1lGiRKgSE09aXAc+L+PzLb/AqLVUvmJNsknFBXqoF3V6BS72ME34htvZSj/PK5IT3tiZetzmgGYhpawJ6FOedpPIXRQNxckkxxWge2Y3Pg3PJWGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dR6A0zlqCO/1aByzHsWEgoJxOar7QL+OkGofbwEGJzM=;
 b=lJhH2MHMLO03uAeg8tnYjkvjGIp8v8L3ttzLgT5k8JgISSC+ZQ2JkCLAVjPA09iaU1R+beyPHdzP0kM6v5Am57WKqCYeWv9bnxdvSDSaOkrKon1bVR3MlT9vmFylKPOI/MLGU6ST/CYQT3EIN18LXhNjkW4XosODpR2Vm9vB6mOAv9PjdcBJVL1eScpqbM/a+IO+NHB5RrArd6YMkklbs+gCmHTLBOG9XuPF5ayG/7rG764ZpEHfpA4A/OyZ9xh/ZwGqpoBaMD3DRVcHcX7m2cjQn6bdM5H9ODR9eC8s0y7TeSz7iPse1z4QicVNnluXmk6BFNmLyt856E7xF+OzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 08:33:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 08:33:26 +0000
Date: Thu, 25 Apr 2024 16:33:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache_prototype_v3] [mm] 9db64d371d:
 WARNING:at_net/core/skbuff.c:#skb_splice_from_iter
Message-ID: <202404251628.454c0dc9-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d6c5dd-a16f-495f-f68e-08dc65026046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zYFxewPqGa6+VhKUHdw/F2uVUy2eDZrE/xOPaWFCl2OPKMLKAxA9KL4Gqs1R?=
 =?us-ascii?Q?vAV16BDZSFb+WsJQlaz5Zr+yuND0K3vmh9OFMkfAjULeHaKd3n2kLTOsal1c?=
 =?us-ascii?Q?nsRdmHM70sPNR3Ytg91xd9+LpTAsVdW9avEWyLAkncFfVvTADeYe5yefRPS3?=
 =?us-ascii?Q?mDfthF3Uh2rXeS2Yp6N43GZ9dIg5Ih5tvkeXuNP0z1zcpi/OBou1H/BNVaN9?=
 =?us-ascii?Q?J0k80Yggtxzh0AvLiYAN2aJpheCBJtkS5Y15Sbdg4Lftlny1UmFRrd5cW5QX?=
 =?us-ascii?Q?uAWUoKNdKduYMb2ZIK6HpDjFIAWtn53e8O+HL0WHAuy8v0Rzm4AX74VBGfc2?=
 =?us-ascii?Q?+W65V5Q6qG8+Q9HZsDBZRTHRC/7dT0CrGh2fPZkARHXU850ruoLs7TuDoiN/?=
 =?us-ascii?Q?QdA3iOn2swERwclhCKlLgjSfdDjts8yP2jA+oNqttN6hUC0dkpv51htsMdda?=
 =?us-ascii?Q?MdKWW4Gw3KSj1IOYVVq/sMmV6iBqTGOza1lMQ8s2jtH4FTlWf4PvQRPQAbSO?=
 =?us-ascii?Q?Sufhi2wZC6x+OGGWWv2MS7u9q1tPTzgmRGfQSbmf4KUZSRC6uBdc/N7M6iFN?=
 =?us-ascii?Q?KdhvXI8gRhF/1v/FjT3SnpnaQmnMXVUVBQd/n6Rk5gPlRU71OHMBvcQLbZ9M?=
 =?us-ascii?Q?6nca27QTLtSKaHVNnR1WWsTyNhi8s5nraud07px0vTvV67PpHBegBTLcIGSs?=
 =?us-ascii?Q?NfUhDo5H0F+ZdTE25t3YrE2k/pvQfKF/Crm765i/Egqu1ggvVZGtnKguJ8kz?=
 =?us-ascii?Q?pFWxArdeDZHwCTSU7JIgZC0ga70sYHyZDiKv/wQFqSg1ZJgqkLcn5vTynz1h?=
 =?us-ascii?Q?2begisLZZg5OnTkNgG0jQs+WUncefkqyFtc7XS08naZ5JlklR49BqomSN7BF?=
 =?us-ascii?Q?yNobVfoUNQp17vH9eIOIeqnpasQ0zX5yY+E8pAuLvS9t48kcu6x1+r2OZ0zG?=
 =?us-ascii?Q?f9PxZMmquPRbF+iYkVexJoqqaEZnh43KYwkSBElOxMxqBEpV+P7BZBm2rLJy?=
 =?us-ascii?Q?92JBgmg3DGtVhR0SSEGDr8EDPZGbJXnbhIRql/F3X6UBochM7vdglAtDQwXw?=
 =?us-ascii?Q?Uw6IvNSC7b9cqtuokSUw4bCMt/U55/PLfccxcZzuf+xoEgigaHMWlMxFRfZv?=
 =?us-ascii?Q?y7asq9YiE5T+W5igjwkI7UV3T7B74ruM6YoAkDd79LMxouTdlMfASdjS6diF?=
 =?us-ascii?Q?jCxYGhIbp3HDDKXGn7e1lrgPmdsBmtWUOhLVH0Ath4gt3lhX+6X708tw/cY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EAa9EV/Up/Jbvt5vk+8zA/BRkyrCwl/FBBCdvvHBHJ7I3w2+XmYMxbxb/vIY?=
 =?us-ascii?Q?jFOpBWzfpQ+yHDoh0O8s8Dy92xZsMmQoxLSfnn9hCjxWSbVwfxu4pd5e/GCV?=
 =?us-ascii?Q?DOJfpcj9d861YlTfbGyknNWrAwgtR3PtQtwLM9GitpnNhMyMUAd6OXoe+7k/?=
 =?us-ascii?Q?Lmujqo3na6LbnHwp2ySMS4MUcVL+CzrwH+UUoTZmcBYamgvt7pU+seRsfASx?=
 =?us-ascii?Q?Bf5gPzrrG2FV5wiAYgZoG0vD2urU1403vYWRRXgBFWgh2PM6rJFoT/PidFF9?=
 =?us-ascii?Q?gdbL2EReaWnC3qrWrfbtiiyY0hxQ2UPH48WiTEIrYwASkANZJV2UQ/lWU8kG?=
 =?us-ascii?Q?/vyFcd2nlPE84UIiIlJ0FMor9l6u4FJSfeQVI3Krlt9KriIqwKCf5l7hXRpd?=
 =?us-ascii?Q?Fte17z1QnZAen11DvT/eewHy9hg08Y3OxcMgHLsUthQtAwlfkoTefflGiuep?=
 =?us-ascii?Q?B8znxAtbbcH0a1WtX3HnRHwC5lgk66aC0zffWYXMOXhcoGgaYourRCPDTx40?=
 =?us-ascii?Q?Myv1bwvDLjO7mhuoCh2WcFScLjIQ2ULPscVkUwu+A0+8Dwl4RenW6SfHu/ts?=
 =?us-ascii?Q?ewVE0HxTmNIvMXPPxucFFZ+e3Eq5ZHkQsFzSNpTSfo8QCRpTDIyIe26OkHqT?=
 =?us-ascii?Q?JfQq66nOOTR8/CMQbXeGxKrL4d9VrryLxdkg0bScFTI1UQvVZjg1kRX15z2r?=
 =?us-ascii?Q?+V/wrRQdHxZRAcN+2yUx3TSxrpKJyz2q1DHOf0OLr4fbn09aSTxP8xDPo7hv?=
 =?us-ascii?Q?r81pRPAs9jnmxyAfFJGn+ACRQ3l9GjYogZcKL3L8VLpYspFLoRivOw7qcD2E?=
 =?us-ascii?Q?JYppwKCUNbQ9wsbiqU0DYKvX5tjdjZa2XEwaPyVfhjjhL/tghi2XvQpscB/0?=
 =?us-ascii?Q?BF4fxaqk8Ke6ip+eFyN5G8y2+gAuSOFFCCTjNvadRuRmhtNtKbSo6eS7mted?=
 =?us-ascii?Q?ryE4/hdmSMFp7e7at3hEPvoZ6WyMVwkvevSrwkLKOrZFvlLnGNzphED7DjR4?=
 =?us-ascii?Q?H/mdAV7ZSaU3OcM+agjkLdChkwreFlw5xplPoYkZTFFxX/N+OYitFFyGgNax?=
 =?us-ascii?Q?I5LXHtn7lzuC2F2qPC1SRGJYlbLsOEANLf2S86++mAy7wrUqQiTa87LEpyVG?=
 =?us-ascii?Q?vGceR0ARz3AUMYXlwOUjeYWpDBpJvhF36TUufMpK1N3UyUeG6WYApsHiUiH/?=
 =?us-ascii?Q?33dO1/MQyit9h3YDh+KawjZCFPvTxYzR41hlm1HlMwOjqqR5lbcaxdI721ma?=
 =?us-ascii?Q?gtpd4sQlebVz/t470g3xVo0YobCT4kij0spCTCHmUppDU2WVNVQjEVHSpZfh?=
 =?us-ascii?Q?jJW3NdOd7Rze0RvqwB9EyaDypzJv2KMGcyaSqoEyO02bH9Iw1yaBtZV5oM2e?=
 =?us-ascii?Q?X9qaOxAgQnsIMWBb/K4cAI+y/2zHglKcU+qxccgaPG35lVQ3Q6Y0wgVsA4fF?=
 =?us-ascii?Q?bLn+M/Ea9xvdeoVqNOuOqxSFj6qc7XzylG+AGgowpDPG4hdJiZuZxFpRRW41?=
 =?us-ascii?Q?i+/cz+hZrpk2+3oez2shmv49QkHhouaU7aumfaas4ekxImHA7qFVBTgOvmIK?=
 =?us-ascii?Q?juDYFPW52baGi1won3Up1HTwRCdHp267ocnfrrSYDARP1t7+JSdtjP7a/5Gw?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d6c5dd-a16f-495f-f68e-08dc65026046
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 08:33:26.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTSB4islBnrpEnOMDDKu+nta7YgOiMgK31mO0h6dko/s4L+rMIiBeFn5IDB1bed3LpNO3i1mng7GL/iTuThvsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_net/core/skbuff.c:#skb_splice_from_iter" on:

commit: 9db64d371dbb2fa5a4897fb905dd3a25d31f15f9 ("mm: page_frag: reuse existing space for pagecnt_bias and pfmemalloc")
https://github.com/gestionlin/linux.git page_frag_cache_prototype_v3

in testcase: filebench
version: filebench-x86_64-22620e6-1_20240224
with following parameters:

	disk: 1HDD
	fs: xfs
	fs2: nfsv4
	test: singlestreamreaddirect.f
	cpufreq_governor: performance



compiler: gcc-13
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404251628.454c0dc9-oliver.sang@intel.com


[   91.421456][ T2564] ------------[ cut here ]------------
[ 91.427045][ T2564] WARNING: CPU: 103 PID: 2564 at net/core/skbuff.c:7104 skb_splice_from_iter (net/core/skbuff.c:7104 (discriminator 1)) 
[   91.436926][ T2564] Modules linked in: kmem rpcsec_gss_krb5 nfsv4 dns_resolver nfsd auth_rpcgss xfs device_dax nd_pmem nd_btt dax_pmem btrfs blake2b_generic xor raid6_pq libcrc32c sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft crc64 sg intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel sha512_ssse3 rapl ahci ast libahci ipmi_ssif intel_cstate drm_shmem_helper acpi_ipmi mei_me ioatdma i2c_i801 intel_uncore ipmi_si dax_hmem libata drm_kms_helper mei intel_pch_thermal dca i2c_smbus wmi ipmi_devintf nfit ipmi_msghandler libnvdimm acpi_pad acpi_power_meter joydev binfmt_misc drm fuse loop dm_mod ip_tables
[   91.500845][ T2564] CPU: 103 PID: 2564 Comm: nfsd Tainted: G S                 6.9.0-rc4-00224-g9db64d371dbb #1
[   91.511138][ T2564] Hardware name: Intel Corporation M50CYP2SB1U/M50CYP2SB1U, BIOS SE5C620.86B.01.01.0003.2104260124 04/26/2021
[ 91.523110][ T2564] RIP: 0010:skb_splice_from_iter (net/core/skbuff.c:7104 (discriminator 1)) 
[ 91.529165][ T2564] Code: 8b 75 00 48 29 c1 4c 39 f9 49 8b 56 08 49 0f 47 cf 49 89 cc f6 c2 01 0f 85 98 01 00 00 66 90 4c 89 f2 48 8b 12 80 e6 08 74 79 <0f> 0b 49 c7 c7 fb ff ff ff 48 8b 44 24 10 41 01 45 70 41 01 45 74
All code
========
   0:	8b 75 00             	mov    0x0(%rbp),%esi
   3:	48 29 c1             	sub    %rax,%rcx
   6:	4c 39 f9             	cmp    %r15,%rcx
   9:	49 8b 56 08          	mov    0x8(%r14),%rdx
   d:	49 0f 47 cf          	cmova  %r15,%rcx
  11:	49 89 cc             	mov    %rcx,%r12
  14:	f6 c2 01             	test   $0x1,%dl
  17:	0f 85 98 01 00 00    	jne    0x1b5
  1d:	66 90                	xchg   %ax,%ax
  1f:	4c 89 f2             	mov    %r14,%rdx
  22:	48 8b 12             	mov    (%rdx),%rdx
  25:	80 e6 08             	and    $0x8,%dh
  28:	74 79                	je     0xa3
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	49 c7 c7 fb ff ff ff 	mov    $0xfffffffffffffffb,%r15
  33:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  38:	41 01 45 70          	add    %eax,0x70(%r13)
  3c:	41 01 45 74          	add    %eax,0x74(%r13)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	49 c7 c7 fb ff ff ff 	mov    $0xfffffffffffffffb,%r15
   9:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   e:	41 01 45 70          	add    %eax,0x70(%r13)
  12:	41 01 45 74          	add    %eax,0x74(%r13)
[   91.549120][ T2564] RSP: 0018:ffa000000b7a7b58 EFLAGS: 00010202
[   91.555257][ T2564] RAX: 0000000000000000 RBX: ff11002071e63e00 RCX: 0000000000000004
[   91.563312][ T2564] RDX: 0057ffffe0000840 RSI: 0000000000000001 RDI: ff1100012aba5c48
[   91.571362][ T2564] RBP: ffa000000b7a7b88 R08: ff1100012aba6c68 R09: 0000000000000078
[   91.579413][ T2564] R10: 0000000000000000 R11: ffd4000008c2ffc0 R12: 0000000000000004
[   91.587464][ T2564] R13: ff11002071e63e00 R14: ffd4000081c66a00 R15: 0000000000000004
[   91.595515][ T2564] FS:  0000000000000000(0000) GS:ff110020017c0000(0000) knlGS:0000000000000000
[   91.604526][ T2564] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   91.611186][ T2564] CR2: 00007ffff7b453d8 CR3: 000000207de1c001 CR4: 0000000000771ef0
[   91.619236][ T2564] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   91.627288][ T2564] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   91.635338][ T2564] PKRU: 55555554
[   91.638966][ T2564] Call Trace:
[   91.642329][ T2564]  <TASK>
[ 91.645343][ T2564] ? __warn (kernel/panic.c:694) 
[ 91.649493][ T2564] ? skb_splice_from_iter (net/core/skbuff.c:7104 (discriminator 1)) 
[ 91.654935][ T2564] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 91.659508][ T2564] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 91.663910][ T2564] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
[ 91.668665][ T2564] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 91.673780][ T2564] ? skb_splice_from_iter (net/core/skbuff.c:7104 (discriminator 1)) 
[ 91.679223][ T2564] ? skb_splice_from_iter (net/core/skbuff.c:7092) 
[ 91.684577][ T2564] tcp_sendmsg_locked (net/ipv4/tcp.c:1251 (discriminator 1)) 
[ 91.689684][ T2564] ? nfsd_splice_read (fs/nfsd/vfs.c:1065) nfsd
[ 91.695345][ T2564] ? __cond_resched (kernel/sched/core.c:8608) 
[ 91.700080][ T2564] tcp_sendmsg (net/ipv4/tcp.c:1343) 
[ 91.704374][ T2564] sock_sendmsg (net/socket.c:733 (discriminator 1) net/socket.c:745 (discriminator 1) net/socket.c:768 (discriminator 1)) 
[ 91.708846][ T2564] svc_tcp_sendmsg (net/sunrpc/svcsock.c:1238) 
[ 91.713671][ T2564] svc_tcp_sendto (net/sunrpc/svcsock.c:1270) 
[ 91.718305][ T2564] svc_send (net/sunrpc/svc_xprt.c:921) 
[ 91.722331][ T2564] svc_handle_xprt (net/sunrpc/svc_xprt.c:815) 
[ 91.727142][ T2564] svc_recv (include/linux/sunrpc/bc_xprt.h:40 net/sunrpc/svc_xprt.c:876) 
[ 91.731345][ T2564] ? __pfx_nfsd (fs/nfsd/nfssvc.c:912) nfsd
[ 91.736358][ T2564] nfsd (fs/nfsd/nfssvc.c:941) nfsd
[ 91.740682][ T2564] kthread (kernel/kthread.c:388) 
[ 91.744617][ T2564] ? __pfx_kthread (kernel/kthread.c:341) 
[ 91.749243][ T2564] ret_from_fork (arch/x86/kernel/process.c:147) 
[ 91.753704][ T2564] ? __pfx_kthread (kernel/kthread.c:341) 
[ 91.758324][ T2564] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   91.763112][ T2564]  </TASK>
[   91.766156][ T2564] ---[ end trace 0000000000000000 ]---
[   91.771669][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[   94.152299][ T2559] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[   96.522359][ T2559] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[   97.757006][ T1468] Events enabled
[   97.757010][ T1468]
[   97.781707][    C0] perf: interrupt took too long (2585 > 2500), lowering kernel.perf_event_max_sample_rate to 77000
[   97.814727][    C0] perf: interrupt took too long (3346 > 3231), lowering kernel.perf_event_max_sample_rate to 59000
[   97.871706][    C0] perf: interrupt took too long (4206 > 4182), lowering kernel.perf_event_max_sample_rate to 47000
[   97.948725][    C0] perf: interrupt took too long (5292 > 5257), lowering kernel.perf_event_max_sample_rate to 37000
[   98.034694][    C0] perf: interrupt took too long (6671 > 6615), lowering kernel.perf_event_max_sample_rate to 29000
[   98.125726][    C0] perf: interrupt took too long (8412 > 8338), lowering kernel.perf_event_max_sample_rate to 23000
[   98.392731][    C0] perf: interrupt took too long (10525 > 10515), lowering kernel.perf_event_max_sample_rate to 19000
[   99.042094][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  100.765375][ T1468] [ perf record: Woken up 59 times to write data ]
[  100.765378][ T1468]
[  100.908563][ T1468] Warning:
[  100.908567][ T1468]
[  100.915314][ T1468] Processed 192218 events and lost 2 chunks!
[  100.915316][ T1468]
[  100.923772][ T1468]
[  100.923773][ T1468]
[  100.928828][ T1468] Check IO/CPU overload!
[  100.928829][ T1468]
[  100.935484][ T1468]
[  100.935485][ T1468]
[  100.941436][ T1468] [ perf record: Captured and wrote 29.751 MB /tmp/lkp/perf_c2c.data (73428 samples) ]
[  100.941437][ T1468]
[  101.606690][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  103.999638][ T2559] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  106.397587][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  108.730699][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  111.147193][ T2564] rpc-srv/tcp: nfsd: got error -5 when sending 1048696 bytes - shutting down socket
[  111.578643][ T2564] stack segment: 0000 [#1] SMP NOPTI
[  111.584040][ T2564] CPU: 38 PID: 2564 Comm: nfsd Tainted: G S      W          6.9.0-rc4-00224-g9db64d371dbb #1
[  111.594238][ T2564] Hardware name: Intel Corporation M50CYP2SB1U/M50CYP2SB1U, BIOS SE5C620.86B.01.01.0003.2104260124 04/26/2021
[ 111.606075][ T2564] RIP: 0010:find_openstateowner_str_locked (fs/nfsd/nfs4state.c:551) nfsd
[ 111.613452][ T2564] Code: cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 55 89 fd 53 48 c1 e5 04 48 03 6a 28 <48> 8b 5d 00 48 39 dd 74 27 4c 8d a6 b0 00 00 00 80 bb 70 01 00 00
All code
========
   0:	cc                   	int3   
   1:	cc                   	int3   
   2:	cc                   	int3   
   3:	cc                   	int3   
   4:	0f 1f 00             	nopl   (%rax)
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1c:	41 54                	push   %r12
  1e:	55                   	push   %rbp
  1f:	89 fd                	mov    %edi,%ebp
  21:	53                   	push   %rbx
  22:	48 c1 e5 04          	shl    $0x4,%rbp
  26:	48 03 6a 28          	add    0x28(%rdx),%rbp
  2a:*	48 8b 5d 00          	mov    0x0(%rbp),%rbx		<-- trapping instruction
  2e:	48 39 dd             	cmp    %rbx,%rbp
  31:	74 27                	je     0x5a
  33:	4c 8d a6 b0 00 00 00 	lea    0xb0(%rsi),%r12
  3a:	80                   	.byte 0x80
  3b:	bb 70 01 00 00       	mov    $0x170,%ebx

Code starting with the faulting instruction
===========================================
   0:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
   4:	48 39 dd             	cmp    %rbx,%rbp
   7:	74 27                	je     0x30
   9:	4c 8d a6 b0 00 00 00 	lea    0xb0(%rsi),%r12
  10:	80                   	.byte 0x80
  11:	bb 70 01 00 00       	mov    $0x170,%ebx


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240425/202404251628.454c0dc9-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

