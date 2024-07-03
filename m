Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94183135A5B
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jul 2024 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719991313; cv=fail; b=Rqpg5zGn7gzfLU6XiDTimjs8fiiKFqVvAjsFplH95ziiSddd3BlcSDafj3OynK8WHLs6Jtm23UqLaJcdx1riC56AJGbSm9Pre37YrwbCj/tdWDCT3vt9ggtOxf9TGGpPijiCsw0GoTD5OEtXuV/x5SSOjHAJs/il9yVzZ+065Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719991313; c=relaxed/simple;
	bh=TP2P7AvXvYeusooOuyfviJW6vSS3ugnbRHHtgSRu/vI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wnli3xI2XN9UKF9UMhShVlUD5TmrAzVmnEq9mS0e8UqW9EuTOroxjn04g1Ly6X7C4g7RmVNS+TEVkjFPJP+Y3yrOzIkul5ckQgEVztsr0mi6JlI5G3ED+gPwq2RVv9jkHt+7efsYMh97grKYvFBmIh5hXXqeMjP6YpbNOa2A8CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j86Z/pjS; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j86Z/pjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719991311; x=1751527311;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TP2P7AvXvYeusooOuyfviJW6vSS3ugnbRHHtgSRu/vI=;
  b=j86Z/pjS3KWA6OKoxH6wJlDjdy5nH9QlA000w+EAO+I3xZDP6q5dnOcD
   N6Pry4JLfyl4E0Ij8PQB9HlRKCSr6oSwaeMEtliQIBuUlzjrGlQXGOLFG
   ECQblNNcP62otC1gIB5WSBUsmliC9Iy3UpCzMQeop4MW8DeIa5bqPN7fn
   HMo12pz1ZAdKfJhxPL4JP2VGqfXO6i3mdTbYhmI4d9OmufVmRoYotX9yZ
   9S7YrRiI2OImEB+OqF4jzz52Xbi8H/LP5TbepS8uj/dzPXclQ3geuwh8Z
   s47u4FCq/SMBZB7oSnck+8yyNcdYQQi0FIthvVoBSwfCNcT9wsVSvafF9
   A==;
X-CSE-ConnectionGUID: vRmOTCYnSKmI8kNX6JlD9A==
X-CSE-MsgGUID: +oUMdXVwRk25s3Vj8KffyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28596612"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="28596612"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 00:21:48 -0700
X-CSE-ConnectionGUID: NX9I4U+ITtmuW9TUkJkAkQ==
X-CSE-MsgGUID: h50M31d+SXm2/YlSEnaKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="77311292"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jul 2024 00:21:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 00:21:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 00:21:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 00:21:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 00:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFyjLSqXZIjH2S1dYhhL1ZQJbtR89ph5hJxkMZWKDra8QjdXgmdFZfafJVrSCJwMwdLZUcjFaMYU0A3fFqxQ0dZjjMbpI67/SwQqKSUV4bD3qFvRPKqejc10kEv7WnLTx+YY6B0lajQG+3sAuZ5uZ47WfmM/GxY8BOhSAZFQIcC4OXWyQElQmoNLTYWaI1FdEp8m4nUKTV8l9IJhtiinlNz1zy5xtbBRJ1l+W1MwpzvpW1beJrDfggu1Lal0YElLDfef2WyggCMpPSJollWa+RtfEUZjOll1BFV2Wjr8XCdmXxvlIcv5xoPUtosz5RHVbM06W2tNm2WkTechWLep3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgHMNxKkiqfVuOV3OdjvF0/PelipTfq3fywrRru1/SE=;
 b=et2kUUiNmogVwTkqq3hfM+vCYf0OEH5UsEvblxbcfomepVzgKkhnp4tBJsBbyYcsWJu+EsBuvr3Q8ni3n6J+krSMqfSl5uM7JZoWOS0I8XmkVX1og0W9NXDTUV8pdZlQUgpbJxNROpzEIrYCepcCqLDCgRld59N8zRcDVg3y2aqhpogT1ITLCSjr9EfiPjcxF1ImUzwBYr8FI2CJ6E7anL9/qjK4xY6UGRJhlaf9aEMr4fQv8Nn0QoCuszKK4kcyoS/8QSB23LloXtYqzsgbnNQgDFw5nOHu+Snq2gTH0wS9V7G7xec3uCswQhcSY7zLS7ipIVhp53VrYdwm3m3KCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 07:21:30 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 07:21:29 +0000
Date: Wed, 3 Jul 2024 15:21:20 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <ZoT78AZAoscvNZTv@xsang-OptiPlex-9020>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
 <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
 <CAOQ4uxhCfAvn0L-Ej5bSZXgFBYA3fbpBxRhURqv3bYu9=kw_Aw@mail.gmail.com>
 <ZoJd4ujlJ/fY137y@xsang-OptiPlex-9020>
 <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxhsdiR_CtYxu4FchWVCO6OpzkdtQksJrzsehhXeG2gp1w@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|DM4PR11MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9816b3-00d3-40be-e826-08dc9b30c1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWRRZlhTQitGRlQ1YTA1RXV2a0RXUTI0aXhEMGpRUGgyQVlvYjVmNUdBM21Q?=
 =?utf-8?B?c2RabzB1cjgyUGpZR1dQQkxrL1dzNXc3Yk96RTBGZkVoK1RaQXZ4d3hCNXpK?=
 =?utf-8?B?WXJiZU9QWVR4VVZXL0ZnNFdaV09vWWdidi90cmJxR2dsajZrWW9na0h5SllM?=
 =?utf-8?B?aUt4bG5JWFZvV0t0N1ZYWHJvS3hZRmVMMXkyRmRtcGpFbkdYb3BDNE54ODlQ?=
 =?utf-8?B?dEJFNldmNWkvNkdLc0FHT21iNXp1NW40cE03MHd5dldlNk9ud1NjUUNreWJN?=
 =?utf-8?B?VGpucEw2MzZpa3pMNFMrdkpON1hrSWJYVk5XM1lNS1BGUlpEUVBRREhWeXU2?=
 =?utf-8?B?VTV1QmpLaE9BNGdmOUxjWjVoZzF1U0xJTS9XUC90a3UrczYrK2ZBYmFtK0xY?=
 =?utf-8?B?YmJTSk9tYkwrZHJhQXlXdVhXQXo2Yzc5ZzAxTU8zazAxNmVNRUplOURJd3lo?=
 =?utf-8?B?YVhtYmZFdkg0dUtYTEc4YzB1aEMydi8wcEhIZ3JSZTE1U2pqSFdTVlZUS2tE?=
 =?utf-8?B?ZWRIQ0syV0FqVkgrRjYzVVVBMFF2bXBLQUV4Z1UvOGdBLytzMWFVQVo5Ylhh?=
 =?utf-8?B?VHQzWEtuSlFsQittbFR2VWQ5amYzbUc0TSsyRUE0UDBZV09NeGU5SzNOZFdI?=
 =?utf-8?B?cTErRXBCVmVjNmp6c1JsZTNKWmRNMGQzMkw0WUUxY1N4S3RoQTZVNGR5R3Zu?=
 =?utf-8?B?OWpnUlVWRzhWWC9uMDY2eTE2QjdQNWxCUnkvNUFhR1NWR1E2M0M1S1k5eG9D?=
 =?utf-8?B?TkRJbXh2Y3d3T21LMzFyclRMb05mWUV3a3M1cXVueWl3dGFjZ3BURmw2MTlD?=
 =?utf-8?B?ZkJJMlZjeGJkWk1oRyt2OXZQL21EZE1EMzBNbEdKRy83NmlCMG45K3Z0blp6?=
 =?utf-8?B?UGFQZndPVVl2VDhBUWhMd3FwUUo3U0ozeEVGOXdIemI0SngwZkVndG1nM2Yr?=
 =?utf-8?B?NW5HY2dCREorVXhqUEt1UTcyK0k2d3BhVEUvN3laZzhJb21vSjR0YzFPazhO?=
 =?utf-8?B?bEF2bldwT0N4RlYxZi9rVFNWbEovR0hzZVpNNEtNbVIvUGw3dkoxOTJaTDRx?=
 =?utf-8?B?Zk8yVG9Jb3FBRENlTmVVV09RckdZbFRpUnlxVElQV3h3aVJvQ1JIY1NuUjFx?=
 =?utf-8?B?VUh4TnVnVlFQWHQrRWpCRnAwMjdOd0c2RzAwMWowTDA1dEdtSHc2LzlKSWJy?=
 =?utf-8?B?MlZXM0FMTWRHM25aeE1Jbk0zRWdPWkMzQlEzYUhaZDZzRnJmbGxueWhsVGRr?=
 =?utf-8?B?QUlITzE1d0srbTl3SUZ3ZmROYmpyWUE1N2w2cXVSVXF3czRxek5HZDVVdlZ6?=
 =?utf-8?B?TnJZTEE3VzBtN3hTTHpkcFliRUlLMzFQa1BRWms4Q2xvb3lYbXNsditBd2Nz?=
 =?utf-8?B?a24zbkhVbzFtSTZsL1lHUjdPZEFCM3lYc21jdmdEK0RkZ3IxOGp4dlQxVVA2?=
 =?utf-8?B?Z2JNTnZiN2t0Uzl4YnZqU3FBa0dkMzY1aXJzRzJGUExhN3o3YlphTTIyQ0Rs?=
 =?utf-8?B?V2JBcjdNWW5kaGM5M2xJbm5lWWc2dWtTTXF2UTJIS050U21NNnJ1WHQ0MzFG?=
 =?utf-8?B?UllYcnRuemFtUFdmb2RWK203cFFQUDRCVzFyL3pqeURYVFNFZUo3amZpbzBo?=
 =?utf-8?B?bmVoT1ZtaGpjWkxCenpDclhRODd3ejV2dEhqb2JXblRHbS9nR1RIUFFLR3Z2?=
 =?utf-8?B?ckIyMENwSTZqUmVySDUvQ0Y1UFQ5Z0ZPVFh0Y0ZQVlBWQTlkMzZyU1JuVHh1?=
 =?utf-8?Q?g/2aI4RG/wL+S3S7Qtx0hAj9DDJkJsvdeQnGV+l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NPVUFiT2wwZzE3MDhOL05CWWt4RGQvWnRtZDRvdGlrdndkYjFadHgreTNk?=
 =?utf-8?B?cGR6eTJsZzZDQjVldVBialZLblpaL1NGTmxqV2JaTk1DeHhReTV5eEZxWHlv?=
 =?utf-8?B?cUs3U1Ruc3ZuVnU4VmlnUC96WXczVEFtTVVkMXV6Z1dSS2VaY0dJSVVaRGdX?=
 =?utf-8?B?VDFQM3dNdWx2bVhCRGtlYXRvYXZTTjdGVjRERjN3S29UajdQUkgxM1FnSTBm?=
 =?utf-8?B?clBGQ0s1cVNvSXU4SE00MkM2TnVWc0Z3cGwxa05yazFQalNHYUR0NGFGWHBy?=
 =?utf-8?B?S1pxeDJ5T3FKcWg2Ky9BNWk3RUxTMW5ZaTEwWEEzK0M0eUhJL2Z0VTVtNzBU?=
 =?utf-8?B?d0pMUCtRQjNtLzFGdmphWGFvcHh5Q2NuNTYrRm1YT1ZhM0pVRVh3ZGsvUHdX?=
 =?utf-8?B?S0IzaU4vdnBTa0ZXZFBhQnNsZ1UveTQyRzNCNGgrM2N5a2ovYUcyb2V1ek05?=
 =?utf-8?B?MXhYUGdLb2R0eFZ1YnhTMkpYS3U1VXZhb0ZEUklITVlWQjRackptS0lweXNz?=
 =?utf-8?B?QWhyaHpHaUtlOHpaWEYzYWxIek5FRDVwZlNrWjRxWTNKWnVhSk5IL3RGS0xs?=
 =?utf-8?B?R1JtNTRGb0RlWHh6VEV5aFZXR2lSSnB2cE84YzNqYmdQaTdEbEg3UEhtNzYw?=
 =?utf-8?B?a0NHVFd3a3lLVlpBWnIrbnpmR3JOQTJpRjdIakZLQWxWTTFMM0w3L21FNmlz?=
 =?utf-8?B?dkpLZjFkZC9ZazdHenpxa2NLUUpOTHhEc0hsZTJIUFBhWlB0ZUNDNGhJYWhR?=
 =?utf-8?B?OTFoRnNXWE5RUDRGYjZKdzF2Qlh1dElZMWRPTHJmY2k4Q2xXUVk1aWZDYmJG?=
 =?utf-8?B?REtDWHJ2N1FoUXl2MndBSmIzVDVSc3luKytEUThobktDbW5hQnN0L1NmUm1O?=
 =?utf-8?B?dlV1R3l5Y1lBcDlsS1VJdDR6YXVlbXJORmxMWXNWU0cwR0NYSys3NWZZMDU0?=
 =?utf-8?B?T3ZCUWNQcjJHYUZ4VHJxSDMvL0pwTW1xVVFOTHFxcHdvOFlpV25XTWhDNjN5?=
 =?utf-8?B?YjE3aWRPM3VJUHBRRHBZNEJwUUJFQkNZMXhhOHhIMW1sbXZPazFxTEFNd0lH?=
 =?utf-8?B?ZW04VFhuNnZUV0IwSzJSYm1kOHZHeS9YRHp3MFp2ckhGSVEyc25FM0M5SDZo?=
 =?utf-8?B?Y1VOS0gzTTlPN1JZbEJub0R3aGlkNkZwRHlXeURJVHQzbFEyWG11WSs0UzVY?=
 =?utf-8?B?M3V1MWo2WjcvVnlMRWx4aUtaTHBUTzh0Uy93S016cjB2L2dwQTVXbThLUmN2?=
 =?utf-8?B?cEpWeUthb1NVQS9acjA0ME4rZ0crbHE2Y294V012WjFQR1lXaGpyNWtQQkZm?=
 =?utf-8?B?ZUs3ZXBPdlhqMzBUVzBWR2NEOXNobEU3Z3JxZVc2MTgyRC9tM3NSUHNlZXlR?=
 =?utf-8?B?VkIwbFpQOXV3djBTUzA5eENac2M3TWV1aitDN3M4TjJ6dWdibG5XSklhdTFK?=
 =?utf-8?B?emp1NE9jb1NHMEhyMFNoREtXQldPY3daQk4xSThHb2JBWFF1djRFb3RhbFRC?=
 =?utf-8?B?MlJPMWlFSFlsbXRuR09LOWtpbnhrT0xwOW9QYmNOclRRMGhEL0c5RkMvOGQ2?=
 =?utf-8?B?L1l0L0FwQjlEOVVXVnpTbEc4RjlldmNJMGhtck5pc3h6SEFyNTVuODd1LzBy?=
 =?utf-8?B?NTQyQm52L3hod0djT3lpcFNhMWo3Nm9PaVpwS0RmYXpUaHpOMUNZZkxKS3hM?=
 =?utf-8?B?aTRUakpHQXVpaWF2R3doVGlqemhLM1VlSGg2MU1Hd3BrUlJEQVowZ2c0SjF5?=
 =?utf-8?B?UkV0anVWUGJkWS9zYStUb3hGWFVFYzUzT2Z4bVpNK1Y4OU5JbUJGbDF2eE1X?=
 =?utf-8?B?UDRPZHA3VFBUMVY0UW1nMlRyV3J3Z2k5TndtTXd0V3JTb2o1bkhRYmtrNXdh?=
 =?utf-8?B?OUpLWkdkclcvZEp4dEw5WkhabVZSVGNCK0N6OUs2Tk9IME5DOWVOcnNJZFZL?=
 =?utf-8?B?cU56NkJvRTdJVG1aQjNiYmFmZVdtZEF3MHFpS2hGeUt2emJYZ2MzNFVJeFlB?=
 =?utf-8?B?TTlyYTlWNjBWUm9MWkdRMnc0VHJGUmtmcEZUS08xSExNY016eTZUSFZJaFNt?=
 =?utf-8?B?enFDOFEyWGp3NnN0VFhyWmllMzB6bVdaRVgvblRpOENRb2pLM3dFWCtqcnBS?=
 =?utf-8?B?Ykc1d1lyZlU5UmZndDNzYlA4aGtSMGliZFBSbFdPZ3AxWEV6b3BVL2R5Tk83?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9816b3-00d3-40be-e826-08dc9b30c1dc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 07:21:29.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZMEXAT57QXIgYIA5Mgf5gR0vGhTCqTy3OcbU8CRxF7Rbix60bNf/u2QrGcZkTG/YARbhQzGRq4BVL1LevIH4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
X-OriginatorOrg: intel.com

hi, Amir,

On Wed, Jul 03, 2024 at 08:58:13AM +0300, Amir Goldstein wrote:
> On Mon, Jul 1, 2024 at 10:42 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > sorry for quite late.
> >
> > On Tue, Jun 04, 2024 at 03:33:39PM +0300, Amir Goldstein wrote:
> > > On Mon, Jun 3, 2024 at 11:13 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > >
> > > > hi, Amir,
> > > >
> > > > On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> > > > > On Fri, May 31, 2024 at 6:15 AM Oliver Sang <oliver.sang@intel.com> wrote:
> > > > > >
> > > > > > hi, Amir,
> > > > > >
> > > > > > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > > > > > On Wed, May 29, 2024 at 11:26 AM kernel test robot
> > > > > > > <oliver.sang@intel.com> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > kernel test robot noticed a -7.9% regression of unixbench.throughput on:
> > > > > > > >
> > > > > > > >
> > > > > > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
> > > > > > > > https://github.com/amir73il/linux sb_write_barrier
> > > > > > > >
> > > > > > >
> > > > > > > Jan,
> > > > > > >
> > > > > > > I speculate that the regression is due to the fact that we store and pass the
> > > > > > > path information on struct file_range on the stack before the optimizations
> > > > > > > in fsnotify_parent(), so rw_verify_area() pays some price for the stores
> > > > > > > and __fsnotify_parent() pays a bigger price for fetches?
> > > > > > >
> > > > > > > Luckily, we already have the way to check
> > > > > > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > > > > > >                                                FSNOTIFY_PRIO_PRE_CONTENT))
> > > > > > > so now I used it to optimize out the fsnotify_file_range() inline
> > > > > > > code entirely.
> > > > > > >
> > > > > > > Oliver,
> > > > > > >
> > > > > > > Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> > > > > > >
> > > > > > > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > > > > > > with pre-content events
> > > > > > > * f301cd18006c - fanotify: rename a misnamed constant
> > > > > > > * 64108c0b47db - fanotify: pass optional file access range in pre-content event
> > > > > > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> > > > > > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> > > > > > > * 83af0c89527a - fsnotify: generate pre-content permission event on exec
> > > > > > > * aca408421327 - fsnotify: generate pre-content permission event on open
> > > > > > > * 93656e196b00 - fsnotify: introduce pre-content permission event
> > > > > > >
> > > > > > > The optimization was done in the first commit (fsnotify: introduce
> > > > > > > pre-content permission event),
> > > > > > > but impacts the regressing commit (fanotify: pass optional file access
> > > > > > > range in pre-content event).
> > > > > > > no need to test all middle commits.
> > > > > >
> > > > > > I directly compare the tip with v6.10-rc1, still a regression but better now
> > > > > >
> > > > > > =========================================================================================
> > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > >
> > > > > > commit:
> > > > > >   v6.10-rc1
> > > > > >   a82fd282befc7 ("fanotify: report file range info with pre-content events")
> > > > > >
> > > > > >        v6.10-rc1 a82fd282befc71d99106bf31066
> > > > > > ---------------- ---------------------------
> > > > > >          %stddev     %change         %stddev
> > > > > >              \          |                \
> > > > > >  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
> > > > > >
> > > > > > full data is as below [1]
> > > > > >
> > > > > >
> > > > > > then I checked new "64108c0b47db - fanotify: pass optional file access range in pre-content event"
> > > > > >
> > > > > > it also has a small regression comparing to its parent, but better also.
> > > > > >
> > > > > > =========================================================================================
> > > > > > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> > > > > >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> > > > > >
> > > > > > commit:
> > > > > >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> > > > > >   64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")
> > > > > >
> > > > > > 94167e071109d573 64108c0b47db91b20d658a89969
> > > > > > ---------------- ---------------------------
> > > > > >          %stddev     %change         %stddev
> > > > > >              \          |                \
> > > > > >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> > > > > >
> > > > > > full data is as below [2]
> > > > > >
> > > > >
> > > > > Ok, this looks sane, the small overhead in the write path makes sense.
> > >
> > > On second look, while a small regression from 64108c0b47db9 could make
> > > sense, because it changes the inline fsnotify hooks, the extra regression from
> > > the tip of the branch a82fd282befc7 makes no sense at all, as it does not
> > > touch any code that affects the executed functions, so I have to wonder how
> > > reliable are those results.
> > >
> > > Could you re-test the commits 94167e071109d..a82fd282befc7?
> >
> > since the branch is:
> >
> > * a82fd282befc7 (amir73il/fan_pre_content) fanotify: report file range info with pre-content events  <---
> > * f301cd18006c3 fanotify: rename a misnamed constant
> > * 64108c0b47db9 fanotify: pass optional file access range in pre-content event
> > * 94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event           <---
> > * 68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event           <--- parent of 94167e071109d
> > * 83af0c89527ab fsnotify: generate pre-content permission event on exec
> > * aca4084213276 fsnotify: generate pre-content permission event on open
> > * 93656e196b006 fsnotify: introduce pre-content permission event
> > * 1613e604df0cd (tag: v6.10-rc1,
> >
> >
> > I made below comparison, which shows little difference among 3 commits:
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
> >   94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
> >   a82fd282befc7 fanotify: report file range info with pre-content events
> >
> > 68e04c2451ba03a1 94167e071109d573a5fc1ff3061 a82fd282befc71d99106bf31066
> > ---------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \
> >  1.174e+08            -0.9%  1.163e+08            -0.5%  1.168e+08        unixbench.throughput
> >
> >
> 
> Hi Oliver,
> 
> Perhaps I am not reading the report right, but how do these numbers reconcile
> with the previous report of regression:
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
>   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> 
> commit:
>   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
>   64108c0b47db9 ("fanotify: pass optional file access range in
> pre-content event")
> 
> 94167e071109d573 64108c0b47db91b20d658a89969
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> 
> Is this a case of unstable results? something else?

you could see the data for 94167e071109d are 1.163e+08 in both table.

the data in our tests seem quite stable for a commit, such like for v6.10-rc1:
  "unixbench.throughput": [
    121545292.8,
    121629889.4,
    121598992.0,
    121492095.5,
    121645038.1,
    121556286.9
  ],

for the branch tip a82fd282befc7:
  "unixbench.throughput": [
    116675606.7,
    116840611.2,
    116738966.0,
    116956953.1,
    116704901.9,
    116997628.3,
    117141733.7,
    116660495.4
  ],


let me combine the results from this branch together:

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.10-rc1
  68e04c2451ba0 fanotify: introduce FAN_PRE_ACCESS permission event
  94167e071109d fanotify: introduce FAN_PRE_MODIFY permission event
  64108c0b47db9 fanotify: pass optional file access range in pre-content event
  a82fd282befc7 fanotify: report file range info with pre-content

       v6.10-rc1 68e04c2451ba03a18ccb1192890 94167e071109d573a5fc1ff3061 64108c0b47db91b20d658a89969 a82fd282befc71d99106bf31066
---------------- --------------------------- --------------------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \          |                \          |                \
 1.216e+08            -3.5%  1.174e+08            -4.3%  1.163e+08            -6.6%  1.135e+08            -3.9%  1.168e+08        unixbench.throughput


one thing I want to mention is the "%change" is always comparing to the first
column (v6.10-rc1 here). so 68e04c2451ba0 has a -3.5% regression comparing to
v6.10-rc1; 94167e071109d has a -4.3% regression also comparing to v6.10-rc1,
and so on.

then if just comparing 94167e071109d and 64108c0b47db9, 64108c0b47db9 has about
-2.4% regression compareing to 94167e071109d.

from above table, along the branch, the performance is kind of fluctuating,
dropped most on 64108c0b47db9, but then recovered a little on tip.

our bot will not bisect the improvment between 64108c0b47db9 and the tip, since
the whole branch show a drop.

> 
> > >
> > > > > It may have been a "tactic mistake" merging this optimization to v6.10-rc1
> > > > > a5e57b4d370c ("fsnotify: optimize the case of no permission event watchers")
> > > > > before the rest of the pre-content infrastructure, because together they
> > > > > would still be a performance win.
> > > > >
> > > > > Can you please compare this branch to v6.9?
> > > >
> > > > there is no obvious diff between v6.9 and v6.10-rc1 for this test in our tests.
> > > >
> > >
> > > This is a bit surprising to me, because a5e57b4d370c should have been a pretty
> > > big performance win for the common case.
> >
> > in our this unixbench tests, a5e57b4d370c introduce a small regression comparing
> > to its parent (477cf917dd028).
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   v6.9
> >   477cf917dd028 fsnotify: use an enum for group priority constants
> >   a5e57b4d370c6 fsnotify: optimize the case of no permission event watchers
> >   v6.10-rc1
> >
> >             v6.9 477cf917dd02853ba78a73cdeb6 a5e57b4d370c6d320e5bfb0c919                   v6.10-rc1
> > ---------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \
> >  1.219e+08            +2.8%  1.253e+08            +0.4%  1.224e+08            -0.2%  1.216e+08        unixbench.throughput
> >
> 
> Assuming this is a stable result,
> that's very small regression compared to the improvements before it
> and one that I dare to call acceptable for this micro buffered write benchmark
> because of the big gain in other workloads.

again, all data here is comparing to v6.9, so there is a 2.8% improvement on
477cf917dd028 comparing to v6.9, but it drops back on a5e57b4d370c6, whose
data is almost same with v6.9 (so +0.4% comparing to v6.9).

anyway, we normally ignore <1% performance changes, so we won't say
a5e57b4d370c6 or v6.10-rc1 has obvious performance changes comparing to v6.9.

> 
> >
> > BTW, for a5e57b4d370c, there is another regression report in
> > https://lore.kernel.org/all/202404101624.85684be8-oliver.sang@intel.com/
> > which also includes some unixbench improvement results, but different sub-tests
> > on different platform.
> >
> 
> Right. I forgot about this one.
> Sorry for dropping the ball.
> I do not know what is going on there.
> I will try to take a look again.
> 
> Thanks,
> Amir.
