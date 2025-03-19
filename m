Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589651A2C0E
	for <oe-lkp@lists.linux.dev>; Wed, 19 Mar 2025 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742370531; cv=fail; b=JE6duFEBf7jlpjxTJZiez2c/CQFKB40r3zeoVmyW9YeXAuxC0T2Vb70z+Ezk8XeCTLgZDBOdvBdhdPGK8jXZGBbeO12eXBk00glLvKT41SNKuoZLfDqA13C4Wn3SX3hUTCm71eKN5NxiGAYxw51nXSoy60awOutxgSi58LQ7Okg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742370531; c=relaxed/simple;
	bh=xZ7485T3xMehIwuqdO46O/mBChvH5GFYdlJQfmVHV2U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Gt4lzzowLa7F0K2nrFcHUMjDSmrd9S2GAWBhZUe/dk8PzNxfKf258mtSY5jEq5b9iIKvjSdSygMgtbFRskO/eLP+9O28K0Aup5IoB0y59konZ77oIcdprvPZ6YR+MBthzuKaqNOCVNU+8o0UsoEYW9i5o1BP4vs2FIbYOkTPWfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ovx2IdCH; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ovx2IdCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742370530; x=1773906530;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=xZ7485T3xMehIwuqdO46O/mBChvH5GFYdlJQfmVHV2U=;
  b=Ovx2IdCHkAA8kW2Wa7HlwC70kVGYj33/lk3hU2yiVqgao+OhAGQu+iTq
   ZFw+B3FkVMH1fDAUsE0X5wWxrbcs0m7Dlct4IKUvMh3f2xuklTKQdJ95u
   dBHBdiHlqJbHr9mnDpxEKkQStbDuXD5yiQSqVrNktTIjy5Yyyyqvpc5a/
   EEVblOUY/li4itf+XoImZBs6+nonpDpwH7M/x8Uaej1wMfEM83ngV2wWN
   Rt7e+i2bA36RV4BoUqTzpv3uaFMJXJlQGLIhy5FfRjP9BTMRu4KHjDcNe
   8nhJDt5lMEVLcDXVok/2HnTiN3H6N9PIuN6HV3koAjoS8stqP50z7a9zQ
   w==;
X-CSE-ConnectionGUID: 9M1Vaz01TnWt6UaPoYfphQ==
X-CSE-MsgGUID: qE4DtQwiScakQvcuYKZiEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60937185"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="60937185"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 00:48:49 -0700
X-CSE-ConnectionGUID: SZL0CpWkRl2QzjFETu/MJw==
X-CSE-MsgGUID: EbAcmFcATSS/g98bWxii4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123432272"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Mar 2025 00:48:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 00:48:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 00:48:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 00:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ1FvRBY6cova5MDf2DWpQI2Hx9HBVw//8Gm/qvkRXYpAtZw8X7SbL/uoawe6VYO5ksJI9PHVHHSTlTj31QscNw4CGofex4F2apaDZyXb0vk24g00Ue0Rg2z37ayPUSmkg3/t4SMRA3a6SGDLuMkvdoUFUHQCQGrq9Gnpa1HyWOJCq1ZKJ1KCTKcH1kpP45r3czID++VviB+bZDXfWhPnFUJ5C+SjOle6zBB8fSnvJaPsZDNSRgo8bb/D3OAJ95/CbpqXDCkYDWLmjQyk6t5F/sbnw8Z6rhNJyDrOoWaP1Y6xmWx4XCPJDF9NIsKi2+0z5jisJmSuo+tGhH67g4ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDmRXn1wi9sfi8WYfrLOofoAs/iApVZD0mUfTlVoeo4=;
 b=QUhuzj1Y1Or87Ma76PjuX59luTlLi2ptdC852EqT22mM/JmuRc6Mo9gTBRCVO5NieUDa5m2onJ+mSlkkRXwEn9iE6CA1QXcLV9Hfi79WfI2Cub0Oh3AFNF2rf+tSOnsRN+rhqHvpZE/QaYcunILpm7YeXRkwYXdeA5FZXR6irz28sZyv3eH/ACIQfHUgpfYBW3c0VfVIGcl3MA/vZAVx94ktLUPU8gI7dkI7+RP6aIHq7YPjY+bCZmYkPXTXO3VXaK5tM/OC2B4BbkQcvAzbi++bTemsBDk/wCisNw9boroAQb5+UXPNj2slad1Cg16cSGYajvvWTbsEBr2hMGtd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 07:48:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 07:48:05 +0000
Date: Wed, 19 Mar 2025 15:47:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:mem_init/v2] [arch, mm]  a4dbe5c718:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202503191442.112e954f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: fedfbeaa-9e6a-4ddb-2d95-08dd66ba61e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XQ5pshvyRbGlTEK5EOfis+G/Q6gA9bGIWaTT1CNJSDROJiSQ8XKUKYgkipCh?=
 =?us-ascii?Q?NbkFg1f13Sgsn5jA/8j3RPZk2FwyQblOKP3TKCIImcmT5Vpj4XxckEsRPCEX?=
 =?us-ascii?Q?ncpJWZz4CodS80qTzlOf9SpHpWROVJv9IxD5WSBrlMoKpKOocnpq9S2122H0?=
 =?us-ascii?Q?eyWIH2aCyldTymOMotcxzSdOLuhcapFreGOOEUB/WMVIZousQNuTACcq8kMx?=
 =?us-ascii?Q?kkDTa+D4XnXcUjYiD6/r9b9GDBWeziR6yFAVVMihU6+VxzxbwFEvPB0xo2Nf?=
 =?us-ascii?Q?0ZKUuN3LRIComCTHzL9ouiigsDXM84cL9W7oI188KP8xtrOzgF/4cH7gEIbG?=
 =?us-ascii?Q?zA5kt0r840A4Yr2rxiwMiDp55ETHy5ugRAU6YfZZjsfdX9E2otZb9H79rw8m?=
 =?us-ascii?Q?ib86mm6iuqPV8vSDK/m/8xODLVzvJ5Djd1JroW6o3ltEAE6w3KEFIxDWOtOD?=
 =?us-ascii?Q?Ac7DJugeffitRPfNPPlFyW/wBYF02QAW+8NF6Q9eyYSUueX0/tFuVNhvGWRX?=
 =?us-ascii?Q?HTrIC9ajVTiVCrOOA9V+Hbkm7dEpvdFalpmmXV0AHHQauMr56wP/M6nD1LiR?=
 =?us-ascii?Q?9j7ewamwNYpo5B6HZaceXwcInIaRKA2hvCyMSMEc0u66dE7Mj6q5Svw7ZuI1?=
 =?us-ascii?Q?lwet//KLriIYppbQw5/RHq8xsrd1/ee09aUeY4eXlSXjA/npWtdGXAtX4mIo?=
 =?us-ascii?Q?Gylmk6Rx7daWXlKAmaugr1bqhKxEo+JGcel2AgCa2z3PbwBRo6ZV0K1SISLR?=
 =?us-ascii?Q?smIoQ1vPmuixCG8bIAg28ZCLL1ejv+HEhDGdjMU5ZvfTgV8OxDpCnqo326NG?=
 =?us-ascii?Q?vzLIRLgqwbeovcd5GKqfXyxQ8IkInfweqIARu8ktXLE6EZkqJEuHmQ0PMAMZ?=
 =?us-ascii?Q?7X4IgvwN9SNb5oElqhNJx99HgKMWCNR6vRd3JR+DCvlLPjzPI3qBpqlcAjH8?=
 =?us-ascii?Q?zAo3y5ms6J3EM5z4EXlSrefdG98alHP4InqPemZhG9lUlDxEPIq8akA41uMy?=
 =?us-ascii?Q?Vm7+Zts2wmVyOJtd4ZoBDUfK1QA3/fXL05yUjAjrhE3C6l3NuKsqb9HhK8L/?=
 =?us-ascii?Q?TjG79QG1ZcuPVATuRe1a56vIb4KjE3IeFwmXdL1o+iwLQxJNjfjZwxe+hfJr?=
 =?us-ascii?Q?S+aUUbmMsZV3CbHakystpuTgkirUFemJQcvkBNXuN4Btbyk+VVHVt5gA95e/?=
 =?us-ascii?Q?fQjd8/QKEsX/QeLiUdE6zQxk2e3bSRzLSL9EnUQO5sy9oAEnZqKDBXWhUESD?=
 =?us-ascii?Q?Th1ne+OxLb+O7mrLv2C64yc5ul43mWAd7Ekmwy4sfFYKVuUGjNTBZuUw82aC?=
 =?us-ascii?Q?XUmpMoM94AKWRWCy3vGFgxIEIaHpClHPhRbv81sLlsGpCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQuwSFJfnutKoSjy6qkwWhFGguvfiWwD9eZiVV0ZV/i1Gsa+OeamkBj2GkMg?=
 =?us-ascii?Q?kyK8UP22SH3fREMJ5rgF3jF0XTuhQE0UkhfQyZkrMHPrKFCrNv+F2UfUhqLR?=
 =?us-ascii?Q?eBQw+S/1aH2Gahx90MhjUO/DWvUWvXHQQi02D9FzCPl1pPTxBCXBmYM7GOYs?=
 =?us-ascii?Q?MPGU2QAzVsIPUPoBb1k9Zx3IVy+wR3dI42vDX5MOOu1ZetlxWfNvIWudSF0F?=
 =?us-ascii?Q?HrML60ecJ4KuGKyoaw60TgZqmJVvwrsx0EDcVXsDeYV+WuqRjWl4dOLy6Ukv?=
 =?us-ascii?Q?JPklVahXd/Bzma4farIE3V2mIDtj4TSd15yA49SeUExUTRjfEUBMKziOvFmk?=
 =?us-ascii?Q?18Kk6zQx8LHaYpbQowSoHqSAoJVXdCPe2lA2T9kG0dwefKK8TJ+3TQ+ROje1?=
 =?us-ascii?Q?C4vEsCXJBM/Unznd9EtxBsR4v+JgB8hsSKkpluZOEX2mW34nnlFtKlu8gcnr?=
 =?us-ascii?Q?pWFRcfta9viqopQrWNng2EnsU4k/P6zxMbOEYJROVJ5PlXRZm0+C2Yl9N9me?=
 =?us-ascii?Q?+5DiKy6O1CHutHiJqjARClZS9FTUcII3XCbCAHmdwuThZnNgWZaEdCGeSXEK?=
 =?us-ascii?Q?cExkntNKUSt0PoExlGsX3y+7cACWvPSpKPNVnzt2FzuddEeqvFYxipn7HDFY?=
 =?us-ascii?Q?sbsy5QZ6DuVICd+eFINAhM62HoIm6Bg7nYl2BeCnr1BiTEvW7UdYS/W8LOt/?=
 =?us-ascii?Q?1sH+85XFIFSnac06uEMKsaY7AB+SVUn7MIQEWNR8GXa3xLLvq/1y27h4hTiB?=
 =?us-ascii?Q?vZ7WU2b0vSWGiJuwyOYpBDg7rH2/oAQTsUpezD2rFbhPOxVroQp44CjsosfR?=
 =?us-ascii?Q?nXZzXAo6EflH6QC7R76xmWQH7drFdIyh8afXKF0hWygom/aregxL0k9yHzhT?=
 =?us-ascii?Q?IZCTpBIW17mg/HB4GF3DqMjWoms0Bb+tYmdrCcnOtXjFoo8vUASLcBCUvCQr?=
 =?us-ascii?Q?2OrKMXlXl8j4bfspj5JldMm9yjCKfM5yJOEu64/YmGz3hNw/Nkgr1boRVUgq?=
 =?us-ascii?Q?K7vIBtqeo+Z/5FihmDQspt0IY5Qy6EMucaidUCMKSlyZzSzWYivfPOv4Oj1g?=
 =?us-ascii?Q?sDkofFAH9I2DFOcyAN2rbw/X2iD2EnPj9TpJMMRZTEiyAR4AFkpee/z5DhhD?=
 =?us-ascii?Q?NO4ftwFrmfAQ8Z2M3oLD4NZpB56XVhoDYHTQbwvD6URf4j07T3XRyuXVg3tq?=
 =?us-ascii?Q?zs8h0E+5F7knFrXrA4qvTOinu8RgThL5y+nEuwmIm3CXOm2CYN4wlajUX0nP?=
 =?us-ascii?Q?miS/ghArAdtZxsN3c5Wyj4+Zuz7JLDGHGAxknwoNCzEkbsV++z5xHn+PYCWi?=
 =?us-ascii?Q?nYZqjVQo5xbfvFvIu+PHVhUY9PZ7/MYsrDHfkSNqYgr3Fn12jQaCL9jOq2f7?=
 =?us-ascii?Q?ldJmDuQxeb6vegoIxlNR/60AkJazIwzZpNPh/l/AAHj7oMJRqyUHjEmA+KaF?=
 =?us-ascii?Q?64KTxv51WCWy02vY7pfhTnPpVB6a0uwPI/ngAVlx2o0PR899O2Ru76JScNO+?=
 =?us-ascii?Q?0mLvvnEIvcvNDyzHjCsStwdnCMIYOww52SMtntegttgha5GY7XlPreKf34au?=
 =?us-ascii?Q?6+E9gP+HP8BCoAxnUbxwk2MZpaeTOd725Q719cAmziFRhjC/IqW9uAtCAMOi?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fedfbeaa-9e6a-4ddb-2d95-08dd66ba61e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 07:48:05.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2PdnK65skDBZX7ZbZDHDD7M4uVtUXMdjIbcb8r1ZuVnc5TzGlhHdr5jU8elOkUpNafNpt/CTCg9moa/u186vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: a4dbe5c718171ae59dbb50340e6ec10a1e48b6a7 ("arch, mm: set high_memor=
y in free_area_init()")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git mem_init/v2

in testcase: boot

config: i386-randconfig-001-20250318
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 098f7ccb0b | a4dbe5c718 |
+---------------------------------------------+------------+------------+
| kernel_BUG_at_arch/x86/mm/physaddr.c        | 0          | 12         |
| PANIC:early_exception                       | 0          | 12         |
| EIP:__phys_addr                             | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503191442.112e954f-lkp@intel.co=
m


[    0.055742][    T0] ------------[ cut here ]------------
[    0.056128][    T0] kernel BUG at arch/x86/mm/physaddr.c:77!
PANIC: early exception 0x06 IP 60:c116539d error 0 cr2 0x0
[    0.056916][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.14.=
0-rc4-00010-ga4dbe5c71817 #1
[    0.057570][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.058299][ T0] EIP: __phys_addr (arch/x86/mm/physaddr.c:77)=20
[ 0.058633][ T0] Code: 00 74 33 89 f0 e8 d3 8b 2e 00 89 c3 0f b6 d0 b8 58 b=
b 4b c5 31 c9 6a 00 e8 70 f5 15 00 83 c4 04 84 db 74 25 ff 05 78 de 5d c5 <=
0f> 0b b8 c8 91 ea c4 e8 e7 6e ea ff b8 58 bb 4b c5 31 d2 31 c9 6a
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	00 74 33 89          	add    %dh,-0x77(%rbx,%rsi,1)
   4:	f0 e8 d3 8b 2e 00    	lock call 0x2e8bdd
   a:	89 c3                	mov    %eax,%ebx
   c:	0f b6 d0             	movzbl %al,%edx
   f:	b8 58 bb 4b c5       	mov    $0xc54bbb58,%eax
  14:	31 c9                	xor    %ecx,%ecx
  16:	6a 00                	push   $0x0
  18:	e8 70 f5 15 00       	call   0x15f58d
  1d:	83 c4 04             	add    $0x4,%esp
  20:	84 db                	test   %bl,%bl
  22:	74 25                	je     0x49
  24:	ff 05 78 de 5d c5    	incl   -0x3aa22188(%rip)        # 0xffffffffc55=
ddea2
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 c8 91 ea c4       	mov    $0xc4ea91c8,%eax
  31:	e8 e7 6e ea ff       	call   0xffffffffffea6f1d
  36:	b8 58 bb 4b c5       	mov    $0xc54bbb58,%eax
  3b:	31 d2                	xor    %edx,%edx
  3d:	31 c9                	xor    %ecx,%ecx
  3f:	6a                   	.byte 0x6a

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	0f 0b                	ud2
   2:	b8 c8 91 ea c4       	mov    $0xc4ea91c8,%eax
   7:	e8 e7 6e ea ff       	call   0xffffffffffea6ef3
   c:	b8 58 bb 4b c5       	mov    $0xc54bbb58,%eax
  11:	31 d2                	xor    %edx,%edx
  13:	31 c9                	xor    %ecx,%ecx
  15:	6a                   	.byte 0x6a
[    0.060017][    T0] EAX: 00000000 EBX: c61f7001 ECX: 00000000 EDX: 00000=
000
[    0.060519][    T0] ESI: c61f7000 EDI: 061f7000 EBP: c4e31f04 ESP: c61f7=
000
[    0.061016][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: cff4 EFLAGS:=
 00210002
[    0.061560][    T0] CR0: 80050033 CR2: 00000000 CR3: 059fc000 CR4: 00000=
090
[    0.062060][    T0] Call Trace:
[ 0.062288][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:478)=20
[ 0.062588][ T0] ? early_fixup_exception (arch/x86/include/asm/nospec-branc=
h.h:595)=20
[ 0.062968][ T0] ? early_idt_handler_common (arch/x86/kernel/head_32.S:352)=
=20
[ 0.063360][ T0] ? __phys_addr (arch/x86/mm/physaddr.c:77)=20
[ 0.063677][ T0] ? one_page_table_init (arch/x86/mm/init_32.c:100)=20
[ 0.064037][ T0] ? page_table_range_init (arch/x86/mm/init_32.c:227)=20
[ 0.064411][ T0] ? permanent_kmaps_init (include/linux/pgtable.h:191 includ=
e/linux/pgtable.h:196 arch/x86/mm/init_32.c:395)=20
[ 0.064814][ T0] ? paging_init (arch/x86/mm/init_32.c:677)=20
[ 0.065118][ T0] ? native_pagetable_init (arch/x86/mm/init_32.c:481)=20
[ 0.065503][ T0] ? setup_arch (arch/x86/kernel/setup.c:1131)=20
[ 0.065819][ T0] ? start_kernel (include/linux/jump_label.h:267 init/main.c=
:920)=20
[ 0.066143][ T0] ? i386_start_kernel (arch/x86/kernel/head32.c:79)=20
[ 0.066501][ T0] ? startup_32_smp (arch/x86/kernel/head_32.S:292)=20
Linux version 6.14.0-rc4-00010-ga4dbe5c71817 #1
Command line: ip=3D::::vm-meta-84::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/res=
ult/boot/1/vm-snb-i386/quantal-i386-core-20190426.cgz/i386-randconfig-001-2=
0250318/clang-20/a4dbe5c718171ae59dbb50340e6ec10a1e48b6a7/0 BOOT_IMAGE=3D/p=
kg/linux/i386-randconfig-001-20250318/clang-20/a4dbe5c718171ae59dbb50340e6e=
c10a1e48b6a7/vmlinuz-6.14.0-rc4-00010-ga4dbe5c71817 branch=3Dlinux-devel/de=
vel-hourly-20250317-162326 job=3D/lkp/jobs/scheduled/vm-meta-84/boot-1-quan=
tal-i386-core-20190426.cgz-i386-randconfig-001-20250318-a4dbe5c71817-202503=
19-59448-u28vpj-1.yaml user=3Dlkp ARCH=3Di386 kconfig=3Di386-randconfig-001=
-20250318 commit=3Da4dbe5c718171ae59dbb50340e6ec10a1e48b6a7 mem=3D4G intrem=
ap=3Dposted_msi vmalloc=3D256M initramfs_async=3D0 page_owner=3Don carrier_=
timeout=3D60 rcupdate.rcu_self_test=3D0 max_uptime=3D600 LKP_SERVER=3Dinter=
nal-lkp-server selinux=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate=
.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1=
 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 pr=
ompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglev=
el console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dn=
ormal rw rcuperf.shutdown=3D0 rcuscale.shutdown=3D0 refscale.shutdown=3D0 w=
atchdog_thresh=3D240 audit=3D0 kunit.enable=3D0 ia32_emulation=3Don riscv_i=
sa_fallback=3D1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250319/202503191442.112e954f-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

