Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC01E9919
	for <oe-lkp@lists.linux.dev>; Sun, 22 Mar 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774174049; cv=fail; b=ZzIu/wvGQQzWWS9h/uGnRRu12AI4s4863pofejZE22Q/9VSwKbRSqzpQBvvxTH09QgLAFssAQ1IjDuW8ipcEpi4OKBbclWJsn4dNGdxlFm76hAZm+WyBXXeD7+QSlUnPwAPuqUkC0nwJrxrH96tT09LowLz0S4ut5UDU9hUyHzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774174049; c=relaxed/simple;
	bh=p+HxcyzP9Up3lQ8H7spS+y2JQH+ijMpxYC/zQKQEqQs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ChRipbWPznm55YNY8VcYqRejjY0kXtwz0/hX3t+2ki2l3cwP4G0VOuzHYdTEKDhDdCqPAOWGInvrgLeCjJaVTj/DdF10M8+05/pYqNzncmGpycmv6jXIfbpD6VyYEx9n5w/KBqbI/v0TyHLFUya71v6e1afRMjWSLKCVytih4DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6d4GE0l; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6d4GE0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774174046; x=1805710046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+HxcyzP9Up3lQ8H7spS+y2JQH+ijMpxYC/zQKQEqQs=;
  b=Y6d4GE0lQtdrL1+aAjfAa0XANXDXceQnGKQgsdiBcFeQ0vXacL9Nu1ch
   ew43RKZTTWYDfvzTEFHrrFRKwZqYA+GnfcpU3dHcXsWwdtTA/Uh/XNzzl
   GoxX8jrLRW+c/G680Qe+Ao+TT97U7GPPGtCBpoehYT0zdg4/axFogwlqN
   l7mzxmC1xhwVK2Hd1xxuDeFV/GZbuOdmtIckOJ4nyjdaHxHsTcHy1HkSd
   rpL7GS+2EGir/f0mcJ0iQR8y4Vx1Lem0It5IbOdZAvQe5Ne7Dxkg6yfa2
   eGjpeLvqWo/VA93TAelqWhML10k/1SzSY88RL6hS05wgZM7BWy4ilc3eR
   A==;
X-CSE-ConnectionGUID: NTg47hgKQVaIjDPA009HRQ==
X-CSE-MsgGUID: h4PUP0QtR1uyWQfuAu7IIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="79109442"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="79109442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 03:07:25 -0700
X-CSE-ConnectionGUID: VQP977U6R2mK2Wn/eJ7j2A==
X-CSE-MsgGUID: ObTqODwKRUe6l2buMFPrYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="218990081"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 03:07:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 03:07:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 03:07:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 03:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqYl7jS+fX7yo9eBtq9ElbRK/zVv9jWOnElfkvGDtShLJnJ5z/v53QilnHynEtT7jcNfWB3otvF9pAZ9Dab4603a9Jg2qnTU6gTLrmY9fJ1PFYb+vzMs/Nr66YR+9/JWjvcbThzOdqwrDjIioNrAuOKHXtDuQQcIR0lcduVWp7/+SL0wE77BzyqXCKadIqDizfrE/jMMGI6bpwamUoA4H9R2dmAHzHz38eXSmj49EkT2HOCerfDnS+Z/1JuJ+by4B5rNvNxzHI5QBFtUQBxqITDsgWeXcslXsOR00t5Si27K3HGOrFC61KVElDnF2498D4O5tB22WseWp+Q2NJdHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE4gHegOiUMJUc7faVowirElK1xo7Y5B4gEqqYqb4Ho=;
 b=L8TBa/SeKTCC/SG4keaF0Hb1Jlz4um+Gv4esN+Gt4/m6mEdEeQHELV6AhBV42A5fapy00M57Qfy4gp/c2XjY0f72vuWL9v6oxyHsF95kXUbEXN1gcXaQwTgYQuARoRciOXDE+8v8bK/5nfaQz3VbxcIPgPU2GDy4pzj7PpsYzPNKEyog9DCDsJlKcLOWgeLdNon+tru5wWw2fp0lRaZnrdf+QXtqGiIEjsFxz60Kr75iYCarnlWbhbo6qEBdmiOvSAT2zExzDySBOYIINM5vMC7DJrvi5fpL71t30DCEL3GonMkJjTXSagdTwtTY+R654CZNxqaJRwpV84mvLlRo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 10:07:21 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 10:07:20 +0000
Date: Sun, 22 Mar 2026 18:07:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <drbd-dev@lists.linbit.com>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [drbd]  945807e66a:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI
Message-ID: <202603221745.8279cd80-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::16) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5460ce-2cc4-4169-6e29-08de87face54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: lf+rPgyB8b4rMpya7X4HGh+mJxUISIbE6kxcEn7EbAuHHw6w9lBWWIj9eJ8VGhUGzm9j0P8R2HfrIPwS4ycaVi58FyIDd4bw4U2vP+gwobOBrzBTVvD/Bl/3WGbRURdJWx+gA0Ad2ntv0vlvxlq5rFMtkR2TTqAjs3hn63HBplnAKJUj50dt6b8zY7X6XJ1cFd0DSS3CzsFFjnwBKftfguvH48rSUvdvni2yMpqqz/lbsNpwtNdPrO8Vg5NEgBdLwabxttb7u0KdA4+Y6eJ4L/yizxkvWMq63so/rwKTKprlmdjMg4lRMKG1dvQiJ9PTK5fSw+LP0JFYYit+7XYU9YHGkgi7rD5trTLp3Do65Y/798LbxdMXMd+zr55S3SfeIEIG6isKxq6NwR3V/YKa+rQa/fNSXS03naD/gohUKBU0fB8JDT7MsEkILnOE36iqYDrifKaFb9Q4c7ro6bzLA37DUpUUq8593TXCVdRNWglN9c843aFQmDd4a5+30IadTtpWSejO6tinRPj+JQgwKyW9Ef8T0+uaX78nJUjo9nQ48rZX0zkui+q3uhWMeTrww3yetkPsJsIwz8XfuGKED88LxOk/RSz87PDalWp7WqiHM3EyNRGylzyQ0yr9EP0SwRvv4J8Ojeu8oaWeKh1Mk1KIvTPfI+GzAPNRA6eVlekJF7KPoxdICXpefV6D75dDcsJ9mvf46mYPTtIfvoooLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?heaKAw3rLNAJq/eKU4i1eMugEe3DsiID7bSUJoHa60B5gOdn03iLy5t/tS77?=
 =?us-ascii?Q?wc09POObON6IHmYc0AlFoYA+vMob2DwuWeU2+gISPfHEvkqX5RGUfbYkKcF9?=
 =?us-ascii?Q?p4a0ZE0bmzPkU5D4dQSuRUeiC0E3zGiUOeLbTsdi1ip/11J6O6zd2l/1xkon?=
 =?us-ascii?Q?NSddnKBSUe3wutMrmhVfXE6gOYCW9BEPQf787TkVENMOCFqmn2kwu/bS6Jtv?=
 =?us-ascii?Q?ZMTDag9jDiRK5qIDXszr6Ub3XMmTn54iq9h+zS79idwH5dcKSmdz2sTGuI/i?=
 =?us-ascii?Q?peRPghFwKbynKaH56yAa4vOpU3gcMTZvl9d8rEqnoWZWOhPCpMuJ4fMLxAfJ?=
 =?us-ascii?Q?xIeKYPK/mV6PXQ7OHJNPUjkh2KvmYf3RlZRI6mYOnVapNjfzW043AXin0m54?=
 =?us-ascii?Q?gLzntEEBTxq5DkaOtSw4gH0WEKwylZJdxabuwb5cSWz0KEJlH41Poti2FvDT?=
 =?us-ascii?Q?tRwixRG5JmcyLdqXvJzST77jrC9Tlqnjpg2me0IN/AfBxKG4XODT8xwiWd9a?=
 =?us-ascii?Q?/HjHdqyA4ue2/2vK6W/5+/rx2zwlj2BvFwXjzEH7hz9M6SvK05bm4oQS4AQm?=
 =?us-ascii?Q?QJDaoB6icLMrfhg0Kwxp74jROqWiwuRjPg+LKBdZkRbcsYwBynPYSLiQSI8I?=
 =?us-ascii?Q?3y9Z0YwwQrUUSl7CZd4SHXpGCzT5qQG+VaqVheU+olvsU69mnPWxpgN7A126?=
 =?us-ascii?Q?vzwhNx5d12xDO8tcEay5F+IB3Ii+E8AvrjbHLWWm0zM/cFVGj8YT5n0gdf1K?=
 =?us-ascii?Q?R0SfiuRmuoFX0z7nsdVdNH4KvFshKfIPhdfJW0g/5VuDRFxOCjR71pY9XxJO?=
 =?us-ascii?Q?YhnrYgFE54bckAOVzXGr2mrVXmvWYQg79Hb57PtYDPIEXpPlGNv4K/psRDrS?=
 =?us-ascii?Q?pjohpn+98mJjQCgKYd7U1vUuvwJvu1tay4htO7HFQO88Lb+OQcULaZrdDzr/?=
 =?us-ascii?Q?nv6ALiUqMvoZZ0DeXUqNZqHmWfMirMI+8TS9MKwTFyin3vHRKUVZgFBlxvsU?=
 =?us-ascii?Q?+Zjuc3RZeXnzvh7erOkvDMYSiyg3V+ontegz5dpI05jrOnyslemnZAtzt5Yc?=
 =?us-ascii?Q?sd6wU/4euN2UDN+x34LrfhQUJJk1JFnetu5sG/fdEhR0lAwYpKM0judfqmPM?=
 =?us-ascii?Q?Z0h/f74yGaoUTOMf6Rg4S3AT8EqEdJxyzJG7quvPXazi1zddnom6fiPGZXRx?=
 =?us-ascii?Q?h+vO1FRD1Yfg1ykmQQy3WLNdg52IjW4xRyNk+2hhyvNWB4Z+YvZk2dolBtqP?=
 =?us-ascii?Q?MLhx/dXEaRHuEVU6TD7vjwxHF6uKT7QcJI2TAHyLWCM+45fO/m8pBGDLb/Ce?=
 =?us-ascii?Q?9Bztb4imvsQS0KQwFoMGAbW4mmUUQOnjokwGN8J05HK+5G2JJWzWzovtCjX7?=
 =?us-ascii?Q?nuI1yErKuoukdgKMJrASqMzSXBKzIXnnInj5dWmqElMpbHV3lqKFIAea975/?=
 =?us-ascii?Q?rQv1e45PKSJnrvmWwcn2cBHnepCrA9viOjCkbORvN8MZ8bPNon7xf7TRTG4S?=
 =?us-ascii?Q?HIG/7sBgNdou8Nmes8nA5/cRtXxjlghYPkTXk5LMq5mEaYcuPq6Y+sgDzUp6?=
 =?us-ascii?Q?eQPKl8UEK+kqS4LMFro5lY6uLRTqTkmdt1xX0qgpKNDEsVMCnhrF03liWpdN?=
 =?us-ascii?Q?B4zywE2OZ8lcNAwOjH3uSqRnEZjTaPFZV5dSNEyG13ckxxt0xTLCV+PD28ga?=
 =?us-ascii?Q?Iwd7pJ1c0vNcqvfirbxmSBie4dZu5SwiYYaUFWwkk8co0msITo/dLFq4AEe4?=
 =?us-ascii?Q?RUQIY2t9vw=3D=3D?=
X-Exchange-RoutingPolicyChecked: hdnjufqvPGrKeKVahiI/wgCIhdZLyFzkHCl47TQD0fif0krouX/hKpiFgRrj56qN52YMC8EmRtGSk4Vw9tYVqH6fOf2TMuMgRJ0iBov4zOqntFVzEY1BGU2Sj5nfZ/9YL5G34CwQqyT/jR25EFnG82p3UUZWR3tUuaeW5nuT4W4bCsS8TmGuHQZTpkbOQ1Y68H0+8S0jlQWKuAp54TLFDtSKu2xzxSdidgP3FD2HbEmPMJklxJs8iTQ58drHHLjRu7d/oKOKfofAP7dubTEV8V3cXKxV70SUK3S3rP59y34nlh294uTEc47GCir6cIXldy83VM38l6GCGo530nGmFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5460ce-2cc4-4169-6e29-08de87face54
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 10:07:20.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gJJ79Q3E8FW8ky37XHlBVeTlyydhizxopxNaRj+jntqPldMW024mLnS9fg/b7W7c35SyJCIAWYu7y5sG7P10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-OriginatorOrg: intel.com



Hello,

by this commit, we noticed below config diff comparing to parent:

--- /pkg/linux/x86_64-randconfig-006-20260320/clang-20/0c897516a4856d55c75cfdb2b02489b0fc50bdf8/.config 2026-03-20 21:35:52.410943578 +0800
+++ /pkg/linux/x86_64-randconfig-006-20260320/clang-20/945807e66a140e5ee0f919d04e15eadd4cc294be/.config 2026-03-20 16:40:42.155357399 +0800
@@ -1738,6 +1738,12 @@ CONFIG_ZRAM_WRITEBACK=y
 # CONFIG_ZRAM_MEMORY_TRACKING is not set
 # CONFIG_ZRAM_MULTI_COMP is not set
 # CONFIG_BLK_DEV_LOOP is not set
+CONFIG_BLK_DEV_DRBD=y
+# CONFIG_DRBD_FAULT_INJECTION is not set
+CONFIG_BLK_DEV_DRBD_TCP=y
+# CONFIG_BLK_DEV_DRBD_LB_TCP is not set
+# CONFIG_BLK_DEV_DRBD_RDMA is not set
+CONFIG_DRBD_COMPAT_84=y
 # CONFIG_BLK_DEV_NBD is not set
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=16
@@ -5795,6 +5801,7 @@ CONFIG_IOMMU_HELPER=y
 CONFIG_FORCE_NR_CPUS=y
 CONFIG_GLOB=y
 CONFIG_NLATTR=y
+CONFIG_LRU_CACHE=y
 CONFIG_CLZ_TAB=y
 CONFIG_IRQ_POLL=y
 CONFIG_MPILIB=y


as we understand, this commit reenabled drbd. this report is just FYI what we
observed in our tests that there are drbd related issues after this enabling.


kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI" on:

commit: 945807e66a140e5ee0f919d04e15eadd4cc294be ("drbd: remove BROKEN for DRBD")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e]

in testcase: boot

config: x86_64-randconfig-006-20260320
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603221745.8279cd80-lkp@intel.com



[   24.381821][   T56] FDC 0 is a S82078B
[   24.401375][    T1] brd: module loaded
[   24.480448][    T1] drbd: initialized. Version: 9.3.0 (api:2/proto:118-123)
[   24.481932][    T1] drbd: built-in
[   24.482693][    T1] drbd: registered as block device major 147
[   24.486081][    T1] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000021: 0000 [#1] KASAN PTI
[   24.487070][    T1] KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
[   24.487070][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.0.0-rc4-00020-g945807e66a14 #1 PREEMPT(full)  657bb35ca7e5e0c42c8110b4a9a3d43552818707
[   24.487070][    T1] Tainted: [T]=RANDSTRUCT
[   24.487070][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   24.487070][    T1] RIP: 0010:drbd_register_transport_class (kbuild/src/consumer/drivers/block/drbd/drbd_transport.c:44 (discriminator 1027))
[   24.487070][    T1] Code: c0 00 00 00 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 fa 8d 33 fd 41 bf 08 01 00 00 4c 03 3b 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 db 8d 33 fd 49 8b 07 48 85 c0 48
All code
========
   0:	c0 00 00             	rolb   $0x0,(%rax)
   3:	00 48 89             	add    %cl,-0x77(%rax)
   6:	d8 48 c1             	fmuls  -0x3f(%rax)
   9:	e8 03 42 80 3c       	call   0x3c804211
   e:	28 00                	sub    %al,(%rax)
  10:	74 08                	je     0x1a
  12:	48 89 df             	mov    %rbx,%rdi
  15:	e8 fa 8d 33 fd       	call   0xfffffffffd338e14
  1a:	41 bf 08 01 00 00    	mov    $0x108,%r15d
  20:	4c 03 3b             	add    (%rbx),%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)		<-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 db 8d 33 fd       	call   0xfffffffffd338e14
  39:	49 8b 07             	mov    (%r15),%rax
  3c:	48 85 c0             	test   %rax,%rax
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   5:	74 08                	je     0xf
   7:	4c 89 ff             	mov    %r15,%rdi
   a:	e8 db 8d 33 fd       	call   0xfffffffffd338dea
   f:	49 8b 07             	mov    (%r15),%rax
  12:	48 85 c0             	test   %rax,%rax
  15:	48                   	rex.W
[   24.487070][    T1] RSP: 0000:ffffc9000001fab0 EFLAGS: 00010206
[   24.487070][    T1] RAX: 0000000000000021 RBX: ffffffff8a1514a0 RCX: 0000000000000000
[   24.487070][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   24.487070][    T1] RBP: ffffc9000001fae8 R08: 0000000000000000 R09: 0000000000000000
[   24.487070][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8a1514b0
[   24.487070][    T1] R13: dffffc0000000000 R14: ffffffff881d2a80 R15: 0000000000000108
[   24.487070][    T1] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[   24.487070][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.487070][    T1] CR2: ffff88883ffff000 CR3: 0000000009438000 CR4: 00000000000406f0
[   24.487070][    T1] Call Trace:
[   24.487070][    T1]  <TASK>
[   24.487070][    T1]  dtt_initialize (kbuild/src/consumer/drivers/block/drbd/drbd_transport_tcp.c:?)
[   24.487070][    T1]  __initstub__kmod_drbd_transport_tcp__1030_1667_dtt_initialize6 (kbuild/src/consumer/drivers/block/drbd/drbd_transport_tcp.c:1667)
[   24.487070][    T1]  do_one_initcall (kbuild/src/consumer/init/main.c:1382)
[   24.487070][    T1]  ? __cfi___initstub__kmod_drbd_transport_tcp__1030_1667_dtt_initialize6 (kbuild/src/consumer/drivers/block/drbd/drbd_transport_tcp.c:1667)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260322/202603221745.8279cd80-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

