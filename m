Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE629D05
	for <oe-lkp@lists.linux.dev>; Mon, 30 Jun 2025 02:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251750; cv=fail; b=ourIUvuyJ6tKvZ7WCbH7M7IjcNUYanMu5S0jbVBtQvti+kpYikstX6wSRXhUuzIHP2fHhzrdlXT3zIxn8DbNM/cLcOg0eCi/e4Jm2m9kFghBhXCBSjf9X2HXUGNOY93J9mCgB1/F55vC7LhQs/NFV8PaKbO5yihXZkLwQDzYPYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251750; c=relaxed/simple;
	bh=oIQuNAr5YsFStQSacPy/jkBxPm1Ti2S7sdYuFuW5rTc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VPrpX1n/gnT3FGyo512ezxDe5a+Vab7LYpJt7Jt40wo7Ae7HrmDxo7QEjBHcg1TeyFOzYOtzEBYI7syTIgqz9upff4pFxFMIGNOkSo+58KXiKbf3Q+vtIKoUaTEm3mK0THnynofNdJK6/Xfpoc7v5o3tH53RWMPjFB1darRB3Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHq6VDPD; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHq6VDPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751251748; x=1782787748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIQuNAr5YsFStQSacPy/jkBxPm1Ti2S7sdYuFuW5rTc=;
  b=IHq6VDPDytLS9AiJWK4FhxazfUBhe2I8peBqR0zTHlMt1BDd4IU0xCc3
   3LwsrD2pqZSpXdbALnWT1UetLyfPIAdYEfAH+YXWCXlza8WMWozAAX2KM
   BrgI7fnMkwAp4/P8B/e2vt3tjAl2g3cWstZbWzuebzHsGVMyBNGf9ixhm
   Xyk7O8QgI/ulfFyYmWJ4VVFuzuGuHNcjTg1MTR1fBn29I0s/q82F7T2yt
   40NDjc7IMy/TTWvAl60JnpTLCV4aFUztvkzTbs24Q8U/99KFKPs2hMrUS
   NcwqGwcAGCzKpKuvZ5m7GV6bO9Jy0g72cGLwuX8HS1odAOOftKOHG9i29
   g==;
X-CSE-ConnectionGUID: Kb9OepVDSLKpDaAKSM/z6A==
X-CSE-MsgGUID: 1n4gj4gGSZ6EURcivv5nvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57272091"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57272091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 19:49:05 -0700
X-CSE-ConnectionGUID: sODA+04ATKuiRsL58lSWtw==
X-CSE-MsgGUID: bEq4KP5hTE2s9/08bZILkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153808739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 19:49:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 19:48:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 19:48:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 19:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiV7HVBkbMLXk4OHfvfLSkNaWZS9pl2u0Lh5kYRUlIcdmb9TNwkMObo0dDpVUx3psvYM1ea8Sl9a2ZbDFgcbn7F0OQA83PZQLKS0kAGQ43ox+V5fvhy/nQ1WEoJLT2XEkg1z2kimxSQj8nr1RmeHxHkwme+RRaAq+0OELqp7tcJjrbWJfO1o56UlSKLkGKopfHPPpet/n2R7+Vq+0bZeTSoc69OEcgpbuFZ/bje8DeaVuC/ZG9uR75pIbgAV9eonEeMqgqpSDDSZfSGdsI6NpC5sbxRmfN25PQmhLiefc6aIcvT2CEmpF17ELqYYIKcGDkoKkDm7HasyF6jQUj9JcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXJXARpa4Y8B7K6CB5LA+m0MCLgPNBwoyvXLWafqw6I=;
 b=njQkTqnCS9KV3JuK8zhwXf8T96LjZAHeAmk4UQA29c2zG2tHyCOKVYvIiUGx7sw1OMfynbLAW8ckyBhNHXoBt48rxzXEheYokpNIgA5HHI0a9xWT1xnH7DDFXV/VHiFjT2NgcolSuPn7Tk04Oe51YHu/tGWws4xxxrKuWKyRACi0KI6v1MpKsMDTmzPaluNmnGMRRBQPMdFMAU+61N7JErCJAk5z1032RfbTT2LX/q/qmpkI3CQdOKivAwLw8Wn/cwQsEhPs1ochreM5fIGJ+B7YWqGlzrg5b8C4Sdhgy6ZVE3hAEjiNUi3zU0/vZ8oUo/aYlnYZbzfnEeMXwGk0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 30 Jun
 2025 02:48:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 02:48:56 +0000
Date: Mon, 30 Jun 2025 10:48:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:kthread/core] [mm]  e6ec2411d3:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202506300421.acdd1f02-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb64786-302a-415b-2b7b-08ddb780a819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6aj+QVOg6HMtf0wndlWXdO2N7pKH8AYGylBCWQeTbxeGU2+jywnDf+PCV0v?=
 =?us-ascii?Q?MuWVY05qgawhi5OZ2rT5zs++SSFuCsGe3Eesl4EKhuSHvctwQF0MJm+8aRty?=
 =?us-ascii?Q?MgtMIBnuJWnV5MDJkd+ysOqwgAus67POgtlYKp3L+6NqyzGJVBA18+kzVvGN?=
 =?us-ascii?Q?m9LEix8YtIxoFUmdQ81djRP33RjfMY0+9pexx8uhMGasX0N4M1UWQ1RTVSlN?=
 =?us-ascii?Q?r1EsCg8dYhjbD+GiQNBbV5bDEBYLKgRZ7KqDM7djWB60HfQe19VfS7kCzttu?=
 =?us-ascii?Q?ALqQFyUWtwAKXXqYAaZE7akmtsmP3UMQE4zVrwN67lxdurZlAbVFdE0U1Uzj?=
 =?us-ascii?Q?Xc/yOUanaCQKLoVKG981wljJ3oLfY3ppNAKFr/GRZvv10pks1eIwClsxTT5U?=
 =?us-ascii?Q?xM8qwOJygxK7JJqrMSeJDS8+8vciUX/aPwWZdzTaZ8iuwCKcHIDTacy/ALtR?=
 =?us-ascii?Q?JlNj3FQa6y7/kNztnHDwhxVgqSUUNcqzUFR7B0w7lY7QppJ6C59cDY5imwtW?=
 =?us-ascii?Q?Z8rQLhzX1jzjUrsjuhdE6tWdh/pb1HWisHLUpyjDAP06NjPjoi5Vn8R8d2NR?=
 =?us-ascii?Q?1ZV/nhlwllXzjvq+hNq+fHYkhgXG6v7K9AdXsc9GJSygleHbeqHDhFFhPbMg?=
 =?us-ascii?Q?c/tkhFHUFEMskS8Bh71A2VEWGpKO00mVTyeYZOagxTDq7t/uRurkapPgZxdT?=
 =?us-ascii?Q?AV9xd6hQen/eyg6kRYZqe9qu1awzMgqVVRZqiUZy440348RBgVg+ki8/zyej?=
 =?us-ascii?Q?EFA4dVoaKXsH/rrkRTsg3lmd07wHj665p5WcyQs+wJBxb+74T1YNjcF7ebzJ?=
 =?us-ascii?Q?Jluu7vG/CNAcVgDJvD+p0amCUavw5aJbpScdmhp1ckLI/2pml9+3jAFXILmi?=
 =?us-ascii?Q?px99NgSelhntdkxRO5C3GjOD+WEcL6gQK0cCr2H+P8wfy95Vbmd3FE+IJpsd?=
 =?us-ascii?Q?NIhWaY4jT/LCU1jgGf9kQuxI36pjauTujcV5+1MGiVeXi+GEuM1igGSpAYth?=
 =?us-ascii?Q?/il1dAn7qO/PtAIWcJLZkeQMHtIZQliOyWEfNqys20IevKTkMi9v4cdWrUUi?=
 =?us-ascii?Q?rczDf7yywA8W/rGLTwqCi1dyjUVJNuSpdf0RblM63vmP/LngmPW/5k8f22sa?=
 =?us-ascii?Q?mBZmrcumYEKZkMC9ufX0RT+Qsj5zVHzIFo403xMURPbtPcKL0xPz5LKfoYId?=
 =?us-ascii?Q?IePBdGz2RffabmQnd0V/QHAAoIAb3aFLilelB0oSJghPiP3tLA9pV5xav1uC?=
 =?us-ascii?Q?c8fKv0nAHJSSab/JZ/sNvZSQw8DLfJvXKeQCtS1LSxwIQnkQpz/6yFDcyLFR?=
 =?us-ascii?Q?qZmYKH4pQD5g6QlhFx5J9mDSrFd30IGCbPJ+zfxKEOb3/vabOK6ixRfMnHKy?=
 =?us-ascii?Q?2cC1WVmmo69R8XHOS3JK4T9/BDO8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDghq5vvKPxrcY3VdVfRZwl0GvMaymE6ooM2dqwpUxU0XSV6cf+VebEbMRNU?=
 =?us-ascii?Q?r3WyyQw8qPCymrhhP1AHQ4O4PoOgNH8irY3WqIOvMc8ef3mDFusShTiHzX01?=
 =?us-ascii?Q?wqucwIBBDebwS4e4rCtF7JlZOnTzlgsroq6O/6ccEwp4apDu0ZQGkYgDztjW?=
 =?us-ascii?Q?GYAyblgh55I3pErzOcSJgagbWufOGD0K8MEp9b5C6+7omE+vJnV8gffdm8D0?=
 =?us-ascii?Q?ScYjPbdDZ6S51yPoPFog3GkTdEUAUvUXhYTIXFxw/OTUp/VsLyPVP/uzjqj7?=
 =?us-ascii?Q?8NJmV0vUwN6+FMriuKPach8s/amQjgTUBPxfgIjV+8cYM0qVvcz0R29de4mO?=
 =?us-ascii?Q?xCfFYr2SHvZ0/E1wXBavx0GLCJ3/6TuU8LrE0ozWZQerLVlMbreWevkDiYeN?=
 =?us-ascii?Q?xyJeCSxtFeh2Q7yxv9cI1YFVLKlplZxjpmt6YJJuxHOeBdOrTIzH4jwNS61S?=
 =?us-ascii?Q?K1n3spJk/k6abuo51uamDoT13aRq+VaXWEUQU2BQoIxRYcnzvCz63xp+VqQl?=
 =?us-ascii?Q?ipWO/+wBpCFN6KR6StctGgrSzuvRJbLU1QtlZLCBO2HrpPTyUqTUWq1121bb?=
 =?us-ascii?Q?nKSpp34sak3Cm6rYm8aTE728S9DY4bvoPhdtW3rlya8ZeBgapWriV0Pg1WKq?=
 =?us-ascii?Q?t+HMK4TnAqpqbwJ6SK2FMPhqXk76Hcb36ItY8K748f/ngjcWgoczkpqU6+Gn?=
 =?us-ascii?Q?NE4HqvM8cj5JlPEhX7z8WZf8nZs+fv0hrKxM0g1wvu+kpuM0YwRMxUqQlBNi?=
 =?us-ascii?Q?SHwjClwYDqV5vhv0GZFQBR2jo2w6clWKi6pEq3uNumK8vfnQ1ArL6iYluyjq?=
 =?us-ascii?Q?TfurdqNnpIpkprnZBuORnHxBD0jFOh2tuzrWBMGvCBPX6NZnQ9Q9+ReXlDh6?=
 =?us-ascii?Q?e/Sdkl4S1C122GCX1hAWX3NNmAs75QpJmZ4eTtRPulwenKOQxHnSbFUuYTsa?=
 =?us-ascii?Q?n2fBtHVvJwzYsdcvftcXMytx60rx9oWMfuwYmvUG7ZlsssxyaIkneACa2Vd/?=
 =?us-ascii?Q?PuKCMlD71r2NenKxLIwMgq5GVyoSfOim/MTgn/AyU5n6XXvMH0K3GA5Czz5s?=
 =?us-ascii?Q?YlSuLakE9h8a0E1Tenn8uKX7YTTxppeqiUsYl8YSXTzEUW/RTNB5JNd/2Zxj?=
 =?us-ascii?Q?W6fErl9lf94fOMbldZOh0rTD46AEwZD3/zaneZVtwRXheKFLzsDbc1WYPsXW?=
 =?us-ascii?Q?gtvBB5Mf+Myoh8q70t8pMunt/cSHizZrO3QM9rwMTjWOvplS4dqx9Hii/uZY?=
 =?us-ascii?Q?cQLLd8MmapB+VSa+FPo6uhhuP6VvyXb9IDZFIgirkz2m2glwrbzF3msjwnY1?=
 =?us-ascii?Q?sU9eAimMl8BEM/DycyTu4p+PO2br3Tt68wthq5P/jIxGuxqvAlba1nRHdYtt?=
 =?us-ascii?Q?7gZJu/1IzPomTEdHIII3GMoOdiV9TJ2msG0WDFW1zQjQPbIhGPsx8HddySJG?=
 =?us-ascii?Q?j+JNQk7Hk4QaMUfiPEXoFuIUFfFQ9yrs1l6tdT4rUsYzlEW4GoxPbZ6FgEZq?=
 =?us-ascii?Q?eN59CmNF/My1BMGaSBKErszS4193l697Fg8VOvkBpQDWFqaXyvzgTscItNho?=
 =?us-ascii?Q?EFb1oIPxnGMr5eXOyzYICD1cNTRJYBbTdkiybGHOkt11dsZHOspfxB6xNY+Q?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb64786-302a-415b-2b7b-08ddb780a819
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 02:48:56.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gYPX53GGceB4EOYmpnA+TciswPBZPVxFntPTIWtKyfYfIxD+6Jd7jIt3uaIR2MKJdKCXAJCWhFvbIGWg18vMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: e6ec2411d37d569fdb7986fa0e23d2234c8046ed ("mm: vmstat: Prepare to protect against concurrent isolated cpuset change")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/core

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 600s



config: i386-randconfig-017-20250530
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+
|                                                                                                                                                                            | 52e18f45a9 | e6ec2411d3 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+
| WARNING:possible_circular_locking_dependency_detected                                                                                                                      | 0          | 18         |
| WARNING:possible_circular_locking_dependency_detected_kworker##is_trying_to_acquire_lock:at:unregister_netdevice_many_notify_but_task_is_already_holding_lock:at:rtnl_lock | 0          | 18         |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506300421.acdd1f02-lkp@intel.com


[   14.077507][   T12] WARNING: possible circular locking dependency detected
[   14.078175][   T12] 6.16.0-rc2-00006-ge6ec2411d37d #1 Not tainted
[   14.078775][   T12] ------------------------------------------------------
[   14.079459][   T12] kworker/u8:0/12 is trying to acquire lock:
[ 14.080035][ T12] c9b2d054 (cpu_hotplug_lock){++++}-{0:0}, at: unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[   14.081025][   T12]
[   14.081025][   T12] but task is already holding lock:
[ 14.081699][ T12] c9fe21d8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock (net/core/rtnetlink.c:81) 
[   14.082357][   T12]
[   14.082357][   T12] which lock already depends on the new lock.
[   14.082357][   T12]
[   14.083300][   T12]
[   14.083300][   T12] the existing dependency chain (in reverse order) is:
[   14.084119][   T12]
[   14.084119][   T12] -> #2 (rtnl_mutex){+.+.}-{4:4}:
[ 14.084804][ T12] validate_chain (kernel/locking/lockdep.c:3288 kernel/locking/lockdep.c:3911) 
[ 14.085275][ T12] __lock_acquire (kernel/locking/lockdep.c:5240) 
[ 14.085781][ T12] lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873 kernel/locking/lockdep.c:5828) 
[ 14.086248][ T12] __mutex_lock (kernel/locking/mutex.c:604 kernel/locking/mutex.c:747) 
[ 14.086712][ T12] _mutex_lock_killable (kernel/locking/mutex.c:816) 
[ 14.087217][ T12] rtnl_lock_killable (net/core/rtnetlink.c:92) 
[ 14.087710][ T12] register_netdev (net/core/dev.c:11218) 
[ 14.088184][ T12] e1000_probe (drivers/net/ethernet/intel/e1000/e1000_main.c:1196) 
[ 14.088715][ T12] pci_device_probe (drivers/pci/pci-driver.c:324 drivers/pci/pci-driver.c:392 drivers/pci/pci-driver.c:418 drivers/pci/pci-driver.c:452) 
[ 14.089211][ T12] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657) 
[ 14.089705][ T12] __driver_probe_device (drivers/base/dd.c:799) 
[ 14.090238][ T12] driver_probe_device (drivers/base/dd.c:829) 
[ 14.090748][ T12] __driver_attach (drivers/base/dd.c:1216 drivers/base/dd.c:1155) 
[ 14.091229][ T12] bus_for_each_dev (drivers/base/bus.c:370) 
[ 14.091727][ T12] driver_attach (drivers/base/dd.c:1234) 
[ 14.092192][ T12] bus_add_driver (drivers/base/bus.c:678) 
[ 14.092691][ T12] driver_register (drivers/base/driver.c:249) 
[ 14.093147][ T12] __pci_register_driver (drivers/pci/pci-driver.c:1444) 
[ 14.093688][ T12] e1000_init_module (drivers/net/ethernet/intel/e1000/e1000_main.c:224) 
[ 14.094191][ T12] do_one_initcall (init/main.c:1274) 
[ 14.094729][ T12] do_initcalls (init/main.c:1335 init/main.c:1352) 
[ 14.095218][ T12] kernel_init_freeable (init/main.c:1588) 
[ 14.095759][ T12] kernel_init (init/main.c:1476) 
[ 14.096218][ T12] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 14.096755][ T12] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 14.097269][ T12] restore_all_switch_stack (arch/x86/entry/entry_32.S:945) 
[   14.097848][   T12]
[   14.097848][   T12] -> #1 (housekeeping_pcpu_lock){.+.+}-{0:0}:
[ 14.098660][ T12] validate_chain (kernel/locking/lockdep.c:3288 kernel/locking/lockdep.c:3911) 
[ 14.099171][ T12] __lock_acquire (kernel/locking/lockdep.c:5240) 
[ 14.099689][ T12] lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873 kernel/locking/lockdep.c:5828) 
[ 14.100140][ T12] housekeeping_lock (arch/x86/include/asm/preempt.h:80 include/linux/percpu-rwsem.h:55 include/linux/percpu-rwsem.h:77 kernel/sched/isolation.c:31) 
[ 14.100667][ T12] vmstat_shepherd (include/linux/sched/isolation.h:87 mm/vmstat.c:2119) 
[ 14.101145][ T12] process_one_work (kernel/workqueue.c:3243) 
[ 14.101659][ T12] process_scheduled_works (kernel/workqueue.c:3321) 
[ 14.102215][ T12] worker_thread (include/linux/list.h:373 kernel/workqueue.c:946 kernel/workqueue.c:3403) 
[ 14.102707][ T12] kthread (kernel/kthread.c:466) 
[ 14.103153][ T12] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 14.103651][ T12] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 14.104181][ T12] restore_all_switch_stack (arch/x86/entry/entry_32.S:945) 
[   14.104824][   T12]
[   14.104824][   T12] -> #0 (cpu_hotplug_lock){++++}-{0:0}:
[ 14.105603][ T12] check_noncircular (kernel/locking/lockdep.c:2178) 
[ 14.106128][ T12] check_prev_add (kernel/locking/lockdep.c:3169) 
[ 14.106639][ T12] validate_chain (kernel/locking/lockdep.c:3288 kernel/locking/lockdep.c:3911) 
[ 14.107158][ T12] __lock_acquire (kernel/locking/lockdep.c:5240) 
[ 14.107676][ T12] lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873 kernel/locking/lockdep.c:5828) 
[ 14.108171][ T12] cpus_read_lock (arch/x86/include/asm/preempt.h:80 include/linux/percpu-rwsem.h:55 include/linux/percpu-rwsem.h:77 kernel/cpu.c:490) 
[ 14.108684][ T12] unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[ 14.109363][ T12] unregister_netdevice_many (net/core/dev.c:12141) 
[ 14.109953][ T12] default_device_exit_batch (net/core/dev.c:12645) 
[ 14.110542][ T12] ops_undo_list (net/core/net_namespace.c:206 net/core/net_namespace.c:253) 
[ 14.111049][ T12] cleanup_net (net/core/net_namespace.c:688) 
[ 14.111532][ T12] process_one_work (kernel/workqueue.c:3243) 
[ 14.112067][ T12] process_scheduled_works (kernel/workqueue.c:3321) 
[ 14.112695][ T12] worker_thread (include/linux/list.h:373 kernel/workqueue.c:946 kernel/workqueue.c:3403) 
[ 14.113214][ T12] kthread (kernel/kthread.c:466) 
[ 14.113670][ T12] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 14.114174][ T12] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 14.114707][ T12] restore_all_switch_stack (arch/x86/entry/entry_32.S:945) 
[   14.115296][   T12]
[   14.115296][   T12] other info that might help us debug this:
[   14.115296][   T12]
[   14.116281][   T12] Chain exists of:
[   14.116281][   T12]   cpu_hotplug_lock --> housekeeping_pcpu_lock --> rtnl_mutex
[   14.116281][   T12]
[   14.117530][   T12]  Possible unsafe locking scenario:
[   14.117530][   T12]
[   14.118254][   T12]        CPU0                    CPU1
[   14.118752][   T12]        ----                    ----
[   14.119257][   T12]   lock(rtnl_mutex);
[   14.119646][   T12]                                lock(housekeeping_pcpu_lock);
[   14.120360][   T12]                                lock(rtnl_mutex);
[   14.120991][   T12]   rlock(cpu_hotplug_lock);
[   14.121444][   T12]
[   14.121444][   T12]  *** DEADLOCK ***
[   14.121444][   T12]
[   14.122220][   T12] 4 locks held by kworker/u8:0/12:
[ 14.122710][ T12] #0: b10fa6b4 ((wq_completion)netns){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3213) 
[ 14.123633][ T12] #1: b118df20 (net_cleanup_work){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3214) 
[ 14.124528][ T12] #2: c9fe045c (pernet_ops_rwsem){++++}-{4:4}, at: cleanup_net (net/core/net_namespace.c:665) 
[ 14.125358][ T12] #3: c9fe21d8 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock (net/core/rtnetlink.c:81) 
[   14.126101][   T12]
[   14.126101][   T12] stack backtrace:
[   14.126679][   T12] CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 6.16.0-rc2-00006-ge6ec2411d37d #1 PREEMPT(full)  310c9b7a074c96d55fc763e6a813380c418d9d51
[   14.126686][   T12] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   14.126689][   T12] Workqueue: netns cleanup_net
[   14.126697][   T12] Call Trace:
[ 14.126701][ T12] dump_stack_lvl (lib/dump_stack.c:123) 
[ 14.126707][ T12] dump_stack (lib/dump_stack.c:130) 
[ 14.126711][ T12] print_circular_bug (kernel/locking/lockdep.c:2048) 
[ 14.126717][ T12] check_noncircular (kernel/locking/lockdep.c:2178) 
[ 14.126722][ T12] ? add_chain_block (kernel/locking/lockdep.c:3445) 
[ 14.126731][ T12] check_prev_add (kernel/locking/lockdep.c:3169) 
[ 14.126736][ T12] validate_chain (kernel/locking/lockdep.c:3288 kernel/locking/lockdep.c:3911) 
[ 14.126742][ T12] __lock_acquire (kernel/locking/lockdep.c:5240) 
[ 14.126746][ T12] ? find_held_lock (kernel/locking/lockdep.c:5353) 
[ 14.126754][ T12] ? unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[ 14.126761][ T12] lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873 kernel/locking/lockdep.c:5828) 
[ 14.126765][ T12] ? unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[ 14.126771][ T12] ? lock_is_held (include/linux/lockdep.h:250) 
[ 14.126779][ T12] cpus_read_lock (arch/x86/include/asm/preempt.h:80 include/linux/percpu-rwsem.h:55 include/linux/percpu-rwsem.h:77 kernel/cpu.c:490) 
[ 14.126785][ T12] ? unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[ 14.126790][ T12] unregister_netdevice_many_notify (include/linux/find.h:67 net/core/dev.c:6354 net/core/dev.c:12056) 
[ 14.126794][ T12] ? __mutex_lock (arch/x86/include/asm/preempt.h:95 kernel/locking/mutex.c:612 kernel/locking/mutex.c:747) 
[ 14.126801][ T12] ? lock_is_held_type (kernel/locking/lockdep.c:5604 kernel/locking/lockdep.c:5943) 
[ 14.126807][ T12] ? mutex_is_locked (kernel/locking/mutex.c:68) 
[ 14.126811][ T12] ? list_add_tail (include/linux/list.h:83 include/linux/list.h:150 include/linux/list.h:183) 
[ 14.126815][ T12] ? unregister_netdevice_queue (include/linux/list.h:312 net/core/dev.c:11979) 
[ 14.126821][ T12] unregister_netdevice_many (net/core/dev.c:12141) 
[ 14.126825][ T12] default_device_exit_batch (net/core/dev.c:12645) 
[ 14.126831][ T12] ops_undo_list (net/core/net_namespace.c:206 net/core/net_namespace.c:253) 
[ 14.126838][ T12] cleanup_net (net/core/net_namespace.c:688) 
[ 14.126844][ T12] process_one_work (kernel/workqueue.c:3243) 
[ 14.126853][ T12] process_scheduled_works (kernel/workqueue.c:3321) 
[ 14.126858][ T12] worker_thread (include/linux/list.h:373 kernel/workqueue.c:946 kernel/workqueue.c:3403) 
[ 14.126863][ T12] kthread (kernel/kthread.c:466) 
[ 14.126869][ T12] ? drain_dead_softirq_workfn (kernel/workqueue.c:3348) 
[ 14.126874][ T12] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 14.126878][ T12] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 14.126883][ T12] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 14.126888][ T12] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 14.126894][ T12] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[  OK  ] Started User Login Management.
Starting LSB: Load kernel image with kexec...
Starting Raise network interfaces...
[  OK  ] Started LSB: Load kernel image with kexec.
[  OK  ] Finished Raise network interfaces.
[  OK  ] Reached target Network.
Starting LKP bootstrap...
Starting /etc/rc.local Compatibility...
Starting OpenBSD Secure Shell server...
Starting Permit User Sessions...
[   14.279154] rc.local[230]: PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/lkp/lkp/src/bin
[  OK  ] Started /etc/rc.local Compatibility.
LKP: ttyS0: 230: skip deploy intel ucode as no ucode is specified


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250630/202506300421.acdd1f02-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

