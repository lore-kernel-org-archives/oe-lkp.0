Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C62599
	for <oe-lkp@lists.linux.dev>; Thu, 23 May 2024 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716430735; cv=fail; b=XQaW7J00Z++sl3sYTQslG1JC6XFpJbgyxeHv0x5Z1VpCJIxFiPhb7zmy3AFIoUEys5L4nmYRXy88HEc6hrhW8lRTlpZaDs7xXwD2U+YFMmtWDncyYoNuAa+TNsjlds/8pmkx1nrL/2n/ISgQs+duNZjCCTxjfWgpRN/jxLcYEwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716430735; c=relaxed/simple;
	bh=pM/IaAlWzRTxjZ89oZJPhBshJzidbApJ7FLcpf/nFKI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bqfjE5kP2iYJ7gjCtF+XrzeYZo5xJrT1XjNNUFhuKmWxSZ1AbpRfKKi13XaFBuiBfRxJx5KnH2TeqOclhqsIsDJDrWxDtTtYIWOdaWqATiumR78TP7hTE5Leblw8kYNm4nT0LTiAcElFMmH5FmULPTFlnG3I9Sw/H71sMmRIK+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MegUEHBd; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MegUEHBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716430734; x=1747966734;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pM/IaAlWzRTxjZ89oZJPhBshJzidbApJ7FLcpf/nFKI=;
  b=MegUEHBdqhVpvDa5jHVHnyyzBxt5v7tIiK+rcP78WwaQynRjyS8hPGEw
   9cbyQpdjUx51bWGh076z5OTESh/+k6Rec3NRiKcEv3gpBmphK84Oo+7Up
   fT302IqGDpbg54raPQ/xfug/p4dVex04XNy4yFFvvDWG+l9m17Kl3BQqc
   T30hc14HYbsqWjHI9jl3UsGhGby9uRnOOcW2e5Mpel/mtpGOi1qWAitvh
   Qs/JTdGT3giOTmwgAXcw36jWU5xsf99n8W5AhX+njrnoS9UyWReLntWWE
   ajNqk4HSsk0y/BoIoqAYyTxGR8d6x1PrH1hD5f4AhEcLT42Rr5oIhR75x
   w==;
X-CSE-ConnectionGUID: GnmWLN2CTG+IrKWJViPt4w==
X-CSE-MsgGUID: WC/aTY+qSeuwcvQj77LqRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15669891"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="15669891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 19:17:16 -0700
X-CSE-ConnectionGUID: trCETsVAQ+2spRIkPKK25A==
X-CSE-MsgGUID: rHew5sYeSaSezj3bJqW+3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="34040573"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 May 2024 19:17:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 19:17:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 19:17:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 19:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXBQ4LqApuCz22DZzTlQ0TZYa5zxxntekPl3QNF2la/ebEqMfFXz0dIt/I/uIacH5VEkULtPTnWpTzsaWUuonCe9iCRloUsEm5yYPLmAU6p97JxEoawEiwaWOI77KQ8JY7rQ4MZPTFRHYLoKxcPSrNFE2e15O4DyiMN+k1qX9sk9oMiTPYX7KtBuuicclr0B2AiQbkjbPBmBvs5AiLePAdfkieBwrq4KEO/4KUlrJbcKR5Ec5Rwr5OAScjkX8JalFLE1xpNtAYNBvXPf20tQ5JQSAw3hQUBtCFs/MsclR2PhiD5B2knAKbISu3pH04PN75Vm6sX9yIJ8MIS+75tY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwrkO/q3rUGr4Fzx5pV0KrpqeItbUtIPTunQ05ElNK0=;
 b=T8mTjF+L6Xnek7u8edy2tDJJ6XgGgC0ZAsRrGtRTL0Ft/82PjRGmtI7/vofJLgqoseX4ysE2gRuVJTWRH843Xl9vwwsKgB9FhZAXUtfb/Nt3D7TdKUxskM/QIDKuuifqIlPgHgwKFYyhEQaYSwzNzYNNsj4dpL90X4snrour7jAS9ly1C+V0iSTkO5Lx+wSfSE0PgoteaVHmCnvgX+JhcAoO8wNb5rgFMenF4z9XsKy5c7i825VgJ1Ndo2CayfPOH0UytvAq98G0+/gSMsOLindZVizFixRwBiW4sY1S8pHHgwlNWSm/q/f9RuwLu1+g0lJ5sWVbhyavo1YItf55lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 02:17:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:17:09 +0000
Date: Thu, 23 May 2024 10:17:02 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: <jim.cromie@gmail.com>
CC: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	<oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [jimc:dd-shrink-4b] [drm] 4558a76031: canonical_address#:#[##]
Message-ID: <Zk6nHs0WAwxdjd4g@xsang-OptiPlex-9020>
References: <202405202239.f4a4041c-oliver.sang@intel.com>
 <CAJfuBxyks0cfbi4TxYFffRr1r6n3N=GSAxVT=C_DK7MBvRjZcQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxyks0cfbi4TxYFffRr1r6n3N=GSAxVT=C_DK7MBvRjZcQ@mail.gmail.com>
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: ffeb3395-60d9-475b-9439-08dc7ace734e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHlxcldnZlAzQmFhRXpPTUNyUy92RG04ZlVna3lVZEt3dFlQbUZsNWVXT2tp?=
 =?utf-8?B?cnRJazhnYktEelc0KzFXdmFFSTloTGNEeGtHTU9nSXEvVURzRTlJRjFEaHJJ?=
 =?utf-8?B?bmVzcnZSZzFnZkhpczVDbjBzSGh0OExaVkpYQVZ2R3djSUZmNzkzKy9ZU3lC?=
 =?utf-8?B?dUYvdk1mQVhNYjdOTnZ2QlEvZVNVL0RmMEpVSDJCRDE1V1VlRjF2QTNRUDZ4?=
 =?utf-8?B?bnpHVUV6SXhBU0hVOUJVSElUUHJEWlpLM1pWRElYWXZZNGVtai9CbkZ1bFY3?=
 =?utf-8?B?QmZibk9HY3RPQ0JOZ1VrK2tyNHo5NGRQODAzcTJodkdCSk5mcHdKand3Nmt6?=
 =?utf-8?B?Wld1RnE2eFN3NExwVDU1ZGs2OGVxWTNDQmpsUU9wdWgwQys1VGdZT1poNDNS?=
 =?utf-8?B?WE9RL1BXTlZEdWZuZTZHYW9MY3E5QktnV2UxK0EzYzgyRCtPTDlOOTdiSFho?=
 =?utf-8?B?STZkZ0Z4TU0vWnBzcHVDZExMT1Z4bWV1LytNR0VpSXhiQk43YnhqNVJmQkVE?=
 =?utf-8?B?clBKVXkvR2htNnU5cXJHNUhRbEhaMmtieTE1NXVjaGd1NWhHRU1YWUJodkh3?=
 =?utf-8?B?cUdhVTZBOW92a2hzbERCeUR4UEVtb2dvcTZ2UjRJR3Z4dzJvN1I3ZFhsa0pq?=
 =?utf-8?B?dW5XNUdmbG9FcVkwQW1mUWlWa2xzcEZRc3NLN0cvUk55RFFPdmNtSGxUZVZl?=
 =?utf-8?B?OVBLOE5mcXN1S2hPR2xkT01IYzNpbVFwd0JVNWltZjBqYm1lL0NBSDZzV3I1?=
 =?utf-8?B?QmtWUjZqdXEzL2VVZWYyQnYyZFZyY3cvY2dnaVVRYjNIOUp5VlREVExFdXlv?=
 =?utf-8?B?RjRUeldBbm9vYTRFZzBIblY1TUdWVU1WTXRUWkl0N3RWMjlFMTdjTTlBa1Zj?=
 =?utf-8?B?YmhNOU1iYlVsU3AvWWJhZ0FkYjBFL1BCUGZIMlZJV1JCMXZ0djNXRWlsNVNw?=
 =?utf-8?B?YkJkOWZ4ZTdrcTMwZUovdFVOU0VUTUFaak9pdFluSC9uZndDSmhNTzJXV0hV?=
 =?utf-8?B?UmZwY0kwc0UycDVBV0l4emNldXhsTHExOW94elhtbzNEZWcrdWhaTi9FR1BN?=
 =?utf-8?B?U21aYUZuRk4rMG85TnoraDVBRHVETFNDLzZmK3lBM09PQkZzMkpVWnhmTnlK?=
 =?utf-8?B?YkZQK0xjcGRuOUt2NldnYTl3U3Joa0hSM2ZxZkVwRXp3TXc0YkgzSEN2NGRa?=
 =?utf-8?B?cFB6U3E5ZFZZRzMyLzE3OHFRNk0zUGJtb2I0L2p0S3ZDR0xhQWxLVlZwTVV6?=
 =?utf-8?B?VlBPYUYrcmVZOXRlV0hibnR5ajJ2b3g3NzBkT3ZxN2YwbXJzVm9XSUxJNzZy?=
 =?utf-8?B?MzJPV3E2UGhzT2poeWg0NWVsd3ZHRGdCY1FDVWI2cWRlWnZCRDh5dWZBNGJ1?=
 =?utf-8?B?L01vQnk1R3ljL2E1aXlWQVFHNkw1ei9CQnFTNE1ZZmlSTUk0eEFyVE1SR2Ji?=
 =?utf-8?B?VVdOaDV0YTExYTFuTWNVbkJlQUl5L3YraWcvQk5FVEYxRUhjeVB2eTZxaXRJ?=
 =?utf-8?B?V2p1ZWVDNXVyM241a3c1eEROdnZGK2M3QlNna0lqMlFUajk4eEVJdWRlZC9Q?=
 =?utf-8?B?RUVYWFAvNXZSSm5xRzE2NkR2aTZHRjNybG5YUzY0Wks0NTRCb0tpcllTb08z?=
 =?utf-8?Q?sTmHcCdUU/RvO8gq9+bRmt2RqvJV3EmZcMoq8vvwZlNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNsSDJUV2Q0NVJmTHYvYlRDUitobTMyZUxHMlVBbHVqNkgwREQ4d0ovaW1V?=
 =?utf-8?B?TXdyMFkxbjJhWC9EZTVvWG5HQ2hPbmcvZzVERVd0dDZ3eXFtYzhaV2dxWWw4?=
 =?utf-8?B?cFg1UWsvckpmb0lCWGtrZ2M3Y2JlOUUrUnZHR0RESUhLb1dXQ3hTeEs4bVRj?=
 =?utf-8?B?ZWJhT1hYbDcxVm5yc0ZLc2huNGJvUCtmY1RuZ2lsK21WWVk4NzhsbW9hSTNU?=
 =?utf-8?B?VXlWQnZOOGtGVCtZQnBMTWsvMzVka3cwVUpPYlJRTjljWTdyUWNCeVJYYmR3?=
 =?utf-8?B?bmIva3YxWHdqRy93b3pBTW93NFZ5amZHczFDK2c5cjRkd2NjODVUeDF2TitG?=
 =?utf-8?B?SXFlMWtzekMzeXBHV2RoK1JLZ3JhanVTcjJobytMaE9sSElhWHNuYU8zUmVw?=
 =?utf-8?B?b0xuSGdTWmg3ekpaZlNnZkpMVUIwclpBU0J0TzA1L2FWWk56M0JDRHBKVi85?=
 =?utf-8?B?ZkxxNi9DWFFXb2JCeUtGMmx0QVpudExTRXVUYjFsTVQyTzRjOHk1T2hURVpT?=
 =?utf-8?B?djZRbGZKY1ZtV2N0TFZaWW1leXBhc05yekgyUFh5Y2lNRXdIdWhwUFlpc3Fi?=
 =?utf-8?B?RVc4YmtvNS9HWHE4eGpGUmdFcWtiSSs4RzN1eHNLTjhJNklBdmVvYVVlbTJ2?=
 =?utf-8?B?ZlZ4UzRlTkhCN0I2bkpVU2hEZllldDNIZEJIelY5cnV2RXh3cytQRHNrdWkw?=
 =?utf-8?B?dzViRGZ4WG1wUENIZ1hSUk15ZWRDYko1aExqNTVQYUszay9VdVZQQTRncU5L?=
 =?utf-8?B?V3hzVk82RUpIZGlzT3NscXJaalI2OXdzc3J3STBBc1AxckFNbGw0K0V6cTM1?=
 =?utf-8?B?S3YrWUZuSUJwcExUazZlT2J3VHhyaVNuMmRJNGZqQ3hmaCthaWtGU0ZiSC83?=
 =?utf-8?B?SkRPSFEvS25sMEhCUjlOc0t3dGlHV0N4T09YMG5RV2RpZ3FZV1pHZHR4Zklt?=
 =?utf-8?B?TWZoOUhXWEw3aXhqa2NXZ1F3SGk2NFZtcHJKeXlVcklLMXdvOWpuQzJhNHpW?=
 =?utf-8?B?MjlNcmk3c0RtcFRUNEUvODIzK0toaXlaWG9TQUVVRGJBRW8zS2NhZGhTZHoy?=
 =?utf-8?B?Z2k0SzZ1R1RnVnJhWS9nWldMKytZR1d3aURrVWpZSVBJTGNUcEx3UlY4YmlZ?=
 =?utf-8?B?cmNuNEk5WjBCM0FabDZiamNZNHJLdFFYa2s0TGw5MWZPUE9wVDBwT3N2SVRE?=
 =?utf-8?B?bm9ya1hpTmxmVHdGajFrSXc2UEtJZDVxV0pJMHcwQThMNGtvN2dlWEdpdzFZ?=
 =?utf-8?B?eS85NUZQL1ZXTjFvRVhEcUQzcjk3UndQNis3Zy8yeUFhazhQd2JYTmpnd0cr?=
 =?utf-8?B?RUVhb3JFL2VvRUN0ejc0N1hNMmpoTlp1SWtITmtBNW1acGM1T05ic1NaTyt0?=
 =?utf-8?B?T3hxTDY3K21LOTQ0aXRnY1p2MGZteTc0cGpkVzBwbUJkTlkvMFROQjRwTXRU?=
 =?utf-8?B?QnZiN2pFNmRtcm40V1RWQVpYZldyQ0lSTVVpL2EwaVY5TmxIaDdzeHAyNGtU?=
 =?utf-8?B?N3Ztd3VLS1JIMW1oZlNzR09zd20vWHE1M291UFA5cjZBK0RnQUFKWDF1M3J6?=
 =?utf-8?B?N0tXYU9vMXNsV0c4Y09odklJVDhySVVoS2toTkkxRmtDUDhFb0hZS2w4aThv?=
 =?utf-8?B?Z2Znb0hkNGNvd0RVYXU5M0tMT001S3MwdlQ5aHVNVzBMUktlUnVnVmppalls?=
 =?utf-8?B?bUI4aUNmTEJjY1Z0UjdFSE9icXppUDBKTjJjdHZNRWxOQTZkM2pybkc0OEZN?=
 =?utf-8?B?MS9QcWFXQ0F0TzhGemxLMlNueUZmNFMwRkcxaUZjNms4M0lGdnFpKzM5cC9k?=
 =?utf-8?B?Yk4rTHd6V2hMbkd4cnFKOWRUUFp3LzE4Q3ZiTExSaXBEMjVJZGs4N0UxQzln?=
 =?utf-8?B?S00yaFFSTE5hM21CZGx4Wlg0NWVVc2pqVS9ENWRYakE0elVKenZnelF1VjFt?=
 =?utf-8?B?TzFDY3AzU2FjUjNWL1IzQWRiWnlPV2xuU2ZSaXYvZWhGTlUwTDBEWE10NE9Q?=
 =?utf-8?B?OWUzN1ltTmIrcVNTZHNyNWk1d3dtbW9uYjlsRGoyVGVSZUhDdlo0V3B1MWhj?=
 =?utf-8?B?NzJZTFhab28wL2J3eHcwODBqTERHc3c4Sk4yQVE3MXRmajJXSUdSQ3lBUk5H?=
 =?utf-8?B?alF0dDFCL0svSG5HeHJKRVlKWXJPcnZDYUxyV0RqS3ZFSEtIZDlJTkxsRi9F?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffeb3395-60d9-475b-9439-08dc7ace734e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:17:09.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amMbBg1/cbEz8ZqVuoevvtEqvTgIrwImwcdgsji6xStd6AabMPnXtbG3FNJJn/275yBdNENSNinNUvIke4L7Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
X-OriginatorOrg: intel.com

hi, Jim Cromie,

On Mon, May 20, 2024 at 02:29:58PM -0600, jim.cromie@gmail.com wrote:
> On Mon, May 20, 2024 at 8:56 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> > hi, Jim Cromie,
> >
> > we noticed this commit mentions "Time for some quality CI".
> 
> your results suggest that my concern was well placed :-}
> 
> 
> >
> > in our builds, with this commit, there is below config diff comparing to parent
> >
> > @@ -3809,6 +3809,7 @@ CONFIG_CHARLCD_BL_FLASH=y
> >  CONFIG_DRM=y
> >  CONFIG_DRM_MIPI_DSI=y
> >  CONFIG_DRM_DEBUG_MM=y
> > +CONFIG_DRM_USE_DYNAMIC_DEBUG=y
> >  CONFIG_DRM_KMS_HELPER=y
> >  CONFIG_DRM_FBDEV_EMULATION=y
> >  CONFIG_DRM_FBDEV_OVERALLOC=100
> >
> > seems this is expected, however, our tests crashed very early in this vm boot
> > test. just FYI.
> 
> it is expected.  just not the crash.
> 
> >
> >
> > Hello,
> >
> > kernel test robot noticed "canonical_address#:#[##]" on:
> >
> > commit: 4558a76031a9eeb67145f098930ab93ad66915e3 ("drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN")
> > https://github.com/jimc/linux.git dd-shrink-4b
> >
> > in testcase: boot
> >
> > compiler: gcc-8
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> >
> 
> thats an old compiler.
> does this failure mean that it passed with newer compilers ?

comilper version is also one varible in our tests.

for this test, we try on gcc-13 again, found no issue.

> 
> your reproduce scripts used to have a make-cross script
> that would download compilers from 0day into ~/0day/
> I have: $ ls ~/0day/
> clang  gcc-11.2.0-nolibc  gcc-11.3.0-nolibc  gcc-12.1.0-nolibc
> gcc-12.3.0-nolibc
> 
> has that fallen out of favor/practice ?
> I always had to fiddle a bit, partly to get it working in a
> $src/builds/foobar build dir
> but it was valuable enough to work thru,
> it often helped to recapitulate the error.

above is majorly for kbuild report. if the issue is reported for other arch,
the kbuild reproducer will download cross-compiler.

this is a runtime report, in reproducer
https://download.01.org/0day-ci/archive/20240520/202405202239.f4a4041c-oliver.sang@intel.com/reproduce

make -j$(nproc) HOSTCC=gcc-8 CC=gcc-8 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules

if there is no gcc-8 on your machine, it will just fail.


> 
> I will see if I have it laying about here, and give it a try if so.
> 
> 
> 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > +------------------------------------------------+------------+------------+
> > |                                                | 4b46e0eb84 | 4558a76031 |
> > +------------------------------------------------+------------+------------+
> > | canonical_address#:#[##]                       | 0          | 5          |
> > | KASAN:null-ptr-deref_in_range[#-#]             | 0          | 5          |
> > | RIP:strcmp                                     | 0          | 5          |
> > | Kernel_panic-not_syncing:Fatal_exception       | 0          | 5          |
> > +------------------------------------------------+------------+------------+
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202405202239.f4a4041c-oliver.sang@intel.com
> >
> >
> > [    2.369822][    T1] Performance Events: unsupported p6 CPU model 42 no PMU driver, software events only.
> > [    2.371877][    T1] signal: max sigframe size: 1776
> > [    2.374336][    T1] rcu: Hierarchical SRCU implementation.
> > [    2.375469][    T1] rcu:     Max phase no-delay instances is 1000.
> > [    2.379182][   T14] Callback from call_rcu_tasks_trace() invoked.
> > [    2.404850][    T1] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> > [    2.405774][    T1] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> > [    2.405774][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc7-00032-g4558a76031a9 #1 b53ab647344fd548777e89e94e688e5f78e75cb7
> > [    2.405774][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [ 2.405774][ T1] RIP: 0010:strcmp (kbuild/src/consumer/lib/string.c:265)
> > [ 2.405774][ T1] Code: 83 ec 08 49 bd 00 00 00 00 00 fc ff df eb 0a 48 89 ef 84 db 74 5a 4c 89 e6 48 89 f8 48 89 fa 48 8d 6f 01 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 04 84 c0 75 50 48 89 f0 48 89 f2 0f b6 5d
> > All code
> > ========
> >    0:   83 ec 08                sub    $0x8,%esp
> >    3:   49 bd 00 00 00 00 00    movabs $0xdffffc0000000000,%r13
> >    a:   fc ff df
> >    d:   eb 0a                   jmp    0x19
> >    f:   48 89 ef                mov    %rbp,%rdi
> >   12:   84 db                   test   %bl,%bl
> >   14:   74 5a                   je     0x70
> >   16:   4c 89 e6                mov    %r12,%rsi
> >   19:   48 89 f8                mov    %rdi,%rax
> >   1c:   48 89 fa                mov    %rdi,%rdx
> >   1f:   48 8d 6f 01             lea    0x1(%rdi),%rbp
> >   23:   48 c1 e8 03             shr    $0x3,%rax
> >   27:   83 e2 07                and    $0x7,%edx
> >   2a:*  42 0f b6 04 28          movzbl (%rax,%r13,1),%eax               <-- trapping instruction
> >   2f:   38 d0                   cmp    %dl,%al
> >   31:   7f 04                   jg     0x37
> >   33:   84 c0                   test   %al,%al
> >   35:   75 50                   jne    0x87
> >   37:   48 89 f0                mov    %rsi,%rax
> >   3a:   48 89 f2                mov    %rsi,%rdx
> >   3d:   0f                      .byte 0xf
> >   3e:   b6 5d                   mov    $0x5d,%dh
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   42 0f b6 04 28          movzbl (%rax,%r13,1),%eax
> >    5:   38 d0                   cmp    %dl,%al
> >    7:   7f 04                   jg     0xd
> >    9:   84 c0                   test   %al,%al
> >    b:   75 50                   jne    0x5d
> >    d:   48 89 f0                mov    %rsi,%rax
> >   10:   48 89 f2                mov    %rsi,%rdx
> >   13:   0f                      .byte 0xf
> >   14:   b6 5d                   mov    $0x5d,%dh
> > [    2.405774][    T1] RSP: 0000:ffff888100a37c50 EFLAGS: 00010246
> > [    2.405774][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81501477
> > [    2.405774][    T1] RDX: 0000000000000000 RSI: ffffffff84755280 RDI: 0000000000000000
> > [    2.405774][    T1] RBP: 0000000000000001 R08: 0000000000000001 R09: 000000009999999b
> > [    2.405774][    T1] R10: fffffbfff0c356d8 R11: ffffffff861ab6c7 R12: ffffffff86191610
> > [    2.405774][    T1] R13: dffffc0000000000 R14: 0000000000000000 R15: ffff888100a37d74
> > [    2.405774][    T1] FS:  0000000000000000(0000) GS:ffff8883af000000(0000) knlGS:0000000000000000
> > [    2.405774][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.405774][    T1] CR2: ffff88843ffff000 CR3: 00000000050ed000 CR4: 00000000000406f0
> > [    2.405774][    T1] Call Trace:
> > [    2.405774][    T1]  <TASK>
> > [ 2.405774][ T1] ? show_regs (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:479)
> > [ 2.405774][ T1] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421)
> > [ 2.405774][ T1] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:461)
> > [ 2.405774][ T1] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:702 kbuild/src/consumer/arch/x86/kernel/traps.c:644)
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240520/202405202239.f4a4041c-oliver.sang@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
> 
