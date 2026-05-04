Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F85A2D238F
	for <oe-lkp@lists.linux.dev>; Mon,  4 May 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882117; cv=fail; b=pj9fC0ARYYGYo/jRQVGukNOwIPYb4A1ByqtLO+zGqxaJm9mb1ucAwPnbyk4S0G4kKEzt8mQkRWQzZ4PR+ZewZv5ie+POqkgaGE0T20nXcm3PnmKUMOXkSqfSIc9O5LRFA/Vg0cBeR3CGVrjYkZPpMIJN8Kb1ker2AOgBz80boto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882117; c=relaxed/simple;
	bh=kbJ8vJtknnRplVAcFxW0V3dKWR1LjDjqT25vF7QbPTM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=F+PmOWZ3IgdZCDsckzRyJRw02ZX9upZC/9hnW9Bcl79okkUHgEdh3l2U7ISKuQv8DmO1US23jwZf9cf58Re/F+hFpdSS17lKho1tCfhvRcJr+vp8lCmLkPyhzWdei1OCJdJEdcOnOlEEQZycKpd03XWB/hV17prIVx7zWZn9WhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFC/XTKP; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFC/XTKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777882116; x=1809418116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbJ8vJtknnRplVAcFxW0V3dKWR1LjDjqT25vF7QbPTM=;
  b=HFC/XTKP0INID0HoE2Ujhp3twA/UHafMkHnlJXifCdFkSmaJcX3XIips
   ixaKJ/RI85JsF0fc7Qc6RpdZ6Cwv8dsFia6yWhFMYVnsGB7N/205bRQCB
   OY/6SgDr98cczD8X0Pq93VMx5R9lNooHVVLcCV5/p4SbkWpWa73I3GGqH
   r84477zwOcXHqYgkrhCYTOYrl08PUL1+Uulw0SGlxH6oG0XQZtavVA4mY
   GHhVggDm1epYqEklp9GivkdyMCg2fZO2B5RozUlymeggUQymERB1qsSbH
   nI+FbdNx/rDxxTm5nCO9YPiPKXqMGbubx+s8tFIeMF0lx7TPaJcdUg39g
   Q==;
X-CSE-ConnectionGUID: RBJGBEQ0RQekt6NnHgFBYw==
X-CSE-MsgGUID: XXMWCTbrQx23sru2YU67hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78668566"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="xz'341?scan'341,208,341";a="78668566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:08:35 -0700
X-CSE-ConnectionGUID: r6poR3CMRtmMkOSUGRFxyQ==
X-CSE-MsgGUID: cEJlvAr5QHuN2vDvfgo6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="xz'341?scan'341,208,341";a="232297416"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:08:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:08:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 01:08:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXeC12q4LGG+21LiLZeUE59ScB8BTo5pdxfuljG0pXnZtZLvhw92GBKw4ju9v/t/TpfctcvH7Sbm6pOnBC3T3o4UVA7iFQ2+l/HJqoilPkak7/LMRfPQmh4yruklUHXBqKEiN54ZfRGwtCD2PI+2TUszoQ45Rh0qYROb3SpOoQEjxGdjAEgZrwK+dBAFKBvZ16qCFH3fqHlqtmhEAl51PyXk/6UaKxZMUm44Cz60ZetnF3IrQi6rrjA81enbhamrQIpqEnAofzdrDbxvKgBl3/4ve5b3t3vBlDze6Z3n77r4YmOyAHinZLeWoL2hxwwaNpa1/WyI/cmltf6zgzcD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs0+BUvNfd5ePYtwUIU6OnLwoZJHNRutW10g/SX7eKQ=;
 b=Fik8MDAsVXniioyGzKvf3NPOJVlhSmellvxZHUu61x8r2lVoVRt3kgiYVi9S3tN97mqbgYEqrtcR2NsCnHVwLJxP1KDw2sU1XQMeHXammq/ZAgeV11ZlF9Mieg7W26JO7XEO0erQ0clgwuPuEgiNz5XGb7WlZKJLjVMWYHvLivkeW8ABjRBN0a1KQktFVMaqubztcjR+PyRrmmVWnoN3QwlmGjwwWYWeIdnQoJKkvGh86fz1neLYhZL+AwZiyzpeV5ueDU80PG+WdO+aW3HMpc30Y3XFzZ7GR64j54NIrMFn/GL1oAwDobYvCRs/OkMy7tIj98BaaLxN5DdAWydzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 08:08:24 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9870.020; Mon, 4 May 2026
 08:08:24 +0000
Date: Mon, 4 May 2026 16:08:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Oleg Nesterov <oleg@redhat.com>, <oliver.sang@intel.com>
Subject: [linus:master] [clone]  24baca56fa:
 dmesg.INFO:task_blocked_for_more_than#seconds
Message-ID: <202604301500.5a8b946c-lkp@intel.com>
Content-Type: multipart/mixed; boundary="3vrtR5YDSA/KUDY2"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6fe981-3630-4c99-76c0-08dea9b45066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|6049299003|4053099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: yEkJzRfLbTPcv0GrMRqXUcpDVibR07STfXaeVQ8UozC7vVer2VHzBiojXkY8YzVNQ3c+3I2Mu+gfnx1hrkD/BYjkjE+2ddEd/lRAqaeqEiMHpZsR1EIfgWjcrKRICZm1DojwMeMkbQ78S+GKmRPWfrpKmaxw6EYKer4VxSpzagiRDtJmHBqLy3/v6lGXnFEKAYqSvkj46gipqtTjqnLp9NHgEaDaW+Qm3/UxjozELwgCXoSXaC3iIgG54WwKTQQF4cDKg960XXgrHYOZXyEiJ4Z0NAGW1Qs3KcTmfeIV5YjuFo3hdx0UT4pgfyQxFlFIqKntUWIp3bPXWfYPsTAfC2ULdUseB82f17lDWmV1KE13AspFgIeLTCJFKSm+l7GQLT114BfbeiHPJyunj51X0jI4UCasQlVfldpid1V2F4kbiPp7XaMNk/4d/1JWEoF97tAaxqWXy5fQUcYgkPH6umS7CZ1fN5RkXGI7mOY3j4WSCnohXXVDjzK+986d7Rg5+sHNNy7LSUG4DE/BW1k2cgVRr7FM3lKi29OBK/VuVjTC7T2f3nlD3bUhoYs2wD7B3RfXcX+qb5PY5XI8BUGQJruYbU3s0E35/i6alV0BanmCbj1AXP+asuzZcyzSUd2y4h5xHvxs+xVMmD54DPqwaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6049299003)(4053099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j0WBA2opqFYxB/AOacN7ZO7wjOgvXtNbAQfjTT6Aoy76ZUZTuCaEk/aegrRW?=
 =?us-ascii?Q?8t0WmE+5eP2cAU4TUuKyHD8SKAPfhwn9EcJPQL4Dgvp5hd8np/nh9HSRmZUg?=
 =?us-ascii?Q?sgFc86Tlk9Pe8GkSYB1Kc8f04XUXkqFbQc55cu+LzcgbUXH9eqCS3BU4l/oe?=
 =?us-ascii?Q?0lkvqLkIyVlTv4gmbPJKhydUR211KiXulQjv3af6A46y1vjUJUMXqLspkvsM?=
 =?us-ascii?Q?K6Le9gNP+nxKzZTGWyxKIe/04jtNMVVUcqVbDXQ6ryg433eD9aA8K8RU+FsQ?=
 =?us-ascii?Q?UklHt5/qUNzBrx5p1oLsjImSVYmya6N5HIOfzxvxF1BDefVdCOqJBL8kx+8L?=
 =?us-ascii?Q?f/GK6UGNrAVY/3p8/VAgpKIdMi7D9GDvCcS0NoS2rgHjIds2bDbdmIm3mGK+?=
 =?us-ascii?Q?xN/yuFNj52cHZQ+H22IX3W6QuZ5QrM5zlXqQBPyrOnvH+C/JO/+YuW5dzzMx?=
 =?us-ascii?Q?X2RpNqJtFYdqtHPx8SHt5YsFn2i1QVXkKuUsDH5xGHw6RnbyDAu5nJkjqQJj?=
 =?us-ascii?Q?4jBE2cW+s6gMD9u6nvlIdPB1Wcdp4ZQ3uVuLPkSBhjqoJNsfhN3t7/W1v3K3?=
 =?us-ascii?Q?O4zNgWvBi+OmMBAdipiuibEA7pA6z8oXe5FI7C7Vx5a5JpnsKOAlRd73ee5V?=
 =?us-ascii?Q?EbScVOJHZUtuJY47aRQuxDMuN3FN/yAGeWfjal247iAMn+/Ud1W5rON2LGDX?=
 =?us-ascii?Q?VUHkhADe1T/NhBUowh7BtN2KTmlc/rdojKAxHlB3MySccGvjkCKmnaBBfbkU?=
 =?us-ascii?Q?wiDGz3CffOuaZ8nYnKMA8sTaBe01irFZpPIRznmvzIKQ+6dEyX/uLbtYnNtX?=
 =?us-ascii?Q?dOMLcE9qhq/Wq8vyqhPT6NW4cUvpw9+4ZW0H1oIl4cZak779fEWE0J2s5Q9N?=
 =?us-ascii?Q?IlIvhNu+BCwBFjqMH70YoJjAA0KXzjzsWNr5G9AD3Blb8FRdr08oM6/bYs2H?=
 =?us-ascii?Q?7+zpGOTxsNB3hCUIaldTJ7+6XsUr81CFPAI/p2ts1AlwcnWQdlAN0TX/1/5J?=
 =?us-ascii?Q?6Xzg6ho/M5EpHDhdo0iM5qMf1WJvhDQIi1RYQlsOnA2IJT0HjnuJt6IvwQxh?=
 =?us-ascii?Q?p1U0PcYcJQQOFCA75sqbnd/4nqAnxDgkgCLHO1wOPpopAj1FV0W0PvvRhb6h?=
 =?us-ascii?Q?AcXRTMi+EK4HvrAiVJ1YTti1dEfgSDeMqbqEdC10cBM+A0BSDL2mVjQLv1Xa?=
 =?us-ascii?Q?FIA4fmBsFjnhXmdyEOuYj0G9fQEsqLWo3tfkWRRbRuAKb+JduNV20HmVlclA?=
 =?us-ascii?Q?hdEXL8HKVyeC5zJdC6JeeTp2mHXl9FL7RQoxAj+/HFYsvrfe5aHz4Gb/gNo4?=
 =?us-ascii?Q?W1RTDwKAnDwzKsM60m/ZyLFVs1Cv8Hz3r4EtSLiaKCQp5ZeKlHaJP/2uSFJ4?=
 =?us-ascii?Q?+TIZeX/IrxMAzwvB9TgXhj8rMcGtrA5Sk5PKv/+LSAkzzm2fx/IxZgbzRfjT?=
 =?us-ascii?Q?ckEMhFzoHtfDJp0o9JeM+dQSczmgjB+x5Q7lGkvfDQiAkZc/a2AGI3vO/4M0?=
 =?us-ascii?Q?dc+X+a4MSF+RjOTzWeszkY1R2lcrjhJuRJe/g+bFUGTRsr9XT0DoXEGWdoQd?=
 =?us-ascii?Q?1hRGPSjzSvYxCJCmPbOkQLm1Z6wR31rH6DhizDwjjVT49qQuxzbXoeP4kEbU?=
 =?us-ascii?Q?VAqDj+0/hUq8VfR3k54/uMs0qYSa3+Oq8adWJYhOKBe7y5A8b6PlWufR3XRK?=
 =?us-ascii?Q?uLj/ZIWh6oL82Azj2ARNT0QwFeZLlicBIE7pRlzXD89NZBd/RfMTQGkwAz+F?=
 =?us-ascii?Q?ofQ3dM9kSQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: unfY6ddeYKaobiQ7jD0L4uKni4l7N8z4UJ35HCLRYgFHkuQf3hcdzblJ6j9bEa/8qiMTOqL2FzyYkdfu/Jzb2qJywnfX9UWDpyzRSAffnP2gQ56uM/0oOtI8WduQOWauNUR3/fCfTlqkDNvO3YPNzt4AtL9ILRC/MKan8ZHh2Aa3PStSPfpRDR4WrcXgodqU061NTlt8UVqhWMvFMA8DqehDX7KLh9UrYXAZ/ViNerJdBeGP1ZjGa9ZgddgPAOOyLXZuFu67D/1AxAiO7b5hO19n9qVMJt5tCkPM8htAz2utLsSiZzliwtaame9ZOyEaoq+BKSrLf5JGx0/fVD1IuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6fe981-3630-4c99-76c0-08dea9b45066
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 08:08:24.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlBRpUg4CKY2vJqJswEcmxUVN5LS2z6N8aNYDHspZbJXIotUaezTcERZDgQ3OdesYu2EjCc+MVBmE2c6mi2snA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
X-OriginatorOrg: intel.com

--3vrtR5YDSA/KUDY2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

for this change, we reported
"[linux-next:master] [clone]  4a34da4356: BUG:kernel_hang_in_boot_stage"
in
https://lore.kernel.org/all/202603161449.201e2f5f-lkp@intel.com/

but at that time, we cannot supply more useful information.

since now the commit is in mainline, we made more tests.
we still observed BUG:kernel_hang_in_boot_stage issues we reported, and
we also found dmesg.BUG:workqueue_lockup-pool and
dmesg.INFO:task_blocked_for_more_than#seconds issues.
all these issues are clean on parent.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb-i386/boot/debian-11.1-i386-20220923.cgz/i386-randconfig-2006-20250804/gcc-14/1

12ae2c81b21cfaa1 24baca56fafc33d4fb77cd9858a
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :500         14%          70:500   dmesg.BUG:kernel_hang_in_boot_stage
           :500          6%          31:500   dmesg.BUG:workqueue_lockup-pool
           :500         12%          61:500   dmesg.INFO:task_blocked_for_more_than#seconds


since our bot failed to upload correct dmesg to [1], I attached one dmesg
for dmesg.INFO:task_blocked_for_more_than#seconds issue.

one further information is we only captured issue on this i386 randconfig,
we didn't see the issues from x86_64 configs so far.

if you want more informations, please kindly let us know. thanks a lot!

below is full report just FYI.



kernel test robot noticed "dmesg.INFO:task_blocked_for_more_than#seconds" on:

commit: 24baca56fafc33d4fb77cd9858a48c734183cb22 ("clone: add CLONE_NNP")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      dca922e019dd758b4c1b4bec8f1d509efddeaab4]
[test failed on linux-next/master 9974969c14031a097d6b45bcb7a06bb4aa525c40]

in testcase: boot

config: i386-randconfig-2006-20250804
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202604301500.5a8b946c-lkp@intel.com


(from attached dmesg)
[   80.466242][    C0] random: crng init done
[  110.868986][    C0] CE: hpet increased min_delta_ns to 56952 nsec
[  983.071602][   T24] INFO: task kworker/u4:1:45 blocked for more than 491 seconds.
[  983.269621][   T24]       Not tainted 7.0.0-rc1+ #1
[  983.271929][   T24] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  983.665248][   T24] task:kworker/u4:1    state:D stack:0     pid:45    tgid:45    ppid:25     task_flags:0x8040 flags:0x00080000
[  983.673000][   T24] Call Trace:
[  984.071216][   T24]  __schedule+0x53e/0x590
[  984.074774][   T24]  ? sched_submit_work+0x61/0x80
[  984.271098][   T24]  schedule+0x39/0x50
[  984.273895][   T24]  async_synchronize_cookie_domain+0x9f/0x120
[  984.568119][   T24]  ? swake_up_all+0xa0/0xa0
[  984.571275][   T24]  wait_for_initramfs+0x43/0x50
[  984.574087][   T24]  call_usermodehelper_exec_async+0xb6/0xf0
[  984.665708][   T24]  ? umh_complete+0x20/0x20
[  985.573782][   T24]  ret_from_fork+0x1a/0x1e0
[  985.973044][   T24]  ? umh_complete+0x20/0x20
[  986.173520][   T24]  ret_from_fork_asm+0x12/0x20
[  986.570161][   T24]  entry_INT80_32+0x124/0x124
[  986.672813][   T24] 
[  986.672813][   T24] Showing all locks held in the system:
[  986.765370][   T24] 4 locks held by kworker/u4:0/12:
[  986.769896][   T24] 1 lock held by khungtaskd/24:
[  986.772774][   T24]  #0: b22ac65c (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x0/0x30
[  986.973336][   T24] 2 locks held by kworker/u4:1/25:
[  987.566505][   T24]  #0: b30d18c0 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x196/0x3d0
[  987.573333][   T24]  #1: b33b1f18 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x1b9/0x3d0
[  987.970427][   T24] 
[  987.974302][   T24] =============================================
[  987.974302][   T24] 
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260430/202604301500.5a8b946c-lkp@intel.com [1]


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--3vrtR5YDSA/KUDY2
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
AARZWg==

--3vrtR5YDSA/KUDY2--
