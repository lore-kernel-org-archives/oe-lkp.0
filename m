Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED092110F
	for <oe-lkp@lists.linux.dev>; Fri, 31 May 2024 03:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717125357; cv=fail; b=S7CT8/efGcjSEazskom2j8a5QCs4mVTrmHf6p9c8IXieB5TkvTxyXL47Tkm3ONbZiXF2jDC2QKhy9mAF2xGrTjkP0wbd2egwOpV/RGyRWjX9gC/gWRjSPik09EnkzMsuvZsFUMBafnXjcaExz1WAuFOGtjzH79RJ7UJT+z0VLx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717125357; c=relaxed/simple;
	bh=zePGUPZ0taXG2ua+8F9QzU5x28LJSyZbKwWIn9/MkeM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DlW9L3+UmtRBi/ms+z1lVlY28X7H+s5SqaDzW9THYmdkMlNFqMI3D30aKWW3UPpocxEOX70Du135IwQV7atWPW6HL6/DSy63tGj4Zycb+Tlj8sRxQPnyxj9F+6UOo/duWaDZgWhxuFOHigioUshSL35nb8xhgrseT8Mw/qMQrsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXOP9B5r; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXOP9B5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717125355; x=1748661355;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zePGUPZ0taXG2ua+8F9QzU5x28LJSyZbKwWIn9/MkeM=;
  b=BXOP9B5rikHl0HX6AUcaFAPDJl6erHNH3cNyE0MvcHEpwzo9fs8pZvTu
   YBB7ERrLAz+nyHvAim7vl63RNHZAxnbLPs86H14Sa1+lA6XPzkUJkCLYL
   t3HU9WMWM5fwz4i4ffxIKK7aZhPl3eKHR9Y//oleyHQbthnL6TXUyXrnx
   PW2Qcwxkj+9/W9qpUDig6iMDLNsf7hR4kz63MChSZKBU9YNnBYjgSBhoN
   qLdK03QALXOTaNaynDSs9p7wxrESzo7YRbpb0eCYOCsjHNvU60sa1sEHS
   AsGn/rgY2eQZTp+mbAZjl39fJhjUf/vcxcABiELH/DXAjE7WO+aGPOLFn
   w==;
X-CSE-ConnectionGUID: Ii+FAqBdRXGcH3ekeTvfcA==
X-CSE-MsgGUID: DKPzy+ucSsiERWliCRLBIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31148803"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="31148803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 20:15:54 -0700
X-CSE-ConnectionGUID: PyayhR/iSOSWqdVohC2cmg==
X-CSE-MsgGUID: eflOZH7eQfOCxvUeBAOgHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="41093865"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 May 2024 20:15:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 20:15:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 20:15:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 20:15:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 20:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmkfPzbFhTaZMcmWcvOhUFgOOLGbZBikN26UTdjNh19Hm00I6ATtlzgoo7e9LNOsisp61A79YnT5bvoQR9XF59u+oxBE6XwB/tCXt875GN0BTBFPClsQj7Oxk/bcdyDerVF37TonqJLryH62bza2f5IEWO4tM8eVOMx0N/ldARxWyrim62eGA0NJqOo/L4EYkDW5JahMOlaArvmFSDKZ0xluNHTLZiZcGdgnjKlW/Xnl0YPl7Krvj7jwxRRykkXJj1igkrFY73a6GaFA/seYisVXTQ8wQJOnJYQKbkY+d6W2JRlCEzg0RkuJ+hYnQHYH+mSKrERZDFIVPGGouu/u2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlLrDQmV9aJIsC86jKADz66jF0dKwsMRdW7wB/QbNpM=;
 b=JOQCYApLQs5uaIj4IF3C1HOzT7CzffCiGQ+UuREaISW3OTm7+tVYd0c682UdoMNj/RUi7P9pSDq5LFEV3Pq5gh0Lcs2awh9EvhYrcU4sCzlYhy3bwNbrYkb32ykP/EmYMf2WEO6bN0e3LOX6qiw1hhpM0cEm19ryyXT7mRdohp7u6Hb3Mnx6V3Ib+QljHTI/gaK4gF40k6gXwmGQXGCUbX/3yY8do7LKg56pqEG5uQTsYfZTkhijqpV7PudkkrY4Rw25NjNigWI/eRh8VXZq8eY78+1CTjEb4gg+fcqts8nFJdLo564HFw3Fmpj8zHK9XMXVa1Ga2upw/cBEyahhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7844.namprd11.prod.outlook.com (2603:10b6:610:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 03:15:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Fri, 31 May 2024
 03:15:47 +0000
Date: Fri, 31 May 2024 11:15:39 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
X-ClientProxiedBy: KL1PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:820:f::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: ba26056e-7c98-4b9a-1221-08dc811ff708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGkvTWptaXZrQUR6aGdyNmNwRXhlUitlY1pDZ1diUlhYcjFYc2tlK09JaG5S?=
 =?utf-8?B?VFB0YjBaT0ZNcGhjMTJmdmcvY1lZWEdZWDUrbUVzWWFsV04rRDRZUVMxd0ZW?=
 =?utf-8?B?MmlKOHBPYmduanVPWEJWWnZMclZNRCs0aElGUVVTbUJCc013YzUwaFNmVmFz?=
 =?utf-8?B?MkgwdDRhbUgyeDkrRHM4ZmdYV2lteXJkMmxhNGVLbnpPaE1GL0tCd3JhUjlh?=
 =?utf-8?B?NndCV0szR2gvcXpWNXFTMEcrRnNEN2xNN3ZZQW4rbmNaZjhNMW9tUG1GQUs5?=
 =?utf-8?B?QlpjWll6SDQ4T0E0RzA5V2ZQbklaSGRJVEw4VnhZMXRXSTI1SEhBZW5HWGJ6?=
 =?utf-8?B?ak9FbzQzS1ZjeFdlM2RzNFlJZWZYSW1KOUxOUC9EdCtHWVhvSUp6NjVFODB5?=
 =?utf-8?B?VWw3Mk41aDYzV0NVNVJWdFI2RnkyWDN0RzNnWENIOXlac1NqdUtTeDczTndm?=
 =?utf-8?B?c1h2NmhTWlFOWFNOQU1ZY3YySE1INHk1aDIySDRmM3ovK0l6YWxOOENmZGhk?=
 =?utf-8?B?VTA3QWNSNExJSWJxeUsvcDFETjVaOG4xQ0tZdVg3NkJyYXNTOUZnZWw1YnF3?=
 =?utf-8?B?cHRKN0d6VGdBbE1KazRqV3F5aTY0VklHazJPcXZ5NFBQL1h1SkpXZmdaT0dC?=
 =?utf-8?B?UlJTbklrbVREZUJhNVJHWHkvN3FyZ0ZlMHExdHZ2Qi9aaGVsYlJMNEJUNDVT?=
 =?utf-8?B?OUNUSkZjNDNMWUllVEh4YzllajA5ODh3YnFwZUdMM0RXcW0raEVrRlpyNTNK?=
 =?utf-8?B?bFBtL0RWMHJSd0p4ZmlkUzF4OE1OdVMyWGxIdGIydHRycWo3K3JabDJLS2Nu?=
 =?utf-8?B?dzFtb1JNMFRhNFNIbXUzcmVreGg0Y0V1Vi9SSHdOYzBqVk9qM2xrNXl6MXBW?=
 =?utf-8?B?NDFxbXpwajhwMjVMWHdMOE9jN1hSZlRqYVhHKzlrRHBxRUd4WndESld4Qmta?=
 =?utf-8?B?Q0lYN1Y4M1RQOG1lY1c4MnpVVWpuRXdBQStOYndRM1NCaDRhdE41SUEwcU9I?=
 =?utf-8?B?anJMVGFYa0NhaTAyU21GcFBSeWkxYmdGd1NYQ3E4aEt5eDlTNEVaZkVWZ3da?=
 =?utf-8?B?TmhlaWhISkFMMFFUaFJBUzZhNG1ieGUyb25Hdlo5dHgvaWREY3RSQXlUTnpp?=
 =?utf-8?B?SEp0SDlRL1dCUloyM3MvOUZ2QzlIeUpGZjIwQnJsYkF2TUYwTVpBdU9yM2ll?=
 =?utf-8?B?OEFZbHRLR1ZhV2NGMUdVREdwY2I3WCtIeHkyOWIyKzZiRGI3MlRCNTNQMys4?=
 =?utf-8?B?cWFzMytZMzduWng3NVh4K3k0dTA5aXYvOUdRNzhKVUt6QlExbmdFWkF0bno2?=
 =?utf-8?B?Z3RJM0oyODVPS29lcTlweU90cVlQT2k5dmNDUFZCMEpEb1JhVCsxSTUwUFFv?=
 =?utf-8?B?VjZ0ckFZdHFyZU9sQXRJdU9oWW1UL2k3TWxQR0pSWmg4NlR0WnplOVZrc3p4?=
 =?utf-8?B?ZFh3NWZpeHQ1QlZVNkpQZ3JrSG5KSWJrN0t2Z3BxbnlNd0V5RE9pci9HY0x0?=
 =?utf-8?B?RnJEM3FRSXZMV2l1MWVzTmcrT21WSmFKK21ZMS9DNVRDcU1UMXQ5SjhKd25N?=
 =?utf-8?B?Vm1JNkhuNDE0ZTVwaU9jQnAzQTI2Umc2N25MZHl2VFYyRkJCZlpUMVRSeis3?=
 =?utf-8?Q?L40rNK3kHE3wbIEDSx5tFbGKOuFN6Y24XaN2jbbKjUGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xxckdYM2FtZXlwSzFhb3gzRkt2czNIVStwb0Y3dEJLSTA5RXhVaGxzbUgw?=
 =?utf-8?B?SkVRMDBCV1pORmtEK0NieEdKQ0luNUsrSzc4WWJSK1NscStoZXIzM0lJc3Ev?=
 =?utf-8?B?UkN6U2w1NjBGd1Y2YXRyNVFPM1Y5bEdyN2lsaGt2bXFRbFpIUXUwazU5bW1S?=
 =?utf-8?B?UjdmejFnQk5LT2VFR1A1b0E5cWRwTHg2Rm1WRkdEZUFrcmJBcVdGOWxJakhZ?=
 =?utf-8?B?T2ordUtlWmNqdFRLYUoyVGorWUMxelh6OVVxTGl3bU9TZ3lNMVpBQlpmRXNZ?=
 =?utf-8?B?UitPd1FOMkVMOGdneVFmOTdFN0d2R2V0QU54ODd1YWlNOEFOVzlvd2JmbVF3?=
 =?utf-8?B?TjJ0eGVEeGQxakxWajJVbFJod2dIMW1QSXAvbm5IV21QdTZURkxtcmFQRHdw?=
 =?utf-8?B?bXBLa2d4YkRFamZ3Tjh5MTBOcm5ZcU4wSjVSSjhBaU5xWW5MOWZ4RXZJaUd2?=
 =?utf-8?B?Y0RXRk9SS3V6aFBycFkwTlFaTGl6eFZQU2dZVnNCakwyZGVMUmwyendvTlps?=
 =?utf-8?B?cHBsTzBWZmllWFJwZVdRVEtFS3BNeFhnb3Q0cXlEWTNtYkdWTk1QSVVRNnhJ?=
 =?utf-8?B?ZFJ5UVlJaUx2WG1zZ2djVnNscW9tSEJVZkprbUhaazRGdXhWaVN2VkNvejlD?=
 =?utf-8?B?NWw3RXk3S3YzNHl2WDd2QWpBTnJuNlFWM1A0TEg2Qy9NQmZWWDZwKy9MNHlL?=
 =?utf-8?B?MHo5eTNKSmZjZFVuWTI3Nk1vcmFDdmhpRS94ZFVXRXdqbE40TWhHTXYyZnZk?=
 =?utf-8?B?TTRPN2R2VFgyaTR5eE9PUzRMYTlDN1ovcEdNdFZWaVRDNlR2OGdrTllnR0Np?=
 =?utf-8?B?VlYxVW5uOXNzRkJJVVJ5YmRZeXJUYW9qeFFUcHVRU1IwczhkN0pxbTN2RmpR?=
 =?utf-8?B?NHR1dXdBUGdCS3lJMGMzeFJPYVRXVWJWMEtpUTYycTZtNGlKREJPOWRFMWlB?=
 =?utf-8?B?eDhNd0RhUjIzN01DOVRFVGJOV0RRTDZFcEgxb25NZUVVemN6Vm1FMlVmZVJz?=
 =?utf-8?B?K0ZhR3NDZElxN0FtK1d0OEhTRVN2ZGtKZ09oVkRVcGs1M3ZFWWVLV3BvWGNV?=
 =?utf-8?B?S1RYakZhQnlyeW1IVmNHNUVObG9iMWNpUmxjTGszUVcyVmJpa3RseGtKSVgv?=
 =?utf-8?B?dk9Ga01MTUxXTzJkRUo2UmdOUHV3RVFuUDdVcTR3YzZZODdiMTNxNndCQkg1?=
 =?utf-8?B?THd6bWFKdkZjR3QreSt0bE5qTGRxQzh5UjRDZENTSk5PZXV1aTk5RUVnbTNO?=
 =?utf-8?B?VktET1d6MG10RUNGR1BweDU0cnZHcTBETG5EUlVyQ0pRN1hwV3FpNmhvektv?=
 =?utf-8?B?cmxTRThsbG5Uc1djVEJCVWhwMURpWkhNUUZDVnVBVlM3b040bG5QanM1alVH?=
 =?utf-8?B?UjFJeEwvMHpxZmNLTlVQVUI1YStUZGsxRGNWdTFMekloRWcwVkphN1o3V1JL?=
 =?utf-8?B?M0l5d1BvellXM3MxNlpGMlhKMnJVNWtYcDUvMFlIM2w3SVVXbVhPVVhLa045?=
 =?utf-8?B?ZlE4cmc3R2ZneUtaWEpENi9DUHhEeno2QWJXaUFVWVdYMm5iVG9HZ3NqUXo5?=
 =?utf-8?B?Q0lwT3MrMnZNM0lsKzZMLzA2cm93RTZhVUFEQVBKMzBBU1IveDBlK0UzbnJD?=
 =?utf-8?B?VEpkU1EyRi9KREVXNS9jSW4wQjhkWnhvQ0E1aDhuYjJQOUc3NDI0S3hNU0xw?=
 =?utf-8?B?czZRS1NsZUY0UytpSWU4dGRraGY1MGE5SFJydjNNaGNLSGZPajZJcUc0eWhN?=
 =?utf-8?B?dEVxUlptYW5Wd1BZWEFwT2RXL016NW9nM0IxckFRRitIWDBObFBWRjZ2eFhW?=
 =?utf-8?B?a09Gd1BpR2xqT1Q2TzVBd3pjdG5LZDlqcHF0bnREeVhnN2lVUG9hVlVpc0dl?=
 =?utf-8?B?dmwrTGtsTGtaRFR6U3BhWGRDSnpHRU0zRFYxRDFxc3Z3Um5taWZZNVdxaGFD?=
 =?utf-8?B?UXpyYUYzRng0Q1BvS0lSZmdBcHZ2N2xUNkNMNzk4eXRvTXErb1daY002U1F6?=
 =?utf-8?B?RVg5MEdSYm51VU9uMDgxbTZOUGFrU25GeVVadm8zVi9UaEJHSkV1b0xHNStN?=
 =?utf-8?B?NXJ5a3V5RXo0NXduaVo2bEgvU3gyOWxIb0FmU2RLcjczYk56RmRobGdsZ3Bn?=
 =?utf-8?B?WGRuNXJ3YXlCZHZVczBoSjZITTlZQWxaa2l5d2FMcjRsWmllRldXS1pSUFZ1?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba26056e-7c98-4b9a-1221-08dc811ff708
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 03:15:47.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkN/yXULqICw6CeTb99vx0klZsp5NOCN8hVhRgYyiKJNDxuXCt4gopfJAaEl56B7ARMXClV2hbP4QJeKr0rZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7844
X-OriginatorOrg: intel.com

hi, Amir,

On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> On Wed, May 29, 2024 at 11:26 AM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -7.9% regression of unixbench.throughput on:
> >
> >
> > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
> > https://github.com/amir73il/linux sb_write_barrier
> >
> 
> Jan,
> 
> I speculate that the regression is due to the fact that we store and pass the
> path information on struct file_range on the stack before the optimizations
> in fsnotify_parent(), so rw_verify_area() pays some price for the stores
> and __fsnotify_parent() pays a bigger price for fetches?
> 
> Luckily, we already have the way to check
> fsnotify_sb_has_priority_watchers(inode->i_sb,
>                                                FSNOTIFY_PRIO_PRE_CONTENT))
> so now I used it to optimize out the fsnotify_file_range() inline
> code entirely.
> 
> Oliver,
> 
> Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> 
> * a82fd282befc - (fan_pre_content) fanotify: report file range info
> with pre-content events
> * f301cd18006c - fanotify: rename a misnamed constant
> * 64108c0b47db - fanotify: pass optional file access range in pre-content event
> * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> * 83af0c89527a - fsnotify: generate pre-content permission event on exec
> * aca408421327 - fsnotify: generate pre-content permission event on open
> * 93656e196b00 - fsnotify: introduce pre-content permission event
> 
> The optimization was done in the first commit (fsnotify: introduce
> pre-content permission event),
> but impacts the regressing commit (fanotify: pass optional file access
> range in pre-content event).
> no need to test all middle commits.

I directly compare the tip with v6.10-rc1, still a regression but better now

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  a82fd282befc7 ("fanotify: report file range info with pre-content events")

       v6.10-rc1 a82fd282befc71d99106bf31066
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 1.216e+08            -3.9%  1.168e+08        unixbench.throughput

full data is as below [1]


then I checked new "64108c0b47db - fanotify: pass optional file access range in pre-content event"

it also has a small regression comparing to its parent, but better also.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
  64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")

94167e071109d573 64108c0b47db91b20d658a89969
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 1.163e+08            -2.4%  1.135e+08        unixbench.throughput

full data is as below [2]


[1]

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  a82fd282befc7 ("fanotify: report file range info with pre-content events")

       v6.10-rc1 a82fd282befc71d99106bf31066
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
      1614 ±  6%    +252.4%       5688 ± 67%  numa-vmstat.node1.nr_mapped
      6199            -5.8%       5841        time.user_time
    220234 ± 13%    +121.4%     487546 ± 41%  numa-meminfo.node0.AnonPages.max
    836146 ±  6%     -36.0%     535267 ± 45%  numa-meminfo.node1.AnonPages.max
      6233 ±  7%    +251.3%      21898 ± 69%  numa-meminfo.node1.Mapped
 1.216e+08            -3.9%  1.168e+08        unixbench.throughput
      6199            -5.8%       5841        unixbench.time.user_time
 4.513e+10            -3.9%  4.338e+10        unixbench.workload
 1.458e+11            -2.7%  1.419e+11        perf-stat.i.branch-instructions
     11.47 ±  6%      +2.6       14.10 ±  9%  perf-stat.i.cache-miss-rate%
   3915539 ±  8%    +510.0%   23884093 ±  9%  perf-stat.i.cache-misses
  32425619 ±  3%    +396.4%   1.61e+08 ±  4%  perf-stat.i.cache-references
    151202 ± 16%     -78.6%      32364 ± 56%  perf-stat.i.cycles-between-cache-misses
 6.961e+11            -1.9%  6.828e+11        perf-stat.i.instructions
      1.22            -1.3%       1.20        perf-stat.i.ipc
      0.01 ±  9%    +519.5%       0.04 ± 10%  perf-stat.overall.MPKI
      0.01            +0.0        0.01        perf-stat.overall.branch-miss-rate%
     12.09 ±  6%      +2.8       14.86 ±  8%  perf-stat.overall.cache-miss-rate%
      0.75            +2.0%       0.77        perf-stat.overall.cpi
    133775 ±  8%     -83.5%      22060 ±  9%  perf-stat.overall.cycles-between-cache-misses
      1.33            -1.9%       1.31        perf-stat.overall.ipc
      5721            +2.0%       5836        perf-stat.overall.path-length
 1.452e+11            -2.7%  1.413e+11        perf-stat.ps.branch-instructions
   3921138 ±  8%    +507.4%   23818053 ±  9%  perf-stat.ps.cache-misses
  32415461 ±  3%    +394.4%  1.603e+08 ±  4%  perf-stat.ps.cache-references
 6.932e+11            -1.9%  6.797e+11        perf-stat.ps.instructions
 2.582e+14            -1.9%  2.532e+14        perf-stat.total.instructions
     13.19            -0.7       12.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      7.01            -0.2        6.80        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.11            -0.2        0.91        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.write
      2.50            -0.1        2.35        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      1.68            -0.1        1.59        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.73            -0.1        3.64        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.62            -0.1        1.55        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      2.18            -0.1        2.12        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      0.65            -0.1        0.60 ±  2%  perf-profile.calltrace.cycles-pp.w_test
      0.92            -0.0        0.87        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.70            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.86            -0.0        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
      0.92            -0.0        0.88        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.63            -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.86            -0.0        0.83        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      3.53            -0.0        3.50        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
      0.68            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.53            -0.0        0.51        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.write
      0.72            -0.0        0.71        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.75            +0.0        0.77        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      1.13            +0.0        1.17        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      5.30            +0.1        5.36        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      5.30            +0.1        5.38        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      6.17            +0.1        6.27        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     96.84            +0.1       96.98        perf-profile.calltrace.cycles-pp.write
      0.78 ±  2%      +0.3        1.13 ±  5%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      2.97            +0.6        3.57        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
     12.01            +0.6       12.62        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      3.63            +0.6        4.24        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      4.32            +0.6        4.96        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.28            +0.8       38.12        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
     84.26            +1.0       85.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     13.39            +1.0       14.36        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.30            +1.0       13.30        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
     82.83            +1.0       83.86        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     57.94            +1.3       59.20        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.99            +1.3        7.25 ±  3%  perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
     78.13            +1.3       79.41        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     74.26            +1.3       75.59        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      7.43            -0.4        7.06        perf-profile.children.cycles-pp.entry_SYSCALL_64
      4.42            -0.2        4.18        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.21            -0.2        1.00        perf-profile.children.cycles-pp.syscall_return_via_sysret
      7.14            -0.2        6.94        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      4.18            -0.2        4.00        perf-profile.children.cycles-pp.__cond_resched
      2.74            -0.2        2.58        perf-profile.children.cycles-pp.apparmor_file_permission
      2.42            -0.1        2.30        perf-profile.children.cycles-pp.rcu_all_qs
      3.82            -0.1        3.72        perf-profile.children.cycles-pp.__fsnotify_parent
      1.74            -0.1        1.65        perf-profile.children.cycles-pp.up_write
      1.99            -0.1        1.90        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.99            -0.1        0.91        perf-profile.children.cycles-pp.w_test
      3.71            -0.1        3.64        perf-profile.children.cycles-pp.security_file_permission
      2.47            -0.1        2.41        perf-profile.children.cycles-pp.xas_load
      1.12            -0.1        1.06        perf-profile.children.cycles-pp.folio_wait_stable
      1.26            -0.1        1.21        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.75            -0.0        0.71        perf-profile.children.cycles-pp.x64_sys_call
      0.98            -0.0        0.94        perf-profile.children.cycles-pp.aa_file_perm
      0.46            -0.0        0.42        perf-profile.children.cycles-pp.write@plt
      1.10            -0.0        1.07        perf-profile.children.cycles-pp.xattr_resolve_name
      0.36            -0.0        0.34        perf-profile.children.cycles-pp.amd_clear_divider
      3.76            -0.0        3.73        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      0.59            -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
      3.41            -0.0        3.38        perf-profile.children.cycles-pp.__vfs_getxattr
      0.56            -0.0        0.53        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.05            -0.0        1.03        perf-profile.children.cycles-pp.folio_mapping
      0.38            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
      0.25            -0.0        0.24        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      0.36            -0.0        0.35        perf-profile.children.cycles-pp.is_bad_inode
      1.38            +0.0        1.40        perf-profile.children.cycles-pp.strcmp
      0.93            +0.0        0.95        perf-profile.children.cycles-pp.folio_mark_dirty
      1.07            +0.0        1.09        perf-profile.children.cycles-pp.timestamp_truncate
      5.70            +0.0        5.75        perf-profile.children.cycles-pp.simple_write_end
     98.96            +0.1       99.02        perf-profile.children.cycles-pp.write
      5.69            +0.1        5.75        perf-profile.children.cycles-pp.fault_in_readable
      6.42            +0.1        6.53        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.89            +0.3        1.24 ±  4%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      3.39            +0.6        3.97        perf-profile.children.cycles-pp.inode_needs_update_time
     12.35            +0.6       12.96        perf-profile.children.cycles-pp.__generic_file_write_iter
      3.96            +0.6        4.57        perf-profile.children.cycles-pp.file_update_time
      4.56            +0.8        5.33        perf-profile.children.cycles-pp.rw_verify_area
     38.16            +0.8       39.01        perf-profile.children.cycles-pp.generic_perform_write
     13.58            +1.0       14.54        perf-profile.children.cycles-pp.simple_write_begin
     84.67            +1.0       85.63        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     12.68            +1.0       13.68        perf-profile.children.cycles-pp.__filemap_get_folio
     83.50            +1.0       84.51        perf-profile.children.cycles-pp.do_syscall_64
     58.52            +1.3       59.78        perf-profile.children.cycles-pp.generic_file_write_iter
      6.18            +1.3        7.44 ±  3%  perf-profile.children.cycles-pp.filemap_get_entry
     78.74            +1.3       80.00        perf-profile.children.cycles-pp.ksys_write
     75.13            +1.3       76.42        perf-profile.children.cycles-pp.vfs_write
      7.25            -0.6        6.64        perf-profile.self.cycles-pp.vfs_write
      6.45            -0.4        6.08        perf-profile.self.cycles-pp.write
      4.32            -0.2        4.08        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.21            -0.2        1.00        perf-profile.self.cycles-pp.syscall_return_via_sysret
      6.98            -0.2        6.78        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      4.52            -0.2        4.36        perf-profile.self.cycles-pp.__filemap_get_folio
      2.34            -0.1        2.22        perf-profile.self.cycles-pp.__cond_resched
      1.90            -0.1        1.78        perf-profile.self.cycles-pp.do_syscall_64
      1.60            -0.1        1.50 ±  2%  perf-profile.self.cycles-pp.apparmor_file_permission
      1.47            -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
      1.62            -0.1        1.53        perf-profile.self.cycles-pp.up_write
      3.65            -0.1        3.56        perf-profile.self.cycles-pp.__fsnotify_parent
      1.09            -0.1        1.02        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.80            -0.1        1.74        perf-profile.self.cycles-pp.xas_load
      0.79            -0.1        0.73        perf-profile.self.cycles-pp.w_test
      1.10            -0.1        1.04        perf-profile.self.cycles-pp.security_file_permission
      1.25            -0.1        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.66            -0.1        1.60        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.41            -0.0        1.36        perf-profile.self.cycles-pp.rcu_all_qs
      0.90            -0.0        0.86        perf-profile.self.cycles-pp.simple_write_begin
      0.88            -0.0        0.84        perf-profile.self.cycles-pp.aa_file_perm
      0.80            -0.0        0.76        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.62            -0.0        0.59        perf-profile.self.cycles-pp.x64_sys_call
      1.39            -0.0        1.36        perf-profile.self.cycles-pp.__vfs_getxattr
      0.53            -0.0        0.51        perf-profile.self.cycles-pp.folio_wait_stable
      0.87            -0.0        0.85        perf-profile.self.cycles-pp.folio_mapping
      0.56            -0.0        0.53        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.24            -0.0        0.22        perf-profile.self.cycles-pp.amd_clear_divider
      0.12 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.write@plt
      0.25            -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
      0.35            -0.0        0.34        perf-profile.self.cycles-pp.inode_to_bdi
      0.22            -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_folio
      0.66            +0.0        0.69        perf-profile.self.cycles-pp.file_update_time
      1.03            +0.0        1.06        perf-profile.self.cycles-pp.strcmp
      2.75            +0.0        2.79        perf-profile.self.cycles-pp.simple_write_end
      0.72            +0.0        0.77        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.87            +0.1        0.92        perf-profile.self.cycles-pp.timestamp_truncate
      5.54            +0.1        5.59        perf-profile.self.cycles-pp.fault_in_readable
      2.04            +0.1        2.09        perf-profile.self.cycles-pp.file_remove_privs_flags
      1.51            +0.2        1.69        perf-profile.self.cycles-pp.inode_needs_update_time
      0.78 ±  2%      +0.3        1.11 ±  5%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.84            +1.0        1.82        perf-profile.self.cycles-pp.rw_verify_area
      3.66            +1.3        4.97 ±  4%  perf-profile.self.cycles-pp.filemap_get_entry


[2]

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
  64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")

94167e071109d573 64108c0b47db91b20d658a89969
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
     38903 ±113%    +313.8%     160973 ± 66%  numa-meminfo.node1.AnonHugePages
   1666466 ±  4%     -12.2%    1462703 ±  9%  numa-numastat.node1.local_node
     18.97 ±113%    +314.3%      78.59 ± 66%  numa-vmstat.node1.nr_anon_transparent_hugepages
      6003            -5.6%       5668        time.user_time
 1.163e+08            -2.4%  1.135e+08        unixbench.throughput
      6003            -5.6%       5668        unixbench.time.user_time
 4.314e+10            -2.3%  4.215e+10        unixbench.workload
    -12.17           +33.7%     -16.26        sched_debug.cpu.nr_uninterruptible.min
      0.00 ± 95%    +600.3%       0.00 ± 88%  sched_debug.rt_rq:.rt_time.avg
      0.02 ± 95%    +600.3%       0.14 ± 88%  sched_debug.rt_rq:.rt_time.max
      0.00 ± 95%    +600.3%       0.01 ± 88%  sched_debug.rt_rq:.rt_time.stddev
 1.407e+11            -2.0%  1.379e+11        perf-stat.i.branch-instructions
      0.55            -0.0        0.51 ±  4%  perf-stat.i.branch-miss-rate%
  55780077           -85.5%    8078438        perf-stat.i.branch-misses
   5029827 ±  6%    +315.5%   20897838 ± 10%  perf-stat.i.cache-misses
  35311245 ±  2%    +328.2%  1.512e+08 ±  6%  perf-stat.i.cache-references
    118639 ± 18%     -61.7%      45421 ± 41%  perf-stat.i.cycles-between-cache-misses
 6.736e+11            -1.5%  6.634e+11        perf-stat.i.instructions
      0.01 ±  6%    +321.2%       0.03 ± 10%  perf-stat.overall.MPKI
      0.04            -0.0        0.01        perf-stat.overall.branch-miss-rate%
      0.78            +1.5%       0.79        perf-stat.overall.cpi
    103942 ±  6%     -75.7%      25208 ± 10%  perf-stat.overall.cycles-between-cache-misses
      1.29            -1.5%       1.27        perf-stat.overall.ipc
   1.4e+11            -1.9%  1.373e+11        perf-stat.ps.branch-instructions
  55517704           -85.5%    8057745        perf-stat.ps.branch-misses
   5026889 ±  6%    +315.3%   20876882 ± 10%  perf-stat.ps.cache-misses
  35229110 ±  2%    +327.6%  1.506e+08 ±  6%  perf-stat.ps.cache-references
 6.701e+11            -1.4%  6.608e+11        perf-stat.ps.instructions
 2.496e+14            -1.4%   2.46e+14        perf-stat.total.instructions
      3.61            -0.5        3.09        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      2.66            -0.5        2.18        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
     12.62            -0.5       12.16        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      7.29            -0.3        7.03        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      4.98            -0.2        4.74        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.96            -0.2        6.74        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      4.50            -0.2        4.33        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      3.74            -0.2        3.58        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
     12.82            -0.2       12.66        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.04            -0.1        0.91        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.write
      2.87            -0.1        2.78        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
      5.27            -0.1        5.18        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.81            -0.1        0.75        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      2.17            -0.0        2.13        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
      1.66            -0.0        1.62        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.74            -0.0        0.70        perf-profile.calltrace.cycles-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      1.27            -0.0        1.23        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      0.84            -0.0        0.81        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
      0.61            -0.0        0.57        perf-profile.calltrace.cycles-pp.w_test
      0.88            -0.0        0.86        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.90            -0.0        0.87        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.61            -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.68            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.71            -0.0        0.69        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.00 ±  4%      +0.1        1.10 ±  3%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      2.68            +0.1        2.79        perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.18            +0.1        5.31        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      6.00            +0.1        6.14        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      3.35            +0.1        3.48        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
      4.00            +0.1        4.14        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
     96.95            +0.2       97.12        perf-profile.calltrace.cycles-pp.write
      3.68            +0.2        3.86        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     84.87            +0.6       85.45        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
     83.48            +0.6       84.10        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     78.96            +0.7       79.70        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     75.00            +0.8       75.81        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     58.04            +1.1       59.14        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     36.40            +1.2       37.55        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
     12.88            +1.3       14.20        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     11.79            +1.3       13.13        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      5.74            +1.4        7.16 ±  2%  perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      3.98            -0.5        3.44        perf-profile.children.cycles-pp.security_file_permission
      2.90            -0.5        2.40        perf-profile.children.cycles-pp.apparmor_file_permission
      7.66            -0.3        7.38        perf-profile.children.cycles-pp.file_remove_privs_flags
      7.14            -0.3        6.89        perf-profile.children.cycles-pp.entry_SYSCALL_64
      5.34            -0.2        5.10        perf-profile.children.cycles-pp.rw_verify_area
      7.10            -0.2        6.88        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      3.98            -0.2        3.80        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      4.73            -0.2        4.56        perf-profile.children.cycles-pp.security_inode_need_killpriv
     13.16            -0.2       13.00        perf-profile.children.cycles-pp.__generic_file_write_iter
      1.14            -0.1        1.01        perf-profile.children.cycles-pp.syscall_return_via_sysret
      5.67            -0.1        5.56        perf-profile.children.cycles-pp.simple_write_end
      3.56            -0.1        3.46        perf-profile.children.cycles-pp.__vfs_getxattr
      4.04            -0.1        3.95        perf-profile.children.cycles-pp.__cond_resched
      4.21            -0.1        4.14        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.31            -0.1        2.24        perf-profile.children.cycles-pp.rcu_all_qs
      0.99            -0.1        0.93        perf-profile.children.cycles-pp.folio_mark_dirty
      2.46            -0.0        2.42        perf-profile.children.cycles-pp.xas_load
      0.93            -0.0        0.88 ±  2%  perf-profile.children.cycles-pp.w_test
      1.50            -0.0        1.46        perf-profile.children.cycles-pp.strcmp
      1.72            -0.0        1.68        perf-profile.children.cycles-pp.up_write
      0.87            -0.0        0.82        perf-profile.children.cycles-pp.setattr_should_drop_suidgid
      1.04            -0.0        1.00        perf-profile.children.cycles-pp.folio_mapping
      0.96            -0.0        0.92        perf-profile.children.cycles-pp.aa_file_perm
      1.23            -0.0        1.20        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.73            -0.0        0.70        perf-profile.children.cycles-pp.x64_sys_call
      1.07            -0.0        1.05        perf-profile.children.cycles-pp.folio_wait_stable
      0.43            -0.0        0.41 ±  2%  perf-profile.children.cycles-pp.write@plt
      1.08            -0.0        1.06        perf-profile.children.cycles-pp.xattr_resolve_name
      0.35            -0.0        0.34        perf-profile.children.cycles-pp.__x64_sys_write
     99.01            +0.0       99.04        perf-profile.children.cycles-pp.write
      1.12 ±  4%      +0.1        1.20 ±  2%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      2.86            +0.1        2.97        perf-profile.children.cycles-pp.down_write
      5.50            +0.1        5.63        perf-profile.children.cycles-pp.fault_in_readable
      3.75            +0.1        3.88        perf-profile.children.cycles-pp.inode_needs_update_time
      4.34            +0.1        4.47        perf-profile.children.cycles-pp.file_update_time
      6.25            +0.1        6.39        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      3.77            +0.2        3.96        perf-profile.children.cycles-pp.__fsnotify_parent
     85.29            +0.6       85.86        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     84.14            +0.6       84.74        perf-profile.children.cycles-pp.do_syscall_64
     79.57            +0.7       80.28        perf-profile.children.cycles-pp.ksys_write
     75.84            +0.8       76.64        perf-profile.children.cycles-pp.vfs_write
     58.64            +1.1       59.72        perf-profile.children.cycles-pp.generic_file_write_iter
     37.30            +1.1       38.43        perf-profile.children.cycles-pp.generic_perform_write
     13.05            +1.3       14.38        perf-profile.children.cycles-pp.simple_write_begin
     12.18            +1.3       13.52        perf-profile.children.cycles-pp.__filemap_get_folio
      5.94            +1.4        7.35 ±  2%  perf-profile.children.cycles-pp.filemap_get_entry
      1.77            -0.4        1.35 ±  2%  perf-profile.self.cycles-pp.apparmor_file_permission
      6.23            -0.3        5.94        perf-profile.self.cycles-pp.write
      6.94            -0.2        6.71        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      7.14            -0.2        6.93        perf-profile.self.cycles-pp.vfs_write
      1.13            -0.1        1.01        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.49 ±  3%      -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
      4.12            -0.1        4.03        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.42            -0.1        0.34        perf-profile.self.cycles-pp.cap_inode_need_killpriv
      2.17            -0.1        2.10        perf-profile.self.cycles-pp.file_remove_privs_flags
      1.08            -0.1        1.02        perf-profile.self.cycles-pp.security_file_permission
      1.83            -0.1        1.77        perf-profile.self.cycles-pp.do_syscall_64
      2.74            -0.1        2.68        perf-profile.self.cycles-pp.simple_write_end
      0.86            -0.0        0.81        perf-profile.self.cycles-pp.aa_file_perm
      1.60            -0.0        1.56        perf-profile.self.cycles-pp.up_write
      1.42            -0.0        1.38        perf-profile.self.cycles-pp.__vfs_getxattr
      0.86            -0.0        0.82        perf-profile.self.cycles-pp.folio_mapping
      1.36            -0.0        1.32        perf-profile.self.cycles-pp.rcu_all_qs
      0.52            -0.0        0.49        perf-profile.self.cycles-pp.folio_mark_dirty
      1.78            -0.0        1.75        perf-profile.self.cycles-pp.xas_load
      1.23            -0.0        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.74            -0.0        0.71        perf-profile.self.cycles-pp.setattr_should_drop_suidgid
      0.74            -0.0        0.71 ±  2%  perf-profile.self.cycles-pp.w_test
      1.14            -0.0        1.11        perf-profile.self.cycles-pp.strcmp
      2.25            -0.0        2.22        perf-profile.self.cycles-pp.__cond_resched
      0.60            -0.0        0.58        perf-profile.self.cycles-pp.x64_sys_call
      0.77            -0.0        0.75        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.61            -0.0        0.60        perf-profile.self.cycles-pp.xattr_resolve_name
      0.74            +0.0        0.76        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      1.40            +0.1        1.45        perf-profile.self.cycles-pp.generic_write_checks
      1.60            +0.1        1.65        perf-profile.self.cycles-pp.inode_needs_update_time
      1.00 ±  4%      +0.1        1.08 ±  3%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      1.86 ±  2%      +0.1        1.98        perf-profile.self.cycles-pp.down_write
      5.34            +0.1        5.47        perf-profile.self.cycles-pp.fault_in_readable
      3.61            +0.2        3.80        perf-profile.self.cycles-pp.__fsnotify_parent
      1.46            +0.3        1.77        perf-profile.self.cycles-pp.rw_verify_area
      3.43            +1.4        4.88 ±  3%  perf-profile.self.cycles-pp.filemap_get_entry


> 
> Thanks,
> Amir.
> 
> 
> 
> 
> > testcase: unixbench
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > parameters:
> >
> >         runtime: 300s
> >         nr_task: 100%
> >         test: fsbuffer-w
> >         cpufreq_governor: performance
> >
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202405291640.2016ebfe-oliver.sang@intel.com
> >
> >
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240529/202405291640.2016ebfe-oliver.sang@intel.com
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   00c423c0d8 ("fanotify: introduce FAN_PRE_MODIFY permission event")
> >   9d1fd61f1d ("fanotify: pass optional file access range in pre-content event")
> >
> > 00c423c0d82eabad 9d1fd61f1d9bb74e44bdcc8767b
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >   1.23e+08            -7.9%  1.133e+08        unixbench.throughput
> >       6169            -7.7%       5694        unixbench.time.user_time
> >  4.566e+10            -7.9%  4.206e+10        unixbench.workload
> >  1.513e+11            -4.5%  1.445e+11        perf-stat.i.branch-instructions
> >    6891152            +4.8%    7221484        perf-stat.i.branch-misses
> >   29764445 ±  2%      -7.4%   27565609 ±  3%  perf-stat.i.cache-references
> >       0.91            +2.0%       0.93        perf-stat.i.cpi
> >  7.187e+11            -2.7%  6.996e+11        perf-stat.i.instructions
> >       1.26            -2.6%       1.23        perf-stat.i.ipc
> >       0.00            +0.0        0.01        perf-stat.overall.branch-miss-rate%
> >       0.73            +2.7%       0.75        perf-stat.overall.cpi
> >       1.37            -2.6%       1.34        perf-stat.overall.ipc
> >       5828            +5.7%       6162        perf-stat.overall.path-length
> >  1.505e+11            -4.5%  1.437e+11        perf-stat.ps.branch-instructions
> >    6873687            +4.8%    7203107        perf-stat.ps.branch-misses
> >   29721957 ±  2%      -7.3%   27538369 ±  3%  perf-stat.ps.cache-references
> >  7.148e+11            -2.6%   6.96e+11        perf-stat.ps.instructions
> >  2.662e+14            -2.6%  2.592e+14        perf-stat.total.instructions
> >      57.79            -2.0       55.78        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      37.58            -2.0       35.63        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
> >      13.06            -1.0       12.04        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
> >      13.81            -1.0       12.83        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >      12.72            -0.9       11.78        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
> >       7.00            -0.5        6.47        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >       6.53            -0.5        6.02        perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
> >       5.36            -0.5        4.89        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >       3.66            -0.4        3.28        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
> >       2.68            -0.3        2.36        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
> >       6.57            -0.2        6.34        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
> >       2.36 ±  2%      -0.2        2.18 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >       1.83            -0.2        1.66        perf-profile.calltrace.cycles-pp.folio_unlock.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
> >       2.92            -0.2        2.76        perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
> >       2.65            -0.2        2.49        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
> >       3.95            -0.1        3.83        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
> >       1.62            -0.1        1.50        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
> >       0.74            -0.1        0.64        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       3.26            -0.1        3.17        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
> >       3.57            -0.1        3.49        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.61            -0.1        1.53        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >       0.93            -0.1        0.85        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >       1.05            -0.1        0.99        perf-profile.calltrace.cycles-pp.xas_descend.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
> >       0.61            -0.1        0.55        perf-profile.calltrace.cycles-pp.w_test
> >       0.64            -0.1        0.58        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >       0.87            -0.1        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
> >       2.50            -0.1        2.44        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
> >       0.62            -0.1        0.56        perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
> >       0.74            -0.0        0.69        perf-profile.calltrace.cycles-pp.setattr_should_drop_suidgid.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
> >       0.91            -0.0        0.86        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
> >       0.84            -0.0        0.79        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
> >       0.68            -0.0        0.64        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
> >       0.74            -0.0        0.71        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
> >       0.62            -0.0        0.59        perf-profile.calltrace.cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >       0.97            +0.0        1.00        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
> >       0.91            +0.1        0.97        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
> >       0.86 ±  3%      +0.1        0.94        perf-profile.calltrace.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write
> >       0.58 ±  2%      +0.1        0.66 ±  7%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
> >      11.24            +0.1       11.36        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
> >       2.01 ±  2%      +0.1        2.14        perf-profile.calltrace.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
> >       6.04            +0.2        6.24        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
> >       5.17            +0.2        5.42        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
> >      96.75            +0.3       97.03        perf-profile.calltrace.cycles-pp.write
> >       2.57            +0.4        2.92        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
> >       3.20            +0.4        3.57        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
> >      84.82            +1.1       85.88        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
> >      83.38            +1.2       84.56        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >      78.73            +1.5       80.20        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >      74.54            +1.8       76.32        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
> >       0.00            +4.0        3.99        perf-profile.calltrace.cycles-pp.__fsnotify_parent.rw_verify_area.vfs_write.ksys_write.do_syscall_64
> >       5.32            +4.2        9.48        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      58.42            -2.0       56.38        perf-profile.children.cycles-pp.generic_file_write_iter
> >      38.46            -2.0       36.50        perf-profile.children.cycles-pp.generic_perform_write
> >      13.99            -1.0       13.01        perf-profile.children.cycles-pp.simple_write_begin
> >      13.11            -1.0       12.15        perf-profile.children.cycles-pp.__filemap_get_folio
> >       7.23            -0.6        6.66        perf-profile.children.cycles-pp.entry_SYSCALL_64
> >       7.12            -0.5        6.59        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
> >       6.73            -0.5        6.21        perf-profile.children.cycles-pp.filemap_get_entry
> >       5.76            -0.5        5.26        perf-profile.children.cycles-pp.simple_write_end
> >       4.05            -0.4        3.64        perf-profile.children.cycles-pp.security_file_permission
> >       2.93            -0.3        2.59        perf-profile.children.cycles-pp.apparmor_file_permission
> >       4.32            -0.3        4.04        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
> >       4.20            -0.3        3.92        perf-profile.children.cycles-pp.__cond_resched
> >       6.91            -0.2        6.67        perf-profile.children.cycles-pp.file_remove_privs_flags
> >       2.43            -0.2        2.24        perf-profile.children.cycles-pp.rcu_all_qs
> >       3.10            -0.2        2.92        perf-profile.children.cycles-pp.xas_load
> >       2.47 ±  2%      -0.2        2.29 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
> >       1.92            -0.2        1.74        perf-profile.children.cycles-pp.folio_unlock
> >       3.11            -0.2        2.94        perf-profile.children.cycles-pp.down_write
> >       4.18            -0.1        4.04        perf-profile.children.cycles-pp.security_inode_need_killpriv
> >       1.68            -0.1        1.56        perf-profile.children.cycles-pp.up_write
> >       3.48            -0.1        3.38        perf-profile.children.cycles-pp.cap_inode_need_killpriv
> >       1.96            -0.1        1.87        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
> >       1.28            -0.1        1.18        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
> >       0.92            -0.1        0.84        perf-profile.children.cycles-pp.w_test
> >       3.14            -0.1        3.06        perf-profile.children.cycles-pp.__vfs_getxattr
> >       1.00            -0.1        0.92        perf-profile.children.cycles-pp.aa_file_perm
> >       1.29            -0.1        1.22        perf-profile.children.cycles-pp.xas_descend
> >       0.76            -0.1        0.70        perf-profile.children.cycles-pp.x64_sys_call
> >       0.87            -0.1        0.80        perf-profile.children.cycles-pp.setattr_should_drop_suidgid
> >       1.07            -0.1        1.01        perf-profile.children.cycles-pp.xattr_resolve_name
> >       1.10            -0.1        1.04        perf-profile.children.cycles-pp.folio_wait_stable
> >       1.05            -0.1        1.00        perf-profile.children.cycles-pp.folio_mapping
> >       0.73            -0.1        0.67        perf-profile.children.cycles-pp.xas_start
> >       0.93            -0.1        0.88        perf-profile.children.cycles-pp.folio_mark_dirty
> >       0.50            -0.0        0.46        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
> >       0.60            -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
> >       0.43            -0.0        0.39        perf-profile.children.cycles-pp.write@plt
> >       0.36            -0.0        0.33        perf-profile.children.cycles-pp.amd_clear_divider
> >       0.37            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
> >       0.33            -0.0        0.31        perf-profile.children.cycles-pp.noop_dirty_folio
> >       0.36            -0.0        0.34        perf-profile.children.cycles-pp.is_bad_inode
> >       0.24            -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.file_remove_privs
> >       1.18            +0.0        1.21        perf-profile.children.cycles-pp.strcmp
> >       1.02            +0.1        1.08        perf-profile.children.cycles-pp.timestamp_truncate
> >      99.01            +0.1       99.09        perf-profile.children.cycles-pp.write
> >       0.98 ±  3%      +0.1        1.06        perf-profile.children.cycles-pp.generic_write_check_limits
> >       0.68 ±  2%      +0.1        0.77 ±  6%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
> >      11.58            +0.1       11.69        perf-profile.children.cycles-pp.__generic_file_write_iter
> >       2.36 ±  2%      +0.1        2.50        perf-profile.children.cycles-pp.generic_write_checks
> >       5.57            +0.2        5.75        perf-profile.children.cycles-pp.fault_in_readable
> >       6.28            +0.2        6.49        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
> >       2.98            +0.4        3.33        perf-profile.children.cycles-pp.inode_needs_update_time
> >       3.51            +0.4        3.89        perf-profile.children.cycles-pp.file_update_time
> >      85.24            +1.1       86.31        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> >      84.05            +1.2       85.21        perf-profile.children.cycles-pp.do_syscall_64
> >      79.32            +1.5       80.78        perf-profile.children.cycles-pp.ksys_write
> >      75.49            +1.7       77.21        perf-profile.children.cycles-pp.vfs_write
> >       3.64            +4.0        7.64        perf-profile.children.cycles-pp.__fsnotify_parent
> >       5.68            +4.3       10.03        perf-profile.children.cycles-pp.rw_verify_area
> >       6.96            -0.5        6.44        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
> >       6.52            -0.5        6.01        perf-profile.self.cycles-pp.write
> >       6.92            -0.4        6.48        perf-profile.self.cycles-pp.vfs_write
> >       3.59            -0.3        3.24        perf-profile.self.cycles-pp.filemap_get_entry
> >       4.41            -0.3        4.09        perf-profile.self.cycles-pp.__filemap_get_folio
> >       4.23            -0.3        3.95        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
> >       2.79            -0.3        2.52        perf-profile.self.cycles-pp.simple_write_end
> >       1.76            -0.2        1.52        perf-profile.self.cycles-pp.apparmor_file_permission
> >       2.32 ±  2%      -0.2        2.16 ±  2%  perf-profile.self.cycles-pp.__fdget_pos
> >       1.79            -0.2        1.62        perf-profile.self.cycles-pp.folio_unlock
> >       2.05            -0.2        1.89        perf-profile.self.cycles-pp.down_write
> >       2.35            -0.1        2.22        perf-profile.self.cycles-pp.__cond_resched
> >       1.89            -0.1        1.77        perf-profile.self.cycles-pp.do_syscall_64
> >       1.38            -0.1        1.26        perf-profile.self.cycles-pp.entry_SYSCALL_64
> >       1.56            -0.1        1.45        perf-profile.self.cycles-pp.up_write
> >       1.30            -0.1        1.19        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
> >       1.42            -0.1        1.31        perf-profile.self.cycles-pp.rcu_all_qs
> >       1.12            -0.1        1.02        perf-profile.self.cycles-pp.security_file_permission
> >       1.46            -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
> >       0.90            -0.1        0.83        perf-profile.self.cycles-pp.aa_file_perm
> >       1.29            -0.1        1.22        perf-profile.self.cycles-pp.xas_load
> >       0.74            -0.1        0.67        perf-profile.self.cycles-pp.w_test
> >       1.08            -0.1        1.01        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
> >       1.98            -0.1        1.92        perf-profile.self.cycles-pp.file_remove_privs_flags
> >       1.30            -0.1        1.24        perf-profile.self.cycles-pp.__vfs_getxattr
> >       1.06            -0.1        1.00        perf-profile.self.cycles-pp.xas_descend
> >       0.80            -0.1        0.74        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
> >       0.63            -0.1        0.58        perf-profile.self.cycles-pp.x64_sys_call
> >       0.74            -0.1        0.69        perf-profile.self.cycles-pp.setattr_should_drop_suidgid
> >       0.63            -0.0        0.58        perf-profile.self.cycles-pp.xas_start
> >       0.87            -0.0        0.83        perf-profile.self.cycles-pp.folio_mapping
> >       0.50            -0.0        0.46        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
> >       0.60            -0.0        0.57        perf-profile.self.cycles-pp.xattr_resolve_name
> >       0.48            -0.0        0.44        perf-profile.self.cycles-pp.folio_mark_dirty
> >       0.68            -0.0        0.65        perf-profile.self.cycles-pp.security_inode_need_killpriv
> >       0.36            -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.inode_to_bdi
> >       0.52            -0.0        0.49        perf-profile.self.cycles-pp.folio_wait_stable
> >       0.34            -0.0        0.32        perf-profile.self.cycles-pp.cap_inode_need_killpriv
> >       0.89            -0.0        0.87        perf-profile.self.cycles-pp.simple_write_begin
> >       0.25            -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
> >       0.23 ±  2%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.amd_clear_divider
> >       0.23 ±  2%      -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_folio
> >       0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.write@plt
> >       0.24            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.is_bad_inode
> >       0.62            +0.0        0.65        perf-profile.self.cycles-pp.file_update_time
> >       0.86            +0.0        0.90        perf-profile.self.cycles-pp.strcmp
> >       0.69            +0.0        0.74        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
> >       0.75 ±  3%      +0.1        0.81        perf-profile.self.cycles-pp.generic_write_check_limits
> >       1.42 ±  2%      +0.1        1.48        perf-profile.self.cycles-pp.generic_write_checks
> >       0.82            +0.1        0.89        perf-profile.self.cycles-pp.timestamp_truncate
> >       0.58 ±  3%      +0.1        0.66 ±  6%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
> >       5.44            +0.2        5.60        perf-profile.self.cycles-pp.fault_in_readable
> >       1.36            +0.2        1.55        perf-profile.self.cycles-pp.inode_needs_update_time
> >       1.76 ±  3%      +0.9        2.64        perf-profile.self.cycles-pp.rw_verify_area
> >       3.46            +3.8        7.25        perf-profile.self.cycles-pp.__fsnotify_parent
> >
> >
> >
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
