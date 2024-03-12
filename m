Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7E32C84
	for <oe-lkp@lists.linux.dev>; Tue, 12 Mar 2024 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710227307; cv=fail; b=F53oKy+t18VIrTLl6q25HMLhw3wmF0gpoATSAZWidkxAx5jda/9nlbjXqvE5xpcvU3iD+qvbW+00uHNffekg1sLFMwHTgDItueMIPOmdiqAqxYHcrMTlCtMG8Yj0n2n5fxmxinpk4ZUOjpB5vJ57QnJsYLB/1Zp1gqGMmagFovU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710227307; c=relaxed/simple;
	bh=z/rLos4kZfg0W1qWyBngDtIK7ARlGGIbdQeyorwIPYs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gbWRlk0lMmFAim83owusbyU4UDZM+bYM6DpJOTZHl/3mMUIDVm5Zmp9zMIVhXwQopB1T8Ji45NiEkVb7tu1jlqgfT4OK71O8viGPkoka+rShJPjtvPUBP7MRVAyJFyTBbQrp312R32x5IjYWfvBEVV8msaB+Zd+yZJrJI/2Pkwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFOUjdpr; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFOUjdpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710227306; x=1741763306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/rLos4kZfg0W1qWyBngDtIK7ARlGGIbdQeyorwIPYs=;
  b=XFOUjdprRYtYpiY4XRcDsBTn18ovsNgS+MTPT7iUyOErniFWlTkiKqEK
   UMyirtEKBPjgfrdrDmNdcuy8EDqfWtYvQgpmyWdrQb8FmedzEUX0A+W0S
   L/DLfsIPULin9Xyr25z/N34/6RgqF5c3eLwgYklZ5A6U0UF0OoEO+VYaj
   HwTxtjDggrwNs+CZAfyP5+2hN8o+L3zF1cayGbA3NjRGMc47McLhuby0p
   OlPhudiEuDI2At56d1OOH9wV/3OQnil7iWE7EQQB8NlW8Nb3Vu6ILghIm
   qOLvGvCphfd9nd/HpIXwlNeyG43JUMoL0ZMmIXg2pc0GZVFXsRtQse3p1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5107447"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5107447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 00:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42431168"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Mar 2024 00:08:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 00:08:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 00:08:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 00:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td/es+LaYWHtd5dsSg0fwZrTgAGv2omlaafHsTWeM4ndva+Xxz6AoAe9Nsy6JayImoDsMuH9biFKmMkL1TVE1I6znOzgMvYpgzxHnZa0QXb2Av01+fczg0GxJ6uujvmqIiMNDgxe4M0G2CuJ8RIZQmSiJWAGP+TeCrsrYIWipAH2FxLpRi2ZzSYNMKdrWTEoSLE1d0ZJ49eRxqcktza+lnPXoaphSAD/hSqf3yXmup+sW59AuQOFyuLynrMjIyOGQsC5g+NjnuseH4giM6dewHSuIzfzK2asnR7ex3cimve3C41C5FwWGSAHeqSle9D/g3RBALIn10yISO8FVBEMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enkRvecLUJ3HpzBV4UgHqe4Wd+BQqZmi/UZpNsIyiNo=;
 b=ncZJm/Nxoi5HM6vZ41lsggpl46xMJov/s0B9Q3aYY/BL5b0Fnf1IX/5M3dH0+nvZLV4SMMvuWirRpqkvEai3URMe5W/XmgkRlqSfiKa/volhKwNJ8rn26E2l+oR6s9ZPetCY0fTueyr4xX/eL6ZCL7E89e1GzaaEKkVJVN5AqgSy7Wd+eOaesAnFpO9GT3m1+eYkUZuMJJ0N83uqx7d0aWFo3zXBPDJdAAdn5E8lYlBRKGiN2IcAJasI7hGHSpuA2M+tJhh9qCnZmW121rZgALazPDC94qknFUnKbH/oGfYCjC74ihwXSg0WM1P+gWK583q7PKwIxwPFPmKYoUDlpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 07:08:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7362.019; Tue, 12 Mar 2024
 07:08:15 +0000
Date: Tue, 12 Mar 2024 15:08:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:dma-split] [nvme]  a5d61e7689:
 UBSAN:array-index-out-of-bounds_in_drivers/nvme/host/pci.c
Message-ID: <202403121435.b3e4d54b-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: ae94deaa-b7fb-44c5-e2c1-08dc42632f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuA7b1+8V07XnQSZg8J03oWJ4l0rxq1RMlWEtE5cYVRRPxqHYWz8YdgMo1IzjwitbgD1hpsJfFVYxsK6iqphxteuuJRkb+gTSp296OZfFof78LwRbYz7ZwqJbh1wyVEnmuGodHEkHEQ5XcFgb30EbjH4I/VwSklPmRd8/9T5nYdj12gdyG7+9RLPBWXQD4H0C9nTiYT4rKkt7wpDivSWfyDMg7vNqdIvue+uv5H6X8dh6lzYb4JRbplHqemHMpQsPCtI2A1at7deFmFt++TTLmKntl9dLemuS0ovTCVTh60tqzCTYU8QkCwUTjScT2FsaTMHJR5+itsprxhY9/+9aRZIb51kx3RG82ZgKxcbAzDHpn4VW1nRIaR3BGvYvURWAJlEKa4vS7pxocPPyNQn0iOb6Df0S+TsdXYMmiLOqyWTWHf8772Rx8I2dpV+r4uJJo4wH1Vy7Rg1Ga2ho2icW8XbvbYC0dDc7HgkUYsxpf0nSQrjz3hoBQXqoRp+gtdpwi+XkLFqg0BGxBiQM5TfHLP6VWzqBBJq7nf75RFtZ552kVPf1xMSJH9UJK5u+yzQtJydIcR64+VN0xzQKsXGA5AE92Bzke11GHnw+elDJ50I6okfe5pWxCFDHEr1IZbW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qyawrV68GwlWzi/mzEJHkMsmm79Aq0OEzlV/U1herSYp1x7o3sZdL26U5N31?=
 =?us-ascii?Q?Hq2RMHyHMs1cA7q+vIpLS90RBHIWfCVLtnJ05rKV45iXIwlFIKCypM0q0P33?=
 =?us-ascii?Q?XnDqQhcM4sGwgCqDgUGcuBcj5EA2kjSoOBxbbMF+TsSANYaEaQZONfRth8Hu?=
 =?us-ascii?Q?uJbieeVrUVXzCXa4z5TsGauwy9fgYcQVv8US9C3LiTePjqTz+07Gr+8fFY1g?=
 =?us-ascii?Q?Kby9RvdkZBSszvM3lDVFoO5b95n+fGkWfHxdgRpz36iahjZkEbmbEmoCJPLi?=
 =?us-ascii?Q?Fsyl2Eq8/VVz0GXAIdLuv3v/o5oM2ZL/+94phBV6wV+vAUcpQxuSyoS2OwTj?=
 =?us-ascii?Q?En80R/b3plrKZpccch4ylz6E+eo5jYTOXkseM7GIBF4NvOVyFwfxTfETs5wI?=
 =?us-ascii?Q?6+UT1abhPZ4OMdpRvhDJTaGWFVsur7svRWB2RjADWAaqlhVyB87Riggh5O58?=
 =?us-ascii?Q?M+oadahiVxGaR9nGmX71wo9OcOBMLJxmdpgb9OZ2L9LJZKXKBdqjlzWvnu0/?=
 =?us-ascii?Q?zBxPEXexj3JQshMJU0pVVe/vfhw60bNBRhNdwkOBrbcKjULt4HaAliOivxwt?=
 =?us-ascii?Q?ytig+ndxI3pF581S1QBpBrqg7+eC7lBPh3CKbztW4ATq2hA996RQrtkqSlOb?=
 =?us-ascii?Q?f8AQ63es+g4ckKWMnJgMcayTWf6nijc88uU30d7qoV/+gvicqKA8t3Bmggyt?=
 =?us-ascii?Q?tXUreCOrzS3+Sjnxzp41LUuuLVqLHZc7TSP170gu0x1wRPf7UuFj3mB/HcfH?=
 =?us-ascii?Q?flSWiDnhTN8jsupol+oX2MZW6oQpCM0f5vsClQbrNHftGGz7xM2XDSPKRiMT?=
 =?us-ascii?Q?q3gRSiCVORxpyFzAi50esL1DlBQJ8earLYLfoDDJ3tBoiLvqPZHc1V08humn?=
 =?us-ascii?Q?M3le+dmC6U1Qw8da5+fNPB6NdsxodVzzRq1RvvRX/gO5FjoUMUai9xqY9Qu0?=
 =?us-ascii?Q?VDLdDnmBSwzGKg7VfNLcgFK65Wdxg8543jhIpr9++VCGmLQZukZPpNHdBfBD?=
 =?us-ascii?Q?8ZClyE/W23h4VUHEfpT2XfmoX15fIsgCHiXyjEqLsGVEA84c6WXXLqeO78Oc?=
 =?us-ascii?Q?jxO93OlXDeNHhjs5muFqfJEZDS2+qRleI7ydVbsBw9UGpG6JB9eM25e1qzxY?=
 =?us-ascii?Q?o9qbd0fDtxoXEBmglZoBbvfx0xdClKBJCrW1n65wafW5C5KFwBK0ckPOtCY5?=
 =?us-ascii?Q?VUKWQvQvSni+7AuqloWZlupuR9xNsSORdHdWHlqVeBhiagoLAbntfnxWLRxt?=
 =?us-ascii?Q?McN8hF8IqdudqLbTRK0HMScmSGr9mXdi5aM/oDokzOV+zbwT8Ksg+Jz0+EeK?=
 =?us-ascii?Q?TAJF+bUZMG6HQiEAUhS1YtBLtBUZVbl1ihDamM/Rv9KulDVEYY02QfXbW9Ls?=
 =?us-ascii?Q?GAs4qHtFx4SN35bfih+4VC/k+oaSBRAVT/++EQjxGx7FexyjQ7Tvyo/Om9s2?=
 =?us-ascii?Q?3JrvGzD6+V6r3YR5YmfdC+q3lgWaxWk4UBt+V6+hws7VgleR7Ih/OKmNYD1O?=
 =?us-ascii?Q?+8OVcdfEDTooZT+fPmV0znuXVwhOETRjK5dKQNtDgS3LTDAKJzoeaj16dVnH?=
 =?us-ascii?Q?BlqE+it2kscClwJ2ZI5IDBBiKt1+RqZh659QJXzp2YnYdVLnZcSR0EUNDJt9?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae94deaa-b7fb-44c5-e2c1-08dc42632f95
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 07:08:15.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki+Dfo3N6++SATduIfuI2mTzpRmrRaqOXg0E6USuAaAwwNwaOwlwZK2m580TyfNJzOFVKejqNr8q3GOXTdsqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:array-index-out-of-bounds_in_drivers/nvme/host/pci.c" on:

commit: a5d61e76896667a7e9e5385e6f6c8b2d571dd820 ("nvme-pci: use blk_rq_dma_map() for NVMe SGL")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git dma-split

in testcase: kernel-selftests
version: kernel-selftests-x86_64-4306b286-1_20240301
with following parameters:

	group: tc-testing



compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403121435.b3e4d54b-oliver.sang@intel.com


[   94.342338][   C31] ------------[ cut here ]------------
[   94.342911][   C31] UBSAN: array-index-out-of-bounds in drivers/nvme/host/pci.c:538:53
[   94.343852][   C31] index 128 is out of range for type 'dma_addr_t [128]'
[   94.344526][   C31] CPU: 31 PID: 0 Comm: swapper/31 Not tainted 6.8.0-rc7-00016-ga5d61e768966 #1
[   94.345371][   C31] Hardware name: Gigabyte Technology Co., Ltd. X299 UD4 Pro/X299 UD4 Pro-CF, BIOS F8a 04/27/2021
[   94.346344][   C31] Call Trace:
[   94.346704][   C31]  <IRQ>
[ 94.347044][ C31] dump_stack_lvl (lib/dump_stack.c:108) 
[ 94.347515][ C31] __ubsan_handle_out_of_bounds (lib/ubsan.c:218 lib/ubsan.c:347) 
[ 94.348097][ C31] nvme_unmap_data (drivers/nvme/host/pci.c:538 drivers/nvme/host/pci.c:526) nvme
[ 94.348647][ C31] nvme_pci_complete_rq (drivers/nvme/host/pci.c:857) nvme
[ 94.349221][ C31] nvme_poll_cq (drivers/nvme/host/pci.c:920 drivers/nvme/host/pci.c:947) nvme
[ 94.349746][ C31] ? nvme_timeout (drivers/nvme/host/pci.c:957) nvme
[ 94.350292][ C31] nvme_irq (drivers/nvme/host/pci.c:961) nvme
[ 94.350762][ C31] ? nvme_timeout (drivers/nvme/host/pci.c:957) nvme
[ 94.351318][ C31] ? reacquire_held_locks (kernel/locking/lockdep.c:5405) 
[ 94.351856][ C31] ? __lock_release+0x111/0x440 
[ 94.352407][ C31] __handle_irq_event_percpu (kernel/irq/handle.c:158) 
[ 94.352966][ C31] handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210) 
[ 94.353448][ C31] handle_edge_irq (kernel/irq/chip.c:833) 
[ 94.353933][ C31] __common_interrupt (arch/x86/kernel/irq.c:271 (discriminator 22)) 
[ 94.354432][ C31] common_interrupt (arch/x86/kernel/irq.c:247 (discriminator 14)) 
[   94.354906][   C31]  </IRQ>
[   94.355258][   C31]  <TASK>
[ 94.355587][ C31] asm_common_interrupt (arch/x86/include/asm/idtentry.h:640) 
[ 94.356094][ C31] RIP: 0010:cpuidle_enter_state (drivers/cpuidle/cpuidle.c:291 (discriminator 1)) 
[ 94.356677][ C31] Code: bf ff ff ff ff 49 89 c6 e8 49 08 51 ff 31 ff e8 02 8d 6d fd 45 84 ff 0f 85 49 02 00 00 e8 64 01 51 ff 84 c0 0f 84 31 02 00 00 <45> 85 ed 0f 88 95 01 00 00 4d 63 fd 49 83 ff 09 0f 87 43 03 00 00
All code
========
   0:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   5:	49 89 c6             	mov    %rax,%r14
   8:	e8 49 08 51 ff       	callq  0xffffffffff510856
   d:	31 ff                	xor    %edi,%edi
   f:	e8 02 8d 6d fd       	callq  0xfffffffffd6d8d16
  14:	45 84 ff             	test   %r15b,%r15b
  17:	0f 85 49 02 00 00    	jne    0x266
  1d:	e8 64 01 51 ff       	callq  0xffffffffff510186
  22:	84 c0                	test   %al,%al
  24:	0f 84 31 02 00 00    	je     0x25b
  2a:*	45 85 ed             	test   %r13d,%r13d		<-- trapping instruction
  2d:	0f 88 95 01 00 00    	js     0x1c8
  33:	4d 63 fd             	movslq %r13d,%r15
  36:	49 83 ff 09          	cmp    $0x9,%r15
  3a:	0f 87 43 03 00 00    	ja     0x383

Code starting with the faulting instruction
===========================================
   0:	45 85 ed             	test   %r13d,%r13d
   3:	0f 88 95 01 00 00    	js     0x19e
   9:	4d 63 fd             	movslq %r13d,%r15
   c:	49 83 ff 09          	cmp    $0x9,%r15
  10:	0f 87 43 03 00 00    	ja     0x359
[   94.358420][   C31] RSP: 0018:ffffc900003c7d88 EFLAGS: 00000202
[   94.359031][   C31] RAX: 000000000005f091 RBX: ffffe8ffffb81d98 RCX: 1ffffffff0b7e149
[   94.359795][   C31] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff83c72b6a
[   94.360566][   C31] RBP: ffffffff8567c560 R08: 0000000000000001 R09: fffffbfff0b7ec8c
[   94.361327][   C31] R10: ffffffff85bf6467 R11: 0000000000000000 R12: 0000000000000003
[   94.362089][   C31] R13: 0000000000000003 R14: 00000015f73dceaa R15: 0000000000000000
[ 94.362857][ C31] ? cpuidle_enter_state (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 drivers/cpuidle/cpuidle.c:289) 
[ 94.363400][ C31] ? cpuidle_enter_state (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 drivers/cpuidle/cpuidle.c:289) 
[ 94.363930][ C31] cpuidle_enter (drivers/cpuidle/cpuidle.c:390) 
[ 94.364395][ C31] cpuidle_idle_call (kernel/sched/idle.c:219) 
[ 94.364892][ C31] ? arch_cpu_idle_exit+0x40/0x40 
[ 94.365394][ C31] ? check_tsc_sync_source (arch/x86/kernel/tsc_sync.c:393) 
[ 94.365939][ C31] do_idle (kernel/sched/idle.c:312) 
[ 94.366357][ C31] cpu_startup_entry (kernel/sched/idle.c:409 (discriminator 1)) 
[ 94.366838][ C31] start_secondary (arch/x86/kernel/smpboot.c:224 arch/x86/kernel/smpboot.c:304) 
[ 94.367335][ C31] ? set_cpu_sibling_map (arch/x86/kernel/smpboot.c:254) 
[ 94.367876][ C31] ? soft_restart_cpu (arch/x86/kernel/head_64.S:498) 
[ 94.368375][ C31] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S:461) 
[   94.368979][   C31]  </TASK>
[   94.369313][   C31] ---[ end trace ]---
[   94.371070][   C31] nvme_log_error: 12 callbacks suppressed
[   94.371074][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074216960, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.372524][   C31] blk_print_req_error: 12 callbacks suppressed
[   94.372526][   C31] operation not supported error, dev nvme0n1, sector 1074216960 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.374282][   C31] Buffer I/O error on dev nvme0n1p4, logical block 0, lost async page write
[   94.375121][   C31] Buffer I/O error on dev nvme0n1p4, logical block 1, lost async page write
[   94.375943][   C31] Buffer I/O error on dev nvme0n1p4, logical block 2, lost async page write
[   94.376764][   C31] Buffer I/O error on dev nvme0n1p4, logical block 3, lost async page write
[   94.377584][   C31] Buffer I/O error on dev nvme0n1p4, logical block 4, lost async page write
[   94.378404][   C31] Buffer I/O error on dev nvme0n1p4, logical block 5, lost async page write
[   94.379225][   C31] Buffer I/O error on dev nvme0n1p4, logical block 6, lost async page write
[   94.380045][   C31] Buffer I/O error on dev nvme0n1p4, logical block 7, lost async page write
[   94.380872][   C31] Buffer I/O error on dev nvme0n1p4, logical block 8, lost async page write
[   94.381692][   C31] Buffer I/O error on dev nvme0n1p4, logical block 9, lost async page write
[   94.396085][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074217216, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.396981][   C31] operation not supported error, dev nvme0n1, sector 1074217216 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.399424][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074217472, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.400314][   C31] operation not supported error, dev nvme0n1, sector 1074217472 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.401929][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074217728, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.402816][   C31] operation not supported error, dev nvme0n1, sector 1074217728 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.404410][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074217984, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.405294][   C31] operation not supported error, dev nvme0n1, sector 1074217984 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.406598][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074218240, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.407476][   C31] operation not supported error, dev nvme0n1, sector 1074218240 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.408772][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074218496, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.409648][   C31] operation not supported error, dev nvme0n1, sector 1074218496 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.410939][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074218752, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.411815][   C31] operation not supported error, dev nvme0n1, sector 1074218752 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.413105][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074219008, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.413982][   C31] operation not supported error, dev nvme0n1, sector 1074219008 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0
[   94.415278][   C31] nvme0n1: I/O Cmd(0x1) @ LBA 1074219264, 256 blocks, I/O Error (sct 0x0 / sc 0x2)
[   94.416155][   C31] operation not supported error, dev nvme0n1, sector 1074219264 op 0x1:(WRITE) flags 0x4800 phys_seg 32 prio class 0



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240312/202403121435.b3e4d54b-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

