Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A5210E6
	for <oe-lkp@lists.linux.dev>; Wed, 28 Feb 2024 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709084818; cv=fail; b=K7wO6lGyOvx3q529db7/u/OkDHorydiLznUpIs93XsimnDZu01l5iQq52G2rPIxO/47R8MnQhdna5cqopA5yHHxVfwOZltfpqCVkekz2PNr/nGfmuRcE2qHph3Zd4OPUexrkCebk9DqoiLsTPpGKcYpiGi4nYy4V8WcZX9pDRKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709084818; c=relaxed/simple;
	bh=Kn1Z6FpZIgWwYm+SHlQCbft7P1NKZZI3TcpYMDTUQis=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oRawn0EizdqTvy4I5gC7Ame8buno1oNARpJABoPnW1+lZx9Fzl7ZOai/prDXKtLxAQCVjWHWsDBKhZ+ylQPjOt2XYIRSzcWdLKrnf+idQIlXanLl195GaBNKLiGCqAAqOzh/KaHIfByFP6YnVChg6gvHkUO16VM0o7a7kMrlflI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AG4wNsNH; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AG4wNsNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709084816; x=1740620816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kn1Z6FpZIgWwYm+SHlQCbft7P1NKZZI3TcpYMDTUQis=;
  b=AG4wNsNHpwqIFGISBPIxNP3nfz9WlKxqcHKkolgAtM8LhYQbm3Nxwy1S
   1neTKxQ6hFneWHKk1NnZZs4XJkaMlWAP+C4idVfRkcNfUL+m2/HjDnIwm
   YGbX16AdK6Naawonlrv6Qpcpw/udk7BvWCB5h24U8ePOPZUx//tVjSkC1
   VJyJOURFLTsf5jclsXlWtxbm09eZC/knA88DTUX9QimtBUZoGAt5aHRMC
   dqNLSdyoV+yniH8RPvBINM1gzqxmxkKO02zsnloFz2hiFKSpmsh4g8KMI
   S/xqcscHLXZd7ouco44yC2hWjEzMahD5YJXLxSsUD9R56lrbunXu2xdsl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3334849"
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="3334849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 17:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="11972494"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Feb 2024 17:46:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 17:46:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 17:46:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 17:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnwiiMqCIu3tWTEc0XzhWWawiQM6IHB3sFWSVoozan5jbYZfWuH27i1I+OX8armPH08u1rB8Ui/ARYANeS8fH6K2w3RvbmK/Vy+s+ufcL6NJFPOmFPiQSdnT1eAMm05H02Ouona2e3rQQXOtwX0BEQ4zW96jzFwpXsxOgqNKdv6Y4xJz+PX43IQcQwAYbtX+P3OTcHGRhmkqsXAsbEAoW5X/xKg+WAK13+E4svknExTseaXljlShAdeBwr1ZEOMmQtkieRRiwKQBtH5PQJ1ARCVDUx9mRngB+Wxaqli+bvNKzZTf3qlF9jdZI5qThttlqzrfW5Gu/l59VVHqhb6i9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnvnEXQHiREvmYSG9Fy9Q4jDKHnkTaON4neiDt0aAvY=;
 b=aUYj8251vpxFJeRPFAqAEH274avnSq8duqy7UuxfGcZaqzX9PDQ92yfUnv24ESVKly6NCD+2AZVSXKLIht4ynQOm3qkKErgnLnNL3dICi4LbN7byoNPEfEO2+2XGqPd7lsm9FnOsc9Hn4XeX7t5SUirBgsdUZ0zsu0+qlCmYEaunh9sW0cE3CYO4AY4ywv5FzOemZ79ENfWaxqKbDDDVwmw+/IK8oICiCPuCQF2nUX/ZtRddDgiVMBOfMJBULflpljNYTPCbzccdpGxZccutWotNwm75yFINkF11AXcw6V1jkQO2bqfFP/WU5MSOsrJhf2/7I/77PNHQmYjL6k6z7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5439.namprd11.prod.outlook.com (2603:10b6:5:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 01:46:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 01:46:49 +0000
Date: Wed, 28 Feb 2024 09:46:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:tick/keep-tick-on-hrt] [sched/core] e7e6035c3d:
 WARNING:at_kernel/sched/deadline.c:#__pick_next_task_dl
Message-ID: <202402271655.48b83635-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdaaff4-ae2a-4b29-2812-08dc37ff20c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eK/36UBsugyTEqbTaBtKPlBxgSkP2y8NcMe7nMSZ7244P+SjJHdqJSpJ44pV2lx9TwMTDHT4/GTQDqARyVH6Znw4XPy/OC/wYeBD6pIA1xm9MKzRvqm+Opu5Grch3Fu+9FPNPkO27hCj2w4VKMeOGHcr5JqSWb1uWGyfQT25JJSv+hvLzjef/enRmKv8zmbIpo0x2hmQ2jUALQXHCrpCujAbPyu2SZBllezBpzD/jFarEaDL1w/TmNdKz7dqPAnIVFo+NAAQHFaKuQKae1kP52PRdqBD6FiosBw9I4FmSIaUtHlCwy745QynhjiFlYpcEcOVTnyYE/CitT9rkYcKMFsdDzQaW+W8cu3cqf0ULCd4jTt28MzdcN9RlCiF1154f6gDveLdr0/5GcicdC3zwoapRRCYYeezlU3t4Bx9rlAu+Vn5rbYutNW5/u+r4eTF8aOykOxDxubWTVowFaZ2zwjsqFa3KSobvc9lzzwn4FB3zATGtPR6yri0Jr8RAPvTWeKnw1ENdvnhIqHGFTvvYuWaour6QhVau7K1UOMRlOQWKZCYorSMcML/r1NVc41lJwiOGcE3fXzDdSYyZLFV/HvjElWD4dW1IdBxYrGaQHfEY79IZaB1vGF80cLvhLF+fG64PrTzUZCl9gvvIQ88sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDSEZYGNUaPtueHeFy1uZZ4bhETzkFKj0ZIJO8wQ77K+kdt7LhsvOK+dQs+b?=
 =?us-ascii?Q?xv3JsLLYwfVhtHCeHcOc5rvhJOfKekyn0QExbM25Xz+24lQwsuEyzYIPhB1d?=
 =?us-ascii?Q?o9L5vBKqdmoN9xbofNmAM08ImLAkVdRNz04FG96Qmm80IpmHKyAUn8N63vYV?=
 =?us-ascii?Q?pCbnetMdu+xvnPLSkfgKDqYB5yL+yUV8R12HjBsSbByArAEIqf/c9S0mztqC?=
 =?us-ascii?Q?90BsLC/fme0/5q+FV4/Fv4VROJz+/ipMZEk3hOU1pk4Bkkup+p6n/OcKAOLE?=
 =?us-ascii?Q?FG4UzgI+8yMUzeo4T4xGgvSn+mH+eZzG9OIQTYIgSSa+FbdsVBaF+8JjGUSH?=
 =?us-ascii?Q?OzbTWOJ1qEXI6RV++ug4lQn+g3y6KdfTiY+BCpZrLJu2BPuOt3xaWAxV+AE9?=
 =?us-ascii?Q?VVW+a7lVfh4fmLRXV09XK/8GsqYti1nQJoOuK08+5AQG2J19t8nmA7Axd//f?=
 =?us-ascii?Q?nl9VkbqQg8xmEjJaxwXWRIp688WAz74oKnyfmH5mPYg3niE5dxaJR+Y3sMfG?=
 =?us-ascii?Q?HyT7qwYoHQ/+Eyq6vehXaPUXtOdScMgKGndo7ZLlPQ7qGPmtSQxv1xIkyYp1?=
 =?us-ascii?Q?n1c39Y0NznK0CVFoB4FGb7RKT4v2i5ADrGw7X6DBIqLFBKFfFTzp4yTP9qi+?=
 =?us-ascii?Q?ViplSSkvvl5gC2NESYP6cXBCThsPRb1mHZEgQfEeiZpb2C6TcCl8mP/iQ3X0?=
 =?us-ascii?Q?zYAk+s+f7sRxuNZrrgKyNHq/jam3y9LY64aoUa2/7wS63cFhy+EQIxdyHPC/?=
 =?us-ascii?Q?ptE3fIAtfH8SGJys1q+qhhIYvkVDu5WZsmCAKBU41id1SBjwkD6JEF3z9geV?=
 =?us-ascii?Q?4bb5CIovlT6dgLLrlCFphr/QprwlJWiLPmuSu+nkQDNq2YA0zURvIagSH8h3?=
 =?us-ascii?Q?9t5Ed3V2jckSEgaTUn44Tfnc74pufpyGf5yRMUeRAp038Knx0b1uBCAeXByy?=
 =?us-ascii?Q?Iep4ijt1kmhDGbPIk8rLM9fqKZe2HRAvSGo6U0eGRYKHPxBDsbE9P70z0iw5?=
 =?us-ascii?Q?Hxdq/bi66kdHGgTakBC6QnoPFoS0O1NO5HhBoEwzPSg5U9kJu6/6zdEkEKm0?=
 =?us-ascii?Q?wOF9EB/V1Z/fVt6gZV0zlISPHJ1KKM+0ECjXqYtMYfPFBAD7AbXSjnEL07fM?=
 =?us-ascii?Q?uWAiYJ5ttyWPipk++oP6gaPOBzCYvkTg9yHknUNlMeFk0+8AWcAN3j1s237C?=
 =?us-ascii?Q?hI2YFkkt34IaA2VMyYyn0WAfiAODLJ0B3BQPrbHhj0kPbC0YLZMLgXJkEQGq?=
 =?us-ascii?Q?rQlt8hf4zWyFRzec/IIOyQ2Lt/lSEcQMQan21EaWuaNPLYtuwMRO+CJx1zlD?=
 =?us-ascii?Q?PMAqWT2Z1n7DkNn7MY20VCZTpf+ewdbIzWxIcoS6R/g2DE7koL7qRCno45o0?=
 =?us-ascii?Q?t84yMV8VM6yiGnZ6FEutsWiRYkXCwS2exRySvZj4tDivcBR+7P7jGCfqCoF4?=
 =?us-ascii?Q?DDbAmn/FCsVa1uug2XC31TPMDi33xIosvmMejF7dT6GXEcthxFN+EHUU0wGw?=
 =?us-ascii?Q?Yv8ZWlwaOZAxpBoQf3dHnAIb8u4061p2Nfyc2R/+E6bcxTg6bBPIC9UXECla?=
 =?us-ascii?Q?kwKLpk6AqSMNxxmC7pOd7Ky7WQKQekYVYV1sPtx4GijLvDqjEI9zO1cJIO7d?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdaaff4-ae2a-4b29-2812-08dc37ff20c4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 01:46:48.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7u+Ouc5rjbox1TKTDGJ0KwD7ivOSL3cxq/KuuSBS088bqhXCLBcudlmV63i+5wbV7u2G53OdfYiZT/xwR1gH1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5439
X-OriginatorOrg: intel.com



Hello,


we noticed the parent also has a similar WARNING, which just changed to
'WARNING:at_kernel/sched/deadline.c:#__pick_next_task_dl' due to code change.

however, due to limitation of our auto-bisect flow, it's hard for us to
find out which commit caused
'WARNING:at_kernel/sched/deadline.c:#pick_task_dl'

we just report this FYI that we observed the WARNING shows in our tests, which
happens in a random way (as below, 2 times out of 8 runs for e7e6035c3d and its
parent).


272ad52e410abe39 e7e6035c3d861787cba5c333a45
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :8           25%           2:8     dmesg.EIP:__pick_next_task_dl
          2:8          -25%            :8     dmesg.EIP:pick_task_dl
           :8           25%           2:8     dmesg.WARNING:at_kernel/sched/deadline.c:#__pick_next_task_dl
          2:8          -25%            :8     dmesg.WARNING:at_kernel/sched/deadline.c:#pick_task_dl


below is details.


kernel test robot noticed "WARNING:at_kernel/sched/deadline.c:#enqueue_dl_entity" on:

commit: e7e6035c3d861787cba5c333a457b6c651efe6ab ("sched/core: Fix picking of tasks for core scheduling with DL server")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git tick/keep-tick-on-hrt

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402271655.48b83635-lkp@intel.com



[   24.478616][   T38] ------------[ cut here ]------------
[   24.479061][   T38] WARNING: CPU: 1 PID: 38 at kernel/sched/deadline.c:2300 __pick_next_task_dl+0x26/0xac
[   24.479755][   T38] Modules linked in:
[   24.480034][   T38] CPU: 1 PID: 38 Comm: kworker/1:1 Tainted: G        W          6.8.0-rc4-00023-ge7e6035c3d86 #1
[   24.480765][   T38] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   24.481492][   T38] Workqueue:  0x0 (events_power_efficient)
[   24.481902][   T38] EIP: __pick_next_task_dl+0x26/0xac
[   24.482274][   T38] Code: 58 5a eb d0 8b 88 58 05 00 00 85 c9 0f 84 98 00 00 00 55 89 e5 57 89 d7 56 89 c6 53 eb 2b 66 90 ff 93 a8 00 00 00 85 c0 75 41 <0f> 0b 80 4b 48 02 89 da 89 f0 6a 00 6a 00 e8 ff fc ff ff 8b 8e 58
[   24.482538][   T38] EAX: 00000000 EBX: ea883a60 ECX: 00000003 EDX: 00000000
[   24.482538][   T38] ESI: ea8834c0 EDI: 00000000 EBP: c4643ee8 ESP: c4643edc
[   24.482538][   T38] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010046
[   24.482538][   T38] CR0: 80050033 CR2: 00000000 CR3: 037ea000 CR4: 000406d0
[   24.482538][   T38] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   24.482538][   T38] DR6: fffe0ff0 DR7: 00000400
[   24.482538][   T38] Call Trace:
[   24.482538][   T38]  ? show_regs+0x70/0x78
[   24.482538][   T38]  ? __pick_next_task_dl+0x26/0xac
[   24.482538][   T38]  ? __warn+0x6f/0x16c
[   24.482538][   T38]  ? __pick_next_task_dl+0x26/0xac
[   24.482538][   T38]  ? report_bug+0x170/0x194
[   24.482538][   T38]  ? exc_overflow+0x38/0x38
[   24.482538][   T38]  ? handle_bug+0x2a/0x48
[   24.482538][   T38]  ? exc_invalid_op+0x25/0x64
[   24.482538][   T38]  ? handle_exception+0x133/0x133
[   24.482538][   T38]  ? exc_overflow+0x38/0x38
[   24.482538][   T38]  ? __pick_next_task_dl+0x26/0xac
[   24.482538][   T38]  ? exc_overflow+0x38/0x38
[   24.482538][   T38]  ? __pick_next_task_dl+0x26/0xac
[   24.482538][   T38]  pick_next_task_dl+0xe/0x3c
[   24.482538][   T38]  __schedule+0x50c/0x83c
[   24.482538][   T38]  ? schedule+0x9e/0xd8
[   24.482538][   T38]  schedule+0x3a/0xd8
[   24.482538][   T38]  worker_thread+0x169/0x394
[   24.482538][   T38]  kthread+0xd0/0xf8
[   24.482538][   T38]  ? rescuer_thread+0x2e4/0x2e4
[   24.482538][   T38]  ? kthread_complete_and_exit+0x18/0x18
[   24.482538][   T38]  ret_from_fork+0x29/0x40
[   24.482538][   T38]  ? kthread_complete_and_exit+0x18/0x18
[   24.482538][   T38]  ret_from_fork_asm+0x12/0x18
[   24.482538][   T38]  entry_INT80_32+0x125/0x125
[   24.482538][   T38] irq event stamp: 26398
[   24.482538][   T38] hardirqs last  enabled at (26397): [<c231ac8d>] _raw_spin_unlock_irq+0x1d/0x3c
[   24.482538][   T38] hardirqs last disabled at (26398): [<c2310af5>] __schedule+0x3dd/0x83c
[   24.482538][   T38] softirqs last  enabled at (26394): [<c1fcefa3>] neigh_managed_work+0x9f/0xa8
[   24.482538][   T38] softirqs last disabled at (26390): [<c1fcef22>] neigh_managed_work+0x1e/0xa8
[   24.482538][   T38] ---[ end trace 0000000000000000 ]---
[   63.158742][    C0] BUG: workqueue lockup - pool cpus=0-1 node=0 flags=0x4 nice=0 stuck for 38s!
[   63.160422][    C0] Showing busy workqueues and worker pools:
[   63.161383][    C0] workqueue events_unbound: flags=0x2
[   63.162263][    C0]   pwq 6: cpus=0-1 node=0 flags=0x4 nice=0 active=1/512 refcnt=2
[   63.162273][    C0]     pending: flush_memcg_stats_dwork
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240227/202402271655.48b83635-lkp@intel.com


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

