Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC5823C7
	for <oe-lkp@lists.linux.dev>; Tue, 26 Mar 2024 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711433672; cv=fail; b=Q0ckfFR9ebz5aaxkJtDIrouRkmkBzMmExN6sta6i1X5eQky+EIeqXQgr/xAl1qjBlxNY6KDMOsRXgD9fOZZyNu9OUigWdA7V0j0BOzH5nsJydWyQtpIs8bAieEPcvblwEPNTVvnURgwqCYlBWsSlLgrhYVpdn/qM1326IVUavKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711433672; c=relaxed/simple;
	bh=mBRevRiqr4gIZxn1VD5sZuRVe/3O8rgWgtC6BVG6u9A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lB6rSvyFTrh4X2HADCurOU1z/o2VTqS8Txyo2KwbUE5wgjou6+kb7mZMbVfGeJoorckSakg3sIB7LKf51zCmLbJwRF/OBi5mxQ1e8H0JVnGrviyiwh1zr3le8dx3fExWfG2p5Ff0m1IDA66AlEC/+s0swchkSeA7/4cxYH8zgQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bgu/iQcx; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bgu/iQcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711433671; x=1742969671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBRevRiqr4gIZxn1VD5sZuRVe/3O8rgWgtC6BVG6u9A=;
  b=Bgu/iQcxkEmZheAKC8bqsCXOq0a6eMldYx690qrMhN7IUvR7L0jD53tz
   /lqMEoE8pYOwrpwD3KkXbmUuuim/+rpYGF/Wo6W7pQ57az6BlhF4XoinF
   5M7dC5e7A+vWsKqL91nkzoi5POXLywlLIUq4kZyXeBGOL7Pxj0Rpjd2za
   8e2nMYG+5CsKH38eQyCtw5km5bauqxo3XISDnHN9mQHAC90VxFoGw3wcW
   y5iNCSnzjynepw/REjPXrsEbgptknMR9serdIQJub2DuhoJpNdM7+aD5/
   0/JRAjJyYS6O4/390Ks5QVadLje1dkaTCTsvU5D8q3gpVgyRmtmX959tv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6361092"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6361092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 23:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="20574110"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Mar 2024 23:14:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 23:14:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 23:14:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 23:14:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 23:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhSQO/fzi+g5vexAu4HcXt7JeORZVsOJnv8GD1IFz2fCUpcfKUVcbN838uoZSSlKbqWuR0yoCb8Xy1vmUcgrsWFZKdMlfL7VOH0UyzHd7zQA0r4XE5fc+QUUR9iLLrfwZDurIW/Si1DsR8ttyqJ/1WtJT5f9zpuKXoYXbA9/dFOB2MhTs42X0YVInvtC6L25W2EeaG4n87Jooz6s4huy6WfSsheI8wSjJdxqZn04OCCEb16IS9u6aiE9MlJYT4FBvJxnGCpIcnJ6xFUYU7ss+69iy8dM/Xe2TQK5wBtB0/exacicJQiSdhNRjdlj3gCMfDADpFebMKWnAMbGJqD2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK2G20yXBppiV8MiJ8p2TzlZOiXgECnu42QJictPBz8=;
 b=VK6HxCKEkQBXfirosVyZ7CoK7WwJbDoX7HoynDv0+q08LQ/Q3vR8ODWdToGFdNZfrlEhx5NYJZG+r+Ek8MHulRCrPBfEgJ3M4xKM3ruC3Bo0YINSmDC1hKTpKNY5mhl8n5VfPz0nnCLstPDkcCEsw+yD07iSUXynAdk8aRdYvs4yQ/9LHteOq+ErviyqHJ/da19gb8YG6eBMpj7HG356BdMtKc0dlPpvCs2Kg31KoiAb1yynuAtfyhJK+ws3gya+GD8KKYxE7EqTf3xJUAQVfiYu5CPMGN/lNlOEL0etkUJsnyppQr2MtOaNr+gUc8eNQAJa1+3lpoF+ZWA6I8nMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Tue, 26 Mar
 2024 06:14:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 06:14:24 +0000
Date: Tue, 26 Mar 2024 14:14:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [arm-integrator:test]  0d7231b629:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202403251740.ee5bf6fc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7596:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trlyRatzQFj9HjXesHDbDU3xNYU/ivRzao7Ytrco8QO2Pgdpt6elVQrf/dgP/TW+ANQpCifwnltV2kQEvbVVXkkyudRfefaS6C6EoXycsYiz52uj1je4MvHjCmbUbq3Kg/IRGa7zmcE+U/7GdE+VfaJ+4SiC7Rxxs/WfufviVK646yuYGSdJLhFpcphMhQtZnj+Irw0BFfhdrBACt6n6wpyT0V36/9WnmaSTGzN4f8X8gcIUxFw3eFlP4TPaCA+66oxTH6pj6mupZH/BW4S4tO3CoveW4LoZ98jbgP3qi9cd4dahpCOsBIwF/ei3o+uBI9cvdnKE7ovefLbm38/yIJDS7rrrG1BlEf7wAlXMOZzB2ULzVyiCTvQ8IcUazt3jAWk1Q6G4gQ5R0KGHXcLadxGMXlXAIxymYgW9Ozo/Iz7uJQnVTy2WODz68gYIuiKiyTUChROEFoyiv1BiOmJIkShx0DKEzDsPVtSuOoXiwResXokPLzf17XaJ1+skzyIoov4mPkNTOmlY8W/OHQCrwDpmNXWWCtQhDLXi586ZoyKA7gptA45gJ7fiY2kPCxQ8B0Y8WJAVkMOq0uIY35A/zAfyF537ceGpX4UYGWFrWZYBe0yGuBu1lZ0cWDtNapPA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfMnNkxz6p7f4kft46lZ6QWIqyh3z5cRJsXf7aEjsxhK8oPi6JUTJT+2lxWY?=
 =?us-ascii?Q?dbsQburnmp0C86/QFk/sBnBLkqiIODdBX0g2YH7RlyqkgkaCnvEgIh8wv+Zn?=
 =?us-ascii?Q?Wsu9JddrpE7h9/3YTxt+K+jYdfNyxa3yaUaBbys3CHpRC7cOmlIhyNbMuMzv?=
 =?us-ascii?Q?gFNursvW/+Sgw1pIuM2e0zcBwWGjhevDywfDTpSPmN5z/fGrwC8o/ZZzEY58?=
 =?us-ascii?Q?L5SSUriimeXR2DH2ZDDnvCdjvHB79TYgQ5AacjfpZDbBaKcxxR7PX/0SFGY/?=
 =?us-ascii?Q?ui5D2dJeRltuDdtQYmfHYF6lRan+5kJ+8e89GEvrv2cnj35mG3N8xxs0H13x?=
 =?us-ascii?Q?aNMcMq3eZ4JKOzZca37y74G9pSy0c0i0oorbqyEnGJJb/Zv3HulqhELpT9G0?=
 =?us-ascii?Q?01l9iC+wzALi8UXjV5c4Git2DIaMRECM66N4Y8a96VREBXQH09trlLwYOTIG?=
 =?us-ascii?Q?+OIf+SCCtt8KDbWXHgloJSQ9oLLJ338U9Zdp8VSEB7pDQllFcTnegbsNtxLW?=
 =?us-ascii?Q?VjsYowq5B7UAGohv9ZunKuZDSdDum+5oUHL2baWqmhbpbpRuwNa9bLPKCMS2?=
 =?us-ascii?Q?mu0/E22xQQv6g86XACyYPRuPmsF7iWIFz4UI6PHuNKaAqW5/SsOK5PNILRxh?=
 =?us-ascii?Q?3WINq4huev37TIO0YJf7ouOdg3FdAyqD2pzbzHOC9p2tJkIZeNq2QTrIV+JS?=
 =?us-ascii?Q?ZMCRUpZB7pL1gc+SDMqvOP9/4T6Enl7AnAZNPkoCRQRqS6iWSCmzb9LompOu?=
 =?us-ascii?Q?PkD8Yrz/qzeYdKifkojum+W54tQJUqZsg+hs14XfQBe7UA2Ba8cRO8O2CQ7Q?=
 =?us-ascii?Q?3VC1N5yzlDLyImBc7G283HZ0mlQTYa3I8b3I1OyBxiJZQOfbGib40yTu4Uk2?=
 =?us-ascii?Q?qwKcpFgYZTZ9NZcTl2D5jKiVJwkIuwsoCPJpgA+rQBYLCC1M03YkeFQwzwfI?=
 =?us-ascii?Q?Fcb0eFY6KteHHQBchcPdD5H4EUUlm7DZB1yzQrowh9YggqSH9RrzlMJ1srCp?=
 =?us-ascii?Q?qWAewCJbMQNvatSXcX2MKCtZOCi7MSr/MP/n6t24PWVfSZVC8yepxTYq7RbT?=
 =?us-ascii?Q?DywCN45e6Q8sfziBVAzabXh7b59aDg3hU8vaJX9gQjcsf7jAgGASm5JmsBq0?=
 =?us-ascii?Q?L1eFOL2euCAYu5K5T+FaYqUlWjqaiDutjaXaYFCXIIVwDsqaDb8WZ4cO/I6R?=
 =?us-ascii?Q?bDcPz+3wm7s2V8uj7QLNOqj7e+ZQR5BslpAgirNWpF0eucnHiS9ldRdOyK5o?=
 =?us-ascii?Q?s66vIUANKGuSsrgaTLFFDPo/cN9NCycvQ9HynOsUuykgMhbyWXEZbw4lgz/d?=
 =?us-ascii?Q?f+G7/WKYlqsqdw/5wJE7VSnYSy1BDQvSDDy0KBoyBaqOWuDwhSY7S20ru4N+?=
 =?us-ascii?Q?P1GsdREGFg5V0x3o6QeGdm2qpPKciwU6Qr8YM+Vrxi0AWT285G3DDEF/ElYN?=
 =?us-ascii?Q?hjVexFIKjRRU8Jk0Rat9oNAV7x1ee6VOccEfvpDAfG5Vfk3zPKin21sOwifn?=
 =?us-ascii?Q?AVfs4OAdX9vyLyq63ODBe1tH3ih/X7Am81LnDK0Ski5rG0KU/ghlz7xBRLwL?=
 =?us-ascii?Q?cZOhHUmbpKxEVSVKUH7xNdmliWBY2CIQbIKjTSEbEQC+/oJ5i05g9mipjnIw?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105353ea-c80a-4ca6-a258-08dc4d5bfbee
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 06:14:24.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFuDlb3Ehk2pd6qv7nZBjiAQQlbTdifX0/WpmCgzJSz1z92GJa5orKr6eu66StNy5UUYzwaC7ATzRlevJ6kBRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-OriginatorOrg: intel.com


hi, Linus Walleij,

we noticed this is a debug patch and lots of pr_info() are added, however,
we don't know below issue we captured in our tests is expected or if it could
supply any hint. so still report to you FYI.

if you don't want us to test this 'test' branch any longer, please let us know.
Thanks!



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 0d7231b62906aa3562554714aa708ac0b452c0a5 ("CFI debug code")
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-integrator.git test

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------+----------+------------+
|                                                             | v6.8-rc2 | 0d7231b629 |
+-------------------------------------------------------------+----------+------------+
| BUG:unable_to_handle_page_fault_for_address                 | 0        | 12         |
| Oops:#[##]                                                  | 0        | 12         |
| EIP:string                                                  | 0        | 12         |
| Kernel_panic-not_syncing:Fatal_exception                    | 0        | 12         |
+-------------------------------------------------------------+----------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403251740.ee5bf6fc-lkp@intel.com


[  121.519073][    T1] BUG: unable to handle page fault for address: 00005554
[  121.520395][    T1] #PF: supervisor read access in kernel mode
[  121.521184][    T1] #PF: error_code(0x0000) - not-present page
[  121.521184][    T1] *pde = 00000000
[  121.521184][    T1] Oops: 0000 [#1]
[  121.521184][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G        W        N 6.8.0-rc2-00001-g0d7231b62906 #7
[ 121.521184][ T1] EIP: string (lib/vsprintf.c:646 lib/vsprintf.c:728) 
[ 121.521184][ T1] Code: aa 00 00 00 8d 96 00 f0 ff ff 81 fa 00 e0 ff ff 77 44 8d 3c 08 31 d2 85 c9 75 0f eb 15 90 39 d8 73 02 88 08 40 42 39 f8 74 08 <0f> b6 0c 16 84 c9 75 ec 8b 75 f0 89 d9 89 34 24 8b 75 ec 89 74 24
All code
========
   0:	aa                   	stos   %al,%es:(%rdi)
   1:	00 00                	add    %al,(%rax)
   3:	00 8d 96 00 f0 ff    	add    %cl,-0xfff6a(%rbp)
   9:	ff 81 fa 00 e0 ff    	incl   -0x1fff06(%rcx)
   f:	ff 77 44             	push   0x44(%rdi)
  12:	8d 3c 08             	lea    (%rax,%rcx,1),%edi
  15:	31 d2                	xor    %edx,%edx
  17:	85 c9                	test   %ecx,%ecx
  19:	75 0f                	jne    0x2a
  1b:	eb 15                	jmp    0x32
  1d:	90                   	nop
  1e:	39 d8                	cmp    %ebx,%eax
  20:	73 02                	jae    0x24
  22:	88 08                	mov    %cl,(%rax)
  24:	40                   	rex
  25:	42 39 f8             	rex.X cmp %edi,%eax
  28:	74 08                	je     0x32
  2a:*	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx		<-- trapping instruction
  2e:	84 c9                	test   %cl,%cl
  30:	75 ec                	jne    0x1e
  32:	8b 75 f0             	mov    -0x10(%rbp),%esi
  35:	89 d9                	mov    %ebx,%ecx
  37:	89 34 24             	mov    %esi,(%rsp)
  3a:	8b 75 ec             	mov    -0x14(%rbp),%esi
  3d:	89                   	.byte 0x89
  3e:	74 24                	je     0x64

Code starting with the faulting instruction
===========================================
   0:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   4:	84 c9                	test   %cl,%cl
   6:	75 ec                	jne    0xfffffffffffffff4
   8:	8b 75 f0             	mov    -0x10(%rbp),%esi
   b:	89 d9                	mov    %ebx,%ecx
   d:	89 34 24             	mov    %esi,(%rsp)
  10:	8b 75 ec             	mov    -0x14(%rbp),%esi
  13:	89                   	.byte 0x89
  14:	74 24                	je     0x3a
[  121.521184][    T1] EAX: c025fcb6 EBX: c025fcbc ECX: ffffffff EDX: 00000000
[  121.521184][    T1] ESI: 00005554 EDI: c025fcb5 EBP: c025fc38 ESP: c025fc1c
[  121.521184][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010086
[  121.521184][    T1] CR0: 80050033 CR2: 00005554 CR3: 0a02f000 CR4: 00040690
[  121.521184][    T1] Call Trace:
[ 121.521184][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 121.521184][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 121.521184][ T1] ? debug_locks_off (lib/debug_locks.c:44) 
[ 121.521184][ T1] ? oops_enter (kernel/panic.c:571 kernel/panic.c:629) 
[ 121.521184][ T1] ? page_fault_oops (arch/x86/mm/fault.c:707) 
[ 121.521184][ T1] ? prb_read (kernel/printk/printk_ringbuffer.c:1817) 
[ 121.521184][ T1] ? kernelmode_fixup_or_oops+0x90/0xf0 
[ 121.521184][ T1] ? __bad_area_nosemaphore+0x131/0x1d8 
[ 121.521184][ T1] ? _prb_read_valid (kernel/printk/printk_ringbuffer.c:1852 kernel/printk/printk_ringbuffer.c:1892) 
[ 121.521184][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:867) 
[ 121.521184][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1478) 
[ 121.521184][ T1] ? prb_read_valid (kernel/printk/printk_ringbuffer.c:1941) 
[ 121.521184][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1515 arch/x86/mm/fault.c:1563) 
[ 121.521184][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1520) 
[ 121.521184][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1056) 
[ 121.521184][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1520) 
[ 121.521184][ T1] ? string (lib/vsprintf.c:646 lib/vsprintf.c:728) 
[ 121.521184][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1520) 
[ 121.521184][ T1] ? string (lib/vsprintf.c:646 lib/vsprintf.c:728) 
[ 121.521184][ T1] vsnprintf (lib/vsprintf.c:2774) 
[ 121.521184][ T1] vprintk_store (kernel/printk/printk.c:2187) 
[ 121.521184][ T1] vprintk_emit (kernel/printk/printk.c:2284) 
[ 121.521184][ T1] vprintk_default (kernel/printk/printk.c:2319) 
[ 121.521184][ T1] vprintk (kernel/printk/printk_safe.c:46) 
[ 121.521184][ T1] _printk (kernel/printk/printk.c:2332) 
[ 121.521184][ T1] cfi_build_cmd_addr (drivers/mtd/chips/cfi_util.c:60) 
[ 121.521184][ T1] cfi_send_gen_cmd (drivers/mtd/chips/cfi_util.c:216) 
[ 121.521184][ T1] cfi_qry_mode_on (drivers/mtd/chips/cfi_util.c:281) 
[ 121.521184][ T1] cfi_probe_chip (drivers/mtd/chips/cfi_probe.c:117) 
[ 121.521184][ T1] ? vprintk (kernel/printk/printk_safe.c:46) 
[ 121.521184][ T1] genprobe_ident_chips (drivers/mtd/chips/gen_probe.c:188 drivers/mtd/chips/gen_probe.c:72) 
[ 121.521184][ T1] mtd_do_chip_probe (drivers/mtd/chips/gen_probe.c:29) 
[ 121.521184][ T1] ? _raw_spin_unlock (kernel/locking/spinlock.c:187) 
[ 121.521184][ T1] cfi_probe (drivers/mtd/chips/cfi_probe.c:441) 
[ 121.521184][ T1] do_map_probe (drivers/mtd/chips/chipreg.c:68) 
[ 121.521184][ T1] ? vprintk (kernel/printk/printk_safe.c:46) 
[ 121.521184][ T1] ? init_pcmciamtd (drivers/mtd/maps/sbc_gxx.c:182) 
[ 121.521184][ T1] init_sbc_gxx (drivers/mtd/maps/sbc_gxx.c:205) 
[ 121.521184][ T1] do_one_initcall (init/main.c:1236) 
[ 121.521184][ T1] ? parameq (kernel/params.c:90 kernel/params.c:99) 
[ 121.521184][ T1] do_initcalls (init/main.c:1297 init/main.c:1314) 
[ 121.521184][ T1] ? rdinit_setup (init/main.c:1284) 
[ 121.521184][ T1] ? rest_init (init/main.c:1433) 
[ 121.521184][ T1] kernel_init_freeable (init/main.c:1333) 
[ 121.521184][ T1] kernel_init (init/main.c:1443) 
[ 121.521184][ T1] ? schedule_tail (kernel/sched/core.c:5338) 
[ 121.521184][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 121.521184][ T1] ? rest_init (init/main.c:1433) 
[ 121.521184][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 121.521184][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[  121.521184][    T1] Modules linked in:
[  121.521184][    T1] CR2: 0000000000005554
[  121.521184][    T1] ---[ end trace 0000000000000000 ]---
[ 121.521184][ T1] EIP: string (lib/vsprintf.c:646 lib/vsprintf.c:728) 
[ 121.521184][ T1] Code: aa 00 00 00 8d 96 00 f0 ff ff 81 fa 00 e0 ff ff 77 44 8d 3c 08 31 d2 85 c9 75 0f eb 15 90 39 d8 73 02 88 08 40 42 39 f8 74 08 <0f> b6 0c 16 84 c9 75 ec 8b 75 f0 89 d9 89 34 24 8b 75 ec 89 74 24
All code
========
   0:	aa                   	stos   %al,%es:(%rdi)
   1:	00 00                	add    %al,(%rax)
   3:	00 8d 96 00 f0 ff    	add    %cl,-0xfff6a(%rbp)
   9:	ff 81 fa 00 e0 ff    	incl   -0x1fff06(%rcx)
   f:	ff 77 44             	push   0x44(%rdi)
  12:	8d 3c 08             	lea    (%rax,%rcx,1),%edi
  15:	31 d2                	xor    %edx,%edx
  17:	85 c9                	test   %ecx,%ecx
  19:	75 0f                	jne    0x2a
  1b:	eb 15                	jmp    0x32
  1d:	90                   	nop
  1e:	39 d8                	cmp    %ebx,%eax
  20:	73 02                	jae    0x24
  22:	88 08                	mov    %cl,(%rax)
  24:	40                   	rex
  25:	42 39 f8             	rex.X cmp %edi,%eax
  28:	74 08                	je     0x32
  2a:*	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx		<-- trapping instruction
  2e:	84 c9                	test   %cl,%cl
  30:	75 ec                	jne    0x1e
  32:	8b 75 f0             	mov    -0x10(%rbp),%esi
  35:	89 d9                	mov    %ebx,%ecx
  37:	89 34 24             	mov    %esi,(%rsp)
  3a:	8b 75 ec             	mov    -0x14(%rbp),%esi
  3d:	89                   	.byte 0x89
  3e:	74 24                	je     0x64

Code starting with the faulting instruction
===========================================
   0:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   4:	84 c9                	test   %cl,%cl
   6:	75 ec                	jne    0xfffffffffffffff4
   8:	8b 75 f0             	mov    -0x10(%rbp),%esi
   b:	89 d9                	mov    %ebx,%ecx
   d:	89 34 24             	mov    %esi,(%rsp)
  10:	8b 75 ec             	mov    -0x14(%rbp),%esi
  13:	89                   	.byte 0x89
  14:	74 24                	je     0x3a


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240325/202403251740.ee5bf6fc-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

