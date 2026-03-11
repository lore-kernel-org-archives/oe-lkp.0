Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71F3382E1
	for <oe-lkp@lists.linux.dev>; Wed, 11 Mar 2026 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238470; cv=fail; b=rfx/maTzV0bu4g1PIimTIpa61OW/hB2X2xFAnjwafawGC6aO7OcOUah2pvWDYqtY5etPnQY01gNSPvSozR8aC0Mt+nfzUMr9n5cWKBqrhcuu5+AMgYufDEfH+o4WWOvQ6qbt5+8RGROtGXIlhJZvDaBqcIvy9mxwtUbDtcfasHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238470; c=relaxed/simple;
	bh=TQNkO2+o0QtNX7Xv4JyUmm5mVistP1taHdO2/3QpLUA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ErvbprsJ97zJYGr3tbm97NU+R1n6lCaUULw6tjMZTg2kavlzOwaMgd5CFIaJMUQ+7LyZMeBXR6pt+x66ZRN0KuMTt1SvpjVeNXnR6ACHEalmori/oajgSv/4mOq7UEZJeJvb5+Z93f85oVdVJBeYhn2oGVkF0303gOHJeRHM3ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKsTS5Wo; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKsTS5Wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773238469; x=1804774469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQNkO2+o0QtNX7Xv4JyUmm5mVistP1taHdO2/3QpLUA=;
  b=KKsTS5Wo0Y23ZokZs94dPb0D3BcGzldwItMf6niKkjDyMs3LEg8rFwIo
   PgrW7S6V5IOuDG/92199tnTMirvIo4W+uYLPOV1ND5811Qxgd+lgqC58W
   n37OOxl7DE4XtriL4zRUS2XiBOdqDmgFh1yhbbU5ZN17d0Mn/Lred0pQq
   fRail72w37U9mZ/ZB/YldsELB4o/WEGPeXleG6sTABT7amzpIZ4snw49u
   hzsamiaV04bZ0UPjyQgJjMVZhfEbEmHPuVPIUgQPMrnBEkc+HoLXpWwDV
   gVjyGXssRkj1j5yhCu4bdxH7saD9gTXfBzT/hG6aAAMDTKuUHyi8/LGzj
   g==;
X-CSE-ConnectionGUID: qiHan6l7SGCm3rHDdVubxQ==
X-CSE-MsgGUID: 6Qa+A0VPRtaQk87y+pFPiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74426819"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74426819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:14:28 -0700
X-CSE-ConnectionGUID: oRY0XYvwQzKlQm1UOh1RZw==
X-CSE-MsgGUID: 9LXvYcFCSRGcvrq2R8zAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219728058"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:14:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:14:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 07:14:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5heLwxoQh/oAUXcoZVJaUY5oujFITC8YEYBQOjD8S4AVi3AdIKOhsA0Eh4ZAe0hSRNtlattZMJSyU9k/+lFKZpU35hav3EIxwRs+Lw982zAYVRH341XuEl9sz36g4MtA0PP2wJ2z01avpJi3fo8eBW1F9QVKlvo+0qPmvlkXIqv9h3cPIs9ug2lvSlOhpXv1QL5DNrOre7d/QF/uMAACOtxe8cmvJo1lJaw3hzkHlwko2+jlZcPMOSjQPUhcvCqms8r/O0auT0xtaQB7G3K6a1aRFCSLY/cZqrIGullEM9Jj7K/51YdWorLCE5JLLFz5FHpBtnFsSWw7IpITzxA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rGKH1N0smZY6RkzIzauoTuoMD/bonqbEQo9gE9KFNo=;
 b=IwpCxlgxHcvmWJf8XBKls2NxW4I7sEUfuHQP5nPNa1J92OC7J6ZDNiPQ4weS3zJe2w7EH/TNxPhAWWd+yvBRFHNE0xdI+EG/OgjWCRp4OXD2Sg1VDYJamBDNmiXf//p2vSDFfMa20mayQyv1ybJ7uqe+BBrSUUz6kuHEXNw0J4YSnekeIhVcLJJ2ZF/RxhHI0XWNC1h+Z5XYyj5oaNjPWBjaEQvDK0e68lcLLM6rJ3DOUg3DUOKVnqGkNhqaL7cgEkxaHku9/NVyz5Q5laYbraQYPn2RtNeilJj2UMQa0go2tDUZtl9SeoPuytv8dXinCXBYM+AFnZNMPsSfGZZm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:14:25 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:14:24 +0000
Date: Wed, 11 Mar 2026 22:14:18 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [boqun:rust-sync] [locking]  4a653dbaf6:
 WARNING:inconsistent_lock_state
Message-ID: <202603112101.7a93776e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fedb99e-e957-4084-6923-08de7f787f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: UeDLXRvcxm+5aEVLAumpUCZofwni0SYKBqjPYvLHpYih+0ExsjWhAlJCXRXpqm+W4lHuTkWA277YFcwCsCi/QG9lxQkLC/utVadC4Q3ASeO7HllSoQvXDzO5kJD9m4ju1NXva7J+LqUKp8ThljLLecDNAPDe3QMghVjcAi1mKia7ibq30MM7pHRqN3voIxufXnGEcqa5u52RHFzoKZVAtZEFO4Mc/J/xMeW9Y0Wuv0n2Lz9i8w/tcTm4+DjqIKfv3IojuMUYxgAlL6XtOne1I9wxg7ltodU3dJ9RBcEjjlgfveekNyDGhdge5gvJhvrxQ0IaHaBgM4/bhgxud+npwkG8v4K5e1Yc+TKPPLxoN3SDBRTkx2xrbftO0/FYAUnhxa6/z3a141z4+YqAyetXWJzS+Tjw3W1H+LdDDpTstXEopcJ+l0s5dlyHeyr96g+RJKqddRA5VZ4iqMACLI/rl+Jx5ibMLlPjq/6XMF/4Gqai+nlJBChr8vXe8+vF0oqv60cyMLgppDgdOZzqgSFcKIqtmHbBio8FDoXpeULcd3E0QL8HmVN9dzZmy+iEWeqDIOj7/CVzpzxwZDYK0AcqZkk+Y6+KFrk8Ukku+nhXguk73hwuEclpyJmSakBbNBieunwufTJWLTQnMQ6ZiePd89GQSTgBr9gFRxR+axB20zfTUklbZYI9VAKxNhMHXUBKHWXJlj+fl4n8TB903yKONQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRWOGG7H9bHPEeHErWMVmS9UvFu0kVcgeZrZ14QG/1+vONtdFs7Hp9pv6Rem?=
 =?us-ascii?Q?vPJM3pqkTtXp2yWq3xr4BygoK9qZm6dqp3sTtbSWIOh5dW3KSSK/DIfPraNJ?=
 =?us-ascii?Q?2ulSPLNDufd0yOyxs4g43kmul3Vk1HK61T8G8OlFmad11XmekRvG0hShbUBx?=
 =?us-ascii?Q?1WkUfaGVKEY+aMOyx8NX7p1AIflzK5CQof4T5sjVApUf2vW6T8TkEVhax7zD?=
 =?us-ascii?Q?0dx+pffUsEMVJdfpgrdX9xVHgNKDhCcaEQE+rz2C9tcbJgllAoBSnMN9FjUq?=
 =?us-ascii?Q?J/D0VYkROh8Q0xTfL96BCr94FqrK4rqtabNZ/NpHKA8TVd6ZihCvo1Xvj64M?=
 =?us-ascii?Q?fBNl1BZwRGRc6evPthJt0BU68betDmF3mZbTwljx6UIOD03X4N0b/jXjHbSg?=
 =?us-ascii?Q?nLyMbtKVQEQGjxX/hcRJl5crkqSlkQ5msGeEfZ+iCMIl7bFBoCplovenm8Y6?=
 =?us-ascii?Q?6V31FL7Ngbr8Vr3Np7XOlmolYT4XHNrSParPp0th29zf7bUxru5/4gefzpQr?=
 =?us-ascii?Q?4XAed2FJ/jb7+uLD2Rkyplzl3wnVWRmEP7uUomFW8gwea2UbsmSzlYvrF8UV?=
 =?us-ascii?Q?v04xK3nn8qKawzkIO/bakMyDKNNmW68NlC+s3ClGCrGX6polEvC7t89G5xCl?=
 =?us-ascii?Q?5UaUc38NdGl04KAsyiVFphPiggEcmRoXzR7WQ6mqQy8PANinHMY3UJnap+Un?=
 =?us-ascii?Q?vH9N/n0Mp+HT/hIEvHfcfsY1Si/PYLD0r/NWiPM4aydhd9BZ+Ojc1OfIm2DU?=
 =?us-ascii?Q?oWvzcwSo3BbYvZHSObJX21H6wdndh4R486ro/lUAiddki530DVuLo1u4QoPN?=
 =?us-ascii?Q?kGhIz4DWkxTS685Fnjz/CAX0nWEVL/UyAqb1wTMbFykpJPhtXiNUpXUx/BAH?=
 =?us-ascii?Q?T0vmkPcPzDezQnFwfGWTA7TDP3dWiDohRC4jL4ybcuf8sTzsAqGaENfEJZ7o?=
 =?us-ascii?Q?nD4ZeqT7bcl56V9fx77s5MzzEWCotjZlpbVxfqP1OIc7RIf1aY9e43mW83iv?=
 =?us-ascii?Q?lxhkpWZlkwZ7XjB6ITreLYSiqfPFqAOgU4zVgksEOFZ3nczbbPPV1PZ6eBYn?=
 =?us-ascii?Q?zkJBgmCogSfU0tUFvYS6hZWnQ4EAiYhUIeZo34c3qFWtzdzYNTu+PkZl8G39?=
 =?us-ascii?Q?BPSAVIxgE4b98DF9w6NrB3kkYKuQSkBHIHCdtHtS8R0YqZt7rExH71qyWPMT?=
 =?us-ascii?Q?DQyKhr7kWFIN/uEzGYuLWrOC9Oczn8M9tzLRs4nTU5njy5GvpySfOoC/DWhZ?=
 =?us-ascii?Q?cFCu3HS9ISrfWIFyLH7m3fBDQKbjUszTWsjqimzUsjWYpdcx5MFzkIqhPYFO?=
 =?us-ascii?Q?YPsrPuc6yDryzFiYhRRriZ48b2Y5wvMzCxI/VaAJ7MKe5IX8T8HeWNjs7Azx?=
 =?us-ascii?Q?WbFInsiKhIt0CsfBQnKpXHSOInQliuizRRU5aoJ00rtqvKTie+Q/iJN/1YPz?=
 =?us-ascii?Q?wOOITWdloh1V1Z/lux+r403MsRv34WJvymhkGfGeirK2YhEHFw8nrhlyovC9?=
 =?us-ascii?Q?Wm9/pROo9/l178sLHpg3uSmQSwHUsoiL9sFD6bP7MDRe2GYWGen5PZ61BupH?=
 =?us-ascii?Q?6gE7dNIkrUcKjB7indNMtqAnpA8+D0iGtsRNT7mpOP98sAX/EUVYSwGQe+7n?=
 =?us-ascii?Q?B2GRpT7Mnt7bS5+DK9KxR8TSYQ4xZkhcUDP+Hw0M4EYDZABeGLrtEi2WgQr8?=
 =?us-ascii?Q?TDsTiPsuq3EBYNv7hfHJODQCrM6e4tlUF2nBFTvNpy8bH1Rjy0w6bc4122fK?=
 =?us-ascii?Q?Y6J3x7jfPQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QEHJlmXoTRtedTKKuKrd4uU4TtZIT3+zHwF3fe4BWH0WE0k9d8WKpAkcZTD1K+2B4MatY6Yp3P9JXNCZ1IA1Cu6trk96bvfL8P00E1ZiXNEMeti+0/j3jyb3gA/qLQwI/t0WRRMUlyZpVpaGXnDpmLLHcSxbtXf4PpZ6VJVeLoTDYtVfrFz1YlIQ7zt2av3sCAdRnSiEZhxyKrdkwd0RvWILMEKjhjn9HkeZrEaUw5Bp7yqdf40OJLlX1TUPvo/jLeVhEUhsKr4FDHqA/BID0mVpgolGgazRiKic4TwSaFuBKqWUUfUR362RZrwXQEVVWVX6rFx1k5zv2p+6a6esZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fedb99e-e957-4084-6923-08de7f787f26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:14:24.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkf6faOJqeD4IQ7ruA+xOs+D8p2R5oqgdb4VKzmxPqHreDLIzhXcQ7I7//OLehcEkUEiCQ7QUOOtSKREymTbtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: 4a653dbaf6f3a8c950a72e4b78e93576e1916381 ("locking: Switch to _irq_{disable,enable}() variants in cleanup guards")
https://git.kernel.org/cgit/linux/kernel/git/boqun/linux.git rust-sync

in testcase: rcuscale
version: 
with following parameters:

	runtime: 300s
	scale_type: tasks-tracing



config: i386-randconfig-016-20260307
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603112101.7a93776e-lkp@intel.com



[  602.666894][    C0] WARNING: inconsistent lock state
[  602.667841][    C0] 7.0.0-rc1-00024-g4a653dbaf6f3 #1 Not tainted
[  602.668980][    C0] --------------------------------
[  602.669956][    C0] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[  602.671224][    C0] rb_consumer/46 [HC0[0]:SC1[1]:HE1:SE0] takes:
[  602.672305][    C0] ba254794 (&p->pi_lock){?.-.}-{2:2}, at: try_to_wake_up (kernel/sched/core.c:3946 (discriminator 1) kernel/sched/core.c:4132 (discriminator 1))
[  602.674764][    C0] {IN-HARDIRQ-W} state was registered at:
[  602.675825][    C0] irq event stamp: 133462036
[  602.676720][    C0] hardirqs last  enabled at (133462036): _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 include/linux/spinlock_api_smp.h:207 kernel/locking/spinlock.c:223)
[  602.678511][    C0] hardirqs last disabled at (133462035): _raw_spin_lock_irq (include/linux/spinlock_api_smp.h:153 (discriminator 1) kernel/locking/spinlock.c:183 (discriminator 1))
[  602.684515][    C0] softirqs last  enabled at (133457152): handle_softirqs (kernel/softirq.c:474 (discriminator 2) kernel/softirq.c:655 (discriminator 2))
[  602.686374][    C0] softirqs last disabled at (133462033): __do_softirq (kernel/softirq.c:662)
[  602.687932][    C0]
[  602.687932][    C0] other info that might help us debug this:
[  602.689461][    C0]  Possible unsafe locking scenario:
[  602.689461][    C0]
[  602.690790][    C0]        CPU0
[  602.691385][    C0]        ----
[  602.692023][    C0]   lock(&p->pi_lock);
[  602.692794][    C0]   <Interrupt>
[  602.693590][    C0]     lock(&p->pi_lock);
[  602.694428][    C0]
[  602.694428][    C0]  *** DEADLOCK ***
[  602.694428][    C0]
[  602.696023][    C0] 1 lock held by rb_consumer/46:
[  602.696998][    C0]  #0: 446e1f04 ((&timer.timer)){+.-.}-{0:0}, at: call_timer_fn (kernel/time/timer.c:1745)
[  602.698784][    C0]
[  602.698784][    C0] stack backtrace:
[  602.699847][    C0] CPU: 0 UID: 0 PID: 46 Comm: rb_consumer Not tainted 7.0.0-rc1-00024-g4a653dbaf6f3 #1 PREEMPT(lazy)
[  602.699855][    C0] Call Trace:
[  602.699858][    C0]  <SOFTIRQ>
[  602.699860][    C0]  ? show_stack (arch/x86/kernel/dumpstack.c:338)
[  602.699871][    C0]  ? dump_stack_lvl (lib/dump_stack.c:122)
[  602.699877][    C0]  ? dump_stack (lib/dump_stack.c:130)
[  602.699881][    C0]  ? print_usage_bug+0x266/0x380
[  602.699890][    C0]  ? mark_lock_irq (kernel/locking/lockdep.c:4010 (discriminator 1) kernel/locking/lockdep.c:4056 (discriminator 1) kernel/locking/lockdep.c:4267 (discriminator 1))
[  602.699895][    C0]  ? save_trace (kernel/locking/lockdep.c:557 (discriminator 3) kernel/locking/lockdep.c:594 (discriminator 3))
[  602.699907][    C0]  ? mark_lock (kernel/locking/lockdep.c:4753)
[  602.699912][    C0]  ? mark_usage (kernel/locking/lockdep.c:4662 (discriminator 1))
[  602.699915][    C0]  ? __lock_acquire (kernel/locking/lockdep.c:5191 (discriminator 1))
[  602.699922][    C0]  ? lock_acquire (include/linux/srcutree.h:373 include/linux/srcu.h:385 include/linux/srcu.h:634 include/trace/events/lock.h:24 include/trace/events/lock.h:24 kernel/locking/lockdep.c:5831)
[  602.699926][    C0]  ? try_to_wake_up (kernel/sched/core.c:3946 (discriminator 1) kernel/sched/core.c:4132 (discriminator 1))
[  602.699933][    C0]  ? __lock_acquire (kernel/locking/lockdep.c:5237 (discriminator 1))
[  602.699938][    C0]  ? debug_smp_processor_id (lib/smp_processor_id.c:59)
[  602.699945][    C0]  ? lock_acquire (kernel/locking/lockdep.c:5872)
[  602.699949][    C0]  ? try_to_wake_up (kernel/sched/core.c:3946 (discriminator 1) kernel/sched/core.c:4132 (discriminator 1))
[  602.699953][    C0]  ? call_timer_fn (kernel/time/timer.c:1745)
[  602.699959][    C0]  ? _raw_spin_lock_irq_disable (include/linux/spinlock_api_smp.h:163 kernel/locking/spinlock.c:191)
[  602.699965][    C0]  ? try_to_wake_up (kernel/sched/core.c:3946 (discriminator 1) kernel/sched/core.c:4132 (discriminator 1))
[  602.699970][    C0]  ? try_to_wake_up (kernel/sched/core.c:3946 (discriminator 1) kernel/sched/core.c:4132 (discriminator 1))
[  602.699973][    C0]  ? debug_smp_processor_id (lib/smp_processor_id.c:59)
[  602.699979][    C0]  ? lock_acquire (kernel/locking/lockdep.c:5872)
[  602.699984][    C0]  ? hrtimers_cpu_dying (kernel/time/sleep_timeout.c:24)
[  602.699988][    C0]  ? wake_up_process (kernel/sched/core.c:4375)
[  602.699993][    C0]  ? process_timeout (kernel/time/sleep_timeout.c:28)
[  602.699996][    C0]  ? call_timer_fn (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/timer.h:127 kernel/time/timer.c:1749)
[  602.700002][    C0]  ? call_timer_fn (kernel/time/timer.c:1745)
[  602.700006][    C0]  ? hrtimers_cpu_dying (kernel/time/sleep_timeout.c:24)
[  602.700012][    C0]  ? __run_timers (kernel/time/timer.c:1800 kernel/time/timer.c:2373)
[  602.700017][    C0]  ? hrtimers_cpu_dying (kernel/time/sleep_timeout.c:24)
[  602.700025][    C0]  ? run_timer_base (kernel/time/timer.c:2386 kernel/time/timer.c:2377 kernel/time/timer.c:2394)
[  602.700030][    C0]  ? run_timer_softirq (kernel/time/timer.c:2405)
[  602.700035][    C0]  ? handle_softirqs (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/irq.h:142 kernel/softirq.c:628)
[  602.700043][    C0]  ? __kprobes_text_end (kernel/softirq.c:660)
[  602.700048][    C0]  ? __do_softirq (kernel/softirq.c:662)
[  602.700052][    C0]  ? do_softirq_own_stack (arch/x86/kernel/irq_32.c:56 arch/x86/kernel/irq_32.c:144)
[  602.700057][    C0]  </SOFTIRQ>
[  602.700060][    C0]  ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1056)
[  602.700065][    C0]  ? irq_exit_rcu (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 kernel/softirq.c:730 kernel/softirq.c:744)
[  602.700069][    C0]  ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1056 (discriminator 3))
[  602.700074][    C0]  ? handle_exception (arch/x86/entry/entry_32.S:1048)
[  602.700079][    C0]  ? __alloc_frozen_pages_noprof (mm/page_alloc.c:3797 (discriminator 1) mm/page_alloc.c:5028 (discriminator 1) mm/page_alloc.c:5239 (discriminator 1))
[  602.700083][    C0]  ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1056)
[  602.700088][    C0]  ? _raw_spin_lock_irq_disable (arch/x86/include/asm/preempt.h:90 include/linux/interrupt_rc.h:32 include/linux/spinlock_api_smp.h:161 kernel/locking/spinlock.c:191)
[  602.700093][    C0]  ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1056)
[  602.700097][    C0]  ? _raw_spin_lock_irq_disable (arch/x86/include/asm/preempt.h:90 include/linux/interrupt_rc.h:32 include/linux/spinlock_api_smp.h:161 kernel/locking/spinlock.c:191)
[  602.700102][    C0]  ? debug_smp_processor_id (lib/smp_processor_id.c:59)
[  602.700106][    C0]  ? ring_buffer_alloc_read_page (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 kernel/trace/ring_buffer.c:6527)
[  602.700111][    C0]  ? ring_buffer_read_page (kernel/trace/ring_buffer.c:6660)
[  602.700115][    C0]  ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4472 (discriminator 4))
[  602.700120][    C0]  ? ring_buffer_alloc_read_page (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 kernel/trace/ring_buffer.c:6527)
[  602.700124][    C0]  ? ring_buffer_alloc_read_page (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 kernel/trace/ring_buffer.c:6527)
[  602.700132][    C0]  ? read_page (kernel/trace/ring_buffer_benchmark.c:123)
[  602.700139][    C0]  ? ring_buffer_consumer (kernel/trace/ring_buffer_benchmark.c:209)
[  602.700144][    C0]  ? complete (kernel/sched/completion.c:53)
[  602.700148][    C0]  ? ring_buffer_consumer_thread (kernel/trace/ring_buffer_benchmark.c:390 (discriminator 1))
[  602.700153][    C0]  ? kthread (kernel/kthread.c:467)
[  602.700160][    C0]  ? ring_buffer_producer (kernel/trace/ring_buffer_benchmark.c:384)
[  602.700164][    C0]  ? kthread_complete_and_exit (kernel/kthread.c:412)
[  602.700170][    C0]  ? ret_from_fork (arch/x86/kernel/process.c:164)
[  602.700174][    C0]  ? kthread_complete_and_exit (kernel/kthread.c:412)
[  602.700179][    C0]  ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[  602.700204][    C0]  ? entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[  833.753184][  T247] 2026-03-08 15:15:06 rmmod rcuscale
[  833.753202][  T247]
[  833.755451][  T873] tasks-tracing-torture: Stopping rcu_scale_reader task
[  833.756913][  T446] tasks-tracing-torture: rcu_scale_reader is stopping
[  833.760360][  T448] tasks-tracing-torture: rcu_scale_reader is stopping
[  833.766344][  T452] tasks-tracing-torture: rcu_scale_writer is stopping
[  833.769461][  T454] tasks-tracing-torture: rcu_scale_writer is stopping
[  833.770550][  T873] tasks-tracing-torture: Stopping rcu_scale_reader task


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260311/202603112101.7a93776e-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

