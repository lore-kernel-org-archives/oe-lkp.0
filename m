Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DF1360751
	for <oe-lkp@lists.linux.dev>; Fri, 20 Mar 2026 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993248; cv=fail; b=HYMN9BXBG1NG03IF9o93zBKhoDm+PSO+FliZN81FQ4my0oiQDZdoC0auIhylz5frhUmYwWpcy/XRF9qc+sRrKbmnT4W+BBErmh7io1fKrPOn1PXWmbOVaIQuwIgNT8RW5Vd2VkGQaXsuYT/UfrM6n6zBaTlEzlHlUUonpS+3L/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993248; c=relaxed/simple;
	bh=Yfz/qaw7kniTR/O4doo3j4phVQ0McE5FWjUjuDonaMM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rgt58a5FjV+gGxcUB/i9vQmAHrY3X6DXU1qBRUtpYNB4yk/+9+Z6xKHUPErGnKcDox3LxFytQti/OLYq1gB+5DhUU/bPzvKSdsc5VG9HXkpX1dpIOLo24B+0okHS9f/LOLozdp+OUQm+bFZdN3S1BLYyHbW5nyQ/efiO/tHRqrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJpSS+Ct; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJpSS+Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773993245; x=1805529245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yfz/qaw7kniTR/O4doo3j4phVQ0McE5FWjUjuDonaMM=;
  b=HJpSS+CtPo1o9U5pQiyV/X+OZUs8jdkFSMa3QqO53/U/VxjJmNZbArZh
   L5jaebPgoi1GxGWwGtS7AUWwfJrWvy1RFJtJ8eLoXMJNxRgfppv0mEH76
   DAUtuMuLQpRL5Gw/j1pmbk5ps+H1PHR0LxCEk0OjquhjWeZI3qdm7yXZZ
   WIR8SVxK5UhUH4VfR5tca9+76XkzNq/irlULbLRV63b2IspAWzOH8esXo
   8CGqMhLMKqjO5zMrPmsxHxA16nuiMsVik4of+SPE/3mMSDvT4YvICmILb
   2dPz+4mOfU1oNmYHr37h7h2am/raFheTRvx+kEUN1miofz207kFD8ehcq
   g==;
X-CSE-ConnectionGUID: QOtutZJqQNeQcu6FvwPbqA==
X-CSE-MsgGUID: GpCCuBXQR3OAfuws/vP05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97691160"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="97691160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:54:05 -0700
X-CSE-ConnectionGUID: afYiwgzQRi6SxBuID664Uw==
X-CSE-MsgGUID: mdHxd4XMTFG8grdRBUdaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223238498"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:54:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:54:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 00:54:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 00:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ8cXEzH9MoKU+fN4bB7lsWbTwUyR4o7XriSqQ5t6UV8SiTuT/oEBsrhxH9TAbvv3CKFFEPkJLNhVLYI//GvDIgpwDD6DdyvDIAGEC5QMqq/dW1FTK/e34jG9+onzpMwYUrC1I5ceN38Au/OumivZnxXnnbNoa4Ng6vOtzNYwXdUr/pa12iLsrIs+bxCpmXGGaeSNbvqCk9nFtNWevynSj0Sa6PBO/g07f/8K1YQcx6p6lU66G8hLYQfg1M7aSWCrz/zSq1ZNM0l5a51RrCqMnXzMAKS7zcWxygWQM3xk4DxzxSkbqjO8/erN5KLa/8hSJrDetPpUjPF5p5ycknAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFNABYX8vUZSh0Cgy8ZWNWP4+z8agYz/fRUodXxtrVk=;
 b=NfE09XHjWQrBh48PpKmk76QaZiupvXM+MK6ZlSWRGf4nFZkMPOVeVyhFWuy+F33DlQ0jSejzxe4H7Hu8sq+b7Ih7N7mF2NmdEyZ3BtWCazxUFn4XOk2+zfRUhR6QxELPEFrx8/61mRj3Ft4mgzmqUz29HuCLOJSQoVgONWdtoDygBIONjOkfRASdC+1GZdb7itcQgpHniTGXMZqprZ5DpnNDjzwjLpDvFYJ+LRTVwrin0TdUNvXzg5/Wm+8AC8jak7+MojSvlaLhaAkcydhqGXEItha8ihXwT1DBXRixuhdoZMtYbScJ1M5c0ifBNcuHtFZdp1V5O9I3jUG2y5sBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 07:54:00 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 07:54:00 +0000
Date: Fri, 20 Mar 2026 15:53:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:free-late/v0.3] [memblock, treewide]  bbe3478393:
 KASAN:use-after-free_in_memblock_isolate_range
Message-ID: <202603200841.b2d24d21-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6706cc63-bcec-4c4e-ef80-08de8655d92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: tL3I8mnOR33qd4ldUX96JHaSW3VxhrDhTBXOKe1femaJDI1lbPim0RXkdDbh8MaCLnlJdcP01CTNmJ6d32PuFiOhBOeiow7CJ4Uah+JaZYbrtet77gLXh6LcSNuMNwQQn8MFq8AhzG0ec0wrypzfIYs11gLxJ5ngdrn1xz0jcCBuikz+yC7IVRqDSk+E0tx1d2fjtVhqrDwYubMnEEtAHV14Y3iODLzPYM1XSvSTvqIJ1p+kvScIZn/EhdquxgRYuo9LR1eTE34hkoePbEGDEAZ7xAE7OsBXfJMGiolr5NMTwvwoe5a4/Ku/O9vyAbyjkCS6f4T8BMUIGrk36jbFtNxczqKh0sOe6SNDTD5YtEaCQoioqojJigD/YxgrLyLOeIVpN6h3Po1Cyncxg6ajadyY/InytF8dXvZtvcBh477ApdW10EqMZZSP9Mi1v4L79Mys2F6R6XgEL+SlOakQTPp8+TRpKX82mdCgUMxWo8Gkx5AVdXgWTtP5gL3/27Rd7GLsYmqbpjA+kYWLtrzlTKOkoJEbWCqvBFX25hs2qdbGbtf1Q9lAKTW94bR2GmIeWMCEtqg2EUxi3vpDtrxytptQ5E9WJNTz+W/z6rlMDQnN/sLp2850mr9/nDr8zhHmOweFRa8F6NZvdjOi1ztQqjoLwVTHdA3WpNsWMovBYcKqphEl2Qv2tegY+IGijssI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U/51fMqT3aYLYhkhWE0Iw4IIyGSMuf9fnJBCp6yGa5Cy82RBvO8IgZdKLCKM?=
 =?us-ascii?Q?D3SHwVJUYHqE4khP7tYuYbfvfhkyDZcYchTVpwbYv9U6Vvj/BbAdkPiLw+3o?=
 =?us-ascii?Q?mf/Jsqmeea/Egaqrr4JOQCa8DjKXQjPF14jC3C6t9mE3PBAyNDwHWk95Ma0M?=
 =?us-ascii?Q?slC0uRly62DcH3R1lNmfhn77ECagfZCBXYA4J6WFomLzJotVrKddMeqOVetX?=
 =?us-ascii?Q?BlV0BixvCHfslUjvE7uvdnYdK5rZqzA9+2dSuafrizHO8PsyfW8Oa13f3IYg?=
 =?us-ascii?Q?DlrYg8BJ2yYaWV05X0T90+Gb/H+fiXT3Sd0u1U2Ky/qkRnZ5S4IVom5TLpYJ?=
 =?us-ascii?Q?2zQ1TO4P7gJDlL3ADUjYRblEyurCrbIBYEGgpLPR7MXo2u58+ye0So1S9KA8?=
 =?us-ascii?Q?ldYxjC/d2ByJz5Jin6xwOmQn600OK0SpnNb/ShSIzIXGV9DNtD/ysUXXJE0+?=
 =?us-ascii?Q?Kj3i9+x45rEVC758yvOEsIlwkohavst7o0c3bRwox3iWkqarfrY6Zzs+/8rs?=
 =?us-ascii?Q?MnT84Ymto3nbYHOTYz3d5IAF3OVHNylvn8PSVLf0vqQwEbW5btGZ4OhaiWB7?=
 =?us-ascii?Q?NtvOzAc+8g/B6sAuCASAjpjlfpTFu4K8gTJcTZEDI3Jay4/eviAzANzKsCYB?=
 =?us-ascii?Q?Sc+1CTFGk0ctH6MtDlNtKoalrftX8w99aTLi1TZT9Wi1Ac5vRekjUvjTx8ME?=
 =?us-ascii?Q?CHAOG8pXEa8Cs9OzGjARVzBQcu9QxL3hTfVuNA1C4wCsvP6toowctv1BAyEv?=
 =?us-ascii?Q?5fd/gxkZI54/iFoq1CqYJtKorujLhBY5rVKyG/o8kitaEJ8tLAAS4JXxalzk?=
 =?us-ascii?Q?XnmO+JvJCz04yijpBTOBmslW89Sk1eJLYIV+ok3HYdmOkUwe3XAYShTx1F3S?=
 =?us-ascii?Q?NKEZKTs4O7bBMkYHQfCW8K54xjCuzxBgEPWGOio0gT8YNIHrfxTvEdJ4VyPs?=
 =?us-ascii?Q?TJxcLJUB0z2iNAl8UorGWiAFrXcm0uRDce4Se4kWz7iuqKWXegVT49D0ApRx?=
 =?us-ascii?Q?K5u0rsiQNVqzpFXKEyT+tlT5fk+B59e58pVQxCWaxcgr34Mt+IlMfYIbB/lk?=
 =?us-ascii?Q?jFSlskpoly1OAKPVzrSBjbmjy83+/EpzRkNf99J4cQOjevxfltSdkb15eL1P?=
 =?us-ascii?Q?2VoCZjWUThOMOaZiYRmDN9XwpMYB9ToS1WyXQ180am6m+KA1rnuH4hRiGIPN?=
 =?us-ascii?Q?i6klpcsyIT4G2e+7RW0MSGYV1zmOLKHxKIXgFus5V4yFqMvXSIwp2YuovMyR?=
 =?us-ascii?Q?1Emdo2SwAHQbELP3TQ4FDIUIccATsB4+yR5YsJeYzHp6vNmS2mbebHYfzwOG?=
 =?us-ascii?Q?U57Yz1NtK2k5ZJiYST9ldf3pu6ceCjcX4WJOY5GQAVPKQ7prj8DwJ0YX+BQO?=
 =?us-ascii?Q?YUvHszyVFo+Uh6okI7+mVU3nzEtptHZktdP3dbxXQqAOCdlwiDpEnVrL4T2A?=
 =?us-ascii?Q?4sI5vrqZeF/g+eKsUKQIGfNsejcHPG+vLr/kHZ6N+FtznfH4UJtWx1rV+K/p?=
 =?us-ascii?Q?UcOF9SfCV1hse4eiIbWTmkgKS2DasicX1tpvieZv1jAGfVMdv8Ja4QhdKdUo?=
 =?us-ascii?Q?RlMHiMLLV37SZiLgscAZdfGyHrxXovgT9wsXJdI+PBenKn9BZbZHAuyRodTs?=
 =?us-ascii?Q?/xbmfXX95qxDpoNtbOE7BzVU/KdSm1Gxq8colM6/bkpZ+z52mvG51uJUHm6i?=
 =?us-ascii?Q?KilfzYAQEx+P6haMC+3J+OiLS35p8nvMBh70/ffCEyRyGSakmutvoV4M7X7q?=
 =?us-ascii?Q?Qi3c32iJ5w=3D=3D?=
X-Exchange-RoutingPolicyChecked: aMlKvvaC62YtunY8HN873vFr2HdzQb8HzN56z0vz5h15jWdhrDikJXtGjvQe/4DJfDHCOk16ZVBzXFe7fJI7d6ZM5oRJNBl+5q+lviMUVrKM9KNlz8+JwItAGIBTT+WyXs7Hh4SJpRLHcKZIFKfjJDCUGg9c/F49m7Ydam9qN1z7knviA5RnGE7ajDccbhkx5mYT1rGFVhnnk+svm+/TlLr/BSf4VafhzWqZ1rUX7gRXUxPEdeuvW61+wUCHJLun3mdoCsRYG2Qn+TeZDFWh+2va/7uTpyaytGAmhi8FMofN98JPjp0+rkfs2lJalYsl+s2JpAbAlmawKUQkymdLoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6706cc63-bcec-4c4e-ef80-08de8655d92d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 07:54:00.8604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0pLdLuxQnolE13uG0xcPkhfq6ObTi21MVyIGZSG2WO19bTplEsFBYffie2Dg249o64EMRZYbJZtFytvaDF+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "KASAN:use-after-free_in_memblock_isolate_range" on:

commit: bbe3478393e135e2fc98f32fa8ab182de6742136 ("memblock, treewide: make memblock_free() handle late freeing")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git free-late/v0.3

in testcase: ltp
version: 
with following parameters:

	test: uevent


config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 22 threads 1 sockets Intel(R) Core(TM) Ultra 9 185H @ 4.5GHz (Meteor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603200841.b2d24d21-lkp@intel.com



kern  :err   : [    0.977424] [      T1] BUG: KASAN: use-after-free in memblock_isolate_range (mm/memblock.c:828)
kern  :err   : [    0.977424] [      T1] Read of size 8 at addr ffff88887f3aa000 by task swapper/0/1

kern  :err   : [    0.977424] [      T1] CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc3-00007-gbbe3478393e1 #1 PREEMPT(lazy)
kern  :err   : [    0.977424] [      T1] Hardware name: ASUSTeK COMPUTER INC. NUC14RVS-B/NUC14RVSU9, BIOS RVMTL357.0047.2025.0108.1408 01/08/2025
kern  :err   : [    0.977424] [      T1] Call Trace:
kern  :err   : [    0.977424] [      T1]  <TASK>
kern  :err   : [    0.977424] [      T1]  dump_stack_lvl (lib/dump_stack.c:122)
kern  :err   : [    0.977424] [      T1]  print_address_description+0x88/0x320
kern  :err   : [    0.977424] [      T1]  ? memblock_isolate_range (mm/memblock.c:828)
kern  :err   : [    0.977424] [      T1]  print_report (mm/kasan/report.c:483)
kern  :err   : [    0.977424] [      T1]  ? __virt_addr_valid (include/linux/mmzone.h:2114 (discriminator 1) include/linux/mmzone.h:2196 (discriminator 1) arch/x86/mm/physaddr.c:54 (discriminator 1))
kern  :err   : [    0.977424] [      T1]  ? memblock_isolate_range (mm/memblock.c:828)
kern  :err   : [    0.977424] [      T1]  kasan_report (mm/kasan/report.c:597)
kern  :err   : [    0.977424] [      T1]  ? memblock_isolate_range (mm/memblock.c:828)
kern  :err   : [    0.977424] [      T1]  memblock_isolate_range (mm/memblock.c:828)
kern  :err   : [    0.977424] [      T1]  memblock_phys_free (mm/memblock.c:875 mm/memblock.c:991)
kern  :err   : [    0.977424] [      T1]  ? __cpuhp_setup_state_cpuslocked (kernel/cpu.c:2522)
kern  :err   : [    0.977424] [      T1]  ? __pfx_memblock_phys_free (mm/memblock.c:981)
kern  :err   : [    0.977424] [      T1]  ? __pfx_buffer_exit_cpu_dead (fs/buffer.c:3051)
kern  :err   : [    0.977424] [      T1]  ? __cpuhp_setup_state (kernel/cpu.c:2536)
kern  :err   : [    0.977424] [      T1]  ? buffer_init (fs/buffer.c:3162 (discriminator 1))
kern  :err   : [    0.977424] [      T1]  memblock_discard (mm/memblock.c:398)
kern  :err   : [    0.977424] [      T1]  page_alloc_init_late (include/linux/find.h:214 include/linux/nodemask.h:253 mm/mm_init.c:2345)
kern  :err   : [    0.977424] [      T1]  kernel_init_freeable (init/main.c:1475 init/main.c:1692)
kern  :err   : [    0.977424] [      T1]  ? __pfx_kernel_init_freeable (init/main.c:1664)
kern  :err   : [    0.977424] [      T1]  ? __pfx_schedule_timeout (kernel/time/sleep_timeout.c:62)
kern  :err   : [    0.977424] [      T1]  ? __pfx__raw_spin_lock_irq (kernel/locking/spinlock.c:169)
kern  :err   : [    0.977424] [      T1]  ? __pfx_kernel_init (init/main.c:1574)
kern  :err   : [    0.977424] [      T1]  ? __pfx_kernel_init (init/main.c:1574)
kern  :err   : [    0.977424] [      T1]  kernel_init (init/main.c:1584)
kern  :err   : [    0.977424] [      T1]  ? __pfx_kernel_init (init/main.c:1574)
kern  :err   : [    0.977424] [      T1]  ret_from_fork (arch/x86/kernel/process.c:164)
kern  :err   : [    0.977424] [      T1]  ? __pfx_ret_from_fork (arch/x86/kernel/process.c:153)
kern  :err   : [    0.977424] [      T1]  ? switch_fpu (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) include/linux/thread_info.h:133 (discriminator 1) include/linux/sched.h:2064 (discriminator 1) arch/x86/include/asm/fpu/sched.h:34 (discriminator 1))
kern  :err   : [    0.977424] [      T1]  ? __switch_to (arch/x86/include/asm/cpufeature.h:101 arch/x86/kernel/process_64.c:377 arch/x86/kernel/process_64.c:665)
kern  :err   : [    0.977424] [      T1]  ? __pfx_kernel_init (init/main.c:1574)
kern  :err   : [    0.977424] [      T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
kern  :err   : [    0.977424] [      T1]  </TASK>

kern  :err   : [    0.977424] [      T1] The buggy address belongs to the physical page:
kern  :warn  : [    0.977424] [      T1] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x87f3aa
kern  :warn  : [    0.977424] [      T1] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
kern  :warn  : [    0.977424] [      T1] raw: 0017ffffc0000000 ffff88880a4c7f30 ffffea0021fceac8 0000000000000000
kern  :warn  : [    0.977424] [      T1] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
kern  :warn  : [    0.977424] [      T1] page dumped because: kasan: bad access detected

kern  :err   : [    0.977424] [      T1] Memory state around the buggy address:
kern  :err   : [    0.977424] [      T1]  ffff88887f3a9f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
kern  :err   : [    0.977424] [      T1]  ffff88887f3a9f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
kern  :err   : [    0.977424] [      T1] >ffff88887f3aa000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
kern  :err   : [    0.977424] [      T1]                    ^
kern  :err   : [    0.977424] [      T1]  ffff88887f3aa080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
kern  :err   : [    0.977424] [      T1]  ffff88887f3aa100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
kern  :err   : [    0.977424] [      T1] ==================================================================



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260320/202603200841.b2d24d21-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

