Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFC623AE
	for <oe-lkp@lists.linux.dev>; Mon,  1 May 2023 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682949657; x=1714485657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2jZU8eDm9gwaGnhT4/PFlowjuRDUn/78h27dFLZn/E0=;
  b=OWIm7dCz23IRv/stOiBadvU/IGjGR2R4s4kjQenu7RxH5V7quuNjf/Te
   GY9HD3j7wYXCzoLkChxkZJYf1eWPLM93gRQThetFz5G4BAMnw6D3Tl07r
   +rg2DdmtLlVuK9Z5GAL2riVTw4akA0JbE6jsqARibnVJlOvLBMqgyYouF
   qUt+ogsSWqsY59fSw5qNxNqioHvjKksDwHQsDmC0jkGf5N/vdW00Nsgy1
   ldRZcZf5epIuDFyN+7UGksF1aSWYz8+3RZ0vZdidsibBg9cXCnxvEgaoJ
   gCtVfI7Eta7d4j5C3oeDwVlm9qAqNwlu3uOHzjGidMIiuZZ4InhGNpaJd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328507109"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="xz'341?yaml'341?scan'341,208,341";a="328507109"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 07:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025633926"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="xz'341?yaml'341?scan'341,208,341";a="1025633926"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 07:00:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 07:00:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 07:00:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 07:00:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 07:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4Ws/w7a/YI0DChXqhbv3b34Ss+uEpm8J65O8GlDrFXu66TGbG+7xSjXRq0VOj3G8el847NChVsgVzvCtgqXYLJjYP8+bENNWiHJVAelK8p7B/QgLdpZyNVV06rMoQgYRcLF1LPRKyNgz4C9dF4/THCtbgxUo9YZjsTp/R2dU/Q6p5dtUsjcD4lofdQ5rrx3Mu2+ytkwD7lDx0GiLoF/r5FBoT1YC65MgPfKqYYbo77oV0V1ObP/laZf8K/WBtGY6Hu3tgbwVTKRYpY+V2OVK+ODUWOa1U646xm3x8rvRvAje3apsafWaJBYczRDjvlfaGhzx5PSLj1PvLtFic1+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THpW0rYu2BQ2NtoBCz5LhFN6Trgava+hSH4pOJGg3ms=;
 b=U0XqzVj1OdICCJiSPxvrcmKG6FlaZ7oCSEz2Mmb2Lq/CmaDDlSh3bAbOuOOhgLgCn7R9A710QWA/e2RjIG9gB5rVU+6r24lEGsVdXtYWAoaMrXoQvFmmE47CKsePhVMJ6XLDegsSrcuHVFYRb9UJsVkI0UHBYodS3GjaAoosSfswvmT6cNAR8lwQbMtBgIzDoHnXwwIBCfli8HSNBQgWxQgxkPzzBRgXXqnbubVKRgxJZ96cvFODFx7J43of+eVGsEj6H+bItx6tgfMaGcU6p9e8ghJv+RA18sMn6oc61aXz8TXIA1ZeyW8kJ22QmiJED97PLN6PZCSR8zULEOVXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:00:48 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e073:f89a:39f9:bbf%6]) with mapi id 15.20.6340.029; Mon, 1 May 2023
 14:00:48 +0000
Date: Mon, 1 May 2023 22:00:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Ming Lei
	<ming.lei@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	<linux-block@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [bvanassche:block-for-next] [block]  4cf040452d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202305012131.8562d30d-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="VxsselDYuGexJI2t"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cd68c0-7e0a-4476-2db3-08db4a4c76b4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdwArm5pE8ceWn1075AXvJoc9NXjgeBJIPW+/9OBztIIyI2EbRtx1PgARFvaVIYakWRKWNZHru0yQ9rWSFfaKgXmMSRSEBNAAr6Ltasu4Jr4llhK/TW+9seTmwCBeepdVB9Xa8kugh49AYEQo+hBSQBVjy0+TNQiZ66xHio6Qb7m5MigxOBgMvBCSUMTQSrSzI9EDqSnS48uBOxvdlSW+jBaN7W6wpRKqdaeSZyE2ADW4VwmKxCKSX0yyfyeQNvKbOALgFAxbkzk/PLuoB1E7Y5HAji8Gwl2fj6YZ0OhFJGLMrqs8lmDGY1BYnOt88iXz7xj0q6tBqyEfsSnP4MLO+gsy/o+thqlQvdBxHRTEdFT7rFGnnmrS/H7tPArsUP6ij9QDMZEnlo0aJyE3Bxt1PEBNvuFYkCQj49lw+0ypEuLaS49plloOHeIpL1F7fgTs6cadXpYTFATVF+8DbfZyA+u47/bvGlScLGLWsYn5NQfIfQZpFzw0ObyWrLRL2WfUISY+OD8IyUV+O4beeoiILc3tJi67dCYPtdA9lojsfiSTBTPCY8HGg+HEV2EdUVTh3hv0SO1YGI62hMPNKmIhkeuEIHZ9CZiXd6ny4D9+uZvv3prSHIeeDLa74sKagCxxV2otWm8emiQLNOL3oLqDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(86362001)(36756003)(478600001)(54906003)(6486002)(44144004)(966005)(82960400001)(41300700001)(6666004)(8676002)(8936002)(38100700002)(4326008)(6916009)(66556008)(316002)(66946007)(66476007)(21490400003)(2616005)(83380400001)(6506007)(186003)(6512007)(107886003)(26005)(1076003)(30864003)(2906002)(5660300002)(235185007)(2700100001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JWGGC6hBYxpfUviuJXcbgQIzlfM1tTc1YlMFOXmT1qSo73VdLolB+8wg63dD?=
 =?us-ascii?Q?u2NrNe93KPfHlvyD4zit6UrlXsmrCF+f7wzm1BS74LepzrKHcs0B0xBkmqLR?=
 =?us-ascii?Q?9OHz6eEPnaWpd/BvEp7YmKa3z9uxBjZ4iE01/bKA7EHWATu8WqYeY462DiFq?=
 =?us-ascii?Q?AXTzX1w9sBOzN9X3oZvsKTh4QX/R7JpiW6l6/jt+JGE94YUo2G3jrKzqEocr?=
 =?us-ascii?Q?+9UyoOfLMtuE2GqRDqg1G7S+W5kQfNF84VpZyF1RfBzE+MrUa13lnzN01d2a?=
 =?us-ascii?Q?yIW5+dEj4bsjg+vb+vvWnyRJ/xXZ0FO9cJH8h8Y+Zb+0PtqaQESFnbNI6FD5?=
 =?us-ascii?Q?vV28hwP2OzBk5baBCGu6e0u1LwmHwiSqUICKGm8qXHUZNdLyzDBI2dzWVIc9?=
 =?us-ascii?Q?76TbRLVQQm6Qumdzfxg+qmewauIud3KdbpeOsvL8H0rKAsP9pYOwO9mkiiLM?=
 =?us-ascii?Q?wf+qpqS1GGwmbXyDOhpbNpWLF6+dL1FqCnZLpl067994V7Il2v05uwgkc7kG?=
 =?us-ascii?Q?krn9VenlHOqFvYlU6k6wUVxU6A0nNqgpzH8+BoNTX1pMBQbZ2Zb0EXShLQVn?=
 =?us-ascii?Q?a7OHnf6UauehYPhHlIjJguuPTKuL4hlzLVuigcrpJUa71cCoKQi6p6AkglGO?=
 =?us-ascii?Q?RrUd+KpeMt62NL+YJJucJRVNXdCKexdNS4Lr2a/j52UVnlGXsMw8dbNtgaKJ?=
 =?us-ascii?Q?iLzRNb9N98jvY/dKTL0XR2FWPBC9TKQ43TkigK2hbvAjSmpRzQFwkorKMI4L?=
 =?us-ascii?Q?CkDSnAjDHBJ0Vlx3Jsnhicie9ZgXVn77hbMS5KNuXG2/bBy4oXJoTZMoSCIe?=
 =?us-ascii?Q?Gvzo5PLiy9AjM7y441cK7zbF01UxbWazqlJVAyrkf6l4tHuZiw88F2yOiDIe?=
 =?us-ascii?Q?fm4sUF/u8S9450WADuAIJj26ruN655yhz9Erj7Zin8ROfLIzH2M2G8mp+80S?=
 =?us-ascii?Q?VAqW64D1enn0db+ApdQxZS0XqLAbMLppZX8JaVL+HKs/5XJqEW0Y7QVq0VkS?=
 =?us-ascii?Q?+9I6W8nr6a+4vjqD6PjCNDi31V0URuvnGfmn29KwU5nn7Snscmuka2lxVMVx?=
 =?us-ascii?Q?RD77iQjCusGP7O+B6Le72K92/4smHdtFLrIPUHkls834CBg18paibpvHxv1W?=
 =?us-ascii?Q?lEEPZY5S9XmXLbglio0DGebdPOp+U5Wz2j2vBz5pFT3Hsn746JEX2u6AQ+aw?=
 =?us-ascii?Q?6m/Tn3HafSaF5LUlyawTfFJZc92OPiWEvTUctnBHwGNWQE3NbsAIMosrQf0m?=
 =?us-ascii?Q?VtonyyyPwia1h52nrBrYxQUe8Mn2+d4B4kcwOmjryuU0NlgHRwKbJst78D2Q?=
 =?us-ascii?Q?2Kk6eS+9Qg5ZDO19ZAVg/jeMxeyf8wuAksuid5fBFl1BY2uyENigxEBuf/db?=
 =?us-ascii?Q?RlfHOGKGMQPXs9hJY8c915wBRO8PBxjxhIC1PEbWnE/pAeNCVDXUECm99DxL?=
 =?us-ascii?Q?3UTEmV+qldcebMf+nqhv9i7XVENE7P6RDRbEtpavHjNm7CCH6xvG6rhwTdQ5?=
 =?us-ascii?Q?JymdpyQQdLPTzwhg9ENdZ+ipue0AbxIiwV2kXtRg09fnDLjrC/+WeFgDHTLs?=
 =?us-ascii?Q?1es/AHA0dXfgXj+NaaYmEZfawjg1x/hb+W3D95W3RT0ontxBRDRmL/qhWPr9?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cd68c0-7e0a-4476-2db3-08db4a4c76b4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:00:48.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh75bDQeFdPnOSRPgs5foXB1ESQbr8hptKUx3Y5mu7r2t1vsF543LwWvP3RIKDGiFQlH6XENESsd85UX+P3rUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-OriginatorOrg: intel.com

--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 4cf040452d1cb0a66a6cac74066b1d2cd2190e53 ("block: Send requeued requests to the I/O scheduler")
https://github.com/bvanassche/linux block-for-next

in testcase: blktests
version: blktests-x86_64-c1da4a2-1_20230425
with following parameters:

	disk: 1SSD
	test: block-027



compiler: gcc-11
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202305012131.8562d30d-oliver.sang@intel.com


[  991.305528][   T45] INFO: task check:770 blocked for more than 491 seconds.
[  991.312509][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  991.319040][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  991.327561][   T45] task:check           state:D stack:0     pid:770   ppid:769    flags:0x00004000
[  991.336599][   T45] Call Trace:
[  991.339736][   T45]  <TASK>
[ 991.342540][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 991.346822][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 991.351966][ T45] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:186 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 991.357198][ T45] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:186 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
[ 991.362427][ T45] ? _raw_read_unlock_irqrestore (kernel/locking/spinlock.c:161) 
[ 991.368095][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 991.372111][ T45] blk_mq_freeze_queue_wait (block/blk-mq.c:144 (discriminator 9)) 
[ 991.377429][ T45] ? blk_mq_queue_inflight (block/blk-mq.c:143) 
[ 991.382573][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 991.387633][ T45] ? __mutex_unlock_slowpath+0x2a0/0x2a0 
[ 991.394149][ T45] del_gendisk (block/genhd.c:667) 
[ 991.398427][ T45] ? __pm_runtime_resume (drivers/base/power/runtime.c:1174) 
[ 991.403507][ T45] sd_remove (drivers/scsi/sd.c:3637) sd_mod
[ 991.408208][ T45] device_release_driver_internal (drivers/base/dd.c:1242 drivers/base/dd.c:1263) 
[ 991.414134][ T45] ? klist_put (include/linux/kref.h:66 lib/klist.c:206 lib/klist.c:217) 
[ 991.418398][ T45] bus_remove_device (include/linux/kobject.h:198 drivers/base/base.h:70 drivers/base/bus.c:581) 
[ 991.423180][ T45] device_del (drivers/base/core.c:3776) 
[ 991.427358][ T45] ? __device_link_del (drivers/base/core.c:3733) 
[ 991.432328][ T45] ? __kmem_cache_free (mm/slub.c:1807 mm/slub.c:3787 mm/slub.c:3800) 
[ 991.437286][ T45] ? kobject_put (arch/x86/include/asm/atomic.h:190 include/linux/atomic/atomic-instrumented.h:177 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 include/linux/kref.h:64 lib/kobject.c:729) 
[ 991.441564][ T45] ? sysfs_kf_bin_read (fs/sysfs/file.c:129) 
[ 991.446535][ T45] __scsi_remove_device (drivers/scsi/scsi_sysfs.c:1459) 
[ 991.451598][ T45] sdev_store_delete (drivers/scsi/scsi_sysfs.c:1500 drivers/scsi/scsi_sysfs.c:781) 
[ 991.456308][ T45] kernfs_fop_write_iter (fs/kernfs/file.c:338) 
[ 991.461454][ T45] vfs_write (include/linux/fs.h:1854 fs/read_write.c:491 fs/read_write.c:584) 
[ 991.465543][ T45] ? kernel_write (fs/read_write.c:565) 
[ 991.470068][ T45] ? __fget_light (include/linux/atomic/atomic-arch-fallback.h:227 include/linux/atomic/atomic-instrumented.h:35 fs/file.c:1016) 
[ 991.474535][ T45] ksys_write (fs/read_write.c:637) 
[ 991.478625][ T45] ? __ia32_sys_read (fs/read_write.c:627) 
[ 991.483237][ T45] ? fput (arch/x86/include/asm/atomic64_64.h:118 include/linux/atomic/atomic-long.h:467 include/linux/atomic/atomic-instrumented.h:1814 fs/file_table.c:372) 
[ 991.486980][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 991.491259][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  991.496996][   T45] RIP: 0033:0x7f8bbf849833
[  991.501260][   T45] RSP: 002b:00007ffefa05a0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  991.509524][   T45] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f8bbf849833
[  991.517338][   T45] RDX: 0000000000000002 RSI: 000055ea87effb10 RDI: 0000000000000001
[  991.525164][   T45] RBP: 000055ea87effb10 R08: 000000000000000a R09: 0000000000000001
[  991.532990][   T45] R10: 000055ea87f6f850 R11: 0000000000000246 R12: 0000000000000002
[  991.540817][   T45] R13: 00007f8bbf92d6a0 R14: 0000000000000002 R15: 00007f8bbf928880
[  991.548642][   T45]  </TASK>
[  991.551541][   T45] INFO: task fio:1234 blocked for more than 491 seconds.
[  991.558431][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  991.564946][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  991.573454][   T45] task:fio             state:D stack:0     pid:1234  ppid:1217   flags:0x00000000
[  991.582498][   T45] Call Trace:
[  991.585634][   T45]  <TASK>
[ 991.588423][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 991.592687][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 991.597818][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 991.601822][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 991.606000][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 991.610535][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 991.615335][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 991.620396][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 991.624932][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 991.629039][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 991.634344][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 991.639649][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 991.644866][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 991.650257][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 991.655733][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 991.660618][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 991.666718][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 991.672209][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 991.677181][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 991.682222][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 991.687352][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 991.692754][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 991.697453][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 991.701457][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 991.706342][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 991.710605][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 991.715301][ T45] ? __update_load_avg_se (kernel/sched/pelt.c:77 kernel/sched/pelt.c:135 kernel/sched/pelt.c:226 kernel/sched/pelt.c:308) 
[ 991.720518][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 991.725041][ T45] ? __might_fault (mm/memory.c:5627) 
[ 991.729492][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 991.734115][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 991.738552][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 991.744382][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 991.749343][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 991.755180][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 991.760075][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 991.764347][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  991.770093][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  991.774380][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  991.782642][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  991.790460][   T45] RDX: 000055ff9e3b0e00 RSI: 0000000000000001 RDI: 00007fbb08e68000
[  991.798290][   T45] RBP: 00007fbb08e68000 R08: 00007fbb0962b000 R09: 00000000000002f0
[  991.806104][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  991.813917][   T45] R13: 0000000000000000 R14: 000055ff9e3b0e00 R15: 000055ff9e3c8d80
[  991.821732][   T45]  </TASK>
[  991.824645][   T45] INFO: task fio:1236 blocked for more than 492 seconds.
[  991.831556][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  991.838071][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  991.846578][   T45] task:fio             state:D stack:0     pid:1236  ppid:1217   flags:0x00000000
[  991.855607][   T45] Call Trace:
[  991.858746][   T45]  <TASK>
[ 991.861538][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 991.865804][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 991.870938][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 991.874944][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 991.879123][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 991.883661][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 991.888457][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 991.893502][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 991.898028][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 991.902118][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 991.907438][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 991.912742][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 991.917974][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 991.923366][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 991.928856][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 991.933726][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 991.939811][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 991.945291][ T45] ? bio_alloc_bioset (block/bio.c:574) 
[ 991.950163][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 991.955121][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 991.960167][ T45] ? bio_set_pages_dirty (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:295 block/bio.c:1480) 
[ 991.965211][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 991.970602][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 991.975313][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 991.979333][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 991.984205][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 991.988469][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 991.993168][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 991.997697][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 992.002232][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 992.006766][ T45] ? __might_fault (mm/memory.c:5627) 
[ 992.011213][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.015829][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.020289][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 992.026121][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 992.031079][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 992.036904][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 992.041775][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 992.046054][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  992.051788][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  992.056066][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  992.064315][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  992.072131][   T45] RDX: 000055ff9e3b14e8 RSI: 0000000000000001 RDI: 00007fbb08e68000
[  992.079947][   T45] RBP: 00007fbb08e68000 R08: 00007fbb0954e000 R09: 00000000000009d8
[  992.087771][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  992.095584][   T45] R13: 0000000000000000 R14: 000055ff9e3b14e8 R15: 000055ff9e3c8d80
[  992.103397][   T45]  </TASK>
[  992.106279][   T45] INFO: task fio:1239 blocked for more than 492 seconds.
[  992.113230][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  992.119759][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.128268][   T45] task:fio             state:D stack:0     pid:1239  ppid:1217   flags:0x00000000
[  992.137310][   T45] Call Trace:
[  992.140444][   T45]  <TASK>
[ 992.143233][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 992.147499][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 992.152629][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 992.156632][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 992.160807][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 992.165346][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 992.170129][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 992.175187][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 992.179711][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 992.183816][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 992.189135][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 992.194439][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 992.199672][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 992.205063][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 992.210539][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 992.215422][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 992.221533][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 992.227023][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 992.231978][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 992.237023][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 992.242163][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 992.247559][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 992.252264][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 992.256271][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 992.261166][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 992.265438][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 992.270150][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 992.274689][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 992.279215][ T45] ? __might_fault (mm/memory.c:5627) 
[ 992.283653][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.288263][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.292700][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 992.298538][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 992.303520][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 992.309342][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 992.314226][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 992.318494][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  992.324243][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  992.328532][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  992.336792][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  992.344602][   T45] RDX: 000055ff9e3b0e18 RSI: 0000000000000001 RDI: 00007fbb08e68000
[  992.352413][   T45] RBP: 00007fbb08e68000 R08: 00007fbb09628000 R09: 0000000000000308
[  992.360227][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  992.368038][   T45] R13: 0000000000000000 R14: 000055ff9e3b0e18 R15: 000055ff9e3c8d80
[  992.375851][   T45]  </TASK>
[  992.378777][   T45] INFO: task fio:1241 blocked for more than 492 seconds.
[  992.385647][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  992.392163][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.400668][   T45] task:fio             state:D stack:0     pid:1241  ppid:1217   flags:0x00000000
[  992.409708][   T45] Call Trace:
[  992.412845][   T45]  <TASK>
[ 992.415633][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 992.419914][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 992.425057][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 992.429074][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 992.433251][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 992.437795][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 992.442578][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 992.447635][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 992.452157][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 992.456246][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 992.461548][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 992.466850][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 992.472063][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 992.477455][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 992.482956][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 992.487846][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 992.493940][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 992.499438][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 992.504404][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 992.509447][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 992.514594][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 992.519986][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 992.524682][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 992.528686][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 992.533557][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 992.537822][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 992.542520][ T45] ? __update_load_avg_se (kernel/sched/pelt.c:77 kernel/sched/pelt.c:135 kernel/sched/pelt.c:226 kernel/sched/pelt.c:308) 
[ 992.547735][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 992.552257][ T45] ? __might_fault (mm/memory.c:5627) 
[ 992.556695][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.561304][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.565744][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 992.571582][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 992.576538][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 992.582359][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 992.587228][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 992.591492][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  992.597227][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  992.601493][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  992.609738][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  992.617555][   T45] RDX: 000055ff9e3b0dd8 RSI: 0000000000000001 RDI: 00007fbb08e68000
[  992.625364][   T45] RBP: 00007fbb08e68000 R08: 00007fbb09630000 R09: 00000000000002c8
[  992.633174][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  992.640987][   T45] R13: 0000000000000000 R14: 000055ff9e3b0dd8 R15: 000055ff9e3c8d80
[  992.648801][   T45]  </TASK>
[  992.651728][   T45] INFO: task fio:1267 blocked for more than 492 seconds.
[  992.658648][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  992.665166][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.673672][   T45] task:fio             state:D stack:0     pid:1267  ppid:1217   flags:0x00000000
[  992.682701][   T45] Call Trace:
[  992.685837][   T45]  <TASK>
[ 992.688640][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 992.692905][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 992.698037][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 992.702039][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 992.706217][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 992.710742][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 992.715525][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 992.720580][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 992.725109][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 992.729209][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 992.734523][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 992.739836][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 992.745060][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 992.750467][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 992.755948][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 992.760825][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 992.766914][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 992.772392][ T45] ? bio_alloc_bioset (block/bio.c:574) 
[ 992.777263][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 992.782223][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 992.787267][ T45] ? bio_set_pages_dirty (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:295 block/bio.c:1480) 
[ 992.792312][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 992.797703][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 992.802413][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 992.806418][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 992.811288][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 992.815554][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 992.820250][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 992.824776][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 992.829300][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 992.833825][ T45] ? __might_fault (mm/memory.c:5627) 
[ 992.838263][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.842874][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 992.847311][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 992.853137][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 992.858098][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 992.863920][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 992.868794][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 992.873060][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  992.878799][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  992.883062][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  992.891310][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  992.899122][   T45] RDX: 000055ff9e3b0f98 RSI: 0000000000000001 RDI: 00007fbb08e61000
[  992.906940][   T45] RBP: 00007fbb08e61000 R08: 00007fbb095f1000 R09: 0000000000000488
[  992.914759][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  992.922576][   T45] R13: 0000000000000000 R14: 000055ff9e3b0f98 R15: 000055ff9e3c8d80
[  992.930406][   T45]  </TASK>
[  992.933325][   T45] INFO: task fio:1268 blocked for more than 493 seconds.
[  992.940203][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  992.946719][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  992.955222][   T45] task:fio             state:D stack:0     pid:1268  ppid:1217   flags:0x00000000
[  992.964267][   T45] Call Trace:
[  992.967407][   T45]  <TASK>
[ 992.970201][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 992.974493][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 992.979633][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 992.983645][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 992.987821][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 992.992348][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 992.997146][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 993.002204][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 993.006726][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 993.010817][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 993.016124][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 993.021426][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 993.026642][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 993.032032][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 993.037521][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 993.042403][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 993.048505][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 993.053980][ T45] ? bio_alloc_bioset (block/bio.c:574) 
[ 993.058850][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 993.063818][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 993.068862][ T45] ? bio_set_pages_dirty (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/page-flags.h:295 block/bio.c:1480) 
[ 993.073905][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 993.079293][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 993.084002][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 993.088006][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 993.092873][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 993.097134][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 993.101829][ T45] ? __update_load_avg_se (kernel/sched/pelt.c:77 kernel/sched/pelt.c:135 kernel/sched/pelt.c:226 kernel/sched/pelt.c:308) 
[ 993.107045][ T45] ? update_load_avg (kernel/sched/fair.c:3863 kernel/sched/fair.c:4198) 
[ 993.111911][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 993.116436][ T45] ? __might_fault (mm/memory.c:5627) 
[ 993.120873][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.125509][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.129947][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 993.135771][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 993.140741][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 993.146563][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 993.151445][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 993.155723][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  993.161459][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  993.165736][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  993.173996][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  993.181809][   T45] RDX: 000055ff9e3b3c70 RSI: 0000000000000001 RDI: 00007fbb08e60000
[  993.189623][   T45] RBP: 00007fbb08e60000 R08: 00007fbb09055000 R09: 0000000000003160
[  993.197439][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  993.205264][   T45] R13: 0000000000000000 R14: 000055ff9e3b3c70 R15: 000055ff9e3c8d80
[  993.213095][   T45]  </TASK>
[  993.216016][   T45] INFO: task fio:1269 blocked for more than 493 seconds.
[  993.222928][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  993.229473][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  993.237993][   T45] task:fio             state:D stack:0     pid:1269  ppid:1217   flags:0x00000000
[  993.247034][   T45] Call Trace:
[  993.250169][   T45]  <TASK>
[ 993.252958][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 993.257221][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 993.262350][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 993.266366][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 993.270542][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 993.275078][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 993.279862][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 993.284907][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 993.289432][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 993.293523][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 993.298853][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 993.304169][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 993.309385][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 993.314775][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 993.320264][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 993.325161][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 993.331257][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 993.336750][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 993.341720][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 993.346778][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 993.351908][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 993.357311][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 993.362006][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 993.366009][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 993.370878][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 993.375141][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 993.379838][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 993.384372][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 993.388910][ T45] ? __might_fault (mm/memory.c:5627) 
[ 993.393346][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.397956][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.402391][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 993.408216][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 993.413185][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 993.419007][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 993.423892][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 993.428168][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  993.433904][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  993.438171][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  993.446429][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  993.454255][   T45] RDX: 000055ff9e3b0e50 RSI: 0000000000000001 RDI: 00007fbb08e5f000
[  993.462080][   T45] RBP: 00007fbb08e5f000 R08: 00007fbb09618000 R09: 0000000000000340
[  993.469896][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  993.477706][   T45] R13: 0000000000000000 R14: 000055ff9e3b0e50 R15: 000055ff9e3c8d80
[  993.485524][   T45]  </TASK>
[  993.488419][   T45] INFO: task fio:1270 blocked for more than 493 seconds.
[  993.495338][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  993.501852][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  993.510355][   T45] task:fio             state:D stack:0     pid:1270  ppid:1217   flags:0x00000000
[  993.519396][   T45] Call Trace:
[  993.522532][   T45]  <TASK>
[ 993.525324][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 993.529603][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 993.534748][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 993.538765][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 993.542941][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 993.547464][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 993.552262][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 993.557321][ T45] ? __queue_work (kernel/workqueue.c:1527) 
[ 993.561846][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 993.565951][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 993.571270][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 993.576586][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 993.581800][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 993.587203][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 993.592678][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 993.597563][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 993.603658][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 993.609147][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 993.614117][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 993.619160][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 993.624290][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 993.629683][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 993.634394][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 993.638396][ T45] ? shuffle_freelist (mm/slub.c:432 mm/slub.c:1958) 
[ 993.643281][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 993.647543][ T45] ? get_any_partial (include/linux/gfp.h:150 include/linux/gfp.h:167 mm/slub.c:2349) 
[ 993.652239][ T45] ? io_submit_one (fs/aio.c:1057 fs/aio.c:2019) 
[ 993.656764][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 993.661300][ T45] ? __might_fault (mm/memory.c:5627) 
[ 993.665750][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.670358][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.674794][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 993.680629][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 993.685606][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 993.691442][ T45] ? switch_fpu_return (arch/x86/include/asm/bitops.h:75 include/asm-generic/bitops/instrumented-atomic.h:42 include/linux/thread_info.h:94 arch/x86/kernel/fpu/context.h:80 arch/x86/kernel/fpu/core.c:752) 
[ 993.696335][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 993.700608][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  993.706351][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  993.710613][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  993.718875][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  993.726688][   T45] RDX: 000055ff9e3b0e20 RSI: 0000000000000001 RDI: 00007fbb08e5e000
[  993.734513][   T45] RBP: 00007fbb08e5e000 R08: 00007fbb0961d000 R09: 0000000000000310
[  993.742340][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  993.750153][   T45] R13: 0000000000000000 R14: 000055ff9e3b0e20 R15: 000055ff9e3c8d80
[  993.757967][   T45]  </TASK>
[  993.760873][   T45] INFO: task fio:1283 blocked for more than 493 seconds.
[  993.767837][   T45]       Not tainted 6.3.0-rc5-00121-g4cf040452d1c #1
[  993.774357][   T45] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  993.782876][   T45] task:fio             state:D stack:0     pid:1283  ppid:1217   flags:0x00000000
[  993.791918][   T45] Call Trace:
[  993.795057][   T45]  <TASK>
[ 993.797847][ T45] __schedule (kernel/sched/core.c:5307 kernel/sched/core.c:6625) 
[ 993.802114][ T45] ? io_schedule_timeout (kernel/sched/core.c:6507) 
[ 993.807247][ T45] schedule (arch/x86/include/asm/preempt.h:85 (discriminator 1) kernel/sched/core.c:6702 (discriminator 1)) 
[ 993.811265][ T45] io_schedule (kernel/sched/core.c:8862 kernel/sched/core.c:8888) 
[ 993.815444][ T45] blk_mq_get_tag (block/blk-mq-tag.c:178) 
[ 993.819968][ T45] ? blk_mq_get_tags (block/blk-mq-tag.c:123) 
[ 993.824764][ T45] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
[ 993.829823][ T45] ? wbt_wait (block/blk-wbt.c:670) 
[ 993.833915][ T45] __blk_mq_alloc_requests (block/blk-mq.c:488) 
[ 993.839235][ T45] blk_mq_get_new_requests (block/blk-mq.c:2823) 
[ 993.844551][ T45] ? blk_mq_alloc_request (block/blk-mq.c:2800) 
[ 993.849782][ T45] ? iov_iter_extract_pages (lib/iov_iter.c:1697 lib/iov_iter.c:1755) 
[ 993.855186][ T45] ? csum_and_copy_to_iter (lib/iov_iter.c:1749) 
[ 993.860678][ T45] blk_mq_submit_bio (block/blk-mq.c:2918) 
[ 993.865565][ T45] ? blk_mq_try_issue_list_directly (block/blk-mq.c:2894) 
[ 993.871662][ T45] submit_bio_noacct_nocheck (include/linux/bio.h:616 block/blk-core.c:674 block/blk-core.c:702) 
[ 993.877138][ T45] ? should_fail_request (block/blk-core.c:680) 
[ 993.882108][ T45] ? submit_bio_noacct (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 block/blk-core.c:763) 
[ 993.887165][ T45] ? bio_set_pages_dirty (include/linux/bio.h:84 (discriminator 1) block/bio.c:1479 (discriminator 1)) 
[ 993.892294][ T45] __blkdev_direct_IO_async (block/fops.c:370) 
[ 993.897685][ T45] blkdev_read_iter (block/fops.c:377 block/fops.c:596) 
[ 993.902381][ T45] aio_read (fs/aio.c:1524 fs/aio.c:1564) 
[ 993.906400][ T45] ? aio_fsync (fs/aio.c:1544) 
[ 993.910663][ T45] ? mas_find (lib/maple_tree.c:6432) 
[ 993.914844][ T45] ? __fget_files (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-arch-fallback.h:2363 include/linux/atomic/atomic-arch-fallback.h:2388 include/linux/atomic/atomic-arch-fallback.h:2404 include/linux/atomic/atomic-long.h:497 include/linux/atomic/atomic-instrumented.h:1854 fs/file.c:883 fs/file.c:914) 
[ 993.919390][ T45] ? __might_fault (mm/memory.c:5627) 
[ 993.923862][ T45] ? io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.928506][ T45] io_submit_one (include/linux/instrumented.h:102 include/linux/atomic/atomic-instrumented.h:176 include/linux/refcount.h:272 include/linux/refcount.h:315 include/linux/refcount.h:333 fs/aio.c:1190 fs/aio.c:2026) 
[ 993.932962][ T45] ? __io_submit_one+0x3f0/0x3f0 
[ 993.938794][ T45] ? __get_user_4 (arch/x86/lib/getuser.S:85) 
[ 993.943180][ T45] __x64_sys_io_submit (fs/aio.c:2082 fs/aio.c:2052 fs/aio.c:2052) 
[ 993.948153][ T45] ? __ia32_compat_sys_io_submit (fs/aio.c:2052) 
[ 993.953975][ T45] ? handle_mm_fault (mm/memory.c:5197) 
[ 993.958762][ T45] ? up_read (arch/x86/include/asm/atomic64_64.h:160 include/linux/atomic/atomic-long.h:71 include/linux/atomic/atomic-instrumented.h:1318 kernel/locking/rwsem.c:1347 kernel/locking/rwsem.c:1616) 
[ 993.962695][ T45] ? do_user_addr_fault (arch/x86/mm/fault.c:1436) 
[ 993.967754][ T45] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 993.972033][ T45] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[  993.977770][   T45] RIP: 0033:0x7fbb1ec1c2e9
[  993.982035][   T45] RSP: 002b:00007ffd42167d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000d1
[  993.990301][   T45] RAX: ffffffffffffffda RBX: 00007fbb15217890 RCX: 00007fbb1ec1c2e9
[  993.998114][   T45] RDX: 000055ff9e3b0b10 RSI: 0000000000000001 RDI: 00007fbb08e4d000
[  994.005926][   T45] RBP: 00007fbb08e4d000 R08: 00007fbb0966e000 R09: 0000000000000000
[  994.013739][   T45] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
[  994.021553][   T45] R13: 0000000000000000 R14: 000055ff9e3b0b10 R15: 000055ff9e3c8d80
[  994.029367][   T45]  </TASK>
[  994.032242][   T45] Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings
[ 1304.122324][  T251] Sun Apr 30 19:46:24 UTC 2023 detected soft_timeout
[ 1304.122335][  T251]
[ 1304.181166][  T251] kill 735 /usr/bin/time -v -o /tmp/lkp/blktests.time /lkp/lkp/src/tests/blktests
[ 1304.181177][  T251]
[ 1304.253585][  T251] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml&job_state=post_run -O /dev/null
[ 1304.253597][  T251]
[ 1304.739221][  T253] Terminated
[ 1304.739231][  T253]
[ 1304.973728][  T251] Sun Apr 30 19:46:25 UTC 2023 wait_job_finished --timeout 60
[ 1304.973739][  T251]
[ 1305.983638][  T251] kill 674 vmstat --timestamp -n 10
[ 1305.983648][  T251]
[ 1306.004060][  T251] kill 672 dmesg --follow --decode
[ 1306.004070][  T251]
[ 1306.030837][  T251] wait for background processes: 676 679 meminfo oom-killer
[ 1306.030848][  T251]
[ 1312.802761][  T251] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml&loadavg=21.07%2020.79%2015.89%201/168%205503&start_time=1682882724&end_time=1682883984&version=/lkp/lkp/.src-20230430-200205:236b18d8fe13:46412388565a& -O /dev/null
[ 1312.802774][  T251]
[ 1312.856192][  T251] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml&job_state=soft_timeout -O /dev/null
[ 1312.856202][  T251]
[ 1312.897310][  T251] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/cgi-bin/lkp-post-run?job_file=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml -O /dev/null
[ 1312.897319][  T251]
[ 1313.244434][  T251] getting new job...
[ 1313.244444][  T251]
[ 1313.345094][  T251] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:4568/job?hostname=lkp-skl-d05&mac=64:00:6a:30:91:48&last_kernel=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/vmlinuz-6.3.0-rc5-00121-g4cf040452d1c&wtmp=1 -O /tmp/next-job-lkp
[ 1313.345105][  T251]


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



--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.3.0-rc5-00121-g4cf040452d1c"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.3.0-rc5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-12) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
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
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_CONSTRUCTORS=y
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
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
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
CONFIG_RT_GROUP_SCHED=y
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
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
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
CONFIG_X86_MSR=m
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
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
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
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
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
# CONFIG_PMIC_OPREGION is not set
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
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
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
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
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
CONFIG_HMM_MIRROR=y
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
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
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
# CONFIG_NET_KEY is not set
# CONFIG_SMC is not set
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

# CONFIG_IP_SET is not set
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
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
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
# CONFIG_L2TP is not set
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
# CONFIG_6LOWPAN is not set
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
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
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
# CONFIG_NET_9P_RDMA is not set
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
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
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
# CONFIG_NVME_RDMA is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_SGI_XP is not set
CONFIG_HP_ILO=m
# CONFIG_SGI_GRU is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
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

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
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
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
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
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
# CONFIG_TARGET_CORE is not set
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
CONFIG_MACSEC=m
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
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
# CONFIG_CAN_DEV is not set
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
CONFIG_MAC80211_HWSIM=m
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
# CONFIG_SERIAL_8250_PCI1XXXX is not set
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
# CONFIG_SERIAL_JSM is not set
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
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
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
# CONFIG_PMBUS is not set
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
# CONFIG_BCMA is not set

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
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
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
# CONFIG_DRM_GMA500 is not set
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
# CONFIG_INTEL_ISH_HID is not set
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
# CONFIG_USB_SERIAL is not set

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
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_INFINIBAND_ERDMA is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
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
CONFIG_INTEL_IDXD_BUS=m
CONFIG_INTEL_IDXD=m
# CONFIG_INTEL_IDXD_COMPAT is not set
# CONFIG_INTEL_IDXD_SVM is not set
# CONFIG_INTEL_IDXD_PERFMON is not set
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
# CONFIG_UIO is not set
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
# CONFIG_MELLANOX_PLATFORM is not set
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
# CONFIG_ASUS_WMI is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
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
# CONFIG_THINKPAD_ACPI is not set
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
# CONFIG_HWSPINLOCK is not set

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
# CONFIG_STM is not set
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
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
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
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
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
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
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
# CONFIG_ZONEFS_FS is not set
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
CONFIG_NETFS_SUPPORT=y
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
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
# CONFIG_SUNRPC_XPRT_RDMA is not set
# CONFIG_CEPH_FS is not set
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
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
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
# CONFIG_DLM is not set
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
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
# CONFIG_SECURITY_PATH is not set
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
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
# CONFIG_CRYPTO_OFB is not set
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
# CONFIG_CRYPTO_USER_API_HASH is not set
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

# CONFIG_CRYPTO_HW is not set
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
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
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
CONFIG_DIMLIB=y
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
CONFIG_STACKDEPOT_ALWAYS_INIT=y
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
CONFIG_FRAME_WARN=8192
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
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
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
CONFIG_TORTURE_TEST=m
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=m
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
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
# CONFIG_FAIL_SUNRPC is not set
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
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
CONFIG_TEST_BPF=m
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

--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='blktests'
	export testcase='blktests'
	export category='functional'
	export need_memory='3G'
	export job_origin='blktests-block.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-skl-d05'
	export tbox_group='lkp-skl-d05'
	export submit_id='644ebc39066c7772ab6a5175'
	export job_file='/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml'
	export id='70309f5ab11529fcfa27c1b7e06c4ee379331a12'
	export queuer_version='/zday/lkp'
	export model='Skylake'
	export nr_cpu=4
	export memory='32G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/wwn-0x5000c50091e544de-part*'
	export ssd_partitions='/dev/disk/by-id/wwn-0x55cd2e4151977e28-part2'
	export rootfs_partition='/dev/disk/by-id/wwn-0x55cd2e4151977e28-part1'
	export brand='Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz'
	export commit='4cf040452d1cb0a66a6cac74066b1d2cd2190e53'
	export need_kconfig_hw='{"PTP_1588_CLOCK"=>"y"}
{"E1000E"=>"y"}
SATA_AHCI
DRM_I915'
	export ucode='0xf0'
	export kernel_cmdline='cgroup_no_v1=all'
	export need_kconfig='BLK_DEV_SD
SCSI
{"BLOCK"=>"y"}
SATA_AHCI
SATA_AHCI_PLATFORM
ATA
{"PCI"=>"y"}
{"BLK_DEV_NULL_BLK_FAULT_INJECTION"=>"y"}
{"RDMA_RXE"=>"m, x86_64"}
{"RDMA_SIW"=>"m, x86_64"}
{"BTRFS_FS"=>"m"}
{"BTRFS_FS_POSIX_ACL"=>"y"}'
	export kconfig='x86_64-rhel-8.3-func'
	export enqueue_time='2023-05-01 03:06:33 +0800'
	export _id='644ebc4e066c7772ab6a5176'
	export _rt='/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='89e4bc23ecbac22cdde94ac1df3699003338a98b'
	export base_commit='7e364e56293bb98cae1b55fd835f5991c4e96e7d'
	export branch='bvanassche/block-for-next'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export result_root='/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/vmlinuz-6.3.0-rc5-00121-g4cf040452d1c
branch=bvanassche/block-for-next
job=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-func
commit=4cf040452d1cb0a66a6cac74066b1d2cd2190e53
cgroup_no_v1=all
initcall_debug
nmi_watchdog=0
max_uptime=1200
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/blktests_20230425.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/blktests-x86_64-c1da4a2-1_20230425.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20230406.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='4.20.0'
	export repeat_to=6
	export stop_repeat_if_found='dmesg.INFO:task_blocked_for_more_than#seconds'
	export kbuild_queue_analysis=1
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/vmlinuz-6.3.0-rc5-00121-g4cf040452d1c'
	export dequeue_time='2023-05-01 03:24:06 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230501-94891-gla6dt-4.cgz'

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

	run_setup nr_ssd=1 $LKP_SRC/setup/disk

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='block-027' $LKP_SRC/tests/wrapper blktests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='block-027' $LKP_SRC/stats/wrapper blktests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time blktests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--VxsselDYuGexJI2t
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
WVo=

--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="blktests"

2023-04-30 19:25:24 echo block/027
2023-04-30 19:25:24 ./check block/027
block/027 (stress device hotplugging with running fio jobs and different schedulers)

--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/blktests-block.yaml
suite: blktests
testcase: blktests
category: functional
need_memory: 3G
disk: 1SSD
blktests:
  test: block-027
job_origin: blktests-block.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-d05
tbox_group: lkp-skl-d05
submit_id: 644e5d5f066c772a1f2a868c
job_file: "/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230430-76319-gcvwxf-0.yaml"
id: 6344940a515c5ad17eddf2fea62fba4035226b22
queuer_version: "/zday/lkp"

#! /db/releases/20230410163212/lkp-src/hosts/lkp-skl-d05
model: Skylake
nr_cpu: 4
memory: 32G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/wwn-0x5000c50091e544de-part*"
ssd_partitions: "/dev/disk/by-id/wwn-0x55cd2e4151977e28-part2"
rootfs_partition: "/dev/disk/by-id/wwn-0x55cd2e4151977e28-part1"
brand: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz

#! /db/releases/20230410163212/lkp-src/include/category/functional
kmsg:
heartbeat:
meminfo:

#! /db/releases/20230410163212/lkp-src/include/queue/cyclic
commit: 4cf040452d1cb0a66a6cac74066b1d2cd2190e53

#! /db/releases/20230410163212/lkp-src/include/testbox/lkp-skl-d05
need_kconfig_hw:
- PTP_1588_CLOCK: y
- E1000E: y
- SATA_AHCI
- DRM_I915
ucode: '0xf0'
kernel_cmdline: cgroup_no_v1=all

#! /db/releases/20230410163212/lkp-src/include/disk/nr_ssd
need_kconfig:
- BLK_DEV_SD
- SCSI
- BLOCK: y
- SATA_AHCI
- SATA_AHCI_PLATFORM
- ATA
- PCI: y
- BLK_DEV_NULL_BLK_FAULT_INJECTION: y
- RDMA_RXE: m, x86_64
- RDMA_SIW: m, x86_64
- BTRFS_FS: m
- BTRFS_FS_POSIX_ACL: y

#! /db/releases/20230410163212/lkp-src/include/blktests
kconfig: x86_64-rhel-8.3-func
enqueue_time: 2023-04-30 20:21:52.064366073 +08:00
_id: 644e5d5f066c772a1f2a868c
_rt: "/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 89e4bc23ecbac22cdde94ac1df3699003338a98b
base_commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
branch: linux-devel/devel-hourly-20230409-184633
rootfs: debian-11.1-x86_64-20220510.cgz
result_root: "/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/0"
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/blktests/1SSD-block-027/lkp-skl-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/vmlinuz-6.3.0-rc5-00121-g4cf040452d1c
- branch=linux-devel/devel-hourly-20230409-184633
- job=/lkp/jobs/scheduled/lkp-skl-d05/blktests-1SSD-block-027-debian-11.1-x86_64-20220510.cgz-4cf040452d1cb0a66a6cac74066b1d2cd2190e53-20230430-76319-gcvwxf-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-func
- commit=4cf040452d1cb0a66a6cac74066b1d2cd2190e53
- cgroup_no_v1=all
- initcall_debug
- nmi_watchdog=0
- max_uptime=1200
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/blktests_20230425.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/blktests-x86_64-c1da4a2-1_20230425.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20230406.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /db/releases/20230411192555/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 6.2.0-rc3-00010-g188a56965858
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/4cf040452d1cb0a66a6cac74066b1d2cd2190e53/vmlinuz-6.3.0-rc5-00121-g4cf040452d1c"
dequeue_time: 2023-04-30 20:59:22.550607359 +08:00

#! /db/releases/20230430200016/lkp-src/include/site/inn
job_state: soft_timeout
loadavg: 29.10 28.68 21.80 1/176 5528
start_time: '1682859649'
end_time: '1682860909'
version: "/lkp/lkp/.src-20230430-200205:236b18d8fe13:46412388565a"

--VxsselDYuGexJI2t
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

echo block/027
./check block/027

--VxsselDYuGexJI2t--
