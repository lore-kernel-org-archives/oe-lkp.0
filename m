Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379D433C8
	for <oe-lkp@lists.linux.dev>; Wed,  4 Sep 2024 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415819; cv=fail; b=S/ZeF0NSCWH978OBS3vSb0rDO0G4jbvo8Q56mnw3jWifGOJpM3AwfClQOdaorKfQW9TsePAbh1Xt2utu7J0Adgwee4H7bCE+5kIfMobgXFri4P2IwBlShFPxVD7pvn9/QEZwO0VAs/bMCquvCa0QA6p8b4/376+XvMwefQjvgSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415819; c=relaxed/simple;
	bh=vScsHArbbvHb1XqBsGVpd821+GGVTYo3GtwjCqhizVQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fb2jQvmh8O0nctCjtCOuHNyTmoilhOoapBmgGFM1c5z7/T3SZ3NNHOjYVuGTF8CIjixdWyWDuJqbOT9MTcDPiU2ts5mNmiawGiTqN3snXgs81dJqVacXAkxtCxrvhEv33PXpDcTcL2HxHSkmdSZz8CvA1w6UP+XElS7jd/r88q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQ1knNzF; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQ1knNzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725415818; x=1756951818;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vScsHArbbvHb1XqBsGVpd821+GGVTYo3GtwjCqhizVQ=;
  b=DQ1knNzF3LZtwtuKKbD4wFSVDXOdIhz8omyHQJfFAXUwl8suuSKzteLo
   giDjb5mP1QLW2+RltGNGQTK9SEU3niabIfyI/Njux1Qq59ZwnbMnbtSrE
   K4A0BhVjrWfVQUZSXhQHfmLFMflxm10vePo0RudzFrjPtqO2WRyeyhiOl
   n4bbB1eblhzp1LkPgLcWBroAdexfk2Ib4h1WcSoL1dx+zZVEJQwxjUVJu
   G7Gs2kA/4bFMwlYYFcB7l+5MvWRF5thK/JgMMmX1yhuzhzmCR8B6IKrob
   5EJyBgh/bbNK0clFnUFBAFcqhb7798fXdwZBfcgkDP06A4F3Jfk6NwEME
   g==;
X-CSE-ConnectionGUID: jUiyA65USgGuYeKQJMHAyw==
X-CSE-MsgGUID: Y8IFSBkIS0Ony/cm4zv7qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23911604"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23911604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 19:10:17 -0700
X-CSE-ConnectionGUID: 8Zq17Er8RFmLLAkJWDHP9w==
X-CSE-MsgGUID: amN3QAElQpiHiDhj0DIpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="64924583"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Sep 2024 19:10:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 19:10:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 19:10:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 19:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=www1KAX+PZGAjh99S0SZKALUAWJLYLvh9k+EcFmMuTh9HDxT4FxX3XWGJDhZ6OqqMP9BdIwuZkZypjeXVom6Cn9kx/4ZATxyHHmOTS53CsET6YEh42cUtyXyvf39cg8I3lDn+PiUiZRWrJeFx81ooLvVkHaVxKLTxOcS+T1H3cNh8qE+hiQ7SUCItGJMU7QVpIVTtenfRc8phqeVoi42LJPS2WLtXoITEhLLJVDFRpRJzAJL4vkV/DL13SSjf/kf1oWTKpiSNYTL3rgKVRS3hFhfsZG7E0QOtURBSyBOd3OIbsnSBjh0vvHjh7n/ndkqUb0FpoW9l3UxhomPfLOqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBRB03wIP8dtjvWra0SuD5MwwAI+PVHI+Y2LghjCjKY=;
 b=mEoefPDo6tU0d17pW74y2B20jqHxAVM6cqQIp7GEu+6hOGdjOgZsL6Xl+LQxqYHxhbkxZPxmYigwk81L7hdme8ZTUvYGRyeQgFsJV7Fzbk162cXUkLfDpH2e/Opk5mcTMtcWrtVcYgQEhu9fDyut+HU2q6N4zw4SXfbU7gdMW4xb/eJI1mtAmQb/yge8VAcysBfNnHdIcp1O7VcJ/WPlj3wB6OsAFsrTZG7vhgjz/QIbiIip4vUM0AZZd68tRWJjQEwtVC7wWwljBb/EOHkwr7SWeP12XQU/BnlIjWiOzxNnruieod1Sd/YaCazRJsu8xFAbzrlRwSskMnaFjaMo8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 02:10:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Wed, 4 Sep 2024
 02:10:12 +0000
Date: Wed, 4 Sep 2024 10:10:00 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Zheng, Wu" <wu.zheng@intel.com>
CC: "Liu, Aure" <aurelianliu@tencent.com>,
	=?utf-8?B?amFzcGVyd2FuZyjnjovkvbMp?= <jasperwang@tencent.com>,
	=?utf-8?B?a2FpeHV4aWEo5aSP5byA5petKQ==?= <kaixuxia@tencent.com>, "Liu, Frank"
	<frankjpliu@tencent.com>, =?utf-8?B?a2Fzb25nKOWui+aBuuedvyk=?=
	<kasong@tencent.com>, "Chen, Saga" <sagazchen@tencent.com>,
	=?utf-8?B?a2VybmVseGluZyjpgqLkuIfph4wp?= <kernelxing@tencent.com>,
	=?utf-8?B?ZGVzaGVuZ3d1KOWQtOW+t+iDnCk=?= <deshengwu@tencent.com>,
	=?utf-8?B?Zmx5aW5ncGVuZyjlva3mtakp?= <flyingpeng@tencent.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Jia, Yingbao" <yingbao.jia@intel.com>, "Jia, Pei P"
	<pei.p.jia@intel.com>, oe-lkp <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>,
	<feng.tang@intel.com>, <oliver.sang@intel.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW0ludGVybmV0XVtv?=
 =?utf-8?Q?pencloudos=3Anext=5D_=5Bhrtimers?= =?utf-8?Q?=5D?=  53f408cad0:
 stress-ng.sockfd.ops_per_sec 13.8% improvement
Message-ID: <ZtfBePyM0Ki/0TzR@xsang-OptiPlex-9020>
References: <tencent_0072AD566D2F623120E0A213@qq.com>
 <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 497b9865-41a5-4892-2ecc-08dccc86b560
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUkzbWR3eVVudGprYk42UE9tKzJSSjAvS1lnWWdFRlhXRVgzeEorQ0hMTVlm?=
 =?utf-8?B?dVVzZlVGWkZaTE56dmtlUlRjalhNbG5iczcyZXBobnc2ZlM3OE9sZHpLeEg0?=
 =?utf-8?B?MnRGb0FDcm5ENm1ZUS9JUktkcTBTK3h2UVJnbkRERmtmM2hhTDZ2SUk0bytE?=
 =?utf-8?B?eUZuUVo5L0IybmZzMk9mYjlrb1krUTMrcnIyWGc1Tk9Nejc2SFVNYkV3UVBa?=
 =?utf-8?B?TGo5OElhMExGWmlldkhranNHaGlISVVVT1dRTlM3VHJiQUMySWV2M3BQRjMz?=
 =?utf-8?B?bnJJY2lpNjVGM3d0Zlovakd4bnNqSWlJWmg3cW5zeUMxYjJSaUZoZU15UjMw?=
 =?utf-8?B?VHJlMlR2VmNXa2xLQjdUMEF2dUtVaWJuUWxYTUMzbk03M0tvZ3A0RllBVVNT?=
 =?utf-8?B?WmtqQmpMZWhlUjl3TjJxVXpsREhMTE43ZG1scnR2dHdBbHVwTk15THFhMGUw?=
 =?utf-8?B?cUt6dmlkZExGaEtXdDQ3dmdkbXMxQXlMaFUwTDMyWUoxeWRMcEJZUHR2NUhS?=
 =?utf-8?B?dU5wODlnRyt0KzBSVENSUnI4Yi9pR0tUbW1SbGZSeVo4enVJeTh0QmdSVHNO?=
 =?utf-8?B?QXp0NnBvaG1jdGFGUmk4eE0wcDAzUGV0b3BJV1pJUmhRNTBVY0tsZEhVc0dU?=
 =?utf-8?B?OGJtdE8veFpxS2kzU1hJZHRWNW5ONXJ4amJhc2F0Wk81dHh2Nk9kQUYvbzRJ?=
 =?utf-8?B?a0tRTmpIRnBNNm5NOXFid2MxV01KbW9BYnVvU0QwSzlJUEZhanZhYWdibTM3?=
 =?utf-8?B?SkI3blF1SU9OcUhCYnkxZGFCKzQrMllLdnpGYnVEeFFEeC9jQXdXS3dYbnNy?=
 =?utf-8?B?Z1krR1QySlhLbS96YmdSN3duazBzdWVvUHlPUWdaZXdWUERZZEhHUHU0ekVo?=
 =?utf-8?B?a1I0Y0J3cjA3Z05kNjRxWUE1OEU4VzBOL1hFT0ltN2tFcDRyL1h1Qlh6d0F3?=
 =?utf-8?B?Z2lGUTJ4ZzJIcmN1R21wajRQK0gxTS9MbmdPc0MxMExRMDE2TTBsNmVFTWdK?=
 =?utf-8?B?dnlHdjRPN1diNEN1TUdzeW45TEo4ZE9SM0greEhWLzBacVY4ZXJZcFJBK01B?=
 =?utf-8?B?bXJtUS93azZuODV6NEJnRjltZWZUMGFWYWFPWGtOWU1JbCtZM1JrdFY5RkhS?=
 =?utf-8?B?SXJDVlRLSlRmdndOT0dTVUYxNGFhNmFJc2FobHcrRGhDWlVuSk0vbTdlRUZt?=
 =?utf-8?B?L3Zoa0xNTlpiRXJuSXpJZTVEOHJkdHcvbmp4bzJ4QS9wcFRqUWFKend0Y1dp?=
 =?utf-8?B?eWhaWkVsM0Rwa09uNXFTVUtaTXFWUStlN1hlZ0ZCenRRZ2pYOTRLSCtuSmhI?=
 =?utf-8?B?eCsvWGFaaHRqbkJqcWRuOXhvTTh6cktZTE83ZlUydTZjb2dRMHhYamMvamtU?=
 =?utf-8?B?aTNuVHVSUFBCUGZUT01uazlmckU1TFROQ1dvUGZZRUxvYnppdVh6M08yak9D?=
 =?utf-8?B?QnFJZWdYN0lUY05HZnM4aHpLeTBINStRME1qVW9LRlZTVUYwa2E1dGh2NEpm?=
 =?utf-8?B?Q2RsbnQxd0NCTG9mTjlCTlNMRHlSbFFielp2Zitjbkd2Ny9aNUZCWERRZkJs?=
 =?utf-8?B?bnBXSGtRbGtqVVJrRS9QRHU1QW9pamJLZXRlbFRPTFpYRlNIcTR5bXo0MG5O?=
 =?utf-8?B?N3VXNXNab3VSVzBUc084ck9nbU42WnlqUGh0SFpwOUJrUDFGV1pXTVJBdzA4?=
 =?utf-8?B?OHoyN0ZYam5RaTNzcUFGNjBMSTUxQlBUSjU4K0pid2NyZmY2ZGtnOERRenUz?=
 =?utf-8?Q?cbteGUh8ibZcZqok5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtqdWZxSlFtMkVLdUhhdG4zMEJXRWxrbnRvQWlXdG5DcjAycDFrTE5tc3hl?=
 =?utf-8?B?T3RoRlNnNFpxMzNiWG5iajVJZDNIQW9nR2FGc0NodHFnM0NSVU01SzM2VjJ0?=
 =?utf-8?B?Nzl4dWNMODYzc0RSUGZBU1krQTRRVWlUUWJSZVJDSzNHTG52Y2dweXVGZjNq?=
 =?utf-8?B?MEh4WHdLYTRNTGQ2dlJBa2FZUjRxOTlZY1RLdDRIb2ZiZW5na2dzVHA0WGhz?=
 =?utf-8?B?aUdubE5idEFPaTJ2RVdTZ00rRlhIM2NtSXovdEFwS3l1SzVPcm1QZTB5RVVW?=
 =?utf-8?B?cDNOU3J1MytvQUN6SWxJRmhNbzNhdHFxSW9xVkZKNTVzUXlwcXlFNnV6dFNN?=
 =?utf-8?B?cjJQV1pXRW9HMmtWMlJuM1h3V0VkWGk3MmV0VDJFZTJ4VXhxNWNmSGZyZ0o3?=
 =?utf-8?B?WjBteG1HRUluenFtRVdBaHU1d3k5eGpBNlMxSXpueU5LMG1weDdHeWU0Szk2?=
 =?utf-8?B?bXBvUjluWFEzb2oxM2pFcFRHeG9WVHVyR0lWRVZ0U2d4b0RyRHgyaDdSYk1I?=
 =?utf-8?B?WkNFYkwrK25KRU9lMXd2T210Y0QzNEFDRkNYcmNzYzdGSWlQRWVKM1B3cW1C?=
 =?utf-8?B?WEMrODFDdDR6aXBrVHNwSERTVFFLN1h2SEJUTGYvRmJuelRhZkdlbjBMazdX?=
 =?utf-8?B?WGxMb3QydkluT0FETEFqdC9ZVUpWTTJ3TmM4S0F2dlNOWVRFZGJzQ05zZ2hF?=
 =?utf-8?B?UktyUXA5c0ZyUE1FeExsWFMxSGFySEpsenhxQ2xTKzRpVWUrMHBPOGVNZ3RN?=
 =?utf-8?B?V0V6dHVId05vejVZeHV5WFVpTkhjeXd2NTdxSDNEK21NQnlZRFVYa1pXdTJU?=
 =?utf-8?B?eDd1akV5M3BZd29ZWHU1YzJObVk0bXJjZUM3dXJPblUrNVNqZkpGTTA1Qjc5?=
 =?utf-8?B?TlBUcUI5ZUJXUmhGWUdWZy8zNGIyZEtLKzVFOFlCVE5iUWNRUGhwd2hvWVYw?=
 =?utf-8?B?L0hrY1Jjb01jTDRHNXNWS09YZ2V6Zi9QUUpZS0l6K1J4ckJIclk5cjQxKzZN?=
 =?utf-8?B?YVFrMkxxWERsTFBFcEVSaGxWUDlCSDJGcWR0MFJmZzgwOW5Ib1ZYWGVVeVJK?=
 =?utf-8?B?d2dlQklabkF2VFZRTlBCOHN6TzdVdm54V0l1Y0ZyWXozb0NncGUwV21YcU1F?=
 =?utf-8?B?a1lHc3hrWXBoOVhtZzhiNlI1VlhJMEJiVVBGaEFYbkhNbWtHRFMwMHJINGR5?=
 =?utf-8?B?OWJ4L01zWjdiRnJLMEQwd1hIT1loVEhqRXVwQ0EwQmJVckxFSzJLVXBYb3pT?=
 =?utf-8?B?UVc3bDhLUWZFWUlJMWsva25KK3FyNTVxR3RmQi9IU2Y4amVJNUJhV0FaMCth?=
 =?utf-8?B?ZXViU0wyTXE1WkxvUUhjbjluSW5mSTZSeERHY05zNmpYMTlua2RBWWV6OXVD?=
 =?utf-8?B?dHpoWlJ5VnBrMFhEaHNYVVpVSlBGcDdBa2RsbWd2M2x1N0o3S1dtTjFTaUxw?=
 =?utf-8?B?UHNTajU1QlhzUG1UYTdpRGgzQk9FUlUyWEVmYlRSRzBManNrbjBMSTBhcDRQ?=
 =?utf-8?B?NEFEVE92NURScStQUHNLNElveldOWUNySjM4M2FIT3dCVG4ybE5WSHZVTmM0?=
 =?utf-8?B?c1I0SURBeERQRDg0c0V3VlZYRjZOUW55ellMeVhWZHRJQ1g3WlZkTTBaSloy?=
 =?utf-8?B?aG1JN3h3ZUpZQjN5bXlrYUdiU3pwUDFhUXNyTE5VV3Q2QjVKU3ZDMDVhUlpX?=
 =?utf-8?B?ZG8yMUhLZWtqK0o4M1N4T09ETmNDV2ZQRXova24yN015YzRmMUN0K0xrTEhl?=
 =?utf-8?B?K1V4S1NDQjJDR3o0b0sxNUdlQ1ZKa2JjdVZNUGNjZGlFaXBuRmtiTUdObXlw?=
 =?utf-8?B?cnE1ejJDNXltZiswZlZzcGlmSzUrWDMxUUFBZ3JTRk1KVnh5ODJ2N2Z6d3Vh?=
 =?utf-8?B?RjQ2cXhYTSsveWJNd1dpa1VoVGwyZWo5QXJDMVVZY2ZmQW05d29PYUVMdDZ3?=
 =?utf-8?B?OTJnMlIxck1SNVhvUUFiSSt0TUNGTi9laFFCOUdZTXdaQjY0eWRBdi9JanBD?=
 =?utf-8?B?cjF5VWJFNDdvQitpMjBmcEUxVFc2YU5GbjI1N3dCTkdrRGxoM1dVRi9mWS80?=
 =?utf-8?B?Q3M3bm9xZ2MyVzR1eC9yKzcxNTRhQi9ua3VFT3ByOGptKzdvUDhKM29xc3o4?=
 =?utf-8?B?YUlDRVJGNVh5d2l1TFRhY1J1WmtkMmpqakg1VHE2NTd1MjFnTHBoUUhyUUV3?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 497b9865-41a5-4892-2ecc-08dccc86b560
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 02:10:12.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnVXcx/SGW8A0Ci1HMD/VFvIQ65FAkT3MdtkMj8vu8XKLosqdWYRtD55O/4nLuTUroVD5Hd+MHsTcTQXtRCkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
X-OriginatorOrg: intel.com

hi, all,

On Wed, Aug 21, 2024 at 11:45:45AM +0800, Zheng, Wu wrote:
> >Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> hotplug，是不是不应该有性能变化
> 
> 查看了一下代码，确实应该只有在cpu hotplug的时候，才会运行patch中修改的代码。
> 
> 不过，在patch中新增加了对cpu状态CPUHP_AP_HRTIMERS_DYING的一个handle，
> 
> 是否这个improving performance的原因。
> 
> 另外，和Oliver对过了，这个improving的data应该是多次测试后的结果。

Wu, you are right!
for original report, both 53f408cad0 and parent tested 6 times.
(in fact, for all performance report from 0day, 6 is mininum run times for a
commit)

the data for 53f408cad0:
  "stress-ng.sockfd.ops_per_sec": [
    806893.21,   <--- one unstable data, but still distinct enough comparing to c94c44685d
    890668.75,
    890737.88,
    890370.42,
    888873.71,
    892069.45
  ],

the data for parent (c94c44685d):
  "stress-ng.sockfd.ops_per_sec": [
    772950.12,
    774262.88,
    748388.34,
    774652.04,
    776115.25,
    777131.75
  ],


based on your feedback, we checked code alignment further. by attached patch
from Feng Tang (Cced, our expert about code alignment issues, and is working
on patch-set for mitigating this kind of issues, Thanks a lot, Feng!)

and we run tests up to 20 times for both commits, the performance difference
is just in noise now. so the original report is less meaningful. sorry for
any confusion caused.

below some details.

original 53f408cad0 and its parent looks like below in branch:

* 53f408cad05b hrtimers: Push pending hrtimers away from outgoing CPU earlier
* c94c44685d80 scsi: sd: Fix sshdr use in sd_suspend_common()
* dd3438abfb85 vdpa/mlx5: preserve CVQ vringh index

we inserted the code alignment patch from Feng before c94c44685d80, then the
commits in branch became below:

* f8057ff406bab9 hrtimers: Push pending hrtimers away from outgoing CPU earlier
* 620c3bf8aa2f2e scsi: sd: Fix sshdr use in sd_suspend_common()
* 4fe88ea078d804 align kernel/exit.c    <----- attached patch from Feng
* dd3438abfb85f6 vdpa/mlx5: preserve CVQ vringh index

then we run same test upon new f8057ff406bab9 and 620c3bf8aa2f2e up to 20 times

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s

commit:
  620c3bf8aa2f2e ("scsi: sd: Fix sshdr use in sd_suspend_common()")
  f8057ff406bab9 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")

620c3bf8aa2f2e37 f8057ff406bab9ca3e6c19548fc
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
         20:20           0%          20:20    stress-ng.sockfd.pass
         %stddev     %change         %stddev
             \          |                \
  53177039 ±  3%      -1.5%   52396229 ±  5%  stress-ng.sockfd.ops
    886042 ±  3%      -1.5%     873038 ±  5%  stress-ng.sockfd.ops_per_sec


also captured raw data as below FYI.

although there are random unstable data, generally speaking, there is no obvious
performance difference between these 2 new commits now.

for f8057ff406bab9 (saw several not stable data):
  "stress-ng.sockfd.ops_per_sec": [
    788846.43,   <---
    870181.86,
    800294.02,   <---
    897801.49,
    896612.93,
    894245.37,
    896740.75,
    894682.9,
    814902.28,   <---
    896683.88,
    896215.86,
    895695.55,
    895589.53,
    897497.99,
    895326.19,
    896870.11,
    897734.02,
    739848.46,   <---
    899569.27,
    895426.67
  ],

for 620c3bf8aa2f2e (there are also unstable data):
  "stress-ng.sockfd.ops_per_sec": [
    896915.05,
    895960.77,
    896191.9,
    897573.54,
    897191.51,
    898619.02,
    902343.05,
    897126.19,
    887130.05,
    884084.2,
    804080.41,   <---
    896124.17,
    894256.43,
    898721.35,
    894504.22,
    897396.18,
    896682.74,
    894763.47,
    898041.33,
    793150.46    <---
  ],


> 
>  
> 
> Best Regards
> 
> Zheng Wu
> 
> From: aurelianliu(刘诗) <aurelianliu@tencent.com>
> Sent: Tuesday, August 20, 2024 4:24 PM
> To: Sang, Oliver <oliver.sang@intel.com>; jasperwang(王佳)
> <jasperwang@tencent.com>; kaixuxia(夏开旭) <kaixuxia@tencent.com>; Liu, Frank
> <frankjpliu@tencent.com>; kasong(宋恺睿) <kasong@tencent.com>; Chen, Saga
> <sagazchen@tencent.com>; kernelxing(邢万里) <kernelxing@tencent.com>; deshengwu
> (吴德胜) <deshengwu@tencent.com>; flyingpeng(彭浩) <flyingpeng@tencent.com>;
> Zeng, Jason <jason.zeng@intel.com>; Zheng, Wu <wu.zheng@intel.com>; Jia,
> Yingbao <yingbao.jia@intel.com>; Jia, Pei P <pei.p.jia@intel.com>
> Cc: oe-lkp <oe-lkp@lists.linux.dev>; lkp <lkp@intel.com>; Sang, Oliver
> <oliver.sang@intel.com>
> Subject: 回复：[Internet][opencloudos:next] [hrtimers] 53f408cad0:
> stress-ng.sockfd.ops_per_sec 13.8% improvement
> 
>  
> 
> 这里有一个疑问：
> 
> Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> hotplug，是不是不应该有性能变化
> 
>  
> 
>  
> 
> Sang, Oliver<oliver.sang@intel.com> 在 2024年8月20日周二 16:09 写道：
> 
> 
> 
> Hello,
> 
> kernel test robot noticed a 13.8% improvement of stress-ng.sockfd.ops_per_sec
> on:
> 
> 
> commit: 53f408cad05bb987af860af22f4151e5a18e6ee8 ("hrtimers: Push pending
> hrtimers away from outgoing CPU earlier")
> https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
> 
> testcase: stress-ng
> test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald
> Rapids) with 256G memory
> parameters:
> 
> nr_threads: 100%
> testtime: 60s
> test: sockfd
> cpufreq_governor: performance
> 
> 
> 
> 
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240820/
> 202408201523.11994461-oliver.sang@intel.com
> 
> ===============================================================================
> ==========
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/
> testtime:
>   gcc-12/performance/x86_64-oc_stream_base_config/100%/
> debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s
> 
> commit:
>   c94c44685d ("scsi: sd: Fix sshdr use in sd_suspend_common()")
>   53f408cad0 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")
> 
> c94c44685d801334 53f408cad05bb987af860af22f4
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \ 
>      52019          +192.9%     152364 ±145%  vmstat.system.cs
>     248.33 ±  7%     -19.9%     198.83 ± 16%  perf-c2c.DRAM.local
>      11510 ±  2%     +20.0%      13813 ± 13%  perf-c2c.HITM.local
>      25227           +17.0%      29523 ± 12%  perf-c2c.HITM.total
>   46241536           +13.8%   52608779 ±  3%  stress-ng.sockfd.ops
>     770583           +13.8%     876602 ±  3%  stress-ng.sockfd.ops_per_sec
>     709901 ±  2%    +473.7%    4072397 ±177% 
> stress-ng.time.voluntary_context_switches
>    2221056            +4.0%    2309588        proc-vmstat.numa_hit
>    1824201            +4.8%    1912626        proc-vmstat.numa_local
>    3416606           +10.0%    3757450        proc-vmstat.pgalloc_normal
>    2811184           +12.0%    3147390        proc-vmstat.pgfree
>  1.646e+10            +3.2%  1.699e+10        perf-stat.i.branch-instructions
>   41247621 ±  2%      +7.5%   44359189 ±  2%  perf-stat.i.cache-misses
>   89628939           +11.4%   99819592 ±  2%  perf-stat.i.cache-references
>      54186          +182.9%     153293 ±141%  perf-stat.i.context-switches
>      10.31            -3.2%       9.98        perf-stat.i.cpi
>       3124           +19.5%       3733 ± 12%  perf-stat.i.cpu-migrations
>      18733            -7.2%      17380 ±  2% 
> perf-stat.i.cycles-between-cache-misses
>  7.027e+10            +3.9%  7.304e+10        perf-stat.i.instructions
>       0.12            +3.0%       0.12        perf-stat.i.ipc
>      10.43            -2.9%      10.13        perf-stat.overall.cpi
>      17676 ±  2%      -5.7%      16664 ±  2% 
> perf-stat.overall.cycles-between-cache-misses
>       0.10            +3.0%       0.10        perf-stat.overall.ipc
>  1.606e+10            +2.4%  1.645e+10        perf-stat.ps.branch-instructions
>  4.528e+11 ±223%    +422.8%  2.367e+12 ± 82%  perf-stat.ps.branch-misses
>   40486476 ±  2%      +6.2%   42992791 ±  2%  perf-stat.ps.cache-misses
>   87229061           +10.7%   96531559 ±  2%  perf-stat.ps.cache-references
>      52859          +194.7%     155786 ±145%  perf-stat.ps.context-switches
>       3038           +16.6%       3543 ±  8%  perf-stat.ps.cpu-migrations
>   6.86e+10            +3.1%   7.07e+10        perf-stat.ps.instructions
>  4.235e+12            +2.5%   4.34e+12        perf-stat.total.instructions
>       0.16 ±  3%      -0.1        0.09 ±  8% 
> perf-profile.children.cycles-pp.free_uid
>       0.22            -0.1        0.15 ±  9% 
> perf-profile.children.cycles-pp.__scm_destroy
>       0.15            -0.1        0.09 ±  8% 
> perf-profile.children.cycles-pp.refcount_dec_not_one
>       0.14 ±  3%      -0.0        0.10 ±  9% 
> perf-profile.children.cycles-pp.scm_detach_fds
>       0.16 ±  3%      -0.0        0.12 ±  9% 
> perf-profile.children.cycles-pp.__scm_recv_common
>       0.08            -0.0        0.05 ± 44% 
> perf-profile.children.cycles-pp.scm_fp_dup
>       0.14 ±  2%      -0.0        0.13 ±  2% 
> perf-profile.children.cycles-pp.__scm_send
>       0.11 ±  3%      +3.6        3.74 ±215% 
> perf-profile.children.cycles-pp.do_dentry_open
>       0.11 ±  3%      +3.6        3.74 ±215% 
> perf-profile.children.cycles-pp.vfs_open
>       0.06            +3.7        3.72 ±219% 
> perf-profile.children.cycles-pp.____fput
>       0.06            +3.7        3.72 ±219% 
> perf-profile.children.cycles-pp.__fput
>       0.08            +3.7        3.75 ±217% 
> perf-profile.children.cycles-pp.syscall
>       0.08            +3.7        3.75 ±217% 
> perf-profile.children.cycles-pp.task_work_run
>       0.18 ±  2%      +7.2        7.41 ±217% 
> perf-profile.children.cycles-pp.do_open
>       0.00            +7.3        7.28 ±222% 
> perf-profile.children.cycles-pp.lockref_put_or_lock
>       0.00            +7.3        7.29 ±221% 
> perf-profile.children.cycles-pp.dput
>       0.31           +10.8       11.13 ±216% 
> perf-profile.children.cycles-pp.do_filp_open
>       0.30           +10.8       11.13 ±216% 
> perf-profile.children.cycles-pp.path_openat
>       0.35           +10.8       11.18 ±216% 
> perf-profile.children.cycles-pp.do_sys_openat2
>       0.36           +10.8       11.19 ±215% 
> perf-profile.children.cycles-pp.__x64_sys_openat
>       0.39           +10.8       11.22 ±215% 
> perf-profile.children.cycles-pp.open64
>       0.15            -0.1        0.08 ±  8% 
> perf-profile.self.cycles-pp.refcount_dec_not_one
>       0.07            -0.0        0.05       
> perf-profile.self.cycles-pp.__scm_send
>      96.72            +0.1       96.81       
> perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> 
> 
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> SECURITY NOTE: file ~/.netrc must not be accessible by others
