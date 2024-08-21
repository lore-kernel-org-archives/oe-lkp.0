Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C030132106
	for <oe-lkp@lists.linux.dev>; Wed, 21 Aug 2024 05:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724217246; cv=fail; b=uRFOQEgpApCqNkaMtNGPDyAgo1cAmyRIiIA9BRevrsd8HIsg/lrrJ/BJJxANyqxQR6ojrWmKP3WCzs7rAG7MrJUbH4vr0XKeeXKhJBXZYgJErPIQJlm0ZcBNX8qF9E9DBgEGzXvc+w/xc7qGsJKh5oTFWBYVJ0G+kS4fmVEiAc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724217246; c=relaxed/simple;
	bh=h0uZGI7cSreElPgN3oRPB7a/ts2b3reHI12qFpNux9M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P7Bna3mtMfu3iKb54Os1ChBf2QNxyF+xX4DWvWpuOyaoNC08pOodGPT80stLP60/RVryq8mVakKQ3zDzIEcamw+VxjXTipeOGenFyJizdtVWu8jgZHOySosA06B4fINoFiyPCbd+ZVNfxmQ1GCqbDJYp2PxoqyBHGt4rOtzDWXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgoKsf5d; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgoKsf5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724217244; x=1755753244;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h0uZGI7cSreElPgN3oRPB7a/ts2b3reHI12qFpNux9M=;
  b=PgoKsf5d1gu4NJTqZNyjQWkJ3HHX4fzMmqtK/s0K/QjU0CQsSARVgJWR
   euS639VrZbdEYnaitVHfOiiyFtegJtFeJyI3efnU90k9cbdGy2oZvytTP
   SWi+rLHIBMOZbnWCAbYkVW+eut7+aEFBw0w4HUq9UVoun55m7CYcYj+bu
   BdMLSMwTxNj8CxnsBiKXYS4qbH76LtIcwfhgv72RZSTXZd/HXPIYj5o23
   M4GzG8p6Vxj5j26KjBECYgnHoWuc240wRMZfyb6eiikZpjyrEuK0zQlKA
   a2FfnbumLVi6oqkIRpCps2oxru0pSOn1wR1kyMWXllM51xxgUr1ugDGYC
   A==;
X-CSE-ConnectionGUID: iQ12LhMOT+a/79rEoz7IHA==
X-CSE-MsgGUID: xJha2uixRvOTdE0ajwpUqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22688971"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22688971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 22:14:00 -0700
X-CSE-ConnectionGUID: roZhHCmiQZCH+cGI16gwzA==
X-CSE-MsgGUID: LpUDTCdBTq+J7uZR8q87YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65809753"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 22:14:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:14:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 22:14:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 22:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwO6keqHdZrilIWo8idVix8ySloIxgygSy9G+YX37rEyCL4MaDCtnRNpOU29KoG/TPin6mHdNFoIzr3fUMPdlwr8LGgVnBmdtqF5tY4IVfrirAjEjaTiHL1JlSon+xH1PwlBuK2Ygw6Vy/QC433fX5U39z6GiwDDRVoyzvAizL6Nd3BALRDsMZpzSoGHP3ss+ogSeyQpMtLgE+2AZ0jKijRwVCMZj2HHx5DNd52uKCtxR/03ktU5cwvt3F42lA5Tgor0/6dAIE6LmasAlbYMFhToJC4XC29f7DiXTsNGiJw9RO+I69FhmOfW7HeqKTy+p7smSbF8DV6V0VegUa+zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rja8e5Ny7li4U7/xg6n/KMoAeVQQH8sUF+p4lFecXY=;
 b=JEV0JJCh2GfO2ldsFyQWEZsGoSlAPTo6umG53w7vm8AhhnLLA1a6pK5lP2sWJkl9GlW1LdL/jQuUnsHNah8uz1cmh6iKuHHzWOHWAJrIRoFQNEKo76h86LLm8hDJ1pwXnwkLmOmegkEWt3ZyIL4881MN5mvqNdokYMaqxDrLoXvgVQ7gSX62lurCcTGvZs2Jj3abCbP/ANMwfAZRHKN8t0lh2yGgvZVp6iZP9Uqg9xGYQ1jttpKUhkc6LQj/2GU8GXagvB9UuCs3L/+WLEvUaEVXwx1LLCteSvVHaMs88NXfJ7ASOvW6ZYW+O3+SOtrOJvX/LVsPcTsgWqIClvHZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 05:13:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 05:13:56 +0000
Date: Wed, 21 Aug 2024 13:13:44 +0800
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
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW0ludGVybmV0XVtv?=
 =?utf-8?Q?pencloudos=3Anext=5D_=5Bhrtimers?= =?utf-8?Q?=5D?=  53f408cad0:
 stress-ng.sockfd.ops_per_sec 13.8% improvement
Message-ID: <ZsV3iIjUWWrrpVFB@xsang-OptiPlex-9020>
References: <tencent_0072AD566D2F623120E0A213@qq.com>
 <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc3bcd5-bd64-4211-10c2-08dcc1a00e89
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWUrbWZ0R3ZMUmpQWWhiSjEybXVnM1Bkb2kxcUNUeUgycG4wRytyMFhDdWJG?=
 =?utf-8?B?WnZ0K2dQa3E5Y2lmc1crUWM1ZmtvRUd6YnlPQm1ZZ2lzT2hSTGR6dmtqTDl6?=
 =?utf-8?B?OC9LdXVWbitUSFFhT1hJK2xYWHRhWUpXaUVHNDRiMlVaRFM5dVVHRmw1am1t?=
 =?utf-8?B?T2RYTUo4TTBGaCtDVHZmeHRobGZESDdCL2VGTzVuczZONFc2eTJST0xOSllk?=
 =?utf-8?B?RWp6TjlyYTFGUDdUMFRyUkRHQUpSZVgyV25JYUtLamIvcGZxVUtHUnFoMlJJ?=
 =?utf-8?B?RGFhWklXUi9WdndzNFBiUnhHMEViMWJ3am5KaUxmcy9RQm4vUkpXd3pjYUN2?=
 =?utf-8?B?YUJUVTMvVklQT1Vlc242TEl0MXFpcjUvN0luZDJnTDJPYmVuaUNaMDNjZ2tm?=
 =?utf-8?B?cnNBRlhydUFvalNhcUJRK0R5R0g1MTY0WXBlOFdOOHgxQUx4SWdnTmkxbVlF?=
 =?utf-8?B?azVYZVNJSWNqUEswSlF6eUtVcUZ5SDhaa2ZSaElWUkZ3K2tkQ3hFYy9ldnVr?=
 =?utf-8?B?eWhQMkQyWHlyTUhWM1A2M3oyZ1B1NURZWDUxOUo2R2ZqaVpmTGN6UU96RUxT?=
 =?utf-8?B?NUN6aGkzb2Y4YjhEMTh6ZWNMb1ozYTlqbjIraGkrdXB1Q2dJeVFpT2pZaE4x?=
 =?utf-8?B?NitZZDBBSHd2SWVkM2pISzRRYmxhRExZdGlDOWRVYWM1WWV5WGwwVm5PY201?=
 =?utf-8?B?T01mcXdKNSsxZ0VtN1dha0ttS3JTTVoya3gwUzYzMVJzYkNsQW85QWRtZ01h?=
 =?utf-8?B?S3QwVkZRZGhGb3pOTDJTVXRKa1pKMlZWT3JqSnpsRE5iMlJTUG5EemczWG1u?=
 =?utf-8?B?VmxreFFqRzBLUmxXNEowdFpyNlFDRWNLemhzT3hpQ2F0bTFPZ2hUWWVBVktu?=
 =?utf-8?B?U0tFTUs4TTUvYk80YzVWdG5MWTVzdE13d3d4THR0OXBGU05nMEswZVR4a0J0?=
 =?utf-8?B?cVBNU0U1V2ExYUpQZFU5MFRncTJBOUp2SkRrWGVwVS9aUzBPMkt4Q2owd3lL?=
 =?utf-8?B?RS83aEsvVERBeEM4bkNqOTdwTmxZMG1NbU9INTZVREE0V1FjYytUalRXbGhh?=
 =?utf-8?B?dDhPMW1sRzJnV1Q3Qkl5Uy9IYkNZWTN6cEdjWGVxeXNqQ2dtWXN2RThpOXF6?=
 =?utf-8?B?cW40WGVMQ2EwRTVRTXNqNkVIOFEzL3I3UjdlQmtzZUpneUxQUGJGQlpCZnNt?=
 =?utf-8?B?a3lDZ3dDbFFKMXJaVXhRQ1JHMlpIUWM4S050bDBlZWc3MHllU1ZRT0JwcDlJ?=
 =?utf-8?B?VDJCdVl1L2VIS3pySTc0dTFXaFRnYXRlL3NMMkRjY1B2QldCUHpCai92V0ZO?=
 =?utf-8?B?MHQyZWt6MEVyRjNzZDFneHQ3eVVPVzMrS1JMRkxPUG1KeTFhZ2E5MWZIUzRo?=
 =?utf-8?B?NVNkQjlHcFdwdlh0NXp1Z0ZrNGwvLzFDVkxyTG9SQ0pYTENOS2hBZFVLYUsw?=
 =?utf-8?B?VEY0SlNiTERiSUxvWU1peVZicDNHNjV3ZzYxdnRwejJhTzljcldqQ045VWFU?=
 =?utf-8?B?M2dMRC9Ma3YvaHh3UkFERjRHZkZHcGlFd3J1Q3owcS90S3o3cmFhdm80WHN5?=
 =?utf-8?B?cnZBMnF5bnU0MlJycUFpclY4MGduWWlBMWVRN0RSbEpoZ2g2RlgwYWNRazVI?=
 =?utf-8?B?MlFJaTFISHRQaXI5eFpIWndiUTB3c3dWQi95U1B0TUlMYzA2UG5YTEVZbmlP?=
 =?utf-8?B?bC9tR2QrdERKcjQyU244NUxDcEdTVXA4VDM3cDl4MStYdCtIRkw0MEVQTTRx?=
 =?utf-8?Q?hCPc6T7LDjC/Wy8Sic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alc2WlRRcmR5Y0dPVDlONXYyQ1JubFVSVkJ5bHJrWjYwNHVxc3NMQ2hWck1O?=
 =?utf-8?B?ZFk5cmVETmJZNDk1aVJZcnI0ZURnZElBcXhVekdCM1lvZU8yRUZsSGt6T09n?=
 =?utf-8?B?MkFHZHVGbFR4U1hIdURWeXZtb1lSZWRWQ0MvSVZndXNUM2Q0YWlQTExrSW4w?=
 =?utf-8?B?YUp0TlhHMzFLc254L0w5VExxMnVQTG5RSkFIUGhwSFhVcEMrL010Y1FHYzRS?=
 =?utf-8?B?TGVnTXFNalY2ZGtpV0VHUU1XWElZcHdlK3Bnb0VDWG02N3dmZHRDQ0lyYnMz?=
 =?utf-8?B?V0FwdmxCL3ZwTEd2a1RycVg0c1hlWEI1NjAwenN4K1Q5aG93YTBGcDBRWmFp?=
 =?utf-8?B?ZHlnZ2tFYm4yYjZ0UDNqWjJlRHo2ckY4dTNOeFBVYzZZa01PRm4rb1g5c256?=
 =?utf-8?B?U25mWCtwTDdJampqUldJNmF4Q2VnYUluVkFaN2p3SkcrS0FEOUVtM3RUWEty?=
 =?utf-8?B?VHNrYmdXSmhnckUvU3BlaHRTRWN4b3lkNjkrTHc1MVV1eDBsT1ZaV1NUa1Z4?=
 =?utf-8?B?dWQ2ZE5tbFlpV24waTBwSURHQTVWZ3orMkRYRk1MQnh4Z1JjZW9DZzJlMTJG?=
 =?utf-8?B?OGZEWnhMUG9OVis5UE85MUNSUEdBYk45YzlhZHZxdmY5eUloQ2NUYlRaM1B5?=
 =?utf-8?B?bkozWXd5cHZGMWJHbnBtOWZ4SW9iZ1VBZFpOZGxzNTloSG9wK2hhR3BFRktq?=
 =?utf-8?B?S21VNy9zeUEzc2F1Myt0VWRkRjN6ZzEyeW13eWt5OVRhZzRwbjBjZlIvRGdp?=
 =?utf-8?B?bGxZUmg4QktUOGR4bFVtOHhuczNIOWE5S1I4a3NtQ1V5S2ZnNzJkRDk5VFoy?=
 =?utf-8?B?YU5GNDlSWGZqcFVyR2hoTWtMU3dlK0tCYmVqWTh3d1N6am50cS9OaElRSThw?=
 =?utf-8?B?dVFRNjRwRXRDNG1veFMrTnI1RVpPcTNQTitRMnZ6bTlyYWI4OXVtZSt2ME43?=
 =?utf-8?B?Tm5SOU1wT0M1VjlwdTJzeFRnM0htdU9CSURzeFhmaS9rbXVIRk1jUmpWZGRS?=
 =?utf-8?B?SEs3SXZBbndSdlJNU1g5YldXNWk3cndueGgyY3B1QzJmZTdoSzZmR2N4Sk1q?=
 =?utf-8?B?MTNmRUxDVEp5aWR0YzBrTzNGcGJ6RVFWb044Wm9zVkR4RjdjeW1uWjRJN3Jh?=
 =?utf-8?B?dlBGYXc3YXZxNS8yWVlXc2tDT1ZiTGgxNWdrZGxkaW9VenpYaDNhazk5d2hz?=
 =?utf-8?B?UWRrdmtaUWppYWZEeFNzdlFIdFgweGVmUVNWSnBNYmRoYkNhcExDNXh0eXpT?=
 =?utf-8?B?U0lpRFhyZWZMR3FKZFkvREVYUnI0ejB0M3AwaHhvdlF5QngwZ1lEVEZIN0pH?=
 =?utf-8?B?THdBeHpsNGFSMzBGQTB1T09sQlNwb2s2dlBLLytTT3lmME5DM00rV0lFRklM?=
 =?utf-8?B?bFN0MHRmVlZWTldhZHNjUk9DclFkSkQyOCs2cWNKNkk1NkxuUVNvei9KWldO?=
 =?utf-8?B?cmhxYnVaY2gzbTlRNFRoRVFNbmxPdlIvVzlBNUJSZjR2ejVKYnUxWUFJOU80?=
 =?utf-8?B?MnBKRzFQRTlaTm1iaWVaVTB3RFVkV1dWRU0vb3hQRm56bXhyMVdPYjlLQW52?=
 =?utf-8?B?WExKTndVODNpZVZZYW1tOGRVYmpuL0NzcWx0R0pHK2RZUE1MUXRhUGJWZzJO?=
 =?utf-8?B?VnR6WFora21ycUdDSWZEdmhUR29nQTFrOXkwbG9GeTNyYzhFVFo3dlJ1WXZN?=
 =?utf-8?B?bjJnbGVSUU1IeDdaVCtWVUhVZHhOdWVsbjRwNlRFUDViZXFzMlN2RUdrMk01?=
 =?utf-8?B?Q096bVpoOGVEOUlGdGsyN0J2cjZIQlF4N0JqMVV2eGh6SW1wdFJNWTVpMG1L?=
 =?utf-8?B?QnhqcHdhcXBkLzhsT1c5UU12MGgrNlNodTFUbFRneVJZOVNDdW15RHZPa2I1?=
 =?utf-8?B?RVUwR0hPUTJFTnhaSXpjWTZQOFpKYzNvbHdWMGpwYitRNTE0SzR1aUtxalhL?=
 =?utf-8?B?eUNtUXF1aWxsRktGMGN0Ny9SSEN4a2NFc2g1UmxPQUFESm9mNllMMkVHaHpF?=
 =?utf-8?B?a2lJNjk0QVlYVTZOL24rSEF6QWpiZFFYVU5idUJuUEFnazVzVWQwaTZpWE5K?=
 =?utf-8?B?cW1OUnR1QmlJd1oySDZHRVQxZTZsYXF0V0tFWVVpWExUNy8yVWJwWGNkblZP?=
 =?utf-8?B?OCsvZWVJV1BCaFVzZ1RtYS9JVHZZOHgrWWpTZ0tMNHZpcmJUYVVMVmh2TVNv?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc3bcd5-bd64-4211-10c2-08dcc1a00e89
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 05:13:56.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BncnrLwWYjHfRuV9iMAG9BEkAYxqEL6hidCBrdppjgOz1KCjfAFP9Ys0iv1MJX3d4F/9N97t6w25esmBbrRqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
X-OriginatorOrg: intel.com

Thanks aurelianliu(刘诗) and Wu!

this could be a code alignment issue. we will check further and update you.


On Wed, Aug 21, 2024 at 11:45:45AM +0800, Zheng, Wu wrote:
> >Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> hotplug，是不是不应该有性能变化
> 
> 查看了一下代码，确实应该只有在cpu hotplug的时候，才会运行patch中修改的代码。
> 
>  
> 
> 不过，在patch中新增加了对cpu状态CPUHP_AP_HRTIMERS_DYING的一个handle，
> 
> 是否这个improving performance的原因。
> 
>  
> 
> 另外，和Oliver对过了，这个improving的data应该是多次测试后的结果。
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
