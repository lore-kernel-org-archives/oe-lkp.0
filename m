Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C760D1DED40
	for <oe-lkp@lists.linux.dev>; Sat,  4 Jul 2026 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783134827; cv=fail; b=GJe0ZfY7GLzjGR2EXyYWU7gLXyq/xxFzb7uKeERZ2aQd3qxltBAKSs6sqGr7DCvTEHP4UaTqhOK5g76cJR9WXYwqafwwUlhF5ySLw5+rR9D/CxnxVgnpoFDdqKPMbUlohIzH7aZ9kAE/GrEWfcN0EuLFUun/uj2RpCXmTU7bO8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783134827; c=relaxed/simple;
	bh=bxQP8PtUiTQn8Rl9toym1rV5UQ5QxeuphG75txeOnTg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nkSTOW0KIj9KrokUyxPprU06NvBCcda+71wflvmrdNU9Tum9IhahthKJt4y/Y4P2dmO8JGnMlF0Obq5uzEDrnQhoSYRgMMlFKSccc2QrGBsFl9H1zZZ01QhbfzWOTArxtckjmKkJ7Y3MueE5B54iNZty/CwSK7/FZlDq7KHnHR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WG+n8CfU; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WG+n8CfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783134824; x=1814670824;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=bxQP8PtUiTQn8Rl9toym1rV5UQ5QxeuphG75txeOnTg=;
  b=WG+n8CfUe3FlWIUYYXBpDz4kWcxkXS8oL5/OyskEkz8SZ2YU8hRH77ia
   LKnTbUpQWlgGVA445C/TRYfHBcOybAJcQ4wfgok6+SrKb0HazRn8jyzo8
   jnVMQilvtIQdlIpmCmCQ1Z4NrLoNfj2hJjfCELfoTk/9sa6K1YqRGXxBC
   Gd0HiXTiUYLkJjswHWuM2IsENezDbHsx5XsXdLoyo5fNdPYqzua2EUZ/g
   lqUnLzmHEqipKXN+HUj8Su1pkhs+HNAvSB/Kble2s0ECpjCKIofjgbyEM
   Ngtq9qOK+TvITWIlSJ604VTIrIyHhmx73giGCnbSVKKn/wk754OCYo/b4
   g==;
X-CSE-ConnectionGUID: NAeuxCZxTUm1A2ui8fKqnQ==
X-CSE-MsgGUID: bVnSZKb5QEGQqxbGL2qWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95026247"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="95026247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:13:44 -0700
X-CSE-ConnectionGUID: dkuNHSDvSJqXxMA7DzPyKQ==
X-CSE-MsgGUID: 49gqMLc/QxCJwwKFanZJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="251505802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 20:13:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 20:13:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 20:13:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 20:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAZyehGuqvpXVNH/WwNqcS+IcSqjDRAarnZ9r88akow8Nrg+bF6H2z5KxEJXj6gRbVqSgd13BGn0QQrmH2X25B/gxrehAwt0XUuNSHRCnyoqxU2baiqJwABNmpIKnuWHnjHErYb428hsRkNpWuA63I/kaFIsZ1oXsgmrT11dcrmIwapuPXSm0KGK6RSykcMK2Q+u0m+M66gMqQe01bMFis72tCaq7yonePqv30uhGsQnvpM33eFMQeUK/svb/DWO/W4qodmpQc7RIMmnGz+mHmBsqjlIx79NiDbJb9IF0wYra3HnfVcnmXwDm9B0ldG6HQd3rJ/a3EU0pdbZbK/1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfVAzmJ5pcwx3J4/vD0dHv3NWPF0x7A/DMPGJOLaltI=;
 b=Y2Cl5FmEUqZpe4sD2X0OmMdJhyro5A3YBbYTJ25g+9mpGOWMcDCq1c0VTfC58Uxbaxqef4pPIcMIVqI9CUaXIk6El+ANrg9JtKXpPvFbRRU704zcxzlGL6XaVadj1A7A8bs87joK8HCgQupm0hQR1irT1WnZ+ZRkDDLJoIZR65mElP5Xli0QMcsNAbwbMy7EELwrc4vkSwIkwgHIVU3mu1IDPGMtX5yuLa2YMBepJnS1ool+3N6v/ElyF2FGxrkPTH3QED9QhQfhvt4b4YaCfCplsCPmHCOOsnxboimYg/E8iwdSbliK9C5U8pTnjEPB82O2dWtapAPCbKF3I4kXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sat, 4 Jul 2026
 03:13:40 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0181.008; Sat, 4 Jul 2026
 03:13:40 +0000
Date: Sat, 4 Jul 2026 11:13:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/rt]  dd29c017ae: stress-ng.cyclic.ops_per_sec
 24.2% regression
Message-ID: <202607041048.a96a4796-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::15) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: de8cdfec-e6c7-4f66-d853-08ded97a3f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ch10bToq5dJV1VDyPkvtXcerPX/SQ33+OFoxi4nxpbb2O8KlI3sVaWIoAqydT3cLlSBxxh2MROhWQ7KNk2+r6p3FD/wIkUB5G7kqWNchLEYtSF8Drk8rNp2ygYf+MDvKQDtqnfDpyZ5cTPGlvoAT/w2lTG1JyzAJU2+9E9AwLpp8WftQjnBNZKG+AdJjT0xb9Ja6YBaO0JgNYN0jxvCD+kMTYOLkV2S9ywuLRZ694NcMrSSmTKjzR+nVX8wwqwj/UHtKXLiCjF1Y000we+yN65ztl8jff7vu7jZgTcwbJkWdngxkh6hDMsY0+1/nd7TCyj0FUc+glM60tgD2wD6rmNB5i46zwn55mN4bOr8OhomOamNWygOexUTlUwPq41qhASPgTAj7Js5vOekMD0eRbQ9yQMbkh9v27HNzKb900K7WxWdgqwxWBeXyCrHot6P0KdoiIW1f2Cg8ZHb6itOvP29XDxC16lSoJR+N0ZGCLESGDbMkOywusyK+yMN1wbZSyY8ZH+j5hwx/WKyKefJsWWfd8jXom0GvEnDZuo2YiRwgdwufTuksHjAmt1Cl7Q9xbQ+PAmcs23ury5Sl2q89r4vUjZAsws4XWV2GxkAhWl0dQ520Y33xUnMqUSIJ2YMQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BAN4PUprbgX3B0zWgrDMa82Cj32QqvbLXMW7OQua0CKO9uXbsAFk2oKBeI?=
 =?iso-8859-1?Q?/tFkOAFCa+U/31b9jkvNDnBeQiKLijYXNOhFdoxkpa17kitwgStyGENFNb?=
 =?iso-8859-1?Q?rL3d7+ahA8RoJjF7qDBMDG8CH0n2h7sAOnMmx9cdwn0JLjYYZBK2izAbnX?=
 =?iso-8859-1?Q?aBBxE6jQYkkpiiuUtKd1rZ0AeIL3eb3cwuiE8kZz4wB3+mt0lePf/89owO?=
 =?iso-8859-1?Q?loMnZ5fnd0CQNOMD5uhmCx611qbOhLqy/zWOVjyMckEhwCmxr4psWdKOyp?=
 =?iso-8859-1?Q?rotCHwQnB7dU5G4q0OcYooyzYaYUMyY9invVwNhIyJCxcHNRFbclacHcjp?=
 =?iso-8859-1?Q?ugW/l/qaOONeo/BuaIRHUC/zgQEL/cLzgh5jfF8juOdrZJRSg/zYJriVla?=
 =?iso-8859-1?Q?pwIJOLUiEbVzKhntd2kCe0yiO+V7Wn4+gBK8BsG53v/ZNP+1RlOzHAkdwp?=
 =?iso-8859-1?Q?fwAFNc0pq6fLg5ug8z9rbs/ePbmZa7ErEe4Xn4AvMB3v1dQJCEvjXNyUTQ?=
 =?iso-8859-1?Q?YtXbE//zySW6uUismWh7I2WvRwzJ0UV933FzdqMd1hOhqwdk5pwUr2ukdy?=
 =?iso-8859-1?Q?bD0tU6EiJHCw0JM3Xe5xatV26rBPMxukhIPa7hIw0GrFusqHq34gwC8/uB?=
 =?iso-8859-1?Q?3ztVLxR7gZLswtULLrpkKHybDKcYpYPpOzHoTYVON8qywverHXbdKAygOf?=
 =?iso-8859-1?Q?0AS5hOsRFdyRZVfLKAmdnVyD/3/zprgJFju4zKkCwFmR1fJ1q+nEc7FK9C?=
 =?iso-8859-1?Q?H6mssOT+fJxRx1X+zaISv8fFZkdkQ7Q2j5ta2JFL+ILL2gT4Y+D3hrr9WD?=
 =?iso-8859-1?Q?wqZug7BB2b9mc5F7O7F/GhyQhOAlGYpb+eUZrm3ucowZIvLCfWT3w3MrzF?=
 =?iso-8859-1?Q?SwT6w1nHvTfuMr23pN8JyZM3vX6A1MNsLyTGcbv4D5MbZtdqJFC5/O4MrV?=
 =?iso-8859-1?Q?4HdrN8uG/yflXlbYfA/m2uIotN/NJGOdpeyRWZtS7X3N72QzsOi3QhZUWc?=
 =?iso-8859-1?Q?qtktWmmhSqGYjZfyr4QQMS+3MoVtijc5HYW+Ag+ospn8Q9/OlDYsZSJkMU?=
 =?iso-8859-1?Q?gduq9+eszBZUOh3iQQ7lGRkOXtaq6Pba1GPcNNPeWAY9oqbrJ6CZH0SqfQ?=
 =?iso-8859-1?Q?GeTkBI632qOJVKCTxmwgzUaneUuNnEeAIBRkcg7A76eMRnubUs0mjGv4/I?=
 =?iso-8859-1?Q?Gg7+2/jr5PNx3BYsl/tIZGqcX0EsslCD+yOuQDt7w0okEPRyw2EjeNyy2I?=
 =?iso-8859-1?Q?eeGor6k3hx1vDSwHgaT2WyquM/lczIcOfRgPxnO+7nvBI1ZNkM5HMPdjo5?=
 =?iso-8859-1?Q?Go9/mKrpIUr+PfjvwEgXOLQw6bN0E45Fv6EEV6mA1eEVQQX6oPZONBnjTU?=
 =?iso-8859-1?Q?6g0PWJJeDeNxmVoQDb/d24kN+3J4y6sE+J7FmKEM2YM7JHxaun+LLWRbPD?=
 =?iso-8859-1?Q?EhDvL9Ln0pIfRF931fM5p5ArPsYksA/tk7c15JLiGCrl6ft5TUlqKZ0eI6?=
 =?iso-8859-1?Q?fTj8X6BqkxtuKFzNl74h5ugP2zdeIXrM/Jz8aiTXCLuB6EuhGuZbSs85rZ?=
 =?iso-8859-1?Q?Ja+2/icMp9ekytnUQpudopcrn2fXnmG7rwFDyvPAKY1/Oq9cNYfFWJAhLj?=
 =?iso-8859-1?Q?YOC0yEVm6N+jy0+yt+c+2xFpdWut+7k8ITeLE3hWxX7MlE1Vdm+yOFqoAx?=
 =?iso-8859-1?Q?2R3AupSiJ8SktXkxVozZ0Z+JQchSGP8/BemINABXH/LmUQs7EymfT+47Vj?=
 =?iso-8859-1?Q?BwoxEqnHxRLxk6d848dXRv7rbXwn5r2N7WUzWvRa4Ey+uIWDuXcRRAUNwY?=
 =?iso-8859-1?Q?2uecVySVLQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: k057ksQXNHVL/quA47Od3b5ArPN/GDmAPXkMHnFh3mU+XRPsLjpkY0bbri1nCoqHFJ+EffZb4EzDmKy3i5YW2Wb7Z7W5cEtM/qoS0FDYAxpaHnzxbzbnB13vGU7AymjSI76dlFoEYaF8y8S8rXvqLggfRlCn3n84x5sykHVNTPfbkVVJxx5trsRRhbzTNeJPqJvlDjdJ5wKFySWXSoZR2pG8jvYuFTM8ArJS7mGhb7Syq1kK9rvOb+kwqy8PcUu0m66GRwy5rVChrbAdTlWvrx/npG51BlNQT3dP+sPKO+/hPLnzme4EzeG+JRh6Q20ITLp7wLjmm1rbG55ONOcp1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: de8cdfec-e6c7-4f66-d853-08ded97a3f1d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2026 03:13:40.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiAaJiUtTSVYGDuN+jtGLYlJXkv63xDz2iNS8mvXpBOdrYobohgQg1Q1oMZ0xC1XeEIw0zqD6d31gB6c3EJS0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-OriginatorOrg: intel.com



Hello,


this report is just FYI.

we reported
"[tip:sched/core] [sched/rt]  dd29c017ae: stress-ng.mutex.ops_per_sec 50.7% regression"
in [1]
(there are two regressions in that report, still log as below "In addition" part
for a full picture)

now the commit is in mainline, and we captured a regression in another stress-ng
tests.

as mentioned in [1], we still build the kernel with
# CONFIG_PREEMPT_RT is not set
(full config which is used to build both dd29c017ae and its parent is in [2])

[1] https://lore.kernel.org/all/202605291602.aff7d092-lkp@intel.com/
[2] https://download.01.org/0day-ci/archive/20260704/202607041048.a96a4796-lkp@intel.com/config-7.1.0-rc2+

so this report is just FYI what's the impact of RT_PUSH_IPI being off in some
stress-ng performance tests.

below is full report.



kernel test robot noticed a 24.2% regression of stress-ng.cyclic.ops_per_sec on:


commit: dd29c017aed628076e915fe4cdfb5392fd4c5cab ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      dc59e4fea9d83f03bad6bddf3fa2e52491777482]
[still regression on linux-next/master 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: cyclic
	method: clock_ns
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.cyclic.ops_per_sec  24.5% regression |
| test parameters  | cpufreq_governor=performance                              |
|                  | method=itimer                                             |
|                  | nr_threads=100%                                           |
|                  | test=cyclic                                               |
|                  | testtime=60s                                              |
+------------------+-----------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.mutex.ops_per_sec  50.7% regression  |
| test parameters  | cpufreq_governor=performance                              |
|                  | nr_threads=100%                                           |
|                  | test=mutex                                                |
|                  | testtime=60s                                              |
+------------------+-----------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607041048.a96a4796-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260704/202607041048.a96a4796-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/method/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/clock_ns/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/cyclic/stress-ng/60s

commit: 
  04f80f8b12 ("sched: Switch rq->next_class on proxy_resched_idle()")
  dd29c017ae ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")

04f80f8b12a02fa2 dd29c017aed628076e915fe4cdf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.372e+08           -24.2%   1.04e+08        stress-ng.cyclic.ops
   2286936           -24.2%    1732899        stress-ng.cyclic.ops_per_sec
      2585 ±  4%     +54.2%       3987 ±  8%  stress-ng.time.involuntary_context_switches
    697.33 ±  3%    +117.7%       1518        stress-ng.time.percent_of_cpu_this_job_got
    394.36 ±  3%    +125.6%     889.75        stress-ng.time.system_time
 1.372e+08           -24.2%   1.04e+08        stress-ng.time.voluntary_context_switches
     46261           -25.5%      34461        uptime.idle
 1.343e+10           -86.0%  1.883e+09 ±  4%  cpuidle..time
 1.477e+08           -71.8%   41674135 ±  3%  cpuidle..usage
     30719 ± 36%    +145.3%      75340 ± 36%  numa-vmstat.node2.nr_anon_pages
    108453 ± 35%     -42.0%      62952 ± 20%  numa-vmstat.node3.nr_mapped
    122675 ± 36%    +145.9%     301672 ± 36%  numa-meminfo.node2.AnonPages
    131722 ± 38%    +171.4%     357438 ± 43%  numa-meminfo.node2.AnonPages.max
    434359 ± 35%     -42.6%     249193 ± 20%  numa-meminfo.node3.Mapped
     80.83 ± 17%    +759.8%     695.00 ± 14%  perf-c2c.DRAM.local
      8058 ± 11%   +1064.8%      93869 ± 12%  perf-c2c.DRAM.remote
      2971 ±  9%   +1479.0%      46915 ± 13%  perf-c2c.HITM.local
      5136 ±  8%    +890.7%      50881 ± 12%  perf-c2c.HITM.remote
      8107 ±  7%   +1106.3%      97796 ± 13%  perf-c2c.HITM.total
   4526115           -24.0%    3441006        perf-stat.i.context-switches
      3127 ± 38%    +371.7%      14754 ±  6%  perf-stat.i.cpu-migrations
      8502 ±  2%     +22.8%      10441 ± 10%  perf-stat.i.minor-faults
      8502 ±  2%     +22.8%      10441 ± 10%  perf-stat.i.page-faults
   4451303           -24.7%    3351634        perf-stat.ps.context-switches
      3078 ± 38%    +370.2%      14473 ±  5%  perf-stat.ps.cpu-migrations
     91.71           -51.7%      44.30 ±  2%  vmstat.cpu.id
      7.83          +591.9%      54.20        vmstat.cpu.sy
  11395001           -36.0%    7298342 ±  6%  vmstat.memory.cache
     20.30 ±  3%     +59.3%      32.34 ±  4%  vmstat.procs.r
   4291056           -23.4%    3286648        vmstat.system.cs
   2516487           -21.5%    1976032        vmstat.system.in
     91.35           -48.9       42.43 ±  2%  mpstat.cpu.all.idle%
      5.31 ±  3%     +24.8       30.13        mpstat.cpu.all.irq%
      0.03 ±  6%      +0.3        0.28 ±  3%  mpstat.cpu.all.soft%
      2.73 ±  4%     +22.9       25.63 ±  2%  mpstat.cpu.all.sys%
      0.58 ±  6%      +1.0        1.53 ±  8%  mpstat.cpu.all.usr%
     18.67 ±  5%    +153.6%      47.33        mpstat.max_utilization.seconds
     10.89 ±  2%    +502.3%      65.58        mpstat.max_utilization_pct
   8312598           -48.5%    4277558 ± 11%  meminfo.Active
   8312568           -48.5%    4277526 ± 11%  meminfo.Active(anon)
  11181713           -36.5%    7104233 ±  6%  meminfo.Cached
  12716039           -31.3%    8736852 ±  5%  meminfo.Committed_AS
    169541            -6.4%     158688        meminfo.KReclaimable
    530414 ± 24%     -30.3%     369767 ± 11%  meminfo.Mapped
  16070115           -24.7%   12104668 ±  4%  meminfo.Memused
    169541            -6.4%     158688        meminfo.SReclaimable
   7090030           -57.5%    3012545 ± 15%  meminfo.Shmem
  16266245           -25.1%   12177822 ±  3%  meminfo.max_used_kB
    474.83 ±  2%    +440.5%       2566        turbostat.Avg_MHz
     16.86 ±  2%     +71.8       88.64        turbostat.Busy%
      2816            +2.8%       2895        turbostat.Bzy_MHz
      0.02 ± 20%      +0.0        0.06        turbostat.C1%
     75.14 ±  3%     -67.3        7.81 ±  3%  turbostat.C1E%
      8.92 ± 25%      -5.2        3.70 ±  6%  turbostat.C6%
     63.27 ±  3%     -96.3%       2.33 ±  3%  turbostat.CPU%c1
      6.10 ± 34%     -47.5%       3.20 ±  8%  turbostat.CPU%c6
     66.50 ±  3%     +18.3%      78.67 ±  9%  turbostat.CoreTmp
      0.25 ±  3%     -72.2%       0.07        turbostat.IPC
 1.608e+08           -22.4%  1.248e+08        turbostat.IRQ
   2245676 ±  2%    +255.6%    7986519        turbostat.NMI
      0.64 ± 18%     -74.9%       0.16 ±100%  turbostat.Pkg%pc2
    413.16           +37.5%     568.12        turbostat.PkgWatt
     18.52            +9.7%      20.31        turbostat.RAMWatt
   2078444           -48.5%    1069909 ± 11%  proc-vmstat.nr_active_anon
    306705            +3.7%     317907        proc-vmstat.nr_anon_pages
   6152060            +1.6%    6251054        proc-vmstat.nr_dirty_background_threshold
  12319162            +1.6%   12517392        proc-vmstat.nr_dirty_threshold
   2795725           -36.5%    1776231 ±  6%  proc-vmstat.nr_file_pages
  61841843            +1.6%   62833235        proc-vmstat.nr_free_pages
  61675605            +1.6%   62685661        proc-vmstat.nr_free_pages_blocks
    132684 ± 24%     -30.3%      92543 ± 11%  proc-vmstat.nr_mapped
   1772803           -57.5%     753310 ± 15%  proc-vmstat.nr_shmem
     42384            -6.4%      39669        proc-vmstat.nr_slab_reclaimable
   2078444           -48.5%    1069909 ± 11%  proc-vmstat.nr_zone_active_anon
   3548266           -37.4%    2220607 ±  8%  proc-vmstat.numa_hit
   3151131           -42.1%    1823231 ± 10%  proc-vmstat.numa_local
     83582 ± 41%    +150.1%     209055 ± 43%  proc-vmstat.numa_pte_updates
   3761618           -34.7%    2454466 ±  8%  proc-vmstat.pgalloc_normal
    866584 ±  2%     -11.3%     768970 ±  6%  proc-vmstat.pgfree
    176.58 ± 11%     +64.1%     289.86 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.03 ± 18%     +41.6%       0.04 ± 11%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.17 ±  8%     +22.4%       0.20 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.03 ± 18%     +41.6%       0.04 ± 11%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.17 ±  8%     +22.4%       0.20 ±  4%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      1.30 ±105%   +3981.4%      53.10 ± 47%  sched_debug.cfs_rq:/.left_deadline.avg
    333.03 ±105%    +991.6%       3635 ± 53%  sched_debug.cfs_rq:/.left_deadline.max
     20.77 ±105%   +1650.1%     363.57 ± 50%  sched_debug.cfs_rq:/.left_deadline.stddev
      1.12 ±107%   +4648.0%      52.95 ± 47%  sched_debug.cfs_rq:/.left_vruntime.avg
    285.51 ±107%   +1167.9%       3619 ± 53%  sched_debug.cfs_rq:/.left_vruntime.max
     17.81 ±107%   +1934.7%     362.37 ± 50%  sched_debug.cfs_rq:/.left_vruntime.stddev
      7743 ± 30%     +97.9%      15326 ± 33%  sched_debug.cfs_rq:/.load.avg
      0.03 ± 18%     +41.6%       0.04 ± 11%  sched_debug.cfs_rq:/.nr_queued.avg
      0.17 ±  8%     +22.4%       0.20 ±  4%  sched_debug.cfs_rq:/.nr_queued.stddev
      1.12 ±107%   +4648.0%      52.95 ± 47%  sched_debug.cfs_rq:/.right_vruntime.avg
    285.51 ±107%   +1167.9%       3619 ± 53%  sched_debug.cfs_rq:/.right_vruntime.max
     17.81 ±107%   +1934.7%     362.37 ± 50%  sched_debug.cfs_rq:/.right_vruntime.stddev
    156.12 ±  6%     +23.2%     192.41 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
     15.09 ±100%  +50129.8%       7581 ± 43%  sched_debug.cfs_rq:/.sum_weight.avg
      3863 ±100%  +12531.6%     488065 ± 28%  sched_debug.cfs_rq:/.sum_weight.max
    241.02 ±100%  +20483.6%      49609 ± 30%  sched_debug.cfs_rq:/.sum_weight.stddev
    153.92 ±  7%     +16.7%     179.69 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
     10.15 ± 13%    +102.7%      20.56 ±  6%  sched_debug.cfs_rq:/.util_est.avg
     88.08 ± 10%     +36.6%     120.31 ±  4%  sched_debug.cfs_rq:/.util_est.stddev
    176.58 ± 11%     +64.1%     289.86 ± 14%  sched_debug.cfs_rq:/.zero_vruntime.min
     19929 ± 18%    +258.1%      71375 ± 55%  sched_debug.cpu.avg_idle.min
     14.87 ±  8%    +205.6%      45.44 ± 22%  sched_debug.cpu.clock.stddev
    586.36 ± 20%    +651.5%       4406 ±  3%  sched_debug.cpu.curr->pid.avg
      2224 ±  9%     +36.8%       3043 ±  3%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 14%    +163.6%       0.00 ± 20%  sched_debug.cpu.next_balance.stddev
      0.06 ± 20%     +43.5%       0.09 ± 18%  sched_debug.cpu.nr_running.avg
    528283           -24.2%     400558        sched_debug.cpu.nr_switches.avg
    624733 ±  4%     -30.8%     432289        sched_debug.cpu.nr_switches.max
    108387 ±106%    +235.3%     363420 ±  2%  sched_debug.cpu.nr_switches.min
    100258 ± 45%     -82.6%      17437 ± 36%  sched_debug.cpu.nr_switches.stddev
      0.03 ± 24%    +105.4%       0.06 ± 20%  sched_debug.rt_rq:.rt_nr_running.avg
      0.12 ± 11%     +41.5%       0.17 ± 11%  sched_debug.rt_rq:.rt_nr_running.stddev


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/method/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/itimer/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/cyclic/stress-ng/60s

commit: 
  04f80f8b12 ("sched: Switch rq->next_class on proxy_resched_idle()")
  dd29c017ae ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")

04f80f8b12a02fa2 dd29c017aed628076e915fe4cdf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.326e+08           -24.5%  1.001e+08 ±  3%  stress-ng.cyclic.ops
   2209225           -24.5%    1667869 ±  3%  stress-ng.cyclic.ops_per_sec
      2723 ±  3%     +57.8%       4297 ±  8%  stress-ng.time.involuntary_context_switches
      1383 ±  2%     +51.1%       2090        stress-ng.time.percent_of_cpu_this_job_got
    746.65 ±  3%     +56.6%       1169        stress-ng.time.system_time
 1.326e+08           -24.5%  1.001e+08 ±  3%  stress-ng.time.voluntary_context_switches
    185499 ± 18%     -29.7%     130318 ±  9%  numa-meminfo.node0.SUnreclaim
     46376 ± 18%     -29.7%      32579 ±  9%  numa-vmstat.node0.nr_slab_unreclaimable
    119846            -9.7%     108272        uptime.idle
 1.299e+10 ±  2%     -86.7%   1.73e+09 ± 10%  cpuidle..time
 1.434e+08           -72.9%   38905147 ± 15%  cpuidle..usage
    185.17 ± 19%    +503.1%       1116 ± 15%  perf-c2c.DRAM.local
     15049 ±  9%    +787.8%     133612 ±  8%  perf-c2c.DRAM.remote
      7338 ± 10%    +819.8%      67498 ±  8%  perf-c2c.HITM.local
      9511 ± 11%    +634.1%      69819 ±  7%  perf-c2c.HITM.remote
     16849 ±  9%    +715.0%     137318 ±  7%  perf-c2c.HITM.total
     88.18           -51.7       36.43 ±  9%  mpstat.cpu.all.idle%
      5.68 ±  6%     +21.3       27.02 ±  2%  mpstat.cpu.all.irq%
      0.27 ±  2%      +0.3        0.61 ± 10%  mpstat.cpu.all.soft%
      4.93 ±  3%     +28.0       32.96 ±  7%  mpstat.cpu.all.sys%
      0.95 ±  2%      +2.0        2.98 ±  4%  mpstat.cpu.all.usr%
     13.75 ±  3%    +422.8%      71.88 ±  5%  mpstat.max_utilization_pct
   4349738           -24.1%    3301294 ±  3%  perf-stat.i.context-switches
      5133 ± 24%    +174.8%      14108 ±  4%  perf-stat.i.cpu-migrations
      8760 ±  5%     +16.1%      10171 ± 16%  perf-stat.i.minor-faults
      8760 ±  5%     +16.1%      10171 ± 16%  perf-stat.i.page-faults
   4278510           -24.5%    3230305 ±  3%  perf-stat.ps.context-switches
      5048 ± 24%    +175.7%      13919 ±  4%  perf-stat.ps.cpu-migrations
     88.48           -56.6%      38.41 ±  7%  vmstat.cpu.id
     10.61 ±  4%    +452.9%      58.67 ±  5%  vmstat.cpu.sy
  11022070           -38.2%    6806541 ±  7%  vmstat.memory.cache
     28.03 ±  6%     +26.8%      35.53 ±  4%  vmstat.procs.r
   4125078           -23.1%    3172394 ±  3%  vmstat.system.cs
   2451475           -20.5%    1948155 ±  3%  vmstat.system.in
   7840060 ±  2%     -52.5%    3722855 ± 15%  meminfo.Active
   7840030 ±  2%     -52.5%    3722823 ± 15%  meminfo.Active(anon)
  10777487           -38.6%    6620517 ±  7%  meminfo.Cached
  12341767           -33.1%    8256625 ±  6%  meminfo.Committed_AS
    164951            -6.7%     153849        meminfo.KReclaimable
    486167 ± 13%     -31.8%     331454 ± 18%  meminfo.Mapped
  15528823           -26.0%   11494524 ±  5%  meminfo.Memused
    164951            -6.7%     153849        meminfo.SReclaimable
   6686934           -62.2%    2529965 ± 19%  meminfo.Shmem
  15719893           -26.4%   11571834 ±  5%  meminfo.max_used_kB
   1960224 ±  2%     -52.4%     932360 ± 15%  proc-vmstat.nr_active_anon
   6165572            +1.6%    6266159        proc-vmstat.nr_dirty_background_threshold
  12346220            +1.6%   12547641        proc-vmstat.nr_dirty_threshold
   2694591           -38.5%    1656705 ±  7%  proc-vmstat.nr_file_pages
  61977276            +1.6%   62984623        proc-vmstat.nr_free_pages
  61815520            +1.6%   62825650        proc-vmstat.nr_free_pages_blocks
    121600 ± 13%     -31.5%      83270 ± 18%  proc-vmstat.nr_mapped
   1671954           -62.1%     634068 ± 19%  proc-vmstat.nr_shmem
     41239            -6.7%      38470        proc-vmstat.nr_slab_reclaimable
    117718            -3.3%     113792        proc-vmstat.nr_slab_unreclaimable
   1960224 ±  2%     -52.4%     932360 ± 15%  proc-vmstat.nr_zone_active_anon
   3537898 ±  3%     -42.0%    2050618 ±  9%  proc-vmstat.numa_hit
   3137152 ±  4%     -47.3%    1653712 ± 11%  proc-vmstat.numa_local
   3898926           -41.2%    2293957 ±  9%  proc-vmstat.pgalloc_normal
   1141747 ±  5%     -32.1%     775361 ± 10%  proc-vmstat.pgfree
     36360 ±  2%     -10.0%      32721        proc-vmstat.pgreuse
    563.67 ±  4%    +360.0%       2593        turbostat.Avg_MHz
     19.98 ±  4%     +69.6       89.54        turbostat.Busy%
      2821            +2.6%       2895        turbostat.Bzy_MHz
      0.03 ± 17%      +0.0        0.06 ± 13%  turbostat.C1%
     71.82 ±  2%     -64.5        7.32 ± 15%  turbostat.C1E%
      9.14 ± 22%      -5.9        3.28 ±  5%  turbostat.C6%
     59.26           -96.4%       2.12 ± 20%  turbostat.CPU%c1
      5.02 ± 33%     -42.4%       2.89 ±  6%  turbostat.CPU%c6
     55.33 ±  5%     +23.8%      68.50 ±  7%  turbostat.CoreTmp
      0.30 ±  4%     -70.2%       0.09        turbostat.IPC
 1.574e+08           -22.1%  1.226e+08 ±  3%  turbostat.IRQ
   2707717 ±  2%    +211.2%    8426390 ±  3%  turbostat.NMI
      0.77 ± 85%     -86.8%       0.10 ±158%  turbostat.Pkg%pc2
     61.00 ±  3%     +16.9%      71.33 ±  4%  turbostat.PkgTmp
    426.05           +34.8%     574.16        turbostat.PkgWatt
     19.05            +7.9%      20.54        turbostat.RAMWatt
      2887 ±  5%     +18.0%       3405 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.avg
    124.94 ± 57%    +145.2%     306.40 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.min
      3.86 ±223%    +793.7%      34.51 ± 50%  sched_debug.cfs_rq:/.left_deadline.avg
      3.86 ±223%    +789.0%      34.31 ± 50%  sched_debug.cfs_rq:/.left_vruntime.avg
      3.86 ±223%    +789.0%      34.31 ± 50%  sched_debug.cfs_rq:/.right_vruntime.avg
    148.15 ±  2%     +20.8%     178.99 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
 -45447168         -7551.4%  3.386e+09 ± 57%  sched_debug.cfs_rq:/.sum_w_vruntime.avg
 7.257e+08 ±223%   +4278.1%  3.177e+10 ± 61%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
    146.20 ±  2%     +15.0%     168.13 ±  6%  sched_debug.cfs_rq:/.util_avg.stddev
      7.89 ±  6%     +92.5%      15.20 ± 21%  sched_debug.cfs_rq:/.util_est.avg
     72.73 ±  4%     +42.4%     103.58 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
      2887 ±  5%     +18.0%       3405 ±  6%  sched_debug.cfs_rq:/.zero_vruntime.avg
    124.94 ± 57%    +145.2%     306.40 ±  9%  sched_debug.cfs_rq:/.zero_vruntime.min
     22127 ±  2%    +146.7%      54579 ±  2%  sched_debug.cpu.avg_idle.min
    193969 ±  9%     -28.7%     138382 ±  7%  sched_debug.cpu.avg_idle.stddev
     15.74 ±  3%    +217.6%      49.99 ± 19%  sched_debug.cpu.clock.stddev
    780.35 ± 12%    +497.0%       4658 ±  2%  sched_debug.cpu.curr->pid.avg
      2511 ±  5%     +17.1%       2941 ±  3%  sched_debug.cpu.curr->pid.stddev
      0.00 ±  4%    +199.9%       0.00 ± 18%  sched_debug.cpu.next_balance.stddev
      1.00           +50.0%       1.50        sched_debug.cpu.nr_running.max
    510666           -24.4%     385912 ±  3%  sched_debug.cpu.nr_switches.avg
    608446 ±  3%     -30.8%     421159 ±  2%  sched_debug.cpu.nr_switches.max
     68790 ±131%    +405.2%     347530 ±  6%  sched_debug.cpu.nr_switches.min
     94965 ± 20%     -81.2%      17852 ± 49%  sched_debug.cpu.nr_switches.stddev
      3.73 ±  6%     +43.9%       5.36 ± 28%  sched_debug.cpu.nr_uninterruptible.stddev



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mutex/stress-ng/60s

commit: 
  04f80f8b12 ("sched: Switch rq->next_class on proxy_resched_idle()")
  dd29c017ae ("sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT")

04f80f8b12a02fa2 dd29c017aed628076e915fe4cdf 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    122431 ±  2%     +75.5%     214822 ±  2%  stress-ng.mutex.nanosecs_per_mutex
  83537984 ±  2%     -50.7%   41168990 ±  3%  stress-ng.mutex.ops
   1392295 ±  2%     -50.7%     686172 ±  3%  stress-ng.mutex.ops_per_sec
  61961307           -80.4%   12130280 ± 11%  stress-ng.time.involuntary_context_switches
     17589            +6.7%      18771        stress-ng.time.percent_of_cpu_this_job_got
     10505            +8.7%      11422        stress-ng.time.system_time
     94.11 ±  2%     -52.6%      44.61 ±  4%  stress-ng.time.user_time
  31792837           -82.8%    5467214 ± 13%  stress-ng.time.voluntary_context_switches
 7.297e+08 ±  3%     -20.0%  5.836e+08 ±  6%  cpuidle..time
   7504726 ±  2%     -97.7%     169892 ±  2%  cpuidle..usage
      5.47            +2.8        8.24 ±  4%  mpstat.cpu.all.idle%
      3.76 ±  2%      -3.4        0.38 ±  5%  mpstat.cpu.all.irq%
      0.06 ±  3%      -0.1        0.00 ± 33%  mpstat.cpu.all.soft%
      1.14 ±  3%      -0.7        0.42 ±  4%  mpstat.cpu.all.usr%
   1663498 ± 32%     -84.8%     252442 ± 12%  numa-numastat.node0.local_node
   1765403 ± 32%     -82.2%     314101 ±  2%  numa-numastat.node0.numa_hit
   1495124 ± 38%     -84.7%     228979 ± 13%  numa-numastat.node1.local_node
   1589196 ± 37%     -76.9%     367155 ±  3%  numa-numastat.node1.numa_hit
  11584135           -63.1%    4268754        vmstat.memory.cache
    239.87           +31.5%     315.47        vmstat.procs.r
   1612425           -71.2%     464479 ± 13%  vmstat.system.cs
   1346465           -35.8%     864394 ±  5%  vmstat.system.in
    455.50 ± 25%     -91.4%      39.33 ± 22%  perf-c2c.DRAM.local
     11832 ± 24%     -96.5%     413.00 ± 11%  perf-c2c.DRAM.remote
     34487 ± 28%     -98.7%     459.67 ± 10%  perf-c2c.HITM.local
      9397 ± 24%     -96.2%     354.33 ± 11%  perf-c2c.HITM.remote
     43884 ± 27%     -98.1%     814.00 ±  9%  perf-c2c.HITM.total
      6.01 ±  3%      -2.1        3.93 ± 45%  turbostat.C1%
      5.49 ±  3%     -28.5%       3.92 ± 45%  turbostat.CPU%c1
  85685316           -68.1%   27369485 ± 44%  turbostat.IRQ
   8044027           -22.4%    6238674 ± 45%  turbostat.NMI
     17.67           -17.8%      14.53 ± 44%  turbostat.RAMWatt
    192382          +525.9%    1204140 ± 36%  perf-stat.i.cpu-clock
      0.23 ±142%   +1094.0%       2.70 ± 70%  perf-stat.i.major-faults
      7047 ± 17%    +282.2%      26931 ± 20%  perf-stat.i.minor-faults
      7047 ± 17%    +282.2%      26934 ± 20%  perf-stat.i.page-faults
    192382          +525.9%    1204176 ± 36%  perf-stat.i.task-clock
   1659840           -86.8%     219060 ± 24%  perf-stat.ps.context-switches
    440129 ±  2%     -90.3%      42896 ± 27%  perf-stat.ps.cpu-migrations
      6827 ± 17%     -69.1%       2109 ± 35%  perf-stat.ps.minor-faults
      6827 ± 17%     -69.1%       2109 ± 35%  perf-stat.ps.page-faults
   8414745           -87.1%    1084149        meminfo.Active
   8414714           -87.1%    1084117        meminfo.Active(anon)
    756769            -7.6%     699135        meminfo.AnonHugePages
   1141093            -7.8%    1052032        meminfo.AnonPages
  11370849           -63.7%    4126678        meminfo.Cached
  12667118           -61.8%    4845108        meminfo.Committed_AS
    156321           -12.5%     136739        meminfo.KReclaimable
    469540 ±  6%     -77.1%     107321 ±  4%  meminfo.Mapped
  15939063           -46.8%    8473455        meminfo.Memused
    156321           -12.5%     136739        meminfo.SReclaimable
   7280155           -99.5%      36009 ± 19%  meminfo.Shmem
  16088016           -46.3%    8645299        meminfo.max_used_kB
   4142244 ± 35%     -89.8%     423565 ± 52%  numa-meminfo.node0.Active
   4142225 ± 35%     -89.8%     423547 ± 52%  numa-meminfo.node0.Active(anon)
    266266 ± 38%     -67.0%      87783 ±  4%  numa-meminfo.node0.Mapped
   3897747 ± 37%     -99.8%       9633 ± 47%  numa-meminfo.node0.Shmem
   4282655 ± 35%     -84.7%     653838 ± 32%  numa-meminfo.node1.Active
   4282642 ± 35%     -84.7%     653824 ± 32%  numa-meminfo.node1.Active(anon)
    891410 ±  7%     -29.6%     627760 ± 35%  numa-meminfo.node1.AnonPages
    927124 ±  8%     -28.1%     666546 ± 33%  numa-meminfo.node1.AnonPages.max
   5283722 ± 53%     -98.5%      80849 ±135%  numa-meminfo.node1.FilePages
     82055 ± 29%     -47.2%      43290 ± 35%  numa-meminfo.node1.KReclaimable
    205816 ± 56%     -89.9%      20793 ± 34%  numa-meminfo.node1.Mapped
   7685906 ± 38%     -72.0%    2153232 ± 17%  numa-meminfo.node1.MemUsed
     82055 ± 29%     -47.2%      43290 ± 35%  numa-meminfo.node1.SReclaimable
   3392847 ± 45%     -99.2%      26506 ± 30%  numa-meminfo.node1.Shmem
   1035914 ± 35%     -89.8%     105497 ± 51%  numa-vmstat.node0.nr_active_anon
     66703 ± 38%     -67.2%      21869 ±  4%  numa-vmstat.node0.nr_mapped
    974835 ± 37%     -99.8%       2388 ± 46%  numa-vmstat.node0.nr_shmem
   1035910 ± 35%     -89.8%     105496 ± 51%  numa-vmstat.node0.nr_zone_active_anon
   1765534 ± 32%     -82.2%     314433 ±  3%  numa-vmstat.node0.numa_hit
   1663629 ± 32%     -84.8%     252773 ± 12%  numa-vmstat.node0.numa_local
   1071000 ± 35%     -84.7%     163351 ± 33%  numa-vmstat.node1.nr_active_anon
    222784 ±  7%     -29.8%     156346 ± 36%  numa-vmstat.node1.nr_anon_pages
   1321330 ± 53%     -98.4%      20714 ±134%  numa-vmstat.node1.nr_file_pages
     51564 ± 56%     -89.1%       5634 ± 45%  numa-vmstat.node1.nr_mapped
    848611 ± 45%     -99.2%       7129 ± 38%  numa-vmstat.node1.nr_shmem
     20515 ± 29%     -47.2%      10831 ± 35%  numa-vmstat.node1.nr_slab_reclaimable
   1070997 ± 35%     -84.7%     163350 ± 33%  numa-vmstat.node1.nr_zone_active_anon
   1589301 ± 37%     -76.9%     367554 ±  3%  numa-vmstat.node1.numa_hit
   1495229 ± 38%     -84.7%     229379 ± 13%  numa-vmstat.node1.numa_local
   2104201           -87.2%     270347        proc-vmstat.nr_active_anon
    285274            -8.0%     262490        proc-vmstat.nr_anon_pages
   6055069            +3.1%    6241788        proc-vmstat.nr_dirty_background_threshold
  12124944            +3.1%   12498839        proc-vmstat.nr_dirty_threshold
   2843227           -63.7%    1031516        proc-vmstat.nr_file_pages
  60921938            +3.1%   62791869        proc-vmstat.nr_free_pages
  60844285            +3.0%   62661195        proc-vmstat.nr_free_pages_blocks
     42156            -3.1%      40855        proc-vmstat.nr_kernel_stack
    117492 ±  6%     -77.2%      26844 ±  5%  proc-vmstat.nr_mapped
   1820554           -99.5%       8848 ± 21%  proc-vmstat.nr_shmem
     39080           -12.6%      34150        proc-vmstat.nr_slab_reclaimable
   2104201           -87.2%     270347        proc-vmstat.nr_zone_active_anon
    160577 ± 48%     -98.9%       1782 ± 53%  proc-vmstat.numa_hint_faults
    136651 ± 57%     -98.9%       1458 ± 59%  proc-vmstat.numa_hint_faults_local
   3357291           -79.6%     684548        proc-vmstat.numa_hit
   3161259           -84.7%     484712        proc-vmstat.numa_local
     16807 ± 47%     -98.1%     324.17 ± 63%  proc-vmstat.numa_pages_migrated
    173687 ± 47%     -97.3%       4674        proc-vmstat.numa_pte_updates
   3507405           -76.5%     824225        proc-vmstat.pgalloc_normal
    577848 ± 15%     -47.6%     302746 ±  2%  proc-vmstat.pgfault
    510633 ±  4%     -14.7%     435432 ±  6%  proc-vmstat.pgfree
     16807 ± 47%     -98.1%     324.17 ± 63%  proc-vmstat.pgmigrate_success
     33009 ± 22%     -57.0%      14180 ±  2%  proc-vmstat.pgreuse
      0.18 ±  9%     +27.7%       0.24 ± 12%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.18 ±  9%     +27.7%       0.24 ± 12%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      8069 ± 57%    +241.5%      27554 ± 39%  sched_debug.cfs_rq:/.load.avg
    541768          +112.9%    1153311 ± 16%  sched_debug.cfs_rq:/.load.max
     56659 ± 28%    +147.8%     140379 ± 20%  sched_debug.cfs_rq:/.load.stddev
      1.00           +58.3%       1.58 ± 11%  sched_debug.cfs_rq:/.nr_queued.max
      0.18 ±  9%     +32.0%       0.24 ± 13%  sched_debug.cfs_rq:/.nr_queued.stddev
    512.00         +2893.2%      15325 ±136%  sched_debug.cfs_rq:/.removed.load_avg.max
    263.17 ±  2%     +40.0%     368.42 ± 29%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    263.17 ±  2%     +38.8%     365.25 ± 29%  sched_debug.cfs_rq:/.removed.util_avg.max
     89.41 ±  9%     +94.7%     174.11 ± 11%  sched_debug.cfs_rq:/.runnable_avg.avg
    899.00 ± 14%     +47.7%       1328 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
    171.19 ± 11%     +66.7%     285.38 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    727143           +25.7%     914236        sched_debug.cpu.avg_idle.avg
     32319 ± 42%    +289.9%     126004 ± 50%  sched_debug.cpu.avg_idle.min
    243831 ±  6%     -35.3%     157840 ± 10%  sched_debug.cpu.avg_idle.stddev
    629.39           -21.0%     497.13 ±  6%  sched_debug.cpu.clock_task.stddev
      4472           -90.9%     407.17 ± 54%  sched_debug.cpu.curr->pid.avg
      9062            -6.3%       8493        sched_debug.cpu.curr->pid.max
      0.68 ±  4%     -90.9%       0.06 ± 53%  sched_debug.cpu.nr_running.avg
      2.33 ± 10%     -32.1%       1.58 ± 21%  sched_debug.cpu.nr_running.max
      0.55 ±  3%     -53.5%       0.25 ± 26%  sched_debug.cpu.nr_running.stddev
    264436           -81.9%      47857 ± 11%  sched_debug.cpu.nr_switches.avg
    351496 ±  4%     -73.8%      92003 ±  8%  sched_debug.cpu.nr_switches.max
    204437 ±  8%     -87.4%      25742 ± 16%  sched_debug.cpu.nr_switches.min
     40064 ± 26%     -67.5%      13025 ±  4%  sched_debug.cpu.nr_switches.stddev
      0.01 ± 46%    +656.2%       0.05 ± 21%  sched_debug.dl_rq:.dl_nr_running.avg
      0.06 ± 26%    +169.6%       0.15 ±  9%  sched_debug.dl_rq:.dl_nr_running.stddev
      0.67 ±  4%     -98.3%       0.01 ±141%  sched_debug.rt_rq:.rt_nr_running.avg
      1.92 ±  9%     -82.6%       0.33 ±141%  sched_debug.rt_rq:.rt_nr_running.max
      0.43           -89.4%       0.05 ±141%  sched_debug.rt_rq:.rt_nr_running.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

