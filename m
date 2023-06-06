Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9441D5660
	for <oe-lkp@lists.linux.dev>; Tue,  6 Jun 2023 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686038701; x=1717574701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zd8BJ97KkNe2OVKldwVTcExqxT8rMNSpMrC2cJwc1Ig=;
  b=XqjSkVEzduuL35937aUtiMQfRa1c80JBvlkfT/mNPUsQfPP1ipyYVgkW
   RLTL8Z7ZPvOn8RSVAR/C1SPCEKvXOzrdHVEN7EGgM7JZBSXcnFMpqerA1
   OFbKLWvA5fg7inDudA3cq1vWW6Y3K2ozFMehk56/FlLfVIgDHheElbKa8
   8qxuaeNgeIAuriweUGHOqs4hnw1xjk4XCRp9mIoFsZ5t38Z6qH+m6A6kn
   HsiPo0KZtreibQ5trAMQltlb1USXD+zIYD5BaAx2dzaYkFss42mCB+QwS
   2HbRuAtVl2qDgYKjm0+0NoZOn6lU05XwvuoivK1KLyOoNP/nQHDru7zf4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="442978310"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="xz'341?scan'341,208,341";a="442978310"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738681300"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="xz'341?scan'341,208,341";a="738681300"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 06 Jun 2023 01:04:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 01:04:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 01:04:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 01:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6zYfsHe/6InPyNM77vLTlsj2fLa+g+/ubiKJgOrkJG679TpHPEU01UAkJS+2QT5NK8yufVTuKN4sw31PxgpTtXRQf19UpXXhuVtoyRMjLMKspP2Kiu8X+aUCw/4swqBy23NOi5BtG21wWL2sBo3TdNw6e+I533N7qu1PfpqYik5bvwVugaVoi09uSU1D/FAPb4Fnouc8PNw1AnIiTZU+A0vg00kWhizmz4ckJQClQdoN+2FdShv5Tth9FQeLZ40lm8VBSsCqRAZ7nXhQ627ae0wfTnvKDfbiKvDa31/Km/tkG2870I9ZBlU9S4KSOsDsi+DMjO/qXOJMY+dsunCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsInsK2sJW+ze/IvIvbJZI+FZeTQHwIETy56nj+L24U=;
 b=J3ObtWFbGBqghlX3Bu7Hvp5OQX2gFEBav4gpaq+XXYUECS6DBnDWSWi2LI0nk+yFoDncpMz8nWl4NyJWn7v48jN68zYLF9bVHolHn+UqFAGX6tBG0WhFyE0Ru9AgG4Eth1NaIvW7JmZk3C7ts7lv5sUWK05mcZGWJ3g/6/RjTef7H2QJ2ck50R1B9Taceem82LW/8PD0mM+LxePSSFZ6CMbFW/wyiBdQaAifN2F0lfL1ynSNikvN+nI6kxSB2fs4TUr0vRLpi5Su5mRxDcabohwGkGdpPfApr13pk44bw8jSV64eEW5niBhnTtTYpm+OVpYZdhQbo6jAeP7GDeTxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 08:04:48 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 08:04:48 +0000
Date: Tue, 6 Jun 2023 16:04:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:jitalloc/v1] [x86/jitalloc]   ecc5ba6931:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202306061547.1b3d7faa-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="IB4Sg/8EDR962jJL"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CY8PR11MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1574c096-3efb-4f59-0c77-08db6664b228
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vfXVtSmTlJ01rzMMs9E/oeW4B35tbs3c45KqQi/jrZ7o56phjxThi1AHxIrHenMah8PZ1ezTKNIjlEcD+Xn+WnvZF6+eVQY7zegzFZFeftFQYg+NxIjlOm0E1At118iElDL7EWALi1j/ztW2xYp7I5gp+zxrEbXHSj6L+mtvLbM1FE9377CdtGLl4rZ/OAYVE3pqlPYL3QKtJ/rg4l8hKFNb650Tokc6y6vF5nKVFPo4in/3ccrplTmu1RCHAAuebI3Kjr/Fqdm+Qa6AALw5iRHSUqM17JXkI2x3J5Gyuby4CHgSr0fBRbTGMiR7RJE0W/N8GAYOxcH4kI26aIdd08wTh50rupq1S7zuooH64PpDhkafyd3CL/UP4x1onkQrMYiMjKV5+iR7QWY91QXCW6RnSHy7eyEg1ZRwVc4eMooA1jbpk74pvfYqR3tJB/cuJy8K1B1lX23y96lpOdu8brFlMoKSaZc4H8cdx6QAHkYIHNQ4kFP9qYxar+dpXI5su9paOFoN89hhyRmK/oN0veioqzISVbMTHm+KRlxxpwGDg6JhXSQnh7ytE314+H13+GUG5Q/YVA/l6DsfSReY3rmYsUMxVfN2DmjcsqbGzgkJ/IEajAUbXlgX1zg6nVF3giEamcNkADbGA1CHKYXxAX0beig7nPQTouS3CgmbsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(45080400002)(478600001)(6916009)(235185007)(8936002)(8676002)(2906002)(36756003)(86362001)(5660300002)(4326008)(66556008)(66476007)(316002)(66946007)(82960400001)(6506007)(1076003)(38100700002)(2616005)(41300700001)(6512007)(107886003)(26005)(83380400001)(186003)(966005)(44144004)(6486002)(6666004)(2700100001)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YEDnQ0vYr4X5+rT3814VDxSC+A53FYfESUwcO0yKL6SzaHHOUf4q7AQjps5c?=
 =?us-ascii?Q?59k85MeLqncqrErJCZ1uwbxlz7GLjAok9J9/B25xdtdEB0WvHCplXlsoRiSl?=
 =?us-ascii?Q?QIJYAUwNoDOUkiaFcCkndgeTbNHmFhenfMFpLiOPVEDSihZZlNSJkMlerruk?=
 =?us-ascii?Q?eXqGJ3PY8joiOobCveA6NNfujTczoYufDxop++0hM82z0O0qZoURfP3n/4dk?=
 =?us-ascii?Q?K7UCThju8zyPc+LsOU+BXh1L5/ZkTAlGAmRfo43yv62z0fsRfAzCnQQWK/Fc?=
 =?us-ascii?Q?ixpTPJai++J09GsZFByUk9yf2C7Bs/FQB9xCri8aGo/Gzs4pN3mon4VB4Zjy?=
 =?us-ascii?Q?jDNpF+cwDFGYyENQrEaPdMBzyB6+8lT01xzKSFzcwTLewHJKxF1t3ZI7mTCg?=
 =?us-ascii?Q?nHcUBxPqrhv20dSivaB77IiYRBk22VU2QCLsT9BlvaTz635qdtjzBdnF1rpX?=
 =?us-ascii?Q?9MkCSiTTyF3/GgxEU7D71Wc5ZIjdl7nwoL3J4w5FhQE3KfrkPseJltlTLlYD?=
 =?us-ascii?Q?Pcs2HInccTBk6wLAjFipwcj/FZB+SFkXH+ooGNsuJjUM7rxNXf7gBlv4pkxh?=
 =?us-ascii?Q?YMmvFIA+n6SSHR924vUqd3Jv//ChP4VZiAHKWOPj4iTnA4Qrm7dPGaX8yS3e?=
 =?us-ascii?Q?uXwx4bX6fAtq5WD0cW0wOxCPwaNg5qA7Ock5xSQf6W3X91ZAFuDiWMxYfFVA?=
 =?us-ascii?Q?3T4jBoMFwMf8CPbWICJjhxzIpUkl4rMUEyOYYrAW7ZWNB3PMDCnfS/Gv1aTX?=
 =?us-ascii?Q?rQf4vxOFBv/7vrRI9lFLqpuKoHczO/wVYdh/6gr7bXs89jUMu4DbPJ8ctAVd?=
 =?us-ascii?Q?JAVqCEEgW1WJ6hgSTVA0esNtuvmZTJ6B57cyvVKs6J8VA6c5dw6ePIG1f8W6?=
 =?us-ascii?Q?OPo/Cqn57Q8pZ4N5c7C6xgkwzmkIx8lr3f/7p/EBkZ5arxQ45ZcM4/MBfiDE?=
 =?us-ascii?Q?NuPCar1A1SFHsQwG3Cx7JQOWde5uGKi1ETbiCiDGsJxcKtk7FD8RzdM5/rTv?=
 =?us-ascii?Q?eAvnV9YlvkI0WwWy3Owg5i98vneJmG+uJZeWiwYCpgYtVXFFfdQ3upd7kC9I?=
 =?us-ascii?Q?qguqBjq5L0QaCtkYEPfnhn/fRW2pVZTfhcDsZZ0RsqXrsXtuxQYsgE2W2Yph?=
 =?us-ascii?Q?vgdiUkWf50e26aJo2tntLVBm0G5Fw7ZejR4NgDYtEMtuWBBl9AAmyPgQ9hdn?=
 =?us-ascii?Q?27aA5YXBf9KHJhf+xbcy+c0mLE9kVx8VGn6kZfbbTY8xpVwDe2wNWVmsW1ZN?=
 =?us-ascii?Q?5wK6mNQdXmUmZQKZjI3O8W3AvZDknnF3l0JEqRfbX2TqAmtYAun+Hh2FeLma?=
 =?us-ascii?Q?49Z7IqLE7ihDPEPC5CPqcECTgyWgQ9Mz66vKpI5jcL8M83l7dnu7Eoa9OcO6?=
 =?us-ascii?Q?EHz3HOru4gs9O5RNA6fRb0nry02GDq1NksYWkm+Glr6ykxMl0S1HR+J++YNJ?=
 =?us-ascii?Q?p8wadABSf4wPeUQB83+TFuLfREvmGGjEXEOO54fsKLoE8BiUqNOPJV1ZQHZn?=
 =?us-ascii?Q?TjxkLlIB824wbdMshblJ0aNM7meBveABYV02Ilki4BJKNMolKPEnBotXV0Vo?=
 =?us-ascii?Q?zSe9YiOf2XaPQgF7T/0L1H8jpUch1EmU6OAho2VxdSwKlHptHMdJ3Jof/2BB?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1574c096-3efb-4f59-0c77-08db6664b228
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 08:04:48.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KElNvWMHWdmbaoDJGCxHTstx8C+O+GSk77yXnK/gWbZI5mmXN7lNYIfsWh5kSAgdASZxe7mC/lWyMevglYoZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
X-OriginatorOrg: intel.com

--IB4Sg/8EDR962jJL
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi, Mike Rapoport,

we reported
"[rppt:jitalloc/v0.1] [x86/jitalloc]  ee416086e3: BUG:unable_to_handle_page_fault_for_address"
on
https://lore.kernel.org/all/202306060916.74eea3cc-oliver.sang@intel.com/

but we now noticed there seems a new branch jitalloc/v1

since there is still similar issue, we send out this report again FYI



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: ecc5ba69314d3b4f68d4e66cc2a10762751c482e ("x86/jitalloc: make memory allocated for code ROX")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git jitalloc/v1

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306061547.1b3d7faa-oliver.sang@intel.com


[   12.803528][    T1] BUG: unable to handle page fault for address: f1b4e001
[   12.804177][    T1] #PF: supervisor write access in kernel mode
[   12.804707][    T1] #PF: error_code(0x0003) - permissions violation
[   12.805266][    T1] *pdpt = 0000000002ae2001 *pde = 0000000000139067 *pte = 00000000a4ecd161
[   12.806010][    T1] Oops: 0003 [#1] PREEMPT SMP
[   12.806428][    T1] CPU: 0 PID: 1 Comm: systemd Not tainted 6.4.0-rc3-00013-gecc5ba69314d #17 f8add580e779665ed830cb9514a8f496b624203c
[ 12.807439][ T1] EIP: apply_relocate (??:?) 
[ 12.807869][ T1] Code: c9 28 82 e8 c3 00 0c 00 b8 f8 ff ff ff 83 c4 0c 8d 65 f4 5b 5e 5f 5d 31 d2 31 c9 c3 8d b4 26 00 00 00 00 8b 01 29 c8 03 42 04 <89> 01 8b 46 14 83 c3 08 83 45 f0 01 8b 7d f0 c1 e8 03 39 c7 72 86
All code
========
   0:	c9                   	leaveq 
   1:	28 82 e8 c3 00 0c    	sub    %al,0xc00c3e8(%rdx)
   7:	00 b8 f8 ff ff ff    	add    %bh,-0x8(%rax)
   d:	83 c4 0c             	add    $0xc,%esp
  10:	8d 65 f4             	lea    -0xc(%rbp),%esp
  13:	5b                   	pop    %rbx
  14:	5e                   	pop    %rsi
  15:	5f                   	pop    %rdi
  16:	5d                   	pop    %rbp
  17:	31 d2                	xor    %edx,%edx
  19:	31 c9                	xor    %ecx,%ecx
  1b:	c3                   	retq   
  1c:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  23:	8b 01                	mov    (%rcx),%eax
  25:	29 c8                	sub    %ecx,%eax
  27:	03 42 04             	add    0x4(%rdx),%eax
  2a:*	89 01                	mov    %eax,(%rcx)		<-- trapping instruction
  2c:	8b 46 14             	mov    0x14(%rsi),%eax
  2f:	83 c3 08             	add    $0x8,%ebx
  32:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  36:	8b 7d f0             	mov    -0x10(%rbp),%edi
  39:	c1 e8 03             	shr    $0x3,%eax
  3c:	39 c7                	cmp    %eax,%edi
  3e:	72 86                	jb     0xffffffffffffffc6

Code starting with the faulting instruction
===========================================
   0:	89 01                	mov    %eax,(%rcx)
   2:	8b 46 14             	mov    0x14(%rsi),%eax
   5:	83 c3 08             	add    $0x8,%ebx
   8:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
   c:	8b 7d f0             	mov    -0x10(%rbp),%edi
   f:	c1 e8 03             	shr    $0x3,%eax
  12:	39 c7                	cmp    %eax,%edi
  14:	72 86                	jb     0xffffffffffffff9c
[   12.809527][    T1] EAX: 8f50b1db EBX: f1b450c8 ECX: f1b4e001 EDX: f1b5d434
[   12.810141][    T1] ESI: f1b4b9b4 EDI: 00000000 EBP: 802bbec8 ESP: 802bbeb0
[   12.810776][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210286
[   12.811433][    T1] CR0: 80050033 CR2: f1b4e001 CR3: 0013d720 CR4: 000406b0
[   12.812053][    T1] Call Trace:
[ 12.812357][ T1] load_module (main.c:?) 
[ 12.812764][ T1] ? kernel_read_file_from_fd (??:?) 
[ 12.813266][ T1] __ia32_sys_finit_module (??:?) 
[ 12.813749][ T1] do_int80_syscall_32 (??:?) 
[ 12.814190][ T1] entry_INT80_32 (??:?) 
[   12.814631][    T1] EIP: 0x77f02092
[ 12.814959][ T1] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)  
   6:	ff                   	(bad)  
   7:	ff                   	(bad)  
   8:	ff a3 24 00 00 00    	jmpq   *0x24(%rbx)
   e:	68 30 00 00 00       	pushq  $0x30
  13:	e9 80 ff ff ff       	jmpq   0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmpq   *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	retq   		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	retq   
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	retq   
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	retq   
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   12.816633][    T1] EAX: ffffffda EBX: 00000004 ECX: 77b02d41 EDX: 00000000
[   12.817242][    T1] ESI: 005b8f40 EDI: 005b8df0 EBP: 00000000 ESP: 7f8080f8
[   12.817857][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200216
[   12.818535][    T1] Modules linked in:
[   12.818886][    T1] CR2: 00000000f1b4e001
[   12.819260][    T1] ---[ end trace 0000000000000000 ]---
[ 12.819748][ T1] EIP: apply_relocate (??:?) 
[ 12.820171][ T1] Code: c9 28 82 e8 c3 00 0c 00 b8 f8 ff ff ff 83 c4 0c 8d 65 f4 5b 5e 5f 5d 31 d2 31 c9 c3 8d b4 26 00 00 00 00 8b 01 29 c8 03 42 04 <89> 01 8b 46 14 83 c3 08 83 45 f0 01 8b 7d f0 c1 e8 03 39 c7 72 86
All code
========
   0:	c9                   	leaveq 
   1:	28 82 e8 c3 00 0c    	sub    %al,0xc00c3e8(%rdx)
   7:	00 b8 f8 ff ff ff    	add    %bh,-0x8(%rax)
   d:	83 c4 0c             	add    $0xc,%esp
  10:	8d 65 f4             	lea    -0xc(%rbp),%esp
  13:	5b                   	pop    %rbx
  14:	5e                   	pop    %rsi
  15:	5f                   	pop    %rdi
  16:	5d                   	pop    %rbp
  17:	31 d2                	xor    %edx,%edx
  19:	31 c9                	xor    %ecx,%ecx
  1b:	c3                   	retq   
  1c:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  23:	8b 01                	mov    (%rcx),%eax
  25:	29 c8                	sub    %ecx,%eax
  27:	03 42 04             	add    0x4(%rdx),%eax
  2a:*	89 01                	mov    %eax,(%rcx)		<-- trapping instruction
  2c:	8b 46 14             	mov    0x14(%rsi),%eax
  2f:	83 c3 08             	add    $0x8,%ebx
  32:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  36:	8b 7d f0             	mov    -0x10(%rbp),%edi
  39:	c1 e8 03             	shr    $0x3,%eax
  3c:	39 c7                	cmp    %eax,%edi
  3e:	72 86                	jb     0xffffffffffffffc6

Code starting with the faulting instruction
===========================================
   0:	89 01                	mov    %eax,(%rcx)
   2:	8b 46 14             	mov    0x14(%rsi),%eax
   5:	83 c3 08             	add    $0x8,%ebx
   8:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
   c:	8b 7d f0             	mov    -0x10(%rbp),%edi
   f:	c1 e8 03             	shr    $0x3,%eax
  12:	39 c7                	cmp    %eax,%edi
  14:	72 86                	jb     0xffffffffffffff9c


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc3-00013-gecc5ba69314d .config
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-12 CC=gcc-12 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--IB4Sg/8EDR962jJL
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc3-00013-gecc5ba69314d"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.4.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-12 (Debian 12.2.0-14) 12.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24000
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=m
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_BOOST is not set
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_DEBUG_RSEQ=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_FORCE_DYNAMIC_FTRACE=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=3
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_BIGSMP=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_32_IRIS=m
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
CONFIG_MVIAC3_2=y
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_X86_GENERIC=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=6
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_CYRIX_32 is not set
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
# CONFIG_DMI is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=64
CONFIG_NR_CPUS_DEFAULT=32
CONFIG_NR_CPUS=32
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
# CONFIG_PERF_EVENTS_INTEL_RAPL is not set
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

# CONFIG_X86_LEGACY_VM86 is not set
# CONFIG_X86_16BIT is not set
CONFIG_X86_IOPL_IOPERM=y
CONFIG_TOSHIBA=m
# CONFIG_X86_REBOOTFIXUPS is not set
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
# CONFIG_MICROCODE_LATE_LOADING is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=y
# CONFIG_NOHIGHMEM is not set
# CONFIG_HIGHMEM4G is not set
CONFIG_HIGHMEM64G=y
# CONFIG_VMSPLIT_3G is not set
CONFIG_VMSPLIT_2G=y
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0x80000000
CONFIG_HIGHMEM=y
CONFIG_X86_PAE=y
CONFIG_X86_CPA_STATISTICS=y
# CONFIG_NUMA is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_HIGHPTE=y
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
# CONFIG_MTRR is not set
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_SPECULATION_MITIGATIONS=y
# CONFIG_PAGE_TABLE_ISOLATION is not set
CONFIG_RETPOLINE=y
# CONFIG_RETHUNK is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_DPM_WATCHDOG=y
CONFIG_DPM_WATCHDOG_TIMEOUT=120
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_TABLE_LIB=y
# CONFIG_ACPI_DEBUGGER is not set
# CONFIG_ACPI_SPCR_TABLE is not set
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
CONFIG_ACPI_EC_DEBUGFS=m
# CONFIG_ACPI_AC is not set
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=m
CONFIG_ACPI_DOCK=y
# CONFIG_ACPI_PROCESSOR is not set
CONFIG_ACPI_IPMI=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
# CONFIG_ACPI_APEI_GHES is not set
# CONFIG_ACPI_APEI_EINJ is not set
CONFIG_ACPI_APEI_ERST_DEBUG=m
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_FFH is not set
CONFIG_PMIC_OPREGION=y
CONFIG_XPOWER_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
CONFIG_PCI_GOMMCONFIG=y
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOANY is not set
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# CONFIG_ISA is not set
CONFIG_SCx200=y
CONFIG_SCx200HR_TIMER=y
CONFIG_ALIX=y
CONFIG_NET5501=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_TEXT_POKE=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
# CONFIG_ZONE_DMA is not set
CONFIG_GET_FREE_REGION=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_GUP_GET_PXX_LOW_HIGH=y
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
CONFIG_USERFAULTFD=y
CONFIG_JIT_ALLOC=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=y
CONFIG_TLS=y
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
# CONFIG_INET_UDP_DIAG is not set
CONFIG_INET_RAW_DIAG=m
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
# CONFIG_TCP_CONG_CUBIC is not set
CONFIG_TCP_CONG_WESTWOOD=y
# CONFIG_TCP_CONG_HTCP is not set
CONFIG_TCP_CONG_HSTCP=y
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=m
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
# CONFIG_TCP_CONG_LP is not set
# CONFIG_TCP_CONG_VENO is not set
CONFIG_TCP_CONG_YEAH=m
# CONFIG_TCP_CONG_ILLINOIS is not set
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_WESTWOOD=y
# CONFIG_DEFAULT_DCTCP is not set
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="westwood"
CONFIG_TCP_MD5SIG=y
# CONFIG_IPV6 is not set
# CONFIG_NETLABEL is not set
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set

#
# Core Netfilter Configuration
#
# CONFIG_NETFILTER_INGRESS is not set
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_BPF_LINK=y
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
# CONFIG_NF_CONNTRACK_PROCFS is not set
# CONFIG_NF_CONNTRACK_LABELS is not set
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
# CONFIG_NF_CONNTRACK_SIP is not set
CONFIG_NF_CT_NETLINK=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
# CONFIG_NF_TABLES is not set
CONFIG_NETFILTER_XTABLES=m

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
# CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=y
CONFIG_IP_SET_MAX=256
# CONFIG_IP_SET_BITMAP_IP is not set
# CONFIG_IP_SET_BITMAP_IPMAC is not set
CONFIG_IP_SET_BITMAP_PORT=m
# CONFIG_IP_SET_HASH_IP is not set
CONFIG_IP_SET_HASH_IPMARK=m
# CONFIG_IP_SET_HASH_IPPORT is not set
# CONFIG_IP_SET_HASH_IPPORTIP is not set
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=y
CONFIG_IP_SET_HASH_MAC=y
# CONFIG_IP_SET_HASH_NETPORTNET is not set
# CONFIG_IP_SET_HASH_NET is not set
CONFIG_IP_SET_HASH_NETNET=y
# CONFIG_IP_SET_HASH_NETPORT is not set
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=y
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
# CONFIG_NF_TPROXY_IPV4 is not set
CONFIG_NF_DUP_IPV4=m
# CONFIG_NF_LOG_ARP is not set
# CONFIG_NF_LOG_IPV4 is not set
CONFIG_NF_REJECT_IPV4=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_FILTER=m
# CONFIG_IP_NF_TARGET_REJECT is not set
CONFIG_IP_NF_NAT=m
# CONFIG_IP_NF_TARGET_MASQUERADE is not set
# CONFIG_IP_NF_MANGLE is not set
CONFIG_IP_NF_RAW=m
# end of IP: Netfilter Configuration

CONFIG_NF_CONNTRACK_BRIDGE=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=y
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
CONFIG_L2TP=y
# CONFIG_L2TP_DEBUGFS is not set
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=y
CONFIG_L2TP_ETH=y
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=m
# CONFIG_PHONET is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=y
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=m
# CONFIG_NET_SCH_SFQ is not set
# CONFIG_NET_SCH_TEQL is not set
# CONFIG_NET_SCH_TBF is not set
CONFIG_NET_SCH_CBS=y
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_MQPRIO_LIB=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=y
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=m
CONFIG_NET_SCH_SKBPRIO=m
CONFIG_NET_SCH_CHOKE=m
# CONFIG_NET_SCH_QFQ is not set
CONFIG_NET_SCH_CODEL=y
CONFIG_NET_SCH_FQ_CODEL=m
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=y
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=y
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=y
CONFIG_NET_CLS_U32=y
# CONFIG_CLS_U32_PERF is not set
CONFIG_CLS_U32_MARK=y
# CONFIG_NET_CLS_FLOW is not set
# CONFIG_NET_CLS_CGROUP is not set
CONFIG_NET_CLS_BPF=y
CONFIG_NET_CLS_FLOWER=y
CONFIG_NET_CLS_MATCHALL=y
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=y
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
# CONFIG_NET_EMATCH_TEXT is not set
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=y
CONFIG_NET_ACT_GACT=y
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=y
CONFIG_NET_ACT_SAMPLE=y
CONFIG_NET_ACT_IPT=m
# CONFIG_NET_ACT_NAT is not set
# CONFIG_NET_ACT_PEDIT is not set
CONFIG_NET_ACT_SIMP=y
# CONFIG_NET_ACT_SKBEDIT is not set
CONFIG_NET_ACT_CSUM=y
# CONFIG_NET_ACT_MPLS is not set
# CONFIG_NET_ACT_VLAN is not set
CONFIG_NET_ACT_BPF=y
# CONFIG_NET_ACT_SKBMOD is not set
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=m
CONFIG_NET_ACT_GATE=m
# CONFIG_NET_IFE_SKBMARK is not set
CONFIG_NET_IFE_SKBPRIO=m
# CONFIG_NET_IFE_SKBTCINDEX is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
# CONFIG_VSOCKETS is not set
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=y
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=m
# CONFIG_QRTR_SMD is not set
# CONFIG_QRTR_TUN is not set
# CONFIG_NET_NCSI is not set
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
# CONFIG_AX25 is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=m
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=m
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIBCM4377 is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
# CONFIG_BT_MTKUART is not set
# CONFIG_BT_VIRTIO is not set
# CONFIG_BT_NXPUART is not set
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_INJECT_RX_DELAY is not set
# CONFIG_AF_RXRPC_DEBUG is not set
CONFIG_RXKAD=y
# CONFIG_RXPERF is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
# CONFIG_CAIF_NETDEV is not set
CONFIG_CAIF_USB=y
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=m
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=m
CONFIG_NFC_NCI_UART=m
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_MEI_PHY=m
CONFIG_NFC_VIRTUAL_NCI=m
CONFIG_NFC_FDP=m
CONFIG_NFC_FDP_I2C=m
CONFIG_NFC_PN544=m
CONFIG_NFC_PN544_MEI=m
CONFIG_NFC_PN533=m
CONFIG_NFC_PN533_I2C=m
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_MICROREAD=m
CONFIG_NFC_MICROREAD_MEI=m
CONFIG_NFC_MRVL=m
CONFIG_NFC_MRVL_UART=m
CONFIG_NFC_MRVL_I2C=m
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_NXP_NCI=m
CONFIG_NFC_NXP_NCI_I2C=m
CONFIG_NFC_S3FWRN5=m
CONFIG_NFC_S3FWRN5_I2C=m
CONFIG_NFC_S3FWRN82_UART=m
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
CONFIG_NET_IFE=m
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_PCIEAER is not set
# CONFIG_PCIEASPM is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
# CONFIG_PCI_MESON is not set
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=y
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
CONFIG_CXL_ACPI=m
CONFIG_CXL_MEM=y
CONFIG_CXL_PORT=y
CONFIG_CXL_REGION=y
# CONFIG_CXL_REGION_INVALIDATION_TEST is not set
CONFIG_PCCARD=m
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
# CONFIG_YENTA_O2 is not set
CONFIG_YENTA_RICOH=y
# CONFIG_YENTA_TI is not set
CONFIG_YENTA_TOSHIBA=y
CONFIG_RAPIDIO=m
CONFIG_RAPIDIO_TSI721=m
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=m
CONFIG_RAPIDIO_MPORT_CDEV=m

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=m
# CONFIG_RAPIDIO_CPS_GEN2 is not set
# CONFIG_RAPIDIO_RXS_GEN3 is not set
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_DEBUG=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set
CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
# CONFIG_GNSS_MTK_SERIAL is not set
# CONFIG_GNSS_SIRF_SERIAL is not set
CONFIG_GNSS_UBX_SERIAL=m
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=m
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
CONFIG_MTD_SBC_GXX=m
# CONFIG_MTD_SCx200_DOCFLASH is not set
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=y
CONFIG_MTD_ESB2ROM=y
CONFIG_MTD_CK804XROM=y
CONFIG_MTD_SCB2_FLASH=y
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=m
# CONFIG_MTD_PCI is not set
CONFIG_MTD_INTEL_VR_NOR=m
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
# CONFIG_MTD_PMC551_BUGFIX is not set
# CONFIG_MTD_PMC551_DEBUG is not set
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=m
# CONFIG_MTD_MTDRAM is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
CONFIG_MTD_HYPERBUS=m
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
# CONFIG_TIFM_7XX1 is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_CS5535_MFGPT=m
CONFIG_CS5535_MFGPT_DEFAULT_IRQ=7
# CONFIG_CS5535_CLOCK_EVENT_SRC is not set
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_VMWARE_BALLOON is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=m
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=y
CONFIG_C2PORT_DURAMAR_2150=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=m
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=m
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=y
CONFIG_UACCE=m
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=y
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
# CONFIG_FIREWIRE_NET is not set
CONFIG_FIREWIRE_NOSY=y
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=y
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
CONFIG_EQUALIZER=y
CONFIG_IFB=y
# CONFIG_NET_TEAM is not set
CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
CONFIG_IPVLAN_L3S=y
CONFIG_IPVLAN=y
CONFIG_IPVTAP=m
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
CONFIG_BAREUDP=m
CONFIG_GTP=y
CONFIG_MACSEC=m
CONFIG_NETCONSOLE=y
# CONFIG_NETCONSOLE_DYNAMIC is not set
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_RIONET=m
CONFIG_RIONET_TX_SIZE=128
CONFIG_RIONET_RX_SIZE=128
# CONFIG_TUN is not set
CONFIG_TAP=m
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=y
CONFIG_VIRTIO_NET=y
# CONFIG_NLMON is not set
CONFIG_SUNGEM_PHY=m
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=y
CONFIG_ARCNET_1051=y
CONFIG_ARCNET_RAW=y
CONFIG_ARCNET_CAP=m
CONFIG_ARCNET_COM90xx=y
CONFIG_ARCNET_COM90xxIO=y
# CONFIG_ARCNET_RIM_I is not set
CONFIG_ARCNET_COM20020=m
CONFIG_ARCNET_COM20020_PCI=m
# CONFIG_CAIF_DRIVERS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
CONFIG_ET131X=y
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_AQUANTIA is not set
# CONFIG_NET_VENDOR_ARC is not set
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_ATL2=m
# CONFIG_ATL1 is not set
CONFIG_ATL1E=y
CONFIG_ATL1C=y
CONFIG_ALX=y
CONFIG_CX_ECAT=y
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=m
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
CONFIG_BCMGENET=m
CONFIG_BNX2=m
CONFIG_CNIC=m
CONFIG_TIGON3=m
# CONFIG_TIGON3_HWMON is not set
# CONFIG_BNX2X is not set
CONFIG_SYSTEMPORT=m
CONFIG_BNXT=m
# CONFIG_BNXT_SRIOV is not set
# CONFIG_BNXT_FLOWER_OFFLOAD is not set
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=y
CONFIG_MACB_PCI=m
# CONFIG_NET_VENDOR_CAVIUM is not set
CONFIG_NET_VENDOR_CHELSIO=y
CONFIG_CHELSIO_T1=m
# CONFIG_CHELSIO_T1_1G is not set
CONFIG_CHELSIO_T3=m
# CONFIG_CHELSIO_T4 is not set
CONFIG_CHELSIO_T4VF=y
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=y
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
CONFIG_DNET=m
# CONFIG_NET_VENDOR_DEC is not set
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
# CONFIG_NET_VENDOR_GOOGLE is not set
# CONFIG_NET_VENDOR_HUAWEI is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
CONFIG_E100=y
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=m
# CONFIG_IGB_HWMON is not set
CONFIG_IGBVF=y
CONFIG_IXGBE=y
CONFIG_IXGBEVF=m
# CONFIG_I40E is not set
CONFIG_IAVF=y
CONFIG_I40EVF=y
# CONFIG_ICE is not set
CONFIG_FM10K=y
CONFIG_IGC=m
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_LITEX is not set
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=y
# CONFIG_SKGE is not set
CONFIG_SKY2=y
CONFIG_SKY2_DEBUG=y
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
CONFIG_MLX4_CORE=m
# CONFIG_MLX4_DEBUG is not set
CONFIG_MLX4_CORE_GEN2=y
# CONFIG_MLX5_CORE is not set
CONFIG_MLXSW_CORE=m
# CONFIG_MLXSW_CORE_HWMON is not set
# CONFIG_MLXSW_CORE_THERMAL is not set
CONFIG_MLXSW_PCI=m
CONFIG_MLXSW_I2C=m
# CONFIG_MLXSW_MINIMAL is not set
CONFIG_MLXFW=m
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
CONFIG_KSZ884X_PCI=y
CONFIG_NET_VENDOR_MICROCHIP=y
CONFIG_LAN743X=y
# CONFIG_VCAP is not set
# CONFIG_NET_VENDOR_MICROSEMI is not set
# CONFIG_NET_VENDOR_MICROSOFT is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
CONFIG_FEALNX=m
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETERION is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_NVIDIA=y
CONFIG_FORCEDETH=y
# CONFIG_NET_VENDOR_OKI is not set
CONFIG_ETHOC=m
CONFIG_NET_VENDOR_PACKET_ENGINES=y
CONFIG_HAMACHI=y
CONFIG_YELLOWFIN=y
# CONFIG_NET_VENDOR_PENSANDO is not set
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=m
CONFIG_QLCNIC=y
# CONFIG_QLCNIC_SRIOV is not set
CONFIG_NETXEN_NIC=m
# CONFIG_QED is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
# CONFIG_NET_VENDOR_REALTEK is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
CONFIG_SIS190=y
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=m
# CONFIG_STMMAC_SELFTESTS is not set
CONFIG_STMMAC_PLATFORM=m
CONFIG_DWMAC_GENERIC=m
# CONFIG_DWMAC_INTEL is not set
CONFIG_DWMAC_LOONGSON=m
CONFIG_STMMAC_PCI=m
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=m
CONFIG_SUNGEM=m
CONFIG_CASSINI=m
CONFIG_NIU=m
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=m
CONFIG_DWC_XLGMAC_PCI=m
CONFIG_NET_VENDOR_TEHUTI=y
CONFIG_TEHUTI=y
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
CONFIG_VIA_VELOCITY=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_XILINX is not set
CONFIG_FDDI=m
CONFIG_DEFXX=m
CONFIG_SKFP=m
CONFIG_HIPPI=y
# CONFIG_ROADRUNNER is not set
CONFIG_NET_SB1000=m
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=m

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=m
CONFIG_BROADCOM_PHY=y
CONFIG_BCM54140_PHY=m
CONFIG_BCM7XXX_PHY=m
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=y
CONFIG_BCM_NET_PHYPTP=y
CONFIG_CICADA_PHY=y
CONFIG_CORTINA_PHY=y
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=m
CONFIG_INTEL_XWAY_PHY=m
CONFIG_LSI_ET1011C_PHY=m
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=m
CONFIG_MARVELL_88X2222_PHY=m
CONFIG_MAXLINEAR_GPHY=m
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=m
# CONFIG_MICROCHIP_T1S_PHY is not set
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=m
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
CONFIG_NXP_C45_TJA11XX_PHY=y
CONFIG_NXP_TJA11XX_PHY=m
# CONFIG_NCN26000_PHY is not set
CONFIG_AT803X_PHY=y
CONFIG_QSEMI_PHY=m
# CONFIG_REALTEK_PHY is not set
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
CONFIG_STE10XP=y
CONFIG_TERANETICS_PHY=m
CONFIG_DP83822_PHY=m
CONFIG_DP83TC811_PHY=y
CONFIG_DP83848_PHY=y
CONFIG_DP83867_PHY=m
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
CONFIG_VITESSE_PHY=y
CONFIG_XILINX_GMII2RGMII=y
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BCM_UNIMAC=m
CONFIG_MDIO_I2C=m
CONFIG_MDIO_MSCC_MIIM=y

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
# end of PCS device drivers

CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=m
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPPOE=m
# CONFIG_PPTP is not set
# CONFIG_PPPOL2TP is not set
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLHC=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
# CONFIG_WLAN is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=y
# CONFIG_IEEE802154_FAKELB is not set
CONFIG_IEEE802154_HWSIM=m

#
# Wireless WAN
#
CONFIG_WWAN=y
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=m
CONFIG_RPMSG_WWAN_CTRL=m
# CONFIG_IOSM is not set
# CONFIG_MTK_T7XX is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_USB4_NET=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
# CONFIG_MISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=m
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_GPIO_PS2=m
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=m
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LEGACY_TIOCSTI=y
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DFL is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
CONFIG_SERIAL_LANTIQ=m
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_PCH_UART=y
# CONFIG_SERIAL_PCH_UART_CONSOLE is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=m
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_SPRD=y
CONFIG_SERIAL_SPRD_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_N_GSM=y
CONFIG_NOZOMI=m
CONFIG_NULL_TTY=m
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
# CONFIG_IPMI_IPMB is not set
CONFIG_IPMI_WATCHDOG=m
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_SSIF_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
# CONFIG_HW_RANDOM_INTEL is not set
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=y
# CONFIG_HW_RANDOM_GEODE is not set
# CONFIG_HW_RANDOM_VIA is not set
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
CONFIG_APPLICOM=y
# CONFIG_SONYPI is not set
# CONFIG_MWAVE is not set
CONFIG_SCx200_GPIO=m
CONFIG_PC8736x_GPIO=y
CONFIG_NSC_GPIO=y
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=m
# CONFIG_DEVPORT is not set
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
CONFIG_HPET_MMAP_DEFAULT=y
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=y
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=m
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=m
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_ALI1535 is not set
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=m
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=y
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_NVIDIA_GPU=m
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=y
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=y

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
CONFIG_I2C_DESIGNWARE_PCI=y
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_SCx200_ACB=m
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_DA9062 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
CONFIG_PINCTRL_CHERRYVIEW=y
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=m
CONFIG_PINCTRL_BROXTON=m
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
# CONFIG_PINCTRL_DENVERTON is not set
CONFIG_PINCTRL_ELKHARTLAKE=y
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=m
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=y
CONFIG_PINCTRL_TIGERLAKE=y
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=m
CONFIG_GPIO_IDIO_16=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_I8255=y
CONFIG_GPIO_104_DIO_48E=y
CONFIG_GPIO_104_IDIO_16=m
CONFIG_GPIO_104_IDI_48=m
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_GPIO_MM is not set
# CONFIG_GPIO_IT87 is not set
CONFIG_GPIO_SCH=m
# CONFIG_GPIO_SCH311X is not set
CONFIG_GPIO_WINBOND=y
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD9571MWV=m
# CONFIG_GPIO_CS5535 is not set
CONFIG_GPIO_DA9055=y
# CONFIG_GPIO_ELKHARTLAKE is not set
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_TIMBERDALE is not set
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TWL4030 is not set
# CONFIG_GPIO_WM831X is not set
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
CONFIG_GPIO_ML_IOH=m
CONFIG_GPIO_PCH=y
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_PCIE_IDIO_24=y
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=m
# CONFIG_W1_SLAVE_DS2406 is not set
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS250X=m
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_ATC260X is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_IP5XXX_POWER is not set
CONFIG_MAX8925_POWER=m
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=m
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=m
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_88PM860X=y
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX77693=m
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MAX8998 is not set
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=y
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_RT9467 is not set
# CONFIG_CHARGER_RT9471 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_APPLESMC is not set
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=m
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DELL_SMM=m
# CONFIG_I8K is not set
# CONFIG_SENSORS_DA9055 is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=m
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX127=m
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MC34VR500 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NCT6683=m
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=m
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ACBEL_FSG032 is not set
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_BPA_RS600=m
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
# CONFIG_SENSORS_LTC2978 is not set
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
# CONFIG_SENSORS_MAX16064 is not set
CONFIG_SENSORS_MAX16601=m
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
# CONFIG_SENSORS_MAX8688 is not set
CONFIG_SENSORS_MP2888=m
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
CONFIG_SENSORS_Q54SJ108A2=m
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TDA38640 is not set
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=m
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
# CONFIG_SENSORS_ZL6100 is not set
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=m
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC2305 is not set
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
# CONFIG_SENSORS_SCH5627 is not set
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=m
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_AMC6821=m
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=m
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM831X=m

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_ACPI=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
# CONFIG_X86_PKG_TEMP_THERMAL is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=m
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
CONFIG_DA9055_WATCHDOG=y
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=m
CONFIG_MENZ069_WATCHDOG=y
CONFIG_WDAT_WDT=m
CONFIG_WM831X_WATCHDOG=y
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_RAVE_SP_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=m
# CONFIG_DW_WATCHDOG is not set
# CONFIG_TWL4030_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_ACQUIRE_WDT is not set
CONFIG_ADVANTECH_WDT=m
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=y
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
# CONFIG_GEODE_WDT is not set
# CONFIG_SBC_FITPC2_WATCHDOG is not set
CONFIG_EUROTECH_WDT=m
# CONFIG_IB700_WDT is not set
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=m
CONFIG_I6300ESB_WDT=m
# CONFIG_IE6XX_WDT is not set
CONFIG_ITCO_WDT=m
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=y
# CONFIG_IT87_WDT is not set
CONFIG_HP_WATCHDOG=y
# CONFIG_HPWDT_NMI_DECODING is not set
# CONFIG_SC1200_WDT is not set
CONFIG_SCx200_WDT=m
CONFIG_PC87413_WDT=m
CONFIG_NV_TCO=y
# CONFIG_60XX_WDT is not set
CONFIG_SBC8360_WDT=m
# CONFIG_SBC7240_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
# CONFIG_SMSC37B787_WDT is not set
CONFIG_TQMX86_WDT=m
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=y
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=y
CONFIG_INTEL_MEI_WDT=y
CONFIG_NI903X_WDT=m
CONFIG_NIC7018_WDT=y
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
CONFIG_WDTPCI=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_CS5535=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=y
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=m
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
CONFIG_MFD_INTEL_LPSS=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=m
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=m
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=m
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=m
CONFIG_MFD_TIMBERDALE=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=m
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_RAVE_SP_CORE=m
# CONFIG_MFD_INTEL_M10_BMC_PMCI is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_88PM800=m
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BD9571MWV=m
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=m
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=m
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=m
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8925=m
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX20411 is not set
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MP8859=m
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
# CONFIG_REGULATOR_PALMAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=m
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_QCOM_SPMI=m
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4803 is not set
# CONFIG_REGULATOR_RT4831 is not set
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5739 is not set
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=m
# CONFIG_REGULATOR_RT6190 is not set
CONFIG_REGULATOR_RT6245=m
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=m
# CONFIG_REGULATOR_RTQ6752 is not set
# CONFIG_REGULATOR_SKY81452 is not set
CONFIG_REGULATOR_SLG51000=m
# CONFIG_REGULATOR_TPS51632 is not set
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65090=m
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6586X=m
# CONFIG_REGULATOR_TPS65912 is not set
# CONFIG_REGULATOR_TWL4030 is not set
# CONFIG_REGULATOR_WM831X is not set
CONFIG_REGULATOR_WM8994=m
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=m

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FLASH_LED_CLASS=m
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_MMAP=y
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_RADIO_ADAPTERS is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y
CONFIG_DVB_PLATFORM_DRIVERS=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=m

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
# CONFIG_VIDEO_CADENCE_CSI2TX is not set

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#
CONFIG_VIDEO_CAFE_CCIC=m

#
# Mediatek media platform drivers
#

#
# Microchip Technology, Inc. media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# Camera sensor devices
#
# CONFIG_VIDEO_AR0521 is not set
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
# CONFIG_VIDEO_HI847 is not set
CONFIG_VIDEO_IMX208=m
# CONFIG_VIDEO_IMX214 is not set
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
CONFIG_VIDEO_IMX274=m
CONFIG_VIDEO_IMX290=m
# CONFIG_VIDEO_IMX296 is not set
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_MAX9271_LIB=m
# CONFIG_VIDEO_MT9M001 is not set
CONFIG_VIDEO_MT9M111=m
# CONFIG_VIDEO_MT9P031 is not set
CONFIG_VIDEO_MT9T112=m
CONFIG_VIDEO_MT9V011=m
CONFIG_VIDEO_MT9V032=m
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
# CONFIG_VIDEO_OV08X40 is not set
CONFIG_VIDEO_OV13858=m
# CONFIG_VIDEO_OV13B10 is not set
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
CONFIG_VIDEO_OV2680=m
CONFIG_VIDEO_OV2685=m
CONFIG_VIDEO_OV2740=m
# CONFIG_VIDEO_OV4689 is not set
CONFIG_VIDEO_OV5647=m
# CONFIG_VIDEO_OV5648 is not set
# CONFIG_VIDEO_OV5670 is not set
CONFIG_VIDEO_OV5675=m
# CONFIG_VIDEO_OV5693 is not set
# CONFIG_VIDEO_OV5695 is not set
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=m
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV8858 is not set
# CONFIG_VIDEO_OV8865 is not set
# CONFIG_VIDEO_OV9640 is not set
CONFIG_VIDEO_OV9650=m
CONFIG_VIDEO_OV9734=m
CONFIG_VIDEO_RDACM20=m
# CONFIG_VIDEO_RDACM21 is not set
CONFIG_VIDEO_RJ54N1=m
# CONFIG_VIDEO_S5K5BAF is not set
CONFIG_VIDEO_S5K6A3=m
# CONFIG_VIDEO_CCS is not set
# CONFIG_VIDEO_ET8EK8 is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=m
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_UDA1342=m
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_WM8775 is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
CONFIG_VIDEO_ADV7183=m
# CONFIG_VIDEO_ADV7604 is not set
CONFIG_VIDEO_ADV7842=m
CONFIG_VIDEO_ADV7842_CEC=y
CONFIG_VIDEO_BT819=m
# CONFIG_VIDEO_BT856 is not set
CONFIG_VIDEO_BT866=m
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_ML86V7667=m
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
# CONFIG_VIDEO_TC358743 is not set
# CONFIG_VIDEO_TC358746 is not set
# CONFIG_VIDEO_TVP514X is not set
CONFIG_VIDEO_TVP5150=m
CONFIG_VIDEO_TVP7002=m
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=m
# CONFIG_VIDEO_TW9910 is not set
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_ADV7175=m
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_ADV7511=m
CONFIG_VIDEO_ADV7511_CEC=y
# CONFIG_VIDEO_AK881X is not set
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
CONFIG_VIDEO_UPD64083=m
# end of Video improvement chips

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set
# end of Audio/Video compression chips

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=m
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=m
# CONFIG_VIDEO_THS7303 is not set
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=m
# CONFIG_MEDIA_TUNER_FC0011 is not set
# CONFIG_MEDIA_TUNER_FC0012 is not set
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_IT913X=m
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
# CONFIG_MEDIA_TUNER_MT2060 is not set
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_MT2266=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
# CONFIG_MEDIA_TUNER_MXL5005S is not set
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
# CONFIG_MEDIA_TUNER_QT1010 is not set
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18212=m
# CONFIG_MEDIA_TUNER_TDA18218 is not set
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_STB0899 is not set
# CONFIG_DVB_STB6100 is not set
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m
CONFIG_DVB_SI2165=m
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
# CONFIG_DVB_CX24116 is not set
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_MT312=m
# CONFIG_DVB_S5H1420 is not set
CONFIG_DVB_SI21XX=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STV0299=m
# CONFIG_DVB_STV0900 is not set
# CONFIG_DVB_STV6110 is not set
# CONFIG_DVB_TDA10071 is not set
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_TDA826X=m
# CONFIG_DVB_TS2020 is not set
CONFIG_DVB_TUA6100=m
# CONFIG_DVB_TUNER_CX24113 is not set
# CONFIG_DVB_TUNER_ITD1000 is not set
CONFIG_DVB_VES1X93=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_CXD2820R=m
# CONFIG_DVB_CXD2841ER is not set
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=m
# CONFIG_DVB_DIB7000M is not set
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_DRXD=m
CONFIG_DVB_EC100=m
# CONFIG_DVB_L64781 is not set
CONFIG_DVB_MT352=m
CONFIG_DVB_NXT6000=m
# CONFIG_DVB_RTL2830 is not set
CONFIG_DVB_RTL2832=m
# CONFIG_DVB_S5H1432 is not set
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_SP887X=m
# CONFIG_DVB_STV0367 is not set
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_TDA1004X=m
# CONFIG_DVB_ZD1301_DEMOD is not set
# CONFIG_DVB_ZL10353 is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=m
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=m
# CONFIG_DVB_VES1820 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=m
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_BCM3510=m
# CONFIG_DVB_LG2160 is not set
CONFIG_DVB_LGDT3305=m
# CONFIG_DVB_LGDT3306A is not set
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_MXL692=m
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_OR51211=m
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_DIB8000=m
# CONFIG_DVB_MB86A20S is not set
# CONFIG_DVB_S921 is not set

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=m
# CONFIG_DVB_TC90522 is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
# CONFIG_DVB_TUNER_DIB0070 is not set
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_AF9033=m
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_HELENE=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
# CONFIG_DVB_ISL6423 is not set
CONFIG_DVB_IX2505V=m
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_LNBH25=m
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
# CONFIG_DVB_LNBP22 is not set
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_DRX39XYJ=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_VGA_SWITCHEROO=y
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_SVGALIB=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
# CONFIG_FB_PM2 is not set
CONFIG_FB_CYBER2000=m
# CONFIG_FB_CYBER2000_DDC is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_UVESA=m
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=m
# CONFIG_FB_NVIDIA_I2C is not set
# CONFIG_FB_NVIDIA_DEBUG is not set
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_FB_RIVA=m
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=m
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
# CONFIG_FB_ATY128_BACKLIGHT is not set
# CONFIG_FB_ATY is not set
CONFIG_FB_S3=m
CONFIG_FB_S3_DDC=y
# CONFIG_FB_SAVAGE is not set
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
# CONFIG_FB_VIA is not set
CONFIG_FB_NEOMAGIC=m
CONFIG_FB_KYRO=m
CONFIG_FB_3DFX=m
# CONFIG_FB_3DFX_ACCEL is not set
CONFIG_FB_3DFX_I2C=y
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=m
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SIMPLE=m
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_PLATFORM=m
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_KTD253=m
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_LM3533 is not set
# CONFIG_BACKLIGHT_MAX8925 is not set
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=m
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_WM831X is not set
CONFIG_BACKLIGHT_ADP8860=m
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_88PM860X=m
CONFIG_BACKLIGHT_LM3639=m
CONFIG_BACKLIGHT_PANDORA=m
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_RAVE_SP=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_HDMI=y
# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EVISION is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PLAYSTATION is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

CONFIG_I2C_HID=y
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set

#
# Surface System Aggregator Module HID support
#
# CONFIG_SURFACE_KBD is not set
# end of Surface System Aggregator Module HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB dual-mode controller drivers
#

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
# CONFIG_MEMSTICK_R592 is not set
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=m
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=m
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_NET48XX=m
CONFIG_LEDS_WRAP=m
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_LP8788 is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_REGULATOR=m
# CONFIG_LEDS_BD2606MVV is not set
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=m
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_NIC78BX=m
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM36274=m

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_RT8515=m
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=m
CONFIG_RTC_DRV_88PM80X=y
# CONFIG_RTC_DRV_ABB5ZES3 is not set
CONFIG_RTC_DRV_ABEOZ9=m
CONFIG_RTC_DRV_ABX80X=y
CONFIG_RTC_DRV_DS1307=m
CONFIG_RTC_DRV_DS1307_CENTURY=y
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_LP8788 is not set
CONFIG_RTC_DRV_MAX6900=y
CONFIG_RTC_DRV_MAX8907=m
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_MAX8998=y
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=m
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=m
CONFIG_RTC_DRV_PALMAS=m
CONFIG_RTC_DRV_TPS6586X=y
CONFIG_RTC_DRV_RC5T583=m
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=m
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
# CONFIG_RTC_DRV_DS3232_HWMON is not set
CONFIG_RTC_DRV_PCF2127=m
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
CONFIG_RTC_DRV_DS17285=y
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_DA9055=m
CONFIG_RTC_DRV_DA9063=m
# CONFIG_RTC_DRV_STK17TA8 is not set
CONFIG_RTC_DRV_M48T86=m
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
# CONFIG_RTC_DRV_BQ4802 is not set
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_WM831X=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=m
# CONFIG_RTC_DRV_MC13XXX is not set

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=m
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=m
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=m
CONFIG_HD44780=m
CONFIG_IMG_ASCII_LCD=y
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=m
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_UIO=y
CONFIG_UIO_CIF=m
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
CONFIG_UIO_DFL=y
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
CONFIG_VFIO_PCI_VGA=y
CONFIG_VFIO_PCI_IGD=y
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
CONFIG_NITRO_ENCLAVES=m
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=m
CONFIG_SURFACE_ACPI_NOTIFY=m
# CONFIG_SURFACE_AGGREGATOR_CDEV is not set
# CONFIG_SURFACE_AGGREGATOR_HUB is not set
# CONFIG_SURFACE_AGGREGATOR_REGISTRY is not set
# CONFIG_SURFACE_AGGREGATOR_TABLET_SWITCH is not set
# CONFIG_SURFACE_DTX is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_SURFACE_AGGREGATOR=m
CONFIG_SURFACE_AGGREGATOR_BUS=y
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_WM831X is not set
CONFIG_COMMON_CLK_MAX9485=m
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=m
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_CS2000_CP=m
# CONFIG_COMMON_CLK_PALMAS is not set
CONFIG_XILINX_VCU=y
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_DMAR_TABLE=y
CONFIG_DMAR_PERF=y
CONFIG_DMAR_DEBUG=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_DEBUGFS=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
# CONFIG_IOMMUFD is not set
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
CONFIG_RPMSG_CHAR=m
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=m
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_AXP288 is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_INTEL_INT3496=m
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_PALMAS=y
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
# CONFIG_FPGA_DFL_EMIF is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
CONFIG_NTB_IDT=m
# CONFIG_NTB_EPF is not set
CONFIG_NTB_SWITCHTEC=m
CONFIG_NTB_PINGPONG=m
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=m
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_SIMPLE is not set
CONFIG_RESET_TI_SYSCON=m
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=m
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_INTEL_RAPL is not set
CONFIG_MCB=y
CONFIG_MCB_PCI=m
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
CONFIG_USB4=y
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RAVE_SP_EEPROM is not set
CONFIG_NVMEM_RMEM=m
# CONFIG_NVMEM_SPMI_SDAM is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_STM_SOURCE_FTRACE=y
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=y
# CONFIG_FPGA_DFL_FME is not set
CONFIG_FPGA_DFL_AFU=y
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=y
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_SIOX=m
CONFIG_SIOX_BUS_GPIO=m
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=m
# CONFIG_104_QUAD_8 is not set
CONFIG_INTEL_QEP=m
CONFIG_INTERRUPT_CNT=m
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ECRYPT_FS=m
# CONFIG_ECRYPT_FS_MESSAGING is not set
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_FS_WBUF_VERIFY=y
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_UBIFS_FS is not set
CONFIG_CRAMFS=y
# CONFIG_CRAMFS_MTD is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
# CONFIG_PSTORE_DEFLATE_COMPRESS is not set
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=m
CONFIG_PSTORE_LZ4HC_COMPRESS=y
# CONFIG_PSTORE_842_COMPRESS is not set
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
# CONFIG_PSTORE_RAM is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=m
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=m
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
# CONFIG_NLS_UTF8 is not set
CONFIG_DLM=y
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_GCC_PLUGIN_STACKLEAK=y
# CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE is not set
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
CONFIG_STACKLEAK_RUNTIME_DISABLE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
# CONFIG_CRYPTO_XTS is not set
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=m
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=m
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=m
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TWOFISH_586=y
CONFIG_CRYPTO_CRC32C_INTEL=m
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
CONFIG_CRYPTO_DEV_GEODE=m
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=m
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
# CONFIG_CRYPTO_DEV_CCP is not set
CONFIG_CRYPTO_DEV_QAT=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_4XXX=y
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=m
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_CMA is not set
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
# end of Library routines

CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
CONFIG_TRACE_EVAL_MAP_FILE=y
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
CONFIG_HIST_TRIGGERS_DEBUG=y
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=y
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
CONFIG_PUNIT_ATOM_DEBUG=y
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAULT_INJECTION_USERCOPY is not set
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_FAULT_INJECTION_CONFIGFS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--IB4Sg/8EDR962jJL
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='rppt/jitalloc/v1'
	export commit='ecc5ba69314d3b4f68d4e66cc2a10762751c482e'
	export kconfig='i386-randconfig-i006-20230531'
	export repeat_to=6
	export nr_vm=300
	export submit_id='647b29b5b2b7d7da58d1ebaf'
	export job_file='/lkp/jobs/scheduled/vm-meta-231/boot-1-debian-11.1-i386-20220923.cgz-ecc5ba69314d3b4f68d4e66cc2a10762751c482e-20230603-55896-pti06q-3.yaml'
	export id='95196d12f9c25b8b086286f44d29de05e28b1d35'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-12'
	export enqueue_time='2023-06-03 19:53:25 +0800'
	export _id='647b29cab2b7d7da58d1ebb0'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e/3'
	export scheduler_version='/lkp/lkp/.src-20230602-160545'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e/3
BOOT_IMAGE=/pkg/linux/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e/vmlinuz-6.4.0-rc3-00013-gecc5ba69314d
branch=rppt/jitalloc/v1
job=/lkp/jobs/scheduled/vm-meta-231/boot-1-debian-11.1-i386-20220923.cgz-ecc5ba69314d3b4f68d4e66cc2a10762751c482e-20230603-55896-pti06q-3.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i006-20230531
commit=ecc5ba69314d3b4f68d4e66cc2a10762751c482e
initcall_debug
mem=4G
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export stop_repeat_if_found='dmesg.BUG:unable_to_handle_page_fault_for_address'
	export kbuild_queue_analysis=1
	export meta_host='vm-meta-231'
	export kernel='/pkg/linux/i386-randconfig-i006-20230531/gcc-12/ecc5ba69314d3b4f68d4e66cc2a10762751c482e/vmlinuz-6.4.0-rc3-00013-gecc5ba69314d'
	export dequeue_time='2023-06-03 19:53:55 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-231/boot-1-debian-11.1-i386-20220923.cgz-ecc5ba69314d3b4f68d4e66cc2a10762751c482e-20230603-55896-pti06q-3.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--IB4Sg/8EDR962jJL
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
Wg==

--IB4Sg/8EDR962jJL--
