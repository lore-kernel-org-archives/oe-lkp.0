Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3143CED8
	for <oe-lkp@lists.linux.dev>; Wed, 21 Jan 2026 06:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975539; cv=fail; b=rN+nZv0vtScm5AdECUVqj7Ov0D+T1uJHb32BlSH/ymxtq9eLUvj3J3pdV9Dce+ofk2MJZ5Rh47Z98dQIXjHVvFy/ckKPyfoQvR9AWCdR8Ct02kN+B6ybQbABheTlS3GST9FKLSBMiw82QetY+8y770+vdcNHlbRVlL5CKTSxtj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975539; c=relaxed/simple;
	bh=Z06imiEzCQWsszgaKQ+Z11hhQHqPunPDXG0T2wplC0I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Gsgh4mHb3DhrvuehvaDuUaYN3hhRtcPayLBo9/nmM/6f9qXsAmAgOacpwEy/3rjd9CGHwLlfnBvpy1MTg28QXfqO4C46B+JuoVTd8VC/VrPvj52a+tT/VQg+AEX7VHPwoFO9QfX7d/2htVDUKtWaSPJO0leHK9hNf/w5qIlT3N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCjLV1MS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCjLV1MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768975536; x=1800511536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z06imiEzCQWsszgaKQ+Z11hhQHqPunPDXG0T2wplC0I=;
  b=mCjLV1MS3/8HS779EUHOcmm9pC8cdHgWGRPHE3eyyzqC4NttE4c05KFC
   /6qwpF1q1vRLVqCkV9PraRbDMTmwVkQTJT1C/KqWD6UCdRukQAE8nqZAc
   Ymek5u+uv0rG43VfDFMghTYvu02Orbl9DX3y44VGT2HinrCPUCcBg2Sp0
   gYg7eXdz34b8ZRWrgyHxhUctX4BhHJvmMg9wFv6e16ZOpSAkbgtwiWSkB
   qs8FI0YRJ4lqli2uFw2huiKqymiJN0MWGM0ObtAm8DwSr+TIQhMI5Mnr9
   eOCEePqJUax9I9wPf3fJv8bWHgO7iQ+x8CBTZqIQr9wxfPiP2UJGktD27
   Q==;
X-CSE-ConnectionGUID: C+RTlyZxRwu28J9JEf7vrA==
X-CSE-MsgGUID: s9bCblMqRNqxD7cUVqEAGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80823767"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80823767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:05:30 -0800
X-CSE-ConnectionGUID: KlzSvR+MTT2C78zLR/M+Cw==
X-CSE-MsgGUID: 2YZyt7oTR8mPTMBYSd1JmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="243920063"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:05:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:05:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:05:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:05:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGTSbB85MiOxelf1HcPlEYE3q+O0E3Aiv7eXmwrGS/q0bUaDI8ziL96Yl7NzeQxGG8XFVT9t6c5yZghU0Mh4ca3hQzXhahM6R8uqF13v2EWonUtFJ/r6frVIxpr83E0u0qhWX/AOq/0tL+evXFji7vflOlVrICgrTnONOz97pYdzfmaN7k3/zoUIPs3MQ+l5L0NjXq9WaE0RFD1UjTFlAMKkveb8JvcEfMa5np9X4SZNSkqIEsAWIG8EXpnuexF/bfAZ/X/3Qp7HJ0iygoPUylnC5gMPmk6fpCxMfnS96N9JN9BmKjzl5sZ8qpwWQmpDmF48jfQmvhHWIsako1Aecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEpq2zfCGDXDiWJYSqSMSA+0C3D5n9JD6WTpJNVcx58=;
 b=Dsaaln6VIuaRzerOvkPqEQyHGmdqSxpPfnwdP+i+aBFjZTJuO9ht97xzuGGEkbKmK4Ai9Icqzd+no0bbouMG8szpgt6Ihw3zbP3Kz9tpRI3yFzZFY0l7ADeY/ReNxC0h9YWmF6tFDrlXP5BZ39+HUWqn9P3fQ5yN/pLR1UWy1jJjekL2KcLnAvz2/Thue+rfaCkYeaFuMr7b85tVXEvAqe7yKu+p7nnDx02WQWU2ye/LUXVqAWeBjI/Ik/NL5Yjqs6gP6byC1/+oAKhLNyVZLgR3VbBQabcSPCvo0z6W9+bJn6SC+9EuSaElZvmMVG44hiC+/7ikBuGxSXdhDecwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPF5CBB3CBCE.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 06:05:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:05:21 +0000
Date: Wed, 21 Jan 2026 14:05:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink] [dyndbg]  30ab125417: WARNING:suspicious_RCU_usage
Message-ID: <202601211325.c04e2734-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KUZPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:d10:24::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPF5CBB3CBCE:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a253300-80a0-46c8-4b53-08de58b30f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KANjVoNx8Wg9l4ON/9oPihKZhF60HQZeYNq0t7ALdHLrwKiaqLd7aIiL/SDD?=
 =?us-ascii?Q?ONyMF9BCCU3T+gZtfdgtR6N11kezL72rEaGtzOZmzfTesqqV9XAdSvQCFz3H?=
 =?us-ascii?Q?xUibQUIE7hyifY1sAjp7wVdWc4VFU+BVs1Aoq69krr0KywSDppq7/x4FYYLW?=
 =?us-ascii?Q?SAJQ9dkkpQ1GA9aF6D7PUPKzihMdP5EPCrVG/okb8zd2L/krI1EgQcmYF6rS?=
 =?us-ascii?Q?0t9saMsU7l3nly/6uhehJIO321BmkSYIZkgk14obovexE6XsEgM/QYc+yFPP?=
 =?us-ascii?Q?rTrKkvvZhs4KiR/4cZvrolp/p1C2DvVkjGpeu+kGhAlbxfoNp3PieFxiOHdv?=
 =?us-ascii?Q?P+eXNP05/SkxcbsqEnZJQSLu3d5UHEGF/UJEc0qcrRTM96p+m4uUrAUs8PTv?=
 =?us-ascii?Q?HZDQav69vmXh5IHIlF1KgH1yqo2IDOFm2aIi+ZJFeOno7pdAma44AAFS3qUl?=
 =?us-ascii?Q?sDkXmq/2PyPrF1dLpvioGLT917SHG+zjSxLumTg3GbXotgEg2t/dLdm+jd42?=
 =?us-ascii?Q?4dWFLH7KKPueM6ngTpRx+axxIGNFOigls/5G61uKUd3gpvciKgDG5+84IxFX?=
 =?us-ascii?Q?DGEUzZorKh5V7/uohs4Lp0kRTrKm4MBssyHWUyRn2H6aZph+Vz1M7/Nk5OPM?=
 =?us-ascii?Q?G7060X3UyR1kHd02H2vfygwaCXRk3xiO3qv/6CPy8UAMzEJxTao/y+Z2Xr7a?=
 =?us-ascii?Q?n4Tyx2iniKRRfSBiQjSkefaZCclK6FUmNK+ABE5ykhPtqT2lrCcSGzbty28A?=
 =?us-ascii?Q?+Lg/JuG5OcpWDy77MvxgiuVZvUY6Y1RU473Ja2GvHSO1XK56IiVnUexARTjB?=
 =?us-ascii?Q?LOYHDuSyPgcCGgAbFi7S0upPXdoBT4BJXE5+BoeGXNe2vElyU6yD8cB1GiOv?=
 =?us-ascii?Q?ynR+8se/nrzaLtgu2UKRo0uRR2RJ2nnleKHvjKZwdOc6wuJWV1gi/0YXiUDd?=
 =?us-ascii?Q?fkK2uBhTAGzQrUyeToWCcYY8QTkFY5uyu+mKR96UyMiv8Nb4DbBngLiqHkC+?=
 =?us-ascii?Q?sEb+QlrCJmvJEgJHIMb3UckFZt5Bj7rabcsCiUfbN1WbxHsMWNFksnUwVnvQ?=
 =?us-ascii?Q?a5sdf15kcOe++XD/M6CZJwbjVjx1qIkwQFy4ijO7/QIF7Mk0/je+W1NzbUW5?=
 =?us-ascii?Q?S5lObmEByIhD9NhAaX2zVv2VR1+8TW03h8iUVhwfCUXO9DskSeSf/txUlCRy?=
 =?us-ascii?Q?brhLkTlsfmfjRxd8z9NIUGEgOFgJdZck439TZomhksX0dkuETwsrr9bETMxg?=
 =?us-ascii?Q?ZI0SCy3OgrZQ/d6Tgk778VEUWsUs4FehS+3wTVAPH6eV4MJiMTvx3oVebEyv?=
 =?us-ascii?Q?Y+cgIly3f8dSVHxOHEXX5GaDDZ3gkfNW+wbjACtkbIl4ujfsZnyZai3QtA9g?=
 =?us-ascii?Q?CPQxGjwUWsKBhJHvcpm5qU/iFsf9KdOKiknm8egzVQ9+rCmXqsvxKJS4TKT+?=
 =?us-ascii?Q?CCvVuzDgpAEGJwbO75eY20WdTrzxCFRv1C+SAL6O3JfaDxjBI9AnUga70adq?=
 =?us-ascii?Q?Z5wzOobG6rUGYbxSd4E2KlSCpubQM0HKpSB850ATepj4hGTF9jOFTAtdXouq?=
 =?us-ascii?Q?9F1/16VxXXuNVNqTxD1CEZ1y3Aid/QyIm5XmWJdR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Ewrr8BziXovCwEynhhd6oMoTru17EYcK7Pun7dabbxtWxK3necCw9cVGS4n?=
 =?us-ascii?Q?HhdWAo12xTJyrkpiaDENvRaTFCqY0WuNdd0VgKUQLZWTLmrvI87LMfZKJfTa?=
 =?us-ascii?Q?ZgXgoWKHqsb4JptozLhUGl+1dzw8IF28unuO3KbeG5kYgN5CiALPlnvuthWN?=
 =?us-ascii?Q?Nb6o9Zig2FwZMIVzGRbNkvH5yt0Ix+25n5wunxpuYYwR7bIbUle2VDcDhEC0?=
 =?us-ascii?Q?yJ4swzS0Ym8qLTjspPxAxxKRYHxa83HLBcHzxzhobd1qYxdUzQN3p0JlOqCm?=
 =?us-ascii?Q?rJxndcf/wQxdYizONq3CXIG3o41QbqdFK2cwZYagLakPJfPDtvDJNfCiXq3r?=
 =?us-ascii?Q?/LBg3Elt/dQcbr76sjsP2+dkMDvUSG1tQFHfhN7oM75+n8aL28Lp3KTFSiUI?=
 =?us-ascii?Q?3TroqWSUCvrHs6MN9kQPD03Y0PvdYr9x7WiXQezrOmcIVKc6kZ/DnVQPj5Nn?=
 =?us-ascii?Q?0AWiL3+j3cnr/2R+2XlZOzjmVELhNkIKBpzgrRx9EoOSHF0vMQ0nvzQutCFS?=
 =?us-ascii?Q?BvW3BmPcXwBIj8Bqw/ocMOql5Bx0iMyQeqoAbRlPKree9+cvox8nX0HpI6wp?=
 =?us-ascii?Q?kqcGYWAbfZNjkZNkst5bt0fa3chHqxgb020GkeRIqPSxfCJWIS4gUJEEQ+CG?=
 =?us-ascii?Q?1FHU4FtrSQjMAiZQSfL5ojd5sUI0mDx+cZIbAdhTJDBtD+jK6gvwsPtyJG40?=
 =?us-ascii?Q?5YkMyUeuSFKJNAYO17cZPygqTIYZYcn0F+KNEmFJnEF0gpqBiPXDXZsybkXn?=
 =?us-ascii?Q?lRWHGLrBz0zFjPetWHEo7ZVHE47yziGRPx7kCAZKHZSXb+XhcGCreUQMCXtC?=
 =?us-ascii?Q?txtXciwY/cA3CGHQZT4k7OyGtLTzDXr9VGstsYCZHmsLuQjipim/52ZbkiN8?=
 =?us-ascii?Q?dbby8NgpgGp/Wt8YSfL0dZ5Am96etBgs+hsHNNIHYKHhyYgmhlzmuQ+kpM9q?=
 =?us-ascii?Q?Cci4QgW9ArhobMOZuVGtQTvypD3itKp/6l08eWKcanLzWH9HSqTbFLuRI54p?=
 =?us-ascii?Q?mklV52E9PkCLbTOhQx2ahC522t0u4MJOIFDFhdOSR3SkHSKn5MjjSIiU0fkE?=
 =?us-ascii?Q?6iRZibO9kg+uwC7Q1M/NsdRV0NGcQtRt3XJ82S/EDGvaFjpmc5fHw/2BEhrI?=
 =?us-ascii?Q?uob0JHRdk1n+l2j/VPk6atYP8bXxcN192LyBgPqC3Y8SvNeNZLHOB8Gwgds5?=
 =?us-ascii?Q?/O3j3azhplUko+cxERAxFOqxVnMm/+AFXvMUfRpag07FBWhksrCsJdCSIp4o?=
 =?us-ascii?Q?JV3+xKrzZTZ5gNDXy6rma8JYftX3AgcWBA1GmwdmiqMdUNpiOvADWqzg13/x?=
 =?us-ascii?Q?hkHi65bSqNtBkcoeX/bV/bV9eJCiuwMzQ0e0pjEMEe2YLA1EcWEhSoVBVqIQ?=
 =?us-ascii?Q?cX7yvDehoZYBvqECThbEhxb0lOzT+uxJJTXm43V/mmPV0k+4jsf/EF36z0CQ?=
 =?us-ascii?Q?C7L0jTrBkJgeORclYtsZA/zA51JlwusT5AxKQ7GXwhZazfzlZP4qr+WdW9r5?=
 =?us-ascii?Q?jrkVD5QpdXKyYwyUx3tSW+L+q35JFUOA56eNyCL5GGNRKmxIszMGkrdAQKIo?=
 =?us-ascii?Q?aC2HoD4D/rWABKWUUekEhn2kFZ1PJDpqbqPXtI/SQEiA0DvTMTP9MBd7PhY2?=
 =?us-ascii?Q?PI9TEn/K9p+T3mbmC1cXxQoZnKxtWTTZUAB4bVNFFzKKd1QjZ0SnYEFNBTQE?=
 =?us-ascii?Q?AELSE1X4/V8t3lZjd4ufICO9Yh/O2Z+dSLBvgvbJvMZoXaqLmHUog3AQ43Re?=
 =?us-ascii?Q?6a1Jyn2FeA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a253300-80a0-46c8-4b53-08de58b30f2f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:05:21.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEQaErka6NO5VNsVs2bXMW3ErrttIn9rlITozIwBYku9RWm2AoCvrqZpI/anlEnGeVbfn+N2nImgHhgEJgRLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5CBB3CBCE
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 30ab12541721b33af33df48048db12f23a42946d ("dyndbg: walk dd_mod_map intervals in dynamic_debug_init()")
https://github.com/jimc/linux.git dd-shrink

in testcase: boot

config: x86_64-randconfig-016-20260120
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------------+------------+------------+
|                                                           | f278c5d152 | 30ab125417 |
+-----------------------------------------------------------+------------+------------+
| WARNING:suspicious_RCU_usage                              | 0          | 18         |
+-----------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601211325.c04e2734-lkp@intel.com



[   32.321882][    T1] WARNING: suspicious RCU usage
[   32.331885][    T1] 6.19.0-rc6-00038-g30ab12541721 #1 Not tainted
[   32.346942][    T1] -----------------------------
[   32.356295][    T1] lib/maple_tree.c:780 suspicious rcu_dereference_check() usage!
[   32.368276][    T1]
[   32.368276][    T1] other info that might help us debug this:
[   32.368276][    T1]
[   32.380345][    T1]
[   32.380345][    T1] rcu_scheduler_active = 1, debug_locks = 1
[   32.388591][    T1] no locks held by swapper/0/1.
[   32.396226][    T1]
[   32.396226][    T1] stack backtrace:
[   32.407490][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00038-g30ab12541721 #1 PREEMPT(lazy)  ee572ab8f687c1542b07763f9752287d1f4e4afc
[   32.407911][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   32.408074][    T1] Call Trace:
[   32.408201][    T1]  <TASK>
[   32.408359][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[   32.408918][    T1]  lockdep_rcu_suspicious.cold (kernel/locking/lockdep.c:6877)
[   32.409462][    T1]  mas_start (lib/maple_tree.c:780 (discriminator 11) lib/maple_tree.c:1200 (discriminator 11))
[   32.410053][    T1]  mas_walk (lib/maple_tree.c:3291 lib/maple_tree.c:4599)
[   32.410496][    T1]  mas_find (lib/maple_tree.c:5578 lib/maple_tree.c:5618)
[   32.410919][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1780 (discriminator 1))
[   32.411406][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1739)
[   32.411658][    T1]  ? mix_pool_bytes (drivers/char/random.c:943)
[   32.411658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.411658][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1724)
[   32.411658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.411658][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1739)
[   32.411658][    T1]  do_one_initcall (init/main.c:1378)
[   32.411658][    T1]  ? trace_event_raw_event_initcall_level (init/main.c:1369)
[   32.411658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.411658][    T1]  kernel_init_freeable (init/main.c:1483 (discriminator 3) init/main.c:1677 (discriminator 3))
[   32.411658][    T1]  ? rest_init (init/main.c:1570)
[   32.411658][    T1]  kernel_init (init/main.c:1580)
[   32.411658][    T1]  ? rest_init (init/main.c:1570)
[   32.411658][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[   32.411658][    T1]  ? exit_thread (arch/x86/kernel/process.c:153)
[   32.411658][    T1]  ? __switch_to (arch/x86/kernel/process_64.c:714)
[   32.411658][    T1]  ? rest_init (init/main.c:1570)
[   32.411658][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[   32.411658][    T1]  </TASK>
[   32.411830][    T1]
[   32.419179][    T1] =============================
[   32.426199][    T1] WARNING: suspicious RCU usage
[   32.435290][    T1] 6.19.0-rc6-00038-g30ab12541721 #1 Not tainted
[   32.445187][    T1] -----------------------------
[   32.456097][    T1] lib/maple_tree.c:736 suspicious rcu_dereference_check() usage!
[   32.467775][    T1]
[   32.467775][    T1] other info that might help us debug this:
[   32.467775][    T1]
[   32.480434][    T1]
[   32.480434][    T1] rcu_scheduler_active = 1, debug_locks = 1
[   32.488625][    T1] no locks held by swapper/0/1.
[   32.496517][    T1]
[   32.496517][    T1] stack backtrace:
[   32.507460][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00038-g30ab12541721 #1 PREEMPT(lazy)  ee572ab8f687c1542b07763f9752287d1f4e4afc
[   32.507944][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   32.508107][    T1] Call Trace:
[   32.508235][    T1]  <TASK>
[   32.508394][    T1]  dump_stack_lvl (lib/dump_stack.c:122)
[   32.508885][    T1]  lockdep_rcu_suspicious.cold (kernel/locking/lockdep.c:6877)
[   32.509405][    T1]  mtree_range_walk (lib/maple_tree.c:736 (discriminator 11) lib/maple_tree.c:2579 (discriminator 11))
[   32.510345][    T1]  mas_walk (lib/maple_tree.c:3298 lib/maple_tree.c:4599)
[   32.510799][    T1]  mas_find (lib/maple_tree.c:5578 lib/maple_tree.c:5618)
[   32.511222][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1780 (discriminator 1))
[   32.511658][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1739)
[   32.511658][    T1]  ? mix_pool_bytes (drivers/char/random.c:943)
[   32.511658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.511658][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1724)
[   32.511658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.511658][    T1]  ? dynamic_debug_init_control (lib/dynamic_debug.c:1739)
[   32.511658][    T1]  do_one_initcall (init/main.c:1378)
[   32.511658][    T1]  ? trace_event_raw_event_initcall_level (init/main.c:1369)
[   32.511658][    T1]  ? ftrace_likely_update (arch/x86/include/asm/smap.h:90 kernel/trace/trace_branch.c:223)
[   32.511658][    T1]  kernel_init_freeable (init/main.c:1483 (discriminator 3) init/main.c:1677 (discriminator 3))
[   32.511658][    T1]  ? rest_init (init/main.c:1570)
[   32.511658][    T1]  kernel_init (init/main.c:1580)
[   32.511658][    T1]  ? rest_init (init/main.c:1570)
[   32.511658][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[   32.511658][    T1]  ? exit_thread (arch/x86/kernel/process.c:153)
[   32.511658][    T1]  ? __switch_to (arch/x86/kernel/process_64.c:714)
[   32.511658][    T1]  ? rest_init (init/main.c:1570)
[   32.511658][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[   32.511658][    T1]  </TASK>
[   32.828822][    T1] smp: Bringing up secondary CPUs ...
[   32.969794][    T1] smpboot: x86: Booting SMP configuration:
[   32.977793][    T1] .... node  #0, CPUs:      #1
[    2.080306][    T0] Masked ExtINT on CPU#1
[   33.013768][    T1] smp: Brought up 1 node, 2 CPUs
[   33.036220][    T1] smpboot: Total of 2 processors activated (9575.99 BogoMIPS)
[   67.945088][   T30] node 0 deferred pages initialised in 34870ms
[   67.974864][    T1] Memory: 28397356K/33553912K available (63758K kernel code, 23006K rwdata, 18392K rodata, 3328K init, 14332K bss, 5145876K reserved, 0K cma-reserved)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260121/202601211325.c04e2734-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

