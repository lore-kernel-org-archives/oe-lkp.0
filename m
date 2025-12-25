Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4F944F
	for <oe-lkp@lists.linux.dev>; Thu, 25 Dec 2025 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766639915; cv=fail; b=mDgbaqPqnlxUGpAOoB/HZGCM9DhtIYmveYSiMNNRqhLVKqCtuz5RQ0n43FM/JjTuHlxtNkkd6CGDQjpEd9zgn+kEtvJ6XdZtJ/mPrlbqHnElksthUhSV27NWkVCPWTypMMRjRolIzhTv5igp5KbRAjugHvFC5mjMWvI1onRfogg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766639915; c=relaxed/simple;
	bh=B9vHjIqaXnNJyOYNz6izznRXxRlp6qtnLg2MBfdw1HI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EuogCyb9AE59vGkGfJGWvvzyGTCbBeN8miXShKXxy95y9MpnHRY5cbNMvubGJJL+f3J9uGC26ocVEuG0XIqZerDjJqbRzsZvZxJZVwEa8Yn3f+siVdjQNR8N6TAPoV+IlUx/N16YYFDsakshvEq0NJZDq0C9p/7/LOX58CaWq0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0uKZYzo; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0uKZYzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766639913; x=1798175913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9vHjIqaXnNJyOYNz6izznRXxRlp6qtnLg2MBfdw1HI=;
  b=S0uKZYzo4IxcXiWIeWDMPOiC0VhTpDT28m0AGRCbMV8NDerZ3x6mu6x+
   FAXPVka0RgeCpUroxp4U3qMv8itGbxc+POPCuXhGsMIzjOwyMMNjDqXYf
   whgkTkUFbVKji77SEGGh05IghCNxzZEVHiTftPw+m0DtdPgLudQpJYova
   utGd86ftt5Ux+i77z3ZSODkLZ3CYR3JhKf0PXErwHEjqf1jZTjHe25wO7
   yCdNnN8bUNLuHoP+1mlSMde0hHuEwIzIa82Kajb4oPmx9l7n2xtJ9NDb4
   Q2zk6T8M1ccxS14FAEB5h1udo72MGXLGUFzwRRfgHS/01Plc87TtbfpMB
   g==;
X-CSE-ConnectionGUID: FRjv7RziQi+hMO8UoFok4A==
X-CSE-MsgGUID: vpiE20lXTT6avDK9mVU0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67649413"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="67649413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 21:18:33 -0800
X-CSE-ConnectionGUID: PTPRT6wPQhaMjGHfZICv7w==
X-CSE-MsgGUID: EmX+t3fKTNidNdPEj7nkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199798939"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 21:18:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 21:18:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 21:18:28 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 21:18:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDMD8R3LbqSqSDeQvZuQZrz7G8idEhQs52PGktJEfPQojLFnXh9Llu8fjtYRE8nNYDlB2Ze25UmWws3auMu+1o9Ck91BTeEAS99dDu/HOe3OZ+lPFJrMUjXEGPpvsi5BRykRmlhg5p1c9r244jirLi+Ghs8BdM3MbcSeQ4gMtzv82FFqBTQFdPoPIOi3mrDaY8N6qM+ZpsoENHQelOeegGbMCeqketysQ6jiDUKuaPtP0F1kfvxyYsJTAM/4ulH5MK4znB0qJfp2/mHNfegnz5+wZ/ybz2yD6ih0IvGxaqkS0OlWh7VSMjFNxv96c6Yv19pAjBauDLAhq3g8XxTfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpFgC6l/fTTwTdR5f/aLKnnQat6qjs6QwVXXh6gDytA=;
 b=vkQzwNkWDVb2nGccQrCuwIZNRbn2OgeyRMZ0aLs/w2uWpIYugZ3Y8FrdHcdJ3h7acIEETJ+PZvbOCOZyUajNcNgywxGyDsJhBa8opXR4lPfqmbn3478FzxxXu2TZBy3R5xU6EL9DWYwkYpp86pWotni2ACob5jjFlyWIJetZySCL860OWAEWtp999X38H+bZiG+DAE4B+8shQfumGTJ6otqhFg8IHe+4JYAyrNvhMcgY4vmVho38l9E9pwatUgnJb5SE+zbKcoWTpPkJ9IpD8mWBcs2QC53C1VpCwcJUniat0XLFC1l8GQuL9ng5IbfuL5eLOngrS9fWMOMz6eZ5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Thu, 25 Dec
 2025 05:18:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 05:18:26 +0000
Date: Thu, 25 Dec 2025 13:18:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v0] [dev]  2b98427856:
 UBSAN:shift-out-of-bounds_in_mm/mm_init.c
Message-ID: <202512251347.f7f7338f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dde9d80-7374-4c46-7702-08de4375082b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JVhdXrhOkVaV+W19ptCG2MUnXdPmamMf26BCLM/DqYf9P25ksulkYou+09Wq?=
 =?us-ascii?Q?hRgZ6Cwhbtbc/5BPccEhLreMlRsYu7IX24Yy4sbboWW2Jky4/Akaw3bw15sW?=
 =?us-ascii?Q?ybgNJnYnYOH5loR6BsASzYrUoPAkDv899+D8MFgfuHsRD3MMWEn70LNC7a72?=
 =?us-ascii?Q?w8bI5ELGlQmAuHpvTGiuP9706gb1r1xtqsh2V2mTCRzXc8PPDMig1AXuBNT5?=
 =?us-ascii?Q?AHahRB6bDKj3tKCrOPHrIb1BKzhKfcjBfquVXRDHqyLfenxjsNW3DI5LL732?=
 =?us-ascii?Q?nGvjuObcyxGVU3GQ8T7lq0hOeRBvzFU8LRhDcUJhl+zEwJ8pxqgHRGkI8nSl?=
 =?us-ascii?Q?i/776P6zZ76DF+cjIrPpuHhdJ6ZOAJWMk0a1KIHy79eICnNgZ6CM1j8T/ORU?=
 =?us-ascii?Q?r/7np85NKIlfXIMQr/qSmW/Adxa4zFiG6jyFOwWzHU07PGEQDMg+KwGwbiUd?=
 =?us-ascii?Q?fE7nUYm317WXh5cJsDKUQ/CSKRPTJ5aspxxuJ1IvcStiINxaosk4AMCzNLVe?=
 =?us-ascii?Q?qeNFJTPOhAKCX2/L/4Y4RBaT2j99uIbWuIbbZ8DbdWbb2SsPOFJFa2K7aOeR?=
 =?us-ascii?Q?6BQVUKhfTyOiQVfYYNbXXa8P+VYHK4rIn5yrx3RTzWZ2t/VL+stwRIEn9k3D?=
 =?us-ascii?Q?tXfUiD1OPdzEJtKc1dgoCyCHA9NnFV5QKeqG4mCGOl2Ny5tfUZBjvMhAV+tQ?=
 =?us-ascii?Q?CfaEBtW9oB/M21P9itjhZ93Gdy2hT4lMjfGdjKMhpGZukKiNKQn1ulQUtxXa?=
 =?us-ascii?Q?vrjHSZp5iHtmIfHhbdpvuexOOvoHtZcWNn4S6ZZGzuKvcaPcrMB/BHTzBX54?=
 =?us-ascii?Q?qomeRPyHqoG/u/mjHZ9R74U5xz2+2XStUs15QYo8CHhQS2m7JuNeviNwPyyz?=
 =?us-ascii?Q?hWrjUuaUbMlSZy7+HWAxAcXNgIZ/y8kngQDFUAlUkHTDk0RQaalj64kedytj?=
 =?us-ascii?Q?rAu/Hmor0M6xlUgvwDOYasiXTmThvy853mykeEPxWnUbj4Cxg/J6kvQ8u2P/?=
 =?us-ascii?Q?s6jHz6eHZWuJgvUaeDHiN2mcs8lzSoNJIvGQ10co2PZ0oTzq3pdEQ9qEpFzQ?=
 =?us-ascii?Q?LiSyn1yV3q23XEfMf/vWsgmRlJU1QNG3UIwxYDshz8MpOcAlTMRiODqFFQB5?=
 =?us-ascii?Q?l7N3EoNb6vYAD3D2YOuL+BfppYwaMjE3V7o2HprBmKPATkF3tD7yG2v9MVX/?=
 =?us-ascii?Q?D1eyVwSJ0O6m9ellhB+wCB+iO6a6B2bed+nTLjFoCrSKA1j8TYiYhMNcMa2o?=
 =?us-ascii?Q?tfp2DtE/8s3rhGPAXUe1bDrddo7hUX0jeXNeBZXHwhgWf3BceE6BWDAlUOaE?=
 =?us-ascii?Q?VyDA4pSseJOlht5jGo04K2i65I/kp419B3YZlTztq2pUuwnyw/82bPuJWgyk?=
 =?us-ascii?Q?3WZMVK/HG1f0fFj3mPLshilr8o1BaA+VszjT6k9rgdQak754ItjoKtOyAOQC?=
 =?us-ascii?Q?wMA4Fv+aD4CIKJWtRkB3whlXJUtHEXItV8U0EHoyHRdtlAC8fQhg4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UhbC0U2WNpijIxy31a6SaOABTmgoaaE1QNpmV8zdze2SNKDYXZX1/fXKH8Bo?=
 =?us-ascii?Q?p1EWAq3nzU7zGjy3o3gYpzkJ1bkbgcFLPmfCtrFWb3qT/YNW0Tv02zJQKaxh?=
 =?us-ascii?Q?Uy5aQboIde0ujFxwDTenMZ1z7ey09Q3xbmXAIDojJsOkWv0F4NWR1jeUjXS6?=
 =?us-ascii?Q?7nfNKvbGzbf+Y/o2c0+DrDaL6Pedlr44iyA3WzdnXyYUdmBBUCjQCby4zyl0?=
 =?us-ascii?Q?0scQ9hAJjzooPj3RsUgCxvGMWININMcv6R0VzgbNcMdJJTkZGQshUNt6ALDu?=
 =?us-ascii?Q?aPPQLH9jUWTCYLuaVVItpA3pMLsXmjgp6K270JWCzttEQr6DbocQAQIsSGRv?=
 =?us-ascii?Q?TLT1m4L3DnoX89fF7cNXMPCEZ/GVPaGY3ZkhIeQ5+zBMBGOmhgrtk+6C7WdP?=
 =?us-ascii?Q?ZlRFhgdJKmYRKZyIkVQp8IVPP1jqkO6OEFOeboaotMHSGp7teTCBfgHQZ9fe?=
 =?us-ascii?Q?G6wM2X6Iz5e8Fjuzn8hPn2wJvjQqW2ok3X8faufDTY3+u9ccEMkf9jeLq3UL?=
 =?us-ascii?Q?U45I/nOARCBDwgz/ldczEjWDEdRaTZKEQ5lsqoGfHuoeXm+M51o0C4qw7LdK?=
 =?us-ascii?Q?81aMEceZpnVPD+BK+MWt5A8bun+n8HXk9eXgDgbWbeZZ5iFyio3/qzYaEv7U?=
 =?us-ascii?Q?YlY/SJ2CUabiZqz+feVjuFQ9Cksi9bmKrDm24ZVexx1rY0oFonIgFc0Mwg3j?=
 =?us-ascii?Q?AbHvKiFFEikO4dWpH8dI6HLvZeDooMoIjQj6jeFM0DUaWarWJbXQBkQAvBmt?=
 =?us-ascii?Q?dsfqGYi20HdWnGtF44FApt8TuNV9CqL34WBTIoXzD4+Qdb+ZPMl8x5//WJhd?=
 =?us-ascii?Q?zn3tH1Sr/ncBxGrEchgiTKe8YjM0OczMCXLS31UwWji7oQysqtNiLVBrG4sn?=
 =?us-ascii?Q?quoRNieiaGrBrhNp8GOVBKTJwgd+Jvu9G9QKebnGUXX5uyAl4LAGjYK8QJLG?=
 =?us-ascii?Q?JELDzqbxo2pYyxks8cefb5mxHLWAJKuaigor6+/UYUxxQYHSqiH5z8qZS34m?=
 =?us-ascii?Q?6Urmh1o+pcVZNyknjtE+/NkDb9GLKfw2GJ68eSX1GFdIF1zvUjAGNitNJNsl?=
 =?us-ascii?Q?WDBU6Gm9AGiYHbQ++OJuZrLFK8m1pcJ8vml4Y/Zjsgv6XnjHKxnsD1JcVV/E?=
 =?us-ascii?Q?mGaWR9QoyNmL3ObvIIm1HCyxlvkIsLhllD7lAblQ8PNLh8ysQKAGMH+onM07?=
 =?us-ascii?Q?DSlv1zx3L53cX9N+Oh27kR9rpaIGwvs8M+A8RxP1D7YHMYnK7xDRtFAQmLlJ?=
 =?us-ascii?Q?IoUHNUPM4Ada2nnrOdOGleHOESSKjFWNgfPj5T+0ypXTLq1z8ExUHg6yAXpd?=
 =?us-ascii?Q?uyrQMQRi2RtrxIKyJ5nHjZ4yAHiFYL6DaBZc+8RVQRjWlikSzTQruR8foymy?=
 =?us-ascii?Q?0oWiQiN6QdWTe/p/wtLYXoBB76KtVw5h2546Tg+23kv4+hFP/iY0GMmKcUqj?=
 =?us-ascii?Q?HWyDgpU+9zcxosoE6bwrSPJeKjlvbeJij4fINeD23jW6IZmIoiGli4RKS0F1?=
 =?us-ascii?Q?W2P32EdLJh0769aMUA0XUHvVnbcah8nZK2xD9+MaY3sU8/FMEMPDXMAtEpb7?=
 =?us-ascii?Q?xytvglE1xwekxQi++IR0S1jWhDqMdL5irCdyzrx7W5RtxBWApsD4kFO1f6vD?=
 =?us-ascii?Q?vpQUoaKMhkVI81+Iq3TmUkjDGA7U1uVKMNk3PCDe977KuSzGJ3b1tiV9qB8T?=
 =?us-ascii?Q?+NzHpo8E4NUOBqyQS9sQW1uC5QI0BqEenIbrwy0mw4xDEixikBWbsIaywQ5w?=
 =?us-ascii?Q?pb2FCldTKw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dde9d80-7374-4c46-7702-08de4375082b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 05:18:26.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOv/waR3qkmpQgfhspxlWuPCi3J6aWOGp5xfGnQH91ItZa+WL7UEva91Q9n6XueStDaTbXD9ZFfre9tqn1E2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_mm/mm_init.c" on:

commit: 2b98427856c3bab5b9989be36f76a0b44e81099b ("dev: use arch_zone_limits_init in free_area_init")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v0

in testcase: boot

config: i386-randconfig-141-20251225
compiler: gcc-13
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------+------------+------------+
|                                           | 79e90ca6f9 | 2b98427856 |
+-------------------------------------------+------------+------------+
| boot_successes                            | 6          | 0          |
| boot_failures                             | 0          | 6          |
| UBSAN:shift-out-of-bounds_in_mm/mm_init.c | 0          | 6          |
| kernel_BUG_at_arch/x86/mm/init_32.c       | 0          | 6          |
| Oops:invalid_opcode:#[##]                 | 0          | 6          |
| EIP:arch_mm_preinit                       | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception  | 0          | 6          |
+-------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512251347.f7f7338f-lkp@intel.com


[    0.070716][    T0] ------------[ cut here ]------------
[    0.071237][    T0] UBSAN: shift-out-of-bounds in mm/mm_init.c:2449:21
[    0.072048][    T0] shift exponent 4294967295 is too large for 32-bit type 'long unsigned int'
[    0.072859][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc1-00023-g2b98427856c3 #1 PREEMPT(undef)  12358efd7e0fe5d0b7a874cb915884e48f72d5eb
[    0.074145][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.075111][    T0] Call Trace:
[    0.075416][    T0]  dump_stack_lvl (lib/dump_stack.c:122)
[    0.075843][    T0]  dump_stack (lib/dump_stack.c:130)
[    0.076239][    T0]  ubsan_epilogue (lib/ubsan.c:234)
[    0.076637][    T0]  __ubsan_handle_shift_out_of_bounds (lib/ubsan.c:496 lib/ubsan.c:496)
[    0.077234][    T0]  alloc_large_system_hash (mm/mm_init.c:2449 (discriminator 3))
[    0.077753][    T0]  vfs_caches_init_early (fs/dcache.c:3257 fs/dcache.c:3304)
[    0.078259][    T0]  start_kernel (init/main.c:1065)
[    0.078690][    T0]  i386_start_kernel (arch/x86/kernel/head32.c:129)
[    0.079146][    T0]  startup_32_smp (arch/x86/kernel/head_32.S:293)
[    0.079607][    T0] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251225/202512251347.f7f7338f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

