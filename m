Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E485D7E
	for <oe-lkp@lists.linux.dev>; Thu,  2 Feb 2023 02:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675305371; x=1706841371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C9Yy2vyx2Z1oBeMpIjRQKaFC9kFCTEU3SwUU0uqFbHk=;
  b=BSoaE2O0h+1xxceenaQd0DBukPca7BCyzVkAvW37g1pNX3XNOQipx3Xm
   6eIlskiY0o7R9dKWx62xQL04SqHZ3kry3reiH/9pd3XCfMHASZUNppiBN
   Fz5QbQSaYYOI24eSvSuAzay79XoSM1JW/cy2yZzJXLqbWTUDTrHR0YHtv
   dUuLDeDjGqQrwOaE+3D0E6m4QAi4pQFOrXW2YpcsP5i87+bpG9Ts+uy2K
   IJ0ySX4EPRgPBfn2hnAVAaS2SSINvu+oxXtNXE9oSi/fghzE3iJ2NW6bj
   L4k1fh01qU3xnoaBtQO/aC7tVlKKfw5nkyVdbdWH1PkQBDVdJrZSTCbmS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326986142"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="xz'341?scan'341,208,341";a="326986142"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993904114"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="xz'341?scan'341,208,341";a="993904114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 18:36:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 18:36:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 18:36:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 18:36:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 18:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieZsWYIid8uT23lJB8ZjR9ogmL+FSeVCaabL5Sc/qEJXbPjrixmrRkvG/yN4NEGYucR/dClT6eKV7Cq2Vt31ni8CN6dUvo6v66Xb2HVQtx3QLGjWqd+40rXVuqMI6oFtfJFeZf8URJ7mywh60s+Rm1REQxnfjLmoE4YB+3iH0/bScTCtURJ6oDrQnTR6WRY5EExvZkq66Y2vzd6fd+DWTLpAYLTiWoi2rb7UmJhWZkFwPo3ucu8SJcEu8y2I14AIqEKf4Vhq2VgMxt2kD4CqYX+a2M924KRjUd6ELMAhUpQtmJjblA5Jc8U3KAKiOpS6chZWPPP2xg++7Uncn4KoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhv+tVroGucBDcWH5U8/VZEXHvkGhsB80osolNzD3K0=;
 b=Vb/Gqn3LJHXvJ7bwR+Fejq/sIdmtqB9l6+4YkyfSaNkQ7tlEL+kfXqkcgIeeqsircxTMR898lIp/820+hmRFtvl0kdOAtMcUoYat8ZZQVZVcA0/KcGMPY/X9d/C2ek4iFRF9kOrTTHUHcRHTmZa+RUpLlUrUh4/MIKXJzNYC+As/CfShnCfWGYdvcBxWau9CSqEQhTq+3o257yKVUDzb639kNcAFA2CWYd4zghWUTWuIla8AqmI34VSPzrgWjm/Z2NToXe4GV7uUNQyKO01WGY+Sq+t6yk0qr5UGD25qG16bNdRVc6NR9GGjEKrxYeEPqrZXlnq0oTpMLrjex357Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 02:36:05 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::878d:c56c:28fd:e1cd%7]) with mapi id 15.20.6043.033; Thu, 2 Feb 2023
 02:36:05 +0000
Date: Thu, 2 Feb 2023 10:35:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: [peterz-queue:sched/wip] [sched/fair]  1a250f36f8: divide_error:#[##]
Message-ID: <202302020923.eeed7db0-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="eo3HaOpBKeHZ1Qbt"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d47210a-de38-4215-e12a-08db04c63afd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pESaz7w94C4Y6Rv4PnIsD0qTUwbvp6NuY7WZPCmptYaRoZpbRYjS7aiJIrgimyUT/T1fIfRMk4W3kw8HxAVZwxOC9ynZ7kYAc/WCrm1kRPJ6I7ZenjBQR0sxHFd5Auzop3Lv0ajLIWbvyjPka2pMz6GkBCO7Sca865pxdCTv3abdaG8+2yqi9zQk6I3p87/YuV0OY4QLuMI7YK+6Nhf0aX+ROCD+mbYMV+6wytGAkDkDixaZxqg910aIh1jxoH7KiEMSwERViz8zYPyazFCbONnTZhh8JdEcHNpfzUUirBto8g2T6Uf0XsbGWeu4Oif3NibmWN00shb0FtZXUDAVGkjgNkx3tRFVkLXK0GBmdL9NBtLCtWqwy8FvSHs/QBi/XEh5GjnDrBW6imxPYDQYZmdZZapKGgRlHGsKieZQHG9uQwTq2ReTKOskQiMsAsShc+I5t00RLgFNsUAE5kcuuvWD1GY1Y9QvmDnNMbdCV9bANS2WQwNZYre/HAsz/N0sLLfDtmcKO8nhrgAS1RG7JAdlEUk/XVbf8AZcnI91XLfy9hZi67O4ZaWHB5t7pDjoI3cneCouNgVXdqPdeG+D82NHt7qvFF2tDgwsVAkLo3xHobbR8sy7PDhkHYJhRgpUcJnDpMW5KOBD8MWcFgJXBRiLNSll3P+QLQCLhqtP3Z2Dby8/vqkz9zhMsgGgBVQ6CjTSVMV2VswsanIb/bCEqSqTRpFXkrKyjze4cJ8857vc1joBfxQmaxmqvIY5NiyU/U5xGent0m7Py0Z8suYNmHqmWRevnX6kBWG28JSfsdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199018)(8676002)(66476007)(6486002)(45080400002)(966005)(2906002)(478600001)(316002)(8936002)(41300700001)(4326008)(6916009)(66946007)(5660300002)(66556008)(235185007)(86362001)(38100700002)(36756003)(2616005)(186003)(6512007)(26005)(83380400001)(44144004)(6666004)(82960400001)(107886003)(6506007)(1076003)(2700100001)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQvw9Q2hlYylx30CjTx5RtHguQJ+ZoK4RTGDTV633NkXGrPIypfYdt2i0pU0?=
 =?us-ascii?Q?YnWt8Us8CueSh0+mIJ7EdhqV71l/a+f3trBwQr0eM6rGzRRbEdzdso3Qen42?=
 =?us-ascii?Q?Vq+JheY1SDjP65VcWU4L6vT95VeQYJDHMrtzo1ejx6yZ0s4Kv4L2SP2xLNSB?=
 =?us-ascii?Q?65a7QwMtpPIncLGGQyaOL0NMOxgk8LXIryFAGJ/xBS3oP1olf2c0+7to4dcO?=
 =?us-ascii?Q?oJGTm3OPaoZHUnEAO6xt018RtFohaRYpdPsSdjB587c53R7K1dgTGkQsmNSi?=
 =?us-ascii?Q?pkMxuYPORd9hho/ISIhNM3fx+agDkttet0mu47NHXnY1fPWgxs9bqES+QL4e?=
 =?us-ascii?Q?UOCsDT8VtaPsUwiRi8n+bFRfCElKznOOQvZT65NJvi7mKtob0NeprnCWIm2x?=
 =?us-ascii?Q?n1v6YDdShZjEtHdamIRE560P3RDlczww9Tuh1xaTub9wMv1YKp82UnmaCLpe?=
 =?us-ascii?Q?qlbTNEvoKd/6CqLfohmAor8lEnlDtH2N4kN8SWatKfUOcpiyMjNzGxvJh0YM?=
 =?us-ascii?Q?3TlMnksYXnBOfFh2Mk+IOoo8B0/vPjEM/HgRaJsCFtJ4EPq6gEpmcAMFqbH3?=
 =?us-ascii?Q?G1CubPSWI6a5aPUJ09vRBvAtvsopBPIxaLBqf5V7xdVMS+jAA0/ThSg/OhJ+?=
 =?us-ascii?Q?bsmcjcq0KgL8uT5Iaewc1uh7jCdrQAKCcPxD55X+8AF+I3WXO8bjXuCOU1tH?=
 =?us-ascii?Q?DR2TkVmznZpj63tXsv6/B82j+fjXaFOoHW2a8i6Y3UpVcAdoxVwrPPqMmZ8c?=
 =?us-ascii?Q?A+4nubGHb3V/q0GAMWAdRcofBuzsIhACHJvDEtndnvbOYQ8osM06Jjug54u7?=
 =?us-ascii?Q?YSJ8vya39ntAlKJtUQ128axsVkcXfkXT/k6V5Ck6fScsnmmxGQ+IcQ7v8ka4?=
 =?us-ascii?Q?mbW/SqbMTdPWwnrdmL/KZ0TllqImZLUPFy0DNRLOwdLTCa/M+II07XnNy4oq?=
 =?us-ascii?Q?mXTVtHqmHf66Z6es3mNGlgDpWdmNEH/ExqH+/JRF8pRF6oZiQVx3LKPE/3cI?=
 =?us-ascii?Q?Qe1VjpxgYCbvW0B1i/UUUopXTBNBiXoFP2bbdobGTqITa+20I/gJVqgIAnpy?=
 =?us-ascii?Q?79uCMAe1ckH4K3ser+G6iwJsvVdeSS9qH4q+bz3NJMtkLf2N8pCVuBAET0QU?=
 =?us-ascii?Q?Lw56GGBchAT2f5s70KYp5zngKVTFlrS1KJXWNfdEIKNC/OeqTrsyruer/WaF?=
 =?us-ascii?Q?D5G9z/3CnkQbWyEMJLmZGtzKdIxMqWSDsWDSYajVfCVMX844uZZWJJdwIu85?=
 =?us-ascii?Q?HPsfPwEM/MGRBYh88Wyldd615aVaG36aAjLiy6Kjk7DWC00gfZKfHvQsAP9y?=
 =?us-ascii?Q?emelOuq4UiedTzo9Z/5Aoea3L/GfWMha9vCgCTLCil0UhEEbEyX/sFkW9LuC?=
 =?us-ascii?Q?L7+iRgHtYnIkcF6kyDSsl27sL+t7owsJM53lgkc7bJArnjwPqseeOqoojRxp?=
 =?us-ascii?Q?GoeRVGMTuix8v4ka5mswK2ITOd6gK91wd15xPuvI0BVHN4jYfaxPb9kNvers?=
 =?us-ascii?Q?dAMp+JqA79nVAUrBh3aWASCgxbTRQU8LTNxgZry6zxn+5c+4QUpVETm7cfAW?=
 =?us-ascii?Q?5pn/1dCt5uI0TUvClXVSkwR5cIBtwn+dIYW/Q5/KabLTQdH/kvwbEzqLeJ8D?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d47210a-de38-4215-e12a-08db04c63afd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 02:36:05.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZYYoOBioRlbU1bO/w5bhEQnrSPasGKlhb52vY6XXNxs5ogEC+sWGaiCyiT6wzcxjttz8qDz6rgYmL+cbZcmyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
X-OriginatorOrg: intel.com

--eo3HaOpBKeHZ1Qbt
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi, PeterZ,

we reported this commit twice before [1][2], since the issues are quite
persistent in our tests.
we also noticed this branch rebased often and our auto-bisect captured
this commit more times and we just ignored the report since the issues
are similar.
now we captured it again with similar issue, just made another report FYI.

we also want to consult
(1) could we just ignore this commit if it still shows similar issue in the
    future?
(2) is there any specific config request to test this sched/wip branch?
(3) or could we just ignore the tests for this branch?

Thanks

[1] https://lore.kernel.org/all/20220417091709.GA9433@xsang-OptiPlex-9020/
[2] https://lore.kernel.org/all/202211111456.49150dcd-yujie.liu@intel.com/

Greeting,

FYI, we noticed divide_error:#[##] due to commit (built with gcc-11):

commit: 1a250f36f8e33d2e3669bc46d27bf8620c9688d5 ("sched/fair: Fold the sched_avg update")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/wip

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202302020923.eeed7db0-oliver.sang@intel.com


[   70.729189][  T204] target ucode:
[   70.729203][  T204]
[   70.731821][  T204] sleep started
[   70.731831][  T204]
[   77.981474][   T49] Writes:  Total: 10559890  Max/Min: 2740057/2566048   Fail: 0
[   98.243621][  T336] divide error: 0000 [#1] SMP
[   98.244409][  T336] CPU: 1 PID: 336 Comm: meminfo Tainted: G                T  6.2.0-rc6-00096-g1a250f36f8e3 #10
[   98.245776][  T336] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[ 98.247139][ T336] EIP: post_init_entity_util_avg (??:?) 
[ 98.247945][ T336] Code: b9 00 04 00 00 29 c1 83 f9 01 7e 36 d1 f9 85 c0 74 50 8b 93 e0 0b 00 00 0f af c2 31 d2 89 83 68 0c 00 00 8b b7 80 00 00 00 46 <f7> f6 39 c8 77 32 89 83 68 0c 00 00 89 c1 eb 0e 8d b4 26 00 00 00
All code
========
   0:	b9 00 04 00 00       	mov    $0x400,%ecx
   5:	29 c1                	sub    %eax,%ecx
   7:	83 f9 01             	cmp    $0x1,%ecx
   a:	7e 36                	jle    0x42
   c:	d1 f9                	sar    %ecx
   e:	85 c0                	test   %eax,%eax
  10:	74 50                	je     0x62
  12:	8b 93 e0 0b 00 00    	mov    0xbe0(%rbx),%edx
  18:	0f af c2             	imul   %edx,%eax
  1b:	31 d2                	xor    %edx,%edx
  1d:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
  23:	8b b7 80 00 00 00    	mov    0x80(%rdi),%esi
  29:*	46 f7 f6             	rex.RX div %esi		<-- trapping instruction
  2c:	39 c8                	cmp    %ecx,%eax
  2e:	77 32                	ja     0x62
  30:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
  36:	89 c1                	mov    %eax,%ecx
  38:	eb 0e                	jmp    0x48
  3a:	8d                   	.byte 0x8d
  3b:	b4 26                	mov    $0x26,%ah
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	f7 f6                	div    %esi
   2:	39 c8                	cmp    %ecx,%eax
   4:	77 32                	ja     0x38
   6:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
   c:	89 c1                	mov    %eax,%ecx
   e:	eb 0e                	jmp    0x1e
  10:	8d                   	.byte 0x8d
  11:	b4 26                	mov    $0x26,%ah
  13:	00 00                	add    %al,(%rax)
	...
[   98.250388][  T336] EAX: 00003800 EBX: c56bd640 ECX: 000001f9 EDX: 00000000
[   98.251305][  T336] ESI: 00000000 EDI: ee1d1800 EBP: edc01ec4 ESP: edc01eb4
[   98.252222][  T336] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010056
[   98.253280][  T336] CR0: 80050033 CR2: 005025c0 CR3: 2e2ba1e0 CR4: 000406f0
[   98.254222][  T336] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   98.255152][  T336] DR6: fffe0ff0 DR7: 00000400
[   98.255811][  T336] Call Trace:
[ 98.256347][ T336] wake_up_new_task (??:?) 
[ 98.257044][ T336] kernel_clone (??:?) 
[ 98.257727][ T336] __do_sys_vfork (fork.c:?) 
[ 98.258406][ T336] do_int80_syscall_32 (??:?) 
[ 98.259097][ T336] entry_INT80_32 (??:?) 
[   98.259766][  T336] EIP: 0xb7e04c38
[ 98.260323][ T336] Code: 66 90 e8 fb 40 fb ff e9 ce fe ff ff 8d b6 00 00 00 00 e8 3b 43 f5 ff 89 c7 e9 7c fe ff ff 66 90 66 90 59 b8 be 00 00 00 cd 80 <51> 3d 01 f0 ff ff 0f 83 1c 43 f5 ff c3 8b 5c 24 04 b8 fc 00 00 00
All code
========
   0:	66 90                	xchg   %ax,%ax
   2:	e8 fb 40 fb ff       	callq  0xfffffffffffb4102
   7:	e9 ce fe ff ff       	jmpq   0xfffffffffffffeda
   c:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  12:	e8 3b 43 f5 ff       	callq  0xfffffffffff54352
  17:	89 c7                	mov    %eax,%edi
  19:	e9 7c fe ff ff       	jmpq   0xfffffffffffffe9a
  1e:	66 90                	xchg   %ax,%ax
  20:	66 90                	xchg   %ax,%ax
  22:	59                   	pop    %rcx
  23:	b8 be 00 00 00       	mov    $0xbe,%eax
  28:	cd 80                	int    $0x80
  2a:*	51                   	push   %rcx		<-- trapping instruction
  2b:	3d 01 f0 ff ff       	cmp    $0xfffff001,%eax
  30:	0f 83 1c 43 f5 ff    	jae    0xfffffffffff54352
  36:	c3                   	retq   
  37:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  3b:	b8 fc 00 00 00       	mov    $0xfc,%eax

Code starting with the faulting instruction
===========================================
   0:	51                   	push   %rcx
   1:	3d 01 f0 ff ff       	cmp    $0xfffff001,%eax
   6:	0f 83 1c 43 f5 ff    	jae    0xfffffffffff54328
   c:	c3                   	retq   
   d:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  11:	b8 fc 00 00 00       	mov    $0xfc,%eax
[   98.262719][  T336] EAX: ffffffda EBX: 004f9e4c ECX: 004e5b90 EDX: 00000000
[   98.263637][  T336] ESI: 004f9e4c EDI: 004fa218 EBP: 00000002 ESP: bf8b5090
[   98.264574][  T336] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000286
[   98.265652][  T336] Modules linked in: ipmi_devintf ipmi_msghandler input_leds sd_mod crc32_pclmul serio_raw evbug parport_pc drm drm_panel_orientation_quirks i2c_core
[   98.267665][  T336] ---[ end trace 0000000000000000 ]---
[ 98.268402][ T336] EIP: post_init_entity_util_avg (??:?) 
[ 98.269190][ T336] Code: b9 00 04 00 00 29 c1 83 f9 01 7e 36 d1 f9 85 c0 74 50 8b 93 e0 0b 00 00 0f af c2 31 d2 89 83 68 0c 00 00 8b b7 80 00 00 00 46 <f7> f6 39 c8 77 32 89 83 68 0c 00 00 89 c1 eb 0e 8d b4 26 00 00 00
All code
========
   0:	b9 00 04 00 00       	mov    $0x400,%ecx
   5:	29 c1                	sub    %eax,%ecx
   7:	83 f9 01             	cmp    $0x1,%ecx
   a:	7e 36                	jle    0x42
   c:	d1 f9                	sar    %ecx
   e:	85 c0                	test   %eax,%eax
  10:	74 50                	je     0x62
  12:	8b 93 e0 0b 00 00    	mov    0xbe0(%rbx),%edx
  18:	0f af c2             	imul   %edx,%eax
  1b:	31 d2                	xor    %edx,%edx
  1d:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
  23:	8b b7 80 00 00 00    	mov    0x80(%rdi),%esi
  29:*	46 f7 f6             	rex.RX div %esi		<-- trapping instruction
  2c:	39 c8                	cmp    %ecx,%eax
  2e:	77 32                	ja     0x62
  30:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
  36:	89 c1                	mov    %eax,%ecx
  38:	eb 0e                	jmp    0x48
  3a:	8d                   	.byte 0x8d
  3b:	b4 26                	mov    $0x26,%ah
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	f7 f6                	div    %esi
   2:	39 c8                	cmp    %ecx,%eax
   4:	77 32                	ja     0x38
   6:	89 83 68 0c 00 00    	mov    %eax,0xc68(%rbx)
   c:	89 c1                	mov    %eax,%ecx
   e:	eb 0e                	jmp    0x1e
  10:	8d                   	.byte 0x8d
  11:	b4 26                	mov    $0x26,%ah
  13:	00 00                	add    %al,(%rax)
	...
[   98.271585][  T336] EAX: 00003800 EBX: c56bd640 ECX: 000001f9 EDX: 00000000
[   98.272508][  T336] ESI: 00000000 EDI: ee1d1800 EBP: edc01ec4 ESP: edc01eb4
[   98.273388][  T336] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010056
[   98.286512][  T336] CR0: 80050033 CR2: 005025c0 CR3: 2e2ba1e0 CR4: 000406f0
[   98.287475][  T336] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   98.288389][  T336] DR6: fffe0ff0 DR7: 00000400
[   98.289045][  T336] Kernel panic - not syncing: Fatal exception
[   98.289902][  T336] Kernel Offset: disabled

Kboot worker: lkp-worker32
Elapsed time: 120



To reproduce:

        # build kernel
	cd linux
	cp config-6.2.0-rc6-00096-g1a250f36f8e3 .config
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



--eo3HaOpBKeHZ1Qbt
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.2.0-rc6-00096-g1a250f36f8e3"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.2.0-rc6 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23990
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23990
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_UAPI_HEADER_TEST=y
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
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_KERNEL_ZSTD=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
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
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# CONFIG_BPF_JIT is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
# CONFIG_FORCE_TASKS_RCU is not set
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
# CONFIG_FORCE_TASKS_TRACE_RCU is not set
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
CONFIG_UCLAMP_TASK=y
CONFIG_UCLAMP_BUCKETS_COUNT=5
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_UCLAMP_TASK_GROUP=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
# CONFIG_CPUSETS is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_MISC=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_TIME_NS=y
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
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
# CONFIG_IOSF_MBI is not set
CONFIG_X86_32_IRIS=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_PVHVM_GUEST=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
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
CONFIG_M686=y
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
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=6
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=64
CONFIG_NR_CPUS_DEFAULT=32
CONFIG_NR_CPUS=32
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
# CONFIG_X86_MCELOG_LEGACY is not set
# CONFIG_X86_MCE_INTEL is not set
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_ANCIENT_MCE=y
CONFIG_X86_MCE_INJECT=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_X86_IOPL_IOPERM is not set
# CONFIG_TOSHIBA is not set
CONFIG_X86_REBOOTFIXUPS=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=m
CONFIG_X86_CPUID=y
# CONFIG_NOHIGHMEM is not set
# CONFIG_HIGHMEM4G is not set
CONFIG_HIGHMEM64G=y
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
CONFIG_X86_PAE=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_NUMA=y
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=3
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_X86_PMEM_LEGACY is not set
CONFIG_HIGHPTE=y
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
CONFIG_X86_INTEL_TSX_MODE_ON=y
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_KEXEC=y
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
CONFIG_DEBUG_HOTPLUG_CPU0=y
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=0
CONFIG_FUNCTION_PADDING_BYTES=4
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_USERSPACE_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_NUMA is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_EXTLOG is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y
CONFIG_X86_APM_BOOT=y
CONFIG_APM=y
# CONFIG_APM_IGNORE_USER_SUSPEND is not set
CONFIG_APM_DO_ENABLE=y
# CONFIG_APM_CPU_IDLE is not set
CONFIG_APM_DISPLAY_BLANK=y
# CONFIG_APM_ALLOW_INTS is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
CONFIG_X86_POWERNOW_K7=m
CONFIG_X86_POWERNOW_K7_ACPI=y
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
CONFIG_X86_P4_CLOCKMOD=m
CONFIG_X86_CPUFREQ_NFORCE2=y
CONFIG_X86_LONGRUN=y
# CONFIG_X86_LONGHAUL is not set
# CONFIG_X86_E_POWERSAVER is not set

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
CONFIG_SCx200HR_TIMER=m
# CONFIG_ALIX is not set
# CONFIG_NET5501 is not set
CONFIG_GEOS=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
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
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
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
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT=4
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_CGROUP_IOPRIO=y
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

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
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_GUP_GET_PXX_LOW_HIGH=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
CONFIG_ANON_VMA_NAME=y
CONFIG_USERFAULTFD=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
CONFIG_DAMON_PADDR=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_RECLAIM=y
# CONFIG_DAMON_LRU_SORT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
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
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
CONFIG_I82365=m
CONFIG_TCIC=m
CONFIG_PCMCIA_PROBE=y
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

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
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=m
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m
CONFIG_RFD_FTL=m
CONFIG_SSFDC=m
CONFIG_SM_FTL=m
# CONFIG_MTD_OOPS is not set
CONFIG_MTD_SWAP=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=m
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SCx200_DOCFLASH=m
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=m
# CONFIG_MTD_ESB2ROM is not set
# CONFIG_MTD_CK804XROM is not set
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=m
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=m
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_DENALI_PCI is not set
# CONFIG_MTD_NAND_CAFE is not set
# CONFIG_MTD_NAND_CS553X is not set
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
CONFIG_MTD_NAND_ARASAN=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_RICOH is not set
# CONFIG_MTD_NAND_DISKONCHIP is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
CONFIG_MTD_NAND_ECC_SW_BCH=y
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
# CONFIG_PARPORT_PC_PCMCIA is not set
CONFIG_PARPORT_AX88796=m
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_PNPBIOS is not set
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_XEN_BLKDEV_FRONTEND=y
# CONFIG_XEN_BLKDEV_BACKEND is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=m
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_SMPRO_ERRMON is not set
CONFIG_SMPRO_MISC=m
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
# CONFIG_PCH_PHUB is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ALTERA_STAPL is not set
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=m
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=y
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
CONFIG_BLK_DEV_BSG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AHA152X is not set
# CONFIG_SCSI_AHA1542 is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
CONFIG_SCSI_ADVANSYS=m
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_XEN_SCSI_FRONTEND=m
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
CONFIG_SCSI_FDOMAIN=m
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_FDOMAIN_ISA is not set
# CONFIG_SCSI_ISCI is not set
CONFIG_SCSI_GENERIC_NCR5380=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_PPA=m
CONFIG_SCSI_IMM=m
CONFIG_SCSI_IZIP_EPP16=y
CONFIG_SCSI_IZIP_SLOW_CTR=y
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_FAS is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=y
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
CONFIG_PCMCIA_AHA152X=m
CONFIG_PCMCIA_FDOMAIN=m
# CONFIG_PCMCIA_NINJA_SCSI is not set
CONFIG_PCMCIA_QLOGIC=m
CONFIG_PCMCIA_SYM53C500=m
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=m
CONFIG_AHCI_DWC=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
# CONFIG_ATA_BMDMA is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
CONFIG_PATA_PCMCIA=m
CONFIG_PATA_QDI=m
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_WINBOND_VLB is not set

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_LEGACY=m
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=m
# CONFIG_TCM_FILEIO is not set
CONFIG_TCM_PSCSI=y
# CONFIG_TCM_USER2 is not set
# CONFIG_LOOPBACK_TARGET is not set
# CONFIG_ISCSI_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_PCH_GBE is not set
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_PCMCIA_SMC91C92 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_PCMCIA_RAYCS is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_XEN_NETDEV_BACKEND is not set
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5588=m
CONFIG_KEYBOARD_ADP5589=m
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=m
CONFIG_KEYBOARD_QT1070=m
# CONFIG_KEYBOARD_QT2160 is not set
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=m
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=m
# CONFIG_KEYBOARD_TCA8418 is not set
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=m
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_OPENCORES=m
CONFIG_KEYBOARD_PINEPHONE=m
# CONFIG_KEYBOARD_SAMSUNG is not set
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_SUNKBD=y
CONFIG_KEYBOARD_IQS62X=m
CONFIG_KEYBOARD_TM2_TOUCHKEY=m
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_MTK_PMIC=m
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=m
CONFIG_JOYSTICK_A3D=m
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=m
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=m
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_232=m
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=m
# CONFIG_JOYSTICK_STINGER is not set
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=m
CONFIG_JOYSTICK_GAMECON=m
CONFIG_JOYSTICK_TURBOGRAFX=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=m
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=m
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
CONFIG_TOUCHSCREEN_ATMEL_MXT_T37=y
CONFIG_TOUCHSCREEN_AUO_PIXCIR=m
CONFIG_TOUCHSCREEN_BU21013=m
CONFIG_TOUCHSCREEN_BU21029=m
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=m
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP5=m
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
# CONFIG_TOUCHSCREEN_EETI is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=m
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=m
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=m
# CONFIG_TOUCHSCREEN_ILI210X is not set
CONFIG_TOUCHSCREEN_ILITEK=m
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
# CONFIG_TOUCHSCREEN_ELO is not set
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
# CONFIG_TOUCHSCREEN_MAX11801 is not set
CONFIG_TOUCHSCREEN_MCS5000=m
CONFIG_TOUCHSCREEN_MMS114=m
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=m
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_IMAGIS=m
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
CONFIG_TOUCHSCREEN_HTCPEN=m
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=m
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2007=m
CONFIG_TOUCHSCREEN_RM_TS=m
CONFIG_TOUCHSCREEN_SILEAD=m
CONFIG_TOUCHSCREEN_SIS_I2C=m
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=m
CONFIG_TOUCHSCREEN_ZET6223=m
CONFIG_TOUCHSCREEN_ZFORCE=m
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
CONFIG_TOUCHSCREEN_ZINITIX=m
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=m
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
# CONFIG_RMI4_F11 is not set
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
# CONFIG_SERIAL_8250_SHARE_IRQ is not set
CONFIG_SERIAL_8250_DETECT_IRQ=y
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_ALTERA_JTAGUART=m
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
CONFIG_SERIAL_FSL_LINFLEXUART=m
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_SPRD=m
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
# CONFIG_HVC_XEN_FRONTEND is not set
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
# CONFIG_IPMI_IPMB is not set
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_SSIF_IPMI_BMC=m
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
CONFIG_HW_RANDOM_GEODE=m
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_XIPHERA=m
CONFIG_DTLK=y
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
# CONFIG_SCR24X is not set
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

CONFIG_MWAVE=y
CONFIG_SCx200_GPIO=y
CONFIG_PC8736x_GPIO=m
CONFIG_NSC_GPIO=y
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
# CONFIG_TCG_INFINEON is not set
CONFIG_TCG_XEN=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=m
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=m
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_OCORES=m
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_PCA_ISA=m
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=m
CONFIG_SVC_I3C_MASTER=m
CONFIG_MIPI_I3C_HCI=m
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_PCH is not set
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_AMD_FCH=y
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
CONFIG_GPIO_IT87=m
# CONFIG_GPIO_SCH311X is not set
CONFIG_GPIO_WINBOND=y
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=m
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_KEMPLD is not set
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_TQMX86=m
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=m
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_PDA_POWER=y
CONFIG_IP5XXX_POWER=m
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_CW2015=m
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SAMSUNG_SDI=y
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=m
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=m
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_SMPRO=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AS370=y
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=m
CONFIG_SENSORS_DRIVETEMP=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
# CONFIG_I8K is not set
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
# CONFIG_SENSORS_FSCHMD is not set
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX127=m
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX31760=m
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_MLXREG_FAN=m
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=m
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_BPA_RS600=m
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IR38064_REGULATOR=y
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LM25066_REGULATOR=y
CONFIG_SENSORS_LT7182S=m
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
# CONFIG_SENSORS_MP2975 is not set
CONFIG_SENSORS_MP5023=m
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
CONFIG_SENSORS_UCD9000=m
# CONFIG_SENSORS_UCD9200 is not set
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_SY7636A=m
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=m
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA238=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VIA_CPUTEMP=m
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=m
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
# CONFIG_SENSORS_W83627EHF is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=y
CONFIG_X86_THERMAL_VECTOR=y
# CONFIG_X86_PKG_TEMP_THERMAL is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_MENZ069_WATCHDOG is not set
# CONFIG_WDAT_WDT is not set
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
CONFIG_MLX_WDT=m
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_DW_WATCHDOG=m
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_RETU_WATCHDOG is not set
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=m
# CONFIG_ADVANTECH_EC_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
CONFIG_EBC_C384_WDT=m
CONFIG_EXAR_WDT=y
# CONFIG_F71808E_WDT is not set
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=y
CONFIG_IBMASR=y
# CONFIG_WAFER_WDT is not set
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
# CONFIG_IT8712F_WDT is not set
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
CONFIG_KEMPLD_WDT=m
CONFIG_SC1200_WDT=y
# CONFIG_SCx200_WDT is not set
CONFIG_PC87413_WDT=m
# CONFIG_NV_TCO is not set
# CONFIG_60XX_WDT is not set
CONFIG_SBC8360_WDT=y
# CONFIG_SBC7240_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
CONFIG_SMSC37B787_WDT=m
CONFIG_TQMX86_WDT=y
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83877F_WDT is not set
# CONFIG_W83977F_WDT is not set
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=y
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
# CONFIG_XEN_WDT is not set

#
# ISA-based Watchdog Cards
#
CONFIG_PCWATCHDOG=m
# CONFIG_MIXCOMWD is not set
# CONFIG_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=m
# CONFIG_MFD_CS5535 is not set
CONFIG_MFD_SMPRO=m
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
# CONFIG_MFD_MADERA is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
# CONFIG_MFD_MP2629 is not set
CONFIG_HTC_PASIC3=m
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_INTEL_PMC_BXT is not set
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=m
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MT6360=m
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=m
CONFIG_MFD_RETU=m
# CONFIG_MFD_PCF50633 is not set
CONFIG_MFD_SY7636A=m
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=m
CONFIG_MFD_RT5033=m
CONFIG_MFD_RT5120=m
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=m
# CONFIG_MFD_SYSCON is not set
CONFIG_MFD_TI_AM335X_TSCADC=m
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_TI_LMU=m
CONFIG_TPS6105X=m
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TI_LP873X=m
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=m
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8994=m
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BD9571MWV=m
CONFIG_REGULATOR_DA9210=m
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=m
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LTC3589=m
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=m
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MP8859=m
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6323=m
CONFIG_REGULATOR_MT6331=m
CONFIG_REGULATOR_MT6332=m
CONFIG_REGULATOR_MT6357=m
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=m
# CONFIG_REGULATOR_MT6360 is not set
CONFIG_REGULATOR_MT6397=m
CONFIG_REGULATOR_PCA9450=m
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT4831=m
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_RT5120=m
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=m
CONFIG_REGULATOR_RTQ6752=m
# CONFIG_REGULATOR_SKY81452 is not set
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS6105X=m
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65132=m
CONFIG_REGULATOR_TPS65912=m
CONFIG_REGULATOR_WM8994=m
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=y
CONFIG_LIRC=y
CONFIG_RC_MAP=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_SERIAL is not set
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_RC_LOOPBACK=y
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_RC=y
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
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
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_RADIO_ADAPTERS is not set
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
CONFIG_VIDEO_CCS_PLL=m
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_HI846=m
# CONFIG_VIDEO_HI847 is not set
CONFIG_VIDEO_IMX208=m
CONFIG_VIDEO_IMX214=m
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=m
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_MAX9271_LIB=m
CONFIG_VIDEO_MT9M001=m
CONFIG_VIDEO_MT9M032=m
CONFIG_VIDEO_MT9M111=m
# CONFIG_VIDEO_MT9P031 is not set
CONFIG_VIDEO_MT9T001=m
CONFIG_VIDEO_MT9T112=m
CONFIG_VIDEO_MT9V011=m
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
CONFIG_VIDEO_NOON010PC30=m
# CONFIG_VIDEO_OG01A1B is not set
CONFIG_VIDEO_OV02A10=m
# CONFIG_VIDEO_OV08D10 is not set
# CONFIG_VIDEO_OV08X40 is not set
CONFIG_VIDEO_OV13858=m
CONFIG_VIDEO_OV13B10=m
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
CONFIG_VIDEO_OV2680=m
CONFIG_VIDEO_OV2685=m
# CONFIG_VIDEO_OV2740 is not set
CONFIG_VIDEO_OV4689=m
CONFIG_VIDEO_OV5647=m
CONFIG_VIDEO_OV5648=m
CONFIG_VIDEO_OV5670=m
CONFIG_VIDEO_OV5675=m
CONFIG_VIDEO_OV5693=m
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV7640=m
CONFIG_VIDEO_OV7670=m
CONFIG_VIDEO_OV772X=m
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
CONFIG_VIDEO_OV8865=m
CONFIG_VIDEO_OV9640=m
CONFIG_VIDEO_OV9650=m
# CONFIG_VIDEO_OV9734 is not set
# CONFIG_VIDEO_RDACM20 is not set
CONFIG_VIDEO_RDACM21=m
CONFIG_VIDEO_RJ54N1=m
CONFIG_VIDEO_S5K5BAF=m
CONFIG_VIDEO_S5K6A3=m
CONFIG_VIDEO_S5K6AA=m
CONFIG_VIDEO_SR030PC30=m
# CONFIG_VIDEO_VS6624 is not set
CONFIG_VIDEO_CCS=m
CONFIG_VIDEO_ET8EK8=m
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
CONFIG_VIDEO_AK7375=m
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9768=m
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_SONY_BTF_MPX=m
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=m
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_UDA1342=m
# CONFIG_VIDEO_VP27SMPX is not set
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=m
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
CONFIG_VIDEO_ADV7842=m
# CONFIG_VIDEO_ADV7842_CEC is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_ML86V7667=m
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
CONFIG_VIDEO_TC358743=m
# CONFIG_VIDEO_TC358743_CEC is not set
CONFIG_VIDEO_TC358746=m
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=m
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_ADV7170=m
# CONFIG_VIDEO_ADV7175 is not set
CONFIG_VIDEO_ADV7343=m
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=m
# CONFIG_VIDEO_ADV7511_CEC is not set
CONFIG_VIDEO_AK881X=m
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=m
CONFIG_VIDEO_THS8200=m
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
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
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=m
CONFIG_VIDEO_THS7303=m
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_E4000 is not set
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
# CONFIG_MEDIA_TUNER_FC0013 is not set
# CONFIG_MEDIA_TUNER_FC2580 is not set
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2131=m
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QT1010=m
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_SI2157=m
# CONFIG_MEDIA_TUNER_SIMPLE is not set
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
# CONFIG_MEDIA_TUNER_TDA8290 is not set
CONFIG_MEDIA_TUNER_TDA9887=m
# CONFIG_MEDIA_TUNER_TEA5761 is not set
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=m
# CONFIG_MEDIA_TUNER_XC4000 is not set
# CONFIG_MEDIA_TUNER_XC5000 is not set
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_M88DS3103=m
# CONFIG_DVB_MXL5XX is not set
CONFIG_DVB_STB0899=m
# CONFIG_DVB_STB6100 is not set
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
# CONFIG_DVB_STV6111 is not set

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
CONFIG_DVB_MN88472=m
# CONFIG_DVB_MN88473 is not set
CONFIG_DVB_SI2165=m
CONFIG_DVB_TDA18271C2DD=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
# CONFIG_DVB_CX24123 is not set
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_MT312=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_STB6000=m
# CONFIG_DVB_STV0288 is not set
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_STV6110=m
# CONFIG_DVB_TDA10071 is not set
CONFIG_DVB_TDA10086=m
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA8261=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_TUA6100=m
# CONFIG_DVB_TUNER_CX24113 is not set
CONFIG_DVB_TUNER_ITD1000=m
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_ZL10036=m
# CONFIG_DVB_ZL10039 is not set

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=m
CONFIG_DVB_CX22700=m
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_DIB3000MB=m
# CONFIG_DVB_DIB3000MC is not set
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_DRXD=m
CONFIG_DVB_EC100=m
CONFIG_DVB_L64781=m
CONFIG_DVB_MT352=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_S5H1432=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_STV0367=m
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_TDA1004X=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_ZL10353=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_VES1820=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
# CONFIG_DVB_BCM3510 is not set
CONFIG_DVB_LG2160=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
# CONFIG_DVB_LGDT330X is not set
CONFIG_DVB_MXL692=m
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51132=m
# CONFIG_DVB_OR51211 is not set
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m
CONFIG_DVB_S921=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=m
CONFIG_DVB_TC90522=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
CONFIG_DVB_A8293=m
# CONFIG_DVB_AF9033 is not set
CONFIG_DVB_ASCOT2E=m
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=m
# CONFIG_DVB_HORUS3A is not set
# CONFIG_DVB_ISL6405 is not set
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
# CONFIG_DVB_IX2505V is not set
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
# CONFIG_DVB_LNBH25 is not set
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_M88RS2000=m
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=m

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_DRM=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_FBDEV_EMULATION is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_SHMEM_HELPER=m
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=m
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=m
# CONFIG_DRM_ETNAVIV_THERMAL is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_DRM_XEN_FRONTEND is not set
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_DRM_SSD130X=m
# CONFIG_DRM_SSD130X_I2C is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
# CONFIG_FB_BIG_ENDIAN is not set
CONFIG_FB_LITTLE_ENDIAN=y
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
CONFIG_FB_OPENCORES=m
CONFIG_FB_S1D13XXX=m
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
CONFIG_FB_SM501=m
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_VIRTUAL=m
CONFIG_XEN_FBDEV_FRONTEND=m
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=m
CONFIG_BACKLIGHT_SAHARA=m
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_LM3639=m
CONFIG_BACKLIGHT_SKY81452=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=m
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_MDA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=m
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=m
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=m
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=m
# CONFIG_HID_LED is not set
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=m
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=m
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PXRC=m
CONFIG_HID_RAZER=m
CONFIG_HID_PRIMAX=m
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=m
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
CONFIG_GREENASIA_FF=y
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
CONFIG_HID_UDRAW_PS3=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support
# end of HID support

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
# CONFIG_TAHVO_USB is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=m
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_APU=m
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_MT6323=m
CONFIG_LEDS_NET48XX=y
# CONFIG_LEDS_WRAP is not set
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=m
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_MC13783 is not set
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=m
# CONFIG_LEDS_LM36274 is not set
# CONFIG_LEDS_TPS6105X is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_DISK=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_AMD76X is not set
# CONFIG_EDAC_E7XXX is not set
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82875P is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I82860 is not set
# CONFIG_EDAC_R82600 is not set
# CONFIG_EDAC_I5100 is not set
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# CONFIG_DMABUF_HEAPS_CMA is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=m
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
# CONFIG_VFIO_MDEV is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST=y
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
CONFIG_VHOST_SCSI=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=y
CONFIG_XEN_BACKEND=y
CONFIG_XENFS=y
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
CONFIG_XEN_GNTDEV=m
# CONFIG_XEN_GNTDEV_DMABUF is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
CONFIG_XEN_GRANT_DMA_ALLOC=y
CONFIG_XEN_PCI_STUB=y
CONFIG_XEN_PCIDEV_BACKEND=m
# CONFIG_XEN_PVCALLS_FRONTEND is not set
# CONFIG_XEN_PVCALLS_BACKEND is not set
# CONFIG_XEN_SCSI_BACKEND is not set
CONFIG_XEN_PRIVCMD=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
# CONFIG_XEN_VIRTIO is not set
# end of Xen driver support

CONFIG_GREYBUS=y
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=m
CONFIG_COMEDI_CB_DAS16_CS=m
# CONFIG_COMEDI_DAS08_CS is not set
# CONFIG_COMEDI_NI_DAQ_700_CS is not set
CONFIG_COMEDI_NI_DAQ_DIO24_CS=m
# CONFIG_COMEDI_NI_LABPC_CS is not set
CONFIG_COMEDI_NI_MIO_CS=m
CONFIG_COMEDI_QUATECH_DAQP_CS=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set
# CONFIG_RTS5208 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_HID=m
CONFIG_GREYBUS_LIGHT=y
# CONFIG_GREYBUS_LOG is not set
CONFIG_GREYBUS_LOOPBACK=m
CONFIG_GREYBUS_POWER=y
# CONFIG_GREYBUS_RAW is not set
CONFIG_GREYBUS_VIBRATOR=y
# CONFIG_GREYBUS_BRIDGED_PHY is not set
CONFIG_FIELDBUS_DEV=y
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
CONFIG_MLXREG_IO=y
# CONFIG_MLXREG_LC is not set
CONFIG_NVSW_SN2201=m
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACPI_WMI is not set
# CONFIG_ACERHDF is not set
# CONFIG_ACER_WIRELESS is not set
# CONFIG_AMD_PMF is not set
# CONFIG_ADV_SWBUTTON is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_X86_PLATFORM_DRIVERS_HP=y
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_SENSORS_HDAPS=y
# CONFIG_THINKPAD_ACPI is not set
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=m
# CONFIG_INTEL_SAR_INT1092 is not set
# CONFIG_INTEL_SKL_INT3472 is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_PUNIT_IPC=y
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_VSEC is not set
CONFIG_PCENGINES_APU2=y
CONFIG_BARCO_P50_GPIO=y
CONFIG_SAMSUNG_LAPTOP=y
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_SYSTEM76_ACPI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
CONFIG_MLX_PLATFORM=m
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
CONFIG_WINMATE_FM07_KEYS=m
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_MAX9485=m
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=m
CONFIG_COMMON_CLK_CDCE706=m
CONFIG_COMMON_CLK_CS2000_CP=m
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
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_VIRTIO=y
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
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_RT8973A=m
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=m
# CONFIG_BOARD_TPCI200 is not set
# CONFIG_SERIAL_IPOCTAL is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_INTEL_LGM_EMMC=m
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_IDLE_INJECT is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
CONFIG_DAX=y
# CONFIG_NVMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=m
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT3_FS=m
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_CHECK=y
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=m
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
CONFIG_BTRFS_FS_REF_VERIFY=y
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_F2FS_IOSTAT is not set
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_NFS_EXPORT=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
CONFIG_NTFS3_FS=m
# CONFIG_NTFS3_LZX_XPRESS is not set
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
CONFIG_AFFS_FS=y
CONFIG_ECRYPT_FS=m
# CONFIG_ECRYPT_FS_MESSAGING is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=m
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=m
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_CRAMFS is not set
CONFIG_SQUASHFS=y
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
CONFIG_SQUASHFS_DECOMP_MULTI=y
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT=y
CONFIG_SQUASHFS_MOUNT_DECOMP_THREADS=y
# CONFIG_SQUASHFS_XATTR is not set
CONFIG_SQUASHFS_ZLIB=y
CONFIG_SQUASHFS_LZ4=y
# CONFIG_SQUASHFS_LZO is not set
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=m
CONFIG_HPFS_FS=m
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
CONFIG_SYSV_FS=m
CONFIG_UFS_FS=y
CONFIG_UFS_FS_WRITE=y
# CONFIG_UFS_DEBUG is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=m
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=m
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=m
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=m
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=m
# CONFIG_TRUSTED_KEYS_TPM is not set
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
CONFIG_IMA_DEFAULT_HASH_SHA256=y
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
# CONFIG_IMA_DEFAULT_HASH_WP512 is not set
CONFIG_IMA_DEFAULT_HASH="sha256"
CONFIG_IMA_WRITE_POLICY=y
CONFIG_IMA_READ_POLICY=y
# CONFIG_IMA_APPRAISE is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_DISABLE_HTABLE=y
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
CONFIG_GCC_PLUGIN_STACKLEAK=y
CONFIG_STACKLEAK_TRACK_MIN_SIZE=100
# CONFIG_STACKLEAK_METRICS is not set
CONFIG_STACKLEAK_RUNTIME_DISABLE=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
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
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=m
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=m
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
# CONFIG_CRYPTO_TWOFISH is not set
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=m
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=m
CONFIG_CRYPTO_STREEBOG=m
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=m
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_SERPENT_SSE2_586=y
# CONFIG_CRYPTO_TWOFISH_586 is not set
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
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
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=m
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=m
CONFIG_FONTS=y
# CONFIG_FONT_8x8 is not set
# CONFIG_FONT_8x16 is not set
# CONFIG_FONT_6x11 is not set
CONFIG_FONT_7x14=y
CONFIG_FONT_PEARL_8x8=y
CONFIG_FONT_ACORN_8x8=y
CONFIG_FONT_MINI_4x6=y
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
CONFIG_FONT_SUN12x22=y
# CONFIG_FONT_TER16x32 is not set
CONFIG_FONT_6x8=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
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
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
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
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
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
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
# CONFIG_DEBUG_KMAP_LOCAL is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
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
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

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
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
# CONFIG_LATENCYTOP is not set
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
# CONFIG_FUNCTION_GRAPH_TRACER is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_FPROBE=y
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_STACK_TRACER=y
CONFIG_IRQSOFF_TRACER=y
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=m
CONFIG_TRACE_EVAL_MAP_FILE=y
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
CONFIG_SAMPLE_TRACE_EVENTS=m
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
CONFIG_SAMPLE_TRACE_ARRAY=m
CONFIG_SAMPLE_KOBJECT=m
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_FPROBE is not set
CONFIG_SAMPLE_KFIFO=m
CONFIG_SAMPLE_RPMSG_CLIENT=m
# CONFIG_SAMPLE_CONFIGFS is not set
CONFIG_SAMPLE_HIDRAW=y
# CONFIG_SAMPLE_LANDLOCK is not set
CONFIG_SAMPLE_PIDFD=y
# CONFIG_SAMPLE_SECCOMP is not set
# CONFIG_SAMPLE_TIMER is not set
# CONFIG_SAMPLE_UHID is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_SAMPLE_ANDROID_BINDERFS=y
# CONFIG_SAMPLE_VFS is not set
CONFIG_SAMPLE_WATCHDOG=y
# CONFIG_SAMPLE_WATCH_QUEUE is not set
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
CONFIG_IO_DELAY_0XED=y
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--eo3HaOpBKeHZ1Qbt
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot-300s.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='reconfirm'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='peterz-queue/sched/wip'
	export commit='1a250f36f8e33d2e3669bc46d27bf8620c9688d5'
	export kconfig='i386-randconfig-a002-20230130'
	export nr_vm=300
	export submit_id='63d9f807afee681e82ad82f1'
	export job_file='/lkp/jobs/scheduled/vm-meta-70/boot-300-debian-11.1-i386-20220923.cgz-1a250f36f8e33d2e3669bc46d27bf8620c9688d5-20230201-7810-z0nmvv-0.yaml'
	export id='7c15bb0725282392f1d36ea76919f2c894abec6a'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-11'
	export enqueue_time='2023-02-01 13:26:31 +0800'
	export _id='63d9f807afee681e82ad82f1'
	export _rt='/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5/3'
	export scheduler_version='/lkp/lkp/.src-20230201-120039'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/300/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5/3
BOOT_IMAGE=/pkg/linux/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5/vmlinuz-6.2.0-rc6-00096-g1a250f36f8e3
branch=peterz-queue/sched/wip
job=/lkp/jobs/scheduled/vm-meta-70/boot-300-debian-11.1-i386-20220923.cgz-1a250f36f8e33d2e3669bc46d27bf8620c9688d5-20230201-7810-z0nmvv-0.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-a002-20230130
commit=1a250f36f8e33d2e3669bc46d27bf8620c9688d5
vmalloc=256M initramfs_async=0 page_owner=on
initcall_debug
mem=4G
nmi_watchdog=0
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
	export modules_initrd='/pkg/linux/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export meta_host='vm-meta-70'
	export kernel='/pkg/linux/i386-randconfig-a002-20230130/gcc-11/1a250f36f8e33d2e3669bc46d27bf8620c9688d5/vmlinuz-6.2.0-rc6-00096-g1a250f36f8e3'
	export dequeue_time='2023-02-01 13:38:33 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-70/boot-300-debian-11.1-i386-20220923.cgz-1a250f36f8e33d2e3669bc46d27bf8620c9688d5-20230201-7810-z0nmvv-0.cgz'

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
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 300
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

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--eo3HaOpBKeHZ1Qbt
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4u0ag09dADKYSqt8kKSEWvAZo7Ydv/tz/AJuxJZ5vBF3
0b/zsUFOhv9TudZULcPnnyAaraV0UdmWBL/0Qq2x8RyxDtkd8eDlFp664TyRWk15adeeFsGoNV0C
FcUhdzRTXPevHXEBmPVDUqbYj9sEM7TmoL66JV5yRAd4a5Jfsewqa7m43ucA2w7zGuJOo7jXsepr
i4577LutzuiKbIcXrEnRt3bY2znqv0g2e69S1ZA0CQvpjHkHJXQR57bKnHj6T1Y2MX/Igr6X5XAi
BvlVUYcByIqq7UAavLE9WCXOIJ33XyeOcvOEcJ3NKb/d5P56vIxXZH8MiEY7ZntUIU0z+2stLY9v
boHwD4MjpyqPKz7AIw55HnhNLdtO3DwxZ7vYJSp402uVGTsSGTw8/nxMn8lvkMkW0naWMloqB8Y0
XlbyFnFOOgeTTsMo3j5/BXQy62y25hGLKtxaKQM6+siNXSQyJWHXFBxwhnbzETtfGWNbXoY4eIs3
REZAblsCtC2V6c9hjvlyglhBCDmhvAIyhplTnNiRU7ib/pk/qHaZUQN0cAsPK7P/PyjOlRDz0any
bgcCo43uW1790R1ucULGG/Q2PHUyZ06UHDrLOr3HrRyTDFB9CQ6CYjhXnTAr4q3TGzZv8yhe1zRq
I/vdQxCOwxGzAkvjYhFa4PjHIfLqTyIjKayAwwHgrhXdIm4kW4LdiYVXLXtB8q3rv/XUbL+Zz7xy
hJx4t9t0St/+XWGtqdXmT1QR0fiUGojY50t5LUJtbRb49Fribl53HevTeQK36bPI8yp/qLM8sc53
IMlj1baz/jmqZVmIBX7KkLdTrkpmuW35atFirP94ol/nZEuh0nXwIF6cdZ1aEwaYChcfc7rpSlDz
OFSPpP+yHCPU0MqHjMKHQ9S9ojZ6EJ5WLoUAx58/YXAzexLcBP5rpUTm4nU8d4SbL1sqJ95h2KKA
UdBH52YjvjBDkv30aIqbiBoj+r4IaMSiQkuya+pVWTCG2f03wnKXKTqbADgxxJItHRvGpqY31DNx
LPa0nojP975bKvHtisi0pEvABDEwUJ/xO6MsYD+S07ccspCDAJ7YXsAFsuWbm3NDEPeWgqec/KAU
bpyWVMNLZ0PJ+GWK3H3k/Qt5h1s63u2mz2D4o3C7Vi3K+oZEB20ono8RkPMzx0At0Rnziyjcfknp
pn7BbF77Wawjpopc6+8+upvz2EpKuIW1FV+aBmPb4kVx4/BFfXmJQ26JGX30y13IkNKWBeysF7vJ
jV/ocmndC7kiS31h2gtw7StSdeKu50LhRRQ5g7ScGxYSPUxWAen0yQzDJtP8YF81szwIkJn2Q1D7
nF0vAH8wYkzoh1s3G6+TotZtOQ81GmDb34nQGKd5xzUADzlodwrKnkRoK1fUWcwl1WD/zKulWEsW
cZr6oG1jTZIG68vj2iVIcKOc+bXwM8NQrCironxt1DTh2dYd9Tdne6bMH/LuWorHzYg3SwhOdFIu
90RZS7QoSSQ0kXwTg1qJ0mExjLT0o63f+s0NRLpTE8nctnzmjl1150xxFuK5Nw93zmLNthucPKXL
b/UXlqeggnKB1WA0LnyMML51dCiV0fv4vHTrXc8y5WJ+Yt6GuMUOO5V/gq8Qf109fR8Yg2OMmaam
ESNkfkqE2e6JrBDpp5M8jc6QB9NqIfiBUf3Ql8gy30TPTjtKl/QB3SCMdGntLXnJ2OwuKsO+e1eF
vcQJCcKdwFmF5/z1sE8FVk41jWaewmD2VEXRke8JjmzftRwZ57Le0XN6hWrIWQ5CABpvBeDl5gD5
i8Debeoq3JExTfnZzKuB1YQHAvq8ReZR4zb+qkRi32O1O8UKSip85V/uc90zjK7pe2A/rIJo2nca
74ZhJz7D7+lfXhCRA/0fc7ozxWG8x+s7p1baxMk+E4syiqg9zc7C8X7zZEP6fxVBUnC/aOs12aRi
YdAeVfJeif+CYxCy3kAx1/QnItIyG43t0f0Oiayrro5MQ6op6/AJ/DeW+SPSWZdl5DJC1v14rIKY
HZQw9NX20AJk0W/eVREFwEYuKKXtcNHDp5SMMtcJcdRM+rFPUszhIeUKHGSXoMiHoUQ7s6d5uhuE
xLlbbKZXf8bZzt+4Ro1Xz47TjrqfgOxfGyU9DIcPbS5qUYrza9d/+mtOzJuMTMpQP1Mqxp92IJ5W
68ZNkiuZnYcWNSrBnEhuGcL3lnFQLKHRKJKwrNNV89GMs0yT3ANednPHS6MmEsyMITSRXxymUjky
88w2vJifyDiaq2sfHDfssoeHA26nH19LMcWzmHm+SGzeEwLpATrBwobs1daFVvPEc81GO8/wpBly
2UfaAgDIhhQKLOQAHUtxtqo/UmQEDB+M82WwZ7u+0MN322J5Czui5ff2bNA5ay3gXQdquawSzf6+
hVlyKlwePbcbim66K7fcJBKxt6gSgVH9yZkFa7WNQ3Fi4NTvDmEjWv4U2Z19YpJE3aYRy2JrSL33
Kee64lbsHu77qUgSSwVJvtiGykSv53tbBq3qFdVsH8xsa9cjcQBu8/Hn+ukbx4aWtbTp3MmU0QvV
X1xrwSpctsB3ulfAKsSxGX2GuKShfZXFF2Iq6TAocuKfyaMrYXikhM7T6YcPihuu/QgECHShlapt
CWcxwz0O3oB96BS5DTuToQdtYGjamW44PnVqXsxA5GhasKa7Y9Vras97TP0LdDMRYo6MLZ2eoaTE
IU4LoqcBTfs2zVxnptyDXz0oA5P8fY25AET65E+AMsMPtInRwPVjTs/dQP+RVLh659+pxehY5tbK
5ca3mqfTXTAwxH5SEEiOnTwBee5cPFzm1W/tWSP98Fkb5zv3XWxpkQo43Az8/uM7gJi03pfGAjdm
IFC5IIlg1sG1GdLJBV+YMAx6guVDJavCjZPqW8WmW9En71YXLt10SFZQwyi6QEYC5+PVXF+QBTud
z52gl71ha0siQO8W308122NX21hZZStTZOmr3VBjjtCZpiO/CbhJGMUITy2IX0wVDiFSeKg8RxAf
cZDUk2ON3uHHWnR7E5n/xKR01n0Ec5yZ7gZIjsXu0PyuiCN0Ner3l2Xm+xuvMrMBb6N0KFY/DxHM
367z6//t2lJw8YR0lT1WyYkFLb5ycBBpfFh0RhRDrTl+yHN8cF6K0gbtyfb+GmTUkp4GYzlZRsew
DexakM84Kb+jbjCahfwoFv9HmwzQ55wnuUF8jdquRW4w9Pw+q8ydAJlJXLcVQN+fj40UbW6qnLpM
9hqtih172elzanIXzTxnux0XEx7Nzmags7icDsXN94bsPwaVm+XT3MCnMLAxffEwgZqYTZ9D0hZN
6iqNRuCUdKHInWwERk8dlQrmrcGIDbEeoh0EZiXjxWaygEMsueW382SjXqraqJ8GOnhyRoZ4CRVd
WRHWc21fLksJ0SR9QyYgdiB8jNu+aMcoZmuA5lvsp1tzkicp7qsjGgVMTMwA2daUkuFv98m9oZKY
4fnh5Wbb11KDlfzRuwR3TuRUaQ3SEbb6wICp4WT9kxPAo6fwBNH0I0t57cGPDW2IUP1OMoQv1PAM
q60F4kQEuuZ7fA3QznQMFCUjSYfrxYhop/Z6ZxniWDYGjjHgWB/+AqtQLMRzNtq4KZOIEF1dRwt4
W3SwiAuQlYE6lJ/Zf1SU6F729Rk/8hDsgHGZ864WMr22Xi41WgJWPwAb3f3WGp0nHc5t45YiINfk
8C4XkIZAV1ExUODOJkvHNACb8r0JzXR1iVmy7Y2Tx5MxRUwiDq6pJTSTD6hbnzDT4REMo19k9aSh
9FED2NRW0TccbThvbNYn+hn3E3UcXfzKSh6EPOI2TQrw8je70TnRMMJF9qRxNKY1BeSgYiUL+8TI
Jl0Hp0qGTcS91S32zVSaBcvr5JVRZjUi2lfvtfoXBMndbnzJ5K1/j7LFJPPQ4FfAX94VslLnv9cM
Wm58s4YJd0fq22VgdhiT3Y1Tk/xcbHLvA3BbLL6LrIZAD3pbeESwg9WCmDvqSoXlrxC4YBWVZI1W
rj6IpDFmW4AGEqG46NbgrCTVMvlZE2H3cnp82V110UVpW4cO0lIDYeivrtOBEJr23dki4l7TPxFY
F0yGE7VowoBw3D/X5BilEuCA+jus5newsS2AVfxOUqms+v8VHhoM8dAy8KHjlNrz5b0+Jn2Wf1xV
DoQq/cJIclG2im08wikml4uMkyHMcUe4pzsakFCPtKJsCGdGecZsFTN6NBWvLXQ+W7Yefagxd58k
j+i3MJUuxM5VXyN/6MdS+Qgqj4YpdjwScXFiQtnSfc8vuniuul2iqA4MSh9jfXS2wcWaNpTIUQdq
3P8xOW93btr5XVU7uZh/6MoUSjGJHy7S0ccBEm89qjeQ7PYGypI0A9ixlOZ7Xz9ZNq0yh2XJdtay
Sm+SuNTifNWjvMUirMskvmIA8By4LIUgi8mzQ3Pzx3T3zB8+G1LQaUTUR1cmwQMg67YmgV1TGp5U
OxiRGpOC/f0xDP4GbyKAncK29kI7ZWFYwjlfAZiFjijSa8vXmInR9bk4F1YVEY66zSuN0J1b8+uq
DKhvsLLCcfgNIGkdxZnu8fr5UFp8ouGgvXw9ocaEMOTLgZdq+Kq5Vprp8rUbG67MxF2AnwN8o2eR
m24AXdPM9LSmw+VDOVz7mkDPa4UeMclp2vgHZgvpwGoggFlP71VMzkLDVaDs505vcwravFITa03T
tQ1nEDTCcEqEODGYtxd64PytN3OncHnbxpHmgDY3Fvgq+TleVIgBXBl6qsKIsF+NPOWqnEz4Q+Pk
at5KMszid/QKcfYGi+AVIfoKSr+iX5gcYnP09zXmkwUOo4BHYv/HUDX2n5G8THZzqJwxj1ct5FFo
y4+Q7Ch772aL9XAlmO2OUr031H3i4WxE/BLxjdCDSMBGhvxMiAU+NWF2hhObiNecerU77WAA1ciI
JGpyolJriNR1o5GXlb8wyuy3fsSXAvWn7gnJPBSGoBCFGP4YxieC7u/RIz+R5+Y2bhuj4NgGwIVi
OahaLu465Dzh7rurecpI0BQT4x/A9yfaosRYcmKtYZ4IlX8ExL7h/NUzY6sb4axuWBy1BUijopnZ
uTkhy+dZPxsw8y+Lv8Nm2316D0DAB4nRvqCYxQL0gcZ3sPOCRTgSPic+eXsBxBBTD32PcXibV6/e
R7aVKeSGyab2aWMFSUrGPPyOLiGKIAr3rc0wodMjTnr9Nud2uScgvUGE5r7Eq3vHZZQVzce3glp+
YC0rjoNvP7pCr7rnEHxrXltYEVD+TciYtWdZagvW5XZjrWVdjV13cSlX4GYanxScVIjlE3kqWLF/
JmFx4TdQ2vKiqv+Ed5NIzlu8UjIp1DEx2fg071ykleOFQRiFK0u+ZTv1j5e2nQS5q7Ypv0A7br8n
TOxleXCkNbeuDYwZCZs0rwcpKOLmoiXQ0S+7IT2UIZAm9g5zXjgNvLPkbKTt/ENlBPWPYE8idWPo
/qZ+F94GgT2fiXLrgOmbD5Ge16oDFhFWr7K9yL+EmhW/rt1YCLNpexoqkZSksJDmuv4aQB2wJtsK
hsJFTtPVkW1Kykb92zMt6Ux9nIq5vQ+Ik8A7LyDtZ8oFC/scUKtvtIPHLk+lf6UGv7on4yUeKzHO
nU6StrQryjxz0qM8bkK3uVplgwq2Jv42qZvd6eLbOroceYtLg5SEv6TUqO9jcvWjJlYz7r+cVO6E
ZdgvOdMssZ8rfyoM6+I0E660qtnv4jZV+eqOzgw6aqFc+l29UMOYnmiYN1KB41e+pLAM2QkrfOou
9Nf8qMtl+jNjZY1eSIG10SXhpck4j8TK8GJOmnYQBLqjO/p2J14e5DYA4v4oaMSEpAJP1xmWP/1r
K874p5VFwnl80JPxbMg4iJWvpXGtytzynJa8mUKfctaatE4Nn7Z3yJaz1zhGGJSNjljkAa12iSqG
VF+yhjy+0KPQiz8i0+k4AcXKb6Xa1lqESVbMwOGxUHFKgLXRuSiN6MFCG2iHY62TRw9dr/B8HL8e
AbBsxER+pUNDuHmqTifFWg3PS/8XnMkfVDu7CpRNHgKctLPU4PlaFYqoVut4tsgPCmcLiJc78UXR
9awEBMcMcdK7kc4mbfflFFkyXM0JhwzRTypzZR0VJFH2yXn2oOoKIZPXRm0Cx5jEkS8db1zdcvXi
JMkdfFTc2UAWXtxqSIUraPIzbBHpMHncq39K03rTTxi3bLLYmir3IFJWgqnau5dLT7JY60HkCQT4
FCoQ+QT9bRavO8QH2E7QTQay7P7ZNf5a42Lpw6DU1ISTMJYohwBUzSdN7A1r9c2BfUqZTizsGsG6
Uhk4ru9t3VwqNXkGwt+csjFALuhDCpTGlF3r+OFL/V+4NJmlW2VdG6KGe7CIXrTv/R3ULw/SqH3W
pTtHvzGxxT+FoWsYFcdxuTEmMEmFtXWDyjSHg/YChPKgBzbXnJSt1zCwAStJcmSuJhzgL83KOaOi
WsXrtIfwiYnZ4fXPIx61R9mtjkrT65GyvknzRkab3acw6a1OEwglVMgHn1AcsIJr8daKUYfFJn0b
B/jNIGtsJPCmwJAgId1MoH+qiyhUZVtCze1zUv5wxWvlFxikj8hsNFB6vCxMs4tpzhfjPhTI9fs6
WjXckyBXdZXhzgJwCrslMpQ9x5rlhuTqgE1gDghcwlJnEEx/pjxNNHn5oOCF6ZjLQUlnfZ+x82h7
XJ0OvPYiOza8+uOWfo8dixj33wiHf13IL+1bH64xN69vTTufk5meKzqelbt5TctTK2hsLydmaLfE
TIW01l3ybmNo63i/Z3RJUw0Gdoy0KGim4vZcKin/bObrlXbAF1CoiXLtUeWiZ5ePNAmEowpVzAHk
CYywi5rCkMMs7ZxDfqFp62+MH+HNqXtNygbaUXQJaCk31ogv5AUjeMkLEqI35B4YOOmgyoIcgxkU
AcHeG7L4otA8mrc6ANs8QQTQbqI5nF+Sol56Y7/SjC+569VMd/yM48Ngmee7ZOGjGtJP9gARxFC/
RhkouH0Qno6jmu59kFxnz9mKrlL/zYZ/Xl2sSHQTojLFoMyrVgZlj4oKJ1jBmd0wDNhd+9KzPwPP
kht8882aEeAm8mrB1wq+OEINzViFBtAH6Ml2tq5HqsztPxKUayvFVHKDX+/mZvD4GumdP0cg+uDh
YmKebPqcV4Giz/6BLyKzvA9dwkeLfrO+SrF/u+iPS5dc3P9u9fNdyD81XpmN0YpRW8fspeCx/SUL
Q9VRqk75pGYhUDRfUlk7aZCzNZ3axGXpXtyokXY+9jLdcSpj44YUYq5rd4H12RQYomKjG0QLCQAE
mQhKu8HiFOgq5vYXf0aF/W3HfGz6UHLglhGmmxge0WGqoTstY2MNmiR22RYNd212aDt2KIDT3JhL
1+682IQMf7eUMBJ+X6koZRhHHF4INsS/S20trUzbBtLOTNjWwKT5UNXfyIfkwZbTti5Wztg4HdJj
6V8uTt2z9pu/7iLsZiZk49RJ5g+Tw44C6mTIlVgpf1byCrpvYydIeZ71JPH1nUp9V7d9ITMQxtyz
+oOIeU1lvHFnMchEvFZ6qmusTOanKHnjVwRU7cBvhUCLqsi2wnBGzl+lqzLvxK1/ezj5UFdxpvgf
rOL2oRQubyJgIDwPKiccs/QJSWL/M3psJmvWXsFs8csBFASkt0rLA0l0wYGo46SdoQTknRn/84fo
Zq5zwqjAYp2hDEXMuAXeNnv8hoN64EWrB0y8yi3tRV4mw+UIVeFuFPmtWkenf4evjtbl831MurhS
FCkfyusq3A9Brw83dUY5H00OMIkzWG5MXfIYXn/cCkKoP7bebixCRfbYo6aZnPDK+WlhWkml2AEA
ToaFxabDhKNFUVzbyesbaTF90rdtjshZJ/X5rI87227vniXl9zn3V0CqG48JLzG0HRbz9vMfN/aY
kqczH1ixuKM4m/BY0CjTv/HV0xKr1v3/sp79Lry5vHeglveZvkXz/BFLFed8mHBn91jv38EkUuQO
sojCy45bxUPzOWg3S4dGhuFTSG3oxxXPp2QuSMgyrWfXV9TZygzpuK7lCYCfNHHIQdU3CYl0MhV6
nE5dXstGgmeVPuI9vlIvlg7Eo+fxgau1GzffynrLIiO5fGKzmLelaSuyR2Lro2tfPH6MC0sHZoB/
NtjG/0hnY8fR0fWsBQ0e7iSPIVRzm7ypXkQH9EGFu3CHuhz67WDXSnFACH4H1myFbacabHzhNDWN
RHiluS7n7rC8jkRcXpK2AEfpW7xFHyxhESmDuTHMwtJ2ovbl4TjGwygquAQjRT8z4HjvyOAEtaah
7z3zd3Ezoog6RD20bmw/t6GJHIOFHCrQF9obFmvVY3SC1M+VTnfzAKC7TtYtvtycSp63ex8tKOru
7YJ0XFZFPidKOjdDhP3vXAUCheMrQdLU/xj/kr1BfSKf6MzZ+bE1Y3D16m2908bEbPAXLwkue1ks
YjsxuIPyx8csh1OQL5ygJeFXyRzYGXXg1wW4e24BideCNtWLAFiF9yl1LitsjzQF2Cq2SNGL485I
tXD6KS8tGOmdpP+dYqVKehGoUp/6KmeoAniMuvcyCUb9QshBsSiR8JKGDXDu5CuaJpyT/tumDePm
U9WeLf9XDUy5QRoaW+VXtf6UktTBI4HXBgacPgsh4jZ62fXux08UhIC1MGka/doJmXtSuJAwHQ8U
ArEnKzFGHmKovmc8dF/3VltX1P97RJWfvraMCYAWDjnl8TLbeNwPwltr5/j8gL2lWdI+LYtsAWgf
uBqAji+VpbW8i+bqnjy5z0lJuac3t4FyarvrLD5dte240glgHQijtdDPrLEHTPTo+7zyg8dF/GtJ
4QvVdMaXllollMHVKbwWMPasCoZQKzqRgTQPWA4ny2GwMq36PXXUpOZE2AwO2T8gXZAi1TmxLgQI
DAFd9u7AeH9Fm2AQKxLdq4LvpQDgfnYn8bFAoYJDzt9fyjdZ9J1R/GdItvsHtwZq9qfJAB6w84bH
UNHZOM/fcd1jszmfdjE6qVx9CwdocW+NMj3+R7NQgxsdQpN8aqpE2+iGAtyTC9gx/S5ngccXEbza
uNYBxOMJknL3/FImfU45/76SRd9oawVFNIL2X5JM4h74saV1Kf2K+OmcDtHebbzKKC9ekm83+vku
P6Kh4MKay6QBB3ZAqCsKiLvPwJLja7q4mp2zBCbcX7MuBJMdsYjG8RCYfD27XCU5PhO6BWkk/2P5
vQoPYla/ys+BWMOVm3TNENFX92u75iBRkuo/IznE7iGmL7n0S4908E30Yp2cf9bYgE0rTqBI9jTF
LzWcUQCaBDFgtJc0iGMYvkdbTneZIjP8y1x9xK8lAXHli6iErf+z9XLnW1RF7I4Tq6Oqm8mN+TEy
286/AHFIf5x7KP/RG5hbKbvlesnTiHYCjYyUxJ20puhjWg/41MHgR962+6uFUwkKFJXpBbfdEvNd
bVNML/3K5duzR+63FBRadvqR/qmtZHHKHO9M6Od28ILbCBqucC713bix6TB17JhXJfthbUjeZC8w
9pABCvYbVrVBeBhfpKCJAMyptHhgj/PwlmTj8Cz1IOt/KNDh187fX4aj5BCpB2QaE+pGUxlGvb1d
IUUnSbLkby59VbAlluQXV4XbSN8Jduu6khsv0inymHh5lBUOdEc4vG65WeTXd2L7UOTgEr2OXsDv
ZdBkFI3YKjMwmLAzrEVzOELDIuyDo7SD0iwjCQMXpaTv/BONyoWpyzAtrr9AMWDRc1FfP4ZAXwpI
JPG/FaftYvF+MJ2ZvCtr0z/BbV6g4iPlzrFSPBhTaS1fe5MvvRH5BuRY6GdkOQOZfhGv5uCddw/h
ILU5wIRpgLu+Hzwe+KsK/Pi0h69xZsboss5zvXc/IkR9jeL0CWkDzei+z2V2Rfo2RqUXwIYVfkk1
0hTZTHmQ19/k4iZOkuqWw3OoXnUazo8amCIIYEBGvWDSaRb+ePva5Sj4+rtjQ0ibHHrHmK+bRIDu
8VEeClFykMNgPvFtrw2iy8LUH00PrtHAzledU74OqPa0wj0Fs6rt9CGt2FQf9c+neZj74IYX65Om
OsUjDvbRKfSy1GJaU+rOgl9iu/BAcm2CdbC+JpZiR7v3ubfVeAO3LBF2uQ8OGezOjdAZt+JjfYce
PhbzmdbfzLYQCZXVYP+7cevED4134A5EAx+A68jyHSzHqNuluUhFhCTEfsHt3V1fX/Gq9KMSYmlK
fgbYMlJnNeyKGchiumHL6CWVF1RlBvL5A+D0wYRLL0B0oN4145WQrlRNTz6usxKIP7Y2Z5y1n0x+
5rkvs6BVEjUPTW5qV8sCodADdg9gWNGHMj01TAXMO6RoEVIvszDfimp1kE9qeQiNUVkEZA8ImpIa
AJ0sDuEjq8fl6nkGqYrQ32NnnLPzmX0zpWmM4kZRimgudfIi3RGtFtoBswEu6+EIK3xI8ooqRq1J
ocYAP5CqBpTUhVf+J+WvNUaJAb4dyPKfyBQ+j7tVlIAHVAvy+Auf1xiXv8PIRj0ZP/BaV4tRQvk1
mqXTfs0g4h8fSfBUhX6Q+bgnrD+a7AvV6MClbPqCbKS+QO7uhtsREXK2jlA02S5t3lR7UchbJTm/
ls4ru6PZBCHvGVnhfjFU3YyrmJyf9oThJ0e6UKJeZ13+9YDzsc0BFE+RcPJSfemyHBIUDsWe56U5
ayU5IolmmUgwPBTUWALrf4CUshLxE9Kq/3Dy1uBvDkalw1X+koLF8zeRInPk07zOIqywUP74ak4j
eWJpR+AarS5zHcM7vFSd/EaVcmbnmSACVpu/WDEu0e09gppCnzComjsuBGjYG6ObuTPhUFJ98OQj
ujgDROZtsvuzuqLMx6uDR71F0Nuo/OymVNeSs3KpmAv5kaEhd3NUukFVIwXjgL4vEgc2VSEDplD6
Uo8IiiQe/d8sg7uHfoz7cOIrotSLoSDWdU820flKwx7sLNXbQ75fTFoa02NCWgbagKZpHnGOP4P6
OOkHEfqbMd4hjFrAagoTv+o/8dV9idhiHeOjPq7M6FSPJ35MacFWgzK2gYHdxSWhLjEnI46sE1vz
Vsxrmlw12kvcWeuvadozwKumcAE/0AAnu9kcwQPf36TrWq3X0K3wv7ApnIUu5rzSdWgfVcKcPrKb
NKmL+T9dlZAfrZxcAG97AlyqsCKy2sQmthuLJH6JzJnAjXYGmJeXXUZ86S6CwqUyks6FNwk7CmC6
05Zhd5nbjSQE2J8yPbIzgeiQKihc0WfRujivCvh0Udjtv4SW7ZBvrXIV/aJ4G8OQBrS5FeHFixjA
yreraqbCUMrQ3VY8iRaGIwXOuwB7MWzWsEHXQpy3ojsUitX4DJAbsx3TPSPYaWVVK+BcSv/jf85f
Nkt7x/DXnu6Us88gvn5cpQxlJczxUq9acBLmij+s++eoq9ZncBaYwsqemwZz+2LojbWAKCD2/Y1e
txWe+Dputy30TpQhpMeWSoI9Ti9+RRXkXIDMOvIlfazGP0bc13IYF7lQq2m67c9dzDxZ9aPPqZ66
I8yx4WyYrvTodCEwDicxdAjl0+3sbD8kl7dKkHlcPfd57DHhjNtcc+GHW9ydlTH/6+igKUIqB2wt
MRpkZg5fFEg0JKg1sx1Bf5hA2wfK6GjydUTKKny9sheXzKw8TQPitTM0BeWQMmM4bIC6VivZwtk8
oYVbi5bJJx0AXxGJk7DbG1+i90hy4Y4NHZ1Zaju0JfxBhWdzgJkoTrzdQQ9Lguh8Ov7FQapygQ+O
QJo+IOykyg0825K0V31i5OeGIxVSM/zQ8XCSNhXN/R5xLuhcusrOTdOialOntynSdIriERsMzi8q
Asz7Hl29Qn7efIkGVHLZ1+1uO/0w7B8b+ZNQ/48Cm8725BkX+2Kak/kyYTmoTraeIeY4LLW5JlSM
NETNp6f2vJJ3aADyTD/U1Q2Y2oegu+CdSpb0QckpgY0O5hYg9P6qV0qZN4Hvx8HXFUpHCmJ8hpOb
QAINbw+p7au7I/uOtB09pMVHYRHB8iWpurJKXseI2eA4Gxd0O4RjNtKSK23NvlMVag9OB4c1z86t
ZuM9apIqscqQnBAmKKE/HlST1MmfameHCUtuYldgyBgEHRu608BA3w7tSJumwAJU7Pi3nNidM3jg
nuFbh1J3p2AtEi7cZlclo1vshiGsRO1H6ce0zi9L9xZsQeagenKQuqDDOV5NzqY4WWveV6EJLvvy
qMWnXVEdHVBI6gI62I/TNMVI/Kj/w6XhoI8jrlYiWDj7O0AoewBKf254/dvFc6J2USstSxxjboor
REjAbifcyO6mus4YdRc6Az4nlWRGfz/pCP1DHbSqLsflzLKUE5tIoOacO8Q1uN1HDuZ8JnKZCV9J
lc2BwL5nNnx4A7c7lLLblzvPvoZLWdN3yX2qA4UuR24eKJm+k8aiQcW55LwueTdggIf8GzpKxCma
zCi6bCGubqHQ8Hutuj0D/7EH0yKtk+ZRuAuG9oT/HS63nVhCXaelwKKorXw1Tp9OfQIz4SiuPlTl
KqyMXXU3uqfVIN7t4yoKbiauvH3ZnTLf+am6P9JHCdr6c4RGx3Z7KM1Z8m5WEGal5NxJR6dQLS6j
wWSvfxlre3sYtGXMmKCC3t+b2QpP+Ht4kho7GxnQpjaIfUfJ2uag23QgBPvzBMSehF3PTekIubsa
1yVFjps6KJ0aTi1Sj/KWm+a8KV6gYwd68p1JLzuk6zy5MEjuZR03/ek/+mJtOWizKP05WGcxMJTL
LNUEYorgzsh6DSkJmuOBAFTp2/6mL0ajn9bXYG08sjF1xuAq//7SPkSfM7Ri/yjnqoxQ52szvXH0
WBzz20kTqjQvWEqvkqvqwOSrHF9ZWWMpMjGuGIEj1iw/zx8xJXDAFIC3WEjroqCiRyH9xFFPz8Cm
hXFGqe/v+bPJ9oqWByu9niMwBuADf5LnEVhetavI3KSjaDl/Mk8WlQMaj/AS9NN04Hm9inpdEWQC
XNN8WGBckfNXFHUI5LhaQyW8fR5GXDBRXKZffPy5vp9xwtD2HTVqOLf7Bo3O0yo4WmW/vXeMcPOk
PFiPTn3izTl3n9ARHpn0rpdaPfHi20FHUC5xbZGdKrjLgbbPhdwQhKJgjG1j6CXrl3x+vfPauK5J
XGE2mr3V9Pat8UlAP/+D5/YPwWvL8ZIV9yhEAmCy1Y8x8Hh94wxqh1hcKCRJzJUMY8AjXs0jtfLk
9gyhBDPb372Bt+3HzUrTLwJWW4ilMbpMqFm3LC/T6H8ErVYoAmt1tVSB63uotKjCTec/WRFEOX3x
w/7oCC1hWwLQvOPAwern6A/DKkOQHPH2S2p3cYmN3iDj7L8vz3jZxmpwB7YgRB2PhlqvUm3MAIdN
Kj+OU2dmDrFDpvRVhRXC93u3IXvEsbdAPm5ePb7kRINQnbrKVK4A7gObxtQ2P3vYu48ylVrJ/Gmk
OprRjpbTZY9VG6H9KAiDoRV6QoTL7lQSzoSbMz/dJopJbT/12h+6wrbITo9gufIufm2KIHsvmdc/
zJdNSnbc4IgJu0nALNOkLPkYxfgvB+NlpPG1mg8iFHWFb/69z7/hMfRafsUGwK4UIyDJWWjYNdJo
9g7/HVAxER/PN7ZlzyQCRs3w720wUxpTvjOKorsN90XHToJ8UbRVDavSQIiSnwyL7qGLswBb8Mdv
tC03ui5Ymxvx48PHUa6lUInTSKdMNyrGpaUybMbNxY69hho7wDoBR/IDiiF8ccGLFPlyvcl4gmR9
Wmeo+lhfdIRNo+Dj8Fe2ya1zNxJlbWZCAlRFM9Mi8zJWzLA+sXeXbPQ1cs+B7XkUTNX+ScLCczs+
neF0YLfiwEtWKToVa3RAkYGpzGA+sfGSYAuB1jvu6KWscz9lw9cmfw4yX4h2gLdPwZBL0VQHj4n0
QoIKub07HbIik0vZ4ADaxduL8wudVT9qgbnEQI4iss01aU+27W9MzWm26HsX8yT+BMtu1Y/wGHci
EqIZ3OcD1/qwbGZhaqnReNkDDMnJGBQItwsgWFabs9oDNpcc27Fo5RfdMSw7+NceRDl2WRVZw3nH
unbFpcZgOoyJoXwpoG9Xk6VSdYvqg8PlYbmXlMtolQIxHxcluOZ3zeAsM5RuCcEw4xaKiUgAnNBk
lz8nArWHpRUOYO/aNDey/iAFnsqPqu28VAGbObUJ4orUHbgSAzBwz8GnZ6+Guh5U9G3lL0QwC9Io
yBiD2q5Gsut5iaIP1hzWkJnto81XDnfH0If8bw9QPa0PQvTD7VgJ0ChAi4cLiXaoFmMJchVLyA2/
WSofcfe7VN9L0SIZK9rExXxfRZwkXy940Ivj/7QI65D8/a+ViLyClCYnGxinaSYwFV5OwfQkUVi0
P1ED60ZUhYg9H3r29UjCr/pVTy4X21qhgoOT1froEzCe/8z86y2mzXp9GbCI7SEVU17BwTltmE8S
N0UTt9SsVfF3P+rQYbMwISGHM0IAfkxAi/FmDv6mbHVPfh7cfhEX64D+sZRXgz7KXP/0PuXEUQ1X
ZR25p/uaXGgKhtqpnxrwdUeZ9dshO83aWHHufu4kPFLYEyx/dp4o4joyBmFp9/lWtrUpfaH4ZBZY
FdQxWU9W/SO2gQJudosD47+qRCUHGQn7J4zWGylXJaNhgzyK3dQQgIY1GuF3x5RjmIr9kywdVFwu
TagWwnF0eO4xP8RSJPjfBNz0DXDBN+scYQFTRbh8jrwxDP46iMvcLgCd/RvPLqzvgcQ7muOpYqGl
fwF/hx1pyeDGkn9opNOJ1ZOI4WCN5yji73asUN6oks+/zr3tFZhKzsiSkeS33Z/9kQHgJK4nccoN
4+GWHSx4SLqHNwTLJW11ef+DV28ZUO4XMXhfCNZL5tn+niRs/hf0pRdNXeX2Aims7vAaD2OFcfwR
h3L9YS+UnmH4i/zCsV+fASGCrQjmy80uHkLRKNdHEuybaLM6FrnY4ZcxL0icUwRcYaRoCvEv8WkB
ceQdBir+td3eOac4OqjGjpWH0/2HakSro8GCGA5swctShWrQ9lRjt3V4mFjNQLs7l6bgnSFVBDhe
NNrsi9IxuqjzxNOhgsFNjov9nj01/UMguA51QEgxdUPw8OwIqmjty5L/n1APD/xxjEDU9knwiJlZ
06QNvFdZUo084Uuy+5fWAXS96xlOfx7AmJPW8CDPmRQi7pqiwk6eDxe2KrMZa38RhuAgh9BE2uJp
VdlM8HymzoRhCKptXG903Ue2C5ZmEjz20VEv3CT3wKKs/XXcTkOCvo8VNvOFePYleeP4VEi88RbQ
99gm6SyrBMNX94EErG6qnWFDpuHatNzakc2sFvzLXhnEvEu3LoFLAmpJVKQkYwHXZnU4QY+k8Jb6
+aF270m+Dt3g8DEKK/TZZluKZ5NoBmPxMDnCE+UDYcmYarAk0ZNDnOGkyuoy8Qy+xaplOMhrr1Ri
TTBSvMAYPYzkxh0ApCtnJC1e/earojuj5F7ej9WTBCSNCtmupOorzoFVPl8CL7Ys4jz+3mXnq23E
cRvsR1lxvUlEaAqhHZGREVXWfiFPK6+wb9ARg5b+POPNaULQFYXFPzSN2xkKqH3qF0Br9WmWHlzh
Rx00AiN7AL75Z6dH/R5nbBPmHvMGmOlIUrDY3QVF2uBOOxTzFwTr4xP6DQZ417XaYRte3qimA1Km
PNt1S7F/MLA1Fybn09pvFJ8hyxS6ovpwwnyUIfOu1jYFIi0F+g8FpAdlD0zuTx9XpD0qsvt+SP4S
pTbishT3WpGS27P/8flGH9C5s8k2bPAbcZ64j9cnMQkD8tRfDFv2hQJx5+7u4IVf/FDsL+3BADxR
0aoupVZTwWe+5olE7nfgfA2IUYjJBSUMnUhEMVlVPi2S5A9phu8vPOIuVla/NFEEoJvGL5+blyr9
kDfU3ReaQkdL8RmMDDF0TIlgYsaRHyFRkJcI+BRpYFI2aaHtpZYLZL3gJV/sjpBYj0ihRZc8kL71
LMj5Dsn2rD3KK+xmlPUCSrvd4/HW8VGKHJfJ+JA+4nF0jIxfMCzwatgUFCx4rLJfIwiU9Zew8q7Q
pnoFVT/TXgO61ZVgZ0czD6hzJuGD4PMH8hWJa53UUwJE5R8kGk/kBsW4lhdrpop3MOnlTG6JuyHN
HPeYxuYy2fi/F3pJZ5w7pFytovx2v4ryNhIfk2VMdNMccB/30MFFt4wAzsZtqVe6BzetzUUrJqzU
3rh+cRASd6FTl+lQ2mKtHsSaeJD7tvEY7W0G0r02nZvW5pbDaZFt7kbs1Tran4AzjZaICepSROhX
T6IvGlTwE4Tvzgy+rwcipniDYC2vW7ab57BYTEF8UbNW/7yvactgiSTODF5fIS2JDqj2e1jiOhCf
iD3TuiEazeBDqVwoWa2lFoNIz7jTLmBCoBuZANLHJ9JMkJctW6HbtzXZkGxeHq2H4dGrEXRNhedw
CuyxmCSMD0sfABh4839et2P8nRN9U14WySiQkd9GZ3Vx0B8Bog+wA2A1LGt+gV12jXXIlIcf7w2I
TcXi3bs7JCIhgi4yDvN1Mbj0og2vW5/sjJ1pb9YOVjXEnJPzqWm1d25ndBe/GkwE6DNTsATaBED0
1TaqiT9d8pwC9c1jg390+eoO6zgZ0mVeX+N686d2viVWJ9K+nIU0lPzVvQpK9pXR8jax4RPcs/o+
gyzNzUVn4K2JkG7P1fiJYJFcxG0YOo4id/w/ovP6haelrw7Z0/HzwVqwfDDr/iE6ia9eH4QBprxC
A/qYhPU8e7zLUEo+5dyurl8FHbpHNJ1b5Z/acBCTl6hJrCFFVoVSdpG9aQUDl7KfmnsT/vEJSJeW
KdpCHCNBXkoVStyL7Ki0nvGNnNYmTe82LiNH/g2JOUb1xV4XRVyfBF8QP68pQU5Yc95VQqtnwi9t
ZZ2ieQc8dnTHjNxgYJbGsR7EW/PFNPZUXzo1ApJOhmCqPIw3zN/Zb86N1tusvQF8t8A+7QxNGkYh
NHKNGMm8KtpfRLEkpuJBO4pD/QTFdQAi5mT6uJv3yU1CouJQ6w3rYjLiCUqmgBlqbmYO20vPh7rD
ftECg2Wd7jI3Rq6a9rnDOEcyPlF+TJ2BQsUiUy8freiLqUkwC4dDUVjyoSkqcdAuNUguoy6xgQIk
P1DT0cqfe47xzsDWv2niLDyKw5VIFvEyAskAftg3ciiVlKeZUe3dZaIhqi8ft3LFOSZpm+VJud0g
nUOVOpoDZnuDzufPrtPQwXOYsMYd7OOED7ZO2Aq3LmFP8dHtjHZ7XXdyTSxmazvoU4OmcK2I8iwr
r+Gw/c3T0agCzXDJ+Dg0dF0wChN5FBsepdJV0kAKOgt26nb4KGNi7ONB0G6ZBoCVk+UWlE+PuDcm
6wGKv8K+3IdtdsYsD2y72pQXPSkBqVbSoVCwdTCpQNN6lTyO14YsofyDPtwBif8F24LW/D/GGqFW
O29nxgvzAZqNaIXrGydSmzVc93N73c+6ixwgUQVrjmwMrO0iNw/P4JFJL1+c6pIm3sKEF7Ky3a1I
aBVQ4sCDOaYIgF0X6gNpOLtVIImgSIup9VXBPWtbiSIemLWzpEGtnOnj2Pm4Chw19TepkTxTVCR6
vztgKfJbYI5AgyLg1teEN36VZocnNhB++yVda2pe38WTBV8ssnjKdhQLSpWSbhCtrUf3YMoyXiLL
DpDlzM2ik0+ATzaLki3z40Hrz1Pu35KZI+cijVBMn5m1w2q3PelVY6thIPG3iGpG8WVW3gGiYUED
8ne0NUdx6hVQkqBM7wXuXIkA8lMw1WEvnT7JJA9XtoEmeuJ/uIUIWQEZjOjrI6VmzZlXcy6Ye0wH
F9nI5r/k379XX0eqgpfUFIrAKY4vtAbYVeSc97Iid5LfmBqb0A/aOjEPXnngmQcNpLSbBIzSjNsG
PKwpGmqGmevPlVAFVDrtmaiW+GFog9dDrdoORfEPtueSMpOpVzuOZmiHN2+q3M9+esIM8GOTp1Gc
VeWM7EKMPp3+5yZmyynyLhZTqZt5R0Xkg7QlD3mOa+2GLPeFui4kn73WtBvjtuBWiuXYZrBCqR9h
X6Yv1j09jws/HoiAqrHCXF4YIjr26bj1SrJUYkDct36ZWaFIK9mXvOgcgyqu0krOKztQfAUaxvFy
9ki6PGPfWqPx5Ozdgt3o2O40EpAgkTsZqqLApUfpXM7TEwOpLLJqvGtOmBB+AZwnnL4ar1gp47sm
7TDiCFqLHx2YaMw+QrhaNZCmf+X5N4702KvHDji72rMjVQMFVzdNMtT5YnRWCLtHuXruwpJUmI3u
gLktyJrsWp2k9P7I/uxNLk6kDGrgrL60X+h93wGzSTadhjvMWrzZw5uZO9xdnqPD+ex/x6EVOO4j
n0vBX8WAaK+5ygqGRHn0Bt/irgi0un2rFZ8IS/S+ap0LjfuZm63hmdKTHJLuE34m1+CrS7x22wW0
ezPO5Duvw2p4MCEWGTvg+kFkp6Zd63qr+9lOKS0GkSKDi3U9d2hvyUEbpiR6LevUtnFqlFLsSyBt
jeGnCC186TxQpYoH9ioaqNED+0Bt736idnaXZi5S7oKc63GegtdR7vAN+vzc3Dli4rfAUe3w1ss6
v/MhrKFM2204P4lJBMJuIIVa3o+g1kza3hvldIw9LqRKno34GUQfBfVgbauvZUydivMK4c+81Kmm
rqXf5OhsJuM/KmDflL5muZ0xz0lq9qJOuJ/tsCe73DyUp06Rwwe/pZpUqfcCIIrh6tX1YIEFeyBp
CakZ4wRwzojEXMe3WfaIPJZYsSgrZARST4RHG1Q8YR/HPCpcDSNR11J5qE05lI5FkOxLs1pl6XZH
HzEkFcfAs4U0baa5jYxpKsSqk/Ztb7v5LRSdMwogk+Nf3TjQlcBU3FHoWXR8yeOsqBMY+6mZKOVS
nzKfRSreCwmE2cQzJbw6NbXLGk/ZU6bS+v2ywDl3qG/rWoQvf75BqvRoTR8gHHxP5S3KiA9kLxWv
wO1NdXBo4mrf+FVrZ1sHrqbySKpG43NAfhyyRFQNMPR0Ew30XM3wkruFshQVkHFS46Rq+6EM1E8J
WgfDC0GQN0ytDIn01HguEGD/8F+I87lkBiXp/3FnDfPFgU+YyuVa3j/bCKBzTST6S8Og44Xno0LI
ukSnypXma72PLLsx0bML0tbrFV8beFFDHPzreD3l9BPTMEKpCFUGl7UYHt3O6rW4VIIPtFXL8v+U
MvRwV1akLwv43Dm9eaX0S6ETWxPA1SvXOqYDesiPDg4VgXONB6GHKNaBM3k6zxW9wvXty9862Al9
5ED4vcte8znllKx/P8gdt8jU3a6bRVDG0QCFloWtVs2MDe030BfgIraTM9URUKnOY6vxVtJvZACL
60H+x+FcXtaiarKZbT3hgUwDdSMlvdtfok/9c/KFO9yu4d7AYmNaubuXiCNq/80E2LxYSD7wskTm
1O4EiJzpLBGQr/9KoWAUosBK3ahoZWb8TkMmI6D/OmRuaadqort542E4forL8aicohDvrzuOr8Eh
R0oyKwF65d7P1ec3wQKDJt8COzEpBtdD+Xgq4IavSz+mQYcJ04d2wQLmntiHgENaes/Crb+5luev
OQf8pADHRzI66jsuIfqOedmnSJMc4yWJrH8FdGLrKZRFLv++gaxSfJcGmxTaHNhpviavPLhOaq5x
5itsCCz5Vm3ypAsWRJdD88nmyEXux6OOFY7xxpLcX85zvybwCOQkPy9iB8ubspd+7wuf5FtwBjDA
TecY+2wKrxzUa+L7vVi8od8Ix8D1vWr/+B3wE0MV5Vq09Dip2Iui09hN3L/tzNwOFhKtCq+Z3+JS
wVQAfRIb1ZErK3+tSoZIck6ehAM2iY6zo4CFJU4HE1WW/TjdKz+5X/EWQx03Tfcy+OFUY3+tEXi+
O4n4WqQ7v5r/br8XOBTdazS4f9bSIAbHQhKhuUcsJpPggL05AQmpagCY7mzYDybcVSHBBEqnGDJo
rARfnJEatpyq44x3VrNiVadx4FeNzgSYggSuHYqUhQzJfftfOyUiEaN0Smr47ad4fULiHgdQV4Xq
3PuG7Zh9EMt8H4ktgFi4luB/bbww8Z57GLl2YEedF+nPrtfppBOnG+6h/Z54VWASa5/sfgDNi8UE
6se7xKTbcY7+XLqYmxklAARZvk1PsxfVBR96KewiyNhyvrmypopLBI5OKyxnZrJTGGDTZVwWhL4z
aTVEMBZZqpzT9+JGG+z9i96JsRGvn3lQRsjdhVDRwk579SAKOrS3hk6n+He3odyKJjtV5F1FuxHx
O3KGwShOlhqbe0ZjW9cg7eo1AN4o45mcDiAuIWj1ZtuptNGeGralktg+v3Ue3QTN4HItUl3xMirq
hQUbbUjMMh/NvU75IS3SHyokA3xaOqSVoQDHAZWRgn4npPgzsM1jbCgJ4NkRi7kmySkx46dZZ/Q9
SFWjrDI32O6SeN3w5NecrhF/WJlBKeTr4TWyJiZxIMxdKaY2VksbFXxc2aBt24DeGNM2f8UV89Pp
FiuwPJC6qXmtHGMo2vbsmdWMRB61x+gq/8xu0q2g1hgjJA0oXKfexNGZe84lpC9QIUEurtoMZmh8
TywoRzluVM88SsU1S8A3f7Hn32O41wl1c4QHPzQxBzVy2evX0rCWLtHlTahP/JHWrm7qZubQyFbg
77sE4g2zMt2t1VzWwxoJRKcy0bv+bCkVCA9S0cL/H/aGvqRQnQAQb35QFC2TzlcLHEXy6o7zhOOK
rX/IiuquEB3x+09gM+vIro1N1UAF8+OGJSoE++1oQ6dB5pQ4hBRxTg9Kz/rr9IKBT8ji2LiIos8T
3kDKKbYLQ2UMhR047Rlki4H1SJ99rSBEp9BqjU8hTsNCDa8/RDwZDDc0z5o38A7caOz8I/BkCzl1
ZGY/l4E+nIgr1TVxfTHZXYiJVE4YbUqcoG5sJMFYug5QaCZGxFxpVRNsCcI1wW2dgUMjtYcrUCVy
P2KxgzSCeoqceiloKI3PXz+O+yiOjE8M6+T2WxW+bY0tZ8Y5xBKZ5uDPqBkfQmF7Ssqb1ayit3Yi
v9OmJ+GsNfH8aPVDPGw7Qw3XEXzhTc4QnUPJh8MHGRh/yswPHe/x+jgOf4S24zu2N7QFGnHefWB/
KWNmxOEXiMCwF/P2tQ7owy+KV9E4+1svEPTrEi8j/wPpUnumji3v1j6sWq6e7GOrjMc0oXD7jMxl
VgwTv1ZDDzPq9emk5z+no0i80ZhHfMJugwKySdWbOnkqJNQXsySKcqM4F5F3pJ1KsidJVNg2LBQa
fsD0svspaHxW8kiDaiZjAvuKKkbQo49nz0zGiLSH2M64yw4n77SjciD2jCxLDFmGRvApEFOW8JL5
E3rYajB8S1c8//+dRbeE5w0KzTYg8WVikmW8oqekXJnGJY/m4fOVh72S3esJL87ER8CWxYcR89sW
Zkk6KgPZZq9jGg9Tb4KpDJdz3yMGIEB4XIrcthSSwAI+ZzlsQmSFUc4TyNZJRTqBJI2xBY3SEgz8
Q8bW8yrHTSxVhd4D2oDhMKjpENzTSVdKDWqAu4y27CJwrzlJ0Znaqokt+9OO8wPUZ3nQuIZI0Ubm
ix2Y6ZwpaTquX4WvgQNtpeIhe6Llg4vGiCu3pHRdAz1esfj8bam+ZugKf4abmHzGgjITvjUP4Zf5
mtOxb65KZi9etzs+sjPhbhwbVsVkPXhcqZNu8YYzugljEHBeQNmcX97V9lpYyOvNDIPdhNaVHEx+
6CgkMkgb9zGcD7CVrhCtQ0cLwiINfmAkn0HLcWWva1JNnQD7aSu46zlXWALFX35a7rXl4l6foYQL
y89cSMBYoXP6vSm6H+mL7qA/ALLM8hlkf8chTOCfm5pJIHwIiSlPSy9tZCwT2vIuQO5BXWDwr0an
AcqrtuCtdQD3fl61gI232MDIdcNTvXP6ilnzwfIguYLmC7CjlvBnkPGz9vLhVPsC3UReKzgth+QH
VslUo8b73uLW6zxWc1aG2L6L6H8B5AW4+9tEbK7fv+hWEjAZSaA154y2Rl0sG0EnpLH+iGEb87iP
ITFOctkXS8XBQVO5XhP425zwC4aDzr8FmRrp3hKuwq9XMJPXvJIywcBrB7TOfXxGIjK+aoDCEjB2
qB7tds3eZX8vP59jS9z74pzANKXbnLFhAEd1FcCmCevc6nHq0SI+Y1ByayGoeJTzooABRFTKA9TH
XKHJ03ZecL3Ja6d7DOO9DZiBom5r91laIJ3YRl3R3Kfh7BxMaCdzyk+zTwu/9vySqvzFlX3AlxDN
bvA0CkTbozN97pOc6gs7V1SIxa9P4tgClj9aKQvInh4p1eTne+PT0cPkFnL/SafHwQxXJ8Ru/EjY
75mLQmBtm0Sni5NjR1z9iIZ7MUmaejJa7KMqKjTPvaPm5izzwdUYk5lFOnc2TOIHwbzznsBBXdq8
yr8G3VplO8vDBjPQAwk4j4Paic06IYLNnPbIowD1JS2VboMc6ZrVzsTfgxpVAQEPX8E46kc3p333
YMFh2GYis50HYCr3RHhfeYJmdkWSOMellQOKS2qlgMEDi8//vpcF4rY03tpfq2pXm4zv1QJ4Yr/e
uajOln5oyiNH/vqRApA2fi4yjPViruyGoIAu8YSm4tFON1ZYADsV6amIDMFBsz1dd6s+BzkeDS0G
7wYKVZSqEIBVxiZSbzXSLwSpmYUzF1MrKQ6pRjViMLeD1XKckOFvhWXKHQpA0OQBr1EH4Nx/P5Nl
z0+mh2BbNtrJScAkTl2u8642TQfPHmASGvToE7pJnwrh/RH6gjG+nY7WMrlx0m2blHAOsfjE0kNS
+zy4qNUHAG1UtdYt6qbQSuz8Jz35EzGKUL52AS2T/umIhKTY/W3aK37tcv2kDHADRW4JjN6ai8kB
jDHrj2lecgTlEjwQ9lt6gI0nQHL1Q3dUdr/x+6KoN5ZP2BGy75ev7x3ZchWbYldZtbobOC2ONMdQ
m0RhM7NRYPKExQJJuzVFoBBFSBB8+82cHMQJrbfN0PEJAly+ZVntvgfjzWw2bUpemysyf63gTH2A
7SmL62f5H75ccBUOJmZJBA8dBxgRdfAGCBJXI2uIoQnHMAQ2SespW1G/xMy4PlG8hSk0joWp7iqV
8Km/pumzKGGp5r/Zr06+6Y2d8b+06qH8sJpl2QzWqQsTiYGN/fQZNx9upDfdfvfC5JglXXEU0fvY
IXBuVl5QJPOYcP+OQClCr28FgXScWIMElxtGFL9wyaxPk++CyjQxa9NkNKX97fTKNOUSZT/6zRu+
rDuJ4K/7UrKoknMVQAsOlzFmYT7p3PB9GSQTKNOxrUBIvV7dVHqzXy9XxwfRzHIUbWuSEqFPpNvV
+KbiYyDPOu6SraEvxF+/z9suX1+zs4iSzT2S4tuAdjAEL3M6KgahSJpH3baB1yMpHkh7frcerkW2
ILg+/Vy0VIXzFJy3mc+1AFzaAqPoNgEL5bqHU/mmeRlUYYNcerrba/ZVXd4VFY08rtiR69qYZRKt
0QZSr5CeOCu3sVckyvg6qnRMU1FQsX/0zdqIcd94KiMctZZ4D0400uLq8YYV09viD3iXPDaW8t3p
SzyfyDo7D+6Sas1jKx3xUbFsa1gEYRJkoTk73pzao8MRNkC3iLw9eJyvoqGKCr2sMYIT2bEmEdv3
i65ZRwPKmhAhcnN2fvpf03OvLiSTcbQ8Wi2GbxE4gf56UYzKlHCMjO0HB5Y7qtQAKRQVD3zr+38z
ULCiJ4ooIeTgwKrtbu/OYeZ78rINtET2QSGSaJVyMQnIrL+x3D/vDqonn0gk7z0sHFzAKY/WuagN
KEq612GYjC6wBqOe+biv/FXowRdynQCdY9XoL1BVaiWL26faRYIRoOZrrvV8qGJXAEia1ZFx5ZKU
SCXpTBtosg7NSx4NsnfXRdV8F8CDv20IaeT4tu63FimwNPl+Cc47IU/Rih10xDHnGORKQDZivwFU
W0c43gSJ6ifQPtsy3EuvkqB6mLX1XXcA/FdQxZO5rCr4qawK3wxIIvBeaANhGmsEAy65kvKmtgIF
S/x426s281k7kw2MPxZOwRVwzj1NaDaU8Zsd10KVgdZdV/VvRZM8Qa5V2Fg+WhsoMyv8kuaMNdZt
lb5QhgBfM5sYql04cbaQCfwBuctDt1Y2Nsqi2j57qucgdKlh8WRC+TsjRD8rR/uvp1T1Yia+8mQe
8sHv8gc3dvg1BriXqM6a1yQvaa0GlDmy4nahItVwDoIvOEXV0Ory3iBts2A2J+H5fzvh2fKxhEfE
qSi/s62jXQwfaCzZuILyQ1VFjcEytQcc5L6J96vSN5jam1lCGDfzQYD+LXMOv4DsX/otXLtuKyuC
rVlvcilLcu2k11+g66LAL53qu3YC7GdxobRxMSvnb66GbMzo1z67696GQ2qP5RXkCtHwAEvEjnmL
zW0CuZukIKvrW7RhTpzo54xT5JQORT0PSa6HOZxx+X5Bfp4WHXz6jXZpr9aXcO8mVKoP5ZC400RX
bHUhLLchTv8MASA2GwhByjtTy3zuMCix4oBi+vcmpJVccaGL0x5dipXvdr3FR1ZE+On2MHzhcy4J
EKH2XoavXUWUw+rdzFJwQyjWqONmlygkYJquw/G7I/MKtJmp38eMRjPhm9CwTslBG4HBdBcjfduw
IjKQHhMtJJnA9++CBOLMsKw5D3UTw1zodetkn2Z7/FW0RF/asQw1l92YdmbxTpNfMaCCJBT8Jc8u
kA+c9dBqhNOL5EANAuidOAo7w5E/6x9A7hjvpkLzlBkC0e3s2VWrVtmHNEI2dAJaAip2aKPz68D4
120otJbdB1ALrZADomZUfoxSpKBUUSm+iiHJ+RdG8VEeQ0iHm1ONNQS9KS+4WyeOvFkOpRM4CKE0
mrvRCTanNM6qQQ6R+AWHnXUdJ+jHwm9JUBSJtF6bcgQy4l8wsE9UEOym7ZqLlw8uHCyeMYC6ObP/
N82taqSesEJ4UfBfjdcOFJVeK1aQNB2mqcCxAIIsT1gSyF1Kgs1twHukI5ZzfIjIEc9OGS+plUGT
+nPXmPHLrHnJY1Rhi1iKb94l+nJat5eim6z4NefgR4Bxe91dKqYafG70bTnVatxox3OjdfD15NHO
oTaKnhCByaYD1xI3Nkt/sN6qYgZap1k1efAOAR7NFRSbSlQWaWa7lxJvojdVoh93oA+v6u5X57dY
SKLYk5lMsd7E2GcYIWh+c6vxXQI21FyYyldoC42ObKg5U9rkl+F+j6It5su/lDmjIaL3SvU0aCtb
6qkLjHDBDbk/Vs1KO9PebPHofFkfaCBpi8GxsP1TYtDCoIwok+ZhL13dYuDwSI4eHNt3lMpdTqtk
O5oDkR6OJSlo2faCrVf9pCYxKb5IIuR5koNlmmgLpqeYsGgFSMP5b3MhZm1T4F2ctdVmode26z4K
fxc2XANNK4ZsobHfrYyF+TMFGU6k4k9boVFxgpvNXJwvJHB5/tYRTXb/30FGiRsvXt2OSeSCWhMK
UNFaldI62/ZhRKxTT+R5AyBCwqdGuSp79r3kx3Zo48/ZsfQB0W/0zqUBnCRv2RkX/oPyiSQgh2QW
7gMU1DqK53GC3Nl9naYl6utCBCEdvQK9n6Lm0diq8ElTi3j8mZLsuaDR8RS2miLWi5ywAROEbgfa
CZZAs2XqHKMbMsTxhazNCYKnPKONaYcVtj4JL/LVTtAiEeKGgcht34Gl7jceMSoyn3UBnIB0S63s
UZ/GMhXNH5jBrci2XIfVW3/Y42QbUN1+uwJyK7jN6VKvMarcQTz4q9BHvIIbTFNDmI/YccpZpfnY
eZF9zVzB1XGW7ObJNTbPt09RiqQ/Q99FDYKXA83gm3dcP+HwUdKZ8TnP6zZW1IwRYS3WTgZAjU6U
e3tLXdxL7tzRe616D8xXKp48H0R7aLesLjGhg/H9GzG9n/c1qAlPL0SBzCKNGLxt3pX7HkAiC4KJ
seYUxRkAL2mYHpPBMPyYfHX8Uekn+9y84bXJaaacg1eFaH5JQykOMJkOGTxykDCsJ2ZhbW+5u3KJ
Jp76YRmoVV41mrBV8ch90YRkecBn0vBTMkOdAn2Z2OR4oeeBQIGm/M6RRtADtR/7/xLzFAS8v3EL
Ok4QUDq03rwwW4TmWudARKNu4IPSouxcvunN2Anvg161zw+4pJnvgORmWyD2boQcUpKN5q9gG347
fqjqrxB7Y6YMhe+xrTbSUC4n9jNUqu+DGxdoQXIivYBJmfpCfIqSlqAWBgThryXJrKtu/fVoMS46
qFIIPzJYXOYLEIDs/R5iXJ3/UgLuXXyWCSGVzneGsULpzTOhg9dZ0ijhZS/lKVjVwbYIFnSPvHcn
CoEIYGzKzwL6+i5XXRBy9FDPsSfnXKItRSOBs4dHwnmhw30rTu2bNDr0iU5sRu9uunM3LveXS0ik
MORX4D7Pvlm3jiu6ZF+vLf/LligfaZzyloa0MvaEL1LjqoU/dy7EpsbC2t3dMA1X5EA/W5lDYEjv
LaSNxFKru8QZktUpX5MNefvm78+NGYC2H8cuwgrlCbxYgH+5DCPxTZ3TTltlosDl4APDDVo1U7Sj
nBTmUuVSrA5EZkzCB80PzKPpN409WF9njWrDOnawpGgcZ1RtUlIZRm77hRYpf7J7KyNWMV5ellIv
smESaS1sTd8JkNTgIdXBsrwEEFGU96d7vJoM0VsIGo41tO5VN17jQulPNUYFoq6ibMrKVTq+efjD
3HSZryQlymN2k9iw4BIC8MoUQ1jc40XP8SuPVXNMP5/f6PZsLGld5mu7x2MB8WMmN2fIaYjYJu6e
kZSd5e91G4k5JCj4ubcIoKFbKmbQzCeh3IhH5M3U9eQJWyB9Ng9o8O2gMKzLmijRPm4rU8amkG1V
RZt/irZg0vIRjWa5dN4TpmR7O9A7s5eGo7w4ydnc+B+qrBswKtJfo/YqL2A9CoUO72QNKFw24ypa
Ky10VxcmYP9g+SUGIX7og8VdDGkCi26ZYVnDn9N9FL9jz1RQDF/+I/RScZqIWxifyiyo/9/gLtz7
XQ3ZhaeG3WHkPOWtX7YhQf/riyOQRVNoWOBVqMGMhq6XaCkI/2Yud3ta3iv7OCtK8yEVUutdO4Yc
pXLcGBoHzBAHMBIRN+a0iEBb3YR1CmhTzhLL1CFOP5NOropDBImoGN1KYQKy2K0U4hdFyyLpzQ/q
SK9NxPuKKcH5beXxyhi21Y93rLjtu5n9clK2jk0TOZ5ChiYduIvh2yaZiOgCu2K4+CNoIqP2NxvG
jBj7JXZcuCW47Ig69vDWCbAF0DlpXq3zlZPQa0mNk2xnZnv9uPMjo7neNHuDuXllbXezBeqbJYAW
Bav9VRBD9U+eD6TIUj5pt5FKJkZ3mOxgHmuhqRg+ZaPaDIM9QHJ1y2/M/DlZHEPKpI9csOPXPs1P
IqS8q8sxjU+LsKt31dD3h8j3wfSDnr2Rf6kSi+hXqmickCynlrGjUpoIIkepz+JDhXgPCS8A0SIp
EJUQrUnviIxg2rUZ7XPC2mn1d1Dv8GjoWNHPiF4eDQ6jlvHyVLALJbbmMuIt//oxdWle54RSuMhX
Fp46BDOXRKWqs2sasNErerF4qlwf6GaFrnGFsh7zJUCbIfTAKT2Ta9F2qPetI4wgVVrSET0WU5Mr
SRigTJQU4pLRLEb1PKWCvwDm9pJav0o+UrYZrHC663UfjgYXq/8aEW3znSEYch0SjivdYc/8g8uW
kJag4l0vuOR06c9pHpYNcweAI8zMk4ez1o8R5wsyb2dujZaCkFEOdZB1ZYdHNVyLWfw1tVyeKTIM
YUFIuUfJyEdkVW9IKn1bCowrjbBsxGIqyRB0YaBG1R1ILIRQJZSg2uqjvLx3buUzIHW+YBZXYt+/
xhLMZd0HLBmM5eTCFz1rwWAa6wVXtnpogwP7oX1QY4EHPpaTb0Asf1yO/MB/i7rGCvDZobe5hK0C
uVnRAiADBfC5IU5x2UaS+enMelXHSdBjOE5iOykcHE8G6EHmxU8r2ufuCf8mXPyH2zZQwf8zgr9j
hTU4wmV54Y2Kn1Ls5FFkv5lWEL4vKLwK6zXCZ6vNFrxvPaogfONO0V7Q2TCaZWC16e7PZ4eFJMr1
1as875EUh81jU1qDxPlYTNTCeC7QPG51gmV6kPGebaGffPQ6weNpTp5nt/ui5bDke2tPh1KdJGXt
5iTroUyxKBIMAMiQjeWXUqVP2YnYgzZ02ma21B+iQqPnP8tGw/OjpROn/2c8Ehd+NJBN839nzAFj
LY0cg2s2zmOfGrhOO19Lu52wxvUJpNDgfBG6ePN5bsQl2G2RBPy68GjcEvfCSLb87ogdEyHeLivr
+dqDBlC7mdgBR0/PRNs6M5nfwUocfGEM9FUeTNSoPqY021xdC/O9nSLuuhFxvr606bRvoEWZp/ib
LLxeFPwziunXJxJSM+6xkRDgmwUCIqKWO3dYRootekwSuQ7+3hSywTsmMI6ct9B/d0qx5k43xBi9
suoF362+vAcXOEkn3VcMSBik2W5vR6TQNJkFC1ImLyZoJaAwMMGtKv58065VaWQhDz9C6LBFHcnC
nxfV16bLToas3b+UQWQI+6XvJjS7yi7L6B0KSJxau1MPQOmHXA6JHcSpQuygX5Ti+EDIlLo4zmPC
Jzh9lFJha/Y5ddZ87ysWFKAPC7gdD7zHYu9vxYs2H9r/tvNouM5XEmNJMISW3qJ2K3wVYO+3HZwm
cHVQ62KvhgB4Q/3PwdYqaC0y+v+5LyxaCt0CW2CXUOL5ugjYxybwReE8dGSVQCxQwOGPVO9qpATh
jiasQu6/EicdOPOtGM3zYn8M5WK05f7N0mtmfZSLg2jvzFyB5dkvZUVYr0gKsQBdVtqdHBKt/8e4
ryOjHU+EYV81zNQXCOic3BiCBtEV8v6hxyrO2Zpg1zwWk0XsEcaqKjMml++BZUWqugD+wQFpeeQj
VrFPvJE1C7BkTw0yTE1RYZ0SOG8XI+GtMwi6o+jp04yI9pets27I5ZRiSV6zE563DqXMyf8Cw1Fh
DfjQarHVTmRZ6gNOxoXKF1XQCham097RLHCYHDHWmVphgGpKx3TU+WnVcOY7Fr/mrLH+YpC8CtuU
R5Ec4Qs//IdzrU44MilSwXNrdBbfN7vBx3x1ra2IE8J/DHQaGGyt6XsmyT7jG5EuCngsUDgS5JGe
3i2aBx2twslOi8NjsR1g02eexWJ4y7ZQnk4rIAb564C5PfXXWlwFMG+xoigEl01MRDlwG1dHhAyL
1boAxIm8hRECS3iGuJKmbdI+IJ5B9lHM3lQNvoV07zGS0mvKBe+Z2zyUkVO/kJNM0nbXx/FwHyBN
uvOQUqjCw+YDZGt7/TRNv55VxTMPeUEWVMJ8KlRL/xF+z8AUh13fQmYCoy+9jYitnSuCeBAHAtNY
ryiVAE8MXClZQkez/oIqVJ9zX3EGI0getgHAWvSoGyFT1oGXQo/FyA0VqMJEGN/joa+UE9so+mcq
/grGO2HGvmuZASdivEKXYaB4OY0eyuljvXIq8c1T2r8W0a5M12bUqzPUNuEcC8W/talTzo5j8IaF
C+c2eJ2AMdwKmfceU3rEUbvXmNZ/SwGle8f6OEFKgRCwo4+DyE0k4KvqdUUenuSpOMlZvUmuaJC8
x1s7yOo22Vb6O6dAq6V34Zxtlzsbd/FPXzchiAy3urk/OnefJHx+qK8t3Wa+gd5ZbLoaN5xzvFtU
MP/6ernbnYMBkVG37G5sE8iqRXEcRkBs9ZWIiNW7xVAv2wzIv8xlDQwzkUAzznsoDk3Y7ox0fEOB
hSOpnIqR+iTpeuKoVAx0Pdw1Q+X6h1Oq3Sn35TNaVQhN0KbB3vg3czYPCHPAbBzvwfKYHDNJDZ86
LgYo+zflUlxle16r6i+wcRT9exp3nBbqL47czyRA+pXSNmjMmnRF0fKhKjCbGTpgwKT9Lw+nBawS
eetOMZLGi97OwbJJz5RnsGZqXUn4VyX96aN7rW+QvmQJjdscTyYN8U31+ajkXbtr3JmLUa3Q2zaM
5+/gUT6Oviwxp1WbZoQlZKze+TELT5kB33rAtsLt9HgBXrVfekxV1kvXYFrrnkLHG2p5fZtZMM18
+7mr3KvzNONxZtv/iYokE4gAyZ1xbpMoQEZauBCh4+tA2dtJbw84EBpu47q/xckgKQhc2Bx42LVn
RRmWRSV1eO2FgQinN6JRsvzmh0EujR+w+THeiG01U0csFAktbVLmTXVHy49eAqUoQTZZ2rHi5Bnt
2DEXSWBBJ9CNxqa4aOUyrMyhKHZlxd2B1hcW0sNWGQx/QT1MdJDzsguaZsn4V+LBXHub2CBcOMMF
D7SeBHsapiGEyhCDEDo9YodKpW676PyNFA0DwLeNb0VVAY6cUfzLt6Zg2DNVLZxVv710fnbQ8QTZ
49B6HSeMTIfByr4oYYjWNvgAWKBgPC/OYXDOajDKkqYDNFvKJIab6m/VhJqg1y5SmlMVbMV98F8p
drzTLtNonV48bmp7tFzRv7Z8TNmkqjmCj9oEFK5ux7un6LHgfKjgz36dF7x4r1Ri5U5hX+v22IGf
MJPVMWNbQsqj32yFnSJyTpmcXvYqHrmMAiwY9ujNTh311Yg8h4G/WRpv3p/cMd2+v41h+WMt4YLc
xgdTHsJ5U7ZHJKQwF/IeDGNHMPGXKOMS6pyg1VxVc5xX/cZulMvcQPcMqY5PxodJ78LxhwzeDdBP
6t6275BFF89ZeSkV4tz8FZDfvJttmnXSL0GPo7VDwyeUIV3iBDIDUKUXv+7zc6PNJ+Bg0OO6Zudf
joad5kCDjyM4lHp2bglhjFpZdpp56yXmBIOaqypG684FKVAZfRpZIffSe3rrFFmuHcUSutoq7hii
gT/R6VRaYHVlcoVYm+Eij35cYWGTNjfSZNzxUo/X7KF2iLe+6NxLKinA6zQLAh09q5vMVexV8/h/
E+4WpTXuK4yOxbB5guxVaAO1zKFTBU7ZALnbX69qHhkLiFnxA5ofpj241kx5rCkyloI26IpOAdVR
WdviH7QnM5NEOhqACMh9D8ZQEQdqW2EK/qCGkjEHvm68eS5Xgxb0gVKUXWXe8mXYtPXEaxK6fSPX
5/6zEeQzoFL+etgjZLom6w8yrYHuSLvLa90Y0F0i4/40gAFeEvs6LCg1BPjxqK6ndbhsuRFwQf+f
TBxMQWDixdQ8hix7DxULZxK5kVcatcLl6dTDXYmW9y05704RzBPYNl38V3piXc6WOEumMKOZSbsr
1IhxuqfDi9RbngNX1X4R/LhXI2dz+jGJ+3/boU4GOMt9LDiYMiiqv3v7O4tg6tcgmadb2q2q6UUf
5IyezDmojVNKJqJDoPLBwgYguVA3vUN1SWaui8jv0Nx/farThIw2BSTxbx0WzwdL8v8nZXEcoc1f
UYw6qMGCfuZHdOzA63h3AmrkyUcKHjEsqSVAxajoPIZoaaPMAeFEuD6tDtOuGvf9hQIvmsQlI6Pt
EbgBrkGhEmIRneOTcXjWZe+OXLUHynzn6Eq9T1IRXoXVoTTkrPsFb/u5eiALfiLbRqDMylXNjaj0
/ccg2oQTkMryDKlhC3RG+BlMoIEQSNpTEEfH18AH42L49Ief6LAQDqkVbmsOWTgMZ9jRmgBxwpDf
B0fiRfRLlKmGvHweUBWuiRoJP5AOWpz5nYRiPxnf5rK/1FUOZF/4Sh7yI7sa/04WkJZjNZrE8s/T
ghIUVlEX9XGIhqcOIIGrWFFKPwFCaAL5izjZ0ThGDvgnzEh/UKzgVLSbGvPOdazjLmKMvmGew0HU
7zt3jw7FI2UVVRAsx6xsT0svFNZfhN76xTI+5o2CwQ84FtyJ7gUq6Bd/VWTxCO9dW+WHhqjO1XmZ
ZXLf1l7gaLyPZ/0Tco4/O75fRtanQLVaGOZk9WlsIOT8G4LV5DhuguoIBr5E5mfQ6EYkqks/dEWn
6MFy/g6BuHo2D05GhKMcKq459zIsQ4Gje2jJZ06WHP7N5HRYYrBDVmDDnB7rTpDh6xNJ++qs4cqS
itbwGsF8mwIO9lg8Rx+BYkWzUrWd/MK4HSh9x3u1ZMQi5pPbf/C/hsn3rYHoUvR+yZV/V6lzlvg2
oe3c+dw2ULTzMsCvqaUuoCP79OF8mtQMIQub/UTCV5zexrMYsREFFhzzoJ/ucrWJNtsC6YczWvFc
p5IDtogZtA/uS1hqq8DeIXAWPoOJIoc2/lIE/pw9mnTRRvvd9Pm1rp1Mc50d034Ad4mL9UNmjoLy
p2du0W9ABANh637rVGg8weexhhEsO68Vxzh0euE6w6zflVkB4gr64MCLr7p9GAbkFYY47wk7R785
l/U1DHwKq5QA1uLaJDqjTLn2dMF2xmVTTKVWVSklko5u3MPsvmqScONpW8/GLY57gsCWKe8SMMwF
ucYK8xtLUIEMamdXv7k6HzWNWaktvC1HXEq+AU/h0Wg74vRdMw7zxozV+GorUldwcvEWug6UhnT1
k5kqFDlUyjfwcbrIBJhtgWocCvDx/iP44Lw4ZDbofgqEEscE6S2KtrSNHoa/MsjccPkQ0liJF4sA
93AdaGEIcQkcsixPNs3c93KR5ErL71BmVoNgOWBjpZ15xPwgiodQNbOAr2bdv2pN5LcHcAWD7ie3
E38s6L+Lp9G2yT3v30vNGMt8csu6LSDY4bYWPNJQHBS3RDcg3D3AIh8H78xDzDifXo+O3dCgPfog
eNJRQXiIgXdNgEpILNM7t69HSg9CRLLf/Z9p/fMdb0IcFGx0/o5UtxwKm/Qd6YP8aoCmaczV7fNH
ICv4pFqtsiOeRItwQwbLf3RxXyzq0RAe7uQPUZderk9KsjsgTKLmDEaEd4BQ9HkOyH3OsKOeckbi
EK0+pZC0JGrNWmPaBtur5jGX87m2Hub+5QWVK5Q7XsGWWJrgjySvKhLugCvAoBlq60eIJG8tvI8j
FTFqkIo2rN/joLPr+6CvHeNhmqHOZOhVAighDi4kUDN5B9NNKG+ijmDiUALXxAyy0YhlJeiM8liR
g37Li1Tr0WovfPsLfNQ3XukdeGvWworJke30OhNq3q0czHsOb/Y54qa+5fAWx9zrY2N56hLOkUXn
tTaNn1sezLMYcoTre+Z54zeUvtnxAekzv7BxVOEWsKrAa3NZuZ+eqwNA0JG/A060lvSkoEtac4uC
F2S1gw08SAk+m2sessOs1I5Ph6ZkwYejnHoxntbklZV6Xnt5QhGePKwd8mj5tJViwreznhs9+79t
exnoSIaYCEDil+uamlkUV45j9Ee0Rd9MM2RMsdi5ru9bvfAHE144Ou1+JvArWjznLt91DJPHl05Z
MvLuw0DR0sk5drlW2OJp3dO2XGHxIVZXFEmLi2lde2i/3LLyPwMR/T9oqqcDpyr0+B7j3RI7mVdU
+J7yEtQsIgV6khuUpujpbJ/cl0aleZK6fOs8SgoUD2BCX1Xq3vXgZzQeji8K0VntfudmL23smh7t
b3ETDemvLXDBSFTzTOeK9agSrMetM51JvHjxOG+pmRu2CHXIyNz8z3gMlrelLmmWtinisKNZYGn5
m6LghTnIh4oiVsI57wNB/QyVQ8zIjV1l2nIjoAZR0cnj5Ju/nCNdZThMWNFDgxIQo1UvRRAM6yzt
iWVwzxGZgAjQMjWQifLuQT41YHOpEXzBEfeP1psSZcRcy3ZPQ3CpcHpXXc3HM4BSIXQVxAcKENpf
VxMWQNL4YHfUpMDMhqG3b8ujB9GIHym4QpWQ8N2pozrdpr3CvextnHYFTMTH6T3j2E8ZfaQBFq8p
+t1jGTl5TGIQ3VaOk1U8V+NqVRE3B7yvTjesgy9qu2WdE4SlsRFUp+RP7P2dT3w6To7YAoO4YtH2
YfgwaHE5p+dpKc2ARICc1Gu26YSODiA/HRS0UGSep0sXXFu6X6qR5jabV5iOSs+BkL2edfn0Sjg5
ge552X6jWYjVoSYAqc/v/9VdyzOz4NvDO2EL32AViGcT90Wbdw0YP7TySKMF1dji7aeSB8SNL7Fy
ysK0aynVHbYL0Y8SaoX1qgL8hESCMkeC4hpGmA5fUlnB6JSStP91iw8c/HyZK9YGr+66VAKmUCCv
DLH0YTb2DH8ZO/FoEw3KVYX9BMfdb5GSUevaPGbdeNqOH/CNnFwlxyBlIzOtecRFMUlpff2T/hlr
BB4S1+eJKgUfu5WFTngpOxQ9pucoU6VkGNHSiyh0dZViHgOdeJOrcMgarced9b3ilAyhmJgV5q31
mSQRCbe4zkXSkW4roYirzJcv1iyE4RCwEwuWUyR7IiWgamwwdMfvoo47U0n3gIsxtf0qG+6rQb2J
ZZ4PyuKHmIAwhABNmH/qZGtaKBgiXh1E9WKJMA7bE+52yBP6iOTezVgVWGY3a3CU10fnYdQzWJCN
LbVcRgROkjMCoDeZ9t0xb3fxOJFkKiN/LvrCDBr0bAhK+DNZifuQKQjd4zqgGSSSC+JOhoBNaFPi
pFH4TM8C6efcaCtaJKVVbGgVkCTI5TaMNisswTPi8uCXMhw4ahWeMH6A6kg3SEZhzpbGtKHijDby
X5xxlWvC6YpMb+dDNb+0r4anwEqzi2mJdixwXvx5DGdUKccz8aYNbEm8WgwXS3NXwTvsQW13ci6K
eyFdKwAdRiJr+HwiCI1Nhz3xj2fEsCOvBlqlDcIXtkylVRlfSU9lS1BZ7IpSLZVoEHvDXT6dOOkz
bvlExNe09pmz2bN+nsB1vnK6GWcV97dUsvYdJSZEf/Fp7TATXyb6zBMHLOXsyE/O/kYXwm/YXJIr
jRIQOnXZVDKi/xhVoth0f/o/NxMZ9oTgGfdHiy6cy8f2YB2BshmJlo4lOMCFCZTE+r1MJzBDsvPx
zAmC04rHVHCLjo2B1Hc7AnMkQSULfuDHaL5qxmOfeLWoSfr/IGtq7AEsIDQNuxPwwEeNYEgU2dag
pKKQh10ST3iSVGpou62jJdWFzeNltfX1DJAWUllzuGKuTqiCz+XSfxu/Jaqkr4fw/bxoVOb3tpMn
WJRua6/6YaNi4sJBmCAnC9OoMFyD680BT/fQCC4lmD8JoF1D6uzgLXz516kocpobGK3kh76jTazL
9BjCg9QpL+7eD5Rr9nSIvJJdk+lIjZbOZQRp/uiE2Ak0F5EE5rQSIk2axJ3K2sLzqUDjDtsAnw+X
6/SqUMTYucJt6iVJrAEO6p+7xCkGZ9GlBSzVtWYxDBqz7I9qOZprNW7hV+7iJ1wd7sBR8ZrWPP1f
7A4UhNxi/AaXORTmqKOCvfX4QleeCu/KQ7AZEw1lNm8iVp8slzTFPKxYDo3nCPmTQY2wj4UWUjpC
hycY+3LiTKjpTR+kxychUNX5bgUx7XwBagIeEaeidBMzlsj5R2wKa62IFlCkyainDwLvmw7lAHSD
U723JWqWyHnXitHBUgo7BqFb1Clv85c6OL0EMF6q+GIhVMRYK57lnmbJc2SivqPoYSWJbdquO4rM
VENhpU6s9MGqt95f2IrZQPNf7gMfxestIe80yrQa6GA+u+L+Cot0YGmtatXV/XX6RMhDXJ1fzriV
rOeBoL2QknHIHnZEhwC32IQQHZXt8yTRlCgrUZvj/H6vTjVuxa06VEJxuA3in+3/8KTvRjALtVsV
VHj4Ll2VsCQNCTn6+tTH/hrOr5KkqUW2x45EcmRfq4cCgcUN1QXan9VAtU+j5YUp3dT3WHyAt6be
+j4n2qHWa57d0hq4+rrUpdDnOa4VrVOalD4rYsR5GtWLVprjOFfFceTINnkmGf46iVvX6wk/85nF
NpfNKBXiu+FwaQtjo09XUsvzzSpFrHdm7s5AEb7KXbbptwlzWIIBpcXaCzD5EW4yAlxzC9EujHPz
p0IYlfC4LlIEWbnxG6TwkM8lMGx+Lze8g1GY3icL7lIEbfkbcAp3vRSLH6ClEf8lO6e8G1thbiuj
veBMoFDgA12MJVAgbKOpgRy45fL8Tv+2lSIWRijPB6UkzrLcZzylSPe1FxVGWxaClen4J28PioOX
j0Qwi6pQKXqXs0aCdYp308rkxA/1jKE7xZCJ8M7IaQ7deFFIy3QdWHBmIcshty97vJPcvY4HBFv1
zK5lsyPLeTYl3GhIYW23PnT3t9q0LvjF/qx6TWt5Ka5oAYerV2PHZwC2T55R3J7pLu6aohApoiYo
917TXbdBMKN9Gaq4Bg7CS9fdFEj/y/COfm4rY72uxzqqsfhrGU4/l/pbA3lItC7ikDf/eSQIbABe
de5tZ/gXP+6nKjIEtGdrzzF9RUTSM/lZqZOqArOHo57m+b7gxtVl2fhBvcLFaDXT0nr1ELXz7/cD
5ejes+Sf5ydfuMuF5jgvctb45AjgZf8nYhOKAhGL5NbuL5aWmVUMbCjgoULjx6BFMfvZ92HqgiCF
9WgUD6M0DTTH87iDe9wOfLT1aev3zhpSfhN5bZYKt2d1GI/5086RPkYt2JIvfhCas/iox+6GtmR2
c0lFpkTbFGRIoVjfIPCb/NGX0E/s7gEj1kOBatTFRSZSl7abgIxtIY2zuFBI27hEHTngK7SfVDv8
ukw00TxTBZHWztI5qS1KEeO7O72B9ylrXkvMoeCNemw052SKjYj5JDCYwlWrfSL2l1g86VJPKRff
Zhrv1eqovMzp127NC7K9bh7fsz1uS8+/hnWyiu0n6sGX8ZU7J8h/W/ooCOaGbTWtNMp2hjzAir9P
oEh8AXeolcYQ2Us3sEyf8cLRNH096DNEC9yvU7AmYSQNAzf6VUP4ABMPGkqC5IzwgS3AfWiDSLdu
g9sFNHRySVjoP1dUWMpTHvvo7GWmzvXer6w4P7aHIM4bgERVZ4hSXtttr6+jiBvYf24w8r+0zbfg
8FiT60qaQ8If6bX9p6yGA6iFjgS/EffBmOcLtqjEny5ThvNBgzRYZowAyAOiYN2Km+kqYC5hFkrx
cdOKC8n6D+FFygqmXjFPEX06bHt0nVDnnTGYtlFC6YUPLc6rN3ubJnwOYIYvPY1GpX93IombYyiz
71yrshwQEo4xvc0/xPfbToIQfIQzpZWreA9+pkvFg6Npgx8OZB5YN7eMEn44J8npZKc67ozjX1nY
Ab6FOZDeR+Ziu4UZ1qXkDnwNW1Ejtwc0uRjqNbczovmZY5lryeNFLi4gD44gn63wxKFFI4AABUGF
HiPyvimAuSN+bip44MSr9UOfNHATbb5zKomzy22i+3+PApr2lJhT5lyCoLF12Ue/0BOxNV8Nanfg
qlR2+dhqOrF03zLAgOEfq8fl0+GJ+ADegTJHhZc3ExyeiJITlZUjmqBL/2db62kGH8BSQbS7fU9z
SvNFhXu+SxIiocf8PcDYOlttfdF+uTDcGX0peIpLVIHRQNdHzGyZyCnwkYu5qkxdDN4HR8dDkdBz
9d0UWhvjNbJgRa5UJSIkPqxMkFrd4oSTEF6O4FO95ZeQQubQgEwvO+RvtnOWWSJsCeQG5ttPVnlY
ln0+hLF42cYagr/A2MPtqVKbcWdlXMFULxEzE8Tjnx9AVlE7qGvpTTN1R9SBZ4Q45Z7JErlTrT4t
NWGIhkkTpdxO2GV03mlwo7jgfV3L/h2DFFwGFjy/LACd52DS4rXd7kvCgAvVHgtUbsNvTaNw6vR8
2K47rtMQpxk/0OuwlqBX8GiZOkHWg8Wy2aRP6F0NyiUq5FYZyl7gc2NbLwLThdnhKoE3XFUNSnpL
FehAGm+xLCNZFYvtrqjizfdagheAYOoJVuQetQRHj8I+7XsE7jzDFDGOi9RZBNFOsmIPbWQ997kH
rx8fSz2VnbgBJAw8h4az7E9qOcGRHURIBVJg9Lk+tDYTyn28wDahDRsonv1stNMo/xi6vy6ZdIkF
FpK5r7LSzAHBTFqM8KGsrQN5PTG11owCpKAESq7sOAPetd4QrBMcMu8LHJusEDyMfTlCLZrjiTR7
5vwXT5OBZSktOWxVG9XBFk0P2ig/VksgksM+285eVvxVbjObMMLgDJDvCFzhi0Rtklv+6HZ0UK/4
ArlSKPZpFGHQrit8uLE550v3oHowrB9MUlX08IUHPlGbIv14Bc0iXj+MvxnGUH1p+V/+bC+gpGgA
DZT9lnGs66ZgMzCcPtpGnddupRu3fpejcR9XWMWKO+10OcBz2J0BALd9Cotzau3uXXgEVQgIr6EY
j9BWXaSjrt61wOPt0PQCDnIvmpnc+rUuFo1V8SJFD7wwsNl4SK7YcJheVKrsx+daOBn9fMI9z/LW
rdd+G+GfW+OAZUvXjdad9k7F5sW1MH5EnclrIEmYXkT+aju9phq06oWCXu9IMOaGHYdaeJcgVKWA
uwsx6BtOgibvJX616PFLPYBYVgBZ43iOOHqO5iQIXJxboxMaUfG4hLbDaa2dag2aiJQUQFHr2AZS
X4SnIaKoQGKFWHpr8iwekOIzn/hzeIKguoocat5nZzZRbRwYftUdqBnl6+MrtSCZXuYxSfbG0znG
9DKE08pvVeKhIe2K/g3/fiL7Xive2bEdzfBF7LI9IEYdWZmEOJMhhEeHMZxS1R2+CGSqH17sn/LZ
WX8piJNyQgsbIWrqmExkKlXlrvbTrqRb/iwqeSmgHMrjEfecSTkLc+SVnv6/ebmKsTeD2QJMTfQR
0oPwQuNei0Teu8hDxJPpZmVmeDaiGst/Skz5Yg0ldBgNK05rWVgrN/tP2r6NzOPvFiZ33SKxxaQF
yuReQEeJxQktWp9VR+Mc6RNelfHW8SVcK4SGFOOiuIVqk4kUacVPZKL4/v00hp7KOzob+Ocs9HPr
ZQbevtfL3VZLp722cUmuA6OKQTX80tAGs2WV454OS+H8eTkB/Pj1QFZPsSaGLyJaNFVgn3lfDb6U
WdfyilgZeddPqg9sbHApBnhgFDu1PuJwAdaTtEz19u981GEQKNsCk6tPePVkB1HroYJvzGYJ/JM5
LDJBEuotJF+I4H32DQOF49Z69P2uWAjvBs2C2p2BpYKiJv3APIFxkoEci6jhioUx1R+h0bXSfblh
GdWAlt8S0+fsmDGcXmEfxROwbpQjY/+2vOrULdY7TQMGXvFyfrSLx6y04JuUchMTnOPWIS2NU99y
hbAX989XJq/V1KNbQYKR4y/SYbXVWE4+2r+wjU2COy3cjwTzISypxX/tozqibEM994UmTuPQE3Rd
PwVXa5eNrMZBspTlNwt/WnzYqRYfQsT/Mfkrj1tHdpuNr8mqjeMx+7Xcl2tgfYpSLKRZAqmEzLev
w4vcrZ2P/2Cl8uV3TOyhh8mJM0s/QhObuhSEVDDFp+HdepXkEW0XAL9pALFyk0YGkVx3rDv350st
yxHYCVybEvQ8i1WmUyGe0JtePfu77MZGPIcrvqUaBA01GUO0IBFDJPExOScQEFCBu2NAhFdx04l0
PPeQCKGomUZYI1HMq/fMKJF20qANQRbC6OpEz7qMm+kllvXoEv9gJtUBO6BXyXbfVhpQ/xdBYeFk
/3KaImHLGTd91PBUvVSJtj7HJILuXILPbweOyBsjfyxFC3EHag2ViQ6jHqzIW6duqZMJ2/gLa4FF
cpSb5k6L6XyPKVanSxFZdxiz5gpqEoG6LzAepvqzyCnKYwLA0XxzKkNiEdoaqR2sY4OZTam9QDyW
giopLU3bpaOl0SVwT/bBDv6TjnmEUeKVZnOOO4JFpVpgCu4l3tvikQb/oA1TBBrNfLLPyCRdm2tJ
58ccJMVxfB8l1wMir2vv8baOQq2hVzPGVJLGAGxPah3srvgTwZ/3k3na+oXAiO5pQlMt/FpkPWQ7
gv9db45a/FlpLQ5OoDeGpEQVeuAin4noOPtAs6TEdR1K/giVZzTKKQ1zCaJAcw2OhwfxuwjQiFHq
TQMWVwAVCoTBUbZXG7qGfGoZoZzBuixvFCD+OuR+L6FbY74QnVU1y09qgMJHA4ruQHnv0EjXZVQS
LqRCVmyF56LybS+2mADCpHVx1Lkl/Nxe1uRvK2ZKCzeBcN9+LRKfXQ5afaF/Jo7GOMXjOknZBQmR
poSMpGjPi7VFgDiEbOcn9g/6VKkRKdvKHC75g8vHRn0MGXqyfrftldFKWm19wkKWA3hvAN6rFUIi
fBRVpP3BYUy962yfsrZMc+pg+bwaN3plczEYwihCyEK1m3anL4kP2sRs1k4fWI3+kEK4Rn7pPPh9
H+wSJRHlMx83ue3arlVOdXAOF6RLe8gqp/peXh+Elqc+qXIFFp3xtcHXaCfiv7eejAhuxAT0DDNl
mtYqfwGipULcF2LZF5CcWWUkH4S8drL8x6xU/5NxSAPVfiHS4zvHxNsRTq2iT8L9UUSn+3cSl0bE
pXsPdK6IUzRkjxSrMJiJW29ExmVNne/t6HtT76SxNHBYzG8eXSafboNwFZWgbZhSh+1vFxndoO7/
RgB9nwZm+mTZBO3h1Jzu/H1PSvr3508lB0/TD9Tj1Qn0O6q5sLyZ08RcTkwQL7O9p/AOxowYUaSh
6hTtV4RJWJYGpklI+OBsKfeE8KBiKbr2YGTlIidSaBnByUVAvg8YVFkFl1/9lZw/xPJtzVIb5yU5
3jnkmGESkJMl8CtvMKiQ0LwnvRp33Ek5kNv9m3bSlRNzo7K/XwFaOTcX+t+F548R3bpBAF7faKA8
lpCAYgv8JI5IO/pxgkwxZz7K0i7zc94E9ZocHAU9nv8W30PMsBEJ5qIFFRyM1meqv4s4spEwrt+3
56X8cDAGxi612dKsfB+WzK7C+2RF7jrNOgsK0WOUU0rnOZ49vXLLnQyNKHQmpT9NcPdAJJpx0i/R
PZzIM2VeZS5K4JP463e7LJrNGruyryDUl3DCM8lqh8K8Ppt7x2V8PnYrYl7I+xaDWU7bQdt2lmkk
o5dZkOGXTcKAGjnoKEAS383nVa2pTJMDpov8vT4/sdIworkFAStngVSXZZVyKdzrv/McvjpQB7hL
XqbAkinm1jxf3pQfYH69/EsaOQDJ55/ZitBEDbV5MxhX8uGy7uN3IQeLP7s5IZDRQziIj8hYayQR
A+RwT0whORWs3gyXFw6fMnu4LYMqW0LabqzpzbvVbJmlj/9/lieu+YdOj7W0SdyaMrG2x2TI3WsK
LiIvQCgN78CgxqyImO2qZhcEKBc9RvHr9E33+2Zn9YlS4COR5Q7kQ9kpxfDbD8/rW/d51bgSVhCS
9BMb1oB/Habqhrus+sI1BELyE9mO9yxpwzbnt4MsUq8E5ZBDRsz//tsGYPZQQZOMuIzqszHarQEp
6blulT9Rh+oWQUeUtZtyuOisG4QbewsRMYuDqLXtZUQQqNEXHmvkqHrEvXimmaZQC9oMObYxZsHe
nT+IzIO3TNgFCv6Rs9fMV2F5K7BUkkWr6Rj+EnrhKLkHw1wqoZUg+RYjTNNvzC7Fj95C/ObTktyT
JZp8vZTndvvkHYYUvrKplXpULIGU0TeCEZyZ3nCI+pB4uKPLoYEkN/OehiHolfH9OexwJXWFodky
LyIxA0wv9m7rO6+UfhG0Y8qIXq5JNM5iu02gvpLWVUXuIN3xhzIbmNFOU+bgaddjnihWJACYmyiC
fwLeHpyuRjkfLxiQ/6lIVOS9Q4b2vXzO0uqk62uEFXTEh9HieHz3eegXvfy1QTBF/fu6lLS9nHrS
Z26pcJPQJ/g54LXPEj5+4Lp1s7KUD1pudcSnGIyXSr1009Qh1R11M+yLK5WzzKArT8zDAPLU4mhO
XJJgME80/fQQKmedZ3kIGoPClViV+F63XfUNPjwCm9dGBq3X/IMZmRcQ9HLI8Jm0n/5hAd1Rj1p7
TD/YlpFGOvOA/FbGOYQ2W6qzgFfC5nktS7FqDiezXPM8ph4TdwlthsSuqsmCDVJ7fG7bKLEeUphC
IpwH0D+nUx7mgKNdB8nWqtGHqnXyAwWE1xYWctiv+pmMhdK70ptox0ncsxmtta/RIIoODEmD5/Ae
QUN+Ptx6KdgMu6ZsPXXjDy3wDOQYhD21iAENsWSFOHeReIlo2AGUa+HWpKr/3spUDt6MaOyuEayC
wb2WUytZTYimbOA5aLBpCK8RUN+aW3ARyd/A7tq6RtkDxNRdxe1kVXSzB5n9aAAF2UZ/X6doiL+E
oM0jAmpjkL7Cnpbuq82p8kDyNzy9nEEf77UxPlNG/A63D2lggsMFBCCxdiqGBw3uSob1HxbKeFzp
xQyAkq+yMYtOJkGBlGVHXIqoktU4iRsFmhkC7Pd4+W/T/EvisYXL1nm40da95IWEUfKjg69gQIs0
U0aZznNhiKRUcCXMTZs6cOnFVQIbb9xvrUBWHGku4T2FcmgFsBiM5K/ylqcQ29Sufofm3bKtDF6k
dSf0igVOj2PQRujOBR3NrPSANccVlvokQTuxQR6zcA685xffg3kNY6qb03saq+UbFbGytzCHMF6j
xkF+N7pXAml8SsIx2FUNEsB249hu56yJgx01jBGUlu0nrYovmneRVWNbhFThGQP5dDuzqzK5gz0n
WY1j4fekmrngOZdOp0o568Y6F8GBvLnVwXqPnP1nQ04YceJMCTjCEZamtHFxvJqwIQdEc9WN4r3z
MvBpCirKhcjsRbMVpu0/vHYl43si9SmGrit++2IlHDwhAXhoAL6BwRMyEu9bOSwpD/jE7m1ZZEc3
+Zhfp24bFrh3rMdGDRNvt6i/uSDOHFN9KLEWKsZmgLyCTE63x1UIkQQDco9Wu+37iGa6YsZMqSrB
oHeMABC83BkK23tmHoAsS8JserSZeLhZxPy20eY7Ob/pOaTR95OH7ZNWjXoCoGlefBisBaz1m0Qe
woshiVTi7PPHG8MIi9CmWz1UNa3n4ML/6GllkLQqb4nxZPY0qKZ03dhBEV4BlkzvIHW+1DwL5sHi
P8PbgXvCzXlbzdd60O8qZLpy3fQ2pnHkbIQksBk9vNC1paYtGHf9ivy85Fc28K/EwlbTQ84AqSV8
OP2bHl2HuCrIOJL5w/ey/Q443hue3LwRvXVGmkw88+0wAGeDvLdccljPExENl3kC8T6qZU3gK3q4
z21Ao36XXNorKCDSzZItsT1g3OjpMf8zQF09MHVLthhxKVPEOdqqw3X1get7BpFU5CA09Gc2IxZQ
rqQ+gZYM49AZkvSz6TKUy82/4Xbv6zu6YjQLUml6udSROvDLnlR9JN+CUsqcTJaZvPjqqlzf1tRN
RQtY+29LOhLz/4ttgPA/FpRIpjXCX2OlA8rsRErvhx0Nh7FFSsIjs2wk6376T2fHPRQwQ/nafMo5
YOqPpddVZ0MlT9U/eylYjAzyTg8xzUz4E72ntzOVZcwtc/FXZrY3xukGOpXBS/CvGKBNc3MJ/hjJ
AA8JUzBpBxPZjDliYonp8CCKdBcHGcy9Hx+zy65ZvbM0Xpnn+ITw20ZA9mCFf9YpcphQ1uySGcNp
fuQAVhv790LhttgRtDxL6I+Y5CR7rE9/U2Mks285cgeQh1UUEGYO5Aa21NE41DtHWqgXZjGfarUz
Jk5QAPxcPhh6G8KXUMzR2YFIGUBowQe19D27DvbDuEESeiBo3WFaSMdpniMhbslepWb1RropZEJK
1/DJRFtABu4Trr5tow/jsVh0UPW9Ox7CvwD2GjyLVG84k3eRWmdo2hxG7QY1llOCsODhHvXAoTu7
oKF68aHzL4ZukEyCo8gm0oUHjbeY4GEJqsAmE+P50884ryDQAjM/YxyNOaUXr7EG1kpUmLwLjFig
guVnB3oCQd+6ZkE6C9Fqo5fWOpgNsAUlkxufGUGHNNPADsFJeK7Qv/7vBjxLpUXKhKTzAxNhIU3L
oAykld8Bay2bCy2yzSjvLzz3Htpj07OHqJvdgCnZ0aS2K2vhivrMsoLq7b63coBuoq1eRsyzEPiD
8ZD+80sfEeVm34/eRVdvj5AKF6/nh8DfRjfNPv72+P6BU9pLYaxrfkSiPX6FKzDSmR3t/fByi5N0
jJooZWcy6eIBGQgcgvKp4QHdRQcgy9bCVoojUlrrM37iba0cdvZGLYmTEBjyu/MeDYDPzV2WSVuH
E6lb3NlZAa+CtYFD61xVJyTRFoqhgMqPnMDmLlUODX21Z26RRV9U45qlXYl4oaPeRE5A577zNXvg
pvtFNxM144ESHW4cM25mJvHscavvP2BWxkZiYnyJ0qc2DwuYKYEpwvEH2D6XS3uAa2CeKzErU4Fb
qqVmNuOSy5mTzuHdMbw/ZsJsYrJVsbook2hvVSdHXmJ9A1uv2IAegvTCYlvK9ordAtYlTK2VVyey
D9X5O3cc6ZeI5ZVKBixJNLiDyekEFaVi+beJlUcqhk2dXJqWL9ujilQBivKbsZjYkALWD8vP4DPR
vPnTNJTZ4Hrg3F3ehFIGGfB/EmG95XIu3Ko4z56jJPBZdUVZ0qSVyHClYoQcWNrYJRN5Z+cOJ9uW
keorrOCf3frD3kUDWaxvRj8L5IqgMkk19cDtZc2/MzwCgEL5+c5C22fRE1y4FCKAi+39MVtnAmZv
XOZwGUUfV0lCmyFi6v17bXTpSjUEyB+VYtpn4rPJaCZIw9YOcLMvaAYw1HqIfIAx93e446FsEkTq
lnp57JlzOGfdTxXa0dxlZk5mhU2Qcao0/mV5NX+Kg4GCeHWl2awKe6WrIeV7gV34KJpLWDXVssqq
/MbKndGYIEDkwmhXp66TRSn6gHKOegyKDrIzRxteBZRWe3N6UbDbeX3eRPGHBDOeKV1gUVNXWvQ0
wTIGfKdjWqDkWWRrMidASy6luYwQlvMrFQZ8sFRozyLDkxGy6LSouiHNDTyjoSP+V/Cow5rv8lX+
nrg/s+PqlHdYyvQrbf6lh4kws+EIDQhKg8HTYUpc/uo1ZTnZKQ6MYSQtd1TsXG8g7KwzFq3lEzDj
GnkmIKl5yz4sUpT9VwXPDN9u/H1C/8UhjkL75RiG48rrvA6czjnfN+FwFrHxmOhXS2m9RQhPxK8f
flcVxSWuJw+I06W5U+ZvqXksgZj3xMuu1D0Hh/GrXLEADrlU0Z+pdLBh98dVxtTMGfRQuAhABJts
QggivaWKtGWpokSjQdPd292k15KKyBQA5tB6KtfKfeHQexOs0PfFL/VPamVxJ7EuPC1ibRaOIQ1x
8viMG31A4gzSQ63VaUxgAsE1Lc+kzvcXuEyj2Fh5ychXl5uItHtOnhTvGkHYkzsp4fUfP2wbcanF
PWameyxdIxy62hLoZSc6Nug4x+8SQXURublMRIoGkCopwqW965WSucs9MI/X7hkNgK4ZhprupOQs
6SoLIY+KkgzEdTnmPoQdAAAANxevQkquibwAAeuGApvaCykROjaxxGf7AgAAAAAEWVo=

--eo3HaOpBKeHZ1Qbt--
