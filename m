Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694721991D2
	for <oe-lkp@lists.linux.dev>; Fri, 10 Oct 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084258; cv=fail; b=Vk/mHeP8h/qp/Rvzp/BQJDoM7XuryJ4hNqza0dKygzbTWKEqgKpfiBzPXuAjA/YaTR55ruVL3yC/8CHllZ1aWJqstrXxkVUeUOBEbO+AkU+XgyPReGbD67b9pQemv9ESfi6XJk2ckBcfxAcD2GOotKuQozIfAYn4kK3dAooWgRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084258; c=relaxed/simple;
	bh=i8VB9lltzCoKekElUCzqyne/qxu8SibQHb/BrvN/27Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=t4E8Ak+xu9tIlhuBtE/NpOjWnFcM7IH0pcAeAxhb7R/MyNpNcWI0gt21DHDqH4hyYLJ1B36q5Bkr4gu2W9YKgysbtnxuQiGkVNEOzJTv0zgLHLuQtLgngnLFlBqEDKgSwhoYEqVHR2qEDSDT/5SSZi+InbIhejioxv276FOBqG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQqQRAuY; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQqQRAuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760084256; x=1791620256;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=i8VB9lltzCoKekElUCzqyne/qxu8SibQHb/BrvN/27Y=;
  b=IQqQRAuY+kfBJjrjcebKws/0Fg8GPT5RNrpqLluKM7bccqODkuZXXZQO
   8efOVYz5+hPJMgLgODQ0hlvobe8mWP+6PRljjf7iEDfI4VFwzkyX9DhGw
   UyN/9KN/EL1lIrohIWeodVWYFsL9E/AhTPb9ST2t39DldolX3me++mFIV
   Gw8/EJbQ0CxIL7v7YdeRcYEjPyNUTSMLjf0TPSyzC9tElUU5Uca00xm3o
   TrlmReEEYi5/W1hdko8gZaPuZ6xpTobK9B1D05hvOhS/5nGkw3kMTrpqW
   uYJGSn7rMUfLaIWClRCkmieh0QiC/Pp0jkMrz5K6ZekL+Vi3SQdVV9ncW
   g==;
X-CSE-ConnectionGUID: 4c+zw9rISqqr2IpxH/YiVw==
X-CSE-MsgGUID: CP0D4RqdTNiH29e/hVaW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62330193"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62330193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:17:35 -0700
X-CSE-ConnectionGUID: AGQvKi/BRl2eQ0DmkMpLlw==
X-CSE-MsgGUID: 8q2yXiqvQZ+19VjXAuFYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180028566"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:17:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:17:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 01:17:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mp+Mq57qwvSWrVPTgQkBUsRxpPtyNaEckGW/6KcePXTEQ8I0VhQPaKU+FzSyuM4/tYiM/72QLFTqmJhGr346NknjeD0gokb8ab5qxNQ8XSNin3q7E9DpkAw2NQX8VtSFTtR6WV0tea9FYFXOO1UustdnYVHE6TUraKFF1C0aLcjpSRHlpwVoaXm6L7ezjAPiP88mqMhTBkAlnV0FouqUTKIgEDWn+YOsrBnhks9PWNl/P6v4EG4I64sXgCOD33a/AWX+9ZrJ8rLZnSOPYYydYTZ9N5KtsFiukfQmAesBaz7/C54yI34rmuP7qJ71m9wctrpR1GJsha5H0upOHTGhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itCYDCnrm+zq98JEzPNnlCgpwfow/+rNE631fXa6Zs8=;
 b=AN+jWWWRG0/3jR2baoW4WKQoHvnlKNr9s1McDRSZ4462TJ3GM8xd4YCkp6yYN51mQ5CJc7bmqd0f3crH+V1fGkS2T9IDczkCItMXYMfBv/In4vLRzfF/bss4CiDSt8+uULb2vLU8eNljJaxqPcePSfPvMz94rzXog4eB71m+qfCcWIu+wejNcPbQJG073aEnSxuQH6WvzYUxEGOb5Prbbcs14dK4uLW8sX6uCfPcpgD2AznJ1Hj/eSV+R7c3q1r1MmJRL1zWsz9WixDjNAaF+IGztg/pabZKDp6lNu0AdDCwJ63Hc1ArlJZhc6ccUBOp6f8W4Bmb7UMMFSa0QgH1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH8PR11MB9508.namprd11.prod.outlook.com (2603:10b6:610:2bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 08:17:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:17:32 +0000
Date: Fri, 10 Oct 2025 16:17:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <steven@liquorix.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [zen:6.17/zen-sauce] [ZEN]  8028b431ef:  fio.write_iops 123.6%
 improvement
Message-ID: <202510101531.c0fc0561-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:820:f::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH8PR11MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c8cf4c-8e2b-49ae-50be-08de07d57614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sudDxjzEdnhLkK2Ydn34127hUKXmaAmtnItI3ckwlUIvfvw5dcwoU1pnS+?=
 =?iso-8859-1?Q?E0WzqPCDtP7DklGy37fjptn8/A1OXqqDLx2VYeqXC4Z8tXD04Uhfsgdhgr?=
 =?iso-8859-1?Q?NyruAYLFcH6wB3uUBRKKkmygKBc1UVRedanihSkuMgcESJMgZdUrSMRPNy?=
 =?iso-8859-1?Q?nXEWvV/A9IqlBLvIOAuDIUWEYEIa2APgSaRi5+MLDu8IeXl2TEJXj+PbRP?=
 =?iso-8859-1?Q?bd5MlTooFAl/kc4/O3P2sIZ3vqVA28FI+2KxfXuRs37XqX50gX36zDR8H5?=
 =?iso-8859-1?Q?Ni30TRpr6X4tdk7ORnGH9FCYBs5AyauivNrFnCeZJ5fmXdNaHWTdBT4pHq?=
 =?iso-8859-1?Q?i1gMTzVgpIDY+BA5SWzZltEbNQQ+XJOgShiaf10BR3Vh9QcDOZi2066nrm?=
 =?iso-8859-1?Q?5T/oM2SEx4bk91yScyUanVa0edyebgFXouXRnTjGSpGKP8w9WYH1JAS7A6?=
 =?iso-8859-1?Q?mUEl1qkeCGIkty/4hJLInOYq7IgHSWvAmHyaG2p+AelPk+96aB32HuOgEG?=
 =?iso-8859-1?Q?kK+dLtklh5ZaMfuRlzKxgUkMavl5+P7j//U23sX/WBSuGu3KMQK9m++gX+?=
 =?iso-8859-1?Q?tbKXe7jlZqk8ZwjL8GXDgCUT3p6DOeENgLUZf5HsfZiWD34o0glQNgVxlp?=
 =?iso-8859-1?Q?eA3UIGx+lbeuWkiF16faWjI7qwvWHOBit8oIAS9Uuqkw/CKm6/XaT6uWDv?=
 =?iso-8859-1?Q?iOh5rva2anuvaFZpBITVUfUYn04dndmnnxTPdUS9ZbcSX4I0B+2yqPj6dl?=
 =?iso-8859-1?Q?xo67IpSNgfm94ePOIUgaue0BeTNvDbMQRYOcZxlLWy3JHdGLnFaLv30qi1?=
 =?iso-8859-1?Q?wjeYwN/zoiKLjr/+jxbq0Sb4DkCDlQV6SPNyhXNBvZGOxxx9xu8/yUVovK?=
 =?iso-8859-1?Q?OMU7lUDFTSYTXVuVDPfkx4LABnEP7rnfz2yHYAzEePUzR8eQfgO017PZmq?=
 =?iso-8859-1?Q?3+re23RtSPwRBbYFi9p+XjIAw+pUj6GggXO5XAw/wS25JcwZ5uxVG66kq5?=
 =?iso-8859-1?Q?ZDCKRkcElHPCAxcjRJGuFtWsqw3TtV8VLPJpf6THn4fsXEKIJkVaLl3WP5?=
 =?iso-8859-1?Q?BABwrBdAMpi9BLWj6oIDbFSr1oR+5pb43pHiT4nx3DBQ8vCqGieRwwLuNl?=
 =?iso-8859-1?Q?pIs5fE6Ri4vCmJj0nIIsQrwq3DsEg/Igiw/UMGfB0Zp3ncyK5ae1Ls/W9/?=
 =?iso-8859-1?Q?ZOv07+pp48syepqZQMLXl/UGVQCMRccRAD0fqA0CDZauoxg97Vd1dMOT+T?=
 =?iso-8859-1?Q?EL0AQnKjQ7vUrpE8qk7wWrzrOH1sDm95Xzy1aAREZP10ofjIViSqq2jtR3?=
 =?iso-8859-1?Q?JuaddDR3d4840zr029cFxumQs2spX9MvjUcPgbibv5DxbJHD1Vhwt7cWBs?=
 =?iso-8859-1?Q?tYi1tFKyNH/InXswPMksCRR7GGKfLHBrCID/Xfkr+v2854FWOUVHawqtcM?=
 =?iso-8859-1?Q?punTqj0pkY85i1rV4hzGDrAweNbdXTi8eMFAI9WyKBoNLQ1vKxrLFXvvKS?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yllP4ySrKJea8O6MoDy/uRzFIWxrq0ujHisRscbHNnPgv5hRBIMc+vdEDM?=
 =?iso-8859-1?Q?9d0izyngNhpJv5hBG0Mpf2xVD7pCoZ373c4opAHUrq4amTJgUQ+ROCF1V/?=
 =?iso-8859-1?Q?aIysXcmZSv1sCjTWPyLJQgnl8IRFf9e979m15Pom9bnKjbBpdwhCn43ghC?=
 =?iso-8859-1?Q?RiyW0/F8AJ/z5I0xnM2ZFCimP8IrPD5kK1/zs325GDNh+sRMzZbzIQCMRP?=
 =?iso-8859-1?Q?KrxUV09pqVo29UJWAbGUO6OUnPLP6CZfx+F7hOTvz8z4QdWy9sqQB3Z48I?=
 =?iso-8859-1?Q?xEc2rA7ny5BVtWNx3zSwFTglgh2O/kpIO5Bnev0DYEfrBxIcMr+v5xURvd?=
 =?iso-8859-1?Q?SoibRZ7wH6ZYwHXhm+BkACVGr516nEV3zE62bFU4XC89OXDjIikcEpWbA/?=
 =?iso-8859-1?Q?jOqD630qTgMOGh5HW1L/XUgC/LyYFkk0rTzD3Bs41jACMsz8vnoA51+q8A?=
 =?iso-8859-1?Q?C/60YG8LMAK6+c1XxWLEhy3Mcr7m961jrxzFRA5hW/UzEc99FOrCnfCUc6?=
 =?iso-8859-1?Q?7XSg67tdhsIJLwpQZHovLoYLzNfWdlJUGizuDkznTBbNfXtgPON4yp1C3L?=
 =?iso-8859-1?Q?TqNnNm0K3AiBW70XF2ljxS8R8ov0Kk2FPw0WgiM5ckWL8VMyZFKAgoJw2U?=
 =?iso-8859-1?Q?lgvwB2jHxbyKScZApAGX2+BXSejBXeRyLtYBO6eC0OfJDxt0+ZwoHRFOF0?=
 =?iso-8859-1?Q?nlGzEOVroTFmFWBTeZ4TE9h0FOky+jx0UakvLwD1BWwBfPAMBBQ+yD4RnP?=
 =?iso-8859-1?Q?ZXZmGVATUTs0Ah9KvKo9sTbuDGlTU/oSD0Pz0xI1ckq4XnDsQUDRGoSAn7?=
 =?iso-8859-1?Q?1olYim0bMyt2sBeWkLwey0O6SFA+Bt89KcpNjIpNAHgPMyj+a6FzoXeJaI?=
 =?iso-8859-1?Q?mrS1w7SoMCu/P3vfjPJZSabV8T7ySBUotYbmF6a9O3MXlAHRQDtuMs1Zi0?=
 =?iso-8859-1?Q?640XU3LuHGY+pez5PM0J27rArMiwo5uk//8Vo2NEcHqrXDymxM83ng330F?=
 =?iso-8859-1?Q?3/+l630cv808Y7EUTk/PnsVZN9ieeRbAQeJgEazeU4WtjmE+koIRzx/0ws?=
 =?iso-8859-1?Q?DEWFkc+rZVkG/MGdvsBb6l2QDdds70p+z+5HIsQOUCAlKfoQYnA5d+JqKc?=
 =?iso-8859-1?Q?LIDhyHpfygtf2dlfybf3alPZUtRDn63Z8NEbWW/5SUSbf0A7K7IAS1RVDS?=
 =?iso-8859-1?Q?NJLlpnK8iGL4ame4U5ap+HXZgbgHx1Ayj121gGWU+XfgGRDx1oFcDIYHEc?=
 =?iso-8859-1?Q?nJbmOVFTjurVcLjnYHKG/RPKMDzks/HdeNaxfCN8ZmiZ6z7fQxf8NEGylq?=
 =?iso-8859-1?Q?DDFbOOzuabk7+hP1GxogaTiNT4d/3mDYox+YJ0MZGDM11P3dBWLWV/fwq/?=
 =?iso-8859-1?Q?Rxh8xtyK5SCaz4VX7n7XtomTVIysOC7HXYtWIrhTiFTEb5GYhp1sI0ebwH?=
 =?iso-8859-1?Q?twhTj+Nqw2g8uX+8cBPdQRguDOGjeXusbbdagl0bxQpg038TwgZ2U1wG4g?=
 =?iso-8859-1?Q?oZaAp31lHwumDAdUwaRCDNSdxDccBuzLCZGm3SlrzVO0G58vd93pEQIihv?=
 =?iso-8859-1?Q?m7ZY3VdwBu4OGtHrTnRCcaoB5c4KH11ALHXVef1I4MZT01Lyb/0NTkOalg?=
 =?iso-8859-1?Q?x/v3nUpvlgXkCsdl0F6Wg2l5DcC4zWtDSje/3pS9o2cxaIr/DaRBOrRA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c8cf4c-8e2b-49ae-50be-08de07d57614
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:17:32.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grQUeUExNsXZiygQpiA5Fo25mg/K/pSXpHycwdL37oEcMmA1xIZmBecWnQAPayNbPBBvrmEzN5oriaagqIji0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9508
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 123.6% improvement of fio.write_iops on:


commit: 8028b431ef43dc6ffe5ade68e14f3ebb2a47589e ("ZEN: INTERACTIVE: Use BFQ as the elevator for SQ devices")
https://github.com/zen-kernel/zen-kernel 6.17/zen-sauce

testcase: fio-basic
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	disk: 1HDD
	fs: xfs
	nr_task: 100%
	test_size: 128G
	rw: write
	bs: 4k
	ioengine: pvsync
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | fio-basic: fio.write_iops 117.8% improvement                                              |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | bs=4k                                                                                     |
|                  | cpufreq_governor=performance                                                              |
|                  | disk=1HDD                                                                                 |
|                  | fs=xfs                                                                                    |
|                  | ioengine=vsync                                                                            |
|                  | nr_task=100%                                                                              |
|                  | runtime=300s                                                                              |
|                  | rw=write                                                                                  |
|                  | test_size=128G                                                                            |
+------------------+-------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251010/202510101531.c0fc0561-lkp@intel.com

=========================================================================================
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase:
  4k/gcc-14/performance/1HDD/xfs/pvsync/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/300s/write/lkp-icl-2sp9/128G/fio-basic

commit: 
  3e38cf82c2 ("ZEN: INTERACTIVE: Base config item")
  8028b431ef ("ZEN: INTERACTIVE: Use BFQ as the elevator for SQ devices")

3e38cf82c20abb39 8028b431ef43dc6ffe5ade68e14 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3679022          +230.4%   12154644 ± 16%  cpuidle..usage
      0.07 ±  6%      +0.0        0.10 ± 14%  mpstat.cpu.all.irq%
      0.02 ± 11%      +0.0        0.05 ± 12%  mpstat.cpu.all.soft%
      0.24 ±  4%      +0.1        0.33 ± 10%  mpstat.cpu.all.sys%
      0.17 ±  4%      +0.0        0.19 ±  3%  mpstat.cpu.all.usr%
     25.83 ± 28%    +362.6%     119.50 ± 33%  perf-c2c.DRAM.local
    357.00 ± 26%    +235.6%       1198 ± 54%  perf-c2c.DRAM.remote
    392.00 ± 28%    +370.1%       1842 ± 17%  perf-c2c.HITM.local
    613.33 ± 26%    +306.9%       2495 ± 25%  perf-c2c.HITM.total
     22.17 ±  4%     +63.2%      36.17 ±  6%  turbostat.Avg_MHz
      0.61 ±  4%      +0.4        1.00 ±  7%  turbostat.Busy%
   6309199 ±  2%    +185.4%   18008334 ± 10%  turbostat.IRQ
     35683 ± 16%    +170.8%      96636 ± 18%  turbostat.NMI
    838425           +17.7%     986975 ±  6%  meminfo.Active
    838409           +17.7%     986959 ±  6%  meminfo.Active(anon)
    253959           +42.0%     360722 ±  3%  meminfo.SUnreclaim
    161424 ±  6%     +92.7%     311061 ± 20%  meminfo.Shmem
    348492           +30.7%     455610 ±  2%  meminfo.Slab
    627405 ± 19%     -74.0%     163052 ± 65%  sched_debug.cpu.avg_idle.min
     64017 ±  2%    +169.4%     172472 ± 16%  sched_debug.cpu.nr_switches.avg
    145.56 ± 18%     -83.3%      24.31 ± 15%  sched_debug.cpu.nr_uninterruptible.max
   -118.14           -81.0%     -22.44        sched_debug.cpu.nr_uninterruptible.min
     38.79 ± 17%     -82.4%       6.82 ± 11%  sched_debug.cpu.nr_uninterruptible.stddev
      0.01 ± 11%     -47.4%       0.00 ± 14%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.01 ± 11%     -47.4%       0.00 ± 14%  perf-sched.total_sch_delay.average.ms
     11.12 ±  7%     -48.9%       5.68 ± 19%  perf-sched.total_wait_and_delay.average.ms
    103374 ±  9%     +71.6%     177391 ± 14%  perf-sched.total_wait_and_delay.count.ms
     11.11 ±  7%     -48.9%       5.67 ± 19%  perf-sched.total_wait_time.average.ms
     11.12 ±  7%     -48.9%       5.68 ± 19%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    103374 ±  9%     +71.6%     177391 ± 14%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     11.11 ±  7%     -48.9%       5.67 ± 19%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    209640           +17.7%     246784 ±  6%  proc-vmstat.nr_active_anon
    960943            +4.4%    1003210        proc-vmstat.nr_file_pages
   1218799 ±  2%    +119.2%    2671549 ±  8%  proc-vmstat.nr_foll_pin_acquired
   1218736 ±  2%    +119.2%    2671485 ±  8%  proc-vmstat.nr_foll_pin_released
     23309            +4.2%      24284        proc-vmstat.nr_mapped
     40382 ±  6%     +92.7%      77806 ± 20%  proc-vmstat.nr_shmem
     63444           +41.8%      89951 ±  3%  proc-vmstat.nr_slab_unreclaimable
    209640           +17.7%     246784 ±  6%  proc-vmstat.nr_zone_active_anon
    865886           +14.5%     991420 ±  2%  proc-vmstat.numa_hit
    799492           +15.7%     925041 ±  2%  proc-vmstat.numa_local
   1349248           +42.5%    1922843 ±  3%  proc-vmstat.pgalloc_normal
   1271743 ±  2%     +36.6%    1737482 ±  4%  proc-vmstat.pgfree
   9791560 ±  3%    +123.6%   21889644 ±  8%  proc-vmstat.pgpgout
      1.84 ± 14%     -38.8%       1.13 ± 26%  perf-stat.i.MPKI
 2.734e+08 ±  3%     +74.4%  4.768e+08 ±  6%  perf-stat.i.branch-instructions
   7098240 ±  5%     +18.3%    8396510 ±  3%  perf-stat.i.branch-misses
     26280 ±  2%    +182.9%      74351 ± 16%  perf-stat.i.context-switches
 1.452e+09 ±  4%     +71.6%  2.492e+09 ±  7%  perf-stat.i.cpu-cycles
    107.77 ±  4%     +15.5%     124.44 ±  9%  perf-stat.i.cpu-migrations
 1.322e+09 ±  3%     +71.8%  2.271e+09 ±  5%  perf-stat.i.instructions
      0.00 ±113%  +42008.9%       0.97 ± 25%  perf-stat.i.metric.K/sec
      2.60 ±  5%      -0.8        1.77 ±  8%  perf-stat.overall.branch-miss-rate%
    162591 ±  2%     -22.6%     125838 ± 11%  perf-stat.overall.path-length
 2.728e+08 ±  3%     +74.3%  4.754e+08 ±  6%  perf-stat.ps.branch-instructions
   7085789 ±  5%     +18.2%    8377155 ±  3%  perf-stat.ps.branch-misses
     26196 ±  2%    +182.9%      74096 ± 16%  perf-stat.ps.context-switches
 1.451e+09 ±  4%     +71.5%  2.487e+09 ±  7%  perf-stat.ps.cpu-cycles
    107.46 ±  4%     +15.4%     124.05 ±  9%  perf-stat.ps.cpu-migrations
 1.319e+09 ±  3%     +71.7%  2.265e+09 ±  5%  perf-stat.ps.instructions
 3.979e+11 ±  3%     +71.8%  6.835e+11 ±  5%  perf-stat.total.instructions
      0.01            +0.5        0.51 ± 59%  fio.latency_1000us%
      0.39 ±  7%      -0.4        0.02 ± 51%  fio.latency_100ms%
     51.59 ±  7%     -51.4        0.21 ± 74%  fio.latency_10ms%
     12.46 ± 10%     -12.4        0.07 ± 39%  fio.latency_20ms%
      0.55 ±  3%      -0.5        0.01 ± 30%  fio.latency_250ms%
      0.01            +1.5        1.51 ± 34%  fio.latency_250us%
      0.01 ± 41%      +1.8        1.78 ± 48%  fio.latency_2ms%
     32.21 ± 14%     -31.1        1.13 ± 40%  fio.latency_4ms%
      0.11 ±  7%      -0.1        0.01 ± 30%  fio.latency_500ms%
      0.01            +0.8        0.84 ± 52%  fio.latency_500us%
      2.67 ± 14%      -2.6        0.07 ± 64%  fio.latency_50ms%
      0.01            +0.5        0.53 ± 59%  fio.latency_750us%
      0.01 ±100%      +0.0        0.05 ± 15%  fio.latency_>=2000ms%
  19578108 ±  3%    +123.6%   43773884 ±  8%  fio.time.file_system_outputs
      8.33 ±  8%     +92.0%      16.00 ±  6%  fio.time.percent_of_cpu_this_job_got
     22.26 ±  5%     +98.4%      44.16 ±  7%  fio.time.system_time
   2480548 ±  2%    +188.9%    7166131 ± 29%  fio.time.voluntary_context_switches
   2447263 ±  3%    +123.6%    5471735 ±  8%  fio.workload
     31.86 ±  3%    +123.6%      71.24 ±  8%  fio.write_bw_MBps
  15466496           -99.5%      76928 ± 56%  fio.write_clat_90%_ns
  17323349 ±  5%     -98.0%     344405 ±101%  fio.write_clat_95%_ns
  56448341 ±  5%     -95.4%    2570922 ± 27%  fio.write_clat_99%_ns
   7853157 ±  3%     -55.0%    3531649 ±  8%  fio.write_clat_mean_ns
  20708462 ±  2%    +651.0%  1.555e+08 ±  5%  fio.write_clat_stddev
      8156 ±  3%    +123.6%      18237 ±  8%  fio.write_iops


***************************************************************************************************
lkp-icl-2sp9: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase:
  4k/gcc-14/performance/1HDD/xfs/vsync/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/300s/write/lkp-icl-2sp9/128G/fio-basic

commit: 
  3e38cf82c2 ("ZEN: INTERACTIVE: Base config item")
  8028b431ef ("ZEN: INTERACTIVE: Use BFQ as the elevator for SQ devices")

3e38cf82c20abb39 8028b431ef43dc6ffe5ade68e14 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3772792          +238.2%   12761058 ± 21%  cpuidle..usage
     54.78 ±  9%     -16.3%      45.86 ± 12%  iostat.cpu.idle
    140712 ± 10%    +104.1%     287144 ± 15%  numa-meminfo.node1.Shmem
     35201 ± 10%    +104.1%      71834 ± 15%  numa-vmstat.node1.nr_shmem
     13243 ±  6%     -13.5%      11458 ±  9%  uptime.idle
     21.83 ±  3%     +74.0%      38.00 ± 10%  turbostat.Avg_MHz
      0.61 ±  2%      +0.4        1.06 ± 10%  turbostat.Busy%
   6447935          +188.7%   18617035 ± 13%  turbostat.IRQ
     36923 ± 16%    +204.7%     112516 ± 22%  turbostat.NMI
    833652           +19.7%     998119 ±  5%  meminfo.Active
    833636           +19.7%     998103 ±  5%  meminfo.Active(anon)
    255927           +40.0%     358360 ±  3%  meminfo.SUnreclaim
    159036 ±  8%    +102.9%     322698 ± 16%  meminfo.Shmem
    350442           +29.4%     453450 ±  2%  meminfo.Slab
     54.50 ±  9%      -9.0       45.52 ± 12%  mpstat.cpu.all.idle%
      0.07 ±  5%      +0.0        0.11 ± 23%  mpstat.cpu.all.irq%
      0.02 ± 14%      +0.0        0.05 ± 13%  mpstat.cpu.all.soft%
      0.24 ±  3%      +0.1        0.36 ±  7%  mpstat.cpu.all.sys%
      0.17 ±  2%      +0.0        0.20 ±  5%  mpstat.cpu.all.usr%
     19.50 ± 15%    +727.4%     161.33 ± 21%  perf-c2c.DRAM.local
    302.00 ± 26%    +402.9%       1518 ± 37%  perf-c2c.DRAM.remote
    449.67 ± 22%    +369.1%       2109 ± 26%  perf-c2c.HITM.local
    185.83 ± 27%    +342.7%     822.67 ± 33%  perf-c2c.HITM.remote
    635.50 ± 18%    +361.4%       2932 ± 27%  perf-c2c.HITM.total
      0.01           -44.4%       0.00 ± 14%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.01           -44.4%       0.00 ± 14%  perf-sched.total_sch_delay.average.ms
     11.22 ± 14%     -49.6%       5.66 ±  5%  perf-sched.total_wait_and_delay.average.ms
    100879 ± 11%     +85.0%     186614 ± 15%  perf-sched.total_wait_and_delay.count.ms
     11.22 ± 14%     -49.6%       5.66 ±  5%  perf-sched.total_wait_time.average.ms
     11.22 ± 14%     -49.6%       5.66 ±  5%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    100879 ± 11%     +85.0%     186614 ± 15%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     11.22 ± 14%     -49.6%       5.66 ±  5%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     75.33 ± 17%     +78.9%     134.79 ± 20%  sched_debug.cfs_rq:/.load_avg.avg
    530817 ± 16%     -63.5%     193735 ± 69%  sched_debug.cpu.avg_idle.min
   1223088 ±  3%      -9.8%    1103053 ±  5%  sched_debug.cpu.max_idle_balance_cost.avg
    274526 ±  4%     +17.9%     323771 ±  6%  sched_debug.cpu.max_idle_balance_cost.stddev
     62958 ±  9%    +180.7%     176755 ± 19%  sched_debug.cpu.nr_switches.avg
    125.89 ± 26%     -84.3%      19.78 ± 18%  sched_debug.cpu.nr_uninterruptible.max
   -102.11           -86.3%     -14.03        sched_debug.cpu.nr_uninterruptible.min
     34.72 ± 28%     -83.6%       5.70 ±  7%  sched_debug.cpu.nr_uninterruptible.stddev
 2.747e+08 ±  2%     +76.5%  4.849e+08 ±  8%  perf-stat.i.branch-instructions
      1.12            -0.1        1.04        perf-stat.i.branch-miss-rate%
   7060486 ±  3%     +17.3%    8282156 ±  5%  perf-stat.i.branch-misses
     12.63 ± 25%      +7.7       20.31 ± 14%  perf-stat.i.cache-miss-rate%
     26755          +185.0%      76245 ± 18%  perf-stat.i.context-switches
      1.10 ±  2%      +8.2%       1.19 ±  4%  perf-stat.i.cpi
 1.446e+09 ±  2%     +81.8%   2.63e+09 ± 11%  perf-stat.i.cpu-cycles
 1.326e+09 ±  2%     +73.8%  2.306e+09 ±  7%  perf-stat.i.instructions
      0.94 ±  2%      -7.6%       0.87 ±  4%  perf-stat.i.ipc
      0.00 ± 82%  +35972.7%       1.02 ± 29%  perf-stat.i.metric.K/sec
      2.57            -1.1        1.43 ± 45%  perf-stat.overall.branch-miss-rate%
    159970           -35.9%     102557 ± 47%  perf-stat.overall.path-length
    208439           +19.7%     249543 ±  5%  proc-vmstat.nr_active_anon
    961930            +4.3%    1002884        proc-vmstat.nr_file_pages
   1238395 ±  2%    +114.1%    2650944 ±  8%  proc-vmstat.nr_foll_pin_acquired
   1238332 ±  2%    +114.1%    2650881 ±  8%  proc-vmstat.nr_foll_pin_released
     23532            +3.3%      24298 ±  2%  proc-vmstat.nr_mapped
     39782 ±  8%    +102.8%      80686 ± 16%  proc-vmstat.nr_shmem
     63931           +40.0%      89476 ±  3%  proc-vmstat.nr_slab_unreclaimable
    208439           +19.7%     249543 ±  5%  proc-vmstat.nr_zone_active_anon
    871276           +14.4%     996953        proc-vmstat.numa_hit
    804980           +15.6%     930516        proc-vmstat.numa_local
   1347768           +42.4%    1919263 ±  2%  proc-vmstat.pgalloc_normal
   1271132           +38.3%    1757615 ±  5%  proc-vmstat.pgfree
   9980279          +117.8%   21735388 ±  8%  proc-vmstat.pgpgout
      0.01            +0.5        0.53 ±113%  fio.latency_1000us%
      0.36 ±  9%      -0.3        0.02 ± 42%  fio.latency_100ms%
     53.30 ±  6%     -53.0        0.33 ± 53%  fio.latency_10ms%
     11.31 ±  7%     -11.2        0.11 ± 54%  fio.latency_20ms%
      0.55 ±  2%      -0.5        0.02 ± 57%  fio.latency_250ms%
      0.01            +1.3        1.29 ± 63%  fio.latency_250us%
      0.01            +1.4        1.40 ± 65%  fio.latency_2ms%
     31.61 ±  8%     -30.7        0.92 ± 43%  fio.latency_4ms%
      0.10 ±  8%      -0.1        0.02 ± 70%  fio.latency_500ms%
      0.01            +0.8        0.81 ± 76%  fio.latency_500us%
      2.67 ± 10%      -2.6        0.07 ± 49%  fio.latency_50ms%
      0.01            +0.4        0.45 ± 87%  fio.latency_750us%
  19954754          +117.8%   43467468 ±  8%  fio.time.file_system_outputs
      8.33 ±  5%    +100.0%      16.67 ±  5%  fio.time.percent_of_cpu_this_job_got
     22.10 ±  4%    +105.5%      45.42 ±  8%  fio.time.system_time
   2527312          +178.9%    7048033 ± 25%  fio.time.voluntary_context_switches
   2494344          +117.8%    5433433 ±  8%  fio.workload
     32.45          +117.9%      70.71 ±  8%  fio.write_bw_MBps
  15510186           -99.5%      77312 ± 78%  fio.write_clat_90%_ns
  17072128 ±  3%     -98.4%     275114 ±111%  fio.write_clat_95%_ns
  53127850 ±  5%     -94.8%    2777088 ± 31%  fio.write_clat_99%_ns
   7703841           -56.7%    3334420 ±  8%  fio.write_clat_mean_ns
  20469562          +616.3%  1.466e+08 ±  7%  fio.write_clat_stddev
      8314          +117.8%      18109 ±  8%  fio.write_iops





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

