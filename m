Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB9286898
	for <oe-lkp@lists.linux.dev>; Thu, 14 Aug 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159326; cv=fail; b=inIA4adpoJYhZtURVS8CKULRyaIsRSqVARzzntbj4mRBtQLg2s2FxZnVhkvOcNPreYHGrQcDbTDTtLBn0MHa56cyTj3nPDvocDrgZQu+eqzzKOR8lHmaayvGLNOUNGnMQmaghEcOk84LT/fK77/Yxjh6g+FbM0HexuNwm7nJLm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159326; c=relaxed/simple;
	bh=+zarqFFc/Cisq15JniA+zu+zuEGwQyNNwsrP4unxr5k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GbKlyDCPUJ+jUOnXBY3l2iUUW4JOI7Vb8RlMOm8CoDZJDjWEkhd9xeR2D/OBqV6U3iNPDle1KwjQmMK20fITcKrjmf468PH7PYy09SB9O1u95m09x/f3SRe+jL8nJ08Hp8saVqjuVXgrYjvCTcDiVMEkUT11XLyvijRUDLI+iDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nffP+y7r; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nffP+y7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755159325; x=1786695325;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=+zarqFFc/Cisq15JniA+zu+zuEGwQyNNwsrP4unxr5k=;
  b=nffP+y7rOGreMwhczoghqqPiO8iPSdwHD9FDLtl3ko4y7efIW4gwn1U8
   qtDmDRvZ9UlgnP5QJZS+V6XN04Myu2drX9iZkOHR+fK3IcKTXg/HQ22C0
   0SIPXuOznV8HkIcWVYAjctqH5KBywODf+wTM2rhUizB3nJ9pn/nWA8TZf
   gZgNh5mxWcom+4Kt+GYsBjGYmAXEHDf9mFrHvtsnGJD/agaTpoALfkv4x
   vzEFSvKbp3T1deVNRCyNptL6cdpDA4sXlj1edwChtN5eycqklpaeGFlXe
   GejUw1Sfsy5cjLSr8TECXdeWwCEUziv2Nmi+VP2/9awl06oTKwILRiQds
   Q==;
X-CSE-ConnectionGUID: EO2hLRCeQtqk9W31GgjVwQ==
X-CSE-MsgGUID: zBfObzNVQOaHe9+NJZkJ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68548585"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68548585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:15:24 -0700
X-CSE-ConnectionGUID: Z1EDCwbASVuwRHBMmyOgrQ==
X-CSE-MsgGUID: s7OGaJVyQGGesj91JjXwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197555219"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:15:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:15:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 01:15:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpLxOOWhIcKJlpBiW1FFg6Izu+plQndiFKMyjRmtzl/MRXj4dQlmW5qoz1kLSSWp9uBbzP0wPDIi4mROtS5lPUctqjDh0E3Wer4tvL+vheJmR/SlKfDqeddMXHmxB9I1BanL4hdlk25WDiDulRn03sHnBXTE8tJtK44fAf4Dp8NdLaXuXaLTeZw2i9OhkQiLo3YWphEOyKnsqDMklZYFKHOn4p1nxIi82dKCSTg/sdokd3844S44tXYkCEeuQDSqvf8o+uXuT0Sxx4F9msBJdpMDJpoOGhcdKlx0lYNKoPCMAlYCLEfO0arr/3LuNNtyIH4AB1zKd7LgmCkbXjY28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDTsdw8O99OWaOgaUrny2eqxyb+TqjaBhOL3l3An9F4=;
 b=BSPQC3wk/z0siZGOgIZ2rlkQu4QmSyM1gDom9WILhFpxPrbqNUnoHzIrKj2q9RiVeFjzt27bicAVHlDvTtk5DkjXzlH20tRBmUMO1V8h93I6okr5CmOLdC+Fr3XWaKbDBTuLcEYW6ZrHukga7mcZhhxRbVm1PbjyTRBZcLcAgbrxg8zxkcVLeTE6VUPvVpD1rgoQmRfP8KEKywcwxJa8n20giZO8hjt+081jhVfCLiGR2GJRC7euFTf1vwE53DeAov1Br3TseSpkLZ54B2EuKzfejxj2yY/cwLRWRoLUTPXjW10b4G9Q20hsMFVVbXLo6wAKz246yMWlz/sao+TMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 08:15:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:15:20 +0000
Date: Thu, 14 Aug 2025 16:15:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [platform/x86]  f5d93c582e:
 lkvs.intel_sst.sh_-t_isst_cap.fail
Message-ID: <202508140927.1e393fcd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA4PR11MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6d532e-6330-424c-2886-08dddb0ab5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AwhPanOtjN8eFgg3kYDHjGLCOFLeQUXb5SEgrPI5A2v8h9pHsmypgLhV2kig?=
 =?us-ascii?Q?dhR4JsxGZcYDfPH2sfZz4zmQizQNFDglv9gjsUZlBJAhJET6/quWOxiGV2CJ?=
 =?us-ascii?Q?RC/2SJgeeWBEuhwgxqeOyAjcTyeYzQ16VJJm7l+20622tqpU7B3icDY/tCYr?=
 =?us-ascii?Q?ox9NEUKQPz4VIr2Ll1Doj6ueIfaN20kcLhyueA8NhnKWWFkzplm2SKKvqhNX?=
 =?us-ascii?Q?sucpIy9Ojinsdz24RrJagGMnFTmBTwadb8S3al8F5N4D9IhCxrK6VcrQNtDm?=
 =?us-ascii?Q?rW/sg+xvKGCunSQS3MciJn4O8n9YYwtN7lzCLHju2P3aU12sbNswaaGEk9oP?=
 =?us-ascii?Q?dWarqe1hhX1zJsoYhDc6lO0VdF+wJmMoTN0VcuFTfhlk7s0NnEKeVo44JSdq?=
 =?us-ascii?Q?eI77PSomi7eGPeGs1QnPjLYSwdoTS0pv6d92AxjMwb5+oAzHfBhzVMyct3nZ?=
 =?us-ascii?Q?rfNUzNjK6Tn4exImZmVtcgPUKb3ArxXyYozBUbo4Jz5QXNUQ/cIJs9Krwo/M?=
 =?us-ascii?Q?TzL+9gzYNzfYDj8GcgctaqE8SIa3pDkMHz95IIa6imO8HOtMl280lNnpw8h3?=
 =?us-ascii?Q?8HnAXe8Ie4QFQuMx1nLMD/cDMiGU+XV7Nrar2g54b2nKGzCWafhj0f+qDx5q?=
 =?us-ascii?Q?OYDs7dPhHzZl+DzLTksalseQX9+rd6VBpRfGTqusguGGrAcATPgCdUOIjm0E?=
 =?us-ascii?Q?bPelsuy9tqsD2+pChZrwCEmcxYCBlPUYmIOl64G5GWwm0ScfhlQxB0WfWJWb?=
 =?us-ascii?Q?zxecR7sTvQIdQ0BEjIehDluOxfWcWXnlulkM0xQCeTup0w0hgxusKk9JU2pl?=
 =?us-ascii?Q?EuMK/W/1Y9MAtBKiEXg2l/STF/DcwuqeX08Kp8zIn1552CLMvCrlY4mzb1sH?=
 =?us-ascii?Q?YDv/U2mG9ZTj5Buz7z1flPNLYbI5I6r7tAIAxgVsl/DN2KiOXVK1qvor+sAI?=
 =?us-ascii?Q?BAZ/rIhSdElDcgVlir5Clru32zPdiySfg/4qOQXi13RzJNu8pnTwJGGyQPnr?=
 =?us-ascii?Q?9UJ/o8YPU8f8a6NhdgZ7L1L5cW1UoMX1TmTN4loQCuNHcYHnlnPpw5WFedwr?=
 =?us-ascii?Q?i8iyonj38bbrq1IxsZ6TmLliCyzt6zIumcRrlb3zYeX+ZP6m94NEo/jC5Cdr?=
 =?us-ascii?Q?ux/30jvBX4jnIeMSgon5rHI/tu4xx2dsY/FgJw1IlBbQkjbjXcpXbkogOICY?=
 =?us-ascii?Q?Jt5wHYqWqn70dkh8fWJveOd/a+b2RQZYtZOMbWv9KaZlRegKV1ynPwi8P7bT?=
 =?us-ascii?Q?xFF5xj9qZ1UeJ4zMe0R8oVM5+xgIyoVF1vNkEON1pPNj53jlw4oSerN7BSic?=
 =?us-ascii?Q?HDQfmhn7Gg8uch6zi11d/vBtnHHglfp9Qdl/fdixGKp5eTNqTViUI1UDVtrH?=
 =?us-ascii?Q?mN0QtDG0kEpn+KOguntsTcnR+NxJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W3pIkEJXxgxrW9LWZNQtJiqk4PC9Y+2ujR/Wil0xlATu/FONiEVsvf2/atBJ?=
 =?us-ascii?Q?Uw3v4B5Pve1bgZYYP3odV9PJGp56zxLWAH+4/Uie3MExBVDGLNHcENhMWpsi?=
 =?us-ascii?Q?W1e99/Lrxo3HldZWcQGLIEVbEnRTeAAY82irUmw8kTXaErF/obaKCJFEf2Rh?=
 =?us-ascii?Q?rtsw4mKztsXVr+c9KMULw5gYtjJXwbLI5W9+UfF01d993634gc8Iy3UOU6U5?=
 =?us-ascii?Q?mj7CcHToZDsMvwnbpIpImYXmtRF2CHys8eST8Wm6YzD3OlfY5exYAeKsoazq?=
 =?us-ascii?Q?qYYQV50t+8PcimUVJFgBB0Kv7nvDHsu8fvBwl/uP2mqQNwMFF8tN48Hw2MrI?=
 =?us-ascii?Q?RAHCuvIId3BN8VLeGXwx88cgvhJurmyHcNIhgfWzfWXpODE78O/xUbylj7/u?=
 =?us-ascii?Q?nd+dEn+ctHFY7ey9rQxcQ9MKL/CD4xFXHfIzhwYxk/zVgNf/FuPfrCXZiQH3?=
 =?us-ascii?Q?gYtP4F66nomDxE02whhkQVRHkPnG3pybDLy+iEU/fhH3P/ZXayLmCbQeI/3g?=
 =?us-ascii?Q?+aov9Rtmqk5Uai/CXFLHroqZo2ZpFZzWsLV7E2sjjx1tUhEMFVwL7rgjxsL4?=
 =?us-ascii?Q?wclp4ehKqgRoKWPvH5a68amoDHOImNxMuSsG31BhY67x1G73PSeyU3KythY9?=
 =?us-ascii?Q?BFQOivqpBfbOyNFu70/oPP/CXh1r3FQnfkIHIkKzjMXDgX5EhABI5Q6zqKbu?=
 =?us-ascii?Q?3Pu8yK8nhZm0H4LDCPIKE7hl1SmxewLb6XMi8B+m0Hl8VhhoTrBBjMmGxfIH?=
 =?us-ascii?Q?E2yHlLrAhcIqCTO3NFhRJW386/6iY8kJKg5EKgtaU42MR99nQ+q3nRvsT3hx?=
 =?us-ascii?Q?o0ZAZJhZVsMh/1nwFIWxzfyPqY2XUWjiEh524wpZ23cewYhjOj7FzVu/LsGk?=
 =?us-ascii?Q?dVRisLvhYnMHPrt1BqBauF3sJjvc619tPilQEN41RVMLJRQdxXURKvp1y+wU?=
 =?us-ascii?Q?BR6RZE8sasQEzbkC2RSMT8c7x3/Rdvx8cgoibvGl6V4NLq+rfYdaErDEuvCU?=
 =?us-ascii?Q?JqWheijr3Oed7vj7e2qq4pSW3ZveXRGnilbacjJVK6vcejYgq7KGbdGEKQDw?=
 =?us-ascii?Q?XffA8Zo1bjY/ujl/RbNyPdSWlsgkNCRSMEoF0XXC5wzs3Fa5wwGfaDbO/Awr?=
 =?us-ascii?Q?ms6z0WBKo6FPMhWLBdpdD5xyL95kxDf1OVISpNzyX24eWp8l6P0ybboUd2OE?=
 =?us-ascii?Q?tffdRsPLj6gAyt6aT2VKYp3A6i7BJgRopTC8kqgxWAsnzX9Yi0tTsPgH1/2D?=
 =?us-ascii?Q?Sf29HjuYr2PMeSXOG1mIkApIW5cvbFAWXZKpLdcPiHS6FuCrGZZvh9yPwkXs?=
 =?us-ascii?Q?JiShBmqEd/soHgKhD0YMv0Y3TJOmg77luxXpMpAnBFv7s4DYI7CjUYejddFI?=
 =?us-ascii?Q?o3EXSHDLSbjW1ShEYRLjAdFkjkB3KcJ1S/UI5dFe62tMagG29fom0Z0UlpFj?=
 =?us-ascii?Q?gug1G26Vg8GqzA/kA6Djcj8ztDaxjxzEUd9dT81si7bdR8xI3KGFFNrhoJ0L?=
 =?us-ascii?Q?jz6pww72CLoqnq7/J71h3dcrZ5M2HsW6VvIbKW/A8elQVQp1rv628dnEC2+a?=
 =?us-ascii?Q?65w12zJEDCJyVK+u46QxkmHI1TXgM04gLxQuJBq9EiN/tlcvpOcFJ99DCbkq?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6d532e-6330-424c-2886-08dddb0ab5fb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:15:20.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEbChuTzhN4xwH+1eHCFgZUpGdeR82Ht6V5VOxtDCIJMVRWTpCnDF2Vbu/AIwqMEoBDR9ApIvdXpUEcKtAID+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9107
X-OriginatorOrg: intel.com


Hello,

kernel test robot noticed "lkvs.intel_sst.sh_-t_isst_cap.fail" on:

commit: f5d93c582e5a395d1c9dc760a5c95d673d6f7b30 ("platform/x86: ISST: Supp=
ort SST-BF and SST-TF per level")
https://github.com/bytedance/kernel.git 6.6-velinux

in testcase: lkvs
version: lkvs-x86_64-ed500e5-1_20250812
with following parameters:

	test: isst



config: x86_64-bytedance-6.6-velinux-func
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (G=
ranite Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508140927.1e393fcd-lkp@intel.co=
m


besides "lkvs.intel_sst.sh_-t_isst_cap.fail", we also observed below tests
failed while pass on parent.

ac5b441808c2d0be f5d93c582e5a395d1c9dc760a5c
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cap=
.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
assoc_set_get_clos_0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
assoc_set_get_clos_1.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
assoc_set_get_clos_2.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
assoc_set_get_clos_3.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
disable_ordered_type.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
disable_prop_type.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
enable_ordered_type.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
enable_prop_type.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
max_cpu_assoc_set_get_clos_0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
max_cpu_assoc_set_get_clos_1.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
max_cpu_assoc_set_get_clos_2.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
max_cpu_assoc_set_get_clos_3.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_max_0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_max_1.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_max_2.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_max_3.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_min_0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_min_1.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_min_2.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_min_3.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_prop_0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_prop_1.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_prop_2.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_cp_=
set_config_clos_prop_3.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_hp_=
bf_freq_pp_level0_orderred_type_test.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_hp_=
bf_freq_test_pp_level0.fail
           :7           86%           6:6     lkvs.intel_sst.sh_-t_isst_pp_=
config_enable_status.fail




<<<test start - 'intel_sst.sh -t isst_cap'>>
turbostat version 2023.03.17 - Len Brown <lenb@kernel.org>
Kernel command line: ip=3D::::lkp-gnr-2sp3::dhcp root=3D/dev/ram0 RESULT_RO=
OT=3D/result/lkvs/isst/lkp-gnr-2sp3/debian-12-x86_64-20240206.cgz/x86_64-by=
tedance-6.6-velinux-func/gcc-12/f5d93c582e5a395d1c9dc760a5c95d673d6f7b30/0 =
BOOT_IMAGE=3D/pkg/linux/x86_64-bytedance-6.6-velinux-func/gcc-12/f5d93c582e=
5a395d1c9dc760a5c95d673d6f7b30/vmlinuz-6.6.40-gf5d93c582e5a branch=3Dbyteda=
nce/6.6-velinux job=3D/lkp/jobs/scheduled/lkp-gnr-2sp3/lkvs-isst-debian-12-=
x86_64-20240206.cgz-f5d93c582e5a-20250813-121280-1vqzjdt-1.yaml user=3Dlkp =
ARCH=3Dx86_64 kconfig=3Dx86_64-bytedance-6.6-velinux-func commit=3Df5d93c58=
2e5a395d1c9dc760a5c95d673d6f7b30 intremap=3Dposted_msi acpi_rsdp=3D0x634a80=
14 max_uptime=3D7200 LKP_SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 d=
ebug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100=
 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_wa=
tchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_=
count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprint=
k=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw acpi_rsdp=3D0x634a8=
014
CPUID(0): GenuineIntel 0x24 CPUID levels
CPUID(1): family:model:stepping 0x6:ad:1 (6:173:1) microcode 0x10003a2
CPUID(0x80000000): max_extended_levels: 0x80000008
CPUID(1): SSE3 - SMX EIST TM2 TSC MSR ACPI-TM HT TM
CPUID(6): APERF, TURBO, DTS, PTM, HWP, No-HWPnotify, HWPwindow, HWPepp, HWP=
pkg, EPB
cpu204: MSR_IA32_MISC_ENABLE: 0x00810089 (TCC EIST No-MWAIT PREFETCH TURBO)
CPUID(7): SGX No-Hybrid
cpu204: MSR_IA32_FEATURE_CONTROL: 0x00100005 (Locked )
CPUID(0x15): eax_crystal: 2 ebx_tsc: 192 ecx_crystal_hz: 25000000
TSC: 2400 MHz (25000000 Hz * 192 / 2 / 1000000)
CPUID(0x16): base_mhz: 2400 max_mhz: 3900 bus_mhz: 100
/dev/cpu_dma_latency: 2000000000 usec (default)
current_driver: acpi_idle
current_governor: menu
current_governor_ro: menu
cpu204: POLL: CPUIDLE CORE POLL IDLE
cpu204: C1: ACPI HLT
cpu204: cpufreq driver: intel_pstate
cpu204: cpufreq governor: powersave
cpufreq intel_pstate no_turbo: 0
cpu0: MSR_PM_ENABLE: 0x00000001 (HWP)
cpu0: MSR_HWP_CAPABILITIES: 0x05081827 (high 39 guar 24 eff 8 low 5)
cpu0: MSR_HWP_REQUEST: 0x00002708 (min 8 max 39 des 0 epp 0x0 window 0x0 pk=
g 0x0)
cpu0: MSR_HWP_REQUEST_PKG: 0x8000ff00 (min 0 max 255 des 0 epp 0x80 window =
0x0)
cpu0: MSR_HWP_STATUS: 0x00000005 (Guaranteed_Perf_Change, Excursion_Min)
cpu64: MSR_PM_ENABLE: 0x00000001 (HWP)
cpu64: MSR_HWP_CAPABILITIES: 0x05081827 (high 39 guar 24 eff 8 low 5)
cpu64: MSR_HWP_REQUEST: 0x00002708 (min 8 max 39 des 0 epp 0x0 window 0x0 p=
kg 0x0)
cpu64: MSR_HWP_REQUEST_PKG: 0x8000ff00 (min 0 max 255 des 0 epp 0x80 window=
 0x0)
cpu64: MSR_HWP_STATUS: 0x00000005 (Guaranteed_Perf_Change, Excursion_Min)
cpu0: EPB: 6 (balanced)
cpu64: EPB: 6 (balanced)
cpu0: Guessing tjMax 100 C, Please use -T to specify
cpu64: Guessing tjMax 100 C, Please use -T to specify
cpu0: MSR_IA32_PACKAGE_THERM_STATUS: 0x88390800 (43 C)
cpu0: MSR_IA32_PACKAGE_THERM_INTERRUPT: 0x02000003 (100 C, 100 C)
cpu64: MSR_IA32_PACKAGE_THERM_STATUS: 0x883c0800 (40 C)
cpu64: MSR_IA32_PACKAGE_THERM_INTERRUPT: 0x02000003 (100 C, 100 C)
1.153285 sec
Package	Core	CPU	Avg_MHz	Busy%	Bzy_MHz	TSC_MHz	IPC	IRQ	POLL	C1	POLL%	C1%	Co=
reTmp	CoreThr	PkgTmp
-	-	-	13	0.51	2643	2463	1.65	9572	0	7840	0.00	102.13	41	0	42
0	0	0	66	3.40	1930	2400	1.38	232	0	213	0.00	99.93	37	0	42
0	0	128	1	0.03	2636	2400	1.60	12	0	11	0.00	99.98
0	1	1	1	0.07	835	2400	2.35	28	0	26	0.00	99.95	36	0
0	1	129	1	0.06	830	2400	2.34	29	0	28	0.00	99.95
0	2	2	1	0.07	906	2400	2.14	27	0	25	0.00	99.95	38	0
0	2	130	1	0.06	889	2400	2.26	27	0	26	0.00	99.95
0	3	3	2	0.07	3000	2400	0.77	28	0	26	0.00	99.95	41	0
0	3	131	2993	99.76	3000	2400	1.60	1197	0	0	0.00	0.00
0	4	4	1	0.08	828	2400	2.15	32	0	31	0.00	99.95	37	0
0	4	132	1	0.07	823	2400	2.28	33	0	31	0.00	99.94
0	5	5	1	0.08	857	2400	2.07	31	0	30	0.00	99.95	36	0
0	5	133	1	0.07	844	2400	2.14	32	0	30	0.00	99.95
0	6	6	1	0.08	841	2400	2.12	31	0	30	0.00	99.95	36	0
0	6	134	1	0.07	843	2400	2.18	33	0	32	0.00	99.95
0	7	7	1	0.08	852	2400	2.06	30	0	28	0.00	99.95	36	0
0	7	135	1	0.06	843	2400	2.25	30	0	29	0.00	99.95
0	8	8	1	0.08	874	2400	2.08	29	0	27	0.00	99.95	38	0
0	8	136	1	0.06	866	2400	2.21	29	0	28	0.00	99.95
0	9	9	1	0.07	860	2400	2.18	28	0	26	0.00	99.95	36	0
0	9	137	1	0.06	865	2400	2.24	28	0	27	0.00	99.96
0	10	10	1	0.09	863	2400	1.92	37	0	35	0.00	99.95	36	0
0	10	138	1	0.07	864	2400	2.07	27	0	26	0.00	99.95
0	11	11	1	0.08	850	2400	2.06	28	0	26	0.00	99.95	35	0
0	11	139	1	0.09	835	2400	2.16	41	0	40	0.00	99.94
0	12	12	1	0.07	871	2400	2.14	26	0	25	0.00	99.95	36	0
0	12	140	1	0.07	856	2400	2.17	36	0	34	0.00	99.95
0	13	13	1	0.07	855	2400	2.14	27	0	26	0.00	99.95	37	0
0	13	141	1	0.08	846	2400	2.17	35	0	33	0.00	99.94
0	14	14	1	0.07	878	2400	2.26	23	0	22	0.00	99.95	38	0
0	14	142	1	0.07	896	2400	2.12	36	0	34	0.00	99.95
0	15	15	1	0.08	858	2400	2.10	33	0	32	0.00	99.95	37	0
0	15	143	1	0.07	841	2400	2.10	35	0	33	0.00	99.95
0	16	16	1	0.08	838	2400	2.08	32	0	30	0.00	99.95	37	0
0	16	144	1	0.07	835	2400	2.21	35	0	34	0.00	99.96
0	17	17	1	0.09	837	2400	1.95	32	0	30	0.00	99.95	38	0
0	17	145	1	0.07	839	2400	2.12	31	0	30	0.00	99.95
0	18	18	1	0.08	842	2400	2.05	32	0	30	0.00	99.95	37	0
0	18	146	1	0.06	846	2400	2.22	32	0	31	0.00	99.96
0	19	19	1	0.08	862	2400	2.03	33	0	31	0.00	99.95	37	0
0	19	147	1	0.06	850	2400	2.24	29	0	28	0.00	99.96
0	20	20	1	0.08	860	2400	2.09	31	0	29	0.00	99.95	37	0
0	20	148	1	0.07	847	2400	2.20	31	0	29	0.00	99.95
0	21	21	1	0.08	852	2400	2.12	29	0	27	0.00	99.95	38	0
0	21	149	1	0.07	837	2400	2.13	38	0	36	0.00	99.95
0	22	22	1	0.07	837	2400	2.20	26	0	25	0.00	99.95	37	0
0	22	150	1	0.07	841	2400	2.18	37	0	35	0.00	99.95
0	23	23	1	0.08	836	2400	2.04	26	0	25	0.00	99.95	37	0
0	23	151	1	0.07	828	2400	2.15	36	0	34	0.00	99.95
0	24	24	1	0.10	837	2400	1.94	27	0	27	0.00	99.93	37	0
0	24	152	1	0.06	842	2400	2.15	27	0	25	0.00	99.95
0	25	25	1	0.09	856	2400	2.02	26	0	26	0.00	99.94	36	0
0	25	153	1	0.06	859	2400	2.15	26	0	25	0.00	99.95
0	26	26	1	0.09	843	2400	2.05	35	0	34	0.00	99.94	36	0
0	26	154	1	0.07	856	2400	2.11	34	0	33	0.00	99.95
0	27	27	1	0.09	867	2400	1.91	34	0	32	0.00	99.95	37	0
0	27	155	1	0.08	851	2400	2.05	32	0	31	0.00	99.94
0	28	28	1	0.08	863	2400	1.95	34	0	32	0.00	99.95	37	0
0	28	156	1	0.07	857	2400	2.07	33	0	32	0.00	99.95
0	29	29	1	0.09	854	2400	2.04	32	0	31	0.00	99.94	37	0
0	29	157	1	0.07	856	2400	2.11	33	0	32	0.00	99.95
0	30	30	1	0.11	824	2400	1.93	33	0	33	0.00	99.92	38	0
0	30	158	1	0.07	827	2400	2.12	30	0	29	0.00	99.95
0	31	31	1	0.09	857	2400	1.93	30	0	28	0.00	99.94	37	0
0	31	159	1	0.06	856	2400	2.18	28	0	27	0.00	99.95
0	64	32	1	0.10	845	2400	2.12	29	0	28	0.00	99.94	38	0
0	64	160	1	0.07	843	2400	2.03	39	0	37	0.00	99.95
0	65	33	1	0.08	857	2400	2.00	28	0	27	0.00	99.95	37	0
0	65	161	1	0.07	840	2400	2.08	39	0	37	0.00	99.95
0	66	34	1	0.08	853	2400	2.01	26	0	25	0.00	99.95	37	0
0	66	162	1	0.07	845	2400	2.08	38	0	36	0.00	99.95
0	67	35	1	0.08	826	2400	2.11	24	0	23	0.00	99.95	37	0
0	67	163	1	0.07	825	2400	1.86	26	0	24	0.00	99.95
0	68	36	1	0.07	873	2400	2.15	23	0	22	0.00	99.95	37	0
0	68	164	1	0.07	861	2400	2.12	35	0	33	0.00	99.95
0	69	37	1	0.08	857	2400	1.99	35	0	33	0.00	99.95	37	0
0	69	165	1	0.07	857	2400	2.07	35	0	34	0.00	99.95
0	70	38	1	0.08	855	2400	2.00	33	0	31	0.00	99.95	37	0
0	70	166	1	0.07	855	2400	2.04	33	0	32	0.00	99.95
0	71	39	1	0.10	843	2400	2.06	34	0	32	0.00	99.93	37	0
0	71	167	2	0.20	819	2400	3.62	36	0	34	0.00	99.83
0	72	40	1	0.08	865	2400	2.11	32	0	30	0.00	99.94	37	0
0	72	168	1	0.07	856	2400	2.17	34	0	33	0.00	99.95
0	73	41	1	0.07	855	2400	2.25	30	0	28	0.00	99.95	37	0
0	73	169	1	0.06	851	2400	2.23	32	0	31	0.00	99.95
0	74	42	1	0.08	827	2400	2.26	27	0	25	0.00	99.95	37	0
0	74	170	1	0.07	827	2400	2.19	34	0	32	0.00	99.95
0	75	43	1	0.08	857	2400	2.08	30	0	29	0.00	99.95	37	0
0	75	171	1	0.07	850	2400	2.14	39	0	37	0.00	99.95
0	76	44	1	0.07	861	2400	2.19	25	0	24	0.00	99.95	36	0
0	76	172	1	0.07	846	2400	2.23	38	0	36	0.00	99.95
0	77	45	1	0.07	854	2400	2.15	29	0	28	0.00	99.95	37	0
0	77	173	1	0.07	845	2400	2.10	38	0	36	0.00	99.95
0	78	46	4	0.47	814	2400	2.12	71	0	72	0.00	99.60	37	0
0	78	174	1	0.06	866	2400	2.17	27	0	25	0.00	99.95
0	79	47	1	0.08	856	2400	2.09	35	0	33	0.00	99.95	35	0
0	79	175	1	0.06	853	2400	2.30	26	0	25	0.00	99.96
0	80	48	1	0.09	870	2400	1.95	34	0	32	0.00	99.95	39	0
0	80	176	1	0.07	841	2400	2.12	34	0	33	0.00	99.95
0	81	49	1	0.08	837	2400	2.07	33	0	31	0.00	99.94	36	0
0	81	177	1	0.07	839	2400	2.12	36	0	35	0.00	99.95
0	82	50	1	0.10	849	2400	2.47	36	0	34	0.00	99.93	38	0
0	82	178	2	0.22	822	2400	3.73	44	0	43	0.00	99.81
0	83	51	1	0.08	859	2400	2.04	33	0	31	0.00	99.95	38	0
0	83	179	1	0.08	851	2400	2.26	31	0	31	0.00	99.94
0	84	52	1	0.08	861	2400	2.03	30	0	28	0.00	99.95	37	0
0	84	180	1	0.07	863	2400	2.04	31	0	29	0.00	99.95
0	85	53	1	0.07	868	2400	2.16	30	0	29	0.00	99.95	36	0
0	85	181	1	0.06	858	2400	2.20	30	0	28	0.00	99.95
0	86	54	1	0.08	866	2400	2.03	32	0	31	0.00	99.95	38	0
0	86	182	1	0.08	849	2400	1.98	39	0	37	0.00	99.95
0	87	55	1	0.09	852	2400	2.12	28	0	27	0.00	99.93	36	0
0	87	183	1	0.07	851	2400	2.03	39	0	37	0.00	99.95
0	88	56	1	0.08	859	2400	2.00	28	0	27	0.00	99.95	35	0
0	88	184	1	0.06	862	2400	2.17	27	0	25	0.00	99.95
0	89	57	1	0.09	854	2400	1.93	38	0	36	0.00	99.95	36	0
0	89	185	1	0.07	847	2400	2.15	27	0	26	0.00	99.95
0	90	58	1	0.08	855	2400	1.99	36	0	34	0.00	99.95	37	0
0	90	186	1	0.06	852	2400	2.21	26	0	25	0.00	99.95
0	91	59	1	0.08	844	2400	2.06	35	0	33	0.00	99.94	37	0
0	91	187	1	0.06	871	2400	2.23	24	0	23	0.00	99.96
0	92	60	1	0.10	843	2400	2.05	35	0	33	0.00	99.93	36	0
0	92	188	1	0.07	857	2400	2.08	33	0	32	0.00	99.95
0	93	61	1	0.08	815	2400	2.16	33	0	31	0.00	99.94	37	0
0	93	189	1	0.08	820	2400	2.04	45	0	23	0.00	98.22
0	94	62	1	0.08	865	2400	1.85	24	0	22	0.00	99.95	37	0
0	94	190	1	0.14	844	2400	2.88	40	0	37	0.00	99.89
0	95	63	1	0.09	885	2400	1.86	33	0	31	0.00	99.95	37	0
0	95	191	1	0.08	883	2400	1.85	34	0	32	0.00	99.94
1	0	64	1	0.12	923	2400	1.33	37	0	35	0.00	99.93	34	0	42
1	0	192	9	0.91	1018	2400	3.10	87	0	88	0.00	99.17
1	1	65	3	0.27	937	2400	2.12	82	0	79	0.00	99.80	34	0
1	1	193	1	0.08	867	2400	1.94	35	0	33	0.00	99.95
1	2	66	3	0.16	2009	2400	1.24	59	0	56	0.00	99.88	33	0
1	2	194	8	0.80	959	2400	3.09	81	0	71	0.00	99.26
1	3	67	7	0.73	956	2400	3.12	78	0	69	0.00	99.34	33	0
1	3	195	1	0.07	865	2400	2.05	31	0	29	0.00	99.95
1	4	68	1	0.09	891	2400	1.76	32	0	30	0.00	99.94	34	0
1	4	196	1	0.16	844	2400	1.94	78	0	76	0.00	99.90
1	5	69	1	0.09	853	2400	1.83	29	0	27	0.00	99.94	34	0
1	5	197	1	0.08	852	2400	1.86	37	0	35	0.00	99.94
1	6	70	1	0.09	876	2400	1.81	26	0	24	0.00	99.94	34	0
1	6	198	1	0.08	872	2400	1.86	36	0	34	0.00	99.95
1	7	71	1	0.09	868	2400	1.83	27	0	24	0.00	99.94	32	0
1	7	199	1	0.08	864	2400	1.92	36	0	34	0.00	99.95
1	8	72	1	0.10	869	2400	1.72	34	0	31	0.00	99.93	33	0
1	8	200	1	0.08	874	2400	1.86	35	0	33	0.00	99.95
1	9	73	1	0.09	868	2400	1.93	33	0	30	0.00	99.94	32	0
1	9	201	1	0.08	874	2400	1.85	35	0	33	0.00	99.94
1	10	74	1	0.09	874	2400	1.73	33	0	30	0.00	99.94	33	0
1	10	202	1	0.08	892	2400	1.79	31	0	30	0.00	99.95
1	11	75	1	0.09	844	2400	1.75	31	0	28	0.00	99.93	33	0
1	11	203	1	0.08	857	2400	1.88	30	0	29	0.00	99.95
1	12	76	1	0.09	853	2400	1.86	32	0	29	0.00	99.94	32	0
1	12	204	1	0.07	876	2400	1.99	29	0	28	0.00	99.96
1	13	77	1	0.11	856	2400	1.77	29	0	27	0.00	99.92	33	0
1	13	205	1	0.08	876	2400	1.85	29	0	28	0.00	99.95
1	14	78	1	0.08	852	2400	2.07	28	0	25	0.00	99.94	33	0
1	14	206	1	0.07	869	2400	2.03	31	0	30	0.00	99.95
1	15	79	1	0.09	874	2400	1.80	29	0	26	0.00	99.94	34	0
1	15	207	1	0.08	863	2400	1.91	37	0	35	0.00	99.95
1	16	80	1	0.08	862	2400	1.96	26	0	23	0.00	99.95	32	0
1	16	208	1	0.08	844	2400	1.99	38	0	36	0.00	99.95
1	17	81	19	1.21	1567	2400	0.75	56	0	40	0.00	98.81	34	0
1	17	209	1	0.04	2811	2400	1.09	32	0	31	0.00	99.98
1	18	82	1	0.09	856	2400	1.97	34	0	32	0.00	99.95	34	0
1	18	210	1	0.07	865	2400	1.98	31	0	29	0.00	99.95
1	19	83	1	0.08	857	2400	2.02	30	0	28	0.00	99.95	35	0
1	19	211	1	0.08	860	2400	1.96	30	0	28	0.00	99.95
1	20	84	1	0.08	865	2400	1.95	29	0	27	0.00	99.95	35	0
1	20	212	1	0.07	873	2400	1.91	29	0	27	0.00	99.95
1	21	85	1	0.08	855	2400	1.95	29	0	26	0.00	99.94	33	0
1	21	213	1	0.07	861	2400	1.97	29	0	28	0.00	99.95
1	22	86	1	0.10	856	2400	1.85	41	0	38	0.00	99.94	34	0
1	22	214	1	0.07	869	2400	1.99	27	0	26	0.00	99.95
1	23	87	1	0.09	854	2400	1.88	37	0	34	0.00	99.94	33	0
1	23	215	1	0.09	851	2400	1.84	28	0	27	0.00	99.94
1	24	88	1	0.09	856	2400	1.98	38	0	35	0.00	99.94	34	0
1	24	216	1	0.07	864	2400	2.02	25	0	24	0.00	99.95
1	25	89	1	0.08	860	2400	1.95	27	0	24	0.00	99.94	35	0
1	25	217	1	0.07	866	2400	1.94	25	0	24	0.00	99.95
1	26	90	1	0.10	832	2400	1.75	35	0	32	0.00	99.94	34	0
1	26	218	1	0.08	837	2400	1.91	34	0	32	0.00	99.95
1	27	91	1	0.09	869	2400	1.89	33	0	30	0.00	99.95	35	0
1	27	219	1	0.08	868	2400	1.86	37	0	35	0.00	99.95
1	28	92	1	0.09	876	2400	1.84	32	0	30	0.00	99.94	34	0
1	28	220	1	0.08	870	2400	1.90	32	0	30	0.00	99.95
1	29	93	1	0.08	865	2400	1.96	31	0	29	0.00	99.95	33	0
1	29	221	1	0.08	858	2400	1.95	32	0	30	0.00	99.95
1	30	94	1	0.09	861	2400	1.80	31	0	29	0.00	99.94	34	0
1	30	222	1	0.08	864	2400	1.91	33	0	31	0.00	99.95
1	31	95	1	0.09	871	2400	1.91	31	0	29	0.00	99.94	35	0
1	31	223	1	0.07	881	2400	1.94	31	0	29	0.00	99.95
1	64	96	1	0.08	851	2400	2.01	29	0	26	0.00	99.94	35	0
1	64	224	1	0.07	869	2400	1.93	29	0	28	0.00	99.95
1	65	97	1	0.09	849	2400	1.89	38	0	35	0.00	99.95	35	0
1	65	225	1	0.07	863	2400	1.94	29	0	28	0.00	99.95
1	66	98	1	0.10	844	2400	1.84	41	0	38	0.00	99.94	35	0
1	66	226	1	0.07	862	2400	1.92	28	0	27	0.00	99.95
1	67	99	1	0.09	823	2400	1.91	36	0	33	0.00	99.94	36	0
1	67	227	1	0.07	835	2400	2.02	26	0	25	0.00	99.95
1	68	100	1	0.08	860	2400	2.03	25	0	22	0.00	99.94	34	0
1	68	228	1	0.07	877	2400	2.02	26	0	25	0.00	99.95
1	69	101	1	0.08	877	2400	1.99	26	0	23	0.00	99.95	34	0
1	69	229	1	0.07	860	2400	1.99	35	0	33	0.00	99.95
1	70	102	1	0.09	859	2400	1.88	34	0	32	0.00	99.94	34	0
1	70	230	1	0.08	859	2400	1.89	33	0	31	0.00	99.95
1	71	103	1	0.09	857	2400	1.87	35	0	33	0.00	99.94	34	0
1	71	231	1	0.10	847	2400	2.14	36	0	34	0.00	99.93
1	72	104	1	0.09	859	2400	1.80	33	0	31	0.00	99.94	34	0
1	72	232	1	0.08	865	2400	1.86	32	0	30	0.00	99.95
1	73	105	1	0.10	866	2400	1.79	33	0	31	0.00	99.94	34	0
1	73	233	1	0.08	866	2400	1.89	30	0	28	0.00	99.95
1	74	106	1	0.09	891	2400	1.77	29	0	27	0.00	99.94	35	0
1	74	234	1	0.08	904	2400	1.80	30	0	28	0.00	99.95
1	75	107	1	0.09	870	2400	1.76	28	0	26	0.00	99.94	36	0
1	75	235	1	0.08	864	2400	1.87	36	0	34	0.00	99.95
1	76	108	1	0.09	886	2400	1.74	27	0	25	0.00	99.94	36	0
1	76	236	1	0.08	871	2400	1.87	34	0	32	0.00	99.95
1	77	109	1	0.09	880	2400	1.84	26	0	24	0.00	99.94	34	0
1	77	237	1	0.07	865	2400	1.94	32	0	30	0.00	99.95
1	78	110	1	0.08	865	2400	1.93	26	0	24	0.00	99.94	34	0
1	78	238	1	0.08	863	2400	1.89	31	0	29	0.00	99.95
1	79	111	1	0.08	858	2400	2.03	24	0	22	0.00	99.95	33	0
1	79	239	1	0.07	869	2400	1.94	31	0	29	0.00	99.95
1	80	112	1	0.09	851	2400	1.84	31	0	29	0.00	99.94	34	0
1	80	240	1	0.08	852	2400	1.93	32	0	30	0.00	99.95
1	81	113	1	0.08	857	2400	1.96	28	0	26	0.00	99.94	35	0
1	81	241	1	0.07	869	2400	1.99	30	0	29	0.00	99.95
1	82	114	1	0.09	868	2400	2.04	29	0	27	0.00	99.94	34	0
1	82	242	1	0.07	894	2400	1.93	31	0	30	0.00	99.95
1	83	115	1	0.09	853	2400	1.88	28	0	26	0.00	99.94	34	0
1	83	243	1	0.07	870	2400	2.00	25	0	24	0.00	99.95
1	84	116	1	0.09	843	2400	2.07	28	0	26	0.00	99.94	33	0
1	84	244	1	0.08	858	2400	2.01	37	0	36	0.00	99.95
1	85	117	1	0.08	849	2400	2.07	16	0	14	0.00	99.95	34	0
1	85	245	1	0.07	844	2400	2.08	23	0	22	0.00	99.95
1	86	118	1	0.07	845	2400	2.18	16	0	14	0.00	99.95	35	0
1	86	246	1	0.07	867	2400	2.01	29	0	27	0.00	99.95
1	87	119	1	0.07	857	2400	2.21	16	0	15	0.00	99.95	35	0
1	87	247	1	0.07	866	2400	1.99	29	0	27	0.00	99.95
1	88	120	1	0.08	902	2400	1.97	18	0	17	0.00	99.95	34	0
1	88	248	1	0.07	901	2400	1.92	29	0	27	0.00	99.95
1	89	121	1	0.07	891	2400	2.15	16	0	15	0.00	99.95	34	0
1	89	249	1	0.07	909	2400	1.97	26	0	24	0.00	99.95
1	90	122	1	0.07	852	2400	2.15	11	0	10	0.00	99.95	35	0
1	90	250	1	0.07	897	2400	2.02	26	0	24	0.00	99.95
1	91	123	1	0.08	902	2400	1.90	25	0	23	0.00	99.95	33	0
1	91	251	1	0.07	892	2400	2.00	24	0	23	0.00	99.95
1	92	124	1	0.09	823	2400	1.95	24	0	22	0.00	99.94	33	0
1	92	252	1	0.07	830	2400	2.07	23	0	22	0.00	99.95
1	93	125	1	0.08	869	2400	1.99	22	0	20	0.00	99.94	35	0
1	93	253	1	0.07	871	2400	2.01	22	0	21	0.00	99.95
1	94	126	1	0.08	828	2400	2.06	22	0	20	0.00	99.94	34	0
1	94	254	1	0.09	828	2400	1.57	26	0	10	0.00	98.69
1	95	127	1	0.08	1044	2400	1.70	18	0	15	0.00	99.93	34	0
1	95	255	35	1.66	2102	2400	4.03	42	0	24	0.00	98.35
|0813_125406.465|TRACE|do_cmd() is called by intel_sst.sh:115:isst_info()|
|0813_125406.468|TRACE|CMD=3Dintel-speed-select -o info.out -i|
Intel(R) Speed Select Technology
Executing on CPU model:173[0xad]
Incompatible API versions; Upgrade of tool is required
|0813_125406.474|TRACE|The platform and driver capabilities are:|
|0813_125406.477|TRACE|do_cmd() is called by intel_sst.sh:117:isst_info()|
|0813_125406.481|TRACE|CMD=3Dcat info.out|
cat: info.out: No such file or directory
|0813_125406.488|ERROR| common.sh:105:do_cmd() - cat info.out failed. Retur=
n code is 1|
<<<test end, result: FAIL, duration: 1.620s>>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250814/202508140927.1e393fcd-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

