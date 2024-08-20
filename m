Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA2210185
	for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724133942; cv=fail; b=e+gn5yrzWD5qbO+wcesnUoESP4BNjKXeE6WPqLyD7aH/pMMtSUSICFmC6bFcFLjmM58X6TmNwDjJKEotDyF+QZ8svutEVPDSKfd0u78i+mkNUx5AlYpxzAKwv0tL31VSBXdLooeTVrzSL7wGQXU51MY1VIJG8ksEKHTbyRv/3g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724133942; c=relaxed/simple;
	bh=ipC1vJhtanyKdH4OZU2T1BGdiDFYbKoRKnXLku7ArL8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HO4TG86ydBTM9AYg9Kg849vwy0uihcsevqfxo/XwpQ1FIYbztnMEg0nKPq+HSPqsFu+1oWlWBuFJvxpAXmicc8/Mqu9xrGWCZB/TYHR3QH593GNdeoahax8r4GiVYYJ1vONTujVTTa4qA8AifjYl/p8WKznuTECGhIGS2pJndEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbL3N6ed; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbL3N6ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724133940; x=1755669940;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ipC1vJhtanyKdH4OZU2T1BGdiDFYbKoRKnXLku7ArL8=;
  b=EbL3N6edvTg9XhG5aYgPFSO8L6BEKk2u3NTHcsMgVwQVcGdSp318dcN+
   164PQOBZSdcGYKemXakrYHmkVTnErhwK3TxxwiQqX0CfAVQ9vp3H3jSrT
   pXMVCb5/z2oO8xwuU3oy0t6t3LB9KIqFqJXrn/FA5NXnFSEUl9QZ8mlCS
   c06GbAPxj5m3hgofVb2NisYaonzQ6/S8AOac9FFuDtWOvU18aw62agOR8
   lgVFU/l1iN1VzZErDffz37lAuD6C3rdKK6d+5AT5pbLGhqoa6hW0qGGBr
   NkxjZhgk+ziXXHp8xX6c6VEkKVzsGJ5P/c2hJkLr+Gwc0MpHqWLaYo5+a
   g==;
X-CSE-ConnectionGUID: LSoTEX3fTQGWXPvYQae1/w==
X-CSE-MsgGUID: cBW6HQl4RhWEqONfDdxz0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33077431"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="33077431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 23:05:38 -0700
X-CSE-ConnectionGUID: ioogwdYKR/aIYx8l7vGYSw==
X-CSE-MsgGUID: TmMcXmffSDSIc7VMIQ4hSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65432757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Aug 2024 23:05:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 23:05:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 23:05:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 23:05:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 23:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upYQo4bShNIQ6wmfUlE79otCWlzDi8m2YvKl4vOdoS5APM4Skt4iRuZPXIqqi6jY8zh3GHkK46MiNM1OkJplL8AEbx4OXF2Mg9mhYUHbltFtf9O1GPgFLJyIIrmSJXo8swoHO0PPohT4tcup/PXTNkkoEZGKZF5G6c3vZDeWTWzVLmpi/x1fZT6w9+lZ9kiIFIPnXkDyA3tcLcRltXc96wNmqDsvEo4jcrKAr/BJyfQ4RQXmxJPxo0JPRTO4WfQTfTms0QTdjvIqlCzsZzww7rWPupEdjJGNi7aX+NVJ9pK/WFAjySS6Nqg5rilO26GBokao0dg3peXSIsQq8llFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BORfoaXdDrLnQm2LKd2XcFHuW2xBLaElJnZCxLGHmDo=;
 b=qRU2DajbD4+SRox8jkTRBNhh0nftLfbF2HeSEe0hM1K1hd4K5kl4x6mmBMO11/NqKlCOHEU3I50zv6prMyEOOGZojzF8+Q7/zGRnHoKj7tU56y1giuC0A5HwDwl6ImlqWp8DO+g+vPIRVs54uxQo5/t/Ab9yi+L9zBRNSLAIlHkhRJAVYE3XK9Sr32cJXsKyedy/L0g5KA9NWfrLkvVrsHpc3j+J68ufoSQLBTAAzpslVLY7NgmrmBNw0h8eaoWoJowPEvdqyBCqbUCv05QTFFjdbHIrQuZs8qcig7ztHTBs7li/zgdy00O+Ct5rK1dsjFxxOY6qffGbLeemuMUh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Tue, 20 Aug
 2024 06:05:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:05:33 +0000
Date: Tue, 20 Aug 2024 14:05:23 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, kbuild test robot <lkp@intel.com>, Mateusz Guzik
	<mjguzik@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Mel Gorman
	<mgorman@suse.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Lorenzo
 Stoakes" <lstoakes@gmail.com>, <pedro.falcato@gmail.com>,
	<oliver.sang@intel.com>
Subject: Re: Need your help to check perf of a patch on different archs
Message-ID: <ZsQyI/087V34JoIt@xsang-OptiPlex-9020>
References: <CAJuCfpFsMjxh0kHnt4crwXRVh6_FoO=GXMwrqed-i+mFk-kmTQ@mail.gmail.com>
 <Zr2zuS5BLeJQB20e@xsang-OptiPlex-9020>
 <CAJuCfpHpmaJybByGoBUUVvs9k7_s0gBdOaOVG5G3OePwB66fBw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHpmaJybByGoBUUVvs9k7_s0gBdOaOVG5G3OePwB66fBw@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d608ec-f768-404a-47b7-08dcc0de1a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qi9xS01HVUNtTGlkemVtWUpOTXJKWHM1d2dQV29mcUQzaUhQRDZDN1lvQWln?=
 =?utf-8?B?OFRlYkt0c1hFbjJnSTJpZERMR3pYclhjYnZzYkt5YXcyQ1JaMFdNTEFVNS9v?=
 =?utf-8?B?cWdOSk5CcTVGZTdwUTk4RVBDQm0vOG9yYlJweUduaE9FLzZZQ3phZUhlbkVv?=
 =?utf-8?B?UkZTN2V1VVk5cVdKWW1SRUYwR0QrWGR5cjNOU3cwckRmN1NBanRJOWV5R0VN?=
 =?utf-8?B?ZDBLUm9wRis4c3BnZzFFRTZkbDYrclNENEVFTU0yNWlEb2JMelRDOU9ra1Nn?=
 =?utf-8?B?SlJBOHVwVWpYaXI5a01IREoyZjhqakpMSTJqSVZwMUJ1VUhmbExGQ3AwVFBt?=
 =?utf-8?B?Nzh6UVBjNy9IbEJwMlBlRlNJS25leU01eG9Wa3VodUVGaVZ3a2RubWZ1UHQw?=
 =?utf-8?B?RHNvOVBqem5OUitCMTJiOWQ0VDV1dEFUeEpuR29JcEMvUk1JNVd3aEJ0K3V2?=
 =?utf-8?B?K3kvNmdMdzZvSlFnaHVsSWtPdkR3Qkl1YzhjNmVSS0xBOFhHZkNPLzZ4bVp1?=
 =?utf-8?B?Tk91enlnbHllUXZheTU4UzQ2ei90eC9DSnRydGgwcDJSTSs3QjdZUHQ2NXRJ?=
 =?utf-8?B?RnRBZENlMWREaktjUFpQNS9VUUdFbzQvejhQczRJNnJiK3VnWmVBQ3FnSW04?=
 =?utf-8?B?a0tweFhTakVyRnNHeVhEM0k3N0hZa2ZhbmxmTk1ndXlSU2QrK0V1ay80WjFU?=
 =?utf-8?B?UTR5citLT2poaEl5elNSbVZ5d2ZvR3VtZVJhYXFvbGltc3pnTzhzZDQycHRs?=
 =?utf-8?B?UjZRd3dBZXljeEF5OXZOSUkyMHpUUmlwK1FKMFJDK09BTkJMN0xGSzdrSlJQ?=
 =?utf-8?B?Nm5hZ0FUSlN2a3RVeldQM214RkNRWm9FTGxlbkxrWU5DQkZEdTVtVTZodWpY?=
 =?utf-8?B?b3VvTzQ4TlN3MC9SVDNtaVNrV0RxZzdmYmtldUdhYlY0dHpVN3RGKzliZGM5?=
 =?utf-8?B?WDQ0M1ZMUjhTKzdjWUl5cnh0d1dCc2sxU1JnK0RNTE40cS9vU2JJZnhVWWdJ?=
 =?utf-8?B?ZE5weUJCWk1GQ2pZTzNxWDRxa1NCMmp2eXBSc2tKVWt5dmd4U0h0YkRhOTRn?=
 =?utf-8?B?dUpoQVZpZEtHNWZNTkNoT0dzTm50dGJ2Q3QydDhOdmthVklvcVRzNUxiTEhi?=
 =?utf-8?B?T0NRdlZTZ2xUVEM1RFM1OTcyYWtZQ0NIZ2lrazZMczFkRzlwOUJ4cVB4all3?=
 =?utf-8?B?eGlRck5zWHRkbE1KRzhFWG5BbVZFdmFVbkRaSjBTWWVRRnRiMWRZbEhnaDR0?=
 =?utf-8?B?K2duN0x6dkM4N3Uvbmk2L3duTnpmWDc4OFBwU1NFbmFyN3BzYkE0ZU8vcXFk?=
 =?utf-8?B?QUpabXNXbmJjeXFVSlI0dm1FZ0YzWUdRTmRYN3J2V2dQU2NEU2g3QnlRQ3ZP?=
 =?utf-8?B?dWJMaFNDTEk4cWFQRDNYL0wyUWFzaEdHclNwTFJLczdQb0NmSGlQdG5TaGZs?=
 =?utf-8?B?ejI1NWZ4ME90ZlcrZ1FFeDFZTmxOVXVZY2txVngvNnBFQnVGMzNITG56NWFm?=
 =?utf-8?B?UVc3MVFiTHRVSDd1K0k2ZTIxRFM3bUhRU3lGOWo5WTJZYzM0dUpvUEhRSnph?=
 =?utf-8?B?MU1HYkFjMFdZMkgzelZxc2VyNmJyaGNDaHk0cTVSWjRsN3dDWHNnemRqbmN0?=
 =?utf-8?B?RmhQRGhMa29RM0VPV0VSdWpXczJTOEwrNmliVyswUndaODNQbE83bGsvUEkx?=
 =?utf-8?B?Qk1ybTkySWVaOU52T0xTK3pzOEZieTRxbGVsTjZjcE5mSnVKQmQycElsZlBz?=
 =?utf-8?Q?GpLDghl7MNMyqHg1bBC8pX26VGcJBBBjHhyoEGT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDcrUkhlUGVOc0ZzVENNYjFsNEthNnNQS0p6WGZ6ZmpwZWZ2bWoyTHpNM0pB?=
 =?utf-8?B?aTZuNWNXMFhHM0o4MkdoOHduU0FLYTlTS2JHbURLczFmL3c2Nzd2Q0F4Z1NP?=
 =?utf-8?B?MHFiK0hxazNGR0I0OHNzSUpyRHlHVlV5Y1FnMkl4eFVBVW1OU2JsbnpSMzlz?=
 =?utf-8?B?QzNtYU9CRVRaZXFyUXg4UFRrT1RKNUVHTFBacloxTHRZV1pZa3RpaHRjMS9Z?=
 =?utf-8?B?VE5TblQ1cGdhV3pDWFV3cEQ1aHowNklEaUIyZUZ5VDRWanFnSUJhK3dYYllZ?=
 =?utf-8?B?bGQ5aWVHSE1XWnBsK0xvcFBFcUlVcFM4YVZsVEY0TnNOSEpSSWdJODdrK1Ew?=
 =?utf-8?B?Mm5vQVVMdktPK2oxRjloM05KcnRPZENNd2pORzkzeHRDeWE5UDJTdCtEVEVB?=
 =?utf-8?B?UStXcHpHYi9QWEdEczVCNUZ4Y2gzV1gveTh6c0NMRGlLTm5uY3VsZmxXczE3?=
 =?utf-8?B?MEJ6S1pXejNmKzdVTGR4ZUFDWVlpc2tnNENzWXJreS8wU2g0aUd0cW5NMG93?=
 =?utf-8?B?cnI3OTJJZFpONERQQ0R2WnBRNWxvQnREUXhXNUJSZ1NaMVZ6THFXc0JSaE9L?=
 =?utf-8?B?NU9YU2Q1RnFWVUsvekt0dTc2SlNyY1RMRnRraUFQZ3dBNkFkcXFYdDhYaVY3?=
 =?utf-8?B?ZFN0SVFJVlJweXJ2YUc3dllSdHgwcVhKZWZFdFdNQ2tDanpmU2RNM3pDTkZM?=
 =?utf-8?B?MlRkbVlsZGFqdFhFRjk4VlNyVERUYTBRbTdBS3UyZS9RWTB1eWw4bFN1UXE5?=
 =?utf-8?B?L0Y1ZUFXeDZKUmtqSkVKVXF0b09Ob201dlhLNXdEcml2MUlxSTlYMG5WMjZT?=
 =?utf-8?B?UExweHJvUkFNYzlnbWpWaGVBQ2xpVkxEcUgrUTdrNU0xSHdqSlE4TkduNDNL?=
 =?utf-8?B?QXVESDRmaXpzdDJzRG9rcEpJMW9xT04ycTVad05ISjR2bFJUMGlyaDIzQUZx?=
 =?utf-8?B?Sk1zZHJFN0hpRUtCSzJ5eG5iaEcyQVZHT21qdENTZUUyVUVUbjFsYTBPdkFV?=
 =?utf-8?B?V0UycjUwL1JuTG1GcVlGYkRLRHN6aTFoV3FGVHVQUFdhV1VUNGZXOHB1Sjd1?=
 =?utf-8?B?UWRqanV1MTBvSm10SWhSVktWSFo2UExyZDhZYWthR05IQmJWSk9waWFRNnQ3?=
 =?utf-8?B?aVdQZUdDaUZ4MnhobDhubVR4QkMrcWptcWRnNlREWTlOdloveXVzNXdoRTN5?=
 =?utf-8?B?NCtTdDI2YURmb1o0YnFTanF4VkJ6KzFldWlSRUVobGhuMWVMQUR1THluZlI4?=
 =?utf-8?B?aFcwOWdrK1M3RlJpZ2xUdDFZeFRTclVqajF3dU5aUUtweGJOOWNvVWdKeU12?=
 =?utf-8?B?V2hucnY0QW5oTWNLQWh3UzJyaDlDN2VrRVBiWENYTThXNzZMOThLZWQ4S3Zn?=
 =?utf-8?B?Wm1YOG13RmxNLzNqRHRoeE1vSlZPdW9QU3EvSHo0U29NMXdicFRDSjJzSFVF?=
 =?utf-8?B?aVkzcmNpcG1ZdGw3UytFdkZadE5UczRqSWVUMWppY1JCRFBhSU5pbDV1M2Ft?=
 =?utf-8?B?SEZuVTBYYVc5clUzbC90SytvT3ZQOFlkd1N0ZDdCV1ZCZGVoQlBlQ1UrcFhK?=
 =?utf-8?B?UFlyQ01zYUZlamgyeEYzNUNDWFRsMmFZVWRyVWNYaHNIS2ZUUEVkM2RjNmlD?=
 =?utf-8?B?M2VVcUMyNVRBZnh6bHNSQ09FR1JnYVoyOVE4U0lNSnVvYWEvNkVLc0loUFZM?=
 =?utf-8?B?V1pxdlBGc0FleFpjY2VpSmhRUmxpTHlWSzNQUUMrTU1Da04zSGptdDI5MGZo?=
 =?utf-8?B?b0VLTHhjUzRzYVQzVGs3eXEwSlNGWmxoL09NRVNDUEtidXBrbFF6LzA0R05v?=
 =?utf-8?B?dTFvUDlteFpxTXlza2tITktNL0pndWJQeEwzS2FFK3BOTU8yUkpGWTdIQkJD?=
 =?utf-8?B?OFgwdFFmUkIya0R1ZndBY1NjZFB5LzRFWktjaU41a2xQZmV5dFNmZ29lZjFz?=
 =?utf-8?B?K1JrMWZQbERWckZEM1VxbTZuclhqNHVwa3lXNHBRQ3BKbEYzY2dOdFI0cU5E?=
 =?utf-8?B?TTlsT3FqaHFkdnl1QTFtcVVOa3hVZGMrTTlLV3Jka1RtWS9ydy9QY2EvbFhi?=
 =?utf-8?B?dG9vdnVnb3Nvd05kWGMwY2IwQzhGMk5MRlJxMk05QXhaMGtiV0p6dFFCK2lw?=
 =?utf-8?B?cVNSTlhxTDg2dmx4MEFzTnBOY1ptZ3dxRzlWTUZXZHgvcDg0UWluMzdUbzU2?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d608ec-f768-404a-47b7-08dcc0de1a46
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 06:05:33.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J5s0KcroEw/UWLLUspeSJF/crmeFg+M4DusCjqqncanSUShTTJkfyGY/NulHiAxN3Y81U46zGIlpgEs4df4VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com

hi, Suren Baghdasaryan,

On Thu, Aug 15, 2024 at 06:47:17AM -0700, Suren Baghdasaryan wrote:
> On Thu, Aug 15, 2024 at 12:52 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Suren Baghdasaryan,
> >
> > On Wed, Aug 14, 2024 at 12:53:52PM -0700, Suren Baghdasaryan wrote:
> > > Hi Oliver and LKP folks,
> > > In the thread [1] Mateusz and I were investigating performance
> > > regression caused by adjacent cacheline prefetching when we try to
> > > move vm_lock into vm_area_struct. Mateusz thinks that my Broadwell
> > > machine is the reason this regression is so pronounced and other
> > > microarchitectures would not suffer as much. Would it be possible to
> > > use your infrastructure to check that claim?
> > > In technical terms what I need is to get results of PFT (pagefault
> > > test) benchmark from mmtests suite [2] with and w/o the patch from [1]
> > > from different microarchitectures. If your infra is not setup to run
> > > PFT then any test that measures pagefault path performance would do.
> > > Please let me know if you can help me collect this data and if you
> > > need additional information.
> > > Thanks,
> > > Suren.
> > >
> > > [1] https://lore.kernel.org/all/20240808185949.1094891-1-mjguzik@gmail.com/
> >
> > what's the base? I tried to apply it upon latest mainline.
> > 1fb918967b56d Merge tag 'for-6.11-rc3-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> >
> > but fail
> 
> Hi Oliver,
> Sorry about that. I think it was applied over mm-unstable. Attaching
> the patch that cleanly applies over the latest Linus' ToT
> (1fb918967b56).

we applied patch upon 1fb918967b56, found 9 platforms to run pft [3]
(unfortunately, we don't have Broadwell machine now)

we run pft with two different configs - nr_task: 50% or 100%
runtime keeps as 300s

we run 5 times for either commit.
the kpi for pft is 'faults_per_sec_per_cpu'

we didn't observe obvious difference between with or without the patch.

detail as below:

Note:
withou patch: is just 1fb918967b56
with patch: 1fb918967b56 + your patch

if a score without %stddev such like '±  2%', it's stable enough in 5 runs.

nr_task: 100%; runtime: 300s
score: pft.faults_per_sec_per_cpu
    | without patch    | diff   |  with patch       |
cfl      395921          +0.2%        396605
cpl      268973          -1.5%        264893
csl      140541          -0.2%        140287
emr      472371          -1.6%        464810 ±  3%
icl      594309          +0.1%        594814
ivb      297344          -0.1%        296974
skl      202097          -0.0%        202066
spr      548786          -0.0%        548599
srf       72326 ±  2%    -2.2%         70722 ±  3%


nr_task: 50%; runtime: 300s
score: pft.faults_per_sec_per_cpu
    | without patch    | diff   |  with patch       |
cfl      628827          -0.7%        624471
cpl      284404          +0.6%        285996
csl      275373          +0.6%        276898
emr      471360          +0.3%        472990
icl     1013376          -0.3%       1009945
ivb      549976          +0.1%        550649
skl      410946          -0.0%        410821
spr      564251          +1.3%        571402
srf       72290          -3.4%         69847 ±  5%




[3]
1. Coffee Lake (cfl)
model: Coffee Lake
nr_node: 1
nr_cpu: 16
memory: 32G
brand: Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz

2. Cooper Lake (cpl)
model: Cooper Lake
nr_node: 4
nr_cpu: 224
memory: 192G
brand: Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz

3. Cascade Lake (csl)
model: Cascade Lake
nr_node: 2
nr_cpu: 96
memory: 512G
brand: Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz

4. Emerald Rapids (emr)
model: Emerald Rapids
nr_node: 4
nr_cpu: 256
memory: 256G
brand: INTEL(R) XEON(R) PLATINUM 8592+

5. Ice Lake (icl)
model: Ice Lake
nr_node: 2
nr_cpu: 64
memory: 256G
brand: Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz

6. Ivy Bridge-EP (ivb)
model: Ivy Bridge-EP
nr_node: 2
nr_cpu: 48
memory: 64G
brand: Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz

7. Skylake (skl)
model: Skylake
nr_node: 2
nr_cpu: 104
memory: 192G

8. Sapphire Rapids (spr)
model: Sapphire Rapids
nr_node: 2
nr_cpu: 224
memory: 512G
brand: Intel(R) Xeon(R) Platinum 8480CTDX

9. Sierra Forest (srf)
model: Sierra Forest
nr_node: 2
nr_cpu: 256
memory: 128G

> 
> >
> > > [2] https://github.com/gormanm/mmtests
> >
> > we don't have a test for this repo, but we noticed
> > https://github.com/gormanm/mmtests/tree/master/shellpack_src/src/pft
> > points to https://github.com/gormanm/pft
> >
> > we have a test named as 'pft' just use this https://github.com/gormanm/pft
> > is it ok to use it directly for your purpose?
> 
> Yes, that's the one.
> Thanks,
> Suren.
> 
> >
> > thanks

> From 1e9e4a3c58ff7db3c5abcdaf00657e1397f70f44 Mon Sep 17 00:00:00 2001
> From: Mateusz Guzik <mjguzik@gmail.com>
> Date: Thu, 8 Aug 2024 20:59:49 +0200
> Subject: [PATCH 1/1] vm: align vma allocation and move the lock back into the
>  struct
> 
> ACHTUNG: this is more of a request for benchmarking than a patch
> proposal at this stage
> 
> I was pointed at your patch which moved the vma lock to a separate
> allocation [1]. The commit message does not say anything about making
> sure the object itself is allocated with proper alignment and I found
> that the cache creation lacks the HWCACHE_ALIGN flag, which may or may
> not be the problem.
> 
> I verified with a simple one-liner than on a stock kernel the vmas keep
> roaming around with a 16-byte alignment:
> # bpftrace -e 'kretprobe:vm_area_alloc  { @[retval & 0x3f] = count(); }'
> @[16]: 39
> @[0]: 46
> @[32]: 53
> @[48]: 56
> 
> Note the stock vma lock cache also lacks the alignment flag. While I
> have not verified experimentally, if they are also romaing it would mean
> that 2 unrelated vmas can false-share locks. If the patch below is a
> bust, the flag should probably be added to that one.
> 
> The patch has slapped-around vma lock cache removal + HWALLOC for the
> vma cache. I left a pointer to not change relative offsets between
> current fields. I does compile without CONFIG_PER_VMA_LOCK.
> 
> Vlastimil says you tested a case where the struct got bloated to 256
> bytes, but the lock remained separate. It is unclear to me if this
> happened with allocations made with the HWCACHE_ALIGN flag though.
> 
> There is 0 urgency on my end, but it would be nice if you could try
> this out with your test rig.
> 
> 1: https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/T/#u
> ---
>  include/linux/mm.h       | 18 +++++++--------
>  include/linux/mm_types.h |  9 ++++----
>  kernel/fork.c            | 47 ++++------------------------------------
>  mm/userfaultfd.c         |  6 ++---
>  4 files changed, 19 insertions(+), 61 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c4b238a20b76..e5c2dd410750 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -687,7 +687,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> +	if (unlikely(down_read_trylock(&vma->vm_lock) == 0))
>  		return false;
>  
>  	/*
> @@ -702,7 +702,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
>  	if (unlikely(vma->vm_lock_seq == smp_load_acquire(&vma->vm_mm->mm_lock_seq))) {
> -		up_read(&vma->vm_lock->lock);
> +		up_read(&vma->vm_lock);
>  		return false;
>  	}
>  	return true;
> @@ -711,7 +711,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  static inline void vma_end_read(struct vm_area_struct *vma)
>  {
>  	rcu_read_lock(); /* keeps vma alive till the end of up_read */
> -	up_read(&vma->vm_lock->lock);
> +	up_read(&vma->vm_lock);
>  	rcu_read_unlock();
>  }
>  
> @@ -740,7 +740,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
>  	if (__is_vma_write_locked(vma, &mm_lock_seq))
>  		return;
>  
> -	down_write(&vma->vm_lock->lock);
> +	down_write(&vma->vm_lock);
>  	/*
>  	 * We should use WRITE_ONCE() here because we can have concurrent reads
>  	 * from the early lockless pessimistic check in vma_start_read().
> @@ -748,7 +748,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
>  	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
>  	 */
>  	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> -	up_write(&vma->vm_lock->lock);
> +	up_write(&vma->vm_lock);
>  }
>  
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> @@ -760,7 +760,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  
>  static inline void vma_assert_locked(struct vm_area_struct *vma)
>  {
> -	if (!rwsem_is_locked(&vma->vm_lock->lock))
> +	if (!rwsem_is_locked(&vma->vm_lock))
>  		vma_assert_write_locked(vma);
>  }
>  
> @@ -827,10 +827,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
>  
>  extern const struct vm_operations_struct vma_dummy_vm_ops;
>  
> -/*
> - * WARNING: vma_init does not initialize vma->vm_lock.
> - * Use vm_area_alloc()/vm_area_free() if vma needs locking.
> - */
>  static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  {
>  	memset(vma, 0, sizeof(*vma));
> @@ -839,6 +835,8 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>  	vma_mark_detached(vma, false);
>  	vma_numab_state_init(vma);
> +	init_rwsem(&vma->vm_lock);
> +	vma->vm_lock_seq = -1;
>  }
>  
>  /* Use when VMA is not part of the VMA tree and needs no locking */
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 485424979254..e247c5d31756 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -615,10 +615,6 @@ static inline struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  }
>  #endif
>  
> -struct vma_lock {
> -	struct rw_semaphore lock;
> -};
> -
>  struct vma_numab_state {
>  	/*
>  	 * Initialised as time in 'jiffies' after which VMA
> @@ -706,7 +702,7 @@ struct vm_area_struct {
>  	 * slowpath.
>  	 */
>  	int vm_lock_seq;
> -	struct vma_lock *vm_lock;
> +	void *vm_dummy;
>  #endif
>  
>  	/*
> @@ -759,6 +755,9 @@ struct vm_area_struct {
>  	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef CONFIG_PER_VMA_LOCK
> +	struct rw_semaphore vm_lock ____cacheline_aligned_in_smp;
> +#endif
>  } __randomize_layout;
>  
>  #ifdef CONFIG_NUMA
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 18bdc87209d0..5dd9ab122802 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -435,35 +435,6 @@ static struct kmem_cache *vm_area_cachep;
>  /* SLAB cache for mm_struct structures (tsk->mm) */
>  static struct kmem_cache *mm_cachep;
>  
> -#ifdef CONFIG_PER_VMA_LOCK
> -
> -/* SLAB cache for vm_area_struct.lock */
> -static struct kmem_cache *vma_lock_cachep;
> -
> -static bool vma_lock_alloc(struct vm_area_struct *vma)
> -{
> -	vma->vm_lock = kmem_cache_alloc(vma_lock_cachep, GFP_KERNEL);
> -	if (!vma->vm_lock)
> -		return false;
> -
> -	init_rwsem(&vma->vm_lock->lock);
> -	vma->vm_lock_seq = -1;
> -
> -	return true;
> -}
> -
> -static inline void vma_lock_free(struct vm_area_struct *vma)
> -{
> -	kmem_cache_free(vma_lock_cachep, vma->vm_lock);
> -}
> -
> -#else /* CONFIG_PER_VMA_LOCK */
> -
> -static inline bool vma_lock_alloc(struct vm_area_struct *vma) { return true; }
> -static inline void vma_lock_free(struct vm_area_struct *vma) {}
> -
> -#endif /* CONFIG_PER_VMA_LOCK */
> -
>  struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  {
>  	struct vm_area_struct *vma;
> @@ -473,10 +444,6 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>  		return NULL;
>  
>  	vma_init(vma, mm);
> -	if (!vma_lock_alloc(vma)) {
> -		kmem_cache_free(vm_area_cachep, vma);
> -		return NULL;
> -	}
>  
>  	return vma;
>  }
> @@ -495,10 +462,8 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	 * will be reinitialized.
>  	 */
>  	data_race(memcpy(new, orig, sizeof(*new)));
> -	if (!vma_lock_alloc(new)) {
> -		kmem_cache_free(vm_area_cachep, new);
> -		return NULL;
> -	}
> +	init_rwsem(&new->vm_lock);
> +	new->vm_lock_seq = -1;
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  	vma_numab_state_init(new);
>  	dup_anon_vma_name(orig, new);
> @@ -510,7 +475,6 @@ void __vm_area_free(struct vm_area_struct *vma)
>  {
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
> -	vma_lock_free(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>  
> @@ -521,7 +485,7 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
>  						  vm_rcu);
>  
>  	/* The vma should not be locked while being destroyed. */
> -	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock->lock), vma);
> +	VM_BUG_ON_VMA(rwsem_is_locked(&vma->vm_lock), vma);
>  	__vm_area_free(vma);
>  }
>  #endif
> @@ -3186,10 +3150,7 @@ void __init proc_caches_init(void)
>  			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
>  			NULL);
>  
> -	vm_area_cachep = KMEM_CACHE(vm_area_struct, SLAB_PANIC|SLAB_ACCOUNT);
> -#ifdef CONFIG_PER_VMA_LOCK
> -	vma_lock_cachep = KMEM_CACHE(vma_lock, SLAB_PANIC|SLAB_ACCOUNT);
> -#endif
> +	vm_area_cachep = KMEM_CACHE(vm_area_struct, SLAB_PANIC|SLAB_ACCOUNT|SLAB_HWCACHE_ALIGN);
>  	mmap_init();
>  	nsproxy_cache_init();
>  }
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e54e5c8907fa..0390fde88751 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -92,7 +92,7 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
>  		 * mmap_lock, which guarantees that nobody can lock the
>  		 * vma for write (vma_start_write()) under us.
>  		 */
> -		down_read(&vma->vm_lock->lock);
> +		down_read(&vma->vm_lock);
>  	}
>  
>  	mmap_read_unlock(mm);
> @@ -1468,9 +1468,9 @@ static int uffd_move_lock(struct mm_struct *mm,
>  		 * See comment in uffd_lock_vma() as to why not using
>  		 * vma_start_read() here.
>  		 */
> -		down_read(&(*dst_vmap)->vm_lock->lock);
> +		down_read(&(*dst_vmap)->vm_lock);
>  		if (*dst_vmap != *src_vmap)
> -			down_read_nested(&(*src_vmap)->vm_lock->lock,
> +			down_read_nested(&(*src_vmap)->vm_lock,
>  					 SINGLE_DEPTH_NESTING);
>  	}
>  	mmap_read_unlock(mm);
> 
> base-commit: 1fb918967b56df3262ee984175816f0acb310501
> -- 
> 2.46.0.76.ge559c4bf1a-goog
> 

