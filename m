Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65A64F
	for <oe-lkp@lists.linux.dev>; Sun, 31 Mar 2024 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711850808; cv=fail; b=Vn2uz5f/DMNVM6SOjO6xmcu2IVF8d11xzsdeuaaqTsz+vx3jh1ZJDzuNFVRsluUou1FqKYofWbHObEitDClWnp8caFV6kY3h3K2Y+5aQ0vq1TqBbi9v+3szWKyqbZ4XZM7Qu8dMa9a4Z19MQX9qkfnlmO+Xp1x03IjaXrjVR+1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711850808; c=relaxed/simple;
	bh=Kn+Hp+NWJTLpuzJDs0mXP9pScH49NvCTVO1mCpTRCnE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZbvAxSeWjvhoq8cnI8QfVyPqUqJGTXlUyy7Z34OP1wzPLZSt+NJ9FxziyzlXFiyhEo3Yh7nzRClAiMXDlU9haX3dQns8g8boQ1sfvlYsYwO3ZEh28ztTRD2yGQYtrUyIs4+hZrRTzPVC+HWDyadUSo3PnRbO1pNHY5YBsEuEuw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC8iFbk1; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC8iFbk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711850806; x=1743386806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kn+Hp+NWJTLpuzJDs0mXP9pScH49NvCTVO1mCpTRCnE=;
  b=LC8iFbk1zVQUEn3Kj7/L64BfixWK8dPg5QG7N1NhY863nLY/EM6s53iH
   FWpkEHfdHvmPQUYZsPbX6xUJyx02HbVZ1EhzdxNiz9K3JAdouNaGdRDHi
   JzODw+eeJ24o1pFfNZgk3pbBDfbZYhyKaZy6CDaJrw+mXwKxTX8HFlE6C
   xwkrg8ldBgxtMuTRPw/GU8ZcVfwAzf8q9teTVVQGl6zQOm2gDZZUkgw8j
   7gRZDu87SRCeDpm63mnzShTD7O92j0JlbhMU/EQ9HoeMImC7qkogvCtTf
   PHZ1vCe7RE35PtpIgMJB7BIaU6PrXHJAJgWu+7jY1siXuBkmNNdJPQ0Re
   w==;
X-CSE-ConnectionGUID: NDhlQ/1iTW2GoA8N7zQBDg==
X-CSE-MsgGUID: 2W3lMFDaRo2/M9W3Vr8hVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="32410276"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="32410276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 19:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="40492557"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Mar 2024 19:06:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 30 Mar 2024 19:06:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 30 Mar 2024 19:06:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 30 Mar 2024 19:06:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 30 Mar 2024 19:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLX3y05KfkLVNEQnCrj3rMg9wlZxQA425fcQ4ShSRXAxi7MObH/q1phmKFHw0OMA8yBYAG2r+VD+x+qN4DWIijXqs5JC8xRyKWFnoq6QAueB4w/H/Fiuva7CdcuwhH8QXKzv+Zjgv1C8QiML/og6zKxJ/RTW5DZnp9dr0BTMuSM1ziThoMZVfSTJVvYPmOpAAiEg0FtP36M8P/yX5FYflVvRMVHoH5PlghVpZtb2WUU5ilAe23l50qH505oaX2SlJ3GFB58xp+p8HAGSJHhQNgYdN7n8v1hfmlBgFr+fJf4ZLs82O8jDixnoeHnNXR83zE2RltY16oKvFepZaxwDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX3FZeRkkEyfKPk6PGBPhRnJd6jYMhyUOU+E7Fa/oYA=;
 b=eG8FHalPx+joBiO4RbLLS9Vx27rllOVAZnCKNy/ErPo6p6tW6x+qBx9LBsRLOiv0p17R+2SulwwE/WDjynKdkDzk4Dn1h1brfkLt2aCWsSwNgZgzDcOpp8XY4hJwh6h1c43rg7g7e3z4k8ufkln3AtbAuxpBa+5J5hSvOPP2upVIBr9Kz0Aru/PuvYkyVRe74/EoGdlxiQ9ZYMaDDm8DtBh6hLt4Olbf7nswUyN7qxqtUQVjqtMH+6syiZrCjuea7GxpvYihgDDn6M0mTslVqFUFiOgoJCtf99IfRhqLeoHTMcyQNOEybIuL8IUMXj46pSKTnv5HJKsB+4VrReasyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Sun, 31 Mar
 2024 02:06:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7452.019; Sun, 31 Mar 2024
 02:06:35 +0000
Date: Sun, 31 Mar 2024 10:06:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache] [net]  b18c35c75e:
 kernel_BUG_at_mm/usercopy.c
Message-ID: <202403310850.950947b0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7719:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHetuafZd0C2B/+i1QzjmhrXjcF/miBjE6LTds1M0YrPqWQgbf3YHxohAcidSaoZzmPFNqpjo3eeOgcuDVHOYtIy0c1keUOgtibsVBOcoeTY9HTN7qiKYpMQ50K8k5aPv2TZfndIUJMDgADF3q//JvltRu0iqlN4vkTCuMoL3e2DQkvkbY+98tfF2NDLcolwfB7jeumUWOXIQkNukUrna52N6VQ3okAGu9aXGh8hzOU/723WqSRSgjGw7PljxcLvVN/izP1rywyeqybQMrv2oCrzHOS6WBwPe/i4R2mvxRqWVNW1Oz4aTNdLmaG24RvKoyYHN0wFNR+RRPS2TftHcUoY3tYHYpXjsNrDPT0QEqBuT6VF/LIkWD9aiwsl6CtOSDq4WvJfFPQdUAcHTgWX7CgcqeJFW5nzR7SBFAXUVW56oqtbPj/GOz4sbYBjqUfXBHNlbfyD1APXg3iW1N//i8wbexx/0I5itW7os7UnSVt8WMCcukDVbY94oJXjH/YczLe+19bVjVhbXYVwUKjn2n3djZPiyF0uHW6cgVyiaquNT2/mIHaf7w7bEPfRfuLYUrDBg+m6n/4ZVqVci6S9IcYuIION/uFrz2xIc2GGnzPlhBcEt//cBq0Le3dJDNRa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnlPRGoGNIY5ynqLHgujYRRMHPKyRkejz9IZS++BO3E+R1PDzdWVrQtRUf8h?=
 =?us-ascii?Q?Pe9M1Chb4Iuft6h0ZKkG92VznItLVv1dlcva1MHh7ulJNAYcr1QP5M7VFkVR?=
 =?us-ascii?Q?mKNJ4YoXNSwLrA9Ht9P97md+DY8rEFCnG4LH+SlRghVOmuH0azEjZfuAfo3n?=
 =?us-ascii?Q?SPO9Nu4SQjnO6Xu3M8cPFAGVHR10VzvDWuV8EDLxbsJ7f0gneV2vt4ltC0YP?=
 =?us-ascii?Q?Uw+vEeXtZGaSmS7Ba37Dgb8sa2ksvR/Zed4tC4TOWIfzb4O6jkbcsQok2vOg?=
 =?us-ascii?Q?1Sy1b+UekBhWLIwrVSCs+fqKTzRvgOPT4Jcc5SsCDbA299BldE3JxC+EpLSu?=
 =?us-ascii?Q?vw6tx0xdRatr9RbO9E4W2bVQsGWOm+WbPj7OFSCKkAr8xhf4pJiic5As8QR9?=
 =?us-ascii?Q?MhKS5hV3sxBw8je9CC5inxR4VdiEGyahKX0Umv7kYcoHHDscih9F3wjcfgsb?=
 =?us-ascii?Q?DZam9a9to/vJBF8vtPrhZ544/vR54IqTv2OaiToRPHw9mnYxQ0lU0ThcsW1+?=
 =?us-ascii?Q?5kiwJEHsrK1Pty1AH3Hpqkenduf7p9QNFpXLAwzJdett4TV+AFft+Tk3IPXo?=
 =?us-ascii?Q?YHIwVzl5CpEkFqR8I2ntlQQb2Ss75GTHMQEYj2PhRseLmP9YUf7KQfe0Cvh4?=
 =?us-ascii?Q?a5SNgf6vcoFYBvKh1tXBz5SbN/aWJ9B8LFoB49ElE1jWW2MpHZvW5dD0bkvq?=
 =?us-ascii?Q?hzGEwupo4ziui6RmOXvlyKrmWZj+gboEtwQUnVfHWzfqmIdfiIRBzrBstDsp?=
 =?us-ascii?Q?T0GHMYiFsn5fDmzEoxWEVmJwyK0FCQWGN2/GeMuOxRdQO0qhM6udvXNZp3Tf?=
 =?us-ascii?Q?rpdNJtiO0tjqnr2lpnqleMEUUTbS1ryy7fNrho6OIQiuN0S10vhMeLoNri/n?=
 =?us-ascii?Q?COjebK7+9Yh8YEPXKC/4BwPMqsYU5GvMMw2h8JKDYMq6eaQnz3PvHnMJoRR4?=
 =?us-ascii?Q?VkAKho68LnhQHsbVS4KGBph79a6AumuamlXQeOOI/IHu+0IEIaoY/AmbP5Di?=
 =?us-ascii?Q?oT3vO0jVJ+njpwzePAjfHeoK626eeHT695jvMYYXyqBZnxeelgT+s9XeSN98?=
 =?us-ascii?Q?nHchkCwJcC24E0XugIR5o2q8XMy9+Mi/nrJjgJSnBRaEwzKc5fExXuJ3Yhml?=
 =?us-ascii?Q?qTgaY1g3iudDugMdiIsoqwgRaZ1Vl0uTK/UCFmTTzCTPxPixgDoQQXfPKcQ4?=
 =?us-ascii?Q?OX+/96ePhIWb55Ah189fvvLULom/wKxhd1Jmt/k3KS9ZsC+sEehjW3697Qrv?=
 =?us-ascii?Q?5NvdSe62Ol1IEUK+K1Q2a7JQ3Tm8crAscoIxVCeQFS+7WOYy9uI2hjE1GiNz?=
 =?us-ascii?Q?4X0oQ9B1HGz2oG1CYbhNLwyjq2Fj66w+G99ioLXdfBg/ToHAzNt3PtdHFGT4?=
 =?us-ascii?Q?xFq+iLSDeVWxQOt465EwLAWWFkVKnpxJ8WKN8M2iqX1f3+uUA6JogzJnK4HA?=
 =?us-ascii?Q?WiyAH1Zp/z+DLcq9ioEEFGT40c4pEv3iZRH9YG0BtmSRF8QYkYhxqIX43kBK?=
 =?us-ascii?Q?48exi4Y7SyiL6mvKL/xSLYSW45R6CBRggsNiaHjE9xI2VBrPw8coVoj6X9pY?=
 =?us-ascii?Q?hAaPKKdgJTI9hDgSwzSI9LqS+R3RgCSnLR367RgL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7a24ec-d631-4ca3-7c12-08dc5127313e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2024 02:06:35.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOiyk+iMZrsexy83WCsAwqJOcXV88/7Ls5Dw5RxUAfHXlgtQXq0OT88i1wwXcKe7hKeMEJFrRwAX0G2B2NQAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_mm/usercopy.c" on:

commit: b18c35c75e141b9cf0d8ac75d687d434946f78be ("net: replace page_frag with page_frag_cache")
https://github.com/gestionlin/linux.git page_frag_cache

in testcase: boot

compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 3549b28ed8 | b18c35c75e |
+---------------------------------------------------+------------+------------+
| kernel_BUG_at_mm/usercopy.c                       | 0          | 8          |
| invalid_opcode:#[##]                              | 0          | 8          |
| RIP:usercopy_abort                                | 0          | 8          |
| Kernel_panic-not_syncing:Fatal_exception          | 0          | 8          |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403310850.950947b0-lkp@intel.com


[  399.409298][ T1968] ------------[ cut here ]------------
[  399.409717][ T1968] kernel BUG at mm/usercopy.c:102!
[  399.410216][ T1968] invalid opcode: 0000 [#1] PREEMPT SMP KASAN
[  399.410896][ T1968] CPU: 1 PID: 1968 Comm: rsync Tainted: G        W          6.8.0-13171-gb18c35c75e14 #2
[  399.411598][ T1968] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 399.412329][ T1968] RIP: 0010:usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.412736][ T1968] Code: 56 b3 50 48 c7 c2 00 30 56 b3 57 48 c7 c7 00 31 56 b3 48 0f 44 d6 48 c7 c6 40 30 56 b3 4c 89 d1 49 0f 44 f3 e8 27 09 a7 ff 90 <0f> 0b 49 c7 c1 80 2f 56 b3 4c 89 cf 4d 89 c8 eb a8 0f 1f 44 00 00
All code
========
   0:	56                   	push   %rsi
   1:	b3 50                	mov    $0x50,%bl
   3:	48 c7 c2 00 30 56 b3 	mov    $0xffffffffb3563000,%rdx
   a:	57                   	push   %rdi
   b:	48 c7 c7 00 31 56 b3 	mov    $0xffffffffb3563100,%rdi
  12:	48 0f 44 d6          	cmove  %rsi,%rdx
  16:	48 c7 c6 40 30 56 b3 	mov    $0xffffffffb3563040,%rsi
  1d:	4c 89 d1             	mov    %r10,%rcx
  20:	49 0f 44 f3          	cmove  %r11,%rsi
  24:	e8 27 09 a7 ff       	call   0xffffffffffa70950
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	49 c7 c1 80 2f 56 b3 	mov    $0xffffffffb3562f80,%r9
  33:	4c 89 cf             	mov    %r9,%rdi
  36:	4d 89 c8             	mov    %r9,%r8
  39:	eb a8                	jmp    0xffffffffffffffe3
  3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	49 c7 c1 80 2f 56 b3 	mov    $0xffffffffb3562f80,%r9
   9:	4c 89 cf             	mov    %r9,%rdi
   c:	4d 89 c8             	mov    %r9,%r8
   f:	eb a8                	jmp    0xffffffffffffffb9
  11:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
[  399.414107][ T1968] RSP: 0018:ffffc900031df908 EFLAGS: 00210246
[  399.414554][ T1968] RAX: 000000000000005b RBX: 0000000000000000 RCX: 0000000000000000
[  399.415118][ T1968] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  399.415683][ T1968] RBP: 00000000000013cc R08: 0000000000000000 R09: 0000000000000000
[  399.416271][ T1968] R10: 0000000000000000 R11: 0000000000000000 R12: ffffea00048f2600
[  399.416876][ T1968] R13: 0000000000007ec0 R14: 0000000000000140 R15: ffffea00048f2600
[  399.417464][ T1968] FS:  0000000000000000(0000) GS:ffff8883ae200000(0063) knlGS:00000000f7979700
[  399.418135][ T1968] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  399.418608][ T1968] CR2: 000000005668e000 CR3: 0000000114249000 CR4: 00000000000406f0
[  399.419193][ T1968] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  399.419758][ T1968] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  399.420334][ T1968] Call Trace:
[  399.420593][ T1968]  <TASK>
[ 399.420813][ T1968] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 399.421094][ T1968] ? do_trap (arch/x86/kernel/traps.c:114 arch/x86/kernel/traps.c:155) 
[ 399.421402][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.421745][ T1968] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:176) 
[ 399.422085][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.422426][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.422766][ T1968] ? handle_invalid_op (arch/x86/kernel/traps.c:214) 
[ 399.423123][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.423462][ T1968] ? exc_invalid_op (arch/x86/kernel/traps.c:266) 
[ 399.423825][ T1968] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 399.424191][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.425012][ T1968] ? usercopy_abort (mm/usercopy.c:102 (discriminator 12)) 
[ 399.425379][ T1968] check_heap_object (mm/usercopy.c:177) 
[ 399.425751][ T1968] __check_object_size (mm/percpu-stats.c:27) 
[ 399.426177][ T1968] skb_do_copy_data_nocache (include/linux/uio.h:204 include/linux/uio.h:211 include/net/sock.h:2231) 
[ 399.426595][ T1968] ? check_prev_add (kernel/locking/lockdep.c:3825) 
[ 399.426951][ T1968] ? can_map_frag+0xa0/0xa0 
[ 399.427364][ T1968] ? __sk_mem_schedule (net/core/sock.c:3176) 
[ 399.427731][ T1968] tcp_sendmsg_locked (include/net/sock.h:2274 net/ipv4/tcp.c:1210) 
[ 399.428115][ T1968] ? __lock_release (kernel/locking/lockdep.c:353 kernel/locking/lockdep.c:5436) 
[ 399.428490][ T1968] ? tcp_sendmsg_fastopen (net/ipv4/tcp.c:1040) 
[ 399.428881][ T1968] ? hlock_class (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/locking/lockdep.c:228) 
[ 399.429211][ T1968] ? mark_lock (kernel/locking/lockdep.c:4656 (discriminator 3)) 
[ 399.429530][ T1968] tcp_sendmsg (net/ipv4/tcp.c:1344) 
[ 399.429839][ T1968] sock_write_iter (net/socket.c:730 net/socket.c:745 net/socket.c:1160) 
[ 399.430211][ T1968] ? call_trace_sock_send_length+0x190/0x190 
[ 399.430730][ T1968] ? lock_downgrade (kernel/locking/lockdep.c:5406) 
[ 399.431099][ T1968] ? __might_fault (mm/memory.c:6214 mm/memory.c:6207) 
[ 399.431472][ T1968] vfs_write (include/linux/fs.h:2108 fs/read_write.c:497 fs/read_write.c:590) 
[ 399.431781][ T1968] ? poll_freewait (fs/select.c:301) 
[ 399.432128][ T1968] ? kernel_write (fs/read_write.c:571) 
[ 399.432482][ T1968] ? ktime_get_ts64 (kernel/time/timekeeping.c:258 kernel/time/timekeeping.c:388 kernel/time/timekeeping.c:981) 
[ 399.432839][ T1968] ? __fget_light (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1145) 
[ 399.433179][ T1968] ksys_write (fs/read_write.c:643) 
[ 399.433494][ T1968] ? __ia32_sys_read (fs/read_write.c:633) 
[ 399.433843][ T1968] __do_fast_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:321) 
[ 399.434221][ T1968] do_fast_syscall_32 (arch/x86/entry/common.c:346) 
[ 399.434576][ T1968] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:121) 
[  399.435050][ T1968] RIP: 0023:0xf7fab579
[ 399.435370][ T1968] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
All code
========
   0:	b8 01 10 06 03       	mov    $0x3061001,%eax
   5:	74 b4                	je     0xffffffffffffffbb
   7:	01 10                	add    %edx,(%rax)
   9:	07                   	(bad)
   a:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   e:	10 08                	adc    %cl,(%rax)
  10:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240331/202403310850.950947b0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

