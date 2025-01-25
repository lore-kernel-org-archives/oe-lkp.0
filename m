Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66D23B0
	for <oe-lkp@lists.linux.dev>; Sat, 25 Jan 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737806536; cv=fail; b=USQHmdtT9UCKF0RJyetkdRGb4uh+7umfcvhKScUr0el7oCdqq/8uTJwDc11Urh8XaeDnEtTHi6ZSViWxFebsn6kiTEsByNdCNB1N7EWLSyKD0FUP8fXzLdqpq2Dp8RmaZxE27Sr7iZvbm6TbWsttY2XY1NlFFzlzjv5tmiAUx8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737806536; c=relaxed/simple;
	bh=tLLa5MtAiyezCBTn7nhHfSlZ4VwzgoSGk/J/aIDYipg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Owx1QH98iCixAO/d05MNKppQFcH1XSQlcdozgysmd9k2jwyzLoPERNhFN5OAdU4aUhD2anlNtyS4plIEqtD07fOrZzpUsj5yLFMTRZvHbVCTPJ6TYb4PIusb5PKdAiTRmgqIXDF+xlOTWZ/CsNEhurRcjryLuAmMG/+HgTeAS7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXsJIwlC; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXsJIwlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737806529; x=1769342529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tLLa5MtAiyezCBTn7nhHfSlZ4VwzgoSGk/J/aIDYipg=;
  b=DXsJIwlCs1HujEFK7522pf7CUTOCCz2BFJdG1A+Gkdtxjl5GPFAyTfjl
   13qlG48QbtwqwVUbyzLZp7rjGT7oTZxwRqxgIWeW3zhEyMrsp3fNYcGk/
   CNDQ58Chb4xIPiKpFMK8BIHv7az12MokxYIGSe1wGHWERrlY2olyXml6f
   BkCx8i9Sr0T65Fl6lVJS92JNvP2eas/OWiEQkjuf6s/TugMhuiLWSwBHE
   XVT43ctapowwqYP4xK6KQSbfZL+OUMkShevgbZziwjpMUyvuiIbm6bmhQ
   uSZKhAiMS1V/aeRLieBKMS0R9SBl+vbAXNh7Sar4Q6QK/APVVgXnCFGOL
   Q==;
X-CSE-ConnectionGUID: lvX0BJXRRq2CVCUQx4md3A==
X-CSE-MsgGUID: B9N6zBSCTOK/QIE0RevGgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="48921508"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="48921508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 04:02:08 -0800
X-CSE-ConnectionGUID: DrU/J6JTTQ2dq7DE5j2Sag==
X-CSE-MsgGUID: fJHFBovjSzCwCZphViSIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145243832"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2025 04:02:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 04:02:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 04:02:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 04:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHDhhA/5vatQgWFzEYv9+nSDN/XyZZi/wrws0sw8cWujuazht037D5CacqhqVUAiyzhhbfsj2CsqIbYMjQRKuhu4JS05gV6FPy96qArM+gPGB2oZe8eul3RltK2avTncO8hfNCkrgT84CfkLlw8lnFYsDIoy+m5iEXrMydHhIA+j5NlfGQ+A+Cv5bm/3Hd3+cHghrLWIEIAfefYKTvPNehNVoLjKirkp8BaHoxOiOtXFtgA22OBzf+C/GUhZkpZhroqVzC1wibOkuUyZMmaMGzc89IvqsZYB5uQa4O47R4WKEvuioeSh7mRaY+akDZdp460gPNOVwFqWVf3WU+zWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvBluNtO91IvFMP0DAyUsOs3QRK/kiP0VDOImTHfc3s=;
 b=Xk96VfYSwCbkSWf0JDI5C3dsGT77dNGjgiVFI+ZV0zZE55tfBiRiElN8ZsDy1S6r5DBt2iwim1z7Hd6fnJArezydMBpTHMbiJ9nkyFnBOUCGoX9mdoZ/ijw7hjwQq8q2Qi5bE23owFrM1VKSuhlt3ZQS9S1D49Ud/ifozFmnuMGBZUr07cWziSLcLPYctz9xdS2ZTbcpJjvzRXrA/ESIuPHku5dj97Bx0d2pcJ8loQIbpyhr6TgANIc1PobfqtiUR9bZRkk++pr7lUOksHElwfmwCM8lbFJoQ4y4AzOq5NO8Jg6bwVw0AUZcQ6baF14NcNbLxuoIN57/lmkLgSMoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sat, 25 Jan
 2025 12:02:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 12:02:02 +0000
Date: Sat, 25 Jan 2025 20:01:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache_part2_v3_250112] [net] 911eebb2aa:
 BUG:Bad_page_map_in_process
Message-ID: <202501241641.e28ad67c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d054eb5-bacc-48bc-9ca7-08dd3d381409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p9b+O/8izGEpJL86SLXnFsEnYHnUYhTABrz+qlV4PJ4i2y0uPUpOyObMQl0i?=
 =?us-ascii?Q?U97d8941bLUZbxqkjjGSViPuuH2+ZvPmQdKijoSatyw0uwSez4vaQJIfLa+N?=
 =?us-ascii?Q?XJn/tkj8U8Ox7Pa5d2rR0kw2TGH419aswGm7HPLe4yKp5+gHBVyPgr7mq+JM?=
 =?us-ascii?Q?9gF0ODDwHqBP/N5f9GomUL3578OcPk19YNQQ4NkfV/v8YEzsYPlzwCD9M9sI?=
 =?us-ascii?Q?zhCSm8ofO+vd+eu8TZVCSfRb9M3ncF7ZCC9AhGD6suIlEImHXCFrW4blbdJI?=
 =?us-ascii?Q?/cUwajnWMUv/Vl8NJmJWZPXlgLgGkhS531E5fNXop3XrlCb2DoE8LfdEG/rQ?=
 =?us-ascii?Q?TVawkh9oHKsuHtknRly3RrKUC6uFyvddtaQzJkoMEVZoftSaboFG98wMCzcl?=
 =?us-ascii?Q?u3TaD74CZv+YDxJ/OktTCd3IrL3zuH1EbHDLGH0wsjT+PsnFJUYENgiW2qEf?=
 =?us-ascii?Q?ASn6ZvlZ2+bX9XvYo+lia73W9GiItkEyciNv2Do/kCjrYIATm1vnPoDJ6KCy?=
 =?us-ascii?Q?LG7tQZWmaoQnsFx5p+YJKiO2o6Cesg/kiJO1ct+hGaXDw0e8BjOOiBol7mRC?=
 =?us-ascii?Q?CVkuHdUH3EB9/ESnMlFk+gZQH0WCav1y5+CYGDWnxzprmQfPEgqcJTo95MgS?=
 =?us-ascii?Q?tH/Ex7yxFW0fCDniaVRp7mxUfuasRnIOHRh5XASK59Z67Qw3m2a5d8F3JFcu?=
 =?us-ascii?Q?O27t9dJxhALG0zkWLzcvZwtFu33lbBOM0CoZn3jdcjvdSzFfRNOZC1/RaaCh?=
 =?us-ascii?Q?mz2g/kNlvT7N8cTL6+MI+3pNuVWn9PXsqb8nUd8V8LAFLVck5HX+3Jdbf+D1?=
 =?us-ascii?Q?WRsyZpVTmxYxTwZiwqDkCbXOudYHE31hiDCrlqkaNW5obKAUdHE3TzprG1xg?=
 =?us-ascii?Q?r9ZKJ6eImx/WI/MdxILfYKtl/83J4Kav9lHg0RDv+p6IEpnl1l7Q2EBlXL8m?=
 =?us-ascii?Q?d9SNz5G0XElwnymYrx5bII0MfkZObC96jKyaMwtas/sSuc/AcbGg9ezTTDXN?=
 =?us-ascii?Q?wauX0UwGLJEarxlWD9RP8YKooRbbFRpLH//7kXV830pMoYAYShz+lH8+RzAF?=
 =?us-ascii?Q?Lu9DrOOWL6u+a0wYmcgYTAL0JXRWwqYSplHgTwkrHJcQH60MUzRWI6IiAyn1?=
 =?us-ascii?Q?RKZDbCa1XzmrUPm05e1JCai8JFLNyO4lT7wirWOjUqnU1th0ZB3XVGIONlAY?=
 =?us-ascii?Q?c7Gm0T8rkje8dsFfhGKIfuEcCStqKtNzdVMR8WVPA3AInKwpSuVuZMkEGi05?=
 =?us-ascii?Q?TPSVihiDd+ubg7JWoQWgzBI8G8LcXyV/OopEL1P4m/IDqqRY1kyTQdR/+l2q?=
 =?us-ascii?Q?pusnofPNNCQujhhui1iKAlueMtAjo8GXxPC9OmcmXCHKLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4RiE30sJXKOnV/4lLe0uZ+hOfEqc5H5FatKYU4cR1gm0ECjSJhi8LXGnqLqr?=
 =?us-ascii?Q?1j+v8nGTM9mxEs9GyM1tamiaTwPPW4T4Vyo6JEySzc4OjCXFNs6rm0sHDUjk?=
 =?us-ascii?Q?+iY6fyASSA80j5/7ScV7CrhdT1mLMkPpXl5HM8qKdXGZfJ4yVN6D9SxhhtKM?=
 =?us-ascii?Q?oJaowWq6Wtiv0PtbQ5LzVjb1vCkssNdOHVoBKBBfldLjdkvwHm76mnZ6Ywff?=
 =?us-ascii?Q?3HHvNUAHp+TxYW37FwAF2iKJxqDwGE2+OsTn6ZUFb+RLgXyh2GW0C+BtCxkq?=
 =?us-ascii?Q?xE2ynKddqVbGOnh19pTSaYXjW6m1Url0B/QvFJtDCT0uaWSIcvNIIYvKo3Uc?=
 =?us-ascii?Q?sfZ+0xaU+9QejYTN4eqYz+nhM6PrNqZd5wG5bsftsD/ztvS/uXoKlTucgX01?=
 =?us-ascii?Q?Jd9maRIwrHqal0MoBuN7QLR0ShvPznRq0P9RV1JaBig/YlPEItm2wmR4z2I7?=
 =?us-ascii?Q?rx0IUU3SqwkInsfM8WsTutw27/oyU4r5qjiF89hkcUadanl8idCdGbz22hZA?=
 =?us-ascii?Q?dy5MYYvmU6WSl5dG5mP7gOSNe6591/6kzolFLRghjbn0CZ9ShubdafYHF/K6?=
 =?us-ascii?Q?LXC9csa3POMIROulv4jOCvzGjmLKLsPgiGFbri00gQNLeiqpBe5amJDFmHAO?=
 =?us-ascii?Q?QUQcNsNyNLE4SDBPRFH0SK3kSlFiWvbCLBaLX5B7w1rYHxAQPlur6scwsMl1?=
 =?us-ascii?Q?8xPwgLZw4dZIJB/jgntgTI9he/sZ+BdgEwEZtwo+T+UsBrp601vvYt5sjSl3?=
 =?us-ascii?Q?U9R/UMD0tbbUxfW5U7TReBpRsRgKwyUwaP4VVo55aIRsNMRBiB6nDfeBRBD3?=
 =?us-ascii?Q?Xm1OxdglmtCtvKOBFKRGHayR9eoIWFEO/sjeOZiJO2HdMgobSIHn5QUALf/p?=
 =?us-ascii?Q?I7G+a9n5vtWjQr7tQ59EvxCUHjEHL9GkkdMYt9y/oB3bYdgw2vTjnwbrgGWJ?=
 =?us-ascii?Q?qiBHoe7LSFYPK3dHIE7e7uTkta/gJEbaRkFzw2eeIeogG8GNo1o4qhfg+At/?=
 =?us-ascii?Q?tGB0D2dlwONJ6+Xn7P8vX8gtGsTIqIVu76LWLoSSVMrhjOPcUQ9iAZTBMqSL?=
 =?us-ascii?Q?SGd7Jbi36ndAMZUdTNh7Bk/vQXu4iMP/CL+WAXOS/Vyw2XKbk/RvyVS0A/AY?=
 =?us-ascii?Q?gvzFhxdtv0LuLApt91EV7CAC7vtwGC/aurLetUBdFF/PTH931EnYtf8VbKhy?=
 =?us-ascii?Q?FSyrHr3/DUYqQzS1Sq0/d/VqRSu4qkmZsOyMmuk7AOc3HKhY39oeCmb8asTP?=
 =?us-ascii?Q?bQ3+8fITgIHHK6w5Z1jcHxEjLxpzJE7zg5yhBBOoP6QE62NFtqjTGfxy/0Lx?=
 =?us-ascii?Q?0muGoWvvxFRP1/sjgKzVu4Ozu7vkj7trLlVCcFlxBb33DTogb8C9uaDdPjHk?=
 =?us-ascii?Q?GpU2q2vbTIRfCrlkqW995DCI6AMo1Qk2MBxSSbD22zeJL/EpqKGNTnGkjNtn?=
 =?us-ascii?Q?rjrNe4uMRVi8tbHX1CaY5qHb6sKDzIjHo0ivfL/WKdz89/9O3dvKEJKUpM9Q?=
 =?us-ascii?Q?Z8zfhjIDdBtdPPTAxNSl1L65XA3nhucAh8BSjlvyLUVQEZYosX/NEN8Y6BIN?=
 =?us-ascii?Q?Vp1oe4DCCafvsPbokSHskWH3tyF4oG6CsEOeKlLx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d054eb5-bacc-48bc-9ca7-08dd3d381409
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 12:02:02.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw+bnHsB3xL4jMhdQYVhW3pomR2EAseNiRyvy3hDM9JUtIC8Q5Ku51oxFatDx11dzdTt3Ma97LuBaC9YO7Ds+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
X-OriginatorOrg: intel.com


hi, Yunsheng Lin,

for this commit, we found various random issues as [1], but parent
keeps clean when we run the same case up to 300 times. just FYI.



Hello,

kernel test robot noticed "BUG:Bad_page_map_in_process" on:

commit: 911eebb2aa66acbd57703fd3eedc8b92bed49e97 ("net: replace page_frag with page_frag_cache")
https://github.com/gestionlin/linux.git page_frag_cache_part2_v3_250112

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: i386-randconfig-007-20250121
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501241641.e28ad67c-lkp@intel.com


[   94.195498][ T3994] BUG: Bad page map in process trinity-c1  pte:000001a3 pmd:1f4c2067
[   94.196772][ T3994] page: refcount:1 mapcount:-1 mapping:00000000 index:0x0 pfn:0x0
[   94.197947][ T3994] flags: 0x2004(referenced|reserved|section=0|zone=0)
[   94.198926][ T3994] raw: 00002004 ed400004 ed400004 00000000 00000000 00000000 fffffffe 00000001
[   94.200300][ T3994] page dumped because: bad pte
[   94.201036][ T3994] page_owner info is not present (never set?)
[   94.202140][ T3994] addr:00780000 vm_flags:00100073 anon_vma:b828d8c0 mapping:4938c160 index:35a
[   94.203935][ T4030] journal-offline (4030) used greatest stack depth: 3944 bytes left
[   94.211711][ T3994] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.213087][ T3994] CPU: 1 UID: 65534 PID: 3994 Comm: trinity-c1 Not tainted 6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.214976][ T3994] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.216466][ T3994] Call Trace:
[ 94.217021][ T3994] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.217749][ T3994] ? simple_write_begin (fs/libfs.c:911) 
[ 94.218530][ T3994] dump_stack (lib/dump_stack.c:129) 
[ 94.219146][ T3994] print_bad_pte (mm/memory.c:543) 
[ 94.219851][ T3994] unmap_page_range (mm/memory.c:?) 
[ 94.220612][ T3994] unmap_vmas (mm/memory.c:1870) 
[ 94.221279][ T3994] vms_clear_ptes (mm/vma.c:1136) 
[ 94.221988][ T3994] vms_complete_munmap_vmas (mm/vma.c:1185) 
[ 94.222823][ T3994] do_vmi_align_munmap (mm/vma.c:?) 
[ 94.223635][ T3994] do_vmi_munmap (mm/vma.c:1492) 
[ 94.224350][ T3994] do_munmap (mm/mmap.c:1321) 
[ 94.225023][ T3994] mremap_to (mm/mremap.c:?) 
[ 94.225690][ T3994] __ia32_sys_mremap (mm/mremap.c:?) 
[ 94.226495][ T3994] ? trace_irq_disable (include/trace/events/preemptirq.h:36) 
[ 94.227252][ T3994] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-007-20250121/./arch/x86/include/generated/asm/syscalls_32.h:317) 
[ 94.227961][ T3994] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 94.228693][ T3994] ? irqentry_exit (kernel/entry/common.c:367) 
[ 94.229415][ T3994] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.230133][ T3994] EIP: 0x37fcf092
[ 94.230737][ T3994] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   94.233447][ T3994] EAX: ffffffda EBX: 00600000 ECX: 000b0000 EDX: 00100000
[   94.234496][ T3994] ESI: 00000003 EDI: 00700000 EBP: 00000034 ESP: 3f8e5ec8
[   94.235499][ T3994] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000216
[   94.236720][ T3994] Disabling lock debugging due to kernel taint
[   94.277516][ T3994] BUG: Bad page map in process trinity-c1  pte:812400002fee pmd:1f4c2067
[   94.278770][ T3994] addr:00781000 vm_flags:00100073 anon_vma:b828d8c0 mapping:4938c160 index:35b
[   94.280094][ T3994] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.298382][ T3994] CPU: 1 UID: 65534 PID: 3994 Comm: trinity-c1 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.300391][ T3994] Tainted: [B]=BAD_PAGE
[   94.301013][ T3994] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.302460][ T3994] Call Trace:
[ 94.303021][ T3994] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.303738][ T3994] ? simple_write_begin (fs/libfs.c:911) 
[ 94.304529][ T3994] dump_stack (lib/dump_stack.c:129) 
[ 94.305182][ T3994] print_bad_pte (mm/memory.c:543) 
[ 94.305901][ T3994] vm_normal_page (mm/memory.c:?) 
[ 94.306617][ T3994] unmap_page_range (mm/memory.c:1555) 
[ 94.307377][ T3994] unmap_vmas (mm/memory.c:1870) 
[ 94.308049][ T3994] vms_clear_ptes (mm/vma.c:1136) 
[ 94.308770][ T3994] vms_complete_munmap_vmas (mm/vma.c:1185) 
[ 94.309589][ T3994] do_vmi_align_munmap (mm/vma.c:?) 
[ 94.310375][ T3994] do_vmi_munmap (mm/vma.c:1492) 
[ 94.323197][ T3994] do_munmap (mm/mmap.c:1321) 
[ 94.323846][ T3994] mremap_to (mm/mremap.c:?) 
[ 94.324499][ T3994] __ia32_sys_mremap (mm/mremap.c:?) 
[ 94.325252][ T3994] ? trace_irq_disable (include/trace/events/preemptirq.h:36) 
[ 94.326007][ T3994] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-007-20250121/./arch/x86/include/generated/asm/syscalls_32.h:317) 
[ 94.326707][ T3994] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 94.327403][ T3994] ? irqentry_exit (kernel/entry/common.c:367) 
[ 94.328075][ T3994] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.328733][ T3994] EIP: 0x37fcf092
[ 94.329277][ T3994] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   94.331667][ T3994] EAX: ffffffda EBX: 00600000 ECX: 000b0000 EDX: 00100000
[   94.332663][ T3994] ESI: 00000003 EDI: 00700000 EBP: 00000034 ESP: 3f8e5ec8
[   94.333635][ T3994] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000216
[   94.336977][ T3994] BUG: Bad page state in process trinity-c1  pfn:00000
[   94.339429][ T3994] page: refcount:0 mapcount:-1 mapping:00000000 index:0x0 pfn:0x0
[   94.340981][ T3994] flags: 0x2004(referenced|reserved|section=0|zone=0)
[   94.341952][ T3994] raw: 00002004 ed400004 ed400004 00000000 00000000 00000000 fffffffe 00000000
[   94.343159][ T3994] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
[   94.344607][ T3994] page_owner info is not present (never set?)
[   94.345493][ T3994] Modules linked in: af_alg caif_socket caif crc_ccitt phonet can_raw can pppoe pppox ppp_generic slhc llc2 x25 appletalk psnap llc ax25 rtc_cmos ipmi_devintf ipmi_msghandler evdev qemu_fw_cfg autofs4 aesni_intel crypto_simd cryptd
[   94.353569][ T3994] CPU: 0 UID: 65534 PID: 3994 Comm: trinity-c1 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.357822][ T3994] Tainted: [B]=BAD_PAGE
[   94.359160][ T3994] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.360616][ T3994] Call Trace:
[ 94.361167][ T3994] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.361848][ T3994] dump_stack (lib/dump_stack.c:129) 
[ 94.362478][ T3994] bad_page (mm/page_alloc.c:?) 
[ 94.363073][ T3994] free_page_is_bad_report (mm/page_alloc.c:915) 
[ 94.363835][ T3994] free_unref_folios (mm/page_alloc.c:?) 
[ 94.364545][ T3994] folios_put_refs (mm/swap.c:?) 
[ 94.365229][ T3994] free_pages_and_swap_cache (mm/swap_state.c:?) 
[ 94.365994][ T3994] tlb_flush_mmu (mm/mmu_gather.c:137 mm/mmu_gather.c:149 mm/mmu_gather.c:366 mm/mmu_gather.c:373) 
[ 94.378566][ T3994] tlb_finish_mmu (mm/mmu_gather.c:157 mm/mmu_gather.c:468) 
[ 94.383318][ T3994] vms_clear_ptes (mm/vma.c:1144) 
[ 94.384914][ T3994] vms_complete_munmap_vmas (mm/vma.c:1185) 
[ 94.386805][ T3994] do_vmi_align_munmap (mm/vma.c:?) 
[ 94.388780][ T3994] do_vmi_munmap (mm/vma.c:1492) 
[ 94.390532][ T3994] do_munmap (mm/mmap.c:1321) 
[ 94.392106][ T3994] mremap_to (mm/mremap.c:?) 
[ 94.393411][ T3994] __ia32_sys_mremap (mm/mremap.c:?) 
[ 94.395285][ T3994] ? trace_irq_disable (include/trace/events/preemptirq.h:36) 
[ 94.397196][ T3994] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-007-20250121/./arch/x86/include/generated/asm/syscalls_32.h:317) 
[ 94.398653][ T3994] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 94.400428][ T3994] ? irqentry_exit (kernel/entry/common.c:367) 
[ 94.402096][ T3994] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.403620][ T3994] EIP: 0x37fcf092
[ 94.405011][ T3994] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[   94.410742][ T3994] EAX: ffffffda EBX: 00600000 ECX: 000b0000 EDX: 00100000
[   94.413063][ T3994] ESI: 00000003 EDI: 00700000 EBP: 00000034 ESP: 3f8e5ec8
[   94.415407][ T3994] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000216
[   94.421227][ T4010] get_swap_device: Bad swap file entry 03ffbcff
[   94.429825][ T3994] get_swap_device: Bad swap file entry 03ff8fff
[   94.438949][ T4010] BUG: Bad rss-counter state mm:4ea1e70d type:MM_SWAPENTS val:-1
[   94.439091][ T3994] BUG: Bad rss-counter state mm:fb5ca39b type:MM_FILEPAGES val:111
[   94.439698][ T4010] BUG: Bad rss-counter state mm:4ea1e70d type:MM_SHMEMPAGES val:129
[   94.443552][  T232] [main] kernel became tainted! (32/0) Last seed was 2147485991
[   94.443648][  T232]
[   94.447718][ T3994] BUG: Bad rss-counter state mm:fb5ca39b type:MM_ANONPAGES val:18
[   94.447727][ T3994] BUG: Bad rss-counter state mm:fb5ca39b type:MM_SWAPENTS val:-2
[   94.447729][ T3994] BUG: Bad rss-counter state mm:fb5ca39b type:MM_SHMEMPAGES val:1
[   94.453042][ T4024] BUG: Bad page map in process trinity-c6  pte:18f0000fffe pmd:1f530067
[   94.454300][ T4024] addr:00a00000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5da
[   94.459648][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.460911][  T232] trinity: Detected kernel tainting. Last seed was 2147485991
[   94.461009][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.461013][  T232]
[   94.464296][  T232] [main] exit_reason=7, but 5 children still running.
[   94.464534][ T4024] Tainted: [B]=BAD_PAGE
[   94.464809][  T232]
[   94.465427][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.473472][ T4024] Call Trace:
[ 94.474849][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.476180][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.477850][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.479095][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.480824][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.482241][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.483884][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.485798][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.487248][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.488751][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.490161][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.491871][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.493339][ T4024] mmput (kernel/fork.c:1372) 
[ 94.495548][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.496964][ T4024] do_exit (kernel/exit.c:929) 
[ 94.498356][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.500065][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.501536][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.502901][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.504745][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.506515][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.508162][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.509752][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.511378][ T4024] EIP: 0x37fcf092
[ 94.512680][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.514854][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.516421][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.517398][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.519562][ T4024] get_swap_device: Bad swap file entry 037fffff
[   94.521769][ T4024] BUG: Bad page map in process trinity-c6  pte:1000081a4 pmd:1f530067
[   94.524327][ T4024] addr:00a02000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5dc
[   94.527067][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.530221][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.535002][ T4024] Tainted: [B]=BAD_PAGE
[   94.536622][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.539777][ T4024] Call Trace:
[ 94.541006][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.542522][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.544066][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.545461][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.546744][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.548113][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.549474][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.551019][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.551686][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.552388][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.553032][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.553791][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.554397][ T4024] mmput (kernel/fork.c:1372) 
[ 94.554985][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.555601][ T4024] do_exit (kernel/exit.c:929) 
[ 94.556226][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.556920][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.557590][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.558262][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.559039][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.559807][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.560529][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.561232][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.561907][ T4024] EIP: 0x37fcf092
[ 94.562491][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.563288][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.564191][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.565097][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.583467][ T4024] get_swap_device: Bad swap file entry 03ffffff
[   94.584462][ T4024] get_swap_device: Bad swap file entry 03ffffff
[   94.585354][ T4024] BUG: Bad page map in process trinity-c6  pte:188e9f0067925368 pmd:1f530067
[   94.586585][ T4024] addr:00a08000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e2
[   94.587856][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.589197][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.591179][ T4024] Tainted: [B]=BAD_PAGE
[   94.591818][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.593154][ T4024] Call Trace:
[ 94.593679][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.594343][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.595110][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.596574][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.598015][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.599553][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.600319][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.601088][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.601751][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.602465][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.603084][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.603819][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.604429][ T4024] mmput (kernel/fork.c:1372) 
[ 94.605013][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.605638][ T4024] do_exit (kernel/exit.c:929) 
[ 94.606251][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.611055][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.611746][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.612387][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.613185][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.613963][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.614849][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.616479][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.617995][ T4024] EIP: 0x37fcf092
[ 94.618900][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.619858][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.620830][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.621824][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.629664][ T4024] BUG: Bad page map in process trinity-c6  pte:188e9f0067925368 pmd:1f530067
[   94.635106][ T4024] addr:00a09000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e3
[   94.636378][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.637624][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.653069][ T4024] Tainted: [B]=BAD_PAGE
[   94.655128][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.658229][ T4024] Call Trace:
[ 94.663323][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.665032][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.666637][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.667967][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.668698][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.669403][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.670129][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.670880][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.671523][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.672229][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.672847][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.673574][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.674190][ T4024] mmput (kernel/fork.c:1372) 
[ 94.674761][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.675351][ T4024] do_exit (kernel/exit.c:929) 
[ 94.675950][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.676634][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.677297][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.677930][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.678712][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.679489][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.680211][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.680911][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.681576][ T4024] EIP: 0x37fcf092
[ 94.682154][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.683056][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.684011][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.684966][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.689769][ T4024] BUG: Bad page map in process trinity-c6  pte:188e9f0067925368 pmd:1f530067
[   94.693476][ T4024] addr:00a0a000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e4
[   94.696594][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.699972][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.704900][ T4024] Tainted: [B]=BAD_PAGE
[   94.706479][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.709980][ T4024] Call Trace:
[ 94.711293][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.712834][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.713608][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.714247][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.714916][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.715574][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.717410][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.718898][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.720408][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.722084][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.723404][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.725163][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.726616][ T4024] mmput (kernel/fork.c:1372) 
[ 94.727898][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.729361][ T4024] do_exit (kernel/exit.c:929) 
[ 94.730691][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.732090][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.733493][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.735002][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.736780][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.738552][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.740127][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.741687][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.743206][ T4024] EIP: 0x37fcf092
[ 94.744403][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.746523][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.748430][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.750524][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.754381][ T4024] BUG: Bad page map in process trinity-c6  pte:000011b1 pmd:1f530067
[   94.760013][ T4024] page: refcount:1 mapcount:-1 mapping:00000000 index:0x0 pfn:0x1
[   94.761195][ T4024] flags: 0x2004(referenced|reserved|section=0|zone=0)
[   94.762144][ T4024] raw: 00002004 ed400024 ed400024 00000000 00000000 00000000 fffffffe 00000001
[   94.768630][ T4024] page dumped because: bad pte
[   94.769358][ T4024] page_owner info is not present (never set?)
[   94.770187][ T4024] addr:00a0b000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e5
[   94.771455][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.778558][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.780623][ T4024] Tainted: [B]=BAD_PAGE
[   94.781259][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.782665][ T4024] Call Trace:
[ 94.783188][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.783837][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.784587][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.785208][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.785887][ T4024] unmap_page_range (mm/memory.c:?) 
[ 94.786617][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.787356][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.787989][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.788668][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.789291][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.790018][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.790656][ T4024] mmput (kernel/fork.c:1372) 
[ 94.791237][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.791839][ T4024] do_exit (kernel/exit.c:929) 
[ 94.792445][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.793115][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.793739][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.794376][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.795133][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.795884][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.796588][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.797261][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.797915][ T4024] EIP: 0x37fcf092
[ 94.798482][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.799358][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.800293][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.801238][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.802389][ T4024] BUG: Bad page map in process trinity-c6  pte:2cb4b11d54068d46 pmd:1f530067
[   94.803652][ T4024] addr:00a0c000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e6
[   94.804904][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.808029][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.812159][ T4024] Tainted: [B]=BAD_PAGE
[   94.813385][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.816434][ T4024] Call Trace:
[ 94.817719][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.819243][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.820873][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.822195][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.823630][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.825031][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.826652][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.828297][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.829555][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.831863][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.833248][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.834818][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.836168][ T4024] mmput (kernel/fork.c:1372) 
[ 94.837382][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.838692][ T4024] do_exit (kernel/exit.c:929) 
[ 94.840041][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.841529][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.843112][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.844334][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.845447][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.847100][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.848724][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.858471][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.859404][ T4024] EIP: 0x37fcf092
[ 94.860016][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.860946][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.861917][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.862865][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.864829][ T4024] BUG: Bad page map in process trinity-c6  pte:7eab3dde7ea4bb6a pmd:1f530067
[   94.866110][ T4024] addr:00a0d000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e7
[   94.880213][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.883034][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.887598][ T4024] Tainted: [B]=BAD_PAGE
[   94.889064][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.892114][ T4024] Call Trace:
[ 94.893377][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.894646][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.903439][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.904128][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.904835][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.905526][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.906289][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.907065][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.907713][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.908409][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.909067][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.909830][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.910467][ T4024] mmput (kernel/fork.c:1372) 
[ 94.911061][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.911677][ T4024] do_exit (kernel/exit.c:929) 
[ 94.912303][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.912992][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.913660][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.914333][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.915119][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.915888][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.916608][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.917310][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.917993][ T4024] EIP: 0x37fcf092
[ 94.918575][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.919463][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.920404][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.921353][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.934811][ T4024] BUG: Bad page map in process trinity-c6  pte:d2f707e73363a74c pmd:1f530067
[   94.939793][ T4024] addr:00a0e000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e8
[   94.941081][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.942596][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   94.946970][ T4024] Tainted: [B]=BAD_PAGE
[   94.948023][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   94.949483][ T4024] Call Trace:
[ 94.950039][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 94.950746][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 94.951520][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 94.952156][ T4024] print_bad_pte (mm/memory.c:543) 
[ 94.952853][ T4024] vm_normal_page (mm/memory.c:?) 
[ 94.953539][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 94.954271][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 94.955018][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 94.955652][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.956314][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 94.956956][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 94.957681][ T4024] __mmput (kernel/fork.c:1350) 
[ 94.958292][ T4024] mmput (kernel/fork.c:1372) 
[ 94.958869][ T4024] exit_mm (kernel/exit.c:571) 
[ 94.959491][ T4024] do_exit (kernel/exit.c:929) 
[ 94.960115][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 94.960799][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 94.961461][ T4024] get_signal (kernel/signal.c:3017) 
[ 94.962125][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 94.982978][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 94.983783][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 94.984514][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 94.985208][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   94.985894][ T4024] EIP: 0x37fcf092
[ 94.986480][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   94.987344][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   94.988284][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   94.989251][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   94.992034][ T4024] BUG: Bad page map in process trinity-c6  pte:7f593239ba60fa1f pmd:1f530067
[   94.994401][ T4024] addr:00a0f000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5e9
[   94.996910][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   94.999528][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.001632][ T4024] Tainted: [B]=BAD_PAGE
[   95.002600][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.004006][ T4024] Call Trace:
[ 95.004559][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.005247][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.005997][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.010513][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.011225][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.011934][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.012683][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.013448][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.014099][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.023112][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.023750][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.024495][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.025115][ T4024] mmput (kernel/fork.c:1372) 
[ 95.025721][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.026346][ T4024] do_exit (kernel/exit.c:929) 
[ 95.026996][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.027691][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.028363][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.029034][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.029858][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.030653][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.031353][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.032020][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.032708][ T4024] EIP: 0x37fcf092
[ 95.033290][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.034219][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.035196][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.036144][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.039779][ T4024] BUG: Bad page map in process trinity-c6  pte:7a098810ddd45fc0 pmd:1f530067
[   95.044021][ T4024] addr:00a10000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5ea
[   95.050523][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.052937][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.055950][ T4024] Tainted: [B]=BAD_PAGE
[   95.056596][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.057995][ T4024] Call Trace:
[ 95.062558][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.063378][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.064186][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.064836][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.065559][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.066332][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.067733][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.069562][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.070951][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.072660][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.073905][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.075334][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.076818][ T4024] mmput (kernel/fork.c:1372) 
[ 95.077924][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.079306][ T4024] do_exit (kernel/exit.c:929) 
[ 95.080705][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.082347][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.083849][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.085338][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.087110][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.088286][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.089039][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.090095][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.091454][ T4024] EIP: 0x37fcf092
[ 95.092537][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.094641][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.096673][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.098826][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.102281][ T4024] BUG: Bad page map in process trinity-c6  pte:37a0a4ea22f9ad44 pmd:1f530067
[   95.105149][ T4024] addr:00a11000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5eb
[   95.107833][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.110673][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.115407][ T4024] Tainted: [B]=BAD_PAGE
[   95.116951][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.120149][ T4024] Call Trace:
[ 95.121433][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.123020][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.124571][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.125236][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.125927][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.126634][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.127359][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.128131][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.128781][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.129471][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.130135][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.134967][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.135625][ T4024] mmput (kernel/fork.c:1372) 
[ 95.136208][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.143075][ T4024] do_exit (kernel/exit.c:929) 
[ 95.143731][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.144393][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.145066][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.145722][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.146629][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.148143][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.149660][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.151277][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.152773][ T4024] EIP: 0x37fcf092
[ 95.153953][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.155480][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.157440][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.166994][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.168878][ T4024] BUG: Bad page map in process trinity-c6  pte:2a05610b326a044b pmd:1f530067
[   95.170247][ T4024] addr:00a12000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5ec
[   95.171521][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.172920][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.174990][ T4024] Tainted: [B]=BAD_PAGE
[   95.175632][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.176998][ T4024] Call Trace:
[ 95.177535][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.178137][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.179286][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.180793][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.182227][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.183780][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.185539][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.187503][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.188910][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.190723][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.192281][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.193755][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.195331][ T4024] mmput (kernel/fork.c:1372) 
[ 95.196723][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.198089][ T4024] do_exit (kernel/exit.c:929) 
[ 95.199739][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.201383][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.202993][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.204488][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.206167][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.208140][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.209886][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.211588][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.213098][ T4024] EIP: 0x37fcf092
[ 95.214420][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.216669][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.218892][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.221095][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.232586][ T4024] BUG: Bad page map in process trinity-c6  pte:58143d9895e4655b pmd:1f530067
[   95.233882][ T4024] addr:00a13000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5ed
[   95.235246][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.236630][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.244464][ T4024] Tainted: [B]=BAD_PAGE
[   95.245127][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.246596][ T4024] Call Trace:
[ 95.247165][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.247846][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.248614][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.249253][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.249943][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.250635][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.251382][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.252158][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.252822][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.253521][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.254177][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.254955][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.255588][ T4024] mmput (kernel/fork.c:1372) 
[ 95.256187][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.256816][ T4024] do_exit (kernel/exit.c:929) 
[ 95.257453][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.258147][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.258970][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.259645][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.260467][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.261257][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.261990][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.262710][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.263408][ T4024] EIP: 0x37fcf092
[ 95.263996][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.264940][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.265930][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.266908][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.276916][ T4024] get_swap_device: Bad swap file entry 5b29e50b
[   95.277851][ T4024] BUG: Bad page map in process trinity-c6  pte:f0d77c4d6d720eb pmd:1f530067
[   95.300049][ T4024] addr:00a15000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5ef
[   95.301350][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.302778][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.304882][ T4024] Tainted: [B]=BAD_PAGE
[   95.305542][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.307047][ T4024] Call Trace:
[ 95.307601][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.308288][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.309048][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.309699][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.310416][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.311127][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.311883][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.312679][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.313354][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.314077][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.314749][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.315538][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.316176][ T4024] mmput (kernel/fork.c:1372) 
[ 95.316782][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.317426][ T4024] do_exit (kernel/exit.c:929) 
[ 95.318085][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.318832][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.319528][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.320205][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.321040][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.321848][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.322602][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.323326][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.324036][ T4024] EIP: 0x37fcf092
[ 95.324643][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.325595][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.326618][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.327653][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.333577][ T4024] BUG: Bad page map in process trinity-c6  pte:33b047d88642777b pmd:1f530067
[   95.339283][ T4024] addr:00a16000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f0
[   95.340629][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.344083][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.348737][ T4024] Tainted: [B]=BAD_PAGE
[   95.349483][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.351142][ T4024] Call Trace:
[ 95.351953][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.353487][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.355069][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.356320][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.357845][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.362872][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.363638][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.364406][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.365065][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.365764][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.370685][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.371523][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.372197][ T4024] mmput (kernel/fork.c:1372) 
[ 95.372824][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.373463][ T4024] do_exit (kernel/exit.c:929) 
[ 95.374105][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.375008][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.376861][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.378666][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.380577][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.382482][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.384285][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.386109][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.387759][ T4024] EIP: 0x37fcf092
[ 95.389068][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.401023][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.403495][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.405813][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.410600][ T4024] BUG: Bad page map in process trinity-c6  pte:6f9cddd244c895ac pmd:1f530067
[   95.415829][ T4024] addr:00a17000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f1
[   95.417104][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.418533][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.423144][ T4024] Tainted: [B]=BAD_PAGE
[   95.424502][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.427917][ T4024] Call Trace:
[ 95.429272][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.430863][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.432728][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.434397][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.435996][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.437806][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.439648][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.441259][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.442928][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.444010][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.445190][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.446455][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.447475][ T4024] mmput (kernel/fork.c:1372) 
[ 95.448427][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.449421][ T4024] do_exit (kernel/exit.c:929) 
[ 95.450482][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.451593][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.452694][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.453792][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.455164][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.456139][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.463093][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.463793][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.464474][ T4024] EIP: 0x37fcf092
[ 95.465049][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.465928][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.466899][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.467843][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.469468][ T4024] BUG: Bad page map in process trinity-c6  pte:fbeb420f361bd1c5 pmd:1f530067
[   95.471765][ T4024] addr:00a18000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f2
[   95.474057][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.476559][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.480439][ T4024] Tainted: [B]=BAD_PAGE
[   95.481701][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.484428][ T4024] Call Trace:
[ 95.485519][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.486837][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.488241][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.489508][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.490785][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.491961][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.493439][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.494846][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.495998][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.497002][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.498191][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.499622][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.500799][ T4024] mmput (kernel/fork.c:1372) 
[ 95.501864][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.503011][ T4024] do_exit (kernel/exit.c:929) 
[ 95.504086][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.505137][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.506387][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.507592][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.509023][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.510424][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.511875][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.513166][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.514380][ T4024] EIP: 0x37fcf092
[ 95.515406][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.517109][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.518075][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.519060][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.520234][ T4024] get_swap_device: Bad swap file entry 5aec971e
[   95.523028][ T4024] BUG: Bad page map in process trinity-c6  pte:6b60ecbf2d3c7855 pmd:1f530067
[   95.524284][ T4024] addr:00a1a000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f4
[   95.525513][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.526761][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.528803][ T4024] Tainted: [B]=BAD_PAGE
[   95.529440][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.534689][ T4024] Call Trace:
[ 95.535235][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.535924][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.536673][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.537280][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.537955][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.538731][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.539474][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.540267][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.540936][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.541648][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.542325][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.547594][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.548247][ T4024] mmput (kernel/fork.c:1372) 
[ 95.548869][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.549511][ T4024] do_exit (kernel/exit.c:929) 
[ 95.554881][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.556010][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.557139][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.558209][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.559310][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.560068][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.560784][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.561482][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.562147][ T4024] EIP: 0x37fcf092
[ 95.562713][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.563635][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.564599][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.565592][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.571277][ T4024] BUG: Bad page map in process trinity-c6  pte:cbc34c0654b02981 pmd:1f530067
[   95.572575][ T4024] addr:00a1b000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f5
[   95.573823][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.578575][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.580610][ T4024] Tainted: [B]=BAD_PAGE
[   95.581246][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.582732][ T4024] Call Trace:
[ 95.583728][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.584905][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.586262][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.587347][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.588482][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.589641][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.591007][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.592478][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.593569][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.594827][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.596056][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.597332][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.598497][ T4024] mmput (kernel/fork.c:1372) 
[ 95.599456][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.600392][ T4024] do_exit (kernel/exit.c:929) 
[ 95.601544][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.602698][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.603868][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.605085][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.606499][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.607862][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.609222][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.610494][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.611620][ T4024] EIP: 0x37fcf092
[ 95.612568][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.614184][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.615936][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.617498][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.622764][ T4024] get_swap_device: Bad swap file entry 43697e90
[   95.624562][ T4024] BUG: Bad page map in process trinity-c6  pte:2c9fe0d7eaaaf9b0 pmd:1f530067
[   95.626840][ T4024] addr:00a1d000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f7
[   95.629051][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.637488][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.639531][ T4024] Tainted: [B]=BAD_PAGE
[   95.640163][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.641580][ T4024] Call Trace:
[ 95.642117][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.646856][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.647616][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.648249][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.648960][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.649665][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.650421][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.651677][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.652616][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.653588][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.654568][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.655750][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.656388][ T4024] mmput (kernel/fork.c:1372) 
[ 95.658168][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.659134][ T4024] do_exit (kernel/exit.c:929) 
[ 95.660130][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.661195][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.662350][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.663426][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.664799][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.666226][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.667549][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.668748][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.669903][ T4024] EIP: 0x37fcf092
[ 95.670913][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.672544][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.674409][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.676095][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.678424][ T4024] BUG: Bad page map in process trinity-c6  pte:4982bac81759db58 pmd:1f530067
[   95.679708][ T4024] addr:00a1e000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f8
[   95.680946][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.682261][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.684328][ T4024] Tainted: [B]=BAD_PAGE
[   95.684964][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.686387][ T4024] Call Trace:
[ 95.686928][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.687594][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.688308][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.688937][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.689633][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.690317][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.691063][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.691813][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.692425][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.693134][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.693778][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.694534][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.695136][ T4024] mmput (kernel/fork.c:1372) 
[ 95.695700][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.696300][ T4024] do_exit (kernel/exit.c:929) 
[ 95.696931][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.697620][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.698289][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.698964][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.699743][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.700453][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.701199][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.701889][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.702563][ T4024] EIP: 0x37fcf092
[ 95.703138][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.704027][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.704942][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.705904][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.710031][ T4024] BUG: Bad page map in process trinity-c6  pte:9db4607fe99d32e3 pmd:1f530067
[   95.711912][ T4024] addr:00a1f000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5f9
[   95.714064][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.716421][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.719946][ T4024] Tainted: [B]=BAD_PAGE
[   95.720969][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.723483][ T4024] Call Trace:
[ 95.724371][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.725549][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.726899][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.728034][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.729251][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.730323][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.731622][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.732876][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.733894][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.735067][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.736089][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.737328][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.738362][ T4024] mmput (kernel/fork.c:1372) 
[ 95.739341][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.740330][ T4024] do_exit (kernel/exit.c:929) 
[ 95.741348][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.742466][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.743638][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.744792][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.746241][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.747668][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.748998][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.750208][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.751211][ T4024] EIP: 0x37fcf092
[ 95.752118][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.753630][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.755149][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.756783][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.759120][ T4024] BUG: Bad page map in process trinity-c6  pte:54e3f3a460cab63f pmd:1f530067
[   95.760365][ T4024] addr:00a20000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5fa
[   95.761614][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.763083][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.766213][ T4024] Tainted: [B]=BAD_PAGE
[   95.769700][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.771916][ T4024] Call Trace:
[ 95.772709][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.773770][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.774958][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.775943][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.776974][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.778123][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.779212][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.780364][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.781307][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.782375][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.783364][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.784558][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.785635][ T4024] mmput (kernel/fork.c:1372) 
[ 95.786572][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.787566][ T4024] do_exit (kernel/exit.c:929) 
[ 95.788507][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.789614][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.790810][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.791886][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.793119][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.794516][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.796788][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.797937][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.799047][ T4024] EIP: 0x37fcf092
[ 95.799970][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.801443][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.803001][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.804459][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.806978][ T4024] BUG: Bad page map in process trinity-c6  pte:c5f0dd6dc43e8dec pmd:1f530067
[   95.808979][ T4024] addr:00a21000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5fb
[   95.810930][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.813163][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.816065][ T4024] Tainted: [B]=BAD_PAGE
[   95.817100][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.819431][ T4024] Call Trace:
[ 95.820309][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.821382][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.822674][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.823644][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.824771][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.834364][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.835515][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.836596][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.837672][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.838825][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.839845][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.840992][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.842220][ T4024] mmput (kernel/fork.c:1372) 
[ 95.843187][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.844163][ T4024] do_exit (kernel/exit.c:929) 
[ 95.845112][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.846183][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.851067][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.851741][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.852541][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.853339][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.854086][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.854756][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.855442][ T4024] EIP: 0x37fcf092
[ 95.855924][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.856738][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.857472][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.858366][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.859343][ T4024] BUG: Bad page map in process trinity-c6  pte:e7ca5f0481dc4ab9 pmd:1f530067
[   95.860689][ T4024] addr:00a22000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5fc
[   95.862740][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.864976][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.868220][ T4024] Tainted: [B]=BAD_PAGE
[   95.869290][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.871692][ T4024] Call Trace:
[ 95.872603][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.873817][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.874971][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.875964][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.877068][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.878102][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.879260][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.880360][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.881319][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.882312][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.883316][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.884453][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.885439][ T4024] mmput (kernel/fork.c:1372) 
[ 95.886496][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.887547][ T4024] do_exit (kernel/exit.c:929) 
[ 95.888569][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.889704][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.890823][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.891896][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.893137][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.894580][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.895342][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.896082][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.897066][ T4024] EIP: 0x37fcf092
[ 95.897968][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.899480][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.900538][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.902192][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.904411][ T4024] BUG: Bad page map in process trinity-c6  pte:7ad84c810d06891 pmd:1f530067
[   95.906423][ T4024] addr:00a23000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5fd
[   95.908569][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.910834][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.914000][ T4024] Tainted: [B]=BAD_PAGE
[   95.915089][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.917323][ T4024] Call Trace:
[ 95.918201][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.919450][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.920718][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.921545][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.922660][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.923309][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.924013][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.924747][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.925378][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.926484][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.927273][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.928003][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.928585][ T4024] mmput (kernel/fork.c:1372) 
[ 95.929152][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.929755][ T4024] do_exit (kernel/exit.c:929) 
[ 95.930359][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.931411][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.932439][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.933468][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.934820][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.936114][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.937258][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.938466][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.939652][ T4024] EIP: 0x37fcf092
[ 95.940595][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.942153][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.943697][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.945278][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.949561][ T4024] BUG: Bad page map in process trinity-c6  pte:57334b6bdf67783b pmd:1f530067
[   95.952648][ T4024] addr:00a24000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5fe
[   95.955254][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.957408][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.964259][ T4024] Tainted: [B]=BAD_PAGE
[   95.964900][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.966319][ T4024] Call Trace:
[ 95.966874][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.967519][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 95.968264][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 95.968888][ T4024] print_bad_pte (mm/memory.c:543) 
[ 95.969561][ T4024] vm_normal_page (mm/memory.c:?) 
[ 95.970216][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 95.970947][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 95.971688][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 95.972318][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.972990][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 95.973635][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 95.974368][ T4024] __mmput (kernel/fork.c:1350) 
[ 95.974958][ T4024] mmput (kernel/fork.c:1372) 
[ 95.975382][ T4024] exit_mm (kernel/exit.c:571) 
[ 95.975970][ T4024] do_exit (kernel/exit.c:929) 
[ 95.976509][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 95.977042][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 95.977529][ T4024] get_signal (kernel/signal.c:3017) 
[ 95.977953][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 95.978521][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 95.979272][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 95.979943][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 95.980607][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   95.981250][ T4024] EIP: 0x37fcf092
[ 95.981802][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   95.982685][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   95.983631][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   95.984557][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   95.985691][ T4024] BUG: Bad page map in process trinity-c6  pte:70b0c4e461b71d8 pmd:1f530067
[   95.986935][ T4024] addr:00a25000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:5ff
[   95.988312][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   95.990535][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   95.993845][ T4024] Tainted: [B]=BAD_PAGE
[   95.994932][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   95.997203][ T4024] Call Trace:
[ 95.998114][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 95.999280][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.000556][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.001508][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.002697][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.003893][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.005091][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.006239][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.007417][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.008564][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.009678][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.010765][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.011827][ T4024] mmput (kernel/fork.c:1372) 
[ 96.012793][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.013818][ T4024] do_exit (kernel/exit.c:929) 
[ 96.014917][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.016166][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.025295][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.026376][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.027692][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.029007][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.030190][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.031371][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.032517][ T4024] EIP: 0x37fcf092
[ 96.033495][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.035099][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.036742][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.038380][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.042343][ T4024] get_swap_device: Bad swap file entry 6c52bb8b
[   96.043823][ T4024] BUG: Bad page map in process trinity-c6  pte:d08b969583e911bb pmd:1f530067
[   96.045671][ T4024] addr:00a27000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:601
[   96.047201][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.048664][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.052741][ T4024] Tainted: [B]=BAD_PAGE
[   96.053721][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.056085][ T4024] Call Trace:
[ 96.056948][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.058033][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.059176][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.059841][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.060567][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.061262][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.062004][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.062961][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.064133][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.065180][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.066150][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.067404][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.068494][ T4024] mmput (kernel/fork.c:1372) 
[ 96.069344][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.073045][ T4024] do_exit (kernel/exit.c:929) 
[ 96.074049][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.075184][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.076291][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.077348][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.078600][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.082386][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.083492][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.084633][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.085692][ T4024] EIP: 0x37fcf092
[ 96.086640][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.088125][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.089709][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.091281][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.095252][ T4024] get_swap_device: Bad swap file entry 09432806
[   96.096789][ T4024] BUG: Bad page map in process trinity-c6  pte:4ea967f8a25cec53 pmd:1f530067
[   96.098837][ T4024] addr:00a29000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:603
[   96.100863][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.103093][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.106348][ T4024] Tainted: [B]=BAD_PAGE
[   96.107380][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.109698][ T4024] Call Trace:
[ 96.110488][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.111159][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.111906][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.112551][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.113271][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.113977][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.114742][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.115517][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.116191][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.116899][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.117555][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.118298][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.118954][ T4024] mmput (kernel/fork.c:1372) 
[ 96.119572][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.120243][ T4024] do_exit (kernel/exit.c:929) 
[ 96.120889][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.121584][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.122242][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.122916][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.123723][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.124536][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.125288][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.126016][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.126692][ T4024] EIP: 0x37fcf092
[ 96.127277][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.128171][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.129166][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.130163][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.131350][ T4024] BUG: Bad page map in process trinity-c6  pte:406fe98596a8324f pmd:1f530067
[   96.132596][ T4024] addr:00a2a000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:604
[   96.136887][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.139044][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.142301][ T4024] Tainted: [B]=BAD_PAGE
[   96.143310][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.145625][ T4024] Call Trace:
[ 96.146466][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.147540][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.148733][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.149683][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.150786][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.151972][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.153082][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.154337][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.155380][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.156447][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.157514][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.158795][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.159871][ T4024] mmput (kernel/fork.c:1372) 
[ 96.160742][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.161801][ T4024] do_exit (kernel/exit.c:929) 
[ 96.162935][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.163979][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.165016][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.166123][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.167375][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.168684][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.169511][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.170627][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.174092][ T4024] EIP: 0x37fcf092
[ 96.176178][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.177660][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.179244][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.180753][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.183013][ T4024] BUG: Bad page map in process trinity-c6  pte:469447f27e761041 pmd:1f530067
[   96.184942][ T4024] addr:00a2c000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:606
[   96.187049][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.189217][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.192472][ T4024] Tainted: [B]=BAD_PAGE
[   96.193556][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.195519][ T4024] Call Trace:
[ 96.196015][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.196640][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.197405][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.198056][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.199114][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.200142][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.201385][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.202766][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.204239][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.205442][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.206860][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.208089][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.209031][ T4024] mmput (kernel/fork.c:1372) 
[ 96.210006][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.211009][ T4024] do_exit (kernel/exit.c:929) 
[ 96.212029][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.213014][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.214065][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.215079][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.216386][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.217645][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.218735][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.219877][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.220943][ T4024] EIP: 0x37fcf092
[ 96.221829][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.223257][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.224342][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.233237][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.235305][ T4024] get_swap_device: Bad swap file entry 53e98b87
[   96.236225][ T4024] BUG: Bad page map in process trinity-c6  pte:788ad0d483e23c3 pmd:1f530067
[   96.237417][ T4024] addr:00a2e000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:608
[   96.238694][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.240078][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.242145][ T4024] Tainted: [B]=BAD_PAGE
[   96.242783][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.244211][ T4024] Call Trace:
[ 96.244733][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.245393][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.246164][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.246800][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.247487][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.248162][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.248894][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.249640][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.250301][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.251018][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.251651][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.252404][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.253023][ T4024] mmput (kernel/fork.c:1372) 
[ 96.253602][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.254227][ T4024] do_exit (kernel/exit.c:929) 
[ 96.254862][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.255547][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.256223][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.256883][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.257671][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.258451][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.259181][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.259886][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.260592][ T4024] EIP: 0x37fcf092
[ 96.261191][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.262138][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.266933][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.267920][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.294695][ T4024] BUG: Bad page map in process trinity-c6  pte:dbf0f89af3974c05 pmd:1f530067
[   96.296046][ T4024] addr:00a2f000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:609
[   96.297352][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.298729][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.300779][ T4024] Tainted: [B]=BAD_PAGE
[   96.301431][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.302920][ T4024] Call Trace:
[ 96.303479][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.304183][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.304965][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.305595][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.306311][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.307030][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.307782][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.308572][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.309238][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.309931][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.310702][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.311443][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.312046][ T4024] mmput (kernel/fork.c:1372) 
[ 96.312641][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.313223][ T4024] do_exit (kernel/exit.c:929) 
[ 96.313828][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.314547][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.315252][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.315925][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.316761][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.317578][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.318333][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.319015][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.319691][ T4024] EIP: 0x37fcf092
[ 96.320287][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.321185][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.322097][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.323057][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.324888][ T4024] BUG: Bad page map in process trinity-c6  pte:e240eeaefa5a6708 pmd:1f530067
[   96.327235][ T4024] addr:00a30000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60a
[   96.329349][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.331328][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.335623][ T4024] Tainted: [B]=BAD_PAGE
[   96.336796][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.339226][ T4024] Call Trace:
[ 96.339786][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.340471][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.341234][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.341870][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.346584][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.347908][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.349399][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.350953][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.352206][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.353568][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.354863][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.356357][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.363282][ T4024] mmput (kernel/fork.c:1372) 
[ 96.364528][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.365902][ T4024] do_exit (kernel/exit.c:929) 
[ 96.367277][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.368401][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.369708][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.370712][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.372316][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.373909][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.375246][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.376578][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.378128][ T4024] EIP: 0x37fcf092
[ 96.379124][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.381111][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.382141][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.383791][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.386532][ T4024] BUG: Bad page map in process trinity-c6  pte:7dde8aba370f28df pmd:1f530067
[   96.387877][ T4024] addr:00a31000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60b
[   96.390598][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.393372][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.397762][ T4024] Tainted: [B]=BAD_PAGE
[   96.399206][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.402550][ T4024] Call Trace:
[ 96.403764][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.405186][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.406712][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.407937][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.409229][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.410567][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.412016][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.413776][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.415106][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.416514][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.417892][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.419636][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.420935][ T4024] mmput (kernel/fork.c:1372) 
[ 96.422254][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.423711][ T4024] do_exit (kernel/exit.c:929) 
[ 96.424881][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.426321][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.427856][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.429228][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.430607][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.431380][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.432072][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.432753][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.433378][ T4024] EIP: 0x37fcf092
[ 96.433940][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.442692][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.443757][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.445616][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.448552][ T4024] BUG: Bad page map in process trinity-c6  pte:cec24ec9bac61cad pmd:1f530067
[   96.450919][ T4024] addr:00a32000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60c
[   96.453557][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.455906][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.462705][ T4024] Tainted: [B]=BAD_PAGE
[   96.463358][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.464781][ T4024] Call Trace:
[ 96.465330][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.466020][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.467123][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.468490][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.470009][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.471503][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.473103][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.474700][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.476012][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.477336][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.478775][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.480400][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.481647][ T4024] mmput (kernel/fork.c:1372) 
[ 96.483013][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.484452][ T4024] do_exit (kernel/exit.c:929) 
[ 96.485820][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.487363][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.488928][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.490295][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.492050][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.494023][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.495722][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.497420][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.499091][ T4024] EIP: 0x37fcf092
[ 96.500245][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.502244][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.504359][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.506522][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.509607][ T4024] BUG: Bad page map in process trinity-c6  pte:5910b25135c2599a pmd:1f530067
[   96.512410][ T4024] addr:00a33000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60d
[   96.515265][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.518078][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.522364][ T4024] Tainted: [B]=BAD_PAGE
[   96.523726][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.526806][ T4024] Call Trace:
[ 96.527998][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.529519][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.531172][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.532598][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.534099][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.535525][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.537154][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.538952][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.540422][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.541843][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.543434][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.545267][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.546499][ T4024] mmput (kernel/fork.c:1372) 
[ 96.555874][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.557102][ T4024] do_exit (kernel/exit.c:929) 
[ 96.558335][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.559321][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.560023][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.560691][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.561489][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.562249][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.562990][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.563695][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.564379][ T4024] EIP: 0x37fcf092
[ 96.564940][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.565826][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.575046][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.577339][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.580974][ T4024] BUG: Bad page map in process trinity-c6  pte:38aa9459c8546a19 pmd:1f530067
[   96.582302][ T4024] addr:00a34000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60e
[   96.583677][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.585094][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.587236][ T4024] Tainted: [B]=BAD_PAGE
[   96.587889][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.589336][ T4024] Call Trace:
[ 96.589877][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.599116][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.599892][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.600536][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.601235][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.601921][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.602676][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.603458][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.604108][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.604812][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.605475][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.606237][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.606865][ T4024] mmput (kernel/fork.c:1372) 
[ 96.607455][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.608087][ T4024] do_exit (kernel/exit.c:929) 
[ 96.608727][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.609434][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.610134][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.610821][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.611622][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.612405][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.613128][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.613844][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.614552][ T4024] EIP: 0x37fcf092
[ 96.615151][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.616112][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.617110][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.618100][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.645022][ T4024] BUG: Bad page map in process trinity-c6  pte:f1f44d43776fb9bd pmd:1f530067
[   96.646442][ T4024] addr:00a35000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:60f
[   96.647864][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.650742][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.654932][ T4024] Tainted: [B]=BAD_PAGE
[   96.656080][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.666689][ T4024] Call Trace:
[ 96.667265][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.667926][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.668609][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.669167][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.669787][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.670442][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.671131][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.671875][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.672528][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.673219][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.673867][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.674609][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.675177][ T4024] mmput (kernel/fork.c:1372) 
[ 96.675715][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.676288][ T4024] do_exit (kernel/exit.c:929) 
[ 96.676889][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.677590][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.678232][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.678865][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.679629][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.680406][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.681126][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.681815][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.682498][ T4024] EIP: 0x37fcf092
[ 96.683043][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.683957][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.684923][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.685889][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.687088][ T4024] get_swap_device: Bad swap file entry 53662a22
[   96.687953][ T4024] BUG: Bad page map in process trinity-c6  pte:9072e97618d8c4c7 pmd:1f530067
[   96.689149][ T4024] addr:00a37000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:611
[   96.691426][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.694221][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.698805][ T4024] Tainted: [B]=BAD_PAGE
[   96.700180][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.703207][ T4024] Call Trace:
[ 96.704378][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.705830][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.707467][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.708772][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.710226][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.711814][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.713348][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.724471][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.726042][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.727690][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.729188][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.730796][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.732177][ T4024] mmput (kernel/fork.c:1372) 
[ 96.733608][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.734884][ T4024] do_exit (kernel/exit.c:929) 
[ 96.736352][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.738012][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.739602][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.741207][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.742826][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.744593][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.746271][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.747756][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.749157][ T4024] EIP: 0x37fcf092
[ 96.750453][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.754102][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.755310][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.757042][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.763405][ T4024] BUG: Bad page map in process trinity-c6  pte:17e4025aac58c653 pmd:1f530067
[   96.771990][ T4024] addr:00a38000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:612
[   96.773274][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.774799][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.779401][ T4024] Tainted: [B]=BAD_PAGE
[   96.780923][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.784163][ T4024] Call Trace:
[ 96.785475][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.786860][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.788701][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.789954][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.791372][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.792922][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.794553][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.796131][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.797422][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.798907][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.800473][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.802276][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.803755][ T4024] mmput (kernel/fork.c:1372) 
[ 96.805060][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.806394][ T4024] do_exit (kernel/exit.c:929) 
[ 96.807739][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.809187][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.810624][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.812049][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.813763][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.815557][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.816941][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.818530][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.820032][ T4024] EIP: 0x37fcf092
[ 96.821287][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.823335][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.825470][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.827738][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.830968][ T4024] BUG: Bad page map in process trinity-c6  pte:bf083a1ff8e53bc pmd:1f530067
[   96.833824][ T4024] addr:00a39000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:613
[   96.835108][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.838639][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.840693][ T4024] Tainted: [B]=BAD_PAGE
[   96.841352][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.842649][ T4024] Call Trace:
[ 96.843082][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.843595][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.844085][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.844502][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.844954][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.845397][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.845866][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.846354][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.846984][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.847702][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.848375][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.849141][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.849783][ T4024] mmput (kernel/fork.c:1372) 
[ 96.850397][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.850802][ T4024] do_exit (kernel/exit.c:929) 
[ 96.851200][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.851649][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.852087][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.852507][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.853028][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.853531][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.854000][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.854467][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.854901][ T4024] EIP: 0x37fcf092
[ 96.855286][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.855906][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.856507][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.857135][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.857888][ T4024] BUG: Bad page map in process trinity-c6  pte:d0ea4009463e9c3d pmd:1f530067
[   96.859718][ T4024] addr:00a3a000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:614
[   96.860952][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.862280][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.868472][ T4024] Tainted: [B]=BAD_PAGE
[   96.869126][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.870682][ T4024] Call Trace:
[ 96.871844][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.873453][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.874602][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.875262][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.875941][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.876637][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.877391][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.878176][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.878846][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.879512][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.880177][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.880906][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.881520][ T4024] mmput (kernel/fork.c:1372) 
[ 96.882114][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.882750][ T4024] do_exit (kernel/exit.c:929) 
[ 96.883370][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.884051][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.884725][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.885380][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.886179][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.915047][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.915774][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.916491][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.917178][ T4024] EIP: 0x37fcf092
[ 96.917758][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.918699][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.919693][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.920677][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.922683][ T4024] BUG: Bad page map in process trinity-c6  pte:219390657bab6321 pmd:1f530067
[   96.923976][ T4024] addr:00a3c000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:616
[   96.925242][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.926587][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.928651][ T4024] Tainted: [B]=BAD_PAGE
[   96.929293][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   96.950785][ T4024] Call Trace:
[ 96.951340][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 96.952012][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 96.952767][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 96.953367][ T4024] print_bad_pte (mm/memory.c:543) 
[ 96.954040][ T4024] vm_normal_page (mm/memory.c:?) 
[ 96.954630][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 96.955209][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 96.956258][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 96.957311][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.958308][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 96.959396][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 96.960677][ T4024] __mmput (kernel/fork.c:1350) 
[ 96.961715][ T4024] mmput (kernel/fork.c:1372) 
[ 96.962739][ T4024] exit_mm (kernel/exit.c:571) 
[ 96.963814][ T4024] do_exit (kernel/exit.c:929) 
[ 96.964831][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 96.965999][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 96.967109][ T4024] get_signal (kernel/signal.c:3017) 
[ 96.968314][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 96.976065][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 96.976877][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 96.977621][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 96.978329][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   96.979608][ T4024] EIP: 0x37fcf092
[ 96.980469][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   96.982033][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   96.984000][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   96.985497][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   96.989683][ T4024] BUG: Bad page map in process trinity-c6  pte:e28f11a4842121e3 pmd:1f530067
[   96.991679][ T4024] addr:00a3d000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:617
[   96.993599][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   96.996001][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   96.999382][ T4024] Tainted: [B]=BAD_PAGE
[   97.000438][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.002836][ T4024] Call Trace:
[ 97.003363][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.004055][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.004817][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.005442][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.006091][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.006779][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.007624][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.008363][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.009012][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.009717][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.010396][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.011144][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.011754][ T4024] mmput (kernel/fork.c:1372) 
[ 97.012346][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.012956][ T4024] do_exit (kernel/exit.c:929) 
[ 97.013583][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.014268][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.017263][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.017923][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.018732][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.019519][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.020195][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.020866][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.021525][ T4024] EIP: 0x37fcf092
[ 97.022085][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.022984][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.023894][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.024851][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.031672][ T4024] BUG: Bad page map in process trinity-c6  pte:1387120eb728cead pmd:1f530067
[   97.032979][ T4024] addr:00a3e000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:618
[   97.034272][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.036411][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.040291][ T4024] Tainted: [B]=BAD_PAGE
[   97.041228][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.043532][ T4024] Call Trace:
[ 97.044346][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.045427][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.046655][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.047643][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.048700][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.049795][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.050989][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.052232][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.053343][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.054484][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.055514][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.056653][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.057668][ T4024] mmput (kernel/fork.c:1372) 
[ 97.058555][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.059587][ T4024] do_exit (kernel/exit.c:929) 
[ 97.060660][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.061559][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.062706][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.063846][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.065047][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.066437][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.067566][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.068697][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.069873][ T4024] EIP: 0x37fcf092
[ 97.070788][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.072267][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.073871][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.075500][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.077358][ T4024] BUG: Bad page map in process trinity-c6  pte:ec7f99cb808e70d5 pmd:1f530067
[   97.079503][ T4024] addr:00a3f000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:619
[   97.081777][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.084045][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.087355][ T4024] Tainted: [B]=BAD_PAGE
[   97.088328][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.090641][ T4024] Call Trace:
[ 97.091609][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.092707][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.094109][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.095218][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.096302][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.097362][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.098615][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.099804][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.100793][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.101967][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.103063][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.104193][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.105266][ T4024] mmput (kernel/fork.c:1372) 
[ 97.106171][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.107156][ T4024] do_exit (kernel/exit.c:929) 
[ 97.108165][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.109282][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.110343][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.111385][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.112629][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.113938][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.115205][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.116355][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.117400][ T4024] EIP: 0x37fcf092
[ 97.118423][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.127100][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.128091][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.129069][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.137192][ T4024] BUG: Bad page map in process trinity-c6  pte:9e83fbbb61682bfc pmd:1f530067
[   97.138480][ T4024] addr:00a40000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:61a
[   97.139694][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.141013][ T4024] CPU: 1 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.142474][ T4024] Tainted: [B]=BAD_PAGE
[   97.143083][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.144347][ T4024] Call Trace:
[ 97.144781][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.145340][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.145956][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.146476][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.147040][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.147595][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.148193][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.148813][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.149339][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.149905][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.150449][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.151057][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.151559][ T4024] mmput (kernel/fork.c:1372) 
[ 97.152043][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.152542][ T4024] do_exit (kernel/exit.c:929) 
[ 97.153065][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.153607][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.154134][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.154659][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.155318][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.155958][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.156545][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.157118][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.157664][ T4024] EIP: 0x37fcf092
[ 97.158133][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.158887][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.159673][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.160457][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.178558][ T4024] get_swap_device: Bad swap file entry 311f6e2d
[   97.180065][ T4024] BUG: Bad page map in process trinity-c6  pte:b3a2a1de8f1acb80 pmd:1f530067
[   97.186043][ T4024] addr:00a42000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:61c
[   97.188200][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.190477][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.193816][ T4024] Tainted: [B]=BAD_PAGE
[   97.194961][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.197279][ T4024] Call Trace:
[ 97.198193][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.199345][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.200366][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.201379][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.202385][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.203556][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.204748][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.205956][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.207094][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.208162][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.209242][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.210431][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.211401][ T4024] mmput (kernel/fork.c:1372) 
[ 97.212416][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.213546][ T4024] do_exit (kernel/exit.c:929) 
[ 97.214666][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.215851][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.216895][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.217894][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.219231][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.220488][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.221715][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.222871][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.224028][ T4024] EIP: 0x37fcf092
[ 97.225030][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.226621][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.228279][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.229800][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.232421][ T4024] get_swap_device: Bad swap file entry 63116667
[   97.233833][ T4024] get_swap_device: Bad swap file entry 25336ce6
[   97.235289][ T4024] BUG: Bad page map in process trinity-c6  pte:8d66ad0d030a5a4d pmd:1f530067
[   97.237287][ T4024] addr:00a45000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:61f
[   97.239410][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.241633][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.245113][ T4024] Tainted: [B]=BAD_PAGE
[   97.246234][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.249020][ T4024] Call Trace:
[ 97.250063][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.251472][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.252948][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.254154][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.255505][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.256792][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.258266][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.267079][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.267742][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.268415][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.269049][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.269815][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.270448][ T4024] mmput (kernel/fork.c:1372) 
[ 97.271023][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.271618][ T4024] do_exit (kernel/exit.c:929) 
[ 97.272225][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.272888][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.273528][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.274159][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.274931][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.275697][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.276421][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.277110][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.277779][ T4024] EIP: 0x37fcf092
[ 97.278361][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.279206][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.279999][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.280795][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.287519][ T4024] BUG: Bad page map in process trinity-c6  pte:330abe21571c8079 pmd:1f530067
[   97.288865][ T4024] addr:00a46000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:620
[   97.290099][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.292496][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.296581][ T4024] Tainted: [B]=BAD_PAGE
[   97.297956][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.300956][ T4024] Call Trace:
[ 97.302106][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.303609][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.305287][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.306403][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.307900][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.309491][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.311192][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.312915][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.314024][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.315635][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.316907][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.318615][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.320126][ T4024] mmput (kernel/fork.c:1372) 
[ 97.321532][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.322752][ T4024] do_exit (kernel/exit.c:929) 
[ 97.323967][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.325618][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.327099][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.328603][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.330314][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.332136][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.333754][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.335214][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.336537][ T4024] EIP: 0x37fcf092
[ 97.337703][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.339718][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.341960][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.343660][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.346439][ T4024] BUG: Bad page map in process trinity-c6  pte:ce7cdbf0b7113dee pmd:1f530067
[   97.352916][ T4024] addr:00a47000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:621
[   97.355292][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.357425][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.360142][ T4024] Tainted: [B]=BAD_PAGE
[   97.360775][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.362226][ T4024] Call Trace:
[ 97.370902][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.371617][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.372396][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.373045][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.373750][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.374441][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.375176][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.375935][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.376579][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.377267][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.377927][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.378677][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.379316][ T4024] mmput (kernel/fork.c:1372) 
[ 97.379896][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.380505][ T4024] do_exit (kernel/exit.c:929) 
[ 97.381167][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.381859][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.382547][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.383205][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.384007][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.384785][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.385516][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.386327][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.387029][ T4024] EIP: 0x37fcf092
[ 97.387591][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.388518][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.389519][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.390530][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.395816][ T4024] BUG: Bad page map in process trinity-c6  pte:9a839f4c3a67a30d pmd:1f530067
[   97.397075][ T4024] addr:00a48000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:622
[   97.398345][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.401601][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.406748][ T4024] Tainted: [B]=BAD_PAGE
[   97.408308][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.421079][ T4024] Call Trace:
[ 97.421636][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.422401][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.424234][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.425628][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.427122][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.428742][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.430385][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.432287][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.433627][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.435271][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.436640][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.438239][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.439626][ T4024] mmput (kernel/fork.c:1372) 
[ 97.440793][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.442072][ T4024] do_exit (kernel/exit.c:929) 
[ 97.443143][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.444165][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.445473][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.446715][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.448133][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.449745][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.450779][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.451551][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.452443][ T4024] EIP: 0x37fcf092
[ 97.453151][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.454201][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.455327][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.456500][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.459689][ T4024] BUG: Bad page map in process trinity-c6  pte:b494033b069d8ef9 pmd:1f530067
[   97.462271][ T4024] addr:00a49000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:623
[   97.466033][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.471847][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.476365][ T4024] Tainted: [B]=BAD_PAGE
[   97.477855][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.480930][ T4024] Call Trace:
[ 97.482167][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.483746][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.485226][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.486525][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.487936][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.489347][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.490968][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.492532][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.493896][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.495294][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.496701][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.497469][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.498106][ T4024] mmput (kernel/fork.c:1372) 
[ 97.498676][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.499302][ T4024] do_exit (kernel/exit.c:929) 
[ 97.499942][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.500611][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.501285][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.501921][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.502696][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.503470][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.504198][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.504890][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.505579][ T4024] EIP: 0x37fcf092
[ 97.506153][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.507032][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.507970][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.508936][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.510140][ T4024] BUG: Bad page map in process trinity-c6  pte:5dd8156fa40bb083 pmd:1f530067
[   97.511386][ T4024] addr:00a4a000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:624
[   97.515720][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.517159][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.520826][ T4024] Tainted: [B]=BAD_PAGE
[   97.522130][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.523731][ T4024] Call Trace:
[ 97.524277][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.524960][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.525719][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.526349][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.527938][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.529450][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.530998][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.532486][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.533776][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.535195][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.536554][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.538250][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.539627][ T4024] mmput (kernel/fork.c:1372) 
[ 97.540691][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.542122][ T4024] do_exit (kernel/exit.c:929) 
[ 97.543589][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.544984][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.546586][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.547355][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.548193][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.548990][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.549766][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.550532][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.551021][ T4024] EIP: 0x37fcf092
[ 97.551404][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.552012][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.552643][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.553305][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.556303][ T4024] BUG: Bad page map in process trinity-c6  pte:d11291c44315e953 pmd:1f530067
[   97.558228][ T4024] addr:00a4b000 vm_flags:00100073 anon_vma:b81f25b0 mapping:4938c160 index:625
[   97.567430][ T4024] file:trinity fault:filemap_fault mmap:generic_file_mmap read_folio:simple_read_folio
[   97.568876][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.571043][ T4024] Tainted: [B]=BAD_PAGE
[   97.572191][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   97.574638][ T4024] Call Trace:
[ 97.575532][ T4024] dump_stack_lvl (lib/dump_stack.c:122) 
[ 97.576678][ T4024] ? simple_write_begin (fs/libfs.c:911) 
[ 97.577929][ T4024] dump_stack (lib/dump_stack.c:129) 
[ 97.579114][ T4024] print_bad_pte (mm/memory.c:543) 
[ 97.580310][ T4024] vm_normal_page (mm/memory.c:?) 
[ 97.581460][ T4024] unmap_page_range (mm/memory.c:1555) 
[ 97.582729][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.584033][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.585103][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.586302][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.587468][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.588783][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.589894][ T4024] mmput (kernel/fork.c:1372) 
[ 97.590878][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.591948][ T4024] do_exit (kernel/exit.c:929) 
[ 97.592890][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.594151][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.595334][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.596383][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.597805][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.599117][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.600375][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.601531][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.602776][ T4024] EIP: 0x37fcf092
[ 97.603731][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.605238][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.606943][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.608576][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.612823][ T4024] get_swap_device: Bad swap file entry 1e53f3a3
[   97.614396][ T4024] get_swap_device: Bad swap file entry 4c765cb6
[   97.616222][ T4024] get_swap_device: Bad swap file entry 0e2a9622
[   97.617573][ T4024] get_swap_device: Bad swap file entry 37d6b1a5
[   97.619146][ T4024] get_swap_device: Bad swap file entry 00562db3
[   97.620851][ T4024] get_swap_device: Bad swap file entry 34fe9c56
[   97.622353][ T4024] get_swap_device: Bad swap file entry 307f198e
[   97.624168][ T4024] get_swap_device: Bad swap file entry 47792368
[   97.625591][ T4024] get_swap_device: Bad swap file entry 51331882
[   97.627158][ T4024] get_swap_device: Bad swap file entry 49a2d48a
[   97.629793][ T4024] get_swap_device: Bad swap file entry 243365c3
[   97.631323][ T4024] get_swap_device: Bad swap file entry 5fa5af83
[   97.633018][ T4024] get_swap_device: Bad swap file entry 4dffefc5
[   97.634619][ T4024] get_swap_device: Bad swap file entry 1248a803
[   97.636366][ T4024] get_swap_device: Bad swap file entry 0758352f
[   97.637764][ T4024] get_swap_device: Bad swap file entry 352aa006
[   97.639289][ T4024] get_swap_device: Bad swap file entry 583f032f
[   97.641054][ T4024] get_swap_device: Bad swap file entry 3525e734
[   97.642481][ T4024] ------------[ cut here ]------------
[   97.643861][ T4024] kernel BUG at include/linux/swapops.h:530!
[   97.645126][ T4024] Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
[   97.646619][ T4024] CPU: 0 UID: 65534 PID: 4024 Comm: trinity-c6 Tainted: G    B              6.13.0-rc5-00776-g911eebb2aa66 #1 06a77fa131bcb2425f49a60f3f56a3209eb16abf
[   97.655082][ T4024] Tainted: [B]=BAD_PAGE
[   97.655719][ T4024] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 97.656826][ T4024] EIP: unmap_page_range (include/linux/swapops.h:530) 
[ 97.657555][ T4024] Code: 97 ab 42 e8 74 4b ff ff 0f 0b b8 e8 ed ff 42 e8 f8 c3 6c 00 ba 83 97 ab 42 e8 5e 4b ff ff 0f 0b b8 e8 ed ff 42 e8 e2 c3 6c 00 <0f> 0b b8 38 ed ff 42 e8 d6 c3 6c 00 ba 83 97 ab 42 e8 3c 4b ff ff
All code
========
   0:	97                   	xchg   %eax,%edi
   1:	ab                   	stos   %eax,%es:(%rdi)
   2:	42 e8 74 4b ff ff    	rex.X call 0xffffffffffff4b7c
   8:	0f 0b                	ud2
   a:	b8 e8 ed ff 42       	mov    $0x42ffede8,%eax
   f:	e8 f8 c3 6c 00       	call   0x6cc40c
  14:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  19:	e8 5e 4b ff ff       	call   0xffffffffffff4b7c
  1e:	0f 0b                	ud2
  20:	b8 e8 ed ff 42       	mov    $0x42ffede8,%eax
  25:	e8 e2 c3 6c 00       	call   0x6cc40c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 ed ff 42       	mov    $0x42ffed38,%eax
  31:	e8 d6 c3 6c 00       	call   0x6cc40c
  36:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  3b:	e8 3c 4b ff ff       	call   0xffffffffffff4b7c

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 ed ff 42       	mov    $0x42ffed38,%eax
   7:	e8 d6 c3 6c 00       	call   0x6cc3e2
   c:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  11:	e8 3c 4b ff ff       	call   0xffffffffffff4b52
[   97.659976][ T4024] EAX: edf2a7e0 EBX: 00a94000 ECX: 04800000 EDX: 5f5304a0
[   97.660979][ T4024] ESI: e0000000 EDI: 00000001 EBP: b4411d58 ESP: b4411cc8
[   97.661965][ T4024] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[   97.667034][ T4024] CR0: 80050033 CR2: 371a9010 CR3: 1e64c000 CR4: 000406f0
[   97.668057][ T4024] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   97.669045][ T4024] DR6: fffe0ff0 DR7: 00000400
[   97.669751][ T4024] Call Trace:
[ 97.670312][ T4024] ? __die_body (arch/x86/kernel/dumpstack.c:478 arch/x86/kernel/dumpstack.c:420) 
[ 97.671006][ T4024] ? die (arch/x86/kernel/dumpstack.c:? arch/x86/kernel/dumpstack.c:447) 
[ 97.671606][ T4024] ? do_trap (arch/x86/kernel/traps.c:? arch/x86/kernel/traps.c:197) 
[ 97.672244][ T4024] ? do_error_trap (arch/x86/kernel/traps.c:217) 
[ 97.672975][ T4024] ? unmap_page_range (include/linux/swapops.h:530) 
[ 97.673761][ T4024] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 97.674468][ T4024] ? handle_invalid_op (arch/x86/kernel/traps.c:254) 
[ 97.675204][ T4024] ? unmap_page_range (include/linux/swapops.h:530) 
[ 97.675953][ T4024] ? exc_invalid_op (arch/x86/kernel/traps.c:316) 
[ 97.676668][ T4024] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
[ 97.677432][ T4024] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 97.678113][ T4024] ? unmap_page_range (include/linux/swapops.h:530) 
[ 97.678899][ T4024] ? exc_overflow (arch/x86/kernel/traps.c:301) 
[ 97.679610][ T4024] ? unmap_page_range (include/linux/swapops.h:530) 
[ 97.680376][ T4024] ? tcp_sendmsg_locked (include/net/tcp.h:2048 include/net/tcp.h:2053 net/ipv4/tcp.c:1348) 
[ 97.681147][ T4024] unmap_vmas (mm/memory.c:1870) 
[ 97.681806][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.682522][ T4024] exit_mmap (mm/mmap.c:1668) 
[ 97.683204][ T4024] ? uprobe_clear_state (kernel/events/uprobes.c:1775) 
[ 97.683964][ T4024] __mmput (kernel/fork.c:1350) 
[ 97.684618][ T4024] mmput (kernel/fork.c:1372) 
[ 97.685235][ T4024] exit_mm (kernel/exit.c:571) 
[ 97.685880][ T4024] do_exit (kernel/exit.c:929) 
[ 97.686560][ T4024] ? lock_release (include/trace/events/lock.h:69) 
[ 97.687284][ T4024] do_group_exit (kernel/exit.c:1075) 
[ 97.687981][ T4024] get_signal (kernel/signal.c:3017) 
[ 97.688672][ T4024] arch_do_signal_or_restart (arch/x86/kernel/signal.c:?) 
[ 97.689503][ T4024] syscall_exit_to_user_mode (kernel/entry/common.c:? include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 97.690323][ T4024] do_int80_syscall_32 (arch/x86/entry/common.c:343) 
[ 97.691104][ T4024] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 97.691829][ T4024] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   97.692543][ T4024] EIP: 0x37fcf092
[ 97.693136][ T4024] Code: Unable to access opcode bytes at 0x37fcf068.

Code starting with the faulting instruction
===========================================
[   97.694117][ T4024] EAX: fffffe00 EBX: 0000013d ECX: 00fa2940 EDX: 00000006
[   97.695119][ T4024] ESI: 04000000 EDI: ffffffff EBP: 4ea868a9 ESP: 3f8e5ec8
[   97.696089][ T4024] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS: 00000216
[   97.697244][ T4024] Modules linked in: af_alg caif_socket caif crc_ccitt phonet can_raw can pppoe pppox ppp_generic slhc llc2 x25 appletalk psnap llc ax25 rtc_cmos ipmi_devintf ipmi_msghandler evdev qemu_fw_cfg autofs4 aesni_intel crypto_simd cryptd
[   97.700375][ T4024] ---[ end trace 0000000000000000 ]---
[ 97.701155][ T4024] EIP: unmap_page_range (include/linux/swapops.h:530) 
[ 97.701931][ T4024] Code: 97 ab 42 e8 74 4b ff ff 0f 0b b8 e8 ed ff 42 e8 f8 c3 6c 00 ba 83 97 ab 42 e8 5e 4b ff ff 0f 0b b8 e8 ed ff 42 e8 e2 c3 6c 00 <0f> 0b b8 38 ed ff 42 e8 d6 c3 6c 00 ba 83 97 ab 42 e8 3c 4b ff ff
All code
========
   0:	97                   	xchg   %eax,%edi
   1:	ab                   	stos   %eax,%es:(%rdi)
   2:	42 e8 74 4b ff ff    	rex.X call 0xffffffffffff4b7c
   8:	0f 0b                	ud2
   a:	b8 e8 ed ff 42       	mov    $0x42ffede8,%eax
   f:	e8 f8 c3 6c 00       	call   0x6cc40c
  14:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  19:	e8 5e 4b ff ff       	call   0xffffffffffff4b7c
  1e:	0f 0b                	ud2
  20:	b8 e8 ed ff 42       	mov    $0x42ffede8,%eax
  25:	e8 e2 c3 6c 00       	call   0x6cc40c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 ed ff 42       	mov    $0x42ffed38,%eax
  31:	e8 d6 c3 6c 00       	call   0x6cc40c
  36:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  3b:	e8 3c 4b ff ff       	call   0xffffffffffff4b7c

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 ed ff 42       	mov    $0x42ffed38,%eax
   7:	e8 d6 c3 6c 00       	call   0x6cc3e2
   c:	ba 83 97 ab 42       	mov    $0x42ab9783,%edx
  11:	e8 3c 4b ff ff       	call   0xffffffffffff4b52


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250124/202501241641.e28ad67c-lkp@intel.com


[1]
ec4cfe91670fd6f7 911eebb2aa66acbd57703fd3eed
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :300         11%          33:253   dmesg.BUG:Bad_page_map_in_process
           :300          7%          21:253   dmesg.BUG:Bad_page_state_in_process
           :300         18%          53:253   dmesg.BUG:Bad_rss-counter_state_mm:#type:MM_ANONPAGES_val
           :300         12%          36:253   dmesg.BUG:Bad_rss-counter_state_mm:#type:MM_FILEPAGES_val
           :300         11%          33:253   dmesg.BUG:Bad_rss-counter_state_mm:#type:MM_SHMEMPAGES_val
           :300         15%          46:253   dmesg.BUG:Bad_rss-counter_state_mm:#type:MM_SWAPENTS_val
           :300         31%          94:253   dmesg.BUG:kernel_NULL_pointer_dereference,address
           :300          6%          18:253   dmesg.BUG:kernel_reboot-without-warning_in_test_stage
           :300          1%           3:253   dmesg.BUG:non-zero_pgtables_bytes_on_freeing_mm
           :300         21%          62:253   dmesg.BUG:unable_to_handle_page_fault_for_address
           :300          5%          14:253   dmesg.Bad_pagetable
           :300          0%           1:253   dmesg.EIP:__clear_user
           :300          2%           6:253   dmesg.EIP:__copy_user_ll
           :300          0%           1:253   dmesg.EIP:__do_wait
           :300          0%           1:253   dmesg.EIP:__enqueue_entity
           :300          0%           1:253   dmesg.EIP:__fget_files
           :300          0%           1:253   dmesg.EIP:__folio_rmap_sanity_checks
           :300          0%           1:253   dmesg.EIP:__ia32_sys_mprotect
           :300          0%           1:253   dmesg.EIP:__ia32_sys_open_by_handle_at
           :300          0%           1:253   dmesg.EIP:__ip_make_skb
           :300          0%           1:253   dmesg.EIP:__is_module_percpu_address
           :300          1%           2:253   dmesg.EIP:__kmalloc_cache_noprof
           :300          1%           2:253   dmesg.EIP:__list_add_valid_or_report
           :300          0%           1:253   dmesg.EIP:__list_del_entry_valid_or_report
           :300          2%           6:253   dmesg.EIP:__lock_acquire
           :300          3%           9:253   dmesg.EIP:__mutex_lock_common
           :300          1%           4:253   dmesg.EIP:__netif_receive_skb_core
           :300          0%           1:253   dmesg.EIP:__perf_event_task_sched_in
           :300          0%           1:253   dmesg.EIP:__put_user_4
           :300          2%           7:253   dmesg.EIP:__rb_erase_color
           :300          5%          14:253   dmesg.EIP:__rb_insert_augmented
           :300          1%           2:253   dmesg.EIP:__swap_duplicate
           :300          0%           1:253   dmesg.EIP:__task_pid_nr_ns
           :300          5%          15:253   dmesg.EIP:__wake_up_common_lock
           :300          0%           1:253   dmesg.EIP:__wake_up_locked_key
           :300          1%           2:253   dmesg.EIP:anon_vma_interval_tree_insert
           :300          0%           1:253   dmesg.EIP:anon_vma_interval_tree_remove
           :300          0%           1:253   dmesg.EIP:asm_exc_page_fault
           :300          0%           1:253   dmesg.EIP:copy_fpstate_to_sigframe
           :300          0%           1:253   dmesg.EIP:dnotify_flush
           :300          1%           2:253   dmesg.EIP:do_user_addr_fault
           :300          1%           2:253   dmesg.EIP:down_write
           :300          1%           2:253   dmesg.EIP:dump_pagetable
           :300          1%           2:253   dmesg.EIP:entry_INT80_32
           :300          0%           1:253   dmesg.EIP:event_sched_in
           :300          0%           1:253   dmesg.EIP:exc_page_fault
           :300          1%           4:253   dmesg.EIP:exit_itimers
           :300          0%           1:253   dmesg.EIP:fd_install
           :300          0%           1:253   dmesg.EIP:fdget
           :300          1%           2:253   dmesg.EIP:fdget_pos
           :300          4%          11:253   dmesg.EIP:filemap_unaccount_folio
           :300          8%          23:253   dmesg.EIP:filp_close
           :300          0%           1:253   dmesg.EIP:follow_pfnmap_start
           :300          1%           2:253   dmesg.EIP:free_large_kmalloc
           :300          0%           1:253   dmesg.EIP:free_pipe_info
           :300          0%           1:253   dmesg.EIP:fsnotify_put_mark
           :300          0%           1:253   dmesg.EIP:fsnotify_recalc_mask
           :300          0%           1:253   dmesg.EIP:get_data
           :300          0%           1:253   dmesg.EIP:handle_exception
           :300          0%           1:253   dmesg.EIP:kfree
           :300          0%           1:253   dmesg.EIP:kmem_cache_alloc_noprof
           :300          0%           1:253   dmesg.EIP:local_clock_noinstr
           :300          0%           1:253   dmesg.EIP:mas_ascend
           :300          0%           1:253   dmesg.EIP:mas_start
           :300          0%           1:253   dmesg.EIP:memcpy
           :300          0%           1:253   dmesg.EIP:migration_entry_wait_on_locked
           :300          0%           1:253   dmesg.EIP:move_vma
           :300          0%           1:253   dmesg.EIP:mutex_optimistic_spin
           :300          1%           2:253   dmesg.EIP:nmi_uaccess_okay
           :300          0%           1:253   dmesg.EIP:path_init
           :300          0%           1:253   dmesg.EIP:perf_event_mmap
           :300          3%           8:253   dmesg.EIP:perf_iterate_sb
           :300          3%           8:253   dmesg.EIP:print_modules
           :300          0%           1:253   dmesg.EIP:put_dec_trunc8
           :300          0%           1:253   dmesg.EIP:pvclock_clocksource_read_nowd
           :300          1%           2:253   dmesg.EIP:rb_insert_color
           :300          1%           2:253   dmesg.EIP:refcount_warn_saturate
           :300          0%           1:253   dmesg.EIP:release_sock
           :300          1%           4:253   dmesg.EIP:restore_all_switch_stack
           :300          0%           1:253   dmesg.EIP:rwsem_down_write_slowpath
           :300          0%           1:253   dmesg.EIP:sock_common_setsockopt
           :300          0%           1:253   dmesg.EIP:stack_depot_save_flags
           :300          3%           8:253   dmesg.EIP:switch_mm_irqs_off
           :300          0%           1:253   dmesg.EIP:symbol_string
           :300          5%          14:253   dmesg.EIP:unlink_anon_vmas
           :300          2%           6:253   dmesg.EIP:unmap_page_range
           :300          0%           1:253   dmesg.EIP:up_write
           :300          0%           1:253   dmesg.EIP:visit_groups_merge
           :300          1%           2:253   dmesg.EIP:vma_interval_tree_insert
           :300          1%           2:253   dmesg.EIP:vma_interval_tree_remove
           :300          0%           1:253   dmesg.EIP:zap_huge_pmd
           :300          5%          14:253   dmesg.INFO:trying_to_register_non-static_key
           :300         54%         162:253   dmesg.Kernel_panic-not_syncing:Fatal_exception
           :300          5%          16:253   dmesg.Kernel_panic-not_syncing:Fatal_exception_in_interrupt
           :300         47%         140:253   dmesg.Oops
           :300          5%          14:253   dmesg.Oops:double_fault:#[##]PREEMPT_SMP_PTI
           :300          1%           2:253   dmesg.Oops:general_protection_fault,maybe_for_address#:#[##]PREEMPT_SMP_PTI
           :300          7%          20:253   dmesg.Oops:invalid_opcode:#[##]PREEMPT_SMP_PTI
           :300          5%          14:253   dmesg.PANIC:double_fault
           :300          1%           3:253   dmesg.WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault
           :300          1%           2:253   dmesg.WARNING:at_arch/x86/mm/tlb.c:#nmi_uaccess_okay
           :300          0%           1:253   dmesg.WARNING:at_arch/x86/mm/tlb.c:#switch_mm_irqs_off
           :300          0%           1:253   dmesg.WARNING:at_include/linux/rmap.h:#__folio_rmap_sanity_checks
           :300          1%           2:253   dmesg.WARNING:at_kernel/locking/lockdep.c:#__lock_acquire
           :300          3%           9:253   dmesg.WARNING:at_kernel/locking/mutex.c:#__mutex_lock_common
           :300          0%           1:253   dmesg.WARNING:at_kernel/locking/rwsem.c:#up_write
           :300          1%           4:253   dmesg.WARNING:at_kernel/time/posix-timers.c:#exit_itimers
           :300          1%           2:253   dmesg.WARNING:at_lib/refcount.c:#refcount_warn_saturate
           :300          0%           1:253   dmesg.WARNING:at_mm/memory.c:#unmap_page_range
           :300          0%           1:253   dmesg.WARNING:at_mm/rmap.c:#unlink_anon_vmas
           :300          1%           2:253   dmesg.WARNING:at_mm/slub.c:#free_large_kmalloc
           :300          0%           1:253   dmesg.WARNING:possible_circular_locking_dependency_detected
           :300          0%           1:253   dmesg.WARNING:possible_circular_locking_dependency_detected_trinity-c6_is_trying_to_acquire_lock:at:console_lock_spinning_enable_but_task_is_already_holding_lock:at:perf_remove_from_context
           :300          2%           5:253   dmesg.WARNING:stack_recursion
           :300          1%           2:253   dmesg.addition_on#;use-after-free
           :300          0%           1:253   dmesg.kernel_BUG_at_fs/file.c
           :300          1%           2:253   dmesg.kernel_BUG_at_include/linux/mm.h
           :300          1%           2:253   dmesg.kernel_BUG_at_include/linux/swapops.h
           :300          1%           3:253   dmesg.kernel_BUG_at_lib/list_debug.c
           :300          4%          11:253   dmesg.kernel_BUG_at_mm/filemap.c
           :300          0%           1:253   dmesg.kernel_BUG_at_mm/huge_memory.c
           :300          0%           1:253   dmesg.refcount_t:underflow;use-after-free
           :300          0%           1:253   dmesg.saturated;leaking_memory



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

