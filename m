Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255A7E
	for <oe-lkp@lists.linux.dev>; Mon,  3 Apr 2023 01:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680485374; x=1712021374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tol7VOKgOmxdPzdu+wKfZHrbtzXeN33kFWE94hIp3B4=;
  b=BxYA1vMynKufYcWmT6GQdEYzmpj2nd092xCgJMjhflX4PVvJBBq7WJlm
   QD08U74VhhXESw99ksxIvttKVSpLOQhWqRbzuCzUMTlm53Iuvrz4I1I+J
   VcFj4tUxtD4Ng1WNcBX5Z5X7Vg9PbjNqgPLucFm8N7ABUwi+nftAhMVeO
   4/ZbIOLU8UmO3wRHNlS63WeDJPyGptuR4IIjCWKWk+kEnXEMTbTo1YOJ/
   fRqum8RDdnUy50+++UOOrk2YZHDELflhNaiI1obgAlwTR9PZqcQODy43g
   /vO5I19KQ651C6D00Cpo6VXANLLD903AxT0xlvPuWZQ8BADLToRevlgZw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404541118"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="404541118"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 18:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="716119663"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="xz'341?yaml'341?scan'341,208,341";a="716119663"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP; 02 Apr 2023 18:29:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 18:29:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 18:29:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 18:29:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 18:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQGL0+OjfImNg5/2CBy2gnvL+jJBxj7Kt8cJfFEOeTOslk2ZBl94zDWgCyHTs8zYQpj37Wq5cg/+8oFzzof/q0jMUwCErD/Y/suGZfuPYN6Taheq5b8ggluCK/Tkgh9CsQH2LG6/BgJ35X9bFO+j8FvmJWJcz943OQIgx+piD5C32hI8C07UVyPMcyQXYNqIvuxM7HYHlbeVY77VwTIlR2TXiTxTxuyt58TGJTwkIHLUts09o7+e4IllHPkTzFvbgMx/g2Y/MnNJzCjfkkMpt+sKncDYYXcVDIRFLx8mtF3uq0O7v9KA0UaFb5ITjdaW1KOdrQ0j4uJj0U4g9/msSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXFirg+W7kfDvB9CyB06/OMdWK/Qt3Y1yoLDtxGKxTE=;
 b=UWEYeDvYIzbecYAhT/A/0Bw6f/9wS7JXziB3cB01ZVVwIHhGSTVhRTOuPCcmRxWYE9SzD3bgEuaBtOnQGhWTaGJbpzUpyKyHhEVBTswLpN7q5TxxBt7qZ6vwFdZ5MKrVv6geMROhBu/LU1/EsIGhAsAx35115nMNK7MdK7DjBoZABm/WmdIytSWdgr9bqtXcLlHnxmYCUH8dayb2sTqcg/Ej4w3vxTl4951AlnTqYNS5CxilEFPTnn+uEjah5AEY8DNuxxJoxToU5cA6QH35kyqC28m4iIJHq/AlpDgVzZtGOsI/o+E8raTw+V7WPNBRVkROqHyIyh4OWeVnB/dyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 01:29:26 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 01:29:26 +0000
Date: Mon, 3 Apr 2023 09:29:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sean Paul <sean@poorly.run>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: [drm-msm:msm-next] [drm/atomic]  d39e48ca80:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202304030854.aa97f706-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="wGkseTiVgtpxYaHb"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b1087b-7b1d-4310-dae8-08db33e2dc0d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lVBUuEG9pHBLGsxMYEvG2A0FV0cX25B6O1Gm62ZQZ0GSSyqEC9i76zQJsctXXNOTnlZbuwb78OrtV84hQj55kiy0EBrPTOWO3v5NfA+O20+3sTLkT7BgV0XOBxyaue7G4BqVE8BUnc/u7uHkJWfJQly26Cv9zydqQl5pZ1MzhDUddXfRYJ0CmaRvAsnItBov8D+46c1it/1EX0Sqr9S2H5ZP80qmpL0bjgFFnlla+b02rSnnXLlF77SKEDmpC5oaOS37A0o3E7Tpsv+X+ej0a+BpQK2ziYgdr0mGsBB3vZBJWTZ6sFy5N715XxywchXrC/PhWrIvNkWgMJ2nLRD76cfNb0wIy9JzMzD3BlP3gRErREwTqmNfZNnd0OO3bvl9qS7FFs2ueaZtD+uC99YmKo5hGvGnzZBnSNCJx1PMs9JTHuzxCdR8hzlz7rlOcayD7Cfrdb7Pty4bexGF69IIgDFIErMHvVSea/3Lik5ses0BexTtjaFhpKQWM/PtqAUP7v3x6DV27H75b4/SY1vUSJjbd6yNHa6L0LxL/2cbZoJXPn1N4AzmEkkeaXS4ZTdUHoldZ+Axyw9jnXckTm4KvtOTc8G0oxdrnZuv43IXGyNsnPrYsKYlk88mJSP/4aYNycPT3peWW6K45X/3KRtCXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(4326008)(8676002)(235185007)(66476007)(478600001)(66556008)(5660300002)(66946007)(8936002)(41300700001)(316002)(45080400002)(186003)(2906002)(44144004)(6512007)(966005)(6486002)(1076003)(107886003)(26005)(6506007)(21490400003)(6916009)(83380400001)(2616005)(38100700002)(82960400001)(86362001)(36756003)(6666004)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JchAJ04LqsAW3A0SUOw5ZXdXCT/7kmvYx11YT8UoFXJ1tw0VQHemA/nHgiXU?=
 =?us-ascii?Q?nYAmvWtJ8OCVwrbfsEfCms366s/LmGOs2JBWVWXIEWubRLFiy7hOuGDh9pMH?=
 =?us-ascii?Q?hDKlrdzm610nC5tcj5ckZp726WHB1Yo2PIa6va6SJ2U/r81uED45jO7ZUe2c?=
 =?us-ascii?Q?Kuj4cEfc/MwZznMT3rNEbUc4fWvKeAYpJN9sy5Pf0tXi3CahLz5fcaQhPBLA?=
 =?us-ascii?Q?TOMxAF5zMHZ/Zt3eN7wnwmOeypDUVcVNY2Irq2PfQeYdgJ0xbbe64m3YUXTS?=
 =?us-ascii?Q?/ruv/4Slfu7j6OX/EwbodGq9nS71IwEdl6DKiMBD0XoSJ/8YcifV52gGhIAT?=
 =?us-ascii?Q?wWQx0EzkVvVda2HqH453edpDq0QyGc3ZxY3lm21yMJtVef0kMqmGqUUh/VkQ?=
 =?us-ascii?Q?RM3jR+uhquYWA8tX+YN/bie/ymkq/QEZiC79J63oSO0ejyTOiSicqv4jpwtW?=
 =?us-ascii?Q?zoOaNt5j/DZ/bUEv9Xw8lU3etG+AR7Ty/PceLmYbyN/8V9xoO8JM//+StYFv?=
 =?us-ascii?Q?j9RtcMCC3ThvbGYR/a3IR0c8bT3IN/PNPyTUSiSCIwN8gV5PO9hJqacH2av8?=
 =?us-ascii?Q?W8SlR6QX5lppMbuE4Vkghi9ssiC5s2MvQF7IsoACdvIqzTcwhXPB6V26Q+au?=
 =?us-ascii?Q?16jjehj8d3gjBzvZc907jOA6EVccOz1RKrhh2RUnqz4ORE3phm2Xopk+NFKK?=
 =?us-ascii?Q?oRj7urctTiISxq5n07VYJQUmfUa0S2jjx478QuCAJDVN5Hwi+WEQFF8CGrW8?=
 =?us-ascii?Q?+XLmqKQ6jmIy2xUWeWu6O8OhWMbaUJh+BTbKrXTP7got88bgqBPktP/CV3bf?=
 =?us-ascii?Q?Q0PMtRStMeyFA6dDLraC76uLPJnHEbCdCJqhizKhXBxdToVt85ZYK5rQTnpB?=
 =?us-ascii?Q?aBkzCkCkQlerz6xeY2+WLhebmDJhlM8+DJO55NgtLZQKI+ozD3lUXcpJ2wVv?=
 =?us-ascii?Q?qIuAD/lfbn8SoMh0SXZNU51gcvFe0f/cdF7boeHakE3YOe/6jAtLg2YJzrWo?=
 =?us-ascii?Q?P1LeoNA+JvQflN9ZzarBOffniwiD3SW+8lgjoulYWOWeBpWji+EN6F1iH0AO?=
 =?us-ascii?Q?wdvt9MnJQ1A+4nnAGG6gso6IY8D1LvZkGsdQEuxv+Ia5QWsGwI0jPvGwqExv?=
 =?us-ascii?Q?Da8yI3L+BesOCGVIAtZE56Nb4QWyEuF8iH3cxRsJLX7JQ3Wh+fEHtt+jMxZ0?=
 =?us-ascii?Q?iy/4T3kgpP9YlYq/Hr4IajgUBmkB4ERcNZBlD6YfdUTqudOa1t8nRfmnFnyu?=
 =?us-ascii?Q?8s8XCPHMr9KpqBiEegN9L/d4lcCRGEEnISAIMKGCjTbt2+2AqvHlUPllf8LJ?=
 =?us-ascii?Q?gtbau6uPTfF54glRJQ5ltxQoAmjndUOlulZ53ZDJXG2piSipZZoKATF+jvG6?=
 =?us-ascii?Q?6BJT4fsrYoQkw+ataT7a9OuXZRntdX4emdp1IyBgHJApy2ledK3jC2iCu/La?=
 =?us-ascii?Q?97MTHbupf6cxR2TOGZc+xGmBb2uhrZKcfP1SGux69Pjq4F+XEFcNWOy8Ompw?=
 =?us-ascii?Q?fcvB2OVg/wzk64elZ+WcDPaIKaJjVrZEn3y3HEVX+wopBSXbqdwkdVgcQx82?=
 =?us-ascii?Q?7QGzdCxy6VM/x939TWiC+K04JQanszpCBUP+K/q/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b1087b-7b1d-4310-dae8-08db33e2dc0d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 01:29:25.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuxpIX7l0WVOMCRSJ/54jRynNXeph8vuCwBLE+mJKDCtmaz1GKQ6EoUfrmIIbpButUnAgY5FgRXH1DMKtlvDBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
X-OriginatorOrg: intel.com

--wGkseTiVgtpxYaHb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Greeting,

FYI, we noticed BUG:kernel_NULL_pointer_dereference,address due to commit (built with gcc-11):

commit: d39e48ca80c0960b039cb38633957f0040f63e1a ("drm/atomic-helper: Set fence deadline for vblank")
https://gitlab.freedesktop.org/drm/msm.git msm-next

[test failed on linux-next/master 4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5]

in testcase: will-it-scale
version: will-it-scale-x86_64-a34a85c-1_20220601
with following parameters:

	nr_task: 16
	mode: process
	test: fallocate2
	cpufreq_governor: performance

test-description: Will It Scale takes a testcase and runs it from 1 through to n parallel copies to see if the testcase will scale. It builds both a process and threads based test in order to see any differences between the two.
test-url: https://github.com/antonblanchard/will-it-scale


on test machine: 104 threads 2 sockets (Skylake) with 192G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


+---------------------------------------------+------------+------------+
|                                             | b2c077d001 | d39e48ca80 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 10         | 0          |
| boot_failures                               | 0          | 10         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 10         |
| Oops:#[##]                                  | 0          | 10         |
| RIP:drm_crtc_next_vblank_start[drm]         | 0          | 10         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 10         |
+---------------------------------------------+------------+------------+


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202304030854.aa97f706-oliver.sang@intel.com


[   35.751108][  T801] BUG: kernel NULL pointer dereference, address: 0000000000000074
[   35.751110][  T801] #PF: supervisor read access in kernel mode
[   35.751111][  T801] #PF: error_code(0x0000) - not-present page
[   35.751112][  T801] PGD 0 P4D 0
[   35.751115][  T801] Oops: 0000 [#1] SMP PTI
[   35.751117][  T801] CPU: 0 PID: 801 Comm: kworker/0:2 Not tainted 6.3.0-rc2-00008-gd39e48ca80c0 #1
[   35.751120][  T801] Hardware name: Intel Corporation S2600BT/S2600BT, BIOS SE5C620.86B.1D.01.0147.121320181755 12/13/2018
[   35.751121][  T801] Workqueue: events work_for_cpu_fn
[ 35.751128][ T801] RIP: 0010:drm_crtc_next_vblank_start (drivers/gpu/drm/drm_vblank.c:1003) drm
[ 35.751177][ T801] Code: 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 53 48 8d 0c c0 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3d 8b 43 78 85 c0 74 36 31 d2 48 89 f5 e8 01 ff
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	f3 0f 1e fa          	endbr64 
   7:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   c:	8b 87 90 00 00 00    	mov    0x90(%rdi),%eax
  12:	48 8b 17             	mov    (%rdi),%rdx
  15:	55                   	push   %rbp
  16:	53                   	push   %rbx
  17:	48 8d 0c c0          	lea    (%rax,%rax,8),%rcx
  1b:	48 8d 1c 48          	lea    (%rax,%rcx,2),%rbx
  1f:	48 c1 e3 04          	shl    $0x4,%rbx
  23:	48 03 9a 40 01 00 00 	add    0x140(%rdx),%rbx
  2a:*	8b 53 74             	mov    0x74(%rbx),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	74 3d                	je     0x6e
  31:	8b 43 78             	mov    0x78(%rbx),%eax
  34:	85 c0                	test   %eax,%eax
  36:	74 36                	je     0x6e
  38:	31 d2                	xor    %edx,%edx
  3a:	48 89 f5             	mov    %rsi,%rbp
  3d:	e8                   	.byte 0xe8
  3e:	01 ff                	add    %edi,%edi

Code starting with the faulting instruction
===========================================
   0:	8b 53 74             	mov    0x74(%rbx),%edx
   3:	85 d2                	test   %edx,%edx
   5:	74 3d                	je     0x44
   7:	8b 43 78             	mov    0x78(%rbx),%eax
   a:	85 c0                	test   %eax,%eax
   c:	74 36                	je     0x44
   e:	31 d2                	xor    %edx,%edx
  10:	48 89 f5             	mov    %rsi,%rbp
  13:	e8                   	.byte 0xe8
  14:	01 ff                	add    %edi,%edi
[   35.751179][  T801] RSP: 0018:ffffc9000eaafa48 EFLAGS: 00010246
[   35.751181][  T801] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   35.751182][  T801] RDX: ffff888140798000 RSI: ffffc9000eaafa60 RDI: ffff888140798c08
[   35.751183][  T801] RBP: 0000000000000000 R08: 0000000000000000 R09: 000fffffffffffff
[   35.751184][  T801] R10: 0000000000000008 R11: ffff88b03ffc8000 R12: 0000000000000000
[   35.751185][  T801] R13: ffff88810a752d00 R14: ffff888140798000 R15: ffff8881b4d247b0
[   35.751187][  T801] FS:  0000000000000000(0000) GS:ffff8897e0400000(0000) knlGS:0000000000000000
[   35.751188][  T801] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.751189][  T801] CR2: 0000000000000074 CR3: 00000001208d2003 CR4: 00000000007706f0
[   35.751191][  T801] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   35.751192][  T801] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   35.751193][  T801] PKRU: 55555554
[   35.751194][  T801] Call Trace:
[   35.751196][  T801]  <TASK>
[ 35.751198][ T801] drm_atomic_helper_wait_for_fences (drivers/gpu/drm/drm_atomic_helper.c:1531 drivers/gpu/drm/drm_atomic_helper.c:1578) drm_kms_helper
[ 35.751217][ T801] drm_atomic_helper_commit (drivers/gpu/drm/drm_atomic_helper.c:2007 drivers/gpu/drm/drm_atomic_helper.c:1979) drm_kms_helper
[ 35.751233][ T801] drm_atomic_commit (drivers/gpu/drm/drm_atomic.c:1443 (discriminator 4)) drm
[ 35.751264][ T801] ? __pfx___drm_printfn_info (drivers/gpu/drm/drm_print.c:180) drm
[ 35.751303][ T801] drm_client_modeset_commit_atomic (drivers/gpu/drm/drm_client_modeset.c:1045) drm
[ 35.751339][ T801] drm_client_modeset_commit_locked (drivers/gpu/drm/drm_client_modeset.c:1148) drm
[ 35.751373][ T801] drm_client_modeset_commit (drivers/gpu/drm/drm_client_modeset.c:1176) drm
[ 35.751406][ T801] drm_fb_helper_set_par (drivers/gpu/drm/drm_fb_helper.c:254 drivers/gpu/drm/drm_fb_helper.c:229 drivers/gpu/drm/drm_fb_helper.c:1644) drm_kms_helper
[ 35.751423][ T801] fbcon_init (drivers/video/fbdev/core/fbcon.c:1093) 
[ 35.751428][ T801] visual_init (drivers/tty/vt/vt.c:1018) 
[ 35.751433][ T801] do_bind_con_driver+0x19e/0x3f0 
[ 35.751437][ T801] do_take_over_console (drivers/tty/vt/vt.c:4222) 
[ 35.751439][ T801] do_fbcon_takeover (drivers/video/fbdev/core/fbcon.c:533) 
[ 35.751441][ T801] fbcon_fb_registered (drivers/video/fbdev/core/fbcon.c:3002 drivers/video/fbdev/core/fbcon.c:3022) 
[ 35.751443][ T801] do_register_framebuffer (drivers/video/fbdev/core/fbmem.c:1600) 
[ 35.751447][ T801] register_framebuffer (drivers/video/fbdev/core/fbmem.c:1675) 
[ 35.751449][ T801] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:2181) drm_kms_helper
[ 35.751466][ T801] drm_fbdev_client_hotplug (drivers/gpu/drm/drm_fbdev_generic.c:384) drm_kms_helper
[ 35.751482][ T801] drm_fbdev_generic_setup (drivers/gpu/drm/drm_fbdev_generic.c:451) drm_kms_helper
[ 35.751498][ T801] ast_pci_probe (drivers/gpu/drm/ast/ast_drv.c:129 drivers/gpu/drm/ast/ast_drv.c:106) ast
[ 35.751507][ T801] local_pci_probe (drivers/pci/pci-driver.c:324) 
[ 35.751511][ T801] work_for_cpu_fn (kernel/workqueue.c:5324) 
[ 35.751514][ T801] process_one_work (kernel/workqueue.c:2390) 
[ 35.751517][ T801] ? __pfx_worker_thread (kernel/workqueue.c:2480) 
[ 35.751519][ T801] worker_thread (include/linux/list.h:292 kernel/workqueue.c:2450 kernel/workqueue.c:2542) 
[ 35.751521][ T801] ? __pfx_worker_thread (kernel/workqueue.c:2480) 
[ 35.751522][ T801] kthread (kernel/kthread.c:376) 
[ 35.751527][ T801] ? __pfx_kthread (kernel/kthread.c:331) 
[ 35.751530][ T801] ret_from_fork (arch/x86/entry/entry_64.S:308) 
[   35.751538][  T801]  </TASK>
[   35.751539][  T801] Modules linked in: sha512_ssse3 rapl ast(+) nvme_core ahci(+) acpi_ipmi intel_cstate drm_shmem_helper t10_pi libahci ipmi_si drm_kms_helper mei_me crc64_rocksoft_generic syscopyarea ioatdma ipmi_devintf crc64_rocksoft sysfillrect intel_uncore crc64 libata joydev mei sysimgblt dca wmi ipmi_msghandler acpi_pad acpi_power_meter drm fuse ip_tables
[   35.751558][  T801] CR2: 0000000000000074
[   35.751560][  T801] ---[ end trace 0000000000000000 ]---
[   35.766788][  T801] pstore: backend (erst) writing error (-28)
[ 35.766791][ T801] RIP: 0010:drm_crtc_next_vblank_start (drivers/gpu/drm/drm_vblank.c:1003) drm
[ 35.766837][ T801] Code: 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 53 48 8d 0c c0 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3d 8b 43 78 85 c0 74 36 31 d2 48 89 f5 e8 01 ff
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	f3 0f 1e fa          	endbr64 
   7:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   c:	8b 87 90 00 00 00    	mov    0x90(%rdi),%eax
  12:	48 8b 17             	mov    (%rdi),%rdx
  15:	55                   	push   %rbp
  16:	53                   	push   %rbx
  17:	48 8d 0c c0          	lea    (%rax,%rax,8),%rcx
  1b:	48 8d 1c 48          	lea    (%rax,%rcx,2),%rbx
  1f:	48 c1 e3 04          	shl    $0x4,%rbx
  23:	48 03 9a 40 01 00 00 	add    0x140(%rdx),%rbx
  2a:*	8b 53 74             	mov    0x74(%rbx),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	74 3d                	je     0x6e
  31:	8b 43 78             	mov    0x78(%rbx),%eax
  34:	85 c0                	test   %eax,%eax
  36:	74 36                	je     0x6e
  38:	31 d2                	xor    %edx,%edx
  3a:	48 89 f5             	mov    %rsi,%rbp
  3d:	e8                   	.byte 0xe8
  3e:	01 ff                	add    %edi,%edi

Code starting with the faulting instruction
===========================================
   0:	8b 53 74             	mov    0x74(%rbx),%edx
   3:	85 d2                	test   %edx,%edx
   5:	74 3d                	je     0x44
   7:	8b 43 78             	mov    0x78(%rbx),%eax
   a:	85 c0                	test   %eax,%eax
   c:	74 36                	je     0x44
   e:	31 d2                	xor    %edx,%edx
  10:	48 89 f5             	mov    %rsi,%rbp
  13:	e8                   	.byte 0xe8
  14:	01 ff                	add    %edi,%edi


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



--wGkseTiVgtpxYaHb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc2-00008-gd39e48ca80c0"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.3.0-rc2 Kernel Configuration
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
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

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
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
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
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
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
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
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
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
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
CONFIG_INITRAMFS_PRESERVE_MTIME=y
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
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
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
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
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
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_CALL_PADDING=y
CONFIG_HAVE_CALL_THUNKS=y
CONFIG_CALL_THUNKS=y
CONFIG_PREFIX_SYMBOLS=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_RETPOLINE=y
CONFIG_RETHUNK=y
CONFIG_CPU_UNRET_ENTRY=y
CONFIG_CALL_DEPTH_TRACKING=y
# CONFIG_CALL_THUNKS_DEBUG is not set
CONFIG_CPU_IBPB_ENTRY=y
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
CONFIG_PMIC_OPREGION=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

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
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

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
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
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
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
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
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
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
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
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
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
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
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

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

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_MQPRIO_LIB=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
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
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
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
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
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

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
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
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

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
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
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
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_AHCI_DWC is not set
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
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_PARPORT is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
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
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
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
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
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
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
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
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
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
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
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
# CONFIG_MSE102X is not set
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
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
# CONFIG_CAN_SJA1000_PLATFORM is not set
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
# CONFIG_ATH12K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_PURELIFI=y
# CONFIG_PLFXLC is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
# CONFIG_RTW89 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_SILABS=y
# CONFIG_WFX is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
# CONFIG_MAC80211_HWSIM is not set
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_HYPERV_NET=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
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
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
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
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

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
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
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
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_PCI1XXXX=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
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
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

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
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
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
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TDA38640 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
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
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
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
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

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
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
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
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
# CONFIG_NVSW_SN2201 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
# CONFIG_AMD_HSMP is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_SVM=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
# CONFIG_IOMMUFD is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
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

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
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
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_APPARMOR=y
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf"

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
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
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
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
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
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
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
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
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
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
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
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
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
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
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
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
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
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
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
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
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
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_OBJTOOL=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
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
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
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
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
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
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
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

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

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
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
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
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
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
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
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
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
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
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
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
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
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
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--wGkseTiVgtpxYaHb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='will-it-scale'
	export testcase='will-it-scale'
	export category='benchmark'
	export nr_task=16
	export job_origin='will-it-scale-part1.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-skl-fpga01'
	export tbox_group='lkp-skl-fpga01'
	export submit_id='642704c417608d2c09fcab20'
	export job_file='/lkp/jobs/scheduled/lkp-skl-fpga01/will-it-scale-performance-process-16-fallocate2-debian-11.1-x86_64-20220510.cgz-d39e48ca80c0960b039cb38633957f0040f63e1a-20230401-11273-b2cw91-1.yaml'
	export id='f0a6f37deeaf3a1f7d1a79ae9f0e9320912ed0ed'
	export queuer_version='/zday/lkp'
	export model='Skylake'
	export nr_node=2
	export nr_cpu=104
	export memory='192G'
	export kernel_cmdline_hw='acpi_rsdp=0x6b447014'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_CVWL34300015800RGN-part1'
	export commit='d39e48ca80c0960b039cb38633957f0040f63e1a'
	export ucode='0x2006d05'
	export kconfig='x86_64-rhel-8.3'
	export enqueue_time='2023-04-01 00:05:24 +0800'
	export _id='642704c417608d2c09fcab20'
	export _rt='/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='26b1c3709ddc924461221ffd397771b709658963'
	export base_commit='197b6b60ae7bc51dd0814953c562833143b292aa'
	export branch='linux-next/master'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export result_root='/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/3'
	export scheduler_version='/lkp/lkp/.src-20230331-174129'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/vmlinuz-6.3.0-rc2-00008-gd39e48ca80c0
branch=linux-next/master
job=/lkp/jobs/scheduled/lkp-skl-fpga01/will-it-scale-performance-process-16-fallocate2-debian-11.1-x86_64-20220510.cgz-d39e48ca80c0960b039cb38633957f0040f63e1a-20230401-11273-b2cw91-1.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3
commit=d39e48ca80c0960b039cb38633957f0040f63e1a
initcall_debug
nmi_watchdog=0
acpi_rsdp=0x6b447014
max_uptime=2100
LKP_SERVER=internal-lkp-server
nokaslr
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/will-it-scale_20220823.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/will-it-scale-x86_64-a34a85c-1_20220601.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230326.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-da8e7da11e4b-1_20230326.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220804.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='6.3.0-rc4'
	export repeat_to=6
	export schedule_notify_address=
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/vmlinuz-6.3.0-rc2-00008-gd39e48ca80c0'
	export dequeue_time='2023-04-01 00:12:55 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-fpga01/will-it-scale-performance-process-16-fallocate2-debian-11.1-x86_64-20220510.cgz-d39e48ca80c0960b039cb38633957f0040f63e1a-20230401-11273-b2cw91-1.cgz'

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

	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper uptime
	run_monitor $LKP_SRC/monitors/wrapper iostat
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
	run_monitor $LKP_SRC/monitors/wrapper proc-stat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper slabinfo
	run_monitor $LKP_SRC/monitors/wrapper interrupts
	run_monitor $LKP_SRC/monitors/wrapper lock_stat
	run_monitor lite_mode=1 $LKP_SRC/monitors/wrapper perf-sched
	run_monitor $LKP_SRC/monitors/wrapper softirqs
	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
	run_monitor $LKP_SRC/monitors/wrapper diskstats
	run_monitor $LKP_SRC/monitors/wrapper nfsstat
	run_monitor $LKP_SRC/monitors/wrapper cpuidle
	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
	run_monitor $LKP_SRC/monitors/wrapper turbostat
	run_monitor $LKP_SRC/monitors/wrapper sched_debug
	run_monitor $LKP_SRC/monitors/wrapper perf-stat
	run_monitor $LKP_SRC/monitors/wrapper mpstat
	run_monitor debug_mode=0 $LKP_SRC/monitors/no-stdout/wrapper perf-profile
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test mode='process' test='fallocate2' $LKP_SRC/tests/wrapper will-it-scale
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env mode='process' test='fallocate2' $LKP_SRC/stats/wrapper will-it-scale
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper uptime
	$LKP_SRC/stats/wrapper iostat
	$LKP_SRC/stats/wrapper vmstat
	$LKP_SRC/stats/wrapper numa-numastat
	$LKP_SRC/stats/wrapper numa-vmstat
	$LKP_SRC/stats/wrapper numa-meminfo
	$LKP_SRC/stats/wrapper proc-vmstat
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper slabinfo
	$LKP_SRC/stats/wrapper interrupts
	$LKP_SRC/stats/wrapper lock_stat
	env lite_mode=1 $LKP_SRC/stats/wrapper perf-sched
	$LKP_SRC/stats/wrapper softirqs
	$LKP_SRC/stats/wrapper diskstats
	$LKP_SRC/stats/wrapper nfsstat
	$LKP_SRC/stats/wrapper cpuidle
	$LKP_SRC/stats/wrapper turbostat
	$LKP_SRC/stats/wrapper sched_debug
	$LKP_SRC/stats/wrapper perf-stat
	$LKP_SRC/stats/wrapper mpstat
	env debug_mode=0 $LKP_SRC/stats/wrapper perf-profile

	$LKP_SRC/stats/wrapper time will-it-scale.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--wGkseTiVgtpxYaHb
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj5REIo5tdACIZSGcigsEOvS5SJPSSiEZN91kUwkoEoc4C
r7bBXWVIIX3QflT+sKzVYooFrJJ/12Zhr+XMQhHRqEVRHV3YIeIlRFVveXKG6m6d3upr562L+POo
gIRY2MzE3v9OX939UdlqK4Ny65uRC41SW4SQPUEbRTuvjD9cfpuy3V46uovcXcyc557enmGdT4ux
s1jbb0ZDE07unVXpu8OrZO5b6hmEzsN875y2AY3KB8cElVnaYfjWoYRqHT0WDiB/bBoIDpzjMlvk
Qk64lZ5s6AV2zjTUjVv7odzoAEPYsj+ApMUhMayoHZ83UQB+1D/Dkj+/leVuLEnDWaqO7k41Wuvr
ISwAMfnEmTgGpVHwFP8+KJwGHIseR6g14VyaqsM+HfNHlEwjyPWtQGC3gSOwtX5iYVvK7XQc45cQ
/SXS/LC03Y5oNew/BCV/XyD1ucEncXgrJ4tF8/lHHpzbyiYzHk6bsowdJ6FupJwt81AYjDZVV9GQ
Uf91JET8oWQBGNF7VE8JSlgj322VVy7HfaSqV3vwbAZrg4/UDYdd/dtQkp8ipBftqqBdAa+l5Akl
2uSfGfC5RYJ4os6+3SMRg50mswaVX4Z440kQruM4Tbt5uKBDudYUkaOgOMC/iZrbdw2Xk3uPLtPg
Q4CeSgiF68A0UsF4Vznw6OBpzfYpIKQNqbWVCvczY1ufpYTZAKtCsdbE/TcMBxY+ktZk/nn7vajH
WNXT/6fcMgz9B82YyQmN+XPXPCQcaB+TR70NzWWS9euOrJWfonRls8Gll9+6PXPCBJpFrqyrVTFN
Adcm2ZK4nOKzXYmllcbg0yrRliCVWRjeWhWPK6ONR+8y5Q3aXZskWBIJmiQBnRW2W+L6t4XL7nU4
eP3cxxwVvdCimgg98i1QnnkwmhAE4xBU4LkwVPEz5P29WjoRuT/RCTyx6bGSCYtJol3XKbggbHon
RpMsRWZ4cT4w+0+Im/kzHSBcg4Mtmtgj8x19DHdVOLfu/GfirlQXzfAKEl7WEsZjb/IkSPjBNInq
5I6+KkCZkIWR1GazLYGP7nslU8z+jd/5iNbtvwF9LneZnbEpjmYv1TIhWHiMo5ovBnR3pl/L/jTX
aQiEiKxOw6UYlc4Fq9YVeuZlpSasxu84igQ7K8PLhW5TsUW+2M3pLgFi57OCYvE6GbyxMAlQu/cq
h2AWS6MlJl57OZZdQnCxExWumfEDqQv13CFr+AlaaH6pgKQ+Z7Q+WZVsH9t8Wxchwk1nbecSuWx8
2KwZJdDQej/8Kp44LLqIiX23ivcGLncTnJLZsB2pIweDsyQAd8i0iR4Z2LPDVSWVdfwc9HalZ/AA
t1TbCqH8wylyvPghRqZ9V/cHqVbOpnkFTG0qnnxtcz6IfeWenRbF+5oXsqmXlcVzRNLJPsrThbLD
oLz1k5j4+8tiiKx3hEx4vTHrYWiANxb5Nx2HP+5wNb42AEzPJ2nm4UMcUaaAI9owC12l7rCDnh6C
kbkQ4ns6bTZV4ZUbcTXPuIXCHbwARVaS+8PbrSi1v2mfINaeS/fwvsbsDpHszK9UbOFaw7wnDsMf
G3GeAsDC3F0+fsX8eYf22bou4G9qHj0dQSmAp4hSfSjD2lGL5FEZ/pgjEiOasH34b/Qho4r1WbEQ
8dDj0zpUnB/knx8UZV1AUZoyP/XQP0bU23bXeqI1NJW07Usg+WacBUUYEOiS6z7U/yazQSHT6v4E
cojdqCVd36yEyKqvR+AW5zZqRvM7xofXHKfBGl22SvtZEM0MrdnW6Us8d4pan0A0knKVxNItZJ+M
dr0iOI++nmAvwLva5uhy/6iKzOpWhOB7WdeBsiQqG9VbjRqX7jhVRS+uX8Jao6F9QC/7BpmGTsw0
lniu19ZzMQqk4DNdf5MrFpGe2lWySPn21PhlnhR40F780b3VJI2/KkZvlSwyaZ5rL4pMJqi/KCxe
Caq8yl5CZLuYh5ClSadXzSKnfWFpEYQmq8V3m2hTgSMb16xs0tGv2567AvkxgUS6sW7o0qQlDleh
cui9tHcnUVOikk/1rBTYAduvbq7Z+FQfuYEIM9KWDjnVOZjbQegGwOmE7O29HVE6D+1bCx/kV5YA
78tLlSn56oeuiJkgxwzvl0z/55+LxE8nhREpPZ3HLBDncbsub8HCbMmIzqeKVVzYabsClNpmmwL+
l+4vmzR8GK0WfJpXU0Zlif1M3wrfBOK5Bm4KOAzn3+sh6X3X2EC98aI7j2GSSWMOMb8k42qikHS+
1HNeaGC7uHaAPgG2nCRR9Exu0NUNleFLYqkKXBBPDsH21uUF0vJx4tp1zTGhbGvWCyQMF7HpnEWF
c382Ol03DYfB9cntiyNVLryBBDmmmF81Y5h+TS/31zVGwZ4hcs2pOP8Do6sceTGELvktyacwa2kv
1ZBz9wp+UhA0vxcOiPnf358UAucHocWAjdtWIDlrmdlKTLVm5p0PCmBd60j6t4FtY4/o0M8Oedas
RWSlGhX2tq8TOKijxqHtoWrpocYt60L7xl/2T3EbHEnXNAcWQRiYvcqsxIxMie0YCjtP2F09oesz
jjm2mPL6UQSxs64XgFa89itvQIzfP8w/oB461gWUoZVdNQ6V7hTF/UMWbhFqx6cDjcl/7J3d9a1q
fkuvRTHNIu1apo4n4gGE3YQehY1aSXGuwtBpHSJZza4eCkfk47tY5JpXTQ+cXUeSgzEQprOP+o5i
UFvivjl7LhrNHBm5PgfyFRDqWQ4P0xfSyrp1/IImozDto6MhGXARKmAkTVkQgLpX4I1znD4kYLrL
Iabn5rN2RE33oPCBpWsC5BA2d6+lgjPPcigxB2mQT8xoCplcSVesgF9xR8ClE9iaW5C7X7EIr6DM
YB0A59bmR6dTwpCcqAJ+9uy2UF7m7V1SvZGtdpN+DqgNTxNzw4P1skZwKA3cyqLUsNMKq8CybYd5
dS+ov1NR15lvNKsLwx9j8fXHWDcAE0alLZw7TgaEKiGR6MBoBbc/NXsa75yEv8+gO74KVyM8IbRE
Tcffx+D14qUtemammupsWUawLbvGLrGRgzz3eQ2d6BxsuR9e73mrr6JynOScVT7+MxBSaAOk6WEN
NBAkiXzyEownwT7fw+3MSMlYWkId75ZUn4e16IOResgEEkoiGzrfgAHrL0PI6wcqiPayldCEZ9G7
Atu6yIFqq0GtrRQ8g+AJ+JrMyddA9fZXInasIWAfDV+sFwaG9uQqNEq4jCN1yFwcocKxUMRUk8ux
Ft5DQdDaCzcRMneMhNvUp1Ca95rXyJ7TXuqIDpd3urbaVkuZA1FPliZf5WxJG/EKUwS0CwQdJXBC
DIJorO7P+O0eihHgAUhtXEfo+f4bPjM0NmReuP+0Qn04uTknfaGDIaZbK7VUce5VIriAhk2IqtV6
13YteDmeqmbXFu8KwX+2pMaZEBhWhRsK2TdtI53gcFqsiYcxRaVLtIusQvgShPZpStE/slwIS/oA
XUO5hNBKM0cq7LgB564UvFCrGb+IQ3iulzhsaHMrCDw68TAUpNip50TwUHA/ec1iPtBrGwDYdF9b
qkhvgDKxwEsEo3U+3wZhQsUiXO9zk0dz36KT8htywiHsuGHLbVSBQOu3WoThcUU6Bpu6uhoydwzD
giHyRY65/Ya+9Nts5NCJcKqwbu4bOYhc6FSHPn0cHdtY41o2cergdapPVQtYFhlXBAcR8RTAOBfz
45QHOXsFwG7Jgal/1VT6ApEw4hRk1ae7/ez2tqbKQAqMvrxawgQjCq9wQ5wrEWf1tOnxDbf19VI9
//aP8ofeqojQeRFZTUUUEzffLP/yqG9o3NMTS7zhoHzllbuQUEuFRnQkMQW5vbsI2FJ74SnDwswN
iOAQzDq4oAH0NLxs3ExnuDtxTzc+FYv7ZBfhKpctV+PE/cONgjOp1WWRuEWjwY6AkziowEV7HHZ2
AxT1rJ4qbXbY154Kc5CAskPCWhb9YJFIbH/60H+S7KMKJ52U/CPrxzLfmpxXq71aTu0XOllNBP1c
pUYs5sKqXKHDG8CXyJEHIZW+iSO02QQ1iLx8RIVGP6Jxg1DvPKShOqmpAeCVGieBi4JoSc6+mhEL
T3z4pnqei2KQLDRSjeLbpH5hiGCu6EdTjiLAl6IT9ujToUAKxPyYou5Et89oIW2uJv/H+k0aEmZ8
p9pOXQtZ8Hi6IsB42vSvy3oUmzYBitrs4KJUZJKxhADJJ7jIfO09174i/UFn5A3Gzfe14uQ9fovh
k6R1ERVI8kOO2DWNZndiww0GjVAviMwu6A4/22Rr23AMFKYof9DroKSnNg0cyjI4megUwjgCi6QX
wdn5D8OT6iecfamHuBdQGT9WJRIFuhltUIVvtm7Sf7T/8FpB9OJaCuRIXSqjqB1jSUORFbX4wviU
q2fF63KW9L2IR5HekFxe4wA74RWH0VjPM/DOWwzAapv/5oAuydNsSGNdAOwMn5CBZOhJPZ+Xsrzu
4UkQBypMUezTCw1n3putujaqBI52T3vuNV5z1ywqioV4ZBOfN42zQIVFOImM7OofBq1/yZ+t/Bux
bM8ZJjcghllA/D/W6gkrm3lD96G8UO+S2AOJEqeo517URwP4u+tuAihFqCdLS/0mEIN3KcTDlN5p
0c5BrFyrAUih4H/kdzR1cpC60f4Z00BFkH4lub76IPE9NeQlc4o6nG8zZLydimtx/qJGKzCsWy41
yGWzuNzMUyUzGfI3mrz1k+7jV0bg9GBKnyTJSNKPcL0hAK99oSXU3A6aD/nd8haOqJ1sjKz1yrE2
CCcxXDSDFVWaeS31vKsYdXtFOLXWueUOqIVHlSwFnd2Xf/HuMHj+UwFQUPyHyX4mjcYMq7F3vuv4
9cPThY1bycLHA8y6nSNrixk2h4jHzzu6CiIZ+4uJUr5yJrfwkWwswNzmYegMgG1A9JiWmVRRK6Tt
btqD44OrRE62wpdiOPm+8raGohudh4ZVWhSXViXAr+Mb19DeupA5UnNNMemZnaVrF2seUe3BoBdC
vwz8gOGABIVnRp/znyJUlsCNL97PI5Sox8jERzROhTmpTnUZUqCd6HCOJ4SZtM41bDU27/+7oHRO
opn4MG+0+J7voWHvSLTqE3QaBlDXnvi73h7lQGsXItwnvrch9dii8dDdVE71E2EwZdBbW8jqCjqO
FH14MoJWghM3NaEt4k1VO/y4dtMdj9IsngJ7aBTxK/rfvVmmDkUNQSJBlfg4NG2LlUQbscDE4DVI
3niz9+0h0RJ50fnq6aT16//d9L5Mrh39h2LLvvx+0VIUFjwQAeW+CRuDMCWrIZkFGdZBAzBlb9lA
pUBQJej8f6l3P7Dn7ZXkPSnaugF22OZlr1TyMvraABr++C8xKyxHLLMyS21t8TVuwPxY9JisdIIR
KUdxS9J2Wo1lnrXf4XB3gKDqoc6isiBWYX0gdFyVCrPzWUTffJSGm7xlxFLnCEDCyeR4TBxdtD8a
wi9DxrXZ8Pm/UFkWE4kUKpcbBF6bHRinqA4/wUosuChwTLcztoY/OfKVYxTsCXD1l9C2jCQ29tsw
nM4izOpoSslgZ8Vha3VwJUXAV/1rPY3xgjaG4pdF5PepcsIRg/9eR6K7Hx2C6NOnWAYda0eZxIPh
re84j1w2jjISDtZLIY8fwXArRB+rFpUx2V4qBmJKyPtgC2C0a+mviyvxesewniqzThNvWZXjkYDr
XzYi2/aA+SVe55c61mVPbYKpAB6DK+MfE2DI03fHI/ESJRc8nEp+akmVxMSRZ30e3NCkp9gh+bpH
ayqGbroh91ZGkKxDyAR311vDwhAb6X0SUfvTCUdkbFsAhHxGYc3Xy9uz98fANrCwnTpWlAdPC7GR
/WgSAI3tJNilRihpQDZ1x6gacb2ilbHgx8lL3gDK80xDu3Bkdty3m8Z7fReQMO+MXxtKse60yPVA
45L3+tRy4rkDWYW4NqPk/k311DpQFSDSDkWf0MrBBRdJ9dpNdosFSAxCR0fiZsyCaumxkwHcGSGD
1dnev6HOcrA83O+1TWNySpfnDyjfbWLssxjawx3lNOirHzlXHhAeSr9YhnyOUhtOn2RNB+/Fyjey
fhZG8HNNW6mxsgk8Un+uHrLypUt3IePGIO6pOs+ABaYKKW7WXQjEmvZYHi1nsFYNJAZH4UAzuDHv
BO72bN8dN0W1UCYJscQ99IIC+X/M0vJ/v5CwxPoHnW9qnYvNL4W8sfoNl4IOfOE+8PO+NLvUqcqD
+DBB5L7tuavkGnSYrphBvf+rEYlM0JPZ350LpmqkU81Wp+DwN0iywujT8J5L8gilQdzC4zWEjx6x
AhkBSS6pNuK6sp9YqBuQHM/JeVIWkVcFTfIipwAcNof6vWAXM9WejLUtWxFOCd7E/JnGqgdIgDhC
wUg4LvUbMieM6tY6Ifg7y8TQmbDUKEtGsmRuAQjUhS/jDzCQprwuH+lVljUxtT4Q5Xt9NK2avMi2
QosAtLGkrOdzpuDVCshRMia3su/GU9alL1bxRtmDE84w0DwsQ1/AId4IW2MsTIrp52i41c77LP4V
Kv1rbhHsvomVrKQJRJAXjRA175L2RUXV24IymDGfb14BFtkIVZTqVoRMODpxSpskbouJBfVmFguc
n7DJqFFq7goshrZPT6rxiR092AesSTrbcyc8dXW+wgHVpBtlYOrudlXXzipFOkyozWkm+wM7xOre
OTULo/IEgKL5MzWbMJnc55Y9lGeGiQWF79iTwPQ1+Xu2wQ1TtQkDPpE3sXraWKpSTdqQA1meiI0R
jLOBiCrtdARyPEw5Qa542fAhqEysHQfkzdijFCu+3rvR0Q/Fb4lS95DTsPDcSiDruGrfhkN4nq4l
O53KU9vanXWWv7ZEu7GrIPzFl4QrLiiZyT1cdNzF7Y8IRUUXDKnsJ65jKvBxjhN2LRD5T/smlGGl
x6vXeJIVDZIb2offreocXZ8G/jkHKNbm9S0Qi6Saa14ehbtbn0JA153bZFv2l0MinxTvZEzp/RHa
ZzYBy6nt+gZpOjK6Hmsov7ITgaNEC3zr+Ceo5y5dO/YkjN4W8uMIt6RK6FCZjSL7uKB7gKFTKmMw
P0eVS0Siq/Mf8Ec0DloxaJ/4//9csGovjUWA5Ub6vdU2siPvnVZlsT/4oEyX+TF7RYGxeGL77MlE
ViJ8Vl1h902/WOtA0U4oQz1xqTvFPLFRddybERr11je4UBz+X4cq7Pr1oIeuiju0eFsHz4RWhveB
lWGNZuoYvGiwzw+RCKE+3gChH4tZHFXATcsRx6grXRYsS4WY3OWIaAXvoZLXmBVdyLABSTvzY73Z
af93YoPoZ1SWhzGMFIGhixS6y84OZgNvZCJI8m+EL1s09AhvAo+jInwyd8eB6F3ReHldq+dViKvZ
CJ+N1/VJSU74+uj1l1PcSWEMXQKL7O2hyirn3raVP9S4tzgkMXwrwPL3DVgEfpaGXZ+aSMjSHb26
qbOsMN2EakvkbkeFUqVQUZXk5XP1s6/eT25/JhoFH2+mz//jbz9uS/BH2B5s64QkA/u/9AzKW/rp
KJ/m8cF6wBBdM/Bz/EUWuvy1vEd5Yk276b7JSJ49gX76KFzq1DYZxdcIbTkBO5Wqq/d4d76e+pxb
6QitAxx3lXOHtSgE8SPLAI1UjrfxEjBhXEuARHjpQ+XFicVHUPBT0xcAmMNqamm6uhtdx4XEkxLA
kaW2mTEbD+i2BXgWmgCYfUAPSfIYAnnK4CGtU1oXCfehRB2/awaB2dX2bp8JplSJBcm80AGoVyxj
cxSWMBJmK21p4qs073F+9lpsv+bF+9k9xhyeLIn3N9jq0ggY26EyHAw2Lx3U++hSycBuu7Ea9Fm8
jx5U1z8zfnUxNfFTQeHjdRZjG4jljCT6bKg7FvlLmCBlMlNnqDYV6CQxf/Po188OjCgwIlyNZxtH
/BCa4wf6ck9sQbBuBj419xqe5ALnp5itxI0hVUHbFyL2pJtpRQkiXK0t9Gxf62RUqFydGknteiow
0sbtLMn034yokEDIdxMIIEOsRcHNsKN8mbGFWd87aVrfswIDR1YnFHNT6WfUO6VyTJ94c8eQK6NA
F8BlOh1Bo7lVUCN8i5h/WEOk0h3cSvKJtD1QYcc2KyJHbUQxAfHIJw92GKGR/6BUbON8fwSruEWb
mZvq/KP2yTNKzhl1S9vvHcfuyteDOLz6soJTDescYvtBP09UKWRuJmXbBb63Tq6ReTi+ivLKFK0f
Qw2tY2HWEwHVbmcOmlF1PuE1zS5HbwgaO6/cPMb8I6VQjwphaIOhhFs6Jf/JxlVCwYAtoiYwp3bK
zR4C73ygsiB9r55hvAUY9AHhSbnockKe4/PzhU9reDwtFf9aXrf3l73s8S7wNKC8zIpw0IFOHAWt
km7VKMIJOWmLhFWQcaiOC6IdyUGF0I08CuVMtbgLjud3jpIkUtUdPJxElQQAfBjEyy77A1gRBfIK
JpGhRhPn45JgtxrIuA6/iqHZAaqaO34kC7NXKhHpYfzBXbggyWesjpbAQ3fQzYkCYzVpIj6RI1Eg
WOXqs1NvoPIloN5v7SsW0zkCsUs+lh2y6qCcUg1LaiJrwT9VWqkWR1JDqH7Ik1gabNaiHQQDzfAl
pp8gvTMgQGoEGayMd3fxaMfuQvD1+WcMbTJZcpdjLU1eQs0MJXvfXdc5gPzzTmfuhLbCsjK1FJgg
XhS2WaTC8tu5WcbHA9qGnDxa3gwqWnz0Udex1AkVkDsLintZOx3Ir8DDgm0myrkqD0kYmzMhooKF
pWsHUpeNp94KL/So/IZfPNFh5ZwT6MmKkyPBPz429iqIGuBeNs2ls5hcUIiiDkEpsklRqBihG5NU
2RHXIYf0cx7MBF0vvbEe+8ztqssRnN25yhG009RmPR1CckCk3W/cQ9Z3cNX4SNEB9dfoxKzzl0Ii
iRLzk9NPouBIvkKgYgab9RMMRDVcUGD/NwnHUYdF/ZJP+d8TjYZD8Cu/rxjIEhLm6Bsuzzf/7jFv
+KXfk/vqQDMClQB2FPqBu86QL+BYFbE4aFvGe+4XxGvrNAYmgXhRhMMfF+RJyXvW83mMTgwTmhGe
QGYteNO51zwaYe54yIPYsVmpK2GRE/Q8z3zgQbxjTVOGEpz0q5ZyNoAyA1SrokAI5MZ4hFm42aEL
gNN0BPzxQInpNrv/G6WR7S97AllBg/QHo+6zKcBoHyPnBdLNonQ01wzKHPipdrmMz0j3o2lQ2bVk
wr2rJCL8X96AfErNqX5bGPoqTNRvHP/ZvZkfnBsTS3GzkfX92ny+TlbCUjPHPvQbwC3d4RwiefGB
ZUvAKKAp3e9Q0GKrA6qkYzqeRJFfIvsa8b7mtn2temDscmyv88Igmej3629AXykM5LfeKFCG2q5R
j7Pfzjq0gkP8PjWWgC6y1xKdfjvy5VobAtDq0h21M/iqV3ZUf/shacOKo1eqYXhDY3hL5IO5hXVg
uUYA7fHSBnTDvQ9mG6komEv0+Y/Ms5GsnBENDpmV1k6ioG9thvnkc4HgEAEy1xbwp5ZK77lVN8dB
0wa0NK2Ov3/gGq0RhpJu1a8roM6b1wUQIkdSfYMl6iPZ8bCTtBR1FctCA1+nlT+3wg/flN+/+3fL
Dif9zdzv8DAowZF2p3pRl6n8MKQjNAiw0bQHwJUtHOKkaeE/x2zeiMYFL0w5wCAWfXpcXsP+rmyi
5qmjcYgTUFvnzv5TFzmvMnxDbf+c5iQvhDwSmVRv3gCacoDTAS/s4zdJay7a98kXtlAdFN4r9mqs
3fkfCQc404RI6BlFnbmz+UN20qjmwi3uwB9eFPalNDJi7jlNCsZ8jXbEyv0FqTtfDhb1uqfseHoq
AYPfmIjbemJ9zvcUAvJBydzisWmoyjFReu2+qkTJnZSuCC9JPvVmapLS9NsBTBl/VFF7FF0lXDJW
Ngfqxpy2/fcNSaSkl4cE27Cad6RE0SQjWqaLRNF7Dks8IYVx33imYkVYg1KhemUgOA8s49q7XseZ
FkgNuCoMkR81uKpFMSxN7/Mp0D4LmmnXTf7OEXsLrDWL0iEcyLgly1ILRNdxC56EgzZw3bHwe0KM
2HBnUm4z3xltu8NFizcKZem6lu4SJmvcKjz/sARkt+OB1uxn20fZU4shglUWI0lp7AjPLL8onlBe
Dy8neloRWGG1RXVTzzf6qsxlgOG1wiDKY2e30Z2Mf4zOiy/aoo3F7/yBVEClY2yS3ztix3VgUF3T
YDRkuxbU8r5xPqYkE+fFmOz58qKWnBupV30eEth4YPXQ+UjH46EXbbbwhUpVHIhe8Xx3eKAc01fK
smwLyvkjBxtEdNAf3adjg+XcwQT2B8+KWNNsim/fDFNVMVDf04/TcBKhF+sX8X6LnZ6ZzvlgYAL4
XXe0X8uQx7kA/PLjzg4lH/z6a8qEsDgmmzfpYAKh0rZ0g69qseWa+xgXGyuRDY7FQ4He5QWYEFGn
LYPFusdO9hgHjFaw+eDWJHY16i3O2z2lc086/BjiCdjFdG/vYPMQjwtLTgNk19Zh+U/n37sf+rxj
B2/aDiTRX7b70i5iEkmwxIFwNxzMVVqxfHJBKJz9/utH2FocJF8endHisKkMHqdelNFJH2vX6DA0
ZVNbs52gGkf3nmHtgax9oLpeFCFIDjMuLnPg9DkMU4dK+KemdOVpHm9+vm/WMkWX+Jyg4xUUfrmN
S+tZGak1njhlvg9jGGkNClDLJN8fSEkNVcE22qOYbgIxB9zBiunmtaDZctIy1Vt3HtIIepto0ki9
rZcD8ppUABOxMVCm0Gn3ma7VxYluzPtU8clEGOh7u/c+vZDlOCRPeCIzGmcDd7i7RnbJ6CNMPDfA
pEGsqQ0uwrzE7OByoYwtksSEIGcyaUxHcQ86BwXYamGpSMXRLUXv/9Mjel8nddUrWVWzGa37+fQu
JOX67pxtOTPQJhja9MXLBh3lm8WwgRb2i59AqJ+joRyE2GivRE7eZpmvCBc5UkwYuPh7NY0lMV1H
hZQjb0uIszXmP2hs3i2rqCRWjzJ0hCJ4s6j/d+8s6j2FL2F4+VGYnbeS8yTpLPuk/EvM9p8Y5EZX
g2+JowL9gffV42gQSa86O4vYyutUq18E5Ak/dZGrj7gPPpKGMt6HHs53dxOeRvZBmWa9wr1s39fk
A5rKoQM8IzHkEUsl58762u6peFBf5nt8xztTotl7CmW0aWU2O/Mbr+Rk1UBc0ik5iA86Vsi0sqkC
k1YcgPFQ9Rlyl54B4Kcbc4LVpb3ow0C5lfrpX0GURnN6ozm/PYEgFTVFGRDke8LTuR31FsdP8EV/
E9Pe5FOjoAZsImPNaniAGd8iiRZzGI+RhhcDORJEgH1EKOohw6CK3OBQwTjWbdO9S6Lg1WZADQfq
WT4Znk1foMoWCOMs+KmizkOmg2p4hw+mGNH9cz2etSW7McvktBe+lyvw8PyPXz0kor6fAbWSfAam
UHrBzulYwQe1NBebA7fcmc4hPb9irzzad6ZWwUtpoSJVthltPLZYYLWqFkZ9iNRjUQDiui2jLzLJ
ILCdCUbdSTqq4xrDBFNdPZ0+TOQL8o6lZ7ai4tdTL/TZNsI4rL10exGna41cWI8rybx7dzcF3xS/
Ke95J0j5zrbFKHgX7B2l1WDmNSVFWSx/WYguG9WkoiLzNBaW+RPmeqQM+W5GF31WrN/KwAl1H8s9
5U3SOiAxuwfRlagQWuBA3wjbOzVSL0p78vab2b2kC5ExJMb0cpwm7c0ChfwCNeLAGihNPCdNwXmP
eRhdcdhkXeF/XtCgv3I/uOnnuAnTB1kPiOvUoKr+J9wlQIq6VgelgfJL0VVdZbARvcebx+EQqOhy
SDHXZ0rxZkvdQS/CASnT7OYe0DJ9dzCOkiy+XQqJMf+m155UKSDJUnyRKGf3DrBsdYcHggwg69HL
PhxVK0dH2IRzlm8TeMJlqoEau1TeN9q1sGe8cNXVAV8UTyHfRbwRmKprzcjpj0TV78AQZsv7Em1m
dHAyKLrO2pVGNFYRCfJqEilC8hbSRvgyhIvwF9Hlr9FafcTmFlrZbIeRhNXUesgbEmHEo+m3idkH
DLYQIeyzWFmqYd63k82z/z9q8aOnoHPCKO1C4Xkvk87gkLOOG6rij+2g50hYLyK0TgvstpZKfCfx
HcC1BicZk1mlSF5QLGQRNehGIj3K0uTM+bJq0wHBeqk8qDNbxlho+3dWcLao6jPfeabq306/GF/n
P3cnDS1TP4H+B0/QoGN5kAZCKc9WfCIm24SValjrrOZlVV6VSh0wmqhIJSEHvpiBGDkS794CM6LK
dubFTLxi28J6kBEsduSIhP/g7p0norbB3jpY1wz0pz1eO7jyZZ4NB9RSy3C7+bTobzL5vrW5HwOm
HrDtpfd9WAQfh2SUU9o77TmT2A9RfAy/eIkOBceJqX63RJ59z8JgXYT9U28tJ8JKOvmaGfAhUa4I
k7rOqYOAUxnyWNROVmlymjvRSlpT8SNKDmE53XyFfmCyfDnySoENnzTwDkvyUHb5luFKIbKY5Ad0
naDa4tstgj/ErgWBWzOjbdJVVk7CqpRPkanpxogH+KLQEigbDS6uYclAYxqhk5YUqVOyTeRXizoZ
h9Uj38tVXSJ3kcLHvBnEW0kMofKnhafhAT8rRKRbJrA1sW83jIoY1e07CG3OFASSz8pMElIA4df5
ArUImitjU6jquYZDzesTAsk7tgP2I552TvlnyZGnNAwVi48LgnQ6aHr2Uao5eLaM1MestLOpzw4b
YjblzeXYAve+JSfqJ9CKOb25/IIoF/ZY9G8jKBgrcAlDrw8vQoQpDoBPPpRokkIaMmS6ui45sjVy
mfKnZq1R2E37SH+khFnHksrUf6A0uANHxpmrzhIqTP/hERvU2RNVPi7yTnA2B/ZgI82B2+oJW1eb
mvLSpaiJzRGVe41iN6qlRDNOXkAkY1j+kKqRNVeY9zNWxN5kFktnbrcoNSPZvUaOnReB2HjyX4NT
DeNDyn6XmQrTfBljyhFbirbnxqrU95Erct4VVmPPNn0lH1A4hbLCBABdYcKE8leOrL+w2EZvzjwF
CIa+Fw8YIs9YkSJ3sshdgPauZkhsFaI1sm9Qtsb2jBRDu0Rn91MEUu66YnxFeqYvcmam4JS0H2SJ
6veKimZg9gHuSip2Es82xIOkwEKxcavnxfGphyrld+TxoA3jZupoC60ixEoLsial/q/SxIaT6fW5
+ZMbjaULIDly3SHj9GipGBJY4gSwe8ijQrRjEK6px7Hz/FL6w7ZQns+b3njCiLiTbV87h2KE7Nyb
sMMMdQ23WQNDmI8ghN0skKVBOQQW/OPBPAi3SoM0CUlmraIEwqFzPOcTSm1sjGoWVDRvwrKh/azE
AlR99fM0la11uBuFmVb09mlOw/Kmdi74pvFMdnML4+pduJfkV2WMJTyWC5DWotzaA4F0/vA2nHDN
nXNAZE5j2H1KSUJTB6mtYgi+HpOkMulhuUVkD51ryAkOcfbDFu49anB97Ht/8vwCz6jSfdmHjrLk
9QTBXIk276P3laxwmFStXOnl58IjHhBOiTuUR95mXUPuAv0P5c4YJxm8ZfjbvfyX8YASSiH8vsw5
WBD1wBCOHQ/7DD01zpmjRItxM0EM7MEBNMdZV0woEeOlstynREAthB3izlIh/b/3iuErPFcfkaRL
ivXJaFsUzHJjog5RgMhXfadgwjLrajgSBjr3k8QZHNkIY/as2SihgYeqaXbNL0XXjk0fyTwu8Vqe
09zusdYTq3nnIYjDwDIsJPeHYHlXH4JVqEUQbE8bAt3w2uH/NV55o7MX2Oc+WOwQjK6WGm1Dg7Cv
kj3+6OWxwOg6KmdhEAQ+8Q40dqyTUy6DSc3bqjyWcbLa4moFZEKDMwKKVSNjFFYDKvgF/YQlQ3ik
mwHckkYxufJOKWPWXcYlQfN0xCT4slUdJkWxH/Cic9qalSyCv4+GSC2aWoVYymt1MeRmJvWgTlF1
eYOn/c2UNZFbyOK3BY7dyVVRIBgHyi5w2aPtCWf7BBwg+eYdLJH4WWsCkm6AYA8ODdHNRNvol6ji
7dFX8QtuGVYbNzA7tgV2F/E8REMst0YAIU5+aI+wrmE6vlK3HVpy7/r8+jgCT4PKFtpehSPldVv+
Hhrd29dslTdoAx6Kz+P3qELAySDbdbN6m160DXMb4BhV8cOwms5zEYM840hdHoPCVpmQ0tvRRB88
ynhCY2laY7hW7waejQmYsY1zg/G8PftGd1Sj0/THXRORcbcuG+PdTy8jL43uSuyer9OQ7M6o2CCu
F8uTa54K1vo/0Ox6Zt4xIY0tH8qF74HiplSLI35b2aq6Wp9P+DvT1x/hDPrt5eY7LTKi6uSactAj
Ce8dGXfhpGIMmLUv/A6FCn+eGMq2XFSIxxFjcAnhHOmfj25HpS0lKZnTTBB1nbVnWGkWUuG+GenO
nJIzkxP8CaweJxAffLUC6u11Kpdl3w6DV2F04au2C5uDdr/dVZqSFII/KRMIc9vm/uIb+qTg+gOY
4wU5qHD0yKRFytej7TbQIQDcYOoZLYbkKWgnL04QJvif3Xd1sHJqq01veDkxqTFfQXxMgndPTkiX
6W9aNx/4DXuxPgm82RYRIIJNl2P4g+fC0X4D8Vwjj/kp6mUkNekeCz4J3/UEuInMrUkr3HTWlk5v
Edzos3S3Z5RPfmP9EDkEXY5RfxPv40rzs5wB8bRwORgc/tM9Gh4ghc6dCqfbU2RufAZcAEpFXq8I
H4254sX9sSuAZdzNe+hPSOHYaXi8LpcRzHBU4xkVjtg/wUYjdf0KxP1H7SdgMeNUUvNbWNr84jrz
9RW8vaWfxkEvAwsgd3ZtWrUhukMsl2BSvaeBablssvnSa5uJjAhEdrNdSYXUxMJwoYcZpZtz3ian
46wtDHGvK2ERh7862EDwXl5TN3sXsewFYlAkQZ9UtJ5IsXuw27BUzvf85/QFyAe3tNTZRAF215Ch
2kmjJvCvDxirTIlyjOvyNgm4+Zol4nTw01fdKLV8cjOgnFJHC1DLxj4Xh/5IbrE8TnR7uA4RBsHZ
oCstpHJhutzZHZF+fQX4FhL7PYJJqAdAcJEMSX7F7+4KzA/mcsfSgxG7VM1XFln33bfx89o6rMiG
xGwalA4Gx11ZxPBjT4dFWBKgUzsfiM53g6DKkbaj5kjIBCVA3Gzauybldsd0X9W9dEqHlwibddLu
9IkBz/IZTcmkFtg9DMScvRITaePyknMmiSETvrZP2aDA3lYos9DnL48qCq1JiIC46mWBf0E8pjR9
90OWUoVlimquqnYd/cbjLPaHKvZwV+FrM0gDVK4Z5wgSR2MByZPirfztxQ+QL53x4QPc3tu5ucr7
qAXLy2ZoA23x7tBLyAgKVSKQLMaliDPvX9j65HmpLRgD2bvWkC6GBzWtFDapQ0upjwdNeqAyT4uq
ReXJ916gZy47BKPOAtIgIOfaNQu1iFdTwmywG1HafGYu/w2+ElmEZWHTNUwpGIIFI941C+N7slZ7
lUd4fXJI19V97BVtOu29LblPlDKDSIIQdv/JZqbhmlEf6V7AMYoPbsjzH3twzUhxwEBCsZj1iEPp
GzHNvASX0QOqXT427fKM1qYXMBW7Jfq0jfhDKOWqaElEieTjUAn0Oe6S+94xlWvcDJVA5Jgb+tVr
2u+YXh3a5tfJoaEGdlz/ubsq6GGlbXJeSkQD9BC11/f4xmCxw57B1ZxDfnoriVkxtU3sOUphTKrC
zG7Czwv4YUKDQpjssktSV1hVIrNQUYqe2Vttr4PoTzfpq0CJU/ugj9s6/5aMBMTV+p6WCyR7zU9T
crrdKZgp5gzT1sCjZHMdXBiEHfDW6h2g2qpQAD7+NuYg9zXv6eV3wx8Q62+2yrGMJsCT638Sll90
rHWqA/Pc3g45KFyThN3BTbz6bdRd/5uOE+45CMO5F+FHcEDl0jufgUigAdqO0btH9ZX6i2zKt4aL
Qzj470pjSpxGu/W0Wf7Av8Lxa1tgOcWBqO7TKgVpc0aFYCVdhqYNxaxYB/TxhnnCTx6SibiabIvZ
nSgJDEQ8v2aJOlF5VPvnd2L8LbKAXtfjXljV/9HmHiLwyZSohzHcszgFMcQaz0HUNPhDQhsx/35B
VEe0AX0WGN6sj1xT8VMUVijeln0ZRDKcbaT4YwAIdWGc6uIOBHdPOH0JCtOYuPZspDYVbUM7IOSi
gZ5hFthCHZNWclCiGyG7vsEz5UJ3zki+WnCoybW2m6IPKhSjeLUkpPjfWokCOaLrS5dJx6e71gAv
yaD37fME5pkeK4vNYm5yW4tgX9rajuBHQMEBgBMDDe4ksXj0wvfn418eSc0XIg6SCNNglIxgu3u6
L5BN0J2pwqAAqGiX7GLVUxTOCG07Fva9SxOWU2Npjn8tU3YKcvZFtNzAeCsCHSzXnCODn5Mcb9Kc
Z99sJ5j3uSljCMz4GIq78SD05DduFrKHftQ5LkG7fED7W/8oazGdQWGjbFyQ+E/yoJDIr2ELZNNG
4Nd7yNG9l6SPHBaoI4oXLykDk2FMAnyFs9IheD7+YbpbyZCNSwOsWR0vu9GehElgTC1tBXNYw+LL
a2YjTu2Oo+4zWvVUrY2DzZxbkPTiZMlRmM/QgIGqykfw+wjIAzDAKf0UuZHczMmACGqXyfDCQKIZ
eiNe/N91mDXo4HqFoMWjsz4q4VvDMrrRVc6YPtwoS4405+IKyFPNdtSDnP7eSzynyi99ImHclqe3
jG9sNKZStgzLJOnARxtklSfIYRs/wB0TQE8qrfc7fIVhJif7/LwBA5Rk8RaeWHpCEWST0JAXWUQI
inpbIuoIkJml2GYqKesPippMJ8gKjU8wzgWlHndrAiWhdvT8CUlhQ+uxklCABYnZS7ZPasGZ4mIV
8N7E39rP/2n5fYw3WkWJBWHBHFEQxSpcfu6pFRnPeA8xSx9fGA/hkieHhFFVSgm7ZVIPWY0Ss/Ri
NTY/+XUKP+NZp3qUbBYDMQpS2OF1JL3M/ALKHQnigX9XHu525DzymkjTUcXLAYrc0febC8VRtsfx
zceAdums9bd7th418zAztXCGHQuW3JXo5OodYO/PFvAaPf79GqjE+PEP/M+JVdqlOTc82YMS6kZ+
NhJ+L9Z4KHsiILt8lWuVghxTXKdUhX5+llq7LP/a5PgAHsIvD3aefVkqhFEEZnNuThu7GAKjey7P
E3Gs1IXBFfbNUpsoAZ0zTKsX2HCb60Wcv2miyftolp3b1J8AYl6eh1cAklS7Ddbqnqpu6OU+Nlka
2MThmNmuOK6oLW2gdPva5pGymAYmKxmjRuGtbbmpbpoQC//uL0xU+HK5rfhM1Ph+KYiL28T6qTXu
XmGrIgxtWB9/e/mpgu3G39Dc49zOcgJRZ7CYWX0s3IVtrbMGXtkO/jjavTEaoJCOXiOWvelyhOzs
hR41CJ65P9OqF1Y7ZtjrpQyoUcscN/wBX8RtlfW92uVEJOo74HVnbZOcrLMsefH0Spk8Sw1/7mQo
s7VlrGDYH+hL5+Isww+ONKRy5435FdmGgmdDFIr5GoFHdrk/6rc7Vb1PSQDWfnzEKWStH+cjXD9M
ivlNx3IMYgI8kRW3EvCJYD6cJWp5hLzkr1USFbehZFdaCdDT33ozMbyBhRfNiDtlFT117/5ykl3q
ngvdH6q1jBiHJ+MUFyziF2b+IE2FqclEVP6jEY14eBaefWwP4o6D0FYuYFQJ9UZEzTJ5y2nCMKfX
RygmSAr6ujIaiAvv2j2xha0TN0fDqHAZ6Z3LmKkWlb8SeezEV86pSMIH6C74XRItnyIZL3bcKkJB
eF4Qn+KcuFR8Mqor5wP1ZjbCmmfkXfhusygDtTS2ZwcGENf/ufvIV/g+wYeDSJNrR/HrNsBlTTIG
/4LozBdkB/JKwol6pKDv20JTJ19do8fIFHbH5giVhI8GAHIDp/pbinArk7w5urJdovJAz/nFxpvE
9Ew4Jdu+2H+Cfl0VbylmLWt+D6a+B1Tat+iuCbKr30d522m3KtaG/DfkAAD9snwfTRpg01t/nIDR
njn1LLHHW1rQHyyJ/kqWKmUqxsDnjhojHS9ClKOtOND3djn5W1z+p62qPuJRu32ZKNIfCaY13930
BSCBZ4KxH4g7Vd6xDXcJk8d8bGZTE1EIdCjbR/aSBrRdXt+OM+TVMl0Llq4a+9dJlUi2ZPuwIno6
nZ3BRgWKmlZbHEKuGx7n5HySmu7+SmSp2atz1N0PrCGWWV8gxECkRMi0qjUwqId4y4gbo6RWoOrc
YqJepIYwWqPQuXnfeuMHFR5VRulES38jFRcmOakfTRAuxmC/K9FWoQ0bACRrdSjkadLWt+NIgDRw
J2bQrgnH3pVRf/jnAM1Yil3vyy8SROO/s7tVPW5Yhld49UAx2FtIA/3fn4cn2u1OloIb9/vR9KF+
1tvQxJh4T+6XkqHw1vRReTE+i/+pGLod9gBkMgQP4/HFXEY7XlCZW3oeuThAjTvLudGhI1aXcqo+
uGBx0OEvH3lhFxa8EaSlC5337hmzlqxdemZcb4HLQCe7UF5GeEEdX4hHAkdXcx/wcDDR1gMQ4Sko
nCGCmhIjehv6+Cee8/rhxn4Q8kRP9aYHxJFwGfhHe/3u+66hMGla4LbQYrrOLac+rkPW+5v2/YPa
ydaHCr15/qZjykdYcvrERiB4oqmDFwmYN2T+sYnyyaoahgBl0CD3DfL4Y7AEM9AcVF3VexuRGGar
ueBH2NxfLX0DAjZsnsPSTu9LObck2M+XSdugkBsWr854HVC54KnAaBWWgveJkE9tTJmFFoaKAtV1
CDTnHnDZ5iJG+vai/HXV8Sr5CFTT24cvTURgu5ICc3urYeHOEfEY71yN4Juv6tbp+QBE9N72YMVp
NLfGkXiNgmPvZfTWK0tROZnGR0QNKFDO7F2TXGiu7LFnsGzgABvnQ1KHYLnsg5p2rScC9fO4o4iu
rkMIHba3qrAdfaIDDkc4Fr2VRfwnbfhes8rSc2QzClbcRZgorjTpTQ/3WJffhYq8tkHaJcVhiKqd
8caw4tSkQnytv2nsSJE6srbielZ3sPGj4O5Wvz+WJULHnCR4u/0KCARg5W3pjXrcw8/iQIiOv3Gl
6nQX4d9wj0viU0U4bH3Xw2DSV2l6pf6AYXxWYYXGJuJK9eqdlvtfTbQwxMDP7rK8A/BCu1S1TGnA
GaKZ+3veboZoNYWrDzbQov1w8GVWj29lWc6uEAqkEtjsuM/clKRmxFF/Du2VftlskQxkJrO9+6Lt
RQcxmcjW8b8rw8+hrDeRcKQD8/JPyYCFsQcwYWrkInftRARGkib6QMK63izwgsEGXxe8adeYufA8
I4jxvzs/OgX4LhlkPMKtD3m5IoUqzIM3PpuOPkPs0bSCYY7Da3E3j0PdxpIzn8c5PqGZW3T8ZnrT
2Det/Qsyiw1XUnqgtgwVk8tOtaCYYhy9Q6212rmIYgpaiVW+YSOi6yRqi0Q79Zt4uJso8rXoZ9gj
YBFAoOLjLwsmZxiYcZ8BicoQ6C2OVlz80a3n7Gte+5bUQsYXl+Ahjm7nw158obrNDVcCooIB9yLz
bWhxTmaqT+rSE2FUl4YUhukqS1tpfOaW+dgROxns6btnYVhowjL0wxdVNLSIkgxWToHNYMY8gLX+
Jik6N3+LHV5l6kdqJCv/13R1VjYS4+re6YV0kis/rIDwrMBV8jyKYmlxjUYKd+MriHMvvjdZpFsc
zdUuW0G4kxuHyROz8UD31Khkjey4Kxsd3CApRGRXYaffAry6pK36eBdX0uuXKz0A7QlJ69xOWRAU
yBn59DPjzATl4QfSNTSZLTP5RpntNKxP5eqnDzI2VQHdxa/pJU3pllBNi5ocWkDvsUqaoyWmxuUX
N1TOLkOhZACOz+QepPrxJ+c8d/ZGyZF7TCXnlf7w3z2ci0qb2ffMMrEl2BtmufisETzo3Aj3sHy7
FX2vRraEVbVoqewBS1dkP+WOFt9ZgrRJIxmdNCGE2sVFhPfTFtlYQDAP7edQFW4ss//Om+Uo5vZs
6CEF64Xkqv+RuOjIK3NZyZTguWw/ODCr4/ZUg8w2gCIA4DXDOlm5kdgp3P/dy0/trHk20iEdSK2v
cTJ9sHh86yBkmQu2KUWI5FgFS8fCXrjI5ec3R9Z1b5g/g2awi4A5ydqYrHTe1vCgIRLoYyVCIIHY
6rfUA0tOqx1PwwI97ICIe93M2gQySRagKxSVPJbFNlHWO68t1c2Eg057Dw5+EYfzE6DCYj+215uC
BQqw51x6H1sUHjLUYPQK9oLMErW8ooeeIB9Tmkoox05jtvgq16m6svYGx0M9+OsS1lTGiNwyVxDw
iyWCOCL3OsLvv4yUyMIvc5+VBq/6R5/LDhUiv/s5tFzzcvK5tw0+pxhNWPvIwD8CeYl253971ai5
KSL5d5hDv8gfkgYiJ69BRp7/OMusrAfOwJ48Rx3PvIOEli/KTZfTF53tFPLk3+MjtcBzE+Nh8CFZ
9r87Vd0goIYOH7xKZ17GclhKmOZNkemZ1kSZJA7uju3v0UZR+YZPhOFHmoRiVgdbskuD3yGBq0XZ
v9L3uDj7ROmhjVbUYVA0MPi1UjgJZMlgoRjDueMNvpLv5z63SoXl3SRuJQSFxVLLykWIALqTKeX7
+INwvyjmXrcbxZoozhmUgiBk/vY6wUhqOVRYt9DNBOMrug68Gxwl/9sntHQGK54r3U8D769P5YQv
bS9hOwL9eMY0A6oPQKMNeV6y5Bcp0Ad22fg4JC1xHJc8pMtdhuFSyqNczDJPkNo6HFe+kj9af9mJ
KOBzE0h+IQjy4itwwtNGPNhtUs/a0+B9gsjh2GldPf3itLAeI6rD7twQUNZdaiSJpJp0ARjrw/Uv
GOhiIt9GJQHsFakWX03hEnk1KmxR13BnUiBHrVEJnG8JBXOHFSv3zU+MwOXqNkTaRi6+CIdyTPW4
WwVSW+o76S2wmwTqKhaRssEs0nNY3B7bZ5qIIjNlXqs4bP/QeP58UH4K2louFSjOcGcsMmkYPQlF
st5iEaryfgli4ExHNamTQhw1jaHbn5f0+eWImVtB3XItt4KJ66ZMOFt3nVQhe+i1LKuCJgeP0hZg
cHU04RDb0IrpJbsmMHQ+gBsS+P/S503GFJ/vLRgGrgQu8ruX/QZxnYebnL+iMuIODW50/a2jvgYD
W7+o/0g58r5KhWnzjg9uko3O9uAYdzPDwWdLx+xv6AhrTGgXli4VjCsy8UOkVAqQMOloLCgSxiH4
9B619R/42aB6peLGXWgDLvFrQ38pLFV9O1LDE3fDrZ/1lcm2og+JpfQQuY1YZoN3Zh9sPl3vUvk7
4fuLz2t8EcyoagyDK40YIvwk5rgFkrwP1n91Qx1SZpzhVii1kz/OJSqUO4WM7fWZ8dmGJtkVlNkN
EOHCQNB2RCJAv2nYDzYd6v8nRGLZWn89xAlYnd8GCgkEp5QW0zsIQAcgQijqAPYCCBZ4CD4WgI1o
vNm+7djsLt0pAJ7+uuUXaDZGCWmnCQ8AtESEiCUgcYbfjAHrhxcjnovTeVFnyOd6WJZc4HS+9jA9
gFo6WvoeABnhx7V+XJLjG5CJJrSYSoHtL9iAQN/rCNOdn+FCUWE712MD57fyWIxQNHiYd9+8u6l4
Q7oVYzbKcnq02GUQkwvkSzIHuJ/O4eTkfCoCkxMcff6cMFpOxN1rsqL5LhIjbef8yECNcVPf2FCM
fZ6Mv7DKoi2ZdFbiPUBaPviIB33d9WgwS7e+Y1kH+7k5lWCjcdku2VBqFXZaB0VrPSxJGKYuZGSc
Z8YmMHkdRcKojs96+aNOKcAaDI3oRk92mvhkOirR0dAS12/r/3jA2Hib70oclREy/RzKFfmB40DL
vo9snOy61Ro3TOV1gFgqq6gOzljAbqYSqE7QB7zsOyEgmx1fGLwOxJbklaxDsz6bFDAwl7OkQgg6
ixU1xQen6Ohdh/bdVePb/JTk+HWmLcoJZ856JPtHWxabc2jhMX8UZJi4kJEExG8wmoCAJTMIbdd5
e+9w4DnoyABVj96SFu2RzkIzjXofcNcs8W7J5KferdHDczxZoiZiZASaJxbisxWykAh51+h5FjU6
ou7STjATWqfyLQahJFi29udY3p9vAOL5ZvtgOR5aqOjxLyaGER4DX3Scm4MuV8be1R9pwPag6x/v
hTV2njnL2BuyHbJAxfBLE9A397Ml4xSuf2KD/R3IkkfWzR3THhVkSM7AQvrQqC+949Rm4lcAGI7Q
dcEQtUXmq+ne319UhEeDVeSKwFKfCdB+V8CbfZWFGpZkr6wy8jHmSrumATMZNSpFnkZ635wZ+2Yu
W9f6BveRbhbCDK2HjdkqKdENQgoi4vhoVROEU+1KzBaPZOeOf0wUiwB92Jm7MpmpELVQXdSPw/or
PaTT6Z53nHSwhUBydWq30/eiVOgtSyL42Arn8ki3sZzUGOgitqvTPJV84idexgIkY6dRVX2z+xsb
5uQB/lLMNzazQfDa0AteQAEtBnf2EpkR6VdNAwUudA+uXgrXG8XTub+CRsuvxMPa/D1ZYAb3Oxuu
ftYsZIYGU1R9rGsDXo3juC0m3AxUz+Wn/gdUk/RDe6GiqIqIFQiUrPitYd44WWKho2BcVxM6e8nz
qljDJ8d1i1s0giepOLBgNKLOw7h7lWpt1nzqAVqQXaQfPIGqZWwYY4eycxccc2bWa37SOJ11XiSf
D9OtQx+tyIhXQGwhmXQqG+fMY69Mx8SChbQ0Nlg10f1L+TP6bpQrC0O62VJCNcfg4gOjrZcVAnHJ
7EVfmiSuE/b9vPvvkdWg3avCmE+9+cKVS6/rlyzSD4M4DatwvqPp3+wruM0r4aXdJomZFEddXVmY
3H78zS6bfBoUOFpps8iP4Aw3YFKy1zvifgOUvSE6uJYWfivWHKmuXJK/AnS0n9IXxYnhtYh5oa0f
IFBVgT2yTSq8UTOhA5dyrcMYwD5qMZB6w2rfNIG1ft6h45Cv5SJqJ8DAdNvecZS55dunkacR3N4e
4gVdx4MEyVn/EkJ6y7M9aSBxBoGz+yD8TF/VKGu2vxyaQMwunmZoHrUkZ9+QPjBdcmt1cWVb/Y3V
Bw6qylY5xcm6cIfDlhiCF+iXQYbYUVWXEJfoy3K8F2wbE3hwdWueJuIDz2fTNg/FUIMZ+tMXSFKX
DQbgWDXGjbRnJsd9D5mLMoWR3FPQiWjJ+Ew7I4xsNhCXlJAbm8okZ1weyJo0+fPN3RwCawRGYZBZ
faYtLCX+uy15Ah2uYEcR2KMyvbl6iOZ9UKdK9/bYQg/wHJ+IMxgcTFNmNgstpnDhas7v0M8B2yRG
F8LZKDdsrFIxzFIoRbUcWFxmqzVK8pk+tsKQ7exGJ/QWq8K5rAJPa+M4hfx38suXVXcF0OIjYxGT
r3oiYNHFtI1Ejk+xT2LUZAD1AA6VWwOYjIxw+/28JyyWoUdjDERPuNoJaKXFlWkSoA+8pKaQxznD
YdtvO/TTta285TaQFHe/qk8xek1L3gKiXyzhkjZUlFXMWsBYBqn7qdsSi3iXb1IV0m2qlBqkHUOZ
sbb12FqlAMNV0UH+PPocuCjAseSNf+daEA9pZqZvRUwNdQDeC15twd9i2quoSLrAwxtsuWiBHkOe
fTgi+J+wA2zmYV5KuqQUK3njNTBntn61EmVcMn+HeLDQa7z46pXVS9eCxpahODWGIAr8K2jXD0uf
/fbzD5ym8eH1uwrX70/5Mqoni7nkWgHnEtrn2+aJBhHP1VJddetLYTrXsMt+u/HHj/cH8vUrC5+T
QhIwoDXZk+8vX3f7SnmYcv+vB6/hi9e4l6efHGja/JwGhaX3PIXctwNHaJwOc4SzbTBN5D5wtSNT
teS4CEeJqZdV3WHWIuv3lCkFCbvtz+GmE4ypYSR+KNQtsl9d9CJy3/Z2L+b+QNPXZWDsGGRuImv5
zlt2U+TyPd3eoPVMbc5ZqA0Ys4OqeTvvRK0XFnY5gWV8i6nw+JYs3xhjoJA0V02HThMFKlC9kqCf
pbz1c27wvgxDA6JRFuoVmRu3hjpatJ8xywI5T8Mx/vCHdS+mUcqangPh1H5wV7ipneIIdP/Uzblw
QPHH/6DU9AJNLYdSPZ3TygyDRrPmF19dW/JVyBgvfAE/N6/uvv8TEOdpvt/7u+cwf2O+q7yFzqq6
G6zFEAhaedp48lCyjNE29peXIXHlKnCYgBJ70ggE+6VSAciAngaMbVr5dOIFsVAKbQzQA3wBJbI+
lprQIPtmbmBygjrs7JTX5/eQa57lIbPSVWO4QB+FqVR5C+l1tKInXcvqZCAAa+aii6F+nFy1yCeM
NTQlK9ZCOZdAX73sw4M5DPyjk4Z4NnAQzvYAHxUZ5ZiI1HJOYo6cN+hIW/Cxge62+YKxffq05j4p
r6DfJUthOy60OJI3qX2YMZk5xu+WRGNAX/HbyKJtTmebqTaeIgUGpRqmQrNxDMYPlvNLp6AYhInh
ayTwoum7awRPaZAnNv+AD5tJp6UloQmaVbLGZrwh1TA+KUPbidoCrFXrHhu9+eloXAXOAouNK+B/
y4lcI8XCYhPKlQXfG+osEUR2nZq92yImccsGPPO6Y6O3kGuZcEak+k6gM1xl5dUf8hoUaOR+W/w+
h6gryylYGWmhAmpjC57vjKjCDotqjcVqhtXHSCuEvKNnIsLoqjKr5F21+I10CGbsjP4tHOvJwPpE
j1Y1AGqwk0eJkt8JjUvz18tQ0Uc0QhjUx3nURjQA7ruBxe4L+SQJnpjsbaWt0fX4JsWecNB+8aMf
EURkh6/bLriDqJBC1T15GBPxbljWGOwGupMtAR2KiL7vRo6SffmBAbCeIFRK02ctwWznwJHFp8fq
thuyofSE1yCEY+ttmx3Rn5r0HOJt18KJwHxbtSfH7KLeNkADcOJO4WY3yL1VFjpduw4VuwutAeqR
c3jbOYRxtzzbHN02AiFR1dxkbXjHduLr091bTCmZ0SEtdLEs70Im7JRxAvBSytIXjNkLKLdssWEN
BC6HWmY+gQ0ZA2F/enV2bFL/Sp9aBxRnVknpo9QW6bMg5c1hEFoZpe5hTdz8eLqSA/+jGLpAHHlD
J7Qobl80bAQJsfe445S/iDq6f6Tzpw1Lkh4askYdQEkqpAcSOtI8ZazISaqiXGfsSSyC41WNy7lf
FTsEBXPCiixTRAPwK1lWTbDh0yAAryPhHzCC1vBQ2oLm8D3l8JAshBalC522pvRwLffKW9YhFU2K
K79+WxqhoTDHgqNp++O/2x0OxgHXQrwAYj2L4+MY+aOny+fBNPRQXk92CEPFA76WHQvIDezR30HR
eKnE9vJuulNIritASFE5iUUQwQRu7fKKS7wuaa7Sed8ptkgxAVKXMKN+6z0cBx+guUt6xrfCCk+G
IASu/NjAyjUg4Qx9seRtQoeVD+i1qYOxN3Qq0Wyj99F5Pa2hZgUpOV5+RlThful/KfjIJVM5WBgN
bCJ7qSb2zkUhi8jY38N259Ei/FKpGE7tNjaXqPofMxKmcQDeWRnVmrdVeaJYbNlfvEXr+C02yJEb
y7t1YYAaP0vPQ4pm5xIfu2dyO0FZAqITD6Cd4l+sp6YzInI3iQpX9Od+Ui2dOkOfdLO0rpKW2c4A
T3/lMOLNySxjnl2mN3VcNSdke9iAPlvIsNsv5ymn3rwacDnvKFBoeJIfBghNYuZhxK96zvdavv8B
5Z2QPV266YdkKAZQtoybn3rGAMkVfdg9z7IBCAtNzttmDp73ncN1wJh4/jZcc7dD0rrj7zIDPOkB
l1p0jZbOAp1NCtKrXdAs1H1aMDs7T9TV2tQ21fMBlJ9jHqSdEOzy1/OfxWzHjv+QUC8c4z9fFKrX
fDC5LUYAkrKu/Aby5scckBGZx6Yby5ugCny+DSArIG494M40CXjqNBrrt2IJiQycFiHmMZD2FZMP
ya6zqrPqIvmGRRvVc6AEYXnxVyepu4Z6v5+SckahA/R6l2mRRNVOqPOZZPqPYHTcOWn4tpKdI8ej
xxpqpPDDB5Q9Bj6G3B8tFtgW5M5gLsf7NW2EC/GGTUJUrSGdB1VvRzkjCbu/gNF3gNB+ydmjRwIU
vRiHomf4m7mtjUUfwKxID7P4RQS/c4FhUQThNTz40GHIeuxdr1lF0S0DjtAePJ+Y+xYMtnb43b38
MCmhfgaahmVxAx4EK/UzcKI/4GUEckVhRJxC98dct6pkL9VCPUoHAN07jMfRHvj/62XyDV3T4fyk
ixV8tnNnvme8A9SfR1OVY8hTKVIkfuGTGuMh9kvrGxCuGT6ay5RktwrJbdqcEVeZwNMoCPyMFZTR
IbsmABZiIynQFGm09LfsHBxKvEO1vfh3D6mZBFL0b+aFF9dX2G2G43+IKjXFkfhSpioJw25Ev8g4
P+3Y/Zf0tdhhuhiA3CRvlW+xohVtc6EhmPX8+oGRVsDOvpJCFqyAsCUtlucw+gUjbs0H+tBmdC49
heqxguLAEWTXxkGUGwFGVt0PWjlopoc8p30R2g6RkfuOThMAqXh3oVnqZ1S2HeEcHNGki54B7R42
CUiOGxBXP0daAhH/7fnD85kxX5yvM/yS+iMj0yIqj1irikMcCPDE2WEppv6mNqqHtNfTP7sYF4V3
cJ+w7iUVKd2Diha+Xvqs911pVYtmgF+oQi7YmVsONllZrmUCCJp1jK9kjYjTjP3FcY93Zsih3KJ2
wkcgZ3w4GhV7IB6fieuYKTUnLWc3JNl2ivGgt0QIVsEy+isUARA26k76d1Yl1CZDZwi07GsqaY9C
lQS0z+MWqf3CzcrqY8TyrKfBJHq9Ti6fEmkHgbhQ/GeFgcf8NuIp+XkI6X7v1RQv0W7ZYBGBpbp9
o5slDM2CXX/TfSeg2pmkbJpL/KNNsR/dMIYhESOdWio9QyNVqnbW0Zegs2oHUICPtZS5YOs/jCgg
dFH+S+/p3lPCscw8uYlro3fxjbGhSzgXydYnGBFJCstTU5QHd2/iVgkY3DKkHtmNulgEzi8hzmFR
ZufbPzyPlLUlDPaobqqdPj7SDbDbjGUdvZbX7r9BYhAdmE/3dBqe2f79KeLYkzbdbDbIvJ53nzsm
erjofY8iilrPmeZ84oCckA+H2CyNTlK7L1dZZ/9+OooDwSVLXWYtgwagTRlA0hFeF7lOEF8VVkY+
XsWWOsI8NP/0fKximWU3dL/EYmouShCosvnDYEYiVyXZQvdnOTROI0PTY1HZPFtIgBH3IScvVxNq
Gn5FJW/ce172t7yK/uoDxU3UrzjlQCpszAQAT8gec7zCDHpsvy5bIVifA20sNTjU3PprBVfQwsUU
EZBXWUaQ5EsuryyZ9a4SNsCluNyGWD/bpAtMI1rXHUbR3+L/Q51YK8ftOJxPj8AYt47KNL8eglI0
BoQf6yXocelSs8a+R7xLctkigKWqRE4jN3DoP2Z+0jhUR5LMDwCXGbvz0Wh4FzCqdp0Zr/4q1yBU
WJMzYy11r02o/NWNebdkOYJfaEHWz7jyaXNmZAiNc47LnOic0gXhDpfe7JoGNl6POsXrBV6Iolh/
E0acs9OBfEmC7q0GUVutjl/mW6aB/vyHRwUBw7E2EnEViK+J+KeRxIRCVHrE8h9HLVN19hq+Nyef
nDzeOVQxw9GAfQ82Ylt5gSeyOwEDZb9Lgm1RjPUx54ZheePau2yJ8qPkG6ATg4uCwX19yrBK0uyF
0cl/+shml/SpbBUJQg8LiRLqAOFrdkctrRfKodsW3V8oNOZMGKOgsEdCzgo76qOl8goFhT9kDQxJ
3v7phG4KjS3MHjv1C/2e32F71N2aZyEBlGuunUGQvAmSj31qTXxZ1z/bDHQE+nBNOLoS99WIxrQa
/ygq6mrgOB1uKDp2h9Mj7m4VGNHvHgUydcfKMJc+4blqvgpvwxYGGrlteZc3sZ7LTNt6wNEWiqFE
1Dieq+Kqc56NGt7eiRBcuXvc/Vfozc01raHubl5lRUEgKoUxj40lRmxY4D5xFtMcOKFuMVQfzdkE
cF7PzNxZ2rDehq39WOq5NqiPxD3Y6g1WWNS8iC0m4R+JsOhbEnd5dxaZ6z/UeyxQw8+FFalCzh/O
00KeiuV7/o/burGacdsonk40+cKahM2YmZetTg9QgSpdpQDrDnaSB8BA8c41/xnw550R4d0GkJgt
cBToTeCs5uva5W35PVU9b5642R1s23jbeVgSOudCj69BABDWdRbuMu9gCmYYJDCy62pOjwfDZ8px
f3heEER4NpF2ioKK99bBU2Mtz4N3523ZWLBsR5aeq6/56jTPl4EpnjG/czd1IhMZaB/n3A7qhA0A
OEZLk05M6lmiGV+s5zluKA4kVU6m7j/lJWTGPrTeaqENg6GSpVisA0DjsAv5wi4NLfcsJoO/bVLT
xLMacYNJ7p+gduVPkLmEZ1Ek08me+v8HCzbJlleDXxAi7bwtl4ct7txHZzTe6YRoSPdr2XYTUCTT
mgvPpXRohbxUfOvd5Uici66hjJMAnWtqnaUUn8X/bmc5KGP/cVdfRcSUHiCUuQVlzWDsoSAy5+xS
r6I8E2lq9K1Jh2hvrcXC2qts/bcccDJzUhY7MM5NYJq7TX3/MxzLAHreeW3J6GS90ypyfKHinwfE
A/aT8W6DNAt88RROp/jxwF2dP8u5/FVowI8YyZBU7BIf3KJigKAnsf+y+3mWjRfQX84D+TEvKB1Y
lzZuw27MDfUUH++Jeef6vjlCSRgK9JZiNk68O9Q7ZiA5J3CC3bhlHO+ZE1AAGhUwEgodJlyYbztX
D7YTjJFP7GBzp9BgncpmRyIMHGx1cvjr0m9g04iXlkVp5osT2wqTtxHpOkcNMRoFnRbtbAaK9Puj
wI/4YCbmf8wuLltDZEv60FMesYDSYMe1GhllDRSrC/3SBjwSEU0ubiuMv7nXs2XOY38L2jK8eFRq
XadycDreH5Z50KzDqSv0P1vnJD42Kssjcg+1fge++dCOXS9gkelXg8fQbK+4K8/L/+y+IAE1UHBB
2Bc7peKUZLFtkHb8aUbIuDgvYlKOW3pGz2IqzgQjefLqA1FAvPR9hO/POG4bHREjhfmS55wS2knk
bh6gZP5/iq69Bvsc/GXvm3F+iAlsy66sGWCyqEyAJsjbVXs2FGB05icAfF2pcjXaBIxzXDUCrHek
G5nRbHPGfbJlZXCKsnJeHMPNuI7l5qRcVr/fYFqvwkygSN9KZZCV9QJGSQuLxgrKFB68dWTtO9GB
coD6g6cZcKyjAgWHgg6Z8umc6J1Qk9sRO/ebJ6unhbqkOWd7dUKIM8PyUzdvq8I+kD6c0CrIiAgT
xnasox7GUSHXKGZUGLpCeks/+6+teRQbdghHMePaEDT/INgLzez0M8DC8mCwcMYOvlEJQwYqUpaw
e8j24uUZKGhMcfyaoFKeaBKWf3kpEw+x0/vknyoH2y7clDutXU01B7i7mE/NQ5zMS+yNwCFcPjEU
d6azTozbyZRviII4ScwVw99hfUK83vTUKCw2flXXThkM6zDD0ir+6H8Cr5bUDQ5n1EgETjozvFvs
6i2xbh/5OmUMQoRiSNfEIiuD27D1VrnW9oxEp6fWo1QTRyNuuZcmUBBuKBdVuJ4MV48JHBk8h/t4
TjIvsMdZI8G4+IsAyWzy2Rq5qoynm4lAe3kSi5TNHmZptTAYyeGq0PL2xdDJTYOe7y4bhPQzz96c
BA/ZRN6d2YXcs1ewbmXqoTmcl5pLKBDjlldinVfnvpGTOo9ChjNvR8bExEpHc/zv7rgTBu/aqrnu
1sIcsJvHiQ+L6nCI/MX9UckWaPuhEIehc/2/0H87zg28PFHyZBmtH3OAZ/OnBOoHqmNMy2bG/1/e
uix25ao3dd/hzFnb4E86eqLdQBLaEkUG6h7EFoRYK7S81POZ5sQop7HbnjrZtj1GjVOvCr9V5OXX
0S098cNF1emvDQpPbZzhEaJWyGvq5yTXSjtLKPbGbAVK53ZAbrC9kYqMeDeMCPqCY5jHlcdxI3nk
BN175XusXvnxVzqld3nIsV/Uf1z7a1xNLNQ/yXwnBalX7bZR6bHrB4IHj6VeQ+4PBifbo6/PaiEg
a8Ax90s20b8WeSMyKkMNjFbAcMxVh2xlgKhtvTRsgHPseDyW86aO/GDkU7JKpm9KhyrkvdGkAqV+
Cat6X4+6a0iTaOiTHfo6+LT3Hl4zJ4Jeud4+BKsE1CBfq0f1gqa68cGgG71TnA8BgGXbuz+NeI1s
vvA0qsDfMj3YRku3oSURqJQ/a71SYfuUJz/gBnm1pBY5g8RhxL50IAb7fi7snjvBsXTatsUYXW8y
ujH81sZi7yBJRrpySWxIUwprl8btu3D+VHM0L0LOZaQtQnNiz0RUhHJvwpYUeHs0veYQG6ezOKuI
3P6q17LG+7iK571sQljhM59QNoH3996KxPY8E7C0Vmb9+fv2xfq46yJVh2KZYUyI6kfjC1xhQZLD
0mIwyYCS/D+bI/p07Gmc5vo9wwOjPUq6O+Uydb8lQH2XHC4orafR74Pd5ifhMf0scO34RQEzBdQL
gCLiadO3DQYvV61WDod8Qe1NWsyWrI/jaSz3Wm57CzUaBKfoqNNmZzkkmflQHpIvx5cQ4gNjsFLS
V2A/a1yBZKVtn09Ilk02XQ+pAhPJ4C8Sx/MIN0eLoAR1Lcs/fYfI7c/SebHHv30BJzVOUe1MAFZY
HXEH2a6Xo5XndFDFYNFMcXz4TT4Dh/0IokA5lFujRGUcxjw2pE/zH2VAmZuAlTVoMHHjdkxcnham
MhcvUrvGfeIdPFc3acJ8fheMuVRt/BS/hOE0pfQrxFKXegXW0mPU3tGkib6IP9p5a9JjxqCxJvh8
uWlF0o02qisnFReRmsrPN6KZ9Hxh2VVMtcF/wNGprL+XZ/38Vj+V33Z08AHoZRdLY81uWqW55Sfu
nPAPqJPvoqtFLPjDmOeZ8V6A3P+EJFy8r/+EnbSifvYGR372IdelS+OVaKLgePl1oOMP4+miQ3wH
ZWzjZ/EuqvcaZIu2xsJfFjxllgPtGG5d/pB1/IcZLHppxA8E0Erxh8fwmsqDvwbQ48zPe61/XVRW
bKaA02iMUekcxllbJ17OfV9lGhrRg4vNnQH+34dafYfFm5PCJQ6BgDo8zj8JXF7fV3vRoJ1Zgiq8
3SBSv00XYTdCJ/YOgwg1nuU3r1PRHSQAlLFtc5/eZC3DajUzuQTp1/FrebkT1ofzY4Nd6nXk/dIC
44UhqB0mbI3Oq+h1O8ZjlvoaB43lYfzChIpK44s7ZuxPgrsxfyM208vXX4Dyhb4vAjAsO/2XkGRn
IPhYh9rCULgVKipRX2mYngxDNQRqGPUE6qkZREruQIR7BSU3CiyDrl4PlFPS549CrHustKE0LyMU
rsMczJB3QrUHApkC6sKZ8q21W5A1QOCdA7dh+MSjKxw84F2H4XT6GLYk2HHrdKJZsWzym6fVoXXR
MjEIM/jVgNQok4eQM+xJb9qz9gBGlbxJHpWtUU3Ppwd8/qlcIDcAg/4rE9M3xciG8dqi2WmaJq/I
grPmg6DjjVO2+0ygoF7cSRs22EVaTjL1mkDNiqJkOT+lHn3J5b1OfXTyvDc37Rio538h90n6tX5V
U58M+7bHUJUvDLw2U8s2cfkJQz7JrzRPPr8dZBoO7CuKnzqfM/gkN6tf8pdsYafiHkcddA83e0Nv
zTVJBHQeGJW00/xNWnbkAwCLjRvMUGJILH3FEU5YgioIVuljd6WJpGO1qshk1fD7/0lSXEeaETxl
7yAZ+XHk41lAqdcEjeuO+3WJvow+GckdV+48EVHZw2OVPrk1D6q8U/X3BlrOvJ3NhLc8jN/EEQm0
wa5eXIzh5vpTPUd32a4V6Bwt9toa0snMjmbYHKYfkBzY8UOr49AhglOjIEgvRe8qx4ds63pXAKvM
iPjKYK5DHe9+HDgtpX1sKPPXBxkH70pYY79+BZ5NJd8hVKnds0nIHGuQ3UE8vy1DgH2v5jmxQxlI
eClb3aVfVI4zyPoTm7zFtoRCMldcVbHlVbggZlbTN2LtHZFPOs5U3b10FFN7OPQlEh2YmL0QCXHV
9PnYSiqutk10gFfffCKJlSp8I3E8mK5F8+9x1229m+NQyG2Crjve/cEGvfX346TqSqXRyQYeBId0
99Dyyyr54fRnLnSoBWFMRSmziuKzUL+DS/F0CRPirUcp3l8s9VR/J4z3TyMbuc+B9cI2QSbFyvKr
F60YtZXS879Bs/xDdIbZsDFOeBx5k0//r2c5sr2dBFIRHhCyOP1v+kG0/mWqbuLLgXHxrS4YJQlc
CYAH8pKw/oamF2+dSj97w+2Q2wNwbgdIMwUayFcWWfof5KJE+rdy/cJyf/HukAeJwMOW1/MsbLt2
HT+tQYQy8HDmoBnotsEBO5JcXzA9K+JcUkOb7LrVmxTdGYCGIgfKq230CUjVz71fDIGRlZUD0Dbi
I2x5nSzoDO8I6tHv6BHMLsUNJUWrB6W/zqQL9niCEpd9kYy9PBKR49xINQLp120O/XV4BUGV0r/A
KFNHWD6d6pG9kssFRpO8VJHRAftpvaYRcAB6S4UQ44EuKr/Jn4jaePb05i8v5weZfBWZCA3/yTQT
vV1Qpb4LYkdiiP4Yh+t6Fg8s0UvPali950tmmEEG+Xwu6TyFP318t5+Rhclq9OrkI4DnS6UbnjQ6
qF4WHOMBbiPUFEzFyNhkuEc0Mipt0gBHlmtOVenzrY9aEhypS2ETbxtEXrCvEwXO0xdG/a44aHPe
R40bFRtUX5YO+HHXU1XmPUwcplOUQk6GpaP9yMmNUQPgctWGkWNkKcrBo5Ltc8yPep94m1/0WIuI
2W2mtH4/482aMaoZxBreSpD/sq/5F9MTwYEeX/nbWlxQuMSsagqXxrfjSmXgtgNtqvdQyGvdnK+6
ljHrBfFvHAR4ctbeMI2KRmoeB0nab6vHpj9ty+vbJTcMkvBL3YOGBZvo0nD/QaacRJsLSbKgj0UR
VO2E5hu0ty4fLJl/VPOSSHLj+uT9Fw3Xvjz9uhYFO7ZSP9JM88wKi5WdAOh60vX0CkujfbPjV7TU
+iPgPdyb1jb1LvhvTk1bJgQCBMa23DDN7voiV1SNi32zZ46L3gYW+BsVoDZ4K9zyXyQLckGoCWux
GK9mq6TCXyh/91wEC99/uQ46sSjR5nn9ARVnWr+vCxAMFHepBzXYYYLLPuVxCGENT7mE5qlzf76S
GGJSsS/f+gNtHYVUYpnFIzyRy40JoaTyn3T+lceHUcg6KR/JSA7OMuvIUYZWJBOmwkYRUd05+vqX
UhEF0sfdsfKkFUF4vD9C2L3IGmtxe1y2ub07oXGe4T4zZVWLvZCSfxGPztr7gYlzMUXP8Kv7VjJy
bRQfh+P6i9F+Tbog7wm82BRhvRopf11UR/M+N8dRN/Fw4m0D2hYE2kFv8OsrYXC7T9M40MTkYIKM
oiFFefTiIWQ/DiihdIq7dvjq9MCztHvUBpH/9k6N4wv4VeWm07GZuskv1D9IJAxJ1la0Hrg/8kXO
dULwepsa/AsspIMsK9lmrNXSEztSo4l7tpeSeAc0ptX8PQ4HyEDOY8khxJ6VtvOA6ugEc4YgbXxE
GJPUvUwlEW1V2PCDOW/PDok6xgxlauK6wg4XvYqTRvSqAhqeGZWi1QzvHDvVx7FF0HQvzEkm1aKg
6Mi7PxGSerESoJfNqDISCwndDubO8HvLmea0x6dbWzVPRfr4xXkxLQ51p+wIcY71o3TClFZRu0W4
Su+SyKqLyhawYUBLsAUUaJtjLW0m+qVTIiI2w2QEtbGgAtEPQIENQcnVItyc9noCM1joYo3t00Zs
RbXcOFbAAq7Lt2gLru5EDH+7OKJF3TbhFeF7A7vBPge6oF3JaLng1jkqm6ZF05mTZP2KOKYaWVQw
ImFikrngwZ6lm89PN6G90YIYd59wVYysWUBSKDTsdcIMjc2ZfPTPg4bEd07vleD93WICHjDDbm9S
LN94DlSVjo5TYrnRirzPW6iDgKtKn9+yIZIVYKokxVz39mvMqgRcBHDZ3Y1tJoEPvbrNFiGzJ2GS
F7/b4sm57qzHHu+nmekeykn4XjObozoqNPt0eGMDQKwRuS1yMn+569/8Clmn400JyfOKLaSzJAX7
or2muTYLh+XMikH5yERcMn2YO66/q9g2OaLeCUNtt5VLF5BhTz9+YpAy/3NJ4bqMQId4rPcfpyTH
vokkrxsALudS6VVDMdFrrsMWwPMUWhio3oI11IPtbdmj8IoieUDP4aWXSQ3g3/0UEQ+ON6PPNdEm
mYZ6CJuNX4R2et4ct/UCl2x3lnJqcIp5wc7s+JccqxxFpNe7vmdkAKjj+uRsE4eB/Ja3HDKZBN3N
yzdjBDFeC1JqhbNuHjYeHHo17tyUi2fkheQ4oxVSK7ZhJBSBgSUQMfNB1zCx8j59IGH+J0uHFpi2
aCvpbjpYN1zwgFCvknupv5Gthyuy9cOiVJJV4jL9AMqEmMIHhZRiscj+G7QnhpTpRvYsrsSbjfre
00pzSn7JjYFeuo/ZO51lGr1opMDFV3uGzBXA6q1JEVlckZRvxxPOTW09C8tO8fVyp48Pjt/RmLIG
2teci+2K0vdylipiGOgd0ksvOp/DLQSXpuDpE8ui/pcLjJ3sQb/E16IR1MUwnSg+viG7sKiDo/db
2I7v0id2fbusqRwmvgstyq22Q0RnJfYMaR8fMngTpSPi5RquHsHbA8W+9LdmsxyXqgXw7gdAkSRc
/tA0D9TvAUN4+9WmKwb++uJlGHB6glJdCVcsOX4Mp1obkj3VAJoHjtjKA3sE2ihjYmBCzVWQkHwR
c5k0I3Pvg2jdxsrU0ys4+x/S1iWmdmoS7sdqoMzssqkZJAYO7R8VDMR5TZ6MXJJ9jMDAZwU+kV9q
1WSAIFutvC0gA6sO5DxaBcc6ORY0UhYy2cAO2g7Prq7EMMFeKh+ZflMXhwnYanGgXmJjo8ItGd3O
g4iiXmgqzFJu+MNkS+AOcC/y0jWiZ3sxjrYKNIsuEBOlBzeqcok6dZuVsx5dwwo/KHEq8bR/CA5R
kTAicPAhTZIh45X/06V904A9ZBzhlE5L3OLp4GaPh6thut44T3XR+XILxOB+OyGrf+283D+ba0KF
Mq6S3rHcO1ekMI4ix0aAozApzVb2r+9t+CyudfVcrBs/ERfo2PVIINoUbuCVJk8OC/xv/4EezI74
pNzUCkwGYW6eDs1/l4/h/4eqvvg5nSt2cPohWdUUkXU7+CoQz1DA0vkXbIOPkeLhonYqEZNKw1Ar
jYALDoop9EKPPJYlE9e8kDw484QXStgIY4BTu6vQ2HxgU5WHgr9pkq+Qph1e1FCQUCJyC1gcO7yM
crcr9wG7/qJIggvV6SNOD9KDriLZZOkcQnZgLQa9qnfj/47ahh0GDL5xqxS5t6l0r0gpu57kG208
ItLPn5Gg55yTk8o8chAivZPjYSiHlkiAbC8ebh9elHQAB4WzxRrfADun8wEbo/UGXlMiIEWZRbmp
25FuxWsDzibvxz3Knr9iw6DzPlUNILOebXRxq9NY1ROK5VnHmaZNOpyuYYvjLMiC9KhcBGIwwtw+
oz9nE7tUOdbjKUy+g/FTvJrD5jEsO7PRSxh8IzlbJAzyaP4fmZRWNtYI1UyIXNimE1VLTW/4nAMf
a9aUIVtjzNjR1rPRVPnu0w+58S4w4s4SaJwcoFLe+jtsKSP6x/nw6NddlW5NyVrMHeAt7sRTudAE
W4zUIv+2Suqv9BnRYvZEo8zy0JeVIiqLr9V08/tNOFYCWZd6Ec+9Pu8KdJyJEqYMfRk/TqUYwMVY
oN1Zruo8oaO+wXV79mmRAheZEWlUeZZL1KKgPpfXasRQWqfJklB8X9gE9kAayppy82id3djFD82+
LTVkmUgitrT1FhmMZ099iLIu+YU0r7kT+rl8b/RRQESXXjynHIkCyxfPa3xLeywD96fTt8x+2nWq
EPJqQBg5DHfzVrHV6fnfK2CZHH12LPf+3KWAMuGt4AqOpkcTJgUn5LJEUCw2yz7i5yzg/7I8UmWD
3Wtp1tPL/3Vppk1WFw1YSZAjKF4cTuh4yx8oGW9dPXzfMTtCaW9/UQ6Dt01fwo6QQmS7VGLOHcjs
5Vk1EFAVtLTkwtM1zrd2PWbccEUT8CDsURelcKGLy9PBwsTCNWGBSfaCvxooeKoR7bpmKyGL/b6U
OTbqcUBABsJolcPz3+BYXj8b8JcO6MDzpa3S/2hNABltrkX2jOXj72u0Yq2Igv6ajqcTfJm7Idxv
UpBS2le5N1ds1esDxifowhL20z5rJuNq+v9mIZWfLPj5r33WJN9yQuN3Or3QSAENwAk2563k7MIq
gjOKfLr3k0uPY7sCfwdyvjKq2mi+LUB8dsyE7Up2zNWCO4dw1LdIKDNJF37lkiASDXEeq6twfQlr
mNxHi4fF5T7sTKXvNVZc8eRg9+2R9cDowQkPTe5QUF2gsgIkmYdDK0Qnbl5O6YwtZB4MyPbSuSFz
Q4O11u7Sbc9xampuXXZ45acm5lEDdFNTcHQHd7sU5IV+GNo6Hs/q/6ArWXrKtC09sFtrbn/+MFtH
BP4LYAk2R8hi9P9phXRJV7HDtVd9/X+3tSBY+nZNL7zP28BNnvDCq7AlM6FiiqwNlbzpkx5lpVZ6
QsZHXWsPGQLnnLq3hrZSjeXdgUt/ckC3dqWlvIrWCMyH5H468EtWcKO2clU2G0bML/CEdgB2H2kr
bkvTN+S0gF7e36aJhvI9hun/F5OeUHHEY20LWKPhkh5Tpwrnvquh7jAb45fXw95N9Z2qAJn3JFwC
Yt9mIXKvFdCoG2hJ8HSDp35TP+vaQ4ZNOOzhniTgdJJoGX3QclScIF9YnsxyiMIaYudWvitp3hr4
JESc/GtTw7F+P6NXigAIYnUAexxxSBaP731KJy4r+dA0py4WlY04E7/OROrTGYh44Vbfrj9eRyK6
fpm5e0KqLaAYSsk42eM8s1RxMxKgm2us6BhGQ+3wgxisBYnhfZlWQKMx3THDVKudpqcjMlPVAs9I
ivyP2/oO5XQD5ipD/P8FbZcyWccrAT6TTQNEn+yKhLpS/NjXh5s7OCxHfm8OsabaL5y+sU01Da6m
jzR7Bf7vQm8yC7hnU+JokyNNuTept8UtyHmOsFp1p+H7ye66s6hZcbkrd5RhLjEmId1pcOVAy/Am
Q2d+pjc0ntYc/1wE1tNRCgBMSUg8wYOE1HcR95eIpznbG4vUzfcbLtW4Tm2du5ERdBckF/0ltDNi
16Y4bGgsAnBBrPxuGlzETox/zTFTvLJJNje8BWDbRCXOetPiPoWTbR7g7W0bnrXX8P7HuFuN5mEC
e5GwEOycbb99tAZK8ycg/r97fWnZ7Ii9dvURe3bs0ThvxgN0W+OU4n32z3dOLGklvrKrtsO5QmYl
FLcn50xDTH7kDzf8pjSJY99xTg6bOa3v1wk5RABnA/5GqG7pKzhtQH0WzvbY3rKMBpyS6UiVPRrR
l4rpmz2cljEkerPNU407YbOP4b3xW6L0v2kIGAmugd1cpcREAyDTd1rFh1Mux9MewA2mkKpU+8nd
7JJJLGfa1ampju/LwslM/tWAStb5FasvkWf7vCb9cgxgW4Wff8gZk1oPIiKKXWYnMSKhO0w+/iIz
3bplBqOF9cGa5wCoHBKVNh2R89UbgeSu/E991pUI0QnTkSWiLOnciI5MuTlGYmKM81rXU4vX7B9k
lPSne7RgslJ8cKa0NYZXYS51rTK5OBrmmGegzfBJqlaXtGt1aYHql5X957Zscbm4Yli5uomKBtjC
xLv12qdXdem5ySxKhS2cQ03jusawrbTpEG6brfCVr57daF/qoAeoSvZwa0O0WFBIWaojyUNoiPB4
XRHyWlEXj2nF08Cnluomkx0fhPInJxua1so7fRXKc32kNJ+qFU2THU5tcz9W37TY6HbtODwvocIr
WjuuGV7CYCRnq/rAXZbelhW617vHnHAdi9QqKbC+l+l/tMp+qEqBhZxzS+G2Utd92/4YcSrhWciE
FVqGt/2ZBcw+il4pN1f0Gbfvb33pOWVyq2ZqYD07Syd7KVihaHPVqqQLwsw00nZ2/l4NxDzlA81w
m2UMKDKPnSe8vnKyu7k0+IuYe9FJU0bRRgrkiZMIe1UZF6xCNDEu4T2lDdqpZWhvL4sJwXB0HWqm
sfEFB5ndkTTVHeSwIv6J0loyUWnF0nCSdRo9eyy8D8foff0cT7fEqVPkDpdHz7rIKNg2esZUBffo
16qdZkuOLXzs/xuSy5LcAMP1T/Dlz8FpBxdkI+eFT0zbiehjA/Zf0x/wEsdhsiB2bcjw0bVoJeFg
E6oQXVTiOt3yhVg+oJf0PRww05swVe3oEa1dxcLVihGQhOnKAbxeEhsf3OvTuZOuzsOms+Sce05T
Ct2tiXe9Sjc8WIXGAbaom/hzAbu0g8edJI4SfXJ6Yzz12RKkKaAF+uVx/5Pp9oMbFYRTcltldXkY
aYH5pjiQ2tQkZKbLtBnp3v0+/dflvc9DCaJm4uMwnSTE2AGclxu2LS3Ql7tqz5fBiIGaulCxbD43
FYvngOobdbSn0GNGasfTUu6dUUTpforz7mjVrTkGVvr3CwDdhFUs5iGlc0dp/CIxaG+FaRLrcdXz
5XJl2jHmbfiGJ7SSqzhneO+hR11qTq8s9xi703KLPBFtD8Nop55k+FxFnN+/PC4aTZWyuOymrVnp
r3UfR5ZzSX3GvfO9V7JI5IIdN38YEkVO9dawauBXiLyj7i0rwpolJr/ke7Jsj4BHaLmCZtQ/xUO1
eQTJm6moMmatBK664BUFl39LR8X4AgupsiYVrbb8dbLcoWi5aqeh+GvF2ad1EH5carpubNmJQ8E5
5FSBBjsTSgjvx6raP9UWLLZRbVXKQAZfaQe3J1aVzZGXRw2ytPSEZTBhPDNpqL0VLaclMlknDABb
2tLJAP0LvaQDrTeI3cdPKfZwp1V34eO95lotroltc5FaypYMRNbNhOHera9MHBOuI2Y60AUbsyrj
36IDOYOjatdgYWQy72NjWjNR4/wCr02awIXRlZS5MPYsOoj2m9y5TJ6DhzW4OkwZwPWwTuI8i+VW
hRxpZJSRkLzDRNsIFoFozSXjARAOVNjow1Dtt9MdMojPIOxgryV+gB9TaFEMD6y9wRbj9fAtwF8M
l4wmqs6cTVGzyQybaVfz6wBGdMV+JKw19gHhgyHK6ANCRQfTMemp1TUCbcxh/7trdTkGXiac04gF
hWRfHWNTO3H0P8FC92304oPQX2NylvoDqUFKnMB2uazGOjfUzOt9Zfi9mlsWcnL3AwMTOcopsoQp
LLJ8bv4cGYdwZHmnM/1azuKWG7frq2c9cPVAV1qQg6dvb9p8+oyIjTKUqb/uZtFuydTr1rD2fTkL
n3OAS3QpiLvWUTStG8jjVefb8LHx+LiyrN7FoTOInX+pnzH23N2MDAOVRX1HWNWajlx6+uSNkjj1
N9W1Pstk2ZgzWVKxgnWT8dnvFak1e2fUgICJ/lgqaEgITVzpMDEMAERAH40qcozCLGmsQ27OraAY
zy0/2yMBW5tFsRRtRGnXl0JU+01HmTJJ1ip0caYS+jlml+t71npP+mSOWV/sy2jjYo1QZXfgjSP2
6iakeF1RRU7CrTqpnR1DYS8XEd68kY+Cndw7g2KXW/7XVURG82mUsj7SOjar/q1WFDxNfS41fsiW
/g2vbjRowwSN60qbQMaAw5pIRP18cYidHxypp69PhHe42MZN9kbn5aovtTqVHVndqVZfyaCb7wBt
pBQ8i6a3aorvBe2GBdrFfsmgmDuKGDYcAeioGzwQMJS0Q8AzpgbBZM6CmJ5U4lizaeaa3dmvtWnS
kcjn1zcgNKG3dvc1qOHrmop2Zo2ybglZepMT3fOR8Q6NyGUE7b4oD/9hExgXaSH677YEVQ7V4JJ/
JTK67YriMRuBIsDg3ZqBbQf1XI0SRflz+U1IWesDZBLbfb6ZAW+NgxQOWfyBgE70RlAlYn3fQMP1
ybtEdx8cwsE8qBk86XVu2Taq964OuXtEDOGgEZzbYJJOYyBskcbtaB4R6KDllQnNw4kvc22O4QNb
/V/OS9T8l58cIPygpJ5QUd8U6oicEacSokv17qU/8FUYXcpV9Ob4f7ce2398o8O8FQ4x/+oM3sa0
aLqEPezp+4yZdRs5x5PfuyuwMm0xgKKFwi1JoKOorPp2Tx139Ns28+Wl7vzaF2S4U9y2bGwK0TgK
TctJfGH5DGB6ku83Ry4vOmG4lY0WaRoc2E/rLpK8t0RR8DU9axKktviYYL32ETDp/pwemNw1PA2p
d+WSQpANEQUqijhhQj0PuO+PMUKcG0wZkNuD5NJjxKcve9Vh0Uzkq5nRBRR+S1kKitsy0/e8YrYk
4C81uUghS6focK0LJpRX2v01cpUmReF1wXSO+UG10dlypLUDL1fuzQY8eaOiPNvDN4MhEiq0U2k0
XDiMcsUlMrYr/JlhLMsnHOPdJSN3adTIpXBvqHKOYaztDa5qsbDuG2gzdUqMgqVK8G5TESuN3DQI
jjJu7Ndk/dlxhgOKoOd6XDSZEyDBmV8trPwYcN4C0pH3+dnq+ejxOGk0RGfJT994n3gN5GUIgZ8w
QWrSol6mYwetmjJ66Bcwb5D4vV1fjZx9cvQp99f4GjuFvo0Em9oI/+LTZhkPpNMPbxIugkedRvIA
mL41FTQ8XdTaJQKlfp0aK9IgsJywJKdx1WfYSTKGo29vwAzTjfUsWTN2BOD0f+el45Q+MCQ1lmM8
rzAbSKU9VAP9FFrbmqI1pyPm5PUtlmSnFTXn8/UEVvLd6Kts6epqTrL72hwJd0AUfHiBW34+Ngd/
aTF3P1Up05rd10W/hw5Yza3vGgTd+/+4Phlj/vndFLVVkFTem2r5I+WxzlSjIynGvElBJdbmhpCb
3p7g46l2YOaxP7p7qcuuOxQ6Q0BVP9k2haaLgoL2bhmdQDs2Jk6Skg01PWUWYhEAvL4il7V4DeA2
qbsph5EFEKs6QdWWuz+TJKtt0S56DMdB2EyZwF8Q7yL71NjMm5slk3TCiFlDODVV6lU3lV83UUcM
MBQSXJ54uaXHaJovHges41irVph8JYnMbVMiXbcEM1xoeKFhMunAr1lx5InCVL4d9djqYKZByU+E
FczTuGmKdGdj9L9hl7KyDdEqsvoUC+DbjB4RZmijRM+OG7EBDi9tsXEf4kbD0Ml+XmIFAsTAIh27
zLrOdSBlGP1rRxm3dDcZXDe2zptqU3fieFY6wyTWkpi29mwxswiwFGtYlGLD7OGEdoLGk3/nBYCs
XWY6ht40e08v4zYZFseododbEX6m0Ie7urrzCAXYT1FpZCJ0YxxDQ/arWgmK3YbaBR21QD/75ycd
Zx/N+4F0iPOn0/Pth/I4WoJFMAzjKSlgMMEH+cKkBfVMShKkBTjjdEp/Exp3rO8jZfhuX4so105f
tZ5bTxVuTmUv5xbtVoeH9xbKdv3NmhBkSvcYDB6U4judXK/I8eSCv1aJ4u7pFJB5FUlYPxaG/QoE
QJWnGdUjcF71WEEQ/FFwu+lX8BvMtScrECo45OeYeHnf0di8ZBqMlccGJKiTtb/hHQuFwQy/0Ui9
m0VkP5qQXqVcu0nMTjmOi5inMIM6bJi8geY+WdIHfgjISySvwpU/CGu2weYRVG2IMZaT3vPFnurz
qqJKy5B3ZTMZ+z+06LG4U8AD43djSVPxS2zj5ctjV3WlMS8bJQbM9KFj1D4usk+q6fr62s0sRwVW
87lKXu3sdggkvY7piksE7AZxQSVmEQoWykDYD35R0ijLzwsLZ6Xvu7Mt3K1G+e/2vM2qa14MQ/H/
bmgD1lN3Dtl8aPnmodU447/w447PQ6MwHgHhSNDaVFiybHvV1nTn4Tgu+A3hiPfmdnXfyx6c+LIF
LaCQu1ZsByZCvBhsxj4ihUu+O2KbTdgtPsna32f+uGtRV1rJBZcJRYnzwlpNeBrKocpGO1PM65NN
XW663ETNRyOSy4rZTGO4AvdqwJ+NvYue+UJ3sVkb7/FlqTmjPN00R1CuTxPzmBX9/AC0ft0d1SXe
/qbaye+ZjWkVm6chF3tE+z1bQKKK0sfRl68v0QYc3TAPXPwWoD6/KAA6rJ2Xkv3Kx9d1kAVUg/K/
YLg2Zs6T/WnI75JtoV+cwOVyHX3uVccBWFTtXolbzzHu/R6tFBfOBArAZPKoUOjbXv2nwMim2xEQ
DrUMnz6YQnp6J1KRNqu+tB4VsxOex7II6nBzrEbAV10JlxhKOlLWU5QB1WvBccS7N6tVu8CNh0I+
sWQrv8rok3EWTM374YM3aDt+bj1H6dm3WO8WWLQblHCXy9LwaphHyHQIlnaolVT+ukVX2pTGwVV4
kVoUDfWVPQewN8Rv86HptcABmHfotP8/ACa0sgZ13B89LhfCUHe3Sltd+flFTXs9h7/jHm+NVDN3
Q/wzz9OzglckrUpRDXpIgTgpI44eUiC3RvbY/noiTFPnh6h96twOULwZ3Pn8bM3UMATnjHeLLurY
Ck/lL9UYfEXQkOITQyOzp09Lpj5H2J5w4AIxhP3/ftZkxQjd2mt6A5s0HscFgdaOAoE9KopvfmiC
T4Nz6FY536zCkzqNLIHFzSIKkPG02zp+2q+kzkcv9XBVXjg+Co3MKyUMMspiPGbowORoFfnxDcV7
vtufS9Qba/li7/gUmONPMCDxHnYHALfrYp6NfMOFRpCPIFoc0CRIl0x5X4K3mdTrRvQDT1VBPVl6
IfDP+fx7W0JGgvfeJvBXCoxpr1L3Q1NlI05KHRE8WKdidFNQbRkJR6QVyhssVVjFUqA2OhhcedZA
IojCoGRRnL4lWgK27ODa6D6OpdRgKuL+yurX65EXhJqLOtVjbLC7NK1V547ug7s/lCJe4sXQ9bwJ
tMwO4usbqzk5GjqVANmTVzV3itSLCcae8z3KEMaDHlneaqAEFLj2vk+amms7urkmWzlYHbp/Urj/
BbmImcRkSaUG9tZachd9lLWaQbuguuJLJ14yPVM0nTb7vkxkdRPynSTlhgweKXwxBGVaNcICDqLo
h2wZPFm6n5XM8oOihI08bHJXbrYvj2T4o7PeGInC4d3qMoS0BptPulLLYn7SMr8G3Ll/XaTk5faW
zIGiBjWXifjMDwDocF2raoojrfHiCLfIZd78h3LVFg+/yclMsRB7QByurqTKs3LXHDmBaCiogOjR
/p3MtZ9zGJ8WC/cM/Np4eXhOXtpvXrYSKqACXjHOsuK5jU8Nj7hcQhu8L/AOvrIQNbkGIVuulJCq
WpYko3BsRuQDJkRUknmB2/RS8Sle3t8ampol7+U2Y3bgUNsLvv2FqB6BE0059rctQou0RNqNiWjF
K5bkO5ATqcIZwFXe/kY0zHRa2cWKAFtBaU2UJAHv+IvYIXVfG4AsYOsX89bjJErlH0I2I3EmxsGa
yC8VJDXRtHf9vfh8HNz+mZY+UvKsdSlctTK3SmKHS4Qh/5LYT8am16WtB0Cvi6X9N8QqVqrbCMbJ
xe4tgK5RNvnEd4KD5OKlOf3imxo9SBLiKakm74sFkM+ksEbELWOMBi0d9Cnl/mtOB39P2d9L0RB1
aVIMFmG7a8BFXMGSqka1wEeJk11RtIIeCT9b8dFSOMj6wlyOrD7+B7P1Y51JXQ4rWsRO3GzSyLB+
IC5OnuJfTUtYvdR/XNZ65jM32jfylI9DknqKVt2vY8jysgpbdm2SKi98HLLxGJP7wYEWixTI0ej2
tCB8wcbaxYArJRH8kLS8EzeZiYFSPYoPYK/Cl7SkKE67jilvig4dwzZx24/y772j7xWxgjQjq+w4
7OibXK9gDcSvACj+HL8swJ0F7VEnbP6DMnVhIN5QLnfl2RxQJ01WvBwmXpYg6WhoCfcnOZnlBFv9
e8XduZzNX51QeohELK81Oluo+d11mgmlplAH+7kFMbdcbBYuNldWsEwLi2yMyvEldtJXNuya51jL
2giFg9gtAQoimKfOGd57AnA7SY0Q4vmURfiSbUGlJ/Ts8HOodof4eLY8MhouqnqX7RryQSXHYZDK
5fA8k21nA5OegH+DSSv9JyE9ud373fPwhjhwPYU93yVS9E6GA2uU687OtOqp5vJXZtY9HB3e95qX
jDL9zepazeBu72Oyuq3PPfsEnr15WNegNLN6Gh5lUb9jUSxL4oedrk+jXGg9/vvf0YIJLeLpJ1gb
hMKlwg0hp/hYwY1derz7cExfyhY2iDkbB1cHjhXRBEquhHbaQvF1+EqI++wDBFQ3vef4CTPJQMsI
yF/RIBxjrUZIB7IXG1HQq1cl7ukC3xNsaeBjePfROdz8Ki34W3/X9yj+vvGRWfICXMsmhDuDG85V
JvrS4EQLlpKNUvOCaFZ6ue+28waWGmC+RP0gu4FhKU93RNhp60mPmDZimy7Gj2CRCboGfjKYPha5
r8RDO1zwUF/1rcgRka75pQL/qke0zbTNjc3D/pMjkKGsQBTemjZNeCBmLqdaSDNii2SYgm3kIEV8
S9wZmKP+nTC6Qy7oBGQyBfJy+zb6Vu5RRt4rhjrPqrgf0xqze4WTya2NKG+yjeN1vG1Lhf9MfcK5
4UIVIdDEch9ITFBjIqwfwfK8P9cR2ZkUhRlDN2kyIZxMSnHN0C6HE3xz3/fuRt+zOf3Pxh+f6b4d
+yo4+iQJxHdM0I5hHRB918grtmAoSzgM2NQNC2u6etBuhFSUJFSKR5HmDuptx1V62HUR3oYwDoYS
px6LTnMTDg/jomDpHkNub05Xfp8xbc63bfPBycEx64pnKneg0/wgtSgFGWz5RV0Z17H2K7Zbrhn3
OFg3cA45zlG7EuhTx8bEOrA3UNYf7TIY2Yykt3JEqL34sjFAQHrS+vjjyG2QkqS25HWpJd7mda7P
AT3BCc16ynfBiC5HDA7yHD0Q13CNcKNQtil010w5Igr1znqU8icQpdFk/mdhc7NSU7cU0JL3s3P7
HXZuJwT+4+n40pq9eJDUD2FOq7DUovcchs1iyo87mGGk8A4gsIwkAvT6oiNRBCGXDXys3vogeCWt
xIZjcRcoH9DOjMr25SB5SCl1NW/W0+p1g608lHti50VpCetk6NLc/AuvXtuxFLzFaNZnqs9Lw0z2
A4UYlw/dH0fytJhFxvDSIEwZoxfbsl+INOUQpZDWSLEv37pT9vmDT5Ree0JOMV5FcZ2uvbAsir0i
o8bRE/U2i2Fqu675frzSQ20MPI7FBK8xuFErG1/fMfGBZKYMmMX38rvZ/oFlDe2BoFBUVkVqc+cB
oFWR/TRhuqv4GulPhDXahmbHdADJsaDd7dVJLJvq5sEnVC5cDOesljc1Fd4PyHYE/L/LPhXFtY0n
sKnbqOQRjK2J1tksewz684vvLVM8+8JgC1OpXCcA6ZIjhGBJQjNkxlYKUNaS7dhYuvDuhK0q4F2n
4zkMgK1Xj+JjESIVAenvZAaDMkgDiL1BRSsjuNuOc7M0+0q+mQM4sBCmUCgd1Irw1wU4U2bQ36Tw
WUIa50WoxkMUTadkRKhHwcx5g3eYBlptTxLpbuqomvzqnkbiYGB7tbo73tbNtMPjFUr9GN8kg8qP
6M0N+xcXqNePn+mqJa1imqiCYRA0Fef309mpVbUBcvkekO0/lwFAsMBoMpkLE2W6PYIPZqXWZZs+
qH9gx02OtgeBZTNNPWYRzJasImGMQH+Kbcp4TDjJq5jVVbsSUDc1SEloIE5J9AhPX5UK0LCfa9nk
aj4eXUfUsfx5G2YlvPRTr6UIc6ua8sSfIh0jjnxO1xhOshGiIfO1quPt2YQqiTtL4uaQTubIvBrn
9QsTDB5b2Drs3EXSExuv+Fu8vS+6dj3ZRmX3sbfRu8/EjSL1tPfXirk9rPbpR3l0loJTlWfNq+fW
FzwGVGpS8T1tLx+N18J5/VQWtVlZUepBvzPHWrmNzydMQfF5hc2AHnb4hCUuzv96G0Y5WDPZ9rnW
1LGjudFuAROTz3ZNRdFDxLNRLczkluSaJzP+WODyZxZM7PkNukOJne20HKmwDSI5+YhCMuFNeE2n
nZeENoD6ZPkGFWVoJPVylc8r8aK9PT3QXMmzxAvKUsGTU198fBAMrP5EGfxkJq1YkOaABTokNHjH
k0jfo7cWrFxlCskMzpkanEU/4NMTs5oW50Ls0AVRoMDzMEsmCDiif+t5T1igyG/tEyDJkGYC0hBo
OieeupmwmoTHXZbo3F/Ouz/VLoJuDXrw7FI0xgdkralfWu+/7sEofA+ZFIUzN25afgRLoFAnw6yR
q2GtRa4WtciGLc0FPEYcYQRtE19Vm9YcvJPGCE89cRYgSWOOoJd1AM4afRFHBS8L66RzhR6uAzs4
UClZv3Lv8Or+c7wkZt2h0zm7jNorl8F11TXls65Kty9lor0X7PGtIyHW3GLjti9crdMyaPJerQAd
p+9SytKP0p9sbnBLN5RZIz7PaoVehI90CJA8qj9Z9xOvLzzkGuN7n4Vhk50hkjEWP3UsXiAFwDql
l1kEjSJ9PoFE4YGG6BFdtAZuHgIBbj5LMqD8QKPJ8eCBcmz1dGeqzfGC4j+Emn6TWSy6iVNdLoym
Cn3I8SjijcRiHQlclxP+p6Z0NKRWTdczyI26ZtJs1cWKZV2QsT/FTkzkE/eJKaXJd952vmyTdgUf
SdXRUgelQlLn+g+/+ulqqKTRRM07tgd6A4ZyE6FrJqB9U7j0t1Hd8XfI3UwX99ZGDJSQfplqSUlM
k/bdekM+nE7lzk+Xd9mwsZGeunIlPEUSddHxON2kZZi3cLcsJNmnV0lrL23NdVIRvy2tp80xGRgR
ehnDaPl0pZgTxbUlZ8JzW0+bAUjuPGNldKQzOEaP+1zj5s8Fq4jYM9mLgC4QMREMoiEivrhzO6gg
6RX6TQvS+j4SCyzzCSxuKn1wN+HZmXjRKYsSiKfoFSQz02GD1UJzDU3elh+96FOWgzubPeP0Qs4c
ewHCIu6Tna+m8l8JMSO+7lUXMcRNzkdb8KhyVI/YF7fasMSXHPhnuNx173oBQSxmynzVPEdoQ15r
C/o2v+1BFowxYXgA8YPnUweUzyh1yHEIXuHmUX01FyVWO35r61VOynccgpQ0xggxTzLZJqgUVxFV
BDyaeklQ8l5M7srJbntjlNlXHO6h2B7IQzZk+OQuL3Zwrket6sYVO/4ULcvcVObN3iTKT2FF43QV
NnHdMs336n6wEjVpUHgz3UyEuKfH/gGl6NekAil969v3E2bB0wAp8zD/7OyVlvnYVbF/sbMazJet
H9ya1/9zanbaDXcdJ2+xO+2dTZeV4IUDWbU0MWziASsu3prpPCB4UZl15Df0Q3+IHP+cac6QrL2p
DrcQWNeayIUp3NuJog7utdnlf2w/umFgmCs/F11AHiWR9e7wT9AphbKWwYnUocmPBRX509J/HBiu
hw0RP+z08RhHUG1LZYafu1XvkSDdkP0HpYIrfTs4lozFCR4DawMASVoHLurAa0aiO6Zo0Ft0piMJ
wSLi3p7ilCEZ/DrbY5gkOOHa7kUk3SWw1XlkcF7dRzPOCR8BPTR8a9pWFMvqt8qc4EadOjkzA7BN
QFApeQ4MNOwSB7TgUnBrglRaiJW6TtEHPQfBDALWv99Y9TSsQVUijLfYIkBTMulk9K3laIFP9JqK
9YHVDork2y8Qh3oq193ZgqoPLjfv0lF8z9h1S5WB21JiOOjtebP6hxJ3xnYjrXVZmF/bkpnXp/vL
ZzCY0ilZo1/6/PqihNH/Ur3kefs4eg/JuKxP889Q6tiuXniCb4LoBzsU2iROGJm4DD5cnNkqMrdY
vcf3gWk047H1mcg3udTA9Qv96W0uAE8NKtPoRGafARmgduyA6D6QyqwBdstbBQSNQylEDfAA9atC
kcL3nW9R2X39Bg7+8UIpe2BxYa8h4ZIugBKV5/LbylEvl8uewRSWjLlps9V8UBfFznkGt/CDN5kA
gZS/F9h3MHH0GgY8Hws1sgvAo3Gkee2hCPeuhPnF1Liw/QUTMhBFr7nwci4sW36t43K18tt6FVUg
ex1DyTKpdF/luNwIduDPDbA6FhSRXBqPo2NDif1BRxUD39QLQBfEVcQ1LkAAxSZTgSa39xtMo0CB
pEjgk0PQ0F7sR1dj2wFcFpP6UGyH+3rBE907AZhshYRtAtEtUfB8hfYkJMH2hGEHXmmg808mOE10
TEhLwbI9QLsfCt9TJuf5V+93Xl26CbdoxxsmWG9EjEUxGPUMMv3gyyRMF0F5snFxMh2yEHCWcqAz
mtU7uP01Dv9aHsY+LniwEeNjzS8OZpu6s6x4yuWv5D0UWbJ+lHJiEtjOhLxEGM+LFDYRWVYxK1pE
OBa2FYZ7oNRmjgLuCUHIfR6H9mzkV4qjDJ5tKQnU/puV5ktg+dRc/MnCTUGQyn3QbM5bBM/0gUmY
wf70m3JDva+F3ANBTsFqtzxOEPq4YYuWZcDfUU3VwSllZExSAdvi4oYvpqMymnYIjy2MQxlWDR1G
tDWugV8qC9Mn9RChUxhnBMA+sFIsRTPhXlijXD6tvva7hFMnFcE6Vr0MVaFZZm1MryGTAgYzH787
C94irI1aKQzcptV7Tezlou3nZqJRJ12vyOz22PxtG3/30Pa3vBvDDyjyYPeWU1HTCVYJDdZeMt8Y
8psZ02JuMuVOiMdJSx/avD4AEyNtMjPJxS1dmsKx62mGoCkxV5++qAolC86iaddPuSXYKGQDTkkW
S2Q7Wx607snVoqNeuYIycWotuIaeIcqz9d3Dk550YKQ5Zx3LUbA4U5SJYTYQk5agJV+aRPtd4vxQ
U8rW47aHHishyHMeiDeiJJm9fF6gu7KYanZo9gwoiJ++++afFxRw9C8WixTW4I3kaSNovvlQAZCT
U5/3yJ0O6twqUHsuuP5ktN244csNlmKzzDJ+Gs0OXFfpebLqYBlJBWtOyOw0iOW4LruUdk8sOCY+
f245LpDxSRR66trpMLNIpWo6xpA+AdByoz+HWLR+NMYbXCmdTmUudiBwdYWSV4g7ib86zqfgsyCJ
QoHbN9bf6GgzI0Qlmu0OIa6rPBhiA5sJtWi2hyZRkATDbe++w5+t5d92Sp2fJmBmQbMJ1kwxHxpQ
xgaY5iMtSNcogPY+MG+0y6+YvV90FhsMwrQwKWgtUwDyY+L195NHsrAEQ4y5aFdCvtlhO2DD/BCr
hRSVcDnRCWJ8wkNJE+NcYUzTxyoMz2iMd20zS7pRvwEwo1KgFRUodgKxlsi1vkfz3GKc/m4dtLvw
wKLPvXHa9ZU6Ps2JyAfeQUWiJ3ChAbLsOB0ZHOlFy/8O4XSWuv7LWwTVqd3mMDJKxfe1T6xfT8Z7
R8xSg/7LiJd5XYy2yFBiie82JVBvMrKyGWyPoelE8XbGMcIvwy2Jq04m9uOXRSubqzKQXbLxOT+H
V9VmAyJjX5hUik1f6OwuOny9+rCJ0TiULDAPoQRvsfcyeBpoEACSBOMbpG0uDzLztUygPxd/D/sY
4Qk3GU4ONUL81O71HAG/fCJCWAXdA5FrxF0q5hUGYK4WC68mIH55A1v3WY+/35qzFvgHBhNshlaU
KEpRami5uGZ1xE5s6qR230RXuzZsX+QA79NX1lrKQXVG8wXq5IyuOnRC/sDdtDffOAoe6MtcwsRi
ewhZO+ctqrKdcQwQXQLL2tL8BRFzrjYOMOBw9lNpSxzvygWF864HpQqfL5ljez4oMnEYcb0xMpAi
BNX1HqNfbBa5FIYecrKDwT058OKf48Md5vwfIgklNABA8J8nXYZP25XQT9uUMIwZNeLy7wPWbuhz
ldAGuhF9nhVfJWUFsXDk3ZW50qmsLsk5Btq91c2X4belsF8sNSaxxwECQrgB55hMJp0rdFROR6+j
t8fWwz0lX41S2ddHElQB8dE+lB21sZMSdA7GMHET6IfF4DBFMyHRu93g3MQ5xGVU/19UwkEuzoBr
kNnplC6ZtaDkLdb9VwLZttSww3II/OJCQTv17Y+9PsIv8fO4wM6hydu4b41khq8yEz/D+O/GIwgZ
KWuveH5WlflMOEVcI1ntIgDcL7s7C7qiH3hYOxNJvSATlZTiMbIvabOnABlybCuEHPYzIi3iJLhQ
Oatx5WuaDY9ZcTSLq1NmN3VGSVk5pfpabBcSOaFDspaTimLPv79TOhVx5X3kEDdH79baNX0Uk2dM
SGoaegXd5dTiNltbYILAnnqR60Vs38aeZL85MXF7SgsxG29/M2VCFCLiAa3yBJD8JddhVIpyr/as
ufh8KCgGqwnI611VqVKC7zurXlUYoV1HhqUz99yCCW/BLf95Gjd0ApDSsoEawdj5FczFfXaTf8zw
J6qio+Hwy5cZqaWsNUvKVQ/Vwst4obs3XcYq4eYEv7p9k3fRPViJmCF6F2j9u7glJloQtvG/oxy9
DY5uWbJU1dPF+Vc8K5jGaUor/0EB00FRUHjhFiwhzMp1zQASBGsecsz+Qp6nv7jgE+QDjGmIyAqh
Y6W8rhgNj5hNF31VutgjRwJMgw0BRqR1hSO4piI+1TFWto89xeo+wmoKjQPCvvuB1SM9vRzBMi+p
p4dvFU8o5MClHjC6+EPCgLc/DcgKvyPXMimMjZI9J6Rsq6XlrFJN+1Yc4fbBlQWysSQCvg7sQ1M/
O3NoS6rz8rq+6KcQrR2NfJeo/AhfS1c5UA+jBdYPh9k4UxjxbpICIZqegolT5uxc6/V7jH8L+UbL
ltYn6viOdmBlA1GfkcEeQllOleW+9SddeEdmsz6l0tHEhUgFzBqgkOKvc24bnFtIcwZTu6ifqf2J
qS1aWuHyaRTWUg9eyJEx3HkYINgv9Dk+vPihkEzMSdAWmnxfGphc4ddl9PwTPPQgMYGNGWB/vr19
Qq1mBYJ27jVt9da9TgZqCOx/WH/F4DLQb+EyKtwWwcJycAN4FAcrYto0Umv4ffqgahhYLVdhIgIS
AIktRZar9/qviRhPMhDS0yzx3bAN3a4LEH2pRJk1P8/kdL3jSRhHz1zWmMpqlCLotRfkOv8vKfyt
HPBcWF8PMEBVnaoxPpuNxQjeqQM0slJcjs1bTEFOrvGEJnRQJFajjcfBcBS0W0NY6xKEmNEuGskB
N66nX9GYxnywaYLF6AaKZ0snRfTcD0lMmQlh2v0Isq8cpWAVmPzP8nt1pfPYG7jpUfrj84fuJ+Ik
JSjLpuyZqelOLM2JSj8q/O3fURxtovHWFi1iBF8gtEuV2gpjJsNLDjggY9Cwna21E7y5sD5UmLZH
IozHGz0jDRJL2CcOe89WfGwwhzW8v5VbwTrid69peSOwkwV3t5+KL4ktkHtN3QxznQKsNvvmCAyY
yMgKyuFCPWSmNqsWtfJ0gomewNk0Gl2fFMx5RePCPSHYRDzzDfHRDFz/be5S9QAn5FcmyETZgXgB
MtHY0ShQSpW+6Sd5nk9Ipc8zfR2k/a5dXXerasb4qjQhnvvOtEADfDfY9I8oP0UuD4kuSt5vsFPu
y4kJ7gv2IxQUcY1/7/OqArdsZuJIgaydrf00d96QlPipoud7Zqao7a8vdXoVZ5zT8WM7IOlKYDjk
xr743aUvamTMqxrsRIkAKzWjkkc7iIrb8r9oJHGOftphze/1IMvC5sxkBJUtSZgQSomeUbU8wDtd
kyuEBMewwKvSE8H7W8uxZ+o56ZXaBjKLOSOZqzmLGnYUpzV2a3S5Nc89ho3RBqsiH+iXpyxuLnjV
0z563yYUnPraamuCAIMl2eQ0C+1UBYmNMSQXKYjfZd4c1uTvbS6BbZ9ypt5VPNvoP6iH9lWHqsJt
v40oV32GwN7apPEttpftI0KxJ6qtQrm5C0xsvbW6xb4Bxxvqqhi76DZXFfOIbTBCjtcD0Ve0ZLW2
arTwqlRFgFCtb6ftzhDGPLCckDNHjCUdRWKsGfS+ezrZ4LLFtcbxi7BA5Yn5ECkVoWtm3RJr6z/H
S11CNOmEubTyvvhyP2bgu8ouFy2Nvu23Fodv+EWrXagCENv7/0aVf3sXqzTjpLpN79Ve5JU+x61e
Unc+qZGxyGuuZw4SwcxgyQBMrAGMjx4Sy6MYcqbbhmhVP5c7NojQkw1OYfxNpJ/vPxDj8kXxFGjv
Bk4+IeFjsMdAv174SuHIOhcW7PmR71BN6Dcy26Q6MouMN4XBHiUqfvwU5eS0AXasc+pYYrjWUmmV
7z4/wKLznhGHSbexxMFtsIkxtkrwhwseGCr4RdtZ9h1br+ZQEd1H+w2DLZancvkiUiFW1oa5BqOF
DwgBp+Yz7DTjD1FXgA042ePUPZaBOxMqR3M7SHcYgrgxrXto1DHlQ9jbQM8qX9xiQWI6GRBQCL92
nuuDUw5p5k9qTf0ONmo07CVy/eQSeknGAJ+I6Oyh0Jov2yNPBdgQKlaqMX1XdPgJTiSRnKgHVTsr
tKEai6igaTKityVFqe9lOtrIkDq+uTINioOQtH7qGf4UBOUcC1EuyBjfDQLJWVVG4fQB/eM6oSIK
FVSVCXbsmHTR0MoDWO4P70//aEDg22Tmkvs6eVzFAdcKCT03eWFm6D8XVjXELK/17RumbPfjd2X/
H/OwOVVsM7zvy1ecaTtXHMfJUioZx0RjuSFRBLrzjoTyyMTgkORiLhvqZhctFOLMjGebCpQkuyJT
4EyQaidqUF9fuyA0LRRzm4IZYl5PLbHQVTJRaS4ItLuxQokdgeohbvE+Rp4ONUcV+7+vvp/Jq/MR
M4g7+x8nSu7743fPK5LOB9a0mGa0NuGDRi8e3Ckzw1GtYOQORcJu5KMb/z6x7AOhEXs6PKVAZfcu
npNEB7Jd//pqovsMb25ct8LUcf3uNAVcYHpmCwwLna8QfuBWUczG7QNrwXFTx982MxJ68DwAbM3m
lWnzRJUAURFwzz70jfGn+PyZe+wwpy4q+xMn9zWYZAohNLjriJgcJk1ZthRhyp/Rji9jgjbwOvE/
vQZr1Me0ezrtLLY02MGVRNo8OTuj2VG76cECG9rh4FwciRZ841B+spDj2ioE1Ehx89NYN4J6lXul
yP29I28+gNHw0vPX2pw6ChAgzmrYKCfNLCVGkae4UoeY9ZHfSCE07vd9YGPRhizqiX7VClhiRccX
NuLH/f+s4iXyqPGfB7WxaQJ6XkVEgSYT4sTg/d+KY7HEuNeA0ceYSmTHccG2nL9zr7T4irfhW2Cm
oabCc/UtyfZ3cbTmfoHkRk4hMcDdF/TFOOMgSVxDddp6fB84seq/6mQDmLRxstpDbDvqlgo4vXdm
kSCKpS7IEKm424umlhbSuJaSu7rvpawVMVSYmt25p8Wz/jsfHQo4VjTBS0Aler3ZLyr+IgJEhzmD
zBemGVTevX8OnsDLpAmrYQrhpd+VvqAwGDbsL/aJanuCARr359+tMM9hx8Ae6eFAqWE0j/V3fjZg
dH/ZKU6YiLwyY0q8/U2wgT7med8JFBAMikMzEa837NvHFWE+w1HK2ZIwNx5RAuj1/aK1V+VrkbsX
++acLSJyIGuxTpNZXs/4RTVkV/CSvy+qwILpaLpiCREYp7jCLdrvRZOS3V4TJa946x4ll6HzwNfD
0j/C4ppa1xb7F1/nDDBtQXd1Lne2SRgb6GNoeLyGqbyUvseKl5jFxx8Z9u1TTaQQp57Iumj7ng3R
XnZhufbFglaCFWGQ7STKK8La8/fRorBau1rV0+xOyOil8MnBeZplc4OIHv0VAbzcKWbceKA4OO81
eEUeFuJSpHTcaVHnYZlrFH7DAcX5nkv3sSHR7Lk6TZrrPj6yjha87fTzs7LqGszwfsfQjc6k/bzW
RanRGGS8uxEOqgoLUszxIk4j4cm/qps1Dwo6cURHJRv1rgi0vdHH8C1rNdMhpA22M0n3AtyEPKtJ
Fg1BM3mNED52MIuK4DIApoG+g+NQRuiVaY/ClXZ6Z9bSDDP82br5dainiZ1K/dVdyZXaZmn1p+v5
NCDbiAmkHhNFbKRk4x336BYJcWgKT6JRXuS5/8aQAr15hYHOA13hz3EzXdchym26rUmKT3BzHlTt
D8cxmRqxF2GaBeFhSUChV3f2tZd5JUd5NylqOD5wTjt3SS+BIwmEl1L0MUWZfXIsGfJnSBkjPtSD
s79/zbMicZL3/3Yk69u2a6zeEANWiHy8ZDGOU1YZu7wp5ah+qgNJo9WPZeCLGYhE5svqQiEmekNc
S4cDyDAkgBh4fvKDTr9e7wmaXK9fZ6Ld9kfAvCqTwWA2owV2LuNhsZamYuYisw9R4Q5pFq4wmRO7
WXfAOrE5tv/af5hmMPj8Mkl62mUfIekqAYbmAOdtjZxIAKUynZoaupv67bCWLx+Qgz2g5in4nHLn
H8AISUtXv4l8GCXhMjRuySuSNUBUoO+vWonf5qaT703rHUKSlX/vHlqPc4MhGjtKNT5p1iTkPJWH
IHad24cq3cHlW3aJoWZ5DaHW1M6mwoei33sn08pz9uKhQSsAjuO9nPRTvlHGpcaH5/IgCOFRCpH4
LCTF9Y79VozSjMmFK6G5zCnIS9PAU+RyRP5EZxPEu1v+cdvFyLtV9VrMzc/DCVHVztG3QHr+vl/3
sHvFlpwAVXlMGvykjSeaiYt5Pwq8eM9cZbOd8N25fEe3RJ68dS2LIaTVfJNUZFN7OfQJqna3bnYX
HCFdI2t0YLL/RZgd1kcKp5WSGY3UGDjjeusr1QzLG1bOxChuTkmDSekp8pkq6HJK3GBnvAJYlwS6
zpLt7Tx9nkhaJe+g5MuWGmNou7QMa3CNIIRXHDxS7T9lRQaGAkwxo1i9SryKmd9CTjALVIKPBG5/
iYsKANG9qhVWqlU5LKNKZ6GMQmbDzYCRp2GftjpCDk9ffZn/6aq6yoDUioohUBX6bEZixjkuH6vB
7IlEEMfIDDwx12TQP7kPvOt8AvtKP6eM26a93i/ggiI8CtnwO2ih8al6K/6Crjcpe9JRbdkXpzPF
NamTHivh59kjt0tpRJplTZb44343zXHaa9jkDmYHjvNVobEsWTFnu2nDDaLXmdNMf+Q+6kZ1udKj
/+xNHnE8XtRPd+EVwcbrgt7Hbxb1zC/KOvlhjseYw7F9csCB9bK5lKggvv7lxD9Uw6GdNDItTSJP
Lgda16+P0/QonlSOeSQ25kHBU3kGfAPRCIpwTp6pzG/rsBmv0AcO2NBkCZcpfBS4Z+1gVgMB79+S
Vk79rrmkKaSRoH/c0lYLofGUAz73Xs622ZLEnqpqK51LzqrW4Tk9CjuH68mb+hQ7mv3N0+TLGscg
YqCRBxwtwS/9ATQRE2phg7KBnuIddIItSe0tKmwy8hNZKTNqOd+FpAkNFpynbEZtZN3X0bKOfOW2
6cI5vtpkoIE2h3jzsvBU9QrEowTEgpUI0SdNWaXnkTL3jHr5wlvrlhHOdP4q1rZUzKp8rsEnlV0o
+XD41lVaX8YjRuMZck2zOG/179awomFYILTm/e4BQxj31zxcExhw8tdfJQnzLYKRjSjjU37d7m41
uCDD5lIA/Bkjov/+SclC8+30hfMzAcV7WkyE/cRqjGX0mtuiPJvTBt0iTooLKCy0o6JKDrNV/UqE
JIECfT10tT6VVWENHnWe7hQM4egH+Dn4ArcpO8eanHAJ6cewB/g9tpvevSBO0MJGOC6LNveOoBO5
XAvDWSh7GbIpiVvvpN5MR/hzVap/vPNQewVOOTd0AFHdVgY8j6KjGsTHB0CVzPEG+gjCA1IN3wh7
hbMQf95VSud3y+TEt5DQO/qD0tGaYfN1XPrzzf8s15Ou5r8vG59sYpHaGVHQYRKKPkwguQg5KT+P
VGZ1HkjfWEC8tn9O+Ku1WcsMPJZp11yncXqEnyoAbwUZC2tPGI4vdqwYK2cmGW7jPcFExQ+87x5t
FSbravIoR1n0rxIuMovwyO1G/Z+PmMJcXb1qxxgQk79GbcO/jqePe/244eizX3cPrL5L8Nn46CCG
Kw0lzlmnkHQ46gvLAijgPcSsosg0OHw/2YUB2feLlprHZfTkqyIvH9+eAp2XaoHwvF3oIN4jCOY3
TDHKk7gBdDx9auy87pNNB+68uZMk4Q2O52joU62nNdMOcqYIou+g6WQReqSz/luKWCObx9eN9uaO
Q/+v54g3cV8r4iEl6NizTABHC3egaliSLCbD5ZtucP7XVCrprlTvohY15z2Y/Jf8c6o13Hq1fdDo
FQ0FZ0tKi3Co0eesxygyUbe0WpwEVDZtyKAzBb1NUI31zPVoaxo40/IvYDNoIkOtPaNzxFHWTfcz
jUp1S9OTYw8dYLc779ghePtkwwAAv+6+zmjThlYAAbfHAomiFEkhqV2xxGf7AgAAAAAEWVo=

--wGkseTiVgtpxYaHb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/will-it-scale-part1.yaml
suite: will-it-scale
testcase: will-it-scale
category: benchmark
nr_task: 16
will-it-scale:
  mode: process
  test: fallocate2
job_origin: will-it-scale-part1.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-fpga01
tbox_group: lkp-skl-fpga01
submit_id: 6426fefb17608d286342d30f
job_file: "/lkp/jobs/scheduled/lkp-skl-fpga01/will-it-scale-performance-process-16-fallocate2-debian-11.1-x86_64-20220510.cgz-d39e48ca80c0960b039cb38633957f0040f63e1a-20230331-10339-adid4y-0.yaml"
id: e58cfde2db89cfaa42333bf2680c11cd0273ec57
queuer_version: "/zday/lkp"

#! /db/releases/20230326225618/lkp-src/hosts/lkp-skl-fpga01
model: Skylake
nr_node: 2
nr_cpu: 104
memory: 192G
kernel_cmdline_hw: acpi_rsdp=0x6b447014
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_CVWL34300015800RGN-part1"

#! /db/releases/20230326225618/lkp-src/include/category/benchmark
kmsg:
boot-time:
uptime:
iostat:
heartbeat:
vmstat:
numa-numastat:
numa-vmstat:
numa-meminfo:
proc-vmstat:
proc-stat:
meminfo:
slabinfo:
interrupts:
lock_stat:
perf-sched:
  lite_mode: 1
softirqs:
bdi_dev_mapping:
diskstats:
nfsstat:
cpuidle:
cpufreq-stats:
turbostat:
sched_debug:
perf-stat:
mpstat:
perf-profile:
  debug_mode: 0

#! /db/releases/20230326225618/lkp-src/include/category/ALL
cpufreq_governor: performance

#! /db/releases/20230326225618/lkp-src/include/queue/cyclic
commit: d39e48ca80c0960b039cb38633957f0040f63e1a

#! /db/releases/20230326225618/lkp-src/include/testbox/lkp-skl-fpga01
ucode: '0x2006d05'
kconfig: x86_64-rhel-8.3
enqueue_time: 2023-03-31 23:40:43.811446726 +08:00
_id: 6426fefb17608d286342d30f
_rt: "/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 26b1c3709ddc924461221ffd397771b709658963
base_commit: 197b6b60ae7bc51dd0814953c562833143b292aa
branch: linux-devel/devel-hourly-20230331-025033
rootfs: debian-11.1-x86_64-20220510.cgz
result_root: "/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/0"
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/will-it-scale/performance-process-16-fallocate2/lkp-skl-fpga01/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/vmlinuz-6.3.0-rc2-00008-gd39e48ca80c0
- branch=linux-devel/devel-hourly-20230331-025033
- job=/lkp/jobs/scheduled/lkp-skl-fpga01/will-it-scale-performance-process-16-fallocate2-debian-11.1-x86_64-20220510.cgz-d39e48ca80c0960b039cb38633957f0040f63e1a-20230331-10339-adid4y-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- commit=d39e48ca80c0960b039cb38633957f0040f63e1a
- initcall_debug
- nmi_watchdog=0
- acpi_rsdp=0x6b447014
- max_uptime=2100
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw

#! runtime status
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/will-it-scale_20220823.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/will-it-scale-x86_64-a34a85c-1_20220601.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230326.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-da8e7da11e4b-1_20230326.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220804.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /db/releases/20230331003930/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 6.3.0-rc4
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-11/d39e48ca80c0960b039cb38633957f0040f63e1a/vmlinuz-6.3.0-rc2-00008-gd39e48ca80c0"
dequeue_time: 2023-03-31 23:58:54.287148830 +08:00

#! /db/releases/20230331202338/lkp-src/include/site/inn
job_state: booting

--wGkseTiVgtpxYaHb--
