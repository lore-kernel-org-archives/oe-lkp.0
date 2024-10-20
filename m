Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C741DFDE
	for <oe-lkp@lists.linux.dev>; Sun, 20 Oct 2024 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729434179; cv=fail; b=fXSNVH4m0wBVa3JAh80AodEG76KlBptvN8zhyukCQIzlBa8TK38/pn4dBQmP26ev1Dup+c0vFEVgXg28S336IERK1DIWPZNxW85LGevx1S34TLE/tdG3tsco59DTFL+Ob1h3FazuKPj4OF0yYtU0wFrqT4PU744grPR0tiGIuuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729434179; c=relaxed/simple;
	bh=zNc1hb2sE/q7cxzFtx6Yuow9aogiEEr7bklRPJ1MJtI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TFMo3yo10xs9KFGED3zY9mkqVPLP6TpSFAME5p/uCEWcyVs9bsPBwtTLmfok6C1A7TB8sveve1AO6m9xm8ao262AVASztSLwzK4zHdGJFpjSnSIiDiJafwucTFrBAjjX7DYzrvYisaxyzpNrWiwqQ7bjTvjOreArtbuz2P39Q2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUFBK/9Q; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUFBK/9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729434176; x=1760970176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNc1hb2sE/q7cxzFtx6Yuow9aogiEEr7bklRPJ1MJtI=;
  b=SUFBK/9Q5jxdKTRIJ9MpCFETC/eHg3iVhNaT9l0Kp6wphf3QyxqL78kP
   CmoK2XiyHkNUk0qw4Si09dUnbPMwacw4m9s2ICyoFI00MsGi72iegUo+/
   JqenltWzOPjce5VbS0X35Im1JBg34m/SoX8/vNsDJ5n9BSJ20YIXnOsk+
   uk9MLE+B4ybQtgLocoHsohvb0ZtKm5ZTVwsob2PDrtvvFx0w/uJzYsvhZ
   X3yC9E3wYoCnsvEyVwjhohw3a/RBIjKCJD61QQBTGcoktbtSDhtyz3LS7
   OnJOqqmTkEaw3ACCZWoyKxNCdPQ4ep//IoeAJrht6UlRJy0Hh08TLRgkp
   Q==;
X-CSE-ConnectionGUID: yIAloATVRjOwxJ+k17pXHQ==
X-CSE-MsgGUID: 1qQmZ9m0TTSjAAHsWT1T3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32719144"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="32719144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 07:22:55 -0700
X-CSE-ConnectionGUID: 6/sDrFplQYmXJaH8Rwso8Q==
X-CSE-MsgGUID: Ywff8OlHQ8mGxAkFWWvTaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110050894"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2024 07:22:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 07:22:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 07:22:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 07:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBop1+X9qBZJ7ku+okQFqc3FxNz3v4Wo6ElkWY/JOyqI5M0J8yqj44ULQTkE+PtQ15i9nBsyFjTQ+iEvKdjKjA3sBSzDN7yUhC97wp7fFBOS83Cbo4slzfl4m8Ktf38Jf3fhwyRHCxBRPEbJwbohQSmlKAh71ApT3vLNBmVjkYd4yXs61cSOeZQgLil1P8Y8eijTJ6ncadcoNAlfik7TlYog6HDX1uoBNL7NKcVyX+V2aAE3/+u2OQ5v5uiUpkP5yvFtm5Ya9NGJuHh/ZL4v3c8Ia/BO4j/c7OoKKIICMefpq0m8Tyzlls21ue2grfaw+eRKJog1EeFAOxC0W0z7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIzkXxpM/926hfiqex3DGYX3lI1ObR5g1BV8GJBP7CE=;
 b=g21z7+u1Ftk6yzy7QKhZ2S5syi4ImDHdeyKFIBl0LL24u+CW+WlXq32U3R09QNcOB6Aj93wHbsxgew8TZYlrHFsIu0RJuB8gUcj8cHe39ppIYN5fvV1lyjzXiQROJcG/Cy605VtvSXckFo1GY5g5fo/zIpuslyvCmjtwwpcOwaNmI55lzSv6hhj9WuMbuUwAVJcPI1w3iIzEoYc/h+vLyyONQqMMof2G0HM4TerkJF1wFGhl5cpabRi8SLRACSkcemBOcWqzvzXTZS8dYa8zq2iUpOeq5jdCsqMUcbgaEpFrUIHiEwYJjUFMAiOq17vnO2bYcZs/uQ92c3XwRZYmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7823.namprd11.prod.outlook.com (2603:10b6:208:3f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 14:22:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 14:22:51 +0000
Date: Sun, 20 Oct 2024 22:22:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [riteshharjani:kfence-fix-patchv3]  855ac3c67d:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202410202212.b63f1e37-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 11df0591-ee5a-4fd1-a52e-08dcf112ae45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l9ex9PUHIFULxCaanwgdy7xT3Vqty1PKrnnEATfpBuK5GjCAOj3OApRk+hcX?=
 =?us-ascii?Q?eL8mDJkgtbftNSlmisnfw9pDe3KpaBqyP5t7wiChJkKbUC2fYAfwPGJ1Zsgg?=
 =?us-ascii?Q?SWopZEbpJ5cr+zvpWSeNwLxDyQcJ2C3ukg6yP3fLf/x1dxsnhPaCZvL/EU93?=
 =?us-ascii?Q?o+bhV+BfsiNT/exl1k9tyt59/sEDBodDqGeyQmN9Xm1bk6gTlSeKT6wHJ0Zj?=
 =?us-ascii?Q?1LaXZrVpoqI5MiMKin6vPAS4KGZsjSAQPKtbuXrKh7NHm+M1iGWnTxWgZMBd?=
 =?us-ascii?Q?MEh7U3J2BKTzi0d2iyfrnUSm/Bfr2upbyXxhR5ZpLV6Vb6rezbv7FTb1wAOn?=
 =?us-ascii?Q?b/YMP4AoG2BvJ4wcpkUSlfqhIimmh9VgnO4+II9lQt3mujD62KyvcLudr4sc?=
 =?us-ascii?Q?RVG1y5RVHydcsfDD23H4KQp1hNH0Zf6IJ1yot5u2rRSqx7zoXaIFBDYl+hpi?=
 =?us-ascii?Q?Q1WTRfLhIDaXoLq4D4G1AWZf8jfXlQUyWOqoaEItcZjd2SR6JAP4eoz4nI2U?=
 =?us-ascii?Q?GX72ZrBYEjCQVs4gIxLy/kW3VkhWzw7T6glTzpLIbo3PAWlWvfxOSeSQCAMM?=
 =?us-ascii?Q?KEtZ5nrZmmW6G1tYQ02pSw8zrC2NbdLqsYNHnwuY2SvCrBYEWDJaDWH+KP1s?=
 =?us-ascii?Q?aNIc+z4L50talTw4iecnMx6lMtoXPQMUe58Ozn93CisvmoyifdiOLj41qnyT?=
 =?us-ascii?Q?0A4xA17u/OTuxkk4AqFIl3AkSeZRFwZhXxEkEAgdFs9bYIcZsb3XQJkMOTdW?=
 =?us-ascii?Q?3dBpYMftMIbvD4Dsx6c/utoZlxXZ/vVvWAJzOFr8mwzM7VTzztN52PdxYD2M?=
 =?us-ascii?Q?1NNhLLTlDjw+e9zBjrmm2rh0kT3CKJV6+BsE1PR7TtLNiA4Tm613e43wbKu5?=
 =?us-ascii?Q?I5rLWCq5LnolEljpaFBwQqUiJtmz+BTk++ZDX61A1YYbKQQZxhReNENfnrXq?=
 =?us-ascii?Q?P7R7xiCGQsajDrnDq0xglfSNEtm6kevHBknPVr1U+szj9YQoMCX9TbRj4/xF?=
 =?us-ascii?Q?yJKuBmofCmNx422aBtv/X4WkvpeFdDgOHqUzTkxqZC/4jtPvvW+hlpLerhkV?=
 =?us-ascii?Q?gpKELK5KkTpDyuAFaUETNN6FQkfc7s8ln6+Y6CM7aZHTfjre1Orgnj3jvVIN?=
 =?us-ascii?Q?Am0s6XbGYtp2Cv2mdzNyd99G7ww3I/UlrywF/6v3PB2m+tu5akuQff+VUhF4?=
 =?us-ascii?Q?EaADcOxL6Jk9Awg5V2EoDr4vTS6j/kpiWOm+rXD0uYB+VzDxEOHeBXprg15+?=
 =?us-ascii?Q?CZyNp43emjQ76dTgC3cPTyFWLrvP7W4/UPQBX0bt9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkMPYHvEw5pqY35Esfx0uYXUUzuZGY4RW5S/1zIuZVEKm4s5ZakTXEdsYbNR?=
 =?us-ascii?Q?q7W05sKyzVGj4tlSwjs5djKBjA4PhYOT9cuHVKfYMBFxL7u+e48VDOYoVz29?=
 =?us-ascii?Q?9k4Lwxx/smuJoLBdu/zw7Efg/odHIlYO4xtKFtQc0LdQvZ9vPlr/yKfloZk7?=
 =?us-ascii?Q?tIxN0DX2eh+wJdU5VLYck4DgGCkeGv4nG5/hg0GmTDf1YIBJYHG25HaCpWMc?=
 =?us-ascii?Q?JcJHNfs3j7q92cCQcAvAYpwAKSrZ8yhtzlt5HxxamtYkFI/n9XXmLSQnhLPB?=
 =?us-ascii?Q?dTphTfPrtbY3Dnii3C119zyKTKBewtRgEFDykxcCBULgI+Xpmdfme3UF+wFK?=
 =?us-ascii?Q?p0WTbGTzDYYXc4oFpub7cH4vkEZaYwJOWI3Hk654ZTkZHky0OjHxih6Vf0a6?=
 =?us-ascii?Q?6x82Y1OcfekWE0FVN/qTC+5hM7CkrZmZet060KlC0yNfwtENBabW+t6rY9Ur?=
 =?us-ascii?Q?UJJVu/WxPowpkIids0NeOfuFgCxbcP/B3T0hvAS81k2W4FjBEkJfIoaMF+0Y?=
 =?us-ascii?Q?roee4PvsOgkNCK45kgb5VmIGjmz/G6NO4RKyzErttLWDVO5NOGAFjvHv1+w0?=
 =?us-ascii?Q?YJ6QvDcGXDgvU71x08Uga6bNFZpB0xF8kmrmIu9ahk5DZZmc/cnBiQ+JKlpl?=
 =?us-ascii?Q?WHESVMqMsCYwydgom51hyljBcZC2P7SoT5p/lpu19djspqlHXakOWG7tZodO?=
 =?us-ascii?Q?vX3f5B/hO8bceZNPIQu17Hu0jMHMux+NwzubpvgVmNCpgXQnDqLZ+Gu6W/9J?=
 =?us-ascii?Q?qrX44XPGDmvtdFm/t5jJ+WCTXcmOnG+YhElfD/CDW0z7Irk9+5Qm1fevroh+?=
 =?us-ascii?Q?zHWq98lLZw8ZYaS28x6/2/BmTANnauhG4sIhjMzqV3CokX37b5MBzIr9TcI1?=
 =?us-ascii?Q?aMsytK3SDM24ZP2N2v+OeFI9V9lfi2Ghy/bmUJzxdP4DxqKPm63g2RhjrrF0?=
 =?us-ascii?Q?c68OQqhqOuafyXlZ2gTCdiY6KT9TkdX6ILoAMDKWr853OYDMEBIcqk0orDVn?=
 =?us-ascii?Q?81VArDU3X97PVAkgdNmufFv2doRuxSOneHk7WsV6TILH9ubl6tlrK4T/UNdF?=
 =?us-ascii?Q?8TcWoqNm44mBhLWeCTIGk6kPzFe2VkSR4YiXlUTUKSO4p9LN8Rtv4TvOjj99?=
 =?us-ascii?Q?cuW4jyOscDA9+/FoUbzLs7zwI1TtqU8pB1Oya2L1qtbz/8PbtrMDyNLtkX8V?=
 =?us-ascii?Q?DMhmIunIwWt5NOetKFqVTeBYnIxCB9BhvvoYokzZ5JlS7fx0DRBUOiGUJz2r?=
 =?us-ascii?Q?ga1nJpUGfI1Ju/rvbIeCiiKnXhQRlY1bQgfx9vHJtkqjKji8JTha4Z3iT7dD?=
 =?us-ascii?Q?qn66CedR/BMiSZQwM8rJ8bPYfDRagUa4P7dg5d+ZBKM199ltZVmFSijXzQBt?=
 =?us-ascii?Q?pUlZZKzAz/qz/OPUuPSO+whmJLgxgV+fMdKkbnn8h9/1pntPJc3vj58TWMM/?=
 =?us-ascii?Q?jClzPie/yIRXkWPJnsrGJBBNlLrMF/LvziTPERR4WokYtdO9Z+tuAR1r2Tfs?=
 =?us-ascii?Q?c+emMkur0J5TTmAh2Y2ON+6MMLziNmjgR7/+rmeqAX9bXKgp5px7uL5o5sS8?=
 =?us-ascii?Q?ybz1tirgW7ws6nhoM7lefajBnIYQ8OuWYgwLvT1Ka0m0TGGmBJEc2dKYIZUK?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11df0591-ee5a-4fd1-a52e-08dcf112ae45
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 14:22:51.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdU739avw8EunY/DkGLus0GLAno7C+UOq0N/wbZhOpKAlhRC29onpaVMX9FghemZLD42eIsBtNEXn7XyxkuL6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7823
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 855ac3c67d74dadc57431fafcf59497d22879bc0 ("memblock changes")
https://github.com/riteshharjani/linux kfence-fix-patchv3

in testcase: boot

config: x86_64-rhel-8.3
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | cc6765ead4 | 855ac3c67d |
+---------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address | 0          | 18         |
| Oops                                        | 0          | 18         |
| RIP:memmap_init                             | 0          | 18         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 18         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410202212.b63f1e37-oliver.sang@intel.com


[    0.045566][    T0] BUG: kernel NULL pointer dereference, address: 00000000000000a0
[    0.046381][    T0] #PF: supervisor read access in kernel mode
[    0.047019][    T0] #PF: error_code(0x0000) - not-present page
[    0.047675][    T0] PGD 0 P4D 0
[    0.048035][    T0] Oops: Oops: 0000 [#1] SMP PTI
[    0.048560][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc2-00018-g855ac3c67d74 #1
[    0.049578][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.050714][ T0] RIP: 0010:memmap_init (mm/mm_init.c:952) 
[ 0.051288][ T0] Code: 63 d2 6a 01 6a 00 e8 62 8a b7 fd 5a 59 4c 39 e5 0f 82 c8 00 00 00 4c 89 f5 41 83 c7 01 48 81 c3 00 06 00 00 41 83 ff 05 74 49 <48> 83 bb a0 00 00 00 00 74 e5 48 8b 93 88 00 00 00 4c 8b 83 98 00
All code
========
   0:	63 d2                	movslq %edx,%edx
   2:	6a 01                	pushq  $0x1
   4:	6a 00                	pushq  $0x0
   6:	e8 62 8a b7 fd       	callq  0xfffffffffdb78a6d
   b:	5a                   	pop    %rdx
   c:	59                   	pop    %rcx
   d:	4c 39 e5             	cmp    %r12,%rbp
  10:	0f 82 c8 00 00 00    	jb     0xde
  16:	4c 89 f5             	mov    %r14,%rbp
  19:	41 83 c7 01          	add    $0x1,%r15d
  1d:	48 81 c3 00 06 00 00 	add    $0x600,%rbx
  24:	41 83 ff 05          	cmp    $0x5,%r15d
  28:	74 49                	je     0x73
  2a:*	48 83 bb a0 00 00 00 	cmpq   $0x0,0xa0(%rbx)		<-- trapping instruction
  31:	00 
  32:	74 e5                	je     0x19
  34:	48 8b 93 88 00 00 00 	mov    0x88(%rbx),%rdx
  3b:	4c                   	rex.WR
  3c:	8b                   	.byte 0x8b
  3d:	83                   	.byte 0x83
  3e:	98                   	cwtl   
	...

Code starting with the faulting instruction
===========================================
   0:	48 83 bb a0 00 00 00 	cmpq   $0x0,0xa0(%rbx)
   7:	00 
   8:	74 e5                	je     0xffffffffffffffef
   a:	48 8b 93 88 00 00 00 	mov    0x88(%rbx),%rdx
  11:	4c                   	rex.WR
  12:	8b                   	.byte 0x8b
  13:	83                   	.byte 0x83
  14:	98                   	cwtl   
	...
[    0.053312][    T0] RSP: 0000:ffffffff97e03db0 EFLAGS: 00010046
[    0.053951][    T0] RAX: ffffffffffffffff RBX: 0000000000000000 RCX: 000000000000009f
[    0.054709][    T0] RDX: ffffffff98f78840 RSI: 0000000000000000 RDI: 0000000000000001
[    0.055337][    T0] RBP: 0000000000000000 R08: ffffffff97e03dbc R09: ffffffff97e03db8
[    0.056136][    T0] R10: 0000000000000400 R11: ffffffff97e03dc0 R12: ffff9ed3fffc8dc0
[    0.056982][    T0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    0.057803][    T0] FS:  0000000000000000(0000) GS:ffffffff98981000(0000) knlGS:0000000000000000
[    0.058701][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.059394][    T0] CR2: 00000000000000a0 CR3: 000000006dc1e000 CR4: 00000000000000b0
[    0.060163][    T0] Call Trace:
[    0.060450][    T0]  <TASK>
[ 0.060723][ T0] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 0.061134][ T0] ? page_fault_oops (arch/x86/mm/fault.c:715) 
[ 0.061646][ T0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 0.062151][ T0] ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623) 
[ 0.062699][ T0] ? memmap_init (mm/mm_init.c:952) 
[ 0.063176][ T0] ? free_area_init (include/linux/bitmap.h:446 include/linux/nodemask.h:241 include/linux/nodemask.h:438 mm/mm_init.c:646 mm/mm_init.c:1862) 
[ 0.063695][ T0] ? zone_sizes_init (arch/x86/mm/init.c:1008) 
[ 0.064168][ T0] ? setup_arch (arch/x86/kernel/setup.c:1132) 
[ 0.064550][ T0] ? start_kernel (init/main.c:927) 
[ 0.064974][ T0] ? x86_64_start_reservations (arch/x86/kernel/head64.c:495) 
[ 0.065489][ T0] ? x86_64_start_kernel (arch/x86/kernel/head64.c:437 (discriminator 5)) 
[ 0.065915][ T0] ? common_startup_64 (arch/x86/kernel/head_64.S:414) 
[    0.066436][    T0]  </TASK>
[    0.066737][    T0] Modules linked in:
[    0.067130][    T0] CR2: 00000000000000a0
[    0.067567][    T0] ---[ end trace 0000000000000000 ]---
[ 0.068122][ T0] RIP: 0010:memmap_init (mm/mm_init.c:952) 
[ 0.068647][ T0] Code: 63 d2 6a 01 6a 00 e8 62 8a b7 fd 5a 59 4c 39 e5 0f 82 c8 00 00 00 4c 89 f5 41 83 c7 01 48 81 c3 00 06 00 00 41 83 ff 05 74 49 <48> 83 bb a0 00 00 00 00 74 e5 48 8b 93 88 00 00 00 4c 8b 83 98 00
All code
========
   0:	63 d2                	movslq %edx,%edx
   2:	6a 01                	pushq  $0x1
   4:	6a 00                	pushq  $0x0
   6:	e8 62 8a b7 fd       	callq  0xfffffffffdb78a6d
   b:	5a                   	pop    %rdx
   c:	59                   	pop    %rcx
   d:	4c 39 e5             	cmp    %r12,%rbp
  10:	0f 82 c8 00 00 00    	jb     0xde
  16:	4c 89 f5             	mov    %r14,%rbp
  19:	41 83 c7 01          	add    $0x1,%r15d
  1d:	48 81 c3 00 06 00 00 	add    $0x600,%rbx
  24:	41 83 ff 05          	cmp    $0x5,%r15d
  28:	74 49                	je     0x73
  2a:*	48 83 bb a0 00 00 00 	cmpq   $0x0,0xa0(%rbx)		<-- trapping instruction
  31:	00 
  32:	74 e5                	je     0x19
  34:	48 8b 93 88 00 00 00 	mov    0x88(%rbx),%rdx
  3b:	4c                   	rex.WR
  3c:	8b                   	.byte 0x8b
  3d:	83                   	.byte 0x83
  3e:	98                   	cwtl   
	...

Code starting with the faulting instruction
===========================================
   0:	48 83 bb a0 00 00 00 	cmpq   $0x0,0xa0(%rbx)
   7:	00 
   8:	74 e5                	je     0xffffffffffffffef
   a:	48 8b 93 88 00 00 00 	mov    0x88(%rbx),%rdx
  11:	4c                   	rex.WR
  12:	8b                   	.byte 0x8b
  13:	83                   	.byte 0x83
  14:	98                   	cwtl   


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241020/202410202212.b63f1e37-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

