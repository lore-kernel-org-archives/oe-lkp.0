Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7260930EF95
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jun 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382485; cv=fail; b=HRnYgxOkj7CLYv2vOJd5uvua8mm3Qd4pBk0YSulsQn5h7BzZNf6+k7P3HB5KCrnDOGTJp2kfmn9pMJFJNnV/WPzI+NmESgV0HlS9LxCheskLV60Lx9FQjWJi9RO0UU2PFGTDKEZ19Gyhyq2Gkg+4cPEIPyzyaEgbDTllsCTUqKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382485; c=relaxed/simple;
	bh=ayq92+svr+DMh62w/UntdPWS7xdTO0R4NMHW3wy7WbM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=q+h1mdjuw7vXO5OhnGEjC14ThVvGPc4QMgScXZSqB7wSFmTdMF6hRAODSTfmylf2WZJ0sOJ08rrydkUEGNIgUCWmYcF4ptM5RuWAYn2dC5nuLLucIz5SUc8NbmmY3awXT+Iz7wV+6di61mjKGSugLqUIdbTijSp++37S4eQsBmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nB3qdvgM; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nB3qdvgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780382481; x=1811918481;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ayq92+svr+DMh62w/UntdPWS7xdTO0R4NMHW3wy7WbM=;
  b=nB3qdvgMYegucimNGo7+Nf0EhKanc3i02HxsZR3wfwEz2wkM9h8w9OSc
   ACfuIM3rJ2CujE9fKfcwJSso0GYR4W+MwUmtVsAKmlndjrr9PRgw7nkoI
   Rn20Lgio3IhJwyg888vLYDLs9Dta3Rwr0NJq2d67gb+nvShhg7PRI8S3x
   DcjeNWT4mxvL6iJ9qHCyoZ15coZWwZYlK/8LjqOHqGi4zcHe3d8fqxgk/
   LtiANhj2QJ0X8nj2eaphIJGOqgCQOVPPw9vxAvsnwg0H0JjT17t2Dore5
   busOFAPnHxcCcVvByQfOW5nTFwxY1YTrvvkm/ww/8gKERis15eVLK9N/l
   w==;
X-CSE-ConnectionGUID: e58jgmEHQSqY8M/g1q2IfQ==
X-CSE-MsgGUID: IogUzfVxRf2x2rhlLrCb6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81187783"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81187783"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 23:41:20 -0700
X-CSE-ConnectionGUID: eJ0cm841Tcupo/KYkDGacQ==
X-CSE-MsgGUID: Pd6uymTHQI2z20wHzcYUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="267678715"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 23:41:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 23:41:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 23:41:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 23:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpXXb5t3XVxUx4n8oTqm3nIjh3J+UHfKMrglD6AcVKikcEDUzwuaSFdWUNIQ/piagU3upwJtCkgw1SaPbkjf6OuCegR0nI5KCJTd2T8bUoBnjv+k8PCDq24hEqfEOvloj6hAxZ8KkhABi+cvb1gEYB1LFwFfoKD4LjprzBo7xukguNnwjDftqiVyUmuyQlFOSuM8XQE7gELeH2BWDWxlbj23vufRvsbDkSbXrTFRWgpvLYCJwDqPCypXSq3HWWOn+Ua66lH6chvdbaUO4f69F7RdYeY/oui/kHc6eiGpzhhJ/DqQKbbDbEiGG7hnAP53bfKaFgrWcnjwGjKcl6EiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/3wcZJITfCODPZTZGGbcANj5x+ohMwj4n7Kgl2AKVo=;
 b=FL9mUnmdq7UKQbbBOGED5K6y40ZtOtHL7/1vqV4JYSo7mpalpMlwhxR4Sd4wM+ak1u1CUcyQLBC9zRSwbj2QVBTqSyvZz4zPUTfoQDLbS2TbOj7wkivAP43Qg80fdWgVJ3XfcFgB7jdEuN4Recom3bb5CEyh8wQSN8MCNVav6nlYN8/SCU3HImdPUzTbkiSeicXqK/stDAPEf8TjYafAUdYnihj2HNzHzglazdfbqlEV/TyepZyM5zt2G+hbjsSzPY7J/9OhrtQbmEax4NcTouwadl7dcqBAt5826JSs6R0WCon4zoXrCzOjiX7CStUc3yHWA5rzpS973m/8v0vekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DSVPR11MB9892.namprd11.prod.outlook.com (2603:10b6:8:45c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 06:41:17 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:41:17 +0000
Date: Tue, 2 Jun 2026 14:41:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [kkdwivedi:arena/tmp-slab-nofix] [bpf,slab]  8e98bca9b3:
 hackbench.throughput 95.0% regression
Message-ID: <202606021456.26349ab2-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::9) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DSVPR11MB9892:EE_
X-MS-Office365-Filtering-Correlation-Id: aca35a20-b57f-4210-8f09-08dec071f297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|18002099003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: WOoYk4ds4IkB0j8mZx9qVPvU1dKvc5gkYibLJSIo8892hW9uKQq9cIRQRaEp3haIs0qL9E8aAKGXrqaZ9O/KUCrcabmYNFCEm0S5L72IPzXwg4g5ZWl0motDAlDQXhZhKje3ouTIJo53kZr+Du6U5SSLOQzOLgQdz5PPg7HbLecKW6PJLEC+4xcXyE7S9AcNPRdfNINQdRI5vcgdLzg+alBTie1qtLNZqEnG8x3YbLuRaQlOhsz2sYUG2adqr2Bro4jUfqJiDMO6h5/IZKOV8B/Gofu2FGTt+uY2rMaGFaDYawD8nKlkrdLFiPiapVXzKXB3BglPlIgcEL1VVRLvIAKaTVU24P5vJSMO+ao3cEbSYwx53HVXTNRE68t9Ce7azwS4l30D8HczL6VRhhu5T60TyeWBlH0ysxD2tZPBQHesPkriEt7N3qaQLnHis0efLx98OTyKrFXuuVcgmAjW6Jn8Mcpf50W2fw7shRQsg3v8HE6SzbOo79/hQc5EJGBFUFBtYjHrzc2R7P0tEDUTWkeqi6RlmB4ld0S3taSkcuSLD5bn3mbp27VY0XAvFbReEzaMJ0BDU2pHk6fG8xknDC7+km0GB9Ut4aA5AUTl+w6k8jTPkRuStqILGcPEcMkr7WihL81NqRGxfqJr48y6uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(18002099003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6SWLu1QEcUiivof0Git7hTVUgkoC17NkLg3+SBDfydklf/RZ93ab0eGYAS?=
 =?iso-8859-1?Q?UtAsxKWGQsoDjWYrIkHRP9x3IpOLC4vsFoBt8JHV/AmKe3A07Dr+r6zVG5?=
 =?iso-8859-1?Q?+HlH9fDFDwcOGmmyT5OceZk39atJe74GkZYAS/XBJXnSjYYA5IyPQU4xA8?=
 =?iso-8859-1?Q?7t6nsLiHYxufadqcWXcvzFJ2eCpVh4aG2IXwmTvo4Idwc9wYJjOiPIHqme?=
 =?iso-8859-1?Q?bD6Jnrg7S646XDd5RNdPY4Q0h6L6GOBixfga70x1Yefv81N+E3VRDAYfuN?=
 =?iso-8859-1?Q?VghiKEgbqU7ukvfyAwYxCeoOLqJChhIQzYQqUtVrDY5Kj3LFaMecDJlQGB?=
 =?iso-8859-1?Q?IUcP0yOFNJJ1QPOg31DBuloPTBnv1FH5AYw0iZUdEHd327gg43Nkxc2/9z?=
 =?iso-8859-1?Q?Cl87KHFoGSz9sI+lxAbkFPzCJ8rpAA58RWXe0aMmAAF6KTVlg+EVKQt+ig?=
 =?iso-8859-1?Q?r14IZ8ZmsF9JUd9+YIjEFVKDJ+Lm2MWbeMekEFIyKIq+yTmL+AxE4nGu2v?=
 =?iso-8859-1?Q?X5ZwkVyEr/HTXlaePkVUnLLQ4xZWZoy9TSqIitySaggPToI5MbHqpvlfdS?=
 =?iso-8859-1?Q?JZO9s8RGCaTpqdVDAV0e1rrCf7kzq+QAV85nvUcPHVoqhGH1d1axDtIzr5?=
 =?iso-8859-1?Q?gW3SKEZBxRhlzgEdvR+xb+0WDv8oL3UPxj+9wJmptMqbASh7VBH5gaBmXf?=
 =?iso-8859-1?Q?jmywMCetT+cucKbWWzm91+ezJ32kEvHvCdrbfEH3zEbkbAp0sBUGaVm5Bj?=
 =?iso-8859-1?Q?LqDidKmfGUwzBSoPoIVoYfh5dT7KCmVPlFdJffSPengalaE68LD6DSbmIx?=
 =?iso-8859-1?Q?rwrZOD9VHpknDawyh7vdTvK5JSw0IjoNRy3mxW3hh0BJmL336iX1i+Mcvf?=
 =?iso-8859-1?Q?uv0EhaLbFHC4REGKBIEoagNLdVixM7MIugaDi54hMAZtV/upi6jndPU2F3?=
 =?iso-8859-1?Q?BU4GNBTT0fkHXVgKkn4cPMoSWpicNORfUq3wcy/lVwlbXn8ca3TYgAqYRW?=
 =?iso-8859-1?Q?Lv3BB0Y5v1CaFVXGfOoCbi1kBSbB0WCy0kS/tqVOXDyl1wIjwz2reR86RQ?=
 =?iso-8859-1?Q?e1BgiQxZFGWHBCM+AQkkvaAkDe5kRJhLLrJS+Jnc9iog5JpnoU472FF3PL?=
 =?iso-8859-1?Q?KYVHiJv0SgXXz4bWZ3Vvc/jndrAfdJHstCj37VH/roWRobxIuPNVfsu7Gj?=
 =?iso-8859-1?Q?xLzhKMeoNoO6vjr63YEkfQmNeaahofHuJfMK3vACJEz6690LtY4p5kRA8R?=
 =?iso-8859-1?Q?9d0xoA9n9a6UKqy897nLXNOvUnxEbePuKlVunkFaMV+E7rbc7wOuctnaBV?=
 =?iso-8859-1?Q?hVLmwZL48kHM3wneVwYwf0EmEwvMZwy7Ny+xFfsqOJUbbJFzzclRuhI9+b?=
 =?iso-8859-1?Q?h1gJ/oqWvN9JbWgGG5E71oRBSQlWMxehqwp41z4e1Z1CJvTsgdMABMTztD?=
 =?iso-8859-1?Q?FRogzJoCJCCzUMhNkAaIbqcj6Vq/JJdOYbmBP5sKR+hufXmnbS4Cx7uK7z?=
 =?iso-8859-1?Q?AVpZM3j2XuRG7/UI+ntpzmPvJ0sx+Wzktw6cc1WB2Kio8gQVyoWvDZyOrB?=
 =?iso-8859-1?Q?pSEHfCNXK4xJfDAY4KLBypNLKxvQ+d5oBFCAqaETN86trXVRN+qYyWI0VZ?=
 =?iso-8859-1?Q?CLL6q5NkaRl8THIe7XnsyIKx363qvNPXW5W4kDEeMAUPSPlBfGxJNxSpTX?=
 =?iso-8859-1?Q?FNJeuJWWYbEwzJXnRuQO8JMvN9OF6eyBD2UBtrUB3x7XR+4FXY7TpVCt3+?=
 =?iso-8859-1?Q?VcZ6KJ3S4hEyukXOEidZVLyPLHQC4gADvYHdUMBo3hfvRLuxry18MCUqvw?=
 =?iso-8859-1?Q?dZ1rcPkkPA=3D=3D?=
X-Exchange-RoutingPolicyChecked: LJyQXJnrcd9yqVAebgrqDi73fT+bs/BCciYt84/DOUYSWoBkuY7UnG0AzBpuWE/xaqIgu+i6hWGJdWPlPNob0FGpZwy9bbrdhn8IAW5aEe9mKKbkL9YuWp/tnmzHNNHqTEvMHK+NqSB+DbmVzWycCCUe1Mo9Yg6ee38pE0sJyV4AzLU7th0yl+LJx2pEMUs9IiRpKdp+B/RnUNu1QhgPxM15QbwkRJwB8P/oQOE7+GiJ8C2U6ZvIO8Sr/Pm5isNny1zuQk02UnKFe53WQXnmVzrxLEe64DyLiyl1f+VI1fZYNXedj8ipr7qQdBkup/FohusS9prUYpteilVmNoGPXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: aca35a20-b57f-4210-8f09-08dec071f297
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:41:17.3233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTJfnlj4cuwKuR7ymj2wa/vdXZMMVoT7p2T9Cf8jyO0GJsEkl9hBgBWkiOvNmPmfiXJd7TKedc+m7lVwLRF1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9892
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 95.0% regression of hackbench.throughput on:


commit: 8e98bca9b3d9cd5861cf495a9f7c85256fbeed4c ("bpf,slab: Add slub-backed allocator for bpf_arena")
https://github.com/kkdwivedi/linux arena/tmp-slab-nofix

testcase: hackbench
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 1600%
	iterations: 4
	mode: threads
	ipc: socket
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.oom-pipe.ops_per_sec  44.9% regression    |
| test parameters  | cpufreq_governor=performance                                   |
|                  | nr_threads=50%                                                 |
|                  | test=oom-pipe                                                  |
|                  | testtime=60s                                                   |
+------------------+----------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops  63.8% regression |
| test parameters  | cpufreq_governor=performance                                   |
|                  | mode=process                                                   |
|                  | nr_task=100%                                                   |
|                  | test=unix1                                                     |
+------------------+----------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops  62.9% regression  |
| test parameters  | cpufreq_governor=performance                                   |
|                  | mode=thread                                                    |
|                  | nr_task=100%                                                   |
|                  | test=unix1                                                     |
+------------------+----------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606021456.26349ab2-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260602/202606021456.26349ab2-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/socket/4/x86_64-rhel-9.4/threads/1600%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/hackbench

commit: 
  7a9a1d643a ("selftests/bpf: Add arena mmap stale-fault coverage")
  8e98bca9b3 ("bpf,slab: Add slub-backed allocator for bpf_arena")

7a9a1d643a75c217 8e98bca9b3d9cd5861cf495a9f7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    627400 ±  8%     -95.0%      31477 ±  2%  hackbench.throughput
    549027 ±  9%     -94.4%      30738        hackbench.throughput_avg
    627400 ±  8%     -95.0%      31477 ±  2%  hackbench.throughput_best
    495809 ± 10%     -94.0%      29950        hackbench.throughput_worst
    249.89 ± 12%   +1301.0%       3501 ±  2%  hackbench.time.elapsed_time
    249.89 ± 12%   +1301.0%       3501 ±  2%  hackbench.time.elapsed_time.max
  79178045 ± 30%   +4895.7%  3.955e+09 ± 10%  hackbench.time.involuntary_context_switches
   2398376 ± 12%     +23.5%    2961198 ±  4%  hackbench.time.minor_page_faults
     19425           +13.0%      21954        hackbench.time.percent_of_cpu_this_job_got
     47185 ± 12%   +1515.3%     762178 ±  2%  hackbench.time.system_time
      1368 ±  6%    +372.3%       6463        hackbench.time.user_time
 2.686e+08 ± 18%   +3159.3%  8.755e+09 ±  3%  hackbench.time.voluntary_context_switches
    392.59 ±  6%    +827.1%       3639 ±  2%  uptime.boot
   2886368 ± 15%    +106.3%    5954342 ± 21%  numa-numastat.node1.local_node
   3011828 ± 14%    +101.1%    6058134 ± 21%  numa-numastat.node1.numa_hit
     24.01 ± 11%     -22.1        1.88 ± 20%  mpstat.cpu.all.idle%
      0.52 ± 11%      +0.3        0.82 ±  2%  mpstat.cpu.all.irq%
      0.06 ±  3%      -0.0        0.01 ±  8%  mpstat.cpu.all.soft%
     73.07 ±  3%     +23.4       96.46        mpstat.cpu.all.sys%
      2.35 ±  5%      -1.5        0.83        mpstat.cpu.all.usr%
     26.08 ± 12%     -92.4%       1.99 ± 21%  vmstat.cpu.id
   6485767 ±  5%     +20.5%    7812564        vmstat.memory.cache
     67002 ±  6%     -23.5%      51251 ±  2%  vmstat.procs.r
   1759167 ± 11%    +135.3%    4139345 ±  3%  vmstat.system.cs
    837789 ± 12%     +23.7%    1035934 ±  6%  vmstat.system.in
    205.17 ± 89%    +583.3%       1401 ± 73%  numa-meminfo.node0.Mlocked
   4315976 ± 15%     -65.1%    1504158 ± 45%  numa-meminfo.node0.SUnreclaim
   4503083 ± 15%     -62.5%    1686954 ± 43%  numa-meminfo.node0.Slab
   2700691 ± 12%     +50.3%    4059834 ±  4%  numa-meminfo.node1.Active
   2700679 ± 12%     +50.3%    4059827 ±  4%  numa-meminfo.node1.Active(anon)
   2884352 ± 41%     +72.9%    4987934 ± 36%  numa-meminfo.node1.FilePages
    614115 ± 27%     -57.2%     262985 ± 50%  numa-meminfo.node1.Mapped
   3435225 ± 18%     -64.3%    1225372 ± 62%  numa-meminfo.node1.SUnreclaim
   2045128 ± 14%     +49.8%    3062681 ±  9%  numa-meminfo.node1.Shmem
   3591411 ± 19%     -60.9%    1405859 ± 59%  numa-meminfo.node1.Slab
     49.47 ± 87%    +608.0%     350.26 ± 73%  numa-vmstat.node0.nr_mlock
   1036287 ± 15%     -63.1%     382864 ± 42%  numa-vmstat.node0.nr_slab_unreclaimable
    673769 ± 11%     +50.4%    1013228 ±  4%  numa-vmstat.node1.nr_active_anon
    720690 ± 40%     +73.2%    1248059 ± 36%  numa-vmstat.node1.nr_file_pages
    150599 ± 30%     -56.6%      65357 ± 51%  numa-vmstat.node1.nr_mapped
    510885 ± 12%     +50.1%     766746 ±  9%  numa-vmstat.node1.nr_shmem
    825828 ± 19%     -63.6%     300902 ± 63%  numa-vmstat.node1.nr_slab_unreclaimable
    673716 ± 11%     +50.4%    1013227 ±  4%  numa-vmstat.node1.nr_zone_active_anon
   3012095 ± 14%    +101.1%    6057806 ± 21%  numa-vmstat.node1.numa_hit
   2886635 ± 15%    +106.3%    5954015 ± 21%  numa-vmstat.node1.numa_local
   1966831 ± 20%     +91.5%    3766520 ±  3%  perf-stat.i.context-switches
    232485            -3.0%     225399        perf-stat.i.cpu-clock
    170180 ± 11%     +66.6%     283573 ±  5%  perf-stat.i.cpu-migrations
     24977 ± 11%     -86.6%       3357 ±  2%  perf-stat.i.minor-faults
     24449 ± 12%     -86.3%       3355 ±  2%  perf-stat.i.page-faults
    232486            -3.0%     225399        perf-stat.i.task-clock
   1416381 ± 12%    +157.4%    3645620 ±  3%  perf-stat.ps.context-switches
    106700 ± 10%    +173.0%     291292 ±  5%  perf-stat.ps.cpu-migrations
      0.02 ± 32%     -70.4%       0.01 ± 40%  perf-stat.ps.major-faults
     12760 ±  9%     -77.6%       2852 ±  2%  perf-stat.ps.minor-faults
     12760 ±  9%     -77.6%       2852 ±  2%  perf-stat.ps.page-faults
    468.17 ± 73%    +694.3%       3718 ± 50%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     17097 ± 49%    +699.3%     136655 ± 52%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    468.17 ± 73%    +694.3%       3718 ± 50%  perf-sched.total_sch_delay.average.ms
     17097 ± 49%    +699.3%     136655 ± 52%  perf-sched.total_sch_delay.max.ms
      1107 ± 75%    +695.9%       8811 ± 50%  perf-sched.total_wait_and_delay.average.ms
     34021 ± 49%    +701.8%     272772 ± 53%  perf-sched.total_wait_and_delay.max.ms
    638.96 ± 76%    +697.0%       5092 ± 50%  perf-sched.total_wait_time.average.ms
     17063 ± 49%    +701.1%     136693 ± 53%  perf-sched.total_wait_time.max.ms
      1107 ± 75%    +695.9%       8811 ± 50%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     34021 ± 49%    +701.8%     272772 ± 53%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    638.96 ± 76%    +697.0%       5092 ± 50%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     17063 ± 49%    +701.1%     136693 ± 53%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   3978628 ± 10%     +33.7%    5320494        meminfo.Active
   3978601 ± 10%     +33.7%    5320472        meminfo.Active(anon)
    346298 ±  4%     +98.3%     686699 ±  6%  meminfo.AnonHugePages
   6171775 ±  5%     +20.8%    7453200        meminfo.Cached
   5138060 ±  8%     +27.4%    6544510        meminfo.Committed_AS
    700952 ± 27%     -52.4%     333495 ± 50%  meminfo.Mapped
  20278198 ±  3%     -21.7%   15883789        meminfo.Memused
    191.31 ± 91%   +1173.0%       2435        meminfo.Mlocked
     27308 ±  3%      -6.9%      25414 ±  2%  meminfo.PageTables
   7839232 ±  5%     -65.1%    2734328 ±  4%  meminfo.SUnreclaim
   2108233 ± 15%     +60.8%    3389642        meminfo.Shmem
   8182972 ±  4%     -62.1%    3097978 ±  3%  meminfo.Slab
  24549123           -19.3%   19822771 ±  3%  meminfo.max_used_kB
      2465 ±  3%    -100.0%       0.00        turbostat.Avg_MHz
     84.95 ±  3%     -85.0        0.00        turbostat.Busy%
      2902          -100.0%       0.00        turbostat.Bzy_MHz
      0.04 ± 30%      -0.0        0.00        turbostat.C1%
      0.93 ± 19%      -0.9        0.00        turbostat.C1E%
     13.90 ± 23%     -13.9        0.00        turbostat.C6%
      4.61 ± 11%    -100.0%       0.00        turbostat.CPU%c1
      9.08 ± 33%    -100.0%       0.00        turbostat.CPU%c6
     36.33 ± 12%    -100.0%       0.00        turbostat.CoreTmp
      0.39 ± 10%    -100.0%       0.00        turbostat.IPC
 3.167e+08 ± 27%    -100.0%       0.00        turbostat.IRQ
  12786201 ± 95%    -100.0%       0.00        turbostat.NMI
     12.34 ± 37%     -12.3        0.00        turbostat.PKG_%
      0.71 ± 92%    -100.0%       0.00        turbostat.Pkg%pc2
      1.16 ±137%    -100.0%       0.00        turbostat.Pkg%pc6
     37.50 ± 11%    -100.0%       0.00        turbostat.PkgTmp
    612.86 ±  2%    -100.0%       0.00        turbostat.PkgWatt
     37.62 ±  3%    -100.0%       0.00        turbostat.RAMWatt
      2000          -100.0%       0.00        turbostat.TSC_MHz
      1533 ±  3%    -100.0%       0.00        turbostat.UncMHz
    989355 ± 10%     +34.4%    1329312        proc-vmstat.nr_active_anon
    168.44 ±  4%     +98.7%     334.62 ±  5%  proc-vmstat.nr_anon_transparent_hugepages
   6053964            +1.7%    6156963        proc-vmstat.nr_dirty_background_threshold
  12122732            +1.7%   12328980        proc-vmstat.nr_dirty_threshold
   1539634 ±  5%     +21.0%    1863276        proc-vmstat.nr_file_pages
  60912929            +1.7%   61944422        proc-vmstat.nr_free_pages
  59801078            +1.6%   60767097        proc-vmstat.nr_free_pages_blocks
    174747 ± 29%     -53.9%      80497 ± 52%  proc-vmstat.nr_mapped
     48.02 ± 89%   +1165.9%     607.96        proc-vmstat.nr_mlock
      6822 ±  3%      -7.0%       6346 ±  2%  proc-vmstat.nr_page_table_pages
    523748 ± 15%     +61.8%     847385        proc-vmstat.nr_shmem
     85652 ±  4%      +5.7%      90548 ±  3%  proc-vmstat.nr_slab_reclaimable
   1900121 ±  6%     -64.1%     682996 ±  4%  proc-vmstat.nr_slab_unreclaimable
    989355 ± 10%     +34.4%    1329312        proc-vmstat.nr_zone_active_anon
   1031388 ± 19%     +40.7%    1451014 ±  7%  proc-vmstat.numa_hint_faults
    747354 ± 17%     +38.6%    1036063 ±  7%  proc-vmstat.numa_hint_faults_local
   5881713 ±  4%     +74.8%   10284133        proc-vmstat.numa_hit
   5650134 ±  4%     +78.0%   10055823        proc-vmstat.numa_local
    297810 ± 35%     +50.2%     447245 ± 14%  proc-vmstat.numa_pages_migrated
   1305706 ± 21%     +37.3%    1792565 ±  9%  proc-vmstat.numa_pte_updates
  17581711 ±  3%     +12.3%   19736712 ±  2%  proc-vmstat.pgalloc_normal
   3391675 ±  9%    +203.2%   10282197 ±  2%  proc-vmstat.pgfault
  16752013 ±  2%     +12.0%   18755659 ±  2%  proc-vmstat.pgfree
    297810 ± 35%     +50.2%     447245 ± 14%  proc-vmstat.pgmigrate_success
    313167 ± 31%    +129.3%     718243 ±  5%  proc-vmstat.pgreuse
 1.549e+08 ± 37%   +4473.7%  7.086e+09 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.avg
 7.097e+08 ± 44%   +2727.4%  2.007e+10 ± 23%  sched_debug.cfs_rq:/.avg_vruntime.max
  34147456 ± 66%   +1340.7%   4.92e+08 ± 57%  sched_debug.cfs_rq:/.avg_vruntime.min
 1.085e+08 ± 61%   +4671.6%  5.178e+09 ± 52%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     69.82 ± 46%    +171.8%     189.79 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.08 ±142%   +1051.0%       0.86 ±  7%  sched_debug.cfs_rq:/.h_nr_queued.min
     68.20 ± 46%    +177.9%     189.51 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.08 ±142%   +1051.0%       0.86 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.min
     16900 ± 30%     -70.6%       4973 ±  5%  sched_debug.cfs_rq:/.load.avg
    974431 ± 19%     -92.5%      73065 ± 63%  sched_debug.cfs_rq:/.load.max
      4.21 ±223%    +576.8%      28.48 ± 16%  sched_debug.cfs_rq:/.load.min
     98177 ± 23%     -91.5%       8359 ± 37%  sched_debug.cfs_rq:/.load.stddev
    950.91 ± 27%     -91.6%      79.77 ± 39%  sched_debug.cfs_rq:/.load_avg.avg
     22175 ± 22%     -89.8%       2267 ± 11%  sched_debug.cfs_rq:/.load_avg.max
      3561 ± 20%     -90.7%     331.12 ± 27%  sched_debug.cfs_rq:/.load_avg.stddev
      0.59 ± 25%     +64.4%       0.96        sched_debug.cfs_rq:/.nr_queued.avg
      1.74 ± 17%     -39.4%       1.05 ±  3%  sched_debug.cfs_rq:/.nr_queued.max
      0.08 ±142%   +1018.9%       0.84 ±  6%  sched_debug.cfs_rq:/.nr_queued.min
      0.29 ±  8%     -88.8%       0.03 ± 35%  sched_debug.cfs_rq:/.nr_queued.stddev
      4.63 ± 77%     -86.4%       0.63 ± 20%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    221.43 ± 42%     -76.5%      52.02 ± 54%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     27.83 ± 48%     -82.1%       4.99 ± 33%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      4.04 ± 71%     -86.2%       0.56 ± 23%  sched_debug.cfs_rq:/.removed.util_avg.avg
    131.64 ± 22%     -72.7%      35.94 ± 60%  sched_debug.cfs_rq:/.removed.util_avg.max
     21.11 ± 33%     -81.4%       3.92 ± 32%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    285182 ± 80%   +1202.1%    3713394 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
    167.89 ±121%    +538.3%       1071 ±  3%  sched_debug.cfs_rq:/.runnable_avg.min
    615824 ± 61%    +492.6%    3649567 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
 3.772e+11 ± 82%     -96.5%  1.312e+10 ±172%  sched_debug.cfs_rq:/.sum_w_vruntime.max
 3.435e+10 ± 59%     -96.9%   1.07e+09 ±142%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
      6287 ± 55%     -95.9%     260.20 ±101%  sched_debug.cfs_rq:/.sum_weight.avg
    623632 ± 29%     -91.4%      53709 ±100%  sched_debug.cfs_rq:/.sum_weight.max
     56102 ± 37%     -93.4%       3705 ±101%  sched_debug.cfs_rq:/.sum_weight.stddev
    583.27 ± 24%     +66.6%     971.96        sched_debug.cfs_rq:/.util_avg.avg
     33.66 ±101%   +1140.2%     417.41 ±  7%  sched_debug.cfs_rq:/.util_avg.min
    284.14 ± 11%     -65.8%      97.27 ± 11%  sched_debug.cfs_rq:/.util_avg.stddev
      2723 ± 46%    +348.1%      12203 ± 27%  sched_debug.cfs_rq:/.util_est.avg
     16619 ± 24%    +117.6%      36159 ± 25%  sched_debug.cfs_rq:/.util_est.max
      0.86 ±162%    +456.5%       4.78 ± 28%  sched_debug.cfs_rq:/.util_est.min
      3534 ± 36%    +217.8%      11235 ± 30%  sched_debug.cfs_rq:/.util_est.stddev
 1.549e+08 ± 37%   +4473.7%  7.086e+09 ± 18%  sched_debug.cfs_rq:/.zero_vruntime.avg
 7.097e+08 ± 44%   +2727.4%  2.007e+10 ± 23%  sched_debug.cfs_rq:/.zero_vruntime.max
  34147455 ± 66%   +1340.7%   4.92e+08 ± 57%  sched_debug.cfs_rq:/.zero_vruntime.min
 1.085e+08 ± 61%   +4671.6%  5.178e+09 ± 52%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    252801 ±  7%    +661.1%    1924112 ± 11%  sched_debug.cpu.clock.avg
    255958 ±  7%    +657.0%    1937570 ± 10%  sched_debug.cpu.clock.max
    248167 ±  8%    +664.4%    1897078 ± 11%  sched_debug.cpu.clock.min
      2353 ± 81%    +377.4%      11235 ± 44%  sched_debug.cpu.clock.stddev
    252015 ±  7%    +657.4%    1908676 ± 11%  sched_debug.cpu.clock_task.avg
    255257 ±  7%    +656.4%    1930657 ± 10%  sched_debug.cpu.clock_task.max
    232855 ±  8%    +698.4%    1859230 ± 11%  sched_debug.cpu.clock_task.min
      2920 ± 63%    +512.5%      17887 ± 24%  sched_debug.cpu.clock_task.stddev
     84157 ± 19%     +52.1%     128016 ±  7%  sched_debug.cpu.curr->pid.avg
    162370 ± 16%     +39.4%     226334 ±  4%  sched_debug.cpu.curr->pid.max
    495.00 ±223%   +2914.6%      14922 ± 19%  sched_debug.cpu.curr->pid.min
     52810 ± 10%     +27.9%      67561 ±  6%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 80%    +374.7%       0.01 ± 44%  sched_debug.cpu.next_balance.stddev
     69.81 ± 46%    +171.9%     189.79 ±  6%  sched_debug.cpu.nr_running.avg
      0.04 ±223%   +1957.5%       0.86 ±  8%  sched_debug.cpu.nr_running.min
    682034 ± 20%   +4154.6%   29017903 ± 11%  sched_debug.cpu.nr_switches.avg
   2546318 ± 25%   +1888.2%   50627024 ± 21%  sched_debug.cpu.nr_switches.max
    411796 ± 21%   +2064.4%    8913057 ± 67%  sched_debug.cpu.nr_switches.min
    199619 ± 19%   +7654.9%   15480250 ± 55%  sched_debug.cpu.nr_switches.stddev
      1067 ± 22%     -59.7%     430.43 ± 30%  sched_debug.cpu.nr_uninterruptible.max
    247761 ±  8%    +664.1%    1893212 ± 11%  sched_debug.cpu_clk
      0.01 ± 98%     -96.7%       0.00 ± 91%  sched_debug.dl_rq:.dl_nr_running.avg
      0.31 ± 45%     -92.5%       0.02 ± 74%  sched_debug.dl_rq:.dl_nr_running.max
      0.05 ± 68%     -94.7%       0.00 ± 80%  sched_debug.dl_rq:.dl_nr_running.stddev
    246705 ±  8%    +667.0%    1892158 ± 11%  sched_debug.ktime
    250013 ±  8%    +658.2%    1895482 ± 11%  sched_debug.sched_clk
     11.34 ± 32%     -11.3        0.00        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
     10.67 ± 26%     -10.7        0.00        perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      8.60 ± 46%      -8.6        0.00        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      7.67 ± 46%      -7.6        0.08 ±223%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      7.64 ± 46%      -7.6        0.08 ±223%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      7.56 ± 46%      -7.5        0.08 ±223%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      6.95 ± 47%      -7.0        0.00        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.30 ± 48%      -6.3        0.00        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      5.84 ± 47%      -5.8        0.00        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      4.37 ± 47%      -4.4        0.00        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      4.13 ± 47%      -4.1        0.00        perf-profile.calltrace.cycles-pp.sock_wfree.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.92 ± 51%      -3.9        0.00        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.00            +0.6        0.60 ± 10%  perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±223%      +1.1        1.27 ± 35%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      1.20 ±108%      +2.2        3.42 ± 34%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.44 ±223%      +2.7        3.10 ± 37%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable
      0.45 ±223%      +2.7        3.11 ± 37%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg
      0.54 ±223%      +2.8        3.33 ± 34%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.47 ±223%      +2.8        3.30 ± 35%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.44 ±223%      +3.4        3.84 ± 42%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      0.45 ±223%      +3.4        3.86 ± 41%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.46 ±223%      +3.5        3.92 ± 41%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.55 ±223%      +3.8        4.34 ± 37%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.83 ±223%     +11.3       12.15 ± 20%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kfree.skb_release_data
      0.84 ±223%     +11.4       12.21 ± 20%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kfree.skb_release_data.consume_skb
      0.96 ±196%     +12.0       12.96 ± 18%  perf-profile.calltrace.cycles-pp.__slab_free.kfree.skb_release_data.consume_skb.unix_stream_read_generic
     23.72 ± 33%     +49.5       73.19 ±  3%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     23.59 ± 33%     +49.6       73.18 ±  3%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     11.37 ± 34%     +61.4       72.75 ±  3%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
     11.22 ± 34%     +61.5       72.74 ±  3%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.00           +70.8       70.78 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof
      0.00           +70.9       70.88 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve
      0.00           +72.4       72.37 ±  3%  perf-profile.calltrace.cycles-pp.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb
      0.00           +72.5       72.50 ±  3%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
     14.54 ± 46%     -14.1        0.47 ± 13%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
     13.41 ± 47%     -13.0        0.40 ± 14%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
     11.37 ± 32%     -11.0        0.37 ± 11%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
     10.71 ± 26%     -10.4        0.29 ±  7%  perf-profile.children.cycles-pp.kmem_cache_free
      8.42 ± 21%      -8.3        0.15 ± 12%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      7.70 ± 46%      -7.2        0.46 ±  7%  perf-profile.children.cycles-pp.unix_stream_read_actor
      7.66 ± 46%      -7.2        0.46 ±  6%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      7.58 ± 46%      -7.1        0.46 ±  6%  perf-profile.children.cycles-pp.__skb_datagram_iter
      5.00 ± 59%      -5.0        0.00        perf-profile.children.cycles-pp.__pcs_replace_full_main
      4.56 ± 57%      -4.6        0.00        perf-profile.children.cycles-pp.barn_replace_empty_sheaf
      4.39 ± 47%      -4.2        0.19 ±  7%  perf-profile.children.cycles-pp.skb_release_head_state
      4.07 ± 60%      -4.1        0.00        perf-profile.children.cycles-pp.barn_replace_full_sheaf
      4.15 ± 47%      -4.0        0.18 ±  7%  perf-profile.children.cycles-pp.sock_wfree
      4.00 ± 47%      -3.8        0.22 ±  9%  perf-profile.children.cycles-pp._copy_to_iter
      3.84 ± 52%      -3.7        0.14 ± 15%  perf-profile.children.cycles-pp.refill_objects
      3.75 ± 45%      -3.4        0.32 ±  6%  perf-profile.children.cycles-pp.__check_object_size
      3.50 ± 38%      -3.4        0.14 ± 15%  perf-profile.children.cycles-pp.__refill_objects_node
      3.26 ± 46%      -3.0        0.22 ±  4%  perf-profile.children.cycles-pp.simple_copy_to_iter
      3.08 ± 47%      -2.8        0.27 ±  5%  perf-profile.children.cycles-pp.check_heap_object
      2.12 ± 40%      -1.9        0.22 ±  4%  perf-profile.children.cycles-pp.skb_set_owner_w
      1.82 ± 44%      -1.8        0.06 ±  9%  perf-profile.children.cycles-pp.__account_obj_stock
      1.67 ± 41%      -1.5        0.17 ± 23%  perf-profile.children.cycles-pp.__refill_obj_stock
      0.55 ± 41%      -0.5        0.03 ± 70%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.31 ± 34%      -0.2        0.09 ± 23%  perf-profile.children.cycles-pp.drain_obj_stock
      0.06 ± 40%      +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.01 ±223%      +0.1        0.10 ± 26%  perf-profile.children.cycles-pp.preempt_schedule_irq
      0.16 ± 35%      +0.1        0.25 ±  8%  perf-profile.children.cycles-pp.__enqueue_entity
      0.02 ±223%      +0.1        0.14 ± 27%  perf-profile.children.cycles-pp.cpuacct_charge
      0.11 ± 22%      +0.1        0.23 ± 14%  perf-profile.children.cycles-pp.__switch_to_asm
      0.02 ±223%      +0.1        0.16 ± 11%  perf-profile.children.cycles-pp.task_h_load
      0.02 ±223%      +0.2        0.18 ±  9%  perf-profile.children.cycles-pp.wake_affine
      0.13 ± 89%      +0.2        0.33 ± 37%  perf-profile.children.cycles-pp.pick_task_fair
      0.14 ± 99%      +0.2        0.39 ± 28%  perf-profile.children.cycles-pp.finish_task_switch
      0.32 ± 38%      +0.3        0.60 ± 10%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.21 ± 37%      +0.3        0.54 ± 11%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.23 ± 41%      +0.4        0.60 ± 10%  perf-profile.children.cycles-pp.switch_fpu_return
      0.12 ±223%      +0.5        0.59 ± 40%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.06 ± 60%      +0.8        0.89 ± 60%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.06 ± 60%      +0.8        0.89 ± 60%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.07 ±146%      +0.9        0.95 ± 30%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.10 ±122%      +1.0        1.10 ± 28%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.03 ±150%      +1.0        1.05 ± 26%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.04 ±120%      +1.0        1.08 ± 25%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.05 ±126%      +1.1        1.18 ± 24%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.13 ± 34%      +1.4        1.50 ± 21%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.22 ± 92%      +1.4        1.60 ± 58%  perf-profile.children.cycles-pp.dequeue_entity
      0.32 ± 68%      +1.4        1.70 ± 40%  perf-profile.children.cycles-pp.enqueue_entity
      0.33 ± 99%      +1.4        1.72 ± 54%  perf-profile.children.cycles-pp.dequeue_entities
      0.32 ±109%      +1.4        1.73 ± 54%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.32 ±106%      +1.4        1.74 ± 54%  perf-profile.children.cycles-pp.try_to_block_task
      0.42 ± 81%      +1.5        1.94 ± 35%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.46 ± 77%      +1.5        2.01 ± 34%  perf-profile.children.cycles-pp.enqueue_task
      0.51 ± 77%      +1.6        2.14 ± 32%  perf-profile.children.cycles-pp.ttwu_do_activate
      1.26 ±100%      +2.2        3.42 ± 34%  perf-profile.children.cycles-pp.sock_def_readable
      0.92 ± 93%      +2.2        3.11 ± 37%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.90 ± 96%      +2.2        3.10 ± 37%  perf-profile.children.cycles-pp.try_to_wake_up
      1.04 ±100%      +2.3        3.33 ± 34%  perf-profile.children.cycles-pp.__wake_up_sync_key
      0.96 ± 92%      +2.3        3.30 ± 35%  perf-profile.children.cycles-pp.__wake_up_common
      0.02 ±223%      +2.6        2.64 ± 68%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.02 ±223%      +2.6        2.64 ± 68%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      1.24 ± 83%      +2.7        3.94 ± 40%  perf-profile.children.cycles-pp.schedule_timeout
      0.14 ± 91%      +2.7        2.86 ± 64%  perf-profile.children.cycles-pp.update_se
      0.21 ±102%      +2.8        2.97 ± 61%  perf-profile.children.cycles-pp.update_curr
      1.33 ± 94%      +3.0        4.37 ± 41%  perf-profile.children.cycles-pp.schedule
      1.41 ± 93%      +3.0        4.46 ± 41%  perf-profile.children.cycles-pp.__schedule
      0.89 ±122%      +3.5        4.35 ± 37%  perf-profile.children.cycles-pp.unix_stream_data_wait
      0.01 ±223%      +4.3        4.30 ± 69%  perf-profile.children.cycles-pp.perf_tp_event
     23.75 ± 33%     +49.4       73.19 ±  3%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     23.64 ± 33%     +49.6       73.19 ±  3%  perf-profile.children.cycles-pp.__alloc_skb
     11.41 ± 34%     +61.3       72.75 ±  3%  perf-profile.children.cycles-pp.kmalloc_reserve
     11.24 ± 34%     +61.5       72.74 ±  3%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller_noprof
      0.00           +72.5       72.48 ±  3%  perf-profile.children.cycles-pp.get_from_partial_node
      0.00           +72.5       72.52 ±  3%  perf-profile.children.cycles-pp.___slab_alloc
     12.40 ± 48%     -12.1        0.31 ± 15%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
     11.69 ± 47%     -11.4        0.30 ± 10%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      3.97 ± 47%      -3.8        0.20 ±  6%  perf-profile.self.cycles-pp._copy_to_iter
      3.62 ± 48%      -3.5        0.13 ±  7%  perf-profile.self.cycles-pp.sock_wfree
      3.20 ± 47%      -3.0        0.24 ±  6%  perf-profile.self.cycles-pp.unix_stream_read_generic
      2.70 ± 48%      -2.5        0.24 ±  5%  perf-profile.self.cycles-pp.check_heap_object
      2.09 ± 40%      -1.9        0.21 ±  3%  perf-profile.self.cycles-pp.skb_set_owner_w
      1.53 ± 45%      -1.5        0.02 ± 99%  perf-profile.self.cycles-pp.__account_obj_stock
      1.24 ± 43%      -1.2        0.07 ± 18%  perf-profile.self.cycles-pp.__refill_obj_stock
      1.27 ± 35%      -1.2        0.11 ± 10%  perf-profile.self.cycles-pp.__refill_objects_node
      1.20 ± 44%      -1.1        0.06 ±  6%  perf-profile.self.cycles-pp.kmem_cache_free
      0.77 ± 41%      -0.7        0.05        perf-profile.self.cycles-pp.__alloc_skb
      0.54 ± 41%      -0.5        0.02 ± 99%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50 ± 40%      -0.5        0.05        perf-profile.self.cycles-pp.do_syscall_64
      0.38 ± 49%      -0.3        0.07 ±  7%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.30 ± 34%      -0.2        0.08 ± 26%  perf-profile.self.cycles-pp.drain_obj_stock
      0.01 ±223%      +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.enqueue_task
      0.00            +0.1        0.07 ± 25%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.16 ± 35%      +0.1        0.25 ±  8%  perf-profile.self.cycles-pp.__enqueue_entity
      0.02 ±223%      +0.1        0.14 ± 28%  perf-profile.self.cycles-pp.cpuacct_charge
      0.11 ± 22%      +0.1        0.23 ± 14%  perf-profile.self.cycles-pp.__switch_to_asm
      0.02 ±223%      +0.1        0.14 ±  8%  perf-profile.self.cycles-pp.enqueue_entity
      0.02 ±223%      +0.1        0.16 ± 11%  perf-profile.self.cycles-pp.task_h_load
      0.01 ±223%      +0.1        0.16 ± 23%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.02 ±223%      +0.2        0.20 ±  8%  perf-profile.self.cycles-pp.__wake_up_common
      0.00            +0.2        0.24 ± 51%  perf-profile.self.cycles-pp.perf_tp_event
      0.21 ± 37%      +0.3        0.54 ± 11%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.7        0.68 ±  2%  perf-profile.self.cycles-pp.get_from_partial_node


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/50%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/oom-pipe/stress-ng/60s

commit: 
  7a9a1d643a ("selftests/bpf: Add arena mmap stale-fault coverage")
  8e98bca9b3 ("bpf,slab: Add slub-backed allocator for bpf_arena")

7a9a1d643a75c217 8e98bca9b3d9cd5861cf495a9f7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    382.33 ±  2%     -42.6%     219.50 ±  8%  stress-ng.oom-pipe.ops
      5.89 ±  2%     -44.9%       3.24 ±  8%  stress-ng.oom-pipe.ops_per_sec
     70.20            +9.8%      77.10        stress-ng.time.elapsed_time
     70.20            +9.8%      77.10        stress-ng.time.elapsed_time.max
     58608 ±  2%      +4.8%      61401 ±  3%  stress-ng.time.involuntary_context_switches
      8827            -5.3%       8361        stress-ng.time.percent_of_cpu_this_job_got
      6148            +4.4%       6417        stress-ng.time.system_time
     47.60           -38.0%      29.49        stress-ng.time.user_time
 7.688e+09 ±  3%     +14.3%   8.79e+09 ±  2%  cpuidle..time
    499149 ±  4%     +20.5%     601357 ±  2%  cpuidle..usage
      0.08 ±145%     -78.0%       0.02 ±  5%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.08 ±145%     -78.0%       0.02 ±  5%  perf-sched.total_sch_delay.average.ms
     18.78 ± 16%     -38.0%      11.64 ±  7%  sched_debug.cpu.clock.stddev
      4972 ± 12%     -34.4%       3263 ± 39%  sched_debug.cpu.nr_switches.stddev
      0.09 ±  3%      -0.0        0.07 ±  2%  mpstat.cpu.all.irq%
      0.15 ±  5%      +0.0        0.19 ±  6%  mpstat.cpu.all.soft%
      0.49 ±  4%      -0.2        0.29        mpstat.cpu.all.usr%
 1.487e+08           +11.1%  1.652e+08        vmstat.memory.free
      4292 ±  5%     -12.1%       3773 ±  2%  vmstat.system.cs
    206020            -3.5%     198729        vmstat.system.in
 1.629e+08           +10.3%  1.796e+08        meminfo.MemAvailable
 1.474e+08           +11.0%  1.637e+08        meminfo.MemFree
 1.121e+08 ±  2%     -14.5%   95881640        meminfo.Memused
  16056410 ±  2%     -10.1%   14430526        meminfo.SUnreclaim
    177344           +24.5%     220797 ±  2%  meminfo.Shmem
      3528 ±102%    +584.4%      24148 ± 42%  perf-c2c.DRAM.local
    636.83 ±101%    +916.4%       6472 ± 56%  perf-c2c.DRAM.remote
    811.67 ±102%  +17189.3%     140331 ± 39%  perf-c2c.HITM.local
    106.50 ±107%   +1453.8%       1654 ± 58%  perf-c2c.HITM.remote
    918.17 ±102%  +15364.1%     141986 ± 39%  perf-c2c.HITM.total
      3403 ±  4%     -10.5%       3045 ±  2%  perf-stat.i.context-switches
      4558 ±  3%      -7.8%       4204        perf-stat.i.minor-faults
      4558 ±  3%      -7.8%       4204        perf-stat.i.page-faults
      3962 ±  5%     -12.9%       3451 ±  2%  perf-stat.ps.context-switches
      4336 ±  2%      -6.4%       4060        perf-stat.ps.minor-faults
      4336 ±  2%      -6.4%       4060        perf-stat.ps.page-faults
     54.84            +2.3       57.17        turbostat.C1%
      0.06 ±  7%     +38.5%       0.09        turbostat.IPC
  15191975            +6.0%   16104013        turbostat.IRQ
   4167355            +6.7%    4444649        turbostat.NMI
    218.76            -3.0%     212.10        turbostat.PkgWatt
     20.03            -7.2%      18.59        turbostat.RAMWatt
  18558145 ±  3%     +15.0%   21337333 ±  2%  numa-vmstat.node0.nr_free_pages
  18159871 ±  3%     +13.1%   20538321 ±  2%  numa-vmstat.node0.nr_free_pages_blocks
   1931372 ±  2%     -13.7%    1667339 ±  2%  numa-vmstat.node0.nr_slab_reclaimable
   2021167 ±  2%     -11.6%    1786952 ±  2%  numa-vmstat.node0.nr_slab_unreclaimable
  18361270 ±  3%      +6.8%   19610235 ±  2%  numa-vmstat.node1.nr_free_pages
   2287444           +17.0%    2676846        numa-vmstat.node1.nr_slab_reclaimable
   1984856            -8.4%    1817969        numa-vmstat.node1.nr_slab_unreclaimable
   7729551 ±  2%     -13.7%    6671235 ±  2%  numa-meminfo.node0.KReclaimable
  74201522 ±  3%     +15.0%   85338386 ±  2%  numa-meminfo.node0.MemFree
  57450165 ±  3%     -19.4%   46313301 ±  4%  numa-meminfo.node0.MemUsed
   7729551 ±  2%     -13.7%    6671235 ±  2%  numa-meminfo.node0.SReclaimable
   8088977 ±  2%     -11.6%    7149513 ±  2%  numa-meminfo.node0.SUnreclaim
  15818529 ±  2%     -12.6%   13820749 ±  2%  numa-meminfo.node0.Slab
   9156766           +17.0%   10710244        numa-meminfo.node1.KReclaimable
  73405823 ±  3%      +6.8%   78429460 ±  2%  numa-meminfo.node1.MemFree
  54538624 ±  4%      -9.2%   49514983 ±  3%  numa-meminfo.node1.MemUsed
   9156766           +17.0%   10710244        numa-meminfo.node1.SReclaimable
   7945671            -8.5%    7273618        numa-meminfo.node1.SUnreclaim
  17102438            +5.2%   17983863        numa-meminfo.node1.Slab
    264048            -4.4%     252356        proc-vmstat.nr_anon_pages
   3653922           +11.1%    4059195        proc-vmstat.nr_dirty_background_threshold
   7316779           +11.1%    8128315        proc-vmstat.nr_dirty_threshold
   1067146            +1.0%    1078005        proc-vmstat.nr_file_pages
  36875219           +11.0%   40933894        proc-vmstat.nr_free_pages
  35987520            +9.5%   39392209        proc-vmstat.nr_free_pages_blocks
     45663            +4.3%      47643        proc-vmstat.nr_mapped
     44352           +24.5%      55211 ±  2%  proc-vmstat.nr_shmem
   4012442 ±  2%     -10.1%    3606915        proc-vmstat.nr_slab_unreclaimable
  30513385            +1.8%   31059927        proc-vmstat.numa_hit
  30313522            +1.8%   30859533        proc-vmstat.numa_local
  37665131            +4.6%   39411182        proc-vmstat.pgalloc_normal
    435482            +3.5%     450813        proc-vmstat.pgfault
  37516588            +4.6%   39257102        proc-vmstat.pgfree
     21116            +7.1%      22620 ±  5%  proc-vmstat.pgreuse



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/unix1/will-it-scale

commit: 
  7a9a1d643a ("selftests/bpf: Add arena mmap stale-fault coverage")
  8e98bca9b3 ("bpf,slab: Add slub-backed allocator for bpf_arena")

7a9a1d643a75c217 8e98bca9b3d9cd5861cf495a9f7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  16163419           -63.8%    5845331        will-it-scale.48.processes
    336737           -63.8%     121777        will-it-scale.per_process_ops
  16163419           -63.8%    5845331        will-it-scale.workload
     32768 ± 70%    +129.5%      75189 ± 42%  numa-meminfo.node0.Shmem
      8191 ± 70%    +129.5%      18799 ± 42%  numa-vmstat.node0.nr_shmem
      0.50           -38.9%       0.30        turbostat.IPC
     30.38 ±  2%     -69.9%       9.15        vmstat.cpu.us
      1467 ±  2%      -5.3%       1389 ±  2%  vmstat.system.cs
    954689            +6.7%    1018743        meminfo.Active
    954658            +6.7%    1018712        meminfo.Active(anon)
   1198188            +5.4%    1263167        meminfo.Committed_AS
    284027           +22.4%     347750        meminfo.Shmem
      0.26            -0.0        0.24        mpstat.cpu.all.irq%
      0.02 ±  3%      -0.0        0.01 ±  2%  mpstat.cpu.all.soft%
     67.39 ±  2%     +22.0       89.37        mpstat.cpu.all.sys%
     30.54 ±  2%     -21.3        9.28        mpstat.cpu.all.usr%
      1423 ±  2%      -6.0%       1339 ±  3%  perf-stat.i.context-switches
    105.65            +8.9%     115.05        perf-stat.i.cpu-migrations
      1421 ±  2%      -5.7%       1340 ±  3%  perf-stat.ps.context-switches
    105.13            +8.8%     114.37        perf-stat.ps.cpu-migrations
      1.17 ± 58%    +842.9%      11.00 ± 47%  perf-c2c.DRAM.local
     16.00 ± 32%    +143.8%      39.00 ±  7%  perf-c2c.DRAM.remote
    898.33 ± 25%   +1810.7%      17164 ±  3%  perf-c2c.HITM.local
     13.50 ± 38%    +148.1%      33.50 ± 11%  perf-c2c.HITM.remote
    911.83 ± 25%   +1786.1%      17198 ±  3%  perf-c2c.HITM.total
    238687            +6.7%     254685        proc-vmstat.nr_active_anon
   1088241            +1.5%    1104140        proc-vmstat.nr_file_pages
     22102            +2.1%      22572        proc-vmstat.nr_mapped
     71024           +22.4%      86938        proc-vmstat.nr_shmem
     26935            -4.5%      25728        proc-vmstat.nr_slab_unreclaimable
    238687            +6.7%     254685        proc-vmstat.nr_zone_active_anon
     29.44           -19.6        9.87        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.02           -18.5        9.50        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     25.18           -16.4        8.78        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.86 ±  2%     -15.4        8.43        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     22.74 ±  2%     -14.6        8.14        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     21.79 ±  2%     -13.9        7.90        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
     14.38 ±  2%     -10.6        3.75        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.84            -7.6        2.20        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
      6.22            -4.6        1.59        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64
      6.34            -4.5        1.82        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      4.96            -4.3        0.66        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack
      5.91            -4.2        1.71        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      5.65            -4.0        1.65        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      8.05 ±  4%      -3.8        4.22 ±  2%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      4.90 ±  2%      -3.8        1.13 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      4.61            -3.2        1.41        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      4.26            -2.9        1.34        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.81 ±  8%      -2.9        0.93 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      3.98            -2.7        1.26 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      3.27            -2.5        0.80        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.10 ±  2%      -2.4        0.73 ±  5%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      2.50 ± 13%      -1.9        0.58 ±  5%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.88 ±  2%      -1.9        1.00 ±  3%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      3.14 ± 10%      -1.8        1.38 ±  4%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      2.62 ±  2%      -1.7        0.92        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.57 ±  3%      -1.4        1.21 ±  4%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      4.64 ±  7%      -1.3        3.38 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.59 ±  3%      -0.9        0.67 ±  4%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      4.17 ±  8%      -0.9        3.27 ±  2%  perf-profile.calltrace.cycles-pp.kfree.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.00            +1.1        1.10        perf-profile.calltrace.cycles-pp.__slab_free.kfree.skb_release_data.consume_skb.unix_stream_read_generic
     63.37           +27.5       90.85        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     62.34           +28.3       90.60        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.69           +50.2       79.85        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.27           +51.2       79.46        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     24.98           +53.6       78.61        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.96           +55.2       78.10        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
     14.04 ±  2%     +61.4       75.40        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     12.78           +61.7       74.43        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     12.20           +62.0       74.24        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00           +67.0       67.03        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof
      0.00           +67.7       67.73        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve
      4.56 ±  2%     +67.9       72.50        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      3.62 ±  2%     +68.6       72.26        perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.00           +70.7       70.69        perf-profile.calltrace.cycles-pp.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb
      0.00           +70.8       70.79        perf-profile.calltrace.cycles-pp.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
     29.48           -19.6        9.88        perf-profile.children.cycles-pp.ksys_read
     28.05           -18.5        9.50        perf-profile.children.cycles-pp.vfs_read
     25.20           -16.4        8.78        perf-profile.children.cycles-pp.sock_read_iter
     23.92 ±  2%     -15.5        8.44        perf-profile.children.cycles-pp.sock_recvmsg
     22.77 ±  2%     -14.6        8.15        perf-profile.children.cycles-pp.unix_stream_recvmsg
     21.92 ±  2%     -14.0        7.94        perf-profile.children.cycles-pp.unix_stream_read_generic
     15.56 ±  2%     -11.5        4.01        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     10.01            -7.8        2.24        perf-profile.children.cycles-pp.syscall_return_via_sysret
      8.22            -6.2        2.04        perf-profile.children.cycles-pp.entry_SYSCALL_64
      7.27            -4.9        2.37        perf-profile.children.cycles-pp.__check_object_size
      6.37            -4.5        1.83        perf-profile.children.cycles-pp.unix_stream_read_actor
      5.96            -4.2        1.72        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      5.68            -4.0        1.66        perf-profile.children.cycles-pp.__skb_datagram_iter
      8.08 ±  4%      -3.9        4.23 ±  2%  perf-profile.children.cycles-pp.consume_skb
      5.81 ±  2%      -3.8        1.99 ±  4%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      4.90 ±  2%      -3.8        1.13 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      5.73 ±  9%      -3.7        1.99 ±  3%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      4.62            -3.2        1.41        perf-profile.children.cycles-pp.simple_copy_to_iter
      3.82 ±  8%      -2.9        0.94 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      4.03            -2.8        1.27 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      4.31 ±  2%      -2.7        1.61 ±  2%  perf-profile.children.cycles-pp.check_heap_object
      3.19 ±  4%      -2.5        0.65 ± 11%  perf-profile.children.cycles-pp.__virt_addr_valid
      3.33            -2.5        0.81        perf-profile.children.cycles-pp.skb_release_head_state
      2.97            -2.3        0.66        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.24 ±  4%      -1.6        0.60 ±  3%  perf-profile.children.cycles-pp.fdget_pos
      1.89            -1.4        0.46        perf-profile.children.cycles-pp.sock_wfree
      1.81 ±  2%      -1.3        0.51 ±  2%  perf-profile.children.cycles-pp.__check_heap_object
      4.67 ±  7%      -1.3        3.39 ±  2%  perf-profile.children.cycles-pp.skb_release_data
      1.60            -0.9        0.69        perf-profile.children.cycles-pp._raw_spin_lock
      4.18 ±  8%      -0.9        3.29 ±  2%  perf-profile.children.cycles-pp.kfree
      1.19 ±  5%      -0.8        0.34 ±  3%  perf-profile.children.cycles-pp.rw_verify_area
      1.10            -0.8        0.27 ±  2%  perf-profile.children.cycles-pp.unix_wfree
      0.95 ±  2%      -0.7        0.21        perf-profile.children.cycles-pp.sock_def_readable
      1.14 ±  8%      -0.7        0.40 ±  3%  perf-profile.children.cycles-pp.testcase
      0.94            -0.7        0.24 ±  3%  perf-profile.children.cycles-pp.unix_write_space
      0.90 ±  2%      -0.7        0.20        perf-profile.children.cycles-pp.__account_obj_stock
      0.96 ± 11%      -0.7        0.30 ± 21%  perf-profile.children.cycles-pp.__refill_obj_stock
      0.66            -0.5        0.16 ±  2%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.65 ±  2%      -0.5        0.16 ±  2%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.64 ±  2%      -0.5        0.15 ±  3%  perf-profile.children.cycles-pp._copy_from_iter
      0.69 ±  6%      -0.5        0.22 ±  4%  perf-profile.children.cycles-pp.security_file_permission
      0.61 ±  8%      -0.5        0.15 ± 10%  perf-profile.children.cycles-pp._copy_to_iter
      0.67 ± 19%      -0.5        0.22 ± 20%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.55            -0.4        0.14 ±  3%  perf-profile.children.cycles-pp.unix_destruct_scm
      0.54 ±  4%      -0.4        0.13 ±  3%  perf-profile.children.cycles-pp.scm_recv_unix
      0.58 ±  4%      -0.4        0.19 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      0.54 ±  5%      -0.4        0.14 ±  5%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.48            -0.3        0.14 ±  2%  perf-profile.children.cycles-pp.prandom_u32_state
      0.39 ±  3%      -0.3        0.09 ±  4%  perf-profile.children.cycles-pp.check_stack_object
      0.40            -0.3        0.11 ±  4%  perf-profile.children.cycles-pp.mutex_lock
      0.36 ± 13%      -0.3        0.10 ± 21%  perf-profile.children.cycles-pp.__css_rstat_updated
      0.31 ±  2%      -0.2        0.06        perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.33 ±  3%      -0.2        0.08 ±  5%  perf-profile.children.cycles-pp.__scm_recv_common
      0.33 ±  5%      -0.2        0.09 ±  5%  perf-profile.children.cycles-pp.mutex_unlock
      0.22            -0.2        0.02 ± 99%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.23 ±  5%      -0.2        0.05        perf-profile.children.cycles-pp.security_socket_sendmsg
      0.22 ±  4%      -0.2        0.05        perf-profile.children.cycles-pp.security_socket_recvmsg
      0.21 ±  2%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp._raw_spin_unlock
      0.18 ±  3%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.put_pid
      0.17 ± 24%      -0.1        0.06 ± 13%  perf-profile.children.cycles-pp.write
      0.34 ±  2%      -0.1        0.28        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.38            -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.26 ±  2%      -0.1        0.19 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.21 ±  2%      -0.1        0.16 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.23            -0.1        0.18 ±  2%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.30 ±  3%      -0.1        0.24        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.29 ±  2%      -0.1        0.24 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.36 ±  3%      -0.0        0.33 ±  4%  perf-profile.children.cycles-pp.trylock_stock
      0.14 ±  3%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.sched_tick
      0.09 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__pcs_replace_full_main
      0.00            +0.2        0.25 ±  3%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +1.1        1.10        perf-profile.children.cycles-pp.__slab_free
     63.59           +27.3       90.94        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     62.54           +28.1       90.69        perf-profile.children.cycles-pp.do_syscall_64
     29.77           +50.1       79.90        perf-profile.children.cycles-pp.ksys_write
     28.32           +51.2       79.50        perf-profile.children.cycles-pp.vfs_write
     25.04           +53.6       78.63        perf-profile.children.cycles-pp.sock_write_iter
     23.12           +55.0       78.14        perf-profile.children.cycles-pp.unix_stream_sendmsg
     14.08 ±  2%     +61.3       75.42        perf-profile.children.cycles-pp.sock_alloc_send_pskb
     12.79           +61.6       74.44        perf-profile.children.cycles-pp.alloc_skb_with_frags
     12.31           +62.0       74.27        perf-profile.children.cycles-pp.__alloc_skb
      0.00           +67.0       67.04        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00           +67.8       67.76        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      4.61 ±  2%     +67.9       72.50        perf-profile.children.cycles-pp.kmalloc_reserve
      3.66 ±  2%     +68.6       72.26        perf-profile.children.cycles-pp.__kmalloc_node_track_caller_noprof
      0.00           +70.7       70.70        perf-profile.children.cycles-pp.get_from_partial_node
      0.00           +70.8       70.79        perf-profile.children.cycles-pp.___slab_alloc
     15.39 ±  2%     -11.4        3.96        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.89            -7.7        2.23        perf-profile.self.cycles-pp.syscall_return_via_sysret
      8.22            -6.2        2.04        perf-profile.self.cycles-pp.entry_SYSCALL_64
      4.76            -3.3        1.50 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      4.20 ± 12%      -2.6        1.56 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      3.12 ±  4%      -2.5        0.63 ± 11%  perf-profile.self.cycles-pp.__virt_addr_valid
      2.69 ±  3%      -2.0        0.66 ±  2%  perf-profile.self.cycles-pp.vfs_write
      2.58 ±  3%      -2.0        0.58        perf-profile.self.cycles-pp.__alloc_skb
      2.43            -1.9        0.58        perf-profile.self.cycles-pp.unix_stream_sendmsg
      2.22 ±  2%      -1.7        0.55 ±  2%  perf-profile.self.cycles-pp.vfs_read
      2.20 ±  4%      -1.6        0.58 ±  3%  perf-profile.self.cycles-pp.fdget_pos
      1.85 ±  4%      -1.4        0.46        perf-profile.self.cycles-pp.do_syscall_64
      1.65 ±  4%      -1.3        0.36 ±  5%  perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      1.79 ±  2%      -1.3        0.51 ±  2%  perf-profile.self.cycles-pp.__check_heap_object
      1.72            -1.3        0.44        perf-profile.self.cycles-pp.sock_write_iter
      1.54 ±  3%      -1.1        0.41 ±  2%  perf-profile.self.cycles-pp.unix_stream_read_generic
      1.29            -1.0        0.34        perf-profile.self.cycles-pp.sock_read_iter
      1.27            -0.9        0.34 ±  5%  perf-profile.self.cycles-pp.kmem_cache_free
      1.54            -0.9        0.67        perf-profile.self.cycles-pp._raw_spin_lock
      1.06 ±  2%      -0.9        0.20 ±  2%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller_noprof
      1.09            -0.8        0.26        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.96            -0.8        0.21        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.94            -0.7        0.22 ±  2%  perf-profile.self.cycles-pp.sock_wfree
      0.94 ±  4%      -0.7        0.24 ±  2%  perf-profile.self.cycles-pp.sock_recvmsg
      0.88 ±  3%      -0.7        0.18 ±  2%  perf-profile.self.cycles-pp.__check_object_size
      0.89 ±  2%      -0.7        0.20        perf-profile.self.cycles-pp.sock_def_readable
      1.08 ±  8%      -0.7        0.39        perf-profile.self.cycles-pp.testcase
      0.89            -0.7        0.22 ±  3%  perf-profile.self.cycles-pp.unix_write_space
      0.86 ±  4%      -0.6        0.22 ±  3%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.82 ±  2%      -0.6        0.19 ±  2%  perf-profile.self.cycles-pp.__account_obj_stock
      0.66 ±  6%      -0.4        0.22 ±  3%  perf-profile.self.cycles-pp.security_file_permission
      0.60            -0.4        0.16 ±  3%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.50            -0.4        0.13        perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.49 ±  3%      -0.4        0.12 ±  4%  perf-profile.self.cycles-pp.rw_verify_area
      0.50 ± 10%      -0.4        0.13 ± 23%  perf-profile.self.cycles-pp.__refill_obj_stock
      0.50 ±  5%      -0.4        0.13 ±  5%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.48            -0.4        0.12        perf-profile.self.cycles-pp.unix_destruct_scm
      0.46            -0.4        0.10 ±  4%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.52 ±  4%      -0.4        0.17 ±  2%  perf-profile.self.cycles-pp.x64_sys_call
      0.44 ±  6%      -0.3        0.10 ±  5%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.45            -0.3        0.11 ±  6%  perf-profile.self.cycles-pp.unix_wfree
      0.48 ±  3%      -0.3        0.16        perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.44 ±  2%      -0.3        0.14 ±  3%  perf-profile.self.cycles-pp.prandom_u32_state
      0.38            -0.3        0.10 ±  3%  perf-profile.self.cycles-pp.mutex_lock
      0.36 ±  2%      -0.3        0.08 ±  4%  perf-profile.self.cycles-pp._copy_from_iter
      0.38 ±  3%      -0.3        0.10 ±  6%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.36 ± 12%      -0.3        0.10 ± 17%  perf-profile.self.cycles-pp._copy_to_iter
      0.34 ±  4%      -0.3        0.07 ±  6%  perf-profile.self.cycles-pp.check_stack_object
      0.33 ±  2%      -0.3        0.07        perf-profile.self.cycles-pp.skb_release_head_state
      0.99 ±  4%      -0.3        0.73        perf-profile.self.cycles-pp.kfree
      0.35 ± 13%      -0.3        0.10 ± 21%  perf-profile.self.cycles-pp.__css_rstat_updated
      0.35            -0.3        0.09 ±  4%  perf-profile.self.cycles-pp.ksys_read
      0.36            -0.3        0.11        perf-profile.self.cycles-pp.ksys_write
      0.29 ±  3%      -0.2        0.04 ± 44%  perf-profile.self.cycles-pp.simple_copy_to_iter
      0.33 ±  3%      -0.2        0.08 ±  5%  perf-profile.self.cycles-pp.skb_release_data
      0.31 ±  3%      -0.2        0.07        perf-profile.self.cycles-pp.kmalloc_reserve
      0.32 ±  4%      -0.2        0.09 ±  5%  perf-profile.self.cycles-pp.mutex_unlock
      0.29 ±  2%      -0.2        0.06        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.28 ±  4%      -0.2        0.06        perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.28 ±  3%      -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.__scm_recv_common
      0.42 ±  5%      -0.2        0.22 ±  3%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.29 ± 30%      -0.2        0.12 ± 22%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.21 ±  8%      -0.2        0.05        perf-profile.self.cycles-pp.scm_recv_unix
      0.18 ±  2%      -0.2        0.02 ± 99%  perf-profile.self.cycles-pp._raw_spin_unlock
      0.19 ±  3%      -0.2        0.03 ± 70%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.16 ±  2%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.consume_skb
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__pcs_replace_empty_main
      0.00            +0.1        0.05 ± 13%  perf-profile.self.cycles-pp.__pcs_replace_full_main
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.7        0.73        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +1.1        1.09        perf-profile.self.cycles-pp.__slab_free
      0.00            +2.7        2.70        perf-profile.self.cycles-pp.get_from_partial_node
      0.00           +67.0       67.03        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/unix1/will-it-scale

commit: 
  7a9a1d643a ("selftests/bpf: Add arena mmap stale-fault coverage")
  8e98bca9b3 ("bpf,slab: Add slub-backed allocator for bpf_arena")

7a9a1d643a75c217 8e98bca9b3d9cd5861cf495a9f7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  15765888           -62.9%    5849939        will-it-scale.48.threads
    328455           -62.9%     121873        will-it-scale.per_thread_ops
  15765888           -62.9%    5849939        will-it-scale.workload
     30.36 ±  2%     -69.2%       9.35        vmstat.cpu.us
      1463            -4.3%       1400        vmstat.system.cs
    949369            +6.8%    1013747        meminfo.Active
    949338            +6.8%    1013716        meminfo.Active(anon)
    281267           +22.9%     345663        meminfo.Shmem
    116719 ±  6%      -9.9%     105134 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     16.72           -11.6%      14.78 ±  7%  sched_debug.cfs_rq:/.load_avg.min
    116719 ±  6%      -9.9%     105134 ±  2%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    173.38            -3.7%     166.89        turbostat.CorWatt
      0.50           -38.2%       0.31        turbostat.IPC
    202.59            -3.2%     196.06        turbostat.PkgWatt
      0.26            -0.0        0.24        mpstat.cpu.all.irq%
      0.02            -0.0        0.01 ±  2%  mpstat.cpu.all.soft%
     68.56           +20.8       89.35        mpstat.cpu.all.sys%
     30.55 ±  2%     -21.0        9.57        mpstat.cpu.all.usr%
     13.00 ± 25%    +166.7%      34.67 ± 11%  perf-c2c.DRAM.remote
    776.00 ± 26%   +1900.6%      15524 ±  3%  perf-c2c.HITM.local
     10.67 ± 34%    +187.5%      30.67 ± 14%  perf-c2c.HITM.remote
    786.67 ± 26%   +1877.4%      15555 ±  3%  perf-c2c.HITM.total
      1418            -4.5%       1354        perf-stat.i.context-switches
    107.89            +6.7%     115.10        perf-stat.i.cpu-migrations
      1415            -4.3%       1354        perf-stat.ps.context-switches
    107.32            +6.6%     114.44        perf-stat.ps.cpu-migrations
    407202 ±  5%     -26.9%     297604 ± 37%  numa-meminfo.node0.Active
    407186 ±  5%     -26.9%     297590 ± 37%  numa-meminfo.node0.Active(anon)
    542340 ±  4%     +32.1%     716274 ± 15%  numa-meminfo.node1.Active
    542325 ±  4%     +32.1%     716257 ± 15%  numa-meminfo.node1.Active(anon)
    237478 ± 10%     +24.6%     295845 ±  6%  numa-meminfo.node1.Shmem
    101788 ±  5%     -26.9%      74396 ± 37%  numa-vmstat.node0.nr_active_anon
    101788 ±  5%     -26.9%      74396 ± 37%  numa-vmstat.node0.nr_zone_active_anon
    135542 ±  4%     +32.1%     179116 ± 15%  numa-vmstat.node1.nr_active_anon
     59330 ± 10%     +24.7%      74005 ±  6%  numa-vmstat.node1.nr_shmem
    135542 ±  4%     +32.1%     179116 ± 15%  numa-vmstat.node1.nr_zone_active_anon
    237325            +6.8%     253441        proc-vmstat.nr_active_anon
   1087503            +1.5%    1103620        proc-vmstat.nr_file_pages
     21835            +2.9%      22478        proc-vmstat.nr_mapped
     70301           +22.9%      86421        proc-vmstat.nr_shmem
     26779            -4.2%      25654        proc-vmstat.nr_slab_unreclaimable
    237325            +6.8%     253441        proc-vmstat.nr_zone_active_anon
     29.92           -19.3       10.62 ±  2%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.92           -17.0        9.88 ±  3%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     24.22           -15.1        9.16 ±  3%  perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.90           -14.1        8.81 ±  3%  perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     21.82           -13.3        8.52 ±  4%  perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     20.88           -12.6        8.28 ±  4%  perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
     13.80 ±  2%     -10.1        3.75        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.41 ±  3%      -7.2        2.17        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret
      6.00            -4.4        1.60        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64
      4.83            -4.2        0.66 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack
      6.02            -4.1        1.91        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      5.60            -3.8        1.80        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      5.32            -3.6        1.74 ±  2%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      4.57 ±  2%      -3.5        1.11 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      7.71 ±  3%      -3.3        4.44 ±  6%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      4.34            -2.8        1.49 ±  2%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      3.65 ± 12%      -2.7        0.96 ±  7%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      4.00            -2.6        1.43 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.76            -2.5        1.30 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      3.16            -2.4        0.80        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.86 ±  5%      -2.1        0.73 ±  3%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      2.30 ± 15%      -1.9        0.38 ± 71%  perf-profile.calltrace.cycles-pp.fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.30 ± 15%      -1.8        0.48 ± 46%  perf-profile.calltrace.cycles-pp.fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.39 ± 18%      -1.8        0.60 ± 13%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.71            -1.7        1.04 ±  3%  perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.96 ±  9%      -1.6        1.40 ±  4%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      2.44 ±  2%      -1.4        1.00 ±  3%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.54 ±  4%      -1.4        1.17 ±  3%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      4.40 ±  6%      -0.8        3.60 ±  7%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.44 ±  2%      -0.7        0.72 ±  4%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      3.98 ±  6%      -0.5        3.48 ±  8%  perf-profile.calltrace.cycles-pp.kfree.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.00            +1.3        1.25 ± 18%  perf-profile.calltrace.cycles-pp.__slab_free.kfree.skb_release_data.consume_skb.unix_stream_read_generic
     64.44           +26.3       90.76        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.43           +27.1       90.50        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.30           +48.7       79.04        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     27.30           +51.0       78.30        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     24.14           +53.3       77.46        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.11           +54.8       76.96        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
     13.58           +60.6       74.22        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     12.32           +61.0       73.32        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     11.74           +61.4       73.16        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00           +66.0       66.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof
      0.00           +66.7       66.71        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve
      4.52 ±  2%     +66.9       71.42        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      3.59 ±  3%     +67.6       71.18        perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.00           +69.7       69.66        perf-profile.calltrace.cycles-pp.get_from_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb
      0.00           +69.8       69.76        perf-profile.calltrace.cycles-pp.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
     29.97           -19.3       10.63 ±  2%  perf-profile.children.cycles-pp.ksys_read
     26.96           -17.1        9.88 ±  3%  perf-profile.children.cycles-pp.vfs_read
     24.25           -15.1        9.17 ±  3%  perf-profile.children.cycles-pp.sock_read_iter
     22.96           -14.1        8.82 ±  3%  perf-profile.children.cycles-pp.sock_recvmsg
     21.84           -13.3        8.52 ±  4%  perf-profile.children.cycles-pp.unix_stream_recvmsg
     21.00           -12.7        8.31 ±  4%  perf-profile.children.cycles-pp.unix_stream_read_generic
     14.88 ±  2%     -10.9        4.00        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.58 ±  3%      -7.4        2.22        perf-profile.children.cycles-pp.syscall_return_via_sysret
      7.90            -5.9        2.04        perf-profile.children.cycles-pp.entry_SYSCALL_64
      6.83            -4.3        2.50 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      6.05            -4.1        1.92        perf-profile.children.cycles-pp.unix_stream_read_actor
      5.64            -3.8        1.80        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      5.58 ±  3%      -3.7        1.93 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      5.36            -3.6        1.74 ±  2%  perf-profile.children.cycles-pp.__skb_datagram_iter
      4.64 ± 14%      -3.5        1.12 ±  9%  perf-profile.children.cycles-pp.fdget_pos
      4.58 ±  2%      -3.5        1.11 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      5.45 ±  6%      -3.4        2.02 ±  5%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      7.74 ±  3%      -3.3        4.45 ±  6%  perf-profile.children.cycles-pp.consume_skb
      4.35            -2.9        1.50 ±  2%  perf-profile.children.cycles-pp.simple_copy_to_iter
      3.66 ± 12%      -2.7        0.97 ±  7%  perf-profile.children.cycles-pp.kmem_cache_free
      3.40 ± 16%      -2.6        0.80 ± 12%  perf-profile.children.cycles-pp.__fget_files
      3.80            -2.5        1.30 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      3.22            -2.4        0.82        perf-profile.children.cycles-pp.skb_release_head_state
      2.95 ±  2%      -2.3        0.62 ± 10%  perf-profile.children.cycles-pp.__virt_addr_valid
      2.93            -2.3        0.66 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      3.97            -2.2        1.74 ±  3%  perf-profile.children.cycles-pp.check_heap_object
      1.83            -1.4        0.47 ±  2%  perf-profile.children.cycles-pp.sock_wfree
      1.72            -1.2        0.50 ±  2%  perf-profile.children.cycles-pp.__check_heap_object
      1.54            -0.9        0.68        perf-profile.children.cycles-pp._raw_spin_lock
      1.17 ±  3%      -0.8        0.34 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      4.43 ±  6%      -0.8        3.61 ±  7%  perf-profile.children.cycles-pp.skb_release_data
      1.12 ±  7%      -0.8        0.33 ±  2%  perf-profile.children.cycles-pp.testcase
      1.05            -0.8        0.27        perf-profile.children.cycles-pp.unix_wfree
      0.93 ±  2%      -0.7        0.21 ±  3%  perf-profile.children.cycles-pp.sock_def_readable
      0.91 ±  2%      -0.7        0.20 ±  2%  perf-profile.children.cycles-pp.__account_obj_stock
      0.92 ±  2%      -0.7        0.24 ±  3%  perf-profile.children.cycles-pp.unix_write_space
      0.95 ± 11%      -0.7        0.28 ± 10%  perf-profile.children.cycles-pp.__refill_obj_stock
      0.76            -0.6        0.20 ±  2%  perf-profile.children.cycles-pp.fput
      0.71 ± 12%      -0.5        0.17 ±  2%  perf-profile.children.cycles-pp.read
      0.71 ±  8%      -0.5        0.20 ± 21%  perf-profile.children.cycles-pp.__mod_memcg_state
      4.00 ±  6%      -0.5        3.50 ±  8%  perf-profile.children.cycles-pp.kfree
      0.65 ±  2%      -0.5        0.17        perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.65 ±  3%      -0.5        0.17 ±  2%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.58 ±  5%      -0.4        0.14 ±  3%  perf-profile.children.cycles-pp._copy_from_iter
      0.61 ±  4%      -0.4        0.17 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      0.62 ±  4%      -0.4        0.20        perf-profile.children.cycles-pp.security_file_permission
      0.55 ±  4%      -0.4        0.14 ±  3%  perf-profile.children.cycles-pp.prandom_u32_state
      0.56 ±  3%      -0.4        0.15 ± 12%  perf-profile.children.cycles-pp._copy_to_iter
      0.53 ±  3%      -0.4        0.13 ±  2%  perf-profile.children.cycles-pp.scm_recv_unix
      0.53            -0.4        0.14 ±  2%  perf-profile.children.cycles-pp.unix_destruct_scm
      0.47 ±  7%      -0.3        0.13 ± 16%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.38 ± 12%      -0.3        0.09 ± 24%  perf-profile.children.cycles-pp.__css_rstat_updated
      0.39            -0.3        0.10 ±  4%  perf-profile.children.cycles-pp.mutex_lock
      0.37 ±  3%      -0.3        0.10 ±  6%  perf-profile.children.cycles-pp.check_stack_object
      0.30 ±  3%      -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.32 ±  3%      -0.2        0.08 ±  4%  perf-profile.children.cycles-pp.__scm_recv_common
      0.33 ±  2%      -0.2        0.09 ±  5%  perf-profile.children.cycles-pp.mutex_unlock
      0.22 ±  4%      -0.2        0.05        perf-profile.children.cycles-pp.security_socket_sendmsg
      0.21 ±  5%      -0.2        0.05 ±  8%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.18 ±  2%      -0.2        0.02 ± 99%  perf-profile.children.cycles-pp.put_pid
      0.21            -0.2        0.06 ±  8%  perf-profile.children.cycles-pp._raw_spin_unlock
      0.39 ±  4%      -0.1        0.26 ± 12%  perf-profile.children.cycles-pp.trylock_stock
      0.12 ± 12%      -0.1        0.06        perf-profile.children.cycles-pp.read@plt
      0.34 ±  2%      -0.1        0.28 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.37            -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.30 ±  2%      -0.1        0.24        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.25 ±  2%      -0.1        0.20 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.21            -0.0        0.16 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.29            -0.0        0.24        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.23 ±  2%      -0.0        0.18 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.13 ±  3%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.sched_tick
      0.11 ±  3%      +0.0        0.13 ±  4%  perf-profile.children.cycles-pp.write
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.00            +0.2        0.25        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +1.3        1.25 ± 18%  perf-profile.children.cycles-pp.__slab_free
     64.66           +26.2       90.85        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.63           +27.0       90.60        perf-profile.children.cycles-pp.do_syscall_64
     30.38           +48.7       79.10        perf-profile.children.cycles-pp.ksys_write
     27.36           +51.0       78.34        perf-profile.children.cycles-pp.vfs_write
     24.20           +53.3       77.48        perf-profile.children.cycles-pp.sock_write_iter
     22.27           +54.7       76.99        perf-profile.children.cycles-pp.unix_stream_sendmsg
     13.61           +60.6       74.23        perf-profile.children.cycles-pp.sock_alloc_send_pskb
     12.34           +61.0       73.32        perf-profile.children.cycles-pp.alloc_skb_with_frags
     11.85           +61.3       73.18        perf-profile.children.cycles-pp.__alloc_skb
      0.00           +66.2       66.18        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      4.57 ±  2%     +66.9       71.44        perf-profile.children.cycles-pp.kmalloc_reserve
      0.00           +66.9       66.90        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      3.62 ±  3%     +67.6       71.19        perf-profile.children.cycles-pp.__kmalloc_node_track_caller_noprof
      0.00           +69.7       69.66        perf-profile.children.cycles-pp.get_from_partial_node
      0.00           +69.8       69.76        perf-profile.children.cycles-pp.___slab_alloc
     14.71 ±  2%     -10.7        3.96        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.46 ±  3%      -7.3        2.20        perf-profile.self.cycles-pp.syscall_return_via_sysret
      7.90            -5.9        2.04        perf-profile.self.cycles-pp.entry_SYSCALL_64
      4.50 ±  3%      -3.0        1.49 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      3.38 ± 16%      -2.6        0.80 ± 12%  perf-profile.self.cycles-pp.__fget_files
      3.94 ±  7%      -2.3        1.61 ±  6%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      2.89 ±  2%      -2.3        0.61 ± 10%  perf-profile.self.cycles-pp.__virt_addr_valid
      2.56 ±  3%      -1.9        0.65 ±  6%  perf-profile.self.cycles-pp.vfs_write
      2.48 ±  4%      -1.9        0.59 ±  3%  perf-profile.self.cycles-pp.__alloc_skb
      2.35            -1.8        0.59        perf-profile.self.cycles-pp.unix_stream_sendmsg
      2.11 ±  2%      -1.6        0.55 ±  4%  perf-profile.self.cycles-pp.vfs_read
      1.74 ±  3%      -1.3        0.45 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      1.72            -1.3        0.44        perf-profile.self.cycles-pp.sock_write_iter
      1.70            -1.2        0.50 ±  3%  perf-profile.self.cycles-pp.__check_heap_object
      1.54 ±  5%      -1.2        0.36 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      1.50            -1.1        0.43 ±  2%  perf-profile.self.cycles-pp.unix_stream_read_generic
      1.30            -1.0        0.34 ±  2%  perf-profile.self.cycles-pp.sock_read_iter
      1.22 ± 21%      -0.9        0.31 ± 20%  perf-profile.self.cycles-pp.fdget_pos
      1.22 ±  4%      -0.9        0.35 ±  6%  perf-profile.self.cycles-pp.kmem_cache_free
      1.05 ±  2%      -0.8        0.20 ±  2%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller_noprof
      1.07            -0.8        0.26        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.47            -0.8        0.66        perf-profile.self.cycles-pp._raw_spin_lock
      1.02 ±  2%      -0.8        0.22 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.88 ±  4%      -0.7        0.18 ±  2%  perf-profile.self.cycles-pp.__check_object_size
      0.88 ±  2%      -0.7        0.20 ±  3%  perf-profile.self.cycles-pp.sock_def_readable
      0.90            -0.7        0.22 ±  4%  perf-profile.self.cycles-pp.sock_wfree
      0.95 ±  5%      -0.7        0.29 ±  2%  perf-profile.self.cycles-pp.testcase
      0.90 ±  4%      -0.7        0.24 ±  3%  perf-profile.self.cycles-pp.sock_recvmsg
      0.87 ±  2%      -0.6        0.23 ±  2%  perf-profile.self.cycles-pp.unix_write_space
      0.83 ±  3%      -0.6        0.19 ±  2%  perf-profile.self.cycles-pp.__account_obj_stock
      0.84 ±  3%      -0.6        0.22 ±  3%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.72            -0.5        0.19 ±  2%  perf-profile.self.cycles-pp.fput
      0.61 ± 14%      -0.5        0.12 ±  3%  perf-profile.self.cycles-pp.read
      0.60 ±  2%      -0.4        0.16 ±  3%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.54 ±  4%      -0.4        0.14 ±  3%  perf-profile.self.cycles-pp.rw_verify_area
      0.59 ±  4%      -0.4        0.19 ±  3%  perf-profile.self.cycles-pp.security_file_permission
      0.52 ±  4%      -0.4        0.12 ±  4%  perf-profile.self.cycles-pp.prandom_u32_state
      0.54 ±  4%      -0.4        0.15 ±  3%  perf-profile.self.cycles-pp.x64_sys_call
      0.50            -0.4        0.14 ±  3%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.48 ± 10%      -0.4        0.13 ± 10%  perf-profile.self.cycles-pp.__refill_obj_stock
      0.45            -0.4        0.10 ±  4%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.46 ±  2%      -0.3        0.11        perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.48 ±  2%      -0.3        0.14 ±  3%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.46            -0.3        0.12        perf-profile.self.cycles-pp.unix_destruct_scm
      0.43            -0.3        0.11        perf-profile.self.cycles-pp.unix_wfree
      0.44 ±  7%      -0.3        0.12 ± 16%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.38 ±  5%      -0.3        0.09 ±  4%  perf-profile.self.cycles-pp._copy_from_iter
      0.38 ±  2%      -0.3        0.10 ±  7%  perf-profile.self.cycles-pp.unix_stream_read_actor
      0.39 ±  2%      -0.3        0.11 ±  4%  perf-profile.self.cycles-pp.ksys_write
      0.37 ± 13%      -0.3        0.09 ± 21%  perf-profile.self.cycles-pp.__css_rstat_updated
      0.38            -0.3        0.10 ±  4%  perf-profile.self.cycles-pp.mutex_lock
      0.34 ±  4%      -0.3        0.07        perf-profile.self.cycles-pp.skb_release_head_state
      0.36 ±  2%      -0.3        0.10        perf-profile.self.cycles-pp.ksys_read
      0.42 ±  2%      -0.3        0.17 ±  6%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.29 ±  2%      -0.2        0.05 ±  8%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.28 ±  2%      -0.2        0.05        perf-profile.self.cycles-pp.simple_copy_to_iter
      0.32 ±  5%      -0.2        0.08 ±  5%  perf-profile.self.cycles-pp.check_stack_object
      0.30 ±  3%      -0.2        0.07 ±  6%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.32 ±  4%      -0.2        0.09 ±  7%  perf-profile.self.cycles-pp.mutex_unlock
      0.30 ±  3%      -0.2        0.08 ±  4%  perf-profile.self.cycles-pp._copy_to_iter
      0.28 ±  2%      -0.2        0.06 ±  6%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.30 ±  3%      -0.2        0.09        perf-profile.self.cycles-pp.skb_release_data
      0.27 ±  4%      -0.2        0.07 ±  8%  perf-profile.self.cycles-pp.__scm_recv_common
      0.32 ± 11%      -0.2        0.12 ± 25%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.98 ±  5%      -0.2        0.78 ±  4%  perf-profile.self.cycles-pp.kfree
      0.21 ±  8%      -0.2        0.05        perf-profile.self.cycles-pp.scm_recv_unix
      0.19 ±  5%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.18 ±  2%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp._raw_spin_unlock
      0.16 ±  3%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.consume_skb
      0.10 ± 10%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.read@plt
      0.07            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.write
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__pcs_replace_empty_main
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
      0.84 ±  2%      +0.2        1.08 ±  8%  perf-profile.self.cycles-pp.check_heap_object
      0.00            +0.7        0.74 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +1.1        1.08 ±  3%  perf-profile.self.cycles-pp.__slab_free
      0.00            +2.7        2.70        perf-profile.self.cycles-pp.get_from_partial_node
      0.00           +66.2       66.16        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

