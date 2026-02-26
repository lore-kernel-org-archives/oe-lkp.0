Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED16B3164DF
	for <oe-lkp@lists.linux.dev>; Thu, 26 Feb 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112822; cv=fail; b=cLeqsGjkpfIL7RorKbVySfMwVtG+6JBP4FKV9pavvJBka0H9tc2N2tBTsyE+D237vYnd+9Z2GNrxlR5KrDQ9actbesnMGZkKHTRRfroNcjSADe7FsHguBkIz9DKld9ZcFDZMfvSEd1EKTwJMc5zM5pUTJDrSALDQyUSHbM2bk98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112822; c=relaxed/simple;
	bh=HMlJEVpZyc6Zrq4TiJ0n1Tl4loB96WWHuPUcf7+Kkuo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=beYPVe+zLS5u2y5NaBf1nC8PhZ32ofN7IXy9yuPkmtf7ggvJ9JIRs1pX64B2ynICWMhO0x2xlv9pgzjbTu4Jvco7VS225qk5sQsx1MHt2FbkcBTwvXes6p+TtDSHMOcP3NqQPomrWejmjL0+5S5ARn4bvTs0FC15xjMMKbBDGow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6UI/jOz; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6UI/jOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772112818; x=1803648818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HMlJEVpZyc6Zrq4TiJ0n1Tl4loB96WWHuPUcf7+Kkuo=;
  b=R6UI/jOzzEKJsUM35I7fpD60Z3lbLqbyVPXG+C/9GCpgZucrGKOvlDCg
   6Q4jdhNdvJkwDdfvLQ8TIgM6L6ouBHbBmEI1qIdZy9c8rmeM2rG0tVzwY
   acRZbOkzdZUmkvymx1V4Gbluubl7wFhgYV9/TdLFqwhyPJOoEyU8p0+wo
   FLUFh2fAurY9l9Ihd86Yv+AKaRkzD8vIQS5lZBdJ/bIWnKtyeLFxRWCmc
   ykUQt6/j59KaQEeWuDEtYedJW2Z/tRDHqfoT563PCmyhwFBsU9SK8mx1Z
   ZnDwlKWC5BGu20gXuP129EZLjcWvTEJZ8JnCEZL4WfLAFxxgdXbnme2U1
   w==;
X-CSE-ConnectionGUID: +gF0F/2KQNKu1UPlSCtPGg==
X-CSE-MsgGUID: oL3zSgZnTuy84gLE2izB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73217090"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73217090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:33:36 -0800
X-CSE-ConnectionGUID: KL+3ztIuTMWkG7TCn7pHqw==
X-CSE-MsgGUID: 6e0mgO05R6ee008ZBaEwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216582097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:33:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:33:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:33:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:33:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBwaFCYlRMiMXa4m5+4Lv4Y78daJED11SJ26udPy+l1Y0k/w4GNIyAdwb3pyIWk7zSLnNhERVmguvEWiet5a3DGKzn9QMQEyQe8RtflSxx0SotTtjw8zD9mW09upK4/RIMeRDN4Gt3yn0IinIc9Id80Dh6MTIvrq81fjooncn+QN5+q7yOi0yWDkzm6IE3A5lSMCPmRYp0kg8Rc9RrH2CxoyCM9tqoduVr4DJruGboe35UNE36Rdcqjzx6F0d3KzJQdLybr+mArAxarjBh/tfA82+rmGt2rojOvCSrA+JX8nvKU7X2qDpCsuHGauHcL5GMSiXNwBhGH9Ac1KOEjBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKNi3wylOJ5SCQGNz1QGGDXf6ZOxUVhZhgVFdD6aSis=;
 b=GIKWLVpfxxFuKU9cu0xT4GFJeZubGlco+EX5BJah1X4qBqsbajMZ6gvSIUj8qzE5GFoDAaB6E2VfnsV6kuNQCWfXyeiH5aDjzGAN/HSgtiz7iBzRg/sKQ+juNFIBhuSRgR7H2uHFOsLv40sBDo86XwYevnYprwF5A72za0Fpl4abmSYBvj6RpszLFn4qn28ClD+Pah/yqh7jgVaNJ6oWGQjTHvF3RGxSJ12EEHcjCJEhYgzp9AQPAC0SJY1gY+GKyZs0MAaINSGw7wbGR5EVpw0P6bmA1egtJ2wwPWFogs/HtlZf3nvnuQP6oQb68aKDrsCl1JCsQK6AeeeQS6j5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 13:33:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 13:33:33 +0000
Date: Thu, 26 Feb 2026 21:33:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:uffd+guestmemfd/v1] [mm]  434b076f19:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
Message-ID: <202602262151.7c6def5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0036.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dbe3ad-ee0f-4a73-e7e5-08de753ba2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: dSuQrWh/67DrMu2SRChUCp0wHCBfqUGIlafhHlqXXF4L6MUsveJUOAtiGI92MCMBkAJP4VCD7TZ1Pl9W0iaOOAHtS3s24/zdHRG10OIV1u6JksyLd0ZtHq/tlJ2Gvlh7FOTO32nkrcCGr2jGlGX2AgZGg11NC7v2DELhVusT+xhNrsG0TTMAGBlHfHMFUam008355NZMepBORhF9XRBqy9idhZuFQVbNOQKeNuwPjWgUV9yDETh3Z3ie6ZKdOoDt38Bt3MFB7PqIK6gpkzeOJPjovr8vomPMMR5l+4X2pSWx1RW+8jvz7lmJijYapZ2u6meRaJMP3z26vXOcmRkF6LzR53adzJYdpIddrM4IKGqboDSlCcW0trG6dywtYULB9NmjqbJlxeUVs4fDLHvc9IZdYpzxxuZJYqBXTWmf4IS94M1Ck8b5jQl9LMW9wrbStkemDyWNihN4lcexjLVWjrYKOxEJtpVitXZ0TYAn5eg3h9b+7xcsXbftm6vtewffTFsmMtbHqcUvSG8QoG/VW14G88dr8+FYgG9DotMsc72INU51Xr1Uw8WVMiktIdDt6/X/7F6q2yFg1AF88eyf5AXwdJynVpw0YsQlv0Jt+JYoUs5Pwlh/5dmtM6Mpz61olqW01FWSFpRIXeMp0VF4rx4DFfPkmtQ4IOhfbSVbxxuZ1NzT4MysO+jdYGSkoXYKSynR+JGBwU2ukmGKr19lkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4w9qAlV0bvcAG/fQ9b9enlc/u1RvQqRF3G1NKkwdrurKIaOOOoM/USe0K5o0?=
 =?us-ascii?Q?8u7BQTneRKowYFuM0eUzPrkUPvForo4g054dQyoHfbjGWS3LVZz6LHNr0GDX?=
 =?us-ascii?Q?Dkrys6sWD+RD85IhQKq+XiYeDDMVprm9B9StYvIopJY5MfV5kmG2XkpRgJFA?=
 =?us-ascii?Q?nSpp9hHEs/7O6LL79LvqR1rEGsVlWpoq9C/E0zQCubODfbyQM0qMkmuF02I8?=
 =?us-ascii?Q?qU6rrD4jNnfd58ktoz3aFEufWKtBs/MdcXXLSbnxxHIxgI14Cb5qN8kGXepj?=
 =?us-ascii?Q?PnncozfmSzelZrcUtzlSyfDY8h71QIHtgiF0IdTFS/XemJoGL5Q1j8xewMJG?=
 =?us-ascii?Q?PTW5avsxNhHc/YYwnXsrRWio1fRy2givHLBWb7HL9Z3ibmw5RApZczQQJrb8?=
 =?us-ascii?Q?wBTbz0XroROHlvhcOO4Co8Va84Oks+FXti3zRLr08bz+iB9d2cp74jj3m/N2?=
 =?us-ascii?Q?/z2CLxvVgnsEAeZ1pkQoC8tAuZHLy36JmddqcDe74WSex5E+YrdjN2YBLwjD?=
 =?us-ascii?Q?snwhSeqNal9unRQ4Kc7QIMCum+AL5aY7VN3YDWj+qnAsquL+tDZ+ExqeMElk?=
 =?us-ascii?Q?gFvGHr0Zyg9xf+tNc//qYlO/Fr7lq+zzTEsOuzDEhXiUwYKuixSqpFYSDlY9?=
 =?us-ascii?Q?rB/tN2M2Ie3pr7udHjb03/ts0qlH4pCWu9iMWjSds/jaQv3Ihk6q5nlF4JNb?=
 =?us-ascii?Q?jrwL108Su2Uxoyy+OuIpqbQM5TIrYPyD0lm7TkOvbeg/U/w8ziNOFAmNa6Wg?=
 =?us-ascii?Q?U6JHJ2Mduc9U4xatJ/X0lTbWWcHxYdEhR9TbAhyg6b7YHCRlEZaTjfoL5MtB?=
 =?us-ascii?Q?SnamAIRY//qYd7uGu8CF1BGpK1XinXbv3ARgXlIS/J10zNmz34b7pUunYyt0?=
 =?us-ascii?Q?HYY5/QuDpbaqIn5qi8cOtUZIzI40wV3jFr6pi1pkIHPSFNdedHxWUpTL7BlQ?=
 =?us-ascii?Q?tQGHlJByVQv/Ha+0Ld/yhS4jbFksWV0m+ZmMQgg6sNbPICwL7qa6eHHhx81U?=
 =?us-ascii?Q?F2GOOkdQ+5cNSW8OItk6HVF9bJ/CkYEcdDZizGAstQZrSFHc8Hhrq8RvR7WZ?=
 =?us-ascii?Q?ecFlFsi8NGlpQgCpzOkUUvw5k29bb0z8GQ/1mrZf8i18KU70cGdlyUybVTxA?=
 =?us-ascii?Q?WMvUCBap/uSisXt3Lg4Ewn1rhwihIREpdsJbaOWo5zeHViIBLnKICKfeRdys?=
 =?us-ascii?Q?OTSnJQhgtHaVr/Bkbx+LsmF9ZrihzXzIqalo1o14tw3lZXCQCCntOAUl6wH7?=
 =?us-ascii?Q?dY5GOsZGaTwtFe/jyYnYoSg0k0b9gEbOra4no93+xCX8pd3+SgDd1p43sUUj?=
 =?us-ascii?Q?Wbn0tKuhb9+aHoAX41Beke6Iqd5XuLv5VDH4sNZ+o9qUJsx9k6/Tu/g1Xx3A?=
 =?us-ascii?Q?JUQnPoq97dDETReazdDtvYUP+GswFIz7rrwOZ/ksN+kwp7z1ZbPQGbLxLzo1?=
 =?us-ascii?Q?5agXBsDFDtjobmd0GQxUl/UZMNiUa/fD9AfBVoT7+SlNr4gXoF5Ion3jDhnQ?=
 =?us-ascii?Q?X/zU+43rbZXtwgH+32UF3M6tXR6v8FGm3rtyLEVf43jy8JtCRm2RMuPx7kxS?=
 =?us-ascii?Q?Hx20p4/47FdIn1NDXiR4LEd6eYrcHX+PLS3m8ekWLa/qEQvmj+nB+iAcK/FP?=
 =?us-ascii?Q?GxS1CrcP3GQnZeLMVFQD5bfeDyIBgdTF/u935xeaPTdIbBmPTfIP1Rw/cqis?=
 =?us-ascii?Q?DhgqTtt2Qjg+c0n3qN6bMjgC1KtCQCyN07cHdNvGpAl4pgurr00Kh6uulRl3?=
 =?us-ascii?Q?Tgwi5crYMw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbe3ad-ee0f-4a73-e7e5-08de753ba2cf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:33:32.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTlVYRbeGxIrYi5e7NoweeR/sU2piVf91Q8uA8qFLPnf+x254FcraBmkIg9RRvpiHXYpsusql8b8EyWiro6pfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN" on:

commit: 434b076f194575bb3b654f784d6c6c4941dd7d7c ("mm: generalize handling of userfaults in __do_fault()")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1

in testcase: boot

config: x86_64-randconfig-006-20260225
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602262151.7c6def5-lkp@intel.com



[   16.977978][    T1] krb5: Running aes256-cts-hmac-sha384-192 prf
[   16.979677][    T1] krb5: Running aes128-cts-hmac-sha256-128 key
[   16.981543][    T1] krb5: Running aes256-cts-hmac-sha384-192 key
[   16.983376][    T1] krb5: Running camellia128-cts-cmac key
[   30.544255][   T30] Freeing initrd memory: 131356K
[   30.549597][   T61] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] SMP KASAN
[   30.550537][   T61] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
[   30.550537][   T61] CPU: 0 UID: 0 PID: 61 Comm: modprobe Tainted: G                T   7.0.0-rc1-00012-g434b076f1945 #1 PREEMPT(lazy)  45cb5da13f758fa7ca78e6625d0b3401df01cbcf
[   30.550537][   T61] Tainted: [T]=RANDSTRUCT
[   30.550537][   T61] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   30.550537][   T61] RIP: 0010:__do_fault (kbuild/src/consumer/include/linux/fs.h:1352 kbuild/src/consumer/mm/memory.c:5335 kbuild/src/consumer/mm/memory.c:5401)
[   30.550537][   T61] Code: c1 ea 03 80 3c 02 00 74 05 e8 f1 9c 0a 00 4c 8b a5 d0 00 00 00 b8 ff ff 37 00 48 c1 e0 2a 49 8d 7c 24 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 ca 9c 0a 00 4d 8b 6c 24 58 4c 8d 65 20 b8 ff
All code
========
   0:	c1 ea 03             	shr    $0x3,%edx
   3:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   7:	74 05                	je     0xe
   9:	e8 f1 9c 0a 00       	call   0xa9cff
   e:	4c 8b a5 d0 00 00 00 	mov    0xd0(%rbp),%r12
  15:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  1a:	48 c1 e0 2a          	shl    $0x2a,%rax
  1e:	49 8d 7c 24 58       	lea    0x58(%r12),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	74 05                	je     0x35
  30:	e8 ca 9c 0a 00       	call   0xa9cff
  35:	4d 8b 6c 24 58       	mov    0x58(%r12),%r13
  3a:	4c 8d 65 20          	lea    0x20(%rbp),%r12
  3e:	b8                   	.byte 0xb8
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	74 05                	je     0xb
   6:	e8 ca 9c 0a 00       	call   0xa9cd5
   b:	4d 8b 6c 24 58       	mov    0x58(%r12),%r13
  10:	4c 8d 65 20          	lea    0x20(%rbp),%r12
  14:	b8                   	.byte 0xb8
  15:	ff                   	.byte 0xff
[   30.550537][   T61] RSP: 0000:ffff8881084f7cc8 EFLAGS: 00010202
[   30.550537][   T61] RAX: dffffc0000000000 RBX: ffff8881084f7dd8 RCX: ffff8881084f7d2c
[   30.550537][   T61] RDX: 000000000000000b RSI: ffffffff84fcb2c0 RDI: 0000000000000058
[   30.550537][   T61] RBP: ffff8881247def00 R08: 0000000000000000 R09: 0000000000000000
[   30.550537][   T61] R10: 0000000000000000 R11: ffffffff85c4a357 R12: 0000000000000000
[   30.550537][   T61] R13: 00007f05c18e8000 R14: 0000000000000254 R15: ffff8881247def00
[   30.550537][   T61] FS:  0000000000000000(0000) GS:ffff888798911000(0000) knlGS:0000000000000000
[   30.550537][   T61] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.550537][   T61] CR2: 00007f05c18e8020 CR3: 000000012af53000 CR4: 00000000000406f0
[   30.550537][   T61] Call Trace:
[   30.550537][   T61]  <TASK>
[   30.550537][   T61]  do_read_fault (kbuild/src/consumer/mm/memory.c:5840)
[   30.550537][   T61]  do_pte_missing (kbuild/src/consumer/mm/memory.c:5974 kbuild/src/consumer/mm/memory.c:4477)
[   30.550537][   T61]  __handle_mm_fault (kbuild/src/consumer/mm/memory.c:6358 kbuild/src/consumer/mm/memory.c:6496)
[   30.550537][   T61]  ? remap_pfn_range_complete (kbuild/src/consumer/mm/memory.c:6398)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260226/202602262151.7c6def5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

