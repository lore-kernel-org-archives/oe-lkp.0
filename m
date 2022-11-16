Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EB915B2
	for <oe-lkp@lists.linux.dev>; Wed, 16 Nov 2022 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668587724; x=1700123724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sw77U6qvg+Ayj0LJo8rpflokfp83ejq0m7RE0CSMi4A=;
  b=D3jiGpuW0+84blmBlIS2NSqSCF+fd5V5n3mcDCsRm0/ohqzqsm1V0LBM
   klemjZYhgxx0+wPGJ5bDoMNQJMu5hWKERxHUUtu7eP2bSD7xbd4xfKxuu
   jt0joh7acmlNVkchk+mhLWpadfqtOSbx54mDaKnseIt5UiG0ad94L8+D0
   32yD3jYVQHflOFyuHO/zKdQVmEE14xLwqf9dj1y+vzy7mZvuytTfihJXp
   JaBbtkd1JbGlQt+RlOegzwSozka9zFkvF8tzJqtYIXDxMpqOnkoSI7Sbj
   yBMeAPf5NGdo+3BJGzuA6UGhp8eJZVn5F3Y7b5ETs0eb4h05RI9MBbVYI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="314301892"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="xz'?scan'208";a="314301892"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 00:35:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672315332"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="xz'?scan'208";a="672315332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 16 Nov 2022 00:35:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 00:35:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 00:35:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 00:35:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC1cM6764x8nrT6Hw8WJVlBUhTcvQEOae0/wTJgBjAgftHa8UvEhJzfFHVfFp7hBTiLuNd2OrIw5ahNbceOcWvsiTFJ1g8XDUxKPm1SEcgJb/2S/TG37N5HIgL9o0yqEOFJJ8rMVTqFbIys33fcb6h8VYhPhPnFXUhRts8DCnhcwhRXFQKch2Swaz3htuh2Iha5iR75xJ+BViwuP7Gm0BE+pZKrOX0owj6OCgHx8IzY25G951tmMLErli7KKooG3kCgs0KwUA+y8nFVZyeow8IM38orRM7MBzIqOp7ZTToV0gXHclJ+BlCHZyeuqQ8wVU+5AAAoeRNewotYoheguKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWZdVEfD1ZU1rpIfRlcWjvA1bQsHjy0HEoPebvoxtUs=;
 b=LfJTWn/X5Tj3XwBuUIrEfBnUPOMpP8b+zZiDyzlnWDFjeNeK6EzErAvJFkLsCJVVPSkffjNUcKG1UPfXJpKzWCTSMk24LEiySLKA3xKom1aCvLatYWS2uTuzTIR0gatVrb6+2ZuPBGD42suSNwTJ3Q3A2TeCu5PuI7seq9cjTT3dDveRoa+Uzgr+Z0Fk0aGtX39MGh0QHeCrxJ9+BE7kkHfvi+p0BgYpx205PO23MdkTHWSRJftzXuEoKE5Cp3SvYl7cm4wyZ/Db+6T4NzzfZmnj3yNkK3gTzlN1+1DOyhcYKPf/xvrQpLLgyOC2lLsrQahLLHqZDuDPBB1+jNpbxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL3PR11MB6482.namprd11.prod.outlook.com (2603:10b6:208:3bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 08:35:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::a397:a46c:3d1b:c35d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::a397:a46c:3d1b:c35d%8]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:35:13 +0000
Date: Wed, 16 Nov 2022 16:33:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: [peterz-queue:sched/idle] [ftrace] 1cebdae187:
 WARNING:at_include/trace/events/preemptirq.h:#trace_hardirqs_off
Message-ID: <202211161534.acc05ece-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="lnVN3j5N0cVXkHYR"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BL3PR11MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bae436-f274-48c9-0062-08dac7ad7aad
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tadvesaXvWxVlQyfnq3kMnvrSHUvZTXGPeGNouQsrXcREpfrI5QNEIhoavYYygMoeXqtvbSCHaMizbjMx3Yv0N01w5iiSjAeY9sUX7OZoTu0SpHq/vuBeM6jCOkZCnxQSUZO5HG33zNJaCI6S+VX1C2C+2kZsfQex6yBdMqEPgcsAr1guvs7XZmb0u9sOJdUT4KlgtzbY5mMxspis9p6km3OQcv0g6CZJM8O6m97mr4KyKqzs5aiNWN7q0NnZD/21Nku+8HV011L1xbf4CF8g+L2rQxWQnD21uWZ2+CJ4HvNzaCANKtFftD4JP6QtVPqNfobYcTa2j/2yaNE9/lLAxuacEs+Kt/ma8+tZgqElRayf+Vh6F+J0S952g/Z3oEP61iH4pE59APOgeENfK0blEhLEUUz/bE610/S6NcwTZxjWE4oLd3FCMVh81IpQZLcsdKz6f3aPAXTCl2nOQvMToB5C1jaOOkcs8gIjvJNWloc6xgjkAxJ3b7Sc8mEg3Yi3bQ42caJb32CfqtFhIKqBcDUpZ0j+SC4afn/bISYMdpRJRuzXRLqXrL2Mg83PfvcTWxLOPZBo3RzMWmSJsKR0rtONl9lyGr+fsqJXzTXkIukz24T83apkPNBpY15sQhxhyTUroGw5fv8SVACV0/uTfQO7BRQLa+TaHK33UMu0YFt+oyiGPLZDtZWTByOHJG+2+y4jr/bVXBe1z8DVGBtAYgrWhP4AEEwFlkSTQ0CpmOvCrYdaW2pAEsw7s8HDScn/T2ZlZ1XYJL4Nt7t62OXlxjuNJgIOeXF0faxkRkea4eFCYjgik28L4BBYD7G5kdIWji7wURVMlzOoGKI+ZPfdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(966005)(6486002)(107886003)(478600001)(44144004)(6666004)(45080400002)(6916009)(6506007)(316002)(8936002)(2616005)(66476007)(66556008)(36756003)(4326008)(26005)(8676002)(41300700001)(186003)(235185007)(5660300002)(6512007)(1076003)(2906002)(83380400001)(82960400001)(86362001)(38100700002)(66946007)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lDftrxlSha2K27mewX+mFeZc32f0OqbgJDZEgZi3QPVaxulhnN1jahx/5lJ?=
 =?us-ascii?Q?aQFXlWwj4koG2X1y0gdfI7xXmE7NuOsOvnfLDQVupXFMiS35NOB6x9hQqxcw?=
 =?us-ascii?Q?or93AWSe7xP8fmAQzIAzZbcAw4G6kvfqHF4aNujGkX/XWp+FTdIy51yBL1qh?=
 =?us-ascii?Q?g+lYl7f8hYddg3A66/eK01xjfjPnC9YJfXk3e/6vmVWAoxUUQklvObNDVj0H?=
 =?us-ascii?Q?ehufrCasGb8SwsKs3xP80Qm+Zih5w3YvN619JkFHmDdaPmN1sicZbFuQc7BO?=
 =?us-ascii?Q?lW/FYkatMXUVuYS8U/ApG7ig3u6QslHeN1AKKEQageevIuCHKVtPSLMIin8l?=
 =?us-ascii?Q?AP3MQ+o0WEnU/I+W2nWvJBGRZDclMFYAf7TKgnNV9uXUzYpcADUXQq0tLkzV?=
 =?us-ascii?Q?o2nMcfrjQGYTwpo1p4qprXJjm5WNwJV+GA1JaRZadVYZ6X1pkoIIjmzSOHKE?=
 =?us-ascii?Q?BNB5R2e8Qe5Ww+uBSlJ9wW158rcDAxRGX6BQMkH4d+XEJtdApI+GXc5JenPK?=
 =?us-ascii?Q?VNkVCQTmRbDLPg4q1cocphQRdLmpT14zMjd5OG+vSHg4hRRf0oHfOQrj4f33?=
 =?us-ascii?Q?6eUEZyeJn0bd3JGYJii/e4rC6enQMOu7SyNe0/wUjm07Geo7DtTBAJAVR5Mn?=
 =?us-ascii?Q?RQI1FDzGUNA1HVAxdXgw2C3npmw0/ZDIeUSU5Q/KlcWEFiXiFXcz+npKxgGt?=
 =?us-ascii?Q?iHkH718hww1JJLZvxxn7+GXA7oU8UHnrIgHYAjHjni79tsszU/x9iA5BE2RT?=
 =?us-ascii?Q?4u6m+POyHxwyPqG6QH7uooMfyCSVTRkkNnLZwl2vg189H8lCBsyt5lNjWKNo?=
 =?us-ascii?Q?RK9yPpMbBl+0RKxpaVufjNeMFeMLqBRBfngRYOCeBBPzq0fEd6hlKrAk2anM?=
 =?us-ascii?Q?WqXM05zycDiS7RnNI8dq/4gel8iE0CEuXDOyNT0xU2zvKmgf+Sa1XLfrUZ1c?=
 =?us-ascii?Q?4lil4QOwcqrboXE+uoq2zREYPEDl3poEzQeKV+PNY/qcuYsSUqs9YUhEoX7I?=
 =?us-ascii?Q?x55rsR8+FEC7O0VOZRoAmEqps3TauGzRVBMSjbufRnRjbbjhtY7UCRX1CsRb?=
 =?us-ascii?Q?xWMnj9SuymJR2y8YnV4+km566trUEcXzYEeTY+12uVGdy6TGi44pnqOrMbV2?=
 =?us-ascii?Q?upVZBQEhRc59KzDBpAyjsuM2ZesAl4PJHu3Q6sZCj1kVQSHhhyu17kwNRY+F?=
 =?us-ascii?Q?ZNnsucUT51NiB65i++3gfaCR2Gbvs9L+7ofyHO1QH/eXZTHmNv0vELR/oUj1?=
 =?us-ascii?Q?lVadgTnGBNKu+nX+OI4wywmTHsiEQck4qpiCNMe8coaoRtzlSE4yMdXtQ/et?=
 =?us-ascii?Q?Eb2qlyll+n7cBEhK7AurQ0sqbeTDhkI5WwyvmPZcu7yrgDdF2vvbaVnHpheV?=
 =?us-ascii?Q?hTbQCXDPjD5oPbt3CMFpzlMGjye8Dac+t8Q1VWf47/lYCZHNTV5klrR+K+wn?=
 =?us-ascii?Q?B7bWfJoz0FL+hSYvpNzIg11WLN0QzztocmQLmqKNVOCjGvpW3B4nLUp3cztW?=
 =?us-ascii?Q?gbiRrDKFPX1eDwJvvxDe+HpsPhek5r6ND9ik69rbIm3zmQ0lUZz7Asrvgjy/?=
 =?us-ascii?Q?6jQQGPLHWV2HVfrq3S1R1QPy6qPeNXzlEoN2meo8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bae436-f274-48c9-0062-08dac7ad7aad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:35:13.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XpCaXP6uyqqoFe0jVPMzzXFrN1+LmKCdTIEWzWrywtcY6EmH/JWP/GtQ0InNrhjyLxBq488NfDHb1I3e7mxYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6482
X-OriginatorOrg: intel.com

--lnVN3j5N0cVXkHYR
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Greeting,

FYI, we noticed WARNING:at_include/trace/events/preemptirq.h:#trace_hardirqs_off due to commit (built with gcc-11):

commit: 1cebdae1876681bb4dd2c308d0c54c6c9c842370 ("ftrace: WARN on rcuidle")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/idle

in testcase: trinity
version: trinity-static-x86_64-x86_64-1c734c75-1_2020-01-06
with following parameters:

	runtime: 300s
	group: group-04

test-description: Trinity is a linux system call fuzz tester.
test-url: http://codemonkey.org.uk/projects/trinity/

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


[   40.753875][ T3577] ------------[ cut here ]------------
[ 40.754261][ T3577] WARNING: CPU: 0 PID: 3577 at include/trace/events/preemptirq.h:36 trace_hardirqs_off (include/trace/events/preemptirq.h:36 kernel/trace/trace_preemptirq.c:82) 
[   40.754793][ T3577] Modules linked in: polyval_clmulni polyval_generic sha512_ssse3 snd_pcsp aesni_intel evdev snd_pcm parport_pc parport tiny_power_button
[   40.755510][ T3577] CPU: 0 PID: 3577 Comm: trinity-main Not tainted 6.1.0-rc5-00033-g1cebdae18766 #1
[   40.755966][ T3577] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
[ 40.756474][ T3577] RIP: 0010:trace_hardirqs_off (include/trace/events/preemptirq.h:36 kernel/trace/trace_preemptirq.c:82) 
[ 40.756759][ T3577] Code: cc d5 04 02 01 00 00 00 48 8b 3c 24 31 f6 e8 21 05 00 00 8b 05 c3 e3 ac 01 a9 00 00 f0 00 75 d7 cc 90 31 c0 31 f6 31 ff c3 90 <0f> 0b 90 31 c0 31 f6 31 ff c3 e8 ab c2 fd ff b8 02 00 00 00 c3 0f
All code
========
   0:	cc                   	int3   
   1:	d5                   	(bad)  
   2:	04 02                	add    $0x2,%al
   4:	01 00                	add    %eax,(%rax)
   6:	00 00                	add    %al,(%rax)
   8:	48 8b 3c 24          	mov    (%rsp),%rdi
   c:	31 f6                	xor    %esi,%esi
   e:	e8 21 05 00 00       	callq  0x534
  13:	8b 05 c3 e3 ac 01    	mov    0x1ace3c3(%rip),%eax        # 0x1ace3dc
  19:	a9 00 00 f0 00       	test   $0xf00000,%eax
  1e:	75 d7                	jne    0xfffffffffffffff7
  20:	cc                   	int3   
  21:	90                   	nop
  22:	31 c0                	xor    %eax,%eax
  24:	31 f6                	xor    %esi,%esi
  26:	31 ff                	xor    %edi,%edi
  28:	c3                   	retq   
  29:	90                   	nop
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	90                   	nop
  2d:	31 c0                	xor    %eax,%eax
  2f:	31 f6                	xor    %esi,%esi
  31:	31 ff                	xor    %edi,%edi
  33:	c3                   	retq   
  34:	e8 ab c2 fd ff       	callq  0xfffffffffffdc2e4
  39:	b8 02 00 00 00       	mov    $0x2,%eax
  3e:	c3                   	retq   
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	90                   	nop
   3:	31 c0                	xor    %eax,%eax
   5:	31 f6                	xor    %esi,%esi
   7:	31 ff                	xor    %edi,%edi
   9:	c3                   	retq   
   a:	e8 ab c2 fd ff       	callq  0xfffffffffffdc2ba
   f:	b8 02 00 00 00       	mov    $0x2,%eax
  14:	c3                   	retq   
  15:	0f                   	.byte 0xf
[   40.757725][ T3577] RSP: 0018:ffffc900028cbb20 EFLAGS: 00010046
[   40.758029][ T3577] RAX: 0000000080000001 RBX: 0000000000000200 RCX: 0000000000000000
[   40.758419][ T3577] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8114654f
[   40.758811][ T3577] RBP: 0000000000000000 R08: ffffffff8333fff8 R09: 0000000000000000
[   40.759201][ T3577] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8333fff8
[   40.759593][ T3577] R13: ffffffff810386f0 R14: ffffffff8393e8ca R15: 0000000000000000
[   40.759985][ T3577] FS:  000000000109a880(0000) GS:ffffffff82c68000(0000) knlGS:0000000000000000
[   40.760426][ T3577] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   40.760751][ T3577] CR2: 000000000130f028 CR3: 00000001795cd000 CR4: 00000000000406f0
[   40.761141][ T3577] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   40.761537][ T3577] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   40.761928][ T3577] Call Trace:
[   40.762095][ T3577]  <TASK>
[ 40.762244][ T3577] on_each_cpu_cond_mask (kernel/up.c:51 (discriminator 1)) 
[ 40.762505][ T3577] text_poke_bp_batch (include/linux/smp.h:71 arch/x86/kernel/alternative.c:1311 arch/x86/kernel/alternative.c:1502) 
[ 40.762760][ T3577] ? __traceiter_irq_enable (include/trace/events/preemptirq.h:14) 
[ 40.763035][ T3577] text_poke_finish (arch/x86/kernel/alternative.c:1671 arch/x86/kernel/alternative.c:1677) 
[ 40.763274][ T3577] arch_jump_label_transform_apply (arch/x86/kernel/jump_label.c:147) 
[ 40.763578][ T3577] jump_label_update (kernel/jump_label.c:802) 
[ 40.763831][ T3577] ? __traceiter_irq_enable (include/trace/events/preemptirq.h:14) 
[ 40.764103][ T3577] static_key_enable_cpuslocked (include/linux/atomic/atomic-arch-fallback.h:243 include/linux/atomic/atomic-instrumented.h:50 kernel/jump_label.c:181) 
[ 40.764392][ T3577] tracepoint_add_func (kernel/tracepoint.c:362) 
[ 40.764656][ T3577] ? __traceiter_irq_enable (include/trace/events/preemptirq.h:14) 
[ 40.764931][ T3577] tracepoint_probe_register (kernel/tracepoint.c:512 kernel/tracepoint.c:531) 
[ 40.765207][ T3577] ? __traceiter_irq_enable (include/trace/events/preemptirq.h:14) 
[ 40.765489][ T3577] trace_event_reg (kernel/trace/trace_events.c:529) 
[ 40.765729][ T3577] perf_trace_event_init (kernel/trace/trace_event_perf.c:129 kernel/trace/trace_event_perf.c:202) 
[ 40.765998][ T3577] perf_trace_init (kernel/trace/trace_event_perf.c:226) 
[ 40.766240][ T3577] ? perf_init_event (arch/x86/include/asm/preempt.h:80 include/linux/rcupdate.h:94 include/linux/rcupdate.h:736 kernel/events/core.c:11438) 
[ 40.766491][ T3577] perf_tp_event_init (kernel/events/core.c:9910) 
[ 40.766737][ T3577] perf_try_init_event (kernel/events/core.c:11382) 
[ 40.766995][ T3577] ? perf_init_event (arch/x86/include/asm/preempt.h:80 include/linux/rcupdate.h:94 include/linux/rcupdate.h:736 kernel/events/core.c:11438) 
[ 40.767246][ T3577] perf_init_event (kernel/events/core.c:11447) 
[ 40.767496][ T3577] perf_event_alloc (kernel/events/core.c:11737) 
[ 40.767762][ T3577] ? perf_prepare_sample (kernel/events/core.c:7609) 
[ 40.768030][ T3577] __do_sys_perf_event_open (kernel/events/core.c:12275) 
[ 40.768323][ T3577] ? __task_pid_nr_ns (include/linux/rcupdate.h:99 include/linux/rcupdate.h:770 kernel/pid.c:501) 
[ 40.768591][ T3577] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 40.768829][ T3577] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4262 kernel/locking/lockdep.c:4321) 
[ 40.769133][ T3577] ? do_syscall_64 (arch/x86/entry/common.c:87) 
[ 40.769376][ T3577] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4262 kernel/locking/lockdep.c:4321) 
[ 40.769684][ T3577] ? do_syscall_64 (arch/x86/entry/common.c:87) 
[ 40.769923][ T3577] ? do_syscall_64 (arch/x86/entry/common.c:87) 
[ 40.770166][ T3577] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[   40.770462][ T3577] RIP: 0033:0x463519
[ 40.770661][ T3577] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 59 00 00 c3 66 2e 0f 1f 84 00 00 00 00
All code
========
   0:	00 f3                	add    %dh,%bl
   2:	c3                   	retq   
   3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   a:	00 00 00 
   d:	0f 1f 40 00          	nopl   0x0(%rax)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	0f 83 db 59 00 00    	jae    0x5a11
  36:	c3                   	retq   
  37:	66                   	data16
  38:	2e                   	cs
  39:	0f                   	.byte 0xf
  3a:	1f                   	(bad)  
  3b:	84 00                	test   %al,(%rax)
  3d:	00 00                	add    %al,(%rax)
	...

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	0f 83 db 59 00 00    	jae    0x59e7
   c:	c3                   	retq   
   d:	66                   	data16
   e:	2e                   	cs
   f:	0f                   	.byte 0xf
  10:	1f                   	(bad)  
  11:	84 00                	test   %al,(%rax)
  13:	00 00                	add    %al,(%rax)


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202211161534.acc05ece-yujie.liu@intel.com


To reproduce:

        # build kernel
	cd linux
	cp config-6.1.0-rc5-00033-g1cebdae18766 .config
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.


-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--lnVN3j5N0cVXkHYR
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.1.0-rc5-00033-g1cebdae18766"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
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
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
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

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
CONFIG_USERMODE_DRIVER=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
CONFIG_IRQ_TIME_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
CONFIG_CHECKPOINT_RESTORE=y
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
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
# CONFIG_SMP is not set
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
# CONFIG_X86_MPPARSE is not set
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_DEBUG=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
# CONFIG_XEN_PV is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_GUEST=y
CONFIG_XEN_SAVE_RESTORE=y
CONFIG_XEN_DEBUG_FS=y
CONFIG_XEN_PVH=y
# CONFIG_XEN_DOM0 is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
CONFIG_ACRN_GUEST=y
CONFIG_INTEL_TDX_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
CONFIG_UP_LATE_INIT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
# CONFIG_X86_MCE_INTEL is not set
# CONFIG_X86_MCE_INJECT is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=m
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
# CONFIG_MTRR is not set
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_X86_SGX=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
# CONFIG_EFI_MIXED is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
CONFIG_SCHED_HRTICK=y
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
# CONFIG_ACPI_DEBUGGER_USER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
# CONFIG_ACPI_BATTERY is not set
# CONFIG_ACPI_BUTTON is not set
CONFIG_ACPI_TINY_POWER_BUTTON=m
CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=38
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=m
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
# CONFIG_ACPI_CONTAINER is not set
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=m
CONFIG_ACPI_CUSTOM_METHOD=m
# CONFIG_ACPI_BGRT is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
CONFIG_ACPI_DPTF=y
# CONFIG_DPTF_POWER is not set
# CONFIG_DPTF_PCH_FIVR is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_CONFIGFS=m
CONFIG_ACPI_PFRUT=m
CONFIG_PMIC_OPREGION=y
CONFIG_ACPI_VIOT=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=m
# CONFIG_X86_AMD_PSTATE is not set
CONFIG_X86_AMD_PSTATE_UT=m
# CONFIG_X86_ACPI_CPUFREQ is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
CONFIG_X86_X32_ABI=y
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
CONFIG_X86_SGX_KVM=y
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
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
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
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
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_HAVE_ARCH_NODE_DEV_GROUP=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
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
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_KM=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
# CONFIG_PTE_MARKER_UFFD_WP is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
CONFIG_DAMON_SYSFS=y
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_INTERFACE=m
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=m
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_XFRM_ESPINTCP=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
CONFIG_IP_MROUTE_COMMON=y
# CONFIG_SYN_COOKIES is not set
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=m
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=y
CONFIG_INET6_ESP_OFFLOAD=y
CONFIG_INET6_ESPINTCP=y
CONFIG_INET6_IPCOMP=y
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=y
CONFIG_INET6_TUNNEL=y
CONFIG_IPV6_VTI=y
# CONFIG_IPV6_SIT is not set
CONFIG_IPV6_TUNNEL=y
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
CONFIG_BPFILTER_UMH=m
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
CONFIG_IP_DCCP_DEBUG=y
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=y
CONFIG_SCTP_DBG_OBJCNT=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=y
# CONFIG_TIPC_MEDIA_UDP is not set
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=m
CONFIG_IPDDP=m
CONFIG_IPDDP_ENCAP=y
# CONFIG_X25 is not set
CONFIG_LAPB=m
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
CONFIG_IEEE802154_SOCKET=m
CONFIG_MAC802154=m
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=m
# CONFIG_VSOCKETS_LOOPBACK is not set
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=y
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=y
CONFIG_HSR=m
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
CONFIG_NET_DROP_MONITOR=m
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set
# CONFIG_CAN_J1939 is not set
CONFIG_CAN_ISOTP=m
# CONFIG_BT is not set
CONFIG_AF_RXRPC=m
# CONFIG_AF_RXRPC_IPV6 is not set
CONFIG_AF_RXRPC_INJECT_LOSS=y
CONFIG_AF_RXRPC_DEBUG=y
CONFIG_RXKAD=y
CONFIG_AF_KCM=m
CONFIG_STREAM_PARSER=y
CONFIG_MCTP=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=m
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=m
CONFIG_NFC_NCI=m
CONFIG_NFC_NCI_UART=m
CONFIG_NFC_HCI=y
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_SIM=m
CONFIG_NFC_VIRTUAL_NCI=m
CONFIG_NFC_FDP=m
CONFIG_NFC_FDP_I2C=m
CONFIG_NFC_PN533=m
CONFIG_NFC_PN533_I2C=m
# CONFIG_NFC_MRVL_UART is not set
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_NXP_NCI=m
CONFIG_NFC_NXP_NCI_I2C=m
CONFIG_NFC_S3FWRN5=m
CONFIG_NFC_S3FWRN5_I2C=m
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
CONFIG_NET_IFE=m
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
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
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_SMI=y
CONFIG_GOOGLE_COREBOOT_TABLE=m
# CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
# CONFIG_GOOGLE_MEMCONSOLE_COREBOOT is not set
CONFIG_GOOGLE_VPD=m

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
# CONFIG_EFI_FAKE_MEMMAP is not set
# CONFIG_EFI_DXE_MEM_ATTRIBUTES is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
CONFIG_EFI_COCO_SECRET=y
# end of EFI (Extensible Firmware Interface) Support

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_SERIAL is not set
# CONFIG_PARPORT_PC_FIFO is not set
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=m
CONFIG_PARPORT_AX88796=m
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

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
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=m
CONFIG_DS1682=m
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=m
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

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
# CONFIG_VSOCKMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
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
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
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
# CONFIG_OCTEON_EP is not set
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
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
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
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
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
CONFIG_NET_VENDOR_SMSC=y
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
CONFIG_CAN_DEV=m
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
# CONFIG_CAN_SLCAN is not set
# CONFIG_CAN_C_CAN is not set
# CONFIG_CAN_CC770 is not set
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set
# CONFIG_CAN_DEBUG_DEVICES is not set

#
# MCTP Device Drivers
#
# CONFIG_MCTP_SERIAL is not set
# CONFIG_MCTP_TRANSPORT_I2C is not set
# end of MCTP Device Drivers

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
CONFIG_IEEE802154_DRIVERS=y
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_HWSIM is not set

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
# CONFIG_INPUT_FF_MEMLESS is not set
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=m
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5520 is not set
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
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
# CONFIG_RMI4_SMB is not set
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=m
CONFIG_SERIO_PARKBD=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
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
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
# CONFIG_SERIAL_8250_PNP is not set
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_RT288X=y
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
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK_GT is not set
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=m
CONFIG_N_GSM=y
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
# CONFIG_HVC_XEN_FRONTEND is not set
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=m
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=y
# CONFIG_HW_RANDOM_VIA is not set
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_XIPHERA=m
# CONFIG_APPLICOM is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
# CONFIG_CARDMAN_4000 is not set
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=m
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
CONFIG_HPET_MMAP_DEFAULT=y
CONFIG_HANGCHECK_TIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS=m
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_I2C_CR50=m
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=y
CONFIG_TCG_XEN=m
CONFIG_TCG_CRB=y
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TELCLOCK=y
# CONFIG_XILLYBUS is not set
# CONFIG_RANDOM_TRUST_CPU is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

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
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_CROS_EC_TUNNEL is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=m
CONFIG_DW_I3C_MASTER=y
# CONFIG_SVC_I3C_MASTER is not set
# CONFIG_MIPI_I3C_HCI is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=m
CONFIG_HSI=m
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
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_SX150X=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
CONFIG_PINCTRL_BROXTON=m
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_ELKHARTLAKE=m
CONFIG_PINCTRL_EMMITSBURG=m
CONFIG_PINCTRL_GEMINILAKE=y
CONFIG_PINCTRL_ICELAKE=m
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
# CONFIG_PINCTRL_LEWISBURG is not set
CONFIG_PINCTRL_METEORLAKE=y
CONFIG_PINCTRL_SUNRISEPOINT=m
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
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=m
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD9571MWV=m
# CONFIG_GPIO_DA9055 is not set
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TQMX86 is not set
CONFIG_GPIO_TWL6040=m
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8350 is not set
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_DS1WM=m
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_IP5XXX_POWER=m
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=m
# CONFIG_WM831X_POWER is not set
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=m
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9030=y
# CONFIG_AXP20X_POWER is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_88PM860X=m
CONFIG_CHARGER_PCF50633=m
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=m
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_MAX77976=m
# CONFIG_CHARGER_MAX8997 is not set
CONFIG_CHARGER_MP2629=m
CONFIG_CHARGER_MT6360=y
CONFIG_CHARGER_MT6370=m
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_BQ256XX=m
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_CROS_USBPD is not set
CONFIG_CHARGER_CROS_PCHG=m
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_UG3105=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_DEVFREQ_THERMAL is not set
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
CONFIG_INTEL_MENLOW=m
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
# CONFIG_DA9055_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WDAT_WDT=m
CONFIG_WM831X_WATCHDOG=m
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=m
# CONFIG_MLX_WDT is not set
CONFIG_CADENCE_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=m
# CONFIG_RETU_WATCHDOG is not set
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=m
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
CONFIG_EXAR_WDT=m
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
CONFIG_IBMASR=y
# CONFIG_WAFER_WDT is not set
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
CONFIG_IT8712F_WDT=y
CONFIG_IT87_WDT=y
# CONFIG_HP_WATCHDOG is not set
CONFIG_KEMPLD_WDT=y
CONFIG_SC1200_WDT=m
# CONFIG_PC87413_WDT is not set
# CONFIG_NV_TCO is not set
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
CONFIG_SMSC37B787_WDT=y
CONFIG_TQMX86_WDT=m
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=y
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=m
# CONFIG_NI903X_WDT is not set
CONFIG_NIC7018_WDT=m
CONFIG_MEN_A21_WDT=m
CONFIG_XEN_WDT=y

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_CROS_EC_DEV=m
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=y
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=y
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=m
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=m
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=m
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=m
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
CONFIG_MFD_TQMX86=m
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_WCD934X is not set
# CONFIG_MFD_ATC260X_I2C is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=y
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_88PM8607=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_BD9571MWV=m
CONFIG_REGULATOR_DA903X=y
CONFIG_REGULATOR_DA9055=m
CONFIG_REGULATOR_DA9210=m
# CONFIG_REGULATOR_DA9211 is not set
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=y
# CONFIG_REGULATOR_LP8755 is not set
# CONFIG_REGULATOR_LP8788 is not set
# CONFIG_REGULATOR_LTC3589 is not set
# CONFIG_REGULATOR_LTC3676 is not set
# CONFIG_REGULATOR_MAX14577 is not set
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX8649 is not set
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8893 is not set
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8997=m
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MT6311=m
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6331 is not set
# CONFIG_REGULATOR_MT6332 is not set
CONFIG_REGULATOR_MT6358=m
CONFIG_REGULATOR_MT6359=y
# CONFIG_REGULATOR_MT6360 is not set
# CONFIG_REGULATOR_MT6370 is not set
CONFIG_REGULATOR_MT6397=m
# CONFIG_REGULATOR_PCA9450 is not set
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5120 is not set
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=m
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=m
# CONFIG_REGULATOR_SKY81452 is not set
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=m
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65090=m
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_LIRC=y
CONFIG_RC_MAP=m
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_CROS_EC is not set
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
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
# CONFIG_VIDEO_DEV is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y
# end of Media core support

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y
CONFIG_DVB_PLATFORM_DRIVERS=y

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

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
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

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_DVB_TEST_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_IT913X=m
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_MT2266=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
# CONFIG_MEDIA_TUNER_MXL5005S is not set
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_QM1D1B0004=y
CONFIG_MEDIA_TUNER_QM1D1C0042=m
# CONFIG_MEDIA_TUNER_QT1010 is not set
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_SI2157 is not set
CONFIG_MEDIA_TUNER_SIMPLE=y
# CONFIG_MEDIA_TUNER_TDA18212 is not set
# CONFIG_MEDIA_TUNER_TDA18218 is not set
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_M88DS3103=y
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_STB0899 is not set
# CONFIG_DVB_STB6100 is not set
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=y
# CONFIG_DVB_STV6110x is not set
CONFIG_DVB_STV6111=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
# CONFIG_DVB_MN88472 is not set
CONFIG_DVB_MN88473=m
# CONFIG_DVB_SI2165 is not set
CONFIG_DVB_TDA18271C2DD=y

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24116=m
# CONFIG_DVB_CX24117 is not set
CONFIG_DVB_CX24120=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
# CONFIG_DVB_MT312 is not set
CONFIG_DVB_S5H1420=y
# CONFIG_DVB_SI21XX is not set
# CONFIG_DVB_STB6000 is not set
# CONFIG_DVB_STV0288 is not set
# CONFIG_DVB_STV0299 is not set
CONFIG_DVB_STV0900=y
CONFIG_DVB_STV6110=m
# CONFIG_DVB_TDA10071 is not set
# CONFIG_DVB_TDA10086 is not set
# CONFIG_DVB_TDA8083 is not set
# CONFIG_DVB_TDA8261 is not set
# CONFIG_DVB_TDA826X is not set
CONFIG_DVB_TS2020=y
# CONFIG_DVB_TUA6100 is not set
CONFIG_DVB_TUNER_CX24113=y
# CONFIG_DVB_TUNER_ITD1000 is not set
# CONFIG_DVB_VES1X93 is not set
# CONFIG_DVB_ZL10036 is not set
# CONFIG_DVB_ZL10039 is not set

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_AF9013 is not set
# CONFIG_DVB_CX22700 is not set
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=y
CONFIG_DVB_CXD2841ER=y
CONFIG_DVB_DIB3000MB=y
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=y
CONFIG_DVB_DIB7000P=y
# CONFIG_DVB_DIB9000 is not set
# CONFIG_DVB_DRXD is not set
# CONFIG_DVB_EC100 is not set
CONFIG_DVB_L64781=m
# CONFIG_DVB_MT352 is not set
# CONFIG_DVB_NXT6000 is not set
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=m
# CONFIG_DVB_S5H1432 is not set
CONFIG_DVB_SI2168=y
# CONFIG_DVB_SP887X is not set
CONFIG_DVB_STV0367=m
# CONFIG_DVB_TDA10048 is not set
# CONFIG_DVB_TDA1004X is not set
# CONFIG_DVB_ZD1301_DEMOD is not set
# CONFIG_DVB_ZL10353 is not set

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_STV0297 is not set
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=y
CONFIG_DVB_VES1820=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_MXL692=m
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51132 is not set
# CONFIG_DVB_OR51211 is not set
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=m
CONFIG_DVB_S921=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=y
CONFIG_DVB_TC90522=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_AF9033=y
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_HELENE=y
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=y
CONFIG_DVB_ISL6423=y
CONFIG_DVB_IX2505V=y
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_LNBH25=m
# CONFIG_DVB_LNBH29 is not set
# CONFIG_DVB_LNBP21 is not set
CONFIG_DVB_LNBP22=y
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_TDA665x=y
# CONFIG_DVB_DRX39XYJ is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=y
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
CONFIG_FB_N411=y
CONFIG_FB_HGA=m
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
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
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=y
CONFIG_XEN_FBDEV_FRONTEND=y
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support

# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=y
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
# CONFIG_SND_PCM_TIMER is not set
# CONFIG_SND_HRTIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
# CONFIG_SND_PROC_FS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_CTL_FAST_LOOKUP is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_CTL_INPUT_VALIDATION=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_PCSP=m
CONFIG_SND_DUMMY=m
# CONFIG_SND_ALOOP is not set
# CONFIG_SND_VIRMIDI is not set
# CONFIG_SND_MTPAV is not set
CONFIG_SND_MTS64=m
CONFIG_SND_SERIAL_U16550=m
CONFIG_SND_MPU401=m
# CONFIG_SND_PORTMAN2X4 is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
# CONFIG_SND_PCMCIA is not set
# CONFIG_SND_SOC is not set
# CONFIG_SND_X86 is not set
CONFIG_SND_XEN_FRONTEND=m
CONFIG_SND_VIRTIO=m

#
# HID support
#
# CONFIG_HID is not set

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

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
CONFIG_MMC=y
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=y
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_MTK=y
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
# CONFIG_RTC_INTF_PROC is not set
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=m
CONFIG_RTC_DRV_88PM80X=m
CONFIG_RTC_DRV_ABB5ZES3=y
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
CONFIG_RTC_DRV_DS1307_CENTURY=y
CONFIG_RTC_DRV_DS1374=m
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_LP8788=m
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8925 is not set
# CONFIG_RTC_DRV_MAX8997 is not set
CONFIG_RTC_DRV_RS5C372=m
# CONFIG_RTC_DRV_ISL1208 is not set
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=y
CONFIG_RTC_DRV_PCF85063=m
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=y
CONFIG_RTC_DRV_TPS6586X=y
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
# CONFIG_RTC_DRV_RX8025 is not set
CONFIG_RTC_DRV_EM3027=m
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV3032=y
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RX6110=m

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=y
CONFIG_RTC_DRV_DS1685_FAMILY=m
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
CONFIG_RTC_DRV_DS17485=y
# CONFIG_RTC_DRV_DS17885 is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
CONFIG_RTC_DRV_DA9055=y
# CONFIG_RTC_DRV_DA9063 is not set
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
CONFIG_RTC_DRV_V3020=y
CONFIG_RTC_DRV_WM831X=m
CONFIG_RTC_DRV_WM8350=m
# CONFIG_RTC_DRV_PCF50633 is not set
CONFIG_RTC_DRV_CROS_EC=m

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=y
# CONFIG_RTC_DRV_MC13XXX is not set
CONFIG_RTC_DRV_MT6397=y

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=m
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=m
# CONFIG_HD44780 is not set
CONFIG_KS0108=m
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=m
CONFIG_CFAG12864B_RATE=20
CONFIG_IMG_ASCII_LCD=m
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=m
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=m
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=m
# CONFIG_VDPA_SIM is not set
CONFIG_VDPA_USER=m
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST=y
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=y
# CONFIG_VHOST_VDPA is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
# CONFIG_XEN_SCRUB_PAGES_DEFAULT is not set
CONFIG_XEN_DEV_EVTCHN=y
CONFIG_XEN_BACKEND=y
# CONFIG_XENFS is not set
# CONFIG_XEN_SYS_HYPERVISOR is not set
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
CONFIG_XEN_GRANT_DEV_ALLOC=y
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_XEN_PCI_STUB=y
CONFIG_XEN_PCIDEV_BACKEND=m
CONFIG_XEN_PVCALLS_FRONTEND=y
CONFIG_XEN_PVCALLS_BACKEND=m
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
CONFIG_XEN_FRONT_PGDIR_SHBUF=m
CONFIG_XEN_GRANT_DMA_OPS=y
CONFIG_XEN_VIRTIO=y
CONFIG_XEN_VIRTIO_FORCE_GRANT=y
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
CONFIG_COMEDI_NI_DAQ_700_CS=m
CONFIG_COMEDI_NI_DAQ_DIO24_CS=m
# CONFIG_COMEDI_NI_LABPC_CS is not set
# CONFIG_COMEDI_NI_MIO_CS is not set
CONFIG_COMEDI_QUATECH_DAQP_CS=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_ACPI=m
CONFIG_CHROMEOS_LAPTOP=y
CONFIG_CHROMEOS_PSTORE=m
CONFIG_CHROMEOS_TBMC=y
CONFIG_CROS_EC=m
CONFIG_CROS_EC_I2C=m
CONFIG_CROS_EC_LPC=m
CONFIG_CROS_EC_PROTO=y
# CONFIG_CROS_EC_CHARDEV is not set
CONFIG_CROS_EC_LIGHTBAR=m
CONFIG_CROS_EC_DEBUGFS=m
CONFIG_CROS_EC_SENSORHUB=m
# CONFIG_CROS_EC_SYSFS is not set
CONFIG_CROS_USBPD_NOTIFY=m
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_WM831X is not set
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_CS2000_CP=m
# CONFIG_CLK_TWL6040 is not set
CONFIG_COMMON_CLK_PWM=y
# CONFIG_XILINX_VCU is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_VIRTIO_IOMMU=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
CONFIG_RPMSG_CTRL=m
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

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

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_INTEL_INT3496=y
# CONFIG_EXTCON_MAX14577 is not set
# CONFIG_EXTCON_MAX3355 is not set
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_EXTCON_USBC_CROS_EC is not set
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
# CONFIG_IIO_CONFIGFS is not set
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
CONFIG_ADXL367=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA180=m
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=m
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
CONFIG_DMARD10=y
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_IIO_CROS_EC_ACCEL_LEGACY=m
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
CONFIG_MC3230=y
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
CONFIG_MMA9551=m
CONFIG_MMA9553=m
CONFIG_MSA311=y
CONFIG_MXC4005=y
CONFIG_MXC6255=m
CONFIG_STK8312=m
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
CONFIG_AD7291=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD799X is not set
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=m
CONFIG_CC10001_ADC=m
CONFIG_ENVELOPE_DETECTOR=y
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=y
# CONFIG_LP8788_ADC is not set
CONFIG_LTC2471=m
CONFIG_LTC2485=y
# CONFIG_LTC2497 is not set
# CONFIG_MAX1363 is not set
CONFIG_MAX9611=m
# CONFIG_MCP3422 is not set
CONFIG_MEDIATEK_MT6360_ADC=y
CONFIG_MEN_Z188_ADC=y
CONFIG_MP2629_ADC=m
CONFIG_NAU7802=y
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=m
# CONFIG_QCOM_SPMI_ADC5 is not set
# CONFIG_RICHTEK_RTQ6056 is not set
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADS1015=m
CONFIG_TI_AM335X_ADC=m
# CONFIG_VF610_ADC is not set
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
CONFIG_ATLAS_EZO_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=y
CONFIG_SCD30_CORE=y
CONFIG_SCD30_I2C=y
CONFIG_SCD4X=m
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

CONFIG_IIO_CROS_EC_SENSORS_CORE=m
CONFIG_IIO_CROS_EC_SENSORS=m
# CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE is not set

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD5064=y
CONFIG_AD5380=m
# CONFIG_AD5446 is not set
# CONFIG_AD5593R is not set
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
CONFIG_DPOT_DAC=m
# CONFIG_DS4424 is not set
CONFIG_M62332=y
CONFIG_MAX517=m
CONFIG_MAX5821=m
CONFIG_MCP4725=y
CONFIG_TI_DAC5571=m
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=y
CONFIG_HDC100X=y
CONFIG_HDC2010=y
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
# CONFIG_HTU21 is not set
CONFIG_SI7005=m
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_KMX61=y
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ACPI_ALS=m
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=y
CONFIG_AL3320A=m
CONFIG_APDS9300=m
CONFIG_APDS9960=m
CONFIG_AS73211=m
CONFIG_BH1750=m
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
CONFIG_CM3605=m
# CONFIG_CM36651 is not set
CONFIG_IIO_CROS_EC_LIGHT_PROX=m
CONFIG_GP2AP002=m
# CONFIG_GP2AP020A00F is not set
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=m
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=m
CONFIG_JSA1212=y
CONFIG_RPR0521=m
# CONFIG_SENSORS_LM3533 is not set
# CONFIG_LTR501 is not set
# CONFIG_LTRF216A is not set
CONFIG_LV0104CS=y
CONFIG_MAX44000=m
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=m
CONFIG_STK3310=y
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=m
# CONFIG_TSL2583 is not set
CONFIG_TSL2591=m
# CONFIG_TSL2772 is not set
# CONFIG_TSL4531 is not set
CONFIG_US5182D=m
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
CONFIG_VEML6030=y
CONFIG_VEML6070=m
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=m
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
# CONFIG_MAG3110 is not set
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_YAMAHA_YAS530=m
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
# CONFIG_AD5272 is not set
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
CONFIG_IIO_CROS_EC_BARO=m
# CONFIG_DLHL60D is not set
CONFIG_DPS310=m
# CONFIG_HP03 is not set
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=y
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=y
# CONFIG_IIO_ST_PRESS_I2C is not set
CONFIG_T5403=m
CONFIG_HP206C=y
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=m
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=m
CONFIG_MB1232=m
CONFIG_PING=m
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
CONFIG_SX9310=m
CONFIG_SX9324=y
CONFIG_SX9360=m
# CONFIG_SX9500 is not set
CONFIG_SRF08=m
CONFIG_VCNL3020=m
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=m
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_CROS_EC is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_IQS620A=m
CONFIG_PWM_LPSS=y
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_PCA9685=m

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=m

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=y

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_RAS_CEC=y
# CONFIG_RAS_CEC_DEBUG is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_SPMI_SDAM is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=m
# CONFIG_STM_SOURCE_FTRACE is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_FPGA_DFL is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=m
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_INTEL_QEP is not set
CONFIG_MOST=m
# CONFIG_MOST_CDEV is not set
# CONFIG_MOST_SND is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_NFS_EXPORT=y
CONFIG_OVERLAY_FS_XINO_AUTO=y
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
CONFIG_FSCACHE_DEBUG=y
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_TMPFS_INODE64 is not set
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_EFIVAR_FS is not set
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
# CONFIG_ECRYPT_FS is not set
CONFIG_CRAMFS=y
# CONFIG_PSTORE is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
CONFIG_NLS_CODEPAGE_737=m
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=m
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_DLM=m
CONFIG_DLM_DEPRECATED_API=y
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
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
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
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
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=m
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARIA=m
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=m
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_POLYVAL=m
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=m
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
# CONFIG_CRYPTO_CRCT10DIF is not set
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=y
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
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=m
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=m
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST5_AVX_X86_64=y
# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=m
CONFIG_CRYPTO_NHPOLY1305_SSE2=y
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
CONFIG_CRYPTO_BLAKE2S_X86=y
CONFIG_CRYPTO_POLYVAL_CLMUL_NI=m
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
# CONFIG_CRYPTO_SHA1_SSSE3 is not set
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SM3_AVX_X86_64=y
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
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
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=m
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
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
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
CONFIG_CMA_SIZE_SEL_MIN=y
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONT_8x16=y
CONFIG_FONT_AUTOSELECT=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

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
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
CONFIG_NOINSTR_VALIDATION=y
# CONFIG_VMLINUX_MAP is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
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
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_TABLE_CHECK=y
# CONFIG_PAGE_TABLE_CHECK_ENFORCED is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
CONFIG_HAVE_ARCH_KMSAN=y
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
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
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
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
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
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_PROVE_RCU_LIST=y
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
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
CONFIG_BOOTTIME_TRACING=y
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_UPROBE_EVENTS is not set
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_HIST_TRIGGERS is not set
CONFIG_TRACE_EVENT_INJECT=y
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=m
CONFIG_TRACE_EVAL_MAP_FILE=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
CONFIG_SAMPLE_AUXDISPLAY=y
CONFIG_SAMPLE_TRACE_EVENTS=m
CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS=m
CONFIG_SAMPLE_TRACE_PRINTK=m
# CONFIG_SAMPLE_TRACE_ARRAY is not set
CONFIG_SAMPLE_KOBJECT=m
# CONFIG_SAMPLE_KPROBES is not set
CONFIG_SAMPLE_HW_BREAKPOINT=m
CONFIG_SAMPLE_KFIFO=m
# CONFIG_SAMPLE_RPMSG_CLIENT is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
CONFIG_SAMPLE_VFIO_MDEV_MDPY=m
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_SAMPLE_VFIO_MDEV_MBOCHS=m
CONFIG_SAMPLE_WATCHDOG=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
CONFIG_IO_STRICT_DEVMEM=y

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_EFI_PGT_DUMP=y
CONFIG_DEBUG_TLBFLUSH=y
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
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DEBUG_VIRTUAL is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--lnVN3j5N0cVXkHYR
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='trinity'
	export testcase='trinity'
	export category='functional'
	export need_memory='300MB'
	export runtime=300
	export job_origin='trinity.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='peterz-queue/sched/idle'
	export commit='1cebdae1876681bb4dd2c308d0c54c6c9c842370'
	export kconfig='x86_64-randconfig-a003-20221114'
	export repeat_to=6
	export nr_vm=300
	export submit_id='6374154f8d57a8747ec914ae'
	export job_file='/lkp/jobs/scheduled/vm-meta-307/trinity-group-04-300s-yocto-x86_64-minimal-20190520.cgz-1cebdae1876681bb4dd2c308d0c54c6c9c842370-20221116-29822-8qh7og-5.yaml'
	export id='682db41526dafa6d815fd417f3981189fd56bbc4'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='yocto-x86_64-minimal-20190520.cgz'
	export compiler='gcc-11'
	export enqueue_time='2022-11-16 06:40:16 +0800'
	export _id='637415668d57a8747ec914b0'
	export _rt='/result/trinity/group-04-300s/vm-snb/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/trinity/group-04-300s/vm-snb/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370/3'
	export scheduler_version='/lkp/lkp/.src-20221115-214703'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/yocto/yocto-x86_64-minimal-20190520.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/trinity/group-04-300s/vm-snb/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370/vmlinuz-6.1.0-rc5-00033-g1cebdae18766
branch=peterz-queue/sched/idle
job=/lkp/jobs/scheduled/vm-meta-307/trinity-group-04-300s-yocto-x86_64-minimal-20190520.cgz-1cebdae1876681bb4dd2c308d0c54c6c9c842370-20221116-29822-8qh7og-5.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a003-20221114
commit=1cebdae1876681bb4dd2c308d0c54c6c9c842370
vmalloc=256M initramfs_async=0 page_owner=on
initcall_debug
max_uptime=2100
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
	export modules_initrd='/pkg/linux/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370/modules.cgz'
	export bm_initrd='/osimage/pkg/debian-x86_64-20180403.cgz/trinity-static-x86_64-x86_64-1c734c75-1_2020-01-06.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export stop_repeat_if_found='dmesg.WARNING:at_include/trace/events/preemptirq.h:#trace_hardirqs_off'
	export kbuild_queue_analysis=1
	export meta_host='vm-meta-307'
	export kernel='/pkg/linux/x86_64-randconfig-a003-20221114/gcc-11/1cebdae1876681bb4dd2c308d0c54c6c9c842370/vmlinuz-6.1.0-rc5-00033-g1cebdae18766'
	export dequeue_time='2022-11-16 06:40:47 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-307/trinity-group-04-300s-yocto-x86_64-minimal-20190520.cgz-1cebdae1876681bb4dd2c308d0c54c6c9c842370-20221116-29822-8qh7og-5.cgz'

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

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='group-04' $LKP_SRC/tests/wrapper trinity
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time trinity.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--lnVN3j5N0cVXkHYR
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--lnVN3j5N0cVXkHYR
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="trinity"

Seeding trinity by 823653 based on vm-snb/yocto-x86_64-minimal-20190520.cgz/x86_64-randconfig-a003-20221114
2022-11-15 22:41:36 trinity -q -q -l off -s 823653 -N 999999999 -c accept4 -c alarm -c bpf -c clock_getres -c clock_settime -c copy_file_range -c epoll_create -c epoll_create1 -c exit_group -c fadvise64_64 -c fanotify_mark -c fchmodat -c finit_module -c fremovexattr -c getxattr -c keyctl -c llistxattr -c mq_unlink -c msgget -c munlock -c nice -c olduname -c open -c pidfd_send_signal -c pipe2 -c pkey_alloc -c pkey_free -c pkey_mprotect -c poll -c ppoll -c process_vm_readv -c restart_syscall -c rt_sigqueueinfo -c rt_sigtimedwait -c sched_setscheduler -c sendmsg -c set_robust_list -c setfsuid -c setrlimit -c setuid -c shmat -c sigpending -c statfs -c statx -c stime -c tee -c timer_gettime -c truncate -c vhangup -c write -X
Trinity 2019.06  Dave Jones <davej@codemonkey.org.uk>
shm:0x7f75ed84d000-0x7f75fa449d00 (4 pages)
[main] Marking syscall accept4 (64bit:288 32bit:364) as to be enabled.
[main] alarm is marked as AVOID. Skipping
[main] alarm is marked as AVOID. Skipping
[main] Marking syscall alarm (64bit:37 32bit:27) as to be enabled.
[main] Marking syscall bpf (64bit:321 32bit:357) as to be enabled.
[main] Marking syscall clock_getres (64bit:229 32bit:266) as to be enabled.
[main] Marking syscall clock_settime (64bit:227 32bit:264) as to be enabled.
[main] Marking syscall copy_file_range (64bit:326 32bit:377) as to be enabled.
[main] Marking syscall epoll_create (64bit:213 32bit:254) as to be enabled.
[main] Marking syscall epoll_create1 (64bit:291 32bit:329) as to be enabled.
[main] exit_group is marked as AVOID. Skipping
[main] exit_group is marked as AVOID. Skipping
[main] Marking syscall exit_group (64bit:231 32bit:252) as to be enabled.
[main] Marking 32-bit syscall fadvise64_64 (272) as to be enabled.
[main] Marking syscall fanotify_mark (64bit:301 32bit:339) as to be enabled.
[main] Marking syscall fchmodat (64bit:268 32bit:306) as to be enabled.
[main] Marking syscall finit_module (64bit:313 32bit:350) as to be enabled.
[main] Marking syscall fremovexattr (64bit:199 32bit:237) as to be enabled.
[main] Marking syscall getxattr (64bit:191 32bit:229) as to be enabled.
[main] Marking syscall keyctl (64bit:250 32bit:288) as to be enabled.
[main] Marking syscall llistxattr (64bit:195 32bit:233) as to be enabled.
[main] Marking syscall mq_unlink (64bit:241 32bit:278) as to be enabled.
[main] Marking syscall msgget (64bit:68 32bit:393) as to be enabled.
[main] Marking syscall munlock (64bit:150 32bit:151) as to be enabled.
[main] Marking 32-bit syscall nice (34) as to be enabled.
[main] Marking 32-bit syscall olduname (59) as to be enabled.
[main] Marking syscall open (64bit:2 32bit:5) as to be enabled.
[main] Marking syscall pidfd_send_signal (64bit:424 32bit:417) as to be enabled.
[main] Marking syscall pipe2 (64bit:293 32bit:331) as to be enabled.
[main] Marking syscall pkey_alloc (64bit:330 32bit:381) as to be enabled.
[main] Marking syscall pkey_free (64bit:331 32bit:382) as to be enabled.
[main] Marking syscall pkey_mprotect (64bit:329 32bit:380) as to be enabled.
[main] Marking syscall poll (64bit:7 32bit:168) as to be enabled.
[main] Marking syscall ppoll (64bit:271 32bit:309) as to be enabled.
[main] Marking syscall process_vm_readv (64bit:310 32bit:347) as to be enabled.
[main] restart_syscall is marked as AVOID. Skipping
[main] restart_syscall is marked as AVOID. Skipping
[main] Marking syscall restart_syscall (64bit:219 32bit:0) as to be enabled.
[main] rt_sigqueueinfo is marked as AVOID. Skipping
[main] rt_sigqueueinfo is marked as AVOID. Skipping
[main] Marking syscall rt_sigqueueinfo (64bit:129 32bit:178) as to be enabled.
[main] Marking syscall rt_sigtimedwait (64bit:128 32bit:177) as to be enabled.
[main] Marking syscall sched_setscheduler (64bit:144 32bit:156) as to be enabled.
[main] Marking syscall sendmsg (64bit:46 32bit:370) as to be enabled.
[main] Marking syscall set_robust_list (64bit:273 32bit:311) as to be enabled.
[main] Marking syscall setfsuid (64bit:122 32bit:215) as to be enabled.
[main] Marking syscall setrlimit (64bit:160 32bit:75) as to be enabled.
[main] Marking syscall setuid (64bit:105 32bit:213) as to be enabled.
[main] Marking syscall shmat (64bit:30 32bit:391) as to be enabled.
[main] Marking 32-bit syscall sigpending (73) as to be enabled.
[main] Marking syscall statfs (64bit:137 32bit:18) as to be enabled.
[main] Marking syscall statx (64bit:332 32bit:383) as to be enabled.
[main] Marking 32-bit syscall stime (25) as to be enabled.
[main] Marking syscall tee (64bit:276 32bit:315) as to be enabled.
[main] Marking syscall timer_gettime (64bit:224 32bit:261) as to be enabled.
[main] Marking syscall truncate (64bit:76 32bit:92) as to be enabled.
[main] vhangup is marked as AVOID. Skipping
[main] vhangup is marked as AVOID. Skipping
[main] Marking syscall vhangup (64bit:153 32bit:111) as to be enabled.
[main] Marking syscall write (64bit:1 32bit:4) as to be enabled.
[main] Using user passed random seed: 823653.
[main] 32-bit syscalls: 50 enabled, 379 disabled.  64-bit syscalls: 45 enabled, 391 disabled.
--dropprivs is still in development, and really shouldn't be used unless you're helping development. Expect crashes.
Going to run as user nobody (uid:65534 gid:65534)
ctrl-c now unless you really know what you are doing.
Continuing in 10 seconds.
Continuing in 9 seconds.
Continuing in 8 seconds.
Continuing in 7 seconds.
Continuing in 6 seconds.
Continuing in 5 seconds.
Continuing in 4 seconds.
Continuing in 3 seconds.
Continuing in 2 seconds.
Continuing in 1 seconds.
[main] Using pid_max = 4096
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] futex: 0 owner:0 global:1
[main] Reserved/initialized 5 futexes.
[main] Added 14 filenames from /dev
[main] Added 15731 filenames from /proc
[main] Added 11080 filenames from /sys
[main] Enabled 14/14 fd providers. initialized:14.
[main] Opened ftrace tracing_on as fd 434
[main] Ftrace log will be dumped to /boot/trace.txt
[child2:3687] Dumped trace to /boot/trace.txt
[child3:3688] Dumped trace to /boot/trace.txt
[main] Dumped trace to /boot/trace.txt
[main] kernel became tainted! (512/0) Last seed was 823653
trinity: Detected kernel tainting. Last seed was 823653
[main] exit_reason=7, but 2 children still running.
[main] Bailing main loop because kernel became tainted..
[main] Dumped trace to /boot/trace.txt
[main] Ran 2 syscalls. Successes: 0  Failures: 0

--lnVN3j5N0cVXkHYR--
