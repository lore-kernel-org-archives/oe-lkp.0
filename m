Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF17378
	for <oe-lkp@lists.linux.dev>; Mon, 30 Jan 2023 00:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675040247; x=1706576247;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=zAmxoY2hcxQ/xKF4hiQYXGRBtQ0Oo7MkDrqYgfGyetM=;
  b=MJwwPzqcP2qAl7AwkEbvjwKXrEyKsKDorbdDLngziZV006JHtv9/5UBF
   uWyidhCIkxAgSIsHFjYZU+j/F6iQDO0k6k7MbKwGnFMO/ALlCukYEAhoZ
   0p9uCyY8hTZ86QyeS2iJ/fel4JFNS2tvv6T07P/zDx7q2fCfT/ZF9y0EH
   MN53CAgAaCdzqzXVrB4FQKCq4RgkGHH4DDeJRzynfnJR0S26PGoP8xA3u
   7P/HqCJaTFhq7+JBiE2hVDHXq2CCiw+6lQhwykA2yusswtCcmPKtl2mww
   foOlBMQQ+aRuNy8nzIjXDJh9LmWyxm7zynln+d6LpNmULenL47sNAUJt5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="329576406"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="xz'341?yaml'341?scan'341,208,341";a="329576406"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 16:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665898132"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="xz'341?yaml'341?scan'341,208,341";a="665898132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 16:57:24 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 29 Jan 2023 16:57:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 29 Jan 2023 16:57:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 29 Jan 2023 16:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtvoWO7dujtMoAEN1Hkm2lby3KPqEyA0xXOlH+pxCbL7Jmxnl549mbAZ+G3nCYbRHd/P+HKTQ2ea8d5HYG1k3CMGgbpZTZMmjNl4NZD/kkq0KjVpgjbmQq+SCgs1lWVEXlmuuaV8kjUuWZ7GY/zH3k6zpKRm9XQQZ0o3Ctumg+ijkQonnQNUCh062W59wWtPap0sNeYr7ElEXyxdNkwNLtYAnisPpiSGngDNYat5ENSJ+rNyq5SK2a2U8U2GP6d0tJ4UJSE4JxrSaldRhQ5cti/waWtUx9VKO33JMSGeXcj3a85wxzlbZ0RtjJkQ+fSJ+PeeBv8UNCGVzhdwThnv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq/2Q+T/E18Di2rBQLEeG+135FNpMKUA54vED3+rA7Y=;
 b=H4q1/fHefR9yamtyVS+lNhUlVM1avrtv+9ijjJEABmZPQvOW57nOKrtBsmnNH2vm5JMA7qmEhu6Iw7b8dbE6wgqZ0gU3EsxaHddnNv6UWRVAkQPQ85mLc580hd7yo5PUUy7EHn0bL6X2mXvPRJGlOv30qvALq/Wd05RX61gdBINzxuV6sbWpERCMUUW0u2PzZyB/BOkfaFnZHE19zYHrXNnQszZYJIvOraLONcppyLq9pSLbUM+M2vuzWTnmAhco8DtZTHa4KX85iRtNBz+wO5sKRKeF34Ll4naG0e9fGeKKvN/POIrCCbyKGtrtTjsnjbowXU31BX7MgUbiMywACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 00:57:15 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%8]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 00:57:15 +0000
Date: Mon, 30 Jan 2023 08:55:24 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Xiao Ni <xni@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-raid@vger.kernel.org>,
	<song@kernel.org>, <ming.lei@redhat.com>, <ncroxon@redhat.com>,
	<heinzm@redhat.com>
Subject: Re: [PATCH 2/2] md: Change active_io to percpu
Message-ID: <202301300001.af5d02bd-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="fg2Wa43YJNw6PR+g"
Content-Disposition: inline
In-Reply-To: <20230121013937.97576-3-xni@redhat.com>
X-ClientProxiedBy: SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: d70aefe4-33b9-4f7c-7427-08db025ced5c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vJCN7vWZaEz4hE8ut6arpgy4ozHdWNJRybo/wbZQM09svD1BAg3CZsMUV5myL9mbdwz84BS5QqtvyKpCn9cq4inO/WtwyUP9YBj4ZsCB35LdZvJgUs9uAaL6FazgXfZhxHi1wc4aBT+tgT6vwpHGZ/w9vuA4k7Bc6IIlDBTdxHDZiL3DpFPbKO4KEXtvJ7nxgsAPDRnWAjEUMjjIRsQtqC8h1xD+eKiVNNz43W0kzfNlXBvs0Ln5p/c2W7VygF5WhGc2LV2kUhrcp6zvg6Y6bRECUxGBaADTDbCADu5/Rwfj/9I+8x8sMH99rdG0hExs20yHkaHPxbG6sNqsSGPl4NnJf6DiQaPadt9u9C1dJzXKGLinF53L96ZQoV4ftrityM9nfKrq/P/PttBAvX81ELkELYoSvqnhOJeEOktRdpUPNF7IoQ/Y91N0Ev2RxYgJlC0m58c6UrsAHFvPdGNcedkZWdmTX0vxwabhVDgE2/44ZNhJqBWhIvJ2d3aFk8EpArGcfeRKu+SGy4W4j+Sy7Wphg57AKQA5bKTgXBgoOyHeFr0J+uPrvDvqfh7MIan6qWU1dSfluS7gDwt+nLxF7FFDl6OUR/ykjDubfvLESZHeoq7rMZthBoLcoBTJvGWlhcEQR2Q4jjiYEUvnswItJrOh3UHMENyGVQt9Gfi40AJW48xDTRX3cmy9szjTYoONGds6AyfGejX6VQ34vAWZqgR4OvI6wNYikenfiQvjfWSUjThN3DVWyjdr9+vPzZoulowKQvYpMOCE69XnsgTSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(83380400001)(30864003)(2616005)(86362001)(38100700002)(82960400001)(45080400002)(2906002)(36756003)(44144004)(6506007)(1076003)(6512007)(21490400003)(26005)(186003)(478600001)(966005)(6486002)(6666004)(8676002)(6916009)(8936002)(66476007)(41300700001)(4326008)(66556008)(5660300002)(235185007)(66946007)(316002)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7btEhzGNkE1kz2EzdpnLAIn2dbHv6yWFm9csB6VCs/7/96s1FlZbo/Uo2lP?=
 =?us-ascii?Q?TMDaP49NLCwSYFBSNkj8u/d+p02Qz2oyICjiZuncJeumtwYeAT/Sm4DKLVJ5?=
 =?us-ascii?Q?Nf0SDBSdSVm1ynkTqtVXAVHKBEQiMX7kY06Evnnc+TD4tttd+7G6eWYHgYXl?=
 =?us-ascii?Q?cQzCUMA61pxBRun4YyYTSPx9D873t8y6g+lG1OheWfRnZ0ighcuG2oXkySXX?=
 =?us-ascii?Q?zqG74FvNzE38E3VvC3cZCb/O/xEnT/saDp56zxScCBvBN6w+7tcBzMKUZJtC?=
 =?us-ascii?Q?vbMaZJ3e3lHLmsqi6lmytKHQQDu+U4DupewP2lM99YVqI8JFfWhQnnbrKE+i?=
 =?us-ascii?Q?b3fATGDUOXiCrNxnMoqSf7q3y4+a0nR++CmsWritHqNltOt2vQ9UrNgLUhVo?=
 =?us-ascii?Q?OcBas6Tp6V3jKtYMdTmhuMK0ss6yLN8rxfb1QxKRIa8jYN5cu26eG8dJsJ91?=
 =?us-ascii?Q?skdjq0R/CZK+JVIXGBNFdNeBnoNiWmDtjAp/xzhW2X4KkJqdSHsyjmiJMuyq?=
 =?us-ascii?Q?OJdTVt97MU1AKcgulgLQGIR+Pla6tcc1mkALBtKcGYwgEo9GG9+rZIflo4Zn?=
 =?us-ascii?Q?O8PCdrtBRKOCFcWFyETdHMK8dvsfKKVhnsXQyPJn/nAx5uLDA0xcCtcXXFgN?=
 =?us-ascii?Q?5uKFLEu53+vuxBNDc3d7pYKKAGeLc/ymK7kB41R9OnzwYrh412UpHnQ5ADBG?=
 =?us-ascii?Q?K9je7fT6OY0QdSfRtQGqWTNBHYUevWwKT4Z7umYJHvMqbNZU6yFFbENG7J5J?=
 =?us-ascii?Q?3sddzVy4yCO5wZoQLCifSVlmoFm3LsYbIm5Kunj011c0syEsontRPoHfUDgL?=
 =?us-ascii?Q?v6rE9597GzAdX/8gK6z5evsXE1lF2iL8imczJ5WV1SFoeyLVhVh6niX0otBm?=
 =?us-ascii?Q?rqZ49l6VIYZdkLUi5ApJNitpWYqYeh9zqF7D+rmC/0wAXyAw+zSQqSxaxX97?=
 =?us-ascii?Q?qNw4OFtfwWQ4EhqeI+sj+GUowGEqo5CrszGMo1dCVWYEdOyCSf8pYK0ITWX1?=
 =?us-ascii?Q?T6iXGFzAfJzli1tvg+rEmAmZL6SywWxV0YYQi+KSEA14iMQpAs6oI5fZZPZd?=
 =?us-ascii?Q?K8avnmTnzOtSDCiMcXep9/Lki+CTXsMaL0mVpDs4JL0L3SHTXs24izvzn9OO?=
 =?us-ascii?Q?hYgsmq37ZV2Qhj5bjc8KxfOTbSLzdVLFg5JScCyM+igOMBhdrx4B6QnAkRrs?=
 =?us-ascii?Q?yA+JS+C9rAxCrkA/53Ds336IH/8+2Vd+3jwRNcwJvyj39UIYiaUQiLBvCSXX?=
 =?us-ascii?Q?PQ0BtBJp3twjHMfmZGVyY8A0QJDlXwreaTEwAafiIwO5Fm14CuTdFRGcvPff?=
 =?us-ascii?Q?TrYs6NhjzljnD6/Qc+wZutD3QhoWxmfkvyDHVfjG6utgUgU4iJur73HK2V5h?=
 =?us-ascii?Q?FiOZPjuxES4iq70gpLV10xv5I0sEH1ejDOp/QKu2G7AQYDDAA9dsyuWzPci+?=
 =?us-ascii?Q?r4k70vBQj7D5r9aiXZ2+w6MdnQ1poEt55EcaONJJFfzveiproIE9J+webx0z?=
 =?us-ascii?Q?MuDyO/xj+jV/3d67dERJAVhQNt+Nyr0jfOTBMZeJ2mLldfDVo+byKxancOnr?=
 =?us-ascii?Q?6cM3PwwfvDOYBB/NXXekGZQ21gUIuXvxwxHiSIOy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70aefe4-33b9-4f7c-7427-08db025ced5c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 00:57:15.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+i05/EqmZ35+pT9JKxvNf2d1uBfw9zz4fbHQxNT90baL7mXouVMP5Mulo3F50T8aGoXidP7jmri8Pglw/mNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Greeting,

FYI, we noticed BUG:scheduling_while_atomic due to commit (built with gcc-11):

commit: e087fb7cbc509d8dc2da3baf20651308a9d4066b ("[PATCH 2/2] md: Change active_io to percpu")
url: https://github.com/intel-lab-lkp/linux/commits/Xiao-Ni/md-Factor-out-is_md_suspended-helper/20230121-094103
base: git://git.kernel.org/cgit/linux/kernel/git/song/md.git md-next
patch link: https://lore.kernel.org/all/20230121013937.97576-3-xni@redhat.com/
patch subject: [PATCH 2/2] md: Change active_io to percpu

in testcase: mdadm-selftests
version: mdadm-selftests-x86_64-5f41845-1_20220826
with following parameters:

	disk: 1HDD
	test_prefix: 19

on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz (Haswell) with 16G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


kern  :err   : [  112.076360] BUG: scheduling while atomic: systemd-udevd/1255/0x00000000
kern  :warn  : [  112.083730] Modules linked in: multipath loop raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx raid10 raid1 raid0 netconsole ipmi_devintf ipmi_msghandler btrfs intel_rapl_msr intel_rapl_common blake2b_generic xor raid6_pq zstd_compress x86_pkg_temp_thermal libcrc32c intel_powerclamp coretemp i915 kvm_intel sd_mod t10_pi crc64_rocksoft_generic kvm crc64_rocksoft crc64 sg drm_buddy intel_gtt irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel drm_display_helper ghash_clmulni_intel sha512_ssse3 ttm rapl drm_kms_helper ahci syscopyarea intel_cstate mei_me libahci mxm_wmi intel_uncore sysfillrect lpc_ich i2c_i801 libata sysimgblt mei video i2c_smbus fb_sys_fops wmi acpi_pad drm fuse ip_tables
kern  :warn  : [  112.146986] CPU: 7 PID: 1255 Comm: systemd-udevd Tainted: G S                 6.1.0-rc2-00211-ge087fb7cbc50 #1
kern  :warn  : [  112.157699] Hardware name: Gigabyte Technology Co., Ltd. Z97X-UD5H/Z97X-UD5H, BIOS F9 04/21/2015
kern  :warn  : [  112.167178] Call Trace:
kern  :warn  : [  112.170332]  <TASK>
kern :warn : [  112.173140] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1)) 
kern :warn : [  112.177507] __schedule_bug.cold (kernel/sched/core.c:5736) 
kern :warn : [  112.182309] schedule_debug (arch/x86/include/asm/preempt.h:35 kernel/sched/core.c:5763) 
kern :warn : [  112.186850] __schedule (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 kernel/sched/features.h:40 kernel/sched/core.c:6399) 
kern :warn : [  112.191046] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:186 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162) 
kern :warn : [  112.196280] ? io_schedule_timeout (kernel/sched/core.c:6385) 
kern :warn : [  112.201429] schedule (include/linux/instrumented.h:72 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:141 (discriminator 1) include/linux/thread_info.h:118 (discriminator 1) include/linux/sched.h:2229 (discriminator 1) kernel/sched/core.c:6581 (discriminator 1)) 
kern :warn : [  112.205448] md_handle_request (arch/x86/include/asm/preempt.h:80 include/linux/rcupdate.h:94 include/linux/rcupdate.h:736 drivers/md/md.c:427) 
kern :warn : [  112.210249] ? md_import_device (drivers/md/md.c:410) 
kern :warn : [  112.215137] ? __bio_split_to_limits (block/blk-merge.c:389) 
kern :warn : [  112.220459] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
kern :warn : [  112.225520] __submit_bio (block/blk-core.c:608) 
kern :warn : [  112.229888] __submit_bio_noacct (include/linux/bio.h:611 block/blk-core.c:658) 
kern :warn : [  112.234863] ? do_mpage_readpage (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/buffer_head.h:131 fs/mpage.c:292) 
kern :warn : [  112.239925] ? __submit_bio (block/blk-core.c:632) 
kern :warn : [  112.244467] submit_bio_noacct_nocheck (block/blk-core.c:702) 
kern :warn : [  112.249962] ? should_fail_request (block/blk-core.c:689) 
kern :warn : [  112.254934] ? submit_bio_noacct (include/linux/blk_types.h:239 block/blk-cgroup.h:390 block/blk-core.c:796) 
kern :warn : [  112.259996] mpage_readahead (fs/mpage.c:350) 
kern :warn : [  112.264639] ? do_mpage_readpage (fs/mpage.c:350) 
kern :warn : [  112.269791] ? blkdev_write_begin (block/fops.c:28) 
kern :warn : [  112.274696] ? __filemap_add_folio (mm/filemap.c:910) 
kern :warn : [  112.279843] read_pages (include/linux/pagemap.h:1245 include/linux/pagemap.h:1285 mm/readahead.c:167) 
kern :warn : [  112.284038] ? scan_shadow_nodes (mm/workingset.c:542) 
kern :warn : [  112.288841] ? folio_batch_add_and_move (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-instrumented.h:28 include/linux/swap.h:399 mm/swap.c:261) 
kern :warn : [  112.294248] ? file_ra_state_init (mm/readahead.c:148) 
kern :warn : [  112.299135] ? folio_add_lru (arch/x86/include/asm/preempt.h:85 mm/swap.c:535) 
kern :warn : [  112.303591] ? policy_node (include/linux/nodemask.h:266 mm/mempolicy.c:1871) 
kern :warn : [  112.307957] page_cache_ra_unbounded (include/linux/fs.h:823 mm/readahead.c:271) 
kern :warn : [  112.313279] force_page_cache_ra (mm/readahead.c:300 mm/readahead.c:331) 
kern :warn : [  112.318255] filemap_get_pages (mm/filemap.c:2583) 
kern :warn : [  112.323056] ? filemap_update_page (mm/filemap.c:2563) 
kern :warn : [  112.328204] filemap_read (mm/filemap.c:2675) 
kern :warn : [  112.332572] ? syscall_exit_to_user_mode (arch/x86/include/asm/jump_label.h:27 include/linux/context_tracking_state.h:106 include/linux/context_tracking.h:41 kernel/entry/common.c:134 kernel/entry/common.c:298) 
kern :warn : [  112.338066] ? __stack_depot_save (lib/stackdepot.c:441) 
kern :warn : [  112.343042] ? filemap_get_pages (mm/filemap.c:2643) 
kern :warn : [  112.348015] ? from_kgid_munged (kernel/user_namespace.c:524) 
kern :warn : [  112.352816] ? __might_fault (mm/memory.c:5648) 
kern :warn : [  112.357271] ? __fsnotify_update_child_dentry_flags (fs/notify/fsnotify.c:180) 
kern :warn : [  112.363892] ? cp_new_stat (fs/stat.c:368) 
kern :warn : [  112.368348] ? cp_old_stat (fs/stat.c:368) 
kern :warn : [  112.372801] blkdev_read_iter (block/fops.c:591) 
kern :warn : [  112.377517] vfs_read (include/linux/fs.h:2185 fs/read_write.c:389 fs/read_write.c:470) 
kern :warn : [  112.381539] ? kernel_read (fs/read_write.c:451) 
kern :warn : [  112.385993] ? __fget_light (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-instrumented.h:28 fs/file.c:1006) 
kern :warn : [  112.390448] ksys_read (fs/read_write.c:613) 
kern :warn : [  112.394470] ? __ia32_sys_pwrite64 (fs/read_write.c:603) 
kern :warn : [  112.399616] ? up_write (arch/x86/include/asm/atomic64_64.h:172 include/linux/atomic/atomic-long.h:95 include/linux/atomic/atomic-instrumented.h:1348 kernel/locking/rwsem.c:1365 kernel/locking/rwsem.c:1615) 
kern :warn : [  112.403654] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
kern :warn : [  112.407947] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
kern  :warn  : [  112.413700] RIP: 0033:0x7fc8158d104e
kern :warn : [ 112.417983] Code: 0f 1f 40 00 48 8b 15 79 9f 00 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb ba 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
All code
========
   0:	0f 1f 40 00          	nopl   0x0(%rax)
   4:	48 8b 15 79 9f 00 00 	mov    0x9f79(%rip),%rdx        # 0x9f84
   b:	f7 d8                	neg    %eax
   d:	64 89 02             	mov    %eax,%fs:(%rdx)
  10:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  17:	eb ba                	jmp    0xffffffffffffffd3
  19:	0f 1f 00             	nopl   (%rax)
  1c:	64 8b 04 25 18 00 00 	mov    %fs:0x18,%eax
  23:	00 
  24:	85 c0                	test   %eax,%eax
  26:	75 14                	jne    0x3c
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 5a                	ja     0x8c
  32:	c3                   	retq   
  33:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  3a:	00 00 
  3c:	48 83 ec 28          	sub    $0x28,%rsp

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 5a                	ja     0x62
   8:	c3                   	retq   
   9:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  10:	00 00 
  12:	48 83 ec 28          	sub    $0x28,%rsp
kern  :warn  : [  112.437433] RSP: 002b:00007ffe7f226168 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
kern  :warn  : [  112.445702] RAX: ffffffffffffffda RBX: 000055d7e2e46a28 RCX: 00007fc8158d104e
kern  :warn  : [  112.453534] RDX: 0000000000000040 RSI: 000055d7e2e46a38 RDI: 0000000000000006
kern  :warn  : [  112.461367] RBP: 000055d7e2e5be80 R08: 000055d7e2e46a10 R09: 00007fc8158b7be0
kern  :warn  : [  112.469201] R10: 0000000000000020 R11: 0000000000000246 R12: 00000000022f0000
kern  :warn  : [  112.477037] R13: 0000000000000040 R14: 000055d7e2e46a10 R15: 000055d7e2e5bed0
kern  :warn  : [  112.484873]  </TASK>
kern  :err   : [  112.493747] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:274
kern  :err   : [  112.503214] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1255, name: systemd-udevd
kern  :err   : [  112.512374] preempt_count: 1, expected: 0
kern  :warn  : [  112.517123] CPU: 7 PID: 1255 Comm: systemd-udevd Tainted: G S      W          6.1.0-rc2-00211-ge087fb7cbc50 #1
kern  :warn  : [  112.527816] Hardware name: Gigabyte Technology Co., Ltd. Z97X-UD5H/Z97X-UD5H, BIOS F9 04/21/2015
kern  :warn  : [  112.537299] Call Trace:
kern  :warn  : [  112.540451]  <TASK>
kern :warn : [  112.543259] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1)) 
kern :warn : [  112.547641] __might_resched.cold (kernel/sched/core.c:9891) 
kern :warn : [  112.552717] mempool_alloc (include/linux/sched/mm.h:274 mm/mempool.c:382) 
kern :warn : [  112.557169] ? prb_read_valid (kernel/printk/printk_ringbuffer.c:1939) 
kern :warn : [  112.561712] ? mempool_resize (mm/mempool.c:375) 
kern :warn : [  112.566426] ? up (include/linux/list.h:292 kernel/locking/semaphore.c:188) 
kern :warn : [  112.569926] ? console_unlock (kernel/printk/printk.c:2879) 
kern :warn : [  112.574652] ? console_emit_next_record+0x6a0/0x6a0 
kern :warn : [  112.581279] bio_alloc_bioset (block/bio.c:548) 
kern :warn : [  112.585994] ? irq_work_queue (kernel/irq_work.c:109) 
kern :warn : [  112.590449] ? bvec_alloc (block/bio.c:496) 
kern :warn : [  112.594817] bio_alloc_clone (block/bio.c:850) 
kern :warn : [  112.599273] raid5_read_one_chunk (drivers/md/raid5.c:5549) raid456
kern :warn : [  112.605210] ? raid5_compute_sector (drivers/md/raid5.c:5503) raid456
kern :warn : [  112.611320] ? update_load_avg (kernel/sched/fair.c:3851 kernel/sched/fair.c:4186) 
kern :warn : [  112.616206] ? update_cfs_group (arch/x86/include/asm/atomic64_64.h:22 include/linux/atomic/atomic-long.h:29 include/linux/atomic/atomic-instrumented.h:1266 kernel/sched/fair.c:3430 kernel/sched/fair.c:3477) 
kern :warn : [  112.621095] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:649) 
kern :warn : [  112.627110] ? load_balance (kernel/sched/fair.c:11274) 
kern :warn : [  112.631824] ? dequeue_entity (kernel/sched/fair.c:4742) 
kern :warn : [  112.636640] raid5_make_request (drivers/md/raid5.c:5606 drivers/md/raid5.c:6118) raid456
kern :warn : [  112.642398] ? make_stripe_request (drivers/md/raid5.c:6083) raid456
kern :warn : [  112.648412] ? sched_show_numa (kernel/sched/wait.c:479) 
kern :warn : [  112.653214] ? finish_wait (include/linux/list.h:134 include/linux/list.h:206 kernel/sched/wait.c:411) 
kern :warn : [  112.657582] md_handle_request (arch/x86/include/asm/preempt.h:80 include/linux/rcupdate.h:94 include/linux/rcupdate.h:736 include/linux/percpu-refcount.h:330 include/linux/percpu-refcount.h:351 drivers/md/md.c:435) 
kern :warn : [  112.662382] ? md_import_device (drivers/md/md.c:410) 
kern :warn : [  112.667270] ? __bio_split_to_limits (block/blk-merge.c:389) 
kern :warn : [  112.672591] ? cpuacct_stats_show (kernel/sched/wait.c:418) 
kern :warn : [  112.677655] __submit_bio (block/blk-core.c:608) 
kern :warn : [  112.682031] __submit_bio_noacct (include/linux/bio.h:611 block/blk-core.c:658) 
kern :warn : [  112.687005] ? do_mpage_readpage (arch/x86/include/asm/bitops.h:207 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 include/linux/buffer_head.h:131 fs/mpage.c:292) 
kern :warn : [  112.692067] ? __submit_bio (block/blk-core.c:632) 
kern :warn : [  112.696608] submit_bio_noacct_nocheck (block/blk-core.c:702) 
kern :warn : [  112.702103] ? should_fail_request (block/blk-core.c:689) 
kern :warn : [  112.707078] ? submit_bio_noacct (include/linux/blk_types.h:239 block/blk-cgroup.h:390 block/blk-core.c:796) 
kern :warn : [  112.712139] mpage_readahead (fs/mpage.c:350) 
kern :warn : [  112.716765] ? do_mpage_readpage (fs/mpage.c:350) 
kern :warn : [  112.721915] ? blkdev_write_begin (block/fops.c:28) 
kern :warn : [  112.726801] ? __filemap_add_folio (mm/filemap.c:910) 
kern :warn : [  112.731951] read_pages (include/linux/pagemap.h:1245 include/linux/pagemap.h:1285 mm/readahead.c:167) 
kern :warn : [  112.736145] ? scan_shadow_nodes (mm/workingset.c:542) 
kern :warn : [  112.740945] ? folio_batch_add_and_move (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-instrumented.h:28 include/linux/swap.h:399 mm/swap.c:261) 
kern :warn : [  112.746353] ? file_ra_state_init (mm/readahead.c:148) 
kern :warn : [  112.751242] ? folio_add_lru (arch/x86/include/asm/preempt.h:85 mm/swap.c:535) 
kern :warn : [  112.755703] ? policy_node (include/linux/nodemask.h:266 mm/mempolicy.c:1871) 
kern :warn : [  112.760074] page_cache_ra_unbounded (include/linux/fs.h:823 mm/readahead.c:271) 
kern :warn : [  112.765396] force_page_cache_ra (mm/readahead.c:300 mm/readahead.c:331) 
kern :warn : [  112.770371] filemap_get_pages (mm/filemap.c:2583) 
kern :warn : [  112.775172] ? filemap_update_page (mm/filemap.c:2563) 
kern :warn : [  112.780318] filemap_read (mm/filemap.c:2675) 
kern :warn : [  112.784700] ? syscall_exit_to_user_mode (arch/x86/include/asm/jump_label.h:27 include/linux/context_tracking_state.h:106 include/linux/context_tracking.h:41 kernel/entry/common.c:134 kernel/entry/common.c:298) 
kern :warn : [  112.790190] ? __stack_depot_save (lib/stackdepot.c:441) 
kern :warn : [  112.795166] ? filemap_get_pages (mm/filemap.c:2643) 
kern :warn : [  112.800141] ? from_kgid_munged (kernel/user_namespace.c:524) 
kern :warn : [  112.804941] ? __might_fault (mm/memory.c:5648) 
kern :warn : [  112.809394] ? __fsnotify_update_child_dentry_flags (fs/notify/fsnotify.c:180) 
kern :warn : [  112.816018] ? cp_new_stat (fs/stat.c:368) 
kern :warn : [  112.820473] ? cp_old_stat (fs/stat.c:368) 
kern :warn : [  112.824927] blkdev_read_iter (block/fops.c:591) 
kern :warn : [  112.829669] vfs_read (include/linux/fs.h:2185 fs/read_write.c:389 fs/read_write.c:470) 
kern :warn : [  112.833697] ? kernel_read (fs/read_write.c:451) 
kern :warn : [  112.838151] ? __fget_light (arch/x86/include/asm/atomic.h:29 include/linux/atomic/atomic-instrumented.h:28 fs/file.c:1006) 
kern :warn : [  112.842606] ksys_read (fs/read_write.c:613) 
kern :warn : [  112.846640] ? __ia32_sys_pwrite64 (fs/read_write.c:603) 
kern :warn : [  112.851784] ? up_write (arch/x86/include/asm/atomic64_64.h:172 include/linux/atomic/atomic-long.h:95 include/linux/atomic/atomic-instrumented.h:1348 kernel/locking/rwsem.c:1365 kernel/locking/rwsem.c:1615) 
kern :warn : [  112.855806] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
kern :warn : [  112.860086] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
kern  :warn  : [  112.865842] RIP: 0033:0x7fc8158d104e
kern :warn : [ 112.870124] Code: 0f 1f 40 00 48 8b 15 79 9f 00 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb ba 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
All code
========
   0:	0f 1f 40 00          	nopl   0x0(%rax)
   4:	48 8b 15 79 9f 00 00 	mov    0x9f79(%rip),%rdx        # 0x9f84
   b:	f7 d8                	neg    %eax
   d:	64 89 02             	mov    %eax,%fs:(%rdx)
  10:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  17:	eb ba                	jmp    0xffffffffffffffd3
  19:	0f 1f 00             	nopl   (%rax)
  1c:	64 8b 04 25 18 00 00 	mov    %fs:0x18,%eax
  23:	00 
  24:	85 c0                	test   %eax,%eax
  26:	75 14                	jne    0x3c
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 5a                	ja     0x8c
  32:	c3                   	retq   
  33:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  3a:	00 00 
  3c:	48 83 ec 28          	sub    $0x28,%rsp

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 5a                	ja     0x62
   8:	c3                   	retq   
   9:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  10:	00 00 
  12:	48 83 ec 28          	sub    $0x28,%rsp
kern  :warn  : [  112.889574] RSP: 002b:00007ffe7f226168 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
kern  :warn  : [  112.897841] RAX: ffffffffffffffda RBX: 000055d7e2e46a28 RCX: 00007fc8158d104e
kern  :warn  : [  112.905692] RDX: 0000000000000040 RSI: 000055d7e2e46a38 RDI: 0000000000000006
kern  :warn  : [  112.913528] RBP: 000055d7e2e5be80 R08: 000055d7e2e46a10 R09: 00007fc8158b7be0
kern  :warn  : [  112.921362] R10: 0000000000000020 R11: 0000000000000246 R12: 00000000022f0000
kern  :warn  : [  112.929197] R13: 0000000000000040 R14: 000055d7e2e46a10 R15: 000055d7e2e5bed0
kern  :warn  : [  112.937031]  </TASK>


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202301300001.af5d02bd-yujie.liu@intel.com


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

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.1.0-rc2-00211-ge087fb7cbc50"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.1.0-rc2 Kernel Configuration
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
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
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
CONFIG_WATCH_QUEUE=y
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
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
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
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
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
CONFIG_CHECKPOINT_RESTORE=y
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
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
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
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

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
CONFIG_ARCH_NR_GPIO=1024
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
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
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
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=m
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
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
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
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
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_RETPOLINE is not set
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
# CONFIG_SUSPEND_SKIP_SYNC is not set
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
# CONFIG_DPM_WATCHDOG is not set
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
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
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
# CONFIG_X86_POWERNOW_K8 is not set
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
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
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
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
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
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
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
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_IMA_KEXEC=y
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
# CONFIG_TRIM_UNUSED_KSYMS is not set
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

CONFIG_BLOCK_COMPAT=y
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

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
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
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
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
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
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
CONFIG_NFT_OBJREF=m
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
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
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
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
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
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
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
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
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
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
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
CONFIG_PCI_MSI_IRQ_DOMAIN=y
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
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
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
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
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
# CONFIG_PARPORT_AX88796 is not set
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
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
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
# CONFIG_HABANA_AI is not set
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
# CONFIG_DM_ZONED is not set
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
CONFIG_DUMMY=m
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
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_APANEL is not set
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_UINPUT=y
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_IQS7222 is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
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
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
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
# CONFIG_TTY_PRINTK is not set
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
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
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
CONFIG_I2C_SMBUS=m
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
CONFIG_I2C_I801=m
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
CONFIG_GPIO_SYSFS=y
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
# CONFIG_PDA_POWER is not set
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
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
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
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
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
# CONFIG_MFD_INTEL_M10_BMC is not set
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

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
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

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

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
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
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

# CONFIG_SOUND is not set

#
# HID support
#
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
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

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
# end of HID support

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
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
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
# CONFIG_USB_FOTG210_HCD is not set
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
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
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
CONFIG_EDAC_I5000=m
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
CONFIG_RTC_DRV_V3020=m

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
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
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
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
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
# CONFIG_HYPERV is not set
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
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
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
CONFIG_IRQ_REMAP=y
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
# CONFIG_IDLE_INJECT is not set
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
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
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
CONFIG_MINIX_FS=m
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
CONFIG_NFSD_V2_ACL=y
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
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
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
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
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
# CONFIG_KEY_NOTIFICATIONS is not set
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
CONFIG_IMA=y
# CONFIG_IMA_KEXEC is not set
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
CONFIG_IMA_WRITE_POLICY=y
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_IMA_DISABLE_HTABLE is not set
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
CONFIG_CRYPTO_GF128MUL=y
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
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_SM3_GENERIC=m
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
# CONFIG_FORCE_NR_CPUS is not set
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
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
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
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
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
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
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
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
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
# CONFIG_ASYNC_RAID6_TEST is not set
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
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
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
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='mdadm-selftests'
	export testcase='mdadm-selftests'
	export category='functional'
	export need_memory='1G'
	export force_reboot=1
	export job_origin='mdadm-selftests.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-hsw-d05'
	export tbox_group='lkp-hsw-d05'
	export submit_id='63cf8b53e2a18dcf1a71004c'
	export job_file='/lkp/jobs/scheduled/lkp-hsw-d05/mdadm-selftests-1HDD-19-debian-11.1-x86_64-20220510.cgz-e087fb7cbc509d8dc2da3baf20651308a9d4066b-20230124-53018-2jocwh-3.yaml'
	export id='2a6b49a141efbbc534d3e60f764d5eee117cb3c0'
	export queuer_version='/zday/lkp'
	export model='Haswell'
	export nr_node=1
	export nr_cpu=8
	export memory='16G'
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/ata-ST1000DM003-1ER162_S4Y1KZEX-part*'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL41710019800RGN-part1'
	export brand='Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz'
	export need_kconfig='BLK_DEV_SD
SCSI
{"BLOCK"=>"y"}
SATA_AHCI
SATA_AHCI_PLATFORM
ATA
{"PCI"=>"y"}
{"MD"=>"y"}
BLK_DEV_MD
MD_LINEAR
MD_RAID0
MD_RAID1
MD_RAID10
MD_RAID456
MD_MULTIPATH
BLK_DEV_LOOP'
	export commit='e087fb7cbc509d8dc2da3baf20651308a9d4066b'
	export netconsole_port=6687
	export ucode='0x28'
	export need_kconfig_hw='{"PTP_1588_CLOCK"=>"y"}
{"E1000E"=>"y"}
SATA_AHCI
DRM_I915'
	export bisect_dmesg=true
	export kconfig='x86_64-rhel-8.3-func'
	export enqueue_time='2023-01-24 15:40:03 +0800'
	export _id='63cf8b53e2a18dcf1a71004c'
	export _rt='/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='e958982e1a5676a7a55232c1a14cfe1c0afb8208'
	export base_commit='2241ab53cbb5cdb08a6b2d4688feb13971058f65'
	export branch='linux-review/Xiao-Ni/md-Factor-out-is_md_suspended-helper/20230121-094103'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export result_root='/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/3'
	export scheduler_version='/lkp/lkp/.src-20230120-005037'
	export arch='x86_64'
	export max_uptime=1200
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/vmlinuz-6.1.0-rc2-00211-ge087fb7cbc50
branch=linux-review/Xiao-Ni/md-Factor-out-is_md_suspended-helper/20230121-094103
job=/lkp/jobs/scheduled/lkp-hsw-d05/mdadm-selftests-1HDD-19-debian-11.1-x86_64-20220510.cgz-e087fb7cbc509d8dc2da3baf20651308a9d4066b-20230124-53018-2jocwh-3.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-func
commit=e087fb7cbc509d8dc2da3baf20651308a9d4066b
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mdadm-selftests_20220515.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/mdadm-selftests-x86_64-5f41845-1_20220826.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220804.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='4.20.0'
	export repeat_to=6
	export stop_repeat_if_found='mdadm-selftests.19raid6check.fail'
	export kbuild_queue_analysis=1
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/vmlinuz-6.1.0-rc2-00211-ge087fb7cbc50'
	export dequeue_time='2023-01-24 15:41:51 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-hsw-d05/mdadm-selftests-1HDD-19-debian-11.1-x86_64-20220510.cgz-e087fb7cbc509d8dc2da3baf20651308a9d4066b-20230124-53018-2jocwh-3.cgz'

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

	run_setup nr_hdd=1 $LKP_SRC/setup/disk

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test_prefix='19' $LKP_SRC/tests/wrapper mdadm-selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test_prefix='19' $LKP_SRC/stats/wrapper mdadm-selftests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time mdadm-selftests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--fg2Wa43YJNw6PR+g
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj6Xbq7/5dADWZSqugAxvb4nJgTnLkWq7GiE5NSjeIiOUi
9aLumK5uQor8WvJOGr0D6/eD3zeEMtlqsD0BHNlT4+z7hI+/soaSYfbSIe1M/LV0mq2cQEC1/iy6
n7qSDwJtCbtxP6w8gRR4X+Sm73m5M6fL29+fQ0qXJZHG5J5tW/RcpB/QcXDDpwvmvQ3TYszNedoo
Qe9rm5igi4Kk1l9+bP01Herle1FV1S9Z88e2dIzMT3u4oLMmyI89qGEq2iWlIasTPuqt1b8QAf/W
qSsIpgGIzTujzCQ3YuLc5tykQ37V64Po1FsiTa32G+z+XVCjABMzVd+Xp/aFhEk0vGEbeTzFyX/L
GfvIep3iZbsQAfIfxfJFysjt49YsGLNjMKbIWZPOI33jOMTzZ+l1xUAiO7dnb1WiU0qLvGfZ9sOl
9AcM2kCHyYbcSQ3ak5FywlzTBxLtAV6f3w5xto0yGZA+pwfDaatUobAd+wClyOmegarFOOkhQ1R+
MU7VOSI/2w3DVZmux3vc10jLmif6dzoJ2fjz/FmM9L/jEaG9dfAwqHHRaSbKhyeFvzy+069cJXV8
IWZsHnHrPK+WOGvmk71oYnqPMGq8ynXbD7m5pMFGRAjk9M9/FxqrsjTtRZSiVmZQ7brRE/bR4+gw
01omcLBbSxlB9zzg15X2ktu2jAj8fDDh3fiaDZPMYhHC1kB91pTf5NnylnrwVafoPz6Ei1EwMsMY
OPdWg0Ec47mV/IZZEFCkSkkfDDl5KSvOal8fij/oEHeN/uTwLuGa+q1svoHg3pTNhIrGhkms++mz
3qB8cGLHrb4JF86jqmPhucmZWFBIQJyKQKZ6x3sVwuQMCQ1C7prqPnNcMHQ2YW/RspQN+r32Qwgu
AjhM/Tc/2NVYrrUIAV17JQDTeteQQ3jryBlUqb1yln33koDW1eaEDxBtNHB3zU3DRGnuPo6OlPSU
NqpjiPTvxqIBhCLnkKNR1iubIdh/QiGxvJ+b3gKcIoIpssytUHQr3BaGc3X6ubvTVFrx2a/WQox3
cDQ1c3yjDpAHWVmC7JhtHZ2CeW6d6yYqi0PkGW4QyX9qIBEuvRnHimliSoa0tHsj2ulKdI7o4ywF
R5OLUw3K07ZModcQzkuHopnF+vUSxymx6ZZN/u32UJo6uwzkW3IqU6dwCGi9Bhk/zAdhIvykZ+1B
5rRw8B2qrIozJIJ9hKHvn1Msjf//qgSGc8esOBMe1gwuprmAkoRRcnyIdgr1J1I526srQjan3AAE
KaXu+oa7fJ7P/NSZPbIs/BTYE66lDOoESkHXCxqJ+B9OHGxurLm8Lo7giX/+PZZa79d0AwQbjFi5
kJeqpf3ZMLJZJg676QsxzxHVx3zhANN004cAg6NSA9RQy+PWnM9UipJu2wIH0GrxLEnMJy8pJD/+
GZ9kdLPotQsONXyJyussNDDsHGMlAxrTTA2J73VQafDseP9usnYQEJGNE9YXJt7ABNepOSWu737B
n4iWtIdIu7//WGTkxDjiIkAMhTpoUPVDHQZxDUg07ik7fmOx/7T0nafVJm0At1HrfPXLoqbfv6Dw
qZ4XBHjwfyvz2GRqX5YSnsgaeYjxhkkdBWkMorPbTX2CQHRoCjXKCuTjku8og5ZV2wAPuDbYg/4A
oq/H67U6n9G6ug70ofyljHgEcb+WOb2a+y6ViTJ2EvHdtRw9pbvA9fIM96Su4kgraD7UWhNYqiMj
rmfSeyVVvLyxsfSRUmC+UgDXPr7lBWVfeLMw+BC2QxUBQvNeZRm1wXofKCSc2dVmJOkZm76UIo6T
PNWLxzDdJbKDl9tcNOSyiddP6aeJcLXyjvvorN7ZwLV715zc/ljTBsyjfRo5os7rngVZ49Fs0yUk
3HmWQ3e26Q9/adU9kF69X+apwDBnJ8sa1+t8gorHqqkwuhkESaNOSTuS9VHJ8jmFvkOEaevLqHFF
oY8/zNqMCjNGdyjooZSECki7qj+ViM8i4F6LhIousrzcTtj10khUSWVdiCLSz5vEUwIjfIedpQSk
SfQl1HlmLehFyjLpfVLTXiCxAJFKjNtu2eXiAyfdmkPX1b2oECLJKHirwiMuKQ+FODv8FpZEWKCv
XCyK0aoXB6hvL2qJNdb0E8NonCvwxAA3xIjB9oUg5unAWlzC++sB9fvARRqZRciC9pBVnYyYbtre
pBFAjGfx+Eo95hx3mffuuqJZnVl2qwYRFC24zHyrUKgX6ebYlz/2WD4PlEbWoLDO5b+FJn07Bs1V
2A5FJoX0eSyRBTYelU7WSUNm3edVVb8qC4IemSTFsPr/BgBTD3ShBuj6Arh/KuAozJz7poT5Avjr
N7FH0zS4vBFs01YB6pQ8sevnpj1N2u6akfK9l18C0a6H26c89xC22RmDNFZU+fOHBsD/XO6YyYyH
XLKfDYpoUba3tpNdeigaIPkvyViUoDOeBw0aB4ozgcKZwymzuaIBNhGa5aL1pKj741iXpTcTxe7P
OmIN9IqwHB8ybZDWm5hKTlhDY65gfJrBTtLtIEiM4mRUMBJvLSP6/HEvfg3UqTaFppIYp0uxwiaw
3zyy1K2E+en1gAzgm45ngMmNaKTpJm17gKJbKh/09THMN18Egs8iFQ81naMrCs/saAwz5wK0CzfU
S5DYimYS+oFXn0Yh8AASHyl67U5Ou6l/HIAwgFs9w7w9kFj0yb8q2AnZsrygSruqdShwc7YvPaxW
jsMZ//BYEH6VTAB+mitzDJMASPlW7pB19eiUdHOeoCxlbdsjLVgId0xO5QgdUHTTXjsnpFShL6yG
oXmELZsOWI2mxQp1FM7t9MwGQrvCiFNt8zWkYmE1yFWR1QTITofxXZtkcMIHXLZ/kWfF1cwezdnt
B3Fvhm8ZkWqkQ50SYXfem0fTrrkVGVA9dKzOfNN17G61DFOVov2VaDQEld2LU4nbJiHh1B7KlIZ2
ATs5IpXPN92jX4t7n76M8ePryNQ6ckcQxLLSUt+MkgfI5vcaE9yUgY68m3hR0lVsvLdBhqS4+qNr
kJ3W00WMJI3lqniKAoGcGtDPzQ0aQF8tbg15y2h4ZKOQYDcztFPQfBUmBQgCGenOhxvYC+ZSdbAH
Xf1K4EgG2hmVUOSzAicdmLP4zrN6NfgkcpAcZQjzj+/fn5T+hWsKhh9S2U0/6mP4BS1TCvJuaXSc
mReiUtXVw/No5GKiK5l7LqfeCzY8Iqpgzp3JtObzJ/tmZoBYUEeYhBfzfSXZU+9N/67hROEqwO3P
hxG2LJt543Bh153WC3Tcw1fLP7yMzRHNfeC6lMfuVa+XlFYO891KbaxMsf8s9k0UsUYkdbggL1AB
BZxHafeaRGKpmEjzqvVEhqssJvNmGsr/Bh+f2Rs2Klam9vWdt2X4+jzSXuINsPDRSg5wJqwfrJI9
gJZFHnNHCACgq9o4ruOdpCFenO8V+PZNRC883FjU65i4TNdDif+/qU0H9MsrihUqwZ+CeuzSEmuM
uaoWjQqNdcy2VN6w88fH+3WRPtQYwfgdZVgnt/rLuY/lQcIg8+07v404r/jG7RDXqVXFGcr7Ui7M
wm4sr5Azcg8ugtwkE6Ts6kOvNkPBXQMaskNpADRnQ9lqN3DWhDGODeaYjlqIj0GUMmFG2dMYpvd1
xo0C4v8RFxWJxqZZOI2WI1ITeysPB9kblW2zF3bzBxxt+bpfqW4zOOMHi2j1zw8jjdSsoK86yhLe
+Pwd1UeE50fO1HTuJsKFWeMH4JhQhE3jeHgK5QVIAqRGCSZaRBKpanxbFhyDc5JyHaYrOjoYC7VY
srXEeb1DgCR1DtfGnV4jmWfZLoNmCeW5thME0lLkOL/5Q61DKCEBi8GrVW4LXG023EMxhTJU7boL
1ntMdXU/LrrtYgZ3i2GWD0mfLS2DYlCHrqIL2Asg63f0f0hz3/cn/Zgo8teJ0B21XLIq3SOdVL+D
r8Y2tWP+p8tfUJ3hQnVWar4236rlJtYMrkPFj5djKs2QREALWu63EIHaNqe0941p7UKzaf4Qbdgw
pkeHDTcuw8YEKsoXrTlc0SZbtyXRgA+JCPVf9NhsnIxAtTRMSMqDkQvtS+IdbT5zkFpQsqTObd4O
diRPHGjwgLnlF791pJTSInbA5jqjgNFPjLllnZkSbL60x+8Y16kANMplHAGoSnuWJP5qt76HNIjJ
ml1pVqNZ0/MQOLX5+nS2SIevfPsC7drzw/XzWn4wd7y05xXnk2cslMlO56KO76hUfNLUnWNf0mkO
MKQxCa5RPU99MwytfBl/vzJqVH1y9DbMIDo6fdGDaE6kJYREpNTHCYLJJWMQU//nHAlmYWvJmx4s
RNr2c4T4g/lifme152SddUIA05OlAbzboWFELa3M44oMxj8o6Xmrz4z1iiNoo5TopBPFgQ/f2Gzo
Guclhj74drs9rSy8BNd9+IgOJo2L/LacdrNVLCsKb2JbyjoVIKANwBbsf9I7MlA6mdsr0z9Mq6JJ
gPbWiDfrgSjZO//y1T6iu1iRiMw/Lmrt6n/eSRsCldmMtsso4GFV8uZ2Lqpf5+Rth9pYAdJopR1g
1bB7ObJDvgzhqmN1gCatNqjEqvLKYgaoa/0TCqS5suoZ9iFnE/NbgiDhQRVNUy/SlXfJhnTkEXQ4
4PoFgk25uGIVT+tIREomEJ1zRD9SDK1/4ofOq4T6x6IWhcAOwIi34BPDB4IWlgaTbMWymn8yH7aH
/X5OROz+PQ8z56VL4CknCtIOs4Gf0Gs8fgpsxo87rtCGV/ER5nipHNBoWNU0VxOQ3N80fwz+ewwm
4MfM1kG/l3BOE/YsgfxwTtGqIywVASq9uKf4jMtLFfjXp2Xgnh/s5LHABnHeGiLmfPnTVxBl5/z3
kavpU6X25Ava14oMRH8ivEO1mHq9eyJXfj6TwkXEwQkCTD1DVx1s6z94NQGxx9/baQtFHPuUmF+p
4fOaRSCvUZsEFl4oCyOmF49ni9Oih35AuBg4ro26t9P0xGEF6FPE4HVJ7Zv4Q56xRb5ZT/RmZw1E
Z89J9/DoI9GfmOBqNLhP6i2/IsFnOquHnl1VBQSGl98ZV/oaSH1rwYvpxtGAiI4lCYlaPle1Mau4
34kSdkVgtjZa/VXyeAXr8Fn1T6xMSlrTcki3Roh2pbtCcwCsNrAjuA04jzEVc7T3xeqtU593hOAl
/kYCOUY27zqYSL1QMCBjVJXn1j6St9yL0BJ0A76UQcqqyLAMUUyclGqzvzNxDv2Ulr0owGxGjSPg
REAQk+cU6IAecE+a1yfdN5qtjR1jIy/x291yNDRiftORyQb+dg0aoZ0fOp4PPCsCwq1CVB993t3R
HLaKu+U+2nmShZ+ZGhaYj5rH4Ir0XJR37cVP9Rl5zpdTZDyKFD/vKyTqjgwyOs7fi7BlOXkL9xVM
n9eEpAEaTM6Bonc0/W3fNJRak86Wiqn3KpjhuSQNVyHT1kT+dm5HVjf7ElY4GoVpqBoIxtXGOZr4
MMu3jvtNeUfcvucTboS6KEcuB97qhJnV7obskU1RJ0GnHrb8RnZaWdJr42UOwVkYTho4LN6Cup8a
TmD1sWrtf8s6Bb7Lrxx7pD3iakfHflpu+wez+e5451xy16X2GMHV1eF4c4HUGvl5ywCtjAL67kZP
dJjL/DASRDpnF+L4pyj3rCOn96+YJmTIWvEgpqnqHhYoMGUWID5dN7eCBG2MlCz99QrCtmcl5sax
lKuVGX9O6aBDbZTf3+QD/avQESBvv7U2fK7dVqpvIIMTkKt0kq1Ff7W2yqM9EHM+S9WfHN2P+4cV
aLuwUJ2DEuGIdqqc6nfme+VbQ/iyQYUpo24FA/dMRQAbdSz1oiHnDYzHmpFvaxYvhtw3A8DQEwmT
hP2RNObBA+2eC10fFOLVfjzvTZnT4qeBYk/xriaX+YjebCd56FzfJx8ivCcd8kXopd5gLI462ZLq
uWDFaFNiP9ko/9nXmz88aP0zJNNago9VW1NYllCWoOrjVjqKG9Jj+IIgC0mMarHI4eVeMnvb8OyE
yl9NN0PbbJLi7bDttsDW0QOweCS5FZX1bPmU3g8a3umJVY/qMUw4MBeerkeuABGJBUiA8+RITWqk
5SvgUvCgNJ+4SaIOIcBQGT06InDPebZwpi0CPY3ITxDElndNT7+muRxtEP2Mw3+C/9nPXPpAMv6n
VqvVu6+qOz9gO3O4K2zGlGH67G4hP4j0acqAx/c5aSAHvWQx88ti0+QjfXfymoWdNaycHJ+ya12g
YrE1Sy+FDDRpQn2j6Rnh8RdFDIdnZVIWUUp/7xYlLPDJd5udPD87zWgaigAjVoi94gZLCn6yfdal
pJgSHtoz2n/HiXma4hpw0GCxKjouE+vTtLX9xElcSYue5mYAyoTMopuryBCW8CqL1jIzg1AWkPKR
4T9iYLX5Y4VLNt6K1dZQVmrNhXKo2nNbaAvDt/EKV2D6LSIB0PYIR0o+B1/qCl7oDfHj/4TF4NDb
aizCTri+GIl90KAEqdd9EbPSfbevV/GDqas/VCEhHEH9n7jQCeQnoTynB4FA44cU3dBSpjIDdV58
HI0O4yacnb1GwBxRxqRXcChcAm4L/M5H9y18aDfaddxtWRP6LrECFAMmeU20mT8X89PX4/kB3ZCj
baTnz1h3BhMSCtnetRxbNpky8SiSW6TM1hB7+GWEC8RQ2IAeeTG1Ye/fbTu1nXD6tOH7Xyz2VZzr
dmWwW59j2/3ZMEqhylWMNOq9K/QcAaXyQpdzEIfr+N8HCZcN1ahgH2vc5xD7gJ4ttX3wqdmR1qbh
8UO4jfEb+FC4R7WLUGeJ8zZv7hIoJ1RKBSOo63+fYRqOkYsy8XxmR26o0c9KPwzhSKRWEDIjBl+x
DdvBSZsgpqxaRqBP8uKc7mDd+Gc9sFELXBAow4PTHQAiuqg94HGzDrzBSVMxgjhSJjstjA3Crsqc
PJRtoa0Z3F+FlB91XUsz4qgAhXZ1JO+eCZPVIQNVXpaP9PYOyXYcVlG0NkfJ0NaSaWg2uKvc2j1J
3HUd4mj0C9uhrgG5uMgy7vGGhpMcjZvlkjtn2yrhVngZNKKUgE2jR9TXBlU5p51q6I5rBHORSdDW
2jrngTrS+D9YoZLz7/6vNA1zz+joPYA2f51uyd8TdkExVYYtXeE5wHOrYSbBl40mLUUaYBt66yqO
sj6T5Wk8fS0sUd85Qbd4X+NuaAZ5pPZgT6HY2q96xi36+GwVgSvA1xLQDTXyn27xtpaTH2BAyQqu
mLL2BtiLQnomOJ5KNk1p08wpE+aaMkSAmOI1NcH8D0BmlGYI2BbYVFe8JmWfd5QQe93LxnTSwIEP
vQwt332fdOAuDXkFufiBeFJhPE3eYgZqZGs3zpaAiyaA2ZGCkrcMRtgEqet5dklruGCuC28lhf2+
e9Px7+iKINpfyRvN8+URhcuUwVCJcaC/2MFJsQw7whxqNaedc1zsjADR9YKjR3/r8D+44CLx7PTm
EGNiMWUPvXlB8ntWj2QIj6SHP/1W1cRk6j1RLiH0sbWzKsG+GdAmHreWkBxNhbng1rC7yJ1OUgsK
FYbEGnws9h7GlPj4JZz/8DhPrrpXAVSj7zosJe7XK3HtrSgpXYOu3QKdxkBbSO8Sl2XYFhtrO52b
3VcZeWirtk1EbjiKVVK408NeEsg+z9it1TwyEPzk2vWJ+arDwEkMVv1KPeFHsrcLSG1XmjSwQ43g
yGBZcG/kB+Vo/eP/4e7YpwKyVz7BMtVWs4xus8lwHOTSHvfW96S2K+WrLa9yJ0t6QzIP+CqiC01F
EtC8E9P8k8oLnfviqWAbT1aC3RR9xjhCCHYJUTwUXP/fqWRaEZ7qX+0AnqfJZWRRTl4VjE+oY61q
w7nQjOIqBLeyB1IbHI72FDEbSSDgqFkqx6gafoSqBeHhuwzbSl+hKTggo055fA1VVL3Zh60Dd7VL
6r3OIdlGKyLx06Hn2N4uuY1sVQHujkx1W0HSVPnGb8e8vZxxEH0U9ZpPK6V2lAYuw0sZc9vIXaWk
CGO/Qf5q9oMylJXROyQXzpZenvtaQRImi3jNDZfslxJvrmXuw14u/qLy0gxat7gVxaYtrZHxLfeE
jQHkgiQzuvhIvgAX1VW3SpCJdX8Y+gtgi7QGgGy0HSNZaZVYrprxIFARAZrNH8HM3/+eX/uMz778
hveZMqVcuFR/ZChBK0grZhSQ19+rieWvUI078W+GIIZngA9jn2me4BALiXQS8h8qBxCubRRGaJlP
cylGs8zFIiu4AdcMZlbwTt7xUaC125Ns4ns2KrT2fs49McmItxS2HBVmYYI444bG4aZRpHDXmgUS
P398kjPhwGJRD5PRKD1b24o7U/v3xMkKD5IGnLkCbOc4ksEg2TIy9Ol1Htylc9QySQ2370QAwTsf
WPPOAKIMzjtOHv5aKUKP4LBeIwrgWeVG77fcGPJElfbMXAmREw4bw7DMsIrqe89+LNKh1rJEzu3a
gADa1sA8HmNd6JWVv+82gPPLTp1HkbRCxN3m7qMz5lKwEK3F3Jd5faXyTFF5P3XLk103FrQuUmrR
mho0rB4jSeL1HFEYwIi5wTswqVlWxjYlOCnumrNurfkHCvKS3IXYVO1S33rNs2+ii2ODEeCrnF6B
dOpxwi0UDRtErIi49vZJdBHtojbi/LcTjJPNAKZRK1ebvTzfq+TwADJjkrGRrIHCMMBcYlZl0E2X
RWClB/mhAePYnpnvbIzti9OvAQ3lUbbPT5FWBzr7lnZriZWDOGmvLLw++zghd+4l1k1nQv9L0/rc
pYA/S4grNIShsjhDMt9px44S45sgXG1a9Jy3fyqcb5fFGfN/1CbGhWetJQ0pNQ0D+DvIMqFZzlV4
hJlEWHZKC0a7K42qhk6WWDmASyedWao9JnUPaBiXgWG0oTh+4kph/WlixR5vGCXnRdcnXWK4arRL
e0FfiiS89aDPxr4KF5bEzG81IMH7NrLQ6tw1/+fAPi159aXsvJw/y/OgBvAWapQeUUfKRDq9qGPd
qvy2PlR27FRN4hpC74ibzF3kUusDPJuv0cUgwQxli2rtciu+j9t28aS9Xru3/1RC04ZBjrohLpr8
vSEJHK+h5xdyfoxQq6gSrhYsNtnig6t5tUbiKeYn1rJ+P3Bk1lEQC6kLrsoxMksufdH+lBwrHEWl
tWapAykUAz3SUCKVNpWqUxqpiZ6SVvecvQO40VwkraT253ECNVpUZdegTnUzvOhoyCo5HpbtrCA+
ISe819O+lzk+VnHOsmQJ5XGc4xsqjf4piqLFKBCdbgLG2pUpVwT61QGwXBEgyU2jTHefK6Oz5T1F
rO0wY+VpQmJjfOn2YVIonOmJ5GV/YoGQKRBY9JymENqQjm8lT2DOBpMe/MnuwY6kfDFUyzSF3fn/
3Pd8ink5WCh0hcQ2ZSiC4AUd2ysiYwYP1NGiIj8YdMAtw0x13zgW1Pjn9/xDDk9d3M3XE8Q6gRyl
3Fr5+uFvdvl6CC+h8P9EuezQlaF8rKeTUOgmKTzK+CrXNJ8aIUzrvnFoPiLS1M571fecekgt8x7N
7tDrF5SYtf06VP620A/t4NwxYt1MQj5VUuwQyNtZ3CVNtK5rTVdXckvNWl5Hxn0b8fvP3B/OESAI
9B+ikQDFrvV8jZVi4qt1D+eFJ3D9+LEM397CWJ7J4w+tkbTmJdFt3xf6iG4m1jcwXy5IWMyTjYpL
rvPt37I0Ceal8utcLGTy7IHUtD5+6AEzCvoFC0sy92ppk/6gR2Jn/MtK2BQ+wvWFPiFRedVbS/aq
bhLT/ChleZwXihjsNxwFw86tawMAwUvw8WFyf+zz/aQ7B9XQZY42/nchDKia7fhqQstH1sasuju7
l+18BImKavRO+s73lHYxZuTn6yIC036MTaQqh95jFcZt8+J0MXZlCc1tMj9LevoOoDw9oQlOnVuK
aYlmF8XsnKqRo5P/Q3DD50C/gZKbZBkrnnciEEf9PkbHlkMuy+0dY4/33yutE5LwXoHxXzBU69ZI
Au5J/SEVht0R0CXJdxCIlqTpfg8lnSf97HJj8EmzCIrKkHH/G5Q8Gj05+v7mkkddmvqNVbzIpWfm
QXDumvK3gXQB/s7kW1USTNmURO+iuPvopTVUIA32daU6qiF21nEKFRFnyvDvMUMOYsjCtmSqsgq1
zJG1z9EtozU5uGDmk2zD+6aVlXyhdPYf975pZVkTDb3+CSdtNLbt6tibYgWpvf530vyjPGGAdQ+N
2UatUlOhwlZVn2LQp/TFAdowPG6olLqQzhq5z68vqCZn0VyCyqQ4nLxHDVMfCls9Yo16VRmjKHW5
pmULycmZQk4X774fE78zpR3nO2ZUDlfSx18eNU9Bzp/TrCvqYL96D/dvT28SQkTMI5fKCI7VB3BP
jJWQE6SWwWXgpjefltNkii2K3nk+TmjM1SFWisxj6wOr6S1eZmNxjUJXlvBxQgfwKPu6N0PLfN+5
SzGJ7eK3kjWFVXG8unJX35mG9SQ1YvHXch8WDqNK8E2B9Zg//R0KL62+uI+bQA8gPWenhesF9DFD
Gm0d1xCQmfmoY0YlJ6BFna7eoZjZbpR3ZkvaLe7q49CY97LrTuAxBHlP9DbkXS/RPVt6h0bXtA4u
7kCJKp9sAO1dJnatk815Gr8RxRHYjWl+j5HKRzlkemVNqiH6ayZY515pG0GPH5G2pJWUyEodvq/g
VaJNnh/EGOgWAL32b7b2AyreVTUGPHp65q+9AzWalT5SJgxo2JWKUsAKzvqIBhe8gWBHVJGAtADm
NtSSVqGOW2tCQo7I8Z6pztoj/s7VL8x6Wx3bWOU+VXez61H268MmRmK6CkN7QiJaBkL0xbL+yXpX
Ilpz4vu+Xkz4NYeYDglDnrpQ0TKt1dYCJuRcYMXFOvF1+sccIkPIn7sMeN7ErXsv9qcJEdje7NjE
0xZJEys5fA0HVMGozApJwJGJOsgvNDam3IdRtUyy9R4GD3TnBtO3m68hm2qHdOElBpYfzQk6Guu9
rc1ydiGmgB0rjedkjQTB6BgEQ4YgMsfxK5ed7IHxgXB592wPT7qWTNpbBVUhXR2OOmb4yeSCrOch
FBmH70HwB/mkzVBUp9g0wN2tyPwB5ER2knprGLk4b7HcRbfO8pUfvfkeMLPzYp+A0fjjJFwzh9v0
7bXw61Qp72GlP/jn21hA/dR8udDNY/XHQoO0Mj//DNlY5Q+xKoaQ3p3amTV0eL5bS3i8nf9WH/1H
+DV71D50jlUkPq27pEnz9avlMXtRRUNXiV7hDzZ/GHX+jmL/D+J9mgG+IYafUoztFDv7/xL0h9s9
iqty9dWXXhlW5aoJ/Awpz+lj9LcfLdm8IfFxM4fr9HFmcYgOFvyVINFbxsvoIT2BoSlqgwWWc5l8
c2V4nGfbqU16V3jk6Ii2bQmlnSEQa3x9dbyKSSNhMCPNuWkgwKlyEom36bK0vsPuqpdFXijVBhQU
4K7MM2FUdPrtnlrrGNVeehT+J4qgm7owoO2sYqnznaXGOHvRAlP5FDRUAK5LzQRRjn/vDg9VS8mt
jWhBZPxuF0uDGLCgJDAwdLOe7VHMwWsP0D+FbkXmDTVB2qMB6MedEqIo9eDXH+IYpoT7xDoJOerU
WNK1vR9LCnud5CwE6bRXbFNpFNCYrB/9yEcbJj3PgVDsSugH79PHuDGl9HzZbNet8kB40tRpzzwd
7ZnH4mBMHWp6ACxowLMQ8LG1Anxbt0rNWLkvGm+emPJn7KBEtG44BktWEM09CTHHEwDUorWlMD8p
pmeGiO+JWTg7Ov/ou4pK0U5Jb8hyTtH269i8D6B9ei4UE0FY53iqdIXrNyOdb+w5MVIQLa2gFwco
J3d3yZU4XOR/mWAKL/Xch9ziJ6GxrM5rehl5MeCN/wv5DEnvf4z/VsxTbgRzFU7oCOphOBDRWw0f
DGHmN5I+VrQXnJlmEYxdqT6mONJ++zkRcYWibCYTRfEdN4DlXKRc14k6t/1/F3hrlc20mKHr2xWz
hGXdIoK/lvsdbWjmulj7ahkoRw3C+7MHEp5rDKIaBNLDIChT8f5WYRqouodNfEn6fqXiLR8Jsu8/
9BL/qVq5N8kw9kpXRj0fhjNpidNtHpWy/t7yPhl8Q03HcDkUQGN9kcp/qonKfhs1ksBd6JXSMkl3
45CkBOhTqe8P4PIIIukB49bkRBwWwrvPP4A0dXGSE1KVTqPQyWaCxgHTdUFlZN2MFieKmRvAALAV
u272u/qjX/mgJIeIm1nhk7oulbzeJ6VgIZu8sK0QTVebBKK11XXOqpyKcpv7erPiZ3+k7D3AH+AC
EfD3+YmofRN11bgs90TtileVGJBo1F6KoycvWV2MAsi+dS10gLLVLoCKcks98INidm9ac6eS+UXG
zf+aqvUSZ5JkSDAOZIV8DfM7hwPXpnU79fAnW3+9ft/hRmtSPVK7OdMQhtwW4fyHp4zNiOAM1SRl
pAjGM/rs6Et0UC2blyex4IUqe6MA9Fzi0Igg1LcYjjuApe/3JEf9otRnOSMH/FSbwscmzPsO9F5Y
T1vOQcIV/Cw3JyXOOSw/GvlC7oY+/yEQHzu7UuQhESeRm/OcR7y4tykT92zaaRmkfZrMRRTb8QQ9
0AqJNybWy0kRn5wWLsCiLe3pxUqSsq796Wnx+ZFkWR8dC6n/nJkSAiZqMUunV2efFff0ndJIyPoe
Usrq4movyHPaKQoYc99sWtxN4SChy0lW1gIean6x9SC8tLGYW3AGyCP0EDTa+1UgCvJXFAd/9ekZ
ZTuCqo/PyBhueZCfddhOiJ/9jcUzREmAfl2MsoQnQVqnN+sSYKY2hm5aWZ4vhPcDqN0zygtPXFex
N+l/sYDGno9r/MqCXGgPotWxFS03DQiIO0moyJ/2NbcyPhSfZFF5mO92vAZK8oYjjTkmwhrzgSgR
RtOlgAHqlZU5sKxGiFzb3cMzPpl4hsuFsXWEQl0pIVb/Eum2fLambraL2DRz9Gi7Hdk5dWbNwiyh
0I8rcVI4xUDjgUQ/FFBHqDgB1GZxOarY+2qC4h5M4VhbC68Hd8FTthow4xEf0hyvtKpp/z9dj8H/
6DWDrGODCsxaNl9H8NO7lx8rlxJbcPKtbnDTE99kf9q1x2EL+FdrGwZK68SnEjzCZfj//7d2WFcG
mTRgDE5nVUT+MNUoR1qZtqlW2gxmz1E2SBAWytCsBRLMkc473CC4eKs/l6N0Fdq7hA3pbW579JOL
mkMoiNmjjK8Kk2SoPGS2parTB+vxcHYY9fXBfmDxlErBWU5wPMladyAHo6ZmVaMK6enVYl8yAPMR
/K7c/qwUCbGCzmbbTn3f2d2BPAT6eYve+OTpn8RX6LENNp/i9wWoLHLMbx7dPVRsd+21IlP9YpJX
yJKJBosJo1z5aCfZIqSwY3E6jhFOLbBGJL5WE6V1hcgpJ0Nrd0763tJGIxGMMlpG+DAatbXiPkmm
9Yj7/NbOuTdijgN8wE77cK1L/9MA7EezvmCeOm6oCHCi0CdI/C/HgYnfP175VF9aYbpwkMedMr00
OOlBiiwHutS4qnAx+cKzxskQ3v71mH2KuPKJkvOA3ZPAF/Zhg6o0T0yD8HyfbIoKqlrRFEIQAD4N
G0qTY1sZ4cnS5BjWntcptCGbCZMDp1bt6V/+MfODFgyLCBawVW4SDwcIUkEXXZ5H0br0mQ2i2b9M
67/HovjulTC/QDScJQuqytjWIy2KbIHdIyqMT1H4ym/fVRY7/HVJMQoa/RSAi0ohWgnK3eeO177j
4Acx2hH6/lz3e4evsCGuo1cr2/PAKQh9MJepSAWch6OIySKO5QxamDBuTfW0P6yvQGd84J8tnXmf
k1uPJa+aq4K/QzXg92HDy1porUOBV5XeFdkLPYpcGPcV9Vk30uIHRfzH053uZpEKpi6LTSAIgwtV
SMa3KDTS+yTS4nTNxaOYKVOfSkSj+GopEbivK2P1M/j6eKLxfn736WaA6kTryuyutuNbbtGTTDTB
GyzH8cJ6QdEz6+Git+hhQQL2jLXWgAbos8nZAVmj5+xeok3NSMaqhmlH0ATRjnrQ9OHuDmBKtQgr
7NnHuMTpn9Hl99DWG2p/uYbmwf88i6vp/DLoXq032Ij16o9jiTxpoR5MW8ZMqlhcyLCY9OBDQw19
GPaOrtKYx7YnKvp1CzCIkxSVSLzeJyXerUbe8K1Ykcf9mtHuXj6sEnYYLba9UqXibnhFbSVwCsGZ
2DmvcK/ETVBRDpfErWSUE5jC7jC6gv+HkliOk8kcl6qOrSDwhE6KQlrge+f2KjeOpfBLUs4yNE8T
4YfhX52d4y49/2MXNOX0oyxIYCrOfls664rq3SPfCkjB88aWwzE2fLB6Ga7/1wIr2KuWK6OxAMgf
WKlXcNJQHPlH0Md4lIwBZP5IjHaotnWJaFilZauy+en36vQnOM6d1PV3ED3UuMs5CEqfD/c9TPbc
aMU6aTma/G/UsJ3UR0nay2fQy3hNyAkqjSofhjIjcwx85EC+T05QK9pH/mIGLEoAQXLR6sfrv1nz
q9J6wJhvuxnJwpAXk0qk8Ucy0OMQCd169Fu4DU3v4d5doidTjBwK5eBt03LBPeIRdGDO0dhM6bnT
cUF1ggbAKz+A70/atNvruBuka5DNvsHSZJvBWFkyqdPQhYabFSEBhFP00HrQRzQPcgLnKM0ENRBV
X+OGLfJnfe4DlrPDuOM16qpMP7N3ASN+WIwEFUB6GYKUqv8c7ExGqAsV+ar/FIveZWhYXalqgZsS
zOLKkYXDZ6PMoiC4Dh6B3sgPN+vOx+PS4DYm7ebgFjwGKVy2AUrmMrS6mBmBOSv173xIIJrIO8hx
IPLuBGgZCZa7aorHVW74FF/Az5JB5OQn5W0b0j6ZI3lerWkWwJpOAcT0jHuzg6wFU+b12KguNnlN
hV2CNAMFzrwnY1pKi5YK3scLoLmsPlwIUscBjzsEBznRdi/9MhTWbLli/aQYwCrzg3jdscMg+nkS
UQq1yBFh6DuUZ34E3wz6v8sG9pJaEIXsCegPwGx+KlAtpEGFsplJAsnypzM1TAAwPQ51VPKeUxQq
j+5pGrh5M845m7MNuM0hwGWm28wnhjf3XQ5xcVJjPzeJDGcf/XkISLvxR2B96jhLCQQ4dE6BAesV
qIFp4pxRb9b1ww/ziRx3ewXx5ERk7WO01R1f+WcvBqddjGhTN0p2cROfKNkp3IbY5Oy3iIEGlUJD
bsZ580SWw1lr6VOBCRLMdYhK+p6ywCJJXovsXkOxCexcmvC7hRmtdcFM9KHPOsAuaLorZbfWGNhw
EnxvE4sJNfobCgEkJ9bLXSwQ6KoHRvqVJGgp4bLTL9zvddae5qrF1PJ0MKNqrx5CZ9eyNShu89Hk
jMD5HZxwMzIy5BKB5kHmH6MI7LkTp/Pss7DMp4VRBHUbwCg8XQ+0CPTnQNgmDiDz6YkHcZPMPfGo
rt49jfZAVCidWe6Ii93414WvYojHdo4WO7+JfpCy/wJHEDbhzQ/S9cEMhjOhFD343QFP3eHLvan/
Lr2nTXzCVAvYuA7+5Hzou44HsRU9NI7RnBh3w6bM0G6ICKZGuKBuk9rSGjgjgMZXl12XNignVgVt
CCl5q25lQAoAk1cPH5TgqIZUnJAoim5s1wT+io0J9wUK3Le7XV3wjFJHN9a0hj/4fDjq/tP6TwN3
40msCY6ts1U88np4QUW8n40SufiRRRwFsFMwFsCC11o9RRWQLX9NwPHoUdvPzG5ZL95nJ5WqiyDP
qtOf30pmdhN0WZBSRpw9K1bolkN6OeRXklfns7ybbkhywIyoEIYACTv9B97GUOOKUtS72p/BFFtE
G8oh2o0we4T9IRIO9sU6k01Z9HPiS1TIZtvLU1xY1NiYVgBdQ3dO2PumxE9Fi6JRMZt1tRWp0M1D
imN714Nk0l7sYuPmHSkXFhk9UIcbeCKw2z7g3NtTiFMosThehyZKivHBpqHgCB5430wOi19TBl9P
Vhti3+bU2XpBdp/6oP19Qj0vZlgfoHv/ZrQIS9XPWzFB1dcM/k0K4zTCQUx+fTxkH2ZYBgalRMMN
WpZCWbGeFmbYU6McDDQXHoSe8R7s21t2pH9A2uHO6nqe3Aew1D9e4SZKiOvj46rwPEupJnPqc7Iw
T2Rx6IgrR9nhxFbLVS1nO9nacCW3wCTgk1/IiWwTVXbjB+05mcs3Hq5Fpq/OnLOi8C6C5ehnkA7S
7LHQycalJgberUvs4UmBm1Z/EVrAWaLyQd8msxjdII32jKewVOhTh/fyWgQsscqhRD7RcNSRuH/h
7A4sYWZfMBXuPGCNly/ag3gXXgCsO06Dy5d7OtZyUe+jEniP1fUex9VB2csL9tnxkzX6wRjQPd7X
vtFGDoGiJm7vKyl/NjICiLjaBSxoyBGVkLAym8aaxF32gdaxgCUvuiXd3JkrGOaMnUHsc46wV7/7
G6s8qMkKRH+SBR7zUyByTtfKYhFZmfn6i0V90BCnLqlrBHBZG0ix5e0Zs7NGmAyfXyVqCJKMfIlb
1IQSukuw0EpJw2I/MGc52nSLsUpay75QIENx7y+38SNAnB452P6JUU44FIfg0CQWwoQhNUgONYi7
B6Q76lJ602HqfmntMvmj72z+9lPJX5QWljwxEHa/DTX+2S/Of1Vsa63KezG5UBEVRi2yzgaH2Obz
iulZDi5QtxpNpSMrpKdNCSkCNI1OoPd7QKmkWlGt85MqGS2BCTbOKXwaN9YEmf3lNEYePbuBcR3o
8WHdXA8+HOqnJRoH1h7+n8yyPd3MF/uNFF+sQZ5Zs1uxrUoKXNUcn7TqJSki/5ALukIpbIGSM1Vd
4tjcQMlrzfpuzOnLPgrc1aJm2qnDvW9FcRIIGD984zF+bGYC7xFYGp99Np7wZtZWAl9/vrFEr/65
xjb/XLQuFRawPHDR8S6D/4ELIcjDcstZhgf8fSV+DlXySDuco3b8FEGA1sOpemCkhmXrIcZrQPdq
0eqJajOHvbElabnwz5OO/cGcvuSUl642tQYuw1sKTln94ol4z1nFCOv6A2RPhgWS8XIW35A9QAOM
V97CuIw5cM0kT0vBnzOIy4l4IDeKoaBtc4ozMXC9VwFteqP8RJB96RiRkmt7mzVrpvgJd3Eth/cb
f9DmbpSzGqyw9vrKBjKJSwtuM6wlnBahks8H7ihNBsc1ENRubuhaFzHcvbXNxSeLA/sDZhpPKLY1
zEOlTgu7OJg6HiN+hVDfZMDluWlA/URSU+27HEnpdOwskvp3aQwg9Ft3EYPU5vI6nwXSO7hHsU1H
CGnO4MOpkyE8hInoED9jRnXh/p48Co+v4253A/GPw1aHNAXlnI33jD1skx4Yhj9u8ZKgxoukEeUh
ySprMEdgqZZcuZe6TYgwo5lF2K4Jg5DxKULzQbgqdBf6xtB4HGo0HRpCMSVOb+TXWK81lt0bzVmg
rdhBWnC1Nufff1AImWB8ICmKPqw/Y6n7b7qjLMffpf7cahPxPm5VU7gVebd1GoET0412c2r8uwh0
ZVwLZoLi/z/LYShVLzb1nL4hAVOqaNUKPxDEYoHWiZnIWmtFaWzdYlihC+gcEtp8+sEPzUB9beDo
RHvzb5x7GkmUUy80IWjVVCjHh++8jsnt6Z4a0/8q9WNycTNSdbMj2uov/usK4QWr/eItFjAynWCW
t6xVKUegjcZDaPwxk0qFYovuKouk9kyLJRNuxjVrp5xoSLXnBgKI+lQixIF3JEb3l3qNH19oiifP
yDQDVpNyruE3sFc1EKaWD8VW5HLKt91CEhS3dFSbGxtx+c29+t2RImS77gclnG6n73NX3Gt/w7xh
gMT5fLTEitKS55RfzrYylrpmT7Q3/hGifzGXyxtk+djcYbwhhA6P6liwoOq/gHZMdJQNVUy+utw4
jSpyU3/0G8m+scJlalqfh2QQFhSiIwdL+zUU6InTFhkHM7xCzY1XPmdApXG5sBCUsdovGbmwnBbr
eXTW/Yk53UfgiRKo9DBTMbs/S/aCG015x7wXwcGiaW6aA871Jv5iytPeuvl2rHX/Jkq9+qlW52t4
wliudytuhfeKJ7qxRVpekkjBF+sfjjB7BhDaQCZZf63DNq9D8cUtfFItS9Dpd9htE4RNjQXhdBin
HJdS8aJIcqhvx0eeEJBn3hholqOGr4ZsT5tK+WW5vHXb27RT4sm7eC/KItTV/lX/9H0nxu3WUij3
JY+Aa+0rhlysOOo7BeFDoaf2pKLvx0PBrdrfnXU+WMa8T6JyUSq9h/8P4ZElTFbQMkk67QHNOxKh
lI8C5InEMx0jGfcfpsHyhk7Ax3T3rLL/XA1OpTKPT6BbhNE6mK1cJ3LjvXQ+Ckf5Lj3AKWqul0Ki
xRtNzpNEAbnkPL74SSPXChRC7VAuVar1GcwfzxKmrV0c6iRYBGytL9M7rfcrSXI079OEgMinrP+q
8NC5niPV9F4nWVzfO7wlGiAoRZOL081VUt8ZQkDpsYb4CoAGbQxBqinNVp7cFEkgEABHRSmYyl0f
iyEpvH1iMUvgn0ayEIS1DlINXCCBDDhCV2fvkkH0h+ZSN1Z8/D3ToD4S3v9UyY/RJ6cj7Z5zqJ8j
u99mqUQzYyH6AaK0GLuOMEtgikrYdR1liPlQJVWboBHEdgjV7FBLZ27u13rKD/ChrHACKs9QSl7g
Njte59gf21ly8joz3htkVzJKWfeJYF+X42cW63AmasncM3/IWTQaieTrOpC4yaat4Vr3sz32TDAh
oilAxSnT8OtAnWPwJSyclJMsYJEBsseleJWvP132slHe1ALaWFL5C8XsANoQGyU4X7exmNWiQWQ9
DcI4tF/6By1PGuhi1XsMp4QnHFTb5biW1UDzdj+12tLoPo/GC9CGORg+WHsBf2jFlCseuQfXtJ7W
uTU93pg1dlBsCqpijQIA12nylj1xwVKwpQfj43oMUNUZWM3ehVbUmmD5nC7THcOWfnm0YOC233Fv
gcMe9LGO3yNsi5r9Z3BmHi1ggj70X876cXD3Y/aegtCflU6i4weNrC8fYi39DZB/zo9bg0YNGzZi
49zQz/YxIbT2E3hoKMghaXReJ7lqNxFCzRweJq/4RCeIwZWwm6/sZjjeO1QTjfcLRz4k3JAPg8kk
HDr0jQhUBq2SUZxjFLgZYuLvROcJW1HR3NIZV785IU8EgnA27Vacao3GBMw/Va34oDNrLld5cn7L
KFEde8gSV48JLApqezXI6KEjgALwsM6M09Ls9dSdmD8U+rD/1wRcMjzHfcXETWemMaoLzpR3cT+z
bMgHd6Bt/FmqZskUHtBN07UUjvrTNUmyyyHysDS2uWZV7GhuiQtX/eC6M5VsA+WCfhz9g/hHwv4n
S+tt5kT4T135AnPU36qJIb3dcYvEbiyjQx38oFQo4EYQhxvUzSSR5gM2Ggrqoj8v9vsqUhpq6iZ8
STMoZvGjjXhcs6EYOUjLFE5jDazNSP2oE27pxlggzxJVvTepXjVcHoCSQ50uAXHE6pfQqRzYJ77c
wlvFjqe9mSbaPeYmezOYUV9F92SON3Iq34Itbp9NRTzxI9JMam57AMusLJfonZetDIxlb1p5kzY6
tBizrhhzVyYb+COsC3KAGmdJgetL0BSQQsXA+tfqv3pA1XN2k5GgM0M4fP5660DrXv0qw0iVT5dd
mQH2Nu0B1G5tEPpYELhq4kdDDKNNg2AjBIxbcJRn6ohR5avTDFomfmnqjb05zQXCuAu4wPQul/+1
EluBxPsHdk/U9fAom4xFt/ft7/cLrG/XbF1foWFn3WbWmO2Gz1PnzPYHQM2bse8NZ/TN+gJazDhw
TX6zCXShNzNyoHj03qsoOXeBFxPJYVK+vtkc8pwWb8HknYnj+DllkiYFNA4LuGiFuOXzbbq82Mzk
eswY6jTu0F6mf1l0UPaARWIgNm3BDGaB4yhDfi5S5I8lwhCnrIvWW/PVOzIYtwYQuqv9RUw+WTU0
cutulP/2VvZT5hQ8bP0CJriDysS+RPQmL//qRnFvKyMJF2ERVhIHZ1tFqX/U9i33/X/hEJDNySr7
m28yvB57D3ObajGQLcFCLMEx8T3aELcSJknbGqVAmHOaASeQHYUbQ1Flay6DUeiG0m8iJv87al2t
uzLiUE+4LYd4yxgJvPdDUrH8mqIyvJR6P8fM+zsLnlkVFZOatMhwCKUeUCuyxdNHNytNM8KVIhq5
E5X89e0OIJKa5udfvvzRL/YSoC3D9tcUwZ5MH1k7wSFCTzDIq9AYWCTZbzr5XCMzIai/hDckfcPd
A1C2SEAfCg/TU9gX+Olvny4ne8HKnd1rwadish92/9SxXsMMxmBDUUpY4PUI1z7hrxoCTvtCR6RO
GioRa3/lgvp/DL8K/0Lo9F0nidTddeG1ZH2nfhKVBq5MW+JaiVsmyez/n/Mspb+pe217MjD9lBVm
OcO3RCodAXR1XGvnpQ98TdiVxlV4yJs9raiG56DUjakS3knxvWO0JQpg8CXGcPicamL6LTX38pYD
XJ1yxkEvCxy58/9Ltc/1QAPYNJTrGgCsqCKuqNFcQHBuQgkNjHm+PKNFjOXuHkz9Wgx8zuN7hbKR
IbQXXbNhgC6zOfnKS9yZYAII6hmlRv0wCkuR+N0ovVk0KMYKpb2gxu4ECIjS1fx6zQYIw2gVsjVO
5qG169KdLFCRW+k6KTvFwSsIgu+nV6ZM5abgePhjoxawce8vYoxNoDhDQCQHazwK6O1qtks0WrSE
tHP7FudBMDnPmgb72RgVEa4IcLfuCMo+0dbrv0XCwfO0YdPrLrlo+gmV0CBy+9BQOXG8F6MFFj6m
mpMm7vtGHiGxKRPJlpAddRGC3/2SXmXulkLFk05N6LF6CpWD5C3OWM9BgIKcQi3zqwOBZNQkjW0/
xu+ylKPQ1lEu/DrDxcP+omGYbwyabaAAvQMPScVaw/He3EViIOqyNA8RWq6/VDdTlsrmp3G/mY8/
o5qQ+hK/vAoSsXNYFA+JDIciWrAPzHZCx5S6DVvUxonUd7YFn6S6lT0zVJLltgO1ghFRWGtjXXVy
JtPurvhgJXSNidztCXCvrMJ4N6Hvpgyh+pZznY4Rjh/tB8iqLrQv0hBTVwggMHlV8EUOso369QhQ
ZVtDgzqEqR4iozjJp+3OU/9Ib/zApyqMrhKCKxik169RijUgykVW9O9e8ixCWafP3iBdgYEDAIkS
G4ryLZW4quU3kUanVtXsSV6q2FOzw+FJ+JGUFxQ2fPtPqideSPXy9Qn92zp6otqtbreo0cUpwwhq
njBbSQUAj55DfMdacoPxW+yiZ7X+usGqmCCbhTg551335GEfIsbMWv/jw2EVAFFEhKHUz27adAC3
LI/3CKRMm9dGEZTpMn6NPVR+Q6/d9QczaYsUdnCFg2rRxIGaRSzRqUHnwxvnMULGtHlChG437/w7
njnF/rym22Qzj7GZgCaHGSgQdWsDBLbUgi01cUd60kRsYxvzFAPUS2go9kyXB87Etz9Yesnwa7ao
Cpk8DELSsNKmkaKDWJE2so9bloOfMiZYO8YFrd9J/mcLQFR2FiPawrJUZf03GDl9HeHUIF7vkidA
to6UHbg+wufo2GrPKOStxhLkIk6yWwOrkrwujl+uSuD5ktuovuywhCaIlVKkEw2LBGHl4KyJKXsG
qTr4rAEJymBcXRRD9XxNQ47tATdvTjphDqMbS+nED8uWVAuX50rW9+kNDjSmvI4rgjQu4PYv+p0L
oLAHIk7PZYiur2FFbDKElfZUzgYVPdSPBqUurrg44q7O2kmamr9QtQK3hc/nbHXcMw92bg+nxTUR
eOyTHrLjI8YY3Z7JoXkPcoYR1AsHKJoOBKSyzj6dgfe1CtQlW6ZpH0WtZNlccGs+fRZ2SCzwGKfc
XrNMZhrcX/Dsl1TWsnusI7Cy6t+7RBYIYzSNI1H94lAR5WVmcP342zsqIuq6SilvREt8LFEllb/5
VIEAvWtiWU0KawjtQZvyFSHjy2c/VanlkeZZo/4Cw5V1cQx1j3azhi9YMrekb67mFXQX1YoJ7gLZ
BLu80vwTZss/3xJ5yV8qo2V6fOBAyvUidek8lnXCgzcfFzcpMAxgQe+oclOJOBod5q25S6ziVttk
JGm6xPyPPv9z4td35x1+z5JMAXfUSIUiZ5YGSwFIh0INXGrDdFdy9IWh/nw+hNFFMgdPgkUxxW9Z
J54OwId7T4AojHzGRT2i+xqV5eOCd3kNxHkjL2Iq3Fkerxjg/3vqgGddmXWeh1x5bGaFaQiKJ9X4
9eZkG+vvrh5r7FXaITpJnQ9+6kofH36xRTx+gxjfZeVOlj8unTazco3s7yyb3kqPcsitlYGKJBUo
US9EefvJ5o6FRPKlAZqRzkyQSzwvjyjvGAFs+4Oxo1vJEFXKYntqicpIEuQH7xHWGiY9CMNNtsCi
hvsUho9ScILJKz2pP2BEPY+ehmET8T5qLQhzvxaO1w4s5z3Ai+E7gIC3sP6jt356LeNcA9SWbogp
SUsEJ70EkU645biUW7VfIQtVWqVQ4Bp5hZqUcf1IFx8oW+jVnq6NoS/lBre7qjBlj8Qf1iQpkRXw
HPzeVXPOcql5hy/8QmiRvaMin3qF5kqK7exAFsVP/h1r9d/9H+q1AURsWSk2H4rQ1IlnPP1iRQ8c
cYVZtZEAjDLJnAmkqb8WFw6jECJonrtGG2rfapUmRtOvJqLjkYzXJZ1GOQxTdpk5DRLwpuWByPE2
uD+WVJLVjnfXeHgV/eG2vWnInGTv25dvgn+ZK7isFZJL8sIP06xDMTV0rL3yIGYMQ+S4J2XApu90
KdBc4KJSx8FLJtVVulRWwIYg7R3VupqbMr3c/7FShB4eOzt1r8q9HNlveHleO0PngyJBkE/b0stJ
E+j0BNO/HiJDdRxTzQpB88E141ft0tEEEpPvs/A+Sh5XkRrVBi3/tgvXF60HIlcRj/5WjQEpCJJ7
J20e9ZphotYrhanNMEJ6EV3wo1lpaBaGcpCXKhQcYXhPfwmwxvVH/s+eSGNeMiOmVU3bJGuL/2cP
X2uXrujAIQQJSgLQtYS9R+8Z1tiMRew0sBAEES6miDvTxiW94f33FOPVe8oHuU5RDf7+h6j81e5w
kbeWZwscF5Kiwf0jIk9B/P5p82qedv3O0rHYYYBenMOt1+tcLEEz3i2vFzZpxA1da/+ERcJr+l5U
9IJ1x97w2x4h/F+sugo2Eiav+6s10kPxl8ytac4AqmhnLlpLNjcwQH3q3gPDitJ1AbwWql2uAx8a
Roj6r0r+WuU30azb2KQlt+HBhV/fueK8e1xBf2S0koR99QzX3XGhA/hEaesv+1qUQLjpLe+cb3sf
YuHUDjk+9eibL+OnZEKKXQgDJtt2gLrJJ+8MI76o04AZAtLluIcdzMvZlW2NTLpiL3o5q77BRImK
iZdRHxIdUkgu8LxecdvmTarY/Wul+fX15/i2QDtphD0Xr26JqFWLfkyTPhjRd+QUP17Bonp/Q56/
5KTpyWnXQ3hFnpzlVDjHfKpLwOWReKhf3oVjyO+xkHviPdaCmdraJpBTzwgrZ7NdQXm/y43QcHaE
P3CQbdRpQRSLbFWG3jsu6fgQKdsQcEZlU2C4gzcOTN2j+z19Qj8Zcyem4KJB1brq0wwPKVhAOfjz
ozYd12QiVpeVMsCCWKNcZjTxcmaFWvWbqRaoXcyk5r644PW6hVhEhZCu/dk0rUhvMy45k4EtxDd5
WDbiauCSUwDpBvetgBxD5wghTzdt55ZBSvfkgpbMS95mOTFHEF4T/EOzH3UnUb+U29n3DnCtS48B
OCzl97u/dO1XmaHVcCtGyt6VqQkeejDXpVeeYQgWF3z1kxEtawZRTLFDPRNSZueOU98rli3hiHqv
I+Z84upoItUO4RVM65RLGbFa8b6HTsRutCuXH3vsq2vwVup4xZUdhId97DSJZbeZcpuJylKyBfmO
MftOnr7kRkjmin+auK3la5FQZe3JzyH0kNEdZ4Zg/eXLypZE8/a8a6hdfTi6HOALJmBy3ilqyCCn
WcsvjBwL3PADd24hi4l+gIG7qPCBk2tN+q4tNnEOCJxbTaHIwbLAH+a1r3qIu/ypOs+VaV+o9a4v
m+0IJ9kWutreHquR9elz/WDpeztkueZ30IuJry6BlO2F/csgDap/xWgKtJdyGTM7RnhxDc1QayJG
A3NUTWFLG9A1b2dQvY196tSgmCgmEbG4AG27srW6E4siDeWmg3soAuSlfaIJg37An5TIdCc9D92L
btuHNoRzeNtir+p+0f1hhXhSATacL836Gk9oNPSP1VlO5WcsaQf3XOJYU7K/fkdVoJtEpp6mKUFf
5qXBdh813NEyuXmIRymmwTthbQbQFpDLpSCjnkwGI/3LXIrBZh/uPRUoZ+z/3Oecm3WQAbfbBG0A
mHj+cpVjzMUkljgaeighzyKK17ShCGXEBcMXN16TeM5tcSmxAEDaT/60JElpcDIFtL848eUWilAf
kzLXGBp0EIE4eezXq6/jmztV9le1njiW9pX6Y9wpJL1d7KSTahkhqTEbFVlG+aO3lG9bLixnygqC
wqWQ4rsfQ8QBwRGlzt0k6G2Hh83zq5zmTuZKBOWsnlCcozi4UVkC/IL9zxALFcm4ROYE9hrVsjk4
hyGcZNlKzrlx+ZrPsJmP011IUz+efbkjOQZbvwjyWDxC0m1FkTLknPNKazSUtLUOOl7WOZ8vHm5U
bZ1cDn7IvK/GzVbd9XKLB4Y6ZLjitNnoyUzcPhnB3zSsAYzZpG3PZVjKA4x0y8JiXfIGRGTlxjti
6h+dCiUHW4e9bBnEBrzxS4m6AKM7nRxpX1/4tb9FkPKYDXp2Qiu3o9Gnh4UTWNnFjvRGCexoCG3G
aU1Q81DuR8M3PznOsRwrBxbbwolpm9l2wt/to8hO/T2nWpC5ECgnTv1T6kvYdQieO3khTlg1pMCv
1yKYwGnKDSuoAtDZlagcUSRq+TIooiYtNrua3cxnoPy9mwk7810kTxbI1BaNqRoV1MV5UQRLVxbe
7oH2/gdBDop7C43GrGYEODJAcN/kN9vU8B0//wxLKNyvopCwfz4BGrWWC1zMebtp+dhw+Td/pwUD
9+MYmXCPAfhogT9CbA1hSXY4vgB1izdHDx9Ol4N8PoQtxrQtBU9ODVazuG1YFyPB+FiZo3lidTl7
jI6drsmweXOKXsxN66CNhMP1/YU0WJVFBc64L8s8+k1DD6wBrqqx0B6GXjo31/RW7QpXryueiaMs
d7OKFLTHO0nB2482b2ZXsl7Rue4NoSJnJEg7tVz4PSsU1mwTXhC+dSND1bggVAPzuvMIQBW2VhhG
VcocU2Ql0kty3gHXyfz94xOuqnkOpxgXd6ImDqrN4yjHvKNk5Sd+nYuc8J7HvAOPZXBGPVKqJ706
SehKD/tD++I2XW7+A0XeGYhyIbmkBnqNQLth+MjNZTuiF7tin2UHUZ05eMyq8BRl9wg/oJIWQX5z
ktHyhA4AD1lYWZeiNkQXg61lHeXMxpeSPulMUmu8mMJrcMM3Ib71QmcBKov4ux810Jy5T6dfk7qI
voO7iAp7qcicXdS9v2YyL2CuY95NfGxdKl9EE4StaW2tOqfgwHXMIpePSsP2N0hwS4WKOlDdOqIX
UdT2Xbrm5yEYlLAwa3Fiw8mF+MILiShLyuhVUffXtBti9Qd7LrQr1H7gCED6OcQN1w7Lw9CSx4+H
YUaQdTEhKRnetqsFOe/D10MVJpjscC+56GJLGcwAyRcBynlTqGoorN4pATVMk2QIVsJ7zq22V2we
5X3nFsNyPptmDyyDnqtt5YcOPHMPezhcamERUxK1dX7M9oNKKueLIOhjeb/pKFeYQix0/PUAwNWO
RIGdrVka79H2OdOOQNvX4kf6WWbp2lzEYtGJYM7LypDQi9VIsPxNcx6X8Z7QF0Fz63tyKZtCq51E
Jqa1QgvP033uwNyhCCruJ400iNfi2SyoD7hhWT37sT6pEJnfHkvjL8V+1lo1xSWiIvFltiWr7Ro1
afdRFKZZwac0dIfk3CsGw9XzFQK1NQxNqEfbXLeccBKZyY/YdzwvbXD2exnTMqReJYvc+mBS74/B
iZAmLMHzAZ/rqF0+BfrNTyUBaRVLVjUZVYYd0s0vdgufCHkV5l/REaiXC8r/52y3mXbEx0fRUaMr
LVDIU2ODRYQCyt8eyZbnMLRiCBjEKB1J7nXv0rNQ3ywJAGWj+TYAnpmEq+xOz+guJxginG5RWxTt
95IEQrzSIHMXYlII/oXhLuGYNm4E5xAZhuC+wx8LKaz9lo/F8bNkHbs7jBq3qlPB4xzQ3HKqMK3y
c4a+m+GxJlwbuK8DgmvFA00LjV2jtHV6UpddgyaDgxEypG66kVDVGhwuGmmd6xa2jav8njRfRXgR
AQ4YcuIXzu1OnQg989g1nCfKH6v+hSDScAZDWdTrjBQ5NiBZk4wVXfdUOquGvzr541piIC7VusqZ
DOgAq1SWL66WqxfQKfkyJkZn6l6Pb/cvB1wn1gPuRFIlW+jJAszm8QR4Q5OEWhLjakC5wJviyC3V
dGz4KTvAPA17a6Lynfifk6k5mQ9Shga5OeUmubO3cvDlUcmswcaqyZAhOfQnUwMYgWIHkFc8U7TI
kxeDJAA/7ykRBEbV9QlChkPkHyqmWIdEV81gnbB295FZZiEflAXJjfKLs7XrNeJra4NOn0m6mh+D
AxsPLXkdkCilvLfY+a8pHD449RO1Z5SfrE+RrQl3C1zBWO4DVSc6KormyW2VLG9OzMMjDula6H/T
cUJYOdMgE9uJE+wfGOUXc0NA94XlwxulXj1vMVQsvQzCzz6bDeQuBe9LZxm/UCu48wS/ixCjoGu4
5v1BdZbdKxEWCpjQg134gCwLpZ+wyhQ6JA5Jj4ErIMTwTaawOXoMpRmVeFgjWot9zkg1wlVPOj7d
aezNnCBK1a8a9o0GCJWVTbLF9u1DNnsn8H3jWMr5y6FcxQL1mDBwpEXfvO+C/RKhtPu15/r/Un1T
uKgjTFIx38uhF6Y7npqlZkiEAbYXFj5aI3FTWK+S9c54LSKsG4sWgFhi/ExGY39/Ii6kmmyIS2MY
yYnDO2FUL2jE1nzFOYHumR9CEgxhPFFIPhP0JOB7B1OGx+l8OKhqCxkm7lLvrZk4yfLTo47PM6kN
GLGegoJ6xUMqT5xW3oHN92iSsXNgUvVRDhSYgAHR1/xV7rnfmORAduiH3edtqXFCIvxZs/RKaRvA
TKqWYL5vyOSfMCLSn1UOrOSpogTTJ+kSUQi954LRyzWFO0lwD0Ow/5mkCVGowbvTn8EGnzkwcUDK
7NSoem2ZigkQWyYNZOFaUqlLm54IUpubyTKXQi6J8RWRKxnVhV6F1yVNHDyH6P6AToVlehVOHF9k
VAmCAPuyHhQA8kp4WCHLke1hJmpVaOM5BiYYgS9Qpwm5Ccv0N1Shpc81mttP5ZyYw/9A9UQLqbnf
lJB17yWcLGgeo2bC2aQuIgFZLDmvm66peQRJAiTyai69elzbCe2ylB2XxXr02LlrIqAW9jGZUfcC
1+sZ7TiqxyO98osgfDZ4cCnAgq4nefMLSKX+PeD10VNvOy5u+lodhFDD47Hf3IPe1uXcxPYhc7md
ts0Sed15hwi+C86JH2tLz3zgInz9GJMikveO6gyISmbV/Ga7igIJ/HoLeIcyur5iIla8EsCJC8Sb
qL1kjo9Mt8plilNpcddY81OwvW6vQJEwdpCLSZx1/OQR9GZyPeVUf4cC2r42Fs7Sdw2iotC7plyw
e02PA3y+NORYoQ+ZCTWCqT3cj32ClWLqvBNBU7C4GK9/tZ2yjOR7WX7QMnrZ59mEGX4kIJfGf6yn
/Y1BDzwmK1DYmFs0rccNIf40hY+QM3nFKM2r8XyKTwc1gmIXD6yFMdVmyNwZE4sKsv3yX1Dn8NdY
T2GHvjVQeGJ/KZPh8lT/8V5Gs/nDxp9a0BxCsou4suzmi23EQXeK7sEbBF533XWHuq9v8imMXayB
2MRsNGLZuzh4UwQNTn5r3GZFPt1/2OiRCAjH41zP3SOe8XfiyFiT/Xvug69fpiNz/FoOjCIx2s1w
8+fdTtcnHkPsH0HHefhfz72IDhL5a8iAXRN+vMCql8EZQ+WT9FDhZ/rLi1QMKjlPuSpWwFfYG38h
yGh7c0K23jEfm9Op07mrTMU+ZEgWFmZMIfNE8krL2SehG93ovx9GutXDoLecTC9RMNYlVXxIuzom
irwkRZHvGFe6UMiCSxkeWdJNM45cJ2waYGDyovwziI9HliuBPd+VauxiUo+aFb/gvcaAbZj10NUc
ySZNFU+VWk4Nj1AJgXOtyusqCM/kB/z7syJu0hVspAnAmW2irQXoKYembzrbcV2O7P0laxhsSGC1
B7ovui+fAsiLA3jnHoE5oLDpeLvNB9T71GklD6ATOz/0sq4fACSpJe+xWy27lSIIRYPo6COZ4SUG
iSS790JeSNHVTxZnuX9J+1iQi1AyDmpd8yP7flACSWiBUadU3bjCRX7nHiW83Ik1l+fB1OcEWN2T
i3CU9yQbett5+JW9Lq7Qdyq4Fxt4eYjmX2QtWPAyBDjlUnYQDKLgnJ6iyQsKYriLXDbwzxspkX1I
1LZzzhMtxlaUEpOAwA1a43Xql6xUBOX9oQ8T2OoyMDMXylLZnVgNK8cR5zr+AnwOypgpgTQSzd+b
ct8OGDzpqnPy49Owmg0dhTBTJmEUdp1OHfRBw0fqRUnCJJnHTEh+cUyHgFNjzd+Sv4OdLuPNRIa/
GFETH9+0hCCxUAv9BLae9QuYdKmGeCs5hlzjeewTfUXTmXrhC54U0oDpiDrLesDEIQ5eqeNAQ95r
MCUBWJGBJIx4jnUB1lJFcgSiGbutgsAGRCMs0iYRbrcWCj4dIUfYwakkLsmKksSs8OhIhBF9wuOl
IXoLJhIJK2XsL9rriDVf/64OYPglJHP7NTobb4xruaFXwR4p8ekPMnFrCQTBnVlCoIezB4HWVHvK
2LhG7ZVI4a1TVz1ietHEDELooENjXkBZCnKYwSmPSSl3ufx6Im7yIyOiNGh6aRtIgigPD+lulRmv
ycvqOZI+W0+oPx43WcMGq1NmFs+C3VvRK2g32Sfewze82wiaCAsE9b42PZKWsAfHp4FpkhKWSUQj
Rdj6tvu5g2U16Sv9pb66k37bqwQw0P+Gto0F/mSNio5NVvqeDLZrDbXFi+hLbIAbmUUOKoEpUjkQ
Mb29mtidn7f3jq6cdFX9y8kNXMVwGhUkxq31Fhc2NuGZWwHxBRarpJy8GsMhJ9sIJz6CZDYlKB5B
jGJUOe8NBIh4iied384z1sg8A2sABeO7NjAI/WDduKCYB5jnDk5ZYqbllfchMj3/Ld0juxgkut1M
W+tFjd1buOjtUmLZQH7NaDIgNcSImKDzZSkpw6+JJSMOv6cPPUhY+rBbG8D+EAZCQT115WtGlvkJ
HWowRu/uHqJZKkP+q4vlLmCOQycFL34TzxeLd/8kLC6z3RW/B1VV1EdL0jNLUXXd4rTvKfp1+RzV
EqaRikSohP978gMJwyjcccTwySHCY05m9wJm2pMzcB+k4N60mjwWRVvOqLoLzXFr/xmRL3txwKc/
2bzCOaC8We2fY+EqVOE3t/lKGE6giIMQ4PrpMCsYY6nCuOwpRkQhdmMdM0Bhi0VrDHV3k1nrVcjC
pm9baIx4KBHNZMKpjOofzCWW8O9/kIgXWkT2L+lB8NL6wgOyg1w1s7oMDAjtbN65vuyY5jdosGJd
ILW5FzR0G2aohifKPN5o6/6tYFnSr62slnJcl2cNtpu8uDvGbyC0J0hf4EHPosB873sNYtcLJg1w
FSPYph2eBafDyFRPq7Q1X2/epfuuOFvP6DyUSL7LRhSWcsqB8fIfCdM91OKwXcJFdGsvRgdgrO6g
jEZ5IEorynWTFdaKIk6oen8LqNp8YglyseAz797ILW67s1RBZ98vobXIdGE5XBNd21nVW+EL2UUh
pCgBjSraRJAwWmi6x2DKpQKCTzc/l1432IxKhSvJ6ZC9ZdpKoRkgTdmjfYMJa7lRzlBMG8xjLhe4
gX5xMopQrdBnidVLdwHCWGjuZ2ZUT+Ti3mx4WbhVDR9PHuttgj3NDAPUd+WbGe+C+b+mYwpsaADs
PuxI2m3AkQXedMiHlbg/j3XWN2C7lUYP0vAXQFKDvz+iCgfmJ4DNkygnMv+K4ua3I/oTCcikVlnc
XjnxrXVq6eq8M7jSv9JKcp4uObZ1SQAyHOerwVBXAn96wq8Dv+bQiJrz0gZCGoem1AhO9bHYJmj8
t26U4QuObNdu1MZZvvBkTXpb++7ErYYquTau1NtC7Niyf0/ePtmvWi4DxY3JyosQdhqegZ9KZODw
H9LXbfkFbAfZsJO7kRmML/E/kn6nMy/8UQ+n7WBaWF4DIvyjNGyuW79rAdQyNOjfVjvfa78nkDtv
jadGu62e/FU+DKKwmJSGIb92X3ZDB6EtypnNP/Kqj7AgTjsmWl6xLzdPJuABdc3cEpcW/yjnAmix
0i+If8sgOlA+6dvNEauo9ydeCOKN2ZLeGOjiPWt4KDElWh9zrC0rfj78QVvZSCZXTGcBT2QWQ1+r
CZBm5jRwJ9wDlYOb1NqUX9rI+WpcgAFVzcejo9EuYUdY0bfVDl/ojNVTTcodzdTAdWmn/9OagxPE
JDQVOhZYi3KU0orXm5nbeLjHV6g3YYzMMHEWI2IzZUTIgAvz3TyETru224Bz05QYPFBc+H2huHjF
Q+YJFycimJDoiCbJceCvq4muhxnmNdMOAeFdBKKsbqO7PMORY6wUsM8cwurFW2hXeEEnGcBp0yno
DGIg3zufYvCHp7M/XG1xOIX3EGsehBoI6wihga4mkWk/4b1Dp1QjClyjnXUC/TVyOCI8vC1hH5rv
LGoe7qGswpgqWqA1CBfsnqmzlik8hsxZS+OeamrhcC8TknN+GZUCR0qhu4MDb7dXsovMMUVaFkKb
W5rjXJfXaKSxOtHkxeXoHHE7wr8DFv4c31axJO2K7ilZXyxANkMC9BGzdzRFyMUv/5vmMFZqEPgq
6jEYU7ym+GCg+DervlA9QqfvLeKG0c5rtgwukRDxY9ebnfouT0uxrB7HwYbxDvwrs5wHsb8h83FC
wt/ZGKW9Igyl82OX/Gfi8voZqMtPXgHpxa/RerZ/HlW04xMYgSecTISwByArjLnqZHYTzLWiQMTS
yh0wEjFPCiRDHYO1Q7NfG12qxqOErrBusYUQKah3PvHsoGGO6OjPSgt7+ZZz3n/trt/xC2hgu1Ab
BgBvVDaepxZEoqbLIIUBw7XI4C2GlaaUKuNFxrumv7tvL356gSMi+Z709SoAyr5HYlQDBmvEe1AW
HsZWCZMryXhvHKbXQ3VphfbIbeqNbQ2N44zZYfbMf4wduk6Cqsak49AtHP2XYhmCCc9pKlYzIRgq
ge3lzjeAWI5GEVTvw/gFHU2tq5Ogk+AMyuGJ4dqTluFr7JoxTgCJlkfuLl9ILd0oDmw/n3x7zuDk
IS7YbRvVzmc+zZ8FR3r9XrZ7Y2ArnzWx/rRmvYVyga/37/jKwyQIz+QbCQVYnyPLE1GRiOHYZIQA
RqTuIsCs+DbL47XLGvwHtEk/8bp0++dpXBaLpQRBfKjrVXHQyomrctMTfVF6bh3PARpJDn/nCFml
3m4fKmE7Yq3tVGg7ix0btY6tXazA+6jN3Fgmi8CfrjtfDaIE3O7e0jL9VzoKU6oaEBA5qxuxBzuX
Z8Az1P/PaAbpx9PO+rBZ4Mo07HWxzkIBmjP3P3owTFbQffvufMpKtx2wJofjJ+j4XDTVWuKZUl4S
ovVTXBH/WytGImbu8FukXmDW5kwPbKCoLDcRxV9lEKF8cHUftLsBHvoh4hzNeYdXKLNq0i0v8gNk
hhTc+EH4ssOsTxAzFiU90fgGTmu5HyvxyE4KPfgcA5pa0Sm/lFyca4Sq+LPgs8VmBGrTqRXMBKYq
Gi2ZSwvodZpXUecs+WrOhmHKGzDOPF5k5y+ioZ5B55Dak3TL3cMI/GFCZbRgNV7dT+wu8lVEA1nr
05KhOL/Uvu8xqAVy9RVH+a+s1c7CqHvTHvE27wkvpSYgT7rSqgnrreYuKYxMOlG5BNeH5tf+DKDp
hNizMBJXq44sSyPTMXnv9Strxs7nl938ZUVayOFr7iUq++oocQ0W7dSAifBGeN01+VZS/oi2QfqZ
M6VT9jgYpj81jDNXMSix9JnSDsEruul6xkcHbBI7ugmxvx7cT/oN/myX4hVsYWTCI6AWZBNoIJA3
6uuoVbaEyImAk/IAq7aC3jp8frMVHZHwRL+g3mufxhOzEFatauY/CdgBjyUJ6o1iXRRTT8o3nuZM
oVNaFn/un3M9Fr9n+S4iRkYSsYxJge7dmBj35xykQm+GhTeMYuLXMqFiTXApnXGUTW1246FAktbP
NKzrKf45Tg4NYsNSgAraVPFqZMq8n4G2cEP2HoBbCpc3xaMifeHJvMo6horru+EX1PYZOWkJXoz4
bDUXQqfaRTDVRA0daxF9eCi5onB2QXumi5qGWINw6YRWiX+7PSCssqQB61ZNlpOxUveYqMvdrMtz
FngRrtvwiTbWMvZmdf9dlYzFUs5wcNoN+0EHH2tcWG3A4jDzVYgwWOYuAJj202GmuT4qD1g8OeJN
I9LEMSOARvuaaJ1np1/5pSkvJ6Jn+EQekNiqLMxEl2go8MQH35Zv000gYcsM/ykyHyZ4GyCC/C1T
pOvmCJTxhNjP92ILobuAWk2RFmt67NTVByx+Ar7vmpRJdzUiVEhE2s0tOzk7aH0928gKVbu+3L8F
tYQhgSMKeKFgNAFDfLxpg/ZCpAFLyMn8PARzoTSx0hhm03VkbYJHA6OtMqOwxYCfsO9sQjsPvE9N
+g+4dsiVG41STI/rQgAA5qEF1DoP7owijsHKpinTuDt8f1GQF/dKt+hzYulLQUbGiTbVUsE/o6vb
ImhY8OhDe6EWae3l99AxYujn5n91fMDY9jtAPcrDdmg+BFYrWko2/qmHWWnoUDGPXXzBBCv9NjEU
A6zPN6Cq0qj70u+vszwojy9xtQm37CpU6R+hCOElkAS5QMLWpSQuiflkN9Z2/yNfcLOYzZj0fmVH
oxKYAMp77Tua54dwmme7kocteve+wUqPUQ9O4DHdwRQj6NoX5eAc1/GI7n6ZgWTFGpvSpfhenyks
rj8h+pAkIxUvm/SDgdSfI41mRtBDw/79qk93IfsMAS3IrSk/VDLw9y11tMAu9hj8pdo+MIcDboYA
7Z6PIjahanL8UAe68VK3/9x1ZhTDhditqh290k/14uj65C6QjVzP2muoICFetuyAB9b0fKA9tL7/
hk80QIXQLN3VtyIxyc81trBXviQfAqEDIONhmzOzh+RGcIkQb58vuEULPXaxe//XNlUeP7jX7VlL
zw2Xz9oG7zshrRah+0YPioiGCZmrvbs4IYcC2JTugpE5KirZeEsT/6ZzWoYgSAaYfuvy0X+FtPY3
96kwFPli8oR26RxpGnYx5Iu3B8ba6qrnCFu/TVIy9Peoq+bP0FkSxlbueL0qI9pvdtmy2i8xMYAl
7QUasEv3j1muc8l6K1C/JzjJVzYifmsNsc2k3j1iFKtrENsjHTmsF3RibWBv90OGXj3yxUNxD46U
r1mhJcTe0ihFcO2EJInenDCJDhgd+E3uKhAAtgxiH1SwSBVhkMvBgYj6bxEF4sEAao1ZtblGIiWE
v2H3ZHveV+bzPa+QfBhVmvy4nlUTllC35TGFLGWgN7pUCgcWVJrdzZAwSunfAQUbpz4kEca/8LMQ
oYFfTIjbY99TvE2WG4rn2pLbkhd1gxeBbx05Sg7XkIkix/vN1xUE9xZq1DBV98jGsf/F3eRx5QJx
28plJ51alfSRjdue87cJ8qExtOV6df3OL3eFvTCY/qT2DiCUNAkkKo9+1EN4aXZiVSGLflIK2X1o
GJiwrtx2O9Odxne5uKzEjAOCOk9ozjd2iPUTYLaGBdf63VawPLsvF94B3x4x7Sx6CLTUziWDzvzF
xO5JyMy/ktrBQg3GOUqgKyJVhc8g0kaaVhBbKHd97LiSJCQyo5zV3AALEI5YYH++X0xK7F7/HzqM
HroddZ3EW4soAVOLv5mflE4O0Zz8rUez6UQm5n3tJ2Kr8FuS9Bckc5AB1sSY7KzCiU4MXP7zeX2v
SNAyWL8+GJbyRVZhK/74RfegPiQJJi5mPfu6iAajiVjHpDzGXxalhlw2kdcR8Q98RAPYDs8V8hww
TDWOjbf0UJ6fwd2IERuiM38I5WDpnQjHdmB802lPzSop7aFTGzU6GawZNGxss8lN3W+dVDUngG9z
aKj/BEApEH/90vN/yaOr5fOkXg0DsJ5+paHYQ49gDEWCXeH2a1EJV9ykx2TJmmQqpC9MjilKHuna
FNSQDGn47LtqiEuAdIqreV19JJmgffPx1s539IMBfCtTzCSYX3RvyIGnWkYb1kDfb8r0n14lb2A1
xGFBL7beSjeNxJpAXoC3zH56hg43hLhLZqNjJ/rLJz7wUBQnmNU2gBl62K/J10b5BITIeujBLXxu
50GYDH4qIMhCaMId5Bwv/GzGA5ehFMSTvJg7sH9af+zy2heMrGUKne2n1sdA/pLQ4RfZvl4C8yBI
IUSDtHNydaFbREVyybFHOpnbUsc2bLG5uf0khOaoFh0GuPOSVMD8ovz/1veBAErthhFo6o2hkvjP
Rt+gora6PXaa8TKz9a/IfuL0BGgibBE3J/piLpPgb6LoCFwcql5AivznfqY+kOjsRSUe10NXvFmi
noRymHJKkGzJgqnON45+E48i/MwG8r5y8yy7AFUsBgf8/0mkkh9WALIaLtfho436sxmQk9fp9Ay3
8Nlv7ClHM8jWjjMttnl4kRVQv9ONUzsIq6OxrsjJhyMhQZ0o4jyjFnMdws2MjgP2C0eXYTctPh8+
fwY1KNeBc28C7FB01GgOjeaikHCrczDnNZhEcUo2Apo3hoO/GFHPGXncpkGgxuQpcD3K801uH+91
Kmvj1sVeBrSgyrUHeAx4YU2CO6AwpVclFXWvKP5Xa+1JnaCuucQkAxy8oebk5C23tOl4f4mAiHOZ
mlFxvaiXu2Yv2jDBvHghpHE8T+NcRyR2wfuueTviYqxv6Lg15QEy1u2+lh00eED4emAyBqZJgHSj
FIu325dqu5vwBZ7Ds+QtMFt6m21kNAYUNdPIrj2P6K2wLbMgbNOxROI7jIGy2qRIGOz526v0MT6h
QL2faazWenDLodQ30lgApHzZeLmOIiKXz5cvAEGc5zi96yqcq2NzQdqEXVDvDLd1gfGjssyn6JxV
Zfq7X4G6NNTqmZHpvK4Nyu73cjngaHvuDshaXduyWZbZ2er4NX1hl2CcSRZoVKBMO86azfggNwhK
LDuNAThJULP3nbWgmFrQmx+7p+SdfbZTQHw5/9YLJo3YCO0sWGUCMFxkeKryN2VYaC4UEw2BTC4G
UrtJk3dNFCiBZmyydU1d8UBuaGLohWNCfZwBpISdDWT4ZlECrhtWn2lzyEkNkPFXV5X7aEuPfrgu
cz+gsARIUIRJFDIqi4IIkBtIxT6JkvwxKdRzUh0o4GA2HyAQuUHnDu4kMH765oyOrBBSl2dD5Zl1
DyAqs8nM2oCtiWA94RPj0Zx4SHVDCYSu8R/T+7lYofLCU2RaptMY/gWauWxlRMA9IBwtlFttCZXw
tVFYojy4fzXxtE0KpWir/vDqHrJZFcgxAz7/K3RawjiN5WsdwPIth1SZB2GoiDZrUDrSeJk8HL1u
Vtl7p2U0m2J4JIaKHJOK1bveArIv4rovxPcl+B2+oMTAhMX+aq1ARc4wVMYe7SfqkGrxwSr3vJ2b
6qJcmyWOQLFPfxkAJiqnMvUNI8WHf7erYETlTO9wFPQppawNAudrwJbc+yBG+kZJJGxWvnNBBgEa
UMm01dvskz3VwymMUmSgrPU1JLaqPqG9vzV1XwKWTFcJ9sp0/BQDrRJmgB1E8/jCMEctnKtoultR
YOgMLJSSmq+Hbo5p2nADY0uvKCKvLGHWoMeL9qfDsjMPl4PyMKKZMWd4SxMMfkNvVfzhjBGJDnNW
FlPPlc6R+jPNqNHbPKt5ypTOJkrNtTgNBAj8m9iFAaIdaZ9AJRLpPcoIHmhS+GRgU6omRrQ7p4EJ
ak+98J5M6bPiPrC6I/l7rPVMvS2kGdnO4Epbkdva/cSlCJcoo8OiHIVbGjfzwekUR/4MaOA+1SOr
MBYS0GyYam8dTvFx5ILBfIPiKggh72j96lbCo1OGmRhZoH2D9wtnM1nFyVGLQ17ZUrcH0u9oAXLo
uWN8n4OzR2KgcWw3YPHrxXYZTc3PWxQI6QmB3e7JIJfqw836nXvVqsYqUZegMdG5tgC/cRqUkPO1
YM63ECMXRB7y3Ja2JyAa8L3ckdF35cULiBfVJ5YOBFOBVPCHb9F1ksXgtRTdoSkKyHgSVnEGc0I5
aLJdJZ/r1SB3uGS7U/b1DuaO4HW7sp/aOP7UkLEUHbo6NrT+oiE/XD3YqeEdEva/1n5NC79dewHj
1BsIqVLdw7488QqtuLp120C62NuEXy63XXC26eroOVGyGPx6hmaagMK4VlxYNEZLIIxtdPG6jYSv
tUpdOgAjrtp5LLr0LFK7WdU7xEnRwYi9o0N1SGWwv+t+YMl8dGjvr24awRczUOKL9cxz7vyqLnhi
SKYG2VqXapgJ1Oglau7ueIU0nLHS5ByAV/tiGiihgmJdNWfTBpXBSfFG3DpCt9LlMYRLcYOxckLk
mb27ZvlA4JIX2brNrqFSaVKAmXYGk3uyBd6fpkprMkbuqmk/VwE04wNo6mEH0b6+HLJQWorBw8ml
XCniC8OTWxWoSHJ5dHnPUatbIRSj4hFaMUn9o05eM+igRg1DYKNyB1CRLuTDU9xdqEJiE1y29H2H
e0XjHA9ewgP9ofHwFw+tl6WZ0+gfhKiv7uITIIjl+YkUmrk25+0G5kFEnhq8a31zEeVFlvPxUu8A
+Gj2lkbS3hPtuVVGMG0/8dxRrLr5/f2dt0ov+JmxhOA0uzNV2a8ufhn2e4uKcrb+ZFAccazN9NhC
GBB12BNyHvTgg8J0d0J6kts7x+cF4KHIdaD7vN9cgKq2UUWxWTCoAfg2cvF5w2NHEGcwEQdHoUBF
VBNodF6ZdG3B+nELgLFlDR2ufztjByxQOvAkdH0KuWKrSEuMZle+Hg58/nw7vT4asrZg8U8Kewwe
Y0UcTVJXPMHM/yVs0XZZmTWi3LLdxjNKinCMIJJ6HrBTRgQ99FzAsy7X/jDq9Fhv9ZpOHv7mJv+v
EyGpjicS3iUDnXWjKqnWegIhcJ6A/IOvY0w8+yBXxDFY8jvJL8Xe2l27x8/nDShLZICq35iflSPT
Ff8vUppq6DYga4deeV3/tDwWXrWbwWkkMFZPUfNY0EzWClhVaiWqF6qSga8X5M1NfPmiw+IA06Kx
0Hb1i6haa/69tCkOizLpagE1KAouUbK19Txf2QOkAhAiPjbm0INzXehdaJBabaTQhSYUQiADc3B0
tsIcJofDqA7tso9rtjQtZ1nMZAoBy1ZmQnryZPDOyoZac4M3w+XYjUYK4crNiPKgE84kzmD+iC6m
iOT2Ko4rc7DBnmv0JXVBzktIy6nttKd5F6yIUJCvmWqw0/oCWpUBmOGjRCfHOy4Hbt8zTKUfEfwA
9192SL3X/CXSv/ptDxixrvd6MaM/TtB9RMX8KrO9hzDY2jG/m9F+jswu2JlkXItCbGGdY8HlnwME
ofPAC1CV1uTdXxVY+VTNlqklji7JixqcDp4TxsFvrE6uPM+xpmscZ4ctUfd6fkZwEIA5UenW8uHn
5hoIDPDnsii2THox/Kj1Fr7ZqT6RP6jppykp3PRxwCSOE0awqXl7HLECBKyiz+fUAYxurPg8r0GQ
sgQSB98BcyMW5OceaMhTDUdYtT9IkPwW7NFmQDN2lfx1w2dVOS882xKL8AXctlwNz90tTV4b3nSU
1SYKbgA+X2urwQ0jHk8wSql5PRp4l3wDcbTTzRqIbJy3cqMk2Cz2Guvq5w1KOKE42jpg8oU9YQOb
zKZ4z41OQjMAe34siH3gjS9HNUjrxd620Wcu/Q37/+CmRm4Xih/1TfSaz/RgdX5qyYnH9zCCqfxe
UmuxPnAcSU+1oxAmoCkNUsoKYrFd+5+myErBzKjcMrcwcFuVXQbNjcD6hkk81fWI+mh5x5NCDgB8
c1RJozLDZOXS3SvXpFreimPW+rLao+MzjL4v517yCo0SMFP+F8cdcS/wzMIkjABo9JPQUFNhTZlS
dE4nsyhv6qAt8JG4SONr3TPd3K2jF/8mwLp/SRX3ta7sUwg9eS8SKmHs5C2Wr+p80b4N+qRw6hzu
oGaY9nHXoqKrB5x5+s5KCULDyDV0eQjsMM2tXuZGLHcspDM0GHKCqCgiDkl1KL/q4j0Z/44vs7ZO
ErK7fNNTpAUaMKlBB6k1JnPSPinEo5osA3OTJ3d3OWqsuW0S/qV0U4O+Pez3dzIyv8TqQTx4SQjm
w2WJe0hbzBAHG3gvwNBdFxrul792asSy2myuNNjmW4D+NMqEXkw6VEqUO5Adx6rqGoYSjZITHc5G
2DKwQMMc/+Jh/tJSyQufYaRZf+V22Txc4NKdnEQPuSAlbcHt22PUw6LKw8mAufx0tw5jb/xGGuIW
aC/Mb5UtSEHZksiPtSq+CWrQjFKhxmLGYumspazf/Ox9K2SxBduhOmqSxABuwM3lYAV6SY9q7jnt
/3o/XhBTgRoa2zw7GhKkvemkwun+QolDGoD2bIXsKXjK5S70Hy41f7msqWCwJwHDn6Jcp3TbcLw5
Iu2CgWHRPTyEXOYeWAEmirt6hbZxXDWNU6q+4REIH/a6lT/lDmY3+CELgO9XCmVddIfrS5SaxHk6
M5WId+VVC4PnTLjzlcdaLe3kAdCC51Pc/lLju/E73tIfxJMDBiX+sl5WDk03PnAehG6YOoW+qCxe
GzWBCfzAjfDXvXyYpuAmtvrm0wBNYiOCLmUQIVN5srgKhH+PBTXgXvoToALO7QE7HdIYgl/wMwnf
BXbtIchYVOavAZAU9mfYmyj4jAuyF5QOQCqBjQiuD74xxsG0XrZgSAD6ToyrbyPMOi6pUosCPo9c
zaEoqfkVGUFrNHmx2TQ0yBfSLb5cIYWC9LKnz9XYjto1gxIxbDI8xZL7Ac2ygU/ydvi+HKn2Oa80
F8FSzMrTGccV1w2QBPPg1QwkobuSQ6osRO76cUqiZatUJY/OxC8E6UtVTrAeQZf7D6b7BVeLDflL
zRDIGr6mztis2EC5Sgl9gSTgd+M7tV+ytzLK6BjV72pNog10wwzI2+2t1I9ZMtp8gH79MMm/X2Jh
j3ttdTSKm8Wrle61YhD9CU+EtEdZ3+7lXy3mYfkOc4HkVvOyv5wjsvvme2KzejkPh+5mQjBz9K6R
mjzeft0NBiF/Jj78QlzDD20eAua3qfdajItt1M9AKw7taA9Eaxh4tlJV6s3t0Qt2eduaIEV/FdOQ
oizEY3AYw6Lqi90S6so15JHp7pl9/4HW/i0FMf0v/+48hj8DbpfaKacxadNwyYS9vopQJ7aqPF1F
Il4YfbZmwMZ3ADmwjRuxMlO7rmKaiopR9nG3SwnXdIs9R1hrDvoMkuQXOdNQ99qukHIXT37w+RvR
owTrio4to7Gnc1BBpQbINie0mmzmg3UcjU3lgX5+nqjidUDw+g5JQpT18I5EDYttlUfMv6BzrqlS
zrs2idj150Gs2EPUBpBFWvqo/ZZ2+uOCMTBXPj1lU+h5B+/kXz600mBpOQVbsVtIwqk/Mayf0pQC
W4dpo8hSdi0fhPW1g58c1/l6oc06MgMMPGGhFw/hIIjO9u7+UoGGzrmRV6RbO9Kwvom+rKwyGRSI
qetTnhr/TmntT2cKFYZCYA9QpKnB3j5Lc5RKRaCmp+QnLMnWJn5IxkJHnDSWVWbfYcMH+eW6Plqt
5+Ze4hG2N0OSPCz27D3VrBTi8BJ0C7Wk34BdCSPDYUyMB9/7ZjzS/M2a3NgJpa4KR8fOmAlURGNV
8zuLb4mWhjxOuQH7Aao5VreX7OFRQ+cBPu/AKT7teIbT9x20N+yi0jX4MRgI7ArX5Rt3WkzbZyGu
FuBAxXJYPwWr6QZ/kxN5P4QTcE+SW18Fms5DGoVKCXZD4OqiaJ8bVBLj890j/OSdQdsLTE7iTwiH
W4DN05NWAHgGNDc+soV/TTQAQKMmHFjZyPM6WOVIKQ+zLw147sB8tjHulsJOf3X9OuDWZ7trPJi1
szi6ZRQigYAwoK8OKy6FBlXc5TmtqSNxiA9b6mcBQa4o4WKhHg3xO8dnMGjQwe0fA8WZUb+3c/68
4nBLabOMeNIesQw7drfgi7MP7GrJfVV5IK3DmA3Futw1EXB2CBGnAJLOmSrNMsAXYPdRXsaUlftt
BHJLZF84AexDEaqrruBS4iDlz1fZ16DTEdIWeEJNYkvFtOncLxLyge/Yju9XkDAW+WAqDwGNf3OY
1rf1owmxrA4lk6/yBKgQ2mRnMYTD2MrXTyKy+xx+avuQqKFcqFhapbeIwkMHNDgKc+qVhq5sHCeg
t8oqDPCC9LoWDzehMNwdnKryQFMLPjDTx3u1K4HQZ/Q6AI0RMWnHFB5VOSesbrpWBzRbkWJK+A6m
NVpcUZ+oyasXqRdwNgk9r3FrzviodXyhIoyNMdseLUxgoO5Ed9wuHHptKUrI/pVTrha9r95dQb1q
p+/iokiWNZQk/o0ZaN1rPLhvgZo8xCY9JgGmeA46UBtMgds6Lnzv6kz2X0UoXVO/gCt2ZaXnj2BU
Qh0DlFD0bbTV4uoGSFVduCcm1nruUEY/zjyB/3Nyy1taCMo9eTDQWSMX9I1oCcwOtHfhtiHLUyiB
aoE1NckoOYUbPPPAGYB6/Ss7oFvuHX0wDmsi4VWZk7bOwX+ZzgpTLAI2X5qRWyhLJGKrtqUFr4dg
DBUXeB570eWTMm2bbRkYwog51YEgjHPcvpDoQ7cNcoxM0NM5k0Z9HRCzZYiC6XKf+V8CCqThykOV
E98bMPhg9haETxw4kRapk1H1vLxI3z/PSi0tYw6d0ppUGEGf5j+6wGIzXi8Gwlx+quXZQrlLJbOz
R8TmzmfE2nCckYCAtTs9xi98DltiwbTZS91DEWZDqwmnIcQCV2TAYLzYFGqXD4644PMEFbq1FhIq
uXygIVrwZsPW8y4f/2tUM0a5fEq+DtiY7zEAJFqUh92qrN+FDmx4njIZhEeA6jgpR5skIxNn6uy2
RYKj/rm7wfOJRReclcixzd3zmmzymLkErWAcT1W3wQe/htq6JjI2wMiPFBfIDmJirvuPfZOhOJhQ
71xDUzJ4Ye/6iTce34LyECickX9phscaxxMj1qJQpMOd76bFNbOXXkKUcVOHPyVBn4omyMYGIuMc
qoW8pdO9LnUvXgQ46kDOIuc7YHXMLXNyo5gDiMDnTl+eLBcJBzJ/Jog6L+ei+6ofPJ/qYLuTn0rL
xWmZW17LI3q4cOmihGkZpVZ+f21QCw+zg5e8IYQ6D94+xJNlbyHFvu4ZJ0zEj9H3Ga4IAiey/dzD
uKdNrWH2nY3C4YRgdhuwIYM3QvrmLORFbaqxVJOlqKu3Z9TQ1bOIyJu15nMnwI+sxha/MfWEBxo1
XUZ1GyuJPSiUSpNF3iukjI/u3VtVfpUjwTYWre4xEyrynyWxn0ZRXGD7te9AOMH2q0U6rL/t0hdF
h5nJFG9pnLaIV23Bki58sR8H+l2qqvbPl0xH5Fpc5ch4H98aBCL4WyNRfK2CzsdKZvjWGbtyvlK9
h0gabW0aaP64hFqSzDf8CkyytiENyPvRJtUp4O9HxcEHV7VzFgtFuL49m2nFaD2/YF80ayl3YTCe
lw6cv4VW0U/MMadkMjtPObgJcrO7L6QTLjyavZlfz00k5SZdeScwEjG8gUJZwWh/SFkZVAyoYIp0
yd6D2YVp6w9YlPcWtu2U4jEV/3nssi21ASdMrXmNTmAUWpP9AES37KNelSOG9y6mICuWUvlRr5zM
sHQc4p6S8CP8p8kk4gq1KfUIt4paA9haUrlQL2DJhR1bjWP+ywCxzDVzgB5w8p3SnJNIRkAzcgGr
v34iYi2U7K8x+khgVDPuYMx0Sw5zv0+fd8IRudwHHEe6EbLuLqadTFgZBOn2/zGwPWbComt8G0vD
fezis1MlKflAtfP8eZjEMQ0VvDe+o5LQLo7UzGE1q9RUNwqnSzkuRK/aH71UKHaHkN+dQy2Kyg/8
UcbxM4pLlfrFXULIOmesKtV3i86OHB3KBCA+EqdhhwoujfTLmzPxtiolkXsvxNtAHngz6wYwlHxo
IeKVHOjcKrNPBXRgatpW/CF4m0LK/WkXOMnBByl+PtZ/50gcfRPlfwIp9dOM7qtprwS+IQwCnbZk
+2vky5CjVW6KeTqvQjulR5EJunfGl0neE4BSRljqIdSxM6UyhdFDvt1gI8/NpAHlxoMsLuyA1Y9x
OGPbNn6hpBvI8639AJnH3xHqQqM+zVmDYRwV/PHJf8IEU5SB43d/t52a7xqxBOA5EAebAULSY2q5
pFbEZZnBJsm2MnejfbYAHmH377+ZuWge4N6rnPcQVaZm8gYnQ+E8ueEYrVcNWbymjhJc4r6pAXuw
m7C85AEuVid325MeoqXRyrC7SFoVZQTTt6SIared0kEHS2CQ7418Fpu67NAVf/pIh/wkDk+o+nQH
yqFu22nLM+/TgZOaPwCKM6Yp7siXxjIOfKIa0SFjKwTgqprhV+YktizoYHrRnyR/E6JF7w1yReEm
uPxsnsB4nrdm5Inhr+IxFkVuk+CpFkL0w7+4kdd5eYQ9F5u353Dpx7WiT3rFYtQiU2JztRb9FVZM
cy7FMyBUa+kWr/Fq1os04E1FnSoFScadh1p4R8B7kxVgz3f8JNIdzeYD92kkM9U6VVzO6P+lQ1OT
KwaXXvtp6Vxa1CeBuGisu4k3tBEQ9M9FxqRamIg/0b2m0mcNs+BBD57mErS15cdgoLA3NSDW11os
vqu8YkqpHvtJJWS28gIPeAbQKnyos5CpmqSqT3hFdPusKvMpBouvtFZ1q4gnGTRfSxPczUK+w7n7
OGDvviXglFUiInjiYCawv6qqxaa9wlDj4/ueYFSXPiS58KR4i+9BdQVR1rNOH0yjnt/TtJodVGuT
Nzv1VI6DrVaP9bY7P9TdziFIImvab+H9EEYF9k7L8OZ7Dp1ukNWZo6gAdcNrGBTzas4VTolMtjBQ
/FongXRrSQg6GAf7kh+BloRohXOWn3OxceTYlQzkp47lRRAnC4CRI6oSdYFmm0XzkbYMS8ryImHM
F+FvHP+IQ2hP8XWBgWMxvfvG6m3LtDEWEabqghlZAA9BsramfCd+0FMY9hgbLTBnaaNieN0qIjNC
V/ytbyTxwcNhXepsHIxmA1mwrwPAJhCoyjDJ+29JnbV+QXyXfCM7u8psRT5hQd/JUT8foNhl92JD
5M8AMe1sQrjPnn7LFYboHLMf+rSuC+zhpaCXv4WXjbOb31Fr58sfhQGPL5Pwv7c2Ys09sDwYmDYZ
y1KC38zso5bYEoUHP3UvGxbwkjLMrfQoDvDPYjpEOytCeaAUTJRAb/ryigCcxpHyQwGhYFli16GZ
7JETHbh2iU3Cw89MTIGrgal1SUjN3Nujl3yhrwxbn4+Ut3O+6v91V/4m6kOpr8A52LfVx5qD1u9Z
QcpQW8omCgoFnhpzcjPhz/uwMAGUa2nroWsD8JSsfppw2d00R03v2k/SSGEIKKCGmk76ip5f/tWD
yDcwI32maxVtEIHD5k0m6xtOBp6fUcGTbkKalWrjlxcX9jCw+6YMV44vwA7I/FpYrupd5sGLV3rO
4vM/KL/3ClxmfLvxeNap4DYRu7gjyFWedVSCvyKeXiiVLuEhH+c0ENvf+I/l42hDWcHJ30JII+jW
aqTulLe1GdJhAhKhJSYRTDRUQuZoHFKXtFQPOWgkb2aU17h7bAE3lf8DUfOq8qwlgorO9sv6EQLi
0DJHyxYlNpJFFFFmc9Z181esHG+tqKtSRb8ZUEgExRu8R6WVP7JIac10YxtxNdUUrV4SKfDD1UyG
ajW1qXwPUQ6SU5R+B3Fm69SA8z2lYCSgFDBFrmof4d6dnxJiBKuVt7P1x1Cz4ZRG03aiEolKZi24
5JbVSaL2RUtEHu14kTNQ2zPHqZRO/KuD0FsS+RF+oT+IRwPRuE4JXLZIettkzpRgtvjJC1NX9g0d
DbAQluUGEU9qeTslCQeU+cxQSP9sX1aBZ3fyf7YZiOOpkmi0JqBd2W7sJOHKx7+jUs648qsr8Tpe
1jeT13jLTKuU1gUtUeN8z4VwHQd+EPDepd3dBSFYwE4SPMgfG2UxOGexISZfCqVLyWKYw9OeQr5Q
53emSIsB0qOINTnz26S0PkM8z2QuDdmqH0Qoc1v4Z7XsX3JAV3AMr16/P4UvWic6b5M9TLE3Bea5
p4pi7HcmK0ak6WN3PpRwNYdn7DUKBXQzMusfvKiJ8e8zXWrQ1EWtVFA4EmGMbzt+5YpDiWbn6c7p
vfJez1+pkKqRg1aAuYriV7f7Sd5YApLVi9j1ff8ah6hVIvgsvNARbPWheYD+UUI5nF1EGfB55iwN
LxGeLGAIU1q/RN2fuGxOjYAO4YRSQF8ZpuZGEK70iromDM/bZw99nRxywGSVKyDqgS63AgYU+hJN
M0EhMPUPcCZxpCZg9bBOCrNuBWYG0jULA8gPHDD+J6rZhahG/2WaOsiiUAgQIyvRS0kut8eW1z0e
aDjbqbw3S3c/Mobfgk4GBWFvPNnmuvK0nUys6h+8mmRJ82fOI5r3CjYtLPo8l1xNujdtQF9E7BcG
iM/pA85D4GL1+g5V+RBP9uhnWSjG6Z7OK9pihWvgK0/bgUWHdtQuxznozxBO8HGKx9CqJ4LoZQ9y
vImauzYPN1vJj9Fhrhu8h4vVmFX58J9YNW+q6duNabYRsWl0W78HmF656WCiAGZdQzLgaavx/aKB
x/X5UUSnjJo5bz686FGvhxv3p3+QHkVb/ziw+gaTjAxOs1tYvDd8Fw/TqBuRA41fszDxvCgPpayi
yrZkquuP/RoDDbQVMhUU5K7P4Zj8EkvHzs6xGIuXJMSgVNAzM0poFQIpqpuJaeY3eKBDe9C/7gYx
S9d3oHkOaElBAtqK6hpd8mtpldmyJ5hy4XcxHCrj9IJFBVRv/5z3WwB4tyD9R3NwE+RWv0TLfwod
5sBYKkIr/Gab8mHLi5woJ6M6QZmr9g7swsdxOVemQZsbpXNxbv2BQ5IK24Bz+s34FiIDazFQmgdv
SyqfnYK8utUb/8yo9iMGGM0gOitJLnyJiTKjcXN+0FS0uIFXkFzl/cpz7yYM4YJQJ4wsLI7LOIA+
gQZSJootCZK/ABMkETvu9uNTTfuGBsegoCgTbqtbczfFaJ+vRHNNwl97qKQ8p5el9jYM7N0K46ys
7SxTT2Z0HTwdYtxLf2i1oGoSJ4QB3/54yL/+mrWmxRL/cn4O96NIzbrimZ9EShNm26bVrWKZofiP
mDhnbPNH2XkchRVhKyGN6e5vvBeRiilP2i3krMzRu9o5LyA5gRORdkA1N2OqyZ2cI26CYz2yuSpk
sTiI/IrJ+ag8pI/DrWIenQdF/z5s/UJm8s9Qcs0lM5JsvRZA1gUuIJfi72jMWD9HIdEtxpngNwPv
9GOlZErvdrXeD6sNbefmS/d4L9FDITu4g95Ht8UkMEaDhpR9FAtYnUYD/vhcePvwcZ0A8iPsBLgQ
5H3RUsm8cw11dD2V2KzFN9UpdE6wAjW/MEAuvL9+T4IYJrwRV4CRqqP6lLhuNa0a84pTQ0aZUssx
jeUF/TCbaZO2rev4PyQtD3sMUMGbalYEFQfOoI0ZeKQy5fFVzPH+9bRmHjTl7x+MZ/ho7VeDZhZ4
O2zohHcurj+MPq6/ZFCFp6ULaZaS5uUDtbILnJpNpe7/uNuX+asVfHAZ813wgWVyw+vdizzQHFfy
KCrvjok3xA/QtsWkLe0s8hqkzVGBr49IyfzNZKC68Fs7d4MyO26hqjK9UTsXEdxY7RkZpYILMQJb
zBddt9kcdrQpRuLTTofXsZ65oByLw6W4b70EBnWUC4qbfs4QSB30NN3yS+WRgfl8Vc5x7duM6Hr1
c1IlNMczbstcq9SPNeM57ZpSElsq7DbrelkVMWez/MGTnz4WUdqqmrsz44CDgwsuGGsU+q2Td0Ac
7S5h9/H7wZUqoXEpcG55TWByjhv/2J9YYe0Q7anAP8T+WXYYYS5nwu1bhDH3KKWjFGJjnN0fcPPf
XZrBlFSinyj6XnqRNlPd/a27ymkyo+JCqFtxKNhxqN8ZFQVDcd9ygbh/WgTRNqCnlMNHzHBPVsZw
Fl0NbHudXY3vmC9VtxfbYnO+CDV88nkqAKAPoaz1dSrIoKfeKr5794LHKq95wTZJv+Ns4nR9wZQE
zfHgavrk4OywTgT257N0z4jhbDsuIMNUIiMUijB/JJoK6FqwqWbLFMRuo8VoXzSzd1MAIzmCb7ap
cvLq2V6JBCGVTIZ9iK3zQWcfbLW8Cm1c2WEmdwMBty/sS6os2O2W2mEjYUXeYQJQL9p6lem1HEKW
U5y1VL5EhkD6DZfI3z3jP8cJoi15Fzpv3adD8JJAW54WG9PDmwoyJk7Cildasx92aggwuqmOiq3k
ks0AdfiHL9+pIU/DL3C3UFJXiH/Ql/3UFPRpSha4dQrsfAFck+u3++Wnrhui5awEXLY1ZFR9c8Jr
8DyRBUBJoK6C1ozxIWzBi90nyDKpeos9WY9+SSzUOfIHmw8KZXqiJZPbtDl8HmG+1WOwgI0otQUy
0wSP/JW5h1sK1a00EC5hLyCmlAVH9OFsK+5Rhurc0dnoMxo79Sp5dy6zD2u3fHjt5VcJNgz+VWQC
cYZPtqNqVTKERBlVI+xfgAkA2NyW4a42mVzofnVhB6/Psl+gi5ZmPvLPET0jO54RD3OXUYizB7R3
vdBV7Y0g4gDWh0imSXwLQjmAhLbSL870Qxiy4e0ZS+xv8lrsvhWycu+7Hty5cvggZpysvQTbo/Sf
E5Mx0dutt60wGs+2F572rhsdkVbkSOUVXmHlnoitVsQI07cjBASe5+cn+CSCs8A4RywlWO3BTFWK
iplKmhtaIsvBEgvyYGlYfes498jVqFy82m6fK9YF5JC/8Ly2gudAB72PStEH7tmhf23yqt6erDNi
YS3nrHqbbT9+koumKlWm6AwUvnvWib/2mlYTBjm9j0COrU5b1BEoydV0ttwQ9omnxA7I5bkOVS2Y
C3ZnPLYbKcn/HbDYP5PfIl1P4m8Cy2KwJevjkEcsu19vvTe3Kg4vUTuURFMGwYhl7YRNSrUhL7Ss
pakGrmfNFUbgKq8jsc22JpIiNMcHZWWNLGyw8Bt1y16mbLe+g3ZBee4/kkqulpltOiqHsPlx2KGu
4Act/O1+3Ag9iDNugoCKbL6NCB2+jEr0yVbloyyoQMyR9gGA2sI4Z+DX3WmxnkB3+zYtyMQz1O/F
bYlScQ+d4Ol/LhYVwmupFkc3JWV80CISc7eprRpsSz9RfVb7bLeABa3Rrp/ZTArdJ5BsobizWM4J
+78WeNMd1/+c2qTzi58Cr6bq2dMfiZX+FhVa6JnHDOU5NekVdUHf5b0gd8tDTnKBlG7yKlPc1dxK
04D8wwakf4N88p7gvj4N507CKHFiAJTux17M7RRHIhtQTSZDXMQH3RBjxtu05Zm6luQke1V3M1Vh
pbqmjT0Ix05egWbjquCs/lPZ1cYB7Menir/jnEwUhVmOe/Ap0kuOPPHfbHq81z0ZQ7AFzMSGAqrc
B9lQZLG4Racgk61AzJZeBMJzv1LLVM89B215r7Hwgyx2rPc8Yj4NxS6p1pICXM+Fs3W7/O39hkqz
DBOxIS2Z0AJQtKzF8DHdxe5ysFi5OATMmIIix9iduYgD5ZEwmlZDxavRadb6gNNnzdVa6aK8QC4M
A9Z4WUCroDt8tMXGhcFKNXx2AnUOKp4NvmhdQ2+ivW4FPWkX8rGOq7wYKFUstd4tpvqL4kwAVGuz
qlGWrXgbzoq/DMRtJnuNEb7TzUjBZ3tYm92ny7BTaCQZg4TEW7S/PJXSYiVhs2ZUff2nGA9i7guX
wYi2jzeTLawI52NCwyV252V7STA5N7rp0llKpORjvMhTKgEZGMK51m60qL27k3C/KGvEQSaQ2loB
ONkrmwGMOKne0D4u1JWuxCAWqJUnD/ivbhrrK15BZqERQoFYvcne2j+Su6lktL7Mt/SGVvJaJJfX
HV/Xf6YmX7QY8942XmGkNR1CFOs5QeDRk9B0pG0YNyqWnrxtOWn55JkyRqcddOdYtxKJSWoQGh1T
+GoW+P1ouvH6FF76hF7JGfZxXWwOeS3a0OVFBLtTssdOxJeLpwVjWY/sKaFawPyaCS77Id9TIe+y
0PasjYOy4wKRZixzsnzmt/iDtdxdfrDbR4nuoc2Z/775+Gkdk3e45bTAmHzJ24N6SZ+Cp4EJo2z9
xOYfCafVEdwm8exOgzBIPJOXnIF43oEzwHP1WMO7qAMDIY5urk8RYOXQLEgOkm2s1cSTimfIIOjv
pk6z5/Ber00SUMeAGwk8G8cm3XXRI6+XLJzR/tp3iOx6d0rKzH/PuoinYY6jQu58x3zrgo6P/b15
uwLC3pBXODqFzlrRdncX//H9UmIxmKT9mmd2ijr+jJ+AXScqVMl3BNuKDkE7REK9lEvwObLdadpN
DH4qDCV5HHdvoI7+pvVLHdzmLrhJ3SqqRRoYnY+hG1SXr94GDHvuytd+vrtSQ8wT91CZU9UL/Rpq
KUBA986cWlrRLmFefKeOwmdK6Skpi65/gFgJoV7kn5zV8tsxlcCgOd64SIJ2zG/5jCd0ZpPFfBAX
jZm7zBY9eG/zKifSMZdARhoxNGQFewYW6Wd+m0wutOt7sZMOl19yv6cAeBaDhnyb/MuA+jY41cBX
Cjd4b06vpY36PyL+BuLxvcFMOHQFUiXT3pzIScAImtwdkrU/50/6ydx/6ov5aAgBQtC+6hYOQ3EM
rHPQqvES5zW9DaSR8SH5BOp8qvq058tx5mBVK0E2UIdV/bwdroZxkhPLy8CL3mqRYlKUSUPfyeI6
tVn6Am+zs2cxf0w5X4On5c7010XMaSkC/1Xjc8ISbnIQ5M9KAKvZFXvCmEjbeYHP71eBqTtsgkn+
/HznODTNLBt7x0W6PEveOJHUldlIHlquwnQhqne9rwnInnV96zShuNxes5sOENUyULSvKgSGwm4g
cxeInCUJiuDl6XJz8GVoqFO7E0+CEl0/CUUqWfQw9r6XZ6cdoW84dJKhjd8IkScgZRXykxP6ucj1
l2jdlNZRvOzvy/uQJzJP7vsA4Kaj8nNUfodboeMq7HrIA2r13LEv647aeTu7NTy/xJX/BLWz7ZN+
O5iZnbya4Zd+BXA400ma7OdUvHlvIG4nwzKReGBQlHD8FxMndS8v52NkosA0E5SEwbCcTGCl2kx3
SMwy4Ei/vJg8pqHWSUrYnNtM5CB4uA4esIM2EGGBPifDAq+EpRIDjNrGOQmjx9UrilMTqWNf4YZV
PBscmRHjIWXLOSN4zyeXlbdJieIt1LkjpBvhmy79eOQxb3kbGVe0hgcKYlP6gijBXzGBo/hywXSH
Z0kSdnCKlvKd4uiZiy1gxmD00s35/m5ThCo4TwC+K4+sCAmun5VMevLwGPJaVTQKBu0D3UM5FD+K
xUaIXIdyqe7q7XbfM/Lonrg2Xo0LkNY9erHzfAGIV0jlkbf4CSTqVRsCbhjPtzTinkUj55M0DlS5
DXTG9MZnFMmBPq8CBWp5q2wI4NcYtt2D7ipmI7fZ88Oslb8emeT1ms/xg0d9xX57xZZ+XmZvBuFu
iuxg3zEvO4/TQcqBMVfZdEMvki93HrUQsMcVeFxqFZPWp0aNuKFTR3fyUxe+3xmdhw2NH+rrVuF4
34hLHOa3qqB5mdRQKCGM4+Qjohjn5alONQbQsdL84wSxk+6VcGlKu5LWM0RXOGHBR3pC+MPiE2RX
yBkENI/jeQ3GlPyX6WSmrKW0jb3hMNY0rw109kCIIMGaIh47U0kK0VoQuSd7JkPUnLv5A/f85ijE
g75m/QyUmr9y99UXqEgEwYAhED8kSjGyxJ3lqmZSp76hheaK9ALDUsuLt6QhX8wUgpQVjJNQyjok
s0+FBuNEwNj8wzIWrJpgdC9rx0noLbtyVG0Tm5b+PIKqMT3X641KNwTlku6h2udckULF7wNkylLv
ksiNhFpHPzzJ0a7PomHa3eURwYyMRAoDIDUNv6dZ/VDvTp/HRHOhH1N3CUu7oeiXb+Y/FVjqzzP2
XEJVXSVMZ2kO46BJBYNMY/TXC05DVoVzSK9n4NBhF5nvnPXpRc/deoV8J4Vjg8DmY7dA3apc3cQb
KQB4HuqzKAHfU8FM0fHgq5+uMyodgE0YACd30bck4bKxmYU6mkDZIZ/RKSkGYEEz3i5wGNGqToQz
4kxkPNwygujSxUo2QwciyKX9B6ZqRziU/uW4aaitvJb9lbnfxF8tyL36yhm2Q9jYBJ2qncfFH+CH
KcHM/vWiw7sN6JrhLdeUiL3nsIoFPnG5DlfGBYhqpjWaTWo5bEasf7XIIpEp4HXKpz0sGV+jE6G2
zkoL70iKq2QSwGX/MD0X6Jca/5v9G5/4ncgCZbAvgJOlJzvYjEUP3p4n3WEEGUTJC3F5Iv0szwFA
/EGeK8rBxiHqsw2E/NWlSOj+7uYyfKyLPsdkduvrh9O2n/U93ThxMJ4lHMtNNhqyHW9ysezhatEi
DXqWLqANL181XQKd3j+mnnls3lvSuMvdDL2p/+6vD2CQptfXnRSDUbe1EEBDZ8fW7EAnEmmqqpIq
fX4r/00vPUdId1seeB2NwXuu8UJKpr9AY9N2dcGrmpNDpCPBWQlPhwAIQiwiKN8ujKxqcO5w56Jw
2CuevR3ZO6NeEjeoMt9qOhFpL2lBlVabdKFO+F3RcmpOP+JgJWQ907rBAHACB0ydWFBqzQwEmJz0
FKHCs3Ul6pTNB4i7SXHrr8TuUDXLzhinPdcvVzwYOISaDxChb12d+KgWJHtox0qrTseU9LTXP3iB
iWuOObNk+7+UWlw9XZoB+Nk2KMgN5unbDoEQ+R0zZwq4IGT1uj4KZ6A/R8iEY+3gX5Xk0q1Klez2
tNg4hFN7gU3xhf6rDv1F8B/EnWn9g/6hw6i49ZYjNpq6fFvwStQ9r0AkOKvBx1lIYK9eGj7AEEQp
HaFY5nQirShDUx1juHgvlggNYiMQy87KkO/rSDk5qkut88D27alnYW0kfWDMz72AjSO3WtWbczGv
xnXwOaKMXYadUHaAeaD95gKHqGy7yZ8MIVe/IaEYtXy0uVKZwAN7WMMaPInMk0/BmkCGmQzP9Ggc
WrlYIFL7q/po8VFHopAM9A5U35sxxWSiPVcM6EbjXcoWdH909QqbxNgpYCMay1VvXEYy584PFEvc
gkQBvg2BU8+j5Ig50pLFZVx9wg94kKPT1ntOjI7GYpcWay2QijQSBjKx8DSlWco5kfprJz3n0TRZ
TlIdRRRFPNzWb2Yv5+FlEjP3H8IB1h7fpWVGommAlmgOdPXI8V4XTBY3hTG0HnP7kku0mALVv/Co
9HJu5GheJkt3znSxLDngFSh0e1JOz9IlhO2JnKXfGzfZKZnPxRZgMzMQOVJmz9I6LluGxmydqko7
hbkCEil4tdfaiHR7liBNpptloQhY0BXzEHT1PljYaV0Py0ITxG2To1633QinLENTrB6h3DbczKHr
hj6ZK08H7H0Pswr7rVIzkfONok4zJ+ViKjKhFDjq1/0YU1I86kwVztNPsN7+oOpdHGX+2g5Bg1tt
l1s2dvRE0oWvfK59rJjO1LUKKEDl7U10pOmcHqRRZyj9iATA2CVOmLTV6Hn9mZfCJkwuwXtbMeXX
we1AJZs8VP9jsVZ1s5EmtLoldAPB3Ah7PfWpWv9NLUVD7ZSNHEldlJ3yUTpw3L50gn7JXNCL7vTp
qQWMrsVQjPACw8ytP+CjMP+bZ971Ftmiw7Og2g8yDwWAGLWG0Mt+CZIRYVRl5NRFDuGHkg0elXmB
CBsV7afkcXYYsEfHNQmmUhERHt+dCi9N+zArjJvy7L8gTrzSlr8wZr7QFdG3i40ZROgBy6AbKdx7
OyOy6Lxx56MbliBqHf0NaMJ2qDo/FozEEXVREYyU4p3JG/tXfhEHCElMzQDJe0Vfn6o9Ym6yOyZV
Nz/5GjGDiRjhF8LTIHdNu5VXwvc7jljvntzi+SJzYEUmy/RVFFwmsAmEdC7JQ0hbkJfz1jkWxfQg
oU/tzJSfQhYTfxYwlOsCENL61hSruDCApGqzQTCn1MFlmhHIFcV/7Ya7UPbsxgX3ll+uZYV+PzBC
FKH+W5eQK5TWUoE0ROEiLqSr68qCtPTwqQmraIVJyudeB3XFZcBngAzfYw766wo5lrGFJkXcLhBU
RE0ih013SZXLSMcgs2TliNE0KCZGWTC/7xT2sEAXynSxfySDdpoWwyzzmbCFlqMQ0cKPXsUZgIs6
TU1E4pokGry56RsME9WTiaJNjI2tshm4WvWdxQhGbeViEgA6gku+yDpyjbqFth2keWq+O56Z2vQV
cUSY1x47S67cUlrQAtwIP5hHFiRfWnrLctgSdID1E5aG1xypju2dZDasNYTITWUehv5SMq19YOLL
XiJnpbNi+kprscMdpPAQzykPT5Vmd6eDOh6VoR4UxIZRHrSlEcpHvit6qlIylwVhh1Y4Q1mFm2BM
GGLwRf7B+RD8TmGnGeJ9OUkmzSNPlv8aQP1Uo3VofjPKbiCJUvKwlLogkWwEml7WSxMULWJs7tXp
modL61RBry/qGSuw4JvSQK41ui7MvlcKg9MBJFkMw3CMbDS0emwEJK445nI+ILJURu9IJCdU1meD
rFnqMFP7arinQY8ImVR5JUNiXdPCUGJWAmMDhIizAVMb120RigsUVvGPNiz9aWPrQ8egpvgupzCa
tw7EDC9RbLw2UyrIfFwP8zbxYWMnRafScxtY8Puf3ZEqj1cKf2Mkf4KmJqGsYiAiN3bXdnESm0A5
YAa1OxTO4ua6BSkthpNKeAlwsGoU1l4Iu9miC3kqOqwcarI6tPTF1N7kVSBk8vM+Wum931eHOlVX
Ry08ZDdGwkBLOFJ+klFjOc6/0B7MPpx/dUDkXj5A+TsqQzjCkHzMLHpTEt6sB5zCNp2ZF3ViaFv/
z12ME1XcdQn4NzYiElDvitXwGallTESq1h1onQy26OtI0bXvGYx0B8BKD9zCjMKxuo/0WwSJyPWf
zU2djO5Bd5M6MYtTHkKqefzdBuy3zLyL1K/QYfIrKOGdy34wEOXJN/flCqAxO8ymd1g++bIax6ey
nucT/pELiR5mHVKxC8seY9wLpbo72RHlllQiXjDqWAaG8OeMXTVMrJQRBuFlSVppRzvgm3+Ftt9Q
n/KOT5oynxILBtQprV4bYVxcduK3dLamlJiExkh6/bzDkMN90wX5s9nXGN+rhxbGfin9DTQhgN+l
HTV92DcWCiG5RE3DZlLGokpmv0EK31dx9pE8r7pJZk0irnw1hW3jQCjMoSV4sMQ9wlb03CKj0/bB
+v0i6/vaDq/gdZYjRCixb/OEkK57TU7BqNzJQkGw0yEabwZ2DiYttWZz+i7r56m6G8nCvT8JnOW9
46bC/iHgXXYj9uXpYJGGf4yTbvzzyAHN2sTgBapRYMpCjU+8P96Fj2xxWHIIvOVsXLEIG+VRVW8B
5drmA0Dyg0YqMDZbERK/hUZ1zK7n0bfH/+AfAd15PXqxJPRrudaazNuW7xGeZBSWgO9zAZJBCAY5
Kt3wKbbJy3HdgtyNQ55kwzCgUjIndhzyOQvTusG/3yfdXwr1nKaKTS2R9wA1uF3nSzCWWHX0uJpq
MswafyyW/idZ0/ahjW/9Syq0zOS1HOglH0m3BdZACdI2CwcuxGR3z5tqrRkEvAmwhG7jopRRyRlJ
a/YF4wbPyyWgmcHQBL871MHaMcumDGMRmZDAvxtNS9UG/Dew+8hRt+KpDBkiSHR9adOJS2/VOFMv
sqTLVW23o9qP/ofa9S1e253gjWIgBpntRDlJ+OlqNNBE/KRRN0CEU/+6tNcZSiauMAVYI9wpCVlp
2zOeDgxe6V/gIhKShKk+qiUVdV6N1NUPB+1PSKjBNf5yXtw4ENyuFlwg5TB+l05wP4uHy4c/pO+i
Zgnu3OHFcyZ8h3g+Qs5wgC7bzQhLHFzEt36VR8iRJ+/TbFAAuJRfYOu1+SGh9iwfjWR1SIXA+vI3
TtH16+KW/YpUX6Cgg/77wH375Bxc9ympJzXPPIAK2NEO3k5xEDIMTHdwcOLGH1IsUjQ1ZG+H7qCD
AglYPxxQKiRopC/DgfJjDpRAg+NwpqfsZcW/xTZUo8TQGe05BRJzSMzJ6rHBOzu7LPIvZN8QXXCo
sciPaVF/+0kMaPZdx04QJJ0O82A9HloVCHX+Y8LzytbwLQlI6w3bzLUR7lmFBIZ/S3p57eSL+7HB
3HE8k/qi5FbkBRkLAfS+5/R2N/khyempPb2X6Uf9fL3GgjTSkd8pWhU98zUW1tcxzMZo6DrVe/c7
nMbyyUoq+PMykrdP2Cyt0Za7lwobwjcOg01FTGxeHO92yzdgdsYz4Siu53bC5F9SUnVCmUqhxHIX
wMBvxrd4c3bkg89+nALNJ7P6Tvsc4cFOulp1Sd9xCQ5PZDcdZ+8LEehBGAw0mL8avCKzFjp136Ul
6m/apcH+LmttBKkaAvu8GwMsFYhpcM+RF46HR2WXs1LO2ykzy7BsM5ScIPwxtO2WvCh3rtTaMoFK
/Gq9de/XuBzjzR3Ce5P0kajknza4Ioo9Yan2+SgFhv8pUhiwOUXgda1vI26WdmUma6qu1p+hzFzr
lxcZGB5lNdqvZ7xesYqE+PreSxfBseG4JNjT6NiTUsROFL4A7q5mbE5mhb1SpOB9yx4Dvt2mmNY3
JgasKkOi1PphhMqrXDg8qEZXYzi0Os6ii4VPVOaeEarKFDc2+MggXJwGfXNbtAnWEGb2c/TM1saD
KLOg3EZtCwA5J/8tSKY0t3dhUPoXA86Ebw5TvHqIA8CsmACNKW4hWpOj2l7XSP9rEyxU83HrraOt
ima0Z81sC1Sza+Dsd/2eGGeyR+FAVag3khSRJ/gy6J5L4Nc4N+8Bl9GJ4syKNseiIVnICq8DXZop
SCJSM9pp1jkfgMhf9/4aVaozc5sGr4s4u2L1uDpz7GVAfglSvXxDGuSNV04uJxz2RM61Ty3HFuJR
EETGrof7qbfvVuSWH2to1EXFRG0g4epxoA1iI9UAEa+qZyGMPkKgM61FsEKgoMOX6uN0+PCUrjcR
oM+4b6KWssydS4bH3dwLN25H0Owtt5dCRD+jgXbc5QqPzWCBpqjtOkOLVAafZwDAfi6JH41lmLFK
i3M9cHrfU2XQ6qcstFolzSr9fo4hDuaoy0XasUV2SfBWoZQbi7fK/Wp1GOJ3qPwIQeN24pA9RIIi
zPveGO/NUVec3IyzVx/5WJBgX8cw+8rg9xvD6A3pT64C5ksyRFuuiE1WTorDNFqf4Fh23D+nbEi1
RRqUJJT7itp3YpEPs+7WSQAVk4WQHtKFNPATS1yJFL3vKNB1rK5lXtENa/bKwuVeUJPwUvNs5iHq
2Ad/1QbsrIvHKP13EPxtIJS9Vs2uAOojBmJbu8JRNqUnCCGLuhWNgc/+Ojdac2srlnNXr3IxRFJA
M5N7EzMrhgMib9h6FDnHuEjat2xnr1Z8K6VFNT+BelDDBoeDSCWD+d+tlFcKBOrsnLqJjFGlXfed
fidQ0me2i1Sat6Ow8PxcQMr76TlNMwyhq+soR1KRRborUo3XDoAUkKwSaRrkPEFZ3/SS/cypSICu
I2X+QI4kVM40CYCj5DFVxXoDS+lCMy8PacyZ1pTlL5WzlMZmloLavXCGvnkqwfjvrCwu9l3bGG73
ATEpc+BlNsiYLzHLuCyy2zYDJoBb0ZLQTLCGFSO357sLb5r8hp8VcTlIzgLXmRr0LlMNbFFvkR4z
uNiZG6t8WBO0AIkpHYERz/2EPiS1E2Lufz93SGig8kHwoSFQtx+Rd3UL2QLwjhKQLIP0SgUTbrF+
Rfhouq5iGnS7Ec2PU8nn4u5hN0ahrTj3j9DSwNWX6AwN0Fm/qiVEWGQmAcPuMqmcu6SCV1GRRR+D
BRLqUPNYC2NjKX62dnF0btKlY9oQYg6U4kv+i3wWvHrP3l6hbpe8gc0uFmlVgsETCo7vA5qblcJp
Se177wzxVdOdLaJuixamLU3nPuqjdp2M/WE5JjAMkxnf+fbNY3Jh5JYi8R/HD91Kqg4NzQQwFAGt
LCrClC+iAqWYb+i/nRUU3o6JKyH4EolTOxT/cVomJL5bEYbe/DBlICblwIpbcFoPvWR5tTM82ePI
TLg7EZW56RXNRshrz4xO6euPpjU6sgM4JEMBjMKzZp6MgWZbGU+b/ClvbRDSDvGXP4iGm2VwgAuD
0LGqbphzpajboasw8Y4bLilamDPecw1lswnkzm59fWTSZftuyKjmFXfewNGn6uFhO8bG1pLXBZ4u
7D8wQCC/wu/N5Pm+Lp8IbDajplulqWLtwVlH86lE/RpDeazLzjxq51eJm4BR7DYGvVBovpIGdIcg
oxyKPqzOZw8JLCqiuddyEXVanu0CpCBes2R5LgfRsFgYE+TidT0kLIeONDWBGOkd8R/3R1V6Exv5
toqW10IVTpa/onAZIeO8SfHyd+A7ZSA+1GXgvoEjdMb8BVWvv1CKacSSkEylwlh82+IF1H6YPoa9
d7P6qDMHzMvW4yssUpV3/hpPnsg1rL5xSYmy5RFhsiFZd+36u3vereVlVjyhpYlx+MsrKiiB2Vfl
7UQLW+j+hsC1MpGZDHjbGU0dt7FrN3Rw8IcACLg6M3j7mkBPqp4mIx8NTdz92w/JWpumE8kqRwNW
HVEHMOVeKyPVut+Sq4+KqherklPX9BVy39zvyiMoH4b6SKmMlgqSppap7MMoHh/0a+VhfAsBA6Ye
fH3lle21Gf704TI2ZHmDwnzwES0R8E3c26fIlTK3zFhSUdYcjKq9C5tyg9omA38orPbmhSfdzh2o
TjrzGfinm23tMGJXKvgoNq62U1KrvZm8TAhCfmo8VCGOlvCYCpLAia8ahqeXwaKtENeJk7099D9d
p9s1vXM4iMwk20eaogpbtXzmcnaelRuCzCBGoILp7Cgt3IIsfrklv1t7Z6a1Oevh1Qe6avtcMdBB
oohNKohhORDGttZtvc1eSrGKUxbJMxJHTfsM1m0VbKtv5ZGAPzm6xHYDVY1ZuBEnwUHr2ltwJoog
qHg/pA/Z6o8JQHW4QFZPe6NWPunKHjXAx382R64X2OyMHi8Ld2OOzo+UQt2KE69u2jWvtGK9P0kO
MfdythMKyIJ+YWnDXgbLCIyPxZbxfvi9fs8iAlksdWYpZ1jKIXru5nJgDpIX71bEqtl3qYRu68Wh
hskxebINoXR6JCQITlTgl33ZOvlnpqqhe4qp3vQM7ok3wTjYwn3+g2/tzsOyZ4gFkR41wPXAw/jf
vSlp/lFxnbxjgE95QdnugZ8648XwSieizwbkpx1ejJDleoxEuJSF9FLAv4z633OXFNYoogqKuHnf
p3XyYn8uQ4WhsVSyjD3T5Z606AfeAX18nIsOIK6Re6VzgtE/IPrHvtt/N8j/KxbjL2tkcjBok1oo
dwmNfxFT/3T4xRrQZhXMOgaPZn1uAddHyeQOwJ6y68rwvDzCzs9UOJMtq8MQ1tAevVOy04rf/syB
P1nTEh68NqRaOS02ForcEVaHQnsWn8QSqZ8Kj5OzZ2yF6NOO8ZQkSx0/qgsKV6FyU4HpXASr/ak0
Ncd61WtcBKsxC9c96i0r1hOPIIOUyGWL4MSwQRb2d4JwbrJ43KVOGnoqSvzoAjZx/R6RYY+W/G7J
lrsApMI/p4euHJmUB2Tcqo3g64E5nouOh1DlB8la3JRZzhEzbuTnEd1CDbxce4lz+Mn/+8UxA/LW
4NswKhuip99GUF6EELMDyPNsIAElvrRnTUH/AuIgBnrPJabl4M+7Q67DDVUMiQAAUuqamm019LD1
rZ2TtwToEIXghSMKEempwGBBKtEc6IJpn2qPybONGmQtLcvAipE3sLtDw3czJ1BAbwRr31kNnHYl
Ga0WVzQjh4B3AqETVmhIMEHCm5lRexWLJiM5XhbdpwQX9Q1VGFclY2lchpq8wHF5P84zvNuM5MOe
2TYvseXbn39XR7+rmOw/7C4EJaQZ/TzdQgM20RcoVCtwYnaHjcwY5BTwu9K/TI/1ZPvBMg7AaWGN
/qjHzspm27StVdHhFJFnj66ZWQTEyWkYBHQDoZfD3taLElvMg2RI1/V3Uz87udKg5H0NSynDOR8L
w+maCKixxw8WTdXjY0Qcrz9UO9YRE7Ef/gX1Ob/65G/csUxuJ0yWlHcmRlfof4E8o2Ez3ricUc33
dqPr8mLZqt0Ww4FnMYSH9huij8ZM0uj9hLUglF4SIYISjdyRHcqh05mtz0rY+pZogg05+xLPJsiy
pMnbMIIHrpOXI8zabKwq5z9zQR4GzPtsJ+xl2X29vXlfUmUiwOeK03whlUz+EnowTjK7qIUnzCwk
FALRra2lquUCE5CtDb9LH1TWr9Ggb+Tax8juSq4qoP2wCrNA+hc4VdfBJCWtdddgyDZtQmfXcFvC
dJZkbsDkaPqqmq+0UpKvNM1jLSD6me6lP54X6VNxTCd2260ZdO/SyGken3Q0AnUEtVau1PYOtrbO
t4SQG7fL/krIs1762Pt/zbTxR0NQx+f5v7Gmb79Bm+eoR6DxJR0djpuEs94CvYyHvKz9eOqfLe/S
qyOQg7gKmEnUHlFyV+25+O8rNyKu1doNSehP0bTOlXRbnymqImXeQDN8NqBgbRX6K1wN3IX+Wv97
KmwedpaYP095RGqfKFO905mvzc5qNIAko6YWwLed4XX8M2wV/W1i0mVv15OPvJUKM3fgBW8MLg27
ubnpbiI2J3Uo35Q67MsDekDcr0QprWmEZ5tg2HqCHgwhypNHp6MYxtroRWfZphDWMA+zTv0MEo5B
l+A5uPACIpFm+dQy7r17lK/Oc1irYsDGolc57B/L77oCU4XJ1EbOEtSy9FhW39IAlgkiWXA5TBDT
erM/n2UJOAHRObkrjj6UsYGYUeb2fzazpsWEux++yE6e6E1g76qt3BKx0uQ7R0E9rDdB4gBphTXJ
8G+/Vy6B/1s/gwTLgQ6qewVll0Sz3MP5ey2eD1QUhsM7K9G3eYNnDLg71t/zzWUJkKBl700cHiwG
tm/z7EUTg41lB0Hpf2biy3VMeYNwYYmBald20zXUx47+RGrEP22UeeXnavDy3ea14q6LDWeLZFWu
fe6jilZaJSTL0hJDPbb179B0MMAdCsQmmBqPgwqkk02m5oo/237q7eKGh9/6BfBfIUDIdNBjRoLx
CJ0aD5L3noA45dYCVuCXWzLwgeGb1zzZhr1wB+pj5C+PNCt5k/jPHb6Mzg+wv4aALPpKysvoLijp
P6rEaxiu3B5Sz6gXjNS8hgrPUzfqMmeA7CgbnHup802uLCjNEy4PdMqpTAlvXuh0er+i5NibcqN9
aosNZzEgPaGK+IuUsgYFwdSC7IylxLmq1+x/mC4po6MSNvZqDk97oaCEzORBCN8U1EGAM4yq/iFd
nPNVlxnwtYfsbENZ/nx4JluVtAmxfUItFi+KRcXyN1o8yzTi/3+Qyorf4vISncaJfi4ZbPDYC6lC
KpxOjduA5GzYMMJyjzJzzPB3hpDfMWaH5E2WM7ksUu7Z9/C2Xx0aJYr2LeftkG6emuKD1Z60k1aC
pIuyqq5RYx+Ynpb9BdwqyCa1hEbv9uTVbFWNU+fvcLrwwltbLK4S5+kO0YdrEM2deo22/GXsxwAG
zSP2Kji9aR0e+T+OjkBPUtTuqOH8r3sBnjosgLlSHomjlfF4JI5hYfqMIX+bkb3KtpLPiQ9ZUKbT
i2YyEhahvKIC/N/ePJvKQxF8h74ZS2hHnqyWenR6K2yfTmctw+njMXwvnCwt+jEkwflWqimizaJY
Jx2E2hjfJqfMWwNPBQlvSmguW7WBRWxrJQx6LP8qECG8QdHgwWxjRKL+4m6qAwYN3IvQSOZcypoE
cD/LByLero/luuoTl1YDpfPnqnq9bpYZ0N2HH0PLpOJaOnmAcj4g5oQmq8D5jWIw8+x+8MtaXS6D
MR130FtnJzNIB3yGgn4lMeb3QPMA+rZ3E2NbZ/sfOahF1E4o+O9xK7PZh+vNUT0FLWCx+b+WvIlw
k7JtjtFyNJXMTgU0K2Y/Ay5eHxXDHMRQAkqCAf2g0V05tJ//ph0wo6Zt8m63cNBz9g2QN2I4h1tf
IVCsCo0kjQEGZcOZk2IlHMK4k/+9vYJS2KjWE1BPAieKpgNgZtfdu5xcGtKTZIbGvr3/h+5BzJLU
5XPYibnSbYrL9ZKhXrdBpXDd/Jr7vJ1dejjQ5ZeFLQhbgLp3loDwXdjEHPhiWDUdaHMyfjPQdLlE
ltpqfLoyWaYd/8hPG3MLLTrPxQsEeuoXo0ps5kv2qQahV16ufftUiQOnZnKZHRTTSoxBNO3LVrFw
qciWVcQX0X16M3mhRc2JCGy0pZvfaoc8NDplH6EJOybrmC67gsfHn9Z1PYpw7Gn4X0rmZApyplaQ
Bqb8ZjvjaXAvLrWKEW0XIp2BuL1HvfyxpK3/NeEZcy3BNSWj33GYWPfT5ylpqcPV3GC7zru3x2HK
Goj8fHsavs2VpBcqxSy6E0dgpYivfOF5n7XkwIBYkRA2FcJmrDQ9y8c6XzjJQGTxH/QvGzFMlgCV
8++VG1ssBmWG8LcccUWuYPxrKxnEHIS6qrynDaMTAMX8GU7GpIlbZjIFgCLGANSM0TV1Icb6j5zd
9ZwYLXK0wtxCLv42jwlvMQIwZd4OC6OnGzEvvwAPSal1RC7rlvvQtOJbUPMAo8CxkV4mKX++3c1Y
YUNMqK9xs1/UK0veYK4m3L6xo3hlnb40o30rcZfP5FuWbYKjrrNcXvkjGA76OvuidntQ0dDiatYq
NoUej1frWPWsPa9cta0Gg/nmzLzmPteHMjzePY6m4fWs+bKgNBOsA12F3CIEDB31Q6+J5DoKg5ge
WzP2vTmGx4YQal73EiCrsXvaXyk5Jap3sfnWQWmUBa8qRewRt4HZ+YvEOqDmDR5l750ivoqOJlRe
h8JZ8EDHAJC3u3w0zQzwMZ93KAeksYq2vkzrQEBlg59W/U1VMf/l/t9N/OqN929CNoSGoF1am7gt
TUcNBrsI86Ne15ceU/AQZElCg5XXR6ck7D6g7J3gutDiaN+v6pw1eGGGpEuyWBfoJdy8nznPmfS1
6tuAGOJbIo4RSyRdVsen0wEj5C2BWHN3LzNlF7fXwk91NA0AMnHLdIMlRdV67uizml24C5qGEC5g
IY6bSMZ3JHi7yAA2XJmOTCHqbc/QqSFFKXftbqRMHkg4/egG3s2qMDWC2G837neJzEQgGFFcCkJN
L732+QxuaHQj8qETixkrelUMo1bYNH64IncDnOlzoItCYTz3ZVdX3FAhwG631SDR56u8W6SWMmjW
v8S/8v1FoQ1bgxOU6BYTgg58AhQ+AOOE8+2d4zOlWH9GL7XbSiaHvsrpLhm4mYYwx0aZRlW8RqUY
BrwUhsy4USCFsTmDKBL21es6K66TSzY7z5eYujaWHG633fgVELgmlrz4hV9CuZoc8gwAEmWHxyqg
SOb1o+bOcI3obuk8karTD/nTikZWNKfxwTNdCEzI8kB8csTlZ+435KwgFVpGKhUkL7lJU8X1h1bJ
Mj3rJusT9z0y4Zo7XEwxRq4sy+2IF5GksHtRMhCn6ca7v3Ct2rLR/anjqVhjlLV4/dwXtrt6fnSn
kZ8EUtm21X0gzkU/m5KU2mJfbI6+uqAg+GfmZeX4i4/HEl7MM9JsDpikLXInYR9aVCdQiMA5rrUt
In4pBKuGPZK954oHfECZSLf5PDdV0Jr+BHLoe/Rc/MehaE+/yHR91TVj5CXKvKyp/db5fu6/dxST
sieACQNhAkpOaT+guuGjIoO8M8Cnkrk0YHQzjopE3M/o8Lr1Sj/RaLcLmcjfJG6JwLqItwYZLqA2
bIpAFvACT6E0ugQfDQPyxfXq7tgRcUd9TLu0wo3idRYwVeB+TgtxnorE5TBparsyQ52gInfejPtV
5Dzoy0xTjPWb6OkLRNyufNmLrD9MYAZp1HpqsuPhXOLEVNWd1xXdqe2u71o8QhwccofZg97Q7IaA
uYyIXIi3Zh7hPWJOFXysSbNOz7lapkfB1m2MPXNWRGQPQYlrJrMexxzsviJOi2wBEbrO2sqdG78F
0JwoM+SMsrrNkNoMBl4PEO0sRTSNV4TpLNynN9GGue22udEpin7B03FsSQ7mqO+YBMd3DaS2XO7D
WMplc/YbOiQhnYB0wJItSedxqvgM6qnLSSisqpM2a5WZM6E50qxI3sci2UmsOkzroXo1+hpvR5rf
frMNpkgqhCJA6jtyTYqgF9vbjTHRUx4CehtbY+xwUFCo4PPxSZnc+66BXtH58wXVZzt+rkG/ydRF
lJWoRcDEl7YZbUaW7i1Y2+dMM8OW0uwCYGigNrZBp9Q7yawgm2AYpfORaMrq7rnlO5x96kwQb55S
euMytEwkcKsl5beCCwQ1/NoLVl/kAdB4yC3uACW0ADPCdtwNsnTl2TJv/rpq/OuPEHyB1BzjmU3Q
ddFsM1/pitpMEiii0OQLCBzwGZJTboz29bvvn8sEfiCMhI3nGw3Mnho/48/zse0nssb0tmQiet45
oJPcOMzl/vPgd69QJNFUdlRyhTQoQtAXQnVevYqEX1h/deWndlUEfDtwDG8tC5kGpQWfQnzwNHqi
p3jgk/ld+xiEF4SZyIgmQVEHtQmLQlG0Ccr4nZPzriwdjynYfv1l06wSU1vhoK4OMBEMuIssncDG
K9ShRxMmXBWaSvEl6sPOGfuIxN+9BeCeR8GVLDpXq0reJmfXXSlzCbMGsMiRdr8iCepm/4hdiRjA
SlsEeuXRfeRYP5iqiKGO8WDFoIfkgrXyDie4YfZC/qYCmZb10BFDdn065oCY7QaefHR7JzpTLjYk
UySEeZMMLayA1vUI3ZUuLNCwQE+sWZ5ovvclIagjJBa83J+XCdvrPTCTIoQoTGl9j5xhlD16mXEg
9m3uqa01gKF4oci4ZxDxg8s1ybNLuW1RD1L6//2e5+F3dpNzwDYr76wGhcs/toEELt2oX1PjhXmW
PUvzLSCKv3j6bx6G06tOmruZE0Ommj8n4Pq8dSv9WSgi4/1G5wwHexSGY4U58QTFMM2JQYfcudsu
WaTa6TXtSr4csemHLUsBvpGPJbzQnZaUio3Ty8Qaz8AO1fudk+grJ+D03m01vGMidnrYT3leuoR+
IAu3wKpP7IQ2DB7P3oL0OGRkawIwmdKFZtsTHqH/+f642vvCkuTRRsWD2Nn+ZPXOg4cCb2ldFj9F
NErcnryxguExlN4xqaFQti9TPRY/peJOeITeu7WXaCoNUp8VKKxBXns8B92BUZMZf3kgB4r8hw9y
LFNsTbWhQ4RccSSawEwKLLrZbFACDoqnKA89D2rMlMQjMcSEu2Hddzjb4cbYRLVJrMSxzuBhqj+9
kAKUAF6aJX39G07V/O3zgH8b6PzH0jwg2DvLTBPv1aaWwcki1GnsnhtxjwLZsP9TQvmO4lFLRo1w
POkFqOrHvbphRqz0u1/w+0hWLfYVgaZMRSUt4L9hoOYPtYMGyoq302ckpxtoAGvwT0Xofy7Yh3oK
xPJfk5N3fmaWDrB+eq9th/7CB/b1w2Lkt0nPepObf2pB5kEaUzN+d1OCTEK9wUGq17/Z/FEoGIaR
Wynt4YmWLvvXINBlXmZAiEC4yXj+ScAcCk2kFL2RL49Ui7Fu0SPMu590qi2gSje+iKNuAChFZsaT
DVmue310PC62xsORABc5Y7RglV+M3p9WWu3AFvId1JtjDc/gbvT/jDd6JMaWuhk3aRgJAouY6YAZ
unyTUN6Lh2GJAETK2mnQWpKHUhSErSeF38nOhoVQ9mHdFHJhWMCgMYC93uZ0Phx1+VXIQT7MVqrt
RDPfNgmBlSOw7NWd39F/ydE7OvB5Rmj6UKxdP2++YtBrpKIMl2pOq8X1SHC10YrdcsKfXJZBQ4a5
+4ng7N95JbVbfScACjHimRbKWRutbDvL43deJ6Qk2q1qXQXOL8WV7tXnOkMBx/SUZF3OXKThbOLF
lE5DYaj4RMVYTQeX3IFohlRQtubIJSlJ98adOmQ/ETvALyyd6WxVPCHgmTdTbAavv3y0N1tB1Cre
4LOGOOa185VZmU9Hbw/mIDDIPhVo3unSXlttLxT2STua7ypGGK+OgPcGTZUuoqUAB2HtQePM8+Az
+Ab39sBcU2MzE4W8t48r8ajIEyyYkokyoiQQNmabqdPqlx7nLxOtYAkYRhsSwYGB8F4sDhHz2H5m
Zf6+qSTLKE2STW7d1sIYRRsETfu2yMVDrQexScBeaOOUnPPdtOfPPrXC0shE+0k+DyO3kfrizGBM
FUCx7wPpcnUUp0b0jF5wBjEcTdwdZNSWAkPttbWSRCvjfltVZMsldXTC/0CYyJYWns0cXMVOD2wX
RBRhFGwq2f+YJRErei1OT4kZFZi88Kt9XqMp2Lv3ZFKDfSZu1zlp8gdBizhdiVt114rnvB8uudr6
ObkGqjovuuPrOg7YrhbfYMyfO3SyC3e3Cv5A9bZaBAG+Qam2wUqVfaHVtLKPlm1YuMg9ztfCTjzp
CEtzjBayH2UfGQKUpP+jrOMNX5c92lITXrbE8Y+4iq/qSMRC0QkTFNuLIJ423K1YuxGW3d/LSjEJ
xxPkoL64fkN5gM6LhSgumWDd82BnoF3gloIspjRC5VSH3kkgAOWNaB0BpZYWB3WIdwY2p4qGniEm
gEn/zZ1dsx0PD1wBlA0LA2quKWErJcobr6YGgwnQbsyY7Xyc56Y59gLFOWNiMUDph3ZuRaWAJBt7
NC39WC+uZiLcosZm+0L+GKX/c7VL5TKcEvbJ0Zcv/Kh2temQZbx//AY7LXmkb7M6G/LRsRtiawn3
QNhy6xfkLQN9OGgBxrCutah+W82MVBURGBUq+nAdi9lvINOCugrqKlADIqMMpU3tntL6ACMrGjI6
u36rGrVVSV4lJ8z91yxMVByu7tYxGLRz02ZAGP5kYWDLGB3u5tvxFgRetxlLeX9Zz+8HC8KPQNLr
ECI/ntk+UQ32WxCypUl9MVx2OMLGcKH7FKCehrg0a6Lxmv31EZs/654YMFDlde+YP9eyb+ClywZq
SvlggN2/RgJSaFw3x1mTEyCLnLLcLHZDvpztUzs4wjACmUkTuiBk4wFJT6L038yjEQ/FTW2f8zBy
XXDXRGuvLEgQZ3HB5NbZQvMFnydKze3KuwZyX5dixOmt0NUFSnK4mQ6TxAVvt0dVwDSanhttlfb6
ogwrXmmb48Ws/FSIy72CX9IfFHYkmK5X9iv4qPiK4dK5J2PrexWFhKm57JsNyxFjUMXIIoBduzIY
G8hPHO10cBme34tn7aF+KjEQqd7ohGFd8KtOD5yfOQ0bTpUdP2mCh8OoMeYy/5V8c65nEfB3yt5H
2pmTTca6z3jSUs/7nPwL/9O5Dd2U4ficgJNE6W2EqeyZFStwzfgbzP50NWoCHGAX/xmt/V2EljVm
hRc/B90OucH8liqFWMyqN3rBc0jEL9iDqcBZ3ymWQMBKjIK+ndCTA9Nlh+ZL3V5bqVv7tltJgWQm
nQK00dmrSwAMpIg437PSnsxAu78fNqRER0OX07H05PyFJcyZDJeHW78J3R1w4xDOumjYrSZgr0Nn
FWvzA5jlhxBNXKae5K9yLu5CKY07bPkbUQgHxtzMCIpuGJ3Fyjgaopb0uYxyBd2nFRcI+3pwsRNj
IMWCaN8FNviGUvRKJ40AIzJ8fcTSgUV3paIjT/UMRHJgxc3U879aZHLGvV13qR5laxhAiNSCRO4j
8/4NWF734eIewKzPjHA6qYvck9upg9IiMZ3A19s3JKTakjiyhYALK6urjZ/3RoSnaL5TAurH9NDk
/Fh0zT8o1tTvReRIMkfDkhmqs8ui7IELhJYmqcO2WridD4xofrirXqfrFP08ZW8IW7tOvXjmJxEx
gKv1k6kXjKUoKCvS0x+akitw9dZfFlyt+OCNwgebdsU7YmfdTJzH9df6tGtxiZLpMiKE3nMH3eLl
C/tj5GDU+YJOA4ZcImy/TYd1G5bhJcIKoyqxWLWB8H1YBQ0LA1XnMkbvM8Y9c7SOBPCFq94SRv1L
3gFAzpPwrg+laMwfKfioaq02IrF1+lBznKEyvuGcPdnMZXxleSr6Rwu0vVj0v/1Hq2ywcAOMwnrz
wmolqNyZH4s4kDEjNNQRUROKqGpw3XcWrs693xJW+G7jUgvG/ku0YSE+wq/iT4agWLiCFWdeYXjn
ukRsxqWcPFSMnPjnu6pz2W3Ef1N/dZ5JWp6A19OpBFEPGavf8aO1qsW1WFoopJxbOFTH4jT2+WQ3
/ZmRNPLrqxS4VQQxDoqH3aoQD/1RfDHeCqDy7t/LBRSzPzXc7NdVCXtgRmY9nv+8MYGsETPCtwGv
apleTkYb+RvuLpZTqNeTTUaRoVU+zYzTdIdEe53Y7ASUZvwbNkHImlFJAccfB9DX7h/QfH4ZDqzI
QIERY6GUADjWPhe+TYfzt6GEVlGpXsZVP/Rd2TCm24JWth82u15vzwKvE1OlOaWNRDRVjykA8H2K
lmTuvWvrQD03JyI9RHixIRT01/gk1ItFeJGLjAha6VZv6A3Y7mpYfwCJ+pFQH6D2HiuzwrUB7+5T
CYHqvO2hNNat1zCk8WDQBlkKcTjCU2cEr6Wt3gZ5gCY5a6fN8GIABKu7f92GQ+m1TdgO+UjexRdt
9Aggqkiwz5XMuuiolyifDTyR/Rscn8qRHcLrZm7ZWirgYPtG1xPpBn4H8zgRaJTsFl9BEYY61P/d
2/Gtr6SsZn/O+5+t40lR2qMU708N8HD0A3ee5Rn3DRmdcnTNprn3Kf2PSqD5F0IqHV86tQIHwYL7
LDnWgJnQEzluscarP6haM21RV9WCpOKFor0AAm8gxwZ3JnSn7RX9YBQ30ivZ4geU5x0G7VYk+I0I
D/bT6C3SeyC9g80rUdvhlFDZppstB81tJkROFRj76+CdSOWGaTJV3DAPofrfjLcXcBWb96+2SwmM
Kleix0aUGRdRHejuB/pg1ry3nr6Qe6U3W8hSb3qFuhukWtAgfDSbKbo6kF+qxbkCnjfLcf+ADuFn
yXQGcm+zcrTT8sQAx5mLAfHFet0VJwZsLIenEnOJ1/YuXvaBMLEfDnoSJm4ItilxNJlpuUCfSDXl
mPWr80X/hVdken0sbUe3SbMcjmGGEbt3M8iX4msi48PjNzo2m/RPNq/aPNoxK0AVamq0aYh/3UbZ
7LOwP7KeBrVEzkn2p5Yhax282lCrJ0gyvE0gK5Sj/1FPkXaOkZvqko3lh5k1H7o89fpSvAhGGBRr
GYeAFr/nrq8V/0qQvDLuMvatVc3YAzfYYbOLGabtqwjylKTkoxOl4pQ5EuMJSv+vgMqPSay957iJ
H+QRPCJ8cr03m6hFJgz8LSPvKGGrUjCPqqAs20/VfNMmkFuT8Y0ez5qmIJza56kp+zKYsuoTmB4r
MQZ7apzJbk9m7/Odi0LYxt+j5wNuE7Ij8B7MhdHZArywJht1JupwJpF/r+YOPoqW9/pWut1RkKZ6
ARpXgpRUr6mUAVVb6C0bodsCwvbUXwlmMNL+UxK4c638nqorj5wXrD/5XGy065vqsX0Sx0MQhmzx
BlFwo6vmDtU+3lD/yCBLAycIwZbaIj9fhbMQX0OUPx49IR3XUsevoUBRb2/TmQ13PpvmVz3vAu7g
q02JBEjuZIS4inX/3oUaQ1U2t1LDYYWNBOi/vIRwaN6fYOBxTkF96cmGv6vj1WYUEQhf3pJqRAAd
X0PR6zHSn9KzsJPzUootXmxcAOFy6zaLc64K8SEo6WjBjmtb26qdfSIJCKV5VW+rxZW/V6Epu48+
NKD3rOnqLqwa763LGW1IcaOdmxuETyaqKXRaq3OXfsCyMr2q8T6p3plVhy63UIj+y8LlcwTZyFuo
YBb//WPUFIgHf+uI4KqA1lCWNHSPgLZSgXuJAgU+y+XgRDol/4ZbkcnH4rtULO4mmUTXtiJKpOrW
08oepk6YKN8du8iEur0MmDnmzuQAf+korbrXKv29V38xdehyHcZQaZckt+JcDwWMgsVMBQHIMvr2
YiiFizPAO1fIm4WZY9jAWPFBuEeIRSr5aM0aWQlA7bf91v0ItAGPYEGfFV+Azxt/Flo4Wktfhg+7
3EBf8wfJr6K6OVxVEdvgUf5REUUvsEyOZWfKVpe8tpiZ4hcFv7iYZBxlzIp5C29cWNgo8CeFu9aT
nhhAqdl2Tf26stfE8OQwTSQ8UwohfNic1hwKZm87WgmXLoxRpmQzyAgcpba6hySnn/lKNpyCMhyi
MWwfHbkWGKyaDtu/P750k7vZfrtmC5PLe0DOHbOLNljdQF7Q5o2WaKeDjD0A7vn3+qQ1qcC3WeBh
3ori47U6+1CEy/N72uIKnG/515jWrBrzRYKYx6mEQkMYEs4s5gq35dEY+pjybBLhLTttFLostnmr
05PpmwouO/YnZSyQ5e9g44pVfAMUaDvPTwdPewVCCzO9iUafPzR/aVWRpz7fKi+n5T+aWPi2/D24
65JG53PyBPg7oG8Cac1qD9l4UeS9chOEu8wpf3GaRGUUPPiVcRyvvhlECmBTDC3xDIs0xvCByI6+
neZqfW7R0tGuMAmjPdcWKPU3ixOAYqhuSiG3ZE3fPsb6gvNIXlFxCoLZN5LyLl9FonXu+AtbBBEt
zc8NL3uN1KY6WOxNkp2MspzARkd31wzms5hapx+qGq9GkG+63sSEW0qrOThAiPCeBm0heNPK8Dqa
8OB9KxZ5Ztd0iBpK6MLxT+9ks+poU4jhZm3vTQC7FvbOZdEjNSUVa+HBRXlli7AqSPOHW0gd9lqi
QNLBmB8QR60z4rBD7b05AVFix2wk0HAbUhxIU31HitD3Ky02fe2JGqRg4Yl4px2MJynEdA/C0CCR
oUoAr6RXaBUaZwn3exfMJL5mCDcWDksoqc9wFfL9LPnRDpHN+rBZl9vy5zKDdlF1nXjQth+lFJnK
DgqrMjonT6UsXGOhnwDgPfScODWfPbhhZJ25WOQop/TXczBtqRSD/Lw+Tgpvr3jaKdVLwNqXw8fr
qL5PWcZEdWQD6gZAz4AFJiad9QwX++aOzudc3l4CpsdtAAVQCVGlLjB1VC9sR1qZEt3FBT0SwBwV
7YVmt+8R1wETQF48+ZlOj8/1RDXV1M42+Q7r8JpwtrxYcaYYsSQMmWpIj1cAIDxTwOB1VgR0Vsjk
Kssxd1P2qDJq22TJDDT7T7C9KJqi4FnHkBfPE93nxqUxPl1jJHzqp5hayjxoqpB6zp87an/Ymrz1
ZW6iw+c4Vk+1yj9NeUvT+Gb0Ft23aUxPqKqksGR3nfV9xZL1ZQ8DGtLCNjbETj9RmGyrwKfdvKD6
FF/obYGxU8cvQmz77Kzs3uVpoF0GaRfgh3fu7tjz1GrEGSswsZViAqzgYO1qTXHOJCKWLbnVD5bM
e3byEsdWAwE9hmi3BZ1hu/BXEJ85czEoUYI/fsue58KuYzfixTyAKotC/ISxiHPkC5t0X42kO191
euQH17GUALg2/4jxHEs4V0PelAgnvcTonTvOSNI+ea0qRs4KOLTua0kDgLogNEt2oKWhtG+pZYpY
H462IqaR1rmvajC4cXQSYyomQeVgI/SRiX04vN5nqfObhzBo3gK1Ug2+T28kJ9S4dSsWDV870bxR
SNg796+amwFM3A1XRN0xy2tWdMxcx7qhBIh2MIgmK/wmes/72yBpeoo6/GjmBzdMRH/zeCTjs/E6
bunOBlDy0muLP+dxB+PcFkC9gVdr/i15tW3TgIGRdG70eFqGaON1zOfdP/gyOmGLsdjtc2DQFHom
TthglNRIBJpubBXNHIsEwS0olGiVWFvT++IpYJo1rxmPPn3y9x1p6nTXGf6jjmILWgLGXTvkiup2
eNxsWb6JkGGLfL5wg0yQPfrBfOxGilsJWr9vbAeodpDYoIKa+t55Cr+kmX/9o2XgcqkDt8D4w3/z
ndhGVzw5rypmDiZpufLz2mZrz4AkloCCkYHhzxWrfIazfkDg2RxOVW0vYGz2XIoAebmSmhpONj71
UcijZ/aH5eh0BEMCZuB0rsyOWUW0Y7wHnkXXFgxKGqho9IsO5EFd0vkT2k3lrm1VHXoL0AxuROS2
u/M0zyXZPlpYydbtSoQgVpeBzv5+/0L1MeRxkkq1V8GcFQaxno3pPvtrrmytah+zkn6vkrFjRQln
s149e/dHW4CZ/vNU0tVm2ENlSuPF4FDWcTbtxbAc2Op8FObr0p6iyvM2JWd76lapdd+F2T4Qr/Jx
8dkxqZVrO7CayxGPTj7JJ22ZINcnGjvn+6iliT9Gizh7H4U/LZarR/hnlUiZi4MHEBGjb54UZDWp
Vj7YGKs9FxyikR2pJK3Hq0pbJ+M/4OtZi/bte17yJpna/t/UaxU0tFidlmKzXLonkJEz450V+rsd
Hc8F3iwe511b4qrix7xkyUD3b+c930o/RI8P28Ka/PF07SAzt11n8AcuJm+381OOyTqnlEgT0LAo
daQ+jPqmMXekRk6OZve/l9FIj64eEfmlTGxJtZeiX/9jfCUrGxqsrCI5E8Ueie59sXg5iC3t8UNr
Fv2nD4U8i87I0Z9yqGlKyTYSU+fskLi9E4EvCcNzWkIGvnEV0MJJ9BZoD+1eK9G2beU+HpjuNTcD
74+2VCRHtbljSe7oh0Yz5vc+VarHGjmHufantHSNpfoCbqQpFuJ6JE3gjxOh79yjTq6zNdPcvzM2
cuYygsTIromkohs0tqwM7OZlZrBFHsmPrmRMQvYmVsrVM2dvV1WtLpkxv17yb6Q0B2Y+STlk2tMI
m3ei8DqJ+VlVseCBNrpGHC17Sg7Ya9nimHO0L3IwchNa6RBO4T6rkogG8K3r6HexGpZ4HI9Y1zjs
rR2Pe5sb6Zb2/Ye21xfY+FYBLsIEAT7bcIJu9zhanHsHfEab7pU7l4jOdHp6hxthWhOMnr6sl7vT
bXIOr/Nlcxxs/XyZ4QGIyctQqmYfLsNUc+2LQguCyzAv+V1HUHrOAYRcw+8L+zzZzMjtqBEkoG4T
Ze+/i5fLbFSVzhHGXRGtBqkCQTPD5xrPhgB+3DFck1JbDeXQ5bIUO7V02tIE23bcEFoUHbq5cuhX
jNXhp8GXVBpLmIn68l56eRKHDThCN7CA99CepoJdBg9/EhIKDOFxF4cCRkbnQcJzmB+xHLOVtuAc
JfAANjLtExDDYYwySket8TGY0AYJQYAqzSxQqFnmm/nPny6QxE/Dj2WHQgsQmF07Zxrr3RamoAHE
nlQzY7Cn/mfM2zBcAx8GpCo0WgmOPhHYZsX8D4VZa1wNBclApXaOjoUUCca6kY445/CVQUBoYUrj
sjYKS4lDaliYd6YtmRGWCOjUP06djKcPp8HA/FkIyM0qg8j5Wmt+oQMoVSUBLqWndJWeuMsvHyGN
HCVn6sbrXr6Z0CyeFYSv43rZp+A4CUcB7mZWGG86LX++E5LX30rpDUV+q5Umr6WQepeHrx9L5Al/
JCDKvd4gSMd4HDB6KCh9lvOkYJzp/+8q2b9JuncAB9KSeuRwPZo6N8LZMzVLF+PJXa7QRdbbpG1H
QRuKkNnQrolzD/2nkO91eprySWbKuqJHa2a93pKIIF0klcDtkft6xAGI7awYq/W3Z439ciVTj0Yg
P3pnpJSJJt+JvR+7hxtv5RHAKeA/wMzfv86T8UsoZ8uumJ0wtuzxt2cPfF15b3DqU9dirgamiv6L
SZLTim6ta1kpwsRmWzsj9HYtmrx9qJCiyVYqcRCDJCmM/o0Fj41dtDsKeHSDDD2bn92KeR+DA7pQ
gFowmgbp6n9Zk6dLGEygIqhrxPWtcDrzGnKaQAB8Hz8IasSGvtyLlJ3msXsPs2J5PMmpSr898XUC
uOrJf3pfWWSC/Cw+foVB/xBe9RlLr9Rq9BR+NaJopohoVhWbqXD0/8Bt25pAi42SVnG8hsl1HCOt
JWuvrEH9wVEZQWxrUV5bLK0TqIUM/Bc2EKhMVjgAPuWSt//ErHWToQq1pSTyP/A+ZDiPa5H3YmSM
jX15wcmMQlZWI3e50EKheKwlBCgQii7/L6ihMHRyle9zIlZcqnZd8V8qBeMQS0a1ilYJHhRMNWge
KQVSOYwIMZbFQC8jlp2WZ/omdDG+seFYOVRDvZjrqFHsKQ5zFxGu9gCogW4bz1qfgxkc5OoCFl2F
YMer2TniFUNYGISqWLSYIvNO/VEAlPFkY/ISezumc4QOxKmujTLUuNRC0TA2a8vaE0j38FaQvN5R
Qkm94Ime1ErjOywvNXC3ivy6Ci5ZqFaBx6ValkOhHjD0cAOXh9jrepEq4uWRf8o7Y1Ug+q95Ud3v
PbxdKb6BDozu81CFOpgdiaU5nIOCwaSaV/Yu3N1U1y8mgVsfotorA0C8oq53aF3m3WoQZ3NnK5B/
ZybXH9dSW37qGKiMalodMM+fOl0EdKMcRmSbwZMgTOioSS4vYXKWG/Iib97t34GqboKS9WdlMx5V
DjVV5ccKmXG046t2/MJJE91BD3Y8InzP9ZT2rdYDSKWrztqpau9P8JaRnQq1VpLLMWmndT2nnH2D
AAzzieRtCFUTGwZR3xl6smv8kJThuJaMfR997thxiLJ7ML3wqnBRi/bXVrwiNVOY5SQe+YO61nsQ
yG73N037oIKX2Tyg5xoCC/XNA6I+yvFG5Mzgfp71d0Kr/1SzM3w+/n+KjiEKnmMWjQpWhdmvZI5O
mH/2ht5NSj/U8sed0ehG575NPBZf75n/PYjROxewDICj1RQvj64zib7ApaW4ZoD0d489KmNgmL3v
hrQqVDuhpYF4TirssH04HeF5FEjJ2OuX8FJNd6uZ9YEcPgW6Gge1OKnyEzNEtOm+Wi4biaxhnUGc
9bDs9/Ha+L9IPR0OyuKD4gKKgGSheN3FiF0kVuoFBSf2soythwbYKPKdecRiuO7pIVewAvbRW2zF
oIERqgWTqo2ouYhZakC0B+lRmgYvEByOGCcwzL1dmlFtIppSWjWZKzbrWunl2HdWKgrMMk0aLV0u
YxDnv93ORXqo0Ms+cuiUpqNfvBLeIL477jFnwt46gJokJNoxZ1cVan0dAnaP6GjV6mEXi13HMSI/
hM+o9oSnDvtuTk90G+GQ/UFDoiK5ItKeykKsRkHghP6DK5uMmMWwQtA1bR95FLEcfcLSnj18Pr9T
mBVBcyN6mGBb9fKOILoQMNe93rBwRPhaGgY8VUUEkjBOeqj+SmdU6ffyZCJt7ZC0yXU2dUB4g4zg
aMYu5/vlYuaSm3/MxxmInZjytTfJ2uEyCfMOUC/oXkabFaalOO/a7xFVc1vgRgRCJILtUHUP31zz
06zxcjGLVD6lvuy30sHobSrcIuFz9PsQtd3BHco760WHL7gW+bByhzr4Q3XleCEmuradwQFKEf97
SRV9ES1kIPHr8G5xunGLr9M66sHgHW9BN7Uig12qVCJ7VQ1lXOjH3SNW03UewutPuIs+tR1BOY+J
PnfhUtHmnZI4Rl5l+LjUWPYKTVfzotAnK/CiqqwEwibCw/2ZnXrxW4oruGwNtbL8emwxYHmPIXxw
gKvX/0INIxCa+6ocEp+fkp2DoH9dbsARCeqtK0xusCyRk9Ol3/KnJMaQy5BLb4MpnTpTZHXDNE8U
U2UQIuPDMXykspw58t8BMZ28nuVsG1tmpYZbHRlzYpl39+8qdCGuuLoTAtq1o4IqVf0T8/ViSpyz
AEyEePLEciVpFnPTlu3OlG2CTRbvbeorPdkNj3AHgLGSPPi6SfHQTiU5PtjVinedppc6i2aMnwPN
W9auAtI/PMzWfbDeGe05O6rk/D49JvEgtDLVsFjo8eqZr7SykkL6/FQNDXO6xQe7jDs87CYNvhUa
uIeIQGfBDReO+b4m1nMvdHds3IwEmtDEOgECRf7JqHdyEhQMRV06nyk1aK08GrmKpa3SfW4WaYox
OJLd+ma7ZW6Gwq2/RLB5zPB3oT5ecb8oGI4ZGwBNghw4qVSHhNLEmJ2ubf7fNv29Jlsa3ArOIyeX
GbSKnHK33u0nj82f9VXzpmex4JvEjbMDYYO8IOjP1kEDWBapuW7gWyOogTeubxRFPuGf5yU3IyEf
qzOC7MtRfcWqbvrAlQAb3V3BRkN8AwsF/BHAq7crYeHBeyiE8AyCSL7VOCHqExtrnqwOQ14v4JQY
PIsi+MqPuzUXDHAOO9DNq8s0/hKYd5lnYEowKgPNJAZtO+7UF2Gp19qYKsnG2rnoMIsqeyIvcyPo
5qvLy1YPpay48bpIyD2STy33nPx42pAGqs28WW+1zbjzGDabnW2EGFl17WyHoPswpIdMp5pY55Xy
cIsb8rxohA6WSl1AsEFIEuHTw6Avg+FIX17fx3RJVhOjVoRTEye4qgmR1RgX20QmOXItLrDv1T9c
jaivIBm9Wd5FLJLHtIVfk+WqUqEInUY/EYZ6iRGVH/UME97ZU1EhWnqBZkZmPxKNAcywOFAYdRtM
4JoeHF//u6AL/I40gABNVyMD7h1cjPEm+3NEzpe7PQKs32FeBBw9nXcEiy6P7BZZh0duJL02A0Pt
/Ab9BMfAiJXYtv/A9FiZqDdK2ArrpTmXF9M3R8SnGjT4sqdC+zami11F5CHiDZxLRhTRyAFw0HsW
g1+d/kzkZfsD8hwE3Lkl8nbkv3BeAMDBcIMaHUjq9XQix4Qv//+KSmApxsviMaQUb9ieCKESm1K6
7bpu0qeDPsGqAzPaEwulMC1t7cmWvK1iqtSu9FWTORlzEbemVl3ztN9UtUlMrDnObuFmnSQmAAjk
NrBDxCXcySq0MhJVFCXyQYaGcjl3tLyI27i6ylRtuHP66CiL2wn7qoehCRtrhrg60MTpTZM2jK+U
B4XHhhMYE5n0LCJycWbwUXHzax78lOoehc7CVXz6zjx5ikD6Ggh+MrRSTR6J1JTb08JtGDUxpcxT
zTwtnhLIVQrCQFx4x3Icspu/btXNd32lnzh9KlZ2c9rORXPuX3WLaA5GN898gT3m6Cvp2FZgZuzt
SFw5EMG/zQW3+3SHcLv6gfbO85mB/ek+irjxXIL5epQUYl+/5mv50cZFJpEHT8M2Liq87J50m5Dy
ungwj4t/s19BBa0UphAIOhEf0Bzpd5KnfBXSAAMsu/BS0DlafkeE8VJap80mizhnRZlrF12aCoac
Sgk5Hnt6TTCbYs/snpW6T07KGbej1aRQBK8SiMDfCSlbW4Qw53rXSE5amijncwi1jmaL5EZ8d1TT
VNGmyAKQxmHtR4p+ym00eYoJby2z2cNfgwn1k3ackWLw/nex7nyUaYlUqVa5avLbWB+EwQDFyeph
dTt7uHi9936LSh3oX2+oCdx8eScFQ2nQKrtpK7+IQ1yq15yjDT8cIJBYsZ2fEwsl7TgCBcqk/yIV
gspyyXmM8FXvHE732AQCtRKkfYGWZQowSnCcuoMR9qHz991bJ06lxQZMhOZPYA6WGVPkV19h6JFr
Kq2flYhSjmTEneB8bHXBBf+4AwP8FbrklYfpbUAVP8mpnIqZhlcgwd8PvNmTYMNZgwgGikNdkF5d
lJNOtSH8MsWI/gl1P0+K2qjowOiy1IbFAs5IxL9LcVf9GBbX46Qq3HjQsfDR/5j/JzSCancbnxTp
4RPWVKPMUjoHMiVASLNBJCniC1q6lu7Nch1qtVjUn9imxic7e0pTFFeTp2trj+9U95n4GJ0M9SrQ
aOEtgyVjbbsLvNeVe5eUSFiH2Hk5DJdxN6YCBs/vgQQ/DbxiiILkwrFfB2Hzt7en8A9qnPQPnF4r
vbxYg0rSiRv8PdC0eLweJp1aTMrfZrAtsJ20pnX1anZM5kkjtZ27lWNU2CHp90A+CVPEDnxxuSK+
oUQn20rHVHzELoNO8OX4ftCELcV2Fd7uIDQt6B97yVJMOqr1s6okPlEfm3dZQrdh3pC7j7/YQh+T
Aij54inDVwjZhPP/Eo197/XiQhAcHqeL4T6pSIyWq8wq7d6IkY8jbT7NXe5dT82KY7hCKoggxIfU
v19zKFK4uNfYvoyABUmSY3Bq2MbuDwJj1clcV19jIWRWjxQXkOvVF67GkmDl2/VtK8T0z9fWblaX
y3ug+iF4N55c18wdlBjctk2DbcUeq6OH3VLiP//oG/cCrorYgDT/GPga1qSnoOrnPw06SApbvPlK
MAkek1DVrH9/lxKzcHWepO4eLKBiD2T/pa9Me70b6nDWiUCRol6R6NTUZLKoreThFyl56iArfGgk
SBqqvYrRnTI6tc3WRe5nrMLrAXX0Y9/Vmy3A5r0037L3ao/1yPmTchyr2JUyH31voMvaquHfTpJc
sx4ZsJoWGNkCwKDm5r7epkwHFNcz46pjvSqtxzyUaTw0z38QT7K2cfzfgftGuGWtaDHDc/8B399w
4N6/JpCWIuETIGi/4+xzoLIUe7db1hxhQOvAcSSpWiZgKvJwjJMQk9VNX+wcGFq7dEWxoUehwKKk
a8o1GXBBERz/EvlcIZW1OOxqUxm3NqDXz34dRAbV89ihaux/yCaUi9LDMrdY4/Cd8Xs4NS8TyocH
pLMBUipQhIts+ua+vZH+CUoHbidHNu7R5NdpuNrzDgVATnL64tcwea4XitoNe1QrL+Puh8tKzEQ7
IFLLfk5EsHfo0TL/xbcxBbt1/st+1DfFkBVFhxYmEgPKs/rr+D3C4Z2lpmxtWmrFggYPvu4lEG31
Hc3AXA1jlrFHuihC/Jxz2Akwdeok5LHEZV6T7F3toeUI5Co20IQkPA3dpDUOd6lRWzXhxMIjZFhf
50osb0PlFUq3SNWTsm+yeT6sAY2uby3kUVG05OwGU2Pf0FWRQQVZo5MVUbUw2h95mJRVCo4dhHVw
P5Ss4mEtftQWVCjBouFgrfLH5pB+irns4kiTYFT6kUehz45u+W+9O/eQkq7ZB/vmld+sOBQZC0K8
m/UiMErQBBrsR+Rh7xB28UiCAbrDR1Uyw0LKRwgcbAbfrWuBWU2kw4Oux0sA45l1ru+kPi0DY2aY
PhcBDEXLrfRQ76E1eVoOUxH51Vw5t5pNSHciQ/Q5YsEkCU1tPyjHLqWusb8xC26rM4zBzJ4FIjxX
7/LrONkze9BEAfIvQOusFJ/uEauJpFrX5ZNuSDgevFODY1nHLd+LNXJBNO9WigjKYBBJ6+M1yrFh
kU0yFV1BJHJpugvpBd7y8CMxnDS8Kq05N8E/I/W0yUf6eGgeKzqG41QP+saQRTv0n7PvnEFJFUG4
LwNVE2xyb5UfZZc1y45jT98E9C/Ls7tOr5xXGAuO0yMWfl90SceqLbgT7qOE915n9gNAMz1nPL1+
hFVN63V/O7RVcH+wEdVspgG5orH1ylthLuaL3A6joEt7QC6xylwAMgKYWkgydkese88xTURXkYm8
P8MHXaesIEx581p9LrqP/L4qDL08CK4fZuOnZReFiu8lSOUYhiA4ZIxEHaM6jGSynZDDP97cXF1W
63JpkXCo4x+Ix7j23L7lj2PmjmAS2Tr1yJwfUENGdbsiGPQfDq6Q+inewORROX+U/9Xm1t9Oq2/a
IF/maHclHwrq0cUQn3aKAlejoYtNXhNeQzje6gi4dwYGFcOn1LUHsBkqJeJNG0wJaskb8nws86W8
5JeyKIaDKrPx6pSWo9SHrKLZ2+LvRMQxT2CFsKx9pxPvU8himVynBZlJzKRnvrODBVe9bqnrca6m
dnmo+FcFz8VP06ctWJV4tQ/1KRcf22ROj5twTLkww4cDfL0bOW1K1tglfH5IaCTRN5HlajbFJb8M
hiFeI1LXwnorrpGy19kuSehQVLbnQoh8l2IKQN7URJgexf3cX+Puw+r5RuIZhT+aGBCxM+2y1oG4
Y/VsrhaGcAkwm7j9cEFrvjXtHZis2o7Xa6s5e/2x9WwTr76jYWrscF3gkrGdFEYHNKT575jqgK1R
A56Y6ID3qMDFEGiKt4hCAvxTPOt95QySnsoCNgyMvPM56DhGy5ohe8OWegTtYG6kbg8hS+lF72pQ
HH+AfOyB2qy+ZFOrjmKVA0Fj80an9Bf+u2K7nDKxWVF/nXqF+7ca1Yf4GHcnKfI5X7XR+yYUroOY
EHil0TWapI/XWEQROssvq+FXXauIwGF+3FqxuEcoqqJU2qhwf/Lg00US33meHL4VQPWA53i/u4O/
wuodg+qL5xsfq9casdpanpLBS5ksRw8aNrxIXRWHzJbWqrUpfw95K7GdFgsNDm8Sg+36v6n335ib
jB8udnKPp9tBOpRBXulI5qXEuFGV66J0CUZlOsf8xqsy3Hm9G1RSNbI+6jbymlQT/yZ9RJm1AJpp
i2OGCHbBBfbzv64BBOtPePHs99N8Upjz08MLoTt22vBDI4bdfBFPuF6RONx4MOgw2BWj6XLILgln
Jxu4SJuDoEuZLtvYOyd/LwPa/rXh+Sb9i1yEc3G4mRMJvqZMVzc/UQ3j4W394dmFySno5dcguUFR
uy/4ldCdYmSQGdMyiA3yHp+vMdz5sdBmIxWirI7O3wFoppfdeKFdXmf92OqPkT01cCDz16EAnkq0
VOw1IqRzMifNICLO99TRouD1fzfoLQtj06QiSnyVb/pHyob75jRD5XcHNK4VSIzSVzok3rAmUYVC
Y5b6qUX6RTqSYzfU148D5mwbUyXxdj0WVzMLaWAnwsUYfOPvfKD5/brgKQOvyAQduQZiU0yqto8v
nt0Ul2ptpKdPx0Zq5EMlN70w94pMXkAHiwT0FpLJuUq6HbbQYETcD63LMZEBnZwUOFliDhE42zMf
eaqGI8kxkTAEdNXboXBHb+5ts7O50M9QH13LcwFBWEQie/W0EUAvQQyWIFmOdb9L2dxeOPRK2A24
Z/rHOQ5Wb9vfTvho3jamN6J6Dq7s42ybUBifDhqyEaoWud25tDZB0/Jmcj0fc8MGQSmGf6ag58MM
G/ufU6WI3DouFAxN90AwULmKbwjQPV7w616jitxsiFt5kO3LYl0hKfWus2CN22aHMtBaZaEl/DPb
AyqWSHe48G/8rtK3cVkan0pRm5UMUYbnPxDbREy/hzu+QXVmxsqKcqMps2GlaNoJT1zwsvyaUOsb
BYb288WVXEjwXrVmXXy+tdr0PcYm018gwpWCsArO5m4TSkdMAnYx4tpGbrqsGUN6yi6aQlfWS0FR
MzAvpGmPJEzY3qxEy7+Wd73I3kPAcx9d9OTP2JptWXPFLnEgEC38H6zwQCCi+ILseIdmJRim/RuR
A/MBWrQS11xizDilUWOwhXjcE+MeiH7gi6RH4PJh5My0Ku1vGlyeIuDTpoAz1oghP2ROhmHDDI+n
aUTM9A4P7xBW3gyr3nFJXpN3SExI174W0L6xt5I9tzAGSbInUNZaWeJEPHKkGjSsY83BZMY16DmU
MyDxoC2APp/Tn1e4GkLYujDvAwIHh4/7SuRjXlfZac3n/NtIw6YS+7OXSatqgcbELOlF+3EnWaOT
QHxZLYLfJ5h41UD7n8iT0sbt2iBeKHqZ9Wr0lqp7bnqmYWT750DaqKcgavqzaKSk6pxQxs+Qxar+
BA6NBv83KNZd8RzGOKvSTl1c0inzonP85D9goizeCxo2+DWWBbXRo+2jSe1+njAWb8qDkArQff/e
yV9e07nVcXgGSabJoidcUwX3YHqfhO52+ZvKoqEt0XrEIb4a5+AWyWAIMPcxGWvoTgN6BeJRAidS
qQuzxyD2K+1TYxZd/NoTVqB7Hu1DfEUVU3CDCn6fzli6vuVbTYOI46nOc6hRWjAPexSq/cGD637P
/t7WAkxBX3IROZ+Jr9vdB1BCJwtXipqL+qjtFiYzkSRu/EkLvC9wZ6vteiFdVBvU4KtKohErN+IQ
X95lJtPPGthWtMKyr7HonjMDGF8UzTXwWg6FplWkupjrcqvgTU9xlBfXq+w4xsKnxUlTlFLMEGfx
OM//0IRL5HxxJGrlWiy2qzSWrcMVCRuoSVTfCkQRn/fPq+jJ8Pf9YOM7PLlYQO37X4mX5LTBDIOh
2nWkmwcjH18zkQ6pCJei9PvMjF6OMv+6l9Rj8McWQK6RtKGF+fqyDrIFkcmuYuHSK8HRJYuF4Gfp
gixhAltm3Sz+pubv6SU1NFSXuktbEGaJGef1IhbAs+gAtp2iYc61rZa3W9F8TTVd4MFR4vWQhGkE
PGSowMOGYLGqQhyUGMVndjA/fwy7dnkT6SjaFxqH/o8nVU3uqZKE93T6eHwbJ7aZCiYS0vuLwG0c
kC5W34YRL6CEcAV0R8810iHEFgFGSdu/VoGJBSZOJ06Ec7OUl6vvxz4kZi4YkiqvlGPEmc2dr+N6
KqKA2tCvhkweC9wSQ2HkbTj+AP7Y1GzjYo8lOTIxLR1Zt73Q3GGU2sqHyH5F1RxV3Z+ZHIjhKIOD
2SQmjY+LAlKvpHP9W26nWeVx110qAt/O1Jqx4UauLDBGEK0X6Fl+Zslx0H8F1dH9OqVCZ/oxFqah
QVTJgncJDjtTP0/OsiOhED11CWNVp1QuZSkwa3Vn6X3mXbHTnMu7BBXtXTVjyrCrqjdkdxnR8ax4
xknG92k9gQEzjcuENTmfpuX6yN9Suuv4cscSIJOM+L+UV9lN3AYYJzGC6VnR+E9In2o/OzS5dPcT
0du+5y7BqYA3ucGyp+OTgfH28nM46JNhxYyjYZLJErYWrVzkiz+SoDYjN2gRAYngpQGkyqexSQ5t
x8aWP33kd1Ol2A9WNZDsE7lTNmKClPDgidwFuQRUBZiDvaSJ8DjHDZb5IVvHLXx+sihPT7u+gSKv
FEDK9w29xQ9+inPDMo/TcUetzvlMGjdTMkFYieyFwoQlWZ15w5e3r8d8OA+H4xExFJfOcBKc7RDQ
HeYtuGMdKNd+rQAM17oGbxn36KiPbk+DPa2hBTIM42vbVKe7eYbKLEO7IIrQjAcqLok3F58nIq8Z
EtJh7y2W9PP8w0xYuwOZBSVFS5S5aiEA2p3x3ImTmsx8puSefFxFroeAdRz5DqBCUrb2nJdxoAJr
pI5t9/+2hLWWCzJ3tlr3vlKnsGgxvmH/NrfFRFR2UQ86dZH7Y0f9SvVANuiFzLz+Lk74SskY9N1o
OOz51c04DHA0t1ICOjT/NemTMGwLHYjFf68R+kFYtEubRpb/q/FDBHvm6LF1x/gn/wjbcmkj18H1
uvzrUkBd/OkZOw/ZDfnXcsCadTf97ok+CmnvSZ6tjmIvg1KqxKA/c9kyfnsAONFBdPBzP6pM4wn4
TsA5HyMbVdvqQC8zwTUJhzAO7hzk1tc3ra8cjUxm6+wLAwd5Ot6EcHuIY9BncI3cAiZegt/kQG5J
Gh+zMd5eCahrRSZFCBLqn1vyzkeF8+G+Ml12YwvC/VgnO9RXcL70D9xKactBzA625uaQa8eq9X9+
dUXHCKMLuKl5sX+T+nAhsn1arYZJgteWcA0xiAoEyxinQ26gMdux6eCmIyjV54WEAnErVnWBy5em
h9to1ffpqd3GWaNZZ7jAzcAEiiv750MQ6OBVhItqpX8dy2SgRyK1InE3hGTcfsCZjqbGTjs11R+j
2NCBC4lZuSGYFODpsyrosnaGyKR0bYAcleKIaSRWiFaav7b8JOj2+LvfDl6ct3Q9s/LUQYHyU4Ut
p86LuM1uxyPyFhtNX2jgglEkskKSGLaeJzNRIreEShNUpPyzHjOoZI5v5rLkmgy5H/2DXP9QmdRZ
VLZ7nezZkJjGWRItLCvWaZoc46Dh2X0GyLSGnA1cB1u1uDH0Ei58SZmJxJnQv0vdl4UT3Z9PzedP
OuyEaPBnOZaLJRLUItIW2apHeWkNufM6ptRlgxjNDHuADUHJ5cYUQNEHLx/HqnPXj28fLroCrgLy
L1uWjSTCRpgrF1ylQwrRnqOGF0X7n+j/XL5v+89Ed9evxNXzeplGguV41Wk8X49yOObCd+tv9nWk
FDkiaZfi/VmNaIvFU5UnokEOF0bNlwmD5dECs05YzotK+VpvsU9WKZH1u6gB/zOzCZdYD/LcXb3m
Re6GFNiNCxtm8TXB0pfBdSTNUb57UceeAWH33MiS1G3GUgIcEHXTsuNh7ov+SPBCWR7RYW6xwb3B
R+9Z50M1UXIABqSiMP/kXCVPNNtSj/aFNN1OlgD+K2/A1aMG+grtqECRK7dn84P4PBbj6UJLI6mr
wcJNCqHX1kPYCpLOyesHlUVWOl13/P049MkO2XUtElWKfpuJgBRS1Tvo9V7pAUG7ERf360oiurSW
hE2Iac6cZ4C1I5IHjlGI6pcHayDG4EyXZNeihCqiE49ocgIc89Y0G2YqpdCm1oH7IuVnCAus0G6D
jApZV+R4FkY60YDcq8y1nBgIVpqXkH1NfU4HxkB9EtOB4P9iPNo/O8W4K3YS4RNnex1Leym5DyoS
eNckVoXBNZ9BqIbFsLZNXr1+FTobqJJBZ/BuToMBDIZBtYkKJPExyPH8dUVwnKeYhs5TlKEe+ECc
U7ck3Jr+Rdyizl9SINOCn7fdKlI9hDPhxwfS7d4f1IUoAfJ+hv8fKDnEJX0apshUMMONLxVAfB/j
ilU1jcev2/w+6U+VX9DmzJpTIuAOYL8vs3ld/orhIrnsArcSuYWuTs2e29U416yyDSZMtxTgMk4D
nVi/blQ0JEEI/mKn+BcXXDrx2GupMwru8qsJHsD0/W9YJe7NLvJB2D3PU0g2ORx23RrL1Gc8de8r
a1NW1LjZKwvYokW+DYimB42HwQVqevwUjdyybIDmMyOxM3dXEwZnDbE/B24LVLAPmzGn4lwbISGp
69mjVzJcL0Fugz+9WgKIkD74OBntQAs7f5Trna23QtxInK/zEdFjXhzX8+XGf30LfqKYpAXnLYjh
PCf0iBiz5O9/z0hyidsMFz3PkmxmPjvbUryJT+i2MSdr1pCGJ7bO0ytQ/SGn0BLKTkzTa4qzIT0N
qolZUTVN6GrrriJkfuwd8WftnWolY+PGcLMDKUjyJRFPv8JMrBjB9IqwZDRESULP1LHRspDq/rTz
C4nWitCh1kNKBiT2sXX/sStTu78gH15MPEbSK3O1f8/W+9CS1yw4eSoJEdP2ehIU5p0e3mBhFVxo
kjcqs8Adzl7zgfeF+SwJUngIc5+spWJPf4X7jJxddPX9/h0jHvhJnxy0LxYXERZ9A4SfKdm3FXCS
Nri5bQXB4hIaz1/00PBS8JzaPtJrEzSiyL69x/SQZT2QBeJwZXEfgXS0AU1912V1ES5zOuA7eG/v
0N24h4+rgdHOWAEcDDS1Y4o32NuGSZetOEhpXwjaXqn64h4gMgMnHLEXy42jtl7ceUazJblpm7Fy
aMbXEWpu65YvjO3ILkeeSCEAClws5CwNTGZkElzo+q/IO9HRzv42bn6Sm2k8wyEttPs7rNuPguE6
31Z+A3nEr/fojRNzKnH7SAhRnMphd7i1SLMxJIfiR/2V/2GAskuEzSck7nu0JJXL4sO23u5QEW8G
RRkYU3rThejru5iXygfOCT7hjhaihHdG0FUTiASgbK4O7b14kF9Q/23XzpHwCxl+YjhQDJnuAMev
tJaVnGY2qUib889am8s+EDc4BRljEYBBuCHiPMsRvekaEPUu311127tf5yZIIbh7iDF4nYt9lJ5G
Ru5GSaAiOWzOJm+HboTeZQKsnPMlVa7WkTZKg4U1sfEuVgU0540Scl2DbmbKviWOodPKcVyWQ7KZ
x1Wn0c0b7605SJJpnNATpagY4X3uiX9FRknrMAksDoq8EN0bvqyscqfz2ljIdBLaJyjK1nQyjoeu
LxQ/2qOqkPEE01N6N7KAptlyqiw39dYBMOnn7BFLFFVzNGk+R9VaBC73k/6aqPDcQSQsF/AW2aiS
2n/HjYppzxOxqmaCIbtSNKTgjfu1YbMTSbPQVeLeGdJEh7dwItgj6ByjEKcn7iJeh07asJmZPF3N
LoCzaphmyLS1EMyMz9E6ct7yxGjZCdP8xvdsflFXiNfotwIYh0VCz9jB0fo3B3fwQFTYMCX40gfB
dKmSvbac/yTBBUpXtlCGpXov61eawq4WxZ1h7UOT+cxHGkchor3/UrGbkifUEhV/5Oj83ksm0wpJ
unMXeZ7ml1n2AfL7GwlzlEZpVjHkojpMXgj+AIFMMjPC4TMYVIBaUeSGXauyl9X7OOk4yU7UE6QW
5qdjw7eqyjNRPyXOhxup4cktwv3h4uT2PM4veX6Xf7niacFfxO96SNPOMQZ5GzcppU+d9ER8Fthl
XgiQFYJeOHBKFhfVZSsj7R47NQpHGd8kn59Bd6JwG/i/5+LY0VQB7tkn+dTgPI/XLK/27bJk0+sz
jAtGiUawQUSNvDMVBZP9ZP4v9isOQSt8BIEKO1rBE4VpNZfpONuSceyJ5uggZ1x6D69JcVs4B9y7
XnBB+LdBNxr/xhksBgiaPzkg+gySRNy0ZN+1KifCCK8gOvzv057wSSctGF7cYFfMfz8F3JbtI6a5
Vqj+FjFwI6dORLrCAC1+e8LXl6avleZX73PDK0wn/hNcGVE5DMOFHO4M9NkAlncLyH+FNGe0JcWS
WRKQbMYDWJ8aNGEvqqNo2xvvxgIE4iYRUuAmLlTr2zi0UJ37/cobKQkEEM5+cVbFpQ6zIJ/Bn1ls
dk+dnw2GRNHew1zJ0mfjcwjxvO+VrXmiOj2SqyKa0s6TcDVtVWMbOzPA43iFPm8EZtqw1Ck93FBc
yxVuf7sihhY1sLsg3fA3I7jB5/ZCBhGwA+iS5tQxzWsn8PKNM7/Z/1LAZJx7ruESOCxOetLQG977
quTfc7f/I/XJBV9je8fna4c8ucQMfe4bQ8s9tysBFvC9lrZBBsjpQGVkhmb9vyFxuKBTSRBvr/VK
joHeG0iCekItMc57GyfpmrTIlNHVCTb4uf1Lq22VHYbYcVN1fikJUHay8LUopEmL8Ap9MbMHL32i
uY4ZVesLkFLf2Ma8w37rJJTZFHxkO0lTY2dwh15o94B1tFV6LE0aMBawG/S5xEf9JtbQ/8n/QbM0
eYcFHEiLg1O//CoXLRDGzWLn8e1ct1Tc9uNdJyF9W6PQw1e2dwbw1nGK471S5QHSooF6JX5WEe7G
y2n+idos+o1YjmVhVLnzzy852UXNFBE3pEftS9355qP+4Iq6AeMK79mXb40tNaipRwV3Y/3dVjoD
YiZsDIcBJAHrcYJhLsy3OTy0GFTLV35bsosnI75eB379xHtmlJDdP/JbnSVAAjLWSlfYXlaqgIxY
kcjZZhcISXrbTgXvgE9qonu4imxEDXLdcF+d1sG6YcN6C01pGdJTUxYsBhEk2/TiQ/reMrWhhAMG
y4MfmxRsV3I1qL0Dbk9UYoSyjjfqqNtqtJWcAI6KMOJKfWE9O00xU8ImgQ4x0aQXhajeOvHLJ4EC
2wPtUOk8ybtGjz86mA8L6AY2OLMq8kGB45+scRBdmGj24O6b1wuzdtuz+pwh+W9UvLCRSLh90QWB
LAOWD38Hu0+jWq98GxfghcgSPvXbWtHCzLr3mSlqv1Ds/qID2kkhEwud2wYG0r+ZOFHSpeBtT081
syTs19n37nZ2EFtGV8j4b2PRpr9rwRME/8oydx9X/dJ0hjbuYYCcm3Aw7FpU83um/c4xPAHca8rT
G2tAlSH4TuJ2MF80teW/2m7TQ40T+YLXPR9QWpWX6BmPPO29f+HWXpO4zFq+RTtQpNlWlK4CszMk
ZX3T2Cg1ytLdhsWTos/JvS2YS5EeT1qKyd7RhOF7ou/0UXFd5llIOOb2+s+7yrDgHhtawo34uBIu
B31OOUc6THsyGs5Oqum/jx83M5o0VS94qqYIfCtd3RZvSVfEtqs6n2Fo5eeTgRupZBaU3X1LkTy7
OoxecEG5YEHMMg36v7fwezesd+OK0rDTR0jIFyDkEHEza+9R+cq5jvbHRcy26TlBr0QVN8MEDQra
lkfTbVuGh9ZEwp3l6AXSWxk/Jj7nemoTG5SnpjvhgquWzq8mhfeYmsRLMXSXIa7tVGzU3aXDkVcj
D/6hkrsKU0Itka+eHHKjz6esvL2fEAFaeqJ1FnYVT/NdG9Kzn8W+i22JZyeeZt/bLXVcF9TSntd/
DOHpvZqAcUN3fteCioOK1LVMMBeq23TgWEeSYG/PuyMa5S1YndIe5PWIXeqsA4aNenPXmL05HjmM
J2Nm0bBPaLtkNVKyz3TbVAb+fwOzc/Dn78t/kbQwECugA7NQVKdNhe1ypFqJrHHDHtM9tyXQL/nL
m5H3iFP0dMz7Ek3qs8mjMVFMeYb0UP8Djh2JlhUTuuLQqCGaaLUFQiX/yG3e4CCX/blEj3fg4Rtr
WA2ZL9GbIr3EI2PvBe+yVunc3CNuNe77cmbeDSXuHYOlZ6GsQ42oRZ/D719SOHLU/+FTr/oFkPEM
XWSjR+QMx+doX5eqiI8NkTZSmeFkZMZ0C4W1zII9Jd+4UoI9Hxy6CiromeBpJHxZfG2JLUujT0q7
4Fb63NZirV/8KGmIULpF8SdCecp6+S3RSzn4OTmuYWYqwmrzaQ31sUqFoBXISZ46SoxzBCnuPTEX
6n0xjRgsbk7OsWmyFglxcUlUklz2LN9AQTfsBBJzkwlXj6phIAiHaHPWYG1cT8IFZxCNBdlGTtOH
TTiMPE6P1S6VUIMdpoCQC2mQ2UHJLQRCSjyhOxvoX25dc/2b4g6+1ZdDZNCy5fFPyp1p2a10M05x
EImPDfTgDqHiFfYLkUsN9WlJp6mnI4rIqefUxVgyIJbNqYNaD0+Z3akE+Y9rLRzQvDJHzBKBdEw6
Br8nT2nKTMIcI0NFjgiCGnB9Pzz5dkbKnd8e2vjPE6RtNHRRIZ8Ue7Yq3GyIIAhQm21LEXEPD0mB
LoTZmJvYcalZqQCOqOMH6Z7EJg8bQ2OafLJtVLzWziBkAvFpPFJi/Nh0Zk8P0eyyhiYvtjJ/gPCA
ke+c0g0mCetZEMaHBE1P5AieWWiC/SD1VuEdAZ9MF6qVrFA0Fca49bYP5FqTbn+E2CMG2wOKeG/A
5HoZWT+QBoCCWuAr6FiYjaxUppAxS3ZEtGSi47c5lmqSwz/PpMS2xsxaJm7seGhXOMOICHVJGD0W
wze7G2GTzjTsN8qbXTL6lO0wq0IJFYu+SePf6oiu6+MAx+NTMwkMWoRzuWIZjHrGIEaWloV+kxXd
A3JzgU3d2CDdUsrxyUcDRym4ZsDBWsEkRY2A3HJp8VH/1UlbtPetD32ABWkhSvaqC9+/75Y+SeDR
4q3GXjhILObSFCHLF4GlGkNoEh19JgxOC5wTRae5wHeDVVbXnk45xp/zThbsO5y9ZoVRra4xOivV
CR1QzvssTrbdW7CNxQeWrxqPTYUd6Q0rroJNgjamvcc8+0+sC7rR2qfcLyz8ZUdKHgsRkdL8+TKa
vssMKLLQroGpI6fb9387mj5jgx/7rN0IUdrUV+n1C7cDFJ+W2LSbmlJLuj1h1ZR4q8j/RLhgT5jQ
ty3ddlJCAfdImu0Aae36jQy3ByIuz4h1ouugkbI+eC39vgMo1SD/qGtR8Ef13NpPieSfk3J0P/ZI
2lfMeqgu0626UTEho2yCva/Pl/vSo17Phqw7ndf6ldJy5zJ+sGQ+Mfaw/F8N8pA+PFZubIPM+hg3
vdjCHYiZfgBVy4a86PbykvZN1jRCofTGpduq5yNXNW8KOxKr+xVm9hjAySwe4Fr95VdSndYRkCPl
/zx5jMnW5J6aXg5EDwHHfZITXsLLycNEDhM0Vo2r2sIKAVpdr/G7k0f4J3JKcMq2AZ8cPgG/C/TY
0SNRcmdhIkfesutj3fNEl150GSYsPpub5LsZaI0EKDP8FYhpCnCIXPoYW1/lJcCDhSh46s5mI1yV
MDlSIQ2bhx+yHlWOVmiCyBA53ic+BDSb0atZ5FuoMt3/UQjJmO3f26Di0RzaEqpE+YTJy/ue+W+Z
cWYwZz+Lve6D+zp5Y2QBsn92o4zoEZi/Z3sDLe1aYLKI8eEgVZUgKPqjLkYqqmIo1aSWKoEKG0A2
u746xa5MV7GNEshwpuQJGXZO+0VZwYmINIIuMCsizh86i85647kqLP3h91TeQ+bBAbIkH5GHzRIc
S8wiOv2WOsnkLpmDNJKdfMYwayd6aJCSjV1+5gY65DbqBC2Y3yZEBbLvthViqZPRxR1Gc0HytYtk
ti4bdtjrMXpYhacmhmEIvBLoQMuFsqaX4rUgu2vhT7YRj3pRsnLb4oE+jxGliRPwBzWKQr+dEZJt
GPOqJjUWD71zkuk8Xho1gDaTicUGwPKTw+sFIubHaVryVWVzzMdSS1JH5WEoVOVsIa8+DugQS4UP
0Zd3PH81kvtphC4ts/SHYN8EaN+YpC7ooxd20nhTRoar5WMGQB37y63sxjzvAhMGN0LV1Xw0P02J
in/Es/VWZkTQdb6TkxBr80JeyXxNHOWyJqQ3kW9p4UE/4LAtPlkNmxBQaoHy23mAulfKmY3yPvFB
k/zn3QW2IpVre3MPp+C7OPMmEBMpH9pzVuZGJXGwIyVbQlzg5UdDrAHz8tLeTKI1U7/k0EF8FG8+
FH2tBJHv3XlL7lvfT/8CpF3TbPrbvPKdOyk9xFr1SI+8mmllP/uhJ0KMBunHarKOcqjNUgTNYtX/
jKvcn527IDAvbSD9QWUpFH1wX6ttw3YwISmhNlsx+dufZZZqAh7WSqhx/7UdxB9XRX5sFpaF+2D6
lsj+uwpCUibpKe2QSnNPnr1OP7FeYqc2QMFmJOgtblNi9Qy4plP9TbTSwEPolzGn2EcfwQNXpDBw
g75FLAxQXHVcMaHxW110WadZ22tTO3i/vQJNxKHWmJQKaTQOqqXxf/wg/hEIjxZaetdoXh6VDqsu
bQVDy4T03K+UKqEZ05GvtTLXqxcHKWfAWl0h/2+68QFaU7Cy4qDg3cH2YaYTUe+1Ocxb+WAM9LH0
hrCqWRVGPn05PwgaxVNCt2O6Cjc4Jbvyq4rQ6biJfEME+h4NfzxhHCxp47VCpxQno0Qc9QwjITlm
HKjPZzL9MLRn9p9BGWlkPpFzFrOOSiUiQH34mhm5pYAiEGzWJYPJgkWMVbQKmwypg59h+rh0BQEQ
df6RXPy23lNXg3GhxKVyIcRuDzqF94zG5a6+thaOMAwedU5O7ZUtvV8akZohuozZlhIKfBNtIK1Z
j7wmt91G4olziPYPgw00rZkxCSJRdHJPbbRtYOakPXdSxahym7fAwl79GB8PmXSE+JtcRUF3x9WE
Nluzhv0j1bNHvUk19OQD+Ble/HjGhibu6g+7hRNFS09MTtac6fBJYz/BZkiwyYggZkgEpfxGjbjt
2f6PRzBNI8nZuKXOOVRCPoJYzBlibGCN3joq4k5+jdYqce1XnYtm9cRpff8pAZnuA3J4L1SwwM/Z
BToyR22XapQA2+UZVMlKXbJXDWjjFGwsx/UTk4zP9kRZwfW5zsJE3N3J2iUL5KXvTnluXe5YaxiR
S1zMleJL84Yz5LUDTQYEwAv54333P70YiEn7yKSGQqZ7gKEwjNZXwRK6wW52ifVlY/uZ5y0VLdbY
y2rFZF5uSvyc1l/eB3eMWanTh2fKIwahbwwI3NGOSd0gmYogvMM81r/55BtImMHE56cv5ikCk8u7
MoVjOy8/8WDAniogrWPjIy2/ZervBZemSqtmtEf74X58bEtteXe5Zi14PyTkelmwKnnAsAXfRA7W
5H5ica7GRwxRPB7jOSIBw2xUefdwRy8TEdhiSrZeKL45xOBiZLzPaKOvuB7gkUUyybyyO3W3alGC
mJv+kAJz/BOP9X0F1eezlnDhjo1O9JiYoKgdNHL7QpzUT7KeZYBiJscUgnMc7nmu0sdEHbm+6BP0
jZ3pIE22pWjRjzxVwRlih7ectNQiL+oO9LRxOJkjlQkQVl4krEyVpJzg1QWOYQyHCPbztoZN8Ncj
RYpNGcKi6FXoaiGWAtSWMheOL5UqueZSMmNFzIhTlzc/ujv8ZaC4xAXLOanLipnkXyBLXVY5CImj
tFlZCqyrFd7iVy+UM3vqTGEUMPFpMhQNA1d/XPxh+NU+4fAQqGwusFggGF4Gb1dElRFsWwiakmSY
EGFCl0J8ni/VaWUE8JzLZm2JM9u9lBVfkUEzoQkLi5B8h5h/5nOf6TN2zQhMTsK1YDXobCvq+0Zs
wgJTBDffHfqk+Z/91MWaWwW+wfxv7d45Y5/pFVOKiKpCtBcdoEM8YDZF3jkKMRbFj1kBzzs15inJ
jYDn8GQBhv0VleuyeEN60BzoSE4hsiaClKnmrcd/DfXKAcnmLprz5unPn7VlBZgNAtBKuMLrI61E
kgCjWgUD3a5ki/lWx//V5Sp8FXRNsdNNFZk5WRcduLbOWcZDzfpSzCdRb6Z4wtOgIWuBmkqAGNtP
skYyOxXJRva49EOT1oFfbdIDjh402Pr8+cFLopiEG+njdFFRZqkB245yZEjLo1GjGLWUl2f7S+kk
pm5pD0j1otpkqjCKWtKcrqSxATBevTY3wu8p4MhKvDi4DPG3daXy8rVke2gXQk5dthxSAqu6i09u
Hwu6DtAWdN2lXCyIeQ3Nf2cai1ciH6V/rKsyRuhS0rFkPHvVJ1f5N8lCm/3xLyLH4kv754pWH/vw
aLAcGRKgO8zHnxoKh5KuKbo4BIc/MGdw1nLQMss19UhSiULqcG/Ov1iWMPcdiwHRocJTqiSEZYyD
0LxsVH+42Kw75K8+SgFN39FgUXVpknXhefPT12uQPEehTxecBFeB7paPD9PUBYC/TV/CWj2uJbm4
WpYfek+sqqWPMDeNEr+e30SnCYVvguol8aj5HUlGdKi/qFjj4cQmZSJoSqfV/2C9NqWmzK1fDFBN
spmKnkJZcAV2vjJmXHT7xvZ768p0R1dx2MGpv/qD0upL4dcZuKk0rHqCVDZIUDtwYlfeCD6bnQU4
KKXMsc1k9FjwHId5yOuy2uIVWjsZfyBnsAzJcRqfBkURwAi1Q0i/y/kP4w3+GwE6L4TFXgAYfyMG
5EZx4B1BJTd7ZSuP8UYfEC4Ox0vXbMlhcRbXWnSIIs8evD914IhVbiE/TLJUx23zc8OSmKtc7GDP
SLe7nsTuMSKpT6h1ynwIuKBv1XadHmGRJ6Xc+zetzvA9/02pH7itTt2GIfzxoE76H9Ab7x/3qD3o
fcs0Uh0o6BEB560WGVCFvcSJGpaxdcuBZTzGTUuzuuvB3LL92hQSVDMei5aJZ+tgkiWIaAzzWSoI
Am6/WzFxQgJnLzClLb8YSOlGMsRHMuYTNgfPYDPeBOmQT3xsS0Jq8BZqFxDIFTRGmxjAAz25ETZl
ihlUOiRNSEjcoXlQ+qXJ8remKclRZMzhaK28duqSwxVaGdKMxkt+5yvui5dYE8dRDG8t9M3y4zwD
aDayQBy4ZDTPFPXS+cxrA8yCSEBb7INjVZNWLV9wcOPfjeZXLIAA9hopV+g6T2RpmzrixcEKbhVN
AvDzvtB0C5r1ub3BtD+C3GMRjyEWM7Fa+w6XfPgwjDjvKA0t90wQue+BY5KXQ9COxb3NYzAZushl
gDhlbdnSHMqrhnNf8OoPf76mCiYY0Fm4L3ypqwRqUpVk+yZlFM5B2jDDQK50o77q9baCf3VBCDzs
+sT3a6t1KEujdPNkMeD2ab225lMhGb5ioJtHBnvf/gOQ3xwZMpA9oz8oLzOnI4WH80Zmw2R4AJun
qTn8qotDplU9eHr6moPwRNvRjVHEYWrsV6tnnnEUcVWcXEACs+QgbcfemRh4oGudeWY6+CVZBkYX
bYU+ioNltmDKVPacyt0kITryqdGQDBuHHEKdjdHjXOlkPEzzGKQb2owzblhVLNBO5pGGmTNcon0G
SEXyOXU1P/F4+MCb4booGI0sJ2AEcLYCuBNcJZ/7HqV0/+z1a/WuvYvrx93cTTMie7HqiCQ2Y+9O
Xn5/V01M1vVteVeMMIQp2i1fmPAEpy8MeQLR/CbrR9vF9LA6w0kcZBWJNrSHt8ckGbdSuGKUXgLx
RwQQRPb0UHh1lTUtmBn3k+vHsnA5gosE5BZZYU0nvQpmGe9fUIyc5ET7dpamtOB9bcxxKv+fStqm
SdoF/0bOYkvt0HnR0KRSj723f3h97u6nbIHbelsfAIih0iQKpHtFQ4DkWWAOotP5Dt9mVRGIWn3w
leXJ0et9fM1T20dcVjWk5PkBT+8YUC4kGuKApBDMj89WlYd2kXNd8i6ZDw+EWEE0RyzS1c06xiwX
B61b/Sg/wqMexeM7ODy14378bW355zxcd1TXLEeizt0Z1NHlgCBZ6M97kvfx/XBdONqN8Za0+Bb7
hpfrf4HqEZQdf4OgUN13oL1uHPeN/c0p36Lnmh93PPJJiA6heBE9rxUeKorHK+djWnBHIlsP2Evx
9zYSAUOKAqF91sNDEtXfO22eF6kACwOHiyMlb5EKy3DPibF/OBKWdhid7RILjoYylh06dy9Vxyj2
bg42dJ9vrSlbZvrtz5nkfYvrdHdZzw9xurbfBb7H4nsVs4UpMCFszg6ROAY3X/A5zZdhPL/gT83F
8NmTHGERDEdi4riZ4gj8ntYvw03ugwonB+/THttgRCPvQCXstijepkNI5s24bboOuDuD4H8ckthP
ABnDAgAtCpPROhWfB1Cy0AO0k85Kxe+WGqzGzl6yviK+2LbcI4Pt7+B6o1/+u9y2+O7ntBcdOu/l
TTgru3wu4SIp8A6g7g1RCIfUotL0nx+ojNqfR9hIKRxZE+50wNTjjPvpseXufZ4KiAzTO/VLxOfq
LL9JsHEaDKfKlUzRaKg8J2MN63TiqCRnIFKu7TLMnGlVXT4O4uu3BgCQwoqPGA8/L5ZYfwouXZtg
ypTdIWyut30bsk7LtoGybVKgIIHQ+6cqW1kEKhP3aiIM+GohIHiIoOMBpQ+D1ANBWD/aENYP5Cn9
RJBXJb5ucTbttvBGyZfmyF0hPPNfYik+cTLwIAib8QMVeWeHFW1XmEL5DeHWVlRj872Sxh9Au8Dm
hR903OSjfD4fmejUJWmXm3AxGuE5rC9BVT/1ldsrNSsCD8U0g5GLVltadhsg6t7ZR5e8eDoztvbv
ggFhLuwIZE4YkvCx4oTY4pAiz7I5nCNJS7mxsxFbyaEsnCZIeu3qAT2DsQTxzj4t+c4vLlGl93bI
8l0SZjab0aGhxvgK9zX2EoQ2Q2R6mr+79utlbVYexljwmHaYqV8fnYZqSMR75YDUS+h8TW27Nf28
jEvdu2zSdJGxquAh1if4yXeKmdZHgRvLRaunYmxPR612Ei3En/XaVVgQj1rEqFU+IAsXtKhSR6fk
3bFi4Ay1UIEMKPi15eGEVDuNhGfdGnRIPJgZVbvPhQdswbckTDXP7+wTw6MzQ4XxknNCRh7BeTgX
zS16Gn1ugIrZ97r+s4QT1qmyYV8r4MCYkQPD96VXf3mJASOdKv1ka7FDmsGQMTBy56bkBijZ+gqL
rve1Vih5kJ3J88LApUFXM0MSY4Jt/xZNWjBi1OLy/YKZmFkaZjf4wDJXT6pzyHlTyawV4tHEXK4O
gMmSN2tPjZEs7walvEQ7fKCd/RVEFRL7kZI9PbKjQyVwsQczXuBv3CoTN/nkyjZAWPNQxk2Zjwhn
nXb6WKvMf6MaxIxpS7ahmTjXKn+yYuZyHWooG7lQEOqvOPpZHhiKKyfs07c6lbiSEh+4NEPsHFKG
xVwq69OLV2UFBIxsjhhCvbaoOggVrVFtEdo7WMLGtWh4HTCaUsVDJMubCz6pBI4kIkvmSX7kfbZc
P9q3fI6vWTOW/DzEobX0xAAEkXPVEyxBm/T7I8WK2kevvxVbdhx+EFCqGgGwfYEe3jWAeIM0HiS4
8nY0VaDkNa9eGLmW/8XHvYYZxXfXHUiePujbPuXmBJ8gSzLqWsO4bPkkWoT/TRBEeVsj1Jxtiio9
GgF8TS2zjA7e7w7j/QpYMwL7mlTMx9MvwHtFNliaZ0NNaqwQxuGC8hTDE0QTcyNg7zorRYfdZyi+
JUWG50EO7vrUoCv3opnS0QElE7tVhUBO5xOhGXgNmzDRbzLVyUu8K8w8hTqzX6HDYXB8AAru9JJM
Ibquo/PiZG5LYrJU1I3KDPJYbJHAxaEtlLw5swzrVwZStcOP2+YeATntMlkJD/w/wVoj/ZiLdmCR
TvE4r17xlcWk6A+ZSTZu4qFixKrW1ApWR1PqSPGJt05IJJNacwMumABW+CphqIS+/ccKJghdrlqg
0WB5SfJsAmiwmY3mFfPbI2hAfv/usoTbb7QHvW2ZQD22a/r5+lfv3ob+c5NdXL4gL4mDJnjkz5rn
auNcM1Y6K+pmQL2/5KmkLIZP9q0Lydt6zqV/A17n+DNYWNt4vhs/CvP8r0znhv4rlhTtUjxX8KKq
mhLNIc+tdJlEqB4TKcm71oYZOaL5Lhm91XC+3OChcEw1/qLg1TdZFnASQ5OtiMawqmx7Tzqlocm6
jup+5njnAUcFz3I2Ty4P114HkJIDPQYxM/a0MPuR5+8TsTNC+S5BPz70RX1JfIbOV4udt60YjwxD
bcQoXRIJmqX4Ry4p87Y+MTmDbLPt569jcTT+RKFwA+VGPLg0MUtim3Mlo+b1/cW5aHBdSPmbxtZ8
ISOxal3O4Hg85jEWtULHOBLV3S/EJt9nYuhLux+xtpNKM1ct44AIxu0vUI1NntMTilDTsAx1poB9
f9btPOj63g8Xuk8sSccdeqK+Eu713/3GUp3tUlk2KFeLbTUoCcG1F5A/npMZzVxBXxppax67AI6p
67ZP1v6DhNZbxtf2u+tfS4/aeON81TzaMdsORVCcisBBsQP6RRrf+0XEXWOI5PlJ3sPSZjhYH33L
1HGCChB0p2WIW0tbnRTa0zZU7JOYwN285+aOV8/GnTf+NmAPHqxSl5trEZ809ojS5HNCZvOFz7qm
QhNj1deQp8N5M0AWo61ssSaUEi4A9+mc8Snhk6/aJcLNNB3EPn9p+45vaSI8apCP8j6Dt86EkQrd
9T+48IRMGYrkoPqRJkPC5yv0Q5jsIf+aCu8zap/o2i1Mg+AhPIhWsnmM3+Q7qcFURNl6zOD7J8Cu
SCjNOVBVfa9dEFK0maYJll5a5lNOvjtLqwYnJ7p6qpw8XG+5tlFqf8p3JElr/8lBNE9Rgeu4mIsr
hNqxZo4SraKwzUKyRdD+MXEJ48PYP5WL31mSfBp+kvLlCNkQs50xtjfFUIyFt6u/9LGbupLr3v+r
6YFc3KnWkdWpjtdVMeabg0M1acam/86R3GFmqClzFhMOCt4lEM3B18yi5RDB8uwOJ/aCAsuYJEtz
RqqfATvWHibpJC5SoyqEBvaseXEBqS39D924+TlW6I2pX+IKI+VBiDldh0KQi8zTJhHZfvLt6Hpc
+thHoQn7Onr17hk6Ql8rESfWQMOURzIxL3XlFCbSugFGbykyZqKdchVa0qhYmeA5bcFIoDMWf8FD
7mjHN1F8i3XyQ2PSptXQ/32+gHIVETwfM3+0f3eoPApi0uyzgSmA5dl4kDLI3Tk+/hfz8wYHPyIp
BpJMVUNA0644HHFxzafgqIPY0rk0Vxv56Qc90af+Kp8clWCthhXLVVN/fd4ZK/o0pzl4ETU60pYd
yqHP/AbB0Ok2KcDZwsMKXt863wlwd7X2qwEPwkaMVsK+NEgU5Jys9WuK1yj1ewLwlkkGyUmJDoJo
Yei+K9GQZgKlpne6M4aKdgASFRdEo3c+PJKmRdmOq1KuMk3nsJ9Wry4RgPS19YMPww0Imo1eJkBG
8uA1u5oajBODlwpwZ6viXvnwrajk27YRAZULHZNaeCp34ACjFta6/rn+ndd6z6Y54TjiJcZUpHZw
0sz5+uNF2Rg3LZ0TNU7loYGRUoDnebRn/YXxUt5tHOC1xT+5kndQUxIBgHC0a5rlpiADev1+TpK/
gF3fiDXw+OnhoUlvQzHwDXUwlbZP3NYDqkmLy1kMFz5U0fpeFFUXDDIZoA/vae4zYKTga/eeCpQk
EzKf2ibAqImSHNJ3oL0biE3nyyWXIRGVsCs7SFbYS9URHzE9l4tE/PsCU6uvDA2jcbdK2tZBHO6v
WapplriyyB907mpXm2VCUqRKK3nud4CC7cATcIwrYBFqT2cRQDlUA8s8QG8LjNsslpGxFdWY15Z2
PSKXBK2X1IpAUX9VEylE4lh4kdLgFY/djPblmZyx9x2SPMtS68/egaYkRy4y2nv+nYE4UH3eDJmL
hUaPNqm/jaJm0++pQssNS/w6SC14AWlPc9fSSyKtoYJJP+i2bJYvOHGfVrlCdHFo+f618JEI0pcb
MMCd5aS88F0lJ136Ml6QxVP6h+PrAz7xxiFPDPcwByS2ibWOZ/tHSk5UhRolv2aJR1GBBYK6976k
gr3XSR09NvP6cU3tGnR6AjCe84MOD7wefMc7ZDbniIUHl/ZFkINTEQ27f64rSCiZpeZB4l3wCD+w
ocWLYliuqyNZCERhXuSPJrwaS8aPdg+U8e6sg7k1wYMbPc/foNGm6ngvej4naKkFPbzkA9H9j466
IaAXgbdWRex6cAtLnnyyTIcs0GpJwGj4HacH0tdFjFl2PCuH2K82Dxkydjk5eM2usXXXhD9l+ZVb
vwV5aXxsS/yBNc1Lm+TNedSMhkTazW/r5ub2lfzNiVEPlyR78Dznn8nXJvMrDwz1SKI0LbJ4gnq8
hTvMaGhJV+HMuSFC1BlzNfPITOPIpZOVkOfezMnf5iMS5xdE4fBgnGgvDbYRac3KYV9gftc3NVR0
7ilYdq0IZsMdRzNzaD6tow5ur0kyFYAOTLIvgSjmWh2P56A5EZlZ355c6HEV5vKSUcW1r1pqWnBp
Y5lp+BJIdh6wx0ep05PU8D2U8YcB+guvi2+6aUOsoyIBO1oj7EGkcvn4XiYXbqOnTHEQ/fdd7Y6H
TGBGJK8bU3S6EypIg+eOpcr4v3SlX8/k4Wmb8N9k6NbZbI5AO59iYYD7AXW0j2cdQ8a0h0JGHhFJ
fFC5gioiE1DD9EGbJo0T3f+AjAUanMN2cXBUeVOQODyuPoN9INATDc0Qkp+ETaB2SqoWMX1eCNQu
jii4rbit/+PVWVeq0eS3T6n1UngYYbays5IOCl70nmZnqF7HaD3TfVYzYR7+V1+CppDxOMvBCmDI
4Ph3R1CzPwKi/Nu+q44Dx8sfdlvZc2RatnZVJqii9O0lXOrsYp1/WBKbnv42D/Mt8jqd73IyiPAV
n0Nd6i2+1Kh0QTA5n5Hz+GObJdgk+ZwORm46RpLCP2vcMDg0cyhYwVzfxZQMgnKmgu/U4UmWrw+f
Ho0TqC5bhMssYw7oxtu9PgDsQ9IB6iJ5eF8Hcdj23ELYHsy8RQy8qvZuMktoWC6zIiHBLZuF9H7O
GMVG3hLAFiUZszbhTVUQV+DSVasrlkHUyOeqqesz0O34Z6rNo8FOdkveIMpQ0slaGZBfB7NiR25n
udeaJI+1EE4LOD6b/2JYkrcv46ad/ZF2UB9ceMuTjuq78Z5HBGKRyskI7q+5N72qU/ylAGxKVrIV
BwTC8BG6zCH2Pl+xXAa3bRApGHGCWnhFCuzSHfO/iEMLz2fre7+yzJljjdjAKhWbo8ZTrsL0J6FM
2r4svS0fueexrABxO38fHWEQIq/4XxCUC5IG6oKNZdbIFgQ5iTZb1OQnV/TjuC2cyi30F6kVc2hO
nCdoJ4PI7fZTbgqZX/fn3HPibmhOPAywtJAnSP3nBDLSzeaiALjXoniq2Be5Imgqx4uyMZJ4swO8
zRnw+Dodpx3jzfPsRuPjbD1O/490vk2I/z6KLiO0Unt8VsxBMvTtp4G1DRRzouviZi+l2Gbmslbf
BzyrCQx01dEDlCrT98K8bYYxn4W3DKeTJ/8fazcn0KMrd+bJlU81SLXRFfHiGCk0nMNR96Jq9yRy
s0P14c+sJZaNLPzHr/MUK0zQdk8/BX1dgrXtiblZJeZ2BpoKTP87bWLAZvcb5GCx9DTA3E7LFMQI
nnineCYlrY3uFvTU+yUaDbzZFssbs8VUKGjsVQ3QZ7uQhcswWlFld8YhC6i6BGkma61Xau83Uk1y
2lbPkTPvTpHhGGn3oB9pylbxvVT9s3AJPWKCmiyQ4FO81zGECgh+W3I/m3XgEuFagy48tVTW4P7x
nXh035Sw1WrF2FKbIhWuaV+A1mnyKJYhGf0ZzUkOI85/SiiYOb5XrghBBDKP0D+kCyqXZAdolR1f
E9IdODS338GVN+CKebyWA2GeR8dR7s0D1RgG98UQNlS8oM6b5A9vtpA3vgbQORBoIvs+T+rnBsVJ
RuplKlOmZZy298GK8z+yzCq+4vvF/u2NGbtKFnYCZu+A4WK922Iysk/p3X3M2FbOmnIVk5n0vU/9
RJVLLPXRKI1CnZD8pNotpZwMBP0+RJaO0iOM+Ll06zOligfKOJScYEJhdgmtvRnFRVm/aacoiZtY
aVm9WCP7FGC19DJGvKhGMacGFVI1FG1gtp0tHc+ryQspBsTP/qyEAkM3dYAopJLA1YrULv9nF7xw
mtwbE7rz6pnmHogyQRV+UHFnp/nvvojG08u5LvVbejgVWOcGlfXbvbYZyAZJR6wsZHCAEViMa/Dg
yULtRGrqULs9kuWcsYzfXdUFy1QWHGUo2dtdKCLIq/U9eHrAEA10je6eFnr5JgkziyzEeO6Agonw
wz0IhUE/15eMmwCgw15OLECn9N+fucm0n/s0mahy00J79m8AKBj23TsOXqw4c+gIechgkrnVhDUG
TeKWWPeFKKS7OwxIBguUs2hKMZcRJd3HlIDpb820WPUoW0aZD6a8YTTxhdSe/NCNf6LWUK8xcaGf
D/nttN5hVMQtoTD3aaxiEIzKhL4ZS0DFCQ+o5lyy4w+4oiDLOhuGg8pjuIl4f/DbWmc4GYBzDx/Q
wy+n8bKUe1O9PJ0CuKyEjbY0gqqsQmPTkudyF29BKBL+zmMMj8ZxvFlQCC4a9i1P3HW4HgR/ZEXp
Lqqb5WfQCu7zTcdJ6Z2mTninPj/Ezf/s3yH6QNGraXKRIFRgvXOfZWU2Sl9Jd63Io4nh3kumluZ+
15qsr7oZvbVcvKNEvyemNsTDFx8lnWG3kDtjdADHQpuBsdsyqyXT9ekqsCijvfqRwOSQWE0RQ5G+
ONLmRMcCA2E372vz1CaOM8zlDUR6MCj+rjYVcOPqVw9Lq0IQ3GDyAkPuWurLkehLIaSYzM3WhR7A
EOKzDuTuVtJAXnJrl4b4jqRv18Yzt1k93YIum2M37ZjBJS6F7GQsA2YfjT/X4rajquwTuTj9LCQT
op7VqpPqcDOcg5ojQmiy8v7PKTm+Bl3L7n6h99CNPtbOBMcrKXgSWnfUhcEGZmMwTXb2Q72UmGpl
HSevvek7wKP3JfX00Z4qXhDGxBkoMBHqyiIYrH9hYOfAgvoYqX6KNcOn2pi7vXZiV/7E8tforYUe
2zlEOW3iZwU8Wk8alXH7WOMqt26W3R6uiTl2vOdBANa+AMFAPAxVZq+nH1bccB+srAPJIUp1462L
gT3g+8Z9+LsYzrNknEdDEoexgKWVswnEWeTOzGevkqAs+Yi2LIjLpq3G5zRNbO+yWrb8QQizxKHQ
PYhYWYcTKu7wo8RtWAKOhzU+a2LW3Ce24PldENVRd+JtlWEbC1XYVRXrprlZm1rLclhetRs727i7
qwWPRhvq9YM3gTb3rmDUBdkgb0oC3wQRZksfLTOLyXmZiKEIvA3Xmz+ByH15SrAqXBIJAaYkphc2
Fhv3390rPrOZAuCl4jbqzVN7dwrUobjNiuKtQVzx7EdanMekYESQgiUlOxYkzV6wkIcQuFCBY9sn
N0ORsDyNK19L9UrZdLF8aDuJpr3dsfsCXZlZiY+C4eCYn2ZN7PKZHjnzt9sl/Ivy4kDDhdhuFurD
Mz7Td6S3PRRBa7bA4ih1XFpICH5wfChpkyuCPauAwHm+25AGFBaRvuj3TXaTaeW2k0H2d6cBtCcy
D0CWTkk1Q4Skdk2sJgSFuRn4hu4uCs5RJtbODWAIbQAbSN+u7U9HgSLmDg2P2sOOhWYA3CIfgPzm
HPCAu7oVaT36Vu5VZuhVadZ1zaesGLo81Ma1jrBR1r8UB9cWWFk2NHOYTUujgOI0KoJe4kzrAR86
QydLns5fhepXseX9TCIk/S4gWRPhFbR2i/hjJIdxmrkw5vrFBDcTT7JfbH0XEl7iY7pHAAy1PpIs
fvkRqi4l634LA3WMCL1rMT1UtAzhtA9ECihWyWC4nDf8zw5BfnItG76si9h3fZ16P14+vIqjJJQM
NGO2sYH/uD5VrEfxGTcfkqdtReb+TNvqCMfoQETcETD7UmOja1CuHWFOKspjap6eVpmnpH6LQZ9k
WThnslq9An3ooDNhXE8aYiTlS+sWDEteSfRgtQA+HOuEziP2p76uL82By6seR6XkwVaXM1Qw5S/5
6duWxh06X7r9vo/SHd8s2HlTIJWWyJpMGEgdEXOaH+CfVpJDL0pV0sQf3sM2cbZE3wCoQuyPSx36
GGZQ7M/QIdOSBq6ktoB/pA6emVKnT6/c+Ai1xqh9CDanDjbsZ/1SuKWFT9e1bWK5vf2UeFC/S4EZ
JtnOwZ3PJYgVXO/XiDHHR7+YsCHplGGdR+LukH9p/qCxN55s5hHVvNMXadz17oPNl41nxDmIyKx0
xisvsiOa7nXvjZLdAIpJLbHIONN79sq6jsXI2bpwk+BVMXaR3PZLr09He9tg2k7DLfesmxkdJTVH
ZT0z4uqd/ngarLAZ0UQTetnFHaukNAgEPc4P5qiamiXsd/M8pnu4LL0rJ2KanDtXgcdj9rgG8OAx
CRIjjuEXjHP1QX/bpYA5rpWW3JPPWD1QTRFv8SPzAcZS2O/vKtdngPMgkGq+nsGiQPAidbwKcXC7
7u9xCu0BZAIehJwQ44KmSbasJVoa0dZ1dOmoMM19NbXC7eUV0hsK+3J0MMHERQr5S5xqKrZFVhHI
taSnVf+sPenUG8j9/5ChGJ2RmV1OFsJEkGPYt2GdPOsSZripqSEjdw+/aUwrjJiDxQHpi9BmzfiK
q3ihPsqwcpauSFg04Mz66bhGmelf+V1AkDqwTzmT9RP65FEzK+oaQloMmX6WAsURhgWFp6+ykFRn
BD7Isw2OqDZE/QF7cVUVdzaofoPbW3MZ2PkHwK0iKFgszpi6CnHy+mzX0KeyCm5vMxkjAMqYp67q
2+4Rl8WU7dHRDh04oDgTV7KfRWVINqnkU2cJ1MO2r1EBTRYAR87V67M1B097C3vU3KepyeFAd7f1
t8RrFI6TfOdyGp24mI9MytmnZnUyHqwzysq3hFY8TnBgXvANaJKt6cXgLtiLrzuudqy40nlL0GLy
wh7KNTNpqWChgV3Q7R7knnuzgoc6aiP1aMNBe0KTjZq7Ko3F3eu5MLyZQFmIJQBHcq7e56FKyoE7
xO8x+/gXxiuSk1VVaqmxLn9ZCteHh/lLdf6savQ6FBUUMnrrS8rLbsfb8OQLh7H6R5br45om6Q2+
Ssd88nWWUsDapdiO6JqX3D4UCg+TerFbqDn7XRjFckk9SyYoscyIDTdiklauMiOf1w7tLdj1mIdP
UzhjjwAPOE9N1O37qfbwfx+3l8Igagqre3snm0cip9rrhmM3JYk4Rs2yyX1/4ncTIj/Karsx22jR
IGhmV/XTy0mAfLjUx5CtKzNYpKDZqxQQdjNqojPSzcF+A9Eb2kvDfqPs4dl6RZE6uHUQ2Ifa4B+J
NXqdP0zKjmZRYKYAKp54WjzsxjekNYbhqqmMQICyehb5cM6DVaym/t14BkBoMxr6AknDcGzb2KM9
s1O0QkU7VAEU3LwQ4cXOGAXxFmoa1VIUkcLm8PbzolmvnlLCQoee8g5S1NKONoV9AqSV1pW2Y52g
9bcSWgaFBIpqD5GTxFJaQ6kiPZ5osJZCeDmfJt8m98x2y7IKiqY83nF2ZJKnam1/h9mYCIUfdxh0
NdYWxOkSpAR6xceVm38m5xl3SSxrtvbnfuLtKDIsLuuyds5tAHrI8+0sG7BPehl9PkVw9no0FpMT
0XQLqmKDc/8sqR9LBTXrQCVrMg92TUAmBI54EvxH2ZX7Irnu29UvkRMEW3+3Kx0bpJ3iFTyvT8Gu
dGRreGKeFeJVxPwGgj+262Rc8NWwuI4ecj2ksnJmvqtXIZXCzhImkt1ZwRp2McqmGmHmXj09rNyM
laoq0mEFyh5O8V0hpSBWPhqYr+tHJHmzqSleoKjzfz1XSz1QrnUjKeZ9cINqnrO7LzUFof5p/hFz
PNWj4rfAXZMOA6v7T7ow6BeqpOFbLVPUZEDis7WahITnWCj1ZixDACsiQXQY2J31pwXWoD6HKgsk
UPTd7qBTuc36aoVPs8fq/G15Sf5QJCAYwdZpCZMr7ZY07Hfw0jeoTetw+mC0BOkY90zu9SENQljX
EEWse3Ji9nD07Btq1fyZp5KrsjupSKEdmY3Q14gj3l7SKeFXCTu1SzcVUvyu5S+WJSRqI3puc9jb
/8suJyg1lX+TQPgzcyROeDdZdplic58WhNEnv23DNSMChXBmg8NRrNi0tZJGOI/AlmoT8tQMWcJY
pz2aMDaiuhSIQk5GPwSHVqH/omA9DpT+4qQFAbbiCiocAGLAEr3zcGao3JmHt7Elib+Xv7uBjCxS
KFQw5PAKAzgZXEq8BkVyiYkB4saHFc4w/1etOKmRsn4F+CkjqgMk1SsEDc0lzBinQ1Uar+TSTqjY
G9ZPUPf4Xg6RVsw3SewOMuxKK6INd0zX+rN5pvchMlifplykb91IdhixYYHaDY6xGW9Cn35pfVj/
c7AgoMxP8UYCQ23X5nNEMTtM+xt7q0Hv7vWQvGLSD9Npr5pWI4NkNHmTE9jidc5Bm5opi1q4Zlxh
b9Rgn4mOkSOnGbxXVH2wXr+WNmQdI/cYeQSA3D7mnhSrzzi6acrIdo0QZRhl69yO+B5TnVTa5azT
35zh1TXAEGeFbNuvMg6IH0tExLvVk8w61o4XtfDcoBTU29BXDQPx22rIBolJgR11yyCtb6TWSQkm
i0DQpiSB5JOYnl69hgZh4FYCuPBLKKBS3soURJhIDPSDRruNsdm5lJqwbhpPSbdsS82ao+Dx7efJ
Jxemmk2U8+QO+mRhj7Ef9up5xDmloUCwpiihbvCOOMDTbStKCY5pbpCplLWw09/xhHFOKidokrHr
bjRbwwlJozIcaa8hQM14uB8Em/+vMCpv6CQ210Dd/rm6+Neo6KRit/HOgGwY6eiFh169NWh/stDL
0ai3Pk5/Qx+vpm2XUulkOHJIfA3mGV3rCbITC6k66Y1ZaDInr9XwpOyZ7eUEjMff5pa3VT2zmm8b
aBpmTA0z7JtyB2fpTYeENJvZn0ZadxZO/ZatItpUQqSgCGx1C+7ecLuQmpFhwGIWOclA2ZPpvUNf
9he5unf4XLCXa2XlGG7oI9LM4z0NV2AQ2Z6euob9rq1r3Hul9wMsE8KJt1hgUduB2w16lf3FFo++
S+TE+DDP8HVc9kp6aqx4THNeopqzzrk+gSW/V9cUrDQejAni5veYqlG4pyvqaHmp8ci1KyXOQrww
m+Bnp3sgncPkPCkYYDF/WJkVKkcJj/3tD4GwSfeZdo+qcOhzoNItU55IIM3qjstOTdTnz4N8Z4p9
4oiwq/b+L8wnV66fDXhX2PVTSEk47A/sdlnbbQfDY3MS2kI/gj4O76Ir6AeKkdUZuHuCirodJPzu
TdOvpF9UyMvKg3B7DNqkEUQ5oFxoYu/OfSek7Zv+snUscszMXL9MQtP/6YTb6jYSvjk87ufcj5s5
jjAIKLetr5/Lxil1RvYsD6gJT99udPXE6L0VwLDQbGPObNWfzDj0XPvEE4EwLE+kSKrxSTViJ9WL
Y8g9yMHXVox3DnsFIKvwf1eM75GSem0/uGvYvG3X9FWpKXgW1KfhrLBtNKhmstgpyR2Ywj9mlOKI
L57K6MdPONe9yKoiRuGYmDNgdAsFGUnBr+u3xkMIib0//TI0Ga0FMw0cHzAVR5NO5zad+QeOYgBL
0IIHKbHzkkxNdxq5DlsRueMuXVEkXhRlMDlavWZ1HuGIGcC7WugBcpRYlLD1ajs2zZwJi5r83vt4
7AUgcgAuo3Im6d647owUDvVcuMzhdixRntpOrzZq9EMSwf0EBAdaRDRXxwLuoVYIY7zlSTtQxcJ6
urMFqCXPjbClMJf1s5QJlcDOJvBdBOVM4Aiz/jGjHKdHn/qbNmMxVvVlICQT2VKMCWlF9XSLulF+
J8qn+2uiUXkFtaVXYnXVUIXqeWzzhSZVjz4YkINJk7rMjO0lV9cG/Dsdy50HdVsyWxC4AUsn5wb3
zfZU9tyFieR240VJxE6jQQJYf9uAPY7cHtDpIKN9UFdas5Bcy8IUGBFfWJcoU2jgPPzvVkyJxrgQ
NGB7oCWkEzzXGk81yMmMUBESZ2FWh/Z0qYP4yPcZcar6pLf7/3e2oN3X8pExEI5Y3I6QdlM0t0N8
AoiWYNtP5A1B6Bi3tbY/m2M5gOtkXvzvpGEm4feTPiDVG+F9Sp9ABObV16brmLTLeEJa431oanD0
iD21HdawesHcliu80jbEERyX49ALzILZAV24FE+FYZHrfCpLRZEE2OahjK8oCSaM9BnfZKEr4yDm
m3quVK0OL8bSbwazQ5jHVnRTKqlZcgNsrqoPy59JlS5Q/NQaHYQ4hxahxdNY3VV4Sjq/rollppeI
nnGe0Mpexs+7nPHr3eTmwS+kv7wfHKNtmVB9TmY9H/AhERPMVmMEK/Fp4cLtbNOsL3iVhA5TEeZ3
KplXUomgZv8FD06oVxyIVMNcYD1rNYxBjhXA0uwqvb7l+OPshg+Y5IY4ha0VZ1t50XwMlk9ib/hl
Clb7KkA4wXUYwhaiVP6rGUnBSI5H8g8aMeULM0ucoJyvZ0ZYVhbH9rQ08HVshKr4BWoW+cm0cQcA
L+f69ZSEFx0loRb0/3MHSn8IWqc5P/0buQA7saUGLPl+RJnmLZ0xRq54ymwwWADCgEl/5IOyKZfP
cOQ4rBmmO3I65EvDiRAiU754JOloriEcGFLFQkKIfmuyHgv5RhzDdLVVaUEMOtmhjfmhvboOQQUX
dLJlA/shYn1wRWCRHvqPKFDEC7oGk/c4kle3yOMufkAYSHZqUZ2QQYE43FlIm0/72hAUiL8KU87U
g57W9TbNK7qozo9pHOFcSPL7RRoqneG3FHIsYVhDmbcibASw/XkpLoJs+X2kawEanxaYawx/NZhU
gzRKf2YMzhUfBoPJW3JTsOu1RctMsH4xDQTzclHCx0iUnjMnPifAgzihGRwm1ccVttns1ZpyGjd4
8HioFp0IP+aGUTbiH3xFEs7Au5oFbuGy/RzeYtvmIZ4xGAiBuBbBGL0UP7TpHw5bU+7gWfa1R3sD
xPNCGCglvYDRVVDHNjCym3hRxP38qlgj+apEqD7K+DuCFnDaxPLpiDwiNgPE0ml4C2205OL8H9yu
oh6x9JbI6c7VqK5zKhJmO8dk8ucBVE/tOioSUsQWWIG3TIUu2/DPGQKi9WvoTaf0gNvLfBPdVgsJ
La+e4nE3AX4u3VzqfYNyd7OsdrT+afolh/OIKi2Yovj/EqDFbNerG6SlXZG80QtjLVKVLSYYGMb+
jtmETdAwuVTqV+wKQtWBTcod7hGA3j/RcLvUfC8Etta9rgs47neyLozzwefPfEJAhnxMyOWGUE8C
KzypeNKWxaoU1KVKM75Hedg7w7LeM3qJdVLmaV5flu3WMYARKBI1u56qyY4Z2dIj2pP60gRD9Aun
EAJi7rEeLREgdrGE9mOT0g198ffXAsqk8L/gyzgz79+whKxCst0ecjPDptfT1cMfGtzNGxdxeixZ
iHdqZBItGvtPpOo4GuYQbox+aLs24QSeFCOkauyXoLCtd96SY+z6ZIRSu3/HhPrPcl5uRugn+fF8
T8t049ki72VblsHpR5anp+gtDKEvljhD+k/5nxzFdEtIYf7pZlxo8P39LnMqZBPUAG0m3+KySqhU
9T+HHM873w+Z6FZKufYW1UcBm+sw4gnmTdKBQ3Xh/tY2kWG8TLEATOunmGF2lG5xGjBnuIPBGqf+
eASHhqGv75nyE36TCN26YrAc/oX7vQ0oLaRaILlBuQWUDuJxZCsvDjfe8zm1N0csUo8xEoQged/S
cj3JCcTIl+welEEgp7s75MlnEGawK5seZvyLLxZ/LRiFdjZHBEt+8tVsWSrgnY6Xprj715deDHOJ
vivGalSQcXiSn8iVlKN3IE6ALRremkcVf3VuJGALHEfbDcNxVvTDIrY7HKRhFvCQbKqba6AKs8dk
62Ib+zzVNRemX5i3fMGZx9qfr0I6Wv0jR+Sxa8WSKxiF0gErHRztaaNSSEmirdj/Sii2zcVdLi9Z
SR4icIZgA4rJMa9GKTlp19BB6HkesUYSoivXY/obZ6MDXuldBj9lh/LkPpU/cSOE0YYSvRQvK9r9
Y7gNAPv6aYFjx9GG2GALOmvYSz6LbVjml/i3M43km3VgOhntLfQWgZNNuwKuGSz3vzWra+Lu8xNN
NVwh+u6nsFrR0PnOTQA3oMzuzuxRGGnqGpi0FRrGwGytAKGBHFkfb3dl2ZSB8VkOciGpbUHKfJ22
ThCMRiAc/rUnow+I688VTZsmI4peuB+rH7IwoIs0heXV9RDeIpZGMdnoITpL4yD19wBPxSi+d0gF
EyBkc8KIbZ8pY8rRnAnBJ6JjajyvyixHLZl60Xh45WjE4gu+yOufuZjB54jNzJCQ5wBwf6+SYNzZ
9jeX6RVc6TsROAp4RafQLDU0B69LPDsY2Q1hcF7I1Pa0v8Pk/DCgVGbRNby3oFYghI0spJH9mOzE
A9wXOy5aBnGAzpR6niRQeqDEyiVLSKoMMM0kjpwEYfU83dRM/3c9mrHAbEDsvtLHVWBikNvm021f
JyHz5Ubv6OaHTkmur73Hv18ZQqCoemFJHmKi3d3pc8/xG5ZyzX2DDJWvXSDyTVQ2SQLI2U1Y2RDa
yWdFMNdwByM+ZFyEDhCr/2sgTL0MdMZoz4a6oiPbTknFGZe6/JfBObolJnF64dBZEhmyZMg9bNoV
M/GhYFdtwRkj6hIlYUQgJ9pn9w5tV2PY+Lahc5wtH3cCo9BJvDAdWgMJFFgrf8QCq55lLtsy1cQ2
8bJJQNt86pKHZmhNIUcCtaB1vKLiM1E+CAZr0oIkBBJXAZ9orOhFLyr0g3bx4BelA2SYqnYKEIx9
q4uRmwpke9iptr7NH8CPRPnm4KJgeVVFYr8Ri2Oh8HRX7rFc3WJdWUr7z7/WZs0y9hHglqACVGC9
EhfEi4xSUo38DYqcZWGkCaBkHEkzmMDOZvXVohU9joGVFjjMO+OYDSkp0kZ9MPcCQVZ0T9DyyFQa
t4tqJf+CZxn3E58sPZWJwNlDBLHpubdGJt4KZNKRYf+MMa3ZvizlyjOnkejvGwIMUdXUX5fdug5x
1gsP8u2hAWmJ5uuh5BYIWLt2NaX23/XB3c0dgQX6GU2XrSJJ039BVT860SNGGXfvAyl+shT3zh56
58nyschd77Qr3Jfx9Zyo+YYtfsBp2n8sK8xbThxexdAP2xDMlJG7GkvQBN2Xtm4Icebsax3CEnUB
yo59K/AwVCFZCM8WeF1WXfUQRPkYp3mcnIYpguVbhRec5Nx/NIoPcIgu0DeoD4pjHwOP+oGl1cWh
xrBQBcG7y2B5BqM7ovSoTj4Y0EUZ1dNMbucQJ6hJTa0y8aHbd+3wLIKiie+l1OBaCt7CocvXGR0i
Ro4hga7IRLuBtVF7PeTeaGWGnt6X0i3/AA99cVmCJhbIEW0UAyYRPod/mTaxu5A4qosiSN8RSYpg
IOhjBI2Da2f3KRYInQig7f/ea9jlvjLQlh3WdWpbjLEKEHElPd0YK6S7WmGjZ7Pz+/l6en3wFu7v
ufBjSvpjYufYJRxqBzuwwZ7HtDXhD5hcFklUYZEOjwP5o0xrHX3PleQoe3pdX+kTVbiorf0WAagC
2o2CxZ+YVrMIeltYMUairWplHhUkfYW4VP3b0cIvLkVquM6r1y0TlaSnJGnSTRGyPW1C0/H9bqN6
/Ho5Uciyx/0K1KedMxqtIFD3scvsGCafFQGcNRdszqFWzGA6dzAE4dwVom1ZAZmHuWsznFEjFZCI
/oEcbeaFCo9cnISpjogKI8LjTjsNCBK9/kJXX59Z6pucVFcSnTW7tAzsskfuljypABeoPvd9rcBh
3Q2N0IO3aluqaVk7tCM+uWwqQoz5XVOEprvhs8+09mWZqL7HiOS8HlpKJNv44cThx+ziPIKnfznF
seZmnnGBvUB70b0qHHNb97dOw/hi2Q11kxJhVuSBtkMoN94Pf8TOdSqxxw0TaCoZzHvufy2kagNk
PIeoCajEstMOQN4JErYhtndTifDZG/070uvaSfKkVZk7ZyLBdGJ1d+/NRz9hAsOmQd1++jukAvYV
FfshNKBS6FcoflLvooYRuVc1xkfSU/EXoFgDtHaSnWJpK8vkFGNyCPVV8FnsK+YitHu08TUGuRXg
kEk2tXOaPnYP2PZrebeFnQuDD6iOC2/Hw2pyQ4Cj+ckCWMFyNVdzwhEHgVRooPtCee19tn0XGgeI
Nhi0pnwu2gbS4/5G4wlqVHZCcsD6Fns84RR/0kFg2lTHK7l2HFHLFenqP8KmTKHBW+fbiMRyFirS
eIF5oUtBnzaVEF3O0oZOYxVNXNLkOmy51wQvwsRaA6qUmh7RiFejQjAcuO3OQFxbxmKhsj3rQeCo
vDDmgRmSZJ7ZsBQB09SxsTLt/StRvtrQBoiae9oGDBjStCAiXOocko5Czy84eZjitCBbBcdcO6bz
esehS7DNFZqzkoArEsThuBhMM5qTaBDex7364CIDH91fkD6tjesC3hciW85rATPkZjUusGkHMCDv
DmWUs/ZznjeFEezA4MYIvLkgQte0YS9htraYeGl9FX6e8KuSGVCyt4WvQyNkbyL133l9FXztBehh
F5UR2gXPG+lhmUgg3N3NF2GCTTCOoqIuBID1TthDnzM7XJ419ey1q6HODRRX7bEGZ4vGrswxLwQP
7fWuwbRNLTnyisxyU/T4uSsH3vAnQPqaYJK0yGyasVmvEgNT6S5Riww8dbDWxzk+l4TiMUJ8nr5m
jepysFiHWUOFFhF2FGSgs6pwt4a6OaJ9joQAAACUAx4W9cF6kwABtv0Eydc6qwALprHEZ/sCAAAA
AARZWg==

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="mdadm-selftests"

2023-01-24 07:42:56 mkdir -p /var/tmp
2023-01-24 07:42:56 mke2fs -t ext3 -b 4096 -J size=4 -q /dev/sda1
2023-01-24 07:43:28 mount -t ext3 /dev/sda1 /var/tmp
sed -e 's/{DEFAULT_METADATA}/1.2/g' \
-e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
/usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
/usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
/usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
/usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
/usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d/01-md-raid-creating.rules
/usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63-md-raid-arrays.rules
/usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/64-md-raid-assembly.rules
/usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/udev/rules.d/69-md-clustered-confirm-device.rules
/usr/bin/install -D  -m 755 mdadm /sbin/mdadm
/usr/bin/install -D  -m 755 mdmon /sbin/mdmon
Testing on linux-6.1.0-rc2-00211-ge087fb7cbc50 kernel
/lkp/benchmarks/mdadm-selftests/tests/19raid6auto-repair... FAILED - see /var/tmp/19raid6auto-repair.log and /var/tmp/fail19raid6auto-repair.log for details
Testing on linux-6.1.0-rc2-00211-ge087fb7cbc50 kernel
/lkp/benchmarks/mdadm-selftests/tests/19raid6check... 
	ERROR: dmesg prints errors when testing 19raid6check! 

FAILED - see /var/tmp/19raid6check.log and /var/tmp/fail19raid6check.log for details
19raid6repair... ignored_by_lkp
Testing on linux-6.1.0-rc2-00211-ge087fb7cbc50 kernel
/lkp/benchmarks/mdadm-selftests/tests/19repair-does-not-destroy... succeeded

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/mdadm-selftests.yaml
suite: mdadm-selftests
testcase: mdadm-selftests
category: functional
need_memory: 1G
disk: 1HDD
force_reboot: 1
mdadm-selftests:
  test_prefix: '19'
job_origin: mdadm-selftests.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-hsw-d05
tbox_group: lkp-hsw-d05
submit_id: 63cec863f26707d3d465ecb0
job_file: "/lkp/jobs/scheduled/lkp-hsw-d05/mdadm-selftests-1HDD-19-debian-11.1-x86_64-20220510.cgz-e087fb7cbc509d8dc2da3baf20651308a9d4066b-20230124-54228-wnmuvr-0.yaml"
id: 2fc81a70b26b340ec08b0f5f69d81607236cd8bd
queuer_version: "/zday/lkp"

#! hosts/lkp-hsw-d05
model: Haswell
nr_node: 1
nr_cpu: 8
memory: 16G
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1ER162_S4Y1KZEX-part*"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL41710019800RGN-part1"
brand: Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz

#! include/category/functional
kmsg:
heartbeat:
meminfo:

#! include/disk/nr_hdd
need_kconfig:
- BLK_DEV_SD
- SCSI
- BLOCK: y
- SATA_AHCI
- SATA_AHCI_PLATFORM
- ATA
- PCI: y
- MD: y
- BLK_DEV_MD
- MD_LINEAR
- MD_RAID0
- MD_RAID1
- MD_RAID10
- MD_RAID456
- MD_MULTIPATH
- BLK_DEV_LOOP

#! include/mdadm-selftests

#! include/queue/cyclic
commit: e087fb7cbc509d8dc2da3baf20651308a9d4066b

#! include/testbox/lkp-hsw-d05
netconsole_port: 6687
ucode: '0x28'
need_kconfig_hw:
- PTP_1588_CLOCK: y
- E1000E: y
- SATA_AHCI
- DRM_I915
bisect_dmesg: true
kconfig: x86_64-rhel-8.3-func
enqueue_time: 2023-01-24 01:48:20.090371886 +08:00
_id: 63cec863f26707d3d465ecb0
_rt: "/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b"

#! schedule options
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: e958982e1a5676a7a55232c1a14cfe1c0afb8208
base_commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
branch: linux-devel/devel-hourly-20230122-132105
rootfs: debian-11.1-x86_64-20220510.cgz
result_root: "/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/0"
scheduler_version: "/lkp/lkp/.src-20230120-005037"
arch: x86_64
max_uptime: 1200
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/mdadm-selftests/1HDD-19/lkp-hsw-d05/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/vmlinuz-6.1.0-rc2-00211-ge087fb7cbc50
- branch=linux-devel/devel-hourly-20230122-132105
- job=/lkp/jobs/scheduled/lkp-hsw-d05/mdadm-selftests-1HDD-19-debian-11.1-x86_64-20220510.cgz-e087fb7cbc509d8dc2da3baf20651308a9d4066b-20230124-54228-wnmuvr-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-func
- commit=e087fb7cbc509d8dc2da3baf20651308a9d4066b
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mdadm-selftests_20220515.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/mdadm-selftests-x86_64-5f41845-1_20220826.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220804.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /cephfs/db/releases/20230122211459/lkp-src/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
last_kernel: 4.20.0
schedule_notify_address:

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3-func/gcc-11/e087fb7cbc509d8dc2da3baf20651308a9d4066b/vmlinuz-6.1.0-rc2-00211-ge087fb7cbc50"
dequeue_time: 2023-01-24 01:49:10.076372723 +08:00

#! /cephfs/db/releases/20230123111540/lkp-src/include/site/inn
job_state: finished
loadavg: 3.04 1.97 0.84 1/192 3403
start_time: '1674496212'
end_time: '1674496463'
version: "/lkp/lkp/.src-20230120-005110:3637c1aba:678144fc5"

--fg2Wa43YJNw6PR+g
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

mkdir -p /var/tmp
mke2fs -t ext3 -b 4096 -J size=4 -q /dev/sda1
mount -t ext3 /dev/sda1 /var/tmp

--fg2Wa43YJNw6PR+g--
