Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891BF9EC
	for <oe-lkp@lists.linux.dev>; Tue, 12 Aug 2025 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754961523; cv=fail; b=YFJRfmK1DxMw7IGaTVMn0DSSekffeLv78GMgDscIS7bPxaFCjgXM0eqXs2RIRPQxMQHKGrmHXOJPfuJ+s9UDvUekGzlIcMF6wQ/KE2abG3sEa/gFWFtbfXgY1ZTN2/+wSJxSQnQgK496LaY6quXXuJPNH/GdiNzOu11SH1yD/1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754961523; c=relaxed/simple;
	bh=XB5AXt919EsZX2wvjqw9ggTsgiECEraCX+8Fjtidn3k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=L6WwFBUttorejrbEuGdGG5AC3BeT/8GACYBDdWBj32eIzIwXSDhJ/NCB8kb0epBwvUD27Ovgrv1L0FQU1uvtjQJV3Z54kT4kXFGXZMhLEGJneloQURajXlQ+tDBaC5fHUX2/vTS8P/tTi8GQKywxkbKiZlviKgqaH2QyBPBUflo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OD9mIpgj; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OD9mIpgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754961521; x=1786497521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XB5AXt919EsZX2wvjqw9ggTsgiECEraCX+8Fjtidn3k=;
  b=OD9mIpgjQ+Ye2x5ZQtZnGUkasjZ6PUky5GFpgbvQvq47y7YfmCr53wh8
   iGLns7w9uJUW3XTTTQ83ozKD2gQkee+zLOcKZXhId1TFvrsovuPTUMvhd
   OT59/qdXIsc6GCbFkzj3od3q1MH10bGiBSOq8/KG0ADU8aVGUGyxLanI7
   2I9KmmFtKnLjllKXx/ZgDUsZSBQu6+PSUbRYrJFnDNDOGHf+XggJLqwWK
   d/r+8Rabu17ODW3RSwEvjX1Uc51X75q7cYq79WB7IDPU+/F0EaVe3oyTb
   48IL6ImhOuqLHUfBvRIhZ+qTvPkUATZZfEQzFIJqRw+4KrH09MR8gz+Wl
   g==;
X-CSE-ConnectionGUID: yaLDWsodQO+UA3jricV/Aw==
X-CSE-MsgGUID: ejIcqVElRyS2KPM0gckG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56941753"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56941753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 18:18:41 -0700
X-CSE-ConnectionGUID: lM8TMpEoTeO2f9jxMxlzxA==
X-CSE-MsgGUID: vGl7Hoh6SIWyJgXRWXkU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171299685"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 18:18:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 18:18:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 18:18:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 18:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq2CxSUFtnnv0RaMIK0j43VcLrc6AQ5HCvjUP7pGpn931IPn0u4ZMe59AZX+3B2NAY4jtZheOS9PkCHA1I5FHNyIh/qmaAiTnm56fK/kxV/1vrbal+4ZUfbfNpNrTPSNiKy7Q3hag2EfJKO2gW5SikhlXaIySit56uHYScJCPD4nSjLJE7Oic0AFGpRmW1UujfeNnmaFaE/pz0xHL48E/It0V+FKV+m+aC04xMpKxewz8KUDi4OG2BErLM4C/b20BXr9HsexdsV9kDLVCHw994e7uonkgkirXJUFd5ylD/mMeZ+X2uPG4agmOUMixKQ8KcgV0JSpqXTK5vTr/CXjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/oKL4AooZMNcoYjQ4jTrjwHKVbl2T7Kr5d3B+LcQfw=;
 b=HFU1knCZKnoRcUHAmbZJnsOgbmw3NBqdSSvefFLaNwB7xBzm89yGr7lVIrXWgDruZeKelL+xg2GiLCrgh8XsRJ0q5vpE2hzsp42kTNtXC2VmFRpWobL6O/+fJYXe1xox0fzQPqb5XMDM9pzSoOa11YQqJ8ss9opHwKKIVvD6rrD/i5ToZE09ff/8qAZqlgZMa/1RK2dCRgGfLdISHO9sLPCDevDNqKKO7ux+FYWCPHE6cv1NV2DhEuvuWYVtcGOWk4SDkhqMGk4wTH8WGC9oaFYsHfTufOBt++nEavrSo4k9ARCTID8faAe5qeW4f6qg2jut1OruetjTbot2XLrUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 01:18:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 01:18:37 +0000
Date: Tue, 12 Aug 2025 09:18:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Keith Busch <kbusch@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [kbusch:kbusch/nvme-virt-boundaries] [block] 4b2c69055e:
  BUG:KASAN:slab-out-of-bounds_in_bio_attempt_back_merge
Message-ID: <202508111006.156446a5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 75854af2-7843-4378-786d-08ddd93e2a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FFu7QbcA1ncFiyhjuzZshCOdplLaMnG2MZWfE5prMxCRaSZ29xl3jdnmwRk2?=
 =?us-ascii?Q?+KruEsZQUcVuwAG9SI3Vjq9aJxcunJUeh5j8SJnts+B17mDOlzgIv4qVCI6L?=
 =?us-ascii?Q?BgCGfD/q7usih26JvCRijThF8RjHMBn8bBe4agfwO6UzDDO+4IBAIeCQA0fH?=
 =?us-ascii?Q?4DwqvRjBSQoZT26Et5R5jRNfLnSzoSsVWu1zsR7gXkO7vo4MPqpizjaZVs5C?=
 =?us-ascii?Q?eCTfylFaoramG2M5sc0OJcbP6DcD2LRHfcNFmPV3LJYarXwdnyvQamTs9yH+?=
 =?us-ascii?Q?ajLidpip/1Bk7u0q4KF8JUnpAAN9w9hahR4RCei85FZGjZk44qPYSIw42NSn?=
 =?us-ascii?Q?CN4vThP5UZ7aEYJ3C7J+gP/9s/p+R3u6IA6ZPVVB4RvNvZYr3S3WHmHnqq1s?=
 =?us-ascii?Q?68MGpldbjBWFVKsEZdGKL5s8aPHLURxmOe4z+kpqWLb6UN0I0AJjsYwrd07F?=
 =?us-ascii?Q?4ePD4Y+LsDHcOIw0udXpm0cZXWdmSkE6Xz7YxSA2dWdEWUuRfHlje1NDN4DX?=
 =?us-ascii?Q?cvv41M9w1tu7MUOVGQ9vnRd3uNGOAxQahG4MAUkaKe0094nR4uyVzNTl3x10?=
 =?us-ascii?Q?2c1OM7h+KlO4c9A4X32N3sCCn49AMuW0F3zkaQIU57ajhnPvTikmAMDU9tla?=
 =?us-ascii?Q?3cWadue60k5lf2RgBJXPWZ0X3XoK1Y3G/2j5+EwxhtUarTw7oPI4MAGH82Eo?=
 =?us-ascii?Q?S+M92KH8GTGeITd3xc0OnxN8XdyADHPYXnouWPnOBkGI726Zaf9UULVyKM74?=
 =?us-ascii?Q?CfpIdOkf85Khf1JSgsVqbMNVKUKB62n43zZn8tpea3fGAfeotpvYv1CkktyQ?=
 =?us-ascii?Q?Nlaz2fdqS+T+dAMnlv5Ln0dJOkBrRbhFkVWSRYV7dBWpEqj3oxP62TGnvRoH?=
 =?us-ascii?Q?y/dOjdcQy2QylbNVfahuISgVVi4Wu4Zvpb+aI8GE+oqRRxbn/a765a5sumsA?=
 =?us-ascii?Q?6CeTJ33b8uSCtLxYwChSpky92pPcA8WrDtGCpL7kcN2SdOavoW5LHrlCFIsR?=
 =?us-ascii?Q?GCuU8pOA+UWHPfb6RGObj6M+ZbLbN8QGHZDctG9LiwH2oEOqaGym1K4hTfKF?=
 =?us-ascii?Q?KA0OR5tC++/YHghEQlKMnOoA85MtORz1mw8dao5qA8z+7kNLUqhTIT418xn4?=
 =?us-ascii?Q?PBb8h3bgr17hK3p1HmiAB6MiUkRQvOL0VoX7F4EhhJt8lgpCKbUuCZs8swYC?=
 =?us-ascii?Q?hk+9dNoePqfW0hRKSqJ0hFcftUcNSLXMo7xDGQPW/bcyMrLZhg/2HU+qKRsH?=
 =?us-ascii?Q?9C9q+R8oah0hP0lmw8IT8hkP3QRsbn6qG+O/jpne4I42yhpVfWKPctk5qdmQ?=
 =?us-ascii?Q?uFagokGkCoem0yHzQeFHKZSO9LFN6wt1blFsyf+pCe8+h/VVJe4xTCZaS8L6?=
 =?us-ascii?Q?GYRKBYoSPUTrspNu9JXPZ/uSPyqF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aNYb429MhHIRfS5XKLC5tmSU5ZTrhCykiWZ4LSRBmRy6rwxoV6HcwDXLxK8+?=
 =?us-ascii?Q?ZG4TDT1LkcBWRVkN91tDdvKTJFJKqS8EZvSi42K7KcVfFwHJNoevnjVK5YTI?=
 =?us-ascii?Q?b1tVWJpERtjiqcuRuWrLlcLBWHfOSvT6pq0ILQc9it/PWpjFSG8kk9LBe5V0?=
 =?us-ascii?Q?ftgaNYnwXr/N0D2Ubb114cGZ9U0RziuveG6uaZCN5hcBLD2PoMyn2M58pVu/?=
 =?us-ascii?Q?ie/Z8DdAXFJO5Ftk0FiMbM5yKd/6JRT2gEu1CaoYvW4OMMcfm4D7jP8trmqZ?=
 =?us-ascii?Q?i73rzvQ9POLQcMWx0EMwuVnEse6v0Xglw0cxYpH5GoD3DgKWkSFqSSP51qxU?=
 =?us-ascii?Q?UttdZPQhVegMA5Wuzn/A5a3WYOijQiJ+o0+cufSzbwqjNzed1rdyhHYFcjGW?=
 =?us-ascii?Q?gAQHrnc7vRJldV+BDfU0ZY6JsrQVT+SkKsDL9hcdI+nKP9qQE2OJ59BR++El?=
 =?us-ascii?Q?sbxrs2Ya79qUiFRPJZopVDI5aPBnSOj/l3bwOLyDek/CNXiI4daxOEne8pC8?=
 =?us-ascii?Q?QKFcwnpIyYE6rzTCUEZdvRhW2Dvp7VCrLggWzPBbX3r8FcgD3O3kdRD2rHDn?=
 =?us-ascii?Q?f6UG/c3xeyuY/5LgrVrCzoZgcUfcFj00CLyfI1uQcDfEqh2BcBsJwOnPVkvd?=
 =?us-ascii?Q?Wjlh5jYimbdi1bjwV9BzyL/4RopA/mVRocBr8h4Iqmj3DcMiS6P7X2Z21RjL?=
 =?us-ascii?Q?z5Ga6CjED9+FJAppuxk+6oI3jfJ/DZJIfaKXhcwZi052a+TQNow4e6X/Scmf?=
 =?us-ascii?Q?HaciamYaX4Qlzzx0945sz8NXD+g3JfNXZRrQk3TVNmH7TJX+gs2JSCtXY19b?=
 =?us-ascii?Q?5HLavWFyrNdcBM0UK/D+bUo4+6acF6XpsYoiYEP9+ay5i3VgWqfrwxj/9c8P?=
 =?us-ascii?Q?PBXtoqFQLIBQBd6XClyyz2auaSZ13BUm4UgT0Z/yKlu4Ufli3PHzcaDWxeDZ?=
 =?us-ascii?Q?JQkswTu88nB+FXMDlKNPMFXjitpgEm6hMZjgguhQQIHx+S53ZIpCHvwfF9k3?=
 =?us-ascii?Q?gVa++oPaKuhR/sHmumv1BPPH4jwpwZ5aeYGzuYH3Fqv/EMXhTjsGRRDILqvr?=
 =?us-ascii?Q?K42Oh0eC2GijHWYxqlAj5hjILDH4smQIxPVfFzju0b+8ZwwSXp9zZVCux0SP?=
 =?us-ascii?Q?S7JvvSFFw5R17vkCnNdxMXVqD9P2GoYS9j6B3u6wH79javg76I1yI95cLj6F?=
 =?us-ascii?Q?wIB3vHN8Ov0Mh/biGMEUNqU/rH4dYRdYbCFhCSXUWWmB4h6WBIxFOIp94HB0?=
 =?us-ascii?Q?QBzeT9/ttBDRpvfTDkGaK1YfQevNiifrstC4WNFrXofT5gmsKOVmfUp9ej3x?=
 =?us-ascii?Q?qZat98qM4t91tvPp3wjMKjjt5/f0ZAe5thEx3mLeShjghzUWD6DehesMQxia?=
 =?us-ascii?Q?y32Gnsob1ikGI3vkTHlhNBkgwXjZidXtbTyJowIlHLT+/fUI4j8X69mdypUL?=
 =?us-ascii?Q?8xE4CopAcJ/bdkG6+lV2Ypw7w6nCf2XU6cTgJwWhZQO6n/o3pR0Gh0SPUq6d?=
 =?us-ascii?Q?IuTNQg4YpzNUdzEIj1fl8xqJBTVe5sOr1Qm6S2vHRT5eD2rO5PpI2otirPI+?=
 =?us-ascii?Q?2QJPPEY5BsXXf41Q/aFszw0NXW1w9MMDPgR6xzvX/16PvrQiNV2txUG9EZJC?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75854af2-7843-4378-786d-08ddd93e2a1f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 01:18:37.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl0pkYxIJnQc2Ww/I/Xwn0OZ9C9nS2MuB8CqdSeN8FERhkr1tjQpMD1pHnM4uw4kwjzVjc8r8SugkQKypd5rdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in_bio_attempt_back_merge" on:

commit: 4b2c69055e7e8bd39ef0858004c514cd1f56fb60 ("block: accumulate segment page gaps per bio")
https://git.kernel.org/cgit/linux/kernel/git/kbusch/linux.git kbusch/nvme-virt-boundaries

in testcase: xfstests
version: xfstests-x86_64-e1e4a0ea-1_20250714
with following parameters:

	disk: 4HDD
	fs: udf
	test: generic-log-writes



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508111006.156446a5-lkp@intel.com



[   57.299469][  T159] ==================================================================
[   57.307376][  T159] BUG: KASAN: slab-out-of-bounds in bio_attempt_back_merge+0x5a3/0x630
[   57.315441][  T159] Read of size 4 at addr ffff88813624d0f8 by task kworker/5:2/159
[   57.323073][  T159]
[   57.325258][  T159] CPU: 5 UID: 0 PID: 159 Comm: kworker/5:2 Tainted: G S                  6.16.0-04453-g4b2c69055e7e #1 PREEMPT(voluntary)
[   57.325263][  T159] Tainted: [S]=CPU_OUT_OF_SPEC
[   57.325265][  T159] Hardware name: HP HP Z240 SFF Workstation/802E, BIOS N51 Ver. 01.63 10/05/2017
[   57.325267][  T159] Workqueue: kcopyd do_work [dm_mod]
[   57.325291][  T159] Call Trace:
[   57.325293][  T159]  <TASK>
[   57.325295][  T159]  dump_stack_lvl+0x4f/0x70
[   57.325301][  T159]  print_address_description+0x2c/0x390
[   57.325305][  T159]  ? bio_attempt_back_merge+0x5a3/0x630
[   57.325309][  T159]  print_report+0xb9/0x280
[   57.325312][  T159]  ? kasan_addr_to_slab+0x9/0x90
[   57.325315][  T159]  ? bio_attempt_back_merge+0x5a3/0x630
[   57.325317][  T159]  kasan_report+0xb4/0xe0
[   57.325320][  T159]  ? bio_attempt_back_merge+0x5a3/0x630
[   57.325323][  T159]  bio_attempt_back_merge+0x5a3/0x630
[   57.325326][  T159]  blk_attempt_plug_merge+0x19d/0x200
[   57.325329][  T159]  blk_mq_submit_bio+0x14da/0x1f10
[   57.325333][  T159]  ? __pfx_dm_split_and_process_bio+0x10/0x10 [dm_mod]
[   57.325355][  T159]  ? __pfx_blk_mq_submit_bio+0x10/0x10
[   57.325358][  T159]  ? do_region+0x1bd/0x6b0 [dm_mod]
[   57.325378][  T159]  ? dispatch_io+0x220/0x2d0 [dm_mod]
[   57.325397][  T159]  ? dm_io+0x3de/0x940 [dm_mod]
[   57.325416][  T159]  ? run_io_job+0x2e7/0x6a0 [dm_mod]
[   57.325435][  T159]  ? process_jobs+0x117/0xab0 [dm_mod]
[   57.325454][  T159]  ? do_work+0x1be/0x2f0 [dm_mod]
[   57.325473][  T159]  ? process_one_work+0x679/0x1000
[   57.325476][  T159]  ? worker_thread+0x718/0xf50
[   57.325479][  T159]  ? dm_submit_bio+0xff/0x3f0 [dm_mod]
[   57.325499][  T159]  __submit_bio+0x173/0x880
[   57.325502][  T159]  ? arch_stack_walk+0x87/0xf0
[   57.325506][  T159]  ? __pfx___submit_bio+0x10/0x10
[   57.325509][  T159]  ? kasan_save_track+0x10/0x30
[   57.325511][  T159]  ? __kasan_slab_alloc+0x6a/0x70
[   57.325514][  T159]  ? kmem_cache_alloc_noprof+0x120/0x3b0
[   57.325518][  T159]  __submit_bio_noacct+0x146/0x530
[   57.325521][  T159]  ? bio_associate_blkg_from_css+0x2f1/0xbb0
[   57.325525][  T159]  ? __pfx___submit_bio_noacct+0x10/0x10
[   57.325528][  T159]  ? mempool_alloc_noprof+0xee/0x2c0
[   57.325531][  T159]  submit_bio_noacct_nocheck+0x5d6/0x790
[   57.325534][  T159]  ? bio_alloc_bioset+0x44f/0x7d0
[   57.325538][  T159]  ? __pfx_submit_bio_noacct_nocheck+0x10/0x10
[   57.325540][  T159]  ? should_fail_bio+0xaf/0x140
[   57.325544][  T159]  ? submit_bio_noacct+0x7cf/0x19f0
[   57.325547][  T159]  do_region+0x2e2/0x6b0 [dm_mod]
[   57.325568][  T159]  ? __pfx_do_region+0x10/0x10 [dm_mod]
[   57.325588][  T159]  ? kasan_save_track+0x10/0x30
[   57.325590][  T159]  ? __kasan_slab_alloc+0x6a/0x70
[   57.325593][  T159]  ? kmem_cache_alloc_noprof+0x120/0x3b0
[   57.325597][  T159]  dispatch_io+0x220/0x2d0 [dm_mod]
[   57.325617][  T159]  ? __pfx_dispatch_io+0x10/0x10 [dm_mod]
[   57.325636][  T159]  ? __pfx_list_get_page+0x10/0x10 [dm_mod]
[   57.325655][  T159]  ? __pfx_list_next_page+0x10/0x10 [dm_mod]
[   57.325676][  T159]  ? __pfx_complete_io+0x10/0x10 [dm_mod]
[   57.325695][  T159]  dm_io+0x3de/0x940 [dm_mod]
[   57.325714][  T159]  ? __pfx_dm_io+0x10/0x10 [dm_mod]
[   57.325734][  T159]  ? update_load_avg+0x1cb/0x1300
[   57.325737][  T159]  ? __pfx_list_get_page+0x10/0x10 [dm_mod]
[   57.325756][  T159]  ? __pfx_list_next_page+0x10/0x10 [dm_mod]
[   57.325776][  T159]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   57.325780][  T159]  ? dequeue_entity+0x341/0x14a0
[   57.325783][  T159]  ? update_curr+0x400/0x560
[   57.325786][  T159]  run_io_job+0x2e7/0x6a0 [dm_mod]
[   57.325806][  T159]  ? __pfx_run_io_job+0x10/0x10 [dm_mod]
[   57.325825][  T159]  ? __pfx_sched_balance_newidle+0x10/0x10
[   57.325829][  T159]  ? __pfx_complete_io+0x10/0x10 [dm_mod]
[   57.325848][  T159]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   57.325851][  T159]  ? __update_idle_core+0x51/0x350
[   57.325855][  T159]  process_jobs+0x117/0xab0 [dm_mod]
[   57.325874][  T159]  ? __pfx_run_io_job+0x10/0x10 [dm_mod]
[   57.325893][  T159]  ? finish_task_switch+0x155/0x750
[   57.325897][  T159]  do_work+0x1be/0x2f0 [dm_mod]
[   57.325916][  T159]  ? __schedule+0x79a/0x1520
[   57.325920][  T159]  ? __pfx_do_work+0x10/0x10 [dm_mod]
[   57.325940][  T159]  process_one_work+0x679/0x1000
[   57.325943][  T159]  worker_thread+0x718/0xf50
[   57.325947][  T159]  ? __kthread_parkme+0xc6/0x200
[   57.325950][  T159]  ? schedule+0x75/0x190
[   57.325953][  T159]  ? __pfx_worker_thread+0x10/0x10
[   57.325955][  T159]  kthread+0x3b4/0x780
[   57.325958][  T159]  ? __pfx_kthread+0x10/0x10
[   57.325961][  T159]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   57.325964][  T159]  ? __pfx_kthread+0x10/0x10
[   57.325968][  T159]  ? __pfx_kthread+0x10/0x10
[   57.325971][  T159]  ret_from_fork+0x22c/0x300
[   57.325974][  T159]  ? __pfx_kthread+0x10/0x10
[   57.325977][  T159]  ret_from_fork_asm+0x1a/0x30
[   57.325982][  T159]  </TASK>
[   57.325983][  T159]
[   57.773229][  T159] The buggy address belongs to the object at ffff88813624cc80
[   57.773229][  T159]  which belongs to the cache biovec-64 of size 1024
[   57.786990][  T159] The buggy address is located 120 bytes to the right of
[   57.786990][  T159]  allocated 1024-byte region [ffff88813624cc80, ffff88813624d080)
[   57.801542][  T159]
[   57.803725][  T159] The buggy address belongs to the physical page:
[   57.809974][  T159] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888136249680 pfn:0x136248
[   57.819935][  T159] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   57.828251][  T159] flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
[   57.835880][  T159] page_type: f5(slab)
[   57.839710][  T159] raw: 0017ffffc0000040 ffff88810df00000 dead000000000122 0000000000000000
[   57.848113][  T159] raw: ffff888136249680 00000000801c0015 00000000f5000000 0000000000000000
[   57.856518][  T159] head: 0017ffffc0000040 ffff88810df00000 dead000000000122 0000000000000000
[   57.865010][  T159] head: ffff888136249680 00000000801c0015 00000000f5000000 0000000000000000
[   57.873508][  T159] head: 0017ffffc0000003 ffffea0004d89201 00000000ffffffff 00000000ffffffff
[   57.881999][  T159] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
[   57.890489][  T159] page dumped because: kasan: bad access detected
[   57.896737][  T159]
[   57.898922][  T159] Memory state around the buggy address:
[   57.904393][  T159]  ffff88813624cf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   57.912291][  T159]  ffff88813624d000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   57.920177][  T159] >ffff88813624d080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   57.928069][  T159]                                                                 ^
[   57.935870][  T159]  ffff88813624d100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   57.943757][  T159]  ffff88813624d180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   57.951648][  T159] ==================================================================
[   57.959564][  T159] Disabling lock debugging due to kernel taint



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250811/202508111006.156446a5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

