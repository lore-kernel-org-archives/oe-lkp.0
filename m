Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84F1F945
	for <oe-lkp@lists.linux.dev>; Wed,  7 Feb 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707291478; cv=fail; b=jW7stBYiMyWMd/ucGM+JmvGVlPo0zTLJoXf8fTTRllgvJ/W9ptlOnxDNVKLYwnfceLZ4Xg5y+sxQwJH+ANgRnk0Zko5yBYuEHM6W0daQJgJihpwQHJu9iAm8VP3G1+L1DEQazb47VQIbOUATbzPOqHqMEzJBNmljITAuQZXWEXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707291478; c=relaxed/simple;
	bh=oUUyFx8mdSs9xAMgbKvkM0bueIWc921nsLPgRwOARK8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OViaqhI6Ou/MsPM5aHLhHXxyGwsU7ajoZUpfGA7hzmtX4o4YAF3hwNTMGNaZCwh+yaWYCFEOSjW9gPdfkZDxcsMAehsOl8+1XBQPl5fsnTEZNha49JENM1IikVj6VOhwzA75nx640vfdEQwyVCNp02+1oDmOtYI2hIuQz41FFRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHuwPaby; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHuwPaby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707291475; x=1738827475;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=oUUyFx8mdSs9xAMgbKvkM0bueIWc921nsLPgRwOARK8=;
  b=VHuwPabyddm0TnsomUD8lmtHClhfMaFIvoEjF/fRSXbIFBXfjexezunS
   fMaDkkbVXiwproiWM361fgki/FIr9G11QLu35eE2Dq0YLMor0AkXz2WxE
   wTIKZNhT2w9BDuUddjBm2DWk8HICk/jTxm1r43Pc6a97H0FWPddHyiZLM
   kpw8CC66o1856yqgLIkmvSnMDOqdyLmsW2RtRh2fyuUbRALJVot6cCamm
   GnEJq4Ek4HTEKQ0A/Ot5kEic6PEwer/LzPJeH5O05/0Q0QTa7tL7i4Pfm
   LG+ysrXrLpQj9QX4ZtPW1IWLqLuQcquicPonRd89bDoDeMl3ncxKYxOkx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1091116"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1091116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 23:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1564798"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2024 23:37:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 23:37:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 23:37:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 23:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7NLGB31yLML+7DLuexqDN3L6rI2tcMYCTqO//I9Jfr5dCv4n1pFuYT/ERrMOL+j73DQgLdS8acE/alwLKahQ96N6D9TMAVKUPZIkgWUs9stg/xFeUfcvBJBlr4t1ToexjPOa1C4PLebgwUp0xKqXlKpyvGik4X+xpf7TA1CwphRExgFROy0is7YhnnSF9LnxFBZhJWCNKN6Ll7gj3V9Ml7HT/lCs82m48HcaRAKsLTtpj3uckGzi2nrSt6jh7shtdICYSWuaphWyEWhTbUyZP6yv4YKYQnxdfi9xaoGIAjbj4tLgBvza4rut1k2okySTzo0YHP1IhTPj/hN77IZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td6EC0Nnh3TglSUuXaDDJ5dM5CGMZ3thFYXSPHFoRP0=;
 b=oY1pUYhQmAHknnIGTYmNsonItxF0TYFkame69ZYWG6vvMoPlC2NZbYoN4t6CExvdSC03EDfLjSQC9MMWKD8z9KFzKuZmGbYHh8pYdqOokQn7WnflfdZB6NT4AyuNKOAVNDL+VhYYkI6hpOe0qpRzxp8+NlYowz76xb1mIXMDnmm8T6nIskMygrWQjjLaFwy8QSsSYX2NBDUxpcd7Q0oFCa7f7igEwu/VAvtJUs4F6ST5PtOQP4DKJRr3WRqD4bSlNSdQ+6HfGoiXuYNknR7m4Btd5udESm8QoINA/rAfYD4hlH/+wnEsXmWbidltUOgn9EaWw12elGf0MpFc4lMxfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 07:37:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 07:37:41 +0000
Date: Wed, 7 Feb 2024 15:37:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:sb_write_barrier] [fsnotify]  9c13a708ef:
 will-it-scale.per_thread_ops -4.2% regression
Message-ID: <202402071553.75bfbe67-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 7435f15f-73fe-4565-666e-08dc27afaa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQ4tiR6YpgpfNgopSX1Io7auVwVN3iI7I0ftxeTm6xDpGyTqgU8OwbgWCaZV9t9sf1IeeyQyfVPzuShPAtuYMadeu31ZNNt9OonmE4vlvDr5pVHYq2T9ymSySHuuug4I69UkTw0tpkmcDXCTXb9x3q1jTWk3Rp+4UCZDmWyB2HbOlSkNgffVxKelqVMMvMiyTM1y2UeZuBz/9LZr4gfJ5vMzSO8fAUHW2rNsfupmdAxdr+1yd5uXSNU+TICmsqrIgfakYAmc2SVOOuYvwp1haQMB0fqIUp0OBlZLNWRwOQtcXfXF/ir4yyS7+V2EX5Bvb7Q9fGt3qOUY+vVl+9QV3mjKdRgkkhxPHxP+dGBLK4w48S0WchczgaqM6TheEVUqJ5EnTHP/dBaLiV7H+cX5cKNBzbhMC1Kp6tsZ5Yg8etkI+lJiWR/UZRjWXNh+vrYgo7CmzVAbxJQ4kXqUcNANMucOtZvd8o5iJW5cJ0ck5/ZM9fZpnhY5nBP4FJwZIPuRkDivbu3BtQZWv4ftcCgq7yMpwYQe5d7eXghKFhP9AdF7ODT+fWeaf1HEVQcB85hzhuK7ZJuo3UO8m/DCDlbNow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(230473577357003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(30864003)(41300700001)(83380400001)(38100700002)(26005)(82960400001)(107886003)(1076003)(2616005)(86362001)(6506007)(6512007)(66556008)(6916009)(66476007)(6666004)(478600001)(966005)(6486002)(66946007)(36756003)(4326008)(8676002)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g4DWN85Jb4tbwMq0uXoSRO5J6KP/Rlcwbmoe/0S9OkVJFu7VEQ4VGq05vz?=
 =?iso-8859-1?Q?cywkc4TCYeb3MF+1ekngOC3t9cRSaeCuqkmBR2lXwJyfK0/aqOeE4FIPow?=
 =?iso-8859-1?Q?BsvrOJKIS611wfW83skgT/mUQM0wUMZdmY13+N2bMViYTSDPlkqjbutcM6?=
 =?iso-8859-1?Q?bynk+O9Gl6LaFqnW0G7tvqUKx/6rbSlRosZFS5dbGotOzA4U5RRET+Ee5q?=
 =?iso-8859-1?Q?a3sI9+nZAaTEBAxQMDRegwvAHYLmq+9rXZordcIitkQ8Ts1DTHUQJ8ODFR?=
 =?iso-8859-1?Q?PD3AEMNFpQbyujpT6PbzX0Rryh92Rnhiv0ewfyD0uMCA/zipLdTlq1va18?=
 =?iso-8859-1?Q?rNja0xntKMKRuRoj0z+/sQ1tTkxbZ8roB0/amidekZ9DVN1Ol4t2wI6ija?=
 =?iso-8859-1?Q?7GKy/rwTMDrCqZII+ui6RmQMiXh7RMyHSSq4hcne4+KZW0ttO+5bm1I6Wc?=
 =?iso-8859-1?Q?Hpf/W3Y9Wqvq/bAfwgNo8tAfAiJbGmaurtKUPl1ryD/EoOJFRdziuQmvnr?=
 =?iso-8859-1?Q?uNSHPmRv9WEo3R8HZh/DPY/0jOzRkMYzRZNqrwVTMJGY+DbMMTmEBpn/Nh?=
 =?iso-8859-1?Q?1vFIKOD2jzOvI4ifcmlRi6A9t8dtVshpJJYOhkgLBO2obVtFDcAevmbseL?=
 =?iso-8859-1?Q?6p0AzRXaB93vv5Gi3ePZmHFNOa4f8ES75qZ9HLXwxUWalxknjAG6qELdtv?=
 =?iso-8859-1?Q?LXBT4xonM8llP9cJAhXPbUkuoGrgxB68Vu0pefvK5pWJfJWGF+UEGILN8z?=
 =?iso-8859-1?Q?f45Q++3jqIgoqkeNucwg4+zLnzHge2UXsj3cvzk+K2yirfRbayz4SMvfeb?=
 =?iso-8859-1?Q?SvqLhLSXjbVIpYe2XXx+PFcmvfW7FHWzNbCzOaZlcWwdnohL4RY8ssQVNh?=
 =?iso-8859-1?Q?Ap97pGwDxcFIHDffLSeFBuShY0CR9oTxZUByI9aBwYKZXuW/sDr8HekRex?=
 =?iso-8859-1?Q?YRDIufPMDQDWXlNkIzEdYTwoH2aFqBQugihwBwntT32xmQnhrmjeWysc3S?=
 =?iso-8859-1?Q?rBmyD2Fguxj11a61yNTSu0RoaLnyzsf1pWsRz7kck5G1FhcQU0Sr8Mybpw?=
 =?iso-8859-1?Q?lTxpIa65vGMamWwHHPRHvOmbPBZLvCqhWPbZRnt5q8oh0emRx6sKCl65pu?=
 =?iso-8859-1?Q?PqtirFBCGS7I1ULy9MIoJi8dugMbyOj0xvQXMaO/gi+CDHQdEGxqoI5/yP?=
 =?iso-8859-1?Q?qlYPyOWCIeN4BIVsstH7lNbShkhmkmk7UozVHaNY025OOE0tpZlFT7aZ0t?=
 =?iso-8859-1?Q?Pf7clmZ7TCoUgtnwoofY21FxeAAwFfZ0eY4HDw/hEjjnCscrgOK50h+qJo?=
 =?iso-8859-1?Q?8tlQkgHuwdfZwlWRnpZMimXYT4/NHgjfYK6INhWc3T9/YjRgNXtdDMIK42?=
 =?iso-8859-1?Q?vtzrkN/lM/5KuSJRg+5KHCUlyyPQ5Vp+wqQ9PnU4HCMRANrxCd3ETvreIQ?=
 =?iso-8859-1?Q?JH3/CGsS7z3rFSOmcOI6lTxf6miNeDe15VLRNO+3MeIuCtcVt5HDleTvhb?=
 =?iso-8859-1?Q?KTOcm8ZXP6K5cAgBW9UEvB4yoi6AVz4c23vKKoc0y1KBY7R0Jo955L+r/F?=
 =?iso-8859-1?Q?NPkHzY7pCJf4iYAN63/e6jde+v3UkG4PbRUZjTvxwtaE0S0mouhE2rQeoj?=
 =?iso-8859-1?Q?01q9x8Lp/nF+x3CmzVmr1kDOM0/7iy7uNCKwxa4+8OCBH0dHV8VafDHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7435f15f-73fe-4565-666e-08dc27afaa51
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:37:41.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXhh/QZ2NARL/84oZDVNs7u/6QGX/Qa4zGvTjOSJ/AIinQwUJanmac8V1CBeo/vF3qFWx49L+zVapHGe9HyjRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -4.2% regression of will-it-scale.per_thread_ops on:


commit: 9c13a708efa02450fb5a50fc02a6eaf060fa00a1 ("fsnotify: introduce pre-content permission event")
https://github.com/amir73il/linux sb_write_barrier

testcase: will-it-scale
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	test: writeseek1
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402071553.75bfbe67-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240207/202402071553.75bfbe67-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/writeseek1/will-it-scale

commit: 
  v6.8-rc2
  9c13a708ef ("fsnotify: introduce pre-content permission event")

        v6.8-rc2 9c13a708efa02450fb5a50fc02a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   4545846           -17.2%    3762707 ±  2%  perf-stat.i.branch-misses
   6033867            +6.9%    6452266 ±  4%  perf-stat.i.cache-references
    807736 ±  2%      -4.0%     775584        perf-stat.i.cycles-between-cache-misses
      0.00 ±  4%      +0.0        0.00 ±  2%  perf-stat.i.dTLB-load-miss-rate%
   1429967 ±  4%     +99.5%    2852921        perf-stat.i.dTLB-load-misses
      0.00            +0.0        0.00 ±  6%  perf-stat.i.dTLB-store-miss-rate%
    198009 ±  4%     +22.8%     243225        perf-stat.i.dTLB-store-misses
 7.666e+10            -1.6%  7.545e+10        perf-stat.i.dTLB-stores
     28.02            +7.7%      30.17 ±  4%  perf-stat.i.metric.K/sec
      0.01            -0.0        0.00 ±  2%  perf-stat.overall.branch-miss-rate%
      0.00 ±  3%      +0.0        0.00        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  4%      +0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
     59225            +4.8%      62089        perf-stat.overall.path-length
   4506836           -17.3%    3728584 ±  2%  perf-stat.ps.branch-misses
   6011710            +7.1%    6437999 ±  4%  perf-stat.ps.cache-references
   1434727 ±  4%     +98.4%    2845885        perf-stat.ps.dTLB-load-misses
    200572 ±  4%     +21.8%     244358        perf-stat.ps.dTLB-store-misses
 7.687e+10            -1.7%  7.559e+10        perf-stat.ps.dTLB-stores
   2743205            -6.6%    2562110 ±  5%  will-it-scale.1.linear
   2743205           -12.2%    2409691 ± 19%  will-it-scale.1.processes
   2370614            -4.2%    2270359        will-it-scale.1.threads
 3.072e+08            -6.6%   2.87e+08 ±  5%  will-it-scale.112.linear
 3.067e+08            -4.6%  2.927e+08        will-it-scale.112.processes
 2.649e+08            -4.3%  2.534e+08        will-it-scale.112.threads
 4.609e+08            -6.6%  4.304e+08 ±  5%  will-it-scale.168.linear
 3.433e+08            -4.9%  3.265e+08        will-it-scale.168.processes
 2.974e+08            -4.2%  2.849e+08        will-it-scale.168.threads
 6.145e+08            -6.6%  5.739e+08 ±  5%  will-it-scale.224.linear
 3.959e+08            -4.3%  3.789e+08        will-it-scale.224.processes
   3.4e+08            -4.5%  3.248e+08        will-it-scale.224.threads
 1.536e+08            -6.6%  1.435e+08 ±  5%  will-it-scale.56.linear
 1.537e+08            -4.5%  1.468e+08        will-it-scale.56.processes
 1.325e+08            -4.0%  1.272e+08        will-it-scale.56.threads
   2407257            -6.3%    2255733 ±  4%  will-it-scale.per_process_ops
   2078006            -4.2%    1990130        will-it-scale.per_thread_ops
      3881            -3.6%       3740        will-it-scale.time.user_time
 2.239e+09            -4.4%   2.14e+09        will-it-scale.workload
     27.08            -1.1       25.98        perf-profile.calltrace.cycles-pp.__libc_lseek64
      1.86            -0.7        1.14        perf-profile.calltrace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
     15.07            -0.6       14.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     13.90            -0.6       13.31        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     10.96            -0.5       10.49        perf-profile.calltrace.cycles-pp.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
     11.70            -0.4       11.27        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.25            -0.4        9.86        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_lseek64
      9.97            -0.4        9.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__libc_write
     37.48            -0.3       37.14        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.35            -0.3       30.01        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      6.69            -0.3        6.40        perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.96            -0.3        0.68        perf-profile.calltrace.cycles-pp.generic_write_checks.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.98            -0.3        5.70        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      6.00            -0.3        5.75        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.vfs_write
      5.86            -0.3        5.60        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      4.57            -0.2        4.34        perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.44            -0.1        2.30        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.42            -0.1        2.30        perf-profile.calltrace.cycles-pp.mutex_lock.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.56            -0.1        1.48        perf-profile.calltrace.cycles-pp.up_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.54            -0.1        1.47        perf-profile.calltrace.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.66            -0.1        1.60        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      1.54            -0.1        1.47        perf-profile.calltrace.cycles-pp.folio_mark_accessed.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.38            -0.1        1.32        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1.54            -0.1        1.48        perf-profile.calltrace.cycles-pp.fput.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      1.61            -0.1        1.55        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.48            -0.1        1.42        perf-profile.calltrace.cycles-pp.mutex_unlock.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      0.74 ±  2%      -0.0        0.70        perf-profile.calltrace.cycles-pp.folio_mark_dirty.shmem_write_end.generic_perform_write.shmem_file_write_iter.vfs_write
      1.13            -0.0        1.08        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      1.17            -0.0        1.13        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      0.67            -0.0        0.64        perf-profile.calltrace.cycles-pp.fput.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      1.05            -0.0        1.02        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.65            -0.0        0.62        perf-profile.calltrace.cycles-pp.shmem_file_llseek.ksys_lseek.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_lseek64
      3.76            +0.2        3.98        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write
      4.10            +0.4        4.48        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     74.67            +0.4       75.08        perf-profile.calltrace.cycles-pp.__libc_write
      2.40            +0.4        2.85        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.53 ±  2%  perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.shmem_file_write_iter.vfs_write
      0.89            +0.8        1.66 ±  4%  perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.shmem_file_write_iter.vfs_write.ksys_write
      1.10            +1.0        2.07 ±  3%  perf-profile.calltrace.cycles-pp.file_update_time.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
     61.08            +1.6       62.65        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
     59.97            +1.6       61.59        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     57.25            +1.7       58.98        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     47.54            +2.2       49.79        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      2.61            +3.0        5.59        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.12            -1.2       27.96        perf-profile.children.cycles-pp.__libc_lseek64
      2.01            -0.8        1.20        perf-profile.children.cycles-pp.down_write
      3.97            -0.6        3.37        perf-profile.children.cycles-pp.__cond_resched
     12.32            -0.5       11.78        perf-profile.children.cycles-pp.__fdget_pos
     11.44            -0.5       10.96        perf-profile.children.cycles-pp.ksys_lseek
     11.78            -0.4       11.35        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
     11.41            -0.4       10.99        perf-profile.children.cycles-pp.entry_SYSCALL_64
     38.04            -0.4       37.62        perf-profile.children.cycles-pp.shmem_file_write_iter
     30.88            -0.4       30.52        perf-profile.children.cycles-pp.generic_perform_write
      6.85            -0.3        6.56        perf-profile.children.cycles-pp.shmem_write_begin
      2.21            -0.3        1.93        perf-profile.children.cycles-pp.rcu_all_qs
      5.18            -0.3        4.92        perf-profile.children.cycles-pp.mutex_lock
      6.24            -0.3        5.98        perf-profile.children.cycles-pp.shmem_get_folio_gfp
      1.08            -0.3        0.83        perf-profile.children.cycles-pp.generic_write_checks
      4.82            -0.2        4.57        perf-profile.children.cycles-pp.shmem_write_end
      5.13            -0.2        4.90        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.21            -0.1        3.10        perf-profile.children.cycles-pp.mutex_unlock
      0.58            -0.1        0.48        perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      2.66            -0.1        2.57        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.32            -0.1        2.23        perf-profile.children.cycles-pp.fput
      0.66            -0.1        0.58        perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      1.65            -0.1        1.56        perf-profile.children.cycles-pp.up_write
      1.62            -0.1        1.55        perf-profile.children.cycles-pp.folio_unlock
      1.91            -0.1        1.84        perf-profile.children.cycles-pp.security_file_permission
      1.47            -0.1        1.40        perf-profile.children.cycles-pp.filemap_get_entry
      1.62            -0.1        1.55        perf-profile.children.cycles-pp.folio_mark_accessed
      0.90 ±  2%      -0.1        0.85        perf-profile.children.cycles-pp.folio_mark_dirty
      1.30            -0.0        1.26        perf-profile.children.cycles-pp.apparmor_file_permission
      0.99            -0.0        0.94        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.47            -0.0        1.43        perf-profile.children.cycles-pp.testcase
      1.02            -0.0        0.98        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.49 ±  2%      -0.0        0.46        perf-profile.children.cycles-pp.folio_mapping
      0.73            -0.0        0.70        perf-profile.children.cycles-pp.shmem_file_llseek
      0.57            -0.0        0.54        perf-profile.children.cycles-pp.generic_file_llseek_size
      0.65            -0.0        0.62        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.32 ±  2%      -0.0        0.30        perf-profile.children.cycles-pp.__x64_sys_lseek
      0.30 ±  3%      -0.0        0.27        perf-profile.children.cycles-pp.__x64_sys_write
      0.57            -0.0        0.55        perf-profile.children.cycles-pp.write@plt
      0.16 ±  3%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.file_remove_privs
      0.33            -0.0        0.31 ±  2%  perf-profile.children.cycles-pp.__f_unlock_pos
      0.35 ±  3%      +0.2        0.52        perf-profile.children.cycles-pp.__file_remove_privs
      0.19 ±  4%      +0.2        0.42 ± 13%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.31            +0.3        0.59 ±  2%  perf-profile.children.cycles-pp.timestamp_truncate
      3.82            +0.3        4.14        perf-profile.children.cycles-pp.fault_in_readable
      4.19            +0.4        4.56        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      2.56            +0.4        3.01        perf-profile.children.cycles-pp.rw_verify_area
     76.40            +0.9       77.32        perf-profile.children.cycles-pp.__libc_write
     76.34            +0.9       77.28        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.99            +1.0        1.95 ±  3%  perf-profile.children.cycles-pp.inode_needs_update_time
     74.50            +1.0       75.50        perf-profile.children.cycles-pp.do_syscall_64
      1.23            +1.1        2.30 ±  2%  perf-profile.children.cycles-pp.file_update_time
     57.55            +1.7       59.27        perf-profile.children.cycles-pp.ksys_write
     48.12            +2.1       50.23        perf-profile.children.cycles-pp.vfs_write
      2.69            +3.0        5.74        perf-profile.children.cycles-pp.__fsnotify_parent
      1.54            -0.7        0.82        perf-profile.self.cycles-pp.down_write
      4.49            -0.6        3.88        perf-profile.self.cycles-pp.vfs_write
     11.68            -0.4       11.24        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      2.15            -0.3        1.84        perf-profile.self.cycles-pp.__cond_resched
      7.28            -0.3        7.00        perf-profile.self.cycles-pp.__fdget_pos
      5.04            -0.2        4.82        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.71            -0.2        0.50        perf-profile.self.cycles-pp.generic_write_checks
      1.38            -0.2        1.17        perf-profile.self.cycles-pp.rcu_all_qs
      5.37            -0.2        5.18        perf-profile.self.cycles-pp.__libc_write
      3.55            -0.2        3.36        perf-profile.self.cycles-pp.mutex_lock
      4.55            -0.2        4.39        perf-profile.self.cycles-pp.__libc_lseek64
      1.02            -0.1        0.90        perf-profile.self.cycles-pp.shmem_file_write_iter
      2.58            -0.1        2.46        perf-profile.self.cycles-pp.do_syscall_64
      2.20            -0.1        2.09        perf-profile.self.cycles-pp.shmem_write_end
      3.04            -0.1        2.93        perf-profile.self.cycles-pp.mutex_unlock
      0.50            -0.1        0.40        perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      2.60            -0.1        2.50        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.59            -0.1        0.50        perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      2.22            -0.1        2.14        perf-profile.self.cycles-pp.fput
      2.61            -0.1        2.53        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      1.58            -0.1        1.49        perf-profile.self.cycles-pp.up_write
      2.00            -0.1        1.93        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.54            -0.1        1.47        perf-profile.self.cycles-pp.folio_unlock
      1.53            -0.1        1.47        perf-profile.self.cycles-pp.folio_mark_accessed
      1.18            -0.1        1.12        perf-profile.self.cycles-pp.filemap_get_entry
      1.07            -0.1        1.01        perf-profile.self.cycles-pp.ksys_write
      1.60            -0.0        1.56        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.06            -0.0        1.02        perf-profile.self.cycles-pp.ksys_lseek
      0.99            -0.0        0.94        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.02            -0.0        0.98        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.66            -0.0        0.62        perf-profile.self.cycles-pp.shmem_write_begin
      0.41 ±  3%      -0.0        0.38        perf-profile.self.cycles-pp.folio_mapping
      1.25            -0.0        1.22        perf-profile.self.cycles-pp.testcase
      0.71            -0.0        0.68        perf-profile.self.cycles-pp.apparmor_file_permission
      0.69            -0.0        0.66        perf-profile.self.cycles-pp.security_file_permission
      0.49            -0.0        0.46        perf-profile.self.cycles-pp.generic_file_llseek_size
      0.48            -0.0        0.46        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.57            -0.0        0.54        perf-profile.self.cycles-pp.shmem_file_llseek
      0.21 ±  3%      -0.0        0.19        perf-profile.self.cycles-pp.__x64_sys_write
      0.23 ±  2%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.__x64_sys_lseek
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.file_remove_privs
      0.33 ±  2%      +0.1        0.42 ±  2%  perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.29 ±  2%      +0.2        0.44 ±  3%  perf-profile.self.cycles-pp.timestamp_truncate
      0.30 ±  3%      +0.2        0.47        perf-profile.self.cycles-pp.__file_remove_privs
      0.25 ±  3%      +0.2        0.42        perf-profile.self.cycles-pp.file_update_time
      0.15 ±  4%      +0.2        0.34 ± 17%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      2.02            +0.2        2.25        perf-profile.self.cycles-pp.generic_perform_write
      3.76            +0.3        4.05        perf-profile.self.cycles-pp.fault_in_readable
      0.57            +0.5        1.09        perf-profile.self.cycles-pp.rw_verify_area
      0.47            +0.5        1.02        perf-profile.self.cycles-pp.inode_needs_update_time
      2.60            +3.0        5.58        perf-profile.self.cycles-pp.__fsnotify_parent




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

