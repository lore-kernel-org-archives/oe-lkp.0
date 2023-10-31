Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A083111C
	for <oe-lkp@lists.linux.dev>; Tue, 31 Oct 2023 03:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GouVHyG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698721223; x=1730257223;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=e7Jx0altoPqIu8oUPzwYEqGJhyvySd6GqDLMY4Tvtq0=;
  b=GouVHyG5SGS0iCAaJKfutMaOLjcc6PwAJNTRcwF3x3WCqYl4L8Q0I1B8
   ykcKLH3U9dpUmB5Sx/a59TpR8Zvy0uAorKQrYQJtg/Y5ugSUChpgacPyV
   XfpeYNQkeBpMBujLK3hnVH3vkDTx77rR8EU0o0CvGYVMYrIqdpy4sDeh+
   8m02bDt9ngisXDlTjeCiE63tfTXUTvg5CMXOLcRT+ahGrwM/ZqfDVfIPd
   vWAN99x743l4V0eBOoklemgxPAjen2zaTOmFti846lNyFhA2r/wB2GItx
   ehRiwfKl1My9HgWGcreiNr0A9/9KjG6pvOoLK7OemhZkW8nTruxofgd7+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419313602"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="419313602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="830900033"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="830900033"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 20:00:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 20:00:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 20:00:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 20:00:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 20:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnOqIHM2PdNbBBMKoBR8cd6RVAfdRbdJ2Ayhg9QCRo42i4BHgR3TN381Uvd/U88Fy8/Hel1oOihqIO3akEHfb1pdilwqioWhOtM+CIuIIPsxaB0sf8ljrYKXDn4wftuyf+1Vgj5hha11k3gkvhkQiTrMpkLyncUu2y9S7HnnIrKL94tUUMYRJq5Ah/WP6z+vJgPDybhpk2BrmPkQFachYz5Is4I1IxHLb87WPf+boTsJSXjOqadoOCBKdLcpDkjcrmAOpkBvrcOKVFTbsHeehWzwpnzHZJwu/8JcXqYRhWytO06XxpO8gCk9yf7Av7f/+cEMitFekPumLgJYijSwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhD5wrfqzB0FIHv/lUlVQoCzHGZRk3YjY1z3n6pqw9k=;
 b=D8NIzE4AUOf2dWWj84b7XVUorOApouY4UmCM+6+SXXVCuKgG90x+ykwIWIYSN7XvHEwng97HJdx8ABJ9SPkRaElgDhZXm469nX8dLyogO3pf6M+AvqRXexvQeS0v09MqYduOQvDMsRXsIE0GYkAJuKZoB0kd0sk2GECJiDlp1oVVTxBD5/1FpYL+Asod29XP73mfUJQjtl/SP5lCtzINIjDJkMmmBmBt/X3pU/k6hAuyPpOwEeomXcm56dMhYrOWWz4Xty8PDd0jn9PzOwtSNZOiaTgdkBes1sThnxrYqi6Jrgypwjk1TTi2xQQsUFT+7pnd6cZUVIJVCyCYRXOF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 03:00:19 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6933.026; Tue, 31 Oct 2023
 03:00:19 +0000
Date: Tue, 31 Oct 2023 11:00:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: John Johansen <john.johansen@canonical.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Georgia Garcia <georgia.garcia@canonical.com>,
	<apparmor@lists.ubuntu.com>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [apparmor]  90c436a64a:
 stress-ng.kcmp.ops_per_sec 383.0% improvement
Message-ID: <202310311037.173ebf2b-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::15) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: f3029b88-ff3f-43bc-3c90-08dbd9bd8407
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KRLXHFhiKtmQKQeHYdirHZOcYsLOB0CxKQpQh6mb3VU7KEjQWwfIhvIaFWQy95/7ZhsH1cAGjSFK+h6qQ7LsNyO22dI8SqOEX1JrSJBYmfzK9IuIdE+CyE0cURLqkqlzSkAaSc1ohwYmnNjbeYi/U51Mw6RIiZI90SR/iJdD7A7i/cH9E+pw1hV2W+e4zK3vI+lQ237zAAqKZZzkTesGxSbCv9tVL16ZjAZ2KNamNQpiBFg2GnAQKaUZ9mfiWlDOYLUXh0tu9MiulM1OaqI+z5+lWdeMfvPYICVjzapnFUOx+kw54H3lHCHRocXmlZtdCZIq3QcRKce0YwjlTEUshw2qxK8bS9nlTw5JGwcOv60TnFjiWilCnl08z8ain2qlOr3q1eFTJQLKchyQuaiStNvDLpvrAVInNuUjfQabf3OGDY5H3pPDllj1i+FGFjx+mpAXhpic1gYepKXeViwMRBQwvPF8Sy060uo05MDi7g46pZ1WBmLL6F7V4ywtnlN0XNAGvg6ld/7tyX0scI6CTllotKpqEt76S8h+HHWt0OXmKcNnApv+7qSFSu8l6WiYjlg0ZWPhawwdTImq1In/wFeOtK1sVmA8uo7ba3HVYvn/XXrf6MBmBiRzUPOViZwQ/2FMQxeSYrtdKlUviiWcRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230373577357003)(230922051799003)(230473577357003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(107886003)(8936002)(4326008)(8676002)(6506007)(6512007)(6666004)(6916009)(66476007)(30864003)(54906003)(2616005)(316002)(66946007)(1076003)(2906002)(66556008)(83380400001)(5660300002)(26005)(38100700002)(86362001)(966005)(82960400001)(6486002)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3WbkNX7bXTM10xOarbF4C2BRlAYOk7pNFxdG6fo5RGHKoH2UzzbiCStGpn?=
 =?iso-8859-1?Q?kZD30cfBK8l2rhIN99WpaKsstn9Pt9364VZd9434F6MCtWSQynElzZFFwy?=
 =?iso-8859-1?Q?O4ODcRmfr9HMXXlL/hlHADAQ2ObccKZT+dHOaYsnCZ0HMXZ8SZuWfOesRS?=
 =?iso-8859-1?Q?+/HFVwtsifcAbWJO9VZjCHqCNgTby83Qm+/g4KwO8g55saIZLGsgbN8oHY?=
 =?iso-8859-1?Q?Umm1McUkv+elTia8pKidEq5WIk7nj5HKFOksECiMLm97MNBH7d4yu00KtY?=
 =?iso-8859-1?Q?8wrh7pHuisuHxVWBX8dLd8wdPk+XIr+s80ELN85n7+Zwsl9xrzBYadqVmR?=
 =?iso-8859-1?Q?WPUIUcgz/IYJ+WcBmwRWR5GHgPEXvU3thBikYT+zyEwGOuvqIS2TWPZKzv?=
 =?iso-8859-1?Q?hy+iOdrXGfQQYBNxklLp37XBczllbPOOyliFSgrAzk0uZImsjH/Om3JUJN?=
 =?iso-8859-1?Q?5DUD/DS/zCy0Pe2Z/ltcyasAzGdSYoq2SYIy70VinksRvu7rZKjwZISTV/?=
 =?iso-8859-1?Q?W8ACWqM3Rj206bn0C5B8DBZpTz1Z8BBQ7dRWsCOm5tPTBgJRHuUrA+3M1M?=
 =?iso-8859-1?Q?+KHEN0X9slHffKsGYDl4IrjZbyj9I+yT2VNZEQW2iU5wQArLzNDEMLgUV6?=
 =?iso-8859-1?Q?6N71qUF4HcWzNxV/4h4hRfVYXmjxOz7OUJJN8Ol0WiVofFi2mlb5iQ0BDw?=
 =?iso-8859-1?Q?LfVi5+fGXVp9V74TgfCBd6n5om460HG2XsHg2ksbqrtMmgHnxOMQ1OU5Zq?=
 =?iso-8859-1?Q?mTuqg87wRHEjoRG8gmLAm27EuRBwrVQTpgF4ygvl/osfIuqkEwVyd+8tDl?=
 =?iso-8859-1?Q?o2X5AF7Qe5KJR5BdJxles98aB5q51EYRjDZ3GlPB2h1jKNKzAi4oHTziz2?=
 =?iso-8859-1?Q?h6dow8kp6Y8JG4mneGBeoR0pHGYjkkl1TTpxzrpetN22FV4c5qa9r4ztDe?=
 =?iso-8859-1?Q?rpXz5j2le+UVydFCAug+PpCY2sWCahocWjGCQQ7tsDW7xoHF6clxSplD/2?=
 =?iso-8859-1?Q?gsw6bicuAUNuym6YUdwXSrTNLTPgX4f/teCrhXCb2ZLNeR8G6kbt/O1nKt?=
 =?iso-8859-1?Q?StpfpwgSjXNYYudckMpAiIEyhcDaimmKGxAz4BuXCr8EO5aU07ZXOCnL+T?=
 =?iso-8859-1?Q?0VuAxzJRLiivOaLdFH8UfSOqvyQFFCnDt6/cKVTO63yao0elcd3BcGb38d?=
 =?iso-8859-1?Q?RHy9+2qkuTKGRB/yZnpl3ADleAUVkeB3mlk8R3EqUeLoDd8KlWyZHSLxJm?=
 =?iso-8859-1?Q?x3V5PjOvB0QzI+Q+73SJ9r8653VpB1t5Cg3pY9sO78czh6vPpEZGFkx1DO?=
 =?iso-8859-1?Q?n+gHaxLBeKtKzl5/8FerQnRzFCRql3W2L1era6geYn6e0++WXH8QjpzQMI?=
 =?iso-8859-1?Q?cUJIxI4SpjH3zrQN3s05qlfFuQHVs25998rcX/aS43mtlngdsA7G1YLzz9?=
 =?iso-8859-1?Q?7nF5bqcJ/2IqJXq0NK26vTONy8qO0/CxUM4v+f6tgnNMRRTMQ/OKe7lx9I?=
 =?iso-8859-1?Q?DOufkTzRKEJjdd71zEb1EX5Qu7T489aOGQNTb44WX2ZT1o+gLQvolaIIlr?=
 =?iso-8859-1?Q?DMuMHbINSdYOI1PqwpeLRapYZDkjfiCVOIE0gIUfE5Q4/dDYjjdYP2h/u0?=
 =?iso-8859-1?Q?E0ogYJe8veWWz0Ic47jW+xcvN6adGoE6d4AJ6zoZNgGuFsKd2i5BI8Xg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3029b88-ff3f-43bc-3c90-08dbd9bd8407
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 03:00:19.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7GWPOkJEQ8QE8zycp12jIRb/TmOuj9OezlF5I9qkMQ7R+Q/Dd9g/JduenWuB7i+LFtylymfO+TIUsCZ2AkRAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 383.0% improvement of stress-ng.kcmp.ops_per_sec on:


commit: 90c436a64a6e20482a9a613c47eb4af2e8a5328e ("apparmor: pass cred through to audit info.")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: stress-ng
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 10%
	disk: 1HDD
	testtime: 60s
	fs: ext4
	class: os
	test: kcmp
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231031/202310311037.173ebf2b-oliver.sang@intel.com

=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp7/kcmp/stress-ng/60s

commit: 
  d20f5a1a6e ("apparmor: rename audit_data->label to audit_data->subj_label")
  90c436a64a ("apparmor: pass cred through to audit info.")

d20f5a1a6e792d22 90c436a64a6e20482a9a613c47e 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      9.11           -11.6%       8.05        iostat.cpu.system
      0.65 ±  3%    +166.0%       1.73 ±  2%  iostat.cpu.user
      9678            -1.5%       9531        proc-vmstat.nr_mapped
      7569 ±  3%      -5.2%       7176 ±  2%  proc-vmstat.nr_shmem
    327.49 ± 22%     +71.1%     560.45 ± 27%  sched_debug.cfs_rq:/.min_vruntime.min
      3740 ±  7%    +472.8%      21422 ±175%  sched_debug.cpu.avg_idle.min
      0.03 ±  6%      +0.0        0.04 ± 10%  mpstat.cpu.all.iowait%
      8.53            -1.1        7.44        mpstat.cpu.all.sys%
      0.65 ±  3%      +1.1        1.77 ±  2%  mpstat.cpu.all.usr%
    148.50 ± 12%     -67.5%      48.33 ± 33%  perf-c2c.DRAM.remote
    227.00 ± 15%     -64.8%      80.00 ± 28%  perf-c2c.HITM.local
    138.67 ± 12%     -70.9%      40.33 ± 34%  perf-c2c.HITM.remote
      0.13 ±  2%    +268.8%       0.47        turbostat.IPC
     55.83            +3.3%      57.67        turbostat.PkgTmp
    153.93            +5.7%     162.64        turbostat.PkgWatt
  10117756 ±  2%    +383.0%   48867736        stress-ng.kcmp.ops
    168628 ±  2%    +383.0%     814456        stress-ng.kcmp.ops_per_sec
    345.46           -13.2%     299.82        stress-ng.time.system_time
     11.72 ±  4%    +389.0%      57.28        stress-ng.time.user_time
      6.52 ± 15%    +195.0%      19.23 ± 13%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     16.50 ± 45%     +77.8%      29.33 ± 20%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork
    776.00 ± 14%     -66.5%     260.17 ± 13%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    647.02 ± 10%     -11.5%     572.36 ±  6%  perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.submit_bio_wait
    258.50 ± 29%     +70.3%     440.17 ±  9%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      6.51 ± 15%    +195.2%      19.22 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    647.01 ± 10%     -11.5%     572.35 ±  6%  perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.submit_bio_wait
    258.50 ± 29%     +70.3%     440.16 ±  9%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.43           -89.2%       0.05 ± 17%  perf-stat.i.MPKI
 1.384e+09 ±  2%    +308.1%  5.649e+09        perf-stat.i.branch-instructions
      0.31 ±  3%      -0.2        0.15 ±  5%  perf-stat.i.branch-miss-rate%
   2929065 ±  3%     -66.5%     982533 ± 25%  perf-stat.i.cache-misses
   9544710           -56.6%    4146447 ±  3%  perf-stat.i.cache-references
      2.98 ±  2%     -76.1%       0.71        perf-stat.i.cpi
      7054 ±  3%    +341.9%      31175 ± 28%  perf-stat.i.cycles-between-cache-misses
      0.29 ±209%      -0.3        0.01 ±  5%  perf-stat.i.dTLB-load-miss-rate%
 1.693e+09 ±  2%    +318.1%  7.078e+09        perf-stat.i.dTLB-loads
      0.27 ±218%      -0.3        0.00 ±  9%  perf-stat.i.dTLB-store-miss-rate%
 8.821e+08 ±  2%    +346.0%  3.934e+09        perf-stat.i.dTLB-stores
 6.876e+09 ±  2%    +312.2%  2.834e+10        perf-stat.i.instructions
      0.36 ±  2%    +294.8%       1.42        perf-stat.i.ipc
    196.31 ±  2%     -58.4%      81.75 ±  4%  perf-stat.i.metric.K/sec
     61.84 ±  2%    +320.9%     260.30        perf-stat.i.metric.M/sec
     93.40           -18.7       74.72 ±  8%  perf-stat.i.node-store-miss-rate%
 1.139e+12 ±223%    -100.0%     312575 ± 40%  perf-stat.i.node-store-misses
      0.43           -91.9%       0.03 ± 26%  perf-stat.overall.MPKI
      0.42 ±  4%      -0.3        0.10 ±  8%  perf-stat.overall.branch-miss-rate%
      2.89 ±  2%     -75.7%       0.70        perf-stat.overall.cpi
      6796 ±  3%    +214.9%      21399 ± 20%  perf-stat.overall.cycles-between-cache-misses
     16.68 ±223%     -16.7        0.01 ±  3%  perf-stat.overall.dTLB-load-miss-rate%
     16.67 ±223%     -16.7        0.00 ±  4%  perf-stat.overall.dTLB-store-miss-rate%
      0.35 ±  2%    +311.5%       1.42        perf-stat.overall.ipc
     94.23 ±  2%     -29.6       64.61 ± 14%  perf-stat.overall.node-store-miss-rate%
 1.362e+09 ±  2%    +308.1%  5.559e+09        perf-stat.ps.branch-instructions
   2881973 ±  3%     -66.5%     966092 ± 25%  perf-stat.ps.cache-misses
   9392130           -56.6%    4077063 ±  3%  perf-stat.ps.cache-references
 1.666e+09 ±  2%    +318.1%  6.965e+09        perf-stat.ps.dTLB-loads
  8.68e+08 ±  2%    +346.0%  3.871e+09        perf-stat.ps.dTLB-stores
 6.766e+09 ±  2%    +312.2%  2.789e+10        perf-stat.ps.instructions
  1.12e+12 ±223%    -100.0%     307444 ± 40%  perf-stat.ps.node-store-misses
 4.288e+11 ±  2%    +311.2%  1.763e+12        perf-stat.total.instructions
     74.76           -61.2       13.56        perf-profile.calltrace.cycles-pp.apparmor_ptrace_access_check.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp.do_syscall_64
     75.40           -59.3       16.09        perf-profile.calltrace.cycles-pp.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.51 ±  6%     -52.5        0.00        perf-profile.calltrace.cycles-pp.aa_get_task_label.apparmor_ptrace_access_check.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp
     77.46           -52.3       25.17        perf-profile.calltrace.cycles-pp.ptrace_may_access.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     85.77           -22.3       63.48        perf-profile.calltrace.cycles-pp.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     86.87           -18.6       68.26        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     87.39           -16.5       70.84        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     90.64            -4.4       86.22        perf-profile.calltrace.cycles-pp.syscall
      0.00            +0.6        0.60        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +0.8        0.77 ± 35%  perf-profile.calltrace.cycles-pp.__errno_location
      0.00            +0.8        0.84 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.task_lookup_fd_rcu.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.91 ±  2%  perf-profile.calltrace.cycles-pp.cap_ptrace_access_check.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp.do_syscall_64
      0.00            +1.0        0.97 ±  3%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      0.00            +1.0        1.00 ±  2%  perf-profile.calltrace.cycles-pp.idr_find.find_task_by_vpid.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        1.03 ±  2%  perf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +1.1        1.08 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      0.00            +1.1        1.09 ±  4%  perf-profile.calltrace.cycles-pp.__cond_resched.down_read_killable.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.2        1.25 ±  3%  perf-profile.calltrace.cycles-pp.task_lookup_fd_rcu.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +1.5        1.49 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +1.5        1.52 ±  2%  perf-profile.calltrace.cycles-pp.shim_kcmp
      0.70 ±  4%      +2.1        2.82        perf-profile.calltrace.cycles-pp.up_read.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.27 ±100%      +2.2        2.47        perf-profile.calltrace.cycles-pp.__ptrace_may_access.ptrace_may_access.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.65 ±  9%      +2.5        3.13 ±  7%  perf-profile.calltrace.cycles-pp.stress_kcmp
      0.00            +3.2        3.15 ±  2%  perf-profile.calltrace.cycles-pp.get_task_cred.apparmor_ptrace_access_check.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp
      1.16 ±  5%      +3.9        5.04 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.ptrace_may_access.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.13 ±  5%      +4.3        5.40        perf-profile.calltrace.cycles-pp.down_read_killable.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.08 ±  9%      +4.9        5.97        perf-profile.calltrace.cycles-pp.aa_may_ptrace.apparmor_ptrace_access_check.security_ptrace_access_check.ptrace_may_access.__do_sys_kcmp
      1.86 ±  3%      +6.8        8.68 ±  2%  perf-profile.calltrace.cycles-pp.__radix_tree_lookup.find_task_by_vpid.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.41 ±  3%      +9.0       11.40        perf-profile.calltrace.cycles-pp.__entry_text_start.syscall
      2.73 ±  3%     +10.1       12.87        perf-profile.calltrace.cycles-pp.find_task_by_vpid.__do_sys_kcmp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     74.90           -60.9       13.95        perf-profile.children.cycles-pp.apparmor_ptrace_access_check
     75.54           -58.8       16.76        perf-profile.children.cycles-pp.security_ptrace_access_check
     52.55 ±  6%     -52.5        0.00        perf-profile.children.cycles-pp.aa_get_task_label
     77.61           -51.8       25.82        perf-profile.children.cycles-pp.ptrace_may_access
     86.06           -21.4       64.68        perf-profile.children.cycles-pp.__do_sys_kcmp
     87.33           -18.1       69.27        perf-profile.children.cycles-pp.do_syscall_64
     87.72           -16.5       71.24        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     90.62            -4.5       86.16        perf-profile.children.cycles-pp.syscall
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.mutex_unlock
      0.00            +0.1        0.06 ± 21%  perf-profile.children.cycles-pp.fput
      0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.mutex_lock
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.fget_task
      0.00            +0.2        0.17 ± 10%  perf-profile.children.cycles-pp._copy_from_user
      0.00            +0.2        0.18 ± 16%  perf-profile.children.cycles-pp.get_epoll_tfile_raw_ptr
      0.06 ± 17%      +0.2        0.27 ±  6%  perf-profile.children.cycles-pp.syscall@plt
      0.07 ±  6%      +0.2        0.30 ±  7%  perf-profile.children.cycles-pp.yama_ptrace_access_check
      0.11 ± 58%      +0.3        0.41 ±  4%  perf-profile.children.cycles-pp.__errno_location@plt
      0.16 ±  8%      +0.4        0.55 ±  5%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 ± 11%      +0.4        0.53 ±  5%  perf-profile.children.cycles-pp.rcu_all_qs
      0.12 ± 14%      +0.4        0.54 ±  4%  perf-profile.children.cycles-pp.radix_tree_lookup
      0.12 ± 12%      +0.4        0.56 ±  3%  perf-profile.children.cycles-pp.__x64_sys_kcmp
      0.18 ±  9%      +0.6        0.74 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.18 ± 13%      +0.7        0.92 ± 29%  perf-profile.children.cycles-pp.__errno_location
      0.22 ±  4%      +0.8        1.03 ±  2%  perf-profile.children.cycles-pp.cap_ptrace_access_check
      0.24 ±  5%      +0.8        1.09 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.21 ±  5%      +0.9        1.10 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.26 ±  4%      +0.9        1.16 ±  2%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.26 ±  6%      +1.0        1.28 ±  2%  perf-profile.children.cycles-pp.idr_find
      0.31 ±  8%      +1.0        1.33 ±  3%  perf-profile.children.cycles-pp.task_lookup_fd_rcu
      0.31 ±  7%      +1.1        1.46 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.47 ±  6%      +1.5        1.95 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.38 ± 10%      +1.5        1.91 ±  2%  perf-profile.children.cycles-pp.shim_kcmp
      0.55 ±  7%      +2.2        2.74        perf-profile.children.cycles-pp.__ptrace_may_access
      0.72 ±  4%      +2.2        2.96        perf-profile.children.cycles-pp.up_read
      0.71 ±  8%      +2.7        3.36 ±  6%  perf-profile.children.cycles-pp.stress_kcmp
      0.00            +3.3        3.30 ±  2%  perf-profile.children.cycles-pp.get_task_cred
      1.16 ±  4%      +4.3        5.49        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.20 ±  5%      +4.6        5.75        perf-profile.children.cycles-pp.down_read_killable
      1.54 ±  4%      +4.8        6.31        perf-profile.children.cycles-pp._raw_spin_lock
      1.10 ±  9%      +5.0        6.11        perf-profile.children.cycles-pp.aa_may_ptrace
      1.38 ±  3%      +5.2        6.57        perf-profile.children.cycles-pp.__entry_text_start
      1.92 ±  3%      +7.0        8.96 ±  2%  perf-profile.children.cycles-pp.__radix_tree_lookup
      2.85 ±  4%     +10.6       13.44        perf-profile.children.cycles-pp.find_task_by_vpid
     52.33 ±  6%     -52.3        0.00        perf-profile.self.cycles-pp.aa_get_task_label
     21.23 ± 16%     -16.6        4.67 ±  5%  perf-profile.self.cycles-pp.apparmor_ptrace_access_check
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.mutex_unlock
      0.00            +0.1        0.07 ± 14%  perf-profile.self.cycles-pp.mutex_lock
      0.00            +0.1        0.09 ± 12%  perf-profile.self.cycles-pp.fget_task
      0.00            +0.1        0.13 ±  9%  perf-profile.self.cycles-pp.syscall@plt
      0.00            +0.2        0.17 ± 11%  perf-profile.self.cycles-pp._copy_from_user
      0.02 ± 99%      +0.2        0.20 ±  8%  perf-profile.self.cycles-pp.yama_ptrace_access_check
      0.06 ± 13%      +0.2        0.27 ±  4%  perf-profile.self.cycles-pp.radix_tree_lookup
      0.06            +0.2        0.28 ±  5%  perf-profile.self.cycles-pp.__x64_sys_kcmp
      0.09 ± 14%      +0.2        0.33 ±  7%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08 ± 16%      +0.3        0.36 ±  4%  perf-profile.self.cycles-pp.rcu_all_qs
      0.09 ± 16%      +0.3        0.43 ±  6%  perf-profile.self.cycles-pp.task_lookup_fd_rcu
      0.13 ± 13%      +0.5        0.61        perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.16 ±  8%      +0.6        0.71 ±  2%  perf-profile.self.cycles-pp.cap_ptrace_access_check
      0.19 ±  4%      +0.6        0.79 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.11 ± 44%      +0.6        0.76 ± 35%  perf-profile.self.cycles-pp.__errno_location
      0.19 ±  8%      +0.7        0.91 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.22 ±  6%      +0.8        0.99 ±  2%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.21 ±  5%      +0.8        0.99 ±  3%  perf-profile.self.cycles-pp.idr_find
      0.24 ±  5%      +0.8        1.09 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.21 ±  5%      +0.9        1.10 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.28 ±  7%      +1.0        1.28 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.36 ±  4%      +1.1        1.46 ±  4%  perf-profile.self.cycles-pp.ptrace_may_access
      0.29 ± 13%      +1.2        1.52 ±  2%  perf-profile.self.cycles-pp.shim_kcmp
      0.36 ±  5%      +1.4        1.74 ±  5%  perf-profile.self.cycles-pp.__entry_text_start
      0.44 ±  6%      +1.4        1.84        perf-profile.self.cycles-pp.security_ptrace_access_check
      0.41 ±  4%      +1.7        2.11        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.50 ±  8%      +2.0        2.47        perf-profile.self.cycles-pp.__ptrace_may_access
      0.68 ±  4%      +2.1        2.81        perf-profile.self.cycles-pp.up_read
      0.63 ±  5%      +2.4        3.03 ±  2%  perf-profile.self.cycles-pp.find_task_by_vpid
      0.67 ±  9%      +2.5        3.21 ±  7%  perf-profile.self.cycles-pp.stress_kcmp
      0.00            +3.1        3.14 ±  2%  perf-profile.self.cycles-pp.get_task_cred
      0.90 ±  6%      +3.4        4.32        perf-profile.self.cycles-pp.down_read_killable
      1.14 ±  4%      +4.2        5.36        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.46 ±  3%      +4.5        5.97 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      1.22 ±  3%      +4.5        5.73        perf-profile.self.cycles-pp.syscall
      1.07 ±  8%      +4.9        5.99        perf-profile.self.cycles-pp.aa_may_ptrace
      1.86 ±  4%      +6.8        8.66 ±  2%  perf-profile.self.cycles-pp.__radix_tree_lookup
      3.48 ±  4%     +12.2       15.72        perf-profile.self.cycles-pp.__do_sys_kcmp




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

