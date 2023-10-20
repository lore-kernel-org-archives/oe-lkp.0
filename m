Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111C18F5A
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMyjIyta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808236; x=1729344236;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TbENVZ8Br7MW0ZPws8USQOYTlgh3cGkoSVPjSUHExTY=;
  b=kMyjIyta5PU10HtBuhYtCr+KCbDOCPQlAXkxBLv0vfqKxXljpFQHg/CS
   eztIWupgwnqNEsSKAdxzt/crp6zJf7f1YzhIb+vUH1jJ5wHG1rMbKBqPl
   w/sSEw6vUA/w/hq5BfZNYOLUXBZNO/wjCrgmxQZPEXahFzeOgCyaUcjG3
   sNmSJ1gWPmvX0VVl/BZuMOF/rr+7n86s9b2SXQjAjejcOJ00ur2BROsjk
   iHF5c+tpb8dvzMVzxZhCmgGyYnfBmv7t11AOmAVJMTETDepeYeo8TI7ht
   BG4CJSJ+f+MpsHmffzQrGLFC+Tk2cAhrMxjRQJQqEPHTFpkJr6/6mcpNy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450721189"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="450721189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761051191"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761051191"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 06:23:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 06:23:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 06:23:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 06:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDFEpzxPQK23+Ux3YRkl/19Urx4I6VhP42CsBSAk03u4jRE33vE+vPkiufwF9XjDe2Z61KeDacroFInQMuARVeIVp6BIzalxGkbM74yuRRtiQgPdkzBHfUFOes9lrJ9zH9wH1mkgZV2sVXD1Wv9ymuryjhsQ034kAFzgBdeQQ9ZraIGYPz3blqFItLoOkSbS+JVMLZT39neCNbUtnBg7zwGuWx/mb8TaSpopVdMt3WtEPelJFc9hY79RzvligYdMrTk0QG6aF0E+zf2RTv5VP+D/EsdQDGPePHKbyiBKX8wgWq0fib2X5e4/18Uiu2yNgLkQfzAdkeK4mji+FO/sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rdoI5TPvN6+so0quTK6h2mWbzO/XrTlyOzjboExmL8=;
 b=ZiOFoRw3iP4gfPb9rGetCEe7/mviLGrczZ8uvDwHXUucxOsF+bWpryftc8MG4E857RZSqHpvBZgD8ZLKzNF3fdPziKzG3djz+Od0ECcJK0lZuuDJ1ox+0uKzLXMMewgYWQyO2meHO81C8rU/AL7v2mFJ+otzKAjE/xqp+hbgi3mkBbfENKzqpRmkucopjuO35bTPJfC77anzJbOyyQIm5ABhTei468Hh59NkNhbvaiN6e8QA8VGdmAIiGlZHVA3TQDkeZ2Sqnoij6u1Csc1Dd2ELxLPa4Nx+xAgS9P0BmmCqBOs66CyA0VI7Yszx9NErvwwY95DMLPT+ac7FOWIDNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:23:51 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 13:23:51 +0000
Date: Fri, 20 Oct 2023 21:23:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Suren Baghdasaryan <surenb@google.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v2 3/6] mm: Handle shared faults under the VMA lock
Message-ID: <202310201857.d7db939a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006195318.4087158-4-willy@infradead.org>
X-ClientProxiedBy: KL1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:820:d::8) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7734ae-908a-4d3f-5110-08dbd16fcc76
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFIcAdXppazGz0Qsuy8NPROlSJpq+/qxHPQxJ19540i+WEOqyk+6SckFLplYAUdSZxIzlrxTBc83c1wc5GL4vkTu7Jc+2u6rmXUuCZbkSoZJ3icGCdcIBbVnpXbEuodVkJ9vW2rAxj8IfCiwJRV87e9oPGw+dspC3c0kLC9JYvAaGGz9hPQq3O4HJDxO9Os8MPb4Qc0DUXVgMPpuWM+BMXL3xzbGQvMwvGMSdrOAV/ap/uWW2G4e5QWPVX2Be+t6bA3RsT91RtgV6h3Fqqhmt9xjGsE36mpbgN+ZdYgIIe11GFNAGa6tn3YpfpMhcBuzZtYo7HEtBr7evpp/u5dTqJD5EiJitUmst7UEwP//uW9Dl+wi1ySKsXKoPbCGEeAwMuPw0nkXYTo8iolQOyZvEt/kzBnC9uaeUT+E/vXeH/LkbxEoi8ouU/WnyRActlHpj3CGzIsSsR1OCAEwLIK/m4tyRrWzM+pnw8jcCrfnO5WaD2Pqxel0KTCq+IUuhjdVvZRDqbEqwj/1FmYGNTmBHdrgDbduBMTSd7fKxB9So4BAdiYN30NeRJO5pAbXscWxK4N5UN6EBaaWxDkVu8uYhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(30864003)(5660300002)(8676002)(4326008)(8936002)(83380400001)(41300700001)(6506007)(26005)(6512007)(38100700002)(6666004)(2616005)(107886003)(1076003)(86362001)(36756003)(6916009)(54906003)(66476007)(66556008)(66946007)(478600001)(19627235002)(6486002)(966005)(82960400001)(316002)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Kp34YfOJdITDZ5BV9sZgXr5mspoRNSCaUV7QHaZqz9UMv8RZPpcu4Kuwhh?=
 =?iso-8859-1?Q?k1JAJH6oPgzS3QPh+ji/TBFA3k9Vbq7sJ3n5v3z61ZOgwUQj57KqtSmP4m?=
 =?iso-8859-1?Q?Juy04bIvxwNBwYsZV22IqvneaQgfTfFeM0YoflFwk6U81JVB5FXhuWYfyS?=
 =?iso-8859-1?Q?RmD5h/EDqZyWIWIKEqHVFlWkRQ3E6ldILwb0yapgJx7a1jGwm+7en4O1dM?=
 =?iso-8859-1?Q?K9gPCWDF/QXQuQl93eOfCks3R3GaKgMmPhsAmSvXMlOTdqQurhNPi1qx+b?=
 =?iso-8859-1?Q?gxEPLi69HG3szqw//qSnLF8kfHIhY1fMWmpBnTN1WFpkliggOssibC90Jm?=
 =?iso-8859-1?Q?kZhbHPvilGYUgWAnco2hCyZiWYbi2IGgdYW9nkQ+CmZQTV6CylMwIdPmtu?=
 =?iso-8859-1?Q?VBC43VBDsrC2iHyqJSgGiJaGF5/xbiSeZw2r+grhd8bJywdLqi3XIJctEG?=
 =?iso-8859-1?Q?1aufWa49G5ZWvIhsuHytvCkUBu6U9c+K7ZkWs7glh0G4WVJTS4xdi1QTjZ?=
 =?iso-8859-1?Q?olmUyuaYNlzQyxgUwQ05L15KeHIFZj+CyvHP4JXtvaztimQ16DgAcuTnlo?=
 =?iso-8859-1?Q?rZYz9Q6G7+YBzBzDpP1mMCDsQZZf0ZqQJ8IpuEej5u//YH7nW9wqEuF2jD?=
 =?iso-8859-1?Q?U+E95JxF0BjHIt/5Vi8ky8IXyA1fIl8+wQnTmS+RR+ez4hE0nwSHgtw8JE?=
 =?iso-8859-1?Q?lV38lzTybSgNC6mjogpwf+s9V8LE5aNC6HRAgRI0oUa3m2ci4JxH4cxf73?=
 =?iso-8859-1?Q?tXZNEm28YZkLC3q6BIV9n+4ivmma15v0Dh7pY+bG2j6zOAYezYNjrGIw7o?=
 =?iso-8859-1?Q?2Z8OvR0KMWeyzEKOddzTSZ9foiH59IJ/S1/KcwwbTalXlbk5Cp/XfVfjiU?=
 =?iso-8859-1?Q?Ao1o0rxjp+BJq7SE+BzBIqH/+WSyXrF53lOQ4Z8NQbNFDxbzpwHkR0JSH8?=
 =?iso-8859-1?Q?kF7CZq3C859biFoTIcBjbHz4iANTo9Ld0lT4q8y5zL/DLCfbiRPpMCSfx/?=
 =?iso-8859-1?Q?fNoZO0LILY/X6yB56Cp8wRbI5PapQy6HjGhtt1MDeymxuIqzPxaeNl0Nzs?=
 =?iso-8859-1?Q?YeA3sTf6Qv2A56NA2GNMAEUJFV5bQlkMbqTzTrewS8bJ8MuXbA3bc02wqr?=
 =?iso-8859-1?Q?TD5RrsgWpYF2EOkr/ccv3gZVl7R1YbVkMTPCyhOjXjI5lLC3dg6iu4Jlte?=
 =?iso-8859-1?Q?lT89Bb2DnloLGfe/zK3R9czp693tqPbzKoreNOJsP+w8ieb1gIkwUltJ/q?=
 =?iso-8859-1?Q?dwZP2hGH7sPobCPTxMi6TbEdMUylFmXzUcbaAglU9Hy+cmWuTA47HqR11/?=
 =?iso-8859-1?Q?Sj1DDj5NJLcnTRTg+9G5W9QeRxW2l6XrbJiqlGt11NNFtiBGfygxVuBrTV?=
 =?iso-8859-1?Q?cehA6+aZjrQR7qjNjQuHQ24iBWNvdF8vI557dqboW7VEw3DFyLNEyXneUj?=
 =?iso-8859-1?Q?RI+9DM7sGAcsii6gGeSpN/vCOf8dfhF4peFo0UbgslvXlcSTJSp08QO44Q?=
 =?iso-8859-1?Q?7d8TVfMiwXMVRzgGQyp9dvmckWCDdDRdTntgeQ0FVj7z9+BFxHlLvmAgfs?=
 =?iso-8859-1?Q?a24vXpM3WOKEcmLVUloO8IHwywF/QTU3jgO2oM8IS6K2OfrMwJesz3TKDv?=
 =?iso-8859-1?Q?znluTCkvCRfWQzJmLf82JM7jdwyolxTKgO9+S/LLudHTwxYewfThT5Gg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7734ae-908a-4d3f-5110-08dbd16fcc76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:23:50.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1mAD0EAyKYo0TrR0cKDKpV0EbSdGXfmkHewThR9LPxrOaj9sYLTmze/LLi5zUlmVWlEeIZdH0TNUrU6qSCbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 67.5% improvement of stress-ng.fault.minor_page_faults_per_sec on:


commit: c8b329d48e0dac7438168a1857c3f67d4e23fed0 ("[PATCH v2 3/6] mm: Handle shared faults under the VMA lock")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Make-lock_folio_maybe_drop_mmap-VMA-lock-aware/20231007-035513
base: v6.6-rc4
patch link: https://lore.kernel.org/all/20231006195318.4087158-4-willy@infradead.org/
patch subject: [PATCH v2 3/6] mm: Handle shared faults under the VMA lock

testcase: stress-ng
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
parameters:

	nr_threads: 1
	disk: 1HDD
	testtime: 60s
	fs: ext4
	class: os
	test: fault
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 274.8% improvement                                     |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=thread                                                                                        |
|                  | nr_task=50%                                                                                        |
|                  | test=page_fault3                                                                                   |
+------------------+----------------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310201857.d7db939a-oliver.sang@intel.com

=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/fault/stress-ng/60s

commit: 
  34611600bf ("mm: Call wp_page_copy() under the VMA lock")
  c8b329d48e ("mm: Handle shared faults under the VMA lock")

34611600bfd1bf9f c8b329d48e0dac7438168a1857c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    157941 ±  6%     +20.3%     190026 ± 11%  meminfo.DirectMap4k
      0.05            +0.0        0.05        perf-stat.i.dTLB-store-miss-rate%
     51205          -100.0%       0.03 ± 81%  perf-stat.i.major-faults
     79003           +65.6%     130837        perf-stat.i.minor-faults
     50394          -100.0%       0.03 ± 81%  perf-stat.ps.major-faults
     77754           +65.6%     128767        perf-stat.ps.minor-faults
     53411          -100.0%       0.00 ±223%  stress-ng.fault.major_page_faults_per_sec
     80118           +67.5%     134204        stress-ng.fault.minor_page_faults_per_sec
      1417            -4.7%       1350        stress-ng.fault.nanosecs_per_page_fault
   3204300          -100.0%       0.33 ±141%  stress-ng.time.major_page_faults
   4815857           +67.3%    8059294        stress-ng.time.minor_page_faults
      0.01 ± 68%    +224.2%       0.03 ± 51%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.55 ± 95%    +368.6%       2.56 ± 35%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.05 ± 70%    +168.2%       0.12 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.__ext4_handle_dirty_metadata.ext4_mb_clear_bb.ext4_remove_blocks.ext4_ext_rm_leaf
      0.05 ± 73%    +114.3%       0.10 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.09 ± 78%     +79.2%       0.17 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.__ext4_handle_dirty_metadata.ext4_delete_entry.__ext4_unlink.ext4_unlink
      0.05 ± 70%    +229.6%       0.15 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.__ext4_handle_dirty_metadata.ext4_mb_clear_bb.ext4_remove_blocks.ext4_ext_rm_leaf
      0.03 ±151%    +260.5%       0.12 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.03 ±100%    +183.8%       0.10 ± 35%  perf-sched.wait_time.max.ms.__cond_resched.ext4_journal_check_start.__ext4_journal_start_sb.ext4_alloc_file_blocks.isra
      0.08 ± 79%    +134.1%       0.18 ± 36%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     11.65            -0.8       10.82 ±  2%  perf-profile.calltrace.cycles-pp.stress_fault
      9.42            -0.8        8.61 ±  2%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_fault
      8.84            -0.8        8.07 ±  3%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_fault
      8.74            -0.7        8.00 ±  3%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_fault
      7.56 ±  2%      -0.5        7.04 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_fault
      6.99 ±  2%      -0.5        6.51 ±  3%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     11.10            -0.9       10.24 ±  2%  perf-profile.children.cycles-pp.asm_exc_page_fault
     12.38            -0.8       11.54        perf-profile.children.cycles-pp.stress_fault
      8.92            -0.8        8.14 ±  3%  perf-profile.children.cycles-pp.exc_page_fault
      8.84            -0.8        8.07 ±  3%  perf-profile.children.cycles-pp.do_user_addr_fault
      7.63 ±  2%      -0.5        7.09 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
      7.06 ±  2%      -0.5        6.56 ±  3%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.36 ±  8%      -0.2        0.19 ±  8%  perf-profile.children.cycles-pp.lock_mm_and_find_vma
      1.46 ±  4%      -0.1        1.33 ±  5%  perf-profile.children.cycles-pp.page_cache_ra_unbounded
      0.40 ±  5%      -0.1        0.34 ±  8%  perf-profile.children.cycles-pp.mas_next_slot
      0.22 ± 13%      -0.1        0.17 ± 14%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.03 ±100%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.housekeeping_test_cpu
      0.44 ±  4%      -0.1        0.32 ± 13%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.67 ±  9%      -0.1        0.54 ± 10%  perf-profile.self.cycles-pp.mtree_range_walk
      0.58 ±  7%      -0.1        0.49 ±  6%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.16 ±  7%      -0.1        0.10 ± 20%  perf-profile.self.cycles-pp.madvise_cold_or_pageout_pte_range
      0.39 ±  5%      -0.1        0.33 ±  8%  perf-profile.self.cycles-pp.mas_next_slot
      0.26 ±  6%      +0.0        0.29 ± 10%  perf-profile.self.cycles-pp.filemap_fault


***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/thread/50%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/page_fault3/will-it-scale

commit: 
  34611600bf ("mm: Call wp_page_copy() under the VMA lock")
  c8b329d48e ("mm: Handle shared faults under the VMA lock")

34611600bfd1bf9f c8b329d48e0dac7438168a1857c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     46289           +39.6%      64618 ±  2%  uptime.idle
 3.839e+10           +47.5%  5.663e+10 ±  2%  cpuidle..time
  44548500           +28.6%   57277226 ±  2%  cpuidle..usage
    244.33 ±  7%     +92.0%     469.17 ± 14%  perf-c2c.DRAM.local
    563.00 ±  3%     -60.7%     221.00 ± 15%  perf-c2c.HITM.remote
    554762           -20.3%     441916        meminfo.Inactive
    554566           -20.3%     441725        meminfo.Inactive(anon)
   7360875           +46.0%   10746773 ±  2%  meminfo.Mapped
     20123           +28.9%      25930        meminfo.PageTables
     56.22           +46.8%      82.52 ±  2%  vmstat.cpu.id
     63.54 ±  8%     -39.5%      38.45 ± 14%  vmstat.procs.r
     23694           -84.7%       3627        vmstat.system.cs
    455148 ±  2%    +123.1%    1015448 ±  7%  vmstat.system.in
   2882478 ±  2%    +274.8%   10804264 ±  5%  will-it-scale.112.threads
     55.72           +47.6%      82.27 ±  2%  will-it-scale.112.threads_idle
     25736 ±  2%    +274.8%      96466 ±  5%  will-it-scale.per_thread_ops
   2882478 ±  2%    +274.8%   10804264 ±  5%  will-it-scale.workload
     55.97           +26.4       82.36 ±  2%  mpstat.cpu.all.idle%
      0.82            -0.1        0.70 ±  4%  mpstat.cpu.all.irq%
      0.11 ±  4%      -0.1        0.05 ±  5%  mpstat.cpu.all.soft%
     42.51           -26.9       15.64 ± 11%  mpstat.cpu.all.sys%
      0.59 ± 17%      +0.7        1.25 ± 41%  mpstat.cpu.all.usr%
   1841712           +44.8%    2666713 ±  3%  numa-meminfo.node0.Mapped
      5224 ±  3%     +31.6%       6877 ±  4%  numa-meminfo.node0.PageTables
   1845678           +46.3%    2699787 ±  2%  numa-meminfo.node1.Mapped
      5064 ±  5%     +23.0%       6231 ±  2%  numa-meminfo.node1.PageTables
   1826141           +47.6%    2694729 ±  2%  numa-meminfo.node2.Mapped
      4794 ±  2%     +30.8%       6269 ±  3%  numa-meminfo.node2.PageTables
   1868742 ±  2%     +44.9%    2708096 ±  3%  numa-meminfo.node3.Mapped
      5026 ±  5%     +28.8%       6474 ±  4%  numa-meminfo.node3.PageTables
   1591430 ±  4%     +70.8%    2718150 ±  3%  numa-numastat.node0.local_node
   1673574 ±  3%     +68.6%    2821949 ±  3%  numa-numastat.node0.numa_hit
   1577936 ±  6%     +74.8%    2757801 ±  2%  numa-numastat.node1.local_node
   1645522 ±  5%     +73.0%    2847142 ±  3%  numa-numastat.node1.numa_hit
   1537208 ±  3%     +77.3%    2725353 ±  2%  numa-numastat.node2.local_node
   1639749 ±  3%     +71.4%    2811161 ±  2%  numa-numastat.node2.numa_hit
   1637504 ±  5%     +72.8%    2829154 ±  5%  numa-numastat.node3.local_node
   1732850 ±  4%     +67.2%    2898001 ±  3%  numa-numastat.node3.numa_hit
      1684           -59.8%     677.17 ± 13%  turbostat.Avg_MHz
     44.43           -26.6       17.86 ± 13%  turbostat.Busy%
  44289096           +28.7%   57018721 ±  2%  turbostat.C1
     56.21           +26.6       82.76 ±  2%  turbostat.C1%
     55.57           +47.8%      82.14 ±  2%  turbostat.CPU%c1
      0.01          +533.3%       0.06 ± 17%  turbostat.IPC
 2.014e+08 ±  3%    +174.5%  5.527e+08 ±  7%  turbostat.IRQ
     43515 ±  3%     +37.9%      59997 ±  3%  turbostat.POLL
    685.24           -22.4%     532.03 ±  3%  turbostat.PkgWatt
     17.33            +5.6%      18.30        turbostat.RAMWatt
    458598           +45.2%     666035 ±  3%  numa-vmstat.node0.nr_mapped
      1305 ±  3%     +32.0%       1723 ±  4%  numa-vmstat.node0.nr_page_table_pages
   1673564 ±  3%     +68.6%    2822055 ±  3%  numa-vmstat.node0.numa_hit
   1591420 ±  4%     +70.8%    2718256 ±  3%  numa-vmstat.node0.numa_local
    461362           +46.3%     674878 ±  2%  numa-vmstat.node1.nr_mapped
      1266 ±  4%     +23.2%       1559 ±  2%  numa-vmstat.node1.nr_page_table_pages
   1645442 ±  5%     +73.0%    2847103 ±  3%  numa-vmstat.node1.numa_hit
   1577856 ±  6%     +74.8%    2757762 ±  2%  numa-vmstat.node1.numa_local
    456314           +47.5%     672973 ±  2%  numa-vmstat.node2.nr_mapped
      1198 ±  2%     +31.0%       1569 ±  3%  numa-vmstat.node2.nr_page_table_pages
   1639701 ±  3%     +71.4%    2811174 ±  2%  numa-vmstat.node2.numa_hit
   1537161 ±  3%     +77.3%    2725366 ±  2%  numa-vmstat.node2.numa_local
    464153           +46.1%     677988 ±  3%  numa-vmstat.node3.nr_mapped
      1255 ±  5%     +29.1%       1621 ±  4%  numa-vmstat.node3.nr_page_table_pages
   1732732 ±  4%     +67.3%    2898025 ±  3%  numa-vmstat.node3.numa_hit
   1637386 ±  5%     +72.8%    2829178 ±  5%  numa-vmstat.node3.numa_local
    104802            -2.5%     102214        proc-vmstat.nr_anon_pages
   4433098            -1.0%    4389891        proc-vmstat.nr_file_pages
    138599           -20.3%     110426        proc-vmstat.nr_inactive_anon
   1842991           +45.8%    2687030 ±  2%  proc-vmstat.nr_mapped
      5030           +28.9%       6483        proc-vmstat.nr_page_table_pages
   3710638            -1.2%    3667429        proc-vmstat.nr_shmem
    138599           -20.3%     110426        proc-vmstat.nr_zone_inactive_anon
     43540 ±  7%     -82.6%       7576 ± 47%  proc-vmstat.numa_hint_faults
     26753 ± 10%     -77.6%       5982 ± 56%  proc-vmstat.numa_hint_faults_local
   6693986           +70.0%   11381806 ±  3%  proc-vmstat.numa_hit
   6346365           +73.9%   11034009 ±  3%  proc-vmstat.numa_local
     21587 ± 31%     -92.2%       1683 ± 58%  proc-vmstat.numa_pages_migrated
    197966           -81.7%      36131 ± 25%  proc-vmstat.numa_pte_updates
   3749632            -1.1%    3708618        proc-vmstat.pgactivate
   6848722           +68.4%   11532638 ±  3%  proc-vmstat.pgalloc_normal
 8.677e+08 ±  2%    +276.2%  3.265e+09 ±  5%  proc-vmstat.pgfault
   6646708           +72.1%   11436096 ±  3%  proc-vmstat.pgfree
     21587 ± 31%     -92.2%       1683 ± 58%  proc-vmstat.pgmigrate_success
     54536 ±  8%     -24.2%      41332 ±  3%  proc-vmstat.pgreuse
   6305732           -84.8%     961479 ± 36%  sched_debug.cfs_rq:/.avg_vruntime.avg
  10700237           -83.0%    1820191 ± 34%  sched_debug.cfs_rq:/.avg_vruntime.max
   1797215 ± 18%     -93.8%     112003 ± 80%  sched_debug.cfs_rq:/.avg_vruntime.min
   1512854 ±  2%     -75.4%     372673 ± 31%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.13 ± 20%     +62.6%       0.21 ± 26%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.33 ±  8%     +17.2%       0.39 ±  9%  sched_debug.cfs_rq:/.h_nr_running.stddev
      4781 ± 82%    -100.0%       0.12 ±223%  sched_debug.cfs_rq:/.left_vruntime.avg
    804679 ± 78%    -100.0%      27.67 ±223%  sched_debug.cfs_rq:/.left_vruntime.max
     61817 ± 80%    -100.0%       1.84 ±223%  sched_debug.cfs_rq:/.left_vruntime.stddev
      2654 ± 21%    +156.8%       6815 ± 18%  sched_debug.cfs_rq:/.load.avg
   6305732           -84.8%     961479 ± 36%  sched_debug.cfs_rq:/.min_vruntime.avg
  10700237           -83.0%    1820191 ± 34%  sched_debug.cfs_rq:/.min_vruntime.max
   1797215 ± 18%     -93.8%     112003 ± 80%  sched_debug.cfs_rq:/.min_vruntime.min
   1512854 ±  2%     -75.4%     372673 ± 31%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.13 ± 20%     +63.4%       0.21 ± 26%  sched_debug.cfs_rq:/.nr_running.avg
      0.33 ±  7%     +18.1%       0.39 ±  9%  sched_debug.cfs_rq:/.nr_running.stddev
      4781 ± 82%    -100.0%       0.12 ±223%  sched_debug.cfs_rq:/.right_vruntime.avg
    804679 ± 78%    -100.0%      27.67 ±223%  sched_debug.cfs_rq:/.right_vruntime.max
     61817 ± 80%    -100.0%       1.84 ±223%  sched_debug.cfs_rq:/.right_vruntime.stddev
    495.58 ±  3%     -56.6%     214.98 ± 24%  sched_debug.cfs_rq:/.runnable_avg.avg
      1096 ±  7%     -13.4%     949.07 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
    359.89           -23.0%     277.09 ± 11%  sched_debug.cfs_rq:/.runnable_avg.stddev
    493.94 ±  3%     -56.5%     214.69 ± 24%  sched_debug.cfs_rq:/.util_avg.avg
    359.20           -22.9%     276.81 ± 11%  sched_debug.cfs_rq:/.util_avg.stddev
     97.00 ± 24%     +76.3%     171.06 ± 31%  sched_debug.cfs_rq:/.util_est_enqueued.avg
   1512762 ±  4%     -35.1%     981444        sched_debug.cpu.avg_idle.avg
   5146368 ± 10%     -71.3%    1476288 ± 33%  sched_debug.cpu.avg_idle.max
    578157 ±  8%     -68.8%     180178 ± 10%  sched_debug.cpu.avg_idle.min
    670957 ±  5%     -83.7%     109591 ± 26%  sched_debug.cpu.avg_idle.stddev
     73.60 ± 11%     -81.3%      13.79 ±  9%  sched_debug.cpu.clock.stddev
    650.52 ± 18%     +58.1%       1028 ± 14%  sched_debug.cpu.curr->pid.avg
      1959 ±  7%     +19.6%       2342 ±  6%  sched_debug.cpu.curr->pid.stddev
    924262 ±  3%     -45.6%     502853        sched_debug.cpu.max_idle_balance_cost.avg
   2799134 ± 10%     -70.8%     817753 ± 35%  sched_debug.cpu.max_idle_balance_cost.max
    377335 ±  9%     -93.4%      24979 ± 94%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ±  8%     -59.7%       0.00 ± 55%  sched_debug.cpu.next_balance.stddev
      0.10 ± 17%     +57.8%       0.15 ± 14%  sched_debug.cpu.nr_running.avg
      1.28 ±  6%     -19.6%       1.03 ±  6%  sched_debug.cpu.nr_running.max
      0.29 ±  7%     +19.1%       0.35 ±  6%  sched_debug.cpu.nr_running.stddev
     17163           -79.4%       3534 ±  5%  sched_debug.cpu.nr_switches.avg
      7523 ± 10%     -87.2%     961.21 ± 12%  sched_debug.cpu.nr_switches.min
      0.33 ±  5%     -18.7%       0.27 ±  6%  sched_debug.cpu.nr_uninterruptible.avg
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.max
      0.01          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.01          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
      0.18 ± 34%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.avg
     40.73 ± 34%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.max
      2.72 ± 34%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.stddev
  2.63e+09          +165.9%  6.995e+09 ±  5%  perf-stat.i.branch-instructions
      0.45            -0.2        0.22 ±  3%  perf-stat.i.branch-miss-rate%
  12246564           +25.8%   15409530 ±  3%  perf-stat.i.branch-misses
     40.05 ±  6%      +5.9       45.95        perf-stat.i.cache-miss-rate%
     23716           -85.2%       3516        perf-stat.i.context-switches
     30.25 ±  2%     -84.8%       4.58 ± 18%  perf-stat.i.cpi
 3.785e+11           -60.2%  1.507e+11 ± 13%  perf-stat.i.cpu-cycles
    270.31            -6.3%     253.41        perf-stat.i.cpu-migrations
      9670 ± 38%     -79.6%       1972 ± 22%  perf-stat.i.cycles-between-cache-misses
      0.03 ±  4%      -0.0        0.01 ± 10%  perf-stat.i.dTLB-load-miss-rate%
    958512 ±  3%     +20.5%    1154691 ±  5%  perf-stat.i.dTLB-load-misses
  3.15e+09          +172.1%  8.571e+09 ±  5%  perf-stat.i.dTLB-loads
      4.91            +1.6        6.54        perf-stat.i.dTLB-store-miss-rate%
  87894742 ±  2%    +276.4%  3.308e+08 ±  5%  perf-stat.i.dTLB-store-misses
 1.709e+09          +176.5%  4.725e+09 ±  5%  perf-stat.i.dTLB-stores
     78.59           +13.6       92.23        perf-stat.i.iTLB-load-miss-rate%
   8890053          +168.7%   23884564 ±  6%  perf-stat.i.iTLB-load-misses
   2405390           -17.2%    1990833        perf-stat.i.iTLB-loads
 1.257e+10          +164.2%  3.323e+10 ±  5%  perf-stat.i.instructions
      0.03 ±  4%    +571.5%       0.23 ± 17%  perf-stat.i.ipc
      1.69           -60.1%       0.67 ± 13%  perf-stat.i.metric.GHz
     33.38          +175.7%      92.04 ±  5%  perf-stat.i.metric.M/sec
   2877597 ±  2%    +274.4%   10773809 ±  5%  perf-stat.i.minor-faults
     86.68            -3.1       83.57 ±  2%  perf-stat.i.node-load-miss-rate%
   5637384 ± 17%    +105.0%   11559372 ± 20%  perf-stat.i.node-load-misses
    857520 ± 10%    +158.1%    2213133 ±  9%  perf-stat.i.node-loads
     46.44           -16.5       29.97        perf-stat.i.node-store-miss-rate%
   2608818           +80.4%    4705017 ±  3%  perf-stat.i.node-store-misses
   3024158 ±  2%    +264.6%   11026854 ±  5%  perf-stat.i.node-stores
   2877597 ±  2%    +274.4%   10773809 ±  5%  perf-stat.i.page-faults
      0.47            -0.2        0.22 ±  3%  perf-stat.overall.branch-miss-rate%
     39.95 ±  6%      +6.0       45.93        perf-stat.overall.cache-miss-rate%
     30.11 ±  2%     -84.8%       4.58 ± 18%  perf-stat.overall.cpi
      9647 ± 38%     -79.6%       1971 ± 21%  perf-stat.overall.cycles-between-cache-misses
      0.03 ±  4%      -0.0        0.01 ± 10%  perf-stat.overall.dTLB-load-miss-rate%
      4.89            +1.7        6.54        perf-stat.overall.dTLB-store-miss-rate%
     78.70           +13.6       92.28        perf-stat.overall.iTLB-load-miss-rate%
      0.03 ±  2%    +579.6%       0.23 ± 17%  perf-stat.overall.ipc
     86.61            -3.0       83.59 ±  2%  perf-stat.overall.node-load-miss-rate%
     46.33           -16.4       29.93        perf-stat.overall.node-store-miss-rate%
   1315354           -29.2%     931848        perf-stat.overall.path-length
 2.621e+09          +166.0%   6.97e+09 ±  5%  perf-stat.ps.branch-instructions
  12198295           +25.8%   15340303 ±  3%  perf-stat.ps.branch-misses
     23623           -85.2%       3499        perf-stat.ps.context-switches
  3.77e+11           -60.2%  1.502e+11 ± 13%  perf-stat.ps.cpu-cycles
    266.50            -5.2%     252.58        perf-stat.ps.cpu-migrations
    961568 ±  4%     +19.7%    1150857 ±  5%  perf-stat.ps.dTLB-load-misses
 3.138e+09          +172.1%  8.541e+09 ±  5%  perf-stat.ps.dTLB-loads
  87534988 ±  2%    +276.7%  3.297e+08 ±  5%  perf-stat.ps.dTLB-store-misses
 1.702e+09          +176.6%  4.708e+09 ±  5%  perf-stat.ps.dTLB-stores
   8850726          +169.0%   23812332 ±  6%  perf-stat.ps.iTLB-load-misses
   2394294           -17.1%    1983791        perf-stat.ps.iTLB-loads
 1.253e+10          +164.3%  3.311e+10 ±  5%  perf-stat.ps.instructions
   2865432 ±  2%    +274.7%   10737502 ±  5%  perf-stat.ps.minor-faults
   5615782 ± 17%    +105.2%   11521907 ± 20%  perf-stat.ps.node-load-misses
    856502 ± 10%    +157.6%    2206185 ±  9%  perf-stat.ps.node-loads
   2598165           +80.5%    4689182 ±  3%  perf-stat.ps.node-store-misses
   3009612 ±  2%    +265.1%   10987528 ±  5%  perf-stat.ps.node-stores
   2865432 ±  2%    +274.7%   10737502 ±  5%  perf-stat.ps.page-faults
 3.791e+12          +165.5%  1.006e+13 ±  5%  perf-stat.total.instructions
      0.05 ± 17%     -77.2%       0.01 ± 73%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.07 ± 34%     -90.1%       0.01 ± 99%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ± 33%    +377.8%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      0.08 ± 25%     -90.3%       0.01 ± 12%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.12 ± 64%     -91.3%       0.01 ±  8%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.06 ± 37%     -89.4%       0.01 ± 16%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.03 ± 19%     -80.0%       0.01 ± 34%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.21 ±100%     -97.3%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.02 ± 57%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ± 34%     -88.0%       0.00 ± 15%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.08 ± 21%     -90.3%       0.01 ± 25%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.06 ± 80%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      0.00 ± 19%    +173.3%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      0.02 ± 10%     -87.3%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.05 ± 16%     -85.9%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 ± 10%     -74.0%       0.01 ± 27%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.09 ± 40%     -91.2%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.01 ± 16%     -74.6%       0.00        perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.12 ± 66%     -93.3%       0.01 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.79 ± 40%     -96.9%       0.02 ±186%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ± 10%    +123.1%       0.01 ± 22%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      0.13 ± 14%     -92.2%       0.01 ± 27%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.15 ± 54%     -91.6%       0.01 ± 17%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.14 ± 43%     -93.0%       0.01 ± 27%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     24.13 ±116%     -99.9%       0.01 ± 15%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      0.06 ± 63%    -100.0%       0.00        perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.22 ± 39%     -95.5%       0.01 ± 15%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.22 ± 60%     -93.8%       0.01 ± 20%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     65.91 ± 71%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     13.37 ±143%    +703.9%     107.48 ± 64%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      0.01 ± 31%    +121.2%       0.02 ± 31%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      0.28 ± 14%     -96.4%       0.01 ± 29%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.19 ± 16%     -93.0%       0.01 ± 23%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.16 ± 50%     -93.2%       0.01 ± 27%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.10 ±  9%     -94.3%       0.01 ± 37%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     31.83 ±  4%    +503.4%     192.03 ±  4%  perf-sched.total_wait_and_delay.average.ms
     61361           -82.4%      10800 ±  5%  perf-sched.total_wait_and_delay.count.ms
     31.76 ±  4%    +502.8%     191.45 ±  5%  perf-sched.total_wait_time.average.ms
      1.67 ± 13%   +9097.0%     153.21 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
     32.29 ±  9%     -25.8%      23.95 ± 22%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.57 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1.11 ±  8%  +12026.0%     134.28 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      3.84 ±  5%     +20.0%       4.61 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    610.00 ±  7%     -30.8%     421.83 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
     51568 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1146 ±  4%     +51.3%       1734 ±  6%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      1226 ±  4%     -11.6%       1084 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    995.33 ±  3%     -19.5%     801.33 ±  4%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     33.51 ± 78%    +547.7%     217.02 ±  2%  perf-sched.wait_and_delay.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
     65.98 ± 70%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     15.43 ±115%   +1309.1%     217.47        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      1.47 ±  8%  +10284.0%     153.06 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
      0.01 ± 34%  +1.4e+06%     179.68 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      5.95 ± 21%     -73.5%       1.58 ±  8%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.44 ±  6%  +10218.7%     148.31 ±  9%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.93 ± 23%    -100.0%       0.00        perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1.51 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1.08 ±  5%  +12334.2%     134.16 ±  8%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      0.38 ± 27%  +47951.7%     182.68 ±  2%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      2.83 ± 16%     -82.5%       0.49 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.82 ±  6%     +20.4%       4.60 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      6.49 ± 18%     -75.3%       1.60 ±  9%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.03 ±133%     -99.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2.99 ± 14%   +7148.4%     217.02 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
      0.06 ± 51%  +3.5e+05%     209.30 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
     11.89 ± 21%     -73.5%       3.16 ±  8%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.62 ±  4%   +7966.9%     211.41 ±  2%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      4.63 ±  7%    -100.0%       0.00        perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      5.60 ± 74%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      4.03 ±  3%   +5294.2%     217.47        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      2.46 ± 25%   +8701.7%     216.14        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
     16.44 ± 21%     -93.5%       1.07 ±  3%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     14.31 ± 59%     -65.0%       5.01        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     12.98 ± 18%     -75.3%       3.20 ±  9%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.63 ±151%     -98.7%       0.01 ± 46%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     24.35 ±  5%     -24.3        0.00        perf-profile.calltrace.cycles-pp.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     22.08 ±  2%     -22.1        0.00        perf-profile.calltrace.cycles-pp.down_read_trylock.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     13.70 ±  2%     -13.7        0.00        perf-profile.calltrace.cycles-pp.up_read.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     74.33           -12.7       61.66        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     74.37           -12.2       62.18        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.testcase
      3.61 ±  8%      -2.7        0.89 ± 16%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +0.7        0.71 ± 21%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
      0.00            +0.7        0.71 ±  5%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_range.zap_pte_range.zap_pmd_range
      0.00            +0.7        0.72 ±  5%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.flush_tlb_mm_range.zap_pte_range.zap_pmd_range.unmap_page_range
      0.00            +0.7        0.73 ±  5%  perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +0.8        0.81 ± 15%  perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault
      0.71 ±  3%      +1.2        1.90 ± 14%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
      0.00            +1.2        1.20 ± 17%  perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_fault.__handle_mm_fault
      0.71 ±  3%      +1.2        1.94 ± 14%  perf-profile.calltrace.cycles-pp.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.71 ±  3%      +1.2        1.94 ± 14%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.71 ±  3%      +1.2        1.94 ± 14%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.do_vmi_align_munmap
      0.00            +1.3        1.28 ± 27%  perf-profile.calltrace.cycles-pp.set_pte_range.finish_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.73 ±  3%      +1.3        2.02 ± 14%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.73 ±  3%      +1.3        2.02 ± 14%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.72 ±  3%      +1.3        2.00 ± 14%  perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.00            +1.4        1.36 ± 17%  perf-profile.calltrace.cycles-pp.shmem_fault.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.00            +1.4        1.40 ± 18%  perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.testcase
      0.00            +1.4        1.42 ± 17%  perf-profile.calltrace.cycles-pp.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +1.7        1.68 ± 20%  perf-profile.calltrace.cycles-pp.finish_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +2.0        2.05 ± 14%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.0        2.05 ± 14%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     41.13            +2.1       43.18        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.00            +2.1        2.08 ± 14%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +2.1        2.08 ± 14%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.52 ± 13%      +2.1        3.66 ± 14%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      3.32 ± 19%     +19.0       22.27 ± 24%  perf-profile.calltrace.cycles-pp.lock_vma_under_rcu.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     24.35 ±  5%     -24.4        0.00        perf-profile.children.cycles-pp.lock_mm_and_find_vma
     22.17 ±  2%     -22.0        0.16 ± 17%  perf-profile.children.cycles-pp.down_read_trylock
     14.60 ±  2%     -14.5        0.14 ± 21%  perf-profile.children.cycles-pp.up_read
     74.37           -12.4       62.02        perf-profile.children.cycles-pp.do_user_addr_fault
     74.39           -12.2       62.20        perf-profile.children.cycles-pp.exc_page_fault
     75.34            -5.5       69.86        perf-profile.children.cycles-pp.asm_exc_page_fault
     23.24            -0.9       22.38        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.44 ±  4%      -0.2        0.28 ± 14%  perf-profile.children.cycles-pp.scheduler_tick
      0.20 ± 39%      -0.1        0.08 ± 86%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.20 ± 39%      -0.1        0.08 ± 86%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.20 ± 39%      -0.1        0.08 ± 86%  perf-profile.children.cycles-pp.start_kernel
      0.20 ± 39%      -0.1        0.08 ± 86%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.20 ± 39%      -0.1        0.08 ± 86%  perf-profile.children.cycles-pp.rest_init
      0.28 ±  4%      -0.1        0.17 ± 19%  perf-profile.children.cycles-pp._compound_head
      0.47 ±  4%      -0.1        0.37 ± 14%  perf-profile.children.cycles-pp.update_process_times
      0.47 ±  4%      -0.1        0.37 ± 14%  perf-profile.children.cycles-pp.tick_sched_handle
      0.12 ± 13%      -0.1        0.03 ±102%  perf-profile.children.cycles-pp.load_balance
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.03 ± 70%      +0.1        0.11 ± 19%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.__count_memcg_events
      0.00            +0.1        0.08 ± 18%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.10 ± 23%  perf-profile.children.cycles-pp.folio_mark_dirty
      0.00            +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.__pte_offset_map
      0.08 ±  6%      +0.1        0.18 ± 20%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.1        0.11 ± 14%  perf-profile.children.cycles-pp.pte_offset_map_nolock
      0.53 ±  4%      +0.1        0.65 ± 16%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.12 ± 28%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.05 ±  8%      +0.1        0.18 ± 19%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.1        0.14 ± 22%  perf-profile.children.cycles-pp.folio_unlock
      0.00            +0.1        0.14 ± 20%  perf-profile.children.cycles-pp.release_pages
      0.02 ±141%      +0.1        0.16 ± 36%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.native_flush_tlb_local
      0.08 ±  5%      +0.1        0.23 ± 16%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.01 ±223%      +0.2        0.16 ± 24%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.2        0.15 ± 17%  perf-profile.children.cycles-pp.handle_pte_fault
      0.00            +0.2        0.16 ±115%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.2        0.16 ± 20%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.57 ±  4%      +0.2        0.74 ± 15%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.57 ±  4%      +0.2        0.74 ± 15%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.01 ±223%      +0.2        0.18 ± 29%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.00            +0.2        0.18 ± 18%  perf-profile.children.cycles-pp.tlb_batch_pages_flush
      0.00            +0.2        0.19 ± 23%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.01 ±223%      +0.2        0.21 ± 27%  perf-profile.children.cycles-pp.file_update_time
      0.00            +0.2        0.22 ±  4%  perf-profile.children.cycles-pp.llist_reverse_order
      0.02 ±141%      +0.2        0.26 ±  5%  perf-profile.children.cycles-pp.flush_tlb_func
      0.00            +0.2        0.25 ± 18%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.3        0.26 ± 18%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.15 ±  9%      +0.3        0.44 ± 21%  perf-profile.children.cycles-pp.mtree_range_walk
      0.07 ±  9%      +0.3        0.38 ±  5%  perf-profile.children.cycles-pp.default_send_IPI_mask_sequence_phys
      0.05 ±  7%      +0.3        0.37 ± 15%  perf-profile.children.cycles-pp.xas_descend
      0.66 ±  3%      +0.3        1.00 ± 14%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.05 ±  7%      +0.4        0.43 ± 18%  perf-profile.children.cycles-pp.folio_add_file_rmap_range
      0.04 ± 44%      +0.4        0.43 ± 19%  perf-profile.children.cycles-pp.page_remove_rmap
      0.06 ±  6%      +0.4        0.45 ± 20%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.04 ± 44%      +0.4        0.44 ± 20%  perf-profile.children.cycles-pp.tlb_flush_rmaps
      0.06 ± 16%      +0.4        0.48 ± 24%  perf-profile.children.cycles-pp.fault_dirty_shared_page
      0.30 ±  3%      +0.4        0.72 ±  5%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.30 ±  3%      +0.4        0.72 ±  5%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.31 ±  2%      +0.4        0.74 ±  5%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.07 ±  6%      +0.5        0.54 ± 14%  perf-profile.children.cycles-pp.xas_load
      0.13 ±  8%      +0.6        0.75 ±  4%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.11 ±  8%      +0.6        0.75 ±  4%  perf-profile.children.cycles-pp.__sysvec_call_function
      0.12 ±  8%      +0.7        0.82 ±  4%  perf-profile.children.cycles-pp.sysvec_call_function
      0.12 ±  4%      +0.7        0.82 ± 15%  perf-profile.children.cycles-pp.filemap_get_entry
      0.08 ±  5%      +0.8        0.86 ± 19%  perf-profile.children.cycles-pp.___perf_sw_event
      0.11 ±  6%      +1.0        1.09 ± 20%  perf-profile.children.cycles-pp.__perf_sw_event
      0.18 ±  6%      +1.0        1.21 ± 16%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.25 ± 46%      +1.0        1.30 ± 27%  perf-profile.children.cycles-pp.set_pte_range
      0.18 ±  5%      +1.2        1.36 ± 17%  perf-profile.children.cycles-pp.shmem_fault
      0.25 ±  5%      +1.2        1.43 ± 17%  perf-profile.children.cycles-pp.__do_fault
      0.93 ±  4%      +1.2        2.12 ± 14%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.93 ±  4%      +1.2        2.12 ± 14%  perf-profile.children.cycles-pp.do_syscall_64
      0.72 ±  3%      +1.2        1.94 ± 14%  perf-profile.children.cycles-pp.zap_pte_range
      0.72 ±  3%      +1.2        1.94 ± 14%  perf-profile.children.cycles-pp.unmap_vmas
      0.72 ±  3%      +1.2        1.94 ± 14%  perf-profile.children.cycles-pp.unmap_page_range
      0.72 ±  3%      +1.2        1.94 ± 14%  perf-profile.children.cycles-pp.zap_pmd_range
      0.44 ±  4%      +1.2        1.67        perf-profile.children.cycles-pp.asm_sysvec_call_function
      0.18 ± 19%      +1.3        1.45 ± 17%  perf-profile.children.cycles-pp.sync_regs
      0.74 ±  3%      +1.3        2.02 ± 14%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.74 ±  3%      +1.3        2.02 ± 14%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.72 ±  3%      +1.3        2.00 ± 14%  perf-profile.children.cycles-pp.unmap_region
      0.74 ±  3%      +1.3        2.05 ± 14%  perf-profile.children.cycles-pp.__vm_munmap
      0.74 ±  3%      +1.3        2.05 ± 14%  perf-profile.children.cycles-pp.__x64_sys_munmap
      0.31 ± 37%      +1.4        1.70 ± 20%  perf-profile.children.cycles-pp.finish_fault
      1.53 ± 13%      +2.2        3.68 ± 14%  perf-profile.children.cycles-pp.do_fault
      0.82 ± 24%      +4.1        4.90 ± 33%  perf-profile.children.cycles-pp.native_irq_return_iret
      3.34 ± 19%     +19.0       22.33 ± 24%  perf-profile.children.cycles-pp.lock_vma_under_rcu
     21.96 ±  2%     -21.8        0.16 ± 17%  perf-profile.self.cycles-pp.down_read_trylock
     14.47 ±  2%     -14.3        0.13 ± 22%  perf-profile.self.cycles-pp.up_read
      3.51 ±  9%      -3.5        0.04 ±108%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.27 ±  4%      -0.1        0.14 ± 19%  perf-profile.self.cycles-pp._compound_head
      0.12 ±  6%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.llist_add_batch
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.07 ± 23%  perf-profile.self.cycles-pp.__irqentry_text_end
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.do_fault
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.finish_fault
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.09 ± 20%  perf-profile.self.cycles-pp.inode_needs_update_time
      0.00            +0.1        0.09 ± 16%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.00            +0.1        0.09 ± 20%  perf-profile.self.cycles-pp.__pte_offset_map
      0.00            +0.1        0.10 ± 16%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      0.00            +0.1        0.11 ± 22%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.1        0.11 ± 31%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.11 ± 13%  perf-profile.self.cycles-pp.flush_tlb_func
      0.07 ±  5%      +0.1        0.19 ± 12%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.02 ±141%      +0.1        0.14 ± 40%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.1        0.13 ± 17%  perf-profile.self.cycles-pp.exc_page_fault
      0.00            +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.1        0.13 ± 21%  perf-profile.self.cycles-pp.folio_unlock
      0.00            +0.1        0.14 ± 19%  perf-profile.self.cycles-pp.release_pages
      0.00            +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.native_flush_tlb_local
      0.00            +0.1        0.14 ± 18%  perf-profile.self.cycles-pp.shmem_fault
      0.01 ±223%      +0.2        0.18 ± 18%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.2        0.17 ± 18%  perf-profile.self.cycles-pp.set_pte_range
      0.00            +0.2        0.19 ± 17%  perf-profile.self.cycles-pp.folio_add_file_rmap_range
      0.00            +0.2        0.22 ± 19%  perf-profile.self.cycles-pp.page_remove_rmap
      0.00            +0.2        0.22 ±  5%  perf-profile.self.cycles-pp.llist_reverse_order
      0.00            +0.2        0.24 ± 18%  perf-profile.self.cycles-pp.error_entry
      0.00            +0.2        0.24 ± 25%  perf-profile.self.cycles-pp.__perf_sw_event
      0.02 ± 99%      +0.2        0.27 ± 16%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.3        0.28 ±  5%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.14 ±  7%      +0.3        0.43 ± 21%  perf-profile.self.cycles-pp.mtree_range_walk
      0.00            +0.3        0.29 ± 13%  perf-profile.self.cycles-pp.asm_exc_page_fault
      0.07 ±  8%      +0.3        0.38 ±  4%  perf-profile.self.cycles-pp.default_send_IPI_mask_sequence_phys
      0.04 ± 44%      +0.3        0.35 ± 15%  perf-profile.self.cycles-pp.xas_descend
      0.00            +0.3        0.31 ± 19%  perf-profile.self.cycles-pp.zap_pte_range
      0.03 ± 70%      +0.3        0.35 ± 19%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.01 ±223%      +0.5        0.53 ± 13%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.08 ±  6%      +0.7        0.74 ± 19%  perf-profile.self.cycles-pp.___perf_sw_event
      0.18 ± 19%      +1.3        1.44 ± 17%  perf-profile.self.cycles-pp.sync_regs
     19.02            +2.4       21.40        perf-profile.self.cycles-pp.acpi_safe_halt
      0.27 ± 71%      +2.4        2.72 ± 76%  perf-profile.self.cycles-pp.handle_mm_fault
      0.82 ± 24%      +4.1        4.89 ± 33%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.76 ±  3%      +5.6        6.37 ± 18%  perf-profile.self.cycles-pp.testcase





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

