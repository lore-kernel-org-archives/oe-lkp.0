Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5A1A8F8B
	for <oe-lkp@lists.linux.dev>; Thu,  5 Dec 2024 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383666; cv=fail; b=sPCzgdytdbdarcTpG23+hmSADLVRTPkwiiAL3uO/H3o4xTv1zvDrfwg24xPTRQusYtyxPR62W2SfQM+WvZytAJte9TAPSCgPLHeIGr1scWZv6CQiBfJoCR3PuSMfchIZz3OYxwDo/sSKt1VsYVLAOxlGxq5Sql8JPfQFIH150H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383666; c=relaxed/simple;
	bh=/XXHHOHJpxcKQGr13qyQfBsdTuYddmo7mIMpBv5l98U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VpRCrL0MRaC3hEE/YzJwXKoctvTkPGJnyqegTZPpYD185zwDNebiewF2YENzJyV+AVHToLdY2VBVuNYgKPvCoaOZPi+nLnDCzKb8uF6uozzi59Rw1kZFNgAzi30LNZuJmxHWENDIWz9iao+rGO3X/rHhm/K4qzN9DT1fkLQRDnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjxG0Yio; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjxG0Yio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733383664; x=1764919664;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/XXHHOHJpxcKQGr13qyQfBsdTuYddmo7mIMpBv5l98U=;
  b=hjxG0Yio7XKB/lbYREnbrVCQvlh6974d4gbD6e6KN0Fo/MCGkbEyqZOf
   Po94GY/8qQhrFcUVSmO5gQHhbB5x+f2v5V/yA8f2YeCg46clB/QrvkGa7
   sDeZdFPjBkzsXMqeFY/WKbG42q+KLiGuD7LYMRGjKKOfqeO0ln47bmExW
   AwPhd5AD2DxmMlY6rhNQFLxHcKFIz8M5AXEpo31TDdjzXqgwT4gz1OMqI
   xPo6t6/1hZkuHHjaBx6a2Ad5Gb3rPuECZ6056q6MAdoiVsXdO7ZKC5KFQ
   LJcczQEaYXsOG0xhw6OSCdthbdIRuZUHzbhiMmYOouHRl6z2dVPvn3QOB
   g==;
X-CSE-ConnectionGUID: SDyJChQ4ST+Yv//PYzZMRg==
X-CSE-MsgGUID: Mv4sxoeJQwKxEgq9Tjxq3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33562043"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33562043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:27:44 -0800
X-CSE-ConnectionGUID: eVM9rBi7QbWdATKausdE8A==
X-CSE-MsgGUID: b0KdcUjuT0ChNN8bA7LtGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93851721"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 23:27:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:27:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 23:27:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 23:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzPwMD2527mtjsK3RcB2zvvuvsQqNTAocHvHkLbGK6UOIopJCR5qR3jaYTI/RP+wnpY9qjNQ/Qf03OhhPiFCdzMh89Cf5jd2T+b2MxnXlFsaS/JyznU0ek+/gjT/fD4z+6StZ60pP3v+MqypesXZBuLJ/9kbdWxnqUK+71vllLdQTtAVdJXTGVBCdOZoaBm8EK+3tUEsDjaQfo7ZmB256yX3gbeE7bB4G0yAyjdXWypCBByq9fWgzQLsroUPdnsJNEJJNWLnyc9Y/WxyeND43i/0fRAdqOBi+YP3PFMTaxn0Zxub4odvkIVFsVMEkVHnV9DxpiYSruuDBXotMoZOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc+afOY0CCOlQvR/YLtSoaFJTUVoIDBBi5Ofqb30rXA=;
 b=G928/jAz49I4aqmmYyekBKR1/HGpTU3vccTWTR3j+6TkJlQpDDa4pe2t/JeGKHW4pOaNR5TJpZlA+iEHDNIgmd6+6vnlGsdjOeURznkObQsM+GeBKynyY1LIn3IgzD0WkRSfF1Nn03Dhco1JhTWPFRzKgChirW5xsiF/8G6qLO13ilmvpw5qos2bhf6bD5lPD9+Wj6JldudT8tZuMy30PxG/XJoh3zps5ZRJeR2JJa0uxLjC6u4nT+BhKffrtqlsEn9Bo9+7UEq3eHkZXNEx7APHaowFeijnwranjxquT5Pf8ASvdExWxySn7q14ObGdDy8fodtycbL00JUYNnDnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Thu, 5 Dec
 2024 07:27:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 07:27:40 +0000
Date: Thu, 5 Dec 2024 15:27:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Chuck Lever III <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dfdd37-02d8-4b61-010a-08dd14fe4cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVpuNnZVdHpaZFcvYkt5WWVNNm5DYUc1L09XNmJiVm5ta2hmMzc4L2lRMUlD?=
 =?utf-8?B?OHNLdTl3V2VXN3psTEU2OHBtSEF2NUlZcTVVNVErYXVaZm80YVJIOWpqakhl?=
 =?utf-8?B?U3hLUzREQlJJa05SYkpLdXZFOGZwby9BeStYU3dkeXBaRk90V2lBTStHcyt3?=
 =?utf-8?B?dDJkNytRQUlSQ1p1VnJQVGZJNGVTd2o2aTBhOVYyZHowc0dKdlpUYWwyVVpo?=
 =?utf-8?B?Q3hVYkxzNk5uUkRqMXhCY1I4R05OcTVuaDF5amJERGE1eW10UzZtN21Sa3lq?=
 =?utf-8?B?d0d1QVZ6dTIvdEErQUttZ1F4cnFEaWRTaHFNUExDUmJMTTYvUm9pL1BidlNO?=
 =?utf-8?B?QTJLcjBPWmh3ZStXanNyR1FFN3RvdS94VHBLa1lya3VIUy9PejByYkM0bHFx?=
 =?utf-8?B?ZzFwbXhkNlMzWk93SHllRnF5M1JWSkRUVUpQZDdEb3RtY3J5N0VRSXVsd29L?=
 =?utf-8?B?VnlweDVwTUd2b3Vwa2EvSVhNNGVwb3laQ2IwRkJGOGhjTS9DU0w1N2lmWk1M?=
 =?utf-8?B?S2VpTS9tWGlvWjBsbEp6Q2NTRi9lQm9OMklJUTFYRFFhSWUyNkVlU2xFZHFE?=
 =?utf-8?B?OFYwZ3A5QURMZGFMNmtlNklxM2F4VzhuVmFhY05RTG0rMXo2ZTdRSzEvb2h5?=
 =?utf-8?B?dktVdFFqeUFPc2RtKy9wUWtsUDlOcksxbW93SGhmZmJKRUw1V0l6M3QyTCtj?=
 =?utf-8?B?emF4OFdlelNxRHN0ZWJSNFVmeDMrdGRxOERlMEFvaW1sL29BbVdjSzEwVGFs?=
 =?utf-8?B?ZlAxcTc3ZFhYekZ1bkM1ell4Zm1tQXd6YzQraHRpQktUa3J1c0x0dWhrMlIr?=
 =?utf-8?B?VmNSM0NNRW9IYU1hakFmdlRJT3o0dDdpRENOWUJMNWtHeEpuM09tWVBFVkhG?=
 =?utf-8?B?cXhzZmRjd2VTZlBvVEhuOFI0UXUvWkczcDVXTFA3UDczMWM4aDd5TEZqWktO?=
 =?utf-8?B?V3hhNVNVdmdVbFZFaGozbTN5VVdURThCVmcxdGRJNlJEUVFKaFJpWTl4cTJT?=
 =?utf-8?B?VUVTNXc0UnR2R2c2U001bjRmTmk0ZkZGTWU5bHNtT2p1bWE1cUJKdHVKVXpx?=
 =?utf-8?B?ZVFYTVdkYmpISkoycGEvMmRrc01oTzNBT2JZRnhPN1FhYm9lNGFjV1U1MTNz?=
 =?utf-8?B?bTU3U1A5RXc3QytvN0trQXRJV0xyQ1RmZXM5eXl5TG85QjlvMmY4Ly9lekov?=
 =?utf-8?B?REZEUC9pT1dsN2tkcTdHcDVJc3o1Tkh3RHB1MEkvQWxFNXduZGJqMExUSkRC?=
 =?utf-8?B?NjlBcW9SdVhRT3BJWWkxWDluN3FGUWQwSUU4aVhIZzZyQy91c1BZNEZpSzZi?=
 =?utf-8?B?RFVqSnlNTEpFSkVwY3NlY2NSa0ZBVmxxaU1QRHZLTnlNZG9CTUtxck1ZNm5S?=
 =?utf-8?B?V3A0YVpScUExMU1JdnV3Sm9RRm9rQWYyV3E2Ti9NTjBuZGRXSDJRaVR2dVhY?=
 =?utf-8?B?aDBPZllGVFpQMkdyeGdFOEQvRjBhZGlEMG5xUFBIc3NKS0YrM282OHVzUmtu?=
 =?utf-8?B?OGZmSG15V0tKbStHdTh4ZnBVNW5iTm14NjJzcVQvTFF5WGVCcFpxV3dvOHRR?=
 =?utf-8?B?VjVaeFlqNS9wbWJnNm1EVUNFK0pMcTNicm01allxQmZ1UGJ2T1RycGF3Q0h6?=
 =?utf-8?B?VXc2Yi8vVktuMHVjL0dMbFhHOHJEa1FpT0M4OXphZld6VTQ0UnJERzhUak1t?=
 =?utf-8?B?cUxnaG8vWWhwL2VhQW0yTXpCZ1BoUWFqeEl5azEwbjByZUJmcFpLYTNDaDI4?=
 =?utf-8?B?dCtwb2UydlYyWk44MS9jN3lSWExYSzBDREIyUXdHZ1NuK0JsRW5HTU9uMnlT?=
 =?utf-8?Q?extPKhCVUSz6QCov+m+Ps3OaFDoCcRSCudJDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEszSEliRWw3bUFJRU5PeWt4SDJZbVYyUkRmRDBFOExlT094Ri9kZWlGNEEy?=
 =?utf-8?B?dnNlT3Z3aUllODVZU3l6OExzTGZtaTc4eWhyaDc2NVZyT255R1VuMlk1Umd1?=
 =?utf-8?B?K1I2YnVPck0wbVArQzlYUGVUS0kvMkNmc3dLTkF6eDFOU3UvSDAzZVhOUmhq?=
 =?utf-8?B?a0lEUmtCeUF2MThIL1R0L0U1WGlGckszUnZnYUhJMXRqNitneitNY2E0WWJr?=
 =?utf-8?B?Y3E5eEVYeHkzVnV4RTRFUnAzMVFOTjRaOE9OckNkdWNkUHlrNy9RaTFrd1Nh?=
 =?utf-8?B?b0hNamsvQjZjZ2JJU3FMQUpIY0RDMDk4emtacWpPWkdmVXNsblpDM0FQTC81?=
 =?utf-8?B?enM5SXNMTXUydzBGU0ZRQnZVWUZlMnB5S0JMcjh1Y3hxM1B2TStKamEvdVJF?=
 =?utf-8?B?VVkwNTRxYlpLN29YN1BTSS9KL0doYWtEYWVoYmVtYXYvczNHekJIZGxjb0ZP?=
 =?utf-8?B?bk11OEpCMTludVZVeCt6OGZna0JHYUxIQU5zaG5ZUlhkTHB6N1g1TDlVaVBq?=
 =?utf-8?B?RWZrU0drNElQVlFKa3VlWW0vdlR4Ynk2WE9PdExnL0VDQVRid0tnMC85L0pD?=
 =?utf-8?B?TkRkU2VxYkhOODdQOWQ3SGhQcitKU0U2TUR6SDdWeXlBV3BaNVkvTVhnRkd6?=
 =?utf-8?B?V3VqUHM5NVcvenQ1UXh2Tnpob3F6N1VGUFRBUjMzemZScHRvWVZzaDdrS3dO?=
 =?utf-8?B?MXVOa3o4YzI3b1pZbXdrMkdMV0lyeTFlNkcrdEwvTE5Xb3JEalVIMzlmYUxp?=
 =?utf-8?B?Z2dkd1VrajBBU28vemJRYXVJeis4VGhRWFhqMVRCWlRnVjdTbHVOUUErc3lG?=
 =?utf-8?B?bWwyRUZkSW8yQ20wR21kRGVuWEtlQ3hZa2ltRWs3dmZkb25DNFJiKzdEa3p4?=
 =?utf-8?B?U29Vb2Q1cWZXWGFVL1gzOWlYMUpqeG9LSkVVV1FOOXVXVjkwUnBnT0VDREhh?=
 =?utf-8?B?eDdURHg1WjROVG9TV0NydGE4NUQxVTE3NUdNbHU5Y1pGdHNWWHBqSERSU002?=
 =?utf-8?B?UHh0Z0g1WHlCcmVMZ0NIcXBJMGpEeks2S3dMZ0NSSldPNGxnRzYzVkhkRy9p?=
 =?utf-8?B?OXd0OTZiY082dUpSdFZZdHNOOW5OM2FLT2MzKzJsZHBaZWFFQ1dFR2VLbkZa?=
 =?utf-8?B?aTRBT1Fyalh6UEp5Z3NDRFpTcmlpdzNhU0FFbk1kakpkKy93TFVRNklPSnBE?=
 =?utf-8?B?dHgwak95Y2ZDTER4YzdnZHJWZlFHK2R2WXYrcUtBYUhUa0wyU3ZCeFRFYjlR?=
 =?utf-8?B?Rk1yUFBWYTh4bWhOU1Y4S3dKYmJ1aEtPT3BMbGxYTmxWTGNybVZUamF2Wmhn?=
 =?utf-8?B?anBWV3JUNm9yOWJtNlo4UE1OaFZWdHNkQ1gxMFdidGZlT2dFTTBWaCtoVDRw?=
 =?utf-8?B?Wm5XdFZrdUhvL2pwRmhTZ3lFMDRqazMreGtOWGNCcllCM1NRQjcyUlIxcmJq?=
 =?utf-8?B?eDNkdkZhWS9YWVdTVWt4Q0szU29WeTA1SDN0ZmswOEZZSDd4ZGlJQmRLRXNm?=
 =?utf-8?B?Y1orWitDRFN4K3pDOFNlMTBacEM5UWJXRSsvNzA2cjFTZDVuK0haSjIrNHJ3?=
 =?utf-8?B?TjFZSlorUERTcURtYnFyRGNTcVM3eFZpVElCZHVNb3NIL1RRRExVSURnVmtW?=
 =?utf-8?B?ZWV2SnZqMXI0TU8rYXhTQnpXbC9JaFJuWDlWQkFaVWN6dHgwb1hwOTJwMmdS?=
 =?utf-8?B?QWFKTm9uc1p0aDZXQ2xGckN6SGFUTTBXeU9jd0hsNTFSeGhMaCtYSFN3WE5s?=
 =?utf-8?B?eGVMUmo5QlE1Q0pLNng1K2VMVk9ibEgxRktaNFlOMGxHdCtWR1JzNTdjampx?=
 =?utf-8?B?c2Z4VXlVS0RLbDB5Q3Zicy9XYlBoMnd3bWo4eTNZMDQ5UGpZWmdPY1BQSXJ4?=
 =?utf-8?B?UXZ1by9SSGprc2xoMDFSbCsvTjEycTFldUMxWnNkMmlFWXBDK2ZPSnRtN2Ix?=
 =?utf-8?B?NlEzL2V2QXNYRUJaeHVMeXFxNHlTaGlyenhDSG83VE5Yb3FEVm5sajA1Qktx?=
 =?utf-8?B?cEpQcnhXeWNTd3VpUGRUUWJ0b01XSUFldERHMnQ0ekR3My9XTHgyQkcyb3hT?=
 =?utf-8?B?REIrQVh2MFozRXlQWW1DY1Vvb3Z6Qk1XVHhPM1hnRk1VMEFiYytaRVVCVjQ2?=
 =?utf-8?B?ZEowbGd2Tm9TSlY1UmF2emFTNHRaWFRvNUF1Ti9FTHR0Sjd6OFNYcE9zYUJi?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dfdd37-02d8-4b61-010a-08dd14fe4cde
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 07:27:40.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hemZPKKTwGyrCnBd+/8It6lYttCLMiFM0NTAeKJo35C6DXEvWL8k8Dn+yIIiakRoq88hr3cJ1TGnRgGe+m5eqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
X-OriginatorOrg: intel.com

hi, Chuck Lever,

On Tue, Dec 03, 2024 at 02:54:47PM +0000, Chuck Lever III wrote:
> 
> 
> > On Dec 3, 2024, at 12:01 AM, Oliver Sang <oliver.sang@intel.com> wrote:
> > 
> > hi, Chuck Lever,
> > 
> > On Mon, Dec 02, 2024 at 03:40:49PM +0000, Chuck Lever III wrote:
> >> 
> >> 
> >>> On Nov 18, 2024, at 2:53 AM, Oliver Sang <oliver.sang@intel.com> wrote:
> >>> 
> >>> hi, Chuck Lever,
> >>> 
> >>> On Thu, Nov 14, 2024 at 09:37:30AM -0500, Chuck Lever wrote:
> >>>> On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wrote:
> >>>>> 
> >>>>> hi, Jeff Layton,
> >>>>> 
> >>>>> in commit message, it is mentioned the change is expected to solve the
> >>>>> "App Overhead" on the fs_mark test we reported in
> >>>>> https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.sang@intel.com/
> >>>>> 
> >>>>> however, in our tests, there is sill similar regression. at the same
> >>>>> time, there is still no performance difference for fsmark.files_per_sec
> >>>>> 
> >>>>>  2015880 ±  3%     +92.0%    3870164        fsmark.app_overhead
> >>>>>    18.57            +0.0%      18.57        fsmark.files_per_sec
> >>>> 
> >>>> Because the most recent version of this commit does not appear to
> >>>> address the reported regression, Jeff suggested dropping it. I've
> >>>> done that in the branch below, which is being prepared for v6.13.
> >>>> 
> >>>> 
> >>>>> another thing is our bot bisect to this commit in repo/branch as below detail
> >>>>> information. if there is a more porper repo/branch to test the patch, could
> >>>>> you let us know? thanks a lot!
> >>>> 
> >>>> The proper branch to test is:
> >>>> 
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-next
> >>> 
> >>> thanks for information! this repo is under bot's monitoring.
> >>> unfortunately, our cluster run into problems these days and need some time
> >>> to full back. so if there is still regression reports, maybe will delay to
> >>> a later time.
> >> 
> >> Hello Oliver -
> >> 
> >> To avoid regressing v6.13, we postponed this series.
> >> 
> >> The series is now in 
> >> 
> >>  https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-testing
> >> 
> >> And I would like the robot to include that branch in regular
> >> test runs going forward. I will try to push new patches there
> >> first before pushing them to nfsd-next.
> > 
> > got it. this nfsd-testing is already in our monitor.
> > 
> > 07b2337dc158fb (cel/nfsd-testing) nfsd: add support for FATTR4_OPEN_ARGUMENTS
> > 54b0e9c3727d2f nfs_common: make include/linux/nfs4.h include generated nfs4_1.h
> > fcc756b92ce832 nfsd: fix handling of delegated change attr in CB_GETATTR
> > a354743d35b49b nfsd: trace: remove redundant stateid even deleg_recall
> > 40384c840ea194 (tag: v6.13-rc1,
> 
> That's not yet a complete set of revised patches. We'll get
> there in a few days.

got it. thanks for information.

> 
> 
> > at the same time, I triggered same tests for original report upon 07b2337dc158fb
> > and v6.13-rc1, will update you results later.

if just comparing 07b2337dc158fb with v6.13-rc1, there is no big diff for
fsmark.app_overhead.

       v6.13-rc1 07b2337dc158fb33e7af288b74c
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
   3110649            -1.3%    3070867        fsmark.app_overhead
     18.58            -0.3%      18.52        fsmark.files_per_sec

but as above, seems the 07b2337dc158fb is not the correct commit to test?

we noticed it's now

b95256b0edb43 (cel/nfsd-testing) nfsd: prepare delegation code for handing out *_ATTRS_DELEG delegations
77152578a5c16 nfsd: rename NFS4_SHARE_WANT_* constants to OPEN4_SHARE_ACCESS_WANT_*
019cb8ea1e9d4 nfsd: switch to autogenerated definitions for open_delegation_type4
07b2337dc158f nfsd: add support for FATTR4_OPEN_ARGUMENTS
54b0e9c3727d2 nfs_common: make include/linux/nfs4.h include generated nfs4_1.h
fcc756b92ce83 nfsd: fix handling of delegated change attr in CB_GETATTR
a354743d35b49 nfsd: trace: remove redundant stateid even deleg_recall
40384c840ea19 (tag: v6.13-rc1,

if you need us test b95256b0edb43, please let us know. or you could request us
when the branch is ready. thanks!

> 
> Thanks!
> 
> 
> --
> Chuck Lever
> 
> 
