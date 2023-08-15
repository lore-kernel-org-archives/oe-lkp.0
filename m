Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B065C9D
	for <oe-lkp@lists.linux.dev>; Tue, 15 Aug 2023 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692109079; x=1723645079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6hg2YcvGLYgUt5SBYbvydw5aUX5jxhW1i60QgghfCo=;
  b=fhqQ92f1MOVnSz1MPHvMqX9S6uuKjT5EqScfvX+IzIKNrL1zzFBNmGsg
   IoeI+0vh5i9rDkmdEBXPLKMPtuele15P2GB6TqcxkFhJzRELHNvumfoqd
   gpF2kNHnYYIV1Z8ehk+Ry0K/zpWRIeUT+C89oLMdSHQtCB7GBbRDkhJ5F
   BRHQUmtY1aEdW25KcmPgRR/52uu+f5ww8MQVa2ONsPGHNqC1MSfCpZtvM
   UnsvS2d9UYwx41gz7NrED1jTm4i3wS/PH40md1nKfzSY8pLdOKiRMzLfQ
   P4/iBQ3yo9qL0udLFU4lAyx76Mxe5EWrkD54eT1nIXUxip3hsBoR8PfJd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376015815"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="376015815"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 07:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="823857765"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823857765"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2023 07:10:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 07:10:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 07:10:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 07:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHBcRuVnowknUiEozwHhxOwBkZnaSVHYuursFRfOWOn+ta5LpRcYDUo/ksAswW3vsStp4wM6g2n0o2hH2eWHqaTAg6NyWnuh0l2tMzimwejaPePO3ny6eeC+LGqXOcJaeCR5HExqHyFBMKzIcyfgvLIxE8TmzQhladVMC6DhcDbbRdRMY6UrtmPuOWpOfdEqdI8PF9QSe2tSXBrteXJ1rF9F5cPTL2G734RG/re9EbzgD5EhV8tibuleCZzS1F1FMzcJPaf1JQKFUmgaKSiamtsEqcxw96Vte2dX5SxpBh1VubBvlkT/M3oV3XlRgMvGMzB8qEfRlInY8XxKjCYUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEOFoRP5GqWYXvkiRYcFLZ6FlPKaeZN4hQSOfZPUpBI=;
 b=PiZrBAxSfPb8daEtVlnvgi7EmrJcsxWUU92l0U5AmjH8knW5kfMFAy7P+IyztaQPXZb18KUkZHiNZJmS7zPaZ+bKgzLZe30mn0+rwL/xtSbngKK5SQXssFgEx1CHxpzHr/yXTgRlOE89zx+5gI9blaFvXNmQR22NlmvG2yTVzOnl+eNk4y1SoLtL5kGVF+vgW3GfYhdZTw2YOHodaDaaNVQIlKQDC693dxK8uljz/g92rkxGNWImGzSP7aTwpvDFQc0JjYSxisjbNVkvE5vRIRrO8llGYPu8kqzayI7CPdNWap6eQy88PNtdbUJzu691hUFsAHok7VZ6hmUbhNXEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 14:10:01 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 14:10:01 +0000
Date: Tue, 15 Aug 2023 22:09:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:locking/core] [locking/rtmutex] b0198255d9:
 WARNING:at_kernel/sched/core.c:#rt_mutex_schedule
Message-ID: <202308152159.cf6f194a-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: d8148aa3-0b11-4836-02ca-08db9d995057
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbFcy1TTs9rnjfmmgeP6916btIL461C/oBSyNehXCvL1Q3ccvUwZBanR3NcThhv4e7Odr6KOXRzV4jO8DYmdt7zFFWINeAf8AG8jFQ3whoqWPv/pcNzdPQqoclpoA87uYnYhczFG/oahl/+YpRiPVrGQ7UAl0fV7sKiS4P6YLfXVh0LmPvqiVtBPI9KSe+HDHNKlUhmSx1bzrD693EBxQrzJvRzQMg+tqdlWcuX5kZN9tUahErHos7Cy7gVUv9kOM8heMqxBLUl9h/fSKy8Ycz+UcngaVQ9SJxPEZbq+C/D1Q7amNO5NgXiB3xUcDWCPV0JdXtSsibzJiMC5QVMnQM+1JDbldilA3KyL8Ec+ODIuySmtI9adefWGzS7z4fYhOfe3Z1+kmOUZ7kTK+Ko8gKH7c06aK7SSjl+dEL68yNuEkVUAts3a9MDgIDIH9uMNxR1xekIZYl9ahtANQjDogmE5vsreixgs4LVjkNWkiad3Jj++Y260nuY8P5eHSdxZ0Xdf51aJD0iXsPwIR47/84IHYoKYgBf/X76XKTbAgPRbp73GEUBerbam54W/1nYQZx2A0GE7QXzmRAfe/75qlggV8AOaAV6Mul4K5wNCcN2hjCVGz/r6CDdAUPbmr2wDtGEwMh0L5aKtt8vISSh8eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199024)(1800799009)(186009)(2616005)(83380400001)(6512007)(6666004)(66476007)(5660300002)(66946007)(6916009)(6486002)(6506007)(1076003)(107886003)(2906002)(26005)(36756003)(66556008)(86362001)(41300700001)(966005)(82960400001)(45080400002)(478600001)(316002)(38100700002)(4326008)(8676002)(8936002)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AbaQ+yX0OuB+rkDHvq0GFCg2emGLs8Mx27HVDVBNfxpRyiKbDNDlhJSk1YKR?=
 =?us-ascii?Q?pHCUBhVRN9//7nZJ4J/pht41GF3qhoyvP9+2fsthNu39ffvGPH/odkQ8e6hK?=
 =?us-ascii?Q?aCT13xGlsTAddQpSwIvccdVW3J3z0JCex6VMQh2eQbMsYauyIztraoPeg5nM?=
 =?us-ascii?Q?nCKx5T1im5rMsd2+SSQ6B+dvtLW+xL/XtHunm3G9SHvfBrHKuhf4eVp3ZxME?=
 =?us-ascii?Q?LlOWQ+OBfW8A9HOEcpTxvKxsil81SNC7v2pGTb0j0obibXnC6WC1gaB8JPJZ?=
 =?us-ascii?Q?fshRM7fQqCPo1TqAL/9Li+Z+iL9rai5RJGS7fdC7obwDy/8fErTxkuyV6txt?=
 =?us-ascii?Q?Mtaw05yyORTz9SrLSAzZ4hzOMXT/EuP7ARD4cPcR1gUFSlKNd1E9jiEUgR1y?=
 =?us-ascii?Q?sQCYhKEJMSuK9DvZ2uf/BfD7QpdaiYwhUdwFf/pd8EmrrJHwhehbHsMoAMCV?=
 =?us-ascii?Q?A/8vr9eh4+Lp055+WS52rQXWuAVef11bFNtUBtI0k2NaxXtAaNDeVjK8F6k0?=
 =?us-ascii?Q?QbI7oTW5+eh+q1ecD2qKBcz6EmvYYwafKXtDh6dwKkl2oJkkmzURlX1uaDv1?=
 =?us-ascii?Q?mZR66kBY4va1lFDqpmSs8D4UCdpSoYxNwREpH1ZX8hkYqBZaY/VDwsgJnOdO?=
 =?us-ascii?Q?/y9XCADOj26EDADch4pJBZuXfulcx/Jx/a5wVtYglH5PlfGou51vi+BbNlm9?=
 =?us-ascii?Q?4m+up5LhzmcaDb55r6XfJdDLwuFjxc5cvC7pbNiCOnLk2HvVVDIHpoV+Sf4I?=
 =?us-ascii?Q?dfeBDpLKC5fM78Fx4HfUpCrKgFC7i2VQrrZX9PFB84hhKV6J9ytclRQ2VhdT?=
 =?us-ascii?Q?wx+B4HPLwZ/dCGJnundke5ak/8jkLS5ewfUhWUO7cgVv2ihabYHakDJXRJM0?=
 =?us-ascii?Q?dkcRKE1z+oWSJpZffwfjt0VsvHwMI2uo3g+ffTV8ig9Q6rdrTHiUF06QlVw3?=
 =?us-ascii?Q?emjGDLLPcL69Z4kisbwfdp8/+GxNYWxcu7pXk2yiZLD2WsBFzQQK934Y0jvz?=
 =?us-ascii?Q?PEP/0jb1MWaAmltRJ3mXPEUZj0cLyvxbkssnVVyJra0+JfUOVxJbDEi21g7W?=
 =?us-ascii?Q?8mn5dw0jaaTT+7dUCKxeOajys1z8+h9cOq06n7X++P99zKzrsOxmuCAC2F9Z?=
 =?us-ascii?Q?WFJrxvNuwTQQprXFDc+fJLBGKfN1jD+nq6nVNYjkh6bKo1OyeASkQSsLATmA?=
 =?us-ascii?Q?cjJmgm1d7/A3LkfeXy8gNeQq3JbIx+NZFWAJAIQ2DxHPQpDGu7mS1tnFcqFI?=
 =?us-ascii?Q?V5Fg2v1F3RR0xYzCVIrjCD4RKHCz+ohRmjVGF5asxyJeuSxpJqKTDJJ66Ds7?=
 =?us-ascii?Q?AEBo38WZ9rZFpfhmhGAC23Oki7Pg6jZJmThVs93l1BiS+jak7M/aWmRA3+Rc?=
 =?us-ascii?Q?NDgZhKWHbjP5muCZyt7+F0WytcXyF5SpJUdBrMLrEIdN790IeLPojvOIH8+0?=
 =?us-ascii?Q?XZUe6RfTKqhdu1IxFRiKMLJBhqbnMrbXnB2TeQjmIXhi+6IWLqzyWzXVD7Mr?=
 =?us-ascii?Q?9mt3tFesMLkgWppHzQteiEYIwqneEEddzcBOEmKBhWY8ak9F/6F3HT0Ksp5J?=
 =?us-ascii?Q?mx9Q6xg2l/0voBkWkwwwJS4XrJAOmolX/aUhdPVC6Ue4pHscbLqKnlLJ0vFo?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8148aa3-0b11-4836-02ca-08db9d995057
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 14:10:00.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OStECbxkwidsJQsFW30BUxjccmG9eR6AKWeL+rOA/bRcVur/crSToG3ZgE8Wfk8i8myDa8SCYeStyTaWEGheEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/sched/core.c:#rt_mutex_schedule" on:

commit: b0198255d93a8c78080bf2dd84c4b7b9248847ba ("locking/rtmutex: Use rt_mutex specific scheduler helpers")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git locking/core

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5

test-description: Trinity is a linux system call fuzz tester.
test-url: http://codemonkey.org.uk/projects/trinity/


compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308152159.cf6f194a-oliver.sang@intel.com



[   65.944345][ T3648] ------------[ cut here ]------------
[   65.944798][ T3648] WARNING: CPU: 1 PID: 3648 at kernel/sched/core.c:7080 rt_mutex_schedule+0x21/0x48
[   65.945540][ T3648] Modules linked in:
[   65.945835][ T3648] CPU: 1 PID: 3648 Comm: trinity-c6 Tainted: G        W       T  6.5.0-rc3-00006-gb0198255d93a #1
[   65.946852][ T3648] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   65.947643][ T3648] EIP: rt_mutex_schedule+0x21/0x48
[   65.948040][ T3648] Code: 19 83 e8 10 a7 ff ff 5d c3 3e 8d 74 26 00 55 89 e5 53 83 3d 80 10 00 83 00 74 11 64 a1 80 4c 19 83 f6 80 00 14 00 00 01 75 02 <0f> 0b 64
 8b 1d 80 4c 19 83 64 ff 05 84 4c 19 83 31 c0 e8 fd 8d c5
[   65.949534][ T3648] EAX: ec208000 EBX: 8a9e9b00 ECX: 00000000 EDX: ffffffff
[   65.950076][ T3648] ESI: 00000000 EDI: ec208000 EBP: e9e3dd1c ESP: e9e3dd18
[   65.950606][ T3648] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010246
[   65.951182][ T3648] CR0: 80050033 CR2: 00000001 CR3: 0aa78000 CR4: 00040690
[   65.951728][ T3648] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   65.952264][ T3648] DR6: fffe0ff0 DR7: 00000400
[   65.952629][ T3648] Call Trace:
[   65.952883][ T3648]  ? show_regs+0x51/0x57
[   65.953208][ T3648]  ? rt_mutex_schedule+0x21/0x48
[   65.953589][ T3648]  ? __warn+0x9f/0x136
[   65.953901][ T3648]  ? report_bug+0xe5/0x14a
[   65.954253][ T3648]  ? rt_mutex_schedule+0x21/0x48
[   65.954635][ T3648]  ? exc_overflow+0x37/0x37
[   65.954979][ T3648]  ? handle_bug+0x27/0x43
[   65.955306][ T3648]  ? exc_invalid_op+0x1a/0x3b
[   65.955670][ T3648]  ? handle_exception+0x116/0x116
[   65.956054][ T3648]  ? get_desc+0xaf/0xd2
[   65.956385][ T3648]  ? exc_overflow+0x37/0x37
[   65.956728][ T3648]  ? rt_mutex_schedule+0x21/0x48
[   65.957102][ T3648]  ? exc_overflow+0x37/0x37
[   65.957451][ T3648]  ? rt_mutex_schedule+0x21/0x48
[   65.957824][ T3648]  rt_mutex_slowlock_block+0x196/0x1e6
[   65.958320][ T3648]  rt_mutex_wait_proxy_lock+0x3d/0x65
[   65.958735][ T3648]  futex_lock_pi+0x243/0x312
[   65.959102][ T3648]  do_futex+0xaa/0xff
[   65.959415][ T3648]  __ia32_sys_futex_time32+0x141/0x15d
[   65.959832][ T3648]  __do_fast_syscall_32+0x96/0xb5
[   65.960214][ T3648]  ? tracer_hardirqs_on+0x11/0xf1
[   65.960601][ T3648]  ? syscall_exit_to_user_mode+0x11/0x3d
[   65.961037][ T3648]  ? syscall_exit_to_user_mode+0x3b/0x3d
[   65.961480][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.961883][ T3648]  ? rcu_read_unlock+0x58/0x58
[   65.966346][ T3648]  ? find_held_lock+0x23/0x5d
[   65.966716][ T3648]  ? rcu_read_unlock+0x42/0x58
[   65.967078][ T3648]  ? __lock_release+0x53/0x11a
[   65.967488][ T3648]  ? rcu_read_unlock+0x42/0x58
[   65.967857][ T3648]  ? tracer_hardirqs_off+0x14/0xf6
[   65.968248][ T3648]  ? tracer_hardirqs_on+0x11/0xf1
[   65.968634][ T3648]  ? syscall_exit_to_user_mode+0x11/0x3d
[   65.969063][ T3648]  ? syscall_exit_to_user_mode+0x3b/0x3d
[   65.969500][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.969890][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.970291][ T3648]  ? syscall_exit_to_user_mode+0x3b/0x3d
[   65.970726][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.971125][ T3648]  ? syscall_exit_to_user_mode+0x3b/0x3d
[   65.971558][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.971948][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.972349][ T3648]  ? __do_fast_syscall_32+0xac/0xb5
[   65.972743][ T3648]  ? irqentry_exit_to_user_mode+0x2a/0x2c
[   65.973170][ T3648]  do_fast_syscall_32+0x29/0x5b
[   65.973541][ T3648]  do_SYSENTER_32+0x15/0x17
[   65.973889][ T3648]  entry_SYSENTER_32+0xa6/0x10d
[   65.974580][ T3648] EIP: 0x77f5f579
[   65.974864][ T3648] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59
 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
[   65.976360][ T3648] EAX: ffffffda EBX: 76fce000 ECX: 00000086 EDX: 00000000
[   65.976890][ T3648] ESI: 00000000 EDI: 76dce000 EBP: 00000071 ESP: 7fd466dc
[   65.977456][ T3648] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000212
[   65.978057][ T3648] irq event stamp: 570895
[   65.978408][ T3648] hardirqs last  enabled at (570937): [<810944a8>] __up_console_sem+0x51/0x54
[   65.979082][ T3648] hardirqs last disabled at (570944): [<8109448f>] __up_console_sem+0x38/0x54
[   65.979771][ T3648] softirqs last  enabled at (570984): [<81ccd13a>] __do_softirq+0x2ba/0x2f0
[   65.980461][ T3648] softirqs last disabled at (570995): [<8100cf6b>] do_softirq_own_stack+0x22/0x28
[   65.981160][ T3648] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230815/202308152159.cf6f194a-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

