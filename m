Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A222BEC3F
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jun 2026 04:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709194; cv=fail; b=lZ9zgczZqgS9kLu6VzdU00IgSr+FNmP3xDHEs4nuWI8qBsLYP7G71gtW6OJ4Q2TPtGJ7a9Bz6fRJxX8pX/KEA/GfKvvBWCw+sQBYwaN3eLkGRTAnpDa3XAM663EE4iagkHU5WSzh9A1/SyDsnyXOQw2ebDm9mBZhgjhnaPEKUX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709194; c=relaxed/simple;
	bh=t+U8XlJP86hvDLfENssio78RGqjtmxwOMZesrjrPbcc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eMz6ch9Z/unbGHYsFWtyxpkXgjN07/xiS830VzjGGOhaay8fWonY7H++zxkzwck4yM+TcApfGAiyzARch3he+42A5SHT8DizX08wB6QdRC8O9EdNSlka8aQOCnqpVNFL6ViItXGv1sbH95cQEqlpzMZF0+FGAjtNwqXLZcra2aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iib/Cp5W; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iib/Cp5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782709192; x=1814245192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+U8XlJP86hvDLfENssio78RGqjtmxwOMZesrjrPbcc=;
  b=Iib/Cp5WYHcEuZLgZDFrnxKwIeabif7YF5dBVDSzF/tPijsMesfK6t5Y
   Q6K1MkWaDmEXi65Dek9+BuEFFe9nYLcDqX4sn3HCqlwwYJabqr55XW749
   dT/Eac/9w1tWfXCkbojRX5x/Dtw7xYfomqWNmEvO62selUFLVr/67yV0Q
   q1HPEm6ZhNNQV/PDMsW0KcWp4Xu53QMZ+pkJtSE61fQnAN19xUhZxk5P4
   5rphULZX0gw+XV7j4mGGmGO0E6l2wmmMcSUJPlAxRrgfcmQLOj0OoaPEN
   XLuG5Ct2kqaRXVOODj+EH/1//ksgJZqVFuTesTsCCJdvSE3Z30tlPm4Qg
   Q==;
X-CSE-ConnectionGUID: gpP3AMmITLyNKEGSgIYBtQ==
X-CSE-MsgGUID: OxYkDVt0Rm2xa+lrqozOSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="108930132"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="xz'341?scan'341,208,341";a="108930132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 21:59:50 -0700
X-CSE-ConnectionGUID: WAFyKAjBSnySQgASPu9H/w==
X-CSE-MsgGUID: bX1xWjDiRBK/gNRiA1ziJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="xz'341?scan'341,208,341";a="275075818"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 21:59:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 28 Jun 2026 21:59:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 28 Jun 2026 21:59:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 28 Jun 2026 21:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiuNnvfl9H4ZiO7/R+qJ1a9nL8i56Dzy0nrnj1BySED8GvugM1Tdju4TelJjcC+GPgXHiDcQJrFPuraOnAWyz+FrX3B98Jgf/b8OAoqqbm0s2sik2GbP2LZwV4RBVcen28VTkYJ1iznCZTD4EMfB8cBl+Na0UMXhztT/piYWy5IcFXwANc0WSp3YU6c7a81RJLTP11AAiCTJNWJ/o51qemvNScz1vBWVJ1GbBTMpUhhYDQmQ9BwSfViiIjlvH80zEj3sD9kK7lSYasLX0vUodkEJmq9hTp2uT1bs/XVFpJapbFEIjm7bOdboRQm7QUYP5TdA2H81JpXtfX8hv4N9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=166den8Qlo+Vw5F0iGPRPG/MCVn5TmTMWcRiifYwu/E=;
 b=Jkr//5EKRGI6JSG7hBPcPNI+IM9YL7aoiKKkwrF5Z1Q8XChLkYf/Yd/8TDoQMOV+pvRggEx+xHVTTJgMresK7uVDaZFj/LSMdAndP0k81E8+NUMW9V/qJtwmeOjGQfRSUbLuqhtlHjWRJsqFiXAMMbfJ8Tl09Hlk/73VeFsFwd8aO2/M4s3KDfMPH94Ocx0sQ/CTUSJYhAjd/S3ozJPrjOGAXKtqxiJNQmMNfK/3I7aeZCgCXySvvIG5jOBBn7CYbCqcWFOVSFrcKXSKnI4YnfMU78gDxsllyALDdHVSbrP1e1UuHfEFLGa94ty5AtVcp4w6pc6q7eHS9EmH7lioTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LVUPR11MB9860.namprd11.prod.outlook.com (2603:10b6:408:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 04:59:40 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 04:59:40 +0000
Date: Mon, 29 Jun 2026 12:59:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-drm-fix-1.0] [dyndbg]  d0917089b0:
 KASAN:maybe_wild-memory-access_in_range[#-#]
Message-ID: <202606291107.779cbeaf-lkp@intel.com>
Content-Type: multipart/mixed; boundary="L4uVpaU+PESAYYzj"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0016.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LVUPR11MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f47aa1-75e0-4bed-6af1-08ded59b3a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|6049299003|23010399003|376014|1800799024|4053099003|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: UgWsgliGsHqszYkvYqFjHU1COhKVucxnCyVdVmisz1ppPyzQH0Y8DFDY2FgyThgkmUTmswyC+Zq4zmPdQUEbOztupsPNruL79PKSROx5/YE2HwyjSwmm6661q+TKFAObZO4olnOTA8/Qqha3/U0G3cHTZAqOYbUZ9hSO0JwfeS/kSZxLjziUpwxedo/nfjNyLHYgPwlWg2bSDo7qVAEFWW+ZK65uKQBqDPvlnalfZisgJThoO28DzSlgaPf0nv+motUb+A3LPvhZRZ3ZDEYnUHL0riiLs1MyicpmtEb0cgCG5aipYyQ3UcJfWFvrF/jEMMEXTbAhqeFwzqn2v+XMgP1K1mJfgLGdwlYLJxh7MP2JOi3SyOVIQIs1wQ7Z4uGwBDY8fHtWARWfnDzZ+ZsydXuoPhwmis3UhCut73sBp8d8F4zlItxUjVQ0Uv5UI+6l2ML4MaOZizTYOZWWxDnbQUUygFez7NajoShXwt2iSylVf4d0aWayJjwbqIT+51rjdkTQbz30/w8W/FcyXFVVM3DUdt/N/vtiiKaoF12BViX4GZhV56yHf7pXcLJ1T24661CnCo98moG7MjwapgNMRT0Wajja4yB0wggVJaXajtL4WvQeG+yDq44ZacQHzND6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(6049299003)(23010399003)(376014)(1800799024)(4053099003)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qT9wNQb1k9UO9EiMldccZQwV4MgezkLZhGxUusUM7BIc95MjnB/9PBfAemt4?=
 =?us-ascii?Q?9kKbCqwjsXTeghWVScSEAMQCdaemJb/uiF45iG0VNzRJBbSYbxO2BOIXFeZU?=
 =?us-ascii?Q?1kcfFS3k8DljhBcyszAebBemFqB0lAvfiXd0TejRKqLY/Sf/GvrhuQ3d4yoe?=
 =?us-ascii?Q?/jkW3bX5/iyybCQZ4mkNh3qAnjIA80k/Km83PHtVsR7HUMkk7BjbshsR0wxm?=
 =?us-ascii?Q?GR/Za8QhVRn6s7sCpnD8Mmn/1YxQ4qxeaMpr9zTqVuPMiMs4g4+FNdH4IOJ4?=
 =?us-ascii?Q?FAex5Z6MgJOpaSchUXwPjkFFnlBM6qkj3Wp3RvOkZZbKHGmGNpYhsTkEYb2i?=
 =?us-ascii?Q?+WksKe2rlWCPT4euZxaSDAz1Z1x/Hxwq+RALFFLw2i0BhDm2toKiairqHPjf?=
 =?us-ascii?Q?rC2QAP1MQ+3t9yg6zF9JVS4ubU/k4wrCM2R2XdMbkkaSJL2I/KV1r0yNcKm0?=
 =?us-ascii?Q?ZOriP1okgGOXBNISCJMBs9fGL9jAvDOt0JB+IAf7hR+UnB7It36C/mtnjx0G?=
 =?us-ascii?Q?B4721RhlV9hT9nS83wJ+qtrbPrkXsEYDCMK2riwUyTwQLY5mdpLj/II8hEmA?=
 =?us-ascii?Q?W+Dq9DetGverxmCXiHVlRwW0ZkL1y1MsM5g92u1MjojgLoxGWYdXfgRZTMmF?=
 =?us-ascii?Q?O1PVwJ7MO6g+szAx3mnQBl/CjdppG0v6wgDvF/CbUtLlJ9O2rf8yO3sm9LyT?=
 =?us-ascii?Q?iVEdKYz46sJ2Dxc2vaVAeiUYQDvx7+8DFAEdRPgn8q1G1S3gziH5XuZZwDVT?=
 =?us-ascii?Q?CexHZmxKeayquf3vfg+EgxiCzqmcC4djbDJ1s22h9ffcEe73i2qWfMUagahH?=
 =?us-ascii?Q?cSOQmfGlFoWddBvM3/uJqrzAXSGGlaX6Ma+0jy7Tpz6yC6v9px/aGXKPLQHs?=
 =?us-ascii?Q?LNent1PTNVYFYDXIqEBLMKoU4ALf3COfG+GBAgcu1pcNAJzIrcZF2zbzOAhJ?=
 =?us-ascii?Q?EtSG6HAzFN5+3G15xkwoCxstXcemRZWHldRrHmmN5N7y1HJazE+0MDheHSd9?=
 =?us-ascii?Q?h9WxId41ojig+cHQL4r2S5k0klKtnLnVsNbgXyNGtnCcsNj1B5fqYzKVSNOM?=
 =?us-ascii?Q?e5uo9RZrBAlh3j7c1i95+CSxUGsflKoTwF52L9/BM5nLaIhKIawGqHXHzSbs?=
 =?us-ascii?Q?GiEXphenTedS9CYH71ds4ZhygF5/ytAlxqJe94EC4Mm8IKHE81VOyB1jCA+V?=
 =?us-ascii?Q?u+IsXSXMYBj3KwXZ5ZW7H9b4RA4zWMtAH7WWhTSXPIFoW1pZekuuLVE/Zegs?=
 =?us-ascii?Q?onwDN0jsy8EQIBBEpFjuM7EdlQHkKRzMsEFpZjhNbWWeDtDRzuAR6o//iXrj?=
 =?us-ascii?Q?y1cIKMNLEE70B845KD+vQOk7winlRYFlGvYiczyo9as5Kp/YEhBS8vJO9R6y?=
 =?us-ascii?Q?v5gH3elWIK7U0/Im7smIGIR84KC5dcukBzHYElfJnd+vQvzg4yUL614a0RH5?=
 =?us-ascii?Q?ft4O1nidXZhBdHQkzUEiOwdV+LmI1SoR2+E5k7Gwn18fkLe2lMkjWVkbI8rC?=
 =?us-ascii?Q?P1UAlpk/FRTxwKf5lZO1uQMJlBSnrvME/PB5iw+Jb+k0y7fKz/VvDZTK50Xk?=
 =?us-ascii?Q?LXFB8epWLv7HYY8qQ7BY2bK8Hb/2Gm9xziQsx5ZJ6oZ1j1JpvD6w6o6+mjNH?=
 =?us-ascii?Q?GhC114w49k/CLos0+AxS84kRVBKiWutkGm1XeR+W2poRfcUd2xOURIDZ0kPD?=
 =?us-ascii?Q?geU5t7CAg/nklWyy507HblmUxZcReRJiNk1DakXZ+Jjiw6lT4HuLi+oXmKNf?=
 =?us-ascii?Q?poTdEr2/GA=3D=3D?=
X-Exchange-RoutingPolicyChecked: roYiDQxk4z8xV7620mullgDSg3cwhOyvUCeSxTElb6cDRkdNCraPywipUlovI2auiTEzrwpCkzIEkV0CG46sjpSLCXqsUPF9C0H/o0YYPIAyYMJHJx61lepbaTFnuCHxeyPGJPRyrifKS+zCi4D3CptPyOoZR3dLWu6b1zSlmHvH1ucX/rFHJQeat3UxprR0y5H6/7Xdi2PvmpJozz2De6EMqZ9IrJZBHpQRiS1pEvgAo2rLIfwomrMzCkl5J+NJLmPofdYNhv6x6B5ULUMh3nleO2ukcP/W8SsZUhS1oU++k6AYYqemNa38GW7bG39L/XdJHXQ4FS/lQrcM79kgNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f47aa1-75e0-4bed-6af1-08ded59b3a07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 04:59:40.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wkptPFGkGGb/q0a8tfNq3HSmSeYOs2ZhjGhXf+j4BCryHspW/PDSFOU4flYOMZ3RW1n0+2t9q0AfpMNlyyrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9860
X-OriginatorOrg: intel.com

--L4uVpaU+PESAYYzj
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi, Jim Cromie,

the parent also has problems, it crashes after below (1), and this just happens
at the similar position for d0917089b0, which crashes as (2).

one parent dmesg 9ad2106fa015-dmesg.decoded.xz is attached.


=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb/boot/debian-11.1-i386-20220923.cgz/x86_64-randconfig-072-20260623/gcc-14/1

9ad2106fa015a2fb d0917089b03d3df1f97a2b2b253
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     dmesg.KASAN:maybe_wild-memory-access_in_range[#-#]   <------ (2)
          6:6         -100%            :6     dmesg.KASAN:null-ptr-deref_in_range[#-#]      <------ (1)
          6:6            0%           6:6     dmesg.Kernel_panic-not_syncing:Fatal_exception
          6:6            0%           6:6     dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN
          6:6            0%           6:6     dmesg.RIP:strcmp
          6:6            0%           6:6     dmesg.boot_failures


not sure if this report could be helpful for the existing issues in this branch
by our boot tests, just report FYI.



Hello,

kernel test robot noticed "KASAN:maybe_wild-memory-access_in_range[#-#]" on:

commit: d0917089b03d3df1f97a2b2b253698012a8a4123 ("dyndbg: drop ->site pointer and compute descs offsets")
https://github.com/jimc/linux.git dd-drm-fix-1.0

in testcase: boot

config: x86_64-randconfig-072-20260623
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606291107.779cbeaf-lkp@intel.com



[   17.795946][    T0] Running RCU synchronous self tests
[   17.808199][    T1] Performance Events: unsupported CPU family 6 model 42 no PMU driver, software events only.
[   17.817312][    T1] signal: max sigframe size: 1776
[   17.827444][    T1] rcu: Hierarchical SRCU implementation.
[   17.831681][    T1] rcu: 	Max phase no-delay instances is 1000.
[   18.750779][    T1] Oops: general protection fault, probably for non-canonical address 0xe007ffe1e0000000: 0000 [#1] KASAN
[   18.753821][    T1] KASAN: maybe wild-memory-access in range [0x00401f0f00000000-0x00401f0f00000007]
[   18.753821][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.1.0-00060-gd0917089b03d #1 PREEMPT
[   18.753821][    T1] Tainted: [T]=RANDSTRUCT
[   18.753821][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   18.753821][    T1] RIP: 0010:strcmp (kbuild/src/lib/string.c:283)
[   18.753821][    T1] Code: 56 41 55 41 54 55 48 89 fd 53 48 89 f3 49 be 00 00 00 00 00 fc ff df 48 89 ef 48 ff c5 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 8a 04 30 38 d0 7f 09 84 c0 74 05 e8 80 22 70 fa 48 89 d8 48 89
All code
========
   0:	56                   	push   %rsi
   1:	41 55                	push   %r13
   3:	41 54                	push   %r12
   5:	55                   	push   %rbp
   6:	48 89 fd             	mov    %rdi,%rbp
   9:	53                   	push   %rbx
   a:	48 89 f3             	mov    %rsi,%rbx
   d:	49 be 00 00 00 00 00 	movabs $0xdffffc0000000000,%r14
  14:	fc ff df 
  17:	48 89 ef             	mov    %rbp,%rdi
  1a:	48 ff c5             	inc    %rbp
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	42 8a 04 30          	mov    (%rax,%r14,1),%al		<-- trapping instruction
  2e:	38 d0                	cmp    %dl,%al
  30:	7f 09                	jg     0x3b
  32:	84 c0                	test   %al,%al
  34:	74 05                	je     0x3b
  36:	e8 80 22 70 fa       	call   0xfffffffffa7022bb
  3b:	48 89 d8             	mov    %rbx,%rax
  3e:	48                   	rex.W
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	42 8a 04 30          	mov    (%rax,%r14,1),%al
   4:	38 d0                	cmp    %dl,%al
   6:	7f 09                	jg     0x11
   8:	84 c0                	test   %al,%al
   a:	74 05                	je     0x11
   c:	e8 80 22 70 fa       	call   0xfffffffffa702291
  11:	48 89 d8             	mov    %rbx,%rax
  14:	48                   	rex.W
  15:	89                   	.byte 0x89
[   18.753821][    T1] RSP: 0000:ffffc9000001fa98 EFLAGS: 00010246
[   18.753821][    T1] RAX: 000803e1e0000000 RBX: ffffffff87402c60 RCX: 0000000000000000
[   18.753821][    T1] RDX: 0000000000000000 RSI: ffffffff87402c60 RDI: 00401f0f00000000
[   18.753821][    T1] RBP: 00401f0f00000001 R08: 0000000000000000 R09: 0000000000000000
[   18.753821][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000001f8da56e88
[   18.753821][    T1] R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
[   18.753821][    T1] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[   18.753821][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.753821][    T1] CR2: ffff88883ffff000 CR3: 000000000a708000 CR4: 00000000000406b0
[   18.753821][    T1] Call Trace:
[   18.753821][    T1]  <TASK>
[   18.753821][    T1]  ddebug_add_module (kbuild/src/lib/dynamic_debug.c:1705 (discriminator 8))
[   18.753821][    T1]  ? rcu_read_unlock (kbuild/src/include/linux/rcupdate.h:310 kbuild/src/include/linux/rcupdate.h:869)
[   18.753821][    T1]  ? __lock_release+0x5a/0x150
[   18.753821][    T1]  ? rcu_read_unlock (kbuild/src/include/linux/rcupdate.h:310 kbuild/src/include/linux/rcupdate.h:869)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260629/202606291107.779cbeaf-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


--L4uVpaU+PESAYYzj
Content-Type: application/x-xz
Content-Disposition: attachment; filename="9ad2106fa015-dmesg.decoded.xz"
Content-Transfer-Encoding: base64

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
5DnVhQIA/KXzJrHEZ/sCAAAAAARZWg==

--L4uVpaU+PESAYYzj--
