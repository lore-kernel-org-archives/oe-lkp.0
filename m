Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71C337BA1
	for <oe-lkp@lists.linux.dev>; Sun, 22 Mar 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774174484; cv=fail; b=d/5ndd261c0CNVZFVRXnyaROHaIb+Hso5oz2CEsGs0hgZWsC1NhuXyhqa/oIiiedlYmd4v6J/gLgtaXNEVSrDKbWjke3mGqhRLGWpK1zRRrxIothuCycbVfyEPnU0S8SOcEZsR5OjYAhngW/Oiauo/xFkzOg4jmb1Ugq6ArhCrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774174484; c=relaxed/simple;
	bh=ugTUw25OYxtXiNrtc0hVYsg/6vOnxuXN/dlRrCtlxpg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Zq+nKULUA1fnUCxGbdgFa/z3tRzKVvClM87aNPAg0PWRpQjQrLUVT/lzkv8Z8z1mIQR2NyefaaS/Zyvp8Yt4YxM/ORogvfV7q2/accR247Um4JUS/Sb8dO8B9DBg3lSGmAGYN7ryufLLcfj0dSoJXAb109+1GsNZA413FaRg5D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne17OaJn; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne17OaJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774174482; x=1805710482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugTUw25OYxtXiNrtc0hVYsg/6vOnxuXN/dlRrCtlxpg=;
  b=ne17OaJnkKAlA1ntRy6bJXV1k1Z00DWFt2LR+5AqoOqybeSOOWTIBZig
   2jj/cBtOxgO3PaSCrRYBf1tQMvsm34xqSfoLrF9zUD3tRai3Peo3SFEwt
   GBqm0AqMsrjL7oC6EzF+noSgPWunq/mQh09k3lgl4nSDn3zEc6gTJoQEM
   fjONvZ8zfA3Un6lKfPMs1anb0y6wkoq0jDNpAxBqavoa+EEuoLMRv/htz
   XgGr6zggSDWDa4dQx2RY6B/RWTTzDnLauZYIsGwv8trnFscpf7YqPJEux
   l0owgrZ1SvgRDdFpLoXjX6O4sf8Rq/jP8rr+CWFvf5hlZ3wTJa29Edslf
   A==;
X-CSE-ConnectionGUID: 3H84zbQBRwq7Tl8UwKYo1A==
X-CSE-MsgGUID: Hb+LoD43QAWA+xOmCD+lbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="79062071"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="79062071"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 03:14:42 -0700
X-CSE-ConnectionGUID: c+4f4AO2QdmamqnH/Bf1Rg==
X-CSE-MsgGUID: ElXQnZUjSvmpTOodQTApWg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 03:14:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 03:14:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 03:14:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 03:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKi1sjdMSxHbtkzF818e9M5y6ZF0O00L6QB04uzgy9t6f7YPvW/N7HRuekWDfJWWKGGlkk5miBxk/JKUqCZ0k1ocjkAY7ydxIBlWMSxnXFakpuAlD0B2m0/V9LY/ZxcuCc5IgGEMZqTT2w5k4+J19sOVtv6Si4KibHjkmTylljo8zVr47WHcP6CZ+MzipV1n7XA0WBK7VpHGjB/bqlW0NVLImciX3urZO16tEUYkQYYUMjAIhlOKcUTJbeQFzfAG2il86t5xUz/hm4mI2+5glDXyzOGZSIUW7TfBokep9U3GHhN0hdAL01+2EObqAcNH9nVTpHHMqmF+ruVXh6PRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Uswcj3ob++95NvrqyXM4vN+XlvW0gODSqIg+bZ4qkM=;
 b=DefyvJXr7wO6lfL9AbaUQxNwFiPwzOocsupuRXVhWsKDQ+YMkWDi8GxgaGHNqeVfP33+++axvF84O1YJwSQuoSeR7uGvbApLMpk8/nlzHUNc1dVLB1PsFgTuH8oB8wCwucAUg+rAmrfly5v4yeBY7aai7TN+ScHKvBEZxA6bWs5mPxw9nsT1jQgb62A29WiF9AOruwxRWvl61og1E4H9IIgAvdZBoYNQOWXQCoNOrZiCx+YUmOfCDg1Ib699Sp8J9sqcrRg8tvTQ87F8FP98qz05Bi5C6RlwVABDB4nPcMYOWqgign7PkEdnQCQmcQem/Z4SEiE+4N2MiK9BGv8+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sun, 22 Mar
 2026 10:14:32 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 10:14:32 +0000
Date: Sun, 22 Mar 2026 18:14:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/restricted-pointers-final] [lib/vsprintf]
 2fad68b9dd: WARNING:SOFTIRQ-safe->SOFTIRQ-unsafe_lock_order_detected
Message-ID: <202603221100.e934e697-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c581e7f-cea6-46a5-a2a8-08de87fbcf66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: mecEF8QFBU5qCgKNn8KLLfXeQtAElQ3ICD6JlkXRA10k/ZsAkCnhN6vYyCJQQoeXbQd/LqobQV73UvRY1FjJjRzGyOX3yQQ5otVGfyi4uDK52wYmytQahQ2gjg7iv5zEk4ChV1MVa1pJx6p5ZE6qmCi9IWNwpbmTh5Yu0/dgEVGxlBEoIxtV/dFvy7ex/6FHeviMHaMNoRQzkMdge4jhl/HFB0MPdfdsVSIRhxCb2fQC1t+THCUeSOj7xdgddPBOjZPTNqFfmghOnRDInIrFc/yQ4u3cwfC09aLk7RYGA+zTovW8YyulL2xQrm51b5U/3rGom2EK3uZR0kKz4SMukBtIQGDYoLB98C2knWvEKrubVrUDy26o7WB6hmeoHAsR9wruhBmwQMzgWidkNwiRkCAW0D8i8P1gcbfD9IbGSzp/Y+PdOG+jwYJLkFEGVP81WLeXrcQgu00AqJuniS4cHjz3fSvPej5RnsXjLVojRbq8imQjWRt3UlTcc3LI3JSxoOg/cbbLFlpLyEq5MeXYVMpisSonfXI9Re/yj9o8iwl6QnXXz6kmbrU/mTUw7Owh5chw21LMoTt0rJdwirQqyS3HYmUt01OWrXqhdT2gKh2+0osXW2I86eztOPuJ9vO7eQgM2hqHdQn5QWPXgbyC5CkoteTYldR+4VIQ0kL7VLK0DV9kHOnhzelpIjmqXHopBBC6bRQfynnk26br+OY7IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cFfJg1C4vSEU+UahC22O2bGgjlPQfFLMTaPwRrxl64m60u90CWtWXrZxIdbj?=
 =?us-ascii?Q?aqvkUEDeRmgLKyRoSncEImtTb71IDh98ox8JtoaXlDNqw6To3oOiOGNscSWg?=
 =?us-ascii?Q?d7zjWZnFRLALDfJb1WMgkckc8SSxXdQ+XCT4t8PAG15SnyXmfnWv+WnMK8EH?=
 =?us-ascii?Q?18tp+EBsZ1OYFvrS7vD33vGHN1jaxdZ2H+BY+yvHYHsephQ8yAPxaOpyIV2e?=
 =?us-ascii?Q?2LPv7DboTr5Zfje2ypAset8Rnz9A/2fOuwgl81aM0KsRWXC3rxPqrU864VxO?=
 =?us-ascii?Q?Z1nrslOfldtt7Ca3FWrU0yTXvssMmOTzmM5WsIVNWPixCZoVJ3hMzImeGman?=
 =?us-ascii?Q?SD0bm2XO6hBEYHgN6Ps0Jv2zZ+yVt5Ke17D3divbdzdtR7LZL+DVi+v2fDDj?=
 =?us-ascii?Q?aBIk08RwoW2+52QG9GfT9fOeMomJw0EalTUn5RovDBE7OLae2ZVYRRoxRRn3?=
 =?us-ascii?Q?KQIUZE/laKfLPE7zcsFbKyfKlifMpmzAcJDv5oVIgxVUvi8Jc+CiAat2vkjM?=
 =?us-ascii?Q?o1FMGV/Y/9Gvh067Hdi/YvXtZd87k5NRxZgMqJj8uM3D8Rym8LdGWNMsReGy?=
 =?us-ascii?Q?h3++wzm16Y+OA11c/pFa6sHvu8mpv8oVGj6cj7ivC1ExF6kUW2DsS9dj6L9/?=
 =?us-ascii?Q?aq0Q+/4LAYPVLnbJGM5xxBgl9JvAw+P5msDouQGWTkLvL4KXm/ojkXxD6AEd?=
 =?us-ascii?Q?PxVqUcMZp+8elzloWYiIogTx0JevmdpskCPK84KhhPQl0GcloRntk3H3ZGOa?=
 =?us-ascii?Q?JSJoUalhQN6WUScLyqBuy4WMuwUtVu3L9KSVeW/66D3cgkMzqpimWjKFejsv?=
 =?us-ascii?Q?PBw7yC7olxGQDi3HyogQmKGBlgHaP9M4X9ueDdHe4iZDo2gvvMjvI98JqsV5?=
 =?us-ascii?Q?vgquE5lf+jWQL6Qf+LMBgAd9FXmSHnallShBKHW3sqH/vfgxnhrO52mDf2ei?=
 =?us-ascii?Q?QGZXbe4JDFZzWMUDsvVZo8fP+ut5tDTk7ThKKVgk5rU1/REzBEGz35PgOhvO?=
 =?us-ascii?Q?IGzwB6su10QoBd4cOqozi34/SpWddpXu5O8lRHdRpOWr/VJNe53YyfqnhfY1?=
 =?us-ascii?Q?g0TFEQ8A86Y9W7o++sM8ZyxtfLQEA5q0/9uLtIhDWlUNCyh01GZXS50qsx/M?=
 =?us-ascii?Q?FGbnrHeTNLFvVSbTu/G+BshQx+0Ukpxe+p6Wkw5Bqo2U8Hgt5NMEhPVSCR4H?=
 =?us-ascii?Q?vsbyBULppuRJzZtHaMZeTUFU6MH4zz03myQ/b6Ud3SeuLyScQQa6v85NVPtZ?=
 =?us-ascii?Q?i0Tz5bYfQhRdyWWTpCABaMjjzlQtTCdayxPbflGZDmDUBmdLSGt+kR9SWWOC?=
 =?us-ascii?Q?8VyE8QiURrD4WhFT3nyMnvQzK3ET0vvYy+ljKouADul5yFcG8SSvKQ/Li42D?=
 =?us-ascii?Q?mgsXxJ2ITA1A3XhINySEMuNc7I1FljQ5DanpeLqS9ntFoA+5jmB9a7ZxVZ+2?=
 =?us-ascii?Q?Ah2wHLZtK2bh0MuEZSTcbMStd97Qb/XSKDxUorcKlDZ/VsZaq/9kNZmCrXMV?=
 =?us-ascii?Q?FzmGRAPsxbuv5ZbjUB2lWe4N1XyMzXQScfGmBrNHRXevMPvE9WC7U+2laGOD?=
 =?us-ascii?Q?z7QkawBFTBjG1ib58JQIXDQ739KmvHkmDQsKA/o0ETnBR5R9R2B0Ahu5avtW?=
 =?us-ascii?Q?8FI5Ne1PdXe43lT78qTH3F6Qy66nK8lScsQZlM4uW//yzlvjGNJ1uFjDitNW?=
 =?us-ascii?Q?8+PTcmxdFx8GoU4M82KjIRZ1mceJ0fkmBKFlwoUJAmFuRHrnlcpoUsZt9Bef?=
 =?us-ascii?Q?VJ1TlxyhdQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: HWnK35gnKydaDzBNPa16jespvt/FVkoCzTDrOBWfHCV2CqguugjvSrfJf6olIS0Cy1OGBaf0z5xskHL7+ALMiHYeUWo2QKqceDXFqmR9l0Ao9l7SSj9+GP37Octxbxqe9NLmkxnlz+jYmNroGBpjx4Myi8mzjUBiimiI8iOOd5Y4BeUII3h80jcYWJVqt+b4aumJedU85MInqhpKZFg6rSIGDpPGz2UhzUVEQxaZGSkOL1l63kWlbavx3DKvsyxHd2YwOYjCfi53tlO0G1adfgJrjdRDqMWhDox//jkgMRpoo7Ode6oPd1OKwHqksZe4JeHnHwQDMOUvxyWy/hmfqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c581e7f-cea6-46a5-a2a8-08de87fbcf66
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 10:14:32.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7OkvgRxns+t10UBJZlmfmEUfF+ZIP43O52aBMVzQ1C+e0UCxsOATomF3FY8CRusvhbZl+WUw2GnOHo3aY8SaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:SOFTIRQ-safe->SOFTIRQ-unsafe_lock_order_detected" on:

commit: 2fad68b9ddb336324b5890e94998ef7d050481ac ("lib/vsprintf: Validate spinlock context during restricted pointer formatting")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/restricted-pointers-final

in testcase: trinity
version: trinity-static-i386-x86_64-f93256fb_2019-08-28
with following parameters:

	runtime: 300s
	group: group-02
	nr_groups: 5



config: i386-randconfig-2006-20250804
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603221100.e934e697-lkp@intel.com



[   31.792070][  T860] WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
[   31.792841][  T860] 7.0.0-rc4-00004-g2fad68b9ddb3 #1 Not tainted
[   31.793462][  T860] -----------------------------------------------------
[   31.794192][  T860] rsync/860 [HC0[0]:SC0[4]:HE1:SE0] is trying to acquire:
[   31.794909][  T860] b4048e20 (&tcp_hashinfo.bhash[i].lock){+...}-{3:3}, at: inet_twsk_hashdance_schedule (include/linux/spinlock.h:341 net/ipv4/inet_timewait_sock.c:123)
[   31.795980][  T860]
[   31.795980][  T860] and this task is already holding:
[   31.796736][  T860] f2501440 (slock-AF_INET){+.-.}-{3:3}, at: __release_sock (include/linux/spinlock.h:348 net/core/sock.c:3223)
[   31.797544][  T860] which would create a new lock dependency:
[   31.798132][  T860]  (slock-AF_INET){+.-.}-{3:3} -> (&tcp_hashinfo.bhash[i].lock){+...}-{3:3}
[   31.798985][  T860]
[   31.798985][  T860] but this new dependency connects a SOFTIRQ-irq-safe lock:
[   31.799890][  T860]  (slock-AF_INET){+.-.}-{3:3}
[   31.799893][  T860]
[   31.799893][  T860] ... which became SOFTIRQ-irq-safe at:
[   31.808686][  T860]   mark_usage (kernel/locking/lockdep.c:4642 (discriminator 1))
[   31.809160][  T860]   __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.809657][  T860]   lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.810127][  T860]   _raw_spin_lock (include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:154)
[   31.810622][  T860]   tcp_tsq_handler (include/net/sock.h:1809 net/ipv4/tcp_output.c:1279)
[   31.811121][  T860]   tcp_tsq_workfn (net/ipv4/tcp_output.c:1313)
[   31.817716][  T860]   process_one_work (include/trace/events/workqueue.h:110 (discriminator 4) include/trace/events/workqueue.h:110 (discriminator 4) kernel/workqueue.c:3281 (discriminator 4))
[   31.818306][  T860]   process_scheduled_works (kernel/workqueue.c:3359)
[   31.818856][  T860]   bh_worker (include/linux/list.h:381 (discriminator 2) kernel/workqueue.c:949 (discriminator 2) kernel/workqueue.c:3663 (discriminator 2))
[   31.819308][  T860]   workqueue_softirq_action (kernel/workqueue.c:3691)
[   31.819877][  T860]   tasklet_action (kernel/softirq.c:953)
[   31.820373][  T860]   handle_softirqs (include/trace/events/irq.h:142 (discriminator 4) include/trace/events/irq.h:142 (discriminator 4) kernel/softirq.c:623 (discriminator 4))
[   31.820878][  T860]   run_ksoftirqd (kernel/softirq.c:479 kernel/softirq.c:1064 kernel/softirq.c:1055)
[   31.821359][  T860]   smpboot_thread_fn (kernel/smpboot.c:160)
[   31.821894][  T860]   kthread (kernel/kthread.c:438)
[   31.822333][  T860]   ret_from_fork (arch/x86/kernel/process.c:164)
[   31.822818][  T860]   ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[   31.823320][  T860]   restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   31.823866][  T860]
[   31.823866][  T860] to a SOFTIRQ-irq-unsafe lock:
[   31.824605][  T860]  (vsprintf_restricted_pointer_map-wait-type-assert){+.+.}-{3:3}
[   31.824609][  T860]
[   31.824609][  T860] ... which became SOFTIRQ-irq-unsafe at:
[   31.826170][  T860] ...
[   31.826172][  T860]   mark_usage (kernel/locking/lockdep.c:4666 (discriminator 1))
[   31.826946][  T860]   __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.827433][  T860]   lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.827909][  T860]   restricted_pointer (lib/vsprintf.c:874)
[   31.828426][  T860]   pointer (lib/vsprintf.c:2580)
[   31.828862][  T860]   vsnprintf (lib/vsprintf.c:2961 (discriminator 1))
[   31.829310][  T860]   seq_vprintf (fs/seq_file.c:393)
[   31.829777][  T860]   seq_printf (fs/seq_file.c:409)
[   31.830225][  T860]   get_tcp4_sock (net/ipv4/tcp_ipv4.c:2908)
[   31.830709][  T860]   tcp4_seq_show (net/ipv4/tcp_ipv4.c:2952)
[   31.831190][  T860]   seq_read_iter (fs/seq_file.c:273)
[   31.831675][  T860]   seq_read (fs/seq_file.c:164)
[   31.832240][  T860]   pde_read (fs/proc/inode.c:308)
[   31.832686][  T860]   proc_reg_read (fs/proc/inode.c:320)
[   31.833153][  T860]   vfs_read (fs/read_write.c:572)
[   31.833596][  T860]   ksys_read (fs/read_write.c:718)
[   31.834037][  T860]   __ia32_sys_read (fs/read_write.c:724)
[   31.834518][  T860]   ia32_sys_call (kbuild/obj/consumer/i386-randconfig-2006-20250804/./arch/x86/include/generated/asm/syscalls_32.h:4)
[   31.835001][  T860]   do_int80_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:259)
[   31.835530][  T860]   restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   31.836089][  T860]
[   31.836089][  T860] other info that might help us debug this:
[   31.836089][  T860]
[   31.837114][  T860] Chain exists of:
[   31.837114][  T860]   slock-AF_INET --> &tcp_hashinfo.bhash[i].lock --> vsprintf_restricted_pointer_map-wait-type-assert
[   31.837114][  T860]
[   31.838810][  T860]  Possible interrupt unsafe locking scenario:
[   31.838810][  T860]
[   31.839620][  T860]        CPU0                    CPU1
[   31.840171][  T860]        ----                    ----
[   31.840716][  T860]   lock(vsprintf_restricted_pointer_map-wait-type-assert);
[   31.841423][  T860]                                local_irq_disable();
[   31.842075][  T860]                                lock(slock-AF_INET);
[   31.842729][  T860]                                lock(&tcp_hashinfo.bhash[i].lock);
[   31.843514][  T860]   <Interrupt>
[   31.843897][  T860]     lock(slock-AF_INET);
[   31.844443][  T860]
[   31.844443][  T860]  *** DEADLOCK ***
[   31.844443][  T860]
[   31.845278][  T860] 3 locks held by rsync/860:
[   31.845751][  T860]  #0: b533ce40 (&sb->s_type->i_mutex_key#6){+.+.}-{4:4}, at: __sock_release (net/socket.c:662)
[   31.846692][  T860]  #1: f2501494 (sk_lock-AF_INET){+.+.}-{0:0}, at: lock_sock (include/net/sock.h:1710)
[   31.847502][  T860]  #2: f2501440 (slock-AF_INET){+.-.}-{3:3}, at: __release_sock (include/linux/spinlock.h:348 net/core/sock.c:3223)
[   31.848362][  T860]
[   31.848362][  T860] the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
[   31.849409][  T860] -> (slock-AF_INET){+.-.}-{3:3} {
[   31.849930][  T860]    HARDIRQ-ON-W at:
[   31.850364][  T860]                     mark_usage (kernel/locking/lockdep.c:4662 (discriminator 1))
[   31.850948][  T860]                     __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.851566][  T860]                     lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.852193][  T860]                     _raw_spin_lock_bh (include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:178)
[   31.852820][  T860]                     __lock_sock_fast (net/core/sock.c:3829)
[   31.853437][  T860]                     udp_destroy_sock (include/net/sock.h:1743 net/ipv4/udp.c:2942)
[   31.854055][  T860]                     sk_common_release (net/core/sock.c:3990)
[   31.854677][  T860]                     udp_lib_close (include/net/udp.h:325)
[   31.855272][  T860]                     inet_release (net/ipv4/af_inet.c:444)
[   31.855864][  T860]                     __sock_release (net/socket.c:663)
[   31.856511][  T860]                     sock_close (net/socket.c:1457)
[   31.857081][  T860]                     __fput (fs/file_table.c:470 (discriminator 1))
[   31.857641][  T860]                     fput_close_sync (fs/file_table.c:574)
[   31.858264][  T860]                     __ia32_sys_close (fs/open.c:1511 (discriminator 1) fs/open.c:1494 (discriminator 1) fs/open.c:1494 (discriminator 1))
[   31.858881][  T860]                     ia32_sys_call (kbuild/obj/consumer/i386-randconfig-2006-20250804/./arch/x86/include/generated/asm/syscalls_32.h:7)
[   31.859496][  T860]                     do_int80_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:259)
[   31.860295][  T860]                     restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   31.861002][  T860]    IN-SOFTIRQ-W at:
[   31.861430][  T860]                     mark_usage (kernel/locking/lockdep.c:4642 (discriminator 1))
[   31.862013][  T860]                     __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.862631][  T860]                     lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.863226][  T860]                     _raw_spin_lock (include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:154)
[   31.863831][  T860]                     tcp_tsq_handler (include/net/sock.h:1809 net/ipv4/tcp_output.c:1279)
[   31.864477][  T860]                     tcp_tsq_workfn (net/ipv4/tcp_output.c:1313)
[   31.865087][  T860]                     process_one_work (include/trace/events/workqueue.h:110 (discriminator 4) include/trace/events/workqueue.h:110 (discriminator 4) kernel/workqueue.c:3281 (discriminator 4))
[   31.865720][  T860]                     process_scheduled_works (kernel/workqueue.c:3359)
[   31.866388][  T860]                     bh_worker (include/linux/list.h:381 (discriminator 2) kernel/workqueue.c:949 (discriminator 2) kernel/workqueue.c:3663 (discriminator 2))
[   31.866957][  T860]                     workqueue_softirq_action (kernel/workqueue.c:3691)
[   31.867632][  T860]                     tasklet_action (kernel/softirq.c:953)
[   31.868239][  T860]                     handle_softirqs (include/trace/events/irq.h:142 (discriminator 4) include/trace/events/irq.h:142 (discriminator 4) kernel/softirq.c:623 (discriminator 4))
[   31.868886][  T860]                     run_ksoftirqd (kernel/softirq.c:479 kernel/softirq.c:1064 kernel/softirq.c:1055)
[   31.869488][  T860]                     smpboot_thread_fn (kernel/smpboot.c:160)
[   31.870133][  T860]                     kthread (kernel/kthread.c:438)
[   31.870698][  T860]                     ret_from_fork (arch/x86/kernel/process.c:164)
[   31.871307][  T860]                     ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[   31.871931][  T860]                     restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   31.872643][  T860]    INITIAL USE at:
[   31.873062][  T860]                    mark_usage (kernel/locking/lockdep.c:4674 (discriminator 1))
[   31.873640][  T860]                    __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.874256][  T860]                    lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.874909][  T860]                    _raw_spin_lock_bh (include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:178)
[   31.875527][  T860]                    __lock_sock_fast (net/core/sock.c:3829)
[   31.876148][  T860]                    udp_destroy_sock (include/net/sock.h:1743 net/ipv4/udp.c:2942)
[   31.876762][  T860]                    sk_common_release (net/core/sock.c:3990)
[   31.877383][  T860]                    udp_lib_close (include/net/udp.h:325)
[   31.877971][  T860]                    inet_release (net/ipv4/af_inet.c:444)
[   31.878562][  T860]                    __sock_release (net/socket.c:663)
[   31.879159][  T860]                    sock_close (net/socket.c:1457)
[   31.879718][  T860]                    __fput (fs/file_table.c:470 (discriminator 1))
[   31.880295][  T860]                    fput_close_sync (fs/file_table.c:574)
[   31.880901][  T860]                    __ia32_sys_close (fs/open.c:1511 (discriminator 1) fs/open.c:1494 (discriminator 1) fs/open.c:1494 (discriminator 1))
[   31.881520][  T860]                    ia32_sys_call (kbuild/obj/consumer/i386-randconfig-2006-20250804/./arch/x86/include/generated/asm/syscalls_32.h:7)
[   31.882127][  T860]                    do_int80_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:259)
[   31.882777][  T860]                    restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   31.883436][  T860]  }
[   31.883736][  T860]  ... key      at: af_family_slock_keys+0x10/0x180
[   31.884527][  T860]
[   31.884527][  T860] the dependencies between the lock to be acquired
[   31.884529][  T860]  and SOFTIRQ-irq-unsafe lock:
[   31.885887][  T860]    -> (vsprintf_restricted_pointer_map-wait-type-assert){+.+.}-{3:3} {
[   31.886729][  T860]       HARDIRQ-ON-W at:
[   31.887185][  T860]                           mark_usage (kernel/locking/lockdep.c:4662 (discriminator 1))
[   31.887813][  T860]                           __lock_acquire (kernel/locking/lockdep.c:5191)
[   31.888488][  T860]                           lock_acquire (kernel/locking/lockdep.c:470 (discriminator 4) kernel/locking/lockdep.c:5870 (discriminator 4) kernel/locking/lockdep.c:5825 (discriminator 4))
[   31.889132][  T860]                           restricted_pointer (lib/vsprintf.c:874)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260322/202603221100.e934e697-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

