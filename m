Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AB2BE630
	for <oe-lkp@lists.linux.dev>; Mon, 16 Mar 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668915; cv=fail; b=lAlCRSLOQtYZ2qoCHm80zlM0cRJh0gdKGoq5JyT732fOySx+jxX1S2P7/njRnzSxxmMrPwmaR+/ZpSrd6PCfxxJSdtoSgOS0EV1WzWP/quzpYn1sl9bmmEQi319pXnBSrE8RpNzLJ5Zf3zxp60S6t3YWfkZdIpyQkfcmIRfJ1/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668915; c=relaxed/simple;
	bh=pQAqZREnkF75Xl7F8DhPEd4ezLtWLOGTt9PAuh6+zJo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cVDqYkZWfKcCggvN9zZ6jFf+nqzSnXhzKz5JeX8BO60shQExbZhcXN9Xfur8VeMjVsuBe7xYs4LiYxuHO/7yvFc4w+bpGyw/K19T5hBfeunmpeS7rnzDBuV/sI/zBiXu1NFPQ8BJz7uTVsMJWYInXWd4TYWmjPBPFYYvC6kkKo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPDAqe0n; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPDAqe0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773668914; x=1805204914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQAqZREnkF75Xl7F8DhPEd4ezLtWLOGTt9PAuh6+zJo=;
  b=IPDAqe0nqaK5NA79FsM6xAE4cD+tobRIIgliBlFo+rfwPjskVEJSEqY9
   o0Y9HNYTh+5kVcXYAbPf9odcObo7lFvE/i3rdyQgaEN19ilbW5/gkKElu
   WsRvfSraT33FE/LYjh7wkGJoQQPzKrCrfpkI/VufUgc2GuMwsmj2eTC22
   eIBHxSADGVaRuqYcl3f8tgkNRAvMN51Jp1TXO90YUWw+u9GsMpVpw0Vk4
   UciPUdtlGrUoM3Y9Ao2S5XLlwHDRHb+QviTf+65DE8he8O7Mkl0noe6HR
   YJNJFbovrbkaz5m+uWg2+oa/r3CjVtDA1z5LbC5sGjF5AMYKKpTvR2M0z
   A==;
X-CSE-ConnectionGUID: HK/3BUmiRlqcpP40wXwFtw==
X-CSE-MsgGUID: avKR/AI4Qk2leU+8JqJqvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74760673"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74760673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:48:33 -0700
X-CSE-ConnectionGUID: w5Y5ystlTFySbQ99aYj35A==
X-CSE-MsgGUID: ODwD1J5CThmfWg78jV9umg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222134800"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:48:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:48:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 06:48:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoEorUu+Y/XQAYp3Cu6d8BhFsUQUSSVlXClyosP3zL5iKZ2GdV2roB51jVbwinwTIGhTr8lb4mhh2lC+JaQKq28IIBJwtNjdODRAlnHilHcd7fY2DonhxIsU/xNDsyiXsFFfTwDk8lb2WHCDqlF52oQ+fO5Zi4TMf//xSoV2iV8ZoHE2f2NQyhY9duwWe2y5Jm64UcR9LTUh5z7ODI/qDtu0qU3l/ipC9YheV6UpjwAK+lWrQFSN91wvuYlbdTr9brgXLttbms9/eXNw4ASoD9ajLBXfsOb+7l5qnyNh4kkFgqezlL3BSkg7yqikCff73biruWmHiY58gyyp5jRfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSuSLMroKNX99iR1/yhv6T8Gn4ksplbIuvfwbAfubeQ=;
 b=RkC4yN0spQo6zGgYMFEcz9v3JH3gsCjYLdo1W6Guh7VPi/0RclDnHbWYK/HD+o0xvfaoXDwBoGW+InAKJ6ixfAYQGYGKtuY5mHkyguJsBo5Da7jwgjLTlzcDJaeNXMPWUhNQDrlUBIh+Zd3Zk1iYS1MLbTphecywk6LaJCK9hnSHnrWzemj2QIFGE6467+l4mrlHM51K8CjELsEoev9vglIHbDlC/tc+qnCJQ76pGBcK8D//oSK+1XdD9mayLv2ZlUHvTRSp9lmFX07RhJ5dviIxiqpjvBfauhHhAqvFIslLDx8iN6XFbBfkRwPEi4En6Pm3DN/1VPBdYNZkufG8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 13:48:28 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 13:48:28 +0000
Date: Mon, 16 Mar 2026 21:48:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jirislaby:devel] [serial]  34d1a9ee59: WARNING:held_lock_freed
Message-ID: <202603162130.75f32572-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::11) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CH8PR11MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 8496e284-6e1b-4c2b-c773-08de8362b3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: lAuhIVNQVaTVw9Y+PnPK3WQ5QeBjlIYwVjESsO9Rdv7pFaVsdeLWaIPyB5NukrsEp6/HnPIlD7xWp4LO4nOrP5hKU6QwBz/hNLYF119S4jYG5DfJ060gqHfqlECnHpb/xGcY2DClOhJG0rnMgv9PWURqlciTz022XYsHV8v/kMxROMOaFPO4YIHIvEHatSWnKdUkj9eFE8+4MC6qkw+3CyrhDbxwzOpCJzD1kOdOAD0Imr161yaSVbhJZ4n9gvKAFx3UOLv33/TTQmnXmelXE0bO869L9YNSSRI/ydKbyPdhYwwMPwsrUBuMx+TN428oZuDUboFzDe/bCq4eq3OXgHzZazNvWxE8uL9LCusRtMvqjJ4hB5oMG2t9QuTUxewf+5kROoukXV1HIgEvxi0JbbkJpVvrlmg42FEJaStd4q6hvyysXsqCZ1fa3N/ftUmg/eHA7XzU0Q8rt8SQkiQu/dBDTebvC8NgJPr6TNoKqoiH4QI2iAzK+H7xy4HTBFwn/Bznjc8WwEDxR+oywHRhIBjJ76FWXAMH2oHZ1LZ1T1sFxOUuP++joawgN7Lsdg8hJgolAvWUOm3aH0eb/oZ9+S5GI2iI8BjTRcTTb+xCNqLNMw/Xi/NC6h6nPt2wNdsV8CyhFtrNG8BdnolgIlwPsKrZBy998X83mZfNWvX80CJnPkVw3j7GaMV+RQK+ZiJ+DYd7kevx2399SCjgTshKbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9hE0q0Q32B64NRZOoyZl5Sbyg1m+NAhuM8WoDNYf8/O1gekzYNVuwv8V3pJ9?=
 =?us-ascii?Q?zhMOlAxjIU6SlqzRuG/tnq8L6sHlXh55myIflQ1Iq7sgpNFWKc6v1J66cTUU?=
 =?us-ascii?Q?7D5MyHBCMOIkr/j6maGsvADOVGNKY+u29ctd8Uzt8mwJF40KT6cXl+WMoiEm?=
 =?us-ascii?Q?HbGiB/HAFBFtJ6KcnzadCPgJqLlg2O08cGm1JDLG8rHCNmFrP+yJE/b10Bny?=
 =?us-ascii?Q?smBvMGz72G8pUf9nXgeaCbFrl7h/7ag5U5iLglBXuu4sQnPP/5n+KBDjTmLT?=
 =?us-ascii?Q?pZponx0/ab3V+Paf3cOiVouXbuiUKYx/f0TxjEfFTLISIDKGWlkh0B06MAmr?=
 =?us-ascii?Q?Bi27jv+IDDXZ56JbhISuiX4fefoqf8Utzq3OtxAbQQmRe+58xM0EbtQ3AnYq?=
 =?us-ascii?Q?389mHrvznvzBXwLPsoV/NPn4ahFxYdCwoLNE3UXmb+8ELO7w7Au3puyFo0SI?=
 =?us-ascii?Q?mxIj/pmeUfzQQVcU/iOofYcV7hjVvWv+H+xto8jkYHGqjtVIryXfgTFgqVmJ?=
 =?us-ascii?Q?/i2ADhJPEOoRl6wqbkSEXCxSmuqt01KiarotrsMyHg1LI5ZkpUQQ9MZbShps?=
 =?us-ascii?Q?jddQGfBfSLr0rV4bU9lwXg7sL+hmPZ0xPwlj8StqPjmLEKJ65CsAgrhp3KVB?=
 =?us-ascii?Q?D/qVcUmveU9nBv/sHKtRjPMODlSgM5X2qId+TVmj1yJvcFgvV4FxKDqHzbCm?=
 =?us-ascii?Q?1riLMdgswOR1UJmZGPnpS0h3dCjRe7tJs5uM3zF+/uNRn50meFqjK+h64TWr?=
 =?us-ascii?Q?5h19RSv8z4xorAEqBrvdfJ6txpR6o32vgiJAVYKK5ZCai+AO83kKhENyjsBS?=
 =?us-ascii?Q?zhFjSW/pMwVSXJep0mCWAM95NB/Zi4/Qbkj5fnghsY0Q+dVF3MP0IhGavcw5?=
 =?us-ascii?Q?SMG0hZuIUSoQVsSXw3rXSyASe0PYirK0lEvnwav51BAqBJ4mrZShqx0ihi9N?=
 =?us-ascii?Q?BSaFK8UQ8j9HKs/VExlAVxSxUNj6R5nVRz32OiWDVXX6HHKDHlDz2gxd2fB+?=
 =?us-ascii?Q?PLTOpv3aPGF043uckHKctrG57uWZlt32sOT1VxhDl7sgc6LEVq8rnAkcpGlV?=
 =?us-ascii?Q?AULI2zwOjw8ql4EFoqImwz7m7HYemAacHisM5sgPow15Ut2OMcq3bBxrbOSE?=
 =?us-ascii?Q?EG5STdY83HJe6StFGb7Jw+unZPcb6HZT5P2t5fV04IUoZzYFekF4E7oPqZBU?=
 =?us-ascii?Q?IdOKhtj8TtFi7fpynAjMayFMn8reyZUXDVPvc4L/Y2JyZmPRdZKs83Pt1r3x?=
 =?us-ascii?Q?u04+lVtrSq8HHcomIw3w4MFWVTXRJykKCrwPUaUlvSyAhP339t7ZmiyrlFuJ?=
 =?us-ascii?Q?eV6+rahb7jVhqQbRuqy3byqs8YsJsNQ8H1FtSPPWThq+dm7O5UFfWkNpf6q1?=
 =?us-ascii?Q?zfgmqB981QyResPhgW6hKn1dvpX+wdy8dpOerSQBpvSkPDz2DGCKsRt60q9I?=
 =?us-ascii?Q?MpFR7zYjZVNcbi7NLiNChRvIca9NCIjiFiROxIbHnesC+YvinkGUDWJsikCN?=
 =?us-ascii?Q?8+zic0HrxTD9gryDn6npI4yZuhd2ziqc92UEuu08ulrTZ0tB0PObeUCJh1nx?=
 =?us-ascii?Q?CnS7inNvarLa9ia0mD16OP1fQedRQl1gMHl9ay44SpZjtnsFBJ33wbkPYS6z?=
 =?us-ascii?Q?L6mvdMDm0DIJVSxwHXBWxEBg7sV4A2l5p23mLYDZlxk3LFoPR2mr57mMEsbb?=
 =?us-ascii?Q?YQsP7khZwZ3LVHzNEoREb4ndjwS7deBHCtblgJI0FChNVc+8QQA61IkcOhtg?=
 =?us-ascii?Q?XGEo+AKjnw=3D=3D?=
X-Exchange-RoutingPolicyChecked: WirHgh5c9zGuh9gbyrbdh2fGbZqvgJirLSlGJZUdlM4+JJjNu5kq7PVe2sCiH7Wb58j5ar7WQyPbsuGw5NjDGKciACDEl5ifyg+IXUSxcVt4wO4kDRbjVaSCCeE7/0+AB714J3PeFTM2y8GGcIXlRmr3O+p8D3spUGp2gwciceCgc6S7n6NNYBulAGF2Opj+GmxNsZhM4h87OSyde3Vf5AbMoOskhggj0tf6kh7BZUcVL4Yj71VbW+5fhFET4M5GhcxBt+bCbKdm4fj4Z0udwJQVT7LJcqKCG+EYImhD0zY5zBwPu/GncWwAM1s5wuC61+NKM/m6pAqELdtP0oX/sQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8496e284-6e1b-4c2b-c773-08de8362b3d4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:48:28.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpfSGSLMxv6wdiurl6AULmaCLxaIU4JlqvnH8HezGPCDcMR4KadKM9LgQ+CqV5hkSWD7EovVlWLxZaN3RNKJQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:held_lock_freed" on:

commit: 34d1a9ee59662c2a550bddc3709519fe9e98f80b ("serial: drv->state -> xarray")
https://git.kernel.org/cgit/linux/kernel/git/jirislaby/linux.git devel

in testcase: boot

config: i386-randconfig-015-20260312
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603162130.75f32572-lkp@intel.com



[    4.142579][    T1] WARNING: held lock freed!
[    4.142933][    T1] 7.0.0-rc3-next-20260309-04774-g34d1a9ee5966 #1 Tainted: G                T
[    4.143637][    T1] -------------------------
[    4.143992][    T1] swapper/0/1 is freeing memory c6829400-c68297ff, with a lock still held there!
[    4.144724][    T1] c682957c (&port->mutex){+.+.}-{4:4}, at: serial_core_remove_one_port (arch/x86/include/asm/atomic.h:85 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:787 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:1238 (discriminator 4) include/linux/atomic/atomic-instrumented.h:611 (discriminator 4) drivers/tty/serial/serial_core.c:3158 (discriminator 4))
[    4.145473][    T1] 4 locks held by swapper/0/1:
[    4.145847][    T1]  #0: c3671348 (&dev->mutex){....}-{4:4}, at: device_lock (include/linux/device.h:896)
[    4.145878][    T1]  #1: c36708f8 (serial_mutex){+.+.}-{4:4}, at: serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:637 drivers/tty/serial/8250/8250_core.c:700)
[    4.145878][    T1]  #2: c3670358 (port_mutex){+.+.}-{4:4}, at: serial_core_unregister_port (drivers/tty/serial/serial_core.c:3319)
[    4.145878][    T1]  #3: c682957c (&port->mutex){+.+.}-{4:4}, at: serial_core_remove_one_port (arch/x86/include/asm/atomic.h:85 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:787 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:1238 (discriminator 4) include/linux/atomic/atomic-instrumented.h:611 (discriminator 4) drivers/tty/serial/serial_core.c:3158 (discriminator 4))
[    4.145878][    T1]
[    4.145878][    T1] stack backtrace:
[    4.145878][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.0.0-rc3-next-20260309-04774-g34d1a9ee5966 #1 PREEMPTLAZY  83767d4658804fdb707cd87f036b1fb90901c8f4
[    4.145878][    T1] Tainted: [T]=RANDSTRUCT
[    4.145878][    T1] Call Trace:
[    4.145878][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[    4.145878][    T1]  dump_stack (lib/dump_stack.c:130)
[    4.145878][    T1]  debug_check_no_locks_freed (kernel/locking/lockdep.c:6695 kernel/locking/lockdep.c:6728)
[    4.145878][    T1]  ? serial_core_remove_one_port (include/linux/mutex.h:253 (discriminator 1) drivers/tty/serial/serial_core.c:3157 (discriminator 1))
[    4.145878][    T1]  slab_free+0x32/0xa4
[    4.145878][    T1]  ? serial_core_remove_one_port (include/linux/mutex.h:253 (discriminator 1) drivers/tty/serial/serial_core.c:3157 (discriminator 1))
[    4.145878][    T1]  kfree (mm/slub.c:6487)
[    4.145878][    T1]  serial_core_remove_one_port (include/linux/mutex.h:253 (discriminator 1) drivers/tty/serial/serial_core.c:3157 (discriminator 1))
[    4.145878][    T1]  serial_core_unregister_port (drivers/tty/serial/serial_core.c:3322)
[    4.145878][    T1]  serial_ctrl_unregister_port (drivers/tty/serial/serial_ctrl.c:47)
[    4.145878][    T1]  uart_remove_one_port (drivers/tty/serial/serial_port.c:150)
[    4.145878][    T1]  serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:719)
[    4.145878][    T1]  serial8250_probe_platform (drivers/tty/serial/8250/8250_platform.c:196 (discriminator 1))
[    4.145878][    T1]  serial8250_probe (drivers/tty/serial/8250/8250_platform.c:218)
[    4.145878][    T1]  platform_probe (drivers/base/platform.c:1449 (discriminator 1))
[    4.145878][    T1]  really_probe (drivers/base/dd.c:585 drivers/base/dd.c:661)
[    4.145878][    T1]  __driver_probe_device (drivers/base/dd.c:803)
[    4.145878][    T1]  driver_probe_device (drivers/base/dd.c:834)
[    4.145878][    T1]  __device_attach_driver (drivers/base/dd.c:962)
[    4.145878][    T1]  bus_for_each_drv (drivers/base/bus.c:500)
[    4.145878][    T1]  __device_attach (drivers/base/dd.c:1033)
[    4.145878][    T1]  ? driver_probe_device (drivers/base/dd.c:925)
[    4.145878][    T1]  device_initial_probe (include/linux/kobject.h:193 drivers/base/base.h:73 drivers/base/dd.c:1090)
[    4.145878][    T1]  bus_probe_device (drivers/base/bus.c:576)
[    4.145878][    T1]  device_add (drivers/base/core.c:3696)
[    4.145878][    T1]  ? dev_set_name (drivers/base/core.c:3495)
[    4.145878][    T1]  platform_device_add (drivers/base/platform.c:758)
[    4.145878][    T1]  platform_device_register (drivers/base/platform.c:821)
[    4.145878][    T1]  accent_init (drivers/tty/serial/8250/8250_accent.c:28)
[    4.145878][    T1]  do_one_initcall (init/main.c:1384)
[    4.145878][    T1]  ? early_serial8250_rs2_setup (drivers/tty/serial/8250/8250_accent.c:27)
[    4.145878][    T1]  do_initcalls (init/main.c:1445 (discriminator 3) init/main.c:1462 (discriminator 3))
[    4.145878][    T1]  kernel_init_freeable (init/main.c:1696)
[    4.145878][    T1]  ? rest_init (init/main.c:1576)
[    4.145878][    T1]  kernel_init (init/main.c:1586)
[    4.145878][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    4.145878][    T1]  ? rest_init (init/main.c:1576)
[    4.145878][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    4.145878][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260316/202603162130.75f32572-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

